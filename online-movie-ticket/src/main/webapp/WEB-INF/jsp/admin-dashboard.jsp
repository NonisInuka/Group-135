<%@ page contentType="text/html;charset=UTF-8" %>

<html>

<head>

    <title>Admin Dashboard</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <!-- CHART JS -->

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <style>

        body{
            background-color:#f4f6f9;
        }

        .dashboard-card{

            border-radius:15px;

            padding:30px;

            color:white;

            text-align:center;

            box-shadow:
            0 5px 10px
            rgba(0,0,0,0.2);

            transition:0.3s;
        }

        .dashboard-card:hover{

            transform:scale(1.03);
        }

        .card-users{
            background:#0d6efd;
        }

        .card-movies{
            background:#198754;
        }

        .card-showtimes{
            background:#ffc107;
            color:black;
        }

        .card-seats{
            background:#dc3545;
        }

        .card-bookings{
            background:#212529;
        }

        .card-revenue{
            background:#20c997;
        }

        .card-popular{
            background:#6f42c1;
        }

    </style>

</head>

<body>

<jsp:include page="navbar.jsp"/>

<div class="container mt-5 mb-5">

    <h1 class="text-center mb-5">

        Admin Dashboard

    </h1>

    <div class="row g-4">

        <!-- USERS -->

        <div class="col-md-4">

            <div class="dashboard-card card-users">

                <h2>

                    Total Users

                </h2>

                <h1>

                    ${totalUsers}

                </h1>

            </div>

        </div>

        <!-- MOVIES -->

        <div class="col-md-4">

            <div class="dashboard-card card-movies">

                <h2>

                    Total Movies

                </h2>

                <h1>

                    ${totalMovies}

                </h1>

            </div>

        </div>

        <!-- SHOWTIMES -->

        <div class="col-md-4">

            <div class="dashboard-card card-showtimes">

                <h2>

                    Total Showtimes

                </h2>

                <h1>

                    ${totalShowtimes}

                </h1>

            </div>

        </div>

        <!-- SEATS -->

        <div class="col-md-6">

            <div class="dashboard-card card-seats">

                <h2>

                    Total Seats

                </h2>

                <h1>

                    ${totalSeats}

                </h1>

            </div>

        </div>

        <!-- BOOKINGS -->

        <div class="col-md-6">

            <div class="dashboard-card card-bookings">

                <h2>

                    Total Bookings

                </h2>

                <h1>

                    ${totalBookings}

                </h1>

            </div>

        </div>

        <!-- REVENUE -->

        <div class="col-md-6">

            <div class="dashboard-card card-revenue">

                <h2>

                    Total Revenue

                </h2>

                <h1>

                    Rs.${revenue}

                </h1>

            </div>

        </div>

        <!-- POPULAR MOVIE -->

        <div class="col-md-6">

            <div class="dashboard-card card-popular">

                <h2>

                    Most Popular Movie

                </h2>

                <h1>

                    ${popularMovie}

                </h1>

            </div>

        </div>

    </div>

    <!-- CHART SECTION -->

    <div class="row mt-5">

        <!-- BOOKINGS CHART -->

        <div class="col-md-6">

            <div class="card p-4 shadow">

                <h3 class="text-center mb-4">

                    Movie Bookings

                </h3>

                <canvas id="bookingChart">

                </canvas>

            </div>

        </div>

        <!-- REVENUE CHART -->

        <div class="col-md-6">

            <div class="card p-4 shadow">

                <h3 class="text-center mb-4">

                    Revenue Analytics

                </h3>

                <canvas id="revenueChart">

                </canvas>

            </div>

        </div>

    </div>

</div>

<jsp:include page="footer.jsp"/>

<!-- CHART SCRIPT -->

<script>

    // BOOKING BAR CHART

    const bookingChart =
        new Chart(

        document.getElementById(
            "bookingChart"),

        {

            type: 'bar',

            data: {

                labels: [

                    'Avengers',

                    'Batman',

                    'SpiderMan'

                ],

                datasets: [{

                    label: 'Bookings',

                    data: [

                        15,

                        10,

                        20

                    ],

                    borderWidth: 2
                }]
            }
        });

    // REVENUE PIE CHART

    const revenueChart =
        new Chart(

        document.getElementById(
            "revenueChart"),

        {

            type: 'pie',

            data: {

                labels: [

                    'Avengers',

                    'Batman',

                    'SpiderMan'

                ],

                datasets: [{

                    data: [

                        50000,

                        30000,

                        70000

                    ],

                    borderWidth: 2
                }]
            }
        });

</script>

</body>

</html>