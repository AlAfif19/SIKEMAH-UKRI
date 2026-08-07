<?php

namespace App\Http\Controllers\Admin;

use App\Enums\StatusSertifikat;
use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\SetujuiSertifikatRequest;
use App\Http\Requests\Admin\TolakSertifikatRequest;
use App\Models\Notifikasi;
use App\Models\Portofolio;
use App\Models\Sertifikat;
use App\Models\SkemaPoin;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\View\View;

class ValidasiSertifikatController extends Controller
{
    public function index(Request $request): View
    {
        $status = $request->input('status', 'menunggu');

        $sertifikat = Sertifikat::query()
            ->with(['mahasiswa.pengguna', 'jenis.kegiatan.kategori'])
            ->when($status !== 'semua', function ($q) use ($status) {
                $enum = match ($status) {
                    'disetujui' => StatusSertifikat::Disetujui,
                    'ditolak' => StatusSertifikat::Ditolak,
                    default => StatusSertifikat::Menunggu,
                };
                $q->where('status', $enum);
            })
            ->when($request->filled('cari'), function ($q) use ($request) {
                $kata = $request->cari;
                $q->where(function ($sub) use ($kata) {
                    $sub->where('judul_sertifikat', 'like', "%{$kata}%")
                        ->orWhereHas('jenis', fn ($j) => $j->where('nama', 'like', "%{$kata}%"))
                        ->orWhereHas('jenis.kegiatan', fn ($j) => $j->where('nama', 'like', "%{$kata}%"))
                        ->orWhereHas('mahasiswa.pengguna', fn ($p) => $p->where('nama', 'like', "%{$kata}%"))
                        ->orWhereHas('mahasiswa', fn ($m) => $m->where('nim', 'like', "%{$kata}%"));
                });
            })
            ->latest()
            ->paginate(10)
            ->withQueryString();

        if ($request->ajax()) {
            return view('admin.validasi-sertifikat._tabel', compact('sertifikat', 'status'));
        }

        return view('admin.validasi-sertifikat.index', compact('sertifikat', 'status'));
    }

    public function show(Sertifikat $sertifikat): View
    {
        $sertifikat->load(['mahasiswa.pengguna', 'jenis.kegiatan.kategori', 'validator']);

        return view('admin.validasi-sertifikat.show', compact('sertifikat'));
    }

    public function setujui(SetujuiSertifikatRequest $request, Sertifikat $sertifikat): RedirectResponse
    {
        if ($sertifikat->status !== StatusSertifikat::Menunggu) {
            return back()->with('error', 'Pengajuan ini sudah divalidasi sebelumnya.');
        }

        $sertifikat->update([
            'status' => StatusSertifikat::Disetujui,
            'pengguna_validator_id' => auth()->id(),
            'catatan' => $request->input('catatan'),
            'poin' => $this->hitungPoin($sertifikat),
        ]);

        $this->sinkronkanPoinPortofolio($sertifikat);
        $this->kirimNotifikasi($sertifikat, 'Sertifikat Disetujui', "Pengajuan sertifikat \"{$sertifikat->judul_sertifikat}\" telah disetujui. Anda mendapat {$sertifikat->poin} poin.");

        return back()->with('success', 'Sertifikat berhasil disetujui dan poin sudah ditambahkan ke portofolio mahasiswa.');
    }

    public function tolak(TolakSertifikatRequest $request, Sertifikat $sertifikat): RedirectResponse
    {
        if ($sertifikat->status !== StatusSertifikat::Menunggu) {
            return back()->with('error', 'Pengajuan ini sudah divalidasi sebelumnya.');
        }

        $sertifikat->update([
            'status' => StatusSertifikat::Ditolak,
            'pengguna_validator_id' => auth()->id(),
            'catatan' => $request->input('catatan'),
        ]);

        $this->kirimNotifikasi($sertifikat, 'Sertifikat Ditolak', "Pengajuan sertifikat \"{$sertifikat->judul_sertifikat}\" ditolak. Catatan admin: {$request->input('catatan')}");

        return back()->with('success', 'Sertifikat berhasil ditolak.');
    }

    public function validasiMassal(Request $request): RedirectResponse
    {
        $request->validate([
            'sertifikat_id' => ['required', 'array', 'min:1'],
            'sertifikat_id.*' => ['exists:sertifikat,id'],
        ]);

        $daftar = Sertifikat::with('jenis')
            ->whereIn('id', $request->input('sertifikat_id'))
            ->where('status', StatusSertifikat::Menunggu)
            ->get();

        foreach ($daftar as $sertifikat) {
            $sertifikat->update([
                'status' => StatusSertifikat::Disetujui,
                'pengguna_validator_id' => auth()->id(),
                'poin' => $this->hitungPoin($sertifikat),
            ]);

            $this->sinkronkanPoinPortofolio($sertifikat);
            $this->kirimNotifikasi($sertifikat, 'Sertifikat Disetujui', "Pengajuan sertifikat \"{$sertifikat->judul_sertifikat}\" telah disetujui. Anda mendapat {$sertifikat->poin} poin.");
        }

        return back()->with('success', count($daftar).' pengajuan berhasil disetujui sekaligus.');
    }

    /**
     * Hitung ulang poin dari skema poin resmi (jenis_kegiatan + tingkat + peran)
     * saat disetujui — bukan sekadar memakai nilai yang tersimpan saat pengajuan,
     * supaya tetap benar walau skema poin berubah setelah mahasiswa mengajukan.
     */
    private function hitungPoin(Sertifikat $sertifikat): float
    {
        return (float) SkemaPoin::where('jenis_id', $sertifikat->jenis_id)
            ->where('tingkat', $sertifikat->tingkat)
            ->where('peran', $sertifikat->peran)
            ->value('poin') ?? 0;
    }

    private function sinkronkanPoinPortofolio(Sertifikat $sertifikat): void
    {
        $totalPoinDisetujui = Sertifikat::where('mahasiswa_id', $sertifikat->mahasiswa_id)
            ->where('status', StatusSertifikat::Disetujui)
            ->sum('poin');

        Portofolio::updateOrCreate(
            ['mahasiswa_id' => $sertifikat->mahasiswa_id],
            ['total_poin' => $totalPoinDisetujui]
        );
    }

    private function kirimNotifikasi(Sertifikat $sertifikat, string $judul, string $isi): void
    {
        Notifikasi::create([
            'pengguna_id' => $sertifikat->mahasiswa->pengguna_id,
            'judul' => $judul,
            'isi' => $isi,
            'sudah_dibaca' => false,
        ]);
    }
}
