<?php

use Illuminate\Contracts\Http\Kernel;
use Illuminate\Http\Request;

define('LARAVEL_START', microtime(true));

if (file_exists($maintenance = dirname(__DIR__) . '/storage/framework/maintenance.php')) {
    require $maintenance;
}

require dirname(__DIR__) . '/vendor/autoload.php';

$app = require_once dirname(__DIR__) . '/bootstrap/app.php';
$kernel = $app->make(Kernel::class);

$response = $kernel->handle($request = Request::capture())->send();
$kernel->terminate($request, $response);
