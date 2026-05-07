<html>

<head>
    <title>Dashboard</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-dark">

<div class="container mt-5">

    <div class="card shadow p-5 text-center mx-auto" style="max-width:600px;">

        <h1 class="mb-4">
            Welcome ${username} 🎉
        </h1>

        <p class="text-muted">
            You have successfully logged in.
        </p>

        <div class="mt-4">

            <a href="/users" class="btn btn-primary me-2">
                View Users
            </a>

            <a href="/logout" class="btn btn-danger">
                Logout
            </a>

        </div>

    </div>

</div>

</body>
</html>