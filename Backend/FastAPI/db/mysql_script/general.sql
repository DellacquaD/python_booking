CREATE DATABASE  IF NOT EXISTS `0223TDPROM1C3LAED0522FT_GRUPO6` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `0223TDPROM1C3LAED0522FT_GRUPO6`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: digitalhouse.cluster-cnyqegjgetrv.us-east-2.rds.amazonaws.com    Database: 0223TDPROM1C3LAED0522FT_GRUPO6
-- ------------------------------------------------------
-- Server version	8.0.23

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `address_id` bigint NOT NULL AUTO_INCREMENT,
  `number` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `city_id` bigint NOT NULL,
  PRIMARY KEY (`address_id`),
  KEY `FKpo044ng5x4gynb291cv24vtea` (`city_id`),
  CONSTRAINT `FKpo044ng5x4gynb291cv24vtea` FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'6000','Paraguay',3),(2,'327','Asamblea',1),(3,'453','Damaso Antonio Larrañaga',1),(4,'221','Ituzaingó',1),(5,'452','Florida',1),(6,'159','19 de Abril',16),(7,'153','Baltasar Brum',16),(8,'742','Faustino Lopez',16),(9,'162','Charruas',6),(10,'172','Sarandi',19),(11,'130','19 de Abril',14),(13,'132','18 de Julio',2),(16,'324','Colon',7),(24,'269','Italia',15),(25,'834','Venezuela',20),(26,'753','Venezuela',20),(27,'275','18 de Julio',4),(32,'6000','Luis Batlle Berres',18),(33,'undefined','undefined',2),(53,'756','18 de Julio',2),(54,'6000','Luis Batlle Berres',2);
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `category_id` bigint NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `quantity` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,NULL,'https://images.unsplash.com/photo-1455587734955-081b22074882?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80','1258684','Hoteles'),(2,NULL,'https://images.unsplash.com/photo-1459767129954-1b1c1f9b9ace?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80','78976','Apartamentos'),(3,NULL,'https://images.unsplash.com/photo-1566073771259-6a8506099945?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80','78785','Resorts'),(4,NULL,'https://images.unsplash.com/photo-1613490493576-7fde63acd811?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80','456','Villas'),(5,NULL,'https://images.unsplash.com/photo-1601689266752-211fe93008d3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80','789','Chalets de montaña'),(6,NULL,'https://images.unsplash.com/photo-1595877244574-e90ce41ce089?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80','456','Cabañas y casas de campo'),(7,NULL,'https://images.unsplash.com/photo-1593053272490-e0ed6d6a42c5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80','968','Glamping'),(8,NULL,'https://images.unsplash.com/photo-1568605114967-8130f3a36994?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80','43','Casas y chalets'),(9,NULL,'https://images.unsplash.com/photo-1590856029620-9b5a4825d3be?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=873&q=80','435','Hostales y pensiones'),(10,NULL,'https://images.unsplash.com/photo-1520277739336-7bf67edfa768?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1032&q=80','456','Albergues'),(11,NULL,'https://images.unsplash.com/photo-1600375235940-76fb0f15b010?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=897&q=80','127','Moteles'),(12,NULL,'https://images.unsplash.com/photo-1621262331990-19861196e3ce?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80','163','Bed and breakfasts'),(13,NULL,'https://images.unsplash.com/photo-1614301246509-d1fc7d78b6b6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80','258','Ryokans'),(14,NULL,'https://images.unsplash.com/photo-1570133435529-62359fac701b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80','104','Riads'),(15,NULL,'https://plus.unsplash.com/premium_photo-1664301257909-2ec738a69027?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80','2024','Campings resort'),(16,NULL,'https://images.unsplash.com/photo-1560448205-4d9b3e6bb6db?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80','2022','Habitaciones en casas particulares'),(17,NULL,'https://images.unsplash.com/photo-1487730116645-74489c95b41b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80','3468','Campings'),(18,NULL,'https://images.unsplash.com/photo-1573652102907-b75d25910c11?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=326&q=80','989','Casas rurales'),(19,NULL,'https://images.unsplash.com/photo-1676738451454-d8443e76d4c2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80','737','Agroturismos'),(20,NULL,'https://images.unsplash.com/photo-1569263979104-865ab7cd8d13?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=874&q=80','463','Barcos'),(21,NULL,'https://images.unsplash.com/photo-1640755668096-4f4c7b8f4410?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80','1237','Tented camps'),(22,NULL,'https://plus.unsplash.com/premium_photo-1673014201500-f13a3a4adf27?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=895&q=80','3512','Alojamientos con cocina');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country` (
  `country_id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'Uruguay'),(2,'Argentina'),(3,'Brazil');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feature`
--

DROP TABLE IF EXISTS `feature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feature` (
  `feature_id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`feature_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feature`
--

