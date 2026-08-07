<?php

namespace App\Http\Controllers\Admin;

use App\Enums\StatusSertifikat;
use App\Http\Controllers\Controller;
use App\Models\JenisKegiatan;
use App\Models\Kategori;
use App\Models\Mahasiswa;
use App\Models\Sertifikat;
use App\Models\User;
use Illuminate\Support\Facades\Cache;
use Illuminate\View\View;

class DashboardController extends Controller
{
    public function index(): View
    {
        // Angka-angka statistik ini di-cache 60 detik: cukup untuk mengurangi beban
        // query COUNT() berulang setiap dashboard dibuka, tapi tetap terasa "hidup"
        // untuk admin (bukan cache permanen yang butuh invalidasi manual).
        $statistik = Cache::remember('dashboard-admin-statistik', 60, function () {
            return [
                'jumlahMahasiswa' => Mahasiswa::count(),
                'jumlahKategori' => Kategori::count(),
                'jumlahKegiatan' => JenisKegiatan::count(),
                'jumlahMenunggu' => Sertifikat::where('status', StatusSertifikat::Menunggu)->count(),
                'jumlahDisetujui' => Sertifikat::where('status', StatusSertifikat::Disetujui)->count(),
                'jumlahPengguna' => User::count(),
            ];
        });

        // Daftar "5 sertifikat terbaru" sengaja TIDAK di-cache supaya admin langsung
        // melihat pengajuan baru tanpa delay.
        $sertifikatTerbaru = Sertifikat::with(['mahasiswa.pengguna', 'jenis'])
            ->latest()
            ->limit(5)
            ->get();

        return view('admin.dashboard', $statistik + ['sertifikatTerbaru' => $sertifikatTerbaru]);
    }
}
