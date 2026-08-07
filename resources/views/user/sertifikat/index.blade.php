@extends('layouts.app')

@section('content')

<div class="pagetitle">
    <h1>Riwayat Pengajuan</h1>
    <nav>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{ route('user.dashboard') }}">Home</a></li>
            <li class="breadcrumb-item active">Riwayat Pengajuan</li>
        </ol>
    </nav>
</div>

<section class="section">
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body">

                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <h5 class="card-title mb-0">Daftar Pengajuan Sertifikat</h5>
                        <a href="{{ route('user.sertifikat.create') }}" class="btn btn-primary">
                            <i class="bi bi-cloud-upload"></i> Ajukan Sertifikat
                        </a>
                    </div>

                    <table class="table table-borderless">
                        <thead>
                            <tr>
                                <th>Nama Kegiatan</th>
                                <th>Kategori / Jenis</th>
                                <th>Tingkat / Peran</th>
                                <th>Poin</th>
                                <th>Status</th>
                                <th>Berkas</th>
                                <th class="text-end">Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse ($sertifikat as $item)
                                <tr>
                                    <td>{{ $item->judul_sertifikat }}</td>
                                    <td>
                                        {{ $item->jenis->kegiatan->kategori->nama }}<br>
                                        <small class="text-muted">{{ $item->jenis->kegiatan->nama }} — {{ $item->jenis->nama }}</small>
                                    </td>
                                    <td>{{ implode(' / ', array_filter([$item->tingkat, $item->peran])) ?: '-' }}</td>
                                    <td>{{ number_format($item->poin, 0) }}</td>
                                    <td>
                                        <span class="badge {{ $item->status->badgeClass() }}">
                                            {{ $item->status->label() }}
                                        </span>
                                        @if ($item->status !== \App\Enums\StatusSertifikat::Menunggu && $item->catatan)
                                            <div class="text-muted small mt-1">{{ $item->catatan }}</div>
                                        @endif
                                    </td>
                                    <td>
                                        <a href="{{ asset('storage/'.$item->berkas) }}" target="_blank"
                                           class="btn btn-sm btn-outline-secondary">
                                            <i class="bi bi-eye"></i> Lihat
                                        </a>
                                    </td>
                                    <td class="text-end">
                                        @if ($item->status === \App\Enums\StatusSertifikat::Menunggu)
                                            <form action="{{ route('user.sertifikat.destroy', $item) }}"
                                                  method="POST" class="d-inline"
                                                  onsubmit="return confirm('Batalkan pengajuan ini?');">
                                                @csrf
                                                @method('DELETE')
                                                <button type="submit" class="btn btn-sm btn-outline-danger">
                                                    <i class="bi bi-x-circle"></i> Batalkan
                                                </button>
                                            </form>
                                        @elseif ($item->status === \App\Enums\StatusSertifikat::Ditolak)
                                            <a href="{{ route('user.sertifikat.create', ['jenis_kegiatan_id' => $item->jenis->jenis_kegiatan_id]) }}"
                                               class="btn btn-sm btn-outline-primary">
                                                <i class="bi bi-arrow-repeat"></i> Ajukan Ulang
                                            </a>
                                        @else
                                            <span class="text-muted small">—</span>
                                        @endif
                                    </td>
                                </tr>
                            @empty
                                <tr>
                                    <td colspan="7" class="text-center text-muted py-4">
                                        Belum ada pengajuan sertifikat.
                                    </td>
                                </tr>
                            @endforelse
                        </tbody>
                    </table>

                    {{ $sertifikat->links() }}

                </div>
            </div>
        </div>
    </div>
</section>

@endsection
