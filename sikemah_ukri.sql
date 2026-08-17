-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 17, 2026 at 07:52 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.3.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sikemah_ukri`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('laravel-cache-20221310002|127.0.0.1', 'i:1;', 1786164731),
('laravel-cache-20221310002|127.0.0.1:timer', 'i:1786164731;', 1786164731),
('laravel-cache-dashboard-admin-statistik', 'a:6:{s:15:\"jumlahMahasiswa\";i:573;s:14:\"jumlahKategori\";i:3;s:14:\"jumlahKegiatan\";i:27;s:14:\"jumlahMenunggu\";i:0;s:15:\"jumlahDisetujui\";i:0;s:14:\"jumlahPengguna\";i:574;}', 1786970479),
('laravel-cache-data_master:prodi:40cd750bba9870f18aada2478b24840a', 'a:13:{i:0;a:5:{s:2:\"id\";i:1;s:10:\"nama_prodi\";s:18:\"Teknik Informatika\";s:9:\"is_active\";b:1;s:8:\"fakultas\";s:5:\"FIKSI\";s:7:\"kaprodi\";s:15:\"Ir. Yasri, M.T.\";}i:1;a:5:{s:2:\"id\";i:2;s:10:\"nama_prodi\";s:16:\"Sistem Informasi\";s:9:\"is_active\";b:1;s:8:\"fakultas\";s:5:\"FIKSI\";s:7:\"kaprodi\";s:25:\"Popon Dauni, S.T., M.Kom.\";}i:2;a:5:{s:2:\"id\";i:3;s:10:\"nama_prodi\";s:15:\"Teknik Industri\";s:9:\"is_active\";b:0;s:8:\"fakultas\";s:3:\"FTI\";s:7:\"kaprodi\";N;}i:3;a:5:{s:2:\"id\";i:5;s:10:\"nama_prodi\";s:15:\"Ilmu Komunikasi\";s:9:\"is_active\";b:0;s:8:\"fakultas\";s:5:\"FASOS\";s:7:\"kaprodi\";N;}i:4;a:5:{s:2:\"id\";i:9;s:10:\"nama_prodi\";s:14:\"Teknik Elektro\";s:9:\"is_active\";b:0;s:8:\"fakultas\";s:3:\"FTI\";s:7:\"kaprodi\";N;}i:5;a:5:{s:2:\"id\";i:10;s:10:\"nama_prodi\";s:12:\"Teknik Mesin\";s:9:\"is_active\";b:0;s:8:\"fakultas\";s:3:\"FTI\";s:7:\"kaprodi\";N;}i:6;a:5:{s:2:\"id\";i:11;s:10:\"nama_prodi\";s:17:\"Teknik Lingkungan\";s:9:\"is_active\";b:0;s:8:\"fakultas\";s:4:\"FTSP\";s:7:\"kaprodi\";N;}i:7;a:5:{s:2:\"id\";i:12;s:10:\"nama_prodi\";s:10:\"Arsitektur\";s:9:\"is_active\";b:0;s:8:\"fakultas\";s:4:\"FTSP\";s:7:\"kaprodi\";N;}i:8;a:5:{s:2:\"id\";i:13;s:10:\"nama_prodi\";s:14:\"Sastra Inggris\";s:9:\"is_active\";b:0;s:8:\"fakultas\";s:5:\"FASOS\";s:7:\"kaprodi\";N;}i:9;a:5:{s:2:\"id\";i:14;s:10:\"nama_prodi\";s:9:\"Managemen\";s:9:\"is_active\";b:0;s:8:\"fakultas\";s:2:\"FE\";s:7:\"kaprodi\";N;}i:10;a:5:{s:2:\"id\";i:15;s:10:\"nama_prodi\";s:14:\"Bisnis Digital\";s:9:\"is_active\";b:0;s:8:\"fakultas\";s:2:\"FE\";s:7:\"kaprodi\";N;}i:11;a:5:{s:2:\"id\";i:18;s:10:\"nama_prodi\";s:10:\"Matematika\";s:9:\"is_active\";b:0;s:8:\"fakultas\";s:5:\"FMIPA\";s:7:\"kaprodi\";N;}i:12;a:5:{s:2:\"id\";i:19;s:10:\"nama_prodi\";s:6:\"Fisika\";s:9:\"is_active\";b:0;s:8:\"fakultas\";s:5:\"FMIPA\";s:7:\"kaprodi\";N;}}', 1786113783);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` varchar(255) NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jenis`
--

CREATE TABLE `jenis` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `jenis_kegiatan_id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jenis`
--

INSERT INTO `jenis` (`id`, `jenis_kegiatan_id`, `nama`, `created_at`, `updated_at`) VALUES
(1, 1, 'Upacara Bendera', '2026-08-04 04:11:42', '2026-08-04 04:11:42'),
(2, 2, 'Penyajian Makalah dalam Pertemuan Ilmiah', '2026-08-04 04:11:42', '2026-08-04 04:11:42'),
(3, 3, 'Publikasi Ilmiah dalam Jurnal', '2026-08-04 04:11:44', '2026-08-04 04:11:44'),
(4, 4, 'Menulis Artikel di Media Massa', '2026-08-04 04:11:45', '2026-08-04 04:11:45'),
(5, 5, 'Workshop', '2026-08-04 04:11:45', '2026-08-04 04:11:45'),
(6, 5, 'Seminar', '2026-08-04 04:11:46', '2026-08-04 04:11:46'),
(7, 6, 'Kepedulian Sosial', '2026-08-04 04:11:47', '2026-08-04 04:11:47'),
(8, 6, 'Pengabdian Masyarakat', '2026-08-04 04:11:47', '2026-08-04 04:11:47'),
(9, 7, 'Bidang Ilmiah', '2026-08-04 04:11:48', '2026-08-04 04:11:48'),
(10, 7, 'Bidang Minat', '2026-08-04 04:11:50', '2026-08-04 04:11:50'),
(11, 8, 'Mata Kuliah', '2026-08-04 04:11:54', '2026-08-04 04:11:54'),
(12, 8, 'Praktikum', '2026-08-04 04:11:54', '2026-08-04 04:11:54'),
(13, 8, 'Mentor', '2026-08-04 04:11:55', '2026-08-04 04:11:55'),
(14, 9, 'Pameran', '2026-08-04 04:11:55', '2026-08-04 04:11:55'),
(15, 9, 'Fashion Show', '2026-08-04 04:11:56', '2026-08-04 04:11:56'),
(16, 10, 'Proyek Riset', '2026-08-04 04:11:57', '2026-08-04 04:11:57'),
(17, 11, 'Bekerja', '2026-08-04 04:11:57', '2026-08-04 04:11:57'),
(18, 12, 'BEM Universitas', '2026-08-04 04:11:58', '2026-08-04 04:11:58'),
(19, 12, 'DPM Universitas', '2026-08-04 04:11:58', '2026-08-04 04:11:58'),
(20, 13, 'BEM FIKSI', '2026-08-04 04:12:00', '2026-08-04 04:12:00'),
(21, 13, 'DPM FIKSI', '2026-08-04 04:12:01', '2026-08-04 04:12:01'),
(22, 14, 'HMPS Sistem Informasi', '2026-08-04 04:12:01', '2026-08-04 04:12:01'),
(23, 14, 'HMPS Bisnis Digital', '2026-08-04 04:12:02', '2026-08-04 04:12:02'),
(24, 15, 'Panitia Kegiatan Tingkat UKRI', '2026-08-04 04:12:02', '2026-08-04 04:12:02'),
(25, 16, 'Panitia Kegiatan Tingkat Provinsi', '2026-08-04 04:12:03', '2026-08-04 04:12:03'),
(26, 17, 'Panitia Kegiatan Tingkat Internasional', '2026-08-04 04:12:03', '2026-08-04 04:12:03'),
(27, 18, 'Panitia Kegiatan Tingkat Nasional', '2026-08-04 04:12:04', '2026-08-04 04:12:04'),
(28, 19, 'Unit Kegiatan Mahasiswa (UKM)', '2026-08-04 04:12:04', '2026-08-04 04:12:04'),
(29, 20, 'Peserta Pelatihan Kepemimpinan', '2026-08-04 04:12:05', '2026-08-04 04:12:05'),
(30, 21, 'Peserta Orientasi Mahasiswa Baru', '2026-08-04 04:12:06', '2026-08-04 04:12:06'),
(31, 22, 'Promosi UKRI', '2026-08-04 04:12:06', '2026-08-04 04:12:06'),
(32, 23, 'Organisasi Tingkat Nasional', '2026-08-04 04:12:07', '2026-08-04 04:12:07'),
(33, 24, 'Organisasi Tingkat Provinsi', '2026-08-04 04:12:08', '2026-08-04 04:12:08'),
(34, 25, 'Organisasi Tingkat Kabupaten', '2026-08-04 04:12:08', '2026-08-04 04:12:08'),
(35, 25, 'Organisasi Tingkat Kota', '2026-08-04 04:12:08', '2026-08-04 04:12:08'),
(36, 26, 'Organisasi Tingkat Kecamatan', '2026-08-04 04:12:08', '2026-08-04 04:12:08'),
(37, 27, 'Organisasi Tingkat RT', '2026-08-04 04:12:09', '2026-08-04 04:12:09'),
(38, 27, 'Organisasi Tingkat RW', '2026-08-04 04:12:09', '2026-08-04 04:12:09');

-- --------------------------------------------------------

--
-- Table structure for table `jenis_kegiatan`
--

CREATE TABLE `jenis_kegiatan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kategori_id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `dokumen` varchar(255) DEFAULT NULL,
  `periode_penilaian` varchar(255) DEFAULT NULL,
  `penilai` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jenis_kegiatan`
--

INSERT INTO `jenis_kegiatan` (`id`, `kategori_id`, `nama`, `dokumen`, `periode_penilaian`, `penilai`, `created_at`, `updated_at`) VALUES
(1, 1, 'Upacara Bendera', 'Daftar Hadir', 'Tiap Kegiatan', 'Wakil Dekan Bid. Kemahasiswaan FIKSI', '2026-08-04 04:11:41', '2026-08-04 04:11:41'),
(2, 1, 'Penyajian Makalah dalam Pertemuan Ilmiah', 'Sertifikat', 'Tiap Kegiatan', 'LPPM UKRI (unit Fakultas)', '2026-08-04 04:11:42', '2026-08-04 04:11:42'),
(3, 1, 'Publikasi Ilmiah dalam Jurnal', 'Jurnal', 'Tiap Jurnal', 'LPPM UKRI (unit Fakultas)', '2026-08-04 04:11:44', '2026-08-04 04:11:44'),
(4, 1, 'Menulis Artikel di Media Massa', 'Media Massa', 'Tiap Tulisan', 'Sekretaris Dekanat FIKSI', '2026-08-04 04:11:45', '2026-08-04 04:11:45'),
(5, 1, 'Peserta Aktif Pertemuan Ilmiah/Minat Bakat (Workshop/Seminar)', 'Sertifikat', 'Tiap Kegiatan', 'LPPM UKRI (unit Fakultas)', '2026-08-04 04:11:45', '2026-08-04 04:11:45'),
(6, 1, 'Kegiatan Kepedulian Sosial/Pengabdian Masyarakat', 'Sertifikat', 'Tiap Kegiatan', 'Wakil Dekan Bid. Kemahasiswaan FIKSI', '2026-08-04 04:11:47', '2026-08-04 04:11:47'),
(7, 1, 'Kompetisi Bidang Ilmiah/Minat', 'Sertifikat', 'Tiap Kegiatan', 'Wakil Dekan Bid. Kemahasiswaan FIKSI', '2026-08-04 04:11:48', '2026-08-04 04:11:48'),
(8, 1, 'Asisten Mata Kuliah/Praktikum/Mentor', 'SK Program Studi', 'Tiap Semester', 'Kepala Laboratorium FIKSI', '2026-08-04 04:11:53', '2026-08-04 04:11:53'),
(9, 1, 'Pameran/Fashion Show', 'Sertifikat', 'Tiap Kegiatan', 'Wakil Dekan Bid. Kemahasiswaan FIKSI', '2026-08-04 04:11:55', '2026-08-04 04:11:55'),
(10, 1, 'Proyek Riset', 'SK Direktur/Ketua LPPM', 'Tiap Kegiatan', 'LPPM UKRI (unit Fakultas)', '2026-08-04 04:11:56', '2026-08-04 04:11:56'),
(11, 1, 'Bekerja', 'Surat Keterangan Tempat Kerja', 'Tiap Kegiatan', 'Pusat Karir (CDC) UKRI', '2026-08-04 04:11:57', '2026-08-04 04:11:57'),
(12, 2, 'BEM / DPM Universitas', 'Sertifikat, SK Kepengurusan', 'Tiap Semester', 'Wakil Dekan Bid. Kemahasiswaan FIKSI', '2026-08-04 04:11:58', '2026-08-04 04:11:58'),
(13, 2, 'BEM / DPM FIKSI (Fakultas)', 'Sertifikat, SK Kepengurusan', 'Tiap Semester', 'Wakil Dekan Bid. Kemahasiswaan FIKSI', '2026-08-04 04:12:00', '2026-08-04 04:12:00'),
(14, 2, 'HMPS Sistem Informasi / HMPS Bisnis Digital', 'Sertifikat, SK Kepengurusan', 'Tiap Semester', 'Wakil Dekan Bid. Kemahasiswaan FIKSI', '2026-08-04 04:12:01', '2026-08-04 04:12:01'),
(15, 2, 'Panitia Kegiatan Tingkat UKRI', 'Sertifikat, SK Kepanitiaan', 'Tiap Kepanitiaan', 'Wakil Dekan Bid. Kemahasiswaan FIKSI', '2026-08-04 04:12:02', '2026-08-04 04:12:02'),
(16, 2, 'Panitia Kegiatan Tingkat Provinsi', 'Sertifikat, SK Kepanitiaan', 'Tiap Kepanitiaan', 'Wakil Dekan Bid. Kemahasiswaan FIKSI', '2026-08-04 04:12:03', '2026-08-04 04:12:03'),
(17, 2, 'Panitia Kegiatan Tingkat Internasional', 'Sertifikat, SK Kepanitiaan', 'Tiap Kepanitiaan', 'Wakil Dekan Bid. Kemahasiswaan FIKSI', '2026-08-04 04:12:03', '2026-08-04 04:12:03'),
(18, 2, 'Panitia Kegiatan Tingkat Nasional', 'Sertifikat, SK Kepanitiaan', 'Tiap Kepanitiaan', 'Wakil Dekan Bid. Kemahasiswaan FIKSI', '2026-08-04 04:12:04', '2026-08-04 04:12:04'),
(19, 2, 'Unit Kegiatan Mahasiswa (UKM)', 'Sertifikat, SK Kepanitiaan', 'Tiap Kepanitiaan', 'Wakil Dekan Bid. Kemahasiswaan FIKSI', '2026-08-04 04:12:04', '2026-08-04 04:12:04'),
(20, 2, 'Peserta Pelatihan Kepemimpinan', 'Sertifikat, SK Kepanitiaan', 'Tiap Kepanitiaan', 'Wakil Dekan Bid. Kemahasiswaan FIKSI', '2026-08-04 04:12:05', '2026-08-04 04:12:05'),
(21, 2, 'Peserta Orientasi Mahasiswa Baru', 'Sertifikat, SK Kepanitiaan', 'Tiap Kepanitiaan', 'Wakil Dekan Bid. Kemahasiswaan FIKSI', '2026-08-04 04:12:05', '2026-08-04 04:12:05'),
(22, 2, 'Promosi UKRI', 'Surat Tugas', 'Tiap Kegiatan', 'Humas & Marketing UKRI', '2026-08-04 04:12:06', '2026-08-04 04:12:06'),
(23, 3, 'Organisasi Tingkat Nasional', 'Sertifikat, Surat Keterangan, Piagam', 'Tiap Semester', 'Wakil Dekan Bid. Kemahasiswaan FIKSI', '2026-08-04 04:12:07', '2026-08-04 04:12:07'),
(24, 3, 'Organisasi Tingkat Provinsi', 'Sertifikat, Surat Keterangan, Piagam', 'Tiap Periode Kepengurusan', 'Wakil Dekan Bid. Kemahasiswaan FIKSI', '2026-08-04 04:12:07', '2026-08-04 04:12:07'),
(25, 3, 'Organisasi Tingkat Kabupaten/Kota', 'Sertifikat, Surat Keterangan, Piagam', 'Tiap Periode Kepengurusan', 'Wakil Dekan Bid. Kemahasiswaan FIKSI', '2026-08-04 04:12:08', '2026-08-04 04:12:08'),
(26, 3, 'Organisasi Tingkat Kecamatan', 'Sertifikat, Surat Keterangan, Piagam', 'Tiap Periode Kepengurusan', 'Wakil Dekan Bid. Kemahasiswaan FIKSI', '2026-08-04 04:12:08', '2026-08-04 04:12:08'),
(27, 3, 'Organisasi Tingkat RT/RW', 'Sertifikat, Surat Keterangan, Piagam', 'Tiap Periode Kepengurusan', 'Wakil Dekan Bid. Kemahasiswaan FIKSI', '2026-08-04 04:12:09', '2026-08-04 04:12:09');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` smallint(5) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `poin_maksimum` decimal(8,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id`, `nama`, `poin_maksimum`, `created_at`, `updated_at`) VALUES
(1, 'Tri Dharma Perguruan Tinggi', 30.00, '2026-08-04 04:11:41', '2026-08-04 04:11:41'),
(2, 'Organisasi Kemahasiswaan Internal UKRI', 25.00, '2026-08-04 04:11:57', '2026-08-04 04:11:57'),
(3, 'Organisasi Ekstra Kampus', 25.00, '2026-08-04 04:12:07', '2026-08-04 04:12:07');

-- --------------------------------------------------------

--
-- Table structure for table `log_aktivitas`
--

CREATE TABLE `log_aktivitas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pengguna_id` bigint(20) UNSIGNED NOT NULL,
  `aktivitas` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pengguna_id` bigint(20) UNSIGNED NOT NULL,
  `nim` varchar(255) NOT NULL,
  `prodi` varchar(255) NOT NULL,
  `fakultas` varchar(255) NOT NULL,
  `angkatan` varchar(255) NOT NULL,
  `sinkron_data_master_pada` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`id`, `pengguna_id`, `nim`, `prodi`, `fakultas`, `angkatan`, `sinkron_data_master_pada`, `created_at`, `updated_at`) VALUES
(5, 6, '20221310001', 'Teknik Informatika', 'FIKSI', '2022', '2026-08-07 01:55:42', '2026-08-07 01:55:42', '2026-08-07 01:55:42'),
(6, 7, '20221310003', 'Teknik Informatika', 'FIKSI', '2022', '2026-08-07 01:55:43', '2026-08-07 01:55:43', '2026-08-07 01:55:43'),
(7, 8, '20221310004', 'Teknik Informatika', 'FIKSI', '2022', '2026-08-07 01:55:44', '2026-08-07 01:55:44', '2026-08-07 01:55:44'),
(8, 9, '20221310005', 'Teknik Informatika', 'FIKSI', '2022', '2026-08-07 01:55:45', '2026-08-07 01:55:45', '2026-08-07 01:55:45'),
(9, 10, '20221310006', 'Teknik Informatika', 'FIKSI', '2022', '2026-08-07 01:55:45', '2026-08-07 01:55:45', '2026-08-07 01:55:45'),
(10, 11, '20221310007', 'Teknik Informatika', 'FIKSI', '2022', '2026-08-07 01:55:46', '2026-08-07 01:55:46', '2026-08-07 01:55:46'),
(11, 12, '20221310008', 'Teknik Informatika', 'FIKSI', '2022', '2026-08-07 01:55:46', '2026-08-07 01:55:46', '2026-08-07 01:55:46'),
(12, 13, '20221310009', 'Teknik Informatika', 'FIKSI', '2022', '2026-08-07 01:55:47', '2026-08-07 01:55:47', '2026-08-07 01:55:47'),
(13, 14, '20221310011', 'Teknik Informatika', 'FIKSI', '2022', '2026-08-07 01:55:48', '2026-08-07 01:55:48', '2026-08-07 01:55:48'),
(14, 15, '20221310012', 'Teknik Informatika', 'FIKSI', '2022', '2026-08-07 01:55:50', '2026-08-07 01:55:50', '2026-08-07 01:55:50'),
(15, 16, '20221310013', 'Teknik Informatika', 'FIKSI', '2022', '2026-08-07 01:55:50', '2026-08-07 01:55:50', '2026-08-07 01:55:50'),
(16, 17, '20221310014', 'Teknik Informatika', 'FIKSI', '2022', '2026-08-07 01:55:52', '2026-08-07 01:55:52', '2026-08-07 01:55:52'),
(17, 18, '20221310015', 'Teknik Informatika', 'FIKSI', '2022', '2026-08-07 01:55:53', '2026-08-07 01:55:53', '2026-08-07 01:55:53'),
(18, 19, '20221310018', 'Teknik Informatika', 'FIKSI', '2022', '2026-08-07 01:55:54', '2026-08-07 01:55:54', '2026-08-07 01:55:54'),
(19, 20, '20221310020', 'Teknik Informatika', 'FIKSI', '2022', '2026-08-07 01:55:55', '2026-08-07 01:55:55', '2026-08-07 01:55:55'),
(20, 21, '20221310022', 'Teknik Informatika', 'FIKSI', '2022', '2026-08-07 01:55:56', '2026-08-07 01:55:56', '2026-08-07 01:55:56'),
(21, 22, '20221310024', 'Teknik Informatika', 'FIKSI', '2022', '2026-08-07 01:55:57', '2026-08-07 01:55:57', '2026-08-07 01:55:57'),
(22, 23, '20221310025', 'Teknik Informatika', 'FIKSI', '2022', '2026-08-07 01:55:58', '2026-08-07 01:55:58', '2026-08-07 01:55:58'),
(23, 24, '20221310027', 'Teknik Informatika', 'FIKSI', '2022', '2026-08-07 01:55:59', '2026-08-07 01:55:59', '2026-08-07 01:55:59'),
(24, 25, '20221310028', 'Teknik Informatika', 'FIKSI', '2022', '2026-08-07 01:56:00', '2026-08-07 01:56:00', '2026-08-07 01:56:00'),
(25, 26, '20221310029', 'Teknik Informatika', 'FIKSI', '2022', '2026-08-07 01:56:01', '2026-08-07 01:56:01', '2026-08-07 01:56:01'),
(26, 27, '20221310031', 'Teknik Informatika', 'FIKSI', '2022', '2026-08-07 01:56:02', '2026-08-07 01:56:02', '2026-08-07 01:56:02'),
(27, 28, '20221310032', 'Teknik Informatika', 'FIKSI', '2022', '2026-08-07 01:56:03', '2026-08-07 01:56:03', '2026-08-07 01:56:03'),
(28, 29, '20221310033', 'Teknik Informatika', 'FIKSI', '2022', '2026-08-07 01:56:04', '2026-08-07 01:56:04', '2026-08-07 01:56:04'),
(29, 30, '20221310034', 'Teknik Informatika', 'FIKSI', '2022', '2026-08-07 01:56:05', '2026-08-07 01:56:05', '2026-08-07 01:56:05'),
(30, 31, '20221310035', 'Teknik Informatika', 'FIKSI', '2022', '2026-08-07 01:56:06', '2026-08-07 01:56:06', '2026-08-07 01:56:06'),
(31, 32, '20221310036', 'Teknik Informatika', 'FIKSI', '2022', '2026-08-07 01:56:07', '2026-08-07 01:56:07', '2026-08-07 01:56:07'),
(32, 33, '20221310037', 'Teknik Informatika', 'FIKSI', '2022', '2026-08-07 01:56:08', '2026-08-07 01:56:08', '2026-08-07 01:56:08'),
(33, 34, '20221310038', 'Teknik Informatika', 'FIKSI', '2022', '2026-08-07 01:56:09', '2026-08-07 01:56:09', '2026-08-07 01:56:09'),
(34, 35, '20221310039', 'Teknik Informatika', 'FIKSI', '2022', '2026-08-07 01:56:10', '2026-08-07 01:56:10', '2026-08-07 01:56:10'),
(35, 36, '20221310042', 'Teknik Informatika', 'FIKSI', '2022', '2026-08-07 01:56:12', '2026-08-07 01:56:12', '2026-08-07 01:56:12'),
(36, 37, '20221310043', 'Teknik Informatika', 'FIKSI', '2022', '2026-08-07 01:56:14', '2026-08-07 01:56:14', '2026-08-07 01:56:14'),
(37, 38, '20221310044', 'Teknik Informatika', 'FIKSI', '2022', '2026-08-07 01:56:15', '2026-08-07 01:56:15', '2026-08-07 01:56:15'),
(38, 39, '20221310045', 'Teknik Informatika', 'FIKSI', '2022', '2026-08-07 01:56:16', '2026-08-07 01:56:16', '2026-08-07 01:56:16'),
(39, 40, '20221310046', 'Teknik Informatika', 'FIKSI', '2022', '2026-08-07 01:56:17', '2026-08-07 01:56:17', '2026-08-07 01:56:17'),
(40, 41, '20221310063', 'Teknik Informatika', 'FIKSI', '2022', '2026-08-07 01:56:19', '2026-08-07 01:56:19', '2026-08-07 01:56:19'),
(41, 42, '20221310064', 'Teknik Informatika', 'FIKSI', '2022', '2026-08-07 01:56:20', '2026-08-07 01:56:20', '2026-08-07 01:56:20'),
(42, 43, '20221310066', 'Teknik Informatika', 'FIKSI', '2022', '2026-08-07 01:56:21', '2026-08-07 01:56:21', '2026-08-07 01:56:21'),
(43, 44, '20221310067', 'Teknik Informatika', 'FIKSI', '2022', '2026-08-07 01:56:22', '2026-08-07 01:56:22', '2026-08-07 01:56:22'),
(44, 45, '20221310068', 'Teknik Informatika', 'FIKSI', '2022', '2026-08-07 01:56:23', '2026-08-07 01:56:23', '2026-08-07 01:56:23'),
(45, 46, '20221310070', 'Teknik Informatika', 'FIKSI', '2022', '2026-08-07 01:56:24', '2026-08-07 01:56:24', '2026-08-07 01:56:24'),
(46, 47, '20221310071', 'Teknik Informatika', 'FIKSI', '2022', '2026-08-07 01:56:25', '2026-08-07 01:56:25', '2026-08-07 01:56:25'),
(47, 48, '20221310073', 'Teknik Informatika', 'FIKSI', '2022', '2026-08-07 01:56:25', '2026-08-07 01:56:25', '2026-08-07 01:56:25'),
(48, 49, '20221310074', 'Teknik Informatika', 'FIKSI', '2022', '2026-08-07 01:56:26', '2026-08-07 01:56:26', '2026-08-07 01:56:26'),
(49, 50, '20221310075', 'Teknik Informatika', 'FIKSI', '2022', '2026-08-07 01:56:27', '2026-08-07 01:56:27', '2026-08-07 01:56:27'),
(50, 51, '20221310078', 'Teknik Informatika', 'FIKSI', '2022', '2026-08-07 01:56:28', '2026-08-07 01:56:28', '2026-08-07 01:56:28'),
(51, 52, '20221310079', 'Teknik Informatika', 'FIKSI', '2022', '2026-08-07 01:56:29', '2026-08-07 01:56:29', '2026-08-07 01:56:29'),
(52, 53, '20221310081', 'Teknik Informatika', 'FIKSI', '2022', '2026-08-07 01:56:30', '2026-08-07 01:56:30', '2026-08-07 01:56:30'),
(53, 54, '20221310082', 'Teknik Informatika', 'FIKSI', '2022', '2026-08-07 01:56:31', '2026-08-07 01:56:31', '2026-08-07 01:56:31'),
(54, 55, '20221310083', 'Teknik Informatika', 'FIKSI', '2022', '2026-08-07 01:56:32', '2026-08-07 01:56:32', '2026-08-07 01:56:32'),
(55, 56, '20221310084', 'Teknik Informatika', 'FIKSI', '2022', '2026-08-07 01:56:33', '2026-08-07 01:56:33', '2026-08-07 01:56:33'),
(56, 57, '20221310085', 'Teknik Informatika', 'FIKSI', '2022', '2026-08-07 01:56:34', '2026-08-07 01:56:34', '2026-08-07 01:56:34'),
(57, 58, '20221310086', 'Teknik Informatika', 'FIKSI', '2022', '2026-08-07 01:56:34', '2026-08-07 01:56:34', '2026-08-07 01:56:34'),
(58, 59, '20221310087', 'Teknik Informatika', 'FIKSI', '2022', '2026-08-07 01:56:35', '2026-08-07 01:56:35', '2026-08-07 01:56:35'),
(59, 60, '20221310088', 'Teknik Informatika', 'FIKSI', '2022', '2026-08-07 01:56:36', '2026-08-07 01:56:36', '2026-08-07 01:56:36'),
(60, 61, '20221310089', 'Teknik Informatika', 'FIKSI', '2022', '2026-08-07 01:56:37', '2026-08-07 01:56:37', '2026-08-07 01:56:37'),
(61, 62, '20221310090', 'Teknik Informatika', 'FIKSI', '2022', '2026-08-07 01:56:38', '2026-08-07 01:56:38', '2026-08-07 01:56:38'),
(62, 63, '20221310093', 'Teknik Informatika', 'FIKSI', '2022', '2026-08-07 01:56:39', '2026-08-07 01:56:39', '2026-08-07 01:56:39'),
(63, 64, '20221310094', 'Teknik Informatika', 'FIKSI', '2022', '2026-08-07 01:56:40', '2026-08-07 01:56:40', '2026-08-07 01:56:40'),
(64, 65, '20221310098', 'Teknik Informatika', 'FIKSI', '2022', '2026-08-07 01:56:41', '2026-08-07 01:56:41', '2026-08-07 01:56:41'),
(65, 66, '20221310099', 'Teknik Informatika', 'FIKSI', '2022', '2026-08-07 01:56:42', '2026-08-07 01:56:42', '2026-08-07 01:56:42'),
(66, 67, '20221310101', 'Teknik Informatika', 'FIKSI', '2022', '2026-08-07 01:56:43', '2026-08-07 01:56:43', '2026-08-07 01:56:43'),
(67, 68, '20221310102', 'Teknik Informatika', 'FIKSI', '2022', '2026-08-07 01:56:44', '2026-08-07 01:56:44', '2026-08-07 01:56:44'),
(68, 69, '20221310104', 'Teknik Informatika', 'FIKSI', '2022', '2026-08-07 01:56:45', '2026-08-07 01:56:45', '2026-08-07 01:56:45'),
(69, 70, '20221310105', 'Teknik Informatika', 'FIKSI', '2022', '2026-08-07 01:56:46', '2026-08-07 01:56:46', '2026-08-07 01:56:46'),
(70, 71, '20221310106', 'Teknik Informatika', 'FIKSI', '2022', '2026-08-07 01:56:47', '2026-08-07 01:56:47', '2026-08-07 01:56:47'),
(71, 72, '20221310107', 'Teknik Informatika', 'FIKSI', '2022', '2026-08-07 01:56:48', '2026-08-07 01:56:48', '2026-08-07 01:56:48'),
(72, 73, '20221310115', 'Teknik Informatika', 'FIKSI', '2022', '2026-08-07 01:56:48', '2026-08-07 01:56:48', '2026-08-07 01:56:48'),
(73, 74, '20221310117', 'Teknik Informatika', 'FIKSI', '2022', '2026-08-07 01:56:49', '2026-08-07 01:56:49', '2026-08-07 01:56:49'),
(74, 75, '20221310119', 'Teknik Informatika', 'FIKSI', '2022', '2026-08-07 01:56:50', '2026-08-07 01:56:50', '2026-08-07 01:56:50'),
(75, 76, '20221310120', 'Teknik Informatika', 'FIKSI', '2022', '2026-08-07 01:56:50', '2026-08-07 01:56:50', '2026-08-07 01:56:50'),
(76, 77, '20221310123', 'Teknik Informatika', 'FIKSI', '2022', '2026-08-07 01:56:51', '2026-08-07 01:56:51', '2026-08-07 01:56:51'),
(77, 78, '20221310124', 'Teknik Informatika', 'FIKSI', '2022', '2026-08-07 01:56:52', '2026-08-07 01:56:52', '2026-08-07 01:56:52'),
(78, 79, '20191310029', 'Teknik Informatika', 'FIKSI', '2019', '2026-08-07 01:56:53', '2026-08-07 01:56:53', '2026-08-07 01:56:53'),
(79, 80, '20191310038', 'Teknik Informatika', 'FIKSI', '2019', '2026-08-07 01:56:54', '2026-08-07 01:56:54', '2026-08-07 01:56:54'),
(80, 81, '20211310019', 'Teknik Informatika', 'FIKSI', '2021', '2026-08-07 01:56:54', '2026-08-07 01:56:54', '2026-08-07 01:56:54'),
(81, 82, '20211310021', 'Teknik Informatika', 'FIKSI', '2021', '2026-08-07 01:56:55', '2026-08-07 01:56:55', '2026-08-07 01:56:55'),
(82, 83, '20211310031', 'Teknik Informatika', 'FIKSI', '2021', '2026-08-07 01:56:56', '2026-08-07 01:56:56', '2026-08-07 01:56:56'),
(83, 84, '20211310032', 'Teknik Informatika', 'FIKSI', '2021', '2026-08-07 01:56:57', '2026-08-07 01:56:57', '2026-08-07 01:56:57'),
(84, 85, '20211310036', 'Teknik Informatika', 'FIKSI', '2021', '2026-08-07 01:56:58', '2026-08-07 01:56:58', '2026-08-07 01:56:58'),
(85, 86, '20211310037', 'Teknik Informatika', 'FIKSI', '2021', '2026-08-07 01:56:59', '2026-08-07 01:56:59', '2026-08-07 01:56:59'),
(86, 87, '20211310046', 'Teknik Informatika', 'FIKSI', '2021', '2026-08-07 01:56:59', '2026-08-07 01:56:59', '2026-08-07 01:56:59'),
(87, 88, '20211310052', 'Teknik Informatika', 'FIKSI', '2021', '2026-08-07 01:57:00', '2026-08-07 01:57:00', '2026-08-07 01:57:00'),
(88, 89, '20211310054', 'Teknik Informatika', 'FIKSI', '2021', '2026-08-07 01:57:01', '2026-08-07 01:57:01', '2026-08-07 01:57:01'),
(89, 90, '20211310055', 'Teknik Informatika', 'FIKSI', '2021', '2026-08-07 01:57:02', '2026-08-07 01:57:02', '2026-08-07 01:57:02'),
(90, 91, '20211310058', 'Teknik Informatika', 'FIKSI', '2021', '2026-08-07 01:57:03', '2026-08-07 01:57:03', '2026-08-07 01:57:03'),
(91, 92, '20211310061', 'Teknik Informatika', 'FIKSI', '2021', '2026-08-07 01:57:03', '2026-08-07 01:57:03', '2026-08-07 01:57:03'),
(92, 93, '20211310071', 'Teknik Informatika', 'FIKSI', '2021', '2026-08-07 01:57:04', '2026-08-07 01:57:04', '2026-08-07 01:57:04'),
(93, 94, '20211310072', 'Teknik Informatika', 'FIKSI', '2021', '2026-08-07 01:57:05', '2026-08-07 01:57:05', '2026-08-07 01:57:05'),
(94, 95, '20211310087', 'Teknik Informatika', 'FIKSI', '2021', '2026-08-07 01:57:06', '2026-08-07 01:57:06', '2026-08-07 01:57:06'),
(95, 96, '20211310088', 'Teknik Informatika', 'FIKSI', '2021', '2026-08-07 01:57:07', '2026-08-07 01:57:07', '2026-08-07 01:57:07'),
(96, 97, '20211310092', 'Teknik Informatika', 'FIKSI', '2021', '2026-08-07 01:57:08', '2026-08-07 01:57:08', '2026-08-07 01:57:08'),
(97, 98, '20211310093', 'Teknik Informatika', 'FIKSI', '2021', '2026-08-07 01:57:08', '2026-08-07 01:57:08', '2026-08-07 01:57:08'),
(98, 99, '20221310019', 'Teknik Informatika', 'FIKSI', '2022', '2026-08-07 01:57:09', '2026-08-07 01:57:09', '2026-08-07 01:57:09'),
(99, 100, '20231310002', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:57:10', '2026-08-07 01:57:10', '2026-08-07 01:57:10'),
(100, 101, '20231310004', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:57:11', '2026-08-07 01:57:11', '2026-08-07 01:57:11'),
(101, 102, '20231310005', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:57:12', '2026-08-07 01:57:12', '2026-08-07 01:57:12'),
(102, 103, '20231310006', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:57:13', '2026-08-07 01:57:13', '2026-08-07 01:57:13'),
(103, 104, '20231310007', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:57:14', '2026-08-07 01:57:14', '2026-08-07 01:57:14'),
(104, 105, '20231310008', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:57:14', '2026-08-07 01:57:14', '2026-08-07 01:57:14'),
(105, 106, '20231310009', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:57:15', '2026-08-07 01:57:15', '2026-08-07 01:57:15'),
(106, 107, '20231310011', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:57:16', '2026-08-07 01:57:16', '2026-08-07 01:57:16'),
(107, 108, '20231310012', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:57:17', '2026-08-07 01:57:17', '2026-08-07 01:57:17'),
(108, 109, '20231310013', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:57:18', '2026-08-07 01:57:18', '2026-08-07 01:57:18'),
(109, 110, '20231310014', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:57:19', '2026-08-07 01:57:19', '2026-08-07 01:57:19'),
(110, 111, '20231310015', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:57:20', '2026-08-07 01:57:20', '2026-08-07 01:57:20'),
(111, 112, '20231310016', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:57:21', '2026-08-07 01:57:21', '2026-08-07 01:57:21'),
(112, 113, '20231310017', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:57:22', '2026-08-07 01:57:22', '2026-08-07 01:57:22'),
(113, 114, '20231310018', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:57:22', '2026-08-07 01:57:22', '2026-08-07 01:57:22'),
(114, 115, '20231310019', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:57:23', '2026-08-07 01:57:23', '2026-08-07 01:57:23'),
(115, 116, '20231310020', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:57:25', '2026-08-07 01:57:25', '2026-08-07 01:57:25'),
(116, 117, '20231310021', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:57:26', '2026-08-07 01:57:26', '2026-08-07 01:57:26'),
(117, 118, '20231310022', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:57:27', '2026-08-07 01:57:27', '2026-08-07 01:57:27'),
(118, 119, '20231310023', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:57:27', '2026-08-07 01:57:27', '2026-08-07 01:57:27'),
(119, 120, '20231310024', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:57:28', '2026-08-07 01:57:28', '2026-08-07 01:57:28'),
(120, 121, '20231310025', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:57:30', '2026-08-07 01:57:30', '2026-08-07 01:57:30'),
(121, 122, '20231310026', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:57:31', '2026-08-07 01:57:31', '2026-08-07 01:57:31'),
(122, 123, '20231310027', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:57:32', '2026-08-07 01:57:32', '2026-08-07 01:57:32'),
(123, 124, '20231310028', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:57:33', '2026-08-07 01:57:33', '2026-08-07 01:57:33'),
(124, 125, '20231310030', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:57:34', '2026-08-07 01:57:34', '2026-08-07 01:57:34'),
(125, 126, '20231310031', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:57:35', '2026-08-07 01:57:35', '2026-08-07 01:57:35'),
(126, 127, '20231310032', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:57:36', '2026-08-07 01:57:36', '2026-08-07 01:57:36'),
(127, 128, '20231310033', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:57:37', '2026-08-07 01:57:37', '2026-08-07 01:57:37'),
(128, 129, '20231310034', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:57:38', '2026-08-07 01:57:38', '2026-08-07 01:57:38'),
(129, 130, '20231310035', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:57:38', '2026-08-07 01:57:38', '2026-08-07 01:57:38'),
(130, 131, '20231310036', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:57:39', '2026-08-07 01:57:39', '2026-08-07 01:57:39'),
(131, 132, '20231310037', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:57:40', '2026-08-07 01:57:40', '2026-08-07 01:57:40'),
(132, 133, '20231310038', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:57:41', '2026-08-07 01:57:41', '2026-08-07 01:57:41'),
(133, 134, '20231310039', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:57:42', '2026-08-07 01:57:42', '2026-08-07 01:57:42'),
(134, 135, '20231310040', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:57:44', '2026-08-07 01:57:44', '2026-08-07 01:57:44'),
(135, 136, '20231310041', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:57:47', '2026-08-07 01:57:47', '2026-08-07 01:57:47'),
(136, 137, '20231310042', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:57:48', '2026-08-07 01:57:48', '2026-08-07 01:57:48'),
(137, 138, '20231310043', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:57:49', '2026-08-07 01:57:49', '2026-08-07 01:57:49'),
(138, 139, '20231310044', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:57:50', '2026-08-07 01:57:50', '2026-08-07 01:57:50'),
(139, 140, '20231310045', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:57:50', '2026-08-07 01:57:50', '2026-08-07 01:57:50'),
(140, 141, '20231310046', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:57:51', '2026-08-07 01:57:51', '2026-08-07 01:57:51'),
(141, 142, '20231310047', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:57:52', '2026-08-07 01:57:52', '2026-08-07 01:57:52'),
(142, 143, '20231310048', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:57:53', '2026-08-07 01:57:53', '2026-08-07 01:57:53'),
(143, 144, '20231310049', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:57:54', '2026-08-07 01:57:54', '2026-08-07 01:57:54'),
(144, 145, '20231310050', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:57:55', '2026-08-07 01:57:55', '2026-08-07 01:57:55'),
(145, 146, '20231310051', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:57:56', '2026-08-07 01:57:56', '2026-08-07 01:57:56'),
(146, 147, '20231310052', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:57:57', '2026-08-07 01:57:57', '2026-08-07 01:57:57'),
(147, 148, '20231310053', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:57:57', '2026-08-07 01:57:57', '2026-08-07 01:57:57'),
(148, 149, '20231310054', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:57:58', '2026-08-07 01:57:58', '2026-08-07 01:57:58'),
(149, 150, '20231310055', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:57:59', '2026-08-07 01:57:59', '2026-08-07 01:57:59'),
(150, 151, '20231310056', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:58:00', '2026-08-07 01:58:00', '2026-08-07 01:58:00'),
(151, 152, '20231310058', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:58:01', '2026-08-07 01:58:01', '2026-08-07 01:58:01'),
(152, 153, '20231310059', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:58:02', '2026-08-07 01:58:02', '2026-08-07 01:58:02'),
(153, 154, '20231310061', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:58:03', '2026-08-07 01:58:03', '2026-08-07 01:58:03'),
(154, 155, '20231310062', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:58:04', '2026-08-07 01:58:04', '2026-08-07 01:58:04'),
(155, 156, '20231310063', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:58:05', '2026-08-07 01:58:05', '2026-08-07 01:58:05'),
(156, 157, '20231310064', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:58:06', '2026-08-07 01:58:06', '2026-08-07 01:58:06'),
(157, 158, '20231310066', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:58:06', '2026-08-07 01:58:06', '2026-08-07 01:58:06'),
(158, 159, '20231310067', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:58:07', '2026-08-07 01:58:07', '2026-08-07 01:58:07'),
(159, 160, '20231310070', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:58:08', '2026-08-07 01:58:08', '2026-08-07 01:58:08'),
(160, 161, '20231310072', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:58:09', '2026-08-07 01:58:09', '2026-08-07 01:58:09'),
(161, 162, '20231310073', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:58:10', '2026-08-07 01:58:10', '2026-08-07 01:58:10'),
(162, 163, '20231310074', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:58:11', '2026-08-07 01:58:11', '2026-08-07 01:58:11'),
(163, 164, '20231310075', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:58:12', '2026-08-07 01:58:12', '2026-08-07 01:58:12'),
(164, 165, '20231310077', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:58:13', '2026-08-07 01:58:13', '2026-08-07 01:58:13'),
(165, 166, '20231310078', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:58:13', '2026-08-07 01:58:13', '2026-08-07 01:58:13'),
(166, 167, '20231310079', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:58:14', '2026-08-07 01:58:14', '2026-08-07 01:58:14'),
(167, 168, '20231310080', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:58:15', '2026-08-07 01:58:15', '2026-08-07 01:58:15'),
(168, 169, '20231310081', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:58:16', '2026-08-07 01:58:16', '2026-08-07 01:58:16'),
(169, 170, '20231310082', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:58:17', '2026-08-07 01:58:17', '2026-08-07 01:58:17'),
(170, 171, '20231310083', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:58:18', '2026-08-07 01:58:18', '2026-08-07 01:58:18'),
(171, 172, '20231310084', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:58:19', '2026-08-07 01:58:19', '2026-08-07 01:58:19'),
(172, 173, '20231310085', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:58:20', '2026-08-07 01:58:20', '2026-08-07 01:58:20'),
(173, 174, '20231310086', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:58:20', '2026-08-07 01:58:20', '2026-08-07 01:58:20'),
(174, 175, '20231310088', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:58:21', '2026-08-07 01:58:21', '2026-08-07 01:58:21'),
(175, 176, '20231310089', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:58:22', '2026-08-07 01:58:22', '2026-08-07 01:58:22'),
(176, 177, '20231310090', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:58:23', '2026-08-07 01:58:23', '2026-08-07 01:58:23'),
(177, 178, '20231310092', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:58:24', '2026-08-07 01:58:24', '2026-08-07 01:58:24'),
(178, 179, '20231310093', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:58:25', '2026-08-07 01:58:25', '2026-08-07 01:58:25'),
(179, 180, '20231310094', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:58:26', '2026-08-07 01:58:26', '2026-08-07 01:58:26'),
(180, 181, '20231310095', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:58:27', '2026-08-07 01:58:27', '2026-08-07 01:58:27'),
(181, 182, '20231310096', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:58:29', '2026-08-07 01:58:29', '2026-08-07 01:58:29'),
(182, 183, '20231310097', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:58:30', '2026-08-07 01:58:30', '2026-08-07 01:58:30'),
(183, 184, '20231310098', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:58:30', '2026-08-07 01:58:30', '2026-08-07 01:58:30'),
(184, 185, '20231310099', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:58:31', '2026-08-07 01:58:31', '2026-08-07 01:58:31'),
(185, 186, '20231310100', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:58:32', '2026-08-07 01:58:32', '2026-08-07 01:58:32'),
(186, 187, '20231310101', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:58:33', '2026-08-07 01:58:33', '2026-08-07 01:58:33'),
(187, 188, '20231310102', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:58:35', '2026-08-07 01:58:35', '2026-08-07 01:58:35'),
(188, 189, '20231310103', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:58:36', '2026-08-07 01:58:36', '2026-08-07 01:58:36'),
(189, 190, '20231310104', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:58:37', '2026-08-07 01:58:37', '2026-08-07 01:58:37'),
(190, 191, '20231310106', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:58:38', '2026-08-07 01:58:38', '2026-08-07 01:58:38'),
(191, 192, '20231310107', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:58:39', '2026-08-07 01:58:39', '2026-08-07 01:58:39'),
(192, 193, '20231310108', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:58:40', '2026-08-07 01:58:40', '2026-08-07 01:58:40'),
(193, 194, '20231310109', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:58:41', '2026-08-07 01:58:41', '2026-08-07 01:58:41'),
(194, 195, '20231310110', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:58:42', '2026-08-07 01:58:42', '2026-08-07 01:58:42'),
(195, 196, '20231310111', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:58:43', '2026-08-07 01:58:43', '2026-08-07 01:58:43'),
(196, 197, '20231310112', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 01:58:44', '2026-08-07 01:58:44', '2026-08-07 01:58:44'),
(197, 198, '20241310001', 'Teknik Informatika', 'FIKSI', '2024', '2026-08-07 01:58:45', '2026-08-07 01:58:45', '2026-08-07 01:58:45'),
(198, 199, '20241310002', 'Teknik Informatika', 'FIKSI', '2024', '2026-08-07 01:58:46', '2026-08-07 01:58:46', '2026-08-07 01:58:46'),
(199, 200, '20241310003', 'Teknik Informatika', 'FIKSI', '2024', '2026-08-07 01:58:47', '2026-08-07 01:58:47', '2026-08-07 01:58:47'),
(200, 201, '20241310004', 'Teknik Informatika', 'FIKSI', '2024', '2026-08-07 01:58:47', '2026-08-07 01:58:47', '2026-08-07 01:58:47'),
(201, 202, '20241310005', 'Teknik Informatika', 'FIKSI', '2024', '2026-08-07 01:58:48', '2026-08-07 01:58:48', '2026-08-07 01:58:48'),
(202, 203, '20241310006', 'Teknik Informatika', 'FIKSI', '2024', '2026-08-07 01:58:49', '2026-08-07 01:58:49', '2026-08-07 01:58:49'),
(203, 204, '20241310007', 'Teknik Informatika', 'FIKSI', '2024', '2026-08-07 01:58:50', '2026-08-07 01:58:50', '2026-08-07 01:58:50'),
(204, 205, '20241310008', 'Teknik Informatika', 'FIKSI', '2024', '2026-08-07 01:58:51', '2026-08-07 01:58:51', '2026-08-07 01:58:51'),
(205, 206, '20241310009', 'Teknik Informatika', 'FIKSI', '2024', '2026-08-07 01:58:52', '2026-08-07 01:58:52', '2026-08-07 01:58:52'),
(206, 207, '20241310010', 'Teknik Informatika', 'FIKSI', '2024', '2026-08-07 01:58:53', '2026-08-07 01:58:53', '2026-08-07 01:58:53'),
(207, 208, '20241310011', 'Teknik Informatika', 'FIKSI', '2024', '2026-08-07 01:58:54', '2026-08-07 01:58:54', '2026-08-07 01:58:54'),
(208, 209, '20241310012', 'Teknik Informatika', 'FIKSI', '2024', '2026-08-07 01:58:55', '2026-08-07 01:58:55', '2026-08-07 01:58:55'),
(209, 210, '20241310013', 'Teknik Informatika', 'FIKSI', '2024', '2026-08-07 01:58:56', '2026-08-07 01:58:56', '2026-08-07 01:58:56'),
(210, 211, '20241310014', 'Teknik Informatika', 'FIKSI', '2024', '2026-08-07 01:58:57', '2026-08-07 01:58:57', '2026-08-07 01:58:57'),
(211, 212, '20241310015', 'Teknik Informatika', 'FIKSI', '2024', '2026-08-07 01:58:57', '2026-08-07 01:58:57', '2026-08-07 01:58:57'),
(212, 213, '20241310016', 'Teknik Informatika', 'FIKSI', '2024', '2026-08-07 01:58:58', '2026-08-07 01:58:58', '2026-08-07 01:58:58'),
(213, 214, '20241310017', 'Teknik Informatika', 'FIKSI', '2024', '2026-08-07 01:58:59', '2026-08-07 01:58:59', '2026-08-07 01:58:59'),
(214, 215, '20241310018', 'Teknik Informatika', 'FIKSI', '2024', '2026-08-07 01:59:00', '2026-08-07 01:59:00', '2026-08-07 01:59:00'),
(215, 216, '20241310019', 'Teknik Informatika', 'FIKSI', '2024', '2026-08-07 01:59:01', '2026-08-07 01:59:01', '2026-08-07 01:59:01'),
(216, 217, '20241310020', 'Teknik Informatika', 'FIKSI', '2024', '2026-08-07 01:59:01', '2026-08-07 01:59:01', '2026-08-07 01:59:01'),
(217, 218, '20241310021', 'Teknik Informatika', 'FIKSI', '2024', '2026-08-07 01:59:02', '2026-08-07 01:59:02', '2026-08-07 01:59:02'),
(218, 219, '20241310022', 'Teknik Informatika', 'FIKSI', '2024', '2026-08-07 01:59:03', '2026-08-07 01:59:03', '2026-08-07 01:59:03'),
(219, 220, '20241310023', 'Teknik Informatika', 'FIKSI', '2024', '2026-08-07 01:59:05', '2026-08-07 01:59:05', '2026-08-07 01:59:05'),
(220, 221, '20241310024', 'Teknik Informatika', 'FIKSI', '2024', '2026-08-07 01:59:05', '2026-08-07 01:59:05', '2026-08-07 01:59:05'),
(221, 222, '20241310025', 'Teknik Informatika', 'FIKSI', '2024', '2026-08-07 01:59:06', '2026-08-07 01:59:06', '2026-08-07 01:59:06'),
(222, 223, '20241310026', 'Teknik Informatika', 'FIKSI', '2024', '2026-08-07 01:59:07', '2026-08-07 01:59:07', '2026-08-07 01:59:07'),
(223, 224, '20241310027', 'Teknik Informatika', 'FIKSI', '2024', '2026-08-07 01:59:09', '2026-08-07 01:59:09', '2026-08-07 01:59:09'),
(224, 225, '20241310028', 'Teknik Informatika', 'FIKSI', '2024', '2026-08-07 01:59:10', '2026-08-07 01:59:10', '2026-08-07 01:59:10'),
(225, 226, '20241310029', 'Teknik Informatika', 'FIKSI', '2024', '2026-08-07 01:59:11', '2026-08-07 01:59:11', '2026-08-07 01:59:11'),
(226, 227, '20241310030', 'Teknik Informatika', 'FIKSI', '2024', '2026-08-07 01:59:13', '2026-08-07 01:59:13', '2026-08-07 01:59:13'),
(227, 228, '20241310031', 'Teknik Informatika', 'FIKSI', '2024', '2026-08-07 01:59:13', '2026-08-07 01:59:13', '2026-08-07 01:59:13'),
(228, 229, '20241310032', 'Teknik Informatika', 'FIKSI', '2024', '2026-08-07 01:59:14', '2026-08-07 01:59:14', '2026-08-07 01:59:14'),
(229, 230, '20241310033', 'Teknik Informatika', 'FIKSI', '2024', '2026-08-07 01:59:16', '2026-08-07 01:59:16', '2026-08-07 01:59:16'),
(230, 231, '20241310034', 'Teknik Informatika', 'FIKSI', '2024', '2026-08-07 01:59:19', '2026-08-07 01:59:19', '2026-08-07 01:59:19'),
(231, 232, '20241310035', 'Teknik Informatika', 'FIKSI', '2024', '2026-08-07 01:59:20', '2026-08-07 01:59:20', '2026-08-07 01:59:20'),
(232, 233, '20241310036', 'Teknik Informatika', 'FIKSI', '2024', '2026-08-07 01:59:21', '2026-08-07 01:59:21', '2026-08-07 01:59:21'),
(233, 234, '20241310037', 'Teknik Informatika', 'FIKSI', '2024', '2026-08-07 01:59:22', '2026-08-07 01:59:22', '2026-08-07 01:59:22'),
(234, 235, '20241310038', 'Teknik Informatika', 'FIKSI', '2024', '2026-08-07 01:59:23', '2026-08-07 01:59:23', '2026-08-07 01:59:23'),
(235, 236, '20241310039', 'Teknik Informatika', 'FIKSI', '2024', '2026-08-07 01:59:24', '2026-08-07 01:59:24', '2026-08-07 01:59:24'),
(236, 237, '20241310040', 'Teknik Informatika', 'FIKSI', '2024', '2026-08-07 01:59:25', '2026-08-07 01:59:25', '2026-08-07 01:59:25'),
(237, 238, '20241310041', 'Teknik Informatika', 'FIKSI', '2024', '2026-08-07 01:59:26', '2026-08-07 01:59:26', '2026-08-07 01:59:26'),
(238, 239, '20241310042', 'Teknik Informatika', 'FIKSI', '2024', '2026-08-07 01:59:26', '2026-08-07 01:59:26', '2026-08-07 01:59:26'),
(239, 240, '20241310043', 'Teknik Informatika', 'FIKSI', '2024', '2026-08-07 01:59:27', '2026-08-07 01:59:27', '2026-08-07 01:59:27'),
(240, 241, '20241310044', 'Teknik Informatika', 'FIKSI', '2024', '2026-08-07 01:59:28', '2026-08-07 01:59:28', '2026-08-07 01:59:28'),
(241, 242, '20241310045', 'Teknik Informatika', 'FIKSI', '2024', '2026-08-07 01:59:29', '2026-08-07 01:59:29', '2026-08-07 01:59:29'),
(242, 243, '20241310046', 'Teknik Informatika', 'FIKSI', '2024', '2026-08-07 01:59:30', '2026-08-07 01:59:30', '2026-08-07 01:59:30'),
(243, 244, '20241310047', 'Teknik Informatika', 'FIKSI', '2024', '2026-08-07 01:59:31', '2026-08-07 01:59:31', '2026-08-07 01:59:31'),
(244, 245, '20241310048', 'Teknik Informatika', 'FIKSI', '2024', '2026-08-07 01:59:32', '2026-08-07 01:59:32', '2026-08-07 01:59:32'),
(245, 246, '20241310049', 'Teknik Informatika', 'FIKSI', '2024', '2026-08-07 01:59:34', '2026-08-07 01:59:34', '2026-08-07 01:59:34'),
(246, 247, '20241310051', 'Teknik Informatika', 'FIKSI', '2024', '2026-08-07 01:59:35', '2026-08-07 01:59:35', '2026-08-07 01:59:35'),
(247, 248, '20241310052', 'Teknik Informatika', 'FIKSI', '2024', '2026-08-07 01:59:36', '2026-08-07 01:59:36', '2026-08-07 01:59:36'),
(248, 249, '20241310053', 'Teknik Informatika', 'FIKSI', '2024', '2026-08-07 01:59:37', '2026-08-07 01:59:37', '2026-08-07 01:59:37'),
(249, 250, '20241310055', 'Teknik Informatika', 'FIKSI', '2024', '2026-08-07 01:59:38', '2026-08-07 01:59:38', '2026-08-07 01:59:38'),
(250, 251, '20181310048', 'Teknik Informatika', 'FIKSI', '2018', '2026-08-07 01:59:39', '2026-08-07 01:59:39', '2026-08-07 01:59:39'),
(251, 252, '20251310001', 'Teknik Informatika', 'FIKSI', '2025', '2026-08-07 01:59:40', '2026-08-07 01:59:40', '2026-08-07 01:59:40'),
(252, 253, '20251310002', 'Teknik Informatika', 'FIKSI', '2025', '2026-08-07 01:59:41', '2026-08-07 01:59:41', '2026-08-07 01:59:41'),
(253, 254, '20251310003', 'Teknik Informatika', 'FIKSI', '2025', '2026-08-07 01:59:42', '2026-08-07 01:59:42', '2026-08-07 01:59:42'),
(254, 255, '20251310004', 'Teknik Informatika', 'FIKSI', '2025', '2026-08-07 01:59:43', '2026-08-07 01:59:43', '2026-08-07 01:59:43'),
(255, 256, '20251310005', 'Teknik Informatika', 'FIKSI', '2025', '2026-08-07 01:59:44', '2026-08-07 01:59:44', '2026-08-07 01:59:44'),
(256, 257, '20251310006', 'Teknik Informatika', 'FIKSI', '2025', '2026-08-07 01:59:45', '2026-08-07 01:59:45', '2026-08-07 01:59:45'),
(257, 258, '20251310007', 'Teknik Informatika', 'FIKSI', '2025', '2026-08-07 01:59:46', '2026-08-07 01:59:46', '2026-08-07 01:59:46'),
(258, 259, '20251310008', 'Teknik Informatika', 'FIKSI', '2025', '2026-08-07 01:59:47', '2026-08-07 01:59:47', '2026-08-07 01:59:47'),
(259, 260, '20251310009', 'Teknik Informatika', 'FIKSI', '2025', '2026-08-07 01:59:48', '2026-08-07 01:59:48', '2026-08-07 01:59:48'),
(260, 261, '20251310010', 'Teknik Informatika', 'FIKSI', '2025', '2026-08-07 01:59:49', '2026-08-07 01:59:49', '2026-08-07 01:59:49'),
(261, 262, '20251310011', 'Teknik Informatika', 'FIKSI', '2025', '2026-08-07 01:59:50', '2026-08-07 01:59:50', '2026-08-07 01:59:50'),
(262, 263, '20251310012', 'Teknik Informatika', 'FIKSI', '2025', '2026-08-07 01:59:51', '2026-08-07 01:59:51', '2026-08-07 01:59:51'),
(263, 264, '20251310013', 'Teknik Informatika', 'FIKSI', '2025', '2026-08-07 01:59:52', '2026-08-07 01:59:52', '2026-08-07 01:59:52'),
(264, 265, '20251310014', 'Teknik Informatika', 'FIKSI', '2025', '2026-08-07 01:59:52', '2026-08-07 01:59:52', '2026-08-07 01:59:52'),
(265, 266, '20251310015', 'Teknik Informatika', 'FIKSI', '2025', '2026-08-07 01:59:53', '2026-08-07 01:59:53', '2026-08-07 01:59:53'),
(266, 267, '20251310016', 'Teknik Informatika', 'FIKSI', '2025', '2026-08-07 01:59:54', '2026-08-07 01:59:54', '2026-08-07 01:59:54'),
(267, 268, '20251310017', 'Teknik Informatika', 'FIKSI', '2025', '2026-08-07 01:59:55', '2026-08-07 01:59:55', '2026-08-07 01:59:55'),
(268, 269, '20251310018', 'Teknik Informatika', 'FIKSI', '2025', '2026-08-07 01:59:56', '2026-08-07 01:59:56', '2026-08-07 01:59:56'),
(269, 270, '20251310019', 'Teknik Informatika', 'FIKSI', '2025', '2026-08-07 01:59:57', '2026-08-07 01:59:57', '2026-08-07 01:59:57'),
(270, 271, '20251310020', 'Teknik Informatika', 'FIKSI', '2025', '2026-08-07 01:59:57', '2026-08-07 01:59:57', '2026-08-07 01:59:57'),
(271, 272, '20251310021', 'Teknik Informatika', 'FIKSI', '2025', '2026-08-07 01:59:58', '2026-08-07 01:59:58', '2026-08-07 01:59:58'),
(272, 273, '20251310022', 'Teknik Informatika', 'FIKSI', '2025', '2026-08-07 01:59:59', '2026-08-07 01:59:59', '2026-08-07 01:59:59'),
(273, 274, '20251310023', 'Teknik Informatika', 'FIKSI', '2025', '2026-08-07 01:59:59', '2026-08-07 01:59:59', '2026-08-07 01:59:59'),
(274, 275, '20251310024', 'Teknik Informatika', 'FIKSI', '2025', '2026-08-07 02:00:00', '2026-08-07 02:00:00', '2026-08-07 02:00:00'),
(275, 276, '20251310025', 'Teknik Informatika', 'FIKSI', '2025', '2026-08-07 02:00:01', '2026-08-07 02:00:01', '2026-08-07 02:00:01'),
(276, 277, '20251310026', 'Teknik Informatika', 'FIKSI', '2025', '2026-08-07 02:00:02', '2026-08-07 02:00:02', '2026-08-07 02:00:02'),
(277, 278, '20251310027', 'Teknik Informatika', 'FIKSI', '2025', '2026-08-07 02:00:02', '2026-08-07 02:00:02', '2026-08-07 02:00:02'),
(278, 279, '20251310029', 'Teknik Informatika', 'FIKSI', '2025', '2026-08-07 02:00:03', '2026-08-07 02:00:03', '2026-08-07 02:00:03'),
(279, 280, '20251310030', 'Teknik Informatika', 'FIKSI', '2025', '2026-08-07 02:00:04', '2026-08-07 02:00:04', '2026-08-07 02:00:04'),
(280, 281, '20251310031', 'Teknik Informatika', 'FIKSI', '2025', '2026-08-07 02:00:05', '2026-08-07 02:00:05', '2026-08-07 02:00:05'),
(281, 282, '20251310032', 'Teknik Informatika', 'FIKSI', '2025', '2026-08-07 02:00:05', '2026-08-07 02:00:05', '2026-08-07 02:00:05'),
(282, 283, '20251310033', 'Teknik Informatika', 'FIKSI', '2025', '2026-08-07 02:00:06', '2026-08-07 02:00:06', '2026-08-07 02:00:06'),
(283, 284, '20251310034', 'Teknik Informatika', 'FIKSI', '2025', '2026-08-07 02:00:07', '2026-08-07 02:00:07', '2026-08-07 02:00:07'),
(284, 285, '20251310035', 'Teknik Informatika', 'FIKSI', '2025', '2026-08-07 02:00:07', '2026-08-07 02:00:07', '2026-08-07 02:00:07'),
(285, 286, '20251310036', 'Teknik Informatika', 'FIKSI', '2025', '2026-08-07 02:00:08', '2026-08-07 02:00:08', '2026-08-07 02:00:08'),
(286, 287, '20251310037', 'Teknik Informatika', 'FIKSI', '2025', '2026-08-07 02:00:09', '2026-08-07 02:00:09', '2026-08-07 02:00:09'),
(287, 288, '20251310038', 'Teknik Informatika', 'FIKSI', '2025', '2026-08-07 02:00:10', '2026-08-07 02:00:10', '2026-08-07 02:00:10'),
(288, 289, '20251310039', 'Teknik Informatika', 'FIKSI', '2025', '2026-08-07 02:00:11', '2026-08-07 02:00:11', '2026-08-07 02:00:11'),
(289, 290, '20251310040', 'Teknik Informatika', 'FIKSI', '2025', '2026-08-07 02:00:11', '2026-08-07 02:00:11', '2026-08-07 02:00:11'),
(290, 291, '20251310041', 'Teknik Informatika', 'FIKSI', '2025', '2026-08-07 02:00:12', '2026-08-07 02:00:12', '2026-08-07 02:00:12'),
(291, 292, '20251310042', 'Teknik Informatika', 'FIKSI', '2025', '2026-08-07 02:00:13', '2026-08-07 02:00:13', '2026-08-07 02:00:13'),
(292, 293, '20251310043', 'Teknik Informatika', 'FIKSI', '2025', '2026-08-07 02:00:13', '2026-08-07 02:00:13', '2026-08-07 02:00:13'),
(293, 294, '20251310044', 'Teknik Informatika', 'FIKSI', '2025', '2026-08-07 02:00:14', '2026-08-07 02:00:14', '2026-08-07 02:00:14'),
(294, 295, '20251310045', 'Teknik Informatika', 'FIKSI', '2025', '2026-08-07 02:00:15', '2026-08-07 02:00:15', '2026-08-07 02:00:15'),
(295, 296, '20251310046', 'Teknik Informatika', 'FIKSI', '2025', '2026-08-07 02:00:16', '2026-08-07 02:00:16', '2026-08-07 02:00:16'),
(296, 297, '20251310047', 'Teknik Informatika', 'FIKSI', '2025', '2026-08-07 02:00:17', '2026-08-07 02:00:17', '2026-08-07 02:00:17'),
(297, 298, '20251310050', 'Teknik Informatika', 'FIKSI', '2025', '2026-08-07 02:00:17', '2026-08-07 02:00:17', '2026-08-07 02:00:17'),
(298, 299, '20251310051', 'Teknik Informatika', 'FIKSI', '2025', '2026-08-07 02:00:18', '2026-08-07 02:00:18', '2026-08-07 02:00:18'),
(299, 300, '20251310052', 'Teknik Informatika', 'FIKSI', '2025', '2026-08-07 02:00:19', '2026-08-07 02:00:19', '2026-08-07 02:00:19'),
(300, 301, '20251310053', 'Teknik Informatika', 'FIKSI', '2025', '2026-08-07 02:00:20', '2026-08-07 02:00:20', '2026-08-07 02:00:20'),
(301, 302, '20251310054', 'Teknik Informatika', 'FIKSI', '2025', '2026-08-07 02:00:21', '2026-08-07 02:00:21', '2026-08-07 02:00:21'),
(302, 303, '20251310055', 'Teknik Informatika', 'FIKSI', '2025', '2026-08-07 02:00:22', '2026-08-07 02:00:22', '2026-08-07 02:00:22'),
(303, 304, '20251310056', 'Teknik Informatika', 'FIKSI', '2025', '2026-08-07 02:00:23', '2026-08-07 02:00:23', '2026-08-07 02:00:23'),
(304, 305, '20251310057', 'Teknik Informatika', 'FIKSI', '2025', '2026-08-07 02:00:24', '2026-08-07 02:00:24', '2026-08-07 02:00:24'),
(305, 306, '20251310058', 'Teknik Informatika', 'FIKSI', '2025', '2026-08-07 02:00:26', '2026-08-07 02:00:26', '2026-08-07 02:00:26'),
(306, 307, '20251310059', 'Teknik Informatika', 'FIKSI', '2025', '2026-08-07 02:00:28', '2026-08-07 02:00:28', '2026-08-07 02:00:28'),
(307, 308, '20251310060', 'Teknik Informatika', 'FIKSI', '2025', '2026-08-07 02:00:29', '2026-08-07 02:00:29', '2026-08-07 02:00:29'),
(308, 309, '20251310061', 'Teknik Informatika', 'FIKSI', '2025', '2026-08-07 02:00:30', '2026-08-07 02:00:30', '2026-08-07 02:00:30'),
(309, 310, '20251310062', 'Teknik Informatika', 'FIKSI', '2025', '2026-08-07 02:00:32', '2026-08-07 02:00:32', '2026-08-07 02:00:32'),
(310, 311, '20251310063', 'Teknik Informatika', 'FIKSI', '2025', '2026-08-07 02:00:33', '2026-08-07 02:00:33', '2026-08-07 02:00:33'),
(311, 312, '20251310065', 'Teknik Informatika', 'FIKSI', '2025', '2026-08-07 02:00:34', '2026-08-07 02:00:34', '2026-08-07 02:00:34'),
(312, 313, '20251310066', 'Teknik Informatika', 'FIKSI', '2025', '2026-08-07 02:00:35', '2026-08-07 02:00:35', '2026-08-07 02:00:35'),
(313, 314, '20251310067', 'Teknik Informatika', 'FIKSI', '2025', '2026-08-07 02:00:36', '2026-08-07 02:00:36', '2026-08-07 02:00:36'),
(314, 315, '20251310068', 'Teknik Informatika', 'FIKSI', '2025', '2026-08-07 02:00:37', '2026-08-07 02:00:37', '2026-08-07 02:00:37'),
(315, 316, '20251310069', 'Teknik Informatika', 'FIKSI', '2025', '2026-08-07 02:00:38', '2026-08-07 02:00:38', '2026-08-07 02:00:38'),
(316, 317, '20251310070', 'Teknik Informatika', 'FIKSI', '2025', '2026-08-07 02:00:39', '2026-08-07 02:00:39', '2026-08-07 02:00:39'),
(317, 318, '20251310071', 'Teknik Informatika', 'FIKSI', '2025', '2026-08-07 02:00:41', '2026-08-07 02:00:41', '2026-08-07 02:00:41'),
(318, 319, '20251310072', 'Teknik Informatika', 'FIKSI', '2025', '2026-08-07 02:00:42', '2026-08-07 02:00:42', '2026-08-07 02:00:42'),
(319, 320, '20251310073', 'Teknik Informatika', 'FIKSI', '2025', '2026-08-07 02:00:43', '2026-08-07 02:00:43', '2026-08-07 02:00:43'),
(320, 321, '20251310074', 'Teknik Informatika', 'FIKSI', '2025', '2026-08-07 02:00:44', '2026-08-07 02:00:44', '2026-08-07 02:00:44'),
(321, 322, '20251310075', 'Teknik Informatika', 'FIKSI', '2025', '2026-08-07 02:00:45', '2026-08-07 02:00:45', '2026-08-07 02:00:45'),
(322, 323, '20251310076', 'Teknik Informatika', 'FIKSI', '2025', '2026-08-07 02:00:45', '2026-08-07 02:00:45', '2026-08-07 02:00:45'),
(323, 324, '20251310077', 'Teknik Informatika', 'FIKSI', '2025', '2026-08-07 02:00:46', '2026-08-07 02:00:46', '2026-08-07 02:00:46'),
(324, 325, '20251310078', 'Teknik Informatika', 'FIKSI', '2025', '2026-08-07 02:00:48', '2026-08-07 02:00:48', '2026-08-07 02:00:48'),
(325, 326, '20251310079', 'Teknik Informatika', 'FIKSI', '2025', '2026-08-07 02:00:48', '2026-08-07 02:00:48', '2026-08-07 02:00:48'),
(326, 327, '20251310080', 'Teknik Informatika', 'FIKSI', '2025', '2026-08-07 02:00:49', '2026-08-07 02:00:49', '2026-08-07 02:00:49'),
(327, 328, '20251310081', 'Teknik Informatika', 'FIKSI', '2025', '2026-08-07 02:00:50', '2026-08-07 02:00:50', '2026-08-07 02:00:50'),
(328, 329, '20251310082', 'Teknik Informatika', 'FIKSI', '2025', '2026-08-07 02:00:51', '2026-08-07 02:00:51', '2026-08-07 02:00:51'),
(329, 330, '20251310083', 'Teknik Informatika', 'FIKSI', '2025', '2026-08-07 02:00:52', '2026-08-07 02:00:52', '2026-08-07 02:00:52'),
(330, 331, '20251310085', 'Teknik Informatika', 'FIKSI', '2025', '2026-08-07 02:00:53', '2026-08-07 02:00:53', '2026-08-07 02:00:53'),
(331, 332, '20251310086', 'Teknik Informatika', 'FIKSI', '2025', '2026-08-07 02:00:54', '2026-08-07 02:00:54', '2026-08-07 02:00:54'),
(332, 333, '20251310087', 'Teknik Informatika', 'FIKSI', '2025', '2026-08-07 02:00:55', '2026-08-07 02:00:55', '2026-08-07 02:00:55'),
(333, 334, '20251310088', 'Teknik Informatika', 'FIKSI', '2025', '2026-08-07 02:00:55', '2026-08-07 02:00:55', '2026-08-07 02:00:55'),
(334, 335, '20251310089', 'Teknik Informatika', 'FIKSI', '2025', '2026-08-07 02:00:57', '2026-08-07 02:00:57', '2026-08-07 02:00:57'),
(335, 336, '20251310090', 'Teknik Informatika', 'FIKSI', '2025', '2026-08-07 02:00:57', '2026-08-07 02:00:57', '2026-08-07 02:00:57'),
(336, 337, '20251310091', 'Teknik Informatika', 'FIKSI', '2025', '2026-08-07 02:00:59', '2026-08-07 02:00:59', '2026-08-07 02:00:59'),
(337, 338, '20251310093', 'Teknik Informatika', 'FIKSI', '2025', '2026-08-07 02:00:59', '2026-08-07 02:00:59', '2026-08-07 02:00:59'),
(338, 339, '20251310094', 'Teknik Informatika', 'FIKSI', '2025', '2026-08-07 02:01:01', '2026-08-07 02:01:01', '2026-08-07 02:01:01'),
(339, 340, '20251310095', 'Teknik Informatika', 'FIKSI', '2025', '2026-08-07 02:01:02', '2026-08-07 02:01:02', '2026-08-07 02:01:02'),
(340, 341, '20251310064', 'Teknik Informatika', 'FIKSI', '2025', '2026-08-07 02:01:03', '2026-08-07 02:01:03', '2026-08-07 02:01:03'),
(341, 342, '20251310084', 'Teknik Informatika', 'FIKSI', '2025', '2026-08-07 02:01:04', '2026-08-07 02:01:04', '2026-08-07 02:01:04'),
(342, 343, '20211320021', 'Sistem Informasi', 'FIKSI', '2021', '2026-08-07 02:01:05', '2026-08-07 02:01:05', '2026-08-07 02:01:05'),
(343, 344, '20211320036', 'Sistem Informasi', 'FIKSI', '2021', '2026-08-07 02:01:06', '2026-08-07 02:01:06', '2026-08-07 02:01:06'),
(344, 345, '20221320002', 'Sistem Informasi', 'FIKSI', '2022', '2026-08-07 02:01:07', '2026-08-07 02:01:07', '2026-08-07 02:01:07'),
(345, 346, '20221320003', 'Sistem Informasi', 'FIKSI', '2022', '2026-08-07 02:01:07', '2026-08-07 02:01:07', '2026-08-07 02:01:07'),
(346, 347, '20221320004', 'Sistem Informasi', 'FIKSI', '2022', '2026-08-07 02:01:08', '2026-08-07 02:01:08', '2026-08-07 02:01:08'),
(347, 348, '20221320005', 'Sistem Informasi', 'FIKSI', '2022', '2026-08-07 02:01:09', '2026-08-07 02:01:09', '2026-08-07 02:01:09'),
(348, 349, '20221320006', 'Sistem Informasi', 'FIKSI', '2022', '2026-08-07 02:01:10', '2026-08-07 02:01:10', '2026-08-07 02:01:10'),
(349, 350, '20221320007', 'Sistem Informasi', 'FIKSI', '2022', '2026-08-07 02:01:11', '2026-08-07 02:01:11', '2026-08-07 02:01:11'),
(350, 351, '20221320008', 'Sistem Informasi', 'FIKSI', '2022', '2026-08-07 02:01:12', '2026-08-07 02:01:12', '2026-08-07 02:01:12'),
(351, 352, '20221320009', 'Sistem Informasi', 'FIKSI', '2022', '2026-08-07 02:01:13', '2026-08-07 02:01:13', '2026-08-07 02:01:13'),
(352, 353, '20221320010', 'Sistem Informasi', 'FIKSI', '2022', '2026-08-07 02:01:14', '2026-08-07 02:01:14', '2026-08-07 02:01:14'),
(353, 354, '20221320011', 'Sistem Informasi', 'FIKSI', '2022', '2026-08-07 02:01:15', '2026-08-07 02:01:15', '2026-08-07 02:01:15'),
(354, 355, '20221320012', 'Sistem Informasi', 'FIKSI', '2022', '2026-08-07 02:01:15', '2026-08-07 02:01:15', '2026-08-07 02:01:15'),
(355, 356, '20221320013', 'Sistem Informasi', 'FIKSI', '2022', '2026-08-07 02:01:17', '2026-08-07 02:01:17', '2026-08-07 02:01:17'),
(356, 357, '20221320015', 'Sistem Informasi', 'FIKSI', '2022', '2026-08-07 02:01:17', '2026-08-07 02:01:17', '2026-08-07 02:01:17'),
(357, 358, '20221320016', 'Sistem Informasi', 'FIKSI', '2022', '2026-08-07 02:01:18', '2026-08-07 02:01:18', '2026-08-07 02:01:18'),
(358, 359, '20221320017', 'Sistem Informasi', 'FIKSI', '2022', '2026-08-07 02:01:19', '2026-08-07 02:01:19', '2026-08-07 02:01:19'),
(359, 360, '20221320019', 'Sistem Informasi', 'FIKSI', '2022', '2026-08-07 02:01:20', '2026-08-07 02:01:20', '2026-08-07 02:01:20'),
(360, 361, '20221320020', 'Sistem Informasi', 'FIKSI', '2022', '2026-08-07 02:01:21', '2026-08-07 02:01:21', '2026-08-07 02:01:21'),
(361, 362, '20221320021', 'Sistem Informasi', 'FIKSI', '2022', '2026-08-07 02:01:22', '2026-08-07 02:01:22', '2026-08-07 02:01:22'),
(362, 363, '20221320022', 'Sistem Informasi', 'FIKSI', '2022', '2026-08-07 02:01:22', '2026-08-07 02:01:22', '2026-08-07 02:01:22'),
(363, 364, '20221320023', 'Sistem Informasi', 'FIKSI', '2022', '2026-08-07 02:01:24', '2026-08-07 02:01:24', '2026-08-07 02:01:24'),
(364, 365, '20221320027', 'Sistem Informasi', 'FIKSI', '2022', '2026-08-07 02:01:25', '2026-08-07 02:01:25', '2026-08-07 02:01:25'),
(365, 366, '20221320028', 'Sistem Informasi', 'FIKSI', '2022', '2026-08-07 02:01:25', '2026-08-07 02:01:25', '2026-08-07 02:01:25'),
(366, 367, '20221320030', 'Sistem Informasi', 'FIKSI', '2022', '2026-08-07 02:01:27', '2026-08-07 02:01:27', '2026-08-07 02:01:27'),
(367, 368, '20221320031', 'Sistem Informasi', 'FIKSI', '2022', '2026-08-07 02:01:27', '2026-08-07 02:01:27', '2026-08-07 02:01:27'),
(368, 369, '20221320033', 'Sistem Informasi', 'FIKSI', '2022', '2026-08-07 02:01:28', '2026-08-07 02:01:28', '2026-08-07 02:01:28'),
(369, 370, '20221320035', 'Sistem Informasi', 'FIKSI', '2022', '2026-08-07 02:01:29', '2026-08-07 02:01:29', '2026-08-07 02:01:29'),
(370, 371, '20221320036', 'Sistem Informasi', 'FIKSI', '2022', '2026-08-07 02:01:30', '2026-08-07 02:01:30', '2026-08-07 02:01:30'),
(371, 372, '20221320037', 'Sistem Informasi', 'FIKSI', '2022', '2026-08-07 02:01:31', '2026-08-07 02:01:31', '2026-08-07 02:01:31'),
(372, 373, '20221320038', 'Sistem Informasi', 'FIKSI', '2022', '2026-08-07 02:01:33', '2026-08-07 02:01:33', '2026-08-07 02:01:33'),
(373, 374, '20231320001', 'Sistem Informasi', 'FIKSI', '2023', '2026-08-07 02:01:34', '2026-08-07 02:01:34', '2026-08-07 02:01:34'),
(374, 375, '20231320002', 'Sistem Informasi', 'FIKSI', '2023', '2026-08-07 02:01:35', '2026-08-07 02:01:35', '2026-08-07 02:01:35'),
(375, 376, '20231320003', 'Sistem Informasi', 'FIKSI', '2023', '2026-08-07 02:01:36', '2026-08-07 02:01:36', '2026-08-07 02:01:36'),
(376, 377, '20231320004', 'Sistem Informasi', 'FIKSI', '2023', '2026-08-07 02:01:37', '2026-08-07 02:01:37', '2026-08-07 02:01:37'),
(377, 378, '20231320005', 'Sistem Informasi', 'FIKSI', '2023', '2026-08-07 02:01:38', '2026-08-07 02:01:38', '2026-08-07 02:01:38'),
(378, 379, '20231320006', 'Sistem Informasi', 'FIKSI', '2023', '2026-08-07 02:01:39', '2026-08-07 02:01:39', '2026-08-07 02:01:39'),
(379, 380, '20231320007', 'Sistem Informasi', 'FIKSI', '2023', '2026-08-07 02:01:40', '2026-08-07 02:01:40', '2026-08-07 02:01:40'),
(380, 381, '20231320008', 'Sistem Informasi', 'FIKSI', '2023', '2026-08-07 02:01:41', '2026-08-07 02:01:41', '2026-08-07 02:01:41');
INSERT INTO `mahasiswa` (`id`, `pengguna_id`, `nim`, `prodi`, `fakultas`, `angkatan`, `sinkron_data_master_pada`, `created_at`, `updated_at`) VALUES
(381, 382, '20231320010', 'Sistem Informasi', 'FIKSI', '2023', '2026-08-07 02:01:42', '2026-08-07 02:01:42', '2026-08-07 02:01:42'),
(382, 383, '20231320011', 'Sistem Informasi', 'FIKSI', '2023', '2026-08-07 02:01:43', '2026-08-07 02:01:43', '2026-08-07 02:01:43'),
(383, 384, '20231320012', 'Sistem Informasi', 'FIKSI', '2023', '2026-08-07 02:01:44', '2026-08-07 02:01:44', '2026-08-07 02:01:44'),
(384, 385, '20231320013', 'Sistem Informasi', 'FIKSI', '2023', '2026-08-07 02:01:47', '2026-08-07 02:01:47', '2026-08-07 02:01:47'),
(385, 386, '20231320014', 'Sistem Informasi', 'FIKSI', '2023', '2026-08-07 02:01:51', '2026-08-07 02:01:51', '2026-08-07 02:01:51'),
(386, 387, '20231320015', 'Sistem Informasi', 'FIKSI', '2023', '2026-08-07 02:01:55', '2026-08-07 02:01:55', '2026-08-07 02:01:55'),
(387, 388, '20231320016', 'Sistem Informasi', 'FIKSI', '2023', '2026-08-07 02:01:56', '2026-08-07 02:01:56', '2026-08-07 02:01:56'),
(388, 389, '20231320017', 'Sistem Informasi', 'FIKSI', '2023', '2026-08-07 02:02:00', '2026-08-07 02:02:00', '2026-08-07 02:02:00'),
(389, 390, '20231320019', 'Sistem Informasi', 'FIKSI', '2023', '2026-08-07 02:02:01', '2026-08-07 02:02:01', '2026-08-07 02:02:01'),
(390, 391, '20231320020', 'Sistem Informasi', 'FIKSI', '2023', '2026-08-07 02:02:02', '2026-08-07 02:02:02', '2026-08-07 02:02:02'),
(391, 392, '20231320023', 'Sistem Informasi', 'FIKSI', '2023', '2026-08-07 02:02:03', '2026-08-07 02:02:03', '2026-08-07 02:02:03'),
(392, 393, '20231320024', 'Sistem Informasi', 'FIKSI', '2023', '2026-08-07 02:02:04', '2026-08-07 02:02:04', '2026-08-07 02:02:04'),
(393, 394, '20231320025', 'Sistem Informasi', 'FIKSI', '2023', '2026-08-07 02:02:05', '2026-08-07 02:02:05', '2026-08-07 02:02:05'),
(394, 395, '20231320026', 'Sistem Informasi', 'FIKSI', '2023', '2026-08-07 02:02:09', '2026-08-07 02:02:09', '2026-08-07 02:02:09'),
(395, 396, '20231320027', 'Sistem Informasi', 'FIKSI', '2023', '2026-08-07 02:02:10', '2026-08-07 02:02:10', '2026-08-07 02:02:10'),
(396, 397, '20231320028', 'Sistem Informasi', 'FIKSI', '2023', '2026-08-07 02:02:11', '2026-08-07 02:02:11', '2026-08-07 02:02:11'),
(397, 398, '20231320029', 'Sistem Informasi', 'FIKSI', '2023', '2026-08-07 02:02:12', '2026-08-07 02:02:12', '2026-08-07 02:02:12'),
(398, 399, '20231320030', 'Sistem Informasi', 'FIKSI', '2023', '2026-08-07 02:02:13', '2026-08-07 02:02:13', '2026-08-07 02:02:13'),
(399, 400, '20231320032', 'Sistem Informasi', 'FIKSI', '2023', '2026-08-07 02:02:14', '2026-08-07 02:02:14', '2026-08-07 02:02:14'),
(400, 401, '20231320035', 'Sistem Informasi', 'FIKSI', '2023', '2026-08-07 02:02:16', '2026-08-07 02:02:16', '2026-08-07 02:02:16'),
(401, 402, '20231320037', 'Sistem Informasi', 'FIKSI', '2023', '2026-08-07 02:02:17', '2026-08-07 02:02:17', '2026-08-07 02:02:17'),
(402, 403, '20231320038', 'Sistem Informasi', 'FIKSI', '2023', '2026-08-07 02:02:18', '2026-08-07 02:02:18', '2026-08-07 02:02:18'),
(403, 404, '20231320040', 'Sistem Informasi', 'FIKSI', '2023', '2026-08-07 02:02:19', '2026-08-07 02:02:19', '2026-08-07 02:02:19'),
(404, 405, '20231320041', 'Sistem Informasi', 'FIKSI', '2023', '2026-08-07 02:02:20', '2026-08-07 02:02:20', '2026-08-07 02:02:20'),
(405, 406, '20231320042', 'Sistem Informasi', 'FIKSI', '2023', '2026-08-07 02:02:21', '2026-08-07 02:02:21', '2026-08-07 02:02:21'),
(406, 407, '20231320043', 'Sistem Informasi', 'FIKSI', '2023', '2026-08-07 02:02:22', '2026-08-07 02:02:22', '2026-08-07 02:02:22'),
(407, 408, '20231320044', 'Sistem Informasi', 'FIKSI', '2023', '2026-08-07 02:02:23', '2026-08-07 02:02:23', '2026-08-07 02:02:23'),
(408, 409, '20241320001', 'Sistem Informasi', 'FIKSI', '2024', '2026-08-07 02:02:24', '2026-08-07 02:02:24', '2026-08-07 02:02:24'),
(409, 410, '20241320002', 'Sistem Informasi', 'FIKSI', '2024', '2026-08-07 02:02:25', '2026-08-07 02:02:25', '2026-08-07 02:02:25'),
(410, 411, '20241320003', 'Sistem Informasi', 'FIKSI', '2024', '2026-08-07 02:02:26', '2026-08-07 02:02:26', '2026-08-07 02:02:26'),
(411, 412, '20241320004', 'Sistem Informasi', 'FIKSI', '2024', '2026-08-07 02:02:27', '2026-08-07 02:02:27', '2026-08-07 02:02:27'),
(412, 413, '20241320005', 'Sistem Informasi', 'FIKSI', '2024', '2026-08-07 02:02:28', '2026-08-07 02:02:28', '2026-08-07 02:02:28'),
(413, 414, '20241320006', 'Sistem Informasi', 'FIKSI', '2024', '2026-08-07 02:02:29', '2026-08-07 02:02:29', '2026-08-07 02:02:29'),
(414, 415, '20241320007', 'Sistem Informasi', 'FIKSI', '2024', '2026-08-07 02:02:31', '2026-08-07 02:02:31', '2026-08-07 02:02:31'),
(415, 416, '20241320008', 'Sistem Informasi', 'FIKSI', '2024', '2026-08-07 02:02:32', '2026-08-07 02:02:32', '2026-08-07 02:02:32'),
(416, 417, '20241320009', 'Sistem Informasi', 'FIKSI', '2024', '2026-08-07 02:02:33', '2026-08-07 02:02:33', '2026-08-07 02:02:33'),
(417, 418, '20241320010', 'Sistem Informasi', 'FIKSI', '2024', '2026-08-07 02:02:35', '2026-08-07 02:02:35', '2026-08-07 02:02:35'),
(418, 419, '20241320011', 'Sistem Informasi', 'FIKSI', '2024', '2026-08-07 02:02:36', '2026-08-07 02:02:36', '2026-08-07 02:02:36'),
(419, 420, '20241320012', 'Sistem Informasi', 'FIKSI', '2024', '2026-08-07 02:02:37', '2026-08-07 02:02:37', '2026-08-07 02:02:37'),
(420, 421, '20241320013', 'Sistem Informasi', 'FIKSI', '2024', '2026-08-07 02:02:38', '2026-08-07 02:02:38', '2026-08-07 02:02:38'),
(421, 422, '20241320014', 'Sistem Informasi', 'FIKSI', '2024', '2026-08-07 02:02:39', '2026-08-07 02:02:39', '2026-08-07 02:02:39'),
(422, 423, '20241320015', 'Sistem Informasi', 'FIKSI', '2024', '2026-08-07 02:02:40', '2026-08-07 02:02:40', '2026-08-07 02:02:40'),
(423, 424, '20241320016', 'Sistem Informasi', 'FIKSI', '2024', '2026-08-07 02:02:43', '2026-08-07 02:02:43', '2026-08-07 02:02:43'),
(424, 425, '20241320017', 'Sistem Informasi', 'FIKSI', '2024', '2026-08-07 02:02:44', '2026-08-07 02:02:44', '2026-08-07 02:02:44'),
(425, 426, '20241320018', 'Sistem Informasi', 'FIKSI', '2024', '2026-08-07 02:02:45', '2026-08-07 02:02:45', '2026-08-07 02:02:45'),
(426, 427, '20241320019', 'Sistem Informasi', 'FIKSI', '2024', '2026-08-07 02:02:46', '2026-08-07 02:02:46', '2026-08-07 02:02:46'),
(427, 428, '20241320020', 'Sistem Informasi', 'FIKSI', '2024', '2026-08-07 02:02:47', '2026-08-07 02:02:47', '2026-08-07 02:02:47'),
(428, 429, '20241320021', 'Sistem Informasi', 'FIKSI', '2024', '2026-08-07 02:02:48', '2026-08-07 02:02:48', '2026-08-07 02:02:48'),
(429, 430, '20241320022', 'Sistem Informasi', 'FIKSI', '2024', '2026-08-07 02:02:49', '2026-08-07 02:02:49', '2026-08-07 02:02:49'),
(430, 431, '20241320023', 'Sistem Informasi', 'FIKSI', '2024', '2026-08-07 02:02:50', '2026-08-07 02:02:50', '2026-08-07 02:02:50'),
(431, 432, '20241320025', 'Sistem Informasi', 'FIKSI', '2024', '2026-08-07 02:02:52', '2026-08-07 02:02:52', '2026-08-07 02:02:52'),
(432, 433, '20241320026', 'Sistem Informasi', 'FIKSI', '2024', '2026-08-07 02:02:53', '2026-08-07 02:02:53', '2026-08-07 02:02:53'),
(433, 434, '20241320027', 'Sistem Informasi', 'FIKSI', '2024', '2026-08-07 02:02:54', '2026-08-07 02:02:54', '2026-08-07 02:02:54'),
(434, 435, '20241320028', 'Sistem Informasi', 'FIKSI', '2024', '2026-08-07 02:02:55', '2026-08-07 02:02:55', '2026-08-07 02:02:55'),
(435, 436, '20241320029', 'Sistem Informasi', 'FIKSI', '2024', '2026-08-07 02:02:56', '2026-08-07 02:02:56', '2026-08-07 02:02:56'),
(436, 437, '20241320030', 'Sistem Informasi', 'FIKSI', '2024', '2026-08-07 02:02:57', '2026-08-07 02:02:57', '2026-08-07 02:02:57'),
(437, 438, '20241320031', 'Sistem Informasi', 'FIKSI', '2024', '2026-08-07 02:02:58', '2026-08-07 02:02:58', '2026-08-07 02:02:58'),
(438, 439, '20241320032', 'Sistem Informasi', 'FIKSI', '2024', '2026-08-07 02:02:59', '2026-08-07 02:02:59', '2026-08-07 02:02:59'),
(439, 440, '20241320033', 'Sistem Informasi', 'FIKSI', '2024', '2026-08-07 02:03:01', '2026-08-07 02:03:01', '2026-08-07 02:03:01'),
(440, 441, '20241320034', 'Sistem Informasi', 'FIKSI', '2024', '2026-08-07 02:03:02', '2026-08-07 02:03:02', '2026-08-07 02:03:02'),
(441, 442, '20241320035', 'Sistem Informasi', 'FIKSI', '2024', '2026-08-07 02:03:06', '2026-08-07 02:03:06', '2026-08-07 02:03:06'),
(442, 443, '20241320036', 'Sistem Informasi', 'FIKSI', '2024', '2026-08-07 02:03:07', '2026-08-07 02:03:07', '2026-08-07 02:03:07'),
(443, 444, '20241320037', 'Sistem Informasi', 'FIKSI', '2024', '2026-08-07 02:03:08', '2026-08-07 02:03:08', '2026-08-07 02:03:08'),
(444, 445, '20241320038', 'Sistem Informasi', 'FIKSI', '2024', '2026-08-07 02:03:09', '2026-08-07 02:03:09', '2026-08-07 02:03:09'),
(445, 446, '20241320039', 'Sistem Informasi', 'FIKSI', '2024', '2026-08-07 02:03:10', '2026-08-07 02:03:10', '2026-08-07 02:03:10'),
(446, 447, '20241320040', 'Sistem Informasi', 'FIKSI', '2024', '2026-08-07 02:03:12', '2026-08-07 02:03:12', '2026-08-07 02:03:12'),
(447, 448, '20241320041', 'Sistem Informasi', 'FIKSI', '2024', '2026-08-07 02:03:13', '2026-08-07 02:03:13', '2026-08-07 02:03:13'),
(448, 449, '20241320042', 'Sistem Informasi', 'FIKSI', '2024', '2026-08-07 02:03:14', '2026-08-07 02:03:14', '2026-08-07 02:03:14'),
(449, 450, '20241320043', 'Sistem Informasi', 'FIKSI', '2024', '2026-08-07 02:03:15', '2026-08-07 02:03:15', '2026-08-07 02:03:15'),
(450, 451, '20241320044', 'Sistem Informasi', 'FIKSI', '2024', '2026-08-07 02:03:16', '2026-08-07 02:03:16', '2026-08-07 02:03:16'),
(451, 452, '20241320045', 'Sistem Informasi', 'FIKSI', '2024', '2026-08-07 02:03:17', '2026-08-07 02:03:17', '2026-08-07 02:03:17'),
(452, 453, '20241320046', 'Sistem Informasi', 'FIKSI', '2024', '2026-08-07 02:03:18', '2026-08-07 02:03:18', '2026-08-07 02:03:18'),
(453, 454, '20241320047', 'Sistem Informasi', 'FIKSI', '2024', '2026-08-07 02:03:19', '2026-08-07 02:03:19', '2026-08-07 02:03:19'),
(454, 455, '20241320048', 'Sistem Informasi', 'FIKSI', '2024', '2026-08-07 02:03:20', '2026-08-07 02:03:20', '2026-08-07 02:03:20'),
(455, 456, '20241320049', 'Sistem Informasi', 'FIKSI', '2024', '2026-08-07 02:03:22', '2026-08-07 02:03:22', '2026-08-07 02:03:22'),
(456, 457, '20241320050', 'Sistem Informasi', 'FIKSI', '2024', '2026-08-07 02:03:24', '2026-08-07 02:03:24', '2026-08-07 02:03:24'),
(457, 458, '20241320051', 'Sistem Informasi', 'FIKSI', '2024', '2026-08-07 02:03:28', '2026-08-07 02:03:28', '2026-08-07 02:03:28'),
(458, 459, '20241320052', 'Sistem Informasi', 'FIKSI', '2024', '2026-08-07 02:03:30', '2026-08-07 02:03:30', '2026-08-07 02:03:30'),
(459, 460, '20241320053', 'Sistem Informasi', 'FIKSI', '2024', '2026-08-07 02:03:30', '2026-08-07 02:03:30', '2026-08-07 02:03:30'),
(460, 461, '20241320054', 'Sistem Informasi', 'FIKSI', '2024', '2026-08-07 02:03:32', '2026-08-07 02:03:32', '2026-08-07 02:03:32'),
(461, 462, '20241320055', 'Sistem Informasi', 'FIKSI', '2024', '2026-08-07 02:03:34', '2026-08-07 02:03:34', '2026-08-07 02:03:34'),
(462, 463, '20241320056', 'Sistem Informasi', 'FIKSI', '2024', '2026-08-07 02:03:36', '2026-08-07 02:03:36', '2026-08-07 02:03:36'),
(463, 464, '20241320057', 'Sistem Informasi', 'FIKSI', '2024', '2026-08-07 02:03:37', '2026-08-07 02:03:37', '2026-08-07 02:03:37'),
(464, 465, '20241320058', 'Sistem Informasi', 'FIKSI', '2024', '2026-08-07 02:03:38', '2026-08-07 02:03:38', '2026-08-07 02:03:38'),
(465, 466, '20241320059', 'Sistem Informasi', 'FIKSI', '2024', '2026-08-07 02:03:39', '2026-08-07 02:03:39', '2026-08-07 02:03:39'),
(466, 467, '20241320060', 'Sistem Informasi', 'FIKSI', '2024', '2026-08-07 02:03:40', '2026-08-07 02:03:40', '2026-08-07 02:03:40'),
(467, 468, '20241320061', 'Sistem Informasi', 'FIKSI', '2024', '2026-08-07 02:03:41', '2026-08-07 02:03:41', '2026-08-07 02:03:41'),
(468, 469, '20241320062', 'Sistem Informasi', 'FIKSI', '2024', '2026-08-07 02:03:42', '2026-08-07 02:03:42', '2026-08-07 02:03:42'),
(469, 470, '20241320064', 'Sistem Informasi', 'FIKSI', '2024', '2026-08-07 02:03:43', '2026-08-07 02:03:43', '2026-08-07 02:03:43'),
(470, 471, '20241320065', 'Sistem Informasi', 'FIKSI', '2024', '2026-08-07 02:03:44', '2026-08-07 02:03:44', '2026-08-07 02:03:44'),
(471, 472, '20241320066', 'Sistem Informasi', 'FIKSI', '2024', '2026-08-07 02:03:46', '2026-08-07 02:03:46', '2026-08-07 02:03:46'),
(472, 473, '20241320067', 'Sistem Informasi', 'FIKSI', '2024', '2026-08-07 02:03:47', '2026-08-07 02:03:47', '2026-08-07 02:03:47'),
(473, 474, '20241320068', 'Sistem Informasi', 'FIKSI', '2024', '2026-08-07 02:03:48', '2026-08-07 02:03:48', '2026-08-07 02:03:48'),
(474, 475, '20241320069', 'Sistem Informasi', 'FIKSI', '2024', '2026-08-07 02:03:49', '2026-08-07 02:03:49', '2026-08-07 02:03:49'),
(475, 476, '20241320070', 'Sistem Informasi', 'FIKSI', '2024', '2026-08-07 02:03:50', '2026-08-07 02:03:50', '2026-08-07 02:03:50'),
(476, 477, '20241320071', 'Sistem Informasi', 'FIKSI', '2024', '2026-08-07 02:03:51', '2026-08-07 02:03:51', '2026-08-07 02:03:51'),
(477, 478, '20241320072', 'Sistem Informasi', 'FIKSI', '2024', '2026-08-07 02:03:52', '2026-08-07 02:03:52', '2026-08-07 02:03:52'),
(478, 479, '20241320073', 'Sistem Informasi', 'FIKSI', '2024', '2026-08-07 02:03:53', '2026-08-07 02:03:53', '2026-08-07 02:03:53'),
(479, 480, '20241320074', 'Sistem Informasi', 'FIKSI', '2024', '2026-08-07 02:03:55', '2026-08-07 02:03:55', '2026-08-07 02:03:55'),
(480, 481, '20241320075', 'Sistem Informasi', 'FIKSI', '2024', '2026-08-07 02:03:56', '2026-08-07 02:03:56', '2026-08-07 02:03:56'),
(481, 482, '20241320076', 'Sistem Informasi', 'FIKSI', '2024', '2026-08-07 02:03:58', '2026-08-07 02:03:58', '2026-08-07 02:03:58'),
(482, 483, '20241320077', 'Sistem Informasi', 'FIKSI', '2024', '2026-08-07 02:03:59', '2026-08-07 02:03:59', '2026-08-07 02:03:59'),
(483, 484, '20241320079', 'Sistem Informasi', 'FIKSI', '2024', '2026-08-07 02:04:00', '2026-08-07 02:04:00', '2026-08-07 02:04:00'),
(484, 485, '20241320080', 'Sistem Informasi', 'FIKSI', '2024', '2026-08-07 02:04:01', '2026-08-07 02:04:01', '2026-08-07 02:04:01'),
(485, 486, '20241320081', 'Sistem Informasi', 'FIKSI', '2024', '2026-08-07 02:04:01', '2026-08-07 02:04:01', '2026-08-07 02:04:01'),
(486, 487, '20241320082', 'Sistem Informasi', 'FIKSI', '2024', '2026-08-07 02:04:03', '2026-08-07 02:04:03', '2026-08-07 02:04:03'),
(487, 488, '20241320083', 'Sistem Informasi', 'FIKSI', '2024', '2026-08-07 02:04:04', '2026-08-07 02:04:04', '2026-08-07 02:04:04'),
(488, 489, '20241320084', 'Sistem Informasi', 'FIKSI', '2024', '2026-08-07 02:04:05', '2026-08-07 02:04:05', '2026-08-07 02:04:05'),
(489, 490, '20241320085', 'Sistem Informasi', 'FIKSI', '2024', '2026-08-07 02:04:06', '2026-08-07 02:04:06', '2026-08-07 02:04:06'),
(490, 491, '20241320086', 'Sistem Informasi', 'FIKSI', '2024', '2026-08-07 02:04:07', '2026-08-07 02:04:07', '2026-08-07 02:04:07'),
(491, 492, '20241320087', 'Sistem Informasi', 'FIKSI', '2024', '2026-08-07 02:04:08', '2026-08-07 02:04:08', '2026-08-07 02:04:08'),
(492, 493, '20241320088', 'Sistem Informasi', 'FIKSI', '2024', '2026-08-07 02:04:10', '2026-08-07 02:04:10', '2026-08-07 02:04:10'),
(493, 494, '20241320089', 'Sistem Informasi', 'FIKSI', '2024', '2026-08-07 02:04:11', '2026-08-07 02:04:11', '2026-08-07 02:04:11'),
(494, 495, '20241320090', 'Sistem Informasi', 'FIKSI', '2024', '2026-08-07 02:04:12', '2026-08-07 02:04:12', '2026-08-07 02:04:12'),
(495, 496, '20241320091', 'Sistem Informasi', 'FIKSI', '2024', '2026-08-07 02:04:13', '2026-08-07 02:04:13', '2026-08-07 02:04:13'),
(496, 497, '20241320093', 'Sistem Informasi', 'FIKSI', '2024', '2026-08-07 02:04:14', '2026-08-07 02:04:14', '2026-08-07 02:04:14'),
(497, 498, '20241320094', 'Sistem Informasi', 'FIKSI', '2024', '2026-08-07 02:04:15', '2026-08-07 02:04:15', '2026-08-07 02:04:15'),
(498, 499, '20251320001', 'Sistem Informasi', 'FIKSI', '2025', '2026-08-07 02:04:16', '2026-08-07 02:04:16', '2026-08-07 02:04:16'),
(499, 500, '20251320002', 'Sistem Informasi', 'FIKSI', '2025', '2026-08-07 02:04:17', '2026-08-07 02:04:17', '2026-08-07 02:04:17'),
(500, 501, '20251320003', 'Sistem Informasi', 'FIKSI', '2025', '2026-08-07 02:04:18', '2026-08-07 02:04:18', '2026-08-07 02:04:18'),
(501, 502, '20251320005', 'Sistem Informasi', 'FIKSI', '2025', '2026-08-07 02:04:19', '2026-08-07 02:04:19', '2026-08-07 02:04:19'),
(502, 503, '20251320006', 'Sistem Informasi', 'FIKSI', '2025', '2026-08-07 02:04:20', '2026-08-07 02:04:20', '2026-08-07 02:04:20'),
(503, 504, '20251320007', 'Sistem Informasi', 'FIKSI', '2025', '2026-08-07 02:04:21', '2026-08-07 02:04:21', '2026-08-07 02:04:21'),
(504, 505, '20251320008', 'Sistem Informasi', 'FIKSI', '2025', '2026-08-07 02:04:22', '2026-08-07 02:04:22', '2026-08-07 02:04:22'),
(505, 506, '20251320009', 'Sistem Informasi', 'FIKSI', '2025', '2026-08-07 02:04:23', '2026-08-07 02:04:23', '2026-08-07 02:04:23'),
(506, 507, '20251320010', 'Sistem Informasi', 'FIKSI', '2025', '2026-08-07 02:04:24', '2026-08-07 02:04:24', '2026-08-07 02:04:24'),
(507, 508, '20251320011', 'Sistem Informasi', 'FIKSI', '2025', '2026-08-07 02:04:25', '2026-08-07 02:04:25', '2026-08-07 02:04:25'),
(508, 509, '20251320012', 'Sistem Informasi', 'FIKSI', '2025', '2026-08-07 02:04:26', '2026-08-07 02:04:26', '2026-08-07 02:04:26'),
(509, 510, '20251320013', 'Sistem Informasi', 'FIKSI', '2025', '2026-08-07 02:04:27', '2026-08-07 02:04:27', '2026-08-07 02:04:27'),
(510, 511, '20251320014', 'Sistem Informasi', 'FIKSI', '2025', '2026-08-07 02:04:28', '2026-08-07 02:04:28', '2026-08-07 02:04:28'),
(511, 512, '20251320015', 'Sistem Informasi', 'FIKSI', '2025', '2026-08-07 02:04:29', '2026-08-07 02:04:29', '2026-08-07 02:04:29'),
(512, 513, '20251320016', 'Sistem Informasi', 'FIKSI', '2025', '2026-08-07 02:04:30', '2026-08-07 02:04:30', '2026-08-07 02:04:30'),
(513, 514, '20251320017', 'Sistem Informasi', 'FIKSI', '2025', '2026-08-07 02:04:31', '2026-08-07 02:04:31', '2026-08-07 02:04:31'),
(514, 515, '20251320018', 'Sistem Informasi', 'FIKSI', '2025', '2026-08-07 02:04:32', '2026-08-07 02:04:32', '2026-08-07 02:04:32'),
(515, 516, '20251320019', 'Sistem Informasi', 'FIKSI', '2025', '2026-08-07 02:04:33', '2026-08-07 02:04:33', '2026-08-07 02:04:33'),
(516, 517, '20251320020', 'Sistem Informasi', 'FIKSI', '2025', '2026-08-07 02:04:34', '2026-08-07 02:04:34', '2026-08-07 02:04:34'),
(517, 518, '20251320021', 'Sistem Informasi', 'FIKSI', '2025', '2026-08-07 02:04:34', '2026-08-07 02:04:34', '2026-08-07 02:04:34'),
(518, 519, '20251320022', 'Sistem Informasi', 'FIKSI', '2025', '2026-08-07 02:04:36', '2026-08-07 02:04:36', '2026-08-07 02:04:36'),
(519, 520, '20251320023', 'Sistem Informasi', 'FIKSI', '2025', '2026-08-07 02:04:36', '2026-08-07 02:04:36', '2026-08-07 02:04:36'),
(520, 521, '20251320024', 'Sistem Informasi', 'FIKSI', '2025', '2026-08-07 02:04:37', '2026-08-07 02:04:37', '2026-08-07 02:04:37'),
(521, 522, '20251320025', 'Sistem Informasi', 'FIKSI', '2025', '2026-08-07 02:04:38', '2026-08-07 02:04:38', '2026-08-07 02:04:38'),
(522, 523, '20251320026', 'Sistem Informasi', 'FIKSI', '2025', '2026-08-07 02:04:40', '2026-08-07 02:04:40', '2026-08-07 02:04:40'),
(523, 524, '20251320027', 'Sistem Informasi', 'FIKSI', '2025', '2026-08-07 02:04:41', '2026-08-07 02:04:41', '2026-08-07 02:04:41'),
(524, 525, '20251320028', 'Sistem Informasi', 'FIKSI', '2025', '2026-08-07 02:04:42', '2026-08-07 02:04:42', '2026-08-07 02:04:42'),
(525, 526, '20251320029', 'Sistem Informasi', 'FIKSI', '2025', '2026-08-07 02:04:43', '2026-08-07 02:04:43', '2026-08-07 02:04:43'),
(526, 527, '20251320030', 'Sistem Informasi', 'FIKSI', '2025', '2026-08-07 02:04:44', '2026-08-07 02:04:44', '2026-08-07 02:04:44'),
(527, 528, '20251320031', 'Sistem Informasi', 'FIKSI', '2025', '2026-08-07 02:04:46', '2026-08-07 02:04:46', '2026-08-07 02:04:46'),
(528, 529, '20251320032', 'Sistem Informasi', 'FIKSI', '2025', '2026-08-07 02:04:47', '2026-08-07 02:04:47', '2026-08-07 02:04:47'),
(529, 530, '20251320033', 'Sistem Informasi', 'FIKSI', '2025', '2026-08-07 02:04:48', '2026-08-07 02:04:48', '2026-08-07 02:04:48'),
(530, 531, '20251320035', 'Sistem Informasi', 'FIKSI', '2025', '2026-08-07 02:04:49', '2026-08-07 02:04:49', '2026-08-07 02:04:49'),
(531, 532, '20251320036', 'Sistem Informasi', 'FIKSI', '2025', '2026-08-07 02:04:50', '2026-08-07 02:04:50', '2026-08-07 02:04:50'),
(532, 533, '20251320037', 'Sistem Informasi', 'FIKSI', '2025', '2026-08-07 02:04:51', '2026-08-07 02:04:51', '2026-08-07 02:04:51'),
(533, 534, '20251320038', 'Sistem Informasi', 'FIKSI', '2025', '2026-08-07 02:04:52', '2026-08-07 02:04:52', '2026-08-07 02:04:52'),
(534, 535, '20251320039', 'Sistem Informasi', 'FIKSI', '2025', '2026-08-07 02:04:53', '2026-08-07 02:04:53', '2026-08-07 02:04:53'),
(535, 536, '20251320040', 'Sistem Informasi', 'FIKSI', '2025', '2026-08-07 02:04:55', '2026-08-07 02:04:55', '2026-08-07 02:04:55'),
(536, 537, '20251320041', 'Sistem Informasi', 'FIKSI', '2025', '2026-08-07 02:04:55', '2026-08-07 02:04:55', '2026-08-07 02:04:55'),
(537, 538, '20251320042', 'Sistem Informasi', 'FIKSI', '2025', '2026-08-07 02:04:56', '2026-08-07 02:04:56', '2026-08-07 02:04:56'),
(538, 539, '20251320043', 'Sistem Informasi', 'FIKSI', '2025', '2026-08-07 02:04:58', '2026-08-07 02:04:58', '2026-08-07 02:04:58'),
(539, 540, '20251320044', 'Sistem Informasi', 'FIKSI', '2025', '2026-08-07 02:04:59', '2026-08-07 02:04:59', '2026-08-07 02:04:59'),
(540, 541, '20251320045', 'Sistem Informasi', 'FIKSI', '2025', '2026-08-07 02:04:59', '2026-08-07 02:04:59', '2026-08-07 02:04:59'),
(541, 542, '20251320046', 'Sistem Informasi', 'FIKSI', '2025', '2026-08-07 02:05:01', '2026-08-07 02:05:01', '2026-08-07 02:05:01'),
(542, 543, '20251320047', 'Sistem Informasi', 'FIKSI', '2025', '2026-08-07 02:05:04', '2026-08-07 02:05:04', '2026-08-07 02:05:04'),
(543, 544, '20251320048', 'Sistem Informasi', 'FIKSI', '2025', '2026-08-07 02:05:06', '2026-08-07 02:05:06', '2026-08-07 02:05:06'),
(544, 545, '20251320049', 'Sistem Informasi', 'FIKSI', '2025', '2026-08-07 02:05:07', '2026-08-07 02:05:07', '2026-08-07 02:05:07'),
(545, 546, '20251320050', 'Sistem Informasi', 'FIKSI', '2025', '2026-08-07 02:05:08', '2026-08-07 02:05:08', '2026-08-07 02:05:08'),
(546, 547, '20251320051', 'Sistem Informasi', 'FIKSI', '2025', '2026-08-07 02:05:09', '2026-08-07 02:05:09', '2026-08-07 02:05:09'),
(547, 548, '20251320052', 'Sistem Informasi', 'FIKSI', '2025', '2026-08-07 02:05:10', '2026-08-07 02:05:10', '2026-08-07 02:05:10'),
(548, 549, '20251320053', 'Sistem Informasi', 'FIKSI', '2025', '2026-08-07 02:05:10', '2026-08-07 02:05:10', '2026-08-07 02:05:10'),
(549, 550, '20251320054', 'Sistem Informasi', 'FIKSI', '2025', '2026-08-07 02:05:11', '2026-08-07 02:05:11', '2026-08-07 02:05:11'),
(550, 551, '20251320055', 'Sistem Informasi', 'FIKSI', '2025', '2026-08-07 02:05:12', '2026-08-07 02:05:12', '2026-08-07 02:05:12'),
(551, 552, '20251320056', 'Sistem Informasi', 'FIKSI', '2025', '2026-08-07 02:05:13', '2026-08-07 02:05:13', '2026-08-07 02:05:13'),
(552, 553, '20251320057', 'Sistem Informasi', 'FIKSI', '2025', '2026-08-07 02:05:14', '2026-08-07 02:05:14', '2026-08-07 02:05:14'),
(553, 554, '20251320058', 'Sistem Informasi', 'FIKSI', '2025', '2026-08-07 02:05:15', '2026-08-07 02:05:15', '2026-08-07 02:05:15'),
(554, 555, '20251320059', 'Sistem Informasi', 'FIKSI', '2025', '2026-08-07 02:05:16', '2026-08-07 02:05:16', '2026-08-07 02:05:16'),
(555, 556, '20251320060', 'Sistem Informasi', 'FIKSI', '2025', '2026-08-07 02:05:17', '2026-08-07 02:05:17', '2026-08-07 02:05:17'),
(556, 557, '20251320061', 'Sistem Informasi', 'FIKSI', '2025', '2026-08-07 02:05:18', '2026-08-07 02:05:18', '2026-08-07 02:05:18'),
(557, 558, '20251320062', 'Sistem Informasi', 'FIKSI', '2025', '2026-08-07 02:05:19', '2026-08-07 02:05:19', '2026-08-07 02:05:19'),
(558, 559, '20251320063', 'Sistem Informasi', 'FIKSI', '2025', '2026-08-07 02:05:20', '2026-08-07 02:05:20', '2026-08-07 02:05:20'),
(559, 560, '20251320064', 'Sistem Informasi', 'FIKSI', '2025', '2026-08-07 02:05:21', '2026-08-07 02:05:21', '2026-08-07 02:05:21'),
(560, 561, '20251320065', 'Sistem Informasi', 'FIKSI', '2025', '2026-08-07 02:05:23', '2026-08-07 02:05:23', '2026-08-07 02:05:23'),
(561, 562, '20251320066', 'Sistem Informasi', 'FIKSI', '2025', '2026-08-07 02:05:24', '2026-08-07 02:05:24', '2026-08-07 02:05:24'),
(562, 563, '20251320067', 'Sistem Informasi', 'FIKSI', '2025', '2026-08-07 02:05:25', '2026-08-07 02:05:25', '2026-08-07 02:05:25'),
(563, 564, '20251320068', 'Sistem Informasi', 'FIKSI', '2025', '2026-08-07 02:05:26', '2026-08-07 02:05:26', '2026-08-07 02:05:26'),
(564, 565, '20251320069', 'Sistem Informasi', 'FIKSI', '2025', '2026-08-07 02:05:28', '2026-08-07 02:05:28', '2026-08-07 02:05:28'),
(565, 566, '20251320070', 'Sistem Informasi', 'FIKSI', '2025', '2026-08-07 02:05:29', '2026-08-07 02:05:29', '2026-08-07 02:05:29'),
(566, 567, '20251320071', 'Sistem Informasi', 'FIKSI', '2025', '2026-08-07 02:05:30', '2026-08-07 02:05:30', '2026-08-07 02:05:30'),
(567, 568, '20251320072', 'Sistem Informasi', 'FIKSI', '2025', '2026-08-07 02:05:31', '2026-08-07 02:05:31', '2026-08-07 02:05:31'),
(568, 569, '20251320073', 'Sistem Informasi', 'FIKSI', '2025', '2026-08-07 02:05:32', '2026-08-07 02:05:32', '2026-08-07 02:05:32'),
(569, 570, '20251320074', 'Sistem Informasi', 'FIKSI', '2025', '2026-08-07 02:05:34', '2026-08-07 02:05:34', '2026-08-07 02:05:34'),
(570, 571, '20251320075', 'Sistem Informasi', 'FIKSI', '2025', '2026-08-07 02:05:35', '2026-08-07 02:05:35', '2026-08-07 02:05:35'),
(571, 572, '20251320076', 'Sistem Informasi', 'FIKSI', '2025', '2026-08-07 02:05:36', '2026-08-07 02:05:36', '2026-08-07 02:05:36'),
(572, 573, '20251320077', 'Sistem Informasi', 'FIKSI', '2025', '2026-08-07 02:05:37', '2026-08-07 02:05:37', '2026-08-07 02:05:37'),
(573, 574, '20251320078', 'Sistem Informasi', 'FIKSI', '2025', '2026-08-07 02:05:39', '2026-08-07 02:05:39', '2026-08-07 02:05:39'),
(574, 575, '20251320079', 'Sistem Informasi', 'FIKSI', '2025', '2026-08-07 02:05:40', '2026-08-07 02:05:40', '2026-08-07 02:05:40'),
(575, 576, '20221310002', 'Teknik Informatika', 'FIKSI', '2022', '2026-08-07 02:17:44', '2026-08-07 02:17:44', '2026-08-07 02:17:44'),
(576, 577, '20221310010', 'Teknik Informatika', 'FIKSI', '2022', '2026-08-07 02:17:45', '2026-08-07 02:17:45', '2026-08-07 02:17:45'),
(577, 578, '20231310003', 'Teknik Informatika', 'FIKSI', '2023', '2026-08-07 02:17:46', '2026-08-07 02:17:46', '2026-08-07 02:17:46');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_pengguna_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2026_07_27_000001_create_mahasiswa_table', 1),
(5, '2026_07_27_000002_create_kategori_table', 1),
(6, '2026_07_27_000003_create_kegiatan_table', 1),
(7, '2026_07_27_000004_create_sertifikat_table', 1),
(8, '2026_07_27_000005_create_portofolio_table', 1),
(9, '2026_07_27_000006_create_skema_poin_table', 1),
(10, '2026_07_27_000007_create_notifikasi_table', 1),
(11, '2026_07_27_000008_create_log_aktivitas_table', 1),
(12, '2026_07_28_000001_add_thumbnail_to_sertifikat_table', 1),
(13, '2026_07_29_000001_add_detail_sertifikat_columns', 1),
(14, '2026_07_30_000001_add_sso_username_to_pengguna_table', 1),
(15, '2026_07_31_000001_create_jenis_kegiatan_table', 1),
(16, '2026_07_31_000002_recreate_skema_poin_table', 1),
(17, '2026_07_31_000003_recreate_sertifikat_table', 1),
(18, '2026_07_31_000004_drop_kegiatan_table', 1),
(19, '2026_08_02_000001_add_sinkron_data_master_pada_to_mahasiswa_table', 1),
(20, '2026_08_03_000001_create_jenis_table', 1),
(21, '2026_08_03_000002_recreate_skema_poin_table_for_jenis', 1),
(22, '2026_08_03_000003_recreate_sertifikat_table_for_jenis', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifikasi`
--

CREATE TABLE `notifikasi` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pengguna_id` bigint(20) UNSIGNED NOT NULL,
  `judul` varchar(255) NOT NULL,
  `isi` text NOT NULL,
  `sudah_dibaca` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifikasi`
--

INSERT INTO `notifikasi` (`id`, `pengguna_id`, `judul`, `isi`, `sudah_dibaca`, `created_at`, `updated_at`) VALUES
(1, 6, 'Sertifikat Disetujui', 'Pengajuan sertifikat \"ak\" telah disetujui. Anda mendapat 15.00 poin.', 1, '2026-08-16 09:53:32', '2026-08-16 15:57:24');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE `pengguna` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `sso_username` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `peran` varchar(255) NOT NULL DEFAULT 'mahasiswa',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pengguna`
--

INSERT INTO `pengguna` (`id`, `nama`, `email`, `sso_username`, `email_verified_at`, `password`, `peran`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'admin@sikemah.ukri', NULL, NULL, '$2y$12$2awj5PNW5.SJn/4N0wHdJOomZaaneLEHjEVKsW5I5za.vZN/eIRiK', 'admin', NULL, '2026-08-04 04:11:37', '2026-08-04 04:11:37'),
(6, 'Aida Sucia', '20221310001@sikemah.ukri', NULL, NULL, '$2y$12$7f.mEOjS1ldgvlwT1YdY7./AoG9tB2ApIY8BCzJ61l86VxyYaK7CG', 'mahasiswa', NULL, '2026-08-07 01:55:42', '2026-08-07 01:55:42'),
(7, 'Alif Prambudi Fadillah Akbar', '20221310003@sikemah.ukri', NULL, NULL, '$2y$12$U3Cvs2zpdWCwYjJkwSXyG.ErkRV839cLRLbf.THOu0vv5owkwYlye', 'mahasiswa', NULL, '2026-08-07 01:55:43', '2026-08-07 01:55:43'),
(8, 'Aliya Tazkiya Fajriyati', '20221310004@sikemah.ukri', NULL, NULL, '$2y$12$dskK9c8WBIeKaPngm4TkKueywQ.Vqcp59ngQPK5Mt7hoUnYwHxT.u', 'mahasiswa', NULL, '2026-08-07 01:55:43', '2026-08-07 01:55:43'),
(9, 'Ariel Abdurrozak', '20221310005@sikemah.ukri', NULL, NULL, '$2y$12$5by4eAB.07ezSPQSIlF8Vujkfq0qjb7Gu0c9YqbvsZ0ZWZalfQKw2', 'mahasiswa', NULL, '2026-08-07 01:55:44', '2026-08-07 01:55:44'),
(10, 'Arya Abdul Mughni', '20221310006@sikemah.ukri', NULL, NULL, '$2y$12$4Xao6LUriyNlcisSmOpk9ufxUcNWl2x1Wx31ccZwhTYHD1BQjeZuS', 'mahasiswa', NULL, '2026-08-07 01:55:45', '2026-08-07 01:55:45'),
(11, 'Arya Sultansyah', '20221310007@sikemah.ukri', NULL, NULL, '$2y$12$g8MiOZ8jJwqG.9j44fnAOO4Jo0Dkvl1xS0t7JntPp0L3gz1niUWpC', 'mahasiswa', NULL, '2026-08-07 01:55:46', '2026-08-07 01:55:46'),
(12, 'Astri Sri Rahayu', '20221310008@sikemah.ukri', NULL, NULL, '$2y$12$9sRkSrWKrBlX2aKcbApgLuqipFDAbbkWCtQQBXdXTqw78W2EiXljS', 'mahasiswa', NULL, '2026-08-07 01:55:46', '2026-08-07 01:55:46'),
(13, 'Azhar Havis', '20221310009@sikemah.ukri', NULL, NULL, '$2y$12$wRPqOYbEUGTXixcxdTAu..reNv/kvoQowzTWom0SUDaidkpt2bPee', 'mahasiswa', NULL, '2026-08-07 01:55:47', '2026-08-07 01:55:47'),
(14, 'Chris Hendry Choong', '20221310011@sikemah.ukri', NULL, NULL, '$2y$12$D6rEg4lvy87DyLx8/7Orr.6y2ms1b3gNCvD5LY01z9UZN.JiQ0Yw6', 'mahasiswa', NULL, '2026-08-07 01:55:48', '2026-08-07 01:55:48'),
(15, 'Muhammad Ghozali Nur Hidayatullah', '20221310012@sikemah.ukri', NULL, NULL, '$2y$12$dbF1OKjG1xGhi7AU3zcP3erKVP.Uk1TdmtvGZylnlY.OdIw4yuOBy', 'mahasiswa', NULL, '2026-08-07 01:55:50', '2026-08-07 01:55:50'),
(16, 'Denita Al Hamdina Putri Arisandi', '20221310013@sikemah.ukri', NULL, NULL, '$2y$12$e9aP2x5.bZ8Ej4XxCKBrIO1mz72olfymgaIRtPfO23x7hqoMS181C', 'mahasiswa', NULL, '2026-08-07 01:55:50', '2026-08-07 01:55:50'),
(17, 'Destyan Fadilah Akbar', '20221310014@sikemah.ukri', NULL, NULL, '$2y$12$jeiOa8/e2AJE46meSX7KbesTDeERpMWvMDwi1RtLtsryHwB0NSazi', 'mahasiswa', NULL, '2026-08-07 01:55:52', '2026-08-07 01:55:52'),
(18, 'Prayogi Nur Aldi', '20221310015@sikemah.ukri', NULL, NULL, '$2y$12$NEQNQ.1p4RKfJDYbCGovweWLarLfiK6T3QzjciH9ZICkpok5vWDBe', 'mahasiswa', NULL, '2026-08-07 01:55:53', '2026-08-07 01:55:53'),
(19, 'Farid Zia Ul-Haq', '20221310018@sikemah.ukri', NULL, NULL, '$2y$12$3q6neRcyVrVQSlytg909uufD/UZoFoSR4yQYR8YZogtdoyYKF/eSu', 'mahasiswa', NULL, '2026-08-07 01:55:54', '2026-08-07 01:55:54'),
(20, 'Iqbal Yudiana', '20221310020@sikemah.ukri', NULL, NULL, '$2y$12$tppP63enu.maH1THbSXnk.AGYwJy8yTrkpNFJ/YXwUVT4wnBuJaWy', 'mahasiswa', NULL, '2026-08-07 01:55:55', '2026-08-07 01:55:55'),
(21, 'Leo Restu Septian Rhaka Nugraha', '20221310022@sikemah.ukri', NULL, NULL, '$2y$12$6TpSOHbro.LvQHYae0QrOueZzPndDPNnnqZf4NGpVKxJGlmqC8MSq', 'mahasiswa', NULL, '2026-08-07 01:55:56', '2026-08-07 01:55:56'),
(22, 'Miftah Nur Rochman', '20221310024@sikemah.ukri', NULL, NULL, '$2y$12$5/yYDJrPruvTM2.FtfOVi.rQXzs4l2B85qLEPyJEvQ3LQtYCn/2AC', 'mahasiswa', NULL, '2026-08-07 01:55:57', '2026-08-07 01:55:57'),
(23, 'Miftah Rizkia Aldira', '20221310025@sikemah.ukri', NULL, NULL, '$2y$12$g0sFyHvl6ginP6JEZV9P..ZKN4dptwkjLj/EjUvtqHIKaQqFLjdzi', 'mahasiswa', NULL, '2026-08-07 01:55:58', '2026-08-07 01:55:58'),
(24, 'Muhammad Hafizha Ramadhani', '20221310027@sikemah.ukri', NULL, NULL, '$2y$12$h.166y9TIc83mnxchQ/oSOwUfPTLqXmDp0USefG0Lf5GpMRiRSp1.', 'mahasiswa', NULL, '2026-08-07 01:55:59', '2026-08-07 01:55:59'),
(25, 'Muhammad Ridho', '20221310028@sikemah.ukri', NULL, NULL, '$2y$12$cWl4gEDwmho9xyGF8X5G2u1o.m7gq2xzz5oS9VodP1Wk0XWx.FpoO', 'mahasiswa', NULL, '2026-08-07 01:56:00', '2026-08-07 01:56:00'),
(26, 'Nabila Desiana', '20221310029@sikemah.ukri', NULL, NULL, '$2y$12$npevjKJslFRYE.pfV0TL7OZ7rHSUqRFbGmC6TTqER46XomKHkrBme', 'mahasiswa', NULL, '2026-08-07 01:56:01', '2026-08-07 01:56:01'),
(27, 'Padjrin Fauzi', '20221310031@sikemah.ukri', NULL, NULL, '$2y$12$vcJ/97DAkRrqJVBRGlvQBORzcn1NkTeLRzi4Ci9FNvcaw4jSHy7sO', 'mahasiswa', NULL, '2026-08-07 01:56:02', '2026-08-07 01:56:02'),
(28, 'Piqri Nabila Mulia', '20221310032@sikemah.ukri', NULL, NULL, '$2y$12$bTVDGgg/81eJbPrrISQX2uIhzYUZ7LQfM7y5gRXJ5rl5Enhd6h1Ku', 'mahasiswa', NULL, '2026-08-07 01:56:03', '2026-08-07 01:56:03'),
(29, 'Putri Nur Hasanah', '20221310033@sikemah.ukri', NULL, NULL, '$2y$12$QF6yys6oMdx/mYoZ.0SzHexv7f6URXMKuWA.YFnV6DOQP42OZbsnC', 'mahasiswa', NULL, '2026-08-07 01:56:04', '2026-08-07 01:56:04'),
(30, 'Rahman Fauza', '20221310034@sikemah.ukri', NULL, NULL, '$2y$12$hbUrvi0xaQhZpZYHQ3jO8eYpVYq7EAtMZYHbcdO0gWn3WmRJA3Tn6', 'mahasiswa', NULL, '2026-08-07 01:56:05', '2026-08-07 01:56:05'),
(31, 'Elsa Nur Aripin', '20221310035@sikemah.ukri', NULL, NULL, '$2y$12$SzJpOzAsNqOdKpnc3t0YBeBelHv4eqzEgyxUn5hSOmwvSBFh2Tir.', 'mahasiswa', NULL, '2026-08-07 01:56:06', '2026-08-07 01:56:06'),
(32, 'Riyan Hidayat', '20221310036@sikemah.ukri', NULL, NULL, '$2y$12$unGw2.djPYmp4l0ijxeLeeqxnwgLJjl5z.DC3Zm5gR37iwXsgXwaq', 'mahasiswa', NULL, '2026-08-07 01:56:07', '2026-08-07 01:56:07'),
(33, 'Ridwan', '20221310037@sikemah.ukri', NULL, NULL, '$2y$12$H0CVKFlergu0aewqC/RniuU1LZZzob3ta6dR8C8zBuVGf7OvZo2OO', 'mahasiswa', NULL, '2026-08-07 01:56:08', '2026-08-07 01:56:08'),
(34, 'Ridwan Saobandri', '20221310038@sikemah.ukri', NULL, NULL, '$2y$12$25eD.L9.TXNI9Qwi7mRm3uDR4Ke1mbqzWXYBfpy6YDk78g4rpK5M.', 'mahasiswa', NULL, '2026-08-07 01:56:09', '2026-08-07 01:56:09'),
(35, 'Rizqia Noerlidha Raihanie', '20221310039@sikemah.ukri', NULL, NULL, '$2y$12$Xorl88AMVxchHGxsXeOs1uBWiquV2eDODDKYu8CQ8vqP1ZVXV.ZQm', 'mahasiswa', NULL, '2026-08-07 01:56:10', '2026-08-07 01:56:10'),
(36, 'Salsabila Rosnie', '20221310042@sikemah.ukri', NULL, NULL, '$2y$12$mQNhuoEO6dduGyZr3oCkFe9amrLwCocQr4baDCAT/Sa6oqJOkA2ce', 'mahasiswa', NULL, '2026-08-07 01:56:12', '2026-08-07 01:56:12'),
(37, 'Sandi Rosandi', '20221310043@sikemah.ukri', NULL, NULL, '$2y$12$/s4z/uQOA5kPxMmaIr8k5ezW2.cBw4W/Am43OKEfLV4cUYRydX.02', 'mahasiswa', NULL, '2026-08-07 01:56:14', '2026-08-07 01:56:14'),
(38, 'Saripah', '20221310044@sikemah.ukri', NULL, NULL, '$2y$12$kIwORZHq5ppYEJd5w3b.OegT08A75kHtf9CJ6THxEcTnCh8k9EOqS', 'mahasiswa', NULL, '2026-08-07 01:56:15', '2026-08-07 01:56:15'),
(39, 'Syifa Khofifah', '20221310045@sikemah.ukri', NULL, NULL, '$2y$12$81ubvMJwgsNxy/jO9aIXteA2.CAiLbVLvHjdr2r1npzle1hLFd0Ci', 'mahasiswa', NULL, '2026-08-07 01:56:16', '2026-08-07 01:56:16'),
(40, 'Thomas Aldi Fiqri', '20221310046@sikemah.ukri', NULL, NULL, '$2y$12$3vTGePg3c0uDOmkwBTRcjeGiQSWOIC61pdxMk/EYMADIs3BWBObxm', 'mahasiswa', NULL, '2026-08-07 01:56:17', '2026-08-07 01:56:17'),
(41, 'Aji Nata Sobari', '20221310063@sikemah.ukri', NULL, NULL, '$2y$12$nHZngbchXGQd2bdNXCIrCO/42yE0yvKRNX0BXdRWd5sRYzBRT5gX6', 'mahasiswa', NULL, '2026-08-07 01:56:19', '2026-08-07 01:56:19'),
(42, 'Arya Nugraha', '20221310064@sikemah.ukri', NULL, NULL, '$2y$12$GZBeGyYXdPbnrkkhyapPO.7yz63nHhBKWuH0tPiKlPD4cPJzYUTBW', 'mahasiswa', NULL, '2026-08-07 01:56:20', '2026-08-07 01:56:20'),
(43, 'Dede Ardiansah', '20221310066@sikemah.ukri', NULL, NULL, '$2y$12$ickodfZ.PqBYwDO9g.r8TuAN.4slG3lJFVCqCiopQYzHwkH3yQjwe', 'mahasiswa', NULL, '2026-08-07 01:56:21', '2026-08-07 01:56:21'),
(44, 'Devan Zulfangga', '20221310067@sikemah.ukri', NULL, NULL, '$2y$12$YBikwzmv6rUOnU8eoXz.K.nSa4K544GfFHLGhuOS3bSm15awqERam', 'mahasiswa', NULL, '2026-08-07 01:56:22', '2026-08-07 01:56:22'),
(45, 'Haekal Abdulah Ali Akbar Fajar Ramadhan', '20221310068@sikemah.ukri', NULL, NULL, '$2y$12$5vUrDYD8NceHWArgR5jS2Ob3EL.mqG.O.57DNid29qreFG7bzRFqa', 'mahasiswa', NULL, '2026-08-07 01:56:23', '2026-08-07 01:56:23'),
(46, 'Khairunnisa Dwi Wahyuningtyas', '20221310070@sikemah.ukri', NULL, NULL, '$2y$12$YOEEvsZn2miod96cZXfRj.JpX/ZZKHlJCMKgUSmmurC/jH9HQM9hO', 'mahasiswa', NULL, '2026-08-07 01:56:24', '2026-08-07 01:56:24'),
(47, 'M. Sunandi', '20221310071@sikemah.ukri', NULL, NULL, '$2y$12$Ru3lm/rsjw8TQvLmxxOFGO1P5cn2a4.NFt0Mq88Uq/EF0lCpls2w.', 'mahasiswa', NULL, '2026-08-07 01:56:25', '2026-08-07 01:56:25'),
(48, 'Muhamad Aditya Suhendar', '20221310073@sikemah.ukri', NULL, NULL, '$2y$12$RUtESLXvzHB9r932NJbjauh2Bwl8EhjxCa6LIGxALLMQ0g8vcsfR2', 'mahasiswa', NULL, '2026-08-07 01:56:25', '2026-08-07 01:56:25'),
(49, 'Muhamad Nabil Arrafi', '20221310074@sikemah.ukri', NULL, NULL, '$2y$12$7tBCP6goOl4unTX.MZBCyOHB806xDCR0K2wPiED1MUpPMrzEVwYeq', 'mahasiswa', NULL, '2026-08-07 01:56:26', '2026-08-07 01:56:26'),
(50, 'Muhammad Lukman Abdurahman', '20221310075@sikemah.ukri', NULL, NULL, '$2y$12$JSVV3nP1gmNq48fIRvCwoekWNoBmWEl72lH9QxVzzqs30YQO6q4o2', 'mahasiswa', NULL, '2026-08-07 01:56:27', '2026-08-07 01:56:27'),
(51, 'Muhammad Supyan', '20221310078@sikemah.ukri', NULL, NULL, '$2y$12$sjCUjNhrHgCXc8i1PljaAus6kwBH2nwEM/XPu5QJ9FkdeJnxixeHW', 'mahasiswa', NULL, '2026-08-07 01:56:28', '2026-08-07 01:56:28'),
(52, 'Neng Eva Masliah', '20221310079@sikemah.ukri', NULL, NULL, '$2y$12$gI0TIlSYs/I9d3aFxaGkW.ix8k7XM95fSa0agWoM32SMgpDKWP8yy', 'mahasiswa', NULL, '2026-08-07 01:56:29', '2026-08-07 01:56:29'),
(53, 'Ratna Santika', '20221310081@sikemah.ukri', NULL, NULL, '$2y$12$4IDp6qGdo0rZYD5V5oYFcOpOoO1GKB0kd4yBVn9jJc.fTi5zK5VV.', 'mahasiswa', NULL, '2026-08-07 01:56:30', '2026-08-07 01:56:30'),
(54, 'Rifa Vida Zahrani', '20221310082@sikemah.ukri', NULL, NULL, '$2y$12$PIvJnC8wvt.SO/1t89h1CON4ATZkgiiFK1ypu5kJpDDGw8cWybiQO', 'mahasiswa', NULL, '2026-08-07 01:56:31', '2026-08-07 01:56:31'),
(55, 'Sam\'un Hakeki Muchlis', '20221310083@sikemah.ukri', NULL, NULL, '$2y$12$VzS1bxy0rP1QifnV0gaeou7fhAs2BpRVe1okQXkgbRZ1c6q5AJg/W', 'mahasiswa', NULL, '2026-08-07 01:56:32', '2026-08-07 01:56:32'),
(56, 'Santi Febrianti', '20221310084@sikemah.ukri', NULL, NULL, '$2y$12$8M/77f2qp/k7eQA/cit0XevI1grFeCKnJA9ut7WalR6SzT/8dKKRW', 'mahasiswa', NULL, '2026-08-07 01:56:33', '2026-08-07 01:56:33'),
(57, 'Siti Rahmah', '20221310085@sikemah.ukri', NULL, NULL, '$2y$12$jsGdOTyedfYHHEaLRiMnJO0cDPI9TCTgo7xXhjCwfgSE5cm61vIwu', 'mahasiswa', NULL, '2026-08-07 01:56:34', '2026-08-07 01:56:34'),
(58, 'Tiara Putri Latifani Dianata', '20221310086@sikemah.ukri', NULL, NULL, '$2y$12$KioeBTDnFHEY3dz.tKdcsOIt8rk4t72yDtNH/Wy6WLibrmSj96VJe', 'mahasiswa', NULL, '2026-08-07 01:56:34', '2026-08-07 01:56:34'),
(59, 'Trisna Prawijaya', '20221310087@sikemah.ukri', NULL, NULL, '$2y$12$EgDfPHB3CPgJ4b3/vtyiU.hiOkzOiyp2n69.f6JPVpPomY0v8e9Ki', 'mahasiswa', NULL, '2026-08-07 01:56:35', '2026-08-07 01:56:35'),
(60, 'Udan', '20221310088@sikemah.ukri', NULL, NULL, '$2y$12$FJHdI3YxUudnMOUl69JlZuAA8OS13sk2LIL4Dnj3mRHo.7nJLfK/u', 'mahasiswa', NULL, '2026-08-07 01:56:36', '2026-08-07 01:56:36'),
(61, 'Yusup Supriyanto', '20221310089@sikemah.ukri', NULL, NULL, '$2y$12$yUGH.8TKBtI5qMPhZNPjAONnDFgXGX0hiKdTNu4sGbqxXROvoWVtG', 'mahasiswa', NULL, '2026-08-07 01:56:37', '2026-08-07 01:56:37'),
(62, 'Zidan Fajar Abdillah', '20221310090@sikemah.ukri', NULL, NULL, '$2y$12$ez.guwBW7tsYLnRCIv2LQ.K/oz.EZgmlVBebeu84l0Y.3U8sDpc8S', 'mahasiswa', NULL, '2026-08-07 01:56:38', '2026-08-07 01:56:38'),
(63, 'Eki Muhammad Heris', '20221310093@sikemah.ukri', NULL, NULL, '$2y$12$bAMgd//ABCHAgrguM0BH.exqnO2jld2Vfuzs5.E6aBxNvEXc9qxpS', 'mahasiswa', NULL, '2026-08-07 01:56:39', '2026-08-07 01:56:39'),
(64, 'Hardian Nurdin', '20221310094@sikemah.ukri', NULL, NULL, '$2y$12$CQ1pivdgIwWQqCD0KvOFKOFwn92gde/u1k4XPwzDor6rTdpxOBXbK', 'mahasiswa', NULL, '2026-08-07 01:56:40', '2026-08-07 01:56:40'),
(65, 'M. Abie Rafdy Fauzi', '20221310098@sikemah.ukri', NULL, NULL, '$2y$12$vOa8uD6oNoFElXNB9HEDYOhWKrABVJzuKuXMAAeFtsZFgVqwBMruS', 'mahasiswa', NULL, '2026-08-07 01:56:41', '2026-08-07 01:56:41'),
(66, 'Raafi Syarahil Azhar', '20221310099@sikemah.ukri', NULL, NULL, '$2y$12$YUt5WhrZbBj7V06KN7viyuTdzpUuCJPqKFF.DBKYEzY9mPvQrPSgu', 'mahasiswa', NULL, '2026-08-07 01:56:42', '2026-08-07 01:56:42'),
(67, 'Adrian Muhamad Ghofur', '20221310101@sikemah.ukri', NULL, NULL, '$2y$12$m4hnompC.iSmD917Vnjqyuyz.I9OnhP9GV/z4zWg0qeSDqBCO7Qha', 'mahasiswa', NULL, '2026-08-07 01:56:43', '2026-08-07 01:56:43'),
(68, 'Dimas Rafsanjani', '20221310102@sikemah.ukri', NULL, NULL, '$2y$12$itiu0JVH.bU/dny9gFjRkOnVxMxto5B50jYkxUb7B6uOIHNB6N3WW', 'mahasiswa', NULL, '2026-08-07 01:56:44', '2026-08-07 01:56:44'),
(69, 'Hamdan Abyadi Suwandi', '20221310104@sikemah.ukri', NULL, NULL, '$2y$12$TaNw71Xp5B67Tm0WvZtPyOde55db5PUJ1/FGUuA2cDjOJ.khMYbaK', 'mahasiswa', NULL, '2026-08-07 01:56:44', '2026-08-07 01:56:44'),
(70, 'Dantic Rosdianti', '20221310105@sikemah.ukri', NULL, NULL, '$2y$12$Gosvk9mFjZrvsVyUd1dh.u25pZHJVB1pC3IcbTBMKOx5QMLYllKyK', 'mahasiswa', NULL, '2026-08-07 01:56:46', '2026-08-07 01:56:46'),
(71, 'Rahmat Hidayat', '20221310106@sikemah.ukri', NULL, NULL, '$2y$12$hPepKih9fSblBKMMG83x6OPP/XqwlRPD6xiN6paBtCaVskyPd0B3G', 'mahasiswa', NULL, '2026-08-07 01:56:46', '2026-08-07 01:56:46'),
(72, 'Reksi Zender Perdian', '20221310107@sikemah.ukri', NULL, NULL, '$2y$12$QP4yD7fOXezhTBx6nwicnuO9SrmkKiybS4tZEHUMvx0sACaz6dhP6', 'mahasiswa', NULL, '2026-08-07 01:56:48', '2026-08-07 01:56:48'),
(73, 'Muhammad Rasyid Shiddiq', '20221310115@sikemah.ukri', NULL, NULL, '$2y$12$VL6f0D0mpp7AcO4OGqbswOigxw4sUNCXHIgyduhEqvq3GAv2QzcqC', 'mahasiswa', NULL, '2026-08-07 01:56:48', '2026-08-07 01:56:48'),
(74, 'Restu Rahmat Fajri', '20221310117@sikemah.ukri', NULL, NULL, '$2y$12$fPqx56kquuzqR1vEwNeKcO6aG4iNG9Rz0IkkCKEQCbrxtdRcXEC9y', 'mahasiswa', NULL, '2026-08-07 01:56:49', '2026-08-07 01:56:49'),
(75, 'Rohman Fajar Muhammad', '20221310119@sikemah.ukri', NULL, NULL, '$2y$12$8vgMW6jnKknALJmKoUyDMuLwG4KhHhdDCQXyn9ay9KRD9vDC92TnG', 'mahasiswa', NULL, '2026-08-07 01:56:50', '2026-08-07 01:56:50'),
(76, 'Asgar Maulana', '20221310120@sikemah.ukri', NULL, NULL, '$2y$12$tvHk6Hhb719D8sqGEcE3KuwiaqVYQaWGRm.jGDqx34qzEJawOUv6e', 'mahasiswa', NULL, '2026-08-07 01:56:50', '2026-08-07 01:56:50'),
(77, 'Mughni Al Muzaki', '20221310123@sikemah.ukri', NULL, NULL, '$2y$12$kvYrPW3JwkDXYOAOyVX8L.zoAwgha6RQPpylIzO1BmUf0rHfE3YIK', 'mahasiswa', NULL, '2026-08-07 01:56:51', '2026-08-07 01:56:51'),
(78, 'Laksamana Raihan Nusabagja', '20221310124@sikemah.ukri', NULL, NULL, '$2y$12$4Kk6Pn3lwFBIVbJP6kMnMeYsZtv.aomF5Pn61AYb.n7MsvXnQ6CT6', 'mahasiswa', NULL, '2026-08-07 01:56:52', '2026-08-07 01:56:52'),
(79, 'Rendana Ahsan', '20191310029@sikemah.ukri', NULL, NULL, '$2y$12$dijnIiShCzqFGNVjZvwuKOIxdrolNAawefEDL1WVgjCkQdBm4FX1G', 'mahasiswa', NULL, '2026-08-07 01:56:53', '2026-08-07 01:56:53'),
(80, 'Raisya Bagja Putra', '20191310038@sikemah.ukri', NULL, NULL, '$2y$12$l9kXoAkEGmRfOJ4yD9V71OCmOtu0eWVU6vFH8q6Ink8MQ9sILfxyW', 'mahasiswa', NULL, '2026-08-07 01:56:54', '2026-08-07 01:56:54'),
(81, 'Melvin Chairul Azfa', '20211310019@sikemah.ukri', NULL, NULL, '$2y$12$J/HiQSie9UciNfEakadsUuOYFCwTUg44HeoZLK5G5L4B327P0KWQS', 'mahasiswa', NULL, '2026-08-07 01:56:54', '2026-08-07 01:56:54'),
(82, 'Mochamad Diass Asyami', '20211310021@sikemah.ukri', NULL, NULL, '$2y$12$juIwqHoApF4q1mPbhq/gYOz6DjkJ/pnuHlrgHBkfon6.Wi1YJKbne', 'mahasiswa', NULL, '2026-08-07 01:56:55', '2026-08-07 01:56:55'),
(83, 'Zaki Aulia Rahman', '20211310031@sikemah.ukri', NULL, NULL, '$2y$12$CoHEZNaPyMyOy45nEtgryubnAk5aRoLgZ0PTeLbtEAeyF/dBmcYWi', 'mahasiswa', NULL, '2026-08-07 01:56:56', '2026-08-07 01:56:56'),
(84, 'RMA Mustafa Islami Pasha', '20211310032@sikemah.ukri', NULL, NULL, '$2y$12$22bnylzCVAmQ3RgXQ.9Ewugas0Ao1xtvXoZwp5SlYQxrb7dwqgFbq', 'mahasiswa', NULL, '2026-08-07 01:56:57', '2026-08-07 01:56:57'),
(85, 'Yandi Prasetyo', '20211310036@sikemah.ukri', NULL, NULL, '$2y$12$3n8h0HJBtFlAsXXBRuZ4cO/rt5aobjf/um/Ulk4gh7Vso0pYnHxmu', 'mahasiswa', NULL, '2026-08-07 01:56:58', '2026-08-07 01:56:58'),
(86, 'Sultan Nan Nasiera', '20211310037@sikemah.ukri', NULL, NULL, '$2y$12$l.ArKo.DKES5X0zIMjw/H.bdyMY.x6pnVgDg272H367A5uGxsOGSW', 'mahasiswa', NULL, '2026-08-07 01:56:59', '2026-08-07 01:56:59'),
(87, 'Dimas Satrio Wicaksono', '20211310046@sikemah.ukri', NULL, NULL, '$2y$12$6dvfJ9yuEPJD5srPOfvIk.rsDMvy4j9M8TGxg4mxfeGlTsCw8WkWG', 'mahasiswa', NULL, '2026-08-07 01:56:59', '2026-08-07 01:56:59'),
(88, 'Naufal Luqman Hafizh', '20211310052@sikemah.ukri', NULL, NULL, '$2y$12$0OUvOp4W./bfWG0WBKvZFeS7PpSnf3jBwbUmT9m1GxlaL0XM3icPq', 'mahasiswa', NULL, '2026-08-07 01:57:00', '2026-08-07 01:57:00'),
(89, 'Muhammad Yasin Al-Asqalani', '20211310054@sikemah.ukri', NULL, NULL, '$2y$12$FTwpsFIfzjAgbdfFOoDBWu//Z84BPScnt2f.MdJvD3zI/.cSF/us6', 'mahasiswa', NULL, '2026-08-07 01:57:01', '2026-08-07 01:57:01'),
(90, 'Ripal Faisal Akbar', '20211310055@sikemah.ukri', NULL, NULL, '$2y$12$qssg9mBMlPjuj44QVHW2cu6MA.jRJxN568Tf5.JkJPVJg9VbAhfrG', 'mahasiswa', NULL, '2026-08-07 01:57:02', '2026-08-07 01:57:02'),
(91, 'Wina Siti Nurohmah', '20211310058@sikemah.ukri', NULL, NULL, '$2y$12$dj7QdokwHK3vBlQttOkuSu3Pi.SgR7LVacWFT1.WBbYrd3nR/axLC', 'mahasiswa', NULL, '2026-08-07 01:57:03', '2026-08-07 01:57:03'),
(92, 'Agus Hermawan', '20211310061@sikemah.ukri', NULL, NULL, '$2y$12$2K0QEF0FTc0ZHvbUIlb6qOOUFasVKxrqYMIy.CSOMQ0JsDTq0BgMe', 'mahasiswa', NULL, '2026-08-07 01:57:03', '2026-08-07 01:57:03'),
(93, 'Dede Shendi Irawan', '20211310071@sikemah.ukri', NULL, NULL, '$2y$12$94qPbwdk/8nkCFVBL5981.IJcvQSH7N98xhM3KkqHGIDLIlB0aN7G', 'mahasiswa', NULL, '2026-08-07 01:57:04', '2026-08-07 01:57:04'),
(94, 'Faliq Kintara Hendriana', '20211310072@sikemah.ukri', NULL, NULL, '$2y$12$L2ldd4yFLsV.Ms2o5jYiNuRiNktDZ5XjFjrmBdDfLw1xqEu.tvwH2', 'mahasiswa', NULL, '2026-08-07 01:57:05', '2026-08-07 01:57:05'),
(95, 'Shandi Julian', '20211310087@sikemah.ukri', NULL, NULL, '$2y$12$teImWiSUXySI7lZKNHShiOb2twv5fmFGdPAFmAzZ.cgbTZJUBMFYy', 'mahasiswa', NULL, '2026-08-07 01:57:06', '2026-08-07 01:57:06'),
(96, 'Moh. Alvian', '20211310088@sikemah.ukri', NULL, NULL, '$2y$12$YoOmG92DIu3u05qhPla66ey4cvC/psSNAt.F.EuZ2B8hxBCnxwX6a', 'mahasiswa', NULL, '2026-08-07 01:57:07', '2026-08-07 01:57:07'),
(97, 'Muhammad Febrian Alkautsar', '20211310092@sikemah.ukri', NULL, NULL, '$2y$12$gm5ntDklccTeDSfZPpAq7eDOIIOPRukUxdDN.sf5Qz/HsXHX/Ey3y', 'mahasiswa', NULL, '2026-08-07 01:57:08', '2026-08-07 01:57:08'),
(98, 'Aang Sandi Rukmana', '20211310093@sikemah.ukri', NULL, NULL, '$2y$12$nU2m.Q.wzrqTXgg8rPSHp.VeQ6M7DVKQBz4BdSULlwLlX2pjXiTV.', 'mahasiswa', NULL, '2026-08-07 01:57:08', '2026-08-07 01:57:08'),
(99, 'Abdul Aziz Nurahmat', '20221310019@sikemah.ukri', NULL, NULL, '$2y$12$04L/RPUntJu5qrFd8QALEufIYrnuXG3i4xEk3hL5oPxJ1LlNCsJUe', 'mahasiswa', NULL, '2026-08-07 01:57:09', '2026-08-07 01:57:09'),
(100, 'Aldi Rizki Nugraha', '20231310002@sikemah.ukri', NULL, NULL, '$2y$12$tjPFBdVQH6eY6LmBVsPsLOsMWVgRHu5r0y.Y/TSjMHQxDKcdWvG26', 'mahasiswa', NULL, '2026-08-07 01:57:10', '2026-08-07 01:57:10'),
(101, 'Bambang Septriyadi Putra', '20231310004@sikemah.ukri', NULL, NULL, '$2y$12$3mkrX85cU5LrjTyHGTREzOzs//JD122dzx4hbKyEFcrNL7cEwqpFm', 'mahasiswa', NULL, '2026-08-07 01:57:11', '2026-08-07 01:57:11'),
(102, 'Diva Rosalinda', '20231310005@sikemah.ukri', NULL, NULL, '$2y$12$sgVwQVVyGXQvSEGE56vkT.cJkP66hTvqbCOAns9h4xC51J6r19wUK', 'mahasiswa', NULL, '2026-08-07 01:57:12', '2026-08-07 01:57:12'),
(103, 'Gita Nur Cahyani Aggriana', '20231310006@sikemah.ukri', NULL, NULL, '$2y$12$GqGDWah3g5.NihuEDeWXd.aUi8MTh0oZQXdcushXElLLCXOKYbFUG', 'mahasiswa', NULL, '2026-08-07 01:57:13', '2026-08-07 01:57:13'),
(104, 'Maulana Ibrahim', '20231310007@sikemah.ukri', NULL, NULL, '$2y$12$qx2crt4mB2J.4p7p.E.XIeqO1djs4AzS.67wDLw4zgBYwfj7uGo8S', 'mahasiswa', NULL, '2026-08-07 01:57:14', '2026-08-07 01:57:14'),
(105, 'Maulana Yusuf', '20231310008@sikemah.ukri', NULL, NULL, '$2y$12$un7yT4WvS0axy2EP8IVDJ.6Ffl9vYYfytjGP4Qdf94EPklsJ3CQjG', 'mahasiswa', NULL, '2026-08-07 01:57:14', '2026-08-07 01:57:14'),
(106, 'Muhamad Deniyansah', '20231310009@sikemah.ukri', NULL, NULL, '$2y$12$.rrjafSQm9kkiHm7R/WsQeH64Dqj0EQ8P85HHKaxr0fJvHc8ih12O', 'mahasiswa', NULL, '2026-08-07 01:57:15', '2026-08-07 01:57:15'),
(107, 'Muhamad Teguh Pawana', '20231310011@sikemah.ukri', NULL, NULL, '$2y$12$Uev/PeJM9.B7TXRWWujxeeCsoaVz6t0/ROI.nmxSArrB4.XY9j2DK', 'mahasiswa', NULL, '2026-08-07 01:57:16', '2026-08-07 01:57:16'),
(108, 'Muhammad Dzaki Awaludin', '20231310012@sikemah.ukri', NULL, NULL, '$2y$12$D6uvNJ.j/ogvJMLzVR44L.1WTGTh09KAyqtTeGyjCnIe/9FnjnRf6', 'mahasiswa', NULL, '2026-08-07 01:57:17', '2026-08-07 01:57:17'),
(109, 'Muhammad Ridho Dwi Subagja', '20231310013@sikemah.ukri', NULL, NULL, '$2y$12$ydwFf.MpfK.X/yACMcSU9eIBkkaiSxSJ7ockzU.msGNGhTP86w/uO', 'mahasiswa', NULL, '2026-08-07 01:57:18', '2026-08-07 01:57:18'),
(110, 'Redinand Naufal Azmi', '20231310014@sikemah.ukri', NULL, NULL, '$2y$12$OImV9.w/v0d/xaxvLMp7qO62bctTKZ69RAaHkIuYshW0ni5mNEXie', 'mahasiswa', NULL, '2026-08-07 01:57:19', '2026-08-07 01:57:19'),
(111, 'Ryan Restu Julianto', '20231310015@sikemah.ukri', NULL, NULL, '$2y$12$5o58NzVH8XaGTePQZefhGuEd/8CfjvrSjqNPiMZ.Q6jrX6Df.lyki', 'mahasiswa', NULL, '2026-08-07 01:57:20', '2026-08-07 01:57:20'),
(112, 'Afiqah Maysarah', '20231310016@sikemah.ukri', NULL, NULL, '$2y$12$ey1qITF0Edyycgq7zRRdwOutMLDJQgu80.01PjWMcuvNGIo8ld0FW', 'mahasiswa', NULL, '2026-08-07 01:57:21', '2026-08-07 01:57:21'),
(113, 'Satria Alparezi', '20231310017@sikemah.ukri', NULL, NULL, '$2y$12$Nu7KTwLIkd8WuLlpIRLkCOZZ.UnX2NhtA6psyqI.Pp4TBNJiI5kx2', 'mahasiswa', NULL, '2026-08-07 01:57:22', '2026-08-07 01:57:22'),
(114, 'Syawal Nur Pantondate', '20231310018@sikemah.ukri', NULL, NULL, '$2y$12$ococo/g0QJ02HYGD99eeXer4KK7QHpsefd6/LXgVACr1vsZscn5Wa', 'mahasiswa', NULL, '2026-08-07 01:57:22', '2026-08-07 01:57:22'),
(115, 'Yuda Prasetya Wibawa', '20231310019@sikemah.ukri', NULL, NULL, '$2y$12$4GMCvbJPIoRIdrVAEM4lRu6OCpFxhSKrHjggwrtTWrEdsnJs4sXJe', 'mahasiswa', NULL, '2026-08-07 01:57:23', '2026-08-07 01:57:23'),
(116, 'M. Rizky Kurniawan', '20231310020@sikemah.ukri', NULL, NULL, '$2y$12$qbR3WF8ka7B8csbsnFtalO579TIVt81WYv.MD.vKmABWV9aG4rWQ.', 'mahasiswa', NULL, '2026-08-07 01:57:25', '2026-08-07 01:57:25'),
(117, 'Entol Akhmad Daffa Haidar Dzakir', '20231310021@sikemah.ukri', NULL, NULL, '$2y$12$NxUdQGSqaRTwybgj7mLbK.zceASbze4XqZm2P8KBMTTlT2sSYfzOK', 'mahasiswa', NULL, '2026-08-07 01:57:26', '2026-08-07 01:57:26'),
(118, 'Adriana Putra Pratama Kusumah', '20231310022@sikemah.ukri', NULL, NULL, '$2y$12$/Wp7Lnwj3QJhmIHK.PoFZel/7aayibK.0t0k3M4oyouduuTEJ.zXu', 'mahasiswa', NULL, '2026-08-07 01:57:27', '2026-08-07 01:57:27'),
(119, 'Afifah Thoharoh', '20231310023@sikemah.ukri', NULL, NULL, '$2y$12$CVfmUbKxPoi5gWG18fQehO0Pp8PLwxaK0MpuRurloqo1agGILc6aq', 'mahasiswa', NULL, '2026-08-07 01:57:27', '2026-08-07 01:57:27'),
(120, 'Areal', '20231310024@sikemah.ukri', NULL, NULL, '$2y$12$276lBcN5XaaqFKk1V885p.Zv9djGdjSiq7gLfO1hJTy96jfQZQyZG', 'mahasiswa', NULL, '2026-08-07 01:57:28', '2026-08-07 01:57:28'),
(121, 'Muhammad Fajar Munandar', '20231310025@sikemah.ukri', NULL, NULL, '$2y$12$KJ97xVT5Mszgm.WOjNDwx.g2imfuN09ylpoUIpguqmD4.ogBCh1Ra', 'mahasiswa', NULL, '2026-08-07 01:57:30', '2026-08-07 01:57:30'),
(122, 'Raka Zilva Inggia', '20231310026@sikemah.ukri', NULL, NULL, '$2y$12$dKOJ4JYbNKjtDMwhjcYg..H5UZ1rgB06P/Z7mmYp5qAbl78LNQxCi', 'mahasiswa', NULL, '2026-08-07 01:57:31', '2026-08-07 01:57:31'),
(123, 'Ririn Dwi Ariyanti', '20231310027@sikemah.ukri', NULL, NULL, '$2y$12$65HGA9OlZWsPJJUpNDgyDOe9qc87X7F7bAy8zIvUbI5Tim73yUVSe', 'mahasiswa', NULL, '2026-08-07 01:57:32', '2026-08-07 01:57:32'),
(124, 'Topan Pratama', '20231310028@sikemah.ukri', NULL, NULL, '$2y$12$ZqrEabYGMpmktoO9Y0SI2.f051pTA9eA/ANupGRcRd4cwGuyAy3IO', 'mahasiswa', NULL, '2026-08-07 01:57:33', '2026-08-07 01:57:33'),
(125, 'Arva Novan Ramadhan', '20231310030@sikemah.ukri', NULL, NULL, '$2y$12$CeUJq9bnzahoNnP8k2MCcO5woZAggxtsXy2guJU6RqcF5jFjruBCG', 'mahasiswa', NULL, '2026-08-07 01:57:34', '2026-08-07 01:57:34'),
(126, 'Gustiar Rifaldi Sulistio', '20231310031@sikemah.ukri', NULL, NULL, '$2y$12$W/KSSo.ssvqyg9WRmLbzD.fT7X05p14umo7NqpLbDNL7sa0fB3pQK', 'mahasiswa', NULL, '2026-08-07 01:57:35', '2026-08-07 01:57:35'),
(127, 'Haffiyan Belvana Fayyaz Qinthara Amanullah', '20231310032@sikemah.ukri', NULL, NULL, '$2y$12$xxVFMtauZC/KHKjTWBzjg.4PoezYmrMxIwupJ6zTETNTrlcIfEMb2', 'mahasiswa', NULL, '2026-08-07 01:57:36', '2026-08-07 01:57:36'),
(128, 'Indah Lestari', '20231310033@sikemah.ukri', NULL, NULL, '$2y$12$g3.XEWFvy9sg000dJSleP.54UbfVOFdNvJKijOv10Pv7IR9RjzTk6', 'mahasiswa', NULL, '2026-08-07 01:57:37', '2026-08-07 01:57:37'),
(129, 'Insania Nabelladina', '20231310034@sikemah.ukri', NULL, NULL, '$2y$12$bRtz9c7LBGxuDacVDAxmQ.zj.kRtqGF2eWfRDAxRrPivNapSlAH3m', 'mahasiswa', NULL, '2026-08-07 01:57:38', '2026-08-07 01:57:38'),
(130, 'Karina Oktaviani', '20231310035@sikemah.ukri', NULL, NULL, '$2y$12$F.RRIDJL8mndQ8ALMlUat.wm7nFIQx0d/L/Uxw3Wg2nNPmRRok1la', 'mahasiswa', NULL, '2026-08-07 01:57:38', '2026-08-07 01:57:38'),
(131, 'Marwan Setyadi', '20231310036@sikemah.ukri', NULL, NULL, '$2y$12$ff0C36QyUztpIrDudJjoT.kE/Seh8.g.X33ybIv6DOQxFigXu78Om', 'mahasiswa', NULL, '2026-08-07 01:57:39', '2026-08-07 01:57:39'),
(132, 'Mochamad Fikri Ghifari', '20231310037@sikemah.ukri', NULL, NULL, '$2y$12$Eunjwd0jRwZWlOMS68UP/OALO0Whgzwe8KUV3/zXM6JM7WfMYIgty', 'mahasiswa', NULL, '2026-08-07 01:57:40', '2026-08-07 01:57:40'),
(133, 'Mochammad Nu\'man Muttaqin', '20231310038@sikemah.ukri', NULL, NULL, '$2y$12$npGfi3pM4tuIopSCzjJoQOVtQ2pE9or9Mcjp1AQGvEiKXc1tZMjf2', 'mahasiswa', NULL, '2026-08-07 01:57:41', '2026-08-07 01:57:41'),
(134, 'Muhammad Ikhsan Kamil', '20231310039@sikemah.ukri', NULL, NULL, '$2y$12$yVjOhHcYBacxkdf0wOj6Ge02i8f/GGirciGy0bWqUjg/qGYIvpgT2', 'mahasiswa', NULL, '2026-08-07 01:57:42', '2026-08-07 01:57:42'),
(135, 'Muhamad Rizqi Nurhaqiqi', '20231310040@sikemah.ukri', NULL, NULL, '$2y$12$fbz/9VyW4p0ARTz5WKF.1enlnA/M5R95.kuY9xiE69Mo2Vv9nQbrS', 'mahasiswa', NULL, '2026-08-07 01:57:44', '2026-08-07 01:57:44'),
(136, 'Rifki Nugrah Awaludin', '20231310041@sikemah.ukri', NULL, NULL, '$2y$12$KZt0QmwaTAHshW7s9ySB2.gG/vRr/b41ZSzkZJORnZmw9K.oLdOai', 'mahasiswa', NULL, '2026-08-07 01:57:47', '2026-08-07 01:57:47'),
(137, 'Audrian Ariel Aqsha', '20231310042@sikemah.ukri', NULL, NULL, '$2y$12$vDLDNl2x1JDbEN8F2ZUkF.KGS9wMpJCIGpe7Gzf9uF1mJt/YEjBfK', 'mahasiswa', NULL, '2026-08-07 01:57:48', '2026-08-07 01:57:48'),
(138, 'Chelsea Aaliyah Yasmin Putrilyra', '20231310043@sikemah.ukri', NULL, NULL, '$2y$12$.4VBdLr7jNw2ojIG2E2Uyuj97.k4j5/LkdBZLIeJq5JiDvU11dQjS', 'mahasiswa', NULL, '2026-08-07 01:57:49', '2026-08-07 01:57:49'),
(139, 'Cindy Oktaviani', '20231310044@sikemah.ukri', NULL, NULL, '$2y$12$fe8hViEEu.oXBRxTi7aODewttfejBf/MjjiB3HrEamwJ3ssiuKGS2', 'mahasiswa', NULL, '2026-08-07 01:57:50', '2026-08-07 01:57:50'),
(140, 'Gun Gun Setiawan', '20231310045@sikemah.ukri', NULL, NULL, '$2y$12$rpvrFIbZ84IIwzW4.33U4.P3txFKLyTx9BWD32Cu9lYTjIA/kKnXi', 'mahasiswa', NULL, '2026-08-07 01:57:50', '2026-08-07 01:57:50'),
(141, 'Muhamad Irvan Alfiyansah', '20231310046@sikemah.ukri', NULL, NULL, '$2y$12$8IcvrXawqnTTwJKPNf6Ha.vevL2Ne.YgZ6kq4MDQKhKAQ8Lp76f86', 'mahasiswa', NULL, '2026-08-07 01:57:51', '2026-08-07 01:57:51'),
(142, 'Muhamad Nur Yanfa', '20231310047@sikemah.ukri', NULL, NULL, '$2y$12$Nit/AAJ/VaoDOswCAO4q2u3vBWq6yATvRUPflgfjZ8v.58nmGt.Xq', 'mahasiswa', NULL, '2026-08-07 01:57:52', '2026-08-07 01:57:52'),
(143, 'Muhammad Oki Ramadhan', '20231310048@sikemah.ukri', NULL, NULL, '$2y$12$7ofmU/dIPTZxaxOhytyfBu/qw6RSCfGKBJAwtJNwnx/Y.IRkeR8z2', 'mahasiswa', NULL, '2026-08-07 01:57:53', '2026-08-07 01:57:53'),
(144, 'Muhammad Qolbia Sani Hikmanudin', '20231310049@sikemah.ukri', NULL, NULL, '$2y$12$QqQFTGEZiVbpCk7Pdo/hNO9Mv5q0g2BWqR.3F2r7rQ8XglPqx79Rq', 'mahasiswa', NULL, '2026-08-07 01:57:54', '2026-08-07 01:57:54'),
(145, 'Nuraeni Yusup', '20231310050@sikemah.ukri', NULL, NULL, '$2y$12$D8fX2IOwzd37/6iNg5m89uUBp4aH7PDOf9fLJp1wF8sF.aVBhtO/y', 'mahasiswa', NULL, '2026-08-07 01:57:55', '2026-08-07 01:57:55'),
(146, 'Pebrian Agung Gumilang', '20231310051@sikemah.ukri', NULL, NULL, '$2y$12$VXuzgnlb5c0G2CaQWddaNOdmp2/S1Ut7CWHfdYC1mDPM7VUNsJi.O', 'mahasiswa', NULL, '2026-08-07 01:57:56', '2026-08-07 01:57:56'),
(147, 'Raka Bayu Prastianto', '20231310052@sikemah.ukri', NULL, NULL, '$2y$12$eqsOrPD1RIAr0bjHrMWTV.7TflfNHhrSWMt6koHu6sEuOQ9mUzuJW', 'mahasiswa', NULL, '2026-08-07 01:57:57', '2026-08-07 01:57:57'),
(148, 'Risa Andriani', '20231310053@sikemah.ukri', NULL, NULL, '$2y$12$fuaxlW/Hxdscat0JpoCcMu3oZ2Ktet7mlGHQFX0NiaTCCJEhmGhmi', 'mahasiswa', NULL, '2026-08-07 01:57:57', '2026-08-07 01:57:57'),
(149, 'Aditya Whisnu Wardhana', '20231310054@sikemah.ukri', NULL, NULL, '$2y$12$k7xmYGDcj5W7jde/lYe.uOhsyPbY1KtY1aLKP/SwFldxi80SXezA.', 'mahasiswa', NULL, '2026-08-07 01:57:58', '2026-08-07 01:57:58'),
(150, 'Alvin Hidayat', '20231310055@sikemah.ukri', NULL, NULL, '$2y$12$ejSr8WX3G5HeHJUYGb7PKeSJp3uxmHB.qd0SzIEDA6Os6Gjl3GH2y', 'mahasiswa', NULL, '2026-08-07 01:57:59', '2026-08-07 01:57:59'),
(151, 'Anang Ismail', '20231310056@sikemah.ukri', NULL, NULL, '$2y$12$/0XUL5M9lij1yr/9N1bFz.o7FdZTgNwsraQHZ1U/jcMIRsIPSnopS', 'mahasiswa', NULL, '2026-08-07 01:58:00', '2026-08-07 01:58:00'),
(152, 'Dhifa Andhika Aria Raksa', '20231310058@sikemah.ukri', NULL, NULL, '$2y$12$VCMHvT8GRWi42gdLnfLGI.0lldTXV82RxsdSAt1tGj0KIhsi1.YQq', 'mahasiswa', NULL, '2026-08-07 01:58:01', '2026-08-07 01:58:01'),
(153, 'Dylan Malik Herlambang', '20231310059@sikemah.ukri', NULL, NULL, '$2y$12$siKYkIoJXSCLL/IPmo.iYevopz3pRwUHJVM.fmrWNEl4ZQKcwJtY6', 'mahasiswa', NULL, '2026-08-07 01:58:02', '2026-08-07 01:58:02'),
(154, 'Ilham Ramdan', '20231310061@sikemah.ukri', NULL, NULL, '$2y$12$943jAZzwo24mIVXnvsKX4.QI2/EgpHT3FxUm/GXtqXlppKAvOwLpG', 'mahasiswa', NULL, '2026-08-07 01:58:03', '2026-08-07 01:58:03'),
(155, 'Iwan Ridwan', '20231310062@sikemah.ukri', NULL, NULL, '$2y$12$oe7QOHrthXRxtb22FUoXKOasiMPXKPRBQzzubNgEyg5PUQI4NSPWe', 'mahasiswa', NULL, '2026-08-07 01:58:04', '2026-08-07 01:58:04'),
(156, 'Juan Octavian Fablo Sinaga', '20231310063@sikemah.ukri', NULL, NULL, '$2y$12$3dKJAwRtwnnZOwYQQbiuQ.kLjV7K.UH161EFl3J02kLWt14Zu8zIW', 'mahasiswa', NULL, '2026-08-07 01:58:05', '2026-08-07 01:58:05'),
(157, 'Lintang Dwi Yanto', '20231310064@sikemah.ukri', NULL, NULL, '$2y$12$/.BCk8jX4FCEUi9E9aqVpuyNavHNCZ9yHkuBnqYsauiIt9osFrkjC', 'mahasiswa', NULL, '2026-08-07 01:58:06', '2026-08-07 01:58:06'),
(158, 'M. Hilmi Alghifari', '20231310066@sikemah.ukri', NULL, NULL, '$2y$12$6PSbJ5NwDUyPvou6EMoYou9O.y/WtNEUhbJzap9X2vJJ/t6//nDg6', 'mahasiswa', NULL, '2026-08-07 01:58:06', '2026-08-07 01:58:06'),
(159, 'M. Rifki Septian', '20231310067@sikemah.ukri', NULL, NULL, '$2y$12$rDCN5E8Pj2ptU7wMXgk5D.AXo8DZPkWqFsaX9YP93U4ovkcZJJeSy', 'mahasiswa', NULL, '2026-08-07 01:58:07', '2026-08-07 01:58:07'),
(160, 'Muhamad Rafli Mahardika Jabran', '20231310070@sikemah.ukri', NULL, NULL, '$2y$12$KYOrGsXQiYoRofv8t5oS..s6MCD7gaDrD/O9Ulq8uvpP21b3/7Rqa', 'mahasiswa', NULL, '2026-08-07 01:58:08', '2026-08-07 01:58:08'),
(161, 'Naya Fitri Nazwa Nur Haliza', '20231310072@sikemah.ukri', NULL, NULL, '$2y$12$3TDPL/Msu8A7h9jdFazijusPnAwX4GJDqxbqagRyA49rsrGF/eFJK', 'mahasiswa', NULL, '2026-08-07 01:58:09', '2026-08-07 01:58:09'),
(162, 'Saddam Hizbul Akbar', '20231310073@sikemah.ukri', NULL, NULL, '$2y$12$IPGE.4rryoSxobujv0JVAuS.p5DBuokJSG2UKDWzDLd7ScMbzlFwe', 'mahasiswa', NULL, '2026-08-07 01:58:10', '2026-08-07 01:58:10'),
(163, 'Shihad', '20231310074@sikemah.ukri', NULL, NULL, '$2y$12$JmdcdMoQ7wawU2pzdvQ08.aAMlIWj3mLMg2D3weuGRRrD9QZzynGG', 'mahasiswa', NULL, '2026-08-07 01:58:11', '2026-08-07 01:58:11'),
(164, 'Triyas Sandrico', '20231310075@sikemah.ukri', NULL, NULL, '$2y$12$jWPugaqP6J8OdDi4KzIf/.KeTVwYx/EG41YrD.5rMfFMaFfmjMWxK', 'mahasiswa', NULL, '2026-08-07 01:58:12', '2026-08-07 01:58:12'),
(165, 'Alif Ardra Rajendra', '20231310077@sikemah.ukri', NULL, NULL, '$2y$12$yk8suVPhQlkKRvVC7aLdZuZBI7blg0r.JkNpdiFODeHRpKhlV76we', 'mahasiswa', NULL, '2026-08-07 01:58:13', '2026-08-07 01:58:13'),
(166, 'Hafidzin Alwi', '20231310078@sikemah.ukri', NULL, NULL, '$2y$12$FAT5pLGVT7aWahAvj3cObOwa1rWwo6Mm3BmA4JTKncfBjPznN6dfK', 'mahasiswa', NULL, '2026-08-07 01:58:13', '2026-08-07 01:58:13'),
(167, 'Laura Destiana Sugesti', '20231310079@sikemah.ukri', NULL, NULL, '$2y$12$5htxN9KT5AwvnDzhEjHTZO1AXMHEhlmi0L4w66vr3ea3iqeFb0ggi', 'mahasiswa', NULL, '2026-08-07 01:58:14', '2026-08-07 01:58:14'),
(168, 'Adis Anggara', '20231310080@sikemah.ukri', NULL, NULL, '$2y$12$py41nPlST4/T7YSRk/17h..UlBMnsd82aMuB8umXiHEH6ujSZeC.O', 'mahasiswa', NULL, '2026-08-07 01:58:15', '2026-08-07 01:58:15'),
(169, 'Ari Rizal Firmansyah', '20231310081@sikemah.ukri', NULL, NULL, '$2y$12$VU2N6.anKWU2xIF/E60Ybucr7b/Xq71Bvnbny5GlcuIKxO2c7uCd6', 'mahasiswa', NULL, '2026-08-07 01:58:16', '2026-08-07 01:58:16'),
(170, 'Ghani Nasywa Fadlurohman', '20231310082@sikemah.ukri', NULL, NULL, '$2y$12$27Ms0Hl/OVXiWCRLyzTNP..iKvGhmtXv8pOeM9NuI3Trhotqi4EKy', 'mahasiswa', NULL, '2026-08-07 01:58:17', '2026-08-07 01:58:17'),
(171, 'Rangga Firmansyah', '20231310083@sikemah.ukri', NULL, NULL, '$2y$12$0eWNVjauNjDFh9az5kmFAueJp9x/sc9qPQq6/9XuUicGc9u5EDk0.', 'mahasiswa', NULL, '2026-08-07 01:58:18', '2026-08-07 01:58:18'),
(172, 'Regya Agistri Nan Senja', '20231310084@sikemah.ukri', NULL, NULL, '$2y$12$nUYr5yO44/UWYx6.p/obxuKH29rEyMhcEdIx6AMPfQ2/VwH.dfL.q', 'mahasiswa', NULL, '2026-08-07 01:58:19', '2026-08-07 01:58:19'),
(173, 'Salma Azizah', '20231310085@sikemah.ukri', NULL, NULL, '$2y$12$tYEPafCQrKoR6KnyJPVfjuCWHugYtI0K/4Ys/49wVWOyxcOzT9P42', 'mahasiswa', NULL, '2026-08-07 01:58:20', '2026-08-07 01:58:20'),
(174, 'Andini Arianty Shaadah', '20231310086@sikemah.ukri', NULL, NULL, '$2y$12$KMIml588AhoWaedFv3vIwOR.ENMY/rZwmG.MDGXagErh2Hw4XIbZe', 'mahasiswa', NULL, '2026-08-07 01:58:20', '2026-08-07 01:58:20'),
(175, 'Maman Hidayat', '20231310088@sikemah.ukri', NULL, NULL, '$2y$12$RAd2g9CgqQG230U6wkvzpe2q2GSZeMqzo6zUyOQRGtsUvxEc7539e', 'mahasiswa', NULL, '2026-08-07 01:58:21', '2026-08-07 01:58:21'),
(176, 'Pandu Alfarizi', '20231310089@sikemah.ukri', NULL, NULL, '$2y$12$4V5GEZhDdEbaoR6ot8f/ju9Zcm/.M6ACVxSBH4ujSPCN0lM5ahhGO', 'mahasiswa', NULL, '2026-08-07 01:58:22', '2026-08-07 01:58:22'),
(177, 'Ahmad Jalaludin', '20231310090@sikemah.ukri', NULL, NULL, '$2y$12$D3.HdNidUzjQZu2ziJAHBeGCzjhg.iqoGlTORw.f6biTyMdsmtqc6', 'mahasiswa', NULL, '2026-08-07 01:58:23', '2026-08-07 01:58:23'),
(178, 'Muhamad Sofian Noor Muhyidin', '20231310092@sikemah.ukri', NULL, NULL, '$2y$12$AVs2u/6gp1QgJdGIzNHcBu2VnJ2z8CykJ0knDjlgzsBTKn821kU2G', 'mahasiswa', NULL, '2026-08-07 01:58:24', '2026-08-07 01:58:24'),
(179, 'Muhammad Ihsan Sirojuddin', '20231310093@sikemah.ukri', NULL, NULL, '$2y$12$0zxyI4MhF.Kcrc6OtH91iu3ez7SKi8XIqZIBcC854sJnhdnWbLI0m', 'mahasiswa', NULL, '2026-08-07 01:58:25', '2026-08-07 01:58:25'),
(180, 'Akbar Syakir', '20231310094@sikemah.ukri', NULL, NULL, '$2y$12$lq2YAsh/Ps38UCDaeTUSHuR0GqYsv5BPGdFx3actPqpqc1Jhpz1Ay', 'mahasiswa', NULL, '2026-08-07 01:58:26', '2026-08-07 01:58:26'),
(181, 'Rafael Adi Permana', '20231310095@sikemah.ukri', NULL, NULL, '$2y$12$GAYfQEy/2x3Lno4HjPMqY..ZL9waqn9phZ6zMoX4kP6HrLUljTk3C', 'mahasiswa', NULL, '2026-08-07 01:58:27', '2026-08-07 01:58:27'),
(182, 'Febriansyah Bunardyn', '20231310096@sikemah.ukri', NULL, NULL, '$2y$12$QvfN8NOZ9vn77xakIwuwauCnOUiOAy76wsIfr18xAeyEZ/IGR4kbq', 'mahasiswa', NULL, '2026-08-07 01:58:28', '2026-08-07 01:58:28'),
(183, 'Ferdiansyah', '20231310097@sikemah.ukri', NULL, NULL, '$2y$12$oqkIcVknyT4f8LbKlHOum.kKOKvR/p8k7P9l4VDaR7yeY9GM/3e/6', 'mahasiswa', NULL, '2026-08-07 01:58:30', '2026-08-07 01:58:30'),
(184, 'Tania Cahyani Putri', '20231310098@sikemah.ukri', NULL, NULL, '$2y$12$ZePvSlR7yau3jJmsofmQl.x/1DIIwzOE/weU3KTwqdoYDC3sXTYQq', 'mahasiswa', NULL, '2026-08-07 01:58:30', '2026-08-07 01:58:30'),
(185, 'Amanda Diah Pitaloka Cita Resmi', '20231310099@sikemah.ukri', NULL, NULL, '$2y$12$MGeF5.oHh21Fl7jMHNPpIeKp.vB3QQmYHCYYvqxltb1G098Eke2I2', 'mahasiswa', NULL, '2026-08-07 01:58:31', '2026-08-07 01:58:31'),
(186, 'Mochamad Yusuf Rahadian', '20231310100@sikemah.ukri', NULL, NULL, '$2y$12$ekswquTf0C26tw23nlY5a.SBxUIDxGj05sXN.dCtQH/Rx34UjeXpu', 'mahasiswa', NULL, '2026-08-07 01:58:32', '2026-08-07 01:58:32'),
(187, 'Restu Adam Wiguna', '20231310101@sikemah.ukri', NULL, NULL, '$2y$12$i/iFVwgTWk7z2Hd8O/UnruNsQVdz.Z6GLiqVk7IVDwo3RvOYF3WVq', 'mahasiswa', NULL, '2026-08-07 01:58:33', '2026-08-07 01:58:33'),
(188, 'Siti Maisyaroh', '20231310102@sikemah.ukri', NULL, NULL, '$2y$12$Tq.bM0buV/bGM9KbE7ALSOWeKIKZA2jtoiURq18nbwE.901Dt0xrG', 'mahasiswa', NULL, '2026-08-07 01:58:34', '2026-08-07 01:58:34'),
(189, 'Mochamad Rifqy Carreliansyah', '20231310103@sikemah.ukri', NULL, NULL, '$2y$12$j40QnBsNksrzs45nADahveBrqZmD.oB99IYLtmMMx6jE4AN39nV6i', 'mahasiswa', NULL, '2026-08-07 01:58:36', '2026-08-07 01:58:36'),
(190, 'Akhmad Fatikhur Rizky', '20231310104@sikemah.ukri', NULL, NULL, '$2y$12$9uPWGLpsjlIaS2WMQuDZqulMw1oZkP/QbZURLctEp.VUHTLenUquu', 'mahasiswa', NULL, '2026-08-07 01:58:37', '2026-08-07 01:58:37'),
(191, 'Fajar Fajjriansyah', '20231310106@sikemah.ukri', NULL, NULL, '$2y$12$5eiUD0b29ZmnjFF/4EDcFeddNvfsMj/4EjFfFDp9GGrenurWZY7OC', 'mahasiswa', NULL, '2026-08-07 01:58:38', '2026-08-07 01:58:38'),
(192, 'Imam Haikal Tambunan', '20231310107@sikemah.ukri', NULL, NULL, '$2y$12$wvk9zKvY1YfA0tYUXD6I5uzTAfcE/i7sFMH7jIIt/LBmpA8wbLcm6', 'mahasiswa', NULL, '2026-08-07 01:58:39', '2026-08-07 01:58:39'),
(193, 'Mohamad Sudirlan', '20231310108@sikemah.ukri', NULL, NULL, '$2y$12$PNaNQL0eBAp.xvtOUo4T0u1Kf1.asfj/S9eCUWurM04wLP2xzW1Ty', 'mahasiswa', NULL, '2026-08-07 01:58:40', '2026-08-07 01:58:40'),
(194, 'M. Fauzan Alang Samudera', '20231310109@sikemah.ukri', NULL, NULL, '$2y$12$jBllP0GLaUhVzIiJ42Y8iOSwc9/n4wll0KCKx8GoR9fM2KgCtV6oq', 'mahasiswa', NULL, '2026-08-07 01:58:41', '2026-08-07 01:58:41'),
(195, 'Ruwi Ramadhani', '20231310110@sikemah.ukri', NULL, NULL, '$2y$12$SmI1raB.nInRrmo81h0ENunKXvPze96YhQWIglZHBN.Osn8qkRILq', 'mahasiswa', NULL, '2026-08-07 01:58:42', '2026-08-07 01:58:42'),
(196, 'Siti Khodijah Nasution', '20231310111@sikemah.ukri', NULL, NULL, '$2y$12$VgpfEkgyA2WM8WZjpO/JG.BF0t2g3L1nsFBWZD5g0qfKa69YwkvVK', 'mahasiswa', NULL, '2026-08-07 01:58:43', '2026-08-07 01:58:43'),
(197, 'Stevi Eka Putri', '20231310112@sikemah.ukri', NULL, NULL, '$2y$12$qvZpov7lx2Hj4FkEg6g9ruT4tWWJNWd.Xlxa.8Th2coV0BuC1/Hpe', 'mahasiswa', NULL, '2026-08-07 01:58:44', '2026-08-07 01:58:44'),
(198, 'Jack Nicolson Silvester', '20241310001@sikemah.ukri', NULL, NULL, '$2y$12$jluh7bMZE5QhHlBM6/KJDOlc.GJ50toOGq8BMCMXEd0sgJ9JBaEqa', 'mahasiswa', NULL, '2026-08-07 01:58:45', '2026-08-07 01:58:45'),
(199, 'Syahnuran Kaafii', '20241310002@sikemah.ukri', NULL, NULL, '$2y$12$8HHBP2nstNgaDJzXGDNE.Oz7GScRXmcfYNANa9z6UtAbNz3sZsnCC', 'mahasiswa', NULL, '2026-08-07 01:58:46', '2026-08-07 01:58:46'),
(200, 'Agung Setiawan', '20241310003@sikemah.ukri', NULL, NULL, '$2y$12$sYtppi8LZP6Y3RG1qyx4yO3msiNrrD0Vzdm5qEvuyGIbOkeGEjsyy', 'mahasiswa', NULL, '2026-08-07 01:58:47', '2026-08-07 01:58:47'),
(201, 'Mohammad Wilman Saputra', '20241310004@sikemah.ukri', NULL, NULL, '$2y$12$JRdVHW9Df1MJ2BpFwkdj0Otbhan3ljXAmGURwZZqhYDDtlfBJXNLC', 'mahasiswa', NULL, '2026-08-07 01:58:47', '2026-08-07 01:58:47'),
(202, 'Airin Sipa Anggraeni', '20241310005@sikemah.ukri', NULL, NULL, '$2y$12$9EMlH4jLkLwyO6IfnwbCLeAaP0dLhKphMTLISfCGfrf9W0Nc1kYCO', 'mahasiswa', NULL, '2026-08-07 01:58:48', '2026-08-07 01:58:48'),
(203, 'Amirudin', '20241310006@sikemah.ukri', NULL, NULL, '$2y$12$3Waky/c5OxPdmM9fvN017uJ/lVUku6I7bovDww.EzueAaiUQdZrSm', 'mahasiswa', NULL, '2026-08-07 01:58:49', '2026-08-07 01:58:49'),
(204, 'Nazmi Priyatama Suherman', '20241310007@sikemah.ukri', NULL, NULL, '$2y$12$1X.xVaF.eQtph4raNOWi1OApi3buSJG/Thr3GKPYGMV1vWpH8ce9i', 'mahasiswa', NULL, '2026-08-07 01:58:50', '2026-08-07 01:58:50'),
(205, 'Sandyarama Raka Adikara', '20241310008@sikemah.ukri', NULL, NULL, '$2y$12$tcN.pG.lAOCBbGqBbGNQw.IGqqk4RUXNej5cFRrdAp5p4JpPx0.ei', 'mahasiswa', NULL, '2026-08-07 01:58:51', '2026-08-07 01:58:51'),
(206, 'Umar', '20241310009@sikemah.ukri', NULL, NULL, '$2y$12$58qFJfc31xRTPvfTL62eUeQeeu6akjphE/QKGgnN8Bwglwwxm4Dsu', 'mahasiswa', NULL, '2026-08-07 01:58:52', '2026-08-07 01:58:52'),
(207, 'Abifemi Reyhan Nafta Vieri', '20241310010@sikemah.ukri', NULL, NULL, '$2y$12$l1urDqy.snyN.KYh9xxE.O/dSN57L/DNGxxg4nKnj/BiUkuTCrSnO', 'mahasiswa', NULL, '2026-08-07 01:58:53', '2026-08-07 01:58:53'),
(208, 'Haniep Fathan Riziq', '20241310011@sikemah.ukri', NULL, NULL, '$2y$12$anLiEkO/odnp3RkabsbQWOBSyzo7l6ozDNYVYS5fz.Uwf6n/l21Ze', 'mahasiswa', NULL, '2026-08-07 01:58:54', '2026-08-07 01:58:54'),
(209, 'Mochamad Dzaki Ramadhan', '20241310012@sikemah.ukri', NULL, NULL, '$2y$12$1VpRSNPlho63.M0vztpX2O6iPgKMQJRY1ewHCONsYVqJw9g044meO', 'mahasiswa', NULL, '2026-08-07 01:58:55', '2026-08-07 01:58:55'),
(210, 'Mugia Febriana Salwa', '20241310013@sikemah.ukri', NULL, NULL, '$2y$12$YckRO2o.gaTH4BsRN5Hm1uzw8WdPKVYJ1Rfn5jJh7FnFOE4ZRNL9.', 'mahasiswa', NULL, '2026-08-07 01:58:56', '2026-08-07 01:58:56'),
(211, 'Anggun Lestari', '20241310014@sikemah.ukri', NULL, NULL, '$2y$12$KtRy4ZHbonCPdcZeMWc.7uzopnAb14VU7faYjIQ3PE7Nd.s.HYI4S', 'mahasiswa', NULL, '2026-08-07 01:58:57', '2026-08-07 01:58:57'),
(212, 'Nurdiansyah', '20241310015@sikemah.ukri', NULL, NULL, '$2y$12$7em6XWu.LiB2efc3.gq3euvYjz.Z7be/qkaYnrL4aasZ7Ra9Bd2Pi', 'mahasiswa', NULL, '2026-08-07 01:58:57', '2026-08-07 01:58:57'),
(213, 'Putu Alif Milanarsa', '20241310016@sikemah.ukri', NULL, NULL, '$2y$12$kiEB6mCeREibyxfHWwJwjuDSTo5Reu4GkCeKOeCFSp.TeW4Qb23Zu', 'mahasiswa', NULL, '2026-08-07 01:58:58', '2026-08-07 01:58:58'),
(214, 'Yoyo Ridho Prasetio', '20241310017@sikemah.ukri', NULL, NULL, '$2y$12$HHbYOmBDcbTi9CeShZH9heuq8rp7KG5Rvly00L2dZ0iqjtaO5lHGe', 'mahasiswa', NULL, '2026-08-07 01:58:59', '2026-08-07 01:58:59'),
(215, 'Ali Altarikh Muharom', '20241310018@sikemah.ukri', NULL, NULL, '$2y$12$FHlBvC2t9xHjviJP/ZyzC.W4DrksideRYt.TUVLBjM2TyzT7uZ6r6', 'mahasiswa', NULL, '2026-08-07 01:59:00', '2026-08-07 01:59:00'),
(216, 'Siti Fatimah Assyadia Rohani', '20241310019@sikemah.ukri', NULL, NULL, '$2y$12$MBf7AqoHs3ibZGT5bgi3NeztDKmmET.6vWaJKzQ/xkVaGFXjol.8y', 'mahasiswa', NULL, '2026-08-07 01:59:01', '2026-08-07 01:59:01'),
(217, 'Wahyudin Ihsan', '20241310020@sikemah.ukri', NULL, NULL, '$2y$12$7ACrJFdQkfc2X9e68O1hGuvKWSJvoCekZGcqO3JU6Q7esZkjJBeai', 'mahasiswa', NULL, '2026-08-07 01:59:01', '2026-08-07 01:59:01'),
(218, 'Taufiq Rahman', '20241310021@sikemah.ukri', NULL, NULL, '$2y$12$nhUECr/YhaQLztP.o0Wsj.K2WQuPqNlGhLDKpWblf81EJx5wTkgi2', 'mahasiswa', NULL, '2026-08-07 01:59:02', '2026-08-07 01:59:02'),
(219, 'Arefan Asbi Maulana', '20241310022@sikemah.ukri', NULL, NULL, '$2y$12$qkPMkvaXyBDgeNDq5X2.ce1LdHxUSAfZUI6QdK4xeYmL1bOFRv4B2', 'mahasiswa', NULL, '2026-08-07 01:59:03', '2026-08-07 01:59:03'),
(220, 'Artur Ramandika', '20241310023@sikemah.ukri', NULL, NULL, '$2y$12$lbCgaPUbzKybddSdqRvy8eGZX69kdFDmfES3Riu2.VZwrTIQ5KJni', 'mahasiswa', NULL, '2026-08-07 01:59:05', '2026-08-07 01:59:05'),
(221, 'Fauzan Akbar Ansyori', '20241310024@sikemah.ukri', NULL, NULL, '$2y$12$WPCdYLUZNpTGx9oo.OvHlelYk9k.EIFyCEADLW5qfjI1SY7CECRZ2', 'mahasiswa', NULL, '2026-08-07 01:59:05', '2026-08-07 01:59:05'),
(222, 'Michael Revenge Abghi Khalilurahman', '20241310025@sikemah.ukri', NULL, NULL, '$2y$12$D5Yl8VEMmGLgfVWKyssR9eVQeTLjfegho8pY1HSppktEV6ciMQY.m', 'mahasiswa', NULL, '2026-08-07 01:59:06', '2026-08-07 01:59:06'),
(223, 'Eulis Nuraidah', '20241310026@sikemah.ukri', NULL, NULL, '$2y$12$tuGzZv6hpDcw916B4xIxIuSLCo3q7IFfZJanr2PpwMCN9N7NaKMre', 'mahasiswa', NULL, '2026-08-07 01:59:07', '2026-08-07 01:59:07'),
(224, 'Mohamad Rafi Hadinata', '20241310027@sikemah.ukri', NULL, NULL, '$2y$12$BBwW3Grj6uJA3KtiBMoEueapVfM.yTO8iWaZentoc6pX1xn1DuATm', 'mahasiswa', NULL, '2026-08-07 01:59:08', '2026-08-07 01:59:08'),
(225, 'Muhammad Ardi Mardiansyah', '20241310028@sikemah.ukri', NULL, NULL, '$2y$12$GKKOZJiSPF8O1uhQVLariOscgzPsuhtHlrTOKHqdy/L2QbQB9Sqse', 'mahasiswa', NULL, '2026-08-07 01:59:10', '2026-08-07 01:59:10'),
(226, 'Putri Angraeni', '20241310029@sikemah.ukri', NULL, NULL, '$2y$12$6hVAmwPnWL6NFeVLev84.OB3QbEJvaCPS.I1NW/2U7n3wBE.RPtT.', 'mahasiswa', NULL, '2026-08-07 01:59:11', '2026-08-07 01:59:11'),
(227, 'Tio Kati Nuansya', '20241310030@sikemah.ukri', NULL, NULL, '$2y$12$W.2XmdvICoRY/gYN1TSTbuhqhFCdjfJZLMC8liLYYvHrCed3/RrtK', 'mahasiswa', NULL, '2026-08-07 01:59:12', '2026-08-07 01:59:12'),
(228, 'Alamudin S. Daka', '20241310031@sikemah.ukri', NULL, NULL, '$2y$12$Pn0NqAAYrnraVHR6/NJZfOoMr0eX83g7lsgptwdERDArwUZaMGB/O', 'mahasiswa', NULL, '2026-08-07 01:59:13', '2026-08-07 01:59:13'),
(229, 'Farid Faid Permana', '20241310032@sikemah.ukri', NULL, NULL, '$2y$12$RHMaEu1Zv00fYtjmN4R19OgSepMU/sD8Lf39hMEnsn9SxQhPFxlS6', 'mahasiswa', NULL, '2026-08-07 01:59:14', '2026-08-07 01:59:14'),
(230, 'Haris Ramdhani', '20241310033@sikemah.ukri', NULL, NULL, '$2y$12$ivIyadZwh.rFT2gNq5ueQ.PrW4I/k7XJ1My7Hr1.f1z5zYf68l5ru', 'mahasiswa', NULL, '2026-08-07 01:59:16', '2026-08-07 01:59:16'),
(231, 'Mochamad Rafif Zain Hidayat', '20241310034@sikemah.ukri', NULL, NULL, '$2y$12$.6IkHpxH3W02Ry3i3h0EtObO6NemOHUJhgIv9kGMak0wQioINTCu2', 'mahasiswa', NULL, '2026-08-07 01:59:18', '2026-08-07 01:59:18'),
(232, 'Arini Ulfa Mawaddah', '20241310035@sikemah.ukri', NULL, NULL, '$2y$12$svKP7kpnae1B3iiFb5Z14.XUO57zBuuHbVz8dZqtowE4n1tnS.uxO', 'mahasiswa', NULL, '2026-08-07 01:59:20', '2026-08-07 01:59:20'),
(233, 'Ajeng Pipik Fadilah', '20241310036@sikemah.ukri', NULL, NULL, '$2y$12$QTnn4weZ3JeiZQfcxqnlHe0/IhViw2OEvL45UVGQnCe36H8zz5mtm', 'mahasiswa', NULL, '2026-08-07 01:59:21', '2026-08-07 01:59:21'),
(234, 'Dahlia Novaliza', '20241310037@sikemah.ukri', NULL, NULL, '$2y$12$qk/bbAag/bJ4qS8l.g7Z7uXmZR.f2S5QPM8lPq.bd9e5NC3uvz6nS', 'mahasiswa', NULL, '2026-08-07 01:59:22', '2026-08-07 01:59:22'),
(235, 'Atharrayna Deryansyah', '20241310038@sikemah.ukri', NULL, NULL, '$2y$12$lQi.R7Z6fbsv8iboRHcEgu/IcvayqO7QgWmQfc.lr39Kq3wuUdby6', 'mahasiswa', NULL, '2026-08-07 01:59:23', '2026-08-07 01:59:23'),
(236, 'Bryan Giofan B. Laybahas', '20241310039@sikemah.ukri', NULL, NULL, '$2y$12$CNnMcCtltoQZaupKTbXvC.BEhODnvud7nONIal.YhUyg8nIvt5NKO', 'mahasiswa', NULL, '2026-08-07 01:59:24', '2026-08-07 01:59:24'),
(237, 'Khaila Rianisa Almadia', '20241310040@sikemah.ukri', NULL, NULL, '$2y$12$RH9xbvYjcp0F6rpQOzo3Hez/7KrTTehu5lWPZkKQIInd0qwCw6U9O', 'mahasiswa', NULL, '2026-08-07 01:59:25', '2026-08-07 01:59:25'),
(238, 'M. Rayhan Adijaya', '20241310041@sikemah.ukri', NULL, NULL, '$2y$12$FQfljFPqEp4kMFq5VLjWi.U70Ez2n.AVP84G37PERUSCBqpGR2J8S', 'mahasiswa', NULL, '2026-08-07 01:59:26', '2026-08-07 01:59:26'),
(239, 'Melani Marnia Putri', '20241310042@sikemah.ukri', NULL, NULL, '$2y$12$5he7jC/T5FOH7sDVPhfalunJNXvCAzKfRjIuApUtpL2vn/dlAM/0O', 'mahasiswa', NULL, '2026-08-07 01:59:26', '2026-08-07 01:59:26'),
(240, 'Muhammad Zaky Rahadian', '20241310043@sikemah.ukri', NULL, NULL, '$2y$12$7s.yn0zf8xLtpnJbSXbjcuQE6EhWydxXRRyWQ4uEst8LcVsz1lJ6m', 'mahasiswa', NULL, '2026-08-07 01:59:27', '2026-08-07 01:59:27'),
(241, 'Reivano Virgie Marcelino', '20241310044@sikemah.ukri', NULL, NULL, '$2y$12$M3BTZXzB8pSCCOB/pC2VU.tYN1x0BPMhnkuNA5so.y2NkqgCBGRpe', 'mahasiswa', NULL, '2026-08-07 01:59:28', '2026-08-07 01:59:28'),
(242, 'Ridho Tri Adhitomo', '20241310045@sikemah.ukri', NULL, NULL, '$2y$12$Z0O2IHAlHrAqy4CQ0jGyRe2nS.oQBixZ9b/yHbbYf0nXY9GIPykd6', 'mahasiswa', NULL, '2026-08-07 01:59:29', '2026-08-07 01:59:29'),
(243, 'Rifat Ilham Qulbi', '20241310046@sikemah.ukri', NULL, NULL, '$2y$12$ZdJS/XRv//ppAHrQGO70NeyaOKlIgWGmnEGx1y0lyN3.APC5VWMjy', 'mahasiswa', NULL, '2026-08-07 01:59:30', '2026-08-07 01:59:30'),
(244, 'Reyfasha Fadlan Azizan', '20241310047@sikemah.ukri', NULL, NULL, '$2y$12$XQ6sjj49IOPc70Wcu1TDcuWxPcFKnl404xIXYdylvtRATowWWTioa', 'mahasiswa', NULL, '2026-08-07 01:59:31', '2026-08-07 01:59:31'),
(245, 'Febi Setiawan', '20241310048@sikemah.ukri', NULL, NULL, '$2y$12$CHf.dr9zu3y4kAX2WLAY6Ohs05O9u3GxhAhJeCrP2NgcBnNG.emiO', 'mahasiswa', NULL, '2026-08-07 01:59:32', '2026-08-07 01:59:32'),
(246, 'Gun Gun Gunawan', '20241310049@sikemah.ukri', NULL, NULL, '$2y$12$pFnkzWuFKOVl2ED.W7uXueU9cguzqKbqWRZnFxu6qyiN3ifk1VOMW', 'mahasiswa', NULL, '2026-08-07 01:59:34', '2026-08-07 01:59:34'),
(247, 'Hendriana', '20241310051@sikemah.ukri', NULL, NULL, '$2y$12$hdn0duoOOjg9izmopjTJguKEB3XTUj6tIYABz2jm5NdO7zPYNj3gS', 'mahasiswa', NULL, '2026-08-07 01:59:35', '2026-08-07 01:59:35'),
(248, 'Raikal Firansyah', '20241310052@sikemah.ukri', NULL, NULL, '$2y$12$e8e54qfOZeS4mwwKh2sbEO7YGU1.gpnXVYmDK.5KgNmk5fLgzevxC', 'mahasiswa', NULL, '2026-08-07 01:59:36', '2026-08-07 01:59:36'),
(249, 'Vina Ardita', '20241310053@sikemah.ukri', NULL, NULL, '$2y$12$Dy2GZyWnnwq2i1d/yZLcHO4cgpLyJS1/bvDgXv/gKaDjCa4gIr8z.', 'mahasiswa', NULL, '2026-08-07 01:59:37', '2026-08-07 01:59:37'),
(250, 'Faris Ali Husamuddin', '20241310055@sikemah.ukri', NULL, NULL, '$2y$12$bj8m1wLnbmvKfZELSrDUI.ZmICGbI1qPyvVXnWDMJTbx0mKgJvQCm', 'mahasiswa', NULL, '2026-08-07 01:59:38', '2026-08-07 01:59:38'),
(251, 'Subhanjaya Angga Atmaja', '20181310048@sikemah.ukri', NULL, NULL, '$2y$12$q8CEbQwcE8br8Fz3Ioz9ROxTi3wnVOiS73zJFSHy4Anz.E9wCKGeG', 'mahasiswa', NULL, '2026-08-07 01:59:39', '2026-08-07 01:59:39'),
(252, 'Rendi Raihan', '20251310001@sikemah.ukri', NULL, NULL, '$2y$12$/NibcM6sQ1GOsWIq7N4.gOR8ArexxezjHCH.NBOhJtHKNrda7P.cy', 'mahasiswa', NULL, '2026-08-07 01:59:40', '2026-08-07 01:59:40'),
(253, 'Difta Fasla Prasetya', '20251310002@sikemah.ukri', NULL, NULL, '$2y$12$3QA5HRpsoLPP7H0QHqjvtuBD1hR43adFiD9fX0zY5.bOGGdAc.iY.', 'mahasiswa', NULL, '2026-08-07 01:59:41', '2026-08-07 01:59:41'),
(254, 'Muhamad Ridane', '20251310003@sikemah.ukri', NULL, NULL, '$2y$12$YoBBUZUZwDZIS5sw5q9gkegqEAOX1MmP0tD/dvTOEovImdXJwU2/O', 'mahasiswa', NULL, '2026-08-07 01:59:42', '2026-08-07 01:59:42'),
(255, 'Dafa Ajna', '20251310004@sikemah.ukri', NULL, NULL, '$2y$12$6AXerMQ7TOw.OI64xYaWtOmt40x7nXOztFWhOI0urgGm4QcODqakq', 'mahasiswa', NULL, '2026-08-07 01:59:43', '2026-08-07 01:59:43'),
(256, 'Muhamad Husni Socheh Mashuddin', '20251310005@sikemah.ukri', NULL, NULL, '$2y$12$Gwcz3ud4k09mf0QC3WllDuwW.0qUyYN.4Rr7qV94akfLYzukffDR6', 'mahasiswa', NULL, '2026-08-07 01:59:44', '2026-08-07 01:59:44'),
(257, 'Razelia Reva Felisha', '20251310006@sikemah.ukri', NULL, NULL, '$2y$12$YDQ7fpwo/xL2SlLSbbESFeobIrbiVc5FqSDdbRzISDAKRlMMaGaJ.', 'mahasiswa', NULL, '2026-08-07 01:59:45', '2026-08-07 01:59:45'),
(258, 'Devina Hindriastika', '20251310007@sikemah.ukri', NULL, NULL, '$2y$12$zVRo91wfSzla7A3qzsEsW.9zOjF.ja6PPZTdEpJTIgVS3nLgvNnxG', 'mahasiswa', NULL, '2026-08-07 01:59:46', '2026-08-07 01:59:46');
INSERT INTO `pengguna` (`id`, `nama`, `email`, `sso_username`, `email_verified_at`, `password`, `peran`, `remember_token`, `created_at`, `updated_at`) VALUES
(259, 'Nisa Nurfadila', '20251310008@sikemah.ukri', NULL, NULL, '$2y$12$1cRGSeBewA9aA6M0OgLVTOkMNEUP4z45hsOd7qNYcgnzwN6SyyqqG', 'mahasiswa', NULL, '2026-08-07 01:59:47', '2026-08-07 01:59:47'),
(260, 'Umar Fatih Firdaus', '20251310009@sikemah.ukri', NULL, NULL, '$2y$12$juLIvzLpAFcqNcCe1WwHa.XzP0nIi4nmSt24jQS32FrDGKoBzcurq', 'mahasiswa', NULL, '2026-08-07 01:59:48', '2026-08-07 01:59:48'),
(261, 'Cesar Rais Akhtar', '20251310010@sikemah.ukri', NULL, NULL, '$2y$12$pd2w/P5i4AMmkpBOeHLcsuzt5cShWtbSXC0ZHmh/KQcT.VQbR4hZi', 'mahasiswa', NULL, '2026-08-07 01:59:49', '2026-08-07 01:59:49'),
(262, 'Dimas Pebrian Pratama', '20251310011@sikemah.ukri', NULL, NULL, '$2y$12$AEt8GlOn6N4wYeE5hi0EZeA46neIswvDGxSo4AsgM330AiaQ/m5ra', 'mahasiswa', NULL, '2026-08-07 01:59:50', '2026-08-07 01:59:50'),
(263, 'Nur Intan Fitriani', '20251310012@sikemah.ukri', NULL, NULL, '$2y$12$/zdsn1qP6zc7ROfA8Hd0pO6BVUM7tydt5BipKvW9kueQSo.KZVI1S', 'mahasiswa', NULL, '2026-08-07 01:59:51', '2026-08-07 01:59:51'),
(264, 'Aliya Rahma', '20251310013@sikemah.ukri', NULL, NULL, '$2y$12$6lUYmbASleXiqL11PtxCg.V.yZWux7FlqJk7qxb0JnhAK89PCOnDm', 'mahasiswa', NULL, '2026-08-07 01:59:52', '2026-08-07 01:59:52'),
(265, 'Zaki Firjatullah', '20251310014@sikemah.ukri', NULL, NULL, '$2y$12$innFPTkMspsdNnbnNYANWe8ux6UEW7./wZLCIXECzKDr8KkUyRdfi', 'mahasiswa', NULL, '2026-08-07 01:59:52', '2026-08-07 01:59:52'),
(266, 'Irsyad Maulana Iswandi', '20251310015@sikemah.ukri', NULL, NULL, '$2y$12$SY6YQsdiYbOV7a40Btd/X.5ob/B14UIF7Go.cWzPhgcguplG4TxB.', 'mahasiswa', NULL, '2026-08-07 01:59:53', '2026-08-07 01:59:53'),
(267, 'Rizki Pauzi Akbar', '20251310016@sikemah.ukri', NULL, NULL, '$2y$12$M.K3h8F.HQIZYSy10R1HUuhvg8YcHxeYp/lppfDgjC6/hrj2h0.fu', 'mahasiswa', NULL, '2026-08-07 01:59:54', '2026-08-07 01:59:54'),
(268, 'Sultan Dafa Wahyudin', '20251310017@sikemah.ukri', NULL, NULL, '$2y$12$bw543fconsJpuaRaCFSbZOHq4EOm9agaWy6UR3Hh.tQbdRpqwzFm6', 'mahasiswa', NULL, '2026-08-07 01:59:55', '2026-08-07 01:59:55'),
(269, 'Moch. Syaepul Putra', '20251310018@sikemah.ukri', NULL, NULL, '$2y$12$FT3QBsSd3SOJX69c4Yr9QeR4tBuQyK9YPIcP6pziKE7IvWwZupaOi', 'mahasiswa', NULL, '2026-08-07 01:59:56', '2026-08-07 01:59:56'),
(270, 'Adel Bilbina Br Ginting', '20251310019@sikemah.ukri', NULL, NULL, '$2y$12$9nJ5USYrHlF0qwxMGNqXFu8UvmfhD/86lHi80s6DKMu0O9Z8MGsHi', 'mahasiswa', NULL, '2026-08-07 01:59:56', '2026-08-07 01:59:56'),
(271, 'Rubben Adria', '20251310020@sikemah.ukri', NULL, NULL, '$2y$12$4LouVHtMv7a2rf288R/8nePkAOLPJiySu/aDaoCJs8LYGPO.h.m..', 'mahasiswa', NULL, '2026-08-07 01:59:57', '2026-08-07 01:59:57'),
(272, 'Bimo Wirahadiansyah', '20251310021@sikemah.ukri', NULL, NULL, '$2y$12$nBnIsP/CRwnK/jkCOfLJ1.n2bf1Rwiu0yOTGD3Pk6yeovm9T0nj7e', 'mahasiswa', NULL, '2026-08-07 01:59:58', '2026-08-07 01:59:58'),
(273, 'Arya Nurpajri', '20251310022@sikemah.ukri', NULL, NULL, '$2y$12$HLQb2bPtYrNV.0OQZUODveKHBEzBEoVOH0G30mFdf6y7rORyhFJ06', 'mahasiswa', NULL, '2026-08-07 01:59:59', '2026-08-07 01:59:59'),
(274, 'Aldi Abdul Rahman Ali', '20251310023@sikemah.ukri', NULL, NULL, '$2y$12$qF8GIwWSRM6/w2V5YSzP1uOqFy.SK1GwOns1vdwMeNF0oOxgLkjqu', 'mahasiswa', NULL, '2026-08-07 01:59:59', '2026-08-07 01:59:59'),
(275, 'Widya Shafitri', '20251310024@sikemah.ukri', NULL, NULL, '$2y$12$D7PYK4bDhAxS376WbT2SAeV7qoa7a7An4me79wfzBAA4OIAsMmfDu', 'mahasiswa', NULL, '2026-08-07 02:00:00', '2026-08-07 02:00:00'),
(276, 'Keisha Violavisca Salsabila Kusumah', '20251310025@sikemah.ukri', NULL, NULL, '$2y$12$HJ4wqCWZBb3oJ6VEOyX4iOS9Q617F/xnnVnIvvbD.bWX6W3.guo.G', 'mahasiswa', NULL, '2026-08-07 02:00:01', '2026-08-07 02:00:01'),
(277, 'Nadya Tiara Alvaneyza', '20251310026@sikemah.ukri', NULL, NULL, '$2y$12$bN5eqYGAQtlFDaY5EeT3KOLdZmB9kXPX1rQMUyORBKaDvU5RmfB6C', 'mahasiswa', NULL, '2026-08-07 02:00:02', '2026-08-07 02:00:02'),
(278, 'Dimas Kurniawan', '20251310027@sikemah.ukri', NULL, NULL, '$2y$12$tGcfCclOPoLRuIGLOzrm7eM7ic1D7gOlvm13tkiRZLtNTultnyNXa', 'mahasiswa', NULL, '2026-08-07 02:00:02', '2026-08-07 02:00:02'),
(279, 'Mohammad Raya Dwi Ramadan', '20251310029@sikemah.ukri', NULL, NULL, '$2y$12$S8maNzvf11qkwQ1t5N2mKerbs7eYg9GVGd9lmmgRDMI7dJAxa7xSm', 'mahasiswa', NULL, '2026-08-07 02:00:03', '2026-08-07 02:00:03'),
(280, 'Akmal Fauzi', '20251310030@sikemah.ukri', NULL, NULL, '$2y$12$6jGhz0NhSf3ZHyDUOmwdlumHXuMNX8MEaBeYpD5ZXKhhOPk550MZG', 'mahasiswa', NULL, '2026-08-07 02:00:04', '2026-08-07 02:00:04'),
(281, 'Muhammad Avriadi Maulana', '20251310031@sikemah.ukri', NULL, NULL, '$2y$12$iFxAtcCpxgGZMCrO3ycDtOt5xz.y0.344A18vbWKMEypyN5/rUZQi', 'mahasiswa', NULL, '2026-08-07 02:00:05', '2026-08-07 02:00:05'),
(282, 'Fauzan Nur Rahman', '20251310032@sikemah.ukri', NULL, NULL, '$2y$12$P.KJol9ZxAfani7a1KBhmOpYJNQAzK2EeuACF8UUeJyquLSgs/PoO', 'mahasiswa', NULL, '2026-08-07 02:00:05', '2026-08-07 02:00:05'),
(283, 'Alukal Akbar Hendarsyah', '20251310033@sikemah.ukri', NULL, NULL, '$2y$12$ncf5LgmfYkP6l8897EKAA.JogJcU.l6cfkq/X.v.Yc1AAckNU2lbO', 'mahasiswa', NULL, '2026-08-07 02:00:06', '2026-08-07 02:00:06'),
(284, 'Muhammad Rayhan Sidiq Permana', '20251310034@sikemah.ukri', NULL, NULL, '$2y$12$NM6JtOGIPWu44uUzMCDSpufufRS6nNsGlcnGB3Z8CJOINwNyCPhnK', 'mahasiswa', NULL, '2026-08-07 02:00:07', '2026-08-07 02:00:07'),
(285, 'Dyaz Raditya', '20251310035@sikemah.ukri', NULL, NULL, '$2y$12$v1SnvpWcvaLX.L5STPdzMOeAAA4xtj6mYlnexQId7jMbozyYyEw4G', 'mahasiswa', NULL, '2026-08-07 02:00:07', '2026-08-07 02:00:07'),
(286, 'Syamwan Fi\'zilal', '20251310036@sikemah.ukri', NULL, NULL, '$2y$12$oFxZRTucTpJZ3mShoElwUuyjhFYsCQUcqZ8PaVOzatGcrsTCPxo12', 'mahasiswa', NULL, '2026-08-07 02:00:08', '2026-08-07 02:00:08'),
(287, 'Riva Apriliandi Hendari', '20251310037@sikemah.ukri', NULL, NULL, '$2y$12$PWaXCOKEHoH4M3hXUNY5KOBj/eS57rdepHp9WzPuts0Aa2aEO/qbG', 'mahasiswa', NULL, '2026-08-07 02:00:09', '2026-08-07 02:00:09'),
(288, 'Avdithria Saputra Ramadhani', '20251310038@sikemah.ukri', NULL, NULL, '$2y$12$dPKfTX0mw0LeVDCDYj5XnethNgSpvtKJjJVUjpx8y9XWPhjSupskW', 'mahasiswa', NULL, '2026-08-07 02:00:10', '2026-08-07 02:00:10'),
(289, 'Rangga Natama Siregar', '20251310039@sikemah.ukri', NULL, NULL, '$2y$12$RkQhIgQNhs0vY7esEcLQpetGTdIT2aWEg/kHbfW2cQvMKW9Syq5ju', 'mahasiswa', NULL, '2026-08-07 02:00:11', '2026-08-07 02:00:11'),
(290, 'Reyga Marza Ramadhan', '20251310040@sikemah.ukri', NULL, NULL, '$2y$12$NmPb9c5Nf4LtESWcRtErZust8WHD2qAyaAha9yCueeJKPM4xGlHpe', 'mahasiswa', NULL, '2026-08-07 02:00:11', '2026-08-07 02:00:11'),
(291, 'Moch Adhitya Permana', '20251310041@sikemah.ukri', NULL, NULL, '$2y$12$QcoZNEhj7RW6Ibi38K5L5uTaXDYozv/kljCHX0ygEO6GVfAOznk8u', 'mahasiswa', NULL, '2026-08-07 02:00:12', '2026-08-07 02:00:12'),
(292, 'Aliya Putri Harahap', '20251310042@sikemah.ukri', NULL, NULL, '$2y$12$h.EbWrjWFGPu0dbgC8g0K.h1usP9COV/.tRKWBwXNh7xFrYe2EXFq', 'mahasiswa', NULL, '2026-08-07 02:00:13', '2026-08-07 02:00:13'),
(293, 'Ramdan Afdi Hanan', '20251310043@sikemah.ukri', NULL, NULL, '$2y$12$JS.qkv.xXE6hUrMFePiCuekA7t2KRKUM2fQYANpunlXJIWSH/EtUy', 'mahasiswa', NULL, '2026-08-07 02:00:13', '2026-08-07 02:00:13'),
(294, 'Allisya \'ainun Zhahra', '20251310044@sikemah.ukri', NULL, NULL, '$2y$12$tk8o1GpRyxlaD9UzYh7LTu1xXTK8Uf4RRnL9IxbinPqykJld4bcsO', 'mahasiswa', NULL, '2026-08-07 02:00:14', '2026-08-07 02:00:14'),
(295, 'Ditto Wirma', '20251310045@sikemah.ukri', NULL, NULL, '$2y$12$5CWpLn8V2OqRmYRMUJApAeReCMW6FIxaOEhSjkCcHXsjQ20QZMPxW', 'mahasiswa', NULL, '2026-08-07 02:00:15', '2026-08-07 02:00:15'),
(296, 'Calvin Jonathan Gunawan', '20251310046@sikemah.ukri', NULL, NULL, '$2y$12$Dp.88CUvmCGxfM/n34OXFuUm5rNfcl1Js7yByDK8CuMdNzS/RVzne', 'mahasiswa', NULL, '2026-08-07 02:00:16', '2026-08-07 02:00:16'),
(297, 'Aliyyah Novianti Guntara', '20251310047@sikemah.ukri', NULL, NULL, '$2y$12$k410QaidUTRUejygvrAGkeBwweRuKLFzYz6o5fyYiJaWu5TDLwNnu', 'mahasiswa', NULL, '2026-08-07 02:00:17', '2026-08-07 02:00:17'),
(298, 'Khairul Pardan Ramdani', '20251310050@sikemah.ukri', NULL, NULL, '$2y$12$hkEie4monV34FL6Kw/eg/uxV4vmabT8XF3zhcZ6i21WvdAbRPLRU6', 'mahasiswa', NULL, '2026-08-07 02:00:17', '2026-08-07 02:00:17'),
(299, 'Ande Destian Suhartono', '20251310051@sikemah.ukri', NULL, NULL, '$2y$12$V0NDk7tSrNvaWDfppOPeiOPNn4LivT0uG1A6VvCtPX17Q4qwPeK0G', 'mahasiswa', NULL, '2026-08-07 02:00:18', '2026-08-07 02:00:18'),
(300, 'Rafsa Chumaidi', '20251310052@sikemah.ukri', NULL, NULL, '$2y$12$9y7UPLo2BS3RIH/dHvKx2uk3Vcb4CoE8xXp/YMfgzqQ4VaxW5veVS', 'mahasiswa', NULL, '2026-08-07 02:00:19', '2026-08-07 02:00:19'),
(301, 'Dimas Jakhi Rahmansyah', '20251310053@sikemah.ukri', NULL, NULL, '$2y$12$ImB4J4Llko7qQH87taOSr.31j9UpiY4LYFqEqGGBKjntxeeZunKwW', 'mahasiswa', NULL, '2026-08-07 02:00:20', '2026-08-07 02:00:20'),
(302, 'Alfian J. Ali', '20251310054@sikemah.ukri', NULL, NULL, '$2y$12$byWBA2dctws6NiLxRcxVjeYVPkh1Vtc8aUXxcX/h17t5jbjmyczda', 'mahasiswa', NULL, '2026-08-07 02:00:21', '2026-08-07 02:00:21'),
(303, 'Meisya Anisa Salsabila', '20251310055@sikemah.ukri', NULL, NULL, '$2y$12$KfF5TCsMrGVvXJmOV5vjX.YIdbDLZ2D9UEc8gdQpOxTg4Ibwj0YB.', 'mahasiswa', NULL, '2026-08-07 02:00:22', '2026-08-07 02:00:22'),
(304, 'Naufal Maulana Hafizh', '20251310056@sikemah.ukri', NULL, NULL, '$2y$12$PIYWnPDcYhCGAcmGthSqF.4AaHN0r9jnnrFLwyCvlZlEf8J/2zKQq', 'mahasiswa', NULL, '2026-08-07 02:00:23', '2026-08-07 02:00:23'),
(305, 'Dini Naura Nopiyanti', '20251310057@sikemah.ukri', NULL, NULL, '$2y$12$A3enIdHlI9vDb/zd/TDtr.JS8pbXqC4m0DbZ18aouB/na2GzH/SPS', 'mahasiswa', NULL, '2026-08-07 02:00:24', '2026-08-07 02:00:24'),
(306, 'Irsyad Hidayat', '20251310058@sikemah.ukri', NULL, NULL, '$2y$12$SZvMit9fICfamcs2Wk.hAuw.cU6GMFo19g8vohZASERi08xrh5766', 'mahasiswa', NULL, '2026-08-07 02:00:25', '2026-08-07 02:00:25'),
(307, 'Ferdi Karim', '20251310059@sikemah.ukri', NULL, NULL, '$2y$12$I4I8Nr4TBi1JF2ftsaMRz.icPqhswyz9dMTlrQuRrX1/XzYDh9miG', 'mahasiswa', NULL, '2026-08-07 02:00:28', '2026-08-07 02:00:28'),
(308, 'Raka Pratama', '20251310060@sikemah.ukri', NULL, NULL, '$2y$12$U82JoAiGZvKK.rxLwX255OwyT.JZdOGgO6XMNRVod4tlrXql8Oia6', 'mahasiswa', NULL, '2026-08-07 02:00:29', '2026-08-07 02:00:29'),
(309, 'Putra Herman Pratama', '20251310061@sikemah.ukri', NULL, NULL, '$2y$12$JsgAQOEI0.iH9K00h2PuNOCW7hVLCAjr9ZrOZrCMMrKsqxbjopF26', 'mahasiswa', NULL, '2026-08-07 02:00:30', '2026-08-07 02:00:30'),
(310, 'Resyani Naila Eigrita', '20251310062@sikemah.ukri', NULL, NULL, '$2y$12$TkFOUsoRBVbe8GjkhaOmyeaA/DeBxPI9a/nq9pz3lMxpno9nwpupu', 'mahasiswa', NULL, '2026-08-07 02:00:31', '2026-08-07 02:00:31'),
(311, 'Adri Chandra Putra Djaelani', '20251310063@sikemah.ukri', NULL, NULL, '$2y$12$ZxhbBcVhH9GoCGV8yGLqouSpSRuOX3JQgcN1kd7auyux869/wLJtG', 'mahasiswa', NULL, '2026-08-07 02:00:32', '2026-08-07 02:00:32'),
(312, 'Naufal Akhbar', '20251310065@sikemah.ukri', NULL, NULL, '$2y$12$k.n254gXRlXsgFACDXlCGeiSZMWJwlBazA6nlWsSYvhgIf3Q62mx.', 'mahasiswa', NULL, '2026-08-07 02:00:34', '2026-08-07 02:00:34'),
(313, 'Radja Agustin Insani', '20251310066@sikemah.ukri', NULL, NULL, '$2y$12$gEbhKR.C1C.gBSOk6ywnoeFzuLeh1t4UvRpnrUXuKUfzagOvkm/um', 'mahasiswa', NULL, '2026-08-07 02:00:35', '2026-08-07 02:00:35'),
(314, 'Yafi Muhammad Faiq', '20251310067@sikemah.ukri', NULL, NULL, '$2y$12$Zhqg7/mUwjWP1FRm7W4ndOS5.WZzrRLUoOPrp0Q5KDKNg7txEkaHC', 'mahasiswa', NULL, '2026-08-07 02:00:36', '2026-08-07 02:00:36'),
(315, 'Rahma Novianty', '20251310068@sikemah.ukri', NULL, NULL, '$2y$12$dBu3pG6ag8184Q.6dGHjnOsQelseIROSoiimL2l7ulaThnHqLAsCe', 'mahasiswa', NULL, '2026-08-07 02:00:37', '2026-08-07 02:00:37'),
(316, 'Rika Apriyani', '20251310069@sikemah.ukri', NULL, NULL, '$2y$12$Ff74LWYTb0KmTTRHkHJ3FOE0f9R/Cei7Hu0Mkrgi7e1pqpz.aplJS', 'mahasiswa', NULL, '2026-08-07 02:00:38', '2026-08-07 02:00:38'),
(317, 'Muhammad Farhan Zayinurohman', '20251310070@sikemah.ukri', NULL, NULL, '$2y$12$SxCEAYvKj2nIYk/VGGCnhOlQA2qLwDRzmS/70bu7OulEDhJ.oZ8xK', 'mahasiswa', NULL, '2026-08-07 02:00:39', '2026-08-07 02:00:39'),
(318, 'Firly Hardiansyah', '20251310071@sikemah.ukri', NULL, NULL, '$2y$12$0lT5DWulrKiEmSQxXbuK6.am76ukys0MbqthLvj3Wv8PDgH/Y43hq', 'mahasiswa', NULL, '2026-08-07 02:00:41', '2026-08-07 02:00:41'),
(319, 'Muhamad Firdaus Kusnadi', '20251310072@sikemah.ukri', NULL, NULL, '$2y$12$KPShYIc12etGdbsPyMoME.jlojfECiojJrJsSuAUsQAVMhnPEuequ', 'mahasiswa', NULL, '2026-08-07 02:00:42', '2026-08-07 02:00:42'),
(320, 'Sindy Sri Hapsari', '20251310073@sikemah.ukri', NULL, NULL, '$2y$12$DReZ70TdRmtWKhkJOTvCPeRo.AX3XGv46U1CgT2XI.VTqIv2aP2Mm', 'mahasiswa', NULL, '2026-08-07 02:00:43', '2026-08-07 02:00:43'),
(321, 'Teuku Arkan Farigani', '20251310074@sikemah.ukri', NULL, NULL, '$2y$12$8hfL9Rz5j.YrqJEPrPFGEecnkipqIf7Oux1HxdWFNHjnIA4R2c5fe', 'mahasiswa', NULL, '2026-08-07 02:00:44', '2026-08-07 02:00:44'),
(322, 'Arash Muhammad Assad', '20251310075@sikemah.ukri', NULL, NULL, '$2y$12$VxqJIckt8/4IBmu.p5dRKeojW9MG0zJK5Fh2OxLI80uSY4b1PwmWy', 'mahasiswa', NULL, '2026-08-07 02:00:45', '2026-08-07 02:00:45'),
(323, 'Panca Varyoga', '20251310076@sikemah.ukri', NULL, NULL, '$2y$12$Tcggc.zEw/3A53ttQqEeYurjZhBYTOJqcfhDwPfBuMx/8mtat3tTO', 'mahasiswa', NULL, '2026-08-07 02:00:45', '2026-08-07 02:00:45'),
(324, 'Risky Dimas Safariel', '20251310077@sikemah.ukri', NULL, NULL, '$2y$12$Xg.yhLUM69ROYw5aE11XAu18gjiBGL.xSKZ9HIzxrwIhJkbr049dG', 'mahasiswa', NULL, '2026-08-07 02:00:46', '2026-08-07 02:00:46'),
(325, 'Jilan Ismail Abdurrozak', '20251310078@sikemah.ukri', NULL, NULL, '$2y$12$0hcs8jX6Q2zVa.fNl4qoluTA0Uh58TPYHgwfUr/m3J/4qyV860yZ6', 'mahasiswa', NULL, '2026-08-07 02:00:47', '2026-08-07 02:00:47'),
(326, 'Ferdinand Bintang Pratama', '20251310079@sikemah.ukri', NULL, NULL, '$2y$12$n5uTEGreych7nWRN0d7D.u0bGhIw5w03wq0ocfk5cItortmnh4x5K', 'mahasiswa', NULL, '2026-08-07 02:00:48', '2026-08-07 02:00:48'),
(327, 'Ardiandra Satrio Nugroho', '20251310080@sikemah.ukri', NULL, NULL, '$2y$12$JTxEvyEtcMoCB4po.G/bKOOdNknASF.Jdoeu.7GYfTuepoDDVEDBy', 'mahasiswa', NULL, '2026-08-07 02:00:49', '2026-08-07 02:00:49'),
(328, 'Rangga Aditya Sonjaya', '20251310081@sikemah.ukri', NULL, NULL, '$2y$12$2NYZxdachlphTuoOc95tAuBBX64KMqwSCbPBya1WrnHMQBch3ARF2', 'mahasiswa', NULL, '2026-08-07 02:00:50', '2026-08-07 02:00:50'),
(329, 'Ratu Ajeng Kartika', '20251310082@sikemah.ukri', NULL, NULL, '$2y$12$qHNjVUolQLxN/dW8yGEbqOAovViiSCd1kKJ2l0wfJ6.MMDI0P1cK2', 'mahasiswa', NULL, '2026-08-07 02:00:51', '2026-08-07 02:00:51'),
(330, 'Ilman Nurosadi', '20251310083@sikemah.ukri', NULL, NULL, '$2y$12$7xdAZIyCKwiDgL3SqQzcDugdPgCQx6OwhOEKr74o2.2fe4uGTghSm', 'mahasiswa', NULL, '2026-08-07 02:00:52', '2026-08-07 02:00:52'),
(331, 'Lendra Ilham Ramadan', '20251310085@sikemah.ukri', NULL, NULL, '$2y$12$7unwXqcGnM52FgicQVnx6uGaUMGmV3XtjS0qUPiqZQvN0gxC6PxqG', 'mahasiswa', NULL, '2026-08-07 02:00:53', '2026-08-07 02:00:53'),
(332, 'Muhammad Dearly Ramdhani', '20251310086@sikemah.ukri', NULL, NULL, '$2y$12$SWtUfy0jQgXwplo1VSjCWedvCDYsSYxVqd5808X71gWva8mIBD2MW', 'mahasiswa', NULL, '2026-08-07 02:00:54', '2026-08-07 02:00:54'),
(333, 'Zieldan Awaludin', '20251310087@sikemah.ukri', NULL, NULL, '$2y$12$Hipv.slKdk2H449UlnjnUeHK/5H97tYuSUCEZxTO3eWW3MZqa31dm', 'mahasiswa', NULL, '2026-08-07 02:00:55', '2026-08-07 02:00:55'),
(334, 'Fikri Nurhakim', '20251310088@sikemah.ukri', NULL, NULL, '$2y$12$ok5b/Iz8hwqq6CJHbZRZFeUc3mPcg1N1xoTn0ppR/JCMkwNQUSka6', 'mahasiswa', NULL, '2026-08-07 02:00:55', '2026-08-07 02:00:55'),
(335, 'M. Ihsan Fauzi Ramadhan', '20251310089@sikemah.ukri', NULL, NULL, '$2y$12$v51aHw7YMYe0y4sucsz93u94h1oyZc8fJPZqZq0uFwVvMJmfghyt2', 'mahasiswa', NULL, '2026-08-07 02:00:57', '2026-08-07 02:00:57'),
(336, 'Riqki Berkah Ramadhan', '20251310090@sikemah.ukri', NULL, NULL, '$2y$12$U4iZru7cRY9d9QMTwhW6L.nZYpclIhzx7kuRA6dt9FLez0DZmPX/W', 'mahasiswa', NULL, '2026-08-07 02:00:57', '2026-08-07 02:00:57'),
(337, 'Yuda Umbara', '20251310091@sikemah.ukri', NULL, NULL, '$2y$12$vSIFxiLo2xsz12IREmKpIOEv/aATdnDe4/5UtpObkbsrrZCq.Hj46', 'mahasiswa', NULL, '2026-08-07 02:00:58', '2026-08-07 02:00:58'),
(338, 'Arif Dwi Prasetyo', '20251310093@sikemah.ukri', NULL, NULL, '$2y$12$G7frQF/5s8xVX/.YK5I6aez756qBYvAW6KYTcD0LM3sKzWT5CfZTy', 'mahasiswa', NULL, '2026-08-07 02:00:59', '2026-08-07 02:00:59'),
(339, 'Sultan Al Azmi', '20251310094@sikemah.ukri', NULL, NULL, '$2y$12$PDib1uXbMaJq1Mb0rsNjwe1qZ.Y/hghiEp0OZOQfzkBozdOdixCI2', 'mahasiswa', NULL, '2026-08-07 02:01:01', '2026-08-07 02:01:01'),
(340, 'Dhani Ali Ramdhani', '20251310095@sikemah.ukri', NULL, NULL, '$2y$12$UnzkLDR3lChikQBblWBrEuouSafyP.peQBjfHnArW.B1aDHF/CD1m', 'mahasiswa', NULL, '2026-08-07 02:01:02', '2026-08-07 02:01:02'),
(341, 'Rajarso Karen Arno', '20251310064@sikemah.ukri', NULL, NULL, '$2y$12$v1LXH3jDgCExujKKXpSLZOAomGB6HSVF7hJ32A1gxqoXux4/VEmhu', 'mahasiswa', NULL, '2026-08-07 02:01:03', '2026-08-07 02:01:03'),
(342, 'Asep Nugraha', '20251310084@sikemah.ukri', NULL, NULL, '$2y$12$FZ5z.dNaSIITIBhxPBY7zeT90/qpnoRGwcm7iecHF/GQ.LBMerLZW', 'mahasiswa', NULL, '2026-08-07 02:01:03', '2026-08-07 02:01:03'),
(343, 'Yuga Permana Putra', '20211320021@sikemah.ukri', NULL, NULL, '$2y$12$Fvegc3Rm1RbM8NQEgTeg9OGF3HoM4rNf/57nP5Eb//fdKh4LbHlPG', 'mahasiswa', NULL, '2026-08-07 02:01:04', '2026-08-07 02:01:04'),
(344, 'Hilma Nurzhakiyah', '20211320036@sikemah.ukri', NULL, NULL, '$2y$12$VSeyxiQeND/B/qmWIIKrzOnHX84pD3dPdcJN29K6N.7Gk2S6loabC', 'mahasiswa', NULL, '2026-08-07 02:01:06', '2026-08-07 02:01:06'),
(345, 'Alif Fajr Alejandro', '20221320002@sikemah.ukri', NULL, NULL, '$2y$12$yERwEUgVa4etWHiGSBe9y.u9OQwjrtPVhHA5biQ4hKg7pCGFt7zuS', 'mahasiswa', NULL, '2026-08-07 02:01:07', '2026-08-07 02:01:07'),
(346, 'Alya Mustika', '20221320003@sikemah.ukri', NULL, NULL, '$2y$12$A.rFD0qABQEVOunt90pEIeXg5L9SvkGXh7qXmBOowpdUVRsVTctbu', 'mahasiswa', NULL, '2026-08-07 02:01:07', '2026-08-07 02:01:07'),
(347, 'Anggi Junilia', '20221320004@sikemah.ukri', NULL, NULL, '$2y$12$6PkowR4eetrT6m0aao0m2e3WthpFxvyrKoBGnaoFi7Ci.EBS3H8oS', 'mahasiswa', NULL, '2026-08-07 02:01:08', '2026-08-07 02:01:08'),
(348, 'Anisa Septia', '20221320005@sikemah.ukri', NULL, NULL, '$2y$12$RsqpbHHDi.c80tylLlN/LuTZcCe.z6UuAKqwa7y769qgG8CIIdiPy', 'mahasiswa', NULL, '2026-08-07 02:01:09', '2026-08-07 02:01:09'),
(349, 'Fera Rosita Agustiani', '20221320006@sikemah.ukri', NULL, NULL, '$2y$12$eFUE9DSLqnIPtIqZCyJGD.pV8LD0sYrXL8xZ7XFgFL0YiTZrlkMf6', 'mahasiswa', NULL, '2026-08-07 02:01:10', '2026-08-07 02:01:10'),
(350, 'Frengki Afrilian Syah', '20221320007@sikemah.ukri', NULL, NULL, '$2y$12$/1uceeqQxdKoZvbREyQ1yurUnxPa11w1sDT8gqZCILLzrBr3dIWCO', 'mahasiswa', NULL, '2026-08-07 02:01:11', '2026-08-07 02:01:11'),
(351, 'Hermansyah', '20221320008@sikemah.ukri', NULL, NULL, '$2y$12$L.LNWA8XhJaQ5B3Mem9UCuwlXndQhlywrJMVaMfkFp5nUfje/9EqK', 'mahasiswa', NULL, '2026-08-07 02:01:12', '2026-08-07 02:01:12'),
(352, 'Ikhsan Octaviana Subagja', '20221320009@sikemah.ukri', NULL, NULL, '$2y$12$OPWQ7r7.ig9zR.0vsiVwpeOw4OL7H24Trc/t5/YuBsKUMUsO3Prbq', 'mahasiswa', NULL, '2026-08-07 02:01:13', '2026-08-07 02:01:13'),
(353, 'Lala Karoliya', '20221320010@sikemah.ukri', NULL, NULL, '$2y$12$EwB1TtshI9a/F4rkDDY8hOyK/Q7awwXgDEhvruPyjA2mKule/ObxG', 'mahasiswa', NULL, '2026-08-07 02:01:14', '2026-08-07 02:01:14'),
(354, 'Luthfi Ilyas', '20221320011@sikemah.ukri', NULL, NULL, '$2y$12$eZaCxY9S6UPjBYra38N4F.c9wI0Cl.wnLGWpCJxwgGXHD1BQH1y.y', 'mahasiswa', NULL, '2026-08-07 02:01:15', '2026-08-07 02:01:15'),
(355, 'Mas Jolang', '20221320012@sikemah.ukri', NULL, NULL, '$2y$12$mSjnSoTQXE7DXgwkzTVKGOprDiBh.V7N3n8YnDa9Rf9clyNJoVSk2', 'mahasiswa', NULL, '2026-08-07 02:01:15', '2026-08-07 02:01:15'),
(356, 'Meila Sri Maulidiyani', '20221320013@sikemah.ukri', NULL, NULL, '$2y$12$62m9mJyvhGBZ57jFqF6c9u6fxsWe4D6gQYXZkePsFLmcHtL2o7sjW', 'mahasiswa', NULL, '2026-08-07 02:01:17', '2026-08-07 02:01:17'),
(357, 'Muhammad Andre Gumilar', '20221320015@sikemah.ukri', NULL, NULL, '$2y$12$Xr.7M5IfBv5qTli5TE1Mheaqdb7eVjbq8nG2cPZntyC4cfeNHQjXS', 'mahasiswa', NULL, '2026-08-07 02:01:17', '2026-08-07 02:01:17'),
(358, 'Muhammad Hithlan Fadjri Hakim', '20221320016@sikemah.ukri', NULL, NULL, '$2y$12$qk/qVtXWlhMkDmoevRTR.ehS0cTW09BqK6JffFrG0M8V0HXaxKFea', 'mahasiswa', NULL, '2026-08-07 02:01:18', '2026-08-07 02:01:18'),
(359, 'Nadila Zazkiya Rahmah', '20221320017@sikemah.ukri', NULL, NULL, '$2y$12$fpOvHDErJdJzq3BriP17XeazdcoZnMoMOij4easvOdlgLWJbBYMTq', 'mahasiswa', NULL, '2026-08-07 02:01:19', '2026-08-07 02:01:19'),
(360, 'Prayoga Gemilang', '20221320019@sikemah.ukri', NULL, NULL, '$2y$12$JN1h4XfSjUhl0PBs00Eb4uyVmbl/ELteckrd0XOKi9SzwyZE8IVPO', 'mahasiswa', NULL, '2026-08-07 02:01:20', '2026-08-07 02:01:20'),
(361, 'Rahma Silmi Kaaffati', '20221320020@sikemah.ukri', NULL, NULL, '$2y$12$.MVpkBq9mZ7etsMuv0Ony.1mact1oBrI6OMQk1e/kHG8QwMxoDzmW', 'mahasiswa', NULL, '2026-08-07 02:01:21', '2026-08-07 02:01:21'),
(362, 'Rajwa Alganiyu Putra', '20221320021@sikemah.ukri', NULL, NULL, '$2y$12$vwpF8/Wrs3WcI.bIIwRrkO5UCS2o5mP7aQHRHC9JWv1vkY3Y0UACK', 'mahasiswa', NULL, '2026-08-07 02:01:22', '2026-08-07 02:01:22'),
(363, 'Restin Widiastuti', '20221320022@sikemah.ukri', NULL, NULL, '$2y$12$.Qtya4FHAHv.82XvlPFVte0OBsjtJA043nTCDA7i0jlt7wjFeyG4a', 'mahasiswa', NULL, '2026-08-07 02:01:22', '2026-08-07 02:01:22'),
(364, 'Sabila', '20221320023@sikemah.ukri', NULL, NULL, '$2y$12$WZQxKO1ufcwLMPTV.uFVw.KUTwMhzxiwriKdClC2baTLQp4FEiFxG', 'mahasiswa', NULL, '2026-08-07 02:01:24', '2026-08-07 02:01:24'),
(365, 'Yoga Surya Saputra', '20221320027@sikemah.ukri', NULL, NULL, '$2y$12$C0Vt7WiNoC.CQPbFkijvguz18s2TXbq1aOR511jpnlAiQJGt6971.', 'mahasiswa', NULL, '2026-08-07 02:01:25', '2026-08-07 02:01:25'),
(366, 'Yusrizal Alfi Muhamad', '20221320028@sikemah.ukri', NULL, NULL, '$2y$12$KvXHWkbfxvQjVxVteoEmpuu/6NwEZkum8tdEC/6Ta2XEbVPCXNbDm', 'mahasiswa', NULL, '2026-08-07 02:01:25', '2026-08-07 02:01:25'),
(367, 'Zildan Ramadhan', '20221320030@sikemah.ukri', NULL, NULL, '$2y$12$Oe0lX8Xj7Q0JynwfPRnfgeyXg1xg23F.2NXhfdAxC4oasA736MAU6', 'mahasiswa', NULL, '2026-08-07 02:01:27', '2026-08-07 02:01:27'),
(368, 'Rizky Alfathya Nur Ramadhan', '20221320031@sikemah.ukri', NULL, NULL, '$2y$12$yakghqueBE98yo6mm2.AfevG860LLcnJ0KA9tGPl9ooUkqe3UmELG', 'mahasiswa', NULL, '2026-08-07 02:01:27', '2026-08-07 02:01:27'),
(369, 'Gilang Ramadhan', '20221320033@sikemah.ukri', NULL, NULL, '$2y$12$3XhiPAvXqAvtNefWbCvIIe8lhAYfpcrnSPRVcZujnoP2RX5ZfGkzO', 'mahasiswa', NULL, '2026-08-07 02:01:28', '2026-08-07 02:01:28'),
(370, 'Riezky Nur Fadilah', '20221320035@sikemah.ukri', NULL, NULL, '$2y$12$76dZsJDjqQ72suP/EBf9ReKt4v3yHsuFiIO6OJc3O/TblF6J9F3tW', 'mahasiswa', NULL, '2026-08-07 02:01:29', '2026-08-07 02:01:29'),
(371, 'Meilinda Putri Nurwenda Wati', '20221320036@sikemah.ukri', NULL, NULL, '$2y$12$B2Hmmck6wt8etSQU.WS9Au4tWFjeL6HgL8VW/j3//gY.PjSz7qk4e', 'mahasiswa', NULL, '2026-08-07 02:01:30', '2026-08-07 02:01:30'),
(372, 'M. Sehelmy As Ibrahim', '20221320037@sikemah.ukri', NULL, NULL, '$2y$12$QSrrZpJYQO8TIiBkda3FbOlgKpsPIdwO0o8m0yA5bHp3LQ5Cbep/G', 'mahasiswa', NULL, '2026-08-07 02:01:31', '2026-08-07 02:01:31'),
(373, 'M. Rizal', '20221320038@sikemah.ukri', NULL, NULL, '$2y$12$VrTQU9nBGCJWvYsfljV30.HVZMkr67a0MIhYmvLnCVRieoMOGGToC', 'mahasiswa', NULL, '2026-08-07 02:01:32', '2026-08-07 02:01:32'),
(374, 'Alliya Khaerunnisa', '20231320001@sikemah.ukri', NULL, NULL, '$2y$12$uER3H03NV25JTHqVNVzHGu6jcNAOAcvLVZsixKgNXYhCAtgR8hgwe', 'mahasiswa', NULL, '2026-08-07 02:01:33', '2026-08-07 02:01:33'),
(375, 'Carissa Safira', '20231320002@sikemah.ukri', NULL, NULL, '$2y$12$uKibc6ASx7jwZQXhqHkXRezXq6kZsuBGlEyH/po2tGiLAJjgZ2fni', 'mahasiswa', NULL, '2026-08-07 02:01:34', '2026-08-07 02:01:34'),
(376, 'Daffa Graha Julian Pratama', '20231320003@sikemah.ukri', NULL, NULL, '$2y$12$jW8QLAQFXTf3hJp7xs2qR.GSB6E248pdEjR2lufKqoZ1Vp56HchR6', 'mahasiswa', NULL, '2026-08-07 02:01:36', '2026-08-07 02:01:36'),
(377, 'Fasya Khoir Nurazizah', '20231320004@sikemah.ukri', NULL, NULL, '$2y$12$PphHyDMDDXWN7p33OrpzJuESJG7S78HcaZiNAloWvODSjmwsKOpQC', 'mahasiswa', NULL, '2026-08-07 02:01:37', '2026-08-07 02:01:37'),
(378, 'Lulu Nafisah Elbanday', '20231320005@sikemah.ukri', NULL, NULL, '$2y$12$xVZ3CWSf9mf2iMqjb/fNP.ezIdp0DHQpCLU3UI0njZq1qi4rzPFhO', 'mahasiswa', NULL, '2026-08-07 02:01:38', '2026-08-07 02:01:38'),
(379, 'Muhamad Dzaky', '20231320006@sikemah.ukri', NULL, NULL, '$2y$12$WhwYOU2uJmknghcWeAJRy.FxjrEDEy4DNhmMTokD0MEF3DWNqjOn.', 'mahasiswa', NULL, '2026-08-07 02:01:39', '2026-08-07 02:01:39'),
(380, 'Muhamad Haekal Baasyir', '20231320007@sikemah.ukri', NULL, NULL, '$2y$12$wGsJ7oswXG1jzWhkppwOleZ6OrARwqJ8AI64rJ2eKpFt4z5wwbR2q', 'mahasiswa', NULL, '2026-08-07 02:01:40', '2026-08-07 02:01:40'),
(381, 'Muhammad Ikhsan Robbani', '20231320008@sikemah.ukri', NULL, NULL, '$2y$12$M1tOeJ/CcietDMB47qVPBuJ0oTxJHYUS3H7Tb4BqBzGLW2.7qI1cW', 'mahasiswa', NULL, '2026-08-07 02:01:41', '2026-08-07 02:01:41'),
(382, 'Nasya Afifah Rahmani', '20231320010@sikemah.ukri', NULL, NULL, '$2y$12$6OglXYyOZKBjYTaFMVtZYeZ/FL9YCRa7uOmuqxA4Zqw1is3ZV.xRi', 'mahasiswa', NULL, '2026-08-07 02:01:42', '2026-08-07 02:01:42'),
(383, 'Akhdzan Muhammad Rizal', '20231320011@sikemah.ukri', NULL, NULL, '$2y$12$wk/W1FP8nqUNcJ4kf5cB8OkwuXv4R7zkysrGQUI1NIOOm22/iE/k2', 'mahasiswa', NULL, '2026-08-07 02:01:43', '2026-08-07 02:01:43'),
(384, 'Bayu Aji', '20231320012@sikemah.ukri', NULL, NULL, '$2y$12$WUciK5fzuxMGLpHNQTJUn.y1o75rOCgi7JJkOl3WvjbJaY5LksLiO', 'mahasiswa', NULL, '2026-08-07 02:01:44', '2026-08-07 02:01:44'),
(385, 'Erika Octavianti', '20231320013@sikemah.ukri', NULL, NULL, '$2y$12$rNu5Eh9VO/msXUTITZ6vSuLCDisslxTPpdzM5i/A0o9Nuzjrm811u', 'mahasiswa', NULL, '2026-08-07 02:01:47', '2026-08-07 02:01:47'),
(386, 'Kamaludin', '20231320014@sikemah.ukri', NULL, NULL, '$2y$12$kPWgF1J2g7NJW66P5dqpqOIed7maY9PDTQLd/8jfy93x5Q1vbmLsO', 'mahasiswa', NULL, '2026-08-07 02:01:51', '2026-08-07 02:01:51'),
(387, 'Khairil D Saputra', '20231320015@sikemah.ukri', NULL, NULL, '$2y$12$.05A.ngKfAurT8STwSqbhOWySpdmM6iPW29T7ptYHuV1uE8FD1.D.', 'mahasiswa', NULL, '2026-08-07 02:01:55', '2026-08-07 02:01:55'),
(388, 'Muhamad Rafi Firdaus', '20231320016@sikemah.ukri', NULL, NULL, '$2y$12$1hJNGz4CE0UyVrLYFTmoSu8opQ2N6fNAVdOYMBibcmm5otIeOtQSm', 'mahasiswa', NULL, '2026-08-07 02:01:56', '2026-08-07 02:01:56'),
(389, 'Muhammad Aldi Oktavian', '20231320017@sikemah.ukri', NULL, NULL, '$2y$12$qWy51J4QbqU6MuO716SOYuoCJKKAlUI20avxyPcYowYe2rNmp1iXW', 'mahasiswa', NULL, '2026-08-07 02:02:00', '2026-08-07 02:02:00'),
(390, 'Tania Hermita Ningrat', '20231320019@sikemah.ukri', NULL, NULL, '$2y$12$hoficeneavU2KfFMK1EzO.kL4Mj.uOfg1fqdsE5T3vBHIkfiiLjOa', 'mahasiswa', NULL, '2026-08-07 02:02:01', '2026-08-07 02:02:01'),
(391, 'Yassin Kalimaya Soedradjat', '20231320020@sikemah.ukri', NULL, NULL, '$2y$12$/Y9GKwd6T.FvHJq.M76.9OaNsBBK42ds7Oe092XgMehkakCArmtJq', 'mahasiswa', NULL, '2026-08-07 02:02:02', '2026-08-07 02:02:02'),
(392, 'Ari Rahadian', '20231320023@sikemah.ukri', NULL, NULL, '$2y$12$VZmnx2fBpkfR7g40thqI5eVQm9oZ/eBm3/62relMtnWsReMDhANAy', 'mahasiswa', NULL, '2026-08-07 02:02:03', '2026-08-07 02:02:03'),
(393, 'Moch Mukhsin Nauval', '20231320024@sikemah.ukri', NULL, NULL, '$2y$12$Msd03k9z.vv3IGx8GkRlDexFN5EhzzrYfQdWFe1gORqSTCngozQYS', 'mahasiswa', NULL, '2026-08-07 02:02:04', '2026-08-07 02:02:04'),
(394, 'Naufal Pratama Karsa', '20231320025@sikemah.ukri', NULL, NULL, '$2y$12$5IMgF.hSFFGEp0rBrbPDt.QJ1NXL6Bg86mMA6bTpFSGivqoCJAEx.', 'mahasiswa', NULL, '2026-08-07 02:02:05', '2026-08-07 02:02:05'),
(395, 'Nazwa Salsabilla Putri', '20231320026@sikemah.ukri', NULL, NULL, '$2y$12$Ei3qplATipLHWmTn8uBP1eVBPLYe2lWL8jj03KQCbTFmuDGsmr0WC', 'mahasiswa', NULL, '2026-08-07 02:02:08', '2026-08-07 02:02:08'),
(396, 'Husen Masang', '20231320027@sikemah.ukri', NULL, NULL, '$2y$12$7Rujy1/ArKQKCit7bZTmjOzMqRoNm57tfcpRXDyA9UF6QttkGl0qa', 'mahasiswa', NULL, '2026-08-07 02:02:10', '2026-08-07 02:02:10'),
(397, 'Sri Ayu Astari', '20231320028@sikemah.ukri', NULL, NULL, '$2y$12$zCtgtP2BNEwo/1pMTfBPhuEdmj4D5p0gK01oD2ExNPhQG12iL.LZa', 'mahasiswa', NULL, '2026-08-07 02:02:11', '2026-08-07 02:02:11'),
(398, 'Raihan Zaky Ramadhan', '20231320029@sikemah.ukri', NULL, NULL, '$2y$12$JGR13iLpCa1lfx8GV2vwUucth1qV1ErIVF6R0NPhRJx3NRoSEWSvW', 'mahasiswa', NULL, '2026-08-07 02:02:12', '2026-08-07 02:02:12'),
(399, 'Shailla Ikrimatuzzaura Maulana', '20231320030@sikemah.ukri', NULL, NULL, '$2y$12$ZE.zEXs25nQQp8pFhspYceO6YHy26nurzxZDzaeWjIMEwvNZDNGbK', 'mahasiswa', NULL, '2026-08-07 02:02:13', '2026-08-07 02:02:13'),
(400, 'M. Hilham', '20231320032@sikemah.ukri', NULL, NULL, '$2y$12$zXBNm4DDYAN/lZ7N1lPZguUd6g3w8/2.bpxpXJlzApt8RzzgkBRB6', 'mahasiswa', NULL, '2026-08-07 02:02:14', '2026-08-07 02:02:14'),
(401, 'Afrika Wirandau', '20231320035@sikemah.ukri', NULL, NULL, '$2y$12$VGaGu/Y8D18B.jnVqvu9gOAUP7XiiYUn0zcF6CLpB2qmtz2Z.uaCq', 'mahasiswa', NULL, '2026-08-07 02:02:16', '2026-08-07 02:02:16'),
(402, 'Sodraeni Sakam', '20231320037@sikemah.ukri', NULL, NULL, '$2y$12$zRln67lw7onxT4SXLRZNwujFZAse2ZBSHN2pJr0zkUJ5Ysir.VJLS', 'mahasiswa', NULL, '2026-08-07 02:02:17', '2026-08-07 02:02:17'),
(403, 'Alya Fauziah', '20231320038@sikemah.ukri', NULL, NULL, '$2y$12$FBbMvvJqabDFdAWllR.v0..H9Kr65KtrjzzMggKAC87PE49hH/xbC', 'mahasiswa', NULL, '2026-08-07 02:02:18', '2026-08-07 02:02:18'),
(404, 'Adinda Aisyahrani', '20231320040@sikemah.ukri', NULL, NULL, '$2y$12$bWWtfiS9OJbvPjOWvJdTe.Z6u2ZScSZ4NwaxnyrDU3aJsmun7Ndtm', 'mahasiswa', NULL, '2026-08-07 02:02:19', '2026-08-07 02:02:19'),
(405, 'Nasywa Alya Rahmadani', '20231320041@sikemah.ukri', NULL, NULL, '$2y$12$MFOOeIjbYtN67W3aXs0PI.pdfAAo2Bcv72cxe3kzWA4QhNkpMajTW', 'mahasiswa', NULL, '2026-08-07 02:02:20', '2026-08-07 02:02:20'),
(406, 'Shahibul Fikri Nadeak', '20231320042@sikemah.ukri', NULL, NULL, '$2y$12$OBZAtGPh4yeDxIrXm.9NCOoHPH4s4sq.PEV83Fq5N8zuvmNG/BL.K', 'mahasiswa', NULL, '2026-08-07 02:02:21', '2026-08-07 02:02:21'),
(407, 'Yani Alifen', '20231320043@sikemah.ukri', NULL, NULL, '$2y$12$G3/0velG/Hx3knGtVs399uK.ABL7347uBdcPKZrWy4rUmvVnk9zva', 'mahasiswa', NULL, '2026-08-07 02:02:22', '2026-08-07 02:02:22'),
(408, 'Naufal Maulana Dzaki Adriansyah', '20231320044@sikemah.ukri', NULL, NULL, '$2y$12$UFirXgJHwFrAtZKMfVw6oe6gxgYATPlRAFV4qW/R0j7W031HxZxSe', 'mahasiswa', NULL, '2026-08-07 02:02:23', '2026-08-07 02:02:23'),
(409, 'Aisma Haidy Putri Berry Ani Nur Rizeki', '20241320001@sikemah.ukri', NULL, NULL, '$2y$12$GYM0/p9P0VKD5s0Vwx4miuL.9E7weXQkmETCO.BBE0NgmzIbsGlqm', 'mahasiswa', NULL, '2026-08-07 02:02:24', '2026-08-07 02:02:24'),
(410, 'Anggraeni Ghea Saputri', '20241320002@sikemah.ukri', NULL, NULL, '$2y$12$KRt79XSJw36ZH8BB1WuUSO.WLAmK0pFQUybN0oHI1F8CfPdekM9sW', 'mahasiswa', NULL, '2026-08-07 02:02:25', '2026-08-07 02:02:25'),
(411, 'Haris Habibullah', '20241320003@sikemah.ukri', NULL, NULL, '$2y$12$mM4TE10IuKE3g7ozZ.OhV.zrbczQZbA69Y1AlFJdaS4R2zPZhfYhe', 'mahasiswa', NULL, '2026-08-07 02:02:26', '2026-08-07 02:02:26'),
(412, 'Muhammad Dzikri Sagara', '20241320004@sikemah.ukri', NULL, NULL, '$2y$12$FY9J5S04AOO/yVq.oTpdOOrqfpuM9UksCUAh7JFnuOoT2X2D5f4RO', 'mahasiswa', NULL, '2026-08-07 02:02:27', '2026-08-07 02:02:27'),
(413, 'Dinda Italia', '20241320005@sikemah.ukri', NULL, NULL, '$2y$12$RzP8HVITPXjWOhQsUk.EK.G346RhnbpIcXy1jJnhDg4.yQTM1gPtu', 'mahasiswa', NULL, '2026-08-07 02:02:28', '2026-08-07 02:02:28'),
(414, 'Fitri Dwi Wahyuni', '20241320006@sikemah.ukri', NULL, NULL, '$2y$12$QlvpkxFdQluoXLBE8dRzTui953oZK5UNcn5.cjH9jGkP1h/TKTP2q', 'mahasiswa', NULL, '2026-08-07 02:02:29', '2026-08-07 02:02:29'),
(415, 'Jeri Aries', '20241320007@sikemah.ukri', NULL, NULL, '$2y$12$q.qj4E0mdg5cvWeULORhmuzbelGGFd59ONICEUAIACd/S5HXLpCTC', 'mahasiswa', NULL, '2026-08-07 02:02:31', '2026-08-07 02:02:31'),
(416, 'Lulu Aeni Salsabila', '20241320008@sikemah.ukri', NULL, NULL, '$2y$12$MwEBP9IPLi3wdPG3ojjLX..zRGf7c0HsrcphGAYq8qBdEAJ3yjDeO', 'mahasiswa', NULL, '2026-08-07 02:02:32', '2026-08-07 02:02:32'),
(417, 'Mochamad Fauzan Alfikri Sutisna Putra', '20241320009@sikemah.ukri', NULL, NULL, '$2y$12$YEgpnerRmtCug3UTuQXgLOM4udaBCvX1qYVhrEx3AIsOOrbCEg3Z6', 'mahasiswa', NULL, '2026-08-07 02:02:33', '2026-08-07 02:02:33'),
(418, 'Tazkia Rizqiani', '20241320010@sikemah.ukri', NULL, NULL, '$2y$12$Hf0iwUqWu7uB3UYXnVxKJOoviyLh2699fWGBFMk2traK4vy5i3PqG', 'mahasiswa', NULL, '2026-08-07 02:02:34', '2026-08-07 02:02:34'),
(419, 'Adrian Ronald Daga', '20241320011@sikemah.ukri', NULL, NULL, '$2y$12$Q7xV/88KvxHNVl4Y872iP.sZo2H7cPofrC7CPsMrWOveMz0iQO0sC', 'mahasiswa', NULL, '2026-08-07 02:02:36', '2026-08-07 02:02:36'),
(420, 'Dendra Andri Merli', '20241320012@sikemah.ukri', NULL, NULL, '$2y$12$vaWbp0PVP9aOTyXNqkLmJ.2kAUFlyD1yNohNdiGMIQU18ZtcWyLiC', 'mahasiswa', NULL, '2026-08-07 02:02:37', '2026-08-07 02:02:37'),
(421, 'Difa Nisa Lutfiah', '20241320013@sikemah.ukri', NULL, NULL, '$2y$12$vFpjxdVp1b553JGglovYOeqSuYxUyvTG5ceTb9uajCuhgCMoIvECu', 'mahasiswa', NULL, '2026-08-07 02:02:38', '2026-08-07 02:02:38'),
(422, 'Eka Febryanto', '20241320014@sikemah.ukri', NULL, NULL, '$2y$12$M7t87vZypfgw0eSJN4HkI.xtfqNqQ8YnhXYdvgcXrfUpnEzvu2emq', 'mahasiswa', NULL, '2026-08-07 02:02:39', '2026-08-07 02:02:39'),
(423, 'Adi Maulana', '20241320015@sikemah.ukri', NULL, NULL, '$2y$12$t09A0NjFm34mmjRdyrIyPOTuV6EuaGX11V9bpHt8eV2QKlQXtI8Ui', 'mahasiswa', NULL, '2026-08-07 02:02:40', '2026-08-07 02:02:40'),
(424, 'Agusta Firman Firdaus', '20241320016@sikemah.ukri', NULL, NULL, '$2y$12$d9khXZrzP2zM01IsYRSWiuQkNMHGRXwN8sDgfvuzT/0RkEwXFwrYu', 'mahasiswa', NULL, '2026-08-07 02:02:42', '2026-08-07 02:02:42'),
(425, 'Akbar', '20241320017@sikemah.ukri', NULL, NULL, '$2y$12$VY2C3Im2mOHSakm/oCNyy.GYS.AELEDxeQWXV9qVYg.FWZERIaJ.a', 'mahasiswa', NULL, '2026-08-07 02:02:44', '2026-08-07 02:02:44'),
(426, 'Arya Adi Muhammad Iqbal', '20241320018@sikemah.ukri', NULL, NULL, '$2y$12$k4YGd49ur.Kjz3XB2HKPeeUwalyhUkIN13snmHGkVm2jOarkctA4m', 'mahasiswa', NULL, '2026-08-07 02:02:45', '2026-08-07 02:02:45'),
(427, 'Devina Ayuliani', '20241320019@sikemah.ukri', NULL, NULL, '$2y$12$LZ8nL/FXA4ZSalKjH7W7UeSrAO4.y97LjjpBvDQcBo.k3fbVHoYte', 'mahasiswa', NULL, '2026-08-07 02:02:46', '2026-08-07 02:02:46'),
(428, 'Julia Habibah', '20241320020@sikemah.ukri', NULL, NULL, '$2y$12$.JDIGMJDvUjfYgcF7s4yW.fnwFhr.36IXzJ2gHI3AIKtqYKYB/4vO', 'mahasiswa', NULL, '2026-08-07 02:02:47', '2026-08-07 02:02:47'),
(429, 'Khanaya Salsabila', '20241320021@sikemah.ukri', NULL, NULL, '$2y$12$AnVhIlj5NhYSI5qZAAYTie1zeivgSatzjHfZUs5V0Kqdx6oI/kttK', 'mahasiswa', NULL, '2026-08-07 02:02:48', '2026-08-07 02:02:48'),
(430, 'Muhammad Fauzi Akbar Rafsanjani', '20241320022@sikemah.ukri', NULL, NULL, '$2y$12$dX/yf8MrZPTDkIW4AxioverH0Pun6mrw1Xhgacqfsky1BcqWR2EZu', 'mahasiswa', NULL, '2026-08-07 02:02:49', '2026-08-07 02:02:49'),
(431, 'Naufal Fauzan Azmii', '20241320023@sikemah.ukri', NULL, NULL, '$2y$12$DR7O7.LgIjzDLiC0aZRQbe9.0eY8Dcq7zRWojisQYWEtELMZZ.TPe', 'mahasiswa', NULL, '2026-08-07 02:02:50', '2026-08-07 02:02:50'),
(432, 'Nosa Putra', '20241320025@sikemah.ukri', NULL, NULL, '$2y$12$fBH8TeWSS6sIDYV2BFJneuk.jtLp6PJDIU.5/qSHgkoEw9k.m/xq2', 'mahasiswa', NULL, '2026-08-07 02:02:51', '2026-08-07 02:02:51'),
(433, 'Pajar', '20241320026@sikemah.ukri', NULL, NULL, '$2y$12$1ayV9sgPPL4ICSUvqtMAy..nt8I3qwM3K4kCsH.CYIk2NUSWpQi.a', 'mahasiswa', NULL, '2026-08-07 02:02:52', '2026-08-07 02:02:52'),
(434, 'Ridho Gustama', '20241320027@sikemah.ukri', NULL, NULL, '$2y$12$UG5xXl.hkB076BVaY3bEgu5Hxr96tMe9t5dvmFb9aLQ1sqf0kw.km', 'mahasiswa', NULL, '2026-08-07 02:02:53', '2026-08-07 02:02:53'),
(435, 'Sopyan Rinaldhi', '20241320028@sikemah.ukri', NULL, NULL, '$2y$12$a.VvcpwGB.L0bAGbNFb2QOMy6ibU6bb.BnRpwfuuvQV7EpPXbMNLq', 'mahasiswa', NULL, '2026-08-07 02:02:54', '2026-08-07 02:02:54'),
(436, 'Sona Mardiana', '20241320029@sikemah.ukri', NULL, NULL, '$2y$12$hWR6wD2VPoE.UZ4yqoRdKubyebCP.t4kTU0av17Gm/E0Llbe1SWpC', 'mahasiswa', NULL, '2026-08-07 02:02:56', '2026-08-07 02:02:56'),
(437, 'Muhammad Alamsyah', '20241320030@sikemah.ukri', NULL, NULL, '$2y$12$MZYLfiQD4u9t2NcTcLk5uuJiK81NBa6SInTHkMhs84SnmZaCkIMze', 'mahasiswa', NULL, '2026-08-07 02:02:57', '2026-08-07 02:02:57'),
(438, 'Ahmad Sahrul Fadillah', '20241320031@sikemah.ukri', NULL, NULL, '$2y$12$PhYmtKS6aotXJOW5HpCt9OErSTCuQxYlI5A8Vt2zPwnUmvSWjDF7e', 'mahasiswa', NULL, '2026-08-07 02:02:58', '2026-08-07 02:02:58'),
(439, 'Keysha Aprilya Salsabila', '20241320032@sikemah.ukri', NULL, NULL, '$2y$12$lWM6SRGKl3PRoIL8seDY0O0cb6UXaYMg01Ze5h3tRF26GXasS3SWG', 'mahasiswa', NULL, '2026-08-07 02:02:59', '2026-08-07 02:02:59'),
(440, 'Muhammad Abdul Azis', '20241320033@sikemah.ukri', NULL, NULL, '$2y$12$IdMhoWhX7sC82MdgtUCeiurZDXO1V7tnxKQMESBF0Gel1z8vAD43e', 'mahasiswa', NULL, '2026-08-07 02:03:01', '2026-08-07 02:03:01'),
(441, 'Nayla Rabia Gustari', '20241320034@sikemah.ukri', NULL, NULL, '$2y$12$yylUpd2kILU.1qvpTbNsveTp1BexI6g8DBWfa6BhM/KdVpFaM5rsq', 'mahasiswa', NULL, '2026-08-07 02:03:02', '2026-08-07 02:03:02'),
(442, 'Muhamad Alvin Ramadhan', '20241320035@sikemah.ukri', NULL, NULL, '$2y$12$DtIYT33oY7SrCCjXGbGlS.3yq8HxPUC1MYgoeRrU/n9Ndn05QkIQO', 'mahasiswa', NULL, '2026-08-07 02:03:03', '2026-08-07 02:03:03'),
(443, 'Ahmad Gilang Alkodri', '20241320036@sikemah.ukri', NULL, NULL, '$2y$12$y2G5HJty4htt6hS2icDZY.eNkXAkP10wOq8YMwdFHFVP/h5LO5QGK', 'mahasiswa', NULL, '2026-08-07 02:03:07', '2026-08-07 02:03:07'),
(444, 'Aldi Sofyan Sunandar', '20241320037@sikemah.ukri', NULL, NULL, '$2y$12$SxcQu1Hgqaa2GTr.FmvaFem4.L5z90bg7ZXB2PK.gwTefuK4r5DJ.', 'mahasiswa', NULL, '2026-08-07 02:03:08', '2026-08-07 02:03:08'),
(445, 'Fakhry Ahmad Fauzan', '20241320038@sikemah.ukri', NULL, NULL, '$2y$12$4wThBep4he3zI5ffvRw0B.4rcgP7KmM3s.s49sjUmt7fPUedfekPy', 'mahasiswa', NULL, '2026-08-07 02:03:09', '2026-08-07 02:03:09'),
(446, 'Jilan Jalilah', '20241320039@sikemah.ukri', NULL, NULL, '$2y$12$b548t1/95jB93tvdEk2CFu22SAAe.7uvsvRMOSrNEbCCgYalWRRxe', 'mahasiswa', NULL, '2026-08-07 02:03:10', '2026-08-07 02:03:10'),
(447, 'Jopan Maurizt Latue', '20241320040@sikemah.ukri', NULL, NULL, '$2y$12$Md9VWEwyb4jCo1lf0ijW3ue.jIgSdW0pN3sf44KP7Git3XfKpSeyK', 'mahasiswa', NULL, '2026-08-07 02:03:12', '2026-08-07 02:03:12'),
(448, 'Maman Firmansyah', '20241320041@sikemah.ukri', NULL, NULL, '$2y$12$qfW19c2rycdyJ2ApCAN4ceLq.g6pHYYPnCv3dGWhGzJMR27WQqL0q', 'mahasiswa', NULL, '2026-08-07 02:03:13', '2026-08-07 02:03:13'),
(449, 'Muhammad Fajar', '20241320042@sikemah.ukri', NULL, NULL, '$2y$12$41R4JfbjRzb/50BEiPzI7OfZWGDjNS2esQahRyNQIUuEEpVUvhzNm', 'mahasiswa', NULL, '2026-08-07 02:03:14', '2026-08-07 02:03:14'),
(450, 'Paiton Wenda', '20241320043@sikemah.ukri', NULL, NULL, '$2y$12$TyOTnymdGv5okyUNxj40XuDAp18q1QKEKquvS0uvuKdR8AeS7xawi', 'mahasiswa', NULL, '2026-08-07 02:03:15', '2026-08-07 02:03:15'),
(451, 'Reva Tsamrotul Fuadah', '20241320044@sikemah.ukri', NULL, NULL, '$2y$12$KTT4.5EFjmY/mv3HhHIMQOGjgOhs4GE5fBS.BdNZbyK8amhP3Cy3.', 'mahasiswa', NULL, '2026-08-07 02:03:16', '2026-08-07 02:03:16'),
(452, 'Samsudin T. Sahabat', '20241320045@sikemah.ukri', NULL, NULL, '$2y$12$CgpIvT0wo/iXX39DqK89HuNP9GouJ7jN5t4Rig9hPqKVAs8qfqXya', 'mahasiswa', NULL, '2026-08-07 02:03:17', '2026-08-07 02:03:17'),
(453, 'Sobur', '20241320046@sikemah.ukri', NULL, NULL, '$2y$12$Bjhlb9KIYrwvDE.adLJr1u9zR48j1wqCtb9XQYi1Y2xwZGjmjYNIa', 'mahasiswa', NULL, '2026-08-07 02:03:18', '2026-08-07 02:03:18'),
(454, 'Umiyati Dahlan', '20241320047@sikemah.ukri', NULL, NULL, '$2y$12$KHxou5ko7eSwzt3J3A0O9ewHJATO9Yk5IqLslefnaP7n8XpAbAKzi', 'mahasiswa', NULL, '2026-08-07 02:03:19', '2026-08-07 02:03:19'),
(455, 'Usman T. Masa', '20241320048@sikemah.ukri', NULL, NULL, '$2y$12$GjQFCcVXcjbC0VMu9iOd2ehPW9k1ebLSQhPD7syqjTfQQhTgOBiE.', 'mahasiswa', NULL, '2026-08-07 02:03:20', '2026-08-07 02:03:20'),
(456, 'Adel Giskatarina', '20241320049@sikemah.ukri', NULL, NULL, '$2y$12$vB4ygIYOZ.FLKQOl2zVMVeviVma3R.bqsyGTYsBOgXjZTQmJ0y5om', 'mahasiswa', NULL, '2026-08-07 02:03:22', '2026-08-07 02:03:22'),
(457, 'Aldy Ramadany', '20241320050@sikemah.ukri', NULL, NULL, '$2y$12$bOiMiJtg6ZNSw5yzbDkx0.oAsUm08XOMRclrYlyb9pbLpHIAiYVX2', 'mahasiswa', NULL, '2026-08-07 02:03:24', '2026-08-07 02:03:24'),
(458, 'Bagja Septiandika', '20241320051@sikemah.ukri', NULL, NULL, '$2y$12$SfobL/pQkVVBZlWJByUI0ew72QmV9I2pp0CDkkns1pkfuq.VyIhOK', 'mahasiswa', NULL, '2026-08-07 02:03:28', '2026-08-07 02:03:28'),
(459, 'Caryksha Aulia Putri', '20241320052@sikemah.ukri', NULL, NULL, '$2y$12$8EFOVm0QObJyZLwvpYTlrO7feABNTVt6wsem3BHXcrQc7noLyF1y2', 'mahasiswa', NULL, '2026-08-07 02:03:29', '2026-08-07 02:03:29'),
(460, 'Ikbal Maulana Aspahni', '20241320053@sikemah.ukri', NULL, NULL, '$2y$12$UCGFp3iU4g58Tp8ZxLcsAOKEDTtmaRuN1hpO7IK1o9IfldkvZtqA2', 'mahasiswa', NULL, '2026-08-07 02:03:30', '2026-08-07 02:03:30'),
(461, 'Muhammad Akmal Palqah', '20241320054@sikemah.ukri', NULL, NULL, '$2y$12$ruwHdn7lktKsKNDEYESXces4PwtrENpp8p4l6MgZwGGsUv9G/Zzgm', 'mahasiswa', NULL, '2026-08-07 02:03:31', '2026-08-07 02:03:31'),
(462, 'Muhammad Rifqy Wildan', '20241320055@sikemah.ukri', NULL, NULL, '$2y$12$gvDmP0hXKAz1gC4cp/6thu4RtAHFEn7gNXvuCy0VLSZesv9aAoRza', 'mahasiswa', NULL, '2026-08-07 02:03:34', '2026-08-07 02:03:34'),
(463, 'Abdillah Syafiq Gaos', '20241320056@sikemah.ukri', NULL, NULL, '$2y$12$/L3qFm6jqj39nkuRC8h/GOxQUjW6Eniph/ym6ALx3UJ8O62kPP.IC', 'mahasiswa', NULL, '2026-08-07 02:03:36', '2026-08-07 02:03:36'),
(464, 'Denis Permana', '20241320057@sikemah.ukri', NULL, NULL, '$2y$12$qIp9sPAYFzD8nIMHnHHCsenRbUjkKzRyk/e4qcPU55HGlpW7pVE6C', 'mahasiswa', NULL, '2026-08-07 02:03:37', '2026-08-07 02:03:37'),
(465, 'Linda Anjarini', '20241320058@sikemah.ukri', NULL, NULL, '$2y$12$E.uEAThln/RXNykYQTdhMuSYeTYFfnbiukSYXHfiZqQANQRceXZ3q', 'mahasiswa', NULL, '2026-08-07 02:03:38', '2026-08-07 02:03:38'),
(466, 'Muhammad Fajar Nurjaman', '20241320059@sikemah.ukri', NULL, NULL, '$2y$12$PPwCsd3Hio8jpH9Dkw3TI.ltG2Civ/13DSh/XJL3j9p8nRZxZXLVm', 'mahasiswa', NULL, '2026-08-07 02:03:39', '2026-08-07 02:03:39'),
(467, 'Muhammad Zibran Al Rahman', '20241320060@sikemah.ukri', NULL, NULL, '$2y$12$btcIMfvzpbj.Vyt0E3c4nOs.5VeihXtQ469eoWhY6ASoxuJykYvPW', 'mahasiswa', NULL, '2026-08-07 02:03:40', '2026-08-07 02:03:40'),
(468, 'Novi Nopisa', '20241320061@sikemah.ukri', NULL, NULL, '$2y$12$Wfspj8FvuepAee.fpkJrOOU5i0Ueo57YfkchAeL/au2/KrrVc8kQK', 'mahasiswa', NULL, '2026-08-07 02:03:41', '2026-08-07 02:03:41'),
(469, 'R. Elsa Balqis Khoerunnisa Sulaeman', '20241320062@sikemah.ukri', NULL, NULL, '$2y$12$SL7awzhIWOVziXPxMQAOxud.3sHIFFkM.ByKcfQtrdkBhukcnk4JG', 'mahasiswa', NULL, '2026-08-07 02:03:42', '2026-08-07 02:03:42'),
(470, 'Riphan Romadlon', '20241320064@sikemah.ukri', NULL, NULL, '$2y$12$NCIBKH/bXlArZdOuIuCmG.6CZF3R0tt.ujJVWbq9WnaC7rtL/Hcyu', 'mahasiswa', NULL, '2026-08-07 02:03:43', '2026-08-07 02:03:43'),
(471, 'Tetep Safarudin', '20241320065@sikemah.ukri', NULL, NULL, '$2y$12$BZU/zjm2rOMibPQR7LOTbO0Q1GgZYzQmFsLmVdv1vyA1v0lqfX8m2', 'mahasiswa', NULL, '2026-08-07 02:03:44', '2026-08-07 02:03:44'),
(472, 'Julia Desteny Deodonia Langkedeng', '20241320066@sikemah.ukri', NULL, NULL, '$2y$12$xF2KzyA4B57ownDHTcjMjubO/7VUBY0L3H5ZdWrv1za68GkDpppLG', 'mahasiswa', NULL, '2026-08-07 02:03:45', '2026-08-07 02:03:45'),
(473, 'Kiara Evi Nurdiati Putri Rahmatillah', '20241320067@sikemah.ukri', NULL, NULL, '$2y$12$9xzA1JA2Uv1igbBAC8lzwOFdkAZprPBVdZeaBjOWdisx2OlE6Kf7a', 'mahasiswa', NULL, '2026-08-07 02:03:47', '2026-08-07 02:03:47'),
(474, 'Nabil Ramadhan', '20241320068@sikemah.ukri', NULL, NULL, '$2y$12$HGQ5AJx8RQ.AhrHeE6fdEugKolcIPpqEnfITRwp8tZ967k/q0p4z.', 'mahasiswa', NULL, '2026-08-07 02:03:48', '2026-08-07 02:03:48'),
(475, 'Nadia Dinda Nabila Maharani', '20241320069@sikemah.ukri', NULL, NULL, '$2y$12$s0Q3y0QhXgQS9wl/kSWrw.kqhCIyauYU74jPbki.tSUoUfC9mPzKm', 'mahasiswa', NULL, '2026-08-07 02:03:49', '2026-08-07 02:03:49'),
(476, 'Rahayu Padilah', '20241320070@sikemah.ukri', NULL, NULL, '$2y$12$ep3.FzzV7GPGA82xUFDs3.l5sszmYP8GBQ/G3R7ecqP6cYDr9mMhS', 'mahasiswa', NULL, '2026-08-07 02:03:50', '2026-08-07 02:03:50'),
(477, 'Aal Maulana Rahmat', '20241320071@sikemah.ukri', NULL, NULL, '$2y$12$EwJAsQFn/qxI7DvORbrQnuTgfuBDgXLOTGuptJ/.Z3xLAfEn/sylq', 'mahasiswa', NULL, '2026-08-07 02:03:51', '2026-08-07 02:03:51'),
(478, 'Amara Sylvi Yuliana', '20241320072@sikemah.ukri', NULL, NULL, '$2y$12$kJzDJtN2YAD/IpgPxcpuf.DQNknY8duhF1bhrPeia8gep3j1oa9ra', 'mahasiswa', NULL, '2026-08-07 02:03:52', '2026-08-07 02:03:52'),
(479, 'Fatin Asyifa Nurrizky Jenputri', '20241320073@sikemah.ukri', NULL, NULL, '$2y$12$rA.JNA/F/LoUPKdMB/y.aunU4/8YHP0vJF5/siX4y.dzsj8VFx8Yy', 'mahasiswa', NULL, '2026-08-07 02:03:53', '2026-08-07 02:03:53'),
(480, 'Fitozulhian Jabatami', '20241320074@sikemah.ukri', NULL, NULL, '$2y$12$6rSHaVo96FOPRiO6WQIZQOyocrxUQJRKetHhLeyfoFLWxo1febVjm', 'mahasiswa', NULL, '2026-08-07 02:03:54', '2026-08-07 02:03:54'),
(481, 'Ilham Al Munawar', '20241320075@sikemah.ukri', NULL, NULL, '$2y$12$AMPZQyufOzVfGuOOCzlp4evlXkwlsbpS/jkzmof/qJoEyUAA/T80W', 'mahasiswa', NULL, '2026-08-07 02:03:55', '2026-08-07 02:03:55'),
(482, 'Nabilah Asana Alecia', '20241320076@sikemah.ukri', NULL, NULL, '$2y$12$.PrEvxHI9dndvNlDiAWo5exSO0IExT2xwCELm2B3fUKPS2DUdjI2m', 'mahasiswa', NULL, '2026-08-07 02:03:57', '2026-08-07 02:03:57'),
(483, 'Najwa Alifah', '20241320077@sikemah.ukri', NULL, NULL, '$2y$12$a9PheV8lbuWzaQJrXbUuYuFcdTZ57.CATnn6./bTJJq/N/MDiQ3UO', 'mahasiswa', NULL, '2026-08-07 02:03:58', '2026-08-07 02:03:58'),
(484, 'Wahyu Bonita Juliana Sari', '20241320079@sikemah.ukri', NULL, NULL, '$2y$12$IZc48tanFIwqs8AY35KFFO4EbmZpmVETrs8tfR/al1v8hSe3.Y/bm', 'mahasiswa', NULL, '2026-08-07 02:04:00', '2026-08-07 02:04:00'),
(485, 'Yunita Nur\'aini', '20241320080@sikemah.ukri', NULL, NULL, '$2y$12$nvMlgyqQ7hcuPMv1gtOP8uXBI.TKnO508TKBKuunFNd1.5IWHViTS', 'mahasiswa', NULL, '2026-08-07 02:04:01', '2026-08-07 02:04:01'),
(486, 'Fazna Laisal Ramadhan', '20241320081@sikemah.ukri', NULL, NULL, '$2y$12$cHu0uc27hn.OP.auROhmxOA6OwNBR1LpQG7ptpZPpWSCECCKYgiEu', 'mahasiswa', NULL, '2026-08-07 02:04:01', '2026-08-07 02:04:01'),
(487, 'Gilang Bungsu Putra Anugrah', '20241320082@sikemah.ukri', NULL, NULL, '$2y$12$qEGzhmCrbXplt1JkDpUjL.qi0whbUhC5UDwzRzKFcWePbTkvn7lU2', 'mahasiswa', NULL, '2026-08-07 02:04:02', '2026-08-07 02:04:02'),
(488, 'Ikhsan', '20241320083@sikemah.ukri', NULL, NULL, '$2y$12$AL513A9K/I8Gy0GGXEa.g.Fz0FzUb0HGYyt6YJyx5.4cUcL4k3uE2', 'mahasiswa', NULL, '2026-08-07 02:04:04', '2026-08-07 02:04:04'),
(489, 'Nazwa Ima Fadia', '20241320084@sikemah.ukri', NULL, NULL, '$2y$12$1/xkalhmHWZTft2vOvpK6.Pr2sE/ou9jQQmVm9GX9s3ZKT3KVRCjK', 'mahasiswa', NULL, '2026-08-07 02:04:05', '2026-08-07 02:04:05'),
(490, 'Sheva Heizatul Ikhwan', '20241320085@sikemah.ukri', NULL, NULL, '$2y$12$FGXelN6EenF2znnY/MN0lOj5x8nICatn7WnzAf9npvsYLZM5kbcd.', 'mahasiswa', NULL, '2026-08-07 02:04:06', '2026-08-07 02:04:06'),
(491, 'Khansa Mufidah Salsabila', '20241320086@sikemah.ukri', NULL, NULL, '$2y$12$/F9roS5dosPweNcy4t.BGepe2m92hr4B4f/PFWoDG2iWk0d9FlDSa', 'mahasiswa', NULL, '2026-08-07 02:04:07', '2026-08-07 02:04:07'),
(492, 'Aril Julfikar', '20241320087@sikemah.ukri', NULL, NULL, '$2y$12$dtNokqYCYkJt.2jrgtGtjOHQT143BzE3mgDRCPc2nbuEkx50vFZMO', 'mahasiswa', NULL, '2026-08-07 02:04:08', '2026-08-07 02:04:08'),
(493, 'Hilmanda', '20241320088@sikemah.ukri', NULL, NULL, '$2y$12$C8AQ1Q5wjht8fq6.yZtWr.TW471dwCfYYb8Hj.2uqmRdIJA3N3eUe', 'mahasiswa', NULL, '2026-08-07 02:04:09', '2026-08-07 02:04:09'),
(494, 'Mochammad Adhi Ryansyah', '20241320089@sikemah.ukri', NULL, NULL, '$2y$12$hZSgltz646X/kDLIGUd1.OKhzP8cwZbzBsBWq6SxGMQZ7KlEz0vHm', 'mahasiswa', NULL, '2026-08-07 02:04:11', '2026-08-07 02:04:11'),
(495, 'Muhammad Ilyas Fauzi', '20241320090@sikemah.ukri', NULL, NULL, '$2y$12$J9AMoQ29wth7K/nwZTqJQ.M5Qw5VdcKGPrzWDermAvQjXT8bmORze', 'mahasiswa', NULL, '2026-08-07 02:04:12', '2026-08-07 02:04:12'),
(496, 'Naufal Al Farros', '20241320091@sikemah.ukri', NULL, NULL, '$2y$12$neIOrcE9W79nynkZ0bmAI./0YEcA0/5poRwzxrjo.Ilb6Ub6pz9r6', 'mahasiswa', NULL, '2026-08-07 02:04:13', '2026-08-07 02:04:13'),
(497, 'Melvy Anjani Herdiyanthi', '20241320093@sikemah.ukri', NULL, NULL, '$2y$12$AgIySmrqfzSq9kNlzRrOI.hyUb4gmB2TEH.LiO2AOW6dW8C7AAlxC', 'mahasiswa', NULL, '2026-08-07 02:04:14', '2026-08-07 02:04:14'),
(498, 'Muhammad Abdul Azis', '20241320094@sikemah.ukri', NULL, NULL, '$2y$12$cVU4fa5adh42IihKSIGM/OTmWM/w0Zhdb6CCUfRJ7ewLqMlq9D2om', 'mahasiswa', NULL, '2026-08-07 02:04:15', '2026-08-07 02:04:15'),
(499, 'Sarina Febriani', '20251320001@sikemah.ukri', NULL, NULL, '$2y$12$/gYM5GMgl0X0ZMnDvGcBjO6f7PiZg1o7CxVQINuA5vd9z1/wqk6bi', 'mahasiswa', NULL, '2026-08-07 02:04:16', '2026-08-07 02:04:16'),
(500, 'Kenny Naufal Rizal Abadi', '20251320002@sikemah.ukri', NULL, NULL, '$2y$12$IaCtKGl6jb.O85hJJbrhzOqA/bc8MwsL1LcrFapfzPU3gyz3NBOYW', 'mahasiswa', NULL, '2026-08-07 02:04:17', '2026-08-07 02:04:17'),
(501, 'Diki Aryadi', '20251320003@sikemah.ukri', NULL, NULL, '$2y$12$nymMC8hK5muwQcu5z179cur9WYJ4tu9AzNmh/EMQ.uMiv.WRgM6Zu', 'mahasiswa', NULL, '2026-08-07 02:04:18', '2026-08-07 02:04:18'),
(502, 'Ahmad Yasir', '20251320005@sikemah.ukri', NULL, NULL, '$2y$12$ZYGR6iPYjmYN7SjXhhSNpunpgXwQGBcZcj42QGmiQ1uB1dkBymuiy', 'mahasiswa', NULL, '2026-08-07 02:04:19', '2026-08-07 02:04:19'),
(503, 'Indah Bunga Permata', '20251320006@sikemah.ukri', NULL, NULL, '$2y$12$rGxw4cmYY1Txa0fAIMOcc.lnm84.1wGgR56ie1wKkWvYL.8S56AYS', 'mahasiswa', NULL, '2026-08-07 02:04:20', '2026-08-07 02:04:20'),
(504, 'Saipan Najah', '20251320007@sikemah.ukri', NULL, NULL, '$2y$12$Who/rINa5PP.kpxk0glTbOwcPx/VVN0EDNMIWZMRxavj6T0s64NAu', 'mahasiswa', NULL, '2026-08-07 02:04:21', '2026-08-07 02:04:21'),
(505, 'Ditha Ekawaty', '20251320008@sikemah.ukri', NULL, NULL, '$2y$12$OZsGJde3lL8qTPjlppTwP.QFcYxugX5.ctulhR6xdflQjyPgvRPmu', 'mahasiswa', NULL, '2026-08-07 02:04:22', '2026-08-07 02:04:22'),
(506, 'Fazari Alhafidz', '20251320009@sikemah.ukri', NULL, NULL, '$2y$12$EX3jOj47MF6ZLrYZfcZ6neQgco6m.XGb1r3TV3FXCgj/HIQcUSDPe', 'mahasiswa', NULL, '2026-08-07 02:04:23', '2026-08-07 02:04:23'),
(507, 'Hilga Maytavani', '20251320010@sikemah.ukri', NULL, NULL, '$2y$12$J6HlV4hE4liBBiZzj1Cu5.tc/p6g0tC9Q/bp.iWu5vCHx93eHCamO', 'mahasiswa', NULL, '2026-08-07 02:04:24', '2026-08-07 02:04:24'),
(508, 'Vilya Riksa Sanubari', '20251320011@sikemah.ukri', NULL, NULL, '$2y$12$FfTGMCnWfz5JXISi0ysp/e3wfSdPGiyQKwiWhqyeSbxW2Jk0NMAkK', 'mahasiswa', NULL, '2026-08-07 02:04:25', '2026-08-07 02:04:25'),
(509, 'Selvi', '20251320012@sikemah.ukri', NULL, NULL, '$2y$12$XJNshsIxi.LovsGkvZdSTuc4kaBpsSEw.U3sj1roAa3.6ZVzy9X0a', 'mahasiswa', NULL, '2026-08-07 02:04:26', '2026-08-07 02:04:26'),
(510, 'Muhamad Alkadapi', '20251320013@sikemah.ukri', NULL, NULL, '$2y$12$clw8HGtX8hociUv8UueAtOZC4/k6/HuVSquvmLD0Wno.bFXSpMr1W', 'mahasiswa', NULL, '2026-08-07 02:04:27', '2026-08-07 02:04:27'),
(511, 'Jenni Monika Walilo', '20251320014@sikemah.ukri', NULL, NULL, '$2y$12$EbWltP6J4x5LLcY.nS1D9..EfAhPG1yPWwBPc2PxSWpXFbdqxWRSy', 'mahasiswa', NULL, '2026-08-07 02:04:28', '2026-08-07 02:04:28');
INSERT INTO `pengguna` (`id`, `nama`, `email`, `sso_username`, `email_verified_at`, `password`, `peran`, `remember_token`, `created_at`, `updated_at`) VALUES
(512, 'Kiara Putri Chairunnisa', '20251320015@sikemah.ukri', NULL, NULL, '$2y$12$gn7UrV9xTMuZEQocItGSs.3BsCR.Cc1M2nVKTLRS.oqLc0FNqoKdu', 'mahasiswa', NULL, '2026-08-07 02:04:29', '2026-08-07 02:04:29'),
(513, 'Vasya Andara Putri Efendi', '20251320016@sikemah.ukri', NULL, NULL, '$2y$12$gJIEPiFa4Y/9kDuJiqqBoeHVPHs0jWmAqMlYAB8VkmEZ1awJfQllO', 'mahasiswa', NULL, '2026-08-07 02:04:30', '2026-08-07 02:04:30'),
(514, 'Muhammad Al Faruq', '20251320017@sikemah.ukri', NULL, NULL, '$2y$12$pyT7DmWdLnLhjBSPyMuR/upFLqi7rVIQ/nlhNGfGew0qn1jF9Alfm', 'mahasiswa', NULL, '2026-08-07 02:04:31', '2026-08-07 02:04:31'),
(515, 'Yundira Putri Andini', '20251320018@sikemah.ukri', NULL, NULL, '$2y$12$Tt/sPf1cZQjLOOcmI.8p9eus0NoQM2lkMJvDmzX6PO6EAqWK7LQSu', 'mahasiswa', NULL, '2026-08-07 02:04:32', '2026-08-07 02:04:32'),
(516, 'Reyna Dwi Anastasya', '20251320019@sikemah.ukri', NULL, NULL, '$2y$12$4rVDt9NT8j7p7hhmUotToegMfCSBhra6H830Ba906AVkpGQoK6F1.', 'mahasiswa', NULL, '2026-08-07 02:04:33', '2026-08-07 02:04:33'),
(517, 'Muhamad Dani', '20251320020@sikemah.ukri', NULL, NULL, '$2y$12$U6Tx48pmMDW5Kq9wQNNnBOvpJStqiB7p0Thk7UyWnZv3/nniGuSGS', 'mahasiswa', NULL, '2026-08-07 02:04:34', '2026-08-07 02:04:34'),
(518, 'Siti Sela', '20251320021@sikemah.ukri', NULL, NULL, '$2y$12$PuHMcxKcVDJMaQCts6SACO1dHySctkJExKABjdXGYCwJf3Kcc5vku', 'mahasiswa', NULL, '2026-08-07 02:04:34', '2026-08-07 02:04:34'),
(519, 'Moch Rizky Pratama Ramadhani', '20251320022@sikemah.ukri', NULL, NULL, '$2y$12$8stuO/3UhfKvaqPUavxjV.NUd94vaV8AnZzzuxBWtuwQ9a85F2lw.', 'mahasiswa', NULL, '2026-08-07 02:04:35', '2026-08-07 02:04:35'),
(520, 'Rini Denia Putri', '20251320023@sikemah.ukri', NULL, NULL, '$2y$12$28c5WxiNYCHeTI3v.7ngouaiMnfWziUe44MjFcnRUAdiGaXrKNO/S', 'mahasiswa', NULL, '2026-08-07 02:04:36', '2026-08-07 02:04:36'),
(521, 'Ridwan Setiawan', '20251320024@sikemah.ukri', NULL, NULL, '$2y$12$95J9unSZ5tidvWTX46CPVuNt26S/b4kG/2J.z5rdwe7PFn7r1JI.C', 'mahasiswa', NULL, '2026-08-07 02:04:37', '2026-08-07 02:04:37'),
(522, 'Hilda Auliyah', '20251320025@sikemah.ukri', NULL, NULL, '$2y$12$NaqoN5ecR2qgWk9NxTENjOEtlKNtuDg.pTmPG1XM34LOzbXOt0QqS', 'mahasiswa', NULL, '2026-08-07 02:04:38', '2026-08-07 02:04:38'),
(523, 'Lailaturrohmah Alya Zahra', '20251320026@sikemah.ukri', NULL, NULL, '$2y$12$0JQgBYj7E0luCKKyO0ycYel15Jjp7n2EW/JDJUdsdxqLP6Ahv16yi', 'mahasiswa', NULL, '2026-08-07 02:04:40', '2026-08-07 02:04:40'),
(524, 'Bintang Prasetyo Susanto', '20251320027@sikemah.ukri', NULL, NULL, '$2y$12$EavLqHWtA2YoO9NRW35mJuzjWuj1CdsZu2CAWAVbgcHGvx2957dFe', 'mahasiswa', NULL, '2026-08-07 02:04:41', '2026-08-07 02:04:41'),
(525, 'Fera Fatimah Azzahra', '20251320028@sikemah.ukri', NULL, NULL, '$2y$12$5gNs16RHDQbd05MXdPD8z.Lp0oIXgh/vg3bpY22MJbQgmGFLCn8c2', 'mahasiswa', NULL, '2026-08-07 02:04:42', '2026-08-07 02:04:42'),
(526, 'Huzaifah Liani Claudia', '20251320029@sikemah.ukri', NULL, NULL, '$2y$12$O0wL9.BBx.hMUiH//2IE4.tcd1gnCmDoDTgjQrt.F1Y/sz2dof.Dm', 'mahasiswa', NULL, '2026-08-07 02:04:43', '2026-08-07 02:04:43'),
(527, 'Kaysha Ratuazzira', '20251320030@sikemah.ukri', NULL, NULL, '$2y$12$o6UpnuDnhDJCeLwlielLkOjZHu92F4KGXrkbSPEM2Z6DbLw0WdaVa', 'mahasiswa', NULL, '2026-08-07 02:04:44', '2026-08-07 02:04:44'),
(528, 'Dava Sandi Putra', '20251320031@sikemah.ukri', NULL, NULL, '$2y$12$fV88ZzXWn52JKwk2cupPP.jjiKBykWBNOgDyYOeV9QwNmmWwoA9x.', 'mahasiswa', NULL, '2026-08-07 02:04:45', '2026-08-07 02:04:45'),
(529, 'Sesil Praya Sipansyah', '20251320032@sikemah.ukri', NULL, NULL, '$2y$12$7fPrwoT7sGXv.vKT2dwnx.lbp5tCSAK/d2gTlV9xiH4TdUB7PiVsK', 'mahasiswa', NULL, '2026-08-07 02:04:47', '2026-08-07 02:04:47'),
(530, 'Rani Anggraini Ramadhani', '20251320033@sikemah.ukri', NULL, NULL, '$2y$12$p90Cl7fymRRTNilkLpv2b.G3DuDEDuVnSs42m28ZbPX6cnYuCjO0O', 'mahasiswa', NULL, '2026-08-07 02:04:48', '2026-08-07 02:04:48'),
(531, 'Muhammad Fahri Abrar', '20251320035@sikemah.ukri', NULL, NULL, '$2y$12$yroRMRhSvFlfGahDf5rTbuGE97uDCHH/MNEgZBYZY0Dnk59Pno/Rq', 'mahasiswa', NULL, '2026-08-07 02:04:49', '2026-08-07 02:04:49'),
(532, 'Filsan Subhi', '20251320036@sikemah.ukri', NULL, NULL, '$2y$12$cBF1Rl4aExCsCL7ZYQnCH.LT.OKQnJ7s1/PZNiORjslyXMXObpQwO', 'mahasiswa', NULL, '2026-08-07 02:04:50', '2026-08-07 02:04:50'),
(533, 'Hilal Shofar Falih', '20251320037@sikemah.ukri', NULL, NULL, '$2y$12$rkNFI6D852uLqCwv2QpKbOTae9H1Jtg5VW9oRKpnrVQPmI2OrqR.e', 'mahasiswa', NULL, '2026-08-07 02:04:51', '2026-08-07 02:04:51'),
(534, 'Fadilah Subhan', '20251320038@sikemah.ukri', NULL, NULL, '$2y$12$gJfk84zxT1exrcfyfYGQMeOyiHEs9oWl64uV0KnYAfOmonF.vklxK', 'mahasiswa', NULL, '2026-08-07 02:04:52', '2026-08-07 02:04:52'),
(535, 'Muhammad Rizky Maulana Hermawan', '20251320039@sikemah.ukri', NULL, NULL, '$2y$12$qs6fpaKpStfYSMacDgL2cOVhy3C9n/7Oai2spYOQhGl.mnrd.2qiq', 'mahasiswa', NULL, '2026-08-07 02:04:53', '2026-08-07 02:04:53'),
(536, 'Zulfa Munifah Sapna', '20251320040@sikemah.ukri', NULL, NULL, '$2y$12$ffnZb41ZWrAjJhj.04vsXe9p0zNI8LolELacbil9XggYIyA7pDqe2', 'mahasiswa', NULL, '2026-08-07 02:04:55', '2026-08-07 02:04:55'),
(537, 'Muhammad Hafiizh \'abdul Qoodir', '20251320041@sikemah.ukri', NULL, NULL, '$2y$12$IYrWSMtHKVyjsPYaucB5J.2zSiTKjESYqSLg0KfUfKiEndivTF7Hu', 'mahasiswa', NULL, '2026-08-07 02:04:55', '2026-08-07 02:04:55'),
(538, 'Debby Ramadhani', '20251320042@sikemah.ukri', NULL, NULL, '$2y$12$jvcpJ6imqypiujrMjTPhOesc.iCCTlkBSsMwG5681PdsFFLjeheIq', 'mahasiswa', NULL, '2026-08-07 02:04:56', '2026-08-07 02:04:56'),
(539, 'Jauzaa\' Aliifah Hasnaa Putrilyra', '20251320043@sikemah.ukri', NULL, NULL, '$2y$12$J8.DsjJtbKLipkNIq1MeBuP4/YuxC9/miMcZ2tVuSa.ONOKq3RDzO', 'mahasiswa', NULL, '2026-08-07 02:04:58', '2026-08-07 02:04:58'),
(540, 'Aqila Adreza Amin', '20251320044@sikemah.ukri', NULL, NULL, '$2y$12$/0L1z3Z3qbLfi7YRfRASOe.TTVDGbRKtn2gkfGcnu3dFT5aBKip/O', 'mahasiswa', NULL, '2026-08-07 02:04:58', '2026-08-07 02:04:58'),
(541, 'Miptah Ari Wahyudi', '20251320045@sikemah.ukri', NULL, NULL, '$2y$12$IZhARx40FNBIMUnMJCUpLu77s/U4ET8S1Rksvgxeu4a7pHDkC75RG', 'mahasiswa', NULL, '2026-08-07 02:04:59', '2026-08-07 02:04:59'),
(542, 'Dela Salsabilla', '20251320046@sikemah.ukri', NULL, NULL, '$2y$12$9roJckbHKK49RCQ8Q10isOKa3hihFkhNs7jq0fTVwaHQFBZNqd/R.', 'mahasiswa', NULL, '2026-08-07 02:05:01', '2026-08-07 02:05:01'),
(543, 'Alia Cintia Anjjali', '20251320047@sikemah.ukri', NULL, NULL, '$2y$12$T4W/TYzL2Q2UqztfwsnHc.Mkk71MpAt9c.95ijKFOtZNM7VUnL.N6', 'mahasiswa', NULL, '2026-08-07 02:05:04', '2026-08-07 02:05:04'),
(544, 'Renaldi Muhammad Ramdhan', '20251320048@sikemah.ukri', NULL, NULL, '$2y$12$gBBmQ8cxRxXXYOLoN9w5LuGeKjPon4DdV66GlViYyvxjAZltyQSpC', 'mahasiswa', NULL, '2026-08-07 02:05:06', '2026-08-07 02:05:06'),
(545, 'Endrio Tirta Yudisthira', '20251320049@sikemah.ukri', NULL, NULL, '$2y$12$LZLRnpqX7DlsZPvRzNiUxO.tDsTcevMH49FSMGkwd7Em9thQe5nWG', 'mahasiswa', NULL, '2026-08-07 02:05:07', '2026-08-07 02:05:07'),
(546, 'Mochamad Andhika Baadilah', '20251320050@sikemah.ukri', NULL, NULL, '$2y$12$XC2O8pEkB8U0JVbLCSZiE.JQJ7aMtvfK9a4Odf8FWs.7gyFLrnMAa', 'mahasiswa', NULL, '2026-08-07 02:05:08', '2026-08-07 02:05:08'),
(547, 'Naura Syahla Paliha', '20251320051@sikemah.ukri', NULL, NULL, '$2y$12$7k0JXpQjEMl.BN.c5K2J.e.7Pb6/tCjr.xVHgx3ehU.AVqy3JYsRu', 'mahasiswa', NULL, '2026-08-07 02:05:09', '2026-08-07 02:05:09'),
(548, 'Azmi Silmi Fauzan', '20251320052@sikemah.ukri', NULL, NULL, '$2y$12$KBLlIe8hM53oSeF1IFYsaukyOH.JPkSRjbwAEfdbM.FA1.cReUipq', 'mahasiswa', NULL, '2026-08-07 02:05:10', '2026-08-07 02:05:10'),
(549, 'Hasbi Hanifiansi', '20251320053@sikemah.ukri', NULL, NULL, '$2y$12$JcK7lLy/vYfNyjWx3IpXV.6Dzuv70/Zi0GwvbXGI2XO5F/gK4yjVS', 'mahasiswa', NULL, '2026-08-07 02:05:10', '2026-08-07 02:05:10'),
(550, 'Marsya Wulandari', '20251320054@sikemah.ukri', NULL, NULL, '$2y$12$79C4awCKjlNDB4nPB6MNH.177WiDzb83c406WaSKpR0CDA21V05NO', 'mahasiswa', NULL, '2026-08-07 02:05:11', '2026-08-07 02:05:11'),
(551, 'Anggraeni Tunggal Dewi', '20251320055@sikemah.ukri', NULL, NULL, '$2y$12$fLIVhM.1RxWEerMgbIFwTuHc9JApy2Hf7TbtfIKnT0532VqfxD0yK', 'mahasiswa', NULL, '2026-08-07 02:05:12', '2026-08-07 02:05:12'),
(552, 'Anisa Sherindila', '20251320056@sikemah.ukri', NULL, NULL, '$2y$12$JjaWBIKHeehvcskgr71lPeLwvBqMbzzl/bqRBs/HKbnq7Rg8s5xTO', 'mahasiswa', NULL, '2026-08-07 02:05:13', '2026-08-07 02:05:13'),
(553, 'Dela Tarica', '20251320057@sikemah.ukri', NULL, NULL, '$2y$12$BdsGdZltJ6FX6JsQx47AKumySXJxjiQdXzKNQtRaiZmvLfoAFx9cO', 'mahasiswa', NULL, '2026-08-07 02:05:14', '2026-08-07 02:05:14'),
(554, 'Aufa Satria Ekaputra', '20251320058@sikemah.ukri', NULL, NULL, '$2y$12$RvSfvaYnJmujKVdRtNdCRebSNSGUz/yGd9mYDHqZM8KYjVUuYxxtW', 'mahasiswa', NULL, '2026-08-07 02:05:15', '2026-08-07 02:05:15'),
(555, 'Aura Lia Anggraeni', '20251320059@sikemah.ukri', NULL, NULL, '$2y$12$.ovfIIThIg6h6hRmeti4tusgs5IZ/MrW3DLnyfjHRtHXKLuB0EWCC', 'mahasiswa', NULL, '2026-08-07 02:05:16', '2026-08-07 02:05:16'),
(556, 'Aam Rahmanda Gusnaeni', '20251320060@sikemah.ukri', NULL, NULL, '$2y$12$MxgVkFlbfnszuoxhRkmRd.zmtAgsVbJ.OTryjAbf349LWFOQmmJCy', 'mahasiswa', NULL, '2026-08-07 02:05:17', '2026-08-07 02:05:17'),
(557, 'Muhamad Zidane', '20251320061@sikemah.ukri', NULL, NULL, '$2y$12$x0sRMAxYfaai2QMznkcTF.t4D5bq3BqlSTzha5RTSND9OsA1xroSi', 'mahasiswa', NULL, '2026-08-07 02:05:18', '2026-08-07 02:05:18'),
(558, 'Faisal Joe', '20251320062@sikemah.ukri', NULL, NULL, '$2y$12$zn9hb5.S.YC7Bl1VIc37Zul7U8vFmGZfZkf1UYFe30yH1C0/Ksp2W', 'mahasiswa', NULL, '2026-08-07 02:05:19', '2026-08-07 02:05:19'),
(559, 'Fany Ramadhani Putri', '20251320063@sikemah.ukri', NULL, NULL, '$2y$12$LaR9TD52ElC20JjNyt1xauvIct8Wz5qEV9Vyg4/2D1xLfZ0Dzg2k6', 'mahasiswa', NULL, '2026-08-07 02:05:20', '2026-08-07 02:05:20'),
(560, 'Syahdan Aryadi', '20251320064@sikemah.ukri', NULL, NULL, '$2y$12$BwmpaT6fRA9Ll.DYCvIa3u99v7hjfDHHo/b4wEsvw/jN5rQwPfLY6', 'mahasiswa', NULL, '2026-08-07 02:05:21', '2026-08-07 02:05:21'),
(561, 'Muhammad Lingga Atqia', '20251320065@sikemah.ukri', NULL, NULL, '$2y$12$dkXX7i1DGQxvo6ajbx.gW.Ar/q/5UpXgmTF28Uo6WSwuc6gBAPTgi', 'mahasiswa', NULL, '2026-08-07 02:05:22', '2026-08-07 02:05:22'),
(562, 'Nabil Zuhad Hidayat', '20251320066@sikemah.ukri', NULL, NULL, '$2y$12$bmaSlvRwh960X7ix37Cif.aBzJZLDDKB1lu9sgsz/sxIOmhBjL.5C', 'mahasiswa', NULL, '2026-08-07 02:05:24', '2026-08-07 02:05:24'),
(563, 'Hesti Julia Rohmah', '20251320067@sikemah.ukri', NULL, NULL, '$2y$12$6NxajTylYyYIydatb4ivSuk.TdZiPTqXkLOQaJy5NTBBu32OzKuUC', 'mahasiswa', NULL, '2026-08-07 02:05:25', '2026-08-07 02:05:25'),
(564, 'Devan Febriansyah', '20251320068@sikemah.ukri', NULL, NULL, '$2y$12$jnUV5xuTvxi63VorA.KmWOZRV8XC20yTZTmukt6ECHxqwTkj9cYTm', 'mahasiswa', NULL, '2026-08-07 02:05:26', '2026-08-07 02:05:26'),
(565, 'Zalfa Dwinadya Rahmadani', '20251320069@sikemah.ukri', NULL, NULL, '$2y$12$as0bWt3UAjM./5fkXil4wOrbORghKogd.7hXkmKD1Nl/rDvqHpbRa', 'mahasiswa', NULL, '2026-08-07 02:05:27', '2026-08-07 02:05:27'),
(566, 'Muthia Aulia Salsabila', '20251320070@sikemah.ukri', NULL, NULL, '$2y$12$i7Nj.yFrIWDYe1iPgByM8.emfAzcBdu3dAiDcHiABGP5LMG1M.Puu', 'mahasiswa', NULL, '2026-08-07 02:05:29', '2026-08-07 02:05:29'),
(567, 'Muhamad Farhan', '20251320071@sikemah.ukri', NULL, NULL, '$2y$12$kXLFSoHP6n6dnl4nWgdXIewaNhLEyboT8kqelpAQU9svKZSgSOLHG', 'mahasiswa', NULL, '2026-08-07 02:05:30', '2026-08-07 02:05:30'),
(568, 'Taufik Nur Rohmat', '20251320072@sikemah.ukri', NULL, NULL, '$2y$12$F7HptJqj1umts48whmwaF.GoYwrM8BxjRO8vGoh3g0ha5iSIcCirq', 'mahasiswa', NULL, '2026-08-07 02:05:31', '2026-08-07 02:05:31'),
(569, 'Krisna Raga Putra Susandi', '20251320073@sikemah.ukri', NULL, NULL, '$2y$12$gUuAJvE.5rMEyiG2X1oJuuv98rwrYe1xMuujzoLev/CeGC6G.Dq6u', 'mahasiswa', NULL, '2026-08-07 02:05:32', '2026-08-07 02:05:32'),
(570, 'Muhammad Agil Ramdani', '20251320074@sikemah.ukri', NULL, NULL, '$2y$12$pg8btcXoLr/W0F36azFwV.gB2ZNKTRRTqz6iTlggsblna/czUDtXu', 'mahasiswa', NULL, '2026-08-07 02:05:33', '2026-08-07 02:05:33'),
(571, 'Almira Salis', '20251320075@sikemah.ukri', NULL, NULL, '$2y$12$WnHDV/.7ja10MVdZc0Jjc.9PZOzNQCzXqqG5IeMoDSUvgQNYDfliG', 'mahasiswa', NULL, '2026-08-07 02:05:35', '2026-08-07 02:05:35'),
(572, 'Ayla Falisha Nibras', '20251320076@sikemah.ukri', NULL, NULL, '$2y$12$UqWWZ38aUAvTEESBBswAv.ZbfecT7D8L1SqEMBXEoXDmc2xsWaQJy', 'mahasiswa', NULL, '2026-08-07 02:05:36', '2026-08-07 02:05:36'),
(573, 'Muhammad Rifat Syahputra', '20251320077@sikemah.ukri', NULL, NULL, '$2y$12$XsrPjPi2KbQ6K1CAAHiIYuBtUpp08PQzblo64zOl975Z7kZ9qIOPO', 'mahasiswa', NULL, '2026-08-07 02:05:37', '2026-08-07 02:05:37'),
(574, 'Farel Firdaus Shydiq', '20251320078@sikemah.ukri', NULL, NULL, '$2y$12$AoCzzDEuPabZtQLYhVvJTeqF4ViIkNfGd0MDlZyFPupv01ywdEBb6', 'mahasiswa', NULL, '2026-08-07 02:05:38', '2026-08-07 02:05:38'),
(575, 'Zulfikar Ramadhani', '20251320079@sikemah.ukri', NULL, NULL, '$2y$12$O.9Or0QlGyPau6puj2euHumtglPllzPw/X3tQ3azW7UkbWhihA0e.', 'mahasiswa', NULL, '2026-08-07 02:05:40', '2026-08-07 02:05:40'),
(576, 'Al Afif Abdurrahman', '20221310002@sikemah.ukri', NULL, NULL, '$2y$12$xgWUvYmdd5AHnko6lUs2qOQQPGToPzO98/YZQ3gHcrGz0hkxtBU8W', 'mahasiswa', NULL, '2026-08-07 02:17:44', '2026-08-07 02:17:44'),
(577, 'Cahya Purnama Aji', '20221310010@sikemah.ukri', NULL, NULL, '$2y$12$Ufu5cDKVoLtZPnBch7H4xeNCfVPSgBh4onp7uEqIC8ngLkBHlLnq6', 'mahasiswa', NULL, '2026-08-07 02:17:45', '2026-08-07 02:17:45'),
(578, 'Bagas Satrio Perwira Utama', '20231310003@sikemah.ukri', NULL, NULL, '$2y$12$65PmYU/ROw9P0WC3nUjy7.1H47ZkSiLzhTSNkY8yX22./kndgweqC', 'mahasiswa', NULL, '2026-08-07 02:17:46', '2026-08-07 02:17:46');

-- --------------------------------------------------------

--
-- Table structure for table `portofolio`
--

CREATE TABLE `portofolio` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `mahasiswa_id` bigint(20) UNSIGNED NOT NULL,
  `total_poin` decimal(10,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `portofolio`
--

INSERT INTO `portofolio` (`id`, `mahasiswa_id`, `total_poin`, `created_at`, `updated_at`) VALUES
(5, 5, 0.00, '2026-08-07 01:55:42', '2026-08-16 09:53:32'),
(6, 6, 0.00, '2026-08-07 01:55:43', '2026-08-07 01:55:43'),
(7, 7, 0.00, '2026-08-07 01:55:44', '2026-08-07 01:55:44'),
(8, 8, 0.00, '2026-08-07 01:55:45', '2026-08-07 01:55:45'),
(9, 9, 0.00, '2026-08-07 01:55:45', '2026-08-07 01:55:45'),
(10, 10, 0.00, '2026-08-07 01:55:46', '2026-08-07 01:55:46'),
(11, 11, 0.00, '2026-08-07 01:55:46', '2026-08-07 01:55:46'),
(12, 12, 0.00, '2026-08-07 01:55:47', '2026-08-07 01:55:47'),
(13, 13, 0.00, '2026-08-07 01:55:48', '2026-08-07 01:55:48'),
(14, 14, 0.00, '2026-08-07 01:55:50', '2026-08-07 01:55:50'),
(15, 15, 0.00, '2026-08-07 01:55:50', '2026-08-07 01:55:50'),
(16, 16, 0.00, '2026-08-07 01:55:52', '2026-08-07 01:55:52'),
(17, 17, 0.00, '2026-08-07 01:55:53', '2026-08-07 01:55:53'),
(18, 18, 0.00, '2026-08-07 01:55:54', '2026-08-07 01:55:54'),
(19, 19, 0.00, '2026-08-07 01:55:55', '2026-08-07 01:55:55'),
(20, 20, 0.00, '2026-08-07 01:55:56', '2026-08-07 01:55:56'),
(21, 21, 0.00, '2026-08-07 01:55:57', '2026-08-07 01:55:57'),
(22, 22, 0.00, '2026-08-07 01:55:58', '2026-08-07 01:55:58'),
(23, 23, 0.00, '2026-08-07 01:55:59', '2026-08-07 01:55:59'),
(24, 24, 0.00, '2026-08-07 01:56:00', '2026-08-07 01:56:00'),
(25, 25, 0.00, '2026-08-07 01:56:01', '2026-08-07 01:56:01'),
(26, 26, 0.00, '2026-08-07 01:56:02', '2026-08-07 01:56:02'),
(27, 27, 0.00, '2026-08-07 01:56:03', '2026-08-07 01:56:03'),
(28, 28, 0.00, '2026-08-07 01:56:04', '2026-08-07 01:56:04'),
(29, 29, 0.00, '2026-08-07 01:56:05', '2026-08-07 01:56:05'),
(30, 30, 0.00, '2026-08-07 01:56:06', '2026-08-07 01:56:06'),
(31, 31, 0.00, '2026-08-07 01:56:07', '2026-08-07 01:56:07'),
(32, 32, 0.00, '2026-08-07 01:56:08', '2026-08-07 01:56:08'),
(33, 33, 0.00, '2026-08-07 01:56:09', '2026-08-07 01:56:09'),
(34, 34, 0.00, '2026-08-07 01:56:10', '2026-08-07 01:56:10'),
(35, 35, 0.00, '2026-08-07 01:56:12', '2026-08-07 01:56:12'),
(36, 36, 0.00, '2026-08-07 01:56:14', '2026-08-07 01:56:14'),
(37, 37, 0.00, '2026-08-07 01:56:15', '2026-08-07 01:56:15'),
(38, 38, 0.00, '2026-08-07 01:56:16', '2026-08-07 01:56:16'),
(39, 39, 0.00, '2026-08-07 01:56:17', '2026-08-07 01:56:17'),
(40, 40, 0.00, '2026-08-07 01:56:19', '2026-08-07 01:56:19'),
(41, 41, 0.00, '2026-08-07 01:56:20', '2026-08-07 01:56:20'),
(42, 42, 0.00, '2026-08-07 01:56:21', '2026-08-07 01:56:21'),
(43, 43, 0.00, '2026-08-07 01:56:22', '2026-08-07 01:56:22'),
(44, 44, 0.00, '2026-08-07 01:56:23', '2026-08-07 01:56:23'),
(45, 45, 0.00, '2026-08-07 01:56:24', '2026-08-07 01:56:24'),
(46, 46, 0.00, '2026-08-07 01:56:25', '2026-08-07 01:56:25'),
(47, 47, 0.00, '2026-08-07 01:56:25', '2026-08-07 01:56:25'),
(48, 48, 0.00, '2026-08-07 01:56:26', '2026-08-07 01:56:26'),
(49, 49, 0.00, '2026-08-07 01:56:27', '2026-08-07 01:56:27'),
(50, 50, 0.00, '2026-08-07 01:56:28', '2026-08-07 01:56:28'),
(51, 51, 0.00, '2026-08-07 01:56:29', '2026-08-07 01:56:29'),
(52, 52, 0.00, '2026-08-07 01:56:30', '2026-08-07 01:56:30'),
(53, 53, 0.00, '2026-08-07 01:56:31', '2026-08-07 01:56:31'),
(54, 54, 0.00, '2026-08-07 01:56:32', '2026-08-07 01:56:32'),
(55, 55, 0.00, '2026-08-07 01:56:33', '2026-08-07 01:56:33'),
(56, 56, 0.00, '2026-08-07 01:56:34', '2026-08-07 01:56:34'),
(57, 57, 0.00, '2026-08-07 01:56:34', '2026-08-07 01:56:34'),
(58, 58, 0.00, '2026-08-07 01:56:35', '2026-08-07 01:56:35'),
(59, 59, 0.00, '2026-08-07 01:56:36', '2026-08-07 01:56:36'),
(60, 60, 0.00, '2026-08-07 01:56:37', '2026-08-07 01:56:37'),
(61, 61, 0.00, '2026-08-07 01:56:38', '2026-08-07 01:56:38'),
(62, 62, 0.00, '2026-08-07 01:56:39', '2026-08-07 01:56:39'),
(63, 63, 0.00, '2026-08-07 01:56:40', '2026-08-07 01:56:40'),
(64, 64, 0.00, '2026-08-07 01:56:41', '2026-08-07 01:56:41'),
(65, 65, 0.00, '2026-08-07 01:56:42', '2026-08-07 01:56:42'),
(66, 66, 0.00, '2026-08-07 01:56:43', '2026-08-07 01:56:43'),
(67, 67, 0.00, '2026-08-07 01:56:44', '2026-08-07 01:56:44'),
(68, 68, 0.00, '2026-08-07 01:56:45', '2026-08-07 01:56:45'),
(69, 69, 0.00, '2026-08-07 01:56:46', '2026-08-07 01:56:46'),
(70, 70, 0.00, '2026-08-07 01:56:47', '2026-08-07 01:56:47'),
(71, 71, 0.00, '2026-08-07 01:56:48', '2026-08-07 01:56:48'),
(72, 72, 0.00, '2026-08-07 01:56:48', '2026-08-07 01:56:48'),
(73, 73, 0.00, '2026-08-07 01:56:49', '2026-08-07 01:56:49'),
(74, 74, 0.00, '2026-08-07 01:56:50', '2026-08-07 01:56:50'),
(75, 75, 0.00, '2026-08-07 01:56:50', '2026-08-07 01:56:50'),
(76, 76, 0.00, '2026-08-07 01:56:51', '2026-08-07 01:56:51'),
(77, 77, 0.00, '2026-08-07 01:56:52', '2026-08-07 01:56:52'),
(78, 78, 0.00, '2026-08-07 01:56:53', '2026-08-07 01:56:53'),
(79, 79, 0.00, '2026-08-07 01:56:54', '2026-08-07 01:56:54'),
(80, 80, 0.00, '2026-08-07 01:56:54', '2026-08-07 01:56:54'),
(81, 81, 0.00, '2026-08-07 01:56:55', '2026-08-07 01:56:55'),
(82, 82, 0.00, '2026-08-07 01:56:56', '2026-08-07 01:56:56'),
(83, 83, 0.00, '2026-08-07 01:56:57', '2026-08-07 01:56:57'),
(84, 84, 0.00, '2026-08-07 01:56:58', '2026-08-07 01:56:58'),
(85, 85, 0.00, '2026-08-07 01:56:59', '2026-08-07 01:56:59'),
(86, 86, 0.00, '2026-08-07 01:56:59', '2026-08-07 01:56:59'),
(87, 87, 0.00, '2026-08-07 01:57:00', '2026-08-07 01:57:00'),
(88, 88, 0.00, '2026-08-07 01:57:01', '2026-08-07 01:57:01'),
(89, 89, 0.00, '2026-08-07 01:57:02', '2026-08-07 01:57:02'),
(90, 90, 0.00, '2026-08-07 01:57:03', '2026-08-07 01:57:03'),
(91, 91, 0.00, '2026-08-07 01:57:03', '2026-08-07 01:57:03'),
(92, 92, 0.00, '2026-08-07 01:57:04', '2026-08-07 01:57:04'),
(93, 93, 0.00, '2026-08-07 01:57:05', '2026-08-07 01:57:05'),
(94, 94, 0.00, '2026-08-07 01:57:06', '2026-08-07 01:57:06'),
(95, 95, 0.00, '2026-08-07 01:57:07', '2026-08-07 01:57:07'),
(96, 96, 0.00, '2026-08-07 01:57:08', '2026-08-07 01:57:08'),
(97, 97, 0.00, '2026-08-07 01:57:08', '2026-08-07 01:57:08'),
(98, 98, 0.00, '2026-08-07 01:57:09', '2026-08-07 01:57:09'),
(99, 99, 0.00, '2026-08-07 01:57:10', '2026-08-07 01:57:10'),
(100, 100, 0.00, '2026-08-07 01:57:11', '2026-08-07 01:57:11'),
(101, 101, 0.00, '2026-08-07 01:57:12', '2026-08-07 01:57:12'),
(102, 102, 0.00, '2026-08-07 01:57:13', '2026-08-07 01:57:13'),
(103, 103, 0.00, '2026-08-07 01:57:14', '2026-08-07 01:57:14'),
(104, 104, 0.00, '2026-08-07 01:57:14', '2026-08-07 01:57:14'),
(105, 105, 0.00, '2026-08-07 01:57:15', '2026-08-07 01:57:15'),
(106, 106, 0.00, '2026-08-07 01:57:16', '2026-08-07 01:57:16'),
(107, 107, 0.00, '2026-08-07 01:57:17', '2026-08-07 01:57:17'),
(108, 108, 0.00, '2026-08-07 01:57:18', '2026-08-07 01:57:18'),
(109, 109, 0.00, '2026-08-07 01:57:19', '2026-08-07 01:57:19'),
(110, 110, 0.00, '2026-08-07 01:57:20', '2026-08-07 01:57:20'),
(111, 111, 0.00, '2026-08-07 01:57:21', '2026-08-07 01:57:21'),
(112, 112, 0.00, '2026-08-07 01:57:22', '2026-08-07 01:57:22'),
(113, 113, 0.00, '2026-08-07 01:57:22', '2026-08-07 01:57:22'),
(114, 114, 0.00, '2026-08-07 01:57:23', '2026-08-07 01:57:23'),
(115, 115, 0.00, '2026-08-07 01:57:25', '2026-08-07 01:57:25'),
(116, 116, 0.00, '2026-08-07 01:57:26', '2026-08-07 01:57:26'),
(117, 117, 0.00, '2026-08-07 01:57:27', '2026-08-07 01:57:27'),
(118, 118, 0.00, '2026-08-07 01:57:27', '2026-08-07 01:57:27'),
(119, 119, 0.00, '2026-08-07 01:57:28', '2026-08-07 01:57:28'),
(120, 120, 0.00, '2026-08-07 01:57:30', '2026-08-07 01:57:30'),
(121, 121, 0.00, '2026-08-07 01:57:31', '2026-08-07 01:57:31'),
(122, 122, 0.00, '2026-08-07 01:57:32', '2026-08-07 01:57:32'),
(123, 123, 0.00, '2026-08-07 01:57:33', '2026-08-07 01:57:33'),
(124, 124, 0.00, '2026-08-07 01:57:34', '2026-08-07 01:57:34'),
(125, 125, 0.00, '2026-08-07 01:57:35', '2026-08-07 01:57:35'),
(126, 126, 0.00, '2026-08-07 01:57:36', '2026-08-07 01:57:36'),
(127, 127, 0.00, '2026-08-07 01:57:37', '2026-08-07 01:57:37'),
(128, 128, 0.00, '2026-08-07 01:57:38', '2026-08-07 01:57:38'),
(129, 129, 0.00, '2026-08-07 01:57:38', '2026-08-07 01:57:38'),
(130, 130, 0.00, '2026-08-07 01:57:39', '2026-08-07 01:57:39'),
(131, 131, 0.00, '2026-08-07 01:57:40', '2026-08-07 01:57:40'),
(132, 132, 0.00, '2026-08-07 01:57:41', '2026-08-07 01:57:41'),
(133, 133, 0.00, '2026-08-07 01:57:42', '2026-08-07 01:57:42'),
(134, 134, 0.00, '2026-08-07 01:57:44', '2026-08-07 01:57:44'),
(135, 135, 0.00, '2026-08-07 01:57:47', '2026-08-07 01:57:47'),
(136, 136, 0.00, '2026-08-07 01:57:48', '2026-08-07 01:57:48'),
(137, 137, 0.00, '2026-08-07 01:57:49', '2026-08-07 01:57:49'),
(138, 138, 0.00, '2026-08-07 01:57:50', '2026-08-07 01:57:50'),
(139, 139, 0.00, '2026-08-07 01:57:50', '2026-08-07 01:57:50'),
(140, 140, 0.00, '2026-08-07 01:57:51', '2026-08-07 01:57:51'),
(141, 141, 0.00, '2026-08-07 01:57:52', '2026-08-07 01:57:52'),
(142, 142, 0.00, '2026-08-07 01:57:53', '2026-08-07 01:57:53'),
(143, 143, 0.00, '2026-08-07 01:57:54', '2026-08-07 01:57:54'),
(144, 144, 0.00, '2026-08-07 01:57:55', '2026-08-07 01:57:55'),
(145, 145, 0.00, '2026-08-07 01:57:56', '2026-08-07 01:57:56'),
(146, 146, 0.00, '2026-08-07 01:57:57', '2026-08-07 01:57:57'),
(147, 147, 0.00, '2026-08-07 01:57:57', '2026-08-07 01:57:57'),
(148, 148, 0.00, '2026-08-07 01:57:58', '2026-08-07 01:57:58'),
(149, 149, 0.00, '2026-08-07 01:57:59', '2026-08-07 01:57:59'),
(150, 150, 0.00, '2026-08-07 01:58:00', '2026-08-07 01:58:00'),
(151, 151, 0.00, '2026-08-07 01:58:01', '2026-08-07 01:58:01'),
(152, 152, 0.00, '2026-08-07 01:58:02', '2026-08-07 01:58:02'),
(153, 153, 0.00, '2026-08-07 01:58:03', '2026-08-07 01:58:03'),
(154, 154, 0.00, '2026-08-07 01:58:04', '2026-08-07 01:58:04'),
(155, 155, 0.00, '2026-08-07 01:58:05', '2026-08-07 01:58:05'),
(156, 156, 0.00, '2026-08-07 01:58:06', '2026-08-07 01:58:06'),
(157, 157, 0.00, '2026-08-07 01:58:06', '2026-08-07 01:58:06'),
(158, 158, 0.00, '2026-08-07 01:58:07', '2026-08-07 01:58:07'),
(159, 159, 0.00, '2026-08-07 01:58:08', '2026-08-07 01:58:08'),
(160, 160, 0.00, '2026-08-07 01:58:09', '2026-08-07 01:58:09'),
(161, 161, 0.00, '2026-08-07 01:58:10', '2026-08-07 01:58:10'),
(162, 162, 0.00, '2026-08-07 01:58:11', '2026-08-07 01:58:11'),
(163, 163, 0.00, '2026-08-07 01:58:12', '2026-08-07 01:58:12'),
(164, 164, 0.00, '2026-08-07 01:58:13', '2026-08-07 01:58:13'),
(165, 165, 0.00, '2026-08-07 01:58:13', '2026-08-07 01:58:13'),
(166, 166, 0.00, '2026-08-07 01:58:14', '2026-08-07 01:58:14'),
(167, 167, 0.00, '2026-08-07 01:58:15', '2026-08-07 01:58:15'),
(168, 168, 0.00, '2026-08-07 01:58:16', '2026-08-07 01:58:16'),
(169, 169, 0.00, '2026-08-07 01:58:17', '2026-08-07 01:58:17'),
(170, 170, 0.00, '2026-08-07 01:58:18', '2026-08-07 01:58:18'),
(171, 171, 0.00, '2026-08-07 01:58:19', '2026-08-07 01:58:19'),
(172, 172, 0.00, '2026-08-07 01:58:20', '2026-08-07 01:58:20'),
(173, 173, 0.00, '2026-08-07 01:58:20', '2026-08-07 01:58:20'),
(174, 174, 0.00, '2026-08-07 01:58:21', '2026-08-07 01:58:21'),
(175, 175, 0.00, '2026-08-07 01:58:22', '2026-08-07 01:58:22'),
(176, 176, 0.00, '2026-08-07 01:58:23', '2026-08-07 01:58:23'),
(177, 177, 0.00, '2026-08-07 01:58:24', '2026-08-07 01:58:24'),
(178, 178, 0.00, '2026-08-07 01:58:25', '2026-08-07 01:58:25'),
(179, 179, 0.00, '2026-08-07 01:58:26', '2026-08-07 01:58:26'),
(180, 180, 0.00, '2026-08-07 01:58:27', '2026-08-07 01:58:27'),
(181, 181, 0.00, '2026-08-07 01:58:29', '2026-08-07 01:58:29'),
(182, 182, 0.00, '2026-08-07 01:58:30', '2026-08-07 01:58:30'),
(183, 183, 0.00, '2026-08-07 01:58:30', '2026-08-07 01:58:30'),
(184, 184, 0.00, '2026-08-07 01:58:31', '2026-08-07 01:58:31'),
(185, 185, 0.00, '2026-08-07 01:58:32', '2026-08-07 01:58:32'),
(186, 186, 0.00, '2026-08-07 01:58:33', '2026-08-07 01:58:33'),
(187, 187, 0.00, '2026-08-07 01:58:35', '2026-08-07 01:58:35'),
(188, 188, 0.00, '2026-08-07 01:58:36', '2026-08-07 01:58:36'),
(189, 189, 0.00, '2026-08-07 01:58:37', '2026-08-07 01:58:37'),
(190, 190, 0.00, '2026-08-07 01:58:38', '2026-08-07 01:58:38'),
(191, 191, 0.00, '2026-08-07 01:58:39', '2026-08-07 01:58:39'),
(192, 192, 0.00, '2026-08-07 01:58:40', '2026-08-07 01:58:40'),
(193, 193, 0.00, '2026-08-07 01:58:41', '2026-08-07 01:58:41'),
(194, 194, 0.00, '2026-08-07 01:58:42', '2026-08-07 01:58:42'),
(195, 195, 0.00, '2026-08-07 01:58:43', '2026-08-07 01:58:43'),
(196, 196, 0.00, '2026-08-07 01:58:44', '2026-08-07 01:58:44'),
(197, 197, 0.00, '2026-08-07 01:58:45', '2026-08-07 01:58:45'),
(198, 198, 0.00, '2026-08-07 01:58:46', '2026-08-07 01:58:46'),
(199, 199, 0.00, '2026-08-07 01:58:47', '2026-08-07 01:58:47'),
(200, 200, 0.00, '2026-08-07 01:58:47', '2026-08-07 01:58:47'),
(201, 201, 0.00, '2026-08-07 01:58:48', '2026-08-07 01:58:48'),
(202, 202, 0.00, '2026-08-07 01:58:49', '2026-08-07 01:58:49'),
(203, 203, 0.00, '2026-08-07 01:58:50', '2026-08-07 01:58:50'),
(204, 204, 0.00, '2026-08-07 01:58:51', '2026-08-07 01:58:51'),
(205, 205, 0.00, '2026-08-07 01:58:52', '2026-08-07 01:58:52'),
(206, 206, 0.00, '2026-08-07 01:58:53', '2026-08-07 01:58:53'),
(207, 207, 0.00, '2026-08-07 01:58:54', '2026-08-07 01:58:54'),
(208, 208, 0.00, '2026-08-07 01:58:55', '2026-08-07 01:58:55'),
(209, 209, 0.00, '2026-08-07 01:58:56', '2026-08-07 01:58:56'),
(210, 210, 0.00, '2026-08-07 01:58:57', '2026-08-07 01:58:57'),
(211, 211, 0.00, '2026-08-07 01:58:57', '2026-08-07 01:58:57'),
(212, 212, 0.00, '2026-08-07 01:58:58', '2026-08-07 01:58:58'),
(213, 213, 0.00, '2026-08-07 01:58:59', '2026-08-07 01:58:59'),
(214, 214, 0.00, '2026-08-07 01:59:00', '2026-08-07 01:59:00'),
(215, 215, 0.00, '2026-08-07 01:59:01', '2026-08-07 01:59:01'),
(216, 216, 0.00, '2026-08-07 01:59:01', '2026-08-07 01:59:01'),
(217, 217, 0.00, '2026-08-07 01:59:02', '2026-08-07 01:59:02'),
(218, 218, 0.00, '2026-08-07 01:59:03', '2026-08-07 01:59:03'),
(219, 219, 0.00, '2026-08-07 01:59:05', '2026-08-07 01:59:05'),
(220, 220, 0.00, '2026-08-07 01:59:05', '2026-08-07 01:59:05'),
(221, 221, 0.00, '2026-08-07 01:59:06', '2026-08-07 01:59:06'),
(222, 222, 0.00, '2026-08-07 01:59:07', '2026-08-07 01:59:07'),
(223, 223, 0.00, '2026-08-07 01:59:09', '2026-08-07 01:59:09'),
(224, 224, 0.00, '2026-08-07 01:59:10', '2026-08-07 01:59:10'),
(225, 225, 0.00, '2026-08-07 01:59:11', '2026-08-07 01:59:11'),
(226, 226, 0.00, '2026-08-07 01:59:13', '2026-08-07 01:59:13'),
(227, 227, 0.00, '2026-08-07 01:59:13', '2026-08-07 01:59:13'),
(228, 228, 0.00, '2026-08-07 01:59:14', '2026-08-07 01:59:14'),
(229, 229, 0.00, '2026-08-07 01:59:16', '2026-08-07 01:59:16'),
(230, 230, 0.00, '2026-08-07 01:59:19', '2026-08-07 01:59:19'),
(231, 231, 0.00, '2026-08-07 01:59:20', '2026-08-07 01:59:20'),
(232, 232, 0.00, '2026-08-07 01:59:21', '2026-08-07 01:59:21'),
(233, 233, 0.00, '2026-08-07 01:59:22', '2026-08-07 01:59:22'),
(234, 234, 0.00, '2026-08-07 01:59:23', '2026-08-07 01:59:23'),
(235, 235, 0.00, '2026-08-07 01:59:24', '2026-08-07 01:59:24'),
(236, 236, 0.00, '2026-08-07 01:59:25', '2026-08-07 01:59:25'),
(237, 237, 0.00, '2026-08-07 01:59:26', '2026-08-07 01:59:26'),
(238, 238, 0.00, '2026-08-07 01:59:26', '2026-08-07 01:59:26'),
(239, 239, 0.00, '2026-08-07 01:59:27', '2026-08-07 01:59:27'),
(240, 240, 0.00, '2026-08-07 01:59:28', '2026-08-07 01:59:28'),
(241, 241, 0.00, '2026-08-07 01:59:29', '2026-08-07 01:59:29'),
(242, 242, 0.00, '2026-08-07 01:59:30', '2026-08-07 01:59:30'),
(243, 243, 0.00, '2026-08-07 01:59:31', '2026-08-07 01:59:31'),
(244, 244, 0.00, '2026-08-07 01:59:32', '2026-08-07 01:59:32'),
(245, 245, 0.00, '2026-08-07 01:59:34', '2026-08-07 01:59:34'),
(246, 246, 0.00, '2026-08-07 01:59:35', '2026-08-07 01:59:35'),
(247, 247, 0.00, '2026-08-07 01:59:36', '2026-08-07 01:59:36'),
(248, 248, 0.00, '2026-08-07 01:59:37', '2026-08-07 01:59:37'),
(249, 249, 0.00, '2026-08-07 01:59:38', '2026-08-07 01:59:38'),
(250, 250, 0.00, '2026-08-07 01:59:39', '2026-08-07 01:59:39'),
(251, 251, 0.00, '2026-08-07 01:59:40', '2026-08-07 01:59:40'),
(252, 252, 0.00, '2026-08-07 01:59:41', '2026-08-07 01:59:41'),
(253, 253, 0.00, '2026-08-07 01:59:42', '2026-08-07 01:59:42'),
(254, 254, 0.00, '2026-08-07 01:59:43', '2026-08-07 01:59:43'),
(255, 255, 0.00, '2026-08-07 01:59:44', '2026-08-07 01:59:44'),
(256, 256, 0.00, '2026-08-07 01:59:45', '2026-08-07 01:59:45'),
(257, 257, 0.00, '2026-08-07 01:59:46', '2026-08-07 01:59:46'),
(258, 258, 0.00, '2026-08-07 01:59:47', '2026-08-07 01:59:47'),
(259, 259, 0.00, '2026-08-07 01:59:48', '2026-08-07 01:59:48'),
(260, 260, 0.00, '2026-08-07 01:59:49', '2026-08-07 01:59:49'),
(261, 261, 0.00, '2026-08-07 01:59:50', '2026-08-07 01:59:50'),
(262, 262, 0.00, '2026-08-07 01:59:51', '2026-08-07 01:59:51'),
(263, 263, 0.00, '2026-08-07 01:59:52', '2026-08-07 01:59:52'),
(264, 264, 0.00, '2026-08-07 01:59:52', '2026-08-07 01:59:52'),
(265, 265, 0.00, '2026-08-07 01:59:53', '2026-08-07 01:59:53'),
(266, 266, 0.00, '2026-08-07 01:59:54', '2026-08-07 01:59:54'),
(267, 267, 0.00, '2026-08-07 01:59:55', '2026-08-07 01:59:55'),
(268, 268, 0.00, '2026-08-07 01:59:56', '2026-08-07 01:59:56'),
(269, 269, 0.00, '2026-08-07 01:59:57', '2026-08-07 01:59:57'),
(270, 270, 0.00, '2026-08-07 01:59:57', '2026-08-07 01:59:57'),
(271, 271, 0.00, '2026-08-07 01:59:58', '2026-08-07 01:59:58'),
(272, 272, 0.00, '2026-08-07 01:59:59', '2026-08-07 01:59:59'),
(273, 273, 0.00, '2026-08-07 01:59:59', '2026-08-07 01:59:59'),
(274, 274, 0.00, '2026-08-07 02:00:00', '2026-08-07 02:00:00'),
(275, 275, 0.00, '2026-08-07 02:00:01', '2026-08-07 02:00:01'),
(276, 276, 0.00, '2026-08-07 02:00:02', '2026-08-07 02:00:02'),
(277, 277, 0.00, '2026-08-07 02:00:02', '2026-08-07 02:00:02'),
(278, 278, 0.00, '2026-08-07 02:00:03', '2026-08-07 02:00:03'),
(279, 279, 0.00, '2026-08-07 02:00:04', '2026-08-07 02:00:04'),
(280, 280, 0.00, '2026-08-07 02:00:05', '2026-08-07 02:00:05'),
(281, 281, 0.00, '2026-08-07 02:00:05', '2026-08-07 02:00:05'),
(282, 282, 0.00, '2026-08-07 02:00:06', '2026-08-07 02:00:06'),
(283, 283, 0.00, '2026-08-07 02:00:07', '2026-08-07 02:00:07'),
(284, 284, 0.00, '2026-08-07 02:00:07', '2026-08-07 02:00:07'),
(285, 285, 0.00, '2026-08-07 02:00:08', '2026-08-07 02:00:08'),
(286, 286, 0.00, '2026-08-07 02:00:09', '2026-08-07 02:00:09'),
(287, 287, 0.00, '2026-08-07 02:00:10', '2026-08-07 02:00:10'),
(288, 288, 0.00, '2026-08-07 02:00:11', '2026-08-07 02:00:11'),
(289, 289, 0.00, '2026-08-07 02:00:11', '2026-08-07 02:00:11'),
(290, 290, 0.00, '2026-08-07 02:00:12', '2026-08-07 02:00:12'),
(291, 291, 0.00, '2026-08-07 02:00:13', '2026-08-07 02:00:13'),
(292, 292, 0.00, '2026-08-07 02:00:13', '2026-08-07 02:00:13'),
(293, 293, 0.00, '2026-08-07 02:00:14', '2026-08-07 02:00:14'),
(294, 294, 0.00, '2026-08-07 02:00:15', '2026-08-07 02:00:15'),
(295, 295, 0.00, '2026-08-07 02:00:16', '2026-08-07 02:00:16'),
(296, 296, 0.00, '2026-08-07 02:00:17', '2026-08-07 02:00:17'),
(297, 297, 0.00, '2026-08-07 02:00:17', '2026-08-07 02:00:17'),
(298, 298, 0.00, '2026-08-07 02:00:18', '2026-08-07 02:00:18'),
(299, 299, 0.00, '2026-08-07 02:00:19', '2026-08-07 02:00:19'),
(300, 300, 0.00, '2026-08-07 02:00:20', '2026-08-07 02:00:20'),
(301, 301, 0.00, '2026-08-07 02:00:21', '2026-08-07 02:00:21'),
(302, 302, 0.00, '2026-08-07 02:00:22', '2026-08-07 02:00:22'),
(303, 303, 0.00, '2026-08-07 02:00:23', '2026-08-07 02:00:23'),
(304, 304, 0.00, '2026-08-07 02:00:24', '2026-08-07 02:00:24'),
(305, 305, 0.00, '2026-08-07 02:00:26', '2026-08-07 02:00:26'),
(306, 306, 0.00, '2026-08-07 02:00:28', '2026-08-07 02:00:28'),
(307, 307, 0.00, '2026-08-07 02:00:29', '2026-08-07 02:00:29'),
(308, 308, 0.00, '2026-08-07 02:00:30', '2026-08-07 02:00:30'),
(309, 309, 0.00, '2026-08-07 02:00:32', '2026-08-07 02:00:32'),
(310, 310, 0.00, '2026-08-07 02:00:33', '2026-08-07 02:00:33'),
(311, 311, 0.00, '2026-08-07 02:00:34', '2026-08-07 02:00:34'),
(312, 312, 0.00, '2026-08-07 02:00:35', '2026-08-07 02:00:35'),
(313, 313, 0.00, '2026-08-07 02:00:36', '2026-08-07 02:00:36'),
(314, 314, 0.00, '2026-08-07 02:00:37', '2026-08-07 02:00:37'),
(315, 315, 0.00, '2026-08-07 02:00:38', '2026-08-07 02:00:38'),
(316, 316, 0.00, '2026-08-07 02:00:39', '2026-08-07 02:00:39'),
(317, 317, 0.00, '2026-08-07 02:00:41', '2026-08-07 02:00:41'),
(318, 318, 0.00, '2026-08-07 02:00:42', '2026-08-07 02:00:42'),
(319, 319, 0.00, '2026-08-07 02:00:43', '2026-08-07 02:00:43'),
(320, 320, 0.00, '2026-08-07 02:00:44', '2026-08-07 02:00:44'),
(321, 321, 0.00, '2026-08-07 02:00:45', '2026-08-07 02:00:45'),
(322, 322, 0.00, '2026-08-07 02:00:45', '2026-08-07 02:00:45'),
(323, 323, 0.00, '2026-08-07 02:00:47', '2026-08-07 02:00:47'),
(324, 324, 0.00, '2026-08-07 02:00:48', '2026-08-07 02:00:48'),
(325, 325, 0.00, '2026-08-07 02:00:48', '2026-08-07 02:00:48'),
(326, 326, 0.00, '2026-08-07 02:00:49', '2026-08-07 02:00:49'),
(327, 327, 0.00, '2026-08-07 02:00:50', '2026-08-07 02:00:50'),
(328, 328, 0.00, '2026-08-07 02:00:51', '2026-08-07 02:00:51'),
(329, 329, 0.00, '2026-08-07 02:00:52', '2026-08-07 02:00:52'),
(330, 330, 0.00, '2026-08-07 02:00:53', '2026-08-07 02:00:53'),
(331, 331, 0.00, '2026-08-07 02:00:54', '2026-08-07 02:00:54'),
(332, 332, 0.00, '2026-08-07 02:00:55', '2026-08-07 02:00:55'),
(333, 333, 0.00, '2026-08-07 02:00:55', '2026-08-07 02:00:55'),
(334, 334, 0.00, '2026-08-07 02:00:57', '2026-08-07 02:00:57'),
(335, 335, 0.00, '2026-08-07 02:00:57', '2026-08-07 02:00:57'),
(336, 336, 0.00, '2026-08-07 02:00:59', '2026-08-07 02:00:59'),
(337, 337, 0.00, '2026-08-07 02:01:00', '2026-08-07 02:01:00'),
(338, 338, 0.00, '2026-08-07 02:01:01', '2026-08-07 02:01:01'),
(339, 339, 0.00, '2026-08-07 02:01:02', '2026-08-07 02:01:02'),
(340, 340, 0.00, '2026-08-07 02:01:03', '2026-08-07 02:01:03'),
(341, 341, 0.00, '2026-08-07 02:01:04', '2026-08-07 02:01:04'),
(342, 342, 0.00, '2026-08-07 02:01:05', '2026-08-07 02:01:05'),
(343, 343, 0.00, '2026-08-07 02:01:06', '2026-08-07 02:01:06'),
(344, 344, 0.00, '2026-08-07 02:01:07', '2026-08-07 02:01:07'),
(345, 345, 0.00, '2026-08-07 02:01:07', '2026-08-07 02:01:07'),
(346, 346, 0.00, '2026-08-07 02:01:08', '2026-08-07 02:01:08'),
(347, 347, 0.00, '2026-08-07 02:01:09', '2026-08-07 02:01:09'),
(348, 348, 0.00, '2026-08-07 02:01:10', '2026-08-07 02:01:10'),
(349, 349, 0.00, '2026-08-07 02:01:11', '2026-08-07 02:01:11'),
(350, 350, 0.00, '2026-08-07 02:01:12', '2026-08-07 02:01:12'),
(351, 351, 0.00, '2026-08-07 02:01:13', '2026-08-07 02:01:13'),
(352, 352, 0.00, '2026-08-07 02:01:14', '2026-08-07 02:01:14'),
(353, 353, 0.00, '2026-08-07 02:01:15', '2026-08-07 02:01:15'),
(354, 354, 0.00, '2026-08-07 02:01:15', '2026-08-07 02:01:15'),
(355, 355, 0.00, '2026-08-07 02:01:17', '2026-08-07 02:01:17'),
(356, 356, 0.00, '2026-08-07 02:01:17', '2026-08-07 02:01:17'),
(357, 357, 0.00, '2026-08-07 02:01:18', '2026-08-07 02:01:18'),
(358, 358, 0.00, '2026-08-07 02:01:19', '2026-08-07 02:01:19'),
(359, 359, 0.00, '2026-08-07 02:01:20', '2026-08-07 02:01:20'),
(360, 360, 0.00, '2026-08-07 02:01:21', '2026-08-07 02:01:21'),
(361, 361, 0.00, '2026-08-07 02:01:22', '2026-08-07 02:01:22'),
(362, 362, 0.00, '2026-08-07 02:01:22', '2026-08-07 02:01:22'),
(363, 363, 0.00, '2026-08-07 02:01:24', '2026-08-07 02:01:24'),
(364, 364, 0.00, '2026-08-07 02:01:25', '2026-08-07 02:01:25'),
(365, 365, 0.00, '2026-08-07 02:01:25', '2026-08-07 02:01:25'),
(366, 366, 0.00, '2026-08-07 02:01:27', '2026-08-07 02:01:27'),
(367, 367, 0.00, '2026-08-07 02:01:27', '2026-08-07 02:01:27'),
(368, 368, 0.00, '2026-08-07 02:01:28', '2026-08-07 02:01:28'),
(369, 369, 0.00, '2026-08-07 02:01:29', '2026-08-07 02:01:29'),
(370, 370, 0.00, '2026-08-07 02:01:30', '2026-08-07 02:01:30'),
(371, 371, 0.00, '2026-08-07 02:01:31', '2026-08-07 02:01:31'),
(372, 372, 0.00, '2026-08-07 02:01:33', '2026-08-07 02:01:33'),
(373, 373, 0.00, '2026-08-07 02:01:34', '2026-08-07 02:01:34'),
(374, 374, 0.00, '2026-08-07 02:01:35', '2026-08-07 02:01:35'),
(375, 375, 0.00, '2026-08-07 02:01:36', '2026-08-07 02:01:36'),
(376, 376, 0.00, '2026-08-07 02:01:37', '2026-08-07 02:01:37'),
(377, 377, 0.00, '2026-08-07 02:01:38', '2026-08-07 02:01:38'),
(378, 378, 0.00, '2026-08-07 02:01:39', '2026-08-07 02:01:39'),
(379, 379, 0.00, '2026-08-07 02:01:40', '2026-08-07 02:01:40'),
(380, 380, 0.00, '2026-08-07 02:01:41', '2026-08-07 02:01:41'),
(381, 381, 0.00, '2026-08-07 02:01:42', '2026-08-07 02:01:42'),
(382, 382, 0.00, '2026-08-07 02:01:43', '2026-08-07 02:01:43'),
(383, 383, 0.00, '2026-08-07 02:01:44', '2026-08-07 02:01:44'),
(384, 384, 0.00, '2026-08-07 02:01:47', '2026-08-07 02:01:47'),
(385, 385, 0.00, '2026-08-07 02:01:52', '2026-08-07 02:01:52'),
(386, 386, 0.00, '2026-08-07 02:01:55', '2026-08-07 02:01:55'),
(387, 387, 0.00, '2026-08-07 02:01:56', '2026-08-07 02:01:56'),
(388, 388, 0.00, '2026-08-07 02:02:00', '2026-08-07 02:02:00'),
(389, 389, 0.00, '2026-08-07 02:02:01', '2026-08-07 02:02:01'),
(390, 390, 0.00, '2026-08-07 02:02:02', '2026-08-07 02:02:02'),
(391, 391, 0.00, '2026-08-07 02:02:03', '2026-08-07 02:02:03'),
(392, 392, 0.00, '2026-08-07 02:02:04', '2026-08-07 02:02:04'),
(393, 393, 0.00, '2026-08-07 02:02:06', '2026-08-07 02:02:06'),
(394, 394, 0.00, '2026-08-07 02:02:09', '2026-08-07 02:02:09'),
(395, 395, 0.00, '2026-08-07 02:02:10', '2026-08-07 02:02:10'),
(396, 396, 0.00, '2026-08-07 02:02:11', '2026-08-07 02:02:11'),
(397, 397, 0.00, '2026-08-07 02:02:12', '2026-08-07 02:02:12'),
(398, 398, 0.00, '2026-08-07 02:02:13', '2026-08-07 02:02:13'),
(399, 399, 0.00, '2026-08-07 02:02:14', '2026-08-07 02:02:14'),
(400, 400, 0.00, '2026-08-07 02:02:16', '2026-08-07 02:02:16'),
(401, 401, 0.00, '2026-08-07 02:02:17', '2026-08-07 02:02:17'),
(402, 402, 0.00, '2026-08-07 02:02:18', '2026-08-07 02:02:18'),
(403, 403, 0.00, '2026-08-07 02:02:19', '2026-08-07 02:02:19'),
(404, 404, 0.00, '2026-08-07 02:02:20', '2026-08-07 02:02:20'),
(405, 405, 0.00, '2026-08-07 02:02:21', '2026-08-07 02:02:21'),
(406, 406, 0.00, '2026-08-07 02:02:22', '2026-08-07 02:02:22'),
(407, 407, 0.00, '2026-08-07 02:02:23', '2026-08-07 02:02:23'),
(408, 408, 0.00, '2026-08-07 02:02:24', '2026-08-07 02:02:24'),
(409, 409, 0.00, '2026-08-07 02:02:25', '2026-08-07 02:02:25'),
(410, 410, 0.00, '2026-08-07 02:02:26', '2026-08-07 02:02:26'),
(411, 411, 0.00, '2026-08-07 02:02:27', '2026-08-07 02:02:27'),
(412, 412, 0.00, '2026-08-07 02:02:28', '2026-08-07 02:02:28'),
(413, 413, 0.00, '2026-08-07 02:02:29', '2026-08-07 02:02:29'),
(414, 414, 0.00, '2026-08-07 02:02:31', '2026-08-07 02:02:31'),
(415, 415, 0.00, '2026-08-07 02:02:32', '2026-08-07 02:02:32'),
(416, 416, 0.00, '2026-08-07 02:02:33', '2026-08-07 02:02:33'),
(417, 417, 0.00, '2026-08-07 02:02:35', '2026-08-07 02:02:35'),
(418, 418, 0.00, '2026-08-07 02:02:36', '2026-08-07 02:02:36'),
(419, 419, 0.00, '2026-08-07 02:02:37', '2026-08-07 02:02:37'),
(420, 420, 0.00, '2026-08-07 02:02:38', '2026-08-07 02:02:38'),
(421, 421, 0.00, '2026-08-07 02:02:39', '2026-08-07 02:02:39'),
(422, 422, 0.00, '2026-08-07 02:02:40', '2026-08-07 02:02:40'),
(423, 423, 0.00, '2026-08-07 02:02:43', '2026-08-07 02:02:43'),
(424, 424, 0.00, '2026-08-07 02:02:44', '2026-08-07 02:02:44'),
(425, 425, 0.00, '2026-08-07 02:02:45', '2026-08-07 02:02:45'),
(426, 426, 0.00, '2026-08-07 02:02:46', '2026-08-07 02:02:46'),
(427, 427, 0.00, '2026-08-07 02:02:47', '2026-08-07 02:02:47'),
(428, 428, 0.00, '2026-08-07 02:02:48', '2026-08-07 02:02:48'),
(429, 429, 0.00, '2026-08-07 02:02:49', '2026-08-07 02:02:49'),
(430, 430, 0.00, '2026-08-07 02:02:50', '2026-08-07 02:02:50'),
(431, 431, 0.00, '2026-08-07 02:02:52', '2026-08-07 02:02:52'),
(432, 432, 0.00, '2026-08-07 02:02:53', '2026-08-07 02:02:53'),
(433, 433, 0.00, '2026-08-07 02:02:54', '2026-08-07 02:02:54'),
(434, 434, 0.00, '2026-08-07 02:02:55', '2026-08-07 02:02:55'),
(435, 435, 0.00, '2026-08-07 02:02:56', '2026-08-07 02:02:56'),
(436, 436, 0.00, '2026-08-07 02:02:57', '2026-08-07 02:02:57'),
(437, 437, 0.00, '2026-08-07 02:02:58', '2026-08-07 02:02:58'),
(438, 438, 0.00, '2026-08-07 02:02:59', '2026-08-07 02:02:59'),
(439, 439, 0.00, '2026-08-07 02:03:01', '2026-08-07 02:03:01'),
(440, 440, 0.00, '2026-08-07 02:03:02', '2026-08-07 02:03:02'),
(441, 441, 0.00, '2026-08-07 02:03:06', '2026-08-07 02:03:06'),
(442, 442, 0.00, '2026-08-07 02:03:07', '2026-08-07 02:03:07'),
(443, 443, 0.00, '2026-08-07 02:03:08', '2026-08-07 02:03:08'),
(444, 444, 0.00, '2026-08-07 02:03:09', '2026-08-07 02:03:09'),
(445, 445, 0.00, '2026-08-07 02:03:10', '2026-08-07 02:03:10'),
(446, 446, 0.00, '2026-08-07 02:03:12', '2026-08-07 02:03:12'),
(447, 447, 0.00, '2026-08-07 02:03:13', '2026-08-07 02:03:13'),
(448, 448, 0.00, '2026-08-07 02:03:14', '2026-08-07 02:03:14'),
(449, 449, 0.00, '2026-08-07 02:03:15', '2026-08-07 02:03:15'),
(450, 450, 0.00, '2026-08-07 02:03:16', '2026-08-07 02:03:16'),
(451, 451, 0.00, '2026-08-07 02:03:17', '2026-08-07 02:03:17'),
(452, 452, 0.00, '2026-08-07 02:03:18', '2026-08-07 02:03:18'),
(453, 453, 0.00, '2026-08-07 02:03:19', '2026-08-07 02:03:19'),
(454, 454, 0.00, '2026-08-07 02:03:21', '2026-08-07 02:03:21'),
(455, 455, 0.00, '2026-08-07 02:03:22', '2026-08-07 02:03:22'),
(456, 456, 0.00, '2026-08-07 02:03:24', '2026-08-07 02:03:24'),
(457, 457, 0.00, '2026-08-07 02:03:28', '2026-08-07 02:03:28'),
(458, 458, 0.00, '2026-08-07 02:03:30', '2026-08-07 02:03:30'),
(459, 459, 0.00, '2026-08-07 02:03:30', '2026-08-07 02:03:30'),
(460, 460, 0.00, '2026-08-07 02:03:32', '2026-08-07 02:03:32'),
(461, 461, 0.00, '2026-08-07 02:03:34', '2026-08-07 02:03:34'),
(462, 462, 0.00, '2026-08-07 02:03:36', '2026-08-07 02:03:36'),
(463, 463, 0.00, '2026-08-07 02:03:37', '2026-08-07 02:03:37'),
(464, 464, 0.00, '2026-08-07 02:03:38', '2026-08-07 02:03:38'),
(465, 465, 0.00, '2026-08-07 02:03:39', '2026-08-07 02:03:39'),
(466, 466, 0.00, '2026-08-07 02:03:40', '2026-08-07 02:03:40'),
(467, 467, 0.00, '2026-08-07 02:03:41', '2026-08-07 02:03:41'),
(468, 468, 0.00, '2026-08-07 02:03:42', '2026-08-07 02:03:42'),
(469, 469, 0.00, '2026-08-07 02:03:43', '2026-08-07 02:03:43'),
(470, 470, 0.00, '2026-08-07 02:03:44', '2026-08-07 02:03:44'),
(471, 471, 0.00, '2026-08-07 02:03:46', '2026-08-07 02:03:46'),
(472, 472, 0.00, '2026-08-07 02:03:47', '2026-08-07 02:03:47'),
(473, 473, 0.00, '2026-08-07 02:03:48', '2026-08-07 02:03:48'),
(474, 474, 0.00, '2026-08-07 02:03:49', '2026-08-07 02:03:49'),
(475, 475, 0.00, '2026-08-07 02:03:50', '2026-08-07 02:03:50'),
(476, 476, 0.00, '2026-08-07 02:03:51', '2026-08-07 02:03:51'),
(477, 477, 0.00, '2026-08-07 02:03:52', '2026-08-07 02:03:52'),
(478, 478, 0.00, '2026-08-07 02:03:53', '2026-08-07 02:03:53'),
(479, 479, 0.00, '2026-08-07 02:03:55', '2026-08-07 02:03:55'),
(480, 480, 0.00, '2026-08-07 02:03:56', '2026-08-07 02:03:56'),
(481, 481, 0.00, '2026-08-07 02:03:58', '2026-08-07 02:03:58'),
(482, 482, 0.00, '2026-08-07 02:03:59', '2026-08-07 02:03:59'),
(483, 483, 0.00, '2026-08-07 02:04:00', '2026-08-07 02:04:00'),
(484, 484, 0.00, '2026-08-07 02:04:01', '2026-08-07 02:04:01'),
(485, 485, 0.00, '2026-08-07 02:04:02', '2026-08-07 02:04:02'),
(486, 486, 0.00, '2026-08-07 02:04:03', '2026-08-07 02:04:03'),
(487, 487, 0.00, '2026-08-07 02:04:04', '2026-08-07 02:04:04'),
(488, 488, 0.00, '2026-08-07 02:04:05', '2026-08-07 02:04:05'),
(489, 489, 0.00, '2026-08-07 02:04:06', '2026-08-07 02:04:06'),
(490, 490, 0.00, '2026-08-07 02:04:07', '2026-08-07 02:04:07'),
(491, 491, 0.00, '2026-08-07 02:04:08', '2026-08-07 02:04:08'),
(492, 492, 0.00, '2026-08-07 02:04:10', '2026-08-07 02:04:10'),
(493, 493, 0.00, '2026-08-07 02:04:11', '2026-08-07 02:04:11'),
(494, 494, 0.00, '2026-08-07 02:04:12', '2026-08-07 02:04:12'),
(495, 495, 0.00, '2026-08-07 02:04:13', '2026-08-07 02:04:13'),
(496, 496, 0.00, '2026-08-07 02:04:14', '2026-08-07 02:04:14'),
(497, 497, 0.00, '2026-08-07 02:04:15', '2026-08-07 02:04:15'),
(498, 498, 0.00, '2026-08-07 02:04:16', '2026-08-07 02:04:16'),
(499, 499, 0.00, '2026-08-07 02:04:17', '2026-08-07 02:04:17'),
(500, 500, 0.00, '2026-08-07 02:04:18', '2026-08-07 02:04:18'),
(501, 501, 0.00, '2026-08-07 02:04:19', '2026-08-07 02:04:19'),
(502, 502, 0.00, '2026-08-07 02:04:20', '2026-08-07 02:04:20'),
(503, 503, 0.00, '2026-08-07 02:04:21', '2026-08-07 02:04:21'),
(504, 504, 0.00, '2026-08-07 02:04:22', '2026-08-07 02:04:22'),
(505, 505, 0.00, '2026-08-07 02:04:23', '2026-08-07 02:04:23'),
(506, 506, 0.00, '2026-08-07 02:04:24', '2026-08-07 02:04:24'),
(507, 507, 0.00, '2026-08-07 02:04:25', '2026-08-07 02:04:25'),
(508, 508, 0.00, '2026-08-07 02:04:26', '2026-08-07 02:04:26'),
(509, 509, 0.00, '2026-08-07 02:04:27', '2026-08-07 02:04:27'),
(510, 510, 0.00, '2026-08-07 02:04:28', '2026-08-07 02:04:28'),
(511, 511, 0.00, '2026-08-07 02:04:29', '2026-08-07 02:04:29'),
(512, 512, 0.00, '2026-08-07 02:04:30', '2026-08-07 02:04:30'),
(513, 513, 0.00, '2026-08-07 02:04:31', '2026-08-07 02:04:31'),
(514, 514, 0.00, '2026-08-07 02:04:32', '2026-08-07 02:04:32'),
(515, 515, 0.00, '2026-08-07 02:04:33', '2026-08-07 02:04:33'),
(516, 516, 0.00, '2026-08-07 02:04:34', '2026-08-07 02:04:34'),
(517, 517, 0.00, '2026-08-07 02:04:34', '2026-08-07 02:04:34'),
(518, 518, 0.00, '2026-08-07 02:04:36', '2026-08-07 02:04:36'),
(519, 519, 0.00, '2026-08-07 02:04:36', '2026-08-07 02:04:36'),
(520, 520, 0.00, '2026-08-07 02:04:37', '2026-08-07 02:04:37'),
(521, 521, 0.00, '2026-08-07 02:04:38', '2026-08-07 02:04:38'),
(522, 522, 0.00, '2026-08-07 02:04:40', '2026-08-07 02:04:40'),
(523, 523, 0.00, '2026-08-07 02:04:41', '2026-08-07 02:04:41'),
(524, 524, 0.00, '2026-08-07 02:04:42', '2026-08-07 02:04:42'),
(525, 525, 0.00, '2026-08-07 02:04:43', '2026-08-07 02:04:43'),
(526, 526, 0.00, '2026-08-07 02:04:44', '2026-08-07 02:04:44'),
(527, 527, 0.00, '2026-08-07 02:04:46', '2026-08-07 02:04:46'),
(528, 528, 0.00, '2026-08-07 02:04:47', '2026-08-07 02:04:47'),
(529, 529, 0.00, '2026-08-07 02:04:48', '2026-08-07 02:04:48'),
(530, 530, 0.00, '2026-08-07 02:04:49', '2026-08-07 02:04:49'),
(531, 531, 0.00, '2026-08-07 02:04:50', '2026-08-07 02:04:50'),
(532, 532, 0.00, '2026-08-07 02:04:51', '2026-08-07 02:04:51'),
(533, 533, 0.00, '2026-08-07 02:04:52', '2026-08-07 02:04:52'),
(534, 534, 0.00, '2026-08-07 02:04:53', '2026-08-07 02:04:53'),
(535, 535, 0.00, '2026-08-07 02:04:55', '2026-08-07 02:04:55'),
(536, 536, 0.00, '2026-08-07 02:04:55', '2026-08-07 02:04:55'),
(537, 537, 0.00, '2026-08-07 02:04:56', '2026-08-07 02:04:56'),
(538, 538, 0.00, '2026-08-07 02:04:58', '2026-08-07 02:04:58'),
(539, 539, 0.00, '2026-08-07 02:04:59', '2026-08-07 02:04:59'),
(540, 540, 0.00, '2026-08-07 02:04:59', '2026-08-07 02:04:59'),
(541, 541, 0.00, '2026-08-07 02:05:01', '2026-08-07 02:05:01'),
(542, 542, 0.00, '2026-08-07 02:05:05', '2026-08-07 02:05:05'),
(543, 543, 0.00, '2026-08-07 02:05:06', '2026-08-07 02:05:06'),
(544, 544, 0.00, '2026-08-07 02:05:07', '2026-08-07 02:05:07'),
(545, 545, 0.00, '2026-08-07 02:05:08', '2026-08-07 02:05:08'),
(546, 546, 0.00, '2026-08-07 02:05:09', '2026-08-07 02:05:09'),
(547, 547, 0.00, '2026-08-07 02:05:10', '2026-08-07 02:05:10'),
(548, 548, 0.00, '2026-08-07 02:05:10', '2026-08-07 02:05:10'),
(549, 549, 0.00, '2026-08-07 02:05:11', '2026-08-07 02:05:11'),
(550, 550, 0.00, '2026-08-07 02:05:12', '2026-08-07 02:05:12'),
(551, 551, 0.00, '2026-08-07 02:05:13', '2026-08-07 02:05:13'),
(552, 552, 0.00, '2026-08-07 02:05:14', '2026-08-07 02:05:14'),
(553, 553, 0.00, '2026-08-07 02:05:15', '2026-08-07 02:05:15'),
(554, 554, 0.00, '2026-08-07 02:05:16', '2026-08-07 02:05:16'),
(555, 555, 0.00, '2026-08-07 02:05:17', '2026-08-07 02:05:17'),
(556, 556, 0.00, '2026-08-07 02:05:18', '2026-08-07 02:05:18'),
(557, 557, 0.00, '2026-08-07 02:05:19', '2026-08-07 02:05:19'),
(558, 558, 0.00, '2026-08-07 02:05:20', '2026-08-07 02:05:20'),
(559, 559, 0.00, '2026-08-07 02:05:21', '2026-08-07 02:05:21'),
(560, 560, 0.00, '2026-08-07 02:05:23', '2026-08-07 02:05:23'),
(561, 561, 0.00, '2026-08-07 02:05:24', '2026-08-07 02:05:24'),
(562, 562, 0.00, '2026-08-07 02:05:25', '2026-08-07 02:05:25'),
(563, 563, 0.00, '2026-08-07 02:05:26', '2026-08-07 02:05:26'),
(564, 564, 0.00, '2026-08-07 02:05:28', '2026-08-07 02:05:28'),
(565, 565, 0.00, '2026-08-07 02:05:29', '2026-08-07 02:05:29'),
(566, 566, 0.00, '2026-08-07 02:05:30', '2026-08-07 02:05:30'),
(567, 567, 0.00, '2026-08-07 02:05:31', '2026-08-07 02:05:31'),
(568, 568, 0.00, '2026-08-07 02:05:32', '2026-08-07 02:05:32'),
(569, 569, 0.00, '2026-08-07 02:05:34', '2026-08-07 02:05:34'),
(570, 570, 0.00, '2026-08-07 02:05:35', '2026-08-07 02:05:35'),
(571, 571, 0.00, '2026-08-07 02:05:36', '2026-08-07 02:05:36'),
(572, 572, 0.00, '2026-08-07 02:05:37', '2026-08-07 02:05:37'),
(573, 573, 0.00, '2026-08-07 02:05:39', '2026-08-07 02:05:39'),
(574, 574, 0.00, '2026-08-07 02:05:40', '2026-08-07 02:05:40'),
(575, 575, 0.00, '2026-08-07 02:17:44', '2026-08-07 02:17:44'),
(576, 576, 0.00, '2026-08-07 02:17:45', '2026-08-07 02:17:45'),
(577, 577, 0.00, '2026-08-07 02:17:46', '2026-08-07 02:17:46');

-- --------------------------------------------------------

--
-- Table structure for table `sertifikat`
--

CREATE TABLE `sertifikat` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `mahasiswa_id` bigint(20) UNSIGNED NOT NULL,
  `jenis_id` bigint(20) UNSIGNED NOT NULL,
  `tingkat` varchar(255) DEFAULT NULL,
  `peran` varchar(255) DEFAULT NULL,
  `judul_sertifikat` varchar(255) NOT NULL,
  `penyelenggara_sertifikat` varchar(255) DEFAULT NULL,
  `tempat_pelaksanaan` varchar(255) DEFAULT NULL,
  `deskripsi_kegiatan` text DEFAULT NULL,
  `tanggal_mulai` date DEFAULT NULL,
  `tanggal_selesai` date DEFAULT NULL,
  `nomor_sertifikat` varchar(255) DEFAULT NULL,
  `berkas` varchar(255) NOT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'menunggu',
  `pengguna_validator_id` bigint(20) UNSIGNED DEFAULT NULL,
  `catatan` text DEFAULT NULL,
  `poin` decimal(8,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('CablQ1nLWjN4xuda9W4lWbXw8N4ShmkXk2nTMdve', 6, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', 'eyJfdG9rZW4iOiI2OW5VNnp3Wmp4elNUZGN6UjdVYm1paUxhUUxxNTNDcG55R3NBZHNTIiwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119LCJfcHJldmlvdXMiOnsidXJsIjoiaHR0cDpcL1wvMTI3LjAuMC4xOjgwMDBcL3VzZXJcL3NlcnRpZmlrYXQiLCJyb3V0ZSI6InVzZXIuc2VydGlmaWthdC5pbmRleCJ9LCJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI6Nn0=', 1786921446),
('KMOupp5OOzB6EZ7CrZvpdbdwGgk0AtnXhV2Kh5Ka', 6, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', 'eyJfdG9rZW4iOiI0VVJTN0V4ZUUzcm9RcHZDVjZHSEljenZ6ZnpUVVFDZ3lRRlFQdktTIiwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119LCJfcHJldmlvdXMiOnsidXJsIjoiaHR0cDpcL1wvMTI3LjAuMC4xOjgwMDBcL3VzZXJcL3NlcnRpZmlrYXRcL2NyZWF0ZSIsInJvdXRlIjoidXNlci5zZXJ0aWZpa2F0LmNyZWF0ZSJ9LCJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI6Nn0=', 1786970683);

-- --------------------------------------------------------

--
-- Table structure for table `skema_poin`
--

CREATE TABLE `skema_poin` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `jenis_id` bigint(20) UNSIGNED NOT NULL,
  `tingkat` varchar(255) DEFAULT NULL,
  `peran` varchar(255) DEFAULT NULL,
  `poin` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `skema_poin`
--

INSERT INTO `skema_poin` (`id`, `jenis_id`, `tingkat`, `peran`, `poin`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 'Petugas', 5.00, '2026-08-04 04:11:42', '2026-08-04 04:11:42'),
(2, 1, NULL, 'Peserta', 1.00, '2026-08-04 04:11:42', '2026-08-04 04:11:42'),
(3, 2, 'Internasional', NULL, 25.00, '2026-08-04 04:11:42', '2026-08-04 04:11:42'),
(4, 2, 'Nasional', NULL, 20.00, '2026-08-04 04:11:42', '2026-08-04 04:11:42'),
(5, 2, 'Regional', NULL, 15.00, '2026-08-04 04:11:42', '2026-08-04 04:11:42'),
(6, 2, 'Internal UKRI', NULL, 10.00, '2026-08-04 04:11:42', '2026-08-04 04:11:42'),
(7, 3, 'Internasional', NULL, 25.00, '2026-08-04 04:11:44', '2026-08-04 04:11:44'),
(8, 3, 'Terakreditasi Nasional', NULL, 20.00, '2026-08-04 04:11:45', '2026-08-04 04:11:45'),
(9, 3, 'Belum Terakreditasi', NULL, 15.00, '2026-08-04 04:11:45', '2026-08-04 04:11:45'),
(10, 3, 'Internal UKRI', NULL, 10.00, '2026-08-04 04:11:45', '2026-08-04 04:11:45'),
(11, 4, 'Internasional', NULL, 15.00, '2026-08-04 04:11:45', '2026-08-04 04:11:45'),
(12, 4, 'Nasional', NULL, 10.00, '2026-08-04 04:11:45', '2026-08-04 04:11:45'),
(13, 4, 'Regional', NULL, 5.00, '2026-08-04 04:11:45', '2026-08-04 04:11:45'),
(14, 5, 'Internasional', NULL, 7.00, '2026-08-04 04:11:45', '2026-08-04 04:11:45'),
(15, 5, 'Nasional', NULL, 5.00, '2026-08-04 04:11:46', '2026-08-04 04:11:46'),
(16, 5, 'Regional', NULL, 2.00, '2026-08-04 04:11:46', '2026-08-04 04:11:46'),
(17, 6, 'Internasional', NULL, 7.00, '2026-08-04 04:11:46', '2026-08-04 04:11:46'),
(18, 6, 'Nasional', NULL, 5.00, '2026-08-04 04:11:46', '2026-08-04 04:11:46'),
(19, 6, 'Regional', NULL, 2.00, '2026-08-04 04:11:46', '2026-08-04 04:11:46'),
(20, 7, 'Internasional', NULL, 25.00, '2026-08-04 04:11:47', '2026-08-04 04:11:47'),
(21, 7, 'Nasional', NULL, 20.00, '2026-08-04 04:11:47', '2026-08-04 04:11:47'),
(22, 7, 'Regional', NULL, 10.00, '2026-08-04 04:11:47', '2026-08-04 04:11:47'),
(23, 7, 'Internal', NULL, 5.00, '2026-08-04 04:11:47', '2026-08-04 04:11:47'),
(24, 8, 'Internasional', NULL, 25.00, '2026-08-04 04:11:48', '2026-08-04 04:11:48'),
(25, 8, 'Nasional', NULL, 20.00, '2026-08-04 04:11:48', '2026-08-04 04:11:48'),
(26, 8, 'Regional', NULL, 10.00, '2026-08-04 04:11:48', '2026-08-04 04:11:48'),
(27, 8, 'Internal', NULL, 5.00, '2026-08-04 04:11:48', '2026-08-04 04:11:48'),
(28, 9, 'Internasional', 'Juara I/II/III', 30.00, '2026-08-04 04:11:48', '2026-08-04 04:11:48'),
(29, 9, 'Internasional', 'Peserta', 10.00, '2026-08-04 04:11:49', '2026-08-04 04:11:49'),
(30, 9, 'Nasional', 'Juara I/II/III', 25.00, '2026-08-04 04:11:49', '2026-08-04 04:11:49'),
(31, 9, 'Nasional', 'Peserta', 7.00, '2026-08-04 04:11:49', '2026-08-04 04:11:49'),
(32, 9, 'Provinsi', 'Juara I/II/III', 10.00, '2026-08-04 04:11:49', '2026-08-04 04:11:49'),
(33, 9, 'Provinsi', 'Peserta', 5.00, '2026-08-04 04:11:49', '2026-08-04 04:11:49'),
(34, 9, 'UKRI', 'Juara I/II/III', 5.00, '2026-08-04 04:11:50', '2026-08-04 04:11:50'),
(35, 9, 'UKRI', 'Peserta', 3.00, '2026-08-04 04:11:50', '2026-08-04 04:11:50'),
(36, 10, 'Internasional', 'Juara I/II/III', 30.00, '2026-08-04 04:11:50', '2026-08-04 04:11:50'),
(37, 10, 'Internasional', 'Peserta', 10.00, '2026-08-04 04:11:50', '2026-08-04 04:11:50'),
(38, 10, 'Nasional', 'Juara I/II/III', 25.00, '2026-08-04 04:11:50', '2026-08-04 04:11:50'),
(39, 10, 'Nasional', 'Peserta', 7.00, '2026-08-04 04:11:50', '2026-08-04 04:11:50'),
(40, 10, 'Provinsi', 'Juara I/II/III', 10.00, '2026-08-04 04:11:50', '2026-08-04 04:11:50'),
(41, 10, 'Provinsi', 'Peserta', 5.00, '2026-08-04 04:11:51', '2026-08-04 04:11:51'),
(42, 10, 'UKRI', 'Juara I/II/III', 5.00, '2026-08-04 04:11:51', '2026-08-04 04:11:51'),
(43, 10, 'UKRI', 'Peserta', 3.00, '2026-08-04 04:11:52', '2026-08-04 04:11:52'),
(44, 11, NULL, 'Koordinator Asisten', 20.00, '2026-08-04 04:11:54', '2026-08-04 04:11:54'),
(45, 11, NULL, 'Asisten', 15.00, '2026-08-04 04:11:54', '2026-08-04 04:11:54'),
(46, 11, NULL, 'Studi Group', 5.00, '2026-08-04 04:11:54', '2026-08-04 04:11:54'),
(47, 12, NULL, 'Koordinator Asisten', 20.00, '2026-08-04 04:11:54', '2026-08-04 04:11:54'),
(48, 12, NULL, 'Asisten', 15.00, '2026-08-04 04:11:54', '2026-08-04 04:11:54'),
(49, 12, NULL, 'Studi Group', 5.00, '2026-08-04 04:11:54', '2026-08-04 04:11:54'),
(50, 13, NULL, 'Koordinator Asisten', 20.00, '2026-08-04 04:11:55', '2026-08-04 04:11:55'),
(51, 13, NULL, 'Asisten', 15.00, '2026-08-04 04:11:55', '2026-08-04 04:11:55'),
(52, 13, NULL, 'Studi Group', 5.00, '2026-08-04 04:11:55', '2026-08-04 04:11:55'),
(53, 14, 'Internasional', NULL, 20.00, '2026-08-04 04:11:55', '2026-08-04 04:11:55'),
(54, 14, 'Nasional', NULL, 15.00, '2026-08-04 04:11:56', '2026-08-04 04:11:56'),
(55, 14, 'Regional', NULL, 5.00, '2026-08-04 04:11:56', '2026-08-04 04:11:56'),
(56, 15, 'Internasional', NULL, 20.00, '2026-08-04 04:11:56', '2026-08-04 04:11:56'),
(57, 15, 'Nasional', NULL, 15.00, '2026-08-04 04:11:56', '2026-08-04 04:11:56'),
(58, 15, 'Regional', NULL, 5.00, '2026-08-04 04:11:56', '2026-08-04 04:11:56'),
(59, 16, 'UKRI', NULL, 15.00, '2026-08-04 04:11:57', '2026-08-04 04:11:57'),
(60, 16, 'Fakultas', NULL, 10.00, '2026-08-04 04:11:57', '2026-08-04 04:11:57'),
(61, 17, NULL, 'Pegawai Tetap', 20.00, '2026-08-04 04:11:57', '2026-08-04 04:11:57'),
(62, 17, NULL, 'Wirausaha', 20.00, '2026-08-04 04:11:57', '2026-08-04 04:11:57'),
(63, 17, NULL, 'Part Time', 10.00, '2026-08-04 04:11:57', '2026-08-04 04:11:57'),
(64, 18, NULL, 'Ketua/Wakil', 25.00, '2026-08-04 04:11:58', '2026-08-04 04:11:58'),
(65, 18, NULL, 'Sekretaris/Bendahara/Kabid', 20.00, '2026-08-04 04:11:58', '2026-08-04 04:11:58'),
(66, 18, NULL, 'Staf Bidang', 10.00, '2026-08-04 04:11:58', '2026-08-04 04:11:58'),
(67, 19, NULL, 'Ketua/Wakil', 25.00, '2026-08-04 04:11:59', '2026-08-04 04:11:59'),
(68, 19, NULL, 'Sekretaris/Bendahara/Kabid', 20.00, '2026-08-04 04:11:59', '2026-08-04 04:11:59'),
(69, 19, NULL, 'Staf Bidang', 10.00, '2026-08-04 04:12:00', '2026-08-04 04:12:00'),
(70, 20, NULL, 'Ketua/Wakil', 20.00, '2026-08-04 04:12:00', '2026-08-04 04:12:00'),
(71, 20, NULL, 'Sekretaris/Bendahara/Kabid', 15.00, '2026-08-04 04:12:00', '2026-08-04 04:12:00'),
(72, 20, NULL, 'Staf Bidang', 10.00, '2026-08-04 04:12:01', '2026-08-04 04:12:01'),
(73, 21, NULL, 'Ketua/Wakil', 20.00, '2026-08-04 04:12:01', '2026-08-04 04:12:01'),
(74, 21, NULL, 'Sekretaris/Bendahara/Kabid', 15.00, '2026-08-04 04:12:01', '2026-08-04 04:12:01'),
(75, 21, NULL, 'Staf Bidang', 10.00, '2026-08-04 04:12:01', '2026-08-04 04:12:01'),
(76, 22, NULL, 'Ketua/Wakil', 20.00, '2026-08-04 04:12:01', '2026-08-04 04:12:01'),
(77, 22, NULL, 'Sekretaris/Bendahara/Kabid', 15.00, '2026-08-04 04:12:02', '2026-08-04 04:12:02'),
(78, 22, NULL, 'Staf Bidang', 10.00, '2026-08-04 04:12:02', '2026-08-04 04:12:02'),
(79, 23, NULL, 'Ketua/Wakil', 20.00, '2026-08-04 04:12:02', '2026-08-04 04:12:02'),
(80, 23, NULL, 'Sekretaris/Bendahara/Kabid', 15.00, '2026-08-04 04:12:02', '2026-08-04 04:12:02'),
(81, 23, NULL, 'Staf Bidang', 10.00, '2026-08-04 04:12:02', '2026-08-04 04:12:02'),
(82, 24, NULL, 'Ketua/Wakil', 15.00, '2026-08-04 04:12:03', '2026-08-04 04:12:03'),
(83, 24, NULL, 'Sekretaris/Bendahara/Kabid', 10.00, '2026-08-04 04:12:03', '2026-08-04 04:12:03'),
(84, 24, NULL, 'Anggota', 5.00, '2026-08-04 04:12:03', '2026-08-04 04:12:03'),
(85, 25, NULL, 'Ketua/Wakil', 15.00, '2026-08-04 04:12:03', '2026-08-04 04:12:03'),
(86, 25, NULL, 'Sekretaris/Bendahara/Kabid', 10.00, '2026-08-04 04:12:03', '2026-08-04 04:12:03'),
(87, 25, NULL, 'Anggota', 5.00, '2026-08-04 04:12:03', '2026-08-04 04:12:03'),
(88, 26, NULL, 'Ketua/Wakil', 25.00, '2026-08-04 04:12:03', '2026-08-04 04:12:03'),
(89, 26, NULL, 'Sekretaris/Bendahara/Kabid', 20.00, '2026-08-04 04:12:03', '2026-08-04 04:12:03'),
(90, 26, NULL, 'Anggota', 10.00, '2026-08-04 04:12:04', '2026-08-04 04:12:04'),
(91, 27, NULL, 'Ketua/Wakil', 20.00, '2026-08-04 04:12:04', '2026-08-04 04:12:04'),
(92, 27, NULL, 'Sekretaris/Bendahara/Kabid', 15.00, '2026-08-04 04:12:04', '2026-08-04 04:12:04'),
(93, 27, NULL, 'Anggota', 8.00, '2026-08-04 04:12:04', '2026-08-04 04:12:04'),
(94, 28, NULL, 'Ketua/Wakil', 20.00, '2026-08-04 04:12:05', '2026-08-04 04:12:05'),
(95, 28, NULL, 'Sekretaris/Bendahara/Kabid', 15.00, '2026-08-04 04:12:05', '2026-08-04 04:12:05'),
(96, 28, NULL, 'Staf Bidang', 10.00, '2026-08-04 04:12:05', '2026-08-04 04:12:05'),
(97, 28, NULL, 'Anggota', 5.00, '2026-08-04 04:12:05', '2026-08-04 04:12:05'),
(98, 29, NULL, 'LDKO/LDKO Lanjutan', 10.00, '2026-08-04 04:12:05', '2026-08-04 04:12:05'),
(99, 29, NULL, 'Selain LDKO', 5.00, '2026-08-04 04:12:05', '2026-08-04 04:12:05'),
(100, 30, 'UKRI', NULL, 5.00, '2026-08-04 04:12:06', '2026-08-04 04:12:06'),
(101, 30, 'Fakultas', NULL, 5.00, '2026-08-04 04:12:06', '2026-08-04 04:12:06'),
(102, 30, 'Prodi', NULL, 5.00, '2026-08-04 04:12:06', '2026-08-04 04:12:06'),
(103, 31, NULL, 'Petugas Pameran', 5.00, '2026-08-04 04:12:06', '2026-08-04 04:12:06'),
(104, 31, NULL, 'Roadshow', 5.00, '2026-08-04 04:12:07', '2026-08-04 04:12:07'),
(105, 31, NULL, 'Try Out Sekolah', 5.00, '2026-08-04 04:12:07', '2026-08-04 04:12:07'),
(106, 31, NULL, 'Edutrip', 5.00, '2026-08-04 04:12:07', '2026-08-04 04:12:07'),
(107, 32, NULL, 'Ketua/Sekretaris/Bendahara/Kabid', 25.00, '2026-08-04 04:12:07', '2026-08-04 04:12:07'),
(108, 32, NULL, 'Anggota Biasa', 5.00, '2026-08-04 04:12:07', '2026-08-04 04:12:07'),
(109, 33, NULL, 'Pengurus', 20.00, '2026-08-04 04:12:08', '2026-08-04 04:12:08'),
(110, 33, NULL, 'Anggota Biasa', 5.00, '2026-08-04 04:12:08', '2026-08-04 04:12:08'),
(111, 34, NULL, 'Pengurus', 15.00, '2026-08-04 04:12:08', '2026-08-04 04:12:08'),
(112, 34, NULL, 'Anggota Biasa', 5.00, '2026-08-04 04:12:08', '2026-08-04 04:12:08'),
(113, 35, NULL, 'Pengurus', 15.00, '2026-08-04 04:12:08', '2026-08-04 04:12:08'),
(114, 35, NULL, 'Anggota Biasa', 5.00, '2026-08-04 04:12:08', '2026-08-04 04:12:08'),
(115, 36, NULL, 'Pengurus', 10.00, '2026-08-04 04:12:08', '2026-08-04 04:12:08'),
(116, 36, NULL, 'Anggota Biasa', 5.00, '2026-08-04 04:12:09', '2026-08-04 04:12:09'),
(117, 37, NULL, 'Pengurus', 10.00, '2026-08-04 04:12:09', '2026-08-04 04:12:09'),
(118, 37, NULL, 'Anggota Biasa', 5.00, '2026-08-04 04:12:09', '2026-08-04 04:12:09'),
(119, 38, NULL, 'Pengurus', 10.00, '2026-08-04 04:12:09', '2026-08-04 04:12:09'),
(120, 38, NULL, 'Anggota Biasa', 5.00, '2026-08-04 04:12:09', '2026-08-04 04:12:09');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`),
  ADD KEY `failed_jobs_connection_queue_failed_at_index` (`connection`,`queue`,`failed_at`);

--
-- Indexes for table `jenis`
--
ALTER TABLE `jenis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jenis_jenis_kegiatan_id_foreign` (`jenis_kegiatan_id`);

--
-- Indexes for table `jenis_kegiatan`
--
ALTER TABLE `jenis_kegiatan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jenis_kegiatan_kategori_id_foreign` (`kategori_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `log_aktivitas`
--
ALTER TABLE `log_aktivitas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `log_aktivitas_pengguna_id_foreign` (`pengguna_id`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mahasiswa_nim_unique` (`nim`),
  ADD KEY `mahasiswa_pengguna_id_foreign` (`pengguna_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifikasi`
--
ALTER TABLE `notifikasi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifikasi_pengguna_id_foreign` (`pengguna_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pengguna_email_unique` (`email`),
  ADD UNIQUE KEY `pengguna_sso_username_unique` (`sso_username`);

--
-- Indexes for table `portofolio`
--
ALTER TABLE `portofolio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `portofolio_mahasiswa_id_foreign` (`mahasiswa_id`);

--
-- Indexes for table `sertifikat`
--
ALTER TABLE `sertifikat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sertifikat_mahasiswa_id_foreign` (`mahasiswa_id`),
  ADD KEY `sertifikat_jenis_id_foreign` (`jenis_id`),
  ADD KEY `sertifikat_pengguna_validator_id_foreign` (`pengguna_validator_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `skema_poin`
--
ALTER TABLE `skema_poin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `skema_poin_jenis_id_foreign` (`jenis_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jenis`
--
ALTER TABLE `jenis`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `jenis_kegiatan`
--
ALTER TABLE `jenis_kegiatan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `log_aktivitas`
--
ALTER TABLE `log_aktivitas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=578;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `notifikasi`
--
ALTER TABLE `notifikasi`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pengguna`
--
ALTER TABLE `pengguna`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=579;

--
-- AUTO_INCREMENT for table `portofolio`
--
ALTER TABLE `portofolio`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=578;

--
-- AUTO_INCREMENT for table `sertifikat`
--
ALTER TABLE `sertifikat`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `skema_poin`
--
ALTER TABLE `skema_poin`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `jenis`
--
ALTER TABLE `jenis`
  ADD CONSTRAINT `jenis_jenis_kegiatan_id_foreign` FOREIGN KEY (`jenis_kegiatan_id`) REFERENCES `jenis_kegiatan` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `jenis_kegiatan`
--
ALTER TABLE `jenis_kegiatan`
  ADD CONSTRAINT `jenis_kegiatan_kategori_id_foreign` FOREIGN KEY (`kategori_id`) REFERENCES `kategori` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `log_aktivitas`
--
ALTER TABLE `log_aktivitas`
  ADD CONSTRAINT `log_aktivitas_pengguna_id_foreign` FOREIGN KEY (`pengguna_id`) REFERENCES `pengguna` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD CONSTRAINT `mahasiswa_pengguna_id_foreign` FOREIGN KEY (`pengguna_id`) REFERENCES `pengguna` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `notifikasi`
--
ALTER TABLE `notifikasi`
  ADD CONSTRAINT `notifikasi_pengguna_id_foreign` FOREIGN KEY (`pengguna_id`) REFERENCES `pengguna` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `portofolio`
--
ALTER TABLE `portofolio`
  ADD CONSTRAINT `portofolio_mahasiswa_id_foreign` FOREIGN KEY (`mahasiswa_id`) REFERENCES `mahasiswa` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sertifikat`
--
ALTER TABLE `sertifikat`
  ADD CONSTRAINT `sertifikat_jenis_id_foreign` FOREIGN KEY (`jenis_id`) REFERENCES `jenis` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sertifikat_mahasiswa_id_foreign` FOREIGN KEY (`mahasiswa_id`) REFERENCES `mahasiswa` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sertifikat_pengguna_validator_id_foreign` FOREIGN KEY (`pengguna_validator_id`) REFERENCES `pengguna` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `skema_poin`
--
ALTER TABLE `skema_poin`
  ADD CONSTRAINT `skema_poin_jenis_id_foreign` FOREIGN KEY (`jenis_id`) REFERENCES `jenis` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
