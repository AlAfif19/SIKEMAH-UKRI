<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\StoreJenisRequest;
use App\Http\Requests\Admin\UpdateJenisRequest;
use App\Models\Jenis;
use App\Models\JenisKegiatan;
use Illuminate\Http\RedirectResponse;
use Illuminate\View\View;

class JenisController extends Controller
{
    public function store(StoreJenisRequest $request, JenisKegiatan $jenisKegiatan): RedirectResponse
    {
        $jenisKegiatan->jenis()->create($request->validated());

        return redirect()
            ->route('admin.jenis-kegiatan.edit', $jenisKegiatan)
            ->with('success', 'Jenis berhasil ditambahkan.');
    }

    public function edit(Jenis $jenis): View
    {
        $jenis->load(['kegiatan.kategori', 'skemaPoin' => fn ($q) => $q->orderByDesc('poin')]);

        return view('admin.jenis.edit', compact('jenis'));
    }

    public function update(UpdateJenisRequest $request, Jenis $jenis): RedirectResponse
    {
        $jenis->update($request->validated());

        return redirect()
            ->route('admin.jenis-kegiatan.edit', $jenis->jenis_kegiatan_id)
            ->with('success', 'Jenis berhasil diperbarui.');
    }

    public function destroy(JenisKegiatan $jenisKegiatan, Jenis $jenis): RedirectResponse
    {
        if ($jenis->sertifikat()->exists()) {
            return back()->with('error', 'Jenis tidak dapat dihapus karena sudah dipakai pada pengajuan sertifikat.');
        }

        $jenis->delete();

        return redirect()
            ->route('admin.jenis-kegiatan.edit', $jenisKegiatan)
            ->with('success', 'Jenis berhasil dihapus.');
    }
}
