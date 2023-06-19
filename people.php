<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>People</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/boxicons.min.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
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
      <h3 class="people-role pb-2 mb-0">Teacher</h3>
        <?php
          include "connection.php";

          $id_kelas = $_SESSION['id_kelas'];
          $sql = "
            SELECT u.nama_user
            FROM kelas AS k
            JOIN user AS u ON u.id_user = k.id_user
            WHERE k.id_kelas = '$id_kelas';
          ";

          $result = mysqli_query($conn, $sql);
          foreach ($result as $row) {
            echo "
              <div class='d-flex text-body-secondary pt-3'>
                <div class='each-people pb-3 mb-0 small lh-sm w-100'>
                  <div class='justify-content-between'>
                    <img class='people-profile' src='assets/account.png' width='25' height='auto'>
                    <strong class='people-profile text-gray-dark'>". $row['nama_user'] . "</strong>
                  </div>
                </div>
              </div>
            ";
          }
        ?>
    </div>
    
    <div class="people-box col-md-6 offset-md-3">
      <h3 class="people-role pb-2 mb-0">Classmates</h3>
        <?php
          include "connection.php";

          $id_kelas = $_SESSION['id_kelas'];
          $sql = "
            SELECT u.nama_user
            FROM anggota_kelas AS ak
            JOIN kelas AS k ON ak.id_kelas = k.id_kelas
            JOIN user AS u ON ak.id_user = u.id_user
            WHERE k.id_kelas = '$id_kelas'
            ORDER BY u.nama_user ASC;
            ";

          $result = mysqli_query($conn, $sql);
          foreach ($result as $row) {
            echo "
              <div class='d-flex text-body-secondary pt-3'>
                <div class='each-people pb-3 mb-0 small lh-sm w-100'>
                  <div class='justify-content-between'>
                    <img class='people-profile' src='assets/account.png' width='25' height='auto'>
                    <strong class='people-profile text-gray-dark'>". $row['nama_user'] . "</strong>
                  </div>
                </div>
              </div>
            ";
          }
        ?>
    </div>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</body>
</html>