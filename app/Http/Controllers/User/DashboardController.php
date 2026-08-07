<?php

namespace App\Http\Controllers\User;

use App\Enums\StatusSertifikat;
use App\Http\Controllers\Controller;
use App\Models\Sertifikat;
use Illuminate\View\View;

class DashboardController extends Controller
{
    public function index(): View
    {
        $mahasiswa = auth()->user()->mahasiswa;

        $sertifikat = $mahasiswa
            ? Sertifikat::where('mahasiswa_id', $mahasiswa->id)->get()
            : collect();

        return view('user.dashboard', [
            'mahasiswa' => $mahasiswa,
            'totalPoin' => $mahasiswa?->portofolio?->total_poin ?? 0,
            'jumlahMenunggu' => $sertifikat->where('status', StatusSertifikat::Menunggu)->count(),
            'jumlahDisetujui' => $sertifikat->where('status', StatusSertifikat::Disetujui)->count(),
            'jumlahDitolak' => $sertifikat->where('status', StatusSertifikat::Ditolak)->count(),
            'sertifikatTerbaru' => $mahasiswa
                ? Sertifikat::with('jenis')
                    ->where('mahasiswa_id', $mahasiswa->id)
                    ->latest()
                    ->limit(5)
                    ->get()
                : collect(),
        ]);
    }
}
