<%@ page contentType="text/html;charset=UTF-8" %>

<html>

<head>

    <title>Register</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <style>

        body{
            background:#f4f6f9;
        }

        .register-card{

            border-radius:20px;
        }

    </style>

</head>

<body>

<div class="container">

    <div class="row justify-content-center">

        <div class="col-md-5">

            <div class="card mt-5 shadow register-card">

                <div class="card-body p-5">

                    <h1 class="text-center text-primary mb-4">

                        Register

                    </h1>

                    <form action="/registerUser"
                          method="post">

                        <!-- USERNAME -->

                        <input type="text"
                               name="username"
                               placeholder="Username"
                               class="form-control mt-3"
                               required>

                        <!-- EMAIL -->

                        <input type="email"
                               name="email"
                               placeholder="Email"
                               class="form-control mt-3"
                               required>

                        <!-- PASSWORD -->

                        <input type="password"
                               name="password"
                               placeholder="Password"
                               class="form-control mt-3"
                               required>

                        <!-- PHONE -->

                        <input type="text"
                               name="phone"
                               placeholder="Phone Number"
                               class="form-control mt-3"
                               required>

                        <!-- REGISTER BUTTON -->

                        <button class="btn btn-primary w-100 mt-4">

                            Register

                        </button>

                    </form>

                    <!-- LOGIN LINK -->

                    <div class="text-center mt-4">

                        <a href="/login">

                            Already have account?

                        </a>

                    </div>

                </div>

            </div>

        </div>

    </div>

</div>

</body>

</html>