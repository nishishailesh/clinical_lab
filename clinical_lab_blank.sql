-- MySQL dump 10.17  Distrib 10.3.18-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: clinical_lab
-- ------------------------------------------------------
-- Server version	10.3.18-MariaDB-0+deb10u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `examination`
--

DROP TABLE IF EXISTS `examination`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `examination` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_bin NOT NULL,
  `sample_requirement` varchar(300) COLLATE utf8_bin NOT NULL,
  `description` varchar(300) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `examination_property_blob`
--

DROP TABLE IF EXISTS `examination_property_blob`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `examination_property_blob` (
  `id` int(11) NOT NULL,
  `examination_id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_bin NOT NULL,
  `description` varchar(300) COLLATE utf8_bin NOT NULL,
  `sequence` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `examination_id` (`examination_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `examination_property_decimal`
--

DROP TABLE IF EXISTS `examination_property_decimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `examination_property_decimal` (
  `id` int(11) NOT NULL,
  `examination_id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_bin NOT NULL,
  `description` varchar(300) COLLATE utf8_bin NOT NULL,
  `sequence` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `examination_id` (`examination_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `examination_property_text`
--

DROP TABLE IF EXISTS `examination_property_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `examination_property_text` (
  `id` int(11) NOT NULL,
  `examination_id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_bin NOT NULL,
  `description` varchar(300) COLLATE utf8_bin NOT NULL,
  `sequence` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `examination_id` (`examination_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `examination_result_blob`
--

DROP TABLE IF EXISTS `examination_result_blob`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `examination_result_blob` (
  `sample_id` bigint(20) NOT NULL,
  `examination_property_id` int(11) NOT NULL,
  `result` mediumblob NOT NULL,
  PRIMARY KEY (`sample_id`,`examination_property_id`),
  KEY `examination_property_id` (`examination_property_id`),
  CONSTRAINT `examination_result_blob_ibfk_1` FOREIGN KEY (`sample_id`) REFERENCES `sample` (`id`),
  CONSTRAINT `examination_result_blob_ibfk_2` FOREIGN KEY (`examination_property_id`) REFERENCES `examination_property_blob` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `examination_result_decimal`
--

DROP TABLE IF EXISTS `examination_result_decimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `examination_result_decimal` (
  `sample_id` bigint(20) NOT NULL,
  `examination_property_id` int(11) NOT NULL,
  `result` decimal(10,2) NOT NULL,
  PRIMARY KEY (`sample_id`,`examination_property_id`),
  KEY `examination_property_id` (`examination_property_id`),
  CONSTRAINT `examination_result_decimal_ibfk_1` FOREIGN KEY (`sample_id`) REFERENCES `sample` (`id`),
  CONSTRAINT `examination_result_decimal_ibfk_2` FOREIGN KEY (`examination_property_id`) REFERENCES `examination_property_decimal` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `examination_result_text`
--

DROP TABLE IF EXISTS `examination_result_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `examination_result_text` (
  `sample_id` bigint(20) NOT NULL,
  `examination_property_id` int(11) NOT NULL,
  `result` varchar(300) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`sample_id`,`examination_property_id`),
  KEY `examination_property_id` (`examination_property_id`),
  CONSTRAINT `examination_result_text_ibfk_1` FOREIGN KEY (`sample_id`) REFERENCES `sample` (`id`),
  CONSTRAINT `examination_result_text_ibfk_2` FOREIGN KEY (`examination_property_id`) REFERENCES `examination_property_text` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `result`
--

DROP TABLE IF EXISTS `result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `result` (
  `sample_id` bigint(20) NOT NULL,
  `examination_id` int(11) NOT NULL,
  `result` varchar(5000) NOT NULL,
  `uniq` varchar(100) NOT NULL,
  PRIMARY KEY (`sample_id`,`examination_id`,`uniq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sample`
--

DROP TABLE IF EXISTS `sample`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sample` (
  `id` bigint(20) NOT NULL,
  `patient_id` varchar(50) COLLATE utf8_bin NOT NULL,
  `description` varchar(300) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user` int(11) NOT NULL,
  `password` varchar(1000) NOT NULL,
  `expirydate` date NOT NULL,
  PRIMARY KEY (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-04  7:47:45
