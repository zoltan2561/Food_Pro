<?php

namespace App\Http\Controllers\front;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Cart;
use App\Models\Item;
use App\Models\Addons;
use App\Models\AddonsGroup;
use App\Models\Extra;
use App\Helpers\helper;
use App\Models\Settings;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session; // biztos import


class CartController extends Controller
{
    public function __construct()
    {
        if (!\Session::isStarted()) {
            \Session::start();
        }
    }


    public function index(Request $request)
    {
        // 1) Egységes kulcs: ha be van jelentkezve, user_id szerint, különben session_id
        $q = \App\Models\Cart::query()->where('buynow', 0);

        if (\Illuminate\Support\Facades\Auth::check() && (int) Auth::user()->type === 2) {
            $q->where('user_id', \Illuminate\Support\Facades\Auth::id());
        } else {
            $q->where('session_id', \Session::getId());
        }

        $getcartlist = $q->orderByDesc('id')->get();

        $getsettings = Settings::first();
        $tax_name = $tax_price = [];

        foreach ($getcartlist as $cart) {
            $taxlist = helper::gettax($cart->tax);
            if (!empty($taxlist)) {
                foreach ($taxlist as $tax) {
                    if (!$tax) continue;
                    $idx = array_search($tax->name, $tax_name);
                    $price = ($tax->type == 1)
                        ? ($tax->tax * $cart->qty)
                        : (($tax->tax / 100) * ($cart->addons_total_price + $cart->item_price) * $cart->qty);
                    if ($idx === false) {
                        $tax_name[]  = $tax->name;
                        $tax_price[] = $price;
                    } else {
                        $tax_price[$idx] += $price;
                    }
                }
            }
        }

        $taxArr = ['tax' => $tax_name, 'rate' => $tax_price];
        return view('web.cart.cart', compact('getcartlist', 'getsettings', 'taxArr'));
    }

