<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Classroom</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/boxicons.min.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
  <header class="p-3 mb-3 border-bottom">
      <div class="container">
        <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
          <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 link-body-emphasis text-decoration-none">
            <img src="assets/graduated.png" width="50" height="auto">
          </a>
          <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
            <li>
              <a href="#" class="nav-link px-2 link-body-emphasis">
                <h3>Studeenary</h3>
              </a>
            </li>
          </ul>
  
          <div class="dropdown text-end side">
            <a href="#" class="d-block link-body-emphasis text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
              <img src="assets/add.png" width="20" height="auto">
            </a>
            <ul class="dropdown-menu text-small">
              <li>
                <a class="dropdown-item" href="#">Create class</a>
              </li>
              <li>
                <a class="dropdown-item" href="#">Join class</a>
              </li>
            </ul>
          </div>

          <div class="dropdown text-end">
            <a href="#" class="d-block link-body-emphasis text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
              <img src="assets/user.png" alt="mdo" width="30" height="auto" class="rounded-circle">
            </a>
            <ul class="dropdown-menu text-small">
              <?php
                  session_start();
                  $email = $_SESSION['email'];
                  include "connection.php";
                  $sql = "SELECT nama_user, id_user FROM user WHERE email = '$email';";
                  $result = mysqli_query($conn, $sql);

                  while ($row = mysqli_fetch_assoc($result)) {
                    $_SESSION['id_user'] = $row['id_user'];
                    echo '
                      <li>
                        <a class="dropdown-item" href="#">
                          <small>' . $row['nama_user'] . '</small>
                        </a>
                      </li>
                    ';
                  }
              ?>
              <li>
                <a class="dropdown-item" href="#">Profile</a>
              </li>
              <li>
                <a class="dropdown-item" href="#">Settings</a>
              </li>
              <li><hr class="dropdown-divider"></li>
              <li>
                <a class="dropdown-item" onClick="confirmLogout()">Log out</a>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </header>

    <div class="album py-5">
      <div class="container">
        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
          <?php
            $email = $_SESSION['email'];
            $subjects = array();
            include "connection.php";
            
            $sql = "
              SELECT k.subject, k.nama_kelas, k.id_kelas, k.image
              FROM anggota_kelas AS a 
              INNER JOIN kelas AS k ON a.id_kelas = k.id_kelas 
              WHERE a.id_user = (
                  SELECT id_user 
                  FROM user 
                  WHERE email = '$email'
              );
            ";
            
            $result = mysqli_query($conn, $sql);
            
            foreach ($result as $row) {
              $subject = $row['subject'];
              $id_kelas = $row['id_kelas'];
              echo " 
                <div class='col'>
                  <div class='card shadow-sm'>
                    <img src='". $row['image'] ."' width='100%' height='225' style='border-radius: 0.375rem;'>
                      <div class='card-body'>
                        <h4>". $row['subject'] ."</h4>
                        <p class='card-text'>". $row['nama_kelas'] ."</p>
                          <div class='d-flex justify-content-between align-items-center'>
                            <div class='btn-group'>
                              <a href='on-class.php?id_kelas=". $row['id_kelas'] ."'><button type='button' class='btn btn-brand btn-outline-secondary'>View Class</button></a>
                            </div>
                          </div>
                      </div>
                  </div>
                </div>
              ";
              $_SESSION['subject'] = $subject;
            }
          ?>
        </div>
      </div>
    </div>

    <footer class="d-flex flex-wrap justify-content-between align-items-center py-3">
      <div class="col-md-4 d-flex align-items-center">
        <a href="/" class="mb-3 me-2 mb-md-0 text-body-secondary text-decoration-none lh-1">
          <svg class="bi" width="30" height="24"><use xlink:href="#bootstrap"/></svg>
        </a>
        <span class="mb-3 mb-md-0 text-body-secondary">&copy; 2023 Studinary</span>
      </div>
    </footer>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
  <script src="js/this_is_script.js"></script>
</body>
</html>