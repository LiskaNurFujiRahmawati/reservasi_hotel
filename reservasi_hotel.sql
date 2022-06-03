-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 03 Jun 2022 pada 12.54
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `reservasi_hotel`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbluser`
--

CREATE TABLE `tbluser` (
  `username` varchar(30) NOT NULL,
  `password` char(32) NOT NULL,
  `nama_user` varchar(20) NOT NULL,
  `level_user` enum('admin','petugas') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbluser`
--

INSERT INTO `tbluser` (`username`, `password`, `nama_user`, `level_user`) VALUES
('admin', '202cb962ac59075b964b07152d234b70', 'liska', 'admin'),
('petugas', '202cb962ac59075b964b07152d234b70', 'nur', 'petugas');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_detail_kamar`
--

CREATE TABLE `tbl_detail_kamar` (
  `id_detail_kamar` int(11) NOT NULL,
  `id_kamar` int(11) NOT NULL,
  `id_fasilitas_kamar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_detail_kamar`
--

INSERT INTO `tbl_detail_kamar` (`id_detail_kamar`, `id_kamar`, `id_fasilitas_kamar`) VALUES
(1, 1, 1),
(2, 1, 4),
(3, 1, 5),
(4, 2, 1),
(5, 2, 4),
(6, 2, 5),
(7, 2, 6),
(8, 3, 1),
(9, 3, 2),
(10, 3, 3),
(11, 3, 4),
(12, 3, 9),
(13, 4, 1),
(14, 4, 2),
(15, 4, 3),
(16, 4, 4),
(17, 4, 5),
(18, 4, 6),
(19, 4, 7),
(20, 4, 8),
(21, 4, 9);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_fasilitas_hotel`
--

