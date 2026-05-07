<html>

<head>
    <title>Login</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-dark">

<div class="container mt-5">

    <div class="card shadow p-5 mx-auto" style="max-width:500px;">

        <h2 class="text-center mb-4">
            Login
        </h2>

        <form action="/login" method="post">

            <!-- Email -->
            <div class="mb-3">
                <label>Email</label>

                <input
                    type="email"
                    name="email"
                    class="form-control"
                    required>
            </div>

            <!-- Password -->
            <div class="mb-3">
                <label>Password</label>

                <input
                    type="password"
                    name="password"
                    class="form-control"
                    required>
            </div>

            <!-- Login Button -->
            <button type="submit" class="btn btn-primary w-100">
                Login
            </button>

        </form>

        <!-- Message -->
        <p class="text-danger text-center mt-3">
            ${msg}
        </p>

        <!-- Links -->
        <div class="text-center mt-3">

            <a href="/forgot-password">
                Forgot Password?
            </a>

            <br><br>

            <a href="/register">
                Create Account
            </a>

        </div>

    </div>

</div>

</body>
</html>