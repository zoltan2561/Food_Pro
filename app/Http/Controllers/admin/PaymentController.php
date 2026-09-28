<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Payment;
use App\Models\BarionSetting;

class PaymentController extends Controller
{
    public function index()
    {
        $getpayment = Payment::where('is_activate', 1)->whereIn('payment_type', [1, 17, 16])->orderBy('reorder_id')->get();
        $barionSetting = BarionSetting::where('env', 'test')->first();
        return view('admin.payment.payment', compact('getpayment', 'barionSetting'));
    }

    public function update(Request $request)
    {
        $request->validate([
            'payment_id' => 'required|integer',
            'name' => 'required|string|max:255',
            'image' => 'nullable|image|mimes:jpg,jpeg,png,webp,gif|max:4096',
        ]);
        $pay_data = Payment::where('payment_type', $request->payment_id)->firstOrFail();
        abort_unless(in_array((int) $pay_data->payment_type, [1, 17, 16], true), 403);

        if ((int) $pay_data->payment_type === 16) {
            abort_unless((int) auth()->user()->type === 1, 403);
            $request->validate([
                'barion_shop_email' => 'nullable|email|max:190',
                'barion_poskey' => 'nullable|string|max:64',
            ]);
            $barionSetting = BarionSetting::where('env', 'test')->firstOrFail();
            if ($request->filled('barion_poskey')) {
                $barionSetting->poskey = trim($request->barion_poskey);
            }
            $barionSetting->shop_email = trim((string) $request->input('barion_shop_email', ''));
            $barionSetting->redirect_url = route('barion.after');
            $barionSetting->callback_url = route('barion.callback');

            $enable = $request->has('is_available') && isset($request->is_available[16]);
            if ($enable && (trim((string) $barionSetting->poskey) === '' || $barionSetting->shop_email === '')) {
                return redirect()->back()->withErrors([
                    'barion' => 'A Barion tesztmód bekapcsolásához add meg a sandbox POSKey-t és a kereskedői e-mail címet.',
                ]);
            }

            $barionSetting->is_enabled = 1;
            $barionSetting->save();
            BarionSetting::where('env', 'prod')->update(['is_enabled' => 0]);
            $pay_data->environment = 1;
        }

        $pay_data->is_available = (int) $request->input('is_available.' . $pay_data->payment_type) === 1 ? 1 : 2;
        $pay_data->payment_name = $request->name;

        if (

            $request->payment_id == 3 ||
            $request->payment_id == 4 ||
            $request->payment_id == 5 ||
            $request->payment_id == 6 ||
            $request->payment_id == 7 ||
            $request->payment_id == 8 ||
            $request->payment_id == 9 ||
            $request->payment_id == 10 || $request->payment_id == 11 || $request->payment_id == 12 || $request->payment_id == 13 || $request->payment_id == 14
        ) {
            $pay_data->environment = $request->environment[$pay_data->payment_type];
            $pay_data->public_key = $request->public_key[$pay_data->payment_type];
            $pay_data->secret_key = $request->secret_key[$pay_data->payment_type];
            $pay_data->currency = $request->currency[$pay_data->payment_type];
            if ($request->payment_id == 5) {
                $pay_data->encryption_key = $request->encryption_key;
            }
            if ($request->payment_id == 11) {
                $pay_data->base_url_by_region = $request->base_url_by_region;
            }
        }
        if ($request->hasFile('image')) {
            if ($pay_data->image != strtolower($pay_data->payment_name) . ".png" && file_exists(public_path('admin-assets/images/about/') . $pay_data->image)) {
                unlink(public_path('admin-assets/images/about/') . $pay_data->image);
            }
            $image = 'payment-' . uniqid() . '.' . $request->file('image')->extension();
            $request->file('image')->move(public_path('admin-assets/images/about/'), $image);
            $pay_data->image = $image;
        }
        $pay_data->save();
        return redirect()->back()->with('success', trans('messages.success'));
    }

    public function reorder_payment(Request $request)
    {
        if ($request->has('ids')) {
            $arr = explode(',', $request->input('ids'));
            foreach ($arr as $sortOrder => $id) {
                $menu = Payment::find($id);
                $menu->reorder_id = $sortOrder;
                $menu->save();
            }
        }
        return response()->json(['status' => 1, 'msg' => trans('messages.success')], 200);
    }
}
