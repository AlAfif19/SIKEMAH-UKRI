@extends('layouts.app')

@section('content')

<div class="pagetitle">
    <h1>Kegiatan</h1>
    <nav>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">Home</a></li>
            <li class="breadcrumb-item">Manajemen Kegiatan</li>
            <li class="breadcrumb-item active">Kegiatan</li>
        </ol>
    </nav>
</div>

<section class="section">
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body">

                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <div class="d-flex gap-2">
                            <select id="filter-kategori" class="form-select form-select-sm" style="width:260px">
                                <option value="">Semua Kategori</option>
                                @foreach ($daftarKategori as $opsi)
                                    <option value="{{ $opsi->id }}" @selected(request('kategori_id') == $opsi->id)>
                                        {{ $opsi->nama }}
                                    </option>
                                @endforeach
                            </select>
                            <input type="text" id="input-cari" value="{{ request('cari') }}"
                                   class="form-control form-control-sm" style="width:220px"
                                   placeholder="Cari nama jenis kegiatan...">
                        </div>

                        <a href="{{ route('admin.jenis-kegiatan.create') }}" class="btn btn-primary">
                            <i class="bi bi-plus-lg"></i> Tambah Kegiatan
                        </a>
                    </div>

                    <div id="hasil-tabel">
                        @include('admin.jenis-kegiatan._tabel')
                    </div>

                </div>
            </div>
        </div>
    </div>
</section>

@push('scripts')
<script>
    (function () {
        const inputCari = document.getElementById('input-cari');
        const filterKategori = document.getElementById('filter-kategori');
        const hasilTabel = document.getElementById('hasil-tabel');
        const urlDasar = '{{ route('admin.jenis-kegiatan.index') }}';
        let waktuTunda;

        function muatData(halamanUrl) {
            const url = halamanUrl || urlDasar + '?cari=' + encodeURIComponent(inputCari.value)
                + '&kategori_id=' + encodeURIComponent(filterKategori.value);

            fetch(url, { headers: { 'X-Requested-With': 'XMLHttpRequest' } })
                .then((res) => res.text())
                .then((html) => {
                    hasilTabel.innerHTML = html;
                    history.replaceState(null, '', url);
                });
        }

        inputCari.addEventListener('input', function () {
            clearTimeout(waktuTunda);
            waktuTunda = setTimeout(() => muatData(), 400);
        });

        filterKategori.addEventListener('change', () => muatData());

        hasilTabel.addEventListener('click', function (e) {
            const tautan = e.target.closest('.pagination a');
            if (tautan) {
                e.preventDefault();
                muatData(tautan.href);
            }
        });
    })();
</script>
@endpush

@endsection
