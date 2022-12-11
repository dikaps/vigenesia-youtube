-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 07 Des 2021 pada 02.41
-- Versi server: 10.4.21-MariaDB
-- Versi PHP: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vigenesia`
--
-- CREATE DATABABASE `vigenesia`
-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori_motivasi`
--

CREATE TABLE `kategori_motivasi` (
  `id` int(11) NOT NULL,
  `kategori` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `likes`
--

CREATE TABLE `likes` (
  `id` int(11) NOT NULL,
  `id_motivasi` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `likes` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `likes`
--

INSERT INTO `likes` (`id`, `id_motivasi`, `id_user`, `likes`) VALUES
(98, 87, 19, 1),
(99, 87, 1, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `motivasi`
--

CREATE TABLE `motivasi` (
  `id` int(11) NOT NULL,
  `isi_motivasi` text NOT NULL,
  `iduser` int(11) NOT NULL,
  `tanggal_input` date NOT NULL,
  `tanggal_update` date NOT NULL,
  `likes` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `motivasi`
--

INSERT INTO `motivasi` (`id`, `isi_motivasi`, `iduser`, `tanggal_input`, `tanggal_update`, `likes`) VALUES
(82, 'Update Data Sesuai keinginan kamu', 1, '2021-11-25', '2021-11-26', 0),
(83, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Obcaecati quisquam doloremque ipsa sit dignissimos impedit est nobis libero, architecto illo maxime quos, laborum ratione earum excepturi aliquam voluptatem ipsum repellendus voluptate accusantium molestiae quae nemo reiciendis? Laboriosam quam cupiditate ipsa corrupti libero nihil debitis, obcaecati, tempora quia distinctio ad. Fuga magnam assumenda saepe nisi voluptatem. Autem necessitatibus facilis dignissimos reprehenderit quibusdam aperiam, fugiat omnis cumque numquam officia deleniti? Vero, dolorum, expedita, iure deleniti minus facilis accusantium quo error facere at pariatur. Esse vitae fugiat soluta asperiores quo cumque harum magnam. Inventore porro quibusdam reiciendis, quis nobis exercitationem at sed dolores!', 1, '2021-11-25', '0000-00-00', 0),
(87, 'Test', 19, '2021-12-05', '0000-00-00', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `report_apk`
--

CREATE TABLE `report_apk` (
  `id` int(11) NOT NULL,
  `desc` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `role` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `role`
--

INSERT INTO `role` (`id`, `role`) VALUES
(1, 'admin'),
(2, 'member');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `iduser` int(11) NOT NULL,
  `nama` varchar(128) NOT NULL,
  `profesi` varchar(50) NOT NULL,
  `email` varchar(128) NOT NULL,
  `password` varchar(256) NOT NULL,
  `role_id` int(11) NOT NULL,
  `is_active` int(1) NOT NULL,
  `tanggal_input` date NOT NULL,
  `modified` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`iduser`, `nama`, `profesi`, `email`, `password`, `role_id`, `is_active`, `tanggal_input`, `modified`) VALUES
(1, 'Andika', 'Programmer', 'andika@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 2, 1, '2021-11-10', '2021-12-02'),
(19, 'Kelompok 2', 'Porgrammer', 'kelompok2@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 2, 1, '2021-11-25', '2021-12-05'),
(21, 'test', 'Mahasiswa', 'test@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 2, 1, '2021-12-02', '0000-00-00');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `likes_ibfk_1` (`id_motivasi`);

--
-- Indeks untuk tabel `motivasi`
--
ALTER TABLE `motivasi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `iduser` (`iduser`);

--
-- Indeks untuk tabel `report_apk`
--
ALTER TABLE `report_apk`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`iduser`),
  ADD KEY `id` (`iduser`,`nama`,`email`,`password`,`role_id`,`is_active`,`tanggal_input`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT untuk tabel `motivasi`
--
ALTER TABLE `motivasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT untuk tabel `report_apk`
--
ALTER TABLE `report_apk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `iduser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`id_motivasi`) REFERENCES `motivasi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`iduser`);

--
-- Ketidakleluasaan untuk tabel `motivasi`
--
ALTER TABLE `motivasi`
  ADD CONSTRAINT `motivasi_ibfk_1` FOREIGN KEY (`iduser`) REFERENCES `user` (`iduser`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
