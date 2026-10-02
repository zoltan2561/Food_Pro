@extends('web.layout.default')
@section('page_title')
    | {{ trans('labels.menu') }} | {{ @$categorydata->category_name }}
@endsection
@section('content')
    @if (!empty($categorydata))
        @include('web.partials.category-navigation')
        <div class="breadcrumb-sec mb-3">
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
                                {{ $categorydata->category_name }}
                            </li>
                        </ol>

                    </nav>
                </div>
            </div>
        </div>
        <section class="menu-section">
            <div class="container">
                <div class="storefront-menu-heading py-3">
                    <h1 class="h3 fw-bold mb-1">{{ $categorydata->category_name }}</h1>
                    <p class="text-muted mb-0">{{ $getitemlist->total() }} {{ trans('labels.item') }}</p>
                </div>
                <div class="row">
                    <div class="filter-sidebar mb-3">
                        <div class="sidebar-wrap" id="style-3">


                            {{-- ÚJ: Vissza a kategóriákhoz gomb, ha van category param --}}
                            @if(request()->has('category'))
                                <a href="{{ url('categories') }}"
                                   class="back-btn"
                                   aria-label="{{ trans('labels.back_to_categories') }}">
                                    ← {{ trans('labels.back') }}
                                </a>
                            @endif

                        @if (count($subcategories) > 0 || count($getitemlist) > 0 )
                            <a href="{{ URL::to('/menu?category='.$categorydata->slug) }}"
                                class="@if(!isset($_GET['subcategory'])) active @endif">{{ trans('labels.all') }}</a>
                            @endif


                            @foreach ($subcategories as $key => $subcatdata)
                                <a href="{{ URL::to('/menu?category=' . $categorydata->slug . '&subcategory=' . $subcatdata->slug) }}"
                                    class="@if(isset($_GET['subcategory']) && $_GET['subcategory'] == $subcatdata->slug) active @endif">{{ ucfirst($subcatdata->subcategory_name) }}</a>
                            @endforeach
                        </div>
                    </div>
                    @if (count($getitemlist) > 0)
                        <div class="menu my-0">
                            <div class="row g-4 boxes">
                                @foreach ($getitemlist as $itemdata)
                                    @include('web.home1.itemview')
                                @endforeach
                            </div>
                        </div>
                        <div class="mt-5 d-flex justify-content-center">
                            {{ $getitemlist->appends(request()->query())->links() }}
                        </div>
                    @else
                        @include('web.nodata')
                    @endif
                </div>
            </div>
        </section>
        @include('web.subscribeform')
    @else
        @include('web.nodata')
    @endif
@endsection

<style>
    .back-btn{
        border-radius: 9999px;        /* szép “pill” forma */
        padding: .45rem .9rem;
        line-height: 1;
        display: inline-flex;
        align-items: center;
        gap: .35rem;
        transition: all .2s ease;
        box-shadow: 0 1px 0 rgba(0,0,0,.02);
        text-decoration: none !important;
    }
    .back-btn:hover{
        transform: translateY(-1px);
        box-shadow: 0 6px 16px rgba(0,0,0,.08);
        background-color: #ffffff;    /* finom kiemelés */
    }
    .back-btn:active{
        transform: translateY(0);
        box-shadow: 0 3px 10px rgba(0,0,0,.06) inset;
    }
    .back-btn:focus-visible{
        outline: 3px solid #86b7fe;   /* jó fókusz kontraszt */
        outline-offset: 2px;
    }
</style>
