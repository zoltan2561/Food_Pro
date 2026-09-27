<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\SystemAddons;
use Illuminate\Http\Request;

class SystemAddonsController extends Controller
{
    public function index()
    {
        abort_unless((int) auth()->user()->type === 1, 403);
        $addons = SystemAddons::orderBy('name')->get();
        return view('admin.systemaddons.system-addons', compact('addons'));
    }

    public function createsystemaddons()
    {
        abort_unless((int) auth()->user()->type === 1, 403);
        return redirect('admin/systemaddons');
    }

    public function store()
    {
        abort(403, 'Külső ZIP-bővítmények telepítése nem támogatott.');
    }

    public function update(Request $request)
    {
        abort_unless((int) auth()->user()->type === 1, 403);
        $validated = $request->validate([
            'id' => 'required|integer|exists:systemaddons,id',
            'status' => 'required|in:1,2',
        ]);
        SystemAddons::whereKey($validated['id'])->update(['activated' => (int) $validated['status']]);
        return response()->json(['status' => 1]);
    }
}
