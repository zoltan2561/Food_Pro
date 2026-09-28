@php
    $paper = request()->query('paper') === '58' ? '58' : '80';
    $settings = helper::appdata();
    $shopName = $settings->short_title ?: $settings->title ?: 'Étterem';
    $printedAt = \Carbon\Carbon::now($settings->timezone ?: config('app.timezone'))->format('Y.m.d H:i');
    $orderDate = \Carbon\Carbon::parse($orderdata->created_at)->format('Y.m.d H:i');
    $orderType = (int) $orderdata->order_type;
    $transactionType = (int) $orderdata->transaction_type;
    $paymentLabel = match ($transactionType) {
        1 => 'Készpénz átvételkor',
        17 => 'Kártya átvételkor',
        16 => 'Barion online',
        default => helper::getpayment($transactionType),
    };
    $serviceLabel = match ($orderType) {
        1 => trans('labels.delivery'),
        2 => trans('labels.pickup'),
        3 => trans('labels.pos'),
        default => '',
    };
    $address = implode(', ', array_filter([
        $orderdata->address,
        $orderdata->landmark,
        $orderdata->city,
        $orderdata->state,
        $orderdata->postal_code,
        $orderdata->country,
    ], fn ($part) => filled($part)));
    $orderNote = collect([$orderdata->order_notes, $orderdata->instruction, $orderdata->notes])->first(fn ($note) => filled($note));
    $subtotal = $ordersdetails->sum(fn ($item) =>
        ((float) $item->item_price + (float) $item->addons_total_price + (float) $item->extras_total_price) * (int) $item->qty
    );
    $quantity = $ordersdetails->sum('qty');
    $taxNames = explode('|', (string) $orderdata->tax_name);
    $taxAmounts = explode('|', (string) $orderdata->tax_amount);
