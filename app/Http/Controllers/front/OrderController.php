<?php

namespace App\Http\Controllers\front;

use App\Http\Controllers\Controller;
use App\Helpers\helper;
use App\Helpers\whatsapp_helper;
use App\Models\CustomStatus;
use App\Models\Order;
use App\Models\User;
use App\Models\Transaction;
use App\Models\OrderDetails;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class OrderController extends Controller
{
    public function index(Request $request)
    {
        if (!(Auth::check() && Auth::user()->type == 2)) return redirect()->route('login');
        $getorders = Order::select('order.id', 'order.order_from', 'order.order_type', 'order.order_number', 'order.grand_total', 'order.status', 'order.status_type', 'order.transaction_type', 'order.created_at')
            ->where('order.user_id', Auth::user()->id);
        if ($request->has('type') && $request->type == "completed") {
            $getorders = $getorders->where('status_type', 3);
        } else if ($request->has('type') && $request->type == "cancelled") {
            $getorders = $getorders->where('status_type', 4);
        } else {
            // processing
            $getorders = $getorders->whereIn('status_type', array(1, 2));
        }
        $getorders = $getorders->where('order.order_from', '!=', 'pos')->orderByDesc('id')->paginate(10);
        $totalprocessing = Order::whereIn('status_type', array(1, 2))->where('order_from', '!=', 'pos')->where('user_id', Auth::user()->id)->count();
        $totalcompleted = Order::where('status_type', 3)->where('order_from', '!=', 'pos')->where('user_id', Auth::user()->id)->count();
        $totalcancelled = Order::where('status_type', 4)->where('order_from', '!=', 'pos')->where('user_id', Auth::user()->id)->count();
        return view('web.orders.orders', compact('getorders', 'totalprocessing', 'totalcompleted', 'totalcancelled'));
    }
    public function statusupdate(Request $request)
    {
        $order = Order::where('order_number', $request->id)->firstOrFail();
        $this->authorizeOrder($order);
        // Online payments need a merchant-managed refund before cancellation.
        abort_unless(in_array((int) $order->transaction_type, [1, 2], true), 409);
        $changed = DB::transaction(function () use ($order) {
            $locked = Order::whereKey($order->id)->lockForUpdate()->first();
            if ((int) $locked->status_type !== 1) return false;
            $cancelled = CustomStatus::where('order_type', $locked->order_type)->where('type', 4)
                ->where('is_available', 1)->where('is_deleted', 2)->first();
            if (!$cancelled) return false;
            $locked->status = $cancelled->id;
            $locked->status_type = $cancelled->type;
            $locked->save();
            if ((int) $locked->transaction_type === 2 && $locked->user_id) {
                User::whereKey($locked->user_id)->increment('wallet', $locked->grand_total);
                $refund = new Transaction();
                $refund->user_id = $locked->user_id;
                $refund->order_id = $locked->id;
                $refund->order_number = $locked->order_number;
                $refund->amount = $locked->grand_total;
                $refund->transaction_id = $locked->transaction_id;
                $refund->transaction_type = 2;
                $refund->save();
            }
            return true;
        });
        if (!$changed) return response('0', 409);
        $admin = User::where('type', 1)->first();
        if ($admin && $admin->email) {
            helper::order_status_email($admin->email, $admin->name, trans('labels.order_cancelled'), 'Order ' . $order->order_number . ' has been cancelled by the customer.');
        }
        return response('1');
    }
    public function orderdetails(Request $request)
    {
        $orderdata = Order::with('driver_info')->where('order_number', $request->order_number)->first();

        if (!empty($orderdata)) {
            $this->authorizeOrder($orderdata);
            $ordersdetails = OrderDetails::where('order_id', $orderdata->id)->orderByDesc('id')->get();
            $whmessage = "";
            if (@helper::checkaddons('whatsapp_message')) {
                if (whatsapp_helper::whatsapp_message_config()->order_created == 1) {
                    if (whatsapp_helper::whatsapp_message_config()->message_type == 2) {
                        $whmessage = whatsapp_helper::whatsappmessage($request->order_number);
                    }
                }
            }
            return view('web.orders.orderdetails', compact('orderdata', 'ordersdetails', 'whmessage'));
        } else {
            return redirect()->back()->with('error', trans('messages.wrong'));
        }
    }

    public function success(Request $request)
    {
        $orderdata = Order::select('id', 'user_id', 'order_number')->where('order_number', $request->order_number)->first();

        if (!empty($orderdata)) {
            $this->authorizeOrder($orderdata);
            $whmessage = "";
            if (@helper::checkaddons('whatsapp_message')) {
                if (whatsapp_helper::whatsapp_message_config()->order_created == 1) {
                    if (whatsapp_helper::whatsapp_message_config()->message_type == 2) {
                        $whmessage = whatsapp_helper::whatsappmessage($request->order_number);
                    } else {
                        whatsapp_helper::whatsappmessage($request->order_number);
                    }
                }
            }
            return view('web.orders.success', compact('orderdata', 'whmessage'));
        } else {
            return redirect()->back()->with('error', trans('messages.wrong'));
        }
    }

    private function authorizeOrder(Order $order): void
    {
        $accountOwner = Auth::check() && (int) Auth::user()->type === 2
            && (int) $order->user_id === (int) Auth::id();
        $guestOwner = !$order->user_id
            && in_array((int) $order->id, array_map('intval', (array) session('recent_order_ids', [])), true);
        abort_unless($accountOwner || $guestOwner, 403);
    }
}
