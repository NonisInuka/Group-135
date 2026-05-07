<html>

<head>
    <title>All Users</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-dark">

<div class="container mt-5">

    <div class="card shadow p-4">

        <h2 class="text-center mb-4">
            All Users 📋
        </h2>

        <table class="table table-bordered table-hover">

            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Username</th>
                    <th>Email</th>
                    <th>Mobile</th>
                </tr>
            </thead>

            <tbody>

            <!-- Loop Users -->
            <c:forEach var="user" items="${userList}">

                <tr>
                    <td>${user.id}</td>
                    <td>${user.username}</td>
                    <td>${user.email}</td>
                    <td>${user.mobile}</td>
                </tr>

            </c:forEach>

            </tbody>

        </table>

        <div class="text-center mt-3">

            <a href="/dashboard" class="btn btn-primary">
                Back to Dashboard
            </a>

        </div>

    </div>

</div>

</body>
</html>