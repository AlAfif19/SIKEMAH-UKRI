@extends('layouts.app')

@section('content')

<div class="pagetitle">
    <h1>Perolehan Poin</h1>
    <nav>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{ route('user.dashboard') }}">Home</a></li>
            <li class="breadcrumb-item active">Perolehan Poin</li>
        </ol>
    </nav>
</div>

<section class="section">
    <div class="row">
        <div class="col-12 mb-3">
            <div class="card">
                <div class="card-body text-center">
                    <h6 class="text-muted mb-1">Total Poin Disetujui</h6>
                    <h2 class="mb-0">{{ number_format($totalPoin, 0) }}</h2>
                </div>
            </div>
        </div>

        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Rincian per Kategori</h5>

                    @forelse ($rincianKategori as $baris)
                        <div class="mb-4">
                            <div class="d-flex justify-content-between mb-1">
                                <span class="fw-semibold">{{ $baris['kategori']->nama }}</span>
                                <span class="text-muted small">
                                    {{ number_format($baris['poin_diperoleh'], 0) }}
                                    / {{ number_format($baris['kategori']->poin_maksimum, 0) }} poin
                                </span>
                            </div>
                            <div class="progress" style="height: 10px;">
                                <div class="progress-bar" role="progressbar"
                                     style="width: {{ $baris['persentase'] }}%"></div>
                            </div>
                        </div>
                    @empty
                        <p class="text-muted">Belum ada kategori kegiatan.</p>
                    @endforelse

                </div>
            </div>
        </div>
    </div>
</section>

@endsection
