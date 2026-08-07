<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\LogAktivitas;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\View\View;

class LogAktivitasController extends Controller
{
    public function index(Request $request): View
    {
        $log = LogAktivitas::query()
            ->with('pengguna')
            ->when($request->filled('pengguna_id'), fn ($q) => $q->where('pengguna_id', $request->pengguna_id))
            ->when($request->filled('dari_tanggal'), fn ($q) => $q->whereDate('created_at', '>=', $request->dari_tanggal))
            ->when($request->filled('sampai_tanggal'), fn ($q) => $q->whereDate('created_at', '<=', $request->sampai_tanggal))
            ->orderByDesc('created_at')
            ->paginate(20)
            ->withQueryString();

        $daftarPengguna = User::orderBy('nama')->get();

        return view('admin.log-aktivitas.index', compact('log', 'daftarPengguna'));
    }
}
