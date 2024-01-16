CREATE DATABASE  IF NOT EXISTS `pokedex` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `pokedex`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: pokedex
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
-- Table structure for table `package`
--

DROP TABLE IF EXISTS `package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `package` (
  `packageId` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `pokemon_id` int NOT NULL,
  `cp` int NOT NULL,
  PRIMARY KEY (`packageId`),
  KEY `up_user_id_idx` (`user_id`),
  KEY `up_pokemon_id_idx` (`pokemon_id`),
  CONSTRAINT `up_pokemon_id` FOREIGN KEY (`pokemon_id`) REFERENCES `pokemon` (`pokemonId`),
  CONSTRAINT `up_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package`
--

LOCK TABLES `package` WRITE;
/*!40000 ALTER TABLE `package` DISABLE KEYS */;
INSERT INTO `package` VALUES (1,1,1,50),(2,1,1,30),(3,1,778,50);
/*!40000 ALTER TABLE `package` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pokemon`
--

DROP TABLE IF EXISTS `pokemon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pokemon` (
  `pokemonId` int NOT NULL,
  `pokemonName` varchar(100) NOT NULL,
  `img` varchar(1000) NOT NULL,
  PRIMARY KEY (`pokemonId`),
  UNIQUE KEY `name_UNIQUE` (`pokemonName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pokemon`
--

LOCK TABLES `pokemon` WRITE;
/*!40000 ALTER TABLE `pokemon` DISABLE KEYS */;
INSERT INTO `pokemon` VALUES (1,'妙蛙種子','0001.png'),(2,'妙蛙草','0002.png'),(3,'妙蛙花','0003.png'),(4,'小火龍','0004.png'),(5,'火恐龍','0005.png'),(6,'噴火龍','0006.png'),(7,'傑尼龜','0007.png'),(8,'卡咪龜','0008.png'),(9,'水箭龜','0009.png'),(10,'綠毛蟲','0010.png'),(11,'鐵甲蛹','0011.png'),(12,'巴大蝶','0012.png'),(13,'獨角蟲','0013.png'),(14,'鐵殼蛹','0014.png'),(15,'大針鋒','0015.png'),(16,'波波','0016.png'),(17,'比比鳥','0017.png'),(18,'大比鳥','0018.png'),(19,'小拉達','0019.png'),(20,'拉達','0020.png'),(21,'烈雀','0021.png'),(22,'大嘴雀','0022.png'),(23,'阿柏蛇','0023.png'),(24,'阿柏怪','0024.png'),(25,'皮卡丘','0025.png'),(384,'烈空座','0384.png'),(778,'謎擬Q','0778.png');
/*!40000 ALTER TABLE `pokemon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pokemon_type`
--

DROP TABLE IF EXISTS `pokemon_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pokemon_type` (
  `pokemon_id` int NOT NULL,
  `type_id` int NOT NULL,
  PRIMARY KEY (`pokemon_id`,`type_id`),
  KEY `pt_type_id_idx` (`type_id`),
  CONSTRAINT `pt_pokemon_id` FOREIGN KEY (`pokemon_id`) REFERENCES `pokemon` (`pokemonId`),
  CONSTRAINT `pt_type_id` FOREIGN KEY (`type_id`) REFERENCES `type` (`typeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pokemon_type`
--

LOCK TABLES `pokemon_type` WRITE;
/*!40000 ALTER TABLE `pokemon_type` DISABLE KEYS */;
INSERT INTO `pokemon_type` VALUES (16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(4,2),(5,2),(6,2),(7,3),(8,3),(9,3),(1,4),(2,4),(3,4),(25,5),(1,8),(2,8),(3,8),(13,8),(14,8),(15,8),(23,8),(24,8),(6,10),(12,10),(16,10),(17,10),(18,10),(21,10),(22,10),(384,10),(10,12),(11,12),(12,12),(13,12),(14,12),(15,12),(778,14),(384,15),(778,18);
/*!40000 ALTER TABLE `pokemon_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type`
--

DROP TABLE IF EXISTS `type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `type` (
  `typeId` int NOT NULL,
  `typeName` varchar(100) NOT NULL,
  PRIMARY KEY (`typeId`),
  UNIQUE KEY `name` (`typeName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type`
--

LOCK TABLES `type` WRITE;
/*!40000 ALTER TABLE `type` DISABLE KEYS */;
INSERT INTO `type` VALUES (1,'一般'),(6,'冰'),(9,'地面'),(18,'妖精'),(13,'岩石'),(14,'幽靈'),(16,'惡'),(7,'格鬥'),(8,'毒'),(3,'水'),(2,'火'),(4,'草'),(12,'蟲'),(11,'超能力'),(17,'鋼'),(5,'電'),(10,'飛行'),(15,'龍');
/*!40000 ALTER TABLE `type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `userName` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `level` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`userId`),
  UNIQUE KEY `name_UNIQUE` (`userName`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'user1','123',1);
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

-- Dump completed on 2024-01-15 11:22:58
