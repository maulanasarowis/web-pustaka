-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 26 Okt 2020 pada 15.51
-- Versi server: 10.4.13-MariaDB
-- Versi PHP: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pustaka_2db`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `buku`
--

CREATE TABLE `buku` (
  `kd_buku` char(5) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `isbn` varchar(40) NOT NULL,
  `pengarang` varchar(100) NOT NULL,
  `halaman` int(4) NOT NULL,
  `jumlah` int(4) NOT NULL,
  `th_terbit` varchar(4) NOT NULL,
  `gambar` varchar(200) NOT NULL,
  `sinopsis` text NOT NULL,
  `kd_penerbit` char(3) NOT NULL,
  `kd_kategori` char(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `buku`
--

INSERT INTO `buku` (`kd_buku`, `judul`, `isbn`, `pengarang`, `halaman`, `jumlah`, `th_terbit`, `gambar`, `sinopsis`, `kd_penerbit`, `kd_kategori`) VALUES
('B0001', 'Matematika - Kelas 10', '2323232324', 'Supartono', 250, 20, '2013', '-', 'Buku matematika untuk kelas 1 (IX) SMA', 'P01', 'K02'),
('B0002', 'Bahasa Indonesia - Kelas 10', '343434333', 'Agus Mahendra', 300, 25, '2014', '-', 'Buku Bahasa Indonesia untuk kelas 1 (IX) SMA', 'P02', 'K03'),
('B0003', 'Matematika - Kelas 11', '2323232325', 'Supartono', 270, 25, '2015', '-', 'Buku Matematika untuk kelas 2 (X) SMA', 'P01', 'K02'),
('B0004', 'Matematika - Kelas 12', '24223232', 'Sudarmaji, Spd', 268, 20, '2011', '', 'Buku matematika kelas 3', 'P01', 'K02'),
('B0005', 'Kompetensi Berbahasa dan Sastra Indonesia - Kelas 10', '-', 'Syamsuddin AR., Agus Mulyanto, Deden Fathudin', 250, 20, '2009', 'B0005.20090904215243.jpg', '-', 'P06', 'K03'),
('B0006', 'Ekonomi - Kelas 10', '-', 'Yuli Eko', 270, 20, '2009', 'B0006.20090904215214.jpg', '-', 'P06', 'K05'),
('B0019', 'website', '123456789', 'bbb', 90, 8, '2017', '', '-', 'P01', 'K11'),
('B0008', 'Fisika - Kelas 10', '-', 'Tri Widodo', 280, 20, '2009', 'B0008.20090904214400.jpg', '-', 'P06', 'K06'),
('B0009', 'Sosiologi 1 Menyelami Fenomena Sosial di Masyarakat - Kelas 10', '-', 'Bagja Waluya', 340, 20, '2009', 'B0009.20090904214235.jpg', '-', 'P06', 'K07'),
('B0010', 'Cakrawala Sejarah 1 - Kelas 10', '-', 'Wardaya', 325, 20, '2009', 'B0010.20090904214212.jpg', '-', 'P06', 'K08'),
('B0011', 'Panduan Pembelajaran Fisika', '-', 'Suparmo, Tri Widodo', 321, 20, '2009', 'B0011.20090904121424.jpg', '-', 'P06', 'K06'),
('B0012', 'Sosiologi 1 - Kelas 10', '-', 'Elisanti, Tintin Rostini', 285, 20, '2009', 'B0012.20090904121002.jpg', '-', 'P06', 'K07'),
('B0013', 'Mengasah Kemampuan Ekonomi', '-', 'Bambang Widjajanta, Aristanti W, Heraeni', 275, 20, '2009', 'B0013.20090904080535.jpg', '-', 'P06', 'K05'),
('B0015', 'Cakrawala Sejarah (IPS) - Kelas 11', '-', 'Wardaya', 289, 20, '2009', 'B0015.20090904214314.jpg', '-', 'P06', 'K08'),
('B0016', 'Cakrawala Sejarah (Bahasa) - Kelas 11', '-', 'Wardaya', 330, 20, '2009', 'B0016.20090904214246.jpg', '-', 'P06', 'K08'),
('B0017', 'Khazanah Matematika - Kelas 11', '-', 'Rosihan Ari Y., Indriyastuti', 312, 20, '2009', 'B0017.20090904122314.jpg', '-', 'P06', 'K02'),
('B0018', 'Sosiologi - Kelas 11', '-', 'Elisanti, Tintin Rostini', 312, 20, '2009', 'B0018.20090904121048.jpg', '-', 'P06', 'K07');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `kd_kategori` char(3) NOT NULL,
  `nm_kategori` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`kd_kategori`, `nm_kategori`) VALUES
('K01', 'Agama'),
('K02', 'Matematika'),
('K03', 'Bahasa Indonesia'),
('K04', 'Bahasa Inggris'),
('K05', 'Ekonomi'),
('K06', 'Fisika'),
('K07', 'Sosiologi'),
('K08', 'Sejarah'),
('K09', 'Biologi'),
('K11', 'ilmu komputer');

-- --------------------------------------------------------

--
-- Struktur dari tabel `peminjaman`
--

CREATE TABLE `peminjaman` (
  `no_pinjam` char(6) NOT NULL,
  `tgl_pinjam` date NOT NULL,
  `kd_siswa` char(5) NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  `lama_pinjam` int(2) NOT NULL,
  `status` enum('Pinjam','Kembali') NOT NULL DEFAULT 'Pinjam',
  `kd_user` char(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `peminjaman_detil`
--

CREATE TABLE `peminjaman_detil` (
  `no_pinjam` char(6) NOT NULL,
  `kd_buku` char(5) NOT NULL,
  `jumlah` int(2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `peminjaman_detil`
--

INSERT INTO `peminjaman_detil` (`no_pinjam`, `kd_buku`, `jumlah`) VALUES
('PJ0002', 'B0005', 1),
('PJ0002', 'B0006', 1),
('PJ0003', 'B0008', 1),
('PJ0003', 'B0006', 1),
('PJ0005', 'B0006', 1),
('PJ0005', 'B0009', 1),
('PJ0008', 'B0001', 1),
('PJ0007', 'B0013', 1),
('PJ0007', 'B0006', 1),
('PJ0009', 'B0006', 1),
('PJ0002', 'B0001', 1),
('PJ0003', 'B0003', 1),
('PJ0004', 'B0001', 1),
('PJ1', 'B0013', 1),
('PJ1', 'B0002', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `penerbit`
--

CREATE TABLE `penerbit` (
  `kd_penerbit` char(3) NOT NULL,
  `nm_penerbit` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `penerbit`
--

INSERT INTO `penerbit` (`kd_penerbit`, `nm_penerbit`) VALUES
('P01', 'Erlangga'),
('P02', 'Kanisius'),
('P03', 'Intan Pariwara'),
('P04', 'Elex Media Komputindo'),
('P05', 'Andi Offset'),
('P1', 'PPDPN');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengadaan`
--

