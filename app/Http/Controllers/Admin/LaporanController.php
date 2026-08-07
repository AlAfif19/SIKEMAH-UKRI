<?php

namespace App\Http\Controllers\Admin;

use App\Enums\StatusSertifikat;
use App\Http\Controllers\Controller;
use App\Models\Mahasiswa;
use App\Models\Sertifikat;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Facades\DB;
use Illuminate\View\View;
use Symfony\Component\HttpFoundation\StreamedResponse;

class LaporanController extends Controller
{
    public function index(): View
    {
        $jumlahStatus = [
            'menunggu' => Sertifikat::where('status', StatusSertifikat::Menunggu)->count(),
            'disetujui' => Sertifikat::where('status', StatusSertifikat::Disetujui)->count(),
            'ditolak' => Sertifikat::where('status', StatusSertifikat::Ditolak)->count(),
        ];

        $poinPerKategori = DB::table('sertifikat')
            ->join('jenis', 'jenis.id', '=', 'sertifikat.jenis_id')
            ->join('jenis_kegiatan', 'jenis_kegiatan.id', '=', 'jenis.jenis_kegiatan_id')
            ->join('kategori', 'kategori.id', '=', 'jenis_kegiatan.kategori_id')
            ->where('sertifikat.status', StatusSertifikat::Disetujui->value)
            ->select('kategori.nama', DB::raw('SUM(sertifikat.poin) as total_poin'))
            ->groupBy('kategori.nama')
            ->orderByDesc('total_poin')
            ->get();

        $topMahasiswa = Mahasiswa::query()
            ->join('pengguna', 'pengguna.id', '=', 'mahasiswa.pengguna_id')
            ->leftJoin('portofolio', 'portofolio.mahasiswa_id', '=', 'mahasiswa.id')
            ->select(
                'mahasiswa.nim',
                'pengguna.nama',
                DB::raw('COALESCE(portofolio.total_poin, 0) as total_poin')
            )
            ->orderByDesc('total_poin')
            ->limit(10)
            ->get();

        $rekapFakultas = $this->queryRekap(['mahasiswa.fakultas'])->orderByDesc('total_poin')->get();
        $rekapProdi = $this->queryRekap(['mahasiswa.prodi', 'mahasiswa.fakultas'])->orderByDesc('total_poin')->get();

        return view('admin.laporan.index', compact(
            'jumlahStatus', 'poinPerKategori', 'topMahasiswa', 'rekapFakultas', 'rekapProdi'
        ));
    }

    public function exportFakultas(): StreamedResponse
    {
        $data = $this->queryRekap(['mahasiswa.fakultas'])->orderByDesc('total_poin')->get();

        return $this->unduhCsv(
            'rekap-poin-fakultas.csv',
            ['Fakultas', 'Jumlah Mahasiswa', 'Total Poin'],
            $data,
            fn ($baris) => [$baris->fakultas, $baris->jumlah_mahasiswa, $baris->total_poin]
        );
    }

    public function exportProdi(): StreamedResponse
    {
        $data = $this->queryRekap(['mahasiswa.prodi', 'mahasiswa.fakultas'])->orderByDesc('total_poin')->get();

        return $this->unduhCsv(
            'rekap-poin-program-studi.csv',
            ['Program Studi', 'Fakultas', 'Jumlah Mahasiswa', 'Total Poin'],
            $data,
            fn ($baris) => [$baris->prodi, $baris->fakultas, $baris->jumlah_mahasiswa, $baris->total_poin]
        );
    }

    /**
     * Query dasar: jumlah mahasiswa & total poin (dari Portofolio) dikelompokkan
     * berdasarkan satu atau lebih kolom mahasiswa (fakultas/prodi). Kolom group-by
     * ikut di-select supaya bisa langsung dibaca di view maupun export CSV.
     */
    private function queryRekap(array $kolomGroupBy): Builder
    {
        return Mahasiswa::query()
            ->leftJoin('portofolio', 'portofolio.mahasiswa_id', '=', 'mahasiswa.id')
            ->select(array_merge($kolomGroupBy, [
                DB::raw('COUNT(DISTINCT mahasiswa.id) as jumlah_mahasiswa'),
                DB::raw('COALESCE(SUM(portofolio.total_poin), 0) as total_poin'),
            ]))
            ->groupBy($kolomGroupBy);
    }

    /**
     * Streaming CSV (dibuka Excel tanpa masalah) — tanpa perlu Composer package
     * export Excel tambahan.
     */
    private function unduhCsv(string $namaFile, array $header, $data, callable $pemetaBaris): StreamedResponse
    {
        return response()->streamDownload(function () use ($header, $data, $pemetaBaris) {
            $handle = fopen('php://output', 'w');
            fputcsv($handle, $header);
            foreach ($data as $baris) {
                fputcsv($handle, $pemetaBaris($baris));
            }
            fclose($handle);
        }, $namaFile, ['Content-Type' => 'text/csv']);
    }
}
