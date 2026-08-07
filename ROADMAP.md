# SIKEMAH — Roadmap Pengembangan

> Sistem Informasi Kegiatan Mahasiswa UKRI  
> Tech Stack: Laravel 13 · PHP 8 · MySQL · Bootstrap NiceAdmin · Vite

---

## Skema Database (Bahasa Indonesia)

Semua tabel dan kolom bisnis menggunakan bahasa Indonesia agar mudah dipelihara.

| Tabel           | Kolom Utama                                                                         |
| --------------- | ----------------------------------------------------------------------------------- |
| `pengguna`      | id, nama, email, password, peran, timestamps                                        |
| `mahasiswa`     | id, pengguna_id, nim, prodi, fakultas, angkatan                                     |
| `kategori`      | id, nama, poin_maksimum                                                             |
| `kegiatan`      | id, kategori_id, judul, penyelenggara, tanggal_kegiatan, tingkat, poin              |
| `sertifikat`    | id, mahasiswa_id, kegiatan_id, berkas, status, pengguna_validator_id, catatan, poin |
| `portofolio`    | id, mahasiswa_id, total_poin                                                        |
| `skema_poin`    | id, kategori_id, tingkat, poin                                                      |
| `notifikasi`    | id, pengguna_id, judul, isi, sudah_dibaca                                           |
| `log_aktivitas` | id, pengguna_id, aktivitas, created_at                                              |

### Enum

**peran**

- admin
- mahasiswa

**status sertifikat**

- menunggu
- disetujui
- ditolak

> Tabel bawaan Laravel seperti `sessions`, `cache`, `jobs`, `failed_jobs`, dan lainnya tetap menggunakan konvensi framework.

---

# Ringkasan Modul

| Role                                      | Jumlah Modul |
| ----------------------------------------- | ------------ |
| Admin                                     | 10           |
| Mahasiswa                                 | 9            |
| Pendukung (Auth, Notifikasi, Log, Export) | 4            |
| **Total**                                 | **23**       |

> Modul Manajemen User dan Manajemen Mahasiswa tidak digunakan. Data pengguna dan mahasiswa dikelola melalui seeder atau integrasi SSO sehingga aplikasi lebih sederhana dan fokus pada proses bisnis.

---

# Fase Pengembangan

## Fase 0 — Fondasi

### Selesai

- [x] Bootstrap project Laravel 13
- [x] Template Bootstrap NiceAdmin
- [x] Auth Login
- [x] Guest Login (Development)
- [x] Middleware Role
- [x] Migration Database
- [x] Seeder Database
- [x] Dashboard Admin
- [x] Dashboard Mahasiswa
- [x] Dokumentasi Roadmap

---

## Fase 1 — Core Flow

> Fokus pada proses utama sistem, yaitu pengelolaan kategori dan kegiatan, pengunggahan sertifikat oleh mahasiswa, validasi oleh admin, perhitungan poin otomatis, serta penyusunan portofolio sebagai dasar penerbitan SKPI.

### 1.1 Manajemen Kategori dan Skema Poin

- [ ] CRUD kategori
- [ ] CRUD skema poin
- [ ] Validasi poin maksimum
- [ ] Seeder dan Factory

### 1.2 Manajemen Kegiatan

- [ ] CRUD kegiatan
- [ ] Relasi kategori
- [ ] Relasi skema poin
- [ ] Filter
- [ ] Pencarian
- [ ] Pagination

### 1.3 Upload Sertifikat

- [ ] Drag and Drop Upload
- [ ] Pilih kategori
- [ ] Input data kegiatan
- [ ] Upload PDF atau gambar
- [ ] Kompresi gambar otomatis
- [ ] Preview dokumen
- [ ] Progress upload
- [ ] Validasi Form Request
- [ ] Simpan ke Laravel Storage

### 1.4 Validasi Sertifikat

- [ ] Daftar pengajuan
- [ ] Detail pengajuan
- [ ] Preview dokumen
- [ ] Setujui
- [ ] Tolak
- [ ] Catatan validator
- [ ] Validasi massal
- [ ] Hitung poin otomatis
- [ ] Update portofolio
- [ ] Kirim notifikasi

### 1.5 Portofolio dan Poin

- [ ] Halaman poin
- [ ] Halaman portofolio
- [ ] Riwayat pengajuan
- [ ] Status validasi
- [ ] Pengajuan revisi

---

## Fase 2 — Pelaporan dan Export

> Fokus pada penyajian informasi, statistik, laporan, dan dokumen pendukung yang dibutuhkan oleh mahasiswa maupun admin.

- [ ] Dashboard statistik
- [ ] Grafik poin mahasiswa
- [ ] Top mahasiswa
- [ ] Laporan validasi
- [ ] Rekap poin fakultas
- [ ] Rekap poin program studi
- [ ] Export PDF portofolio
- [ ] Export Excel
- [ ] Rekap SKPI

---

## Fase 3 — Sistem dan Optimasi

> Fokus pada peningkatan performa, keamanan, kemudahan pengelolaan, dan pengalaman pengguna.

- [ ] Notifikasi dalam aplikasi
- [ ] Audit Trail
- [ ] Pengaturan sistem
- [ ] Cache dashboard
- [ ] Lazy Loading
- [ ] Thumbnail otomatis
- [ ] Backup database
- [ ] Dark Mode

---

## Fase 4 — Integrasi SSO

> Tahap akhir menghubungkan aplikasi dengan Single Sign On UKRI tanpa mengubah struktur database yang telah dibangun.

- [ ] OAuth2 Client
- [ ] Login menggunakan SSO UKRI
- [ ] Mapping role
- [ ] Session terpusat
- [ ] Logout terpusat

---

# Prioritas Pengembangan

```
Fase 0
    ↓
Fase 1
Core Flow
    ↓
Fase 2
Pelaporan dan Export
    ↓
Fase 3
Sistem dan Optimasi
    ↓
Fase 4
Integrasi SSO
```

---

# Ringkasan Fase

### Fase 1. Core Flow

Membangun proses utama sistem mulai dari pengelolaan kategori dan kegiatan, pengunggahan sertifikat oleh mahasiswa, validasi oleh admin, perhitungan poin otomatis, hingga penyusunan portofolio sebagai pendukung SKPI.

### Fase 2. Pelaporan dan Export

Menambahkan fitur pelaporan, statistik, rekapitulasi data, serta ekspor dokumen sehingga informasi dapat digunakan sebagai bahan evaluasi dan pendukung penerbitan SKPI.

### Fase 3. Sistem dan Optimasi

Meningkatkan kualitas aplikasi melalui fitur notifikasi, audit trail, pengaturan sistem, optimasi performa, backup database, dan peningkatan pengalaman pengguna.

### Fase 4. Integrasi SSO

Mengintegrasikan aplikasi dengan Single Sign On UKRI menggunakan OAuth2 sehingga pengguna dapat masuk menggunakan akun institusi tanpa mengubah struktur sistem yang telah dibangun.

---

# Akun Demo

| Peran     | Email                  | Password |
| --------- | ---------------------- | -------- |
| Admin     | admin@sikemah.ukri     | password |
| Mahasiswa | mahasiswa@sikemah.ukri | password |

---

# Menjalankan Project

```powershell
# Pastikan MySQL XAMPP aktif

cd d:\project\simantap\sikemah-ukri

php artisan migrate:fresh --seed

php artisan serve --host=127.0.0.1 --port=8001
```

Akses aplikasi

```
http://127.0.0.1:8001
```

---

Terakhir diperbarui: Juli 2026.
