-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 19, 2023 at 09:36 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `elearning_space`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_user` (IN `nama_input` VARCHAR(255), IN `email_input` VARCHAR(255), IN `password_input` VARCHAR(255))   BEGIN
    DECLARE last_id INT;

    SELECT MAX(CAST(SUBSTRING(id_user, 2) AS UNSIGNED)) INTO last_id FROM user;

    IF last_id IS NULL THEN
        SET last_id = 0;
    END IF;

    IF last_id < 9999 THEN
        SET @next_id = CONCAT('U', LPAD(last_id + 1, 4, '0'));
        INSERT INTO user (id_user, nama_user, email, password)
        VALUES (@next_id, nama_input, email_input, password_input);
    END IF;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `anggota_kelas`
--

CREATE TABLE `anggota_kelas` (
  `id_anggota_kelas` varchar(5) NOT NULL,
  `id_user` varchar(5) DEFAULT NULL,
  `id_kelas` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `anggota_kelas`
--

INSERT INTO `anggota_kelas` (`id_anggota_kelas`, `id_user`, `id_kelas`) VALUES
('A0001', 'U0001', 'K0001'),
('A0002', 'U0002', 'K0001'),
('A0003', 'U0003', 'K0001'),
('A0004', 'U0004', 'K0001'),
('A0005', 'U0005', 'K0001'),
('A0006', 'U0006', 'K0001'),
('A0007', 'U0007', 'K0001'),
('A0008', 'U0008', 'K0001'),
('A0009', 'U0009', 'K0001'),
('A0010', 'U0010', 'K0001'),
('A0011', 'U0011', 'K0001'),
('A0012', 'U0012', 'K0001'),
('A0013', 'U0013', 'K0001'),
('A0014', 'U0014', 'K0001'),
('A0015', 'U0015', 'K0002'),
('A0016', 'U0016', 'K0002'),
('A0017', 'U0017', 'K0002'),
('A0018', 'U0018', 'K0002'),
('A0019', 'U0019', 'K0002'),
('A0020', 'U0020', 'K0002'),
('A0021', 'U0021', 'K0002'),
('A0022', 'U0022', 'K0002'),
('A0023', 'U0023', 'K0002'),
('A0024', 'U0024', 'K0002'),
('A0025', 'U0025', 'K0002'),
('A0026', 'U0026', 'K0002'),
('A0027', 'U0027', 'K0002'),
('A0028', 'U0001', 'K0002'),
('A0029', 'U0002', 'K0002'),
('A0030', 'U0003', 'K0002'),
('A0031', 'U0004', 'K0002'),
('A0032', 'U0005', 'K0002'),
('A0033', 'U0006', 'K0002'),
('A0034', 'U0007', 'K0002'),
('A0035', 'U0008', 'K0002'),
('A0036', 'U0009', 'K0002'),
('A0037', 'U0010', 'K0002'),
('A0038', 'U0011', 'K0002'),
('A0039', 'U0012', 'K0002'),
('A0040', 'U0013', 'K0002'),
('A0041', 'U0014', 'K0002'),
('A0042', 'U0015', 'K0003'),
('A0043', 'U0016', 'K0003'),
('A0044', 'U0017', 'K0003'),
('A0045', 'U0018', 'K0003'),
('A0046', 'U0019', 'K0003'),
('A0047', 'U0020', 'K0003'),
('A0048', 'U0021', 'K0003'),
('A0049', 'U0022', 'K0003'),
('A0050', 'U0023', 'K0003'),
('A0051', 'U0024', 'K0003'),
('A0052', 'U0025', 'K0003'),
('A0053', 'U0026', 'K0003'),
('A0054', 'U0027', 'K0003'),
('A0055', 'U0015', 'K0004'),
('A0056', 'U0016', 'K0004'),
('A0057', 'U0017', 'K0004'),
('A0058', 'U0018', 'K0004'),
('A0059', 'U0019', 'K0004'),
('A0060', 'U0020', 'K0004'),
('A0061', 'U0021', 'K0004'),
('A0062', 'U0022', 'K0004'),
('A0063', 'U0023', 'K0004'),
('A0064', 'U0024', 'K0004'),
('A0065', 'U0025', 'K0004'),
('A0066', 'U0026', 'K0004'),
('A0067', 'U0027', 'K0004'),
('A0068', 'U0001', 'K0005'),
('A0069', 'U0002', 'K0005'),
('A0070', 'U0003', 'K0005'),
('A0071', 'U0004', 'K0005'),
('A0072', 'U0005', 'K0005'),
('A0073', 'U0006', 'K0005'),
('A0074', 'U0007', 'K0005'),
('A0075', 'U0008', 'K0005'),
('A0076', 'U0009', 'K0005'),
('A0077', 'U0010', 'K0005'),
('A0078', 'U0011', 'K0005'),
('A0079', 'U0012', 'K0005'),
('A0080', 'U0013', 'K0005'),
('A0081', 'U0014', 'K0005');

-- --------------------------------------------------------

--
-- Table structure for table `announcement`
--

CREATE TABLE `announcement` (
  `id_announcement` varchar(5) NOT NULL,
  `id_kelas` varchar(5) DEFAULT NULL,
  `announcement` varchar(1000) DEFAULT NULL,
  `tanggal` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `announcement`
--

INSERT INTO `announcement` (`id_announcement`, `id_kelas`, `announcement`, `tanggal`) VALUES
('N0001', 'K0001', 'Pertemuan tanggal 22 Maret akan diadakan quiz, materi dari DDL hingga ERD', '2023-03-20'),
('N0002', 'K0001', 'Perkuliahan hari ini ditiadakan, diganti dengan penugasan.', '2023-03-29'),
('N0003', 'K0001', 'Perkuliahan hari ini dilaksanakan secara daring, link zoom menyusul.', '2023-04-12'),
('N0004', 'K0001', 'Perkuliahan hari ini dilaksanakan secara daring, link zoom menyusul.', '2023-05-10'),
('N0005', 'K0002', 'Untuk hari ini perkuliahan dimulai mundur pukul 10, harap maklum. Terima kasih.', '2023-03-27'),
('N0006', 'K0002', 'PENGUMUMAN\n\nKepada YTH. Para mahasiswa sekalian\n\nDengan ini diumumkan bahwa kuliah Statistika hari Selasa 30 Mei 2023 DITIADAKAN. Akan diganti di lain kesempatan.\n\nTerima kasih', '2023-04-10'),
('N0007', 'K0002', 'Dikarenakan dosen pengampu sedang ada acara, perkuliahan hari ini ditiadakan. Pengganti pertemuan berupa tugas akan diinformasikan lebih lanjut. Terima kasih', '2023-05-15');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id_comment` varchar(5) NOT NULL,
  `id_announcement` varchar(5) DEFAULT NULL,
  `id_user` varchar(5) DEFAULT NULL,
  `comments` varchar(500) DEFAULT NULL,
  `tanggal` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id_comment`, `id_announcement`, `id_user`, `comments`, `tanggal`) VALUES
('C0001', 'N0001', 'U0002', 'Baik bu, terima kasih atas informasinya', '2023-03-20'),
('C0002', 'N0001', 'U0004', 'Baik, Bu Divi', '2023-03-20'),
('C0003', 'N0001', 'U0007', 'Terima kasih atas informasinya, bu', '2023-03-20'),
('C0004', 'N0001', 'U0003', 'Baik bu divi, terima kasih atas informasinya', '2023-03-21'),
('C0005', 'N0001', 'U0010', 'Baik bu, terima kasih atas informasinya', '2023-03-21'),
('C0006', 'N0002', 'U0018', 'Baik, Pak Ganjar.', '2023-03-29'),
('C0007', 'N0002', 'U0019', 'Baik pak, terima kasih atas informasinya', '2023-03-29'),
('C0008', 'N0002', 'U0020', 'Terima kasih atas informasinya, pak', '2023-03-29'),
('C0009', 'N0002', 'U0021', 'baik Pak Ganjar, terima kasih atas informasinya', '2023-03-29'),
('C0010', 'N0002', 'U0022', 'Baik pak, terima kasih atas informasinya', '2023-03-29');

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `id_kelas` varchar(5) NOT NULL,
  `id_user` varchar(5) DEFAULT NULL,
  `nama_kelas` varchar(30) DEFAULT NULL,
  `deskripsi` varchar(200) DEFAULT NULL,
  `kode` varchar(6) DEFAULT NULL,
  `subject` varchar(50) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`id_kelas`, `id_user`, `nama_kelas`, `deskripsi`, `kode`, `subject`, `image`) VALUES
('K0001', 'U0028', 'PL2B1', 'Ini adalah kelas Praktikum Basis Data untuk PL2B1', 'APGRFC', 'Praktikum Basis Data', 'assets/database.jpg'),
('K0002', 'U0030', 'PL2BB', 'Kelas Statistika TRPL Angkatan 2022 Kelas BB', '6YHGE8', 'Statistika', 'assets/stat.jpg'),
('K0003', 'U0029', 'PL2B2', 'Virtual Classroom untuk mata kuliah Praktikum Basis Data kelas PL2B2', 'DYU6A7', 'Praktikum Basis Data', 'assets/database.jpg'),
('K0004', 'U0031', 'PL2B2', 'Praktikum Pemrograman Web 1 untuk kelas PL2B2', 'YUHT65', 'Praktikum Pemrograman Web 1', 'assets/html.jpg'),
('K0005', 'U0029', 'PL2B1', NULL, '8W3HF6', 'Praktikum Pemrograman Web 1', 'assets/html.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `nilai`
--

CREATE TABLE `nilai` (
  `id_tugas` varchar(5) NOT NULL,
  `id_user` varchar(5) NOT NULL,
  `nilai` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nilai`
