<?php

namespace App\Http\Controllers\Admin;

use App\Enums\StatusSertifikat;
use App\Http\Controllers\Controller;
use App\Models\Mahasiswa;
use App\Services\DataMasterClient;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\View\View;

class PortofolioMahasiswaController extends Controller
{
    public function index(Request $request): View
    {
        $mahasiswa = Mahasiswa::query()
            ->with(['pengguna', 'portofolio'])
            ->when($request->filled('cari'), function ($q) use ($request) {
                $kata = $request->cari;
                $q->where('nim', 'like', "%{$kata}%")
                    ->orWhereHas('pengguna', fn ($p) => $p->where('nama', 'like', "%{$kata}%"));
            })
            ->orderBy('nim')
            ->paginate(15)
            ->withQueryString();

        if ($request->ajax()) {
            return view('admin.portofolio-mahasiswa._tabel', compact('mahasiswa'));
        }

        return view('admin.portofolio-mahasiswa.index', compact('mahasiswa'));
    }

    public function sinkronDataMaster(Mahasiswa $mahasiswa, DataMasterClient $client): RedirectResponse
    {
        if (! $client->aktif()) {
            return back()->with('error', 'Integrasi Data Master belum aktif. Lengkapi konfigurasi di .env terlebih dahulu.');
        }

        $data = $client->ambilDataMahasiswa($mahasiswa->nim);

        if (! $data) {
            return back()->with('error', "Gagal mengambil data untuk NIM {$mahasiswa->nim} dari Data Master.");
        }

        $mahasiswa->update([
            'prodi' => $data['prodi'] ?? $mahasiswa->prodi,
            'fakultas' => $data['fakultas'] ?? $mahasiswa->fakultas,
            'angkatan' => $data['angkatan'] ?? $mahasiswa->angkatan,
            'sinkron_data_master_pada' => now(),
        ]);

        return back()->with('success', "Data {$mahasiswa->nim} berhasil disinkron dari Data Master.");
    }

    public function show(Mahasiswa $mahasiswa): View
    {
        $mahasiswa->load('pengguna', 'portofolio');

        $portofolio = $mahasiswa->portofolio;

        $daftarSertifikatDisetujui = $mahasiswa->sertifikat()
            ->with('jenis.kegiatan.kategori')
            ->where('status', StatusSertifikat::Disetujui)
            ->latest()
            ->get();

        // Sengaja memakai view yang sama dengan halaman cetak portofolio milik
        // mahasiswa, supaya tampilannya identik dari sisi admin maupun mahasiswa.
        return view('user.portofolio.cetak', [
            'mahasiswa' => $mahasiswa,
            'portofolio' => $portofolio,
            'daftarSertifikatDisetujui' => $daftarSertifikatDisetujui,
            'modeAdmin' => true,
        ]);
    }
}