CREATE TABLE `pengadaan` (
  `no_pengadaan` char(5) NOT NULL,
  `tgl_pengadaan` date NOT NULL,
  `kd_buku` char(5) NOT NULL,
  `asal_buku` varchar(100) NOT NULL,
  `jumlah` int(2) NOT NULL,
  `keterangan` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pengadaan`
--

INSERT INTO `pengadaan` (`no_pengadaan`, `tgl_pengadaan`, `kd_buku`, `asal_buku`, `jumlah`, `keterangan`) VALUES
('PB001', '2016-02-03', 'B0001', 'Sumbangan Guru', 10, 'Buku Matematika untuk Kelas 1 SMA'),
('PB002', '2016-02-03', 'B0003', 'BOS', 40, 'Buku Matematika untuk Kelas 2 SMA'),
('PB003', '2016-02-03', 'B0001', 'BOS', 25, 'Buku Matematika untuk Kelas 1 SMA'),
('PB004', '2017-11-21', 'B0006', 'BOS', 50, '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengembalian`
--

CREATE TABLE `pengembalian` (
  `no_kembali` char(6) NOT NULL,
  `tgl_kembali` date NOT NULL,
  `no_pinjam` char(6) NOT NULL,
  `denda` int(12) NOT NULL,
  `kd_user` char(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `siswa`
--

CREATE TABLE `siswa` (
  `kd_siswa` char(5) NOT NULL,
  `nm_siswa` varchar(100) NOT NULL,
  `nisn` varchar(20) NOT NULL,
  `kelamin` char(1) NOT NULL,
  `agama` varchar(20) NOT NULL,
  `tempat_lahir` varchar(100) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `alamat` varchar(200) NOT NULL,
  `no_telepon` varchar(20) NOT NULL,
  `foto` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `siswa`
--

INSERT INTO `siswa` (`kd_siswa`, `nm_siswa`, `nisn`, `kelamin`, `agama`, `tempat_lahir`, `tanggal_lahir`, `alamat`, `no_telepon`, `foto`) VALUES
('S0001', 'Lusi Rahayu Utami', '9955394480', 'P', 'Islam', 'Pekanbaru', '1999-03-02', 'Jl Dr. Soetomo No.12', '085363423439', 'S0001.IMG_0116.jpg'),
('S0002', 'adi mahati', '9965415709', 'L', 'Islam', 'pekanbaru', '2000-01-08', 'Jl. Thamrin No.25', '085364323567', ''),
('S0003', 'M Sarifudin', '9955393434', 'L', 'Islam', 'pekanbaru', '1999-03-15', 'Jalan Hang Tuah No.30', '081273649966', ''),
('S0004', 'Marlina', '9965416494', 'P', 'Kristen', 'Medan', '1999-09-04', 'jl.duyung nO.2', '081945657789', ''),
('S0005', 'Linda Ariyani', '9965414803', 'P', 'Islam', 'pekanbaru', '1999-08-08', 'Jl Paus No.2A', '081296547777', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tmp_pinjam`
--

CREATE TABLE `tmp_pinjam` (
  `id` int(11) NOT NULL,
  `kd_buku` char(5) NOT NULL,
  `jumlah` int(4) NOT NULL,
  `kd_user` char(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `kd_user` char(3) NOT NULL,
  `nm_user` varchar(100) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`kd_user`, `nm_user`, `username`, `password`) VALUES
('U01', 'admin', 'admin', '21232f297a57a5a743894a0e4a801fc3'),
('U1', 'maulana', 'admin', '21232f297a57a5a743894a0e4a801fc3');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`kd_buku`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`kd_kategori`);

--
-- Indeks untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`no_pinjam`);

--
-- Indeks untuk tabel `penerbit`
--
ALTER TABLE `penerbit`
  ADD PRIMARY KEY (`kd_penerbit`);

--
-- Indeks untuk tabel `pengadaan`
--
ALTER TABLE `pengadaan`
  ADD PRIMARY KEY (`no_pengadaan`);

--
-- Indeks untuk tabel `pengembalian`
--
ALTER TABLE `pengembalian`
  ADD PRIMARY KEY (`no_kembali`);

--
-- Indeks untuk tabel `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`kd_siswa`);

--
-- Indeks untuk tabel `tmp_pinjam`
--
ALTER TABLE `tmp_pinjam`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`kd_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tmp_pinjam`
--
ALTER TABLE `tmp_pinjam`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
