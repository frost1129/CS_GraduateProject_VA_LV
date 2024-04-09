CREATE DATABASE  IF NOT EXISTS `chat_bot_service_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `chat_bot_service_db`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: chat_bot_service_db
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `created_date` bigint NOT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `last_modified_date` bigint DEFAULT NULL,
  `intent_code` varchar(255) NOT NULL,
  `description` tinytext NOT NULL,
  `note` tinytext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_5tj3lcyy6e16uosnmovpotfb5` (`intent_code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1712665281334,1,NULL,'category-1','Category Description 1',NULL),(1712665281367,2,NULL,'category-2','Category Description 2',NULL),(1712665281370,3,NULL,'category-3','Category Description 3',NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contents`
--

DROP TABLE IF EXISTS `contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contents` (
  `content_level` int NOT NULL,
  `created_date` bigint NOT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `last_modified_date` bigint DEFAULT NULL,
  `parent_content_id` bigint DEFAULT NULL,
  `school_year_id` bigint NOT NULL,
  `topic_id` bigint NOT NULL,
  `text` varchar(10000) NOT NULL,
  `intent_code` tinytext NOT NULL,
  `note` tinytext,
  `title` tinytext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKjra4btl3axrtlcjpslspaxjo0` (`parent_content_id`),
  KEY `FKj565ekb1opnqihswf3a1du4uy` (`school_year_id`),
  KEY `FK3m5d50r75l70v7wc7yfl2flt7` (`topic_id`),
  CONSTRAINT `FK3m5d50r75l70v7wc7yfl2flt7` FOREIGN KEY (`topic_id`) REFERENCES `topics` (`id`),
  CONSTRAINT `FKj565ekb1opnqihswf3a1du4uy` FOREIGN KEY (`school_year_id`) REFERENCES `school_years` (`id`),
  CONSTRAINT `FKjra4btl3axrtlcjpslspaxjo0` FOREIGN KEY (`parent_content_id`) REFERENCES `contents` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contents`
--

LOCK TABLES `contents` WRITE;
/*!40000 ALTER TABLE `contents` DISABLE KEYS */;
INSERT INTO `contents` VALUES (1,1712665281470,1,NULL,NULL,1,1,'Text 1','content-1',NULL,'Title 1'),(2,1712665281472,2,NULL,1,1,1,'Text 2','content-1.content-2',NULL,'Title 2'),(2,1712665281474,3,NULL,1,1,2,'Text 3','content-1.content-3',NULL,'Title 3'),(3,1712665281476,4,NULL,2,2,2,'Text 4','content-2.content-4',NULL,'Title 4'),(3,1712665281478,5,NULL,2,3,2,'Text 5','content-2.content-5',NULL,'Title 5');
/*!40000 ALTER TABLE `contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conversation_histories`
--

DROP TABLE IF EXISTS `conversation_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conversation_histories` (
  `created_date` bigint NOT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `last_modified_date` bigint DEFAULT NULL,
  `question` varchar(1000) NOT NULL,
  `answer` varchar(10000) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conversation_histories`
--

LOCK TABLES `conversation_histories` WRITE;
/*!40000 ALTER TABLE `conversation_histories` DISABLE KEYS */;
INSERT INTO `conversation_histories` VALUES (1712665281499,1,NULL,'Question 1','Answer 1','id1'),(1712665281501,2,NULL,'Question 2','Answer 2','id1'),(1712665281503,3,NULL,'Question 3','Answer 3','id1'),(1712665281504,4,NULL,'Question 4','Answer 4','id2'),(1712665281506,5,NULL,'Question 5','Answer 5','id2'),(1712665281507,6,NULL,'Question 6','Answer 6','id2');
/*!40000 ALTER TABLE `conversation_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `school_years`
--

DROP TABLE IF EXISTS `school_years`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `school_years` (
  `year` varchar(4) NOT NULL,
  `created_date` bigint NOT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `last_modified_date` bigint DEFAULT NULL,
  `course_name` varchar(255) NOT NULL,
  `note` tinytext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school_years`
--

LOCK TABLES `school_years` WRITE;
/*!40000 ALTER TABLE `school_years` DISABLE KEYS */;
INSERT INTO `school_years` VALUES ('2022',1712665281443,1,NULL,'K22',NULL),('2023',1712665281446,2,NULL,'K23',NULL),('2024',1712665281448,3,NULL,'K24',NULL);
/*!40000 ALTER TABLE `school_years` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topics`
--

DROP TABLE IF EXISTS `topics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `topics` (
  `category_id` bigint NOT NULL,
  `created_date` bigint NOT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `last_modified_date` bigint DEFAULT NULL,
  `intent_code` varchar(255) NOT NULL,
  `description` tinytext NOT NULL,
  `note` tinytext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_fnv5p525unrtuoh4rti6s29yo` (`intent_code`),
  KEY `FK3mind1ka66asw07vi2t2gxalm` (`category_id`),
  CONSTRAINT `FK3mind1ka66asw07vi2t2gxalm` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topics`
--

LOCK TABLES `topics` WRITE;
/*!40000 ALTER TABLE `topics` DISABLE KEYS */;
INSERT INTO `topics` VALUES (1,1712665281406,1,NULL,'topic-1','Topic Description 1',NULL),(1,1712665281409,2,NULL,'topic-2','Topic Description 2',NULL),(1,1712665281411,3,NULL,'topic-3','Topic Description 3',NULL),(2,1712665281414,4,NULL,'topic-4','Topic Description 4',NULL),(2,1712665281416,5,NULL,'topic-5','Topic Description 5',NULL),(2,1712665281418,6,NULL,'topic-6','Topic Description 6',NULL),(3,1712665281421,7,NULL,'topic-7','Topic Description 7',NULL),(3,1712665281423,8,NULL,'topic-8','Topic Description 8',NULL),(3,1712665281425,9,NULL,'topic-9','Topic Description 9',NULL);
/*!40000 ALTER TABLE `topics` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-09 20:26:52
