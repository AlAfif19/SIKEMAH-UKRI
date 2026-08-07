@extends('layouts.app')

@section('content')

<div class="pagetitle">
    <h1>Kategori Kegiatan</h1>
    <nav>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">Home</a></li>
            <li class="breadcrumb-item">Manajemen Kegiatan</li>
            <li class="breadcrumb-item active">Kategori</li>
        </ol>
    </nav>
</div>

<section class="section">
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body">

                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <div class="d-flex">
                            <input type="text" id="input-cari" value="{{ request('cari') }}"
                                   class="form-control form-control-sm me-2" style="width:220px"
                                   placeholder="Cari nama kategori...">
                        </div>

                        <a href="{{ route('admin.kategori.create') }}" class="btn btn-primary">
                            <i class="bi bi-plus-lg"></i> Tambah Kategori
                        </a>
                    </div>

                    <div id="hasil-tabel">
                        @include('admin.kategori._tabel')
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
        const hasilTabel = document.getElementById('hasil-tabel');
        const urlDasar = '{{ route('admin.kategori.index') }}';
        let waktuTunda;

        function muatData(halamanUrl) {
            const url = halamanUrl || urlDasar + '?cari=' + encodeURIComponent(inputCari.value);

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

        // Tautan pagination hasil AJAX juga diarahkan lewat AJAX, bukan reload penuh.
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
