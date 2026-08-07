<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasOne;

class Mahasiswa extends Model
{
    use HasFactory;

    protected $table = 'mahasiswa';

    protected $fillable = [
        'pengguna_id',
        'nim',
        'prodi',
        'fakultas',
        'angkatan',
        'sinkron_data_master_pada',
    ];

    protected function casts(): array
    {
        return [
            'sinkron_data_master_pada' => 'datetime',
        ];
    }

    public function pengguna(): BelongsTo
    {
        return $this->belongsTo(User::class, 'pengguna_id');
    }

    public function sertifikat(): HasMany
    {
        return $this->hasMany(Sertifikat::class, 'mahasiswa_id');
    }

    public function portofolio(): HasOne
    {
        return $this->hasOne(Portofolio::class, 'mahasiswa_id');
    }
}
