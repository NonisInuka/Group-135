<html>
<head>
    <title>Register</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-dark">

<div class="container mt-5">

    <div class="card p-4 mx-auto shadow" style="max-width:500px;">

        <h2 class="text-center mb-4">Register</h2>

        <form action="/register" method="post">

            <div class="mb-3">
                <label>Username</label>
                <input type="text" name="username" class="form-control">
            </div>

            <div class="mb-3">
                <label>Email</label>
                <input type="email" name="email" class="form-control">
            </div>

            <div class="mb-3">
                <label>Mobile</label>
                <input type="text" name="mobile" class="form-control">
            </div>

            <div class="mb-3">
                <label>Password</label>
                <input type="password" name="password" class="form-control">
            </div>

            <div class="mb-3">
                <label>Confirm Password</label>
                <input type="password" name="confirmPassword" class="form-control">
            </div>

            <button class="btn btn-primary w-100">
                Register
            </button>

        </form>

        <p class="text-danger mt-3 text-center">${msg}</p>

        <a href="/login" class="text-center mt-2">
            Already have an account?
        </a>

    </div>

</div>

</body>
</html>