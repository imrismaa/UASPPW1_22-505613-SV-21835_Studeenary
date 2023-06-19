<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/boxicons.min.css">
    <link rel="stylesheet" href="css/style.css">
    <title>Log In</title>
</head>
<body class="registration">
    <div class="registration-form">
        <form method="POST" action="login.php">
            <div class="form-icon">
                <img src="assets/graduated.png" width="70" height="auto">
            </div>
            <div class="form-group">
                <input type="email" name="email" class="form-control item" id="email" placeholder="Email" required>
            </div>
            <div class="form-group">
                <input type="password" name="password" class="form-control item" id="password" placeholder="Password" required>
            </div>
            <div class="form-group">
                <button type="submit" class="btn btn-lg create-account btn-primary w-100 fs-6">Log in</button>
            </div>
            <div class="form-group">
                <button class="btn btn-lg google w-100 fs-6 my-2">
                    <img src="assets/google.png" style="width:20px" class="me-2"><small>Continue with Google</small>
                </button>
            </div>
            <div class="input-group my-3 d-flex justify-content-between">
                <div class="form-check">
                    <input type="checkbox" class="form-check-input" id="formCheck">
                    <label for="formCheck" class="form-check-label text-secondary">
                        <small>Remember me</small>
                    </label>
                </div>
                <div class="forgot">
                    <small><a href="#">Forgot Password?</a></small>
                </div>
            </div>
            <div class="row">
                <small align="center">Don't have any account? <a href="register.php"> SIGN UP </a></small>
            </div>
        </form>
    </div>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</body>
</html>