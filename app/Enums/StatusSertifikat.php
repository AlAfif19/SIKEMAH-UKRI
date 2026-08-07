<?php

namespace App\Enums;

enum StatusSertifikat: string
{
    case Menunggu = 'menunggu';
    case Disetujui = 'disetujui';
    case Ditolak = 'ditolak';

    public function label(): string
    {
        return match ($this) {
            self::Menunggu => 'Menunggu Validasi',
            self::Disetujui => 'Disetujui',
            self::Ditolak => 'Ditolak',
        };
    }

    public function badgeClass(): string
    {
        return match ($this) {
            self::Menunggu => 'bg-warning text-dark',
            self::Disetujui => 'bg-success',
            self::Ditolak => 'bg-danger',
        };
    }
}
