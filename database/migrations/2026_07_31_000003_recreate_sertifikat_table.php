<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::dropIfExists('sertifikat');

        Schema::create('sertifikat', function (Blueprint $table) {
            $table->id();
            $table->foreignId('mahasiswa_id')->constrained('mahasiswa')->cascadeOnDelete();
            $table->foreignId('jenis_kegiatan_id')->constrained('jenis_kegiatan')->cascadeOnDelete();
            $table->string('tingkat')->nullable();
            $table->string('peran')->nullable();

            // Detail kegiatan — persis form "Tambah Upload Mandiri" (SPAMA)
            $table->string('judul_sertifikat'); // Nama Kegiatan
            $table->string('penyelenggara_sertifikat')->nullable(); // Penyelenggara
            $table->string('tempat_pelaksanaan')->nullable();
            $table->text('deskripsi_kegiatan')->nullable(); // opsional
            $table->date('tanggal_mulai')->nullable();
            $table->date('tanggal_selesai')->nullable();
            $table->string('nomor_sertifikat')->nullable();

            $table->string('berkas'); // Scan Bukti Kegiatan
            $table->string('thumbnail')->nullable();

            $table->string('status')->default('menunggu');
            $table->foreignId('pengguna_validator_id')->nullable()->constrained('pengguna')->nullOnDelete();
            $table->text('catatan')->nullable();
            $table->decimal('poin', 8, 2)->default(0);

            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('sertifikat');
    }
};
