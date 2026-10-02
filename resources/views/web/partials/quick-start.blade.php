<section class="storefront-quick-start" aria-label="{{ trans('labels.menu_cta') }}">
    <div class="container">
        <form action="{{ route('search') }}" method="get" role="search">
            <label class="visually-hidden" for="storefront-food-search">{{ trans('labels.search') }}</label>
            <input id="storefront-food-search" type="search" name="itemname" placeholder="{{ trans('labels.search_here') }}" enterkeyhint="search" required>
            <button class="btn btn-primary" type="submit" aria-label="{{ trans('labels.search') }}"><i class="fa-solid fa-magnifying-glass" aria-hidden="true"></i></button>
        </form>
        <a class="btn btn-outline-primary" href="{{ route('categories') }}"><i class="fa-solid fa-utensils" aria-hidden="true"></i> {{ trans('labels.menu_cta') }}</a>
        <button class="btn btn-light" type="button" data-bs-toggle="modal" data-bs-target="#modal_working_hours"><i class="fa-regular fa-clock" aria-hidden="true"></i> {{ trans('labels.working_hours') }}</button>
    </div>
</section>
