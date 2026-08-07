<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\File;

class BackupDatabaseCommand extends Command
{
    protected $signature = 'backup:database';

    protected $description = 'Membuat salinan cadangan database (mendukung koneksi sqlite dan mysql)';

    public function handle(): int
    {
        $koneksi = config('database.default');
        $folderBackup = storage_path('app/backups');

        if (! File::isDirectory($folderBackup)) {
            File::makeDirectory($folderBackup, 0755, true);
        }

        $timestamp = now()->format('Y-m-d_H-i-s');

        return match ($koneksi) {
            'sqlite' => $this->backupSqlite($folderBackup, $timestamp),
            'mysql' => $this->backupMysql($folderBackup, $timestamp),
            default => $this->gagal("Koneksi database '{$koneksi}' belum didukung untuk backup otomatis."),
        };
    }

    private function backupSqlite(string $folderBackup, string $timestamp): int
    {
        $pathDatabase = database_path('database.sqlite');

        if (! File::exists($pathDatabase)) {
            return $this->gagal("File database tidak ditemukan di: {$pathDatabase}");
        }

        $tujuan = "{$folderBackup}/backup_sikemah_{$timestamp}.sqlite";
        File::copy($pathDatabase, $tujuan);

        $this->info("Backup SQLite berhasil disimpan di: {$tujuan}");

        return self::SUCCESS;
    }

    private function backupMysql(string $folderBackup, string $timestamp): int
    {
        $config = config('database.connections.mysql');
        $tujuan = "{$folderBackup}/backup_sikemah_{$timestamp}.sql";

        $perintah = sprintf(
            'mysqldump --host=%s --port=%s --user=%s %s %s > %s',
            escapeshellarg($config['host']),
            escapeshellarg((string) $config['port']),
            escapeshellarg($config['username']),
            $config['password'] ? '--password='.escapeshellarg($config['password']) : '',
            escapeshellarg($config['database']),
            escapeshellarg($tujuan)
        );

        exec($perintah, $output, $kodeExit);

        if ($kodeExit !== 0 || ! File::exists($tujuan)) {
            return $this->gagal('mysqldump gagal dijalankan. Pastikan mysqldump tersedia di PATH sistem kamu.');
        }

        $this->info("Backup MySQL berhasil disimpan di: {$tujuan}");

        return self::SUCCESS;
    }

    private function gagal(string $pesan): int
    {
        $this->error($pesan);

        return self::FAILURE;
    }
}
