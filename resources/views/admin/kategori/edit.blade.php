@extends('layouts.app')

@section('content')

<div class="pagetitle">
    <h1>Ubah Kategori</h1>
    <nav>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">Home</a></li>
            <li class="breadcrumb-item"><a href="{{ route('admin.kategori.index') }}">Kategori</a></li>
            <li class="breadcrumb-item active">Ubah</li>
        </ol>
    </nav>
</div>

<section class="section">
    <div class="row">
        <div class="col-12 col-lg-6">
            <div class="card">
                <div class="card-body">

                    <form method="POST" action="{{ route('admin.kategori.update', $kategori) }}">
                        @csrf
                        @method('PUT')

                        <div class="mb-3">
                            <label class="form-label fw-semibold">Nama Kategori</label>
                            <input type="text" name="nama" value="{{ old('nama', $kategori->nama) }}"
                                   class="form-control @error('nama') is-invalid @enderror">
                            @error('nama')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-semibold">Poin Maksimum</label>
                            <input type="number" step="0.01" min="0" name="poin_maksimum"
                                   value="{{ old('poin_maksimum', $kategori->poin_maksimum) }}"
                                   class="form-control @error('poin_maksimum') is-invalid @enderror">
                            @error('poin_maksimum')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>

                        <button type="submit" class="btn btn-primary">Simpan Perubahan</button>
                        <a href="{{ route('admin.kategori.index') }}" class="btn btn-outline-secondary">Batal</a>
                    </form>

                </div>
            </div>
        </div>

        <div class="col-12 col-lg-6">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Kegiatan pada Kategori Ini</h5>
                    <table class="table table-borderless table-sm">
                        <thead>
                            <tr><th>Nama</th><th>Jml Jenis</th></tr>
                        </thead>
                        <tbody>
                            @forelse ($kategori->jenisKegiatan as $item)
                                <tr>
                                    <td>
                                        <a href="{{ route('admin.jenis-kegiatan.edit', $item) }}">{{ $item->nama }}</a>
                                    </td>
                                    <td>{{ $item->jenis()->count() }}</td>
                                </tr>
                            @empty
                                <tr><td colspan="2" class="text-muted">Belum ada kegiatan</td></tr>
                            @endforelse
                        </tbody>
                    </table>
                    <a href="{{ route('admin.jenis-kegiatan.create') }}" class="btn btn-sm btn-outline-primary">
                        <i class="bi bi-plus-lg"></i> Tambah Kegiatan
                    </a>
                </div>
            </div>
        </div>
    </div>
</section>

@endsection
