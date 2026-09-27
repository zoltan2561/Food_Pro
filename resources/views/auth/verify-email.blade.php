<h1>Kérjük, erősítsd meg az e-mail címedet</h1>
<p>Küldtünk egy megerősítő linket az e-mail címedre.</p>

@if (session('status') === 'verification-link-sent')
    <div class="alert alert-success">Új megerősítő linket küldtünk.</div>
@endif

<form method="POST" action="{{ route('verification.send') }}">
    @csrf
    <button type="submit">Megerősítő e-mail újraküldése</button>
</form>
