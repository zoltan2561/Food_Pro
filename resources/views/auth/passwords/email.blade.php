<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>{{ helper::appdata()->title }} | Elfelejtett jelszó</title>
    <link rel="icon" href="{{ helper::image_path(helper::appdata()->favicon) }}">
    <link rel="stylesheet" href="{{ asset('web-assets/css/bootstrap.min.css') }}">
    <link rel="stylesheet" href="{{ asset('web-assets/css/style.css') }}">
</head>
<body>
<main class="auth_form_container container d-flex justify-content-center align-items-center">
    <div class="auth_form_inner password-reset-card">
        <a href="{{ route('home') }}"><img src="{{ helper::image_path(helper::appdata()->logo) }}"
            alt="{{ helper::appdata()->title }}" class="login-form-logo"></a>
        <h1>Elfelejtett jelszó</h1>
        <p class="text-muted mb-4">Add meg az e-mail címedet, és küldünk egy hivatkozást a jelszó visszaállításához.</p>
        @if (session('status'))
            <div class="alert alert-success" role="status">{{ session('status') }}</div>
        @endif
        @if ($errors->any())
            <div class="alert alert-danger" role="alert">{{ $errors->first('email') }}</div>
        @endif
        <form method="POST" action="{{ route('password.email') }}">
            @csrf
            <label for="email" class="form-label fw-semibold">E-mail cím</label>
            <input id="email" name="email" type="email" value="{{ old('email') }}"
                class="form-control mb-3" autocomplete="email" required autofocus>
            <button type="submit" class="btn btn-primary">Visszaállító hivatkozás küldése</button>
        </form>
        <a href="{{ route('login') }}" class="d-inline-block mt-4">← Vissza a bejelentkezéshez</a>
    </div>
</main>
</body>
</html>