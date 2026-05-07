<html>

<head>
    <title>Verify OTP</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-dark">

<div class="container mt-5">

    <div class="card shadow p-5 mx-auto" style="max-width:500px;">

        <h2 class="text-center mb-4">
            Enter OTP Code
        </h2>

        <form action="/verify-code" method="post">

            <!-- Hidden Email -->
            <input type="hidden" name="email" value="${email}">

            <!-- OTP Input -->
            <div class="mb-3">

                <label>OTP Code</label>

                <input
                    type="text"
                    name="code"
                    class="form-control"
                    placeholder="Enter OTP"
                    required>

            </div>

            <!-- Verify Button -->
            <button type="submit" class="btn btn-primary w-100">
                Verify OTP
            </button>

        </form>

        <!-- Message -->
        <p class="text-danger text-center mt-3">
            ${msg}
        </p>

        <!-- Back -->
        <div class="text-center mt-3">
            <a href="/forgot-password">
                Back
            </a>
        </div>

    </div>

</div>

</body>
</html>