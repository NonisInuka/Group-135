<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <style>
        body { font-family: 'Segoe UI', sans-serif; display: flex; margin: 0; background-color: #f4f7f6; }
        .sidebar { width: 260px; background-color: #2c3e50; color: white; height: 100vh; position: fixed; }
        .sidebar h2 { padding: 20px; text-align: center; background: #1a252f; margin: 0; }
        .sidebar a { display: block; color: #bdc3c7; padding: 15px 25px; text-decoration: none; border-bottom: 1px solid #34495e; }
        .sidebar a:hover { background: #34495e; color: white; }
        .main { margin-left: 260px; padding: 40px; width: 100%; }
        .header { background: white; padding: 20px; border-radius: 10px; box-shadow: 0 2px 5px rgba(0,0,0,0.1); }
    </style>
</head>
<body>
    <div class="sidebar">
        <h2>Admin Panel</h2>
        <a href="#">🎬 Manage Movies</a>
        <a href="#">📅 Showtimes</a>
        <a href="#">👥 View Users</a>
        <a href="#">🎫 Bookings</a>
        <a href="#">⚙️ Settings</a>
    </div>
    <div class="main">
        <div class="header">
            <h1>Welcome, Admin Lakshan!</h1>
            <p>Welcome to the Movie Booking Admin portal.</p>
        </div>
    </div>
</body>
</html>