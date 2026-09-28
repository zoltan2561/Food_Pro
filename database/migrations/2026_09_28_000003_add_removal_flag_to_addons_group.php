<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void
    {
        Schema::table('addons_group', function (Blueprint $table): void {
            $table->boolean('is_removal')->default(false);
        });

        DB::table('addons_group')->where('name', 'Kihagyandó összetevők')->update(['is_removal' => true]);
    }

    public function down(): void
    {
        Schema::table('addons_group', function (Blueprint $table): void {
            $table->dropColumn('is_removal');
        });
    }
};