    public function addtocart(Request $request)
    {
        try {
            // buynow mindig legyen 0/1, ne NULL
            $buynow = (int)$request->input('buynow', 0);

            // 1) töröljük az előző "buynow" sort ugyanazon kulcs alatt
            if ($buynow === 1) {
                if (Auth::check() && (int) Auth::user()->type === 2) {
                    Cart::where('buynow', 1)->where('user_id', Auth::id())->delete();
                } else {
                    if (!Session::isStarted()) { Session::start(); }
                    Cart::where('buynow', 1)->where('session_id', Session::getId())->delete();
                }
            }

            $itemdata = Item::where('slug', $request->slug)->where('item_status', 1)->firstOrFail();
            $quantity = (int) $request->input('qty', 1);
            if ($quantity < 1 || $quantity > (int) helper::appdata()->max_order_qty) {
                return response()->json(['status' => 0, 'message' => 'Érvénytelen mennyiség.'], 422);
            }
            $parseIds = static function ($raw) {
                $ids = array_map('intval', preg_split('/\s*\|\s*/', trim((string) $raw), -1, PREG_SPLIT_NO_EMPTY));
                return array_values(array_unique(array_filter($ids, static fn ($id) => $id > 0)));
            };
            $addonIds = $parseIds($request->input('addons_id'));
            $extraIds = $parseIds($request->input('extras_id'));
            $withoutGroupIds = $parseIds($request->input('without_groups'));
            // ConvertEmptyStringsToNull turns an empty optional textarea into null.
            $itemNotes = $request->input('item_notes') ?? '';
            if (!is_string($itemNotes) || mb_strlen(trim($itemNotes)) > 250) {
                return response()->json(['status' => 0, 'message' => 'A termékhez írt kérés legfeljebb 250 karakter lehet.'], 422);
            }
            $allowedGroups = $parseIds(str_replace(',', '|', (string) $itemdata->addons_id));
            $groups = AddonsGroup::whereIn('id', $allowedGroups)->where('is_deleted', 2)->where('is_available', 1)->get();
            $addons = Addons::whereIn('id', $addonIds)->whereIn('addongroup_id', $groups->pluck('id'))
                ->where('is_deleted', 2)->where('is_available', 1)->get();
            $extras = Extra::where('item_id', $itemdata->id)->whereIn('id', $extraIds)->get();
            if ($addons->count() !== count($addonIds) || $extras->count() !== count($extraIds)) {
                return response()->json(['status' => 0, 'message' => 'Érvénytelen feltét vagy extra.'], 422);
            }
            $withoutGroups = $groups->whereIn('id', $withoutGroupIds);
            if ($withoutGroups->count() !== count($withoutGroupIds) || $withoutGroups->contains(function ($group) use ($addons) {
                return (int) $group->selection_type !== 2 || (int) $group->selection_count !== 1
                    || $addons->contains('addongroup_id', $group->id);
            })) {
                return response()->json(['status' => 0, 'message' => 'Érvénytelen „feltét nélkül” választás.'], 422);
            }
            foreach ($groups as $group) {
                if (!Addons::where('addongroup_id', $group->id)->where('is_deleted', 2)->where('is_available', 1)->exists()) {
                    continue;
                }
                $selected = $addons->where('addongroup_id', $group->id)->count();
                $minimum = (int) $group->selection_type === 1
                    ? ((int) $group->selection_count === 1 ? 1 : max(1, (int) $group->min_count)) : 0;
                $maximum = (int) $group->selection_count === 1 ? 1 : max(1, (int) $group->max_count);
                if ($selected < $minimum || $selected > $maximum) {
                    return response()->json(['status' => 0, 'message' => 'A feltétek kiválasztása hiányos.'], 422);
                }
            }
            $price = (float) $itemdata->price;
            $deal = helper::top_deals();
            if ((int) $itemdata->is_top_deals === 1 && $deal) {
                $price = (int) $deal->offer_type === 1
                    ? ($price > (float) $deal->offer_amount ? $price - (float) $deal->offer_amount : $price)
                    : $price * (1 - (float) $deal->offer_amount / 100);
            }

            // 2) konzisztens kulcs mentése
            $cart = new Cart();
            if (Auth::check() && (int) Auth::user()->type === 2) {
                $cart->user_id    = Auth::id();
                // opcionálisan megtarthatod a session_id-t is log/elemzés célra
                if (!Session::isStarted()) { Session::start(); }
                $cart->session_id = Session::getId();
            } else {
                $cart->user_id    = null; // ne üres string
                if (!Session::isStarted()) { Session::start(); }
                $cart->session_id = Session::getId();
            }

            $cart->item_id            = $itemdata->id;
            $cart->item_name          = $itemdata->item_name;
            $cart->item_type          = $itemdata->item_type;
            $cart->item_image         = optional($itemdata->item_image)->image_name;
            $cart->tax                = $itemdata->tax;
            $cart->item_price         = helper::number_format(max(0, $price));
            $cart->addons_id          = $addons->pluck('id')->implode('| ');
            $cart->addons_name        = $addons->pluck('name')->implode('| ');
            $cart->addons_price       = $addons->pluck('price')->implode('| ');
            $cart->addons_total_price = helper::number_format($addons->sum('price'));
            $cart->extras_id          = $extras->pluck('id')->implode('| ');
            $cart->extras_name        = $extras->pluck('name')->implode('| ');
            $cart->extras_price       = $extras->pluck('price')->implode('| ');
            $cart->extras_total_price = helper::number_format($extras->sum('price'));
            $removedNames = $addons->filter(function ($addon) use ($groups) {
                return (bool) optional($groups->firstWhere('id', $addon->addongroup_id))->is_removal;
            })->pluck('name');
            $cart->without_addons     = $removedNames->merge($withoutGroups->reject(fn ($group) => (bool) $group->is_removal)->pluck('name'))->implode('| ');
            $cart->item_notes         = trim($itemNotes);
            $cart->qty                = $quantity;
            $cart->buynow             = $buynow;
            $cart->save();

            // jelképes számláló (ugyanazzal a kulccsal!)
            if (Auth::check() && (int) Auth::user()->type === 2) {
                $total_count = Cart::where('user_id', Auth::id())->where('buynow', 0)->count();
            } else {
                $total_count = Cart::where('session_id', Session::getId())->where('buynow', 0)->count();
            }

            session()->forget('discount_data');

            return response()->json([
                'status' => 1,
                'message' => trans('messages.success'),
                'data' => $total_count,
                'total_item_count' => helper::get_item_cart($itemdata->id),
                'buynow' => $buynow
            ], 200);

        } catch (\Throwable $th) {
            return response()->json([
                'status' => 0,
                'message' => trans('messages.wrong'),
                'buynow' => (int)$request->input('buynow', 0)
            ], 200);
        }
    }

