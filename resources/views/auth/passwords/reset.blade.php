<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>{{ helper::appdata()->title }} | Új jelszó</title>
    <link rel="icon" href="{{ helper::image_path(helper::appdata()->favicon) }}">
    <link rel="stylesheet" href="{{ asset('web-assets/css/bootstrap.min.css') }}">
    <link rel="stylesheet" href="{{ asset('web-assets/css/style.css') }}">
</head>
<body>
<main class="auth_form_container container d-flex justify-content-center align-items-center">
    <div class="auth_form_inner password-reset-card">
        <a href="{{ route('home') }}"><img src="{{ helper::image_path(helper::appdata()->logo) }}"
            alt="{{ helper::appdata()->title }}" class="login-form-logo"></a>
        <h1>Új jelszó beállítása</h1>
        <p class="text-muted mb-4">Adj meg egy legalább 8 karakteres új jelszót.</p>
        @if ($errors->any())
            <div class="alert alert-danger" role="alert">
                <ul class="mb-0">@foreach ($errors->all() as $error)<li>{{ $error }}</li>@endforeach</ul>
            </div>
        @endif
        <form method="POST" action="{{ route('password.update') }}">
            @csrf
            <input type="hidden" name="token" value="{{ $token }}">
            <input type="hidden" name="email" value="{{ request('email', $email ?? '') }}">
            <label for="password" class="form-label fw-semibold">Új jelszó</label>
            <input id="password" type="password" name="password" class="form-control mb-3"
                autocomplete="new-password" minlength="8" required>
            <label for="password_confirmation" class="form-label fw-semibold">Új jelszó megerősítése</label>
            <input id="password_confirmation" type="password" name="password_confirmation"
                class="form-control mb-4" autocomplete="new-password" minlength="8" required>
            <button type="submit" class="btn btn-primary">Jelszó frissítése</button>
        </form>
        <a href="{{ route('login') }}" class="d-inline-block mt-4">← Vissza a bejelentkezéshez</a>
    </div>
</main>
</body>
</html>