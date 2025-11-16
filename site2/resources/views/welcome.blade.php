<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Serveur 2</title>
        
    </head>
    <body>
        @if (Route::has('login'))
            <div class="auth-links">
                @auth
                    <a href="{{ url('/dashboard') }}">Dashboard</a>
                @else
                    @if (Route::has('login'))
                        <a href="{{ route('login') }}">Log in</a>
                    @endif

                    @if (Route::has('register'))
                        <a href="{{ route('register') }}">Register</a>
                    @endif
                @endauth
            </div>
        @endif

        <div class="card">
            <h1 class="title">Serveur 2</h1>
        </div>
    </body>
</html>
