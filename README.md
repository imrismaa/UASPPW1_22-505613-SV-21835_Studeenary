# UASPPW1_22-505613-SV-21835_Studeenary

## Risma Saputri
## Penjelasan tentang Studeenary
Studeenary adalah sebuah website E-leaning yang terinspirasi dari Google Classroom. Website ini digunakan sebagai media pembelajaran elektronik dimana user bisa membuat sebuah kelas dengan fitur CREATE CLASS lalu bertindak sebagai guru, maupun bergabung dengan kelas yang sudah ada dengan memasukkan kode kelas. Lalu di dalam sebuah kelas, user yang bertindak sebagai teacher bisa membuat announcement, mengupload materi, mengupload tugas, serta menilai tugas yang telah dikumpulkan oleh tiap siswa (untuk saat ini, baru bisa menampilkan announcement dari database dan menampilkan tugas yang telah dinilai). Website ini dapat membantu para pelajar maupun mahasiswa dan tenaga pendidik dalam melakukan kegiatan pembelajaran secara asinkron. Website terhubung dengan database dengan jumlah tabel sebanyak 7, yaitu user, kelas, anggota_kelas, announcement, tugas, nilai, dan comments. Akan tetapi, tabel comments belum terpakai disini.

## Bagaimana website yang dibuat menjawab 4 requirement dasar (kriteria penilaian)
### - Design rapi
Pada website ini, saya mencoba untuk menampilkan design yang rapi dengan menggunakan color pallete yang senada dan konsisten, yaitu :
```css
:root {
   --1blue: #194a7a;
   --2blue: #476f95; 
   --3blue: #7593af;
   --4blue: #a3b7ca;
   --5blue: #d1dbe4;
}
```
Selain itu, saya juga membuat seluruh box maupun button dengan border-radius yang konsisten, yaitu sebesar 0.375rem???
### - Website esponsive

### - Direct feedback
login, register account

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
```

#### Menampilkan announcement kelas dari setiap kelas yang dimiliki oleh user

#### Menampilkan tugas dari setiap kelas yang dimiliki oleh user
#### Menampilkan guru dan murid pada kelas yang dimiliki oleh user
