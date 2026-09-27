@extends('web.layout.default')
@section('page_title')
    | {{ trans('labels.allergen_table') }}
@endsection
@section('content')
    <div class="breadcrumb-sec">
        <div class="container">
            <div class="breadcrumb-sec-content">
                <nav class="text-dark breadcrumb-divider" aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a class="text-dark fw-600" href="{{ url('/') }}">{{ trans('labels.home') }}</a></li>
                        <li class="breadcrumb-item active" aria-current="page">{{ trans('labels.allergen_table') }}</li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>
    <section class="container my-5">
        <div class="mb-4">
            <h1 class="h2 fw-bold">{{ trans('labels.allergen_table') }}</h1>
            <p class="text-muted mb-0">{{ trans('labels.allergen_advice') }}</p>
        </div>
        <details class="rounded-4 border bg-white p-3 mb-4">
            <summary class="fw-semibold">{{ trans('labels.allergen_legend') }}</summary>
            <ol class="row row-cols-1 row-cols-sm-2 row-cols-lg-3 g-2 mt-2 mb-0 ps-4">
                @for ($number = 1; $number <= 14; $number++)
                    <li class="col">{{ trans('labels.allergen_' . $number) }}</li>
                @endfor
            </ol>
        </details>
        @if ($items->isEmpty())
            @include('web.nodata')
        @else
            <div class="table-responsive rounded-4 border shadow-sm">
                <table class="table table-hover align-middle mb-0">
                    <thead class="table-light">
                        <tr>
                            <th scope="col" class="ps-4">{{ trans('labels.item') }}</th>
                            <th scope="col">{{ trans('labels.allergens') }}</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($items as $item)
                            <tr>
                                <th scope="row" class="ps-4"><a href="{{ route('itemdetails', $item->slug) }}">{{ $item->item_name }}</a></th>
                                <td>{{ trim(preg_replace('/\s+/', ' ', strip_tags($item->item_allergens))) }}</td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        @endif
    </section>
@endsection
