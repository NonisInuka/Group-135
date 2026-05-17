<html>

<head>

    <title>Admin Login</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">

</head>

<body class="bg-light">

<div class="container">

    <div class="row justify-content-center">

        <div class="col-md-5">

            <div class="card mt-5 shadow">

                <div class="card-body">

                    <h2 class="text-center text-danger">

                        Admin Login

                    </h2>

                    <form action="/adminLogin"
                          method="post">

                        <input type="email"
                               name="email"
                               class="form-control mt-3"
                               placeholder="Admin Email">

                        <input type="password"
                               name="password"
                               class="form-control mt-3"
                               placeholder="Password">

                        <button class="btn btn-danger
                                       w-100
                                       mt-4">

                            Login

                        </button>

                    </form>

                    <div class="text-danger text-center mt-3">

                        ${error}

                    </div>

                </div>

            </div>

        </div>

    </div>

</div>

</body>

</html>