<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\FooterFeatures;
use App\Models\Order;
use App\Models\Pixcel;
use App\Models\Settings;
use App\Models\SocialLinks;
use Illuminate\Support\Facades\Validator;
use App\Helpers\helper;
use App\Support\SiteNavigation;
use Illuminate\Validation\Rule;
use Illuminate\Validation\ValidationException;

class SettingController extends Controller
{
    public function index()
    {
        $getsettings = Settings::first();
        $getfooterfeatures = FooterFeatures::get();
        $getsociallink = SocialLinks::get();
        $pixelsettings = Pixcel::first();
        $order = Order::get();
        return view('admin.cms.settings', compact('getsettings', 'getfooterfeatures', 'getsociallink', 'pixelsettings', 'order'));
    }
    public function delete_feature(Request $request)
    {
        FooterFeatures::where('id', $request->id)->delete();
        return redirect()->back()->with('success', trans('messages.success'));
    }
    public function delete_social_link(Request $request)
    {
        SocialLinks::where('id', $request->id)->delete();
        return redirect()->back()->with('success', trans('messages.success'));
    }





    public function settings_update(Request $request)
    {
        $imageFields = [
            'why_choose_image', 'og_image', 'app_bottom_image', 'mobile_app_image',
            'favicon', 'logo', 'footer_logo', 'faqs_image', 'auth_bg_image',
            'booknow_bg_image', 'refer_earn_bg_image', 'subscribe_newsletter_image',
            'no_data_image', 'image',
        ];
        $request->validate(array_fill_keys($imageFields, 'nullable|image|mimes:jpg,jpeg,png,webp,gif|max:4096'));
        $setting = $this->getOrCreateSettings();

        if ($request->boolean('admin_skin_update')) {
            abort_unless((int) auth()->user()->type === 1, 403);
            $validated = $request->validate([
                'admin_skin' => 'required|in:winter,spring,summer,autumn',
            ]);
            $setting->admin_skin = $validated['admin_skin'];
            $setting->save();
            return redirect()->back()->with('success', trans('messages.success'));
        }

        if ($request->boolean('navigation_update')) {
            abort_unless((int) auth()->user()->type === 1, 403);
            $validated = $request->validate([
                'navigation' => 'required|array',
                'navigation.mobile' => 'required|array|min:1|max:5',
                'navigation.footer_pages' => 'required|array|min:1|max:8',
                'navigation.footer_other' => 'required|array|min:1|max:8',
                'navigation.*.*.key' => ['required', Rule::in(array_keys(SiteNavigation::choices()))],
                'navigation.*.*.label' => 'nullable|string|max:32',
                'navigation.*.*.order' => 'required|integer|min:1|max:99',
                'navigation.*.*.enabled' => 'nullable|boolean',
            ]);
            $sections = [];
            foreach (['mobile', 'footer_pages', 'footer_other'] as $section) {
                $rows = $validated['navigation'][$section];
                $keys = array_column($rows, 'key');
                if (count($keys) !== count(array_unique($keys))) {
                    throw ValidationException::withMessages(['navigation' => 'Egy menüben minden céloldal csak egyszer szerepelhet.']);
                }
                foreach ($rows as $row) {
                    $sections[$section][] = [
                        'key' => $row['key'],
                        'label' => trim($row['label'] ?? ''),
                        'enabled' => (bool) ($row['enabled'] ?? false),
                        'order' => (int) $row['order'],
                    ];
                }
            }
            if (!collect($sections['mobile'])->contains('enabled', true)) {
                throw ValidationException::withMessages(['navigation' => 'Legalább egy alsó menüpont legyen aktív.']);
            }
            $setting->navigation_config = json_encode($sections, JSON_UNESCAPED_UNICODE | JSON_THROW_ON_ERROR);
            $setting->save();
            return redirect('admin/settings#navigation_settings')->with('success', trans('messages.success'));
        }

        if ($request->contact_update) {
            $this->updateContactSettings($setting, $request);
        }

        if ($request->firebase_key_update) {
            $setting->firebase = $request->firebase;
            $setting->save();
            return redirect('admin/notification')->with('success', trans('messages.success'));
        }

        if ($request->whychooseus_update) {
            $this->updateWhyChooseUsSettings($setting, $request);
            return redirect('admin/choose_us')->with('success', trans('messages.success'));
        }

        if ($request->seo_update) {
            $this->updateSeoSettings($setting, $request);
        }

        if ($request->notification_update) {
            $this->updateNotificationSettings($setting, $request);
        }

        if ($request->theme_update) {
            $setting->theme = $request->template ?? 1;
            $setting->save();
        }

        if ($request->business_update) {
            $this->updateBusinessSettings($setting, $request);
        }

        if ($request->mobileapp_update) {
            $this->updateMobileAppSettings($setting, $request);
        }

        if ($request->web_update) {
            $this->updateWebSettings($setting, $request);
        }

        if ($request->social_link_update) {
            $this->updateSocialLinks($request);
        }

        if ($request->footer_settings_update) {
            $this->updateFooterSettings($setting, $request);
        }

        if ($request->admin_update) {
            $setting->admin_primary_color = $request->admin_primary_color;
            $setting->admin_secondary_color = $request->admin_secondary_color;
            $setting->save();
        }

        if ($request->other_update) {
            $this->updateOtherSettings($setting, $request);
        }

        return redirect('admin/settings')->with('success', trans('messages.success'));
    }

