<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class BarionTransaction extends Model
{
    protected $table = 'barion_transactions';
    protected $fillable = [
        'order_id','payment_id','status','amount','currency','payer_email',
        'raw_response','last_callback_at'
    ];
    public $timestamps = true;
    protected $casts = [
        'draft_json' => 'array',
    ];

}
