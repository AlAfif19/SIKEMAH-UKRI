<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\StoreSkemaPoinRequest;
use App\Models\Jenis;
use App\Models\Sertifikat;
use App\Models\SkemaPoin;
use Illuminate\Http\RedirectResponse;

class SkemaPoinController extends Controller
{
    public function store(StoreSkemaPoinRequest $request, Jenis $jenis): RedirectResponse
    {
        $jenis->skemaPoin()->create($request->validated());

        return redirect()
            ->route('admin.jenis.edit', $jenis)
            ->with('success', 'Skema poin berhasil ditambahkan.');
    }

    public function destroy(Jenis $jenis, SkemaPoin $skemaPoin): RedirectResponse
    {
        $sudahDipakai = Sertifikat::where('jenis_id', $jenis->id)
            ->where('tingkat', $skemaPoin->tingkat)
            ->where('peran', $skemaPoin->peran)
            ->exists();

        if ($sudahDipakai) {
            return back()->with('error', 'Skema poin tidak dapat dihapus karena sudah dipakai pada pengajuan sertifikat.');
        }

        $skemaPoin->delete();

        return redirect()
            ->route('admin.jenis.edit', $jenis)
            ->with('success', 'Skema poin berhasil dihapus.');
    }
}
