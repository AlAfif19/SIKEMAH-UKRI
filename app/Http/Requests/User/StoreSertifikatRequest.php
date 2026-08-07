<?php

namespace App\Http\Requests\User;

use Illuminate\Foundation\Http\FormRequest;

class StoreSertifikatRequest extends FormRequest
{
    public function authorize(): bool
    {
        return auth()->check() && ! auth()->user()->isAdmin();
    }

    public function rules(): array
    {
        return [
            'jenis_kegiatan_id' => ['required', 'exists:jenis_kegiatan,id'],
            'jenis_id' => ['required', 'exists:jenis,id'],
            'tingkat' => ['nullable', 'string', 'max:100'],
            'peran' => ['nullable', 'string', 'max:100'],
            'judul_sertifikat' => ['required', 'string', 'max:255'],
            'penyelenggara_sertifikat' => ['nullable', 'string', 'max:255'],
            'tempat_pelaksanaan' => ['nullable', 'string', 'max:255'],
            'deskripsi_kegiatan' => ['nullable', 'string', 'max:2000'],
            'tanggal_mulai' => ['nullable', 'date'],
            'tanggal_selesai' => ['nullable', 'date', 'after_or_equal:tanggal_mulai'],
            'nomor_sertifikat' => ['nullable', 'string', 'max:100'],
            'berkas' => ['required', 'file', 'mimes:pdf,jpg,jpeg,png', 'max:5120'],
        ];
    }

    public function messages(): array
    {
        return [
            'jenis_kegiatan_id.required' => 'Kategori & Kegiatan wajib dipilih.',
            'jenis_kegiatan_id.exists' => 'Kegiatan yang dipilih tidak valid.',
            'jenis_id.required' => 'Jenis wajib dipilih.',
            'jenis_id.exists' => 'Jenis yang dipilih tidak valid.',
            'judul_sertifikat.required' => 'Nama kegiatan wajib diisi.',
            'tanggal_selesai.after_or_equal' => 'Tanggal selesai tidak boleh sebelum tanggal mulai.',
            'berkas.required' => 'Scan bukti kegiatan wajib diunggah.',
            'berkas.mimes' => 'Berkas harus berupa PDF, JPG, atau PNG.',
            'berkas.max' => 'Ukuran berkas maksimal 5 MB.',
        ];
    }

    public function withValidator($validator): void
    {
        $validator->after(function ($validator) {
            $mahasiswa = auth()->user()->mahasiswa;

            if (! $mahasiswa) {
                $validator->errors()->add('jenis_id', 'Lengkapi profil mahasiswa Anda sebelum mengajukan sertifikat.');
                return;
            }

            if (! $this->filled('jenis_id')) {
                return;
            }

            // Pastikan Jenis yang dipilih benar-benar anak dari Kegiatan yang dipilih
            // (mencegah kombinasi Kegiatan+Jenis yang tidak nyambung lewat form).
            if ($this->filled('jenis_kegiatan_id')) {
                $jenisCocok = \App\Models\Jenis::where('id', $this->input('jenis_id'))
                    ->where('jenis_kegiatan_id', $this->input('jenis_kegiatan_id'))
                    ->exists();

                if (! $jenisCocok) {
                    $validator->errors()->add('jenis_id', 'Jenis yang dipilih tidak sesuai dengan Kegiatan yang dipilih.');

                    return;
                }
            }

            // Pastikan kombinasi Tingkat/Peran yang dipilih benar-benar terdaftar
            // di skema poin Jenis ini (mencegah manipulasi nilai lewat form).
            $adaSkema = \App\Models\SkemaPoin::where('jenis_id', $this->input('jenis_id'))
                ->where('tingkat', $this->input('tingkat') ?: null)
                ->where('peran', $this->input('peran') ?: null)
                ->exists();

            if (! $adaSkema) {
                $validator->errors()->add('tingkat', 'Kombinasi Tingkat/Peran ini tidak terdaftar untuk Jenis yang dipilih.');
            }
        });
    }
}
