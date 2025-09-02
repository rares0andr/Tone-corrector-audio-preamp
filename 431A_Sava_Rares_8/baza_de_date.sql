-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: proiect
-- ------------------------------------------------------
-- Server version	8.0.37

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cursuri`
--

DROP TABLE IF EXISTS `cursuri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cursuri` (
  `idcurs` bigint unsigned NOT NULL AUTO_INCREMENT,
  `denumire` varchar(100) DEFAULT NULL,
  `nume_profesor` varchar(45) DEFAULT NULL,
  `sala` varchar(45) DEFAULT NULL,
  `metoda_notare` varchar(1000) DEFAULT NULL,
  `structura` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`idcurs`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cursuri`
--

LOCK TABLES `cursuri` WRITE;
/*!40000 ALTER TABLE `cursuri` DISABLE KEYS */;
INSERT INTO `cursuri` VALUES (24,'Programarea interfetelor pentru baze de date','Valentin Pupezescu','B312','Nota','proiect cu predare in sesiune'),(25,'Teoria Transmisiunii Informatiei','Radoi Ana','B223a','Nota','curs + seminar + laborator + proiect'),(26,'Algebra','Nitu Alina','B306','nota','curs + seminar + laborator + proiect');
/*!40000 ALTER TABLE `cursuri` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proiect`
--

DROP TABLE IF EXISTS `proiect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proiect` (
  `idproiect` bigint NOT NULL AUTO_INCREMENT,
  `idcurs` bigint unsigned DEFAULT NULL,
  `idstudent` bigint unsigned DEFAULT NULL,
  `Data predare` date DEFAULT NULL,
  `Denumire` varchar(45) DEFAULT NULL,
  `Sesiune examinare` varchar(45) DEFAULT NULL,
  `Descriere` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`idproiect`),
  KEY `fk_proiect_curs` (`idcurs`),
  KEY `fk_proiect_student` (`idstudent`),
  CONSTRAINT `fk_proiect_curs` FOREIGN KEY (`idcurs`) REFERENCES `cursuri` (`idcurs`) ON DELETE CASCADE,
  CONSTRAINT `fk_proiect_student` FOREIGN KEY (`idstudent`) REFERENCES `studenti` (`idstudent`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proiect`
--

LOCK TABLES `proiect` WRITE;
/*!40000 ALTER TABLE `proiect` DISABLE KEYS */;
INSERT INTO `proiect` VALUES (12,24,22,'2025-08-30','Platforma gestionare proiecte semestriale','toamna','platforma gestionare proiecte semestriale'),(14,25,22,'2025-01-30','Codare Huffman','iarna','algoritm codare huffman in python');
/*!40000 ALTER TABLE `proiect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studenti`
--

DROP TABLE IF EXISTS `studenti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `studenti` (
  `idstudent` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nume` varchar(45) DEFAULT NULL,
  `initiala_tata` varchar(2) DEFAULT NULL,
  `prenume` varchar(45) DEFAULT NULL,
  `data_nasterii` date DEFAULT NULL,
  `cnp` varchar(13) DEFAULT NULL,
  `adresa` varchar(500) DEFAULT NULL,
  `facultate` varchar(100) DEFAULT NULL,
  `ciclu_studii` varchar(10) DEFAULT NULL,
  `an_studii` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`idstudent`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studenti`
--

LOCK TABLES `studenti` WRITE;
/*!40000 ALTER TABLE `studenti` DISABLE KEYS */;
INSERT INTO `studenti` VALUES (22,'Sava','M','Rares-Andrei','2003-10-26','5031026134145','Strada Preciziei 24, sector 6, Bucuresti','Electronica, telecomunicatii si tehnologia informatiei','Licenta','4'),(23,'Sava','I','Mihai','1967-11-02','1234567890123','Aurel Vlaicu 1, Constanta','Electronica, telecomunicatii si tehnologia informatiei','Master','1'),(24,'Gruber','I','Ramona-Aureliana','1972-06-02','1234567890123','Aurel Vlaicu 1, Constanta','Electronica, telecomunicatii si tehnologia informatiei','Master','2');
/*!40000 ALTER TABLE `studenti` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-02 19:31:08
