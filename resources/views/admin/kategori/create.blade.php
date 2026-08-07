@extends('layouts.app')

@section('content')

<div class="pagetitle">
    <h1>Tambah Kategori</h1>
    <nav>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">Home</a></li>
            <li class="breadcrumb-item"><a href="{{ route('admin.kategori.index') }}">Kategori</a></li>
            <li class="breadcrumb-item active">Tambah</li>
        </ol>
    </nav>
</div>

<section class="section">
    <div class="row">
        <div class="col-12 col-lg-6">
            <div class="card">
                <div class="card-body">

                    <form method="POST" action="{{ route('admin.kategori.store') }}">
                        @csrf

                        <div class="mb-3">
                            <label class="form-label fw-semibold">Nama Kategori</label>
                            <input type="text" name="nama" value="{{ old('nama') }}"
                                   class="form-control @error('nama') is-invalid @enderror">
                            @error('nama')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-semibold">Poin Maksimum</label>
                            <input type="number" step="0.01" min="0" name="poin_maksimum"
                                   value="{{ old('poin_maksimum') }}"
                                   class="form-control @error('poin_maksimum') is-invalid @enderror">
                            @error('poin_maksimum')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>

                        <button type="submit" class="btn btn-primary">Simpan</button>
                        <a href="{{ route('admin.kategori.index') }}" class="btn btn-outline-secondary">Batal</a>
                    </form>

                </div>
            </div>
        </div>
    </div>
</section>

@endsection
