# Integrasi SSO UKRI — Panduan

Status: **sudah diimplementasikan dan aktif** (`SSO_ENABLED=true` di `.env` lokal saat ini). **Login manual (email/NIM + password) sudah dihapus.** `/login` sekarang otomatis meneruskan ke SSO UKRI — satu-satunya cara masuk ke SIKEMAH.

## Bagian yang terlibat

| Bagian | File | Peran |
|---|---|---|
| Controller | `app/Http/Controllers/Auth/SsoController.php` | `redirect()` → lempar ke SSO. `callback()` → tukar `code` → `access_token`, ambil profil, cari/buat user lokal, login. Semua logika spesifik-SSO (mapping peran, pencocokan akun, pembuatan data mahasiswa) dipecah jadi method privat kecil supaya mudah disesuaikan kalau format response SSO berubah. |
| Routes | `routes/web.php` | `GET /auth/sso/redirect` (nama `sso.redirect`) dan `GET /auth/sso/callback` (nama `sso.callback`), ada di dalam grup middleware `guest` bersama route `/login`. |
| Konfigurasi | `config/services.php` → `services.sso.*` | Dibaca dari `.env`: `SSO_ENABLED`, `SSO_URL`, `SSO_CLIENT_ID`, `SSO_CLIENT_SECRET`, `SSO_REDIRECT_URI`, `SSO_TIMEOUT`. |
| Kolom DB | `pengguna.sso_username` (nullable, unique) | Mencocokkan akun SSO ke akun lokal SIKEMAH; lihat migration `2026_07_30_000001_add_sso_username_to_pengguna_table.php`. |
| View | `resources/views/auth/login.blade.php` | Tidak ada lagi form email/password. Hanya tombol "Login dengan SSO UKRI" (muncul kalau `services.sso.enabled` true) dan pesan error kalau ada. |
| Logout | `app/Http/Controllers/Auth/AuthenticatedSessionController.php` | Kalau user login lewat SSO (ada `sso_token` di session), logout lokal juga mencoba mencabut token di server SSO (`/api/logout`) secara best-effort — gagal di sini tidak menggagalkan logout lokal. |

## Alur login SSO

0. User buka `/login` → `AuthenticatedSessionController::create()` langsung `redirect()->route('sso.redirect')` (tanpa perlu klik apa pun), KECUALI ada pesan error tersimpan di session (mis. login SSO sebelumnya gagal) — saat itu halaman `auth.login` ditampilkan dulu supaya pesannya kebaca, dengan tombol "Login dengan SSO UKRI" untuk coba lagi.
1. (Manual) User klik "Login dengan SSO UKRI" → `GET /auth/sso/redirect`.
2. SIKEMAH generate `state` acak (disimpan di session, proteksi CSRF) lalu redirect ke `{SSO_URL}/oauth/authorize?client_id=...&redirect_uri=...&response_type=code&scope=&state=...`.
3. User login di halaman SSO UKRI, lalu SSO redirect balik ke `SSO_REDIRECT_URI` (`/auth/sso/callback`) dengan `?code=...&state=...`.
4. `SsoController::callback()`:
   - Validasi `state` (kalau SSO mengembalikannya — tidak hard-fail kalau tidak ada).
   - Tukar `code` → `access_token` lewat `POST {SSO_URL}/oauth/token`.
   - Ambil profil lewat `GET {SSO_URL}/api/user` (pakai `access_token`).
   - Petakan `roles` dari SSO ke peran SIKEMAH (`admin`/`mahasiswa`). Role lain (mis. `dosen`) ditolak dengan pesan "Role SSO Anda belum didukung di SIKEMAH".
   - Cari akun lokal lewat `sso_username`, lalu fallback ke `email`. Kalau tidak ketemu, buat akun baru.
   - Kalau peran mahasiswa dan belum ada baris di tabel `mahasiswa`, buat baris baru (`prodi`/`fakultas`/`angkatan` diisi `"-"` — lihat Batasan di bawah).
   - `Auth::login()` + redirect ke dashboard sesuai peran (pakai trait `RedirectsSetelahLogin` yang sama dengan login manual).

## Konfigurasi `.env`

**Untuk pengembangan lokal** (tanpa tunnel seperti ngrok — SIKEMAH cukup dijalankan lewat `php artisan serve` di `http://localhost:8000`):

```env
SSO_ENABLED=true
SSO_URL=https://sso.ukri.web.id
SSO_CLIENT_ID=isi_dari_admin_sso
SSO_CLIENT_SECRET=isi_dari_admin_sso
SSO_REDIRECT_URI=http://localhost:8000/auth/sso/callback
SSO_TIMEOUT=10
APP_URL=http://localhost:8000
```

**Untuk produksi/staging** (domain sungguhan), tinggal ganti `SSO_REDIRECT_URI` dan `APP_URL` ke domain aslinya, misalnya `https://sikemah.ukri.ac.id/auth/sso/callback`.