    public function qtyupdate(Request $request)
    {
        $request->validate([
            'id'   => 'required|integer',
            'type' => 'required|in:plus,minus',
        ]);

        if (!\Session::isStarted()) { \Session::start(); }

        // csak a SAJÁT kosár sorát engedjük módosítani
        $row = \App\Models\Cart::query()
            ->where('id', (int)$request->id)
            ->when(\Illuminate\Support\Facades\Auth::check() && (int) Auth::user()->type === 2,
                fn($q) => $q->where('user_id', \Illuminate\Support\Facades\Auth::id()),
                fn($q) => $q->where('session_id', \Session::getId())
            )
            ->where('buynow', 0)
            ->first();

        if (!$row) {
            return response()->json(['status' => 0, 'message' => trans('messages.invalid_cart')], 404);
        }

        // teljes kosár darabszám (max_order_qty ellenőrzéshez)
        $total_count = \App\Models\Cart::query()
            ->when(\Illuminate\Support\Facades\Auth::check() && (int) Auth::user()->type === 2,
                fn($q) => $q->where('user_id', \Illuminate\Support\Facades\Auth::id()),
                fn($q) => $q->where('session_id', \Session::getId())
            )
            ->where('buynow', 0)
            ->sum('qty');

        if ($request->type === 'plus') {
            if ($total_count >= helper::appdata()->max_order_qty) {
                $msg = trans('messages.order_qty_less_then') . ' : ' . helper::appdata()->max_order_qty;
                return response()->json(['status' => 2, 'message' => $msg], 200);
            }
            $row->qty += 1;
            $row->save();
        } else { // minus
            if ($row->qty <= 1) {
                $row->delete();
                session()->forget('discount_data');

                // új kosárszám
                $new_count = \App\Models\Cart::query()
                    ->when(\Illuminate\Support\Facades\Auth::check() && (int) Auth::user()->type === 2,
                        fn($q) => $q->where('user_id', \Illuminate\Support\Facades\Auth::id()),
                        fn($q) => $q->where('session_id', \Session::getId())
                    )
                    ->where('buynow', 0)
                    ->sum('qty');

                return response()->json([
                    'status'    => 1,
                    'removed'   => true,
                    'qty'       => 0,
                    'data'      => $new_count,
                ]);
            } else {
                $row->qty -= 1;
                $row->save();
            }
        }

        // sorösszeg és új kosárszám vissza a kliensnek
        $unit = (float)$row->item_price + (float)$row->addons_total_price + (float)$row->extras_total_price;
        $row_total = $unit * (int)$row->qty;

        $new_count = \App\Models\Cart::query()
            ->when(\Illuminate\Support\Facades\Auth::check() && (int) Auth::user()->type === 2,
                fn($q) => $q->where('user_id', \Illuminate\Support\Facades\Auth::id()),
                fn($q) => $q->where('session_id', \Session::getId())
            )
            ->where('buynow', 0)
            ->sum('qty');

        return response()->json([
            'status'        => 1,
            'removed'       => false,
            'qty'           => (int)$row->qty,
            'row_total'     => $row_total,
            'row_total_fmt' => helper::currency_format($row_total),
            'data'          => $new_count, // ha van globális számláló a fejléchez
        ]);
    }


    public function deletecartitem(Request $request, $id = null)
    {
        $id = (int)($id ?? $request->input('id'));

        $q = \App\Models\Cart::query()->where('id', $id);

        if (\Illuminate\Support\Facades\Auth::check() && (int) Auth::user()->type === 2) {
            $q->where('user_id', \Illuminate\Support\Facades\Auth::id());
        } else {
            $q->where('session_id', \Session::getId());
        }

        $row = $q->first();
        if (!$row) {
            return response()->json(['status' => 0, 'message' => trans('messages.invalid_cart')], 404);
        }

        $row->delete();
        session()->forget('discount_data');

        // friss kosárszám
        if (\Illuminate\Support\Facades\Auth::check() && (int) Auth::user()->type === 2) {
            $total_count = \App\Models\Cart::where('user_id', \Illuminate\Support\Facades\Auth::id())->where('buynow', 0)->count();
        } else {
            $total_count = \App\Models\Cart::where('session_id', \Session::getId())->where('buynow', 0)->count();
        }

        return response()->json(['status' => 1, 'message' => trans('messages.success'), 'data' => $total_count]);
    }


}
