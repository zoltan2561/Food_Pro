<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void
    {
        foreach (['cart', 'order_details'] as $tableName) {
            Schema::table($tableName, function (Blueprint $table): void {
                $table->text('without_addons')->nullable();
                $table->text('item_notes')->nullable();
            });
        }
    }

    public function down(): void
    {
        foreach (['cart', 'order_details'] as $tableName) {
            Schema::table($tableName, function (Blueprint $table): void {
                $table->dropColumn(['without_addons', 'item_notes']);
            });
        }
    }
};
