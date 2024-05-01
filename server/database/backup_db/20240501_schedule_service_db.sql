CREATE DATABASE  IF NOT EXISTS `schedule_service_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `schedule_service_db`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: schedule_service_db
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
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post` (
  `id` bigint NOT NULL,
  `content` text,
  `created_date` bigint NOT NULL,
  `image` text,
  `title` varchar(255) DEFAULT NULL,
  `updated_date` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_date` bigint NOT NULL,
  `note` tinytext,
  `room_code` varchar(255) DEFAULT NULL,
  `room_name` varchar(255) DEFAULT NULL,
  `updated_date` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scheduled-exam`
--

DROP TABLE IF EXISTS `scheduled-exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scheduled-exam` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_date` bigint NOT NULL,
  `exam_date` date DEFAULT NULL,
  `length` int DEFAULT NULL,
  `note` tinytext,
  `updated_date` bigint DEFAULT NULL,
  `room` bigint DEFAULT NULL,
  `subject_class_id` bigint DEFAULT NULL,
  `time_slot` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_o478qmj3d4fu2ldmdda9lndt5` (`subject_class_id`),
  KEY `FKjx17qx7nwy1xp2mtbmhah8jnf` (`room`),
  KEY `FKb1b86aey0hotq1cdewuwtr1to` (`time_slot`),
  CONSTRAINT `FK5l9g53yjv9wccj1v3hywcwer3` FOREIGN KEY (`subject_class_id`) REFERENCES `subject_class` (`id`),
  CONSTRAINT `FKb1b86aey0hotq1cdewuwtr1to` FOREIGN KEY (`time_slot`) REFERENCES `time_slot` (`id`),
  CONSTRAINT `FKjx17qx7nwy1xp2mtbmhah8jnf` FOREIGN KEY (`room`) REFERENCES `room` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scheduled-exam`
--

LOCK TABLES `scheduled-exam` WRITE;
/*!40000 ALTER TABLE `scheduled-exam` DISABLE KEYS */;
/*!40000 ALTER TABLE `scheduled-exam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `school_year`
--

DROP TABLE IF EXISTS `school_year`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `school_year` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_date` bigint NOT NULL,
  `note` tinytext,
  `updated_date` bigint DEFAULT NULL,
  `year` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school_year`
--

LOCK TABLES `school_year` WRITE;
/*!40000 ALTER TABLE `school_year` DISABLE KEYS */;
INSERT INTO `school_year` VALUES (1,1714470190936,'',NULL,2022),(2,1714470213739,'',NULL,2023),(3,1714470221303,'',NULL,2024);
/*!40000 ALTER TABLE `school_year` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_join_class`
--

DROP TABLE IF EXISTS `student_join_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_join_class` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_date` bigint NOT NULL,
  `student_id` bigint DEFAULT NULL,
  `total_score` float DEFAULT NULL,
  `updated_date` bigint DEFAULT NULL,
  `subject_class` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKjrwte3b6w7a6bj6etk3loa6i6` (`subject_class`),
  CONSTRAINT `FKjrwte3b6w7a6bj6etk3loa6i6` FOREIGN KEY (`subject_class`) REFERENCES `subject_class` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_join_class`
--

LOCK TABLES `student_join_class` WRITE;
/*!40000 ALTER TABLE `student_join_class` DISABLE KEYS */;
INSERT INTO `student_join_class` VALUES (12,1714533325047,2010001,NULL,NULL,1),(13,1714533325070,2010002,NULL,NULL,2),(14,1714533325072,2010003,NULL,NULL,3),(15,1714533325076,2010004,NULL,NULL,4),(16,1714533325079,2010005,NULL,NULL,5),(17,1714533325082,2010006,NULL,NULL,6),(18,1714533325085,2030099,NULL,NULL,4),(19,1714533325087,2030099,NULL,NULL,6),(20,1714533325090,2030098,NULL,NULL,6),(21,1714533325093,2030098,NULL,NULL,2),(22,1714533325094,2030099,NULL,NULL,2);
/*!40000 ALTER TABLE `student_join_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_date` bigint NOT NULL,
  `credits` float DEFAULT NULL,
  `note` tinytext,
  `subject_code` varchar(255) DEFAULT NULL,
  `subject_name` varchar(255) DEFAULT NULL,
  `updated_date` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=348 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES (1,1714471208645,3,NULL,'_GENG001','Tiếng anh cấp độ 1',NULL),(2,1714471208676,3,NULL,'_GENG002','Tiếng anh cấp độ 2',NULL),(3,1714471208679,3,NULL,'ACCO1305','Kinh doanh và nghiệp vụ',NULL),(4,1714471208681,3,NULL,'ACCO1306','Kinh doanh và nghiệp vụ (TA)',NULL),(5,1714471208685,3,NULL,'ACCO1325','Nguyên lý kế toán',NULL),(6,1714471208687,3,NULL,'ACCO1328','Logic học',NULL),(7,1714471208691,3,NULL,'ACCO1330','Kế toán quản trị',NULL),(8,1714471208693,3,NULL,'ACCO1334','Kế toán tài chính 2',NULL),(9,1714471208696,3,NULL,'ACCO1339','Hệ thống thông tin kế toán 1',NULL),(10,1714471208699,3,NULL,'ACCO1349','Kiểm toán thực hành',NULL),(11,1714471208702,3,NULL,'ACCO2311','Kế toán thuế 1',NULL),(12,1714471208705,3,NULL,'ACCO3302','Kiểm toán 1',NULL),(13,1714471208707,3,NULL,'ACCO5301','Nguyên lý kế toán',NULL),(14,1714471208708,3,NULL,'ACCO5307','Kiểm toán 1 (TA)',NULL),(15,1714471208713,3,NULL,'ACCO5319','Kế toán quản trị căn bản 2 (TA)',NULL),(16,1714471208715,3,NULL,'ACCO5340','Kinh doanh và nghiệp vụ',NULL),(17,1714471208718,3,NULL,'ACCO6304','Kế toán tài chính 4',NULL),(18,1714471208721,3,NULL,'ACCO6314','Kiểm toán thực hành',NULL),(19,1714471208723,3,NULL,'ACCO6340','Kế toán tài chính 1',NULL),(20,1714471208726,1,NULL,'BADM1186','Quản trị bản thân',NULL),(21,1714471208728,1,NULL,'BADM1197','Tư duy phản biện và sáng tạo',NULL),(22,1714471208730,3,NULL,'BADM1301','Quản trị học',NULL),(23,1714471208734,3,NULL,'BADM1364','Quản trị học',NULL),(24,1714471208736,3,NULL,'BADM1365','Phân tích định lượng trong quản trị',NULL),(25,1714471208739,3,NULL,'BADM1366','Quản trị nhân lực',NULL),(26,1714471208741,3,NULL,'BADM1367','Quản trị Marketing',NULL),(27,1714471208743,3,NULL,'BADM1373','Thương mại điện tử',NULL),(28,1714471208746,3,NULL,'BADM1377','Thống kê ứng dụng',NULL),(29,1714471208748,3,NULL,'BADM1379','Quản trị dự án',NULL),(30,1714471208750,3,NULL,'BADM1380','Quản trị chiến lược',NULL),(31,1714471208754,3,NULL,'BADM1392','Quản trị vận hành',NULL),(32,1714471208756,1,NULL,'BADM2117','Thông minh cảm xúc và tư duy tích cực',NULL),(33,1714471208758,1,NULL,'BADM2188','Giá trị sống 1',NULL),(34,1714471208761,3,NULL,'BADM2311','Giao tiếp trong kinh doanh',NULL),(35,1714471208763,3,NULL,'BADM2327','Trách nhiệm xã hội của doanh nghiệp',NULL),(36,1714471208765,3,NULL,'BADM2331','Phát triển sản phẩm mới',NULL),(37,1714471208768,3,NULL,'BADM2348','Vận tải và bảo hiểm',NULL),(38,1714471208770,3,NULL,'BADM2350','Quản trị kênh phân phối',NULL),(39,1714471208772,3,NULL,'BADM2368','Quản trị thu mua',NULL),(40,1714471208776,3,NULL,'BADM2370','Quản trị Logistics',NULL),(41,1714471208778,3,NULL,'BADM2372','Dự báo trong kinh doanh',NULL),(42,1714471208781,3,NULL,'BADM2374','Tuyến điểm du lịch Việt Nam',NULL),(43,1714471208783,3,NULL,'BADM2375','Quản trị kinh doanh lữ hành',NULL),(44,1714471208785,3,NULL,'BADM2381','Quản trị xuất nhập khẩu',NULL),(45,1714471208789,3,NULL,'BADM2382','Đầu tư quốc tế',NULL),(46,1714471208791,3,NULL,'BADM2383','Marketing quốc tế',NULL),(47,1714471208792,3,NULL,'BADM2384','Quản trị thương hiệu',NULL),(48,1714471208796,1,NULL,'BADM5103','Giá trị sống 1',NULL),(49,1714471208797,1,NULL,'BADM5106','Nhận diện bản thân',NULL),(50,1714471208799,3,NULL,'BADM5301','Quản trị học',NULL),(51,1714471208802,3,NULL,'BADM5302','Giao tiếp trong kinh doanh',NULL),(52,1714471208804,3,NULL,'BADM5304','Quản trị nhân lực',NULL),(53,1714471208807,3,NULL,'BADM5307','Trách nhiệm xã hội của doanh nghiệp',NULL),(54,1714471208810,3,NULL,'BADM5310','Quản trị thương hiệu',NULL),(55,1714471208813,3,NULL,'BADM5317','Hành vi khách hàng',NULL),(56,1714471208815,3,NULL,'BADM5323','Quan hệ công chúng',NULL),(57,1714471208818,3,NULL,'BADM5329','Kinh doanh quốc tế',NULL),(58,1714471208820,3,NULL,'BADM5330','Quản trị kinh doanh quốc tế',NULL),(59,1714471208823,3,NULL,'BADM5332','Quản trị xuất nhập khẩu',NULL),(60,1714471208826,3,NULL,'BADM5335','Marketing căn bản',NULL),(61,1714471208828,3,NULL,'BADM5355','Giao tiếp trong kinh doanh',NULL),(62,1714471208831,3,NULL,'BADM5356','Thống kê ứng dụng',NULL),(63,1714471208833,1,NULL,'BADM6103','Giá trị sống 1',NULL),(64,1714471208836,1,NULL,'BADM6104','Giá trị sống 2',NULL),(65,1714471208839,3,NULL,'BADM6303','Thương mại điện tử',NULL),(66,1714471208841,3,NULL,'BADM6321','Quản trị học',NULL),(67,1714471208844,3,NULL,'BADM6340','Giao tiếp trong kinh doanh',NULL),(68,1714471208846,3,NULL,'BADM6341','Thống kê ứng dụng',NULL),(69,1714471208848,2,NULL,'BIOT1201','Sinh học đại cương',NULL),(70,1714471208851,3,NULL,'BIOT1347','Con người và môi trường ',NULL),(71,1714471208853,3,NULL,'BIOT1347','Con người và môi trường',NULL),(72,1714471208855,3,NULL,'BIOT1348','Công nghệ tế bào',NULL),(73,1714471208858,2,NULL,'BIOT2201','Sinh học phân tử',NULL),(74,1714471208860,3,NULL,'BIOT2402','Công nghệ protein-enzyme',NULL),(75,1714471208862,3,NULL,'BIOT2403','Công nghệ vi sinh',NULL),(76,1714471208865,3,NULL,'BIOT2404','Di truyền học',NULL),(77,1714471208867,3,NULL,'BIOT2406','Sinh lý động vật',NULL),(78,1714471208869,2,NULL,'BIOT3224','Dinh dưỡng người',NULL),(79,1714471208872,3,NULL,'BIOT5302','Sinh hóa học',NULL),(80,1714471208875,2,NULL,'BLAW1203','Luật hôn nhân gia đình',NULL),(81,1714471208879,2,NULL,'BLAW1205','Luật ngân sách Nhà nước (Luật TC)',NULL),(82,1714471208882,2,NULL,'BLAW1210','Phá sản và giải quyết tranh chấp',NULL),(83,1714471208886,2,NULL,'BLAW1218','Luật Công ty',NULL),(84,1714471208888,2,NULL,'BLAW1222','Luật Tố tụng hình sự',NULL),(85,1714471208890,2,NULL,'BLAW1228','Kỹ năng soạn thảo văn bản',NULL),(86,1714471208894,2,NULL,'BLAW1229','Kỹ năng viết và nghiên cứu pháp lý',NULL),(87,1714471208897,3,NULL,'BLAW1301','Lý luận Nhà nước và pháp luật',NULL),(88,1714471208900,3,NULL,'BLAW1309','Tư duy phản biện',NULL),(89,1714471208902,3,NULL,'BLAW1317','Luật Lao động',NULL),(90,1714471208906,3,NULL,'BLAW1323','Pháp luật về các loại hình thương nhân',NULL),(91,1714471208909,3,NULL,'BLAW1324','Luật Đất đai',NULL),(92,1714471208911,2,NULL,'BLAW2203','Luật ngân hàng',NULL),(93,1714471208915,3,NULL,'BLAW2301','Luật hiến pháp',NULL),(94,1714471208922,3,NULL,'BLAW2305','Luật hình sự',NULL),(95,1714471208926,3,NULL,'BLAW2306','Luật dân sự 2',NULL),(96,1714471208929,3,NULL,'BLAW2319','Luật thương mại quốc tế',NULL),(97,1714471208932,3,NULL,'BLAW2330','Luật thuế',NULL),(98,1714471208935,3,NULL,'BLAW2332','Luật cạnh tranh',NULL),(99,1714471208937,3,NULL,'BLAW3301','Công pháp quốc tế (KI)',NULL),(100,1714471208941,3,NULL,'BLAW3311','Kỹ năng soạn thảo hợp đồng',NULL),(101,1714471208943,2,NULL,'BLAW4201','Luật học so sánh',NULL),(102,1714471208945,2,NULL,'BLAW4202','Pháp luật về xuất nhập khẩu',NULL),(103,1714471208949,1,NULL,'CENG1123','Đồ án kết cấu Bê tông cốt thép 1',NULL),(104,1714471208951,1,NULL,'CENG1202','Nhận thức ngành (TT NT ngành)',NULL),(105,1714471208955,2,NULL,'CENG1217','Kiến trúc dân dụng',NULL),(106,1714471208958,3,NULL,'CENG1327','Kỹ thuật thi công',NULL),(107,1714471208962,3,NULL,'CENG1330','Thiết kế nhà nhiều tầng',NULL),(108,1714471208964,2,NULL,'CENG2203','Trắc địa đại cương',NULL),(109,1714471208966,2,NULL,'CENG2205','Sức bền vật liệu 2',NULL),(110,1714471208969,1,NULL,'CENG2206','Thí nghiệm Sức bền vật liệu',NULL),(111,1714471208971,2,NULL,'CENG2212','Phương pháp phần tử hữu hạn',NULL),(112,1714471208974,3,NULL,'CENG2319','Kinh tế xây dựng',NULL),(113,1714471208977,2,NULL,'CENG3211','Kết cấu Bê tông cốt thép 2',NULL),(114,1714471208998,2,NULL,'CENG3212','Kết cấu thép 2',NULL),(115,1714471209011,3,NULL,'CENG3305','Quản lý dự án xây dựng',NULL),(116,1714471209013,1,NULL,'CENG4205','Đồ án thi công',NULL),(117,1714471209015,3,NULL,'CHEM1303','Hóa đại cương',NULL),(118,1714471209020,3,NULL,'CHEM1305','Hóa học thực phẩm',NULL),(119,1714471209022,2,NULL,'CHIN1201','Kỹ năng nghe hiểu 1',NULL),(120,1714471209026,2,NULL,'CHIN1202','Kỹ năng nói 1',NULL),(121,1714471209028,2,NULL,'CHIN1203','Kỹ năng đọc 1',NULL),(122,1714471209030,2,NULL,'CHIN1242','Ngữ âm - Văn tự Hán ngữ',NULL),(123,1714471209033,2,NULL,'CHIN1254','Khẩu ngữ nâng cao',NULL),(124,1714471209035,3,NULL,'CHIN1313','Tiếng Trung Quốc tổng hợp 1',NULL),(125,1714471209039,3,NULL,'CHIN1325','Tiếng Trung Quốc tổng hợp 4',NULL),(126,1714471209041,3,NULL,'CHIN1329','Kỹ năng nghe hiểu 3',NULL),(127,1714471209042,3,NULL,'CHIN1333','Kỹ năng nói 4',NULL),(128,1714471209045,3,NULL,'CHIN1336','Kỹ năng đọc 4',NULL),(129,1714471209049,3,NULL,'CHIN1338','Kỹ năng viết 2',NULL),(130,1714471209052,3,NULL,'CHIN1339','Kỹ năng viết 3',NULL),(131,1714471209054,3,NULL,'CHIN1340','Kỹ năng viết 4',NULL),(132,1714471209056,3,NULL,'CHIN1346','Dịch du lịch',NULL),(133,1714471209059,3,NULL,'CHIN2310','Giao tiếp thương mại',NULL),(134,1714471209061,2,NULL,'CHIN3210','Dịch Khẩu ngữ',NULL),(135,1714471209063,2,NULL,'CHIN3211','Dịch Văn học',NULL),(136,1714471209067,3,NULL,'CHIN3304','Lược sử Văn học Trung Quốc',NULL),(137,1714471209069,3,NULL,'CHIN4303','Thư tín thương mại',NULL),(138,1714471209071,1,NULL,'CMAN1122','Đồ án Quản lý dự án xây dựng',NULL),(139,1714471209075,2,NULL,'CMAN3206','Đấu thầu và hợp đồng trong xây dựng',NULL),(140,1714471209077,2,NULL,'CMAN3304','Dự toán xây dựng',NULL),(141,1714471209081,2,NULL,'CMAN4211','Tin học ứng dụng trong quản lý xây dựng',NULL),(142,1714471209083,3,NULL,'CMAN4302','Lập và thẩm định dự án Đầu tư xây dựng',NULL),(143,1714471209087,3,NULL,'COMP1307','Tin học đại cương',NULL),(144,1714471209089,3,NULL,'COMP1310','Tin học văn phòng nâng cao',NULL),(145,1714471209091,3,NULL,'COMP2403','Tin học ứng dụng',NULL),(146,1714471209094,3,NULL,'COMP3401','UD tin học trong CNSH',NULL),(147,1714471209097,3,NULL,'DATS1301','Nhập môn tin học cho Khoa học dữ liệu',NULL),(148,1714471209098,3,NULL,'DATS2304','Trực quan hóa dữ liệu',NULL),(149,1714471209102,1,NULL,'DEDU0103','Giáo dục quốc phòng và an ninh: Quân sự chung',NULL),(150,1714471209104,2,NULL,'DEDU0202','Giáo dục quốc phòng và an ninh: Công tác quốc phòng và an ninh',NULL),(151,1714471209105,2,NULL,'DEDU0204','Giáo dục quốc phòng và an ninh: Kỹ thuật chiến đấu bộ binh và chiến thuật',NULL),(152,1714471209109,3,NULL,'DEDU0301','Giáo dục quốc phòng và an ninh: Đường lối quốc phòng và an ninh của Đảng Cộng sản Việt Nam',NULL),(153,1714471209111,3,NULL,'ECON1301','Kinh tế vi mô',NULL),(154,1714471209115,3,NULL,'ECON1318','Nguyên lý thống kê kinh tế',NULL),(155,1714471209117,3,NULL,'ECON1320','Kinh tế vi mô nâng cao',NULL),(156,1714471209119,3,NULL,'ECON1322','Kinh tế lượng nâng cao',NULL),(157,1714471209122,3,NULL,'ECON2315','Kinh tế lượng trong tài chính',NULL),(158,1714471209124,3,NULL,'ECON2323','Kinh tế quốc tế',NULL),(159,1714471209126,3,NULL,'ECON2324','Kinh tế phát triển',NULL),(160,1714471209129,3,NULL,'ECON2327','Dự báo trong kinh doanh và kinh tế',NULL),(161,1714471209131,3,NULL,'ECON2331','Chính sách ngoại thương và công nghiệp',NULL),(162,1714471209133,3,NULL,'EDUC1301','Định hướng và kỹ năng học tập',NULL),(163,1714471209137,3,NULL,'EDUC1314','Phương pháp nghiên cứu khoa học',NULL),(164,1714471209139,1,NULL,'ENGL1104','Báo cáo chuyên đề kinh doanh thương mại',NULL),(165,1714471209141,2,NULL,'ENGL1249','Kỹ năng thuyết trình',NULL),(166,1714471209144,2,NULL,'ENGL1267','Quản lý lớp học',NULL),(167,1714471209146,2,NULL,'ENGL1269','Giảng dạy qua chuyện kể, kịch',NULL),(168,1714471209149,2,NULL,'ENGL1278','Anh ngữ du lịch',NULL),(169,1714471209151,2,NULL,'ENGL1280','Anh ngữ nhân dụng',NULL),(170,1714471209153,2,NULL,'ENGL1281','Nghiệp vụ giao dịch ngân hàng',NULL),(171,1714471209156,2,NULL,'ENGL1285','Giảng dạy tích hợp',NULL),(172,1714471209158,3,NULL,'ENGL1301','Ngữ pháp',NULL),(173,1714471209161,3,NULL,'ENGL1304','Nghe - Nói 1',NULL),(174,1714471209165,3,NULL,'ENGL1315','Đọc - Viết 1',NULL),(175,1714471209168,3,NULL,'ENGL1319','Luyện phát âm',NULL),(176,1714471209173,3,NULL,'ENGL1333','Nghe - Nói 4',NULL),(177,1714471209177,3,NULL,'ENGL1334','Luyện dịch 1',NULL),(178,1714471209180,3,NULL,'ENGL1341','Đọc - Viết 4',NULL),(179,1714471209182,3,NULL,'ENGL1360','Quản trị học',NULL),(180,1714471209185,3,NULL,'ENGL1362','Nguyên lý kế toán',NULL),(181,1714471209186,3,NULL,'ENGL1364','Quan hệ công chúng',NULL),(182,1714471209188,3,NULL,'ENGL1365','Nghiệp vụ văn phòng',NULL),(183,1714471209192,3,NULL,'ENGL1384','Tâm lý lứa tuổi',NULL),(184,1714471209194,3,NULL,'ENGL2309','Văn hóa Anh - Mỹ',NULL),(185,1714471209196,2,NULL,'ENGL3201','Ngữ âm - Âm vị học',NULL),(186,1714471209200,2,NULL,'ENGL3205','Văn học Anh',NULL),(187,1714471209201,3,NULL,'ENGL3307','Lịch sử các phương pháp giảng dạy tiếng Anh',NULL),(188,1714471209204,3,NULL,'FINA1301','Tiền tệ và Ngân hàng',NULL),(189,1714471209207,3,NULL,'FINA1328','Quản trị tài chính',NULL),(190,1714471209209,3,NULL,'FINA1329','Tài chính doanh nghiệp 1',NULL),(191,1714471209213,3,NULL,'FINA1330','Tài chính cá nhân',NULL),(192,1714471209215,3,NULL,'FINA2337','Thị trường tài chính phái sinh',NULL),(193,1714471209217,3,NULL,'FINA2338','Tài chính doanh nghiệp 2',NULL),(194,1714471209221,3,NULL,'FINA2341','Quản lý danh mục đầu tư',NULL),(195,1714471209223,3,NULL,'FINA2342','Ngân hàng đầu tư',NULL),(196,1714471209225,3,NULL,'FINA2344','Marketing ngân hàng',NULL),(197,1714471209228,3,NULL,'FINA3318','Thuế và hoạt động kinh doanh',NULL),(198,1714471209241,3,NULL,'FINA5304','Tài chính doanh nghiệp 1',NULL),(199,1714471209243,3,NULL,'FINA5305','Thị trường tài chính phái sinh',NULL),(200,1714471209244,3,NULL,'FINA5308','Tài chính quốc tế',NULL),(201,1714471209246,3,NULL,'FINA5318','Tài chính cá nhân',NULL),(202,1714471209248,3,NULL,'FINA5324','Quản trị tài chính',NULL),(203,1714471209250,3,NULL,'FINA6319','Marketing ngân hàng',NULL),(204,1714471209252,3,NULL,'FOOD1301','Công nghệ bảo quản và chế biến sau thu hoạch',NULL),(205,1714471209255,3,NULL,'FOOD1304','Đánh giá cảm quan thực phẩm',NULL),(206,1714471209257,2,NULL,'FOOD2204','Phụ gia thực phẩm',NULL),(207,1714471209258,3,NULL,'food2312','Thống kê ứng dụng trong công nghệ thực phẩm',NULL),(208,1714471209261,3,NULL,'GCHI2303','Tiếng Trung 3',NULL),(209,1714471209263,3,NULL,'GENG0311','Tiếng Anh căn bản 1',NULL),(210,1714471209265,3,NULL,'GENG0312','Tiếng Anh căn bản 2',NULL),(211,1714471209268,3,NULL,'GENG0313','Tiếng Anh căn bản 3',NULL),(212,1714471209270,3,NULL,'GENG0314','Tiếng Anh căn bản 4',NULL),(213,1714471209272,3,NULL,'GENG0315','Tiếng Anh căn bản 5',NULL),(214,1714471209275,3,NULL,'GENG1311','Tiếng Anh nâng cao 1',NULL),(215,1714471209277,3,NULL,'GENG1312','Tiếng Anh nâng cao 2',NULL),(216,1714471209278,3,NULL,'GENG1313','Tiếng Anh nâng cao 3',NULL),(217,1714471209282,3,NULL,'GENG1339','Tiếng Anh Nâng cao 1 (K2019)',NULL),(218,1714471209284,3,NULL,'GENG1340','Tiếng Anh Nâng cao 2 (K2019)',NULL),(219,1714471209286,3,NULL,'GENG1341','Tiếng Anh Nâng cao 3 (K2019)',NULL),(220,1714471209289,3,NULL,'GENG1342','Tiếng Anh Nâng cao 4 (K2019)',NULL),(221,1714471209291,3,NULL,'GENG1343','Tiếng Anh Nâng cao 5 (K2019)',NULL),(222,1714471209293,3,NULL,'GENG1344','Tiếng Anh Nâng cao 6 (K2019)',NULL),(223,1714471209295,3,NULL,'GENG1345','Tiếng Anh Nâng cao 7 (K2019)',NULL),(224,1714471209297,3,NULL,'GENG1346','Tiếng Anh Nâng cao 8 (K2019)',NULL),(225,1714471209300,3,NULL,'GENG1347','Tiếng Anh Nâng cao 9 (K2019)',NULL),(226,1714471209303,3,NULL,'GENG1348','Tiếng Anh Nâng cao 10 (K2019)',NULL),(227,1714471209305,3,NULL,'GJAP2303','Tiếng Nhật 3',NULL),(228,1714471209307,2,NULL,'GLAW1223','Thực hành nghề nghiệp ngành Luật',NULL),(229,1714471209312,3,NULL,'glaw1315','Pháp luật đại cương',NULL),(230,1714471209314,3,NULL,'GLAW1318','Luật kinh doanh',NULL),(231,1714471209317,2,NULL,'GLAW2205','Pháp luật đại cương trong hoạt động xây dựng',NULL),(232,1714471209319,3,NULL,'GLAW2302','Pháp luật về các loại hình thương nhân và phá sản',NULL),(233,1714471209323,2,NULL,'GLAW3208','Pháp luật về công chứng và chứng thực',NULL),(234,1714471209326,3,NULL,'GLAW3303','Pháp luật cộng đồng ASEAN',NULL),(235,1714471209329,2,NULL,'GLAW6301','Pháp luật đại cương',NULL),(236,1714471209332,1,NULL,'IBUS3122','Văn hóa số',NULL),(237,1714471209334,1,NULL,'IBUS3123','Công cụ quản lý thương mại',NULL),(238,1714471209337,2,NULL,'IBUS3210','Quản trị quan hệ khách hàng',NULL),(239,1714471209339,2,NULL,'IBUS3216','Thanh toán quốc tế',NULL),(240,1714471209342,2,NULL,'IBUS3219','Nghiên cứu thị trường quốc tế',NULL),(241,1714471209345,2,NULL,'IBUS3220','Quản trị Logistic',NULL),(242,1714471209347,3,NULL,'IBUS3312','Tiếng Pháp',NULL),(243,1714471209351,3,NULL,'IBUS3313','Tiếng Việt',NULL),(244,1714471209353,3,NULL,'IBUS3315','Nghiệp vụ ngoại thương',NULL),(245,1714471209355,3,NULL,'IBUS3317','Luật thương mại quốc tế',NULL),(246,1714471209358,3,NULL,'IBUS3318','Kỹ thuật truyền thông',NULL),(247,1714471209360,3,NULL,'IBUS3321','Marketing',NULL),(248,1714471209365,3,NULL,'IBUS3325','Kết nối quốc tế 1',NULL),(249,1714471209368,4,NULL,'IBUS3414','Kinh tế quốc tế',NULL),(250,1714471209370,5,NULL,'IBUS3511','Tiếng Anh',NULL),(251,1714471209373,6,NULL,'IBUS3624','Đồ án',NULL),(252,1714471209375,8,NULL,'IBUS3809','Đàm phán quốc tế',NULL),(253,1714471209378,3,NULL,'INDO2303','Tiếng Indonesia 3',NULL),(254,1714471209381,3,NULL,'ITEC1328','Cấu trúc dữ liệu và thuật giải 2',NULL),(255,1714471209383,3,NULL,'ITEC1401','Nhập môn tin học',NULL),(256,1714471209385,4,NULL,'ITEC1505','Cơ sở lập trình',NULL),(257,1714471209388,3,NULL,'ITEC2301','Hệ điều hành',NULL),(258,1714471209392,4,NULL,'ITEC2502','Cơ sở dữ liệu (Nhập môn CSDL)',NULL),(259,1714471209394,4,NULL,'ITEC2503','Mạng máy tính (Nhập môn MMT)',NULL),(260,1714471209396,4,NULL,'ITEC2504','Lập trình hướng đối tượng',NULL),(261,1714471209397,2,NULL,'ITEC3201','Kỹ năng nghề nghiệp',NULL),(262,1714471209400,3,NULL,'ITEC3412','An toàn hệ thống thông tin',NULL),(263,1714471209402,3,NULL,'ITEC5305','Ứng dụng web',NULL),(264,1714471209403,3,NULL,'ITEC6301','Nhập môn tin học',NULL),(265,1714471209407,3,NULL,'ITEC6304','Cấu trúc dữ liệu và thuật giải 2',NULL),(266,1714471209408,3,NULL,'ITEC6305','Hệ điều hành',NULL),(267,1714471209410,3,NULL,'ITEC6307','Cơ sở dữ liệu nâng cao',NULL),(268,1714471209412,3,NULL,'ITEC6308','Lập trình cơ sở dữ liệu',NULL),(269,1714471209414,3,NULL,'ITEC6311','Trí tuệ nhân tạo',NULL),(270,1714471209416,3,NULL,'ITEC6401','Cơ sở lập trình',NULL),(271,1714471209421,3,NULL,'JAPA0421','Thực hành Tiếng Nhật tổng hợp 1',NULL),(272,1714471209426,3,NULL,'JAPA0422','Thực hành Tiếng Nhật tổng hợp 2',NULL),(273,1714471209429,2,NULL,'JAPA1236','Văn học Nhật Bản',NULL),(274,1714471209431,2,NULL,'JAPA1241','Biên dịch 2',NULL),(275,1714471209433,2,NULL,'JAPA1243','Phiên dịch 2',NULL),(276,1714471209435,2,NULL,'JAPA1255','Khẩu ngữ trong tiếng Nhật',NULL),(277,1714471209437,2,NULL,'JAPA1256','Tiếng Nhật dùng trong IT',NULL),(278,1714471209438,2,NULL,'JAPA1260','Biên dịch nâng cao',NULL),(279,1714471209441,2,NULL,'JAPA1261','Phiên dịch nâng cao',NULL),(280,1714471209443,2,NULL,'JAPA1262','Tiếng Nhật dùng trong nhà hàng, khách sạn',NULL),(281,1714471209444,3,NULL,'JAPA1310','Cơ sở ngôn ngữ học tiếng Nhật',NULL),(282,1714471209446,3,NULL,'JAPA1321','Nghe - Nói IV',NULL),(283,1714471209448,4,NULL,'JAPA1401','Tiếng Nhật tổng hợp I',NULL),(284,1714471209450,4,NULL,'JAPA1403','Nghe - Nói I',NULL),(285,1714471209452,2,NULL,'JAPA2209','Lý thuyết dịch',NULL),(286,1714471209454,3,NULL,'JAPA2301','Ngữ pháp học tiếng Nhật 1',NULL),(287,1714471209456,2,NULL,'JAPA3204','Kỹ năng viết 3',NULL),(288,1714471209457,2,NULL,'JAPA3210','Kanji - Đọc hiểu III',NULL),(289,1714471209459,2,NULL,'JAPA4211','Địa lý Nhật Bản',NULL),(290,1714471209461,3,NULL,'KORE1310','Ngữ pháp – Viết tiếng Hàn cao cấp',NULL),(291,1714471209463,3,NULL,'KORE1315','Nghe tiếng Hàn cao cấp',NULL),(292,1714471209464,3,NULL,'KORE1318','Nói tiếng Hàn trung cấp 1',NULL),(293,1714471209474,3,NULL,'KORE1323','Đọc tiếng Hàn trung cấp 1',NULL),(294,1714471209476,3,NULL,'KORE1326','Ngữ pháp tiếng Hàn sơ cấp 1',NULL),(295,1714471209477,3,NULL,'KORE1331','Nghe – Nói tiếng Hàn sơ cấp 1',NULL),(296,1714471209479,3,NULL,'KORE1336','Viết tiếng Hàn sơ cấp 1',NULL),(297,1714471209482,3,NULL,'KORE1341','Đọc tiếng Hàn sơ cấp 1',NULL),(298,1714471209484,2,NULL,'KORE2201','Văn hóa Hàn Quốc',NULL),(299,1714471209485,2,NULL,'KORE2202','Xã hội Hàn Quốc đương đại',NULL),(300,1714471209487,2,NULL,'KORE2204','Ngữ nghĩa học tiếng Hàn',NULL),(301,1714471209490,3,NULL,'KORE2306','Lý thuyết dịch',NULL),(302,1714471209492,3,NULL,'MATH1313','Đại số tuyến tính',NULL),(303,1714471209493,3,NULL,'MATH1314','Giải tích',NULL),(304,1714471209495,3,NULL,'MATH1315','Xác suất và Thống kê',NULL),(305,1714471209497,3,NULL,'MATH2401','Thống kê sinh học',NULL),(306,1714471209499,3,NULL,'MATH5301','Giải tích',NULL),(307,1714471209500,3,NULL,'MATH5304','Nguyên lý thống kê kinh tế',NULL),(308,1714471209503,3,NULL,'MATH6301','Giải tích',NULL),(309,1714471209504,3,NULL,'MATH6302','Đại số tuyến tính',NULL),(310,1714471209505,3,NULL,'MATH6303','Xác suất và Thống kê',NULL),(311,1714471209508,1.5,NULL,'PEDU0201','GDTC1-Thể dục Phát triển chung',NULL),(312,1714471209511,1.5,NULL,'PEDU0202','GDTC 2 (TC) - Bóng chuyền',NULL),(313,1714471209513,1.5,NULL,'PEDU0204','GDTC 2 (TC) - Cầu lông',NULL),(314,1714471209514,2,NULL,'POLI1205','Kinh tế chính trị Mác - Lênin',NULL),(315,1714471209517,2,NULL,'POLI1206','Chủ nghĩa xã hội khoa học',NULL),(316,1714471209519,2,NULL,'POLI1207','Lịch sử Đảng Cộng sản Việt Nam',NULL),(317,1714471209521,2,NULL,'POLI1208','Tư tưởng Hồ Chí Minh',NULL),(318,1714471209524,3,NULL,'PSYC2301','Giải phẫu và sinh lý hoạt động thần kinh cấp cao',NULL),(319,1714471209525,2,NULL,'SEAS1202','Dẫn nhập Đông Nam Á học',NULL),(320,1714471209528,3,NULL,'SEAS1317','Lịch sử văn minh thế giới',NULL),(321,1714471209531,3,NULL,'SEAS1336','Các tộc người ở Đông Nam Á',NULL),(322,1714471209533,3,NULL,'SEAS2301','Kinh tế học đại cương',NULL),(323,1714471209534,3,NULL,'SEAS2325','Thiết kế và điều hành tour',NULL),(324,1714471209536,2,NULL,'SEAS3210','Các tổ chức quốc tế và khu vực ở Đông Nam Á',NULL),(325,1714471209539,3,NULL,'SOCI1301','Xã hội học đại cương (NMXHH)',NULL),(326,1714471209541,3,NULL,'SOCI1316','Nhân học đại cương',NULL),(327,1714471209544,3,NULL,'SOCI1317','Tâm lý học đại cương',NULL),(328,1714471209547,3,NULL,'SOCI1319','Thống kê xã hội',NULL),(329,1714471209549,3,NULL,'SOCI1320','Dẫn nhập phần mềm thống kê xã hội',NULL),(330,1714471209551,3,NULL,'SOCI1321','Phương pháp trong nghiên cứu xã hội',NULL),(331,1714471209554,3,NULL,'SOCI2324','Xã hội học gia đình và giới',NULL),(332,1714471209555,3,NULL,'SOCI2327','Xã hội học tổ chức',NULL),(333,1714471209556,3,NULL,'SOCI2329','Chính sách xã hội',NULL),(334,1714471209559,2,NULL,'SOCI3201','Xã hội học lối sống',NULL),(335,1714471209561,3,NULL,'SOCI3317','Xã hội học lao động',NULL),(336,1714471209562,3,NULL,'SWOR1301','Công tác xã hội nhập môn',NULL),(337,1714471209563,3,NULL,'SWOR2319','Công tác xã hội nhóm',NULL),(338,1714471209566,3,NULL,'SWOR2320','Phát triển cộng đồng',NULL),(339,1714471209568,3,NULL,'SWOR2322','Tham vấn cơ bản',NULL),(340,1714471209570,3,NULL,'SWOR2324','CTXH với người khuyết tật',NULL),(341,1714471209572,3,NULL,'SWOR2326','An sinh nhi đồng và gia đình',NULL),(342,1714471209575,3,NULL,'SWOR2332','Tham vấn trẻ trong HC ĐBKK',NULL),(343,1714471209577,3,NULL,'TECH1301','Vẽ kỹ thuật xây dựng',NULL),(344,1714471209578,3,NULL,'TOUR1305','Du lịch bền vững',NULL),(345,1714471209581,3,NULL,'TOUR1313','Các vùng văn hóa Việt Nam',NULL),(346,1714471209583,2,NULL,'VIET1208','Thực hành văn bản tiếng Việt',NULL),(347,1714471209584,3,NULL,'VIET6301','Đại cương văn hóa Việt Nam',NULL);
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject_class`
--

DROP TABLE IF EXISTS `subject_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject_class` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_date` bigint NOT NULL,
  `note` tinytext,
  `updated_date` bigint DEFAULT NULL,
  `subject` bigint DEFAULT NULL,
  `year_code` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKr1incb63r599a76i60vvgecvr` (`subject`),
  KEY `FK4wcjsxgktb39ufisys7d63qhj` (`year_code`),
  CONSTRAINT `FK4wcjsxgktb39ufisys7d63qhj` FOREIGN KEY (`year_code`) REFERENCES `year_code` (`id`),
  CONSTRAINT `FKr1incb63r599a76i60vvgecvr` FOREIGN KEY (`subject`) REFERENCES `subject` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject_class`
--

LOCK TABLES `subject_class` WRITE;
/*!40000 ALTER TABLE `subject_class` DISABLE KEYS */;
INSERT INTO `subject_class` VALUES (1,1714532339368,NULL,NULL,73,1),(2,1714532339409,NULL,NULL,264,1),(3,1714532339417,NULL,NULL,265,1),(4,1714532339425,NULL,NULL,266,1),(5,1714532339432,NULL,NULL,267,1),(6,1714532339442,NULL,NULL,1,1);
/*!40000 ALTER TABLE `subject_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject_class_schedule`
--

DROP TABLE IF EXISTS `subject_class_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject_class_schedule` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_date` bigint NOT NULL,
  `end_time_slot` int DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `start_time_slot` int DEFAULT NULL,
  `teacher_id` bigint DEFAULT NULL,
  `updated_date` bigint DEFAULT NULL,
  `weekday` int DEFAULT NULL,
  `weeks` int DEFAULT NULL,
  `subject_class_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_oxa4c4b3dp4x5b4kxifpisclb` (`subject_class_id`),
  CONSTRAINT `FKjje49l64wug75wsf5a9otouam` FOREIGN KEY (`subject_class_id`) REFERENCES `subject_class` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject_class_schedule`
--

LOCK TABLES `subject_class_schedule` WRITE;
/*!40000 ALTER TABLE `subject_class_schedule` DISABLE KEYS */;
INSERT INTO `subject_class_schedule` VALUES (1,1714532339401,2,'2022-10-01',1,3010001,NULL,3,10,1),(2,1714532339413,4,'2022-10-01',3,3010002,NULL,3,10,2),(3,1714532339421,2,'2022-10-01',1,3010002,NULL,2,10,3),(4,1714532339428,2,'2022-10-01',1,3010003,NULL,4,10,4),(5,1714532339436,4,'2022-10-01',3,3010004,NULL,6,10,5),(6,1714532339446,2,'2022-10-01',1,3040001,NULL,5,10,6);
/*!40000 ALTER TABLE `subject_class_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_slot`
--

DROP TABLE IF EXISTS `time_slot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `time_slot` (
  `end_hour` time(6) DEFAULT NULL,
  `start_hour` time(6) DEFAULT NULL,
  `created_date` bigint NOT NULL,
  `id` bigint NOT NULL,
  `updated_date` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_slot`
--

LOCK TABLES `time_slot` WRITE;
/*!40000 ALTER TABLE `time_slot` DISABLE KEYS */;
INSERT INTO `time_slot` VALUES ('09:00:00.000000','07:00:00.000000',1714317839369,1,1714318494344),('11:30:00.000000','09:30:00.000000',1714317848148,2,1714317881396),('15:00:00.000000','13:00:00.000000',1714317851414,3,1714318116923),('17:30:00.000000','15:30:00.000000',1714317854591,4,1714318124188),('20:00:00.000000','18:00:00.000000',1714317857077,5,1714318131473);
/*!40000 ALTER TABLE `time_slot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `year_code`
--

DROP TABLE IF EXISTS `year_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `year_code` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_date` bigint NOT NULL,
  `semester` int NOT NULL,
  `year_code` int DEFAULT NULL,
  `school_year` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKlaluv1byo6yeck7sh5hpq2kp3` (`school_year`),
  CONSTRAINT `FKlaluv1byo6yeck7sh5hpq2kp3` FOREIGN KEY (`school_year`) REFERENCES `school_year` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `year_code`
--

LOCK TABLES `year_code` WRITE;
/*!40000 ALTER TABLE `year_code` DISABLE KEYS */;
INSERT INTO `year_code` VALUES (1,1714470190967,1,221,1),(2,1714470190970,2,222,1),(3,1714470190973,3,223,1),(4,1714470213741,1,231,2),(5,1714470213744,2,232,2),(6,1714470213747,3,233,2),(7,1714470221307,1,241,3),(8,1714470221310,2,242,3),(9,1714470221313,3,243,3);
/*!40000 ALTER TABLE `year_code` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-01 10:25:55
