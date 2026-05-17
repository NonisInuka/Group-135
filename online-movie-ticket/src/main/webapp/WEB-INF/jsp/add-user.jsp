<%@ page contentType="text/html;charset=UTF-8" %>

<html>

<head>

    <title>Add User</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">

</head>

<body>

<div class="container mt-5">

    <h2 class="text-primary">
        Add User
    </h2>

    <form action="/users/save" method="post">

        <input type="number"
               name="id"
               placeholder="User ID"
               class="form-control mt-3">

        <input type="text"
               name="name"
               placeholder="Name"
               class="form-control mt-3">

        <input type="email"
               name="email"
               placeholder="Email"
               class="form-control mt-3">

        <input type="password"
               name="password"
               placeholder="Password"
               class="form-control mt-3">

        <input type="text"
               name="phone"
               placeholder="Phone"
               class="form-control mt-3">

        <button class="btn btn-primary mt-4">

            Save User

        </button>

    </form>

</div>

</body>

</html>