<?php
    session_start();
    include "connection.php";

    $errorMessage = "";

    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        $email = $_POST['email'];
        $password = $_POST['password'];

        $sql = "SELECT password FROM user WHERE email = '$email'";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            $user = $result->fetch_assoc();
            $hashedPassword = $user['password'];

            if (password_verify($password, $hashedPassword)) {
                header("Location: classes.php");
                $_SESSION['email'] = $email;
                exit;
            } else {
                echo "<script>alert('Incorrect email or password');</script>";
            }
        } else {
            echo "<script>alert('User not found!');</script>";
        }
    }

    $conn->close();
?>
