<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;

class Shippingarea extends Model
{
    use HasFactory;
    protected $table = 'shipping_area';

    public static function matchingCity(?string $city): ?self
    {
        $name = self::normalizedPlace($city);
        if ($name === '') {
            return null;
        }

        $matches = self::all()->filter(function (self $area) use ($name) {
            $zone = self::normalizedPlace($area->name);
            return $zone === $name || str_starts_with($zone, $name . ' ');
        });

        // Several zones with the same town name require an explicit choice.
        return $matches->count() === 1 ? $matches->first() : null;
    }

    private static function normalizedPlace(?string $value): string
    {
        $plain = strtolower(Str::ascii(trim((string) $value)));
        $plain = preg_replace('/^[0-9]{4}\s+/', '', $plain);
        return trim(preg_replace('/[^a-z0-9]+/', ' ', $plain));
    }
}