--

INSERT INTO `nilai` (`id_tugas`, `id_user`, `nilai`) VALUES
('T0001', 'U0001', 97),
('T0001', 'U0002', 92),
('T0001', 'U0003', 93),
('T0001', 'U0004', 89),
('T0001', 'U0005', 72),
('T0001', 'U0006', 74),
('T0001', 'U0007', 76),
('T0001', 'U0008', 97),
('T0001', 'U0009', 89),
('T0001', 'U0010', 76),
('T0001', 'U0011', 82),
('T0001', 'U0012', 79),
('T0001', 'U0013', 97),
('T0001', 'U0014', 78),
('T0002', 'U0015', 82),
('T0002', 'U0016', 74),
('T0002', 'U0017', 97),
('T0002', 'U0018', 81),
('T0002', 'U0019', 75),
('T0002', 'U0020', 75),
('T0002', 'U0021', 71),
('T0002', 'U0022', 91),
('T0002', 'U0023', 98),
('T0002', 'U0024', 92),
('T0002', 'U0025', 79),
('T0002', 'U0026', 70),
('T0002', 'U0027', 89),
('T0002', 'U0001', 87),
('T0002', 'U0002', 90),
('T0002', 'U0003', 93),
('T0002', 'U0004', 91),
('T0002', 'U0005', 94),
('T0002', 'U0006', 95),
('T0002', 'U0007', 85),
('T0002', 'U0008', 88),
('T0002', 'U0009', 86),
('T0002', 'U0010', 96),
('T0002', 'U0011', 76),
('T0002', 'U0012', 92),
('T0002', 'U0013', 96),
('T0002', 'U0014', 92),
('T0003', 'U0001', 75),
('T0003', 'U0002', 76),
('T0003', 'U0003', 97),
('T0003', 'U0004', 90),
('T0003', 'U0005', 70),
('T0003', 'U0006', 94),
('T0003', 'U0007', 74),
('T0003', 'U0008', 97),
('T0003', 'U0009', 79),
('T0003', 'U0010', 84),
('T0003', 'U0011', 77),
('T0003', 'U0012', 78),
('T0003', 'U0013', 77),
('T0004', 'U0014', 91),
('T0004', 'U0001', 84),
('T0004', 'U0002', 95),
('T0004', 'U0003', 91),
('T0004', 'U0004', 100),
('T0004', 'U0005', 86),
('T0004', 'U0006', 84),
('T0004', 'U0007', 71),
('T0004', 'U0008', 79),
('T0004', 'U0009', 81),
('T0004', 'U0010', 82),
('T0004', 'U0011', 96),
('T0004', 'U0012', 93),
('T0004', 'U0013', 72),
('T0004', 'U0014', 75);

