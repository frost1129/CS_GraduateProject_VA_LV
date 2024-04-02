-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: keycloak_auth_service_db
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
-- Table structure for table `ADMIN_EVENT_ENTITY`
--

DROP TABLE IF EXISTS `ADMIN_EVENT_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ADMIN_EVENT_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `ADMIN_EVENT_TIME` bigint DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `OPERATION_TYPE` varchar(255) DEFAULT NULL,
  `AUTH_REALM_ID` varchar(255) DEFAULT NULL,
  `AUTH_CLIENT_ID` varchar(255) DEFAULT NULL,
  `AUTH_USER_ID` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `RESOURCE_PATH` text,
  `REPRESENTATION` text,
  `ERROR` varchar(255) DEFAULT NULL,
  `RESOURCE_TYPE` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ADMIN_EVENT_TIME` (`REALM_ID`,`ADMIN_EVENT_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ADMIN_EVENT_ENTITY`
--

LOCK TABLES `ADMIN_EVENT_ENTITY` WRITE;
/*!40000 ALTER TABLE `ADMIN_EVENT_ENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `ADMIN_EVENT_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ASSOCIATED_POLICY`
--

DROP TABLE IF EXISTS `ASSOCIATED_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ASSOCIATED_POLICY` (
  `POLICY_ID` varchar(36) NOT NULL,
  `ASSOCIATED_POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`POLICY_ID`,`ASSOCIATED_POLICY_ID`),
  KEY `IDX_ASSOC_POL_ASSOC_POL_ID` (`ASSOCIATED_POLICY_ID`),
  CONSTRAINT `FK_FRSR5S213XCX4WNKOG82SSRFY` FOREIGN KEY (`ASSOCIATED_POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`),
  CONSTRAINT `FK_FRSRPAS14XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ASSOCIATED_POLICY`
--

LOCK TABLES `ASSOCIATED_POLICY` WRITE;
/*!40000 ALTER TABLE `ASSOCIATED_POLICY` DISABLE KEYS */;
INSERT INTO `ASSOCIATED_POLICY` VALUES ('549298c7-0fac-400d-9573-88933ddec66a','5f63b963-8de4-4ced-93fe-3fbfb71004d9');
/*!40000 ALTER TABLE `ASSOCIATED_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATION_EXECUTION`
--

DROP TABLE IF EXISTS `AUTHENTICATION_EXECUTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATION_EXECUTION` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `AUTHENTICATOR` varchar(36) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `FLOW_ID` varchar(36) DEFAULT NULL,
  `REQUIREMENT` int DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  `AUTHENTICATOR_FLOW` tinyint NOT NULL DEFAULT '0',
  `AUTH_FLOW_ID` varchar(36) DEFAULT NULL,
  `AUTH_CONFIG` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_EXEC_REALM_FLOW` (`REALM_ID`,`FLOW_ID`),
  KEY `IDX_AUTH_EXEC_FLOW` (`FLOW_ID`),
  CONSTRAINT `FK_AUTH_EXEC_FLOW` FOREIGN KEY (`FLOW_ID`) REFERENCES `AUTHENTICATION_FLOW` (`ID`),
  CONSTRAINT `FK_AUTH_EXEC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATION_EXECUTION`
--

LOCK TABLES `AUTHENTICATION_EXECUTION` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATION_EXECUTION` DISABLE KEYS */;
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('004337a5-1c44-492d-acfa-4f90a24bc9f2',NULL,'auth-cookie','65fa274b-8112-4346-8bcc-e604adb24617','3c21ccbd-8fee-4d8d-992b-90dab54c14c5',2,10,0,NULL,NULL),('090d9240-1f55-44e5-bf83-ffe765b3873d',NULL,NULL,'65fa274b-8112-4346-8bcc-e604adb24617','bd5c5d41-7585-412b-aa42-9924c58385a8',1,20,1,'0865a6da-4c94-4915-b16e-e321abc36101',NULL),('0a5a2d8a-d24f-4966-bbca-d5f037eef413',NULL,'conditional-user-configured','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','33c932f8-2c3a-4bb3-9c08-afd9f21d5838',0,10,0,NULL,NULL),('0b948c7e-1c85-4fdf-8945-fa7c65a168b2',NULL,NULL,'65fa274b-8112-4346-8bcc-e604adb24617','16e445aa-3db0-40ab-bafc-a6a095ff0c96',2,20,1,'bd5c5d41-7585-412b-aa42-9924c58385a8',NULL),('141375d8-bfa2-4b7e-a2dd-8d700ca32dc7',NULL,'client-x509','65fa274b-8112-4346-8bcc-e604adb24617','532a1abe-7d86-46e3-92d1-f1dbc17e835b',2,40,0,NULL,NULL),('145a912c-8932-476d-9248-cba610d7dbbc',NULL,NULL,'65fa274b-8112-4346-8bcc-e604adb24617','69b0819b-cbc3-4c97-a5aa-0e34063b7b24',1,40,1,'4f08c3ed-3ec1-4cc8-ada5-5592f273cb2e',NULL),('1849b4a5-1081-4fd9-9c6a-936f152c81be',NULL,'identity-provider-redirector','65fa274b-8112-4346-8bcc-e604adb24617','3c21ccbd-8fee-4d8d-992b-90dab54c14c5',2,25,0,NULL,NULL),('193f399d-1a55-4225-bf7f-88c8173ac62d',NULL,'auth-otp-form','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','696f2a47-26e4-4d4e-be24-82b9571938c1',0,20,0,NULL,NULL),('1948f230-b95c-4a86-9979-52d85304750f',NULL,'registration-terms-and-conditions','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','68247430-481e-48da-b9bf-1db373e5cdec',3,70,0,NULL,NULL),('1d0d9859-c18d-4cd7-a46e-2b1bde461134',NULL,'idp-confirm-link','65fa274b-8112-4346-8bcc-e604adb24617','b6123a4f-f027-4019-a5ed-69e71c934551',0,10,0,NULL,NULL),('24ebebcb-f926-4a36-aac7-a4f1e32f3a12',NULL,'auth-username-password-form','65fa274b-8112-4346-8bcc-e604adb24617','2c86fa0f-5f90-4a74-be60-28b61a51b3a4',0,10,0,NULL,NULL),('283fe560-d8db-4979-846c-eca974d92b0c',NULL,'registration-recaptcha-action','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','68247430-481e-48da-b9bf-1db373e5cdec',3,60,0,NULL,NULL),('3092967b-e8a2-4022-856b-41e1ea0d94ae',NULL,NULL,'c50626a4-a4f7-42b1-ba55-fdfd2fae3469','9c4a9c97-d0f8-48e7-9af1-2f1f40c24706',2,30,1,'15d6f7df-8515-4d8f-a203-1070b67e15ae',NULL),('33da3952-83d8-4c20-ae03-052adc05b865',NULL,'client-secret','65fa274b-8112-4346-8bcc-e604adb24617','532a1abe-7d86-46e3-92d1-f1dbc17e835b',2,10,0,NULL,NULL),('33e49afb-7d8c-4ffc-bf03-5fbbd2189585',NULL,'idp-create-user-if-unique','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','257b36b1-446c-490b-8417-01d47d6b93e6',2,10,0,NULL,'dd48776b-e644-4ad3-82bb-bedf5836e8fb'),('3d97c4af-0294-483b-b0c9-f8291f16d84f',NULL,NULL,'65fa274b-8112-4346-8bcc-e604adb24617','b6123a4f-f027-4019-a5ed-69e71c934551',0,20,1,'16e445aa-3db0-40ab-bafc-a6a095ff0c96',NULL),('3da166be-e65a-43c5-8520-ce3eabb943d7',NULL,'registration-page-form','65fa274b-8112-4346-8bcc-e604adb24617','963ee2c4-4600-4193-b627-8782b554b3c1',0,10,1,'570aeb49-91f9-408f-a093-5a5ee6202040',NULL),('3dbcdde7-5a60-499b-8dd9-e48139d35d86',NULL,'client-jwt','65fa274b-8112-4346-8bcc-e604adb24617','532a1abe-7d86-46e3-92d1-f1dbc17e835b',2,20,0,NULL,NULL),('3e3c0ab7-8a0c-4c08-a931-791710d2cf36',NULL,'auth-spnego','65fa274b-8112-4346-8bcc-e604adb24617','3c21ccbd-8fee-4d8d-992b-90dab54c14c5',3,20,0,NULL,NULL),('420be4f1-40fb-4a81-ab79-a60ee3a6fa9a',NULL,'auth-otp-form','65fa274b-8112-4346-8bcc-e604adb24617','28e39bf2-bc00-46bf-a63e-bb74baca87a2',0,20,0,NULL,NULL),('43250ba0-8589-41af-bdbb-c484b069baaf',NULL,'idp-username-password-form','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','57027e60-e0d5-4143-8091-af12c850b3f0',0,10,0,NULL,NULL),('47988bd1-839a-4003-a806-fe16aa89cff3',NULL,'direct-grant-validate-password','65fa274b-8112-4346-8bcc-e604adb24617','66c1e7c3-6aea-49db-a64e-336117df6913',0,20,0,NULL,NULL),('47e1d58c-5ff0-4abe-819a-a984457bf260',NULL,NULL,'c50626a4-a4f7-42b1-ba55-fdfd2fae3469','745088a0-e575-4786-91f7-6712d35419e9',0,20,1,'257b36b1-446c-490b-8417-01d47d6b93e6',NULL),('4c399c7f-141e-4641-97e2-175b2d246285',NULL,NULL,'c50626a4-a4f7-42b1-ba55-fdfd2fae3469','57027e60-e0d5-4143-8091-af12c850b3f0',1,20,1,'e1f363e5-c01c-431d-8fee-90cb91cfd729',NULL),('4c68fece-2f2a-48b5-b17f-53dc8fc43d65',NULL,'reset-password','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','fab96004-9cfb-4c51-8b3e-604f6a18d926',0,30,0,NULL,NULL),('4d7b1f65-b2c0-4779-bf2e-384586135647',NULL,NULL,'65fa274b-8112-4346-8bcc-e604adb24617','969e0a38-b97b-494f-af39-5b28f8a3cd7a',2,20,1,'b6123a4f-f027-4019-a5ed-69e71c934551',NULL),('4ddd2d54-057c-4739-9ace-a64abbd0476a',NULL,'client-secret-jwt','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','3270b25e-ce0a-4cc2-9bc3-4aa10ae3fe55',2,30,0,NULL,NULL),('4f4aafd0-69b3-4418-bd6f-304567672e9b',NULL,NULL,'c50626a4-a4f7-42b1-ba55-fdfd2fae3469','a4d980fb-0056-4f32-bea6-088bc1be4532',0,20,1,'d60dec79-ec39-4797-ad93-0eb905143d9e',NULL),('520ca111-2093-4f36-8f37-634c3c081312',NULL,'idp-create-user-if-unique','65fa274b-8112-4346-8bcc-e604adb24617','969e0a38-b97b-494f-af39-5b28f8a3cd7a',2,10,0,NULL,'458e7692-412d-4a67-a234-dd1e9da27a97'),('535f80da-72c5-4a6d-84ce-c287e49ab59b',NULL,'auth-spnego','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','9c4a9c97-d0f8-48e7-9af1-2f1f40c24706',3,20,0,NULL,NULL),('5d2dce98-89c3-4346-b494-9d6c5fcd1423',NULL,'client-secret-jwt','65fa274b-8112-4346-8bcc-e604adb24617','532a1abe-7d86-46e3-92d1-f1dbc17e835b',2,30,0,NULL,NULL),('5fdd8f92-ce20-4b82-b9b7-ea05ab45f754',NULL,'conditional-user-configured','65fa274b-8112-4346-8bcc-e604adb24617','adee2280-0c93-40d8-9739-581b51400ecd',0,10,0,NULL,NULL),('68886024-857d-4bc0-be9a-c5f1907f4138',NULL,'auth-otp-form','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','e1f363e5-c01c-431d-8fee-90cb91cfd729',0,20,0,NULL,NULL),('69184306-c9b9-4250-a3de-2cb9dc1f233b',NULL,'idp-email-verification','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','d60dec79-ec39-4797-ad93-0eb905143d9e',2,10,0,NULL,NULL),('6b8ad733-8a8f-436d-9d47-810b9391da9d',NULL,NULL,'c50626a4-a4f7-42b1-ba55-fdfd2fae3469','d60dec79-ec39-4797-ad93-0eb905143d9e',2,20,1,'57027e60-e0d5-4143-8091-af12c850b3f0',NULL),('6be959e4-fc10-4dbe-8140-e7f108937198',NULL,'conditional-user-configured','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','9ff2aada-299d-4bfa-9b85-b721fb542f99',0,10,0,NULL,NULL),('6ce0d78a-54b1-4529-9451-98bf28273ff5',NULL,'client-secret','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','3270b25e-ce0a-4cc2-9bc3-4aa10ae3fe55',2,10,0,NULL,NULL),('6d085ea9-57ef-4de7-9c7a-70022f3a790c',NULL,'docker-http-basic-authenticator','65fa274b-8112-4346-8bcc-e604adb24617','21a87d18-c986-4f4b-bbc4-51675fc88e66',0,10,0,NULL,NULL),('6d744449-0865-457a-9adb-9370affb4aca',NULL,'registration-user-creation','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','68247430-481e-48da-b9bf-1db373e5cdec',0,20,0,NULL,NULL),('6f82ddbb-d43c-432b-a91f-d10d99915adb',NULL,'reset-credential-email','65fa274b-8112-4346-8bcc-e604adb24617','69b0819b-cbc3-4c97-a5aa-0e34063b7b24',0,20,0,NULL,NULL),('748b1ac2-e56b-4dd1-98d0-16291a92170d',NULL,'reset-credentials-choose-user','65fa274b-8112-4346-8bcc-e604adb24617','69b0819b-cbc3-4c97-a5aa-0e34063b7b24',0,10,0,NULL,NULL),('817553e9-0f7b-41b7-8030-81190a8fca71',NULL,'registration-password-action','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','68247430-481e-48da-b9bf-1db373e5cdec',0,50,0,NULL,NULL),('81b27872-5f53-4123-bab0-d7181624891e',NULL,'idp-review-profile','65fa274b-8112-4346-8bcc-e604adb24617','6e5c609f-eeb8-442a-a358-8fa31ec7cc51',0,10,0,NULL,'09c9b490-412a-48ce-8be0-a08e112d92ab'),('862ebb4b-755d-40bf-aabb-f67dfbaec255',NULL,'reset-otp','65fa274b-8112-4346-8bcc-e604adb24617','4f08c3ed-3ec1-4cc8-ada5-5592f273cb2e',0,20,0,NULL,NULL),('8818c1de-707c-4529-963d-d5d0ed26a905',NULL,'conditional-user-configured','65fa274b-8112-4346-8bcc-e604adb24617','0865a6da-4c94-4915-b16e-e321abc36101',0,10,0,NULL,NULL),('883d654d-6ba0-4bc2-9268-7123e5791f56',NULL,NULL,'c50626a4-a4f7-42b1-ba55-fdfd2fae3469','15d6f7df-8515-4d8f-a203-1070b67e15ae',1,20,1,'696f2a47-26e4-4d4e-be24-82b9571938c1',NULL),('97f1db3a-a833-4f60-bbbf-9203e842d615',NULL,'http-basic-authenticator','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','16a68b93-bab6-405b-a2f0-867ba1c4e458',0,10,0,NULL,NULL),('9c19708e-0d03-42db-b84d-68bb866bd59a',NULL,'client-jwt','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','3270b25e-ce0a-4cc2-9bc3-4aa10ae3fe55',2,20,0,NULL,NULL),('9d0a2a63-17ee-43d8-9b2a-e38f28488f13',NULL,NULL,'c50626a4-a4f7-42b1-ba55-fdfd2fae3469','fab96004-9cfb-4c51-8b3e-604f6a18d926',1,40,1,'9ff2aada-299d-4bfa-9b85-b721fb542f99',NULL),('a08bc350-ba9f-4c88-8969-206e4e0586ee',NULL,'idp-username-password-form','65fa274b-8112-4346-8bcc-e604adb24617','bd5c5d41-7585-412b-aa42-9924c58385a8',0,10,0,NULL,NULL),('a7bc38bd-c68f-4285-a892-12be371d83c3',NULL,'reset-credentials-choose-user','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','fab96004-9cfb-4c51-8b3e-604f6a18d926',0,10,0,NULL,NULL),('a9c414a4-39ee-4eae-8233-a7cdd3dd5172',NULL,'reset-otp','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','9ff2aada-299d-4bfa-9b85-b721fb542f99',0,20,0,NULL,NULL),('ab4ac283-b325-4668-8bea-deb24b016847',NULL,NULL,'65fa274b-8112-4346-8bcc-e604adb24617','6e5c609f-eeb8-442a-a358-8fa31ec7cc51',0,20,1,'969e0a38-b97b-494f-af39-5b28f8a3cd7a',NULL),('ac5a6785-b606-4ea0-a2ed-3b01977a8eb5',NULL,'registration-password-action','65fa274b-8112-4346-8bcc-e604adb24617','570aeb49-91f9-408f-a093-5a5ee6202040',0,50,0,NULL,NULL),('ae311a8f-b5d2-443a-b2bb-4ae5cad815d8',NULL,'direct-grant-validate-otp','65fa274b-8112-4346-8bcc-e604adb24617','adee2280-0c93-40d8-9739-581b51400ecd',0,20,0,NULL,NULL),('aea89386-300d-4e39-8b59-d2947bc55358',NULL,NULL,'65fa274b-8112-4346-8bcc-e604adb24617','3c21ccbd-8fee-4d8d-992b-90dab54c14c5',2,30,1,'2c86fa0f-5f90-4a74-be60-28b61a51b3a4',NULL),('aeb01ce8-bd14-4c37-839c-28a7b341335b',NULL,'conditional-user-configured','65fa274b-8112-4346-8bcc-e604adb24617','4f08c3ed-3ec1-4cc8-ada5-5592f273cb2e',0,10,0,NULL,NULL),('b195b590-cf1b-46b4-87e4-60763456a311',NULL,'http-basic-authenticator','65fa274b-8112-4346-8bcc-e604adb24617','143b95d8-ae5f-4922-ae7e-7de4cf07aed8',0,10,0,NULL,NULL),('bc256207-3857-4ee6-a77e-a08aef579826',NULL,'client-x509','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','3270b25e-ce0a-4cc2-9bc3-4aa10ae3fe55',2,40,0,NULL,NULL),('bced081a-f85a-43f2-8b54-4d4e0a22ea80',NULL,'conditional-user-configured','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','696f2a47-26e4-4d4e-be24-82b9571938c1',0,10,0,NULL,NULL),('bee131d8-8ea3-46bf-83ff-78ec19ba6ef9',NULL,'conditional-user-configured','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','e1f363e5-c01c-431d-8fee-90cb91cfd729',0,10,0,NULL,NULL),('bf4c3999-277a-4b74-acbb-8fc0a7b3fab1',NULL,'auth-otp-form','65fa274b-8112-4346-8bcc-e604adb24617','0865a6da-4c94-4915-b16e-e321abc36101',0,20,0,NULL,NULL),('c06a7b6f-4ef6-4726-98e4-17497c9d0283',NULL,'direct-grant-validate-password','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','e49bb44b-44c2-483b-939d-0d2a2aae8b10',0,20,0,NULL,NULL),('c4093dd9-ab66-4edd-a9d7-016d26c87874',NULL,'registration-page-form','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','f222b384-eab9-4670-b1c0-4966a2a5b3bc',0,10,1,'68247430-481e-48da-b9bf-1db373e5cdec',NULL),('c58c24c9-8b9e-4d0b-9b93-33071243bc69',NULL,'direct-grant-validate-username','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','e49bb44b-44c2-483b-939d-0d2a2aae8b10',0,10,0,NULL,NULL),('c5b548ce-5c3f-4275-aed0-c1c6305e77b9',NULL,'idp-confirm-link','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','a4d980fb-0056-4f32-bea6-088bc1be4532',0,10,0,NULL,NULL),('cb831105-e80f-4f24-8408-b3197f9c7a07',NULL,'registration-terms-and-conditions','65fa274b-8112-4346-8bcc-e604adb24617','570aeb49-91f9-408f-a093-5a5ee6202040',3,70,0,NULL,NULL),('d1c6318d-63bc-46e6-91e8-0d859f520997',NULL,'direct-grant-validate-otp','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','33c932f8-2c3a-4bb3-9c08-afd9f21d5838',0,20,0,NULL,NULL),('d85b7605-bd23-461b-b0c6-06f0b8555dca',NULL,'idp-email-verification','65fa274b-8112-4346-8bcc-e604adb24617','16e445aa-3db0-40ab-bafc-a6a095ff0c96',2,10,0,NULL,NULL),('ddd6888b-ca57-489b-8249-dab41b6b6cfb',NULL,'auth-username-password-form','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','15d6f7df-8515-4d8f-a203-1070b67e15ae',0,10,0,NULL,NULL),('e0c18dc3-b2e8-4908-abd7-b88547681fa3',NULL,'reset-credential-email','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','fab96004-9cfb-4c51-8b3e-604f6a18d926',0,20,0,NULL,NULL),('e4f93e59-df50-4af2-8d89-567fe00717db',NULL,'docker-http-basic-authenticator','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','994db1b9-4086-4d03-a39a-8e2b98e7c6ef',0,10,0,NULL,NULL),('e68d810b-b358-483c-b0da-537a2e9d6916',NULL,'auth-cookie','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','9c4a9c97-d0f8-48e7-9af1-2f1f40c24706',2,10,0,NULL,NULL),('e8dbe720-5d3a-4a94-b88d-634d1056bf1b',NULL,NULL,'c50626a4-a4f7-42b1-ba55-fdfd2fae3469','257b36b1-446c-490b-8417-01d47d6b93e6',2,20,1,'a4d980fb-0056-4f32-bea6-088bc1be4532',NULL),('e99cfd8e-7756-45a2-b990-17623d1c0660',NULL,'registration-recaptcha-action','65fa274b-8112-4346-8bcc-e604adb24617','570aeb49-91f9-408f-a093-5a5ee6202040',3,60,0,NULL,NULL),('e9b0943b-1069-4a77-9ef2-1993ab8031e2',NULL,'direct-grant-validate-username','65fa274b-8112-4346-8bcc-e604adb24617','66c1e7c3-6aea-49db-a64e-336117df6913',0,10,0,NULL,NULL),('ea880b50-6324-4dd7-ba58-841107173710',NULL,'reset-password','65fa274b-8112-4346-8bcc-e604adb24617','69b0819b-cbc3-4c97-a5aa-0e34063b7b24',0,30,0,NULL,NULL),('ec669347-0917-4091-9124-1fa68553052d',NULL,NULL,'65fa274b-8112-4346-8bcc-e604adb24617','2c86fa0f-5f90-4a74-be60-28b61a51b3a4',1,20,1,'28e39bf2-bc00-46bf-a63e-bb74baca87a2',NULL),('f2168b4b-781d-4257-aff8-dac78fabeb32',NULL,NULL,'65fa274b-8112-4346-8bcc-e604adb24617','66c1e7c3-6aea-49db-a64e-336117df6913',1,30,1,'adee2280-0c93-40d8-9739-581b51400ecd',NULL),('f3e70bf4-2a6d-45f8-bb50-d0770e4e02f3',NULL,'identity-provider-redirector','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','9c4a9c97-d0f8-48e7-9af1-2f1f40c24706',2,25,0,NULL,NULL),('f44382f1-333c-442c-9b11-842f30338d78',NULL,NULL,'c50626a4-a4f7-42b1-ba55-fdfd2fae3469','e49bb44b-44c2-483b-939d-0d2a2aae8b10',1,30,1,'33c932f8-2c3a-4bb3-9c08-afd9f21d5838',NULL),('f5712423-42d9-4b42-8177-7c2d6bd8a1cd',NULL,'registration-user-creation','65fa274b-8112-4346-8bcc-e604adb24617','570aeb49-91f9-408f-a093-5a5ee6202040',0,20,0,NULL,NULL),('f781a83d-d2e2-4dfb-b970-99132b15c577',NULL,'idp-review-profile','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','745088a0-e575-4786-91f7-6712d35419e9',0,10,0,NULL,'1cf0c89e-a5fa-44db-89be-3ba430082d49'),('fb3dd095-ef98-4e1f-bb2e-ac9d58bcb441',NULL,'conditional-user-configured','65fa274b-8112-4346-8bcc-e604adb24617','28e39bf2-bc00-46bf-a63e-bb74baca87a2',0,10,0,NULL,NULL);
/*!40000 ALTER TABLE `AUTHENTICATION_EXECUTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATION_FLOW`
--

DROP TABLE IF EXISTS `AUTHENTICATION_FLOW`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATION_FLOW` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_ID` varchar(36) NOT NULL DEFAULT 'basic-flow',
  `TOP_LEVEL` tinyint NOT NULL DEFAULT '0',
  `BUILT_IN` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_FLOW_REALM` (`REALM_ID`),
  CONSTRAINT `FK_AUTH_FLOW_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATION_FLOW`
--

LOCK TABLES `AUTHENTICATION_FLOW` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATION_FLOW` DISABLE KEYS */;
INSERT INTO `AUTHENTICATION_FLOW` VALUES ('0865a6da-4c94-4915-b16e-e321abc36101','First broker login - Conditional OTP','Flow to determine if the OTP is required for the authentication','65fa274b-8112-4346-8bcc-e604adb24617','basic-flow',0,1),('143b95d8-ae5f-4922-ae7e-7de4cf07aed8','saml ecp','SAML ECP Profile Authentication Flow','65fa274b-8112-4346-8bcc-e604adb24617','basic-flow',1,1),('15d6f7df-8515-4d8f-a203-1070b67e15ae','forms','Username, password, otp and other auth forms.','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','basic-flow',0,1),('16a68b93-bab6-405b-a2f0-867ba1c4e458','saml ecp','SAML ECP Profile Authentication Flow','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','basic-flow',1,1),('16e445aa-3db0-40ab-bafc-a6a095ff0c96','Account verification options','Method with which to verity the existing account','65fa274b-8112-4346-8bcc-e604adb24617','basic-flow',0,1),('21a87d18-c986-4f4b-bbc4-51675fc88e66','docker auth','Used by Docker clients to authenticate against the IDP','65fa274b-8112-4346-8bcc-e604adb24617','basic-flow',1,1),('257b36b1-446c-490b-8417-01d47d6b93e6','User creation or linking','Flow for the existing/non-existing user alternatives','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','basic-flow',0,1),('28e39bf2-bc00-46bf-a63e-bb74baca87a2','Browser - Conditional OTP','Flow to determine if the OTP is required for the authentication','65fa274b-8112-4346-8bcc-e604adb24617','basic-flow',0,1),('2c86fa0f-5f90-4a74-be60-28b61a51b3a4','forms','Username, password, otp and other auth forms.','65fa274b-8112-4346-8bcc-e604adb24617','basic-flow',0,1),('3270b25e-ce0a-4cc2-9bc3-4aa10ae3fe55','clients','Base authentication for clients','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','client-flow',1,1),('33c932f8-2c3a-4bb3-9c08-afd9f21d5838','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','basic-flow',0,1),('3c21ccbd-8fee-4d8d-992b-90dab54c14c5','browser','browser based authentication','65fa274b-8112-4346-8bcc-e604adb24617','basic-flow',1,1),('4f08c3ed-3ec1-4cc8-ada5-5592f273cb2e','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','65fa274b-8112-4346-8bcc-e604adb24617','basic-flow',0,1),('532a1abe-7d86-46e3-92d1-f1dbc17e835b','clients','Base authentication for clients','65fa274b-8112-4346-8bcc-e604adb24617','client-flow',1,1),('57027e60-e0d5-4143-8091-af12c850b3f0','Verify Existing Account by Re-authentication','Reauthentication of existing account','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','basic-flow',0,1),('570aeb49-91f9-408f-a093-5a5ee6202040','registration form','registration form','65fa274b-8112-4346-8bcc-e604adb24617','form-flow',0,1),('66c1e7c3-6aea-49db-a64e-336117df6913','direct grant','OpenID Connect Resource Owner Grant','65fa274b-8112-4346-8bcc-e604adb24617','basic-flow',1,1),('68247430-481e-48da-b9bf-1db373e5cdec','registration form','registration form','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','form-flow',0,1),('696f2a47-26e4-4d4e-be24-82b9571938c1','Browser - Conditional OTP','Flow to determine if the OTP is required for the authentication','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','basic-flow',0,1),('69b0819b-cbc3-4c97-a5aa-0e34063b7b24','reset credentials','Reset credentials for a user if they forgot their password or something','65fa274b-8112-4346-8bcc-e604adb24617','basic-flow',1,1),('6e5c609f-eeb8-442a-a358-8fa31ec7cc51','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','65fa274b-8112-4346-8bcc-e604adb24617','basic-flow',1,1),('745088a0-e575-4786-91f7-6712d35419e9','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','basic-flow',1,1),('963ee2c4-4600-4193-b627-8782b554b3c1','registration','registration flow','65fa274b-8112-4346-8bcc-e604adb24617','basic-flow',1,1),('969e0a38-b97b-494f-af39-5b28f8a3cd7a','User creation or linking','Flow for the existing/non-existing user alternatives','65fa274b-8112-4346-8bcc-e604adb24617','basic-flow',0,1),('994db1b9-4086-4d03-a39a-8e2b98e7c6ef','docker auth','Used by Docker clients to authenticate against the IDP','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','basic-flow',1,1),('9c4a9c97-d0f8-48e7-9af1-2f1f40c24706','browser','browser based authentication','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','basic-flow',1,1),('9ff2aada-299d-4bfa-9b85-b721fb542f99','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','basic-flow',0,1),('a4d980fb-0056-4f32-bea6-088bc1be4532','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','basic-flow',0,1),('adee2280-0c93-40d8-9739-581b51400ecd','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','65fa274b-8112-4346-8bcc-e604adb24617','basic-flow',0,1),('b6123a4f-f027-4019-a5ed-69e71c934551','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','65fa274b-8112-4346-8bcc-e604adb24617','basic-flow',0,1),('bd5c5d41-7585-412b-aa42-9924c58385a8','Verify Existing Account by Re-authentication','Reauthentication of existing account','65fa274b-8112-4346-8bcc-e604adb24617','basic-flow',0,1),('d60dec79-ec39-4797-ad93-0eb905143d9e','Account verification options','Method with which to verity the existing account','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','basic-flow',0,1),('e1f363e5-c01c-431d-8fee-90cb91cfd729','First broker login - Conditional OTP','Flow to determine if the OTP is required for the authentication','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','basic-flow',0,1),('e49bb44b-44c2-483b-939d-0d2a2aae8b10','direct grant','OpenID Connect Resource Owner Grant','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','basic-flow',1,1),('f222b384-eab9-4670-b1c0-4966a2a5b3bc','registration','registration flow','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','basic-flow',1,1),('fab96004-9cfb-4c51-8b3e-604f6a18d926','reset credentials','Reset credentials for a user if they forgot their password or something','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','basic-flow',1,1);
/*!40000 ALTER TABLE `AUTHENTICATION_FLOW` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATOR_CONFIG`
--

DROP TABLE IF EXISTS `AUTHENTICATOR_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATOR_CONFIG` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_CONFIG_REALM` (`REALM_ID`),
  CONSTRAINT `FK_AUTH_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATOR_CONFIG`
--

LOCK TABLES `AUTHENTICATOR_CONFIG` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG` DISABLE KEYS */;
INSERT INTO `AUTHENTICATOR_CONFIG` VALUES ('09c9b490-412a-48ce-8be0-a08e112d92ab','review profile config','65fa274b-8112-4346-8bcc-e604adb24617'),('1cf0c89e-a5fa-44db-89be-3ba430082d49','review profile config','c50626a4-a4f7-42b1-ba55-fdfd2fae3469'),('458e7692-412d-4a67-a234-dd1e9da27a97','create unique user config','65fa274b-8112-4346-8bcc-e604adb24617'),('dd48776b-e644-4ad3-82bb-bedf5836e8fb','create unique user config','c50626a4-a4f7-42b1-ba55-fdfd2fae3469');
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATOR_CONFIG_ENTRY`
--

DROP TABLE IF EXISTS `AUTHENTICATOR_CONFIG_ENTRY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATOR_CONFIG_ENTRY` (
  `AUTHENTICATOR_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`AUTHENTICATOR_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATOR_CONFIG_ENTRY`
--

LOCK TABLES `AUTHENTICATOR_CONFIG_ENTRY` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG_ENTRY` DISABLE KEYS */;
INSERT INTO `AUTHENTICATOR_CONFIG_ENTRY` VALUES ('09c9b490-412a-48ce-8be0-a08e112d92ab','missing','update.profile.on.first.login'),('1cf0c89e-a5fa-44db-89be-3ba430082d49','missing','update.profile.on.first.login'),('458e7692-412d-4a67-a234-dd1e9da27a97','false','require.password.update.after.registration'),('dd48776b-e644-4ad3-82bb-bedf5836e8fb','false','require.password.update.after.registration');
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG_ENTRY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BROKER_LINK`
--

DROP TABLE IF EXISTS `BROKER_LINK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BROKER_LINK` (
  `IDENTITY_PROVIDER` varchar(255) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `BROKER_USER_ID` varchar(255) DEFAULT NULL,
  `BROKER_USERNAME` varchar(255) DEFAULT NULL,
  `TOKEN` text,
  `USER_ID` varchar(255) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BROKER_LINK`
--

LOCK TABLES `BROKER_LINK` WRITE;
/*!40000 ALTER TABLE `BROKER_LINK` DISABLE KEYS */;
/*!40000 ALTER TABLE `BROKER_LINK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT`
--

DROP TABLE IF EXISTS `CLIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT` (
  `ID` varchar(36) NOT NULL,
  `ENABLED` tinyint NOT NULL DEFAULT '0',
  `FULL_SCOPE_ALLOWED` tinyint NOT NULL DEFAULT '0',
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int DEFAULT NULL,
  `PUBLIC_CLIENT` tinyint NOT NULL DEFAULT '0',
  `SECRET` varchar(255) DEFAULT NULL,
  `BASE_URL` varchar(255) DEFAULT NULL,
  `BEARER_ONLY` tinyint NOT NULL DEFAULT '0',
  `MANAGEMENT_URL` varchar(255) DEFAULT NULL,
  `SURROGATE_AUTH_REQUIRED` tinyint NOT NULL DEFAULT '0',
  `REALM_ID` varchar(36) DEFAULT NULL,
  `PROTOCOL` varchar(255) DEFAULT NULL,
  `NODE_REREG_TIMEOUT` int DEFAULT '0',
  `FRONTCHANNEL_LOGOUT` tinyint NOT NULL DEFAULT '0',
  `CONSENT_REQUIRED` tinyint NOT NULL DEFAULT '0',
  `NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `SERVICE_ACCOUNTS_ENABLED` tinyint NOT NULL DEFAULT '0',
  `CLIENT_AUTHENTICATOR_TYPE` varchar(255) DEFAULT NULL,
  `ROOT_URL` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `REGISTRATION_TOKEN` varchar(255) DEFAULT NULL,
  `STANDARD_FLOW_ENABLED` tinyint NOT NULL DEFAULT '1',
  `IMPLICIT_FLOW_ENABLED` tinyint NOT NULL DEFAULT '0',
  `DIRECT_ACCESS_GRANTS_ENABLED` tinyint NOT NULL DEFAULT '0',
  `ALWAYS_DISPLAY_IN_CONSOLE` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_B71CJLBENV945RB6GCON438AT` (`REALM_ID`,`CLIENT_ID`),
  KEY `IDX_CLIENT_ID` (`CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT`
--

LOCK TABLES `CLIENT` WRITE;
/*!40000 ALTER TABLE `CLIENT` DISABLE KEYS */;
INSERT INTO `CLIENT` VALUES ('04479882-1cfd-4949-839b-920b808aa3b8',1,0,'ou-graduation-realm-realm',0,0,NULL,NULL,1,NULL,0,'65fa274b-8112-4346-8bcc-e604adb24617',NULL,0,0,0,'ou-graduation-realm Realm',0,'client-secret',NULL,NULL,NULL,1,0,0,0),('35ce0d50-565f-4bc2-8de6-02b37f931b21',1,0,'realm-management',0,0,NULL,NULL,1,NULL,0,'c50626a4-a4f7-42b1-ba55-fdfd2fae3469','openid-connect',0,0,0,'${client_realm-management}',0,'client-secret',NULL,NULL,NULL,1,0,0,0),('379d9d40-4028-4535-a129-64c4c14ac7a3',1,0,'master-realm',0,0,NULL,NULL,1,NULL,0,'65fa274b-8112-4346-8bcc-e604adb24617',NULL,0,0,0,'master Realm',0,'client-secret',NULL,NULL,NULL,1,0,0,0),('3e22a15e-acef-4f19-b2a0-3afca2189471',1,0,'security-admin-console',0,1,NULL,'/admin/master/console/',0,NULL,0,'65fa274b-8112-4346-8bcc-e604adb24617','openid-connect',0,0,0,'${client_security-admin-console}',0,'client-secret','${authAdminUrl}',NULL,NULL,1,0,0,0),('4343803d-ef63-4a4e-9193-015829c16bb6',1,0,'admin-cli',0,1,NULL,NULL,0,NULL,0,'65fa274b-8112-4346-8bcc-e604adb24617','openid-connect',0,0,0,'${client_admin-cli}',0,'client-secret',NULL,NULL,NULL,0,0,1,0),('4bfe7132-eb47-4062-8535-c5fd91bc499f',1,0,'account',0,1,NULL,'/realms/master/account/',0,NULL,0,'65fa274b-8112-4346-8bcc-e604adb24617','openid-connect',0,0,0,'${client_account}',0,'client-secret','${authBaseUrl}',NULL,NULL,1,0,0,0),('56ba2ab7-e961-46ab-8c94-c838c4017250',1,0,'account-console',0,1,NULL,'/realms/ou-graduation-realm/account/',0,NULL,0,'c50626a4-a4f7-42b1-ba55-fdfd2fae3469','openid-connect',0,0,0,'${client_account-console}',0,'client-secret','${authBaseUrl}',NULL,NULL,1,0,0,0),('5805f5dc-5eef-427b-b52c-beb0fc639fff',1,0,'account-console',0,1,NULL,'/realms/master/account/',0,NULL,0,'65fa274b-8112-4346-8bcc-e604adb24617','openid-connect',0,0,0,'${client_account-console}',0,'client-secret','${authBaseUrl}',NULL,NULL,1,0,0,0),('5d23aeec-eb4e-4339-8c18-cf8f4e704cbb',1,0,'admin-cli',0,1,NULL,NULL,0,NULL,0,'c50626a4-a4f7-42b1-ba55-fdfd2fae3469','openid-connect',0,0,0,'${client_admin-cli}',0,'client-secret',NULL,NULL,NULL,0,0,1,0),('b33e20b2-62d3-4afa-a5f1-18ff3234bafd',1,0,'security-admin-console',0,1,NULL,'/admin/ou-graduation-realm/console/',0,NULL,0,'c50626a4-a4f7-42b1-ba55-fdfd2fae3469','openid-connect',0,0,0,'${client_security-admin-console}',0,'client-secret','${authAdminUrl}',NULL,NULL,1,0,0,0),('c3ac2c21-6ba6-4dc6-85b0-65fe3c6891bb',1,0,'account',0,1,NULL,'/realms/ou-graduation-realm/account/',0,NULL,0,'c50626a4-a4f7-42b1-ba55-fdfd2fae3469','openid-connect',0,0,0,'${client_account}',0,'client-secret','${authBaseUrl}',NULL,NULL,1,0,0,0),('d26e729e-9d1e-42cb-b4f0-e81f3d252ff3',1,1,'ou-graduation-client',0,0,'Z2RICTTuAuuLjw6npoHn1acqexOlAbDP','',0,'',0,'c50626a4-a4f7-42b1-ba55-fdfd2fae3469','openid-connect',-1,1,0,'OU Graduation Client',1,'client-secret','','',NULL,1,1,1,0),('d2e379d6-839f-43b6-8b61-b96f0530f2f8',1,0,'broker',0,0,NULL,NULL,1,NULL,0,'65fa274b-8112-4346-8bcc-e604adb24617','openid-connect',0,0,0,'${client_broker}',0,'client-secret',NULL,NULL,NULL,1,0,0,0),('da2ee40e-b2a6-4fb7-8955-56e2798a2d09',1,0,'broker',0,0,NULL,NULL,1,NULL,0,'c50626a4-a4f7-42b1-ba55-fdfd2fae3469','openid-connect',0,0,0,'${client_broker}',0,'client-secret',NULL,NULL,NULL,1,0,0,0);
/*!40000 ALTER TABLE `CLIENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_ATTRIBUTES`
--

DROP TABLE IF EXISTS `CLIENT_ATTRIBUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_ATTRIBUTES` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  PRIMARY KEY (`CLIENT_ID`,`NAME`),
  KEY `IDX_CLIENT_ATT_BY_NAME_VALUE` (`NAME`,`VALUE`(255)),
  CONSTRAINT `FK3C47C64BEACCA966` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_ATTRIBUTES`
--

LOCK TABLES `CLIENT_ATTRIBUTES` WRITE;
/*!40000 ALTER TABLE `CLIENT_ATTRIBUTES` DISABLE KEYS */;
INSERT INTO `CLIENT_ATTRIBUTES` VALUES ('3e22a15e-acef-4f19-b2a0-3afca2189471','pkce.code.challenge.method','S256'),('3e22a15e-acef-4f19-b2a0-3afca2189471','post.logout.redirect.uris','+'),('4bfe7132-eb47-4062-8535-c5fd91bc499f','post.logout.redirect.uris','+'),('56ba2ab7-e961-46ab-8c94-c838c4017250','pkce.code.challenge.method','S256'),('56ba2ab7-e961-46ab-8c94-c838c4017250','post.logout.redirect.uris','+'),('5805f5dc-5eef-427b-b52c-beb0fc639fff','pkce.code.challenge.method','S256'),('5805f5dc-5eef-427b-b52c-beb0fc639fff','post.logout.redirect.uris','+'),('b33e20b2-62d3-4afa-a5f1-18ff3234bafd','pkce.code.challenge.method','S256'),('b33e20b2-62d3-4afa-a5f1-18ff3234bafd','post.logout.redirect.uris','+'),('c3ac2c21-6ba6-4dc6-85b0-65fe3c6891bb','post.logout.redirect.uris','+'),('d26e729e-9d1e-42cb-b4f0-e81f3d252ff3','backchannel.logout.revoke.offline.tokens','false'),('d26e729e-9d1e-42cb-b4f0-e81f3d252ff3','backchannel.logout.session.required','true'),('d26e729e-9d1e-42cb-b4f0-e81f3d252ff3','client.secret.creation.time','1711945949'),('d26e729e-9d1e-42cb-b4f0-e81f3d252ff3','oauth2.device.authorization.grant.enabled','false'),('d26e729e-9d1e-42cb-b4f0-e81f3d252ff3','oidc.ciba.grant.enabled','false');
/*!40000 ALTER TABLE `CLIENT_ATTRIBUTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_AUTH_FLOW_BINDINGS`
--

DROP TABLE IF EXISTS `CLIENT_AUTH_FLOW_BINDINGS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_AUTH_FLOW_BINDINGS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `FLOW_ID` varchar(36) DEFAULT NULL,
  `BINDING_NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`BINDING_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_AUTH_FLOW_BINDINGS`
--

LOCK TABLES `CLIENT_AUTH_FLOW_BINDINGS` WRITE;
/*!40000 ALTER TABLE `CLIENT_AUTH_FLOW_BINDINGS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_AUTH_FLOW_BINDINGS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_INITIAL_ACCESS`
--

DROP TABLE IF EXISTS `CLIENT_INITIAL_ACCESS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_INITIAL_ACCESS` (
  `ID` varchar(36) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `TIMESTAMP` int DEFAULT NULL,
  `EXPIRATION` int DEFAULT NULL,
  `COUNT` int DEFAULT NULL,
  `REMAINING_COUNT` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_CLIENT_INIT_ACC_REALM` (`REALM_ID`),
  CONSTRAINT `FK_CLIENT_INIT_ACC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_INITIAL_ACCESS`
--

LOCK TABLES `CLIENT_INITIAL_ACCESS` WRITE;
/*!40000 ALTER TABLE `CLIENT_INITIAL_ACCESS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_INITIAL_ACCESS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_NODE_REGISTRATIONS`
--

DROP TABLE IF EXISTS `CLIENT_NODE_REGISTRATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_NODE_REGISTRATIONS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` int DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`NAME`),
  CONSTRAINT `FK4129723BA992F594` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_NODE_REGISTRATIONS`
--

LOCK TABLES `CLIENT_NODE_REGISTRATIONS` WRITE;
/*!40000 ALTER TABLE `CLIENT_NODE_REGISTRATIONS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_NODE_REGISTRATIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `PROTOCOL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_CLI_SCOPE` (`REALM_ID`,`NAME`),
  KEY `IDX_REALM_CLSCOPE` (`REALM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE`
--

LOCK TABLES `CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE` VALUES ('0dc19f01-55be-433c-9c00-7a869c05be54','address','65fa274b-8112-4346-8bcc-e604adb24617','OpenID Connect built-in scope: address','openid-connect'),('311ae408-59ec-4073-8968-2b2e89581704','roles','65fa274b-8112-4346-8bcc-e604adb24617','OpenID Connect scope for add user roles to the access token','openid-connect'),('3c6a8f99-32ea-49da-814b-41ad1857363d','address','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','OpenID Connect built-in scope: address','openid-connect'),('4015d60d-3a56-4cbd-a3c6-1324633f0dc8','web-origins','65fa274b-8112-4346-8bcc-e604adb24617','OpenID Connect scope for add allowed web origins to the access token','openid-connect'),('4da027e2-70d1-4d8d-97bc-c04a3bc539f2','roles','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','OpenID Connect scope for add user roles to the access token','openid-connect'),('6b238264-b8e6-4459-ab6a-6b5bc6859109','microprofile-jwt','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','Microprofile - JWT built-in scope','openid-connect'),('85e41bf7-c0a1-423c-8343-f7e469f1dc0d','phone','65fa274b-8112-4346-8bcc-e604adb24617','OpenID Connect built-in scope: phone','openid-connect'),('9f030e0c-8646-4059-b6d4-6afe7f7eec1d','acr','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','OpenID Connect scope for add acr (authentication context class reference) to the token','openid-connect'),('a3974574-b731-4589-bcd7-ef2917ad1e81','acr','65fa274b-8112-4346-8bcc-e604adb24617','OpenID Connect scope for add acr (authentication context class reference) to the token','openid-connect'),('a79dbbf9-956d-45bc-906b-96155c01e9ac','role_list','65fa274b-8112-4346-8bcc-e604adb24617','SAML role list','saml'),('b30c9eee-9b69-4526-ab2a-550681b831fb','profile','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','OpenID Connect built-in scope: profile','openid-connect'),('b8993406-532f-45ae-97b6-c551c371faf9','offline_access','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','OpenID Connect built-in scope: offline_access','openid-connect'),('bdfd3973-f196-466c-ab2b-73fafd4bc24e','role_list','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','SAML role list','saml'),('be66596b-24f0-467a-8b96-9ae473ca50e8','email','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','OpenID Connect built-in scope: email','openid-connect'),('d62952fc-d729-489e-badb-fbb40f43b173','email','65fa274b-8112-4346-8bcc-e604adb24617','OpenID Connect built-in scope: email','openid-connect'),('d9dd3a6c-796e-4995-b977-4827df5c4ef8','phone','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','OpenID Connect built-in scope: phone','openid-connect'),('e47b778a-0ddc-4808-9fc1-50e0f7ba5ab6','offline_access','65fa274b-8112-4346-8bcc-e604adb24617','OpenID Connect built-in scope: offline_access','openid-connect'),('e9a6dec0-7e3e-4110-be2e-01cd0ba96871','microprofile-jwt','65fa274b-8112-4346-8bcc-e604adb24617','Microprofile - JWT built-in scope','openid-connect'),('efde2333-07f6-4958-92cb-0ab294ab3608','profile','65fa274b-8112-4346-8bcc-e604adb24617','OpenID Connect built-in scope: profile','openid-connect'),('fab142b7-0c39-4dde-856f-74aacca4c1c3','web-origins','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','OpenID Connect scope for add allowed web origins to the access token','openid-connect');
/*!40000 ALTER TABLE `CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_ATTRIBUTES`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_ATTRIBUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE_ATTRIBUTES` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `VALUE` text,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`NAME`),
  KEY `IDX_CLSCOPE_ATTRS` (`SCOPE_ID`),
  CONSTRAINT `FK_CL_SCOPE_ATTR_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_ATTRIBUTES`
--

LOCK TABLES `CLIENT_SCOPE_ATTRIBUTES` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_ATTRIBUTES` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES ('0dc19f01-55be-433c-9c00-7a869c05be54','${addressScopeConsentText}','consent.screen.text'),('0dc19f01-55be-433c-9c00-7a869c05be54','true','display.on.consent.screen'),('0dc19f01-55be-433c-9c00-7a869c05be54','true','include.in.token.scope'),('311ae408-59ec-4073-8968-2b2e89581704','${rolesScopeConsentText}','consent.screen.text'),('311ae408-59ec-4073-8968-2b2e89581704','true','display.on.consent.screen'),('311ae408-59ec-4073-8968-2b2e89581704','false','include.in.token.scope'),('3c6a8f99-32ea-49da-814b-41ad1857363d','${addressScopeConsentText}','consent.screen.text'),('3c6a8f99-32ea-49da-814b-41ad1857363d','true','display.on.consent.screen'),('3c6a8f99-32ea-49da-814b-41ad1857363d','true','include.in.token.scope'),('4015d60d-3a56-4cbd-a3c6-1324633f0dc8','','consent.screen.text'),('4015d60d-3a56-4cbd-a3c6-1324633f0dc8','false','display.on.consent.screen'),('4015d60d-3a56-4cbd-a3c6-1324633f0dc8','false','include.in.token.scope'),('4da027e2-70d1-4d8d-97bc-c04a3bc539f2','${rolesScopeConsentText}','consent.screen.text'),('4da027e2-70d1-4d8d-97bc-c04a3bc539f2','true','display.on.consent.screen'),('4da027e2-70d1-4d8d-97bc-c04a3bc539f2','false','include.in.token.scope'),('6b238264-b8e6-4459-ab6a-6b5bc6859109','false','display.on.consent.screen'),('6b238264-b8e6-4459-ab6a-6b5bc6859109','true','include.in.token.scope'),('85e41bf7-c0a1-423c-8343-f7e469f1dc0d','${phoneScopeConsentText}','consent.screen.text'),('85e41bf7-c0a1-423c-8343-f7e469f1dc0d','true','display.on.consent.screen'),('85e41bf7-c0a1-423c-8343-f7e469f1dc0d','true','include.in.token.scope'),('9f030e0c-8646-4059-b6d4-6afe7f7eec1d','false','display.on.consent.screen'),('9f030e0c-8646-4059-b6d4-6afe7f7eec1d','false','include.in.token.scope'),('a3974574-b731-4589-bcd7-ef2917ad1e81','false','display.on.consent.screen'),('a3974574-b731-4589-bcd7-ef2917ad1e81','false','include.in.token.scope'),('a79dbbf9-956d-45bc-906b-96155c01e9ac','${samlRoleListScopeConsentText}','consent.screen.text'),('a79dbbf9-956d-45bc-906b-96155c01e9ac','true','display.on.consent.screen'),('b30c9eee-9b69-4526-ab2a-550681b831fb','${profileScopeConsentText}','consent.screen.text'),('b30c9eee-9b69-4526-ab2a-550681b831fb','true','display.on.consent.screen'),('b30c9eee-9b69-4526-ab2a-550681b831fb','true','include.in.token.scope'),('b8993406-532f-45ae-97b6-c551c371faf9','${offlineAccessScopeConsentText}','consent.screen.text'),('b8993406-532f-45ae-97b6-c551c371faf9','true','display.on.consent.screen'),('bdfd3973-f196-466c-ab2b-73fafd4bc24e','${samlRoleListScopeConsentText}','consent.screen.text'),('bdfd3973-f196-466c-ab2b-73fafd4bc24e','true','display.on.consent.screen'),('be66596b-24f0-467a-8b96-9ae473ca50e8','${emailScopeConsentText}','consent.screen.text'),('be66596b-24f0-467a-8b96-9ae473ca50e8','true','display.on.consent.screen'),('be66596b-24f0-467a-8b96-9ae473ca50e8','true','include.in.token.scope'),('d62952fc-d729-489e-badb-fbb40f43b173','${emailScopeConsentText}','consent.screen.text'),('d62952fc-d729-489e-badb-fbb40f43b173','true','display.on.consent.screen'),('d62952fc-d729-489e-badb-fbb40f43b173','true','include.in.token.scope'),('d9dd3a6c-796e-4995-b977-4827df5c4ef8','${phoneScopeConsentText}','consent.screen.text'),('d9dd3a6c-796e-4995-b977-4827df5c4ef8','true','display.on.consent.screen'),('d9dd3a6c-796e-4995-b977-4827df5c4ef8','true','include.in.token.scope'),('e47b778a-0ddc-4808-9fc1-50e0f7ba5ab6','${offlineAccessScopeConsentText}','consent.screen.text'),('e47b778a-0ddc-4808-9fc1-50e0f7ba5ab6','true','display.on.consent.screen'),('e9a6dec0-7e3e-4110-be2e-01cd0ba96871','false','display.on.consent.screen'),('e9a6dec0-7e3e-4110-be2e-01cd0ba96871','true','include.in.token.scope'),('efde2333-07f6-4958-92cb-0ab294ab3608','${profileScopeConsentText}','consent.screen.text'),('efde2333-07f6-4958-92cb-0ab294ab3608','true','display.on.consent.screen'),('efde2333-07f6-4958-92cb-0ab294ab3608','true','include.in.token.scope'),('fab142b7-0c39-4dde-856f-74aacca4c1c3','','consent.screen.text'),('fab142b7-0c39-4dde-856f-74aacca4c1c3','false','display.on.consent.screen'),('fab142b7-0c39-4dde-856f-74aacca4c1c3','false','include.in.token.scope');
/*!40000 ALTER TABLE `CLIENT_SCOPE_ATTRIBUTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_CLIENT`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_CLIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE_CLIENT` (
  `CLIENT_ID` varchar(255) NOT NULL,
  `SCOPE_ID` varchar(255) NOT NULL,
  `DEFAULT_SCOPE` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`CLIENT_ID`,`SCOPE_ID`),
  KEY `IDX_CLSCOPE_CL` (`CLIENT_ID`),
  KEY `IDX_CL_CLSCOPE` (`SCOPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_CLIENT`
--

LOCK TABLES `CLIENT_SCOPE_CLIENT` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_CLIENT` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('35ce0d50-565f-4bc2-8de6-02b37f931b21','3c6a8f99-32ea-49da-814b-41ad1857363d',0),('35ce0d50-565f-4bc2-8de6-02b37f931b21','4da027e2-70d1-4d8d-97bc-c04a3bc539f2',1),('35ce0d50-565f-4bc2-8de6-02b37f931b21','6b238264-b8e6-4459-ab6a-6b5bc6859109',0),('35ce0d50-565f-4bc2-8de6-02b37f931b21','9f030e0c-8646-4059-b6d4-6afe7f7eec1d',1),('35ce0d50-565f-4bc2-8de6-02b37f931b21','b30c9eee-9b69-4526-ab2a-550681b831fb',1),('35ce0d50-565f-4bc2-8de6-02b37f931b21','b8993406-532f-45ae-97b6-c551c371faf9',0),('35ce0d50-565f-4bc2-8de6-02b37f931b21','be66596b-24f0-467a-8b96-9ae473ca50e8',1),('35ce0d50-565f-4bc2-8de6-02b37f931b21','d9dd3a6c-796e-4995-b977-4827df5c4ef8',0),('35ce0d50-565f-4bc2-8de6-02b37f931b21','fab142b7-0c39-4dde-856f-74aacca4c1c3',1),('379d9d40-4028-4535-a129-64c4c14ac7a3','0dc19f01-55be-433c-9c00-7a869c05be54',0),('379d9d40-4028-4535-a129-64c4c14ac7a3','311ae408-59ec-4073-8968-2b2e89581704',1),('379d9d40-4028-4535-a129-64c4c14ac7a3','4015d60d-3a56-4cbd-a3c6-1324633f0dc8',1),('379d9d40-4028-4535-a129-64c4c14ac7a3','85e41bf7-c0a1-423c-8343-f7e469f1dc0d',0),('379d9d40-4028-4535-a129-64c4c14ac7a3','a3974574-b731-4589-bcd7-ef2917ad1e81',1),('379d9d40-4028-4535-a129-64c4c14ac7a3','d62952fc-d729-489e-badb-fbb40f43b173',1),('379d9d40-4028-4535-a129-64c4c14ac7a3','e47b778a-0ddc-4808-9fc1-50e0f7ba5ab6',0),('379d9d40-4028-4535-a129-64c4c14ac7a3','e9a6dec0-7e3e-4110-be2e-01cd0ba96871',0),('379d9d40-4028-4535-a129-64c4c14ac7a3','efde2333-07f6-4958-92cb-0ab294ab3608',1),('3e22a15e-acef-4f19-b2a0-3afca2189471','0dc19f01-55be-433c-9c00-7a869c05be54',0),('3e22a15e-acef-4f19-b2a0-3afca2189471','311ae408-59ec-4073-8968-2b2e89581704',1),('3e22a15e-acef-4f19-b2a0-3afca2189471','4015d60d-3a56-4cbd-a3c6-1324633f0dc8',1),('3e22a15e-acef-4f19-b2a0-3afca2189471','85e41bf7-c0a1-423c-8343-f7e469f1dc0d',0),('3e22a15e-acef-4f19-b2a0-3afca2189471','a3974574-b731-4589-bcd7-ef2917ad1e81',1),('3e22a15e-acef-4f19-b2a0-3afca2189471','d62952fc-d729-489e-badb-fbb40f43b173',1),('3e22a15e-acef-4f19-b2a0-3afca2189471','e47b778a-0ddc-4808-9fc1-50e0f7ba5ab6',0),('3e22a15e-acef-4f19-b2a0-3afca2189471','e9a6dec0-7e3e-4110-be2e-01cd0ba96871',0),('3e22a15e-acef-4f19-b2a0-3afca2189471','efde2333-07f6-4958-92cb-0ab294ab3608',1),('4343803d-ef63-4a4e-9193-015829c16bb6','0dc19f01-55be-433c-9c00-7a869c05be54',0),('4343803d-ef63-4a4e-9193-015829c16bb6','311ae408-59ec-4073-8968-2b2e89581704',1),('4343803d-ef63-4a4e-9193-015829c16bb6','4015d60d-3a56-4cbd-a3c6-1324633f0dc8',1),('4343803d-ef63-4a4e-9193-015829c16bb6','85e41bf7-c0a1-423c-8343-f7e469f1dc0d',0),('4343803d-ef63-4a4e-9193-015829c16bb6','a3974574-b731-4589-bcd7-ef2917ad1e81',1),('4343803d-ef63-4a4e-9193-015829c16bb6','d62952fc-d729-489e-badb-fbb40f43b173',1),('4343803d-ef63-4a4e-9193-015829c16bb6','e47b778a-0ddc-4808-9fc1-50e0f7ba5ab6',0),('4343803d-ef63-4a4e-9193-015829c16bb6','e9a6dec0-7e3e-4110-be2e-01cd0ba96871',0),('4343803d-ef63-4a4e-9193-015829c16bb6','efde2333-07f6-4958-92cb-0ab294ab3608',1),('4bfe7132-eb47-4062-8535-c5fd91bc499f','0dc19f01-55be-433c-9c00-7a869c05be54',0),('4bfe7132-eb47-4062-8535-c5fd91bc499f','311ae408-59ec-4073-8968-2b2e89581704',1),('4bfe7132-eb47-4062-8535-c5fd91bc499f','4015d60d-3a56-4cbd-a3c6-1324633f0dc8',1),('4bfe7132-eb47-4062-8535-c5fd91bc499f','85e41bf7-c0a1-423c-8343-f7e469f1dc0d',0),('4bfe7132-eb47-4062-8535-c5fd91bc499f','a3974574-b731-4589-bcd7-ef2917ad1e81',1),('4bfe7132-eb47-4062-8535-c5fd91bc499f','d62952fc-d729-489e-badb-fbb40f43b173',1),('4bfe7132-eb47-4062-8535-c5fd91bc499f','e47b778a-0ddc-4808-9fc1-50e0f7ba5ab6',0),('4bfe7132-eb47-4062-8535-c5fd91bc499f','e9a6dec0-7e3e-4110-be2e-01cd0ba96871',0),('4bfe7132-eb47-4062-8535-c5fd91bc499f','efde2333-07f6-4958-92cb-0ab294ab3608',1),('56ba2ab7-e961-46ab-8c94-c838c4017250','3c6a8f99-32ea-49da-814b-41ad1857363d',0),('56ba2ab7-e961-46ab-8c94-c838c4017250','4da027e2-70d1-4d8d-97bc-c04a3bc539f2',1),('56ba2ab7-e961-46ab-8c94-c838c4017250','6b238264-b8e6-4459-ab6a-6b5bc6859109',0),('56ba2ab7-e961-46ab-8c94-c838c4017250','9f030e0c-8646-4059-b6d4-6afe7f7eec1d',1),('56ba2ab7-e961-46ab-8c94-c838c4017250','b30c9eee-9b69-4526-ab2a-550681b831fb',1),('56ba2ab7-e961-46ab-8c94-c838c4017250','b8993406-532f-45ae-97b6-c551c371faf9',0),('56ba2ab7-e961-46ab-8c94-c838c4017250','be66596b-24f0-467a-8b96-9ae473ca50e8',1),('56ba2ab7-e961-46ab-8c94-c838c4017250','d9dd3a6c-796e-4995-b977-4827df5c4ef8',0),('56ba2ab7-e961-46ab-8c94-c838c4017250','fab142b7-0c39-4dde-856f-74aacca4c1c3',1),('5805f5dc-5eef-427b-b52c-beb0fc639fff','0dc19f01-55be-433c-9c00-7a869c05be54',0),('5805f5dc-5eef-427b-b52c-beb0fc639fff','311ae408-59ec-4073-8968-2b2e89581704',1),('5805f5dc-5eef-427b-b52c-beb0fc639fff','4015d60d-3a56-4cbd-a3c6-1324633f0dc8',1),('5805f5dc-5eef-427b-b52c-beb0fc639fff','85e41bf7-c0a1-423c-8343-f7e469f1dc0d',0),('5805f5dc-5eef-427b-b52c-beb0fc639fff','a3974574-b731-4589-bcd7-ef2917ad1e81',1),('5805f5dc-5eef-427b-b52c-beb0fc639fff','d62952fc-d729-489e-badb-fbb40f43b173',1),('5805f5dc-5eef-427b-b52c-beb0fc639fff','e47b778a-0ddc-4808-9fc1-50e0f7ba5ab6',0),('5805f5dc-5eef-427b-b52c-beb0fc639fff','e9a6dec0-7e3e-4110-be2e-01cd0ba96871',0),('5805f5dc-5eef-427b-b52c-beb0fc639fff','efde2333-07f6-4958-92cb-0ab294ab3608',1),('5d23aeec-eb4e-4339-8c18-cf8f4e704cbb','3c6a8f99-32ea-49da-814b-41ad1857363d',0),('5d23aeec-eb4e-4339-8c18-cf8f4e704cbb','4da027e2-70d1-4d8d-97bc-c04a3bc539f2',1),('5d23aeec-eb4e-4339-8c18-cf8f4e704cbb','6b238264-b8e6-4459-ab6a-6b5bc6859109',0),('5d23aeec-eb4e-4339-8c18-cf8f4e704cbb','9f030e0c-8646-4059-b6d4-6afe7f7eec1d',1),('5d23aeec-eb4e-4339-8c18-cf8f4e704cbb','b30c9eee-9b69-4526-ab2a-550681b831fb',1),('5d23aeec-eb4e-4339-8c18-cf8f4e704cbb','b8993406-532f-45ae-97b6-c551c371faf9',0),('5d23aeec-eb4e-4339-8c18-cf8f4e704cbb','be66596b-24f0-467a-8b96-9ae473ca50e8',1),('5d23aeec-eb4e-4339-8c18-cf8f4e704cbb','d9dd3a6c-796e-4995-b977-4827df5c4ef8',0),('5d23aeec-eb4e-4339-8c18-cf8f4e704cbb','fab142b7-0c39-4dde-856f-74aacca4c1c3',1),('b33e20b2-62d3-4afa-a5f1-18ff3234bafd','3c6a8f99-32ea-49da-814b-41ad1857363d',0),('b33e20b2-62d3-4afa-a5f1-18ff3234bafd','4da027e2-70d1-4d8d-97bc-c04a3bc539f2',1),('b33e20b2-62d3-4afa-a5f1-18ff3234bafd','6b238264-b8e6-4459-ab6a-6b5bc6859109',0),('b33e20b2-62d3-4afa-a5f1-18ff3234bafd','9f030e0c-8646-4059-b6d4-6afe7f7eec1d',1),('b33e20b2-62d3-4afa-a5f1-18ff3234bafd','b30c9eee-9b69-4526-ab2a-550681b831fb',1),('b33e20b2-62d3-4afa-a5f1-18ff3234bafd','b8993406-532f-45ae-97b6-c551c371faf9',0),('b33e20b2-62d3-4afa-a5f1-18ff3234bafd','be66596b-24f0-467a-8b96-9ae473ca50e8',1),('b33e20b2-62d3-4afa-a5f1-18ff3234bafd','d9dd3a6c-796e-4995-b977-4827df5c4ef8',0),('b33e20b2-62d3-4afa-a5f1-18ff3234bafd','fab142b7-0c39-4dde-856f-74aacca4c1c3',1),('c3ac2c21-6ba6-4dc6-85b0-65fe3c6891bb','3c6a8f99-32ea-49da-814b-41ad1857363d',0),('c3ac2c21-6ba6-4dc6-85b0-65fe3c6891bb','4da027e2-70d1-4d8d-97bc-c04a3bc539f2',1),('c3ac2c21-6ba6-4dc6-85b0-65fe3c6891bb','6b238264-b8e6-4459-ab6a-6b5bc6859109',0),('c3ac2c21-6ba6-4dc6-85b0-65fe3c6891bb','9f030e0c-8646-4059-b6d4-6afe7f7eec1d',1),('c3ac2c21-6ba6-4dc6-85b0-65fe3c6891bb','b30c9eee-9b69-4526-ab2a-550681b831fb',1),('c3ac2c21-6ba6-4dc6-85b0-65fe3c6891bb','b8993406-532f-45ae-97b6-c551c371faf9',0),('c3ac2c21-6ba6-4dc6-85b0-65fe3c6891bb','be66596b-24f0-467a-8b96-9ae473ca50e8',1),('c3ac2c21-6ba6-4dc6-85b0-65fe3c6891bb','d9dd3a6c-796e-4995-b977-4827df5c4ef8',0),('c3ac2c21-6ba6-4dc6-85b0-65fe3c6891bb','fab142b7-0c39-4dde-856f-74aacca4c1c3',1),('d26e729e-9d1e-42cb-b4f0-e81f3d252ff3','3c6a8f99-32ea-49da-814b-41ad1857363d',0),('d26e729e-9d1e-42cb-b4f0-e81f3d252ff3','4da027e2-70d1-4d8d-97bc-c04a3bc539f2',1),('d26e729e-9d1e-42cb-b4f0-e81f3d252ff3','6b238264-b8e6-4459-ab6a-6b5bc6859109',0),('d26e729e-9d1e-42cb-b4f0-e81f3d252ff3','9f030e0c-8646-4059-b6d4-6afe7f7eec1d',1),('d26e729e-9d1e-42cb-b4f0-e81f3d252ff3','b30c9eee-9b69-4526-ab2a-550681b831fb',1),('d26e729e-9d1e-42cb-b4f0-e81f3d252ff3','b8993406-532f-45ae-97b6-c551c371faf9',0),('d26e729e-9d1e-42cb-b4f0-e81f3d252ff3','be66596b-24f0-467a-8b96-9ae473ca50e8',1),('d26e729e-9d1e-42cb-b4f0-e81f3d252ff3','d9dd3a6c-796e-4995-b977-4827df5c4ef8',0),('d26e729e-9d1e-42cb-b4f0-e81f3d252ff3','fab142b7-0c39-4dde-856f-74aacca4c1c3',1),('d2e379d6-839f-43b6-8b61-b96f0530f2f8','0dc19f01-55be-433c-9c00-7a869c05be54',0),('d2e379d6-839f-43b6-8b61-b96f0530f2f8','311ae408-59ec-4073-8968-2b2e89581704',1),('d2e379d6-839f-43b6-8b61-b96f0530f2f8','4015d60d-3a56-4cbd-a3c6-1324633f0dc8',1),('d2e379d6-839f-43b6-8b61-b96f0530f2f8','85e41bf7-c0a1-423c-8343-f7e469f1dc0d',0),('d2e379d6-839f-43b6-8b61-b96f0530f2f8','a3974574-b731-4589-bcd7-ef2917ad1e81',1),('d2e379d6-839f-43b6-8b61-b96f0530f2f8','d62952fc-d729-489e-badb-fbb40f43b173',1),('d2e379d6-839f-43b6-8b61-b96f0530f2f8','e47b778a-0ddc-4808-9fc1-50e0f7ba5ab6',0),('d2e379d6-839f-43b6-8b61-b96f0530f2f8','e9a6dec0-7e3e-4110-be2e-01cd0ba96871',0),('d2e379d6-839f-43b6-8b61-b96f0530f2f8','efde2333-07f6-4958-92cb-0ab294ab3608',1),('da2ee40e-b2a6-4fb7-8955-56e2798a2d09','3c6a8f99-32ea-49da-814b-41ad1857363d',0),('da2ee40e-b2a6-4fb7-8955-56e2798a2d09','4da027e2-70d1-4d8d-97bc-c04a3bc539f2',1),('da2ee40e-b2a6-4fb7-8955-56e2798a2d09','6b238264-b8e6-4459-ab6a-6b5bc6859109',0),('da2ee40e-b2a6-4fb7-8955-56e2798a2d09','9f030e0c-8646-4059-b6d4-6afe7f7eec1d',1),('da2ee40e-b2a6-4fb7-8955-56e2798a2d09','b30c9eee-9b69-4526-ab2a-550681b831fb',1),('da2ee40e-b2a6-4fb7-8955-56e2798a2d09','b8993406-532f-45ae-97b6-c551c371faf9',0),('da2ee40e-b2a6-4fb7-8955-56e2798a2d09','be66596b-24f0-467a-8b96-9ae473ca50e8',1),('da2ee40e-b2a6-4fb7-8955-56e2798a2d09','d9dd3a6c-796e-4995-b977-4827df5c4ef8',0),('da2ee40e-b2a6-4fb7-8955-56e2798a2d09','fab142b7-0c39-4dde-856f-74aacca4c1c3',1);
/*!40000 ALTER TABLE `CLIENT_SCOPE_CLIENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE_ROLE_MAPPING` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`ROLE_ID`),
  KEY `IDX_CLSCOPE_ROLE` (`SCOPE_ID`),
  KEY `IDX_ROLE_CLSCOPE` (`ROLE_ID`),
  CONSTRAINT `FK_CL_SCOPE_RM_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_ROLE_MAPPING`
--

LOCK TABLES `CLIENT_SCOPE_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_ROLE_MAPPING` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_ROLE_MAPPING` VALUES ('b8993406-532f-45ae-97b6-c551c371faf9','bf483347-2540-473b-8886-369efdf44587'),('e47b778a-0ddc-4808-9fc1-50e0f7ba5ab6','f01916b0-234d-4797-a1f6-a9827b1c1966');
/*!40000 ALTER TABLE `CLIENT_SCOPE_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION`
--

DROP TABLE IF EXISTS `CLIENT_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(36) DEFAULT NULL,
  `REDIRECT_URI` varchar(255) DEFAULT NULL,
  `STATE` varchar(255) DEFAULT NULL,
  `TIMESTAMP` int DEFAULT NULL,
  `SESSION_ID` varchar(36) DEFAULT NULL,
  `AUTH_METHOD` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `AUTH_USER_ID` varchar(36) DEFAULT NULL,
  `CURRENT_ACTION` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_CLIENT_SESSION_SESSION` (`SESSION_ID`),
  CONSTRAINT `FK_B4AO2VCVAT6UKAU74WBWTFQO1` FOREIGN KEY (`SESSION_ID`) REFERENCES `USER_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION`
--

LOCK TABLES `CLIENT_SESSION` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_AUTH_STATUS`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_AUTH_STATUS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_AUTH_STATUS` (
  `AUTHENTICATOR` varchar(36) NOT NULL,
  `STATUS` int DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`AUTHENTICATOR`),
  CONSTRAINT `AUTH_STATUS_CONSTRAINT` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_AUTH_STATUS`
--

LOCK TABLES `CLIENT_SESSION_AUTH_STATUS` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_AUTH_STATUS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_AUTH_STATUS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_NOTE`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_NOTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`NAME`),
  CONSTRAINT `FK5EDFB00FF51C2736` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_NOTE`
--

LOCK TABLES `CLIENT_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_PROT_MAPPER`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_PROT_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_PROT_MAPPER` (
  `PROTOCOL_MAPPER_ID` varchar(36) NOT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`PROTOCOL_MAPPER_ID`),
  CONSTRAINT `FK_33A8SGQW18I532811V7O2DK89` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_PROT_MAPPER`
--

LOCK TABLES `CLIENT_SESSION_PROT_MAPPER` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_PROT_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_PROT_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_ROLE`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_ROLE` (
  `ROLE_ID` varchar(255) NOT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`ROLE_ID`),
  CONSTRAINT `FK_11B7SGQW18I532811V7O2DV76` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_ROLE`
--

LOCK TABLES `CLIENT_SESSION_ROLE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_ROLE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_USER_SESSION_NOTE`
--

DROP TABLE IF EXISTS `CLIENT_USER_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_USER_SESSION_NOTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` text,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`NAME`),
  CONSTRAINT `FK_CL_USR_SES_NOTE` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_USER_SESSION_NOTE`
--

LOCK TABLES `CLIENT_USER_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `CLIENT_USER_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_USER_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPONENT`
--

DROP TABLE IF EXISTS `COMPONENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMPONENT` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `PARENT_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_TYPE` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `SUB_TYPE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_COMPONENT_REALM` (`REALM_ID`),
  KEY `IDX_COMPONENT_PROVIDER_TYPE` (`PROVIDER_TYPE`),
  CONSTRAINT `FK_COMPONENT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPONENT`
--

LOCK TABLES `COMPONENT` WRITE;
/*!40000 ALTER TABLE `COMPONENT` DISABLE KEYS */;
INSERT INTO `COMPONENT` VALUES ('0b6ba577-f5a4-4ba2-9cd1-a6cbad50c5e6','fallback-HS256','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','hmac-generated','org.keycloak.keys.KeyProvider','c50626a4-a4f7-42b1-ba55-fdfd2fae3469',NULL),('0bcc9034-6511-4914-9d07-2e7cfbf263d4','hmac-generated-hs512','65fa274b-8112-4346-8bcc-e604adb24617','hmac-generated','org.keycloak.keys.KeyProvider','65fa274b-8112-4346-8bcc-e604adb24617',NULL),('136a3ac8-5256-4a86-8f29-0bfe1f464c80','Full Scope Disabled','65fa274b-8112-4346-8bcc-e604adb24617','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','65fa274b-8112-4346-8bcc-e604adb24617','anonymous'),('1e7bc6d3-aac6-4c4f-ad5f-ea95593a7356','Consent Required','65fa274b-8112-4346-8bcc-e604adb24617','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','65fa274b-8112-4346-8bcc-e604adb24617','anonymous'),('21c245db-3daa-4e5f-915f-22677d88db1c','rsa-enc-generated','65fa274b-8112-4346-8bcc-e604adb24617','rsa-enc-generated','org.keycloak.keys.KeyProvider','65fa274b-8112-4346-8bcc-e604adb24617',NULL),('2f6278c3-132f-41d4-98fb-334c8452ade0','Allowed Client Scopes','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','authenticated'),('414913ea-455b-49bd-9383-070255173db3','Trusted Hosts','65fa274b-8112-4346-8bcc-e604adb24617','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','65fa274b-8112-4346-8bcc-e604adb24617','anonymous'),('4a5d2cb1-a0e5-47bb-aaca-96373d80b963','aes-generated','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','aes-generated','org.keycloak.keys.KeyProvider','c50626a4-a4f7-42b1-ba55-fdfd2fae3469',NULL),('4a96bb5f-c3dd-474f-a303-0389743d62d3','Max Clients Limit','65fa274b-8112-4346-8bcc-e604adb24617','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','65fa274b-8112-4346-8bcc-e604adb24617','anonymous'),('4bac21e3-358e-497b-baad-0a191886d81e','Trusted Hosts','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','anonymous'),('5adedff5-fe90-4e25-9e02-97d663346223','Allowed Protocol Mapper Types','65fa274b-8112-4346-8bcc-e604adb24617','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','65fa274b-8112-4346-8bcc-e604adb24617','anonymous'),('5cca3199-26b2-4ac0-ac28-95419eddf4df','Consent Required','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','anonymous'),('6b8c8526-70b7-4b3f-975e-4a74acc41545','Allowed Protocol Mapper Types','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','authenticated'),('6cb09d60-4dda-4947-b623-ddc7ea39d431','aes-generated','65fa274b-8112-4346-8bcc-e604adb24617','aes-generated','org.keycloak.keys.KeyProvider','65fa274b-8112-4346-8bcc-e604adb24617',NULL),('72476ce7-79d2-4050-8a02-c2b30b155194','Full Scope Disabled','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','anonymous'),('7762dfca-0bfa-4ec6-bd54-dd14fd5c2194',NULL,'65fa274b-8112-4346-8bcc-e604adb24617','declarative-user-profile','org.keycloak.userprofile.UserProfileProvider','65fa274b-8112-4346-8bcc-e604adb24617',NULL),('7d927e7f-1099-49ff-91bc-6b666283231a','Allowed Protocol Mapper Types','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','anonymous'),('9ad90ab7-1d8e-49e7-83de-9e1b853602de','rsa-generated','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','rsa-generated','org.keycloak.keys.KeyProvider','c50626a4-a4f7-42b1-ba55-fdfd2fae3469',NULL),('a528c5a6-1104-4f77-a187-d63d383f10c0','hmac-generated-hs512','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','hmac-generated','org.keycloak.keys.KeyProvider','c50626a4-a4f7-42b1-ba55-fdfd2fae3469',NULL),('ada46d78-b2e3-4701-9c8a-96095e2c384a','Allowed Client Scopes','65fa274b-8112-4346-8bcc-e604adb24617','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','65fa274b-8112-4346-8bcc-e604adb24617','authenticated'),('ada8ea8c-51bf-4569-88a6-a7a808fd63f7','Allowed Client Scopes','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','anonymous'),('ae0022d5-c6ba-43fa-a75c-bc7dfa5c3641','Allowed Protocol Mapper Types','65fa274b-8112-4346-8bcc-e604adb24617','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','65fa274b-8112-4346-8bcc-e604adb24617','authenticated'),('b3c275af-bc13-41ec-95a5-e0a5bb51f648','Max Clients Limit','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','anonymous'),('c92592d5-bd7f-4224-9033-3d05d4ce81a0','rsa-enc-generated','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','rsa-enc-generated','org.keycloak.keys.KeyProvider','c50626a4-a4f7-42b1-ba55-fdfd2fae3469',NULL),('d0dc0ec4-a06c-4b09-89d3-1e4d811053e9','rsa-generated','65fa274b-8112-4346-8bcc-e604adb24617','rsa-generated','org.keycloak.keys.KeyProvider','65fa274b-8112-4346-8bcc-e604adb24617',NULL),('e7cad762-bde0-4d4a-9cf5-e4a4ec613702','Allowed Client Scopes','65fa274b-8112-4346-8bcc-e604adb24617','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','65fa274b-8112-4346-8bcc-e604adb24617','anonymous');
/*!40000 ALTER TABLE `COMPONENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPONENT_CONFIG`
--

DROP TABLE IF EXISTS `COMPONENT_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMPONENT_CONFIG` (
  `ID` varchar(36) NOT NULL,
  `COMPONENT_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  PRIMARY KEY (`ID`),
  KEY `IDX_COMPO_CONFIG_COMPO` (`COMPONENT_ID`),
  CONSTRAINT `FK_COMPONENT_CONFIG` FOREIGN KEY (`COMPONENT_ID`) REFERENCES `COMPONENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPONENT_CONFIG`
--

LOCK TABLES `COMPONENT_CONFIG` WRITE;
/*!40000 ALTER TABLE `COMPONENT_CONFIG` DISABLE KEYS */;
INSERT INTO `COMPONENT_CONFIG` VALUES ('00649c0b-94dd-4724-aa31-c67e79a67761','a528c5a6-1104-4f77-a187-d63d383f10c0','priority','100'),('065deb63-680f-41b7-b1bc-764804e809cc','c92592d5-bd7f-4224-9033-3d05d4ce81a0','certificate','MIICtTCCAZ0CBgGOl+m1MjANBgkqhkiG9w0BAQsFADAeMRwwGgYDVQQDDBNvdS1ncmFkdWF0aW9uLXJlYWxtMB4XDTI0MDQwMTA0MjU1OVoXDTM0MDQwMTA0MjczOVowHjEcMBoGA1UEAwwTb3UtZ3JhZHVhdGlvbi1yZWFsbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBANnn2dLm25Z4L5OV3Z9mYa+cZfNM4CHq/uselEwcDjdYPDP3SFrSr9EdECNLwdyIwviHTBjuiXPt9bWiTkxMUv6CBp/0uc3ADlctl4/z9Qx151T9yoR0+rlUh+vCNAMLkCc0hblf/aahAbxywxS0vfJu79y3zXxqlKjT0ZnGmrcLhlJfPRAKu/UTOqU6A2kSdruGNExMUH/cPfrwWaa35TeuVO76/0vsPCzMWUWMU+u9UJl14M9c0xloIuo2gdRaW6yo7KY9jrBUmGtcBWiq3DzPBKyz3BniJkH0/O4HusarrfpS2bBENdzfFRvU69kUkcn2yt5sdfIUIUyTdjCZ/Q8CAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAy8fgs6by/t3Ryxy/5sE1WqPUAXg7CMu7xTCgKjQSI5bVMQH0EfBl5QQo5GRdJzdPxD/qkLYE7aYapO0eQb29Yk0VJVlCFFIOXJcrDoyenJx49dhnd5Mj3z+Q5etHSc/2pl9mIu5AiBP7dSzOxeRYwYclDhYwXqnT86RujLRr6AxVbx/j72GZW7nswL+xSjgRQHlTtQem6onB/Q5lO4kTpvhz0vU+Rc+D6qAm9zXdHNWqu6eZhIXtF0NJYISyD91TXXzfcM5cpfPg6EKT6MZeUFelc47iItim4n23TwKx4twhedWvRTLTV+sAetFuVoY2YrpYMIIUuE0d8BwmaWkq3g=='),('154d3387-53ee-4792-aed4-e887a05748ee','7d927e7f-1099-49ff-91bc-6b666283231a','allowed-protocol-mapper-types','saml-user-property-mapper'),('170fe7ff-8f61-4bf6-89fb-1e9f7af17836','b3c275af-bc13-41ec-95a5-e0a5bb51f648','max-clients','200'),('2654f555-a382-4491-9184-0628d10b92d0','6cb09d60-4dda-4947-b623-ddc7ea39d431','secret','cfNJCvZj_XMIhERkJuHj2A'),('26a5b71f-13f8-42c5-bee5-047bf2fc0389','6b8c8526-70b7-4b3f-975e-4a74acc41545','allowed-protocol-mapper-types','oidc-full-name-mapper'),('27087904-70a1-41c4-a681-700567965b8b','4a5d2cb1-a0e5-47bb-aaca-96373d80b963','priority','100'),('2937984b-9e7d-4802-ac02-041cf8765418','4a5d2cb1-a0e5-47bb-aaca-96373d80b963','kid','24e33449-04ee-485c-adb7-a31d23ab42d3'),('296b6f30-2323-467e-a18e-e8ddaf838a22','5adedff5-fe90-4e25-9e02-97d663346223','allowed-protocol-mapper-types','oidc-full-name-mapper'),('2c42a54c-dc70-4231-9a65-c91c632335b2','c92592d5-bd7f-4224-9033-3d05d4ce81a0','algorithm','RSA-OAEP'),('2f254c2b-217e-41a1-bb38-19bbb501d74c','9ad90ab7-1d8e-49e7-83de-9e1b853602de','privateKey','MIIEpQIBAAKCAQEAtlKAO9e01RSckMZETtf7FWfjvCYXVQ11JL1qZiu5ZE+cJnb/T7DNKQJoLNujpQmqVTTdznkr+9hFXUKAIHrHMDYcrSRppChgPacWB8z+GzAkP7aVRVJhTuOgpgaB4cHAWGDdrqFjDOwfspIB0qAA3SFV7vM9c2AmTvMyfIRB4MEdKCFh7SBZnzSYsMWJvmqNsFMx2Mo4zQ4obkyPa5wro4N0iFu4Upd4JYwHftKjD0T3R3XB/OEsFyzrAqToRuQ+TujFSYByVYCDDTtGy3/SnoSqnO8GG46UOB94o53PqApG+X9l1cxkY7pKh8cXUlCyir5/YLTE20EEoTrQwmestwIDAQABAoIBAC69yN1OqDAGeDsPcVyrN1YeC77lHw8xg4o3O0tVQ1KprDUaRcsG3xn34YA6kOITL8VnZ8PywalvoRzPGyz4fQ9pmAF1d9XbegzkRJwcXDrZJTnmU69xdrv0VG+r9GlNtEOUFdEa09twv5GWp/v5BC+sx6yaVHM7P6b250cP2xnEyG6yXonyMtcf86CIE5FBvk44fBS8ota9AazkTyV5MOWzH8oNa8/qLNtenxgiX3Z0v4T2XUL0uBdpztsos5P2NKADo3/ISy4s+RUGkgCxAKNX2kF66r9pifARm9GJRkldngfDZUIC5V9eui3mNwO99BJtwICs3yNlKXTMMwpHGD0CgYEA+xzuwDNv5MSXdjEF36lDorADajKIdc2fvM9VqTVN7QiB0V9uGbS/4+czcxzmLTQVGMCI+CUd0V8CbQ/ktjEcq5WN/oLkDBzDwIoyduQmkfhQF5OvKZGQlM0v7u0pXbnWfzrTMTQWKcXxc87Zs6yH1DC72dOXUKQnCUwIwp7QqAUCgYEAud7YvySGkPneFcq118HdAO1r2VX+e5XKL1iSKytWcaKOTZR/EFx97+4ObjvDhoFDobTXtm8YOtmJNQC8ucX5DZjrT9q0J2idz2EZknUkQRAfqRIs8QzfEca+cmfqawyITsBw9wAhrC3mUD+m8YpUGswqqM4thiEr12uhFnlPSosCgYEA1bCHU7Px8kGBiqipEO3fiqAyJ7sc+PKkjm35vWaJC78DigKllOaFrRFgbQMYtTrvAQNHC7O6LiOl0t2Fia09cp5wGTeVjOEli8GOtDHuyKUAsy+QDdW7rYT212GmpAWzDM4oTmS+v4mcsSpDhGy7ocxe7zzqNUublIPJqKSxd2kCgYEAg75Eexb0moXAuEl6Ineyohmmu+GMAyTkrjJlSFvrZZgGrU530az9RrbBW7jYmdm9ijyYOSL9VZki+4KOQk7kfJLLF0q5LsWkNX1plrmY/NTk2/2aBTFOW1c3Xffx2/aCFu+oIirhsxzFhlPXjJSzkFruUb/x3IRegs4y268YWIkCgYEA33dgXmQCYxcvR6ytBrR6CEYLwaZ34wEts7Y8X8Yxejd0bZSXZSLqdcSHnf+/BiLcAHKwSP8N5rRhdtvRISni11KOUN4pN7/7JJdhMEN1gV7JKAhQDg6dHQny38gGPH9v8hlPcWNdV3YAiNaOfGDNoD1HcQMDHymYTjS5+en7J/4='),('363c0a61-1dab-4708-95a9-2968cc6239bf','0bcc9034-6511-4914-9d07-2e7cfbf263d4','priority','100'),('3a9cd1e3-7df3-4b2c-9a2d-f0ab33cfd3bc','21c245db-3daa-4e5f-915f-22677d88db1c','priority','100'),('3db4d83f-b21e-4222-b572-663515886968','2f6278c3-132f-41d4-98fb-334c8452ade0','allow-default-scopes','true'),('3ebe6cbd-7660-4efb-814e-c2c7fc582fff','4a5d2cb1-a0e5-47bb-aaca-96373d80b963','secret','Xh8B2uEK__HsXcWnfimS9Q'),('3ed9f7ce-0b14-448f-8125-ea73d5b774ce','6b8c8526-70b7-4b3f-975e-4a74acc41545','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('3fc7cf3d-0287-4233-abb2-998d00eb5504','0b6ba577-f5a4-4ba2-9cd1-a6cbad50c5e6','kid','a85c8b22-d043-49c0-a988-a0a20e662859'),('403a9ebe-981a-481a-8a4b-ab71e9933f34','5adedff5-fe90-4e25-9e02-97d663346223','allowed-protocol-mapper-types','saml-role-list-mapper'),('4123fb7d-0eef-43f1-93b1-ec56ba262f76','ae0022d5-c6ba-43fa-a75c-bc7dfa5c3641','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('48061616-7989-43ef-bb2f-1732fbe79ef1','a528c5a6-1104-4f77-a187-d63d383f10c0','secret','P9WDBYo_FHhZrJCdl-EjlTAsC3EwM4der08gDzRZPX3rZiy1vXCikUfnkfHXY73YT-IREI60_2mgQUpWLHNLfrZWeEV5KH4-ocVTyo0P96BAtSW4CC06VLyV4gsAS23ga82WSnl8aKpZd4E0ACwE6IrMFLWDeiiBv0r1MElkLNA'),('4a656d80-a6e1-412e-84aa-30a6b5cdee1c','5adedff5-fe90-4e25-9e02-97d663346223','allowed-protocol-mapper-types','saml-user-property-mapper'),('4df66beb-3682-4e9f-af4d-77eaa4d795cc','0b6ba577-f5a4-4ba2-9cd1-a6cbad50c5e6','algorithm','HS256'),('5262f94f-5fcb-439b-9f73-7a31b3501320','6b8c8526-70b7-4b3f-975e-4a74acc41545','allowed-protocol-mapper-types','saml-role-list-mapper'),('5263c51a-95d2-413f-be91-e6e26084b717','6cb09d60-4dda-4947-b623-ddc7ea39d431','priority','100'),('571e086d-9dc0-4999-bbe8-3985b62a3329','d0dc0ec4-a06c-4b09-89d3-1e4d811053e9','priority','100'),('5ed52081-1c53-4367-9466-c04b54a9e4b1','4bac21e3-358e-497b-baad-0a191886d81e','host-sending-registration-request-must-match','true'),('5f06ba75-9428-45e4-9f40-b9b1bee17fc9','414913ea-455b-49bd-9383-070255173db3','host-sending-registration-request-must-match','true'),('620682aa-2fe1-4cea-9774-7c1bfcd60cec','ae0022d5-c6ba-43fa-a75c-bc7dfa5c3641','allowed-protocol-mapper-types','oidc-full-name-mapper'),('631bd361-b568-4c8f-9b56-e922447da634','7d927e7f-1099-49ff-91bc-6b666283231a','allowed-protocol-mapper-types','oidc-full-name-mapper'),('63a8e587-1781-406b-a5bb-9149e0d21fc7','ada8ea8c-51bf-4569-88a6-a7a808fd63f7','allow-default-scopes','true'),('65732f1e-1f27-4f60-bf0f-4715d240844d','21c245db-3daa-4e5f-915f-22677d88db1c','privateKey','MIIEogIBAAKCAQEApuqI3lSSF4DdTikXmYzO9GUEKh359wb4uUutTt5nJLpt3rzoxsyoNvMC0ZMMz62HTd3z2vFDoy4Kq7faaE/+chauVGRI3zxBgZI5nJvmRlk1jX5mhCMgzwOp+6GnEYg1dehdVm0cEuRGkAu7JMiuOwvAsrA7zsAEaNcuP/WjB+mUJ9dM2zOallNtnKjMa+AMohQAbiPRD75el+DRwwae6/NOWborsOHBPBPSn/IpaVyPTPRVRVwQ8DMJMoiawp2QtPD7HlhRLlXlbn36AlDMM6QhSpieQqQkPvPwTCJV4DXde6hZ5yNe9v73nvA1cCqYibH4q6lC9CPeemG+JEgGkQIDAQABAoIBACcaQJAdLdBVvwKFe+Lb6su0MoKPXTSyrGf0Q5h7X5xqFD0e8kVIQowE5/8ivNiWJWFngq4i4R6ENbm+q2rOeqRNje91QuERI6NwFxEKMKsAURxhpTCFbjUw/YxWdWYVC7kgg2Uw0GfYlHNAXEokvTRV74Gs6YXo09+fsVUIfXXnsHWVlK60HNetiWwNlqO1jVXOVkZD8DU6gkPrhi723bUdYBqFWrHIfGZQQ145unOrQif/Ou2Z6n6N6PfyfMq1Wajm9CJj6UedfbB3gixVwJmusBIkOzCOs2ziyhLBwySuAuAucaeQmk8WEBk+LuVgB0jQqnOMyWgIMhqAglqsdAUCgYEA2UF/nbRH2C43HCz3UQwCA3ryg2jSvKkHvedOSi+uhh8KXh4aXrYWuJs2i+k53A48mfN1qA5zRyxKsfvngBhxVUldUAsDrEPOubAgVY2G0yzzAhoiOnq0rIAqq3YQG9tHY8rv9vQBmCQmch++QFauwVg432lT7/1rPeTFRsS31f8CgYEAxK7ZkoA7UeRpM5RcHWSzHY5iIhYBDU/XTQ+nDcuV6fIxM3ccQPrwrl+5P5o0kG4OEd//64uzWHSucFxOOIIm9PedHzkDg0I4x7LfuW9e/eNFXDQK2hajyJbH88pJBRq9KQifJPip24FAnacbz8o3LoCX3/q640QQJfNCpPlvw28CgYAvR1e0RCVWYEhR818m3gwaIclg25DwyYALzah18IZ0XZDuBnMKpWmwZuap7+lNgDOj9R1noy1nEbZ3oTAx6h/PxZVu89aqyF7WfgOrWo86qY+Ap5tHSqjC2WlvwtOinEee6ezquxMVvtg3Ab1vVu3U2ZQW2l8P3QBXic98pRa0lQKBgD4Rl+Pdx9qeJHz8kt1LzCLFrj5nh0l2KtHM4ME/wD2mCtTc//OZvZ6p4sIpnfD+aj5F3HOvEJgXqn0XBDBdEoI4KkOSMIOZwGV1E5lnhijFMjxYyBvvDRzeSJes/MI5n/x1FhQKzT/SWFvoQqSegi+QsV0juRrDff0b+aoqdZTNAoGAenJAY5rp5SpadyvxSowtUOLmFUJyu+XRO3QcNs+E3mDf/akyrC4+mVp0JmhpICTlfwAknrdXsahHHe6ENRIau+1+1C3H5/svkhhPJ+0wuz5MMZbIZg9i0d+NHIkn95BXkGOoHhtEbLPZ47Jz8NtCJsvImmqdBJwc+bGOQk1+y5Y='),('67d8a95b-f177-482e-ab03-4b26cadd0d2c','0b6ba577-f5a4-4ba2-9cd1-a6cbad50c5e6','secret','twvET08wqGT30AyBciEVOq1Sv5RzuGjEuLTXGrH1d2T3HtvyQowK399vg6nNcl567mSqtUiDsYzF4QJzang6WN59U8_pHg77uVIv8uy3mHX59SGAhCSRVBTlPrSeDwmouPTIkeq9YfYOoRrwpMGNnykjyWtHea2vjrdU0KLCpvY'),('6c103264-9ce9-40b7-b09d-f371d59f7604','5adedff5-fe90-4e25-9e02-97d663346223','allowed-protocol-mapper-types','oidc-address-mapper'),('6cb08615-8c25-4e7a-be48-c76d4ceb3416','414913ea-455b-49bd-9383-070255173db3','client-uris-must-match','true'),('7501865f-286a-4e3f-8410-e1d6d252f912','5adedff5-fe90-4e25-9e02-97d663346223','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('781c29bd-a617-4194-8791-e945400b65d6','a528c5a6-1104-4f77-a187-d63d383f10c0','algorithm','HS512'),('7af9b588-152e-4e6a-8e0b-ccc3a6ffb94e','6cb09d60-4dda-4947-b623-ddc7ea39d431','kid','39521a58-9f16-4b38-a9ce-865b403911f7'),('7c0f8ce9-5886-4059-8cd5-c735202774a4','7d927e7f-1099-49ff-91bc-6b666283231a','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('825d772a-7d20-442d-96fc-755abe1461b6','7d927e7f-1099-49ff-91bc-6b666283231a','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('843d5980-0379-42b6-ad4c-872e7681afeb','6b8c8526-70b7-4b3f-975e-4a74acc41545','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('8bd2bb97-3d5b-4b30-8b72-1eed6079212b','9ad90ab7-1d8e-49e7-83de-9e1b853602de','certificate','MIICtTCCAZ0CBgGOl+m03TANBgkqhkiG9w0BAQsFADAeMRwwGgYDVQQDDBNvdS1ncmFkdWF0aW9uLXJlYWxtMB4XDTI0MDQwMTA0MjU1OVoXDTM0MDQwMTA0MjczOVowHjEcMBoGA1UEAwwTb3UtZ3JhZHVhdGlvbi1yZWFsbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBALZSgDvXtNUUnJDGRE7X+xVn47wmF1UNdSS9amYruWRPnCZ2/0+wzSkCaCzbo6UJqlU03c55K/vYRV1CgCB6xzA2HK0kaaQoYD2nFgfM/hswJD+2lUVSYU7joKYGgeHBwFhg3a6hYwzsH7KSAdKgAN0hVe7zPXNgJk7zMnyEQeDBHSghYe0gWZ80mLDFib5qjbBTMdjKOM0OKG5Mj2ucK6ODdIhbuFKXeCWMB37Sow9E90d1wfzhLBcs6wKk6EbkPk7oxUmAclWAgw07Rst/0p6EqpzvBhuOlDgfeKOdz6gKRvl/ZdXMZGO6SofHF1JQsoq+f2C0xNtBBKE60MJnrLcCAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAJLU22qeQuhV0699+uZ22rw+Y+QQ6605387HT3Pz+XIsJwQqeSe29r4RNHpyKNXYpGKcAvWcTlt6xXPpiCX6GaswWaBsEw3S1KMEBfVASkKRgWqwunKSn7q/yuUqyAToGc/uE+wrMAbnlrssPaoaWA0PnU8VACpVk0aSGNwdenfxITLNDG0U6s7omoDN7aFhuOh+SujfFMd5zazYZktu/oGFcEFqEwcGChq6demFTpW5o+EoBii/g+4GLv1HC4VuFAGeHhUje/wsDu89WGCzQv+ADPNgYssDf8PrZE4fIqAzsEd4L9yUJ8HHKTL29bE96mOncEgCB0Io9Obn3xJ48ZQ=='),('8d59787b-5bbe-4319-9b79-0d5d3ac72cc1','d0dc0ec4-a06c-4b09-89d3-1e4d811053e9','certificate','MIICmzCCAYMCBgGOl+jdZjANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjQwNDAxMDQyNTA0WhcNMzQwNDAxMDQyNjQ0WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQC/FH+q3bpzuROsc93FGtAl6jQ5+uyV9Ma3MWyTfSAGv+c5lpd1TzU0Ufgrxhuj0wUThU60I+pvS8d+TDs0KF3XbrhYxCtY9wzSj8gsr9y62TuQLpPdYr5leGIWYqecxUebsPtwdKuGIiPCcgRDF4lMfQdZKXuqYY26YWpDPjpF/l7jltj9hThWyunudh3694M5lZXjpesgbJXz98jlS8mjovpxXdba3fHIQVNGFr1E/20Uh5IjtW4M5v6hZgjuLM7wbJi7wsRJ1Z6zuTtwDS8mI5doaV7AB1WFxTSZF6peEte1dJYkp90PjiN8MR4IiRjHzrL7N3HKx4lkSnJyxCLxAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAGJrErHo6LfXnR/CBHUnkSYLBOfP9FOaLss4NU1Lv/CfYFbYAuYR/soMhbkuAkywS/FGVhMkbKGNDTqKedhVlIAX76qI3vxXB7K7iUdZYRpW+ZxVjvyBuFksfPiPAi+7/KUNF+0IyloJLnPVFfBQm5SwOxoB7T9WwaLTfH2onv/jbxFmVYZCV6a0aPVbupGiPgdob6MRYJx8/2Fmyn9fhZzeF3RTLeuJTpXuAiISAZtwEXDg3kHwt8Qi0FHVN7hi17N8Ty7xdhjKr9SMf5vkIANXhxTCkAKJGqtWcMPgv08ruSVhoQUjyBzhwTzEWzW9d3kkj8zP65+CYe1IyDR0QIQ='),('906b65be-c710-4cba-bb60-771e1cde8714','c92592d5-bd7f-4224-9033-3d05d4ce81a0','priority','100'),('91e89472-e172-4803-8d94-e23ff0ebcff8','7d927e7f-1099-49ff-91bc-6b666283231a','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('95583f01-3d5f-41b2-850b-56bb56d79ee0','5adedff5-fe90-4e25-9e02-97d663346223','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('96b0a136-dd3c-4bbb-8ce6-ce4287b4359f','4bac21e3-358e-497b-baad-0a191886d81e','client-uris-must-match','true'),('a7126f50-c189-4aa5-a17e-55bd2c45b970','ae0022d5-c6ba-43fa-a75c-bc7dfa5c3641','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('a767d233-db85-4c5d-b328-4c9887858ce0','ae0022d5-c6ba-43fa-a75c-bc7dfa5c3641','allowed-protocol-mapper-types','saml-user-property-mapper'),('a7d3b030-4863-48a1-959b-d683c9291831','9ad90ab7-1d8e-49e7-83de-9e1b853602de','keyUse','SIG'),('b3417763-eeb2-440e-b939-cfa357ceb16d','ae0022d5-c6ba-43fa-a75c-bc7dfa5c3641','allowed-protocol-mapper-types','saml-role-list-mapper'),('b4df9407-6a54-48a4-8788-08302f1e4854','ae0022d5-c6ba-43fa-a75c-bc7dfa5c3641','allowed-protocol-mapper-types','oidc-address-mapper'),('b71ba4ed-c0ee-4345-90ea-80125609e2a6','6b8c8526-70b7-4b3f-975e-4a74acc41545','allowed-protocol-mapper-types','saml-user-property-mapper'),('b9ace17a-55d9-4a59-8f1b-21bb23a2c596','7d927e7f-1099-49ff-91bc-6b666283231a','allowed-protocol-mapper-types','oidc-address-mapper'),('b9bb4e37-f4a6-409d-a2c0-7ff3d9d0cbfa','a528c5a6-1104-4f77-a187-d63d383f10c0','kid','0b53faf6-d4fc-49be-a10d-1a40c1e61c9c'),('bd8e3f94-53e0-4715-b09e-904101bf5be5','d0dc0ec4-a06c-4b09-89d3-1e4d811053e9','keyUse','SIG'),('bfe67ccb-453b-431e-814c-c5155fb194a0','6b8c8526-70b7-4b3f-975e-4a74acc41545','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('c18cd9b8-3196-45c0-bc74-b85070d870df','7d927e7f-1099-49ff-91bc-6b666283231a','allowed-protocol-mapper-types','saml-role-list-mapper'),('c65b1caf-b558-4cc9-87f3-c7bddcb2fd1d','21c245db-3daa-4e5f-915f-22677d88db1c','keyUse','ENC'),('c8469878-6ad8-42b7-9e32-b75ed934eb34','0bcc9034-6511-4914-9d07-2e7cfbf263d4','algorithm','HS512'),('cb639942-259b-4295-b808-1ec3dd2d3d2c','e7cad762-bde0-4d4a-9cf5-e4a4ec613702','allow-default-scopes','true'),('ce1eb5dc-1a25-4bb0-be7b-da6876787643','d0dc0ec4-a06c-4b09-89d3-1e4d811053e9','privateKey','MIIEpAIBAAKCAQEAvxR/qt26c7kTrHPdxRrQJeo0OfrslfTGtzFsk30gBr/nOZaXdU81NFH4K8Ybo9MFE4VOtCPqb0vHfkw7NChd1264WMQrWPcM0o/ILK/cutk7kC6T3WK+ZXhiFmKnnMVHm7D7cHSrhiIjwnIEQxeJTH0HWSl7qmGNumFqQz46Rf5e45bY/YU4Vsrp7nYd+veDOZWV46XrIGyV8/fI5UvJo6L6cV3W2t3xyEFTRha9RP9tFIeSI7VuDOb+oWYI7izO8GyYu8LESdWes7k7cA0vJiOXaGlewAdVhcU0mReqXhLXtXSWJKfdD44jfDEeCIkYx86y+zdxyseJZEpycsQi8QIDAQABAoIBAA10bU/0CIDFD75VM1DBhFYjIXXSti2R/JsiMw3IogRvp2G9+aDESNAMFJBKhSA6R/F5sdLL86JOIPhC+GlCDWeRz4/Kkm3TiZbbEoKZCI8spD3RFc7hONxux2Nho4FNv+7V3cKrqHdLuJ5kxmmOAvg8lpOf8OoMr/znhqLBAzvx39Hq2cUwHTOiMIFIm1c2aSS6AfgXV7V6IGUoWCZJMQ92iUyMjGVbkmaha2WTh/o8z/5b1haYmYqI5cgFsNjzZrFJr4aujWvZHj09sttaIx3QJaOlMp6NCyFZj435xnRRL5RFlYgK4XSS0JSkI0TIAarLRSvhujeA3LKSlmrkL7UCgYEA+NMf5uXY7XO0LwCbaaoIr8OryKPEAUT5c5DuTRqhOwQ+GmhiTTJlXujFZS5sM5gYmA3EJKh96L+TqNMBL0POte5h/gDX4+gSVOJDOEG29+Jgc0azcObuFGg4sbws5akJILsBpWLEMSqUFTnCuzCgJHEigx1+NbOkrqsne4ZS3w0CgYEAxJcXXe6vFhNfD5yz/YK4lIRz+jS6jT0w0men5q7zpyzgOLhKMICSqPfgARCcbjNiDjJx6T+LOUt4dSrij+6rnXTL+GtyOmFthS767/FGFqYIw5cW5bicAtZrlCCXXd3YavB0XbAg6kqshZZPYYfGpX4wCZSWGaRT5XmWvWz4enUCgYEA0KyuyoPko28vo2OM8taopk8hWAkPrkjcMzFOyNcWdFoggyEbn8YuAaSRN0PxdmuN5KdW4a90uKdB/InJKoxhZW5gPBcU94t/JDUFTr695bGyVbrrbjodXHvzYAuCU7CpeQucW8ky5FDjE9H3H+mtxCIlYXRwjjT0XZAoco26HlkCgYBKVEI+fr9uXlaj5YDcSi+V39ql8IfUXR13gD+oZd+0BrCkYXGTkxlgj4//dxNeS0k4yvPs19zBBfr+ef99oiT6/K0eOSnQTwQExjWUwSnZ6F8J7Ld4letO21mDgSsaD4YDMPUecziOvTsrqyBKZPbDncl15ds2yL371pQa/PeZ/QKBgQC1kwG5eb+EpAlZ797Tx/9uWbE3TGeZiUiC7AWLM3z9L6GReN80yTTi2mF9oTv9FxquiP3OS82JY6J9XW4bffThM/2TfoyfF1KA4dJF55+i3VRmE/yhSmuw/6FQlsMsiuOCmM9Ttgllax59uDgpfVwql28gT9AXJ4eDA+O2WkYlBA=='),('cf11a37e-7aa9-4f1d-966a-1c86f764254a','c92592d5-bd7f-4224-9033-3d05d4ce81a0','keyUse','ENC'),('cfe19031-4b15-403e-869f-4c0aca5b3634','ae0022d5-c6ba-43fa-a75c-bc7dfa5c3641','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('d1a0fcf0-cbde-4e94-bf59-40ae92cde4f4','0bcc9034-6511-4914-9d07-2e7cfbf263d4','kid','926a8b2b-7c08-4063-9993-3dae286be30b'),('d317acf8-5e8b-4e59-bca1-684c36e03e83','c92592d5-bd7f-4224-9033-3d05d4ce81a0','privateKey','MIIEoQIBAAKCAQEA2efZ0ubblngvk5Xdn2Zhr5xl80zgIer+6x6UTBwON1g8M/dIWtKv0R0QI0vB3IjC+IdMGO6Jc+31taJOTExS/oIGn/S5zcAOVy2Xj/P1DHXnVP3KhHT6uVSH68I0AwuQJzSFuV/9pqEBvHLDFLS98m7v3LfNfGqUqNPRmcaatwuGUl89EAq79RM6pToDaRJ2u4Y0TExQf9w9+vBZprflN65U7vr/S+w8LMxZRYxT671QmXXgz1zTGWgi6jaB1FpbrKjspj2OsFSYa1wFaKrcPM8ErLPcGeImQfT87ge6xqut+lLZsEQ13N8VG9Tr2RSRyfbK3mx18hQhTJN2MJn9DwIDAQABAoIBACnAR7cmLprFCnCfvWgGSN9J+yrD5wn4qcFJCacPlRW7nUVjswRb6/4IMIhiwpFLzvepjMYWJlYFGRglMhViZmCHb1eEn3kxvE2t2aVmW+R4Tsu1GPGKLGQIM0bT3f1bYNJyONEM+F/N57RA1OoJu39RDDphKUkWbsduVnG9YPWDMEUD8UNHaOAQnExevRccU0Bkywt7g2njE1taNIW/8xViU8NxxDgqKjweeev7G0jnZAk14uBiZjMHp/8Ba5HzXfpByqnXppj3ed0ai7Vhv6igx8NVestwemuKIhzURTNl2ITDFQssHkZRJY3WSTMWthLVMV2i6pW5DuyYyRNaxFkCgYEA7pB0e024vw5hTydEm3B2rS8+3UwMTEKFp4RL3XnlQBecSPWdKObcI7uX0Aqi6u50ivxsmyhVLZnZfLeO6utSxUf8ZUQPt07KYGAg0dH6pLOcTyn4SbFbvAq4nsxJB0AsE76AhG3BpXK5399/ZVA0bHPzKcKMQ1AtyfvkfeuH0e0CgYEA6dTfZUdp26PlrNfS7BpCUlSPW7mjbQVTOArYRUtKtSm+93Lxq7SqmcWSmdtLxassAc3YKG6squmX194Z40r9mWsPTj8BSWSjIqVjwVIeD7uV/GThkhqpUgQYBlNb8iQHMscITS5s7KL/BpHxSB9QNcb5Kq8gJbwauPnho2VOW2sCgYEAqSLBcqon0UzgsL2mZo3VlfNpHnxMO8Tt/VZOczd40Xfr1c5NHjKO4MafW2AvIWDuP5u3ZEm0GiB5kXKSYPt2M2hWCXW3rr6tvKZqnlfA3AR7TaTz40tbPnZbbjpnjDxzA4yMkVc/c41jOtW5/JpgkIOkYncL+q1dyVZNKPlT0gECgYAkyCR/5PTk5Ooq/yQhmZvXIZAPaKspag4GIcaVV9uflbqBaCZV0SyI1chSxWks5dkdS4j2CzrEA8yr2zcNRu2PZYTZ1RVZuyfiOkvvzAAIj4RvWFsXRXRe/1/cFt6+vyYWubI3mdbuflFJckmXA731R6BIM5YF+YnmkQAKWNQzkwJ/TM+jPCq4ypyUi5KLxIlg4I1LYT/H2RA5GP2tdJ/cOmeovePgWVhglE0fN7JKs0s+FavkGgLgxdoG1+cZmPJLWktkBfd0sndMmkO8GBXkMnw6exWe3iRiWAJWenhmy32PYDi2lxqDmj1cPhXP64vYAhU7hcn4rX6mmGe8Wf1lOg=='),('d7bee005-999b-4d02-8977-091186410e15','7d927e7f-1099-49ff-91bc-6b666283231a','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('d9484ba0-45d2-4b50-b3c2-95ddc45d9985','21c245db-3daa-4e5f-915f-22677d88db1c','algorithm','RSA-OAEP'),('db61dee1-5e2d-4345-945c-3b30d29e8850','0bcc9034-6511-4914-9d07-2e7cfbf263d4','secret','42Q0q4nVdgmNzY1s6OPQ-qBZ-5B-C9svFGEVSqpsYQdf4sTjJX5RcosR6VWvW_X0BpOBZk42lqUtHV77Py9D4nor9vxCJck8JEIBfWGydWcSMfE0iGJcGPOCr6iwdTbjxPEFhblvDXctzNP2JfbcVSNklfGZ4DSsbCRni9tRoZA'),('e172d2c5-9c53-4f03-a915-ee2badb036c7','6b8c8526-70b7-4b3f-975e-4a74acc41545','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('e196d934-cd22-4721-815e-df8db3901c33','4a96bb5f-c3dd-474f-a303-0389743d62d3','max-clients','200'),('e2d6d927-80c0-4b70-9ac6-ccf6a563c4b2','5adedff5-fe90-4e25-9e02-97d663346223','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('e38a00da-4aeb-42eb-8381-c9ee44a27873','7762dfca-0bfa-4ec6-bd54-dd14fd5c2194','kc.user.profile.config','{\"attributes\":[{\"name\":\"username\",\"displayName\":\"${username}\",\"validations\":{\"length\":{\"min\":3,\"max\":255},\"username-prohibited-characters\":{},\"up-username-not-idn-homograph\":{}},\"permissions\":{\"view\":[\"admin\",\"user\"],\"edit\":[\"admin\",\"user\"]},\"multivalued\":false},{\"name\":\"email\",\"displayName\":\"${email}\",\"validations\":{\"email\":{},\"length\":{\"max\":255}},\"permissions\":{\"view\":[\"admin\",\"user\"],\"edit\":[\"admin\",\"user\"]},\"multivalued\":false},{\"name\":\"firstName\",\"displayName\":\"${firstName}\",\"validations\":{\"length\":{\"max\":255},\"person-name-prohibited-characters\":{}},\"permissions\":{\"view\":[\"admin\",\"user\"],\"edit\":[\"admin\",\"user\"]},\"multivalued\":false},{\"name\":\"lastName\",\"displayName\":\"${lastName}\",\"validations\":{\"length\":{\"max\":255},\"person-name-prohibited-characters\":{}},\"permissions\":{\"view\":[\"admin\",\"user\"],\"edit\":[\"admin\",\"user\"]},\"multivalued\":false}],\"groups\":[{\"name\":\"user-metadata\",\"displayHeader\":\"User metadata\",\"displayDescription\":\"Attributes, which refer to user metadata\"}]}'),('ea42a155-c1db-4b8d-844f-1235f514f5fa','9ad90ab7-1d8e-49e7-83de-9e1b853602de','priority','100'),('f008966f-9679-46f2-8562-38dbc7dc1cbd','ada46d78-b2e3-4701-9c8a-96095e2c384a','allow-default-scopes','true'),('f04ee4c0-a610-4b48-9136-ab4146c53d8b','6b8c8526-70b7-4b3f-975e-4a74acc41545','allowed-protocol-mapper-types','oidc-address-mapper'),('f15defa0-e9b1-4e0e-8b3d-0c000b496e4e','ae0022d5-c6ba-43fa-a75c-bc7dfa5c3641','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('f4858eb8-1799-4885-95ae-31f44c599e6d','0b6ba577-f5a4-4ba2-9cd1-a6cbad50c5e6','priority','-100'),('f977eed9-8fda-43c7-a64d-eb53ac3a4af1','5adedff5-fe90-4e25-9e02-97d663346223','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('ffe7e6cc-2fab-4e04-a5b9-d991ac25991c','21c245db-3daa-4e5f-915f-22677d88db1c','certificate','MIICmzCCAYMCBgGOl+jdwTANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjQwNDAxMDQyNTA0WhcNMzQwNDAxMDQyNjQ0WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCm6ojeVJIXgN1OKReZjM70ZQQqHfn3Bvi5S61O3mckum3evOjGzKg28wLRkwzPrYdN3fPa8UOjLgqrt9poT/5yFq5UZEjfPEGBkjmcm+ZGWTWNfmaEIyDPA6n7oacRiDV16F1WbRwS5EaQC7skyK47C8CysDvOwARo1y4/9aMH6ZQn10zbM5qWU22cqMxr4AyiFABuI9EPvl6X4NHDBp7r805Zuiuw4cE8E9Kf8ilpXI9M9FVFXBDwMwkyiJrCnZC08PseWFEuVeVuffoCUMwzpCFKmJ5CpCQ+8/BMIlXgNd17qFnnI172/vee8DVwKpiJsfirqUL0I956Yb4kSAaRAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAB9F+mW7qO45ztXQ95+SVwGcZxwAz/GlNa+Kwm/yb9g/5+CdcuZR+IFvrZ0lCBFwsgJOTaYkkVTVBMrA2H6vUwB9InfqWgm4t6i+sgJvSXl0WsxX86qp2HM2eidLFGg/P7Y5MYyTqaEqeEo7lpSmgEUV6dEnecLdDhrgPzPtmQxYNPJxBj/LqksPbLoYQTLiWaoYOTPlUrxcruV4Sjxq+cyV9K+yTaUtoFmD+GO8/wstB7x5KcE4ob/93J86XdRTh8DMC5j6ULPHqClDoWpoz7pOiLarxcSh6DYDagGv+WF85BjRXfLinbbsXI1QurED27rT78sUnb0flhXX+6eSS6I=');
/*!40000 ALTER TABLE `COMPONENT_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPOSITE_ROLE`
--

DROP TABLE IF EXISTS `COMPOSITE_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMPOSITE_ROLE` (
  `COMPOSITE` varchar(36) NOT NULL,
  `CHILD_ROLE` varchar(36) NOT NULL,
  PRIMARY KEY (`COMPOSITE`,`CHILD_ROLE`),
  KEY `IDX_COMPOSITE` (`COMPOSITE`),
  KEY `IDX_COMPOSITE_CHILD` (`CHILD_ROLE`),
  CONSTRAINT `FK_A63WVEKFTU8JO1PNJ81E7MCE2` FOREIGN KEY (`COMPOSITE`) REFERENCES `KEYCLOAK_ROLE` (`ID`),
  CONSTRAINT `FK_GR7THLLB9LU8Q4VQA4524JJY8` FOREIGN KEY (`CHILD_ROLE`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPOSITE_ROLE`
--

LOCK TABLES `COMPOSITE_ROLE` WRITE;
/*!40000 ALTER TABLE `COMPOSITE_ROLE` DISABLE KEYS */;
INSERT INTO `COMPOSITE_ROLE` VALUES ('0d0954f3-a5f2-4695-ade7-c49e827c08f9','54a35b20-0849-4710-8ae9-cad47ea1e4f0'),('174c9dd0-edf8-427b-8b97-d0db3807256d','67c37d20-fb11-430e-b0ba-74f45c0f6463'),('1d2286a7-6913-4dcf-b846-bc247fcb3036','2749011d-6708-4bbc-8e54-aafa17ae270a'),('548c2f98-b341-4767-9ebf-3ea3c4df7102','023cf934-7a3c-4d1f-b742-0d74cfcf64ce'),('548c2f98-b341-4767-9ebf-3ea3c4df7102','f12d09ce-8dd5-4824-a0e6-7cc226a2d48e'),('6a395775-e5b4-42de-8fc7-65d0790656aa','1a837969-e40a-49eb-b99e-4d9461643a79'),('6a395775-e5b4-42de-8fc7-65d0790656aa','b74b03a6-6b1f-4b46-8c26-0ee8ec7a8bb2'),('6b55880d-7680-401b-924c-e510d9d62fe1','4072761c-a38e-4aff-8a98-bc5c88da40c7'),('6b55880d-7680-401b-924c-e510d9d62fe1','7138e141-9200-4b74-8fe1-038102f10764'),('6b55880d-7680-401b-924c-e510d9d62fe1','bf483347-2540-473b-8886-369efdf44587'),('6b55880d-7680-401b-924c-e510d9d62fe1','e3f892c2-7bb5-4108-9d78-a9aca8665d27'),('90c38817-2158-409b-8860-55842c48ca5e','61ce802b-96b8-46d6-af57-a74bf1bedd35'),('90c38817-2158-409b-8860-55842c48ca5e','7d5091be-ea19-4e48-879c-2797c4e0a124'),('90c38817-2158-409b-8860-55842c48ca5e','9990fd33-133e-4f83-b387-e7c01241b405'),('90c38817-2158-409b-8860-55842c48ca5e','f01916b0-234d-4797-a1f6-a9827b1c1966'),('9990fd33-133e-4f83-b387-e7c01241b405','9319ee0a-ae87-4f88-bb6b-caf895c5d43a'),('99efd78d-923b-4a8e-b7c3-3d747fc2c716','08a0ebfe-1229-478b-8613-63afea5f6878'),('99efd78d-923b-4a8e-b7c3-3d747fc2c716','0f6a063c-43f9-4022-afb7-68a8ae81dba6'),('99efd78d-923b-4a8e-b7c3-3d747fc2c716','14ad79db-012d-4960-908b-3b9a8e4d213d'),('99efd78d-923b-4a8e-b7c3-3d747fc2c716','174c9dd0-edf8-427b-8b97-d0db3807256d'),('99efd78d-923b-4a8e-b7c3-3d747fc2c716','1a837969-e40a-49eb-b99e-4d9461643a79'),('99efd78d-923b-4a8e-b7c3-3d747fc2c716','2000fccf-2fb7-46b5-9d27-4f5c4c5a2446'),('99efd78d-923b-4a8e-b7c3-3d747fc2c716','2b42133f-0dc4-4448-9a13-5a4e9406b86e'),('99efd78d-923b-4a8e-b7c3-3d747fc2c716','2cd17c7b-47ff-4b07-b51c-048804d65c39'),('99efd78d-923b-4a8e-b7c3-3d747fc2c716','351a42db-62bd-406d-870b-5d209fa7fefd'),('99efd78d-923b-4a8e-b7c3-3d747fc2c716','38125bed-8431-4572-837f-535aeb539844'),('99efd78d-923b-4a8e-b7c3-3d747fc2c716','3b055580-c4c8-43ec-acc9-23e0a60f4084'),('99efd78d-923b-4a8e-b7c3-3d747fc2c716','41aaa3ba-2a1b-4143-a714-f8d2f5c308f8'),('99efd78d-923b-4a8e-b7c3-3d747fc2c716','5c537acb-4066-4919-a307-1d0ee6287361'),('99efd78d-923b-4a8e-b7c3-3d747fc2c716','639f3781-0528-49c2-bc44-ff10f6b572ac'),('99efd78d-923b-4a8e-b7c3-3d747fc2c716','646d80b7-1f0b-46a4-bd3f-b12230a2cc83'),('99efd78d-923b-4a8e-b7c3-3d747fc2c716','67c37d20-fb11-430e-b0ba-74f45c0f6463'),('99efd78d-923b-4a8e-b7c3-3d747fc2c716','6a1db0a2-ac6c-40ef-b3aa-e44a2d670b70'),('99efd78d-923b-4a8e-b7c3-3d747fc2c716','6a395775-e5b4-42de-8fc7-65d0790656aa'),('99efd78d-923b-4a8e-b7c3-3d747fc2c716','6d1b3369-a573-4923-b653-43cad60506cd'),('99efd78d-923b-4a8e-b7c3-3d747fc2c716','7844917c-a3b1-4b30-9e74-c948dc31e17c'),('99efd78d-923b-4a8e-b7c3-3d747fc2c716','7ccecc38-bfaa-4a39-9d91-916d177d1848'),('99efd78d-923b-4a8e-b7c3-3d747fc2c716','7f855bea-715f-4c3b-a8f5-60a2ded7f2aa'),('99efd78d-923b-4a8e-b7c3-3d747fc2c716','8eaa8757-216b-427f-9d5c-c325577bef3f'),('99efd78d-923b-4a8e-b7c3-3d747fc2c716','91967dfa-240b-477d-a180-3b705afce006'),('99efd78d-923b-4a8e-b7c3-3d747fc2c716','ab24e543-15d7-46e9-aa63-56da53caa08a'),('99efd78d-923b-4a8e-b7c3-3d747fc2c716','ab4fee63-43fa-451e-ac59-a1c84b016f56'),('99efd78d-923b-4a8e-b7c3-3d747fc2c716','abafa73d-68f3-446b-a2dd-24744edf4f5b'),('99efd78d-923b-4a8e-b7c3-3d747fc2c716','b74b03a6-6b1f-4b46-8c26-0ee8ec7a8bb2'),('99efd78d-923b-4a8e-b7c3-3d747fc2c716','bb53f4d0-d6c8-4796-8988-8a390241ac23'),('99efd78d-923b-4a8e-b7c3-3d747fc2c716','c0e8e0d8-ac83-4ed5-b5a6-ee2ae8e9f129'),('99efd78d-923b-4a8e-b7c3-3d747fc2c716','c6d71762-e475-46a2-8558-89e9ba6e3831'),('99efd78d-923b-4a8e-b7c3-3d747fc2c716','d29dd4cf-ec68-441d-8412-2a535c463156'),('99efd78d-923b-4a8e-b7c3-3d747fc2c716','df94ec60-99dd-4092-bf94-bf820ef87b64'),('99efd78d-923b-4a8e-b7c3-3d747fc2c716','e217dd77-8789-406c-a68e-4c325228cd09'),('99efd78d-923b-4a8e-b7c3-3d747fc2c716','e37e47ee-d3ae-41ae-91bf-27b7a4931c0c'),('99efd78d-923b-4a8e-b7c3-3d747fc2c716','ec3a4bf4-1d1f-4542-9b22-2f1fb586612e'),('99efd78d-923b-4a8e-b7c3-3d747fc2c716','fdece962-1665-475d-86d0-9fed34f12133'),('ab24e543-15d7-46e9-aa63-56da53caa08a','646d80b7-1f0b-46a4-bd3f-b12230a2cc83'),('c0e8e0d8-ac83-4ed5-b5a6-ee2ae8e9f129','2000fccf-2fb7-46b5-9d27-4f5c4c5a2446'),('c0e8e0d8-ac83-4ed5-b5a6-ee2ae8e9f129','41aaa3ba-2a1b-4143-a714-f8d2f5c308f8'),('c5f9c23a-b183-42d0-8d9e-18efd2bee269','023cf934-7a3c-4d1f-b742-0d74cfcf64ce'),('c5f9c23a-b183-42d0-8d9e-18efd2bee269','0d0954f3-a5f2-4695-ade7-c49e827c08f9'),('c5f9c23a-b183-42d0-8d9e-18efd2bee269','1d9389d8-b435-4fb0-ba3c-51320b49608c'),('c5f9c23a-b183-42d0-8d9e-18efd2bee269','34bd382c-7c76-4a55-b695-f6621d8fee81'),('c5f9c23a-b183-42d0-8d9e-18efd2bee269','548c2f98-b341-4767-9ebf-3ea3c4df7102'),('c5f9c23a-b183-42d0-8d9e-18efd2bee269','54a35b20-0849-4710-8ae9-cad47ea1e4f0'),('c5f9c23a-b183-42d0-8d9e-18efd2bee269','59c6a90e-5f0a-4467-b2d6-7ff184a5a917'),('c5f9c23a-b183-42d0-8d9e-18efd2bee269','69c4efac-5e2f-4459-b97e-c83eb62830b6'),('c5f9c23a-b183-42d0-8d9e-18efd2bee269','6b220868-6618-4160-b514-f8087d63b74f'),('c5f9c23a-b183-42d0-8d9e-18efd2bee269','7da314ec-b6c1-481f-b20a-83bae140a0f3'),('c5f9c23a-b183-42d0-8d9e-18efd2bee269','86517c4f-1769-44a1-815c-47ea1c291b3d'),('c5f9c23a-b183-42d0-8d9e-18efd2bee269','8d87309d-b567-4544-bdfc-b1463c3570a7'),('c5f9c23a-b183-42d0-8d9e-18efd2bee269','9f682026-1b9b-4aa6-a0e4-538475ea98e3'),('c5f9c23a-b183-42d0-8d9e-18efd2bee269','c94cc966-0389-4018-9966-941ae141c595'),('c5f9c23a-b183-42d0-8d9e-18efd2bee269','cbc4bcf4-0344-42fb-97d5-c3bdeca9d03f'),('c5f9c23a-b183-42d0-8d9e-18efd2bee269','ea4ee840-7628-4f00-b92a-a2733af2584d'),('c5f9c23a-b183-42d0-8d9e-18efd2bee269','f12d09ce-8dd5-4824-a0e6-7cc226a2d48e'),('c5f9c23a-b183-42d0-8d9e-18efd2bee269','fed6ce7e-4b8b-4851-96ec-0baccaac5b6f'),('d4d11cec-46d4-448c-859f-6f0c278f126a','9017e963-c4c5-4a02-abea-7b20352f674c'),('e3f892c2-7bb5-4108-9d78-a9aca8665d27','d7be28b4-360a-45a9-a21a-5e32743726eb');
/*!40000 ALTER TABLE `COMPOSITE_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CREDENTIAL`
--

DROP TABLE IF EXISTS `CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CREDENTIAL` (
  `ID` varchar(36) NOT NULL,
  `SALT` tinyblob,
  `TYPE` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(36) DEFAULT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `USER_LABEL` varchar(255) DEFAULT NULL,
  `SECRET_DATA` longtext,
  `CREDENTIAL_DATA` longtext,
  `PRIORITY` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USER_CREDENTIAL` (`USER_ID`),
  CONSTRAINT `FK_PFYR0GLASQYL0DEI3KL69R6V0` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CREDENTIAL`
--

LOCK TABLES `CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `CREDENTIAL` DISABLE KEYS */;
INSERT INTO `CREDENTIAL` VALUES ('159efa12-37dd-4479-99c4-950df31f1fc3',NULL,'password','345e9a04-5333-4563-9fa2-548dd791e376',1711945769916,'My password','{\"value\":\"1I+RgfLGUakRpYlvxYiuse4/zdD1a6T51XhT5edwCnUiFYA4SvPOGfE9HJ9YoQbKpHj0tXc9oZnjBuWA58xoeg==\",\"salt\":\"64diTexV936SYoqPvOgguA==\",\"additionalParameters\":{}}','{\"hashIterations\":210000,\"algorithm\":\"pbkdf2-sha512\",\"additionalParameters\":{}}',10),('c701b116-73c4-4bd2-90b4-fc78c11466a4',NULL,'password','a7246e8f-8dae-4e37-8d95-ccb2b24525e3',1711945806194,'My password','{\"value\":\"mpXwcbkzQG6qw/SsyZaSvQLkPqMnKVpMP7hYrUJBigY15eKzyPRVqEVz9iVIzyKr6osuw47m5MDeFj0R2T2Z1w==\",\"salt\":\"mnY5wrMro6H98KotL3exbg==\",\"additionalParameters\":{}}','{\"hashIterations\":210000,\"algorithm\":\"pbkdf2-sha512\",\"additionalParameters\":{}}',10),('f96bc54e-cd74-4bb6-921f-365adaffb981',NULL,'password','434b8c1a-866c-4683-8e93-873a0af026c9',1711945713730,'My password','{\"value\":\"kasXiIEgjY/aBTfdTA0IFqbje7ewGAyVcGldywdoUhbxn0ezrDuGUBIIVpjlJIKbNjg72Tf5v7VZ5HCwn1HrTQ==\",\"salt\":\"tv0J1qY9O1O43hJXmeljCA==\",\"additionalParameters\":{}}','{\"hashIterations\":210000,\"algorithm\":\"pbkdf2-sha512\",\"additionalParameters\":{}}',10),('fccd59ab-c219-4691-896b-2d460661bde5',NULL,'password','a539aa3e-6f87-4b14-bbca-9ea0554ea77a',1711945605202,NULL,'{\"value\":\"KpqnpMItFTsiwRpLqDJUGVxWM3dKPC5RDbwZ4QG/Jt60aLlglzeXQFv27J9wQmkAbb6rSwHiiqzwqXTHyA/rxg==\",\"salt\":\"3eE/IweG78cOx66nY3+dUg==\",\"additionalParameters\":{}}','{\"hashIterations\":210000,\"algorithm\":\"pbkdf2-sha512\",\"additionalParameters\":{}}',10);
/*!40000 ALTER TABLE `CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASECHANGELOG`
--

DROP TABLE IF EXISTS `DATABASECHANGELOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DATABASECHANGELOG` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOG`
--

LOCK TABLES `DATABASECHANGELOG` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOG` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOG` VALUES ('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/jpa-changelog-1.0.0.Final.xml','2024-04-01 04:26:17',1,'EXECUTED','9:6f1016664e21e16d26517a4418f5e3df','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'4.25.1',NULL,NULL,'1945572894'),('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/db2-jpa-changelog-1.0.0.Final.xml','2024-04-01 04:26:17',2,'MARK_RAN','9:828775b1596a07d1200ba1d49e5e3941','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'4.25.1',NULL,NULL,'1945572894'),('1.1.0.Beta1','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Beta1.xml','2024-04-01 04:26:17',3,'EXECUTED','9:5f090e44a7d595883c1fb61f4b41fd38','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...','',NULL,'4.25.1',NULL,NULL,'1945572894'),('1.1.0.Final','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Final.xml','2024-04-01 04:26:17',4,'EXECUTED','9:c07e577387a3d2c04d1adc9aaad8730e','renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY','',NULL,'4.25.1',NULL,NULL,'1945572894'),('1.2.0.Beta1','psilva@redhat.com','META-INF/jpa-changelog-1.2.0.Beta1.xml','2024-04-01 04:26:19',5,'EXECUTED','9:b68ce996c655922dbcd2fe6b6ae72686','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'4.25.1',NULL,NULL,'1945572894'),('1.2.0.Beta1','psilva@redhat.com','META-INF/db2-jpa-changelog-1.2.0.Beta1.xml','2024-04-01 04:26:19',6,'MARK_RAN','9:543b5c9989f024fe35c6f6c5a97de88e','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'4.25.1',NULL,NULL,'1945572894'),('1.2.0.RC1','bburke@redhat.com','META-INF/jpa-changelog-1.2.0.CR1.xml','2024-04-01 04:26:20',7,'EXECUTED','9:765afebbe21cf5bbca048e632df38336','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'4.25.1',NULL,NULL,'1945572894'),('1.2.0.RC1','bburke@redhat.com','META-INF/db2-jpa-changelog-1.2.0.CR1.xml','2024-04-01 04:26:20',8,'MARK_RAN','9:db4a145ba11a6fdaefb397f6dbf829a1','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'4.25.1',NULL,NULL,'1945572894'),('1.2.0.Final','keycloak','META-INF/jpa-changelog-1.2.0.Final.xml','2024-04-01 04:26:20',9,'EXECUTED','9:9d05c7be10cdb873f8bcb41bc3a8ab23','update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT','',NULL,'4.25.1',NULL,NULL,'1945572894'),('1.3.0','bburke@redhat.com','META-INF/jpa-changelog-1.3.0.xml','2024-04-01 04:26:22',10,'EXECUTED','9:18593702353128d53111f9b1ff0b82b8','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...','',NULL,'4.25.1',NULL,NULL,'1945572894'),('1.4.0','bburke@redhat.com','META-INF/jpa-changelog-1.4.0.xml','2024-04-01 04:26:23',11,'EXECUTED','9:6122efe5f090e41a85c0f1c9e52cbb62','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'4.25.1',NULL,NULL,'1945572894'),('1.4.0','bburke@redhat.com','META-INF/db2-jpa-changelog-1.4.0.xml','2024-04-01 04:26:23',12,'MARK_RAN','9:e1ff28bf7568451453f844c5d54bb0b5','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'4.25.1',NULL,NULL,'1945572894'),('1.5.0','bburke@redhat.com','META-INF/jpa-changelog-1.5.0.xml','2024-04-01 04:26:23',13,'EXECUTED','9:7af32cd8957fbc069f796b61217483fd','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'4.25.1',NULL,NULL,'1945572894'),('1.6.1_from15','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2024-04-01 04:26:23',14,'EXECUTED','9:6005e15e84714cd83226bf7879f54190','addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...','',NULL,'4.25.1',NULL,NULL,'1945572894'),('1.6.1_from16-pre','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2024-04-01 04:26:23',15,'MARK_RAN','9:bf656f5a2b055d07f314431cae76f06c','delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION','',NULL,'4.25.1',NULL,NULL,'1945572894'),('1.6.1_from16','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2024-04-01 04:26:23',16,'MARK_RAN','9:f8dadc9284440469dcf71e25ca6ab99b','dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...','',NULL,'4.25.1',NULL,NULL,'1945572894'),('1.6.1','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2024-04-01 04:26:23',17,'EXECUTED','9:d41d8cd98f00b204e9800998ecf8427e','empty','',NULL,'4.25.1',NULL,NULL,'1945572894'),('1.7.0','bburke@redhat.com','META-INF/jpa-changelog-1.7.0.xml','2024-04-01 04:26:24',18,'EXECUTED','9:3368ff0be4c2855ee2dd9ca813b38d8e','createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...','',NULL,'4.25.1',NULL,NULL,'1945572894'),('1.8.0','mposolda@redhat.com','META-INF/jpa-changelog-1.8.0.xml','2024-04-01 04:26:25',19,'EXECUTED','9:8ac2fb5dd030b24c0570a763ed75ed20','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'4.25.1',NULL,NULL,'1945572894'),('1.8.0-2','keycloak','META-INF/jpa-changelog-1.8.0.xml','2024-04-01 04:26:25',20,'EXECUTED','9:f91ddca9b19743db60e3057679810e6c','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'4.25.1',NULL,NULL,'1945572894'),('1.8.0','mposolda@redhat.com','META-INF/db2-jpa-changelog-1.8.0.xml','2024-04-01 04:26:25',21,'MARK_RAN','9:831e82914316dc8a57dc09d755f23c51','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'4.25.1',NULL,NULL,'1945572894'),('1.8.0-2','keycloak','META-INF/db2-jpa-changelog-1.8.0.xml','2024-04-01 04:26:25',22,'MARK_RAN','9:f91ddca9b19743db60e3057679810e6c','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'4.25.1',NULL,NULL,'1945572894'),('1.9.0','mposolda@redhat.com','META-INF/jpa-changelog-1.9.0.xml','2024-04-01 04:26:25',23,'EXECUTED','9:bc3d0f9e823a69dc21e23e94c7a94bb1','update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...','',NULL,'4.25.1',NULL,NULL,'1945572894'),('1.9.1','keycloak','META-INF/jpa-changelog-1.9.1.xml','2024-04-01 04:26:25',24,'EXECUTED','9:c9999da42f543575ab790e76439a2679','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'4.25.1',NULL,NULL,'1945572894'),('1.9.1','keycloak','META-INF/db2-jpa-changelog-1.9.1.xml','2024-04-01 04:26:25',25,'MARK_RAN','9:0d6c65c6f58732d81569e77b10ba301d','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'4.25.1',NULL,NULL,'1945572894'),('1.9.2','keycloak','META-INF/jpa-changelog-1.9.2.xml','2024-04-01 04:26:26',26,'EXECUTED','9:fc576660fc016ae53d2d4778d84d86d0','createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...','',NULL,'4.25.1',NULL,NULL,'1945572894'),('authz-2.0.0','psilva@redhat.com','META-INF/jpa-changelog-authz-2.0.0.xml','2024-04-01 04:26:27',27,'EXECUTED','9:43ed6b0da89ff77206289e87eaa9c024','createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...','',NULL,'4.25.1',NULL,NULL,'1945572894'),('authz-2.5.1','psilva@redhat.com','META-INF/jpa-changelog-authz-2.5.1.xml','2024-04-01 04:26:27',28,'EXECUTED','9:44bae577f551b3738740281eceb4ea70','update tableName=RESOURCE_SERVER_POLICY','',NULL,'4.25.1',NULL,NULL,'1945572894'),('2.1.0-KEYCLOAK-5461','bburke@redhat.com','META-INF/jpa-changelog-2.1.0.xml','2024-04-01 04:26:28',29,'EXECUTED','9:bd88e1f833df0420b01e114533aee5e8','createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...','',NULL,'4.25.1',NULL,NULL,'1945572894'),('2.2.0','bburke@redhat.com','META-INF/jpa-changelog-2.2.0.xml','2024-04-01 04:26:28',30,'EXECUTED','9:a7022af5267f019d020edfe316ef4371','addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...','',NULL,'4.25.1',NULL,NULL,'1945572894'),('2.3.0','bburke@redhat.com','META-INF/jpa-changelog-2.3.0.xml','2024-04-01 04:26:29',31,'EXECUTED','9:fc155c394040654d6a79227e56f5e25a','createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...','',NULL,'4.25.1',NULL,NULL,'1945572894'),('2.4.0','bburke@redhat.com','META-INF/jpa-changelog-2.4.0.xml','2024-04-01 04:26:29',32,'EXECUTED','9:eac4ffb2a14795e5dc7b426063e54d88','customChange','',NULL,'4.25.1',NULL,NULL,'1945572894'),('2.5.0','bburke@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2024-04-01 04:26:29',33,'EXECUTED','9:54937c05672568c4c64fc9524c1e9462','customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION','',NULL,'4.25.1',NULL,NULL,'1945572894'),('2.5.0-unicode-oracle','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2024-04-01 04:26:29',34,'MARK_RAN','9:3a32bace77c84d7678d035a7f5a8084e','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'4.25.1',NULL,NULL,'1945572894'),('2.5.0-unicode-other-dbs','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2024-04-01 04:26:30',35,'EXECUTED','9:33d72168746f81f98ae3a1e8e0ca3554','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'4.25.1',NULL,NULL,'1945572894'),('2.5.0-duplicate-email-support','slawomir@dabek.name','META-INF/jpa-changelog-2.5.0.xml','2024-04-01 04:26:30',36,'EXECUTED','9:61b6d3d7a4c0e0024b0c839da283da0c','addColumn tableName=REALM','',NULL,'4.25.1',NULL,NULL,'1945572894'),('2.5.0-unique-group-names','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2024-04-01 04:26:30',37,'EXECUTED','9:8dcac7bdf7378e7d823cdfddebf72fda','addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'4.25.1',NULL,NULL,'1945572894'),('2.5.1','bburke@redhat.com','META-INF/jpa-changelog-2.5.1.xml','2024-04-01 04:26:30',38,'EXECUTED','9:a2b870802540cb3faa72098db5388af3','addColumn tableName=FED_USER_CONSENT','',NULL,'4.25.1',NULL,NULL,'1945572894'),('3.0.0','bburke@redhat.com','META-INF/jpa-changelog-3.0.0.xml','2024-04-01 04:26:30',39,'EXECUTED','9:132a67499ba24bcc54fb5cbdcfe7e4c0','addColumn tableName=IDENTITY_PROVIDER','',NULL,'4.25.1',NULL,NULL,'1945572894'),('3.2.0-fix','keycloak','META-INF/jpa-changelog-3.2.0.xml','2024-04-01 04:26:30',40,'MARK_RAN','9:938f894c032f5430f2b0fafb1a243462','addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS','',NULL,'4.25.1',NULL,NULL,'1945572894'),('3.2.0-fix-with-keycloak-5416','keycloak','META-INF/jpa-changelog-3.2.0.xml','2024-04-01 04:26:30',41,'MARK_RAN','9:845c332ff1874dc5d35974b0babf3006','dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS','',NULL,'4.25.1',NULL,NULL,'1945572894'),('3.2.0-fix-offline-sessions','hmlnarik','META-INF/jpa-changelog-3.2.0.xml','2024-04-01 04:26:30',42,'EXECUTED','9:fc86359c079781adc577c5a217e4d04c','customChange','',NULL,'4.25.1',NULL,NULL,'1945572894'),('3.2.0-fixed','keycloak','META-INF/jpa-changelog-3.2.0.xml','2024-04-01 04:26:32',43,'EXECUTED','9:59a64800e3c0d09b825f8a3b444fa8f4','addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...','',NULL,'4.25.1',NULL,NULL,'1945572894'),('3.3.0','keycloak','META-INF/jpa-changelog-3.3.0.xml','2024-04-01 04:26:32',44,'EXECUTED','9:d48d6da5c6ccf667807f633fe489ce88','addColumn tableName=USER_ENTITY','',NULL,'4.25.1',NULL,NULL,'1945572894'),('authz-3.4.0.CR1-resource-server-pk-change-part1','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2024-04-01 04:26:32',45,'EXECUTED','9:dde36f7973e80d71fceee683bc5d2951','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE','',NULL,'4.25.1',NULL,NULL,'1945572894'),('authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2024-04-01 04:26:32',46,'EXECUTED','9:b855e9b0a406b34fa323235a0cf4f640','customChange','',NULL,'4.25.1',NULL,NULL,'1945572894'),('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2024-04-01 04:26:32',47,'MARK_RAN','9:51abbacd7b416c50c4421a8cabf7927e','dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE','',NULL,'4.25.1',NULL,NULL,'1945572894'),('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2024-04-01 04:26:33',48,'EXECUTED','9:bdc99e567b3398bac83263d375aad143','addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...','',NULL,'4.25.1',NULL,NULL,'1945572894'),('authn-3.4.0.CR1-refresh-token-max-reuse','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2024-04-01 04:26:33',49,'EXECUTED','9:d198654156881c46bfba39abd7769e69','addColumn tableName=REALM','',NULL,'4.25.1',NULL,NULL,'1945572894'),('3.4.0','keycloak','META-INF/jpa-changelog-3.4.0.xml','2024-04-01 04:26:34',50,'EXECUTED','9:cfdd8736332ccdd72c5256ccb42335db','addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...','',NULL,'4.25.1',NULL,NULL,'1945572894'),('3.4.0-KEYCLOAK-5230','hmlnarik@redhat.com','META-INF/jpa-changelog-3.4.0.xml','2024-04-01 04:26:34',51,'EXECUTED','9:7c84de3d9bd84d7f077607c1a4dcb714','createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...','',NULL,'4.25.1',NULL,NULL,'1945572894'),('3.4.1','psilva@redhat.com','META-INF/jpa-changelog-3.4.1.xml','2024-04-01 04:26:34',52,'EXECUTED','9:5a6bb36cbefb6a9d6928452c0852af2d','modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.25.1',NULL,NULL,'1945572894'),('3.4.2','keycloak','META-INF/jpa-changelog-3.4.2.xml','2024-04-01 04:26:34',53,'EXECUTED','9:8f23e334dbc59f82e0a328373ca6ced0','update tableName=REALM','',NULL,'4.25.1',NULL,NULL,'1945572894'),('3.4.2-KEYCLOAK-5172','mkanis@redhat.com','META-INF/jpa-changelog-3.4.2.xml','2024-04-01 04:26:34',54,'EXECUTED','9:9156214268f09d970cdf0e1564d866af','update tableName=CLIENT','',NULL,'4.25.1',NULL,NULL,'1945572894'),('4.0.0-KEYCLOAK-6335','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2024-04-01 04:26:34',55,'EXECUTED','9:db806613b1ed154826c02610b7dbdf74','createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS','',NULL,'4.25.1',NULL,NULL,'1945572894'),('4.0.0-CLEANUP-UNUSED-TABLE','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2024-04-01 04:26:35',56,'EXECUTED','9:229a041fb72d5beac76bb94a5fa709de','dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING','',NULL,'4.25.1',NULL,NULL,'1945572894'),('4.0.0-KEYCLOAK-6228','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2024-04-01 04:26:35',57,'EXECUTED','9:079899dade9c1e683f26b2aa9ca6ff04','dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...','',NULL,'4.25.1',NULL,NULL,'1945572894'),('4.0.0-KEYCLOAK-5579-fixed','mposolda@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2024-04-01 04:26:37',58,'EXECUTED','9:139b79bcbbfe903bb1c2d2a4dbf001d9','dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...','',NULL,'4.25.1',NULL,NULL,'1945572894'),('authz-4.0.0.CR1','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.CR1.xml','2024-04-01 04:26:38',59,'EXECUTED','9:b55738ad889860c625ba2bf483495a04','createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...','',NULL,'4.25.1',NULL,NULL,'1945572894'),('authz-4.0.0.Beta3','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.Beta3.xml','2024-04-01 04:26:38',60,'EXECUTED','9:e0057eac39aa8fc8e09ac6cfa4ae15fe','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY','',NULL,'4.25.1',NULL,NULL,'1945572894'),('authz-4.2.0.Final','mhajas@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2024-04-01 04:26:38',61,'EXECUTED','9:42a33806f3a0443fe0e7feeec821326c','createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...','',NULL,'4.25.1',NULL,NULL,'1945572894'),('authz-4.2.0.Final-KEYCLOAK-9944','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2024-04-01 04:26:38',62,'EXECUTED','9:9968206fca46eecc1f51db9c024bfe56','addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS','',NULL,'4.25.1',NULL,NULL,'1945572894'),('4.2.0-KEYCLOAK-6313','wadahiro@gmail.com','META-INF/jpa-changelog-4.2.0.xml','2024-04-01 04:26:38',63,'EXECUTED','9:92143a6daea0a3f3b8f598c97ce55c3d','addColumn tableName=REQUIRED_ACTION_PROVIDER','',NULL,'4.25.1',NULL,NULL,'1945572894'),('4.3.0-KEYCLOAK-7984','wadahiro@gmail.com','META-INF/jpa-changelog-4.3.0.xml','2024-04-01 04:26:38',64,'EXECUTED','9:82bab26a27195d889fb0429003b18f40','update tableName=REQUIRED_ACTION_PROVIDER','',NULL,'4.25.1',NULL,NULL,'1945572894'),('4.6.0-KEYCLOAK-7950','psilva@redhat.com','META-INF/jpa-changelog-4.6.0.xml','2024-04-01 04:26:38',65,'EXECUTED','9:e590c88ddc0b38b0ae4249bbfcb5abc3','update tableName=RESOURCE_SERVER_RESOURCE','',NULL,'4.25.1',NULL,NULL,'1945572894'),('4.6.0-KEYCLOAK-8377','keycloak','META-INF/jpa-changelog-4.6.0.xml','2024-04-01 04:26:38',66,'EXECUTED','9:5c1f475536118dbdc38d5d7977950cc0','createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...','',NULL,'4.25.1',NULL,NULL,'1945572894'),('4.6.0-KEYCLOAK-8555','gideonray@gmail.com','META-INF/jpa-changelog-4.6.0.xml','2024-04-01 04:26:38',67,'EXECUTED','9:e7c9f5f9c4d67ccbbcc215440c718a17','createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT','',NULL,'4.25.1',NULL,NULL,'1945572894'),('4.7.0-KEYCLOAK-1267','sguilhen@redhat.com','META-INF/jpa-changelog-4.7.0.xml','2024-04-01 04:26:38',68,'EXECUTED','9:88e0bfdda924690d6f4e430c53447dd5','addColumn tableName=REALM','',NULL,'4.25.1',NULL,NULL,'1945572894'),('4.7.0-KEYCLOAK-7275','keycloak','META-INF/jpa-changelog-4.7.0.xml','2024-04-01 04:26:38',69,'EXECUTED','9:f53177f137e1c46b6a88c59ec1cb5218','renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...','',NULL,'4.25.1',NULL,NULL,'1945572894'),('4.8.0-KEYCLOAK-8835','sguilhen@redhat.com','META-INF/jpa-changelog-4.8.0.xml','2024-04-01 04:26:39',70,'EXECUTED','9:a74d33da4dc42a37ec27121580d1459f','addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM','',NULL,'4.25.1',NULL,NULL,'1945572894'),('authz-7.0.0-KEYCLOAK-10443','psilva@redhat.com','META-INF/jpa-changelog-authz-7.0.0.xml','2024-04-01 04:26:39',71,'EXECUTED','9:fd4ade7b90c3b67fae0bfcfcb42dfb5f','addColumn tableName=RESOURCE_SERVER','',NULL,'4.25.1',NULL,NULL,'1945572894'),('8.0.0-adding-credential-columns','keycloak','META-INF/jpa-changelog-8.0.0.xml','2024-04-01 04:26:39',72,'EXECUTED','9:aa072ad090bbba210d8f18781b8cebf4','addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL','',NULL,'4.25.1',NULL,NULL,'1945572894'),('8.0.0-updating-credential-data-not-oracle-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2024-04-01 04:26:39',73,'EXECUTED','9:1ae6be29bab7c2aa376f6983b932be37','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'4.25.1',NULL,NULL,'1945572894'),('8.0.0-updating-credential-data-oracle-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2024-04-01 04:26:39',74,'MARK_RAN','9:14706f286953fc9a25286dbd8fb30d97','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'4.25.1',NULL,NULL,'1945572894'),('8.0.0-credential-cleanup-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2024-04-01 04:26:39',75,'EXECUTED','9:2b9cc12779be32c5b40e2e67711a218b','dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...','',NULL,'4.25.1',NULL,NULL,'1945572894'),('8.0.0-resource-tag-support','keycloak','META-INF/jpa-changelog-8.0.0.xml','2024-04-01 04:26:39',76,'EXECUTED','9:91fa186ce7a5af127a2d7a91ee083cc5','addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL','',NULL,'4.25.1',NULL,NULL,'1945572894'),('9.0.0-always-display-client','keycloak','META-INF/jpa-changelog-9.0.0.xml','2024-04-01 04:26:39',77,'EXECUTED','9:6335e5c94e83a2639ccd68dd24e2e5ad','addColumn tableName=CLIENT','',NULL,'4.25.1',NULL,NULL,'1945572894'),('9.0.0-drop-constraints-for-column-increase','keycloak','META-INF/jpa-changelog-9.0.0.xml','2024-04-01 04:26:39',78,'MARK_RAN','9:6bdb5658951e028bfe16fa0a8228b530','dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...','',NULL,'4.25.1',NULL,NULL,'1945572894'),('9.0.0-increase-column-size-federated-fk','keycloak','META-INF/jpa-changelog-9.0.0.xml','2024-04-01 04:26:40',79,'EXECUTED','9:d5bc15a64117ccad481ce8792d4c608f','modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...','',NULL,'4.25.1',NULL,NULL,'1945572894'),('9.0.0-recreate-constraints-after-column-increase','keycloak','META-INF/jpa-changelog-9.0.0.xml','2024-04-01 04:26:40',80,'MARK_RAN','9:077cba51999515f4d3e7ad5619ab592c','addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...','',NULL,'4.25.1',NULL,NULL,'1945572894'),('9.0.1-add-index-to-client.client_id','keycloak','META-INF/jpa-changelog-9.0.1.xml','2024-04-01 04:26:40',81,'EXECUTED','9:be969f08a163bf47c6b9e9ead8ac2afb','createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT','',NULL,'4.25.1',NULL,NULL,'1945572894'),('9.0.1-KEYCLOAK-12579-drop-constraints','keycloak','META-INF/jpa-changelog-9.0.1.xml','2024-04-01 04:26:40',82,'MARK_RAN','9:6d3bb4408ba5a72f39bd8a0b301ec6e3','dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'4.25.1',NULL,NULL,'1945572894'),('9.0.1-KEYCLOAK-12579-add-not-null-constraint','keycloak','META-INF/jpa-changelog-9.0.1.xml','2024-04-01 04:26:40',83,'EXECUTED','9:966bda61e46bebf3cc39518fbed52fa7','addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP','',NULL,'4.25.1',NULL,NULL,'1945572894'),('9.0.1-KEYCLOAK-12579-recreate-constraints','keycloak','META-INF/jpa-changelog-9.0.1.xml','2024-04-01 04:26:40',84,'MARK_RAN','9:8dcac7bdf7378e7d823cdfddebf72fda','addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'4.25.1',NULL,NULL,'1945572894'),('9.0.1-add-index-to-events','keycloak','META-INF/jpa-changelog-9.0.1.xml','2024-04-01 04:26:40',85,'EXECUTED','9:7d93d602352a30c0c317e6a609b56599','createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY','',NULL,'4.25.1',NULL,NULL,'1945572894'),('map-remove-ri','keycloak','META-INF/jpa-changelog-11.0.0.xml','2024-04-01 04:26:40',86,'EXECUTED','9:71c5969e6cdd8d7b6f47cebc86d37627','dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9','',NULL,'4.25.1',NULL,NULL,'1945572894'),('map-remove-ri','keycloak','META-INF/jpa-changelog-12.0.0.xml','2024-04-01 04:26:40',87,'EXECUTED','9:a9ba7d47f065f041b7da856a81762021','dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...','',NULL,'4.25.1',NULL,NULL,'1945572894'),('12.1.0-add-realm-localization-table','keycloak','META-INF/jpa-changelog-12.0.0.xml','2024-04-01 04:26:40',88,'EXECUTED','9:fffabce2bc01e1a8f5110d5278500065','createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS','',NULL,'4.25.1',NULL,NULL,'1945572894'),('default-roles','keycloak','META-INF/jpa-changelog-13.0.0.xml','2024-04-01 04:26:40',89,'EXECUTED','9:fa8a5b5445e3857f4b010bafb5009957','addColumn tableName=REALM; customChange','',NULL,'4.25.1',NULL,NULL,'1945572894'),('default-roles-cleanup','keycloak','META-INF/jpa-changelog-13.0.0.xml','2024-04-01 04:26:40',90,'EXECUTED','9:67ac3241df9a8582d591c5ed87125f39','dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES','',NULL,'4.25.1',NULL,NULL,'1945572894'),('13.0.0-KEYCLOAK-16844','keycloak','META-INF/jpa-changelog-13.0.0.xml','2024-04-01 04:26:40',91,'EXECUTED','9:ad1194d66c937e3ffc82386c050ba089','createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION','',NULL,'4.25.1',NULL,NULL,'1945572894'),('map-remove-ri-13.0.0','keycloak','META-INF/jpa-changelog-13.0.0.xml','2024-04-01 04:26:41',92,'EXECUTED','9:d9be619d94af5a2f5d07b9f003543b91','dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...','',NULL,'4.25.1',NULL,NULL,'1945572894'),('13.0.0-KEYCLOAK-17992-drop-constraints','keycloak','META-INF/jpa-changelog-13.0.0.xml','2024-04-01 04:26:41',93,'MARK_RAN','9:544d201116a0fcc5a5da0925fbbc3bde','dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT','',NULL,'4.25.1',NULL,NULL,'1945572894'),('13.0.0-increase-column-size-federated','keycloak','META-INF/jpa-changelog-13.0.0.xml','2024-04-01 04:26:41',94,'EXECUTED','9:43c0c1055b6761b4b3e89de76d612ccf','modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT','',NULL,'4.25.1',NULL,NULL,'1945572894'),('13.0.0-KEYCLOAK-17992-recreate-constraints','keycloak','META-INF/jpa-changelog-13.0.0.xml','2024-04-01 04:26:41',95,'MARK_RAN','9:8bd711fd0330f4fe980494ca43ab1139','addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...','',NULL,'4.25.1',NULL,NULL,'1945572894'),('json-string-accomodation-fixed','keycloak','META-INF/jpa-changelog-13.0.0.xml','2024-04-01 04:26:41',96,'EXECUTED','9:e07d2bc0970c348bb06fb63b1f82ddbf','addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE','',NULL,'4.25.1',NULL,NULL,'1945572894'),('14.0.0-KEYCLOAK-11019','keycloak','META-INF/jpa-changelog-14.0.0.xml','2024-04-01 04:26:41',97,'EXECUTED','9:24fb8611e97f29989bea412aa38d12b7','createIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USER, tableName=OFFLINE_USER_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION','',NULL,'4.25.1',NULL,NULL,'1945572894'),('14.0.0-KEYCLOAK-18286','keycloak','META-INF/jpa-changelog-14.0.0.xml','2024-04-01 04:26:41',98,'MARK_RAN','9:259f89014ce2506ee84740cbf7163aa7','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.25.1',NULL,NULL,'1945572894'),('14.0.0-KEYCLOAK-18286-revert','keycloak','META-INF/jpa-changelog-14.0.0.xml','2024-04-01 04:26:41',99,'MARK_RAN','9:04baaf56c116ed19951cbc2cca584022','dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.25.1',NULL,NULL,'1945572894'),('14.0.0-KEYCLOAK-18286-supported-dbs','keycloak','META-INF/jpa-changelog-14.0.0.xml','2024-04-01 04:26:41',100,'EXECUTED','9:bd2bd0fc7768cf0845ac96a8786fa735','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.25.1',NULL,NULL,'1945572894'),('14.0.0-KEYCLOAK-18286-unsupported-dbs','keycloak','META-INF/jpa-changelog-14.0.0.xml','2024-04-01 04:26:41',101,'MARK_RAN','9:d3d977031d431db16e2c181ce49d73e9','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.25.1',NULL,NULL,'1945572894'),('KEYCLOAK-17267-add-index-to-user-attributes','keycloak','META-INF/jpa-changelog-14.0.0.xml','2024-04-01 04:26:41',102,'EXECUTED','9:0b305d8d1277f3a89a0a53a659ad274c','createIndex indexName=IDX_USER_ATTRIBUTE_NAME, tableName=USER_ATTRIBUTE','',NULL,'4.25.1',NULL,NULL,'1945572894'),('KEYCLOAK-18146-add-saml-art-binding-identifier','keycloak','META-INF/jpa-changelog-14.0.0.xml','2024-04-01 04:26:41',103,'EXECUTED','9:2c374ad2cdfe20e2905a84c8fac48460','customChange','',NULL,'4.25.1',NULL,NULL,'1945572894'),('15.0.0-KEYCLOAK-18467','keycloak','META-INF/jpa-changelog-15.0.0.xml','2024-04-01 04:26:41',104,'EXECUTED','9:47a760639ac597360a8219f5b768b4de','addColumn tableName=REALM_LOCALIZATIONS; update tableName=REALM_LOCALIZATIONS; dropColumn columnName=TEXTS, tableName=REALM_LOCALIZATIONS; renameColumn newColumnName=TEXTS, oldColumnName=TEXTS_NEW, tableName=REALM_LOCALIZATIONS; addNotNullConstrai...','',NULL,'4.25.1',NULL,NULL,'1945572894'),('17.0.0-9562','keycloak','META-INF/jpa-changelog-17.0.0.xml','2024-04-01 04:26:41',105,'EXECUTED','9:a6272f0576727dd8cad2522335f5d99e','createIndex indexName=IDX_USER_SERVICE_ACCOUNT, tableName=USER_ENTITY','',NULL,'4.25.1',NULL,NULL,'1945572894'),('18.0.0-10625-IDX_ADMIN_EVENT_TIME','keycloak','META-INF/jpa-changelog-18.0.0.xml','2024-04-01 04:26:41',106,'EXECUTED','9:015479dbd691d9cc8669282f4828c41d','createIndex indexName=IDX_ADMIN_EVENT_TIME, tableName=ADMIN_EVENT_ENTITY','',NULL,'4.25.1',NULL,NULL,'1945572894'),('19.0.0-10135','keycloak','META-INF/jpa-changelog-19.0.0.xml','2024-04-01 04:26:41',107,'EXECUTED','9:9518e495fdd22f78ad6425cc30630221','customChange','',NULL,'4.25.1',NULL,NULL,'1945572894'),('20.0.0-12964-supported-dbs','keycloak','META-INF/jpa-changelog-20.0.0.xml','2024-04-01 04:26:41',108,'EXECUTED','9:f2e1331a71e0aa85e5608fe42f7f681c','createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE','',NULL,'4.25.1',NULL,NULL,'1945572894'),('20.0.0-12964-unsupported-dbs','keycloak','META-INF/jpa-changelog-20.0.0.xml','2024-04-01 04:26:41',109,'MARK_RAN','9:1a6fcaa85e20bdeae0a9ce49b41946a5','createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE','',NULL,'4.25.1',NULL,NULL,'1945572894'),('client-attributes-string-accomodation-fixed','keycloak','META-INF/jpa-changelog-20.0.0.xml','2024-04-01 04:26:41',110,'EXECUTED','9:3f332e13e90739ed0c35b0b25b7822ca','addColumn tableName=CLIENT_ATTRIBUTES; update tableName=CLIENT_ATTRIBUTES; dropColumn columnName=VALUE, tableName=CLIENT_ATTRIBUTES; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=CLIENT_ATTRIBUTES','',NULL,'4.25.1',NULL,NULL,'1945572894'),('21.0.2-17277','keycloak','META-INF/jpa-changelog-21.0.2.xml','2024-04-01 04:26:41',111,'EXECUTED','9:7ee1f7a3fb8f5588f171fb9a6ab623c0','customChange','',NULL,'4.25.1',NULL,NULL,'1945572894'),('21.1.0-19404','keycloak','META-INF/jpa-changelog-21.1.0.xml','2024-04-01 04:26:42',112,'EXECUTED','9:3d7e830b52f33676b9d64f7f2b2ea634','modifyDataType columnName=DECISION_STRATEGY, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=LOGIC, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=POLICY_ENFORCE_MODE, tableName=RESOURCE_SERVER','',NULL,'4.25.1',NULL,NULL,'1945572894'),('21.1.0-19404-2','keycloak','META-INF/jpa-changelog-21.1.0.xml','2024-04-01 04:26:42',113,'MARK_RAN','9:627d032e3ef2c06c0e1f73d2ae25c26c','addColumn tableName=RESOURCE_SERVER_POLICY; update tableName=RESOURCE_SERVER_POLICY; dropColumn columnName=DECISION_STRATEGY, tableName=RESOURCE_SERVER_POLICY; renameColumn newColumnName=DECISION_STRATEGY, oldColumnName=DECISION_STRATEGY_NEW, tabl...','',NULL,'4.25.1',NULL,NULL,'1945572894'),('22.0.0-17484-updated','keycloak','META-INF/jpa-changelog-22.0.0.xml','2024-04-01 04:26:42',114,'EXECUTED','9:90af0bfd30cafc17b9f4d6eccd92b8b3','customChange','',NULL,'4.25.1',NULL,NULL,'1945572894'),('22.0.5-24031','keycloak','META-INF/jpa-changelog-22.0.0.xml','2024-04-01 04:26:42',115,'MARK_RAN','9:a60d2d7b315ec2d3eba9e2f145f9df28','customChange','',NULL,'4.25.1',NULL,NULL,'1945572894'),('23.0.0-12062','keycloak','META-INF/jpa-changelog-23.0.0.xml','2024-04-01 04:26:42',116,'EXECUTED','9:2168fbe728fec46ae9baf15bf80927b8','addColumn tableName=COMPONENT_CONFIG; update tableName=COMPONENT_CONFIG; dropColumn columnName=VALUE, tableName=COMPONENT_CONFIG; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=COMPONENT_CONFIG','',NULL,'4.25.1',NULL,NULL,'1945572894'),('23.0.0-17258','keycloak','META-INF/jpa-changelog-23.0.0.xml','2024-04-01 04:26:42',117,'EXECUTED','9:36506d679a83bbfda85a27ea1864dca8','addColumn tableName=EVENT_ENTITY','',NULL,'4.25.1',NULL,NULL,'1945572894'),('24.0.0-9758','keycloak','META-INF/jpa-changelog-24.0.0.xml','2024-04-01 04:26:42',118,'EXECUTED','9:502c557a5189f600f0f445a9b49ebbce','addColumn tableName=USER_ATTRIBUTE; addColumn tableName=FED_USER_ATTRIBUTE; createIndex indexName=USER_ATTR_LONG_VALUES, tableName=USER_ATTRIBUTE; createIndex indexName=FED_USER_ATTR_LONG_VALUES, tableName=FED_USER_ATTRIBUTE; createIndex indexName...','',NULL,'4.25.1',NULL,NULL,'1945572894'),('24.0.0-9758-2','keycloak','META-INF/jpa-changelog-24.0.0.xml','2024-04-01 04:26:42',119,'EXECUTED','9:bf0fdee10afdf597a987adbf291db7b2','customChange','',NULL,'4.25.1',NULL,NULL,'1945572894'),('24.0.0-26618-drop-index-if-present','keycloak','META-INF/jpa-changelog-24.0.0.xml','2024-04-01 04:26:42',120,'EXECUTED','9:04baaf56c116ed19951cbc2cca584022','dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.25.1',NULL,NULL,'1945572894'),('24.0.0-26618-reindex','keycloak','META-INF/jpa-changelog-24.0.0.xml','2024-04-01 04:26:42',121,'EXECUTED','9:bd2bd0fc7768cf0845ac96a8786fa735','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.25.1',NULL,NULL,'1945572894'),('24.0.2-27228','keycloak','META-INF/jpa-changelog-24.0.2.xml','2024-04-01 04:26:42',122,'EXECUTED','9:eaee11f6b8aa25d2cc6a84fb86fc6238','customChange','',NULL,'4.25.1',NULL,NULL,'1945572894'),('24.0.2-27967-drop-index-if-present','keycloak','META-INF/jpa-changelog-24.0.2.xml','2024-04-01 04:26:42',123,'MARK_RAN','9:04baaf56c116ed19951cbc2cca584022','dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.25.1',NULL,NULL,'1945572894'),('24.0.2-27967-reindex','keycloak','META-INF/jpa-changelog-24.0.2.xml','2024-04-01 04:26:42',124,'MARK_RAN','9:d3d977031d431db16e2c181ce49d73e9','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.25.1',NULL,NULL,'1945572894');
/*!40000 ALTER TABLE `DATABASECHANGELOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASECHANGELOGLOCK`
--

DROP TABLE IF EXISTS `DATABASECHANGELOGLOCK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DATABASECHANGELOGLOCK` (
  `ID` int NOT NULL,
  `LOCKED` tinyint NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOGLOCK`
--

LOCK TABLES `DATABASECHANGELOGLOCK` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOGLOCK` VALUES (1,0,NULL,NULL),(1000,0,NULL,NULL),(1001,0,NULL,NULL);
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DEFAULT_CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `DEFAULT_CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DEFAULT_CLIENT_SCOPE` (
  `REALM_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  `DEFAULT_SCOPE` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`REALM_ID`,`SCOPE_ID`),
  KEY `IDX_DEFCLS_REALM` (`REALM_ID`),
  KEY `IDX_DEFCLS_SCOPE` (`SCOPE_ID`),
  CONSTRAINT `FK_R_DEF_CLI_SCOPE_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEFAULT_CLIENT_SCOPE`
--

LOCK TABLES `DEFAULT_CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `DEFAULT_CLIENT_SCOPE` DISABLE KEYS */;
INSERT INTO `DEFAULT_CLIENT_SCOPE` VALUES ('65fa274b-8112-4346-8bcc-e604adb24617','0dc19f01-55be-433c-9c00-7a869c05be54',0),('65fa274b-8112-4346-8bcc-e604adb24617','311ae408-59ec-4073-8968-2b2e89581704',1),('65fa274b-8112-4346-8bcc-e604adb24617','4015d60d-3a56-4cbd-a3c6-1324633f0dc8',1),('65fa274b-8112-4346-8bcc-e604adb24617','85e41bf7-c0a1-423c-8343-f7e469f1dc0d',0),('65fa274b-8112-4346-8bcc-e604adb24617','a3974574-b731-4589-bcd7-ef2917ad1e81',1),('65fa274b-8112-4346-8bcc-e604adb24617','a79dbbf9-956d-45bc-906b-96155c01e9ac',1),('65fa274b-8112-4346-8bcc-e604adb24617','d62952fc-d729-489e-badb-fbb40f43b173',1),('65fa274b-8112-4346-8bcc-e604adb24617','e47b778a-0ddc-4808-9fc1-50e0f7ba5ab6',0),('65fa274b-8112-4346-8bcc-e604adb24617','e9a6dec0-7e3e-4110-be2e-01cd0ba96871',0),('65fa274b-8112-4346-8bcc-e604adb24617','efde2333-07f6-4958-92cb-0ab294ab3608',1),('c50626a4-a4f7-42b1-ba55-fdfd2fae3469','3c6a8f99-32ea-49da-814b-41ad1857363d',0),('c50626a4-a4f7-42b1-ba55-fdfd2fae3469','4da027e2-70d1-4d8d-97bc-c04a3bc539f2',1),('c50626a4-a4f7-42b1-ba55-fdfd2fae3469','6b238264-b8e6-4459-ab6a-6b5bc6859109',0),('c50626a4-a4f7-42b1-ba55-fdfd2fae3469','9f030e0c-8646-4059-b6d4-6afe7f7eec1d',1),('c50626a4-a4f7-42b1-ba55-fdfd2fae3469','b30c9eee-9b69-4526-ab2a-550681b831fb',1),('c50626a4-a4f7-42b1-ba55-fdfd2fae3469','b8993406-532f-45ae-97b6-c551c371faf9',0),('c50626a4-a4f7-42b1-ba55-fdfd2fae3469','bdfd3973-f196-466c-ab2b-73fafd4bc24e',1),('c50626a4-a4f7-42b1-ba55-fdfd2fae3469','be66596b-24f0-467a-8b96-9ae473ca50e8',1),('c50626a4-a4f7-42b1-ba55-fdfd2fae3469','d9dd3a6c-796e-4995-b977-4827df5c4ef8',0),('c50626a4-a4f7-42b1-ba55-fdfd2fae3469','fab142b7-0c39-4dde-856f-74aacca4c1c3',1);
/*!40000 ALTER TABLE `DEFAULT_CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EVENT_ENTITY`
--

DROP TABLE IF EXISTS `EVENT_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EVENT_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `DETAILS_JSON` text,
  `ERROR` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `SESSION_ID` varchar(255) DEFAULT NULL,
  `EVENT_TIME` bigint DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  `DETAILS_JSON_LONG_VALUE` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  PRIMARY KEY (`ID`),
  KEY `IDX_EVENT_TIME` (`REALM_ID`,`EVENT_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EVENT_ENTITY`
--

LOCK TABLES `EVENT_ENTITY` WRITE;
/*!40000 ALTER TABLE `EVENT_ENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `EVENT_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FEDERATED_IDENTITY`
--

DROP TABLE IF EXISTS `FEDERATED_IDENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FEDERATED_IDENTITY` (
  `IDENTITY_PROVIDER` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `FEDERATED_USER_ID` varchar(255) DEFAULT NULL,
  `FEDERATED_USERNAME` varchar(255) DEFAULT NULL,
  `TOKEN` text,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`),
  KEY `IDX_FEDIDENTITY_USER` (`USER_ID`),
  KEY `IDX_FEDIDENTITY_FEDUSER` (`FEDERATED_USER_ID`),
  CONSTRAINT `FK404288B92EF007A6` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FEDERATED_IDENTITY`
--

LOCK TABLES `FEDERATED_IDENTITY` WRITE;
/*!40000 ALTER TABLE `FEDERATED_IDENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `FEDERATED_IDENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FEDERATED_USER`
--

DROP TABLE IF EXISTS `FEDERATED_USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FEDERATED_USER` (
  `ID` varchar(255) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FEDERATED_USER`
--

LOCK TABLES `FEDERATED_USER` WRITE;
/*!40000 ALTER TABLE `FEDERATED_USER` DISABLE KEYS */;
/*!40000 ALTER TABLE `FEDERATED_USER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_ATTRIBUTE`
--

DROP TABLE IF EXISTS `FED_USER_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `VALUE` text,
  `LONG_VALUE_HASH` binary(64) DEFAULT NULL,
  `LONG_VALUE_HASH_LOWER_CASE` binary(64) DEFAULT NULL,
  `LONG_VALUE` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_ATTRIBUTE` (`USER_ID`,`REALM_ID`,`NAME`),
  KEY `FED_USER_ATTR_LONG_VALUES` (`LONG_VALUE_HASH`,`NAME`),
  KEY `FED_USER_ATTR_LONG_VALUES_LOWER_CASE` (`LONG_VALUE_HASH_LOWER_CASE`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_ATTRIBUTE`
--

LOCK TABLES `FED_USER_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `FED_USER_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CONSENT`
--

DROP TABLE IF EXISTS `FED_USER_CONSENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_CONSENT` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `LAST_UPDATED_DATE` bigint DEFAULT NULL,
  `CLIENT_STORAGE_PROVIDER` varchar(36) DEFAULT NULL,
  `EXTERNAL_CLIENT_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_CONSENT` (`USER_ID`,`CLIENT_ID`),
  KEY `IDX_FU_CONSENT_RU` (`REALM_ID`,`USER_ID`),
  KEY `IDX_FU_CNSNT_EXT` (`USER_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CONSENT`
--

LOCK TABLES `FED_USER_CONSENT` WRITE;
/*!40000 ALTER TABLE `FED_USER_CONSENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CONSENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CONSENT_CL_SCOPE`
--

DROP TABLE IF EXISTS `FED_USER_CONSENT_CL_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_CONSENT_CL_SCOPE` (
  `USER_CONSENT_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`SCOPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CONSENT_CL_SCOPE`
--

LOCK TABLES `FED_USER_CONSENT_CL_SCOPE` WRITE;
/*!40000 ALTER TABLE `FED_USER_CONSENT_CL_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CONSENT_CL_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CREDENTIAL`
--

DROP TABLE IF EXISTS `FED_USER_CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_CREDENTIAL` (
  `ID` varchar(36) NOT NULL,
  `SALT` tinyblob,
  `TYPE` varchar(255) DEFAULT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `USER_LABEL` varchar(255) DEFAULT NULL,
  `SECRET_DATA` longtext,
  `CREDENTIAL_DATA` longtext,
  `PRIORITY` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_CREDENTIAL` (`USER_ID`,`TYPE`),
  KEY `IDX_FU_CREDENTIAL_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CREDENTIAL`
--

LOCK TABLES `FED_USER_CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `FED_USER_CREDENTIAL` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_GROUP_MEMBERSHIP`
--

DROP TABLE IF EXISTS `FED_USER_GROUP_MEMBERSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_GROUP_MEMBERSHIP` (
  `GROUP_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`GROUP_ID`,`USER_ID`),
  KEY `IDX_FU_GROUP_MEMBERSHIP` (`USER_ID`,`GROUP_ID`),
  KEY `IDX_FU_GROUP_MEMBERSHIP_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_GROUP_MEMBERSHIP`
--

LOCK TABLES `FED_USER_GROUP_MEMBERSHIP` WRITE;
/*!40000 ALTER TABLE `FED_USER_GROUP_MEMBERSHIP` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_GROUP_MEMBERSHIP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_REQUIRED_ACTION`
--

DROP TABLE IF EXISTS `FED_USER_REQUIRED_ACTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_REQUIRED_ACTION` (
  `REQUIRED_ACTION` varchar(255) NOT NULL DEFAULT ' ',
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`),
  KEY `IDX_FU_REQUIRED_ACTION` (`USER_ID`,`REQUIRED_ACTION`),
  KEY `IDX_FU_REQUIRED_ACTION_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_REQUIRED_ACTION`
--

LOCK TABLES `FED_USER_REQUIRED_ACTION` WRITE;
/*!40000 ALTER TABLE `FED_USER_REQUIRED_ACTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_REQUIRED_ACTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `FED_USER_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_ROLE_MAPPING` (
  `ROLE_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`,`USER_ID`),
  KEY `IDX_FU_ROLE_MAPPING` (`USER_ID`,`ROLE_ID`),
  KEY `IDX_FU_ROLE_MAPPING_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_ROLE_MAPPING`
--

LOCK TABLES `FED_USER_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `FED_USER_ROLE_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GROUP_ATTRIBUTE`
--

DROP TABLE IF EXISTS `GROUP_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GROUP_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_GROUP_ATTR_GROUP` (`GROUP_ID`),
  KEY `IDX_GROUP_ATT_BY_NAME_VALUE` (`NAME`,`VALUE`),
  CONSTRAINT `FK_GROUP_ATTRIBUTE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `KEYCLOAK_GROUP` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP_ATTRIBUTE`
--

LOCK TABLES `GROUP_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `GROUP_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `GROUP_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GROUP_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `GROUP_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GROUP_ROLE_MAPPING` (
  `ROLE_ID` varchar(36) NOT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`GROUP_ID`),
  KEY `IDX_GROUP_ROLE_MAPP_GROUP` (`GROUP_ID`),
  CONSTRAINT `FK_GROUP_ROLE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `KEYCLOAK_GROUP` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP_ROLE_MAPPING`
--

LOCK TABLES `GROUP_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `GROUP_ROLE_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `GROUP_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDENTITY_PROVIDER` (
  `INTERNAL_ID` varchar(36) NOT NULL,
  `ENABLED` tinyint NOT NULL DEFAULT '0',
  `PROVIDER_ALIAS` varchar(255) DEFAULT NULL,
  `PROVIDER_ID` varchar(255) DEFAULT NULL,
  `STORE_TOKEN` tinyint NOT NULL DEFAULT '0',
  `AUTHENTICATE_BY_DEFAULT` tinyint NOT NULL DEFAULT '0',
  `REALM_ID` varchar(36) DEFAULT NULL,
  `ADD_TOKEN_ROLE` tinyint NOT NULL DEFAULT '1',
  `TRUST_EMAIL` tinyint NOT NULL DEFAULT '0',
  `FIRST_BROKER_LOGIN_FLOW_ID` varchar(36) DEFAULT NULL,
  `POST_BROKER_LOGIN_FLOW_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_DISPLAY_NAME` varchar(255) DEFAULT NULL,
  `LINK_ONLY` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`INTERNAL_ID`),
  UNIQUE KEY `UK_2DAELWNIBJI49AVXSRTUF6XJ33` (`PROVIDER_ALIAS`,`REALM_ID`),
  KEY `IDX_IDENT_PROV_REALM` (`REALM_ID`),
  CONSTRAINT `FK2B4EBC52AE5C3B34` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER`
--

LOCK TABLES `IDENTITY_PROVIDER` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER_CONFIG`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDENTITY_PROVIDER_CONFIG` (
  `IDENTITY_PROVIDER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER_ID`,`NAME`),
  CONSTRAINT `FKDC4897CF864C4E43` FOREIGN KEY (`IDENTITY_PROVIDER_ID`) REFERENCES `IDENTITY_PROVIDER` (`INTERNAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER_CONFIG`
--

LOCK TABLES `IDENTITY_PROVIDER_CONFIG` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER_MAPPER`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDENTITY_PROVIDER_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `IDP_ALIAS` varchar(255) NOT NULL,
  `IDP_MAPPER_NAME` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ID_PROV_MAPP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_IDPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER_MAPPER`
--

LOCK TABLES `IDENTITY_PROVIDER_MAPPER` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDP_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `IDP_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDP_MAPPER_CONFIG` (
  `IDP_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`IDP_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_IDPMCONFIG` FOREIGN KEY (`IDP_MAPPER_ID`) REFERENCES `IDENTITY_PROVIDER_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDP_MAPPER_CONFIG`
--

LOCK TABLES `IDP_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `IDP_MAPPER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDP_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KEYCLOAK_GROUP`
--

DROP TABLE IF EXISTS `KEYCLOAK_GROUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `KEYCLOAK_GROUP` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `PARENT_GROUP` varchar(36) NOT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `SIBLING_NAMES` (`REALM_ID`,`PARENT_GROUP`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KEYCLOAK_GROUP`
--

LOCK TABLES `KEYCLOAK_GROUP` WRITE;
/*!40000 ALTER TABLE `KEYCLOAK_GROUP` DISABLE KEYS */;
/*!40000 ALTER TABLE `KEYCLOAK_GROUP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KEYCLOAK_ROLE`
--

DROP TABLE IF EXISTS `KEYCLOAK_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `KEYCLOAK_ROLE` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_REALM_CONSTRAINT` varchar(255) DEFAULT NULL,
  `CLIENT_ROLE` tinyint DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `CLIENT` varchar(36) DEFAULT NULL,
  `REALM` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_J3RWUVD56ONTGSUHOGM184WW2-2` (`NAME`,`CLIENT_REALM_CONSTRAINT`),
  KEY `IDX_KEYCLOAK_ROLE_CLIENT` (`CLIENT`),
  KEY `IDX_KEYCLOAK_ROLE_REALM` (`REALM`),
  CONSTRAINT `FK_6VYQFE4CN4WLQ8R6KT5VDSJ5C` FOREIGN KEY (`REALM`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KEYCLOAK_ROLE`
--

LOCK TABLES `KEYCLOAK_ROLE` WRITE;
/*!40000 ALTER TABLE `KEYCLOAK_ROLE` DISABLE KEYS */;
INSERT INTO `KEYCLOAK_ROLE` VALUES ('023cf934-7a3c-4d1f-b742-0d74cfcf64ce','35ce0d50-565f-4bc2-8de6-02b37f931b21',1,'${role_query-groups}','query-groups','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','35ce0d50-565f-4bc2-8de6-02b37f931b21',NULL),('08a0ebfe-1229-478b-8613-63afea5f6878','379d9d40-4028-4535-a129-64c4c14ac7a3',1,'${role_manage-events}','manage-events','65fa274b-8112-4346-8bcc-e604adb24617','379d9d40-4028-4535-a129-64c4c14ac7a3',NULL),('0a1a954d-11da-4d08-951d-842e17850ae7','c3ac2c21-6ba6-4dc6-85b0-65fe3c6891bb',1,'${role_delete-account}','delete-account','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','c3ac2c21-6ba6-4dc6-85b0-65fe3c6891bb',NULL),('0ce01764-6e9b-41e2-8bb6-1db214d3b5b6','c3ac2c21-6ba6-4dc6-85b0-65fe3c6891bb',1,'${role_view-applications}','view-applications','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','c3ac2c21-6ba6-4dc6-85b0-65fe3c6891bb',NULL),('0d0954f3-a5f2-4695-ade7-c49e827c08f9','35ce0d50-565f-4bc2-8de6-02b37f931b21',1,'${role_view-clients}','view-clients','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','35ce0d50-565f-4bc2-8de6-02b37f931b21',NULL),('0f6a063c-43f9-4022-afb7-68a8ae81dba6','379d9d40-4028-4535-a129-64c4c14ac7a3',1,'${role_manage-clients}','manage-clients','65fa274b-8112-4346-8bcc-e604adb24617','379d9d40-4028-4535-a129-64c4c14ac7a3',NULL),('14ad79db-012d-4960-908b-3b9a8e4d213d','04479882-1cfd-4949-839b-920b808aa3b8',1,'${role_manage-users}','manage-users','65fa274b-8112-4346-8bcc-e604adb24617','04479882-1cfd-4949-839b-920b808aa3b8',NULL),('174c9dd0-edf8-427b-8b97-d0db3807256d','04479882-1cfd-4949-839b-920b808aa3b8',1,'${role_view-clients}','view-clients','65fa274b-8112-4346-8bcc-e604adb24617','04479882-1cfd-4949-839b-920b808aa3b8',NULL),('1a837969-e40a-49eb-b99e-4d9461643a79','04479882-1cfd-4949-839b-920b808aa3b8',1,'${role_query-groups}','query-groups','65fa274b-8112-4346-8bcc-e604adb24617','04479882-1cfd-4949-839b-920b808aa3b8',NULL),('1d2286a7-6913-4dcf-b846-bc247fcb3036','c3ac2c21-6ba6-4dc6-85b0-65fe3c6891bb',1,'${role_manage-consent}','manage-consent','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','c3ac2c21-6ba6-4dc6-85b0-65fe3c6891bb',NULL),('1d9389d8-b435-4fb0-ba3c-51320b49608c','35ce0d50-565f-4bc2-8de6-02b37f931b21',1,'${role_view-events}','view-events','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','35ce0d50-565f-4bc2-8de6-02b37f931b21',NULL),('2000fccf-2fb7-46b5-9d27-4f5c4c5a2446','379d9d40-4028-4535-a129-64c4c14ac7a3',1,'${role_query-users}','query-users','65fa274b-8112-4346-8bcc-e604adb24617','379d9d40-4028-4535-a129-64c4c14ac7a3',NULL),('2749011d-6708-4bbc-8e54-aafa17ae270a','c3ac2c21-6ba6-4dc6-85b0-65fe3c6891bb',1,'${role_view-consent}','view-consent','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','c3ac2c21-6ba6-4dc6-85b0-65fe3c6891bb',NULL),('2b42133f-0dc4-4448-9a13-5a4e9406b86e','04479882-1cfd-4949-839b-920b808aa3b8',1,'${role_manage-authorization}','manage-authorization','65fa274b-8112-4346-8bcc-e604adb24617','04479882-1cfd-4949-839b-920b808aa3b8',NULL),('2cd17c7b-47ff-4b07-b51c-048804d65c39','379d9d40-4028-4535-a129-64c4c14ac7a3',1,'${role_manage-users}','manage-users','65fa274b-8112-4346-8bcc-e604adb24617','379d9d40-4028-4535-a129-64c4c14ac7a3',NULL),('34bd382c-7c76-4a55-b695-f6621d8fee81','35ce0d50-565f-4bc2-8de6-02b37f931b21',1,'${role_manage-realm}','manage-realm','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','35ce0d50-565f-4bc2-8de6-02b37f931b21',NULL),('351a42db-62bd-406d-870b-5d209fa7fefd','379d9d40-4028-4535-a129-64c4c14ac7a3',1,'${role_manage-authorization}','manage-authorization','65fa274b-8112-4346-8bcc-e604adb24617','379d9d40-4028-4535-a129-64c4c14ac7a3',NULL),('377dc7c4-5b91-4a53-a59b-15d5a6e4dcb3','da2ee40e-b2a6-4fb7-8955-56e2798a2d09',1,'${role_read-token}','read-token','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','da2ee40e-b2a6-4fb7-8955-56e2798a2d09',NULL),('38125bed-8431-4572-837f-535aeb539844','04479882-1cfd-4949-839b-920b808aa3b8',1,'${role_view-authorization}','view-authorization','65fa274b-8112-4346-8bcc-e604adb24617','04479882-1cfd-4949-839b-920b808aa3b8',NULL),('3b055580-c4c8-43ec-acc9-23e0a60f4084','04479882-1cfd-4949-839b-920b808aa3b8',1,'${role_manage-realm}','manage-realm','65fa274b-8112-4346-8bcc-e604adb24617','04479882-1cfd-4949-839b-920b808aa3b8',NULL),('4072761c-a38e-4aff-8a98-bc5c88da40c7','c3ac2c21-6ba6-4dc6-85b0-65fe3c6891bb',1,'${role_view-profile}','view-profile','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','c3ac2c21-6ba6-4dc6-85b0-65fe3c6891bb',NULL),('41aaa3ba-2a1b-4143-a714-f8d2f5c308f8','379d9d40-4028-4535-a129-64c4c14ac7a3',1,'${role_query-groups}','query-groups','65fa274b-8112-4346-8bcc-e604adb24617','379d9d40-4028-4535-a129-64c4c14ac7a3',NULL),('4651c60b-a1f6-40de-b59f-d52f364ff66c','c3ac2c21-6ba6-4dc6-85b0-65fe3c6891bb',1,'${role_view-groups}','view-groups','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','c3ac2c21-6ba6-4dc6-85b0-65fe3c6891bb',NULL),('548c2f98-b341-4767-9ebf-3ea3c4df7102','35ce0d50-565f-4bc2-8de6-02b37f931b21',1,'${role_view-users}','view-users','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','35ce0d50-565f-4bc2-8de6-02b37f931b21',NULL),('54a35b20-0849-4710-8ae9-cad47ea1e4f0','35ce0d50-565f-4bc2-8de6-02b37f931b21',1,'${role_query-clients}','query-clients','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','35ce0d50-565f-4bc2-8de6-02b37f931b21',NULL),('59c6a90e-5f0a-4467-b2d6-7ff184a5a917','35ce0d50-565f-4bc2-8de6-02b37f931b21',1,'${role_view-identity-providers}','view-identity-providers','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','35ce0d50-565f-4bc2-8de6-02b37f931b21',NULL),('5c537acb-4066-4919-a307-1d0ee6287361','379d9d40-4028-4535-a129-64c4c14ac7a3',1,'${role_view-realm}','view-realm','65fa274b-8112-4346-8bcc-e604adb24617','379d9d40-4028-4535-a129-64c4c14ac7a3',NULL),('61ce802b-96b8-46d6-af57-a74bf1bedd35','65fa274b-8112-4346-8bcc-e604adb24617',0,'${role_uma_authorization}','uma_authorization','65fa274b-8112-4346-8bcc-e604adb24617',NULL,NULL),('6222fbb8-463e-46b9-a649-17594b1a04d1','d26e729e-9d1e-42cb-b4f0-e81f3d252ff3',1,NULL,'uma_protection','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','d26e729e-9d1e-42cb-b4f0-e81f3d252ff3',NULL),('639f3781-0528-49c2-bc44-ff10f6b572ac','379d9d40-4028-4535-a129-64c4c14ac7a3',1,'${role_manage-identity-providers}','manage-identity-providers','65fa274b-8112-4346-8bcc-e604adb24617','379d9d40-4028-4535-a129-64c4c14ac7a3',NULL),('646d80b7-1f0b-46a4-bd3f-b12230a2cc83','379d9d40-4028-4535-a129-64c4c14ac7a3',1,'${role_query-clients}','query-clients','65fa274b-8112-4346-8bcc-e604adb24617','379d9d40-4028-4535-a129-64c4c14ac7a3',NULL),('67c37d20-fb11-430e-b0ba-74f45c0f6463','04479882-1cfd-4949-839b-920b808aa3b8',1,'${role_query-clients}','query-clients','65fa274b-8112-4346-8bcc-e604adb24617','04479882-1cfd-4949-839b-920b808aa3b8',NULL),('69c4efac-5e2f-4459-b97e-c83eb62830b6','35ce0d50-565f-4bc2-8de6-02b37f931b21',1,'${role_view-authorization}','view-authorization','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','35ce0d50-565f-4bc2-8de6-02b37f931b21',NULL),('6a1db0a2-ac6c-40ef-b3aa-e44a2d670b70','04479882-1cfd-4949-839b-920b808aa3b8',1,'${role_impersonation}','impersonation','65fa274b-8112-4346-8bcc-e604adb24617','04479882-1cfd-4949-839b-920b808aa3b8',NULL),('6a395775-e5b4-42de-8fc7-65d0790656aa','04479882-1cfd-4949-839b-920b808aa3b8',1,'${role_view-users}','view-users','65fa274b-8112-4346-8bcc-e604adb24617','04479882-1cfd-4949-839b-920b808aa3b8',NULL),('6b220868-6618-4160-b514-f8087d63b74f','35ce0d50-565f-4bc2-8de6-02b37f931b21',1,'${role_manage-events}','manage-events','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','35ce0d50-565f-4bc2-8de6-02b37f931b21',NULL),('6b55880d-7680-401b-924c-e510d9d62fe1','c50626a4-a4f7-42b1-ba55-fdfd2fae3469',0,'${role_default-roles}','default-roles-ou-graduation-realm','c50626a4-a4f7-42b1-ba55-fdfd2fae3469',NULL,NULL),('6d1b3369-a573-4923-b653-43cad60506cd','04479882-1cfd-4949-839b-920b808aa3b8',1,'${role_manage-identity-providers}','manage-identity-providers','65fa274b-8112-4346-8bcc-e604adb24617','04479882-1cfd-4949-839b-920b808aa3b8',NULL),('7138e141-9200-4b74-8fe1-038102f10764','c50626a4-a4f7-42b1-ba55-fdfd2fae3469',0,'${role_uma_authorization}','uma_authorization','c50626a4-a4f7-42b1-ba55-fdfd2fae3469',NULL,NULL),('7844917c-a3b1-4b30-9e74-c948dc31e17c','04479882-1cfd-4949-839b-920b808aa3b8',1,'${role_query-realms}','query-realms','65fa274b-8112-4346-8bcc-e604adb24617','04479882-1cfd-4949-839b-920b808aa3b8',NULL),('7ccecc38-bfaa-4a39-9d91-916d177d1848','04479882-1cfd-4949-839b-920b808aa3b8',1,'${role_view-identity-providers}','view-identity-providers','65fa274b-8112-4346-8bcc-e604adb24617','04479882-1cfd-4949-839b-920b808aa3b8',NULL),('7d5091be-ea19-4e48-879c-2797c4e0a124','4bfe7132-eb47-4062-8535-c5fd91bc499f',1,'${role_view-profile}','view-profile','65fa274b-8112-4346-8bcc-e604adb24617','4bfe7132-eb47-4062-8535-c5fd91bc499f',NULL),('7da314ec-b6c1-481f-b20a-83bae140a0f3','35ce0d50-565f-4bc2-8de6-02b37f931b21',1,'${role_manage-clients}','manage-clients','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','35ce0d50-565f-4bc2-8de6-02b37f931b21',NULL),('7f855bea-715f-4c3b-a8f5-60a2ded7f2aa','65fa274b-8112-4346-8bcc-e604adb24617',0,'${role_create-realm}','create-realm','65fa274b-8112-4346-8bcc-e604adb24617',NULL,NULL),('86517c4f-1769-44a1-815c-47ea1c291b3d','35ce0d50-565f-4bc2-8de6-02b37f931b21',1,'${role_manage-identity-providers}','manage-identity-providers','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','35ce0d50-565f-4bc2-8de6-02b37f931b21',NULL),('8d87309d-b567-4544-bdfc-b1463c3570a7','35ce0d50-565f-4bc2-8de6-02b37f931b21',1,'${role_query-realms}','query-realms','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','35ce0d50-565f-4bc2-8de6-02b37f931b21',NULL),('8eaa8757-216b-427f-9d5c-c325577bef3f','379d9d40-4028-4535-a129-64c4c14ac7a3',1,'${role_view-events}','view-events','65fa274b-8112-4346-8bcc-e604adb24617','379d9d40-4028-4535-a129-64c4c14ac7a3',NULL),('9017e963-c4c5-4a02-abea-7b20352f674c','4bfe7132-eb47-4062-8535-c5fd91bc499f',1,'${role_view-consent}','view-consent','65fa274b-8112-4346-8bcc-e604adb24617','4bfe7132-eb47-4062-8535-c5fd91bc499f',NULL),('90c38817-2158-409b-8860-55842c48ca5e','65fa274b-8112-4346-8bcc-e604adb24617',0,'${role_default-roles}','default-roles-master','65fa274b-8112-4346-8bcc-e604adb24617',NULL,NULL),('91967dfa-240b-477d-a180-3b705afce006','379d9d40-4028-4535-a129-64c4c14ac7a3',1,'${role_impersonation}','impersonation','65fa274b-8112-4346-8bcc-e604adb24617','379d9d40-4028-4535-a129-64c4c14ac7a3',NULL),('9319ee0a-ae87-4f88-bb6b-caf895c5d43a','4bfe7132-eb47-4062-8535-c5fd91bc499f',1,'${role_manage-account-links}','manage-account-links','65fa274b-8112-4346-8bcc-e604adb24617','4bfe7132-eb47-4062-8535-c5fd91bc499f',NULL),('9990fd33-133e-4f83-b387-e7c01241b405','4bfe7132-eb47-4062-8535-c5fd91bc499f',1,'${role_manage-account}','manage-account','65fa274b-8112-4346-8bcc-e604adb24617','4bfe7132-eb47-4062-8535-c5fd91bc499f',NULL),('99efd78d-923b-4a8e-b7c3-3d747fc2c716','65fa274b-8112-4346-8bcc-e604adb24617',0,'${role_admin}','admin','65fa274b-8112-4346-8bcc-e604adb24617',NULL,NULL),('9f682026-1b9b-4aa6-a0e4-538475ea98e3','35ce0d50-565f-4bc2-8de6-02b37f931b21',1,'${role_manage-authorization}','manage-authorization','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','35ce0d50-565f-4bc2-8de6-02b37f931b21',NULL),('ab24e543-15d7-46e9-aa63-56da53caa08a','379d9d40-4028-4535-a129-64c4c14ac7a3',1,'${role_view-clients}','view-clients','65fa274b-8112-4346-8bcc-e604adb24617','379d9d40-4028-4535-a129-64c4c14ac7a3',NULL),('ab4fee63-43fa-451e-ac59-a1c84b016f56','04479882-1cfd-4949-839b-920b808aa3b8',1,'${role_manage-clients}','manage-clients','65fa274b-8112-4346-8bcc-e604adb24617','04479882-1cfd-4949-839b-920b808aa3b8',NULL),('abafa73d-68f3-446b-a2dd-24744edf4f5b','379d9d40-4028-4535-a129-64c4c14ac7a3',1,'${role_query-realms}','query-realms','65fa274b-8112-4346-8bcc-e604adb24617','379d9d40-4028-4535-a129-64c4c14ac7a3',NULL),('b7352093-9001-43db-91e8-07124f5589e0','4bfe7132-eb47-4062-8535-c5fd91bc499f',1,'${role_view-applications}','view-applications','65fa274b-8112-4346-8bcc-e604adb24617','4bfe7132-eb47-4062-8535-c5fd91bc499f',NULL),('b74b03a6-6b1f-4b46-8c26-0ee8ec7a8bb2','04479882-1cfd-4949-839b-920b808aa3b8',1,'${role_query-users}','query-users','65fa274b-8112-4346-8bcc-e604adb24617','04479882-1cfd-4949-839b-920b808aa3b8',NULL),('bb53f4d0-d6c8-4796-8988-8a390241ac23','04479882-1cfd-4949-839b-920b808aa3b8',1,'${role_view-realm}','view-realm','65fa274b-8112-4346-8bcc-e604adb24617','04479882-1cfd-4949-839b-920b808aa3b8',NULL),('bf483347-2540-473b-8886-369efdf44587','c50626a4-a4f7-42b1-ba55-fdfd2fae3469',0,'${role_offline-access}','offline_access','c50626a4-a4f7-42b1-ba55-fdfd2fae3469',NULL,NULL),('c0e8e0d8-ac83-4ed5-b5a6-ee2ae8e9f129','379d9d40-4028-4535-a129-64c4c14ac7a3',1,'${role_view-users}','view-users','65fa274b-8112-4346-8bcc-e604adb24617','379d9d40-4028-4535-a129-64c4c14ac7a3',NULL),('c2a5caa6-9801-4e50-99ad-03fb6b72f43f','d2e379d6-839f-43b6-8b61-b96f0530f2f8',1,'${role_read-token}','read-token','65fa274b-8112-4346-8bcc-e604adb24617','d2e379d6-839f-43b6-8b61-b96f0530f2f8',NULL),('c5f9c23a-b183-42d0-8d9e-18efd2bee269','35ce0d50-565f-4bc2-8de6-02b37f931b21',1,'${role_realm-admin}','realm-admin','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','35ce0d50-565f-4bc2-8de6-02b37f931b21',NULL),('c6d71762-e475-46a2-8558-89e9ba6e3831','04479882-1cfd-4949-839b-920b808aa3b8',1,'${role_create-client}','create-client','65fa274b-8112-4346-8bcc-e604adb24617','04479882-1cfd-4949-839b-920b808aa3b8',NULL),('c94cc966-0389-4018-9966-941ae141c595','35ce0d50-565f-4bc2-8de6-02b37f931b21',1,'${role_create-client}','create-client','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','35ce0d50-565f-4bc2-8de6-02b37f931b21',NULL),('cbc4bcf4-0344-42fb-97d5-c3bdeca9d03f','35ce0d50-565f-4bc2-8de6-02b37f931b21',1,'${role_impersonation}','impersonation','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','35ce0d50-565f-4bc2-8de6-02b37f931b21',NULL),('cc78cd3e-5fdc-408f-9434-9a4d4e92b1a1','4bfe7132-eb47-4062-8535-c5fd91bc499f',1,'${role_view-groups}','view-groups','65fa274b-8112-4346-8bcc-e604adb24617','4bfe7132-eb47-4062-8535-c5fd91bc499f',NULL),('d29dd4cf-ec68-441d-8412-2a535c463156','379d9d40-4028-4535-a129-64c4c14ac7a3',1,'${role_manage-realm}','manage-realm','65fa274b-8112-4346-8bcc-e604adb24617','379d9d40-4028-4535-a129-64c4c14ac7a3',NULL),('d4d11cec-46d4-448c-859f-6f0c278f126a','4bfe7132-eb47-4062-8535-c5fd91bc499f',1,'${role_manage-consent}','manage-consent','65fa274b-8112-4346-8bcc-e604adb24617','4bfe7132-eb47-4062-8535-c5fd91bc499f',NULL),('d7be28b4-360a-45a9-a21a-5e32743726eb','c3ac2c21-6ba6-4dc6-85b0-65fe3c6891bb',1,'${role_manage-account-links}','manage-account-links','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','c3ac2c21-6ba6-4dc6-85b0-65fe3c6891bb',NULL),('dec4481b-e653-4c4f-9713-bae9aeeccfe2','c50626a4-a4f7-42b1-ba55-fdfd2fae3469',0,'Role User','USER','c50626a4-a4f7-42b1-ba55-fdfd2fae3469',NULL,NULL),('df94ec60-99dd-4092-bf94-bf820ef87b64','379d9d40-4028-4535-a129-64c4c14ac7a3',1,'${role_create-client}','create-client','65fa274b-8112-4346-8bcc-e604adb24617','379d9d40-4028-4535-a129-64c4c14ac7a3',NULL),('e217dd77-8789-406c-a68e-4c325228cd09','04479882-1cfd-4949-839b-920b808aa3b8',1,'${role_view-events}','view-events','65fa274b-8112-4346-8bcc-e604adb24617','04479882-1cfd-4949-839b-920b808aa3b8',NULL),('e37e47ee-d3ae-41ae-91bf-27b7a4931c0c','04479882-1cfd-4949-839b-920b808aa3b8',1,'${role_manage-events}','manage-events','65fa274b-8112-4346-8bcc-e604adb24617','04479882-1cfd-4949-839b-920b808aa3b8',NULL),('e3f892c2-7bb5-4108-9d78-a9aca8665d27','c3ac2c21-6ba6-4dc6-85b0-65fe3c6891bb',1,'${role_manage-account}','manage-account','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','c3ac2c21-6ba6-4dc6-85b0-65fe3c6891bb',NULL),('e58056e3-058d-4c5d-9170-a69d4a94ee43','4bfe7132-eb47-4062-8535-c5fd91bc499f',1,'${role_delete-account}','delete-account','65fa274b-8112-4346-8bcc-e604adb24617','4bfe7132-eb47-4062-8535-c5fd91bc499f',NULL),('ea4ee840-7628-4f00-b92a-a2733af2584d','35ce0d50-565f-4bc2-8de6-02b37f931b21',1,'${role_manage-users}','manage-users','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','35ce0d50-565f-4bc2-8de6-02b37f931b21',NULL),('ebb6c557-480e-4648-9f5f-ce8c0d86bd0d','c50626a4-a4f7-42b1-ba55-fdfd2fae3469',0,'Role Admin','ADMIN','c50626a4-a4f7-42b1-ba55-fdfd2fae3469',NULL,NULL),('ec3a4bf4-1d1f-4542-9b22-2f1fb586612e','379d9d40-4028-4535-a129-64c4c14ac7a3',1,'${role_view-identity-providers}','view-identity-providers','65fa274b-8112-4346-8bcc-e604adb24617','379d9d40-4028-4535-a129-64c4c14ac7a3',NULL),('f01916b0-234d-4797-a1f6-a9827b1c1966','65fa274b-8112-4346-8bcc-e604adb24617',0,'${role_offline-access}','offline_access','65fa274b-8112-4346-8bcc-e604adb24617',NULL,NULL),('f12d09ce-8dd5-4824-a0e6-7cc226a2d48e','35ce0d50-565f-4bc2-8de6-02b37f931b21',1,'${role_query-users}','query-users','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','35ce0d50-565f-4bc2-8de6-02b37f931b21',NULL),('fdece962-1665-475d-86d0-9fed34f12133','379d9d40-4028-4535-a129-64c4c14ac7a3',1,'${role_view-authorization}','view-authorization','65fa274b-8112-4346-8bcc-e604adb24617','379d9d40-4028-4535-a129-64c4c14ac7a3',NULL),('fed6ce7e-4b8b-4851-96ec-0baccaac5b6f','35ce0d50-565f-4bc2-8de6-02b37f931b21',1,'${role_view-realm}','view-realm','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','35ce0d50-565f-4bc2-8de6-02b37f931b21',NULL);
/*!40000 ALTER TABLE `KEYCLOAK_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MIGRATION_MODEL`
--

DROP TABLE IF EXISTS `MIGRATION_MODEL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MIGRATION_MODEL` (
  `ID` varchar(36) NOT NULL,
  `VERSION` varchar(36) DEFAULT NULL,
  `UPDATE_TIME` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IDX_UPDATE_TIME` (`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MIGRATION_MODEL`
--

LOCK TABLES `MIGRATION_MODEL` WRITE;
/*!40000 ALTER TABLE `MIGRATION_MODEL` DISABLE KEYS */;
INSERT INTO `MIGRATION_MODEL` VALUES ('unu3y','24.0.2',1711945602);
/*!40000 ALTER TABLE `MIGRATION_MODEL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OFFLINE_CLIENT_SESSION`
--

DROP TABLE IF EXISTS `OFFLINE_CLIENT_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OFFLINE_CLIENT_SESSION` (
  `USER_SESSION_ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) NOT NULL,
  `OFFLINE_FLAG` varchar(4) NOT NULL,
  `TIMESTAMP` int DEFAULT NULL,
  `DATA` longtext,
  `CLIENT_STORAGE_PROVIDER` varchar(36) NOT NULL DEFAULT 'local',
  `EXTERNAL_CLIENT_ID` varchar(255) NOT NULL DEFAULT 'local',
  PRIMARY KEY (`USER_SESSION_ID`,`CLIENT_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`,`OFFLINE_FLAG`),
  KEY `IDX_US_SESS_ID_ON_CL_SESS` (`USER_SESSION_ID`),
  KEY `IDX_OFFLINE_CSS_PRELOAD` (`CLIENT_ID`,`OFFLINE_FLAG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OFFLINE_CLIENT_SESSION`
--

LOCK TABLES `OFFLINE_CLIENT_SESSION` WRITE;
/*!40000 ALTER TABLE `OFFLINE_CLIENT_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `OFFLINE_CLIENT_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OFFLINE_USER_SESSION`
--

DROP TABLE IF EXISTS `OFFLINE_USER_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OFFLINE_USER_SESSION` (
  `USER_SESSION_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `CREATED_ON` int NOT NULL,
  `OFFLINE_FLAG` varchar(4) NOT NULL,
  `DATA` longtext,
  `LAST_SESSION_REFRESH` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`USER_SESSION_ID`,`OFFLINE_FLAG`),
  KEY `IDX_OFFLINE_USS_CREATEDON` (`CREATED_ON`),
  KEY `IDX_OFFLINE_USS_PRELOAD` (`OFFLINE_FLAG`,`CREATED_ON`,`USER_SESSION_ID`),
  KEY `IDX_OFFLINE_USS_BY_USER` (`USER_ID`,`REALM_ID`,`OFFLINE_FLAG`),
  KEY `IDX_OFFLINE_USS_BY_USERSESS` (`REALM_ID`,`OFFLINE_FLAG`,`USER_SESSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OFFLINE_USER_SESSION`
--

LOCK TABLES `OFFLINE_USER_SESSION` WRITE;
/*!40000 ALTER TABLE `OFFLINE_USER_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `OFFLINE_USER_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `POLICY_CONFIG`
--

DROP TABLE IF EXISTS `POLICY_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `POLICY_CONFIG` (
  `POLICY_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` longtext,
  PRIMARY KEY (`POLICY_ID`,`NAME`),
  CONSTRAINT `FKDC34197CF864C4E43` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `POLICY_CONFIG`
--

LOCK TABLES `POLICY_CONFIG` WRITE;
/*!40000 ALTER TABLE `POLICY_CONFIG` DISABLE KEYS */;
INSERT INTO `POLICY_CONFIG` VALUES ('549298c7-0fac-400d-9573-88933ddec66a','defaultResourceType','urn:ou-graduation-client:resources:default'),('5f63b963-8de4-4ced-93fe-3fbfb71004d9','code','// by default, grants any permission associated with this policy\n$evaluation.grant();\n');
/*!40000 ALTER TABLE `POLICY_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROTOCOL_MAPPER`
--

DROP TABLE IF EXISTS `PROTOCOL_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PROTOCOL_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `PROTOCOL` varchar(255) NOT NULL,
  `PROTOCOL_MAPPER_NAME` varchar(255) NOT NULL,
  `CLIENT_ID` varchar(36) DEFAULT NULL,
  `CLIENT_SCOPE_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_PROTOCOL_MAPPER_CLIENT` (`CLIENT_ID`),
  KEY `IDX_CLSCOPE_PROTMAP` (`CLIENT_SCOPE_ID`),
  CONSTRAINT `FK_CLI_SCOPE_MAPPER` FOREIGN KEY (`CLIENT_SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`),
  CONSTRAINT `FK_PCM_REALM` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROTOCOL_MAPPER`
--

LOCK TABLES `PROTOCOL_MAPPER` WRITE;
/*!40000 ALTER TABLE `PROTOCOL_MAPPER` DISABLE KEYS */;
INSERT INTO `PROTOCOL_MAPPER` VALUES ('015ac641-82f6-4d18-98cc-697fb54700ff','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'fab142b7-0c39-4dde-856f-74aacca4c1c3'),('01ae0ddc-6927-4de8-96b3-af9de820b9c5','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'4015d60d-3a56-4cbd-a3c6-1324633f0dc8'),('030aed45-abfb-442a-ac5d-c5a7543b1a72','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'efde2333-07f6-4958-92cb-0ab294ab3608'),('04af8b5d-10b5-4aa1-b2e2-b02c62c2246f','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'efde2333-07f6-4958-92cb-0ab294ab3608'),('096eabca-d571-4da7-a4fe-f039686e23a6','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'efde2333-07f6-4958-92cb-0ab294ab3608'),('11b75150-7c59-4423-a8ab-7225c8c5145f','acr loa level','openid-connect','oidc-acr-mapper',NULL,'a3974574-b731-4589-bcd7-ef2917ad1e81'),('139e2c01-fad1-4605-bb02-7e8334e32024','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'b30c9eee-9b69-4526-ab2a-550681b831fb'),('14cc0c0d-3c8a-4206-a286-df54b47c6fc0','audience resolve','openid-connect','oidc-audience-resolve-mapper','5805f5dc-5eef-427b-b52c-beb0fc639fff',NULL),('14dc53f8-4031-4e98-a6fb-fbaea980bd76','full name','openid-connect','oidc-full-name-mapper',NULL,'b30c9eee-9b69-4526-ab2a-550681b831fb'),('16a4281e-8adf-40fd-b526-7b82a64565e5','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'efde2333-07f6-4958-92cb-0ab294ab3608'),('22dc66c6-f5de-4c66-9013-ea3964b92130','locale','openid-connect','oidc-usermodel-attribute-mapper','3e22a15e-acef-4f19-b2a0-3afca2189471',NULL),('2b8feb3d-ba90-4006-b27c-c6d8d02ca313','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'b30c9eee-9b69-4526-ab2a-550681b831fb'),('3009250d-49ff-4392-b0c2-4a378734d2eb','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'311ae408-59ec-4073-8968-2b2e89581704'),('30b9656a-08c6-4a34-b9bd-5483b5c96808','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'6b238264-b8e6-4459-ab6a-6b5bc6859109'),('36f285c2-5765-4298-9bfd-caf968ad8839','audience resolve','openid-connect','oidc-audience-resolve-mapper','56ba2ab7-e961-46ab-8c94-c838c4017250',NULL),('3aa3074a-5dda-4062-b01b-8504bdf8cd84','Client Host','openid-connect','oidc-usersessionmodel-note-mapper','d26e729e-9d1e-42cb-b4f0-e81f3d252ff3',NULL),('4189e347-0632-4441-b2a3-7b3cfad7c7d2','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'b30c9eee-9b69-4526-ab2a-550681b831fb'),('481932a2-0fe7-413f-8172-73b416358f23','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'4da027e2-70d1-4d8d-97bc-c04a3bc539f2'),('48431044-7919-4e9e-9c12-066318528b6e','address','openid-connect','oidc-address-mapper',NULL,'0dc19f01-55be-433c-9c00-7a869c05be54'),('489e692a-e1ee-4e5a-88f2-9a06132bffb2','locale','openid-connect','oidc-usermodel-attribute-mapper','b33e20b2-62d3-4afa-a5f1-18ff3234bafd',NULL),('496fdec2-4183-4597-a2c9-0ac2c5a23ff0','email','openid-connect','oidc-usermodel-attribute-mapper',NULL,'d62952fc-d729-489e-badb-fbb40f43b173'),('49ac45a0-0c18-42bc-8af1-da3c5e39d576','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'4da027e2-70d1-4d8d-97bc-c04a3bc539f2'),('57ae84ab-74ad-4c5a-be86-5a6edef90f20','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'efde2333-07f6-4958-92cb-0ab294ab3608'),('59d276da-26cf-43ac-b302-1d85a49f73d0','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'85e41bf7-c0a1-423c-8343-f7e469f1dc0d'),('5b4bd9a6-5c24-42dc-95b4-ec5db96aa207','acr loa level','openid-connect','oidc-acr-mapper',NULL,'9f030e0c-8646-4059-b6d4-6afe7f7eec1d'),('615c0db7-3a2e-4590-b169-e9307f951bf7','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'be66596b-24f0-467a-8b96-9ae473ca50e8'),('62a526c0-5c99-4bb7-94c8-ace1013dc883','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'d62952fc-d729-489e-badb-fbb40f43b173'),('64f6429c-34c3-4ab8-96cf-159bdb6b615e','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'e9a6dec0-7e3e-4110-be2e-01cd0ba96871'),('6cc29f21-73b5-4f60-a4f5-59c6a8763a78','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'efde2333-07f6-4958-92cb-0ab294ab3608'),('6df4a205-7b3e-4115-a939-9983e4daa364','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'b30c9eee-9b69-4526-ab2a-550681b831fb'),('7658ddcc-06aa-4574-93e1-962e6d7db099','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'b30c9eee-9b69-4526-ab2a-550681b831fb'),('7ccd8de9-d097-483e-b921-4929b39592bd','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'efde2333-07f6-4958-92cb-0ab294ab3608'),('938d4609-0210-4bec-80c1-23f60b11a353','full name','openid-connect','oidc-full-name-mapper',NULL,'efde2333-07f6-4958-92cb-0ab294ab3608'),('9c220299-14ec-412c-887c-0ba7d03b3d7b','username','openid-connect','oidc-usermodel-attribute-mapper',NULL,'b30c9eee-9b69-4526-ab2a-550681b831fb'),('9d0bf80c-f9ad-4923-a164-ce2b832b9700','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'b30c9eee-9b69-4526-ab2a-550681b831fb'),('a2b8eb0a-a39c-44e6-afe8-ad3da45d0a03','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'b30c9eee-9b69-4526-ab2a-550681b831fb'),('a31c711e-0ee0-42c6-8437-537857df580f','username','openid-connect','oidc-usermodel-attribute-mapper',NULL,'efde2333-07f6-4958-92cb-0ab294ab3608'),('a46305f5-5808-43ab-92a8-16c60b644762','upn','openid-connect','oidc-usermodel-attribute-mapper',NULL,'6b238264-b8e6-4459-ab6a-6b5bc6859109'),('adee2e87-869b-4f19-bf9a-fc423c85c39d','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'311ae408-59ec-4073-8968-2b2e89581704'),('b3a0e85d-104a-4172-86b4-d9e419c899a5','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'d9dd3a6c-796e-4995-b977-4827df5c4ef8'),('b838fe8e-2473-4bf0-aa36-029ea8acd6c0','role list','saml','saml-role-list-mapper',NULL,'bdfd3973-f196-466c-ab2b-73fafd4bc24e'),('bbf91be1-b2eb-4684-9e74-2d51cc564dea','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'efde2333-07f6-4958-92cb-0ab294ab3608'),('bf1f8113-4ac5-4e6b-b8cc-5581e423a366','email','openid-connect','oidc-usermodel-attribute-mapper',NULL,'be66596b-24f0-467a-8b96-9ae473ca50e8'),('c772e014-ba75-4f1a-abdc-4060b8c2493a','role list','saml','saml-role-list-mapper',NULL,'a79dbbf9-956d-45bc-906b-96155c01e9ac'),('c982b2dd-5c95-4bbd-b2ec-ffd1801e9762','Client ID','openid-connect','oidc-usersessionmodel-note-mapper','d26e729e-9d1e-42cb-b4f0-e81f3d252ff3',NULL),('cabd5db9-0c0c-4b59-bc6a-acc389bd9fe4','family name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'efde2333-07f6-4958-92cb-0ab294ab3608'),('cce0a7d7-377d-4837-bed5-aed7a4ec7f48','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'d9dd3a6c-796e-4995-b977-4827df5c4ef8'),('d0767327-8e7a-489b-af0e-58cf60f828b2','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'311ae408-59ec-4073-8968-2b2e89581704'),('d3f5b31c-9cd1-4098-b06e-44840989d126','family name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'b30c9eee-9b69-4526-ab2a-550681b831fb'),('d484bdd8-c724-448b-a005-4f1837260eb2','given name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'b30c9eee-9b69-4526-ab2a-550681b831fb'),('d489f1f1-5ea6-41fd-b3e5-e2f211eef31f','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'efde2333-07f6-4958-92cb-0ab294ab3608'),('d706fd38-4eb6-4268-9d5c-fad419fba9de','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'b30c9eee-9b69-4526-ab2a-550681b831fb'),('dccf77d1-6bb2-42b7-931c-60f09ce99413','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'b30c9eee-9b69-4526-ab2a-550681b831fb'),('df9b321a-dc03-4a9f-8604-cc6706df04ec','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'85e41bf7-c0a1-423c-8343-f7e469f1dc0d'),('e09a0e75-aa48-4387-806d-a705d22d5003','given name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'efde2333-07f6-4958-92cb-0ab294ab3608'),('e4859aa2-4fd1-49c7-a321-dd98c4cdbb06','address','openid-connect','oidc-address-mapper',NULL,'3c6a8f99-32ea-49da-814b-41ad1857363d'),('e926d116-8788-49bc-b2f2-b05ef1f02d1d','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'efde2333-07f6-4958-92cb-0ab294ab3608'),('ebeeaff0-6c74-443c-b319-389cd3a03531','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'4da027e2-70d1-4d8d-97bc-c04a3bc539f2'),('f9112c6c-f70d-4789-9954-94340d7a0451','Client IP Address','openid-connect','oidc-usersessionmodel-note-mapper','d26e729e-9d1e-42cb-b4f0-e81f3d252ff3',NULL),('fb4dd332-e45b-479a-b2b6-c9bd0008f5a5','upn','openid-connect','oidc-usermodel-attribute-mapper',NULL,'e9a6dec0-7e3e-4110-be2e-01cd0ba96871'),('fd2a3952-2c6b-401a-843b-8074b3b0e16f','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'b30c9eee-9b69-4526-ab2a-550681b831fb');
/*!40000 ALTER TABLE `PROTOCOL_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROTOCOL_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `PROTOCOL_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PROTOCOL_MAPPER_CONFIG` (
  `PROTOCOL_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`PROTOCOL_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_PMCONFIG` FOREIGN KEY (`PROTOCOL_MAPPER_ID`) REFERENCES `PROTOCOL_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROTOCOL_MAPPER_CONFIG`
--

LOCK TABLES `PROTOCOL_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `PROTOCOL_MAPPER_CONFIG` DISABLE KEYS */;
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('015ac641-82f6-4d18-98cc-697fb54700ff','true','access.token.claim'),('015ac641-82f6-4d18-98cc-697fb54700ff','true','introspection.token.claim'),('01ae0ddc-6927-4de8-96b3-af9de820b9c5','true','access.token.claim'),('01ae0ddc-6927-4de8-96b3-af9de820b9c5','true','introspection.token.claim'),('030aed45-abfb-442a-ac5d-c5a7543b1a72','true','access.token.claim'),('030aed45-abfb-442a-ac5d-c5a7543b1a72','nickname','claim.name'),('030aed45-abfb-442a-ac5d-c5a7543b1a72','true','id.token.claim'),('030aed45-abfb-442a-ac5d-c5a7543b1a72','true','introspection.token.claim'),('030aed45-abfb-442a-ac5d-c5a7543b1a72','String','jsonType.label'),('030aed45-abfb-442a-ac5d-c5a7543b1a72','nickname','user.attribute'),('030aed45-abfb-442a-ac5d-c5a7543b1a72','true','userinfo.token.claim'),('04af8b5d-10b5-4aa1-b2e2-b02c62c2246f','true','access.token.claim'),('04af8b5d-10b5-4aa1-b2e2-b02c62c2246f','updated_at','claim.name'),('04af8b5d-10b5-4aa1-b2e2-b02c62c2246f','true','id.token.claim'),('04af8b5d-10b5-4aa1-b2e2-b02c62c2246f','true','introspection.token.claim'),('04af8b5d-10b5-4aa1-b2e2-b02c62c2246f','long','jsonType.label'),('04af8b5d-10b5-4aa1-b2e2-b02c62c2246f','updatedAt','user.attribute'),('04af8b5d-10b5-4aa1-b2e2-b02c62c2246f','true','userinfo.token.claim'),('096eabca-d571-4da7-a4fe-f039686e23a6','true','access.token.claim'),('096eabca-d571-4da7-a4fe-f039686e23a6','birthdate','claim.name'),('096eabca-d571-4da7-a4fe-f039686e23a6','true','id.token.claim'),('096eabca-d571-4da7-a4fe-f039686e23a6','true','introspection.token.claim'),('096eabca-d571-4da7-a4fe-f039686e23a6','String','jsonType.label'),('096eabca-d571-4da7-a4fe-f039686e23a6','birthdate','user.attribute'),('096eabca-d571-4da7-a4fe-f039686e23a6','true','userinfo.token.claim'),('11b75150-7c59-4423-a8ab-7225c8c5145f','true','access.token.claim'),('11b75150-7c59-4423-a8ab-7225c8c5145f','true','id.token.claim'),('11b75150-7c59-4423-a8ab-7225c8c5145f','true','introspection.token.claim'),('139e2c01-fad1-4605-bb02-7e8334e32024','true','access.token.claim'),('139e2c01-fad1-4605-bb02-7e8334e32024','birthdate','claim.name'),('139e2c01-fad1-4605-bb02-7e8334e32024','true','id.token.claim'),('139e2c01-fad1-4605-bb02-7e8334e32024','true','introspection.token.claim'),('139e2c01-fad1-4605-bb02-7e8334e32024','String','jsonType.label'),('139e2c01-fad1-4605-bb02-7e8334e32024','birthdate','user.attribute'),('139e2c01-fad1-4605-bb02-7e8334e32024','true','userinfo.token.claim'),('14dc53f8-4031-4e98-a6fb-fbaea980bd76','true','access.token.claim'),('14dc53f8-4031-4e98-a6fb-fbaea980bd76','true','id.token.claim'),('14dc53f8-4031-4e98-a6fb-fbaea980bd76','true','introspection.token.claim'),('14dc53f8-4031-4e98-a6fb-fbaea980bd76','true','userinfo.token.claim'),('16a4281e-8adf-40fd-b526-7b82a64565e5','true','access.token.claim'),('16a4281e-8adf-40fd-b526-7b82a64565e5','gender','claim.name'),('16a4281e-8adf-40fd-b526-7b82a64565e5','true','id.token.claim'),('16a4281e-8adf-40fd-b526-7b82a64565e5','true','introspection.token.claim'),('16a4281e-8adf-40fd-b526-7b82a64565e5','String','jsonType.label'),('16a4281e-8adf-40fd-b526-7b82a64565e5','gender','user.attribute'),('16a4281e-8adf-40fd-b526-7b82a64565e5','true','userinfo.token.claim'),('22dc66c6-f5de-4c66-9013-ea3964b92130','true','access.token.claim'),('22dc66c6-f5de-4c66-9013-ea3964b92130','locale','claim.name'),('22dc66c6-f5de-4c66-9013-ea3964b92130','true','id.token.claim'),('22dc66c6-f5de-4c66-9013-ea3964b92130','true','introspection.token.claim'),('22dc66c6-f5de-4c66-9013-ea3964b92130','String','jsonType.label'),('22dc66c6-f5de-4c66-9013-ea3964b92130','locale','user.attribute'),('22dc66c6-f5de-4c66-9013-ea3964b92130','true','userinfo.token.claim'),('2b8feb3d-ba90-4006-b27c-c6d8d02ca313','true','access.token.claim'),('2b8feb3d-ba90-4006-b27c-c6d8d02ca313','middle_name','claim.name'),('2b8feb3d-ba90-4006-b27c-c6d8d02ca313','true','id.token.claim'),('2b8feb3d-ba90-4006-b27c-c6d8d02ca313','true','introspection.token.claim'),('2b8feb3d-ba90-4006-b27c-c6d8d02ca313','String','jsonType.label'),('2b8feb3d-ba90-4006-b27c-c6d8d02ca313','middleName','user.attribute'),('2b8feb3d-ba90-4006-b27c-c6d8d02ca313','true','userinfo.token.claim'),('3009250d-49ff-4392-b0c2-4a378734d2eb','true','access.token.claim'),('3009250d-49ff-4392-b0c2-4a378734d2eb','realm_access.roles','claim.name'),('3009250d-49ff-4392-b0c2-4a378734d2eb','true','introspection.token.claim'),('3009250d-49ff-4392-b0c2-4a378734d2eb','String','jsonType.label'),('3009250d-49ff-4392-b0c2-4a378734d2eb','true','multivalued'),('3009250d-49ff-4392-b0c2-4a378734d2eb','foo','user.attribute'),('30b9656a-08c6-4a34-b9bd-5483b5c96808','true','access.token.claim'),('30b9656a-08c6-4a34-b9bd-5483b5c96808','groups','claim.name'),('30b9656a-08c6-4a34-b9bd-5483b5c96808','true','id.token.claim'),('30b9656a-08c6-4a34-b9bd-5483b5c96808','true','introspection.token.claim'),('30b9656a-08c6-4a34-b9bd-5483b5c96808','String','jsonType.label'),('30b9656a-08c6-4a34-b9bd-5483b5c96808','true','multivalued'),('30b9656a-08c6-4a34-b9bd-5483b5c96808','foo','user.attribute'),('3aa3074a-5dda-4062-b01b-8504bdf8cd84','true','access.token.claim'),('3aa3074a-5dda-4062-b01b-8504bdf8cd84','clientHost','claim.name'),('3aa3074a-5dda-4062-b01b-8504bdf8cd84','true','id.token.claim'),('3aa3074a-5dda-4062-b01b-8504bdf8cd84','true','introspection.token.claim'),('3aa3074a-5dda-4062-b01b-8504bdf8cd84','String','jsonType.label'),('3aa3074a-5dda-4062-b01b-8504bdf8cd84','clientHost','user.session.note'),('4189e347-0632-4441-b2a3-7b3cfad7c7d2','true','access.token.claim'),('4189e347-0632-4441-b2a3-7b3cfad7c7d2','picture','claim.name'),('4189e347-0632-4441-b2a3-7b3cfad7c7d2','true','id.token.claim'),('4189e347-0632-4441-b2a3-7b3cfad7c7d2','true','introspection.token.claim'),('4189e347-0632-4441-b2a3-7b3cfad7c7d2','String','jsonType.label'),('4189e347-0632-4441-b2a3-7b3cfad7c7d2','picture','user.attribute'),('4189e347-0632-4441-b2a3-7b3cfad7c7d2','true','userinfo.token.claim'),('481932a2-0fe7-413f-8172-73b416358f23','true','access.token.claim'),('481932a2-0fe7-413f-8172-73b416358f23','true','introspection.token.claim'),('48431044-7919-4e9e-9c12-066318528b6e','true','access.token.claim'),('48431044-7919-4e9e-9c12-066318528b6e','true','id.token.claim'),('48431044-7919-4e9e-9c12-066318528b6e','true','introspection.token.claim'),('48431044-7919-4e9e-9c12-066318528b6e','country','user.attribute.country'),('48431044-7919-4e9e-9c12-066318528b6e','formatted','user.attribute.formatted'),('48431044-7919-4e9e-9c12-066318528b6e','locality','user.attribute.locality'),('48431044-7919-4e9e-9c12-066318528b6e','postal_code','user.attribute.postal_code'),('48431044-7919-4e9e-9c12-066318528b6e','region','user.attribute.region'),('48431044-7919-4e9e-9c12-066318528b6e','street','user.attribute.street'),('48431044-7919-4e9e-9c12-066318528b6e','true','userinfo.token.claim'),('489e692a-e1ee-4e5a-88f2-9a06132bffb2','true','access.token.claim'),('489e692a-e1ee-4e5a-88f2-9a06132bffb2','locale','claim.name'),('489e692a-e1ee-4e5a-88f2-9a06132bffb2','true','id.token.claim'),('489e692a-e1ee-4e5a-88f2-9a06132bffb2','true','introspection.token.claim'),('489e692a-e1ee-4e5a-88f2-9a06132bffb2','String','jsonType.label'),('489e692a-e1ee-4e5a-88f2-9a06132bffb2','locale','user.attribute'),('489e692a-e1ee-4e5a-88f2-9a06132bffb2','true','userinfo.token.claim'),('496fdec2-4183-4597-a2c9-0ac2c5a23ff0','true','access.token.claim'),('496fdec2-4183-4597-a2c9-0ac2c5a23ff0','email','claim.name'),('496fdec2-4183-4597-a2c9-0ac2c5a23ff0','true','id.token.claim'),('496fdec2-4183-4597-a2c9-0ac2c5a23ff0','true','introspection.token.claim'),('496fdec2-4183-4597-a2c9-0ac2c5a23ff0','String','jsonType.label'),('496fdec2-4183-4597-a2c9-0ac2c5a23ff0','email','user.attribute'),('496fdec2-4183-4597-a2c9-0ac2c5a23ff0','true','userinfo.token.claim'),('49ac45a0-0c18-42bc-8af1-da3c5e39d576','true','access.token.claim'),('49ac45a0-0c18-42bc-8af1-da3c5e39d576','resource_access.${client_id}.roles','claim.name'),('49ac45a0-0c18-42bc-8af1-da3c5e39d576','true','introspection.token.claim'),('49ac45a0-0c18-42bc-8af1-da3c5e39d576','String','jsonType.label'),('49ac45a0-0c18-42bc-8af1-da3c5e39d576','true','multivalued'),('49ac45a0-0c18-42bc-8af1-da3c5e39d576','foo','user.attribute'),('57ae84ab-74ad-4c5a-be86-5a6edef90f20','true','access.token.claim'),('57ae84ab-74ad-4c5a-be86-5a6edef90f20','profile','claim.name'),('57ae84ab-74ad-4c5a-be86-5a6edef90f20','true','id.token.claim'),('57ae84ab-74ad-4c5a-be86-5a6edef90f20','true','introspection.token.claim'),('57ae84ab-74ad-4c5a-be86-5a6edef90f20','String','jsonType.label'),('57ae84ab-74ad-4c5a-be86-5a6edef90f20','profile','user.attribute'),('57ae84ab-74ad-4c5a-be86-5a6edef90f20','true','userinfo.token.claim'),('59d276da-26cf-43ac-b302-1d85a49f73d0','true','access.token.claim'),('59d276da-26cf-43ac-b302-1d85a49f73d0','phone_number_verified','claim.name'),('59d276da-26cf-43ac-b302-1d85a49f73d0','true','id.token.claim'),('59d276da-26cf-43ac-b302-1d85a49f73d0','true','introspection.token.claim'),('59d276da-26cf-43ac-b302-1d85a49f73d0','boolean','jsonType.label'),('59d276da-26cf-43ac-b302-1d85a49f73d0','phoneNumberVerified','user.attribute'),('59d276da-26cf-43ac-b302-1d85a49f73d0','true','userinfo.token.claim'),('5b4bd9a6-5c24-42dc-95b4-ec5db96aa207','true','access.token.claim'),('5b4bd9a6-5c24-42dc-95b4-ec5db96aa207','true','id.token.claim'),('5b4bd9a6-5c24-42dc-95b4-ec5db96aa207','true','introspection.token.claim'),('615c0db7-3a2e-4590-b169-e9307f951bf7','true','access.token.claim'),('615c0db7-3a2e-4590-b169-e9307f951bf7','email_verified','claim.name'),('615c0db7-3a2e-4590-b169-e9307f951bf7','true','id.token.claim'),('615c0db7-3a2e-4590-b169-e9307f951bf7','true','introspection.token.claim'),('615c0db7-3a2e-4590-b169-e9307f951bf7','boolean','jsonType.label'),('615c0db7-3a2e-4590-b169-e9307f951bf7','emailVerified','user.attribute'),('615c0db7-3a2e-4590-b169-e9307f951bf7','true','userinfo.token.claim'),('62a526c0-5c99-4bb7-94c8-ace1013dc883','true','access.token.claim'),('62a526c0-5c99-4bb7-94c8-ace1013dc883','email_verified','claim.name'),('62a526c0-5c99-4bb7-94c8-ace1013dc883','true','id.token.claim'),('62a526c0-5c99-4bb7-94c8-ace1013dc883','true','introspection.token.claim'),('62a526c0-5c99-4bb7-94c8-ace1013dc883','boolean','jsonType.label'),('62a526c0-5c99-4bb7-94c8-ace1013dc883','emailVerified','user.attribute'),('62a526c0-5c99-4bb7-94c8-ace1013dc883','true','userinfo.token.claim'),('64f6429c-34c3-4ab8-96cf-159bdb6b615e','true','access.token.claim'),('64f6429c-34c3-4ab8-96cf-159bdb6b615e','groups','claim.name'),('64f6429c-34c3-4ab8-96cf-159bdb6b615e','true','id.token.claim'),('64f6429c-34c3-4ab8-96cf-159bdb6b615e','true','introspection.token.claim'),('64f6429c-34c3-4ab8-96cf-159bdb6b615e','String','jsonType.label'),('64f6429c-34c3-4ab8-96cf-159bdb6b615e','true','multivalued'),('64f6429c-34c3-4ab8-96cf-159bdb6b615e','foo','user.attribute'),('6cc29f21-73b5-4f60-a4f5-59c6a8763a78','true','access.token.claim'),('6cc29f21-73b5-4f60-a4f5-59c6a8763a78','picture','claim.name'),('6cc29f21-73b5-4f60-a4f5-59c6a8763a78','true','id.token.claim'),('6cc29f21-73b5-4f60-a4f5-59c6a8763a78','true','introspection.token.claim'),('6cc29f21-73b5-4f60-a4f5-59c6a8763a78','String','jsonType.label'),('6cc29f21-73b5-4f60-a4f5-59c6a8763a78','picture','user.attribute'),('6cc29f21-73b5-4f60-a4f5-59c6a8763a78','true','userinfo.token.claim'),('6df4a205-7b3e-4115-a939-9983e4daa364','true','access.token.claim'),('6df4a205-7b3e-4115-a939-9983e4daa364','gender','claim.name'),('6df4a205-7b3e-4115-a939-9983e4daa364','true','id.token.claim'),('6df4a205-7b3e-4115-a939-9983e4daa364','true','introspection.token.claim'),('6df4a205-7b3e-4115-a939-9983e4daa364','String','jsonType.label'),('6df4a205-7b3e-4115-a939-9983e4daa364','gender','user.attribute'),('6df4a205-7b3e-4115-a939-9983e4daa364','true','userinfo.token.claim'),('7658ddcc-06aa-4574-93e1-962e6d7db099','true','access.token.claim'),('7658ddcc-06aa-4574-93e1-962e6d7db099','locale','claim.name'),('7658ddcc-06aa-4574-93e1-962e6d7db099','true','id.token.claim'),('7658ddcc-06aa-4574-93e1-962e6d7db099','true','introspection.token.claim'),('7658ddcc-06aa-4574-93e1-962e6d7db099','String','jsonType.label'),('7658ddcc-06aa-4574-93e1-962e6d7db099','locale','user.attribute'),('7658ddcc-06aa-4574-93e1-962e6d7db099','true','userinfo.token.claim'),('7ccd8de9-d097-483e-b921-4929b39592bd','true','access.token.claim'),('7ccd8de9-d097-483e-b921-4929b39592bd','website','claim.name'),('7ccd8de9-d097-483e-b921-4929b39592bd','true','id.token.claim'),('7ccd8de9-d097-483e-b921-4929b39592bd','true','introspection.token.claim'),('7ccd8de9-d097-483e-b921-4929b39592bd','String','jsonType.label'),('7ccd8de9-d097-483e-b921-4929b39592bd','website','user.attribute'),('7ccd8de9-d097-483e-b921-4929b39592bd','true','userinfo.token.claim'),('938d4609-0210-4bec-80c1-23f60b11a353','true','access.token.claim'),('938d4609-0210-4bec-80c1-23f60b11a353','true','id.token.claim'),('938d4609-0210-4bec-80c1-23f60b11a353','true','introspection.token.claim'),('938d4609-0210-4bec-80c1-23f60b11a353','true','userinfo.token.claim'),('9c220299-14ec-412c-887c-0ba7d03b3d7b','true','access.token.claim'),('9c220299-14ec-412c-887c-0ba7d03b3d7b','preferred_username','claim.name'),('9c220299-14ec-412c-887c-0ba7d03b3d7b','true','id.token.claim'),('9c220299-14ec-412c-887c-0ba7d03b3d7b','true','introspection.token.claim'),('9c220299-14ec-412c-887c-0ba7d03b3d7b','String','jsonType.label'),('9c220299-14ec-412c-887c-0ba7d03b3d7b','username','user.attribute'),('9c220299-14ec-412c-887c-0ba7d03b3d7b','true','userinfo.token.claim'),('9d0bf80c-f9ad-4923-a164-ce2b832b9700','true','access.token.claim'),('9d0bf80c-f9ad-4923-a164-ce2b832b9700','nickname','claim.name'),('9d0bf80c-f9ad-4923-a164-ce2b832b9700','true','id.token.claim'),('9d0bf80c-f9ad-4923-a164-ce2b832b9700','true','introspection.token.claim'),('9d0bf80c-f9ad-4923-a164-ce2b832b9700','String','jsonType.label'),('9d0bf80c-f9ad-4923-a164-ce2b832b9700','nickname','user.attribute'),('9d0bf80c-f9ad-4923-a164-ce2b832b9700','true','userinfo.token.claim'),('a2b8eb0a-a39c-44e6-afe8-ad3da45d0a03','true','access.token.claim'),('a2b8eb0a-a39c-44e6-afe8-ad3da45d0a03','website','claim.name'),('a2b8eb0a-a39c-44e6-afe8-ad3da45d0a03','true','id.token.claim'),('a2b8eb0a-a39c-44e6-afe8-ad3da45d0a03','true','introspection.token.claim'),('a2b8eb0a-a39c-44e6-afe8-ad3da45d0a03','String','jsonType.label'),('a2b8eb0a-a39c-44e6-afe8-ad3da45d0a03','website','user.attribute'),('a2b8eb0a-a39c-44e6-afe8-ad3da45d0a03','true','userinfo.token.claim'),('a31c711e-0ee0-42c6-8437-537857df580f','true','access.token.claim'),('a31c711e-0ee0-42c6-8437-537857df580f','preferred_username','claim.name'),('a31c711e-0ee0-42c6-8437-537857df580f','true','id.token.claim'),('a31c711e-0ee0-42c6-8437-537857df580f','true','introspection.token.claim'),('a31c711e-0ee0-42c6-8437-537857df580f','String','jsonType.label'),('a31c711e-0ee0-42c6-8437-537857df580f','username','user.attribute'),('a31c711e-0ee0-42c6-8437-537857df580f','true','userinfo.token.claim'),('a46305f5-5808-43ab-92a8-16c60b644762','true','access.token.claim'),('a46305f5-5808-43ab-92a8-16c60b644762','upn','claim.name'),('a46305f5-5808-43ab-92a8-16c60b644762','true','id.token.claim'),('a46305f5-5808-43ab-92a8-16c60b644762','true','introspection.token.claim'),('a46305f5-5808-43ab-92a8-16c60b644762','String','jsonType.label'),('a46305f5-5808-43ab-92a8-16c60b644762','username','user.attribute'),('a46305f5-5808-43ab-92a8-16c60b644762','true','userinfo.token.claim'),('adee2e87-869b-4f19-bf9a-fc423c85c39d','true','access.token.claim'),('adee2e87-869b-4f19-bf9a-fc423c85c39d','resource_access.${client_id}.roles','claim.name'),('adee2e87-869b-4f19-bf9a-fc423c85c39d','true','introspection.token.claim'),('adee2e87-869b-4f19-bf9a-fc423c85c39d','String','jsonType.label'),('adee2e87-869b-4f19-bf9a-fc423c85c39d','true','multivalued'),('adee2e87-869b-4f19-bf9a-fc423c85c39d','foo','user.attribute'),('b3a0e85d-104a-4172-86b4-d9e419c899a5','true','access.token.claim'),('b3a0e85d-104a-4172-86b4-d9e419c899a5','phone_number','claim.name'),('b3a0e85d-104a-4172-86b4-d9e419c899a5','true','id.token.claim'),('b3a0e85d-104a-4172-86b4-d9e419c899a5','true','introspection.token.claim'),('b3a0e85d-104a-4172-86b4-d9e419c899a5','String','jsonType.label'),('b3a0e85d-104a-4172-86b4-d9e419c899a5','phoneNumber','user.attribute'),('b3a0e85d-104a-4172-86b4-d9e419c899a5','true','userinfo.token.claim'),('b838fe8e-2473-4bf0-aa36-029ea8acd6c0','Role','attribute.name'),('b838fe8e-2473-4bf0-aa36-029ea8acd6c0','Basic','attribute.nameformat'),('b838fe8e-2473-4bf0-aa36-029ea8acd6c0','false','single'),('bbf91be1-b2eb-4684-9e74-2d51cc564dea','true','access.token.claim'),('bbf91be1-b2eb-4684-9e74-2d51cc564dea','zoneinfo','claim.name'),('bbf91be1-b2eb-4684-9e74-2d51cc564dea','true','id.token.claim'),('bbf91be1-b2eb-4684-9e74-2d51cc564dea','true','introspection.token.claim'),('bbf91be1-b2eb-4684-9e74-2d51cc564dea','String','jsonType.label'),('bbf91be1-b2eb-4684-9e74-2d51cc564dea','zoneinfo','user.attribute'),('bbf91be1-b2eb-4684-9e74-2d51cc564dea','true','userinfo.token.claim'),('bf1f8113-4ac5-4e6b-b8cc-5581e423a366','true','access.token.claim'),('bf1f8113-4ac5-4e6b-b8cc-5581e423a366','email','claim.name'),('bf1f8113-4ac5-4e6b-b8cc-5581e423a366','true','id.token.claim'),('bf1f8113-4ac5-4e6b-b8cc-5581e423a366','true','introspection.token.claim'),('bf1f8113-4ac5-4e6b-b8cc-5581e423a366','String','jsonType.label'),('bf1f8113-4ac5-4e6b-b8cc-5581e423a366','email','user.attribute'),('bf1f8113-4ac5-4e6b-b8cc-5581e423a366','true','userinfo.token.claim'),('c772e014-ba75-4f1a-abdc-4060b8c2493a','Role','attribute.name'),('c772e014-ba75-4f1a-abdc-4060b8c2493a','Basic','attribute.nameformat'),('c772e014-ba75-4f1a-abdc-4060b8c2493a','false','single'),('c982b2dd-5c95-4bbd-b2ec-ffd1801e9762','true','access.token.claim'),('c982b2dd-5c95-4bbd-b2ec-ffd1801e9762','client_id','claim.name'),('c982b2dd-5c95-4bbd-b2ec-ffd1801e9762','true','id.token.claim'),('c982b2dd-5c95-4bbd-b2ec-ffd1801e9762','true','introspection.token.claim'),('c982b2dd-5c95-4bbd-b2ec-ffd1801e9762','String','jsonType.label'),('c982b2dd-5c95-4bbd-b2ec-ffd1801e9762','client_id','user.session.note'),('cabd5db9-0c0c-4b59-bc6a-acc389bd9fe4','true','access.token.claim'),('cabd5db9-0c0c-4b59-bc6a-acc389bd9fe4','family_name','claim.name'),('cabd5db9-0c0c-4b59-bc6a-acc389bd9fe4','true','id.token.claim'),('cabd5db9-0c0c-4b59-bc6a-acc389bd9fe4','true','introspection.token.claim'),('cabd5db9-0c0c-4b59-bc6a-acc389bd9fe4','String','jsonType.label'),('cabd5db9-0c0c-4b59-bc6a-acc389bd9fe4','lastName','user.attribute'),('cabd5db9-0c0c-4b59-bc6a-acc389bd9fe4','true','userinfo.token.claim'),('cce0a7d7-377d-4837-bed5-aed7a4ec7f48','true','access.token.claim'),('cce0a7d7-377d-4837-bed5-aed7a4ec7f48','phone_number_verified','claim.name'),('cce0a7d7-377d-4837-bed5-aed7a4ec7f48','true','id.token.claim'),('cce0a7d7-377d-4837-bed5-aed7a4ec7f48','true','introspection.token.claim'),('cce0a7d7-377d-4837-bed5-aed7a4ec7f48','boolean','jsonType.label'),('cce0a7d7-377d-4837-bed5-aed7a4ec7f48','phoneNumberVerified','user.attribute'),('cce0a7d7-377d-4837-bed5-aed7a4ec7f48','true','userinfo.token.claim'),('d0767327-8e7a-489b-af0e-58cf60f828b2','true','access.token.claim'),('d0767327-8e7a-489b-af0e-58cf60f828b2','true','introspection.token.claim'),('d3f5b31c-9cd1-4098-b06e-44840989d126','true','access.token.claim'),('d3f5b31c-9cd1-4098-b06e-44840989d126','family_name','claim.name'),('d3f5b31c-9cd1-4098-b06e-44840989d126','true','id.token.claim'),('d3f5b31c-9cd1-4098-b06e-44840989d126','true','introspection.token.claim'),('d3f5b31c-9cd1-4098-b06e-44840989d126','String','jsonType.label'),('d3f5b31c-9cd1-4098-b06e-44840989d126','lastName','user.attribute'),('d3f5b31c-9cd1-4098-b06e-44840989d126','true','userinfo.token.claim'),('d484bdd8-c724-448b-a005-4f1837260eb2','true','access.token.claim'),('d484bdd8-c724-448b-a005-4f1837260eb2','given_name','claim.name'),('d484bdd8-c724-448b-a005-4f1837260eb2','true','id.token.claim'),('d484bdd8-c724-448b-a005-4f1837260eb2','true','introspection.token.claim'),('d484bdd8-c724-448b-a005-4f1837260eb2','String','jsonType.label'),('d484bdd8-c724-448b-a005-4f1837260eb2','firstName','user.attribute'),('d484bdd8-c724-448b-a005-4f1837260eb2','true','userinfo.token.claim'),('d489f1f1-5ea6-41fd-b3e5-e2f211eef31f','true','access.token.claim'),('d489f1f1-5ea6-41fd-b3e5-e2f211eef31f','middle_name','claim.name'),('d489f1f1-5ea6-41fd-b3e5-e2f211eef31f','true','id.token.claim'),('d489f1f1-5ea6-41fd-b3e5-e2f211eef31f','true','introspection.token.claim'),('d489f1f1-5ea6-41fd-b3e5-e2f211eef31f','String','jsonType.label'),('d489f1f1-5ea6-41fd-b3e5-e2f211eef31f','middleName','user.attribute'),('d489f1f1-5ea6-41fd-b3e5-e2f211eef31f','true','userinfo.token.claim'),('d706fd38-4eb6-4268-9d5c-fad419fba9de','true','access.token.claim'),('d706fd38-4eb6-4268-9d5c-fad419fba9de','zoneinfo','claim.name'),('d706fd38-4eb6-4268-9d5c-fad419fba9de','true','id.token.claim'),('d706fd38-4eb6-4268-9d5c-fad419fba9de','true','introspection.token.claim'),('d706fd38-4eb6-4268-9d5c-fad419fba9de','String','jsonType.label'),('d706fd38-4eb6-4268-9d5c-fad419fba9de','zoneinfo','user.attribute'),('d706fd38-4eb6-4268-9d5c-fad419fba9de','true','userinfo.token.claim'),('dccf77d1-6bb2-42b7-931c-60f09ce99413','true','access.token.claim'),('dccf77d1-6bb2-42b7-931c-60f09ce99413','updated_at','claim.name'),('dccf77d1-6bb2-42b7-931c-60f09ce99413','true','id.token.claim'),('dccf77d1-6bb2-42b7-931c-60f09ce99413','true','introspection.token.claim'),('dccf77d1-6bb2-42b7-931c-60f09ce99413','long','jsonType.label'),('dccf77d1-6bb2-42b7-931c-60f09ce99413','updatedAt','user.attribute'),('dccf77d1-6bb2-42b7-931c-60f09ce99413','true','userinfo.token.claim'),('df9b321a-dc03-4a9f-8604-cc6706df04ec','true','access.token.claim'),('df9b321a-dc03-4a9f-8604-cc6706df04ec','phone_number','claim.name'),('df9b321a-dc03-4a9f-8604-cc6706df04ec','true','id.token.claim'),('df9b321a-dc03-4a9f-8604-cc6706df04ec','true','introspection.token.claim'),('df9b321a-dc03-4a9f-8604-cc6706df04ec','String','jsonType.label'),('df9b321a-dc03-4a9f-8604-cc6706df04ec','phoneNumber','user.attribute'),('df9b321a-dc03-4a9f-8604-cc6706df04ec','true','userinfo.token.claim'),('e09a0e75-aa48-4387-806d-a705d22d5003','true','access.token.claim'),('e09a0e75-aa48-4387-806d-a705d22d5003','given_name','claim.name'),('e09a0e75-aa48-4387-806d-a705d22d5003','true','id.token.claim'),('e09a0e75-aa48-4387-806d-a705d22d5003','true','introspection.token.claim'),('e09a0e75-aa48-4387-806d-a705d22d5003','String','jsonType.label'),('e09a0e75-aa48-4387-806d-a705d22d5003','firstName','user.attribute'),('e09a0e75-aa48-4387-806d-a705d22d5003','true','userinfo.token.claim'),('e4859aa2-4fd1-49c7-a321-dd98c4cdbb06','true','access.token.claim'),('e4859aa2-4fd1-49c7-a321-dd98c4cdbb06','true','id.token.claim'),('e4859aa2-4fd1-49c7-a321-dd98c4cdbb06','true','introspection.token.claim'),('e4859aa2-4fd1-49c7-a321-dd98c4cdbb06','country','user.attribute.country'),('e4859aa2-4fd1-49c7-a321-dd98c4cdbb06','formatted','user.attribute.formatted'),('e4859aa2-4fd1-49c7-a321-dd98c4cdbb06','locality','user.attribute.locality'),('e4859aa2-4fd1-49c7-a321-dd98c4cdbb06','postal_code','user.attribute.postal_code'),('e4859aa2-4fd1-49c7-a321-dd98c4cdbb06','region','user.attribute.region'),('e4859aa2-4fd1-49c7-a321-dd98c4cdbb06','street','user.attribute.street'),('e4859aa2-4fd1-49c7-a321-dd98c4cdbb06','true','userinfo.token.claim'),('e926d116-8788-49bc-b2f2-b05ef1f02d1d','true','access.token.claim'),('e926d116-8788-49bc-b2f2-b05ef1f02d1d','locale','claim.name'),('e926d116-8788-49bc-b2f2-b05ef1f02d1d','true','id.token.claim'),('e926d116-8788-49bc-b2f2-b05ef1f02d1d','true','introspection.token.claim'),('e926d116-8788-49bc-b2f2-b05ef1f02d1d','String','jsonType.label'),('e926d116-8788-49bc-b2f2-b05ef1f02d1d','locale','user.attribute'),('e926d116-8788-49bc-b2f2-b05ef1f02d1d','true','userinfo.token.claim'),('ebeeaff0-6c74-443c-b319-389cd3a03531','true','access.token.claim'),('ebeeaff0-6c74-443c-b319-389cd3a03531','realm_access.roles','claim.name'),('ebeeaff0-6c74-443c-b319-389cd3a03531','true','introspection.token.claim'),('ebeeaff0-6c74-443c-b319-389cd3a03531','String','jsonType.label'),('ebeeaff0-6c74-443c-b319-389cd3a03531','true','multivalued'),('ebeeaff0-6c74-443c-b319-389cd3a03531','foo','user.attribute'),('f9112c6c-f70d-4789-9954-94340d7a0451','true','access.token.claim'),('f9112c6c-f70d-4789-9954-94340d7a0451','clientAddress','claim.name'),('f9112c6c-f70d-4789-9954-94340d7a0451','true','id.token.claim'),('f9112c6c-f70d-4789-9954-94340d7a0451','true','introspection.token.claim'),('f9112c6c-f70d-4789-9954-94340d7a0451','String','jsonType.label'),('f9112c6c-f70d-4789-9954-94340d7a0451','clientAddress','user.session.note'),('fb4dd332-e45b-479a-b2b6-c9bd0008f5a5','true','access.token.claim'),('fb4dd332-e45b-479a-b2b6-c9bd0008f5a5','upn','claim.name'),('fb4dd332-e45b-479a-b2b6-c9bd0008f5a5','true','id.token.claim'),('fb4dd332-e45b-479a-b2b6-c9bd0008f5a5','true','introspection.token.claim'),('fb4dd332-e45b-479a-b2b6-c9bd0008f5a5','String','jsonType.label'),('fb4dd332-e45b-479a-b2b6-c9bd0008f5a5','username','user.attribute'),('fb4dd332-e45b-479a-b2b6-c9bd0008f5a5','true','userinfo.token.claim'),('fd2a3952-2c6b-401a-843b-8074b3b0e16f','true','access.token.claim'),('fd2a3952-2c6b-401a-843b-8074b3b0e16f','profile','claim.name'),('fd2a3952-2c6b-401a-843b-8074b3b0e16f','true','id.token.claim'),('fd2a3952-2c6b-401a-843b-8074b3b0e16f','true','introspection.token.claim'),('fd2a3952-2c6b-401a-843b-8074b3b0e16f','String','jsonType.label'),('fd2a3952-2c6b-401a-843b-8074b3b0e16f','profile','user.attribute'),('fd2a3952-2c6b-401a-843b-8074b3b0e16f','true','userinfo.token.claim');
/*!40000 ALTER TABLE `PROTOCOL_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM`
--

DROP TABLE IF EXISTS `REALM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM` (
  `ID` varchar(36) NOT NULL,
  `ACCESS_CODE_LIFESPAN` int DEFAULT NULL,
  `USER_ACTION_LIFESPAN` int DEFAULT NULL,
  `ACCESS_TOKEN_LIFESPAN` int DEFAULT NULL,
  `ACCOUNT_THEME` varchar(255) DEFAULT NULL,
  `ADMIN_THEME` varchar(255) DEFAULT NULL,
  `EMAIL_THEME` varchar(255) DEFAULT NULL,
  `ENABLED` tinyint NOT NULL DEFAULT '0',
  `EVENTS_ENABLED` tinyint NOT NULL DEFAULT '0',
  `EVENTS_EXPIRATION` bigint DEFAULT NULL,
  `LOGIN_THEME` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int DEFAULT NULL,
  `PASSWORD_POLICY` text,
  `REGISTRATION_ALLOWED` tinyint NOT NULL DEFAULT '0',
  `REMEMBER_ME` tinyint NOT NULL DEFAULT '0',
  `RESET_PASSWORD_ALLOWED` tinyint NOT NULL DEFAULT '0',
  `SOCIAL` tinyint NOT NULL DEFAULT '0',
  `SSL_REQUIRED` varchar(255) DEFAULT NULL,
  `SSO_IDLE_TIMEOUT` int DEFAULT NULL,
  `SSO_MAX_LIFESPAN` int DEFAULT NULL,
  `UPDATE_PROFILE_ON_SOC_LOGIN` tinyint NOT NULL DEFAULT '0',
  `VERIFY_EMAIL` tinyint NOT NULL DEFAULT '0',
  `MASTER_ADMIN_CLIENT` varchar(36) DEFAULT NULL,
  `LOGIN_LIFESPAN` int DEFAULT NULL,
  `INTERNATIONALIZATION_ENABLED` tinyint NOT NULL DEFAULT '0',
  `DEFAULT_LOCALE` varchar(255) DEFAULT NULL,
  `REG_EMAIL_AS_USERNAME` tinyint NOT NULL DEFAULT '0',
  `ADMIN_EVENTS_ENABLED` tinyint NOT NULL DEFAULT '0',
  `ADMIN_EVENTS_DETAILS_ENABLED` tinyint NOT NULL DEFAULT '0',
  `EDIT_USERNAME_ALLOWED` tinyint NOT NULL DEFAULT '0',
  `OTP_POLICY_COUNTER` int DEFAULT '0',
  `OTP_POLICY_WINDOW` int DEFAULT '1',
  `OTP_POLICY_PERIOD` int DEFAULT '30',
  `OTP_POLICY_DIGITS` int DEFAULT '6',
  `OTP_POLICY_ALG` varchar(36) DEFAULT 'HmacSHA1',
  `OTP_POLICY_TYPE` varchar(36) DEFAULT 'totp',
  `BROWSER_FLOW` varchar(36) DEFAULT NULL,
  `REGISTRATION_FLOW` varchar(36) DEFAULT NULL,
  `DIRECT_GRANT_FLOW` varchar(36) DEFAULT NULL,
  `RESET_CREDENTIALS_FLOW` varchar(36) DEFAULT NULL,
  `CLIENT_AUTH_FLOW` varchar(36) DEFAULT NULL,
  `OFFLINE_SESSION_IDLE_TIMEOUT` int DEFAULT '0',
  `REVOKE_REFRESH_TOKEN` tinyint NOT NULL DEFAULT '0',
  `ACCESS_TOKEN_LIFE_IMPLICIT` int DEFAULT '0',
  `LOGIN_WITH_EMAIL_ALLOWED` tinyint NOT NULL DEFAULT '1',
  `DUPLICATE_EMAILS_ALLOWED` tinyint NOT NULL DEFAULT '0',
  `DOCKER_AUTH_FLOW` varchar(36) DEFAULT NULL,
  `REFRESH_TOKEN_MAX_REUSE` int DEFAULT '0',
  `ALLOW_USER_MANAGED_ACCESS` tinyint NOT NULL DEFAULT '0',
  `SSO_MAX_LIFESPAN_REMEMBER_ME` int NOT NULL,
  `SSO_IDLE_TIMEOUT_REMEMBER_ME` int NOT NULL,
  `DEFAULT_ROLE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_ORVSDMLA56612EAEFIQ6WL5OI` (`NAME`),
  KEY `IDX_REALM_MASTER_ADM_CLI` (`MASTER_ADMIN_CLIENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM`
--

LOCK TABLES `REALM` WRITE;
/*!40000 ALTER TABLE `REALM` DISABLE KEYS */;
INSERT INTO `REALM` VALUES ('65fa274b-8112-4346-8bcc-e604adb24617',60,300,60,NULL,NULL,NULL,1,0,0,NULL,'master',0,NULL,0,0,0,0,'EXTERNAL',1800,36000,0,0,'379d9d40-4028-4535-a129-64c4c14ac7a3',1800,0,NULL,0,0,0,0,0,1,30,6,'HmacSHA1','totp','3c21ccbd-8fee-4d8d-992b-90dab54c14c5','963ee2c4-4600-4193-b627-8782b554b3c1','66c1e7c3-6aea-49db-a64e-336117df6913','69b0819b-cbc3-4c97-a5aa-0e34063b7b24','532a1abe-7d86-46e3-92d1-f1dbc17e835b',2592000,0,900,1,0,'21a87d18-c986-4f4b-bbc4-51675fc88e66',0,0,0,0,'90c38817-2158-409b-8860-55842c48ca5e'),('c50626a4-a4f7-42b1-ba55-fdfd2fae3469',60,300,1800,NULL,NULL,NULL,1,0,0,NULL,'ou-graduation-realm',0,NULL,0,0,0,0,'EXTERNAL',1800,36000,0,0,'04479882-1cfd-4949-839b-920b808aa3b8',1800,0,NULL,0,0,0,0,0,1,30,6,'HmacSHA1','totp','9c4a9c97-d0f8-48e7-9af1-2f1f40c24706','f222b384-eab9-4670-b1c0-4966a2a5b3bc','e49bb44b-44c2-483b-939d-0d2a2aae8b10','fab96004-9cfb-4c51-8b3e-604f6a18d926','3270b25e-ce0a-4cc2-9bc3-4aa10ae3fe55',2592000,0,900,1,0,'994db1b9-4086-4d03-a39a-8e2b98e7c6ef',0,0,0,0,'6b55880d-7680-401b-924c-e510d9d62fe1');
/*!40000 ALTER TABLE `REALM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_ATTRIBUTE`
--

DROP TABLE IF EXISTS `REALM_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_ATTRIBUTE` (
  `NAME` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  PRIMARY KEY (`NAME`,`REALM_ID`),
  KEY `IDX_REALM_ATTR_REALM` (`REALM_ID`),
  CONSTRAINT `FK_8SHXD6L3E9ATQUKACXGPFFPTW` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_ATTRIBUTE`
--

LOCK TABLES `REALM_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `REALM_ATTRIBUTE` DISABLE KEYS */;
INSERT INTO `REALM_ATTRIBUTE` VALUES ('_browser_header.contentSecurityPolicy','65fa274b-8112-4346-8bcc-e604adb24617','frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';'),('_browser_header.contentSecurityPolicy','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';'),('_browser_header.contentSecurityPolicyReportOnly','65fa274b-8112-4346-8bcc-e604adb24617',''),('_browser_header.contentSecurityPolicyReportOnly','c50626a4-a4f7-42b1-ba55-fdfd2fae3469',''),('_browser_header.referrerPolicy','65fa274b-8112-4346-8bcc-e604adb24617','no-referrer'),('_browser_header.referrerPolicy','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','no-referrer'),('_browser_header.strictTransportSecurity','65fa274b-8112-4346-8bcc-e604adb24617','max-age=31536000; includeSubDomains'),('_browser_header.strictTransportSecurity','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','max-age=31536000; includeSubDomains'),('_browser_header.xContentTypeOptions','65fa274b-8112-4346-8bcc-e604adb24617','nosniff'),('_browser_header.xContentTypeOptions','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','nosniff'),('_browser_header.xFrameOptions','65fa274b-8112-4346-8bcc-e604adb24617','SAMEORIGIN'),('_browser_header.xFrameOptions','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','SAMEORIGIN'),('_browser_header.xRobotsTag','65fa274b-8112-4346-8bcc-e604adb24617','none'),('_browser_header.xRobotsTag','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','none'),('_browser_header.xXSSProtection','65fa274b-8112-4346-8bcc-e604adb24617','1; mode=block'),('_browser_header.xXSSProtection','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','1; mode=block'),('acr.loa.map','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','{}'),('actionTokenGeneratedByAdminLifespan','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','43200'),('actionTokenGeneratedByUserLifespan','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','300'),('actionTokenGeneratedByUserLifespan.execute-actions','c50626a4-a4f7-42b1-ba55-fdfd2fae3469',''),('actionTokenGeneratedByUserLifespan.idp-verify-account-via-email','c50626a4-a4f7-42b1-ba55-fdfd2fae3469',''),('actionTokenGeneratedByUserLifespan.reset-credentials','c50626a4-a4f7-42b1-ba55-fdfd2fae3469',''),('actionTokenGeneratedByUserLifespan.verify-email','c50626a4-a4f7-42b1-ba55-fdfd2fae3469',''),('bruteForceProtected','65fa274b-8112-4346-8bcc-e604adb24617','false'),('bruteForceProtected','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','false'),('cibaAuthRequestedUserHint','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','login_hint'),('cibaBackchannelTokenDeliveryMode','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','poll'),('cibaExpiresIn','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','120'),('cibaInterval','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','5'),('client-policies.policies','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','{\"policies\":[]}'),('client-policies.profiles','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','{\"profiles\":[]}'),('clientOfflineSessionIdleTimeout','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','0'),('clientOfflineSessionMaxLifespan','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','0'),('clientSessionIdleTimeout','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','0'),('clientSessionMaxLifespan','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','0'),('defaultSignatureAlgorithm','65fa274b-8112-4346-8bcc-e604adb24617','RS256'),('defaultSignatureAlgorithm','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','RS256'),('displayName','65fa274b-8112-4346-8bcc-e604adb24617','Keycloak'),('displayName','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','OU Graduation Realm'),('displayNameHtml','65fa274b-8112-4346-8bcc-e604adb24617','<div class=\"kc-logo-text\"><span>Keycloak</span></div>'),('displayNameHtml','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','OU Graduation Admin'),('failureFactor','65fa274b-8112-4346-8bcc-e604adb24617','30'),('failureFactor','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','30'),('firstBrokerLoginFlowId','65fa274b-8112-4346-8bcc-e604adb24617','6e5c609f-eeb8-442a-a358-8fa31ec7cc51'),('firstBrokerLoginFlowId','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','745088a0-e575-4786-91f7-6712d35419e9'),('frontendUrl','c50626a4-a4f7-42b1-ba55-fdfd2fae3469',''),('maxDeltaTimeSeconds','65fa274b-8112-4346-8bcc-e604adb24617','43200'),('maxDeltaTimeSeconds','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','43200'),('maxFailureWaitSeconds','65fa274b-8112-4346-8bcc-e604adb24617','900'),('maxFailureWaitSeconds','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','900'),('maxTemporaryLockouts','65fa274b-8112-4346-8bcc-e604adb24617','0'),('maxTemporaryLockouts','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','0'),('minimumQuickLoginWaitSeconds','65fa274b-8112-4346-8bcc-e604adb24617','60'),('minimumQuickLoginWaitSeconds','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','60'),('oauth2DeviceCodeLifespan','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','600'),('oauth2DevicePollingInterval','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','5'),('offlineSessionMaxLifespan','65fa274b-8112-4346-8bcc-e604adb24617','5184000'),('offlineSessionMaxLifespan','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','5184000'),('offlineSessionMaxLifespanEnabled','65fa274b-8112-4346-8bcc-e604adb24617','false'),('offlineSessionMaxLifespanEnabled','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','false'),('parRequestUriLifespan','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','60'),('permanentLockout','65fa274b-8112-4346-8bcc-e604adb24617','false'),('permanentLockout','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','false'),('quickLoginCheckMilliSeconds','65fa274b-8112-4346-8bcc-e604adb24617','1000'),('quickLoginCheckMilliSeconds','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','1000'),('realmReusableOtpCode','65fa274b-8112-4346-8bcc-e604adb24617','false'),('realmReusableOtpCode','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','false'),('shortVerificationUri','c50626a4-a4f7-42b1-ba55-fdfd2fae3469',''),('waitIncrementSeconds','65fa274b-8112-4346-8bcc-e604adb24617','60'),('waitIncrementSeconds','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','60'),('webAuthnPolicyAttestationConveyancePreference','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','not specified'),('webAuthnPolicyAttestationConveyancePreferencePasswordless','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','not specified'),('webAuthnPolicyAuthenticatorAttachment','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','not specified'),('webAuthnPolicyAuthenticatorAttachmentPasswordless','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','not specified'),('webAuthnPolicyAvoidSameAuthenticatorRegister','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','false'),('webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','false'),('webAuthnPolicyCreateTimeout','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','0'),('webAuthnPolicyCreateTimeoutPasswordless','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','0'),('webAuthnPolicyRequireResidentKey','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','not specified'),('webAuthnPolicyRequireResidentKeyPasswordless','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','not specified'),('webAuthnPolicyRpEntityName','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','keycloak'),('webAuthnPolicyRpEntityNamePasswordless','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','keycloak'),('webAuthnPolicyRpId','c50626a4-a4f7-42b1-ba55-fdfd2fae3469',''),('webAuthnPolicyRpIdPasswordless','c50626a4-a4f7-42b1-ba55-fdfd2fae3469',''),('webAuthnPolicySignatureAlgorithms','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','ES256'),('webAuthnPolicySignatureAlgorithmsPasswordless','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','ES256'),('webAuthnPolicyUserVerificationRequirement','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','not specified'),('webAuthnPolicyUserVerificationRequirementPasswordless','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','not specified');
/*!40000 ALTER TABLE `REALM_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_DEFAULT_GROUPS`
--

DROP TABLE IF EXISTS `REALM_DEFAULT_GROUPS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_DEFAULT_GROUPS` (
  `REALM_ID` varchar(36) NOT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`GROUP_ID`),
  UNIQUE KEY `CON_GROUP_ID_DEF_GROUPS` (`GROUP_ID`),
  KEY `IDX_REALM_DEF_GRP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_DEF_GROUPS_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_DEFAULT_GROUPS`
--

LOCK TABLES `REALM_DEFAULT_GROUPS` WRITE;
/*!40000 ALTER TABLE `REALM_DEFAULT_GROUPS` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_DEFAULT_GROUPS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_ENABLED_EVENT_TYPES`
--

DROP TABLE IF EXISTS `REALM_ENABLED_EVENT_TYPES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_ENABLED_EVENT_TYPES` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_EVT_TYPES_REALM` (`REALM_ID`),
  CONSTRAINT `FK_H846O4H0W8EPX5NWEDRF5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_ENABLED_EVENT_TYPES`
--

LOCK TABLES `REALM_ENABLED_EVENT_TYPES` WRITE;
/*!40000 ALTER TABLE `REALM_ENABLED_EVENT_TYPES` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_ENABLED_EVENT_TYPES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_EVENTS_LISTENERS`
--

DROP TABLE IF EXISTS `REALM_EVENTS_LISTENERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_EVENTS_LISTENERS` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_EVT_LIST_REALM` (`REALM_ID`),
  CONSTRAINT `FK_H846O4H0W8EPX5NXEV9F5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_EVENTS_LISTENERS`
--

LOCK TABLES `REALM_EVENTS_LISTENERS` WRITE;
/*!40000 ALTER TABLE `REALM_EVENTS_LISTENERS` DISABLE KEYS */;
INSERT INTO `REALM_EVENTS_LISTENERS` VALUES ('65fa274b-8112-4346-8bcc-e604adb24617','jboss-logging'),('c50626a4-a4f7-42b1-ba55-fdfd2fae3469','jboss-logging');
/*!40000 ALTER TABLE `REALM_EVENTS_LISTENERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_LOCALIZATIONS`
--

DROP TABLE IF EXISTS `REALM_LOCALIZATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_LOCALIZATIONS` (
  `REALM_ID` varchar(255) NOT NULL,
  `LOCALE` varchar(255) NOT NULL,
  `TEXTS` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`REALM_ID`,`LOCALE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_LOCALIZATIONS`
--

LOCK TABLES `REALM_LOCALIZATIONS` WRITE;
/*!40000 ALTER TABLE `REALM_LOCALIZATIONS` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_LOCALIZATIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_REQUIRED_CREDENTIAL`
--

DROP TABLE IF EXISTS `REALM_REQUIRED_CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_REQUIRED_CREDENTIAL` (
  `TYPE` varchar(255) NOT NULL,
  `FORM_LABEL` varchar(255) DEFAULT NULL,
  `INPUT` tinyint NOT NULL DEFAULT '0',
  `SECRET` tinyint NOT NULL DEFAULT '0',
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`TYPE`),
  CONSTRAINT `FK_5HG65LYBEVAVKQFKI3KPONH9V` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_REQUIRED_CREDENTIAL`
--

LOCK TABLES `REALM_REQUIRED_CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `REALM_REQUIRED_CREDENTIAL` DISABLE KEYS */;
INSERT INTO `REALM_REQUIRED_CREDENTIAL` VALUES ('password','password',1,1,'65fa274b-8112-4346-8bcc-e604adb24617'),('password','password',1,1,'c50626a4-a4f7-42b1-ba55-fdfd2fae3469');
/*!40000 ALTER TABLE `REALM_REQUIRED_CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_SMTP_CONFIG`
--

DROP TABLE IF EXISTS `REALM_SMTP_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_SMTP_CONFIG` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`NAME`),
  CONSTRAINT `FK_70EJ8XDXGXD0B9HH6180IRR0O` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_SMTP_CONFIG`
--

LOCK TABLES `REALM_SMTP_CONFIG` WRITE;
/*!40000 ALTER TABLE `REALM_SMTP_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_SMTP_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_SUPPORTED_LOCALES`
--

DROP TABLE IF EXISTS `REALM_SUPPORTED_LOCALES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_SUPPORTED_LOCALES` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_SUPP_LOCAL_REALM` (`REALM_ID`),
  CONSTRAINT `FK_SUPPORTED_LOCALES_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_SUPPORTED_LOCALES`
--

LOCK TABLES `REALM_SUPPORTED_LOCALES` WRITE;
/*!40000 ALTER TABLE `REALM_SUPPORTED_LOCALES` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_SUPPORTED_LOCALES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REDIRECT_URIS`
--

DROP TABLE IF EXISTS `REDIRECT_URIS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REDIRECT_URIS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`VALUE`),
  KEY `IDX_REDIR_URI_CLIENT` (`CLIENT_ID`),
  CONSTRAINT `FK_1BURS8PB4OUJ97H5WUPPAHV9F` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REDIRECT_URIS`
--

LOCK TABLES `REDIRECT_URIS` WRITE;
/*!40000 ALTER TABLE `REDIRECT_URIS` DISABLE KEYS */;
INSERT INTO `REDIRECT_URIS` VALUES ('3e22a15e-acef-4f19-b2a0-3afca2189471','/admin/master/console/*'),('4bfe7132-eb47-4062-8535-c5fd91bc499f','/realms/master/account/*'),('56ba2ab7-e961-46ab-8c94-c838c4017250','/realms/ou-graduation-realm/account/*'),('5805f5dc-5eef-427b-b52c-beb0fc639fff','/realms/master/account/*'),('b33e20b2-62d3-4afa-a5f1-18ff3234bafd','/admin/ou-graduation-realm/console/*'),('c3ac2c21-6ba6-4dc6-85b0-65fe3c6891bb','/realms/ou-graduation-realm/account/*'),('d26e729e-9d1e-42cb-b4f0-e81f3d252ff3','/*');
/*!40000 ALTER TABLE `REDIRECT_URIS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUIRED_ACTION_CONFIG`
--

DROP TABLE IF EXISTS `REQUIRED_ACTION_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REQUIRED_ACTION_CONFIG` (
  `REQUIRED_ACTION_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`REQUIRED_ACTION_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIRED_ACTION_CONFIG`
--

LOCK TABLES `REQUIRED_ACTION_CONFIG` WRITE;
/*!40000 ALTER TABLE `REQUIRED_ACTION_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `REQUIRED_ACTION_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUIRED_ACTION_PROVIDER`
--

DROP TABLE IF EXISTS `REQUIRED_ACTION_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REQUIRED_ACTION_PROVIDER` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `ENABLED` tinyint NOT NULL DEFAULT '0',
  `DEFAULT_ACTION` tinyint NOT NULL DEFAULT '0',
  `PROVIDER_ID` varchar(255) DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_REQ_ACT_PROV_REALM` (`REALM_ID`),
  CONSTRAINT `FK_REQ_ACT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIRED_ACTION_PROVIDER`
--

LOCK TABLES `REQUIRED_ACTION_PROVIDER` WRITE;
/*!40000 ALTER TABLE `REQUIRED_ACTION_PROVIDER` DISABLE KEYS */;
INSERT INTO `REQUIRED_ACTION_PROVIDER` VALUES ('1b64f51d-c1cc-40ed-a4d0-12b797f7e92f','UPDATE_PASSWORD','Update Password','65fa274b-8112-4346-8bcc-e604adb24617',1,0,'UPDATE_PASSWORD',30),('2244fb17-7f7e-4e6e-85a1-e4b72ce0409b','UPDATE_PASSWORD','Update Password','c50626a4-a4f7-42b1-ba55-fdfd2fae3469',1,0,'UPDATE_PASSWORD',30),('34390dab-1160-4a0d-a3e0-60f26c614681','TERMS_AND_CONDITIONS','Terms and Conditions','c50626a4-a4f7-42b1-ba55-fdfd2fae3469',0,0,'TERMS_AND_CONDITIONS',20),('3508d80a-4a41-49e6-8489-e4e7477703a5','VERIFY_PROFILE','Verify Profile','c50626a4-a4f7-42b1-ba55-fdfd2fae3469',1,0,'VERIFY_PROFILE',90),('3fc61e9a-1854-4609-923b-e86a2d7d2071','webauthn-register-passwordless','Webauthn Register Passwordless','c50626a4-a4f7-42b1-ba55-fdfd2fae3469',1,0,'webauthn-register-passwordless',80),('6086af73-ce35-448c-a6e9-7a3fe55a8ad2','update_user_locale','Update User Locale','c50626a4-a4f7-42b1-ba55-fdfd2fae3469',1,0,'update_user_locale',1000),('6e0b7923-f08b-4f92-8794-7c71537a80ae','VERIFY_PROFILE','Verify Profile','65fa274b-8112-4346-8bcc-e604adb24617',1,0,'VERIFY_PROFILE',90),('6eb43611-ba34-4de0-b3eb-5afd84d53ad7','VERIFY_EMAIL','Verify Email','65fa274b-8112-4346-8bcc-e604adb24617',1,0,'VERIFY_EMAIL',50),('7b18080a-0421-4de1-ac6c-6e7491d12ea3','VERIFY_EMAIL','Verify Email','c50626a4-a4f7-42b1-ba55-fdfd2fae3469',1,0,'VERIFY_EMAIL',50),('8fcce239-9b2f-498e-ab42-e621ef38674a','CONFIGURE_TOTP','Configure OTP','65fa274b-8112-4346-8bcc-e604adb24617',1,0,'CONFIGURE_TOTP',10),('9776fa73-7444-4e5f-af9c-8dbd8f263c65','TERMS_AND_CONDITIONS','Terms and Conditions','65fa274b-8112-4346-8bcc-e604adb24617',0,0,'TERMS_AND_CONDITIONS',20),('b313bc14-612f-497a-a703-374065e84de5','UPDATE_PROFILE','Update Profile','65fa274b-8112-4346-8bcc-e604adb24617',1,0,'UPDATE_PROFILE',40),('b42d2379-45d6-4ba3-abcc-2b01ff7fa28e','webauthn-register-passwordless','Webauthn Register Passwordless','65fa274b-8112-4346-8bcc-e604adb24617',1,0,'webauthn-register-passwordless',80),('c04ac014-3289-4a8a-94db-594502df9ba9','webauthn-register','Webauthn Register','65fa274b-8112-4346-8bcc-e604adb24617',1,0,'webauthn-register',70),('cae1abc5-3cab-4868-8103-aeaedee0c6a7','delete_account','Delete Account','65fa274b-8112-4346-8bcc-e604adb24617',0,0,'delete_account',60),('cbd3bba2-e4c3-4592-845c-2cbfa4f12f6e','UPDATE_PROFILE','Update Profile','c50626a4-a4f7-42b1-ba55-fdfd2fae3469',1,0,'UPDATE_PROFILE',40),('d26d1ebd-21ca-4200-8c20-32a8776ef2fe','CONFIGURE_TOTP','Configure OTP','c50626a4-a4f7-42b1-ba55-fdfd2fae3469',1,0,'CONFIGURE_TOTP',10),('d85b0323-43e7-4cfb-8d2f-d8f9093b9d65','webauthn-register','Webauthn Register','c50626a4-a4f7-42b1-ba55-fdfd2fae3469',1,0,'webauthn-register',70),('d9e158da-9d07-4bc5-a31d-3a7d4e977c33','update_user_locale','Update User Locale','65fa274b-8112-4346-8bcc-e604adb24617',1,0,'update_user_locale',1000),('ddf358da-53c4-4d5e-9e5b-9487509e179a','delete_account','Delete Account','c50626a4-a4f7-42b1-ba55-fdfd2fae3469',0,0,'delete_account',60);
/*!40000 ALTER TABLE `REQUIRED_ACTION_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_ATTRIBUTE`
--

DROP TABLE IF EXISTS `RESOURCE_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `RESOURCE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_5HRM2VLF9QL5FU022KQEPOVBR` (`RESOURCE_ID`),
  CONSTRAINT `FK_5HRM2VLF9QL5FU022KQEPOVBR` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_ATTRIBUTE`
--

LOCK TABLES `RESOURCE_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_POLICY`
--

DROP TABLE IF EXISTS `RESOURCE_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_POLICY` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`POLICY_ID`),
  KEY `IDX_RES_POLICY_POLICY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRPOS53XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRPP213XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_POLICY`
--

LOCK TABLES `RESOURCE_POLICY` WRITE;
/*!40000 ALTER TABLE `RESOURCE_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SCOPE`
--

DROP TABLE IF EXISTS `RESOURCE_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SCOPE` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`SCOPE_ID`),
  KEY `IDX_RES_SCOPE_SCOPE` (`SCOPE_ID`),
  CONSTRAINT `FK_FRSRPOS13XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRPS213XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SCOPE`
--

LOCK TABLES `RESOURCE_SCOPE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER` (
  `ID` varchar(36) NOT NULL,
  `ALLOW_RS_REMOTE_MGMT` tinyint NOT NULL DEFAULT '0',
  `POLICY_ENFORCE_MODE` tinyint DEFAULT NULL,
  `DECISION_STRATEGY` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER`
--

LOCK TABLES `RESOURCE_SERVER` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER` DISABLE KEYS */;
INSERT INTO `RESOURCE_SERVER` VALUES ('d26e729e-9d1e-42cb-b4f0-e81f3d252ff3',1,0,1);
/*!40000 ALTER TABLE `RESOURCE_SERVER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_PERM_TICKET`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_PERM_TICKET`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_PERM_TICKET` (
  `ID` varchar(36) NOT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  `REQUESTER` varchar(255) DEFAULT NULL,
  `CREATED_TIMESTAMP` bigint NOT NULL,
  `GRANTED_TIMESTAMP` bigint DEFAULT NULL,
  `RESOURCE_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSR6T700S9V50BU18WS5PMT` (`OWNER`,`REQUESTER`,`RESOURCE_SERVER_ID`,`RESOURCE_ID`,`SCOPE_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG82SSPMT` (`RESOURCE_SERVER_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG83SSPMT` (`RESOURCE_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG84SSPMT` (`SCOPE_ID`),
  KEY `FK_FRSRPO2128CX4WNKOG82SSRFY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG82SSPMT` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG83SSPMT` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG84SSPMT` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`),
  CONSTRAINT `FK_FRSRPO2128CX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_PERM_TICKET`
--

LOCK TABLES `RESOURCE_SERVER_PERM_TICKET` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_PERM_TICKET` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_PERM_TICKET` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_POLICY`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_POLICY` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `TYPE` varchar(255) NOT NULL,
  `DECISION_STRATEGY` tinyint DEFAULT NULL,
  `LOGIC` tinyint DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSRPT700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SERV_POL_RES_SERV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRPO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_POLICY`
--

LOCK TABLES `RESOURCE_SERVER_POLICY` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_POLICY` DISABLE KEYS */;
INSERT INTO `RESOURCE_SERVER_POLICY` VALUES ('549298c7-0fac-400d-9573-88933ddec66a','Default Permission','A permission that applies to the default resource type','resource',1,0,'d26e729e-9d1e-42cb-b4f0-e81f3d252ff3',NULL),('5f63b963-8de4-4ced-93fe-3fbfb71004d9','Default Policy','A policy that grants access only for users within this realm','js',0,0,'d26e729e-9d1e-42cb-b4f0-e81f3d252ff3',NULL);
/*!40000 ALTER TABLE `RESOURCE_SERVER_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_RESOURCE`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_RESOURCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_RESOURCE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `ICON_URI` varchar(255) DEFAULT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `OWNER_MANAGED_ACCESS` tinyint NOT NULL DEFAULT '0',
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSR6T700S9V50BU18WS5HA6` (`NAME`,`OWNER`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SRV_RES_RES_SRV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_RESOURCE`
--

LOCK TABLES `RESOURCE_SERVER_RESOURCE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_RESOURCE` DISABLE KEYS */;
INSERT INTO `RESOURCE_SERVER_RESOURCE` VALUES ('16558156-cfaf-4628-a128-3b7db5090c08','Default Resource','urn:ou-graduation-client:resources:default',NULL,'d26e729e-9d1e-42cb-b4f0-e81f3d252ff3','d26e729e-9d1e-42cb-b4f0-e81f3d252ff3',0,NULL);
/*!40000 ALTER TABLE `RESOURCE_SERVER_RESOURCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_SCOPE`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_SCOPE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `ICON_URI` varchar(255) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSRST700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SRV_SCOPE_RES_SRV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRSO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_SCOPE`
--

LOCK TABLES `RESOURCE_SERVER_SCOPE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_URIS`
--

DROP TABLE IF EXISTS `RESOURCE_URIS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_URIS` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`VALUE`),
  CONSTRAINT `FK_RESOURCE_SERVER_URIS` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_URIS`
--

LOCK TABLES `RESOURCE_URIS` WRITE;
/*!40000 ALTER TABLE `RESOURCE_URIS` DISABLE KEYS */;
INSERT INTO `RESOURCE_URIS` VALUES ('16558156-cfaf-4628-a128-3b7db5090c08','/*');
/*!40000 ALTER TABLE `RESOURCE_URIS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ROLE_ATTRIBUTE`
--

DROP TABLE IF EXISTS `ROLE_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ROLE_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ROLE_ATTRIBUTE` (`ROLE_ID`),
  CONSTRAINT `FK_ROLE_ATTRIBUTE_ID` FOREIGN KEY (`ROLE_ID`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ROLE_ATTRIBUTE`
--

LOCK TABLES `ROLE_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `ROLE_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `ROLE_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SCOPE_MAPPING`
--

DROP TABLE IF EXISTS `SCOPE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SCOPE_MAPPING` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`ROLE_ID`),
  KEY `IDX_SCOPE_MAPPING_ROLE` (`ROLE_ID`),
  CONSTRAINT `FK_OUSE064PLMLR732LXJCN1Q5F1` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCOPE_MAPPING`
--

LOCK TABLES `SCOPE_MAPPING` WRITE;
/*!40000 ALTER TABLE `SCOPE_MAPPING` DISABLE KEYS */;
INSERT INTO `SCOPE_MAPPING` VALUES ('56ba2ab7-e961-46ab-8c94-c838c4017250','4651c60b-a1f6-40de-b59f-d52f364ff66c'),('5805f5dc-5eef-427b-b52c-beb0fc639fff','9990fd33-133e-4f83-b387-e7c01241b405'),('5805f5dc-5eef-427b-b52c-beb0fc639fff','cc78cd3e-5fdc-408f-9434-9a4d4e92b1a1'),('56ba2ab7-e961-46ab-8c94-c838c4017250','e3f892c2-7bb5-4108-9d78-a9aca8665d27');
/*!40000 ALTER TABLE `SCOPE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SCOPE_POLICY`
--

DROP TABLE IF EXISTS `SCOPE_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SCOPE_POLICY` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`POLICY_ID`),
  KEY `IDX_SCOPE_POLICY_POLICY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRASP13XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`),
  CONSTRAINT `FK_FRSRPASS3XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCOPE_POLICY`
--

LOCK TABLES `SCOPE_POLICY` WRITE;
/*!40000 ALTER TABLE `SCOPE_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `SCOPE_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USERNAME_LOGIN_FAILURE`
--

DROP TABLE IF EXISTS `USERNAME_LOGIN_FAILURE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USERNAME_LOGIN_FAILURE` (
  `REALM_ID` varchar(36) NOT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `FAILED_LOGIN_NOT_BEFORE` int DEFAULT NULL,
  `LAST_FAILURE` bigint DEFAULT NULL,
  `LAST_IP_FAILURE` varchar(255) DEFAULT NULL,
  `NUM_FAILURES` int DEFAULT NULL,
  PRIMARY KEY (`REALM_ID`,`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USERNAME_LOGIN_FAILURE`
--

LOCK TABLES `USERNAME_LOGIN_FAILURE` WRITE;
/*!40000 ALTER TABLE `USERNAME_LOGIN_FAILURE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USERNAME_LOGIN_FAILURE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ATTRIBUTE`
--

DROP TABLE IF EXISTS `USER_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_ATTRIBUTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `USER_ID` varchar(36) NOT NULL,
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  `LONG_VALUE_HASH` binary(64) DEFAULT NULL,
  `LONG_VALUE_HASH_LOWER_CASE` binary(64) DEFAULT NULL,
  `LONG_VALUE` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  PRIMARY KEY (`ID`),
  KEY `IDX_USER_ATTRIBUTE` (`USER_ID`),
  KEY `IDX_USER_ATTRIBUTE_NAME` (`NAME`,`VALUE`),
  KEY `USER_ATTR_LONG_VALUES` (`LONG_VALUE_HASH`,`NAME`),
  KEY `USER_ATTR_LONG_VALUES_LOWER_CASE` (`LONG_VALUE_HASH_LOWER_CASE`,`NAME`),
  CONSTRAINT `FK_5HRM2VLF9QL5FU043KQEPOVBR` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ATTRIBUTE`
--

LOCK TABLES `USER_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `USER_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_CONSENT`
--

DROP TABLE IF EXISTS `USER_CONSENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_CONSENT` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(36) NOT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `LAST_UPDATED_DATE` bigint DEFAULT NULL,
  `CLIENT_STORAGE_PROVIDER` varchar(36) DEFAULT NULL,
  `EXTERNAL_CLIENT_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_JKUWUVD56ONTGSUHOGM8UEWRT` (`CLIENT_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`,`USER_ID`),
  KEY `IDX_USER_CONSENT` (`USER_ID`),
  CONSTRAINT `FK_GRNTCSNT_USER` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_CONSENT`
--

LOCK TABLES `USER_CONSENT` WRITE;
/*!40000 ALTER TABLE `USER_CONSENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_CONSENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_CONSENT_CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `USER_CONSENT_CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_CONSENT_CLIENT_SCOPE` (
  `USER_CONSENT_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`SCOPE_ID`),
  KEY `IDX_USCONSENT_CLSCOPE` (`USER_CONSENT_ID`),
  CONSTRAINT `FK_GRNTCSNT_CLSC_USC` FOREIGN KEY (`USER_CONSENT_ID`) REFERENCES `USER_CONSENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_CONSENT_CLIENT_SCOPE`
--

LOCK TABLES `USER_CONSENT_CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `USER_CONSENT_CLIENT_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_CONSENT_CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ENTITY`
--

DROP TABLE IF EXISTS `USER_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `EMAIL_CONSTRAINT` varchar(255) DEFAULT NULL,
  `EMAIL_VERIFIED` tinyint NOT NULL DEFAULT '0',
  `ENABLED` tinyint NOT NULL DEFAULT '0',
  `FEDERATION_LINK` varchar(255) DEFAULT NULL,
  `FIRST_NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `LAST_NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `CREATED_TIMESTAMP` bigint DEFAULT NULL,
  `SERVICE_ACCOUNT_CLIENT_LINK` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_DYKN684SL8UP1CRFEI6ECKHD7` (`REALM_ID`,`EMAIL_CONSTRAINT`),
  UNIQUE KEY `UK_RU8TT6T700S9V50BU18WS5HA6` (`REALM_ID`,`USERNAME`),
  KEY `IDX_USER_EMAIL` (`EMAIL`),
  KEY `IDX_USER_SERVICE_ACCOUNT` (`REALM_ID`,`SERVICE_ACCOUNT_CLIENT_LINK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ENTITY`
--

LOCK TABLES `USER_ENTITY` WRITE;
/*!40000 ALTER TABLE `USER_ENTITY` DISABLE KEYS */;
INSERT INTO `USER_ENTITY` VALUES ('345e9a04-5333-4563-9fa2-548dd791e376','2051012054linh@ou.edu.vn','2051012054linh@ou.edu.vn',1,1,NULL,'Linh','Vũ Nguyễn Mai','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','2051012054',1711945748500,NULL,0),('434b8c1a-866c-4683-8e93-873a0af026c9','2051012004anh@ou.edu.vn','2051012004anh@ou.edu.vn',1,1,NULL,'Anh','Nguyễn Vân','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','2051012004',1711945702020,NULL,0),('a539aa3e-6f87-4b14-bbca-9ea0554ea77a',NULL,'6ab71edd-8be8-494d-ad79-d5e85c7a83b0',0,1,NULL,NULL,NULL,'65fa274b-8112-4346-8bcc-e604adb24617','admin',1711945604920,NULL,0),('a7246e8f-8dae-4e37-8d95-ccb2b24525e3','admin@gmail.com','admin@gmail.com',1,1,NULL,'Admin','Super','c50626a4-a4f7-42b1-ba55-fdfd2fae3469','admin',1711945789929,NULL,0),('d70ad7b7-e7bd-4d4d-a31c-8f2a493cf3e7',NULL,'547769da-9246-4dc9-9807-3bd80a489662',0,1,NULL,NULL,NULL,'c50626a4-a4f7-42b1-ba55-fdfd2fae3469','service-account-ou-graduation-client',1711945949490,'d26e729e-9d1e-42cb-b4f0-e81f3d252ff3',0);
/*!40000 ALTER TABLE `USER_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_CONFIG`
--

DROP TABLE IF EXISTS `USER_FEDERATION_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_CONFIG` (
  `USER_FEDERATION_PROVIDER_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`USER_FEDERATION_PROVIDER_ID`,`NAME`),
  CONSTRAINT `FK_T13HPU1J94R2EBPEKR39X5EU5` FOREIGN KEY (`USER_FEDERATION_PROVIDER_ID`) REFERENCES `USER_FEDERATION_PROVIDER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_CONFIG`
--

LOCK TABLES `USER_FEDERATION_CONFIG` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_MAPPER`
--

DROP TABLE IF EXISTS `USER_FEDERATION_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `FEDERATION_PROVIDER_ID` varchar(36) NOT NULL,
  `FEDERATION_MAPPER_TYPE` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USR_FED_MAP_FED_PRV` (`FEDERATION_PROVIDER_ID`),
  KEY `IDX_USR_FED_MAP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_FEDMAPPERPM_FEDPRV` FOREIGN KEY (`FEDERATION_PROVIDER_ID`) REFERENCES `USER_FEDERATION_PROVIDER` (`ID`),
  CONSTRAINT `FK_FEDMAPPERPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_MAPPER`
--

LOCK TABLES `USER_FEDERATION_MAPPER` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `USER_FEDERATION_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_MAPPER_CONFIG` (
  `USER_FEDERATION_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`USER_FEDERATION_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_FEDMAPPER_CFG` FOREIGN KEY (`USER_FEDERATION_MAPPER_ID`) REFERENCES `USER_FEDERATION_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_MAPPER_CONFIG`
--

LOCK TABLES `USER_FEDERATION_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_PROVIDER`
--

DROP TABLE IF EXISTS `USER_FEDERATION_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_PROVIDER` (
  `ID` varchar(36) NOT NULL,
  `CHANGED_SYNC_PERIOD` int DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  `FULL_SYNC_PERIOD` int DEFAULT NULL,
  `LAST_SYNC` int DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  `PROVIDER_NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USR_FED_PRV_REALM` (`REALM_ID`),
  CONSTRAINT `FK_1FJ32F6PTOLW2QY60CD8N01E8` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_PROVIDER`
--

LOCK TABLES `USER_FEDERATION_PROVIDER` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_PROVIDER` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_GROUP_MEMBERSHIP`
--

DROP TABLE IF EXISTS `USER_GROUP_MEMBERSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_GROUP_MEMBERSHIP` (
  `GROUP_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`GROUP_ID`,`USER_ID`),
  KEY `IDX_USER_GROUP_MAPPING` (`USER_ID`),
  CONSTRAINT `FK_USER_GROUP_USER` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_GROUP_MEMBERSHIP`
--

LOCK TABLES `USER_GROUP_MEMBERSHIP` WRITE;
/*!40000 ALTER TABLE `USER_GROUP_MEMBERSHIP` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_GROUP_MEMBERSHIP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_REQUIRED_ACTION`
--

DROP TABLE IF EXISTS `USER_REQUIRED_ACTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_REQUIRED_ACTION` (
  `USER_ID` varchar(36) NOT NULL,
  `REQUIRED_ACTION` varchar(255) NOT NULL DEFAULT ' ',
  PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`),
  KEY `IDX_USER_REQACTIONS` (`USER_ID`),
  CONSTRAINT `FK_6QJ3W1JW9CVAFHE19BWSIUVMD` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_REQUIRED_ACTION`
--

LOCK TABLES `USER_REQUIRED_ACTION` WRITE;
/*!40000 ALTER TABLE `USER_REQUIRED_ACTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_REQUIRED_ACTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `USER_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_ROLE_MAPPING` (
  `ROLE_ID` varchar(255) NOT NULL,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`USER_ID`),
  KEY `IDX_USER_ROLE_MAPPING` (`USER_ID`),
  CONSTRAINT `FK_C4FQV34P1MBYLLOXANG7B1Q3L` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ROLE_MAPPING`
--

LOCK TABLES `USER_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `USER_ROLE_MAPPING` DISABLE KEYS */;
INSERT INTO `USER_ROLE_MAPPING` VALUES ('6b55880d-7680-401b-924c-e510d9d62fe1','345e9a04-5333-4563-9fa2-548dd791e376'),('dec4481b-e653-4c4f-9713-bae9aeeccfe2','345e9a04-5333-4563-9fa2-548dd791e376'),('6b55880d-7680-401b-924c-e510d9d62fe1','434b8c1a-866c-4683-8e93-873a0af026c9'),('dec4481b-e653-4c4f-9713-bae9aeeccfe2','434b8c1a-866c-4683-8e93-873a0af026c9'),('14ad79db-012d-4960-908b-3b9a8e4d213d','a539aa3e-6f87-4b14-bbca-9ea0554ea77a'),('174c9dd0-edf8-427b-8b97-d0db3807256d','a539aa3e-6f87-4b14-bbca-9ea0554ea77a'),('1a837969-e40a-49eb-b99e-4d9461643a79','a539aa3e-6f87-4b14-bbca-9ea0554ea77a'),('2b42133f-0dc4-4448-9a13-5a4e9406b86e','a539aa3e-6f87-4b14-bbca-9ea0554ea77a'),('38125bed-8431-4572-837f-535aeb539844','a539aa3e-6f87-4b14-bbca-9ea0554ea77a'),('3b055580-c4c8-43ec-acc9-23e0a60f4084','a539aa3e-6f87-4b14-bbca-9ea0554ea77a'),('67c37d20-fb11-430e-b0ba-74f45c0f6463','a539aa3e-6f87-4b14-bbca-9ea0554ea77a'),('6a395775-e5b4-42de-8fc7-65d0790656aa','a539aa3e-6f87-4b14-bbca-9ea0554ea77a'),('6d1b3369-a573-4923-b653-43cad60506cd','a539aa3e-6f87-4b14-bbca-9ea0554ea77a'),('7844917c-a3b1-4b30-9e74-c948dc31e17c','a539aa3e-6f87-4b14-bbca-9ea0554ea77a'),('7ccecc38-bfaa-4a39-9d91-916d177d1848','a539aa3e-6f87-4b14-bbca-9ea0554ea77a'),('90c38817-2158-409b-8860-55842c48ca5e','a539aa3e-6f87-4b14-bbca-9ea0554ea77a'),('99efd78d-923b-4a8e-b7c3-3d747fc2c716','a539aa3e-6f87-4b14-bbca-9ea0554ea77a'),('ab4fee63-43fa-451e-ac59-a1c84b016f56','a539aa3e-6f87-4b14-bbca-9ea0554ea77a'),('b74b03a6-6b1f-4b46-8c26-0ee8ec7a8bb2','a539aa3e-6f87-4b14-bbca-9ea0554ea77a'),('bb53f4d0-d6c8-4796-8988-8a390241ac23','a539aa3e-6f87-4b14-bbca-9ea0554ea77a'),('c6d71762-e475-46a2-8558-89e9ba6e3831','a539aa3e-6f87-4b14-bbca-9ea0554ea77a'),('e217dd77-8789-406c-a68e-4c325228cd09','a539aa3e-6f87-4b14-bbca-9ea0554ea77a'),('e37e47ee-d3ae-41ae-91bf-27b7a4931c0c','a539aa3e-6f87-4b14-bbca-9ea0554ea77a'),('6b55880d-7680-401b-924c-e510d9d62fe1','a7246e8f-8dae-4e37-8d95-ccb2b24525e3'),('ebb6c557-480e-4648-9f5f-ce8c0d86bd0d','a7246e8f-8dae-4e37-8d95-ccb2b24525e3'),('6222fbb8-463e-46b9-a649-17594b1a04d1','d70ad7b7-e7bd-4d4d-a31c-8f2a493cf3e7'),('6b55880d-7680-401b-924c-e510d9d62fe1','d70ad7b7-e7bd-4d4d-a31c-8f2a493cf3e7');
/*!40000 ALTER TABLE `USER_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_SESSION`
--

DROP TABLE IF EXISTS `USER_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_SESSION` (
  `ID` varchar(36) NOT NULL,
  `AUTH_METHOD` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `LAST_SESSION_REFRESH` int DEFAULT NULL,
  `LOGIN_USERNAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `REMEMBER_ME` tinyint NOT NULL DEFAULT '0',
  `STARTED` int DEFAULT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  `USER_SESSION_STATE` int DEFAULT NULL,
  `BROKER_SESSION_ID` varchar(255) DEFAULT NULL,
  `BROKER_USER_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_SESSION`
--

LOCK TABLES `USER_SESSION` WRITE;
/*!40000 ALTER TABLE `USER_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_SESSION_NOTE`
--

DROP TABLE IF EXISTS `USER_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_SESSION_NOTE` (
  `USER_SESSION` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` text,
  PRIMARY KEY (`USER_SESSION`,`NAME`),
  CONSTRAINT `FK5EDFB00FF51D3472` FOREIGN KEY (`USER_SESSION`) REFERENCES `USER_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_SESSION_NOTE`
--

LOCK TABLES `USER_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `USER_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WEB_ORIGINS`
--

DROP TABLE IF EXISTS `WEB_ORIGINS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WEB_ORIGINS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`VALUE`),
  KEY `IDX_WEB_ORIG_CLIENT` (`CLIENT_ID`),
  CONSTRAINT `FK_LOJPHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WEB_ORIGINS`
--

LOCK TABLES `WEB_ORIGINS` WRITE;
/*!40000 ALTER TABLE `WEB_ORIGINS` DISABLE KEYS */;
INSERT INTO `WEB_ORIGINS` VALUES ('3e22a15e-acef-4f19-b2a0-3afca2189471','+'),('b33e20b2-62d3-4afa-a5f1-18ff3234bafd','+'),('d26e729e-9d1e-42cb-b4f0-e81f3d252ff3','/*');
/*!40000 ALTER TABLE `WEB_ORIGINS` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-01 12:07:43
