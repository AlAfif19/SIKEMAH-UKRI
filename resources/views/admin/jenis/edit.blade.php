@extends('layouts.app')

@section('content')

<div class="pagetitle">
    <h1>Kelola Jenis</h1>
    <nav>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">Home</a></li>
            <li class="breadcrumb-item"><a href="{{ route('admin.jenis-kegiatan.index') }}">Kegiatan</a></li>
            <li class="breadcrumb-item"><a href="{{ route('admin.jenis-kegiatan.edit', $jenis->jenis_kegiatan_id) }}">{{ $jenis->kegiatan->nama }}</a></li>
            <li class="breadcrumb-item active">{{ $jenis->nama }}</li>
        </ol>
    </nav>
</div>

<section class="section">
    <div class="row">
        <div class="col-12 col-lg-5">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Nama Jenis</h5>
                    <p class="text-muted small">
                        Kategori: {{ $jenis->kegiatan->kategori->nama }} &raquo; Kegiatan: {{ $jenis->kegiatan->nama }}
                    </p>

                    <form method="POST" action="{{ route('admin.jenis.update', $jenis) }}">
                        @csrf
                        @method('PUT')

                        <div class="mb-3">
                            <label class="form-label fw-semibold">Nama Jenis</label>
                            <input type="text" name="nama" value="{{ old('nama', $jenis->nama) }}"
                                   class="form-control @error('nama') is-invalid @enderror">
                            @error('nama')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>

                        <button type="submit" class="btn btn-primary">Simpan</button>
                        <a href="{{ route('admin.jenis-kegiatan.edit', $jenis->jenis_kegiatan_id) }}" class="btn btn-outline-secondary">Kembali</a>
                    </form>
                </div>
            </div>
        </div>

        <div class="col-12 col-lg-7">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Skema Poin (Tingkat / Peran &rarr; Poin)</h5>
                    <p class="text-muted small">
                        Isi minimal salah satu: Tingkat atau Peran. Kosongkan yang tidak relevan untuk jenis ini.
                    </p>

                    <table class="table table-borderless table-sm">
                        <thead>
                            <tr><th>Tingkat</th><th>Peran</th><th>Poin</th><th></th></tr>
                        </thead>
                        <tbody>
                            @forelse ($jenis->skemaPoin as $skema)
                                <tr>
                                    <td>{{ $skema->tingkat ?? '-' }}</td>
                                    <td>{{ $skema->peran ?? '-' }}</td>
                                    <td>{{ number_format($skema->poin, 0) }}</td>
                                    <td class="text-end">
                                        <form action="{{ route('admin.jenis.skema-poin.destroy', [$jenis, $skema]) }}"
                                              method="POST"
                                              data-confirm="Hapus skema poin ini?"
                                              data-confirm-title="Hapus Skema Poin"
                                              data-confirm-tombol="Ya, Hapus"
                                              data-confirm-tipe="danger">
                                            @csrf
                                            @method('DELETE')
                                            <button type="submit" class="btn btn-sm btn-outline-danger">
                                                <i class="bi bi-trash"></i>
                                            </button>
                                        </form>
                                    </td>
                                </tr>
                            @empty
                                <tr><td colspan="4" class="text-muted">Belum ada skema poin</td></tr>
                            @endforelse
                        </tbody>
                    </table>

                    <hr>

                    <form method="POST" action="{{ route('admin.jenis.skema-poin.store', $jenis) }}"
                          class="row g-2 align-items-end">
                        @csrf
                        <div class="col-6 col-sm-4">
                            <label class="form-label small">Tingkat</label>
                            <input type="text" name="tingkat" class="form-control form-control-sm"
                                   placeholder="misal: Internasional">
                        </div>
                        <div class="col-6 col-sm-4">
                            <label class="form-label small">Peran</label>
                            <input type="text" name="peran" class="form-control form-control-sm"
                                   placeholder="misal: Peserta">
                        </div>
                        <div class="col-8 col-sm-3">
                            <label class="form-label small">Poin</label>
                            <input type="number" step="0.01" min="0" name="poin" class="form-control form-control-sm" required>
                        </div>
                        <div class="col-4 col-sm-1">
                            <button type="submit" class="btn btn-sm btn-primary w-100">
                                <i class="bi bi-plus-lg"></i>
                            </button>
                        </div>
                    </form>
                    @error('tingkat')
                        <div class="text-danger small mt-1">{{ $message }}</div>
                    @enderror
                    @error('poin')
                        <div class="text-danger small mt-1">{{ $message }}</div>
                    @enderror
                </div>
            </div>
        </div>
    </div>
</section>

@endsection
