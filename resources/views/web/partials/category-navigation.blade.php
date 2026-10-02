<nav class="storefront-category-nav" aria-label="{{ trans('labels.categories') }}">
    <div class="container">
        <a class="storefront-category-link {{ request()->routeIs('categories') ? 'active' : '' }}" href="{{ route('categories') }}" @if (request()->routeIs('categories')) aria-current="page" @endif>
            <i class="fa-solid fa-utensils" aria-hidden="true"></i> {{ trans('labels.all') }}
        </a>
        @foreach (helper::get_categories() as $navigationCategory)
            <a class="storefront-category-link {{ request('category') === $navigationCategory->slug ? 'active' : '' }}"
               href="{{ route('menu', ['category' => $navigationCategory->slug]) }}"
               @if (request('category') === $navigationCategory->slug) aria-current="page" @endif>{{ $navigationCategory->category_name }}</a>
        @endforeach
    </div>
</nav>
