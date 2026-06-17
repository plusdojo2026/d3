-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: d3
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `coffee`
--
CREATE DATABASE d3;
USE d3


DROP TABLE IF EXISTS `coffee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coffee` (
  `coffeenumber` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `valu` int DEFAULT NULL,
  `size` int DEFAULT NULL,
  `bland` varchar(50) DEFAULT NULL,
  `area` varchar(50) DEFAULT NULL,
  `shop` varchar(50) DEFAULT NULL,
  `shopname` varchar(50) DEFAULT NULL,
  `level` int DEFAULT NULL,
  `picture` varchar(200) DEFAULT NULL,
  `memo` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`coffeenumber`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coffee`
--

LOCK TABLES `coffee` WRITE;
/*!40000 ALTER TABLE `coffee` DISABLE KEYS */;
INSERT INTO `coffee` VALUES (1,'エスプレッソ',300,30,'ダークロースト','イタリア','個人店','Caffe Roma',3,'espresso.jpg',NULL),(2,'アメリカーノ',350,240,'ミディアムロースト','アメリカ','チェーン','Star Coffee',2,'americano.jpg',NULL),(3,'カフェラテ',450,300,'ミディアムロースト','フランス','チェーン','Cafe Paris',1,'latte.jpg',NULL),(4,'カプチーノ',400,180,'ミディアムロースト','イタリア','カフェ','Roma Cafe',2,'cappuccino.jpg',NULL),(5,'モカ',500,300,'ダークロースト','エチオピア','専門店','Mocha House',2,'mocha.jpg',NULL),(6,'コールドブリュー',420,350,'ライトロースト','日本','チェーン','Tokyo Brew',1,'coldbrew.jpg',NULL),(7,'フラットホワイト',480,200,'ミディアムロースト','オーストラリア','カフェ','Sydney Beans',2,'flatwhite.jpg',NULL),(8,'アイスコーヒー',320,350,'ミディアムロースト','日本','チェーン','Cool Coffee',1,'icedcoffee.jpg',NULL),(9,'デカフェ',380,250,'ライトロースト','コロンビア','専門店','Green Beans',1,'decaf.jpg',NULL),(10,'ウインナーコーヒー',550,220,'ダークロースト','オーストリア','喫茶店','Vienna Cafe',3,'vienna.jpg',NULL);
/*!40000 ALTER TABLE `coffee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food`
--

DROP TABLE IF EXISTS `food`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food` (
  `foodnumber` int NOT NULL AUTO_INCREMENT,
  `foodlevel` int DEFAULT NULL,
  `foodname` varchar(50) DEFAULT NULL,
  `foodmemo` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`foodnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food`
--

LOCK TABLES `food` WRITE;
/*!40000 ALTER TABLE `food` DISABLE KEYS */;
/*!40000 ALTER TABLE `food` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `idpw`
--

DROP TABLE IF EXISTS `idpw`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `idpw` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(100) DEFAULT NULL,
  `user` varchar(100) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `mylevel` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `idpw`
--

LOCK TABLES `idpw` WRITE;
/*!40000 ALTER TABLE `idpw` DISABLE KEYS */;
INSERT INTO `idpw` VALUES (1,'plusdojo@gmail.com','id','password',1);
/*!40000 ALTER TABLE `idpw` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likecoffee`
--

DROP TABLE IF EXISTS `likecoffee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likecoffee` (
  `usernumber` int DEFAULT NULL,
  `coffeenumber` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likecoffee`
--

LOCK TABLES `likecoffee` WRITE;
/*!40000 ALTER TABLE `likecoffee` DISABLE KEYS */;
/*!40000 ALTER TABLE `likecoffee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal`
--

DROP TABLE IF EXISTS `personal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal` (
  `personaluserid` int NOT NULL AUTO_INCREMENT,
  `new_valu` int DEFAULT NULL,
  `memo` varchar(200) DEFAULT NULL,
  `personalcoffeeid` int DEFAULT NULL,
  PRIMARY KEY (`personaluserid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal`
--

LOCK TABLES `personal` WRITE;
/*!40000 ALTER TABLE `personal` DISABLE KEYS */;
INSERT INTO `personal` VALUES (1,380,'コクの深い豆を使用しています',6);
/*!40000 ALTER TABLE `personal` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-17 14:45:28
