<?php

namespace App\Http\Controllers;

use App\Models\Notifikasi;
use Illuminate\View\View;

class NotifikasiController extends Controller
{
    public function index(): View
    {
        $notifikasi = Notifikasi::where('pengguna_id', auth()->id())
            ->latest()
            ->paginate(15);

        Notifikasi::where('pengguna_id', auth()->id())
            ->where('sudah_dibaca', false)
            ->update(['sudah_dibaca' => true]);

        return view('notifikasi.index', compact('notifikasi'));
    }
}
