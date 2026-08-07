@extends('layouts.app')

@section('content')

<div class="pagetitle">
    <h1>Dashboard Admin</h1>
    <nav>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">Home</a></li>
            <li class="breadcrumb-item active">Dashboard</li>
        </ol>
    </nav>
</div>

<section class="section dashboard">

    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <div class="d-flex justify-content-between align-items-center">
                        <div>
                            <h4 class="mt-3 fw-bold">Selamat Datang, {{ auth()->user()->nama }}</h4>
                            <p class="text-muted mb-0">
                                SIKEMAH — Sistem Informasi Kegiatan Mahasiswa UKRI.
                                Kelola validasi sertifikat, poin kegiatan, dan portofolio mahasiswa.
                            </p>
                        </div>
                        <div class="d-none d-md-block">
                            <i class="bi bi-mortarboard" style="font-size:70px;color:#4154f1;"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row">

        <div class="col-12 col-sm-6 col-xxl-3">
            <div class="card info-card sales-card">
                <div class="card-body">
                    <h5 class="card-title">Mahasiswa</h5>
                    <div class="d-flex align-items-center">
                        <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                            <i class="bi bi-people"></i>
                        </div>
                        <div class="ps-3">
                            <h6>{{ $jumlahMahasiswa }}</h6>
                            <span class="text-muted small">Terdaftar</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-12 col-sm-6 col-xxl-3">
            <div class="card info-card revenue-card">
                <div class="card-body">
                    <h5 class="card-title">Menunggu Validasi</h5>
                    <div class="d-flex align-items-center">
                        <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                            <i class="bi bi-hourglass-split"></i>
                        </div>
                        <div class="ps-3">
                            <h6>{{ $jumlahMenunggu }}</h6>
                            <span class="text-muted small">Pengajuan Pending</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-12 col-sm-6 col-xxl-3">
            <div class="card info-card customers-card">
                <div class="card-body">
                    <h5 class="card-title">Disetujui</h5>
                    <div class="d-flex align-items-center">
                        <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                            <i class="bi bi-patch-check"></i>
                        </div>
                        <div class="ps-3">
                            <h6>{{ $jumlahDisetujui }}</h6>
                            <span class="text-muted small">Sertifikat Valid</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-12 col-sm-6 col-xxl-3">
            <div class="card info-card customers-card">
                <div class="card-body">
                    <h5 class="card-title">Jenis Kegiatan</h5>
                    <div class="d-flex align-items-center">
                        <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                            <i class="bi bi-calendar-event"></i>
                        </div>
                        <div class="ps-3">
                            <h6>{{ $jumlahKegiatan }}</h6>
                            <span class="text-muted small">{{ $jumlahKategori }} Kategori</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <div class="row">

        <div class="col-12 col-lg-8">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Statistik Validasi</h5>
                    <div id="validationChart" style="min-height: 350px;" class="echart"></div>
                </div>
            </div>
        </div>

        <div class="col-12 col-lg-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Akses Cepat</h5>
                    <div class="d-grid gap-2">
                        <a href="{{ route('admin.validasi-sertifikat.index', ['status' => 'menunggu']) }}" class="btn btn-primary"><i class="bi bi-patch-check"></i> Validasi Sertifikat</a>
                        <a href="{{ route('admin.laporan.index') }}" class="btn btn-success"><i class="bi bi-bar-chart"></i> Laporan</a>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <div class="row">
        <div class="col-12">
            <div class="card recent-sales overflow-auto">
                <div class="card-body">
                    <h5 class="card-title">Pengajuan Terbaru</h5>
                    <table class="table table-borderless datatable">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Mahasiswa</th>
                                <th>Nama Kegiatan</th>
                                <th>Status</th>
                                <th>Tanggal</th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse ($sertifikatTerbaru as $sertifikat)
                                <tr>
                                    <td>{{ $sertifikat->id }}</td>
                                    <td>{{ $sertifikat->mahasiswa->pengguna->nama ?? '-' }}</td>
                                    <td>{{ $sertifikat->judul_sertifikat ?? '-' }}</td>
                                    <td>
                                        <span class="badge {{ $sertifikat->status->badgeClass() }}">
                                            {{ $sertifikat->status->label() }}
                                        </span>
                                    </td>
                                    <td>{{ $sertifikat->created_at->diffForHumans() }}</td>
                                </tr>
                            @empty
                                <tr>
                                    <td colspan="5" class="text-center text-muted">Belum ada pengajuan</td>
                                </tr>
                            @endforelse
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

</section>

@endsection

@push('scripts')
<script>
document.addEventListener("DOMContentLoaded", () => {
    echarts.init(document.querySelector("#validationChart")).setOption({
        tooltip: { trigger: 'item' },
        legend: { top: '5%', left: 'center' },
        series: [{
            name: 'Validasi',
            type: 'pie',
            radius: ['40%', '70%'],
            data: [
                { value: {{ $jumlahDisetujui }}, name: 'Disetujui' },
                { value: {{ $jumlahMenunggu }}, name: 'Menunggu' },
            ]
        }]
    });
});
</script>
@endpush
