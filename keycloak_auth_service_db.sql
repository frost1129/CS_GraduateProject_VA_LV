-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: keycloak_db
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
INSERT INTO `ASSOCIATED_POLICY` VALUES ('0e330c02-df22-46a9-a914-1300cfeeeb74','4c5146d8-4451-49cb-b0c5-32e16289c485');
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
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('017385c1-d2cb-48dc-8781-79f53cc43152',NULL,'direct-grant-validate-password','1a95a13f-0349-431c-878d-063e1ab2b03b','30f2e0fd-434b-4e50-85a8-eb99474defb1',0,20,0,NULL,NULL),('0877b37e-c146-41b4-b309-0537bd51996c',NULL,'idp-username-password-form','1a95a13f-0349-431c-878d-063e1ab2b03b','85195c95-9723-4357-8073-f3e8c23c0232',0,10,0,NULL,NULL),('0d29dce9-b459-46e8-9526-4fca1201144b',NULL,'direct-grant-validate-username','818b284a-a54c-4c96-a9d0-bb89323c0677','1ca188dc-88cb-4e42-b95c-b5717d34db83',0,10,0,NULL,NULL),('1062ed61-dc3c-43d6-8270-98513826e38a',NULL,NULL,'818b284a-a54c-4c96-a9d0-bb89323c0677','1ca188dc-88cb-4e42-b95c-b5717d34db83',1,30,1,'e7413db8-36ab-494b-9076-2b003b2577fe',NULL),('11121580-715d-4ada-94e0-1a37abc487c8',NULL,NULL,'818b284a-a54c-4c96-a9d0-bb89323c0677','0b78a1e8-0951-49d9-a7d1-26ff847ded3f',1,40,1,'8fd297d0-e08b-49be-b116-c5e5e346e41a',NULL),('12fa4fa2-63f9-445f-99c3-695d0245f774',NULL,'idp-create-user-if-unique','818b284a-a54c-4c96-a9d0-bb89323c0677','539e493e-cb05-4b58-ad22-6537e394aaf5',2,10,0,NULL,'caf18dd3-675f-4330-b92a-3aab58395bd1'),('1dfea6bb-21d3-451c-a2a6-d65dc2e0c970',NULL,'direct-grant-validate-otp','1a95a13f-0349-431c-878d-063e1ab2b03b','fb98a54a-b803-455a-86c3-ed8b7f411af5',0,20,0,NULL,NULL),('1eb3a956-cf3e-4ea7-9ea4-68d790ff4bf8',NULL,NULL,'818b284a-a54c-4c96-a9d0-bb89323c0677','aab3f5a6-4c3c-426a-892a-d507d2cf3c01',2,20,1,'d00b6cf5-df9a-4bc1-8aee-6b4528cc90c1',NULL),('21bb8eae-71e5-4543-9c0b-d42b5d000a8f',NULL,'registration-password-action','818b284a-a54c-4c96-a9d0-bb89323c0677','564549f8-ed79-479b-b871-1c255639fb70',0,50,0,NULL,NULL),('2bed8476-400d-4088-b37a-86835ead4804',NULL,'idp-email-verification','1a95a13f-0349-431c-878d-063e1ab2b03b','27b6cc3b-55fe-4232-a8fb-19764a55741b',2,10,0,NULL,NULL),('2e47ea8f-c60b-4e38-b850-fcaec75fe61e',NULL,'idp-review-profile','818b284a-a54c-4c96-a9d0-bb89323c0677','bf10cd21-1cf2-4bb5-b477-5ac822797088',0,10,0,NULL,'e1538554-7265-44da-99bf-26908f546670'),('3057bf02-220e-4e39-bf83-2886d86b0882',NULL,'reset-credential-email','818b284a-a54c-4c96-a9d0-bb89323c0677','0b78a1e8-0951-49d9-a7d1-26ff847ded3f',0,20,0,NULL,NULL),('30bdce1f-6564-469c-bc0b-9fe7b6752d1e',NULL,'conditional-user-configured','818b284a-a54c-4c96-a9d0-bb89323c0677','9e892ff4-073a-4a97-9897-75a8f13bc83b',0,10,0,NULL,NULL),('32e5688f-5e19-46c0-8128-1aff5a825a96',NULL,'reset-password','1a95a13f-0349-431c-878d-063e1ab2b03b','c485c2d1-168b-4fb9-abc4-1b29abd1afeb',0,30,0,NULL,NULL),('33a14a58-0ddd-4ff5-9801-7d23434fdc5b',NULL,'registration-terms-and-conditions','1a95a13f-0349-431c-878d-063e1ab2b03b','6d0e5efa-d558-42b5-8ec5-62693438b5f8',3,70,0,NULL,NULL),('3649921d-7c58-414e-b334-1c68d36ae6e9',NULL,NULL,'1a95a13f-0349-431c-878d-063e1ab2b03b','0ea799f7-8c83-458b-98d4-d1071259fb93',1,20,1,'5443dc4b-4ab9-4872-94d1-7acccb3877e5',NULL),('37fc5361-b2c7-4eab-90c4-1f8962e5051e',NULL,NULL,'1a95a13f-0349-431c-878d-063e1ab2b03b','f20a4394-4b52-4951-b7ea-f2d24705c3f9',0,20,1,'27b6cc3b-55fe-4232-a8fb-19764a55741b',NULL),('3b362de5-baf2-48e1-ba55-093199e9c4b3',NULL,'registration-password-action','1a95a13f-0349-431c-878d-063e1ab2b03b','6d0e5efa-d558-42b5-8ec5-62693438b5f8',0,50,0,NULL,NULL),('3b618da6-2b27-4de1-a9c4-32efd41be13b',NULL,'auth-otp-form','1a95a13f-0349-431c-878d-063e1ab2b03b','05eeb256-1e7e-4a4e-b061-54c62bb4033d',0,20,0,NULL,NULL),('3bb57a0b-06a0-415c-b44f-0b58c529ae21',NULL,'client-secret-jwt','818b284a-a54c-4c96-a9d0-bb89323c0677','29543e96-2285-4bb7-87bb-9fe309d83e3a',2,30,0,NULL,NULL),('493f5cbe-5a6c-4c08-a37e-427acd31d779',NULL,NULL,'1a95a13f-0349-431c-878d-063e1ab2b03b','9544a5d2-3555-4100-b02b-f53aab9be7d8',0,20,1,'296ee959-bf27-430e-9292-4af9a229244d',NULL),('49a0025a-2a11-44f5-b57d-7a2a8843a416',NULL,'reset-password','818b284a-a54c-4c96-a9d0-bb89323c0677','0b78a1e8-0951-49d9-a7d1-26ff847ded3f',0,30,0,NULL,NULL),('4b15634f-bc71-45aa-8fb8-0c1c8f0c66ee',NULL,'auth-username-password-form','1a95a13f-0349-431c-878d-063e1ab2b03b','0ea799f7-8c83-458b-98d4-d1071259fb93',0,10,0,NULL,NULL),('4ddafddf-f1aa-4b23-ba19-47d66a0a0732',NULL,'client-secret-jwt','1a95a13f-0349-431c-878d-063e1ab2b03b','77c2702b-0472-4310-94d3-1da323405206',2,30,0,NULL,NULL),('571ec372-6a70-48a6-b682-6ad1034842c6',NULL,NULL,'1a95a13f-0349-431c-878d-063e1ab2b03b','30f2e0fd-434b-4e50-85a8-eb99474defb1',1,30,1,'fb98a54a-b803-455a-86c3-ed8b7f411af5',NULL),('5787879d-4a8e-4de5-aee7-b066cbcc9e96',NULL,'reset-otp','1a95a13f-0349-431c-878d-063e1ab2b03b','1d329082-1b9d-4a64-be45-38377e234447',0,20,0,NULL,NULL),('5aba0402-8baf-44fe-99d5-0bfa94321a07',NULL,'client-jwt','818b284a-a54c-4c96-a9d0-bb89323c0677','29543e96-2285-4bb7-87bb-9fe309d83e3a',2,20,0,NULL,NULL),('5d2566f2-5bc6-4fe1-b29a-7c104bf4430a',NULL,'reset-credentials-choose-user','1a95a13f-0349-431c-878d-063e1ab2b03b','c485c2d1-168b-4fb9-abc4-1b29abd1afeb',0,10,0,NULL,NULL),('61196bd1-c496-4f85-84eb-d36695c9c70d',NULL,'client-secret','818b284a-a54c-4c96-a9d0-bb89323c0677','29543e96-2285-4bb7-87bb-9fe309d83e3a',2,10,0,NULL,NULL),('62a8186b-f447-46c4-b931-cce3fa42c3e3',NULL,'conditional-user-configured','818b284a-a54c-4c96-a9d0-bb89323c0677','e7413db8-36ab-494b-9076-2b003b2577fe',0,10,0,NULL,NULL),('62c001c6-8907-4ece-b1de-b43cc19ea385',NULL,'docker-http-basic-authenticator','1a95a13f-0349-431c-878d-063e1ab2b03b','3d726ff4-ee58-467f-aefe-e188c9bc32ce',0,10,0,NULL,NULL),('65c09053-bd7b-432d-8f19-c4d703103047',NULL,'conditional-user-configured','1a95a13f-0349-431c-878d-063e1ab2b03b','5443dc4b-4ab9-4872-94d1-7acccb3877e5',0,10,0,NULL,NULL),('661a317b-f5c5-4329-998f-981a81e266cf',NULL,'docker-http-basic-authenticator','818b284a-a54c-4c96-a9d0-bb89323c0677','3a39e82a-e234-4cf6-b92a-af0d1aee9aad',0,10,0,NULL,NULL),('668fb004-344a-4414-b21d-e8e8d7bd7324',NULL,'conditional-user-configured','1a95a13f-0349-431c-878d-063e1ab2b03b','05eeb256-1e7e-4a4e-b061-54c62bb4033d',0,10,0,NULL,NULL),('66e2c254-57af-4329-9265-cc887903e486',NULL,NULL,'818b284a-a54c-4c96-a9d0-bb89323c0677','a1fa9076-4284-425f-9ce6-2c92a3bb00eb',1,20,1,'9e892ff4-073a-4a97-9897-75a8f13bc83b',NULL),('6702fca8-1b0a-425f-9d6b-d613b5b7444d',NULL,'auth-cookie','1a95a13f-0349-431c-878d-063e1ab2b03b','995154e6-6b4a-46b5-8884-fcffb4523e95',2,10,0,NULL,NULL),('691c22d9-2ce7-4e2b-8f99-8209f5264d14',NULL,'http-basic-authenticator','1a95a13f-0349-431c-878d-063e1ab2b03b','66cfd5d4-0b81-40bc-a95f-2a3c29835e83',0,10,0,NULL,NULL),('6a63f1db-8251-49b3-90b7-f0d1ce73a5fd',NULL,'reset-otp','818b284a-a54c-4c96-a9d0-bb89323c0677','8fd297d0-e08b-49be-b116-c5e5e346e41a',0,20,0,NULL,NULL),('6c844ac9-ead1-4106-9b08-c371adbe4553',NULL,'auth-spnego','818b284a-a54c-4c96-a9d0-bb89323c0677','134c7abc-4573-4ab6-8a5f-f51d5ad71c87',3,20,0,NULL,NULL),('6f686dda-1524-4ad1-8dd7-5c556256c2fa',NULL,'conditional-user-configured','818b284a-a54c-4c96-a9d0-bb89323c0677','8fd297d0-e08b-49be-b116-c5e5e346e41a',0,10,0,NULL,NULL),('6fd288ef-a945-49a0-8e5e-d0e96422440c',NULL,'registration-recaptcha-action','1a95a13f-0349-431c-878d-063e1ab2b03b','6d0e5efa-d558-42b5-8ec5-62693438b5f8',3,60,0,NULL,NULL),('72dd2355-2019-418d-8cde-203a638a8ebf',NULL,'conditional-user-configured','1a95a13f-0349-431c-878d-063e1ab2b03b','1d329082-1b9d-4a64-be45-38377e234447',0,10,0,NULL,NULL),('778b82c4-b9cb-44c4-ab47-05e4caeeffcd',NULL,NULL,'818b284a-a54c-4c96-a9d0-bb89323c0677','bf10cd21-1cf2-4bb5-b477-5ac822797088',0,20,1,'539e493e-cb05-4b58-ad22-6537e394aaf5',NULL),('79bcb7a3-358f-45ad-8240-35bb56ce2276',NULL,'registration-page-form','1a95a13f-0349-431c-878d-063e1ab2b03b','d313a32e-4ff3-4f64-9432-66ead03ba97b',0,10,1,'6d0e5efa-d558-42b5-8ec5-62693438b5f8',NULL),('7c568fdc-9d14-4239-b690-5a0a92318bd3',NULL,'auth-otp-form','818b284a-a54c-4c96-a9d0-bb89323c0677','dfc53637-0e7e-439c-a9bf-013e329492f7',0,20,0,NULL,NULL),('808f8a24-ceef-4679-b1d5-6982dbbbbf2f',NULL,'registration-page-form','818b284a-a54c-4c96-a9d0-bb89323c0677','90c627fe-8f7b-4bd0-8308-6f7f179302a4',0,10,1,'564549f8-ed79-479b-b871-1c255639fb70',NULL),('81f69709-5855-41d6-9efa-999f01ba7226',NULL,'identity-provider-redirector','818b284a-a54c-4c96-a9d0-bb89323c0677','134c7abc-4573-4ab6-8a5f-f51d5ad71c87',2,25,0,NULL,NULL),('83204da0-72a2-4d59-a0af-7452c154c183',NULL,'auth-spnego','1a95a13f-0349-431c-878d-063e1ab2b03b','995154e6-6b4a-46b5-8884-fcffb4523e95',3,20,0,NULL,NULL),('85635bb0-928f-4298-9836-e003ecac6484',NULL,NULL,'818b284a-a54c-4c96-a9d0-bb89323c0677','134c7abc-4573-4ab6-8a5f-f51d5ad71c87',2,30,1,'a1fa9076-4284-425f-9ce6-2c92a3bb00eb',NULL),('8a101298-733a-43e5-a0ad-66c324af18c1',NULL,'registration-user-creation','1a95a13f-0349-431c-878d-063e1ab2b03b','6d0e5efa-d558-42b5-8ec5-62693438b5f8',0,20,0,NULL,NULL),('8ca5859a-a5fa-44e1-baba-6aceac80bec2',NULL,'client-jwt','1a95a13f-0349-431c-878d-063e1ab2b03b','77c2702b-0472-4310-94d3-1da323405206',2,20,0,NULL,NULL),('8ebfefef-7cd3-4037-a058-e344557207df',NULL,'client-x509','1a95a13f-0349-431c-878d-063e1ab2b03b','77c2702b-0472-4310-94d3-1da323405206',2,40,0,NULL,NULL),('91277fc1-16c4-416d-82cd-cce32bda0a9b',NULL,'idp-confirm-link','818b284a-a54c-4c96-a9d0-bb89323c0677','68afe832-e2cf-4b46-abaf-4b4f4465eb77',0,10,0,NULL,NULL),('958a0636-cf24-4bc1-80f2-a2e5fb8aaf52',NULL,'auth-username-password-form','818b284a-a54c-4c96-a9d0-bb89323c0677','a1fa9076-4284-425f-9ce6-2c92a3bb00eb',0,10,0,NULL,NULL),('98974f77-be4f-46c7-97c5-cef6923ee734',NULL,NULL,'818b284a-a54c-4c96-a9d0-bb89323c0677','d00b6cf5-df9a-4bc1-8aee-6b4528cc90c1',1,20,1,'dfc53637-0e7e-439c-a9bf-013e329492f7',NULL),('a02f96fd-7ec3-4772-bc6a-4260c3b68dab',NULL,'idp-review-profile','1a95a13f-0349-431c-878d-063e1ab2b03b','9544a5d2-3555-4100-b02b-f53aab9be7d8',0,10,0,NULL,'23a57b3e-fb0f-41a3-948d-c22c635638af'),('a49fd15d-9f0b-4b69-821b-42db066f082a',NULL,'auth-otp-form','818b284a-a54c-4c96-a9d0-bb89323c0677','9e892ff4-073a-4a97-9897-75a8f13bc83b',0,20,0,NULL,NULL),('a9378c6e-d58e-484d-bde7-3a004ebe23d8',NULL,NULL,'818b284a-a54c-4c96-a9d0-bb89323c0677','539e493e-cb05-4b58-ad22-6537e394aaf5',2,20,1,'68afe832-e2cf-4b46-abaf-4b4f4465eb77',NULL),('ab6e5ce1-0029-40e9-a32e-1bdaf5783e6a',NULL,'auth-cookie','818b284a-a54c-4c96-a9d0-bb89323c0677','134c7abc-4573-4ab6-8a5f-f51d5ad71c87',2,10,0,NULL,NULL),('ab9dea22-65be-43a8-956d-1b3657c70ce2',NULL,'auth-otp-form','1a95a13f-0349-431c-878d-063e1ab2b03b','5443dc4b-4ab9-4872-94d1-7acccb3877e5',0,20,0,NULL,NULL),('b67ecc2c-a8ae-44ad-b8b1-964e26b3f25f',NULL,'idp-confirm-link','1a95a13f-0349-431c-878d-063e1ab2b03b','f20a4394-4b52-4951-b7ea-f2d24705c3f9',0,10,0,NULL,NULL),('bf0d1542-9270-4923-81ac-e6e6d53c0777',NULL,'registration-terms-and-conditions','818b284a-a54c-4c96-a9d0-bb89323c0677','564549f8-ed79-479b-b871-1c255639fb70',3,70,0,NULL,NULL),('c0330fb7-a432-498a-896d-c1d35962c4f8',NULL,'idp-create-user-if-unique','1a95a13f-0349-431c-878d-063e1ab2b03b','296ee959-bf27-430e-9292-4af9a229244d',2,10,0,NULL,'c1a238ca-3014-48d9-9725-938f4b08475c'),('c077f8f1-6256-4fd0-bc34-c549fdb9d494',NULL,'direct-grant-validate-username','1a95a13f-0349-431c-878d-063e1ab2b03b','30f2e0fd-434b-4e50-85a8-eb99474defb1',0,10,0,NULL,NULL),('c3d16e64-3ae2-444d-b69c-77b52bfdcbd5',NULL,'http-basic-authenticator','818b284a-a54c-4c96-a9d0-bb89323c0677','4300820d-9e63-4f94-82ab-deb6213ea77b',0,10,0,NULL,NULL),('c4854b38-1a98-4304-9535-18530fb760f2',NULL,NULL,'818b284a-a54c-4c96-a9d0-bb89323c0677','68afe832-e2cf-4b46-abaf-4b4f4465eb77',0,20,1,'aab3f5a6-4c3c-426a-892a-d507d2cf3c01',NULL),('c5a6b1a2-2d22-49b6-a223-0d1d761e75a0',NULL,'reset-credentials-choose-user','818b284a-a54c-4c96-a9d0-bb89323c0677','0b78a1e8-0951-49d9-a7d1-26ff847ded3f',0,10,0,NULL,NULL),('cb3e548b-3d7e-4155-93bc-29ed52d60307',NULL,'identity-provider-redirector','1a95a13f-0349-431c-878d-063e1ab2b03b','995154e6-6b4a-46b5-8884-fcffb4523e95',2,25,0,NULL,NULL),('cd106f74-ee29-4192-88d7-5260b476a792',NULL,'reset-credential-email','1a95a13f-0349-431c-878d-063e1ab2b03b','c485c2d1-168b-4fb9-abc4-1b29abd1afeb',0,20,0,NULL,NULL),('cd405719-83e3-4f8e-b8d6-690417673853',NULL,'conditional-user-configured','818b284a-a54c-4c96-a9d0-bb89323c0677','dfc53637-0e7e-439c-a9bf-013e329492f7',0,10,0,NULL,NULL),('d0253984-4de6-4882-8011-0a649a0aa864',NULL,NULL,'1a95a13f-0349-431c-878d-063e1ab2b03b','995154e6-6b4a-46b5-8884-fcffb4523e95',2,30,1,'0ea799f7-8c83-458b-98d4-d1071259fb93',NULL),('d7a0528e-6958-486d-b9bd-18b9356b9146',NULL,'client-x509','818b284a-a54c-4c96-a9d0-bb89323c0677','29543e96-2285-4bb7-87bb-9fe309d83e3a',2,40,0,NULL,NULL),('d8ad1624-75e6-4193-89a5-5edd363a1b03',NULL,NULL,'1a95a13f-0349-431c-878d-063e1ab2b03b','c485c2d1-168b-4fb9-abc4-1b29abd1afeb',1,40,1,'1d329082-1b9d-4a64-be45-38377e234447',NULL),('d9d0c519-a42f-4b0d-bcb3-65e2460a48b5',NULL,'conditional-user-configured','1a95a13f-0349-431c-878d-063e1ab2b03b','fb98a54a-b803-455a-86c3-ed8b7f411af5',0,10,0,NULL,NULL),('e87dc3f4-d771-4a95-9daa-80f3741a9edd',NULL,NULL,'1a95a13f-0349-431c-878d-063e1ab2b03b','85195c95-9723-4357-8073-f3e8c23c0232',1,20,1,'05eeb256-1e7e-4a4e-b061-54c62bb4033d',NULL),('e89d8c6a-c078-4784-b1ff-eb58c31de184',NULL,'idp-email-verification','818b284a-a54c-4c96-a9d0-bb89323c0677','aab3f5a6-4c3c-426a-892a-d507d2cf3c01',2,10,0,NULL,NULL),('eaca7e8a-5c3d-4cd1-bf8f-b167cef37ebc',NULL,NULL,'1a95a13f-0349-431c-878d-063e1ab2b03b','296ee959-bf27-430e-9292-4af9a229244d',2,20,1,'f20a4394-4b52-4951-b7ea-f2d24705c3f9',NULL),('eb4d9561-b3c9-4ea7-a193-1e0867f412cc',NULL,NULL,'1a95a13f-0349-431c-878d-063e1ab2b03b','27b6cc3b-55fe-4232-a8fb-19764a55741b',2,20,1,'85195c95-9723-4357-8073-f3e8c23c0232',NULL),('ec3366ba-34fa-409c-957a-def3c0552396',NULL,'registration-user-creation','818b284a-a54c-4c96-a9d0-bb89323c0677','564549f8-ed79-479b-b871-1c255639fb70',0,20,0,NULL,NULL),('f005585f-7814-4b50-9b3c-d14d888b18e8',NULL,'idp-username-password-form','818b284a-a54c-4c96-a9d0-bb89323c0677','d00b6cf5-df9a-4bc1-8aee-6b4528cc90c1',0,10,0,NULL,NULL),('f6bd6910-8be2-4a09-8fac-25c152a4f585',NULL,'direct-grant-validate-password','818b284a-a54c-4c96-a9d0-bb89323c0677','1ca188dc-88cb-4e42-b95c-b5717d34db83',0,20,0,NULL,NULL),('f79cc87c-69d7-4401-82f7-ae554d752586',NULL,'registration-recaptcha-action','818b284a-a54c-4c96-a9d0-bb89323c0677','564549f8-ed79-479b-b871-1c255639fb70',3,60,0,NULL,NULL),('fa654694-15a1-4a5e-8997-164451f1a5ac',NULL,'direct-grant-validate-otp','818b284a-a54c-4c96-a9d0-bb89323c0677','e7413db8-36ab-494b-9076-2b003b2577fe',0,20,0,NULL,NULL),('fa9a0239-6993-465b-802c-4e7805044a04',NULL,'client-secret','1a95a13f-0349-431c-878d-063e1ab2b03b','77c2702b-0472-4310-94d3-1da323405206',2,10,0,NULL,NULL);
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
INSERT INTO `AUTHENTICATION_FLOW` VALUES ('05eeb256-1e7e-4a4e-b061-54c62bb4033d','First broker login - Conditional OTP','Flow to determine if the OTP is required for the authentication','1a95a13f-0349-431c-878d-063e1ab2b03b','basic-flow',0,1),('0b78a1e8-0951-49d9-a7d1-26ff847ded3f','reset credentials','Reset credentials for a user if they forgot their password or something','818b284a-a54c-4c96-a9d0-bb89323c0677','basic-flow',1,1),('0ea799f7-8c83-458b-98d4-d1071259fb93','forms','Username, password, otp and other auth forms.','1a95a13f-0349-431c-878d-063e1ab2b03b','basic-flow',0,1),('134c7abc-4573-4ab6-8a5f-f51d5ad71c87','browser','browser based authentication','818b284a-a54c-4c96-a9d0-bb89323c0677','basic-flow',1,1),('1ca188dc-88cb-4e42-b95c-b5717d34db83','direct grant','OpenID Connect Resource Owner Grant','818b284a-a54c-4c96-a9d0-bb89323c0677','basic-flow',1,1),('1d329082-1b9d-4a64-be45-38377e234447','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','1a95a13f-0349-431c-878d-063e1ab2b03b','basic-flow',0,1),('27b6cc3b-55fe-4232-a8fb-19764a55741b','Account verification options','Method with which to verity the existing account','1a95a13f-0349-431c-878d-063e1ab2b03b','basic-flow',0,1),('29543e96-2285-4bb7-87bb-9fe309d83e3a','clients','Base authentication for clients','818b284a-a54c-4c96-a9d0-bb89323c0677','client-flow',1,1),('296ee959-bf27-430e-9292-4af9a229244d','User creation or linking','Flow for the existing/non-existing user alternatives','1a95a13f-0349-431c-878d-063e1ab2b03b','basic-flow',0,1),('30f2e0fd-434b-4e50-85a8-eb99474defb1','direct grant','OpenID Connect Resource Owner Grant','1a95a13f-0349-431c-878d-063e1ab2b03b','basic-flow',1,1),('3a39e82a-e234-4cf6-b92a-af0d1aee9aad','docker auth','Used by Docker clients to authenticate against the IDP','818b284a-a54c-4c96-a9d0-bb89323c0677','basic-flow',1,1),('3d726ff4-ee58-467f-aefe-e188c9bc32ce','docker auth','Used by Docker clients to authenticate against the IDP','1a95a13f-0349-431c-878d-063e1ab2b03b','basic-flow',1,1),('4300820d-9e63-4f94-82ab-deb6213ea77b','saml ecp','SAML ECP Profile Authentication Flow','818b284a-a54c-4c96-a9d0-bb89323c0677','basic-flow',1,1),('539e493e-cb05-4b58-ad22-6537e394aaf5','User creation or linking','Flow for the existing/non-existing user alternatives','818b284a-a54c-4c96-a9d0-bb89323c0677','basic-flow',0,1),('5443dc4b-4ab9-4872-94d1-7acccb3877e5','Browser - Conditional OTP','Flow to determine if the OTP is required for the authentication','1a95a13f-0349-431c-878d-063e1ab2b03b','basic-flow',0,1),('564549f8-ed79-479b-b871-1c255639fb70','registration form','registration form','818b284a-a54c-4c96-a9d0-bb89323c0677','form-flow',0,1),('66cfd5d4-0b81-40bc-a95f-2a3c29835e83','saml ecp','SAML ECP Profile Authentication Flow','1a95a13f-0349-431c-878d-063e1ab2b03b','basic-flow',1,1),('68afe832-e2cf-4b46-abaf-4b4f4465eb77','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','818b284a-a54c-4c96-a9d0-bb89323c0677','basic-flow',0,1),('6d0e5efa-d558-42b5-8ec5-62693438b5f8','registration form','registration form','1a95a13f-0349-431c-878d-063e1ab2b03b','form-flow',0,1),('77c2702b-0472-4310-94d3-1da323405206','clients','Base authentication for clients','1a95a13f-0349-431c-878d-063e1ab2b03b','client-flow',1,1),('85195c95-9723-4357-8073-f3e8c23c0232','Verify Existing Account by Re-authentication','Reauthentication of existing account','1a95a13f-0349-431c-878d-063e1ab2b03b','basic-flow',0,1),('8fd297d0-e08b-49be-b116-c5e5e346e41a','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','818b284a-a54c-4c96-a9d0-bb89323c0677','basic-flow',0,1),('90c627fe-8f7b-4bd0-8308-6f7f179302a4','registration','registration flow','818b284a-a54c-4c96-a9d0-bb89323c0677','basic-flow',1,1),('9544a5d2-3555-4100-b02b-f53aab9be7d8','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','1a95a13f-0349-431c-878d-063e1ab2b03b','basic-flow',1,1),('995154e6-6b4a-46b5-8884-fcffb4523e95','browser','browser based authentication','1a95a13f-0349-431c-878d-063e1ab2b03b','basic-flow',1,1),('9e892ff4-073a-4a97-9897-75a8f13bc83b','Browser - Conditional OTP','Flow to determine if the OTP is required for the authentication','818b284a-a54c-4c96-a9d0-bb89323c0677','basic-flow',0,1),('a1fa9076-4284-425f-9ce6-2c92a3bb00eb','forms','Username, password, otp and other auth forms.','818b284a-a54c-4c96-a9d0-bb89323c0677','basic-flow',0,1),('aab3f5a6-4c3c-426a-892a-d507d2cf3c01','Account verification options','Method with which to verity the existing account','818b284a-a54c-4c96-a9d0-bb89323c0677','basic-flow',0,1),('bf10cd21-1cf2-4bb5-b477-5ac822797088','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','818b284a-a54c-4c96-a9d0-bb89323c0677','basic-flow',1,1),('c485c2d1-168b-4fb9-abc4-1b29abd1afeb','reset credentials','Reset credentials for a user if they forgot their password or something','1a95a13f-0349-431c-878d-063e1ab2b03b','basic-flow',1,1),('d00b6cf5-df9a-4bc1-8aee-6b4528cc90c1','Verify Existing Account by Re-authentication','Reauthentication of existing account','818b284a-a54c-4c96-a9d0-bb89323c0677','basic-flow',0,1),('d313a32e-4ff3-4f64-9432-66ead03ba97b','registration','registration flow','1a95a13f-0349-431c-878d-063e1ab2b03b','basic-flow',1,1),('dfc53637-0e7e-439c-a9bf-013e329492f7','First broker login - Conditional OTP','Flow to determine if the OTP is required for the authentication','818b284a-a54c-4c96-a9d0-bb89323c0677','basic-flow',0,1),('e7413db8-36ab-494b-9076-2b003b2577fe','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','818b284a-a54c-4c96-a9d0-bb89323c0677','basic-flow',0,1),('f20a4394-4b52-4951-b7ea-f2d24705c3f9','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','1a95a13f-0349-431c-878d-063e1ab2b03b','basic-flow',0,1),('fb98a54a-b803-455a-86c3-ed8b7f411af5','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','1a95a13f-0349-431c-878d-063e1ab2b03b','basic-flow',0,1);
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
INSERT INTO `AUTHENTICATOR_CONFIG` VALUES ('23a57b3e-fb0f-41a3-948d-c22c635638af','review profile config','1a95a13f-0349-431c-878d-063e1ab2b03b'),('c1a238ca-3014-48d9-9725-938f4b08475c','create unique user config','1a95a13f-0349-431c-878d-063e1ab2b03b'),('caf18dd3-675f-4330-b92a-3aab58395bd1','create unique user config','818b284a-a54c-4c96-a9d0-bb89323c0677'),('e1538554-7265-44da-99bf-26908f546670','review profile config','818b284a-a54c-4c96-a9d0-bb89323c0677');
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
INSERT INTO `AUTHENTICATOR_CONFIG_ENTRY` VALUES ('23a57b3e-fb0f-41a3-948d-c22c635638af','missing','update.profile.on.first.login'),('c1a238ca-3014-48d9-9725-938f4b08475c','false','require.password.update.after.registration'),('caf18dd3-675f-4330-b92a-3aab58395bd1','false','require.password.update.after.registration'),('e1538554-7265-44da-99bf-26908f546670','missing','update.profile.on.first.login');
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
INSERT INTO `CLIENT` VALUES ('05b9931f-0ca3-4fcd-97c0-9fab2d2344fb',1,0,'account-console',0,1,NULL,'/realms/ou-graduation-realm/account/',0,NULL,0,'1a95a13f-0349-431c-878d-063e1ab2b03b','openid-connect',0,0,0,'${client_account-console}',0,'client-secret','${authBaseUrl}',NULL,NULL,1,0,0,0),('083ce7c5-fe29-4a00-90de-087868fbc92c',1,0,'broker',0,0,NULL,NULL,1,NULL,0,'1a95a13f-0349-431c-878d-063e1ab2b03b','openid-connect',0,0,0,'${client_broker}',0,'client-secret',NULL,NULL,NULL,1,0,0,0),('2cd8fad4-80b6-4d23-87b4-12861f29edc6',1,0,'master-realm',0,0,NULL,NULL,1,NULL,0,'818b284a-a54c-4c96-a9d0-bb89323c0677',NULL,0,0,0,'master Realm',0,'client-secret',NULL,NULL,NULL,1,0,0,0),('40ae120f-9d1d-4585-ac43-052e0c0d1667',1,0,'ou-graduation-realm-realm',0,0,NULL,NULL,1,NULL,0,'818b284a-a54c-4c96-a9d0-bb89323c0677',NULL,0,0,0,'ou-graduation-realm Realm',0,'client-secret',NULL,NULL,NULL,1,0,0,0),('71c9944f-b05a-4bb4-89a7-fb550386322c',1,0,'admin-cli',0,1,NULL,NULL,0,NULL,0,'1a95a13f-0349-431c-878d-063e1ab2b03b','openid-connect',0,0,0,'${client_admin-cli}',0,'client-secret',NULL,NULL,NULL,0,0,1,0),('86e02814-d7e0-4d8e-9edb-6a1963d69e01',1,0,'admin-cli',0,1,NULL,NULL,0,NULL,0,'818b284a-a54c-4c96-a9d0-bb89323c0677','openid-connect',0,0,0,'${client_admin-cli}',0,'client-secret',NULL,NULL,NULL,0,0,1,0),('88461b68-c1c9-4f07-971a-81fdf4d087e5',1,0,'account-console',0,1,NULL,'/realms/master/account/',0,NULL,0,'818b284a-a54c-4c96-a9d0-bb89323c0677','openid-connect',0,0,0,'${client_account-console}',0,'client-secret','${authBaseUrl}',NULL,NULL,1,0,0,0),('9292b5d7-9a28-4fb1-bab8-65c19b3334cb',1,0,'realm-management',0,0,NULL,NULL,1,NULL,0,'1a95a13f-0349-431c-878d-063e1ab2b03b','openid-connect',0,0,0,'${client_realm-management}',0,'client-secret',NULL,NULL,NULL,1,0,0,0),('b5668e36-56c8-436a-b767-eafb09b8a77e',1,0,'security-admin-console',0,1,NULL,'/admin/master/console/',0,NULL,0,'818b284a-a54c-4c96-a9d0-bb89323c0677','openid-connect',0,0,0,'${client_security-admin-console}',0,'client-secret','${authAdminUrl}',NULL,NULL,1,0,0,0),('ba4a9551-9e5c-4610-88e9-11a09c8d4307',1,0,'security-admin-console',0,1,NULL,'/admin/ou-graduation-realm/console/',0,NULL,0,'1a95a13f-0349-431c-878d-063e1ab2b03b','openid-connect',0,0,0,'${client_security-admin-console}',0,'client-secret','${authAdminUrl}',NULL,NULL,1,0,0,0),('bccba2a3-e060-4ae3-8279-2bb9695af129',1,1,'ou-graduation-client',0,0,'QIqAcBE2TyIa3Kq2YUpxHYf3HsOjIb7N','',0,'',0,'1a95a13f-0349-431c-878d-063e1ab2b03b','openid-connect',-1,1,0,'OU Graduation Client',1,'client-secret','','OU Graduation Client',NULL,1,1,1,0),('d92e4588-d622-4c11-a9d0-322c3aeb15af',1,0,'broker',0,0,NULL,NULL,1,NULL,0,'818b284a-a54c-4c96-a9d0-bb89323c0677','openid-connect',0,0,0,'${client_broker}',0,'client-secret',NULL,NULL,NULL,1,0,0,0),('e05b9cae-aa75-426c-a7b6-bba768e8fa6e',1,0,'account',0,1,NULL,'/realms/ou-graduation-realm/account/',0,NULL,0,'1a95a13f-0349-431c-878d-063e1ab2b03b','openid-connect',0,0,0,'${client_account}',0,'client-secret','${authBaseUrl}',NULL,NULL,1,0,0,0),('edc5ffa7-7c0d-4e4a-bccb-ead45ac8a057',1,0,'account',0,1,NULL,'/realms/master/account/',0,NULL,0,'818b284a-a54c-4c96-a9d0-bb89323c0677','openid-connect',0,0,0,'${client_account}',0,'client-secret','${authBaseUrl}',NULL,NULL,1,0,0,0);
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
INSERT INTO `CLIENT_ATTRIBUTES` VALUES ('05b9931f-0ca3-4fcd-97c0-9fab2d2344fb','pkce.code.challenge.method','S256'),('05b9931f-0ca3-4fcd-97c0-9fab2d2344fb','post.logout.redirect.uris','+'),('88461b68-c1c9-4f07-971a-81fdf4d087e5','pkce.code.challenge.method','S256'),('88461b68-c1c9-4f07-971a-81fdf4d087e5','post.logout.redirect.uris','+'),('b5668e36-56c8-436a-b767-eafb09b8a77e','pkce.code.challenge.method','S256'),('b5668e36-56c8-436a-b767-eafb09b8a77e','post.logout.redirect.uris','+'),('ba4a9551-9e5c-4610-88e9-11a09c8d4307','pkce.code.challenge.method','S256'),('ba4a9551-9e5c-4610-88e9-11a09c8d4307','post.logout.redirect.uris','+'),('bccba2a3-e060-4ae3-8279-2bb9695af129','backchannel.logout.revoke.offline.tokens','false'),('bccba2a3-e060-4ae3-8279-2bb9695af129','backchannel.logout.session.required','true'),('bccba2a3-e060-4ae3-8279-2bb9695af129','client.secret.creation.time','1711619815'),('bccba2a3-e060-4ae3-8279-2bb9695af129','oauth2.device.authorization.grant.enabled','false'),('bccba2a3-e060-4ae3-8279-2bb9695af129','oidc.ciba.grant.enabled','false'),('e05b9cae-aa75-426c-a7b6-bba768e8fa6e','post.logout.redirect.uris','+'),('edc5ffa7-7c0d-4e4a-bccb-ead45ac8a057','post.logout.redirect.uris','+');
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
INSERT INTO `CLIENT_SCOPE` VALUES ('0695b0f1-0d54-4ca3-99ff-e67e6156a90c','microprofile-jwt','818b284a-a54c-4c96-a9d0-bb89323c0677','Microprofile - JWT built-in scope','openid-connect'),('2b207451-e232-4dd7-9d58-156745031682','web-origins','818b284a-a54c-4c96-a9d0-bb89323c0677','OpenID Connect scope for add allowed web origins to the access token','openid-connect'),('3aeffac9-fa4e-466b-8efe-c8a8d61c7488','acr','818b284a-a54c-4c96-a9d0-bb89323c0677','OpenID Connect scope for add acr (authentication context class reference) to the token','openid-connect'),('42f6dd38-4f90-46a9-ae94-923d87f3c9c2','roles','1a95a13f-0349-431c-878d-063e1ab2b03b','OpenID Connect scope for add user roles to the access token','openid-connect'),('51267221-5a74-47ff-8c2c-6fc9619a04f6','profile','1a95a13f-0349-431c-878d-063e1ab2b03b','OpenID Connect built-in scope: profile','openid-connect'),('52631fd4-d536-4979-853b-7cd1885d5288','role_list','1a95a13f-0349-431c-878d-063e1ab2b03b','SAML role list','saml'),('617da333-bf9c-433c-8069-e68dca34d60d','roles','818b284a-a54c-4c96-a9d0-bb89323c0677','OpenID Connect scope for add user roles to the access token','openid-connect'),('697398e9-a60e-4eea-9574-ed8ec93f61e3','acr','1a95a13f-0349-431c-878d-063e1ab2b03b','OpenID Connect scope for add acr (authentication context class reference) to the token','openid-connect'),('7a541fdb-70d8-4124-9ab7-a7a1f2afd1ab','phone','818b284a-a54c-4c96-a9d0-bb89323c0677','OpenID Connect built-in scope: phone','openid-connect'),('8f72f79f-5523-4bd3-adfc-f29b95839c18','profile','818b284a-a54c-4c96-a9d0-bb89323c0677','OpenID Connect built-in scope: profile','openid-connect'),('97e7fe6d-ed01-415a-987e-9af8f5675fbe','phone','1a95a13f-0349-431c-878d-063e1ab2b03b','OpenID Connect built-in scope: phone','openid-connect'),('a5f18d95-cb6d-479a-98eb-8ab03c3bf47c','microprofile-jwt','1a95a13f-0349-431c-878d-063e1ab2b03b','Microprofile - JWT built-in scope','openid-connect'),('b20e2c9b-e685-4cf3-ab12-a568f7fe0c88','offline_access','818b284a-a54c-4c96-a9d0-bb89323c0677','OpenID Connect built-in scope: offline_access','openid-connect'),('b781552b-a871-4707-be1c-e09976d87669','address','818b284a-a54c-4c96-a9d0-bb89323c0677','OpenID Connect built-in scope: address','openid-connect'),('b8f28c8b-a985-42db-9f59-bd1e89faf9b8','email','1a95a13f-0349-431c-878d-063e1ab2b03b','OpenID Connect built-in scope: email','openid-connect'),('c5297cdd-76e0-4e1c-9805-63caf00e148e','role_list','818b284a-a54c-4c96-a9d0-bb89323c0677','SAML role list','saml'),('d4a22cf3-e2be-45c5-8c5e-63c0d4a2e5fb','email','818b284a-a54c-4c96-a9d0-bb89323c0677','OpenID Connect built-in scope: email','openid-connect'),('e8164302-d993-4362-a36b-6728df6591a6','offline_access','1a95a13f-0349-431c-878d-063e1ab2b03b','OpenID Connect built-in scope: offline_access','openid-connect'),('f198d984-4117-4285-883d-71d3e9dc68ac','web-origins','1a95a13f-0349-431c-878d-063e1ab2b03b','OpenID Connect scope for add allowed web origins to the access token','openid-connect'),('f4bf617b-7b91-4dc8-808e-b62961e11dcf','address','1a95a13f-0349-431c-878d-063e1ab2b03b','OpenID Connect built-in scope: address','openid-connect');
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
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES ('0695b0f1-0d54-4ca3-99ff-e67e6156a90c','false','display.on.consent.screen'),('0695b0f1-0d54-4ca3-99ff-e67e6156a90c','true','include.in.token.scope'),('2b207451-e232-4dd7-9d58-156745031682','','consent.screen.text'),('2b207451-e232-4dd7-9d58-156745031682','false','display.on.consent.screen'),('2b207451-e232-4dd7-9d58-156745031682','false','include.in.token.scope'),('3aeffac9-fa4e-466b-8efe-c8a8d61c7488','false','display.on.consent.screen'),('3aeffac9-fa4e-466b-8efe-c8a8d61c7488','false','include.in.token.scope'),('42f6dd38-4f90-46a9-ae94-923d87f3c9c2','${rolesScopeConsentText}','consent.screen.text'),('42f6dd38-4f90-46a9-ae94-923d87f3c9c2','true','display.on.consent.screen'),('42f6dd38-4f90-46a9-ae94-923d87f3c9c2','false','include.in.token.scope'),('51267221-5a74-47ff-8c2c-6fc9619a04f6','${profileScopeConsentText}','consent.screen.text'),('51267221-5a74-47ff-8c2c-6fc9619a04f6','true','display.on.consent.screen'),('51267221-5a74-47ff-8c2c-6fc9619a04f6','true','include.in.token.scope'),('52631fd4-d536-4979-853b-7cd1885d5288','${samlRoleListScopeConsentText}','consent.screen.text'),('52631fd4-d536-4979-853b-7cd1885d5288','true','display.on.consent.screen'),('617da333-bf9c-433c-8069-e68dca34d60d','${rolesScopeConsentText}','consent.screen.text'),('617da333-bf9c-433c-8069-e68dca34d60d','true','display.on.consent.screen'),('617da333-bf9c-433c-8069-e68dca34d60d','false','include.in.token.scope'),('697398e9-a60e-4eea-9574-ed8ec93f61e3','false','display.on.consent.screen'),('697398e9-a60e-4eea-9574-ed8ec93f61e3','false','include.in.token.scope'),('7a541fdb-70d8-4124-9ab7-a7a1f2afd1ab','${phoneScopeConsentText}','consent.screen.text'),('7a541fdb-70d8-4124-9ab7-a7a1f2afd1ab','true','display.on.consent.screen'),('7a541fdb-70d8-4124-9ab7-a7a1f2afd1ab','true','include.in.token.scope'),('8f72f79f-5523-4bd3-adfc-f29b95839c18','${profileScopeConsentText}','consent.screen.text'),('8f72f79f-5523-4bd3-adfc-f29b95839c18','true','display.on.consent.screen'),('8f72f79f-5523-4bd3-adfc-f29b95839c18','true','include.in.token.scope'),('97e7fe6d-ed01-415a-987e-9af8f5675fbe','${phoneScopeConsentText}','consent.screen.text'),('97e7fe6d-ed01-415a-987e-9af8f5675fbe','true','display.on.consent.screen'),('97e7fe6d-ed01-415a-987e-9af8f5675fbe','true','include.in.token.scope'),('a5f18d95-cb6d-479a-98eb-8ab03c3bf47c','false','display.on.consent.screen'),('a5f18d95-cb6d-479a-98eb-8ab03c3bf47c','true','include.in.token.scope'),('b20e2c9b-e685-4cf3-ab12-a568f7fe0c88','${offlineAccessScopeConsentText}','consent.screen.text'),('b20e2c9b-e685-4cf3-ab12-a568f7fe0c88','true','display.on.consent.screen'),('b781552b-a871-4707-be1c-e09976d87669','${addressScopeConsentText}','consent.screen.text'),('b781552b-a871-4707-be1c-e09976d87669','true','display.on.consent.screen'),('b781552b-a871-4707-be1c-e09976d87669','true','include.in.token.scope'),('b8f28c8b-a985-42db-9f59-bd1e89faf9b8','${emailScopeConsentText}','consent.screen.text'),('b8f28c8b-a985-42db-9f59-bd1e89faf9b8','true','display.on.consent.screen'),('b8f28c8b-a985-42db-9f59-bd1e89faf9b8','true','include.in.token.scope'),('c5297cdd-76e0-4e1c-9805-63caf00e148e','${samlRoleListScopeConsentText}','consent.screen.text'),('c5297cdd-76e0-4e1c-9805-63caf00e148e','true','display.on.consent.screen'),('d4a22cf3-e2be-45c5-8c5e-63c0d4a2e5fb','${emailScopeConsentText}','consent.screen.text'),('d4a22cf3-e2be-45c5-8c5e-63c0d4a2e5fb','true','display.on.consent.screen'),('d4a22cf3-e2be-45c5-8c5e-63c0d4a2e5fb','true','include.in.token.scope'),('e8164302-d993-4362-a36b-6728df6591a6','${offlineAccessScopeConsentText}','consent.screen.text'),('e8164302-d993-4362-a36b-6728df6591a6','true','display.on.consent.screen'),('f198d984-4117-4285-883d-71d3e9dc68ac','','consent.screen.text'),('f198d984-4117-4285-883d-71d3e9dc68ac','false','display.on.consent.screen'),('f198d984-4117-4285-883d-71d3e9dc68ac','false','include.in.token.scope'),('f4bf617b-7b91-4dc8-808e-b62961e11dcf','${addressScopeConsentText}','consent.screen.text'),('f4bf617b-7b91-4dc8-808e-b62961e11dcf','true','display.on.consent.screen'),('f4bf617b-7b91-4dc8-808e-b62961e11dcf','true','include.in.token.scope');
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
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('05b9931f-0ca3-4fcd-97c0-9fab2d2344fb','42f6dd38-4f90-46a9-ae94-923d87f3c9c2',1),('05b9931f-0ca3-4fcd-97c0-9fab2d2344fb','51267221-5a74-47ff-8c2c-6fc9619a04f6',1),('05b9931f-0ca3-4fcd-97c0-9fab2d2344fb','697398e9-a60e-4eea-9574-ed8ec93f61e3',1),('05b9931f-0ca3-4fcd-97c0-9fab2d2344fb','97e7fe6d-ed01-415a-987e-9af8f5675fbe',0),('05b9931f-0ca3-4fcd-97c0-9fab2d2344fb','a5f18d95-cb6d-479a-98eb-8ab03c3bf47c',0),('05b9931f-0ca3-4fcd-97c0-9fab2d2344fb','b8f28c8b-a985-42db-9f59-bd1e89faf9b8',1),('05b9931f-0ca3-4fcd-97c0-9fab2d2344fb','e8164302-d993-4362-a36b-6728df6591a6',0),('05b9931f-0ca3-4fcd-97c0-9fab2d2344fb','f198d984-4117-4285-883d-71d3e9dc68ac',1),('05b9931f-0ca3-4fcd-97c0-9fab2d2344fb','f4bf617b-7b91-4dc8-808e-b62961e11dcf',0),('083ce7c5-fe29-4a00-90de-087868fbc92c','42f6dd38-4f90-46a9-ae94-923d87f3c9c2',1),('083ce7c5-fe29-4a00-90de-087868fbc92c','51267221-5a74-47ff-8c2c-6fc9619a04f6',1),('083ce7c5-fe29-4a00-90de-087868fbc92c','697398e9-a60e-4eea-9574-ed8ec93f61e3',1),('083ce7c5-fe29-4a00-90de-087868fbc92c','97e7fe6d-ed01-415a-987e-9af8f5675fbe',0),('083ce7c5-fe29-4a00-90de-087868fbc92c','a5f18d95-cb6d-479a-98eb-8ab03c3bf47c',0),('083ce7c5-fe29-4a00-90de-087868fbc92c','b8f28c8b-a985-42db-9f59-bd1e89faf9b8',1),('083ce7c5-fe29-4a00-90de-087868fbc92c','e8164302-d993-4362-a36b-6728df6591a6',0),('083ce7c5-fe29-4a00-90de-087868fbc92c','f198d984-4117-4285-883d-71d3e9dc68ac',1),('083ce7c5-fe29-4a00-90de-087868fbc92c','f4bf617b-7b91-4dc8-808e-b62961e11dcf',0),('2cd8fad4-80b6-4d23-87b4-12861f29edc6','0695b0f1-0d54-4ca3-99ff-e67e6156a90c',0),('2cd8fad4-80b6-4d23-87b4-12861f29edc6','2b207451-e232-4dd7-9d58-156745031682',1),('2cd8fad4-80b6-4d23-87b4-12861f29edc6','3aeffac9-fa4e-466b-8efe-c8a8d61c7488',1),('2cd8fad4-80b6-4d23-87b4-12861f29edc6','617da333-bf9c-433c-8069-e68dca34d60d',1),('2cd8fad4-80b6-4d23-87b4-12861f29edc6','7a541fdb-70d8-4124-9ab7-a7a1f2afd1ab',0),('2cd8fad4-80b6-4d23-87b4-12861f29edc6','8f72f79f-5523-4bd3-adfc-f29b95839c18',1),('2cd8fad4-80b6-4d23-87b4-12861f29edc6','b20e2c9b-e685-4cf3-ab12-a568f7fe0c88',0),('2cd8fad4-80b6-4d23-87b4-12861f29edc6','b781552b-a871-4707-be1c-e09976d87669',0),('2cd8fad4-80b6-4d23-87b4-12861f29edc6','d4a22cf3-e2be-45c5-8c5e-63c0d4a2e5fb',1),('71c9944f-b05a-4bb4-89a7-fb550386322c','42f6dd38-4f90-46a9-ae94-923d87f3c9c2',1),('71c9944f-b05a-4bb4-89a7-fb550386322c','51267221-5a74-47ff-8c2c-6fc9619a04f6',1),('71c9944f-b05a-4bb4-89a7-fb550386322c','697398e9-a60e-4eea-9574-ed8ec93f61e3',1),('71c9944f-b05a-4bb4-89a7-fb550386322c','97e7fe6d-ed01-415a-987e-9af8f5675fbe',0),('71c9944f-b05a-4bb4-89a7-fb550386322c','a5f18d95-cb6d-479a-98eb-8ab03c3bf47c',0),('71c9944f-b05a-4bb4-89a7-fb550386322c','b8f28c8b-a985-42db-9f59-bd1e89faf9b8',1),('71c9944f-b05a-4bb4-89a7-fb550386322c','e8164302-d993-4362-a36b-6728df6591a6',0),('71c9944f-b05a-4bb4-89a7-fb550386322c','f198d984-4117-4285-883d-71d3e9dc68ac',1),('71c9944f-b05a-4bb4-89a7-fb550386322c','f4bf617b-7b91-4dc8-808e-b62961e11dcf',0),('86e02814-d7e0-4d8e-9edb-6a1963d69e01','0695b0f1-0d54-4ca3-99ff-e67e6156a90c',0),('86e02814-d7e0-4d8e-9edb-6a1963d69e01','2b207451-e232-4dd7-9d58-156745031682',1),('86e02814-d7e0-4d8e-9edb-6a1963d69e01','3aeffac9-fa4e-466b-8efe-c8a8d61c7488',1),('86e02814-d7e0-4d8e-9edb-6a1963d69e01','617da333-bf9c-433c-8069-e68dca34d60d',1),('86e02814-d7e0-4d8e-9edb-6a1963d69e01','7a541fdb-70d8-4124-9ab7-a7a1f2afd1ab',0),('86e02814-d7e0-4d8e-9edb-6a1963d69e01','8f72f79f-5523-4bd3-adfc-f29b95839c18',1),('86e02814-d7e0-4d8e-9edb-6a1963d69e01','b20e2c9b-e685-4cf3-ab12-a568f7fe0c88',0),('86e02814-d7e0-4d8e-9edb-6a1963d69e01','b781552b-a871-4707-be1c-e09976d87669',0),('86e02814-d7e0-4d8e-9edb-6a1963d69e01','d4a22cf3-e2be-45c5-8c5e-63c0d4a2e5fb',1),('88461b68-c1c9-4f07-971a-81fdf4d087e5','0695b0f1-0d54-4ca3-99ff-e67e6156a90c',0),('88461b68-c1c9-4f07-971a-81fdf4d087e5','2b207451-e232-4dd7-9d58-156745031682',1),('88461b68-c1c9-4f07-971a-81fdf4d087e5','3aeffac9-fa4e-466b-8efe-c8a8d61c7488',1),('88461b68-c1c9-4f07-971a-81fdf4d087e5','617da333-bf9c-433c-8069-e68dca34d60d',1),('88461b68-c1c9-4f07-971a-81fdf4d087e5','7a541fdb-70d8-4124-9ab7-a7a1f2afd1ab',0),('88461b68-c1c9-4f07-971a-81fdf4d087e5','8f72f79f-5523-4bd3-adfc-f29b95839c18',1),('88461b68-c1c9-4f07-971a-81fdf4d087e5','b20e2c9b-e685-4cf3-ab12-a568f7fe0c88',0),('88461b68-c1c9-4f07-971a-81fdf4d087e5','b781552b-a871-4707-be1c-e09976d87669',0),('88461b68-c1c9-4f07-971a-81fdf4d087e5','d4a22cf3-e2be-45c5-8c5e-63c0d4a2e5fb',1),('9292b5d7-9a28-4fb1-bab8-65c19b3334cb','42f6dd38-4f90-46a9-ae94-923d87f3c9c2',1),('9292b5d7-9a28-4fb1-bab8-65c19b3334cb','51267221-5a74-47ff-8c2c-6fc9619a04f6',1),('9292b5d7-9a28-4fb1-bab8-65c19b3334cb','697398e9-a60e-4eea-9574-ed8ec93f61e3',1),('9292b5d7-9a28-4fb1-bab8-65c19b3334cb','97e7fe6d-ed01-415a-987e-9af8f5675fbe',0),('9292b5d7-9a28-4fb1-bab8-65c19b3334cb','a5f18d95-cb6d-479a-98eb-8ab03c3bf47c',0),('9292b5d7-9a28-4fb1-bab8-65c19b3334cb','b8f28c8b-a985-42db-9f59-bd1e89faf9b8',1),('9292b5d7-9a28-4fb1-bab8-65c19b3334cb','e8164302-d993-4362-a36b-6728df6591a6',0),('9292b5d7-9a28-4fb1-bab8-65c19b3334cb','f198d984-4117-4285-883d-71d3e9dc68ac',1),('9292b5d7-9a28-4fb1-bab8-65c19b3334cb','f4bf617b-7b91-4dc8-808e-b62961e11dcf',0),('b5668e36-56c8-436a-b767-eafb09b8a77e','0695b0f1-0d54-4ca3-99ff-e67e6156a90c',0),('b5668e36-56c8-436a-b767-eafb09b8a77e','2b207451-e232-4dd7-9d58-156745031682',1),('b5668e36-56c8-436a-b767-eafb09b8a77e','3aeffac9-fa4e-466b-8efe-c8a8d61c7488',1),('b5668e36-56c8-436a-b767-eafb09b8a77e','617da333-bf9c-433c-8069-e68dca34d60d',1),('b5668e36-56c8-436a-b767-eafb09b8a77e','7a541fdb-70d8-4124-9ab7-a7a1f2afd1ab',0),('b5668e36-56c8-436a-b767-eafb09b8a77e','8f72f79f-5523-4bd3-adfc-f29b95839c18',1),('b5668e36-56c8-436a-b767-eafb09b8a77e','b20e2c9b-e685-4cf3-ab12-a568f7fe0c88',0),('b5668e36-56c8-436a-b767-eafb09b8a77e','b781552b-a871-4707-be1c-e09976d87669',0),('b5668e36-56c8-436a-b767-eafb09b8a77e','d4a22cf3-e2be-45c5-8c5e-63c0d4a2e5fb',1),('ba4a9551-9e5c-4610-88e9-11a09c8d4307','42f6dd38-4f90-46a9-ae94-923d87f3c9c2',1),('ba4a9551-9e5c-4610-88e9-11a09c8d4307','51267221-5a74-47ff-8c2c-6fc9619a04f6',1),('ba4a9551-9e5c-4610-88e9-11a09c8d4307','697398e9-a60e-4eea-9574-ed8ec93f61e3',1),('ba4a9551-9e5c-4610-88e9-11a09c8d4307','97e7fe6d-ed01-415a-987e-9af8f5675fbe',0),('ba4a9551-9e5c-4610-88e9-11a09c8d4307','a5f18d95-cb6d-479a-98eb-8ab03c3bf47c',0),('ba4a9551-9e5c-4610-88e9-11a09c8d4307','b8f28c8b-a985-42db-9f59-bd1e89faf9b8',1),('ba4a9551-9e5c-4610-88e9-11a09c8d4307','e8164302-d993-4362-a36b-6728df6591a6',0),('ba4a9551-9e5c-4610-88e9-11a09c8d4307','f198d984-4117-4285-883d-71d3e9dc68ac',1),('ba4a9551-9e5c-4610-88e9-11a09c8d4307','f4bf617b-7b91-4dc8-808e-b62961e11dcf',0),('bccba2a3-e060-4ae3-8279-2bb9695af129','42f6dd38-4f90-46a9-ae94-923d87f3c9c2',1),('bccba2a3-e060-4ae3-8279-2bb9695af129','51267221-5a74-47ff-8c2c-6fc9619a04f6',1),('bccba2a3-e060-4ae3-8279-2bb9695af129','697398e9-a60e-4eea-9574-ed8ec93f61e3',1),('bccba2a3-e060-4ae3-8279-2bb9695af129','97e7fe6d-ed01-415a-987e-9af8f5675fbe',0),('bccba2a3-e060-4ae3-8279-2bb9695af129','a5f18d95-cb6d-479a-98eb-8ab03c3bf47c',0),('bccba2a3-e060-4ae3-8279-2bb9695af129','b8f28c8b-a985-42db-9f59-bd1e89faf9b8',1),('bccba2a3-e060-4ae3-8279-2bb9695af129','e8164302-d993-4362-a36b-6728df6591a6',0),('bccba2a3-e060-4ae3-8279-2bb9695af129','f198d984-4117-4285-883d-71d3e9dc68ac',1),('bccba2a3-e060-4ae3-8279-2bb9695af129','f4bf617b-7b91-4dc8-808e-b62961e11dcf',0),('d92e4588-d622-4c11-a9d0-322c3aeb15af','0695b0f1-0d54-4ca3-99ff-e67e6156a90c',0),('d92e4588-d622-4c11-a9d0-322c3aeb15af','2b207451-e232-4dd7-9d58-156745031682',1),('d92e4588-d622-4c11-a9d0-322c3aeb15af','3aeffac9-fa4e-466b-8efe-c8a8d61c7488',1),('d92e4588-d622-4c11-a9d0-322c3aeb15af','617da333-bf9c-433c-8069-e68dca34d60d',1),('d92e4588-d622-4c11-a9d0-322c3aeb15af','7a541fdb-70d8-4124-9ab7-a7a1f2afd1ab',0),('d92e4588-d622-4c11-a9d0-322c3aeb15af','8f72f79f-5523-4bd3-adfc-f29b95839c18',1),('d92e4588-d622-4c11-a9d0-322c3aeb15af','b20e2c9b-e685-4cf3-ab12-a568f7fe0c88',0),('d92e4588-d622-4c11-a9d0-322c3aeb15af','b781552b-a871-4707-be1c-e09976d87669',0),('d92e4588-d622-4c11-a9d0-322c3aeb15af','d4a22cf3-e2be-45c5-8c5e-63c0d4a2e5fb',1),('e05b9cae-aa75-426c-a7b6-bba768e8fa6e','42f6dd38-4f90-46a9-ae94-923d87f3c9c2',1),('e05b9cae-aa75-426c-a7b6-bba768e8fa6e','51267221-5a74-47ff-8c2c-6fc9619a04f6',1),('e05b9cae-aa75-426c-a7b6-bba768e8fa6e','697398e9-a60e-4eea-9574-ed8ec93f61e3',1),('e05b9cae-aa75-426c-a7b6-bba768e8fa6e','97e7fe6d-ed01-415a-987e-9af8f5675fbe',0),('e05b9cae-aa75-426c-a7b6-bba768e8fa6e','a5f18d95-cb6d-479a-98eb-8ab03c3bf47c',0),('e05b9cae-aa75-426c-a7b6-bba768e8fa6e','b8f28c8b-a985-42db-9f59-bd1e89faf9b8',1),('e05b9cae-aa75-426c-a7b6-bba768e8fa6e','e8164302-d993-4362-a36b-6728df6591a6',0),('e05b9cae-aa75-426c-a7b6-bba768e8fa6e','f198d984-4117-4285-883d-71d3e9dc68ac',1),('e05b9cae-aa75-426c-a7b6-bba768e8fa6e','f4bf617b-7b91-4dc8-808e-b62961e11dcf',0),('edc5ffa7-7c0d-4e4a-bccb-ead45ac8a057','0695b0f1-0d54-4ca3-99ff-e67e6156a90c',0),('edc5ffa7-7c0d-4e4a-bccb-ead45ac8a057','2b207451-e232-4dd7-9d58-156745031682',1),('edc5ffa7-7c0d-4e4a-bccb-ead45ac8a057','3aeffac9-fa4e-466b-8efe-c8a8d61c7488',1),('edc5ffa7-7c0d-4e4a-bccb-ead45ac8a057','617da333-bf9c-433c-8069-e68dca34d60d',1),('edc5ffa7-7c0d-4e4a-bccb-ead45ac8a057','7a541fdb-70d8-4124-9ab7-a7a1f2afd1ab',0),('edc5ffa7-7c0d-4e4a-bccb-ead45ac8a057','8f72f79f-5523-4bd3-adfc-f29b95839c18',1),('edc5ffa7-7c0d-4e4a-bccb-ead45ac8a057','b20e2c9b-e685-4cf3-ab12-a568f7fe0c88',0),('edc5ffa7-7c0d-4e4a-bccb-ead45ac8a057','b781552b-a871-4707-be1c-e09976d87669',0),('edc5ffa7-7c0d-4e4a-bccb-ead45ac8a057','d4a22cf3-e2be-45c5-8c5e-63c0d4a2e5fb',1);
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
INSERT INTO `CLIENT_SCOPE_ROLE_MAPPING` VALUES ('b20e2c9b-e685-4cf3-ab12-a568f7fe0c88','b63ce783-a95b-42e7-9aab-cb866eed050d'),('e8164302-d993-4362-a36b-6728df6591a6','bd01b954-b5aa-45bc-9658-8328afafe67f');
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
INSERT INTO `COMPONENT` VALUES ('00e0feb2-aa12-408a-8558-2b62099ca43d','rsa-enc-generated','818b284a-a54c-4c96-a9d0-bb89323c0677','rsa-enc-generated','org.keycloak.keys.KeyProvider','818b284a-a54c-4c96-a9d0-bb89323c0677',NULL),('0b2a3bfe-0191-408d-b252-2d120cf48adf','Allowed Client Scopes','1a95a13f-0349-431c-878d-063e1ab2b03b','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','1a95a13f-0349-431c-878d-063e1ab2b03b','authenticated'),('1a1e48cd-0141-43e6-b563-6f52fc2f70d9','Consent Required','1a95a13f-0349-431c-878d-063e1ab2b03b','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','1a95a13f-0349-431c-878d-063e1ab2b03b','anonymous'),('27cd17a8-0528-4fd4-b51a-96041d0ef43c','hmac-generated-hs512','818b284a-a54c-4c96-a9d0-bb89323c0677','hmac-generated','org.keycloak.keys.KeyProvider','818b284a-a54c-4c96-a9d0-bb89323c0677',NULL),('310e7faf-2c4d-42e1-b27a-c1f532352641','Allowed Client Scopes','818b284a-a54c-4c96-a9d0-bb89323c0677','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','818b284a-a54c-4c96-a9d0-bb89323c0677','anonymous'),('37ca5ca3-ca9d-4bad-a30e-227f2ad09205','rsa-generated','818b284a-a54c-4c96-a9d0-bb89323c0677','rsa-generated','org.keycloak.keys.KeyProvider','818b284a-a54c-4c96-a9d0-bb89323c0677',NULL),('3afdbb0e-d1e9-48d2-9820-6d6b1682d80f','Max Clients Limit','1a95a13f-0349-431c-878d-063e1ab2b03b','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','1a95a13f-0349-431c-878d-063e1ab2b03b','anonymous'),('4c74adf2-0377-4807-83b0-037c832a673f','Allowed Protocol Mapper Types','818b284a-a54c-4c96-a9d0-bb89323c0677','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','818b284a-a54c-4c96-a9d0-bb89323c0677','anonymous'),('501c351c-7a34-4059-a6d8-9bec8a9145d5','hmac-generated-hs512','1a95a13f-0349-431c-878d-063e1ab2b03b','hmac-generated','org.keycloak.keys.KeyProvider','1a95a13f-0349-431c-878d-063e1ab2b03b',NULL),('504374eb-f34b-4fe9-8426-dfee2656667c','Full Scope Disabled','1a95a13f-0349-431c-878d-063e1ab2b03b','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','1a95a13f-0349-431c-878d-063e1ab2b03b','anonymous'),('51156eb2-a38b-4b97-ab24-f9eee470edce','Allowed Protocol Mapper Types','818b284a-a54c-4c96-a9d0-bb89323c0677','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','818b284a-a54c-4c96-a9d0-bb89323c0677','authenticated'),('5535cd43-ad8d-4522-ae1e-625b31a7a34b','Max Clients Limit','818b284a-a54c-4c96-a9d0-bb89323c0677','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','818b284a-a54c-4c96-a9d0-bb89323c0677','anonymous'),('66fa6177-f226-4e15-963d-fbeee102ef44','aes-generated','818b284a-a54c-4c96-a9d0-bb89323c0677','aes-generated','org.keycloak.keys.KeyProvider','818b284a-a54c-4c96-a9d0-bb89323c0677',NULL),('8bc57c37-eacd-4fce-9267-bd1736a42207',NULL,'1a95a13f-0349-431c-878d-063e1ab2b03b','declarative-user-profile','org.keycloak.userprofile.UserProfileProvider','1a95a13f-0349-431c-878d-063e1ab2b03b',NULL),('8e965b46-7ed3-4879-9f79-2ba60d1c7ea9','rsa-generated','1a95a13f-0349-431c-878d-063e1ab2b03b','rsa-generated','org.keycloak.keys.KeyProvider','1a95a13f-0349-431c-878d-063e1ab2b03b',NULL),('a1afbf67-2343-430d-aa27-07744f1f1022',NULL,'818b284a-a54c-4c96-a9d0-bb89323c0677','declarative-user-profile','org.keycloak.userprofile.UserProfileProvider','818b284a-a54c-4c96-a9d0-bb89323c0677',NULL),('a3c16faa-d0f2-47f5-b272-ecb7af1daab0','Trusted Hosts','1a95a13f-0349-431c-878d-063e1ab2b03b','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','1a95a13f-0349-431c-878d-063e1ab2b03b','anonymous'),('a4ecbebd-d09f-4825-9c16-bcc03087fe92','Allowed Protocol Mapper Types','1a95a13f-0349-431c-878d-063e1ab2b03b','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','1a95a13f-0349-431c-878d-063e1ab2b03b','authenticated'),('ad3e4587-9f9a-43f8-89e5-53ffed0950cc','aes-generated','1a95a13f-0349-431c-878d-063e1ab2b03b','aes-generated','org.keycloak.keys.KeyProvider','1a95a13f-0349-431c-878d-063e1ab2b03b',NULL),('ba435529-7e8d-4132-a3b9-cfcde18e8dd2','Allowed Client Scopes','818b284a-a54c-4c96-a9d0-bb89323c0677','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','818b284a-a54c-4c96-a9d0-bb89323c0677','authenticated'),('c216f769-bf67-4254-bf4c-7e7b99ab8627','Consent Required','818b284a-a54c-4c96-a9d0-bb89323c0677','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','818b284a-a54c-4c96-a9d0-bb89323c0677','anonymous'),('c44d3583-4e5f-4ad6-ab20-d69657e89145','Allowed Client Scopes','1a95a13f-0349-431c-878d-063e1ab2b03b','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','1a95a13f-0349-431c-878d-063e1ab2b03b','anonymous'),('c5d0cd1f-0047-4acf-93e5-7a412f2bfcb5','Allowed Protocol Mapper Types','1a95a13f-0349-431c-878d-063e1ab2b03b','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','1a95a13f-0349-431c-878d-063e1ab2b03b','anonymous'),('ce7c47e8-bd35-48a6-bb8f-49e5632ec1e5','Trusted Hosts','818b284a-a54c-4c96-a9d0-bb89323c0677','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','818b284a-a54c-4c96-a9d0-bb89323c0677','anonymous'),('d890e1eb-7395-4917-ac9e-c57a01dca116','rsa-enc-generated','1a95a13f-0349-431c-878d-063e1ab2b03b','rsa-enc-generated','org.keycloak.keys.KeyProvider','1a95a13f-0349-431c-878d-063e1ab2b03b',NULL),('e35c160f-92d4-4be3-86de-1cff25badd1f','Full Scope Disabled','818b284a-a54c-4c96-a9d0-bb89323c0677','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','818b284a-a54c-4c96-a9d0-bb89323c0677','anonymous');
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
INSERT INTO `COMPONENT_CONFIG` VALUES ('12e83418-b82b-4b29-8009-c7a5fc6b5e0a','4c74adf2-0377-4807-83b0-037c832a673f','allowed-protocol-mapper-types','oidc-full-name-mapper'),('164c555e-631c-4dce-bee8-68c62b7496af','4c74adf2-0377-4807-83b0-037c832a673f','allowed-protocol-mapper-types','saml-user-property-mapper'),('180d24f4-129c-4d74-b44b-f865a10cef96','00e0feb2-aa12-408a-8558-2b62099ca43d','keyUse','ENC'),('18dd2368-95c8-43e6-ab71-2387694c7a75','ad3e4587-9f9a-43f8-89e5-53ffed0950cc','kid','8774c0b5-1306-49c6-8417-942fde64cb5f'),('190986f7-4e61-467d-baac-33a901def9c2','501c351c-7a34-4059-a6d8-9bec8a9145d5','kid','8acf6a82-5fcf-4dfc-89d7-1226adae3696'),('199e09df-a453-48ec-99b9-7416a5d48864','d890e1eb-7395-4917-ac9e-c57a01dca116','priority','100'),('1ec66f00-4a92-4e88-9886-ecb60d243aeb','66fa6177-f226-4e15-963d-fbeee102ef44','kid','80814261-4dfd-4edc-8e4b-3a2e15c2b8c4'),('22c06713-7748-4d57-9783-6254d91ab9fe','51156eb2-a38b-4b97-ab24-f9eee470edce','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('27bf6a98-17e6-4301-9203-2e7b7fb78e0e','a1afbf67-2343-430d-aa27-07744f1f1022','kc.user.profile.config','{\"attributes\":[{\"name\":\"username\",\"displayName\":\"${username}\",\"validations\":{\"length\":{\"min\":3,\"max\":255},\"username-prohibited-characters\":{},\"up-username-not-idn-homograph\":{}},\"permissions\":{\"view\":[\"admin\",\"user\"],\"edit\":[\"admin\",\"user\"]},\"multivalued\":false},{\"name\":\"email\",\"displayName\":\"${email}\",\"validations\":{\"email\":{},\"length\":{\"max\":255}},\"permissions\":{\"view\":[\"admin\",\"user\"],\"edit\":[\"admin\",\"user\"]},\"multivalued\":false},{\"name\":\"firstName\",\"displayName\":\"${firstName}\",\"validations\":{\"length\":{\"max\":255},\"person-name-prohibited-characters\":{}},\"permissions\":{\"view\":[\"admin\",\"user\"],\"edit\":[\"admin\",\"user\"]},\"multivalued\":false},{\"name\":\"lastName\",\"displayName\":\"${lastName}\",\"validations\":{\"length\":{\"max\":255},\"person-name-prohibited-characters\":{}},\"permissions\":{\"view\":[\"admin\",\"user\"],\"edit\":[\"admin\",\"user\"]},\"multivalued\":false}],\"groups\":[{\"name\":\"user-metadata\",\"displayHeader\":\"User metadata\",\"displayDescription\":\"Attributes, which refer to user metadata\"}]}'),('2cfdd32e-a35d-4d95-aa4c-abdf206e41cf','66fa6177-f226-4e15-963d-fbeee102ef44','secret','RaYPkLRcMQ-YPt8-AA-LCA'),('2d461fc9-c7e4-41a7-933f-2b00f1a76ab2','00e0feb2-aa12-408a-8558-2b62099ca43d','priority','100'),('2fdbc5b3-713c-4ac3-bab0-13f1e6d42a5b','d890e1eb-7395-4917-ac9e-c57a01dca116','certificate','MIICtTCCAZ0CBgGOhHy7PTANBgkqhkiG9w0BAQsFADAeMRwwGgYDVQQDDBNvdS1ncmFkdWF0aW9uLXJlYWxtMB4XDTI0MDMyODA5NTQxMFoXDTM0MDMyODA5NTU1MFowHjEcMBoGA1UEAwwTb3UtZ3JhZHVhdGlvbi1yZWFsbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAKzntxVS0NG5ocwV7YQ0NZ8cwpomHVjrpc5PTNLyQznrJRH5N8r+moQP4TxRghApNKXS2KRfnU2J2uplZxE2dGPkxRcAJR5lyZ4mPKIiWjiymthRPbFFowKrcgMNfPk5Yn7gEY96zxnOFv3e7lYXLqpktDp59x6Gqi01fDAmOaIQyhAqdhRtg15ajlGlVdgbBqcATP51qsybx0JSeaMJVsJE0qmUXbN644PwhrI9K4pHWUj0hLx5eMy3IlDphBztSV/TQ6EYMkTOpyubCNs5yYoBKbTnCMdrv5JBTWodIJ2x0gL/u2oG6LH1x83V6kjSHvX7JPVNRpxDSaUQPq2W8GcCAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAhqQsn82c3Q9qWFd3wFJReteukivD30OdVPGj+/FrNUleVlm2Work/wwm4MMySca3MuBdenV3du0TD+ldMmVj5/0XO4EbLJ60kDfHOB+C+POUhVGZ0AsHRcicCFVztMucSOk/TOsEnqacKJDMc6k+aZp+eSYaw/87Oc6TxtoYVGgfbn7hYHwjlNgtYyppDP65GJ1LRCbZTLmsNfb2Av5tauvCYRHJmBgsbrrhjh+bzQekz/NX6nRdQups22CNN4S6FWVjgNfUjOTWD4SVcKOsbSktD1UO8i9oGp/O25MeY2dRFfoCFhVtJUpOGNBSCViMWUxYjRZrzK7T3z3KMZSjSQ=='),('3574bafd-4ec9-4ea7-9553-3f9a4127b212','51156eb2-a38b-4b97-ab24-f9eee470edce','allowed-protocol-mapper-types','saml-user-property-mapper'),('37191e1b-93e8-4339-a7a2-f3fd345223fe','a4ecbebd-d09f-4825-9c16-bcc03087fe92','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('3a6ea251-9a33-4c45-86b8-1908522d06db','27cd17a8-0528-4fd4-b51a-96041d0ef43c','algorithm','HS512'),('41d1cdbf-691c-44d5-890e-cc90b2a4e162','51156eb2-a38b-4b97-ab24-f9eee470edce','allowed-protocol-mapper-types','saml-role-list-mapper'),('42bd3e54-e2c4-4cd0-90a9-b89f7f1cf05b','a4ecbebd-d09f-4825-9c16-bcc03087fe92','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('44eb6451-ecb5-414e-9a62-aebbca8c7c81','a4ecbebd-d09f-4825-9c16-bcc03087fe92','allowed-protocol-mapper-types','saml-user-property-mapper'),('4b85c498-0cdb-424d-acdf-c93f7bc52909','c5d0cd1f-0047-4acf-93e5-7a412f2bfcb5','allowed-protocol-mapper-types','oidc-full-name-mapper'),('4c2319b7-868e-47f8-b494-faba53ac54bd','51156eb2-a38b-4b97-ab24-f9eee470edce','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('4de3cb62-14ca-4953-8606-f78f9aa63777','27cd17a8-0528-4fd4-b51a-96041d0ef43c','kid','68448823-4058-4d2a-a622-acaaaae4608b'),('4e59a2a8-b030-4f85-bfad-8bd38f26af35','3afdbb0e-d1e9-48d2-9820-6d6b1682d80f','max-clients','200'),('5178c078-fe35-46db-bb53-d0eb181ff4ce','c5d0cd1f-0047-4acf-93e5-7a412f2bfcb5','allowed-protocol-mapper-types','saml-role-list-mapper'),('5908a462-86aa-4a69-844f-fd197743e9a4','5535cd43-ad8d-4522-ae1e-625b31a7a34b','max-clients','200'),('5a43b90f-4744-4fb7-8dee-42c54c735e0d','501c351c-7a34-4059-a6d8-9bec8a9145d5','secret','ZPtpUq4RfnAsc2hOkk2rF-cOxjC66cJItMlpphI5cT3-Ae_utaQpLfiEpiMKzRzX-CGLyzfLZYQJlujCRP9MqqsV_wNaD9NMug32i5H1Xg1SQo1Rz9Pm5pQA8NwN6F5dYk95GNvErLnCqs05pRSoH-g5d4QVKuf4y6NzixISfBw'),('5dc5dcca-0b7b-4275-86aa-2ba7d91ed99e','a4ecbebd-d09f-4825-9c16-bcc03087fe92','allowed-protocol-mapper-types','saml-role-list-mapper'),('5e0d750d-529f-4cc2-ad72-fc05b5aaed5a','37ca5ca3-ca9d-4bad-a30e-227f2ad09205','privateKey','MIIEowIBAAKCAQEA0cXs7IjrQiHcpsgUCSPTONMhizB1Rd2F5sHQ7mNGVI1mNnqsqkl3HNFzxTSoYn9xqyGdy6dgiPH0uR0UX5v+ebqB2Oz0SBpXZxbqQj40LuiAKgKrLBNbLDjFSjCvb0PSuI21O8QAz6h98orFxKqOA3+pqGl47LDEGcBpKxuDRv6iKxgIsH7OhqLlwAuS/Rq/UK0oIOZuUQEIhN8TBOQMMcfSBMuIZDHoiZy0mz8E9SYJM2pJesZ97lkF7nWthc5CST39x1bqhZNf10m4MgxOxrXr/v+WZktpjZwc8AUVoHbvDFVJa+x11ZbQXHiAMcYEK4pnpi1y+jwbk3zqykOh4wIDAQABAoIBACFqaE8BkeBAqU0pYAUDX5k/YKozIkCVL3L5JYFj77HLrcrjMxq+hdU3CZG8zU9AwpL30ZK9wI3wD64RPiFA0IJZkxJCz2L7oeKlGX9LOLV5ieOnSyxuj5PKyKVZ0125AxnXplVf5/UsVOvMRAFhCIBG13ghXQbvMuhwkxAv23NKa3KNFamCgUG2tjfw5LfHcxIYPA72u7WGSrZ1LxM5ta+PQJuu87AoN3jV8B5l2Q5PQgfKrQn+kYuhgFJZlPhHdjbeIyyh+FMXz1fRXMp09MtxTxHFBzCzq89jSu3eeTSGsNrFGGne7MNERYxufJj3kmVGGROb7p/uiVGIyQIBbWECgYEA71P+gcGdEeXp6925BtkjPfOBbOeEHYjDr88DPWEQSt7l3x2ODgKr1Ue+pIo6quRqH9Kvh6YnlGNvteIEXAN2ez7Rim4f4jAAZsEB0Up2K6ja09LteQFd127DsDBcLyHKjgdPRFKmXK5zUnK93zxdciOb/sJNyICdnfBJYDvgSvECgYEA4GLekkF95+ll34ouE1AgZz41ZbpZfubHCgJxabenftJyYvpYZNkcaVX9ZQbGnoKbF9Iu2Qcz3os0WcmVA64g2lCjLq00+2CEB0tYX7hWzJoW1V1RAZW88p7neTOprNHFtXpaiLmGJnBki3CjpJOk0/2Jy89wSCuYQ6ZWbCurMhMCgYBYcHeKR5vdc1LAAI1RRIhLamKXde5SY6m8nAkcc3Pr1vanPmqyLraE+CAw+Yu4fvPgkqCexf22ThCH69+kiPsNjCcuuoc5tHdRgV1Ek/mbJKjIwhdTMfgVli7mOti16gzJ81WNb+VeNnETNKeJiOsXNKV+vRq1TyHvrU3QLBA0YQKBgARuL1LX9DJ2C0rkoZBEDr+7HLbLfSTiTZ/G+JJLzATXBucpZkFngAYcaopqHdXXYlSQE9i5Ka8FNJ1pO4X9FCz7Vp1/UgJ8n169gBszupMDn9vKoeTUHgz0UkG0YW9GHQ8+QTdd4mYz5ehS6wg+2gxNf0EE8YSbR8BeMmqkWhb9AoGBAKBV0SRfW3bQhoUCtL9t6dzbZLeEfMp/B18oP7rUTLWCSt7p0463AIWt9MR6R+VFjVrvgJEF6whYQfimDqCeiLFIts6RCNP27C9IcmBv2GwaVgYDNbmZcK3nQmUNZxnXkqljPv4EN6Lj/gQFIUo38z47E2DthrSVkbRv8+nTyF3q'),('5e26faf2-6c3a-48db-a237-45120512c169','ba435529-7e8d-4132-a3b9-cfcde18e8dd2','allow-default-scopes','true'),('5f86deb1-98fd-4c70-9654-fe75684be895','51156eb2-a38b-4b97-ab24-f9eee470edce','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('60a15a16-c30b-4045-ae39-5daa5fedb267','51156eb2-a38b-4b97-ab24-f9eee470edce','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('61e4fc08-8fdd-436a-93e1-d5d8003f06e2','310e7faf-2c4d-42e1-b27a-c1f532352641','allow-default-scopes','true'),('62bded20-cb8a-48fc-abe7-aa6bc4ba3ddc','4c74adf2-0377-4807-83b0-037c832a673f','allowed-protocol-mapper-types','saml-role-list-mapper'),('64eee987-cff2-4ed7-b31b-d71bc7a46cf4','d890e1eb-7395-4917-ac9e-c57a01dca116','keyUse','ENC'),('65a28948-19f1-4efb-b6a6-dce90d014345','ce7c47e8-bd35-48a6-bb8f-49e5632ec1e5','client-uris-must-match','true'),('6a13ab55-6884-49cd-ba47-b8c0be909541','0b2a3bfe-0191-408d-b252-2d120cf48adf','allow-default-scopes','true'),('6bf0494d-94f8-4200-957b-a17c00c839bd','c5d0cd1f-0047-4acf-93e5-7a412f2bfcb5','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('6d705650-9997-4104-a3b2-a1607b56aad2','4c74adf2-0377-4807-83b0-037c832a673f','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('6edf1347-31c1-4ada-ba77-233565e4a42f','a4ecbebd-d09f-4825-9c16-bcc03087fe92','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('70a38f04-dd68-407d-ae64-915e02401309','37ca5ca3-ca9d-4bad-a30e-227f2ad09205','priority','100'),('712132d0-80b6-4445-8d1e-615cca10f5a8','c5d0cd1f-0047-4acf-93e5-7a412f2bfcb5','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('798e2afb-5561-4934-b760-c2168490793c','37ca5ca3-ca9d-4bad-a30e-227f2ad09205','certificate','MIICmzCCAYMCBgGOhHrm6DANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjQwMzI4MDk1MjEwWhcNMzQwMzI4MDk1MzUwWjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDRxezsiOtCIdymyBQJI9M40yGLMHVF3YXmwdDuY0ZUjWY2eqyqSXcc0XPFNKhif3GrIZ3Lp2CI8fS5HRRfm/55uoHY7PRIGldnFupCPjQu6IAqAqssE1ssOMVKMK9vQ9K4jbU7xADPqH3yisXEqo4Df6moaXjssMQZwGkrG4NG/qIrGAiwfs6GouXAC5L9Gr9QrSgg5m5RAQiE3xME5Awxx9IEy4hkMeiJnLSbPwT1Jgkzakl6xn3uWQXuda2FzkJJPf3HVuqFk1/XSbgyDE7Gtev+/5ZmS2mNnBzwBRWgdu8MVUlr7HXVltBceIAxxgQrimemLXL6PBuTfOrKQ6HjAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAE9PNfry0DjnXtxT3pT0nuhQttlvAoNNPIcYQ4YiO50Aw9B17JfmMZvUtyx9WsyKZ51oC1IiDJH8JU6P4iZBUJOyIgBPBX+rVWFfBjUVBeHxdy1h1ESIS5mQK4ZyprECCj3Mfjj90eJBulJc+XQHH/+qAemk9A/sGU1RqbMRJwe/+0eq8CupxfAlUweJJtPQEdFEfdo2ftaM6DVRV4R0lOY0oEC8LdOuScgLSwCuKbLFirnXe3rDIE0/V4R6oni7fTIAMm3XccBPJ82qaQ3cGVS7a0XAEPo6z+qrpZWduPiTx+9QFK8QqHeOJ2stNspFMq6vaXvIqJ1byRYlMXlb0oo='),('7a5ec1d2-ee0b-4de2-b6b4-c321bc43e311','d890e1eb-7395-4917-ac9e-c57a01dca116','privateKey','MIIEowIBAAKCAQEArOe3FVLQ0bmhzBXthDQ1nxzCmiYdWOulzk9M0vJDOeslEfk3yv6ahA/hPFGCECk0pdLYpF+dTYna6mVnETZ0Y+TFFwAlHmXJniY8oiJaOLKa2FE9sUWjAqtyAw18+TlifuARj3rPGc4W/d7uVhcuqmS0Onn3HoaqLTV8MCY5ohDKECp2FG2DXlqOUaVV2BsGpwBM/nWqzJvHQlJ5owlWwkTSqZRds3rjg/CGsj0rikdZSPSEvHl4zLciUOmEHO1JX9NDoRgyRM6nK5sI2znJigEptOcIx2u/kkFNah0gnbHSAv+7agbosfXHzdXqSNIe9fsk9U1GnENJpRA+rZbwZwIDAQABAoIBAAcwd09eqyodQtn+i2q01QnxozHPpea9nZ5Pc81Nn3f4DAmMSEKbhYc6Nc5RQUw0umiutK1ZAGxp7/1RDBEOJ5bDu2IycliqONDnnBvNu9yhqIiYEC2fzKBeypXP6MNgHHVUEcbaf2P+SrxxmY1g12LkXw4TZjARv1+z2p8R59GSOZ8chj+oLLpyGVLG0RE7y/ReTjXaco4yvW2xvVrh74ZhdGxJke+aVGIBNt7CjNw+WxZrj858/iUYt9sW4vSFV/skaOdqXMOOcpuL6iQ9q0iQ2JGR/9XyjEb6KbpH3lYq6OlR3Sv2xzFxV4LhEYcBnyeOj0xE4s2EDlMGe6OJT2ECgYEA3hFKOF/njTLikATfEj6ob8M81U4I/VYsQL5ZHEJMOGjWY8mGGeod9T0oBaexV7JKKIB10Zdhlulmp4n5St8J+Gcyxt5OFckzs1Yy8+DzSgG7ZboTWHS54Oqv3XjWOgBu7wH7UTjwweL2wikcJm60lhwTf0Du7x+ebWkga2vGuNECgYEAx1NRmUjSlaFKu8xuuNaGTNh3OUt3QUV2ayMB0K8PwHf3JDaUZa84q1s1BbGigQDtwKJK0iRcTwso7ulAouQ8hFA9pyWAKOQlaXQH0VKZ90pBtpm6eS6thvRfrJbYjSzhRT+zGzNAgYnleSzMI9tSmS5LViY2aIwQcTki9nwQY7cCgYB4S8l3DIz08nHFLr5gtcys7oiPzHwWMI48bGD9a/S6QiCRYePhOfAMn5qEpbjuFskRc7VfWrAk/j7710RSiMxv4gehr1+BccMuDS4A6wUgPBv2GXzNWD4xVzD5urHiLcXqd5pa/4t8nKSrvXVgZGwzPPZa4yQMKYa7Ik3Lo1C9YQKBgDWObIlcKMDtko/9MO7XLUSukPJDFarjCBtnT5CLyRa05SHEzIC54Och3ZBHF1vELR2qPaJTBL50SC5RW/2oh54hlT8480OJcYfxFjynDhmEyT1P9uuioBt3w9EywsLEAU9C+1PepIFp1M+HOt6TipEAAFwIbmwO3kgdywghc6HnAoGBAMGl5X+9k42weXoTeAHRrb8MdgmDZkCDcemeB2p+9vrZYU4XRcioRnp8touV9DHiRL/WXcDdAYK55E6IxzES8k6LOOQmgiAx/+C1kydmFgPzx0JpZFR11zqft6nBwGhWuU9+A7CG8Fz4yVi/1hOlSndSgh1+4f6Vx6hVQ6jr5jx2'),('7e5202a2-1815-45d7-879d-4c6c843b4049','27cd17a8-0528-4fd4-b51a-96041d0ef43c','priority','100'),('7f9de630-93f3-4ed2-8746-f7128ae6f809','c5d0cd1f-0047-4acf-93e5-7a412f2bfcb5','allowed-protocol-mapper-types','saml-user-property-mapper'),('8a8ffcfb-1476-44a7-91bf-f9922f08e102','4c74adf2-0377-4807-83b0-037c832a673f','allowed-protocol-mapper-types','oidc-address-mapper'),('8e14a9a5-9ac5-40df-9e47-2c953605b8b3','c5d0cd1f-0047-4acf-93e5-7a412f2bfcb5','allowed-protocol-mapper-types','oidc-address-mapper'),('8eadc738-84bb-4542-bce9-c44faef66b9a','8e965b46-7ed3-4879-9f79-2ba60d1c7ea9','privateKey','MIIEowIBAAKCAQEA2/yXB1J+ngaxULyKm8SNt5AIDsShkBb97R4JN/XPW4AT2bkhrOwFMRx0HRuihgU3O/JPeRw7iHLOKXDeFD1hiEGdjlP+HudOyFomVUuaIHjXsVHGmv+PdqZrK2QQ2+0KQy7HqHBSKGsUluFRFuvKJuah4UCor+trZO2VPHS0uzWYkeLm/3NSxOo/aHee3p+rf266aDHTws4hKmzBnh80SgSaGLBRCjTccZ8CFjirk2dcEENBIAUf5rG8ab9XKYA8McsVR+30bQ5ZdIs7IJENu6w+4Z8MNmD3AHQYpUHyBzk6Ji9NGemvmal4nNT2rU32fieQqXRjWH8VELRTzfsvvwIDAQABAoIBADrCpg7RJLwOOpe/vOBtqJMTGGvlbuhfk9Ud9EVr1cbxl5vM/SdE5gAfww4xXwCgbQgIqdzGQ0qnq9Ta7p8GZEJykGS/n73eeCdBGUMoThOFY8vb9YpaYBZHzpGJCY3NK7QVT0R5OCDOtXG13qSaN+WbLjtOO6C95/JOGdJLtCja4ZIWGEgtTPV++YKKK2j5146LQI1XCf9+2FqtKdW6qI2deIcl5CHYdo7WG3UTzI0D9YEQJd3ikx64BwflZOLbEnOKCVLSHlPCukdKM5c9rayHSSshlifRgXKRAvi9O6uSm53rO8xKrCg3clkgyp6uVQ3fTLg3eD6GuzkN2oyo28UCgYEA/DnVRfGf1EECwSOcxI5Thbv9Hg3AQsrsB8EX5WxKqmcOUcgXlh1gEcrfT5uXON9svkYJ5bhrAUjZGOq5755n5S+nxS0EZwX5XEfO1n/NKyNDpYSw6rUD7UEIOWkaCJXt1PWYchsRigiAJyDyLRvWIqXJj3TJ6+18uqaw7kSXZKsCgYEA30dDMtu+wWLn/2fgbrzReytMeqTIg/eSMjEDqQyCi5B3xLRibWDGqLCrNGctUTPFOzO72ukgn6AASbTCDLPu4jv512EFP3zmcLYR6JS5x/3Gd62Kh7TUhPYDZdSUH5GYRU8kFVSE8cNizACj6k/MwLiqIONpjRzb6REbDoQ6mT0CgYEAyFbLbyXvtLD6lhxKTdlawBPEhhWYC7WQasxVxbYRTG5U8mKDUYn9n8RLQbktEVBt2GhbPisQW1HYlrEChTCGB4Wltbj/ETGukjy7LqcOeOAmwBa4S4UCHHYWKTuxIPatlQSKVL/pW4FLAUlq8qd0m8qhYZ/7LrlQ5BS43lh/A8cCgYBmQv1EDeEQMXyQPcNM9K38+5fLlC1CQ+Fxm4FRq6kewswYC4YJEonqOQAwwBDBYDS1KLyhRqTqdx2qpF878i028ME9I/KDYXEprjoFjBiKwHBl39XS0b+EJijoOrScwNI87EJagpthH1vgk2p/pozgt7Mz3PQ67TzLQkpiG627AQKBgAQTEXyTcr/CykrT0wOf0QmA4KJLxk7ceI1a85UTIi5GZFSah+ktB1UKMv8RaG769Q+mXDmZmxDMvUpr2Qm0Dwz5pszagtncQuoGkHz8tesnJ8bYWGEkGT0LJ6ijsCbuqsg5lyoRSnJ+C1jEWYvJMhs6WadAdl8y+GMQZnFgI3bH'),('8fdceca5-cb92-4933-bd3f-581484c4096f','8e965b46-7ed3-4879-9f79-2ba60d1c7ea9','certificate','MIICtTCCAZ0CBgGOhHy6ljANBgkqhkiG9w0BAQsFADAeMRwwGgYDVQQDDBNvdS1ncmFkdWF0aW9uLXJlYWxtMB4XDTI0MDMyODA5NTQxMFoXDTM0MDMyODA5NTU1MFowHjEcMBoGA1UEAwwTb3UtZ3JhZHVhdGlvbi1yZWFsbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBANv8lwdSfp4GsVC8ipvEjbeQCA7EoZAW/e0eCTf1z1uAE9m5IazsBTEcdB0booYFNzvyT3kcO4hyzilw3hQ9YYhBnY5T/h7nTshaJlVLmiB417FRxpr/j3amaytkENvtCkMux6hwUihrFJbhURbryibmoeFAqK/ra2TtlTx0tLs1mJHi5v9zUsTqP2h3nt6fq39uumgx08LOISpswZ4fNEoEmhiwUQo03HGfAhY4q5NnXBBDQSAFH+axvGm/VymAPDHLFUft9G0OWXSLOyCRDbusPuGfDDZg9wB0GKVB8gc5OiYvTRnpr5mpeJzU9q1N9n4nkKl0Y1h/FRC0U837L78CAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAv2kuzzWJeMsS5LSgl54G9U3PhLKK+ZXps8W51LP5PCIEFZzPVe2ekOOZeUGKEGk6H+0kDESGbq/8RND/I/pd1IX0HekPaejYLC2SY9zcCLGVZgdkWjVWsUKb2wgEwhKytd6JgwdSC6z/PCowWbLhTfCysOGCG6B4S9N3EVF3Rm58urPMYPHqEC0sxVobDJE5q+am0g7Vh6Ple9BDuFpa525jAufsYLJWZY1aF7PH2S41s25ZmoaYir+ugNatxmKXTXQa7yQ77O3zDKOfJKZdWN3bNt7s0UPTUpx4WsE3Lcq0aeqpF5YYa89bqfZi+t7Csoq/p5ElaJKBsxl7u/8LyA=='),('93ebd67a-8cc8-441d-aee0-02ea7da2c68b','4c74adf2-0377-4807-83b0-037c832a673f','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('9474dad5-2490-446d-99f4-154766f5b604','501c351c-7a34-4059-a6d8-9bec8a9145d5','algorithm','HS512'),('954a6b0d-c72d-4c5a-bea3-2519f9a84dbd','ad3e4587-9f9a-43f8-89e5-53ffed0950cc','priority','100'),('955f3214-b4ae-46a6-b984-24ede67b4ac7','a3c16faa-d0f2-47f5-b272-ecb7af1daab0','host-sending-registration-request-must-match','true'),('9947fe9e-6afe-42c8-8221-525548bb0e3a','00e0feb2-aa12-408a-8558-2b62099ca43d','algorithm','RSA-OAEP'),('9b6a4444-3382-4908-82d6-6a49972407c8','8bc57c37-eacd-4fce-9267-bd1736a42207','kc.user.profile.config','{\"attributes\":[{\"name\":\"username\",\"displayName\":\"${username}\",\"validations\":{\"length\":{\"min\":3,\"max\":255},\"username-prohibited-characters\":{},\"up-username-not-idn-homograph\":{}},\"annotations\":{},\"permissions\":{\"view\":[\"admin\",\"user\"],\"edit\":[\"admin\"]},\"multivalued\":false},{\"name\":\"email\",\"displayName\":\"${email}\",\"validations\":{\"email\":{},\"length\":{\"max\":255}},\"annotations\":{},\"required\":{\"roles\":[\"user\"]},\"permissions\":{\"view\":[\"admin\",\"user\"],\"edit\":[\"admin\"]},\"multivalued\":false},{\"name\":\"firstName\",\"displayName\":\"${firstName}\",\"validations\":{\"length\":{\"max\":255},\"person-name-prohibited-characters\":{}},\"annotations\":{},\"required\":{\"roles\":[\"user\"]},\"permissions\":{\"view\":[\"admin\",\"user\"],\"edit\":[\"admin\",\"user\"]},\"multivalued\":false},{\"name\":\"lastName\",\"displayName\":\"${lastName}\",\"validations\":{\"length\":{\"max\":255},\"person-name-prohibited-characters\":{}},\"annotations\":{},\"required\":{\"roles\":[\"user\"]},\"permissions\":{\"view\":[\"admin\",\"user\"],\"edit\":[\"admin\",\"user\"]},\"multivalued\":false},{\"name\":\"phoneNumber\",\"displayName\":\"Phone Number\",\"validations\":{},\"annotations\":{},\"permissions\":{\"view\":[\"admin\",\"user\"],\"edit\":[\"admin\",\"user\"]},\"multivalued\":false}],\"groups\":[{\"name\":\"user-metadata\",\"displayHeader\":\"User metadata\",\"displayDescription\":\"Attributes, which refer to user metadata\"}]}'),('9beeda2c-b3ae-45f8-81ea-dd06f989b56d','ce7c47e8-bd35-48a6-bb8f-49e5632ec1e5','host-sending-registration-request-must-match','true'),('9c534ba4-ed37-4f87-b563-5602e910c54a','27cd17a8-0528-4fd4-b51a-96041d0ef43c','secret','z59DprZYVyHjGJhnt6O4nKQXmX6SCrOp_2toQ63sERbJZd3xOxiS3eXJ9ZNBduwAd-tspb8wGCIqcCc7-PdbjHloIP1CTXQ7_FIe00Cv9bcUtGtkVSJabiuATQKqQpSrw_nrymI6Qms1ptf7abezwUYzJ1L-K9QTOeGJr69gcYk'),('a2aa99e3-3ae8-4c80-81d1-b861aa4fba05','8e965b46-7ed3-4879-9f79-2ba60d1c7ea9','keyUse','SIG'),('ac8908aa-5365-4cd8-befe-ad3d85272db1','00e0feb2-aa12-408a-8558-2b62099ca43d','privateKey','MIIEowIBAAKCAQEAwJ7osGoIFqu+H3xeo6hJvYAcFHHyJMvo4qcUuxl6lOpNGffnVcgpHmuiwjH/DZfrZaPfFhtbe9VtEHVipUHjvrdHml2/eA1m0r6MJydEozlm1X7KQHefre9uIcpAbBDSwkbDA3JpElJGJiO5cUxs2EsJaPXK/42lzcrPJTOH/L2CMuoxj6cXZsUqtK22brGamlzFlBM2imNw/dHEorbaP258+8AVTyxX2zNiyxbFb3Rp6sS1Cs9HiW+/V/W68ADpwp479GZbIYRytlQTozIVLJP9fTqJwSs6Noi6MM22bWH83dORTsIhkdGyhh6A20L/PDaDSuQfdDfWcg+7NYJhqQIDAQABAoIBAAKEcSURFa76Kp9tuCzqX6BW4scPoCsD8TS5G0fAsv3sO/q5ZzATUBpCLNvd3Gf4ks5+wEUhMWZiaSz8Y8AmJsxQx+JIFF8EydG6RMmkNTzu3J2wrQL/rToQNX/CjWn8JEz+sMDER4RCSAFqmRtWdNu0y1gwUilZ2A9i9acWT9IpQBA8AzChlehCxfIv3ywGQxzyNVqlmH+H8JfMxP10NDSMLY93BZwTpi9YvS24v7M/Wku8YiWuCJPIuxCbLqu8fhlAGxxH4dS+KCEKz/zPNCR73bMNvYV6fnBSbT3DZkOoN5c4l8Qm0Ub+EDglJDLehHGB0OjOAm7BR1EU5PscPMMCgYEA6+vSbwM29WoinrBx/ez8u1wxFtqSYEwTHN4uf+KkGLGe0QQTrlo8Om0rN/j/kma47fnRXKzz1SZCQwcPUwcZAXcGAoHhFNzemSufeC4DEalxJORM+C1HazkFxAiZGHNa8RLIGAx3kx5kvrJSiofyqtycY2E9eO/o7F6+WzAPe9MCgYEA0QOrlYXHsj9iEvpGX54e7+sh4PtGNgADegLV/ktypwblm6KdSTAKfRN9n7Lg0xdcuQm0dq9mgPApfufEGZ/tfHj3A65NDLG/JPPIeX9J7aMdaUjX4GtitmMGdGGzMGqQwruY2lNNkQxbGutzY0SagrG4MCqI1wHtwN7MphwZaxMCgYEAmPEaTKly2Ypiwylz3L/j37qWgFBWEGOBCHfpATL2WqPbZ3kTITaSUPYwzGp5lHlPbcdEOKZOtGHHFxjekF7LkS2OEdYNCq9dB0NGcGyzxKFqHhZ653DDGfmviTRhu34c+KfKW/zJD/DmMtH7vJ8BbE70e2Cwr1QoVgPdt9PiVc0CgYAkcmNlO2LLLkpHzOSgn839QB80QBzKJc51ZDE0mqtvfMBlF0IeFQZ/MPri8ipKJPTCP3L8jzFsonRZ8Mg9P6oF3oIUXjyJTiVqqCf5J70Ydy0VwuIB/DfGXhYuDStV8f80Nco9p/EKrgDk/NGuKbRXve3EWGZsN6Xhz/gXryaviQKBgARKgRb0Sque+62gpitYn0Cef+faB+JpJZQ+ccOJKej7MXm59b/joWXNFGZfcomZTOsoJwNiFyGMU5ZkOfVvpvfLtM3GarvezdRsQJqpkrExZ2z66KKSCLI4FtG5E/2KLwFkIyZnpqbvcB/2NHrRiU9XlXYnZ5oHPln07n4j2EXs'),('b04e1ac1-83cb-4e22-ba8d-c374e30d18d7','c5d0cd1f-0047-4acf-93e5-7a412f2bfcb5','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('b0724574-ea77-4e68-8220-7bbcdc78a39d','a4ecbebd-d09f-4825-9c16-bcc03087fe92','allowed-protocol-mapper-types','oidc-full-name-mapper'),('b93862a7-81e7-4133-883d-5c8ced875ec1','37ca5ca3-ca9d-4bad-a30e-227f2ad09205','keyUse','SIG'),('b98481d3-6915-4149-a101-6db2a6553cbb','a4ecbebd-d09f-4825-9c16-bcc03087fe92','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('bb31500d-390b-4cb4-a103-e4b22810ae7f','00e0feb2-aa12-408a-8558-2b62099ca43d','certificate','MIICmzCCAYMCBgGOhHroZjANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjQwMzI4MDk1MjExWhcNMzQwMzI4MDk1MzUxWjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDAnuiwaggWq74ffF6jqEm9gBwUcfIky+jipxS7GXqU6k0Z9+dVyCkea6LCMf8Nl+tlo98WG1t71W0QdWKlQeO+t0eaXb94DWbSvownJ0SjOWbVfspAd5+t724hykBsENLCRsMDcmkSUkYmI7lxTGzYSwlo9cr/jaXNys8lM4f8vYIy6jGPpxdmxSq0rbZusZqaXMWUEzaKY3D90cSitto/bnz7wBVPLFfbM2LLFsVvdGnqxLUKz0eJb79X9brwAOnCnjv0ZlshhHK2VBOjMhUsk/19OonBKzo2iLowzbZtYfzd05FOwiGR0bKGHoDbQv88NoNK5B90N9ZyD7s1gmGpAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAAbmFccWoimIhHdqekvx15iFLE3on9/xBCsbQqOltepr+M6PghnqbRKNAcrDHLx+hT0hY41VJO++o5jSm6naTlanmvc5X7wpcBwtKJOZnK4GSjm6g8oxeJoQodivQ57OSWUiH3HScL54mciIqtqNUfnarCVfuheK98F+b5EhD0PDCeKHeqtojuVl5GN4+aKoJKnQ+9C6HyWmngBzW6gXr21VIewYZrl0CnsGt7R444IS+vRuUP4RlDrBM+WGwz7maqbi60TNGVCCgyHJR+pXm1rLUvBAEehaiqBcXRbOaCFkEcNJHtAxKsIbLyxHVNqMAR8LZgQ1raDF8EmP2gZTAaE='),('bd9dd333-19ca-4f4f-8d0f-64eeb9a0b863','c44d3583-4e5f-4ad6-ab20-d69657e89145','allow-default-scopes','true'),('bf609b9b-6af2-4149-b5a8-9d128b2e2974','a3c16faa-d0f2-47f5-b272-ecb7af1daab0','client-uris-must-match','true'),('c125f066-9084-454b-b535-c1e4a4b7b000','51156eb2-a38b-4b97-ab24-f9eee470edce','allowed-protocol-mapper-types','oidc-address-mapper'),('c181a127-fb01-499f-8048-3534d4cb660e','4c74adf2-0377-4807-83b0-037c832a673f','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('c909f493-f58f-4a77-b20c-713578174b80','4c74adf2-0377-4807-83b0-037c832a673f','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('cb1e1533-b871-460a-a5c3-36d603498da0','501c351c-7a34-4059-a6d8-9bec8a9145d5','priority','100'),('d9e6dc10-5cca-441a-bd1b-51d512f0e36f','a4ecbebd-d09f-4825-9c16-bcc03087fe92','allowed-protocol-mapper-types','oidc-address-mapper'),('dc1c39b0-8bce-4c47-8121-9f6dbf1a9c18','8e965b46-7ed3-4879-9f79-2ba60d1c7ea9','priority','100'),('e0194e43-7a58-4a84-bb6b-9ee0e1f3dfe9','51156eb2-a38b-4b97-ab24-f9eee470edce','allowed-protocol-mapper-types','oidc-full-name-mapper'),('eb29efe8-bfd0-42cf-becf-9231c7b7b570','d890e1eb-7395-4917-ac9e-c57a01dca116','algorithm','RSA-OAEP'),('f7bfaa03-b152-4f91-a862-d6cd870cee72','c5d0cd1f-0047-4acf-93e5-7a412f2bfcb5','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('f9983e60-1290-42e5-bc99-dbc2f9b90b43','ad3e4587-9f9a-43f8-89e5-53ffed0950cc','secret','2cotjaLfl4FI-xhiv0jDhw'),('fc928ab3-cffe-48c6-b027-72d4b896f4f5','66fa6177-f226-4e15-963d-fbeee102ef44','priority','100');
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
INSERT INTO `COMPOSITE_ROLE` VALUES ('001e6945-d1ba-4e0c-b943-4f315fa1de34','5a9ff775-218e-43ba-95fa-c034cbe88d8a'),('33fffa5b-4422-477c-a180-484be1584547','28bfe554-caea-4d40-ac73-99afbdd43678'),('623a0892-b614-4464-90c6-c8990dfa9501','2e42c3b0-c17a-48f4-a432-e2fd1d08ecd6'),('623a0892-b614-4464-90c6-c8990dfa9501','31adb299-236a-4708-8f7c-794c15b88d5c'),('9ee05d76-d16d-4099-ab52-a90bb67d0cba','85e68d24-74d6-4deb-b3b3-3a0a9a7c1518'),('a2d4580f-7cd5-403d-9dc5-6237291e3eff','91a4ab5b-edaa-4bea-a9e4-45f8cf1eccf0'),('b3d0b536-6940-40b7-aff6-48d644c1e609','05a7f111-c5e9-4a54-9695-e2fd949a7677'),('b66a3994-5332-47ae-8c7e-8e665c5bc4c2','c3daa9fd-2978-44ce-b581-b9e7c59716d8'),('b66a3994-5332-47ae-8c7e-8e665c5bc4c2','c7981972-4f6c-45aa-a6d3-aa169b5a0754'),('c15e6d78-0435-43eb-a3a6-affec75f09f4','01deb553-e291-4def-b6fb-2874086fa68a'),('c15e6d78-0435-43eb-a3a6-affec75f09f4','05b1900a-e75d-4a73-a5a9-fe4ab482cb48'),('c15e6d78-0435-43eb-a3a6-affec75f09f4','199d79eb-43ab-4ed9-b79e-3963f96b7d49'),('c15e6d78-0435-43eb-a3a6-affec75f09f4','207ee58e-ac3e-4cf6-9205-52765644cb3c'),('c15e6d78-0435-43eb-a3a6-affec75f09f4','2e42c3b0-c17a-48f4-a432-e2fd1d08ecd6'),('c15e6d78-0435-43eb-a3a6-affec75f09f4','31adb299-236a-4708-8f7c-794c15b88d5c'),('c15e6d78-0435-43eb-a3a6-affec75f09f4','33692cfa-a32c-4c9c-967e-37e5822f900a'),('c15e6d78-0435-43eb-a3a6-affec75f09f4','351fcd63-0f99-4390-b851-028be52f772d'),('c15e6d78-0435-43eb-a3a6-affec75f09f4','3744f6b3-6e3f-45b8-95a4-cbb5d556005b'),('c15e6d78-0435-43eb-a3a6-affec75f09f4','38154683-25ee-418a-b4f1-0b30bbd57efd'),('c15e6d78-0435-43eb-a3a6-affec75f09f4','3c2e9e45-938f-442b-83e6-261a3779bad1'),('c15e6d78-0435-43eb-a3a6-affec75f09f4','54ea98e2-d82c-4b24-8cc5-9d2671d4ee2b'),('c15e6d78-0435-43eb-a3a6-affec75f09f4','5727bd91-e1ab-48a8-83d7-4f6e550c2ccd'),('c15e6d78-0435-43eb-a3a6-affec75f09f4','623a0892-b614-4464-90c6-c8990dfa9501'),('c15e6d78-0435-43eb-a3a6-affec75f09f4','62d5d339-a457-466c-971f-9c59701eb2b9'),('c15e6d78-0435-43eb-a3a6-affec75f09f4','63339eed-83cb-4864-a0a2-02560b907de7'),('c15e6d78-0435-43eb-a3a6-affec75f09f4','69b5c6aa-0657-4e0b-a5f1-e2b91ac22310'),('c15e6d78-0435-43eb-a3a6-affec75f09f4','720859fa-ff51-4581-9789-62f363e32aa3'),('c15e6d78-0435-43eb-a3a6-affec75f09f4','7a31bb3f-b659-4058-8744-b1c6c9f79508'),('c15e6d78-0435-43eb-a3a6-affec75f09f4','80211bc4-928d-4b3e-8ef3-f6b9c0b6ffb1'),('c15e6d78-0435-43eb-a3a6-affec75f09f4','91a4ab5b-edaa-4bea-a9e4-45f8cf1eccf0'),('c15e6d78-0435-43eb-a3a6-affec75f09f4','921b18ba-480a-461f-a4d2-901b35def037'),('c15e6d78-0435-43eb-a3a6-affec75f09f4','9d506b4a-00ee-46e9-b300-4ea27d812793'),('c15e6d78-0435-43eb-a3a6-affec75f09f4','9ec6f916-2933-4281-b49d-c74ac13f6050'),('c15e6d78-0435-43eb-a3a6-affec75f09f4','a265f25b-acc4-4b4a-9965-9b3abb7e182d'),('c15e6d78-0435-43eb-a3a6-affec75f09f4','a2d4580f-7cd5-403d-9dc5-6237291e3eff'),('c15e6d78-0435-43eb-a3a6-affec75f09f4','a6833a4d-ebcc-4c73-b167-9798746933ef'),('c15e6d78-0435-43eb-a3a6-affec75f09f4','b7aa4d8a-3956-483c-8b4e-a78bda24cdd8'),('c15e6d78-0435-43eb-a3a6-affec75f09f4','bb666b01-a24b-49ff-8b36-72ba4a673aee'),('c15e6d78-0435-43eb-a3a6-affec75f09f4','bc4e3f40-8e86-47b3-9bcc-3628cc8db42e'),('c15e6d78-0435-43eb-a3a6-affec75f09f4','d64c7a31-ab1d-4895-9749-9ccf1c8d60be'),('c15e6d78-0435-43eb-a3a6-affec75f09f4','d77c0d39-1d27-45f1-9d99-b49d0a7abc5a'),('c15e6d78-0435-43eb-a3a6-affec75f09f4','dac0435e-ddb2-426e-89e2-4772bf7b9ba3'),('c15e6d78-0435-43eb-a3a6-affec75f09f4','e14ac7d1-6115-49ae-944b-b86317a99b69'),('c15e6d78-0435-43eb-a3a6-affec75f09f4','e785566e-6ec6-4709-84ad-7332802ee4e8'),('c15e6d78-0435-43eb-a3a6-affec75f09f4','ef3404a3-5146-4049-8c80-aef84fb2487c'),('c15e6d78-0435-43eb-a3a6-affec75f09f4','f5287a81-3999-45c7-b018-b849e77c9cd4'),('c173f43d-fd84-440a-878c-ccfbc635807d','b3d0b536-6940-40b7-aff6-48d644c1e609'),('c173f43d-fd84-440a-878c-ccfbc635807d','b63ce783-a95b-42e7-9aab-cb866eed050d'),('c173f43d-fd84-440a-878c-ccfbc635807d','bd20d0bb-d28d-4002-8709-e448d216863c'),('c173f43d-fd84-440a-878c-ccfbc635807d','eb34a9e5-01a0-4b8c-aecb-909fc92368a9'),('d64c7a31-ab1d-4895-9749-9ccf1c8d60be','720859fa-ff51-4581-9789-62f363e32aa3'),('d64c7a31-ab1d-4895-9749-9ccf1c8d60be','a265f25b-acc4-4b4a-9965-9b3abb7e182d'),('e2e4962a-4034-4328-92a3-1146096b3b57','4c5b5313-87e0-4b37-911f-74e12bfc4c55'),('f5287a81-3999-45c7-b018-b849e77c9cd4','54ea98e2-d82c-4b24-8cc5-9d2671d4ee2b'),('fc556831-ed76-426c-8e20-70fb73c30e01','29e28efc-3110-47ee-ab2e-e9998be40267'),('fc556831-ed76-426c-8e20-70fb73c30e01','33fffa5b-4422-477c-a180-484be1584547'),('fc556831-ed76-426c-8e20-70fb73c30e01','98f2352a-a9b5-4d01-a08c-424833d2ec23'),('fc556831-ed76-426c-8e20-70fb73c30e01','bd01b954-b5aa-45bc-9658-8328afafe67f'),('fcf20bee-a2a2-4cc4-b7a0-2bf433218172','113c7795-7ced-4e39-b726-734949777e11'),('fcf20bee-a2a2-4cc4-b7a0-2bf433218172','14f35596-2e89-4c42-b6e3-d0eaf5ba8dd8'),('fcf20bee-a2a2-4cc4-b7a0-2bf433218172','396d3347-6e22-4885-b474-cd9fe3ab8930'),('fcf20bee-a2a2-4cc4-b7a0-2bf433218172','43cf416a-e15a-476c-8402-5bf50f9e6f67'),('fcf20bee-a2a2-4cc4-b7a0-2bf433218172','7ecbbfdb-7b8a-4532-ab53-d2e4540b60f1'),('fcf20bee-a2a2-4cc4-b7a0-2bf433218172','85e68d24-74d6-4deb-b3b3-3a0a9a7c1518'),('fcf20bee-a2a2-4cc4-b7a0-2bf433218172','8b6c0d48-c0ce-4bc2-8353-761624281c53'),('fcf20bee-a2a2-4cc4-b7a0-2bf433218172','9ee05d76-d16d-4099-ab52-a90bb67d0cba'),('fcf20bee-a2a2-4cc4-b7a0-2bf433218172','a8d89a76-c43b-43e6-9bd6-4a00599a31e9'),('fcf20bee-a2a2-4cc4-b7a0-2bf433218172','b66a3994-5332-47ae-8c7e-8e665c5bc4c2'),('fcf20bee-a2a2-4cc4-b7a0-2bf433218172','b765c582-879f-42e6-b089-b74fcc1ff7c5'),('fcf20bee-a2a2-4cc4-b7a0-2bf433218172','c3daa9fd-2978-44ce-b581-b9e7c59716d8'),('fcf20bee-a2a2-4cc4-b7a0-2bf433218172','c7981972-4f6c-45aa-a6d3-aa169b5a0754'),('fcf20bee-a2a2-4cc4-b7a0-2bf433218172','c7abcac1-50ce-4c5e-98a7-31b32b7a2d85'),('fcf20bee-a2a2-4cc4-b7a0-2bf433218172','ea68930e-a414-4590-9967-f84cbaade328'),('fcf20bee-a2a2-4cc4-b7a0-2bf433218172','f385b26e-c4b2-4b53-9ef4-6cc9d2815909'),('fcf20bee-a2a2-4cc4-b7a0-2bf433218172','f4583114-5861-467f-9663-b2ec053365dc'),('fcf20bee-a2a2-4cc4-b7a0-2bf433218172','f9e9296b-f1a0-43f5-a614-fb68560c8b4f');
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
INSERT INTO `CREDENTIAL` VALUES ('2c619a52-b597-4773-aa28-f8bc1bcd68c3',NULL,'password','b31d1b22-a569-4bc0-94cd-ef1229bb70c9',1711619732654,NULL,'{\"value\":\"WI9j38gd/NQWKuJVO5kHRAoNZw9LC2D1QkGHxmMRtfORyC2/Y2mbatJckdFv96+YG0avAHGikkghGKXqtH/+zg==\",\"salt\":\"N22uV+Tes0CeS8+CH9rwmA==\",\"additionalParameters\":{}}','{\"hashIterations\":210000,\"algorithm\":\"pbkdf2-sha512\",\"additionalParameters\":{}}',10);
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
INSERT INTO `DATABASECHANGELOG` VALUES ('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/jpa-changelog-1.0.0.Final.xml','2024-03-28 09:53:23',1,'EXECUTED','9:6f1016664e21e16d26517a4418f5e3df','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'4.25.1',NULL,NULL,'1619599482'),('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/db2-jpa-changelog-1.0.0.Final.xml','2024-03-28 09:53:23',2,'MARK_RAN','9:828775b1596a07d1200ba1d49e5e3941','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'4.25.1',NULL,NULL,'1619599482'),('1.1.0.Beta1','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Beta1.xml','2024-03-28 09:53:23',3,'EXECUTED','9:5f090e44a7d595883c1fb61f4b41fd38','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...','',NULL,'4.25.1',NULL,NULL,'1619599482'),('1.1.0.Final','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Final.xml','2024-03-28 09:53:23',4,'EXECUTED','9:c07e577387a3d2c04d1adc9aaad8730e','renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY','',NULL,'4.25.1',NULL,NULL,'1619599482'),('1.2.0.Beta1','psilva@redhat.com','META-INF/jpa-changelog-1.2.0.Beta1.xml','2024-03-28 09:53:25',5,'EXECUTED','9:b68ce996c655922dbcd2fe6b6ae72686','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'4.25.1',NULL,NULL,'1619599482'),('1.2.0.Beta1','psilva@redhat.com','META-INF/db2-jpa-changelog-1.2.0.Beta1.xml','2024-03-28 09:53:25',6,'MARK_RAN','9:543b5c9989f024fe35c6f6c5a97de88e','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'4.25.1',NULL,NULL,'1619599482'),('1.2.0.RC1','bburke@redhat.com','META-INF/jpa-changelog-1.2.0.CR1.xml','2024-03-28 09:53:27',7,'EXECUTED','9:765afebbe21cf5bbca048e632df38336','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'4.25.1',NULL,NULL,'1619599482'),('1.2.0.RC1','bburke@redhat.com','META-INF/db2-jpa-changelog-1.2.0.CR1.xml','2024-03-28 09:53:27',8,'MARK_RAN','9:db4a145ba11a6fdaefb397f6dbf829a1','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'4.25.1',NULL,NULL,'1619599482'),('1.2.0.Final','keycloak','META-INF/jpa-changelog-1.2.0.Final.xml','2024-03-28 09:53:27',9,'EXECUTED','9:9d05c7be10cdb873f8bcb41bc3a8ab23','update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT','',NULL,'4.25.1',NULL,NULL,'1619599482'),('1.3.0','bburke@redhat.com','META-INF/jpa-changelog-1.3.0.xml','2024-03-28 09:53:28',10,'EXECUTED','9:18593702353128d53111f9b1ff0b82b8','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...','',NULL,'4.25.1',NULL,NULL,'1619599482'),('1.4.0','bburke@redhat.com','META-INF/jpa-changelog-1.4.0.xml','2024-03-28 09:53:29',11,'EXECUTED','9:6122efe5f090e41a85c0f1c9e52cbb62','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'4.25.1',NULL,NULL,'1619599482'),('1.4.0','bburke@redhat.com','META-INF/db2-jpa-changelog-1.4.0.xml','2024-03-28 09:53:29',12,'MARK_RAN','9:e1ff28bf7568451453f844c5d54bb0b5','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'4.25.1',NULL,NULL,'1619599482'),('1.5.0','bburke@redhat.com','META-INF/jpa-changelog-1.5.0.xml','2024-03-28 09:53:29',13,'EXECUTED','9:7af32cd8957fbc069f796b61217483fd','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'4.25.1',NULL,NULL,'1619599482'),('1.6.1_from15','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2024-03-28 09:53:29',14,'EXECUTED','9:6005e15e84714cd83226bf7879f54190','addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...','',NULL,'4.25.1',NULL,NULL,'1619599482'),('1.6.1_from16-pre','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2024-03-28 09:53:30',15,'MARK_RAN','9:bf656f5a2b055d07f314431cae76f06c','delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION','',NULL,'4.25.1',NULL,NULL,'1619599482'),('1.6.1_from16','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2024-03-28 09:53:30',16,'MARK_RAN','9:f8dadc9284440469dcf71e25ca6ab99b','dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...','',NULL,'4.25.1',NULL,NULL,'1619599482'),('1.6.1','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2024-03-28 09:53:30',17,'EXECUTED','9:d41d8cd98f00b204e9800998ecf8427e','empty','',NULL,'4.25.1',NULL,NULL,'1619599482'),('1.7.0','bburke@redhat.com','META-INF/jpa-changelog-1.7.0.xml','2024-03-28 09:53:31',18,'EXECUTED','9:3368ff0be4c2855ee2dd9ca813b38d8e','createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...','',NULL,'4.25.1',NULL,NULL,'1619599482'),('1.8.0','mposolda@redhat.com','META-INF/jpa-changelog-1.8.0.xml','2024-03-28 09:53:31',19,'EXECUTED','9:8ac2fb5dd030b24c0570a763ed75ed20','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'4.25.1',NULL,NULL,'1619599482'),('1.8.0-2','keycloak','META-INF/jpa-changelog-1.8.0.xml','2024-03-28 09:53:31',20,'EXECUTED','9:f91ddca9b19743db60e3057679810e6c','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'4.25.1',NULL,NULL,'1619599482'),('1.8.0','mposolda@redhat.com','META-INF/db2-jpa-changelog-1.8.0.xml','2024-03-28 09:53:31',21,'MARK_RAN','9:831e82914316dc8a57dc09d755f23c51','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'4.25.1',NULL,NULL,'1619599482'),('1.8.0-2','keycloak','META-INF/db2-jpa-changelog-1.8.0.xml','2024-03-28 09:53:31',22,'MARK_RAN','9:f91ddca9b19743db60e3057679810e6c','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'4.25.1',NULL,NULL,'1619599482'),('1.9.0','mposolda@redhat.com','META-INF/jpa-changelog-1.9.0.xml','2024-03-28 09:53:32',23,'EXECUTED','9:bc3d0f9e823a69dc21e23e94c7a94bb1','update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...','',NULL,'4.25.1',NULL,NULL,'1619599482'),('1.9.1','keycloak','META-INF/jpa-changelog-1.9.1.xml','2024-03-28 09:53:32',24,'EXECUTED','9:c9999da42f543575ab790e76439a2679','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'4.25.1',NULL,NULL,'1619599482'),('1.9.1','keycloak','META-INF/db2-jpa-changelog-1.9.1.xml','2024-03-28 09:53:32',25,'MARK_RAN','9:0d6c65c6f58732d81569e77b10ba301d','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'4.25.1',NULL,NULL,'1619599482'),('1.9.2','keycloak','META-INF/jpa-changelog-1.9.2.xml','2024-03-28 09:53:32',26,'EXECUTED','9:fc576660fc016ae53d2d4778d84d86d0','createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...','',NULL,'4.25.1',NULL,NULL,'1619599482'),('authz-2.0.0','psilva@redhat.com','META-INF/jpa-changelog-authz-2.0.0.xml','2024-03-28 09:53:33',27,'EXECUTED','9:43ed6b0da89ff77206289e87eaa9c024','createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...','',NULL,'4.25.1',NULL,NULL,'1619599482'),('authz-2.5.1','psilva@redhat.com','META-INF/jpa-changelog-authz-2.5.1.xml','2024-03-28 09:53:33',28,'EXECUTED','9:44bae577f551b3738740281eceb4ea70','update tableName=RESOURCE_SERVER_POLICY','',NULL,'4.25.1',NULL,NULL,'1619599482'),('2.1.0-KEYCLOAK-5461','bburke@redhat.com','META-INF/jpa-changelog-2.1.0.xml','2024-03-28 09:53:34',29,'EXECUTED','9:bd88e1f833df0420b01e114533aee5e8','createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...','',NULL,'4.25.1',NULL,NULL,'1619599482'),('2.2.0','bburke@redhat.com','META-INF/jpa-changelog-2.2.0.xml','2024-03-28 09:53:34',30,'EXECUTED','9:a7022af5267f019d020edfe316ef4371','addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...','',NULL,'4.25.1',NULL,NULL,'1619599482'),('2.3.0','bburke@redhat.com','META-INF/jpa-changelog-2.3.0.xml','2024-03-28 09:53:35',31,'EXECUTED','9:fc155c394040654d6a79227e56f5e25a','createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...','',NULL,'4.25.1',NULL,NULL,'1619599482'),('2.4.0','bburke@redhat.com','META-INF/jpa-changelog-2.4.0.xml','2024-03-28 09:53:35',32,'EXECUTED','9:eac4ffb2a14795e5dc7b426063e54d88','customChange','',NULL,'4.25.1',NULL,NULL,'1619599482'),('2.5.0','bburke@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2024-03-28 09:53:35',33,'EXECUTED','9:54937c05672568c4c64fc9524c1e9462','customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION','',NULL,'4.25.1',NULL,NULL,'1619599482'),('2.5.0-unicode-oracle','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2024-03-28 09:53:35',34,'MARK_RAN','9:3a32bace77c84d7678d035a7f5a8084e','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'4.25.1',NULL,NULL,'1619599482'),('2.5.0-unicode-other-dbs','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2024-03-28 09:53:36',35,'EXECUTED','9:33d72168746f81f98ae3a1e8e0ca3554','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'4.25.1',NULL,NULL,'1619599482'),('2.5.0-duplicate-email-support','slawomir@dabek.name','META-INF/jpa-changelog-2.5.0.xml','2024-03-28 09:53:36',36,'EXECUTED','9:61b6d3d7a4c0e0024b0c839da283da0c','addColumn tableName=REALM','',NULL,'4.25.1',NULL,NULL,'1619599482'),('2.5.0-unique-group-names','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2024-03-28 09:53:36',37,'EXECUTED','9:8dcac7bdf7378e7d823cdfddebf72fda','addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'4.25.1',NULL,NULL,'1619599482'),('2.5.1','bburke@redhat.com','META-INF/jpa-changelog-2.5.1.xml','2024-03-28 09:53:37',38,'EXECUTED','9:a2b870802540cb3faa72098db5388af3','addColumn tableName=FED_USER_CONSENT','',NULL,'4.25.1',NULL,NULL,'1619599482'),('3.0.0','bburke@redhat.com','META-INF/jpa-changelog-3.0.0.xml','2024-03-28 09:53:37',39,'EXECUTED','9:132a67499ba24bcc54fb5cbdcfe7e4c0','addColumn tableName=IDENTITY_PROVIDER','',NULL,'4.25.1',NULL,NULL,'1619599482'),('3.2.0-fix','keycloak','META-INF/jpa-changelog-3.2.0.xml','2024-03-28 09:53:37',40,'MARK_RAN','9:938f894c032f5430f2b0fafb1a243462','addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS','',NULL,'4.25.1',NULL,NULL,'1619599482'),('3.2.0-fix-with-keycloak-5416','keycloak','META-INF/jpa-changelog-3.2.0.xml','2024-03-28 09:53:37',41,'MARK_RAN','9:845c332ff1874dc5d35974b0babf3006','dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS','',NULL,'4.25.1',NULL,NULL,'1619599482'),('3.2.0-fix-offline-sessions','hmlnarik','META-INF/jpa-changelog-3.2.0.xml','2024-03-28 09:53:37',42,'EXECUTED','9:fc86359c079781adc577c5a217e4d04c','customChange','',NULL,'4.25.1',NULL,NULL,'1619599482'),('3.2.0-fixed','keycloak','META-INF/jpa-changelog-3.2.0.xml','2024-03-28 09:53:38',43,'EXECUTED','9:59a64800e3c0d09b825f8a3b444fa8f4','addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...','',NULL,'4.25.1',NULL,NULL,'1619599482'),('3.3.0','keycloak','META-INF/jpa-changelog-3.3.0.xml','2024-03-28 09:53:38',44,'EXECUTED','9:d48d6da5c6ccf667807f633fe489ce88','addColumn tableName=USER_ENTITY','',NULL,'4.25.1',NULL,NULL,'1619599482'),('authz-3.4.0.CR1-resource-server-pk-change-part1','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2024-03-28 09:53:38',45,'EXECUTED','9:dde36f7973e80d71fceee683bc5d2951','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE','',NULL,'4.25.1',NULL,NULL,'1619599482'),('authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2024-03-28 09:53:38',46,'EXECUTED','9:b855e9b0a406b34fa323235a0cf4f640','customChange','',NULL,'4.25.1',NULL,NULL,'1619599482'),('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2024-03-28 09:53:38',47,'MARK_RAN','9:51abbacd7b416c50c4421a8cabf7927e','dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE','',NULL,'4.25.1',NULL,NULL,'1619599482'),('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2024-03-28 09:53:39',48,'EXECUTED','9:bdc99e567b3398bac83263d375aad143','addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...','',NULL,'4.25.1',NULL,NULL,'1619599482'),('authn-3.4.0.CR1-refresh-token-max-reuse','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2024-03-28 09:53:39',49,'EXECUTED','9:d198654156881c46bfba39abd7769e69','addColumn tableName=REALM','',NULL,'4.25.1',NULL,NULL,'1619599482'),('3.4.0','keycloak','META-INF/jpa-changelog-3.4.0.xml','2024-03-28 09:53:40',50,'EXECUTED','9:cfdd8736332ccdd72c5256ccb42335db','addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...','',NULL,'4.25.1',NULL,NULL,'1619599482'),('3.4.0-KEYCLOAK-5230','hmlnarik@redhat.com','META-INF/jpa-changelog-3.4.0.xml','2024-03-28 09:53:40',51,'EXECUTED','9:7c84de3d9bd84d7f077607c1a4dcb714','createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...','',NULL,'4.25.1',NULL,NULL,'1619599482'),('3.4.1','psilva@redhat.com','META-INF/jpa-changelog-3.4.1.xml','2024-03-28 09:53:40',52,'EXECUTED','9:5a6bb36cbefb6a9d6928452c0852af2d','modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.25.1',NULL,NULL,'1619599482'),('3.4.2','keycloak','META-INF/jpa-changelog-3.4.2.xml','2024-03-28 09:53:40',53,'EXECUTED','9:8f23e334dbc59f82e0a328373ca6ced0','update tableName=REALM','',NULL,'4.25.1',NULL,NULL,'1619599482'),('3.4.2-KEYCLOAK-5172','mkanis@redhat.com','META-INF/jpa-changelog-3.4.2.xml','2024-03-28 09:53:40',54,'EXECUTED','9:9156214268f09d970cdf0e1564d866af','update tableName=CLIENT','',NULL,'4.25.1',NULL,NULL,'1619599482'),('4.0.0-KEYCLOAK-6335','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2024-03-28 09:53:40',55,'EXECUTED','9:db806613b1ed154826c02610b7dbdf74','createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS','',NULL,'4.25.1',NULL,NULL,'1619599482'),('4.0.0-CLEANUP-UNUSED-TABLE','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2024-03-28 09:53:41',56,'EXECUTED','9:229a041fb72d5beac76bb94a5fa709de','dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING','',NULL,'4.25.1',NULL,NULL,'1619599482'),('4.0.0-KEYCLOAK-6228','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2024-03-28 09:53:41',57,'EXECUTED','9:079899dade9c1e683f26b2aa9ca6ff04','dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...','',NULL,'4.25.1',NULL,NULL,'1619599482'),('4.0.0-KEYCLOAK-5579-fixed','mposolda@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2024-03-28 09:53:43',58,'EXECUTED','9:139b79bcbbfe903bb1c2d2a4dbf001d9','dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...','',NULL,'4.25.1',NULL,NULL,'1619599482'),('authz-4.0.0.CR1','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.CR1.xml','2024-03-28 09:53:43',59,'EXECUTED','9:b55738ad889860c625ba2bf483495a04','createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...','',NULL,'4.25.1',NULL,NULL,'1619599482'),('authz-4.0.0.Beta3','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.Beta3.xml','2024-03-28 09:53:44',60,'EXECUTED','9:e0057eac39aa8fc8e09ac6cfa4ae15fe','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY','',NULL,'4.25.1',NULL,NULL,'1619599482'),('authz-4.2.0.Final','mhajas@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2024-03-28 09:53:44',61,'EXECUTED','9:42a33806f3a0443fe0e7feeec821326c','createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...','',NULL,'4.25.1',NULL,NULL,'1619599482'),('authz-4.2.0.Final-KEYCLOAK-9944','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2024-03-28 09:53:44',62,'EXECUTED','9:9968206fca46eecc1f51db9c024bfe56','addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS','',NULL,'4.25.1',NULL,NULL,'1619599482'),('4.2.0-KEYCLOAK-6313','wadahiro@gmail.com','META-INF/jpa-changelog-4.2.0.xml','2024-03-28 09:53:44',63,'EXECUTED','9:92143a6daea0a3f3b8f598c97ce55c3d','addColumn tableName=REQUIRED_ACTION_PROVIDER','',NULL,'4.25.1',NULL,NULL,'1619599482'),('4.3.0-KEYCLOAK-7984','wadahiro@gmail.com','META-INF/jpa-changelog-4.3.0.xml','2024-03-28 09:53:44',64,'EXECUTED','9:82bab26a27195d889fb0429003b18f40','update tableName=REQUIRED_ACTION_PROVIDER','',NULL,'4.25.1',NULL,NULL,'1619599482'),('4.6.0-KEYCLOAK-7950','psilva@redhat.com','META-INF/jpa-changelog-4.6.0.xml','2024-03-28 09:53:44',65,'EXECUTED','9:e590c88ddc0b38b0ae4249bbfcb5abc3','update tableName=RESOURCE_SERVER_RESOURCE','',NULL,'4.25.1',NULL,NULL,'1619599482'),('4.6.0-KEYCLOAK-8377','keycloak','META-INF/jpa-changelog-4.6.0.xml','2024-03-28 09:53:44',66,'EXECUTED','9:5c1f475536118dbdc38d5d7977950cc0','createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...','',NULL,'4.25.1',NULL,NULL,'1619599482'),('4.6.0-KEYCLOAK-8555','gideonray@gmail.com','META-INF/jpa-changelog-4.6.0.xml','2024-03-28 09:53:44',67,'EXECUTED','9:e7c9f5f9c4d67ccbbcc215440c718a17','createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT','',NULL,'4.25.1',NULL,NULL,'1619599482'),('4.7.0-KEYCLOAK-1267','sguilhen@redhat.com','META-INF/jpa-changelog-4.7.0.xml','2024-03-28 09:53:44',68,'EXECUTED','9:88e0bfdda924690d6f4e430c53447dd5','addColumn tableName=REALM','',NULL,'4.25.1',NULL,NULL,'1619599482'),('4.7.0-KEYCLOAK-7275','keycloak','META-INF/jpa-changelog-4.7.0.xml','2024-03-28 09:53:44',69,'EXECUTED','9:f53177f137e1c46b6a88c59ec1cb5218','renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...','',NULL,'4.25.1',NULL,NULL,'1619599482'),('4.8.0-KEYCLOAK-8835','sguilhen@redhat.com','META-INF/jpa-changelog-4.8.0.xml','2024-03-28 09:53:44',70,'EXECUTED','9:a74d33da4dc42a37ec27121580d1459f','addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM','',NULL,'4.25.1',NULL,NULL,'1619599482'),('authz-7.0.0-KEYCLOAK-10443','psilva@redhat.com','META-INF/jpa-changelog-authz-7.0.0.xml','2024-03-28 09:53:44',71,'EXECUTED','9:fd4ade7b90c3b67fae0bfcfcb42dfb5f','addColumn tableName=RESOURCE_SERVER','',NULL,'4.25.1',NULL,NULL,'1619599482'),('8.0.0-adding-credential-columns','keycloak','META-INF/jpa-changelog-8.0.0.xml','2024-03-28 09:53:44',72,'EXECUTED','9:aa072ad090bbba210d8f18781b8cebf4','addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL','',NULL,'4.25.1',NULL,NULL,'1619599482'),('8.0.0-updating-credential-data-not-oracle-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2024-03-28 09:53:45',73,'EXECUTED','9:1ae6be29bab7c2aa376f6983b932be37','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'4.25.1',NULL,NULL,'1619599482'),('8.0.0-updating-credential-data-oracle-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2024-03-28 09:53:45',74,'MARK_RAN','9:14706f286953fc9a25286dbd8fb30d97','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'4.25.1',NULL,NULL,'1619599482'),('8.0.0-credential-cleanup-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2024-03-28 09:53:45',75,'EXECUTED','9:2b9cc12779be32c5b40e2e67711a218b','dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...','',NULL,'4.25.1',NULL,NULL,'1619599482'),('8.0.0-resource-tag-support','keycloak','META-INF/jpa-changelog-8.0.0.xml','2024-03-28 09:53:45',76,'EXECUTED','9:91fa186ce7a5af127a2d7a91ee083cc5','addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL','',NULL,'4.25.1',NULL,NULL,'1619599482'),('9.0.0-always-display-client','keycloak','META-INF/jpa-changelog-9.0.0.xml','2024-03-28 09:53:45',77,'EXECUTED','9:6335e5c94e83a2639ccd68dd24e2e5ad','addColumn tableName=CLIENT','',NULL,'4.25.1',NULL,NULL,'1619599482'),('9.0.0-drop-constraints-for-column-increase','keycloak','META-INF/jpa-changelog-9.0.0.xml','2024-03-28 09:53:45',78,'MARK_RAN','9:6bdb5658951e028bfe16fa0a8228b530','dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...','',NULL,'4.25.1',NULL,NULL,'1619599482'),('9.0.0-increase-column-size-federated-fk','keycloak','META-INF/jpa-changelog-9.0.0.xml','2024-03-28 09:53:46',79,'EXECUTED','9:d5bc15a64117ccad481ce8792d4c608f','modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...','',NULL,'4.25.1',NULL,NULL,'1619599482'),('9.0.0-recreate-constraints-after-column-increase','keycloak','META-INF/jpa-changelog-9.0.0.xml','2024-03-28 09:53:46',80,'MARK_RAN','9:077cba51999515f4d3e7ad5619ab592c','addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...','',NULL,'4.25.1',NULL,NULL,'1619599482'),('9.0.1-add-index-to-client.client_id','keycloak','META-INF/jpa-changelog-9.0.1.xml','2024-03-28 09:53:46',81,'EXECUTED','9:be969f08a163bf47c6b9e9ead8ac2afb','createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT','',NULL,'4.25.1',NULL,NULL,'1619599482'),('9.0.1-KEYCLOAK-12579-drop-constraints','keycloak','META-INF/jpa-changelog-9.0.1.xml','2024-03-28 09:53:46',82,'MARK_RAN','9:6d3bb4408ba5a72f39bd8a0b301ec6e3','dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'4.25.1',NULL,NULL,'1619599482'),('9.0.1-KEYCLOAK-12579-add-not-null-constraint','keycloak','META-INF/jpa-changelog-9.0.1.xml','2024-03-28 09:53:46',83,'EXECUTED','9:966bda61e46bebf3cc39518fbed52fa7','addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP','',NULL,'4.25.1',NULL,NULL,'1619599482'),('9.0.1-KEYCLOAK-12579-recreate-constraints','keycloak','META-INF/jpa-changelog-9.0.1.xml','2024-03-28 09:53:46',84,'MARK_RAN','9:8dcac7bdf7378e7d823cdfddebf72fda','addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'4.25.1',NULL,NULL,'1619599482'),('9.0.1-add-index-to-events','keycloak','META-INF/jpa-changelog-9.0.1.xml','2024-03-28 09:53:46',85,'EXECUTED','9:7d93d602352a30c0c317e6a609b56599','createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY','',NULL,'4.25.1',NULL,NULL,'1619599482'),('map-remove-ri','keycloak','META-INF/jpa-changelog-11.0.0.xml','2024-03-28 09:53:46',86,'EXECUTED','9:71c5969e6cdd8d7b6f47cebc86d37627','dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9','',NULL,'4.25.1',NULL,NULL,'1619599482'),('map-remove-ri','keycloak','META-INF/jpa-changelog-12.0.0.xml','2024-03-28 09:53:46',87,'EXECUTED','9:a9ba7d47f065f041b7da856a81762021','dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...','',NULL,'4.25.1',NULL,NULL,'1619599482'),('12.1.0-add-realm-localization-table','keycloak','META-INF/jpa-changelog-12.0.0.xml','2024-03-28 09:53:46',88,'EXECUTED','9:fffabce2bc01e1a8f5110d5278500065','createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS','',NULL,'4.25.1',NULL,NULL,'1619599482'),('default-roles','keycloak','META-INF/jpa-changelog-13.0.0.xml','2024-03-28 09:53:46',89,'EXECUTED','9:fa8a5b5445e3857f4b010bafb5009957','addColumn tableName=REALM; customChange','',NULL,'4.25.1',NULL,NULL,'1619599482'),('default-roles-cleanup','keycloak','META-INF/jpa-changelog-13.0.0.xml','2024-03-28 09:53:46',90,'EXECUTED','9:67ac3241df9a8582d591c5ed87125f39','dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES','',NULL,'4.25.1',NULL,NULL,'1619599482'),('13.0.0-KEYCLOAK-16844','keycloak','META-INF/jpa-changelog-13.0.0.xml','2024-03-28 09:53:46',91,'EXECUTED','9:ad1194d66c937e3ffc82386c050ba089','createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION','',NULL,'4.25.1',NULL,NULL,'1619599482'),('map-remove-ri-13.0.0','keycloak','META-INF/jpa-changelog-13.0.0.xml','2024-03-28 09:53:46',92,'EXECUTED','9:d9be619d94af5a2f5d07b9f003543b91','dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...','',NULL,'4.25.1',NULL,NULL,'1619599482'),('13.0.0-KEYCLOAK-17992-drop-constraints','keycloak','META-INF/jpa-changelog-13.0.0.xml','2024-03-28 09:53:46',93,'MARK_RAN','9:544d201116a0fcc5a5da0925fbbc3bde','dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT','',NULL,'4.25.1',NULL,NULL,'1619599482'),('13.0.0-increase-column-size-federated','keycloak','META-INF/jpa-changelog-13.0.0.xml','2024-03-28 09:53:47',94,'EXECUTED','9:43c0c1055b6761b4b3e89de76d612ccf','modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT','',NULL,'4.25.1',NULL,NULL,'1619599482'),('13.0.0-KEYCLOAK-17992-recreate-constraints','keycloak','META-INF/jpa-changelog-13.0.0.xml','2024-03-28 09:53:47',95,'MARK_RAN','9:8bd711fd0330f4fe980494ca43ab1139','addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...','',NULL,'4.25.1',NULL,NULL,'1619599482'),('json-string-accomodation-fixed','keycloak','META-INF/jpa-changelog-13.0.0.xml','2024-03-28 09:53:47',96,'EXECUTED','9:e07d2bc0970c348bb06fb63b1f82ddbf','addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE','',NULL,'4.25.1',NULL,NULL,'1619599482'),('14.0.0-KEYCLOAK-11019','keycloak','META-INF/jpa-changelog-14.0.0.xml','2024-03-28 09:53:47',97,'EXECUTED','9:24fb8611e97f29989bea412aa38d12b7','createIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USER, tableName=OFFLINE_USER_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION','',NULL,'4.25.1',NULL,NULL,'1619599482'),('14.0.0-KEYCLOAK-18286','keycloak','META-INF/jpa-changelog-14.0.0.xml','2024-03-28 09:53:47',98,'MARK_RAN','9:259f89014ce2506ee84740cbf7163aa7','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.25.1',NULL,NULL,'1619599482'),('14.0.0-KEYCLOAK-18286-revert','keycloak','META-INF/jpa-changelog-14.0.0.xml','2024-03-28 09:53:47',99,'MARK_RAN','9:04baaf56c116ed19951cbc2cca584022','dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.25.1',NULL,NULL,'1619599482'),('14.0.0-KEYCLOAK-18286-supported-dbs','keycloak','META-INF/jpa-changelog-14.0.0.xml','2024-03-28 09:53:47',100,'EXECUTED','9:bd2bd0fc7768cf0845ac96a8786fa735','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.25.1',NULL,NULL,'1619599482'),('14.0.0-KEYCLOAK-18286-unsupported-dbs','keycloak','META-INF/jpa-changelog-14.0.0.xml','2024-03-28 09:53:47',101,'MARK_RAN','9:d3d977031d431db16e2c181ce49d73e9','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.25.1',NULL,NULL,'1619599482'),('KEYCLOAK-17267-add-index-to-user-attributes','keycloak','META-INF/jpa-changelog-14.0.0.xml','2024-03-28 09:53:47',102,'EXECUTED','9:0b305d8d1277f3a89a0a53a659ad274c','createIndex indexName=IDX_USER_ATTRIBUTE_NAME, tableName=USER_ATTRIBUTE','',NULL,'4.25.1',NULL,NULL,'1619599482'),('KEYCLOAK-18146-add-saml-art-binding-identifier','keycloak','META-INF/jpa-changelog-14.0.0.xml','2024-03-28 09:53:47',103,'EXECUTED','9:2c374ad2cdfe20e2905a84c8fac48460','customChange','',NULL,'4.25.1',NULL,NULL,'1619599482'),('15.0.0-KEYCLOAK-18467','keycloak','META-INF/jpa-changelog-15.0.0.xml','2024-03-28 09:53:47',104,'EXECUTED','9:47a760639ac597360a8219f5b768b4de','addColumn tableName=REALM_LOCALIZATIONS; update tableName=REALM_LOCALIZATIONS; dropColumn columnName=TEXTS, tableName=REALM_LOCALIZATIONS; renameColumn newColumnName=TEXTS, oldColumnName=TEXTS_NEW, tableName=REALM_LOCALIZATIONS; addNotNullConstrai...','',NULL,'4.25.1',NULL,NULL,'1619599482'),('17.0.0-9562','keycloak','META-INF/jpa-changelog-17.0.0.xml','2024-03-28 09:53:47',105,'EXECUTED','9:a6272f0576727dd8cad2522335f5d99e','createIndex indexName=IDX_USER_SERVICE_ACCOUNT, tableName=USER_ENTITY','',NULL,'4.25.1',NULL,NULL,'1619599482'),('18.0.0-10625-IDX_ADMIN_EVENT_TIME','keycloak','META-INF/jpa-changelog-18.0.0.xml','2024-03-28 09:53:47',106,'EXECUTED','9:015479dbd691d9cc8669282f4828c41d','createIndex indexName=IDX_ADMIN_EVENT_TIME, tableName=ADMIN_EVENT_ENTITY','',NULL,'4.25.1',NULL,NULL,'1619599482'),('19.0.0-10135','keycloak','META-INF/jpa-changelog-19.0.0.xml','2024-03-28 09:53:47',107,'EXECUTED','9:9518e495fdd22f78ad6425cc30630221','customChange','',NULL,'4.25.1',NULL,NULL,'1619599482'),('20.0.0-12964-supported-dbs','keycloak','META-INF/jpa-changelog-20.0.0.xml','2024-03-28 09:53:47',108,'EXECUTED','9:f2e1331a71e0aa85e5608fe42f7f681c','createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE','',NULL,'4.25.1',NULL,NULL,'1619599482'),('20.0.0-12964-unsupported-dbs','keycloak','META-INF/jpa-changelog-20.0.0.xml','2024-03-28 09:53:47',109,'MARK_RAN','9:1a6fcaa85e20bdeae0a9ce49b41946a5','createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE','',NULL,'4.25.1',NULL,NULL,'1619599482'),('client-attributes-string-accomodation-fixed','keycloak','META-INF/jpa-changelog-20.0.0.xml','2024-03-28 09:53:47',110,'EXECUTED','9:3f332e13e90739ed0c35b0b25b7822ca','addColumn tableName=CLIENT_ATTRIBUTES; update tableName=CLIENT_ATTRIBUTES; dropColumn columnName=VALUE, tableName=CLIENT_ATTRIBUTES; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=CLIENT_ATTRIBUTES','',NULL,'4.25.1',NULL,NULL,'1619599482'),('21.0.2-17277','keycloak','META-INF/jpa-changelog-21.0.2.xml','2024-03-28 09:53:47',111,'EXECUTED','9:7ee1f7a3fb8f5588f171fb9a6ab623c0','customChange','',NULL,'4.25.1',NULL,NULL,'1619599482'),('21.1.0-19404','keycloak','META-INF/jpa-changelog-21.1.0.xml','2024-03-28 09:53:47',112,'EXECUTED','9:3d7e830b52f33676b9d64f7f2b2ea634','modifyDataType columnName=DECISION_STRATEGY, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=LOGIC, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=POLICY_ENFORCE_MODE, tableName=RESOURCE_SERVER','',NULL,'4.25.1',NULL,NULL,'1619599482'),('21.1.0-19404-2','keycloak','META-INF/jpa-changelog-21.1.0.xml','2024-03-28 09:53:47',113,'MARK_RAN','9:627d032e3ef2c06c0e1f73d2ae25c26c','addColumn tableName=RESOURCE_SERVER_POLICY; update tableName=RESOURCE_SERVER_POLICY; dropColumn columnName=DECISION_STRATEGY, tableName=RESOURCE_SERVER_POLICY; renameColumn newColumnName=DECISION_STRATEGY, oldColumnName=DECISION_STRATEGY_NEW, tabl...','',NULL,'4.25.1',NULL,NULL,'1619599482'),('22.0.0-17484-updated','keycloak','META-INF/jpa-changelog-22.0.0.xml','2024-03-28 09:53:47',114,'EXECUTED','9:90af0bfd30cafc17b9f4d6eccd92b8b3','customChange','',NULL,'4.25.1',NULL,NULL,'1619599482'),('22.0.5-24031','keycloak','META-INF/jpa-changelog-22.0.0.xml','2024-03-28 09:53:47',115,'MARK_RAN','9:a60d2d7b315ec2d3eba9e2f145f9df28','customChange','',NULL,'4.25.1',NULL,NULL,'1619599482'),('23.0.0-12062','keycloak','META-INF/jpa-changelog-23.0.0.xml','2024-03-28 09:53:48',116,'EXECUTED','9:2168fbe728fec46ae9baf15bf80927b8','addColumn tableName=COMPONENT_CONFIG; update tableName=COMPONENT_CONFIG; dropColumn columnName=VALUE, tableName=COMPONENT_CONFIG; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=COMPONENT_CONFIG','',NULL,'4.25.1',NULL,NULL,'1619599482'),('23.0.0-17258','keycloak','META-INF/jpa-changelog-23.0.0.xml','2024-03-28 09:53:48',117,'EXECUTED','9:36506d679a83bbfda85a27ea1864dca8','addColumn tableName=EVENT_ENTITY','',NULL,'4.25.1',NULL,NULL,'1619599482'),('24.0.0-9758','keycloak','META-INF/jpa-changelog-24.0.0.xml','2024-03-28 09:53:48',118,'EXECUTED','9:502c557a5189f600f0f445a9b49ebbce','addColumn tableName=USER_ATTRIBUTE; addColumn tableName=FED_USER_ATTRIBUTE; createIndex indexName=USER_ATTR_LONG_VALUES, tableName=USER_ATTRIBUTE; createIndex indexName=FED_USER_ATTR_LONG_VALUES, tableName=FED_USER_ATTRIBUTE; createIndex indexName...','',NULL,'4.25.1',NULL,NULL,'1619599482'),('24.0.0-9758-2','keycloak','META-INF/jpa-changelog-24.0.0.xml','2024-03-28 09:53:48',119,'EXECUTED','9:bf0fdee10afdf597a987adbf291db7b2','customChange','',NULL,'4.25.1',NULL,NULL,'1619599482'),('24.0.0-26618-drop-index-if-present','keycloak','META-INF/jpa-changelog-24.0.0.xml','2024-03-28 09:53:48',120,'EXECUTED','9:04baaf56c116ed19951cbc2cca584022','dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.25.1',NULL,NULL,'1619599482'),('24.0.0-26618-reindex','keycloak','META-INF/jpa-changelog-24.0.0.xml','2024-03-28 09:53:48',121,'EXECUTED','9:bd2bd0fc7768cf0845ac96a8786fa735','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.25.1',NULL,NULL,'1619599482'),('24.0.2-27228','keycloak','META-INF/jpa-changelog-24.0.2.xml','2024-03-28 09:53:48',122,'EXECUTED','9:eaee11f6b8aa25d2cc6a84fb86fc6238','customChange','',NULL,'4.25.1',NULL,NULL,'1619599482'),('24.0.2-27967-drop-index-if-present','keycloak','META-INF/jpa-changelog-24.0.2.xml','2024-03-28 09:53:48',123,'MARK_RAN','9:04baaf56c116ed19951cbc2cca584022','dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.25.1',NULL,NULL,'1619599482'),('24.0.2-27967-reindex','keycloak','META-INF/jpa-changelog-24.0.2.xml','2024-03-28 09:53:48',124,'MARK_RAN','9:d3d977031d431db16e2c181ce49d73e9','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.25.1',NULL,NULL,'1619599482');
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
INSERT INTO `DEFAULT_CLIENT_SCOPE` VALUES ('1a95a13f-0349-431c-878d-063e1ab2b03b','42f6dd38-4f90-46a9-ae94-923d87f3c9c2',1),('1a95a13f-0349-431c-878d-063e1ab2b03b','51267221-5a74-47ff-8c2c-6fc9619a04f6',1),('1a95a13f-0349-431c-878d-063e1ab2b03b','52631fd4-d536-4979-853b-7cd1885d5288',1),('1a95a13f-0349-431c-878d-063e1ab2b03b','697398e9-a60e-4eea-9574-ed8ec93f61e3',1),('1a95a13f-0349-431c-878d-063e1ab2b03b','97e7fe6d-ed01-415a-987e-9af8f5675fbe',0),('1a95a13f-0349-431c-878d-063e1ab2b03b','a5f18d95-cb6d-479a-98eb-8ab03c3bf47c',0),('1a95a13f-0349-431c-878d-063e1ab2b03b','b8f28c8b-a985-42db-9f59-bd1e89faf9b8',1),('1a95a13f-0349-431c-878d-063e1ab2b03b','e8164302-d993-4362-a36b-6728df6591a6',0),('1a95a13f-0349-431c-878d-063e1ab2b03b','f198d984-4117-4285-883d-71d3e9dc68ac',1),('1a95a13f-0349-431c-878d-063e1ab2b03b','f4bf617b-7b91-4dc8-808e-b62961e11dcf',0),('818b284a-a54c-4c96-a9d0-bb89323c0677','0695b0f1-0d54-4ca3-99ff-e67e6156a90c',0),('818b284a-a54c-4c96-a9d0-bb89323c0677','2b207451-e232-4dd7-9d58-156745031682',1),('818b284a-a54c-4c96-a9d0-bb89323c0677','3aeffac9-fa4e-466b-8efe-c8a8d61c7488',1),('818b284a-a54c-4c96-a9d0-bb89323c0677','617da333-bf9c-433c-8069-e68dca34d60d',1),('818b284a-a54c-4c96-a9d0-bb89323c0677','7a541fdb-70d8-4124-9ab7-a7a1f2afd1ab',0),('818b284a-a54c-4c96-a9d0-bb89323c0677','8f72f79f-5523-4bd3-adfc-f29b95839c18',1),('818b284a-a54c-4c96-a9d0-bb89323c0677','b20e2c9b-e685-4cf3-ab12-a568f7fe0c88',0),('818b284a-a54c-4c96-a9d0-bb89323c0677','b781552b-a871-4707-be1c-e09976d87669',0),('818b284a-a54c-4c96-a9d0-bb89323c0677','c5297cdd-76e0-4e1c-9805-63caf00e148e',1),('818b284a-a54c-4c96-a9d0-bb89323c0677','d4a22cf3-e2be-45c5-8c5e-63c0d4a2e5fb',1);
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
INSERT INTO `KEYCLOAK_ROLE` VALUES ('001e6945-d1ba-4e0c-b943-4f315fa1de34','edc5ffa7-7c0d-4e4a-bccb-ead45ac8a057',1,'${role_manage-consent}','manage-consent','818b284a-a54c-4c96-a9d0-bb89323c0677','edc5ffa7-7c0d-4e4a-bccb-ead45ac8a057',NULL),('01deb553-e291-4def-b6fb-2874086fa68a','40ae120f-9d1d-4585-ac43-052e0c0d1667',1,'${role_view-identity-providers}','view-identity-providers','818b284a-a54c-4c96-a9d0-bb89323c0677','40ae120f-9d1d-4585-ac43-052e0c0d1667',NULL),('05a7f111-c5e9-4a54-9695-e2fd949a7677','edc5ffa7-7c0d-4e4a-bccb-ead45ac8a057',1,'${role_manage-account-links}','manage-account-links','818b284a-a54c-4c96-a9d0-bb89323c0677','edc5ffa7-7c0d-4e4a-bccb-ead45ac8a057',NULL),('05b1900a-e75d-4a73-a5a9-fe4ab482cb48','818b284a-a54c-4c96-a9d0-bb89323c0677',0,'${role_create-realm}','create-realm','818b284a-a54c-4c96-a9d0-bb89323c0677',NULL,NULL),('0769d0f5-0a0d-4102-8fe9-050675546fe5','e05b9cae-aa75-426c-a7b6-bba768e8fa6e',1,'${role_delete-account}','delete-account','1a95a13f-0349-431c-878d-063e1ab2b03b','e05b9cae-aa75-426c-a7b6-bba768e8fa6e',NULL),('113c7795-7ced-4e39-b726-734949777e11','9292b5d7-9a28-4fb1-bab8-65c19b3334cb',1,'${role_view-identity-providers}','view-identity-providers','1a95a13f-0349-431c-878d-063e1ab2b03b','9292b5d7-9a28-4fb1-bab8-65c19b3334cb',NULL),('14f35596-2e89-4c42-b6e3-d0eaf5ba8dd8','9292b5d7-9a28-4fb1-bab8-65c19b3334cb',1,'${role_view-realm}','view-realm','1a95a13f-0349-431c-878d-063e1ab2b03b','9292b5d7-9a28-4fb1-bab8-65c19b3334cb',NULL),('199d79eb-43ab-4ed9-b79e-3963f96b7d49','2cd8fad4-80b6-4d23-87b4-12861f29edc6',1,'${role_view-events}','view-events','818b284a-a54c-4c96-a9d0-bb89323c0677','2cd8fad4-80b6-4d23-87b4-12861f29edc6',NULL),('207ee58e-ac3e-4cf6-9205-52765644cb3c','2cd8fad4-80b6-4d23-87b4-12861f29edc6',1,'${role_query-realms}','query-realms','818b284a-a54c-4c96-a9d0-bb89323c0677','2cd8fad4-80b6-4d23-87b4-12861f29edc6',NULL),('24e06b37-0542-4c0b-a298-1781fd6ca74b','d92e4588-d622-4c11-a9d0-322c3aeb15af',1,'${role_read-token}','read-token','818b284a-a54c-4c96-a9d0-bb89323c0677','d92e4588-d622-4c11-a9d0-322c3aeb15af',NULL),('28bfe554-caea-4d40-ac73-99afbdd43678','e05b9cae-aa75-426c-a7b6-bba768e8fa6e',1,'${role_manage-account-links}','manage-account-links','1a95a13f-0349-431c-878d-063e1ab2b03b','e05b9cae-aa75-426c-a7b6-bba768e8fa6e',NULL),('28ce766c-c751-401a-8cdf-004e1c773139','e05b9cae-aa75-426c-a7b6-bba768e8fa6e',1,'${role_view-applications}','view-applications','1a95a13f-0349-431c-878d-063e1ab2b03b','e05b9cae-aa75-426c-a7b6-bba768e8fa6e',NULL),('29e28efc-3110-47ee-ab2e-e9998be40267','1a95a13f-0349-431c-878d-063e1ab2b03b',0,'${role_uma_authorization}','uma_authorization','1a95a13f-0349-431c-878d-063e1ab2b03b',NULL,NULL),('2e42c3b0-c17a-48f4-a432-e2fd1d08ecd6','2cd8fad4-80b6-4d23-87b4-12861f29edc6',1,'${role_query-users}','query-users','818b284a-a54c-4c96-a9d0-bb89323c0677','2cd8fad4-80b6-4d23-87b4-12861f29edc6',NULL),('31adb299-236a-4708-8f7c-794c15b88d5c','2cd8fad4-80b6-4d23-87b4-12861f29edc6',1,'${role_query-groups}','query-groups','818b284a-a54c-4c96-a9d0-bb89323c0677','2cd8fad4-80b6-4d23-87b4-12861f29edc6',NULL),('33692cfa-a32c-4c9c-967e-37e5822f900a','40ae120f-9d1d-4585-ac43-052e0c0d1667',1,'${role_query-realms}','query-realms','818b284a-a54c-4c96-a9d0-bb89323c0677','40ae120f-9d1d-4585-ac43-052e0c0d1667',NULL),('33fffa5b-4422-477c-a180-484be1584547','e05b9cae-aa75-426c-a7b6-bba768e8fa6e',1,'${role_manage-account}','manage-account','1a95a13f-0349-431c-878d-063e1ab2b03b','e05b9cae-aa75-426c-a7b6-bba768e8fa6e',NULL),('351fcd63-0f99-4390-b851-028be52f772d','40ae120f-9d1d-4585-ac43-052e0c0d1667',1,'${role_view-events}','view-events','818b284a-a54c-4c96-a9d0-bb89323c0677','40ae120f-9d1d-4585-ac43-052e0c0d1667',NULL),('3744f6b3-6e3f-45b8-95a4-cbb5d556005b','40ae120f-9d1d-4585-ac43-052e0c0d1667',1,'${role_manage-events}','manage-events','818b284a-a54c-4c96-a9d0-bb89323c0677','40ae120f-9d1d-4585-ac43-052e0c0d1667',NULL),('38154683-25ee-418a-b4f1-0b30bbd57efd','2cd8fad4-80b6-4d23-87b4-12861f29edc6',1,'${role_view-realm}','view-realm','818b284a-a54c-4c96-a9d0-bb89323c0677','2cd8fad4-80b6-4d23-87b4-12861f29edc6',NULL),('396d3347-6e22-4885-b474-cd9fe3ab8930','9292b5d7-9a28-4fb1-bab8-65c19b3334cb',1,'${role_view-authorization}','view-authorization','1a95a13f-0349-431c-878d-063e1ab2b03b','9292b5d7-9a28-4fb1-bab8-65c19b3334cb',NULL),('3a087f6a-0af6-497f-992a-03c010532b15','083ce7c5-fe29-4a00-90de-087868fbc92c',1,'${role_read-token}','read-token','1a95a13f-0349-431c-878d-063e1ab2b03b','083ce7c5-fe29-4a00-90de-087868fbc92c',NULL),('3c2e9e45-938f-442b-83e6-261a3779bad1','2cd8fad4-80b6-4d23-87b4-12861f29edc6',1,'${role_view-identity-providers}','view-identity-providers','818b284a-a54c-4c96-a9d0-bb89323c0677','2cd8fad4-80b6-4d23-87b4-12861f29edc6',NULL),('43cf416a-e15a-476c-8402-5bf50f9e6f67','9292b5d7-9a28-4fb1-bab8-65c19b3334cb',1,'${role_query-realms}','query-realms','1a95a13f-0349-431c-878d-063e1ab2b03b','9292b5d7-9a28-4fb1-bab8-65c19b3334cb',NULL),('489d46f0-cfc5-40c4-ae2e-f5ce512b6135','edc5ffa7-7c0d-4e4a-bccb-ead45ac8a057',1,'${role_view-groups}','view-groups','818b284a-a54c-4c96-a9d0-bb89323c0677','edc5ffa7-7c0d-4e4a-bccb-ead45ac8a057',NULL),('4c5b5313-87e0-4b37-911f-74e12bfc4c55','e05b9cae-aa75-426c-a7b6-bba768e8fa6e',1,'${role_view-consent}','view-consent','1a95a13f-0349-431c-878d-063e1ab2b03b','e05b9cae-aa75-426c-a7b6-bba768e8fa6e',NULL),('54ea98e2-d82c-4b24-8cc5-9d2671d4ee2b','40ae120f-9d1d-4585-ac43-052e0c0d1667',1,'${role_query-clients}','query-clients','818b284a-a54c-4c96-a9d0-bb89323c0677','40ae120f-9d1d-4585-ac43-052e0c0d1667',NULL),('5727bd91-e1ab-48a8-83d7-4f6e550c2ccd','40ae120f-9d1d-4585-ac43-052e0c0d1667',1,'${role_view-authorization}','view-authorization','818b284a-a54c-4c96-a9d0-bb89323c0677','40ae120f-9d1d-4585-ac43-052e0c0d1667',NULL),('5a9ff775-218e-43ba-95fa-c034cbe88d8a','edc5ffa7-7c0d-4e4a-bccb-ead45ac8a057',1,'${role_view-consent}','view-consent','818b284a-a54c-4c96-a9d0-bb89323c0677','edc5ffa7-7c0d-4e4a-bccb-ead45ac8a057',NULL),('623a0892-b614-4464-90c6-c8990dfa9501','2cd8fad4-80b6-4d23-87b4-12861f29edc6',1,'${role_view-users}','view-users','818b284a-a54c-4c96-a9d0-bb89323c0677','2cd8fad4-80b6-4d23-87b4-12861f29edc6',NULL),('62d5d339-a457-466c-971f-9c59701eb2b9','2cd8fad4-80b6-4d23-87b4-12861f29edc6',1,'${role_manage-identity-providers}','manage-identity-providers','818b284a-a54c-4c96-a9d0-bb89323c0677','2cd8fad4-80b6-4d23-87b4-12861f29edc6',NULL),('63339eed-83cb-4864-a0a2-02560b907de7','40ae120f-9d1d-4585-ac43-052e0c0d1667',1,'${role_impersonation}','impersonation','818b284a-a54c-4c96-a9d0-bb89323c0677','40ae120f-9d1d-4585-ac43-052e0c0d1667',NULL),('69b5c6aa-0657-4e0b-a5f1-e2b91ac22310','2cd8fad4-80b6-4d23-87b4-12861f29edc6',1,'${role_manage-authorization}','manage-authorization','818b284a-a54c-4c96-a9d0-bb89323c0677','2cd8fad4-80b6-4d23-87b4-12861f29edc6',NULL),('720859fa-ff51-4581-9789-62f363e32aa3','40ae120f-9d1d-4585-ac43-052e0c0d1667',1,'${role_query-users}','query-users','818b284a-a54c-4c96-a9d0-bb89323c0677','40ae120f-9d1d-4585-ac43-052e0c0d1667',NULL),('72d224c4-bf7b-4b35-a31f-5c71d8166b8c','1a95a13f-0349-431c-878d-063e1ab2b03b',0,'Role User','USER','1a95a13f-0349-431c-878d-063e1ab2b03b',NULL,NULL),('7a31bb3f-b659-4058-8744-b1c6c9f79508','40ae120f-9d1d-4585-ac43-052e0c0d1667',1,'${role_create-client}','create-client','818b284a-a54c-4c96-a9d0-bb89323c0677','40ae120f-9d1d-4585-ac43-052e0c0d1667',NULL),('7ecbbfdb-7b8a-4532-ab53-d2e4540b60f1','9292b5d7-9a28-4fb1-bab8-65c19b3334cb',1,'${role_manage-authorization}','manage-authorization','1a95a13f-0349-431c-878d-063e1ab2b03b','9292b5d7-9a28-4fb1-bab8-65c19b3334cb',NULL),('80211bc4-928d-4b3e-8ef3-f6b9c0b6ffb1','40ae120f-9d1d-4585-ac43-052e0c0d1667',1,'${role_manage-clients}','manage-clients','818b284a-a54c-4c96-a9d0-bb89323c0677','40ae120f-9d1d-4585-ac43-052e0c0d1667',NULL),('85e68d24-74d6-4deb-b3b3-3a0a9a7c1518','9292b5d7-9a28-4fb1-bab8-65c19b3334cb',1,'${role_query-clients}','query-clients','1a95a13f-0349-431c-878d-063e1ab2b03b','9292b5d7-9a28-4fb1-bab8-65c19b3334cb',NULL),('8b6c0d48-c0ce-4bc2-8353-761624281c53','9292b5d7-9a28-4fb1-bab8-65c19b3334cb',1,'${role_view-events}','view-events','1a95a13f-0349-431c-878d-063e1ab2b03b','9292b5d7-9a28-4fb1-bab8-65c19b3334cb',NULL),('91a4ab5b-edaa-4bea-a9e4-45f8cf1eccf0','2cd8fad4-80b6-4d23-87b4-12861f29edc6',1,'${role_query-clients}','query-clients','818b284a-a54c-4c96-a9d0-bb89323c0677','2cd8fad4-80b6-4d23-87b4-12861f29edc6',NULL),('921b18ba-480a-461f-a4d2-901b35def037','40ae120f-9d1d-4585-ac43-052e0c0d1667',1,'${role_manage-realm}','manage-realm','818b284a-a54c-4c96-a9d0-bb89323c0677','40ae120f-9d1d-4585-ac43-052e0c0d1667',NULL),('98f2352a-a9b5-4d01-a08c-424833d2ec23','e05b9cae-aa75-426c-a7b6-bba768e8fa6e',1,'${role_view-profile}','view-profile','1a95a13f-0349-431c-878d-063e1ab2b03b','e05b9cae-aa75-426c-a7b6-bba768e8fa6e',NULL),('9b0f9149-6648-49cb-a95b-be30ba993b36','bccba2a3-e060-4ae3-8279-2bb9695af129',1,NULL,'uma_protection','1a95a13f-0349-431c-878d-063e1ab2b03b','bccba2a3-e060-4ae3-8279-2bb9695af129',NULL),('9d506b4a-00ee-46e9-b300-4ea27d812793','2cd8fad4-80b6-4d23-87b4-12861f29edc6',1,'${role_manage-users}','manage-users','818b284a-a54c-4c96-a9d0-bb89323c0677','2cd8fad4-80b6-4d23-87b4-12861f29edc6',NULL),('9ec6f916-2933-4281-b49d-c74ac13f6050','2cd8fad4-80b6-4d23-87b4-12861f29edc6',1,'${role_create-client}','create-client','818b284a-a54c-4c96-a9d0-bb89323c0677','2cd8fad4-80b6-4d23-87b4-12861f29edc6',NULL),('9ee05d76-d16d-4099-ab52-a90bb67d0cba','9292b5d7-9a28-4fb1-bab8-65c19b3334cb',1,'${role_view-clients}','view-clients','1a95a13f-0349-431c-878d-063e1ab2b03b','9292b5d7-9a28-4fb1-bab8-65c19b3334cb',NULL),('a0508ef8-d026-4242-940a-b47d705a5ea2','edc5ffa7-7c0d-4e4a-bccb-ead45ac8a057',1,'${role_view-applications}','view-applications','818b284a-a54c-4c96-a9d0-bb89323c0677','edc5ffa7-7c0d-4e4a-bccb-ead45ac8a057',NULL),('a265f25b-acc4-4b4a-9965-9b3abb7e182d','40ae120f-9d1d-4585-ac43-052e0c0d1667',1,'${role_query-groups}','query-groups','818b284a-a54c-4c96-a9d0-bb89323c0677','40ae120f-9d1d-4585-ac43-052e0c0d1667',NULL),('a2d4580f-7cd5-403d-9dc5-6237291e3eff','2cd8fad4-80b6-4d23-87b4-12861f29edc6',1,'${role_view-clients}','view-clients','818b284a-a54c-4c96-a9d0-bb89323c0677','2cd8fad4-80b6-4d23-87b4-12861f29edc6',NULL),('a337fc2f-99e5-48a1-883c-d47d663e6460','e05b9cae-aa75-426c-a7b6-bba768e8fa6e',1,'${role_view-groups}','view-groups','1a95a13f-0349-431c-878d-063e1ab2b03b','e05b9cae-aa75-426c-a7b6-bba768e8fa6e',NULL),('a5b63435-83d9-4835-a6d1-1568d758bbbf','1a95a13f-0349-431c-878d-063e1ab2b03b',0,'Role Admin','ADMIN','1a95a13f-0349-431c-878d-063e1ab2b03b',NULL,NULL),('a6833a4d-ebcc-4c73-b167-9798746933ef','40ae120f-9d1d-4585-ac43-052e0c0d1667',1,'${role_view-realm}','view-realm','818b284a-a54c-4c96-a9d0-bb89323c0677','40ae120f-9d1d-4585-ac43-052e0c0d1667',NULL),('a8d89a76-c43b-43e6-9bd6-4a00599a31e9','9292b5d7-9a28-4fb1-bab8-65c19b3334cb',1,'${role_manage-realm}','manage-realm','1a95a13f-0349-431c-878d-063e1ab2b03b','9292b5d7-9a28-4fb1-bab8-65c19b3334cb',NULL),('b3d0b536-6940-40b7-aff6-48d644c1e609','edc5ffa7-7c0d-4e4a-bccb-ead45ac8a057',1,'${role_manage-account}','manage-account','818b284a-a54c-4c96-a9d0-bb89323c0677','edc5ffa7-7c0d-4e4a-bccb-ead45ac8a057',NULL),('b63ce783-a95b-42e7-9aab-cb866eed050d','818b284a-a54c-4c96-a9d0-bb89323c0677',0,'${role_offline-access}','offline_access','818b284a-a54c-4c96-a9d0-bb89323c0677',NULL,NULL),('b66a3994-5332-47ae-8c7e-8e665c5bc4c2','9292b5d7-9a28-4fb1-bab8-65c19b3334cb',1,'${role_view-users}','view-users','1a95a13f-0349-431c-878d-063e1ab2b03b','9292b5d7-9a28-4fb1-bab8-65c19b3334cb',NULL),('b765c582-879f-42e6-b089-b74fcc1ff7c5','9292b5d7-9a28-4fb1-bab8-65c19b3334cb',1,'${role_manage-clients}','manage-clients','1a95a13f-0349-431c-878d-063e1ab2b03b','9292b5d7-9a28-4fb1-bab8-65c19b3334cb',NULL),('b7aa4d8a-3956-483c-8b4e-a78bda24cdd8','2cd8fad4-80b6-4d23-87b4-12861f29edc6',1,'${role_manage-clients}','manage-clients','818b284a-a54c-4c96-a9d0-bb89323c0677','2cd8fad4-80b6-4d23-87b4-12861f29edc6',NULL),('bb666b01-a24b-49ff-8b36-72ba4a673aee','2cd8fad4-80b6-4d23-87b4-12861f29edc6',1,'${role_impersonation}','impersonation','818b284a-a54c-4c96-a9d0-bb89323c0677','2cd8fad4-80b6-4d23-87b4-12861f29edc6',NULL),('bc4e3f40-8e86-47b3-9bcc-3628cc8db42e','40ae120f-9d1d-4585-ac43-052e0c0d1667',1,'${role_manage-users}','manage-users','818b284a-a54c-4c96-a9d0-bb89323c0677','40ae120f-9d1d-4585-ac43-052e0c0d1667',NULL),('bd01b954-b5aa-45bc-9658-8328afafe67f','1a95a13f-0349-431c-878d-063e1ab2b03b',0,'${role_offline-access}','offline_access','1a95a13f-0349-431c-878d-063e1ab2b03b',NULL,NULL),('bd20d0bb-d28d-4002-8709-e448d216863c','818b284a-a54c-4c96-a9d0-bb89323c0677',0,'${role_uma_authorization}','uma_authorization','818b284a-a54c-4c96-a9d0-bb89323c0677',NULL,NULL),('bf2a8603-b095-4882-956d-eb22a6fcb2b3','edc5ffa7-7c0d-4e4a-bccb-ead45ac8a057',1,'${role_delete-account}','delete-account','818b284a-a54c-4c96-a9d0-bb89323c0677','edc5ffa7-7c0d-4e4a-bccb-ead45ac8a057',NULL),('c15e6d78-0435-43eb-a3a6-affec75f09f4','818b284a-a54c-4c96-a9d0-bb89323c0677',0,'${role_admin}','admin','818b284a-a54c-4c96-a9d0-bb89323c0677',NULL,NULL),('c173f43d-fd84-440a-878c-ccfbc635807d','818b284a-a54c-4c96-a9d0-bb89323c0677',0,'${role_default-roles}','default-roles-master','818b284a-a54c-4c96-a9d0-bb89323c0677',NULL,NULL),('c3daa9fd-2978-44ce-b581-b9e7c59716d8','9292b5d7-9a28-4fb1-bab8-65c19b3334cb',1,'${role_query-users}','query-users','1a95a13f-0349-431c-878d-063e1ab2b03b','9292b5d7-9a28-4fb1-bab8-65c19b3334cb',NULL),('c7981972-4f6c-45aa-a6d3-aa169b5a0754','9292b5d7-9a28-4fb1-bab8-65c19b3334cb',1,'${role_query-groups}','query-groups','1a95a13f-0349-431c-878d-063e1ab2b03b','9292b5d7-9a28-4fb1-bab8-65c19b3334cb',NULL),('c7abcac1-50ce-4c5e-98a7-31b32b7a2d85','9292b5d7-9a28-4fb1-bab8-65c19b3334cb',1,'${role_manage-users}','manage-users','1a95a13f-0349-431c-878d-063e1ab2b03b','9292b5d7-9a28-4fb1-bab8-65c19b3334cb',NULL),('d64c7a31-ab1d-4895-9749-9ccf1c8d60be','40ae120f-9d1d-4585-ac43-052e0c0d1667',1,'${role_view-users}','view-users','818b284a-a54c-4c96-a9d0-bb89323c0677','40ae120f-9d1d-4585-ac43-052e0c0d1667',NULL),('d77c0d39-1d27-45f1-9d99-b49d0a7abc5a','2cd8fad4-80b6-4d23-87b4-12861f29edc6',1,'${role_manage-events}','manage-events','818b284a-a54c-4c96-a9d0-bb89323c0677','2cd8fad4-80b6-4d23-87b4-12861f29edc6',NULL),('dac0435e-ddb2-426e-89e2-4772bf7b9ba3','2cd8fad4-80b6-4d23-87b4-12861f29edc6',1,'${role_manage-realm}','manage-realm','818b284a-a54c-4c96-a9d0-bb89323c0677','2cd8fad4-80b6-4d23-87b4-12861f29edc6',NULL),('e14ac7d1-6115-49ae-944b-b86317a99b69','2cd8fad4-80b6-4d23-87b4-12861f29edc6',1,'${role_view-authorization}','view-authorization','818b284a-a54c-4c96-a9d0-bb89323c0677','2cd8fad4-80b6-4d23-87b4-12861f29edc6',NULL),('e2e4962a-4034-4328-92a3-1146096b3b57','e05b9cae-aa75-426c-a7b6-bba768e8fa6e',1,'${role_manage-consent}','manage-consent','1a95a13f-0349-431c-878d-063e1ab2b03b','e05b9cae-aa75-426c-a7b6-bba768e8fa6e',NULL),('e785566e-6ec6-4709-84ad-7332802ee4e8','40ae120f-9d1d-4585-ac43-052e0c0d1667',1,'${role_manage-identity-providers}','manage-identity-providers','818b284a-a54c-4c96-a9d0-bb89323c0677','40ae120f-9d1d-4585-ac43-052e0c0d1667',NULL),('ea68930e-a414-4590-9967-f84cbaade328','9292b5d7-9a28-4fb1-bab8-65c19b3334cb',1,'${role_impersonation}','impersonation','1a95a13f-0349-431c-878d-063e1ab2b03b','9292b5d7-9a28-4fb1-bab8-65c19b3334cb',NULL),('eb34a9e5-01a0-4b8c-aecb-909fc92368a9','edc5ffa7-7c0d-4e4a-bccb-ead45ac8a057',1,'${role_view-profile}','view-profile','818b284a-a54c-4c96-a9d0-bb89323c0677','edc5ffa7-7c0d-4e4a-bccb-ead45ac8a057',NULL),('ef3404a3-5146-4049-8c80-aef84fb2487c','40ae120f-9d1d-4585-ac43-052e0c0d1667',1,'${role_manage-authorization}','manage-authorization','818b284a-a54c-4c96-a9d0-bb89323c0677','40ae120f-9d1d-4585-ac43-052e0c0d1667',NULL),('f385b26e-c4b2-4b53-9ef4-6cc9d2815909','9292b5d7-9a28-4fb1-bab8-65c19b3334cb',1,'${role_manage-identity-providers}','manage-identity-providers','1a95a13f-0349-431c-878d-063e1ab2b03b','9292b5d7-9a28-4fb1-bab8-65c19b3334cb',NULL),('f4583114-5861-467f-9663-b2ec053365dc','9292b5d7-9a28-4fb1-bab8-65c19b3334cb',1,'${role_create-client}','create-client','1a95a13f-0349-431c-878d-063e1ab2b03b','9292b5d7-9a28-4fb1-bab8-65c19b3334cb',NULL),('f5287a81-3999-45c7-b018-b849e77c9cd4','40ae120f-9d1d-4585-ac43-052e0c0d1667',1,'${role_view-clients}','view-clients','818b284a-a54c-4c96-a9d0-bb89323c0677','40ae120f-9d1d-4585-ac43-052e0c0d1667',NULL),('f9e9296b-f1a0-43f5-a614-fb68560c8b4f','9292b5d7-9a28-4fb1-bab8-65c19b3334cb',1,'${role_manage-events}','manage-events','1a95a13f-0349-431c-878d-063e1ab2b03b','9292b5d7-9a28-4fb1-bab8-65c19b3334cb',NULL),('fc556831-ed76-426c-8e20-70fb73c30e01','1a95a13f-0349-431c-878d-063e1ab2b03b',0,'${role_default-roles}','default-roles-ou-graduation-realm','1a95a13f-0349-431c-878d-063e1ab2b03b',NULL,NULL),('fcf20bee-a2a2-4cc4-b7a0-2bf433218172','9292b5d7-9a28-4fb1-bab8-65c19b3334cb',1,'${role_realm-admin}','realm-admin','1a95a13f-0349-431c-878d-063e1ab2b03b','9292b5d7-9a28-4fb1-bab8-65c19b3334cb',NULL);
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
INSERT INTO `MIGRATION_MODEL` VALUES ('w5k0k','24.0.2',1711619628);
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
INSERT INTO `POLICY_CONFIG` VALUES ('0e330c02-df22-46a9-a914-1300cfeeeb74','defaultResourceType','urn:ou-graduation-client:resources:default'),('4c5146d8-4451-49cb-b0c5-32e16289c485','code','// by default, grants any permission associated with this policy\n$evaluation.grant();\n');
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
INSERT INTO `PROTOCOL_MAPPER` VALUES ('03abb3b0-70f5-49d7-a423-7341404d3cf6','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'8f72f79f-5523-4bd3-adfc-f29b95839c18'),('0c6931ac-61e1-4abc-8a1b-4aef3494c48b','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'42f6dd38-4f90-46a9-ae94-923d87f3c9c2'),('0f83b739-a35c-4e78-86ee-be3e53b4a48d','Client ID','openid-connect','oidc-usersessionmodel-note-mapper','bccba2a3-e060-4ae3-8279-2bb9695af129',NULL),('10cc1fd0-aa5f-446c-a600-350afd271aef','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'d4a22cf3-e2be-45c5-8c5e-63c0d4a2e5fb'),('14af0e48-012f-4406-b964-2c4926650b31','address','openid-connect','oidc-address-mapper',NULL,'b781552b-a871-4707-be1c-e09976d87669'),('1aca45b9-d538-4fd0-a2f5-6ce7b34ec7bf','acr loa level','openid-connect','oidc-acr-mapper',NULL,'697398e9-a60e-4eea-9574-ed8ec93f61e3'),('1d647061-662e-405b-bdcf-d01f3817528b','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'51267221-5a74-47ff-8c2c-6fc9619a04f6'),('1f77d14f-ecd8-4ced-ab38-5c17dfd11f40','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'51267221-5a74-47ff-8c2c-6fc9619a04f6'),('27632a2e-9fd1-40bc-b384-0e24eeb79166','email','openid-connect','oidc-usermodel-attribute-mapper',NULL,'b8f28c8b-a985-42db-9f59-bd1e89faf9b8'),('2da5686a-6c86-4765-b1a2-c9faa69f2814','address','openid-connect','oidc-address-mapper',NULL,'f4bf617b-7b91-4dc8-808e-b62961e11dcf'),('2e3e986e-1c56-4283-8d6d-433bbda8460c','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'51267221-5a74-47ff-8c2c-6fc9619a04f6'),('30d5bab7-e24f-42ad-88dc-808b7654fc6c','family name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'51267221-5a74-47ff-8c2c-6fc9619a04f6'),('30e34fba-481e-48ac-af35-fb249a940101','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'51267221-5a74-47ff-8c2c-6fc9619a04f6'),('3159e9c6-7603-417a-8b67-8cb4f0f1687f','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'97e7fe6d-ed01-415a-987e-9af8f5675fbe'),('31b8655f-40f2-4eed-b41b-00675abf661d','given name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'8f72f79f-5523-4bd3-adfc-f29b95839c18'),('39e62a58-0ffa-4762-9fb1-926b3ff106e3','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'2b207451-e232-4dd7-9d58-156745031682'),('3a0c6db0-ee33-4e9e-918f-82a35eefb17b','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'8f72f79f-5523-4bd3-adfc-f29b95839c18'),('3b96be4f-ed5d-4936-bc4b-ad2ad218fee1','family name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'8f72f79f-5523-4bd3-adfc-f29b95839c18'),('42533ef7-556f-4b3e-839c-82aafaf79d56','role list','saml','saml-role-list-mapper',NULL,'52631fd4-d536-4979-853b-7cd1885d5288'),('42f25632-a9d0-4d9a-be5e-a145e4ff77ef','acr loa level','openid-connect','oidc-acr-mapper',NULL,'3aeffac9-fa4e-466b-8efe-c8a8d61c7488'),('4d6355e7-bd04-48ae-af8b-6becb19e364c','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'617da333-bf9c-433c-8069-e68dca34d60d'),('50ec56c0-06f9-4b6b-95a7-36183b1d40ea','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'a5f18d95-cb6d-479a-98eb-8ab03c3bf47c'),('54d7f15a-1878-4538-b232-35e15a43366a','email','openid-connect','oidc-usermodel-attribute-mapper',NULL,'d4a22cf3-e2be-45c5-8c5e-63c0d4a2e5fb'),('5793edb1-e859-425a-915e-5491eb9eef8e','locale','openid-connect','oidc-usermodel-attribute-mapper','ba4a9551-9e5c-4610-88e9-11a09c8d4307',NULL),('57a57309-e0f7-4844-96af-f34d2488611b','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'8f72f79f-5523-4bd3-adfc-f29b95839c18'),('5d075ff1-fb0e-4d2e-8e5b-63906611ac2e','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'51267221-5a74-47ff-8c2c-6fc9619a04f6'),('658e7c6c-deb3-46a9-85af-1e14f34fae31','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'8f72f79f-5523-4bd3-adfc-f29b95839c18'),('69185eb6-6b2b-41f9-a768-9726e3251700','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'51267221-5a74-47ff-8c2c-6fc9619a04f6'),('6e10d560-54c2-460c-b738-de2a05217c21','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'8f72f79f-5523-4bd3-adfc-f29b95839c18'),('6e3faf27-6c15-43d6-9678-a880ccbb1133','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'0695b0f1-0d54-4ca3-99ff-e67e6156a90c'),('72345c31-0963-4a3a-a2ac-2e6a7cbf2372','username','openid-connect','oidc-usermodel-attribute-mapper',NULL,'51267221-5a74-47ff-8c2c-6fc9619a04f6'),('7492b026-4d3d-4344-88b9-47e011a9373c','given name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'51267221-5a74-47ff-8c2c-6fc9619a04f6'),('79b5683d-f318-4eb0-8538-a14203dac0a1','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'617da333-bf9c-433c-8069-e68dca34d60d'),('81b109ae-f216-40e5-b93c-efec4a368b92','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'51267221-5a74-47ff-8c2c-6fc9619a04f6'),('84fb0a79-054a-433a-a962-b844a1ef7cc6','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'8f72f79f-5523-4bd3-adfc-f29b95839c18'),('953e5018-b071-465b-8077-0838c10b4628','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'8f72f79f-5523-4bd3-adfc-f29b95839c18'),('98a38975-d1e3-40e5-ba9b-089a56b21130','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'b8f28c8b-a985-42db-9f59-bd1e89faf9b8'),('a2e4f59f-9f22-4504-8747-25cd6f28a63b','upn','openid-connect','oidc-usermodel-attribute-mapper',NULL,'0695b0f1-0d54-4ca3-99ff-e67e6156a90c'),('a9846598-6b36-4405-ac96-de91c95184e8','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'51267221-5a74-47ff-8c2c-6fc9619a04f6'),('aa8ac134-d578-4171-9a29-e6484515e708','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'51267221-5a74-47ff-8c2c-6fc9619a04f6'),('ab50fbdf-8601-42ff-a466-cc710f1cacf9','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'7a541fdb-70d8-4124-9ab7-a7a1f2afd1ab'),('adc2f28c-f8ea-4732-8a12-53bb7e4a2610','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'617da333-bf9c-433c-8069-e68dca34d60d'),('b64edc2a-1e43-4003-82c2-07a82e13b308','Client Host','openid-connect','oidc-usersessionmodel-note-mapper','bccba2a3-e060-4ae3-8279-2bb9695af129',NULL),('bc28d6d1-88c8-49db-8611-9802e900b610','locale','openid-connect','oidc-usermodel-attribute-mapper','b5668e36-56c8-436a-b767-eafb09b8a77e',NULL),('beb4855f-5e7f-4b94-98a7-bbeb1e3679e9','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'97e7fe6d-ed01-415a-987e-9af8f5675fbe'),('bf0f3697-82a1-4893-ac82-58453276a819','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'42f6dd38-4f90-46a9-ae94-923d87f3c9c2'),('cd9d76a5-450e-4008-89c7-c1cabb728dd7','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'8f72f79f-5523-4bd3-adfc-f29b95839c18'),('d7bcc35d-1459-481f-ac13-de8e11007d26','upn','openid-connect','oidc-usermodel-attribute-mapper',NULL,'a5f18d95-cb6d-479a-98eb-8ab03c3bf47c'),('d8a2ba30-e156-4e36-8746-48bad0088fdf','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'7a541fdb-70d8-4124-9ab7-a7a1f2afd1ab'),('d8f757e0-7285-4326-b126-a9a96cd57a2d','role list','saml','saml-role-list-mapper',NULL,'c5297cdd-76e0-4e1c-9805-63caf00e148e'),('dd2e90d9-46b2-4df0-bb99-47c73720d090','audience resolve','openid-connect','oidc-audience-resolve-mapper','88461b68-c1c9-4f07-971a-81fdf4d087e5',NULL),('df7da0f5-dcf8-4d98-abb7-56e19dd8fa08','full name','openid-connect','oidc-full-name-mapper',NULL,'51267221-5a74-47ff-8c2c-6fc9619a04f6'),('e27daaad-7698-4c53-9f6b-fd3646a3e86c','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'8f72f79f-5523-4bd3-adfc-f29b95839c18'),('e33e7ecc-64c6-4022-89e2-b0ebd919432f','Client IP Address','openid-connect','oidc-usersessionmodel-note-mapper','bccba2a3-e060-4ae3-8279-2bb9695af129',NULL),('e7d12bd9-1cd7-4903-bfff-70d3bebd8e95','full name','openid-connect','oidc-full-name-mapper',NULL,'8f72f79f-5523-4bd3-adfc-f29b95839c18'),('ea285c80-8d5b-4af9-bbe6-9857a46d9917','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'42f6dd38-4f90-46a9-ae94-923d87f3c9c2'),('ec9e5cf8-1636-4dfd-bbba-697b522ec8c9','audience resolve','openid-connect','oidc-audience-resolve-mapper','05b9931f-0ca3-4fcd-97c0-9fab2d2344fb',NULL),('f0f10102-d3f4-4456-b1b7-8b8f8df1b14c','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'f198d984-4117-4285-883d-71d3e9dc68ac'),('f3c238b4-6116-4c2d-9e93-e2521702dbfc','username','openid-connect','oidc-usermodel-attribute-mapper',NULL,'8f72f79f-5523-4bd3-adfc-f29b95839c18'),('f5ad2d68-4e74-459e-b1e9-f6e19a396a76','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'51267221-5a74-47ff-8c2c-6fc9619a04f6'),('f6754be9-cf5b-48ff-b170-e33c3743763c','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'8f72f79f-5523-4bd3-adfc-f29b95839c18');
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
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('03abb3b0-70f5-49d7-a423-7341404d3cf6','true','access.token.claim'),('03abb3b0-70f5-49d7-a423-7341404d3cf6','middle_name','claim.name'),('03abb3b0-70f5-49d7-a423-7341404d3cf6','true','id.token.claim'),('03abb3b0-70f5-49d7-a423-7341404d3cf6','true','introspection.token.claim'),('03abb3b0-70f5-49d7-a423-7341404d3cf6','String','jsonType.label'),('03abb3b0-70f5-49d7-a423-7341404d3cf6','middleName','user.attribute'),('03abb3b0-70f5-49d7-a423-7341404d3cf6','true','userinfo.token.claim'),('0c6931ac-61e1-4abc-8a1b-4aef3494c48b','true','access.token.claim'),('0c6931ac-61e1-4abc-8a1b-4aef3494c48b','resource_access.${client_id}.roles','claim.name'),('0c6931ac-61e1-4abc-8a1b-4aef3494c48b','true','introspection.token.claim'),('0c6931ac-61e1-4abc-8a1b-4aef3494c48b','String','jsonType.label'),('0c6931ac-61e1-4abc-8a1b-4aef3494c48b','true','multivalued'),('0c6931ac-61e1-4abc-8a1b-4aef3494c48b','foo','user.attribute'),('0f83b739-a35c-4e78-86ee-be3e53b4a48d','true','access.token.claim'),('0f83b739-a35c-4e78-86ee-be3e53b4a48d','client_id','claim.name'),('0f83b739-a35c-4e78-86ee-be3e53b4a48d','true','id.token.claim'),('0f83b739-a35c-4e78-86ee-be3e53b4a48d','true','introspection.token.claim'),('0f83b739-a35c-4e78-86ee-be3e53b4a48d','String','jsonType.label'),('0f83b739-a35c-4e78-86ee-be3e53b4a48d','client_id','user.session.note'),('10cc1fd0-aa5f-446c-a600-350afd271aef','true','access.token.claim'),('10cc1fd0-aa5f-446c-a600-350afd271aef','email_verified','claim.name'),('10cc1fd0-aa5f-446c-a600-350afd271aef','true','id.token.claim'),('10cc1fd0-aa5f-446c-a600-350afd271aef','true','introspection.token.claim'),('10cc1fd0-aa5f-446c-a600-350afd271aef','boolean','jsonType.label'),('10cc1fd0-aa5f-446c-a600-350afd271aef','emailVerified','user.attribute'),('10cc1fd0-aa5f-446c-a600-350afd271aef','true','userinfo.token.claim'),('14af0e48-012f-4406-b964-2c4926650b31','true','access.token.claim'),('14af0e48-012f-4406-b964-2c4926650b31','true','id.token.claim'),('14af0e48-012f-4406-b964-2c4926650b31','true','introspection.token.claim'),('14af0e48-012f-4406-b964-2c4926650b31','country','user.attribute.country'),('14af0e48-012f-4406-b964-2c4926650b31','formatted','user.attribute.formatted'),('14af0e48-012f-4406-b964-2c4926650b31','locality','user.attribute.locality'),('14af0e48-012f-4406-b964-2c4926650b31','postal_code','user.attribute.postal_code'),('14af0e48-012f-4406-b964-2c4926650b31','region','user.attribute.region'),('14af0e48-012f-4406-b964-2c4926650b31','street','user.attribute.street'),('14af0e48-012f-4406-b964-2c4926650b31','true','userinfo.token.claim'),('1aca45b9-d538-4fd0-a2f5-6ce7b34ec7bf','true','access.token.claim'),('1aca45b9-d538-4fd0-a2f5-6ce7b34ec7bf','true','id.token.claim'),('1aca45b9-d538-4fd0-a2f5-6ce7b34ec7bf','true','introspection.token.claim'),('1d647061-662e-405b-bdcf-d01f3817528b','true','access.token.claim'),('1d647061-662e-405b-bdcf-d01f3817528b','picture','claim.name'),('1d647061-662e-405b-bdcf-d01f3817528b','true','id.token.claim'),('1d647061-662e-405b-bdcf-d01f3817528b','true','introspection.token.claim'),('1d647061-662e-405b-bdcf-d01f3817528b','String','jsonType.label'),('1d647061-662e-405b-bdcf-d01f3817528b','picture','user.attribute'),('1d647061-662e-405b-bdcf-d01f3817528b','true','userinfo.token.claim'),('1f77d14f-ecd8-4ced-ab38-5c17dfd11f40','true','access.token.claim'),('1f77d14f-ecd8-4ced-ab38-5c17dfd11f40','birthdate','claim.name'),('1f77d14f-ecd8-4ced-ab38-5c17dfd11f40','true','id.token.claim'),('1f77d14f-ecd8-4ced-ab38-5c17dfd11f40','true','introspection.token.claim'),('1f77d14f-ecd8-4ced-ab38-5c17dfd11f40','String','jsonType.label'),('1f77d14f-ecd8-4ced-ab38-5c17dfd11f40','birthdate','user.attribute'),('1f77d14f-ecd8-4ced-ab38-5c17dfd11f40','true','userinfo.token.claim'),('27632a2e-9fd1-40bc-b384-0e24eeb79166','true','access.token.claim'),('27632a2e-9fd1-40bc-b384-0e24eeb79166','email','claim.name'),('27632a2e-9fd1-40bc-b384-0e24eeb79166','true','id.token.claim'),('27632a2e-9fd1-40bc-b384-0e24eeb79166','true','introspection.token.claim'),('27632a2e-9fd1-40bc-b384-0e24eeb79166','String','jsonType.label'),('27632a2e-9fd1-40bc-b384-0e24eeb79166','email','user.attribute'),('27632a2e-9fd1-40bc-b384-0e24eeb79166','true','userinfo.token.claim'),('2da5686a-6c86-4765-b1a2-c9faa69f2814','true','access.token.claim'),('2da5686a-6c86-4765-b1a2-c9faa69f2814','true','id.token.claim'),('2da5686a-6c86-4765-b1a2-c9faa69f2814','true','introspection.token.claim'),('2da5686a-6c86-4765-b1a2-c9faa69f2814','country','user.attribute.country'),('2da5686a-6c86-4765-b1a2-c9faa69f2814','formatted','user.attribute.formatted'),('2da5686a-6c86-4765-b1a2-c9faa69f2814','locality','user.attribute.locality'),('2da5686a-6c86-4765-b1a2-c9faa69f2814','postal_code','user.attribute.postal_code'),('2da5686a-6c86-4765-b1a2-c9faa69f2814','region','user.attribute.region'),('2da5686a-6c86-4765-b1a2-c9faa69f2814','street','user.attribute.street'),('2da5686a-6c86-4765-b1a2-c9faa69f2814','true','userinfo.token.claim'),('2e3e986e-1c56-4283-8d6d-433bbda8460c','true','access.token.claim'),('2e3e986e-1c56-4283-8d6d-433bbda8460c','nickname','claim.name'),('2e3e986e-1c56-4283-8d6d-433bbda8460c','true','id.token.claim'),('2e3e986e-1c56-4283-8d6d-433bbda8460c','true','introspection.token.claim'),('2e3e986e-1c56-4283-8d6d-433bbda8460c','String','jsonType.label'),('2e3e986e-1c56-4283-8d6d-433bbda8460c','nickname','user.attribute'),('2e3e986e-1c56-4283-8d6d-433bbda8460c','true','userinfo.token.claim'),('30d5bab7-e24f-42ad-88dc-808b7654fc6c','true','access.token.claim'),('30d5bab7-e24f-42ad-88dc-808b7654fc6c','family_name','claim.name'),('30d5bab7-e24f-42ad-88dc-808b7654fc6c','true','id.token.claim'),('30d5bab7-e24f-42ad-88dc-808b7654fc6c','true','introspection.token.claim'),('30d5bab7-e24f-42ad-88dc-808b7654fc6c','String','jsonType.label'),('30d5bab7-e24f-42ad-88dc-808b7654fc6c','lastName','user.attribute'),('30d5bab7-e24f-42ad-88dc-808b7654fc6c','true','userinfo.token.claim'),('30e34fba-481e-48ac-af35-fb249a940101','true','access.token.claim'),('30e34fba-481e-48ac-af35-fb249a940101','locale','claim.name'),('30e34fba-481e-48ac-af35-fb249a940101','true','id.token.claim'),('30e34fba-481e-48ac-af35-fb249a940101','true','introspection.token.claim'),('30e34fba-481e-48ac-af35-fb249a940101','String','jsonType.label'),('30e34fba-481e-48ac-af35-fb249a940101','locale','user.attribute'),('30e34fba-481e-48ac-af35-fb249a940101','true','userinfo.token.claim'),('3159e9c6-7603-417a-8b67-8cb4f0f1687f','true','access.token.claim'),('3159e9c6-7603-417a-8b67-8cb4f0f1687f','phone_number','claim.name'),('3159e9c6-7603-417a-8b67-8cb4f0f1687f','true','id.token.claim'),('3159e9c6-7603-417a-8b67-8cb4f0f1687f','true','introspection.token.claim'),('3159e9c6-7603-417a-8b67-8cb4f0f1687f','String','jsonType.label'),('3159e9c6-7603-417a-8b67-8cb4f0f1687f','phoneNumber','user.attribute'),('3159e9c6-7603-417a-8b67-8cb4f0f1687f','true','userinfo.token.claim'),('31b8655f-40f2-4eed-b41b-00675abf661d','true','access.token.claim'),('31b8655f-40f2-4eed-b41b-00675abf661d','given_name','claim.name'),('31b8655f-40f2-4eed-b41b-00675abf661d','true','id.token.claim'),('31b8655f-40f2-4eed-b41b-00675abf661d','true','introspection.token.claim'),('31b8655f-40f2-4eed-b41b-00675abf661d','String','jsonType.label'),('31b8655f-40f2-4eed-b41b-00675abf661d','firstName','user.attribute'),('31b8655f-40f2-4eed-b41b-00675abf661d','true','userinfo.token.claim'),('39e62a58-0ffa-4762-9fb1-926b3ff106e3','true','access.token.claim'),('39e62a58-0ffa-4762-9fb1-926b3ff106e3','true','introspection.token.claim'),('3a0c6db0-ee33-4e9e-918f-82a35eefb17b','true','access.token.claim'),('3a0c6db0-ee33-4e9e-918f-82a35eefb17b','nickname','claim.name'),('3a0c6db0-ee33-4e9e-918f-82a35eefb17b','true','id.token.claim'),('3a0c6db0-ee33-4e9e-918f-82a35eefb17b','true','introspection.token.claim'),('3a0c6db0-ee33-4e9e-918f-82a35eefb17b','String','jsonType.label'),('3a0c6db0-ee33-4e9e-918f-82a35eefb17b','nickname','user.attribute'),('3a0c6db0-ee33-4e9e-918f-82a35eefb17b','true','userinfo.token.claim'),('3b96be4f-ed5d-4936-bc4b-ad2ad218fee1','true','access.token.claim'),('3b96be4f-ed5d-4936-bc4b-ad2ad218fee1','family_name','claim.name'),('3b96be4f-ed5d-4936-bc4b-ad2ad218fee1','true','id.token.claim'),('3b96be4f-ed5d-4936-bc4b-ad2ad218fee1','true','introspection.token.claim'),('3b96be4f-ed5d-4936-bc4b-ad2ad218fee1','String','jsonType.label'),('3b96be4f-ed5d-4936-bc4b-ad2ad218fee1','lastName','user.attribute'),('3b96be4f-ed5d-4936-bc4b-ad2ad218fee1','true','userinfo.token.claim'),('42533ef7-556f-4b3e-839c-82aafaf79d56','Role','attribute.name'),('42533ef7-556f-4b3e-839c-82aafaf79d56','Basic','attribute.nameformat'),('42533ef7-556f-4b3e-839c-82aafaf79d56','false','single'),('42f25632-a9d0-4d9a-be5e-a145e4ff77ef','true','access.token.claim'),('42f25632-a9d0-4d9a-be5e-a145e4ff77ef','true','id.token.claim'),('42f25632-a9d0-4d9a-be5e-a145e4ff77ef','true','introspection.token.claim'),('4d6355e7-bd04-48ae-af8b-6becb19e364c','true','access.token.claim'),('4d6355e7-bd04-48ae-af8b-6becb19e364c','true','introspection.token.claim'),('50ec56c0-06f9-4b6b-95a7-36183b1d40ea','true','access.token.claim'),('50ec56c0-06f9-4b6b-95a7-36183b1d40ea','groups','claim.name'),('50ec56c0-06f9-4b6b-95a7-36183b1d40ea','true','id.token.claim'),('50ec56c0-06f9-4b6b-95a7-36183b1d40ea','true','introspection.token.claim'),('50ec56c0-06f9-4b6b-95a7-36183b1d40ea','String','jsonType.label'),('50ec56c0-06f9-4b6b-95a7-36183b1d40ea','true','multivalued'),('50ec56c0-06f9-4b6b-95a7-36183b1d40ea','foo','user.attribute'),('54d7f15a-1878-4538-b232-35e15a43366a','true','access.token.claim'),('54d7f15a-1878-4538-b232-35e15a43366a','email','claim.name'),('54d7f15a-1878-4538-b232-35e15a43366a','true','id.token.claim'),('54d7f15a-1878-4538-b232-35e15a43366a','true','introspection.token.claim'),('54d7f15a-1878-4538-b232-35e15a43366a','String','jsonType.label'),('54d7f15a-1878-4538-b232-35e15a43366a','email','user.attribute'),('54d7f15a-1878-4538-b232-35e15a43366a','true','userinfo.token.claim'),('5793edb1-e859-425a-915e-5491eb9eef8e','true','access.token.claim'),('5793edb1-e859-425a-915e-5491eb9eef8e','locale','claim.name'),('5793edb1-e859-425a-915e-5491eb9eef8e','true','id.token.claim'),('5793edb1-e859-425a-915e-5491eb9eef8e','true','introspection.token.claim'),('5793edb1-e859-425a-915e-5491eb9eef8e','String','jsonType.label'),('5793edb1-e859-425a-915e-5491eb9eef8e','locale','user.attribute'),('5793edb1-e859-425a-915e-5491eb9eef8e','true','userinfo.token.claim'),('57a57309-e0f7-4844-96af-f34d2488611b','true','access.token.claim'),('57a57309-e0f7-4844-96af-f34d2488611b','website','claim.name'),('57a57309-e0f7-4844-96af-f34d2488611b','true','id.token.claim'),('57a57309-e0f7-4844-96af-f34d2488611b','true','introspection.token.claim'),('57a57309-e0f7-4844-96af-f34d2488611b','String','jsonType.label'),('57a57309-e0f7-4844-96af-f34d2488611b','website','user.attribute'),('57a57309-e0f7-4844-96af-f34d2488611b','true','userinfo.token.claim'),('5d075ff1-fb0e-4d2e-8e5b-63906611ac2e','true','access.token.claim'),('5d075ff1-fb0e-4d2e-8e5b-63906611ac2e','middle_name','claim.name'),('5d075ff1-fb0e-4d2e-8e5b-63906611ac2e','true','id.token.claim'),('5d075ff1-fb0e-4d2e-8e5b-63906611ac2e','true','introspection.token.claim'),('5d075ff1-fb0e-4d2e-8e5b-63906611ac2e','String','jsonType.label'),('5d075ff1-fb0e-4d2e-8e5b-63906611ac2e','middleName','user.attribute'),('5d075ff1-fb0e-4d2e-8e5b-63906611ac2e','true','userinfo.token.claim'),('658e7c6c-deb3-46a9-85af-1e14f34fae31','true','access.token.claim'),('658e7c6c-deb3-46a9-85af-1e14f34fae31','gender','claim.name'),('658e7c6c-deb3-46a9-85af-1e14f34fae31','true','id.token.claim'),('658e7c6c-deb3-46a9-85af-1e14f34fae31','true','introspection.token.claim'),('658e7c6c-deb3-46a9-85af-1e14f34fae31','String','jsonType.label'),('658e7c6c-deb3-46a9-85af-1e14f34fae31','gender','user.attribute'),('658e7c6c-deb3-46a9-85af-1e14f34fae31','true','userinfo.token.claim'),('69185eb6-6b2b-41f9-a768-9726e3251700','true','access.token.claim'),('69185eb6-6b2b-41f9-a768-9726e3251700','updated_at','claim.name'),('69185eb6-6b2b-41f9-a768-9726e3251700','true','id.token.claim'),('69185eb6-6b2b-41f9-a768-9726e3251700','true','introspection.token.claim'),('69185eb6-6b2b-41f9-a768-9726e3251700','long','jsonType.label'),('69185eb6-6b2b-41f9-a768-9726e3251700','updatedAt','user.attribute'),('69185eb6-6b2b-41f9-a768-9726e3251700','true','userinfo.token.claim'),('6e10d560-54c2-460c-b738-de2a05217c21','true','access.token.claim'),('6e10d560-54c2-460c-b738-de2a05217c21','zoneinfo','claim.name'),('6e10d560-54c2-460c-b738-de2a05217c21','true','id.token.claim'),('6e10d560-54c2-460c-b738-de2a05217c21','true','introspection.token.claim'),('6e10d560-54c2-460c-b738-de2a05217c21','String','jsonType.label'),('6e10d560-54c2-460c-b738-de2a05217c21','zoneinfo','user.attribute'),('6e10d560-54c2-460c-b738-de2a05217c21','true','userinfo.token.claim'),('6e3faf27-6c15-43d6-9678-a880ccbb1133','true','access.token.claim'),('6e3faf27-6c15-43d6-9678-a880ccbb1133','groups','claim.name'),('6e3faf27-6c15-43d6-9678-a880ccbb1133','true','id.token.claim'),('6e3faf27-6c15-43d6-9678-a880ccbb1133','true','introspection.token.claim'),('6e3faf27-6c15-43d6-9678-a880ccbb1133','String','jsonType.label'),('6e3faf27-6c15-43d6-9678-a880ccbb1133','true','multivalued'),('6e3faf27-6c15-43d6-9678-a880ccbb1133','foo','user.attribute'),('72345c31-0963-4a3a-a2ac-2e6a7cbf2372','true','access.token.claim'),('72345c31-0963-4a3a-a2ac-2e6a7cbf2372','preferred_username','claim.name'),('72345c31-0963-4a3a-a2ac-2e6a7cbf2372','true','id.token.claim'),('72345c31-0963-4a3a-a2ac-2e6a7cbf2372','true','introspection.token.claim'),('72345c31-0963-4a3a-a2ac-2e6a7cbf2372','String','jsonType.label'),('72345c31-0963-4a3a-a2ac-2e6a7cbf2372','username','user.attribute'),('72345c31-0963-4a3a-a2ac-2e6a7cbf2372','true','userinfo.token.claim'),('7492b026-4d3d-4344-88b9-47e011a9373c','true','access.token.claim'),('7492b026-4d3d-4344-88b9-47e011a9373c','given_name','claim.name'),('7492b026-4d3d-4344-88b9-47e011a9373c','true','id.token.claim'),('7492b026-4d3d-4344-88b9-47e011a9373c','true','introspection.token.claim'),('7492b026-4d3d-4344-88b9-47e011a9373c','String','jsonType.label'),('7492b026-4d3d-4344-88b9-47e011a9373c','firstName','user.attribute'),('7492b026-4d3d-4344-88b9-47e011a9373c','true','userinfo.token.claim'),('79b5683d-f318-4eb0-8538-a14203dac0a1','true','access.token.claim'),('79b5683d-f318-4eb0-8538-a14203dac0a1','realm_access.roles','claim.name'),('79b5683d-f318-4eb0-8538-a14203dac0a1','true','introspection.token.claim'),('79b5683d-f318-4eb0-8538-a14203dac0a1','String','jsonType.label'),('79b5683d-f318-4eb0-8538-a14203dac0a1','true','multivalued'),('79b5683d-f318-4eb0-8538-a14203dac0a1','foo','user.attribute'),('81b109ae-f216-40e5-b93c-efec4a368b92','true','access.token.claim'),('81b109ae-f216-40e5-b93c-efec4a368b92','profile','claim.name'),('81b109ae-f216-40e5-b93c-efec4a368b92','true','id.token.claim'),('81b109ae-f216-40e5-b93c-efec4a368b92','true','introspection.token.claim'),('81b109ae-f216-40e5-b93c-efec4a368b92','String','jsonType.label'),('81b109ae-f216-40e5-b93c-efec4a368b92','profile','user.attribute'),('81b109ae-f216-40e5-b93c-efec4a368b92','true','userinfo.token.claim'),('84fb0a79-054a-433a-a962-b844a1ef7cc6','true','access.token.claim'),('84fb0a79-054a-433a-a962-b844a1ef7cc6','updated_at','claim.name'),('84fb0a79-054a-433a-a962-b844a1ef7cc6','true','id.token.claim'),('84fb0a79-054a-433a-a962-b844a1ef7cc6','true','introspection.token.claim'),('84fb0a79-054a-433a-a962-b844a1ef7cc6','long','jsonType.label'),('84fb0a79-054a-433a-a962-b844a1ef7cc6','updatedAt','user.attribute'),('84fb0a79-054a-433a-a962-b844a1ef7cc6','true','userinfo.token.claim'),('953e5018-b071-465b-8077-0838c10b4628','true','access.token.claim'),('953e5018-b071-465b-8077-0838c10b4628','locale','claim.name'),('953e5018-b071-465b-8077-0838c10b4628','true','id.token.claim'),('953e5018-b071-465b-8077-0838c10b4628','true','introspection.token.claim'),('953e5018-b071-465b-8077-0838c10b4628','String','jsonType.label'),('953e5018-b071-465b-8077-0838c10b4628','locale','user.attribute'),('953e5018-b071-465b-8077-0838c10b4628','true','userinfo.token.claim'),('98a38975-d1e3-40e5-ba9b-089a56b21130','true','access.token.claim'),('98a38975-d1e3-40e5-ba9b-089a56b21130','email_verified','claim.name'),('98a38975-d1e3-40e5-ba9b-089a56b21130','true','id.token.claim'),('98a38975-d1e3-40e5-ba9b-089a56b21130','true','introspection.token.claim'),('98a38975-d1e3-40e5-ba9b-089a56b21130','boolean','jsonType.label'),('98a38975-d1e3-40e5-ba9b-089a56b21130','emailVerified','user.attribute'),('98a38975-d1e3-40e5-ba9b-089a56b21130','true','userinfo.token.claim'),('a2e4f59f-9f22-4504-8747-25cd6f28a63b','true','access.token.claim'),('a2e4f59f-9f22-4504-8747-25cd6f28a63b','upn','claim.name'),('a2e4f59f-9f22-4504-8747-25cd6f28a63b','true','id.token.claim'),('a2e4f59f-9f22-4504-8747-25cd6f28a63b','true','introspection.token.claim'),('a2e4f59f-9f22-4504-8747-25cd6f28a63b','String','jsonType.label'),('a2e4f59f-9f22-4504-8747-25cd6f28a63b','username','user.attribute'),('a2e4f59f-9f22-4504-8747-25cd6f28a63b','true','userinfo.token.claim'),('a9846598-6b36-4405-ac96-de91c95184e8','true','access.token.claim'),('a9846598-6b36-4405-ac96-de91c95184e8','zoneinfo','claim.name'),('a9846598-6b36-4405-ac96-de91c95184e8','true','id.token.claim'),('a9846598-6b36-4405-ac96-de91c95184e8','true','introspection.token.claim'),('a9846598-6b36-4405-ac96-de91c95184e8','String','jsonType.label'),('a9846598-6b36-4405-ac96-de91c95184e8','zoneinfo','user.attribute'),('a9846598-6b36-4405-ac96-de91c95184e8','true','userinfo.token.claim'),('aa8ac134-d578-4171-9a29-e6484515e708','true','access.token.claim'),('aa8ac134-d578-4171-9a29-e6484515e708','gender','claim.name'),('aa8ac134-d578-4171-9a29-e6484515e708','true','id.token.claim'),('aa8ac134-d578-4171-9a29-e6484515e708','true','introspection.token.claim'),('aa8ac134-d578-4171-9a29-e6484515e708','String','jsonType.label'),('aa8ac134-d578-4171-9a29-e6484515e708','gender','user.attribute'),('aa8ac134-d578-4171-9a29-e6484515e708','true','userinfo.token.claim'),('ab50fbdf-8601-42ff-a466-cc710f1cacf9','true','access.token.claim'),('ab50fbdf-8601-42ff-a466-cc710f1cacf9','phone_number_verified','claim.name'),('ab50fbdf-8601-42ff-a466-cc710f1cacf9','true','id.token.claim'),('ab50fbdf-8601-42ff-a466-cc710f1cacf9','true','introspection.token.claim'),('ab50fbdf-8601-42ff-a466-cc710f1cacf9','boolean','jsonType.label'),('ab50fbdf-8601-42ff-a466-cc710f1cacf9','phoneNumberVerified','user.attribute'),('ab50fbdf-8601-42ff-a466-cc710f1cacf9','true','userinfo.token.claim'),('adc2f28c-f8ea-4732-8a12-53bb7e4a2610','true','access.token.claim'),('adc2f28c-f8ea-4732-8a12-53bb7e4a2610','resource_access.${client_id}.roles','claim.name'),('adc2f28c-f8ea-4732-8a12-53bb7e4a2610','true','introspection.token.claim'),('adc2f28c-f8ea-4732-8a12-53bb7e4a2610','String','jsonType.label'),('adc2f28c-f8ea-4732-8a12-53bb7e4a2610','true','multivalued'),('adc2f28c-f8ea-4732-8a12-53bb7e4a2610','foo','user.attribute'),('b64edc2a-1e43-4003-82c2-07a82e13b308','true','access.token.claim'),('b64edc2a-1e43-4003-82c2-07a82e13b308','clientHost','claim.name'),('b64edc2a-1e43-4003-82c2-07a82e13b308','true','id.token.claim'),('b64edc2a-1e43-4003-82c2-07a82e13b308','true','introspection.token.claim'),('b64edc2a-1e43-4003-82c2-07a82e13b308','String','jsonType.label'),('b64edc2a-1e43-4003-82c2-07a82e13b308','clientHost','user.session.note'),('bc28d6d1-88c8-49db-8611-9802e900b610','true','access.token.claim'),('bc28d6d1-88c8-49db-8611-9802e900b610','locale','claim.name'),('bc28d6d1-88c8-49db-8611-9802e900b610','true','id.token.claim'),('bc28d6d1-88c8-49db-8611-9802e900b610','true','introspection.token.claim'),('bc28d6d1-88c8-49db-8611-9802e900b610','String','jsonType.label'),('bc28d6d1-88c8-49db-8611-9802e900b610','locale','user.attribute'),('bc28d6d1-88c8-49db-8611-9802e900b610','true','userinfo.token.claim'),('beb4855f-5e7f-4b94-98a7-bbeb1e3679e9','true','access.token.claim'),('beb4855f-5e7f-4b94-98a7-bbeb1e3679e9','phone_number_verified','claim.name'),('beb4855f-5e7f-4b94-98a7-bbeb1e3679e9','true','id.token.claim'),('beb4855f-5e7f-4b94-98a7-bbeb1e3679e9','true','introspection.token.claim'),('beb4855f-5e7f-4b94-98a7-bbeb1e3679e9','boolean','jsonType.label'),('beb4855f-5e7f-4b94-98a7-bbeb1e3679e9','phoneNumberVerified','user.attribute'),('beb4855f-5e7f-4b94-98a7-bbeb1e3679e9','true','userinfo.token.claim'),('bf0f3697-82a1-4893-ac82-58453276a819','true','access.token.claim'),('bf0f3697-82a1-4893-ac82-58453276a819','realm_access.roles','claim.name'),('bf0f3697-82a1-4893-ac82-58453276a819','true','introspection.token.claim'),('bf0f3697-82a1-4893-ac82-58453276a819','String','jsonType.label'),('bf0f3697-82a1-4893-ac82-58453276a819','true','multivalued'),('bf0f3697-82a1-4893-ac82-58453276a819','foo','user.attribute'),('cd9d76a5-450e-4008-89c7-c1cabb728dd7','true','access.token.claim'),('cd9d76a5-450e-4008-89c7-c1cabb728dd7','picture','claim.name'),('cd9d76a5-450e-4008-89c7-c1cabb728dd7','true','id.token.claim'),('cd9d76a5-450e-4008-89c7-c1cabb728dd7','true','introspection.token.claim'),('cd9d76a5-450e-4008-89c7-c1cabb728dd7','String','jsonType.label'),('cd9d76a5-450e-4008-89c7-c1cabb728dd7','picture','user.attribute'),('cd9d76a5-450e-4008-89c7-c1cabb728dd7','true','userinfo.token.claim'),('d7bcc35d-1459-481f-ac13-de8e11007d26','true','access.token.claim'),('d7bcc35d-1459-481f-ac13-de8e11007d26','upn','claim.name'),('d7bcc35d-1459-481f-ac13-de8e11007d26','true','id.token.claim'),('d7bcc35d-1459-481f-ac13-de8e11007d26','true','introspection.token.claim'),('d7bcc35d-1459-481f-ac13-de8e11007d26','String','jsonType.label'),('d7bcc35d-1459-481f-ac13-de8e11007d26','username','user.attribute'),('d7bcc35d-1459-481f-ac13-de8e11007d26','true','userinfo.token.claim'),('d8a2ba30-e156-4e36-8746-48bad0088fdf','true','access.token.claim'),('d8a2ba30-e156-4e36-8746-48bad0088fdf','phone_number','claim.name'),('d8a2ba30-e156-4e36-8746-48bad0088fdf','true','id.token.claim'),('d8a2ba30-e156-4e36-8746-48bad0088fdf','true','introspection.token.claim'),('d8a2ba30-e156-4e36-8746-48bad0088fdf','String','jsonType.label'),('d8a2ba30-e156-4e36-8746-48bad0088fdf','phoneNumber','user.attribute'),('d8a2ba30-e156-4e36-8746-48bad0088fdf','true','userinfo.token.claim'),('d8f757e0-7285-4326-b126-a9a96cd57a2d','Role','attribute.name'),('d8f757e0-7285-4326-b126-a9a96cd57a2d','Basic','attribute.nameformat'),('d8f757e0-7285-4326-b126-a9a96cd57a2d','false','single'),('df7da0f5-dcf8-4d98-abb7-56e19dd8fa08','true','access.token.claim'),('df7da0f5-dcf8-4d98-abb7-56e19dd8fa08','true','id.token.claim'),('df7da0f5-dcf8-4d98-abb7-56e19dd8fa08','true','introspection.token.claim'),('df7da0f5-dcf8-4d98-abb7-56e19dd8fa08','true','userinfo.token.claim'),('e27daaad-7698-4c53-9f6b-fd3646a3e86c','true','access.token.claim'),('e27daaad-7698-4c53-9f6b-fd3646a3e86c','birthdate','claim.name'),('e27daaad-7698-4c53-9f6b-fd3646a3e86c','true','id.token.claim'),('e27daaad-7698-4c53-9f6b-fd3646a3e86c','true','introspection.token.claim'),('e27daaad-7698-4c53-9f6b-fd3646a3e86c','String','jsonType.label'),('e27daaad-7698-4c53-9f6b-fd3646a3e86c','birthdate','user.attribute'),('e27daaad-7698-4c53-9f6b-fd3646a3e86c','true','userinfo.token.claim'),('e33e7ecc-64c6-4022-89e2-b0ebd919432f','true','access.token.claim'),('e33e7ecc-64c6-4022-89e2-b0ebd919432f','clientAddress','claim.name'),('e33e7ecc-64c6-4022-89e2-b0ebd919432f','true','id.token.claim'),('e33e7ecc-64c6-4022-89e2-b0ebd919432f','true','introspection.token.claim'),('e33e7ecc-64c6-4022-89e2-b0ebd919432f','String','jsonType.label'),('e33e7ecc-64c6-4022-89e2-b0ebd919432f','clientAddress','user.session.note'),('e7d12bd9-1cd7-4903-bfff-70d3bebd8e95','true','access.token.claim'),('e7d12bd9-1cd7-4903-bfff-70d3bebd8e95','true','id.token.claim'),('e7d12bd9-1cd7-4903-bfff-70d3bebd8e95','true','introspection.token.claim'),('e7d12bd9-1cd7-4903-bfff-70d3bebd8e95','true','userinfo.token.claim'),('ea285c80-8d5b-4af9-bbe6-9857a46d9917','true','access.token.claim'),('ea285c80-8d5b-4af9-bbe6-9857a46d9917','true','introspection.token.claim'),('f0f10102-d3f4-4456-b1b7-8b8f8df1b14c','true','access.token.claim'),('f0f10102-d3f4-4456-b1b7-8b8f8df1b14c','true','introspection.token.claim'),('f3c238b4-6116-4c2d-9e93-e2521702dbfc','true','access.token.claim'),('f3c238b4-6116-4c2d-9e93-e2521702dbfc','preferred_username','claim.name'),('f3c238b4-6116-4c2d-9e93-e2521702dbfc','true','id.token.claim'),('f3c238b4-6116-4c2d-9e93-e2521702dbfc','true','introspection.token.claim'),('f3c238b4-6116-4c2d-9e93-e2521702dbfc','String','jsonType.label'),('f3c238b4-6116-4c2d-9e93-e2521702dbfc','username','user.attribute'),('f3c238b4-6116-4c2d-9e93-e2521702dbfc','true','userinfo.token.claim'),('f5ad2d68-4e74-459e-b1e9-f6e19a396a76','true','access.token.claim'),('f5ad2d68-4e74-459e-b1e9-f6e19a396a76','website','claim.name'),('f5ad2d68-4e74-459e-b1e9-f6e19a396a76','true','id.token.claim'),('f5ad2d68-4e74-459e-b1e9-f6e19a396a76','true','introspection.token.claim'),('f5ad2d68-4e74-459e-b1e9-f6e19a396a76','String','jsonType.label'),('f5ad2d68-4e74-459e-b1e9-f6e19a396a76','website','user.attribute'),('f5ad2d68-4e74-459e-b1e9-f6e19a396a76','true','userinfo.token.claim'),('f6754be9-cf5b-48ff-b170-e33c3743763c','true','access.token.claim'),('f6754be9-cf5b-48ff-b170-e33c3743763c','profile','claim.name'),('f6754be9-cf5b-48ff-b170-e33c3743763c','true','id.token.claim'),('f6754be9-cf5b-48ff-b170-e33c3743763c','true','introspection.token.claim'),('f6754be9-cf5b-48ff-b170-e33c3743763c','String','jsonType.label'),('f6754be9-cf5b-48ff-b170-e33c3743763c','profile','user.attribute'),('f6754be9-cf5b-48ff-b170-e33c3743763c','true','userinfo.token.claim');
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
INSERT INTO `REALM` VALUES ('1a95a13f-0349-431c-878d-063e1ab2b03b',60,300,300,NULL,NULL,NULL,1,0,0,NULL,'ou-graduation-realm',0,NULL,0,0,0,0,'EXTERNAL',1800,36000,0,0,'40ae120f-9d1d-4585-ac43-052e0c0d1667',1800,0,NULL,0,0,0,0,0,1,30,6,'HmacSHA1','totp','995154e6-6b4a-46b5-8884-fcffb4523e95','d313a32e-4ff3-4f64-9432-66ead03ba97b','30f2e0fd-434b-4e50-85a8-eb99474defb1','c485c2d1-168b-4fb9-abc4-1b29abd1afeb','77c2702b-0472-4310-94d3-1da323405206',2592000,0,900,1,0,'3d726ff4-ee58-467f-aefe-e188c9bc32ce',0,0,0,0,'fc556831-ed76-426c-8e20-70fb73c30e01'),('818b284a-a54c-4c96-a9d0-bb89323c0677',60,300,60,NULL,NULL,NULL,1,0,0,NULL,'master',0,NULL,0,0,0,0,'EXTERNAL',1800,36000,0,0,'2cd8fad4-80b6-4d23-87b4-12861f29edc6',1800,0,NULL,0,0,0,0,0,1,30,6,'HmacSHA1','totp','134c7abc-4573-4ab6-8a5f-f51d5ad71c87','90c627fe-8f7b-4bd0-8308-6f7f179302a4','1ca188dc-88cb-4e42-b95c-b5717d34db83','0b78a1e8-0951-49d9-a7d1-26ff847ded3f','29543e96-2285-4bb7-87bb-9fe309d83e3a',2592000,0,900,1,0,'3a39e82a-e234-4cf6-b92a-af0d1aee9aad',0,0,0,0,'c173f43d-fd84-440a-878c-ccfbc635807d');
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
INSERT INTO `REALM_ATTRIBUTE` VALUES ('_browser_header.contentSecurityPolicy','1a95a13f-0349-431c-878d-063e1ab2b03b','frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';'),('_browser_header.contentSecurityPolicy','818b284a-a54c-4c96-a9d0-bb89323c0677','frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';'),('_browser_header.contentSecurityPolicyReportOnly','1a95a13f-0349-431c-878d-063e1ab2b03b',''),('_browser_header.contentSecurityPolicyReportOnly','818b284a-a54c-4c96-a9d0-bb89323c0677',''),('_browser_header.referrerPolicy','1a95a13f-0349-431c-878d-063e1ab2b03b','no-referrer'),('_browser_header.referrerPolicy','818b284a-a54c-4c96-a9d0-bb89323c0677','no-referrer'),('_browser_header.strictTransportSecurity','1a95a13f-0349-431c-878d-063e1ab2b03b','max-age=31536000; includeSubDomains'),('_browser_header.strictTransportSecurity','818b284a-a54c-4c96-a9d0-bb89323c0677','max-age=31536000; includeSubDomains'),('_browser_header.xContentTypeOptions','1a95a13f-0349-431c-878d-063e1ab2b03b','nosniff'),('_browser_header.xContentTypeOptions','818b284a-a54c-4c96-a9d0-bb89323c0677','nosniff'),('_browser_header.xFrameOptions','1a95a13f-0349-431c-878d-063e1ab2b03b','SAMEORIGIN'),('_browser_header.xFrameOptions','818b284a-a54c-4c96-a9d0-bb89323c0677','SAMEORIGIN'),('_browser_header.xRobotsTag','1a95a13f-0349-431c-878d-063e1ab2b03b','none'),('_browser_header.xRobotsTag','818b284a-a54c-4c96-a9d0-bb89323c0677','none'),('_browser_header.xXSSProtection','1a95a13f-0349-431c-878d-063e1ab2b03b','1; mode=block'),('_browser_header.xXSSProtection','818b284a-a54c-4c96-a9d0-bb89323c0677','1; mode=block'),('acr.loa.map','1a95a13f-0349-431c-878d-063e1ab2b03b','{}'),('actionTokenGeneratedByAdminLifespan','1a95a13f-0349-431c-878d-063e1ab2b03b','43200'),('actionTokenGeneratedByUserLifespan','1a95a13f-0349-431c-878d-063e1ab2b03b','300'),('bruteForceProtected','1a95a13f-0349-431c-878d-063e1ab2b03b','false'),('bruteForceProtected','818b284a-a54c-4c96-a9d0-bb89323c0677','false'),('cibaAuthRequestedUserHint','1a95a13f-0349-431c-878d-063e1ab2b03b','login_hint'),('cibaBackchannelTokenDeliveryMode','1a95a13f-0349-431c-878d-063e1ab2b03b','poll'),('cibaExpiresIn','1a95a13f-0349-431c-878d-063e1ab2b03b','120'),('cibaInterval','1a95a13f-0349-431c-878d-063e1ab2b03b','5'),('client-policies.policies','1a95a13f-0349-431c-878d-063e1ab2b03b','{\"policies\":[]}'),('client-policies.profiles','1a95a13f-0349-431c-878d-063e1ab2b03b','{\"profiles\":[]}'),('clientOfflineSessionIdleTimeout','1a95a13f-0349-431c-878d-063e1ab2b03b','0'),('clientOfflineSessionMaxLifespan','1a95a13f-0349-431c-878d-063e1ab2b03b','0'),('clientSessionIdleTimeout','1a95a13f-0349-431c-878d-063e1ab2b03b','0'),('clientSessionMaxLifespan','1a95a13f-0349-431c-878d-063e1ab2b03b','0'),('defaultSignatureAlgorithm','1a95a13f-0349-431c-878d-063e1ab2b03b','RS256'),('defaultSignatureAlgorithm','818b284a-a54c-4c96-a9d0-bb89323c0677','RS256'),('displayName','1a95a13f-0349-431c-878d-063e1ab2b03b','OU Graduation Realm'),('displayName','818b284a-a54c-4c96-a9d0-bb89323c0677','Keycloak'),('displayNameHtml','1a95a13f-0349-431c-878d-063e1ab2b03b','OU Graduation Realm'),('displayNameHtml','818b284a-a54c-4c96-a9d0-bb89323c0677','<div class=\"kc-logo-text\"><span>Keycloak</span></div>'),('failureFactor','1a95a13f-0349-431c-878d-063e1ab2b03b','30'),('failureFactor','818b284a-a54c-4c96-a9d0-bb89323c0677','30'),('firstBrokerLoginFlowId','1a95a13f-0349-431c-878d-063e1ab2b03b','9544a5d2-3555-4100-b02b-f53aab9be7d8'),('firstBrokerLoginFlowId','818b284a-a54c-4c96-a9d0-bb89323c0677','bf10cd21-1cf2-4bb5-b477-5ac822797088'),('frontendUrl','1a95a13f-0349-431c-878d-063e1ab2b03b',''),('maxDeltaTimeSeconds','1a95a13f-0349-431c-878d-063e1ab2b03b','43200'),('maxDeltaTimeSeconds','818b284a-a54c-4c96-a9d0-bb89323c0677','43200'),('maxFailureWaitSeconds','1a95a13f-0349-431c-878d-063e1ab2b03b','900'),('maxFailureWaitSeconds','818b284a-a54c-4c96-a9d0-bb89323c0677','900'),('maxTemporaryLockouts','1a95a13f-0349-431c-878d-063e1ab2b03b','0'),('maxTemporaryLockouts','818b284a-a54c-4c96-a9d0-bb89323c0677','0'),('minimumQuickLoginWaitSeconds','1a95a13f-0349-431c-878d-063e1ab2b03b','60'),('minimumQuickLoginWaitSeconds','818b284a-a54c-4c96-a9d0-bb89323c0677','60'),('oauth2DeviceCodeLifespan','1a95a13f-0349-431c-878d-063e1ab2b03b','600'),('oauth2DevicePollingInterval','1a95a13f-0349-431c-878d-063e1ab2b03b','5'),('offlineSessionMaxLifespan','1a95a13f-0349-431c-878d-063e1ab2b03b','5184000'),('offlineSessionMaxLifespan','818b284a-a54c-4c96-a9d0-bb89323c0677','5184000'),('offlineSessionMaxLifespanEnabled','1a95a13f-0349-431c-878d-063e1ab2b03b','false'),('offlineSessionMaxLifespanEnabled','818b284a-a54c-4c96-a9d0-bb89323c0677','false'),('parRequestUriLifespan','1a95a13f-0349-431c-878d-063e1ab2b03b','60'),('permanentLockout','1a95a13f-0349-431c-878d-063e1ab2b03b','false'),('permanentLockout','818b284a-a54c-4c96-a9d0-bb89323c0677','false'),('quickLoginCheckMilliSeconds','1a95a13f-0349-431c-878d-063e1ab2b03b','1000'),('quickLoginCheckMilliSeconds','818b284a-a54c-4c96-a9d0-bb89323c0677','1000'),('realmReusableOtpCode','1a95a13f-0349-431c-878d-063e1ab2b03b','false'),('realmReusableOtpCode','818b284a-a54c-4c96-a9d0-bb89323c0677','false'),('waitIncrementSeconds','1a95a13f-0349-431c-878d-063e1ab2b03b','60'),('waitIncrementSeconds','818b284a-a54c-4c96-a9d0-bb89323c0677','60'),('webAuthnPolicyAttestationConveyancePreference','1a95a13f-0349-431c-878d-063e1ab2b03b','not specified'),('webAuthnPolicyAttestationConveyancePreferencePasswordless','1a95a13f-0349-431c-878d-063e1ab2b03b','not specified'),('webAuthnPolicyAuthenticatorAttachment','1a95a13f-0349-431c-878d-063e1ab2b03b','not specified'),('webAuthnPolicyAuthenticatorAttachmentPasswordless','1a95a13f-0349-431c-878d-063e1ab2b03b','not specified'),('webAuthnPolicyAvoidSameAuthenticatorRegister','1a95a13f-0349-431c-878d-063e1ab2b03b','false'),('webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless','1a95a13f-0349-431c-878d-063e1ab2b03b','false'),('webAuthnPolicyCreateTimeout','1a95a13f-0349-431c-878d-063e1ab2b03b','0'),('webAuthnPolicyCreateTimeoutPasswordless','1a95a13f-0349-431c-878d-063e1ab2b03b','0'),('webAuthnPolicyRequireResidentKey','1a95a13f-0349-431c-878d-063e1ab2b03b','not specified'),('webAuthnPolicyRequireResidentKeyPasswordless','1a95a13f-0349-431c-878d-063e1ab2b03b','not specified'),('webAuthnPolicyRpEntityName','1a95a13f-0349-431c-878d-063e1ab2b03b','keycloak'),('webAuthnPolicyRpEntityNamePasswordless','1a95a13f-0349-431c-878d-063e1ab2b03b','keycloak'),('webAuthnPolicyRpId','1a95a13f-0349-431c-878d-063e1ab2b03b',''),('webAuthnPolicyRpIdPasswordless','1a95a13f-0349-431c-878d-063e1ab2b03b',''),('webAuthnPolicySignatureAlgorithms','1a95a13f-0349-431c-878d-063e1ab2b03b','ES256'),('webAuthnPolicySignatureAlgorithmsPasswordless','1a95a13f-0349-431c-878d-063e1ab2b03b','ES256'),('webAuthnPolicyUserVerificationRequirement','1a95a13f-0349-431c-878d-063e1ab2b03b','not specified'),('webAuthnPolicyUserVerificationRequirementPasswordless','1a95a13f-0349-431c-878d-063e1ab2b03b','not specified');
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
INSERT INTO `REALM_EVENTS_LISTENERS` VALUES ('1a95a13f-0349-431c-878d-063e1ab2b03b','jboss-logging'),('818b284a-a54c-4c96-a9d0-bb89323c0677','jboss-logging');
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
INSERT INTO `REALM_REQUIRED_CREDENTIAL` VALUES ('password','password',1,1,'1a95a13f-0349-431c-878d-063e1ab2b03b'),('password','password',1,1,'818b284a-a54c-4c96-a9d0-bb89323c0677');
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
INSERT INTO `REDIRECT_URIS` VALUES ('05b9931f-0ca3-4fcd-97c0-9fab2d2344fb','/realms/ou-graduation-realm/account/*'),('88461b68-c1c9-4f07-971a-81fdf4d087e5','/realms/master/account/*'),('b5668e36-56c8-436a-b767-eafb09b8a77e','/admin/master/console/*'),('ba4a9551-9e5c-4610-88e9-11a09c8d4307','/admin/ou-graduation-realm/console/*'),('bccba2a3-e060-4ae3-8279-2bb9695af129','/*'),('e05b9cae-aa75-426c-a7b6-bba768e8fa6e','/realms/ou-graduation-realm/account/*'),('edc5ffa7-7c0d-4e4a-bccb-ead45ac8a057','/realms/master/account/*');
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
INSERT INTO `REQUIRED_ACTION_PROVIDER` VALUES ('0854461c-150e-4fbc-8d40-939c1f58c1eb','TERMS_AND_CONDITIONS','Terms and Conditions','818b284a-a54c-4c96-a9d0-bb89323c0677',0,0,'TERMS_AND_CONDITIONS',20),('13dfb348-2e3c-495d-8a88-b15d8eb6b6b6','CONFIGURE_TOTP','Configure OTP','818b284a-a54c-4c96-a9d0-bb89323c0677',1,0,'CONFIGURE_TOTP',10),('16d05a97-d58c-4583-9c34-01149243b149','VERIFY_EMAIL','Verify Email','818b284a-a54c-4c96-a9d0-bb89323c0677',1,0,'VERIFY_EMAIL',50),('54546f4f-595d-48e2-a557-bd7cd2b3de16','VERIFY_EMAIL','Verify Email','1a95a13f-0349-431c-878d-063e1ab2b03b',1,0,'VERIFY_EMAIL',50),('60100c0a-9114-4ccc-9fab-baa5b8a87995','delete_account','Delete Account','818b284a-a54c-4c96-a9d0-bb89323c0677',0,0,'delete_account',60),('64993f5d-5ba3-4cf1-b445-1fd01542d2d4','UPDATE_PROFILE','Update Profile','818b284a-a54c-4c96-a9d0-bb89323c0677',1,0,'UPDATE_PROFILE',40),('698b886e-647b-4174-803f-4ceb29bb73e3','webauthn-register-passwordless','Webauthn Register Passwordless','818b284a-a54c-4c96-a9d0-bb89323c0677',1,0,'webauthn-register-passwordless',80),('6d0233d3-7682-4722-bd4f-1a47d147ecd0','update_user_locale','Update User Locale','1a95a13f-0349-431c-878d-063e1ab2b03b',1,0,'update_user_locale',1000),('74061db0-2a6b-46d9-9e9c-0e0079d8dd7a','webauthn-register-passwordless','Webauthn Register Passwordless','1a95a13f-0349-431c-878d-063e1ab2b03b',1,0,'webauthn-register-passwordless',80),('77e3d691-f397-48f2-8e5a-5d10c57e6744','webauthn-register','Webauthn Register','818b284a-a54c-4c96-a9d0-bb89323c0677',1,0,'webauthn-register',70),('8000ad58-0b1e-4888-b3e2-79a8d7538562','UPDATE_PASSWORD','Update Password','1a95a13f-0349-431c-878d-063e1ab2b03b',1,0,'UPDATE_PASSWORD',30),('811509b6-fd3c-40f5-b3fe-4c12000b02c0','CONFIGURE_TOTP','Configure OTP','1a95a13f-0349-431c-878d-063e1ab2b03b',1,0,'CONFIGURE_TOTP',10),('8a06a60e-f896-4a20-80f6-96f0c11256a6','UPDATE_PASSWORD','Update Password','818b284a-a54c-4c96-a9d0-bb89323c0677',1,0,'UPDATE_PASSWORD',30),('8d68991a-d24d-4811-a6ac-be5789bcf223','update_user_locale','Update User Locale','818b284a-a54c-4c96-a9d0-bb89323c0677',1,0,'update_user_locale',1000),('97edc445-ce40-4e7f-a758-b78328cac454','VERIFY_PROFILE','Verify Profile','818b284a-a54c-4c96-a9d0-bb89323c0677',1,0,'VERIFY_PROFILE',90),('9974f4ab-eede-4aa9-a8bb-d9e5f40a2760','VERIFY_PROFILE','Verify Profile','1a95a13f-0349-431c-878d-063e1ab2b03b',1,0,'VERIFY_PROFILE',90),('a9471432-4cbf-49ca-a96a-49085677d184','delete_account','Delete Account','1a95a13f-0349-431c-878d-063e1ab2b03b',0,0,'delete_account',60),('b4ad740e-177d-4bf0-b6fd-0cbe7e2aa74c','webauthn-register','Webauthn Register','1a95a13f-0349-431c-878d-063e1ab2b03b',1,0,'webauthn-register',70),('bb8fee4c-7293-4845-8ebc-11541fdd9f5a','UPDATE_PROFILE','Update Profile','1a95a13f-0349-431c-878d-063e1ab2b03b',1,0,'UPDATE_PROFILE',40),('c0e81409-c750-4e82-8175-eff12f9def91','TERMS_AND_CONDITIONS','Terms and Conditions','1a95a13f-0349-431c-878d-063e1ab2b03b',0,0,'TERMS_AND_CONDITIONS',20);
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
INSERT INTO `RESOURCE_SERVER` VALUES ('bccba2a3-e060-4ae3-8279-2bb9695af129',1,0,1);
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
INSERT INTO `RESOURCE_SERVER_POLICY` VALUES ('0e330c02-df22-46a9-a914-1300cfeeeb74','Default Permission','A permission that applies to the default resource type','resource',1,0,'bccba2a3-e060-4ae3-8279-2bb9695af129',NULL),('4c5146d8-4451-49cb-b0c5-32e16289c485','Default Policy','A policy that grants access only for users within this realm','js',0,0,'bccba2a3-e060-4ae3-8279-2bb9695af129',NULL);
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
INSERT INTO `RESOURCE_SERVER_RESOURCE` VALUES ('bfc8debf-34a1-4135-b7c6-e5e4f152a86d','Default Resource','urn:ou-graduation-client:resources:default',NULL,'bccba2a3-e060-4ae3-8279-2bb9695af129','bccba2a3-e060-4ae3-8279-2bb9695af129',0,NULL);
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
INSERT INTO `RESOURCE_URIS` VALUES ('bfc8debf-34a1-4135-b7c6-e5e4f152a86d','/*');
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
INSERT INTO `SCOPE_MAPPING` VALUES ('05b9931f-0ca3-4fcd-97c0-9fab2d2344fb','33fffa5b-4422-477c-a180-484be1584547'),('88461b68-c1c9-4f07-971a-81fdf4d087e5','489d46f0-cfc5-40c4-ae2e-f5ce512b6135'),('05b9931f-0ca3-4fcd-97c0-9fab2d2344fb','a337fc2f-99e5-48a1-883c-d47d663e6460'),('88461b68-c1c9-4f07-971a-81fdf4d087e5','b3d0b536-6940-40b7-aff6-48d644c1e609');
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
INSERT INTO `USER_ENTITY` VALUES ('5b04765f-464a-455e-9adf-202cb9f272f0','2051012004anh@ou.edu.vn','2051012004anh@ou.edu.vn',1,1,NULL,'Anh','Nguyễn Vân','1a95a13f-0349-431c-878d-063e1ab2b03b','2051012004',1711619875921,NULL,0),('7e80c447-3fed-47c4-873c-0c786126560d','admin@gmail.com','admin@gmail.com',1,1,NULL,'Admin','Super','1a95a13f-0349-431c-878d-063e1ab2b03b','admin',1711620201929,NULL,0),('b31d1b22-a569-4bc0-94cd-ef1229bb70c9',NULL,'9fe40ac3-79b7-42ba-a519-1d090f464b7f',0,1,NULL,NULL,NULL,'818b284a-a54c-4c96-a9d0-bb89323c0677','admin',1711619731857,NULL,0),('bf506d11-1ec5-4512-bb86-c17ba2eaf215','2051012054linh@ou.edu.vn','2051012054linh@ou.edu.vn',1,1,NULL,'Linh','Vũ Nguyễn Mai','1a95a13f-0349-431c-878d-063e1ab2b03b','2051012054',1711619938732,NULL,0),('ea69ece4-2bb6-4aab-ab50-f13282bebc83',NULL,'dea473a2-5412-4dec-9074-6aee4ab2d0b8',0,1,NULL,NULL,NULL,'1a95a13f-0349-431c-878d-063e1ab2b03b','service-account-ou-graduation-client',1711619815361,'bccba2a3-e060-4ae3-8279-2bb9695af129',0);
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
INSERT INTO `USER_ROLE_MAPPING` VALUES ('72d224c4-bf7b-4b35-a31f-5c71d8166b8c','5b04765f-464a-455e-9adf-202cb9f272f0'),('fc556831-ed76-426c-8e20-70fb73c30e01','5b04765f-464a-455e-9adf-202cb9f272f0'),('a5b63435-83d9-4835-a6d1-1568d758bbbf','7e80c447-3fed-47c4-873c-0c786126560d'),('fc556831-ed76-426c-8e20-70fb73c30e01','7e80c447-3fed-47c4-873c-0c786126560d'),('fcf20bee-a2a2-4cc4-b7a0-2bf433218172','7e80c447-3fed-47c4-873c-0c786126560d'),('01deb553-e291-4def-b6fb-2874086fa68a','b31d1b22-a569-4bc0-94cd-ef1229bb70c9'),('33692cfa-a32c-4c9c-967e-37e5822f900a','b31d1b22-a569-4bc0-94cd-ef1229bb70c9'),('351fcd63-0f99-4390-b851-028be52f772d','b31d1b22-a569-4bc0-94cd-ef1229bb70c9'),('3744f6b3-6e3f-45b8-95a4-cbb5d556005b','b31d1b22-a569-4bc0-94cd-ef1229bb70c9'),('54ea98e2-d82c-4b24-8cc5-9d2671d4ee2b','b31d1b22-a569-4bc0-94cd-ef1229bb70c9'),('5727bd91-e1ab-48a8-83d7-4f6e550c2ccd','b31d1b22-a569-4bc0-94cd-ef1229bb70c9'),('720859fa-ff51-4581-9789-62f363e32aa3','b31d1b22-a569-4bc0-94cd-ef1229bb70c9'),('7a31bb3f-b659-4058-8744-b1c6c9f79508','b31d1b22-a569-4bc0-94cd-ef1229bb70c9'),('80211bc4-928d-4b3e-8ef3-f6b9c0b6ffb1','b31d1b22-a569-4bc0-94cd-ef1229bb70c9'),('921b18ba-480a-461f-a4d2-901b35def037','b31d1b22-a569-4bc0-94cd-ef1229bb70c9'),('a265f25b-acc4-4b4a-9965-9b3abb7e182d','b31d1b22-a569-4bc0-94cd-ef1229bb70c9'),('a6833a4d-ebcc-4c73-b167-9798746933ef','b31d1b22-a569-4bc0-94cd-ef1229bb70c9'),('bc4e3f40-8e86-47b3-9bcc-3628cc8db42e','b31d1b22-a569-4bc0-94cd-ef1229bb70c9'),('c15e6d78-0435-43eb-a3a6-affec75f09f4','b31d1b22-a569-4bc0-94cd-ef1229bb70c9'),('c173f43d-fd84-440a-878c-ccfbc635807d','b31d1b22-a569-4bc0-94cd-ef1229bb70c9'),('d64c7a31-ab1d-4895-9749-9ccf1c8d60be','b31d1b22-a569-4bc0-94cd-ef1229bb70c9'),('e785566e-6ec6-4709-84ad-7332802ee4e8','b31d1b22-a569-4bc0-94cd-ef1229bb70c9'),('ef3404a3-5146-4049-8c80-aef84fb2487c','b31d1b22-a569-4bc0-94cd-ef1229bb70c9'),('f5287a81-3999-45c7-b018-b849e77c9cd4','b31d1b22-a569-4bc0-94cd-ef1229bb70c9'),('72d224c4-bf7b-4b35-a31f-5c71d8166b8c','bf506d11-1ec5-4512-bb86-c17ba2eaf215'),('fc556831-ed76-426c-8e20-70fb73c30e01','bf506d11-1ec5-4512-bb86-c17ba2eaf215'),('9b0f9149-6648-49cb-a95b-be30ba993b36','ea69ece4-2bb6-4aab-ab50-f13282bebc83'),('fc556831-ed76-426c-8e20-70fb73c30e01','ea69ece4-2bb6-4aab-ab50-f13282bebc83');
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
INSERT INTO `WEB_ORIGINS` VALUES ('b5668e36-56c8-436a-b767-eafb09b8a77e','+'),('ba4a9551-9e5c-4610-88e9-11a09c8d4307','+'),('bccba2a3-e060-4ae3-8279-2bb9695af129','/*');
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

-- Dump completed on 2024-03-28 17:07:01
