<!DOCTYPE html>
<html>
<head>
<title>Book Movie Ticket</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

body{
    background:#141414;
    font-family:Arial;
}

.main-box{
    width:450px;
    margin:auto;
    margin-top:80px;
    background:#1f1f1f;
    padding:35px;
    border-radius:18px;
    box-shadow:0 0 25px rgba(255,0,0,0.25);
}

h1{
    text-align:center;
    color:#e50914;
    margin-bottom:30px;
    font-weight:bold;
}

label{
    color:white;
    margin-bottom:6px;
}

.form-control{
    margin-bottom:15px;
    border-radius:10px;
}

.btn-netflix{
    background:#e50914;
    color:white;
    border:none;
    border-radius:10px;
}

.btn-netflix:hover{
    background:#b20710;
    color:white;
}

.link-btn{
    width:100%;
    margin-top:12px;
}

</style>

</head>
<body>

<div class="main-box">

<h1>BOOK TICKET</h1>

<form action="/createBooking" method="post">

<label>User ID</label>
<input type="text" name="userId" class="form-control" required>

<label>Showtime ID</label>
<input type="text" name="showtimeId" class="form-control" required>

<label>Seats</label>
<input type="text" name="seats" class="form-control" required>

<button type="submit" class="btn btn-netflix w-100 mt-3">
Book Now
</button>

</form>

<a href="/allBookings" class="btn btn-light link-btn">
View All Bookings
</a>

<a href="/history?userId=U001" class="btn btn-info link-btn">
My Bookings
</a>

</div>

</body>
</html>