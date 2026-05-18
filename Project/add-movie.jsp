<%@ page contentType="text/html;charset=UTF-8" %>

<html>

<head>

    <title>Add Movie</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <style>

        body{
            background:#f4f6f9;
        }

        .movie-box{

            max-width:700px;

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

    <div class="movie-box">

        <h1 class="text-center
                   text-primary
                   mb-5">

            Add Movie

        </h1>

        <form action="/movies/save"
              method="post">

            <!-- MOVIE ID -->

            <input type="number"
                   name="id"
                   placeholder="Movie ID"
                   class="form-control mt-3"
                   required>

            <!-- TITLE -->

            <input type="text"
                   name="title"
                   placeholder="Movie Title"
                   class="form-control mt-3"
                   required>

            <!-- GENRE -->

            <input type="text"
                   name="genre"
                   placeholder="Genre"
                   class="form-control mt-3"
                   required>

            <!-- DURATION -->

            <input type="text"
                   name="duration"
                   placeholder="Duration"
                   class="form-control mt-3"
                   required>

            <!-- DIRECTOR -->

            <input type="text"
                   name="director"
                   placeholder="Director"
                   class="form-control mt-3"
                   required>

            <!-- RATING -->

            <input type="text"
                   name="rating"
                   placeholder="Rating"
                   class="form-control mt-3"
                   required>

            <!-- IMAGE -->

            <div class="mt-3">

                <label class="form-label">

                    Poster Image Name

                </label>

                <input type="text"
                       name="image"
                       class="form-control"
                       placeholder="avatar.jpg"
                       required>

            </div>

            <!-- SAVE BUTTON -->

            <button class="btn btn-primary
                           w-100
                           mt-4">

                Save Movie

            </button>

        </form>

    </div>

</div>

<jsp:include page="footer.jsp"/>

</body>

</html>