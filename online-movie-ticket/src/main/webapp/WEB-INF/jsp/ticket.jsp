<html>

<head>

    <title>Movie Ticket</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <style>

        body{
            background:#f4f6f9;
        }

        .ticket-box{

            max-width:700px;

            margin:auto;

            margin-top:50px;

            background:white;

            border-radius:20px;

            overflow:hidden;

            box-shadow:
            0 0 20px
            rgba(0,0,0,0.2);
        }

        .ticket-header{

            background:#dc3545;

            color:white;

            padding:30px;

            text-align:center;
        }

        .ticket-body{

            padding:40px;
        }

        .ticket-info{

            margin-bottom:20px;

            font-size:22px;
        }

        .qr{

            text-align:center;

            margin-top:40px;
        }

        .download-btn{

            text-align:center;

            margin-top:40px;
        }

    </style>

</head>

<body>

<div class="ticket-box">

    <div class="ticket-header">

        <h1>

            CINEMA MOVIE TICKET

        </h1>

    </div>

    <div class="ticket-body">

        <div class="ticket-info">

            <strong>Booking ID:</strong>

            ${bookingId}

        </div>

        <div class="ticket-info">

            <strong>Movie:</strong>

            ${movie}

        </div>

        <div class="ticket-info">

            <strong>Seats:</strong>

            ${seats}

        </div>

        <div class="ticket-info">

            <strong>Showtime:</strong>

            ${showtime}

        </div>

        <!-- QR CODE -->

        <div class="qr">

            <img src="https://api.qrserver.com/v1/create-qr-code/?size=180x180&data=${bookingId}"
                 alt="QR">

        </div>

        <!-- BUTTONS -->

        <div class="download-btn">

            <!-- DOWNLOAD BUTTON -->

            <button onclick="downloadTicket()"
                    class="btn btn-success btn-lg me-3">

                Download Ticket

            </button>

            <!-- HOME BUTTON -->

            <a href="/"
               class="btn btn-primary btn-lg">

                Home

            </a>

        </div>

    </div>

</div>

<!-- SCRIPT -->

<script>

    function downloadTicket() {

        // OPEN PRINT

        window.print();

        // RETURN HOME AFTER 2 SECONDS

        setTimeout(function () {

            window.location.href = "/";

        }, 2000);
    }

</script>

</body>

</html>