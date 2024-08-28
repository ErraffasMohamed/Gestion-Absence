<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Laravel</title>

        <!-- Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,600" rel="stylesheet">

        <!-- Styles -->
        <style>
            html, body {
                background-color: #fff;
                color: #636b6f;
                font-family: 'Nunito', sans-serif;
                font-weight: 200;
                height: 100vh;
                margin: 0;
            }
            body{
                display:flex;
                flex-direction:column;
            }

            .full-height {
                height: 100px;
                /* background:black; */
                display:flex;
                justify-content:space-between;
                align-items:center;
            }

            .flex-center {
                align-items: center;
                display: flex;
                justify-content: center;
            }

            .position-ref {
                position: relative;
            }

            .top-right {
                position: absolute;
                right: 10px;
                top: 18px;
            }

            .content {
                text-align: center;
            }

            .title {
                font-size: 84px;
            }

            .links > a {
                color: #636b6f;
                padding: 0 25px;
                font-size: 13px;
                font-weight: 600;
                letter-spacing: .1rem;
                text-decoration: none;
                text-transform: uppercase;
            }

            .m-b-md {
                margin-bottom: 30px;
            }
            main{
                dispaly:flex;
            }

            section {
      max-width: 800px;
      margin: 2em auto;
      padding: 1em;
      background-color: #fff;
      border-radius: 8px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    h1 {
      color: #333;
    }

    p {
      color: #666;
    }

    footer {
      background-color: #333;
      color: #fff;
      padding: 1em;
      text-align: center;
      position: fixed;
      bottom: 0;
      width: 100%;
    }
        </style>
    </head>
    <body>
        <div class="flex-center position-ref full-height">
            <h1>Abscence Management</h1>
            @if (Route::has('login'))
                <div class="top-right links">
                    @auth
                        <a href="{{ url('/home') }}">Home</a>
                    @else
                        <a href="{{ route('login') }}">Login</a>

                        @if (Route::has('register'))
                            <a href="{{ route('register') }}">Register</a>
                        @endif
                    @endauth
                </div>

            @endif
        </div>

<main>
<section>
    <h2>About Us</h2>
    <p>
        Welcome to our Attendance Management System. 
      Streamline the process of recording and monitoring student absences effortlessly
    </p>
  </section>

  <section>
    <h2>Get Started</h2>
    <p>
      If you are new here, sign up and explore the features.
      If you are already a user, log in to access your account.
    </p>
                <div class="top-right links">
                        <a href="{{ route('login') }}">Login</a>

                    <a href="{{ route('register') }}">Register</a>
                </div>

  </section>
</main>

  <footer>
    &copy; 2023 management Abscence. All rights reserved.
  </footer>
</body>
</html>
