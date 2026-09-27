<!-- Footer Start Here -->
<footer>
    <!------------------- Footer Features Start Here ------------------->
    <div class="theme-2-product-service">
        <div class="container">
            <div class="row justify-content-center my-4">
                @foreach (helper::footer_features() as $feature)
                    <div class="col-xl-3 col-md-6 col-sm-6">
                        <div class="card border-0 bg-transparent">
                            <div class="card-body d-flex gap-3 p-md-3 p-2">
                                <div class="quality-icon col-3">
                                    {!! $feature->icon !!}
                                </div>
                                <div class="quality-content">
                                    <h3>{{ $feature->title }}</h3>
                                    <p class="m-0 text-muted fs-7">{{ $feature->description }}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                @endforeach
            </div>
        </div>
    </div>
    <!------------------- Footer Features End Here ------------------->

    <div class="footer pt-3">
        <div class="container">
            <div class="py-sm-5 py-4 border-bottom-primary">
                <div class="row justify-content-between g-4 footer-area py-4">
                    <div class="col-lg-4 left-side mt-3">
                        <a href="{{ route('home') }}">
                            <img src="{{ helper::image_path(@helper::appdata()->footer_logo ?: @helper::appdata()->logo) }}" height="55" class="my-3"
                                alt="footer_logo">
                        </a>
                        <h1>{{ @helper::appdata()->footer_title }}</h1>
                        <p class="mb-0">{{ @helper::appdata()->footer_description }}</p>
                    </div>

                    <div class="col-lg-8 right-side">
                        <div class="row g-3">
                            <div class="col-md-4 col-lg-4 col-xl-4 col-6 mb-4 mb-sm-0">
                                <h4>{{ trans('labels.pages') }}</h4>
                                <ul>
                                    @foreach (\App\Support\SiteNavigation::links('footer_pages', $siteSettings ?? null) as $link)
                                        <li><a href="{{ $link['url'] }}" class="text-white">{{ $link['label'] }}</a></li>
                                    @endforeach
                                </ul>
                            </div>
                            <div class="col-md-4 col-lg-4 col-xl-4 col-6 mb-4 mb-sm-0">
                                <h4>{{ trans('labels.other') }}</h4>
                                <ul>
                                    @foreach (\App\Support\SiteNavigation::links('footer_other', $siteSettings ?? null) as $link)
                                        <li><a href="{{ $link['url'] }}" class="text-white">{{ $link['label'] }}</a></li>
                                    @endforeach
                                </ul>
                            </div>
                            <div class="col-md-4 col-lg-4 col-xl-4 col-12 mb-4 mb-sm-0">
                                <h4>{{ trans('labels.help_contact_us') }}</h4>
                                <ul class="contact-detail">
                                    <a href="callto:{{ helper::appdata()->mobile }}">
                                        <li class="d-flex align-items-center text-white">
                                            <i
                                                class="fa-light fa-phone {{ session()->get('direction') == '2' ? 'ms-2' : 'me-2' }}"></i>
                                            <p class="mb-0">{{ helper::appdata()->mobile }}</p>
                                        </li>
                                    </a>
                                    <a href="mailto:{{ helper::appdata()->email }}">
                                        <li class="d-flex align-items-center text-white">
                                            <i
                                                class="fa-light fa-envelope {{ session()->get('direction') == '2' ? 'ms-2' : 'me-2' }}"></i>
                                            <p class="mb-0">{{ helper::appdata()->email }}</p>
                                        </li>
                                    </a>
                                </ul>
                                <div class="col-auto mt-3 d-flex flex-wrap gap-2">
                                    @foreach (helper::sociallinks() as $sociallink)
                                        <div class="footer-box">
                                            <a class="text-white " href="{{ $sociallink->link }}" target="_blank">
                                                {!! $sociallink->icon !!} </a>

                                        </div>
                                    @endforeach
                                </div>
                            </div>
                        </div>
                        @if (\App\Models\Payment::where('payment_type', 16)->where('is_activate', 1)->where('is_available', 1)->exists())
                            <span class="badge text-bg-light mt-2">{{ trans('labels.sandbox_payment') }}</span>
                        @endif
                    </div>
                </div>
            </div>
        <div class="container text-center py-3 text-muted small">{{ date('Y') }} · {{ helper::appdata()->copyright ?: helper::appdata()->title }}</div>





</footer>
<!-- Footer End here -->
