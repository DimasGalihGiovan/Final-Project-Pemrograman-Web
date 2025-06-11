-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 11, 2025 at 11:39 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `barokah_trans`
--

-- --------------------------------------------------------

--
-- Table structure for table `armada`
--

CREATE TABLE `armada` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `jenis` varchar(50) DEFAULT NULL,
  `kursi` int(11) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `gambar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `armada`
--

INSERT INTO `armada` (`id`, `nama`, `jenis`, `kursi`, `deskripsi`, `gambar`) VALUES
(1, 'Mercedes Benz OF 917 L', 'Bus Besar', 60, 'Bus besar cocok untuk perjalanan rombongan besar seperti wisata, ziarah, atau kunjungan perusahaan.', 'armada10.jpg'),
(2, 'Hino GB 150 L', 'Bus Mini', 41, 'Mini bus adalah pilihan ideal untuk kelompok menengah seperti keluarga besar, rombongan sekolah, atau outing kantor. Ukurannya lebih ringkas dari bus besar namun tetap nyaman dan dilengkapi fasilitas standar seperti AC, audio-video, dan reclining seat.\r\n', 'mini_bus.jpg'),
(3, 'Jetbus MC 2', 'Bus Elf', 17, 'Bus elf banyak digunakan untuk city tour, antar-jemput bandara, atau perjalanan antar kota. Dengan bodi yang ramping dan manuver lincah, cocok untuk perjalanan ke daerah sempit. Tetap dilengkapi AC, audio, dan bagasi secukupnya.\r\n', 'elf_bus.jpg'),
(4, 'Toyota Hiace', 'Bus Hiace', 15, 'Hiace merupakan minibus premium yang nyaman untuk perjalanan keluarga, tamu VIP, atau rombongan kecil. Interior elegan, kursi empuk, AC double blower, dan USB charger menjadikan Hiace pilihan populer untuk kenyamanan maksimal.', 'hiace_bus.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `fasilitas`
--

CREATE TABLE `fasilitas` (
  `id` int(11) NOT NULL,
  `armada_id` int(11) DEFAULT NULL,
  `kategori` enum('Trip Service','Entertainment','Seat Features','Security') DEFAULT NULL,
  `fasilitas` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fasilitas`
--

INSERT INTO `fasilitas` (`id`, `armada_id`, `kategori`, `fasilitas`) VALUES
(1, 1, 'Trip Service', 'Lampu Baca'),
(2, 1, 'Trip Service', 'Bantal, Selimut'),
(3, 1, 'Trip Service', 'Toilet'),
(4, 1, 'Trip Service', 'coolbox'),
(5, 1, 'Entertainment', 'Audio'),
(6, 1, 'Entertainment', 'Video'),
(7, 1, 'Entertainment', 'TV'),
(8, 1, 'Seat Features', 'AC'),
(9, 1, 'Seat Features', 'USB Charger'),
(10, 2, 'Trip Service', 'Lampu Baca'),
(11, 2, 'Trip Service', 'Bantal, Selimut'),
(12, 2, 'Trip Service', 'Toilet'),
(13, 2, 'Trip Service', 'coolbox'),
(14, 2, 'Entertainment', 'Audio'),
(15, 2, 'Entertainment', 'Video'),
(16, 2, 'Entertainment', 'TV'),
(17, 2, 'Seat Features', 'AC'),
(18, 2, 'Seat Features', 'USB Charger'),
(19, 3, 'Trip Service', 'Lampu Baca'),
(20, 3, 'Trip Service', 'Toilet'),
(21, 3, 'Entertainment', 'Audio'),
(22, 3, 'Entertainment', 'Video'),
(23, 3, 'Entertainment', 'TV'),
(24, 3, 'Seat Features', 'AC'),
(25, 3, 'Seat Features', 'USB Charger'),
(26, 4, 'Trip Service', 'Lampu Baca'),
(27, 4, 'Trip Service', 'Toilet'),
(28, 4, 'Entertainment', 'Audio'),
(29, 4, 'Entertainment', 'Video'),
(30, 4, 'Entertainment', 'TV'),
(31, 4, 'Seat Features', 'AC'),
(32, 4, 'Seat Features', 'USB Charger');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `armada`
--
ALTER TABLE `armada`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fasilitas`
--
ALTER TABLE `fasilitas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `armada_id` (`armada_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `armada`
--
ALTER TABLE `armada`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `fasilitas`
--
ALTER TABLE `fasilitas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `fasilitas`
--
ALTER TABLE `fasilitas`
  ADD CONSTRAINT `fasilitas_ibfk_1` FOREIGN KEY (`armada_id`) REFERENCES `armada` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
