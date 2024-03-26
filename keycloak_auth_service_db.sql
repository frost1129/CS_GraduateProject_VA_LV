-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: demo_keycloak
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `admin_event_entity`
--

DROP TABLE IF EXISTS `admin_event_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_event_entity` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ADMIN_EVENT_TIME` bigint DEFAULT NULL,
  `REALM_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OPERATION_TYPE` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AUTH_REALM_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AUTH_CLIENT_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AUTH_USER_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `IP_ADDRESS` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RESOURCE_PATH` text COLLATE utf8mb4_unicode_ci,
  `REPRESENTATION` text COLLATE utf8mb4_unicode_ci,
  `ERROR` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RESOURCE_TYPE` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ADMIN_EVENT_TIME` (`REALM_ID`,`ADMIN_EVENT_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_event_entity`
--

LOCK TABLES `admin_event_entity` WRITE;
/*!40000 ALTER TABLE `admin_event_entity` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_event_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `associated_policy`
--

DROP TABLE IF EXISTS `associated_policy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `associated_policy` (
  `POLICY_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ASSOCIATED_POLICY_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`POLICY_ID`,`ASSOCIATED_POLICY_ID`),
  KEY `IDX_ASSOC_POL_ASSOC_POL_ID` (`ASSOCIATED_POLICY_ID`),
  CONSTRAINT `FK_FRSR5S213XCX4WNKOG82SSRFY` FOREIGN KEY (`ASSOCIATED_POLICY_ID`) REFERENCES `resource_server_policy` (`ID`),
  CONSTRAINT `FK_FRSRPAS14XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `resource_server_policy` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `associated_policy`
--

LOCK TABLES `associated_policy` WRITE;
/*!40000 ALTER TABLE `associated_policy` DISABLE KEYS */;
INSERT INTO `associated_policy` VALUES ('b43cee8b-1775-477e-a5c6-8d63a36425d7','5f73d23e-1f12-47ea-8ae8-7adc86b2208d'),('57fc1ae7-760d-4f05-85f3-6c5248e3c28b','66c738df-2eeb-4adc-a7fa-00c744e21daa'),('e022b920-cb38-442e-a3eb-cddbd82b5fa4','93de4360-0fb3-495e-83d4-dc79599ed823'),('c93d5226-8697-4ce2-8b7d-c35530b86c71','cf299c3c-61b6-4aab-802a-d27089b5f3d1');
/*!40000 ALTER TABLE `associated_policy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authentication_execution`
--

DROP TABLE IF EXISTS `authentication_execution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authentication_execution` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ALIAS` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AUTHENTICATOR` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FLOW_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REQUIREMENT` int DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  `AUTHENTICATOR_FLOW` tinyint NOT NULL DEFAULT '0',
  `AUTH_FLOW_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AUTH_CONFIG` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_EXEC_REALM_FLOW` (`REALM_ID`,`FLOW_ID`),
  KEY `IDX_AUTH_EXEC_FLOW` (`FLOW_ID`),
  CONSTRAINT `FK_AUTH_EXEC_FLOW` FOREIGN KEY (`FLOW_ID`) REFERENCES `authentication_flow` (`ID`),
  CONSTRAINT `FK_AUTH_EXEC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authentication_execution`
--

LOCK TABLES `authentication_execution` WRITE;
/*!40000 ALTER TABLE `authentication_execution` DISABLE KEYS */;
INSERT INTO `authentication_execution` VALUES ('035ca531-4391-44f1-acef-e94611ab2fab',NULL,'auth-otp-form','463f633d-c02e-4537-931f-fc87ef88ecdb','2ad36d2b-cbb1-47a8-b48e-c332b517a38d',0,20,0,NULL,NULL),('04a40ba6-922f-46de-bd94-2577c418f6a0',NULL,'conditional-user-configured','463f633d-c02e-4537-931f-fc87ef88ecdb','1643447a-650a-4429-ab8b-c58b8bd01375',0,10,0,NULL,NULL),('05798c07-ad02-4b67-b26b-ca4f65697b95',NULL,'docker-http-basic-authenticator','463f633d-c02e-4537-931f-fc87ef88ecdb','a037644f-bfe2-4ffa-94b5-11d5710f51c2',0,10,0,NULL,NULL),('0deeee5d-dc92-4e30-a992-fa8cf0ca5acf',NULL,NULL,'463f633d-c02e-4537-931f-fc87ef88ecdb','399012af-7f12-42f0-aa43-4a2236e21265',0,20,1,'a5aa038c-0ace-4398-a913-c61397fd5a0d',NULL),('1006db92-d105-4a68-ac84-d87bd5c37544',NULL,NULL,'e5a722b4-3b15-40ad-bf03-242dffaa63c2','d5cf2798-17ae-4b14-8e74-f63ce508004f',2,20,1,'061e0ddf-2351-4a93-a7e3-6962852f2081',NULL),('11b4534e-8924-4926-92d5-d6f3bfef0e30',NULL,'registration-terms-and-conditions','463f633d-c02e-4537-931f-fc87ef88ecdb','001dc581-9e78-4e59-a18b-5f8e1f1abf00',3,70,0,NULL,NULL),('11db1ea9-566c-42a8-bcf7-d0294908a186',NULL,NULL,'0245a4ff-801f-41e9-9805-a700847ddf88','eb418163-a866-4434-9caa-abc7032a2851',1,20,1,'2d980716-2c54-4762-82c5-ebd623b9d2da',NULL),('139a0dc5-561b-4fc7-9a05-91d89041aba6',NULL,'reset-otp','0245a4ff-801f-41e9-9805-a700847ddf88','1b38079e-d510-437d-b552-b2adb5fc8a6c',0,20,0,NULL,NULL),('16ef8e8c-6a9a-4f6b-8952-bbbf39ccb486',NULL,'conditional-user-configured','0245a4ff-801f-41e9-9805-a700847ddf88','2d980716-2c54-4762-82c5-ebd623b9d2da',0,10,0,NULL,NULL),('171255cc-c196-4a47-a8ec-1b62c3e11b60',NULL,'direct-grant-validate-otp','e5a722b4-3b15-40ad-bf03-242dffaa63c2','9e7b58ae-0b41-4eec-a344-b7e707fa6b96',0,20,0,NULL,NULL),('18c14804-9560-4d92-bcb9-0be8be693b6d',NULL,NULL,'463f633d-c02e-4537-931f-fc87ef88ecdb','3d787cfd-1f93-40b2-aefd-718e81a24156',1,20,1,'0abda33a-a267-47e5-ad84-2f20b2f2a84c',NULL),('1ab35ceb-09a0-424e-b9fc-399187889e53',NULL,'conditional-user-configured','e5a722b4-3b15-40ad-bf03-242dffaa63c2','8307a5bb-d193-4632-a292-ef55c70dd5a8',0,10,0,NULL,NULL),('1bebc49c-49a2-420d-b030-1f68bb2c287a',NULL,'direct-grant-validate-username','e5a722b4-3b15-40ad-bf03-242dffaa63c2','758bb1e0-6463-4b1f-bd0c-765e0b32c029',0,10,0,NULL,NULL),('2063fe19-aa9f-471c-b7b8-dd40a726016d',NULL,'idp-create-user-if-unique','e5a722b4-3b15-40ad-bf03-242dffaa63c2','4ad99a21-eeae-4dc0-bd87-6bee1919f1d6',2,10,0,NULL,'c1689198-0cfd-44aa-830a-bd3ebff586c3'),('21ba133b-ce43-4284-94b4-d3ab35860d2b',NULL,'auth-otp-form','e5a722b4-3b15-40ad-bf03-242dffaa63c2','8307a5bb-d193-4632-a292-ef55c70dd5a8',0,20,0,NULL,NULL),('2494d3d6-4acf-49d5-a79e-913472c69017',NULL,'idp-confirm-link','e5a722b4-3b15-40ad-bf03-242dffaa63c2','5a4f26eb-2b7a-4324-8a4d-786c50b0682b',0,10,0,NULL,NULL),('2587262f-9ce1-417c-8f22-4d1c5e53b6d2',NULL,NULL,'0245a4ff-801f-41e9-9805-a700847ddf88','6bdd29f5-7cb4-4349-9782-c2692d053f0f',0,20,1,'520130c2-87ee-4ccf-af9f-d020eb51b6f1',NULL),('271785d7-c2d4-411f-b3f2-3f6889fe76df',NULL,'idp-confirm-link','0245a4ff-801f-41e9-9805-a700847ddf88','6bdd29f5-7cb4-4349-9782-c2692d053f0f',0,10,0,NULL,NULL),('29f349ca-920a-406a-ae03-59d707db19e2',NULL,'direct-grant-validate-otp','463f633d-c02e-4537-931f-fc87ef88ecdb','1643447a-650a-4429-ab8b-c58b8bd01375',0,20,0,NULL,NULL),('2b23a880-730a-4c62-83fd-bcb30eb413f5',NULL,'http-basic-authenticator','0245a4ff-801f-41e9-9805-a700847ddf88','c035b63f-4426-499c-a33c-f0ce3d1eb458',0,10,0,NULL,NULL),('2f04d8cc-7438-4264-a599-52fa98b2a5a6',NULL,'idp-username-password-form','463f633d-c02e-4537-931f-fc87ef88ecdb','3d787cfd-1f93-40b2-aefd-718e81a24156',0,10,0,NULL,NULL),('2f1e81c2-c5b0-49fe-ab58-d012d464c735',NULL,NULL,'463f633d-c02e-4537-931f-fc87ef88ecdb','f19cc9ba-6ad5-4bf0-9cec-e08c0ebeaef6',1,30,1,'1643447a-650a-4429-ab8b-c58b8bd01375',NULL),('30d05b38-81ec-43fe-a6a3-d62fa8f06dfc',NULL,'http-basic-authenticator','463f633d-c02e-4537-931f-fc87ef88ecdb','c6a174ea-8a6e-441c-973b-dbe6aa04ab45',0,10,0,NULL,NULL),('38ff75e6-bd67-41a6-b30b-def96d7b5067',NULL,'client-jwt','0245a4ff-801f-41e9-9805-a700847ddf88','61fd2679-eb16-420d-8ea5-abbf122381f4',2,20,0,NULL,NULL),('397aee98-0b79-4bff-93b3-11bbe0fd6091',NULL,NULL,'0245a4ff-801f-41e9-9805-a700847ddf88','a77838c9-bb69-4b56-9042-9017198a910a',1,20,1,'bc28ae26-89ee-41b4-997c-2a57bf1d6ea4',NULL),('3b8d7762-8326-4b0a-9acd-f532ea5e19d6',NULL,NULL,'e5a722b4-3b15-40ad-bf03-242dffaa63c2','4ad99a21-eeae-4dc0-bd87-6bee1919f1d6',2,20,1,'5a4f26eb-2b7a-4324-8a4d-786c50b0682b',NULL),('3e9efbc3-859a-4285-b2ec-adc8ffeb8ffd',NULL,'registration-user-creation','e5a722b4-3b15-40ad-bf03-242dffaa63c2','db3fda36-bd52-453e-91d4-64eda23195d6',0,20,0,NULL,NULL),('41307448-5d0c-4db6-bd18-9f0d154e22d1',NULL,'auth-otp-form','0245a4ff-801f-41e9-9805-a700847ddf88','2d980716-2c54-4762-82c5-ebd623b9d2da',0,20,0,NULL,NULL),('4303e9f1-b6f0-455f-9a69-1e16b7bcffe2',NULL,'reset-credentials-choose-user','e5a722b4-3b15-40ad-bf03-242dffaa63c2','b6a38793-471c-4c26-8022-f2345f4a194e',0,10,0,NULL,NULL),('4750ea3c-de6a-4e53-8e56-62320a2042d7',NULL,'identity-provider-redirector','463f633d-c02e-4537-931f-fc87ef88ecdb','6c52af22-cdf8-483e-b715-971f5f3c8e29',2,25,0,NULL,NULL),('47768b03-6888-4131-86f0-6e67a09674bb',NULL,NULL,'463f633d-c02e-4537-931f-fc87ef88ecdb','2f1267b9-6462-406a-b275-036339d6f37f',2,20,1,'399012af-7f12-42f0-aa43-4a2236e21265',NULL),('47957f7d-bf5b-492f-bd7f-45be0711ebaa',NULL,'idp-create-user-if-unique','463f633d-c02e-4537-931f-fc87ef88ecdb','2f1267b9-6462-406a-b275-036339d6f37f',2,10,0,NULL,'9610a16c-ed85-48b6-afc2-5f9d14569cec'),('4bc8b643-aa6e-4d16-b6b5-a7c2f19b26de',NULL,'auth-username-password-form','463f633d-c02e-4537-931f-fc87ef88ecdb','1864772f-b53c-4921-91b9-05ca5bcb1afe',0,10,0,NULL,NULL),('4bf26c3a-e818-4b5c-8085-d2825225d5a7',NULL,'docker-http-basic-authenticator','e5a722b4-3b15-40ad-bf03-242dffaa63c2','cc0fc834-b1ce-42a2-9c33-b54a0dd36bd1',0,10,0,NULL,NULL),('4ee6fa5a-4e27-4685-a51a-e3e64852e492',NULL,'conditional-user-configured','0245a4ff-801f-41e9-9805-a700847ddf88','1b38079e-d510-437d-b552-b2adb5fc8a6c',0,10,0,NULL,NULL),('4eec10d9-55a3-41c8-b33e-0ea55b38e642',NULL,'reset-credential-email','e5a722b4-3b15-40ad-bf03-242dffaa63c2','b6a38793-471c-4c26-8022-f2345f4a194e',0,20,0,NULL,NULL),('506a0a0f-f717-4179-a9d2-a540a201463f',NULL,'auth-cookie','e5a722b4-3b15-40ad-bf03-242dffaa63c2','eece1373-606c-49f1-885e-e41cc01e6b5a',2,10,0,NULL,NULL),('56a02203-b345-4939-8dac-268489e8a58e',NULL,'auth-spnego','0245a4ff-801f-41e9-9805-a700847ddf88','2601fc30-1862-42dd-a970-2987f0ee8e5f',3,20,0,NULL,NULL),('58c3a8b5-5b77-40dd-bfea-ca4a4978d4a6',NULL,'reset-otp','463f633d-c02e-4537-931f-fc87ef88ecdb','29814e28-6a06-4784-bf57-c0de8869cab6',0,20,0,NULL,NULL),('5a0b28cf-e1cc-44cb-9f9e-919bfde0b3f1',NULL,'conditional-user-configured','e5a722b4-3b15-40ad-bf03-242dffaa63c2','fef14bb0-0acb-4984-9816-06c53a25a87a',0,10,0,NULL,NULL),('5a3416ae-7629-4b26-b6b5-53534170c734',NULL,'auth-username-password-form','e5a722b4-3b15-40ad-bf03-242dffaa63c2','38cd664f-6646-4a31-bcfa-5c85ecc61c1f',0,10,0,NULL,NULL),('5e1b0286-9d68-44a7-ab10-40ca975e5ea4',NULL,'registration-user-creation','0245a4ff-801f-41e9-9805-a700847ddf88','e3635365-e214-48cf-a4a3-680f2fe92e42',0,20,0,NULL,NULL),('5f0f7652-91b7-44b6-aa17-3e1672f7ab21',NULL,NULL,'0245a4ff-801f-41e9-9805-a700847ddf88','2ec5e687-26e7-448f-a142-19902d494d5c',0,20,1,'55cbc30a-f98b-475a-a390-1ada2130536f',NULL),('60bbe318-0907-44e2-ba61-71693ab520e5',NULL,'registration-recaptcha-action','0245a4ff-801f-41e9-9805-a700847ddf88','e3635365-e214-48cf-a4a3-680f2fe92e42',3,60,0,NULL,NULL),('636f4023-0e10-4e7c-aac7-ce47b104c057',NULL,'conditional-user-configured','0245a4ff-801f-41e9-9805-a700847ddf88','156f2070-7b93-4939-a9b0-dbc4c3d3b398',0,10,0,NULL,NULL),('659071c5-3ed2-4a38-9923-8db1609d1611',NULL,NULL,'e5a722b4-3b15-40ad-bf03-242dffaa63c2','5a4f26eb-2b7a-4324-8a4d-786c50b0682b',0,20,1,'d5cf2798-17ae-4b14-8e74-f63ce508004f',NULL),('6af181fa-e8e6-4e6e-b503-7ca524029b5d',NULL,'registration-recaptcha-action','e5a722b4-3b15-40ad-bf03-242dffaa63c2','db3fda36-bd52-453e-91d4-64eda23195d6',3,60,0,NULL,NULL),('6b093cbf-597e-4b02-88d3-bc8364471e7d',NULL,'client-secret-jwt','e5a722b4-3b15-40ad-bf03-242dffaa63c2','33ce3cbe-c472-4b64-bb23-9f0eb32766b3',2,30,0,NULL,NULL),('7110f53b-440c-4ee1-ad7b-af2a454556e3',NULL,'client-jwt','463f633d-c02e-4537-931f-fc87ef88ecdb','bad5adab-d7d1-40a7-8270-7a9c061e30ed',2,20,0,NULL,NULL),('72a8c7af-1b89-4aef-82ba-de37d0a1e65a',NULL,'client-secret-jwt','0245a4ff-801f-41e9-9805-a700847ddf88','61fd2679-eb16-420d-8ea5-abbf122381f4',2,30,0,NULL,NULL),('72e95d9b-58b5-48ad-9d54-5498af032479',NULL,NULL,'e5a722b4-3b15-40ad-bf03-242dffaa63c2','c3a84e59-140b-4811-a472-6dd08e913d32',0,20,1,'4ad99a21-eeae-4dc0-bd87-6bee1919f1d6',NULL),('7549e1be-e917-4d6c-92dc-e6c1d29214fc',NULL,'conditional-user-configured','e5a722b4-3b15-40ad-bf03-242dffaa63c2','9e7b58ae-0b41-4eec-a344-b7e707fa6b96',0,10,0,NULL,NULL),('76766a8e-1e41-4a43-8a56-24d2ded04a51',NULL,NULL,'463f633d-c02e-4537-931f-fc87ef88ecdb','6c52af22-cdf8-483e-b715-971f5f3c8e29',2,30,1,'1864772f-b53c-4921-91b9-05ca5bcb1afe',NULL),('76b841e1-eef0-408c-bb20-ec5614aa7c17',NULL,'idp-username-password-form','0245a4ff-801f-41e9-9805-a700847ddf88','a77838c9-bb69-4b56-9042-9017198a910a',0,10,0,NULL,NULL),('779d62a9-72dd-45ea-a348-49a7bfce5a12',NULL,NULL,'e5a722b4-3b15-40ad-bf03-242dffaa63c2','38cd664f-6646-4a31-bcfa-5c85ecc61c1f',1,20,1,'fef14bb0-0acb-4984-9816-06c53a25a87a',NULL),('79477e7a-edba-42f4-b080-3a75707c3b48',NULL,'reset-password','0245a4ff-801f-41e9-9805-a700847ddf88','3dcd38d8-3784-46bd-8c54-fd9ce2988103',0,30,0,NULL,NULL),('79734aea-6f85-45be-8cc2-1d195389395f',NULL,'auth-otp-form','e5a722b4-3b15-40ad-bf03-242dffaa63c2','fef14bb0-0acb-4984-9816-06c53a25a87a',0,20,0,NULL,NULL),('7b5e9b83-ccf2-4720-bd20-8cfef1ef5d65',NULL,'conditional-user-configured','e5a722b4-3b15-40ad-bf03-242dffaa63c2','878547c5-5623-4f44-9445-c981edc950a8',0,10,0,NULL,NULL),('7bee53b7-766e-410d-b793-f091d6da29a5',NULL,NULL,'463f633d-c02e-4537-931f-fc87ef88ecdb','1864772f-b53c-4921-91b9-05ca5bcb1afe',1,20,1,'2ad36d2b-cbb1-47a8-b48e-c332b517a38d',NULL),('803252a5-2881-40e8-93f6-7860a499ca04',NULL,'conditional-user-configured','463f633d-c02e-4537-931f-fc87ef88ecdb','2ad36d2b-cbb1-47a8-b48e-c332b517a38d',0,10,0,NULL,NULL),('83561c9e-fc7d-4b50-8aa0-c728fca735ed',NULL,'client-secret','463f633d-c02e-4537-931f-fc87ef88ecdb','bad5adab-d7d1-40a7-8270-7a9c061e30ed',2,10,0,NULL,NULL),('837c06a5-7777-4e8b-b4c8-e3aeab788bb6',NULL,NULL,'0245a4ff-801f-41e9-9805-a700847ddf88','3dcd38d8-3784-46bd-8c54-fd9ce2988103',1,40,1,'1b38079e-d510-437d-b552-b2adb5fc8a6c',NULL),('848908f1-ee1c-4f72-bac5-83579d3206bc',NULL,'identity-provider-redirector','0245a4ff-801f-41e9-9805-a700847ddf88','2601fc30-1862-42dd-a970-2987f0ee8e5f',2,25,0,NULL,NULL),('85f4f96f-a030-4852-aa4f-bf4f4be61f4e',NULL,'idp-username-password-form','e5a722b4-3b15-40ad-bf03-242dffaa63c2','061e0ddf-2351-4a93-a7e3-6962852f2081',0,10,0,NULL,NULL),('86b24dae-3dab-426b-92c3-a5aeacb6a403',NULL,'idp-email-verification','463f633d-c02e-4537-931f-fc87ef88ecdb','a5aa038c-0ace-4398-a913-c61397fd5a0d',2,10,0,NULL,NULL),('8cfd31f5-136d-4200-8518-d927108dce72',NULL,'idp-review-profile','0245a4ff-801f-41e9-9805-a700847ddf88','2ec5e687-26e7-448f-a142-19902d494d5c',0,10,0,NULL,'120cdab5-ce7e-4c28-a220-bd6115281a1d'),('8f835d3b-9529-4d82-9bac-430fcd02eced',NULL,'idp-review-profile','463f633d-c02e-4537-931f-fc87ef88ecdb','8dc49702-2d63-4c8e-a8c0-1a617ba1660e',0,10,0,NULL,'1ff770a8-481d-4368-9886-07702f16fdcd'),('8fa6c9f1-2ec9-4efa-a01d-821d868a3304',NULL,'reset-credential-email','0245a4ff-801f-41e9-9805-a700847ddf88','3dcd38d8-3784-46bd-8c54-fd9ce2988103',0,20,0,NULL,NULL),('922933d4-48d0-44ae-b24a-f1dc11f2a2ee',NULL,'reset-password','e5a722b4-3b15-40ad-bf03-242dffaa63c2','b6a38793-471c-4c26-8022-f2345f4a194e',0,30,0,NULL,NULL),('9434257f-238d-4727-8e88-f2d36d0d4ad3',NULL,'auth-cookie','463f633d-c02e-4537-931f-fc87ef88ecdb','6c52af22-cdf8-483e-b715-971f5f3c8e29',2,10,0,NULL,NULL),('96ec3813-f8dd-4ce6-a9cf-ee4fee4b205c',NULL,'client-secret','e5a722b4-3b15-40ad-bf03-242dffaa63c2','33ce3cbe-c472-4b64-bb23-9f0eb32766b3',2,10,0,NULL,NULL),('97039842-b9f7-44ac-93bf-3e46a09d327d',NULL,'auth-otp-form','463f633d-c02e-4537-931f-fc87ef88ecdb','0abda33a-a267-47e5-ad84-2f20b2f2a84c',0,20,0,NULL,NULL),('97a2bbd4-eadb-40a8-b0d1-201bb50a5879',NULL,'registration-page-form','463f633d-c02e-4537-931f-fc87ef88ecdb','5f9ded6a-fa4d-430e-9452-344d48b02c3e',0,10,1,'001dc581-9e78-4e59-a18b-5f8e1f1abf00',NULL),('97b258a1-6fb3-40da-9340-2349fef090c0',NULL,'conditional-user-configured','0245a4ff-801f-41e9-9805-a700847ddf88','bc28ae26-89ee-41b4-997c-2a57bf1d6ea4',0,10,0,NULL,NULL),('9ed100c6-38e6-4ddf-ab49-966dba25ce6c',NULL,'auth-username-password-form','0245a4ff-801f-41e9-9805-a700847ddf88','eb418163-a866-4434-9caa-abc7032a2851',0,10,0,NULL,NULL),('9ef3b70b-af6d-4716-add1-9c9c6efaa64c',NULL,'auth-spnego','e5a722b4-3b15-40ad-bf03-242dffaa63c2','eece1373-606c-49f1-885e-e41cc01e6b5a',3,20,0,NULL,NULL),('9f04db22-a1e3-4b4e-9d6b-1bcf2473f10b',NULL,'reset-password','463f633d-c02e-4537-931f-fc87ef88ecdb','02e555d1-217c-4102-b9e5-569e186ba619',0,30,0,NULL,NULL),('a0e29519-acde-4c2a-9a20-a0b95feb9624',NULL,NULL,'463f633d-c02e-4537-931f-fc87ef88ecdb','8dc49702-2d63-4c8e-a8c0-1a617ba1660e',0,20,1,'2f1267b9-6462-406a-b275-036339d6f37f',NULL),('a0e75253-8099-4dc7-9faf-a56880669ffd',NULL,'conditional-user-configured','463f633d-c02e-4537-931f-fc87ef88ecdb','29814e28-6a06-4784-bf57-c0de8869cab6',0,10,0,NULL,NULL),('a25b9361-ef47-4f56-82a2-a76ec9d17d66',NULL,'registration-password-action','0245a4ff-801f-41e9-9805-a700847ddf88','e3635365-e214-48cf-a4a3-680f2fe92e42',0,50,0,NULL,NULL),('a43408e0-867b-4ff0-b865-ef9b83a88968',NULL,'idp-create-user-if-unique','0245a4ff-801f-41e9-9805-a700847ddf88','55cbc30a-f98b-475a-a390-1ada2130536f',2,10,0,NULL,'20799180-456c-4079-8364-c64152825a3c'),('a567adf0-faca-4c1e-aa79-6b3a1b487f3a',NULL,'idp-confirm-link','463f633d-c02e-4537-931f-fc87ef88ecdb','399012af-7f12-42f0-aa43-4a2236e21265',0,10,0,NULL,NULL),('ab559aff-b8f3-4463-b121-a732be8f8653',NULL,'http-basic-authenticator','e5a722b4-3b15-40ad-bf03-242dffaa63c2','87b824b3-bc25-4e4b-a1b4-36eed9b9defb',0,10,0,NULL,NULL),('afe4f838-5a87-4fc5-a5c7-d35099e61a62',NULL,NULL,'e5a722b4-3b15-40ad-bf03-242dffaa63c2','061e0ddf-2351-4a93-a7e3-6962852f2081',1,20,1,'8307a5bb-d193-4632-a292-ef55c70dd5a8',NULL),('b01fba4f-536b-4b17-9928-94e5a88f677a',NULL,'auth-otp-form','0245a4ff-801f-41e9-9805-a700847ddf88','bc28ae26-89ee-41b4-997c-2a57bf1d6ea4',0,20,0,NULL,NULL),('b080f4fe-80d6-4ce6-b50f-d7d21cb6f9be',NULL,'reset-credentials-choose-user','0245a4ff-801f-41e9-9805-a700847ddf88','3dcd38d8-3784-46bd-8c54-fd9ce2988103',0,10,0,NULL,NULL),('b532c994-dfbc-4655-a95d-f44399c630e6',NULL,'client-x509','463f633d-c02e-4537-931f-fc87ef88ecdb','bad5adab-d7d1-40a7-8270-7a9c061e30ed',2,40,0,NULL,NULL),('bb2e521e-1716-4f8e-93ec-a5b20d00fd22',NULL,NULL,'0245a4ff-801f-41e9-9805-a700847ddf88','520130c2-87ee-4ccf-af9f-d020eb51b6f1',2,20,1,'a77838c9-bb69-4b56-9042-9017198a910a',NULL),('bd5708c6-ab28-4659-bdac-8d6227fc6c09',NULL,'direct-grant-validate-password','e5a722b4-3b15-40ad-bf03-242dffaa63c2','758bb1e0-6463-4b1f-bd0c-765e0b32c029',0,20,0,NULL,NULL),('c024330e-856b-4a12-8dd6-d85d40f8102e',NULL,'registration-password-action','e5a722b4-3b15-40ad-bf03-242dffaa63c2','db3fda36-bd52-453e-91d4-64eda23195d6',0,50,0,NULL,NULL),('c2075bed-dcaa-42dc-ac1c-b82750eed572',NULL,'direct-grant-validate-username','0245a4ff-801f-41e9-9805-a700847ddf88','988cc17f-214f-4c8c-a3df-2e8105b58356',0,10,0,NULL,NULL),('c2531c68-d3e3-43c5-8525-96160a3fff55',NULL,'registration-page-form','e5a722b4-3b15-40ad-bf03-242dffaa63c2','f4b75587-69f2-42bd-8a1e-c9a0ca445733',0,10,1,'db3fda36-bd52-453e-91d4-64eda23195d6',NULL),('c5368cf8-537a-403a-8e78-2ef08577b39d',NULL,'registration-password-action','463f633d-c02e-4537-931f-fc87ef88ecdb','001dc581-9e78-4e59-a18b-5f8e1f1abf00',0,50,0,NULL,NULL),('c7c94ce6-966e-46ef-8511-0efc59b52a3c',NULL,'docker-http-basic-authenticator','0245a4ff-801f-41e9-9805-a700847ddf88','3b94527b-b374-4772-b673-a27007768a91',0,10,0,NULL,NULL),('c873e9e9-d2e4-4661-8570-4d3b1630ef76',NULL,NULL,'0245a4ff-801f-41e9-9805-a700847ddf88','2601fc30-1862-42dd-a970-2987f0ee8e5f',2,30,1,'eb418163-a866-4434-9caa-abc7032a2851',NULL),('caf42ae4-01ee-4c37-97a4-fdbfa3a238a8',NULL,'client-jwt','e5a722b4-3b15-40ad-bf03-242dffaa63c2','33ce3cbe-c472-4b64-bb23-9f0eb32766b3',2,20,0,NULL,NULL),('cc15356b-8b2d-42db-b41a-152ddcfba426',NULL,'client-x509','e5a722b4-3b15-40ad-bf03-242dffaa63c2','33ce3cbe-c472-4b64-bb23-9f0eb32766b3',2,40,0,NULL,NULL),('cc883b2e-efd9-4906-8f0d-b1f5b85d613d',NULL,'direct-grant-validate-otp','0245a4ff-801f-41e9-9805-a700847ddf88','156f2070-7b93-4939-a9b0-dbc4c3d3b398',0,20,0,NULL,NULL),('cd77e83f-e3a2-4d05-8a4b-7e18fc86e449',NULL,'registration-page-form','0245a4ff-801f-41e9-9805-a700847ddf88','79d73a47-ed60-4374-8f8d-0363d1830813',0,10,1,'e3635365-e214-48cf-a4a3-680f2fe92e42',NULL),('ceb72a9f-0bee-4aec-9784-de667e2e2ed1',NULL,NULL,'e5a722b4-3b15-40ad-bf03-242dffaa63c2','eece1373-606c-49f1-885e-e41cc01e6b5a',2,30,1,'38cd664f-6646-4a31-bcfa-5c85ecc61c1f',NULL),('d15270ba-309d-4e0e-83b9-651816588c56',NULL,'registration-recaptcha-action','463f633d-c02e-4537-931f-fc87ef88ecdb','001dc581-9e78-4e59-a18b-5f8e1f1abf00',3,60,0,NULL,NULL),('d20f561b-b6ec-47cf-b985-e20cfa0805a7',NULL,'idp-email-verification','e5a722b4-3b15-40ad-bf03-242dffaa63c2','d5cf2798-17ae-4b14-8e74-f63ce508004f',2,10,0,NULL,NULL),('d3615ae2-8f47-45db-b9e7-c79e46a403c1',NULL,NULL,'0245a4ff-801f-41e9-9805-a700847ddf88','55cbc30a-f98b-475a-a390-1ada2130536f',2,20,1,'6bdd29f5-7cb4-4349-9782-c2692d053f0f',NULL),('d3c7ec63-7457-4587-b406-6fe9e867b2ca',NULL,'direct-grant-validate-password','0245a4ff-801f-41e9-9805-a700847ddf88','988cc17f-214f-4c8c-a3df-2e8105b58356',0,20,0,NULL,NULL),('d411a9b0-d79d-40d4-be03-67224beab5c7',NULL,'idp-email-verification','0245a4ff-801f-41e9-9805-a700847ddf88','520130c2-87ee-4ccf-af9f-d020eb51b6f1',2,10,0,NULL,NULL),('d4b8ee91-68e3-4202-8c93-321a781321bc',NULL,NULL,'463f633d-c02e-4537-931f-fc87ef88ecdb','02e555d1-217c-4102-b9e5-569e186ba619',1,40,1,'29814e28-6a06-4784-bf57-c0de8869cab6',NULL),('d6b9ec90-df82-45e6-aacb-292fb4349657',NULL,NULL,'463f633d-c02e-4537-931f-fc87ef88ecdb','a5aa038c-0ace-4398-a913-c61397fd5a0d',2,20,1,'3d787cfd-1f93-40b2-aefd-718e81a24156',NULL),('db7936c0-720f-4ff4-b66f-62bd7ae0cf4e',NULL,'reset-otp','e5a722b4-3b15-40ad-bf03-242dffaa63c2','878547c5-5623-4f44-9445-c981edc950a8',0,20,0,NULL,NULL),('db9ff536-68e7-4263-ad7a-8ef73580b70e',NULL,'identity-provider-redirector','e5a722b4-3b15-40ad-bf03-242dffaa63c2','eece1373-606c-49f1-885e-e41cc01e6b5a',2,25,0,NULL,NULL),('df3762c2-f3b4-4faa-b064-f31ec4f51dbe',NULL,'client-x509','0245a4ff-801f-41e9-9805-a700847ddf88','61fd2679-eb16-420d-8ea5-abbf122381f4',2,40,0,NULL,NULL),('dfb0be02-b3fe-439d-9ee7-e6463316e848',NULL,'reset-credentials-choose-user','463f633d-c02e-4537-931f-fc87ef88ecdb','02e555d1-217c-4102-b9e5-569e186ba619',0,10,0,NULL,NULL),('e0e19184-2872-472f-a4cb-a63fd60d4d07',NULL,'registration-terms-and-conditions','e5a722b4-3b15-40ad-bf03-242dffaa63c2','db3fda36-bd52-453e-91d4-64eda23195d6',3,70,0,NULL,NULL),('e24ba7b2-8b58-4825-b774-d666fba77f4d',NULL,'reset-credential-email','463f633d-c02e-4537-931f-fc87ef88ecdb','02e555d1-217c-4102-b9e5-569e186ba619',0,20,0,NULL,NULL),('e30f9002-15c2-47d8-9d7c-2808d5a656d9',NULL,NULL,'e5a722b4-3b15-40ad-bf03-242dffaa63c2','b6a38793-471c-4c26-8022-f2345f4a194e',1,40,1,'878547c5-5623-4f44-9445-c981edc950a8',NULL),('e3cc2daf-1623-49fa-ae78-7e5637f9e660',NULL,'direct-grant-validate-username','463f633d-c02e-4537-931f-fc87ef88ecdb','f19cc9ba-6ad5-4bf0-9cec-e08c0ebeaef6',0,10,0,NULL,NULL),('ea0aecc9-9f61-491d-87c9-7b0acbbb35f7',NULL,'registration-terms-and-conditions','0245a4ff-801f-41e9-9805-a700847ddf88','e3635365-e214-48cf-a4a3-680f2fe92e42',3,70,0,NULL,NULL),('ec66efa5-152e-4562-a184-1abaf876f04c',NULL,'idp-review-profile','e5a722b4-3b15-40ad-bf03-242dffaa63c2','c3a84e59-140b-4811-a472-6dd08e913d32',0,10,0,NULL,'13cde841-071f-4564-a510-930242de307f'),('ecd795aa-6212-4baf-a52e-6dac9445f2f2',NULL,'registration-user-creation','463f633d-c02e-4537-931f-fc87ef88ecdb','001dc581-9e78-4e59-a18b-5f8e1f1abf00',0,20,0,NULL,NULL),('edac81c9-db60-4d11-9b32-c8f77eaba6d9',NULL,NULL,'0245a4ff-801f-41e9-9805-a700847ddf88','988cc17f-214f-4c8c-a3df-2e8105b58356',1,30,1,'156f2070-7b93-4939-a9b0-dbc4c3d3b398',NULL),('f0dceab8-f511-4215-b058-c6e083c23e47',NULL,'conditional-user-configured','463f633d-c02e-4537-931f-fc87ef88ecdb','0abda33a-a267-47e5-ad84-2f20b2f2a84c',0,10,0,NULL,NULL),('f10fe016-7c17-4df8-9fb8-a72becad5110',NULL,'client-secret-jwt','463f633d-c02e-4537-931f-fc87ef88ecdb','bad5adab-d7d1-40a7-8270-7a9c061e30ed',2,30,0,NULL,NULL),('f38f0e0b-c4d4-46b9-a1a3-c138efec3547',NULL,'direct-grant-validate-password','463f633d-c02e-4537-931f-fc87ef88ecdb','f19cc9ba-6ad5-4bf0-9cec-e08c0ebeaef6',0,20,0,NULL,NULL),('f72ba8a8-a740-4433-bb4d-09aed0fbb166',NULL,NULL,'e5a722b4-3b15-40ad-bf03-242dffaa63c2','758bb1e0-6463-4b1f-bd0c-765e0b32c029',1,30,1,'9e7b58ae-0b41-4eec-a344-b7e707fa6b96',NULL),('fd382192-46bc-4bc8-9162-8969cbf8b08f',NULL,'auth-cookie','0245a4ff-801f-41e9-9805-a700847ddf88','2601fc30-1862-42dd-a970-2987f0ee8e5f',2,10,0,NULL,NULL),('fe56341c-497e-4dbe-8b02-2bb0fdfbdf99',NULL,'auth-spnego','463f633d-c02e-4537-931f-fc87ef88ecdb','6c52af22-cdf8-483e-b715-971f5f3c8e29',3,20,0,NULL,NULL),('ff031b66-277f-4bcd-b51d-2bc83244fc11',NULL,'client-secret','0245a4ff-801f-41e9-9805-a700847ddf88','61fd2679-eb16-420d-8ea5-abbf122381f4',2,10,0,NULL,NULL);
/*!40000 ALTER TABLE `authentication_execution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authentication_flow`
--

DROP TABLE IF EXISTS `authentication_flow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authentication_flow` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ALIAS` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PROVIDER_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'basic-flow',
  `TOP_LEVEL` tinyint NOT NULL DEFAULT '0',
  `BUILT_IN` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_FLOW_REALM` (`REALM_ID`),
  CONSTRAINT `FK_AUTH_FLOW_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authentication_flow`
--

LOCK TABLES `authentication_flow` WRITE;
/*!40000 ALTER TABLE `authentication_flow` DISABLE KEYS */;
INSERT INTO `authentication_flow` VALUES ('001dc581-9e78-4e59-a18b-5f8e1f1abf00','registration form','registration form','463f633d-c02e-4537-931f-fc87ef88ecdb','form-flow',0,1),('02e555d1-217c-4102-b9e5-569e186ba619','reset credentials','Reset credentials for a user if they forgot their password or something','463f633d-c02e-4537-931f-fc87ef88ecdb','basic-flow',1,1),('061e0ddf-2351-4a93-a7e3-6962852f2081','Verify Existing Account by Re-authentication','Reauthentication of existing account','e5a722b4-3b15-40ad-bf03-242dffaa63c2','basic-flow',0,1),('0abda33a-a267-47e5-ad84-2f20b2f2a84c','First broker login - Conditional OTP','Flow to determine if the OTP is required for the authentication','463f633d-c02e-4537-931f-fc87ef88ecdb','basic-flow',0,1),('156f2070-7b93-4939-a9b0-dbc4c3d3b398','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','0245a4ff-801f-41e9-9805-a700847ddf88','basic-flow',0,1),('1643447a-650a-4429-ab8b-c58b8bd01375','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','463f633d-c02e-4537-931f-fc87ef88ecdb','basic-flow',0,1),('1864772f-b53c-4921-91b9-05ca5bcb1afe','forms','Username, password, otp and other auth forms.','463f633d-c02e-4537-931f-fc87ef88ecdb','basic-flow',0,1),('1b38079e-d510-437d-b552-b2adb5fc8a6c','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','0245a4ff-801f-41e9-9805-a700847ddf88','basic-flow',0,1),('2601fc30-1862-42dd-a970-2987f0ee8e5f','browser','browser based authentication','0245a4ff-801f-41e9-9805-a700847ddf88','basic-flow',1,1),('29814e28-6a06-4784-bf57-c0de8869cab6','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','463f633d-c02e-4537-931f-fc87ef88ecdb','basic-flow',0,1),('2ad36d2b-cbb1-47a8-b48e-c332b517a38d','Browser - Conditional OTP','Flow to determine if the OTP is required for the authentication','463f633d-c02e-4537-931f-fc87ef88ecdb','basic-flow',0,1),('2d980716-2c54-4762-82c5-ebd623b9d2da','Browser - Conditional OTP','Flow to determine if the OTP is required for the authentication','0245a4ff-801f-41e9-9805-a700847ddf88','basic-flow',0,1),('2ec5e687-26e7-448f-a142-19902d494d5c','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','0245a4ff-801f-41e9-9805-a700847ddf88','basic-flow',1,1),('2f1267b9-6462-406a-b275-036339d6f37f','User creation or linking','Flow for the existing/non-existing user alternatives','463f633d-c02e-4537-931f-fc87ef88ecdb','basic-flow',0,1),('33ce3cbe-c472-4b64-bb23-9f0eb32766b3','clients','Base authentication for clients','e5a722b4-3b15-40ad-bf03-242dffaa63c2','client-flow',1,1),('38cd664f-6646-4a31-bcfa-5c85ecc61c1f','forms','Username, password, otp and other auth forms.','e5a722b4-3b15-40ad-bf03-242dffaa63c2','basic-flow',0,1),('399012af-7f12-42f0-aa43-4a2236e21265','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','463f633d-c02e-4537-931f-fc87ef88ecdb','basic-flow',0,1),('3b94527b-b374-4772-b673-a27007768a91','docker auth','Used by Docker clients to authenticate against the IDP','0245a4ff-801f-41e9-9805-a700847ddf88','basic-flow',1,1),('3d787cfd-1f93-40b2-aefd-718e81a24156','Verify Existing Account by Re-authentication','Reauthentication of existing account','463f633d-c02e-4537-931f-fc87ef88ecdb','basic-flow',0,1),('3dcd38d8-3784-46bd-8c54-fd9ce2988103','reset credentials','Reset credentials for a user if they forgot their password or something','0245a4ff-801f-41e9-9805-a700847ddf88','basic-flow',1,1),('4ad99a21-eeae-4dc0-bd87-6bee1919f1d6','User creation or linking','Flow for the existing/non-existing user alternatives','e5a722b4-3b15-40ad-bf03-242dffaa63c2','basic-flow',0,1),('520130c2-87ee-4ccf-af9f-d020eb51b6f1','Account verification options','Method with which to verity the existing account','0245a4ff-801f-41e9-9805-a700847ddf88','basic-flow',0,1),('55cbc30a-f98b-475a-a390-1ada2130536f','User creation or linking','Flow for the existing/non-existing user alternatives','0245a4ff-801f-41e9-9805-a700847ddf88','basic-flow',0,1),('5a4f26eb-2b7a-4324-8a4d-786c50b0682b','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','e5a722b4-3b15-40ad-bf03-242dffaa63c2','basic-flow',0,1),('5f9ded6a-fa4d-430e-9452-344d48b02c3e','registration','registration flow','463f633d-c02e-4537-931f-fc87ef88ecdb','basic-flow',1,1),('61fd2679-eb16-420d-8ea5-abbf122381f4','clients','Base authentication for clients','0245a4ff-801f-41e9-9805-a700847ddf88','client-flow',1,1),('6bdd29f5-7cb4-4349-9782-c2692d053f0f','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','0245a4ff-801f-41e9-9805-a700847ddf88','basic-flow',0,1),('6c52af22-cdf8-483e-b715-971f5f3c8e29','browser','browser based authentication','463f633d-c02e-4537-931f-fc87ef88ecdb','basic-flow',1,1),('758bb1e0-6463-4b1f-bd0c-765e0b32c029','direct grant','OpenID Connect Resource Owner Grant','e5a722b4-3b15-40ad-bf03-242dffaa63c2','basic-flow',1,1),('79d73a47-ed60-4374-8f8d-0363d1830813','registration','registration flow','0245a4ff-801f-41e9-9805-a700847ddf88','basic-flow',1,1),('8307a5bb-d193-4632-a292-ef55c70dd5a8','First broker login - Conditional OTP','Flow to determine if the OTP is required for the authentication','e5a722b4-3b15-40ad-bf03-242dffaa63c2','basic-flow',0,1),('878547c5-5623-4f44-9445-c981edc950a8','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','e5a722b4-3b15-40ad-bf03-242dffaa63c2','basic-flow',0,1),('87b824b3-bc25-4e4b-a1b4-36eed9b9defb','saml ecp','SAML ECP Profile Authentication Flow','e5a722b4-3b15-40ad-bf03-242dffaa63c2','basic-flow',1,1),('8dc49702-2d63-4c8e-a8c0-1a617ba1660e','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','463f633d-c02e-4537-931f-fc87ef88ecdb','basic-flow',1,1),('988cc17f-214f-4c8c-a3df-2e8105b58356','direct grant','OpenID Connect Resource Owner Grant','0245a4ff-801f-41e9-9805-a700847ddf88','basic-flow',1,1),('9e7b58ae-0b41-4eec-a344-b7e707fa6b96','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','e5a722b4-3b15-40ad-bf03-242dffaa63c2','basic-flow',0,1),('a037644f-bfe2-4ffa-94b5-11d5710f51c2','docker auth','Used by Docker clients to authenticate against the IDP','463f633d-c02e-4537-931f-fc87ef88ecdb','basic-flow',1,1),('a5aa038c-0ace-4398-a913-c61397fd5a0d','Account verification options','Method with which to verity the existing account','463f633d-c02e-4537-931f-fc87ef88ecdb','basic-flow',0,1),('a77838c9-bb69-4b56-9042-9017198a910a','Verify Existing Account by Re-authentication','Reauthentication of existing account','0245a4ff-801f-41e9-9805-a700847ddf88','basic-flow',0,1),('b6a38793-471c-4c26-8022-f2345f4a194e','reset credentials','Reset credentials for a user if they forgot their password or something','e5a722b4-3b15-40ad-bf03-242dffaa63c2','basic-flow',1,1),('bad5adab-d7d1-40a7-8270-7a9c061e30ed','clients','Base authentication for clients','463f633d-c02e-4537-931f-fc87ef88ecdb','client-flow',1,1),('bc28ae26-89ee-41b4-997c-2a57bf1d6ea4','First broker login - Conditional OTP','Flow to determine if the OTP is required for the authentication','0245a4ff-801f-41e9-9805-a700847ddf88','basic-flow',0,1),('c035b63f-4426-499c-a33c-f0ce3d1eb458','saml ecp','SAML ECP Profile Authentication Flow','0245a4ff-801f-41e9-9805-a700847ddf88','basic-flow',1,1),('c3a84e59-140b-4811-a472-6dd08e913d32','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','e5a722b4-3b15-40ad-bf03-242dffaa63c2','basic-flow',1,1),('c6a174ea-8a6e-441c-973b-dbe6aa04ab45','saml ecp','SAML ECP Profile Authentication Flow','463f633d-c02e-4537-931f-fc87ef88ecdb','basic-flow',1,1),('cc0fc834-b1ce-42a2-9c33-b54a0dd36bd1','docker auth','Used by Docker clients to authenticate against the IDP','e5a722b4-3b15-40ad-bf03-242dffaa63c2','basic-flow',1,1),('d5cf2798-17ae-4b14-8e74-f63ce508004f','Account verification options','Method with which to verity the existing account','e5a722b4-3b15-40ad-bf03-242dffaa63c2','basic-flow',0,1),('db3fda36-bd52-453e-91d4-64eda23195d6','registration form','registration form','e5a722b4-3b15-40ad-bf03-242dffaa63c2','form-flow',0,1),('e3635365-e214-48cf-a4a3-680f2fe92e42','registration form','registration form','0245a4ff-801f-41e9-9805-a700847ddf88','form-flow',0,1),('eb418163-a866-4434-9caa-abc7032a2851','forms','Username, password, otp and other auth forms.','0245a4ff-801f-41e9-9805-a700847ddf88','basic-flow',0,1),('eece1373-606c-49f1-885e-e41cc01e6b5a','browser','browser based authentication','e5a722b4-3b15-40ad-bf03-242dffaa63c2','basic-flow',1,1),('f19cc9ba-6ad5-4bf0-9cec-e08c0ebeaef6','direct grant','OpenID Connect Resource Owner Grant','463f633d-c02e-4537-931f-fc87ef88ecdb','basic-flow',1,1),('f4b75587-69f2-42bd-8a1e-c9a0ca445733','registration','registration flow','e5a722b4-3b15-40ad-bf03-242dffaa63c2','basic-flow',1,1),('fef14bb0-0acb-4984-9816-06c53a25a87a','Browser - Conditional OTP','Flow to determine if the OTP is required for the authentication','e5a722b4-3b15-40ad-bf03-242dffaa63c2','basic-flow',0,1);
/*!40000 ALTER TABLE `authentication_flow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authenticator_config`
--

DROP TABLE IF EXISTS `authenticator_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authenticator_config` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ALIAS` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_CONFIG_REALM` (`REALM_ID`),
  CONSTRAINT `FK_AUTH_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authenticator_config`
--

LOCK TABLES `authenticator_config` WRITE;
/*!40000 ALTER TABLE `authenticator_config` DISABLE KEYS */;
INSERT INTO `authenticator_config` VALUES ('120cdab5-ce7e-4c28-a220-bd6115281a1d','review profile config','0245a4ff-801f-41e9-9805-a700847ddf88'),('13cde841-071f-4564-a510-930242de307f','review profile config','e5a722b4-3b15-40ad-bf03-242dffaa63c2'),('1ff770a8-481d-4368-9886-07702f16fdcd','review profile config','463f633d-c02e-4537-931f-fc87ef88ecdb'),('20799180-456c-4079-8364-c64152825a3c','create unique user config','0245a4ff-801f-41e9-9805-a700847ddf88'),('9610a16c-ed85-48b6-afc2-5f9d14569cec','create unique user config','463f633d-c02e-4537-931f-fc87ef88ecdb'),('c1689198-0cfd-44aa-830a-bd3ebff586c3','create unique user config','e5a722b4-3b15-40ad-bf03-242dffaa63c2');
/*!40000 ALTER TABLE `authenticator_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authenticator_config_entry`
--

DROP TABLE IF EXISTS `authenticator_config_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authenticator_config_entry` (
  `AUTHENTICATOR_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` longtext COLLATE utf8mb4_unicode_ci,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`AUTHENTICATOR_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authenticator_config_entry`
--

LOCK TABLES `authenticator_config_entry` WRITE;
/*!40000 ALTER TABLE `authenticator_config_entry` DISABLE KEYS */;
INSERT INTO `authenticator_config_entry` VALUES ('120cdab5-ce7e-4c28-a220-bd6115281a1d','missing','update.profile.on.first.login'),('13cde841-071f-4564-a510-930242de307f','missing','update.profile.on.first.login'),('1ff770a8-481d-4368-9886-07702f16fdcd','missing','update.profile.on.first.login'),('20799180-456c-4079-8364-c64152825a3c','false','require.password.update.after.registration'),('9610a16c-ed85-48b6-afc2-5f9d14569cec','false','require.password.update.after.registration'),('c1689198-0cfd-44aa-830a-bd3ebff586c3','false','require.password.update.after.registration');
/*!40000 ALTER TABLE `authenticator_config_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `broker_link`
--

DROP TABLE IF EXISTS `broker_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `broker_link` (
  `IDENTITY_PROVIDER` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `BROKER_USER_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BROKER_USERNAME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TOKEN` text COLLATE utf8mb4_unicode_ci,
  `USER_ID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `broker_link`
--

LOCK TABLES `broker_link` WRITE;
/*!40000 ALTER TABLE `broker_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `broker_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ENABLED` tinyint NOT NULL DEFAULT '0',
  `FULL_SCOPE_ALLOWED` tinyint NOT NULL DEFAULT '0',
  `CLIENT_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NOT_BEFORE` int DEFAULT NULL,
  `PUBLIC_CLIENT` tinyint NOT NULL DEFAULT '0',
  `SECRET` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BASE_URL` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BEARER_ONLY` tinyint NOT NULL DEFAULT '0',
  `MANAGEMENT_URL` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SURROGATE_AUTH_REQUIRED` tinyint NOT NULL DEFAULT '0',
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PROTOCOL` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NODE_REREG_TIMEOUT` int DEFAULT '0',
  `FRONTCHANNEL_LOGOUT` tinyint NOT NULL DEFAULT '0',
  `CONSENT_REQUIRED` tinyint NOT NULL DEFAULT '0',
  `NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `SERVICE_ACCOUNTS_ENABLED` tinyint NOT NULL DEFAULT '0',
  `CLIENT_AUTHENTICATOR_TYPE` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ROOT_URL` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `REGISTRATION_TOKEN` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `STANDARD_FLOW_ENABLED` tinyint NOT NULL DEFAULT '1',
  `IMPLICIT_FLOW_ENABLED` tinyint NOT NULL DEFAULT '0',
  `DIRECT_ACCESS_GRANTS_ENABLED` tinyint NOT NULL DEFAULT '0',
  `ALWAYS_DISPLAY_IN_CONSOLE` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_B71CJLBENV945RB6GCON438AT` (`REALM_ID`,`CLIENT_ID`),
  KEY `IDX_CLIENT_ID` (`CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES ('273eb56f-e808-4871-962d-76a6adc2e837',1,0,'account-console',0,1,NULL,'/realms/ou-graduation-realm/account/',0,NULL,0,'0245a4ff-801f-41e9-9805-a700847ddf88','openid-connect',0,0,0,'${client_account-console}',0,'client-secret','${authBaseUrl}',NULL,NULL,1,0,0,0),('38b1ac57-9913-4586-8a2f-c4694643ec98',1,0,'security-admin-console',0,1,NULL,'/admin/demo-keycloak/console/',0,NULL,0,'e5a722b4-3b15-40ad-bf03-242dffaa63c2','openid-connect',0,0,0,'${client_security-admin-console}',0,'client-secret','${authAdminUrl}',NULL,NULL,1,0,0,0),('39390794-4eb4-4288-82c5-e1f8d74f992b',1,0,'account',0,1,NULL,'/realms/ou-graduation-realm/account/',0,NULL,0,'0245a4ff-801f-41e9-9805-a700847ddf88','openid-connect',0,0,0,'${client_account}',0,'client-secret','${authBaseUrl}',NULL,NULL,1,0,0,0),('43b9bd23-4e8b-491c-9837-b722d4ad5c80',1,1,'demo-keycloak-app',0,0,'SUZKExzD93jX94ir36TjDM8GwTrWYrz5','',0,'',0,'e5a722b4-3b15-40ad-bf03-242dffaa63c2','openid-connect',-1,1,0,'Demo KeyCloak Application',0,'client-secret','','Demo KeyCloak Application',NULL,1,0,1,0),('459679dc-48b0-4ced-8b8b-5a5b6dc073ad',1,0,'demo-keycloak-realm',0,0,NULL,NULL,1,NULL,0,'463f633d-c02e-4537-931f-fc87ef88ecdb',NULL,0,0,0,'demo-keycloak Realm',0,'client-secret',NULL,NULL,NULL,1,0,0,0),('528cf47d-0d61-47bc-96ad-2363849ae6d4',1,0,'account',0,1,NULL,'/realms/master/account/',0,NULL,0,'463f633d-c02e-4537-931f-fc87ef88ecdb','openid-connect',0,0,0,'${client_account}',0,'client-secret','${authBaseUrl}',NULL,NULL,1,0,0,0),('53d0b74d-cf33-41ec-8436-07c48eab5856',1,0,'admin-cli',0,1,NULL,NULL,0,NULL,0,'0245a4ff-801f-41e9-9805-a700847ddf88','openid-connect',0,0,0,'${client_admin-cli}',0,'client-secret',NULL,NULL,NULL,0,0,1,0),('56b85807-2dd7-44ff-b30b-e7ef42d80874',1,0,'security-admin-console',0,1,NULL,'/admin/master/console/',0,NULL,0,'463f633d-c02e-4537-931f-fc87ef88ecdb','openid-connect',0,0,0,'${client_security-admin-console}',0,'client-secret','${authAdminUrl}',NULL,NULL,1,0,0,0),('63d05341-caf2-4698-97eb-186b9f96ad6b',1,0,'broker',0,0,NULL,NULL,1,NULL,0,'e5a722b4-3b15-40ad-bf03-242dffaa63c2','openid-connect',0,0,0,'${client_broker}',0,'client-secret',NULL,NULL,NULL,1,0,0,0),('673ee5f7-a053-453c-8bed-13d5daad356d',1,1,'ou-graduation-client',0,0,'Jtv820eQMcmaGGtGqkSXMzP51nD6q8Ap','',0,'',0,'0245a4ff-801f-41e9-9805-a700847ddf88','openid-connect',-1,1,0,'',1,'client-secret','','',NULL,1,1,1,0),('6eb15bc4-6445-44ba-8545-24f1ab6d28b1',1,0,'realm-management',0,0,NULL,NULL,1,NULL,0,'0245a4ff-801f-41e9-9805-a700847ddf88','openid-connect',0,0,0,'${client_realm-management}',0,'client-secret',NULL,NULL,NULL,1,0,0,0),('7ad9bf4d-fbfc-4678-b78c-e6a999956eed',1,0,'master-realm',0,0,NULL,NULL,1,NULL,0,'463f633d-c02e-4537-931f-fc87ef88ecdb',NULL,0,0,0,'master Realm',0,'client-secret',NULL,NULL,NULL,1,0,0,0),('81c8e247-5382-4490-84b5-5ba89e5ee945',1,0,'broker',0,0,NULL,NULL,1,NULL,0,'0245a4ff-801f-41e9-9805-a700847ddf88','openid-connect',0,0,0,'${client_broker}',0,'client-secret',NULL,NULL,NULL,1,0,0,0),('84b3ca6a-731b-4fec-8712-3ff24d54cad8',1,0,'admin-cli',0,1,NULL,NULL,0,NULL,0,'e5a722b4-3b15-40ad-bf03-242dffaa63c2','openid-connect',0,0,0,'${client_admin-cli}',0,'client-secret',NULL,NULL,NULL,0,0,1,0),('85e2c2c2-bc16-44b4-b252-c4b8ddc9c21c',1,0,'account-console',0,1,NULL,'/realms/master/account/',0,NULL,0,'463f633d-c02e-4537-931f-fc87ef88ecdb','openid-connect',0,0,0,'${client_account-console}',0,'client-secret','${authBaseUrl}',NULL,NULL,1,0,0,0),('8c43155a-9bd4-449f-8bda-7644869a8c6c',1,0,'admin-cli',0,1,NULL,NULL,0,NULL,0,'463f633d-c02e-4537-931f-fc87ef88ecdb','openid-connect',0,0,0,'${client_admin-cli}',0,'client-secret',NULL,NULL,NULL,0,0,1,0),('9b324760-588a-47ee-b552-8f71b234e2c9',1,1,'demo-keycloak-spring-boot-app',0,0,'2RU1HnmSSNi3vkCXzVN4xsTaMNIgQB3e','',0,'',0,'e5a722b4-3b15-40ad-bf03-242dffaa63c2','openid-connect',-1,1,0,'Spring Boot Application',1,'client-secret','','Spring Boot Application',NULL,1,0,1,0),('b3620883-7210-478f-a415-54d4b7d5b175',1,0,'security-admin-console',0,1,NULL,'/admin/ou-graduation-realm/console/',0,NULL,0,'0245a4ff-801f-41e9-9805-a700847ddf88','openid-connect',0,0,0,'${client_security-admin-console}',0,'client-secret','${authAdminUrl}',NULL,NULL,1,0,0,0),('c10ec634-a81f-4355-b749-d99c902f0897',1,0,'ou-graduation-realm-realm',0,0,NULL,NULL,1,NULL,0,'463f633d-c02e-4537-931f-fc87ef88ecdb',NULL,0,0,0,'ou-graduation-realm Realm',0,'client-secret',NULL,NULL,NULL,1,0,0,0),('cd3fcf55-42f5-4955-b13b-76a184f21ad9',1,0,'account',0,1,NULL,'/realms/demo-keycloak/account/',0,NULL,0,'e5a722b4-3b15-40ad-bf03-242dffaa63c2','openid-connect',0,0,0,'${client_account}',0,'client-secret','${authBaseUrl}',NULL,NULL,1,0,0,0),('d1cd5eb6-31a5-47e7-a091-067e2cde7532',1,0,'broker',0,0,NULL,NULL,1,NULL,0,'463f633d-c02e-4537-931f-fc87ef88ecdb','openid-connect',0,0,0,'${client_broker}',0,'client-secret',NULL,NULL,NULL,1,0,0,0),('d988d29a-bfa8-4def-a104-2b3879d2a442',1,0,'account-console',0,1,NULL,'/realms/demo-keycloak/account/',0,NULL,0,'e5a722b4-3b15-40ad-bf03-242dffaa63c2','openid-connect',0,0,0,'${client_account-console}',0,'client-secret','${authBaseUrl}',NULL,NULL,1,0,0,0),('f99210e7-f0a1-4361-b206-599469e91e2e',1,0,'realm-management',0,0,NULL,NULL,1,NULL,0,'e5a722b4-3b15-40ad-bf03-242dffaa63c2','openid-connect',0,0,0,'${client_realm-management}',0,'client-secret',NULL,NULL,NULL,1,0,0,0);
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_attributes`
--

DROP TABLE IF EXISTS `client_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_attributes` (
  `CLIENT_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  PRIMARY KEY (`CLIENT_ID`,`NAME`),
  KEY `IDX_CLIENT_ATT_BY_NAME_VALUE` (`NAME`,`VALUE`(255)),
  CONSTRAINT `FK3C47C64BEACCA966` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_attributes`
--

LOCK TABLES `client_attributes` WRITE;
/*!40000 ALTER TABLE `client_attributes` DISABLE KEYS */;
INSERT INTO `client_attributes` VALUES ('273eb56f-e808-4871-962d-76a6adc2e837','pkce.code.challenge.method','S256'),('273eb56f-e808-4871-962d-76a6adc2e837','post.logout.redirect.uris','+'),('38b1ac57-9913-4586-8a2f-c4694643ec98','pkce.code.challenge.method','S256'),('38b1ac57-9913-4586-8a2f-c4694643ec98','post.logout.redirect.uris','+'),('39390794-4eb4-4288-82c5-e1f8d74f992b','post.logout.redirect.uris','+'),('43b9bd23-4e8b-491c-9837-b722d4ad5c80','backchannel.logout.revoke.offline.tokens','false'),('43b9bd23-4e8b-491c-9837-b722d4ad5c80','backchannel.logout.session.required','true'),('43b9bd23-4e8b-491c-9837-b722d4ad5c80','client.secret.creation.time','1710903840'),('43b9bd23-4e8b-491c-9837-b722d4ad5c80','oauth2.device.authorization.grant.enabled','false'),('43b9bd23-4e8b-491c-9837-b722d4ad5c80','oidc.ciba.grant.enabled','false'),('528cf47d-0d61-47bc-96ad-2363849ae6d4','post.logout.redirect.uris','+'),('56b85807-2dd7-44ff-b30b-e7ef42d80874','pkce.code.challenge.method','S256'),('56b85807-2dd7-44ff-b30b-e7ef42d80874','post.logout.redirect.uris','+'),('673ee5f7-a053-453c-8bed-13d5daad356d','backchannel.logout.revoke.offline.tokens','false'),('673ee5f7-a053-453c-8bed-13d5daad356d','backchannel.logout.session.required','true'),('673ee5f7-a053-453c-8bed-13d5daad356d','client.secret.creation.time','1711336471'),('673ee5f7-a053-453c-8bed-13d5daad356d','display.on.consent.screen','false'),('673ee5f7-a053-453c-8bed-13d5daad356d','oauth2.device.authorization.grant.enabled','false'),('673ee5f7-a053-453c-8bed-13d5daad356d','oidc.ciba.grant.enabled','false'),('85e2c2c2-bc16-44b4-b252-c4b8ddc9c21c','pkce.code.challenge.method','S256'),('85e2c2c2-bc16-44b4-b252-c4b8ddc9c21c','post.logout.redirect.uris','+'),('9b324760-588a-47ee-b552-8f71b234e2c9','backchannel.logout.revoke.offline.tokens','false'),('9b324760-588a-47ee-b552-8f71b234e2c9','backchannel.logout.session.required','true'),('9b324760-588a-47ee-b552-8f71b234e2c9','client.secret.creation.time','1710925838'),('9b324760-588a-47ee-b552-8f71b234e2c9','display.on.consent.screen','false'),('9b324760-588a-47ee-b552-8f71b234e2c9','oauth2.device.authorization.grant.enabled','false'),('9b324760-588a-47ee-b552-8f71b234e2c9','oidc.ciba.grant.enabled','false'),('b3620883-7210-478f-a415-54d4b7d5b175','pkce.code.challenge.method','S256'),('b3620883-7210-478f-a415-54d4b7d5b175','post.logout.redirect.uris','+'),('cd3fcf55-42f5-4955-b13b-76a184f21ad9','post.logout.redirect.uris','+'),('d988d29a-bfa8-4def-a104-2b3879d2a442','pkce.code.challenge.method','S256'),('d988d29a-bfa8-4def-a104-2b3879d2a442','post.logout.redirect.uris','+');
/*!40000 ALTER TABLE `client_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_auth_flow_bindings`
--

DROP TABLE IF EXISTS `client_auth_flow_bindings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_auth_flow_bindings` (
  `CLIENT_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FLOW_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BINDING_NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`BINDING_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_auth_flow_bindings`
--

LOCK TABLES `client_auth_flow_bindings` WRITE;
/*!40000 ALTER TABLE `client_auth_flow_bindings` DISABLE KEYS */;
/*!40000 ALTER TABLE `client_auth_flow_bindings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_initial_access`
--

DROP TABLE IF EXISTS `client_initial_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_initial_access` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TIMESTAMP` int DEFAULT NULL,
  `EXPIRATION` int DEFAULT NULL,
  `COUNT` int DEFAULT NULL,
  `REMAINING_COUNT` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_CLIENT_INIT_ACC_REALM` (`REALM_ID`),
  CONSTRAINT `FK_CLIENT_INIT_ACC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_initial_access`
--

LOCK TABLES `client_initial_access` WRITE;
/*!40000 ALTER TABLE `client_initial_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `client_initial_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_node_registrations`
--

DROP TABLE IF EXISTS `client_node_registrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_node_registrations` (
  `CLIENT_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` int DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`NAME`),
  CONSTRAINT `FK4129723BA992F594` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_node_registrations`
--

LOCK TABLES `client_node_registrations` WRITE;
/*!40000 ALTER TABLE `client_node_registrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `client_node_registrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_scope`
--

DROP TABLE IF EXISTS `client_scope`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_scope` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `PROTOCOL` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_CLI_SCOPE` (`REALM_ID`,`NAME`),
  KEY `IDX_REALM_CLSCOPE` (`REALM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_scope`
--

LOCK TABLES `client_scope` WRITE;
/*!40000 ALTER TABLE `client_scope` DISABLE KEYS */;
INSERT INTO `client_scope` VALUES ('0ae304fd-6ae9-435a-973e-5a13dec0300c','offline_access','0245a4ff-801f-41e9-9805-a700847ddf88','OpenID Connect built-in scope: offline_access','openid-connect'),('0d037f7d-a8b3-4f39-8d03-867fe8241bd5','microprofile-jwt','e5a722b4-3b15-40ad-bf03-242dffaa63c2','Microprofile - JWT built-in scope','openid-connect'),('0d76c208-71e4-4d15-9c15-ec03c772d5c9','acr','e5a722b4-3b15-40ad-bf03-242dffaa63c2','OpenID Connect scope for add acr (authentication context class reference) to the token','openid-connect'),('16d688f2-fdf3-441b-afff-0d1cc9a9891f','roles','463f633d-c02e-4537-931f-fc87ef88ecdb','OpenID Connect scope for add user roles to the access token','openid-connect'),('26b9dc88-6c81-4317-b8fa-27c11de60a69','phone','e5a722b4-3b15-40ad-bf03-242dffaa63c2','OpenID Connect built-in scope: phone','openid-connect'),('2806fa62-de59-4c71-b18a-21eb92067482','offline_access','e5a722b4-3b15-40ad-bf03-242dffaa63c2','OpenID Connect built-in scope: offline_access','openid-connect'),('487211fb-eb4c-4b9a-a650-fb3eea171a09','profile','e5a722b4-3b15-40ad-bf03-242dffaa63c2','OpenID Connect built-in scope: profile','openid-connect'),('53ad7090-9e64-48ca-8d5b-a8103dda2d37','web-origins','e5a722b4-3b15-40ad-bf03-242dffaa63c2','OpenID Connect scope for add allowed web origins to the access token','openid-connect'),('590140a6-976e-4ea2-a5f3-a8841d544620','role_list','463f633d-c02e-4537-931f-fc87ef88ecdb','SAML role list','saml'),('63d791fb-2105-4527-ad84-3e92c5b5de13','address','0245a4ff-801f-41e9-9805-a700847ddf88','OpenID Connect built-in scope: address','openid-connect'),('6cafd019-1d64-46d2-9db1-7ff694aaeaa7','roles','0245a4ff-801f-41e9-9805-a700847ddf88','OpenID Connect scope for add user roles to the access token','openid-connect'),('6d3fd4e4-d5de-457c-b30e-25aa2ef73f19','web-origins','463f633d-c02e-4537-931f-fc87ef88ecdb','OpenID Connect scope for add allowed web origins to the access token','openid-connect'),('8ea2b5e0-2d98-4237-835f-56a1b4aa0f0f','email','0245a4ff-801f-41e9-9805-a700847ddf88','OpenID Connect built-in scope: email','openid-connect'),('9708eecb-fdb4-4537-9bb0-383d1bcf11cc','address','463f633d-c02e-4537-931f-fc87ef88ecdb','OpenID Connect built-in scope: address','openid-connect'),('998b2464-1918-4790-b89e-c2bdb51c1d9a','address','e5a722b4-3b15-40ad-bf03-242dffaa63c2','OpenID Connect built-in scope: address','openid-connect'),('a3b0ccee-b5de-496a-bb76-745511b8c384','profile','463f633d-c02e-4537-931f-fc87ef88ecdb','OpenID Connect built-in scope: profile','openid-connect'),('bc9f9b18-0f32-41f0-adff-abadc522ea0f','roles','e5a722b4-3b15-40ad-bf03-242dffaa63c2','OpenID Connect scope for add user roles to the access token','openid-connect'),('bcf63c89-ff10-4bbd-bfea-33fda400b9b0','offline_access','463f633d-c02e-4537-931f-fc87ef88ecdb','OpenID Connect built-in scope: offline_access','openid-connect'),('bd5348cd-6f57-4558-8e9f-2c5a184afb7e','acr','0245a4ff-801f-41e9-9805-a700847ddf88','OpenID Connect scope for add acr (authentication context class reference) to the token','openid-connect'),('c16fac63-0d2d-496c-abff-19d793d6029e','microprofile-jwt','463f633d-c02e-4537-931f-fc87ef88ecdb','Microprofile - JWT built-in scope','openid-connect'),('c1842379-1e21-4eab-96cf-c9dc28d1ca42','role_list','0245a4ff-801f-41e9-9805-a700847ddf88','SAML role list','saml'),('c5a4950d-1cf3-4902-a9ea-fb644f79eeb2','role_list','e5a722b4-3b15-40ad-bf03-242dffaa63c2','SAML role list','saml'),('c8991e6c-534e-4252-b718-7f8f3b40e179','email','463f633d-c02e-4537-931f-fc87ef88ecdb','OpenID Connect built-in scope: email','openid-connect'),('d0221152-f017-47bc-a3a8-f1ea9687703c','phone','0245a4ff-801f-41e9-9805-a700847ddf88','OpenID Connect built-in scope: phone','openid-connect'),('d716c6b2-a331-476d-9631-384ab3810e75','microprofile-jwt','0245a4ff-801f-41e9-9805-a700847ddf88','Microprofile - JWT built-in scope','openid-connect'),('e5151208-a184-4dd0-b90b-c59412572378','acr','463f633d-c02e-4537-931f-fc87ef88ecdb','OpenID Connect scope for add acr (authentication context class reference) to the token','openid-connect'),('ea55f021-67f6-4b61-8257-df177680597b','web-origins','0245a4ff-801f-41e9-9805-a700847ddf88','OpenID Connect scope for add allowed web origins to the access token','openid-connect'),('ecfe4f7e-8dda-45c6-9b8a-748a832d1970','profile','0245a4ff-801f-41e9-9805-a700847ddf88','OpenID Connect built-in scope: profile','openid-connect'),('f4cfa3de-5764-456b-bbf4-5579fb3ed3f6','phone','463f633d-c02e-4537-931f-fc87ef88ecdb','OpenID Connect built-in scope: phone','openid-connect'),('ff4960ec-81e4-4316-8e49-cbce998b1b72','email','e5a722b4-3b15-40ad-bf03-242dffaa63c2','OpenID Connect built-in scope: email','openid-connect');
/*!40000 ALTER TABLE `client_scope` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_scope_attributes`
--

DROP TABLE IF EXISTS `client_scope_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_scope_attributes` (
  `SCOPE_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` text COLLATE utf8mb4_unicode_ci,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`NAME`),
  KEY `IDX_CLSCOPE_ATTRS` (`SCOPE_ID`),
  CONSTRAINT `FK_CL_SCOPE_ATTR_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `client_scope` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_scope_attributes`
--

LOCK TABLES `client_scope_attributes` WRITE;
/*!40000 ALTER TABLE `client_scope_attributes` DISABLE KEYS */;
INSERT INTO `client_scope_attributes` VALUES ('0ae304fd-6ae9-435a-973e-5a13dec0300c','${offlineAccessScopeConsentText}','consent.screen.text'),('0ae304fd-6ae9-435a-973e-5a13dec0300c','true','display.on.consent.screen'),('0d037f7d-a8b3-4f39-8d03-867fe8241bd5','false','display.on.consent.screen'),('0d037f7d-a8b3-4f39-8d03-867fe8241bd5','true','include.in.token.scope'),('0d76c208-71e4-4d15-9c15-ec03c772d5c9','false','display.on.consent.screen'),('0d76c208-71e4-4d15-9c15-ec03c772d5c9','false','include.in.token.scope'),('16d688f2-fdf3-441b-afff-0d1cc9a9891f','${rolesScopeConsentText}','consent.screen.text'),('16d688f2-fdf3-441b-afff-0d1cc9a9891f','true','display.on.consent.screen'),('16d688f2-fdf3-441b-afff-0d1cc9a9891f','false','include.in.token.scope'),('26b9dc88-6c81-4317-b8fa-27c11de60a69','${phoneScopeConsentText}','consent.screen.text'),('26b9dc88-6c81-4317-b8fa-27c11de60a69','true','display.on.consent.screen'),('26b9dc88-6c81-4317-b8fa-27c11de60a69','true','include.in.token.scope'),('2806fa62-de59-4c71-b18a-21eb92067482','${offlineAccessScopeConsentText}','consent.screen.text'),('2806fa62-de59-4c71-b18a-21eb92067482','true','display.on.consent.screen'),('487211fb-eb4c-4b9a-a650-fb3eea171a09','${profileScopeConsentText}','consent.screen.text'),('487211fb-eb4c-4b9a-a650-fb3eea171a09','true','display.on.consent.screen'),('487211fb-eb4c-4b9a-a650-fb3eea171a09','true','include.in.token.scope'),('53ad7090-9e64-48ca-8d5b-a8103dda2d37','','consent.screen.text'),('53ad7090-9e64-48ca-8d5b-a8103dda2d37','false','display.on.consent.screen'),('53ad7090-9e64-48ca-8d5b-a8103dda2d37','false','include.in.token.scope'),('590140a6-976e-4ea2-a5f3-a8841d544620','${samlRoleListScopeConsentText}','consent.screen.text'),('590140a6-976e-4ea2-a5f3-a8841d544620','true','display.on.consent.screen'),('63d791fb-2105-4527-ad84-3e92c5b5de13','${addressScopeConsentText}','consent.screen.text'),('63d791fb-2105-4527-ad84-3e92c5b5de13','true','display.on.consent.screen'),('63d791fb-2105-4527-ad84-3e92c5b5de13','true','include.in.token.scope'),('6cafd019-1d64-46d2-9db1-7ff694aaeaa7','${rolesScopeConsentText}','consent.screen.text'),('6cafd019-1d64-46d2-9db1-7ff694aaeaa7','true','display.on.consent.screen'),('6cafd019-1d64-46d2-9db1-7ff694aaeaa7','false','include.in.token.scope'),('6d3fd4e4-d5de-457c-b30e-25aa2ef73f19','','consent.screen.text'),('6d3fd4e4-d5de-457c-b30e-25aa2ef73f19','false','display.on.consent.screen'),('6d3fd4e4-d5de-457c-b30e-25aa2ef73f19','false','include.in.token.scope'),('8ea2b5e0-2d98-4237-835f-56a1b4aa0f0f','${emailScopeConsentText}','consent.screen.text'),('8ea2b5e0-2d98-4237-835f-56a1b4aa0f0f','true','display.on.consent.screen'),('8ea2b5e0-2d98-4237-835f-56a1b4aa0f0f','true','include.in.token.scope'),('9708eecb-fdb4-4537-9bb0-383d1bcf11cc','${addressScopeConsentText}','consent.screen.text'),('9708eecb-fdb4-4537-9bb0-383d1bcf11cc','true','display.on.consent.screen'),('9708eecb-fdb4-4537-9bb0-383d1bcf11cc','true','include.in.token.scope'),('998b2464-1918-4790-b89e-c2bdb51c1d9a','${addressScopeConsentText}','consent.screen.text'),('998b2464-1918-4790-b89e-c2bdb51c1d9a','true','display.on.consent.screen'),('998b2464-1918-4790-b89e-c2bdb51c1d9a','true','include.in.token.scope'),('a3b0ccee-b5de-496a-bb76-745511b8c384','${profileScopeConsentText}','consent.screen.text'),('a3b0ccee-b5de-496a-bb76-745511b8c384','true','display.on.consent.screen'),('a3b0ccee-b5de-496a-bb76-745511b8c384','true','include.in.token.scope'),('bc9f9b18-0f32-41f0-adff-abadc522ea0f','${rolesScopeConsentText}','consent.screen.text'),('bc9f9b18-0f32-41f0-adff-abadc522ea0f','true','display.on.consent.screen'),('bc9f9b18-0f32-41f0-adff-abadc522ea0f','false','include.in.token.scope'),('bcf63c89-ff10-4bbd-bfea-33fda400b9b0','${offlineAccessScopeConsentText}','consent.screen.text'),('bcf63c89-ff10-4bbd-bfea-33fda400b9b0','true','display.on.consent.screen'),('bd5348cd-6f57-4558-8e9f-2c5a184afb7e','false','display.on.consent.screen'),('bd5348cd-6f57-4558-8e9f-2c5a184afb7e','false','include.in.token.scope'),('c16fac63-0d2d-496c-abff-19d793d6029e','false','display.on.consent.screen'),('c16fac63-0d2d-496c-abff-19d793d6029e','true','include.in.token.scope'),('c1842379-1e21-4eab-96cf-c9dc28d1ca42','${samlRoleListScopeConsentText}','consent.screen.text'),('c1842379-1e21-4eab-96cf-c9dc28d1ca42','true','display.on.consent.screen'),('c5a4950d-1cf3-4902-a9ea-fb644f79eeb2','${samlRoleListScopeConsentText}','consent.screen.text'),('c5a4950d-1cf3-4902-a9ea-fb644f79eeb2','true','display.on.consent.screen'),('c8991e6c-534e-4252-b718-7f8f3b40e179','${emailScopeConsentText}','consent.screen.text'),('c8991e6c-534e-4252-b718-7f8f3b40e179','true','display.on.consent.screen'),('c8991e6c-534e-4252-b718-7f8f3b40e179','true','include.in.token.scope'),('d0221152-f017-47bc-a3a8-f1ea9687703c','${phoneScopeConsentText}','consent.screen.text'),('d0221152-f017-47bc-a3a8-f1ea9687703c','true','display.on.consent.screen'),('d0221152-f017-47bc-a3a8-f1ea9687703c','true','include.in.token.scope'),('d716c6b2-a331-476d-9631-384ab3810e75','false','display.on.consent.screen'),('d716c6b2-a331-476d-9631-384ab3810e75','true','include.in.token.scope'),('e5151208-a184-4dd0-b90b-c59412572378','false','display.on.consent.screen'),('e5151208-a184-4dd0-b90b-c59412572378','false','include.in.token.scope'),('ea55f021-67f6-4b61-8257-df177680597b','','consent.screen.text'),('ea55f021-67f6-4b61-8257-df177680597b','false','display.on.consent.screen'),('ea55f021-67f6-4b61-8257-df177680597b','false','include.in.token.scope'),('ecfe4f7e-8dda-45c6-9b8a-748a832d1970','${profileScopeConsentText}','consent.screen.text'),('ecfe4f7e-8dda-45c6-9b8a-748a832d1970','true','display.on.consent.screen'),('ecfe4f7e-8dda-45c6-9b8a-748a832d1970','true','include.in.token.scope'),('f4cfa3de-5764-456b-bbf4-5579fb3ed3f6','${phoneScopeConsentText}','consent.screen.text'),('f4cfa3de-5764-456b-bbf4-5579fb3ed3f6','true','display.on.consent.screen'),('f4cfa3de-5764-456b-bbf4-5579fb3ed3f6','true','include.in.token.scope'),('ff4960ec-81e4-4316-8e49-cbce998b1b72','${emailScopeConsentText}','consent.screen.text'),('ff4960ec-81e4-4316-8e49-cbce998b1b72','true','display.on.consent.screen'),('ff4960ec-81e4-4316-8e49-cbce998b1b72','true','include.in.token.scope');
/*!40000 ALTER TABLE `client_scope_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_scope_client`
--

DROP TABLE IF EXISTS `client_scope_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_scope_client` (
  `CLIENT_ID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SCOPE_ID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DEFAULT_SCOPE` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`CLIENT_ID`,`SCOPE_ID`),
  KEY `IDX_CLSCOPE_CL` (`CLIENT_ID`),
  KEY `IDX_CL_CLSCOPE` (`SCOPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_scope_client`
--

LOCK TABLES `client_scope_client` WRITE;
/*!40000 ALTER TABLE `client_scope_client` DISABLE KEYS */;
INSERT INTO `client_scope_client` VALUES ('273eb56f-e808-4871-962d-76a6adc2e837','0ae304fd-6ae9-435a-973e-5a13dec0300c',0),('273eb56f-e808-4871-962d-76a6adc2e837','63d791fb-2105-4527-ad84-3e92c5b5de13',0),('273eb56f-e808-4871-962d-76a6adc2e837','6cafd019-1d64-46d2-9db1-7ff694aaeaa7',1),('273eb56f-e808-4871-962d-76a6adc2e837','8ea2b5e0-2d98-4237-835f-56a1b4aa0f0f',1),('273eb56f-e808-4871-962d-76a6adc2e837','bd5348cd-6f57-4558-8e9f-2c5a184afb7e',1),('273eb56f-e808-4871-962d-76a6adc2e837','d0221152-f017-47bc-a3a8-f1ea9687703c',0),('273eb56f-e808-4871-962d-76a6adc2e837','d716c6b2-a331-476d-9631-384ab3810e75',0),('273eb56f-e808-4871-962d-76a6adc2e837','ea55f021-67f6-4b61-8257-df177680597b',1),('273eb56f-e808-4871-962d-76a6adc2e837','ecfe4f7e-8dda-45c6-9b8a-748a832d1970',1),('38b1ac57-9913-4586-8a2f-c4694643ec98','0d037f7d-a8b3-4f39-8d03-867fe8241bd5',0),('38b1ac57-9913-4586-8a2f-c4694643ec98','0d76c208-71e4-4d15-9c15-ec03c772d5c9',1),('38b1ac57-9913-4586-8a2f-c4694643ec98','26b9dc88-6c81-4317-b8fa-27c11de60a69',0),('38b1ac57-9913-4586-8a2f-c4694643ec98','2806fa62-de59-4c71-b18a-21eb92067482',0),('38b1ac57-9913-4586-8a2f-c4694643ec98','487211fb-eb4c-4b9a-a650-fb3eea171a09',1),('38b1ac57-9913-4586-8a2f-c4694643ec98','53ad7090-9e64-48ca-8d5b-a8103dda2d37',1),('38b1ac57-9913-4586-8a2f-c4694643ec98','998b2464-1918-4790-b89e-c2bdb51c1d9a',0),('38b1ac57-9913-4586-8a2f-c4694643ec98','bc9f9b18-0f32-41f0-adff-abadc522ea0f',1),('38b1ac57-9913-4586-8a2f-c4694643ec98','ff4960ec-81e4-4316-8e49-cbce998b1b72',1),('39390794-4eb4-4288-82c5-e1f8d74f992b','0ae304fd-6ae9-435a-973e-5a13dec0300c',0),('39390794-4eb4-4288-82c5-e1f8d74f992b','63d791fb-2105-4527-ad84-3e92c5b5de13',0),('39390794-4eb4-4288-82c5-e1f8d74f992b','6cafd019-1d64-46d2-9db1-7ff694aaeaa7',1),('39390794-4eb4-4288-82c5-e1f8d74f992b','8ea2b5e0-2d98-4237-835f-56a1b4aa0f0f',1),('39390794-4eb4-4288-82c5-e1f8d74f992b','bd5348cd-6f57-4558-8e9f-2c5a184afb7e',1),('39390794-4eb4-4288-82c5-e1f8d74f992b','d0221152-f017-47bc-a3a8-f1ea9687703c',0),('39390794-4eb4-4288-82c5-e1f8d74f992b','d716c6b2-a331-476d-9631-384ab3810e75',0),('39390794-4eb4-4288-82c5-e1f8d74f992b','ea55f021-67f6-4b61-8257-df177680597b',1),('39390794-4eb4-4288-82c5-e1f8d74f992b','ecfe4f7e-8dda-45c6-9b8a-748a832d1970',1),('43b9bd23-4e8b-491c-9837-b722d4ad5c80','0d037f7d-a8b3-4f39-8d03-867fe8241bd5',0),('43b9bd23-4e8b-491c-9837-b722d4ad5c80','0d76c208-71e4-4d15-9c15-ec03c772d5c9',1),('43b9bd23-4e8b-491c-9837-b722d4ad5c80','26b9dc88-6c81-4317-b8fa-27c11de60a69',0),('43b9bd23-4e8b-491c-9837-b722d4ad5c80','2806fa62-de59-4c71-b18a-21eb92067482',0),('43b9bd23-4e8b-491c-9837-b722d4ad5c80','487211fb-eb4c-4b9a-a650-fb3eea171a09',1),('43b9bd23-4e8b-491c-9837-b722d4ad5c80','53ad7090-9e64-48ca-8d5b-a8103dda2d37',1),('43b9bd23-4e8b-491c-9837-b722d4ad5c80','998b2464-1918-4790-b89e-c2bdb51c1d9a',0),('43b9bd23-4e8b-491c-9837-b722d4ad5c80','bc9f9b18-0f32-41f0-adff-abadc522ea0f',1),('43b9bd23-4e8b-491c-9837-b722d4ad5c80','ff4960ec-81e4-4316-8e49-cbce998b1b72',1),('528cf47d-0d61-47bc-96ad-2363849ae6d4','16d688f2-fdf3-441b-afff-0d1cc9a9891f',1),('528cf47d-0d61-47bc-96ad-2363849ae6d4','6d3fd4e4-d5de-457c-b30e-25aa2ef73f19',1),('528cf47d-0d61-47bc-96ad-2363849ae6d4','9708eecb-fdb4-4537-9bb0-383d1bcf11cc',0),('528cf47d-0d61-47bc-96ad-2363849ae6d4','a3b0ccee-b5de-496a-bb76-745511b8c384',1),('528cf47d-0d61-47bc-96ad-2363849ae6d4','bcf63c89-ff10-4bbd-bfea-33fda400b9b0',0),('528cf47d-0d61-47bc-96ad-2363849ae6d4','c16fac63-0d2d-496c-abff-19d793d6029e',0),('528cf47d-0d61-47bc-96ad-2363849ae6d4','c8991e6c-534e-4252-b718-7f8f3b40e179',1),('528cf47d-0d61-47bc-96ad-2363849ae6d4','e5151208-a184-4dd0-b90b-c59412572378',1),('528cf47d-0d61-47bc-96ad-2363849ae6d4','f4cfa3de-5764-456b-bbf4-5579fb3ed3f6',0),('53d0b74d-cf33-41ec-8436-07c48eab5856','0ae304fd-6ae9-435a-973e-5a13dec0300c',0),('53d0b74d-cf33-41ec-8436-07c48eab5856','63d791fb-2105-4527-ad84-3e92c5b5de13',0),('53d0b74d-cf33-41ec-8436-07c48eab5856','6cafd019-1d64-46d2-9db1-7ff694aaeaa7',1),('53d0b74d-cf33-41ec-8436-07c48eab5856','8ea2b5e0-2d98-4237-835f-56a1b4aa0f0f',1),('53d0b74d-cf33-41ec-8436-07c48eab5856','bd5348cd-6f57-4558-8e9f-2c5a184afb7e',1),('53d0b74d-cf33-41ec-8436-07c48eab5856','d0221152-f017-47bc-a3a8-f1ea9687703c',0),('53d0b74d-cf33-41ec-8436-07c48eab5856','d716c6b2-a331-476d-9631-384ab3810e75',0),('53d0b74d-cf33-41ec-8436-07c48eab5856','ea55f021-67f6-4b61-8257-df177680597b',1),('53d0b74d-cf33-41ec-8436-07c48eab5856','ecfe4f7e-8dda-45c6-9b8a-748a832d1970',1),('56b85807-2dd7-44ff-b30b-e7ef42d80874','16d688f2-fdf3-441b-afff-0d1cc9a9891f',1),('56b85807-2dd7-44ff-b30b-e7ef42d80874','6d3fd4e4-d5de-457c-b30e-25aa2ef73f19',1),('56b85807-2dd7-44ff-b30b-e7ef42d80874','9708eecb-fdb4-4537-9bb0-383d1bcf11cc',0),('56b85807-2dd7-44ff-b30b-e7ef42d80874','a3b0ccee-b5de-496a-bb76-745511b8c384',1),('56b85807-2dd7-44ff-b30b-e7ef42d80874','bcf63c89-ff10-4bbd-bfea-33fda400b9b0',0),('56b85807-2dd7-44ff-b30b-e7ef42d80874','c16fac63-0d2d-496c-abff-19d793d6029e',0),('56b85807-2dd7-44ff-b30b-e7ef42d80874','c8991e6c-534e-4252-b718-7f8f3b40e179',1),('56b85807-2dd7-44ff-b30b-e7ef42d80874','e5151208-a184-4dd0-b90b-c59412572378',1),('56b85807-2dd7-44ff-b30b-e7ef42d80874','f4cfa3de-5764-456b-bbf4-5579fb3ed3f6',0),('63d05341-caf2-4698-97eb-186b9f96ad6b','0d037f7d-a8b3-4f39-8d03-867fe8241bd5',0),('63d05341-caf2-4698-97eb-186b9f96ad6b','0d76c208-71e4-4d15-9c15-ec03c772d5c9',1),('63d05341-caf2-4698-97eb-186b9f96ad6b','26b9dc88-6c81-4317-b8fa-27c11de60a69',0),('63d05341-caf2-4698-97eb-186b9f96ad6b','2806fa62-de59-4c71-b18a-21eb92067482',0),('63d05341-caf2-4698-97eb-186b9f96ad6b','487211fb-eb4c-4b9a-a650-fb3eea171a09',1),('63d05341-caf2-4698-97eb-186b9f96ad6b','53ad7090-9e64-48ca-8d5b-a8103dda2d37',1),('63d05341-caf2-4698-97eb-186b9f96ad6b','998b2464-1918-4790-b89e-c2bdb51c1d9a',0),('63d05341-caf2-4698-97eb-186b9f96ad6b','bc9f9b18-0f32-41f0-adff-abadc522ea0f',1),('63d05341-caf2-4698-97eb-186b9f96ad6b','ff4960ec-81e4-4316-8e49-cbce998b1b72',1),('673ee5f7-a053-453c-8bed-13d5daad356d','0ae304fd-6ae9-435a-973e-5a13dec0300c',0),('673ee5f7-a053-453c-8bed-13d5daad356d','63d791fb-2105-4527-ad84-3e92c5b5de13',0),('673ee5f7-a053-453c-8bed-13d5daad356d','6cafd019-1d64-46d2-9db1-7ff694aaeaa7',1),('673ee5f7-a053-453c-8bed-13d5daad356d','8ea2b5e0-2d98-4237-835f-56a1b4aa0f0f',1),('673ee5f7-a053-453c-8bed-13d5daad356d','bd5348cd-6f57-4558-8e9f-2c5a184afb7e',1),('673ee5f7-a053-453c-8bed-13d5daad356d','d0221152-f017-47bc-a3a8-f1ea9687703c',0),('673ee5f7-a053-453c-8bed-13d5daad356d','d716c6b2-a331-476d-9631-384ab3810e75',0),('673ee5f7-a053-453c-8bed-13d5daad356d','ea55f021-67f6-4b61-8257-df177680597b',1),('673ee5f7-a053-453c-8bed-13d5daad356d','ecfe4f7e-8dda-45c6-9b8a-748a832d1970',1),('6eb15bc4-6445-44ba-8545-24f1ab6d28b1','0ae304fd-6ae9-435a-973e-5a13dec0300c',0),('6eb15bc4-6445-44ba-8545-24f1ab6d28b1','63d791fb-2105-4527-ad84-3e92c5b5de13',0),('6eb15bc4-6445-44ba-8545-24f1ab6d28b1','6cafd019-1d64-46d2-9db1-7ff694aaeaa7',1),('6eb15bc4-6445-44ba-8545-24f1ab6d28b1','8ea2b5e0-2d98-4237-835f-56a1b4aa0f0f',1),('6eb15bc4-6445-44ba-8545-24f1ab6d28b1','bd5348cd-6f57-4558-8e9f-2c5a184afb7e',1),('6eb15bc4-6445-44ba-8545-24f1ab6d28b1','d0221152-f017-47bc-a3a8-f1ea9687703c',0),('6eb15bc4-6445-44ba-8545-24f1ab6d28b1','d716c6b2-a331-476d-9631-384ab3810e75',0),('6eb15bc4-6445-44ba-8545-24f1ab6d28b1','ea55f021-67f6-4b61-8257-df177680597b',1),('6eb15bc4-6445-44ba-8545-24f1ab6d28b1','ecfe4f7e-8dda-45c6-9b8a-748a832d1970',1),('7ad9bf4d-fbfc-4678-b78c-e6a999956eed','16d688f2-fdf3-441b-afff-0d1cc9a9891f',1),('7ad9bf4d-fbfc-4678-b78c-e6a999956eed','6d3fd4e4-d5de-457c-b30e-25aa2ef73f19',1),('7ad9bf4d-fbfc-4678-b78c-e6a999956eed','9708eecb-fdb4-4537-9bb0-383d1bcf11cc',0),('7ad9bf4d-fbfc-4678-b78c-e6a999956eed','a3b0ccee-b5de-496a-bb76-745511b8c384',1),('7ad9bf4d-fbfc-4678-b78c-e6a999956eed','bcf63c89-ff10-4bbd-bfea-33fda400b9b0',0),('7ad9bf4d-fbfc-4678-b78c-e6a999956eed','c16fac63-0d2d-496c-abff-19d793d6029e',0),('7ad9bf4d-fbfc-4678-b78c-e6a999956eed','c8991e6c-534e-4252-b718-7f8f3b40e179',1),('7ad9bf4d-fbfc-4678-b78c-e6a999956eed','e5151208-a184-4dd0-b90b-c59412572378',1),('7ad9bf4d-fbfc-4678-b78c-e6a999956eed','f4cfa3de-5764-456b-bbf4-5579fb3ed3f6',0),('81c8e247-5382-4490-84b5-5ba89e5ee945','0ae304fd-6ae9-435a-973e-5a13dec0300c',0),('81c8e247-5382-4490-84b5-5ba89e5ee945','63d791fb-2105-4527-ad84-3e92c5b5de13',0),('81c8e247-5382-4490-84b5-5ba89e5ee945','6cafd019-1d64-46d2-9db1-7ff694aaeaa7',1),('81c8e247-5382-4490-84b5-5ba89e5ee945','8ea2b5e0-2d98-4237-835f-56a1b4aa0f0f',1),('81c8e247-5382-4490-84b5-5ba89e5ee945','bd5348cd-6f57-4558-8e9f-2c5a184afb7e',1),('81c8e247-5382-4490-84b5-5ba89e5ee945','d0221152-f017-47bc-a3a8-f1ea9687703c',0),('81c8e247-5382-4490-84b5-5ba89e5ee945','d716c6b2-a331-476d-9631-384ab3810e75',0),('81c8e247-5382-4490-84b5-5ba89e5ee945','ea55f021-67f6-4b61-8257-df177680597b',1),('81c8e247-5382-4490-84b5-5ba89e5ee945','ecfe4f7e-8dda-45c6-9b8a-748a832d1970',1),('84b3ca6a-731b-4fec-8712-3ff24d54cad8','0d037f7d-a8b3-4f39-8d03-867fe8241bd5',0),('84b3ca6a-731b-4fec-8712-3ff24d54cad8','0d76c208-71e4-4d15-9c15-ec03c772d5c9',1),('84b3ca6a-731b-4fec-8712-3ff24d54cad8','26b9dc88-6c81-4317-b8fa-27c11de60a69',0),('84b3ca6a-731b-4fec-8712-3ff24d54cad8','2806fa62-de59-4c71-b18a-21eb92067482',0),('84b3ca6a-731b-4fec-8712-3ff24d54cad8','487211fb-eb4c-4b9a-a650-fb3eea171a09',1),('84b3ca6a-731b-4fec-8712-3ff24d54cad8','53ad7090-9e64-48ca-8d5b-a8103dda2d37',1),('84b3ca6a-731b-4fec-8712-3ff24d54cad8','998b2464-1918-4790-b89e-c2bdb51c1d9a',0),('84b3ca6a-731b-4fec-8712-3ff24d54cad8','bc9f9b18-0f32-41f0-adff-abadc522ea0f',1),('84b3ca6a-731b-4fec-8712-3ff24d54cad8','ff4960ec-81e4-4316-8e49-cbce998b1b72',1),('85e2c2c2-bc16-44b4-b252-c4b8ddc9c21c','16d688f2-fdf3-441b-afff-0d1cc9a9891f',1),('85e2c2c2-bc16-44b4-b252-c4b8ddc9c21c','6d3fd4e4-d5de-457c-b30e-25aa2ef73f19',1),('85e2c2c2-bc16-44b4-b252-c4b8ddc9c21c','9708eecb-fdb4-4537-9bb0-383d1bcf11cc',0),('85e2c2c2-bc16-44b4-b252-c4b8ddc9c21c','a3b0ccee-b5de-496a-bb76-745511b8c384',1),('85e2c2c2-bc16-44b4-b252-c4b8ddc9c21c','bcf63c89-ff10-4bbd-bfea-33fda400b9b0',0),('85e2c2c2-bc16-44b4-b252-c4b8ddc9c21c','c16fac63-0d2d-496c-abff-19d793d6029e',0),('85e2c2c2-bc16-44b4-b252-c4b8ddc9c21c','c8991e6c-534e-4252-b718-7f8f3b40e179',1),('85e2c2c2-bc16-44b4-b252-c4b8ddc9c21c','e5151208-a184-4dd0-b90b-c59412572378',1),('85e2c2c2-bc16-44b4-b252-c4b8ddc9c21c','f4cfa3de-5764-456b-bbf4-5579fb3ed3f6',0),('8c43155a-9bd4-449f-8bda-7644869a8c6c','16d688f2-fdf3-441b-afff-0d1cc9a9891f',1),('8c43155a-9bd4-449f-8bda-7644869a8c6c','6d3fd4e4-d5de-457c-b30e-25aa2ef73f19',1),('8c43155a-9bd4-449f-8bda-7644869a8c6c','9708eecb-fdb4-4537-9bb0-383d1bcf11cc',0),('8c43155a-9bd4-449f-8bda-7644869a8c6c','a3b0ccee-b5de-496a-bb76-745511b8c384',1),('8c43155a-9bd4-449f-8bda-7644869a8c6c','bcf63c89-ff10-4bbd-bfea-33fda400b9b0',0),('8c43155a-9bd4-449f-8bda-7644869a8c6c','c16fac63-0d2d-496c-abff-19d793d6029e',0),('8c43155a-9bd4-449f-8bda-7644869a8c6c','c8991e6c-534e-4252-b718-7f8f3b40e179',1),('8c43155a-9bd4-449f-8bda-7644869a8c6c','e5151208-a184-4dd0-b90b-c59412572378',1),('8c43155a-9bd4-449f-8bda-7644869a8c6c','f4cfa3de-5764-456b-bbf4-5579fb3ed3f6',0),('9b324760-588a-47ee-b552-8f71b234e2c9','0d037f7d-a8b3-4f39-8d03-867fe8241bd5',0),('9b324760-588a-47ee-b552-8f71b234e2c9','0d76c208-71e4-4d15-9c15-ec03c772d5c9',1),('9b324760-588a-47ee-b552-8f71b234e2c9','26b9dc88-6c81-4317-b8fa-27c11de60a69',0),('9b324760-588a-47ee-b552-8f71b234e2c9','2806fa62-de59-4c71-b18a-21eb92067482',0),('9b324760-588a-47ee-b552-8f71b234e2c9','487211fb-eb4c-4b9a-a650-fb3eea171a09',1),('9b324760-588a-47ee-b552-8f71b234e2c9','53ad7090-9e64-48ca-8d5b-a8103dda2d37',1),('9b324760-588a-47ee-b552-8f71b234e2c9','998b2464-1918-4790-b89e-c2bdb51c1d9a',0),('9b324760-588a-47ee-b552-8f71b234e2c9','bc9f9b18-0f32-41f0-adff-abadc522ea0f',1),('9b324760-588a-47ee-b552-8f71b234e2c9','ff4960ec-81e4-4316-8e49-cbce998b1b72',1),('b3620883-7210-478f-a415-54d4b7d5b175','0ae304fd-6ae9-435a-973e-5a13dec0300c',0),('b3620883-7210-478f-a415-54d4b7d5b175','63d791fb-2105-4527-ad84-3e92c5b5de13',0),('b3620883-7210-478f-a415-54d4b7d5b175','6cafd019-1d64-46d2-9db1-7ff694aaeaa7',1),('b3620883-7210-478f-a415-54d4b7d5b175','8ea2b5e0-2d98-4237-835f-56a1b4aa0f0f',1),('b3620883-7210-478f-a415-54d4b7d5b175','bd5348cd-6f57-4558-8e9f-2c5a184afb7e',1),('b3620883-7210-478f-a415-54d4b7d5b175','d0221152-f017-47bc-a3a8-f1ea9687703c',0),('b3620883-7210-478f-a415-54d4b7d5b175','d716c6b2-a331-476d-9631-384ab3810e75',0),('b3620883-7210-478f-a415-54d4b7d5b175','ea55f021-67f6-4b61-8257-df177680597b',1),('b3620883-7210-478f-a415-54d4b7d5b175','ecfe4f7e-8dda-45c6-9b8a-748a832d1970',1),('cd3fcf55-42f5-4955-b13b-76a184f21ad9','0d037f7d-a8b3-4f39-8d03-867fe8241bd5',0),('cd3fcf55-42f5-4955-b13b-76a184f21ad9','0d76c208-71e4-4d15-9c15-ec03c772d5c9',1),('cd3fcf55-42f5-4955-b13b-76a184f21ad9','26b9dc88-6c81-4317-b8fa-27c11de60a69',0),('cd3fcf55-42f5-4955-b13b-76a184f21ad9','2806fa62-de59-4c71-b18a-21eb92067482',0),('cd3fcf55-42f5-4955-b13b-76a184f21ad9','487211fb-eb4c-4b9a-a650-fb3eea171a09',1),('cd3fcf55-42f5-4955-b13b-76a184f21ad9','53ad7090-9e64-48ca-8d5b-a8103dda2d37',1),('cd3fcf55-42f5-4955-b13b-76a184f21ad9','998b2464-1918-4790-b89e-c2bdb51c1d9a',0),('cd3fcf55-42f5-4955-b13b-76a184f21ad9','bc9f9b18-0f32-41f0-adff-abadc522ea0f',1),('cd3fcf55-42f5-4955-b13b-76a184f21ad9','ff4960ec-81e4-4316-8e49-cbce998b1b72',1),('d1cd5eb6-31a5-47e7-a091-067e2cde7532','16d688f2-fdf3-441b-afff-0d1cc9a9891f',1),('d1cd5eb6-31a5-47e7-a091-067e2cde7532','6d3fd4e4-d5de-457c-b30e-25aa2ef73f19',1),('d1cd5eb6-31a5-47e7-a091-067e2cde7532','9708eecb-fdb4-4537-9bb0-383d1bcf11cc',0),('d1cd5eb6-31a5-47e7-a091-067e2cde7532','a3b0ccee-b5de-496a-bb76-745511b8c384',1),('d1cd5eb6-31a5-47e7-a091-067e2cde7532','bcf63c89-ff10-4bbd-bfea-33fda400b9b0',0),('d1cd5eb6-31a5-47e7-a091-067e2cde7532','c16fac63-0d2d-496c-abff-19d793d6029e',0),('d1cd5eb6-31a5-47e7-a091-067e2cde7532','c8991e6c-534e-4252-b718-7f8f3b40e179',1),('d1cd5eb6-31a5-47e7-a091-067e2cde7532','e5151208-a184-4dd0-b90b-c59412572378',1),('d1cd5eb6-31a5-47e7-a091-067e2cde7532','f4cfa3de-5764-456b-bbf4-5579fb3ed3f6',0),('d988d29a-bfa8-4def-a104-2b3879d2a442','0d037f7d-a8b3-4f39-8d03-867fe8241bd5',0),('d988d29a-bfa8-4def-a104-2b3879d2a442','0d76c208-71e4-4d15-9c15-ec03c772d5c9',1),('d988d29a-bfa8-4def-a104-2b3879d2a442','26b9dc88-6c81-4317-b8fa-27c11de60a69',0),('d988d29a-bfa8-4def-a104-2b3879d2a442','2806fa62-de59-4c71-b18a-21eb92067482',0),('d988d29a-bfa8-4def-a104-2b3879d2a442','487211fb-eb4c-4b9a-a650-fb3eea171a09',1),('d988d29a-bfa8-4def-a104-2b3879d2a442','53ad7090-9e64-48ca-8d5b-a8103dda2d37',1),('d988d29a-bfa8-4def-a104-2b3879d2a442','998b2464-1918-4790-b89e-c2bdb51c1d9a',0),('d988d29a-bfa8-4def-a104-2b3879d2a442','bc9f9b18-0f32-41f0-adff-abadc522ea0f',1),('d988d29a-bfa8-4def-a104-2b3879d2a442','ff4960ec-81e4-4316-8e49-cbce998b1b72',1),('f99210e7-f0a1-4361-b206-599469e91e2e','0d037f7d-a8b3-4f39-8d03-867fe8241bd5',0),('f99210e7-f0a1-4361-b206-599469e91e2e','0d76c208-71e4-4d15-9c15-ec03c772d5c9',1),('f99210e7-f0a1-4361-b206-599469e91e2e','26b9dc88-6c81-4317-b8fa-27c11de60a69',0),('f99210e7-f0a1-4361-b206-599469e91e2e','2806fa62-de59-4c71-b18a-21eb92067482',0),('f99210e7-f0a1-4361-b206-599469e91e2e','487211fb-eb4c-4b9a-a650-fb3eea171a09',1),('f99210e7-f0a1-4361-b206-599469e91e2e','53ad7090-9e64-48ca-8d5b-a8103dda2d37',1),('f99210e7-f0a1-4361-b206-599469e91e2e','998b2464-1918-4790-b89e-c2bdb51c1d9a',0),('f99210e7-f0a1-4361-b206-599469e91e2e','bc9f9b18-0f32-41f0-adff-abadc522ea0f',1),('f99210e7-f0a1-4361-b206-599469e91e2e','ff4960ec-81e4-4316-8e49-cbce998b1b72',1);
/*!40000 ALTER TABLE `client_scope_client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_scope_role_mapping`
--

DROP TABLE IF EXISTS `client_scope_role_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_scope_role_mapping` (
  `SCOPE_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ROLE_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`ROLE_ID`),
  KEY `IDX_CLSCOPE_ROLE` (`SCOPE_ID`),
  KEY `IDX_ROLE_CLSCOPE` (`ROLE_ID`),
  CONSTRAINT `FK_CL_SCOPE_RM_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `client_scope` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_scope_role_mapping`
--

LOCK TABLES `client_scope_role_mapping` WRITE;
/*!40000 ALTER TABLE `client_scope_role_mapping` DISABLE KEYS */;
INSERT INTO `client_scope_role_mapping` VALUES ('0ae304fd-6ae9-435a-973e-5a13dec0300c','d4ee839c-f4d5-4d8a-85a3-e78f53dce3e4'),('2806fa62-de59-4c71-b18a-21eb92067482','14deb92a-5bec-459d-bb04-a93ccde8225e'),('bcf63c89-ff10-4bbd-bfea-33fda400b9b0','c089a6ca-a05d-487a-87f3-08f22baafd87');
/*!40000 ALTER TABLE `client_scope_role_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_session`
--

DROP TABLE IF EXISTS `client_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_session` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CLIENT_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REDIRECT_URI` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `STATE` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TIMESTAMP` int DEFAULT NULL,
  `SESSION_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AUTH_METHOD` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AUTH_USER_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CURRENT_ACTION` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_CLIENT_SESSION_SESSION` (`SESSION_ID`),
  CONSTRAINT `FK_B4AO2VCVAT6UKAU74WBWTFQO1` FOREIGN KEY (`SESSION_ID`) REFERENCES `user_session` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_session`
--

LOCK TABLES `client_session` WRITE;
/*!40000 ALTER TABLE `client_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `client_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_session_auth_status`
--

DROP TABLE IF EXISTS `client_session_auth_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_session_auth_status` (
  `AUTHENTICATOR` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `STATUS` int DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`AUTHENTICATOR`),
  CONSTRAINT `AUTH_STATUS_CONSTRAINT` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `client_session` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_session_auth_status`
--

LOCK TABLES `client_session_auth_status` WRITE;
/*!40000 ALTER TABLE `client_session_auth_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `client_session_auth_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_session_note`
--

DROP TABLE IF EXISTS `client_session_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_session_note` (
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`NAME`),
  CONSTRAINT `FK5EDFB00FF51C2736` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `client_session` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_session_note`
--

LOCK TABLES `client_session_note` WRITE;
/*!40000 ALTER TABLE `client_session_note` DISABLE KEYS */;
/*!40000 ALTER TABLE `client_session_note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_session_prot_mapper`
--

DROP TABLE IF EXISTS `client_session_prot_mapper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_session_prot_mapper` (
  `PROTOCOL_MAPPER_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CLIENT_SESSION` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`PROTOCOL_MAPPER_ID`),
  CONSTRAINT `FK_33A8SGQW18I532811V7O2DK89` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `client_session` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_session_prot_mapper`
--

LOCK TABLES `client_session_prot_mapper` WRITE;
/*!40000 ALTER TABLE `client_session_prot_mapper` DISABLE KEYS */;
/*!40000 ALTER TABLE `client_session_prot_mapper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_session_role`
--

DROP TABLE IF EXISTS `client_session_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_session_role` (
  `ROLE_ID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CLIENT_SESSION` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`ROLE_ID`),
  CONSTRAINT `FK_11B7SGQW18I532811V7O2DV76` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `client_session` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_session_role`
--

LOCK TABLES `client_session_role` WRITE;
/*!40000 ALTER TABLE `client_session_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `client_session_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_user_session_note`
--

DROP TABLE IF EXISTS `client_user_session_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_user_session_note` (
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` text COLLATE utf8mb4_unicode_ci,
  `CLIENT_SESSION` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`NAME`),
  CONSTRAINT `FK_CL_USR_SES_NOTE` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `client_session` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_user_session_note`
--

LOCK TABLES `client_user_session_note` WRITE;
/*!40000 ALTER TABLE `client_user_session_note` DISABLE KEYS */;
/*!40000 ALTER TABLE `client_user_session_note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `component`
--

DROP TABLE IF EXISTS `component`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `component` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PARENT_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PROVIDER_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PROVIDER_TYPE` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SUB_TYPE` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_COMPONENT_REALM` (`REALM_ID`),
  KEY `IDX_COMPONENT_PROVIDER_TYPE` (`PROVIDER_TYPE`),
  CONSTRAINT `FK_COMPONENT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `component`
--

LOCK TABLES `component` WRITE;
/*!40000 ALTER TABLE `component` DISABLE KEYS */;
INSERT INTO `component` VALUES ('00d40ecb-a606-43ee-adb0-d6f2aff891f5','Trusted Hosts','e5a722b4-3b15-40ad-bf03-242dffaa63c2','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','e5a722b4-3b15-40ad-bf03-242dffaa63c2','anonymous'),('048ecb43-5ab1-4eed-a3bd-bd8622ee6e34','hmac-generated-hs512','463f633d-c02e-4537-931f-fc87ef88ecdb','hmac-generated','org.keycloak.keys.KeyProvider','463f633d-c02e-4537-931f-fc87ef88ecdb',NULL),('0a762aac-3856-42b7-a449-e66204e65a8c','Allowed Client Scopes','0245a4ff-801f-41e9-9805-a700847ddf88','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','0245a4ff-801f-41e9-9805-a700847ddf88','anonymous'),('0aaf8b0d-d6fd-4b1b-b3d5-bc0915021fcb','Full Scope Disabled','e5a722b4-3b15-40ad-bf03-242dffaa63c2','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','e5a722b4-3b15-40ad-bf03-242dffaa63c2','anonymous'),('1ae68de3-9794-42af-ae7f-2c68ef676f09','Allowed Protocol Mapper Types','e5a722b4-3b15-40ad-bf03-242dffaa63c2','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','e5a722b4-3b15-40ad-bf03-242dffaa63c2','anonymous'),('27087a93-ab7d-4318-806a-d1e76a6acf66','Max Clients Limit','463f633d-c02e-4537-931f-fc87ef88ecdb','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','463f633d-c02e-4537-931f-fc87ef88ecdb','anonymous'),('2a6aed2a-26ac-417a-ac30-b53049dacca7','Allowed Protocol Mapper Types','463f633d-c02e-4537-931f-fc87ef88ecdb','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','463f633d-c02e-4537-931f-fc87ef88ecdb','authenticated'),('2bf33dd9-ca86-436f-a159-8a33ab82390d','hmac-generated-hs512','e5a722b4-3b15-40ad-bf03-242dffaa63c2','hmac-generated','org.keycloak.keys.KeyProvider','e5a722b4-3b15-40ad-bf03-242dffaa63c2',NULL),('2ec554d6-1163-4ca6-828c-549e6297e814','Max Clients Limit','0245a4ff-801f-41e9-9805-a700847ddf88','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','0245a4ff-801f-41e9-9805-a700847ddf88','anonymous'),('32a1a177-798d-4bb0-bc78-2e6bf800547e','rsa-enc-generated','e5a722b4-3b15-40ad-bf03-242dffaa63c2','rsa-enc-generated','org.keycloak.keys.KeyProvider','e5a722b4-3b15-40ad-bf03-242dffaa63c2',NULL),('4c75b5c7-af55-4bd0-9726-7cf93acd9ca4','Allowed Protocol Mapper Types','e5a722b4-3b15-40ad-bf03-242dffaa63c2','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','e5a722b4-3b15-40ad-bf03-242dffaa63c2','authenticated'),('58cef41d-abac-4e1e-8c41-ec8c429d33e0','Allowed Client Scopes','e5a722b4-3b15-40ad-bf03-242dffaa63c2','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','e5a722b4-3b15-40ad-bf03-242dffaa63c2','authenticated'),('5fe7105d-cac1-42cb-ab2e-f69fe31d46fe','Consent Required','0245a4ff-801f-41e9-9805-a700847ddf88','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','0245a4ff-801f-41e9-9805-a700847ddf88','anonymous'),('608498c1-ba6c-47f0-82c3-18e3cff6345c','rsa-enc-generated','463f633d-c02e-4537-931f-fc87ef88ecdb','rsa-enc-generated','org.keycloak.keys.KeyProvider','463f633d-c02e-4537-931f-fc87ef88ecdb',NULL),('6551d367-e67d-4aff-983d-fe2d01075565','Max Clients Limit','e5a722b4-3b15-40ad-bf03-242dffaa63c2','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','e5a722b4-3b15-40ad-bf03-242dffaa63c2','anonymous'),('7bbedd26-e609-4fbf-8f56-bca00f6fb1e8','Consent Required','463f633d-c02e-4537-931f-fc87ef88ecdb','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','463f633d-c02e-4537-931f-fc87ef88ecdb','anonymous'),('84c729b8-3fd3-4d1f-82dc-edb8236937be','Full Scope Disabled','463f633d-c02e-4537-931f-fc87ef88ecdb','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','463f633d-c02e-4537-931f-fc87ef88ecdb','anonymous'),('8b1a7d05-3df5-479c-accb-b4ec62eb76f7','aes-generated','e5a722b4-3b15-40ad-bf03-242dffaa63c2','aes-generated','org.keycloak.keys.KeyProvider','e5a722b4-3b15-40ad-bf03-242dffaa63c2',NULL),('8bf68765-115f-4bfe-abbf-518ff62fa05f','rsa-generated','e5a722b4-3b15-40ad-bf03-242dffaa63c2','rsa-generated','org.keycloak.keys.KeyProvider','e5a722b4-3b15-40ad-bf03-242dffaa63c2',NULL),('8f343740-d56e-4342-ac46-f36694737987','rsa-generated','463f633d-c02e-4537-931f-fc87ef88ecdb','rsa-generated','org.keycloak.keys.KeyProvider','463f633d-c02e-4537-931f-fc87ef88ecdb',NULL),('933fdb98-7049-4894-bf08-894d3924b9bb','Full Scope Disabled','0245a4ff-801f-41e9-9805-a700847ddf88','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','0245a4ff-801f-41e9-9805-a700847ddf88','anonymous'),('9f039ff8-d49e-4209-ad44-7876a8878366','Allowed Protocol Mapper Types','0245a4ff-801f-41e9-9805-a700847ddf88','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','0245a4ff-801f-41e9-9805-a700847ddf88','authenticated'),('9f0bc6eb-8483-4c29-af8c-aa19db7acaae','Allowed Client Scopes','0245a4ff-801f-41e9-9805-a700847ddf88','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','0245a4ff-801f-41e9-9805-a700847ddf88','authenticated'),('acb1c3a4-abd6-496b-93bc-e33a444e689f','Trusted Hosts','463f633d-c02e-4537-931f-fc87ef88ecdb','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','463f633d-c02e-4537-931f-fc87ef88ecdb','anonymous'),('af158a27-04f5-4b36-beab-216921ac0370','Trusted Hosts','0245a4ff-801f-41e9-9805-a700847ddf88','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','0245a4ff-801f-41e9-9805-a700847ddf88','anonymous'),('af1c455b-9b97-4909-aa88-e71764cf70ed','rsa-enc-generated','0245a4ff-801f-41e9-9805-a700847ddf88','rsa-enc-generated','org.keycloak.keys.KeyProvider','0245a4ff-801f-41e9-9805-a700847ddf88',NULL),('b2f147f3-7ebd-4596-b23b-140fc7342875','Allowed Protocol Mapper Types','0245a4ff-801f-41e9-9805-a700847ddf88','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','0245a4ff-801f-41e9-9805-a700847ddf88','anonymous'),('bbc612b4-58c9-4f24-b365-6a7998ea6295','Consent Required','e5a722b4-3b15-40ad-bf03-242dffaa63c2','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','e5a722b4-3b15-40ad-bf03-242dffaa63c2','anonymous'),('c007f463-7efc-4984-af40-0863b078017d','aes-generated','463f633d-c02e-4537-931f-fc87ef88ecdb','aes-generated','org.keycloak.keys.KeyProvider','463f633d-c02e-4537-931f-fc87ef88ecdb',NULL),('c4171a57-65c1-4ebe-acbc-b6478e1d258b','Allowed Client Scopes','463f633d-c02e-4537-931f-fc87ef88ecdb','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','463f633d-c02e-4537-931f-fc87ef88ecdb','authenticated'),('cccc76eb-39e0-46e2-8d51-17779c0f41b7','aes-generated','0245a4ff-801f-41e9-9805-a700847ddf88','aes-generated','org.keycloak.keys.KeyProvider','0245a4ff-801f-41e9-9805-a700847ddf88',NULL),('d3544f03-1894-4659-8106-44e01147c48f','hmac-generated-hs512','0245a4ff-801f-41e9-9805-a700847ddf88','hmac-generated','org.keycloak.keys.KeyProvider','0245a4ff-801f-41e9-9805-a700847ddf88',NULL),('da712166-6ba4-4010-b87d-38d4b150b89c','Allowed Protocol Mapper Types','463f633d-c02e-4537-931f-fc87ef88ecdb','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','463f633d-c02e-4537-931f-fc87ef88ecdb','anonymous'),('dd62fb03-314e-4ca6-8adb-1ea1d627e0e3','Allowed Client Scopes','e5a722b4-3b15-40ad-bf03-242dffaa63c2','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','e5a722b4-3b15-40ad-bf03-242dffaa63c2','anonymous'),('e8fb792a-250b-4885-9263-6c382813a8d0',NULL,'463f633d-c02e-4537-931f-fc87ef88ecdb','declarative-user-profile','org.keycloak.userprofile.UserProfileProvider','463f633d-c02e-4537-931f-fc87ef88ecdb',NULL),('ea2edbdd-76fe-4fc6-b9b9-4bf8505e4003','Allowed Client Scopes','463f633d-c02e-4537-931f-fc87ef88ecdb','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','463f633d-c02e-4537-931f-fc87ef88ecdb','anonymous'),('f3f3a151-3466-492c-8a09-10e995eebe6a','rsa-generated','0245a4ff-801f-41e9-9805-a700847ddf88','rsa-generated','org.keycloak.keys.KeyProvider','0245a4ff-801f-41e9-9805-a700847ddf88',NULL);
/*!40000 ALTER TABLE `component` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `component_config`
--

DROP TABLE IF EXISTS `component_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `component_config` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `COMPONENT_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  PRIMARY KEY (`ID`),
  KEY `IDX_COMPO_CONFIG_COMPO` (`COMPONENT_ID`),
  CONSTRAINT `FK_COMPONENT_CONFIG` FOREIGN KEY (`COMPONENT_ID`) REFERENCES `component` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `component_config`
--

LOCK TABLES `component_config` WRITE;
/*!40000 ALTER TABLE `component_config` DISABLE KEYS */;
INSERT INTO `component_config` VALUES ('00e6b1f3-0e82-45bc-b767-a181798e2a64','32a1a177-798d-4bb0-bc78-2e6bf800547e','certificate','MIICqTCCAZECBgGOWc4PVzANBgkqhkiG9w0BAQsFADAYMRYwFAYDVQQDDA1kZW1vLWtleWNsb2FrMB4XDTI0MDMyMDAyNTkyMFoXDTM0MDMyMDAzMDEwMFowGDEWMBQGA1UEAwwNZGVtby1rZXljbG9hazCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAOPjtRkOBCaYxFcJUSTy+CiOrzoNNQ4mDdJccLlHNx1+Kk6eYwW4OwJZwEDcFHhIgIQ9hpu4ADbZE6v+sVyYzLFTFSs1Xc2dCyXuIPZJBkKYIKGW+9kdjBgW2/yuRXZ+R2HQbm15JRBdWvP7KQ70FX6hvsqhnHcVRee9rZOSSXg1x2CIWE8ISEUst5AD8FnLfvA+SoUWKTeu6v1g/7xnTTsG2Fazh22VlMl7YVqh0STfJ/GJT8o1Kcplv2bJkzSiLHA+sJD2030wX1YI34lQOwcwVGuK2KMd/C2GTxJub7czyUskRFJRdE7GtlPX5E5Kz9W/Wmkja4LVoj/L1/pnqVECAwEAATANBgkqhkiG9w0BAQsFAAOCAQEABfv31eMYJh8AmMdGD5Rtr3npjKcJWXJz0vVoZD+ZPA7RIkBq7/JFNuyVUV0oCwAVUO+N6n/HUoq8z4LNYyBl+EfOk5VOHKhXCdxidW3rOdmWtSO7qT5NKlK9DLZxSkMjyw5ygfa6QVDsdXxyG+F764cio2OeCEMxUQkxHybb+mIgjTsHcm3RNMFmGZYdrZS6zZFrPbFFC1WxQHKDk6yfG+HOnKxyMtY2453ggRhMZQeVe5EmliCscl/tJPmkzrtiuJ9Ae2o45Y3ESjrXtshwMR5ejFcT4GieU23E8pz2DKw3bJPegcE22I1SS/AoyIiiGRnBCFKdV3DvW3rX0WmH3A=='),('032ed111-9ca0-4059-ac00-147f4dc3704c','1ae68de3-9794-42af-ae7f-2c68ef676f09','allowed-protocol-mapper-types','oidc-full-name-mapper'),('065c49e4-ada8-48f5-bd8a-9d5df860a3e2','acb1c3a4-abd6-496b-93bc-e33a444e689f','client-uris-must-match','true'),('0687f343-85b3-465e-ad95-51195d306ef9','048ecb43-5ab1-4eed-a3bd-bd8622ee6e34','algorithm','HS512'),('07527402-2542-4584-8021-35e651e76951','b2f147f3-7ebd-4596-b23b-140fc7342875','allowed-protocol-mapper-types','oidc-full-name-mapper'),('07641a8a-531d-49ec-9407-d3b303cd4a9c','2a6aed2a-26ac-417a-ac30-b53049dacca7','allowed-protocol-mapper-types','oidc-full-name-mapper'),('08bad705-58b3-4a03-9d87-5e5a14398089','8f343740-d56e-4342-ac46-f36694737987','keyUse','SIG'),('0a2da329-e76d-4a61-9601-395089768bc2','2bf33dd9-ca86-436f-a159-8a33ab82390d','kid','94ad9ea4-e5b0-43b2-83dd-1d1c6bc247b5'),('0b327bcb-4d0f-4c98-adcd-c00985594840','d3544f03-1894-4659-8106-44e01147c48f','secret','RRz_PBNrsmDvxDZsbrSc7LMXrshCBGuSxOiLiAMv1Fqus937mtOg68uBhJyFq80EfqK2kN0eFbeZ8bJku4TPaylfceok4punYvVtcGzHblClgdHpOgrn2R9PUDSv1JWQ8DcQqjCOCeHisXKf1xX19HIL3lTJm5a0mzYufhOgO2k'),('0d145d01-47c7-48fb-bb99-b9dcd978fe1e','b2f147f3-7ebd-4596-b23b-140fc7342875','allowed-protocol-mapper-types','oidc-address-mapper'),('11707fbc-3814-4c41-b569-03d5f6bebe5d','2bf33dd9-ca86-436f-a159-8a33ab82390d','priority','100'),('12cc4e08-ffef-4c18-a604-362e959e766f','32a1a177-798d-4bb0-bc78-2e6bf800547e','algorithm','RSA-OAEP'),('175e6f94-ed9b-45bd-a4a5-cf883e4267a5','58cef41d-abac-4e1e-8c41-ec8c429d33e0','allow-default-scopes','true'),('1f1585a8-fa4a-41be-9897-bb9655b74118','8bf68765-115f-4bfe-abbf-518ff62fa05f','privateKey','MIIEpAIBAAKCAQEAslFQCZTBTmWvw++ahmDeOumEvMy1XMjnF+sL0xDdIpxLqG395eL3JZP4RCB0RVCjo1obc4R2kuoGQFDyQGReGVQum3VWr8W8y2u7vl7PEZf5r3O0CpxH0Rfw9JSjsOnRR7R/b1EHZzcyBYcJHWzzFVLJs1SoN/cbTT+RCSKyQtpEGBvoT5R5dk1jtrYZzqYUDOiyNcpU7GqtJj6rFb0g55yHndRw2zpF6hocUht42OKZUWWepbhRaNvWt6Gg+A86Ung7dEldV2g2WRJAnxD23hH59wsFhJvuczID8oT5lZfCTeeyjsyaGqPE7CxC0gxVCAV+mPQfZHC/BI4ABqZ7RwIDAQABAoIBADRDieJtA6VfP399tDxLmwcIV5vgog2SYs1LWnlf+XiB99jjeCXPeqG8d2k8W+fPBU9FA0O94OUZi4CBWSePY1coKcrtvt0g5z92EZ5v+mANO6T1lCECAjiiPEDrafjZ5zmNiUZOqQ1TC6m8FOtXef3XeH/DwdQ5bHqdNXzIexgFlFcDOe+FHeBvK85GQY8s84MAlIozQRrQdZfG918+IuJeMkUGyWhG58xr4T/48F1dEsaUa0kzrZVPe8ll3MyHrtmMBBRfLWkMoIrhDn1m+oRRa0YR8eicnuyHqqPBei63WkaXksgAoyHJtdv0kjL2ZncsZVKJ+yQefZJZdUEedTECgYEA62xHKJ/a//rhA3QFqA4sDy4Ukljuot+88F9tHWz/5RlkGJtEDBys3s3ewKvfDwVPrGzj3Wj67WP5RFSP2rfZhbBig9sYlMPV170nP8ykMrFKrTXlmTca6lA045tTrD2mngWIA4nHNHfszbkyL57yyUZAwN0erL5UfPGZ9LtCjpECgYEAwedFQMQYRGzIU1BJ/6L56copx4E4tB77qFDdA1FN8PH/MneZH7bMXE3VjdsTpZ2vbk59nJ5X/5qLaLvSTMXPlfNItM0XQERhMKtX2aBk5BBCN68XXOby8EbbvSVCgjewaRYZGLtXaYjtoEnqD14WCrFsnRGtq3L1O5sPLx4biFcCgYEAkUxCntAKWfJ87aSt2QrmJnhKOgipP9zWv4Ql1ANx6/O/03AAj3kjOF/XGxL4mEyu37xU5lHkjJ8nOQT3xAW0Os6h/r86bJZxZLVZhAbJUIAblsus6OMZuYPHILK88ZEbRGwlhgmC6N8bR90FHF79eTviuyW9yN+vRW3XlzP74AECgYANifhr7UVEgdP6/UAteVO530PLilpLOV6ZAgxsjuDCUiNfgrpOXJUoXMbsgL9+cOQu74wVw3ihgEj7pyGn+qfj8HjDJw7Yje27WDtqFqj0w63b9X3MHtQXstrk+hUKwpiuvbxC3dHcrJLq/j45lHg1hu3uia12qzA0WT9WKuQBQQKBgQDZS9Zg4DLYK85oRL1TlbI4OPpom+dtDwAwAAU5Ah4rqikIdRd1Kzvi41msZbDgOznh+7GFKrfm6qmPcDhIMW/scBooPr8B2JCPzuOB0mUN7DDt9TwAuidOwSe4uYV4YwVnWx7tse/34akgqhTUOuZpE44wjTxYvXK144iS07R9WA=='),('21dc126a-ee0d-4c98-bad9-dd28370e5d5f','9f039ff8-d49e-4209-ad44-7876a8878366','allowed-protocol-mapper-types','saml-role-list-mapper'),('25ab20e1-a95e-4c2b-99cb-d0aebdb2624c','ea2edbdd-76fe-4fc6-b9b9-4bf8505e4003','allow-default-scopes','true'),('26dfa390-4e22-4c59-9566-b174e8b750aa','e8fb792a-250b-4885-9263-6c382813a8d0','kc.user.profile.config','{\"attributes\":[{\"name\":\"username\",\"displayName\":\"${username}\",\"validations\":{\"length\":{\"min\":3,\"max\":255},\"username-prohibited-characters\":{},\"up-username-not-idn-homograph\":{}},\"permissions\":{\"view\":[\"admin\",\"user\"],\"edit\":[\"admin\",\"user\"]},\"multivalued\":false},{\"name\":\"email\",\"displayName\":\"${email}\",\"validations\":{\"email\":{},\"length\":{\"max\":255}},\"permissions\":{\"view\":[\"admin\",\"user\"],\"edit\":[\"admin\",\"user\"]},\"multivalued\":false},{\"name\":\"firstName\",\"displayName\":\"${firstName}\",\"validations\":{\"length\":{\"max\":255},\"person-name-prohibited-characters\":{}},\"permissions\":{\"view\":[\"admin\",\"user\"],\"edit\":[\"admin\",\"user\"]},\"multivalued\":false},{\"name\":\"lastName\",\"displayName\":\"${lastName}\",\"validations\":{\"length\":{\"max\":255},\"person-name-prohibited-characters\":{}},\"permissions\":{\"view\":[\"admin\",\"user\"],\"edit\":[\"admin\",\"user\"]},\"multivalued\":false}],\"groups\":[{\"name\":\"user-metadata\",\"displayHeader\":\"User metadata\",\"displayDescription\":\"Attributes, which refer to user metadata\"}]}'),('292e3778-4927-4857-bd7b-49913adf61fd','608498c1-ba6c-47f0-82c3-18e3cff6345c','privateKey','MIIEowIBAAKCAQEA9nyJYXs/Xy0fdB2Z3o2UHTaCf5vkFpM7RU8whFbytx/LZmMc6KHxjDwzt+mbgNiFwWXYEibae25kLeO8I5NE+N/s1HLSiti7ZSdGLozjVCjznULyGpjME96r24icDGUtpNHCAUmzxZ943YVBfgXY2eVpYBJpgR2S0S/zaRimB/C/qypR3Y2Chm3mVMSCZ75w81L6jTagNpJZ9rNHE1fSbPHx6z/fzlstbX6e85StD6BtuPsonKVaBZceeiZoeUdAjbIF6vpy7aesO3YgSMifPWTgScMnj4Ania+kqyV14k8SDtVxv16wja8xAXUW/UsAWmTkdM2Jcbpmlm/KqWnsgwIDAQABAoIBACH8thds89C0hhvFYSF2NYV5rgYugVrjiPlbm/2uMjWHUCKZaV5icM4SFweK/K2ILZlR6Q3yXDnyKiTHEXrOTw+0wLvilp7H7RRblVUh3s63VDAhD6+/Kz9U0C8AkpPa96+Rr3CXWw8q7XLjcaO7kVUqSZy9AoiSgrC5gz9rQ1Q2BtAs0BLJsUBYDGczPIGBVMx4Lu9ZOSiZiPjzABT+PYBRw/h7DkmYctupqkodw4DnZ4Cc1JJJVg8xSy23WXgjXS2F/wS7UlY9NcBhA1jTGlSY/Jp+EOrLW8coojiFSTZph0gMfS+lSNEaOjRHszwEymmxUOv1W8F/rgrXp4U4mtECgYEA/ji3zv8GdbOWduSUrH7JiGMyFZeXTgvg11lLq7k5tu7Gg0cAKSheKXZt96ODOGXMx6UgAvbCiRyzbk7ze/Y1GXmbi3uUlP2DAejlQhHeDusS10+473O8ZIdyWlNUq0gXNSFohISa0tcqBAe8SIdgpIUl6InAANROFevidi6KGG8CgYEA+DX3SrHUuiiQ7nfO4hIJ01c8IEGFUcZyFY2iuoh0a9/xyKoOOq5VgKW+9DkLbEcoy1bV2CVZsZnBpSEso5a1KIuaYbsCBiipvIpQjM0t+Rc+1Ow3G+zOZbJ42witohm3M4NPu09bPkj9T3dCjlTm6MQCwg2WY8z5pvXloXjs7y0CgYBtmkhs3viLAE1LnwsWP2dl/NZYBs494NMkJSSBuc7PNqyxZogENpo6KAwLKxzk0Mb0ABYIERkYAh693R4OgLyt6gcMoNATWCUGSsGktY1WQzURTRa/bdd4RAkiNjEX03Hl/yxPjdguNIOxzx/26R7ab2lDkzgLY3zy6IrvRutU0wKBgQCIO/6eZdrvzoI2EVZhKStxb2kV/0BwsO4/PD08CtdzujgYPpaOyM8vTEnx/Dlz1d7jNKcs+tsvKshpnTrGE1sdhPpYd+9VeA4p6PTrQ1bfaE3ZSkm5LxHeKcZB2pKK7XhrcsBZe+YF2sQGUNwcCSewTJ2C6zhHUOMaK889AIVzhQKBgEzqYWaBq5dkUuVPHFgI4YhFTk/8x8jo5aA6/55vQeK9G82Ie4Kw5mYlq3MRDpP7kGk/OJKiO1tV8A5GyiRkuSMsgdfTyGnyLora6axrT5L6Bg+a4OnH/ShIW0MstWosccknhqklXE/fpgDxqqn+SC7GcIB9LGhShmpPffy0t9Le'),('2a691707-0b3e-4f6c-b4ac-c1955ad806ec','2a6aed2a-26ac-417a-ac30-b53049dacca7','allowed-protocol-mapper-types','oidc-address-mapper'),('2a82bc46-63e2-4a97-8039-449744e11cd7','048ecb43-5ab1-4eed-a3bd-bd8622ee6e34','priority','100'),('2b64145b-853a-4a19-b91d-f26ea6d982d2','b2f147f3-7ebd-4596-b23b-140fc7342875','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('3139857b-09ee-47b3-b693-50c831001101','048ecb43-5ab1-4eed-a3bd-bd8622ee6e34','kid','f46dd5cc-1151-4ce7-9150-0dea1bef5b6f'),('328a51c2-7780-480e-b0fc-b111af904453','9f039ff8-d49e-4209-ad44-7876a8878366','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('34d68936-fd29-44a7-afb5-9cba4389625d','af1c455b-9b97-4909-aa88-e71764cf70ed','algorithm','RSA-OAEP'),('36eeed9a-99eb-4cee-abed-8265ac25a037','1ae68de3-9794-42af-ae7f-2c68ef676f09','allowed-protocol-mapper-types','saml-user-property-mapper'),('379a8488-4760-41ba-9946-9993264340b7','608498c1-ba6c-47f0-82c3-18e3cff6345c','keyUse','ENC'),('37a53850-7dfa-4545-9c92-9de42faf12ae','8bf68765-115f-4bfe-abbf-518ff62fa05f','keyUse','SIG'),('37d2f2de-839c-4ef4-a2a2-88fc7c1451fe','f3f3a151-3466-492c-8a09-10e995eebe6a','certificate','MIICtTCCAZ0CBgGOc5iLyDANBgkqhkiG9w0BAQsFADAeMRwwGgYDVQQDDBNvdS1ncmFkdWF0aW9uLXJlYWxtMB4XDTI0MDMyNTAzMTEwMFoXDTM0MDMyNTAzMTI0MFowHjEcMBoGA1UEAwwTb3UtZ3JhZHVhdGlvbi1yZWFsbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBANJ/Jr2oziEzoIDU2eMZ5h+krrGaii6iXQtQRM/UxLRjGU/fhsBaUVKUWJ8QUUr24HhKOyJlNQCdbVYZjStXIvbtEui8Vf3lUZ+NmNZt+yxWy9XjRVdstrTd5ResvGb8LOiBCi2dTs3+IfgA06bvZ0MExuxduw9d5OMH3PvbxbQUvLGVT9pjvhsoh+k1DDF4/DJaclW6K+Jq5BvRrej21drE5ct8m3kv6AS+DnqJZvxz+sHdY1Ic4/6mol9QBVSN0IyGDqYXz0dpWLEFx/5pNYIMaRALdx+2VUoaAIIYqSmTMPTCPenqe1EpXSG/1MaY8xce5j9FKI+RHiyGF7p9z9UCAwEAATANBgkqhkiG9w0BAQsFAAOCAQEADEa95Qd7Jxw/xB2NM8s9QGQRyDcmLqQkUE//snAh10UQgUYgqhdlGXABLN+NnkXpYf7SBWpswDxcysEaXUP2iAt5fx/S2L8vy4VXy/k/v1YCTozKtqTYX9RScEnSqpRNqh4SxGO53EN/OWrox3NQBGkwNdoM9GOFrPaC7jyahBhksWcdiudAyx4JK2WRngr1mmM2HWPq6hA5YjOnl6nd0H4juopOGxWnEPi+IIjziRey73aDyrgNQaMK3vVzsIjD8+29y7yTtnDZyYLhRch2+kzch58zebAVusKPVzowBtCFTI6MiQUj9hAcZYvBkM4EhwwjyJG3ZeFey3TB8AFZLA=='),('3976886d-45e0-45cf-9213-1b10528f149a','da712166-6ba4-4010-b87d-38d4b150b89c','allowed-protocol-mapper-types','oidc-address-mapper'),('3c8ce20a-94a0-4e05-8a89-b7738e70be14','8f343740-d56e-4342-ac46-f36694737987','privateKey','MIIEpAIBAAKCAQEA08cEHr7uNNBd06Dm4+3TkAZgbZ6GzxR8TofY6hdRuxTK/AQqP8doXp4B1u24r2/y6JqrcsXaH3EMqWgQRewj5dBNxRVtKSb6GiiWeQv7nPQr0kfxqYiCkByg7JPOp6XoRQKVN+nRaSA61Fj9te+LqPGPqJMuocFAUB7k1IVfjeP9Mx44i20nB+9ww9FqtbQgNyCHAYG9X/1iT4JKbbe81iqs23dS1CIUP/HvuFVkje9366O7+kx5I2i39vUQE1CEokrDccR6vhH+AqKw2f1k9Sze57JZy/HueFVxSEKuxrAyaJdMXFW/QPp2jyNLgXfuOCQJftv5bNRnGj+6jZdKGQIDAQABAoIBAC+lSFOEgEIomNtqiVfBY4Y1MQ+oiUrgoIDohlBQU8aDzJE7fKfhvKUA5ogM7q6lwKA9YBJP2h2VyRP6AiNBF+h133FWOzt1dfJZrFTqcb7jnlJOdlu+hyVWE4x2SpmkNWgFRz4PoFoG8sVgiiAbFzA4vKngBy9EM6xy7uezZAafWkuPjaxHVasbltA/igfjOEjDHc0Yul2iWHKOnMpkfPNd4SIcRRzuVaoQ5dTdy1MOjmsfkN7ytBFXpRkfTV9QC5dt9ITwyp9VX4WlpGrWWJfjftTmIuGrsn076vnf9tiWkMvKoFo9uH9Bh2V794Fakkrtr376OPMgQo6A1q+k4fsCgYEA6kNKmWnrnUFqX71rG6GgYzW3jtAZwkS4R/Ts39wTqaZx5z/yM+5oW6NUjYzHImEWuTXPjjBeN5FigFOhQTqAdZXaSJMdKz40tCkCAnzmk1/h+0gL8HmMH8EOFsUngWeeWOkZx1ce0Ry63w5M5Iry91qThcnwwfo46rUWgMWrQCcCgYEA522aQI1VySzgGVXytIUBq3PSQ0Fy0wlW7sag/bBtpYK3jnktyK5MAaYBuzVqVRXenSeAMm7YoYgZFSbQiiRSwYagYjv60peXGENB99MHAuxNfVxjfeiJqHe+G9ibvfS1i1xpMcUaRPrmPgIuXneZT33skAXDWFfotfJsY44hS78CgYBwGpeeZsOr01wWSMzywhvAnjojC47oGn6dYKXiUqzOKKqlYUKEe3hRMg4KVu4Mk62OICQdBSRxLw+WHW8zic1jd7ynsk7pHLGX7W/axO6KY/3+g/HCuEfIAli9qMdI888g+Ruu+w/yPe9nQq6lR6ERobSq94JRMW7/Un1cTjuvTQKBgQCEvXLaT7bCuwCWx5t8O0Xn53jUpreLoDHCpx80I3vgkQdjqtG952slDuizTkH9J5wWG9AGHVoX3I42eZrngUoOQn+/mJOXMuexPPKbiOjenlcb7mAKmdRLUtMx+Z3q6G8wzgJwT5NvuVFSg8HA4WyIEbwcJ5ISG+oYYkIVIDKs1QKBgQDFApzuarN6h77cU/sZahwtwiiEYhvC3hg6P6Wm6Fle5lC9J5lxss+c/beoVfLt4b6laLcV+1aaPa5XE/f0gaSxTIxd9lZ3ljk8I8miVfHD3ewM1qQRbJTm4aR7ThUV0eIjMmyMvgVIzAKZ9y3cf5OwtzuNeHO8WnFF+ofzeAhGVA=='),('3d59c6f5-d5f2-4de5-92fb-c8067376303f','6551d367-e67d-4aff-983d-fe2d01075565','max-clients','200'),('3f36c894-67e8-44b1-9d92-8267197b31fa','4c75b5c7-af55-4bd0-9726-7cf93acd9ca4','allowed-protocol-mapper-types','saml-user-property-mapper'),('42250213-2927-4c30-9213-9ba0bad80313','2a6aed2a-26ac-417a-ac30-b53049dacca7','allowed-protocol-mapper-types','saml-user-property-mapper'),('480ab539-d3d9-4cc9-aa7b-99f0519666dd','af1c455b-9b97-4909-aa88-e71764cf70ed','priority','100'),('4c4bbbf4-3fac-43b4-8c4d-f42cffd2024e','d3544f03-1894-4659-8106-44e01147c48f','kid','75f0e970-ae2a-42d1-9349-a492fc9952aa'),('4cbf2dbb-6aab-476f-b7b7-219e7af1a26d','4c75b5c7-af55-4bd0-9726-7cf93acd9ca4','allowed-protocol-mapper-types','saml-role-list-mapper'),('4d6a25db-1b7c-4307-8632-cf33998dc82f','da712166-6ba4-4010-b87d-38d4b150b89c','allowed-protocol-mapper-types','saml-role-list-mapper'),('5053884e-a669-4238-b321-fdaa32de8a80','f3f3a151-3466-492c-8a09-10e995eebe6a','privateKey','MIIEogIBAAKCAQEA0n8mvajOITOggNTZ4xnmH6SusZqKLqJdC1BEz9TEtGMZT9+GwFpRUpRYnxBRSvbgeEo7ImU1AJ1tVhmNK1ci9u0S6LxV/eVRn42Y1m37LFbL1eNFV2y2tN3lF6y8Zvws6IEKLZ1Ozf4h+ADTpu9nQwTG7F27D13k4wfc+9vFtBS8sZVP2mO+GyiH6TUMMXj8MlpyVbor4mrkG9Gt6PbV2sTly3ybeS/oBL4Oeolm/HP6wd1jUhzj/qaiX1AFVI3QjIYOphfPR2lYsQXH/mk1ggxpEAt3H7ZVShoAghipKZMw9MI96ep7USldIb/UxpjzFx7mP0Uoj5EeLIYXun3P1QIDAQABAoIBABVQl09us7rEc8z/4LVgpr8PCbqFw9bPjZzq6qDh8m4yt7oxD//T1XbHe0bWG+k7oQTFPYIw3eJbTppAmZ0pJGr9HCRRh+KfEToXGEIkXmIBwv+8VQXyhfjAHGXekbBa+kAr6uguDPAKew2WJdh6VwpABlWicyHt99KudefR/A3NOYrVHE3LqH8AwdMZVxDN5xAVgjAPQONdsHjGV8+qcisWS+q6mZI4T/umzxg9DKSiM2cWArzlVCTjGPPkbYbfXOWvap1GzlAp8eu5USJetbxSBeKASvxwbQvCH8UbyJpMOae7+JoCHryIW5dTmJCuimDDyKuKZvnKpy6eaJDYTmECgYEA/wE1MByNSuiXJ3DuwXjRnrqtWao6/xJiSZZ6feKJI3HoCMQCZJnB3NUL0YK6N6581O9Ew60PNt/kXaWV9KXxVRWG/PmAbWugi6s4wUE6TeVgh307D3exVGs/09h+5PSkcEcQae/p/6x+l3HOU/452EtiO/G6DXZjfiNcALY6n+ECgYEA01F4/ZiEUfBVL4W9qypWpmLj/TrnxCk1bO9ftabsdsx8k9l8CP5aXyrrvF+BdW29IMcEX4j3r7c4oDV5PcaF4rimd7qsthmcm9ndAJQzxVh/ZSVKOnmRWmX3wGPVeVPeGWodP86Td6eEoBttnapYfJCJLa4lARJEpXljXj9CfnUCgYAN9f73d1i09S7xVdl8diTjz8yV0CASvurqpHZoVfK0IhRWBoUrBM/8Sx2uhr2zNrZW4hKds+fVVUSna91d24fu5JLTXsWNOAs+Gk2tJukOQrSaNlz5Z9ApkwWXj47C8jHeg8V+R0hEWylDGVP2fUCletsR9RX+jrC7wyvSTie/gQKBgGMweORANMvpTXLzCeZQB0AuZum0Ppm65hLuATTY12Gj9k3H5gqqqWzGTsSq569hBUdfY1QcjHZ0QCYjM3elua6EEc9dVjhbqUEWcEAXUH2vXozxhfgQnAOcnUA3HDrI/RVc08HhiyK9BOnKNhetn79IcLt6ZHAuTP6HDfdtJh8JAoGARZCn0QWNlXhsOt74J+7AiZfIB6rZXXcg8E5EC6P0/JR7mEQ9Z1tX40V7RcyeYfMKRRoMdeC7C5pr7yigvQUTdbfyW4+Zcg5jRpeGhatcsZQnRUqYtku4SEe5u9SWubPyLn/e7FwE2wVSBjqtQTVmGg8i3K4zm2ta6U3UF3IqDxM='),('5636d791-5d8a-4373-a382-1bc6064c90b3','9f039ff8-d49e-4209-ad44-7876a8878366','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('594f66a3-b0a0-477e-9812-1dbed3fc2f3b','b2f147f3-7ebd-4596-b23b-140fc7342875','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('59ba772e-cc3b-4d6b-a135-7425b37427c3','cccc76eb-39e0-46e2-8d51-17779c0f41b7','kid','f4d62444-3b9c-455b-bd91-3217390f65e5'),('5aa3af36-361d-4226-aee9-bea06cd7e505','9f039ff8-d49e-4209-ad44-7876a8878366','allowed-protocol-mapper-types','oidc-full-name-mapper'),('5ac79027-accf-45ea-abce-4729fe6203b4','2a6aed2a-26ac-417a-ac30-b53049dacca7','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('5ae5604d-441c-48ec-ac1b-61fb24869444','4c75b5c7-af55-4bd0-9726-7cf93acd9ca4','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('5d2df322-1745-498b-819b-afd0edf00ce5','0a762aac-3856-42b7-a449-e66204e65a8c','allow-default-scopes','true'),('62e714ff-b067-4d81-93e2-bc05abfb07d1','cccc76eb-39e0-46e2-8d51-17779c0f41b7','secret','WwQ857CSmQOQoMun25E-mw'),('656d758a-fa71-41ff-8ba6-aa4eb343edbd','4c75b5c7-af55-4bd0-9726-7cf93acd9ca4','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('67014f82-4c4e-44e6-8642-5cba8c282b60','608498c1-ba6c-47f0-82c3-18e3cff6345c','certificate','MIICmzCCAYMCBgGOWcwT3TANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjQwMzIwMDI1NzEwWhcNMzQwMzIwMDI1ODUwWjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQD2fIlhez9fLR90HZnejZQdNoJ/m+QWkztFTzCEVvK3H8tmYxzoofGMPDO36ZuA2IXBZdgSJtp7bmQt47wjk0T43+zUctKK2LtlJ0YujONUKPOdQvIamMwT3qvbiJwMZS2k0cIBSbPFn3jdhUF+BdjZ5WlgEmmBHZLRL/NpGKYH8L+rKlHdjYKGbeZUxIJnvnDzUvqNNqA2kln2s0cTV9Js8fHrP9/OWy1tfp7zlK0PoG24+yicpVoFlx56Jmh5R0CNsgXq+nLtp6w7diBIyJ89ZOBJwyePgCeJr6SrJXXiTxIO1XG/XrCNrzEBdRb9SwBaZOR0zYlxumaWb8qpaeyDAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAEsnoUjbbNXt6Dpwq+rhlqhgx2e6h8zvqr2/CFFCg3mIsJyO8wAi4UWbgT6hSc/KUd9T7TQxKsPBSv280allLl0rsjLsNi/osdGeEgqeCfTvz0wMZH16eZwXESLWkBAf2x6OxICEjnAjUynVtp/NuwQ+MaBk9pBsOIQzu824q7T4iiaRbPNWncUUFT4MOD5fRXCmfWA3eVzkL1NUrP9Ayw5xlxkyjx0GKrPATkhuW0UA7yuRvfAg2DeufgvstiwQD1xa9ZL9vVZIvgMl2BDu6XMZsA7Ezc/U2quFSEs+L8W82QDnOI85S+0n8TTBEcbRK4cBxgiIjeHd2WGnUxYjixc='),('672e7f7f-3328-46ad-8d26-aeff7366462e','da712166-6ba4-4010-b87d-38d4b150b89c','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('6c687bc4-8951-4451-9a63-7cf882cc69fa','9f0bc6eb-8483-4c29-af8c-aa19db7acaae','allow-default-scopes','true'),('6d2e739f-965f-41e9-9f79-46772a85082a','4c75b5c7-af55-4bd0-9726-7cf93acd9ca4','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('6eaae4be-491a-4d6f-8274-4e81c6668484','4c75b5c7-af55-4bd0-9726-7cf93acd9ca4','allowed-protocol-mapper-types','oidc-full-name-mapper'),('6f72be71-470a-499c-afac-d1c4ff89b1cc','00d40ecb-a606-43ee-adb0-d6f2aff891f5','client-uris-must-match','true'),('731f8374-ea4c-43b5-b883-f596afbc4ec7','1ae68de3-9794-42af-ae7f-2c68ef676f09','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('738b3119-d1fc-4124-ac38-88955d9e6519','00d40ecb-a606-43ee-adb0-d6f2aff891f5','host-sending-registration-request-must-match','true'),('751870a2-c5b9-4d4b-8c3e-1e5daa36fa61','da712166-6ba4-4010-b87d-38d4b150b89c','allowed-protocol-mapper-types','oidc-full-name-mapper'),('764291d6-f875-478e-8e84-77db8cf4e099','2ec554d6-1163-4ca6-828c-549e6297e814','max-clients','200'),('76877e6c-bc57-4714-996a-337a685f35e1','9f039ff8-d49e-4209-ad44-7876a8878366','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('77a7c290-7724-4ad1-b32a-6ffd3ac0567e','c007f463-7efc-4984-af40-0863b078017d','kid','2ea84969-bcf6-4b81-89ab-0193ad0742bb'),('80bfe591-e067-4a76-ac3c-52fbafd63537','1ae68de3-9794-42af-ae7f-2c68ef676f09','allowed-protocol-mapper-types','oidc-address-mapper'),('8110b06d-e71f-46cf-830f-94a1e2627a78','c007f463-7efc-4984-af40-0863b078017d','priority','100'),('8177a428-19a1-4bfe-944c-25677f0b6bb7','4c75b5c7-af55-4bd0-9726-7cf93acd9ca4','allowed-protocol-mapper-types','oidc-address-mapper'),('89879de5-eef7-4d2b-b526-7c6eccff97a9','8bf68765-115f-4bfe-abbf-518ff62fa05f','certificate','MIICqTCCAZECBgGOWc4OnjANBgkqhkiG9w0BAQsFADAYMRYwFAYDVQQDDA1kZW1vLWtleWNsb2FrMB4XDTI0MDMyMDAyNTkyMFoXDTM0MDMyMDAzMDEwMFowGDEWMBQGA1UEAwwNZGVtby1rZXljbG9hazCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBALJRUAmUwU5lr8PvmoZg3jrphLzMtVzI5xfrC9MQ3SKcS6ht/eXi9yWT+EQgdEVQo6NaG3OEdpLqBkBQ8kBkXhlULpt1Vq/FvMtru75ezxGX+a9ztAqcR9EX8PSUo7Dp0Ue0f29RB2c3MgWHCR1s8xVSybNUqDf3G00/kQkiskLaRBgb6E+UeXZNY7a2Gc6mFAzosjXKVOxqrSY+qxW9IOech53UcNs6ReoaHFIbeNjimVFlnqW4UWjb1rehoPgPOlJ4O3RJXVdoNlkSQJ8Q9t4R+fcLBYSb7nMyA/KE+ZWXwk3nso7MmhqjxOwsQtIMVQgFfpj0H2RwvwSOAAame0cCAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAqePm2NBqLvXgZ3Gw0XXSA+GfZXr9CsB3PyJiM3sJVJbBJrqzMasdqPD6Gg3ezvDN95y66wRX0iWqdMO7NTkFlRzFut3tvHx5bSFQWxraPn80iZnsiqxvwXwMpyBdsQSBQ7HM7gmKbq6G+RskhlvDRftm47IwJDE2+dpu53wMACtu5sjCY6L040xYJWav3+MVetpFP4/ELOpBROnuws31H8Qf6AWR1744SkzJldxmzE3gJljt9guw/qI15L9/QzN9uUN5+b8IO0cjGBr2Wu3ZwHd63HnLciik7C0rk9NTMB+ENghRxAr08cEgkeGua/IS027//qFGSy+wOV24KgGr1w=='),('8c03cb1f-941d-4b27-9c75-be1fb6ab80a6','2a6aed2a-26ac-417a-ac30-b53049dacca7','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('8db9228e-8fef-4cdd-837e-05e3fb574af7','af158a27-04f5-4b36-beab-216921ac0370','client-uris-must-match','true'),('8f769e18-0cc1-459f-836b-30261360386e','c4171a57-65c1-4ebe-acbc-b6478e1d258b','allow-default-scopes','true'),('921f4c00-eb41-48bb-aa4e-b2e707657dca','4c75b5c7-af55-4bd0-9726-7cf93acd9ca4','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('9be8d753-ceb5-4203-80d6-1dc4c9283bf8','2a6aed2a-26ac-417a-ac30-b53049dacca7','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('a59cbd6e-0ddb-4eb6-a161-df6e44299f85','1ae68de3-9794-42af-ae7f-2c68ef676f09','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('a60ce132-fe28-4aa3-9cc6-86b1ca8d1e91','af1c455b-9b97-4909-aa88-e71764cf70ed','keyUse','ENC'),('a99a7628-cf0d-4175-84f8-7b15deaa67a9','cccc76eb-39e0-46e2-8d51-17779c0f41b7','priority','100'),('a9eed447-499a-4be6-af26-eed22d76cb30','8b1a7d05-3df5-479c-accb-b4ec62eb76f7','priority','100'),('acb15b61-27f6-4a37-9da3-62cc005a1a86','32a1a177-798d-4bb0-bc78-2e6bf800547e','priority','100'),('b1ca0996-8527-4103-b223-05a855ac8260','1ae68de3-9794-42af-ae7f-2c68ef676f09','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('b2e73cf5-210e-4ee5-94a4-28fc19209893','da712166-6ba4-4010-b87d-38d4b150b89c','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('b4e2baf9-b542-4592-be6e-1ba1efca5099','2a6aed2a-26ac-417a-ac30-b53049dacca7','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('bab9c941-a0a0-415d-8629-33ef82cf05f6','c007f463-7efc-4984-af40-0863b078017d','secret','07pP_r9FDv8qB7B69mhvJA'),('bb7e2fbb-f55f-47c1-9fba-1b58f5bfede0','1ae68de3-9794-42af-ae7f-2c68ef676f09','allowed-protocol-mapper-types','saml-role-list-mapper'),('bdcccc1f-770e-4d56-869b-7f0ab274125b','27087a93-ab7d-4318-806a-d1e76a6acf66','max-clients','200'),('c2a299e7-21a2-4c41-83ed-d9e9cbf63968','8b1a7d05-3df5-479c-accb-b4ec62eb76f7','kid','9aa0cfa4-ad0d-4f09-9dbd-a59bdb9d14bb'),('c2b08e8f-dfeb-48a0-9eb1-049e9182fd74','af158a27-04f5-4b36-beab-216921ac0370','host-sending-registration-request-must-match','true'),('c414e980-9576-410c-9e65-634aca764d8c','32a1a177-798d-4bb0-bc78-2e6bf800547e','privateKey','MIIEogIBAAKCAQEA4+O1GQ4EJpjEVwlRJPL4KI6vOg01DiYN0lxwuUc3HX4qTp5jBbg7AlnAQNwUeEiAhD2Gm7gANtkTq/6xXJjMsVMVKzVdzZ0LJe4g9kkGQpggoZb72R2MGBbb/K5Fdn5HYdBubXklEF1a8/spDvQVfqG+yqGcdxVF572tk5JJeDXHYIhYTwhIRSy3kAPwWct+8D5KhRYpN67q/WD/vGdNOwbYVrOHbZWUyXthWqHRJN8n8YlPyjUpymW/ZsmTNKIscD6wkPbTfTBfVgjfiVA7BzBUa4rYox38LYZPEm5vtzPJSyREUlF0Tsa2U9fkTkrP1b9aaSNrgtWiP8vX+mepUQIDAQABAoIBAFWHTh4XpRYpSrMRw5sW920dVAV5FHr5bEGRwRrAcB6JDe7QwgBRCxCQR7fwAVy9dUJsZvtFfQsYwKnSHpXOoTBCKtU7I7f6I0d6jnNwp8FRoBmVdXMghEY8Ohck/twAe+DpnbBHgdIY/3xHPLsof3K12MnrCrKk0MYvaZhTlHBhJSgTBXj6Q+Oh8aFHBVfzGIsiZULu0F/SdbNzTC0W+vBxiNvaiehiQsBTlAjoJj76zrLnXTlGOT1OtDPa6b7NH+UKIoLAEur0bGLx+MjxILqxk7OTFjBawBYOcYzYOHz2vIi9WG20C8JXEau0oUGlinYD/DKLN+CicS6BXYWlmmsCgYEA/h1iwbOa3PKrLLlK/W31jrMW4XT8UpLtpid3Mp1vcey/eSPu6K4Xox4sWxUGfRh3zQUoeSX9HZ/Yc11jtjhDXhpP8rOrfdijh/bcCsgPpIGwq/ZaS79xAeuU+xTXv9Yh5wCgrhgTrAbjt1pnW8sNgvS4EGDvwGK+Wre4kT5VH7MCgYEA5ZSDvQs46Y59LbyuG5SQvF5If5u+e/+/nSCh2XtLuVG9Xoc1h0YLbcM+XjLe1o7bWwJ2nvu8KpVOpriK0ijHAOVdXhth2bhFDcqSRnqH7CpaTgwXjttpkiSw1CV0Hl+mQUeghkQvugyQH08iw+MoBnfp4RPevCOEXLpbFKlmMOsCgYAjv/aY0a/DzdAPJrJKHSIixUc+yLqG02zjp0G5uTRojqoRXODLk1J3/FK5LagQCVUxXrxm7tVBSa+l60mP5TJ1FraQqn5B4ix/gFdMnQC2YBh+2NWzOmenoYEAIdqIfpOecBQq6fA6j22R6gIIg/SOq+cJRtnz8vBcyuQIawCGyQKBgFHGhOZhiPQofQ49lwbb9HIkY06Q+1jP0ED3zq7Y7DAmnX1+S+LTYF7InP6QwC9M03WnevlGUdAZPtrEAS66t6fqC0fqGQCkUnSHI3NXUfMdYu1KAVoxbXlQ+GuYq7Pl/iJikRtCTn3G289LMOb1ktw6+mPh4ATD4fHlr2u8q1nhAoGAI/jX7TLWroWyimTCv4UrW4VdHSPohxgpqgcxhy2w+agTk/GnJifRhe0fqjaR8/AQy+0OAK94C46YklBEy4qXxKo6V+YWBP66IQY5BJjg7FFkPNTCp1WT4reZcN7oZkidxRR6u+1NPHgQs/fwGGwyUpRYVm3P1aJBUmp2Pph7QMQ='),('c44673f4-ac93-477f-93cc-cfdb322404e7','2bf33dd9-ca86-436f-a159-8a33ab82390d','secret','61JWVarYcMYB0pAWrecKVXDOlnMILbMCSw-251UOBGRWcQdSRCkbPhox9-OdaGwRbOqbu4dnMoQqAXwr3-bDL2I1p6FXoNv3apRbuzNyIt8JdP8I7_j7m3UltYngDDgeWFzuAtNRJbHfgQbY9zbRNuFfPn2sPlSDNaHNEW7AIZE'),('c8b516e1-8f67-47d0-8601-b1a6a4c91916','9f039ff8-d49e-4209-ad44-7876a8878366','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('c9587345-f975-475a-a3d6-a3e21c722a92','32a1a177-798d-4bb0-bc78-2e6bf800547e','keyUse','ENC'),('ca343ac8-4f21-484c-a441-74ababfc1a29','1ae68de3-9794-42af-ae7f-2c68ef676f09','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('cb53661b-4bb5-435c-8189-75736f70098f','f3f3a151-3466-492c-8a09-10e995eebe6a','keyUse','SIG'),('cbced4b4-2177-4ddd-92bb-f9ce0a36ab3c','af1c455b-9b97-4909-aa88-e71764cf70ed','privateKey','MIIEoQIBAAKCAQEAnsNZK+c6+9l1PhwhvQnmngK27TEQRB0LITAUeZbihT0/Swff+k7+8cGKXCwVCShgxV18yQlVkhT4Kcp7MFReK9wympmZVs+5SOxG593ileiK2O/rMlrxw45me2xpeWXxeRG1FI6DitJneSe76ITSCStt2+gGrWwrgVmeWv9Yrrh6gN5fiHK39J8vjbgjGv7TT6rzh4+fw2dHkhHKndjs8Rh5Qlkmq2IsjV5DYb1dGMEC+i7bTDjxb4Yn3xOAngezup5yMFST0OYuWQrmeEHHRB+8yOmuWtMHm5w8kcvjuqTs1S1sn4tGDZJX3y3BvwTvXMR1R0g3jgp7vhr0SnRbhQIDAQABAoH/d3nZ5k3Egf5VWnIzto9Qkax5S8uC8jWGqqRS66Pl1CQl1h/lxuVw4uDNSKO8k1jtK5n94hF81AYbMabC0vSq1hvpqlrtFEnvuZiMOd4ZxAVtZF48l3dPeW7hxGK0EQBh1dgk7awDZc3J/Qpp3tazEh/N5ZJeh8GG++5X5NRYVPuxkNZUL7yy1pEmGcyJNNUOeufnf7Dw/JOE0FgHl/GPAGgwMzVwt4rl873e9kzIPxM3STAwx37TCGxMV9raAsrt5jSQfcakaDXczLrYoX5vTE83uSiXC5gn4NGbGTqAJ6AbIlQ81Oy5exockLQAUv7i4fFWu28HGy2UNFFColiBAoGBANpzY9nfL+xkKBOGbYp8iZ/Dp7wO9vTSkBOSjqY5QWo2ToqJQOniZdHBNQc7kVme6v8NaDTHFYXoXb5ZUr4VG2akFHowkFcr8YBLZwHd/VgB2egGCNAXc4ptCy+rZhsm0BzxE30IKz401+eySbNTZ2EAChlNkXoY7btR/oqXoIdBAoGBALoNfR2FznkG8EC0nezJaQvHWQb+eYUw9TJAzm2CbGC2pMe9HZ8qHR15lspD5OeCaEkN60Zt13AkI7rxB5ehDwgk0tiP2QOEmIgeIKh68jeFXBffqdFEM4ZDtUGMg6bzPF49Xv/83UXQEORtoqbj7YQZFXI7BogzeMFyiPZPVSdFAoGAYe1mbq3pqtv/Rzl086b+fvtTvy8qL/gQlGWXwxZZp8ZukRYUXoSaRlyJbBOdBgMCr5GQDFDO6jePhpw+Rm3p2apmb5xDqIBPg8bJh4G/Z2t1Btllq/tHVV+qqxT38eYFV2QO63b1A67mtrwq49PYvRgqbstiEs0IDXglVnXAhcECgYBdlkdnQFV535mekrwVzcJ/YElSEVODQfs0yhCMWVy20WjV6DUsSPzYRL8rAzfzlE9s4AmHJd2G1Ub71B5jkWqESDGfKcyZzmsDnVQEK8QHVZfbknBTiaD5WrmkPVBD/HpTVT+iOMn9QgodPWDh3iktl4iIK1S/0lRdyoVGkOVemQKBgQCKStwX63tUjZmKWuYNxObmoYLaMyY6yhRO8InyHEq4NAzx/xqESLg1Nziax7fsP2Swx6F3ROiZ4bN9xMxEXOhagHn523XqOEvwxshk4uHk9eiiDWGL/0yw1mdsSkWbbexCzyrTgbipbSXyCLvfB1Kp0eK7aUZTMjfEHIW+ecOIjA=='),('cc3f1954-36e6-4ac0-956e-2d24510f2bdf','8f343740-d56e-4342-ac46-f36694737987','certificate','MIICmzCCAYMCBgGOWcwTZDANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjQwMzIwMDI1NzEwWhcNMzQwMzIwMDI1ODUwWjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDTxwQevu400F3ToObj7dOQBmBtnobPFHxOh9jqF1G7FMr8BCo/x2hengHW7bivb/LomqtyxdofcQypaBBF7CPl0E3FFW0pJvoaKJZ5C/uc9CvSR/GpiIKQHKDsk86npehFApU36dFpIDrUWP2174uo8Y+oky6hwUBQHuTUhV+N4/0zHjiLbScH73DD0Wq1tCA3IIcBgb1f/WJPgkptt7zWKqzbd1LUIhQ/8e+4VWSN73fro7v6THkjaLf29RATUISiSsNxxHq+Ef4CorDZ/WT1LN7nslnL8e54VXFIQq7GsDJol0xcVb9A+naPI0uBd+44JAl+2/ls1GcaP7qNl0oZAgMBAAEwDQYJKoZIhvcNAQELBQADggEBADS99iyaa+sJ8yeqMjDqBV2114LlRTVpEbOfprolOI6N2oRQ/W5Ox/I+p3K20n6KQL5UBqybMlOqkLDXgTBjV8JScr9ZnhRfsONEiRyUkl/b0rHoiY29A/8YzyQFXrCRpJMTXxQq5ppYz3/AQ9lISP3/qKQFg2qFw42gQSlbp4Nu83B++Y66nj5EKjV11Vg0UvvPj3KyiVT6crM2i4gyV2zbwLZ+StRuyNmNCsWhxutVcKK7RDvYj15lzTKMkXtd8PdFZwFyXZ7Z/9QHwXXP66v3UALyaWl3KpZ+piRYak49hkkaoQzsi81C3tehJ9NSFGLjZzEZIDAEHvgZ/NQllqI='),('ccba8ce7-2721-4cb1-b638-493e20423587','2bf33dd9-ca86-436f-a159-8a33ab82390d','algorithm','HS512'),('d1db2c61-e89a-47a2-9dbc-d8cca4f574cc','608498c1-ba6c-47f0-82c3-18e3cff6345c','algorithm','RSA-OAEP'),('d2359bc0-abdb-443b-a3bd-3dcb697cc1e9','da712166-6ba4-4010-b87d-38d4b150b89c','allowed-protocol-mapper-types','saml-user-property-mapper'),('d32de9d9-edb2-45a6-bd35-06c4b95fec1d','da712166-6ba4-4010-b87d-38d4b150b89c','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('d53272fd-a23b-4715-a05f-4695607facea','d3544f03-1894-4659-8106-44e01147c48f','algorithm','HS512'),('dd978e34-ae66-4110-bf32-5cb8a535583e','8bf68765-115f-4bfe-abbf-518ff62fa05f','priority','100'),('e6c7e542-d017-4a1c-b920-61a54df05114','d3544f03-1894-4659-8106-44e01147c48f','priority','100'),('e867d671-fe91-4338-bcd1-626a668ad426','608498c1-ba6c-47f0-82c3-18e3cff6345c','priority','100'),('e97a4977-aa53-48b7-9bfe-cfa7cae1d4e2','8f343740-d56e-4342-ac46-f36694737987','priority','100'),('e97e66cc-e376-43ce-8ea7-8c5928b20a69','8b1a7d05-3df5-479c-accb-b4ec62eb76f7','secret','zZmFeammY9nMm8zNPqSUvw'),('eb39fb9c-8b5a-4100-a10e-2c3b86bdf1c9','af1c455b-9b97-4909-aa88-e71764cf70ed','certificate','MIICtTCCAZ0CBgGOc5iMXDANBgkqhkiG9w0BAQsFADAeMRwwGgYDVQQDDBNvdS1ncmFkdWF0aW9uLXJlYWxtMB4XDTI0MDMyNTAzMTEwMVoXDTM0MDMyNTAzMTI0MVowHjEcMBoGA1UEAwwTb3UtZ3JhZHVhdGlvbi1yZWFsbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAJ7DWSvnOvvZdT4cIb0J5p4Ctu0xEEQdCyEwFHmW4oU9P0sH3/pO/vHBilwsFQkoYMVdfMkJVZIU+CnKezBUXivcMpqZmVbPuUjsRufd4pXoitjv6zJa8cOOZntsaXll8XkRtRSOg4rSZ3knu+iE0gkrbdvoBq1sK4FZnlr/WK64eoDeX4hyt/SfL424Ixr+00+q84ePn8NnR5IRyp3Y7PEYeUJZJqtiLI1eQ2G9XRjBAvou20w48W+GJ98TgJ4Hs7qecjBUk9DmLlkK5nhBx0QfvMjprlrTB5ucPJHL47qk7NUtbJ+LRg2SV98twb8E71zEdUdIN44Ke74a9Ep0W4UCAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAU498kxCot/KQEGzTxUR8GQW9Swjq7BrGznqn/gK+apXvwo2D4Hfl0K3GD7/A0mxaqx9zuvEsPS4wLCJx3S8WUeR2GC5pZCqR0pK6ySGjcW/m6DRCpYVLA5lRAZ0LFAmkaanzgwnbyNJ91bDaK0hiJPfy6dgRqN+hlAQGY9KJOeQSvE/2rKP/0I3LLG1sUQ6P2tiKairedQl+9u6kUPaOiRUCNjAQggGZSLrLLsYawA/WtjIM59QA6ubo1VKmdghctBldHjFnYH2cLhhbnKGInpebJ2SKPUMG1GKlfbG5JLDAOTIiVvlgchWAYRS7OpD8XOorwjJLf+KS+ift7jey5A=='),('eb84afb0-7745-47e3-87b7-6b58bdcb22aa','048ecb43-5ab1-4eed-a3bd-bd8622ee6e34','secret','txDnfpPdztQtK6FT0TISOSOEFV1vfvibY-0ktSZoXdluPGq6swzuOQ_VcbcWhxTjam6eSf6uJuGoueyEbjaEZp_F10sSWjyq4Fv_m494M839dY7FpA5RZCmPrpA-d0KEqiwdT7mvzdlLdj0WjkWCqxfyu8qZodbxXnb8S5QJ7JM'),('f0760910-1664-4f3b-aab9-481399a71f90','f3f3a151-3466-492c-8a09-10e995eebe6a','priority','100'),('f2aa4fef-978e-4485-a5ce-2c714e71f308','b2f147f3-7ebd-4596-b23b-140fc7342875','allowed-protocol-mapper-types','saml-role-list-mapper'),('f40061e9-c7cb-408a-959a-3b14c6d55929','da712166-6ba4-4010-b87d-38d4b150b89c','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('f4cf8d34-2d45-4a85-9c8c-6e0bec11e6fa','b2f147f3-7ebd-4596-b23b-140fc7342875','allowed-protocol-mapper-types','saml-user-property-mapper'),('f6430562-89b2-4c8e-8cca-4d71a29b8678','2a6aed2a-26ac-417a-ac30-b53049dacca7','allowed-protocol-mapper-types','saml-role-list-mapper'),('f919a3db-ce8b-4722-b213-59a5e3e9e41e','dd62fb03-314e-4ca6-8adb-1ea1d627e0e3','allow-default-scopes','true'),('fb82709a-6a33-42f8-9c4b-3ce513eda0d2','b2f147f3-7ebd-4596-b23b-140fc7342875','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('fbad3a7c-1b88-4e5b-8c43-970421ec7c52','b2f147f3-7ebd-4596-b23b-140fc7342875','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('fc9adb97-54fd-4395-b14b-e616cbd57456','9f039ff8-d49e-4209-ad44-7876a8878366','allowed-protocol-mapper-types','saml-user-property-mapper'),('fcaf5a57-6619-4534-9fe2-def26bd8f1a5','9f039ff8-d49e-4209-ad44-7876a8878366','allowed-protocol-mapper-types','oidc-address-mapper'),('ff4da700-7ef9-4667-846e-2d8e439903bb','acb1c3a4-abd6-496b-93bc-e33a444e689f','host-sending-registration-request-must-match','true');
/*!40000 ALTER TABLE `component_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `composite_role`
--

DROP TABLE IF EXISTS `composite_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `composite_role` (
  `COMPOSITE` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CHILD_ROLE` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`COMPOSITE`,`CHILD_ROLE`),
  KEY `IDX_COMPOSITE` (`COMPOSITE`),
  KEY `IDX_COMPOSITE_CHILD` (`CHILD_ROLE`),
  CONSTRAINT `FK_A63WVEKFTU8JO1PNJ81E7MCE2` FOREIGN KEY (`COMPOSITE`) REFERENCES `keycloak_role` (`ID`),
  CONSTRAINT `FK_GR7THLLB9LU8Q4VQA4524JJY8` FOREIGN KEY (`CHILD_ROLE`) REFERENCES `keycloak_role` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `composite_role`
--

LOCK TABLES `composite_role` WRITE;
/*!40000 ALTER TABLE `composite_role` DISABLE KEYS */;
INSERT INTO `composite_role` VALUES ('055bf001-5eee-4bc5-89ef-069ee8ea39fc','947d5295-fafe-4189-aae8-8f5fe780d440'),('074b7e7a-3ba8-44e7-8134-313a2db3c95f','3bd26bce-1ef0-46de-9117-eea617466f1b'),('074b7e7a-3ba8-44e7-8134-313a2db3c95f','906ece06-afcb-4b2c-8f3e-aa0a31c93255'),('0cee371a-426c-4929-8547-bda1888246c8','7b1176a3-35a5-4ba4-ba6e-a26e32cb609c'),('0cee371a-426c-4929-8547-bda1888246c8','90edd835-72e1-4950-94d5-25009f1fd144'),('2057d046-ba32-4f45-bdca-fb54a12b329e','22a8972e-a2ef-4b40-b8b5-a57ea9c3966a'),('23ba9811-f8b5-4e98-8db9-b719f03f0c2d','07bbf8c9-9916-4d8c-8789-787590b874b6'),('23ba9811-f8b5-4e98-8db9-b719f03f0c2d','08730317-09db-4b32-8c72-a2e46b0d9321'),('23ba9811-f8b5-4e98-8db9-b719f03f0c2d','0f28cf68-2d23-4821-9339-d9cfda1a8db8'),('23ba9811-f8b5-4e98-8db9-b719f03f0c2d','2057d046-ba32-4f45-bdca-fb54a12b329e'),('23ba9811-f8b5-4e98-8db9-b719f03f0c2d','22a8972e-a2ef-4b40-b8b5-a57ea9c3966a'),('23ba9811-f8b5-4e98-8db9-b719f03f0c2d','57365b6b-cecc-44ba-8b79-21d188acca12'),('23ba9811-f8b5-4e98-8db9-b719f03f0c2d','642b20dd-9ced-453e-ba8f-64132b2194e6'),('23ba9811-f8b5-4e98-8db9-b719f03f0c2d','82ca6375-addb-4f22-bc04-b286f2a5c5b4'),('23ba9811-f8b5-4e98-8db9-b719f03f0c2d','9c666ee4-b1e3-4d67-8540-e0dcfe0943a5'),('23ba9811-f8b5-4e98-8db9-b719f03f0c2d','9c821dad-0bbc-485e-824d-5eaaf5e516a2'),('23ba9811-f8b5-4e98-8db9-b719f03f0c2d','a6b2f4b7-5ce5-451c-9677-cd1a13a98b4b'),('23ba9811-f8b5-4e98-8db9-b719f03f0c2d','af3432f2-089c-434c-9ac6-cfa7ce866d64'),('23ba9811-f8b5-4e98-8db9-b719f03f0c2d','bc32c420-48a7-46e4-8080-43dee883f00e'),('23ba9811-f8b5-4e98-8db9-b719f03f0c2d','c163f389-4b05-4f0b-8fa1-70e6bb2ef810'),('23ba9811-f8b5-4e98-8db9-b719f03f0c2d','d332c475-36f3-4f12-9c8e-2c9749672ff7'),('23ba9811-f8b5-4e98-8db9-b719f03f0c2d','d6db0215-47b4-4774-9c9b-2d4fcd0548f3'),('23ba9811-f8b5-4e98-8db9-b719f03f0c2d','e378cee1-ea3a-4a4d-b4a8-daf4a215c1bb'),('23ba9811-f8b5-4e98-8db9-b719f03f0c2d','ff634d91-3a56-411e-83ff-f28810cf10b9'),('6253e11b-210f-4f50-a8ad-3c0ccfc0f652','4be45a04-31a8-4bc9-8570-7da4b7334874'),('63520e03-a6ae-4539-8acc-b581ee17207a','ea3fcbd8-32c4-44e8-b03e-07694653339a'),('64a76c03-6966-49d8-b77e-f76aa0cf9f14','02c6fdc1-abfd-437c-9369-6220e22c557f'),('64a76c03-6966-49d8-b77e-f76aa0cf9f14','055bf001-5eee-4bc5-89ef-069ee8ea39fc'),('64a76c03-6966-49d8-b77e-f76aa0cf9f14','074b7e7a-3ba8-44e7-8134-313a2db3c95f'),('64a76c03-6966-49d8-b77e-f76aa0cf9f14','0cee371a-426c-4929-8547-bda1888246c8'),('64a76c03-6966-49d8-b77e-f76aa0cf9f14','0f796070-3a96-4270-8803-2e136a3d5e20'),('64a76c03-6966-49d8-b77e-f76aa0cf9f14','169e4090-90e5-434f-89b0-084f398016b9'),('64a76c03-6966-49d8-b77e-f76aa0cf9f14','18e1b6ab-5e3c-4b1f-bbc0-35473d5efd9d'),('64a76c03-6966-49d8-b77e-f76aa0cf9f14','1aba9390-7088-4caf-bb9e-dce892f7adb5'),('64a76c03-6966-49d8-b77e-f76aa0cf9f14','246a166b-d233-4f83-a69e-827580bccdf7'),('64a76c03-6966-49d8-b77e-f76aa0cf9f14','257887fc-827d-4f01-b007-0847605461b9'),('64a76c03-6966-49d8-b77e-f76aa0cf9f14','28eecd89-3f0c-4c22-a4df-e170ac2d5eb2'),('64a76c03-6966-49d8-b77e-f76aa0cf9f14','3bd26bce-1ef0-46de-9117-eea617466f1b'),('64a76c03-6966-49d8-b77e-f76aa0cf9f14','41602ed1-a755-469c-9fea-016b2eac53e2'),('64a76c03-6966-49d8-b77e-f76aa0cf9f14','472f8a7e-cd7e-4baf-88e2-d4e8bf8101e8'),('64a76c03-6966-49d8-b77e-f76aa0cf9f14','4b53ec37-18bc-480d-b705-0c41b7649b53'),('64a76c03-6966-49d8-b77e-f76aa0cf9f14','4db3ba07-f9f1-4588-ae91-8d3ae689e30d'),('64a76c03-6966-49d8-b77e-f76aa0cf9f14','4de300c3-8895-4bd8-999e-a11b19779e3d'),('64a76c03-6966-49d8-b77e-f76aa0cf9f14','5067b6e9-fe8b-4460-8c01-4e53c5bbb5f7'),('64a76c03-6966-49d8-b77e-f76aa0cf9f14','5849959a-836f-46e2-8f6c-60186bba87ae'),('64a76c03-6966-49d8-b77e-f76aa0cf9f14','6169307d-d636-49e0-9e71-320e15f850f5'),('64a76c03-6966-49d8-b77e-f76aa0cf9f14','63520e03-a6ae-4539-8acc-b581ee17207a'),('64a76c03-6966-49d8-b77e-f76aa0cf9f14','6493d498-fd92-48d1-9417-ad56ad3fceda'),('64a76c03-6966-49d8-b77e-f76aa0cf9f14','6a629b6c-b05f-4d18-a2e5-a801c6f87e2b'),('64a76c03-6966-49d8-b77e-f76aa0cf9f14','6ff966e5-a3b3-4b3a-867b-2e0642c4672b'),('64a76c03-6966-49d8-b77e-f76aa0cf9f14','78558dd7-a1d4-4762-a50c-844f157f7692'),('64a76c03-6966-49d8-b77e-f76aa0cf9f14','7b1176a3-35a5-4ba4-ba6e-a26e32cb609c'),('64a76c03-6966-49d8-b77e-f76aa0cf9f14','7c574e03-613d-4f29-a0fc-723f23ed2bc9'),('64a76c03-6966-49d8-b77e-f76aa0cf9f14','7c80ab2a-d962-4017-b1c8-5cdaefda65b1'),('64a76c03-6966-49d8-b77e-f76aa0cf9f14','7e1cf577-f457-4d04-b737-6b9c717d4a47'),('64a76c03-6966-49d8-b77e-f76aa0cf9f14','906ece06-afcb-4b2c-8f3e-aa0a31c93255'),('64a76c03-6966-49d8-b77e-f76aa0cf9f14','90edd835-72e1-4950-94d5-25009f1fd144'),('64a76c03-6966-49d8-b77e-f76aa0cf9f14','947d5295-fafe-4189-aae8-8f5fe780d440'),('64a76c03-6966-49d8-b77e-f76aa0cf9f14','9cef5a81-eeb0-4890-ac8b-0d1506d5b63e'),('64a76c03-6966-49d8-b77e-f76aa0cf9f14','a1a23795-d007-4ce4-ba22-d8c276d1c57a'),('64a76c03-6966-49d8-b77e-f76aa0cf9f14','a29cfde8-bde0-45b4-be67-49bf4cc97fbe'),('64a76c03-6966-49d8-b77e-f76aa0cf9f14','ae0513c4-502b-445b-821d-5432229d1f7d'),('64a76c03-6966-49d8-b77e-f76aa0cf9f14','af10f6dd-6707-4890-b678-7e5f827ea6b1'),('64a76c03-6966-49d8-b77e-f76aa0cf9f14','b14deacb-a7cd-4baf-9c89-5f631e733814'),('64a76c03-6966-49d8-b77e-f76aa0cf9f14','b23228c8-a6fe-4ae4-81be-87f0c912a913'),('64a76c03-6966-49d8-b77e-f76aa0cf9f14','b276b14c-cd87-4ade-8c84-424137f2a6d6'),('64a76c03-6966-49d8-b77e-f76aa0cf9f14','ba6e396c-4964-4bf4-86c6-4e59d631e39a'),('64a76c03-6966-49d8-b77e-f76aa0cf9f14','bdab9827-e23c-4772-a6b6-054594ad9ecf'),('64a76c03-6966-49d8-b77e-f76aa0cf9f14','bdb535de-7296-464a-bec9-aa25d93b1daa'),('64a76c03-6966-49d8-b77e-f76aa0cf9f14','bf780ab9-5288-4774-8a51-1a2ef9cd3fd6'),('64a76c03-6966-49d8-b77e-f76aa0cf9f14','c4619ce2-5b4f-4e68-bd07-c11427564c81'),('64a76c03-6966-49d8-b77e-f76aa0cf9f14','c6701e4e-34be-45e7-9f32-f849074e2a36'),('64a76c03-6966-49d8-b77e-f76aa0cf9f14','ce9f19e4-8b98-4ad6-84e3-eed1ebb3f076'),('64a76c03-6966-49d8-b77e-f76aa0cf9f14','d02eb70b-beae-4184-90da-c76b5ddeb565'),('64a76c03-6966-49d8-b77e-f76aa0cf9f14','d9aaaaa2-53ca-4747-8601-ac7282a796f2'),('64a76c03-6966-49d8-b77e-f76aa0cf9f14','e6167865-93c8-4881-9acb-ce3b7a022e49'),('64a76c03-6966-49d8-b77e-f76aa0cf9f14','e884d826-d998-4906-b9a3-08e641e54e40'),('64a76c03-6966-49d8-b77e-f76aa0cf9f14','ea3fcbd8-32c4-44e8-b03e-07694653339a'),('64a76c03-6966-49d8-b77e-f76aa0cf9f14','f9f2fb55-1fc2-408b-9d11-7890dc4ae833'),('64a76c03-6966-49d8-b77e-f76aa0cf9f14','faaed683-3855-4a76-ae77-b530b28f24be'),('64a76c03-6966-49d8-b77e-f76aa0cf9f14','fc6220a3-07ea-4f2a-b9d8-2796542c3eed'),('6ff966e5-a3b3-4b3a-867b-2e0642c4672b','c4619ce2-5b4f-4e68-bd07-c11427564c81'),('70f80bf8-8bd8-44d7-be8c-dbe1b7d1e701','fb88db88-8233-4df8-bc42-b5a9c409c7b2'),('972b63fe-074a-4531-93f0-cc084965350c','0e96596a-e8f6-4446-88af-9cf842ec81bf'),('972b63fe-074a-4531-93f0-cc084965350c','26e608ca-eec0-42e3-97f9-c279044c07f4'),('972b63fe-074a-4531-93f0-cc084965350c','2f3c7ab7-04a3-42f8-b06d-9beab09a5693'),('972b63fe-074a-4531-93f0-cc084965350c','3c50bcc6-681c-4f17-a520-fd4d974a0973'),('972b63fe-074a-4531-93f0-cc084965350c','3db010d0-0a12-49c8-98d6-36dd4e9320d0'),('972b63fe-074a-4531-93f0-cc084965350c','4dd787dd-0910-4355-a2a8-b6baccb74255'),('972b63fe-074a-4531-93f0-cc084965350c','50bb28a8-6456-4f8a-81d3-09c7b182f597'),('972b63fe-074a-4531-93f0-cc084965350c','52aa5aeb-91d1-4181-8a91-a33ddb1e9f52'),('972b63fe-074a-4531-93f0-cc084965350c','5560dfd0-2d6e-4d99-92ad-1313bbf09d0e'),('972b63fe-074a-4531-93f0-cc084965350c','6c165c92-7580-44ba-b0da-b17fbb6b2dc0'),('972b63fe-074a-4531-93f0-cc084965350c','b389a4d9-109e-4837-b0c9-a04dd006fee3'),('972b63fe-074a-4531-93f0-cc084965350c','b3e73df8-615d-4463-b651-5632bcc00af2'),('972b63fe-074a-4531-93f0-cc084965350c','b65e46c6-c772-440c-ba20-754efc469877'),('972b63fe-074a-4531-93f0-cc084965350c','bae0f725-af11-455d-b118-686ca91431d5'),('972b63fe-074a-4531-93f0-cc084965350c','c43e595d-13c0-4f02-9a46-6edc104a26ed'),('972b63fe-074a-4531-93f0-cc084965350c','cabf9457-5078-4f34-aa36-1d1d5af85c75'),('972b63fe-074a-4531-93f0-cc084965350c','d2f1cc25-17f0-4868-a16f-310013d47771'),('972b63fe-074a-4531-93f0-cc084965350c','ddf22be2-e5ba-4a4d-8341-a47acb77e515'),('b389a4d9-109e-4837-b0c9-a04dd006fee3','26e608ca-eec0-42e3-97f9-c279044c07f4'),('ba6e396c-4964-4bf4-86c6-4e59d631e39a','5067b6e9-fe8b-4460-8c01-4e53c5bbb5f7'),('ba6e396c-4964-4bf4-86c6-4e59d631e39a','a29cfde8-bde0-45b4-be67-49bf4cc97fbe'),('bc32c420-48a7-46e4-8080-43dee883f00e','57365b6b-cecc-44ba-8b79-21d188acca12'),('bc32c420-48a7-46e4-8080-43dee883f00e','82ca6375-addb-4f22-bc04-b286f2a5c5b4'),('d57fda3d-aae9-4521-90bc-4713fa22ab07','f662afea-dec8-4c8b-95c5-71f452ed854b'),('daefece2-47be-4d23-b90b-fbe7838e5068','ccf72939-d4e6-4bc1-aaba-1da412c818b6'),('ddf22be2-e5ba-4a4d-8341-a47acb77e515','0e96596a-e8f6-4446-88af-9cf842ec81bf'),('ddf22be2-e5ba-4a4d-8341-a47acb77e515','4dd787dd-0910-4355-a2a8-b6baccb74255'),('eee1e37b-271f-489e-8549-7a19b2846d72','14deb92a-5bec-459d-bb04-a93ccde8225e'),('eee1e37b-271f-489e-8549-7a19b2846d72','7249a0c4-b13a-417e-883d-e561e4148065'),('eee1e37b-271f-489e-8549-7a19b2846d72','95a4b0ef-2115-4595-9c12-06fd70510d85'),('eee1e37b-271f-489e-8549-7a19b2846d72','daefece2-47be-4d23-b90b-fbe7838e5068'),('f39107e7-b652-4f21-827b-14a335a6a925','5578c149-c0c7-4fc1-aff7-a1b2a1717362'),('f9d384ae-3301-4b99-b288-45b0f98ff960','0524929c-e444-46d8-89c2-26e13a157399'),('f9d384ae-3301-4b99-b288-45b0f98ff960','6253e11b-210f-4f50-a8ad-3c0ccfc0f652'),('f9d384ae-3301-4b99-b288-45b0f98ff960','c089a6ca-a05d-487a-87f3-08f22baafd87'),('f9d384ae-3301-4b99-b288-45b0f98ff960','f8299f94-cf39-4047-a8d3-8b3d2d905fdc'),('fb4eb6de-9dbb-4e45-872b-c5fbcc683082','6c991140-44d1-4b91-b8a7-eb10b355129f'),('fb60f2d1-c064-4abe-a498-65eba6ed1bb2','70f80bf8-8bd8-44d7-be8c-dbe1b7d1e701'),('fb60f2d1-c064-4abe-a498-65eba6ed1bb2','90f12596-814a-4846-b6b1-a4f7a5dbfc0d'),('fb60f2d1-c064-4abe-a498-65eba6ed1bb2','9df862a3-ad97-48a2-a7de-50f865e1996d'),('fb60f2d1-c064-4abe-a498-65eba6ed1bb2','d4ee839c-f4d5-4d8a-85a3-e78f53dce3e4');
/*!40000 ALTER TABLE `composite_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credential`
--

DROP TABLE IF EXISTS `credential`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `credential` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SALT` tinyblob,
  `TYPE` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `USER_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `USER_LABEL` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SECRET_DATA` longtext COLLATE utf8mb4_unicode_ci,
  `CREDENTIAL_DATA` longtext COLLATE utf8mb4_unicode_ci,
  `PRIORITY` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USER_CREDENTIAL` (`USER_ID`),
  CONSTRAINT `FK_PFYR0GLASQYL0DEI3KL69R6V0` FOREIGN KEY (`USER_ID`) REFERENCES `user_entity` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credential`
--

LOCK TABLES `credential` WRITE;
/*!40000 ALTER TABLE `credential` DISABLE KEYS */;
INSERT INTO `credential` VALUES ('3c36c7ca-16c7-4a18-a353-f1c0437fea96',NULL,'password','792f1ba4-262a-42b9-bb8d-0bd2317fb7ad',1711336591781,'My password','{\"value\":\"OUvJfJyynqVuBVeN2pveZgkWmdphiuQSjfd/flH2mCM+Lu/x4izXLkhpcLsC7z74Ld3qTgfyaN1mzsCQsxuL5g==\",\"salt\":\"zxr/KsSJaDZl/Iztk6xePw==\",\"additionalParameters\":{}}','{\"hashIterations\":210000,\"algorithm\":\"pbkdf2-sha512\",\"additionalParameters\":{}}',10),('5d90c95a-4206-45ed-add7-12ff726a55f7',NULL,'password','e3cd4ac3-cf18-43d2-8420-d399885e5520',1710903544238,NULL,'{\"value\":\"XV0iRV2sgppGQzdgYwW6YuMGWtsEPMS1wKPhmknTUs3bu0NlUjfyHExFK75/tUgfvPTTf6ML60zxie0ttiljqA==\",\"salt\":\"CJSz+xezft0TTgsIjq0Kug==\",\"additionalParameters\":{}}','{\"hashIterations\":210000,\"algorithm\":\"pbkdf2-sha512\",\"additionalParameters\":{}}',10),('85f34f08-f1c2-43e3-8940-5a6f6890f34b',NULL,'password','3850aee7-a9af-4007-ab40-984e1ddd5269',1710989218207,'My password','{\"value\":\"mVtgrtUuCRwopftrx2YVjwPeUVvL9dUGJykK3cXqj99PfhGFHKJqJXcSYKj1zTcC4PpHMVibMqv3tAbKZAxT0Q==\",\"salt\":\"8hih0YnI7NA2ooH8ty63dQ==\",\"additionalParameters\":{}}','{\"hashIterations\":210000,\"algorithm\":\"pbkdf2-sha512\",\"additionalParameters\":{}}',10),('cbcd93ee-7553-4294-8f97-72448a2c448e',NULL,'password','ea9e6256-21fb-457c-802c-537933390cfd',1710903979256,'My password','{\"value\":\"1eCzLG3FwYk+doOhG8VeceDBMNlwozzNt6BeJ9E/vTULsr6egicqVuP56LHeMgQeDV5bhQCa+WA5gwx9biSogQ==\",\"salt\":\"VI3xcbk3k5sHdRVGZlJnBA==\",\"additionalParameters\":{}}','{\"hashIterations\":210000,\"algorithm\":\"pbkdf2-sha512\",\"additionalParameters\":{}}',10),('f56c1a2c-9b5d-46c4-954f-4911936e62d2',NULL,'password','3d437dba-d729-4b34-b963-c3c93ed50637',1711336561690,'My password','{\"value\":\"RUG8aVvzR7tkGKwV7XDvok+HRsLaaY/FjNwJX+XVmtoSSDwztp1/bMgyc0/+fSkwQODQDmlBISmAvfNCC1IZkg==\",\"salt\":\"HbHTRVUWnLFcn+Av1BT4Rg==\",\"additionalParameters\":{}}','{\"hashIterations\":210000,\"algorithm\":\"pbkdf2-sha512\",\"additionalParameters\":{}}',10);
/*!40000 ALTER TABLE `credential` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `databasechangelog`
--

DROP TABLE IF EXISTS `databasechangelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `databasechangelog` (
  `ID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `AUTHOR` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FILENAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int NOT NULL,
  `EXECTYPE` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `MD5SUM` varchar(35) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `COMMENTS` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TAG` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LIQUIBASE` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CONTEXTS` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LABELS` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `databasechangelog`
--

LOCK TABLES `databasechangelog` WRITE;
/*!40000 ALTER TABLE `databasechangelog` DISABLE KEYS */;
INSERT INTO `databasechangelog` VALUES ('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/jpa-changelog-1.0.0.Final.xml','2024-03-20 09:58:30',1,'EXECUTED','9:6f1016664e21e16d26517a4418f5e3df','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'4.25.1',NULL,NULL,'0903506829'),('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/db2-jpa-changelog-1.0.0.Final.xml','2024-03-20 09:58:30',2,'MARK_RAN','9:828775b1596a07d1200ba1d49e5e3941','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'4.25.1',NULL,NULL,'0903506829'),('1.1.0.Beta1','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Beta1.xml','2024-03-20 09:58:30',3,'EXECUTED','9:5f090e44a7d595883c1fb61f4b41fd38','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...','',NULL,'4.25.1',NULL,NULL,'0903506829'),('1.1.0.Final','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Final.xml','2024-03-20 09:58:30',4,'EXECUTED','9:c07e577387a3d2c04d1adc9aaad8730e','renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY','',NULL,'4.25.1',NULL,NULL,'0903506829'),('1.2.0.Beta1','psilva@redhat.com','META-INF/jpa-changelog-1.2.0.Beta1.xml','2024-03-20 09:58:31',5,'EXECUTED','9:b68ce996c655922dbcd2fe6b6ae72686','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'4.25.1',NULL,NULL,'0903506829'),('1.2.0.Beta1','psilva@redhat.com','META-INF/db2-jpa-changelog-1.2.0.Beta1.xml','2024-03-20 09:58:31',6,'MARK_RAN','9:543b5c9989f024fe35c6f6c5a97de88e','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'4.25.1',NULL,NULL,'0903506829'),('1.2.0.RC1','bburke@redhat.com','META-INF/jpa-changelog-1.2.0.CR1.xml','2024-03-20 09:58:32',7,'EXECUTED','9:765afebbe21cf5bbca048e632df38336','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'4.25.1',NULL,NULL,'0903506829'),('1.2.0.RC1','bburke@redhat.com','META-INF/db2-jpa-changelog-1.2.0.CR1.xml','2024-03-20 09:58:32',8,'MARK_RAN','9:db4a145ba11a6fdaefb397f6dbf829a1','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'4.25.1',NULL,NULL,'0903506829'),('1.2.0.Final','keycloak','META-INF/jpa-changelog-1.2.0.Final.xml','2024-03-20 09:58:32',9,'EXECUTED','9:9d05c7be10cdb873f8bcb41bc3a8ab23','update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT','',NULL,'4.25.1',NULL,NULL,'0903506829'),('1.3.0','bburke@redhat.com','META-INF/jpa-changelog-1.3.0.xml','2024-03-20 09:58:33',10,'EXECUTED','9:18593702353128d53111f9b1ff0b82b8','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...','',NULL,'4.25.1',NULL,NULL,'0903506829'),('1.4.0','bburke@redhat.com','META-INF/jpa-changelog-1.4.0.xml','2024-03-20 09:58:34',11,'EXECUTED','9:6122efe5f090e41a85c0f1c9e52cbb62','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'4.25.1',NULL,NULL,'0903506829'),('1.4.0','bburke@redhat.com','META-INF/db2-jpa-changelog-1.4.0.xml','2024-03-20 09:58:34',12,'MARK_RAN','9:e1ff28bf7568451453f844c5d54bb0b5','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'4.25.1',NULL,NULL,'0903506829'),('1.5.0','bburke@redhat.com','META-INF/jpa-changelog-1.5.0.xml','2024-03-20 09:58:34',13,'EXECUTED','9:7af32cd8957fbc069f796b61217483fd','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'4.25.1',NULL,NULL,'0903506829'),('1.6.1_from15','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2024-03-20 09:58:34',14,'EXECUTED','9:6005e15e84714cd83226bf7879f54190','addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...','',NULL,'4.25.1',NULL,NULL,'0903506829'),('1.6.1_from16-pre','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2024-03-20 09:58:34',15,'MARK_RAN','9:bf656f5a2b055d07f314431cae76f06c','delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION','',NULL,'4.25.1',NULL,NULL,'0903506829'),('1.6.1_from16','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2024-03-20 09:58:34',16,'MARK_RAN','9:f8dadc9284440469dcf71e25ca6ab99b','dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...','',NULL,'4.25.1',NULL,NULL,'0903506829'),('1.6.1','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2024-03-20 09:58:34',17,'EXECUTED','9:d41d8cd98f00b204e9800998ecf8427e','empty','',NULL,'4.25.1',NULL,NULL,'0903506829'),('1.7.0','bburke@redhat.com','META-INF/jpa-changelog-1.7.0.xml','2024-03-20 09:58:35',18,'EXECUTED','9:3368ff0be4c2855ee2dd9ca813b38d8e','createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...','',NULL,'4.25.1',NULL,NULL,'0903506829'),('1.8.0','mposolda@redhat.com','META-INF/jpa-changelog-1.8.0.xml','2024-03-20 09:58:35',19,'EXECUTED','9:8ac2fb5dd030b24c0570a763ed75ed20','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'4.25.1',NULL,NULL,'0903506829'),('1.8.0-2','keycloak','META-INF/jpa-changelog-1.8.0.xml','2024-03-20 09:58:35',20,'EXECUTED','9:f91ddca9b19743db60e3057679810e6c','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'4.25.1',NULL,NULL,'0903506829'),('1.8.0','mposolda@redhat.com','META-INF/db2-jpa-changelog-1.8.0.xml','2024-03-20 09:58:35',21,'MARK_RAN','9:831e82914316dc8a57dc09d755f23c51','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'4.25.1',NULL,NULL,'0903506829'),('1.8.0-2','keycloak','META-INF/db2-jpa-changelog-1.8.0.xml','2024-03-20 09:58:35',22,'MARK_RAN','9:f91ddca9b19743db60e3057679810e6c','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'4.25.1',NULL,NULL,'0903506829'),('1.9.0','mposolda@redhat.com','META-INF/jpa-changelog-1.9.0.xml','2024-03-20 09:58:36',23,'EXECUTED','9:bc3d0f9e823a69dc21e23e94c7a94bb1','update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...','',NULL,'4.25.1',NULL,NULL,'0903506829'),('1.9.1','keycloak','META-INF/jpa-changelog-1.9.1.xml','2024-03-20 09:58:36',24,'EXECUTED','9:c9999da42f543575ab790e76439a2679','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'4.25.1',NULL,NULL,'0903506829'),('1.9.1','keycloak','META-INF/db2-jpa-changelog-1.9.1.xml','2024-03-20 09:58:36',25,'MARK_RAN','9:0d6c65c6f58732d81569e77b10ba301d','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'4.25.1',NULL,NULL,'0903506829'),('1.9.2','keycloak','META-INF/jpa-changelog-1.9.2.xml','2024-03-20 09:58:36',26,'EXECUTED','9:fc576660fc016ae53d2d4778d84d86d0','createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...','',NULL,'4.25.1',NULL,NULL,'0903506829'),('authz-2.0.0','psilva@redhat.com','META-INF/jpa-changelog-authz-2.0.0.xml','2024-03-20 09:58:37',27,'EXECUTED','9:43ed6b0da89ff77206289e87eaa9c024','createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...','',NULL,'4.25.1',NULL,NULL,'0903506829'),('authz-2.5.1','psilva@redhat.com','META-INF/jpa-changelog-authz-2.5.1.xml','2024-03-20 09:58:37',28,'EXECUTED','9:44bae577f551b3738740281eceb4ea70','update tableName=RESOURCE_SERVER_POLICY','',NULL,'4.25.1',NULL,NULL,'0903506829'),('2.1.0-KEYCLOAK-5461','bburke@redhat.com','META-INF/jpa-changelog-2.1.0.xml','2024-03-20 09:58:37',29,'EXECUTED','9:bd88e1f833df0420b01e114533aee5e8','createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...','',NULL,'4.25.1',NULL,NULL,'0903506829'),('2.2.0','bburke@redhat.com','META-INF/jpa-changelog-2.2.0.xml','2024-03-20 09:58:37',30,'EXECUTED','9:a7022af5267f019d020edfe316ef4371','addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...','',NULL,'4.25.1',NULL,NULL,'0903506829'),('2.3.0','bburke@redhat.com','META-INF/jpa-changelog-2.3.0.xml','2024-03-20 09:58:38',31,'EXECUTED','9:fc155c394040654d6a79227e56f5e25a','createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...','',NULL,'4.25.1',NULL,NULL,'0903506829'),('2.4.0','bburke@redhat.com','META-INF/jpa-changelog-2.4.0.xml','2024-03-20 09:58:38',32,'EXECUTED','9:eac4ffb2a14795e5dc7b426063e54d88','customChange','',NULL,'4.25.1',NULL,NULL,'0903506829'),('2.5.0','bburke@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2024-03-20 09:58:38',33,'EXECUTED','9:54937c05672568c4c64fc9524c1e9462','customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION','',NULL,'4.25.1',NULL,NULL,'0903506829'),('2.5.0-unicode-oracle','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2024-03-20 09:58:38',34,'MARK_RAN','9:3a32bace77c84d7678d035a7f5a8084e','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'4.25.1',NULL,NULL,'0903506829'),('2.5.0-unicode-other-dbs','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2024-03-20 09:58:39',35,'EXECUTED','9:33d72168746f81f98ae3a1e8e0ca3554','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'4.25.1',NULL,NULL,'0903506829'),('2.5.0-duplicate-email-support','slawomir@dabek.name','META-INF/jpa-changelog-2.5.0.xml','2024-03-20 09:58:39',36,'EXECUTED','9:61b6d3d7a4c0e0024b0c839da283da0c','addColumn tableName=REALM','',NULL,'4.25.1',NULL,NULL,'0903506829'),('2.5.0-unique-group-names','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2024-03-20 09:58:39',37,'EXECUTED','9:8dcac7bdf7378e7d823cdfddebf72fda','addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'4.25.1',NULL,NULL,'0903506829'),('2.5.1','bburke@redhat.com','META-INF/jpa-changelog-2.5.1.xml','2024-03-20 09:58:39',38,'EXECUTED','9:a2b870802540cb3faa72098db5388af3','addColumn tableName=FED_USER_CONSENT','',NULL,'4.25.1',NULL,NULL,'0903506829'),('3.0.0','bburke@redhat.com','META-INF/jpa-changelog-3.0.0.xml','2024-03-20 09:58:39',39,'EXECUTED','9:132a67499ba24bcc54fb5cbdcfe7e4c0','addColumn tableName=IDENTITY_PROVIDER','',NULL,'4.25.1',NULL,NULL,'0903506829'),('3.2.0-fix','keycloak','META-INF/jpa-changelog-3.2.0.xml','2024-03-20 09:58:39',40,'MARK_RAN','9:938f894c032f5430f2b0fafb1a243462','addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS','',NULL,'4.25.1',NULL,NULL,'0903506829'),('3.2.0-fix-with-keycloak-5416','keycloak','META-INF/jpa-changelog-3.2.0.xml','2024-03-20 09:58:39',41,'MARK_RAN','9:845c332ff1874dc5d35974b0babf3006','dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS','',NULL,'4.25.1',NULL,NULL,'0903506829'),('3.2.0-fix-offline-sessions','hmlnarik','META-INF/jpa-changelog-3.2.0.xml','2024-03-20 09:58:39',42,'EXECUTED','9:fc86359c079781adc577c5a217e4d04c','customChange','',NULL,'4.25.1',NULL,NULL,'0903506829'),('3.2.0-fixed','keycloak','META-INF/jpa-changelog-3.2.0.xml','2024-03-20 09:58:40',43,'EXECUTED','9:59a64800e3c0d09b825f8a3b444fa8f4','addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...','',NULL,'4.25.1',NULL,NULL,'0903506829'),('3.3.0','keycloak','META-INF/jpa-changelog-3.3.0.xml','2024-03-20 09:58:40',44,'EXECUTED','9:d48d6da5c6ccf667807f633fe489ce88','addColumn tableName=USER_ENTITY','',NULL,'4.25.1',NULL,NULL,'0903506829'),('authz-3.4.0.CR1-resource-server-pk-change-part1','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2024-03-20 09:58:40',45,'EXECUTED','9:dde36f7973e80d71fceee683bc5d2951','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE','',NULL,'4.25.1',NULL,NULL,'0903506829'),('authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2024-03-20 09:58:40',46,'EXECUTED','9:b855e9b0a406b34fa323235a0cf4f640','customChange','',NULL,'4.25.1',NULL,NULL,'0903506829'),('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2024-03-20 09:58:40',47,'MARK_RAN','9:51abbacd7b416c50c4421a8cabf7927e','dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE','',NULL,'4.25.1',NULL,NULL,'0903506829'),('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2024-03-20 09:58:41',48,'EXECUTED','9:bdc99e567b3398bac83263d375aad143','addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...','',NULL,'4.25.1',NULL,NULL,'0903506829'),('authn-3.4.0.CR1-refresh-token-max-reuse','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2024-03-20 09:58:41',49,'EXECUTED','9:d198654156881c46bfba39abd7769e69','addColumn tableName=REALM','',NULL,'4.25.1',NULL,NULL,'0903506829'),('3.4.0','keycloak','META-INF/jpa-changelog-3.4.0.xml','2024-03-20 09:58:43',50,'EXECUTED','9:cfdd8736332ccdd72c5256ccb42335db','addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...','',NULL,'4.25.1',NULL,NULL,'0903506829'),('3.4.0-KEYCLOAK-5230','hmlnarik@redhat.com','META-INF/jpa-changelog-3.4.0.xml','2024-03-20 09:58:43',51,'EXECUTED','9:7c84de3d9bd84d7f077607c1a4dcb714','createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...','',NULL,'4.25.1',NULL,NULL,'0903506829'),('3.4.1','psilva@redhat.com','META-INF/jpa-changelog-3.4.1.xml','2024-03-20 09:58:43',52,'EXECUTED','9:5a6bb36cbefb6a9d6928452c0852af2d','modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.25.1',NULL,NULL,'0903506829'),('3.4.2','keycloak','META-INF/jpa-changelog-3.4.2.xml','2024-03-20 09:58:43',53,'EXECUTED','9:8f23e334dbc59f82e0a328373ca6ced0','update tableName=REALM','',NULL,'4.25.1',NULL,NULL,'0903506829'),('3.4.2-KEYCLOAK-5172','mkanis@redhat.com','META-INF/jpa-changelog-3.4.2.xml','2024-03-20 09:58:43',54,'EXECUTED','9:9156214268f09d970cdf0e1564d866af','update tableName=CLIENT','',NULL,'4.25.1',NULL,NULL,'0903506829'),('4.0.0-KEYCLOAK-6335','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2024-03-20 09:58:43',55,'EXECUTED','9:db806613b1ed154826c02610b7dbdf74','createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS','',NULL,'4.25.1',NULL,NULL,'0903506829'),('4.0.0-CLEANUP-UNUSED-TABLE','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2024-03-20 09:58:43',56,'EXECUTED','9:229a041fb72d5beac76bb94a5fa709de','dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING','',NULL,'4.25.1',NULL,NULL,'0903506829'),('4.0.0-KEYCLOAK-6228','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2024-03-20 09:58:43',57,'EXECUTED','9:079899dade9c1e683f26b2aa9ca6ff04','dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...','',NULL,'4.25.1',NULL,NULL,'0903506829'),('4.0.0-KEYCLOAK-5579-fixed','mposolda@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2024-03-20 09:58:44',58,'EXECUTED','9:139b79bcbbfe903bb1c2d2a4dbf001d9','dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...','',NULL,'4.25.1',NULL,NULL,'0903506829'),('authz-4.0.0.CR1','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.CR1.xml','2024-03-20 09:58:45',59,'EXECUTED','9:b55738ad889860c625ba2bf483495a04','createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...','',NULL,'4.25.1',NULL,NULL,'0903506829'),('authz-4.0.0.Beta3','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.Beta3.xml','2024-03-20 09:58:45',60,'EXECUTED','9:e0057eac39aa8fc8e09ac6cfa4ae15fe','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY','',NULL,'4.25.1',NULL,NULL,'0903506829'),('authz-4.2.0.Final','mhajas@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2024-03-20 09:58:45',61,'EXECUTED','9:42a33806f3a0443fe0e7feeec821326c','createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...','',NULL,'4.25.1',NULL,NULL,'0903506829'),('authz-4.2.0.Final-KEYCLOAK-9944','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2024-03-20 09:58:45',62,'EXECUTED','9:9968206fca46eecc1f51db9c024bfe56','addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS','',NULL,'4.25.1',NULL,NULL,'0903506829'),('4.2.0-KEYCLOAK-6313','wadahiro@gmail.com','META-INF/jpa-changelog-4.2.0.xml','2024-03-20 09:58:45',63,'EXECUTED','9:92143a6daea0a3f3b8f598c97ce55c3d','addColumn tableName=REQUIRED_ACTION_PROVIDER','',NULL,'4.25.1',NULL,NULL,'0903506829'),('4.3.0-KEYCLOAK-7984','wadahiro@gmail.com','META-INF/jpa-changelog-4.3.0.xml','2024-03-20 09:58:45',64,'EXECUTED','9:82bab26a27195d889fb0429003b18f40','update tableName=REQUIRED_ACTION_PROVIDER','',NULL,'4.25.1',NULL,NULL,'0903506829'),('4.6.0-KEYCLOAK-7950','psilva@redhat.com','META-INF/jpa-changelog-4.6.0.xml','2024-03-20 09:58:45',65,'EXECUTED','9:e590c88ddc0b38b0ae4249bbfcb5abc3','update tableName=RESOURCE_SERVER_RESOURCE','',NULL,'4.25.1',NULL,NULL,'0903506829'),('4.6.0-KEYCLOAK-8377','keycloak','META-INF/jpa-changelog-4.6.0.xml','2024-03-20 09:58:45',66,'EXECUTED','9:5c1f475536118dbdc38d5d7977950cc0','createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...','',NULL,'4.25.1',NULL,NULL,'0903506829'),('4.6.0-KEYCLOAK-8555','gideonray@gmail.com','META-INF/jpa-changelog-4.6.0.xml','2024-03-20 09:58:45',67,'EXECUTED','9:e7c9f5f9c4d67ccbbcc215440c718a17','createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT','',NULL,'4.25.1',NULL,NULL,'0903506829'),('4.7.0-KEYCLOAK-1267','sguilhen@redhat.com','META-INF/jpa-changelog-4.7.0.xml','2024-03-20 09:58:45',68,'EXECUTED','9:88e0bfdda924690d6f4e430c53447dd5','addColumn tableName=REALM','',NULL,'4.25.1',NULL,NULL,'0903506829'),('4.7.0-KEYCLOAK-7275','keycloak','META-INF/jpa-changelog-4.7.0.xml','2024-03-20 09:58:45',69,'EXECUTED','9:f53177f137e1c46b6a88c59ec1cb5218','renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...','',NULL,'4.25.1',NULL,NULL,'0903506829'),('4.8.0-KEYCLOAK-8835','sguilhen@redhat.com','META-INF/jpa-changelog-4.8.0.xml','2024-03-20 09:58:46',70,'EXECUTED','9:a74d33da4dc42a37ec27121580d1459f','addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM','',NULL,'4.25.1',NULL,NULL,'0903506829'),('authz-7.0.0-KEYCLOAK-10443','psilva@redhat.com','META-INF/jpa-changelog-authz-7.0.0.xml','2024-03-20 09:58:46',71,'EXECUTED','9:fd4ade7b90c3b67fae0bfcfcb42dfb5f','addColumn tableName=RESOURCE_SERVER','',NULL,'4.25.1',NULL,NULL,'0903506829'),('8.0.0-adding-credential-columns','keycloak','META-INF/jpa-changelog-8.0.0.xml','2024-03-20 09:58:46',72,'EXECUTED','9:aa072ad090bbba210d8f18781b8cebf4','addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL','',NULL,'4.25.1',NULL,NULL,'0903506829'),('8.0.0-updating-credential-data-not-oracle-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2024-03-20 09:58:46',73,'EXECUTED','9:1ae6be29bab7c2aa376f6983b932be37','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'4.25.1',NULL,NULL,'0903506829'),('8.0.0-updating-credential-data-oracle-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2024-03-20 09:58:46',74,'MARK_RAN','9:14706f286953fc9a25286dbd8fb30d97','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'4.25.1',NULL,NULL,'0903506829'),('8.0.0-credential-cleanup-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2024-03-20 09:58:46',75,'EXECUTED','9:2b9cc12779be32c5b40e2e67711a218b','dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...','',NULL,'4.25.1',NULL,NULL,'0903506829'),('8.0.0-resource-tag-support','keycloak','META-INF/jpa-changelog-8.0.0.xml','2024-03-20 09:58:46',76,'EXECUTED','9:91fa186ce7a5af127a2d7a91ee083cc5','addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL','',NULL,'4.25.1',NULL,NULL,'0903506829'),('9.0.0-always-display-client','keycloak','META-INF/jpa-changelog-9.0.0.xml','2024-03-20 09:58:46',77,'EXECUTED','9:6335e5c94e83a2639ccd68dd24e2e5ad','addColumn tableName=CLIENT','',NULL,'4.25.1',NULL,NULL,'0903506829'),('9.0.0-drop-constraints-for-column-increase','keycloak','META-INF/jpa-changelog-9.0.0.xml','2024-03-20 09:58:46',78,'MARK_RAN','9:6bdb5658951e028bfe16fa0a8228b530','dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...','',NULL,'4.25.1',NULL,NULL,'0903506829'),('9.0.0-increase-column-size-federated-fk','keycloak','META-INF/jpa-changelog-9.0.0.xml','2024-03-20 09:58:47',79,'EXECUTED','9:d5bc15a64117ccad481ce8792d4c608f','modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...','',NULL,'4.25.1',NULL,NULL,'0903506829'),('9.0.0-recreate-constraints-after-column-increase','keycloak','META-INF/jpa-changelog-9.0.0.xml','2024-03-20 09:58:47',80,'MARK_RAN','9:077cba51999515f4d3e7ad5619ab592c','addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...','',NULL,'4.25.1',NULL,NULL,'0903506829'),('9.0.1-add-index-to-client.client_id','keycloak','META-INF/jpa-changelog-9.0.1.xml','2024-03-20 09:58:47',81,'EXECUTED','9:be969f08a163bf47c6b9e9ead8ac2afb','createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT','',NULL,'4.25.1',NULL,NULL,'0903506829'),('9.0.1-KEYCLOAK-12579-drop-constraints','keycloak','META-INF/jpa-changelog-9.0.1.xml','2024-03-20 09:58:47',82,'MARK_RAN','9:6d3bb4408ba5a72f39bd8a0b301ec6e3','dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'4.25.1',NULL,NULL,'0903506829'),('9.0.1-KEYCLOAK-12579-add-not-null-constraint','keycloak','META-INF/jpa-changelog-9.0.1.xml','2024-03-20 09:58:47',83,'EXECUTED','9:966bda61e46bebf3cc39518fbed52fa7','addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP','',NULL,'4.25.1',NULL,NULL,'0903506829'),('9.0.1-KEYCLOAK-12579-recreate-constraints','keycloak','META-INF/jpa-changelog-9.0.1.xml','2024-03-20 09:58:47',84,'MARK_RAN','9:8dcac7bdf7378e7d823cdfddebf72fda','addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'4.25.1',NULL,NULL,'0903506829'),('9.0.1-add-index-to-events','keycloak','META-INF/jpa-changelog-9.0.1.xml','2024-03-20 09:58:47',85,'EXECUTED','9:7d93d602352a30c0c317e6a609b56599','createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY','',NULL,'4.25.1',NULL,NULL,'0903506829'),('map-remove-ri','keycloak','META-INF/jpa-changelog-11.0.0.xml','2024-03-20 09:58:47',86,'EXECUTED','9:71c5969e6cdd8d7b6f47cebc86d37627','dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9','',NULL,'4.25.1',NULL,NULL,'0903506829'),('map-remove-ri','keycloak','META-INF/jpa-changelog-12.0.0.xml','2024-03-20 09:58:47',87,'EXECUTED','9:a9ba7d47f065f041b7da856a81762021','dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...','',NULL,'4.25.1',NULL,NULL,'0903506829'),('12.1.0-add-realm-localization-table','keycloak','META-INF/jpa-changelog-12.0.0.xml','2024-03-20 09:58:47',88,'EXECUTED','9:fffabce2bc01e1a8f5110d5278500065','createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS','',NULL,'4.25.1',NULL,NULL,'0903506829'),('default-roles','keycloak','META-INF/jpa-changelog-13.0.0.xml','2024-03-20 09:58:47',89,'EXECUTED','9:fa8a5b5445e3857f4b010bafb5009957','addColumn tableName=REALM; customChange','',NULL,'4.25.1',NULL,NULL,'0903506829'),('default-roles-cleanup','keycloak','META-INF/jpa-changelog-13.0.0.xml','2024-03-20 09:58:47',90,'EXECUTED','9:67ac3241df9a8582d591c5ed87125f39','dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES','',NULL,'4.25.1',NULL,NULL,'0903506829'),('13.0.0-KEYCLOAK-16844','keycloak','META-INF/jpa-changelog-13.0.0.xml','2024-03-20 09:58:47',91,'EXECUTED','9:ad1194d66c937e3ffc82386c050ba089','createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION','',NULL,'4.25.1',NULL,NULL,'0903506829'),('map-remove-ri-13.0.0','keycloak','META-INF/jpa-changelog-13.0.0.xml','2024-03-20 09:58:47',92,'EXECUTED','9:d9be619d94af5a2f5d07b9f003543b91','dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...','',NULL,'4.25.1',NULL,NULL,'0903506829'),('13.0.0-KEYCLOAK-17992-drop-constraints','keycloak','META-INF/jpa-changelog-13.0.0.xml','2024-03-20 09:58:47',93,'MARK_RAN','9:544d201116a0fcc5a5da0925fbbc3bde','dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT','',NULL,'4.25.1',NULL,NULL,'0903506829'),('13.0.0-increase-column-size-federated','keycloak','META-INF/jpa-changelog-13.0.0.xml','2024-03-20 09:58:48',94,'EXECUTED','9:43c0c1055b6761b4b3e89de76d612ccf','modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT','',NULL,'4.25.1',NULL,NULL,'0903506829'),('13.0.0-KEYCLOAK-17992-recreate-constraints','keycloak','META-INF/jpa-changelog-13.0.0.xml','2024-03-20 09:58:48',95,'MARK_RAN','9:8bd711fd0330f4fe980494ca43ab1139','addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...','',NULL,'4.25.1',NULL,NULL,'0903506829'),('json-string-accomodation-fixed','keycloak','META-INF/jpa-changelog-13.0.0.xml','2024-03-20 09:58:48',96,'EXECUTED','9:e07d2bc0970c348bb06fb63b1f82ddbf','addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE','',NULL,'4.25.1',NULL,NULL,'0903506829'),('14.0.0-KEYCLOAK-11019','keycloak','META-INF/jpa-changelog-14.0.0.xml','2024-03-20 09:58:48',97,'EXECUTED','9:24fb8611e97f29989bea412aa38d12b7','createIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USER, tableName=OFFLINE_USER_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION','',NULL,'4.25.1',NULL,NULL,'0903506829'),('14.0.0-KEYCLOAK-18286','keycloak','META-INF/jpa-changelog-14.0.0.xml','2024-03-20 09:58:48',98,'MARK_RAN','9:259f89014ce2506ee84740cbf7163aa7','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.25.1',NULL,NULL,'0903506829'),('14.0.0-KEYCLOAK-18286-revert','keycloak','META-INF/jpa-changelog-14.0.0.xml','2024-03-20 09:58:48',99,'MARK_RAN','9:04baaf56c116ed19951cbc2cca584022','dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.25.1',NULL,NULL,'0903506829'),('14.0.0-KEYCLOAK-18286-supported-dbs','keycloak','META-INF/jpa-changelog-14.0.0.xml','2024-03-20 09:58:48',100,'EXECUTED','9:bd2bd0fc7768cf0845ac96a8786fa735','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.25.1',NULL,NULL,'0903506829'),('14.0.0-KEYCLOAK-18286-unsupported-dbs','keycloak','META-INF/jpa-changelog-14.0.0.xml','2024-03-20 09:58:48',101,'MARK_RAN','9:d3d977031d431db16e2c181ce49d73e9','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.25.1',NULL,NULL,'0903506829'),('KEYCLOAK-17267-add-index-to-user-attributes','keycloak','META-INF/jpa-changelog-14.0.0.xml','2024-03-20 09:58:48',102,'EXECUTED','9:0b305d8d1277f3a89a0a53a659ad274c','createIndex indexName=IDX_USER_ATTRIBUTE_NAME, tableName=USER_ATTRIBUTE','',NULL,'4.25.1',NULL,NULL,'0903506829'),('KEYCLOAK-18146-add-saml-art-binding-identifier','keycloak','META-INF/jpa-changelog-14.0.0.xml','2024-03-20 09:58:48',103,'EXECUTED','9:2c374ad2cdfe20e2905a84c8fac48460','customChange','',NULL,'4.25.1',NULL,NULL,'0903506829'),('15.0.0-KEYCLOAK-18467','keycloak','META-INF/jpa-changelog-15.0.0.xml','2024-03-20 09:58:48',104,'EXECUTED','9:47a760639ac597360a8219f5b768b4de','addColumn tableName=REALM_LOCALIZATIONS; update tableName=REALM_LOCALIZATIONS; dropColumn columnName=TEXTS, tableName=REALM_LOCALIZATIONS; renameColumn newColumnName=TEXTS, oldColumnName=TEXTS_NEW, tableName=REALM_LOCALIZATIONS; addNotNullConstrai...','',NULL,'4.25.1',NULL,NULL,'0903506829'),('17.0.0-9562','keycloak','META-INF/jpa-changelog-17.0.0.xml','2024-03-20 09:58:48',105,'EXECUTED','9:a6272f0576727dd8cad2522335f5d99e','createIndex indexName=IDX_USER_SERVICE_ACCOUNT, tableName=USER_ENTITY','',NULL,'4.25.1',NULL,NULL,'0903506829'),('18.0.0-10625-IDX_ADMIN_EVENT_TIME','keycloak','META-INF/jpa-changelog-18.0.0.xml','2024-03-20 09:58:48',106,'EXECUTED','9:015479dbd691d9cc8669282f4828c41d','createIndex indexName=IDX_ADMIN_EVENT_TIME, tableName=ADMIN_EVENT_ENTITY','',NULL,'4.25.1',NULL,NULL,'0903506829'),('19.0.0-10135','keycloak','META-INF/jpa-changelog-19.0.0.xml','2024-03-20 09:58:48',107,'EXECUTED','9:9518e495fdd22f78ad6425cc30630221','customChange','',NULL,'4.25.1',NULL,NULL,'0903506829'),('20.0.0-12964-supported-dbs','keycloak','META-INF/jpa-changelog-20.0.0.xml','2024-03-20 09:58:48',108,'EXECUTED','9:f2e1331a71e0aa85e5608fe42f7f681c','createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE','',NULL,'4.25.1',NULL,NULL,'0903506829'),('20.0.0-12964-unsupported-dbs','keycloak','META-INF/jpa-changelog-20.0.0.xml','2024-03-20 09:58:48',109,'MARK_RAN','9:1a6fcaa85e20bdeae0a9ce49b41946a5','createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE','',NULL,'4.25.1',NULL,NULL,'0903506829'),('client-attributes-string-accomodation-fixed','keycloak','META-INF/jpa-changelog-20.0.0.xml','2024-03-20 09:58:48',110,'EXECUTED','9:3f332e13e90739ed0c35b0b25b7822ca','addColumn tableName=CLIENT_ATTRIBUTES; update tableName=CLIENT_ATTRIBUTES; dropColumn columnName=VALUE, tableName=CLIENT_ATTRIBUTES; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=CLIENT_ATTRIBUTES','',NULL,'4.25.1',NULL,NULL,'0903506829'),('21.0.2-17277','keycloak','META-INF/jpa-changelog-21.0.2.xml','2024-03-20 09:58:48',111,'EXECUTED','9:7ee1f7a3fb8f5588f171fb9a6ab623c0','customChange','',NULL,'4.25.1',NULL,NULL,'0903506829'),('21.1.0-19404','keycloak','META-INF/jpa-changelog-21.1.0.xml','2024-03-20 09:58:48',112,'EXECUTED','9:3d7e830b52f33676b9d64f7f2b2ea634','modifyDataType columnName=DECISION_STRATEGY, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=LOGIC, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=POLICY_ENFORCE_MODE, tableName=RESOURCE_SERVER','',NULL,'4.25.1',NULL,NULL,'0903506829'),('21.1.0-19404-2','keycloak','META-INF/jpa-changelog-21.1.0.xml','2024-03-20 09:58:48',113,'MARK_RAN','9:627d032e3ef2c06c0e1f73d2ae25c26c','addColumn tableName=RESOURCE_SERVER_POLICY; update tableName=RESOURCE_SERVER_POLICY; dropColumn columnName=DECISION_STRATEGY, tableName=RESOURCE_SERVER_POLICY; renameColumn newColumnName=DECISION_STRATEGY, oldColumnName=DECISION_STRATEGY_NEW, tabl...','',NULL,'4.25.1',NULL,NULL,'0903506829'),('22.0.0-17484-updated','keycloak','META-INF/jpa-changelog-22.0.0.xml','2024-03-20 09:58:48',114,'EXECUTED','9:90af0bfd30cafc17b9f4d6eccd92b8b3','customChange','',NULL,'4.25.1',NULL,NULL,'0903506829'),('22.0.5-24031','keycloak','META-INF/jpa-changelog-22.0.0.xml','2024-03-20 09:58:48',115,'MARK_RAN','9:a60d2d7b315ec2d3eba9e2f145f9df28','customChange','',NULL,'4.25.1',NULL,NULL,'0903506829'),('23.0.0-12062','keycloak','META-INF/jpa-changelog-23.0.0.xml','2024-03-20 09:58:48',116,'EXECUTED','9:2168fbe728fec46ae9baf15bf80927b8','addColumn tableName=COMPONENT_CONFIG; update tableName=COMPONENT_CONFIG; dropColumn columnName=VALUE, tableName=COMPONENT_CONFIG; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=COMPONENT_CONFIG','',NULL,'4.25.1',NULL,NULL,'0903506829'),('23.0.0-17258','keycloak','META-INF/jpa-changelog-23.0.0.xml','2024-03-20 09:58:48',117,'EXECUTED','9:36506d679a83bbfda85a27ea1864dca8','addColumn tableName=EVENT_ENTITY','',NULL,'4.25.1',NULL,NULL,'0903506829'),('24.0.0-9758','keycloak','META-INF/jpa-changelog-24.0.0.xml','2024-03-20 09:58:48',118,'EXECUTED','9:502c557a5189f600f0f445a9b49ebbce','addColumn tableName=USER_ATTRIBUTE; addColumn tableName=FED_USER_ATTRIBUTE; createIndex indexName=USER_ATTR_LONG_VALUES, tableName=USER_ATTRIBUTE; createIndex indexName=FED_USER_ATTR_LONG_VALUES, tableName=FED_USER_ATTRIBUTE; createIndex indexName...','',NULL,'4.25.1',NULL,NULL,'0903506829'),('24.0.0-9758-2','keycloak','META-INF/jpa-changelog-24.0.0.xml','2024-03-20 09:58:48',119,'EXECUTED','9:bf0fdee10afdf597a987adbf291db7b2','customChange','',NULL,'4.25.1',NULL,NULL,'0903506829'),('24.0.0-26618-drop-index-if-present','keycloak','META-INF/jpa-changelog-24.0.0.xml','2024-03-20 09:58:48',120,'EXECUTED','9:04baaf56c116ed19951cbc2cca584022','dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.25.1',NULL,NULL,'0903506829'),('24.0.0-26618-reindex','keycloak','META-INF/jpa-changelog-24.0.0.xml','2024-03-20 09:58:48',121,'EXECUTED','9:bd2bd0fc7768cf0845ac96a8786fa735','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.25.1',NULL,NULL,'0903506829');
/*!40000 ALTER TABLE `databasechangelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `databasechangeloglock`
--

DROP TABLE IF EXISTS `databasechangeloglock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `databasechangeloglock` (
  `ID` int NOT NULL,
  `LOCKED` tinyint NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `databasechangeloglock`
--

LOCK TABLES `databasechangeloglock` WRITE;
/*!40000 ALTER TABLE `databasechangeloglock` DISABLE KEYS */;
INSERT INTO `databasechangeloglock` VALUES (1,0,NULL,NULL),(1000,0,NULL,NULL),(1001,0,NULL,NULL);
/*!40000 ALTER TABLE `databasechangeloglock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_client_scope`
--

DROP TABLE IF EXISTS `default_client_scope`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `default_client_scope` (
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SCOPE_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DEFAULT_SCOPE` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`REALM_ID`,`SCOPE_ID`),
  KEY `IDX_DEFCLS_REALM` (`REALM_ID`),
  KEY `IDX_DEFCLS_SCOPE` (`SCOPE_ID`),
  CONSTRAINT `FK_R_DEF_CLI_SCOPE_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_client_scope`
--

LOCK TABLES `default_client_scope` WRITE;
/*!40000 ALTER TABLE `default_client_scope` DISABLE KEYS */;
INSERT INTO `default_client_scope` VALUES ('0245a4ff-801f-41e9-9805-a700847ddf88','0ae304fd-6ae9-435a-973e-5a13dec0300c',0),('0245a4ff-801f-41e9-9805-a700847ddf88','63d791fb-2105-4527-ad84-3e92c5b5de13',0),('0245a4ff-801f-41e9-9805-a700847ddf88','6cafd019-1d64-46d2-9db1-7ff694aaeaa7',1),('0245a4ff-801f-41e9-9805-a700847ddf88','8ea2b5e0-2d98-4237-835f-56a1b4aa0f0f',1),('0245a4ff-801f-41e9-9805-a700847ddf88','bd5348cd-6f57-4558-8e9f-2c5a184afb7e',1),('0245a4ff-801f-41e9-9805-a700847ddf88','c1842379-1e21-4eab-96cf-c9dc28d1ca42',1),('0245a4ff-801f-41e9-9805-a700847ddf88','d0221152-f017-47bc-a3a8-f1ea9687703c',0),('0245a4ff-801f-41e9-9805-a700847ddf88','d716c6b2-a331-476d-9631-384ab3810e75',0),('0245a4ff-801f-41e9-9805-a700847ddf88','ea55f021-67f6-4b61-8257-df177680597b',1),('0245a4ff-801f-41e9-9805-a700847ddf88','ecfe4f7e-8dda-45c6-9b8a-748a832d1970',1),('463f633d-c02e-4537-931f-fc87ef88ecdb','16d688f2-fdf3-441b-afff-0d1cc9a9891f',1),('463f633d-c02e-4537-931f-fc87ef88ecdb','590140a6-976e-4ea2-a5f3-a8841d544620',1),('463f633d-c02e-4537-931f-fc87ef88ecdb','6d3fd4e4-d5de-457c-b30e-25aa2ef73f19',1),('463f633d-c02e-4537-931f-fc87ef88ecdb','9708eecb-fdb4-4537-9bb0-383d1bcf11cc',0),('463f633d-c02e-4537-931f-fc87ef88ecdb','a3b0ccee-b5de-496a-bb76-745511b8c384',1),('463f633d-c02e-4537-931f-fc87ef88ecdb','bcf63c89-ff10-4bbd-bfea-33fda400b9b0',0),('463f633d-c02e-4537-931f-fc87ef88ecdb','c16fac63-0d2d-496c-abff-19d793d6029e',0),('463f633d-c02e-4537-931f-fc87ef88ecdb','c8991e6c-534e-4252-b718-7f8f3b40e179',1),('463f633d-c02e-4537-931f-fc87ef88ecdb','e5151208-a184-4dd0-b90b-c59412572378',1),('463f633d-c02e-4537-931f-fc87ef88ecdb','f4cfa3de-5764-456b-bbf4-5579fb3ed3f6',0),('e5a722b4-3b15-40ad-bf03-242dffaa63c2','0d037f7d-a8b3-4f39-8d03-867fe8241bd5',0),('e5a722b4-3b15-40ad-bf03-242dffaa63c2','0d76c208-71e4-4d15-9c15-ec03c772d5c9',1),('e5a722b4-3b15-40ad-bf03-242dffaa63c2','26b9dc88-6c81-4317-b8fa-27c11de60a69',0),('e5a722b4-3b15-40ad-bf03-242dffaa63c2','2806fa62-de59-4c71-b18a-21eb92067482',0),('e5a722b4-3b15-40ad-bf03-242dffaa63c2','487211fb-eb4c-4b9a-a650-fb3eea171a09',1),('e5a722b4-3b15-40ad-bf03-242dffaa63c2','53ad7090-9e64-48ca-8d5b-a8103dda2d37',1),('e5a722b4-3b15-40ad-bf03-242dffaa63c2','998b2464-1918-4790-b89e-c2bdb51c1d9a',0),('e5a722b4-3b15-40ad-bf03-242dffaa63c2','bc9f9b18-0f32-41f0-adff-abadc522ea0f',1),('e5a722b4-3b15-40ad-bf03-242dffaa63c2','c5a4950d-1cf3-4902-a9ea-fb644f79eeb2',1),('e5a722b4-3b15-40ad-bf03-242dffaa63c2','ff4960ec-81e4-4316-8e49-cbce998b1b72',1);
/*!40000 ALTER TABLE `default_client_scope` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_entity`
--

DROP TABLE IF EXISTS `event_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_entity` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CLIENT_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DETAILS_JSON` text COLLATE utf8mb4_unicode_ci,
  `ERROR` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `IP_ADDRESS` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SESSION_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EVENT_TIME` bigint DEFAULT NULL,
  `TYPE` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `USER_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DETAILS_JSON_LONG_VALUE` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  PRIMARY KEY (`ID`),
  KEY `IDX_EVENT_TIME` (`REALM_ID`,`EVENT_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_entity`
--

LOCK TABLES `event_entity` WRITE;
/*!40000 ALTER TABLE `event_entity` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fed_user_attribute`
--

DROP TABLE IF EXISTS `fed_user_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fed_user_attribute` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `USER_ID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `VALUE` text COLLATE utf8mb4_unicode_ci,
  `LONG_VALUE_HASH` binary(64) DEFAULT NULL,
  `LONG_VALUE_HASH_LOWER_CASE` binary(64) DEFAULT NULL,
  `LONG_VALUE` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_ATTRIBUTE` (`USER_ID`,`REALM_ID`,`NAME`),
  KEY `FED_USER_ATTR_LONG_VALUES` (`LONG_VALUE_HASH`,`NAME`),
  KEY `FED_USER_ATTR_LONG_VALUES_LOWER_CASE` (`LONG_VALUE_HASH_LOWER_CASE`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fed_user_attribute`
--

LOCK TABLES `fed_user_attribute` WRITE;
/*!40000 ALTER TABLE `fed_user_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `fed_user_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fed_user_consent`
--

DROP TABLE IF EXISTS `fed_user_consent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fed_user_consent` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CLIENT_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `USER_ID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `LAST_UPDATED_DATE` bigint DEFAULT NULL,
  `CLIENT_STORAGE_PROVIDER` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EXTERNAL_CLIENT_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_CONSENT` (`USER_ID`,`CLIENT_ID`),
  KEY `IDX_FU_CONSENT_RU` (`REALM_ID`,`USER_ID`),
  KEY `IDX_FU_CNSNT_EXT` (`USER_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fed_user_consent`
--

LOCK TABLES `fed_user_consent` WRITE;
/*!40000 ALTER TABLE `fed_user_consent` DISABLE KEYS */;
/*!40000 ALTER TABLE `fed_user_consent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fed_user_consent_cl_scope`
--

DROP TABLE IF EXISTS `fed_user_consent_cl_scope`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fed_user_consent_cl_scope` (
  `USER_CONSENT_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SCOPE_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`SCOPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fed_user_consent_cl_scope`
--

LOCK TABLES `fed_user_consent_cl_scope` WRITE;
/*!40000 ALTER TABLE `fed_user_consent_cl_scope` DISABLE KEYS */;
/*!40000 ALTER TABLE `fed_user_consent_cl_scope` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fed_user_credential`
--

DROP TABLE IF EXISTS `fed_user_credential`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fed_user_credential` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SALT` tinyblob,
  `TYPE` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `USER_ID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `USER_LABEL` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SECRET_DATA` longtext COLLATE utf8mb4_unicode_ci,
  `CREDENTIAL_DATA` longtext COLLATE utf8mb4_unicode_ci,
  `PRIORITY` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_CREDENTIAL` (`USER_ID`,`TYPE`),
  KEY `IDX_FU_CREDENTIAL_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fed_user_credential`
--

LOCK TABLES `fed_user_credential` WRITE;
/*!40000 ALTER TABLE `fed_user_credential` DISABLE KEYS */;
/*!40000 ALTER TABLE `fed_user_credential` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fed_user_group_membership`
--

DROP TABLE IF EXISTS `fed_user_group_membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fed_user_group_membership` (
  `GROUP_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `USER_ID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`GROUP_ID`,`USER_ID`),
  KEY `IDX_FU_GROUP_MEMBERSHIP` (`USER_ID`,`GROUP_ID`),
  KEY `IDX_FU_GROUP_MEMBERSHIP_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fed_user_group_membership`
--

LOCK TABLES `fed_user_group_membership` WRITE;
/*!40000 ALTER TABLE `fed_user_group_membership` DISABLE KEYS */;
/*!40000 ALTER TABLE `fed_user_group_membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fed_user_required_action`
--

DROP TABLE IF EXISTS `fed_user_required_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fed_user_required_action` (
  `REQUIRED_ACTION` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ' ',
  `USER_ID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`),
  KEY `IDX_FU_REQUIRED_ACTION` (`USER_ID`,`REQUIRED_ACTION`),
  KEY `IDX_FU_REQUIRED_ACTION_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fed_user_required_action`
--

LOCK TABLES `fed_user_required_action` WRITE;
/*!40000 ALTER TABLE `fed_user_required_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `fed_user_required_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fed_user_role_mapping`
--

DROP TABLE IF EXISTS `fed_user_role_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fed_user_role_mapping` (
  `ROLE_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `USER_ID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`,`USER_ID`),
  KEY `IDX_FU_ROLE_MAPPING` (`USER_ID`,`ROLE_ID`),
  KEY `IDX_FU_ROLE_MAPPING_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fed_user_role_mapping`
--

LOCK TABLES `fed_user_role_mapping` WRITE;
/*!40000 ALTER TABLE `fed_user_role_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `fed_user_role_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `federated_identity`
--

DROP TABLE IF EXISTS `federated_identity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `federated_identity` (
  `IDENTITY_PROVIDER` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FEDERATED_USER_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FEDERATED_USERNAME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TOKEN` text COLLATE utf8mb4_unicode_ci,
  `USER_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`),
  KEY `IDX_FEDIDENTITY_USER` (`USER_ID`),
  KEY `IDX_FEDIDENTITY_FEDUSER` (`FEDERATED_USER_ID`),
  CONSTRAINT `FK404288B92EF007A6` FOREIGN KEY (`USER_ID`) REFERENCES `user_entity` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `federated_identity`
--

LOCK TABLES `federated_identity` WRITE;
/*!40000 ALTER TABLE `federated_identity` DISABLE KEYS */;
/*!40000 ALTER TABLE `federated_identity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `federated_user`
--

DROP TABLE IF EXISTS `federated_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `federated_user` (
  `ID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `federated_user`
--

LOCK TABLES `federated_user` WRITE;
/*!40000 ALTER TABLE `federated_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `federated_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_attribute`
--

DROP TABLE IF EXISTS `group_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group_attribute` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sybase-needs-something-here',
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `GROUP_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_GROUP_ATTR_GROUP` (`GROUP_ID`),
  KEY `IDX_GROUP_ATT_BY_NAME_VALUE` (`NAME`,`VALUE`),
  CONSTRAINT `FK_GROUP_ATTRIBUTE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `keycloak_group` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_attribute`
--

LOCK TABLES `group_attribute` WRITE;
/*!40000 ALTER TABLE `group_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_role_mapping`
--

DROP TABLE IF EXISTS `group_role_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group_role_mapping` (
  `ROLE_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `GROUP_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`GROUP_ID`),
  KEY `IDX_GROUP_ROLE_MAPP_GROUP` (`GROUP_ID`),
  CONSTRAINT `FK_GROUP_ROLE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `keycloak_group` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_role_mapping`
--

LOCK TABLES `group_role_mapping` WRITE;
/*!40000 ALTER TABLE `group_role_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_role_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `identity_provider`
--

DROP TABLE IF EXISTS `identity_provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `identity_provider` (
  `INTERNAL_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ENABLED` tinyint NOT NULL DEFAULT '0',
  `PROVIDER_ALIAS` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PROVIDER_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `STORE_TOKEN` tinyint NOT NULL DEFAULT '0',
  `AUTHENTICATE_BY_DEFAULT` tinyint NOT NULL DEFAULT '0',
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ADD_TOKEN_ROLE` tinyint NOT NULL DEFAULT '1',
  `TRUST_EMAIL` tinyint NOT NULL DEFAULT '0',
  `FIRST_BROKER_LOGIN_FLOW_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `POST_BROKER_LOGIN_FLOW_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PROVIDER_DISPLAY_NAME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LINK_ONLY` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`INTERNAL_ID`),
  UNIQUE KEY `UK_2DAELWNIBJI49AVXSRTUF6XJ33` (`PROVIDER_ALIAS`,`REALM_ID`),
  KEY `IDX_IDENT_PROV_REALM` (`REALM_ID`),
  CONSTRAINT `FK2B4EBC52AE5C3B34` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `identity_provider`
--

LOCK TABLES `identity_provider` WRITE;
/*!40000 ALTER TABLE `identity_provider` DISABLE KEYS */;
/*!40000 ALTER TABLE `identity_provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `identity_provider_config`
--

DROP TABLE IF EXISTS `identity_provider_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `identity_provider_config` (
  `IDENTITY_PROVIDER_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` longtext COLLATE utf8mb4_unicode_ci,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER_ID`,`NAME`),
  CONSTRAINT `FKDC4897CF864C4E43` FOREIGN KEY (`IDENTITY_PROVIDER_ID`) REFERENCES `identity_provider` (`INTERNAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `identity_provider_config`
--

LOCK TABLES `identity_provider_config` WRITE;
/*!40000 ALTER TABLE `identity_provider_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `identity_provider_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `identity_provider_mapper`
--

DROP TABLE IF EXISTS `identity_provider_mapper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `identity_provider_mapper` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `IDP_ALIAS` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `IDP_MAPPER_NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ID_PROV_MAPP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_IDPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `identity_provider_mapper`
--

LOCK TABLES `identity_provider_mapper` WRITE;
/*!40000 ALTER TABLE `identity_provider_mapper` DISABLE KEYS */;
/*!40000 ALTER TABLE `identity_provider_mapper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `idp_mapper_config`
--

DROP TABLE IF EXISTS `idp_mapper_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `idp_mapper_config` (
  `IDP_MAPPER_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` longtext COLLATE utf8mb4_unicode_ci,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`IDP_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_IDPMCONFIG` FOREIGN KEY (`IDP_MAPPER_ID`) REFERENCES `identity_provider_mapper` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `idp_mapper_config`
--

LOCK TABLES `idp_mapper_config` WRITE;
/*!40000 ALTER TABLE `idp_mapper_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `idp_mapper_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `keycloak_group`
--

DROP TABLE IF EXISTS `keycloak_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keycloak_group` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `PARENT_GROUP` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `SIBLING_NAMES` (`REALM_ID`,`PARENT_GROUP`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `keycloak_group`
--

LOCK TABLES `keycloak_group` WRITE;
/*!40000 ALTER TABLE `keycloak_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `keycloak_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `keycloak_role`
--

DROP TABLE IF EXISTS `keycloak_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keycloak_role` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CLIENT_REALM_CONSTRAINT` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CLIENT_ROLE` tinyint DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `REALM_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CLIENT` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REALM` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_J3RWUVD56ONTGSUHOGM184WW2-2` (`NAME`,`CLIENT_REALM_CONSTRAINT`),
  KEY `IDX_KEYCLOAK_ROLE_CLIENT` (`CLIENT`),
  KEY `IDX_KEYCLOAK_ROLE_REALM` (`REALM`),
  CONSTRAINT `FK_6VYQFE4CN4WLQ8R6KT5VDSJ5C` FOREIGN KEY (`REALM`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `keycloak_role`
--

LOCK TABLES `keycloak_role` WRITE;
/*!40000 ALTER TABLE `keycloak_role` DISABLE KEYS */;
INSERT INTO `keycloak_role` VALUES ('02c6fdc1-abfd-437c-9369-6220e22c557f','7ad9bf4d-fbfc-4678-b78c-e6a999956eed',1,'${role_view-authorization}','view-authorization','463f633d-c02e-4537-931f-fc87ef88ecdb','7ad9bf4d-fbfc-4678-b78c-e6a999956eed',NULL),('0524929c-e444-46d8-89c2-26e13a157399','528cf47d-0d61-47bc-96ad-2363849ae6d4',1,'${role_view-profile}','view-profile','463f633d-c02e-4537-931f-fc87ef88ecdb','528cf47d-0d61-47bc-96ad-2363849ae6d4',NULL),('055bf001-5eee-4bc5-89ef-069ee8ea39fc','c10ec634-a81f-4355-b749-d99c902f0897',1,'${role_view-clients}','view-clients','463f633d-c02e-4537-931f-fc87ef88ecdb','c10ec634-a81f-4355-b749-d99c902f0897',NULL),('074b7e7a-3ba8-44e7-8134-313a2db3c95f','7ad9bf4d-fbfc-4678-b78c-e6a999956eed',1,'${role_view-users}','view-users','463f633d-c02e-4537-931f-fc87ef88ecdb','7ad9bf4d-fbfc-4678-b78c-e6a999956eed',NULL),('07bbf8c9-9916-4d8c-8789-787590b874b6','6eb15bc4-6445-44ba-8545-24f1ab6d28b1',1,'${role_manage-events}','manage-events','0245a4ff-801f-41e9-9805-a700847ddf88','6eb15bc4-6445-44ba-8545-24f1ab6d28b1',NULL),('08730317-09db-4b32-8c72-a2e46b0d9321','6eb15bc4-6445-44ba-8545-24f1ab6d28b1',1,'${role_manage-clients}','manage-clients','0245a4ff-801f-41e9-9805-a700847ddf88','6eb15bc4-6445-44ba-8545-24f1ab6d28b1',NULL),('0cee371a-426c-4929-8547-bda1888246c8','c10ec634-a81f-4355-b749-d99c902f0897',1,'${role_view-users}','view-users','463f633d-c02e-4537-931f-fc87ef88ecdb','c10ec634-a81f-4355-b749-d99c902f0897',NULL),('0e96596a-e8f6-4446-88af-9cf842ec81bf','f99210e7-f0a1-4361-b206-599469e91e2e',1,'${role_query-users}','query-users','e5a722b4-3b15-40ad-bf03-242dffaa63c2','f99210e7-f0a1-4361-b206-599469e91e2e',NULL),('0f28cf68-2d23-4821-9339-d9cfda1a8db8','6eb15bc4-6445-44ba-8545-24f1ab6d28b1',1,'${role_view-authorization}','view-authorization','0245a4ff-801f-41e9-9805-a700847ddf88','6eb15bc4-6445-44ba-8545-24f1ab6d28b1',NULL),('0f796070-3a96-4270-8803-2e136a3d5e20','c10ec634-a81f-4355-b749-d99c902f0897',1,'${role_manage-clients}','manage-clients','463f633d-c02e-4537-931f-fc87ef88ecdb','c10ec634-a81f-4355-b749-d99c902f0897',NULL),('14deb92a-5bec-459d-bb04-a93ccde8225e','e5a722b4-3b15-40ad-bf03-242dffaa63c2',0,'${role_offline-access}','offline_access','e5a722b4-3b15-40ad-bf03-242dffaa63c2',NULL,NULL),('169e4090-90e5-434f-89b0-084f398016b9','459679dc-48b0-4ced-8b8b-5a5b6dc073ad',1,'${role_create-client}','create-client','463f633d-c02e-4537-931f-fc87ef88ecdb','459679dc-48b0-4ced-8b8b-5a5b6dc073ad',NULL),('18e1b6ab-5e3c-4b1f-bbc0-35473d5efd9d','459679dc-48b0-4ced-8b8b-5a5b6dc073ad',1,'${role_manage-realm}','manage-realm','463f633d-c02e-4537-931f-fc87ef88ecdb','459679dc-48b0-4ced-8b8b-5a5b6dc073ad',NULL),('1a1c5108-9a1e-4812-b290-637898980ae3','673ee5f7-a053-453c-8bed-13d5daad356d',1,NULL,'uma_protection','0245a4ff-801f-41e9-9805-a700847ddf88','673ee5f7-a053-453c-8bed-13d5daad356d',NULL),('1aba9390-7088-4caf-bb9e-dce892f7adb5','459679dc-48b0-4ced-8b8b-5a5b6dc073ad',1,'${role_query-realms}','query-realms','463f633d-c02e-4537-931f-fc87ef88ecdb','459679dc-48b0-4ced-8b8b-5a5b6dc073ad',NULL),('2057d046-ba32-4f45-bdca-fb54a12b329e','6eb15bc4-6445-44ba-8545-24f1ab6d28b1',1,'${role_view-clients}','view-clients','0245a4ff-801f-41e9-9805-a700847ddf88','6eb15bc4-6445-44ba-8545-24f1ab6d28b1',NULL),('22a8972e-a2ef-4b40-b8b5-a57ea9c3966a','6eb15bc4-6445-44ba-8545-24f1ab6d28b1',1,'${role_query-clients}','query-clients','0245a4ff-801f-41e9-9805-a700847ddf88','6eb15bc4-6445-44ba-8545-24f1ab6d28b1',NULL),('23ba9811-f8b5-4e98-8db9-b719f03f0c2d','6eb15bc4-6445-44ba-8545-24f1ab6d28b1',1,'${role_realm-admin}','realm-admin','0245a4ff-801f-41e9-9805-a700847ddf88','6eb15bc4-6445-44ba-8545-24f1ab6d28b1',NULL),('246a166b-d233-4f83-a69e-827580bccdf7','459679dc-48b0-4ced-8b8b-5a5b6dc073ad',1,'${role_manage-users}','manage-users','463f633d-c02e-4537-931f-fc87ef88ecdb','459679dc-48b0-4ced-8b8b-5a5b6dc073ad',NULL),('257887fc-827d-4f01-b007-0847605461b9','c10ec634-a81f-4355-b749-d99c902f0897',1,'${role_manage-identity-providers}','manage-identity-providers','463f633d-c02e-4537-931f-fc87ef88ecdb','c10ec634-a81f-4355-b749-d99c902f0897',NULL),('26e608ca-eec0-42e3-97f9-c279044c07f4','f99210e7-f0a1-4361-b206-599469e91e2e',1,'${role_query-clients}','query-clients','e5a722b4-3b15-40ad-bf03-242dffaa63c2','f99210e7-f0a1-4361-b206-599469e91e2e',NULL),('28eecd89-3f0c-4c22-a4df-e170ac2d5eb2','7ad9bf4d-fbfc-4678-b78c-e6a999956eed',1,'${role_view-identity-providers}','view-identity-providers','463f633d-c02e-4537-931f-fc87ef88ecdb','7ad9bf4d-fbfc-4678-b78c-e6a999956eed',NULL),('2e4b2662-79c4-48e9-ae12-2af897d845eb','0245a4ff-801f-41e9-9805-a700847ddf88',0,'Role Admin','admin','0245a4ff-801f-41e9-9805-a700847ddf88',NULL,NULL),('2f3c7ab7-04a3-42f8-b06d-9beab09a5693','f99210e7-f0a1-4361-b206-599469e91e2e',1,'${role_view-authorization}','view-authorization','e5a722b4-3b15-40ad-bf03-242dffaa63c2','f99210e7-f0a1-4361-b206-599469e91e2e',NULL),('3bd26bce-1ef0-46de-9117-eea617466f1b','7ad9bf4d-fbfc-4678-b78c-e6a999956eed',1,'${role_query-users}','query-users','463f633d-c02e-4537-931f-fc87ef88ecdb','7ad9bf4d-fbfc-4678-b78c-e6a999956eed',NULL),('3c50bcc6-681c-4f17-a520-fd4d974a0973','f99210e7-f0a1-4361-b206-599469e91e2e',1,'${role_query-realms}','query-realms','e5a722b4-3b15-40ad-bf03-242dffaa63c2','f99210e7-f0a1-4361-b206-599469e91e2e',NULL),('3db010d0-0a12-49c8-98d6-36dd4e9320d0','f99210e7-f0a1-4361-b206-599469e91e2e',1,'${role_view-realm}','view-realm','e5a722b4-3b15-40ad-bf03-242dffaa63c2','f99210e7-f0a1-4361-b206-599469e91e2e',NULL),('41602ed1-a755-469c-9fea-016b2eac53e2','459679dc-48b0-4ced-8b8b-5a5b6dc073ad',1,'${role_manage-identity-providers}','manage-identity-providers','463f633d-c02e-4537-931f-fc87ef88ecdb','459679dc-48b0-4ced-8b8b-5a5b6dc073ad',NULL),('472f8a7e-cd7e-4baf-88e2-d4e8bf8101e8','7ad9bf4d-fbfc-4678-b78c-e6a999956eed',1,'${role_view-realm}','view-realm','463f633d-c02e-4537-931f-fc87ef88ecdb','7ad9bf4d-fbfc-4678-b78c-e6a999956eed',NULL),('4b53ec37-18bc-480d-b705-0c41b7649b53','c10ec634-a81f-4355-b749-d99c902f0897',1,'${role_manage-realm}','manage-realm','463f633d-c02e-4537-931f-fc87ef88ecdb','c10ec634-a81f-4355-b749-d99c902f0897',NULL),('4be45a04-31a8-4bc9-8570-7da4b7334874','528cf47d-0d61-47bc-96ad-2363849ae6d4',1,'${role_manage-account-links}','manage-account-links','463f633d-c02e-4537-931f-fc87ef88ecdb','528cf47d-0d61-47bc-96ad-2363849ae6d4',NULL),('4db3ba07-f9f1-4588-ae91-8d3ae689e30d','c10ec634-a81f-4355-b749-d99c902f0897',1,'${role_manage-authorization}','manage-authorization','463f633d-c02e-4537-931f-fc87ef88ecdb','c10ec634-a81f-4355-b749-d99c902f0897',NULL),('4dd787dd-0910-4355-a2a8-b6baccb74255','f99210e7-f0a1-4361-b206-599469e91e2e',1,'${role_query-groups}','query-groups','e5a722b4-3b15-40ad-bf03-242dffaa63c2','f99210e7-f0a1-4361-b206-599469e91e2e',NULL),('4de300c3-8895-4bd8-999e-a11b19779e3d','c10ec634-a81f-4355-b749-d99c902f0897',1,'${role_view-identity-providers}','view-identity-providers','463f633d-c02e-4537-931f-fc87ef88ecdb','c10ec634-a81f-4355-b749-d99c902f0897',NULL),('5067b6e9-fe8b-4460-8c01-4e53c5bbb5f7','459679dc-48b0-4ced-8b8b-5a5b6dc073ad',1,'${role_query-users}','query-users','463f633d-c02e-4537-931f-fc87ef88ecdb','459679dc-48b0-4ced-8b8b-5a5b6dc073ad',NULL),('50bb28a8-6456-4f8a-81d3-09c7b182f597','f99210e7-f0a1-4361-b206-599469e91e2e',1,'${role_manage-events}','manage-events','e5a722b4-3b15-40ad-bf03-242dffaa63c2','f99210e7-f0a1-4361-b206-599469e91e2e',NULL),('5122a429-b620-4235-8f92-2f9619cf6ac0','9b324760-588a-47ee-b552-8f71b234e2c9',1,NULL,'uma_protection','e5a722b4-3b15-40ad-bf03-242dffaa63c2','9b324760-588a-47ee-b552-8f71b234e2c9',NULL),('52aa5aeb-91d1-4181-8a91-a33ddb1e9f52','f99210e7-f0a1-4361-b206-599469e91e2e',1,'${role_manage-clients}','manage-clients','e5a722b4-3b15-40ad-bf03-242dffaa63c2','f99210e7-f0a1-4361-b206-599469e91e2e',NULL),('5560dfd0-2d6e-4d99-92ad-1313bbf09d0e','f99210e7-f0a1-4361-b206-599469e91e2e',1,'${role_view-identity-providers}','view-identity-providers','e5a722b4-3b15-40ad-bf03-242dffaa63c2','f99210e7-f0a1-4361-b206-599469e91e2e',NULL),('5578c149-c0c7-4fc1-aff7-a1b2a1717362','cd3fcf55-42f5-4955-b13b-76a184f21ad9',1,'${role_view-consent}','view-consent','e5a722b4-3b15-40ad-bf03-242dffaa63c2','cd3fcf55-42f5-4955-b13b-76a184f21ad9',NULL),('57365b6b-cecc-44ba-8b79-21d188acca12','6eb15bc4-6445-44ba-8545-24f1ab6d28b1',1,'${role_query-users}','query-users','0245a4ff-801f-41e9-9805-a700847ddf88','6eb15bc4-6445-44ba-8545-24f1ab6d28b1',NULL),('5849959a-836f-46e2-8f6c-60186bba87ae','459679dc-48b0-4ced-8b8b-5a5b6dc073ad',1,'${role_impersonation}','impersonation','463f633d-c02e-4537-931f-fc87ef88ecdb','459679dc-48b0-4ced-8b8b-5a5b6dc073ad',NULL),('6169307d-d636-49e0-9e71-320e15f850f5','459679dc-48b0-4ced-8b8b-5a5b6dc073ad',1,'${role_view-events}','view-events','463f633d-c02e-4537-931f-fc87ef88ecdb','459679dc-48b0-4ced-8b8b-5a5b6dc073ad',NULL),('6253e11b-210f-4f50-a8ad-3c0ccfc0f652','528cf47d-0d61-47bc-96ad-2363849ae6d4',1,'${role_manage-account}','manage-account','463f633d-c02e-4537-931f-fc87ef88ecdb','528cf47d-0d61-47bc-96ad-2363849ae6d4',NULL),('63216bab-d127-4d6e-8a99-d67f99c6fdf2','0245a4ff-801f-41e9-9805-a700847ddf88',0,'Role User','user','0245a4ff-801f-41e9-9805-a700847ddf88',NULL,NULL),('63520e03-a6ae-4539-8acc-b581ee17207a','7ad9bf4d-fbfc-4678-b78c-e6a999956eed',1,'${role_view-clients}','view-clients','463f633d-c02e-4537-931f-fc87ef88ecdb','7ad9bf4d-fbfc-4678-b78c-e6a999956eed',NULL),('642b20dd-9ced-453e-ba8f-64132b2194e6','6eb15bc4-6445-44ba-8545-24f1ab6d28b1',1,'${role_query-realms}','query-realms','0245a4ff-801f-41e9-9805-a700847ddf88','6eb15bc4-6445-44ba-8545-24f1ab6d28b1',NULL),('6493d498-fd92-48d1-9417-ad56ad3fceda','459679dc-48b0-4ced-8b8b-5a5b6dc073ad',1,'${role_view-authorization}','view-authorization','463f633d-c02e-4537-931f-fc87ef88ecdb','459679dc-48b0-4ced-8b8b-5a5b6dc073ad',NULL),('64a76c03-6966-49d8-b77e-f76aa0cf9f14','463f633d-c02e-4537-931f-fc87ef88ecdb',0,'${role_admin}','admin','463f633d-c02e-4537-931f-fc87ef88ecdb',NULL,NULL),('65ea52b1-3ef0-4dcd-a12e-09a4f2dbd513','cd3fcf55-42f5-4955-b13b-76a184f21ad9',1,'${role_delete-account}','delete-account','e5a722b4-3b15-40ad-bf03-242dffaa63c2','cd3fcf55-42f5-4955-b13b-76a184f21ad9',NULL),('6a629b6c-b05f-4d18-a2e5-a801c6f87e2b','7ad9bf4d-fbfc-4678-b78c-e6a999956eed',1,'${role_manage-users}','manage-users','463f633d-c02e-4537-931f-fc87ef88ecdb','7ad9bf4d-fbfc-4678-b78c-e6a999956eed',NULL),('6c165c92-7580-44ba-b0da-b17fbb6b2dc0','f99210e7-f0a1-4361-b206-599469e91e2e',1,'${role_manage-authorization}','manage-authorization','e5a722b4-3b15-40ad-bf03-242dffaa63c2','f99210e7-f0a1-4361-b206-599469e91e2e',NULL),('6c991140-44d1-4b91-b8a7-eb10b355129f','528cf47d-0d61-47bc-96ad-2363849ae6d4',1,'${role_view-consent}','view-consent','463f633d-c02e-4537-931f-fc87ef88ecdb','528cf47d-0d61-47bc-96ad-2363849ae6d4',NULL),('6ff966e5-a3b3-4b3a-867b-2e0642c4672b','459679dc-48b0-4ced-8b8b-5a5b6dc073ad',1,'${role_view-clients}','view-clients','463f633d-c02e-4537-931f-fc87ef88ecdb','459679dc-48b0-4ced-8b8b-5a5b6dc073ad',NULL),('70cee895-a0e1-4818-9ec3-70c7f4eab6e7','528cf47d-0d61-47bc-96ad-2363849ae6d4',1,'${role_view-groups}','view-groups','463f633d-c02e-4537-931f-fc87ef88ecdb','528cf47d-0d61-47bc-96ad-2363849ae6d4',NULL),('70f80bf8-8bd8-44d7-be8c-dbe1b7d1e701','39390794-4eb4-4288-82c5-e1f8d74f992b',1,'${role_manage-account}','manage-account','0245a4ff-801f-41e9-9805-a700847ddf88','39390794-4eb4-4288-82c5-e1f8d74f992b',NULL),('70ff2153-1900-4bd2-8718-cc557bde2302','cd3fcf55-42f5-4955-b13b-76a184f21ad9',1,'${role_view-groups}','view-groups','e5a722b4-3b15-40ad-bf03-242dffaa63c2','cd3fcf55-42f5-4955-b13b-76a184f21ad9',NULL),('7189b730-12af-4a1f-b21f-6c9ea727e488','e5a722b4-3b15-40ad-bf03-242dffaa63c2',0,'','admin','e5a722b4-3b15-40ad-bf03-242dffaa63c2',NULL,NULL),('7249a0c4-b13a-417e-883d-e561e4148065','cd3fcf55-42f5-4955-b13b-76a184f21ad9',1,'${role_view-profile}','view-profile','e5a722b4-3b15-40ad-bf03-242dffaa63c2','cd3fcf55-42f5-4955-b13b-76a184f21ad9',NULL),('78558dd7-a1d4-4762-a50c-844f157f7692','7ad9bf4d-fbfc-4678-b78c-e6a999956eed',1,'${role_impersonation}','impersonation','463f633d-c02e-4537-931f-fc87ef88ecdb','7ad9bf4d-fbfc-4678-b78c-e6a999956eed',NULL),('7b1176a3-35a5-4ba4-ba6e-a26e32cb609c','c10ec634-a81f-4355-b749-d99c902f0897',1,'${role_query-users}','query-users','463f633d-c02e-4537-931f-fc87ef88ecdb','c10ec634-a81f-4355-b749-d99c902f0897',NULL),('7c574e03-613d-4f29-a0fc-723f23ed2bc9','459679dc-48b0-4ced-8b8b-5a5b6dc073ad',1,'${role_manage-events}','manage-events','463f633d-c02e-4537-931f-fc87ef88ecdb','459679dc-48b0-4ced-8b8b-5a5b6dc073ad',NULL),('7c5e2454-a25e-4737-a564-cb93e0f838f6','63d05341-caf2-4698-97eb-186b9f96ad6b',1,'${role_read-token}','read-token','e5a722b4-3b15-40ad-bf03-242dffaa63c2','63d05341-caf2-4698-97eb-186b9f96ad6b',NULL),('7c80ab2a-d962-4017-b1c8-5cdaefda65b1','7ad9bf4d-fbfc-4678-b78c-e6a999956eed',1,'${role_manage-realm}','manage-realm','463f633d-c02e-4537-931f-fc87ef88ecdb','7ad9bf4d-fbfc-4678-b78c-e6a999956eed',NULL),('7e1cf577-f457-4d04-b737-6b9c717d4a47','c10ec634-a81f-4355-b749-d99c902f0897',1,'${role_query-realms}','query-realms','463f633d-c02e-4537-931f-fc87ef88ecdb','c10ec634-a81f-4355-b749-d99c902f0897',NULL),('82ca6375-addb-4f22-bc04-b286f2a5c5b4','6eb15bc4-6445-44ba-8545-24f1ab6d28b1',1,'${role_query-groups}','query-groups','0245a4ff-801f-41e9-9805-a700847ddf88','6eb15bc4-6445-44ba-8545-24f1ab6d28b1',NULL),('84fb23b0-d3c6-4292-a81a-3be623546928','d1cd5eb6-31a5-47e7-a091-067e2cde7532',1,'${role_read-token}','read-token','463f633d-c02e-4537-931f-fc87ef88ecdb','d1cd5eb6-31a5-47e7-a091-067e2cde7532',NULL),('906ece06-afcb-4b2c-8f3e-aa0a31c93255','7ad9bf4d-fbfc-4678-b78c-e6a999956eed',1,'${role_query-groups}','query-groups','463f633d-c02e-4537-931f-fc87ef88ecdb','7ad9bf4d-fbfc-4678-b78c-e6a999956eed',NULL),('90edd835-72e1-4950-94d5-25009f1fd144','c10ec634-a81f-4355-b749-d99c902f0897',1,'${role_query-groups}','query-groups','463f633d-c02e-4537-931f-fc87ef88ecdb','c10ec634-a81f-4355-b749-d99c902f0897',NULL),('90f12596-814a-4846-b6b1-a4f7a5dbfc0d','0245a4ff-801f-41e9-9805-a700847ddf88',0,'${role_uma_authorization}','uma_authorization','0245a4ff-801f-41e9-9805-a700847ddf88',NULL,NULL),('947d5295-fafe-4189-aae8-8f5fe780d440','c10ec634-a81f-4355-b749-d99c902f0897',1,'${role_query-clients}','query-clients','463f633d-c02e-4537-931f-fc87ef88ecdb','c10ec634-a81f-4355-b749-d99c902f0897',NULL),('95a4b0ef-2115-4595-9c12-06fd70510d85','e5a722b4-3b15-40ad-bf03-242dffaa63c2',0,'${role_uma_authorization}','uma_authorization','e5a722b4-3b15-40ad-bf03-242dffaa63c2',NULL,NULL),('972b63fe-074a-4531-93f0-cc084965350c','f99210e7-f0a1-4361-b206-599469e91e2e',1,'${role_realm-admin}','realm-admin','e5a722b4-3b15-40ad-bf03-242dffaa63c2','f99210e7-f0a1-4361-b206-599469e91e2e',NULL),('98da747b-3de5-4e40-bca9-877a21edec7c','cd3fcf55-42f5-4955-b13b-76a184f21ad9',1,'${role_view-applications}','view-applications','e5a722b4-3b15-40ad-bf03-242dffaa63c2','cd3fcf55-42f5-4955-b13b-76a184f21ad9',NULL),('9c666ee4-b1e3-4d67-8540-e0dcfe0943a5','6eb15bc4-6445-44ba-8545-24f1ab6d28b1',1,'${role_view-realm}','view-realm','0245a4ff-801f-41e9-9805-a700847ddf88','6eb15bc4-6445-44ba-8545-24f1ab6d28b1',NULL),('9c821dad-0bbc-485e-824d-5eaaf5e516a2','6eb15bc4-6445-44ba-8545-24f1ab6d28b1',1,'${role_manage-authorization}','manage-authorization','0245a4ff-801f-41e9-9805-a700847ddf88','6eb15bc4-6445-44ba-8545-24f1ab6d28b1',NULL),('9cef5a81-eeb0-4890-ac8b-0d1506d5b63e','7ad9bf4d-fbfc-4678-b78c-e6a999956eed',1,'${role_view-events}','view-events','463f633d-c02e-4537-931f-fc87ef88ecdb','7ad9bf4d-fbfc-4678-b78c-e6a999956eed',NULL),('9df862a3-ad97-48a2-a7de-50f865e1996d','39390794-4eb4-4288-82c5-e1f8d74f992b',1,'${role_view-profile}','view-profile','0245a4ff-801f-41e9-9805-a700847ddf88','39390794-4eb4-4288-82c5-e1f8d74f992b',NULL),('a1a23795-d007-4ce4-ba22-d8c276d1c57a','c10ec634-a81f-4355-b749-d99c902f0897',1,'${role_view-authorization}','view-authorization','463f633d-c02e-4537-931f-fc87ef88ecdb','c10ec634-a81f-4355-b749-d99c902f0897',NULL),('a29cfde8-bde0-45b4-be67-49bf4cc97fbe','459679dc-48b0-4ced-8b8b-5a5b6dc073ad',1,'${role_query-groups}','query-groups','463f633d-c02e-4537-931f-fc87ef88ecdb','459679dc-48b0-4ced-8b8b-5a5b6dc073ad',NULL),('a6b2f4b7-5ce5-451c-9677-cd1a13a98b4b','6eb15bc4-6445-44ba-8545-24f1ab6d28b1',1,'${role_impersonation}','impersonation','0245a4ff-801f-41e9-9805-a700847ddf88','6eb15bc4-6445-44ba-8545-24f1ab6d28b1',NULL),('ae0513c4-502b-445b-821d-5432229d1f7d','459679dc-48b0-4ced-8b8b-5a5b6dc073ad',1,'${role_manage-authorization}','manage-authorization','463f633d-c02e-4537-931f-fc87ef88ecdb','459679dc-48b0-4ced-8b8b-5a5b6dc073ad',NULL),('af10f6dd-6707-4890-b678-7e5f827ea6b1','c10ec634-a81f-4355-b749-d99c902f0897',1,'${role_view-events}','view-events','463f633d-c02e-4537-931f-fc87ef88ecdb','c10ec634-a81f-4355-b749-d99c902f0897',NULL),('af3432f2-089c-434c-9ac6-cfa7ce866d64','6eb15bc4-6445-44ba-8545-24f1ab6d28b1',1,'${role_view-events}','view-events','0245a4ff-801f-41e9-9805-a700847ddf88','6eb15bc4-6445-44ba-8545-24f1ab6d28b1',NULL),('b14deacb-a7cd-4baf-9c89-5f631e733814','7ad9bf4d-fbfc-4678-b78c-e6a999956eed',1,'${role_manage-events}','manage-events','463f633d-c02e-4537-931f-fc87ef88ecdb','7ad9bf4d-fbfc-4678-b78c-e6a999956eed',NULL),('b23228c8-a6fe-4ae4-81be-87f0c912a913','459679dc-48b0-4ced-8b8b-5a5b6dc073ad',1,'${role_view-realm}','view-realm','463f633d-c02e-4537-931f-fc87ef88ecdb','459679dc-48b0-4ced-8b8b-5a5b6dc073ad',NULL),('b276b14c-cd87-4ade-8c84-424137f2a6d6','c10ec634-a81f-4355-b749-d99c902f0897',1,'${role_manage-users}','manage-users','463f633d-c02e-4537-931f-fc87ef88ecdb','c10ec634-a81f-4355-b749-d99c902f0897',NULL),('b389a4d9-109e-4837-b0c9-a04dd006fee3','f99210e7-f0a1-4361-b206-599469e91e2e',1,'${role_view-clients}','view-clients','e5a722b4-3b15-40ad-bf03-242dffaa63c2','f99210e7-f0a1-4361-b206-599469e91e2e',NULL),('b3e73df8-615d-4463-b651-5632bcc00af2','f99210e7-f0a1-4361-b206-599469e91e2e',1,'${role_view-events}','view-events','e5a722b4-3b15-40ad-bf03-242dffaa63c2','f99210e7-f0a1-4361-b206-599469e91e2e',NULL),('b65e46c6-c772-440c-ba20-754efc469877','f99210e7-f0a1-4361-b206-599469e91e2e',1,'${role_manage-realm}','manage-realm','e5a722b4-3b15-40ad-bf03-242dffaa63c2','f99210e7-f0a1-4361-b206-599469e91e2e',NULL),('ba6e396c-4964-4bf4-86c6-4e59d631e39a','459679dc-48b0-4ced-8b8b-5a5b6dc073ad',1,'${role_view-users}','view-users','463f633d-c02e-4537-931f-fc87ef88ecdb','459679dc-48b0-4ced-8b8b-5a5b6dc073ad',NULL),('bae0f725-af11-455d-b118-686ca91431d5','f99210e7-f0a1-4361-b206-599469e91e2e',1,'${role_create-client}','create-client','e5a722b4-3b15-40ad-bf03-242dffaa63c2','f99210e7-f0a1-4361-b206-599469e91e2e',NULL),('bc32c420-48a7-46e4-8080-43dee883f00e','6eb15bc4-6445-44ba-8545-24f1ab6d28b1',1,'${role_view-users}','view-users','0245a4ff-801f-41e9-9805-a700847ddf88','6eb15bc4-6445-44ba-8545-24f1ab6d28b1',NULL),('bdab9827-e23c-4772-a6b6-054594ad9ecf','c10ec634-a81f-4355-b749-d99c902f0897',1,'${role_impersonation}','impersonation','463f633d-c02e-4537-931f-fc87ef88ecdb','c10ec634-a81f-4355-b749-d99c902f0897',NULL),('bdb535de-7296-464a-bec9-aa25d93b1daa','c10ec634-a81f-4355-b749-d99c902f0897',1,'${role_create-client}','create-client','463f633d-c02e-4537-931f-fc87ef88ecdb','c10ec634-a81f-4355-b749-d99c902f0897',NULL),('bf780ab9-5288-4774-8a51-1a2ef9cd3fd6','459679dc-48b0-4ced-8b8b-5a5b6dc073ad',1,'${role_view-identity-providers}','view-identity-providers','463f633d-c02e-4537-931f-fc87ef88ecdb','459679dc-48b0-4ced-8b8b-5a5b6dc073ad',NULL),('c089a6ca-a05d-487a-87f3-08f22baafd87','463f633d-c02e-4537-931f-fc87ef88ecdb',0,'${role_offline-access}','offline_access','463f633d-c02e-4537-931f-fc87ef88ecdb',NULL,NULL),('c163f389-4b05-4f0b-8fa1-70e6bb2ef810','6eb15bc4-6445-44ba-8545-24f1ab6d28b1',1,'${role_view-identity-providers}','view-identity-providers','0245a4ff-801f-41e9-9805-a700847ddf88','6eb15bc4-6445-44ba-8545-24f1ab6d28b1',NULL),('c40c26e9-463a-4803-8990-b125611ef9ea','39390794-4eb4-4288-82c5-e1f8d74f992b',1,'${role_view-groups}','view-groups','0245a4ff-801f-41e9-9805-a700847ddf88','39390794-4eb4-4288-82c5-e1f8d74f992b',NULL),('c43e595d-13c0-4f02-9a46-6edc104a26ed','f99210e7-f0a1-4361-b206-599469e91e2e',1,'${role_manage-identity-providers}','manage-identity-providers','e5a722b4-3b15-40ad-bf03-242dffaa63c2','f99210e7-f0a1-4361-b206-599469e91e2e',NULL),('c4619ce2-5b4f-4e68-bd07-c11427564c81','459679dc-48b0-4ced-8b8b-5a5b6dc073ad',1,'${role_query-clients}','query-clients','463f633d-c02e-4537-931f-fc87ef88ecdb','459679dc-48b0-4ced-8b8b-5a5b6dc073ad',NULL),('c6701e4e-34be-45e7-9f32-f849074e2a36','459679dc-48b0-4ced-8b8b-5a5b6dc073ad',1,'${role_manage-clients}','manage-clients','463f633d-c02e-4537-931f-fc87ef88ecdb','459679dc-48b0-4ced-8b8b-5a5b6dc073ad',NULL),('cabf9457-5078-4f34-aa36-1d1d5af85c75','f99210e7-f0a1-4361-b206-599469e91e2e',1,'${role_manage-users}','manage-users','e5a722b4-3b15-40ad-bf03-242dffaa63c2','f99210e7-f0a1-4361-b206-599469e91e2e',NULL),('ccf72939-d4e6-4bc1-aaba-1da412c818b6','cd3fcf55-42f5-4955-b13b-76a184f21ad9',1,'${role_manage-account-links}','manage-account-links','e5a722b4-3b15-40ad-bf03-242dffaa63c2','cd3fcf55-42f5-4955-b13b-76a184f21ad9',NULL),('ce9f19e4-8b98-4ad6-84e3-eed1ebb3f076','c10ec634-a81f-4355-b749-d99c902f0897',1,'${role_view-realm}','view-realm','463f633d-c02e-4537-931f-fc87ef88ecdb','c10ec634-a81f-4355-b749-d99c902f0897',NULL),('d02eb70b-beae-4184-90da-c76b5ddeb565','7ad9bf4d-fbfc-4678-b78c-e6a999956eed',1,'${role_manage-identity-providers}','manage-identity-providers','463f633d-c02e-4537-931f-fc87ef88ecdb','7ad9bf4d-fbfc-4678-b78c-e6a999956eed',NULL),('d2f1cc25-17f0-4868-a16f-310013d47771','f99210e7-f0a1-4361-b206-599469e91e2e',1,'${role_impersonation}','impersonation','e5a722b4-3b15-40ad-bf03-242dffaa63c2','f99210e7-f0a1-4361-b206-599469e91e2e',NULL),('d332c475-36f3-4f12-9c8e-2c9749672ff7','6eb15bc4-6445-44ba-8545-24f1ab6d28b1',1,'${role_manage-realm}','manage-realm','0245a4ff-801f-41e9-9805-a700847ddf88','6eb15bc4-6445-44ba-8545-24f1ab6d28b1',NULL),('d4ee839c-f4d5-4d8a-85a3-e78f53dce3e4','0245a4ff-801f-41e9-9805-a700847ddf88',0,'${role_offline-access}','offline_access','0245a4ff-801f-41e9-9805-a700847ddf88',NULL,NULL),('d57fda3d-aae9-4521-90bc-4713fa22ab07','39390794-4eb4-4288-82c5-e1f8d74f992b',1,'${role_manage-consent}','manage-consent','0245a4ff-801f-41e9-9805-a700847ddf88','39390794-4eb4-4288-82c5-e1f8d74f992b',NULL),('d5e04ad8-1359-4ad1-9088-ead2e047258d','39390794-4eb4-4288-82c5-e1f8d74f992b',1,'${role_view-applications}','view-applications','0245a4ff-801f-41e9-9805-a700847ddf88','39390794-4eb4-4288-82c5-e1f8d74f992b',NULL),('d6db0215-47b4-4774-9c9b-2d4fcd0548f3','6eb15bc4-6445-44ba-8545-24f1ab6d28b1',1,'${role_create-client}','create-client','0245a4ff-801f-41e9-9805-a700847ddf88','6eb15bc4-6445-44ba-8545-24f1ab6d28b1',NULL),('d9aaaaa2-53ca-4747-8601-ac7282a796f2','7ad9bf4d-fbfc-4678-b78c-e6a999956eed',1,'${role_create-client}','create-client','463f633d-c02e-4537-931f-fc87ef88ecdb','7ad9bf4d-fbfc-4678-b78c-e6a999956eed',NULL),('daefece2-47be-4d23-b90b-fbe7838e5068','cd3fcf55-42f5-4955-b13b-76a184f21ad9',1,'${role_manage-account}','manage-account','e5a722b4-3b15-40ad-bf03-242dffaa63c2','cd3fcf55-42f5-4955-b13b-76a184f21ad9',NULL),('dc327076-dce6-4869-acb7-211b560903ed','528cf47d-0d61-47bc-96ad-2363849ae6d4',1,'${role_delete-account}','delete-account','463f633d-c02e-4537-931f-fc87ef88ecdb','528cf47d-0d61-47bc-96ad-2363849ae6d4',NULL),('ddf22be2-e5ba-4a4d-8341-a47acb77e515','f99210e7-f0a1-4361-b206-599469e91e2e',1,'${role_view-users}','view-users','e5a722b4-3b15-40ad-bf03-242dffaa63c2','f99210e7-f0a1-4361-b206-599469e91e2e',NULL),('de9a3471-5e67-438a-bfd4-1779d4926033','528cf47d-0d61-47bc-96ad-2363849ae6d4',1,'${role_view-applications}','view-applications','463f633d-c02e-4537-931f-fc87ef88ecdb','528cf47d-0d61-47bc-96ad-2363849ae6d4',NULL),('e0ef17c5-869b-412c-b92c-a38c0bd3e3f6','81c8e247-5382-4490-84b5-5ba89e5ee945',1,'${role_read-token}','read-token','0245a4ff-801f-41e9-9805-a700847ddf88','81c8e247-5382-4490-84b5-5ba89e5ee945',NULL),('e1359d44-23c8-42c6-8f97-e1d6838fcd7f','39390794-4eb4-4288-82c5-e1f8d74f992b',1,'${role_delete-account}','delete-account','0245a4ff-801f-41e9-9805-a700847ddf88','39390794-4eb4-4288-82c5-e1f8d74f992b',NULL),('e378cee1-ea3a-4a4d-b4a8-daf4a215c1bb','6eb15bc4-6445-44ba-8545-24f1ab6d28b1',1,'${role_manage-identity-providers}','manage-identity-providers','0245a4ff-801f-41e9-9805-a700847ddf88','6eb15bc4-6445-44ba-8545-24f1ab6d28b1',NULL),('e6167865-93c8-4881-9acb-ce3b7a022e49','7ad9bf4d-fbfc-4678-b78c-e6a999956eed',1,'${role_manage-authorization}','manage-authorization','463f633d-c02e-4537-931f-fc87ef88ecdb','7ad9bf4d-fbfc-4678-b78c-e6a999956eed',NULL),('e884d826-d998-4906-b9a3-08e641e54e40','7ad9bf4d-fbfc-4678-b78c-e6a999956eed',1,'${role_manage-clients}','manage-clients','463f633d-c02e-4537-931f-fc87ef88ecdb','7ad9bf4d-fbfc-4678-b78c-e6a999956eed',NULL),('ea3fcbd8-32c4-44e8-b03e-07694653339a','7ad9bf4d-fbfc-4678-b78c-e6a999956eed',1,'${role_query-clients}','query-clients','463f633d-c02e-4537-931f-fc87ef88ecdb','7ad9bf4d-fbfc-4678-b78c-e6a999956eed',NULL),('eee1e37b-271f-489e-8549-7a19b2846d72','e5a722b4-3b15-40ad-bf03-242dffaa63c2',0,'${role_default-roles}','default-roles-demo-keycloak','e5a722b4-3b15-40ad-bf03-242dffaa63c2',NULL,NULL),('f39107e7-b652-4f21-827b-14a335a6a925','cd3fcf55-42f5-4955-b13b-76a184f21ad9',1,'${role_manage-consent}','manage-consent','e5a722b4-3b15-40ad-bf03-242dffaa63c2','cd3fcf55-42f5-4955-b13b-76a184f21ad9',NULL),('f662afea-dec8-4c8b-95c5-71f452ed854b','39390794-4eb4-4288-82c5-e1f8d74f992b',1,'${role_view-consent}','view-consent','0245a4ff-801f-41e9-9805-a700847ddf88','39390794-4eb4-4288-82c5-e1f8d74f992b',NULL),('f8299f94-cf39-4047-a8d3-8b3d2d905fdc','463f633d-c02e-4537-931f-fc87ef88ecdb',0,'${role_uma_authorization}','uma_authorization','463f633d-c02e-4537-931f-fc87ef88ecdb',NULL,NULL),('f9d384ae-3301-4b99-b288-45b0f98ff960','463f633d-c02e-4537-931f-fc87ef88ecdb',0,'${role_default-roles}','default-roles-master','463f633d-c02e-4537-931f-fc87ef88ecdb',NULL,NULL),('f9f2fb55-1fc2-408b-9d11-7890dc4ae833','7ad9bf4d-fbfc-4678-b78c-e6a999956eed',1,'${role_query-realms}','query-realms','463f633d-c02e-4537-931f-fc87ef88ecdb','7ad9bf4d-fbfc-4678-b78c-e6a999956eed',NULL),('faaed683-3855-4a76-ae77-b530b28f24be','463f633d-c02e-4537-931f-fc87ef88ecdb',0,'${role_create-realm}','create-realm','463f633d-c02e-4537-931f-fc87ef88ecdb',NULL,NULL),('fb4eb6de-9dbb-4e45-872b-c5fbcc683082','528cf47d-0d61-47bc-96ad-2363849ae6d4',1,'${role_manage-consent}','manage-consent','463f633d-c02e-4537-931f-fc87ef88ecdb','528cf47d-0d61-47bc-96ad-2363849ae6d4',NULL),('fb60f2d1-c064-4abe-a498-65eba6ed1bb2','0245a4ff-801f-41e9-9805-a700847ddf88',0,'${role_default-roles}','default-roles-ou-graduation-realm','0245a4ff-801f-41e9-9805-a700847ddf88',NULL,NULL),('fb88db88-8233-4df8-bc42-b5a9c409c7b2','39390794-4eb4-4288-82c5-e1f8d74f992b',1,'${role_manage-account-links}','manage-account-links','0245a4ff-801f-41e9-9805-a700847ddf88','39390794-4eb4-4288-82c5-e1f8d74f992b',NULL),('fc6220a3-07ea-4f2a-b9d8-2796542c3eed','c10ec634-a81f-4355-b749-d99c902f0897',1,'${role_manage-events}','manage-events','463f633d-c02e-4537-931f-fc87ef88ecdb','c10ec634-a81f-4355-b749-d99c902f0897',NULL),('ff634d91-3a56-411e-83ff-f28810cf10b9','6eb15bc4-6445-44ba-8545-24f1ab6d28b1',1,'${role_manage-users}','manage-users','0245a4ff-801f-41e9-9805-a700847ddf88','6eb15bc4-6445-44ba-8545-24f1ab6d28b1',NULL);
/*!40000 ALTER TABLE `keycloak_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migration_model`
--

DROP TABLE IF EXISTS `migration_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migration_model` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VERSION` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UPDATE_TIME` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IDX_UPDATE_TIME` (`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migration_model`
--

LOCK TABLES `migration_model` WRITE;
/*!40000 ALTER TABLE `migration_model` DISABLE KEYS */;
INSERT INTO `migration_model` VALUES ('9trrr','24.0.1',1710903529);
/*!40000 ALTER TABLE `migration_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offline_client_session`
--

DROP TABLE IF EXISTS `offline_client_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `offline_client_session` (
  `USER_SESSION_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CLIENT_ID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `OFFLINE_FLAG` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TIMESTAMP` int DEFAULT NULL,
  `DATA` longtext COLLATE utf8mb4_unicode_ci,
  `CLIENT_STORAGE_PROVIDER` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'local',
  `EXTERNAL_CLIENT_ID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'local',
  PRIMARY KEY (`USER_SESSION_ID`,`CLIENT_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`,`OFFLINE_FLAG`),
  KEY `IDX_US_SESS_ID_ON_CL_SESS` (`USER_SESSION_ID`),
  KEY `IDX_OFFLINE_CSS_PRELOAD` (`CLIENT_ID`,`OFFLINE_FLAG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offline_client_session`
--

LOCK TABLES `offline_client_session` WRITE;
/*!40000 ALTER TABLE `offline_client_session` DISABLE KEYS */;
INSERT INTO `offline_client_session` VALUES ('98a06774-c2cb-45de-870c-1b04c96b32be','673ee5f7-a053-453c-8bed-13d5daad356d','1',1711418338,'{\"authMethod\":\"openid-connect\",\"notes\":{\"clientId\":\"673ee5f7-a053-453c-8bed-13d5daad356d\",\"scope\":\"openid offline_access\",\"userSessionStartedAt\":\"1711418338\",\"iss\":\"http://localhost:8181/realms/ou-graduation-realm\",\"startedAt\":\"1711418338\",\"level-of-authentication\":\"-1\"}}','local','local'),('b1e3dbd6-abdf-4385-ad91-12d04e43f96c','673ee5f7-a053-453c-8bed-13d5daad356d','1',1711418366,'{\"authMethod\":\"openid-connect\",\"notes\":{\"clientId\":\"673ee5f7-a053-453c-8bed-13d5daad356d\",\"scope\":\"openid offline_access\",\"userSessionStartedAt\":\"1711418366\",\"iss\":\"http://localhost:8181/realms/ou-graduation-realm\",\"startedAt\":\"1711418366\",\"level-of-authentication\":\"-1\"}}','local','local');
/*!40000 ALTER TABLE `offline_client_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offline_user_session`
--

DROP TABLE IF EXISTS `offline_user_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `offline_user_session` (
  `USER_SESSION_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `USER_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CREATED_ON` int NOT NULL,
  `OFFLINE_FLAG` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DATA` longtext COLLATE utf8mb4_unicode_ci,
  `LAST_SESSION_REFRESH` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`USER_SESSION_ID`,`OFFLINE_FLAG`),
  KEY `IDX_OFFLINE_USS_CREATEDON` (`CREATED_ON`),
  KEY `IDX_OFFLINE_USS_PRELOAD` (`OFFLINE_FLAG`,`CREATED_ON`,`USER_SESSION_ID`),
  KEY `IDX_OFFLINE_USS_BY_USER` (`USER_ID`,`REALM_ID`,`OFFLINE_FLAG`),
  KEY `IDX_OFFLINE_USS_BY_USERSESS` (`REALM_ID`,`OFFLINE_FLAG`,`USER_SESSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offline_user_session`
--

LOCK TABLES `offline_user_session` WRITE;
/*!40000 ALTER TABLE `offline_user_session` DISABLE KEYS */;
INSERT INTO `offline_user_session` VALUES ('98a06774-c2cb-45de-870c-1b04c96b32be','3d437dba-d729-4b34-b963-c3c93ed50637','0245a4ff-801f-41e9-9805-a700847ddf88',1711418338,'1','{\"ipAddress\":\"0:0:0:0:0:0:0:1\",\"authMethod\":\"openid-connect\",\"rememberMe\":false,\"started\":0,\"notes\":{\"KC_DEVICE_NOTE\":\"eyJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJvcyI6Ik90aGVyIiwib3NWZXJzaW9uIjoiVW5rbm93biIsImJyb3dzZXIiOiJQb3N0bWFuUnVudGltZS83LjM3LjAiLCJkZXZpY2UiOiJPdGhlciIsImxhc3RBY2Nlc3MiOjAsIm1vYmlsZSI6ZmFsc2V9\",\"authenticators-completed\":\"{\\\"c2075bed-dcaa-42dc-ac1c-b82750eed572\\\":1711418337,\\\"d3c7ec63-7457-4587-b406-6fe9e867b2ca\\\":1711418338}\"},\"state\":\"LOGGED_IN\"}',1711418338),('b1e3dbd6-abdf-4385-ad91-12d04e43f96c','3d437dba-d729-4b34-b963-c3c93ed50637','0245a4ff-801f-41e9-9805-a700847ddf88',1711418366,'1','{\"ipAddress\":\"0:0:0:0:0:0:0:1\",\"authMethod\":\"openid-connect\",\"rememberMe\":false,\"started\":0,\"notes\":{\"KC_DEVICE_NOTE\":\"eyJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJvcyI6Ik90aGVyIiwib3NWZXJzaW9uIjoiVW5rbm93biIsImJyb3dzZXIiOiJQb3N0bWFuUnVudGltZS83LjM3LjAiLCJkZXZpY2UiOiJPdGhlciIsImxhc3RBY2Nlc3MiOjAsIm1vYmlsZSI6ZmFsc2V9\",\"authenticators-completed\":\"{\\\"c2075bed-dcaa-42dc-ac1c-b82750eed572\\\":1711418366,\\\"d3c7ec63-7457-4587-b406-6fe9e867b2ca\\\":1711418366}\"},\"state\":\"LOGGED_IN\"}',1711418383);
/*!40000 ALTER TABLE `offline_user_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `policy_config`
--

DROP TABLE IF EXISTS `policy_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `policy_config` (
  `POLICY_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`POLICY_ID`,`NAME`),
  CONSTRAINT `FKDC34197CF864C4E43` FOREIGN KEY (`POLICY_ID`) REFERENCES `resource_server_policy` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `policy_config`
--

LOCK TABLES `policy_config` WRITE;
/*!40000 ALTER TABLE `policy_config` DISABLE KEYS */;
INSERT INTO `policy_config` VALUES ('5f73d23e-1f12-47ea-8ae8-7adc86b2208d','roles','[{\"id\":\"7189b730-12af-4a1f-b21f-6c9ea727e488\",\"required\":false}]'),('66c738df-2eeb-4adc-a7fa-00c744e21daa','roles','[{\"id\":\"7189b730-12af-4a1f-b21f-6c9ea727e488\",\"required\":false}]'),('93de4360-0fb3-495e-83d4-dc79599ed823','roles','[{\"id\":\"eee1e37b-271f-489e-8549-7a19b2846d72\",\"required\":false}]'),('c93d5226-8697-4ce2-8b7d-c35530b86c71','defaultResourceType','urn:ou-graduation-client:resources:default'),('cf299c3c-61b6-4aab-802a-d27089b5f3d1','code','// by default, grants any permission associated with this policy\n$evaluation.grant();\n');
/*!40000 ALTER TABLE `policy_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `protocol_mapper`
--

DROP TABLE IF EXISTS `protocol_mapper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `protocol_mapper` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PROTOCOL` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PROTOCOL_MAPPER_NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CLIENT_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CLIENT_SCOPE_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_PROTOCOL_MAPPER_CLIENT` (`CLIENT_ID`),
  KEY `IDX_CLSCOPE_PROTMAP` (`CLIENT_SCOPE_ID`),
  CONSTRAINT `FK_CLI_SCOPE_MAPPER` FOREIGN KEY (`CLIENT_SCOPE_ID`) REFERENCES `client_scope` (`ID`),
  CONSTRAINT `FK_PCM_REALM` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `protocol_mapper`
--

LOCK TABLES `protocol_mapper` WRITE;
/*!40000 ALTER TABLE `protocol_mapper` DISABLE KEYS */;
INSERT INTO `protocol_mapper` VALUES ('0087818f-24f3-4039-9271-21b09dc6927c','upn','openid-connect','oidc-usermodel-attribute-mapper',NULL,'d716c6b2-a331-476d-9631-384ab3810e75'),('062a539c-e720-4b78-8354-7fe45e5ce289','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'16d688f2-fdf3-441b-afff-0d1cc9a9891f'),('07d64cd2-4cc8-4d9c-bd85-de9f639abafe','roles','openid-connect','oidc-usermodel-realm-role-mapper','43b9bd23-4e8b-491c-9837-b722d4ad5c80',NULL),('0f82682d-4232-420d-bf5e-6e90c6a5cf52','address','openid-connect','oidc-address-mapper',NULL,'63d791fb-2105-4527-ad84-3e92c5b5de13'),('0f9c18a7-0018-4f15-a15f-72faba36c191','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'f4cfa3de-5764-456b-bbf4-5579fb3ed3f6'),('12197848-4fd6-49a5-929d-625b9c0c78ab','Client IP Address','openid-connect','oidc-usersessionmodel-note-mapper','673ee5f7-a053-453c-8bed-13d5daad356d',NULL),('1833a92c-33f3-4853-b32b-7799b457d69e','Client Host','openid-connect','oidc-usersessionmodel-note-mapper','673ee5f7-a053-453c-8bed-13d5daad356d',NULL),('197d6d1b-00b4-4517-ab00-74ac54cdaf97','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'6cafd019-1d64-46d2-9db1-7ff694aaeaa7'),('198ff67c-9972-4d1b-bc9e-36ca41e29d98','Client ID','openid-connect','oidc-usersessionmodel-note-mapper','673ee5f7-a053-453c-8bed-13d5daad356d',NULL),('1aa10121-3a40-4e9e-9884-99389d115a1a','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'ecfe4f7e-8dda-45c6-9b8a-748a832d1970'),('1afd5e7e-7324-4412-a1e6-09f84c6e68fb','locale','openid-connect','oidc-usermodel-attribute-mapper','56b85807-2dd7-44ff-b30b-e7ef42d80874',NULL),('1c56ff1e-fd0e-478c-be8e-5da4673c175a','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'c16fac63-0d2d-496c-abff-19d793d6029e'),('1e7d4e4f-130d-4595-a263-be6e6d0bfb03','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'a3b0ccee-b5de-496a-bb76-745511b8c384'),('1f0b088e-8fb7-4bfe-a94d-8d65ab5bf254','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'ecfe4f7e-8dda-45c6-9b8a-748a832d1970'),('1f84c837-e31b-43fa-af8c-a35612a9d94b','upn','openid-connect','oidc-usermodel-attribute-mapper',NULL,'0d037f7d-a8b3-4f39-8d03-867fe8241bd5'),('228b31a7-433e-472a-b89a-d07e199c16ec','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'d0221152-f017-47bc-a3a8-f1ea9687703c'),('23fee988-906d-4424-9e31-08182d382863','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'a3b0ccee-b5de-496a-bb76-745511b8c384'),('2a5d5a57-539e-4a6a-961e-b750064d728b','audience resolve','openid-connect','oidc-audience-resolve-mapper','d988d29a-bfa8-4def-a104-2b3879d2a442',NULL),('2aae029a-d28d-4a9d-9be8-634a0a44a220','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'bc9f9b18-0f32-41f0-adff-abadc522ea0f'),('2e5035e1-cadb-44c4-acc2-4159fe170a0c','full name','openid-connect','oidc-full-name-mapper',NULL,'487211fb-eb4c-4b9a-a650-fb3eea171a09'),('2ef1cc77-e2ad-4eb2-b029-abe057bd7722','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'487211fb-eb4c-4b9a-a650-fb3eea171a09'),('2ff428f1-9db0-4656-8344-fca8ca76a87d','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'6cafd019-1d64-46d2-9db1-7ff694aaeaa7'),('3228600d-72b8-4f12-88ee-79a090fef91d','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'26b9dc88-6c81-4317-b8fa-27c11de60a69'),('35f4b22b-55e2-4292-848d-6fcba97de349','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'a3b0ccee-b5de-496a-bb76-745511b8c384'),('3c3ee305-b8d8-416e-9894-71727e88e976','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'a3b0ccee-b5de-496a-bb76-745511b8c384'),('3e56b56c-8ee4-4635-a11a-e8ce8bc6853e','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'ecfe4f7e-8dda-45c6-9b8a-748a832d1970'),('45033ff9-60ee-4816-ace2-c6452c447fd0','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'a3b0ccee-b5de-496a-bb76-745511b8c384'),('459407f5-a698-4d72-ab3f-0297904f6325','locale','openid-connect','oidc-usermodel-attribute-mapper','b3620883-7210-478f-a415-54d4b7d5b175',NULL),('46133a5e-670c-44c9-997a-51a721b6a591','given name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'ecfe4f7e-8dda-45c6-9b8a-748a832d1970'),('47383bc0-ec2e-494b-8c37-747f1572dbaa','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'6d3fd4e4-d5de-457c-b30e-25aa2ef73f19'),('4936612f-2daf-4333-be7d-4edae0206bf5','Client IP Address','openid-connect','oidc-usersessionmodel-note-mapper','9b324760-588a-47ee-b552-8f71b234e2c9',NULL),('4a68e4f9-a230-4421-84ec-45d848ba1c9e','address','openid-connect','oidc-address-mapper',NULL,'9708eecb-fdb4-4537-9bb0-383d1bcf11cc'),('4b5271c0-8a37-43c2-b30b-0526e8ebfd27','family name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'a3b0ccee-b5de-496a-bb76-745511b8c384'),('4c86edc7-013c-4937-b71a-ca0340d91588','email','openid-connect','oidc-usermodel-attribute-mapper',NULL,'ff4960ec-81e4-4316-8e49-cbce998b1b72'),('4eff4507-4c60-4061-a8b2-634dd7cefc93','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'26b9dc88-6c81-4317-b8fa-27c11de60a69'),('6648a29a-4605-4093-97a3-7116d1a49c6c','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'ecfe4f7e-8dda-45c6-9b8a-748a832d1970'),('67d6c0f2-9e7b-4d23-aeec-4beebe152a3f','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'a3b0ccee-b5de-496a-bb76-745511b8c384'),('6b767c78-4206-4c30-a639-100c94430699','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'ecfe4f7e-8dda-45c6-9b8a-748a832d1970'),('6c162a78-8d91-405f-88a9-176a85ec3c05','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'a3b0ccee-b5de-496a-bb76-745511b8c384'),('7368deac-4e5c-4940-961d-1a5576fffe66','username','openid-connect','oidc-usermodel-attribute-mapper',NULL,'ecfe4f7e-8dda-45c6-9b8a-748a832d1970'),('74829cbb-1b61-4d03-8d82-94b215a9edfb','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'487211fb-eb4c-4b9a-a650-fb3eea171a09'),('74f9cb5d-afb9-48bc-860e-70ce2a75215e','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'16d688f2-fdf3-441b-afff-0d1cc9a9891f'),('77687985-dc12-4881-a550-dd2897dbf055','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'ea55f021-67f6-4b61-8257-df177680597b'),('78e130d1-4dab-459a-9122-c10f7eea55a2','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'487211fb-eb4c-4b9a-a650-fb3eea171a09'),('7d4042ca-15e1-4230-a1a5-7ea0d1ba8faf','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'d716c6b2-a331-476d-9631-384ab3810e75'),('8038408e-03a7-4abe-af5d-a30953c49e25','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'8ea2b5e0-2d98-4237-835f-56a1b4aa0f0f'),('826be89a-6dc1-4a07-97ab-16aa93d6e0ff','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'487211fb-eb4c-4b9a-a650-fb3eea171a09'),('855186f8-c49a-4a8f-b757-78b6f1891566','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'487211fb-eb4c-4b9a-a650-fb3eea171a09'),('87ab6abb-bc36-4a20-84c3-d6b770db88bd','email','openid-connect','oidc-usermodel-attribute-mapper',NULL,'8ea2b5e0-2d98-4237-835f-56a1b4aa0f0f'),('8c834d54-77b4-4b77-9304-fcd80a6a659c','acr loa level','openid-connect','oidc-acr-mapper',NULL,'bd5348cd-6f57-4558-8e9f-2c5a184afb7e'),('8d7e73a2-0fa2-44c4-93fa-0c562a5bd6ad','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'a3b0ccee-b5de-496a-bb76-745511b8c384'),('913976cf-8bd4-4445-bd9a-74b1a17e2da7','address','openid-connect','oidc-address-mapper',NULL,'998b2464-1918-4790-b89e-c2bdb51c1d9a'),('9507ad16-f7f9-44c8-a859-5bb28b991f64','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'ecfe4f7e-8dda-45c6-9b8a-748a832d1970'),('959c424e-5231-400c-9103-25059f15f941','role list','saml','saml-role-list-mapper',NULL,'590140a6-976e-4ea2-a5f3-a8841d544620'),('9b001346-61ae-4e54-b978-3d005b9a2477','username','openid-connect','oidc-usermodel-attribute-mapper',NULL,'487211fb-eb4c-4b9a-a650-fb3eea171a09'),('9c5bd2bc-8b69-4732-9479-a351eeee9c4f','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'f4cfa3de-5764-456b-bbf4-5579fb3ed3f6'),('a78b62d4-420b-4c53-bc9e-e35956a46564','acr loa level','openid-connect','oidc-acr-mapper',NULL,'e5151208-a184-4dd0-b90b-c59412572378'),('a7e2564c-029a-4429-ab98-4ed6a8335876','family name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'ecfe4f7e-8dda-45c6-9b8a-748a832d1970'),('a888c7a4-a1ae-44b1-b6cc-f28474da06e0','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'487211fb-eb4c-4b9a-a650-fb3eea171a09'),('a929268c-a56c-44e6-9891-ad3c3e85ee91','given name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'a3b0ccee-b5de-496a-bb76-745511b8c384'),('adb115d4-24dd-48ac-b36a-7eeb616db146','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'bc9f9b18-0f32-41f0-adff-abadc522ea0f'),('aeb18c44-62dc-4147-b644-a444032b3110','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'ff4960ec-81e4-4316-8e49-cbce998b1b72'),('af40f52e-fb66-42d9-b90a-8ef926d51c0c','family name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'487211fb-eb4c-4b9a-a650-fb3eea171a09'),('b39c1ecc-ef7b-4ea5-87c1-5558c27fb1e2','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'487211fb-eb4c-4b9a-a650-fb3eea171a09'),('b6418051-49c7-4b14-92c7-9577c31a3700','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'6cafd019-1d64-46d2-9db1-7ff694aaeaa7'),('b7900c58-9a7c-4deb-b356-7502b473589d','upn','openid-connect','oidc-usermodel-attribute-mapper',NULL,'c16fac63-0d2d-496c-abff-19d793d6029e'),('b7ad7a93-f340-4bc7-924d-20b6c54f2900','locale','openid-connect','oidc-usermodel-attribute-mapper','38b1ac57-9913-4586-8a2f-c4694643ec98',NULL),('b8080066-08d9-4d78-960c-9817fbbbc4f5','Client Host','openid-connect','oidc-usersessionmodel-note-mapper','9b324760-588a-47ee-b552-8f71b234e2c9',NULL),('bb0f29e0-74f3-4dd7-b881-e0f4a3153497','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'ecfe4f7e-8dda-45c6-9b8a-748a832d1970'),('bb5b9d78-82ac-4187-8375-9409679c422d','Client ID','openid-connect','oidc-usersessionmodel-note-mapper','9b324760-588a-47ee-b552-8f71b234e2c9',NULL),('bcbc719a-11db-4d85-b804-7aec8a3908ad','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'c8991e6c-534e-4252-b718-7f8f3b40e179'),('bd998870-aa21-4dec-bf2f-9c25f5373763','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'ecfe4f7e-8dda-45c6-9b8a-748a832d1970'),('c0329780-9813-4fc7-b15f-064b8a601b00','role list','saml','saml-role-list-mapper',NULL,'c1842379-1e21-4eab-96cf-c9dc28d1ca42'),('c46619b0-0062-46f7-83f2-f2df7c5023c5','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'ecfe4f7e-8dda-45c6-9b8a-748a832d1970'),('c5870836-6c4b-4233-8449-115966e51669','audience resolve','openid-connect','oidc-audience-resolve-mapper','273eb56f-e808-4871-962d-76a6adc2e837',NULL),('c73e83a2-9709-4b66-bc53-94df5d1523d5','username','openid-connect','oidc-usermodel-attribute-mapper',NULL,'a3b0ccee-b5de-496a-bb76-745511b8c384'),('cb352e9d-c918-450a-bfe8-7159b155e1c7','given name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'487211fb-eb4c-4b9a-a650-fb3eea171a09'),('cbb2e853-3c80-4fe1-83be-3961a5425e45','full name','openid-connect','oidc-full-name-mapper',NULL,'ecfe4f7e-8dda-45c6-9b8a-748a832d1970'),('ccfe5e28-a243-4b9e-af38-45e6b7316937','audience resolve','openid-connect','oidc-audience-resolve-mapper','85e2c2c2-bc16-44b4-b252-c4b8ddc9c21c',NULL),('cdbcc902-a5c8-4137-963a-b9b32837dbc0','full name','openid-connect','oidc-full-name-mapper',NULL,'a3b0ccee-b5de-496a-bb76-745511b8c384'),('cff74a7f-68ee-4fe4-a78b-18b91acc5280','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'a3b0ccee-b5de-496a-bb76-745511b8c384'),('d027e978-2535-4927-b078-3d10a106ce68','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'487211fb-eb4c-4b9a-a650-fb3eea171a09'),('d44818e4-c905-4056-94f1-44222fb53b8e','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'53ad7090-9e64-48ca-8d5b-a8103dda2d37'),('d60186c4-f744-47e4-8a8a-788f103c3e61','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'a3b0ccee-b5de-496a-bb76-745511b8c384'),('da3f1847-7602-42df-8b51-a9a4ce9bce04','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'bc9f9b18-0f32-41f0-adff-abadc522ea0f'),('db912431-c21f-455b-85ee-0f7f301a76ed','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'d0221152-f017-47bc-a3a8-f1ea9687703c'),('de323a4a-b118-4679-b4f3-49b4cac58a56','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'487211fb-eb4c-4b9a-a650-fb3eea171a09'),('de328d57-1f8a-4fcf-b9db-0d3df6af9d88','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'487211fb-eb4c-4b9a-a650-fb3eea171a09'),('de82064c-48da-4979-bbec-bd43b4cd4183','email','openid-connect','oidc-usermodel-attribute-mapper',NULL,'c8991e6c-534e-4252-b718-7f8f3b40e179'),('e30eaacd-ddce-4eb8-96c4-d7422479941a','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'0d037f7d-a8b3-4f39-8d03-867fe8241bd5'),('e44e0ec9-c61c-4e1d-9778-050302bc5585','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'ecfe4f7e-8dda-45c6-9b8a-748a832d1970'),('f24a01c2-61a2-42c6-a741-07eaeb352661','acr loa level','openid-connect','oidc-acr-mapper',NULL,'0d76c208-71e4-4d15-9c15-ec03c772d5c9'),('fc0cbbf2-8e94-4481-b248-938c345e7a00','roles','openid-connect','oidc-usermodel-realm-role-mapper','9b324760-588a-47ee-b552-8f71b234e2c9',NULL),('fe7c701a-394d-4e39-9f10-5c1696fb0bb4','role list','saml','saml-role-list-mapper',NULL,'c5a4950d-1cf3-4902-a9ea-fb644f79eeb2'),('fee13dbf-cf99-46ab-ae81-63ad14726c7e','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'16d688f2-fdf3-441b-afff-0d1cc9a9891f');
/*!40000 ALTER TABLE `protocol_mapper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `protocol_mapper_config`
--

DROP TABLE IF EXISTS `protocol_mapper_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `protocol_mapper_config` (
  `PROTOCOL_MAPPER_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` longtext COLLATE utf8mb4_unicode_ci,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`PROTOCOL_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_PMCONFIG` FOREIGN KEY (`PROTOCOL_MAPPER_ID`) REFERENCES `protocol_mapper` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `protocol_mapper_config`
--

LOCK TABLES `protocol_mapper_config` WRITE;
/*!40000 ALTER TABLE `protocol_mapper_config` DISABLE KEYS */;
INSERT INTO `protocol_mapper_config` VALUES ('0087818f-24f3-4039-9271-21b09dc6927c','true','access.token.claim'),('0087818f-24f3-4039-9271-21b09dc6927c','upn','claim.name'),('0087818f-24f3-4039-9271-21b09dc6927c','true','id.token.claim'),('0087818f-24f3-4039-9271-21b09dc6927c','true','introspection.token.claim'),('0087818f-24f3-4039-9271-21b09dc6927c','String','jsonType.label'),('0087818f-24f3-4039-9271-21b09dc6927c','username','user.attribute'),('0087818f-24f3-4039-9271-21b09dc6927c','true','userinfo.token.claim'),('062a539c-e720-4b78-8354-7fe45e5ce289','true','access.token.claim'),('062a539c-e720-4b78-8354-7fe45e5ce289','true','introspection.token.claim'),('07d64cd2-4cc8-4d9c-bd85-de9f639abafe','true','access.token.claim'),('07d64cd2-4cc8-4d9c-bd85-de9f639abafe','roles','claim.name'),('07d64cd2-4cc8-4d9c-bd85-de9f639abafe','true','id.token.claim'),('07d64cd2-4cc8-4d9c-bd85-de9f639abafe','true','introspection.token.claim'),('07d64cd2-4cc8-4d9c-bd85-de9f639abafe','String','jsonType.label'),('07d64cd2-4cc8-4d9c-bd85-de9f639abafe','false','lightweight.claim'),('07d64cd2-4cc8-4d9c-bd85-de9f639abafe','true','multivalued'),('07d64cd2-4cc8-4d9c-bd85-de9f639abafe','true','userinfo.token.claim'),('0f82682d-4232-420d-bf5e-6e90c6a5cf52','true','access.token.claim'),('0f82682d-4232-420d-bf5e-6e90c6a5cf52','true','id.token.claim'),('0f82682d-4232-420d-bf5e-6e90c6a5cf52','true','introspection.token.claim'),('0f82682d-4232-420d-bf5e-6e90c6a5cf52','country','user.attribute.country'),('0f82682d-4232-420d-bf5e-6e90c6a5cf52','formatted','user.attribute.formatted'),('0f82682d-4232-420d-bf5e-6e90c6a5cf52','locality','user.attribute.locality'),('0f82682d-4232-420d-bf5e-6e90c6a5cf52','postal_code','user.attribute.postal_code'),('0f82682d-4232-420d-bf5e-6e90c6a5cf52','region','user.attribute.region'),('0f82682d-4232-420d-bf5e-6e90c6a5cf52','street','user.attribute.street'),('0f82682d-4232-420d-bf5e-6e90c6a5cf52','true','userinfo.token.claim'),('0f9c18a7-0018-4f15-a15f-72faba36c191','true','access.token.claim'),('0f9c18a7-0018-4f15-a15f-72faba36c191','phone_number_verified','claim.name'),('0f9c18a7-0018-4f15-a15f-72faba36c191','true','id.token.claim'),('0f9c18a7-0018-4f15-a15f-72faba36c191','true','introspection.token.claim'),('0f9c18a7-0018-4f15-a15f-72faba36c191','boolean','jsonType.label'),('0f9c18a7-0018-4f15-a15f-72faba36c191','phoneNumberVerified','user.attribute'),('0f9c18a7-0018-4f15-a15f-72faba36c191','true','userinfo.token.claim'),('12197848-4fd6-49a5-929d-625b9c0c78ab','true','access.token.claim'),('12197848-4fd6-49a5-929d-625b9c0c78ab','clientAddress','claim.name'),('12197848-4fd6-49a5-929d-625b9c0c78ab','true','id.token.claim'),('12197848-4fd6-49a5-929d-625b9c0c78ab','true','introspection.token.claim'),('12197848-4fd6-49a5-929d-625b9c0c78ab','String','jsonType.label'),('12197848-4fd6-49a5-929d-625b9c0c78ab','clientAddress','user.session.note'),('1833a92c-33f3-4853-b32b-7799b457d69e','true','access.token.claim'),('1833a92c-33f3-4853-b32b-7799b457d69e','clientHost','claim.name'),('1833a92c-33f3-4853-b32b-7799b457d69e','true','id.token.claim'),('1833a92c-33f3-4853-b32b-7799b457d69e','true','introspection.token.claim'),('1833a92c-33f3-4853-b32b-7799b457d69e','String','jsonType.label'),('1833a92c-33f3-4853-b32b-7799b457d69e','clientHost','user.session.note'),('197d6d1b-00b4-4517-ab00-74ac54cdaf97','true','access.token.claim'),('197d6d1b-00b4-4517-ab00-74ac54cdaf97','true','introspection.token.claim'),('198ff67c-9972-4d1b-bc9e-36ca41e29d98','true','access.token.claim'),('198ff67c-9972-4d1b-bc9e-36ca41e29d98','client_id','claim.name'),('198ff67c-9972-4d1b-bc9e-36ca41e29d98','true','id.token.claim'),('198ff67c-9972-4d1b-bc9e-36ca41e29d98','true','introspection.token.claim'),('198ff67c-9972-4d1b-bc9e-36ca41e29d98','String','jsonType.label'),('198ff67c-9972-4d1b-bc9e-36ca41e29d98','client_id','user.session.note'),('1aa10121-3a40-4e9e-9884-99389d115a1a','true','access.token.claim'),('1aa10121-3a40-4e9e-9884-99389d115a1a','updated_at','claim.name'),('1aa10121-3a40-4e9e-9884-99389d115a1a','true','id.token.claim'),('1aa10121-3a40-4e9e-9884-99389d115a1a','true','introspection.token.claim'),('1aa10121-3a40-4e9e-9884-99389d115a1a','long','jsonType.label'),('1aa10121-3a40-4e9e-9884-99389d115a1a','updatedAt','user.attribute'),('1aa10121-3a40-4e9e-9884-99389d115a1a','true','userinfo.token.claim'),('1afd5e7e-7324-4412-a1e6-09f84c6e68fb','true','access.token.claim'),('1afd5e7e-7324-4412-a1e6-09f84c6e68fb','locale','claim.name'),('1afd5e7e-7324-4412-a1e6-09f84c6e68fb','true','id.token.claim'),('1afd5e7e-7324-4412-a1e6-09f84c6e68fb','true','introspection.token.claim'),('1afd5e7e-7324-4412-a1e6-09f84c6e68fb','String','jsonType.label'),('1afd5e7e-7324-4412-a1e6-09f84c6e68fb','locale','user.attribute'),('1afd5e7e-7324-4412-a1e6-09f84c6e68fb','true','userinfo.token.claim'),('1c56ff1e-fd0e-478c-be8e-5da4673c175a','true','access.token.claim'),('1c56ff1e-fd0e-478c-be8e-5da4673c175a','groups','claim.name'),('1c56ff1e-fd0e-478c-be8e-5da4673c175a','true','id.token.claim'),('1c56ff1e-fd0e-478c-be8e-5da4673c175a','true','introspection.token.claim'),('1c56ff1e-fd0e-478c-be8e-5da4673c175a','String','jsonType.label'),('1c56ff1e-fd0e-478c-be8e-5da4673c175a','true','multivalued'),('1c56ff1e-fd0e-478c-be8e-5da4673c175a','foo','user.attribute'),('1e7d4e4f-130d-4595-a263-be6e6d0bfb03','true','access.token.claim'),('1e7d4e4f-130d-4595-a263-be6e6d0bfb03','gender','claim.name'),('1e7d4e4f-130d-4595-a263-be6e6d0bfb03','true','id.token.claim'),('1e7d4e4f-130d-4595-a263-be6e6d0bfb03','true','introspection.token.claim'),('1e7d4e4f-130d-4595-a263-be6e6d0bfb03','String','jsonType.label'),('1e7d4e4f-130d-4595-a263-be6e6d0bfb03','gender','user.attribute'),('1e7d4e4f-130d-4595-a263-be6e6d0bfb03','true','userinfo.token.claim'),('1f0b088e-8fb7-4bfe-a94d-8d65ab5bf254','true','access.token.claim'),('1f0b088e-8fb7-4bfe-a94d-8d65ab5bf254','middle_name','claim.name'),('1f0b088e-8fb7-4bfe-a94d-8d65ab5bf254','true','id.token.claim'),('1f0b088e-8fb7-4bfe-a94d-8d65ab5bf254','true','introspection.token.claim'),('1f0b088e-8fb7-4bfe-a94d-8d65ab5bf254','String','jsonType.label'),('1f0b088e-8fb7-4bfe-a94d-8d65ab5bf254','middleName','user.attribute'),('1f0b088e-8fb7-4bfe-a94d-8d65ab5bf254','true','userinfo.token.claim'),('1f84c837-e31b-43fa-af8c-a35612a9d94b','true','access.token.claim'),('1f84c837-e31b-43fa-af8c-a35612a9d94b','upn','claim.name'),('1f84c837-e31b-43fa-af8c-a35612a9d94b','true','id.token.claim'),('1f84c837-e31b-43fa-af8c-a35612a9d94b','true','introspection.token.claim'),('1f84c837-e31b-43fa-af8c-a35612a9d94b','String','jsonType.label'),('1f84c837-e31b-43fa-af8c-a35612a9d94b','username','user.attribute'),('1f84c837-e31b-43fa-af8c-a35612a9d94b','true','userinfo.token.claim'),('228b31a7-433e-472a-b89a-d07e199c16ec','true','access.token.claim'),('228b31a7-433e-472a-b89a-d07e199c16ec','phone_number','claim.name'),('228b31a7-433e-472a-b89a-d07e199c16ec','true','id.token.claim'),('228b31a7-433e-472a-b89a-d07e199c16ec','true','introspection.token.claim'),('228b31a7-433e-472a-b89a-d07e199c16ec','String','jsonType.label'),('228b31a7-433e-472a-b89a-d07e199c16ec','phoneNumber','user.attribute'),('228b31a7-433e-472a-b89a-d07e199c16ec','true','userinfo.token.claim'),('23fee988-906d-4424-9e31-08182d382863','true','access.token.claim'),('23fee988-906d-4424-9e31-08182d382863','nickname','claim.name'),('23fee988-906d-4424-9e31-08182d382863','true','id.token.claim'),('23fee988-906d-4424-9e31-08182d382863','true','introspection.token.claim'),('23fee988-906d-4424-9e31-08182d382863','String','jsonType.label'),('23fee988-906d-4424-9e31-08182d382863','nickname','user.attribute'),('23fee988-906d-4424-9e31-08182d382863','true','userinfo.token.claim'),('2aae029a-d28d-4a9d-9be8-634a0a44a220','true','access.token.claim'),('2aae029a-d28d-4a9d-9be8-634a0a44a220','true','introspection.token.claim'),('2e5035e1-cadb-44c4-acc2-4159fe170a0c','true','access.token.claim'),('2e5035e1-cadb-44c4-acc2-4159fe170a0c','true','id.token.claim'),('2e5035e1-cadb-44c4-acc2-4159fe170a0c','true','introspection.token.claim'),('2e5035e1-cadb-44c4-acc2-4159fe170a0c','true','userinfo.token.claim'),('2ef1cc77-e2ad-4eb2-b029-abe057bd7722','true','access.token.claim'),('2ef1cc77-e2ad-4eb2-b029-abe057bd7722','zoneinfo','claim.name'),('2ef1cc77-e2ad-4eb2-b029-abe057bd7722','true','id.token.claim'),('2ef1cc77-e2ad-4eb2-b029-abe057bd7722','true','introspection.token.claim'),('2ef1cc77-e2ad-4eb2-b029-abe057bd7722','String','jsonType.label'),('2ef1cc77-e2ad-4eb2-b029-abe057bd7722','zoneinfo','user.attribute'),('2ef1cc77-e2ad-4eb2-b029-abe057bd7722','true','userinfo.token.claim'),('2ff428f1-9db0-4656-8344-fca8ca76a87d','true','access.token.claim'),('2ff428f1-9db0-4656-8344-fca8ca76a87d','resource_access.${client_id}.roles','claim.name'),('2ff428f1-9db0-4656-8344-fca8ca76a87d','true','introspection.token.claim'),('2ff428f1-9db0-4656-8344-fca8ca76a87d','String','jsonType.label'),('2ff428f1-9db0-4656-8344-fca8ca76a87d','true','multivalued'),('2ff428f1-9db0-4656-8344-fca8ca76a87d','foo','user.attribute'),('3228600d-72b8-4f12-88ee-79a090fef91d','true','access.token.claim'),('3228600d-72b8-4f12-88ee-79a090fef91d','phone_number','claim.name'),('3228600d-72b8-4f12-88ee-79a090fef91d','true','id.token.claim'),('3228600d-72b8-4f12-88ee-79a090fef91d','true','introspection.token.claim'),('3228600d-72b8-4f12-88ee-79a090fef91d','String','jsonType.label'),('3228600d-72b8-4f12-88ee-79a090fef91d','phoneNumber','user.attribute'),('3228600d-72b8-4f12-88ee-79a090fef91d','true','userinfo.token.claim'),('35f4b22b-55e2-4292-848d-6fcba97de349','true','access.token.claim'),('35f4b22b-55e2-4292-848d-6fcba97de349','updated_at','claim.name'),('35f4b22b-55e2-4292-848d-6fcba97de349','true','id.token.claim'),('35f4b22b-55e2-4292-848d-6fcba97de349','true','introspection.token.claim'),('35f4b22b-55e2-4292-848d-6fcba97de349','long','jsonType.label'),('35f4b22b-55e2-4292-848d-6fcba97de349','updatedAt','user.attribute'),('35f4b22b-55e2-4292-848d-6fcba97de349','true','userinfo.token.claim'),('3c3ee305-b8d8-416e-9894-71727e88e976','true','access.token.claim'),('3c3ee305-b8d8-416e-9894-71727e88e976','website','claim.name'),('3c3ee305-b8d8-416e-9894-71727e88e976','true','id.token.claim'),('3c3ee305-b8d8-416e-9894-71727e88e976','true','introspection.token.claim'),('3c3ee305-b8d8-416e-9894-71727e88e976','String','jsonType.label'),('3c3ee305-b8d8-416e-9894-71727e88e976','website','user.attribute'),('3c3ee305-b8d8-416e-9894-71727e88e976','true','userinfo.token.claim'),('3e56b56c-8ee4-4635-a11a-e8ce8bc6853e','true','access.token.claim'),('3e56b56c-8ee4-4635-a11a-e8ce8bc6853e','locale','claim.name'),('3e56b56c-8ee4-4635-a11a-e8ce8bc6853e','true','id.token.claim'),('3e56b56c-8ee4-4635-a11a-e8ce8bc6853e','true','introspection.token.claim'),('3e56b56c-8ee4-4635-a11a-e8ce8bc6853e','String','jsonType.label'),('3e56b56c-8ee4-4635-a11a-e8ce8bc6853e','locale','user.attribute'),('3e56b56c-8ee4-4635-a11a-e8ce8bc6853e','true','userinfo.token.claim'),('45033ff9-60ee-4816-ace2-c6452c447fd0','true','access.token.claim'),('45033ff9-60ee-4816-ace2-c6452c447fd0','middle_name','claim.name'),('45033ff9-60ee-4816-ace2-c6452c447fd0','true','id.token.claim'),('45033ff9-60ee-4816-ace2-c6452c447fd0','true','introspection.token.claim'),('45033ff9-60ee-4816-ace2-c6452c447fd0','String','jsonType.label'),('45033ff9-60ee-4816-ace2-c6452c447fd0','middleName','user.attribute'),('45033ff9-60ee-4816-ace2-c6452c447fd0','true','userinfo.token.claim'),('459407f5-a698-4d72-ab3f-0297904f6325','true','access.token.claim'),('459407f5-a698-4d72-ab3f-0297904f6325','locale','claim.name'),('459407f5-a698-4d72-ab3f-0297904f6325','true','id.token.claim'),('459407f5-a698-4d72-ab3f-0297904f6325','true','introspection.token.claim'),('459407f5-a698-4d72-ab3f-0297904f6325','String','jsonType.label'),('459407f5-a698-4d72-ab3f-0297904f6325','locale','user.attribute'),('459407f5-a698-4d72-ab3f-0297904f6325','true','userinfo.token.claim'),('46133a5e-670c-44c9-997a-51a721b6a591','true','access.token.claim'),('46133a5e-670c-44c9-997a-51a721b6a591','given_name','claim.name'),('46133a5e-670c-44c9-997a-51a721b6a591','true','id.token.claim'),('46133a5e-670c-44c9-997a-51a721b6a591','true','introspection.token.claim'),('46133a5e-670c-44c9-997a-51a721b6a591','String','jsonType.label'),('46133a5e-670c-44c9-997a-51a721b6a591','firstName','user.attribute'),('46133a5e-670c-44c9-997a-51a721b6a591','true','userinfo.token.claim'),('47383bc0-ec2e-494b-8c37-747f1572dbaa','true','access.token.claim'),('47383bc0-ec2e-494b-8c37-747f1572dbaa','true','introspection.token.claim'),('4936612f-2daf-4333-be7d-4edae0206bf5','true','access.token.claim'),('4936612f-2daf-4333-be7d-4edae0206bf5','clientAddress','claim.name'),('4936612f-2daf-4333-be7d-4edae0206bf5','true','id.token.claim'),('4936612f-2daf-4333-be7d-4edae0206bf5','true','introspection.token.claim'),('4936612f-2daf-4333-be7d-4edae0206bf5','String','jsonType.label'),('4936612f-2daf-4333-be7d-4edae0206bf5','clientAddress','user.session.note'),('4a68e4f9-a230-4421-84ec-45d848ba1c9e','true','access.token.claim'),('4a68e4f9-a230-4421-84ec-45d848ba1c9e','true','id.token.claim'),('4a68e4f9-a230-4421-84ec-45d848ba1c9e','true','introspection.token.claim'),('4a68e4f9-a230-4421-84ec-45d848ba1c9e','country','user.attribute.country'),('4a68e4f9-a230-4421-84ec-45d848ba1c9e','formatted','user.attribute.formatted'),('4a68e4f9-a230-4421-84ec-45d848ba1c9e','locality','user.attribute.locality'),('4a68e4f9-a230-4421-84ec-45d848ba1c9e','postal_code','user.attribute.postal_code'),('4a68e4f9-a230-4421-84ec-45d848ba1c9e','region','user.attribute.region'),('4a68e4f9-a230-4421-84ec-45d848ba1c9e','street','user.attribute.street'),('4a68e4f9-a230-4421-84ec-45d848ba1c9e','true','userinfo.token.claim'),('4b5271c0-8a37-43c2-b30b-0526e8ebfd27','true','access.token.claim'),('4b5271c0-8a37-43c2-b30b-0526e8ebfd27','family_name','claim.name'),('4b5271c0-8a37-43c2-b30b-0526e8ebfd27','true','id.token.claim'),('4b5271c0-8a37-43c2-b30b-0526e8ebfd27','true','introspection.token.claim'),('4b5271c0-8a37-43c2-b30b-0526e8ebfd27','String','jsonType.label'),('4b5271c0-8a37-43c2-b30b-0526e8ebfd27','lastName','user.attribute'),('4b5271c0-8a37-43c2-b30b-0526e8ebfd27','true','userinfo.token.claim'),('4c86edc7-013c-4937-b71a-ca0340d91588','true','access.token.claim'),('4c86edc7-013c-4937-b71a-ca0340d91588','email','claim.name'),('4c86edc7-013c-4937-b71a-ca0340d91588','true','id.token.claim'),('4c86edc7-013c-4937-b71a-ca0340d91588','true','introspection.token.claim'),('4c86edc7-013c-4937-b71a-ca0340d91588','String','jsonType.label'),('4c86edc7-013c-4937-b71a-ca0340d91588','email','user.attribute'),('4c86edc7-013c-4937-b71a-ca0340d91588','true','userinfo.token.claim'),('4eff4507-4c60-4061-a8b2-634dd7cefc93','true','access.token.claim'),('4eff4507-4c60-4061-a8b2-634dd7cefc93','phone_number_verified','claim.name'),('4eff4507-4c60-4061-a8b2-634dd7cefc93','true','id.token.claim'),('4eff4507-4c60-4061-a8b2-634dd7cefc93','true','introspection.token.claim'),('4eff4507-4c60-4061-a8b2-634dd7cefc93','boolean','jsonType.label'),('4eff4507-4c60-4061-a8b2-634dd7cefc93','phoneNumberVerified','user.attribute'),('4eff4507-4c60-4061-a8b2-634dd7cefc93','true','userinfo.token.claim'),('6648a29a-4605-4093-97a3-7116d1a49c6c','true','access.token.claim'),('6648a29a-4605-4093-97a3-7116d1a49c6c','gender','claim.name'),('6648a29a-4605-4093-97a3-7116d1a49c6c','true','id.token.claim'),('6648a29a-4605-4093-97a3-7116d1a49c6c','true','introspection.token.claim'),('6648a29a-4605-4093-97a3-7116d1a49c6c','String','jsonType.label'),('6648a29a-4605-4093-97a3-7116d1a49c6c','gender','user.attribute'),('6648a29a-4605-4093-97a3-7116d1a49c6c','true','userinfo.token.claim'),('67d6c0f2-9e7b-4d23-aeec-4beebe152a3f','true','access.token.claim'),('67d6c0f2-9e7b-4d23-aeec-4beebe152a3f','profile','claim.name'),('67d6c0f2-9e7b-4d23-aeec-4beebe152a3f','true','id.token.claim'),('67d6c0f2-9e7b-4d23-aeec-4beebe152a3f','true','introspection.token.claim'),('67d6c0f2-9e7b-4d23-aeec-4beebe152a3f','String','jsonType.label'),('67d6c0f2-9e7b-4d23-aeec-4beebe152a3f','profile','user.attribute'),('67d6c0f2-9e7b-4d23-aeec-4beebe152a3f','true','userinfo.token.claim'),('6b767c78-4206-4c30-a639-100c94430699','true','access.token.claim'),('6b767c78-4206-4c30-a639-100c94430699','website','claim.name'),('6b767c78-4206-4c30-a639-100c94430699','true','id.token.claim'),('6b767c78-4206-4c30-a639-100c94430699','true','introspection.token.claim'),('6b767c78-4206-4c30-a639-100c94430699','String','jsonType.label'),('6b767c78-4206-4c30-a639-100c94430699','website','user.attribute'),('6b767c78-4206-4c30-a639-100c94430699','true','userinfo.token.claim'),('6c162a78-8d91-405f-88a9-176a85ec3c05','true','access.token.claim'),('6c162a78-8d91-405f-88a9-176a85ec3c05','locale','claim.name'),('6c162a78-8d91-405f-88a9-176a85ec3c05','true','id.token.claim'),('6c162a78-8d91-405f-88a9-176a85ec3c05','true','introspection.token.claim'),('6c162a78-8d91-405f-88a9-176a85ec3c05','String','jsonType.label'),('6c162a78-8d91-405f-88a9-176a85ec3c05','locale','user.attribute'),('6c162a78-8d91-405f-88a9-176a85ec3c05','true','userinfo.token.claim'),('7368deac-4e5c-4940-961d-1a5576fffe66','true','access.token.claim'),('7368deac-4e5c-4940-961d-1a5576fffe66','preferred_username','claim.name'),('7368deac-4e5c-4940-961d-1a5576fffe66','true','id.token.claim'),('7368deac-4e5c-4940-961d-1a5576fffe66','true','introspection.token.claim'),('7368deac-4e5c-4940-961d-1a5576fffe66','String','jsonType.label'),('7368deac-4e5c-4940-961d-1a5576fffe66','username','user.attribute'),('7368deac-4e5c-4940-961d-1a5576fffe66','true','userinfo.token.claim'),('74829cbb-1b61-4d03-8d82-94b215a9edfb','true','access.token.claim'),('74829cbb-1b61-4d03-8d82-94b215a9edfb','picture','claim.name'),('74829cbb-1b61-4d03-8d82-94b215a9edfb','true','id.token.claim'),('74829cbb-1b61-4d03-8d82-94b215a9edfb','true','introspection.token.claim'),('74829cbb-1b61-4d03-8d82-94b215a9edfb','String','jsonType.label'),('74829cbb-1b61-4d03-8d82-94b215a9edfb','picture','user.attribute'),('74829cbb-1b61-4d03-8d82-94b215a9edfb','true','userinfo.token.claim'),('74f9cb5d-afb9-48bc-860e-70ce2a75215e','true','access.token.claim'),('74f9cb5d-afb9-48bc-860e-70ce2a75215e','realm_access.roles','claim.name'),('74f9cb5d-afb9-48bc-860e-70ce2a75215e','true','introspection.token.claim'),('74f9cb5d-afb9-48bc-860e-70ce2a75215e','String','jsonType.label'),('74f9cb5d-afb9-48bc-860e-70ce2a75215e','true','multivalued'),('74f9cb5d-afb9-48bc-860e-70ce2a75215e','foo','user.attribute'),('77687985-dc12-4881-a550-dd2897dbf055','true','access.token.claim'),('77687985-dc12-4881-a550-dd2897dbf055','true','introspection.token.claim'),('78e130d1-4dab-459a-9122-c10f7eea55a2','true','access.token.claim'),('78e130d1-4dab-459a-9122-c10f7eea55a2','website','claim.name'),('78e130d1-4dab-459a-9122-c10f7eea55a2','true','id.token.claim'),('78e130d1-4dab-459a-9122-c10f7eea55a2','true','introspection.token.claim'),('78e130d1-4dab-459a-9122-c10f7eea55a2','String','jsonType.label'),('78e130d1-4dab-459a-9122-c10f7eea55a2','website','user.attribute'),('78e130d1-4dab-459a-9122-c10f7eea55a2','true','userinfo.token.claim'),('7d4042ca-15e1-4230-a1a5-7ea0d1ba8faf','true','access.token.claim'),('7d4042ca-15e1-4230-a1a5-7ea0d1ba8faf','groups','claim.name'),('7d4042ca-15e1-4230-a1a5-7ea0d1ba8faf','true','id.token.claim'),('7d4042ca-15e1-4230-a1a5-7ea0d1ba8faf','true','introspection.token.claim'),('7d4042ca-15e1-4230-a1a5-7ea0d1ba8faf','String','jsonType.label'),('7d4042ca-15e1-4230-a1a5-7ea0d1ba8faf','true','multivalued'),('7d4042ca-15e1-4230-a1a5-7ea0d1ba8faf','foo','user.attribute'),('8038408e-03a7-4abe-af5d-a30953c49e25','true','access.token.claim'),('8038408e-03a7-4abe-af5d-a30953c49e25','email_verified','claim.name'),('8038408e-03a7-4abe-af5d-a30953c49e25','true','id.token.claim'),('8038408e-03a7-4abe-af5d-a30953c49e25','true','introspection.token.claim'),('8038408e-03a7-4abe-af5d-a30953c49e25','boolean','jsonType.label'),('8038408e-03a7-4abe-af5d-a30953c49e25','emailVerified','user.attribute'),('8038408e-03a7-4abe-af5d-a30953c49e25','true','userinfo.token.claim'),('826be89a-6dc1-4a07-97ab-16aa93d6e0ff','true','access.token.claim'),('826be89a-6dc1-4a07-97ab-16aa93d6e0ff','middle_name','claim.name'),('826be89a-6dc1-4a07-97ab-16aa93d6e0ff','true','id.token.claim'),('826be89a-6dc1-4a07-97ab-16aa93d6e0ff','true','introspection.token.claim'),('826be89a-6dc1-4a07-97ab-16aa93d6e0ff','String','jsonType.label'),('826be89a-6dc1-4a07-97ab-16aa93d6e0ff','middleName','user.attribute'),('826be89a-6dc1-4a07-97ab-16aa93d6e0ff','true','userinfo.token.claim'),('855186f8-c49a-4a8f-b757-78b6f1891566','true','access.token.claim'),('855186f8-c49a-4a8f-b757-78b6f1891566','gender','claim.name'),('855186f8-c49a-4a8f-b757-78b6f1891566','true','id.token.claim'),('855186f8-c49a-4a8f-b757-78b6f1891566','true','introspection.token.claim'),('855186f8-c49a-4a8f-b757-78b6f1891566','String','jsonType.label'),('855186f8-c49a-4a8f-b757-78b6f1891566','gender','user.attribute'),('855186f8-c49a-4a8f-b757-78b6f1891566','true','userinfo.token.claim'),('87ab6abb-bc36-4a20-84c3-d6b770db88bd','true','access.token.claim'),('87ab6abb-bc36-4a20-84c3-d6b770db88bd','email','claim.name'),('87ab6abb-bc36-4a20-84c3-d6b770db88bd','true','id.token.claim'),('87ab6abb-bc36-4a20-84c3-d6b770db88bd','true','introspection.token.claim'),('87ab6abb-bc36-4a20-84c3-d6b770db88bd','String','jsonType.label'),('87ab6abb-bc36-4a20-84c3-d6b770db88bd','email','user.attribute'),('87ab6abb-bc36-4a20-84c3-d6b770db88bd','true','userinfo.token.claim'),('8c834d54-77b4-4b77-9304-fcd80a6a659c','true','access.token.claim'),('8c834d54-77b4-4b77-9304-fcd80a6a659c','true','id.token.claim'),('8c834d54-77b4-4b77-9304-fcd80a6a659c','true','introspection.token.claim'),('8d7e73a2-0fa2-44c4-93fa-0c562a5bd6ad','true','access.token.claim'),('8d7e73a2-0fa2-44c4-93fa-0c562a5bd6ad','picture','claim.name'),('8d7e73a2-0fa2-44c4-93fa-0c562a5bd6ad','true','id.token.claim'),('8d7e73a2-0fa2-44c4-93fa-0c562a5bd6ad','true','introspection.token.claim'),('8d7e73a2-0fa2-44c4-93fa-0c562a5bd6ad','String','jsonType.label'),('8d7e73a2-0fa2-44c4-93fa-0c562a5bd6ad','picture','user.attribute'),('8d7e73a2-0fa2-44c4-93fa-0c562a5bd6ad','true','userinfo.token.claim'),('913976cf-8bd4-4445-bd9a-74b1a17e2da7','true','access.token.claim'),('913976cf-8bd4-4445-bd9a-74b1a17e2da7','true','id.token.claim'),('913976cf-8bd4-4445-bd9a-74b1a17e2da7','true','introspection.token.claim'),('913976cf-8bd4-4445-bd9a-74b1a17e2da7','country','user.attribute.country'),('913976cf-8bd4-4445-bd9a-74b1a17e2da7','formatted','user.attribute.formatted'),('913976cf-8bd4-4445-bd9a-74b1a17e2da7','locality','user.attribute.locality'),('913976cf-8bd4-4445-bd9a-74b1a17e2da7','postal_code','user.attribute.postal_code'),('913976cf-8bd4-4445-bd9a-74b1a17e2da7','region','user.attribute.region'),('913976cf-8bd4-4445-bd9a-74b1a17e2da7','street','user.attribute.street'),('913976cf-8bd4-4445-bd9a-74b1a17e2da7','true','userinfo.token.claim'),('9507ad16-f7f9-44c8-a859-5bb28b991f64','true','access.token.claim'),('9507ad16-f7f9-44c8-a859-5bb28b991f64','profile','claim.name'),('9507ad16-f7f9-44c8-a859-5bb28b991f64','true','id.token.claim'),('9507ad16-f7f9-44c8-a859-5bb28b991f64','true','introspection.token.claim'),('9507ad16-f7f9-44c8-a859-5bb28b991f64','String','jsonType.label'),('9507ad16-f7f9-44c8-a859-5bb28b991f64','profile','user.attribute'),('9507ad16-f7f9-44c8-a859-5bb28b991f64','true','userinfo.token.claim'),('959c424e-5231-400c-9103-25059f15f941','Role','attribute.name'),('959c424e-5231-400c-9103-25059f15f941','Basic','attribute.nameformat'),('959c424e-5231-400c-9103-25059f15f941','false','single'),('9b001346-61ae-4e54-b978-3d005b9a2477','true','access.token.claim'),('9b001346-61ae-4e54-b978-3d005b9a2477','preferred_username','claim.name'),('9b001346-61ae-4e54-b978-3d005b9a2477','true','id.token.claim'),('9b001346-61ae-4e54-b978-3d005b9a2477','true','introspection.token.claim'),('9b001346-61ae-4e54-b978-3d005b9a2477','String','jsonType.label'),('9b001346-61ae-4e54-b978-3d005b9a2477','username','user.attribute'),('9b001346-61ae-4e54-b978-3d005b9a2477','true','userinfo.token.claim'),('9c5bd2bc-8b69-4732-9479-a351eeee9c4f','true','access.token.claim'),('9c5bd2bc-8b69-4732-9479-a351eeee9c4f','phone_number','claim.name'),('9c5bd2bc-8b69-4732-9479-a351eeee9c4f','true','id.token.claim'),('9c5bd2bc-8b69-4732-9479-a351eeee9c4f','true','introspection.token.claim'),('9c5bd2bc-8b69-4732-9479-a351eeee9c4f','String','jsonType.label'),('9c5bd2bc-8b69-4732-9479-a351eeee9c4f','phoneNumber','user.attribute'),('9c5bd2bc-8b69-4732-9479-a351eeee9c4f','true','userinfo.token.claim'),('a78b62d4-420b-4c53-bc9e-e35956a46564','true','access.token.claim'),('a78b62d4-420b-4c53-bc9e-e35956a46564','true','id.token.claim'),('a78b62d4-420b-4c53-bc9e-e35956a46564','true','introspection.token.claim'),('a7e2564c-029a-4429-ab98-4ed6a8335876','true','access.token.claim'),('a7e2564c-029a-4429-ab98-4ed6a8335876','family_name','claim.name'),('a7e2564c-029a-4429-ab98-4ed6a8335876','true','id.token.claim'),('a7e2564c-029a-4429-ab98-4ed6a8335876','true','introspection.token.claim'),('a7e2564c-029a-4429-ab98-4ed6a8335876','String','jsonType.label'),('a7e2564c-029a-4429-ab98-4ed6a8335876','lastName','user.attribute'),('a7e2564c-029a-4429-ab98-4ed6a8335876','true','userinfo.token.claim'),('a888c7a4-a1ae-44b1-b6cc-f28474da06e0','true','access.token.claim'),('a888c7a4-a1ae-44b1-b6cc-f28474da06e0','locale','claim.name'),('a888c7a4-a1ae-44b1-b6cc-f28474da06e0','true','id.token.claim'),('a888c7a4-a1ae-44b1-b6cc-f28474da06e0','true','introspection.token.claim'),('a888c7a4-a1ae-44b1-b6cc-f28474da06e0','String','jsonType.label'),('a888c7a4-a1ae-44b1-b6cc-f28474da06e0','locale','user.attribute'),('a888c7a4-a1ae-44b1-b6cc-f28474da06e0','true','userinfo.token.claim'),('a929268c-a56c-44e6-9891-ad3c3e85ee91','true','access.token.claim'),('a929268c-a56c-44e6-9891-ad3c3e85ee91','given_name','claim.name'),('a929268c-a56c-44e6-9891-ad3c3e85ee91','true','id.token.claim'),('a929268c-a56c-44e6-9891-ad3c3e85ee91','true','introspection.token.claim'),('a929268c-a56c-44e6-9891-ad3c3e85ee91','String','jsonType.label'),('a929268c-a56c-44e6-9891-ad3c3e85ee91','firstName','user.attribute'),('a929268c-a56c-44e6-9891-ad3c3e85ee91','true','userinfo.token.claim'),('adb115d4-24dd-48ac-b36a-7eeb616db146','true','access.token.claim'),('adb115d4-24dd-48ac-b36a-7eeb616db146','realm_access.roles','claim.name'),('adb115d4-24dd-48ac-b36a-7eeb616db146','true','introspection.token.claim'),('adb115d4-24dd-48ac-b36a-7eeb616db146','String','jsonType.label'),('adb115d4-24dd-48ac-b36a-7eeb616db146','true','multivalued'),('adb115d4-24dd-48ac-b36a-7eeb616db146','foo','user.attribute'),('aeb18c44-62dc-4147-b644-a444032b3110','true','access.token.claim'),('aeb18c44-62dc-4147-b644-a444032b3110','email_verified','claim.name'),('aeb18c44-62dc-4147-b644-a444032b3110','true','id.token.claim'),('aeb18c44-62dc-4147-b644-a444032b3110','true','introspection.token.claim'),('aeb18c44-62dc-4147-b644-a444032b3110','boolean','jsonType.label'),('aeb18c44-62dc-4147-b644-a444032b3110','emailVerified','user.attribute'),('aeb18c44-62dc-4147-b644-a444032b3110','true','userinfo.token.claim'),('af40f52e-fb66-42d9-b90a-8ef926d51c0c','true','access.token.claim'),('af40f52e-fb66-42d9-b90a-8ef926d51c0c','family_name','claim.name'),('af40f52e-fb66-42d9-b90a-8ef926d51c0c','true','id.token.claim'),('af40f52e-fb66-42d9-b90a-8ef926d51c0c','true','introspection.token.claim'),('af40f52e-fb66-42d9-b90a-8ef926d51c0c','String','jsonType.label'),('af40f52e-fb66-42d9-b90a-8ef926d51c0c','lastName','user.attribute'),('af40f52e-fb66-42d9-b90a-8ef926d51c0c','true','userinfo.token.claim'),('b39c1ecc-ef7b-4ea5-87c1-5558c27fb1e2','true','access.token.claim'),('b39c1ecc-ef7b-4ea5-87c1-5558c27fb1e2','profile','claim.name'),('b39c1ecc-ef7b-4ea5-87c1-5558c27fb1e2','true','id.token.claim'),('b39c1ecc-ef7b-4ea5-87c1-5558c27fb1e2','true','introspection.token.claim'),('b39c1ecc-ef7b-4ea5-87c1-5558c27fb1e2','String','jsonType.label'),('b39c1ecc-ef7b-4ea5-87c1-5558c27fb1e2','profile','user.attribute'),('b39c1ecc-ef7b-4ea5-87c1-5558c27fb1e2','true','userinfo.token.claim'),('b6418051-49c7-4b14-92c7-9577c31a3700','true','access.token.claim'),('b6418051-49c7-4b14-92c7-9577c31a3700','realm_access.roles','claim.name'),('b6418051-49c7-4b14-92c7-9577c31a3700','true','introspection.token.claim'),('b6418051-49c7-4b14-92c7-9577c31a3700','String','jsonType.label'),('b6418051-49c7-4b14-92c7-9577c31a3700','true','multivalued'),('b6418051-49c7-4b14-92c7-9577c31a3700','foo','user.attribute'),('b7900c58-9a7c-4deb-b356-7502b473589d','true','access.token.claim'),('b7900c58-9a7c-4deb-b356-7502b473589d','upn','claim.name'),('b7900c58-9a7c-4deb-b356-7502b473589d','true','id.token.claim'),('b7900c58-9a7c-4deb-b356-7502b473589d','true','introspection.token.claim'),('b7900c58-9a7c-4deb-b356-7502b473589d','String','jsonType.label'),('b7900c58-9a7c-4deb-b356-7502b473589d','username','user.attribute'),('b7900c58-9a7c-4deb-b356-7502b473589d','true','userinfo.token.claim'),('b7ad7a93-f340-4bc7-924d-20b6c54f2900','true','access.token.claim'),('b7ad7a93-f340-4bc7-924d-20b6c54f2900','locale','claim.name'),('b7ad7a93-f340-4bc7-924d-20b6c54f2900','true','id.token.claim'),('b7ad7a93-f340-4bc7-924d-20b6c54f2900','true','introspection.token.claim'),('b7ad7a93-f340-4bc7-924d-20b6c54f2900','String','jsonType.label'),('b7ad7a93-f340-4bc7-924d-20b6c54f2900','locale','user.attribute'),('b7ad7a93-f340-4bc7-924d-20b6c54f2900','true','userinfo.token.claim'),('b8080066-08d9-4d78-960c-9817fbbbc4f5','true','access.token.claim'),('b8080066-08d9-4d78-960c-9817fbbbc4f5','clientHost','claim.name'),('b8080066-08d9-4d78-960c-9817fbbbc4f5','true','id.token.claim'),('b8080066-08d9-4d78-960c-9817fbbbc4f5','true','introspection.token.claim'),('b8080066-08d9-4d78-960c-9817fbbbc4f5','String','jsonType.label'),('b8080066-08d9-4d78-960c-9817fbbbc4f5','clientHost','user.session.note'),('bb0f29e0-74f3-4dd7-b881-e0f4a3153497','true','access.token.claim'),('bb0f29e0-74f3-4dd7-b881-e0f4a3153497','birthdate','claim.name'),('bb0f29e0-74f3-4dd7-b881-e0f4a3153497','true','id.token.claim'),('bb0f29e0-74f3-4dd7-b881-e0f4a3153497','true','introspection.token.claim'),('bb0f29e0-74f3-4dd7-b881-e0f4a3153497','String','jsonType.label'),('bb0f29e0-74f3-4dd7-b881-e0f4a3153497','birthdate','user.attribute'),('bb0f29e0-74f3-4dd7-b881-e0f4a3153497','true','userinfo.token.claim'),('bb5b9d78-82ac-4187-8375-9409679c422d','true','access.token.claim'),('bb5b9d78-82ac-4187-8375-9409679c422d','client_id','claim.name'),('bb5b9d78-82ac-4187-8375-9409679c422d','true','id.token.claim'),('bb5b9d78-82ac-4187-8375-9409679c422d','true','introspection.token.claim'),('bb5b9d78-82ac-4187-8375-9409679c422d','String','jsonType.label'),('bb5b9d78-82ac-4187-8375-9409679c422d','client_id','user.session.note'),('bcbc719a-11db-4d85-b804-7aec8a3908ad','true','access.token.claim'),('bcbc719a-11db-4d85-b804-7aec8a3908ad','email_verified','claim.name'),('bcbc719a-11db-4d85-b804-7aec8a3908ad','true','id.token.claim'),('bcbc719a-11db-4d85-b804-7aec8a3908ad','true','introspection.token.claim'),('bcbc719a-11db-4d85-b804-7aec8a3908ad','boolean','jsonType.label'),('bcbc719a-11db-4d85-b804-7aec8a3908ad','emailVerified','user.attribute'),('bcbc719a-11db-4d85-b804-7aec8a3908ad','true','userinfo.token.claim'),('bd998870-aa21-4dec-bf2f-9c25f5373763','true','access.token.claim'),('bd998870-aa21-4dec-bf2f-9c25f5373763','nickname','claim.name'),('bd998870-aa21-4dec-bf2f-9c25f5373763','true','id.token.claim'),('bd998870-aa21-4dec-bf2f-9c25f5373763','true','introspection.token.claim'),('bd998870-aa21-4dec-bf2f-9c25f5373763','String','jsonType.label'),('bd998870-aa21-4dec-bf2f-9c25f5373763','nickname','user.attribute'),('bd998870-aa21-4dec-bf2f-9c25f5373763','true','userinfo.token.claim'),('c0329780-9813-4fc7-b15f-064b8a601b00','Role','attribute.name'),('c0329780-9813-4fc7-b15f-064b8a601b00','Basic','attribute.nameformat'),('c0329780-9813-4fc7-b15f-064b8a601b00','false','single'),('c46619b0-0062-46f7-83f2-f2df7c5023c5','true','access.token.claim'),('c46619b0-0062-46f7-83f2-f2df7c5023c5','zoneinfo','claim.name'),('c46619b0-0062-46f7-83f2-f2df7c5023c5','true','id.token.claim'),('c46619b0-0062-46f7-83f2-f2df7c5023c5','true','introspection.token.claim'),('c46619b0-0062-46f7-83f2-f2df7c5023c5','String','jsonType.label'),('c46619b0-0062-46f7-83f2-f2df7c5023c5','zoneinfo','user.attribute'),('c46619b0-0062-46f7-83f2-f2df7c5023c5','true','userinfo.token.claim'),('c73e83a2-9709-4b66-bc53-94df5d1523d5','true','access.token.claim'),('c73e83a2-9709-4b66-bc53-94df5d1523d5','preferred_username','claim.name'),('c73e83a2-9709-4b66-bc53-94df5d1523d5','true','id.token.claim'),('c73e83a2-9709-4b66-bc53-94df5d1523d5','true','introspection.token.claim'),('c73e83a2-9709-4b66-bc53-94df5d1523d5','String','jsonType.label'),('c73e83a2-9709-4b66-bc53-94df5d1523d5','username','user.attribute'),('c73e83a2-9709-4b66-bc53-94df5d1523d5','true','userinfo.token.claim'),('cb352e9d-c918-450a-bfe8-7159b155e1c7','true','access.token.claim'),('cb352e9d-c918-450a-bfe8-7159b155e1c7','given_name','claim.name'),('cb352e9d-c918-450a-bfe8-7159b155e1c7','true','id.token.claim'),('cb352e9d-c918-450a-bfe8-7159b155e1c7','true','introspection.token.claim'),('cb352e9d-c918-450a-bfe8-7159b155e1c7','String','jsonType.label'),('cb352e9d-c918-450a-bfe8-7159b155e1c7','firstName','user.attribute'),('cb352e9d-c918-450a-bfe8-7159b155e1c7','true','userinfo.token.claim'),('cbb2e853-3c80-4fe1-83be-3961a5425e45','true','access.token.claim'),('cbb2e853-3c80-4fe1-83be-3961a5425e45','true','id.token.claim'),('cbb2e853-3c80-4fe1-83be-3961a5425e45','true','introspection.token.claim'),('cbb2e853-3c80-4fe1-83be-3961a5425e45','true','userinfo.token.claim'),('cdbcc902-a5c8-4137-963a-b9b32837dbc0','true','access.token.claim'),('cdbcc902-a5c8-4137-963a-b9b32837dbc0','true','id.token.claim'),('cdbcc902-a5c8-4137-963a-b9b32837dbc0','true','introspection.token.claim'),('cdbcc902-a5c8-4137-963a-b9b32837dbc0','true','userinfo.token.claim'),('cff74a7f-68ee-4fe4-a78b-18b91acc5280','true','access.token.claim'),('cff74a7f-68ee-4fe4-a78b-18b91acc5280','zoneinfo','claim.name'),('cff74a7f-68ee-4fe4-a78b-18b91acc5280','true','id.token.claim'),('cff74a7f-68ee-4fe4-a78b-18b91acc5280','true','introspection.token.claim'),('cff74a7f-68ee-4fe4-a78b-18b91acc5280','String','jsonType.label'),('cff74a7f-68ee-4fe4-a78b-18b91acc5280','zoneinfo','user.attribute'),('cff74a7f-68ee-4fe4-a78b-18b91acc5280','true','userinfo.token.claim'),('d027e978-2535-4927-b078-3d10a106ce68','true','access.token.claim'),('d027e978-2535-4927-b078-3d10a106ce68','nickname','claim.name'),('d027e978-2535-4927-b078-3d10a106ce68','true','id.token.claim'),('d027e978-2535-4927-b078-3d10a106ce68','true','introspection.token.claim'),('d027e978-2535-4927-b078-3d10a106ce68','String','jsonType.label'),('d027e978-2535-4927-b078-3d10a106ce68','nickname','user.attribute'),('d027e978-2535-4927-b078-3d10a106ce68','true','userinfo.token.claim'),('d44818e4-c905-4056-94f1-44222fb53b8e','true','access.token.claim'),('d44818e4-c905-4056-94f1-44222fb53b8e','true','introspection.token.claim'),('d60186c4-f744-47e4-8a8a-788f103c3e61','true','access.token.claim'),('d60186c4-f744-47e4-8a8a-788f103c3e61','birthdate','claim.name'),('d60186c4-f744-47e4-8a8a-788f103c3e61','true','id.token.claim'),('d60186c4-f744-47e4-8a8a-788f103c3e61','true','introspection.token.claim'),('d60186c4-f744-47e4-8a8a-788f103c3e61','String','jsonType.label'),('d60186c4-f744-47e4-8a8a-788f103c3e61','birthdate','user.attribute'),('d60186c4-f744-47e4-8a8a-788f103c3e61','true','userinfo.token.claim'),('da3f1847-7602-42df-8b51-a9a4ce9bce04','true','access.token.claim'),('da3f1847-7602-42df-8b51-a9a4ce9bce04','resource_access.${client_id}.roles','claim.name'),('da3f1847-7602-42df-8b51-a9a4ce9bce04','true','introspection.token.claim'),('da3f1847-7602-42df-8b51-a9a4ce9bce04','String','jsonType.label'),('da3f1847-7602-42df-8b51-a9a4ce9bce04','true','multivalued'),('da3f1847-7602-42df-8b51-a9a4ce9bce04','foo','user.attribute'),('db912431-c21f-455b-85ee-0f7f301a76ed','true','access.token.claim'),('db912431-c21f-455b-85ee-0f7f301a76ed','phone_number_verified','claim.name'),('db912431-c21f-455b-85ee-0f7f301a76ed','true','id.token.claim'),('db912431-c21f-455b-85ee-0f7f301a76ed','true','introspection.token.claim'),('db912431-c21f-455b-85ee-0f7f301a76ed','boolean','jsonType.label'),('db912431-c21f-455b-85ee-0f7f301a76ed','phoneNumberVerified','user.attribute'),('db912431-c21f-455b-85ee-0f7f301a76ed','true','userinfo.token.claim'),('de323a4a-b118-4679-b4f3-49b4cac58a56','true','access.token.claim'),('de323a4a-b118-4679-b4f3-49b4cac58a56','birthdate','claim.name'),('de323a4a-b118-4679-b4f3-49b4cac58a56','true','id.token.claim'),('de323a4a-b118-4679-b4f3-49b4cac58a56','true','introspection.token.claim'),('de323a4a-b118-4679-b4f3-49b4cac58a56','String','jsonType.label'),('de323a4a-b118-4679-b4f3-49b4cac58a56','birthdate','user.attribute'),('de323a4a-b118-4679-b4f3-49b4cac58a56','true','userinfo.token.claim'),('de328d57-1f8a-4fcf-b9db-0d3df6af9d88','true','access.token.claim'),('de328d57-1f8a-4fcf-b9db-0d3df6af9d88','updated_at','claim.name'),('de328d57-1f8a-4fcf-b9db-0d3df6af9d88','true','id.token.claim'),('de328d57-1f8a-4fcf-b9db-0d3df6af9d88','true','introspection.token.claim'),('de328d57-1f8a-4fcf-b9db-0d3df6af9d88','long','jsonType.label'),('de328d57-1f8a-4fcf-b9db-0d3df6af9d88','updatedAt','user.attribute'),('de328d57-1f8a-4fcf-b9db-0d3df6af9d88','true','userinfo.token.claim'),('de82064c-48da-4979-bbec-bd43b4cd4183','true','access.token.claim'),('de82064c-48da-4979-bbec-bd43b4cd4183','email','claim.name'),('de82064c-48da-4979-bbec-bd43b4cd4183','true','id.token.claim'),('de82064c-48da-4979-bbec-bd43b4cd4183','true','introspection.token.claim'),('de82064c-48da-4979-bbec-bd43b4cd4183','String','jsonType.label'),('de82064c-48da-4979-bbec-bd43b4cd4183','email','user.attribute'),('de82064c-48da-4979-bbec-bd43b4cd4183','true','userinfo.token.claim'),('e30eaacd-ddce-4eb8-96c4-d7422479941a','true','access.token.claim'),('e30eaacd-ddce-4eb8-96c4-d7422479941a','groups','claim.name'),('e30eaacd-ddce-4eb8-96c4-d7422479941a','true','id.token.claim'),('e30eaacd-ddce-4eb8-96c4-d7422479941a','true','introspection.token.claim'),('e30eaacd-ddce-4eb8-96c4-d7422479941a','String','jsonType.label'),('e30eaacd-ddce-4eb8-96c4-d7422479941a','true','multivalued'),('e30eaacd-ddce-4eb8-96c4-d7422479941a','foo','user.attribute'),('e44e0ec9-c61c-4e1d-9778-050302bc5585','true','access.token.claim'),('e44e0ec9-c61c-4e1d-9778-050302bc5585','picture','claim.name'),('e44e0ec9-c61c-4e1d-9778-050302bc5585','true','id.token.claim'),('e44e0ec9-c61c-4e1d-9778-050302bc5585','true','introspection.token.claim'),('e44e0ec9-c61c-4e1d-9778-050302bc5585','String','jsonType.label'),('e44e0ec9-c61c-4e1d-9778-050302bc5585','picture','user.attribute'),('e44e0ec9-c61c-4e1d-9778-050302bc5585','true','userinfo.token.claim'),('f24a01c2-61a2-42c6-a741-07eaeb352661','true','access.token.claim'),('f24a01c2-61a2-42c6-a741-07eaeb352661','true','id.token.claim'),('f24a01c2-61a2-42c6-a741-07eaeb352661','true','introspection.token.claim'),('fc0cbbf2-8e94-4481-b248-938c345e7a00','true','access.token.claim'),('fc0cbbf2-8e94-4481-b248-938c345e7a00','roles','claim.name'),('fc0cbbf2-8e94-4481-b248-938c345e7a00','true','id.token.claim'),('fc0cbbf2-8e94-4481-b248-938c345e7a00','true','introspection.token.claim'),('fc0cbbf2-8e94-4481-b248-938c345e7a00','String','jsonType.label'),('fc0cbbf2-8e94-4481-b248-938c345e7a00','false','lightweight.claim'),('fc0cbbf2-8e94-4481-b248-938c345e7a00','true','multivalued'),('fc0cbbf2-8e94-4481-b248-938c345e7a00','true','userinfo.token.claim'),('fe7c701a-394d-4e39-9f10-5c1696fb0bb4','Role','attribute.name'),('fe7c701a-394d-4e39-9f10-5c1696fb0bb4','Basic','attribute.nameformat'),('fe7c701a-394d-4e39-9f10-5c1696fb0bb4','false','single'),('fee13dbf-cf99-46ab-ae81-63ad14726c7e','true','access.token.claim'),('fee13dbf-cf99-46ab-ae81-63ad14726c7e','resource_access.${client_id}.roles','claim.name'),('fee13dbf-cf99-46ab-ae81-63ad14726c7e','true','introspection.token.claim'),('fee13dbf-cf99-46ab-ae81-63ad14726c7e','String','jsonType.label'),('fee13dbf-cf99-46ab-ae81-63ad14726c7e','true','multivalued'),('fee13dbf-cf99-46ab-ae81-63ad14726c7e','foo','user.attribute');
/*!40000 ALTER TABLE `protocol_mapper_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `realm`
--

DROP TABLE IF EXISTS `realm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `realm` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ACCESS_CODE_LIFESPAN` int DEFAULT NULL,
  `USER_ACTION_LIFESPAN` int DEFAULT NULL,
  `ACCESS_TOKEN_LIFESPAN` int DEFAULT NULL,
  `ACCOUNT_THEME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ADMIN_THEME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EMAIL_THEME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ENABLED` tinyint NOT NULL DEFAULT '0',
  `EVENTS_ENABLED` tinyint NOT NULL DEFAULT '0',
  `EVENTS_EXPIRATION` bigint DEFAULT NULL,
  `LOGIN_THEME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NOT_BEFORE` int DEFAULT NULL,
  `PASSWORD_POLICY` text COLLATE utf8mb4_unicode_ci,
  `REGISTRATION_ALLOWED` tinyint NOT NULL DEFAULT '0',
  `REMEMBER_ME` tinyint NOT NULL DEFAULT '0',
  `RESET_PASSWORD_ALLOWED` tinyint NOT NULL DEFAULT '0',
  `SOCIAL` tinyint NOT NULL DEFAULT '0',
  `SSL_REQUIRED` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SSO_IDLE_TIMEOUT` int DEFAULT NULL,
  `SSO_MAX_LIFESPAN` int DEFAULT NULL,
  `UPDATE_PROFILE_ON_SOC_LOGIN` tinyint NOT NULL DEFAULT '0',
  `VERIFY_EMAIL` tinyint NOT NULL DEFAULT '0',
  `MASTER_ADMIN_CLIENT` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LOGIN_LIFESPAN` int DEFAULT NULL,
  `INTERNATIONALIZATION_ENABLED` tinyint NOT NULL DEFAULT '0',
  `DEFAULT_LOCALE` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REG_EMAIL_AS_USERNAME` tinyint NOT NULL DEFAULT '0',
  `ADMIN_EVENTS_ENABLED` tinyint NOT NULL DEFAULT '0',
  `ADMIN_EVENTS_DETAILS_ENABLED` tinyint NOT NULL DEFAULT '0',
  `EDIT_USERNAME_ALLOWED` tinyint NOT NULL DEFAULT '0',
  `OTP_POLICY_COUNTER` int DEFAULT '0',
  `OTP_POLICY_WINDOW` int DEFAULT '1',
  `OTP_POLICY_PERIOD` int DEFAULT '30',
  `OTP_POLICY_DIGITS` int DEFAULT '6',
  `OTP_POLICY_ALG` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT 'HmacSHA1',
  `OTP_POLICY_TYPE` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT 'totp',
  `BROWSER_FLOW` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REGISTRATION_FLOW` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DIRECT_GRANT_FLOW` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RESET_CREDENTIALS_FLOW` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CLIENT_AUTH_FLOW` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OFFLINE_SESSION_IDLE_TIMEOUT` int DEFAULT '0',
  `REVOKE_REFRESH_TOKEN` tinyint NOT NULL DEFAULT '0',
  `ACCESS_TOKEN_LIFE_IMPLICIT` int DEFAULT '0',
  `LOGIN_WITH_EMAIL_ALLOWED` tinyint NOT NULL DEFAULT '1',
  `DUPLICATE_EMAILS_ALLOWED` tinyint NOT NULL DEFAULT '0',
  `DOCKER_AUTH_FLOW` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REFRESH_TOKEN_MAX_REUSE` int DEFAULT '0',
  `ALLOW_USER_MANAGED_ACCESS` tinyint NOT NULL DEFAULT '0',
  `SSO_MAX_LIFESPAN_REMEMBER_ME` int NOT NULL,
  `SSO_IDLE_TIMEOUT_REMEMBER_ME` int NOT NULL,
  `DEFAULT_ROLE` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_ORVSDMLA56612EAEFIQ6WL5OI` (`NAME`),
  KEY `IDX_REALM_MASTER_ADM_CLI` (`MASTER_ADMIN_CLIENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `realm`
--

LOCK TABLES `realm` WRITE;
/*!40000 ALTER TABLE `realm` DISABLE KEYS */;
INSERT INTO `realm` VALUES ('0245a4ff-801f-41e9-9805-a700847ddf88',60,300,300,NULL,NULL,NULL,1,0,0,NULL,'ou-graduation-realm',0,NULL,0,0,0,0,'EXTERNAL',1800,36000,0,0,'c10ec634-a81f-4355-b749-d99c902f0897',1800,0,NULL,0,0,0,0,0,1,30,6,'HmacSHA1','totp','2601fc30-1862-42dd-a970-2987f0ee8e5f','79d73a47-ed60-4374-8f8d-0363d1830813','988cc17f-214f-4c8c-a3df-2e8105b58356','3dcd38d8-3784-46bd-8c54-fd9ce2988103','61fd2679-eb16-420d-8ea5-abbf122381f4',2592000,0,900,1,0,'3b94527b-b374-4772-b673-a27007768a91',0,0,0,0,'fb60f2d1-c064-4abe-a498-65eba6ed1bb2'),('463f633d-c02e-4537-931f-fc87ef88ecdb',60,300,60,NULL,NULL,NULL,1,0,0,NULL,'master',0,NULL,0,0,0,0,'EXTERNAL',1800,36000,0,0,'7ad9bf4d-fbfc-4678-b78c-e6a999956eed',1800,0,NULL,0,0,0,0,0,1,30,6,'HmacSHA1','totp','6c52af22-cdf8-483e-b715-971f5f3c8e29','5f9ded6a-fa4d-430e-9452-344d48b02c3e','f19cc9ba-6ad5-4bf0-9cec-e08c0ebeaef6','02e555d1-217c-4102-b9e5-569e186ba619','bad5adab-d7d1-40a7-8270-7a9c061e30ed',2592000,0,900,1,0,'a037644f-bfe2-4ffa-94b5-11d5710f51c2',0,0,0,0,'f9d384ae-3301-4b99-b288-45b0f98ff960'),('e5a722b4-3b15-40ad-bf03-242dffaa63c2',60,300,1800,NULL,NULL,NULL,1,0,0,NULL,'demo-keycloak',0,NULL,0,0,0,0,'EXTERNAL',86400,36000,0,0,'459679dc-48b0-4ced-8b8b-5a5b6dc073ad',1800,0,NULL,0,0,0,0,0,1,30,6,'HmacSHA1','totp','eece1373-606c-49f1-885e-e41cc01e6b5a','f4b75587-69f2-42bd-8a1e-c9a0ca445733','758bb1e0-6463-4b1f-bd0c-765e0b32c029','b6a38793-471c-4c26-8022-f2345f4a194e','33ce3cbe-c472-4b64-bb23-9f0eb32766b3',2592000,1,900,1,0,'cc0fc834-b1ce-42a2-9c33-b54a0dd36bd1',2,0,0,0,'eee1e37b-271f-489e-8549-7a19b2846d72');
/*!40000 ALTER TABLE `realm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `realm_attribute`
--

DROP TABLE IF EXISTS `realm_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `realm_attribute` (
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  PRIMARY KEY (`NAME`,`REALM_ID`),
  KEY `IDX_REALM_ATTR_REALM` (`REALM_ID`),
  CONSTRAINT `FK_8SHXD6L3E9ATQUKACXGPFFPTW` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `realm_attribute`
--

LOCK TABLES `realm_attribute` WRITE;
/*!40000 ALTER TABLE `realm_attribute` DISABLE KEYS */;
INSERT INTO `realm_attribute` VALUES ('_browser_header.contentSecurityPolicy','0245a4ff-801f-41e9-9805-a700847ddf88','frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';'),('_browser_header.contentSecurityPolicy','463f633d-c02e-4537-931f-fc87ef88ecdb','frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';'),('_browser_header.contentSecurityPolicy','e5a722b4-3b15-40ad-bf03-242dffaa63c2','frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';'),('_browser_header.contentSecurityPolicyReportOnly','0245a4ff-801f-41e9-9805-a700847ddf88',''),('_browser_header.contentSecurityPolicyReportOnly','463f633d-c02e-4537-931f-fc87ef88ecdb',''),('_browser_header.contentSecurityPolicyReportOnly','e5a722b4-3b15-40ad-bf03-242dffaa63c2',''),('_browser_header.referrerPolicy','0245a4ff-801f-41e9-9805-a700847ddf88','no-referrer'),('_browser_header.referrerPolicy','463f633d-c02e-4537-931f-fc87ef88ecdb','no-referrer'),('_browser_header.referrerPolicy','e5a722b4-3b15-40ad-bf03-242dffaa63c2','no-referrer'),('_browser_header.strictTransportSecurity','0245a4ff-801f-41e9-9805-a700847ddf88','max-age=31536000; includeSubDomains'),('_browser_header.strictTransportSecurity','463f633d-c02e-4537-931f-fc87ef88ecdb','max-age=31536000; includeSubDomains'),('_browser_header.strictTransportSecurity','e5a722b4-3b15-40ad-bf03-242dffaa63c2','max-age=31536000; includeSubDomains'),('_browser_header.xContentTypeOptions','0245a4ff-801f-41e9-9805-a700847ddf88','nosniff'),('_browser_header.xContentTypeOptions','463f633d-c02e-4537-931f-fc87ef88ecdb','nosniff'),('_browser_header.xContentTypeOptions','e5a722b4-3b15-40ad-bf03-242dffaa63c2','nosniff'),('_browser_header.xFrameOptions','0245a4ff-801f-41e9-9805-a700847ddf88','SAMEORIGIN'),('_browser_header.xFrameOptions','463f633d-c02e-4537-931f-fc87ef88ecdb','SAMEORIGIN'),('_browser_header.xFrameOptions','e5a722b4-3b15-40ad-bf03-242dffaa63c2','SAMEORIGIN'),('_browser_header.xRobotsTag','0245a4ff-801f-41e9-9805-a700847ddf88','none'),('_browser_header.xRobotsTag','463f633d-c02e-4537-931f-fc87ef88ecdb','none'),('_browser_header.xRobotsTag','e5a722b4-3b15-40ad-bf03-242dffaa63c2','none'),('_browser_header.xXSSProtection','0245a4ff-801f-41e9-9805-a700847ddf88','1; mode=block'),('_browser_header.xXSSProtection','463f633d-c02e-4537-931f-fc87ef88ecdb','1; mode=block'),('_browser_header.xXSSProtection','e5a722b4-3b15-40ad-bf03-242dffaa63c2','1; mode=block'),('actionTokenGeneratedByAdminLifespan','0245a4ff-801f-41e9-9805-a700847ddf88','43200'),('actionTokenGeneratedByAdminLifespan','e5a722b4-3b15-40ad-bf03-242dffaa63c2','43200'),('actionTokenGeneratedByUserLifespan','0245a4ff-801f-41e9-9805-a700847ddf88','300'),('actionTokenGeneratedByUserLifespan','e5a722b4-3b15-40ad-bf03-242dffaa63c2','300'),('actionTokenGeneratedByUserLifespan.execute-actions','e5a722b4-3b15-40ad-bf03-242dffaa63c2',''),('actionTokenGeneratedByUserLifespan.idp-verify-account-via-email','e5a722b4-3b15-40ad-bf03-242dffaa63c2',''),('actionTokenGeneratedByUserLifespan.reset-credentials','e5a722b4-3b15-40ad-bf03-242dffaa63c2',''),('actionTokenGeneratedByUserLifespan.verify-email','e5a722b4-3b15-40ad-bf03-242dffaa63c2',''),('bruteForceProtected','0245a4ff-801f-41e9-9805-a700847ddf88','false'),('bruteForceProtected','463f633d-c02e-4537-931f-fc87ef88ecdb','false'),('bruteForceProtected','e5a722b4-3b15-40ad-bf03-242dffaa63c2','false'),('cibaAuthRequestedUserHint','0245a4ff-801f-41e9-9805-a700847ddf88','login_hint'),('cibaAuthRequestedUserHint','e5a722b4-3b15-40ad-bf03-242dffaa63c2','login_hint'),('cibaBackchannelTokenDeliveryMode','0245a4ff-801f-41e9-9805-a700847ddf88','poll'),('cibaBackchannelTokenDeliveryMode','e5a722b4-3b15-40ad-bf03-242dffaa63c2','poll'),('cibaExpiresIn','0245a4ff-801f-41e9-9805-a700847ddf88','120'),('cibaExpiresIn','e5a722b4-3b15-40ad-bf03-242dffaa63c2','120'),('cibaInterval','0245a4ff-801f-41e9-9805-a700847ddf88','5'),('cibaInterval','e5a722b4-3b15-40ad-bf03-242dffaa63c2','5'),('client-policies.policies','e5a722b4-3b15-40ad-bf03-242dffaa63c2','{\"policies\":[]}'),('client-policies.profiles','e5a722b4-3b15-40ad-bf03-242dffaa63c2','{\"profiles\":[]}'),('clientOfflineSessionIdleTimeout','e5a722b4-3b15-40ad-bf03-242dffaa63c2','0'),('clientOfflineSessionMaxLifespan','e5a722b4-3b15-40ad-bf03-242dffaa63c2','0'),('clientSessionIdleTimeout','e5a722b4-3b15-40ad-bf03-242dffaa63c2','0'),('clientSessionMaxLifespan','e5a722b4-3b15-40ad-bf03-242dffaa63c2','0'),('defaultSignatureAlgorithm','0245a4ff-801f-41e9-9805-a700847ddf88','RS256'),('defaultSignatureAlgorithm','463f633d-c02e-4537-931f-fc87ef88ecdb','RS256'),('defaultSignatureAlgorithm','e5a722b4-3b15-40ad-bf03-242dffaa63c2','RS256'),('displayName','463f633d-c02e-4537-931f-fc87ef88ecdb','Keycloak'),('displayNameHtml','463f633d-c02e-4537-931f-fc87ef88ecdb','<div class=\"kc-logo-text\"><span>Keycloak</span></div>'),('failureFactor','0245a4ff-801f-41e9-9805-a700847ddf88','30'),('failureFactor','463f633d-c02e-4537-931f-fc87ef88ecdb','30'),('failureFactor','e5a722b4-3b15-40ad-bf03-242dffaa63c2','30'),('firstBrokerLoginFlowId','0245a4ff-801f-41e9-9805-a700847ddf88','2ec5e687-26e7-448f-a142-19902d494d5c'),('firstBrokerLoginFlowId','463f633d-c02e-4537-931f-fc87ef88ecdb','8dc49702-2d63-4c8e-a8c0-1a617ba1660e'),('firstBrokerLoginFlowId','e5a722b4-3b15-40ad-bf03-242dffaa63c2','c3a84e59-140b-4811-a472-6dd08e913d32'),('maxDeltaTimeSeconds','0245a4ff-801f-41e9-9805-a700847ddf88','43200'),('maxDeltaTimeSeconds','463f633d-c02e-4537-931f-fc87ef88ecdb','43200'),('maxDeltaTimeSeconds','e5a722b4-3b15-40ad-bf03-242dffaa63c2','43200'),('maxFailureWaitSeconds','0245a4ff-801f-41e9-9805-a700847ddf88','900'),('maxFailureWaitSeconds','463f633d-c02e-4537-931f-fc87ef88ecdb','900'),('maxFailureWaitSeconds','e5a722b4-3b15-40ad-bf03-242dffaa63c2','900'),('maxTemporaryLockouts','0245a4ff-801f-41e9-9805-a700847ddf88','0'),('maxTemporaryLockouts','463f633d-c02e-4537-931f-fc87ef88ecdb','0'),('maxTemporaryLockouts','e5a722b4-3b15-40ad-bf03-242dffaa63c2','0'),('minimumQuickLoginWaitSeconds','0245a4ff-801f-41e9-9805-a700847ddf88','60'),('minimumQuickLoginWaitSeconds','463f633d-c02e-4537-931f-fc87ef88ecdb','60'),('minimumQuickLoginWaitSeconds','e5a722b4-3b15-40ad-bf03-242dffaa63c2','60'),('oauth2DeviceCodeLifespan','0245a4ff-801f-41e9-9805-a700847ddf88','600'),('oauth2DeviceCodeLifespan','e5a722b4-3b15-40ad-bf03-242dffaa63c2','600'),('oauth2DevicePollingInterval','0245a4ff-801f-41e9-9805-a700847ddf88','5'),('oauth2DevicePollingInterval','e5a722b4-3b15-40ad-bf03-242dffaa63c2','5'),('offlineSessionMaxLifespan','0245a4ff-801f-41e9-9805-a700847ddf88','5184000'),('offlineSessionMaxLifespan','463f633d-c02e-4537-931f-fc87ef88ecdb','5184000'),('offlineSessionMaxLifespan','e5a722b4-3b15-40ad-bf03-242dffaa63c2','5184000'),('offlineSessionMaxLifespanEnabled','0245a4ff-801f-41e9-9805-a700847ddf88','false'),('offlineSessionMaxLifespanEnabled','463f633d-c02e-4537-931f-fc87ef88ecdb','false'),('offlineSessionMaxLifespanEnabled','e5a722b4-3b15-40ad-bf03-242dffaa63c2','false'),('parRequestUriLifespan','0245a4ff-801f-41e9-9805-a700847ddf88','60'),('parRequestUriLifespan','e5a722b4-3b15-40ad-bf03-242dffaa63c2','60'),('permanentLockout','0245a4ff-801f-41e9-9805-a700847ddf88','false'),('permanentLockout','463f633d-c02e-4537-931f-fc87ef88ecdb','false'),('permanentLockout','e5a722b4-3b15-40ad-bf03-242dffaa63c2','false'),('quickLoginCheckMilliSeconds','0245a4ff-801f-41e9-9805-a700847ddf88','1000'),('quickLoginCheckMilliSeconds','463f633d-c02e-4537-931f-fc87ef88ecdb','1000'),('quickLoginCheckMilliSeconds','e5a722b4-3b15-40ad-bf03-242dffaa63c2','1000'),('realmReusableOtpCode','0245a4ff-801f-41e9-9805-a700847ddf88','false'),('realmReusableOtpCode','463f633d-c02e-4537-931f-fc87ef88ecdb','false'),('realmReusableOtpCode','e5a722b4-3b15-40ad-bf03-242dffaa63c2','false'),('shortVerificationUri','e5a722b4-3b15-40ad-bf03-242dffaa63c2',''),('waitIncrementSeconds','0245a4ff-801f-41e9-9805-a700847ddf88','60'),('waitIncrementSeconds','463f633d-c02e-4537-931f-fc87ef88ecdb','60'),('waitIncrementSeconds','e5a722b4-3b15-40ad-bf03-242dffaa63c2','60'),('webAuthnPolicyAttestationConveyancePreference','0245a4ff-801f-41e9-9805-a700847ddf88','not specified'),('webAuthnPolicyAttestationConveyancePreference','e5a722b4-3b15-40ad-bf03-242dffaa63c2','not specified'),('webAuthnPolicyAttestationConveyancePreferencePasswordless','0245a4ff-801f-41e9-9805-a700847ddf88','not specified'),('webAuthnPolicyAttestationConveyancePreferencePasswordless','e5a722b4-3b15-40ad-bf03-242dffaa63c2','not specified'),('webAuthnPolicyAuthenticatorAttachment','0245a4ff-801f-41e9-9805-a700847ddf88','not specified'),('webAuthnPolicyAuthenticatorAttachment','e5a722b4-3b15-40ad-bf03-242dffaa63c2','not specified'),('webAuthnPolicyAuthenticatorAttachmentPasswordless','0245a4ff-801f-41e9-9805-a700847ddf88','not specified'),('webAuthnPolicyAuthenticatorAttachmentPasswordless','e5a722b4-3b15-40ad-bf03-242dffaa63c2','not specified'),('webAuthnPolicyAvoidSameAuthenticatorRegister','0245a4ff-801f-41e9-9805-a700847ddf88','false'),('webAuthnPolicyAvoidSameAuthenticatorRegister','e5a722b4-3b15-40ad-bf03-242dffaa63c2','false'),('webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless','0245a4ff-801f-41e9-9805-a700847ddf88','false'),('webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless','e5a722b4-3b15-40ad-bf03-242dffaa63c2','false'),('webAuthnPolicyCreateTimeout','0245a4ff-801f-41e9-9805-a700847ddf88','0'),('webAuthnPolicyCreateTimeout','e5a722b4-3b15-40ad-bf03-242dffaa63c2','0'),('webAuthnPolicyCreateTimeoutPasswordless','0245a4ff-801f-41e9-9805-a700847ddf88','0'),('webAuthnPolicyCreateTimeoutPasswordless','e5a722b4-3b15-40ad-bf03-242dffaa63c2','0'),('webAuthnPolicyRequireResidentKey','0245a4ff-801f-41e9-9805-a700847ddf88','not specified'),('webAuthnPolicyRequireResidentKey','e5a722b4-3b15-40ad-bf03-242dffaa63c2','not specified'),('webAuthnPolicyRequireResidentKeyPasswordless','0245a4ff-801f-41e9-9805-a700847ddf88','not specified'),('webAuthnPolicyRequireResidentKeyPasswordless','e5a722b4-3b15-40ad-bf03-242dffaa63c2','not specified'),('webAuthnPolicyRpEntityName','0245a4ff-801f-41e9-9805-a700847ddf88','keycloak'),('webAuthnPolicyRpEntityName','e5a722b4-3b15-40ad-bf03-242dffaa63c2','keycloak'),('webAuthnPolicyRpEntityNamePasswordless','0245a4ff-801f-41e9-9805-a700847ddf88','keycloak'),('webAuthnPolicyRpEntityNamePasswordless','e5a722b4-3b15-40ad-bf03-242dffaa63c2','keycloak'),('webAuthnPolicyRpId','0245a4ff-801f-41e9-9805-a700847ddf88',''),('webAuthnPolicyRpId','e5a722b4-3b15-40ad-bf03-242dffaa63c2',''),('webAuthnPolicyRpIdPasswordless','0245a4ff-801f-41e9-9805-a700847ddf88',''),('webAuthnPolicyRpIdPasswordless','e5a722b4-3b15-40ad-bf03-242dffaa63c2',''),('webAuthnPolicySignatureAlgorithms','0245a4ff-801f-41e9-9805-a700847ddf88','ES256'),('webAuthnPolicySignatureAlgorithms','e5a722b4-3b15-40ad-bf03-242dffaa63c2','ES256'),('webAuthnPolicySignatureAlgorithmsPasswordless','0245a4ff-801f-41e9-9805-a700847ddf88','ES256'),('webAuthnPolicySignatureAlgorithmsPasswordless','e5a722b4-3b15-40ad-bf03-242dffaa63c2','ES256'),('webAuthnPolicyUserVerificationRequirement','0245a4ff-801f-41e9-9805-a700847ddf88','not specified'),('webAuthnPolicyUserVerificationRequirement','e5a722b4-3b15-40ad-bf03-242dffaa63c2','not specified'),('webAuthnPolicyUserVerificationRequirementPasswordless','0245a4ff-801f-41e9-9805-a700847ddf88','not specified'),('webAuthnPolicyUserVerificationRequirementPasswordless','e5a722b4-3b15-40ad-bf03-242dffaa63c2','not specified');
/*!40000 ALTER TABLE `realm_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `realm_default_groups`
--

DROP TABLE IF EXISTS `realm_default_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `realm_default_groups` (
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `GROUP_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`REALM_ID`,`GROUP_ID`),
  UNIQUE KEY `CON_GROUP_ID_DEF_GROUPS` (`GROUP_ID`),
  KEY `IDX_REALM_DEF_GRP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_DEF_GROUPS_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `realm_default_groups`
--

LOCK TABLES `realm_default_groups` WRITE;
/*!40000 ALTER TABLE `realm_default_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `realm_default_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `realm_enabled_event_types`
--

DROP TABLE IF EXISTS `realm_enabled_event_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `realm_enabled_event_types` (
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_EVT_TYPES_REALM` (`REALM_ID`),
  CONSTRAINT `FK_H846O4H0W8EPX5NWEDRF5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `realm_enabled_event_types`
--

LOCK TABLES `realm_enabled_event_types` WRITE;
/*!40000 ALTER TABLE `realm_enabled_event_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `realm_enabled_event_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `realm_events_listeners`
--

DROP TABLE IF EXISTS `realm_events_listeners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `realm_events_listeners` (
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_EVT_LIST_REALM` (`REALM_ID`),
  CONSTRAINT `FK_H846O4H0W8EPX5NXEV9F5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `realm_events_listeners`
--

LOCK TABLES `realm_events_listeners` WRITE;
/*!40000 ALTER TABLE `realm_events_listeners` DISABLE KEYS */;
INSERT INTO `realm_events_listeners` VALUES ('0245a4ff-801f-41e9-9805-a700847ddf88','jboss-logging'),('463f633d-c02e-4537-931f-fc87ef88ecdb','jboss-logging'),('e5a722b4-3b15-40ad-bf03-242dffaa63c2','jboss-logging');
/*!40000 ALTER TABLE `realm_events_listeners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `realm_localizations`
--

DROP TABLE IF EXISTS `realm_localizations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `realm_localizations` (
  `REALM_ID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `LOCALE` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TEXTS` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`REALM_ID`,`LOCALE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `realm_localizations`
--

LOCK TABLES `realm_localizations` WRITE;
/*!40000 ALTER TABLE `realm_localizations` DISABLE KEYS */;
/*!40000 ALTER TABLE `realm_localizations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `realm_required_credential`
--

DROP TABLE IF EXISTS `realm_required_credential`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `realm_required_credential` (
  `TYPE` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FORM_LABEL` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `INPUT` tinyint NOT NULL DEFAULT '0',
  `SECRET` tinyint NOT NULL DEFAULT '0',
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`REALM_ID`,`TYPE`),
  CONSTRAINT `FK_5HG65LYBEVAVKQFKI3KPONH9V` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `realm_required_credential`
--

LOCK TABLES `realm_required_credential` WRITE;
/*!40000 ALTER TABLE `realm_required_credential` DISABLE KEYS */;
INSERT INTO `realm_required_credential` VALUES ('password','password',1,1,'0245a4ff-801f-41e9-9805-a700847ddf88'),('password','password',1,1,'463f633d-c02e-4537-931f-fc87ef88ecdb'),('password','password',1,1,'e5a722b4-3b15-40ad-bf03-242dffaa63c2');
/*!40000 ALTER TABLE `realm_required_credential` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `realm_smtp_config`
--

DROP TABLE IF EXISTS `realm_smtp_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `realm_smtp_config` (
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`REALM_ID`,`NAME`),
  CONSTRAINT `FK_70EJ8XDXGXD0B9HH6180IRR0O` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `realm_smtp_config`
--

LOCK TABLES `realm_smtp_config` WRITE;
/*!40000 ALTER TABLE `realm_smtp_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `realm_smtp_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `realm_supported_locales`
--

DROP TABLE IF EXISTS `realm_supported_locales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `realm_supported_locales` (
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_SUPP_LOCAL_REALM` (`REALM_ID`),
  CONSTRAINT `FK_SUPPORTED_LOCALES_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `realm_supported_locales`
--

LOCK TABLES `realm_supported_locales` WRITE;
/*!40000 ALTER TABLE `realm_supported_locales` DISABLE KEYS */;
/*!40000 ALTER TABLE `realm_supported_locales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `redirect_uris`
--

DROP TABLE IF EXISTS `redirect_uris`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `redirect_uris` (
  `CLIENT_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`VALUE`),
  KEY `IDX_REDIR_URI_CLIENT` (`CLIENT_ID`),
  CONSTRAINT `FK_1BURS8PB4OUJ97H5WUPPAHV9F` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `redirect_uris`
--

LOCK TABLES `redirect_uris` WRITE;
/*!40000 ALTER TABLE `redirect_uris` DISABLE KEYS */;
INSERT INTO `redirect_uris` VALUES ('273eb56f-e808-4871-962d-76a6adc2e837','/realms/ou-graduation-realm/account/*'),('38b1ac57-9913-4586-8a2f-c4694643ec98','/admin/demo-keycloak/console/*'),('39390794-4eb4-4288-82c5-e1f8d74f992b','/realms/ou-graduation-realm/account/*'),('43b9bd23-4e8b-491c-9837-b722d4ad5c80','http://localhost:8080/*'),('528cf47d-0d61-47bc-96ad-2363849ae6d4','/realms/master/account/*'),('56b85807-2dd7-44ff-b30b-e7ef42d80874','/admin/master/console/*'),('673ee5f7-a053-453c-8bed-13d5daad356d',''),('85e2c2c2-bc16-44b4-b252-c4b8ddc9c21c','/realms/master/account/*'),('9b324760-588a-47ee-b552-8f71b234e2c9','http://localhost:8080/*'),('b3620883-7210-478f-a415-54d4b7d5b175','/admin/ou-graduation-realm/console/*'),('cd3fcf55-42f5-4955-b13b-76a184f21ad9','/realms/demo-keycloak/account/*'),('d988d29a-bfa8-4def-a104-2b3879d2a442','/realms/demo-keycloak/account/*');
/*!40000 ALTER TABLE `redirect_uris` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `required_action_config`
--

DROP TABLE IF EXISTS `required_action_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `required_action_config` (
  `REQUIRED_ACTION_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` longtext COLLATE utf8mb4_unicode_ci,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`REQUIRED_ACTION_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `required_action_config`
--

LOCK TABLES `required_action_config` WRITE;
/*!40000 ALTER TABLE `required_action_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `required_action_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `required_action_provider`
--

DROP TABLE IF EXISTS `required_action_provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `required_action_provider` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ALIAS` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ENABLED` tinyint NOT NULL DEFAULT '0',
  `DEFAULT_ACTION` tinyint NOT NULL DEFAULT '0',
  `PROVIDER_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_REQ_ACT_PROV_REALM` (`REALM_ID`),
  CONSTRAINT `FK_REQ_ACT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `required_action_provider`
--

LOCK TABLES `required_action_provider` WRITE;
/*!40000 ALTER TABLE `required_action_provider` DISABLE KEYS */;
INSERT INTO `required_action_provider` VALUES ('00cb6bf0-a217-4b6a-a25b-8b0e224c1eca','delete_account','Delete Account','463f633d-c02e-4537-931f-fc87ef88ecdb',0,0,'delete_account',60),('0571654d-8a0f-48de-a228-c3839fd764d2','webauthn-register','Webauthn Register','0245a4ff-801f-41e9-9805-a700847ddf88',1,0,'webauthn-register',70),('10e035eb-a9a8-4bcd-930a-c7f33974cefe','delete_account','Delete Account','e5a722b4-3b15-40ad-bf03-242dffaa63c2',0,0,'delete_account',60),('27a95cf3-b374-4162-acf6-31be362ca062','CONFIGURE_TOTP','Configure OTP','0245a4ff-801f-41e9-9805-a700847ddf88',1,0,'CONFIGURE_TOTP',10),('2a2d9b48-f4ec-4294-ab94-197f9d8cdf39','delete_account','Delete Account','0245a4ff-801f-41e9-9805-a700847ddf88',0,0,'delete_account',60),('38210211-ea1c-4b80-aab6-18aebee33eb7','update_user_locale','Update User Locale','e5a722b4-3b15-40ad-bf03-242dffaa63c2',1,0,'update_user_locale',1000),('4086e7fb-3e20-48b9-b1c3-77bd218f3b8f','UPDATE_PROFILE','Update Profile','463f633d-c02e-4537-931f-fc87ef88ecdb',1,0,'UPDATE_PROFILE',40),('485ac67d-5636-45ec-8d36-17fc6d21f179','VERIFY_PROFILE','Verify Profile','e5a722b4-3b15-40ad-bf03-242dffaa63c2',1,0,'VERIFY_PROFILE',90),('50a634a8-1b96-422b-b2f6-b5f61b5d6c80','webauthn-register-passwordless','Webauthn Register Passwordless','e5a722b4-3b15-40ad-bf03-242dffaa63c2',1,0,'webauthn-register-passwordless',80),('68084799-590e-42fe-ad26-41f61f5ceaeb','webauthn-register','Webauthn Register','e5a722b4-3b15-40ad-bf03-242dffaa63c2',1,0,'webauthn-register',70),('756a116c-a74e-4622-a56a-8391156e3851','TERMS_AND_CONDITIONS','Terms and Conditions','0245a4ff-801f-41e9-9805-a700847ddf88',0,0,'TERMS_AND_CONDITIONS',20),('765382d4-b38d-4bf4-8a99-6c622a9466c3','webauthn-register','Webauthn Register','463f633d-c02e-4537-931f-fc87ef88ecdb',1,0,'webauthn-register',70),('7dbe225a-7e83-4a4f-9d06-d0a0b9d11592','UPDATE_PASSWORD','Update Password','e5a722b4-3b15-40ad-bf03-242dffaa63c2',1,0,'UPDATE_PASSWORD',30),('81097d12-5f5f-4cd9-abc2-32463bb66490','VERIFY_PROFILE','Verify Profile','463f633d-c02e-4537-931f-fc87ef88ecdb',1,0,'VERIFY_PROFILE',90),('8b3091e5-b48c-42de-9a5f-0f0546f59245','VERIFY_PROFILE','Verify Profile','0245a4ff-801f-41e9-9805-a700847ddf88',1,0,'VERIFY_PROFILE',90),('a9bc6553-f17b-4d55-aa05-20cefd63b5ae','webauthn-register-passwordless','Webauthn Register Passwordless','0245a4ff-801f-41e9-9805-a700847ddf88',1,0,'webauthn-register-passwordless',80),('c32c64f1-b4a1-483c-a8d6-a7bda9f280e5','VERIFY_EMAIL','Verify Email','463f633d-c02e-4537-931f-fc87ef88ecdb',1,0,'VERIFY_EMAIL',50),('c6161399-e215-4245-9def-46e3b1c8316b','update_user_locale','Update User Locale','463f633d-c02e-4537-931f-fc87ef88ecdb',1,0,'update_user_locale',1000),('cb4a72e6-a143-4eb7-88f0-130889bc849d','TERMS_AND_CONDITIONS','Terms and Conditions','e5a722b4-3b15-40ad-bf03-242dffaa63c2',0,0,'TERMS_AND_CONDITIONS',20),('cc9b6ae8-fd83-4c7d-8125-9e1823618094','UPDATE_PASSWORD','Update Password','0245a4ff-801f-41e9-9805-a700847ddf88',1,0,'UPDATE_PASSWORD',30),('d2692fc1-fe7f-415e-83d2-e2c4f8bf89d8','update_user_locale','Update User Locale','0245a4ff-801f-41e9-9805-a700847ddf88',1,0,'update_user_locale',1000),('d2d8834c-c8c6-466d-967c-8944c1d7e770','CONFIGURE_TOTP','Configure OTP','463f633d-c02e-4537-931f-fc87ef88ecdb',1,0,'CONFIGURE_TOTP',10),('e1d869dc-8695-4b35-8f15-15f454ea3332','UPDATE_PROFILE','Update Profile','e5a722b4-3b15-40ad-bf03-242dffaa63c2',1,0,'UPDATE_PROFILE',40),('e402d18a-801e-4f9a-9ac6-ce6dbb9ddfc9','webauthn-register-passwordless','Webauthn Register Passwordless','463f633d-c02e-4537-931f-fc87ef88ecdb',1,0,'webauthn-register-passwordless',80),('ee21f7e1-84d8-402b-85be-5396c64597f9','UPDATE_PASSWORD','Update Password','463f633d-c02e-4537-931f-fc87ef88ecdb',1,0,'UPDATE_PASSWORD',30),('ee80f0fd-65ef-4ef8-90d0-4c820c100a1a','VERIFY_EMAIL','Verify Email','0245a4ff-801f-41e9-9805-a700847ddf88',1,0,'VERIFY_EMAIL',50),('ee8c8ed6-229f-4699-851c-b618ebfa1f69','CONFIGURE_TOTP','Configure OTP','e5a722b4-3b15-40ad-bf03-242dffaa63c2',1,0,'CONFIGURE_TOTP',10),('f2b2c499-9281-42c4-9ab0-f7c6bd53035b','TERMS_AND_CONDITIONS','Terms and Conditions','463f633d-c02e-4537-931f-fc87ef88ecdb',0,0,'TERMS_AND_CONDITIONS',20),('faa5973b-351b-4271-ab2e-92f7649e8b12','UPDATE_PROFILE','Update Profile','0245a4ff-801f-41e9-9805-a700847ddf88',1,0,'UPDATE_PROFILE',40),('fed4f6ca-f07c-4c01-b4a0-cd120d867efa','VERIFY_EMAIL','Verify Email','e5a722b4-3b15-40ad-bf03-242dffaa63c2',1,0,'VERIFY_EMAIL',50);
/*!40000 ALTER TABLE `required_action_provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_attribute`
--

DROP TABLE IF EXISTS `resource_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resource_attribute` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sybase-needs-something-here',
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RESOURCE_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_5HRM2VLF9QL5FU022KQEPOVBR` (`RESOURCE_ID`),
  CONSTRAINT `FK_5HRM2VLF9QL5FU022KQEPOVBR` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `resource_server_resource` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_attribute`
--

LOCK TABLES `resource_attribute` WRITE;
/*!40000 ALTER TABLE `resource_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_policy`
--

DROP TABLE IF EXISTS `resource_policy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resource_policy` (
  `RESOURCE_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `POLICY_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`POLICY_ID`),
  KEY `IDX_RES_POLICY_POLICY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRPOS53XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `resource_server_resource` (`ID`),
  CONSTRAINT `FK_FRSRPP213XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `resource_server_policy` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_policy`
--

LOCK TABLES `resource_policy` WRITE;
/*!40000 ALTER TABLE `resource_policy` DISABLE KEYS */;
INSERT INTO `resource_policy` VALUES ('06370181-7a8f-4263-850f-31cc685c43e1','57fc1ae7-760d-4f05-85f3-6c5248e3c28b'),('6cc9df42-6a7c-4bec-8c5c-e20ea02db93e','b43cee8b-1775-477e-a5c6-8d63a36425d7'),('d92d6293-3b34-454f-9684-0366326b9986','e022b920-cb38-442e-a3eb-cddbd82b5fa4');
/*!40000 ALTER TABLE `resource_policy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_scope`
--

DROP TABLE IF EXISTS `resource_scope`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resource_scope` (
  `RESOURCE_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SCOPE_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`SCOPE_ID`),
  KEY `IDX_RES_SCOPE_SCOPE` (`SCOPE_ID`),
  CONSTRAINT `FK_FRSRPOS13XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `resource_server_resource` (`ID`),
  CONSTRAINT `FK_FRSRPS213XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `resource_server_scope` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_scope`
--

LOCK TABLES `resource_scope` WRITE;
/*!40000 ALTER TABLE `resource_scope` DISABLE KEYS */;
INSERT INTO `resource_scope` VALUES ('06370181-7a8f-4263-850f-31cc685c43e1','37551560-ddee-4391-8372-15c09530e76f'),('06370181-7a8f-4263-850f-31cc685c43e1','c34f4152-3db2-45c5-ae64-45f77f6775bd');
/*!40000 ALTER TABLE `resource_scope` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_server`
--

DROP TABLE IF EXISTS `resource_server`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resource_server` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ALLOW_RS_REMOTE_MGMT` tinyint NOT NULL DEFAULT '0',
  `POLICY_ENFORCE_MODE` tinyint DEFAULT NULL,
  `DECISION_STRATEGY` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_server`
--

LOCK TABLES `resource_server` WRITE;
/*!40000 ALTER TABLE `resource_server` DISABLE KEYS */;
INSERT INTO `resource_server` VALUES ('673ee5f7-a053-453c-8bed-13d5daad356d',1,0,1),('9b324760-588a-47ee-b552-8f71b234e2c9',1,0,1);
/*!40000 ALTER TABLE `resource_server` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_server_perm_ticket`
--

DROP TABLE IF EXISTS `resource_server_perm_ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resource_server_perm_ticket` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `OWNER` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REQUESTER` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CREATED_TIMESTAMP` bigint NOT NULL,
  `GRANTED_TIMESTAMP` bigint DEFAULT NULL,
  `RESOURCE_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SCOPE_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `POLICY_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSR6T700S9V50BU18WS5PMT` (`OWNER`,`REQUESTER`,`RESOURCE_SERVER_ID`,`RESOURCE_ID`,`SCOPE_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG82SSPMT` (`RESOURCE_SERVER_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG83SSPMT` (`RESOURCE_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG84SSPMT` (`SCOPE_ID`),
  KEY `FK_FRSRPO2128CX4WNKOG82SSRFY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG82SSPMT` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `resource_server` (`ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG83SSPMT` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `resource_server_resource` (`ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG84SSPMT` FOREIGN KEY (`SCOPE_ID`) REFERENCES `resource_server_scope` (`ID`),
  CONSTRAINT `FK_FRSRPO2128CX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `resource_server_policy` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_server_perm_ticket`
--

LOCK TABLES `resource_server_perm_ticket` WRITE;
/*!40000 ALTER TABLE `resource_server_perm_ticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource_server_perm_ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_server_policy`
--

DROP TABLE IF EXISTS `resource_server_policy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resource_server_policy` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `TYPE` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DECISION_STRATEGY` tinyint DEFAULT NULL,
  `LOGIC` tinyint DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OWNER` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSRPT700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SERV_POL_RES_SERV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRPO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `resource_server` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_server_policy`
--

LOCK TABLES `resource_server_policy` WRITE;
/*!40000 ALTER TABLE `resource_server_policy` DISABLE KEYS */;
INSERT INTO `resource_server_policy` VALUES ('57fc1ae7-760d-4f05-85f3-6c5248e3c28b','Create Restaurant Permission','','scope',1,0,'9b324760-588a-47ee-b552-8f71b234e2c9',NULL),('5f73d23e-1f12-47ea-8ae8-7adc86b2208d','User Management Policy','','role',1,0,'9b324760-588a-47ee-b552-8f71b234e2c9',NULL),('66c738df-2eeb-4adc-a7fa-00c744e21daa','Create Restaurant Policy','','role',1,0,'9b324760-588a-47ee-b552-8f71b234e2c9',NULL),('93de4360-0fb3-495e-83d4-dc79599ed823','Default Policy','','role',1,0,'9b324760-588a-47ee-b552-8f71b234e2c9',NULL),('b43cee8b-1775-477e-a5c6-8d63a36425d7','User Management Permission','','resource',1,0,'9b324760-588a-47ee-b552-8f71b234e2c9',NULL),('c93d5226-8697-4ce2-8b7d-c35530b86c71','Default Permission','A permission that applies to the default resource type','resource',1,0,'673ee5f7-a053-453c-8bed-13d5daad356d',NULL),('cf299c3c-61b6-4aab-802a-d27089b5f3d1','Default Policy','A policy that grants access only for users within this realm','js',0,0,'673ee5f7-a053-453c-8bed-13d5daad356d',NULL),('e022b920-cb38-442e-a3eb-cddbd82b5fa4','Default Permission','','resource',1,0,'9b324760-588a-47ee-b552-8f71b234e2c9',NULL);
/*!40000 ALTER TABLE `resource_server_policy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_server_resource`
--

DROP TABLE IF EXISTS `resource_server_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resource_server_resource` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TYPE` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ICON_URI` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OWNER` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OWNER_MANAGED_ACCESS` tinyint NOT NULL DEFAULT '0',
  `DISPLAY_NAME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSR6T700S9V50BU18WS5HA6` (`NAME`,`OWNER`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SRV_RES_RES_SRV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `resource_server` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_server_resource`
--

LOCK TABLES `resource_server_resource` WRITE;
/*!40000 ALTER TABLE `resource_server_resource` DISABLE KEYS */;
INSERT INTO `resource_server_resource` VALUES ('06370181-7a8f-4263-850f-31cc685c43e1','Updated Create Restaurant Resource',NULL,'','9b324760-588a-47ee-b552-8f71b234e2c9','9b324760-588a-47ee-b552-8f71b234e2c9',0,''),('6cc9df42-6a7c-4bec-8c5c-e20ea02db93e','User Management Resource',NULL,'','9b324760-588a-47ee-b552-8f71b234e2c9','9b324760-588a-47ee-b552-8f71b234e2c9',0,''),('c0dcbce6-5038-4198-bde9-3f65368242db','Default Resource','urn:ou-graduation-client:resources:default',NULL,'673ee5f7-a053-453c-8bed-13d5daad356d','673ee5f7-a053-453c-8bed-13d5daad356d',0,NULL),('d92d6293-3b34-454f-9684-0366326b9986','Default Resource',NULL,'','9b324760-588a-47ee-b552-8f71b234e2c9','9b324760-588a-47ee-b552-8f71b234e2c9',0,'');
/*!40000 ALTER TABLE `resource_server_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_server_scope`
--

DROP TABLE IF EXISTS `resource_server_scope`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resource_server_scope` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ICON_URI` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSRST700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SRV_SCOPE_RES_SRV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRSO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `resource_server` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_server_scope`
--

LOCK TABLES `resource_server_scope` WRITE;
/*!40000 ALTER TABLE `resource_server_scope` DISABLE KEYS */;
INSERT INTO `resource_server_scope` VALUES ('37551560-ddee-4391-8372-15c09530e76f','GET','','9b324760-588a-47ee-b552-8f71b234e2c9',NULL),('c34f4152-3db2-45c5-ae64-45f77f6775bd','POST','','9b324760-588a-47ee-b552-8f71b234e2c9',NULL);
/*!40000 ALTER TABLE `resource_server_scope` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_uris`
--

DROP TABLE IF EXISTS `resource_uris`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resource_uris` (
  `RESOURCE_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`VALUE`),
  CONSTRAINT `FK_RESOURCE_SERVER_URIS` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `resource_server_resource` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_uris`
--

LOCK TABLES `resource_uris` WRITE;
/*!40000 ALTER TABLE `resource_uris` DISABLE KEYS */;
INSERT INTO `resource_uris` VALUES ('06370181-7a8f-4263-850f-31cc685c43e1','/api/restaurants'),('6cc9df42-6a7c-4bec-8c5c-e20ea02db93e','/api/users/*'),('c0dcbce6-5038-4198-bde9-3f65368242db','/*'),('d92d6293-3b34-454f-9684-0366326b9986','/*');
/*!40000 ALTER TABLE `resource_uris` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_attribute`
--

DROP TABLE IF EXISTS `role_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_attribute` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ROLE_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ROLE_ATTRIBUTE` (`ROLE_ID`),
  CONSTRAINT `FK_ROLE_ATTRIBUTE_ID` FOREIGN KEY (`ROLE_ID`) REFERENCES `keycloak_role` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_attribute`
--

LOCK TABLES `role_attribute` WRITE;
/*!40000 ALTER TABLE `role_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scope_mapping`
--

DROP TABLE IF EXISTS `scope_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scope_mapping` (
  `CLIENT_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ROLE_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`ROLE_ID`),
  KEY `IDX_SCOPE_MAPPING_ROLE` (`ROLE_ID`),
  CONSTRAINT `FK_OUSE064PLMLR732LXJCN1Q5F1` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scope_mapping`
--

LOCK TABLES `scope_mapping` WRITE;
/*!40000 ALTER TABLE `scope_mapping` DISABLE KEYS */;
INSERT INTO `scope_mapping` VALUES ('85e2c2c2-bc16-44b4-b252-c4b8ddc9c21c','6253e11b-210f-4f50-a8ad-3c0ccfc0f652'),('85e2c2c2-bc16-44b4-b252-c4b8ddc9c21c','70cee895-a0e1-4818-9ec3-70c7f4eab6e7'),('273eb56f-e808-4871-962d-76a6adc2e837','70f80bf8-8bd8-44d7-be8c-dbe1b7d1e701'),('d988d29a-bfa8-4def-a104-2b3879d2a442','70ff2153-1900-4bd2-8718-cc557bde2302'),('273eb56f-e808-4871-962d-76a6adc2e837','c40c26e9-463a-4803-8990-b125611ef9ea'),('d988d29a-bfa8-4def-a104-2b3879d2a442','daefece2-47be-4d23-b90b-fbe7838e5068');
/*!40000 ALTER TABLE `scope_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scope_policy`
--

DROP TABLE IF EXISTS `scope_policy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scope_policy` (
  `SCOPE_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `POLICY_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`POLICY_ID`),
  KEY `IDX_SCOPE_POLICY_POLICY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRASP13XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `resource_server_policy` (`ID`),
  CONSTRAINT `FK_FRSRPASS3XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `resource_server_scope` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scope_policy`
--

LOCK TABLES `scope_policy` WRITE;
/*!40000 ALTER TABLE `scope_policy` DISABLE KEYS */;
INSERT INTO `scope_policy` VALUES ('c34f4152-3db2-45c5-ae64-45f77f6775bd','57fc1ae7-760d-4f05-85f3-6c5248e3c28b');
/*!40000 ALTER TABLE `scope_policy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_attribute`
--

DROP TABLE IF EXISTS `user_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_attribute` (
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `USER_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sybase-needs-something-here',
  `LONG_VALUE_HASH` binary(64) DEFAULT NULL,
  `LONG_VALUE_HASH_LOWER_CASE` binary(64) DEFAULT NULL,
  `LONG_VALUE` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  PRIMARY KEY (`ID`),
  KEY `IDX_USER_ATTRIBUTE` (`USER_ID`),
  KEY `IDX_USER_ATTRIBUTE_NAME` (`NAME`,`VALUE`),
  KEY `USER_ATTR_LONG_VALUES` (`LONG_VALUE_HASH`,`NAME`),
  KEY `USER_ATTR_LONG_VALUES_LOWER_CASE` (`LONG_VALUE_HASH_LOWER_CASE`,`NAME`),
  CONSTRAINT `FK_5HRM2VLF9QL5FU043KQEPOVBR` FOREIGN KEY (`USER_ID`) REFERENCES `user_entity` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_attribute`
--

LOCK TABLES `user_attribute` WRITE;
/*!40000 ALTER TABLE `user_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_consent`
--

DROP TABLE IF EXISTS `user_consent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_consent` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CLIENT_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `USER_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `LAST_UPDATED_DATE` bigint DEFAULT NULL,
  `CLIENT_STORAGE_PROVIDER` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EXTERNAL_CLIENT_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_JKUWUVD56ONTGSUHOGM8UEWRT` (`CLIENT_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`,`USER_ID`),
  KEY `IDX_USER_CONSENT` (`USER_ID`),
  CONSTRAINT `FK_GRNTCSNT_USER` FOREIGN KEY (`USER_ID`) REFERENCES `user_entity` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_consent`
--

LOCK TABLES `user_consent` WRITE;
/*!40000 ALTER TABLE `user_consent` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_consent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_consent_client_scope`
--

DROP TABLE IF EXISTS `user_consent_client_scope`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_consent_client_scope` (
  `USER_CONSENT_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SCOPE_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`SCOPE_ID`),
  KEY `IDX_USCONSENT_CLSCOPE` (`USER_CONSENT_ID`),
  CONSTRAINT `FK_GRNTCSNT_CLSC_USC` FOREIGN KEY (`USER_CONSENT_ID`) REFERENCES `user_consent` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_consent_client_scope`
--

LOCK TABLES `user_consent_client_scope` WRITE;
/*!40000 ALTER TABLE `user_consent_client_scope` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_consent_client_scope` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_entity`
--

DROP TABLE IF EXISTS `user_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_entity` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `EMAIL` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EMAIL_CONSTRAINT` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EMAIL_VERIFIED` tinyint NOT NULL DEFAULT '0',
  `ENABLED` tinyint NOT NULL DEFAULT '0',
  `FEDERATION_LINK` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FIRST_NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `LAST_NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `REALM_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `CREATED_TIMESTAMP` bigint DEFAULT NULL,
  `SERVICE_ACCOUNT_CLIENT_LINK` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NOT_BEFORE` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_DYKN684SL8UP1CRFEI6ECKHD7` (`REALM_ID`,`EMAIL_CONSTRAINT`),
  UNIQUE KEY `UK_RU8TT6T700S9V50BU18WS5HA6` (`REALM_ID`,`USERNAME`),
  KEY `IDX_USER_EMAIL` (`EMAIL`),
  KEY `IDX_USER_SERVICE_ACCOUNT` (`REALM_ID`,`SERVICE_ACCOUNT_CLIENT_LINK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_entity`
--

LOCK TABLES `user_entity` WRITE;
/*!40000 ALTER TABLE `user_entity` DISABLE KEYS */;
INSERT INTO `user_entity` VALUES ('3850aee7-a9af-4007-ab40-984e1ddd5269','admin@gmail.com','admin@gmail.com',1,1,NULL,'Admin','Super','e5a722b4-3b15-40ad-bf03-242dffaa63c2','admin',1710988827341,NULL,1711017450),('3d437dba-d729-4b34-b963-c3c93ed50637','admin@gmail.com','admin@gmail.com',1,1,NULL,'Admin','Super','0245a4ff-801f-41e9-9805-a700847ddf88','admin',1711336547653,NULL,1711436380),('792f1ba4-262a-42b9-bb8d-0bd2317fb7ad','anh@gmail.com','anh@gmail.com',1,1,NULL,'Anh','Nguyen Van','0245a4ff-801f-41e9-9805-a700847ddf88','anhnv',1711336580649,NULL,1711436389),('bd705218-9de8-4f15-9980-a9f8ae2505e7',NULL,'47426440-c735-4e60-9fdf-f2b778586e8f',0,1,NULL,NULL,NULL,'e5a722b4-3b15-40ad-bf03-242dffaa63c2','service-account-demo-keycloak-spring-boot-app',1711006066957,'9b324760-588a-47ee-b552-8f71b234e2c9',0),('d481643a-2f3b-4b14-9b59-fe97f22d6efe',NULL,'35b6f744-f7be-4956-bc53-a8ba7c533959',0,1,NULL,NULL,NULL,'0245a4ff-801f-41e9-9805-a700847ddf88','service-account-ou-graduation-client',1711420092103,'673ee5f7-a053-453c-8bed-13d5daad356d',0),('e3cd4ac3-cf18-43d2-8420-d399885e5520',NULL,'eb5bcf9e-15da-41a4-90a8-2fa68271c552',0,1,NULL,NULL,NULL,'463f633d-c02e-4537-931f-fc87ef88ecdb','admin',1710903543701,NULL,0),('ea9e6256-21fb-457c-802c-537933390cfd','anh@gmail.com','anh@gmail.com',0,1,NULL,'Anh','Nguyen Van','e5a722b4-3b15-40ad-bf03-242dffaa63c2','anhnv',1710903957104,NULL,0);
/*!40000 ALTER TABLE `user_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_federation_config`
--

DROP TABLE IF EXISTS `user_federation_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_federation_config` (
  `USER_FEDERATION_PROVIDER_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`USER_FEDERATION_PROVIDER_ID`,`NAME`),
  CONSTRAINT `FK_T13HPU1J94R2EBPEKR39X5EU5` FOREIGN KEY (`USER_FEDERATION_PROVIDER_ID`) REFERENCES `user_federation_provider` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_federation_config`
--

LOCK TABLES `user_federation_config` WRITE;
/*!40000 ALTER TABLE `user_federation_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_federation_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_federation_mapper`
--

DROP TABLE IF EXISTS `user_federation_mapper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_federation_mapper` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FEDERATION_PROVIDER_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FEDERATION_MAPPER_TYPE` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USR_FED_MAP_FED_PRV` (`FEDERATION_PROVIDER_ID`),
  KEY `IDX_USR_FED_MAP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_FEDMAPPERPM_FEDPRV` FOREIGN KEY (`FEDERATION_PROVIDER_ID`) REFERENCES `user_federation_provider` (`ID`),
  CONSTRAINT `FK_FEDMAPPERPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_federation_mapper`
--

LOCK TABLES `user_federation_mapper` WRITE;
/*!40000 ALTER TABLE `user_federation_mapper` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_federation_mapper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_federation_mapper_config`
--

DROP TABLE IF EXISTS `user_federation_mapper_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_federation_mapper_config` (
  `USER_FEDERATION_MAPPER_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`USER_FEDERATION_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_FEDMAPPER_CFG` FOREIGN KEY (`USER_FEDERATION_MAPPER_ID`) REFERENCES `user_federation_mapper` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_federation_mapper_config`
--

LOCK TABLES `user_federation_mapper_config` WRITE;
/*!40000 ALTER TABLE `user_federation_mapper_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_federation_mapper_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_federation_provider`
--

DROP TABLE IF EXISTS `user_federation_provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_federation_provider` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CHANGED_SYNC_PERIOD` int DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FULL_SYNC_PERIOD` int DEFAULT NULL,
  `LAST_SYNC` int DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  `PROVIDER_NAME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USR_FED_PRV_REALM` (`REALM_ID`),
  CONSTRAINT `FK_1FJ32F6PTOLW2QY60CD8N01E8` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_federation_provider`
--

LOCK TABLES `user_federation_provider` WRITE;
/*!40000 ALTER TABLE `user_federation_provider` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_federation_provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_group_membership`
--

DROP TABLE IF EXISTS `user_group_membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_group_membership` (
  `GROUP_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `USER_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`GROUP_ID`,`USER_ID`),
  KEY `IDX_USER_GROUP_MAPPING` (`USER_ID`),
  CONSTRAINT `FK_USER_GROUP_USER` FOREIGN KEY (`USER_ID`) REFERENCES `user_entity` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group_membership`
--

LOCK TABLES `user_group_membership` WRITE;
/*!40000 ALTER TABLE `user_group_membership` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_group_membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_required_action`
--

DROP TABLE IF EXISTS `user_required_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_required_action` (
  `USER_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `REQUIRED_ACTION` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ' ',
  PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`),
  KEY `IDX_USER_REQACTIONS` (`USER_ID`),
  CONSTRAINT `FK_6QJ3W1JW9CVAFHE19BWSIUVMD` FOREIGN KEY (`USER_ID`) REFERENCES `user_entity` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_required_action`
--

LOCK TABLES `user_required_action` WRITE;
/*!40000 ALTER TABLE `user_required_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_required_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role_mapping`
--

DROP TABLE IF EXISTS `user_role_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role_mapping` (
  `ROLE_ID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `USER_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`USER_ID`),
  KEY `IDX_USER_ROLE_MAPPING` (`USER_ID`),
  CONSTRAINT `FK_C4FQV34P1MBYLLOXANG7B1Q3L` FOREIGN KEY (`USER_ID`) REFERENCES `user_entity` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role_mapping`
--

LOCK TABLES `user_role_mapping` WRITE;
/*!40000 ALTER TABLE `user_role_mapping` DISABLE KEYS */;
INSERT INTO `user_role_mapping` VALUES ('7189b730-12af-4a1f-b21f-6c9ea727e488','3850aee7-a9af-4007-ab40-984e1ddd5269'),('972b63fe-074a-4531-93f0-cc084965350c','3850aee7-a9af-4007-ab40-984e1ddd5269'),('eee1e37b-271f-489e-8549-7a19b2846d72','3850aee7-a9af-4007-ab40-984e1ddd5269'),('2e4b2662-79c4-48e9-ae12-2af897d845eb','3d437dba-d729-4b34-b963-c3c93ed50637'),('fb60f2d1-c064-4abe-a498-65eba6ed1bb2','3d437dba-d729-4b34-b963-c3c93ed50637'),('63216bab-d127-4d6e-8a99-d67f99c6fdf2','792f1ba4-262a-42b9-bb8d-0bd2317fb7ad'),('fb60f2d1-c064-4abe-a498-65eba6ed1bb2','792f1ba4-262a-42b9-bb8d-0bd2317fb7ad'),('5122a429-b620-4235-8f92-2f9619cf6ac0','bd705218-9de8-4f15-9980-a9f8ae2505e7'),('eee1e37b-271f-489e-8549-7a19b2846d72','bd705218-9de8-4f15-9980-a9f8ae2505e7'),('1a1c5108-9a1e-4812-b290-637898980ae3','d481643a-2f3b-4b14-9b59-fe97f22d6efe'),('fb60f2d1-c064-4abe-a498-65eba6ed1bb2','d481643a-2f3b-4b14-9b59-fe97f22d6efe'),('055bf001-5eee-4bc5-89ef-069ee8ea39fc','e3cd4ac3-cf18-43d2-8420-d399885e5520'),('0cee371a-426c-4929-8547-bda1888246c8','e3cd4ac3-cf18-43d2-8420-d399885e5520'),('0f796070-3a96-4270-8803-2e136a3d5e20','e3cd4ac3-cf18-43d2-8420-d399885e5520'),('169e4090-90e5-434f-89b0-084f398016b9','e3cd4ac3-cf18-43d2-8420-d399885e5520'),('18e1b6ab-5e3c-4b1f-bbc0-35473d5efd9d','e3cd4ac3-cf18-43d2-8420-d399885e5520'),('1aba9390-7088-4caf-bb9e-dce892f7adb5','e3cd4ac3-cf18-43d2-8420-d399885e5520'),('246a166b-d233-4f83-a69e-827580bccdf7','e3cd4ac3-cf18-43d2-8420-d399885e5520'),('257887fc-827d-4f01-b007-0847605461b9','e3cd4ac3-cf18-43d2-8420-d399885e5520'),('41602ed1-a755-469c-9fea-016b2eac53e2','e3cd4ac3-cf18-43d2-8420-d399885e5520'),('4b53ec37-18bc-480d-b705-0c41b7649b53','e3cd4ac3-cf18-43d2-8420-d399885e5520'),('4db3ba07-f9f1-4588-ae91-8d3ae689e30d','e3cd4ac3-cf18-43d2-8420-d399885e5520'),('4de300c3-8895-4bd8-999e-a11b19779e3d','e3cd4ac3-cf18-43d2-8420-d399885e5520'),('5067b6e9-fe8b-4460-8c01-4e53c5bbb5f7','e3cd4ac3-cf18-43d2-8420-d399885e5520'),('6169307d-d636-49e0-9e71-320e15f850f5','e3cd4ac3-cf18-43d2-8420-d399885e5520'),('6493d498-fd92-48d1-9417-ad56ad3fceda','e3cd4ac3-cf18-43d2-8420-d399885e5520'),('64a76c03-6966-49d8-b77e-f76aa0cf9f14','e3cd4ac3-cf18-43d2-8420-d399885e5520'),('6ff966e5-a3b3-4b3a-867b-2e0642c4672b','e3cd4ac3-cf18-43d2-8420-d399885e5520'),('7b1176a3-35a5-4ba4-ba6e-a26e32cb609c','e3cd4ac3-cf18-43d2-8420-d399885e5520'),('7c574e03-613d-4f29-a0fc-723f23ed2bc9','e3cd4ac3-cf18-43d2-8420-d399885e5520'),('7e1cf577-f457-4d04-b737-6b9c717d4a47','e3cd4ac3-cf18-43d2-8420-d399885e5520'),('90edd835-72e1-4950-94d5-25009f1fd144','e3cd4ac3-cf18-43d2-8420-d399885e5520'),('947d5295-fafe-4189-aae8-8f5fe780d440','e3cd4ac3-cf18-43d2-8420-d399885e5520'),('a1a23795-d007-4ce4-ba22-d8c276d1c57a','e3cd4ac3-cf18-43d2-8420-d399885e5520'),('a29cfde8-bde0-45b4-be67-49bf4cc97fbe','e3cd4ac3-cf18-43d2-8420-d399885e5520'),('ae0513c4-502b-445b-821d-5432229d1f7d','e3cd4ac3-cf18-43d2-8420-d399885e5520'),('af10f6dd-6707-4890-b678-7e5f827ea6b1','e3cd4ac3-cf18-43d2-8420-d399885e5520'),('b23228c8-a6fe-4ae4-81be-87f0c912a913','e3cd4ac3-cf18-43d2-8420-d399885e5520'),('b276b14c-cd87-4ade-8c84-424137f2a6d6','e3cd4ac3-cf18-43d2-8420-d399885e5520'),('ba6e396c-4964-4bf4-86c6-4e59d631e39a','e3cd4ac3-cf18-43d2-8420-d399885e5520'),('bdb535de-7296-464a-bec9-aa25d93b1daa','e3cd4ac3-cf18-43d2-8420-d399885e5520'),('bf780ab9-5288-4774-8a51-1a2ef9cd3fd6','e3cd4ac3-cf18-43d2-8420-d399885e5520'),('c4619ce2-5b4f-4e68-bd07-c11427564c81','e3cd4ac3-cf18-43d2-8420-d399885e5520'),('c6701e4e-34be-45e7-9f32-f849074e2a36','e3cd4ac3-cf18-43d2-8420-d399885e5520'),('ce9f19e4-8b98-4ad6-84e3-eed1ebb3f076','e3cd4ac3-cf18-43d2-8420-d399885e5520'),('f9d384ae-3301-4b99-b288-45b0f98ff960','e3cd4ac3-cf18-43d2-8420-d399885e5520'),('fc6220a3-07ea-4f2a-b9d8-2796542c3eed','e3cd4ac3-cf18-43d2-8420-d399885e5520'),('eee1e37b-271f-489e-8549-7a19b2846d72','ea9e6256-21fb-457c-802c-537933390cfd');
/*!40000 ALTER TABLE `user_role_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_session`
--

DROP TABLE IF EXISTS `user_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_session` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `AUTH_METHOD` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `IP_ADDRESS` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LAST_SESSION_REFRESH` int DEFAULT NULL,
  `LOGIN_USERNAME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REMEMBER_ME` tinyint NOT NULL DEFAULT '0',
  `STARTED` int DEFAULT NULL,
  `USER_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `USER_SESSION_STATE` int DEFAULT NULL,
  `BROKER_SESSION_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BROKER_USER_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_session`
--

LOCK TABLES `user_session` WRITE;
/*!40000 ALTER TABLE `user_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_session_note`
--

DROP TABLE IF EXISTS `user_session_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_session_note` (
  `USER_SESSION` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`USER_SESSION`,`NAME`),
  CONSTRAINT `FK5EDFB00FF51D3472` FOREIGN KEY (`USER_SESSION`) REFERENCES `user_session` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_session_note`
--

LOCK TABLES `user_session_note` WRITE;
/*!40000 ALTER TABLE `user_session_note` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_session_note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `username_login_failure`
--

DROP TABLE IF EXISTS `username_login_failure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `username_login_failure` (
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `FAILED_LOGIN_NOT_BEFORE` int DEFAULT NULL,
  `LAST_FAILURE` bigint DEFAULT NULL,
  `LAST_IP_FAILURE` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NUM_FAILURES` int DEFAULT NULL,
  PRIMARY KEY (`REALM_ID`,`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `username_login_failure`
--

LOCK TABLES `username_login_failure` WRITE;
/*!40000 ALTER TABLE `username_login_failure` DISABLE KEYS */;
/*!40000 ALTER TABLE `username_login_failure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_origins`
--

DROP TABLE IF EXISTS `web_origins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `web_origins` (
  `CLIENT_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`VALUE`),
  KEY `IDX_WEB_ORIG_CLIENT` (`CLIENT_ID`),
  CONSTRAINT `FK_LOJPHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_origins`
--

LOCK TABLES `web_origins` WRITE;
/*!40000 ALTER TABLE `web_origins` DISABLE KEYS */;
INSERT INTO `web_origins` VALUES ('38b1ac57-9913-4586-8a2f-c4694643ec98','+'),('43b9bd23-4e8b-491c-9837-b722d4ad5c80','*'),('56b85807-2dd7-44ff-b30b-e7ef42d80874','+'),('673ee5f7-a053-453c-8bed-13d5daad356d',''),('9b324760-588a-47ee-b552-8f71b234e2c9','*'),('b3620883-7210-478f-a415-54d4b7d5b175','+');
/*!40000 ALTER TABLE `web_origins` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-26 14:15:37
