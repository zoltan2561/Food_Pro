@php
    $adminPages = [
        'home' => 'overview', 'orders' => 'orders', 'invoice' => 'order_details', 'report' => 'report',
        'item' => 'items', 'category' => 'categories', 'sub-category' => 'subcategories',
        'addongroup' => 'addon_groups', 'addons' => 'addons', 'global_extras' => 'global_extras',
        'tax' => 'tax', 'shippingarea' => 'shipping', 'time' => 'hours', 'payment' => 'payment',
        'settings' => 'settings', 'bookings' => 'bookings', 'users' => 'customers', 'driver' => 'drivers',
        'employee' => 'employees', 'roles' => 'roles', 'promocode' => 'coupons', 'slider' => 'sliders',
        'bannersection-1' => 'banners', 'bannersection-2' => 'banners', 'bannersection-3' => 'banners', 'bannersection-4' => 'banners',
        'language-settings' => 'language', 'faq' => 'faq', 'gallery' => 'gallery', 'contact' => 'contact', 'subscribe' => 'newsletter',
        'aboutus' => 'website_content', 'privacypolicy' => 'website_content', 'refundpolicy' => 'website_content', 'termscondition' => 'website_content',
    ];
    $adminPageKey = null;
    foreach ($adminPages as $prefix => $key) {
        if (request()->is('admin/' . $prefix, 'admin/' . $prefix . '/*', 'admin/' . $prefix . '-*')) {
            $adminPageKey = $key;
            break;
        }
    }
@endphp
@if ($adminPageKey)
    <section class="admin-page-intro" aria-labelledby="admin-page-title">
        <h1 id="admin-page-title">{{ trans('admin_ui.' . $adminPageKey) }}</h1>
        <p>{{ trans('admin_ui.' . $adminPageKey . '_help') }}</p>
    </section>
@endif
