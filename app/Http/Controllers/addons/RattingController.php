<?php

namespace App\Http\Controllers\addons;

use App\Helpers\helper;
use App\Http\Controllers\Controller;
use App\Models\Item;
use App\Models\Ratting;
use App\Models\Settings;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class RattingController extends Controller
{
    public function index(Request $request)
    {
        abort_unless(helper::checkaddons('product_review'), 404);

        $sorter = $request->input('item_id', $request->input('item_name'));
        $getproduct = Item::select('id', 'item_name')->orderBy('item_name')->get();
        $reviews = Ratting::with('item_info')->when($sorter, function ($query, $itemId) {
            $query->where('item_id', $itemId);
        })->orderByDesc('id')->paginate(20);

        if ($request->ajax()) {
            return view('admin.reviews.table', ['getreview' => $reviews]);
        }

        return view('admin.reviews.reviews', [
            'getproduct' => $getproduct,
            'sorter' => $sorter,
            'getreview' => $reviews,
        ]);
    }

    public function settings_update(Request $request)
    {
        abort_unless(helper::checkaddons('product_review'), 404);

        $settings = Settings::firstOrFail();
        $enabled = $request->boolean('review_approved_status');
        $ratings = $request->input('review_auto_approved', []);
        $settings->review_approved_status = $enabled ? 1 : 2;
        $settings->review_auto_approved = $enabled
            ? implode(',', array_values(array_intersect(['1', '2', '3', '4', '5'], array_map('strval', (array) $ratings))))
            : $settings->review_auto_approved;
        $settings->save();

        return back()->with('success', trans('messages.success'));
    }

    public function destroy(Request $request)
    {
        abort_unless(helper::checkaddons('product_review'), 404);
        Ratting::whereKey($request->input('id'))->delete();

        return response('1');
    }

    public function status(Request $request)
    {
        abort_unless(helper::checkaddons('product_review'), 404);

        $review = Ratting::findOrFail($request->input('id'));
        $review->status = (int) $request->input('status') === 1 ? 1 : 2;
        $review->save();

        return response('1');
    }

    public function addreview(Request $request)
    {
        abort_unless(helper::checkaddons('product_review'), 404);

        if (!Auth::check() || (int) Auth::user()->type !== 2) {
            return redirect('/login')->with('error', trans('messages.user_required'));
        }

        $validated = $request->validate([
            'item_id' => ['required', 'integer', 'exists:item,id'],
            'ratting' => ['required', 'integer', 'between:1,5'],
            'comment' => ['nullable', 'string', 'max:255'],
        ]);

        $settings = Settings::first();
        $approvedRatings = array_map('intval', explode(',', (string) ($settings->review_auto_approved ?? '')));
        $autoApprove = (int) ($settings->review_approved_status ?? 2) === 1
            && in_array((int) $validated['ratting'], $approvedRatings, true);

        Ratting::create([
            'user_id' => Auth::id(),
            'item_id' => $validated['item_id'],
            'ratting' => $validated['ratting'],
            'comment' => $validated['comment'] ?? '',
            'status' => $autoApprove ? 1 : 2,
        ]);

        return back()->with('success', trans('messages.success'));
    }
}
