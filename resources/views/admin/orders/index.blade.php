@extends('admin.theme.default')
@section('content')
    @include('admin.breadcrumb')
    <div class="container-fluid">
        @include('admin.orders.statistics')
        <p class="admin-status-legend">{{ trans('admin_ui.orders_legend') }}</p>
        @if ($getorders->isEmpty())
            <div class="admin-empty-state">
                <i class="fa-solid fa-receipt" aria-hidden="true"></i>
                <h2 class="h5">{{ trans('admin_ui.orders_empty') }}</h2>
                <p>{{ trans('admin_ui.orders_empty_help') }}</p>
            </div>
        @endif
        <div class="row">
            <div class="col-12">
                <div class="card border-0">
                    <div class="card-body">
                        <div class="table-responsive" id="table-display">
                            @include('admin.orders.orderstable')
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Modal -->
    <div class="modal fade" id="paymentModal" tabindex="-1" aria-labelledby="paymentModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="paymentModalLabel">{{ trans('admin_ui.record_payment') }}</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form action=" {{ URL::to('admin/orders/payment_status-' . '2') }}" method="post"
                    enctype="multipart/form-data">
                    @csrf
                    <div class="modal-body">
                        <p class="admin-help-text">{{ trans('admin_ui.record_payment_help') }}</p>
                        <div>
                            <input type="hidden" id="booking_number" name="booking_number" value="">
                            <label for="modal_total_amount" class="form-label">
                                {{ trans('labels.total') }} {{ trans('labels.amount') }}
                            </label>
                            <input type="text" class="form-control numbers_only" name="modal_total_amount"
                                id="modal_total_amount" disabled value="">

                            <p id="card_payment_notice" class="alert alert-info mt-3 d-none mb-0">Csak akkor jelöld fizetettnek, ha a terminálon sikeres volt a tranzakció.</p>
                            <div id="cash_payment_fields">
                                <label for="modal_amount" class="form-label mt-2">
                                    {{ trans('labels.cash_received') }}
                                </label>
                                <input type="text" class="form-control numbers_only" name="modal_amount" id="modal_amount"
                                    value="" onkeyup="validation($(this).val())">
                                <label for="ramin_amount" class="form-label mt-2">
                                    {{ trans('labels.change_amount') }}
                                </label>
                            </div>
                            <input type="number" class="form-control" name="ramin_amount" id="ramin_amount" value=""
                                readonly>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-secondary">{{ trans('labels.submit') }}</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
@endsection
@section('script')
    <script>
        function codpayment(booking_number, grand_total, payment_type) {
            $('#modal_total_amount').val(grand_total);
            $('#booking_number').val(booking_number);
            const card = payment_type === 17;
            $('#card_payment_notice').toggleClass('d-none', !card);
            $('#cash_payment_fields').toggleClass('d-none', card);
            $('#ramin_amount').toggleClass('d-none', card).val(card ? 0 : '');
            $('#modal_amount').val('');
            $('#paymentModal').modal('show');
        }

        function validation(value) {
            var remaining = $('#modal_total_amount').val() - value;
            $('#ramin_amount').val(remaining.toFixed(2));
        }
    </script>
    <script src="{{ url(env('ASSETSPATHURL') . 'admin-assets/assets/js/custom/orders.js') }}"></script>
@endsection
