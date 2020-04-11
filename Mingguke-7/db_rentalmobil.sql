-- MySQL dump 10.13  Distrib 5.5.8, for Win32 (x86)
--
-- Host: localhost    Database: db_rentalmobil
-- ------------------------------------------------------
-- Server version	5.5.8

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `kendaraan`
--

DROP TABLE IF EXISTS `kendaraan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kendaraan` (
  `no_plat` int(20) NOT NULL,
  `tahun` date DEFAULT NULL,
  `tarif` float DEFAULT NULL,
  `status` char(10) DEFAULT NULL,
  `id_tipe` int(20) DEFAULT NULL,
  PRIMARY KEY (`no_plat`),
  KEY `id_tipe` (`id_tipe`),
  CONSTRAINT `kendaraan_ibfk_1` FOREIGN KEY (`id_tipe`) REFERENCES `tipe_kendaraan` (`id_tipe`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kendaraan`
--

LOCK TABLES `kendaraan` WRITE;
/*!40000 ALTER TABLE `kendaraan` DISABLE KEYS */;
/*!40000 ALTER TABLE `kendaraan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pelanggan`
--

DROP TABLE IF EXISTS `pelanggan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pelanggan` (
  `no_ktp` int(20) NOT NULL,
  `nm_plgn` char(50) DEFAULT NULL,
  `alamat_plgn` tinytext,
  `tlp_plgn` int(20) DEFAULT NULL,
  PRIMARY KEY (`no_ktp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelanggan`
--

LOCK TABLES `pelanggan` WRITE;
/*!40000 ALTER TABLE `pelanggan` DISABLE KEYS */;
/*!40000 ALTER TABLE `pelanggan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sopir`
--

DROP TABLE IF EXISTS `sopir`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sopir` (
  `id_sopir` int(20) NOT NULL,
  `nama_sopir` char(50) DEFAULT NULL,
  `alamat` tinytext,
  `telp_sopir` int(20) DEFAULT NULL,
  `no_sim` char(20) DEFAULT NULL,
  `tarif_sopir` float DEFAULT NULL,
  PRIMARY KEY (`id_sopir`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sopir`
--

LOCK TABLES `sopir` WRITE;
/*!40000 ALTER TABLE `sopir` DISABLE KEYS */;
/*!40000 ALTER TABLE `sopir` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipe_kendaraan`
--

DROP TABLE IF EXISTS `tipe_kendaraan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipe_kendaraan` (
  `id_tipe` int(20) NOT NULL,
  `tipe_kendaraan` char(20) DEFAULT NULL,
  PRIMARY KEY (`id_tipe`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipe_kendaraan`
--

LOCK TABLES `tipe_kendaraan` WRITE;
/*!40000 ALTER TABLE `tipe_kendaraan` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipe_kendaraan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaksi`
--

DROP TABLE IF EXISTS `transaksi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaksi` (
  `no_transaksi` int(20) NOT NULL,
  `tgl_pesan` date DEFAULT NULL,
  `tgl_pinjam` date DEFAULT NULL,
  `tgl_kembalirencana` date DEFAULT NULL,
  `jam_kembalirencana` date DEFAULT NULL,
  `tgl_kembalirealisasi` date DEFAULT NULL,
  `jam_kembalirealisasi` date DEFAULT NULL,
  `denda` float DEFAULT NULL,
  `km_pinjam` float DEFAULT NULL,
  `km_kembali` float DEFAULT NULL,
  `bbm_pinjam` float DEFAULT NULL,
  `bbm_kembali` float DEFAULT NULL,
  `kondisimobil_pinjam` char(10) DEFAULT NULL,
  `kondisimobil_kembali` char(10) DEFAULT NULL,
  `kerusakan` char(100) DEFAULT NULL,
  `biaya_kerusakan` float DEFAULT NULL,
  `biaya_bbm` float DEFAULT NULL,
  `no_plat` int(20) DEFAULT NULL,
  `id_sopir` int(20) DEFAULT NULL,
  `no_ktp` int(20) DEFAULT NULL,
  PRIMARY KEY (`no_transaksi`),
  KEY `no_plat` (`no_plat`),
  KEY `id_sopir` (`id_sopir`),
  KEY `no_ktp` (`no_ktp`),
  CONSTRAINT `transaksi_ibfk_3` FOREIGN KEY (`no_ktp`) REFERENCES `pelanggan` (`no_ktp`),
  CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`no_plat`) REFERENCES `kendaraan` (`no_plat`),
  CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`id_sopir`) REFERENCES `sopir` (`id_sopir`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaksi`
--

LOCK TABLES `transaksi` WRITE;
/*!40000 ALTER TABLE `transaksi` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaksi` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-11 12:13:31
