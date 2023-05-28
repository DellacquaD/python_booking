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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'user@gmail.com','user','user','$2a$10$uosJPvildQIAJiCD7m8XaeOvGjWHfBoQ3eXl.w7b5/Cy5GTwY9gES','USER','user'),(2,'admin@gmail.com','admin','admin','$2a$10$3uE6ddsSLS73SRG.ESBpjOz3amN8BiZZdRZS2r2LikeWXUqsLin3O','ADMIN','admin'),(3,'host@gmail.com','host','host','$2a$10$gY/Bvt4bStBnFq3eCYU1pukO3.Kh7zT41zBEkrg53ybtWjvCpT4WW','HOST','host'),(4,'chipotle@chipotle.com','Rocky','Montero','$2a$10$GwNGUbDdoadf.04KGnmdLeelblJKBaSPgGb5.ubK8RtbO11so6qoK','USER','rockyz7'),(5,'userPrueba77@gmail.com','userPrueba77','userPrueba','$2a$10$iijW5FFAYmQPL6SryxcFZ.QP5/Kj7TqX5XLYIjIZ8JMI35Ps42uKi','USER','userPrueba77'),(6,'pepitofueaparis@gmail.com','pepito','FueAParis','$2a$10$Phbu/xhv6YOk7YvEs2.9YuqFLvSKniLzHPLlEsjXHx6zf9M498RDG','HOST','pepitofueaparis'),(7,'damidellacqua13@gmail.com','Dami','DellAcqua','$2a$10$gK8mXcQIkttkbGlK9trKz.q89NPjUC/AsY5CWTlGS8hJCabog1A.u','USER','Dellacqua'),(8,'d.dellacquaruiz1@gmail.com','equipo6','demo2023','$2a$10$ZTdBIHOXED8kNb09k46mKuna29YpkR.MOq5v730eKjHAjFPbOKdMW','USER','demo2023'),(9,'prueba123456@gmail.com','Camada3','sadasdas','$2a$10$G0ClLW.j1h/O14I0y69eEe2/PLW0eEsB6WMAo9iQ020H8oH.z8YkK','USER','DHFINAL'),(10,'user@gmail.com','User','User','$2a$10$nkXlNnCZjqLmLrTZs2tlEeT4.aaQw4lntz.G6.0Cq5Jlfqd3Q3qAy','USER','usuarioejemplo'),(11,'fff@gmail.com','Pepito','Menganito','$2a$10$4bqRxGa8QiOYj9psifMds.lVwb7vIGXAh3uVbzB5lqdiB.bLD3JZa','USER','pepito'),(12,'robertitoNoble@gmail.com','Roberto','Noble','********','USER','robertitoNoble'),(13,'d.dellacquaruiz@gmail.com','damian.dellacqua','Dell\'Acqua','$2a$10$lpQvZ5C4r4nGg.4HloJzRepACkw/2SMJmmdypNR4KQbHYSelBRqhe','USER','d.dellacquaruiz@gmail.com'),(14,'damidellacqua13@gmail.com','damian.dellacqua','Mefisto','$2a$10$Ce4EqGItITljUWNP45q2VO4XDdgpFjgzRBDEuZ1Xp56VWGig78SJi','USER','damian.dellacqua'),(15,'python@python.com','python','python','$2a$10$s/olwP5b6H03iXD.GkKtQ.xx/gEpeuLAG9p8.BcyXm4Q0Ze0gecTq','USER','python'),(16,'tholeito@tholeito.com','tholeito','tholeito','$2b$12$8crBoGtCr57HVTBi0ChoTuvhvVRTTuimQhuEPP0J3UKaJ.5kIk0Iq',NULL,'tholeito'),(17,'testing01@testing01.com','testing01','testing01','$2b$12$yrbYc7T2Ib.88KiScYbej.O/bNSwMoWCWXoJ7My1hBmW/qdFMVb0y',NULL,'testing01'),(18,'testing02@testing02.com','testing02','testing02','$2b$12$iM8WoqcWOdTw3APL8fhs/eoZQB15UU4MhPDAkP1mcubPsjPohovcO','HOST','testing02');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
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
