<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class BarionSetting extends Model
{
    protected $table = 'barion_settings';
    protected $fillable = ['env','poskey','shop_email','redirect_url','callback_url','currency','is_enabled'];
    public $timestamps = true;
}
