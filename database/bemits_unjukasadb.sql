-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 06, 2022 at 09:18 PM
-- Server version: 5.6.51
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bemits_unjukasadb`
--

-- --------------------------------------------------------

--
-- Table structure for table `t_album`
--

CREATE TABLE `t_album` (
  `id` int(5) NOT NULL,
  `title` varchar(255) NOT NULL,
  `seotitle` varchar(255) NOT NULL,
  `active` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `t_category`
--

CREATE TABLE `t_category` (
  `id` int(5) NOT NULL,
  `id_parent` int(5) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `seotitle` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `picture` text NOT NULL,
  `active` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_category`
--

INSERT INTO `t_category` (`id`, `id_parent`, `title`, `seotitle`, `description`, `picture`, `active`) VALUES
(1, 0, 'Uncategory', 'uncategory', 'Kategory tidak ditentukan', '', 'Y'),
(2, 0, 'Kabar dari BEM ITS', 'kabar-dari-bem-its', 'Kabar terkini serta artikel menarik dari BEM ITS', '', 'Y'),
(3, 0, 'Dari KM ITS Untuk Indonesia', 'dari-km-its-untuk-indonesia', 'Integrasi publikasi hasil kajian yang disusun oleh organisasi mahasiswa di KM ITS.', '', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `t_comment`
--

CREATE TABLE `t_comment` (
  `id` int(5) NOT NULL,
  `id_user` int(5) NOT NULL DEFAULT '0',
  `id_post` int(5) NOT NULL DEFAULT '0',
  `parent` int(5) NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `comment` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip` varchar(30) NOT NULL DEFAULT '',
  `active` enum('N','Y','X') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `t_component`
--

CREATE TABLE `t_component` (
  `id` int(5) NOT NULL,
  `name` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `table_name` varchar(100) NOT NULL,
  `status` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `t_gallery`
--

CREATE TABLE `t_gallery` (
  `id` int(5) NOT NULL,
  `id_album` int(5) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `seotitle` varchar(255) NOT NULL,
  `picture` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `t_mail`
--

CREATE TABLE `t_mail` (
  `id` int(5) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip` varchar(100) NOT NULL,
  `active` enum('N','Y') NOT NULL DEFAULT 'N',
  `box` enum('in','out') NOT NULL DEFAULT 'in'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `t_menu`
--

CREATE TABLE `t_menu` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `parent_id` int(5) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `class` varchar(255) NOT NULL DEFAULT '',
  `position` int(10) NOT NULL,
  `group_id` tinyint(10) UNSIGNED NOT NULL DEFAULT '1',
  `active` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_menu`
--

INSERT INTO `t_menu` (`id`, `parent_id`, `title`, `url`, `class`, `position`, `group_id`, `active`) VALUES
(1, 0, 'DASHBOARD', '#', 'header', 1, 1, 'Y'),
(2, 0, 'Dashboard', 'dashboard', 'home', 1, 1, 'Y'),
(3, 0, 'CONTENT', '#', 'header', 1, 1, 'Y'),
(4, 0, 'Post', 'post', 'book-open', 1, 1, 'Y'),
(5, 0, 'Category', 'category', 'folder-plus', 1, 1, 'Y'),
(6, 0, 'Tag', 'tag', 'tag', 1, 1, 'Y'),
(7, 0, 'Comment', 'comment', 'message-square', 1, 1, 'Y'),
(8, 0, 'Pages', 'pages', 'file-text', 1, 1, 'Y'),
(9, 0, 'MEDIA', '#', 'header', 1, 1, 'Y'),
(10, 0, 'Gallery', 'gallery', 'image', 1, 1, 'Y'),
(11, 0, 'File Manager', 'filemanager', 'grid', 1, 1, 'Y'),
(12, 0, 'CONTACT', '#', 'header', 1, 1, 'Y'),
(13, 0, 'Mail', 'mail', 'mail', 1, 1, 'Y'),
(14, 0, 'USERS', '#', 'header', 1, 1, 'Y'),
(15, 0, 'User', 'user', 'users', 1, 1, 'Y'),
(16, 0, 'Permissions', 'permissions', 'shield', 1, 1, 'Y'),
(17, 0, 'MODULE', '#', 'header', 1, 1, 'Y'),
(18, 0, 'Component', 'component', 'box', 1, 1, 'Y'),
(19, 0, 'CoGen', 'cogen', 'coffee', 1, 1, 'Y'),
(20, 0, 'APPERANCE', '#', 'header', 1, 1, 'Y'),
(21, 0, 'Theme', 'theme', 'aperture', 1, 1, 'Y'),
(22, 0, 'Menu Manager', 'menumanager/?', 'list', 1, 1, 'Y'),
(23, 0, 'Setting', 'setting', 'settings', 1, 1, 'Y'),
(24, 0, 'Home', '/', '', 1, 2, 'Y'),
(28, 0, 'Gallery', 'gallery', '', 1, 2, 'Y'),
(29, 0, 'Index Post', 'indexpost', '', 1, 2, 'Y'),
(30, 0, 'RSS', 'rss', '', 1, 2, 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `t_menu_group`
--

CREATE TABLE `t_menu_group` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_menu_group`
--

INSERT INTO `t_menu_group` (`id`, `title`) VALUES
(1, 'Backend'),
(2, 'Web');

-- --------------------------------------------------------

--
-- Table structure for table `t_mod`
--

CREATE TABLE `t_mod` (
  `id` int(5) NOT NULL,
  `mod` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_mod`
--

INSERT INTO `t_mod` (`id`, `mod`) VALUES
(1, 'dashboard'),
(2, 'post'),
(3, 'category'),
(4, 'tag'),
(5, 'comment'),
(6, 'pages'),
(7, 'gallery'),
(8, 'filemanager'),
(9, 'mail'),
(10, 'user'),
(11, 'permissions'),
(12, 'component'),
(14, 'theme'),
(15, 'menumanager'),
(16, 'setting'),
(17, 'profile'),
(18, 'cogen');

-- --------------------------------------------------------

--
-- Table structure for table `t_pages`
--

CREATE TABLE `t_pages` (
  `id` int(5) NOT NULL,
  `title` varchar(255) NOT NULL,
  `seotitle` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `picture` text NOT NULL,
  `active` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_pages`
--

INSERT INTO `t_pages` (`id`, `title`, `seotitle`, `content`, `picture`, `active`) VALUES
(1, 'About Us', 'about-us', '&lt;p style=&quot;text-align: justify;&quot;&gt;CiFIreCMS adalah content management system open source yang di bangun dengan konsep yang menarik dan mudah digunakan. Sangat cocok bagi para developer pemula maupun yang sudah familiar dengan konsep MVC. Meskipun platform CiFireCMS adalah gratis namun tidak kalah dengan platform berbayar lainnya karena dengan dukungan komunitas yang besar maka setiap pengguna pemula maupun advance bisa membangun aplikasi web nya dengan performa premium.&lt;/p&gt;\r\n&lt;p style=&quot;text-align: justify;&quot;&gt;Dengan hadirnya platform CiFireCMS, semoga bisa menjadi solusi bagi anda dalam mengembangkan website.&lt;/p&gt;', 'web.jpg', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `t_post`
--

CREATE TABLE `t_post` (
  `id` int(5) NOT NULL,
  `id_category` int(5) NOT NULL DEFAULT '0',
  `id_user` int(5) NOT NULL DEFAULT '0',
  `tag` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `seotitle` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `datepost` date NOT NULL,
  `timepost` time NOT NULL,
  `picture` text NOT NULL,
  `image_caption` text NOT NULL,
  `hits` int(10) NOT NULL DEFAULT '0',
  `headline` enum('N','Y') NOT NULL DEFAULT 'N',
  `comment` enum('N','Y') NOT NULL DEFAULT 'Y',
  `active` enum('N','Y') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_post`
--

INSERT INTO `t_post` (`id`, `id_category`, `id_user`, `tag`, `title`, `seotitle`, `content`, `datepost`, `timepost`, `picture`, `image_caption`, `hits`, `headline`, `comment`, `active`) VALUES
(1, 2, 1, '', 'Keluhkan Problematika Perkuliahan, BEM ITS Hadirkan “Serap Aspirasi KM ITS”', 'keluhkan-problematika-perkuliahan-bem-its-hadirkan-serap-aspirasi-km-its', '&lt;figure class=&quot;image align-center&quot;&gt;&lt;img src=&quot;https://arek.its.ac.id/bem-its/content/uploads/kabardaribemits/Aspirasi-Rectowriting.jpg?1639536018768&quot; alt=&quot;Tampilan Serap Aspirasi KM ITS, bemits.frill.co&quot; width=&quot;500&quot; height=&quot;331&quot; /&gt;\r\n&lt;figcaption&gt;Tampilan Serap Aspirasi KM ITS, bemits.frill.co&lt;/figcaption&gt;\r\n&lt;/figure&gt;\r\n&lt;p&gt;Badan Eksekutif Mahasiswa Institut Teknologi Sepuluh Nopember (BEM ITS) melakukan pengembangan teknologi digital untuk menyalurkan aspirasi mahasiswa dengan Platform &amp;ldquo;Serap Aspirasi KM ITS&amp;rdquo;. Pengembangan teknologi menerapkan sistem&amp;nbsp;&lt;em&gt;Customer Relationship Management&lt;/em&gt;&amp;nbsp;(CRM). Sistem CRM duterapkan karena BEM ITS lebih mengarah kepada&amp;nbsp;&lt;em&gt;customer oriented&amp;nbsp;&lt;/em&gt;yang transparan dan akses yang mudah bagi mahasiswa untuk menyalurkan aspirasinya.&lt;/p&gt;\r\n&lt;p&gt;Platform Serap Aspirasi mahasiswa ini mulai berjalan sejak Rabu, 6 Januari 2021. Platform tersebut dapat diakses melalui&amp;nbsp;&lt;a href=&quot;https://bemits.frill.co/&quot;&gt;https://bemits.frill.co/&lt;/a&gt;. Platform tersebut diharapkan dapat membuat KM ITS turut ikut berpartisispasi aktif dalam suatu kepengurusan secara sehat demi kemajuan KM ITS. Serta dengan adanya Serap Aspirasi dapat mempermudah&amp;nbsp;&lt;em&gt;controlling&amp;nbsp;&lt;/em&gt;KM ITS terhadap aduan yang disampaikan.&lt;/p&gt;\r\n&lt;p&gt;Melalui serap aspirasi KM ITS, mahasiswa akan mendapatkan kemudahan berupa kemudahan akses dalam beraspirasi, keterbukaan informasi, pelacakan status laporan, dan pengumuman terkait laporan yang telah terselesaikan. Dalam memberikan aspirasi, mahasiswa dapat langsung membuka platform Serap Aspirasi KM ITS. Setelah terbuka dan berada pada beranda platform, mahasiswa dapat langsung mengklik &amp;ldquo;Submit Idea&amp;rdquo;. Pada bagian submit aspirasi, mahasiswa dapat langsung menyampaikan aspirasi. Sebelum mensubmit aspirasi jangan lupa untuk memilih tiga topik yang berkaitan dengan Aspirasi. Lalu, submit aspirasi dan aspirasi akan muncul di beranda platform dan akan segera di proses.&lt;/p&gt;\r\n&lt;p&gt;Aspirasi yang telah di input berdasarkan kategori yang telah dipilih oleh mahasiswa. Kategori yang tersedia dalam platform tersebut dapat berupa advokasi, beasiswa, proker BEM ITS, kebijakan kampus,dll. Dalam platform tersebut &amp;nbsp;tersedia beberapa kategori yang dapat dipilih. Setelah diinput sesuai kategori tim platform akan menjadi PIC yang dapat menghubungkan antara pihat input dan pihat terkait aspirasi. Progress dari aspirasi dapat di follow up dan diupdate melalu platform tersebut.&lt;/p&gt;\r\n&lt;p&gt;&amp;ldquo;Harapan saya untuk mahasiswa KM ITS semua dapat paham dan sadar akan perlunya melihat ke luar, adaptasi dan mengembangkan organisasi kita serta saling mendukung untuk menfaat bersama demi melanjutkan kepengurusan organisasi&amp;rdquo;, Suthan Azhary Menteri Pengembangan Organisasi. (en/komstrat)&amp;nbsp;&lt;/p&gt;', '2021-02-13', '18:01:27', 'kabardaribemits/Aspirasi-Rectowriting.jpg', 'Tampilan Serap Aspirasi KM ITS, bemits.frill.co', 806, 'N', 'Y', 'Y'),
(2, 2, 1, '', 'Guyub KM ITS, Tingkatkan Interaksi di Tengah Kondisi Pandemi', 'guyub-km-its-tingkatkan-interaksi-di-tengah-kondisi-pandemi', '&lt;figure class=&quot;image align-center&quot;&gt;&lt;img src=&quot;https://arek.its.ac.id/bem-its/content/uploads/kabardaribemits/Guyub-KM-ITS-BEMITS.png?1639536175793&quot; alt=&quot;PODCATS pada acara GUYUB KM ITS, youtube.com/bemits&quot; width=&quot;400&quot; height=&quot;225&quot; /&gt;\r\n&lt;figcaption&gt;PODCATS pada acara GUYUB KM ITS, youtube.com/bemits&lt;/figcaption&gt;\r\n&lt;/figure&gt;\r\n&lt;p&gt;Kementerian Dalam Negeri BEM ITS 2020/2021 kembali hadir untuk memfasilitasi teman-teman KM ITS untuk berkumpul dan berinteraksi satu sama lain tanpa memperhatikan warna jaket, lambang himpunan maupun fakultas melalui acara GUYUB ITS 2021.&amp;nbsp;&lt;/p&gt;\r\n&lt;p&gt;Berbeda dari tahun sebelumnya, GUYUB ITS 2021 diselenggarakan secara&amp;nbsp;&lt;em&gt;online&lt;/em&gt;&amp;nbsp;pada tanggal 6-10 Februari 2021. Pada awalnya, panitia tidak terlalu yakin untuk mengadakan acara ini dikarenakan pada tanggal tersebut kegiatan kuliah telah selesai. Hal ini berarti teman-teman KM ITS sudah akan sibuk dengan urusan masing-masing. Tapi ternyata perkiraan ini bertolak belakang dengan apa yang terjadi, justru di hari libur itulah teman-teman KM ITS memerlukan kegiatan, dan hadirlah GUYUB ITS 2021.&amp;nbsp;&lt;/p&gt;\r\n&lt;p&gt;Tahun ini, GUYUB ITS 2021 memiliki dua&amp;nbsp;&lt;em&gt;sub-event&lt;/em&gt;, yaitu&amp;nbsp;&lt;em&gt;Mobile Legends Competition&lt;/em&gt;&amp;nbsp;dan PODCATS (Podjok Cerita Arek ITS). Pada&amp;nbsp;&lt;em&gt;event Mobile Legends Competition&lt;/em&gt;, GUYUB ITS 2021 melakukan kolaborasi dengan ITS MLBBC, yaitu sebuah komunitas pecinta Mobile Legends di lingkungan ITS.&amp;nbsp;&lt;em&gt;Mobile Legends Competition&lt;/em&gt;&amp;nbsp;diikuti oleh perwakilan tim dari seluruh departemen yang ada di ITS dan tercatat terdapat 38 tim yang berpartisipasi di event ini. &amp;ldquo;Kami tidak menyangka antusiasme KM ITS yang sungguh luar biasa untuk ikut meramaikan&amp;nbsp;&lt;em&gt;Mobile Legends Competition&lt;/em&gt;&amp;rdquo; ucap Ketua GUYUB ITS 2021, Rafi Aldi (Papoy).&lt;/p&gt;\r\n&lt;p&gt;Mobile Legends Competition diadakan selama 4 hari dari pukul 08.00-23.30 WIB dan disiarkan langsung di youtube BEM ITS dan ITS MLBBC. Setiap&amp;nbsp;&lt;em&gt;match&lt;/em&gt;&amp;nbsp;menggunakan mode&amp;nbsp;&lt;em&gt;tournament&lt;/em&gt;&amp;nbsp;dan&amp;nbsp;&lt;em&gt;ban&lt;/em&gt;&amp;nbsp;5.&amp;nbsp;&lt;em&gt;Match&lt;/em&gt;&amp;nbsp;penyisihan sampai 16 besar menggunakan&amp;nbsp;&lt;em&gt;best of 1&lt;/em&gt;,&lt;em&gt;&amp;nbsp;match&lt;/em&gt;&amp;nbsp;8 besar sampai 4 besar menggunakan&amp;nbsp;&lt;em&gt;best of 3&lt;/em&gt;, dan&amp;nbsp;&lt;em&gt;final match&lt;/em&gt;&amp;nbsp;menggunakan&amp;nbsp;&lt;em&gt;best of 5&lt;/em&gt;. Juara pertama diraih oleh tim Hadiah Wisuda Acan dari Teknik Mesin, juara kedua diraih oleh tim Electro dari Teknik Elektro, juara ketiga diraih oleh tim Sigmania dari Statistika.&amp;nbsp;&lt;em&gt;Final match Mobile Legends Competition&amp;nbsp;&lt;/em&gt;ditonton secara langsung oleh 350&amp;nbsp;&lt;em&gt;viewers&lt;/em&gt;&amp;nbsp;dan total 3.7k&amp;nbsp;&lt;em&gt;viewers&lt;/em&gt;&amp;nbsp;pada siaran ulangnya (per 13 Februari 2021).&lt;/p&gt;\r\n&lt;figure class=&quot;image align-center&quot;&gt;&lt;img style=&quot;display: block; margin-left: auto; margin-right: auto;&quot; src=&quot;https://arek.its.ac.id/bem-its/content/uploads/kabardaribemits/pemenang-guyub.jpg?1639536346644&quot; alt=&quot;emenang Mobile Legends Competition, instagram.com/guyub_kmits&quot; width=&quot;300&quot; height=&quot;300&quot; /&gt;\r\n&lt;figcaption&gt;Pemenang Mobile Legends Competition, instagram.com/guyub_kmits&lt;/figcaption&gt;\r\n&lt;/figure&gt;\r\n&lt;p&gt;GUYUB ITS 2021 ditutup dengan acara PODCATS, yaitu acara&amp;nbsp;&lt;em&gt;ngobrol&lt;/em&gt;&amp;nbsp;bareng atau&amp;nbsp;&lt;em&gt;chit-chat&lt;/em&gt;&amp;nbsp;bersama dengan Ketua BEM F dan Ketua Tim Formatur yang ada di ITS mengenai eksistensi fakultas. GUYUB ITS 2021 mengemas PODCATS menjadi sebuah&amp;nbsp;&lt;em&gt;talkshow&lt;/em&gt;&amp;nbsp;dengan tema &amp;ldquo;Pandemi dan Organisasi antara Mati Suri dengan Menambah Eksistensi&amp;rdquo;. Panitia GUYUB ITS 2021 mengusung acara ini untuk menjawab keresahan KM ITS di masa pandemi dan meningkatkan&amp;nbsp;&lt;em&gt;awareness&lt;/em&gt;&amp;nbsp;dari KM ITS, serta menyatukan opini agar tercipta KM ITS yang harmonis kedepannya. Di awal acara, disuguhkan sebuah video dokumenter dari para petinggi himpunan untuk KM ITS. Harapannya, agar semua elemen yang terlibat di acara PODCATS ini tahu kondisi dari KM ITS saat ini.&amp;nbsp;&lt;/p&gt;\r\n&lt;p&gt;Dalam acara ini,&amp;nbsp;&lt;em&gt;speaker&lt;/em&gt;&amp;nbsp;menceritakan kondisi fakultas mereka masing-masing sebelum dan sesudah pandemi, tips dan trik agar eksistensi dari tiap kegiatan tetap terjaga, serta pandangan mereka terhadap kondisi KM ITS sekarang. Di akhir acara, terdapat pembacaan pertanyaan dari KM ITS kepada speaker yang sebelumnya telah dihimpun di&amp;nbsp;&lt;em&gt;official account&lt;/em&gt;&amp;nbsp;Instagram BEM ITS (@bem_its) dan GUYUB KM ITS (@guyub_kmits).&amp;nbsp;&lt;/p&gt;\r\n&lt;p&gt;Pada awalnya, panitia GUYUB ITS 2021 tidak terlalu yakin kalau KM ITS akan menunjukan antusiasme yang tinggi untuk meramaikan PODCATS, selain itu beberapa&amp;nbsp;&lt;em&gt;speaker&lt;/em&gt;&amp;nbsp;juga harus mempersiapkan seminar proposal di awal bulan ini. Tapi berkat kegigihan dari panitia, PODCATS berhasil diselenggarakan pada 10 Februari 2021 dan disiarkan langsung di YouTube BEM ITS tanpa kendala. &amp;ldquo;Kerja keras kami terbayarkan dengan antusiasme dari&amp;nbsp;&lt;em&gt;speaker&lt;/em&gt;&amp;nbsp;dan KM ITS tentunya.&amp;rdquo; tutup Papoy. (rara/dagri)&lt;/p&gt;', '2021-02-14', '19:04:24', 'kabardaribemits/Guyub-KM-ITS-BEMITS.png', 'PODCATS pada acara GUYUB KM ITS, youtube.com/bemits', 202, 'N', 'Y', 'Y'),
(3, 2, 1, '', 'Enrichment Program Wadah untuk Meningkatkan Soft Skill Anggota BEM ITS', 'enrichment-program-wadah-untuk-meningkatkan-soft-skill-anggota-bem-its', '&lt;figure class=&quot;image align-center&quot;&gt;&lt;img src=&quot;https://arek.its.ac.id/bem-its/content/uploads/kabardaribemits/Kegiatan-Hari-Pertama-Enrichment-Program.jpg?1639536470928&quot; alt=&quot;Kegiatan Hari Pertama Enrichment Program&quot; width=&quot;500&quot; height=&quot;281&quot; /&gt;\r\n&lt;figcaption&gt;Kegiatan Hari Pertama Enrichment Program&lt;/figcaption&gt;\r\n&lt;/figure&gt;\r\n&lt;p&gt;Badan Eksekutif Mahasiswa ITS kembali melakukan&amp;nbsp;&lt;em&gt;Enrichment Program&lt;/em&gt;&amp;nbsp;untuk anggota yang diselenggarakan oleh Kementerian Manajemen Talenta. Berbeda dengan tahun-tahun sebelumnya, kondisi pandemi membuat agenda ini dilaksanakan secara daring. Kementerian Manajemen Talenta menginisiasi pengembangan baru melalui konsep&amp;nbsp;&lt;em&gt;Continuous Performance Management&lt;/em&gt;, dimana dasar pengembangan bukan hanya berfokus pada kebutuhan organisasi namun juga kebutuhan anggota.&lt;/p&gt;\r\n&lt;p&gt;Tujuan diadakannya kegiatan &amp;ldquo;&lt;em&gt;Enrichment Program&lt;/em&gt;&amp;rdquo; adalah&amp;nbsp;untuk meningkatkan pengetahuan keorganisasian dan kesadaran isu sosial politik serta pengembangan yang didasarkan pada umpan balik anggota. Sebelum pelaksanaan kegiatan, Kementerian Manajemen Talenta membagikan&amp;nbsp;&lt;em&gt;talent review&lt;/em&gt;&amp;nbsp;yang berisi mengenai&amp;nbsp;&lt;em&gt;need improvement&lt;/em&gt;&amp;nbsp;dari setiap staff, kemudian data tersebut yang menjadi dasaran dalam penentuan salah satu materi yang disampaikan saat pelaksanaan&amp;nbsp;&lt;em&gt;enrichment program&lt;/em&gt;.&lt;/p&gt;\r\n&lt;figure class=&quot;image align-center&quot;&gt;&lt;img style=&quot;display: block; margin-left: auto; margin-right: auto;&quot; src=&quot;https://arek.its.ac.id/bem-its/content/uploads/kabardaribemits/Materi-Communication-dan-Personal-Branding-oleh-Head-of-RampD-Pemimpin-id.jpg?1639536442499&quot; alt=&quot;Materi Communication &amp;amp; Personal Branding oleh Head of R&amp;amp;D Pemimpin.id&quot; width=&quot;500&quot; height=&quot;281&quot; /&gt;\r\n&lt;figcaption&gt;Materi Communication &amp;amp; Personal Branding oleh Head of R&amp;amp;D Pemimpin.id&lt;/figcaption&gt;\r\n&lt;/figure&gt;\r\n&lt;p&gt;&lt;em&gt;Enrichment Program&lt;/em&gt;&amp;nbsp;dilaksanakan selama 2 hari, yaitu hari pertama pada Minggu, 14 Februari 2021 dan hari kedua pada Selasa, 18 Februari 2021.&amp;nbsp; Hari pertama, tema yang diangkat adalah &amp;ldquo;&lt;em&gt;Effective Collaboration dan Build Strong Teamwork&lt;/em&gt;&amp;rdquo; menghadirkan Naufal Fathin, CEO Widyaedu, materi yang disampaikan adalah mengenai pentingnya untuk terus belajar baik sebagai organisasi maupun sebagai penggerak organisasi melalui banyak kajian teoritis dan&amp;nbsp;&lt;em&gt;study case&lt;/em&gt;. Selain itu Naufal juga menyampaikan mengenai&amp;nbsp;&lt;em&gt;maintenance talent&lt;/em&gt;&amp;nbsp;di organisasi khususnya di Widyaedu yang dipantau melalui&amp;nbsp;&lt;em&gt;platform trello.&amp;nbsp;&lt;/em&gt;&lt;/p&gt;\r\n&lt;p&gt;Selain menghadirkan Naufal Fathin, di hari pertama juga hadir Nur Fauzan,&amp;nbsp;&lt;em&gt;Head of Research and Development&amp;nbsp;&lt;/em&gt;Pemimpin.id, yang menyampaikan mengenai&amp;nbsp;&lt;em&gt;Communication and Personal Branding&lt;/em&gt;, bagaimana cara anggota menyusun konsep komunikasi organisasi dengan baik agar tidak terjadi salah tafsir terhadap&amp;nbsp;&lt;em&gt;audience&amp;nbsp;&lt;/em&gt;maupun internal organisasi itu sendiri. Selain itu disampaikan pula cara membangun&amp;nbsp;&lt;em&gt;brand identity&lt;/em&gt;&amp;nbsp;agar mendapatkan&amp;nbsp;&lt;em&gt;engagement reach audience&lt;/em&gt;&amp;nbsp;yang lebih tinggi.&lt;/p&gt;\r\n&lt;p&gt;Pada hari kedua,&amp;nbsp;&lt;em&gt;Enrichment Program&lt;/em&gt;&amp;nbsp;diisi oleh Bhima Yudistira selaku ekonom INDEF dengan membawakan tema &amp;ldquo;&lt;em&gt;Awareness in Public Policy and Political Issues&lt;/em&gt;&amp;rdquo;. Mas Bhima memiliki ketertarikan di dunia politik sejak SMA, harapannya dengan hadirnya Mas Bhima dapat menambah&amp;nbsp;&lt;em&gt;awareness&lt;/em&gt;&amp;nbsp;pengurus BEM ITS mengenai isu-isu sosial politik mengingat ranah BEM ITS yang juga sosial politik.&lt;/p&gt;\r\n&lt;p&gt;&lt;em&gt;Enrichment Program&lt;/em&gt;&amp;nbsp;ini diharapkan dapat menambah&amp;nbsp;&lt;em&gt;knowledge talent&lt;/em&gt;&amp;nbsp;BEM ITS untuk mempersiapkan kepengurusan selanjutnya. (septi/MT)&lt;/p&gt;', '2021-02-20', '20:17:28', 'kabardaribemits/Kegiatan-Hari-Pertama-Enrichment-Program.jpg', 'Kegiatan Hari Pertama Enrichment Program', 735, 'N', 'Y', 'Y'),
(4, 2, 1, '', 'Menjawab Keresahan Sistem Kaderisasi Online, PSDM BEM ITS Hadirkan STATUTO', 'menjawab-keresahan-sistem-kaderisasi-online-psdm-bem-its-hadirkan-statuto', '&lt;figure class=&quot;image align-center&quot;&gt;&lt;img src=&quot;https://arek.its.ac.id/bem-its/content/uploads/kabardaribemits/Penyerahan-Sertifikat-Pemateri-STATUTO.jpg?1639536577951&quot; alt=&quot;Penyerahan Sertifikat ke Muhammad Dzaky Farhan sebagai Pemateri STATUTO&quot; width=&quot;500&quot; height=&quot;281&quot; /&gt;\r\n&lt;figcaption&gt;Penyerahan Sertifikat ke Muhammad Dzaky Farhan sebagai Pemateri STATUTO&lt;/figcaption&gt;\r\n&lt;/figure&gt;\r\n&lt;p&gt;Sejak diterapkannya kuliah dengan sistem&amp;nbsp;&lt;em&gt;online&lt;/em&gt;, semua kegiatan di lingkungan Institut Teknologi Sepuluh Nopember (ITS) Surabaya juga dilakukan secara&amp;nbsp;&lt;em&gt;online&lt;/em&gt;, tidak terkecuali kegiatan kaderisasi mahasiswa baru 2020. Hal ini membuat setiap elemen pengkader tingkat Himpunan Mahasiswa Departemen (HMD) harus menyesuaikan diri dengan kondisi yang ada dan mengubah sistem kaderisasi yang semula&amp;nbsp;&lt;em&gt;offline&amp;nbsp;&lt;/em&gt;menjadi&amp;nbsp;&lt;em&gt;online&lt;/em&gt;. Selama berjalannya kaderisasi&amp;nbsp;&lt;em&gt;online&lt;/em&gt;&amp;nbsp;di ITS, banyak himpunan yang merasa kesulitan sehingga menyebabkan proses perencanaan&amp;nbsp;&lt;em&gt;Grand Design&lt;/em&gt;&amp;nbsp;Kaderisasi (GDK) memakan waktu yang lebih lama dari biasanya.&amp;nbsp;&lt;/p&gt;\r\n&lt;p&gt;Melihat permasalahan ini, Kementerian Pengembangan Sumber Daya Mahasiswa (PSDM) BEM ITS membuat suatu program kerja yang bernama STATUTO. Program kerja ini bertujuan untuk mengoptimalisasi kaderisasi tahap awal untuk memenuhi kebutuhan kaderisasi&amp;nbsp;&lt;em&gt;online&lt;/em&gt;&amp;nbsp;di ITS. Selain itu, topik utama dari program kerja yang berasal dari arahan kerja Presiden BEM ITS ini mengarah kepada transisi kaderisasi&amp;nbsp;&lt;em&gt;offline&lt;/em&gt;&amp;nbsp;ke kaderisasi&amp;nbsp;&lt;em&gt;online&lt;/em&gt;.&amp;nbsp;&lt;/p&gt;\r\n&lt;p&gt;STATUTO dihadiri oleh perwakilan PSDM dari tiap-tiap HMD yang ada di ITS&lt;em&gt;.&amp;nbsp;&lt;/em&gt;Menurut Ghozi, Menteri PSDM BEM ITS Rectoverso, antusiasme peserta terhadap STATUTO cukup tinggi dan proaktif dalam mengikuti kegiatan tersebut. Hal ini tidak terlepas dari pengisuan STATUTO yang telah jauh-jauh hari disuarakan sejak awal kepengurusan BEM ITS.&lt;/p&gt;\r\n&lt;figure class=&quot;image align-center&quot;&gt;&lt;img style=&quot;max-width: 100%; height: 280px;&quot; src=&quot;https://arek.its.ac.id/bem-its/content/uploads/kabardaribemits/Kegiatan-STATUTO-yang-Diikuti-oleh-Perwakilan-PSDM-Tiap-HMD.jpg?1639536617491&quot; alt=&quot;Kegiatan STATUTO yang Diikuti oleh Perwakilan PSDM Tiap HMD&quot; width=&quot;500&quot; height=&quot;293&quot; /&gt;\r\n&lt;figcaption&gt;Kegiatan STATUTO yang Diikuti oleh Perwakilan PSDM Tiap HMD&lt;/figcaption&gt;\r\n&lt;/figure&gt;\r\n&lt;p&gt;STATUTO dilaksanakan pada Sabtu dan Minggu, 8-9 Februari 2021. Ada 2 kegiatan utama dalam STATUTO, yaitu kegiatan Webinar dan kegiatan&amp;nbsp;&lt;em&gt;Focus Group Discussion&lt;/em&gt;&amp;nbsp;(FGD). Kegiatan Webinar diisi oleh pemateri yang berasal dari luar ITS, yaitu Muhammad Dzaky Farhan, Menteri Koordinator PSDM KM ITB. Hal ini memiliki tujuan untuk memberikan sudut pandang berbeda dalam penyelesaian masalah yang muncul dari proses kaderisasi&amp;nbsp;&lt;em&gt;online.&lt;/em&gt;&lt;/p&gt;\r\n&lt;p&gt;Sedangkan pada kegiatan FGD, dilakukan&amp;nbsp;&lt;em&gt;sharing session&amp;nbsp;&lt;/em&gt;antar HMD yang ada di ITS. Dengan FGD, diharapkan setiap HMD yang ada di ITS paham mengenai permasalahan yang sedang dihadapi, serta dapat menentukan penyelesaian dari masalah yang ada sehingga kaderisasi&amp;nbsp;&lt;em&gt;online&lt;/em&gt;&amp;nbsp;yang dilaksanakan dapat berjalan secara optimal.&lt;/p&gt;\r\n&lt;p&gt;Dalam pelaksanaannya, terdapat beberapa hasil yang ingin dicapai oleh PSDM BEM ITS, diantaranya adalah mampunya HMD untuk memahami&amp;nbsp; permasalahan yang ada, menentukan alur berpikir untuk menyelesaikan masalah sesuai dengan kebutuhan dari himpunannya dan mendapatkan hipotesa dari solusi&amp;nbsp; permasalahan tersebut. Dikatakan &amp;lsquo;hipotesa&amp;rsquo; karena STATUTO tidak memberikan solusi secara langsung kepada HMD, melainkan informasi serta sudut pandang dari berbagai HMD yang ada di ITS terhadap permasalahan yang sedang dihadapi. Diharapkan nantinya HMD dapat mengolah informasi tersebut menjadi solusi sesuai dengan kebutuhan kaderisasi HMD tersebut.&lt;/p&gt;\r\n&lt;p&gt;&amp;ldquo;Harapannya dari permasalahan-permasalahan yang dipaparkan pada saat JARAS (Jaring Aspirasi) dapat terjawab di STATUTO ini&amp;rdquo;, ucap Bagus Andi Lukito sebagai PIC STATUTO.&lt;/p&gt;\r\n&lt;p&gt;&amp;ldquo;Harapan saya untuk teman-teman HMD yang sudah mengikuti STATUTO, mereka sudah mengerti dan tidak bingung lagi tentang apa yang akan dibahas di himpunan masing-masing untuk memulai kaderisasi online 2020 dan apabila masih ada hal yang ingin didiskusikan, jangan pernah sungkan untuk mengajak kami atau teman-teman HMD lain berdiskusi&amp;rdquo;, tutup Ghozi Naufalmi Adnan, Menteri PSDM BEM ITS Rectoverso. (En/KOMSTRAT)&lt;/p&gt;', '2021-02-23', '18:34:54', 'kabardaribemits/Penyerahan-Sertifikat-Pemateri-STATUTO.jpg', 'Penyerahan Sertifikat ke Muhammad Dzaky Farhan sebagai Pemateri STATUTO', 1230, 'N', 'Y', 'Y'),
(5, 2, 1, '', 'Berkolaborasi dengan ESC Chulalongkorn University Thailand, BEM ITS Membahas Manajemen Organisasi Selama Pandemi COVID-19', 'berkolaborasi-dengan-esc-chulalongkorn-university-thailand-bem-its-membahas-manajemen-organisasi-selama-pandemi-covid-19', '&lt;figure class=&quot;image align-center&quot;&gt;&lt;img src=&quot;https://arek.its.ac.id/bem-its/content/uploads/kabardaribemits/kolaborasi-dengan-chulalongkorn-university-bem-its.jpg?1639536771722&quot; alt=&quot;Organization Visit &amp;amp; Benchmarking ESC Chulalongkorn University Thailand&quot; width=&quot;500&quot; height=&quot;281&quot; /&gt;\r\n&lt;figcaption&gt;Organization Visit &amp;amp; Benchmarking ESC Chulalongkorn University Thailand&lt;/figcaption&gt;\r\n&lt;/figure&gt;\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n&lt;p&gt;Menjawab tantangan selama pandemi&amp;nbsp;&lt;em&gt;COVID-19&lt;/em&gt;&amp;nbsp;dalam berorganisasi, Badan Eksekutif Mahasiswa (BEM) ITS melalui salah satu kementeriannya yaitu Hubungan Luar (Hublu) mengadakan&amp;nbsp;&lt;em&gt;Organization Visit&amp;nbsp;&lt;/em&gt;dan&amp;nbsp;&lt;em&gt;Benchmarking&lt;/em&gt;. Tak tanggung-tanggung, kolaborasi ini dilakukan dengan&amp;nbsp;&lt;em&gt;Engineering Student Comittee (ESC) Chulalongkorn University Thailand&lt;/em&gt;&amp;nbsp;tepatnya pada Rabu, 27 Januari 2021 melalui&amp;nbsp;&lt;em&gt;platform zoom meeting.&amp;nbsp;&lt;/em&gt;Kegiatan ini merupakan salah satu program kerja dari Keditjenan Komunikasi dan Kerjasama Internasional yaitu&amp;nbsp;&lt;em&gt;Foreign Campus&amp;nbsp;&lt;/em&gt;yang secara garis besar berupa kerjasama dan/atau kunjungan dengan perguruan tinggi mancanegara. Semuanya bermula, sejak BEM ITS dan&amp;nbsp;&lt;em&gt;ESC Chulalongkorn&lt;/em&gt;&amp;nbsp;terikat&amp;nbsp;&lt;em&gt;Memorandum of Understanding (MoU)&amp;nbsp;&lt;/em&gt;yang terhitung sejak 16 Desember 2019. Dimana di dalam&amp;nbsp;&lt;em&gt;MoU&amp;nbsp;&lt;/em&gt;tersebut, durasi kerjasama akan berlaku selama 2 tahun. Tanpa membuang waktu dan kesempatan, Kementrian Hubungan Luar memanfaatkan perjanjian ini menjadi sebuah kegiatan kolaborasi antar kedua belah pihak.&lt;/p&gt;\r\n&lt;p&gt;Kegiatan dengan tema&amp;nbsp;&lt;em&gt;&amp;ldquo;Transformative Way in Managing Student Organization during COVID-19 Pandemic&amp;rdquo;&amp;nbsp;&lt;/em&gt;dipilih karena dirasa sesuai dengan situasi saat ini. Dimana setiap organisasi dianggap perlu untuk beradaptasi dan berkembang agar tetap berjalan efektif dan efisien. Pandangan dan masukan dari kedua belah pihak, serta perbedaan budaya dan pemikiran nantinya akan menjadi topik diskusi yang menarik. Namun, bukan hal yang mudah untuk dapat menyamakan struktur organisasi agar diskusi dapat berjalanan lancar, kendala bahasa dan ranah kerja (dimana BEM ITS adalah organisasi di tingkat universitas dan&amp;nbsp;&lt;em&gt;ESC Chulalongkorn&lt;/em&gt;&amp;nbsp;adalah organisasi di tingkat fakultas) menjadi masalah selanjutnya. Pada akhirnya, disepakati bahwa dengan berat hati tidak semua menteri dapat mengikuti kegiatan ini, dan hanya menteri yang dianggap berhubungan atau mendekati saja.&amp;nbsp;&lt;/p&gt;\r\n&lt;p&gt;Agar kegiatan ini dapat terlaksana, panitia perlu setidaknya berkoordinasi dengan pihak&amp;nbsp;&lt;em&gt;ESC Chulalongkorn&lt;/em&gt;&amp;nbsp;dan menteri-menteri yang lain, mengingat sepanjang acara berlangsung hanya akan menggunakan Bahasa Inggris. Namun, dengan koordinasi dan komunikasi yang baik, acara selama kurang lebih 3,5 jam ini dapat berlangsung dengan seru ditandai oleh antusiasme peserta. Dengan diwakili oleh masing-masing perwakilan dari BEM ITS dan&amp;nbsp;&lt;em&gt;ESC Chulalongkorn&lt;/em&gt;&amp;nbsp;sebagai&lt;em&gt;&amp;nbsp;MC,&amp;nbsp;&lt;/em&gt;acara dimulai dengan memutarkan lagu kebangsaan masing-masing negara, sambutan-sambutan, lalu acara inti berupa pemaparan oleh masing-masing presiden yang dilanjutkan dengan diskusi. Selanjutnya memasuki sesi&amp;nbsp;&lt;em&gt;Focus Group Discussion (FGD)&amp;nbsp;&lt;/em&gt;yang terbagi dalam 4&amp;nbsp;&lt;em&gt;breakout room&lt;/em&gt;, dan diakhiri dengan pemberian penghargaan serta&amp;nbsp;&lt;em&gt;photo session.&amp;nbsp;&lt;/em&gt;&lt;/p&gt;\r\n&lt;figure class=&quot;image align-center&quot;&gt;&lt;img src=&quot;https://arek.its.ac.id/bem-its/content/uploads/kabardaribemits/penghargaan-akhir-acara-bem-its-chulalongkorn.jpg?1639536802544&quot; alt=&quot;Pemberian penghargaan di akhir acara&quot; width=&quot;557&quot; height=&quot;313&quot; /&gt;\r\n&lt;figcaption&gt;Pemberian penghargaan di akhir acara&lt;/figcaption&gt;\r\n&lt;/figure&gt;\r\n&lt;p&gt;Di akhir kegiatan, baik BEM ITS dan&amp;nbsp;&lt;em&gt;ESC Chulalongkorn&amp;nbsp;&lt;/em&gt;mendapatkan banyak pandangan dan masukan baru tentang cara mengatur dan mengelola organisasi, terutama di masa pandemi&amp;nbsp;&lt;em&gt;COVID-19&amp;nbsp;&lt;/em&gt;ini dan berharap agar kegiatan serupa dapat diadakan di kemudian hari. Selain itu, kedua belah pihak juga berkomitmen agar kerjasama dan kolaborasi akan terus dijaga, terlebih untuk kepengurusan selanjutnya. Tentunya kegiatan ini juga membuka jalan yang lebih lebar bagi Kementrian Hubungan Luar BEM ITS untuk berani memulai kerjasama dengan perguruan tinggi mancanegara lainnya. Hal ini terbukti dengan berkembangnya kerjasama yang mulai dibangun dengan&amp;nbsp;&lt;em&gt;National University of Singapore, Taylor&amp;rsquo;s University Malaysia&lt;/em&gt;, dan&amp;nbsp;&lt;em&gt;Mahidol University Thailand&lt;/em&gt;. Segala upaya tersebut secara spesifik dapat menjadi sarana untuk meningkatkan daya saing dan nama baik BEM ITS di ranah internasional. (Celine/Hublu)&lt;/p&gt;', '2021-02-28', '19:13:36', 'kabardaribemits/kolaborasi-dengan-chulalongkorn-university-bem-its.jpg', 'Organization Visit &amp; Benchmarking ESC Chulalongkorn University Thailand', 875, 'N', 'Y', 'Y'),
(6, 2, 1, '', 'BEM ITS Ajak Mahasiswa ITS Tingkatkan Wawasan Internasional Melalui Kegiatan Global Movement', 'bem-its-ajak-mahasiswa-its-tingkatkan-wawasan-internasional-melalui-kegiatan-global-movement', '&lt;figure class=&quot;image align-center&quot;&gt;&lt;img src=&quot;https://arek.its.ac.id/bem-its/content/uploads/kabardaribemits/Kegiatan_Global_Movement_BEM_ITS_2021.png?1639536844534&quot; alt=&quot;Kegiatan Global Movement BEM ITS 2021&quot; width=&quot;500&quot; height=&quot;281&quot; /&gt;\r\n&lt;figcaption&gt;Kegiatan Global Movement BEM ITS 2021&lt;/figcaption&gt;\r\n&lt;/figure&gt;\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n&lt;p&gt;Kepedulian  dan kesadaran akan wawasan internasional merupakan aksi yang penting dalam kehidupan global saat ini. Untuk mewujudkan hal tersebut, Kementrian Hubungan Luar Badan Eksekutif Mahasiswa (BEM) ITS mengadakan kegiatan&amp;nbsp;&lt;em&gt;Global Movement&lt;/em&gt;. Dengan pedoman kata &amp;lsquo;&lt;em&gt;Movement&lt;/em&gt;&amp;rsquo; pada&amp;nbsp;&lt;em&gt;Global Movement,&amp;nbsp;&lt;/em&gt;kegiatan ini diadakan dengan 2 rangkaian sub kegiatan sebagai bentuk aksi yang nyata.&amp;nbsp;&lt;em&gt;&amp;nbsp;&lt;/em&gt;Dua kegiatan tersebut adalah&amp;nbsp;&lt;em&gt;Webinar&amp;nbsp;&lt;/em&gt;yang diadakan pada Sabtu, 30 Januari 2021 melalui&amp;nbsp;&lt;em&gt;platform youtube streaming&lt;/em&gt;&amp;nbsp;dan yang kedua adalah&amp;nbsp;&lt;em&gt;Infographic Competition.&amp;nbsp;&lt;/em&gt;Kegiatan di bawah naungan Kedirjenan Komunikasi dan Kerjasama Internasional ini memiliki tujuan menanamkan nilai internasionalisasi khususnya di lingkungan ITS. Namun, kegiatan&amp;nbsp;&lt;em&gt;Global Movement&amp;nbsp;&lt;/em&gt;juga ini juga terbuka untuk umum.&lt;/p&gt;\r\n&lt;p&gt;&lt;em&gt;Global Movement&amp;nbsp;&lt;/em&gt;mengangkat tema&amp;nbsp;&lt;em&gt;&amp;ldquo;The Stairway Toward Sustained Indonesia by 2030&amp;rdquo;&lt;/em&gt;. Tema ini didasarkan pada isu global terkini yang sedang digencar-gencarkan yaitu&amp;nbsp;&lt;em&gt;Sustainable Development Goals&amp;nbsp;&lt;/em&gt;(SDG&amp;rsquo;s).&amp;nbsp; SDG&amp;rsquo;s merupakan perencanaan aksi global yang disepakati oleh para pemimpin dunia termasuk Indonesia dalam menjawab 17 tujuan dan 169 target. Dengan SDG&amp;rsquo;s ini, diharapkan mahasiswa ITS dan sekitarnya dapat menumbuh kan serta mengembangkan budaya internasionalisasi dan berkontribusi bagi Indonesia. Dari tema tersebut,&amp;nbsp;&lt;em&gt;Global Movement&amp;nbsp;&lt;/em&gt;membawa 2 subtopik yaitu &amp;ldquo;Penanaman&amp;nbsp;&lt;em&gt;Mindset&amp;nbsp;&lt;/em&gt;Industri Berkelanjutan untuk Sumber Daya Manusia pada Mahasiswa&amp;rdquo; yang dibawakan oleh Bapak Kemas Adrian dari&amp;nbsp;&lt;em&gt;Environmental and Sustainability Program Coordinator&amp;nbsp;&lt;/em&gt;Pertamina Hulu Kalimantan Timur dan topik kedua adalah &amp;ldquo;Peran Pemuda sebagai Jembatan Kesenjangan Pendidikan di Indonesia&amp;rdquo; yang dibawakan oleh Ibu Dr. Agnes Tuti Rumiati, M.Sc sebagai Ketua SDG&amp;rsquo;s Center ITS serta Clara Lourdessa Oryza&amp;nbsp; selaku moderator yang memimpin jalannya acara ini.&lt;/p&gt;\r\n&lt;p&gt;Kegiatan ini dimulai dengan subtopik pertama yang dibawakan oleh Bapak Kemas yang memiliki latar belakang profesi&amp;nbsp;&lt;em&gt;Environmental and Sustainability Program Coordinator&amp;nbsp;&lt;/em&gt;Pertamina Hulu Kalimantan Timur. Subtopik pertama ini didasarkan pada SDGs no.9 yakni infrastruktur, industri, dan inovasi. Bapak Kemas disini menekankan ke para pemuda untuk menanamkan&amp;nbsp;&lt;em&gt;sustainable mindset&amp;nbsp;&lt;/em&gt;seperti proaktif,&amp;nbsp;&lt;em&gt;lean thinking, growth mindset,&amp;nbsp;&lt;/em&gt;dan intrapreneur. Menjadi catatan tambahan juga, Bapak Kemas menjelaskan salah satu&amp;nbsp;&lt;em&gt;key points&amp;nbsp;&lt;/em&gt;mengenai peran pemuda sebagai jembatan kesenjangan pendidikan di Indonesia antara lain konsep &amp;ldquo;&lt;em&gt;Profit, People,&amp;nbsp;&lt;/em&gt;dan&amp;nbsp;&lt;em&gt;Planet&amp;rdquo;&amp;nbsp;&lt;/em&gt;merupakan pondasi kehidupan berkelanjutan bagi industri saat ini. Selanjutnya, untuk subtopik kedua dibawakan oleh Ibu Dr. Agnes Tuti Rumiati, M.Sc sebagai Ketua SDG&amp;rsquo;s Center ITS.&amp;nbsp; Untuk subtopik kali ini didasarkan pada SDGs no.4 yang membahas mengenai Pendidikan Berkualitas. Mengutip dari pembahasan beliau, Ibu Dr. Agnes Tuti Rumiati, M.Sc menekankan bagaimana pentingnya pemberdayaan SDGs Desa terhadap&amp;nbsp;&lt;em&gt;millennial&amp;nbsp;&lt;/em&gt;dalam memanfaatkan kemampuan sosialnya untuk meningkatkan produktivitas, membentuk ide inovatif, dan pengembangan desa.&amp;nbsp;&lt;/p&gt;\r\n&lt;p&gt;Rangkaian kegiatan&amp;nbsp;&lt;em&gt;Global Movement&amp;nbsp;&lt;/em&gt;ini tidak hanya berakhir di&amp;nbsp;&lt;em&gt;webinar&lt;/em&gt;&amp;nbsp;ini saja. Namun, Kementrian Hubungan Luar Badan Eksekutif Mahasiswa (BEM) ITS juga menindaklanjuti kegiatan ini dengan mengadakan Kompetisi Infografis dengan topik utama mengenai&amp;nbsp;&lt;em&gt;&amp;ldquo;The Stairway Toward Sustained Indonesia by 2030&amp;rdquo;&lt;/em&gt;. Dalam pelaksanaannya, didapatkan pemenang dengan juara 1 diraih oleh Tarisa Aliyah Halim dari Departemen Sistem Informasi angkatan 2018. Melalui serangkaian acara&amp;nbsp;ini, diharapkan dapat menjadi sarana untuk menanamkan nilai internasionalisasi terkhusus di lingkungan ITS.&lt;/p&gt;', '2021-04-13', '16:02:45', 'kabardaribemits/Kegiatan_Global_Movement_BEM_ITS_2021.png', 'Kegiatan Global Movement', 854, 'N', 'Y', 'Y'),
(7, 3, 4, 'hmtlits', 'UU Cipta Kerja: Jalan Mundur Komitmen Perlindungan dan Pengelolaan Lingkungan', 'uu-cipta-kerja-jalan-mundur-komitmen-perlindungan-dan-pengelolaan-lingkungan', '&lt;div class=&quot;ratio ratio-1x1&quot; style=&quot;text-align: center;&quot;&gt;&lt;iframe title=&quot;UU Cipta Kerja: Jalan Mundur Komitmen Perlindungan dan Pengelolaan Lingkungan&quot; src=&quot;https://drive.google.com/file/d/1bJf0-V9a1I5mUPDCvamrIAj3T2l3k1TJ/preview&quot; allowfullscreen=&quot;allowfullscreen&quot;&gt;&lt;/iframe&gt;&lt;/div&gt;', '2021-01-30', '19:20:49', 'darikmitsuntukindonesia/Kajian_UU_Cipta_Kerja_HMTL_ITS.png', 'Kajian UU Cipta Kerja HMTL ITS', 241, 'N', 'Y', 'Y'),
(8, 3, 4, '', 'Urgensitas Poros Maritim Dunia di Periode Ke-2 Jokowi', 'urgensitas-poros-maritim-dunia-di-periode-ke-2-jokowi', '&lt;div class=&quot;ratio ratio-1x1&quot; style=&quot;text-align: center;&quot;&gt;&lt;iframe title=&quot;Urgensitas Poros Maritim Dunia di Periode Ke-2 Jokowi&quot; src=&quot;https://drive.google.com/file/d/13k7Mhe1VRqtxtnqWCbYze6-gry9ke44p/preview&quot; allowfullscreen=&quot;allowfullscreen&quot;&gt;&lt;/iframe&gt;&lt;/div&gt;', '2021-02-01', '15:03:23', 'darikmitsuntukindonesia/Draft_Kajian_Kemaritiman_ITS.png', 'Urgensitas Poros Maritim Dunia', 234, 'N', 'Y', 'Y'),
(9, 3, 1, '', 'Analisa Keselamatan Kapal', 'analisa-keselamatan-kapal-himatekpal-its', '&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n&lt;div class=&quot;ratio ratio-1x1&quot; style=&quot;text-align: center;&quot;&gt;&lt;iframe title=&quot;Analisa Keselamatan Kapal&quot; src=&quot;https://drive.google.com/file/d/1eVqPuH7syCJwml0hhJ6TVvqL4q3wFM2t/preview&quot; allowfullscreen=&quot;allowfullscreen&quot;&gt;&lt;/iframe&gt;&lt;/div&gt;', '2021-02-02', '13:05:50', 'darikmitsuntukindonesia/kajian-analisa-keselamatan-kapal.png', 'Kajian Analisa Keselamatan Kapal oleh HIMATEKPAL ITS', 613, 'N', 'Y', 'Y'),
(10, 3, 1, 'himatekpalits', '4 Tahun Tol Laut', '4-tahun-tol-laut-himatekpal-its', '&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n&lt;div class=&quot;ratio ratio-1x1&quot; style=&quot;text-align: center;&quot;&gt;&lt;iframe title=&quot;4 Tahun Tol Laut oleh HIMATEKPAL ITS&quot; src=&quot;https://drive.google.com/file/d/13QoyFEZR11GyA-MYMqj2M1ew7rS2Aj3r/preview&quot; allowfullscreen=&quot;allowfullscreen&quot;&gt;&lt;/iframe&gt;&lt;/div&gt;', '2021-02-05', '19:03:16', 'darikmitsuntukindonesia/kajian_kemaritiman_4_tahun_tol_laut.png', 'Kajian Kemaritiman 4 Tahun Tol Laut oleh HIMATEKPAL ITS', 561, 'N', 'Y', 'Y'),
(11, 3, 1, '', 'Kampus Merdeka dalam Prespektif Keprofesian Informasi Geospasial', 'kampus-merdeka-dalam-prespektif-keprofesian-informasi-geospasial-himage-its', '&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n&lt;div class=&quot;ratio ratio-1x1&quot; style=&quot;text-align: center;&quot;&gt;&lt;iframe title=&quot;Kampus Merdeka dalam Prespektif Keprofesian Informasi Geospasial&quot; src=&quot;https://drive.google.com/file/d/1HBowuMGYvLfR0H4_-qjct2SySYzFf72I/preview&quot; allowfullscreen=&quot;allowfullscreen&quot;&gt;&lt;/iframe&gt;&lt;/div&gt;', '2021-02-07', '19:16:55', 'darikmitsuntukindonesia/kampus-merdeka-dalam-perspektif-keprofesian-informasi-geospasial.png', 'Kajian Kampus Merdeka dalam Prespektif Keprofesian Informasi Geospasial oleh HIMAGE ITS', 550, 'N', 'Y', 'Y'),
(12, 3, 1, '', 'Penerapan Pembangkit Daya Energi Nuklir di Indonesia', 'penerapan-pembangkit-daya-energi-nuklir-di-indonesia-bemits', '&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n&lt;div class=&quot;ratio ratio-1x1&quot; style=&quot;text-align: center;&quot;&gt;&lt;iframe title=&quot;Penerapan Pembangkit Daya Energi Nuklir di Indonesia&quot; src=&quot;https://drive.google.com/file/d/1GeBI_mR2Ly7YT499it3Uak_ynlj5udel/preview&quot; allowfullscreen=&quot;allowfullscreen&quot;&gt;&lt;/iframe&gt;&lt;/div&gt;', '2021-02-09', '09:30:16', 'darikmitsuntukindonesia/penerapan_pembangkit_daya_energi_nuklir_di_indonesia_bemits.png', 'Kajian Penerapan Pembangkit Daya Energi Nuklir di Indonesia oleh BEM ITS', 594, 'N', 'Y', 'Y'),
(13, 3, 1, '', 'Omnibus Law dalam Penataan Ruang', 'omnibus-law-dalam-penataan-ruang-hmplits', '&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n&lt;div class=&quot;ratio ratio-1x1&quot; style=&quot;text-align: center;&quot;&gt;&lt;iframe title=&quot;Penerapan Pembangkit Daya Energi Nuklir di Indonesia&quot; src=&quot;https://drive.google.com/file/d/1cKqC6vVgdg5UwgBD0lFIYLcfOcQk05Ez/preview&quot; allowfullscreen=&quot;allowfullscreen&quot;&gt;&lt;/iframe&gt;&lt;/div&gt;', '2021-02-11', '12:57:11', 'darikmitsuntukindonesia/omnibus-law-dalam-penataan-ruang-hmplits.png', 'Omnibus Law dalam Penataan Ruang oleh BEM ITS', 527, 'N', 'Y', 'Y'),
(14, 3, 1, 'bemits,bemftk', 'Evaluasi untuk Indonesia Poros Maritim Dunia', 'evaluasi-untuk-indonesia-poros-maritim-dunia-jilid1-bemits-bemftk', '&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n&lt;div class=&quot;ratio ratio-1x1&quot; style=&quot;text-align: center;&quot;&gt;&lt;iframe title=&quot;Evaluasi untuk Indonesia Poros Maritim Dunia&quot; src=&quot;https://drive.google.com/file/d/14NYqKuS-g3cvIyXgpoCD6RXjE9ow304T/preview&quot; allowfullscreen=&quot;allowfullscreen&quot;&gt;&lt;/iframe&gt;&lt;/div&gt;', '2021-02-13', '20:06:16', 'darikmitsuntukindonesia/evaluasi_untuk_indonesia_poros_maritim_dunia_jilid1_bemits_bemftk.png', 'Evaluasi untuk Indonesia Poros Maritim Dunia oleh BEM ITS ft BEM FTK', 632, 'N', 'Y', 'Y'),
(15, 3, 1, 'bemits,bemftk', 'Evaluasi untuk Indonesia Poros Maritim Dunia Jilid II', 'evaluasi-untuk-indonesia-poros-maritim-dunia-jilid-ii-bemits-bem-ftk', '&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n&lt;div class=&quot;ratio ratio-1x1&quot; style=&quot;text-align: center;&quot;&gt;&lt;iframe title=&quot;Evaluasi untuk Indonesia Poros Maritim Dunia Jilid II&quot; src=&quot;https://drive.google.com/file/d/1VNreKYEhlPDDGSEJqbokg94_GaNNrt5B/preview&quot; allowfullscreen=&quot;allowfullscreen&quot;&gt;&lt;/iframe&gt;&lt;/div&gt;', '2021-02-15', '18:10:00', 'darikmitsuntukindonesia/evaluasi_untuk_indonesia_poros_maritim_dunia_jilid2_bemits_bemftk.png', 'Evaluasi untuk Indonesia Poros Maritim Dunia Jilid II oleh BEM ITS ft BEM FTK', 194, 'N', 'Y', 'Y'),
(16, 3, 1, 'bemits', 'Polemik Revisi UU KPK', 'polemik-revisi-uu-kpk-bem-its', '&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n&lt;div class=&quot;ratio ratio-1x1&quot; style=&quot;text-align: center;&quot;&gt;&lt;iframe title=&quot;Polemik Revisi UU KPK oleh BEM ITS&quot; src=&quot;https://drive.google.com/file/d/1NvI3Ex8elNoRa-Y6LHn7805Vj708lXXY/preview&quot; allowfullscreen=&quot;allowfullscreen&quot;&gt;&lt;/iframe&gt;&lt;/div&gt;', '2021-02-18', '08:15:02', 'darikmitsuntukindonesia/kajian_polemik_revisi_uu_kpk_bemits.png', 'Kajian Polemik Revisi UU KPK oleh BEM ITS', 228, 'N', 'Y', 'Y'),
(17, 3, 1, 'bemits', 'Kajian Implementasi PKPU No. 31 th 2018 terhadap Kecerdasan Rakyat dalam Memilih', 'kajian-implementasi-pkpu-no-31-th-2018-terhadap-kecerdasan-rakyat-dalam-memilih-bem-its', '&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n&lt;div class=&quot;ratio ratio-1x1&quot; style=&quot;text-align: center;&quot;&gt;&lt;iframe title=&quot;Kajian Implementasi PKPU No. 31 th 2018 terhadap Kecerdasan Rakyat dalam Memilih oleh BEM ITS&quot; src=&quot;https://drive.google.com/file/d/19egjimfAFm-LKRnh7Vm_GEJzi_5in85I/preview&quot; allowfullscreen=&quot;allowfullscreen&quot;&gt;&lt;/iframe&gt;&lt;/div&gt;', '2021-02-19', '12:24:33', 'darikmitsuntukindonesia/kajian-implementasi-pkpu-no-31-tahun-2018-terhadap-kecerdasan-rakyat-dalam-memilih-bemits.png', 'Kajian Implementasi PKPU No. 31 th 2018 terhadap Kecerdasan Rakyat dalam Memilih oleh BEM ITS', 166, 'N', 'Y', 'Y'),
(18, 3, 1, 'himasiskalits', 'Mencari Upaya Perlindungan HAM di Kapal Asing', 'mencari-upaya-perlindungan-ham-di-kapal-asing-himasiskal-its', '&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n&lt;div class=&quot;ratio ratio-1x1&quot; style=&quot;text-align: center;&quot;&gt;&lt;iframe title=&quot;Mencari Upaya Perlindungan HAM di Kapal Asing&quot; src=&quot;https://drive.google.com/file/d/1Rt8umIyASntiqKSLs9SwQTzo5eyflYoF/preview&quot; allowfullscreen=&quot;allowfullscreen&quot;&gt;&lt;/iframe&gt;&lt;/div&gt;', '2021-02-21', '11:29:02', 'darikmitsuntukindonesia/mencari-upaya-perlindungan-ham-di-kapal-asing-himasiskalits.png', 'Mencari Upaya Perlindungan HAM di Kapal Asing oleh HIMASISKAL ITS', 433, 'N', 'Y', 'Y'),
(19, 3, 1, 'hmplits', 'Polemik Sosial Pembangunan Jalur Lingkar Luar Timur di Keputih', 'polemik-sosial-pembangunan-jalur-lingkar-luar-timur-di-keputih-hmplits', '&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n&lt;div class=&quot;ratio ratio-1x1&quot; style=&quot;text-align: center;&quot;&gt;&lt;iframe title=&quot;Polemik Sosial Pembangunan Jalur Lingkar Luar Timur di Keputih&quot; src=&quot;https://drive.google.com/file/d/1nd9xcLndt0K56fh72m1qe8RYaQRgIY-0/preview&quot; allowfullscreen=&quot;allowfullscreen&quot;&gt;&lt;/iframe&gt;&lt;/div&gt;', '2021-11-24', '20:35:13', 'darikmitsuntukindonesia/polemik-sosial-pembangunan-jalan-lingkar-luar-timur-di-keputih-hmplits.png', 'Polemik Sosial Pembangunan Jalur Lingkar Luar Timur di Keputih oleh HMPL ITS', 159, 'N', 'Y', 'Y'),
(20, 3, 1, '', 'Diskriminasi dan Rasisme Mahasiswa Papua di Surabaya', 'diskriminasi-dan-rasisme-mahasiswa-papua-di-surabaya-bemits', '&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n&lt;div class=&quot;ratio ratio-1x1&quot; style=&quot;text-align: center;&quot;&gt;&lt;iframe title=&quot;4 Tahun Tol Laut oleh HIMATEKPAL ITS&quot; src=&quot;https://drive.google.com/file/d/1nLJNsGRUCk-fLWjwA6b8UiDY5j72UAOD/preview&quot; allowfullscreen=&quot;allowfullscreen&quot;&gt;&lt;/iframe&gt;&lt;/div&gt;', '2021-02-26', '20:38:52', 'darikmitsuntukindonesia/kajian-diskriminasi-dan-rasisme-terhadap-mahasiswa-papua-di-surabaya-bem-its.png', 'Kajian Diskriminasi dan Rasisme Mahasiswa Papua di Surabaya oleh BEM ITS', 1166, 'N', 'Y', 'Y'),
(21, 3, 1, 'himasiskalits', 'Kajian Tol Laut Bidang Pelabuhan dan Galangan Kapal', 'kajian-tol-laut-bidang-pelabuhan-dan-galangan-kapal-himasiskalits', '&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n&lt;div class=&quot;ratio ratio-1x1&quot; style=&quot;text-align: center;&quot;&gt;&lt;iframe title=&quot;Kajian Tol Laut Bidang Pelabuhan dan Galangan Kapal oleh HIMASISKAL ITS&quot; src=&quot;https://drive.google.com/file/d/1coIgK3ThVGmDKvCx4qXooTQyGhDBmppX/preview&quot; allowfullscreen=&quot;allowfullscreen&quot;&gt;&lt;/iframe&gt;&lt;/div&gt;', '2021-02-28', '21:23:40', 'darikmitsuntukindonesia/kajian-tol-laut-bidang-pelabuhan-dan-galangan-kapal-himasiskalits.png', 'Kajian Tol Laut Bidang Pelabuhan dan Galangan Kapal oleh HIMASISKAL ITS', 612, 'N', 'Y', 'Y'),
(22, 3, 1, 'hmplits', 'Swasembada Pangan Lahan Pertanian', 'swasembada-pangan-lahan-pertanian-hmplits', '&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n&lt;div class=&quot;ratio ratio-1x1&quot; style=&quot;text-align: center;&quot;&gt;&lt;iframe title=&quot;Swasembada Pangan Lahan Pertanian oleh HMPL ITS&quot; src=&quot;https://drive.google.com/file/d/1RDPHbwB_hz4sdmvHHZXHnlIKWB_ETyNQ/preview&quot; allowfullscreen=&quot;allowfullscreen&quot;&gt;&lt;/iframe&gt;&lt;/div&gt;', '2021-03-02', '09:12:23', 'darikmitsuntukindonesia/swasembada-pangan-dan-menyusutnya-lahan-pertanian-di-indonesia-hmplits.png', 'Swasembada Pangan Lahan Pertanian oleh HMPL ITS', 534, 'N', 'Y', 'Y'),
(23, 3, 1, 'bemits', 'POLEMIK TES WAWASAN KEBANGSAAN KPK', 'polemik-tes-wawasan-kebangsaan-kpk-bem-its', '&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n&lt;div class=&quot;ratio ratio-1x1&quot; style=&quot;text-align: center;&quot;&gt;&lt;iframe title=&quot;POLEMIK TES WAWASAN KEBANGSAAN KPK oleh BEM ITS&quot; src=&quot;https://drive.google.com/file/d/1yQXnRvG--sgMMueIhSoBVXIoXpFnI1AU/preview&quot; allowfullscreen=&quot;allowfullscreen&quot;&gt;&lt;/iframe&gt;&lt;/div&gt;', '2021-10-31', '20:54:02', 'darikmitsuntukindonesia/kajian-polekmik-tes-wawasan-kebangsaan-kpk-bemits.png', 'POLEMIK TES WAWASAN KEBANGSAAN KPK oleh BEM ITS', 307, 'N', 'Y', 'Y'),
(24, 3, 1, 'bemits', 'Refleksi 6 Tahun Indonesia Merdeka? Wani Piro?', 'refleksi-6-tahun-indonesia-merdeka-wani-piro', '&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n&lt;div class=&quot;ratio ratio-1x1&quot; style=&quot;text-align: center;&quot;&gt;&lt;iframe title=&quot;POLEMIK TES WAWASAN KEBANGSAAN KPK oleh BEM ITS&quot; src=&quot;https://drive.google.com/file/d/1VRWWwo2NiW1jZS5Mb5m1C5VroHcxHWre/preview&quot; allowfullscreen=&quot;allowfullscreen&quot;&gt;&lt;/iframe&gt;&lt;/div&gt;', '2021-12-01', '12:00:09', 'darikmitsuntukindonesia/Refleksi_76_Tahun_Indonesia_Merdeka.jpg', 'Refleksi 6 Tahun Indonesia Merdeka? Wani Piro? oleh BEM ITS', 916, 'N', 'Y', 'Y'),
(25, 3, 1, '', 'KAJIAN POLEMIK PEMINDAHAN IBU KOTA NEGARA BARU', 'kajian-polemik-pemindahan-ibu-kota-negara-baru', '&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n&lt;div class=&quot;ratio ratio-1x1&quot; style=&quot;text-align: center;&quot;&gt;&lt;iframe title=&quot;POLEMIK TES WAWASAN KEBANGSAAN KPK oleh BEM ITS&quot; src=&quot;https://drive.google.com/file/d/1w12_-D1TFeb7XPClFpFeCrvy0u3EiCSy/preview&quot; allowfullscreen=&quot;allowfullscreen&quot;&gt;&lt;/iframe&gt;&lt;/div&gt;', '2021-12-03', '16:09:52', 'darikmitsuntukindonesia/kajian-polemik-perpindahan-ibu-kota-negara-baru-bem-its.jpg', 'KAJIAN POLEMIK PEMINDAHAN IBU KOTA NEGARA BARU oleh BEM ITS', 814, 'N', 'Y', 'Y'),
(26, 2, 1, 'bemits,adkesmamendengar', 'Lewat Adkesma Mendengar, BEM ITS Beri Jawaban Keresahan Seputar Akademik dan Finansial ITS', 'lewat-adkesma-mendengar-bem-its-beri-jawaban-keresahan-seputar-akademik-dan-finansial-its', '&lt;figure class=&quot;image&quot; style=&quot;text-align: center;&quot;&gt;&lt;img style=&quot;display: block; margin-left: auto; margin-right: auto;&quot; src=&quot;https://arek.its.ac.id/bem-its/content/uploads/kabardaribemits/Video_Adkesma_Mendengar_yang_diunggah_di_platform_Instagram_BEM_ITS.jpg?1639534877980&quot; alt=&quot;Video Adkesma Mendengar yang diunggah di platform Instagram BEM ITS&quot; width=&quot;220&quot; height=&quot;378&quot; /&gt;\r\n&lt;figcaption&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;Video Adkesma Mendengar yang diunggah di platform Instagram BEM ITS&lt;/span&gt;&lt;/figcaption&gt;\r\n&lt;/figure&gt;\r\n&lt;p&gt;&lt;strong&gt;BEM ITS, Surabaya &amp;ndash; &lt;/strong&gt;Dalam perkuliahan, banyak mahasiswa ITS yang belum mengetahui tentang akademik dan finansial yang ada di ITS. Hal ini menimbulkan keluh kesah dan beberapa pertanyaan terkait hal tersebut. Oleh karena itu, Badan Eksekutif Mahasiswa Institut Teknologi Sepuluh Nopember (BEM ITS) menampung keresahan mahasiswa melalui Program Kerja (proker) Adkesma Mendengar.&amp;nbsp;&lt;/p&gt;\r\n&lt;p&gt;Sharence Dina, penanggung jawab proker tersebut mengatakan bahwa Adkesma Mendengar merupakan salah satu program kerja garapan dari Kementerian Advokasi dan Kesejahteraan Mahasiswa (adkesma). Proker ini dibuat karena mengetahui bahwa ternyata banyak dari Keluarga Mahasiswa (KM) ITS yang selama ini masih kurang informasi mengenai Akademik dan Finansial yang ada di ITS. &amp;ldquo;Hal tersebutlah yang akhirnya melatar belakangi proker ini,&amp;rdquo; ujarnya,&lt;/p&gt;\r\n&lt;p&gt;Mahasiswi yang kerap disapa Dina ini menyampaikan bahwa Adkesma Mendengar memiliki dua tujuan utama. Diantaranya adalah memberikan sarana untuk menyampaikan segala pertanyaan seputar kebutuhan akademik dan finansial KM ITS. Selain itu, juga melakukan advokasi serta menjawab pertanyaan seputar kebutuhan akademik dan finansial yang disampaikan KM ITS.&lt;/p&gt;\r\n&lt;p&gt;Dina mengungkapkan bahwa dalam menampung pertanyaan-pertanyaan yang akan diajukan oleh KM ITS, maka adkesma membuat sebuah link yang disebar melalui instagram agar bisa diisi oleh semua KM ITS. Pertanyaan-pertanyaan yang telah terkumpul ini kemudian disaring terlebih dahulu. &amp;ldquo;Dalam penyaringan ini kami menggabungkan pertanyaan yang memiliki maksud dan tujuan yang sama serta memilah kembali pertanyaan-pertanyaan agar sesuai dengan topik akademik dan finansial yang ada di ITS,&amp;rdquo; jelas Mahasiswi Departemen Teknik Fisika ini.&lt;/p&gt;\r\n&lt;p&gt;Mahasiswi angkatan 2019 ini melanjutkan bahwa dalam menjawab pertanyaan-pertanyaan yang ada maka adkesma melakukan dua kali wawancara. Wawancara pertama diajukan kepada birokrasi yang bertanggung jawab terhadap akademik. Sedangkan, wawancara kedua diajukan terhadap birokrasi yang bertanggung jawab terhadap finansial. &amp;ldquo;Hal ini bertujuan agar informasi yang didapatkan lebih akurat,&amp;rdquo; imbuhnya.&lt;/p&gt;\r\n&lt;figure class=&quot;image&quot; style=&quot;text-align: center;&quot;&gt;&lt;img style=&quot;display: block; margin-left: auto; margin-right: auto;&quot; src=&quot;https://arek.its.ac.id/bem-its/content/uploads/kabardaribemits/Cuplikan_dari_video_Adkesma_Mendengar.jpg?1639534986607&quot; alt=&quot;Cuplikan dari video Adkesma Mendengar&quot; width=&quot;220&quot; height=&quot;382&quot; /&gt;\r\n&lt;figcaption&gt;Cuplikan dari video Adkesma Mendengar&lt;/figcaption&gt;\r\n&lt;/figure&gt;\r\n&lt;p&gt;Dina menambahkan bahwa jawaban-jawaban dari birokrasi tersebut selanjutnya diringkas kembali untuk selanjutnya dijadikan &lt;em&gt;script&lt;/em&gt; pembuatan video Adkesma Mendengar. Video tersebut akan dipublikasikan melalui kanal instagram milik BEM ITS. &amp;ldquo;Hal ini bertujuan agar informasi dapat tersampaikan dengan baik kepada KM ITS,&amp;rdquo; ungkapnya.&lt;/p&gt;\r\n&lt;p&gt;Dina berharap melalui proker ini KM ITS dapat mengaspirasikan pertanyaan serta keluh kesahnya terhadap kegiatan perkuliahan di ITS baik dalam bidang akademik maupun finansial. Ia juga berharap agar proker ini tidak hanya menjadi wadah aspirasi tetapi juga menjadi jawaban bagi pertanyaan serta keresahan KM ITS terkait hal tersebut. &amp;ldquo;Saya berharap KM ITS bisa merasakan manfaat dari adanya Adkesma Mendengar ini,&amp;rdquo; tandasnya. (dila)&lt;/p&gt;', '2021-12-12', '18:18:46', 'kabardaribemits/adkesma_mendengar_unjukasa.png', 'Adkesma Mendengar oleh BEM ITS', 916, 'N', 'Y', 'Y');
INSERT INTO `t_post` (`id`, `id_category`, `id_user`, `tag`, `title`, `seotitle`, `content`, `datepost`, `timepost`, `picture`, `image_caption`, `hits`, `headline`, `comment`, `active`) VALUES
(27, 2, 1, 'bemits,guyubkmits', 'Tingkatkan Harmonisasi KM ITS, BEM ITS Kembali Gelar Guyub KM ITS', 'tingkatkan-harmonisasi-km-its-bem-its-kembali-gelar-guyub-km-its', '&lt;figure class=&quot;image align-center&quot;&gt;&lt;img src=&quot;https://arek.its.ac.id/bem-its/content/uploads/kabardaribemits/Postingan_nama-nama_tim_peserta_Competition_Mobile_Legend_di_postingan_Instagram_Guyub_KM_ITS.jpg?1639537394510&quot; alt=&quot;&quot; width=&quot;500&quot; height=&quot;625&quot; /&gt;\r\n&lt;figcaption&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;Postingan nama-nama tim peserta &lt;/span&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;Competition Mobile Legend di postingan Instagram Guyub KM ITS&lt;/span&gt;&lt;/figcaption&gt;\r\n&lt;/figure&gt;\r\n&lt;p&gt;Seperti telah menjadi acara tahunan, Badan Eksekutif Mahasiswa Institut Teknologi Sepuluh Nopember (BEM ITS) kembali mengadakan kegiatan Guyub KM ITS. Acara yang berlangsung pada November-Desember 2021 ini diharapkan mampu memberikan wadah kepada Keluarga Mahasiswa (KM) ITS untuk dapat berkumpul walaupun secara dalam jaringan (daring).&amp;nbsp;&lt;/p&gt;\r\n&lt;p&gt;Kadek Agastya Shindu, ketua pelaksana dari acara ini mengatakan bahwa Guyub KM ITS merupakan salah satu Program Kerja (proker) dari Kementerian Dalam Negeri (Dagri). Kegiatan ini diadakan untuk menciptakan interaksi dan meningkatkan harmonisasi di lingkungan KM ITS. Oleh karena itu sesuai dengan nama dan tujuannya, maka acara yang telah diadakan sejak tahun 2016 ini akan melibatkan seluruh anggota KM ITS.&amp;nbsp;&lt;/p&gt;\r\n&lt;p&gt;Seperti telah menjadi acara tahunan, Badan Eksekutif Mahasiswa Institut Teknologi Sepuluh Nopember (BEM ITS) kembali mengadakan kegiatan Guyub KM ITS. Acara yang berlangsung pada November-Desember 2021 ini diharapkan mampu memberikan wadah kepada Keluarga Mahasiswa (KM) ITS untuk dapat berkumpul walaupun secara dalam jaringan (daring).&amp;nbsp;&lt;/p&gt;\r\n&lt;p&gt;Kadek Agastya Shindu, ketua pelaksana dari acara ini mengatakan bahwa Guyub KM ITS merupakan salah satu Program Kerja (proker) dari Kementerian Dalam Negeri (Dagri). Kegiatan ini diadakan untuk menciptakan interaksi dan meningkatkan harmonisasi di lingkungan KM ITS. Oleh karena itu sesuai dengan nama dan tujuannya, maka acara yang telah diadakan sejak tahun 2016 ini akan melibatkan seluruh anggota KM ITS.&amp;nbsp;&lt;/p&gt;\r\n&lt;p&gt;Mahasiswa yang kerap disapa Agas ini melanjutkan bahwa acara yang digelar dari 14 November-29 Desember 2021 tersebut akan mengadakan beberapa kompetisi secara daring, Diantaranya adalah Talent Show Stand Up Comedy, Competition Valorant, dan Competition Mobile Legend. &amp;ldquo;Selain beberapa perlombaan tersebut, pada tahun ini kami juga akan membuat sebuah podcast yang dapat didengarkan oleh seluruh KM ITS,&amp;rdquo; ujarnya.&lt;/p&gt;\r\n&lt;p&gt;Melanjutkan hal tersebut, mahasiswa Departemen Teknik Elektro ini menjelaskan&amp;nbsp; bahwa Talent Show Stand Up Comedy merupakan sebuah kompetisi yang mewadahi para mahasiswa dengan bakat komedian untuk dapat menyalurkan bakatnya dalam perlombaan ini. Sedangkan&amp;nbsp; Competition Valorant dan Competition Mobile Legend adalah sebuah kompetisi dari dua cabang &lt;em&gt;e-sport &lt;/em&gt;yang dapat mewadahi hobi dari para KM ITS dalam bermain permainan online.&lt;/p&gt;\r\n&lt;p&gt;Agas mengungkapkan bahwa Competition Valorant merupakan sebuah terobosan baru yang tidak ada di pelaksanaan Guyub KM ITS tahun-tahun sebelumnya. Kompetisi tersebut baru ada di tahun ini karena dinilai Valorant merupakan salah satu &lt;em&gt;e-sport &lt;/em&gt;tengah populer. &amp;ldquo;Dengan begitu, kami berharap akan banyak KM ITS yang akan mengikuti perlombaan tersebut,&amp;rdquo; ungkapnya.&lt;/p&gt;\r\n&lt;figure class=&quot;image align-center&quot;&gt;&lt;img src=&quot;https://arek.its.ac.id/bem-its/content/uploads/kabardaribemits/Podcast_Hustle_Culture_milik_Guyub_KM_ITS_yang_dipublikasikan_melalui_platform_Youtube_BEM_ITS.jpg?1639537293572&quot; alt=&quot;&quot; width=&quot;500&quot; height=&quot;281&quot; /&gt;\r\n&lt;figcaption&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;Pod&lt;/span&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;cast &lt;/span&gt;&lt;em&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;Hustle Culture&lt;/span&gt;&lt;/em&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt; milik Guyub KM ITS yang dipublikasikan melalui platform Youtube BEM ITS&lt;/span&gt;&lt;/figcaption&gt;\r\n&lt;/figure&gt;\r\n&lt;p&gt;Mahasiswa angkatan 2019 ini menambahkan bahwa tema yang diusung pada pembuatan podcast tahun ini adalah &lt;em&gt;hustle culture.&lt;/em&gt; Tema tersebut dipilih karena &lt;em&gt;hustle culture&lt;/em&gt; kini tengah ramai diperbincangkan di kalangan mahasiswa. Banyak dari KM ITS yang mencari berbagai macam kesibukan untuk terlihat produktif. &amp;ldquo;Dengan mengundang beberapa ketua dari beberapa organisasi dan acara besar di ITS, podcast ini akan membahas tuntas apakah hal tersebut produktif atau justru sebaliknya,&amp;rdquo; tuturnya.&amp;nbsp;&lt;/p&gt;\r\n&lt;p&gt;Agas berharap dengan adanya Guyub KM ITS ini dapat membuat KM ITS semakin harmonis dalam segala bidang. Tidak hanya itu, semoga acara ini juga dapat mewadahi KM ITS untuk dapat melepaskan penat akibat akademik perkuliahan. &amp;ldquo;Kami juga berharap agar proker Guyub KM ITS ini akan terus ada di kepengurusan selanjutnya,&amp;rdquo; pungkasnya penuh harap. (dila)&lt;/p&gt;', '2021-12-14', '12:56:21', 'kabardaribemits/BEM_ITS_Kembali_Gelar_Guyub_KM_ITS.png', 'BEM ITS 2021 Kembali Gelar Guyub KM ITS', 873, 'N', 'Y', 'Y'),
(28, 2, 1, 'bemits', 'BEM ITS Bantu Berikan Edukasi Pencegahan dan Penanggulangan Covid-19', 'bem-its-bantu-berikan-edukasi-pencegahan-dan-penanggulangan-covid-19', '&lt;figure class=&quot;image align-center&quot;&gt;&lt;img src=&quot;https://arek.its.ac.id/bem-its/content/uploads/kabardaribemits/Salah_satu_postingan_informasi_vaksinasi_di_ITS_yang_diunggah_di_Instagram_BEM_ITS_1.jpg?1640696652772&quot; alt=&quot;Salah satu postingan informasi vaksinasi di ITS yang diunggah di Instagram BEM ITS&quot; width=&quot;500&quot; height=&quot;622&quot; /&gt;\r\n&lt;figcaption&gt;Salah satu postingan informasi vaksinasi di ITS yang diunggah di Instagram BEM ITS&lt;/figcaption&gt;\r\n&lt;/figure&gt;\r\n&lt;p&gt;&lt;strong&gt;BEM ITS, Surabaya &amp;ndash; &lt;/strong&gt;Sejak kemunculan Covid-19 di Indonesia, pemerintah telah melakukan berbagai upaya pencegahan dan pengendalian. Salah satunya adalah mengedukasi masyarakat tentang upaya pencegahan dan penanggulangan Covid-19. Guna mendukung hal tersebut, Badan Eksekutif Mahasiswa Institut Teknologi Sepuluh Nopember (BEM ITS) membuat suatu Program Kerja (proker) bernama &lt;em&gt;Daily Content&lt;/em&gt; of Covid-19&lt;/p&gt;\r\n&lt;p&gt;Febiola Putri Utami, ketua pelaksana proker ini mengatakan bahwa &lt;em&gt;Daily Content&lt;/em&gt; of Covid-19 merupakan salah satu proker dari Kementerian Edukasi Kesehatan dan Dunia Pasca Kampus (EKSODUS). Kegiatan ini diadakan untuk menyediakan informasi secara visual dan audio tentang edukasi kesehatan dan layanan kesehatan Covid-19 bagi mahasiswa ITS dan umum. &amp;ldquo;Dengan adanya proker ini kami turut mengedukasi para mahasiswa ITS dan masyarakat umum tentang Covid-19,&amp;rdquo; ujarnya.&lt;/p&gt;\r\n&lt;figure class=&quot;image align-center&quot;&gt;&lt;img src=&quot;https://arek.its.ac.id/bem-its/content/uploads/kabardaribemits/Postingan_informasi_mengenai_data_vaksinasi_covid-19_di_Indonesia.jpg?1640696415459&quot; alt=&quot;Postingan informasi mengenai data vaksinasi covid-19 di Indonesia&quot; width=&quot;500&quot; height=&quot;625&quot; /&gt;\r\n&lt;figcaption&gt;Postingan informasi mengenai data vaksinasi covid-19 di Indonesia&lt;/figcaption&gt;\r\n&lt;/figure&gt;\r\n&lt;p&gt;Mahasiswa yang kerap disapa Febi ini melanjutkan bahwa konten yang dipublikasikan pada 26 Juli 2021 lalu membagikan beberapa informasi. Diantaranya adalah Yuk, Sadar Vaksinasi! , Vaksinasi Surabaya, dan Pendataan Vaksinasi ITS. &amp;ldquo;Selain beberapa konten tersebut, kami juga akan membuat sebuah pelayanan kesehatan secara audio yang dapat didengarkan oleh seluruh KM ITS,&amp;rdquo; tuturnya.&lt;/p&gt;\r\n&lt;p&gt;Melanjutkan hal tersebut, mahasiswa angkatan 2019 ini menjelaskan&amp;nbsp; bahwa konten Yuk, Sadar Vaksinasi! merupakan konten berupa pencerdasan tentang vaksinasi dan Covid-19. Sedangkan&amp;nbsp; Vaksinasi Surabaya adalah sebuah informasi tempat-tempat di Surabaya yang menyelenggarakan vaksinasi. Dan yang ketiga ada Pendataan Vaksinasi ITS merupakan wadah yang memfasilitasi mahasiswa ITS yang belum sempat mengikuti kegiatan vaksin.&lt;/p&gt;\r\n&lt;p&gt;Febi berharap dengan adanya &lt;em&gt;Daily Content&lt;/em&gt; of Covid-19 ini dapat mewadahi seluruh mahasiswa ITS dan umum agar mendapatkan vaksinasi secara merata . Tidak hanya itu, semoga acara ini juga dapat mengurangi angka Covid-19. &amp;ldquo;Kami juga berharap agar proker &lt;em&gt;Daily Content&lt;/em&gt; of Covid-19 ini kebermanfaatannya dapat dirasakan oleh seluruh mahasiswa ITS juga masyarakat sekitar,&amp;rdquo; pungkasnya penuh harap. (bela)&lt;/p&gt;', '2021-12-28', '19:57:33', 'kabardaribemits/Salah_satu_postingan_informasi_vaksinasi_di_ITS_yang_diunggah_di_Instagram_BEM_ITS.jpg', 'Edukasi Pencegahan dan Penanggulangan Covid-19 oleh BEM ITS', 715, 'N', 'Y', 'Y'),
(29, 2, 1, 'bemits', 'Bantu Tingkatkan Softskill KM ITS Lewat Ngopi Komunitas', 'bantu-tingkatkan-softskill-km-its-lewat-ngopi-komunitas', '&lt;figure class=&quot;image align-center&quot;&gt;&lt;img src=&quot;https://arek.its.ac.id/bem-its/content/uploads/kabardaribemits/_Ngopi_Komunitas_Podcast_yang_diunggah_di_Instagram_BEM_ITS.jpg?1640696795668&quot; alt=&quot;Ngopi Komunitas Podcast yang diunggah di Instagram BEM ITS&quot; width=&quot;327&quot; height=&quot;592&quot; /&gt;\r\n&lt;figcaption&gt;Ngopi Komunitas Podcast yang diunggah di Instagram BEM ITS&lt;/figcaption&gt;\r\n&lt;/figure&gt;\r\n&lt;p&gt;&lt;strong&gt;BEM ITS, Surabaya &amp;ndash; &lt;/strong&gt;&lt;em&gt;Softskill &lt;/em&gt;merupakan kemampuan diluar akademik yang harus dimiliki oleh seorang mahasiswa. &lt;em&gt;Softskill&lt;/em&gt; bisa didapatkan dengan menambah pengalaman di organisasi, kepanitiaan, komunitas dan sebagainya. Guna membantu KM ITS dalam memberi wawasan dan ilmu mengenai komunitas, maka Badan Eksekutif Mahasiswa Institut Teknologi Sepuluh Nopember (BEM ITS) mengadakan Program Kerja (proker) Ngopi Komunitas ini&lt;/p&gt;\r\n&lt;p&gt;Anggita Deva Ariyanti, ketua pelaksana dari proker ini mengatakan bahwa Ngopi Komunitas merupakan salah satu proker dari Kementerian Sosial Masyarakat (Sosmas) yang diadakan untuk membangun relasi strategis. Dalam mencapai hal tersebut, maka dilakukan kerjasama terhadap komunitas-komunitas sosial maupun stakeholder yang ada di Surabaya.&amp;nbsp;&amp;rdquo;Misalnya seperti Komunitas Arsa Surabaya, Kampoeng Djoeang, dan Komunitas Save Street Child Surabaya,&amp;rdquo; katanya.&lt;/p&gt;\r\n&lt;p&gt;Anggi menambahkan bahwa tema yang diusung pada Ngopi Komunitas tahun ini adalah komunitas dan edukasi. Tema tersebut dipilih karena BEM ITS juga ingin membangun relasi sekaligus media pemasaran bagi komunitas-komunitas maupun stakeholder dibidang sosial yang ada di Surabaya agar dapat dikenal oleh KM ITS. &amp;ldquo;Sehingga tidak hanya mengedukasi cara bersosialisasinya saja,&amp;rdquo; tuturnya.&lt;/p&gt;\r\n&lt;p&gt;Anggi sapaan akrabnya, melanjutkan bahwa acara tersebut terbagi menjadi dua kegiatan secara daring yaitu Ngopi Komunitas Podcast dan Ngopi Komunitas Video Dokumenter. Ngopi Komunitas Podcast merupakan podcast wawancara dengan komunitas Arsa Surabaya dan Kampoeng Djoeang melalui Zoom Meeting. &amp;ldquo;Rekaman audio hasil wawancara tersebut kemudian akan diupload di akun Instagram BEM ITS tepat pada 17 September dan 16 Oktober 2021,&amp;rdquo; terangnya.&lt;/p&gt;\r\n&lt;p&gt;Melanjutkan hal tersebut, mahasiswa angkatan 2019 ini menjelaskan&amp;nbsp;bahwa dalam Ngopi Komunitas Video Dokumenter akan membuat sebuah video dokumenter dari Komunitas Save Street Child Surabaya. Video tersebut diambil di lokasi Komunitas Save Street Child Surabaya berada. &amp;ldquo;Hasil dari pembuatan video dokumenter akan di upload di kanal youtube BEM ITS,&amp;rdquo; imbuhnya.&lt;/p&gt;\r\n&lt;p&gt;Anggi berharap dengan adanya Ngopi Komunitas ini dapat membuat KM ITS semakin mudah mengakses ilmu pada bidang sosial tepatnya. Tidak hanya itu, semoga acara ini juga dapat mewadahi KM ITS untuk dapat melepaskan penat akibat akademik perkuliahan. &amp;ldquo;Kami juga berharap agar proker Ngopi Komunitas ini akan terus ada di kepengurusan selanjutnya,&amp;rdquo; pungkasnya penuh harap. (bela)&lt;/p&gt;', '2021-12-28', '20:05:42', 'kabardaribemits/_Ngopi_Komunitas_Podcast_yang_diunggah_di_Instagram_BEM_ITS.jpg', 'Ngopi Komunitas oleh BEM ITS', 284, 'N', 'Y', 'Y'),
(30, 2, 1, 'bemits', 'Kawal Isu Kebijakan Kampus, RSN BEM ITS Ulas Renstra ITS 2021-2025', 'kawal-isu-kebijakan-kampus-rsn-bem-its-ulas-renstra-its-2021-2025', '&lt;figure class=&quot;image align-center&quot;&gt;&lt;img src=&quot;https://arek.its.ac.id/bem-its/content/uploads/kabardaribemits/Dr-_Ir-_Suwadi_M-T-_selaku_Direktur_Perencanaan_dan_Pengembangan_ITS_saat_melakukan_sesi_pemaparan_Renstra_bidang_Sarana_dan_Prasarana.png?1640697052220&quot; alt=&quot;&quot; width=&quot;500&quot; height=&quot;281&quot; /&gt;\r\n&lt;figcaption&gt;\r\n&lt;p&gt;Pembukaan sesi diserahkan oleh moderator kepada Ketua Tim Penyusun Renstra ITS tahun 2021-2025, Dr. Darlis Herumurti, S.Kom., M.Kom.&lt;/p&gt;\r\n&lt;/figcaption&gt;\r\n&lt;/figure&gt;\r\n&lt;p&gt;&lt;strong&gt;BEM ITS, Surabaya &amp;ndash; &lt;/strong&gt;Institut Teknologi Sepuluh Nopember (ITS) sudah empat tahun ini menyandang status sebagai Perguruan Tinggi Negeri - Badan Hukum (PTN-BH). Esensi dari statusnya itu, ITS dipercaya untuk mengelola perguruan tinggi secara mandiri sebagai badan publik yang otonom. Setiap perguruan tinggi pun mendapat arahan agar memegang prinsip transparansi dan akuntabilitas. Sebagai media transparansi, Badan Eksekutif Mahasiswa (BEM) ITS menggelar Risalah Sepuluh Nopember (RSN) pada 6 November lalu.&lt;/p&gt;\r\n&lt;p&gt;Melalui kegiatan yang turut mengundang birokrasi ITS dan membuka peluang diskusi antara birokrasi dengan mahasiswa, RSN diharapkan mampu menciptakan keterlibatan harmonis antara keduanya. Dalam hal ini, dibahas Rencana Strategis ITS tahun 2021-2025 yang disampaikan oleh para pemangku kebijakan kampus bagian Akademik dan Kemahasiswaan, serta Bidang Perencanaan, Keuangan, dan Sarana Prasarana.&lt;/p&gt;\r\n&lt;p&gt;Ketua Tim Penyusun Rencana Strategis (Renstra) ITS Tahun 2021-2025, Dr. Darlis Herumurti, S.Kom., M.Kom., menyampaikan adanya kondisi pandemi sekarang ini tetaplah membuka peluang dan kesempatan, di samping merupakan ancaman. &amp;ldquo;Tahun ini, ITS memegang motto &lt;em&gt;Advancing Humanity&lt;/em&gt; yang diturunkan menjadi tiga tujuan strategis,&amp;rdquo; kata dosen Departemen Informatika itu.&lt;/p&gt;\r\n&lt;p&gt;Tiga tujuan strategis itu meliputi terciptanya transformasi organisasi, adanya prestasi unggul dan kontribusi nasional, serta menjadikan ITS perguruan tinggi kelas dunia berprestasi. Sesuai tujuan strategis tersebut, peta strategi dan inisiatif strategis dibuat ITS menjadi delapan poin, yaitu: &lt;em&gt;Internal Enhancement&lt;/em&gt;, &lt;em&gt;Innovation Development&lt;/em&gt;, &lt;em&gt;International Engagement&lt;/em&gt;, &lt;em&gt;Digital Transformation&lt;/em&gt;, poin indikator kinerja utama berdasarkan Kepmendikbud, dan indikator kinerja tambahan, sasaran strategis berbasis &lt;em&gt;balanced scorecard&lt;/em&gt;, serta proyeksi &lt;em&gt;endowment fund&lt;/em&gt;.&lt;/p&gt;\r\n&lt;figure class=&quot;image align-center&quot;&gt;&lt;img src=&quot;https://arek.its.ac.id/bem-its/content/uploads/kabardaribemits/Pemaparan_oleh_Dr-Eng-_Siti_Machmudah_S-T-_M-Eng-_Direktur_Pendidikan_ITS_terkait_Rencana_Strategis_dalam_Bidang_Akademik.png?1640697181597&quot; alt=&quot;Pemaparan oleh Dr.Eng. Siti Machmudah, S.T., M.Eng., Direktur Pendidikan ITS, terkait Rencana Strategis dalam Bidang Akademik&quot; width=&quot;500&quot; height=&quot;281&quot; /&gt;\r\n&lt;figcaption&gt;\r\n&lt;p&gt;Pemaparan oleh Dr.Eng. Siti Machmudah, S.T., M.Eng., Direktur Pendidikan ITS, terkait Rencana Strategis dalam Bidang Akademik&lt;/p&gt;\r\n&lt;/figcaption&gt;\r\n&lt;/figure&gt;\r\n&lt;p&gt;Mendukung pernyataan ketua Tim Renstra, &amp;nbsp;Dr.Eng. Siti Machmudah, S.T., M.Eng., mewakili Wakil Rektor Bidang Akademik dan Kemahasiswaaan, menyampaikan target kunci aspek sistem pembelajaran ITS sampai lima tahun ke depan akan dikembangkan dan ditingkatkan pemanfaatan sistem Massive Open Online Course (MOOCs).&lt;/p&gt;\r\n&lt;p&gt;&amp;ldquo;ITS juga akan mengembangkan kurikulum dan sistem pembelajaran yang bentuknya berbasis &lt;em&gt;case project&lt;/em&gt;,&amp;rdquo; ungkap Direktur Pendidikan ITS itu. ITS menargetkan, akan menambah program studi (prodi) dengan akreditasi unggul, serta meningkatkan jumlah prodi yang mengantongi akreditasi internasional.&lt;/p&gt;\r\n&lt;p&gt;Berikutnya, dilaporkan bahwa dalam rangka pembangunan infrastruktur dan pengembangan kemahasiswaan yang masif, beberapa Tower ITS dibangun sebagai poros-poros bidang tertentu. Selain itu, peningkatan &lt;em&gt;student body&lt;/em&gt; dan berbagai pengembangan kemahasiswaan juga menjadi fokus dalam Renstra 5 Tahun Kedepan. Hal itu disampaikan oleh Dr. Ir. Suwadi, M.T., selaku Direktur Perencanaan dan Pengembangan ITS.&lt;/p&gt;\r\n&lt;p&gt;Mewakili Wakil Rektor bidang Perencanaan, Keuangan, dan Sarana Prasarana, Suwadi menuturkan tujuan pembangunan ini diharapkan dapat memfasilitasi mahasiswa semakin banyak. &amp;ldquo;Baik itu pada pembangunan infrastruktur fisik di ITS, maupun infrastruktur digitalnya,&amp;rdquo; tuturnya. Kebijakan keringanan Uang Kuliah Tunggal (UKT) pun tak luput disampaikan oleh Suwadi.&lt;/p&gt;\r\n&lt;p&gt;Demi mensejahterakan mahasiswanya, ITS mengadakan &lt;em&gt;Endowment Funding&lt;/em&gt; atau penggalangan dana abadi. Setiap tahunnya, ITS menganggarkan dana abadi untuk kesejahteraan mahasiswa sampai senilai 20 M. Dalam mendistribusikan kebermanfaatannya, Ditmawa akan menyeleksi mahasiswa yang mengalami masalah finansial guna pembayaran UKT.&lt;/p&gt;\r\n&lt;figure class=&quot;image align-center&quot;&gt;&lt;img src=&quot;https://arek.its.ac.id/bem-its/content/uploads/kabardaribemits/Pembukaan_sesi_diserahkan_oleh_moderator_kepada_Ketua_Tim_Penyusun_Renstra_ITS_tahun_2021-2025_Dr-_Darlis_Herumurti_S-Kom-_M-Kom-.png?1640697215221&quot; alt=&quot;&quot; width=&quot;500&quot; height=&quot;281&quot; /&gt;\r\n&lt;figcaption&gt;\r\n&lt;p&gt;Dr. Ir. Suwadi, M.T., selaku Direktur Perencanaan dan Pengembangan ITS saat melakukan sesi pemaparan Renstra bidang Sarana dan Prasarana&lt;/p&gt;\r\n&lt;/figcaption&gt;\r\n&lt;/figure&gt;\r\n&lt;p&gt;&amp;ldquo;Harapannya, melalui keringanan yang bersumber dari beberapa mekanisme yang ada, seperti banding UKT, keringanan Kemendikbud, dsb., mahasiswa dapat tetap mengikuti perkuliahan,&amp;rdquo; imbuhnya. Hal yang disampaikan tersebut pun menjadi penutup sesi pemaparan renstra bidang sarana dan prasarana.&lt;/p&gt;\r\n&lt;p&gt;Setelah usai, sesi tanya jawab berlangsung interaktif dan menambah kejelasan serta pemahaman pada diri mahasiswa. BEM ITS pun mengharapkan dengan adanya fasilitas berupa forum diskusi seperti ini, dapat turut mengawal isu-isu terkait kebijakan kampus ITS bersama seluruh mahasiswa.(kafa)&lt;/p&gt;', '2021-12-28', '20:08:54', 'kabardaribemits/Dr-_Ir-_Suwadi_M-T-_selaku_Direktur_Perencanaan_dan_Pengembangan_ITS_saat_melakukan_sesi_pemaparan_Renstra_bidang_Sarana_dan_Prasarana_.png', 'RSN BEM ITS 2021', 764, 'N', 'Y', 'Y'),
(31, 2, 1, 'bemits', 'Lewat Festival Karya, BEM ITS Kenalkan Tim Riset dan Student Chapter', 'lewat-festival-karya-bem-its-kenalkan-tim-riset-dan-student-chapter', '&lt;figure class=&quot;image align-center&quot;&gt;&lt;img src=&quot;https://arek.its.ac.id/bem-its/content/uploads/kabardaribemits/Sesi_pembukaan_Festival_Karya_hari_pertama_yang_disiarkan_langsung_melalui_Youtube_BEM_ITS.png?1640755583509&quot; alt=&quot;Sesi pembukaan Festival Karya hari pertama yang disiarkan langsung melalui Youtube BEM ITS&quot; width=&quot;500&quot; height=&quot;281&quot; /&gt;\r\n&lt;figcaption&gt;\r\n&lt;p&gt;Sesi pembukaan Festival Karya hari pertama yang disiarkan langsung melalui Youtube BEM ITS&lt;/p&gt;\r\n&lt;/figcaption&gt;\r\n&lt;/figure&gt;\r\n&lt;p&gt;&lt;strong&gt;BEM ITS, Surabaya &amp;ndash; &lt;/strong&gt;Institut Teknologi Sepuluh Nopember (ITS) merupakan Perguruan Tinggi Negeri (PTN) yang memiliki banyak tim-tim riset ITS dan &lt;em&gt;student chapter&lt;/em&gt; dengan segudang prestasi. Oleh karena itu, guna memperkenalkan keduanya kepada masyarakat umum dan mahasiswa baru, maka Badan Eksekutif Mahasiswa (BEM) ITS mengadakan acara bernama Festival Karya secara daring melalui platform Youtube BEM ITS selama dua hari, Sabtu (27/11).&lt;/p&gt;\r\n&lt;p&gt;Acara garapan Departemen Ristek BEM ITS ini mengundang beberapa tim riset ITS dan &lt;em&gt;student chapter&lt;/em&gt; di dalamnya&lt;em&gt;. &lt;/em&gt;Tim riset ITS yang turut andil dalam acara ini adalah Anargya ITS, Antasena ITS, Banyubramanta ITS, Barunastra ITS, Bayucaraka ITS, Hydrone ITS, Ichiro ITS, Iris ITS, ITS Abu Robocoon, ITS MSBT, Nawasena ITS, Nogogeni ITS, Sapuangin ITS, Spectronics ITS, dan Virose ITS. Sedangkan &lt;em&gt;student chapter&lt;/em&gt; yang ikut memeriahkan acara ini meliputi AAPG ITS, AICHE ITS, IMAC ITS, INDOCOR ITS, IEEE ITS, NACE ITS, SEG ITS, SPE ITS, SRE ITS, dan SM IAGI ITS.&lt;/p&gt;\r\n&lt;p&gt;Ketua BEM ITS, Ahmad Nailul Firdaus mengatakan bahwa Festival Karya merupakan acara yang cocok untuk para mahasiswa baru ITS sebagai generasi unggul 2045. Acara tersebut dapat menambah skill dan pengetahuan bagi para peserta terutama dalam bidang teknologi. &amp;ldquo;Ilmu yang diperoleh dalam acara ini dapat menjadi bekal dalam menghadapi masa yang akan datang,&amp;rdquo; ungkap mahasiswa yang kerap disapa Nailul ini.&lt;/p&gt;\r\n&lt;p&gt;Sepakat dengan hal tersebut, Rektor ITS, Prof. Dr. Ir. Mochamad Ashari M.Eng menegaskan bahwa acara ini dapat menjadi wadah khususnya bagi mahasiswa baru ITS untuk lebih mengenal tim riset dan &lt;em&gt;student chapter&lt;/em&gt; di ITS. Informasi yang akan disampaikan oleh beberapa narasumber pada acara tersebut diharap dapat memperluas pandangan dan informasi mengenai riset, teknologi, dan energi terbarukan. &amp;ldquo;Informasi yang didapatkan ini semoga dapat diterapkan oleh para peserta untuk melakukan beberapa penelitian,&amp;rdquo; jelasnya.&lt;/p&gt;\r\n&lt;figure class=&quot;image align-center&quot;&gt;&lt;img src=&quot;https://arek.its.ac.id/bem-its/content/uploads/kabardaribemits/Komisi_VII_Dewan_Perwakilan_Rakyat_Republik_Indonesia_DPR_RI_bidang_Energi_Riset_dan_Teknologi_dan_Lingkungan_Hidup_Dyah_Roro_Esti_W-P-_B-A-_M-Sc-_saat_memberikan_sambutannya.png?1640755650021&quot; alt=&quot;&quot; width=&quot;500&quot; height=&quot;281&quot; /&gt;\r\n&lt;figcaption&gt;Komisi VII Dewan Perwakilan Rakyat Republik Indonesia (DPR RI) bidang Energi, Riset dan Teknologi, dan Lingkungan Hidup, Dyah Roro Esti, W.P., B.A., M.Sc. saat memberikan sambutannya&lt;/figcaption&gt;\r\n&lt;/figure&gt;\r\n&lt;p&gt;Mendapat sambutan dari Komisi VII Dewan Perwakilan Rakyat Republik Indonesia (DPR RI) bidang Energi, Riset dan Teknologi, dan Lingkungan Hidup, Dyah Roro Esti, W.P., B.A., M.Sc. menyampaikan bahwa sektor riset merupakan sektor yang sangat penting untuk kehidupan manusia dan dapat mendukung program Indonesia Emas 2045. Hal ini dikarenakan beberapa permasalahan di Indonesia bahkan di dunia dapat diselesaikan melalui riset.&lt;/p&gt;\r\n&lt;p&gt;Tidak hanya itu, Salah satu anggota Dewan Pengarah Badan Riset dan Inovasi Nasional (BRIN) Dr. Ir. Marsudi Wahyu Kisworo dalam sambutannya menilai bahwa Festival Karya merupakan acara yang memiliki dampak positif terutama di situasi pandemi. Hal ini dikarenakan pandemi membuat para peneliti dapat menghasilkan berbagai macam inovasi terutama di bidang kesehatan. &amp;ldquo;Oleh karena itu, dengan adanya acara ini saya yakin dapat memberi ilmu, informasi, serta motivasi kepada para peserta untuk turut andil dalam pembuatan inovasi yang dapat membuat masyarakat &lt;em&gt;survive&lt;/em&gt; di situasi pandemi,&amp;rdquo; ujarnya. (dila)&lt;/p&gt;', '2021-12-29', '19:20:19', 'kabardaribemits/Sesi_pembukaan_Festival_Karya_hari_pertama_yang_disiarkan_langsung_melalui_Youtube_BEM_ITS.png', 'Festival Karya oleh BEM ITS', 800, 'N', 'Y', 'Y'),
(32, 2, 1, '', 'Melalui Prominen, BEM ITS Kawal Progres Implementasi HDPSDM Mubes V', 'melalui-prominen-bem-its-kawal-progres-implementasi-hdpsdm-mubes-v', '&lt;figure class=&quot;image align-center&quot;&gt;&lt;img src=&quot;https://arek.its.ac.id/bem-its/content/uploads/kabardaribemits/Pelaksanaan_Forum_Prominen_Vol-_I_yang_bertujuan_menindaklanjuti_HMD_dan_BEM_Fakultas_yang_belum_memiliki_PPSDM.jpg?1641536191418&quot; alt=&quot;Melalui Prominen, BEM ITS Kawal Progres Implementasi HDPSDM Mubes V&quot; width=&quot;500&quot; height=&quot;281&quot; /&gt;\r\n&lt;figcaption&gt;\r\n&lt;p&gt;Pelaksanaan Forum Prominen Vol. I yang bertujuan menindaklanjuti HMD dan BEM Fakultas yang belum memiliki PPSDM&lt;/p&gt;\r\n&lt;/figcaption&gt;\r\n&lt;/figure&gt;\r\n&lt;p&gt;&lt;strong&gt;BEM ITS, Surabaya &amp;ndash; &lt;/strong&gt;Koordinasi Terpusat Pengembangan Sumber Daya Mahasiswa (KT-PSDM) merupakan satu hal yang penting demi mengawal progress implementasi Haluan Dasar Pengembangan Sumber Daya Mahasiswa (HDPSDM) di Keluarga Mahasiswa Institut Teknologi Sepuluh Nopember (KM ITS). HDPSDM merupakan sebuah dasar bagi KM ITS dalam melakukan pengembagan sumber daya mahasiswanya. Untuk itu, Badan Eksekutif Mahasiswa (BEM) ITS menginisiasi adanya program dengan tajuk Prominen: Pengawalan Progress Implementasi HDPSDM Mubes V.&lt;/p&gt;\r\n&lt;p&gt;Dalam implementasinya, Himpunan Mahasiswa Departemen (HMD) dan BEM Fakultas merupakan elemen yang mengeksekusi terdapatnya Pengembangan Sumber Daya Mahasiswa. Setelah dilakukan evaluasi pencapaian di setiap HMD dan BEM Fakultas, beberapa diantaranya telah menunjukkan progress, tetapi tidak dipungkiri pula terdapat beberapa juga yang menunjukkan progress kurang signifikan dalam pembuatan PPSDM.&lt;/p&gt;\r\n&lt;p&gt;-Menurut salah seorang staff PSDM BEM ITS Nur Laili mengatakan bahwa salah satu penyebabnya adalah adanya kemungkinan miss-persepsi atau kurangnya koordinasi terkait hal-hal yang telah diatur dalam landasan PPSDM di HMD dan BEM Fakultas. &amp;ldquo;Sehingga, BEM ITS di sini ingin memberikan fasilitas yang dapat membantu pemantauan progress dan mengawal &lt;em&gt;output&lt;/em&gt; yang baik terkait pembuatan PPSDM tersebut,&amp;rdquo; katanya.&lt;/p&gt;\r\n&lt;p&gt;Dikarenakan erat kaitannya dengan istilah progress, maka Prominen yang digadang menjadi usaha yang cukup baik untuk menangani hal ini, dikonsepkan BEM ITS sebagai program kontinu. Dalam prosesnya, pertama-tama diawali dengan menggagas jaringan aspirasi dan pencerdasan Bab HDPSDM Mubes V sebagai timbal baliknya, diikuti dengan pemetaan terhadap karakter PPSDM yang tepat untuk masing-masing HMD ataupun BEM Fakultas, kemudian dilanjutkan dengan pemberian &lt;em&gt;treatment&lt;/em&gt; atau pelayanan lanjutan yang disesuaikan dengan hasil pemetaan.&lt;/p&gt;\r\n&lt;p&gt;&amp;ldquo;Tujuan dari proses yang berkelanjutan adalah diharapkan di kemudian hari setiap HMD dan BEM Fakultas KM ITS telah memproduksi PPSDM masing-masing sebagai bentuk implementasi HDPSDM Mubes V,&amp;rdquo; jelas Staff Kaderisasi Kementerian PSDM BEM ITS Unjuk Asa.&lt;/p&gt;\r\n&lt;p&gt;Prominen telah melakukan plotting kelompok HMD dan BEM Fakultas untuk kemudian dibentuk forum yang telah disesuaikan dengan hasil &lt;em&gt;plotting&lt;/em&gt; itu. Sampai akhir tahun ini, telah terselenggara Forum Prominen Vol. 1 dan Vol. 2 yang telah terlaksana sebagai wujud adanya pemantauan dari BEM ITS.&lt;/p&gt;\r\n&lt;p&gt;&amp;ldquo;Setelah forum, baik forum pencerdasan terkait HDPSDM yang sesuai dengan Mubes V maupun forum jaras, kami melakukan &lt;em&gt;treatment&lt;/em&gt; untuk dilakukan evaluasi ketercapaian dari implementasi PPSDM yang dibuat oleh masing-masing HMD ataupun BEM Fakultas,&amp;rdquo; terang Laili.&lt;/p&gt;\r\n&lt;figure class=&quot;image align-center&quot;&gt;&lt;img src=&quot;https://arek.its.ac.id/bem-its/content/uploads/kabardaribemits/Pergelaran_dan_Forum_Jaring_Aspirasi_yang_menjadi_bagian_dari_Prominen_BEM_ITS_bersama_Himatekk.jpg?1641536755847&quot; alt=&quot;Pergelaran dan Forum Jaring Aspirasi yang menjadi bagian dari Prominen BEM ITS, bersama Himatekk&quot; width=&quot;500&quot; height=&quot;257&quot; /&gt;\r\n&lt;figcaption&gt;\r\n&lt;p&gt;Pergelaran dan Forum Jaring Aspirasi yang menjadi bagian dari Prominen BEM ITS, bersama Himatekk&lt;/p&gt;\r\n&lt;/figcaption&gt;\r\n&lt;/figure&gt;\r\n&lt;p&gt;Program yang mempertemukan Kementerian PSDM BEM ITS dengan para pemangku PSDM di BEM Fakultas dan HMD ini, memperjelas bagaimana peranan masing-masing dalam mewujudkan lingkup PSDM yang sesuai dengan Mubes V. Pihak BEM ITS berperan sebagai elemen kawal dan pemantau, sementara PSDM HMD dan BEM Fakultas beserta tim penyusun PPSDM menjadi pemegang tanggung jawab pembuatan PPSDM.&lt;/p&gt;\r\n&lt;p&gt;&amp;ldquo;Pada akhirnya, akibat kerja sama dari pihak-pihak tersebut, HMD dan BEM Fakultas menunjukkan adanya progress dalam kesamaan dan penyeragaman persepsi dari implementasi HDPSDM Mubes V, jika dilihat dari Prominen,&amp;rdquo; ungkap mahasiswa Departemen Statistika ini.&lt;/p&gt;\r\n&lt;p&gt;Di sisi lain, Laili menyebutkan bahwa masih banyak HMD yang belum memiliki PPSDM seperti yang seharusnya. Bahkan, pada tingkatan BEM Fakultas seluruhnya belum memiliki PPSDM yang dimaksud. &amp;ldquo;Untuk sebagian HMD yang telah memiliki PPSDM, perlu melakukan penyesuaian seperti yang tertera dalam HDPSDM Mubes V,&amp;rdquo; lanjutnya.&lt;/p&gt;\r\n&lt;p&gt;Sementara itu, bagi yang tercatat belum memiliki PPSDM, ia paparkan bahwa HMD telah melakukan evaluasi terhadap implementasi sebagaimana seharusnya didasarkan pada PPSDM itu. Untuk itu, sebagai salah satu elemen pengawal PPSDM Laili berpesan, supaya HMD dan BEM Fakultas dapat lebih aktif dan inisiatif menumbuhkan semangat bersama dalam penyusunan PPSDM.&lt;/p&gt;\r\n&lt;p&gt;&amp;ldquo;Pun jika ada kendala PSDM BEM ITS akan selalu terbuka dan mau berdiskusi dalam rangka mengawal pembuatan PPSDM di masing-masing HMD dan BEM Fakultas.&amp;rdquo; pungkasnya. (Kafa)&lt;/p&gt;', '2022-01-07', '13:13:23', 'kabardaribemits/Pergelaran_dan_Forum_Jaring_Aspirasi_yang_menjadi_bagian_dari_Prominen_BEM_ITS_bersama_Himatekk.jpg', 'BEM ITS Kawal Progres Implementasi HDPSDM Mubes V', 898, 'N', 'Y', 'Y'),
(33, 2, 1, 'bemits', 'Digelar Secara Hybrid, ASN ajak KM ITS Memaknai Nilai Sepuluh Nopember', 'digelar-secara-hybrid-asn-ajak-km-its-memaknai-nilai-sepuluh-nopember', '&lt;figure class=&quot;image align-center&quot;&gt;&lt;img src=&quot;https://arek.its.ac.id/bem-its/content/uploads/kabardaribemits/Para_perwakilan_himpunan_saat_berfoto_bersama_di_Taman_Makam_Pahlawan_.jpg?1641651295853&quot; alt=&quot;&quot; width=&quot;500&quot; height=&quot;323&quot; /&gt;\r\n&lt;figcaption&gt;Para perwakilan himpunan saat berfoto bersama di Taman Makam Pahlawan&lt;/figcaption&gt;\r\n&lt;/figure&gt;\r\n&lt;p&gt;&lt;strong&gt;BEM ITS, Surabaya &amp;ndash; &lt;/strong&gt;Aksi Sepuluh Nopember (ASN) merupakan acara tahunan yang kerap diadakan oleh Badan Eksekutif Mahasiswa Institut Teknologi Sepuluh Nopember (BEM ITS) untuk mengenang jasa para pahlawan dan memaknai nilai juang sepuluh nopember. Berbeda dengan tahun-tahun sebelumnya, ASN pada Kabinet Unjuk Asa ini dilaksanakan secara &lt;em&gt;hybrid &lt;/em&gt;selama dua hari (9/11). Hal tersebut terdiri dari kegiatan &lt;em&gt;online&lt;/em&gt; berupa diskusi via &lt;em&gt;zoom meeting &lt;/em&gt;dan kegiatan &lt;em&gt;offline&lt;/em&gt; berupa kunjungan ke Tugu Pahlawan serta Taman Makam Pahlawan.&lt;/p&gt;\r\n&lt;p&gt;Muhamad Fajri Aulia selaku ketua pelaksana ASN kepengurusan Kabinet Unjuk Asa tersebut mengatakan bahwa ASN sebagai salah satu program kerja (proker) dari Kementerian Aksi dan Propaganda (Akspro) memiliki konsepan yang berbeda dengan tahun-tahun sebelumnya. Hal ini dilakukan mengingat kondisi pandemi Covid-19 yang masih belum 100% usai. &amp;ldquo;Sehingga perizinan juga susah jika harus dilaksanakan &lt;em&gt;full offline&lt;/em&gt;,&amp;rdquo; terang mahasiswa yang kerap disapa Fajri ini.&lt;/p&gt;\r\n&lt;p&gt;Fajri mengatakan bahwa walaupun diadakan secara &lt;em&gt;hybrid &lt;/em&gt;tapi tidak akan mengurangi latar belakang dan tujuan dari acara ini. ASN memang diadakan untuk mengenang jasa para pahlawan. Selain itu, ASN juga dimaksudkan untuk memancarkan nilai perjuangan sepuluh nopember kepada KM ITS. &amp;ldquo;Sehingga mahasiswa ITS dapat menanamkan nilai-nilai perjuangan para pahlawan tersebut ke dalam kehidupan sehari-hari,&amp;rdquo; ujarnya.&lt;/p&gt;\r\n&lt;p&gt;Mahasiswa Departemen Teknik Kelautan ini menjelaskan bahwa ASN kali ini terbagi menjadi beberapa acara utama. Diantaranya yaitu diskusi online, kunjungan ke Tugu Pahlawan, dan kunjungan ke Taman Makam Pahlawan. Dalam kunjungan ke Tugu Pahlawan pada (10/11) hanya diwakili oleh beberapa mahasiswa ITS yang tergabung dalam BEM ITS. &amp;ldquo;Tidak hanya itu, adapula aksi &lt;em&gt;online&lt;/em&gt; yang diadakan dengan menggunakan atribut #AksiSepuluhNopember sebagai foto profil sosial media seperti Instagram, Line, Whatsapp, dan beberapa lainnya,&amp;rdquo; jelasnya.&lt;/p&gt;\r\n&lt;figure class=&quot;image align-center&quot;&gt;&lt;img src=&quot;https://arek.its.ac.id/bem-its/content/uploads/kabardaribemits/Momok_Sritomo_saat_menerima_sertifikat_sebagai_pemateri_dalam_Diskusi_Lintas_Pergerakan.jpg?1641651404512&quot; alt=&quot;&quot; width=&quot;500&quot; height=&quot;281&quot; /&gt;\r\n&lt;figcaption&gt;Momok Sritomo saat menerima sertifikat sebagai pemateri dalam Diskusi Lintas Pergerakan&lt;/figcaption&gt;\r\n&lt;/figure&gt;\r\n&lt;p&gt;Fajri menambahkan bahwa diskusi yang diadakan berupa Diskusi Lintas Pergerakan yang dikemas dalam bentuk &lt;em&gt;talkshow &lt;/em&gt;melalui media &lt;em&gt;zoom&lt;/em&gt;. Dalam gelarannya, terdapat beberapa narasumber berkompeten yang turut memeriahkan acara ini. Diantaranya adalah Ketua MPM ITS dan GMS 1974/1975 Momok Sritomo, Direktur JTV Abdul Rokhim, dan Presiden BEM ITS 2018/2019 Haekal Akbar. &amp;ldquo;Dalam diskusi ini Pak Momok sempat memberikan sedikit tips kepada mahasiswa cara menjadi mahasiswa yang aktif dalam dunia politik,&amp;rdquo; tuturnya.&lt;/p&gt;\r\n&lt;p&gt;Fajri menuturkan, kunjungan ke Taman Makam Pahlawan pada (10/11) di malam hari diikuti oleh perwakilan-perwakilan dari beberapa himpunan. Dalam gelarannya para mahasiswa melakukan ziarah kubur dan orasi singkat dari beberapa presidium. &amp;ldquo;Hal ini bertujuan untuk mendoakan para pahlawan yang telah tiada dan senantiasa mengingat serta mengenang jasa-jasa dari pahlawan tersebut,&amp;rdquo; paparnya.&lt;/p&gt;\r\n&lt;figure class=&quot;image align-center&quot;&gt;&lt;img src=&quot;https://arek.its.ac.id/bem-its/content/uploads/kabardaribemits/Mahasiswa_ITS_saat_menabur_bunga_di_salah_satu_makam_pahlawan.jpg?1641651485067&quot; alt=&quot;&quot; width=&quot;500&quot; height=&quot;376&quot; /&gt;\r\n&lt;figcaption&gt;Mahasiswa ITS saat menabur bunga di salah satu makam pahlawan&lt;/figcaption&gt;\r\n&lt;/figure&gt;\r\n&lt;p style=&quot;text-align: justify;&quot;&gt;Mahasiswa angkatan 2019 ini berharap bahwa dengan adanya ASN ini mahasiswa ITS semakin paham dengan makna sepuluh nopember yang tersanding di sebelah kata institut. Tidak hanya itu Ia juga sangat berharap pandemi Covid-19 segera usai sehingga ASN tahun depan dapat dilaksanakan &lt;em&gt;full offline&lt;/em&gt;. &amp;ldquo;Namun jika keadaan belum membaik yang terpenting adalah nilai sepuluh nopember itu bisa tersampaikan dengan baik melalui ASN,&amp;rdquo; tandasnya penuh harap. (dila)&lt;/p&gt;', '2022-01-08', '21:12:57', 'kabardaribemits/Para_perwakilan_himpunan_saat_berfoto_bersama_di_Taman_Makam_Pahlawan_.jpg', 'ASN (Aksi Sepuluh Nopember) oleh BEM ITS ', 829, 'N', 'Y', 'Y'),
(34, 2, 1, 'globalnews,bemits', '254 Confirmed Cases of Omicron In Indonesia Sars-Cov-2-Variant', '254-confirmed-cases-of-omicron-in-indonesia-sars-cov-2-variant', '&lt;figure class=&quot;image align-center&quot;&gt;&lt;img src=&quot;https://arek.its.ac.id/bem-its/content/uploads/kabardaribemits/The_number_of_patients_with_the_Omicron_form_of_the_Covid-19_type_in_Indonesia_has_climbed_to_254_cases_according_to_Minister_of_Health_Menkes_Budi_Gunadi_Sadikin.jpg?1641679503082&quot; alt=&quot;&quot; width=&quot;500&quot; height=&quot;333&quot; /&gt;\r\n&lt;figcaption&gt;&lt;strong&gt;The number of patients with the Omicron form of the Covid-19 type in Indonesia has climbed to 254 cases, according to Minister of Health (Menkes) Budi Gunadi Sadikin.&lt;/strong&gt;&lt;/figcaption&gt;\r\n&lt;/figure&gt;\r\n&lt;p&gt;The number of Omicron Covid-19 cases in the country is increasing. Dr. Siti Nadia Tarmizi, a spokeswoman for the Covid-19 Vaccination Ministry of Health, noted that the number of confirmed Omicron cases in Indonesia was still dominated by Indonesian individuals who had recently returned from overseas visits. The Ministry of Health reported 92 additional confirmed Omicron cases on January 4, 2021, based on an update of Omicron verified cases. As a result, there were a total of 254 Omicron instances, with 239 cases from imported cases and 15 cases from local transmission.&lt;/p&gt;\r\n&lt;p&gt;The Omicron type transmits data at a substantially faster rate than the Delta model. Omicron has been spotted in over 110 nations since its discovery on November 24, 2021, in South Africa, and it is predicted to continue to expand.&amp;nbsp; There have been 278,732 cases and 52 fatalities globally since the Omicron strain of Covid-19 was initially found in mid-November.&lt;/p&gt;\r\n&lt;p&gt;The United Kingdom had the most Omicron variations with 177,201 occurrences. With 40,358 cases, Denmark came in second, followed by the United States with 11,014 cases, and Germany with 10,443 cases.&lt;/p&gt;\r\n&lt;figure class=&quot;image align-center&quot;&gt;&lt;img src=&quot;https://arek.its.ac.id/bem-its/content/uploads/kabardaribemits/Illustration_of_Covid-19_variant_Omicron_Vs_Variant_delta.jpg?1641679563354&quot; alt=&quot;Illustration of Covid-19 variant Omicron Vs Variant delta What&#039;s the difference between Covid-19 variation Omicron and Variant Delta, then?&quot; width=&quot;500&quot; height=&quot;281&quot; /&gt;\r\n&lt;figcaption&gt;&lt;strong&gt;Illustration of Covid-19 variant Omicron Vs Variant delta&lt;/strong&gt;&lt;/figcaption&gt;\r\n&lt;/figure&gt;\r\n&lt;p&gt;&lt;strong&gt;What&#039;s the difference between Covid-19 variation Omicron and Variant Delta, then?&lt;/strong&gt;&lt;/p&gt;\r\n&lt;p&gt;Why is it that the Omicron variety has so many mutations? Omicron is thought to develop 70 times faster than the original Corona and Delta variants in just 24 hours. As a result, the omicron version gets transferred to humans faster than other variants. In human lung tissue, however, the Omicron version developed 10 times slower. The Delta mutation is also more harmful than the Omicron mutation. According to WHO, the omicron variant of Covid-19 is more infectious than other forms, including delta. The temperature of those with Covid-19 omicron is mild, and their throats are itchy but not unpleasant. Patients infected with Omicron had an infection rate of 80%.&lt;/p&gt;\r\n&lt;figure class=&quot;image align-center&quot;&gt;&lt;img src=&quot;https://arek.its.ac.id/bem-its/content/uploads/kabardaribemits/Since_the_Omicron_variant_of_Covid-19_was_first_discovered_in_mid-November_there_have_been_278732_cases_and_52_deaths_worldwide.jpg?1641679715330&quot; alt=&quot;Since the Omicron variant of Covid-19 was first discovered in mid-November, there have been 278,732 cases and 52 deaths worldwide&quot; width=&quot;500&quot; height=&quot;313&quot; /&gt;\r\n&lt;figcaption&gt;\r\n&lt;p&gt;&lt;strong&gt;Since the Omicron variant of Covid-19 was first discovered in mid-November, there have been 278,732 cases and 52 deaths worldwide&lt;/strong&gt;&lt;/p&gt;\r\n&lt;/figcaption&gt;\r\n&lt;/figure&gt;\r\n&lt;p&gt;&lt;strong&gt;Next, how might the Omicron COVID-19 variation be identified in Indonesia?&lt;/strong&gt;&lt;/p&gt;\r\n&lt;p&gt;The first case of Omicron was discovered in a janitor at the Kemayoran Athlete Hospital Wisma Atlet with the initials N. This conclusion was made based on the findings of a research and development agency evaluation of whole genome sequencing (WGS), which were released on December 28, 2021.&lt;/p&gt;\r\n&lt;p&gt;There are 26 imported instances in all. There are 25 Indonesian citizens among them, as well as one foreigner from Nigeria, who have recently returned from Malaysia, Kenya, Saudi Arabia, Egypt, Malawi, Spain, England, and Turkey.&lt;/p&gt;\r\n&lt;p&gt;&lt;strong&gt;What role does the government play in reducing the rate of new cases of Covid-19&amp;rsquo;s Omicron variant in Indonesia?&lt;/strong&gt;&lt;/p&gt;\r\n&lt;p&gt;As a kind of government readiness in the prevention and control of the Omicron variant&#039;s spread. On December 30, 2021, the Ministry of Health releases Circular (SE) Number HK.02.01/MENKES/1391/2021, titled &quot;Prevention and Control of Cases of COVID-19 Variant Omicron (B.1.1.529),&quot; which was signed by the Minister of Health. The purpose of issuing this regulation is to strengthen synergies between the federal government, state, and local health-care facilities, human resources, and other stakeholders.&lt;/p&gt;\r\n&lt;p&gt;Furthermore, the Ministry of Health advises regions to improve 3T (Testing, Tracing, and Treatment) activities, actively monitor for new COVID-19 clusters, and quickly report and collaborate with the center if confirmed Omicron cases are discovered in their area. The government&#039;s new laws to prevent the addition of the Omicron variant of COVID-19 cases, namely, to enhance central and regional cooperation and health facilities in dealing with the threat of Omicron transmission, can be drawn as follows. Given that local transmission cases have been on the rise in recent years. As a result, regional preparedness in responding to the expansion of Omicron is critical in order to avoid the emergence of additional Covid-19 transmission clusters.&lt;/p&gt;\r\n&lt;p&gt;In addition to health-care institutions and infrastructural readiness, the government underlines that individual vigilance must be maintained to reduce the risk of Omicron transmission. As the key to protecting yourself and people around you against Omicron transmission, the 5M health program and immunisation must go hand in hand.&lt;/p&gt;', '2022-01-09', '12:01:51', 'kabardaribemits/The_number_of_patients_with_the_Omicron_form_of_the_Covid-19_type_in_Indonesia_has_climbed_to_254_cases_according_to_Minister_of_Health_Menkes_Budi_Gunadi_Sadikin.jpg', 'Global News by Hublu BEM ITS', 933, 'N', 'Y', 'Y');
INSERT INTO `t_post` (`id`, `id_category`, `id_user`, `tag`, `title`, `seotitle`, `content`, `datepost`, `timepost`, `picture`, `image_caption`, `hits`, `headline`, `comment`, `active`) VALUES
(35, 2, 1, '', 'Forest Deforestation', 'forest-deforestation', '&lt;figure class=&quot;image align-center&quot;&gt;&lt;img src=&quot;https://arek.its.ac.id/bem-its/content/uploads/kabardaribemits/Illustration_of_deforestation_where_rainforests_in_Kalimantan.jpg?1641883753600&quot; alt=&quot;Illustration of deforestation, where rainforests in Kalimantan are cleared to make way for oil palm plantations.&quot; width=&quot;500&quot; height=&quot;335&quot; /&gt;\r\n&lt;figcaption&gt;\r\n&lt;p&gt;&lt;strong&gt;Illustration of deforestation, where rainforests in Kalimantan &lt;/strong&gt;&lt;strong&gt;are cleared to make way for oil palm plantations.&lt;/strong&gt;&lt;/p&gt;\r\n&lt;/figcaption&gt;\r\n&lt;/figure&gt;\r\n&lt;p&gt;Indonesian forests are often eferred to be the world&#039;s lungs because they provide oxygen for the survival of living things by absorbing toxic carbon dioxide and producing oxygen gas. Forests are natural resources that play a critical role in the economy, social, cultural, and environmental aspects of existence. The loss of forest land undoubtedly leads to the extinction of numerous species, which has a variety of consequences, including the greenhouse gas effect. The main environmental issues that developed were divided into five categories, for example, land damage etc, caused by logging and the conversion of land for plantations.&lt;/p&gt;\r\n&lt;p&gt;Land conversion to oil palm plantations accounts for 57 percent of deforestation in Indonesia, with pulp and paper accounting for another 20%. (Ariana, 2017). Almost every year, Indonesia is hit by devastating forest fires; in 2015, 1.7 million hectares burned, resulting in a haze disaster that had major consequences for education, air travel, health, the economy, and, of course, the environment.&lt;/p&gt;\r\n&lt;p&gt;Deforestation refers to the loss of forest land owing to land use agreements for infrastructure, settlements, agriculture, mining, and plantations (Addinul Yakin, 2017). As a result of the frequent forest fires, the conversion of forest land to non-forest land contributes to global warming. Deforestation is linked to illegal logging that poses a harm to all living things and is commonly triggered by forest fires that contribute to global warming (Rimbakita, 2020).&lt;/p&gt;\r\n&lt;p&gt;According to Greenpeace, Indonesia is the third-largest contributor to carbon dioxide emissions behind the United States and China, with forest burning accounting for about 80% of the total. Forest burning also has a significant influence on human health, producing shortness of breath (Han, Goleman, Boyatzis, &amp;amp; Mckee, 2019).&lt;/p&gt;\r\n&lt;p&gt;Official data from the Ministry of Environment and Forestry in recent years shows that it has declined by 75%, or 115.5 thousand hectares, in 2019-2020 compared to the 2018-2019 period, when it reached 462.5 thousand hectares. The high pace of deforestation each year will result in a large loss of forest land, posing a threat to the environment and social life, as well as having direct and indirect consequences in the future. Because the pace of forest deforestation might fluctuate year to year due to various human or community activities, cooperation and mutual knowledge are required to prevent forest deforestation and have a good impact on the environment and human health.&lt;/p&gt;\r\n&lt;figure class=&quot;image align-center&quot;&gt;&lt;img src=&quot;https://arek.its.ac.id/bem-its/content/uploads/kabardaribemits/Graph_of_Gross_Deforestation_of_Natural_Forests_per_Province_Thousand_Ha_2019-2020-.jpg?1641883844918&quot; alt=&quot;Graph of Gross Deforestation of Natural Forests per Province (Thousand Ha) 2019-2020.&quot; width=&quot;500&quot; height=&quot;231&quot; /&gt;\r\n&lt;figcaption&gt;&lt;strong&gt;Graph of Gross Deforestation of Natural Forests per Province (Thousand Ha) 2019-2020.&lt;/strong&gt;&lt;/figcaption&gt;\r\n&lt;/figure&gt;\r\n&lt;p&gt;West Nusa Tenggara Province had the greatest Gross Deforestation Rate of Natural Forests, at 10.6 thousand ha (9.1%), followed by Maluku at 8.5 thousand ha (7.3%), West Kalimantan at 6.7 thousand ha (5.6%), Riau at 5.7 thousand ha (4.8%), and South Kalimantan at 5.4 thousand ha (5.4%). (4.6 percent).&lt;/p&gt;\r\n&lt;p&gt;Various factors that cause deforestation, namely:&lt;/p&gt;\r\n&lt;p&gt;- Farm conversion&lt;/p&gt;\r\n&lt;p&gt;- Forest fires&lt;/p&gt;\r\n&lt;p&gt;- Wood harvesting&lt;/p&gt;\r\n&lt;p&gt;Various actions that produce deforestation will have a significant negative influence on the quality of life, which will be felt immediately by all living beings. So that reductions can be made that will allow Indonesia&#039;s natural environment to be preserved with minimal effort.&lt;/p&gt;\r\n&lt;p&gt;&lt;strong&gt;The Impact of Deforestation on Global Warming.&lt;/strong&gt;&lt;/p&gt;\r\n&lt;p&gt;Forest area has diminished due to land usage for infrastructure, communities, agriculture, mining, and plantations, posing a hazard to living creatures (Yakin, 2015). Deforestation in Indonesia has a significant national and international impact, as well as the presence of uncontrolled forest fires, clearing land for plantations, dredging fuel, and the development of transmigration areas. All of them have several impacts on the community and can result in significant losses, particularly for the entire society and country.&lt;/p&gt;\r\n&lt;p&gt;High emissions can cause various serious impacts including:&lt;/p&gt;\r\n&lt;p&gt;- Temperatures have increased since 1990 by about 0.3 Degree Celsius throughout the season.&lt;/p&gt;\r\n&lt;p&gt;- An increase of 2 to 3% of rainfall intensity every year&lt;/p&gt;\r\n&lt;p&gt;- Significantly increased risk of flood disaster.&lt;/p&gt;\r\n&lt;p&gt;- Creating food threats from the consequences of extreme climate change.&lt;/p&gt;\r\n&lt;p style=&quot;text-align: center;&quot;&gt;The image below shows how deforestation has changed the structure of forest distribution.&lt;/p&gt;\r\n&lt;figure class=&quot;image align-center&quot;&gt;&lt;img src=&quot;https://arek.its.ac.id/bem-its/content/uploads/kabardaribemits/Changes_in_the_Distribution_of_Forests_Due_to_Deforestation.jpg?1641883945285&quot; alt=&quot;Changes in the Distribution of Forests Due to Deforestation&quot; width=&quot;500&quot; height=&quot;274&quot; /&gt;\r\n&lt;figcaption&gt;\r\n&lt;p&gt;&lt;strong&gt;Changes in the Distribution of Forests Due to Deforestation&lt;/strong&gt;&lt;/p&gt;\r\n&lt;/figcaption&gt;\r\n&lt;/figure&gt;\r\n&lt;p&gt;The island of Borneo gives statistics on forest land loss every year through 2020, based on the land map above, which is caused by land used for oil palm plantations and pulp wood plantations, which are highlighted in black on the map above. The change in colour from green to white shows the loss of forest land due to logging and conversion in the same year, whereas the green hue indicates that the forest is permanently dammed.&lt;/p&gt;\r\n&lt;p&gt;In Kalimantan, Indonesia has lost 73 percent of its land area, totalling 3.74 million hectares. 2.29 million hectares of forest land were lost on the island of Kalimantan, with 1.85 million hectares being utilised for plantations.&lt;/p&gt;\r\n&lt;p&gt;&lt;strong&gt;Deforestation Reduction Efforts&lt;/strong&gt;&lt;/p&gt;\r\n&lt;figure class=&quot;image align-center&quot;&gt;&lt;img src=&quot;https://arek.its.ac.id/bem-its/content/uploads/kabardaribemits/Indonesia_succeeded_in_reducing_deforestation_by_75-03_in_the_2019-2020_period_to_115-46_thousand_ha-_This_data_was_released_by_the_Directorate_General_of_PKTL_KLHK-.jpg?1641883998755&quot; alt=&quot;Indonesia succeeded in reducing deforestation by 75.03% in the 2019-2020 period, to 115.46 thousand ha. This data was released by the Directorate General of PKTL, KLHK.&quot; width=&quot;500&quot; height=&quot;282&quot; /&gt;\r\n&lt;figcaption&gt;\r\n&lt;p&gt;&lt;strong&gt;Indonesia succeeded in reducing deforestation by 75.03% in the 2019-2020 period, to 115.46 thousand ha. This data was released by the Directorate General of PKTL, KLHK.&lt;/strong&gt;&lt;/p&gt;\r\n&lt;/figcaption&gt;\r\n&lt;/figure&gt;\r\n&lt;p&gt;Deforestation can be slowed down such that the rate of deforestation does not increase using a number of methods. Including selective logging system that can maintain the sustainability of forest ecosystems and function as a life support system. Then the reforestation initiatives, such as replanting in forest areas, might be used.&lt;/p&gt;\r\n&lt;p&gt;The 2020-2024 RPJMN includes a number of methods for mitigating forest deforestation, including replanting to decrease deforestation to 310 hectares per year.&lt;/p&gt;\r\n&lt;p&gt;&lt;strong&gt;CONCLUSION&lt;/strong&gt;&lt;/p&gt;\r\n&lt;p&gt;Deforestation is a type of forest land loss that poses a harm to living things. Forest area has reduced because of land agreements for infrastructure, towns, agriculture, mining, and plantations, all of which have major consequences, including contributing to global warming. High emissions can have major consequences, such as temperature rises and increasing annual rainfall intensity, both of which can lead to disasters. The main element in deforestation by burning trees to shorten land clearing is the human component for clearing agricultural land and plantations in forest areas. Forest areas will eventually be converted as oil palm plantations expand. As a result, land degradation (land deterioration) will occur in areas where land productivity has declined. Burning land will also result in an increase in carbon emissions, which will have an impact on greenhouse gas emissions in the atmosphere. As a result, the sun&#039;s heat is trapped in the earth, resulting in global warming. If this continues, it will result in climate change.&lt;/p&gt;', '2022-01-11', '13:40:20', 'kabardaribemits/Illustration_of_deforestation_where_rainforests_in_Kalimantan.jpg', 'Global News by Hublu BEM ITS', 1040, 'N', 'Y', 'Y'),
(36, 2, 1, 'diskusipublik,bemits', 'Demi Mencerdaskan KM ITS Terkait Kebijakan Publik, BEM ITS Gelar Diskusi Publik', 'demi-mencerdaskan-km-its-terkait-kebijakan-publik-bem-its-gelar-diskusi-publik', '&lt;figure class=&quot;image align-center&quot;&gt;&lt;img src=&quot;https://arek.its.ac.id/bem-its/content/uploads/kabardaribemits/Sesi_foto_bersama_peserta_dan_pemateri_Diskusi_Publik_I_yang_membahas_urgensi_dan_dampak_pemindahan_Ibu_Kota_Negara.jpg?1641959667683&quot; alt=&quot;&quot; width=&quot;500&quot; height=&quot;283&quot; /&gt;\r\n&lt;figcaption&gt;Sesi foto bersama peserta dan pemateri Diskusi Publik I yang membahas urgensi dan dampak pemindahan Ibu Kota Negara&lt;/figcaption&gt;\r\n&lt;/figure&gt;\r\n&lt;p&gt;&lt;strong&gt;BEM ITS, Surabaya &amp;ndash; &lt;/strong&gt;Sebagai salah satu elemen intelektual di tanah air, mahasiswa sudah sepatutnya dapat mengikuti perkembangan peristiwa yang berpengaruh terhadap kemajuan bangsa. Mengawal hal-hal yang menyangkut kesejahteraan masyarakat adalah salah satu langkah yang mungkin untuk diambil. Badan Eksekutif Mahasiswa Institut Teknologi Sepuluh Nopember (BEM ITS) Surabaya, mengupayakan adanya fasilitas bagi Keluarga Mahasiswa ITS (KM ITS) dan khalayak umum untuk bertemu pakar membahas isu terkini melalui Diskusi Publik.&lt;/p&gt;\r\n&lt;p&gt;Program usungan BEM ITS yang akrab dikenal sebagai Diskusi Publik (Dispub) ini, merupakan kegiatan yang mewadahi adanya interaksi antara pakar yang diundang dengan KM ITS dan partisipan lain yang hadir dalam Dispub. Pakar akan diundang sebagai pemateri selayaknya webinar, dipandu oleh moderator diselenggarakan diskusi setelah sesi pemaparan materi.&lt;/p&gt;\r\n&lt;p&gt;&amp;ldquo;Adanya pakar dalam kegiatan ini, bertujuan untuk memberikan pemahaman kepada para hadirin peserta Dispub terkait kebijakan publik yang menjadi topik perbincangan,&amp;rdquo; ujar Dimas Vidiandaru, Staf Kementerian Kebijakan Publik BEM ITS. Menurutnya, mahasiswa yang dikenal daya kritisnya, perlu wadah belajar tata kelola publik seperti melalui Dispub ini.&lt;/p&gt;\r\n&lt;p&gt;Mahasiswa yang kerap disapa Dimas ini menambahkan, bahwa antusias peserta Dispub sampai akhir tahun 2021 kemarin, menunjukkan nilai positif. &amp;ldquo;Maksudnya, sebagaimana kepekaan dalam diri mahasiswa, banyak peserta yang antusias meramaikan sesi diskusi bersama pakar,&amp;rdquo; imbuhnya.&lt;/p&gt;\r\n&lt;p&gt;Pernyataannya itu didasarkan pada dua Dispub yang telah terselenggara di periode BEM ITS kali ini. Meskipun belum meraih peserta dalam jumlah yang besar, pada Dispub I yang mengangkat tema terkait perpindahan Ibu Kota Negara (IKN) baru, diskusi berjalan dinamis berwarnakan antusias peserta Dispub.&lt;/p&gt;\r\n&lt;figure class=&quot;image align-center&quot;&gt;&lt;img src=&quot;https://arek.its.ac.id/bem-its/content/uploads/kabardaribemits/Sesi_foto_bersama_seusai_pergelaran_Diskusi_Publik_II_yang_membahas_RUU_TPKS.jpg?1641959775945&quot; alt=&quot;Sesi foto bersama seusai pergelaran Diskusi Publik II yang membahas RUU TPKS&quot; width=&quot;500&quot; height=&quot;279&quot; /&gt;\r\n&lt;figcaption&gt;Sesi foto bersama seusai pergelaran Diskusi Publik II yang membahas RUU TPKS&lt;/figcaption&gt;\r\n&lt;/figure&gt;\r\n&lt;p&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;&amp;ldquo;Pada kesempatan Dispub yang pertama, kami mengundang Bapak Ardy Maulydy Navastra, dosen Departemen Perencanaan Wilayah dan Kota (PWK) dan Melva Harahap, aktivis organisasi Wahana Lingkungan Hidup Indonesia (WALHI),&amp;rdquo; ujarnya menyebutkan pakar undangan Dispub I. Urgensi perpindahan IKN dan dampak dari berbagai sudut pandang diulas dalam diskusi yang terlaksana pada 16 Oktober 2021 lalu itu.&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;Di kesempatan kedua, Dispub II menghadirkan Jeanne Noveline Tedja dan Lina Madila Amir untuk membawakan topik yang juga hangat pada waktu itu. Terkait kebijakan, Rancangan Undang-Undang Tindak Pidana Kekerasan Seksual (RUU TPKS), panitia mempercayakan bahasan ini disampaikan oleh keduanya.&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;&amp;ldquo;Jeanne diundang sebagai seorang aktivis sosial, sementara Lina dihadirkan sebagai sosok yang pernah berkecimpung di Komnas Perempuan dan Anak,&amp;rdquo; lanjutnya. Perbincangan terkait topik ini dirasa perlu, sehingga dibawa sebagai topik kedua Dispub. Dengan begitu, diharapkan peserta menjadi lebih mengerti pentingnya keberadaan UU ini dan melindungi korban.&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;Bersamaan dengan penjelasan Dimas terkait pelaksanaan Dispub II yang terlaksana pada 4 Desember 2021 lalu, ia mengharapkan kedepannya Dispub akan mampu mendatangkan lebih banyak pakar untuk diajak berdiskusi bersama publik dengan topik yang lebih banyak pula. &amp;ldquo;Meski dalam pengadaannya tak lepas dari adanya kendala-kendala, kami yakin Dispub mampu menjadi salah satu wadah belajar dan menjadi media pencerdasan kepada khalayak terkait isu yang sedang marak di masyarakat. Semoga ada lebih banyak kesempatan untuk menggelar Dispub.&amp;rdquo; harapnya memungkasi. (kafa)&lt;/span&gt;&lt;/p&gt;', '2022-01-12', '10:51:44', 'kabardaribemits/Sesi_foto_bersama_peserta_dan_pemateri_Diskusi_Publik_I_yang_membahas_urgensi_dan_dampak_pemindahan_Ibu_Kota_Negara.jpg', 'Diskusi Publik oleh BEM ITS', 719, 'N', 'Y', 'Y'),
(37, 2, 1, 'bemits', 'Kulik Isu Menarik, BEM ITS Suguhkan Tayangan Informatif Lewat Suara KM', 'kulik-isu-menarik-bem-its-suguhkan-tayangan-informatif-lewat-suara-km', '&lt;figure class=&quot;image align-center&quot;&gt;&lt;img src=&quot;https://arek.its.ac.id/bem-its/content/uploads/kabardaribemits/Cuplikan_suara_KM_episode_7_di_kanal_Youtube_BEM_ITS.jpg?1642131094821&quot; alt=&quot;Cuplikan suara KM episode 7 di kanal Youtube BEM ITS&quot; width=&quot;500&quot; height=&quot;270&quot; /&gt;\r\n&lt;figcaption&gt;\r\n&lt;p&gt;Cuplikan suara KM episode 7 di kanal Youtube BEM ITS&lt;/p&gt;\r\n&lt;/figcaption&gt;\r\n&lt;/figure&gt;\r\n&lt;p&gt;&lt;strong&gt;BEM ITS, Surabaya &amp;ndash; &lt;/strong&gt;Adanya beberapa isu hangat yang kerap menjadi perbincangan baik di kalangan Keluarga Mahasiswa Institut Teknologi Sepuluh Nopember (KM ITS) maupun Indonesia memang perlu dikaji untuk mengetahui kebenarannya. Guna mewadahi hal tersebut, maka Badan Eksekutif Mahasiswa (BEM) ITS membuat suara KM.&lt;/p&gt;\r\n&lt;p&gt;Menurut Marissa Naomi Juliana Ambarita, penanggung jawab dari program kerja (proker) Suara KM mengatakan bahwa proker garapan Departemen Komunikasi Strategis (Komstrat) ini hadir di setiap kepengurusan. Suara KM dibuat untuk membahas isu-isu menarik yang dikemas dalam sebuah video dengan konsep wawancara. Tahun ini suara KM merilis dua episode melalui kanal Youtube BEM ITS. &quot;Episode 7-8 akan hadir dalam Kabinet Unjuk Asa ini,&quot; tuturnya.&lt;/p&gt;\r\n&lt;p&gt;Mahasiswa yang kerap disapa Naomi ini menerangkan bahwa pada episode ke-7, suara KM mengusung topik wisuda &lt;em&gt;drive thru&lt;/em&gt; yang baru pertama kali digelar di ITS, permasalahan susu di Gerigi ITS 2021, beberapa mini &lt;em&gt;games&lt;/em&gt;, serta perbincangan ringan bersama mahasiswa baru dan mahasiswa yang baru saja lulus. &quot;Sebenarnya tidak ada kriteria khusus dalam pemilihan topiknya, tapi memang saat itu topik-topik inilah yang lagi hangat menjadi bahan perbincangan,&quot; ungkapnya.&lt;/p&gt;\r\n&lt;p&gt;Menambahkan hal tersebut, Naomi juga mengatakan bahwa suara KM juga ingin menyoroti &lt;em&gt;podcast&lt;/em&gt; milik Ini Lho ITS (ILITS) 2021. Hal ini dilakukan sebagai upaya tambahan untuk mempromosikan dan mempublikasikan ILITS 2021. &quot;Sehingga kami mengundang beberapa teman dari ILITS sebagai narasumbernya,&quot; katanya.&lt;/p&gt;\r\n&lt;p&gt;Naomi menjelaskan bahwa dalam proses penggarapannya memanglah tidak mudah. Diperlukan diskusi mendalam terkait pemilihan topik, narasumber, tempat pengambilan gambar, dan cara publikasi. Mengingat Suara KM bukan hanya menjadi informasi saja bagi KM ITS tetapi juga dapat menjadi salah satu tontonan menarik dan menghibur. &quot;Sehingga walaupun mengangkat topik yang sedang hangat tapi kami mengemasnya dengan konten yang lebih ringan agar penonton menikmati tayangan kami,&quot; jelasnya.&lt;/p&gt;\r\n&lt;p&gt;Mahasiswa angkatan 2019 ini menyebutkan bahwa pada episode ke-8 suara KM akan lebih membahas mengenai Kartu Tanda Mahasiswa (KTM) yang akan digunakan untuk memasuki &lt;em&gt;smart gate&lt;/em&gt; ITS, &lt;em&gt;Co-working Space&lt;/em&gt; ITS yang semakin eksis, dan Peraturan Menteri Pendidikan, Kebudayaan, Riset, dan Teknologi (Permendikbud Ristek) Nomor 30 Tahun 2021 tentang Pencegahan dan Penanganan Kekerasan Seksual (PPKS). &quot;Saat ini masih dalam proses penggarapan dan akan segera tayang di Youtube BEM ITS,&quot; paparnya.&lt;/p&gt;\r\n&lt;p&gt;Dengan konten yang disuguhkan dan cara publikasi yang dipilih, maka mahasiswa Departemen Teknik Transportasi Laut ini berharap agar tayangan Suara KM semakin meningkat dan dapat menjadi wadah diskusi di kalangan KM ITS. Selain itu Ia juga berharap agar suara KM di kepengurusan selanjutnya dapat&amp;nbsp; menyuguhkan informasi yang lebih informatif, pengemasan yang lebih menarik, dan publikasi yang lebih baik. &quot;Semoga tujuan dari dibuatnya suara KM ini dapat dirasakan bagi semua yang menonton terutama KM ITS,&quot; harapnya memungkasi. (dila)&lt;/p&gt;', '2022-01-14', '10:30:25', 'kabardaribemits/Cuplikan_suara_KM_episode_7_di_kanal_Youtube_BEM_ITS.jpg', 'Suara KM oleh BEM ITS', 807, 'N', 'Y', 'Y'),
(38, 2, 1, 'ilits2022,bemits', 'Lewat Ini Lho ITS! 2022, Mahasiswa Kenalkan ITS Lewat Acara-Acara Menarik', 'lewat-ini-lho-its-2022-mahasiswa-kenalkan-its-lewat-acara-acara-menarik', '&lt;figure class=&quot;image align-center&quot;&gt;&lt;img src=&quot;https://arek.its.ac.id/bem-its/content/uploads/kabardaribemits/Salah_satu_pemaparan_dari_Fakultas_Sains_dan_Analitika_Data_FSAD_dalam_rangkaiam_acara_Faculty_and_Department_Day_FND_hari_Ke-1.jpg?1642227254124&quot; alt=&quot;Salah satu pemaparan dari Fakultas Sains dan Analitika Data (FSAD) dalam rangkaiam acara Faculty and Department Day (FND) hari Ke-1&quot; width=&quot;500&quot; height=&quot;279&quot; /&gt;\r\n&lt;figcaption&gt;Salah satu pemaparan dari Fakultas Sains dan Analitika Data (FSAD) dalam rangkaiam acara Faculty and Department Day (FND) hari Ke-1&lt;/figcaption&gt;\r\n&lt;/figure&gt;\r\n&lt;p&gt;&lt;strong&gt;BEM ITS, Surabaya&lt;/strong&gt; &amp;ndash; Acara tahunan yang menjadi andalan Institut Teknologi Sepuluh Nopember (ITS) Surabaya untuk mengenalkan ITS kepada masyarakat umum kembali digelar. Dengan tajuk Eskalator Cita, rangkaian acara Ini Lho ITS! (ILITS) 2022 berlangsung dari September 2021 hingga Februari 2022. Melalui ILITS 2022, pengenalan ITS dan dinamika setiap departemennya dikemas secara menarik melalui rangkaian acara-acaranya.&lt;/p&gt;\r\n&lt;p&gt;Ini Lho ITS! (ILITS) 2022 merupakan suatu acara yang mengintegrasikan pengenalan jurusan dan kehidupan perkuliahan di ITS. Di tahun 2022, ILITS&amp;nbsp; yang bertajuk Eksalator Cita dengan harapan dapat menjadi wadah yang membuka pandangan seseorang agar berani bermimpi setinggi-tingginya, mengeskalasikan cita dan harapannya.&lt;/p&gt;\r\n&lt;p&gt;Menurut Duta Albany selaku penanggungjawab ILITS 2022 dari Departemen Hubungan Luar BEM ITS, tahun ini ILITS hadir dengan konsep yang lebih &lt;em&gt;fresh&lt;/em&gt; dari perhelatan tahun sebelumnya. Selain acara seperti Visit Nasional ILITS dan Virtual Expo, &lt;em&gt;open campus&lt;/em&gt; ILITS 2022 yang dibuat menjadi rangkaian acara dengan tema Nirwana Asa yang terdiri dari ITS Fair, Faculty and Department Day (FND), One Day Lecture (ODL). ILITS 2022 juga berhasil menjangkau siswa/siswi SMA/sederajat yang ada di luar negeri, yakni di Arab Saudi, Jepang, Mesir, Filipina, Myanmar, Belanda, dan Malaysia.&lt;/p&gt;\r\n&lt;p&gt;Untuk menyemarakkan acara, promosi ILITS 2022 pun juga dikemas dalam &lt;em&gt;mini web series&lt;/em&gt; dan &lt;em&gt;podcast&lt;/em&gt; yang bisa dinikmati di akun Spotify dan Youtube Ini Lho ITS!. Selain itu, ILITS 2022 juga memperkenalkan gebrakan barunya, &lt;em&gt;Student Ambassador&lt;/em&gt;, yang mengajak siswa-siswi SMA/sederajat untuk mengembangkan kemampuan mereka dan ikut memperkenalkan ITS dari sisi akademis dan non-akademisnya melalui sosial media.&lt;/p&gt;\r\n&lt;figure class=&quot;image align-center&quot;&gt;&lt;img src=&quot;https://arek.its.ac.id/bem-its/content/uploads/kabardaribemits/Salah_satu_cuplikan_Podcast_di_kanal_Youtube_Ini_Lho_ITS.jpg?1642227323212&quot; alt=&quot;Salah satu cuplikan Podcast di kanal Youtube Ini Lho ITS!&quot; width=&quot;500&quot; height=&quot;279&quot; /&gt;\r\n&lt;figcaption&gt;Salah satu cuplikan &lt;em&gt;Podcast&lt;/em&gt; di kanal Youtube Ini Lho ITS!&lt;/figcaption&gt;\r\n&lt;/figure&gt;\r\n&lt;p&gt;Rangkaian &lt;em&gt;open campus&lt;/em&gt; Nirwana Asa dimulai dari ITS Fair yang dihelat pada 12 Desember 2021. ITS Fair dikemas dalam bentuk webinar dan &lt;em&gt;talkshow&lt;/em&gt; dengan 3 (tiga) topik menarik yakni: 1) Get to Know ITS!, 2) Student Achievement in Campus Life Environment, 3) Expand Your Experiences to the Next Level. Webinar dan &lt;em&gt;talkshow&lt;/em&gt; ini diadakan melalui platform Zoom dan Youtube resmi Ini Lho ITS!.&lt;/p&gt;\r\n&lt;p&gt;Rangkaian acara &lt;em&gt;open campus&lt;/em&gt; selanjutnya Faculty and Department Day (FND) yang dilaksanakan pada 9 Januari 2022. Acara ini mengupas lebih lanjut mengenai serba-serbi fakultas dan departemen yang ada di ITS, dan dibagi menjadi 5 (lima) sesi Zoom Meeting dengan &lt;em&gt;room&lt;/em&gt; sesuai dengan departemen yang telah disediakan oleh panitia.&lt;/p&gt;\r\n&lt;p&gt;&lt;em&gt;Open campus&lt;/em&gt; terakhir adalah One Day Lecture (ODL) yang dilaksanakan pada 15-16 Januari 2022. ODL merupakan salah satu &lt;em&gt;sub-event&lt;/em&gt; yang bertujuan untuk mengenalkan ITS dalam bentuk simulasi perkuliahan, sehingga siswa SMA/sederajat dapat mengetahui secara langsung seperti apa situasi belajar-mengajar di ITS. Acara ini juga dibagi menjadi beberapa sesi Zoom Meeting dengan pembagian kelas sesuai departemen yang diminati.&lt;/p&gt;\r\n&lt;p&gt;Selain rangkaian acara &lt;em&gt;open campus,&lt;/em&gt; Ini Lho ITS! juga bekerja sama dengan 47 Forum Daerah (Forda) yang ada di ITS melalui Visit Nasional. Secara garis besar, Visit Nasional ILITS 2022 dilaksanakan bertahap di daerah masing-masing dari 1 Desember-31 Januari 2022 di 1250 lebih sekolah di seluruh Indonesia. Melalui kerja sama dengan setiap Forda, jangkauan promosi dan pengenalan ITS menjadi lebih luas lagi karena dilakukan secara langsung ke daerah-daerah di seluruh Indonesia. Mahasiswa ITS berbagai daerah tersebut biasanya turun langsung ke SMA/sederajat yang ada di daerah mereka dan melakukan sosialisasi. ILITS sendiri juga telah menyediakan berbagai fasilitas Visit, seperti Try Out UTBK, brosur ITS untuk sosialisasi, hingga &lt;em&gt;upgrading&lt;/em&gt; bagi teman-teman Forda yang akan berpartisipasi dalam Visit. Welcome Nasional atau pembukaan resmi serentak Visit Nasional bersama Forda dilaksanakan pada tanggal 22-23 Januari 2022.&lt;/p&gt;\r\n&lt;p&gt;Mengingat sebagian besar acara ILITS 2022 diselenggarakan secara &lt;em&gt;online&lt;/em&gt;, ILITS juga mewadahi acara Virtual Expo agar para siswa lebih mengenal ITS dan mengetahui keadaan kampus melalui jalan-jalan virtual. Virtual Expo ILITS terbuka untuk umum dan dapat diakses melalui website &lt;a href=&quot;http://inilho.its.ac.id/VirtualExpo&quot;&gt;Ini Lho ITS!&lt;/a&gt; Peserta akan diajak ke Gedung Robotika ITS, tempat &lt;em&gt;virtual expo&lt;/em&gt; berlangsung, dan mengulik lebih lanjut mengenai seluk-beluk fakultas bahkan departemen yang diminati.&lt;/p&gt;\r\n&lt;p&gt;Duta Albany selaku penanggungjawab ILITS 2022 menuturkan bahwa dengan adanya ILITS, nama ITS dapat semakin terkenal di kalangan siswa-siswi SMA/sederajat yang ingin melanjutkan studinya ke Perguruan Tinggi. Sebagai acara, ia juga berharap ILITS dapat berada di radar yang semakin tinggi dalam hal promosi event setara kampus baik di Indonesia dan Luar Negeri, mengingat tahun ini ILITS berhasil menjangkau beberapa sekolah yang ada di luar negeri. &amp;ldquo;Aku yakin dengan &lt;em&gt;progress&lt;/em&gt; yang sangat baik tiap tahunnya, 4-5 tahun kedepan ITS dapat memiliki semakin banyak mahasiswa berprestasi dari seluruh Indonesia dan tentunya bisa menjadi andalan bangsa di masa depan,&amp;rdquo; pungkasnya. (sella)&lt;/p&gt;', '2022-01-15', '13:10:58', 'kabardaribemits/Salah_satu_pemaparan_dari_Fakultas_Sains_dan_Analitika_Data_FSAD_dalam_rangkaiam_acara_Faculty_and_Department_Day_FND_hari_Ke-1.jpg', 'ILITS 2022 oleh BEM ITS', 694, 'N', 'Y', 'Y'),
(39, 3, 1, 'bemits,kajianruuperlindungandatapribadi', 'Kajian RUU Perlindungan Data Pribadi: Datamu Dataku (Bukan) Milik Kita Bersama', 'kajian-ruu-perlindungan-data-pribadi-datamu-dataku-bukan-milik-kita-bersama', '&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n&lt;div class=&quot;ratio ratio-1x1&quot; style=&quot;text-align: center;&quot;&gt;&lt;iframe title=&quot;Kajian RUU Perlindungan Data Pribadi: Datamu Dataku (Bukan) Milik Kita Bersama&quot; src=&quot;https://drive.google.com/file/d/1U20TvKyaujjpAjLNh5MjYFgXUAaZRv46/preview&quot; allowfullscreen=&quot;allowfullscreen&quot;&gt;&lt;/iframe&gt;&lt;/div&gt;', '2022-03-11', '20:09:15', 'darikmitsuntukindonesia/Screenshot_2022-03-11_at_20-17-44.png', 'Kajian RUU Perlindungan Data Pribadi: Datamu Dataku (Bukan) Milik Kita Bersama oleh BEM ITS', 512, 'N', 'Y', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `t_roles`
--

CREATE TABLE `t_roles` (
  `id` int(10) NOT NULL,
  `group` varchar(255) NOT NULL DEFAULT '_NO_GROUPS_',
  `module` varchar(255) NOT NULL DEFAULT '_NO_MODULE_',
  `read_access` smallint(1) NOT NULL DEFAULT '0',
  `write_access` smallint(1) NOT NULL DEFAULT '0',
  `modify_access` smallint(1) NOT NULL DEFAULT '0',
  `delete_access` smallint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_roles`
--

INSERT INTO `t_roles` (`id`, `group`, `module`, `read_access`, `write_access`, `modify_access`, `delete_access`) VALUES
(1, 'admin', 'dashboard', 1, 1, 1, 1),
(2, 'admin', 'post', 1, 1, 1, 1),
(3, 'admin', 'category', 1, 1, 1, 1),
(4, 'admin', 'tag', 1, 1, 0, 1),
(5, 'admin', 'comment', 1, 1, 1, 1),
(6, 'admin', 'pages', 1, 1, 1, 1),
(7, 'admin', 'gallery', 1, 1, 1, 1),
(8, 'admin', 'filemanager', 1, 1, 1, 1),
(9, 'admin', 'mail', 1, 1, 1, 1),
(10, 'admin', 'user', 1, 1, 1, 0),
(11, 'admin', 'component', 1, 0, 0, 0),
(12, 'admin', 'theme', 1, 0, 0, 0),
(13, 'admin', 'setting', 1, 0, 0, 0),
(14, 'admin', 'menumanager', 0, 0, 0, 0),
(35, 'admin', 'profile', 1, 1, 1, 1),
(36, 'admin', 'permissions', 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `t_setting`
--

CREATE TABLE `t_setting` (
  `id` int(10) NOT NULL,
  `groups` varchar(100) NOT NULL,
  `options` varchar(100) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(100) NOT NULL,
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_setting`
--

INSERT INTO `t_setting` (`id`, `groups`, `options`, `value`, `type`, `content`) VALUES
(1, 'general', 'web_name', 'Official Website BEM ITS 2021', 'text', ''),
(2, 'general', 'web_url', 'http://localhost/bemitscms/', 'text', ''),
(3, 'general', 'web_slogan', 'Kabinet Unjuk Asa', 'otehr', ''),
(4, 'general', 'web_description', 'Website Resmi Badan Eksekutif Mahasiswa ITS 2021', 'other', ''),
(5, 'general', 'web_keyword', 'BEM ITS, KM ITS, Badan Eksekutif Mahasiswa ITS, Kabinet Unjuk Asa, BEM ITS 2021', 'text', ''),
(6, 'general', 'web_author', 'Kementerian Multimedia dan Informasi BEM ITS 2021', 'text', ''),
(7, 'general', 'web_email', 'bem@its.ac.id', 'text', ''),
(8, 'general', 'telephone', '0123456789', 'text', ''),
(9, 'general', 'fax', '000-0000-0000', 'text', ''),
(10, 'general', 'address', 'Jakarta Indonesia', 'other', ''),
(11, 'general', 'map_latitude', '123456789', 'text', ''),
(12, 'general', 'map_longitude', '123456789', 'text', ''),
(13, 'image', 'favicon', 'favicon.png', 'file', ''),
(14, 'image', 'web_logo', 'logo.png', 'file', ''),
(15, 'image', 'web_image', 'web-image.png', 'file', ''),
(16, 'local', 'timezone', 'Asia/Jakarta', 'timezone', ''),
(17, 'local', 'country', 'Indonesia', 'text', ''),
(18, 'mail', 'mail_protocol', 'smtp', 'select', 'smtp|sendmail|mail'),
(19, 'mail', 'mail_hostname', '', 'text', ''),
(20, 'mail', 'mail_username', '', 'text', ''),
(21, 'mail', 'mail_password', '', 'password', ''),
(22, 'mail', 'mail_port', '465', 'text', ''),
(23, 'config', 'maintenance_mode', 'N', 'select', 'N|Y'),
(24, 'config', 'page_item', '5', 'text', ''),
(25, 'config', 'slug_url', 'slug/seotitle', 'slug', ''),
(26, 'config', 'slug_title', 'detailpost', 'text', ''),
(27, 'config', 'post_comment', 'Y', 'select', 'Y|N'),
(28, 'config', 'recaptcha', 'N', 'select', 'Y|N'),
(29, 'config', 'recaptcha_site_key', '6LfJzIoUAAAAAN1-sOfEpehjAE5YAwGiWXT0ydh-', 'text', ''),
(30, 'config', 'recaptcha_secret_key', '6LfJzIoUAAAAAA6eXmTd7oINHnPjOQok-cIQ0rQ-', 'text', ''),
(31, 'other', 'sitemap', '&lt;form id=&quot;_formSiteMapz&quot; method=&quot;POST&quot; action=&quot;&quot; class=&quot;form-inline&quot;&gt;\n  &lt;input id=&quot;_csrf&quot; type=&quot;hidden&quot; name=&quot;csrf_name&quot;/&gt;\n  &lt;div class=&quot;input-group&quot;&gt;\n    &lt;div class=&quot;input-group-prepend&quot;&gt;\n      &lt;span class=&quot;input-group-text&quot;&gt;Frequency&lt;/span&gt;\n    &lt;/div&gt;\n    &lt;select name=&quot;changefreq&quot; class=&quot;form-control&quot;&gt;\n      &lt;option value=&quot;&quot; selected&gt;None&lt;/option&gt;\n      &lt;option value=&quot;always&quot;&gt;Always&lt;/option&gt;\n      &lt;option value=&quot;hourly&quot;&gt;Hourly&lt;/option&gt;\n      &lt;option value=&quot;daily&quot;&gt;Daily&lt;/option&gt;\n      &lt;option value=&quot;weekly&quot;&gt;Weekly&lt;/option&gt;\n      &lt;option value=&quot;monthly&quot;&gt;Monthly&lt;/option&gt;\n      &lt;option value=&quot;yearly&quot;&gt;Yearly&lt;/option&gt;\n      &lt;option value=&quot;never&quot;&gt;Never&lt;/option&gt;\n    &lt;/select&gt;\n    &lt;div class=&quot;input-group-prepend&quot;&gt;\n      &lt;span class=&quot;input-group-text&quot;&gt;Priority&lt;/span&gt;\n    &lt;/div&gt;\n    &lt;select name=&quot;priority&quot; class=&quot;form-control&quot;&gt;\n      &lt;option value=&quot;0.1&quot; selected&gt;0.1&lt;/option&gt;\n      &lt;option value=&quot;0.2&quot;&gt;0.2&lt;/option&gt;\n      &lt;option value=&quot;0.3&quot;&gt;0.3&lt;/option&gt;\n      &lt;option value=&quot;0.4&quot;&gt;0.4&lt;/option&gt;\n      &lt;option value=&quot;0.5&quot;&gt;0.5&lt;/option&gt;\n      &lt;option value=&quot;0.6&quot;&gt;0.6&lt;/option&gt;\n      &lt;option value=&quot;0.7&quot;&gt;0.7&lt;/option&gt;\n      &lt;option value=&quot;0.8&quot;&gt;0.8&lt;/option&gt;\n      &lt;option value=&quot;0.9&quot;&gt;0.9&lt;/option&gt;\n      &lt;option value=&quot;1.0&quot;&gt;1.0&lt;/option&gt;\n    &lt;/select&gt;\n    &lt;div class=&quot;mg-l-5&quot;&gt;\n      &lt;button type=&quot;submit&quot; name=&quot;pk&quot; value=&quot;sitemap&quot; class=&quot;btn btn-success&quot;&gt;Create Site Map&lt;/button&gt;\n    &lt;/div&gt;\n  &lt;/div&gt;\n&lt;/form&gt;\n\n&lt;script&gt;\n  $(document).ready(function(){\n    var _formSiteMapAction = admin_url + a_mod + \'/createsitemap\';\n    $(\'#_formSiteMapz\').attr(\'action\', _formSiteMapAction);\n    $(\'#_csrf\').val(csrfToken);\n  });\n&lt;/script&gt;', 'html', ''),
(32, 'other', 'web_analytics', 'N', 'select', 'Y|N'),
(33, 'other', 'google_analytics', 'your google analytics code', 'text', ''),
(34, 'other', 'web_cache', 'N', 'select', 'N|Y');

-- --------------------------------------------------------

--
-- Table structure for table `t_slug`
--

CREATE TABLE `t_slug` (
  `id` int(5) NOT NULL,
  `title` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_slug`
--

INSERT INTO `t_slug` (`id`, `title`, `slug`) VALUES
(1, 'slug/seotitle', 'slug/([a-z0-9-]+)'),
(2, 'yyyy/seotitle', '([0-9-]+)/([a-z0-9-]+)'),
(3, 'yyyy/mm/seotitle', '([0-9-]+)/([0-9-]+)/([a-z0-9-]+)'),
(4, 'yyyy/mm/dd/seotitle', '([0-9-]+)/([0-9-]+)/([0-9-]+)/([a-z0-9-]+)'),
(5, 'seotitle', '([a-z0-9-]+)');

-- --------------------------------------------------------

--
-- Table structure for table `t_tag`
--

CREATE TABLE `t_tag` (
  `id` int(10) NOT NULL,
  `title` varchar(100) NOT NULL,
  `seotitle` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_tag`
--

INSERT INTO `t_tag` (`id`, `title`, `seotitle`) VALUES
(28, 'HMTL ITS', 'hmtlits'),
(29, 'HIMATEKPAL ITS', 'himatekpalits'),
(30, 'BEM ITS', 'bemits'),
(31, 'BEM FTK', 'bemftk'),
(32, 'HIMASISKAL ITS', 'himasiskalits'),
(33, 'HMPL ITS', 'hmplits'),
(34, 'Adkesma Mendengar', 'adkesmamendengar'),
(35, 'GUYUB KM ITS', 'guyubkmits'),
(36, 'Global News', 'globalnews'),
(37, 'Diskusi Publik', 'diskusipublik'),
(38, 'ILITS 2022', 'ilits2022'),
(39, 'Kajian RUU Perlindungan Data Pribadi', 'kajianruuperlindungandatapribadi');

-- --------------------------------------------------------

--
-- Table structure for table `t_theme`
--

CREATE TABLE `t_theme` (
  `id` int(5) NOT NULL,
  `title` varchar(100) NOT NULL,
  `folder` varchar(100) NOT NULL,
  `active` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_theme`
--

INSERT INTO `t_theme` (`id`, `title`, `folder`, `active`) VALUES
(1, 'Sovi', 'sovi', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `t_timezone`
--

CREATE TABLE `t_timezone` (
  `id` int(5) NOT NULL,
  `value` varchar(100) NOT NULL,
  `text` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_timezone`
--

INSERT INTO `t_timezone` (`id`, `value`, `text`) VALUES
(1, 'Pacific/Midway', '(UTC -11:00) Pacific/Midway'),
(2, 'Pacific/Niue', '(UTC -11:00) Pacific/Niue'),
(3, 'Pacific/Pago_Pago', '(UTC -11:00) Pacific/Pago_Pago'),
(4, 'America/Adak', '(UTC -10:00) America/Adak'),
(5, 'Pacific/Honolulu', '(UTC -10:00) Pacific/Honolulu'),
(6, 'Pacific/Johnston', '(UTC -10:00) Pacific/Johnston'),
(7, 'Pacific/Rarotonga', '(UTC -10:00) Pacific/Rarotonga'),
(8, 'Pacific/Tahiti', '(UTC -10:00) Pacific/Tahiti'),
(9, 'Pacific/Marquesas', '(UTC -09:30) Pacific/Marquesas'),
(10, 'America/Anchorage', '(UTC -09:00) America/Anchorage'),
(11, 'America/Juneau', '(UTC -09:00) America/Juneau'),
(12, 'America/Nome', '(UTC -09:00) America/Nome'),
(13, 'America/Sitka', '(UTC -09:00) America/Sitka'),
(14, 'America/Yakutat', '(UTC -09:00) America/Yakutat'),
(15, 'Pacific/Gambier', '(UTC -09:00) Pacific/Gambier'),
(16, 'America/Dawson', '(UTC -08:00) America/Dawson'),
(17, 'America/Los_Angeles', '(UTC -08:00) America/Los_Angeles'),
(18, 'America/Metlakatla', '(UTC -08:00) America/Metlakatla'),
(19, 'America/Santa_Isabel', '(UTC -08:00) America/Santa_Isabel'),
(20, 'America/Tijuana', '(UTC -08:00) America/Tijuana'),
(21, 'America/Vancouver', '(UTC -08:00) America/Vancouver'),
(22, 'America/Whitehorse', '(UTC -08:00) America/Whitehorse'),
(23, 'Pacific/Pitcairn', '(UTC -08:00) Pacific/Pitcairn'),
(24, 'America/Boise', '(UTC -07:00) America/Boise'),
(25, 'America/Cambridge_Bay', '(UTC -07:00) America/Cambridge_Bay'),
(26, 'America/Chihuahua', '(UTC -07:00) America/Chihuahua'),
(27, 'America/Creston', '(UTC -07:00) America/Creston'),
(28, 'America/Dawson_Creek', '(UTC -07:00) America/Dawson_Creek'),
(29, 'America/Denver', '(UTC -07:00) America/Denver'),
(30, 'America/Edmonton', '(UTC -07:00) America/Edmonton'),
(31, 'America/Hermosillo', '(UTC -07:00) America/Hermosillo'),
(32, 'America/Inuvik', '(UTC -07:00) America/Inuvik'),
(33, 'America/Mazatlan', '(UTC -07:00) America/Mazatlan'),
(34, 'America/Ojinaga', '(UTC -07:00) America/Ojinaga'),
(35, 'America/Phoenix', '(UTC -07:00) America/Phoenix'),
(36, 'America/Yellowknife', '(UTC -07:00) America/Yellowknife'),
(37, 'America/Bahia_Banderas', '(UTC -06:00) America/Bahia_Banderas'),
(38, 'America/Belize', '(UTC -06:00) America/Belize'),
(39, 'America/Cancun', '(UTC -06:00) America/Cancun'),
(40, 'America/Chicago', '(UTC -06:00) America/Chicago'),
(41, 'America/Costa_Rica', '(UTC -06:00) America/Costa_Rica'),
(42, 'America/El_Salvador', '(UTC -06:00) America/El_Salvador'),
(43, 'America/Guatemala', '(UTC -06:00) America/Guatemala'),
(44, 'America/Indiana/Knox', '(UTC -06:00) America/Indiana/Knox'),
(45, 'America/Indiana/Tell_City', '(UTC -06:00) America/Indiana/Tell_City'),
(46, 'America/Managua', '(UTC -06:00) America/Managua'),
(47, 'America/Matamoros', '(UTC -06:00) America/Matamoros'),
(48, 'America/Menominee', '(UTC -06:00) America/Menominee'),
(49, 'America/Merida', '(UTC -06:00) America/Merida'),
(50, 'America/Mexico_City', '(UTC -06:00) America/Mexico_City'),
(51, 'America/Monterrey', '(UTC -06:00) America/Monterrey'),
(52, 'America/North_Dakota/Beulah', '(UTC -06:00) America/North_Dakota/Beulah'),
(53, 'America/North_Dakota/Center', '(UTC -06:00) America/North_Dakota/Center'),
(54, 'America/North_Dakota/New_Salem', '(UTC -06:00) America/North_Dakota/New_Salem'),
(55, 'America/Rainy_River', '(UTC -06:00) America/Rainy_River'),
(56, 'America/Rankin_Inlet', '(UTC -06:00) America/Rankin_Inlet'),
(57, 'America/Regina', '(UTC -06:00) America/Regina'),
(58, 'America/Resolute', '(UTC -06:00) America/Resolute'),
(59, 'America/Swift_Current', '(UTC -06:00) America/Swift_Current'),
(60, 'America/Tegucigalpa', '(UTC -06:00) America/Tegucigalpa'),
(61, 'America/Winnipeg', '(UTC -06:00) America/Winnipeg'),
(62, 'Pacific/Galapagos', '(UTC -06:00) Pacific/Galapagos'),
(63, 'America/Atikokan', '(UTC -05:00) America/Atikokan'),
(64, 'America/Bogota', '(UTC -05:00) America/Bogota'),
(65, 'America/Cayman', '(UTC -05:00) America/Cayman'),
(66, 'America/Detroit', '(UTC -05:00) America/Detroit'),
(67, 'America/Eirunepe', '(UTC -05:00) America/Eirunepe'),
(68, 'America/Grand_Turk', '(UTC -05:00) America/Grand_Turk'),
(69, 'America/Guayaquil', '(UTC -05:00) America/Guayaquil'),
(70, 'America/Havana', '(UTC -05:00) America/Havana'),
(71, 'America/Indiana/Indianapolis', '(UTC -05:00) America/Indiana/Indianapolis'),
(72, 'America/Indiana/Marengo', '(UTC -05:00) America/Indiana/Marengo'),
(73, 'America/Indiana/Petersburg', '(UTC -05:00) America/Indiana/Petersburg'),
(74, 'America/Indiana/Vevay', '(UTC -05:00) America/Indiana/Vevay'),
(75, 'America/Indiana/Vincennes', '(UTC -05:00) America/Indiana/Vincennes'),
(76, 'America/Indiana/Winamac', '(UTC -05:00) America/Indiana/Winamac'),
(77, 'America/Iqaluit', '(UTC -05:00) America/Iqaluit'),
(78, 'America/Jamaica', '(UTC -05:00) America/Jamaica'),
(79, 'America/Kentucky/Louisville', '(UTC -05:00) America/Kentucky/Louisville'),
(80, 'America/Kentucky/Monticello', '(UTC -05:00) America/Kentucky/Monticello'),
(81, 'America/Lima', '(UTC -05:00) America/Lima'),
(82, 'America/Nassau', '(UTC -05:00) America/Nassau'),
(83, 'America/New_York', '(UTC -05:00) America/New_York'),
(84, 'America/Nipigon', '(UTC -05:00) America/Nipigon'),
(85, 'America/Panama', '(UTC -05:00) America/Panama'),
(86, 'America/Pangnirtung', '(UTC -05:00) America/Pangnirtung'),
(87, 'America/Port-au-Prince', '(UTC -05:00) America/Port-au-Prince'),
(88, 'America/Rio_Branco', '(UTC -05:00) America/Rio_Branco'),
(89, 'America/Thunder_Bay', '(UTC -05:00) America/Thunder_Bay'),
(90, 'America/Toronto', '(UTC -05:00) America/Toronto'),
(91, 'Pacific/Easter', '(UTC -05:00) Pacific/Easter'),
(92, 'America/Caracas', '(UTC -04:30) America/Caracas'),
(93, 'America/Anguilla', '(UTC -04:00) America/Anguilla'),
(94, 'America/Antigua', '(UTC -04:00) America/Antigua'),
(95, 'America/Aruba', '(UTC -04:00) America/Aruba'),
(96, 'America/Barbados', '(UTC -04:00) America/Barbados'),
(97, 'America/Blanc-Sablon', '(UTC -04:00) America/Blanc-Sablon'),
(98, 'America/Boa_Vista', '(UTC -04:00) America/Boa_Vista'),
(99, 'America/Curacao', '(UTC -04:00) America/Curacao'),
(100, 'America/Dominica', '(UTC -04:00) America/Dominica'),
(101, 'America/Glace_Bay', '(UTC -04:00) America/Glace_Bay'),
(102, 'America/Goose_Bay', '(UTC -04:00) America/Goose_Bay'),
(103, 'America/Grenada', '(UTC -04:00) America/Grenada'),
(104, 'America/Guadeloupe', '(UTC -04:00) America/Guadeloupe'),
(105, 'America/Guyana', '(UTC -04:00) America/Guyana'),
(106, 'America/Halifax', '(UTC -04:00) America/Halifax'),
(107, 'America/Kralendijk', '(UTC -04:00) America/Kralendijk'),
(108, 'America/La_Paz', '(UTC -04:00) America/La_Paz'),
(109, 'America/Lower_Princes', '(UTC -04:00) America/Lower_Princes'),
(110, 'America/Manaus', '(UTC -04:00) America/Manaus'),
(111, 'America/Marigot', '(UTC -04:00) America/Marigot'),
(112, 'America/Martinique', '(UTC -04:00) America/Martinique'),
(113, 'America/Moncton', '(UTC -04:00) America/Moncton'),
(114, 'America/Montserrat', '(UTC -04:00) America/Montserrat'),
(115, 'America/Port_of_Spain', '(UTC -04:00) America/Port_of_Spain'),
(116, 'America/Porto_Velho', '(UTC -04:00) America/Porto_Velho'),
(117, 'America/Puerto_Rico', '(UTC -04:00) America/Puerto_Rico'),
(118, 'America/Santo_Domingo', '(UTC -04:00) America/Santo_Domingo'),
(119, 'America/St_Barthelemy', '(UTC -04:00) America/St_Barthelemy'),
(120, 'America/St_Kitts', '(UTC -04:00) America/St_Kitts'),
(121, 'America/St_Lucia', '(UTC -04:00) America/St_Lucia'),
(122, 'America/St_Thomas', '(UTC -04:00) America/St_Thomas'),
(123, 'America/St_Vincent', '(UTC -04:00) America/St_Vincent'),
(124, 'America/Thule', '(UTC -04:00) America/Thule'),
(125, 'America/Tortola', '(UTC -04:00) America/Tortola'),
(126, 'Atlantic/Bermuda', '(UTC -04:00) Atlantic/Bermuda'),
(127, 'America/St_Johns', '(UTC -03:30) America/St_Johns'),
(128, 'America/Araguaina', '(UTC -03:00) America/Araguaina'),
(129, 'America/Argentina/Buenos_Aires', '(UTC -03:00) America/Argentina/Buenos_Aires'),
(130, 'America/Argentina/Catamarca', '(UTC -03:00) America/Argentina/Catamarca'),
(131, 'America/Argentina/Cordoba', '(UTC -03:00) America/Argentina/Cordoba'),
(132, 'America/Argentina/Jujuy', '(UTC -03:00) America/Argentina/Jujuy'),
(133, 'America/Argentina/La_Rioja', '(UTC -03:00) America/Argentina/La_Rioja'),
(134, 'America/Argentina/Mendoza', '(UTC -03:00) America/Argentina/Mendoza'),
(135, 'America/Argentina/Rio_Gallegos', '(UTC -03:00) America/Argentina/Rio_Gallegos'),
(136, 'America/Argentina/Salta', '(UTC -03:00) America/Argentina/Salta'),
(137, 'America/Argentina/San_Juan', '(UTC -03:00) America/Argentina/San_Juan'),
(138, 'America/Argentina/San_Luis', '(UTC -03:00) America/Argentina/San_Luis'),
(139, 'America/Argentina/Tucuman', '(UTC -03:00) America/Argentina/Tucuman'),
(140, 'America/Argentina/Ushuaia', '(UTC -03:00) America/Argentina/Ushuaia'),
(141, 'America/Asuncion', '(UTC -03:00) America/Asuncion'),
(142, 'America/Bahia', '(UTC -03:00) America/Bahia'),
(143, 'America/Belem', '(UTC -03:00) America/Belem'),
(144, 'America/Campo_Grande', '(UTC -03:00) America/Campo_Grande'),
(145, 'America/Cayenne', '(UTC -03:00) America/Cayenne'),
(146, 'America/Cuiaba', '(UTC -03:00) America/Cuiaba'),
(147, 'America/Fortaleza', '(UTC -03:00) America/Fortaleza'),
(148, 'America/Godthab', '(UTC -03:00) America/Godthab'),
(149, 'America/Maceio', '(UTC -03:00) America/Maceio'),
(150, 'America/Miquelon', '(UTC -03:00) America/Miquelon'),
(151, 'America/Paramaribo', '(UTC -03:00) America/Paramaribo'),
(152, 'America/Recife', '(UTC -03:00) America/Recife'),
(153, 'America/Santarem', '(UTC -03:00) America/Santarem'),
(154, 'America/Santiago', '(UTC -03:00) America/Santiago'),
(155, 'Antarctica/Palmer', '(UTC -03:00) Antarctica/Palmer'),
(156, 'Antarctica/Rothera', '(UTC -03:00) Antarctica/Rothera'),
(157, 'Atlantic/Stanley', '(UTC -03:00) Atlantic/Stanley'),
(158, 'America/Montevideo', '(UTC -02:00) America/Montevideo'),
(159, 'America/Noronha', '(UTC -02:00) America/Noronha'),
(160, 'America/Sao_Paulo', '(UTC -02:00) America/Sao_Paulo'),
(161, 'Atlantic/South_Georgia', '(UTC -02:00) Atlantic/South_Georgia'),
(162, 'America/Scoresbysund', '(UTC -01:00) America/Scoresbysund'),
(163, 'Atlantic/Azores', '(UTC -01:00) Atlantic/Azores'),
(164, 'Atlantic/Cape_Verde', '(UTC -01:00) Atlantic/Cape_Verde'),
(165, 'Africa/Abidjan', '(UTC -00:00) Africa/Abidjan'),
(166, 'Africa/Accra', '(UTC -00:00) Africa/Accra'),
(167, 'Africa/Bamako', '(UTC -00:00) Africa/Bamako'),
(168, 'Africa/Banjul', '(UTC -00:00) Africa/Banjul'),
(169, 'Africa/Bissau', '(UTC -00:00) Africa/Bissau'),
(170, 'Africa/Casablanca', '(UTC -00:00) Africa/Casablanca'),
(171, 'Africa/Conakry', '(UTC -00:00) Africa/Conakry'),
(172, 'Africa/Dakar', '(UTC -00:00) Africa/Dakar'),
(173, 'Africa/El_Aaiun', '(UTC -00:00) Africa/El_Aaiun'),
(174, 'Africa/Freetown', '(UTC -00:00) Africa/Freetown'),
(175, 'Africa/Lome', '(UTC -00:00) Africa/Lome'),
(176, 'Africa/Monrovia', '(UTC -00:00) Africa/Monrovia'),
(177, 'Africa/Nouakchott', '(UTC -00:00) Africa/Nouakchott'),
(178, 'Africa/Ouagadougou', '(UTC -00:00) Africa/Ouagadougou'),
(179, 'Africa/Sao_Tome', '(UTC -00:00) Africa/Sao_Tome'),
(180, 'America/Danmarkshavn', '(UTC -00:00) America/Danmarkshavn'),
(181, 'Antarctica/Troll', '(UTC -00:00) Antarctica/Troll'),
(182, 'Atlantic/Canary', '(UTC -00:00) Atlantic/Canary'),
(183, 'Atlantic/Faroe', '(UTC -00:00) Atlantic/Faroe'),
(184, 'Atlantic/Madeira', '(UTC -00:00) Atlantic/Madeira'),
(185, 'Atlantic/Reykjavik', '(UTC -00:00) Atlantic/Reykjavik'),
(186, 'Atlantic/St_Helena', '(UTC -00:00) Atlantic/St_Helena'),
(187, 'Europe/Dublin', '(UTC -00:00) Europe/Dublin'),
(188, 'Europe/Guernsey', '(UTC -00:00) Europe/Guernsey'),
(189, 'Europe/Isle_of_Man', '(UTC -00:00) Europe/Isle_of_Man'),
(190, 'Europe/Jersey', '(UTC -00:00) Europe/Jersey'),
(191, 'Europe/Lisbon', '(UTC -00:00) Europe/Lisbon'),
(192, 'Europe/London', '(UTC -00:00) Europe/London'),
(193, 'UTC', '(UTC -00:00) UTC'),
(194, 'Africa/Algiers', '(UTC +01:00) Africa/Algiers'),
(195, 'Africa/Bangui', '(UTC +01:00) Africa/Bangui'),
(196, 'Africa/Brazzaville', '(UTC +01:00) Africa/Brazzaville'),
(197, 'Africa/Ceuta', '(UTC +01:00) Africa/Ceuta'),
(198, 'Africa/Douala', '(UTC +01:00) Africa/Douala'),
(199, 'Africa/Kinshasa', '(UTC +01:00) Africa/Kinshasa'),
(200, 'Africa/Lagos', '(UTC +01:00) Africa/Lagos'),
(201, 'Africa/Libreville', '(UTC +01:00) Africa/Libreville'),
(202, 'Africa/Luanda', '(UTC +01:00) Africa/Luanda'),
(203, 'Africa/Malabo', '(UTC +01:00) Africa/Malabo'),
(204, 'Africa/Ndjamena', '(UTC +01:00) Africa/Ndjamena'),
(205, 'Africa/Niamey', '(UTC +01:00) Africa/Niamey'),
(206, 'Africa/Porto-Novo', '(UTC +01:00) Africa/Porto-Novo'),
(207, 'Africa/Tunis', '(UTC +01:00) Africa/Tunis'),
(208, 'Arctic/Longyearbyen', '(UTC +01:00) Arctic/Longyearbyen'),
(209, 'Europe/Amsterdam', '(UTC +01:00) Europe/Amsterdam'),
(210, 'Europe/Andorra', '(UTC +01:00) Europe/Andorra'),
(211, 'Europe/Belgrade', '(UTC +01:00) Europe/Belgrade'),
(212, 'Europe/Berlin', '(UTC +01:00) Europe/Berlin'),
(213, 'Europe/Bratislava', '(UTC +01:00) Europe/Bratislava'),
(214, 'Europe/Brussels', '(UTC +01:00) Europe/Brussels'),
(215, 'Europe/Budapest', '(UTC +01:00) Europe/Budapest'),
(216, 'Europe/Busingen', '(UTC +01:00) Europe/Busingen'),
(217, 'Europe/Copenhagen', '(UTC +01:00) Europe/Copenhagen'),
(218, 'Europe/Gibraltar', '(UTC +01:00) Europe/Gibraltar'),
(219, 'Europe/Ljubljana', '(UTC +01:00) Europe/Ljubljana'),
(220, 'Europe/Luxembourg', '(UTC +01:00) Europe/Luxembourg'),
(221, 'Europe/Madrid', '(UTC +01:00) Europe/Madrid'),
(222, 'Europe/Malta', '(UTC +01:00) Europe/Malta'),
(223, 'Europe/Monaco', '(UTC +01:00) Europe/Monaco'),
(224, 'Europe/Oslo', '(UTC +01:00) Europe/Oslo'),
(225, 'Europe/Paris', '(UTC +01:00) Europe/Paris'),
(226, 'Europe/Podgorica', '(UTC +01:00) Europe/Podgorica'),
(227, 'Europe/Prague', '(UTC +01:00) Europe/Prague'),
(228, 'Europe/Rome', '(UTC +01:00) Europe/Rome'),
(229, 'Europe/San_Marino', '(UTC +01:00) Europe/San_Marino'),
(230, 'Europe/Sarajevo', '(UTC +01:00) Europe/Sarajevo'),
(231, 'Europe/Skopje', '(UTC +01:00) Europe/Skopje'),
(232, 'Europe/Stockholm', '(UTC +01:00) Europe/Stockholm'),
(233, 'Europe/Tirane', '(UTC +01:00) Europe/Tirane'),
(234, 'Europe/Vaduz', '(UTC +01:00) Europe/Vaduz'),
(235, 'Europe/Vatican', '(UTC +01:00) Europe/Vatican'),
(236, 'Europe/Vienna', '(UTC +01:00) Europe/Vienna'),
(237, 'Europe/Warsaw', '(UTC +01:00) Europe/Warsaw'),
(238, 'Europe/Zagreb', '(UTC +01:00) Europe/Zagreb'),
(239, 'Europe/Zurich', '(UTC +01:00) Europe/Zurich'),
(240, 'Africa/Blantyre', '(UTC +02:00) Africa/Blantyre'),
(241, 'Africa/Bujumbura', '(UTC +02:00) Africa/Bujumbura'),
(242, 'Africa/Cairo', '(UTC +02:00) Africa/Cairo'),
(243, 'Africa/Gaborone', '(UTC +02:00) Africa/Gaborone'),
(244, 'Africa/Harare', '(UTC +02:00) Africa/Harare'),
(245, 'Africa/Johannesburg', '(UTC +02:00) Africa/Johannesburg'),
(246, 'Africa/Kigali', '(UTC +02:00) Africa/Kigali'),
(247, 'Africa/Lubumbashi', '(UTC +02:00) Africa/Lubumbashi'),
(248, 'Africa/Lusaka', '(UTC +02:00) Africa/Lusaka'),
(249, 'Africa/Maputo', '(UTC +02:00) Africa/Maputo'),
(250, 'Africa/Maseru', '(UTC +02:00) Africa/Maseru'),
(251, 'Africa/Mbabane', '(UTC +02:00) Africa/Mbabane'),
(252, 'Africa/Tripoli', '(UTC +02:00) Africa/Tripoli'),
(253, 'Africa/Windhoek', '(UTC +02:00) Africa/Windhoek'),
(254, 'Asia/Amman', '(UTC +02:00) Asia/Amman'),
(255, 'Asia/Beirut', '(UTC +02:00) Asia/Beirut'),
(256, 'Asia/Damascus', '(UTC +02:00) Asia/Damascus'),
(257, 'Asia/Gaza', '(UTC +02:00) Asia/Gaza'),
(258, 'Asia/Hebron', '(UTC +02:00) Asia/Hebron'),
(259, 'Asia/Jerusalem', '(UTC +02:00) Asia/Jerusalem'),
(260, 'Asia/Nicosia', '(UTC +02:00) Asia/Nicosia'),
(261, 'Europe/Athens', '(UTC +02:00) Europe/Athens'),
(262, 'Europe/Bucharest', '(UTC +02:00) Europe/Bucharest'),
(263, 'Europe/Chisinau', '(UTC +02:00) Europe/Chisinau'),
(264, 'Europe/Helsinki', '(UTC +02:00) Europe/Helsinki'),
(265, 'Europe/Istanbul', '(UTC +02:00) Europe/Istanbul'),
(266, 'Europe/Kiev', '(UTC +02:00) Europe/Kiev'),
(267, 'Europe/Mariehamn', '(UTC +02:00) Europe/Mariehamn'),
(268, 'Europe/Riga', '(UTC +02:00) Europe/Riga'),
(269, 'Europe/Sofia', '(UTC +02:00) Europe/Sofia'),
(270, 'Europe/Tallinn', '(UTC +02:00) Europe/Tallinn'),
(271, 'Europe/Uzhgorod', '(UTC +02:00) Europe/Uzhgorod'),
(272, 'Europe/Vilnius', '(UTC +02:00) Europe/Vilnius'),
(273, 'Europe/Zaporozhye', '(UTC +02:00) Europe/Zaporozhye'),
(274, 'Africa/Addis_Ababa', '(UTC +03:00) Africa/Addis_Ababa'),
(275, 'Africa/Asmara', '(UTC +03:00) Africa/Asmara'),
(276, 'Africa/Dar_es_Salaam', '(UTC +03:00) Africa/Dar_es_Salaam'),
(277, 'Africa/Djibouti', '(UTC +03:00) Africa/Djibouti'),
(278, 'Africa/Juba', '(UTC +03:00) Africa/Juba'),
(279, 'Africa/Kampala', '(UTC +03:00) Africa/Kampala'),
(280, 'Africa/Khartoum', '(UTC +03:00) Africa/Khartoum'),
(281, 'Africa/Mogadishu', '(UTC +03:00) Africa/Mogadishu'),
(282, 'Africa/Nairobi', '(UTC +03:00) Africa/Nairobi'),
(283, 'Antarctica/Syowa', '(UTC +03:00) Antarctica/Syowa'),
(284, 'Asia/Aden', '(UTC +03:00) Asia/Aden'),
(285, 'Asia/Baghdad', '(UTC +03:00) Asia/Baghdad'),
(286, 'Asia/Bahrain', '(UTC +03:00) Asia/Bahrain'),
(287, 'Asia/Kuwait', '(UTC +03:00) Asia/Kuwait'),
(288, 'Asia/Qatar', '(UTC +03:00) Asia/Qatar'),
(289, 'Asia/Riyadh', '(UTC +03:00) Asia/Riyadh'),
(290, 'Europe/Kaliningrad', '(UTC +03:00) Europe/Kaliningrad'),
(291, 'Europe/Minsk', '(UTC +03:00) Europe/Minsk'),
(292, 'Indian/Antananarivo', '(UTC +03:00) Indian/Antananarivo'),
(293, 'Indian/Comoro', '(UTC +03:00) Indian/Comoro'),
(294, 'Indian/Mayotte', '(UTC +03:00) Indian/Mayotte'),
(295, 'Asia/Tehran', '(UTC +03:30) Asia/Tehran'),
(296, 'Asia/Baku', '(UTC +04:00) Asia/Baku'),
(297, 'Asia/Dubai', '(UTC +04:00) Asia/Dubai'),
(298, 'Asia/Muscat', '(UTC +04:00) Asia/Muscat'),
(299, 'Asia/Tbilisi', '(UTC +04:00) Asia/Tbilisi'),
(300, 'Asia/Yerevan', '(UTC +04:00) Asia/Yerevan'),
(301, 'Europe/Moscow', '(UTC +04:00) Europe/Moscow'),
(302, 'Europe/Samara', '(UTC +04:00) Europe/Samara'),
(303, 'Europe/Simferopol', '(UTC +04:00) Europe/Simferopol'),
(304, 'Europe/Volgograd', '(UTC +04:00) Europe/Volgograd'),
(305, 'Indian/Mahe', '(UTC +04:00) Indian/Mahe'),
(306, 'Indian/Mauritius', '(UTC +04:00) Indian/Mauritius'),
(307, 'Indian/Reunion', '(UTC +04:00) Indian/Reunion'),
(308, 'Asia/Kabul', '(UTC +04:30) Asia/Kabul'),
(309, 'Antarctica/Mawson', '(UTC +05:00) Antarctica/Mawson'),
(310, 'Asia/Aqtau', '(UTC +05:00) Asia/Aqtau'),
(311, 'Asia/Aqtobe', '(UTC +05:00) Asia/Aqtobe'),
(312, 'Asia/Ashgabat', '(UTC +05:00) Asia/Ashgabat'),
(313, 'Asia/Dushanbe', '(UTC +05:00) Asia/Dushanbe'),
(314, 'Asia/Karachi', '(UTC +05:00) Asia/Karachi'),
(315, 'Asia/Oral', '(UTC +05:00) Asia/Oral'),
(316, 'Asia/Samarkand', '(UTC +05:00) Asia/Samarkand'),
(317, 'Asia/Tashkent', '(UTC +05:00) Asia/Tashkent'),
(318, 'Indian/Kerguelen', '(UTC +05:00) Indian/Kerguelen'),
(319, 'Indian/Maldives', '(UTC +05:00) Indian/Maldives'),
(320, 'Asia/Colombo', '(UTC +05:30) Asia/Colombo'),
(321, 'Asia/Kolkata', '(UTC +05:30) Asia/Kolkata'),
(322, 'Asia/Kathmandu', '(UTC +05:45) Asia/Kathmandu'),
(323, 'Antarctica/Vostok', '(UTC +06:00) Antarctica/Vostok'),
(324, 'Asia/Almaty', '(UTC +06:00) Asia/Almaty'),
(325, 'Asia/Bishkek', '(UTC +06:00) Asia/Bishkek'),
(326, 'Asia/Dhaka', '(UTC +06:00) Asia/Dhaka'),
(327, 'Asia/Qyzylorda', '(UTC +06:00) Asia/Qyzylorda'),
(328, 'Asia/Thimphu', '(UTC +06:00) Asia/Thimphu'),
(329, 'Asia/Yekaterinburg', '(UTC +06:00) Asia/Yekaterinburg'),
(330, 'Indian/Chagos', '(UTC +06:00) Indian/Chagos'),
(331, 'Asia/Rangoon', '(UTC +06:30) Asia/Rangoon'),
(332, 'Indian/Cocos', '(UTC +06:30) Indian/Cocos'),
(333, 'Antarctica/Davis', '(UTC +07:00) Antarctica/Davis'),
(334, 'Asia/Bangkok', '(UTC +07:00) Asia/Bangkok'),
(335, 'Asia/Ho_Chi_Minh', '(UTC +07:00) Asia/Ho_Chi_Minh'),
(336, 'Asia/Hovd', '(UTC +07:00) Asia/Hovd'),
(337, 'Asia/Jakarta', '(UTC +07:00) Asia/Jakarta'),
(338, 'Asia/Novokuznetsk', '(UTC +07:00) Asia/Novokuznetsk'),
(339, 'Asia/Novosibirsk', '(UTC +07:00) Asia/Novosibirsk'),
(340, 'Asia/Omsk', '(UTC +07:00) Asia/Omsk'),
(341, 'Asia/Phnom_Penh', '(UTC +07:00) Asia/Phnom_Penh'),
(342, 'Asia/Pontianak', '(UTC +07:00) Asia/Pontianak'),
(343, 'Asia/Vientiane', '(UTC +07:00) Asia/Vientiane'),
(344, 'Indian/Christmas', '(UTC +07:00) Indian/Christmas'),
(345, 'Antarctica/Casey', '(UTC +08:00) Antarctica/Casey'),
(346, 'Asia/Brunei', '(UTC +08:00) Asia/Brunei'),
(347, 'Asia/Choibalsan', '(UTC +08:00) Asia/Choibalsan'),
(348, 'Asia/Chongqing', '(UTC +08:00) Asia/Chongqing'),
(349, 'Asia/Harbin', '(UTC +08:00) Asia/Harbin'),
(350, 'Asia/Hong_Kong', '(UTC +08:00) Asia/Hong_Kong'),
(351, 'Asia/Kashgar', '(UTC +08:00) Asia/Kashgar'),
(352, 'Asia/Krasnoyarsk', '(UTC +08:00) Asia/Krasnoyarsk'),
(353, 'Asia/Kuala_Lumpur', '(UTC +08:00) Asia/Kuala_Lumpur'),
(354, 'Asia/Kuching', '(UTC +08:00) Asia/Kuching'),
(355, 'Asia/Macau', '(UTC +08:00) Asia/Macau'),
(356, 'Asia/Makassar', '(UTC +08:00) Asia/Makassar'),
(357, 'Asia/Manila', '(UTC +08:00) Asia/Manila'),
(358, 'Asia/Shanghai', '(UTC +08:00) Asia/Shanghai'),
(359, 'Asia/Singapore', '(UTC +08:00) Asia/Singapore'),
(360, 'Asia/Taipei', '(UTC +08:00) Asia/Taipei'),
(361, 'Asia/Ulaanbaatar', '(UTC +08:00) Asia/Ulaanbaatar'),
(362, 'Asia/Urumqi', '(UTC +08:00) Asia/Urumqi'),
(363, 'Australia/Perth', '(UTC +08:00) Australia/Perth'),
(364, 'Australia/Eucla', '(UTC +08:45) Australia/Eucla'),
(365, 'Asia/Dili', '(UTC +09:00) Asia/Dili'),
(366, 'Asia/Irkutsk', '(UTC +09:00) Asia/Irkutsk'),
(367, 'Asia/Jayapura', '(UTC +09:00) Asia/Jayapura'),
(368, 'Asia/Pyongyang', '(UTC +09:00) Asia/Pyongyang'),
(369, 'Asia/Seoul', '(UTC +09:00) Asia/Seoul'),
(370, 'Asia/Tokyo', '(UTC +09:00) Asia/Tokyo'),
(371, 'Pacific/Palau', '(UTC +09:00) Pacific/Palau'),
(372, 'Australia/Darwin', '(UTC +09:30) Australia/Darwin'),
(373, 'Antarctica/DumontDUrville', '(UTC +10:00) Antarctica/DumontDUrville'),
(374, 'Asia/Khandyga', '(UTC +10:00) Asia/Khandyga'),
(375, 'Asia/Yakutsk', '(UTC +10:00) Asia/Yakutsk'),
(376, 'Australia/Brisbane', '(UTC +10:00) Australia/Brisbane'),
(377, 'Australia/Lindeman', '(UTC +10:00) Australia/Lindeman'),
(378, 'Pacific/Chuuk', '(UTC +10:00) Pacific/Chuuk'),
(379, 'Pacific/Guam', '(UTC +10:00) Pacific/Guam'),
(380, 'Pacific/Port_Moresby', '(UTC +10:00) Pacific/Port_Moresby'),
(381, 'Pacific/Saipan', '(UTC +10:00) Pacific/Saipan'),
(382, 'Australia/Adelaide', '(UTC +10:30) Australia/Adelaide'),
(383, 'Australia/Broken_Hill', '(UTC +10:30) Australia/Broken_Hill'),
(384, 'Antarctica/Macquarie', '(UTC +11:00) Antarctica/Macquarie'),
(385, 'Asia/Sakhalin', '(UTC +11:00) Asia/Sakhalin'),
(386, 'Asia/Ust-Nera', '(UTC +11:00) Asia/Ust-Nera'),
(387, 'Asia/Vladivostok', '(UTC +11:00) Asia/Vladivostok'),
(388, 'Australia/Currie', '(UTC +11:00) Australia/Currie'),
(389, 'Australia/Hobart', '(UTC +11:00) Australia/Hobart'),
(390, 'Australia/Lord_Howe', '(UTC +11:00) Australia/Lord_Howe'),
(391, 'Australia/Melbourne', '(UTC +11:00) Australia/Melbourne'),
(392, 'Australia/Sydney', '(UTC +11:00) Australia/Sydney'),
(393, 'Pacific/Efate', '(UTC +11:00) Pacific/Efate'),
(394, 'Pacific/Guadalcanal', '(UTC +11:00) Pacific/Guadalcanal'),
(395, 'Pacific/Kosrae', '(UTC +11:00) Pacific/Kosrae'),
(396, 'Pacific/Noumea', '(UTC +11:00) Pacific/Noumea'),
(397, 'Pacific/Pohnpei', '(UTC +11:00) Pacific/Pohnpei'),
(398, 'Pacific/Norfolk', '(UTC +11:30) Pacific/Norfolk'),
(399, 'Asia/Anadyr', '(UTC +12:00) Asia/Anadyr'),
(400, 'Asia/Kamchatka', '(UTC +12:00) Asia/Kamchatka'),
(401, 'Asia/Magadan', '(UTC +12:00) Asia/Magadan'),
(402, 'Pacific/Fiji', '(UTC +12:00) Pacific/Fiji'),
(403, 'Pacific/Funafuti', '(UTC +12:00) Pacific/Funafuti'),
(404, 'Pacific/Kwajalein', '(UTC +12:00) Pacific/Kwajalein'),
(405, 'Pacific/Majuro', '(UTC +12:00) Pacific/Majuro'),
(406, 'Pacific/Nauru', '(UTC +12:00) Pacific/Nauru'),
(407, 'Pacific/Tarawa', '(UTC +12:00) Pacific/Tarawa'),
(408, 'Pacific/Wake', '(UTC +12:00) Pacific/Wake'),
(409, 'Pacific/Wallis', '(UTC +12:00) Pacific/Wallis'),
(410, 'Antarctica/McMurdo', '(UTC +13:00) Antarctica/McMurdo'),
(411, 'Pacific/Auckland', '(UTC +13:00) Pacific/Auckland'),
(412, 'Pacific/Enderbury', '(UTC +13:00) Pacific/Enderbury'),
(413, 'Pacific/Fakaofo', '(UTC +13:00) Pacific/Fakaofo'),
(414, 'Pacific/Tongatapu', '(UTC +13:00) Pacific/Tongatapu'),
(415, 'Pacific/Chatham', '(UTC +13:45) Pacific/Chatham'),
(416, 'Pacific/Apia', '(UTC +14:00) Pacific/Apia'),
(417, 'Pacific/Kiritimati', '(UTC +14:00) Pacific/Kiritimati');

-- --------------------------------------------------------

--
-- Table structure for table `t_user`
--

CREATE TABLE `t_user` (
  `id` int(5) NOT NULL,
  `key_group` varchar(10) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `gender` enum('M','F') NOT NULL DEFAULT 'M',
  `birthday` date NOT NULL DEFAULT '1999-01-01',
  `about` text NOT NULL,
  `address` text NOT NULL,
  `tlpn` varchar(50) NOT NULL,
  `photo` varchar(255) NOT NULL DEFAULT 'avatar.jpg',
  `active` enum('Y','N') NOT NULL DEFAULT 'N',
  `activation_key` varchar(255) NOT NULL DEFAULT '0',
  `forgot_key` varchar(255) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_user`
--

INSERT INTO `t_user` (`id`, `key_group`, `username`, `password`, `email`, `name`, `gender`, `birthday`, `about`, `address`, `tlpn`, `photo`, `active`, `activation_key`, `forgot_key`) VALUES
(1, 'root', 'adminbemits', 'a23c8054812d1c676633a0caf351940bf93a0cb272a73d911025b242b09bc2c97ddec931db8d45075d7a4b60a56d9a58cf0fdf8c5134f3afd5d8f6fff155143b9Hfg5C5RWxii7TMRt0lBb0tVOizN5IDpciYIIKbzw7g=', 'vivatpress@gmail.com', 'Super Admin', 'M', '2021-11-24', 'Lorem ipsum dolor sit amet consectetur adipiscing elit fusce eget turpis pulvinar interdum tellus blandit imperdiet velit.', 'Lorem ipsum dolor sit amet consectetur adipiscing elit fusce eget turpis pulvinar interdum tellus blandit imperdiet velit.', '08123456789', '229181d28424c6a888a69d96c1beaf05.jpg', 'Y', '0', '0');

-- --------------------------------------------------------

--
-- Table structure for table `t_user_group`
--

CREATE TABLE `t_user_group` (
  `id` int(5) NOT NULL,
  `pk` varchar(10) NOT NULL,
  `title` varchar(100) NOT NULL,
  `group` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_user_group`
--

INSERT INTO `t_user_group` (`id`, `pk`, `title`, `group`) VALUES
(1, 'root', 'Root', 'root'),
(2, 'admin', 'Admin', 'admin'),
(3, 'guest', 'Guest', 'guest');

-- --------------------------------------------------------

--
-- Table structure for table `t_visitor`
--

CREATE TABLE `t_visitor` (
  `id` int(50) NOT NULL,
  `ip` varchar(50) NOT NULL,
  `os` varchar(255) NOT NULL,
  `platform` varchar(255) NOT NULL,
  `browser` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `hits` int(50) NOT NULL,
  `online` int(50) NOT NULL,
  `url` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `t_album`
--
ALTER TABLE `t_album`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_category`
--
ALTER TABLE `t_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_comment`
--
ALTER TABLE `t_comment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_component`
--
ALTER TABLE `t_component`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_gallery`
--
ALTER TABLE `t_gallery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_mail`
--
ALTER TABLE `t_mail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_menu`
--
ALTER TABLE `t_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_menu_group`
--
ALTER TABLE `t_menu_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_mod`
--
ALTER TABLE `t_mod`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_pages`
--
ALTER TABLE `t_pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_post`
--
ALTER TABLE `t_post`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_roles`
--
ALTER TABLE `t_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_setting`
--
ALTER TABLE `t_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_slug`
--
ALTER TABLE `t_slug`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_tag`
--
ALTER TABLE `t_tag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_theme`
--
ALTER TABLE `t_theme`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_timezone`
--
ALTER TABLE `t_timezone`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_user`
--
ALTER TABLE `t_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_user_group`
--
ALTER TABLE `t_user_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_visitor`
--
ALTER TABLE `t_visitor`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `t_album`
--
ALTER TABLE `t_album`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_category`
--
ALTER TABLE `t_category`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `t_comment`
--
ALTER TABLE `t_comment`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_component`
--
ALTER TABLE `t_component`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_gallery`
--
ALTER TABLE `t_gallery`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_mail`
--
ALTER TABLE `t_mail`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_menu`
--
ALTER TABLE `t_menu`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `t_menu_group`
--
ALTER TABLE `t_menu_group`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `t_mod`
--
ALTER TABLE `t_mod`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `t_pages`
--
ALTER TABLE `t_pages`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `t_post`
--
ALTER TABLE `t_post`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `t_roles`
--
ALTER TABLE `t_roles`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `t_setting`
--
ALTER TABLE `t_setting`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `t_slug`
--
ALTER TABLE `t_slug`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `t_tag`
--
ALTER TABLE `t_tag`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `t_theme`
--
ALTER TABLE `t_theme`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `t_timezone`
--
ALTER TABLE `t_timezone`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=418;

--
-- AUTO_INCREMENT for table `t_user`
--
ALTER TABLE `t_user`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `t_user_group`
--
ALTER TABLE `t_user_group`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `t_visitor`
--
ALTER TABLE `t_visitor`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