    private function getOrCreateSettings()
    {
        return Settings::first() ?? new Settings();
    }

    private function updateContactSettings($setting, $request)
    {
        $setting->email = $request->email;
        $setting->mobile = $request->mobile;
        $setting->address = $request->address;
        $setting->address_url = $request->address_url;
        $setting->save();
    }

    private function updateWhyChooseUsSettings($setting, $request)
    {
        if ($request->hasFile('why_choose_image')) {
            $setting->why_choose_image = $this->handleFileUpload(
                $request->file('why_choose_image'),
                'why_choose_image',
                'admin-assets/images/about/',
                $setting->why_choose_image
            );
        }
        $setting->why_choose_title = $request->why_choose_title;
        $setting->why_choose_subtitle = $request->why_choose_subtitle;
        $setting->why_choose_description = $request->why_choose_description;
        $setting->save();
    }

    private function updateSeoSettings($setting, $request)
    {
        if ($request->hasFile('og_image')) {
            $setting->og_image = $this->handleFileUpload(
                $request->file('og_image'),
                'og_image',
                'admin-assets/images/about/',
                $setting->og_image
            );
        }
        $setting->og_title = $request->og_title;
        $setting->og_description = $request->og_description;
        $setting->save();
    }

    private function updateNotificationSettings($setting, $request)
    {
        $validator = Validator::make($request->all(), [
            'noti_tune' => 'nullable|mimes:mp3',
        ], [
            "noti_tune.required" => trans('messages.noti_tune_required'),
            "noti_tune.mimes" => trans('messages.noti_tune_must_mp3'),
        ]);

        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput();
        }

