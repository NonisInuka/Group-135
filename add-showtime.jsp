<%@ page contentType="text/html;charset=UTF-8" %>

<html>

<head>

    <title>Add Showtime</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <style>

        body{
            background:#f4f6f9;
        }

        .form-box{

            max-width:600px;

            margin:auto;

            margin-top:50px;

            background:white;

            padding:40px;

            border-radius:20px;

            box-shadow:
            0 0 20px
            rgba(0,0,0,0.2);
        }

    </style>

</head>

<body>

<jsp:include page="navbar.jsp"/>

<div class="container">

    <div class="form-box">

        <h1 class="text-center mb-4">

            Add Showtime

        </h1>

        <form action="/showtimes/save"
              method="post">

            <!-- ID -->

            <input type="number"
                   name="id"
                   class="form-control mb-3"
                   placeholder="Showtime ID"
                   required>

            <!-- MOVIE -->

            <input type="text"
                   name="movieName"
                   class="form-control mb-3"
                   placeholder="Movie Name"
                   required>

            <!-- DATE -->

            <input type="date"
                   name="date"
                   class="form-control mb-3"
                   required>

            <!-- TIME -->

            <input type="text"
                   name="showTime"
                   class="form-control mb-3"
                   placeholder="Example: 9AM"
                   required>

            <!-- THEATER -->

            <input type="text"
                   name="theater"
                   class="form-control mb-4"
                   placeholder="Example: IMAX"
                   required>

            <button class="btn btn-success w-100">

                Save Showtime

            </button>

        </form>

    </div>

</div>

<jsp:include page="footer.jsp"/>

</body>

</html>