<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\DB;

return new class extends Migration {
    public function up(): void
    {
        if (!DB::table('payment')->where('payment_type', 17)->exists()) {
            DB::table('payment')->insert([
                'payment_type' => 17,
                'payment_name' => 'Fizetés átvételkor (kártya)',
                'unique_identifier' => 'card_on_receipt',
                'image' => 'payment-pos-card.svg',
                'currency' => 'HUF',
                'environment' => 1,
                'is_available' => 1,
                'is_activate' => 1,
                'reorder_id' => 1,
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }

        DB::table('payment')->where('payment_type', 1)->where('payment_name', 'Fizetés átvételkor')
            ->update(['payment_name' => 'Fizetés átvételkor (készpénz)']);
        DB::table('payment')->where('payment_type', 1)->where('image', 'cod.png')
            ->update(['image' => 'payment-cash.svg']);
        DB::table('payment')->where('payment_type', 16)->where('image', 'paytab.png')
            ->update(['image' => 'payment-barion.svg']);
    }

    public function down(): void
    {
        // Keep payment type 17 so historical orders retain their payment label.
    }
};
