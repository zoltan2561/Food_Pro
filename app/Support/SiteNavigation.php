<?php

namespace App\Support;

use App\Models\Settings;
use App\Helpers\helper;

class SiteNavigation
{
    private const TARGETS = [
        'home' => ['route' => 'home', 'label' => 'home', 'icon' => 'fa-house'],
        'search' => ['route' => 'search', 'label' => 'search', 'icon' => 'fa-magnifying-glass'],
        'cart' => ['route' => 'cart', 'label' => 'cart', 'icon' => 'fa-bag-shopping'],
        'wishlist' => ['route' => 'user-favouritelist', 'label' => 'favourite_list', 'icon' => 'fa-heart'],
        'account' => ['route' => 'user-profile', 'label' => 'account', 'icon' => 'fa-user'],
        'menu' => ['route' => 'categories', 'label' => 'menu', 'icon' => 'fa-utensils'],
        'orders' => ['route' => 'order-history', 'label' => 'my_orders', 'icon' => 'fa-receipt'],
        'contact' => ['route' => 'contact-us', 'label' => 'help_contact_us', 'icon' => 'fa-envelope'],
        'faq' => ['route' => 'faq', 'label' => 'faq', 'icon' => 'fa-circle-question'],
        'gallery' => ['route' => 'gallery', 'label' => 'gallery', 'icon' => 'fa-images'],
        'about' => ['route' => 'about-us', 'label' => 'about', 'icon' => 'fa-circle-info'],
        'privacy' => ['route' => 'privacy-policy', 'label' => 'privacy_policy', 'icon' => 'fa-shield'],
        'refund' => ['route' => 'refund-policy', 'label' => 'refund_policy', 'icon' => 'fa-truck'],
        'terms' => ['route' => 'terms-conditions', 'label' => 'terms_condition', 'icon' => 'fa-file-lines'],
        'allergens' => ['route' => 'allergens', 'label' => 'allergen_table', 'icon' => 'fa-list'],
        'blog' => ['route' => 'blogs', 'label' => 'blogs', 'icon' => 'fa-newspaper'],
    ];

    private const DEFAULTS = [
        'mobile' => ['home', 'search', 'cart', 'wishlist', 'account'],
        'footer_pages' => ['about', 'privacy', 'refund', 'terms', 'allergens'],
        'footer_other' => ['menu', 'faq', 'contact', 'gallery', 'blog'],
    ];

    public static function choices(): array
    {
        return self::TARGETS;
    }

    public static function slots(string $section, ?Settings $settings = null): array
    {
        if (!isset(self::DEFAULTS[$section])) {
            return [];
        }

        $settings = $settings ?? Settings::first();
        $stored = json_decode($settings->navigation_config ?? '', true);
        $rows = is_array($stored) && isset($stored[$section]) && is_array($stored[$section])
            ? $stored[$section] : self::DEFAULTS[$section];
        $slots = [];
        foreach ($rows as $index => $row) {
            $key = is_array($row) ? ($row['key'] ?? '') : $row;
            if (!isset(self::TARGETS[$key])) {
                continue;
            }
            $slots[] = [
                'key' => $key,
                'label' => is_array($row) ? trim((string) ($row['label'] ?? '')) : '',
                'enabled' => is_array($row) ? (bool) ($row['enabled'] ?? false) : true,
                'order' => is_array($row) ? (int) ($row['order'] ?? $index + 1) : $index + 1,
            ];
        }
        usort($slots, fn ($a, $b) => $a['order'] <=> $b['order']);
        return $slots;
    }

    public static function links(string $section, ?Settings $settings = null): array
    {
        $links = [];
        foreach (self::slots($section, $settings) as $slot) {
            if (!$slot['enabled'] || ($slot['key'] === 'blog' && !helper::checkaddons('blog'))) {
                continue;
            }
            $target = self::TARGETS[$slot['key']];
            $route = $target['route'];
            if (!auth()->check() && in_array($slot['key'], ['wishlist', 'account', 'orders'], true)) {
                $route = 'login';
            }
            $links[] = [
                'key' => $slot['key'],
                'label' => $slot['label'] !== '' ? $slot['label'] : trans('labels.' . $target['label']),
                'icon' => $target['icon'],
                'url' => route($route),
                'active' => request()->routeIs($target['route']),
            ];
        }
        return $links;
    }
}
