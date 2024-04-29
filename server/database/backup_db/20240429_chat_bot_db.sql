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
INSERT INTO `categories` VALUES (1714381673617,1,NULL,'category-1','Category Description 1',NULL),(1714381673639,2,NULL,'category-2','Category Description 2',NULL),(1714381673642,3,NULL,'category-3','Category Description 3',NULL);
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
  `school_year_id` bigint DEFAULT NULL,
  `topic_id` bigint NOT NULL,
  `text` varchar(10000) NOT NULL,
  `image_link` varchar(255) DEFAULT NULL,
  `intent_code` varchar(255) NOT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  `note` tinytext,
  `title` tinytext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_4ip3tulotwd3mfjsyaj14kuhd` (`intent_code`),
  UNIQUE KEY `UK_3qi52ghgc7elo7qpwdpw925gg` (`uuid`),
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
INSERT INTO `contents` VALUES (1,1714381673728,1,NULL,NULL,1,1,'Text 1',NULL,'content-1','6e1f9c38-0830-44d3-a22d-dc71f540f0b7',NULL,'Title 1'),(2,1714381673730,2,NULL,1,1,1,'Text 2',NULL,'content-1.content-2','4f7e6151-350c-471e-ba87-8dc416c049d2',NULL,'Title 2'),(2,1714381673732,3,NULL,1,1,2,'Text 3',NULL,'content-1.content-3','9825e7b5-5fe6-489f-9b8b-d07c3e8c8a9c',NULL,'Title 3'),(3,1714381673734,4,NULL,2,2,2,'Text 4',NULL,'content-2.content-4','3b54d8e4-fc69-4b58-88bd-3559fe2aec2d',NULL,'Title 4'),(3,1714381673736,5,NULL,2,3,2,'Text 5',NULL,'content-2.content-5','b89f3a7a-cdfd-43f1-9a9b-f2d60c467564',NULL,'Title 5');
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
INSERT INTO `conversation_histories` VALUES (1714381673754,1,NULL,'Question 1','Answer 1','id1'),(1714381673755,2,NULL,'Question 2','Answer 2','id1'),(1714381673756,3,NULL,'Question 3','Answer 3','id1'),(1714381673757,4,NULL,'Question 4','Answer 4','id2'),(1714381673759,5,NULL,'Question 5','Answer 5','id2'),(1714381673760,6,NULL,'Question 6','Answer 6','id2');
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_ahm9bxhqxrlepm5rlv6f2g4bh` (`year`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school_years`
--

LOCK TABLES `school_years` WRITE;
/*!40000 ALTER TABLE `school_years` DISABLE KEYS */;
INSERT INTO `school_years` VALUES ('2022',1714381673709,1,NULL,'K22',NULL),('2023',1714381673710,2,NULL,'K23',NULL),('2024',1714381673712,3,NULL,'K24',NULL);
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
INSERT INTO `topics` VALUES (1,1714381673671,1,NULL,'topic-1','Topic Description 1',NULL),(1,1714381673674,2,NULL,'topic-2','Topic Description 2',NULL),(1,1714381673676,3,NULL,'topic-3','Topic Description 3',NULL),(2,1714381673678,4,NULL,'topic-4','Topic Description 4',NULL),(2,1714381673679,5,NULL,'topic-5','Topic Description 5',NULL),(2,1714381673681,6,NULL,'topic-6','Topic Description 6',NULL),(3,1714381673682,7,NULL,'topic-7','Topic Description 7',NULL),(3,1714381673684,8,NULL,'topic-8','Topic Description 8',NULL),(3,1714381673686,9,NULL,'topic-9','Topic Description 9',NULL);
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

-- Dump completed on 2024-04-29 16:09:57
