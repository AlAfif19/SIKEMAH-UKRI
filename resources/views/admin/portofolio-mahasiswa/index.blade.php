@extends('layouts.app')

@section('content')

<div class="pagetitle">
    <h1>Portofolio Mahasiswa</h1>
    <nav>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">Home</a></li>
            <li class="breadcrumb-item active">Portofolio Mahasiswa</li>
        </ol>
    </nav>
</div>

<section class="section">
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body">

                    <div class="mb-3">
                        <input type="text" id="input-cari" value="{{ request('cari') }}"
                               class="form-control form-control-sm" style="width:260px"
                               placeholder="Cari nama atau NIM...">
                    </div>

                    <div id="hasil-tabel">
                        @include('admin.portofolio-mahasiswa._tabel')
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
        const urlDasar = '{{ route('admin.portofolio-mahasiswa.index') }}';
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
