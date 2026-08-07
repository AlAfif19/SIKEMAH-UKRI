@extends('layouts.app')

@section('content')

<div class="pagetitle">
    <h1>Detail Pengajuan Sertifikat</h1>
    <nav>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">Home</a></li>
            <li class="breadcrumb-item"><a href="{{ route('admin.validasi-sertifikat.index') }}">Validasi Sertifikat</a></li>
            <li class="breadcrumb-item active">Detail</li>
        </ol>
    </nav>
</div>

<section class="section">
    <div class="row">
        <div class="col-12 col-lg-5">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Informasi Pengajuan</h5>
                    <table class="table table-borderless table-sm">
                        <tr><th>Mahasiswa</th><td>{{ $sertifikat->mahasiswa->pengguna->nama }}</td></tr>
                        <tr><th>NIM</th><td>{{ $sertifikat->mahasiswa->nim }}</td></tr>
                        <tr><th>Prodi</th><td>{{ $sertifikat->mahasiswa->prodi }}</td></tr>
                        <tr><th>Kategori</th><td>{{ $sertifikat->jenis->kegiatan->kategori->nama }}</td></tr>
                        <tr><th>Kegiatan</th><td>{{ $sertifikat->jenis->kegiatan->nama }}</td></tr>
                        <tr><th>Jenis</th><td>{{ $sertifikat->jenis->nama }}</td></tr>
                        <tr><th>Nama Kegiatan</th><td>{{ $sertifikat->judul_sertifikat }}</td></tr>
                        <tr><th>No. Sertifikat</th><td>{{ $sertifikat->nomor_sertifikat ?? '-' }}</td></tr>
                        <tr><th>Penyelenggara</th><td>{{ $sertifikat->penyelenggara_sertifikat ?? '-' }}</td></tr>
                        <tr><th>Tempat Pelaksanaan</th><td>{{ $sertifikat->tempat_pelaksanaan ?? '-' }}</td></tr>
                        <tr><th>Tanggal</th>
                            <td>
                                @if ($sertifikat->tanggal_mulai)
                                    {{ $sertifikat->tanggal_mulai->format('d M Y') }}
                                    @if ($sertifikat->tanggal_selesai && ! $sertifikat->tanggal_selesai->equalTo($sertifikat->tanggal_mulai))
                                        — {{ $sertifikat->tanggal_selesai->format('d M Y') }}
                                    @endif
                                @else
                                    -
                                @endif
                            </td>
                        </tr>
                        <tr><th>Deskripsi</th><td>{{ $sertifikat->deskripsi_kegiatan ?? '-' }}</td></tr>
                        <tr><th>Tingkat / Peran</th><td>{{ implode(' / ', array_filter([$sertifikat->tingkat, $sertifikat->peran])) ?: '-' }}</td></tr>
                        <tr><th>Poin</th><td>{{ number_format($sertifikat->poin, 0) }}</td></tr>
                        <tr><th>Diajukan</th><td>{{ $sertifikat->created_at->format('d M Y, H:i') }}</td></tr>
                        <tr>
                            <th>Status</th>
                            <td><span class="badge {{ $sertifikat->status->badgeClass() }}">{{ $sertifikat->status->label() }}</span></td>
                        </tr>
                        @if ($sertifikat->status !== \App\Enums\StatusSertifikat::Menunggu)
                            <tr><th>Divalidasi Oleh</th><td>{{ $sertifikat->validator->nama ?? '-' }}</td></tr>
                            <tr><th>Catatan</th><td>{{ $sertifikat->catatan ?: '-' }}</td></tr>
                        @endif
                    </table>
                </div>
            </div>

            @if ($sertifikat->status === \App\Enums\StatusSertifikat::Menunggu)
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Setujui Pengajuan</h5>
                        <form method="POST" action="{{ route('admin.validasi-sertifikat.setujui', $sertifikat) }}">
                            @csrf
                            <div class="mb-2">
                                <label class="form-label small">Catatan (opsional)</label>
                                <textarea name="catatan" class="form-control" rows="2"></textarea>
                            </div>
                            <button type="submit" class="btn btn-success w-100"
                                    onclick="return confirm('Setujui pengajuan ini? Poin akan langsung ditambahkan ke portofolio mahasiswa.');">
                                <i class="bi bi-check-lg"></i> Setujui
                            </button>
                        </form>
                    </div>
                </div>

                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Tolak Pengajuan</h5>
                        <form method="POST" action="{{ route('admin.validasi-sertifikat.tolak', $sertifikat) }}">
                            @csrf
                            <div class="mb-2">
                                <label class="form-label small">Alasan Penolakan <span class="text-danger">*</span></label>
                                <textarea name="catatan" class="form-control @error('catatan') is-invalid @enderror" rows="2"></textarea>
                                @error('catatan')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>
                            <button type="submit" class="btn btn-danger w-100"
                                    onclick="return confirm('Tolak pengajuan ini?');">
                                <i class="bi bi-x-lg"></i> Tolak
                            </button>
                        </form>
                    </div>
                </div>
            @endif
        </div>

        <div class="col-12 col-lg-7">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Preview Berkas</h5>

                    @php
                        $ekstensi = strtolower(pathinfo($sertifikat->berkas, PATHINFO_EXTENSION));
                        $urlBerkas = asset('storage/'.$sertifikat->berkas);
                    @endphp

                    @if (in_array($ekstensi, ['jpg', 'jpeg', 'png']))
                        <img src="{{ $urlBerkas }}" class="img-fluid rounded border" alt="Preview sertifikat" loading="lazy">
                    @elseif ($ekstensi === 'pdf')
                        <embed src="{{ $urlBerkas }}" type="application/pdf" width="100%" height="600px">
                    @endif

                    <div class="mt-2">
                        <a href="{{ $urlBerkas }}" target="_blank" class="btn btn-sm btn-outline-secondary">
                            <i class="bi bi-box-arrow-up-right"></i> Buka di Tab Baru
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

@endsection
