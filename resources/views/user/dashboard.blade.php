@extends('layouts.app')

@section('content')

<div class="pagetitle">
    <h1>Dashboard Mahasiswa</h1>
    <nav>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{ route('user.dashboard') }}">Home</a></li>
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
                            @if ($mahasiswa)
                                <p class="text-muted mb-0">
                                    NIM {{ $mahasiswa->nim }} · {{ $mahasiswa->prodi }} · Angkatan {{ $mahasiswa->angkatan }}
                                </p>
                            @else
                                <p class="text-muted mb-0">Profil mahasiswa belum lengkap.</p>
                            @endif
                        </div>
                        <div class="d-none d-md-block">
                            <i class="bi bi-person-badge" style="font-size:70px;color:#4154f1;"></i>
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
                    <h5 class="card-title">Total Poin</h5>
                    <div class="d-flex align-items-center">
                        <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                            <i class="bi bi-star"></i>
                        </div>
                        <div class="ps-3">
                            <h6>{{ number_format($totalPoin, 0) }}</h6>
                            <span class="text-muted small">Poin Portofolio</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-12 col-sm-6 col-xxl-3">
            <div class="card info-card revenue-card">
                <div class="card-body">
                    <h5 class="card-title">Menunggu</h5>
                    <div class="d-flex align-items-center">
                        <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                            <i class="bi bi-hourglass-split"></i>
                        </div>
                        <div class="ps-3">
                            <h6>{{ $jumlahMenunggu }}</h6>
                            <span class="text-muted small">Validasi Pending</span>
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
                    <h5 class="card-title">Ditolak</h5>
                    <div class="d-flex align-items-center">
                        <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                            <i class="bi bi-x-circle"></i>
                        </div>
                        <div class="ps-3">
                            <h6>{{ $jumlahDitolak }}</h6>
                            <span class="text-muted small">Perlu Revisi</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <div class="row">

        <div class="col-12 col-lg-8">
            <div class="card recent-sales overflow-auto">
                <div class="card-body">
                    <h5 class="card-title">Riwayat Pengajuan Terbaru</h5>
                    <table class="table table-borderless">
                        <thead>
                            <tr>
                                <th>Kegiatan</th>
                                <th>Status</th>
                                <th>Poin</th>
                                <th>Tanggal</th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse ($sertifikatTerbaru as $sertifikat)
                                <tr>
                                    <td>{{ $sertifikat->judul_sertifikat ?? '-' }}</td>
                                    <td>
                                        <span class="badge {{ $sertifikat->status->badgeClass() }}">
                                            {{ $sertifikat->status->label() }}
                                        </span>
                                    </td>
                                    <td>{{ $sertifikat->poin > 0 ? $sertifikat->poin : '-' }}</td>
                                    <td>{{ $sertifikat->created_at->format('d M Y') }}</td>
                                </tr>
                            @empty
                                <tr>
                                    <td colspan="4" class="text-center text-muted py-4">
                                        <i class="bi bi-inbox d-block mb-2" style="font-size:2rem;"></i>
                                        Belum ada pengajuan sertifikat
                                    </td>
                                </tr>
                            @endforelse
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <div class="col-12 col-lg-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Akses Cepat</h5>
                    <div class="d-grid gap-2">
                        <a href="{{ route('user.sertifikat.create') }}" class="btn btn-primary"><i class="bi bi-cloud-upload"></i> Upload Sertifikat</a>
                        <a href="{{ route('user.portofolio') }}" class="btn btn-success"><i class="bi bi-briefcase"></i> Lihat Portofolio</a>
                        <a href="{{ route('user.portofolio.cetak') }}" target="_blank" class="btn btn-outline-secondary"><i class="bi bi-download"></i> Download Portofolio</a>
                    </div>
                </div>
            </div>

            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Alur Pengajuan</h5>
                    <ol class="small text-muted mb-0 ps-3">
                        <li class="mb-2">Upload sertifikat & pilih jenis kegiatan</li>
                        <li class="mb-2">Isi data kegiatan & upload bukti</li>
                        <li class="mb-2">Menunggu validasi admin</li>
                        <li class="mb-2">Poin bertambah jika disetujui</li>
                        <li>Masuk portofolio & siap SKPI</li>
                    </ol>
                </div>
            </div>
        </div>

    </div>

</section>

@endsection
