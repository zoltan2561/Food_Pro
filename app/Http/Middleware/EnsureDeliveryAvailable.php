<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use App\Helpers\helper;
//TODO:bekötni élesben is
class EnsureDeliveryAvailable
{
    public function handle(Request $request, Closure $next)
    {
        // 1 = kiszállítás, 2 = elvitel
        $orderType = (int) (
            $request->input('order_type')
            ?? $request->input('modal_order_type')
            ?? $request->input('modal_ordertype')
            ?? 1
        );

        $deliveryOn = (int) helper::app_setting('delivery_enabled', 1) === 1;

        if ($orderType === 1 && !$deliveryOn) {
            // NÉMÁN kényszerítsük elvitelre
            $request->merge([
                'order_type'       => 2,
                'modal_order_type' => 2,
                'modal_ordertype'  => 2,

                // Szállítás-specifikus mezők kinullázása
                'delivery_charge'  => 0,
                'shipping_charge'  => 0,
                'delivery_area'    => null,
                'delivery_time'    => null,
                'delivery_date'    => null,
            ]);
        }

        return $next($request);
    }
}
