@extends('layouts.app')

@section('content')

<div class="pagetitle">
    <h1>Ubah Kegiatan</h1>
    <nav>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">Home</a></li>
            <li class="breadcrumb-item"><a href="{{ route('admin.jenis-kegiatan.index') }}">Kegiatan</a></li>
            <li class="breadcrumb-item active">Ubah</li>
        </ol>
    </nav>
</div>

<section class="section">
    <div class="row">
        <div class="col-12 col-lg-6">
            <div class="card">
                <div class="card-body">

                    <form method="POST" action="{{ route('admin.jenis-kegiatan.update', $jenisKegiatan) }}">
                        @csrf
                        @method('PUT')

                        <div class="mb-3">
                            <label class="form-label fw-semibold">Kategori</label>
                            <select name="kategori_id" class="form-select @error('kategori_id') is-invalid @enderror">
                                @foreach ($daftarKategori as $opsi)
                                    <option value="{{ $opsi->id }}"
                                        @selected(old('kategori_id', $jenisKegiatan->kategori_id) == $opsi->id)>
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
                            <input type="text" name="nama" value="{{ old('nama', $jenisKegiatan->nama) }}"
                                   class="form-control @error('nama') is-invalid @enderror">
                            @error('nama')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-semibold">Dokumen yang Diperlukan</label>
                            <input type="text" name="dokumen" value="{{ old('dokumen', $jenisKegiatan->dokumen) }}"
                                   class="form-control @error('dokumen') is-invalid @enderror">
                            @error('dokumen')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>

                        <div class="row">
                            <div class="col-12 col-md-6 mb-3">
                                <label class="form-label fw-semibold">Periode Penilaian</label>
                                <input type="text" name="periode_penilaian"
                                       value="{{ old('periode_penilaian', $jenisKegiatan->periode_penilaian) }}"
                                       class="form-control @error('periode_penilaian') is-invalid @enderror">
                                @error('periode_penilaian')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>
                            <div class="col-12 col-md-6 mb-3">
                                <label class="form-label fw-semibold">Penilai</label>
                                <input type="text" name="penilai" value="{{ old('penilai', $jenisKegiatan->penilai) }}"
                                       class="form-control @error('penilai') is-invalid @enderror">
                                @error('penilai')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>
                        </div>

                        <button type="submit" class="btn btn-primary">Simpan Perubahan</button>
                        <a href="{{ route('admin.jenis-kegiatan.index') }}" class="btn btn-outline-secondary">Batal</a>
                    </form>

                </div>
            </div>
        </div>

        <div class="col-12 col-lg-6">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Jenis</h5>
                    <p class="text-muted small">
                        Pilihan lebih spesifik di bawah Kegiatan ini. Mahasiswa akan memilih salah satu Jenis
                        secara manual saat mengajukan sertifikat (tidak otomatis terisi). Skema poin (Tingkat/Peran)
                        diatur per Jenis — klik "Kelola Poin" untuk mengaturnya.
                    </p>

                    <table class="table table-borderless table-sm">
                        <thead>
                            <tr><th>Nama Jenis</th><th>Jml Skema Poin</th><th class="text-end">Aksi</th></tr>
                        </thead>
                        <tbody>
                            @forelse ($jenisKegiatan->jenis as $item)
                                <tr>
                                    <td>{{ $item->nama }}</td>
                                    <td>{{ $item->skema_poin_count }}</td>
                                    <td class="text-end">
                                        <a href="{{ route('admin.jenis.edit', $item) }}"
                                           class="btn btn-sm btn-outline-primary">
                                            <i class="bi bi-gear"></i> Kelola Poin
                                        </a>
                                        <form action="{{ route('admin.jenis-kegiatan.jenis.destroy', [$jenisKegiatan, $item]) }}"
                                              method="POST" class="d-inline"
                                              data-confirm="Hapus jenis ini beserta skema poinnya?"
                                              data-confirm-title="Hapus Jenis"
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
                                <tr><td colspan="3" class="text-muted">Belum ada Jenis</td></tr>
                            @endforelse
                        </tbody>
                    </table>

                    <hr>

                    <form method="POST" action="{{ route('admin.jenis-kegiatan.jenis.store', $jenisKegiatan) }}"
                          class="row g-2 align-items-end">
                        @csrf
                        <div class="col-9">
                            <label class="form-label small">Nama Jenis Baru</label>
                            <input type="text" name="nama" class="form-control form-control-sm"
                                   placeholder="misal: Seminar">
                        </div>
                        <div class="col-3">
                            <button type="submit" class="btn btn-sm btn-primary w-100">
                                <i class="bi bi-plus-lg"></i> Tambah
                            </button>
                        </div>
                    </form>
                    @error('nama')
                        <div class="text-danger small mt-1">{{ $message }}</div>
                    @enderror
                </div>
            </div>
        </div>
    </div>
</section>

@endsection
