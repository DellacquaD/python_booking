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
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `city_id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `state_id` bigint DEFAULT NULL,
  PRIMARY KEY (`city_id`),
  KEY `FK6p2u50v8fg2y0js6djc6xanit` (`state_id`),
  CONSTRAINT `FK6p2u50v8fg2y0js6djc6xanit` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,'San José de Mayo',1),(2,'Minas',2),(3,'Artigas',3),(4,'Salto',4),(5,'Trinidad',5),(6,'Paysandú',6),(7,'Mercedes',7),(8,'Canelones',8),(9,'Fray Bentos',9),(10,'Rocha',10),(11,'Tacuarembó',11),(12,'Rivera',12),(13,'Maldonado',13),(14,'Treinta y Tres',14),(15,'Colonia del Sacramento',15),(16,'Florida',16),(17,'Durazno',17),(18,'Montevideo',18),(19,'Melo',19),(20,'Buenos Aires',20),(21,'Resistencia',21),(22,'San Luis',22),(23,'Formosa',23),(24,'La Plata',24),(25,'Río Gallegos',25),(26,'Salta',26),(27,'Posadas',27),(28,'Viedma',28),(29,'Neuquén',29),(30,'San Salvador de Jujuy',30),(31,'Rawson',31),(32,'Santa Fe',32),(33,'Corrientes',33),(34,'San Miguel de Tucumán',34),(35,'Santa Rosa',35),(36,'La Rioja',36),(37,'Mendoza',37),(38,'Santiago del Estero',38),(39,'San Juan',39),(40,'Ushuaia',40),(41,'Paraná',41),(42,'Córdoba',42),(43,'San Fernando del Valle de Catamarca',43),(44,'São Paulo',44),(45,'Florianópolis',45),(46,'Vitória',46),(47,'Goiânia',47),(48,'Curitiba',48),(49,'Macapá',49),(50,'Rio Branco',50),(51,'Porto Velho',51),(52,'São Luís',52),(53,'Teresina',53),(54,'Brasília',54),(55,'Manaus',55),(56,'Natal',56),(57,'Recife',57),(58,'Maceió',58),(59,'Rio de Janeiro',59),(60,'Porto Alegre',60),(61,'Fortaleza',61),(62,'Campo Grande',62),(63,'João Pessoa',63),(64,'Cuiabá',64),(65,'Belo Horizonte',65),(66,'Palmas',66),(67,'Salvador',67),(68,'Aracaju',68),(69,'Boa Vista',69),(70,'Belém',70);
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
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
