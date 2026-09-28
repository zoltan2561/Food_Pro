@php
    $paymentColumnClass = $getpaymentmethods->count() >= 3 ? 'col-lg-4' : 'col-lg-6';
@endphp
<div class="row g-3 payment-methods">
    @foreach ($getpaymentmethods as $pmdata)
        @php
            $type = (int) $pmdata->payment_type;
            $description = match ($type) {
                1 => 'Készpénz a futárnál vagy az üzletben',
                17 => 'Bankkártya a futárnál vagy az üzletben',
                16 => 'Online fizetés a Barion tesztfelületén',
                default => '',
            };
        @endphp
        <label class="form-check-label {{ $paymentColumnClass }} col-md-6" for="payment{{ $type }}">
            <input class="form-check-input" type="radio" name="transaction_type"
                   id="payment{{ $type }}" value="{{ $type }}"
                   data-payment-type="{{ $type }}"
                   data-currency="{{ $pmdata->currency }}"
                   @checked($loop->first)>
            <span class="payment-gateway mb-0">
                <span class="payment-gateway-main">
                    <img class="payment-method-icon" src="{{ helper::image_path($pmdata->image) }}" alt="" width="44" height="44">
                    <span class="payment-method-copy">
                        <strong>{{ $pmdata->payment_name }}</strong>
                        <small>{{ $description }}</small>
                    </span>
                </span>
                <span class="check-icon" aria-hidden="true"></span>
            </span>
        </label>
    @endforeach
</div>
