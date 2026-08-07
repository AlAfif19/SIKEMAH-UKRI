<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('skema_poin', function (Blueprint $table) {
            $table->id();
            $table->foreignId('kategori_id')->constrained('kategori')->cascadeOnDelete();
            $table->string('tingkat');
            $table->decimal('poin', 8, 2);
            $table->timestamps();

            $table->unique(['kategori_id', 'tingkat']);
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('skema_poin');
    }
};
