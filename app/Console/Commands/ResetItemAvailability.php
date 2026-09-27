<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;

class ResetItemAvailability extends Command
{
    // Parancs neve
    protected $signature = 'items:reset-7am';

    protected $description = 'Visszaállítja az itemeket elérhetőre, ha today_unavailable=1 és unavailable_date < mai nap.';

    public function handle()
    {
        // Budapest szerinti "mai nap" biztosítására
        $today = Carbon::today('Europe/Budapest');

        // Ugyanaz a feltétel, mint az SQL-ben, DATETIME esetére is jó:
        $affected = DB::table('item')
            ->where('today_unavailable', 1)
            ->whereDate('unavailable_date', '<', $today)
            ->update([
                'item_status'       => 1,
                'today_unavailable' => 0,
                'unavailable_date'  => null,
                'updated_at'        => now('Europe/Budapest'),
            ]);

        $this->info("Frissítve: {$affected} sor.");
        return self::SUCCESS;
    }
}
