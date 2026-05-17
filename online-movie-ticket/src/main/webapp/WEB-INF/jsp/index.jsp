<%@ page contentType="text/html;charset=UTF-8" %>

<%@ page import="java.util.List" %>

<html>

<head>

    <title>Movie Ticket Platform</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <style>

        html{
            scroll-behavior:smooth;
        }

        body{
            background:#f4f6f9;
            overflow-x:hidden;
        }

        /* HERO SECTION */

        .hero{

            height:100vh;

            background:
            linear-gradient(
            rgba(0,0,0,0.75),
            rgba(0,0,0,0.75)),

            url('/images/cinema-bg.jpg');

            background-size:cover;
            background-position:center;

            display:flex;
            justify-content:center;
            align-items:center;

            text-align:center;

            color:white;
        }

        .hero-content{

            animation:fadeIn 2s;
        }

        .hero h1{

            font-size:90px;

            font-weight:bold;

            text-shadow:
            0 0 20px
            rgba(255,255,255,0.5);
        }

        .hero p{

            font-size:28px;

            margin-top:20px;
        }

        .hero .btn{

            margin-top:30px;

            padding:15px 40px;

            font-size:22px;

            border-radius:50px;

            transition:0.3s;
        }

        .hero .btn:hover{

            transform:scale(1.05);
        }

        @keyframes fadeIn {

            from{
                opacity:0;
                transform:translateY(30px);
            }

            to{
                opacity:1;
                transform:translateY(0);
            }
        }

        /* SECTION TITLE */

        .section-title{

            font-size:50px;

            font-weight:bold;

            text-align:center;

            margin-top:100px;

            margin-bottom:60px;

            color:#0d6efd;
        }

        /* MOVIE CARD */

        .movie-card{

            border:none;

            border-radius:25px;

            overflow:hidden;

            transition:0.4s;

            background:white;

            box-shadow:
            0 10px 25px
            rgba(0,0,0,0.15);
        }

        .movie-card:hover{

            transform:
            translateY(-10px)
            scale(1.02);

            box-shadow:
            0 15px 30px
            rgba(0,0,0,0.25);
        }

        .movie-card img{

            height:500px;

            object-fit:cover;
        }

        .movie-card .card-body{

            padding:25px;
        }

        .movie-card h2{

            font-weight:bold;
        }

        /* COMING SOON */

        .coming-card{

            border-radius:25px;

            overflow:hidden;

            transition:0.4s;
        }

        .coming-card:hover{

            transform:
            scale(1.03);
        }

        .coming-card img{

            height:450px;

            object-fit:cover;
        }

        /* FEATURES */

        .feature-box{

            background:white;

            padding:40px;

            border-radius:25px;

            text-align:center;

            box-shadow:
            0 5px 15px
            rgba(0,0,0,0.1);

            transition:0.3s;
        }

        .feature-box:hover{

            transform:
            translateY(-5px);
        }

        .feature-box i{

            font-size:60px;

            color:#0d6efd;

            margin-bottom:20px;
        }

        /* FOOTER */

        footer{

            background:#111;

            color:white;

            margin-top:100px;

            padding:70px 0;
        }

        footer h3{

            margin-bottom:20px;

            font-weight:bold;
        }

        footer a{

            color:white;

            text-decoration:none;
        }

        footer a:hover{

            color:#0d6efd;
        }

    </style>

</head>

<body>

<jsp:include page="navbar.jsp"/>

<!-- HERO SECTION -->

<section class="hero">

    <div class="hero-content">

        <h1>

            Enjoy Your Movie

        </h1>

        <p>

            Experience Cinema Like Never Before

        </p>

        <a href="#movies"
           class="btn btn-primary btn-lg">

            Book Now

        </a>

    </div>

</section>

<!-- NOW SHOWING -->

<div class="container" id="movies">

    <h1 class="section-title">

        Now Showing

    </h1>

    <div class="row">

    <%

    List<String> movies =
    (List<String>) request.getAttribute(
            "movies");

    if(movies != null) {

        for(String movie : movies) {

            if(movie.trim().isEmpty()) {
                continue;
            }

            String[] data =
                    movie.split(",");

            if(data.length < 7) {
                continue;
            }

            String movieName = data[1];
            String genre = data[2];
            String duration = data[3];
            String director = data[4];
            String rating = data[5];
            String image = data[6];
    %>

    <div class="col-md-4 mb-5">

        <div class="card movie-card">

            <img src="/images/<%= image %>"
                 class="w-100">

            <div class="card-body text-center">

                <h2>

                    <%= movieName %>

                </h2>

                <p>

                    <strong>Genre:</strong>
                    <%= genre %>

                </p>

                <p>

                    <strong>Duration:</strong>
                    <%= duration %>

                </p>

                <p>

                    <strong>Director:</strong>
                    <%= director %>

                </p>

                <p>

                    <strong>Rating:</strong>
                    ⭐ <%= rating %>

                </p>

                <a href="/movies/select/<%= movieName %>"
                   class="btn btn-primary btn-lg w-100 rounded-pill">

                    Book Now

                </a>

            </div>

        </div>

    </div>

    <%
        }
    }
    %>

    </div>

</div>

<!-- COMING SOON -->

<div class="container">

    <h1 class="section-title">

        Coming Soon

    </h1>

    <div class="row">

        <div class="col-md-4 mb-4">

            <div class="coming-card shadow-lg">

                <img src="/images/deadpool.jpg"
                     class="w-100">

            </div>

        </div>

        <div class="col-md-4 mb-4">

            <div class="coming-card shadow-lg">

                <img src="/images/joker2.jpg"
                     class="w-100">

            </div>

        </div>

        <div class="col-md-4 mb-4">

            <div class="coming-card shadow-lg">

                <img src="/images/avatar2.jpg"
                     class="w-100">

            </div>

        </div>

    </div>

</div>

<!-- FEATURES -->

<div class="container">

    <h1 class="section-title">

        Why Choose Us

    </h1>

    <div class="row g-4">

        <div class="col-md-4">

            <div class="feature-box">

                <i class="fa-solid fa-ticket"></i>

                <h3>

                    Easy Booking

                </h3>

                <p>

                    Fast and simple online ticket reservation.

                </p>

            </div>

        </div>

        <div class="col-md-4">

            <div class="feature-box">

                <i class="fa-solid fa-couch"></i>

                <h3>

                    Best Seats

                </h3>

                <p>

                    Select your favorite cinema seats instantly.

                </p>

            </div>

        </div>

        <div class="col-md-4">

            <div class="feature-box">

                <i class="fa-solid fa-film"></i>

                <h3>

                    Latest Movies

                </h3>

                <p>

                    Watch the newest blockbuster movies.

                </p>

            </div>

        </div>

    </div>

</div>

<!-- FOOTER -->

<footer>

    <div class="container">

        <div class="row">

            <div class="col-md-4">

                <h3>

                    Movie Ticket Platform

                </h3>

                <p>

                    Professional online movie ticket reservation system.

                </p>

            </div>

            <div class="col-md-4">

                <h3>

                    Contact Us

                </h3>

                <p>

                    <i class="fa-solid fa-phone"></i>
                    +94 77 123 4567

                </p>

                <p>

                    <i class="fa-solid fa-envelope"></i>
                    support@movieplatform.com

                </p>

                <p>

                    <i class="fa-solid fa-location-dot"></i>
                    Colombo, Sri Lanka

                </p>

            </div>

            <div class="col-md-4">
