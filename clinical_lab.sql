-- MySQL dump 10.16  Distrib 10.1.26-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: clinical_lab
-- ------------------------------------------------------
-- Server version	10.1.26-MariaDB-0+deb9u1

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
-- Dumping data for table `examination`
--

LOCK TABLES `examination` WRITE;
/*!40000 ALTER TABLE `examination` DISABLE KEYS */;
INSERT INTO `examination` VALUES (1,'Glucose','primary:blood;preservative:none,heparin,fluoride with EDTA;',''),(2,'Complete Blood Count(CBC)','primary:blood;preservative:EDTA;',''),(3,'Lymph Node Biopsy','primary:lymph node;preservative:saline,frozen,formalin;',''),(4,'HIV','primary:blood;preservative:none;',''),(5,'SAAG','{primary:blood;preservative:none;}{primary:ascitic fluid;preservative:none;}','');
/*!40000 ALTER TABLE `examination` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `examination_property_blob`
--

LOCK TABLES `examination_property_blob` WRITE;
/*!40000 ALTER TABLE `examination_property_blob` DISABLE KEYS */;
INSERT INTO `examination_property_blob` VALUES (8,3,'Image','',3.00);
/*!40000 ALTER TABLE `examination_property_blob` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `examination_property_decimal`
--

LOCK TABLES `examination_property_decimal` WRITE;
/*!40000 ALTER TABLE `examination_property_decimal` DISABLE KEYS */;
INSERT INTO `examination_property_decimal` VALUES (1,1,'concentration','',0.00),(2,2,'RBC','',1.00),(3,2,'WBC','',2.00),(4,2,'Hb','',3.00);
/*!40000 ALTER TABLE `examination_property_decimal` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `examination_property_text`
--

LOCK TABLES `examination_property_text` WRITE;
/*!40000 ALTER TABLE `examination_property_text` DISABLE KEYS */;
INSERT INTO `examination_property_text` VALUES (5,3,'Gross Appearance','',1.00),(6,3,'Mircoscopy','',2.00),(7,3,'Conclusion','',4.00),(9,4,'Conclusion','',4.00),(10,4,'Consent','',5.00),(11,4,'Rapid 1','',1.00),(12,4,'Rapid 2','',2.00),(13,4,'Rapid 3','',3.00);
/*!40000 ALTER TABLE `examination_property_text` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `examination_result_blob`
--

LOCK TABLES `examination_result_blob` WRITE;
/*!40000 ALTER TABLE `examination_result_blob` DISABLE KEYS */;
/*!40000 ALTER TABLE `examination_result_blob` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `examination_result_decimal`
--

LOCK TABLES `examination_result_decimal` WRITE;
/*!40000 ALTER TABLE `examination_result_decimal` DISABLE KEYS */;
INSERT INTO `examination_result_decimal` VALUES (1,1,34.00),(2,2,4.50),(2,3,3.30),(2,4,12.20);
/*!40000 ALTER TABLE `examination_result_decimal` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `examination_result_text`
--

LOCK TABLES `examination_result_text` WRITE;
/*!40000 ALTER TABLE `examination_result_text` DISABLE KEYS */;
INSERT INTO `examination_result_text` VALUES (3,5,'Brown, Hard, Matted, 4 cm x 3 cm, necrotic'),(3,6,'HE Stain shows undifferanciated lymphoblasts. IHC shows CD14 +ve cells (50%)'),(3,7,'Atypical Lymphoma Grade 3'),(4,9,'HIV +ve'),(4,10,'Patient have decided not to send report to clinician'),(4,11,'+ve'),(4,12,'-ve'),(4,13,'+ve');
/*!40000 ALTER TABLE `examination_result_text` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `sample`
--

LOCK TABLES `sample` WRITE;
/*!40000 ALTER TABLE `sample` DISABLE KEYS */;
INSERT INTO `sample` VALUES (1,'SUR/18/11223344','name:Manoj;sex:M;age:34Y;department:Orthopaedics;Location:H1;bed:34;sample_type:Blood;preservative:none;section:biochemistry;'),(2,'SUR/18/11223344','name:Manoj;sex:M;age:34Y;department:Orthopaedics;Location:H1;bed:34;sample_type:blood;preservative:EDTA;'),(3,'SUR/18/11223344','name:Manoj;sex:M;age:34Y;department:Orthopaedics;Location:H1;bed:34;sample_type:lymph node;preservative:formalin;'),(4,'SUR/18/11223344','name:Manoj;sex:M;age:34Y;department:Orthopaedics;Location:H1;bed:34;sample_type:Blood;preservative:none;section:microbiology;');
/*!40000 ALTER TABLE `sample` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'ndUGMOZjnu8tc','2019-06-10');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-14 23:36:13
