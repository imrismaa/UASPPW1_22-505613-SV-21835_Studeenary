<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Praktikum apa</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/boxicons.min.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
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

    <?php
      session_start();
      include "connection.php";
      if (isset($_GET['id_kelas'])) {
        $id_kelas = $_GET['id_kelas'];
        $_SESSION['id_kelas'] = $id_kelas;
          
        $sql = "
          SELECT subject, deskripsi
          FROM kelas
          WHERE id_kelas = '$id_kelas';
        ";
          
        $result = mysqli_query($conn, $sql);
        foreach ($result as $row) {
          echo '
            <div class="stream-box col-md-6 offset-md-3">
              <h2 class="people-role pb-2 mb-0" align="center">' . $row['subject'] . '</h2>
                <div class="d-flex text-body-secondary pt-3">
                  <div class="pb-3 mb-0 small lh-sm w-100">
                    <div class="d-flex justify-content-between">
                      <strong>' . $row['deskripsi'] . '</strong>
                    </div>
                  </div>
                </div>
            </div>
          ';
        }

        $sql = "
          SELECT u.nama_user, a.announcement, a.tanggal
          FROM kelas AS k
          JOIN user AS u ON u.id_user = k.id_user
          JOIN announcement AS a ON a.id_kelas = k.id_kelas
          WHERE k.id_kelas = '$id_kelas'
          ORDER BY a.tanggal DESC;
        ";

        $result = mysqli_query($conn, $sql);
        foreach ($result as $row) {
          $date = date("d F Y", strtotime($row['tanggal']));
          echo "
            <div class='announcement-box col-md-6 offset-md-3'>
              <div class='d-flex text-body-secondary pt-3'>
                <div class='pb-3 mb-0 small lh-sm w-100'>
                  <h6>" . $row['nama_user'] . "</h6>
                  <div class='d-flex justify-content-between'>
                    <strong>" . $row['announcement'] . "</strong>
                  </div>
                  <small class='date'>" . $date . "</small>
                </div>
              </div>
            </div>
          ";
        }
      }
    ?>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</body>
</html>