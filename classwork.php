<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Classwork</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/boxicons.min.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
    <?php
      session_start();
      include "connection.php";
      $id_kelas = $_SESSION['id_kelas'];
    ?>
    
    <nav class="navbar navbar-expand-lg sticky-top navbar-light bg-light justify-content-center">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" href="on-class.php?id_kelas=<?php echo $_SESSION['id_kelas']; ?>"><strong>Stream</a></strong>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="classwork.php"><strong>Classwork</a></strong>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="people.php"><strong>People</a></strong>
        </li>
      </ul>
    </nav>

    <div class="people-box col-md-6 offset-md-3">
      <?php
        $id_kelas = $_SESSION['id_kelas'];
        $id_user = $_SESSION['id_user'];
        include "connection.php";

        $sql = "
          SELECT nama_tugas, tenggat, nilai 
          FROM tugas_view
          WHERE id_user = '$id_user' AND id_kelas = '$id_kelas';
        ";

        $result = mysqli_query($conn, $sql);

        foreach ($result as $row) {
          $date = date("d F Y", strtotime($row['tenggat']));
          echo "
            <div class='d-flex text-body-secondary pt-3'>
              <div class='each-people pb-3 mb-0 small lh-sm w-100'>
                <div class='d-flex justify-content-between'>
                  <img src='assets/homework.png' width='40' height='auto'>
                  <strong class='text-gray-dark' align='left'>" . $row['nama_tugas'] . "</strong>
                  <span class='d-block'>" . $date . "</span>
                  <p>" . $row['nilai'] . "/100</p>
                </div>
              </div>
            </div>
          ";
        }
      ?>
    </div>
</body>
</html>