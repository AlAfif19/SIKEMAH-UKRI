@extends('layouts.app')

@section('content')

<div class="pagetitle d-flex justify-content-between align-items-start">
    <div>
        <h1>Portofolio Saya</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{ route('user.dashboard') }}">Home</a></li>
                <li class="breadcrumb-item active">Portofolio</li>
            </ol>
        </nav>
    </div>
    <a href="{{ route('user.portofolio.cetak') }}" target="_blank" class="btn btn-outline-primary">
        <i class="bi bi-eye"></i> Lihat Rekap Portofolio
    </a>
</div>

<section class="section">
    <div class="row">
        <div class="col-12 mb-3">
            <div class="card">
                <div class="card-body text-center">
                    <h6 class="text-muted mb-1">Total Poin Portofolio</h6>
                    <h2 class="mb-0">{{ number_format($portofolio->total_poin ?? 0, 0) }}</h2>
                    <small class="text-muted">Dasar penyusunan SKPI (Surat Keterangan Pendamping Ijazah)</small>
                </div>
            </div>
        </div>

        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Kegiatan Tersertifikasi</h5>

                    <table class="table table-borderless">
                        <thead>
                            <tr>
                                <th>Nama Kegiatan</th>
                                <th>No. Sertifikat</th>
                                <th>Kategori</th>
                                <th>Jenis Kegiatan</th>
                                <th>Tingkat / Peran</th>
                                <th>Penyelenggara</th>
                                <th>Tanggal</th>
                                <th>Poin</th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse ($daftarSertifikatDisetujui as $item)
                                <tr>
                                    <td>{{ $item->judul_sertifikat }}</td>
                                    <td>{{ $item->nomor_sertifikat ?? '-' }}</td>
                                    <td>{{ $item->jenis->kegiatan->kategori->nama }}</td>
                                    <td>{{ $item->jenis->kegiatan->nama }} — {{ $item->jenis->nama }}</td>
                                    <td>{{ implode(' / ', array_filter([$item->tingkat, $item->peran])) ?: '-' }}</td>
                                    <td>{{ $item->penyelenggara_sertifikat ?? '-' }}</td>
                                    <td>{{ $item->tanggal_mulai?->format('d M Y') ?? '-' }}</td>
                                    <td>{{ number_format($item->poin, 0) }}</td>
                                </tr>
                            @empty
                                <tr>
                                    <td colspan="8" class="text-center text-muted py-4">
                                        Belum ada kegiatan yang tersertifikasi.
                                    </td>
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
