-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: python_booking
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `state` (
  `state_id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `country_id` bigint DEFAULT NULL,
  PRIMARY KEY (`state_id`),
  KEY `FKghic7mqjt6qb9vq7up7awu0er` (`country_id`),
  CONSTRAINT `FKghic7mqjt6qb9vq7up7awu0er` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state`
--

LOCK TABLES `state` WRITE;
/*!40000 ALTER TABLE `state` DISABLE KEYS */;
INSERT INTO `state` VALUES (1,'San José',1),(2,'Lavalleja',1),(3,'Artigas',1),(4,'Salto',1),(5,'Flores',1),(6,'Paysandú',1),(7,'Soriano',1),(8,'Canelones',1),(9,'Río Negro',1),(10,'Rocha',1),(11,'Tacuarembó',1),(12,'Rivera',1),(13,'Maldonado',1),(14,'Treinta y Tres',1),(15,'Colonia',1),(16,'Florida',1),(17,'Durazno',1),(18,'Montevideo',1),(19,'Cerro Largo',1),(20,'Ciudad Autónoma de Buenos Aires',2),(21,'Chaco',2),(22,'San Luis',2),(23,'Formosa',2),(24,'Buenos Aires',2),(25,'Santa Cruz',2),(26,'Salta',2),(27,'Misiones',2),(28,'Río Negro',2),(29,'Neuquén',2),(30,'Jujuy',2),(31,'Chubut',2),(32,'Santa Fe',2),(33,'Corrientes',2),(34,'Tucumán',2),(35,'La Pampa',2),(36,'La Rioja',2),(37,'Mendoza',2),(38,'Santiago del Estero',2),(39,'San Juan',2),(40,'Tierra del Fuego',2),(41,'Entre Ríos',2),(42,'Córdoba',2),(43,'Catamarca',2),(44,'São Paulo',3),(45,'Santa Catarina',3),(46,'Espírito Santo',3),(47,'Goiás',3),(48,'Paraná',3),(49,'Amapá',3),(50,'Acre',3),(51,'Rondônia',3),(52,'Maranhão',3),(53,'Piauí',3),(54,'Federal District',3),(55,'Amazonas',3),(56,'Rio Grande do Norte',3),(57,'Pernambuco',3),(58,'Alagoas',3),(59,'Rio de Janeiro',3),(60,'Rio Grande do Sul',3),(61,'Ceará',3),(62,'Mato Grosso do Sul',3),(63,'Paraíba',3),(64,'Mato Grosso',3),(65,'Minas Gerais',3),(66,'Tocantins',3),(67,'Bahia',3),(68,'Sergipe',3),(69,'Roraima',3),(70,'Pará',3);
/*!40000 ALTER TABLE `state` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-27 22:22:20
