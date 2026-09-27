@extends('web.layout.default')
@section('page_title')
    | {{ trans('labels.categories') }}
@endsection
@section('content')
    <div class="breadcrumb-sec">
        <div class="container">
            <div class="breadcrumb-sec-content">
                <nav class="text-dark breadcrumb-divider" aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a class="text-dark fw-600" href="{{ URL::to('/') }}">{{ trans('labels.home') }}</a>
                        </li>

                        {{-- ÚJ: Kategóriák link a lista oldalra --}}
                        <li class="breadcrumb-item">
                            <a class="text-dark fw-600" href="{{ url('categories') }}">{{ trans('labels.categories') }}</a>
                        </li>

                        {{-- Aktuális kategória neve --}}
                        <li class="breadcrumb-item active" aria-current="page">
                            {{ $currentCategory->category_name ?? \Illuminate\Support\Str::headline(str_replace('-', ' ', request('category'))) }}
                        </li>
                    </ol>

                </nav>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row g-3 mb-3 mt-5">
            @foreach (helper::get_categories() as $categorydata)
                <div class="col-lg-2 col-md-3 col-sm-4 col-6">
                    <div class="category-wrapper mx-2">
                        <a href="{{ URL::to('/menu/?category=' . $categorydata->slug) }}">
                            <div class="cat rounded-circle mx-auto">
                                <img src="{{ helper::image_path($categorydata->image) }}" class="rounded-circle"
                                    alt="category">
                            </div>
                        </a>
                        <p class="my-2 text-center">{{ $categorydata->category_name }}</p>
                    </div>
                </div>
            @endforeach
        </div>
    </div>

    @include('web.subscribeform')
@endsection
