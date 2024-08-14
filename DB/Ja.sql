-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 21, 2022 at 10:56 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.3.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jayawaras`
--

-- --------------------------------------------------------

--
-- Table structure for table `berita`
--

CREATE TABLE `berita` (
  `id` int(11) NOT NULL,
  `penulis` varchar(255) DEFAULT NULL,
  `edit` varchar(255) DEFAULT NULL,
  `judul` varchar(255) DEFAULT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  `konten` text DEFAULT NULL,
  `date_created` int(11) DEFAULT NULL,
  `date_modify` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `berita`
--

INSERT INTO `berita` (`id`, `penulis`, `edit`, `judul`, `gambar`, `konten`, `date_created`, `date_modify`) VALUES
(3, 'neko', 'neko', 'Kebakaran Hutan', '2.jpg', '<p style=\"text-align: left; margin-top: 0in; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"></p><p style=\"margin-top: 0in; text-align: justify; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><font color=\"#000000\" face=\"Open Sans, sans-serif\">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolor harum ipsa molestias necessitatibus temporibus consectetur! Recusandae cupiditate alias, architecto minus magnam veritatis necessitatibus animi pariatur esse repellat optio fugiat saepe enim ex quo quaerat modi quae quidem expedita impedit possimus non. Nulla corporis sunt delectus pariatur cupiditate quos, explicabo distinctio modi reprehenderit saepe vel vitae fugit quo! Ab, expedita perferendis rem vero eum assumenda iure ex dolorum dolorem modi at omnis ullam animi. Exercitationem, itaque dolorum porro impedit ad tenetur iusto saepe, ut quam doloribus doloremque nisi magni velit animi obcaecati? Ea ipsam dolorum, pariatur eaque at dicta dolores soluta.</font><br></p><p></p><p style=\"margin-top: 0in; text-align: justify; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"></p>', 1644474932, 1645338685),
(5, 'neko', 'neko', 'anjing', 'download.jpg', '<p>123123131dczsdfsvsdvsgdgszgfASCFacaswd<br></p>', 1645229789, 1645338687),
(6, 'neko', 'neko', 'sadadsa', 'WIN_20211115_11_41_24_Pro.jpg', '<p>asdadasdas<br></p>', 1645229801, 1645338690),
(7, 'neko', 'neko', 'sadasdasd', 'download2.jpg', '<p>asdasdasdasd<br></p>', 1645229810, 1645338692);

-- --------------------------------------------------------

--
-- Table structure for table `dokumen`
--

CREATE TABLE `dokumen` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `dokumen` varchar(255) DEFAULT NULL,
  `pengedit` varchar(255) DEFAULT NULL,
  `kategori_id` int(11) DEFAULT NULL,
  `date_created` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dokumen`
--

INSERT INTO `dokumen` (`id`, `nama`, `dokumen`, `pengedit`, `kategori_id`, `date_created`) VALUES
(5, 'Surat Izin Keramaian', 'Surat_Izin_Keramaian.docx', 'neko', 1, 1645169080),
(6, 'Surat Keterangan Catatan Kepolisian', 'SURAT_KETERANGAN_CATATAN_KEPOLISIAN.docx', 'neko', 1, 1645173020);

-- --------------------------------------------------------

--
-- Table structure for table `jabatan`
--

