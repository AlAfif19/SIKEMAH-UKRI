@extends('layouts.app')

@section('content')

<div class="pagetitle">
    <h1>Laporan</h1>
    <nav>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">Home</a></li>
            <li class="breadcrumb-item active">Laporan</li>
        </ol>
    </nav>
</div>

<section class="section">
    <div class="row">
        <div class="col-12 col-md-4">
            <div class="card">
                <div class="card-body text-center">
                    <h6 class="text-muted">Menunggu Validasi</h6>
                    <h3>{{ $jumlahStatus['menunggu'] }}</h3>
                </div>
            </div>
        </div>
        <div class="col-12 col-md-4">
            <div class="card">
                <div class="card-body text-center">
                    <h6 class="text-muted">Disetujui</h6>
                    <h3>{{ $jumlahStatus['disetujui'] }}</h3>
                </div>
            </div>
        </div>
        <div class="col-12 col-md-4">
            <div class="card">
                <div class="card-body text-center">
                    <h6 class="text-muted">Ditolak</h6>
                    <h3>{{ $jumlahStatus['ditolak'] }}</h3>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-12 col-lg-6">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Poin Disetujui per Kategori</h5>
                    <div id="chartKategori" style="min-height: 320px;"></div>
                </div>
            </div>
        </div>

        <div class="col-12 col-lg-6">
            <div class="card">
                <div class="card-body">
                    <div class="d-flex justify-content-between align-items-center mb-2">
                        <h5 class="card-title mb-0">Top 10 Mahasiswa</h5>
                    </div>
                    <table class="table table-borderless table-sm">
                        <thead>
                            <tr><th>#</th><th>Nama</th><th>NIM</th><th>Poin</th></tr>
                        </thead>
                        <tbody>
                            @forelse ($topMahasiswa as $index => $item)
                                <tr>
                                    <td>{{ $index + 1 }}</td>
                                    <td>{{ $item->nama }}</td>
                                    <td>{{ $item->nim }}</td>
                                    <td>{{ number_format($item->total_poin, 0) }}</td>
                                </tr>
                            @empty
                                <tr><td colspan="4" class="text-muted text-center py-3">Belum ada data</td></tr>
                            @endforelse
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-12 col-lg-6">
            <div class="card">
                <div class="card-body">
                    <div class="d-flex justify-content-between align-items-center mb-2">
                        <h5 class="card-title mb-0">Rekap Poin per Fakultas</h5>
                        <a href="{{ route('admin.laporan.export.fakultas') }}" class="btn btn-sm btn-outline-success">
                            <i class="bi bi-file-earmark-spreadsheet"></i> Export Excel
                        </a>
                    </div>
                    <table class="table table-borderless table-sm">
                        <thead>
                            <tr><th>Fakultas</th><th>Jml Mahasiswa</th><th>Total Poin</th></tr>
                        </thead>
                        <tbody>
                            @forelse ($rekapFakultas as $item)
                                <tr>
                                    <td>{{ $item->fakultas }}</td>
                                    <td>{{ $item->jumlah_mahasiswa }}</td>
                                    <td>{{ number_format($item->total_poin, 0) }}</td>
                                </tr>
                            @empty
                                <tr><td colspan="3" class="text-muted text-center py-3">Belum ada data</td></tr>
                            @endforelse
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <div class="col-12 col-lg-6">
            <div class="card">
                <div class="card-body">
                    <div class="d-flex justify-content-between align-items-center mb-2">
                        <h5 class="card-title mb-0">Rekap Poin per Program Studi</h5>
                        <a href="{{ route('admin.laporan.export.prodi') }}" class="btn btn-sm btn-outline-success">
                            <i class="bi bi-file-earmark-spreadsheet"></i> Export Excel
                        </a>
                    </div>
                    <table class="table table-borderless table-sm">
                        <thead>
                            <tr><th>Prodi</th><th>Fakultas</th><th>Jml Mahasiswa</th><th>Total Poin</th></tr>
                        </thead>
                        <tbody>
                            @forelse ($rekapProdi as $item)
                                <tr>
                                    <td>{{ $item->prodi }}</td>
                                    <td>{{ $item->fakultas }}</td>
                                    <td>{{ $item->jumlah_mahasiswa }}</td>
                                    <td>{{ number_format($item->total_poin, 0) }}</td>
                                </tr>
                            @empty
                                <tr><td colspan="4" class="text-muted text-center py-3">Belum ada data</td></tr>
                            @endforelse
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <div class="d-flex justify-content-between align-items-center">
                        <div>
                            <h5 class="card-title mb-1">Laporan Validasi Lengkap</h5>
                            <p class="text-muted small mb-0">
                                Daftar seluruh pengajuan sertifikat (semua status) tersedia di halaman Riwayat Validasi.
                            </p>
                        </div>
                        <a href="{{ route('admin.validasi-sertifikat.index', ['status' => 'semua']) }}"
                           class="btn btn-outline-primary">
                            <i class="bi bi-list-check"></i> Lihat Riwayat Validasi
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

@push('scripts')
<script>
document.addEventListener("DOMContentLoaded", () => {
    echarts.init(document.querySelector("#chartKategori")).setOption({
        tooltip: { trigger: 'axis' },
        grid: { left: '3%', right: '4%', bottom: '3%', containLabel: true },
        xAxis: {
            type: 'category',
            data: @json($poinPerKategori->pluck('nama')),
        },
        yAxis: { type: 'value' },
        series: [{
            name: 'Total Poin',
            type: 'bar',
            data: @json($poinPerKategori->pluck('total_poin')),
        }]
    });
});
</script>
@endpush

@endsection