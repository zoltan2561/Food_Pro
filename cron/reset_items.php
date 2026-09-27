<?php
// public_html/cron/reset_items.php
declare(strict_types=1);

require __DIR__ . '/../vendor/autoload.php';
$app = require __DIR__ . '/../bootstrap/app.php';

/** @var \Illuminate\Contracts\Console\Kernel $kernel */
$kernel = $app->make(\Illuminate\Contracts\Console\Kernel::class);
$status = $kernel->call('items:reset-7am'); // <- az Artisan parancsod

// Írjunk ki valamit, hogy a "View Output"-ban is lásd
echo date('Y-m-d H:i:s T') . " | items:reset-7am exit={$status}\n";
echo trim($kernel->output()) . "\n";
