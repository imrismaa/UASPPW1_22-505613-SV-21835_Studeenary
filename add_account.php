<?php
    session_start();
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "elearning_space";

    $conn = new mysqli($servername, $username, $password, $dbname);
    if ($conn->connect_error) {
        die("Koneksi gagal: " . $conn->connect_error);
    }


    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        $name = $_POST['name'];
        $email = $_POST['email'];
        $password = $_POST['password'];
        $hashedPassword = password_hash($password, PASSWORD_DEFAULT);

        $sql = "CALL add_user('$name', '$email', '$hashedPassword')";
        $result = $conn->query($sql);
        if (!$result) { echo "Query gagal: " . $conn->error; }
    }


    $conn->close();
?>
