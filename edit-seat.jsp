<%@ page contentType="text/html;charset=UTF-8" %>

<%
String[] seat =
((String) request.getAttribute("seat")).split(",");
%>

<html>

<head>

    <title>Edit Seat</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">

</head>

<body>

<div class="container mt-5">

    <h2 class="text-warning">
        Edit Seat
    </h2>

    <form action="/seats/update" method="post">

        <input type="number"
               name="id"
               value="<%= seat[0] %>"
               readonly
               class="form-control mt-3">

        <input type="text"
               name="seatNumber"
               value="<%= seat[1] %>"
               class="form-control mt-3">

        <input type="text"
               name="movieName"
               value="<%= seat[2] %>"
               class="form-control mt-3">

        <select name="status"
                class="form-control mt-3">

            <option value="Available">
                Available
            </option>

            <option value="Reserved">
                Reserved
            </option>

        </select>

        <button class="btn btn-warning mt-4">

            Update Seat

        </button>

    </form>

</div>

</body>

</html>