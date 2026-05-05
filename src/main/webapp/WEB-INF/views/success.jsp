<!DOCTYPE html>
<html>
<head>
<title>Booking Success</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

body{
    background:#141414;
    font-family:Arial;
}

.success-box{
    width:500px;
    margin:auto;
    margin-top:120px;
    background:#1f1f1f;
    padding:40px;
    border-radius:18px;
    text-align:center;
    box-shadow:0 0 25px rgba(0,255,0,0.2);
}

h1{
    color:#28a745;
    font-weight:bold;
    margin-bottom:20px;
}

p{
    color:white;
    font-size:18px;
    margin-bottom:25px;
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

.check{
    font-size:60px;
    color:#28a745;
    margin-bottom:15px;
}

</style>

</head>
<body>

<div class="success-box">

<div class="check">✔</div>

<h1>Booking Successful!</h1>

<p>Your movie ticket has been booked successfully.</p>

<a href="/booking" class="btn btn-netflix link-btn">
Book Another Ticket
</a>

<a href="/allBookings" class="btn btn-light link-btn">
View All Bookings
</a>

<a href="/history?userId=U001" class="btn btn-info link-btn">
My Bookings
</a>

</div>

</body>
</html>