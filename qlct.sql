-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: qlct
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `earnings`
--

DROP TABLE IF EXISTS `earnings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `earnings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `currency` decimal(10,0) NOT NULL,
  `details` varchar(200) NOT NULL,
  `time` varchar(45) NOT NULL,
  `id_user` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_id_user_idx` (`id_user`),
  CONSTRAINT `fk_id_user_ear` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `earnings`
--

LOCK TABLES `earnings` WRITE;
/*!40000 ALTER TABLE `earnings` DISABLE KEYS */;
/*!40000 ALTER TABLE `earnings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `earnings_gr`
--

DROP TABLE IF EXISTS `earnings_gr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `earnings_gr` (
  `id` int NOT NULL AUTO_INCREMENT,
  `standby_state` tinyint NOT NULL,
  `id_ear` int NOT NULL,
  `id_gr` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_id_gr_idx` (`id_gr`),
  KEY `fk_id_ear_idx` (`id_ear`),
  CONSTRAINT `fk_id_ear` FOREIGN KEY (`id_ear`) REFERENCES `earnings` (`id`),
  CONSTRAINT `fk_id_gr` FOREIGN KEY (`id_gr`) REFERENCES `group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `earnings_gr`
--

LOCK TABLES `earnings_gr` WRITE;
/*!40000 ALTER TABLE `earnings_gr` DISABLE KEYS */;
/*!40000 ALTER TABLE `earnings_gr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expenditures`
--

DROP TABLE IF EXISTS `expenditures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expenditures` (
  `id` int NOT NULL AUTO_INCREMENT,
  `time` datetime NOT NULL,
  `currency` decimal(10,0) NOT NULL,
  `details` varchar(200) NOT NULL,
  `id_user` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_id_user_exp_idx` (`id_user`),
  CONSTRAINT `fk_id_user_exp` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expenditures`
--

LOCK TABLES `expenditures` WRITE;
/*!40000 ALTER TABLE `expenditures` DISABLE KEYS */;
/*!40000 ALTER TABLE `expenditures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expenditures_gr`
--

DROP TABLE IF EXISTS `expenditures_gr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expenditures_gr` (
  `id` int NOT NULL AUTO_INCREMENT,
  `standby_state` tinyint NOT NULL,
  `id_gr` int NOT NULL,
  `id_exp` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_id_exp_idx` (`id_exp`),
  KEY `fk_id_group_idx` (`id_gr`),
  CONSTRAINT `fk_id_exp` FOREIGN KEY (`id_exp`) REFERENCES `expenditures` (`id`),
  CONSTRAINT `fk_id_group` FOREIGN KEY (`id_gr`) REFERENCES `group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expenditures_gr`
--

LOCK TABLES `expenditures_gr` WRITE;
/*!40000 ALTER TABLE `expenditures_gr` DISABLE KEYS */;
/*!40000 ALTER TABLE `expenditures_gr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group`
--

DROP TABLE IF EXISTS `group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `role` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group`
--

LOCK TABLES `group` WRITE;
/*!40000 ALTER TABLE `group` DISABLE KEYS */;
/*!40000 ALTER TABLE `group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_gr`
--

DROP TABLE IF EXISTS `member_gr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_gr` (
  `id` int NOT NULL,
  `id_gr` int NOT NULL,
  `id_user` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_id_idx` (`id_user`),
  KEY `fk_gr_id_idx` (`id_gr`),
  CONSTRAINT `fk_gr_id` FOREIGN KEY (`id_gr`) REFERENCES `group` (`id`),
  CONSTRAINT `fk_user_id` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_gr`
--

LOCK TABLES `member_gr` WRITE;
/*!40000 ALTER TABLE `member_gr` DISABLE KEYS */;
/*!40000 ALTER TABLE `member_gr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `phonenumber` varchar(12) NOT NULL,
  `avt` varchar(100) DEFAULT NULL,
  `role` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `phonenumber_UNIQUE` (`phonenumber`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'kien','hoangkien123','123456','hoangkien123@gmail.com','0123456789','','ROLE_ADMIN');
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

-- Dump completed on 2022-09-02  0:38:36
