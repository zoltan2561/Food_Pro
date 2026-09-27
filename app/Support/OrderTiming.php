<?php

namespace App\Support;

use App\Helpers\helper;
use App\Models\Order;
use App\Models\Settings;
use App\Models\Time;
use App\Models\User;
use Carbon\Carbon;
use Carbon\CarbonPeriod;

class OrderTiming
{
    public const ASAP = 'ASAP';

    public static function resolve(string $mode, ?string $date, ?string $time, Settings $settings): array
    {
        $admin = User::whereIn('type', [1, 4])->first();
        if (!$admin || (int) $admin->is_online !== 1) {
            return ['error' => trans('messages.restaurant_closed')];
        }

        $timezone = $settings->timezone ?: config('app.timezone');
        $mode = (int) $settings->ordertype_date_time === 1 ? $mode : 'now';

        if ($mode === 'now') {
            if (!self::isOpenNow($settings)) {
                return ['error' => trans('checkout.closed_now')];
            }

            return ['date' => Carbon::now($timezone)->format('Y-m-d'), 'time' => self::ASAP];
        }

        if ($mode !== 'scheduled' || !is_string($date) || !preg_match('/^\d{4}-\d{2}-\d{2}$/', $date)) {
            return ['error' => trans('checkout.timing_error')];
        }

        try {
            $scheduledDate = Carbon::createFromFormat('!Y-m-d', $date, $timezone);
        } catch (\Throwable $exception) {
            return ['error' => trans('checkout.timing_error')];
        }

        if (!$scheduledDate || $scheduledDate->format('Y-m-d') !== $date
            || $scheduledDate->isBefore(Carbon::today($timezone))
            || !is_string($time) || strlen($time) > 50
            || !in_array($time, self::availableSlots($scheduledDate, $settings), true)) {
            return ['error' => trans('checkout.timing_error')];
        }

        return ['date' => $date, 'time' => $time];
    }

    public static function isOpenNow(Settings $settings): bool
    {
        $admin = User::whereIn('type', [1, 4])->first();
        if (!$admin || (int) $admin->is_online !== 1) {
            return false;
        }

        $timezone = $settings->timezone ?: config('app.timezone');
        $now = Carbon::now($timezone);
        $schedule = Time::where('day', strtolower($now->englishDayOfWeek))->first();
        if (!$schedule || (int) $schedule->always_close === 1) {
            return false;
        }

        $open = Carbon::parse($schedule->open_time, $timezone)->setDate($now->year, $now->month, $now->day);
        $close = Carbon::parse($schedule->close_time, $timezone)->setDate($now->year, $now->month, $now->day);
        $inside = $close->greaterThan($open)
            ? $now->betweenIncluded($open, $close)
            : $now->greaterThanOrEqualTo($open) || $now->lessThanOrEqualTo($close);
        if (!$inside) {
            return false;
        }

        if ($schedule->break_start && $schedule->break_end) {
            $breakStart = Carbon::parse($schedule->break_start, $timezone)->setDate($now->year, $now->month, $now->day);
            $breakEnd = Carbon::parse($schedule->break_end, $timezone)->setDate($now->year, $now->month, $now->day);
            if ($now->betweenIncluded($breakStart, $breakEnd)) {
                return false;
            }
        }

        return true;
    }

    public static function availableSlots(Carbon $date, Settings $settings): array
    {
        $timezone = $settings->timezone ?: config('app.timezone');
        $schedule = Time::where('day', strtolower($date->englishDayOfWeek))->first();
        if (!$schedule || (int) $schedule->always_close === 1) {
            return [];
        }

        $interval = (int) $settings->interval_time;
        $minutes = (int) $settings->interval_type === 2 ? $interval * 60 : $interval;
        if ($minutes <= 0) {
            return [];
        }

        $slots = [];
        $periods = $schedule->break_start && $schedule->break_end
            ? [[$schedule->open_time, $schedule->break_start], [$schedule->break_end, $schedule->close_time]]
            : [[$schedule->open_time, $schedule->close_time]];

        foreach ($periods as [$periodStart, $periodEnd]) {
            if (!$periodStart || !$periodEnd) {
                continue;
            }
            $period = new CarbonPeriod(Carbon::parse($periodStart, $timezone), $minutes . ' minutes', Carbon::parse($periodEnd, $timezone));
            $times = [];
            foreach ($period as $slotTime) {
                $times[] = helper::time_format($slotTime);
            }
            for ($index = 0, $last = count($times) - 1; $index < $last; $index++) {
                $slot = $times[$index] . ' - ' . $times[$index + 1];
                $storedDates = [$date->format('Y-m-d'), helper::date_format($date)];
                $orderCount = Order::whereIn('delivery_date', array_unique($storedDates))
                    ->where('delivery_time', $slot)->count();
                $slotEnd = Carbon::parse($times[$index + 1], $timezone)
                    ->setDate($date->year, $date->month, $date->day);
                if ($orderCount >= (int) $settings->perslot_booking_limit
                    || ($date->isToday() && $slotEnd->lessThanOrEqualTo(Carbon::now($timezone)))) {
                    continue;
                }
                $slots[] = $slot;
            }
        }

        return $slots;
    }
}
