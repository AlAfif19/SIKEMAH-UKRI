@extends('layouts.app')

@section('content')

<div class="pagetitle">
    <h1>Tambah Kegiatan</h1>
    <nav>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">Home</a></li>
            <li class="breadcrumb-item"><a href="{{ route('admin.jenis-kegiatan.index') }}">Kegiatan</a></li>
            <li class="breadcrumb-item active">Tambah</li>
        </ol>
    </nav>
</div>

<section class="section">
    <div class="row">
        <div class="col-12 col-lg-7">
            <div class="card">
                <div class="card-body">

                    <form method="POST" action="{{ route('admin.jenis-kegiatan.store') }}">
                        @csrf

                        <div class="mb-3">
                            <label class="form-label fw-semibold">Kategori</label>
                            <select name="kategori_id" class="form-select @error('kategori_id') is-invalid @enderror">
                                <option value="">-- Pilih Kategori --</option>
                                @foreach ($daftarKategori as $opsi)
                                    <option value="{{ $opsi->id }}" @selected(old('kategori_id') == $opsi->id)>
                                        {{ $opsi->nama }}
                                    </option>
                                @endforeach
                            </select>
                            @error('kategori_id')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-semibold">Nama Kegiatan</label>
                            <input type="text" name="nama" value="{{ old('nama') }}"
                                   placeholder="misal: Upacara Bendera"
                                   class="form-control @error('nama') is-invalid @enderror">
                            @error('nama')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-semibold">Dokumen yang Diperlukan</label>
                            <input type="text" name="dokumen" value="{{ old('dokumen') }}"
                                   placeholder="misal: Sertifikat, SK Kepanitiaan"
                                   class="form-control @error('dokumen') is-invalid @enderror">
                            @error('dokumen')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>

                        <div class="row">
                            <div class="col-12 col-md-6 mb-3">
                                <label class="form-label fw-semibold">Periode Penilaian</label>
                                <input type="text" name="periode_penilaian" value="{{ old('periode_penilaian') }}"
                                       placeholder="misal: Tiap Kegiatan"
                                       class="form-control @error('periode_penilaian') is-invalid @enderror">
                                @error('periode_penilaian')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>
                            <div class="col-12 col-md-6 mb-3">
                                <label class="form-label fw-semibold">Penilai</label>
                                <input type="text" name="penilai" value="{{ old('penilai') }}"
                                       placeholder="misal: Wakil Dekan Bid. Kemahasiswaan"
                                       class="form-control @error('penilai') is-invalid @enderror">
                                @error('penilai')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>
                        </div>

                        <button type="submit" class="btn btn-primary">Simpan & Lanjut Atur Skema Poin</button>
                        <a href="{{ route('admin.jenis-kegiatan.index') }}" class="btn btn-outline-secondary">Batal</a>
                    </form>

                </div>
            </div>
        </div>
    </div>
</section>

@endsection
