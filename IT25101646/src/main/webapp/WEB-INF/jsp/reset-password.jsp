<html>

<head>
    <title>Reset Password</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-dark">

<div class="container mt-5">

    <div class="card shadow p-5 mx-auto" style="max-width:500px;">

        <h2 class="text-center mb-4">
            Reset Password
        </h2>

        <form action="/reset-password" method="post">

            <!-- Hidden Email -->
            <input type="hidden" name="email" value="${email}">

            <!-- New Password -->
            <div class="mb-3">
                <label>New Password</label>

                <input
                    type="password"
                    name="password"
                    class="form-control"
                    required>
            </div>

            <!-- Confirm Password -->
            <div class="mb-3">
                <label>Confirm Password</label>

                <input
                    type="password"
                    name="confirmPassword"
                    class="form-control"
                    required>
            </div>

            <!-- Button -->
            <button type="submit" class="btn btn-success w-100">
                Reset Password
            </button>

        </form>

        <!-- Message -->
        <p class="text-danger text-center mt-3">
            ${msg}
        </p>

        <!-- Back -->
        <div class="text-center mt-3">
            <a href="/login">
                Back to Login
            </a>
        </div>

    </div>

</div>

</body>
</html>