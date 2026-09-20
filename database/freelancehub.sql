-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: freelancehub
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `freelancehub`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `freelancehub` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `freelancehub`;

--
-- Table structure for table `freelancer_mission`
--

DROP TABLE IF EXISTS `freelancer_mission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `freelancer_mission` (
  `freelancer_id` bigint NOT NULL,
  `mission_id` bigint NOT NULL,
  PRIMARY KEY (`freelancer_id`,`mission_id`),
  KEY `fk_fm_mission` (`mission_id`),
  CONSTRAINT `fk_fm_freelancer` FOREIGN KEY (`freelancer_id`) REFERENCES `freelancers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_fm_mission` FOREIGN KEY (`mission_id`) REFERENCES `missions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `freelancer_mission`
--

LOCK TABLES `freelancer_mission` WRITE;
/*!40000 ALTER TABLE `freelancer_mission` DISABLE KEYS */;
INSERT INTO `freelancer_mission` VALUES (1,1),(1,2),(3,2),(4,3),(2,4),(5,5);
/*!40000 ALTER TABLE `freelancer_mission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `freelancer_skill`
--

DROP TABLE IF EXISTS `freelancer_skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `freelancer_skill` (
  `freelancer_id` bigint NOT NULL,
  `skill_id` bigint NOT NULL,
  PRIMARY KEY (`freelancer_id`,`skill_id`),
  KEY `fk_fs_skill` (`skill_id`),
  CONSTRAINT `fk_fs_freelancer` FOREIGN KEY (`freelancer_id`) REFERENCES `freelancers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_fs_skill` FOREIGN KEY (`skill_id`) REFERENCES `skills` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `freelancer_skill`
--

LOCK TABLES `freelancer_skill` WRITE;
/*!40000 ALTER TABLE `freelancer_skill` DISABLE KEYS */;
INSERT INTO `freelancer_skill` VALUES (1,1),(5,1),(2,2),(2,3),(5,3),(3,4),(3,5),(1,6),(5,6),(4,8);
/*!40000 ALTER TABLE `freelancer_skill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `freelancers`
--

DROP TABLE IF EXISTS `freelancers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `freelancers` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `specialty` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `daily_rate` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `freelancers`
--

LOCK TABLES `freelancers` WRITE;
/*!40000 ALTER TABLE `freelancers` DISABLE KEYS */;
INSERT INTO `freelancers` VALUES (1,'Ali Benali','ali.benali@freelance.ma','Backend Java/Spring',650.00),(2,'Sara Moussaoui','sara.m@freelance.ma','Frontend React/Angular',580.00),(3,'Youssef Amrani','y.amrani@freelance.ma','DevOps/Cloud',720.00),(4,'Fatima Zahra','f.zahra@freelance.ma','Mobile Flutter',600.00),(5,'Karim Idrissi','k.idrissi@freelance.ma','Fullstack Spring/React',700.00);
/*!40000 ALTER TABLE `freelancers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `missions`
--

DROP TABLE IF EXISTS `missions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `missions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `budget` decimal(10,2) NOT NULL,
  `status` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `missions`
--

LOCK TABLES `missions` WRITE;
/*!40000 ALTER TABLE `missions` DISABLE KEYS */;
INSERT INTO `missions` VALUES (1,'D├®veloppement API REST e-commerce','Conception et d├®veloppement d\'une API REST pour une plateforme e-commerce B2B',8500.00,'OPEN','RetailMa'),(2,'Migration microservices','Migration d\'une application monolithique vers une architecture microservices Docker',15000.00,'IN_PROGRESS','TechCorp'),(3,'Application mobile de livraison','D├®veloppement d\'une app Flutter pour la gestion des livraisons en temps r├®el',12000.00,'OPEN','FastDeliver'),(4,'Dashboard analytique','Tableau de bord React avec visualisation de donn├®es et rapports PDF',6000.00,'COMPLETED','DataViz'),(5,'Refonte syst├¿me RH','Refonte compl├¿te du syst├¿me de gestion RH avec Spring Boot et Angular',20000.00,'IN_PROGRESS','CorpRH');
/*!40000 ALTER TABLE `missions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skills`
--

DROP TABLE IF EXISTS `skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skills` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skills`
--

LOCK TABLES `skills` WRITE;
/*!40000 ALTER TABLE `skills` DISABLE KEYS */;
INSERT INTO `skills` VALUES (1,'Spring Boot','Backend'),(2,'Angular','Frontend'),(3,'React','Frontend'),(4,'Docker','DevOps'),(5,'Kubernetes','DevOps'),(6,'MySQL','Backend'),(7,'MongoDB','Backend'),(8,'Flutter','Mobile');
/*!40000 ALTER TABLE `skills` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-20 20:21:26
