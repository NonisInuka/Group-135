<%@ page contentType="text/html;charset=UTF-8" %>

<%
String[] user =
((String) request.getAttribute("user")).split(",");
%>

<html>

<head>

    <title>Edit User</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">

</head>

<body>

<div class="container mt-5">

    <h2 class="text-warning">
        Edit User
    </h2>

    <form action="/users/update" method="post">

        <input type="number"
               name="id"
               value="<%= user[0] %>"
               readonly
               class="form-control mt-3">

        <input type="text"
               name="name"
               value="<%= user[1] %>"
               class="form-control mt-3">

        <input type="email"
               name="email"
               value="<%= user[2] %>"
               class="form-control mt-3">

        <input type="text"
               name="password"
               value="<%= user[3] %>"
               class="form-control mt-3">

        <input type="text"
               name="phone"
               value="<%= user[4] %>"
               class="form-control mt-3">

        <button class="btn btn-warning mt-4">

            Update User

        </button>

    </form>

</div>

</body>

</html>