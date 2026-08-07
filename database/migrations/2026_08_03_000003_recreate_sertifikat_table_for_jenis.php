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
            $table->foreignId('jenis_id')->constrained('jenis')->cascadeOnDelete();
            $table->string('tingkat')->nullable();
            $table->string('peran')->nullable();

            $table->string('judul_sertifikat');
            $table->string('penyelenggara_sertifikat')->nullable();
            $table->string('tempat_pelaksanaan')->nullable();
            $table->text('deskripsi_kegiatan')->nullable();
            $table->date('tanggal_mulai')->nullable();
            $table->date('tanggal_selesai')->nullable();
            $table->string('nomor_sertifikat')->nullable();

            $table->string('berkas');
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