CREATE TABLE `tbl_fasilitas_hotel` (
  `id_fasilitas_hotel` int(11) NOT NULL,
  `nama_fasilitas` varchar(100) NOT NULL,
  `deskripsi_fasilitas` text NOT NULL,
  `foto_fasilitas` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_fasilitas_hotel`
--

INSERT INTO `tbl_fasilitas_hotel` (`id_fasilitas_hotel`, `nama_fasilitas`, `deskripsi_fasilitas`, `foto_fasilitas`) VALUES
(1, 'wifi', 'aka diberitaukan pass wifi', 'wifi.png'),
(2, 'Parkiran Hotel', 'Tersedia parkiran hotel', 'parkiran.jpg'),
(3, 'fitness', 'tersedia untuk fitnes', 'fitnes.jpg'),
(4, 'Kolam Renang', 'tersedia kolam renang', 'kolam renang.jpg'),
(5, 'Restoran', 'tersedia restoran', 'restaurant.jpg'),
(6, 'Cafe', 'tersedia cafe', 'minum kopi.JPG');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_fasilitas_kamar`
--

CREATE TABLE `tbl_fasilitas_kamar` (
  `id_fasilitas_kamar` int(11) NOT NULL,
  `nama_fasilitas` varchar(100) NOT NULL,
  `deskripsi_fasilitas` text NOT NULL,
  `foto_fasilitas` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_fasilitas_kamar`
--

INSERT INTO `tbl_fasilitas_kamar` (`id_fasilitas_kamar`, `nama_fasilitas`, `deskripsi_fasilitas`, `foto_fasilitas`) VALUES
(1, 'tv', 'tersedia tv', 'tvpremium.jpg'),
(2, 'microwave', 'tersedia microwave', 'microwave.jpg'),
(3, 'deposite', 'tersedia deposite', 'deposite box.jpg'),
(4, 'Kamar mandi', 'tersedia kamar mandi', 'kamarmandi.jpg'),
(5, 'AC', 'tersedia AC', 'ac.jpg'),
(6, 'rooftop', 'tersedia rooftop', 'rooftop.jpg'),
(7, 'meja makan', 'tersedia mejamakan', 'mejamakan.jpg'),
(8, 'sofa kamar', 'tersedia sofa kamar', 'sofa kamar.jpg'),
(9, 'kulkas mini', 'tersedia kulkas mini', 'kulkas mini.jpg');

--
-- Trigger `tbl_fasilitas_kamar`
--
DELIMITER $$
CREATE TRIGGER `hapusFasilitasKamar` AFTER DELETE ON `tbl_fasilitas_kamar` FOR EACH ROW DELETE FROM tbl_detail_kamar WHERE id_fasilitas_kamar=OLD.id_fasilitas_kamar
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_kamar`
--

CREATE TABLE `tbl_kamar` (
  `id_kamar` int(11) NOT NULL,
  `harga_kamar` int(11) NOT NULL,
  `tipe_kamar` enum('standar','single','deluxe','suite') NOT NULL,
  `foto_kamar` varchar(150) NOT NULL,
  `jml_kamar` mediumint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_kamar`
--

INSERT INTO `tbl_kamar` (`id_kamar`, `harga_kamar`, `tipe_kamar`, `foto_kamar`, `jml_kamar`) VALUES
(1, 150000, 'standar', 'strandar kamar.jpg', 9),
(2, 200000, 'single', 'single.jpg', 6),
(3, 250000, 'deluxe', 'deluxe.jpg', 7),
(4, 300000, 'suite', 'suite.jpg', 10);

--
-- Trigger `tbl_kamar`
--
DELIMITER $$
CREATE TRIGGER `hapusDetailKamar` AFTER DELETE ON `tbl_kamar` FOR EACH ROW delete from tbl_detail_kamar where tbl_detail_kamar.id_kamar=old.id_kamar
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_reservasi`
--

CREATE TABLE `tbl_reservasi` (
  `id_reservasi` int(11) NOT NULL,
  `nama_pemesan` varchar(11) NOT NULL,
  `no_handphone` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `nama_tamu` varchar(100) NOT NULL,
  `id_kamar` int(11) NOT NULL,
  `tgl_cek_in` date NOT NULL,
  `tgl_cek_out` date NOT NULL,
  `jml_kamar_dipesan` int(11) NOT NULL,
  `status` enum('in','out') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_reservasi`
--

INSERT INTO `tbl_reservasi` (`id_reservasi`, `nama_pemesan`, `no_handphone`, `email`, `nama_tamu`, `id_kamar`, `tgl_cek_in`, `tgl_cek_out`, `jml_kamar_dipesan`, `status`) VALUES
(1, '0', '08979277151', 'l@gmail.com', 'nur', 1, '2022-06-04', '2022-06-05', 2, 'out'),
(2, 'liska', '08979277151', 'liska@gmail.com', 'fuji', 2, '2022-06-03', '2022-06-04', 2, 'in');

--
-- Trigger `tbl_reservasi`
--
DELIMITER $$
CREATE TRIGGER `infoJmlKamar` AFTER UPDATE ON `tbl_reservasi` FOR EACH ROW BEGIN
   	 IF (NEW.status='in') THEN
   		 UPDATE tbl_kamar SET jml_kamar=jml_kamar-OLD.jml_kamar_dipesan
   		 WHERE tbl_kamar.id_kamar=NEW.id_kamar;
   	 ELSE
   		 UPDATE tbl_kamar SET jml_kamar=jml_kamar+OLD.jml_kamar_dipesan
   		 WHERE tbl_kamar.id_kamar=NEW.id_kamar;   	 
   	 END IF;    
    END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tbluser`
--
ALTER TABLE `tbluser`
  ADD PRIMARY KEY (`username`);

--
-- Indeks untuk tabel `tbl_detail_kamar`
--
ALTER TABLE `tbl_detail_kamar`
  ADD PRIMARY KEY (`id_detail_kamar`);

--
-- Indeks untuk tabel `tbl_fasilitas_hotel`
--
ALTER TABLE `tbl_fasilitas_hotel`
  ADD PRIMARY KEY (`id_fasilitas_hotel`);

--
-- Indeks untuk tabel `tbl_fasilitas_kamar`
--
ALTER TABLE `tbl_fasilitas_kamar`
  ADD PRIMARY KEY (`id_fasilitas_kamar`);

--
-- Indeks untuk tabel `tbl_kamar`
--
ALTER TABLE `tbl_kamar`
  ADD PRIMARY KEY (`id_kamar`);

--
-- Indeks untuk tabel `tbl_reservasi`
--
ALTER TABLE `tbl_reservasi`
  ADD PRIMARY KEY (`id_reservasi`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tbl_detail_kamar`
--
ALTER TABLE `tbl_detail_kamar`
  MODIFY `id_detail_kamar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT untuk tabel `tbl_fasilitas_hotel`
--
ALTER TABLE `tbl_fasilitas_hotel`
  MODIFY `id_fasilitas_hotel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `tbl_fasilitas_kamar`
--
ALTER TABLE `tbl_fasilitas_kamar`
  MODIFY `id_fasilitas_kamar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `tbl_kamar`
--
ALTER TABLE `tbl_kamar`
  MODIFY `id_kamar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `tbl_reservasi`
--
ALTER TABLE `tbl_reservasi`
  MODIFY `id_reservasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
