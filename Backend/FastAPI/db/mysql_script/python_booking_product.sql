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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'El Hotel Select se encuentra en Piriápolis y ofrece alojamiento con jardín, aparcamiento privado gratuito, salón compartido y terraza. Este hotel de 3 estrellas cuenta con club infantil, recepción 24 horas y WiFi gratuita.','Muy bueno',7,3,'Hotel Select',1,1,1),(2,'Alojamiento de alta categoría con inigualable vista al Rio Negro, amenities pensados para el disfrute y descanso de todas las edades en cualquier época del año y gran variedad gastronómica.','Excelente ',9,4,'Hotel Midland',2,1,2),(3,'Vivienda de pequeñas dimensiones, que consta de una o dos habitaciones, con una cocina y un cuarto de baño pequeños','Medio pelo ',5,2,'Martin Aquino',3,2,3),(4,'El Resort del Mar se encuentra en el distrito de Miramar Beach de Destin, a 300 metros de la playa de Miramar, a 23 km del parque Fort Walton Beach y a 13 km de Big Kahunas.','Buenisimo',7,3,'Resort del Mar',4,3,4),(5,'Situado en el borde de una colina, a 300 metros del corazón del centro de la ciudad de La Paz, este hotel de 5 estrellas ofrece vistas panorámicas de las Montañas Azules, declaradas Patrimonio de la Humanidad.','Excelentes vistas',9,5,'Mountain Heritage Hotel',5,4,5),(6,'El apartamento cuenta con ventanas de doble panel que mantienen el ruido exterior al mínimo y brindan una vista impresionante de la ciudad. También hay aire acondicionado y calefacción central para mantener la temperatura agradable en cualquier época del ','Buena',6,3,'Villa Italia',6,5,6),(7,'Este hermoso hosepdaje se encuentra en el corazón de la ciudad, cerca de tiendas, restaurantes y lugares de entretenimiento. Tiene dos habitaciones amplias con armarios empotrados, dos baños completos y una cocina completamente equipada con electrodomésti','Hermosas vistas',8,4,'Posta del Hum',7,6,7),(8,'El edificio cuenta con seguridad las 24 horas y un gimnasio bien equipado para que pueda mantenerse en forma. También hay una hermosa terraza en la azotea con vistas panorámicas de la ciudad, donde podrá disfrutar de un hermoso atardecer.','Mala experiencia',2,1,'Parque Libertario',8,7,8),(9,'Nuestro hospedaje en una casa es una opción ideal para aquellos que buscan una experiencia hogareña en su viaje. Ubicada en un barrio tranquilo y seguro de la ciudad, nuestra casa está diseñada para ofrecer una estancia cómoda y agradable.','Perfecta',9,3,'Casa Romana',9,8,9),(10,'Nuestro hospedaje en una pensión es una opción económica y cómoda para aquellos que buscan una estancia sencilla y práctica. Ubicada en el centro de la ciudad, nuestra pensión está diseñada para ofrecer una estancia confortable y práctica.','Mala ubicación',5,2,'Pension Pinto',10,9,10),(11,'Cada habitación está decorada con un estilo sencillo y funcional, con muebles cómodos y ropa de cama suave y limpia.','Normal',6,3,'Albuerga2',11,10,11),(12,'En resumen, nuestro alquiler en un motel es una opción práctica y asequible para aquellos que buscan una estancia cómoda y de corta duración. Ofrecemos una ubicación conveniente, habitaciones sencillas pero confortables y servicios adicionales para hacer ','Muy Normal',6,3,'Scotty\'s Motel',13,11,12),(13,'¡Bienvenidos a nuestro hospedaje Bed & Breakfast!','Excelente',9,4,'B&B for life',16,12,13),(14,'La Posada El Viajero ofrece habitaciones amplias y luminosas justo enfrente del pintoresco Río de la Plata. Ofrece alquiler de bicicletas y organiza excursiones a caballo y visitas por la ciudad. La parada de autobús está a 400 metros. Hay conexión WiFi g','Excelente',9,9,'Posada El Viajero',24,5,20),(15,'Ofrecemos una variedad de opciones de alojamiento, desde habitaciones acogedoras hasta villas privadas, así como una amplia gama de actividades al aire libre y servicios de spa.','Muy bueno',8,5,'Hotel Mali',25,1,21),(16,'Hotel económico y cómodo: Este hotel es ideal para aquellos viajeros que buscan un lugar asequible para pasar la noche y descansar cómodamente. Aunque es un hotel sencillo, ofrece todas las comodidades necesarias para una estancia agradable.','Muy bueno',7,3,'Hotel Materazzi',26,1,22),(17,'Una escapada relajante: Disfrute de una escapada relajante en nuestro hotel de 4 estrellas enclavado en un hermoso paisaje natural. Ofrecemos una variedad de opciones de alojamiento, desde habitaciones acogedoras hasta villas privadas, así como una amplia','Genial',8,2,'Los Cocos',27,1,23),(20,'Una experiencia cultural: Descubra la cultura local en nuestro hotel histórico de 4 estrellas, ubicado en un edificio del siglo XVIII con detalles arquitectónicos únicos. Nuestras habitaciones y suites ofrecen una mezcla de tradición y comodidades modern','Muy bueno',7,3,'Hotel Atenas',53,1,49),(21,'Un hotel rodeado de exuberante naturaleza y un lago cristalino de aguas turquesas, ofreciendo una experiencia de relajación inigualable.','Muy bueno',7,3,'Casa para Demo',54,1,50),(24,'Casa Damian','Muy bueno',7,3,'Casa Dami',57,1,57),(25,'Casa de testeo n1','Muy bueno',7,3,'Casa de Testeo',58,7,58);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-27 22:22:21