CREATE TABLE `jabatan` (
  `id` int(11) NOT NULL,
  `jabatan` varchar(255) DEFAULT NULL,
  `perangkat_id` int(11) DEFAULT 0,
  `lembaga_id` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `karyawan`
--

CREATE TABLE `karyawan` (
  `id` int(11) NOT NULL,
  `nip` varchar(255) DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `kategori_jabatan` varchar(255) DEFAULT NULL,
  `jabatan` varchar(255) DEFAULT NULL,
  `no_telepon` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `modif_by` varchar(255) DEFAULT NULL,
  `date_created` int(11) DEFAULT NULL,
  `date_modify` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `karyawan`
--

INSERT INTO `karyawan` (`id`, `nip`, `nama`, `photo`, `kategori_jabatan`, `jabatan`, `no_telepon`, `email`, `gender`, `modif_by`, `date_created`, `date_modify`) VALUES
(1, '123456789123456789', 'naufal rabani', '5-gambar-lucu.jpg', 'Perangkat Desa', 'Kepala Desa', '025864131476', 'mainemfaris1@gmail.com', 'Laki-laki', 'neko', 1644718682, 1644938286),
(2, '', 'naufal', 'Capture_(2).PNG', 'Lembaga Desa', 'RT', '0167480235', 'irnaapriyani205@gmail.com', 'Perempuan', 'neko', 1644719641, 1644720211),
(3, '123456789123456789', 'naufal rabani', '5-gambar-lucu.jpg', 'Perangkat Desa', 'Kepala Desa', '025864131476', 'mainemfaris1@gmail.com', 'Laki-laki', 'neko', 1644718682, 1644938286),
(4, '123456789123456789', 'naufal rabani', '5-gambar-lucu.jpg', 'Perangkat Desa', 'Kepala Desa', '025864131476', 'mainemfaris1@gmail.com', 'Laki-laki', 'neko', 1644718682, 1644938286),
(5, '123456789123456789', 'naufal rabani', '5-gambar-lucu.jpg', 'Perangkat Desa', 'Kepala Desa', '025864131476', 'mainemfaris1@gmail.com', 'Laki-laki', 'neko', 1644718682, 1644938286),
(6, '123456789123456789', 'naufal rabani', '5-gambar-lucu.jpg', 'Perangkat Desa', 'Kepala Desa', '025864131476', 'mainemfaris1@gmail.com', 'Laki-laki', 'neko', 1644718682, 1644938286);

-- --------------------------------------------------------

--
-- Table structure for table `kategori_doc`
--

CREATE TABLE `kategori_doc` (
  `id` int(11) NOT NULL,
  `kategori` varchar(255) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kategori_doc`
--

INSERT INTO `kategori_doc` (`id`, `kategori`) VALUES
(1, 'Surat'),
(3, 'Peraturan'),
(4, 'Surat Pemerintahan');

-- --------------------------------------------------------

--
-- Table structure for table `kategori_sarana`
--

CREATE TABLE `kategori_sarana` (
  `id` int(11) NOT NULL,
  `nama_kategori` varchar(255) DEFAULT NULL,
  `kategori` varchar(255) DEFAULT NULL,
  `inisial` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kategori_sarana`
--

INSERT INTO `kategori_sarana` (`id`, `nama_kategori`, `kategori`, `inisial`) VALUES
(1, 'Sekolah Dasar /MI', 'Pendidikan', 'SD'),
(2, 'Paud Kober', 'Pendidikan', 'Paud'),
(3, 'SLTP', 'Pendidikan', 'SMP'),
(4, 'SLTA', 'Pendidikan', 'SMA'),
(5, 'Taman Kanak-kanak', 'Pendidikan', 'TK'),
(6, 'Puskesmas', 'Kesehatan', 'Puskesmas'),
(7, 'Posyandu', 'Kesehatan', 'Posyandu'),
(8, 'Doktor Swasta', 'Kesehatan', 'DS'),
(9, 'Bidan Swasta', 'Kesehatan', 'BS'),
(10, 'Kader Posyandu', 'Kesehatan', 'KP'),
(11, 'Bidang Kelurahan', 'Kesehatan', 'BK');

-- --------------------------------------------------------

--
-- Table structure for table `lembaga_desa`
--

CREATE TABLE `lembaga_desa` (
  `id` int(11) NOT NULL,
  `jabatan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `lembaga_desa`
--

INSERT INTO `lembaga_desa` (`id`, `jabatan`) VALUES
(1, 'RT-001');

-- --------------------------------------------------------

--
-- Table structure for table `pekerjaan`
--

CREATE TABLE `pekerjaan` (
  `id_pekerjaan` int(11) NOT NULL,
  `nama_pekerjaan` varchar(255) DEFAULT NULL,
  `date_created` int(11) DEFAULT NULL,
  `date_modify` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pekerjaan`
--

INSERT INTO `pekerjaan` (`id_pekerjaan`, `nama_pekerjaan`, `date_created`, `date_modify`) VALUES
(1, 'Guru', 1645322210, 1645322280),
(2, 'IRT', 1645322214, 1645322214),
(3, 'PNS', 1645322218, 1645322218),
(5, 'Wiraswasta', 1645322248, 1645322248),
(6, 'Pelajar', 1645322253, 1645322253),
(7, 'BelumBekerja', 1645322265, 1645322265);

-- --------------------------------------------------------

--
-- Table structure for table `penduduk`
--

CREATE TABLE `penduduk` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `jenis_kelamin` enum('Laki-laki','Perempuan','','') NOT NULL,
  `no_kk` char(16) DEFAULT NULL,
  `nik` char(16) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `tempat_lahir` varchar(255) DEFAULT NULL,
  `agama` varchar(255) DEFAULT NULL,
  `rt` char(3) DEFAULT NULL,
  `rw` char(3) DEFAULT NULL,
  `alamat_spesifik` text DEFAULT NULL,
  `status_perkawinan` enum('Belum Kawin','Kawin','Cerai Mati','Cerai Hidup') DEFAULT NULL,
  `status_pendidikan` varchar(100) DEFAULT NULL,
  `id_pekerjaan` int(2) DEFAULT NULL,
  `date_created` int(11) DEFAULT NULL,
  `date_modify` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `penduduk`
--

INSERT INTO `penduduk` (`id`, `nama`, `jenis_kelamin`, `no_kk`, `nik`, `tanggal_lahir`, `tempat_lahir`, `agama`, `rt`, `rw`, `alamat_spesifik`, `status_perkawinan`, `status_pendidikan`, `id_pekerjaan`, `date_created`, `date_modify`) VALUES
(2, 'asd', 'Laki-laki', '1234567894567899', '1231231231231232', '2022-02-10', 'Garut', 'Islam', '004', '001', 'gart', 'Belum Kawin', 'Tidak/Belum Sekolah', 1, 1645324079, 1645328248),
(3, 'test1', 'Laki-laki', '1234567897894562', '1234567897894561', '2022-02-13', 'Grt', 'Konghucu', '002', '003', 'grt', 'Belum Kawin', 'TamatSD', 6, 1645324716, 1645324716),
(4, 'test2', 'Perempuan', '1234567897894564', '1234567897894563', '2022-02-08', 'grtt', 'Buddha', '002', '005', 'grtt', 'Belum Kawin', 'SLTP/Sederajat', 1, 1645324757, 1645324757),
(5, 'test3', 'Perempuan', '7894561231234569', '1234567897894565', '2022-02-17', 'grttt', 'Hindu', '002', '008', 'asdasd', 'Belum Kawin', 'TamatSD', 6, 1645325269, 1645325269),
(6, 'asd', 'Laki-laki', '1111111111111111', '1111111111111111', '2022-02-01', 'asd', 'Islam', '001', '001', 'asd', 'Belum Kawin', 'StrataI', 5, 1645335067, 1645335067);

-- --------------------------------------------------------

--
-- Table structure for table `penghargaan`
--

CREATE TABLE `penghargaan` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  `info` text DEFAULT NULL,
  `date_created` int(11) DEFAULT NULL,
  `date_modify` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `penghargaan`
--

INSERT INTO `penghargaan` (`id`, `nama`, `gambar`, `info`, `date_created`, `date_modify`) VALUES
(2, 'Piagram Penghargaan', 'peng1.jpg', '<p class=\"card-text\" style=\"line-height: 1.75; color: rgb(33, 37, 41); font-family: \"Roboto Slab\", -apple-system, BlinkMacSystemFont, \"Segoe UI\", Roboto, \"Helvetica Neue\", Arial, sans-serif, \"Apple Color Emoji\", \"Segoe UI Emoji\", \"Segoe UI Symbol\", \"Noto Color Emoji\"; text-align: -webkit-center;\"><span style=\"font-weight: bolder;\">DIAGRAM PENGHARGAAN</span></p><p style=\"line-height: 1.75; color: rgb(33, 37, 41); font-family: \"Roboto Slab\", -apple-system, BlinkMacSystemFont, \"Segoe UI\", Roboto, \"Helvetica Neue\", Arial, sans-serif, \"Apple Color Emoji\", \"Segoe UI Emoji\", \"Segoe UI Symbol\", \"Noto Color Emoji\"; text-align: -webkit-center;\">Ucapan Terimakasih Dari Universitas Garut (UNIGA)</p><p style=\"line-height: 1.75; color: rgb(33, 37, 41); font-family: \"Roboto Slab\", -apple-system, BlinkMacSystemFont, \"Segoe UI\", Roboto, \"Helvetica Neue\", Arial, sans-serif, \"Apple Color Emoji\", \"Segoe UI Emoji\", \"Segoe UI Symbol\", \"Noto Color Emoji\"; text-align: -webkit-center;\">Dalam pelaksanaan New Kuliah Keja Nyata (KKN) Tematik Covid-19 Tahun 2020</p><p style=\"line-height: 1.75; color: rgb(33, 37, 41); font-family: \"Roboto Slab\", -apple-system, BlinkMacSystemFont, \"Segoe UI\", Roboto, \"Helvetica Neue\", Arial, sans-serif, \"Apple Color Emoji\", \"Segoe UI Emoji\", \"Segoe UI Symbol\", \"Noto Color Emoji\"; text-align: -webkit-center;\"><span style=\"font-weight: bolder;\">Dengan Tema</span></p><p style=\"line-height: 1.75; color: rgb(33, 37, 41); font-family: \"Roboto Slab\", -apple-system, BlinkMacSystemFont, \"Segoe UI\", Roboto, \"Helvetica Neue\", Arial, sans-serif, \"Apple Color Emoji\", \"Segoe UI Emoji\", \"Segoe UI Symbol\", \"Noto Color Emoji\"; text-align: -webkit-center;\">Melalui New KKN Tematik Covid-19 Tahun 2020 Kita Tingkatan Kepedulian, Kesadaran Dan Ketahanan Masyarakat Menghadapi Covid-19 Dalam Upaya Mewujudkan Masyarakat Sehat, Maju Dan Sejahtera</p>', 1641656094, 1644837568),
(3, 'qweqwe', 'Screenshot_(2).png', '<p>qweqwe</p>', 1645300717, 1645300717),
(4, 'qweqweasdas', 'Screenshot_(4).png', '<p>12312312</p>', 1645300726, 1645300726);

-- --------------------------------------------------------

--
-- Table structure for table `perangkat_desa`
--

CREATE TABLE `perangkat_desa` (
  `id` int(11) NOT NULL,
  `jabatan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `perangkat_desa`
--

INSERT INTO `perangkat_desa` (`id`, `jabatan`) VALUES
(1, 'Kepala Desa');

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE `profile` (
  `id` int(11) NOT NULL,
  `visi` text DEFAULT NULL,
  `misi` text DEFAULT NULL,
  `tujuan` text DEFAULT NULL,
  `sejarah` text DEFAULT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  `video` varchar(255) DEFAULT NULL,
  `date_modify` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` (`id`, `visi`, `misi`, `tujuan`, `sejarah`, `gambar`, `video`, `date_modify`) VALUES
(1, '<p class=\"MsoNormal\" style=\"line-height:115%\"><span style=\"font-size: 12pt; line-height: 115%; font-family: \"Open Sans\", sans-serif; color: black; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">Terwujudnya kelurahan jayawaras yang nyaman, beriman, sejahtera, sumber\r\ndaya manusia yang berkualitas serta memberikan pelayanan publik yang optimal.</span><o:p></o:p></p>', '<p class=\"open-sans-font\" style=\"margin: 0in 0in 0.0001pt 22.5pt; text-indent: -0.25in; line-height: 115%; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><!--[if !supportLists]--><span style=\"font-family:&quot;Open Sans&quot;,sans-serif;mso-fareast-font-family:&quot;Open Sans&quot;;\r\ncolor:black\">1.<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n</span></span><!--[endif]--><span style=\"font-family:&quot;Open Sans&quot;,sans-serif;\r\ncolor:black\">Meningkatkan kemampuan administrasi dalam pelayanan masyarakat<o:p></o:p></span></p><p class=\"open-sans-font\" style=\"margin: 0in 0in 0.0001pt 22.5pt; text-indent: -0.25in; line-height: 115%; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; padding-top: 0.5rem !important;\"><!--[if !supportLists]--><span style=\"font-family:&quot;Open Sans&quot;,sans-serif;\r\nmso-fareast-font-family:&quot;Open Sans&quot;;color:black\">2.<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><!--[endif]--><span style=\"font-family:&quot;Open Sans&quot;,sans-serif;color:black\">Membangun lingkungan dan\r\nmasyarakat kelurahan jayawaras yang beriman, nyaman dan sejahtera.<o:p></o:p></span></p><p class=\"open-sans-font\" style=\"margin: 0in 0in 0.0001pt 0.5in; text-indent: -0.25in; line-height: 115%; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">\r\n\r\n\r\n\r\n</p><p class=\"open-sans-font\" style=\"margin: 0in 0in 0.0001pt 22.5pt; text-indent: -0.25in; line-height: 115%; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; padding-top: 0.5rem !important;\"><!--[if !supportLists]--><span style=\"font-family:&quot;Open Sans&quot;,sans-serif;\r\nmso-fareast-font-family:&quot;Open Sans&quot;;color:black\">3.<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><!--[endif]--><span style=\"font-family:&quot;Open Sans&quot;,sans-serif;color:black\">Memberdayakan potensi\r\nmasyarakat dengan pendekatan kearifan lokal diwilayah kelurahan jayawaras.<o:p></o:p></span></p>', '<p class=\"open-sans-font\" style=\"margin: 0in 0in 0.0001pt 0.25in; text-indent: -0.25in; line-height: 115%; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><!--[if !supportLists]--><span style=\"font-family:&quot;Open Sans&quot;,sans-serif;mso-fareast-font-family:&quot;Open Sans&quot;;\r\ncolor:black\">1.<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n</span></span><!--[endif]--><span style=\"font-family:&quot;Open Sans&quot;,sans-serif;\r\ncolor:black\">Untuk membedakan gambaran potensi yang dimiliki kelurahan\r\njayawaras baik dari sumber daya alam maupun sumber daya manusia.<o:p></o:p></span></p><p class=\"open-sans-font\" style=\"margin: 0in 0in 0.0001pt 0.25in; text-indent: -0.25in; line-height: 115%; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; padding-top: 0.5rem !important;\"><!--[if !supportLists]--><span style=\"font-family:&quot;Open Sans&quot;,sans-serif;\r\nmso-fareast-font-family:&quot;Open Sans&quot;;color:black\">2.<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><!--[endif]--><span style=\"font-family:&quot;Open Sans&quot;,sans-serif;color:black\">Memberikan gambaran yang\r\njelas mengenai hasil pelaksanaan kegiatan pemerintah, pembangunan,\r\nkemasyarakatan dan pelayanan publik yang telah di laksanakan di kelurahan\r\njayawaras.<o:p></o:p></span></p><p class=\"open-sans-font\" style=\"margin: 0in 0in 0.0001pt 0.25in; text-indent: -0.25in; line-height: 115%; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; padding-top: 0.5rem !important;\"><!--[if !supportLists]--><span style=\"font-family:&quot;Open Sans&quot;,sans-serif;\r\nmso-fareast-font-family:&quot;Open Sans&quot;;color:black\">3.<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><!--[endif]--><span style=\"font-family:&quot;Open Sans&quot;,sans-serif;color:black\">Sebagai bahan evaluasi\r\nbagi ti evaluasi perkembangan kelurahan jayawaras.<o:p></o:p></span></p><p class=\"open-sans-font\" style=\"margin: 0in 0in 0.0001pt 0.5in; text-indent: -0.25in; line-height: 115%; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">\r\n\r\n\r\n\r\n\r\n\r\n</p><p class=\"open-sans-font\" style=\"margin: 0in 0in 0.0001pt 0.25in; text-indent: -0.25in; line-height: 115%; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; padding-top: 0.5rem !important;\"><!--[if !supportLists]--><span style=\"font-family:&quot;Open Sans&quot;,sans-serif;\r\nmso-fareast-font-family:&quot;Open Sans&quot;;color:black\">4.<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><!--[endif]--><span style=\"font-family:&quot;Open Sans&quot;,sans-serif;color:black\">Dengan ada nya website\r\nini semoga bisa membantu masyarakat/penduduk jayawaras menjadi desa digital<o:p></o:p></span></p>', '<p class=\"open-sans-font\" style=\"margin: 0in 0in 0.0001pt; text-indent: 0.25in; line-height: 115%; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"font-family:\"Open Sans\",sans-serif;\r\ncolor:black\">Jayawaras berasal dari pemekaran Desa Sukalilah pada tahun 1980,\r\ndan pernah dipimpin oleh 6 Kepala Desa dari tahun 1980 s.d 2004 :<o:p></o:p></span></p><p style=\"margin: 0in 0in 0.0001pt; text-indent: 0.25in; line-height: 115%; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"font-family:\"Open Sans\",sans-serif;color:black\">Pada\r\nTahun 2004 Desa Sukagalih di ubah menjadi Kelurahan Jayawaras dan dipimpin oleh\r\nLurah, antara lain :<o:p></o:p></span></p><p style=\"margin: 0in 0in 0.0001pt 0.5in; text-indent: -0.25in; line-height: 115%; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><!--[if !supportLists]--><span style=\"font-family:\"Open Sans\",sans-serif;\r\nmso-fareast-font-family:\"Open Sans\";color:black\">1.<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \"Times New Roman\";\">      </span></span><!--[endif]--><span style=\"font-family:\"Open Sans\",sans-serif;color:black\">Drs. Teten Sundara<o:p></o:p></span></p><p style=\"margin: 0in 0in 0.0001pt 0.5in; text-indent: -0.25in; line-height: 115%; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><!--[if !supportLists]--><span style=\"font-family:\"Open Sans\",sans-serif;\r\nmso-fareast-font-family:\"Open Sans\";color:black\">2.<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \"Times New Roman\";\">      </span></span><!--[endif]--><span style=\"font-family:\"Open Sans\",sans-serif;color:black\">Asep Sopandi<o:p></o:p></span></p><p style=\"margin: 0in 0in 0.0001pt 0.5in; text-indent: -0.25in; line-height: 115%; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><!--[if !supportLists]--><span style=\"font-family:\"Open Sans\",sans-serif;\r\nmso-fareast-font-family:\"Open Sans\";color:black\">3.<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \"Times New Roman\";\">      </span></span><!--[endif]--><span style=\"font-family:\"Open Sans\",sans-serif;color:black\">Syarif Husain Hidayat<o:p></o:p></span></p><p style=\"margin: 0in 0in 0.0001pt 0.5in; text-indent: -0.25in; line-height: 115%; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><!--[if !supportLists]--><span style=\"font-family:\"Open Sans\",sans-serif;\r\nmso-fareast-font-family:\"Open Sans\";color:black\">4.<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \"Times New Roman\";\">      </span></span><!--[endif]--><span style=\"font-family:\"Open Sans\",sans-serif;color:black\">Mamat Ganjar, SE<o:p></o:p></span></p><p style=\"margin: 0in 0in 0.0001pt 0.5in; text-indent: -0.25in; line-height: 115%; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><!--[if !supportLists]--><span style=\"font-family:\"Open Sans\",sans-serif;\r\nmso-fareast-font-family:\"Open Sans\";color:black\">5.<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \"Times New Roman\";\">      </span></span><!--[endif]--><span style=\"font-family:\"Open Sans\",sans-serif;color:black\">Tatang<o:p></o:p></span></p><p>\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n</p><p style=\"margin: 0in 0in 0.0001pt 0.5in; text-indent: -0.25in; line-height: 115%; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><!--[if !supportLists]--><span style=\"font-family:\"Open Sans\",sans-serif;\r\nmso-fareast-font-family:\"Open Sans\";color:black\">6.<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \"Times New Roman\";\">      </span></span><!--[endif]--><span style=\"font-family:\"Open Sans\",sans-serif;color:black\">Agus Kusnadi, SE<o:p></o:p></span></p>', 'old-books-436498_1920.jpg', 'vidio.mp4', 1644463088);

-- --------------------------------------------------------

--
-- Table structure for table `sambutan`
--

CREATE TABLE `sambutan` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `jabatan` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `judul` varchar(255) DEFAULT NULL,
  `sambutan` text DEFAULT NULL,
  `date_created` int(11) DEFAULT NULL,
  `date_modify` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sambutan`
--

INSERT INTO `sambutan` (`id`, `nama`, `jabatan`, `photo`, `judul`, `sambutan`, `date_created`, `date_modify`) VALUES
(1, 'Agus Kusnadi, SE', 'Kepala Desa', 'lur.png', 'Sambutan Kepala Desa', '<p class=\"MsoNormal\" style=\"text-align: justify; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"font-size:\r\n12.0pt;font-family:\"Open Sans\",sans-serif;mso-fareast-font-family:\"Times New Roman\";\r\ncolor:black;mso-color-alt:windowtext\">Assalamu\'alaikum warahmatullahi\r\nwabarakatuh.</span><span style=\"font-size:12.0pt;font-family:\"Open Sans\",sans-serif;\r\nmso-fareast-font-family:\"Times New Roman\"\"><o:p></o:p></span></p><p class=\"MsoNormal\" style=\"text-align: justify; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"font-size:\r\n12.0pt;font-family:\"Open Sans\",sans-serif;mso-fareast-font-family:\"Times New Roman\";\r\ncolor:black;mso-color-alt:windowtext\">      Kepada\r\nmasyarakat Desa waras yang saya Cintai. Pada kesempatan yang berbahagia ini,\r\nkiranya tiada kata - kata yang patut saya ucapkan terlebih dahulu melainkan\r\npuji syukur yang sedalam - dalamnya, atas rahmat dan karunia Allah SWT sehingga\r\npembuatan website Desa jayawaras dapat terlaksana dengan baik.</span><span style=\"font-size:12.0pt;font-family:\"Open Sans\",sans-serif;mso-fareast-font-family:\r\n\"Times New Roman\"\"><o:p></o:p></span></p><p class=\"MsoNormal\" style=\"text-align: justify; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"font-size:12.0pt;font-family:\"Open Sans\",sans-serif;mso-fareast-font-family:\r\n\"Times New Roman\";color:black;mso-color-alt:windowtext\">      Saya sebagai Kepala Desa Ngancar di sini tentu merasa bahagia\r\ndan berterima kasih atas dukungan dari semua pihak, terutama dari Perangkat\r\nDesa jayawaras yang telah berpartisipasi dalam pembuatan website ini semoga\r\nbermanfaat. Tentu saja sebagai Kepala Desa jayawaras, saya mengajak kepada\r\nmasyarakat Desa jayawaras untuk ikut pula berpartisipasi menyumbangkan ide ,\r\nkreasi dan informasinya agar dapatnya website ini menarik minat pembaca dan\r\nmenunjang kami memperkenalkan potensi - potensi yang ada di Desa jayawaras\r\nkepada daerah lain.</span><span style=\"font-size:12.0pt;font-family:\"Open Sans\",sans-serif;\r\nmso-fareast-font-family:\"Times New Roman\"\"><o:p></o:p></span></p><p class=\"MsoNormal\" style=\"text-align: justify; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"font-size:12.0pt;font-family:\"Open Sans\",sans-serif;mso-fareast-font-family:\r\n\"Times New Roman\";color:black;mso-color-alt:windowtext\">      Akhirnya, kepada semua pihak yang terlibat, kami sampaikan\r\nterima kasih. Semoga kerjasama kita membuahkan hasil yang baik demi kemajuan\r\nDesa jayawaras.</span><span style=\"font-size:12.0pt;font-family:\"Open Sans\",sans-serif;\r\nmso-fareast-font-family:\"Times New Roman\"\"><o:p></o:p></span></p><p class=\"MsoNormal\" style=\"text-align: justify; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"font-size:12.0pt;font-family:\"Open Sans\",sans-serif;mso-fareast-font-family:\r\n\"Times New Roman\";color:black;mso-color-alt:windowtext\">      Saran dan kritik, kami haraokan dari semua pihak untuk\r\npenyempurnaan website desa ini lebih lanjut. Semoga website ini dapat\r\nbermanfaat bagi semua pihak dan kami ucapkan \"Selamat Datang di Website\r\nDesa Kami\".</span><span style=\"font-size:12.0pt;font-family:\"Open Sans\",sans-serif;\r\nmso-fareast-font-family:\"Times New Roman\"\"><o:p></o:p></span></p><p class=\"MsoNormal\" style=\"text-align: justify; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"font-size:12.0pt;font-family:\"Open Sans\",sans-serif;mso-fareast-font-family:\r\n\"Times New Roman\";color:black;mso-color-alt:windowtext\">      Demikian, sambutan yang perlu saya sampaikan. Saya selaku\r\nKepala Desa jayawaras berterima kasih atas segala perhatiannya dan mohon maaf\r\natas segala kelebihan dan kekurangan.</span><span style=\"font-size:12.0pt;\r\nfont-family:\"Open Sans\",sans-serif;mso-fareast-font-family:\"Times New Roman\"\"><o:p></o:p></span></p><p class=\"MsoNormal\">\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n</p><p class=\"MsoNormal\" align=\"right\" style=\"text-align: right; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"font-size:12.0pt;font-family:\"Open Sans\",sans-serif;mso-fareast-font-family:\r\n\"Times New Roman\";color:black;mso-color-alt:windowtext\">wassalamu\'alaikum\r\nwarahmatullahi wabarakatuh.</span><span style=\"font-size:12.0pt;font-family:\r\n\"Open Sans\",sans-serif;mso-fareast-font-family:\"Times New Roman\"\"><o:p></o:p></span></p>', 1638294590, 1644644649);

-- --------------------------------------------------------

--
-- Table structure for table `sarana`
--

CREATE TABLE `sarana` (
  `id` int(11) NOT NULL,
  `nama_spesifik` varchar(255) DEFAULT NULL,
  `kategori_id` int(11) DEFAULT NULL,
  `modif_by` varchar(255) DEFAULT NULL,
  `date_created` int(11) DEFAULT NULL,
  `date_modify` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sarana`
--

INSERT INTO `sarana` (`id`, `nama_spesifik`, `kategori_id`, `modif_by`, `date_created`, `date_modify`) VALUES
(1, 'SMKN 1 GARUT', 1, 'neko', 1644815268, 1644815268),
(2, 'Suka Maju', 1, 'neko', 1645313906, 1645313906),
(3, 'Puskesmas Indo', 6, 'neko', 1645329248, 1645329248);

-- --------------------------------------------------------

--
-- Table structure for table `slide`
--

CREATE TABLE `slide` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `date_created` int(11) DEFAULT NULL,
  `date_modif` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `slide`
--

INSERT INTO `slide` (`id`, `name`, `image`, `date_created`, `date_modif`) VALUES
(1, 'Selamat Datang', 'header23.jpg', 1638283166, 1644465355),
(2, 'Header', '6.jpg', 1644465416, 1644465427),
(3, 'Header', '7.jpg', 1644483853, 1644483853),
(4, 'kantor', '2.jpg', 1644492748, 1644492748),
(5, 'resepsionis', 'header23.jpg', 1645066712, 1645066748);

-- --------------------------------------------------------

--
-- Table structure for table `struktur`
--

CREATE TABLE `struktur` (
  `id` int(11) NOT NULL,
  `gambar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `struktur`
--

INSERT INTO `struktur` (`id`, `gambar`) VALUES
(1, 'struk.png');

-- --------------------------------------------------------

--
-- Table structure for table `surat`
--

CREATE TABLE `surat` (
  `id` int(11) NOT NULL,
  `surat` varchar(255) DEFAULT NULL,
  `no_kk` char(16) DEFAULT NULL,
  `nik` char(16) DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `tgl_pengambilan` date DEFAULT NULL,
  `rt` varchar(255) DEFAULT NULL,
  `rw` varchar(255) DEFAULT NULL,
  `catatan` text DEFAULT NULL,
  `pesan` text DEFAULT NULL,
  `ktp` varchar(50) DEFAULT NULL,
  `kk` varchar(50) DEFAULT NULL,
  `surat_pengantar` varchar(50) DEFAULT NULL,
  `pengedit` varchar(50) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `date_created` int(11) DEFAULT NULL,
  `date_modify` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `surat`
--

INSERT INTO `surat` (`id`, `surat`, `no_kk`, `nik`, `nama`, `tgl_lahir`, `tgl_pengambilan`, `rt`, `rw`, `catatan`, `pesan`, `ktp`, `kk`, `surat_pengantar`, `pengedit`, `status`, `date_created`, `date_modify`) VALUES
(1, 'SMKN 1 GARUT', '1234567812345678', '1234567812345678', 'Agung Fathul Muhtadin', '2022-02-17', '2022-02-16', '004', '001', 'sdasdasdasdasdas', 'ayo sini ambil dah jadi asu', 'ec6d744c3872d0eecb3fb553a135b3b1.pdf', '00df3f7fa9a7e66ac7e70b12a88bad63.pdf', '0f4faefad83a99a43a2314382ecfb147.pdf', 'neko', 1, 1645125762, 1645343396),
(2, 'Surat Keterangan Catatan Kepolisian', '1234567812345678', '1234567812345678', 'Agung Fathul Muhtadin', '2022-02-17', '2022-02-17', '001', '004', '', 'sdasd', 'f34ecdeaa619cddf7a1f8e64591d637d.pdf', 'f1caa2b51abeba933e2de393dfcc84b9.pdf', 'eaea1b69e9dfd8f2dce1184709f7adb1.pdf', 'neko', 1, 1645173516, 1645342910),
(3, 'Surat Keterangan Catatan Kepolisian', '1234567812345678', '1234567812345678', 'Agung Fathul Muhtadin', '2022-02-17', '2022-02-16', '001', '004', 'hkjashdjakbdwhadba', 'asu\r\n', '9dd34c90852c13ec863a2a8ed038a4aa.pdf', 'd6609e4954ff62bf297bd083eaf51976.pdf', '6eae9eca494c5ab320a1c4a40be6ad91.pdf', 'neko', 1, 1645182674, 1645343131),
(4, 'Surat Izin Keramaian', '1111111111111111', '1111111111111111', 'asd', '2022-02-01', '2022-02-24', '001', '001', '', 'asd', '51ecb31bc8061698e810fedb4665eaf3.pdf', 'b5aad1e6a3f82e8349eec8575550164e.pdf', 'd0d7c53e2a002d68d9f5e0900b2d0563.pdf', 'neko', 0, 1645335108, 1645343410);

-- --------------------------------------------------------

--
-- Table structure for table `usaha`
--

CREATE TABLE `usaha` (
  `id` int(11) NOT NULL,
  `nama_toko` varchar(255) DEFAULT '',
  `gambar` varchar(255) DEFAULT '',
  `jenis_toko` varchar(255) DEFAULT '',
  `hari` varchar(50) DEFAULT NULL,
  `buka` time DEFAULT NULL,
  `tutup` time DEFAULT NULL,
  `deskripsi` text DEFAULT '',
  `alamat` varchar(255) DEFAULT NULL,
  `kontak` varchar(255) DEFAULT '',
  `aktif` int(11) DEFAULT NULL,
  `date_created` int(11) DEFAULT NULL,
  `date_modify` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `usaha`
--

INSERT INTO `usaha` (`id`, `nama_toko`, `gambar`, `jenis_toko`, `hari`, `buka`, `tutup`, `deskripsi`, `alamat`, `kontak`, `aktif`, `date_created`, `date_modify`) VALUES
(3, 'ABAH', 'Neko-cry.gif', 'Fashion', 'Senin-Jumát', '09:00:00', '21:00:00', '<p><b>menu</b></p><p>alasdaksldja                         6k</p><p>askdakljdlkasj                      7k</p>', 'GMI 1 B.23', '089662362513', 1, 1645338776, 1645338776),
(8, 'Anjim', '938ef8320f6a2f7de943d3905379384d.PNG', 'Sembako', 'Sabtu-Kamis', '16:27:00', '04:27:00', '<p>hmmmmmmmmmmmmmmmmmmmmmmmmmmmmm apa ya</p>', 'beruang', '089564821357', 1, 1645342130, 1645342130);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `password` varchar(256) DEFAULT NULL,
  `id_type` int(11) DEFAULT NULL,
  `active` int(1) DEFAULT 0,
  `date_created` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `name`, `username`, `image`, `password`, `id_type`, `active`, `date_created`) VALUES
(1, 'neko', 'NekoMorie', 'cat-4977436_1920.jpg', '$2y$10$G7Vh.u1a6.lnxtijzRT5nevEbxKXvUQn/ozbR.G9RUp/cUBr3oTd2', 1, 1, 1638277039),
(2, 'hanan', 'vinan', 'default.jpg', '$2y$10$bVDJpnFT83OYjdnqrP0SFOGHuXcVN7kHy73FdLaRGo2egCCLKXolS', 2, 1, 1638322642),
(5, 'Admin', 'admin', 'default.jpg', '$2y$10$Ti8Mjrj6iQSAiWSP03Ki7.B6LFtrvzzK.4.V.m2jWtBd7Txzxdm3m', 2, 1, 1644381587),
(6, 'Rakandiya', 'rakan', 'default.jpg', '$2y$10$.j5j6KTNP5IovB8Pwddd7uSLBm.0YalhmrmZhD3kbKFLoUFoa.xkC', 1, 1, 1644645560);

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `id` int(11) NOT NULL,
  `id_type` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`id`, `id_type`) VALUES
(1, 'admin'),
(2, 'user');

-- --------------------------------------------------------

--
-- Table structure for table `wisata`
--

CREATE TABLE `wisata` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `penulis` varchar(255) DEFAULT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  `konten` text DEFAULT NULL,
  `date_created` int(11) DEFAULT NULL,
  `date_modify` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `wisata`
--

INSERT INTO `wisata` (`id`, `nama`, `penulis`, `gambar`, `konten`, `date_created`, `date_modify`) VALUES
(1, 'Karacak Valley', 'neko', 'karacak-valley-653x393.jpg', '<p style=\"margin-top: 0in; text-align: justify; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"font-family:&quot;Open Sans&quot;,sans-serif;color:black;mso-color-alt:windowtext;\r\nletter-spacing:.4pt\">Bagi Moms dan keluarga yang&nbsp;<a href=\"https://www.orami.co.id/magazine/tempat-camping-di-bandung/\"><span style=\"color: black;\">suka berkemah</span></a>&nbsp;atau&nbsp;<i>camping</i>, Karacak Valley dapat menjadi lokasi\r\npilihan yang menarik. Berkonsep perbukitan dan memiliki cuaca yang sejuk,\r\nlokasi ini akan cocok untuk bermalam di tenda.</span><span style=\"font-family:\r\n&quot;Open Sans&quot;,sans-serif;letter-spacing:.4pt\"><o:p></o:p></span></p><p style=\"margin-top: 0in; text-align: justify; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">\r\n\r\n</p><p style=\"margin-top: 0in; text-align: justify; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"font-family:&quot;Open Sans&quot;,sans-serif;color:black;mso-color-alt:\r\nwindowtext;letter-spacing:.4pt\">Saat malam, terdapat pemandangan kota yang luar\r\nbiasa yang bisa dinikmati sambil makan malam di dekat tenda. Moms juga dapat\r\nmelihat indahnya matahari terbit atau terbenam di lahan yang berlokasi di Jl\r\nKaracak Valley Margawati, Sukanegla, Garut ini.</span><span style=\"font-family:\r\n&quot;Open Sans&quot;,sans-serif;letter-spacing:.4pt\"><o:p></o:p></span></p>', 1644499498, 1644499746),
(2, '123', 'neko', '5-gambar-lucu.jpg', '<p>qweqweqwe</p>', 1645299764, 1645299764),
(3, '1qweqwe', 'neko', 'jamrud.jpg', '<p>qwe12312</p>', 1645299774, 1645299774),
(4, 'asdasd', 'neko', 'WIN_20211115_11_41_09_Pro.jpg', '<p>zxczxc</p>', 1645299786, 1645299786),
(5, 'hjkhjk', 'neko', 'WIN_20211115_11_41_09_Pro1.jpg', '<p>qweqw123</p>', 1645299794, 1645299794),
(6, 'ghjghj', 'neko', 'WIN_20211126_09_24_36_Pro.jpg', '<p>qwe5675675</p>', 1645299804, 1645299804),
(7, '1232156', 'neko', 'Screenshot_(1).png', '<p style=\"margin-top: 0in; text-align: justify; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"font-family:&quot;Open Sans&quot;,sans-serif;color:black;mso-color-alt:windowtext;', 1645299824, 1645299824);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `berita`
--
ALTER TABLE `berita`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dokumen`
--
ALTER TABLE `dokumen`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jabatan`
--
ALTER TABLE `jabatan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategori_doc`
--
ALTER TABLE `kategori_doc`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `kategori_sarana`
--
ALTER TABLE `kategori_sarana`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lembaga_desa`
--
ALTER TABLE `lembaga_desa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pekerjaan`
--
ALTER TABLE `pekerjaan`
  ADD PRIMARY KEY (`id_pekerjaan`);

--
-- Indexes for table `penduduk`
--
ALTER TABLE `penduduk`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `penghargaan`
--
ALTER TABLE `penghargaan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `perangkat_desa`
--
ALTER TABLE `perangkat_desa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sambutan`
--
ALTER TABLE `sambutan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sarana`
--
ALTER TABLE `sarana`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `slide`
--
ALTER TABLE `slide`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `struktur`
--
ALTER TABLE `struktur`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `surat`
--
ALTER TABLE `surat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usaha`
--
ALTER TABLE `usaha`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wisata`
--
ALTER TABLE `wisata`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `berita`
--
ALTER TABLE `berita`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `dokumen`
--
ALTER TABLE `dokumen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `jabatan`
--
ALTER TABLE `jabatan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `karyawan`
--
ALTER TABLE `karyawan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `kategori_doc`
--
ALTER TABLE `kategori_doc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `kategori_sarana`
--
ALTER TABLE `kategori_sarana`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `lembaga_desa`
--
ALTER TABLE `lembaga_desa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pekerjaan`
--
ALTER TABLE `pekerjaan`
  MODIFY `id_pekerjaan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `penduduk`
--
ALTER TABLE `penduduk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `penghargaan`
--
ALTER TABLE `penghargaan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `perangkat_desa`
--
ALTER TABLE `perangkat_desa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `profile`
--
ALTER TABLE `profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sambutan`
--
ALTER TABLE `sambutan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sarana`
--
ALTER TABLE `sarana`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `slide`
--
ALTER TABLE `slide`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `struktur`
--
ALTER TABLE `struktur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `surat`
--
ALTER TABLE `surat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `usaha`
--
ALTER TABLE `usaha`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `wisata`
--
ALTER TABLE `wisata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
