@extends('admin.theme.default')
@section('content')
    @include('admin.breadcrumb')
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <div class="card border-0">
                    <div class="card-body admin-form-section">
                        <div class="admin-section-intro">
                            <h2 class="h5">{{ trans('admin_ui.payment_title') }}</h2>
                            <p>{{ trans('admin_ui.payment_intro') }}</p>
                        </div>
                        <div class="accordion accordion-flush sort_menu" id="accordionExample"
                            data-url="{{ url('admin/payment/reorder_payment') }}">
                            @php
                                $i = 1;
                            @endphp
                            @foreach ($getpayment as $key => $pmdata)
                                @php
                                    // Check if the current $pmdata is a system addon and activated
                                    if (in_array((int) $pmdata->payment_type, [1, 17, 16], true)) {
                                        $systemAddonActivated = true;
                                    } else {
                                        $systemAddonActivated = false;
                                    }
                                    $addon = App\Models\SystemAddons::where(
                                        'unique_identifier',
                                        $pmdata->unique_identifier,
                                    )->first();
                                    if ($addon != null && $addon->activated == 1) {
                                        $systemAddonActivated = true;
                                    }
                                @endphp
                                @if ($systemAddonActivated)
                                    <form action="{{ URL::to('admin/payment/update') }}" method="POST" class="payments"
                                        data-id="{{ $pmdata->id }}" enctype="multipart/form-data">
                                        @csrf
                                        @php
                                            $transaction_type = $pmdata->payment_type;
                                            $image_tag_name = $transaction_type . '_image';
                                        @endphp
                                        <input type="hidden" name="payment_id" value="{{ $pmdata->payment_type }}">
                                        <div class="payment-accordian card rounded border mb-3 handle">
                                            <h6 class="card-header text-white d-flex align-items-center rounded border-0 justify-content-between"
                                                id="heading{{ $transaction_type }}">
                                                <span>
                                                    <img src="{{ helper::image_path($pmdata->image) }}" alt=""
                                                        class="img-fluid rounded mx-2" height="30" width="30">
                                                    <b>{{ $pmdata->payment_name }}</b>

                                                    @if (in_array($transaction_type, ['3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14']))
                                                        @if (env('Environment') == 'sendbox')
                                                            <span
                                                                class="badge badge bg-danger ms-2">{{ trans('labels.addon') }}</span>
                                                        @endif
                                                    @endif

                                                </span>
                                                <a class="cursor-pointer" tooltip="{{ trans('labels.move') }}">
                                                    <i class="fa-light fa-up-down-left-right text-white"></i></a>
                                            </h6>

                                            <div class="card-body">
                                                <div class="row">
                                                    <div class="col-md-6 form-group">
                                                        <label class="form-label">
                                                            {{ trans('labels.payment_name') }} <span class="text-danger">
                                                                *</span> </label>
                                                        <input type="text" class="form-control" name="name"
                                                            placeholder="{{ trans('labels.payment_name') }}"
                                                            value="{{ $pmdata->payment_name }}" required>
                                                        <p class="admin-help-text">{{ trans('admin_ui.payment_name_help') }}</p>
                                                    </div>
                                                    @if (in_array($transaction_type, ['3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14']))
                                                        <div class="col-md-6">
                                                            <p class="form-label">{{ trans('labels.environment') }}
                                                                <span class="text-danger"> *</span>
                                                            </p>
                                                            <div class="form-check form-check-inline">
                                                                <input class="form-check-input" type="radio"
                                                                    name="environment[{{ $transaction_type }}]"
                                                                    id="{{ $transaction_type }}_{{ $key }}_environment"
                                                                    value="1" required
                                                                    {{ $pmdata->environment == 1 ? 'checked' : '' }}>
                                                                <label class="form-check-label"
                                                                    for="{{ $transaction_type }}_{{ $key }}_environment">
                                                                    {{ trans('labels.sandbox') }} </label>
                                                            </div>
                                                            <div class="form-check form-check-inline">
                                                                <input class="form-check-input" type="radio"
                                                                    name="environment[{{ $transaction_type }}]"
                                                                    id="{{ $transaction_type }}_{{ $i }}_environment"
                                                                    value="2" required
                                                                    {{ $pmdata->environment == 2 ? 'checked' : '' }}>
                                                                <label class="form-check-label"
                                                                    for="{{ $transaction_type }}_{{ $i }}_environment">
                                                                    {{ trans('labels.production') }} </label>
                                                            </div>
                                                        </div>
                                                        @if ($transaction_type == 7 || $transaction_type == 8 || $transaction_type == 13 || $transaction_type == 14)
                                                            <div class="col-md-12">
                                                                <input type="hidden"
                                                                    id="{{ $transaction_type }}_publickey"
                                                                    class="form-control"
                                                                    name="public_key[{{ $transaction_type }}]"
                                                                    placeholder="{{ trans('labels.client_id') }}"
                                                                    value="{{ $pmdata->public_key }}">
                                                            </div>
                                                        @elseif($transaction_type == 9)
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label for="{{ $transaction_type }}_publickey"
                                                                        class="form-label"> {{ trans('labels.client_id') }}
                                                                    </label>
                                                                    <input type="text" required
                                                                        id="{{ $transaction_type }}_publickey"
                                                                        class="form-control"
                                                                        name="public_key[{{ $transaction_type }}]"
                                                                        placeholder="{{ trans('labels.client_id') }}"
                                                                        value="{{ $pmdata->public_key }}">
                                                                </div>
                                                            </div>
                                                        @elseif($transaction_type == 11)
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label for="{{ $transaction_type }}_publickey"
                                                                        class="form-label">
                                                                        {{ trans('labels.profile_key') }}
                                                                    </label>
                                                                    <input type="text" required
                                                                        id="{{ $transaction_type }}_publickey"
                                                                        class="form-control"
                                                                        name="public_key[{{ $transaction_type }}]"
                                                                        placeholder="{{ trans('labels.profile_key') }}"
                                                                        value="{{ $pmdata->public_key }}">
                                                                </div>
                                                            </div>
                                                        @else
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label for="{{ $transaction_type }}_publickey"
                                                                        class="form-label">
                                                                        {{ trans('labels.public_key') }}
                                                                        <span class="text-danger"> *</span>
                                                                    </label>
                                                                    <input type="text" required
                                                                        id="{{ $transaction_type }}_publickey"
                                                                        class="form-control"
                                                                        name="public_key[{{ $transaction_type }}]"
                                                                        placeholder="{{ trans('labels.public_key') }}"
                                                                        value="{{ $pmdata->public_key }}">
                                                                </div>
                                                            </div>
                                                        @endif

                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label for="{{ $transaction_type }}_secretkey"
                                                                    class="form-label">
                                                                    {{ trans('labels.secret_key') }}
                                                                    <span class="text-danger">*</span></label>
                                                                <input type="text"
                                                                    id="{{ $transaction_type }}_secretkey"
                                                                    class="form-control"
                                                                    name="secret_key[{{ $transaction_type }}]"
                                                                    placeholder="{{ trans('labels.secret_key') }}"
                                                                    @if (env('Environment') == 'sendbox') value="*********" @else  value="{{ $pmdata->secret_key }}" @endif
                                                                    required>
                                                            </div>
                                                        </div>

                                                        @if ($transaction_type == '5')
                                                            <div class="col-md-12">
                                                                <div class="form-group">
                                                                    <label for="encryption_key"
                                                                        class="form-label">{{ trans('labels.encryption_key') }}
                                                                        <span class="text-danger"> *</span>
                                                                    </label>
                                                                    <input type="text" id="encryptionkey"
                                                                        class="form-control" name="encryption_key"
                                                                        placeholder="{{ trans('labels.encryption_key') }}"
                                                                        @if (env('Environment') == 'sendbox') value="*********" @else value="{{ $pmdata->encryption_key }}" @endif
                                                                        required>
                                                                </div>
                                                            </div>
                                                        @endif
                                                        @if ($transaction_type == 11)
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label for="base_url_by_region"
                                                                        class="form-label">{{ trans('labels.base_url_by_region') }}
                                                                    </label>
                                                                    <input type="text" required id="base_url_by_region"
                                                                        class="form-control" name="base_url_by_region"
                                                                        placeholder="{{ trans('labels.base_url_by_region') }}"
                                                                        value="{{ $pmdata->base_url_by_region }}">
                                                                </div>
                                                            </div>
                                                        @endif
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label for="{{ $transaction_type }}currency"
                                                                    class="form-label">
                                                                    {{ trans('labels.currency') }}
                                                                    <span class="text-danger"> *</span>
                                                                </label>
                                                                <input type="text"
                                                                    id="{{ $transaction_type }}currency"
                                                                    class="form-control"
                                                                    name="currency[{{ $transaction_type }}]"
                                                                    placeholder="{{ trans('labels.currency') }}"
                                                                    value="{{ $pmdata->currency }}" required>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label for="image" class="form-label">
                                                                    {{ trans('labels.image') }}
                                                                    <span class="text-danger"> *</span>
                                                                </label>
                                                                <input type="file" class="form-control"
                                                                    name="image">

                                                                <img src="{{ helper::image_path($pmdata->image) }}"
                                                                    alt="" class="img-fluid rounded h-50px mt-1">
                                                            </div>
                                                        </div>
                                                    @elseif($transaction_type == 16)
                                                        <div class="col-md-6 mb-3">
                                                            <label class="form-label" for="barion_payment_image">{{ trans('labels.image') }}</label>
                                                            <input type="file" class="form-control" id="barion_payment_image" name="image" accept="image/png,image/jpeg,image/webp,image/gif">
                                                            <img src="{{ helper::image_path($pmdata->image) }}" alt="" class="img-fluid rounded h-50px mt-2">
                                                        </div>
                                                        <div class="col-12 mb-3">
                                                            <div class="alert alert-info mb-0">
                                                                <strong>{{ trans('admin_ui.barion_test_title') }}</strong>
                                                                <p class="mb-2">{{ trans('admin_ui.barion_test_help') }}</p>
                                                                <details>
                                                                    <summary>{{ trans('admin_ui.barion_technical_details') }}</summary>
                                                                    <p class="admin-help-text mb-1">{{ trans('admin_ui.barion_redirect_label') }}: <code>{{ route('barion.after') }}</code></p>
                                                                    <p class="admin-help-text mb-0">{{ trans('admin_ui.barion_callback_label') }}: <code>{{ route('barion.callback') }}</code></p>
                                                                </details>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6 mb-3">
                                                            <label class="form-label" for="barion_shop_email">{{ trans('admin_ui.barion_shop_email_label') }}</label>
                                                            <input class="form-control" type="email" id="barion_shop_email"
                                                                name="barion_shop_email" autocomplete="off"
                                                                value="{{ old('barion_shop_email', $barionSetting->shop_email ?? '') }}">
                                                            <p class="admin-help-text">{{ trans('admin_ui.barion_shop_email_help') }}</p>
                                                        </div>
                                                        <div class="col-md-6 mb-3">
                                                            <label class="form-label" for="barion_poskey">{{ trans('admin_ui.barion_poskey_label') }}</label>
                                                            <input class="form-control" type="password" id="barion_poskey"
                                                                name="barion_poskey" autocomplete="new-password"
                                                                placeholder="{{ trans(!empty($barionSetting->poskey) ? 'admin_ui.barion_poskey_saved' : 'admin_ui.barion_poskey_empty') }}">
                                                            <p class="admin-help-text">{{ trans('admin_ui.barion_poskey_help') }}</p>
                                                        </div>
                                                        <div class="col-12">
                                                            <p class="admin-help-text">{{ trans('admin_ui.payment_toggle_help') }}</p>
                                                        </div>
                                                    @elseif($transaction_type == 1 || $transaction_type == 17)
                                                        <div class="col-12">
                                                            <p class="admin-help-text">{{ trans($transaction_type == 1 ? 'admin_ui.payment_cash_help' : 'admin_ui.payment_card_receipt_help') }}</p>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label for="image" class="form-label">
                                                                {{ trans('labels.image') }}
                                                                <span class="text-danger"> *</span></label>
                                                            <input type="file" class="form-control" name="image">

                                                            <img src="{{ helper::image_path($pmdata->image) }}"
                                                                alt="" class="img-fluid rounded h-50px mt-1">
                                                        </div>
                                                    @endif

                                                    <div
                                                        class="form-group d-flex flex-wrap gap-3 justify-content-between align-items-center">
                                                        <span class="fw-semibold">{{ trans('admin_ui.payment_available_label') }}</span>
                                                        <input id="checkbox-switch-{{ $transaction_type }}"
                                                            type="checkbox" class="checkbox-switch"
                                                            name="is_available[{{ $transaction_type }}]" value="1"
                                                            aria-label="{{ trans('admin_ui.payment_available_label') }}"
                                                            {{ $pmdata->is_available == 1 ? 'checked' : '' }}>
                                                        <label for="checkbox-switch-{{ $transaction_type }}"
                                                            class="switch">
                                                            <span
                                                                class="{{ session()->get('direction') == 2 ? 'switch__circle-rtl' : 'switch__circle' }}"><span
                                                                    class="switch__circle-inner"></span></span>
                                                            <span
                                                                class="switch__left {{ session()->get('direction') == 2 ? 'pe-2' : 'ps-2' }}">{{ trans('labels.off') }}</span>
                                                            <span
                                                                class="switch__right {{ session()->get('direction') == 2 ? 'ps-2' : 'pe-2' }}">{{ trans('labels.on') }}</span>
                                                        </label>
                                                        <button class="btn btn-primary"
                                                            @if (env('Environment') == 'sendbox') type="button" onclick="myFunction()"
                                                    @else type="submit" @endif>{{ trans('labels.save') }}</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                @endif
                            @endforeach
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
@section('script')
    <script>
        $(document).ready(function() {

            $('.sort_menu').sortable({
                handle: '.handle',
                cursor: 'move',
                placeholder: 'highlight',
                axis: "y",
                header: "> div > h6",
                update: function(e, ui) {
                    var sortData = $('.sort_menu').sortable('toArray', {
                        attribute: 'data-id'
                    })
                    updateToDatabase(sortData.join(','))
                }
            })

            function updateToDatabase(idString) {

                $.ajax({
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                    },
                    type: "POST",
                    dataType: "json",
                    url: $('#accordionExample').attr('data-url'),
                    data: {
                        ids: idString,
                    },
                    success: function(response) {
                        if (response.status == 1) {
                            toastr.success(response.msg);
                        } else {
                            toastr.error('Something went wrong!');
                        }
                    }
                });
            }
        });
    </script>
@endsection
