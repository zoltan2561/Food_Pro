<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PaymentLog extends Model
{
    protected $fillable = ['payment_id','event','message'];
    public $timestamps = ['created_at'];
    const UPDATED_AT = null;
}