LOCK TABLES `feature` WRITE;
/*!40000 ALTER TABLE `feature` DISABLE KEYS */;
INSERT INTO `feature` VALUES (1,'Wifi'),(2,'Pileta'),(3,'Cocina'),(4,'Televisor'),(5,'Apto mascotas'),(6,'Aire acondicionado'),(7,'Estacionamiento gratuito');
/*!40000 ALTER TABLE `feature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `image` (
  `image_id` bigint NOT NULL AUTO_INCREMENT,
  `image_url` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`image_id`),
  KEY `FKgpextbyee3uk9u6o2381m7ft1` (`product_id`),
  CONSTRAINT `FKgpextbyee3uk9u6o2381m7ft1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (1,'https://images.unsplash.com/photo-1551882547-ff40c63fe5fa?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80','Esta es la foto de un hotel',1),(2,'https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80','Esta es la foto de un hotel',1),(3,'https://images.unsplash.com/photo-1522708323590-d24dbb6b0267?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80','Esta es la foto de un hotel',1),(4,'https://images.unsplash.com/photo-1564501049412-61c2a3083791?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1032&q=80','Esta es la foto de un hotel',2),(5,'https://images.unsplash.com/photo-1507652313519-d4e9174996dd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80','Esta es la foto de un hotel',2),(6,'https://images.unsplash.com/photo-1577784424946-e12c7b211249?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80','Esta es la foto de un hotel',2),(7,'https://images.unsplash.com/photo-1574362848149-11496d93a7c7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=784&q=80','Esta es la foto de un hotel',3),(8,'https://images.unsplash.com/photo-1536376072261-38c75010e6c9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80','Esta es la foto de un hotel',3),(9,'https://images.unsplash.com/photo-1529408686214-b48b8532f72c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80','Esta es la foto de un hotel',3),(10,'https://images.unsplash.com/photo-1540541338287-41700207dee6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80','Esta es la foto de un hotel',4),(11,'https://images.unsplash.com/photo-1675552520691-250b05b14a08?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=388&q=80','Esta es la foto de un hotel',4),(12,'https://images.unsplash.com/photo-1605473203669-00e028079fc3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80','Esta es la foto de un hotel',4),(13,'https://images.unsplash.com/photo-1582610116397-edb318620f90?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80','Esta es la foto de un hotel',5),(14,'https://images.unsplash.com/photo-1623812314861-80b860283143?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80','Esta es la foto de un hotel',5),(15,'https://images.unsplash.com/photo-1583333938274-d6f1476e6654?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80','Esta es la foto de un hotel',5),(16,'https://images.unsplash.com/photo-1598195414327-3d7309170bf9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80','Esta es la foto de un hotel',6),(17,'https://images.unsplash.com/photo-1513028179155-324cfec2566c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=405&q=80','Esta es la foto de un hotel',6),(18,'https://images.unsplash.com/photo-1668361635138-98fc110f0b7f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80','Esta es la foto de un hotel',6),(19,'https://images.unsplash.com/photo-1558036117-15d82a90b9b1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80','Esta es la foto de un hotel',7),(20,'https://images.unsplash.com/photo-1654444794866-99cb5fe342f5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80','Esta es la foto de un hotel',7),(21,'https://images.unsplash.com/photo-1542292714-0af7af35e324?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=869&q=80','Esta es la foto de un hotel',7),(22,'https://images.unsplash.com/photo-1593053272490-e0ed6d6a42c5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80','Esta es la foto de un hotel',8),(23,'https://images.unsplash.com/photo-1627807737721-6197093091d9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=386&q=80','Esta es la foto de un hotel',8),(24,'https://images.unsplash.com/photo-1627228309109-0e5d3254c9fb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80','Esta es la foto de un hotel',8),(25,'https://images.unsplash.com/photo-1610468313373-e6326034fcd7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80','Esta es la foto de un hotel',9),(26,'https://images.unsplash.com/photo-1625669709111-6df35affa0a5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80','Esta es la foto de un hotel',9),(27,'https://images.unsplash.com/photo-1627678250237-f9e5801d65af?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80','Esta es la foto de un hotel',9),(28,'https://images.unsplash.com/photo-1616749311500-f20355ae6854?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80','Esta es la foto de un hotel',10),(29,'https://images.unsplash.com/photo-1517996047036-e04171d37f41?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=874&q=80','Esta es la foto de un hotel',10),(30,'https://images.unsplash.com/photo-1561124928-eda0f74e3847?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=872&q=80','Esta es la foto de un hotel',10),(31,'https://images.unsplash.com/photo-1621262331990-19861196e3ce?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80','Esta es la foto de un hotel',11),(32,'https://images.unsplash.com/photo-1568562685428-9c803a1fe45e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80','Esta es la foto de un hotel',11),(33,'https://images.unsplash.com/photo-1675552520691-250b05b14a08?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=388&q=80','Esta es la foto de un hotel',11),(34,'https://images.unsplash.com/photo-1610333684078-c89bd57f2e46?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80','Esta es la foto de un hotel',12),(35,'https://images.unsplash.com/photo-1597374480673-089471d847b0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80','Esta es la foto de un hotel',12),(36,'https://images.unsplash.com/photo-1528652899333-492965af4854?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80','Esta es la foto de un hotel',12),(37,'https://images.unsplash.com/photo-1570133435529-62359fac701b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80','Esta es la foto de un hotel',13),(38,'https://plus.unsplash.com/premium_photo-1663054910161-a6e4d0e146a0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=805&q=80','Esta es la foto de un hotel',13),(39,'https://images.unsplash.com/photo-1597098540640-0cf6008159a0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=385&q=80','Esta es la foto de un hotel',13),(40,'https://images.unsplash.com/photo-1507086182422-97bd7ca2413b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=876&q=80',NULL,2),(41,'https://images.unsplash.com/photo-1622052189643-302d2396c125?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',NULL,3),(42,'https://images.unsplash.com/photo-1573385044784-ba6c83bfa408?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=415&q=80',NULL,3),(43,'https://images.unsplash.com/photo-1598316942621-dc81339178b6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',NULL,4),(44,'https://images.unsplash.com/photo-1623922939942-38c39476cbff?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=327&q=80',NULL,4),(45,'https://images.unsplash.com/photo-1591728534642-b68f534bfee5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1031&q=80',NULL,5),(46,'https://images.unsplash.com/photo-1605473203669-00e028079fc3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',NULL,5),(47,'https://images.unsplash.com/photo-1597374480673-089471d847b0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',NULL,6),(48,'https://images.unsplash.com/photo-1517414628894-83d47b22f233?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=388&q=80',NULL,6),(49,'https://images.unsplash.com/photo-1559108710-3d9622f5a861?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1032&q=80',NULL,7),(50,'https://images.unsplash.com/photo-1507086182422-97bd7ca2413b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=876&q=80',NULL,7),(51,'https://images.unsplash.com/photo-1641375712569-055e70fa571d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',NULL,8),(52,'https://images.unsplash.com/photo-1638939674891-ba872677d6eb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',NULL,8),(53,'https://images.unsplash.com/photo-1561539562-70b51b3413cb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',NULL,9),(54,'https://images.unsplash.com/photo-1623922939942-38c39476cbff?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=327&q=80',NULL,9),(55,'https://images.unsplash.com/photo-1552858725-a019f14f0cec?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',NULL,10),(56,'https://images.unsplash.com/photo-1566978068475-22a47268a416?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80',NULL,10),(57,'https://images.unsplash.com/photo-1505275350441-83dcda8eeef5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',NULL,11),(58,'https://images.unsplash.com/photo-1517414628894-83d47b22f233?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=388&q=80',NULL,11),(59,'https://images.unsplash.com/photo-1508424757105-b6d5ad9329d0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80',NULL,12),(60,'https://images.unsplash.com/photo-1507086182422-97bd7ca2413b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=876&q=80',NULL,12),(61,'https://images.unsplash.com/photo-1517638851339-a711cfcf3279?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',NULL,13),(62,'https://images.unsplash.com/photo-1573385044784-ba6c83bfa408?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=415&q=80',NULL,13),(63,'https://images.unsplash.com/photo-1556020685-ae41abfc9365?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',NULL,1),(64,'https://images.unsplash.com/photo-1627257058769-0a99529e4312?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',NULL,1),(65,'https://images.unsplash.com/photo-1585128833421-cb27e4911276?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',NULL,2),(66,'https://images.unsplash.com/photo-1452626212852-811d58933cae?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80','string',14),(68,'https://images.unsplash.com/photo-1556228453-efd6c1ff04f6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',NULL,14),(69,'https://images.unsplash.com/photo-1524061662617-6a29d732e3ef?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',NULL,14),(70,'https://images.unsplash.com/photo-1560184897-0e5d96d86acd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',NULL,14),(71,'https://images.unsplash.com/photo-1484301548518-d0e0a5db0fc8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',NULL,14),(72,'https://images.unsplash.com/photo-1676036632983-0c88606074f9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80','string',15),(73,'https://images.unsplash.com/photo-1625669709111-6df35affa0a5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80','string',15),(74,'https://images.unsplash.com/photo-1627678250237-f9e5801d65af?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80','string',15),(75,'https://images.unsplash.com/photo-1585128833421-cb27e4911276?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80','string',15),(76,'https://images.unsplash.com/photo-1551133990-60f24c1e4158?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80','string',15),(77,'https://images.unsplash.com/photo-1652113821689-b18a84f7f902?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=327&q=80','string',16),(78,'https://plus.unsplash.com/premium_photo-1663054910161-a6e4d0e146a0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=805&q=80','string',16),(79,'https://images.unsplash.com/photo-1597098540640-0cf6008159a0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=385&q=80','string',16),(80,'https://images.unsplash.com/photo-1536745511564-a5fa6e596e7b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=496&q=80','string',16),(81,'https://images.unsplash.com/photo-1588796460718-f457ad1e1a1f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80','string',16),(82,'https://images.unsplash.com/photo-1505693416388-ac5ce068fe85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80','string',17),(83,'https://images.unsplash.com/photo-1505873242700-f289a29e1e0f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=876&q=80','string',17),(84,'https://images.unsplash.com/photo-1597098540640-0cf6008159a0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=385&q=80','string',17),(85,'https://images.unsplash.com/photo-1536745511564-a5fa6e596e7b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=496&q=80','string',17),(86,'https://images.unsplash.com/photo-1588796460718-f457ad1e1a1f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80','string',17),(92,'https://images.unsplash.com/photo-1507086182422-97bd7ca2413b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=876&q=80','Esta es la foto 1 del producto',20),(93,'https://images.unsplash.com/photo-1562215179-c938ed0995cf?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80','Esta es la foto 2 del producto',20),(94,'https://images.unsplash.com/photo-1522708323590-d24dbb6b0267?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80','Esta es la foto 3 del producto',20),(95,'https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80','Esta es la foto 4 del producto',20),(96,'https://images.unsplash.com/photo-1542320260-f8f651de8c12?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80	Esta es la foto de un hotel	27										','Esta es la foto 5 del producto',20),(97,'https://images.unsplash.com/photo-1544124499-58912cbddaad?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80','Esta es la foto 1 del producto',21),(98,'https://images.unsplash.com/photo-1625244724120-1fd1d34d00f6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80','Esta es la foto 2 del producto',21),(99,'https://images.unsplash.com/photo-1596436889106-be35e843f974?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80','Esta es la foto 3 del producto',21);
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `policy`
--

DROP TABLE IF EXISTS `policy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `policy` (
  `policy_id` bigint NOT NULL AUTO_INCREMENT,
  `cancellation` varchar(500) DEFAULT NULL,
  `rules` varchar(500) DEFAULT NULL,
  `security` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`policy_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `policy`
--

LOCK TABLES `policy` WRITE;
/*!40000 ALTER TABLE `policy` DISABLE KEYS */;
INSERT INTO `policy` VALUES (1,'Política de cancelación flexible: permite cancelar la reserva sin cargo alguno si se realiza dentro de un plazo determinado antes de la fecha de llegada, por ejemplo, 24 o 48 horas antes de la llegada.','No fumar en las habitaciones o áreas comunes.No se permiten mascotas.No se permiten fiestas o eventos en las instalaciones.Se deben respetar las normas de convivencia y el descanso de los demás huéspedes.  ','Mantén tus pertenencias personales seguras en todo momento, especialmente si viajas con objetos de valor. Usa la caja fuerte del hotel para guardar tus objetos de valor y no los dejes en lugares visibles.Si planeas hacer transacciones financieras en línea mientras estás hospedado, asegúrate de utilizar una conexión segura y evitar hacerlo en computadoras públicas o en redes Wi-Fi abiertas.'),(2,'Política de cancelación moderada: permite cancelar la reserva sin cargo alguno si se realiza dentro de un plazo determinado antes de la fecha de llegada, pero puede aplicarse un cargo por cancelación si se cancela después de ese plazo.','El uso de la piscina o otras instalaciones puede estar restringido a ciertas horas o épocas del año.Se deben seguir las normas de seguridad y emergencia del lugar.No se permiten visitas en las habitaciones.No fumar en las habitaciones o áreas comunes.No se permiten comportamientos inapropiados o ilegales en las instalaciones.Se deben respetar las normas de higiene y limpieza del lugar.','Mantén tus pertenencias personales seguras en todo momento, especialmente si viajas con objetos de valor. Usa la caja fuerte del hotel para guardar tus objetos de valor y no los dejes en lugares visibles.Si planeas hacer transacciones financieras en línea mientras estás hospedado, asegúrate de utilizar una conexión segura y evitar hacerlo en computadoras públicas o en redes Wi-Fi abiertas.'),(3,'Política de cancelación estricta: puede aplicarse un cargo por cancelación si se cancela la reserva en cualquier momento, incluso si se cancela con semanas de anticipación.','No fumar en las habitaciones o áreas comunes.No se permiten mascotas.No se permiten fiestas o eventos en las instalaciones.Se deben respetar las normas de convivencia y el descanso de los demás huéspedes.  ','Mantén tus pertenencias personales seguras en todo momento, especialmente si viajas con objetos de valor. Usa la caja fuerte del hotel para guardar tus objetos de valor y no los dejes en lugares visibles.Si planeas hacer transacciones financieras en línea mientras estás hospedado, asegúrate de utilizar una conexión segura y evitar hacerlo en computadoras públicas o en redes Wi-Fi abiertas.'),(4,'Política de cancelación flexible: permite cancelar la reserva sin cargo alguno si se realiza dentro de un plazo determinado antes de la fecha de llegada, por ejemplo, 24 o 48 horas antes de la llegada.','El uso de la piscina o otras instalaciones puede estar restringido a ciertas horas o épocas del año.Se deben seguir las normas de seguridad y emergencia del lugar.No se permiten visitas en las habitaciones.No fumar en las habitaciones o áreas comunes.No se permiten comportamientos inapropiados o ilegales en las instalaciones.Se deben respetar las normas de higiene y limpieza del lugar.','Mantén tus pertenencias personales seguras en todo momento, especialmente si viajas con objetos de valor. Usa la caja fuerte del hotel para guardar tus objetos de valor y no los dejes en lugares visibles.Si planeas hacer transacciones financieras en línea mientras estás hospedado, asegúrate de utilizar una conexión segura y evitar hacerlo en computadoras públicas o en redes Wi-Fi abiertas.'),(5,'Política de cancelación moderada: permite cancelar la reserva sin cargo alguno si se realiza dentro de un plazo determinado antes de la fecha de llegada, pero puede aplicarse un cargo por cancelación si se cancela después de ese plazo.','\"Se deben respetar las normas de convivencia y el descanso de los demás huéspedes.No se permiten comportamientos inapropiados o ilegales en las instalaciones.No se permiten fiestas o eventos en las instalaciones.\n\"','Mantén tus pertenencias personales seguras en todo momento, especialmente si viajas con objetos de valor. Usa la caja fuerte del hotel para guardar tus objetos de valor y no los dejes en lugares visibles.Siempre mantén la puerta de tu habitación cerrada con llave, incluso si te encuentras en el interior.'),(6,'Tarifas no reembolsables: estas tarifas generalmente ofrecen un descuento en la tarifa normal de la habitación, pero no permiten cancelaciones ni cambios en la reserva y no ofrecen reembolsos en caso de cancelación o no presentación.','No fumar en las habitaciones o áreas comunes.No se permiten mascotas.No se permiten fiestas o eventos en las instalaciones.Se deben respetar las normas de convivencia y el descanso de los demás huéspedes.  ','Mantén tus pertenencias personales seguras en todo momento, especialmente si viajas con objetos de valor. Usa la caja fuerte del hotel para guardar tus objetos de valor y no los dejes en lugares visibles.Siempre mantén la puerta de tu habitación cerrada con llave, incluso si te encuentras en el interior.'),(7,'Política de cancelación estricta: puede aplicarse un cargo por cancelación si se cancela la reserva en cualquier momento, incluso si se cancela con semanas de anticipación.','El hotel no se hace responsable por objetos de valor que se dejen en las habitaciones.Se debe informar a la recepción sobre cualquier desperfecto o daño causado en la habitación o instalaciones.Se debe dejar la habitación en las mismas condiciones en las que se encontró.','Asegúrate de que el lugar donde te hospedarás cumpla con las normas de seguridad adecuadas, como extintores, sistemas de alarma, salidas de emergencia, entre otros.'),(8,'Política de cancelación flexible: permite cancelar la reserva sin cargo alguno si se realiza dentro de un plazo determinado antes de la fecha de llegada, por ejemplo, 24 o 48 horas antes de la llegada.','El hotel no se hace responsable por objetos de valor que se dejen en las habitaciones.Se debe informar a la recepción sobre cualquier desperfecto o daño causado en la habitación o instalaciones.Se debe dejar la habitación en las mismas condiciones en las que se encontró.','Asegúrate de que el lugar donde te hospedarás cumpla con las normas de seguridad adecuadas, como extintores, sistemas de alarma, salidas de emergencia, entre otros.'),(9,'Política de cancelación moderada: permite cancelar la reserva sin cargo alguno si se realiza dentro de un plazo determinado antes de la fecha de llegada, pero puede aplicarse un cargo por cancelación si se cancela después de ese plazo.','No fumar en las habitaciones o áreas comunes.No se permiten mascotas.No se permiten fiestas o eventos en las instalaciones.Se deben respetar las normas de convivencia y el descanso de los demás huéspedes.  ','Mantén tus pertenencias personales seguras en todo momento, especialmente si viajas con objetos de valor. Usa la caja fuerte del hotel para guardar tus objetos de valor y no los dejes en lugares visibles.Si planeas hacer transacciones financieras en línea mientras estás hospedado, asegúrate de utilizar una conexión segura y evitar hacerlo en computadoras públicas o en redes Wi-Fi abiertas.Siempre mantén la puerta de tu habitación cerrada con llave, incluso si te encuentras en el interior.'),(10,'Tarifas no reembolsables: estas tarifas generalmente ofrecen un descuento en la tarifa normal de la habitación, pero no permiten cancelaciones ni cambios en la reserva y no ofrecen reembolsos en caso de cancelación o no presentación.','\"Se deben respetar las normas de convivencia y el descanso de los demás huéspedes.No se permiten comportamientos inapropiados o ilegales en las instalaciones.No se permiten fiestas o eventos en las instalaciones.\n\"','Mantén tus pertenencias personales seguras en todo momento, especialmente si viajas con objetos de valor. Usa la caja fuerte del hotel para guardar tus objetos de valor y no los dejes en lugares visibles.Si planeas hacer transacciones financieras en línea mientras estás hospedado, asegúrate de utilizar una conexión segura y evitar hacerlo en computadoras públicas o en redes Wi-Fi abiertas.Siempre mantén la puerta de tu habitación cerrada con llave, incluso si te encuentras en el interior.'),(11,'Política de cancelación flexible: permite cancelar la reserva sin cargo alguno si se realiza dentro de un plazo determinado antes de la fecha de llegada, por ejemplo, 24 o 48 horas antes de la llegada.','El uso de la piscina o otras instalaciones puede estar restringido a ciertas horas o épocas del año.Se deben seguir las normas de seguridad y emergencia del lugar.No se permiten visitas en las habitaciones.No fumar en las habitaciones o áreas comunes.No se permiten comportamientos inapropiados o ilegales en las instalaciones.Se deben respetar las normas de higiene y limpieza del lugar.','Asegúrate de que el lugar donde te hospedarás cumpla con las normas de seguridad adecuadas, como extintores, sistemas de alarma, salidas de emergencia, entre otros.'),(12,'Política de cancelación moderada: permite cancelar la reserva sin cargo alguno si se realiza dentro de un plazo determinado antes de la fecha de llegada, pero puede aplicarse un cargo por cancelación si se cancela después de ese plazo.','\"Se deben respetar las normas de convivencia y el descanso de los demás huéspedes.No se permiten comportamientos inapropiados o ilegales en las instalaciones.No se permiten fiestas o eventos en las instalaciones.\n\"','Mantén tus pertenencias personales seguras en todo momento, especialmente si viajas con objetos de valor. Usa la caja fuerte del hotel para guardar tus objetos de valor y no los dejes en lugares visibles.Si planeas hacer transacciones financieras en línea mientras estás hospedado, asegúrate de utilizar una conexión segura y evitar hacerlo en computadoras públicas o en redes Wi-Fi abiertas.Siempre mantén la puerta de tu habitación cerrada con llave, incluso si te encuentras en el interior.'),(13,'Tarifas no reembolsables: estas tarifas generalmente ofrecen un descuento en la tarifa normal de la habitación, pero no permiten cancelaciones ni cambios en la reserva y no ofrecen reembolsos en caso de cancelación o no presentación.','El hotel no se hace responsable por objetos de valor que se dejen en las habitaciones.Se debe informar a la recepción sobre cualquier desperfecto o daño causado en la habitación o instalaciones.Se debe dejar la habitación en las mismas condiciones en las que se encontró.','Mantén tus pertenencias personales seguras en todo momento, especialmente si viajas con objetos de valor. Usa la caja fuerte del hotel para guardar tus objetos de valor y no los dejes en lugares visibles.Si planeas hacer transacciones financieras en línea mientras estás hospedado, asegúrate de utilizar una conexión segura y evitar hacerlo en computadoras públicas o en redes Wi-Fi abiertas.Siempre mantén la puerta de tu habitación cerrada con llave, incluso si te encuentras en el interior.'),(20,'string','string','string'),(21,'Política de cancelación flexible: permite cancelar la reserva sin cargo alguno si se realiza dentro de un plazo determinado antes de la fecha de llegada, por ejemplo, 24 o 48 horas antes de la llegada.','No fumar en las habitaciones o áreas comunes.No se permiten mascotas.No se permiten fiestas o eventos en las instalaciones.Se deben respetar las normas de convivencia y el descanso de los demás huéspedes.','Mantén tus pertenencias personales seguras en todo momento, especialmente si viajas con objetos de valor. Usa la caja fuerte del hotel para guardar tus objetos de valor y no los dejes en lugares visibles.Si planeas hacer transacciones financieras en línea mientras estás hospedado, asegúrate de utilizar una conexión segura y evitar hacerlo en computadoras públicas o en redes Wi-Fi abiertas.'),(22,'Política de cancelación flexible: permite cancelar la reserva sin cargo alguno si se realiza dentro de un plazo determinado antes de la fecha de llegada, por ejemplo, 24 o 48 horas antes de la llegada.','No fumar en las habitaciones o áreas comunes.No se permiten mascotas.No se permiten fiestas o eventos en las instalaciones.Se deben respetar las normas de convivencia y el descanso de los demás huéspedes.','Mantén tus pertenencias personales seguras en todo momento, especialmente si viajas con objetos de valor. Usa la caja fuerte del hotel para guardar tus objetos de valor y no los dejes en lugares visibles.Si planeas hacer transacciones financieras en línea mientras estás hospedado, asegúrate de utilizar una conexión segura y evitar hacerlo en computadoras públicas o en redes Wi-Fi abiertas.'),(23,'Política de cancelación flexible: permite cancelar la reserva sin cargo alguno si se realiza dentro de un plazo determinado antes de la fecha de llegada, por ejemplo, 24 o 48 horas antes de la llegada.','No fumar en las habitaciones o áreas comunes.No se permiten mascotas.No se permiten fiestas o eventos en las instalaciones.Se deben respetar las normas de convivencia y el descanso de los demás huéspedes.','Mantén tus pertenencias personales seguras en todo momento, especialmente si viajas con objetos de valor. Usa la caja fuerte del hotel para guardar tus objetos de valor y no los dejes en lugares visibles.Si planeas hacer transacciones financieras en línea mientras estás hospedado, asegúrate de utilizar una conexión segura y evitar hacerlo en computadoras públicas o en redes Wi-Fi abiertas.'),(28,'nfdg','asd','xzc'),(29,'','',''),(49,'Política de cancelación flexible: permite cancelar la reserva sin cargo alguno si se realiza dentro de un plazo determinado antes de la fecha de llegada, por ejemplo, 24 o 48 horas antes de la llegada.','No fumar en las habitaciones o áreas comunes.No se permiten mascotas.No se permiten fiestas o eventos en las instalaciones.Se deben respetar las normas de convivencia y el descanso de los demás huéspedes.  ','Mantén tus pertenencias personales seguras en todo momento, especialmente si viajas con objetos de valor. Usa la caja fuerte del hotel para guardar tus objetos de valor y no los dejes en lugares visibles.Si planeas hacer transacciones financieras en línea mientras estás hospedado, asegúrate de utilizar una conexión segura y evitar hacerlo en computadoras públicas o en redes Wi-Fi abiertas.Siempre mantén la puerta de tu habitación cerrada con llave, incluso si te encuentras en el interior.'),(50,'El hotel no se hace responsable por objetos de valor que se dejen en las habitaciones.\n','El hotel no se hace responsable por objetos de valor que se dejen en las habitaciones.\n','El hotel no se hace responsable por objetos de valor que se dejen en las habitaciones.\n');
/*!40000 ALTER TABLE `policy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `product_id` bigint NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `review` varchar(255) DEFAULT NULL,
  `scoring` int DEFAULT NULL,
  `stars` int DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `address_address_id` bigint DEFAULT NULL,
  `category_id` bigint NOT NULL,
  `policy_id` bigint DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `FK14vx4cn7xpni1ldhfxwvo72sd` (`address_address_id`),
  KEY `FK1mtsbur82frn64de7balymq9s` (`category_id`),
  KEY `FKh6gp13w0nd67eq1njgwqf7e26` (`policy_id`),
  CONSTRAINT `FK14vx4cn7xpni1ldhfxwvo72sd` FOREIGN KEY (`address_address_id`) REFERENCES `address` (`address_id`),
  CONSTRAINT `FK1mtsbur82frn64de7balymq9s` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`),
  CONSTRAINT `FKh6gp13w0nd67eq1njgwqf7e26` FOREIGN KEY (`policy_id`) REFERENCES `policy` (`policy_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'El Hotel Select se encuentra en Piriápolis y ofrece alojamiento con jardín, aparcamiento privado gratuito, salón compartido y terraza. Este hotel de 3 estrellas cuenta con club infantil, recepción 24 horas y WiFi gratuita.','Muy bueno',7,3,'Hotel Select',1,1,1),(2,'Alojamiento de alta categoría con inigualable vista al Rio Negro, amenities pensados para el disfrute y descanso de todas las edades en cualquier época del año y gran variedad gastronómica.','Excelente ',9,4,'Hotel Midland',2,1,2),(3,'Vivienda de pequeñas dimensiones, que consta de una o dos habitaciones, con una cocina y un cuarto de baño pequeños','Medio pelo ',5,2,'Martin Aquino',3,2,3),(4,'El Resort del Mar se encuentra en el distrito de Miramar Beach de Destin, a 300 metros de la playa de Miramar, a 23 km del parque Fort Walton Beach y a 13 km de Big Kahunas.','Buenisimo',7,3,'Resort del Mar',4,3,4),(5,'Situado en el borde de una colina, a 300 metros del corazón del centro de la ciudad de La Paz, este hotel de 5 estrellas ofrece vistas panorámicas de las Montañas Azules, declaradas Patrimonio de la Humanidad.','Excelentes vistas',9,5,'Mountain Heritage Hotel',5,4,5),(6,'El apartamento cuenta con ventanas de doble panel que mantienen el ruido exterior al mínimo y brindan una vista impresionante de la ciudad. También hay aire acondicionado y calefacción central para mantener la temperatura agradable en cualquier época del ','Buena',6,3,'Villa Italia',6,5,6),(7,'Este hermoso hosepdaje se encuentra en el corazón de la ciudad, cerca de tiendas, restaurantes y lugares de entretenimiento. Tiene dos habitaciones amplias con armarios empotrados, dos baños completos y una cocina completamente equipada con electrodomésti','Hermosas vistas',8,4,'Posta del Hum',7,6,7),(8,'El edificio cuenta con seguridad las 24 horas y un gimnasio bien equipado para que pueda mantenerse en forma. También hay una hermosa terraza en la azotea con vistas panorámicas de la ciudad, donde podrá disfrutar de un hermoso atardecer.','Mala experiencia',2,1,'Parque Libertario',8,7,8),(9,'Nuestro hospedaje en una casa es una opción ideal para aquellos que buscan una experiencia hogareña en su viaje. Ubicada en un barrio tranquilo y seguro de la ciudad, nuestra casa está diseñada para ofrecer una estancia cómoda y agradable.','Perfecta',9,3,'Casa Romana',9,8,9),(10,'Nuestro hospedaje en una pensión es una opción económica y cómoda para aquellos que buscan una estancia sencilla y práctica. Ubicada en el centro de la ciudad, nuestra pensión está diseñada para ofrecer una estancia confortable y práctica.','Mala ubicación',5,2,'Pension Pinto',10,9,10),(11,'Cada habitación está decorada con un estilo sencillo y funcional, con muebles cómodos y ropa de cama suave y limpia.','Normal',6,3,'Albuerga2',11,10,11),(12,'En resumen, nuestro alquiler en un motel es una opción práctica y asequible para aquellos que buscan una estancia cómoda y de corta duración. Ofrecemos una ubicación conveniente, habitaciones sencillas pero confortables y servicios adicionales para hacer ','Muy Normal',6,3,'Scotty\'s Motel',13,11,12),(13,'¡Bienvenidos a nuestro hospedaje Bed & Breakfast!','Excelente',9,4,'B&B for life',16,12,13),(14,'La Posada El Viajero ofrece habitaciones amplias y luminosas justo enfrente del pintoresco Río de la Plata. Ofrece alquiler de bicicletas y organiza excursiones a caballo y visitas por la ciudad. La parada de autobús está a 400 metros. Hay conexión WiFi g','Excelente',9,9,'Posada El Viajero',24,5,20),(15,'Ofrecemos una variedad de opciones de alojamiento, desde habitaciones acogedoras hasta villas privadas, así como una amplia gama de actividades al aire libre y servicios de spa.','Muy bueno',8,5,'Hotel Mali',25,1,21),(16,'Hotel económico y cómodo: Este hotel es ideal para aquellos viajeros que buscan un lugar asequible para pasar la noche y descansar cómodamente. Aunque es un hotel sencillo, ofrece todas las comodidades necesarias para una estancia agradable.','Muy bueno',7,3,'Hotel Materazzi',26,1,22),(17,'Una escapada relajante: Disfrute de una escapada relajante en nuestro hotel de 4 estrellas enclavado en un hermoso paisaje natural. Ofrecemos una variedad de opciones de alojamiento, desde habitaciones acogedoras hasta villas privadas, así como una amplia','Genial',8,2,'Los Cocos',27,1,23),(20,'Una experiencia cultural: Descubra la cultura local en nuestro hotel histórico de 4 estrellas, ubicado en un edificio del siglo XVIII con detalles arquitectónicos únicos. Nuestras habitaciones y suites ofrecen una mezcla de tradición y comodidades modern','Muy bueno',7,3,'Hotel Atenas',53,1,49),(21,'Un hotel rodeado de exuberante naturaleza y un lago cristalino de aguas turquesas, ofreciendo una experiencia de relajación inigualable.','Muy bueno',7,3,'Casa para Demo',54,1,50);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_feature`
--

DROP TABLE IF EXISTS `product_feature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_feature` (
  `products_product_id` bigint NOT NULL,
  `features_feature_id` bigint NOT NULL,
  PRIMARY KEY (`products_product_id`,`features_feature_id`),
  KEY `FKdfupd915ty666u7t0jmtgyqvc` (`features_feature_id`),
  CONSTRAINT `FKdfupd915ty666u7t0jmtgyqvc` FOREIGN KEY (`features_feature_id`) REFERENCES `feature` (`feature_id`),
  CONSTRAINT `FKqcwtudcl6x913e472cqxynbyi` FOREIGN KEY (`products_product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_feature`
--

LOCK TABLES `product_feature` WRITE;
/*!40000 ALTER TABLE `product_feature` DISABLE KEYS */;
INSERT INTO `product_feature` VALUES (1,1),(14,1),(15,1),(16,1),(17,1),(20,1),(21,1),(17,2),(20,2),(21,2),(1,3),(2,3),(3,3),(4,3),(5,3),(13,3),(15,3),(17,3),(2,4),(3,4),(4,4),(5,4),(15,4),(16,4),(17,4),(20,4),(1,5),(13,6),(20,6),(1,7),(2,7),(3,7),(4,7),(5,7),(15,7),(17,7);
/*!40000 ALTER TABLE `product_feature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserve`
--

DROP TABLE IF EXISTS `reserve`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reserve` (
  `reserve_id` bigint NOT NULL AUTO_INCREMENT,
  `check_in` date NOT NULL,
  `check_out` date NOT NULL,
  `start_time` time NOT NULL,
  `product_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`reserve_id`),
  KEY `FKp94chr3q3kfhw7nj28xbrwtvd` (`product_id`),
  KEY `FK1d7yu6hylv07r7aq4exb2yu4m` (`user_id`),
  CONSTRAINT `FK1d7yu6hylv07r7aq4exb2yu4m` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `FKp94chr3q3kfhw7nj28xbrwtvd` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserve`
--

LOCK TABLES `reserve` WRITE;
/*!40000 ALTER TABLE `reserve` DISABLE KEYS */;
INSERT INTO `reserve` VALUES (1,'2023-05-17','2023-05-26','12:00:23',5,3),(2,'2023-05-17','2023-05-26','12:00:23',5,3),(3,'2023-05-17','2023-05-26','12:00:23',5,3),(4,'2023-05-03','2023-05-12','14:00:00',11,2),(5,'2023-04-12','2023-04-21','16:00:00',1,5),(6,'2023-05-22','2023-05-24','15:00:00',7,6),(7,'2023-05-28','2023-05-31','16:00:00',5,1),(8,'2023-05-25','2023-05-27','14:00:00',1,1),(9,'2023-05-17','2023-05-26','14:00:00',10,1),(10,'2023-05-22','2023-05-31','16:00:00',9,8),(11,'2023-05-09','2023-05-17','15:00:00',1,11),(12,'2023-04-21','2023-04-29','16:00:00',9,1);
/*!40000 ALTER TABLE `reserve` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'user@gmail.com','user','user','$2a$10$uosJPvildQIAJiCD7m8XaeOvGjWHfBoQ3eXl.w7b5/Cy5GTwY9gES','USER','user'),(2,'admin@gmail.com','admin','admin','$2a$10$3uE6ddsSLS73SRG.ESBpjOz3amN8BiZZdRZS2r2LikeWXUqsLin3O','ADMIN','admin'),(3,'host@gmail.com','host','host','$2a$10$gY/Bvt4bStBnFq3eCYU1pukO3.Kh7zT41zBEkrg53ybtWjvCpT4WW','HOST','host'),(4,'chipotle@chipotle.com','Rocky','Montero','$2a$10$GwNGUbDdoadf.04KGnmdLeelblJKBaSPgGb5.ubK8RtbO11so6qoK','USER','rockyz7'),(5,'userPrueba77@gmail.com','userPrueba77','userPrueba','$2a$10$iijW5FFAYmQPL6SryxcFZ.QP5/Kj7TqX5XLYIjIZ8JMI35Ps42uKi','USER','userPrueba77'),(6,'pepitofueaparis@gmail.com','pepito','FueAParis','$2a$10$Phbu/xhv6YOk7YvEs2.9YuqFLvSKniLzHPLlEsjXHx6zf9M498RDG','HOST','pepitofueaparis'),(7,'damidellacqua13@gmail.com','Dami','DellAcqua','$2a$10$gK8mXcQIkttkbGlK9trKz.q89NPjUC/AsY5CWTlGS8hJCabog1A.u','USER','Dellacqua'),(8,'d.dellacquaruiz1@gmail.com','equipo6','demo2023','$2a$10$ZTdBIHOXED8kNb09k46mKuna29YpkR.MOq5v730eKjHAjFPbOKdMW','USER','demo2023'),(9,'prueba123456@gmail.com','Camada3','sadasdas','$2a$10$G0ClLW.j1h/O14I0y69eEe2/PLW0eEsB6WMAo9iQ020H8oH.z8YkK','USER','DHFINAL'),(10,'user@gmail.com','User','User','$2a$10$nkXlNnCZjqLmLrTZs2tlEeT4.aaQw4lntz.G6.0Cq5Jlfqd3Q3qAy','USER','usuarioejemplo'),(11,'fff@gmail.com','Pepito','Menganito','$2a$10$4bqRxGa8QiOYj9psifMds.lVwb7vIGXAh3uVbzB5lqdiB.bLD3JZa','USER','pepito');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-15 21:55:10
