-- MySQL dump 10.13  Distrib 8.0.25, for Linux (x86_64)
--
-- Host: localhost    Database: db_ejemplo
-- ------------------------------------------------------
-- Server version	8.0.27-0ubuntu0.20.04.1

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
-- Table structure for table `locaciones`
--

DROP TABLE IF EXISTS `locaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locaciones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ciudad` varchar(100) DEFAULT NULL,
  `provincia` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locaciones`
--

LOCK TABLES `locaciones` WRITE;
/*!40000 ALTER TABLE `locaciones` DISABLE KEYS */;
INSERT INTO `locaciones` VALUES (1,'Rosario','Santa Fe'),(2,'Zárate','Buenos Aires'),(3,'Iruya','Salta'),(4,'Córdoba','Córdoba'),(5,'San Miguel de Tucumán','Tucumán'),(6,'San Juan','San Juan'),(7,'San Luis','San Luis'),(8,'San Rafael','Mendoza'),(9,'San Carlos de Bariloche','Río Negro'),(10,'Plaza Huincul','Neuquén');
/*!40000 ALTER TABLE `locaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personas`
--

DROP TABLE IF EXISTS `personas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `id_locacion` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_locacion` (`id_locacion`),
  CONSTRAINT `personas_ibfk_1` FOREIGN KEY (`id_locacion`) REFERENCES `locaciones` (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personas`
--

LOCK TABLES `personas` WRITE;
/*!40000 ALTER TABLE `personas` DISABLE KEYS */;
INSERT INTO `personas` VALUES (1,'Isacco','Robinson',1),(2,'Ronda','Balshen',9),(3,'Kalila','Stallworthy',4),(4,'Carol-jean','Seamon',1),(5,'Neville','Bessant',7),(6,'Sherm','O\'Sesnane',10),(7,'Christy','Stachini',3),(8,'Gerome','Coulman',5),(9,'Shalom','Polak',6),(10,'Reade','Hastwell',1),(11,'August','Sargison',5),(12,'Troy','Khomin',3),(13,'Christean','Riggert',6),(14,'Cally','Barnfather',3),(15,'Avery','Linguard',7),(16,'Peggie','O\'Cullinane',7),(17,'Mag','Barkway',7),(18,'Nikolia','Courvert',3),(19,'Abe','Berr',5),(20,'Renelle','Olkowicz',10),(21,'Dwayne','Lancaster',7),(22,'Felicia','Larsen',6),(23,'Vance','Temby',6),(24,'Niel','Kubal',8),(25,'Nye','Covotti',9),(26,'Pablo','Beaufoy',4),(27,'Marwin','Chard',2),(28,'Deeann','Neenan',10),(29,'Mada','Casa',2),(30,'Raquel','Branigan',9),(31,'Florenza','Oattes',6),(32,'Land','Writtle',3),(33,'Annetta','Larham',8),(34,'Nico','Wethered',9),(35,'Dulci','Gunner',8),(36,'Malinde','Quested',10),(37,'Lorry','MacGuigan',10),(38,'Haskel','Grindle',7),(39,'Sampson','Fogarty',4),(40,'Donielle','Pearmine',1),(41,'Stephanie','Slader',6),(42,'Luise','Kelsow',6),(43,'Carolan','Choake',5),(44,'Dalenna','Keach',3),(45,'Kara','Fulham',5),(46,'Hinze','Bonniface',6),(47,'Lucie','Funcheon',2),(48,'Iormina','Puttick',10),(49,'Corene','Birckmann',10),(50,'Deena','Canto',10);
/*!40000 ALTER TABLE `personas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-05  1:34:44
