<?php

namespace App\Console\Commands;

use App\Models\User;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\Hash;

class FoodProAdminPassword extends Command
{
    protected $signature = 'foodpro:admin-password {email=admin@foodpro.local}';

    protected $description = 'Set the initial Food Pro administrator password interactively.';

    public function handle(): int
    {
        $email = strtolower(trim((string) $this->argument('email')));
        if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
            $this->error('Adj meg érvényes e-mail címet.');
            return self::FAILURE;
        }

        $password = $this->secret('Új admin jelszó (legalább 12 karakter)');
        $confirmation = $this->secret('Jelszó ismét');
        if (!is_string($password) || strlen($password) < 12 || $password !== $confirmation) {
            $this->error('A jelszavak nem egyeznek, vagy a jelszó túl rövid.');
            return self::FAILURE;
        }

        $admin = User::where('type', 1)->first() ?? new User();
        $admin->name = $admin->name ?: 'Food Pro Admin';
        $admin->email = $email;
        $admin->profile_image = $admin->profile_image ?: 'unknown.png';
        $admin->password = Hash::make($password);
        $admin->login_type = 'email';
        $admin->type = 1;
        $admin->token = '';
        $admin->is_available = 1;
        $admin->is_deleted = 2;
        $admin->is_verified = 1;
        $admin->save();

        $this->info('Az admin jelszó beállítva: ' . $email);
        return self::SUCCESS;
    }
}
