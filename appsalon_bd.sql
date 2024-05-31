-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: appsalon_mvc
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `citas`
--

DROP TABLE IF EXISTS `citas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `citas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `usuarioId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_idx` (`usuarioId`),
  CONSTRAINT `fk_IdUsuario` FOREIGN KEY (`usuarioId`) REFERENCES `usuarios` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citas`
--

LOCK TABLES `citas` WRITE;
/*!40000 ALTER TABLE `citas` DISABLE KEYS */;
INSERT INTO `citas` VALUES (44,'2024-03-21','10:00:00',10),(45,'2024-04-16','12:03:00',6),(46,'2024-04-16','12:03:00',6),(48,'2024-04-17','13:43:00',6);
/*!40000 ALTER TABLE `citas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `citasservicios`
--

DROP TABLE IF EXISTS `citasservicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `citasservicios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `citaId` int DEFAULT NULL,
  `servicioId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_IdCita_idx` (`citaId`),
  KEY `fk_IdServicio_idx` (`servicioId`),
  CONSTRAINT `fk_IdCita` FOREIGN KEY (`citaId`) REFERENCES `citas` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `fk_IdServicio` FOREIGN KEY (`servicioId`) REFERENCES `servicios` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citasservicios`
--

LOCK TABLES `citasservicios` WRITE;
/*!40000 ALTER TABLE `citasservicios` DISABLE KEYS */;
INSERT INTO `citasservicios` VALUES (1,NULL,1),(2,NULL,2),(3,NULL,4),(4,NULL,3),(5,NULL,1),(6,NULL,2),(7,NULL,1),(8,NULL,2),(9,NULL,4),(10,NULL,3),(11,NULL,5),(12,NULL,1),(13,NULL,1),(14,NULL,5),(15,NULL,3),(16,NULL,1),(17,NULL,3),(18,NULL,2),(19,NULL,4),(20,NULL,1),(21,NULL,3),(22,NULL,2),(23,44,2),(24,44,4),(25,45,1),(26,45,2),(27,46,1),(28,46,3),(29,46,2),(30,NULL,4),(31,NULL,6),(32,NULL,3),(33,48,4),(34,48,6),(35,48,3);
/*!40000 ALTER TABLE `citasservicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicios`
--

DROP TABLE IF EXISTS `servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) DEFAULT NULL,
  `precio` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicios`
--

LOCK TABLES `servicios` WRITE;
/*!40000 ALTER TABLE `servicios` DISABLE KEYS */;
INSERT INTO `servicios` VALUES (1,'Corte de Cabello Mujer',120.00),(2,'Corte de Cabello Hombre',80.00),(3,'Corte de Cabello Niño',60.00),(4,'Peinado Mujer',80.00),(5,'Peinado Hombre',60.00),(6,'Peinado Niño',60.00),(7,'Corte de Barba',60.00),(8,'Tinte Mujer',300.00),(10,'Lavado de Cabello',50.00),(11,'Tratamiento Capilar',150.00),(13,'CORTE DE BARBA',20.00);
/*!40000 ALTER TABLE `servicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) DEFAULT NULL,
  `apellido` varchar(60) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `telefono` varchar(10) DEFAULT NULL,
  `admin` tinyint(1) DEFAULT NULL,
  `confirmado` tinyint(1) DEFAULT NULL,
  `token` varchar(15) DEFAULT NULL,
  `password` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,' Diego','Bermudez','diegobl9do@gmail.com','131231231',1,0,'65b329c016d8e ','$2y$10$O5RfHWmEE.IayK6S9O0.gOkXGwi1z.f4Z.dN9oZMB6CtlnRtUhhNe'),(2,' aleza','quispe','alexa@gmail.com','132131231',0,0,'65b32af1c7d36 ','$2y$10$8hn2uDMto8lL6D98n8hK1ulaw99/1DQQDEisare5/LliHc3cjkRjm'),(3,' Diego','Bermudez','dsdsadas@gmail.com','109231312',0,0,'65b547a923f9e ','$2y$10$PQR9S7Mp2wiALWv0r5GMLeDiHVO0jVKjn.5wB/UhbzOPpXiek7Qmm'),(4,'Diego','Bermn','fsdfsdf@gmail.com','123123123',0,1,'','$2y$10$ifdSjosqBStB8hCcSWocVOvFHKcBbyP.bj.aqbjAGVa1xmjlaBGUi'),(5,'alexa','quispe','alexaas@gmail.com','1313213',0,1,'','$2y$10$hDMENDjDuAODg9ZmHDMSceudr1ewUpZBDRofqwmlT308qv2biOHRm'),(6,'Hola','hola','hola@gmail.com','123131312',0,1,'','$2y$10$mQVVpQqZUHOundx8JCHEsuRZAiKtPeEUXf2/4RAdP0GUhYrjj98Fa'),(7,'perez','bermudez','perez@gmail.com','123455678',1,1,'','$2y$10$.iHYPrpjeyF8Da/ezHXcgOV.RvvA05usxIQv2sogy1MxlaQHiDgMO'),(10,'kiara','kitty','kiara@gmail.com','182318381',0,1,'','$2y$10$qvKYKy0YOCLB2LFItgCVD.1mQ00Lc6d4rOAK3vupTUEIQFh/gzesO');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-31  0:45:59
