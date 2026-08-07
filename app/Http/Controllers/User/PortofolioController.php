<?php

namespace App\Http\Controllers\User;

use App\Enums\StatusSertifikat;
use App\Http\Controllers\Controller;
use App\Models\Kategori;
use App\Models\Portofolio;
use Illuminate\View\View;

class PortofolioController extends Controller
{
    /**
     * Halaman "Perolehan Poin" — rincian poin yang sudah didapat per kategori,
     * dibandingkan dengan poin maksimum kategori tersebut.
     */
    public function poin(): View
    {
        $mahasiswa = auth()->user()->mahasiswa;

        $rincianKategori = Kategori::orderBy('nama')->get()->map(function ($kategori) use ($mahasiswa) {
            $poinDiperoleh = $mahasiswa
                ? $mahasiswa->sertifikat()
                    ->where('status', StatusSertifikat::Disetujui)
                    ->whereHas('jenis.kegiatan', fn ($q) => $q->where('kategori_id', $kategori->id))
                    ->sum('poin')
                : 0;

            return [
                'kategori' => $kategori,
                'poin_diperoleh' => $poinDiperoleh,
                'persentase' => $kategori->poin_maksimum > 0
                    ? min(100, round(($poinDiperoleh / $kategori->poin_maksimum) * 100))
                    : 0,
            ];
        });

        $totalPoin = $rincianKategori->sum('poin_diperoleh');

        return view('user.portofolio.poin', compact('rincianKategori', 'totalPoin'));
    }

    /**
     * Halaman "Portofolio" — ringkasan total poin dan daftar seluruh kegiatan
     * yang sertifikatnya sudah disetujui (dasar penyusunan SKPI).
     */
    public function index(): View
    {
        [$portofolio, $daftarSertifikatDisetujui] = $this->dataPortofolio();

        return view('user.portofolio.index', compact('portofolio', 'daftarSertifikatDisetujui'));
    }

    /**
     * Halaman cetak — tampilan bersih tanpa sidebar/navbar, dicetak lewat
     * fitur "Print to PDF" bawaan browser (tanpa perlu library PDF baru di server).
     * Berfungsi sekaligus sebagai rekap SKPI sederhana.
     */
    public function cetak(): View
    {
        $mahasiswa = auth()->user()->mahasiswa;
        [$portofolio, $daftarSertifikatDisetujui] = $this->dataPortofolio();

        return view('user.portofolio.cetak', [
            'mahasiswa' => $mahasiswa,
            'portofolio' => $portofolio,
            'daftarSertifikatDisetujui' => $daftarSertifikatDisetujui,
        ]);
    }

    private function dataPortofolio(): array
    {
        $mahasiswa = auth()->user()->mahasiswa;

        $portofolio = $mahasiswa ? Portofolio::where('mahasiswa_id', $mahasiswa->id)->first() : null;

        $daftarSertifikatDisetujui = $mahasiswa
            ? $mahasiswa->sertifikat()
                ->with('jenis.kegiatan.kategori')
                ->where('status', StatusSertifikat::Disetujui)
                ->latest()
                ->get()
            : collect();

        return [$portofolio, $daftarSertifikatDisetujui];
    }
}
