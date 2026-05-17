<html>

<head>

    <title>Payment</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">

</head>

<body class="bg-light">

<div class="container">

    <div class="row justify-content-center">

        <div class="col-md-6">

            <div class="card shadow mt-5">

                <div class="card-body p-5">

                    <h2 class="text-success text-center mb-4">

                        Payment Details

                    </h2>

                    <form action="/bookings/confirm-payment"
                          method="post">

                        <input type="text"
                               class="form-control mb-3"
                               placeholder="Card Holder Name"
                               required>

                        <input type="text"
                               class="form-control mb-3"
                               placeholder="Card Number"
                               required>

                        <input type="text"
                               class="form-control mb-3"
                               placeholder="CVV"
                               required>

                        <input type="text"
                               class="form-control mb-4"
                               placeholder="MM/YY"
                               required>

                        <button class="btn btn-success w-100">

                            Confirm Payment

                        </button>

                    </form>

                </div>

            </div>

        </div>

    </div>

</div>

</body>

</html>