<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Http\Requests\User\StoreSertifikatRequest;
use App\Models\Jenis;
use App\Models\JenisKegiatan;
use App\Models\Kategori;
use App\Models\Sertifikat;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\View\View;

class SertifikatController extends Controller
{
    public function index(): View
    {
        $mahasiswa = auth()->user()->mahasiswa;

        $sertifikat = $mahasiswa
            ? $mahasiswa->sertifikat()->with('jenis.kegiatan.kategori')->latest()->paginate(10)
            : Sertifikat::query()->whereRaw('1 = 0')->paginate(10);

        return view('user.sertifikat.index', compact('sertifikat'));
    }

    public function create(Request $request): View
    {
        $daftarKategori = Kategori::orderBy('nama')->get();
        $daftarJenisKegiatan = JenisKegiatan::orderBy('nama')->get();
        $daftarJenis = Jenis::with('skemaPoin')->orderBy('nama')->get();

        // Peta jenis_id -> daftar kombinasi {tingkat, peran, poin}, dikirim ke JS
        // supaya dropdown Tingkat/Peran & Poin bisa terisi otomatis tanpa AJAX.
        $petaSkemaPoin = $daftarJenis->mapWithKeys(function ($jenis) {
            return [$jenis->id => $jenis->skemaPoin->map(fn ($s) => [
                'tingkat' => $s->tingkat,
                'peran' => $s->peran,
                'poin' => (float) $s->poin,
            ])];
        });

        $jenisKegiatanTerpilihAwal = $request->integer('jenis_kegiatan_id') ?: null;

        return view('user.sertifikat.create', compact(
            'daftarKategori', 'daftarJenisKegiatan', 'daftarJenis', 'petaSkemaPoin', 'jenisKegiatanTerpilihAwal'
        ));
    }

    public function store(StoreSertifikatRequest $request): RedirectResponse
    {
        $mahasiswa = auth()->user()->mahasiswa;
        $data = $request->validated();

        try {
            $berkas = $request->file('berkas');
            $path = $berkas->store("sertifikat/{$mahasiswa->id}", 'public');
            $thumbnail = null;

            $adalahGambar = in_array(strtolower($berkas->getClientOriginalExtension()), ['jpg', 'jpeg', 'png']);

            // Kompresi & thumbnail HANYA dijalankan kalau ekstensi GD tersedia di server.
            // Kalau GD tidak aktif, berkas asli tetap disimpan apa adanya — upload
            // tidak boleh gagal hanya karena fitur optimisasi gambar tidak tersedia.
            if ($adalahGambar && extension_loaded('gd')) {
                $this->kompresGambar(storage_path('app/public/'.$path));
                $thumbnail = $this->buatThumbnail(storage_path('app/public/'.$path), $path);
            }

            $poin = \App\Models\SkemaPoin::where('jenis_id', $data['jenis_id'])
                ->where('tingkat', $data['tingkat'] ?? null)
                ->where('peran', $data['peran'] ?? null)
                ->value('poin') ?? 0;

            Sertifikat::create([
                'mahasiswa_id' => $mahasiswa->id,
                'jenis_id' => $data['jenis_id'],
                'tingkat' => $data['tingkat'] ?? null,
                'peran' => $data['peran'] ?? null,
                'judul_sertifikat' => $data['judul_sertifikat'],
                'penyelenggara_sertifikat' => $data['penyelenggara_sertifikat'] ?? null,
                'tempat_pelaksanaan' => $data['tempat_pelaksanaan'] ?? null,
                'deskripsi_kegiatan' => $data['deskripsi_kegiatan'] ?? null,
                'tanggal_mulai' => $data['tanggal_mulai'] ?? null,
                'tanggal_selesai' => $data['tanggal_selesai'] ?? null,
                'nomor_sertifikat' => $data['nomor_sertifikat'] ?? null,
                'berkas' => $path,
                'thumbnail' => $thumbnail,
                'poin' => $poin,
            ]);
        } catch (\Throwable $e) {
            report($e);

            $pesanError = 'Terjadi kesalahan saat memproses berkas. Coba lagi atau gunakan berkas lain.';

            // Form dikirim lewat XHR (lihat create.blade.php) supaya progress bar bisa
            // ditampilkan. Kalau di sini kita tetap redirect() seperti request biasa,
            // XHR akan otomatis mengikuti redirect itu SEBELUM JS sempat membaca
            // responsnya — flash message pun "termakan" oleh request susulan itu dan
            // tidak pernah sampai ke pengguna. Untuk request yang mengharapkan JSON,
            // balas langsung dengan JSON supaya JS bisa menampilkan pesan tanpa
            // bergantung pada redirect/session flash.
            if ($request->expectsJson()) {
                return response()->json(['message' => $pesanError], 500);
            }

            return back()
                ->withInput()
                ->with('error', $pesanError);
        }

        $pesanSukses = 'Sertifikat berhasil diajukan. Menunggu validasi admin.';

        // Flash disimpan di sini (bukan lewat redirect()->with()) supaya tetap aman
        // dipakai oleh alur JSON: JS akan melakukan SATU kali navigasi manual ke
        // halaman Riwayat setelah menerima respons ini, jadi flash hanya "dimakan"
        // oleh request navigasi itu — tidak ada hop tersembunyi seperti saat masih
        // pakai redirect() langsung dari sini (lihat riwayat percakapan sebelumnya).
        session()->flash('success', $pesanSukses);

        if ($request->expectsJson()) {
            return response()->json([
                'message' => $pesanSukses,
                'redirect' => route('user.sertifikat.index'),
            ]);
        }

        return redirect()
            ->route('user.sertifikat.index')
            ->with('success', $pesanSukses);
    }

