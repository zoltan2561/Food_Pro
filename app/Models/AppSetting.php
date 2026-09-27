<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class AppSetting extends Model
{
    protected $table = 'app_settings';
    public $timestamps = true;
    protected $fillable = ['key','value'];

    public static function get(string $key, $default = null)
    {
        $row = static::query()->where('key', $key)->first();
        return $row ? $row->value : $default;
    }

    public static function set(string $key, $value): void
    {
        static::query()->updateOrInsert(['key' => $key], ['value' => $value]);
    }
}