        if ($request->hasFile('noti_tune')) {
            $setting->notification_tune = $this->handleFileUpload(
                $request->file('noti_tune'),
                'notification',
                'admin-assets/notification/',
                $setting->notification_tune
            );
            $setting->save();
        }
    }

    private function updateBusinessSettings($setting, $request)
    {
        $setting->currency = $request->currency;
        $setting->currency_position = $request->currency_position;
        $setting->currency_space = $request->currency_space;
        $setting->currency_formate = $request->currency_formate;
        $setting->decimal_separator = $request->decimal_separator;
        $setting->time_format = $request->time_format;
        $setting->date_format = $request->date_format;
        $setting->referral_amount = $request->referral_amount;
        $setting->max_order_qty = $request->max_order_qty;
        $setting->min_order_amount = $request->min_order_amount;
        $setting->max_order_amount = $request->max_order_amount;
        $setting->order_prefix = $request->order_prefix;
        $setting->timezone = $request->timezone;
        $setting->maintenance_mode = $request->has('maintenance_mode') ? 1 : 2;
        $setting->online_table_booking = $request->has('online_table_booking') ? 1 : 2;
        $setting->login_required = $request->has('login_required') ? 1 : 2;
        $setting->is_checkout_login_required = $request->has('is_checkout_login_required') ? 1 : 2;
        $setting->pickup_delivery = $request->pickup_delivery;

        $order = Order::count();
        if ($order == 0 && !empty($request->order_number_start)) {
            $setting->order_number_start = $request->order_number_start;
        }

        $setting->save();
    }

    private function updateMobileAppSettings($setting, $request)
    {
        if ($request->hasFile('app_bottom_image')) {
            $setting->app_bottom_image = $this->handleFileUpload(
                $request->file('app_bottom_image'),
                'app_bottom_image',
                'admin-assets/images/about/',
                $setting->app_bottom_image
            );
        }

        if ($request->hasFile('mobile_app_image')) {
            $setting->mobile_app_image = $this->handleFileUpload(
                $request->file('mobile_app_image'),
                'mobile_app_image',
                'admin-assets/images/about/',
                $setting->mobile_app_image
            );
        }

        $setting->android = $request->android;
        $setting->ios = $request->ios;
        $setting->mobile_app_title = $request->mobile_app_title;
        $setting->mobile_app_description = $request->mobile_app_description;
        $setting->save();
    }

    private function updateWebSettings($setting, $request)
    {
        if ($request->hasFile('favicon')) {
            $setting->favicon = $this->handleFileUpload(
                $request->file('favicon'),
                'favicon',
                'admin-assets/images/about/',
                $setting->favicon
            );
        }

        if ($request->hasFile('logo')) {
            $setting->logo = $this->handleFileUpload(
                $request->file('logo'),
                'logo',
                'admin-assets/images/about/',
                $setting->logo
            );
        }

        $setting->web_primary_color = $request->web_primary_color;
        $setting->web_secondary_color = $request->web_secondary_color;
        $setting->copyright = $request->copyright;
        $setting->title = $request->title;
        $setting->short_title = $request->short_title;
        $setting->save();
    }

    private function updateSocialLinks($request)
    {
        if (!empty($request->social_icon)) {
            foreach ($request->social_icon as $key => $icon) {
                if (!empty($icon) && !empty($request->social_link[$key])) {
                    SocialLinks::create([
                        'icon' => $icon,
                        'link' => $request->social_link[$key],
                    ]);
                }
            }
        }

        if (!empty($request->edit_icon_key)) {
            foreach ($request->edit_icon_key as $key => $id) {
                $sociallink = SocialLinks::find($id);
                $sociallink->icon = $request->edit_sociallink_icon[$id];
                $sociallink->link = $request->edit_sociallink_link[$id];
                $sociallink->save();
            }
        }
    }

    private function updateFooterSettings($setting, $request)
    {
        if ($request->hasFile('footer_logo')) {
            $setting->footer_logo = $this->handleFileUpload(
                $request->file('footer_logo'),
                'footer',
                'admin-assets/images/about/',
                $setting->footer_logo
            );
        }

        if (!empty($request->feature_icon)) {
            foreach ($request->feature_icon as $key => $icon) {
                if (!empty($icon) && !empty($request->feature_title[$key]) && !empty($request->feature_description[$key])) {
                    FooterFeatures::create([
                        'icon' => $icon,
                        'title' => $request->feature_title[$key],
                        'description' => $request->feature_description[$key],
                    ]);
                }
            }
        }

        if (!empty($request->edit_icon_key)) {
            foreach ($request->edit_icon_key as $key => $id) {
                $feature = FooterFeatures::find($id);
                $feature->icon = $request->edi_feature_icon[$id];
                $feature->title = $request->edi_feature_title[$id];
                $feature->description = $request->edi_feature_description[$id];
                $feature->save();
            }
        }

        $setting->footer_title = $request->footer_title;
        $setting->footer_description = $request->footer_description;
        $setting->save();
    }

    private function updateOtherSettings($setting, $request)
    {
        $images = [
            'faqs_image' => 'faqs_image',
            'auth_bg_image' => 'auth_bg_image',
            'booknow_bg_image' => 'booknow_bg_image',
            'refer_earn_bg_image' => 'refer_earn_bg_image',
            'subscribe_newsletter_image' => 'subscribe_newsletter_image',
            'no_data_image' => 'no_data_image',
            'image' => 'order_success',
        ];

        foreach ($images as $key => $prefix) {
            if ($request->hasFile($key)) {
                $setting->$key = $this->handleFileUpload(
                    $request->file($key),
                    $prefix,
                    'admin-assets/images/about/',
                    $setting->$key
                );
            }
        }

        $setting->google_review_url = $request->google_review_url;
        $setting->save();
    }

    private function handleFileUpload($file, $prefix, $path, $existingFile = null)
    {
        if ($existingFile && file_exists(public_path($path . $existingFile))) {
            unlink(public_path($path . $existingFile));
        }

        $filename = $prefix . '-' . uniqid('', true) . '.' . $file->getClientOriginalExtension();
        $file->move(public_path($path), $filename);

        return $filename;
    }

    public function toggleDelivery()
    {
        abort_unless(auth()->check() && in_array((int) auth()->user()->type, [1, 4], true), 403);
        $current = (int) helper::app_setting('delivery_enabled', 1);
        $new = $current ? 0 : 1;
        helper::set_app_setting('delivery_enabled', (string)$new);

        return back()->with('success', $new
            ? 'Kiszállítás bekapcsolva.'
            : 'Kiszállítás kikapcsolva.');
    }
}