- `SSO_REDIRECT_URI` **harus sama persis** (termasuk `http`/`https`, host, port, dan tanpa/dengan trailing slash) dengan yang didaftarkan ke Administrator SSO sebagai OAuth Client SIKEMAH. Kalau baru pertama kali pakai `http://localhost:8000/auth/sso/callback`, **daftarkan dulu URI itu ke Administrator SSO** (atau minta mereka menambahkannya sebagai redirect URI kedua di samping domain produksi) — kalau belum terdaftar, SSO akan menolak permintaan login dengan error `redirect_uri` tidak valid, bukan error dari kode SIKEMAH.
- Tidak perlu tunnel (ngrok dkk.) untuk pengembangan lokal — alur OAuth di sini murni redirect di **browser** (browser kamu yang membuka `sso.ukri.web.id` lalu diarahkan balik ke `localhost:8000`), bukan panggilan server-ke-server ke alamat SIKEMAH kamu. Tunnel hanya diperlukan kalau SSO harus memanggil balik ke SIKEMAH langsung dari server mereka, yang tidak terjadi di alur ini.
- Kalau salah satu dari `SSO_URL` / `SSO_CLIENT_ID` / `SSO_CLIENT_SECRET` / `SSO_REDIRECT_URI` kosong, atau `SSO_ENABLED=false`, kedua route SSO otomatis mengembalikan 404 dan tombol di halaman login otomatis hilang — tidak ada perubahan kode yang dibutuhkan untuk mematikan/menyalakan integrasi ini.
- Kalau pindah dari lokal ke domain produksi (atau sebaliknya), cukup update `SSO_REDIRECT_URI` & `APP_URL` di `.env` **dan** pastikan redirect URI yang dipakai sudah terdaftar di sisi Administrator SSO.

## Batasan yang perlu diketahui

- **Role "dosen" belum didukung.** SIKEMAH saat ini hanya punya dashboard Admin & Mahasiswa. Kalau SSO mengirim role `dosen`, sistem menolak login dengan pesan "Role SSO Anda belum didukung di SIKEMAH" — perlu dashboard dosen terpisah dulu kalau itu dibutuhkan nanti.
- **Endpoint `/api/user` tidak mengirim nama lengkap** (hanya `username`, `email`, `roles`). Untuk akun baru yang dibuat otomatis lewat SSO, kolom `nama` sementara diisi `username` — admin perlu memperbarui nama sebenarnya secara manual, kecuali endpoint SSO diperluas untuk menyertakan nama lengkap.
- **Mahasiswa baru dari SSO**: kolom `nim` diisi dari `username` SSO, tapi `prodi`, `fakultas`, dan `angkatan` diisi `"-"` sementara karena SSO tidak mengirim data itu — perlu dilengkapi manual, atau lewat `App\Services\DataMasterClient` kalau integrasi Data Master sudah aktif.
- **Peran akun yang sudah ada tidak pernah ditimpa dari SSO.** Kalau akun lokal sudah ada (baik lewat `sso_username` maupun `email`), login SSO tidak mengubah `peran`-nya — perubahan peran tetap lewat admin SIKEMAH, supaya SSO tidak bisa diam-diam menaikkan hak akses akun yang sudah ada.
- **Pencocokan akun lama** (yang sudah ada sebelum SSO aktif, misalnya akun demo) dilakukan lewat **email** kalau `sso_username` belum pernah tertaut — pastikan email di SSO sama dengan email yang sudah terdaftar di SIKEMAH kalau ingin akunnya nyambung otomatis di login SSO pertama.
- **Logout SSO best-effort.** Pencabutan token ke `{SSO_URL}/api/logout` saat logout dibungkus try/catch — kalau server SSO sedang bermasalah, user tetap berhasil logout dari SIKEMAH.

## Kalau SSO perlu dimatikan sementara

Set `SSO_ENABLED=false` di `.env` (tanpa perlu hapus kredensial lain). Halaman `/login` akan menampilkan pesan "Login SSO belum dikonfigurasi" karena **tidak ada lagi jalur login manual sebagai cadangan** — SIKEMAH sepenuhnya bergantung pada SSO UKRI untuk autentikasi.

## Menjalankan lokal di port 8000 (SIKEMAH & RIS bergantian)

SIKEMAH dan RIS memakai `client_id`/`client_secret` SSO yang sama, dan sama-sama didaftarkan dengan redirect URI `http://localhost:8000/auth/sso/callback`. Karena keduanya tidak dijalankan bersamaan di lokal, tidak masalah berbagi port 8000 & redirect URI yang sama:

```bash
# Jalankan SIKEMAH saja
cd sikemah-ukri && php artisan serve --port=8000

# Setelah dimatikan (Ctrl+C), baru jalankan RIS
cd ris-ukri && php artisan serve --port=8000
```

Database keduanya tetap terpisah (`sikemah_ukri` vs `ris_ukri`), jadi tidak ada konflik data — yang dipakai bersama hanyalah port lokal dan URL callback SSO.

**Untuk produksi**, RIS dan SIKEMAH akan di-hosting di domain berbeda. Karena semua nilai ini (`APP_URL`, `SSO_REDIRECT_URI`, dan kredensial SSO) sepenuhnya dibaca dari `.env`, migrasi ke produksi cukup: isi `.env` masing-masing app dengan domain aslinya, lalu minta Administrator SSO mendaftarkan kedua redirect URI produksi tersebut (berbeda per app, karena domainnya beda) untuk `client_id` yang dipakai — tidak ada perubahan kode.
