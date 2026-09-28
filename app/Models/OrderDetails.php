<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class OrderDetails extends Model
{
    protected $table='order_details';
    protected $fillable=['user_id','order_id','item_id','price','qty'];
    public function items(){
        return $this->hasOne('App\Models\Item','id','item_id');
    }

    public function getAddonSelectionsAttribute(): array
    {
        return array_values(array_filter($this->selectionNames($this->addons_name),
            fn ($name) => !in_array($name, $this->without_selections, true)));
    }

    public function getExtraSelectionsAttribute(): array
    {
        return $this->selectionNames($this->extras_name);
    }

    public function getWithoutSelectionsAttribute(): array
    {
        $names = $this->selectionNames($this->without_addons);
        if ($names || !$this->addons_id) {
            return $names;
        }

        // Régi rendelésekben még nem volt külön mentve a kihagyott összetevő.
        $ids = array_filter(array_map('intval', explode('|', (string) $this->addons_id)));
        return Addons::query()
            ->join('addons_group', 'addons_group.id', '=', 'addons.addongroup_id')
            ->whereIn('addons.id', $ids)
            ->where('addons_group.is_removal', true)
            ->pluck('addons.name')->all();
    }

    private function selectionNames(?string $value): array
    {
        return array_values(array_filter(array_map('trim', explode('|', (string) $value)), static fn ($name) => $name !== ''));
    }
}
