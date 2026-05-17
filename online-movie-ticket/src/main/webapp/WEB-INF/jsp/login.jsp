<%@ page contentType="text/html;charset=UTF-8" %>

<html>

<head>

    <title>Login</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <style>

        body{
            background:#f4f6f9;
        }

        .login-box{

            max-width:700px;

            margin:auto;

            margin-top:60px;

            background:white;

            padding:40px;

            border-radius:20px;

            box-shadow:
            0 0 20px
            rgba(0,0,0,0.2);
        }

        .login-title{

            font-size:60px;

            font-weight:bold;
        }

        .login-tabs{

            display:flex;

            justify-content:center;

            margin-bottom:30px;
        }

        .tab-btn{

            width:200px;

            margin:10px;
        }

    </style>

</head>

<body>

<div class="container">

    <div class="login-box">

        <h1 class="text-center
                   text-success
                   login-title
                   mb-4">

            Login

        </h1>

        <!-- LOGIN TYPE BUTTONS -->

        <div class="login-tabs">

            <button class="btn btn-success
                           btn-lg
                           tab-btn"
                    onclick="showUserLogin()">

                User Login

            </button>

            <button class="btn btn-danger
                           btn-lg
                           tab-btn"
                    onclick="showAdminLogin()">

                Admin Login

            </button>

        </div>

        <!-- USER LOGIN -->

        <div id="userLoginBox">

            <form action="/loginUser"
                  method="post">

                <input type="email"
                       name="email"
                       placeholder="User Email"
                       class="form-control mt-3">

                <input type="password"
                       name="password"
                       placeholder="Password"
                       class="form-control mt-3">

                <button class="btn btn-success
                               w-100
                               mt-4">

                    User Login

                </button>

            </form>

            <div class="text-danger
                        text-center
                        mt-3">

                ${error}

            </div>

            <div class="text-center mt-4">

                <a href="/register">

                    Create Account

                </a>

            </div>

        </div>

        <!-- ADMIN LOGIN -->

        <div id="adminLoginBox"
             style="display:none;">

            <form action="/adminLogin"
                  method="post">

                <input type="email"
                       name="email"
                       placeholder="Admin Email"
                       class="form-control mt-3">

                <input type="password"
                       name="password"
                       placeholder="Password"
                       class="form-control mt-3">

                <button class="btn btn-danger
                               w-100
                               mt-4">

                    Admin Login

                </button>

            </form>

        </div>

    </div>

</div>

<script>

    function showUserLogin() {

        document.getElementById(
            "userLoginBox").style.display =
            "block";

        document.getElementById(
            "adminLoginBox").style.display =
            "none";
    }

    function showAdminLogin() {

        document.getElementById(
            "userLoginBox").style.display =
            "none";

        document.getElementById(
            "adminLoginBox").style.display =
            "block";
    }

</script>

</body>

</html>