-- --------------------------------------------------------

--
-- Table structure for table `tugas`
--

CREATE TABLE `tugas` (
  `id_tugas` varchar(5) NOT NULL,
  `id_kelas` varchar(5) DEFAULT NULL,
  `nama_tugas` varchar(30) DEFAULT NULL,
  `deskripsi` varchar(200) DEFAULT NULL,
  `tenggat` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tugas`
--

INSERT INTO `tugas` (`id_tugas`, `id_kelas`, `nama_tugas`, `deskripsi`, `tenggat`) VALUES
('T0001', 'K0001', 'Laporan Praktikum - SQL VIEW', 'Silakan membuat laporan praktikum hari Rabu 17 Mei 2023', '2023-05-23'),
('T0002', 'K0002', 'Tugas Regresi Linear', 'Silakan rekan-rekan mencari contoh dataset untuk kasus regresi. Dataset bisa dicari di Kaggle atau UCI repository.Silahkan meng-capture tampilan dataset tersebut.', '2023-03-05'),
('T0003', 'K0001', 'Laporan Praktikum - PL/SQL', 'Silakan membuat laporan praktikum hari Rabu 24 Mei 2023', '2023-05-30'),
('T0004', 'K0001', 'Laporan Praktikum - TRIGGER', 'Silakan membuat laporan praktikum hari Rabu 31 Mei 2023', '2023-06-06');

-- --------------------------------------------------------

--
-- Stand-in structure for view `tugas_view`
-- (See below for the actual view)
--
CREATE TABLE `tugas_view` (
`id_tugas` varchar(5)
,`nama_tugas` varchar(30)
,`id_kelas` varchar(5)
,`tenggat` date
,`id_user` varchar(5)
,`nilai` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` varchar(5) NOT NULL,
  `nama_user` varchar(50) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `nama_user`, `email`, `password`) VALUES
