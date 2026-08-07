<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('sertifikat', function (Blueprint $table) {
            $table->string('judul_sertifikat')->nullable()->after('kegiatan_id');
            $table->string('nomor_sertifikat')->nullable()->after('judul_sertifikat');
            $table->string('penyelenggara_sertifikat')->nullable()->after('nomor_sertifikat');
            $table->unsignedSmallInteger('tahun_sertifikat')->nullable()->after('penyelenggara_sertifikat');
        });
    }

    public function down(): void
    {
        Schema::table('sertifikat', function (Blueprint $table) {
            $table->dropColumn(['judul_sertifikat', 'nomor_sertifikat', 'penyelenggara_sertifikat', 'tahun_sertifikat']);
        });
    }
};
