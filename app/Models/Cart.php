<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Cart extends Model
{
    protected $table = 'cart';
    public $timestamps = true;
    protected $fillable = ['session_id','user_id','item_id','item_name','item_image','item_type',
        'tax','item_price','addons_id','addons_name','addons_price','addons_total_price',
        'extras_id','extras_name','extras_price','extras_total_price','qty','buynow','status'];

}
