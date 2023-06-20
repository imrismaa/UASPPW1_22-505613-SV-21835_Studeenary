# UASPPW1_22-505613-SV-21835_Studeenary

## Risma Saputri
## Penjelasan tentang Studeenary
Studeenary adalah sebuah website E-leaning yang terinspirasi dari Google Classroom. Website ini digunakan sebagai media pembelajaran elektronik dimana user bisa membuat sebuah kelas dengan fitur CREATE CLASS lalu bertindak sebagai guru, maupun bergabung dengan kelas yang sudah ada dengan memasukkan kode kelas. Lalu di dalam sebuah kelas, user yang bertindak sebagai teacher bisa membuat announcement, mengupload materi, mengupload tugas, serta menilai tugas yang telah dikumpulkan oleh tiap siswa (untuk saat ini, baru bisa menampilkan announcement dari database dan menampilkan tugas yang telah dinilai). 
Website ini dapat membantu para pelajar maupun mahasiswa dan tenaga pendidik dalam melakukan kegiatan pembelajaran secara asinkron. Website terhubung dengan database dengan jumlah tabel sebanyak 7, yaitu user, kelas, anggota_kelas, announcement, tugas, nilai, dan comments. Akan tetapi, tabel comments belum terpakai disini.

## Bagaimana website yang dibuat menjawab 4 requirement dasar (kriteria penilaian)
### - Design rapi
Pada website ini, saya mencoba untuk menampilkan design yang rapi dengan menggunakan color pallete yang senada dan konsisten, yaitu :
```css
:root {
   --abu: #403c3c;
   --abu-muda:#cbcbcb;

   --1blue: #194a7a;
   --2blue: #476f95; 
   --3blue: #7593af;
   --4blue: #a3b7ca;
   --5blue: #d1dbe4;

   --darker-than-1blue: #143b62;
}
```
Selain itu, saya juga membuat seluruh box maupun button dengan border-radius yang konsisten, yaitu sebesar 0.375rem.

- Tampilan ketika LOG IN
![image](https://github.com/imrismaa/UASPPW1_22-505613-SV-21835_Studeenary/blob/main/assets/Web%20capture_20-6-2023_7140_localhost.jpeg)

- Tampilan ketika SIGN UP
![image](https://github.com/imrismaa/UASPPW1_22-505613-SV-21835_Studeenary/blob/main/assets/Web%20capture_20-6-2023_71412_localhost.jpeg)

Saya menggunakan font Montserrat pada website ini

```css
@import url('https://fonts.googleapis.com/css2?family=Montserrat&family=Quicksand&display=swap');
* {
   line-height: 1.8;
   color: #393b43;
   font-size: 15px;
   font-weight: 600;
   font-family: 'Montserrat', sans-serif;
}
```

### - Website esponsive
Responsive untuk tampilan desktop, hp, dan tablet
![image](https://github.com/imrismaa/UASPPW1_22-505613-SV-21835_Studeenary/blob/main/assets/Web%20capture_20-6-2023_111724_localhost.jpeg)
![image](https://github.com/imrismaa/UASPPW1_22-505613-SV-21835_Studeenary/blob/main/assets/Web%20capture_20-6-2023_111753_localhost.jpeg)



### - Direct feedback
#### REGISTER FORM
Pada tampilan awal website, user akan diarahkan ke halaman register account terlebih dahulu. Setelah melakukan register, data user akan dimasukkan ke dalam database. Password yang user masukkan akan disimpan dengan fungsi password_hash pada prosedur SQL yang telah dibuat agar id_user dapat diinput dengan auto increment.
```php
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
```

#### LOGIN FORM
Pada saat user melakukan login, password yang user masukkan akan di verifikasi dengan fungsi password_verify. Ketika password tersebut valid, baru user bisa masuk ke page selanjutnya yang menampilkan kelas kelas yang user miliki.
```html
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
```
Saat melakukan submit login form, password yang user masukkan akan diverifikasi pada login.php sebagai berikut:
```php
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
```
- verifikasi password
  ```php
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
  ```

### - Konten dinamis

#### Menampilkan nama user yang log in saat ini
Cara menampilkan nama user yang login saat ini adalah dengan mendapatkan id_user terlebih dahulu dari email yang telah tersimpan pada saat user melakukan login, yaitu dengan ``` session_start();``` dan ```$email = $_SESSION['email'];``` yang sebelumnnya telah tersimpan di login.php 
```php
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
```
Setelah itu, baru menjalankan query untuk mendapatkan nama_user
```php
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
```
#### Menampilkan kelas yang dimiliki oleh user
id_user yang login saat ini telah disimpan di ```$_SESSION['id_user'] = $row['id_user'];```. id_user ini digunakan untuk menampilkan kelas yang dimiliki oleh user.
```php
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
                                 <a href='on-class.php?id_kelas=". $row['id_kelas'] ."'>
                                    <button type='button' class='btn btn-brand btn-outline-secondary'>View Class</button>
                                 </a>
                              </div>
                           </div>
                  </div>
            </div>
         </div>
      ";
      $_SESSION['subject'] = $subject;
   }
?>
```
#### Menampilkan subject kelas dan deskripsi untuk header kelas dan menampilkan announcement kelas dari setiap kelas yang dimiliki oleh user
Ketika user menekan button VIEW CLASS, user akan diarahkan untuk masuk ke dalam kelas tersebut yang berisi header kelas (sekaligus deskripsi), announcement, classwork, dan people yang berisi siapa teacher dan classmates user. Untuk menampilkan deskripsi, saya menyimpan id_kelas terlebih dahulu dari page sebelumnya agar dapat ditampilkan content kelas yang related dengan kelas yang di klik. 
Lalu untuk announcement, saya menampilkan announcement dengan get id_kelas juga dan menampilkannnya secara urut berdasarkan tanggal terbaru.
```php
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
```

#### Menampilkan tugas dari setiap kelas yang dimiliki oleh user
Untuk menampilkan tugas yang ada di kelas itu, 

```php
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
```

#### Menampilkan guru dan murid pada kelas yang dimiliki oleh user
```php
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
```


```php
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
```
