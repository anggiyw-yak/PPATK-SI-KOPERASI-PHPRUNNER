-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 01, 2024 at 05:45 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbkoperasi`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id_barang` int(11) NOT NULL,
  `nama_barang` varchar(50) DEFAULT NULL,
  `id_kategori` int(11) DEFAULT NULL,
  `gambar` varchar(300) DEFAULT NULL,
  `harga_jual` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id_barang`, `nama_barang`, `id_kategori`, `gambar`, `harga_jual`) VALUES
(1, 'Cimory', 2, '[{\"name\":\"files\\/cimory_36773jdn.jpg\",\"usrName\":\"cimory.jpg\",\"size\":367403,\"type\":\"image\\/jpeg\",\"thumbnail\":\"files\\/thcimory_rd5lt4i2.jpg\",\"thumbnail_type\":\"image\\/jpeg\",\"thumbnail_size\":86920,\"searchStr\":\"cimory.jpg,!:sStrEnd\"}]', '7000'),
(2, 'Tisu', 4, '[{\"name\":\"files\\/tisu_bwld6hui.jpg\",\"usrName\":\"tisu.jpg\",\"size\":103196,\"type\":\"image\\/jpeg\",\"thumbnail\":\"files\\/thtisu_t2cwdq0z.jpg\",\"thumbnail_type\":\"image\\/jpeg\",\"thumbnail_size\":51558,\"searchStr\":\"tisu.jpg,!:sStrEnd\"}]', '5000'),
(3, 'Good Time', 1, '[{\"name\":\"files\\/good time_hxbjh2dj.jpg\",\"usrName\":\"good time.jpg\",\"size\":64562,\"type\":\"image\\/jpeg\",\"thumbnail\":\"files\\/thgood time_as6nserk.jpg\",\"thumbnail_type\":\"image\\/jpeg\",\"thumbnail_size\":31621,\"searchStr\":\"good time.jpg,!:sStrEnd\"}]', '3000'),
(4, 'Koyo', 3, '[{\"name\":\"files\\/koyo_fglx5h6f.jpg\",\"usrName\":\"koyo.jpg\",\"size\":35366,\"type\":\"image\\/jpeg\",\"searchStr\":\"koyo.jpg,!:sStrEnd\"}]', '6000');

-- --------------------------------------------------------

--
-- Table structure for table `barang_keluar`
--

CREATE TABLE `barang_keluar` (
  `id_barang_keluar` int(11) NOT NULL,
  `id_barang` int(11) DEFAULT NULL,
  `jumlah_stok_keluar` int(11) DEFAULT NULL,
  `total_harga_keluar` int(11) DEFAULT NULL,
  `harga_jual` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `barang_keluar`
--

INSERT INTO `barang_keluar` (`id_barang_keluar`, `id_barang`, `jumlah_stok_keluar`, `total_harga_keluar`, `harga_jual`, `created_at`) VALUES
(1, 1, 20, 140000, 1, '2024-02-29 15:36:12'),
(2, 2, 40, 200000, 2, '2024-02-29 15:36:12'),
(3, 3, 10, 30000, 3, '2024-02-29 15:36:12'),
(4, 4, 1, 6000, 4, '2024-02-29 15:36:12');

--
-- Triggers `barang_keluar`
--
DELIMITER $$
CREATE TRIGGER `kurang_stok` AFTER INSERT ON `barang_keluar` FOR EACH ROW BEGIN
UPDATE stok_barang SET jumlah_stok = jumlah_stok - NEW.jumlah_stok_keluar
WHERE id_barang = NEW.id_barang;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `barang_masuk`
--

CREATE TABLE `barang_masuk` (
  `id_barang_masuk` int(11) NOT NULL,
  `id_barang` int(11) DEFAULT NULL,
  `jumlah_stok_masuk` int(11) DEFAULT NULL,
  `total_harga_masuk` int(11) DEFAULT NULL,
  `harga_jual` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `barang_masuk`
--

INSERT INTO `barang_masuk` (`id_barang_masuk`, `id_barang`, `jumlah_stok_masuk`, `total_harga_masuk`, `harga_jual`, `created_at`) VALUES
(2, 1, 30, 210000, 1, '2024-02-29 15:35:59'),
(3, 2, 50, 250000, 2, '2024-02-29 15:35:59'),
(4, 3, 20, 60000, 3, '2024-02-29 15:35:59'),
(5, 4, 10, 60000, 4, '2024-02-29 15:35:59'),
(6, 1, 2, 14000, 1, '2024-02-29 15:37:54');

--
-- Triggers `barang_masuk`
--
DELIMITER $$
CREATE TRIGGER `tambah_stok` AFTER INSERT ON `barang_masuk` FOR EACH ROW BEGIN
UPDATE stok_barang SET jumlah_stok = jumlah_stok + NEW.jumlah_stok_masuk
WHERE id_barang = NEW.id_barang;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(11) NOT NULL,
  `kategori` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `kategori`) VALUES
(1, 'Makanan'),
(2, 'Minuman'),
(3, 'P3K'),
(4, 'Barang');

-- --------------------------------------------------------

--
-- Table structure for table `koperasi_users`
--

CREATE TABLE `koperasi_users` (
  `ID` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `groupid` varchar(255) DEFAULT NULL,
  `active` int(11) DEFAULT NULL,
  `ext_security_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `koperasi_users`
