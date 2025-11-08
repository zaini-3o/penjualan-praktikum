-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 08, 2025 at 07:11 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `penjualan`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id` int NOT NULL,
  `barkode` int DEFAULT NULL,
  `name` char(100) DEFAULT NULL,
  `harga_jual` bigint DEFAULT NULL,
  `harga_beli` bigint DEFAULT NULL,
  `stok` int DEFAULT NULL,
  `kategori_id` int DEFAULT NULL,
  `satuan_id` int DEFAULT NULL,
  `supplier_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id`, `barkode`, `name`, `harga_jual`, `harga_beli`, `stok`, `kategori_id`, `satuan_id`, `supplier_id`, `user_id`) VALUES
(1, 101010, 'pulpen joyko', 3000, 2000, 20, 1, 1, 1, 1),
(2, 110110, 'penghapus montana', 15000, 13000, 20, 5, 2, 2, 2),
(3, 101218, 'pensil faber castel', 70000, 68000, 25, 2, 5, 3, 3),
(4, 101310, 'buku tulis vision', 40000, 38000, 20, 3, 3, NULL, 4),
(5, 101410, 'kertas hvs a4 sidu', 55000, 53000, 25, 4, 4, NULL, 5),
(13, 231001, 'sepatu', 255000, 195000, 19, 9, 2, 3, 19);

-- --------------------------------------------------------

--
-- Table structure for table `detail_beli`
--

CREATE TABLE `detail_beli` (
  `id` int NOT NULL,
  `harga` bigint DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `subtotal` bigint DEFAULT NULL,
  `pembelian_id` int DEFAULT NULL,
  `barang_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `detail_beli`
--

