@php($appUrl = config('app.url'))
<p>Szia {{ $name ?? 'Felhasználó' }}!</p>
<p>Kértél jelszó-visszaállítást a(z) {{ $appUrl }} oldalon.</p>
<p>Ide kattintva állíthatod vissza a jelszavad: <a href="{{ $resetUrl }}">{{ $resetUrl }}</a></p>
<p>Ha nem te kérted, hagyd figyelmen kívül ezt az üzenetet.</p>
