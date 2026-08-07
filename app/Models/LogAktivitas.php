<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class LogAktivitas extends Model
{
    use HasFactory;

    protected $table = 'log_aktivitas';

    public $timestamps = false;

    protected $fillable = [
        'pengguna_id',
        'aktivitas',
        'created_at',
    ];

    protected function casts(): array
    {
        return [
            'created_at' => 'datetime',
        ];
    }

    public function pengguna(): BelongsTo
    {
        return $this->belongsTo(User::class, 'pengguna_id');
    }

    /**
     * Catat satu baris audit trail untuk user yang sedang login.
     * Dipanggil dari controller mana pun tanpa perlu tahu detail tabel.
     */
    public static function catat(string $aktivitas): void
    {
        if (! auth()->check()) {
            return;
        }

        static::create([
            'pengguna_id' => auth()->id(),
            'aktivitas' => $aktivitas,
            'created_at' => now(),
        ]);
    }
}
