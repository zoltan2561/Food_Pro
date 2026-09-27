
<section class="newsletter mt-5">
    <div class="container">
        <div class="row align-items-center justify-content-between p-md-5 p-0">
            <div class="col-md-8 col-12 newsletter-heading">
                <h1 class="text-capitalize mt-4 mb-3">{{ trans('labels.newsletter') }}</h1>
                <p>{{ trans('labels.subscribe_description') }}</p>
                <form action="{{ route('subscribe') }}" method="POST" class="form-floating d-flex pb-4">
                    @csrf
                    <input type="email" name="subscribe_email" class="w-100 p-3 rounded-2 border-0" placeholder="{{ trans('labels.email') }}" required>
                    <button type="submit" class="btn btn-primary px-md-5 px-2 fs-md-6 fs-7 text-uppercase {{ session()->get('direction') == '2' ? 'me-2' : 'ms-2' }}">{{ trans('labels.subscribe') }}</button>
                </form>
            </div>
            <div class="newsletter-img col-4 d-md-block d-none">
                <img src="{{ helper::image_path(@helper::appdata()->subscribe_newsletter_image) }}" class="w-100" alt="">
            </div>
        </div>
    </div>
</section>
