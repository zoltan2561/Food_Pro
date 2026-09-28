<?php

use Illuminate\Contracts\Http\Kernel;
use Illuminate\Http\Request;

define('LARAVEL_START', microtime(true));

// Place this file in public_html, with foodpro-app beside public_html.
$applicationRoot = dirname(__DIR__) . '/foodpro-app';

if (file_exists($maintenance = $applicationRoot . '/storage/framework/maintenance.php')) {
    require $maintenance;
}

require $applicationRoot . '/vendor/autoload.php';

$app = require_once $applicationRoot . '/bootstrap/app.php';
$app->instance('path.public', __DIR__);

$kernel = $app->make(Kernel::class);
$response = $kernel->handle($request = Request::capture())->send();
$kernel->terminate($request, $response);