('U0001', 'Risma Saputri', 'risma@gmail.com', '$2y$10$8GLx0dOJ/ruSEqyyUnqY8OeWw0ZrIrz7h4/vkpa7nuH8OtoZyenkq'),
('U0002', 'Amanda Farliana Setyasari', 'amanda@gmail.com', ''),
('U0003', 'Aminah Nurul Huda', 'aminah@gmail.com', ''),
('U0004', 'Salwa Jasmine A\'aliyah', 'salwa@gmail.com', ''),
('U0005', 'Maulana Fikrie Rizaldi', 'maul@gmail.com', ''),
('U0006', 'Prasetyo Edi Pamungkas', 'edi@gmail.com', ''),
('U0007', 'Erlangga Syifa Sutrisno', 'erlangga@gmail.com', ''),
('U0008', 'Ashila Najla Salsabilla WD', 'ashila@gmail.com', ''),
('U0009', 'Salma Nur Azizah', 'salma@gmail.com', ''),
('U0010', 'Ilyas Ramadhan', 'ilyas@gmail.com', ''),
('U0011', 'Darriel Markerizal', 'darriel@gmail.com', ''),
('U0012', 'Kinanthy Cahyaningrum', 'kinan@gmail.com', ''),
('U0013', 'Hassan Aldhi Wirawan', 'hassan@gmail.com', ''),
('U0014', 'Fairly Ardasa', 'fairly@gmail.com', ''),
('U0015', 'Viko Rivanesta', 'viko@gmail.com', ''),
('U0016', 'Andhika Yoga Pratama', 'andhika@gmail.com', ''),
('U0017', 'Akhmad Maulana Akhsan', 'akhsan@gmail.com', ''),
('U0018', 'Adiel Boanerge Gananputra', 'erge@gmail.com', ''),
('U0019', 'Isan Faizun Hidar', 'isan@gmail.com', ''),
('U0020', 'Langit Lintang Rajendra', 'langit@gmail.com', ''),
('U0021', 'Farhan Hanif', 'farhan@gmail.com', ''),
('U0022', 'Sena Aji Bayu Murti', 'sena@gmail.com', ''),
('U0023', 'Zefanya Diego Forlandicco', 'diego@gmail.com', ''),
('U0024', 'Muhammad Farhan Nugroho', 'farhannug@gmail.com', ''),
('U0025', 'Nawal Rizky Kautsar', 'nawal@gmail.com', ''),
('U0026', 'Dragan Abrisam Widijanto', 'dragan@gmail.com', ''),
('U0027', 'Dwi Agung Febriyanto', 'agung@gmail.com', ''),
('U0028', 'Divi Galih Prasetyo Putri, S.Kom., M.Kom.', 'divi@gmail.com', '$2y$10$Zd2txNapo2oKm/bVFBNXeeMteauVbV6gkNO2LzHISByIdhY8lvK7m'),
('U0029', 'Dinar Nugroho Pratomo, S.Kom., M.IM., M.Cs.', 'dinar@gmail.com', ''),
('U0030', 'Dr.Eng. Ganjar Alfian, S.T., M.Eng.', 'ganjar@gmail.com', ''),
('U0031', 'Faza Maula Azif, S.Kom., M.Eng.', 'faza@gmail.com', '');

