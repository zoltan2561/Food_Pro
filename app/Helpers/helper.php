<?php

namespace App\Helpers;

use App\Models\Roles;
use App\Models\Cart;
use App\Models\Category;
use App\Models\Payment;
use App\Models\Order;
use App\Models\FooterFeatures;
use App\Models\Ratting;
use App\Models\User;
use App\Models\Time;
use App\Models\Languages;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Str;
use Session;
use App;
use App\Models\WhatsappMessage;
use App\Models\CustomStatus;
use App\Models\Promocode;
use App\Models\Settings;
use App\Models\SocialLinks;
use App\Models\SystemAddons;
use App\Models\AgeVerification;
use App\Models\Tax;
use App\Models\TopDeals;
use Carbon\Carbon;
use App\Models\AppSetting;
use Illuminate\Support\Facades\Password;


class helper
{
    public static function push_notification($token, $title, $body, $type, $order_id)
    {
        if (empty($token) || empty(helper::appdata()->firebase)) {
            return false;
        }
        $customdata = array(
            "type" => $type,
            'sub_type' => "",
            'category_id' => "",
            'category_name' => "",
            'item_id' => "",
            "order_id" => $order_id,
        );
        if ($title == "") {
            $title = @helper::appdata()->website_title;
        }
        $msg = array(
            'body' => $body,
            'title' => $title,
            'sound' => 1/*Default sound*/
        );
        $fields = array(
            'to'           => $token,
            'notification' => $msg,
            'data' => $customdata
        );
        $headers = array(
            'Authorization: key=' . @helper::appdata()->firebase,
            'Content-Type: application/json'
        );
        #Send Reponse To FireBase Server
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, 'https://fcm.googleapis.com/fcm/send');
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($fields));
        $result = curl_exec($ch);
        curl_close($ch);
        return $result;
    }
    public static function image_path($image)
    {
        $fallback = asset('admin-assets/images/item-placeholder.png');
        $filename = basename((string) $image);
        if ($filename === '' || $filename === '.' || $filename === '..') return $fallback;

        $foodProImage = 'foodpro-assets/' . $filename;
        if (is_file(public_path($foodProImage))) return asset($foodProImage);

        foreach (['item', 'category', 'profile', 'banner', 'slider', 'theme', 'reviews', 'about', 'about/payment', 'language', ''] as $directory) {
            $relative = 'admin-assets/images/' . ($directory !== '' ? $directory . '/' : '') . $filename;
            if (is_file(public_path($relative))) return asset($relative);
        }
        return $fallback;
    }
    public static function web_image_path($image)
    {
        $filename = basename((string) $image);
        $relative = 'web-assets/images/' . $filename;
        return $filename !== '' && is_file(public_path($relative))
            ? asset($relative)
            : asset('admin-assets/images/item-placeholder.png');
    }
    public static function verificationemail($email, $otp)
    {
        // magyar fordítások
        \App::setLocale(config('app.locale', 'hu'));
        \Carbon\Carbon::setLocale(config('app.locale', 'hu'));

        // teljes URL a logóhoz (sok kliens utálja a relatív/asset-only linket)
        $logoUrl = url(\helper::image_path(@helper::appdata()->logo));

        $data = [
            'title' => trans('messages.email_code'),
            'email' => $email,
            'otp'   => $otp,
            'logo'  => $logoUrl,
        ];

        try {
            // from név/cím a mail konfigból (vagy fallback)
            $fromAddress = data_get(config('mail'), 'from.address', env('MAIL_FROM_ADDRESS'));
            $fromName    = data_get(config('mail'), 'from.name',    env('MAIL_FROM_NAME', config('app.name', 'Restaurant Ordering')));

            \Illuminate\Support\Facades\Mail::send('email.emailverification', $data, function ($message) use ($data, $fromAddress, $fromName) {
                if ($fromAddress) {
                    $message->from($fromAddress, $fromName);
                    $message->replyTo($fromAddress, $fromName);
                }
                $message->to($data['email'])->subject($data['title']);
            });

            // Symfony Mailer alatt nincs Mail::failures(), ezért try/catch elég
            return 1;

        } catch (\Throwable $th) {
            // fontos: lásd, mi a hiba (DNS/SPF/DKIM, auth, timeouts, stb.)
            \Log::error('verificationemail send failed: '.$th->getMessage(), [
                'email' => $email,
            ]);
            return 0;
        }
    }


    public static function send_pass($email, $name = null, $password = null)
    {
        try {
            // csak az emailt küldjük a Password brokernek
            $status = Password::sendResetLink(['email' => $email]);

            if ($status === Password::RESET_LINK_SENT) {
                \Log::info("Password reset link sent to {$email}");
                return true;
            } else {
                \Log::warning("Password reset failed for {$email}", ['status' => $status]);
                return false;
            }
        } catch (\Throwable $e) {
            \Log::error('Password reset error', ['error' => $e->getMessage()]);
            return false;
        }
    }
    public static function referral($email, $name, $toname, $referralmessage)
    {
        $data = ['title' => trans('labels.referral_earning'), 'email' => $email, 'name' => $name, 'toname' => $toname, 'logo' => helper::image_path(@helper::appdata()->logo), 'referralmessage' => $referralmessage];
        try {
            Mail::send('email.referral', $data, function ($message) use ($data) {
                $message->to($data['email'])->subject($data['title']);
            });
            return 1;
        } catch (\Throwable $th) {
            return 0;
        }
    }
    public static function create_order_invoice($user_email, $user_name, $order_number, $orderdata, $itemdata)
    {
        $data = ['title' => trans('labels.order_placed'), 'email' => $user_email, 'name' => $user_name, 'order_number' => $order_number, 'orderdata' => $orderdata, 'itemdata' => $itemdata, 'logo' => helper::image_path(@helper::appdata()->logo)];
        try {
            Mail::send('email.emailinvoice', $data, function ($message) use ($data) {
                $message->to($data['email'])->subject($data['title']);
            });
            return 1;
        } catch (\Throwable $th) {
            return 0;
        }
    }
    public static function order_status_email($email, $name, $title, $message_text)
    {
        $data = ['email' => $email, 'name' => $name, 'title' => $title, 'message_text' => $message_text, 'logo' => helper::image_path(@helper::appdata()->logo)];
        try {
            Mail::send('email.orderemail', $data, function ($message) use ($data) {
                $message->to($data['email'])->subject($data['title']);
            });
            return 1;
        } catch (\Throwable $th) {
            return 0;
        }
    }
    public static function get_roles()
    {
        $data = Roles::select('modules')->where('id', Auth::user()->role_id)->first();
        return @$data->modules;
    }
    public static function get_user_cart()
    {
        $count = 0;
        if (Auth::check() && (int) Auth::user()->type === 2) {
            $count = Cart::where('user_id', Auth::user()->id)->where('buynow', 0)->count();
        } else {
            $count = Cart::where('session_id', Session::getId())->where('buynow', 0)->count();
        }
        return $count;
    }
    public static function currency_format($price)
    {
        $price = (float)$price;
        if (@helper::appdata()->currency_position == "1") {
            if (@helper::appdata()->decimal_separator == "1") {
                if (@helper::appdata()->currency_space == "1") {
                    return @helper::appdata()->currency . ' ' . number_format($price, @helper::appdata()->currency_formate, '.', ',');
                } else {
                    return @helper::appdata()->currency . number_format($price, @helper::appdata()->currency_formate, '.', ',');
                }
            } else {
                if (@helper::appdata()->currency_space == "1") {
                    return @helper::appdata()->currency . ' ' . number_format($price, @helper::appdata()->currency_formate, ',', '.');
                } else {
                    return @helper::appdata()->currency . number_format($price, @helper::appdata()->currency_formate, ',', '.');
                }
            }
        }
        if (@helper::appdata()->currency_position == "2") {
            if (@helper::appdata()->decimal_separator == "1") {
                if (@helper::appdata()->currency_space == "1") {
                    return number_format($price, @helper::appdata()->currency_formate, '.', ',') . ' ' . @helper::appdata()->currency;
                } else {
                    return number_format($price, @helper::appdata()->currency_formate, '.', ',') . @helper::appdata()->currency;
                }
            } else {
                if (@helper::appdata()->currency_space == "1") {
                    return number_format($price, @helper::appdata()->currency_formate, ',', '.') . ' ' . @helper::appdata()->currency;
                } else {
                    return number_format($price, @helper::appdata()->currency_formate, ',', '.') . @helper::appdata()->currency;
                }
            }
        }
    }
    public static function appdata()
    {
        $data = Settings::select('*', \DB::raw("CONCAT('" . url(env('ASSETSPATHURL') . 'admin-assets/images/about') . "/', app_bottom_image) AS app_bottom_image_url"), \DB::raw("CONCAT('" . url(env('ASSETSPATHURL') . 'admin-assets/images/about') . "/', booknow_bg_image) AS booknow_bg_image_url"), \DB::raw("CONCAT('" . url(env('ASSETSPATHURL') . 'admin-assets/images/about') . "/', why_choose_image) AS why_choose_image_url"), \DB::raw('(case when app_bottom_image is null then 0 else 1 end) as is_app_bottom_image'),)->first();
        return $data;
    }
    public static function stripe_data()
    {
        return Payment::select('environment', 'public_key', 'secret_key', 'currency')->where('payment_type', '=', 4)->where('is_available', 1)->first();
    }
    public static function check_alert()
    {
        if (@helper::appdata()->max_order_qty != "" && @helper::appdata()->min_order_amount != "" && @helper::appdata()->max_order_amount != "" && @helper::appdata()->address != "" && @helper::appdata()->firebase != "") {
            return 1;
        } else {
            return 0;
        }
    }
    public static function check_restaurant_closed()
    {
        if (@helper::appdata()->timezone != "") {
            date_default_timezone_set(helper::appdata()->timezone);
        }
        $checkstatus = User::find(Auth::user()->id);
        return $checkstatus->is_online;
    }

    public static function date_format($date)
    {
        return date(helper::appdata()->date_format, strtotime($date));
    }

    public static function time_format($time)
    {
        if (helper::appdata()->time_format == 1) {
            return \Carbon\Carbon::parse($time)->format('H:i');
        } else {
            return \Carbon\Carbon::parse($time)->format('h:i A');
        }
    }
    public static function order_time($time)
    {
        return $time === \App\Support\OrderTiming::ASAP ? trans('checkout.asap') : $time;
    }
    public static function number_format($number)
    {
        // $number = (float)$number;
        // return number_format($number, 2, '.', '');
        return $number;
    }
    public static function gettype($status, $type, $order_type)
    {
        $status = CustomStatus::where('order_type', $order_type)->where('type', $type)->where('id', $status)->first();
        return $status;
    }
    public static function customstauts($order_type)
    {
        $status = CustomStatus::where('order_type', $order_type)->where('is_available', 1)->where('is_deleted', 2)->orderBy('reorder_id')->get();
        return $status;
    }

    public static function check_review_exist($user_id, $item_id)
    {
        $data = Ratting::where('user_id', $user_id)->where('item_id', $item_id)->first();
        if (!empty($data)) {
            return 1;
        }
        return 0;
    }
    public static function get_theme()
    {
        $setting = Settings::first();
        return $setting->theme;
    }
    public static function emailconfigration()
    {
        return config('mail');
    }




    // front
    public static function gettax($tax_id)
    {
        $taxArr = explode(',', $tax_id);
        $taxes = [];
        foreach ($taxArr as $tax) {
            $taxes[] = Tax::find($tax);
        }
        return $taxes;
    }



    public static function footer_features()
    {
        return FooterFeatures::select('id', 'icon', 'title', 'description')->orderByDesc('id')->get();
    }

    public static function get_categories()
    {
        return Category::with('item_info')->select('id', 'category_name', 'slug', 'image')->where('is_available', '=', '1')->where('is_deleted', '2')->orderBy('reorder_id')->get();
    }
    public static function get_item_cart($item_id)
    {
        if (Auth::check() && (int) Auth::user()->type === 2) {
            return Cart::where('item_id', $item_id)->where('user_id', Auth::user()->id)->where('buynow', 0)->sum('qty');
        } else {
            return Cart::where('item_id', $item_id)->where('session_id', Session::getId())->where('buynow', 0)->sum('qty');
        }
    }

    public static function language()
    {
        $lang = Languages::where('is_available', '1')->get();
        if (session()->get('locale') == null) {
            $layout = Languages::select('name', 'layout', 'image', 'is_default', 'code')->where('is_default', 1)->first();
            App::setLocale($layout->code);
            session()->put('locale', $layout->code);
            session()->put('language', $layout->name);
            session()->put('flag', $layout->image);
            session()->put('direction', $layout->layout);
        } else {
            $layout = Languages::select('name', 'layout', 'image', 'is_default', 'code')->where('code', session()->get('locale'))->first();
            App::setLocale(session()->get('locale'));
            session()->put('locale', @$layout->code);
            session()->put('language', @$layout->name);
            session()->put('flag', @$layout->image);
            session()->put('direction', @$layout->layout);
        }
        return $lang;
    }

    // get language list vendor side.
    public static function available_language($vendor_id)
    {
        if ($vendor_id == "") {
            $listoflanguage = Languages::where('is_available', '1')->where('is_deleted', 2)->get();
        } else {
            $listoflanguage = Languages::where('is_deleted', 2)->get();
        }
        return $listoflanguage;
    }

    public static function getcouponcodecount($offer_code)
    {
        $count = Order::select('offer_code')->where('offer_code', $offer_code)->count();
        return $count;
    }
    public static function getoffers()
    {
        $offers = Promocode::where('is_available', 1)->where('start_date', '<=', Carbon::now()->format('Y-m-d'))->where('expire_date', '>=', Carbon::now()->format('Y-m-d'))->orderBy('id', 'desc')->get();
        return $offers;
    }

    // display dynamic paymant name
    public static function getpayment($payment_type)
    {
        $payment = Payment::select('payment_name')->where('payment_type', $payment_type)->first();
        return $payment->payment_name;
    }
    public static function paymentlist()
    {
        $payment = Payment::select('image')->where('is_available', 1)->get();
        return $payment;
    }

    public static function gettime()
    {
        $gettimings = Time::all();
        return $gettimings;
    }
    public static function getwhatsappmessage()
    {
        $data = WhatsappMessage::first();
        return $data;
    }
    public static function sociallinks()
    {
        $getsociallinks = SocialLinks::all();
        return $getsociallinks;
    }
    public static function top_deals()
    {
        date_default_timezone_set(helper::appdata()->timezone);
        $current_date  = Carbon::now()->format('Y-m-d');
        $current_time  = Carbon::now()->format('H:i:s');
        $topdeal = TopDeals::first();
        $topdeals = null;
        if (@helper::checkaddons('top_deals')) {
            if (isset($topdeal) && $topdeal->top_deals_switch == 1) {
                $startDate = $topdeal['start_date'];
                $starttime = $topdeal['start_time'];
                $endDate = $topdeal['end_date'];
                $endtime = $topdeal['end_time'];
                // Checking validity of top deal offer
                if ($topdeal->deal_type == 1) {
                    if ($current_date > $startDate) {
                        if ($current_date < $endDate) {
                            $topdeals = TopDeals::first();
                        } elseif ($current_date == $endDate) {
                            if ($current_time < $endtime) {
                                $topdeals = TopDeals::first();
                            }
                        }
                    } elseif ($current_date == $startDate) {
                        if ($current_date < $endDate && $current_time >= $starttime) {
                            $topdeals = TopDeals::first();
                        } elseif ($current_date == $endDate) {
                            if ($current_time >= $starttime && $current_time <= $endtime) {
                                $topdeals = TopDeals::first();
                            }
                        }
                    }
                } else if ($topdeal->deal_type == 2) {
                    if ($current_time >= $starttime && $current_time <= $endtime) {
                        $topdeals = TopDeals::first();
                    }
                }
            }
        }
        return $topdeals;
    }

    public static function getagedetails()
    {
        $agedetails = AgeVerification::first();
        return $agedetails;
    }

    public static function checkaddons($addons)
    {
        if (str_contains(url()->current(), 'admin')) {
            if (session()->get('demo') == "free-addon") {
                $check = SystemAddons::where('unique_identifier', $addons)->where('activated', 1)->where('type', 1)->first();
            } elseif (session()->get('demo') == "all-addon") {
                $check = SystemAddons::where('unique_identifier', $addons)->where('activated', 1)->whereIn('type', ['1', '2'])->first();
            } else {
                $check = SystemAddons::where('unique_identifier', $addons)->where('activated', 1)->first();
            }
        } else {
            $check = SystemAddons::where('unique_identifier', $addons)->where('activated', 1)->first();
        }

        return $check;
    }




    public static function checkthemeaddons($addons)
    {
        if (session()->get('demo') == "free-addon") {
            $check = SystemAddons::where('unique_identifier', 'LIKE', '%' . $addons . '%')->where('activated', 1)->where('type', 1)->get();
        } elseif (session()->get('demo') == "all-addon") {
            $check = SystemAddons::where('unique_identifier', 'LIKE', '%' . $addons . '%')->where('activated', 1)->whereIn('type', ['1', '2', '3'])->get();
        } else {
            $check = SystemAddons::where('unique_identifier', 'LIKE', '%' . $addons . '%')->where('activated', 1)->get();
        }
        return $check;
    }

//delivery kaplcsolohoz
    // delivery kapcsolóhoz
    public static function app_setting(string $key, $default = null)
    {
        return cache()->remember("app_setting:$key", 60, fn() => AppSetting::get($key, $default));
    }

    public static function set_app_setting(string $key, $value)
    {
        AppSetting::set($key, $value);
        cache()->forget("app_setting:$key");
        return $value;
    }


}