--

INSERT INTO `koperasi_users` (`ID`, `username`, `password`, `email`, `fullname`, `groupid`, `active`, `ext_security_id`) VALUES
(1, 'admin', '12345', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `stok_barang`
--

CREATE TABLE `stok_barang` (
  `id_stok` int(11) NOT NULL,
  `id_barang` int(11) DEFAULT NULL,
  `jumlah_stok` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `stok_barang`
--

INSERT INTO `stok_barang` (`id_stok`, `id_barang`, `jumlah_stok`) VALUES
(1, 1, 12),
(2, 2, 10),
(3, 3, 10),
(4, 4, 9);

-- --------------------------------------------------------

--
-- Table structure for table `total_harga_beli`
--

CREATE TABLE `total_harga_beli` (
  `id_total_hb` int(11) NOT NULL,
  `id_barang` int(11) DEFAULT NULL,
  `jumlah_stok` int(11) DEFAULT NULL,
  `harga_beli` int(11) DEFAULT NULL,
  `total_hb` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `total_harga_beli`
--

INSERT INTO `total_harga_beli` (`id_total_hb`, `id_barang`, `jumlah_stok`, `harga_beli`, `total_hb`, `created_at`) VALUES
(1, 1, 30, 6000, 180000, '2024-02-29 15:42:58'),
(2, 2, 50, 3000, 150000, '2024-02-29 15:42:58'),
(3, 3, 20, 2000, 40000, '2024-02-29 15:42:58'),
(4, 4, 10, 5000, 50000, '2024-02-29 15:42:58');

-- --------------------------------------------------------

--
-- Table structure for table `total_harga_jual`
--

CREATE TABLE `total_harga_jual` (
  `id_total_hj` int(11) NOT NULL,
  `id_barang` int(11) DEFAULT NULL,
  `jumlah_stok` int(11) DEFAULT NULL,
  `harga_jual` int(11) DEFAULT NULL,
  `total_hj` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `total_harga_jual`
--

INSERT INTO `total_harga_jual` (`id_total_hj`, `id_barang`, `jumlah_stok`, `harga_jual`, `total_hj`, `created_at`) VALUES
(1, 1, 30, 1, 21000, '2024-02-29 15:43:19'),
(2, 2, 50, 2, 250000, '2024-02-29 15:43:19'),
(3, 3, 20, 3, 60000, '2024-02-29 15:43:19'),
(4, 4, 10, 4, 60000, '2024-02-29 15:43:19');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indexes for table `barang_keluar`
--
ALTER TABLE `barang_keluar`
  ADD PRIMARY KEY (`id_barang_keluar`);

--
-- Indexes for table `barang_masuk`
--
ALTER TABLE `barang_masuk`
  ADD PRIMARY KEY (`id_barang_masuk`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `koperasi_users`
--
ALTER TABLE `koperasi_users`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `stok_barang`
--
ALTER TABLE `stok_barang`
  ADD PRIMARY KEY (`id_stok`);

--
-- Indexes for table `total_harga_beli`
--
ALTER TABLE `total_harga_beli`
  ADD PRIMARY KEY (`id_total_hb`);

--
-- Indexes for table `total_harga_jual`
--
ALTER TABLE `total_harga_jual`
  ADD PRIMARY KEY (`id_total_hj`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id_barang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `barang_keluar`
--
ALTER TABLE `barang_keluar`
  MODIFY `id_barang_keluar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `barang_masuk`
--
ALTER TABLE `barang_masuk`
  MODIFY `id_barang_masuk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `koperasi_users`
--
ALTER TABLE `koperasi_users`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `stok_barang`
--
ALTER TABLE `stok_barang`
  MODIFY `id_stok` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `total_harga_beli`
--
ALTER TABLE `total_harga_beli`
  MODIFY `id_total_hb` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `total_harga_jual`
--
ALTER TABLE `total_harga_jual`
  MODIFY `id_total_hj` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
