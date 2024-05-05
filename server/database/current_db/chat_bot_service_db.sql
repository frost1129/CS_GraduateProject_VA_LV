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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1714874049265,4,NULL,'gioi-thieu-khai-quat','Giới thiệu khái quát',''),(1714874080585,5,NULL,'noi-dung-hoat-dong-ctsv','Các nội dung hoạt động công tác sinh viên',''),(1714874096828,6,NULL,'cac-quy-che','Các quy chế',''),(1714874123164,7,NULL,'noi-quy-lop-hoc','Nội quy lớp học',''),(1714874140281,8,NULL,'dien-thoai-lien-lac-can-thiet','Điện thoại liên lạc cần thiết','');
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
  `image_link` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conversation_histories`
--

LOCK TABLES `conversation_histories` WRITE;
/*!40000 ALTER TABLE `conversation_histories` DISABLE KEYS */;
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
INSERT INTO `school_years` VALUES ('2022',1714873657296,1,NULL,'K22',NULL),('2023',1714873657298,2,NULL,'K23',NULL),('2024',1714873657300,3,NULL,'K24',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topics`
--

LOCK TABLES `topics` WRITE;
/*!40000 ALTER TABLE `topics` DISABLE KEYS */;
INSERT INTO `topics` VALUES (4,1714874263257,10,NULL,'so-do-to-chuc-bo-may','Sơ đồ tổ chức bộ máy',''),(4,1714874288910,11,NULL,'hoi-dong-truong','Hội đồng trường',''),(4,1714874304695,12,NULL,'ban-giam-hieu','Ban giám hiệu',''),(4,1714874335971,13,NULL,'don-vi-quan-ly-dao-tao','Đơn vị quản lý đào tạo',''),(4,1714874360600,14,NULL,'khoa-va-nganh-dao-tao','Khoa và các ngành đào tạo',''),(4,1714874378312,15,NULL,'noi-sinh-vien-lien-he','Nơi sinh viên liên hệ',''),(4,1714874397147,16,NULL,'lich-tiep-cong-dan','Lịch tiếp công dân',''),(4,1714874416118,17,NULL,'thoi-gian-ra-vao-lop','Khung thời gian ra vào lớp',''),(4,1714874448658,18,NULL,'gioi-thieu-httt-cho-sinh-vien','Giới thiệu về hệ thống thông tin dành cho sinh viên ',''),(4,1714874667897,19,NULL,'muc-tieu-ke-hoach-hoc-tap','Mục tiêu và kế hoạch học tập ',''),(5,1714875481809,20,NULL,'che-do-chinh-sach','Chế độ chính sách',''),(5,1714875502205,21,NULL,'hanh-chinh-sinh-vien','Hành chính sinh viên',''),(5,1714875561334,22,NULL,'cong-tt-chu-nhiem-lop-cvht','Cổng thông tin \"chủ nhiệm lớp - cố vấn học tập\"',''),(5,1714875597634,23,NULL,'danh-gia-kqrl-online','Đánh giá kết quả rèn luyện online',''),(5,1714875616571,24,NULL,'ngoai-tru','Ngoại trú',''),(5,1714875660442,25,NULL,'hd-ngoai-khoa-website-nha-tro',' Hoạt động ngoại khóa – Website nhà trọ ',''),(5,1714875699630,26,NULL,'khen-thuong-nk-ck','Khen thưởng ngoại khóa - khen thưởng cuối khóa',''),(5,1714875723013,27,NULL,'hoat-dong-dich-vu-ho-tro','Hoạt động dịch vụ hỗ trợ',''),(5,1714875757361,28,NULL,'huong-nghiep-tu-van-viec-lam','Hoạt động hướng nghiệp, tư vấn việc làm ',''),(6,1714875805628,29,NULL,'dao-tao-dai-hoc-chinh-quy',' Quy chế đào tạo trình độ đại học hình thức đào tạo chính quy',''),(6,1714875832888,30,NULL,'dao-tao-ngoai-ngu-khong-chuyen','Quy định đào tạo ngoại ngữ không chuyên',''),(6,1714875864968,31,NULL,'dao-tao-gdqp-an-ninh','Quy định tổ chức dạy, học đánh giá kết quả học tập GDQP và an ninh',''),(6,1714875881717,32,NULL,'mien-giam-mon-hoc','Quy định miễn, giảm môn học',''),(6,1714875915982,33,NULL,'dao-tao-tin-hoc-vp-nang-cao','Quy định đào tọa môn Tin học văn phòng nâng cao',''),(6,1714876548562,34,NULL,'dang-ky-mon-hoc','Quy định đăng ký môn học ',''),(6,1714876564100,35,NULL,'dieu-chinh-lich-thi','Quy định điều chỉnh lịch thi ',''),(6,1714876590372,36,NULL,'chuyen-vao-ra-clc','Chuyển vào/ra chương trình chất lượng cao',''),(6,1714876619220,37,NULL,'quy-che-ctsv-ctdt-dai-hoc','Quy chế CTSV đối với chương trình đào tạo đại học',''),(6,1714876656129,38,NULL,'su-dung-thu-dien-tu-dich-vu-tt',' Quy định sử dụng hệ thống thư điện tử và các dịch vụ trực tuyến',''),(6,1714876672050,39,NULL,'van-hoa-ung-xu','Quy định về văn hóa ứng xử người học ','');
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

-- Dump completed on 2024-05-05  9:39:56
