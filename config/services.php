<?php

return [

    /*
    |--------------------------------------------------------------------------
    | Third Party Services
    |--------------------------------------------------------------------------
    |
    | This file is for storing the credentials for third party services such
    | as Mailgun, Postmark, AWS and more. This file provides the de facto
    | location for this type of information, allowing packages to have
    | a conventional file to locate the various service credentials.
    |
    */

    'postmark' => [
        'key' => env('POSTMARK_API_KEY'),
    ],

    'resend' => [
        'key' => env('RESEND_API_KEY'),
    ],

    'ses' => [
        'key' => env('AWS_ACCESS_KEY_ID'),
        'secret' => env('AWS_SECRET_ACCESS_KEY'),
        'region' => env('AWS_DEFAULT_REGION', 'us-east-1'),
    ],

    'slack' => [
        'notifications' => [
            'bot_user_oauth_token' => env('SLACK_BOT_USER_OAUTH_TOKEN'),
            'channel' => env('SLACK_BOT_USER_DEFAULT_CHANNEL'),
        ],
    ],

    /*
    |--------------------------------------------------------------------------
    | Data Master UKRI (data mahasiswa: prodi, fakultas, angkatan, dst.)
    |--------------------------------------------------------------------------
    |
    | Belum ada akses/dokumentasi resminya saat konfigurasi ini dibuat, jadi
    | struktur di bawah adalah PERKIRAAN yang PALING UMUM dipakai (Bearer
    | token + secret opsional). 'enabled' default false — nyalakan setelah
    | kredensial & format response API sungguhan didapat dari pengelola
    | Data Master, dan sesuaikan App\Services\DataMasterClient bila perlu.
    |
    */
    'data_master' => [
        'enabled' => env('DATA_MASTER_ENABLED', false),
        'url' => env('DATA_MASTER_URL'),
        'token' => env('DATA_MASTER_TOKEN'),
        'secret' => env('DATA_MASTER_SECRET'),
        'timeout' => env('DATA_MASTER_TIMEOUT', 10),
    ],

    /*
    |--------------------------------------------------------------------------
    | SSO UKRI (login OAuth2: redirect ke SSO, kembali lagi ke dashboard)
    |--------------------------------------------------------------------------
    |
    | 'enabled' jadi saklar utama: kalau false (atau salah satu kredensial di
    | bawah kosong), tombol "Login dengan SSO UKRI" otomatis disembunyikan dan
    | route sso.redirect/sso.callback mengembalikan 404 — login manual tetap
    | jalan seperti biasa. Lihat App\Http\Controllers\Auth\SsoController dan
    | PANDUAN_SSO.md untuk alur lengkapnya.
    |
    */
    'sso' => [
        'enabled' => env('SSO_ENABLED', false),
        'base_url' => env('SSO_URL'),
        'client_id' => env('SSO_CLIENT_ID'),
        'client_secret' => env('SSO_CLIENT_SECRET'),
        'redirect' => env('SSO_REDIRECT_URI'),
        'timeout' => env('SSO_TIMEOUT', 10),
    ],

];
