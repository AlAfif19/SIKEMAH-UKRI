@extends('layouts.app')

@section('content')

@php
    $judulHalaman = request('status', 'menunggu') === 'menunggu' ? 'Validasi Sertifikat' : 'Riwayat Validasi';
@endphp

<div class="pagetitle">
    <h1>{{ $judulHalaman }}</h1>
    <nav>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">Home</a></li>
            <li class="breadcrumb-item active">{{ $judulHalaman }}</li>
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
                            <select id="filter-status" class="form-select form-select-sm" style="width:180px">
                                <option value="menunggu" @selected($status === 'menunggu')>Menunggu Validasi</option>
                                <option value="disetujui" @selected($status === 'disetujui')>Disetujui</option>
                                <option value="ditolak" @selected($status === 'ditolak')>Ditolak</option>
                                <option value="semua" @selected($status === 'semua')>Semua</option>
                            </select>
                            <input type="text" id="input-cari" value="{{ request('cari') }}"
                                   class="form-control form-control-sm" style="width:220px"
                                   placeholder="Cari nama, NIM, atau judul kegiatan...">
                        </div>
                    </div>

                    <div id="hasil-tabel">
                        @include('admin.validasi-sertifikat._tabel')
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
        const filterStatus = document.getElementById('filter-status');
        const hasilTabel = document.getElementById('hasil-tabel');
        const urlDasar = '{{ route('admin.validasi-sertifikat.index') }}';
        let waktuTunda;

        function pasangEventCheckbox() {
            const pilihSemua = document.getElementById('pilih-semua');
            const btnMassal = document.getElementById('btn-setujui-massal');

            function perbaruiTombolMassal() {
                if (! btnMassal) return;
                const adaTerpilih = hasilTabel.querySelectorAll('.cek-item:checked').length > 0;
                btnMassal.disabled = ! adaTerpilih;
            }

            if (pilihSemua) {
                pilihSemua.addEventListener('change', function () {
                    hasilTabel.querySelectorAll('.cek-item').forEach(cb => cb.checked = pilihSemua.checked);
                    perbaruiTombolMassal();
                });

                hasilTabel.querySelectorAll('.cek-item').forEach(cb => {
                    cb.addEventListener('change', perbaruiTombolMassal);
                });
            }
        }

        function muatData(halamanUrl) {
            const url = halamanUrl || urlDasar + '?cari=' + encodeURIComponent(inputCari.value)
                + '&status=' + encodeURIComponent(filterStatus.value);

            fetch(url, { headers: { 'X-Requested-With': 'XMLHttpRequest' } })
                .then((res) => res.text())
                .then((html) => {
                    hasilTabel.innerHTML = html;
                    history.replaceState(null, '', url);
                    pasangEventCheckbox();
                });
        }

        inputCari.addEventListener('input', function () {
            clearTimeout(waktuTunda);
            waktuTunda = setTimeout(() => muatData(), 400);
        });

        filterStatus.addEventListener('change', function () {
            // Judul halaman ("Validasi Sertifikat" vs "Riwayat Validasi") tergantung status,
            // jadi reload penuh di sini supaya judul & breadcrumb ikut ter-update dengan benar.
            window.location.href = urlDasar + '?status=' + encodeURIComponent(filterStatus.value);
        });

        hasilTabel.addEventListener('click', function (e) {
            const tautan = e.target.closest('.pagination a');
            if (tautan) {
                e.preventDefault();
                muatData(tautan.href);
            }
        });

        pasangEventCheckbox();
    })();
</script>
@endpush

@endsection