@endphp
<!doctype html>
<html lang="hu">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>{{ trans('labels.print') }} #{{ $orderdata->order_number }}</title>
    <style>
        @page { margin: 0; }
        * { box-sizing: border-box; }
        html, body { margin: 0; }
        body { background: #ededed; color: #000; font: 12px/1.35 Arial, Helvetica, sans-serif; }
        .preview-tools { display: flex; flex-wrap: wrap; align-items: center; justify-content: center; gap: 8px; margin: 16px auto; padding: 0 12px; }
        .preview-tools a, .preview-tools button { border: 1px solid #555; border-radius: 5px; background: #fff; color: #000; padding: 8px 12px; font: inherit; text-decoration: none; cursor: pointer; }
        .preview-tools .active { background: #222; color: #fff; }
        .receipt { width: 72mm; max-width: 100%; margin: 0 auto 20px; padding: 2mm; background: #fff; overflow-wrap: anywhere; }
        .receipt--58 { width: 48mm; font-size: 11px; }
        .receipt__head { text-align: center; }
        .shop-name { margin: 0 0 5px; font-size: 17px; line-height: 1.15; font-weight: 800; text-transform: uppercase; }
        .order-number { margin: 5px 0; font-size: 18px; line-height: 1.15; font-weight: 800; }
        .service { margin: 4px 0; font-size: 14px; font-weight: 800; text-transform: uppercase; }
        .rule { border: 0; border-top: 1px dashed #000; margin: 7px 0; }
        .detail { display: flex; justify-content: space-between; gap: 5px; margin: 2px 0; }
        .detail__label { flex: 0 1 auto; }
        .detail__value { flex: 0 1 auto; text-align: right; font-weight: 700; }
        .stacked { margin: 5px 0; }
        .stacked__label { display: block; font-weight: 700; }
        .stacked__value { display: block; white-space: pre-line; }
        .payment { padding: 5px 0; text-align: center; font-size: 13px; font-weight: 800; text-transform: uppercase; }
        .payment-status { display: block; font-size: 11px; }
        .items-title { margin: 0 0 3px; font-size: 12px; text-transform: uppercase; }
        .item { padding: 6px 0; border-top: 1px dashed #000; break-inside: avoid; page-break-inside: avoid; }
        .item__head { display: flex; align-items: baseline; justify-content: space-between; gap: 5px; font-weight: 800; }
        .item__name { flex: 1 1 auto; min-width: 0; }
        .item__total { flex: 0 0 auto; white-space: nowrap; text-align: right; }
        .item__meta { margin: 2px 0 0 18px; font-size: 11px; }
        .item__modifier { display: block; }
        .item__note { display: block; margin-top: 3px; white-space: pre-line; }
        .totals { border-top: 1px dashed #000; padding-top: 4px; }
        .totals .detail__value { white-space: nowrap; }
        .grand-total { border-top: 2px solid #000; border-bottom: 2px solid #000; margin-top: 6px; padding: 6px 0; font-size: 15px; font-weight: 800; }
        .grand-total .detail__label, .grand-total .detail__value { font-weight: 800; }
        .receipt__foot { margin-top: 9px; text-align: center; font-size: 10px; }
        .receipt--58 .shop-name { font-size: 15px; }
        .receipt--58 .order-number { font-size: 16px; }
        .receipt--58 .service, .receipt--58 .payment { font-size: 12px; }
        .receipt--58 .grand-total { font-size: 13px; }
        @media print {
            html, body { width: auto; background: #fff; }
            .preview-tools { display: none !important; }
            .receipt { width: 72mm; max-width: none; margin: 0 auto; padding: 1mm 0; }
            .receipt--58 { width: 48mm; }
        }
    </style>
</head>
<body>
    <nav class="preview-tools" aria-label="Nyomtatási beállítások">
        <a href="{{ request()->fullUrlWithQuery(['paper' => '80']) }}" class="{{ $paper === '80' ? 'active' : '' }}">80 mm</a>
        <a href="{{ request()->fullUrlWithQuery(['paper' => '58']) }}" class="{{ $paper === '58' ? 'active' : '' }}">58 mm</a>
        <button type="button" onclick="window.print()">{{ trans('labels.print') }}</button>
    </nav>
    <main class="receipt {{ $paper === '58' ? 'receipt--58' : '' }}">
        <header class="receipt__head">
            <h1 class="shop-name">{{ $shopName }}</h1>
            <p class="order-number">#{{ $orderdata->order_number }}</p>
            @if (filled($serviceLabel))
                <p class="service">{{ $serviceLabel }}</p>
            @endif
        </header>

        <hr class="rule">
        <div class="detail"><span class="detail__label">{{ trans('labels.order_date') }}</span><span class="detail__value">{{ $orderDate }}</span></div>
        @if (filled($orderdata->delivery_date))
            <div class="detail"><span class="detail__label">{{ $orderType === 1 ? trans('labels.delivery_date') : trans('labels.pickup_date') }}</span><span class="detail__value">{{ \Carbon\Carbon::parse($orderdata->delivery_date)->format('Y.m.d') }}</span></div>
        @endif
        @if (filled($orderdata->delivery_time))
            <div class="detail"><span class="detail__label">{{ $orderType === 1 ? trans('labels.delivery_time') : trans('labels.pickup_time') }}</span><span class="detail__value">{{ helper::order_time($orderdata->delivery_time) }}</span></div>
        @endif
        <div class="payment">
            {{ $paymentLabel }}
            @if ($transactionType === 17 && (int) $orderdata->payment_status !== 2)
                <span class="payment-status">Terminálos fizetés várható</span>
            @elseif ($transactionType === 16)
                <span class="payment-status">{{ (int) $orderdata->payment_status === 2 ? 'Fizetve' : 'Fizetésre vár' }}</span>
            @endif
        </div>

        <hr class="rule">
        @if (filled($orderdata->name))
            <div class="stacked"><span class="stacked__label">{{ trans('labels.name') }}</span><span class="stacked__value">{{ $orderdata->name }}</span></div>
        @endif
        @if (filled($orderdata->mobile))
            <div class="stacked"><span class="stacked__label">{{ trans('labels.mobile') }}</span><span class="stacked__value">{{ $orderdata->mobile }}</span></div>
        @endif
        @if ($orderType === 1 && filled($address))
            <div class="stacked"><span class="stacked__label">{{ trans('checkout.delivery_address') }}</span><span class="stacked__value">{{ $address }}</span></div>
        @endif

        <hr class="rule">
        <h2 class="items-title">{{ trans('labels.item') }} ({{ $quantity }} db)</h2>
        @foreach ($ordersdetails as $orders)
            @php
                $unitPrice = (float) $orders->item_price + (float) $orders->addons_total_price + (float) $orders->extras_total_price;
                $lineTotal = $unitPrice * (int) $orders->qty;
            @endphp
            <article class="item">
                <div class="item__head">
                    <span class="item__name">{{ $orders->qty }} × {{ $orders->item_name }}</span>
                    <span class="item__total">{{ helper::currency_format($lineTotal) }}</span>
                </div>
                <div class="item__meta">
                    @foreach ($orders->addon_selections as $name)
                        <span class="item__modifier">+ {{ $name }}</span>
                    @endforeach
                    @foreach ($orders->extra_selections as $name)
                        <span class="item__modifier">+ {{ $name }}</span>
                    @endforeach
                    @foreach ($orders->without_selections as $name)
                        <span class="item__modifier">− {{ trans('labels.without_named', ['name' => $name]) }}</span>
                    @endforeach
                    @if (filled($orders->item_notes))
                        <span class="item__note"><strong>{{ trans('labels.special_request') }}:</strong> {{ $orders->item_notes }}</span>
                    @endif
                </div>
            </article>
        @endforeach

        <div class="totals">
            <div class="detail"><span class="detail__label">{{ trans('labels.subtotal') }}</span><span class="detail__value">{{ helper::currency_format($subtotal) }}</span></div>
            @if ((float) $orderdata->discount_amount > 0)
                <div class="detail"><span class="detail__label">{{ trans('labels.discount') }} @if (filled($orderdata->offer_code))({{ $orderdata->offer_code }})@endif</span><span class="detail__value">−{{ helper::currency_format($orderdata->discount_amount) }}</span></div>
            @endif
            @if (filled($orderdata->tax_name) && filled($orderdata->tax_amount))
                @foreach ($taxAmounts as $index => $amount)
                    @if (filled($taxNames[$index] ?? null))
                        <div class="detail"><span class="detail__label">{{ $taxNames[$index] }}</span><span class="detail__value">{{ helper::currency_format($amount) }}</span></div>
                    @endif
                @endforeach
            @endif
            @if ((float) $orderdata->delivery_charge > 0)
                <div class="detail"><span class="detail__label">{{ trans('labels.delivery_charge') }}</span><span class="detail__value">{{ helper::currency_format($orderdata->delivery_charge) }}</span></div>
            @endif
            <div class="detail grand-total"><span class="detail__label">{{ trans('labels.grand_total') }}</span><span class="detail__value">{{ helper::currency_format($orderdata->grand_total) }}</span></div>
        </div>

        @if (filled($orderNote))
            <div class="stacked"><span class="stacked__label">{{ trans('labels.note') }}</span><span class="stacked__value">{{ $orderNote }}</span></div>
        @endif
        <footer class="receipt__foot">
            <div>{{ trans('labels.thanks_for_order') }}</div>
            <div>Nyomtatva: {{ $printedAt }}</div>
        </footer>
    </main>
</body>
</html>