    public function destroy(Sertifikat $sertifikat): RedirectResponse
    {
        $mahasiswa = auth()->user()->mahasiswa;

        if (! $mahasiswa || $sertifikat->mahasiswa_id !== $mahasiswa->id) {
            abort(403);
        }

        if ($sertifikat->status !== \App\Enums\StatusSertifikat::Menunggu) {
            return back()->with('error', 'Pengajuan yang sudah divalidasi tidak dapat dibatalkan.');
        }

        Storage::disk('public')->delete($sertifikat->berkas);

        if ($sertifikat->thumbnail) {
            Storage::disk('public')->delete($sertifikat->thumbnail);
        }

        $sertifikat->delete();

        return redirect()
            ->route('user.sertifikat.index')
            ->with('success', 'Pengajuan sertifikat berhasil dibatalkan.');
    }

    /**
     * Kompresi gambar sederhana pakai GD bawaan PHP (tanpa Composer package tambahan):
     * lebar dibatasi maksimal 1280px dan kualitas JPEG diturunkan ke 75%.
     */
    private function kompresGambar(string $pathFisik): void
    {
        $info = @getimagesize($pathFisik);

        if (! $info) {
            return;
        }

        [$lebar, $tinggi, $tipe] = $info;
        $lebarMaksimum = 1280;

        $gambar = match ($tipe) {
            IMAGETYPE_JPEG => imagecreatefromjpeg($pathFisik),
            IMAGETYPE_PNG => imagecreatefrompng($pathFisik),
            default => null,
        };

        if (! $gambar) {
            return;
        }

        if ($lebar > $lebarMaksimum) {
            $tinggiBaru = (int) round($tinggi * ($lebarMaksimum / $lebar));
            $hasilResize = imagescale($gambar, $lebarMaksimum, $tinggiBaru);

            if ($hasilResize !== false) {
                $gambar = $hasilResize;
            }
        }

        match ($tipe) {
            IMAGETYPE_JPEG => imagejpeg($gambar, $pathFisik, 75),
            IMAGETYPE_PNG => imagepng($gambar, $pathFisik, 6),
            default => null,
        };

        imagedestroy($gambar);
    }

    /**
     * Buat thumbnail kecil (lebar 200px) dari gambar yang sudah dikompresi,
     * disimpan sebagai file terpisah "thumb_namafile.ext" di folder yang sama.
     * Dipakai untuk preview cepat di daftar Validasi Sertifikat (tanpa
     * perlu memuat gambar penuh).
     */
    private function buatThumbnail(string $pathFisikAsli, string $pathRelatifAsli): ?string
    {
        $info = @getimagesize($pathFisikAsli);

        if (! $info) {
            return null;
        }

        [$lebar, $tinggi, $tipe] = $info;
        $lebarThumbnail = 200;

        $gambarAsli = match ($tipe) {
            IMAGETYPE_JPEG => imagecreatefromjpeg($pathFisikAsli),
            IMAGETYPE_PNG => imagecreatefrompng($pathFisikAsli),
            default => null,
        };

        if (! $gambarAsli) {
            return null;
        }

        $tinggiThumbnail = (int) round($tinggi * ($lebarThumbnail / $lebar));
        $thumbnail = imagescale($gambarAsli, $lebarThumbnail, $tinggiThumbnail);
        imagedestroy($gambarAsli);

        if ($thumbnail === false) {
            return null;
        }

        $direktori = dirname($pathRelatifAsli);
        $namaFile = 'thumb_'.pathinfo($pathRelatifAsli, PATHINFO_FILENAME).'.jpg';
        $pathRelatifThumbnail = $direktori.'/'.$namaFile;

        imagejpeg($thumbnail, storage_path('app/public/'.$pathRelatifThumbnail), 70);
        imagedestroy($thumbnail);

        return $pathRelatifThumbnail;
    }
}
