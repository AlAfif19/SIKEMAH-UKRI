@extends('layouts.app')

@section('content')

<div class="pagetitle">
    <h1>Audit Trail</h1>
    <nav>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">Home</a></li>
            <li class="breadcrumb-item active">Audit Trail</li>
        </ol>
    </nav>
</div>

<section class="section">
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body">

                    <form class="row g-2 mb-3" method="GET" action="{{ route('admin.log-aktivitas.index') }}">
                        <div class="col-md-4">
                            <select name="pengguna_id" class="form-select form-select-sm" onchange="this.form.submit()">
                                <option value="">Semua Pengguna</option>
                                @foreach ($daftarPengguna as $pengguna)
                                    <option value="{{ $pengguna->id }}" @selected(request('pengguna_id') == $pengguna->id)>
                                        {{ $pengguna->nama }}
                                    </option>
                                @endforeach
                            </select>
                        </div>
                        <div class="col-md-3">
                            <input type="date" name="dari_tanggal" value="{{ request('dari_tanggal') }}"
                                   class="form-control form-control-sm" placeholder="Dari tanggal">
                        </div>
                        <div class="col-md-3">
                            <input type="date" name="sampai_tanggal" value="{{ request('sampai_tanggal') }}"
                                   class="form-control form-control-sm" placeholder="Sampai tanggal">
                        </div>
                        <div class="col-md-2">
                            <button type="submit" class="btn btn-sm btn-outline-secondary w-100">Filter</button>
                        </div>
                    </form>

                    <table class="table table-borderless table-sm">
                        <thead>
                            <tr>
                                <th>Waktu</th>
                                <th>Pengguna</th>
                                <th>Aktivitas</th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse ($log as $item)
                                <tr>
                                    <td class="text-nowrap">{{ $item->created_at->format('d-m-Y H:i') }}</td>
                                    <td>{{ $item->pengguna->nama ?? '-' }}</td>
                                    <td>{{ $item->aktivitas }}</td>
                                </tr>
                            @empty
                                <tr>
                                    <td colspan="3" class="text-center text-muted py-4">Belum ada aktivitas tercatat</td>
                                </tr>
                            @endforelse
                        </tbody>
                    </table>

                    {{ $log->links() }}

                </div>
            </div>
        </div>
    </div>
</section>

@endsection
