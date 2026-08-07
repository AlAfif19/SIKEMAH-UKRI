<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\StoreJenisKegiatanRequest;
use App\Http\Requests\Admin\UpdateJenisKegiatanRequest;
use App\Models\JenisKegiatan;
use App\Models\Kategori;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\View\View;

class JenisKegiatanController extends Controller
{
    public function index(Request $request): View
    {
        $jenisKegiatan = JenisKegiatan::query()
            ->with('kategori')
            ->withCount('jenis')
            ->when($request->filled('kategori_id'), fn ($q) => $q->where('kategori_id', $request->kategori_id))
            ->when($request->filled('cari'), fn ($q) => $q->where('nama', 'like', '%'.$request->cari.'%'))
            ->orderBy('kategori_id')
            ->orderBy('nama')
            ->paginate($request->integer('tampil', 10))
            ->withQueryString();

        $daftarKategori = Kategori::orderBy('nama')->get();

        if ($request->ajax()) {
            return view('admin.jenis-kegiatan._tabel', compact('jenisKegiatan'));
        }

        return view('admin.jenis-kegiatan.index', compact('jenisKegiatan', 'daftarKategori'));
    }

    public function create(): View
    {
        $daftarKategori = Kategori::orderBy('nama')->get();

        return view('admin.jenis-kegiatan.create', compact('daftarKategori'));
    }

    public function store(StoreJenisKegiatanRequest $request): RedirectResponse
    {
        $jenisKegiatan = JenisKegiatan::create($request->validated());

        return redirect()
            ->route('admin.jenis-kegiatan.edit', $jenisKegiatan)
            ->with('success', 'Kegiatan berhasil ditambahkan. Sekarang tambahkan Jenis di bawah.');
    }

    public function edit(JenisKegiatan $jenisKegiatan): View
    {
        $daftarKategori = Kategori::orderBy('nama')->get();
        $jenisKegiatan->load(['jenis' => fn ($q) => $q->withCount('skemaPoin')->orderBy('nama')]);

        return view('admin.jenis-kegiatan.edit', compact('jenisKegiatan', 'daftarKategori'));
    }

    public function update(UpdateJenisKegiatanRequest $request, JenisKegiatan $jenisKegiatan): RedirectResponse
    {
        $jenisKegiatan->update($request->validated());

        return redirect()
            ->route('admin.jenis-kegiatan.index')
            ->with('success', 'Kegiatan berhasil diperbarui.');
    }

    public function destroy(JenisKegiatan $jenisKegiatan): RedirectResponse
    {
        $adaSertifikat = \App\Models\Sertifikat::whereIn('jenis_id', $jenisKegiatan->jenis()->pluck('id'))->exists();

        if ($adaSertifikat) {
            return back()->with('error', 'Kegiatan tidak dapat dihapus karena sudah ada pengajuan sertifikat pada salah satu jenisnya.');
        }

        $jenisKegiatan->delete();

        return redirect()
            ->route('admin.jenis-kegiatan.index')
            ->with('success', 'Kegiatan berhasil dihapus.');
    }
}
