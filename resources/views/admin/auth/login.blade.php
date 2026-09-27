<!DOCTYPE html>
<html lang="en" dir="{{ session('direction') == 2 ? 'rtl' : 'ltr' }}"
    data-admin-skin="{{ helper::appdata()->admin_skin ?? 'spring' }}">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <meta name="csrf-token" content="{{ csrf_token() }}" />
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>{{ @helper::appdata()->title }}</title>
    <link rel="icon" type="image/png" sizes="16x16" href="{{ helper::image_path(@helper::appdata()->favicon) }}">
    <!-- Favicon icon -->
    <link rel="stylesheet" href="{{ url(env('ASSETSPATHURL') . 'admin-assets/assets/css/bootstrap/bootstrap.min.css') }}">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="{{ url(env('ASSETSPATHURL') . 'admin-assets/assets/css/fontawesome/all.min.css') }}">
    <!-- FontAwesome CSS -->
    <link rel="stylesheet" href="{{ url(env('ASSETSPATHURL') . 'admin-assets/assets/css/toastr/toastr.min.css') }}">
    <!-- FontAwesome CSS -->
    <style>
        body { min-height: 100vh; font-family: system-ui, sans-serif; background: #f4f6f9; }
        .login-admin { min-height: 100vh; overflow: hidden; }
        .login-admin > div { min-height: 100vh; }
        .login-admin .object { display: block; width: 100%; height: 100vh; object-fit: cover; }
        .login-right-content { min-height: 100vh; justify-content: center; padding: 3rem clamp(1.5rem, 5vw, 5rem); }
        .img-logo img { display: block; max-width: min(100%, 280px); max-height: 120px; object-fit: contain; }
        .login-admin input.form-control { width: 100%; }
        .login-admin form { max-width: 420px; }
        @media (max-width: 767.98px) { .login-admin > div { min-height: auto; } .login-right-content { min-height: 100vh; } }
        :root {
            --bs-primary: {{ @helper::appdata()->admin_primary_color != null ? @helper::appdata()->admin_primary_color : '#01112B' }};
            --bs-secondary: {{ @helper::appdata()->admin_secondary_color != null ? @helper::appdata()->admin_secondary_color : '#0a98af' }};
        }
    </style>
    <link rel="stylesheet" href="{{ asset('foodpro-assets/admin.css') }}">
</head>

<body>
    @include('admin.theme.preloader')


    <div class="row align-items-center g-0 w-100 h-100vh position-relative login-admin">
        <div class="col-xl-4 col-lg-5 col-md-6 overflow-hidden bg-black overflow-hidden">
            <div class="login-right-content login-forgot-padding d-flex flex-column">
                <div class="w-100">
                    <div class="img-logo mb-4">
                        <img src="{{ helper::image_path(@helper::appdata()->logo) }}" class="" alt="">
                    </div>
                    <div class="text-primary d-flex justify-content-between">
                        <div>
                            <h2 class="fw-500 text-white title-text mb-2">Food Pro admin</h2>
                            <p class="text-white fs-7">Jelentkezz be az étterem kezeléséhez.</p>
                        </div>
                        <!-- language -->
                        <div class="lag-btn dropdown border-0 shadow-none login-lang">
                            <button class="btn px-2 py-1 border-white" type="button" data-bs-toggle="dropdown"
                                aria-expanded="false">
                                <i class="fa-solid fa-globe fs-6 text-white"></i>
                            </button>
                            <ul class="dropdown-menu drop-menu shadow border-0 drop-menu">
                                @foreach (helper::language() as $lang)
                                    <li>
                                        <a class="dropdown-item d-flex text-start d-flex"
                                            href="{{ URL::to('/language-' . $lang->code) }}">
                                            <img src="{{ helper::image_path($lang->image) }}" alt=""
                                                class="img-fluid mx-1 rounded-5 language-width">
                                            {{ $lang->name }}
                                        </a>
                                    </li>
                                @endforeach
                            </ul>
                        </div>

                    </div>

                    <form class="my-3" method="POST" action="{{ URL::to('admin/check-login') }}" id="login-form">
                        @csrf
                        <div class="form-group">
                            <label for="email" class="form-label fs-7 text-white">Email<span class="text-danger">
                                *
                            </span></label>
                            <input id="email" type="email"
                                class="form-control py-2 @error('email') is-invalid @enderror" name="email"
                                required="" autocomplete="email" autofocus placeholder="{{ trans('labels.email') }}">
                            @error('email')
                                <span class="invalid-feedback" role="alert"><strong>{{ $message }}</strong></span>
                            @enderror
                        </div>
                        <div class="form-group">

                            <label for="password" class="form-label fs-7 text-white">Password<span class="text-danger">
                                * </span></label>
                            <div class="form-control d-flex align-items-center gap-3">
                                <input id="password" type="password"
                                    class="form-control border-0 p-0 @error('password') is-invalid @enderror"
                                    name="password" required autocomplete="current-password"
                                    placeholder="{{ trans('labels.password') }}">
                                <span>
                                    <a href="#"><i class="fa-light fa-eye-slash" id="eye"></i></a>
                                </span>
                            </div>
                            @error('password')
                                <span class="invalid-feedback" role="alert"><strong>{{ $message }}</strong></span>
                            @enderror
                        </div>
                        <div class="d-flex flex-wrap">
                            <div class="form-group mb-2 col-sm-6 col-12 d-flex align-items-center">
                                <input class="form-check-input secondary mt-0" type="checkbox" value="" name="check_terms"
                                    id="check_terms" checked="" required="">
                                <label class="form-check-label cursor-pointer mx-1" for="check_terms">
                                    <span class="fs-7 text-white">
                                Emlékezz rám
                                    </span>
                                </label>
                            </div>

                            <div class="mb-2 col-sm-6 col-12 text-sm-end">
                                <a href="{{ URL::to('admin/forgot-password') }}" class="text-white fs-7 fw-500">
                                    <i
                                        class="fa-solid fa-lock-keyhole fs-7 {{ session()->get('direction') == 2 ? 'ms-1' : 'me-1' }}"></i>{{ trans('labels.forgot_password_q') }}
                                </a>
                            </div>
                        </div>

                        <button class="btn btn-secondary w-100 py-2 my-3" type="submit">{{ trans('labels.signin') }}</button>

                    </form>
                </div>
            </div>
        </div>
        <div class="col-xl-8 col-lg-7 col-md-6 d-md-block d-none">

            <div class="image-1">
                <img src="{{helper::image_path(@helper::appdata()->auth_bg_image)}}"
                    alt="" class="object h-100vh">
            </div>
        </div>
    </div>



    <script src="{{ url(env('ASSETSPATHURL') . 'admin-assets/assets/js/jquery/jquery.min.js') }}"></script>
    <script src="{{ url(env('ASSETSPATHURL') . 'admin-assets/assets/js/bootstrap/bootstrap.bundle.min.js') }}"></script>
    <script>
        @if (Session::has('success'))
            console.info(@json(session('success')));
        @endif
        @if (Session::has('error'))
            console.error(@json(session('error')));
        @endif
        $(window).on("load", function() {
            "use strict";
            $('#preloader').hide();
        });
    </script>
    <script>
        function AdminFill(email, password) {
            $('#email').val(email);
            $('#password').val(password);
        }
        
        $(document).on("click", "#admin_free_addon_login", function() {
            $("#admin_free_addon_login").attr("disabled", true);

            $("#email").val('admin@gmail.com');
            $("#password").val('123456');
            SessionSave('free-addon');
        });

        $(document).on("click", "#all-addon", function() {
            $("#all-addon").attr("disabled", true);

            $("#email").val('admin@gmail.com');
            $("#password").val('123456');
            SessionSave('all-addon');
        });

        function SessionSave(addon = null) {

            $.ajax({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
                type: "POST",
                dataType: "json",
                url: "{{ URL::to('add-on/session/save') }}",
                data: {
                    'demo_type': addon,
                },
                success: function(response) {
                    $('#login-form').submit();
                }
            });
        }
    </script>
</body>

</html>
