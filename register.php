<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/boxicons.min.css">
    <link rel="stylesheet" href="css/style.css">
    <title>Register Account</title>
</head>
<body class="registration">
    <div class="registration-form">
        <form method="POST" action="add_account.php">
            <div class="form-icon">
                <img src="assets/graduated.png" width="70" height="auto">
            </div>
            <div class="form-group">
                <input type="input" name="name" class="form-control item" id="email" placeholder="Full Name" required>
            </div>
            <div class="form-group">
                <input type="email" name="email" class="form-control item" id="email" placeholder="Email" required>
            </div>
            <div class="form-group">
                <input type="password" name="password" class="form-control item" id="password" placeholder="Password" required>
            </div>
            <div class="form-group">
                <button type="submit" class="btn btn-lg create-account btn-primary w-100 fs-6">CREATE ACCOUNT</button>
            </div>
            <div class="form-group">
                <button class="btn btn-lg google w-100 fs-6 my-2">
                    <img src="assets/google.png" style="width:20px" class="me-2"><small>Continue with Google</small>
                </button>
            </div>
            <div class="row my-3">
                <small align="center">By creating an account, you agree with <a href="#">the terms and conditions</a> of Studeenary</small>
            </div>
            <div class="row my-3">
                <small align="center">Already have an account? <a href="login_page.php">LOG IN</a></small>
            </div>
        </form>
    </div>
    <script src="js/this_is_script.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</body>
</html>