INSERT INTO `detail_beli` (`id`, `harga`, `qty`, `subtotal`, `pembelian_id`, `barang_id`) VALUES
(1, 2000, 20, 40000, 1, 1),
(2, 13000, 10, 130000, 1, 2),
(3, 68000, 5, 340000, 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `detail_jual`
--

CREATE TABLE `detail_jual` (
  `id` int NOT NULL,
  `harga` bigint DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `subtotal` bigint DEFAULT NULL,
  `penjualan_id` int DEFAULT NULL,
  `barang_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `detail_jual`
--

INSERT INTO `detail_jual` (`id`, `harga`, `qty`, `subtotal`, `penjualan_id`, `barang_id`) VALUES
(1, 3000, 10, 30000, 1, 1),
(2, 15000, 5, 75000, 1, 2),
(3, 70000, 2, 140000, 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id` int NOT NULL,
  `name` char(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id`, `name`) VALUES
(1, 'Drink'),
(2, 'Foods'),
(3, 'buku'),
(4, 'kertas'),
(5, 'penghapus'),
(6, 'Elektronik'),
(9, 'Teknologi');

-- --------------------------------------------------------

--
-- Table structure for table `kustomer`
--

CREATE TABLE `kustomer` (
  `id` int NOT NULL,
  `nik` char(20) DEFAULT NULL,
  `name` char(100) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `telp` char(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `kustomer`
--

INSERT INTO `kustomer` (`id`, `nik`, `name`, `alamat`, `telp`) VALUES
(1, '6372620006', 'abida', 'jl Veteran', '081225735784'),
(2, '6372720007', 'erdia', 'jl Handil Bakti', '08127537843'),
(3, '6372820008', 'Maisha', 'jl keramat', '081208539835'),
(4, '6372920009', 'Uwais', 'jl antasan kecil timur', '08128999358'),
(5, '6373020010', 'Yumna', 'jl gatot subroto', '081294839676');

-- --------------------------------------------------------

--
-- Table structure for table `pembelian`
--

CREATE TABLE `pembelian` (
  `id` int NOT NULL,
  `invoice` int DEFAULT NULL,
  `total` bigint DEFAULT NULL,
  `dibayar` bigint DEFAULT NULL,
  `diskripsi` varchar(255) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `supplier_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pembelian`
--

INSERT INTO `pembelian` (`id`, `invoice`, `total`, `dibayar`, `diskripsi`, `tanggal`, `supplier_id`, `user_id`) VALUES
(1, 20251101, 250000, 250000, 'Pembelian alat tulis', '2025-11-01', 1, 1),
(2, 20251102, 500000, 500000, 'Pembelian barang grosir', '2025-11-02', 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `id` int NOT NULL,
  `invoice` int DEFAULT NULL,
  `total` bigint DEFAULT NULL,
  `dibayar` bigint DEFAULT NULL,
  `kembali` bigint DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `kustomer_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `penjualan`
--

INSERT INTO `penjualan` (`id`, `invoice`, `total`, `dibayar`, `kembali`, `tanggal`, `kustomer_id`, `user_id`) VALUES
(1, 20251103, 150000, 150000, 0, '2025-11-03', 1, 1),
(2, 20251104, 210000, 210000, 0, '2025-11-04', 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `satuan`
--

CREATE TABLE `satuan` (
  `id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `deskripsi` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `satuan`
--

INSERT INTO `satuan` (`id`, `name`, `deskripsi`) VALUES
(1, 'Pcs', 'Satuan per item atau per buah'),
(2, 'Box', 'Satuan dalam kemasan kotak'),
(3, 'Pack', 'Satuan dalam kemasan bungkus'),
(4, 'Lusin', 'Berisi 12 item dalam satuan'),
(5, 'Rim', 'Berisi 500 lembar kertas');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `id` int NOT NULL,
  `nik` varchar(16) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `telp` char(20) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `perusahaan` varchar(150) DEFAULT NULL,
  `nama_bank` varchar(150) DEFAULT NULL,
  `nama_akun_bank` varchar(150) DEFAULT NULL,
  `no_akun_bank` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`id`, `nik`, `name`, `telp`, `email`, `alamat`, `perusahaan`, `nama_bank`, `nama_akun_bank`, `no_akun_bank`) VALUES
(1, '1234567890123456', 'PT Sumber Makmur', '081234567890', 'info@sumbermakmur.com', 'Jl. Raya Sudirman No.10', 'PT Sumber Makmur', 'BCA', 'Sumber Makmur', '1234567890'),
(2, '9876543210987654', 'CV Berkah Abadi', '082134567890', 'cs@berkahabadi.com', 'Jl. Merdeka No.21', 'CV Berkah Abadi', 'Mandiri', 'Berkah Abadi', '0987654321'),
(3, '1111222233334444', 'UD Jaya Sentosa', '083156789012', 'kontak@jayasentosa.com', 'Jl. Ahmad Yani No.45', 'UD Jaya Sentosa', 'BRI', 'Jaya Sentosa', '4567891230');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `nik` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `username` char(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `full_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `role` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phone` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `is_active` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `nik`, `username`, `full_name`, `password`, `role`, `phone`, `email`, `address`, `last_login`, `is_active`) VALUES
(1, '6372120001', 'nmalaa_', 'Nurmala Sari', 'malacantik', 'owner', '081123058435', 'nurmalasri@gmail.com', 'jl. veteran', '0000-00-00 00:00:00', 1),
(2, '6372220002', 'alyanormda', 'Alya Normaida', 'yayalya', 'manajer', '081245830206', 'alyanormaida1@gmail.com', 'jl. trans kalimantan', '0000-00-00 00:00:00', 1),
(3, '6372320003', 'marini24', 'Marini Islami', 'ririn', 'wakil manajer', '081273973478', 'marinirini@gmail.com', 'jl. kelayan A', '0000-00-00 00:00:00', 1),
(4, '6372420004', 'jmzahraa', 'Jamilatuzzahra', 'gleamara', 'staff', '081248395709', 'jmzara@gmail.com', 'jl. kelayan B', '0000-00-00 00:00:00', 1),
(5, '6372520005', 'nanazkia', 'Nazwa Azkia', 'azkiayaya', 'staff', '084850958467', 'azkianazwa@gmail.com', 'jl. Sungai Andai', '0000-00-00 00:00:00', 1),
(19, '1573456098234567', 'zaini', 'zaini', '$2y$10$zwS4jn7KfOn6ieFqEhrWse2FDnUnuQ9GnO5jKH2PHLPVOFDxzK.eG', 'ADMIN', '085878005134', 'zaini@gmail.com', 'jl ayani', '2025-11-06 14:06:31', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `barang_kategori_fk` (`kategori_id`),
  ADD KEY `barang_satuan_fk` (`satuan_id`),
  ADD KEY `barang_supplier_fk` (`supplier_id`),
  ADD KEY `barang_user_fk` (`user_id`);

--
-- Indexes for table `detail_beli`
--
ALTER TABLE `detail_beli`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pembelian_id` (`pembelian_id`),
  ADD KEY `barang_id` (`barang_id`);

--
-- Indexes for table `detail_jual`
--
ALTER TABLE `detail_jual`
  ADD PRIMARY KEY (`id`),
  ADD KEY `penjualan_id` (`penjualan_id`),
  ADD KEY `barang_id` (`barang_id`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kustomer`
--
ALTER TABLE `kustomer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kustomer_id` (`kustomer_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `satuan`
--
ALTER TABLE `satuan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `detail_beli`
--
ALTER TABLE `detail_beli`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `detail_jual`
--
ALTER TABLE `detail_jual`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `kustomer`
--
ALTER TABLE `kustomer`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `satuan`
--
ALTER TABLE `satuan`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `barang_kategori_fk` FOREIGN KEY (`kategori_id`) REFERENCES `kategori` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `barang_satuan_fk` FOREIGN KEY (`satuan_id`) REFERENCES `satuan` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `barang_supplier_fk` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `barang_user_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `detail_beli`
--
ALTER TABLE `detail_beli`
  ADD CONSTRAINT `detail_beli_barang_fk` FOREIGN KEY (`barang_id`) REFERENCES `barang` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_beli_pembelian_fk` FOREIGN KEY (`pembelian_id`) REFERENCES `pembelian` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `detail_jual`
--
ALTER TABLE `detail_jual`
  ADD CONSTRAINT `detail_jual_barang_fk` FOREIGN KEY (`barang_id`) REFERENCES `barang` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_jual_penjualan_fk` FOREIGN KEY (`penjualan_id`) REFERENCES `penjualan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD CONSTRAINT `pembelian_supplier_fk` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `pembelian_user_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD CONSTRAINT `penjualan_kustomer_fk` FOREIGN KEY (`kustomer_id`) REFERENCES `kustomer` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `penjualan_user_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
