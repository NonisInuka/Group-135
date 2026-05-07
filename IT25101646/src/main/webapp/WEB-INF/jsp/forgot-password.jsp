<html>

<head>
    <title>Forgot Password</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-dark">

<div class="container mt-5">

    <div class="card shadow p-5 mx-auto" style="max-width:500px;">

        <h2 class="text-center mb-4">
            Forgot Password
        </h2>

        <form action="/forgot-password" method="post">

            <div class="mb-3">
                <label>Email</label>

                <input
                    type="email"
                    name="email"
                    class="form-control"
                    required>
            </div>

            <button type="submit" class="btn btn-primary w-100">
                Send OTP
            </button>

        </form>

        <p class="text-danger text-center mt-3">
            ${msg}
        </p>

        <div class="text-center mt-3">
            <a href="/login">
                Back to Login
            </a>
        </div>

    </div>

</div>

</body>
</html>