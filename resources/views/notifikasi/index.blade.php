@extends('layouts.app')

@section('content')

<div class="pagetitle">
    <h1>Notifikasi</h1>
    <nav>
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a href="{{ auth()->user()->isAdmin() ? route('admin.dashboard') : route('user.dashboard') }}">Home</a>
            </li>
            <li class="breadcrumb-item active">Notifikasi</li>
        </ol>
    </nav>
</div>

<section class="section">
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body">

                    @forelse ($notifikasi as $item)
                        <div class="d-flex justify-content-between border-bottom py-3">
                            <div>
                                <h6 class="mb-1">{{ $item->judul }}</h6>
                                <p class="mb-1 text-muted">{{ $item->isi }}</p>
                                <small class="text-muted">{{ $item->created_at->diffForHumans() }}</small>
                            </div>
                        </div>
                    @empty
                        <p class="text-center text-muted py-4">Belum ada notifikasi.</p>
                    @endforelse

                    {{ $notifikasi->links() }}

                </div>
            </div>
        </div>
    </div>
</section>

@endsection
