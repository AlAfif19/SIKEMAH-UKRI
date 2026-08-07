<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Attributes\Fillable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

#[Fillable(['jenis_kegiatan_id', 'nama'])]
class Jenis extends Model
{
    use HasFactory;

    protected $table = 'jenis';

    /**
     * Nama relasi disebut "kegiatan" (bukan "jenisKegiatan") supaya lebih
     * enak dibaca di kode — sesuai istilah yang dipakai di UI ("Kegiatan"),
     * meskipun nama class-nya masih JenisKegiatan secara historis.
     */
    public function kegiatan(): BelongsTo
    {
        return $this->belongsTo(JenisKegiatan::class, 'jenis_kegiatan_id');
    }

    public function skemaPoin(): HasMany
    {
        return $this->hasMany(SkemaPoin::class, 'jenis_id');
    }

    public function sertifikat(): HasMany
    {
        return $this->hasMany(Sertifikat::class, 'jenis_id');
    }
}
