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
-- Table structure for table `pokeball`
--

DROP TABLE IF EXISTS `pokeball`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pokeball` (
  `pokeballId` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `pokemon_id` int NOT NULL,
  `cp` int NOT NULL,
  PRIMARY KEY (`pokeballId`),
  KEY `up_user_id_idx` (`user_id`),
  KEY `up_pokemon_id_idx` (`pokemon_id`),
  CONSTRAINT `up_pokemon_id` FOREIGN KEY (`pokemon_id`) REFERENCES `pokemon` (`pokemonId`),
  CONSTRAINT `up_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pokeball`
--

LOCK TABLES `pokeball` WRITE;
/*!40000 ALTER TABLE `pokeball` DISABLE KEYS */;
INSERT INTO `pokeball` (user_id,pokemon_id,cp) VALUES (1,1,50),(1,1,30),(1,778,50);
/*!40000 ALTER TABLE `pokeball` ENABLE KEYS */;
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
  `description` varchar(1000) NOT NULL,
  PRIMARY KEY (`pokemonId`),
  UNIQUE KEY `name_UNIQUE` (`pokemonName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pokemon`
--

LOCK TABLES `pokemon` WRITE;
/*!40000 ALTER TABLE `pokemon` DISABLE KEYS */;
INSERT INTO `pokemon` VALUES (1,'妙蛙種子','0001.png','經常可見牠在太陽下睡午覺的樣子。在沐浴了充足的陽光之後，牠背上的種子就會成長茁壯。'),(2,'妙蛙草','0002.png','下盤為了支撐背上的花苞而變得強韌。當待在太陽底下一動也不動的時間變長，就表示大朵的花即將盛開。'),(3,'妙蛙花','0003.png','據說充足的營養和陽光會讓花朵的顏色變得更加鮮豔。花朵散發的香氣能夠療癒人心。'),(4,'小火龍','0004.png','天生喜歡熱熱的東西。據說當牠被雨淋濕的時候，尾巴的末端會冒出煙來。'),(5,'火恐龍','0005.png','揮動燃燒著火焰的尾巴，用鋒利的爪子撕裂對手。性情十分粗暴。'),(6,'噴火龍','0006.png','會噴出彷彿連岩石都能燒焦的灼熱火焰。有時會引發森林火災。'),(7,'傑尼龜','0007.png','甲殼的作用不僅是用來保護自己，圓潤的外形和表面的溝槽會減少水的阻力，使牠能夠快速地游泳。'),(8,'卡咪龜','0008.png','長滿蓬鬆毛髮的大尾巴，顏色會隨著年齡增長而變深。甲殼上的傷痕是強者的證明。'),(9,'水箭龜','0009.png','甲殼上的噴射口能夠精確地瞄準目標。射出的水彈可以命中５０公尺外的空罐子。'),(10,'綠毛蟲','0010.png','會從頭部的觸角釋放出強烈的氣味來趕走敵人，藉此保護自己。'),(11,'鐵甲蛹','0011.png','正處於等待進化的狀態。除了變硬之外什麼都做不了，只能動也不動以免遭受攻擊。'),(12,'巴大蝶','0012.png','當牠飛快地拍動翅膀，帶有劇毒的鱗粉就會隨著風向這裡飄過來。'),(13,'獨角蟲','0013.png','有著非常靈敏的嗅覺。能用大大的紅鼻子聞出自己喜歡吃和不喜歡吃的葉子。'),(14,'鐵殼蛹','0014.png','雖然掛在樹上幾乎一動也不動，但體內正為了進化而忙碌準備著。證據就是牠的身體會變得很熱。'),(15,'大針鋒','0015.png','大針蜂非常重視自己的地盤，為了安全起見，最好不要接近牠的住處。一旦生氣就會成群結隊襲擊而來。'),(16,'波波','0016.png','因為方向感非常好，所以無論到了離巢穴多遠的地方，都能不迷路地飛回巢穴。'),(17,'比比鳥','0017.png','會飛在空中巡視自己廣大的地盤。要是有誰膽敢侵犯牠的地盤，牠會毫不留情地用利爪狠狠教訓一番。'),(18,'大比鳥','0018.png','有著亮麗羽毛的寶可夢。有許多訓練家被大比鳥頭上美麗的羽毛深深吸引而開始培育牠。'),(19,'小拉達','0019.png','門牙會終生生長，如果長得太長，就會因為無法進食而餓死。'),(20,'拉達','0020.png','據說牠為了躲避敵人，會用後腳的小蹼在海中游泳，渡海逃往別的島嶼。'),(21,'烈雀','0021.png','生性魯莽衝動，只要是為了守護自己的地盤，即使對手是大型寶可夢也會正面迎戰。'),(22,'大嘴雀','0022.png','在大嘴雀的地盤上帶著食物走動是件危險的事，食物轉眼間就會被奪走。'),(23,'阿柏蛇','0023.png','會藉由讓下顎脫臼來吞食比自己更大的獵物。進食之後會蜷縮起身子休息。'),(24,'阿柏怪','0024.png','最新的研究結果顯示，牠們肚子上的花紋有２０種以上的不同圖案。'),(25,'皮卡丘','0025.png','雙頰上有儲存電力的囊袋。一旦生氣就會把儲存的電力一口氣釋放出來。'),(384,'烈空座','0384.png','據說已經生存了數億年。世上留存著牠調解了固拉多與蓋歐卡之間爭鬥的傳說。'),(778,'謎擬Q','0778.png','棲息在陽光照射不到的陰暗處。在人們面前現身時會用看似皮卡丘的布來隱藏全身。');
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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user`(userName,password,level) VALUES ('user1','123',1);
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

-- Dump completed on 2024-01-17 10:37:37
