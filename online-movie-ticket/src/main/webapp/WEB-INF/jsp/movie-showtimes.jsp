<%@ page import="java.util.List" %>

<%
List<String> showtimes =
(List<String>) request.getAttribute(
        "showtimes");

String movieName =
(String) request.getAttribute(
        "movieName");
%>

<html>

<head>

    <title>Movie Showtimes</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <style>

        body{
            background:#f4f6f9;
        }

        .showtime-card{

            background:white;

            padding:40px;

            border-radius:20px;

            text-align:center;

            box-shadow:
            0 5px 20px
            rgba(0,0,0,0.2);

            transition:0.3s;
        }

        .showtime-card:hover{

            transform:translateY(-10px);
        }

        .disabled-btn{

            pointer-events:none;

            opacity:0.5;
        }

    </style>

</head>

<body>

<jsp:include page="navbar.jsp"/>

<div class="container mt-5">

    <h1 class="text-center mb-5">

        <%= movieName %> Showtimes

    </h1>

    <div class="row">

        <%

            if(showtimes != null &&
               showtimes.size() > 0) {

                int count = 0;

                for(String show :
                        showtimes) {

                    if(show.trim()
                            .isEmpty()) {

                        continue;
                    }

                    String[] data =
                            show.split(",");

                    if(data.length < 5) {

                        continue;
                    }

                    // SHOWTIME DATA

                    String time =
                            data[3];

                    String theater =
                            data[4];

                    count++;
        %>

        <div class="col-md-4 mb-4">

            <div class="showtime-card">

                <h1>

                    <%= time %>

                </h1>

                <h3 class="mt-4 text-secondary">

                    <%= theater %>

                </h3>

                <a href="/seats/movie/<%= movieName %>"
                   id="show<%= count %>"
                   class="btn btn-dark
                          btn-lg
                          w-100
                          mt-4">

                    Select Seats

                </a>

            </div>

        </div>

        <%
                }
            } else {
        %>

        <div class="col-12">

            <div class="alert alert-danger text-center">

                No showtimes available for
                <strong>

                    <%= movieName %>

                </strong>

            </div>

        </div>

        <%
            }
        %>

    </div>

</div>

<jsp:include page="footer.jsp"/>

<script>

    const now =
        new Date();

    const currentHour =
        now.getHours();

    // ALL SHOWTIME BUTTONS

    const buttons =
        document.querySelectorAll(
            "a[id^='show']");

    buttons.forEach(button => {

        const card =
            button.closest(
                ".showtime-card");

        const timeText =
            card.querySelector(
                "h1").innerText;

        let showHour = 0;

        // CONVERT TIME

        if(timeText.includes("AM")) {

            showHour =
                parseInt(timeText);

        } else if(timeText.includes("PM")) {

            showHour =
                parseInt(timeText);

            if(showHour != 12) {

                showHour += 12;
            }
        }

        // SESSION CLOSED

        if(currentHour >= showHour) {

            button.innerText =
                "Session Closed";

            button.classList.remove(
                "btn-dark");

            button.classList.add(
                "btn-secondary");

            button.classList.add(
                "disabled-btn");
        }
    });

</script>

</body>

</html>