-- --------------------------------------------------------

--
-- Structure for view `tugas_view`
--
DROP TABLE IF EXISTS `tugas_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tugas_view`  AS SELECT `tugas`.`id_tugas` AS `id_tugas`, `tugas`.`nama_tugas` AS `nama_tugas`, `tugas`.`id_kelas` AS `id_kelas`, `tugas`.`tenggat` AS `tenggat`, `user`.`id_user` AS `id_user`, `nilai`.`nilai` AS `nilai` FROM ((((`tugas` left join `nilai` on(`tugas`.`id_tugas` = `nilai`.`id_tugas`)) left join `user` on(`user`.`id_user` = `nilai`.`id_user`)) join `kelas` on(`kelas`.`id_kelas` = `tugas`.`id_kelas`)) join `anggota_kelas` on(`anggota_kelas`.`id_kelas` = `kelas`.`id_kelas` and `anggota_kelas`.`id_user` = `user`.`id_user`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anggota_kelas`
--
ALTER TABLE `anggota_kelas`
  ADD PRIMARY KEY (`id_anggota_kelas`),
  ADD KEY `fk_id_kelas` (`id_kelas`),
  ADD KEY `fk_id_user2` (`id_user`);

--
-- Indexes for table `announcement`
--
ALTER TABLE `announcement`
  ADD PRIMARY KEY (`id_announcement`),
  ADD KEY `fk_id_kelas3` (`id_kelas`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id_comment`),
  ADD KEY `fk_id_announcement` (`id_announcement`),
  ADD KEY `fk_id_user3` (`id_user`);

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id_kelas`),
  ADD KEY `fk_id_user` (`id_user`);

--
-- Indexes for table `nilai`
--
ALTER TABLE `nilai`
  ADD KEY `fk_id_tugas` (`id_tugas`),
  ADD KEY `fk_id_user4` (`id_user`);

--
-- Indexes for table `tugas`
--
ALTER TABLE `tugas`
  ADD PRIMARY KEY (`id_tugas`),
  ADD KEY `fk_id_kelas2` (`id_kelas`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `anggota_kelas`
--
ALTER TABLE `anggota_kelas`
  ADD CONSTRAINT `fk_id_kelas` FOREIGN KEY (`id_kelas`) REFERENCES `kelas` (`id_kelas`),
  ADD CONSTRAINT `fk_id_user2` FOREIGN KEY (`id_user`) REFERENCES `pengguna` (`id_user`);

--
-- Constraints for table `announcement`
--
ALTER TABLE `announcement`
  ADD CONSTRAINT `fk_id_kelas3` FOREIGN KEY (`id_kelas`) REFERENCES `kelas` (`id_kelas`);

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `fk_id_announcement` FOREIGN KEY (`id_announcement`) REFERENCES `announcement` (`id_announcement`),
  ADD CONSTRAINT `fk_id_user3` FOREIGN KEY (`id_user`) REFERENCES `pengguna` (`id_user`);

--
-- Constraints for table `kelas`
--
ALTER TABLE `kelas`
  ADD CONSTRAINT `fk_id_user` FOREIGN KEY (`id_user`) REFERENCES `pengguna` (`id_user`);

--
-- Constraints for table `nilai`
--
ALTER TABLE `nilai`
  ADD CONSTRAINT `fk_id_tugas` FOREIGN KEY (`id_tugas`) REFERENCES `tugas` (`id_tugas`),
  ADD CONSTRAINT `fk_id_user4` FOREIGN KEY (`id_user`) REFERENCES `pengguna` (`id_user`);

--
-- Constraints for table `tugas`
--
ALTER TABLE `tugas`
  ADD CONSTRAINT `fk_id_kelas2` FOREIGN KEY (`id_kelas`) REFERENCES `kelas` (`id_kelas`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
