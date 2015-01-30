-- MySQL dump 10.13  Distrib 5.5.40, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: craft
-- ------------------------------------------------------
-- Server version	5.5.40-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `craft_assetfiles`
--

DROP TABLE IF EXISTS `craft_assetfiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_assetfiles` (
  `id` int(11) NOT NULL,
  `sourceId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `kind` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `width` smallint(6) unsigned DEFAULT NULL,
  `height` smallint(6) unsigned DEFAULT NULL,
  `size` int(11) unsigned DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_assetfiles_filename_folderId_unq_idx` (`filename`,`folderId`),
  KEY `craft_assetfiles_sourceId_fk` (`sourceId`),
  KEY `craft_assetfiles_folderId_fk` (`folderId`),
  CONSTRAINT `craft_assetfiles_folderId_fk` FOREIGN KEY (`folderId`) REFERENCES `craft_assetfolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_assetfiles_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_assetfiles_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `craft_assetsources` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_assetfiles`
--

LOCK TABLES `craft_assetfiles` WRITE;
/*!40000 ALTER TABLE `craft_assetfiles` DISABLE KEYS */;
INSERT INTO `craft_assetfiles` VALUES (6,1,1,'index-image.png','image',1600,1070,1382204,'2014-12-31 15:23:50','2014-12-31 15:24:30','2014-12-31 15:24:30','3e806a13-713c-4060-88e0-9ff366b3b3ea'),(9,1,1,'company.jpg','image',1500,1001,1105966,'2014-12-31 16:18:32','2014-12-31 16:18:32','2014-12-31 16:18:32','fa6c24a8-81ee-4601-8976-070ff2f337c7'),(13,1,1,'6260730214_61c9e39a45_b.jpg','image',1024,683,262386,'2014-12-31 21:07:15','2014-12-31 21:07:15','2014-12-31 21:07:15','b487d892-fd19-4b95-bb7b-83c51b91762b'),(15,1,1,'map-austria.png','image',1333,1066,462393,'2015-01-01 11:04:16','2015-01-01 11:04:19','2015-01-01 11:04:19','c21868aa-7b70-4cc3-ae33-cb9919f9e658'),(17,1,1,'128.jpg','image',128,128,4941,'2015-01-01 11:14:29','2015-01-01 11:14:30','2015-01-01 11:14:30','c7c0ecaa-b68d-45f2-9400-2a89f1818a6e');
/*!40000 ALTER TABLE `craft_assetfiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_assetfolders`
--

DROP TABLE IF EXISTS `craft_assetfolders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_assetfolders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL,
  `sourceId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_assetfolders_name_parentId_sourceId_unq_idx` (`name`,`parentId`,`sourceId`),
  KEY `craft_assetfolders_parentId_fk` (`parentId`),
  KEY `craft_assetfolders_sourceId_fk` (`sourceId`),
  CONSTRAINT `craft_assetfolders_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `craft_assetfolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_assetfolders_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `craft_assetsources` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_assetfolders`
--

LOCK TABLES `craft_assetfolders` WRITE;
/*!40000 ALTER TABLE `craft_assetfolders` DISABLE KEYS */;
INSERT INTO `craft_assetfolders` VALUES (1,NULL,1,'Bilder','','2014-12-31 15:22:49','2014-12-31 15:22:49','ed699be0-7669-468e-9b7a-507de360771f');
/*!40000 ALTER TABLE `craft_assetfolders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_assetindexdata`
--

DROP TABLE IF EXISTS `craft_assetindexdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_assetindexdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sessionId` varchar(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sourceId` int(10) NOT NULL,
  `offset` int(10) NOT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` int(10) DEFAULT NULL,
  `recordId` int(10) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_assetindexdata_sessionId_sourceId_offset_unq_idx` (`sessionId`,`sourceId`,`offset`),
  KEY `craft_assetindexdata_sourceId_fk` (`sourceId`),
  CONSTRAINT `craft_assetindexdata_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `craft_assetsources` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_assetindexdata`
--

LOCK TABLES `craft_assetindexdata` WRITE;
/*!40000 ALTER TABLE `craft_assetindexdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_assetindexdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_assetsources`
--

DROP TABLE IF EXISTS `craft_assetsources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_assetsources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `sortOrder` tinyint(4) DEFAULT NULL,
  `fieldLayoutId` int(10) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_assetsources_name_unq_idx` (`name`),
  UNIQUE KEY `craft_assetsources_handle_unq_idx` (`handle`),
  KEY `craft_assetsources_fieldLayoutId_fk` (`fieldLayoutId`),
  CONSTRAINT `craft_assetsources_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_assetsources`
--

LOCK TABLES `craft_assetsources` WRITE;
/*!40000 ALTER TABLE `craft_assetsources` DISABLE KEYS */;
INSERT INTO `craft_assetsources` VALUES (1,'Bilder','images','Local','{\"path\":\"images\\/\",\"url\":\"http:\\/\\/craft.dev\\/images\\/\"}',1,14,'2014-12-31 15:22:49','2014-12-31 15:22:53','93f21f22-4262-45e2-b8c7-54efebd7005a');
/*!40000 ALTER TABLE `craft_assetsources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_assettransformindex`
--

DROP TABLE IF EXISTS `craft_assettransformindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_assettransformindex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fileId` int(11) NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sourceId` int(11) DEFAULT NULL,
  `fileExists` tinyint(1) DEFAULT NULL,
  `inProgress` tinyint(1) DEFAULT NULL,
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_assettransformindex_sourceId_fileId_location_idx` (`sourceId`,`fileId`,`location`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_assettransformindex`
--

LOCK TABLES `craft_assettransformindex` WRITE;
/*!40000 ALTER TABLE `craft_assettransformindex` DISABLE KEYS */;
INSERT INTO `craft_assettransformindex` VALUES (1,6,'index-image.jpg','jpg','_scrolling',1,1,0,'2014-12-31 18:43:19','2014-12-31 18:43:19','2014-12-31 18:43:21','01589b68-0e57-408a-8b77-ae681d40d551'),(2,9,'company.jpg','jpg','_scrolling',1,1,0,'2014-12-31 18:43:20','2014-12-31 18:43:20','2014-12-31 18:43:21','6a7d857a-a4c9-4f63-ae57-2a510a053a17'),(3,13,'6260730214_61c9e39a45_b.jpg','jpg','_scrolling',1,1,0,'2014-12-31 21:07:31','2014-12-31 21:07:31','2014-12-31 21:07:31','22e97939-907d-4d4b-90e3-061e01108c66'),(4,15,'map-austria.jpg','jpg','_scrolling',1,1,0,'2015-01-01 11:05:13','2015-01-01 11:05:13','2015-01-01 11:05:14','7d84026d-2150-48b5-b343-dc4e9955cd32'),(5,17,'128.jpg','jpg','_contact',1,1,0,'2015-01-01 11:15:46','2015-01-01 11:15:46','2015-01-01 11:15:46','089fb5c0-880f-4b97-8fa3-f1b0111076aa');
/*!40000 ALTER TABLE `craft_assettransformindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_assettransforms`
--

DROP TABLE IF EXISTS `craft_assettransforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_assettransforms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mode` enum('stretch','fit','crop') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'center-center',
  `height` int(10) DEFAULT NULL,
  `width` int(10) DEFAULT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quality` int(10) DEFAULT NULL,
  `dimensionChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_assettransforms_name_unq_idx` (`name`),
  UNIQUE KEY `craft_assettransforms_handle_unq_idx` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_assettransforms`
--

LOCK TABLES `craft_assettransforms` WRITE;
/*!40000 ALTER TABLE `craft_assettransforms` DISABLE KEYS */;
INSERT INTO `craft_assettransforms` VALUES (1,'scrolling','scrolling','crop','center-center',500,1000,'jpg',80,'2014-12-31 18:38:37','2014-12-31 18:38:37','2014-12-31 18:39:47','eb617d2b-f2a3-43b2-8142-bd34985cb112'),(2,'contact','contact','crop','center-center',128,128,'jpg',80,'2015-01-01 10:47:25','2015-01-01 10:47:25','2015-01-01 10:47:25','74753d5f-1a04-4309-b3f3-df5682838c14');
/*!40000 ALTER TABLE `craft_assettransforms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_categories`
--

DROP TABLE IF EXISTS `craft_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_categories_groupId_fk` (`groupId`),
  CONSTRAINT `craft_categories_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_categories_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_categories`
--

LOCK TABLES `craft_categories` WRITE;
/*!40000 ALTER TABLE `craft_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_categorygroups`
--

DROP TABLE IF EXISTS `craft_categorygroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_categorygroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hasUrls` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `template` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_categorygroups_name_unq_idx` (`name`),
  UNIQUE KEY `craft_categorygroups_handle_unq_idx` (`handle`),
  KEY `craft_categorygroups_structureId_fk` (`structureId`),
  KEY `craft_categorygroups_fieldLayoutId_fk` (`fieldLayoutId`),
  CONSTRAINT `craft_categorygroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_categorygroups_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `craft_structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_categorygroups`
--

LOCK TABLES `craft_categorygroups` WRITE;
/*!40000 ALTER TABLE `craft_categorygroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_categorygroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_categorygroups_i18n`
--

DROP TABLE IF EXISTS `craft_categorygroups_i18n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_categorygroups_i18n` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `urlFormat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nestedUrlFormat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_categorygroups_i18n_groupId_locale_unq_idx` (`groupId`,`locale`),
  KEY `craft_categorygroups_i18n_locale_fk` (`locale`),
  CONSTRAINT `craft_categorygroups_i18n_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_categorygroups_i18n_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_categorygroups_i18n`
--

LOCK TABLES `craft_categorygroups_i18n` WRITE;
/*!40000 ALTER TABLE `craft_categorygroups_i18n` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_categorygroups_i18n` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_content`
--

DROP TABLE IF EXISTS `craft_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_body` text COLLATE utf8_unicode_ci,
  `field_textonly` text COLLATE utf8_unicode_ci,
  `field_streetaddress` text COLLATE utf8_unicode_ci,
  `field_locality` text COLLATE utf8_unicode_ci,
  `field_postalcode` text COLLATE utf8_unicode_ci,
  `field_countryname` text COLLATE utf8_unicode_ci,
  `field_org` text COLLATE utf8_unicode_ci,
  `field_fn` text COLLATE utf8_unicode_ci,
  `field_tel` text COLLATE utf8_unicode_ci,
  `field_uidinternational` text COLLATE utf8_unicode_ci,
  `field_email` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_content_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_content_title_idx` (`title`),
  KEY `craft_content_locale_fk` (`locale`),
  CONSTRAINT `craft_content_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_content_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_content`
--

LOCK TABLES `craft_content` WRITE;
/*!40000 ALTER TABLE `craft_content` DISABLE KEYS */;
INSERT INTO `craft_content` VALUES (1,1,'de',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-31 14:08:16','2014-12-31 14:08:16','94a46312-52ee-4ab0-b3a4-03da8d826a9c'),(2,2,'de','Willkommen','<p>\r\n	Die shp möchte sich bei Ihnen vorstellen.\r\n</p><p>\r\n	Wir sind ein international tätiges Holzhandelsunternehmen mit Hauptsitz in Österreich. Handelsware sind Rohholz und Rohholzprodukte in den jeweiligen kundenspezifischen Ausformungen.\r\n</p><p>\r\n	Neben unserer reinen Holzhandelstätigkeit bieten wir auch Dienstleistungen rund um Holz und Wald an. Genauere Informationen finden Sie auf den einzelnen Themenseiten.\r\n</p><p>\r\n	Oder Sie kontaktieren uns einfach!\r\n</p><p>\r\n	Gerhard Pipp\r\n	<br>\r\n	Geschäftsführender Gesellschafter\r\n</p>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-31 14:08:16','2015-01-24 13:39:08','842adbc6-e22b-43d9-83cd-50556d0d2008'),(4,4,'de',NULL,'<p>http://1d0be.github.io/shp-holz</p>','http://1d0be.github.io/shp-holz',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-31 14:49:48','2015-01-01 11:37:14','40c4de0b-ccc2-4dd7-960a-48f5fca008fd'),(5,5,'de',NULL,'<p>holz gmbh</p>','holz gmbh',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-31 15:04:51','2015-01-01 11:37:14','99fbb02c-1e2b-4f6c-bbc5-9a928f74b4d4'),(6,6,'de','index-image',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-31 15:24:30','2015-01-01 11:37:13','711fbfa6-0f56-486e-bf3f-84f192c934b5'),(8,7,'de',NULL,NULL,NULL,'Andritzer Reichsstraße 162','Graz','8046','Austria','shp holz gmbh','DI Gerhard Pipp','+43 31 66 93 38 90','ATU 55070602',NULL,'2014-12-31 15:44:38','2015-01-01 11:37:14','7aa41840-f027-4bd0-b9e7-eb41645551af'),(9,8,'de','Unternehmen','<p>\r\n	Die Vorgängerfirma \"hwp holzverarbeitungs gmbh\" wurde im Jahre 2002 von drei Gesellschaftern gegründet. In dieser Form bestand die Gesellschaft bis 2012.\r\n</p><p>\r\n	2012 war auch das Jahr in dem eine Aufspaltung der hwp erfolgte, wobei die Stammfirma erhalten blieb und vom derzeitigen Gesellschafter Gerhard Pipp unter dem Namen shp holz gmbh bis heute weiter geführt wird.\r\n</p><p>\r\n	Im Jahr 2013 entstand ein Schwesterunternehmen, die \r\n	<strong>shp drewno</strong> mit Firmenstandort Różańsko in Polen.\r\n</p><p>\r\n	<br>\r\n</p>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-31 16:11:41','2015-01-24 14:17:09','d82b257b-5511-41b2-9ce8-a9c1b222b5b6'),(15,9,'de','company',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-31 16:18:32','2015-01-01 11:37:13','badf6cdb-b990-429f-9753-7c464dfb6f18'),(16,10,'de','Ipsum1','<p>Distinctively re-engineer revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and real-time potentialities. Appropriately communicate one-to-one technology after plug-and-play networks.</p><p>Quickly aggregate B2B users and worldwide potentialities. </p><p>Progressively plagiarize resource-leveling e-commerce through resource-leveling core competencies.<br></p>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-31 18:27:20','2015-01-01 11:37:13','8e36d340-5ef6-4983-af41-0beb85b5fe9a'),(17,11,'de','Ispum2','<p>Progressively plagiarize resource-leveling e-commerce through resource-leveling core competencies. Dramatically mesh low-risk high-yield alignments before transparent e-tailers.</p><p>Appropriately empower dynamic leadership skills after business portals. Globally myocardinate interactive supply chains with distinctive quality vectors. Globally revolutionize global sources through interoperable services.</p>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-31 18:29:28','2015-01-01 11:37:14','feb860c9-d5a4-475a-a06e-f4f13255627d'),(18,12,'de','Rundholz für die Sägeindustrie','<p>Wir liefern sowohl Nadel- als auch Laubholzsortimente nach den Anforderungen des jeweiligen Kunden </p><p>zum Beispiel:</p><ul><li>gemäß den österreichischen Holzhandelsusancen</li><li>gemäß den Heilbronner Sortierklassen für Langholz</li></ul>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-31 18:50:01','2015-01-24 14:31:26','86164344-ffc9-4283-80a8-574f8d810f36'),(19,13,'de','6260730214 61c9e39a45 b',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-31 21:07:15','2015-01-01 11:37:13','95253e3b-2d09-4d70-8d87-1aa4a1c0c32c'),(20,14,'de','Industrieholz für die Papier- und Plattenindustrie','<p>In den Qualitäten </p><p><strong>für Deutschland </strong></p><p>IS und IN         (MDF Qualität und OSB Qualität)</p><p><strong>für Österreich</strong></p><p>Faser- und Schleifholz</p><p><br></p>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-31 21:07:26','2015-01-24 14:38:39','75671380-50c7-4551-8e24-c0b8e162aa3b'),(22,15,'de','map-austria',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-01-01 11:04:19','2015-01-01 11:37:13','3851239e-8ae2-4474-b2c5-99b4498dce16'),(23,16,'de','Österreich',NULL,NULL,NULL,NULL,NULL,'austria',NULL,NULL,NULL,NULL,NULL,'2015-01-01 11:04:31','2015-01-24 14:49:39','2d333e76-db5e-4537-bf2f-77081347459b'),(24,17,'de','128',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-01-01 11:14:30','2015-01-01 11:37:13','c49134cb-39ee-4797-8795-da7c970f3a42'),(25,18,'de','Brigitte Hebenstreit','<p>Büroorganisation<br>Tel: +43 664 854 78 51<br>E-Mail:  b.hebenstreit@shp-holz.at</p>',NULL,NULL,NULL,NULL,'austria',NULL,'Brigitte Hebenstreit',NULL,NULL,NULL,'2015-01-01 11:14:55','2015-01-24 14:48:50','b54c3815-49b9-47e3-9bd7-cd010e7f1741'),(27,20,'de','Impressum',NULL,NULL,'Diverser Weg 1','Graz','8010',NULL,NULL,NULL,'+43 316 123456789',NULL,'example@example.com','2015-01-01 11:27:24','2015-01-01 11:37:14','33fd96b5-20b2-4f83-9218-ace049c8f609'),(28,6,'pl','index-image',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-01-01 11:37:13','2015-01-01 11:37:13','58272752-2319-4304-a700-d6a52bccb500'),(29,9,'pl','company',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-01-01 11:37:13','2015-01-01 11:37:13','a23ef456-3f34-4e48-a555-dc767f6a9e37'),(30,13,'pl','6260730214 61c9e39a45 b',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-01-01 11:37:13','2015-01-01 11:37:13','d2c4b0d1-fee8-4861-86b5-6c6837ef5ca4'),(31,15,'pl','map-austria',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-01-01 11:37:13','2015-01-01 11:37:13','4a40ad1b-01c6-4ec1-bbf6-1d2644150a1d'),(32,17,'pl','128',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-01-01 11:37:13','2015-01-01 11:37:13','c04ce9db-4562-4edc-9d8f-bd559689e0b4'),(33,4,'pl',NULL,'<p>http://1d0be.github.io/shp-holz</p>','http://1d0be.github.io/shp-holz',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-01-01 11:37:14','2015-01-01 11:37:14','9e6d7570-f506-455b-b5f1-8b2cdb16e16e'),(34,5,'pl',NULL,'<p>holz gmbh</p>','holz gmbh',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-01-01 11:37:14','2015-01-01 11:37:14','23424173-d14c-4f9c-80b7-281db9eb01bd'),(35,7,'pl',NULL,NULL,NULL,'Andritzer Reichsstraße 162','Graz','8046','Austria','shp holz gmbh','DI Gerhard Pipp','+43 31 66 93 38 90','ATU 55070602',NULL,'2015-01-01 11:37:14','2015-01-01 11:37:14','39860c43-41ad-4e4e-8833-0853754991c0'),(36,21,'de','Energieholz','<p>Energieholz in Form von</p><ul><li>Langholz und Energiehackgut für Heizwerke</li><li>Langholz für die Brennholzerzeugung</li><li>Waldhackgut für Heizwerke</li><li>Brennholz ofenfertig in Großmengen</li><li>Pellets und Briketts</li></ul>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-01-24 14:41:26','2015-01-24 14:41:26','cfa4e13b-97f5-439f-a46a-9c2641d74536'),(37,22,'de','DI Gerhard Pipp','<p>Geschäftsführender Gesellschafter<br>Tel: +43 664 506 03 72<br>E-mail: g.pipp@shp-holz.at</p>',NULL,NULL,NULL,NULL,'austria',NULL,'DI Gerhard Pipp',NULL,NULL,NULL,'2015-01-24 14:48:07','2015-01-24 14:48:07','a4f757af-58d0-4ab6-a206-9642db0d7793'),(38,23,'de','Deutschland',NULL,NULL,NULL,NULL,NULL,'germany',NULL,NULL,NULL,NULL,NULL,'2015-01-24 14:50:24','2015-01-24 14:50:24','f39b5b75-6b29-4006-9b39-37b723cb8b7b'),(39,24,'de','Hans Henning Baake','<p>Einkaufsleitung Deutschland<br>Tel: +49 173 633 64 78<br>E-Mail: baake-breege@t-online.de</p>',NULL,NULL,NULL,NULL,'germany',NULL,'Hans Henning Baake',NULL,NULL,NULL,'2015-01-24 14:52:57','2015-01-24 14:55:48','616e9bfe-f91f-4836-a720-5ffb54b89167'),(40,25,'de','Polen',NULL,NULL,NULL,NULL,NULL,'poland',NULL,NULL,NULL,NULL,NULL,'2015-01-24 14:55:29','2015-01-24 14:55:29','752873ab-27ea-49e0-8eed-1bb3c3f5ba1a'),(41,26,'de','Hans Henning Baake','<p>Einkaufsleitung Polen</p>Tel: +48 887 60 08 20<br>E-Mail: baake-breege@t-online.de',NULL,NULL,NULL,NULL,'poland',NULL,'Hans Henning Baake',NULL,NULL,NULL,'2015-01-24 14:57:18','2015-01-24 14:57:18','5742e415-ba93-4aeb-ae24-2337f89bd99e'),(42,27,'de','Agata Kotyk','<p>Logistik<br>Tel: +48 887 70 08 10<br>E-Mail: shp.holz.polen@gmail.at</p>',NULL,NULL,NULL,NULL,'poland',NULL,'Agata Kotyk',NULL,NULL,NULL,'2015-01-24 15:00:22','2015-01-24 15:00:22','5859b927-cd76-4918-87b6-c4cfd7695820'),(43,28,'de','Illona Poplawska','<p>Buchhaltung<br>Tel: +48 887 700 830<br>E-Mail: shp.holz.polen@gmail.com</p>',NULL,NULL,NULL,NULL,'poland',NULL,'Illona Poplawska',NULL,NULL,NULL,'2015-01-24 15:01:52','2015-01-24 15:01:52','71e5832a-fd4a-4bd1-bad1-8de4b787dd19');
/*!40000 ALTER TABLE `craft_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_deprecationerrors`
--

DROP TABLE IF EXISTS `craft_deprecationerrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_deprecationerrors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fingerprint` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `line` smallint(6) unsigned NOT NULL,
  `class` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `method` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `template` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `templateLine` smallint(6) unsigned DEFAULT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `traces` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_deprecationerrors_key_fingerprint_unq_idx` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_deprecationerrors`
--

LOCK TABLES `craft_deprecationerrors` WRITE;
/*!40000 ALTER TABLE `craft_deprecationerrors` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_deprecationerrors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_elements`
--

DROP TABLE IF EXISTS `craft_elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `archived` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_elements_type_idx` (`type`),
  KEY `craft_elements_enabled_idx` (`enabled`),
  KEY `craft_elements_archived_dateCreated_idx` (`archived`,`dateCreated`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_elements`
--

LOCK TABLES `craft_elements` WRITE;
/*!40000 ALTER TABLE `craft_elements` DISABLE KEYS */;
INSERT INTO `craft_elements` VALUES (1,'User',1,0,'2014-12-31 14:08:16','2014-12-31 14:08:16','f4404892-6a63-4078-88d8-bf8b136e7b50'),(2,'Entry',1,0,'2014-12-31 14:08:16','2015-01-24 13:39:08','d1446015-0b47-4c15-8dbc-9157b7649f22'),(4,'GlobalSet',1,0,'2014-12-31 14:49:48','2015-01-01 11:37:14','f66ea431-9cfd-40c5-a9d2-0fa1b9a3461e'),(5,'GlobalSet',1,0,'2014-12-31 15:04:51','2015-01-01 11:37:14','8ac80665-1570-45ff-8fdf-21cdbee5fade'),(6,'Asset',1,0,'2014-12-31 15:24:30','2015-01-01 11:37:12','d58375b5-7c3c-4b28-b90e-81f13b7b299a'),(7,'GlobalSet',1,0,'2014-12-31 15:44:38','2015-01-01 11:37:14','eb29bffb-2859-46fb-bbd1-0f5fd49a49d4'),(8,'Entry',1,0,'2014-12-31 16:11:41','2015-01-24 14:17:09','9859d581-7c15-4d38-82ea-9b8657a1a762'),(9,'Asset',1,0,'2014-12-31 16:18:32','2015-01-01 11:37:13','da657c51-69b9-4173-aa87-1181037ba0e1'),(10,'Entry',1,0,'2014-12-31 18:27:20','2015-01-01 11:37:13','e90dbffc-0693-4e8c-bf8b-bfcb5bea5c9b'),(11,'Entry',1,0,'2014-12-31 18:29:28','2015-01-01 11:37:14','9283e774-4d12-4e7e-b2f6-974b63474992'),(12,'Entry',1,0,'2014-12-31 18:50:01','2015-01-24 14:31:26','cba83739-53c7-407b-86e1-a676edd75d1b'),(13,'Asset',1,0,'2014-12-31 21:07:15','2015-01-01 11:37:13','82f8d4be-0946-4dae-9869-51166d3d2f47'),(14,'Entry',1,0,'2014-12-31 21:07:26','2015-01-24 14:38:39','ab08a3d0-6008-48bd-a183-7aae922cdcf7'),(15,'Asset',1,0,'2015-01-01 11:04:19','2015-01-01 11:37:13','e7005736-4667-48da-84e3-bd524b598afc'),(16,'Entry',1,0,'2015-01-01 11:04:31','2015-01-24 14:49:39','ce87e953-6768-46ca-9461-aa3b92e6cdf7'),(17,'Asset',1,0,'2015-01-01 11:14:30','2015-01-01 11:37:13','07d4a025-0682-4c0f-b6ac-b1e6c535d212'),(18,'Entry',1,0,'2015-01-01 11:14:55','2015-01-24 14:48:50','a98a18e4-e50f-49e5-947a-913e7c38e2ef'),(20,'Entry',1,0,'2015-01-01 11:27:24','2015-01-01 11:37:14','1706fbf5-5a84-4e23-8416-7dc422b4d814'),(21,'Entry',1,0,'2015-01-24 14:41:26','2015-01-24 14:41:26','5dd43e2a-54b4-433c-bd6c-e0f461113ab1'),(22,'Entry',1,0,'2015-01-24 14:48:07','2015-01-24 14:48:07','f7ede02f-e610-4d08-82c2-002dce249aac'),(23,'Entry',1,0,'2015-01-24 14:50:24','2015-01-24 14:50:24','5b8c4325-4b5f-443e-97f1-a44f86a83ade'),(24,'Entry',1,0,'2015-01-24 14:52:57','2015-01-24 14:55:48','6462e28e-0e3f-4845-82e4-35481eebbf7b'),(25,'Entry',1,0,'2015-01-24 14:55:29','2015-01-24 14:58:21','ceea0b18-32c2-4f19-ac80-e25146e5ca47'),(26,'Entry',1,0,'2015-01-24 14:57:18','2015-01-24 14:57:18','1a0eb004-6037-41ce-9c89-a2833c403623'),(27,'Entry',1,0,'2015-01-24 15:00:22','2015-01-24 15:00:22','7fd42eef-d0f6-4b35-8923-55ad5065e25b'),(28,'Entry',1,0,'2015-01-24 15:01:52','2015-01-24 15:01:52','94a29228-48c2-43c5-8c18-b49ac075157f');
/*!40000 ALTER TABLE `craft_elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_elements_i18n`
--

DROP TABLE IF EXISTS `craft_elements_i18n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_elements_i18n` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_elements_i18n_elementId_locale_unq_idx` (`elementId`,`locale`),
  UNIQUE KEY `craft_elements_i18n_uri_locale_unq_idx` (`uri`,`locale`),
  KEY `craft_elements_i18n_slug_locale_idx` (`slug`,`locale`),
  KEY `craft_elements_i18n_enabled_idx` (`enabled`),
  KEY `craft_elements_i18n_locale_fk` (`locale`),
  CONSTRAINT `craft_elements_i18n_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_elements_i18n_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_elements_i18n`
--

LOCK TABLES `craft_elements_i18n` WRITE;
/*!40000 ALTER TABLE `craft_elements_i18n` DISABLE KEYS */;
INSERT INTO `craft_elements_i18n` VALUES (1,1,'de','',NULL,1,'2014-12-31 14:08:16','2014-12-31 14:08:16','a7d269aa-769e-4195-ba97-cf88b741dfe4'),(2,2,'de','homepage','__home__',1,'2014-12-31 14:08:16','2015-01-24 13:39:08','f84031ec-4331-4752-a7aa-4d196b53b826'),(4,4,'de','',NULL,1,'2014-12-31 14:49:48','2015-01-01 11:37:14','c7b19a2a-c386-43ea-8dd4-26c985d48619'),(5,5,'de','',NULL,1,'2014-12-31 15:04:51','2015-01-01 11:37:14','8b5b9c31-0ad1-4745-a7c7-42ed448cc8d8'),(6,6,'de','index-image',NULL,1,'2014-12-31 15:24:30','2015-01-01 11:37:13','268c7666-22a1-4856-b2b2-f0844c5ed578'),(8,7,'de','',NULL,1,'2014-12-31 15:44:38','2015-01-01 11:37:14','488c4b27-243e-4129-aa7a-b28b200804ff'),(9,8,'de','unternehmen','unternehmen',1,'2014-12-31 16:11:41','2015-01-24 14:17:09','58702f73-b9f2-4331-a024-2e60a122ba71'),(15,9,'de','company',NULL,1,'2014-12-31 16:18:32','2015-01-01 11:37:13','08a8e394-6db4-43e0-b018-b2354db61856'),(16,10,'de','ipsum1',NULL,1,'2014-12-31 18:27:21','2015-01-01 11:37:13','1395ced5-e7ff-4b85-b29c-342042656775'),(17,11,'de','ispum2',NULL,1,'2014-12-31 18:29:28','2015-01-01 11:37:14','e92596e7-db6b-4a1b-99ec-c4416b88043b'),(18,12,'de','rundholz-für-die-sägeindustrie',NULL,1,'2014-12-31 18:50:01','2015-01-24 14:31:26','109aa21c-4c83-4cac-8434-5acba712bff3'),(19,13,'de','6260730214-61c9e39a45-b',NULL,1,'2014-12-31 21:07:15','2015-01-01 11:37:13','2dd1e2ee-f59e-4d5e-964d-d195fb7f184f'),(20,14,'de','industrieholz-für-die-papier-und-plattenindustrie',NULL,1,'2014-12-31 21:07:26','2015-01-24 14:38:39','c031c24f-5dd3-45a1-8b3d-0d68264c7a87'),(22,15,'de','map-austria',NULL,1,'2015-01-01 11:04:19','2015-01-01 11:37:13','b2c140bf-6018-475f-a145-af54b73dc573'),(23,16,'de','österreich',NULL,1,'2015-01-01 11:04:31','2015-01-24 14:49:39','c11ff314-130c-4686-be4b-33c9021f6166'),(24,17,'de','128',NULL,1,'2015-01-01 11:14:30','2015-01-01 11:37:13','8a0adc01-fa30-4768-8048-7c15eb3f2a10'),(25,18,'de','di-heribert-unkown',NULL,1,'2015-01-01 11:14:55','2015-01-24 14:48:50','3134b763-83d2-49d2-a185-6aa4162cec4e'),(27,20,'de','impressum','impressum',1,'2015-01-01 11:27:24','2015-01-01 11:37:14','9fe57f7a-f1d6-4a54-a395-0aaf22739b98'),(28,6,'pl','index-image',NULL,1,'2015-01-01 11:37:13','2015-01-01 11:37:13','78440612-e204-46ac-830b-2b0d6840a918'),(29,9,'pl','company',NULL,1,'2015-01-01 11:37:13','2015-01-01 11:37:13','71d1414b-6263-4c6c-8504-fd51b247168b'),(30,13,'pl','6260730214-61c9e39a45-b',NULL,1,'2015-01-01 11:37:13','2015-01-01 11:37:13','92bd6a5c-7c90-4ec6-a668-ca8f1805d448'),(31,15,'pl','map-austria',NULL,1,'2015-01-01 11:37:13','2015-01-01 11:37:13','3cc33e9c-b788-4b81-9ad2-0fd385651163'),(32,17,'pl','128',NULL,1,'2015-01-01 11:37:13','2015-01-01 11:37:13','7b437404-4cd5-42d9-98eb-7974afe524e7'),(33,4,'pl','',NULL,1,'2015-01-01 11:37:14','2015-01-01 11:37:14','95a6d81e-ce99-474c-b233-5bb672413b89'),(34,5,'pl','',NULL,1,'2015-01-01 11:37:14','2015-01-01 11:37:14','819d0802-61dd-4a97-9dd4-f6dbe6b0436c'),(35,7,'pl','',NULL,1,'2015-01-01 11:37:14','2015-01-01 11:37:14','c7219e09-844f-4e24-af13-742b1f8dcdbb'),(36,21,'de','energieholz',NULL,1,'2015-01-24 14:41:26','2015-01-24 14:41:26','9a4365c3-fd4d-4b0d-8fa4-a47726c961dd'),(37,22,'de','di-gerhard-pipp',NULL,1,'2015-01-24 14:48:07','2015-01-24 14:48:07','71dd97d9-12bd-453c-83f3-0ad2d36017e3'),(38,23,'de','germany',NULL,1,'2015-01-24 14:50:24','2015-01-24 14:50:24','1c0d3e79-bd29-4ef0-b7ca-e4ff77abf3c6'),(39,24,'de','hans-henning-baake',NULL,1,'2015-01-24 14:52:58','2015-01-24 14:55:48','94a5d925-e549-4e1b-97ab-fd0483d2697c'),(40,25,'de','polen',NULL,1,'2015-01-24 14:55:29','2015-01-24 14:58:21','e0043192-078a-4c27-81fa-5cbca0325983'),(41,26,'de','hans-henning-baake',NULL,1,'2015-01-24 14:57:18','2015-01-24 14:57:18','bebd3b86-01fc-467a-843d-5d38800f617a'),(42,27,'de','agata-kotyk',NULL,1,'2015-01-24 15:00:22','2015-01-24 15:00:22','7de2f6a0-ed9a-4da4-8ac4-ad48a165f927'),(43,28,'de','illona-poplawska',NULL,1,'2015-01-24 15:01:52','2015-01-24 15:01:52','21b5ab2a-dceb-4196-b53a-401eae9900ce');
/*!40000 ALTER TABLE `craft_elements_i18n` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_emailmessages`
--

DROP TABLE IF EXISTS `craft_emailmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_emailmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` char(150) COLLATE utf8_unicode_ci NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `subject` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_emailmessages_key_locale_unq_idx` (`key`,`locale`),
  KEY `craft_emailmessages_locale_fk` (`locale`),
  CONSTRAINT `craft_emailmessages_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_emailmessages`
--

LOCK TABLES `craft_emailmessages` WRITE;
/*!40000 ALTER TABLE `craft_emailmessages` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_emailmessages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_entries`
--

DROP TABLE IF EXISTS `craft_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `typeId` int(11) DEFAULT NULL,
  `authorId` int(11) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_entries_sectionId_idx` (`sectionId`),
  KEY `craft_entries_typeId_idx` (`typeId`),
  KEY `craft_entries_postDate_idx` (`postDate`),
  KEY `craft_entries_expiryDate_idx` (`expiryDate`),
  KEY `craft_entries_authorId_fk` (`authorId`),
  CONSTRAINT `craft_entries_authorId_fk` FOREIGN KEY (`authorId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_entries_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_entries_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_entries_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `craft_entrytypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_entries`
--

LOCK TABLES `craft_entries` WRITE;
/*!40000 ALTER TABLE `craft_entries` DISABLE KEYS */;
INSERT INTO `craft_entries` VALUES (2,1,1,NULL,'2014-12-31 16:12:31',NULL,'2014-12-31 14:08:16','2015-01-24 13:39:08','1d09a30f-0ed6-4223-a37e-b47e284db4fb'),(8,3,3,NULL,'2015-01-01 10:44:01',NULL,'2014-12-31 16:11:41','2015-01-24 14:17:09','ce8e7073-4917-417a-8b33-21ec4d0c5491'),(10,4,4,1,'2014-12-31 18:27:00',NULL,'2014-12-31 18:27:21','2014-12-31 18:32:19','8595fa5b-4634-4ee7-b29a-c80571808331'),(11,4,4,1,'2014-12-31 18:29:00',NULL,'2014-12-31 18:29:28','2014-12-31 18:32:12','c6f459ab-a310-416a-8864-8a4c7ba13796'),(12,5,5,1,'2014-12-31 18:50:00',NULL,'2014-12-31 18:50:01','2015-01-24 14:31:26','e578c07e-dcde-4131-98ea-dfc03598fedb'),(14,5,5,1,'2014-12-31 21:00:00',NULL,'2014-12-31 21:07:26','2015-01-24 14:38:39','5ca625ad-0203-44f9-b60d-68d3c01c9ae1'),(16,6,7,1,'2015-01-01 11:04:00',NULL,'2015-01-01 11:04:31','2015-01-24 14:49:39','0f877f01-b52d-462b-a451-c71717b1545b'),(18,6,6,1,'2015-01-01 11:14:00',NULL,'2015-01-01 11:14:55','2015-01-24 14:48:50','5f038845-a8c4-42f9-a387-812fcbd6f198'),(20,7,8,NULL,'2015-01-01 11:27:24',NULL,'2015-01-01 11:27:24','2015-01-01 11:31:20','35100c35-50b5-4399-82c2-64f0eddec654'),(21,5,5,1,'2015-01-24 14:41:00',NULL,'2015-01-24 14:41:26','2015-01-24 14:41:26','af0afb86-7433-403c-9cdc-e8fe52688306'),(22,6,6,1,'2015-01-24 14:47:00',NULL,'2015-01-24 14:48:07','2015-01-24 14:48:07','b3045d3a-41f5-4b8d-9fd1-f9ab7f774781'),(23,6,7,1,'2015-01-24 14:50:24',NULL,'2015-01-24 14:50:24','2015-01-24 14:50:24','d48fbb86-5022-4942-9edb-93c05693abe6'),(24,6,6,1,'2015-01-24 14:52:00',NULL,'2015-01-24 14:52:58','2015-01-24 14:55:48','e9b4f657-fec0-44f2-bddf-44b6b91d01a9'),(25,6,7,1,'2015-01-24 14:55:29',NULL,'2015-01-24 14:55:29','2015-01-24 14:55:29','d14f36ed-62b9-48ed-8455-1982c60f881d'),(26,6,6,1,'2015-01-24 14:57:00',NULL,'2015-01-24 14:57:18','2015-01-24 14:57:18','952be2b0-ee0f-4513-9274-278642102899'),(27,6,6,1,'2015-01-24 15:00:00',NULL,'2015-01-24 15:00:22','2015-01-24 15:00:22','603de77d-343e-4b27-8884-d75d96a824cd'),(28,6,6,1,'2015-01-24 15:01:52',NULL,'2015-01-24 15:01:52','2015-01-24 15:01:52','7f622761-d179-4f99-811d-da6636140a64');
/*!40000 ALTER TABLE `craft_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_entrydrafts`
--

DROP TABLE IF EXISTS `craft_entrydrafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_entrydrafts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entryId` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `creatorId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notes` tinytext COLLATE utf8_unicode_ci,
  `data` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_entrydrafts_entryId_locale_idx` (`entryId`,`locale`),
  KEY `craft_entrydrafts_sectionId_fk` (`sectionId`),
  KEY `craft_entrydrafts_creatorId_fk` (`creatorId`),
  KEY `craft_entrydrafts_locale_fk` (`locale`),
  CONSTRAINT `craft_entrydrafts_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_entrydrafts_entryId_fk` FOREIGN KEY (`entryId`) REFERENCES `craft_entries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_entrydrafts_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_entrydrafts_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_entrydrafts`
--

LOCK TABLES `craft_entrydrafts` WRITE;
/*!40000 ALTER TABLE `craft_entrydrafts` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_entrydrafts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_entrytypes`
--

DROP TABLE IF EXISTS `craft_entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_entrytypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hasTitleField` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `titleLabel` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'Title',
  `titleFormat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` tinyint(4) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_entrytypes_name_sectionId_unq_idx` (`name`,`sectionId`),
  UNIQUE KEY `craft_entrytypes_handle_sectionId_unq_idx` (`handle`,`sectionId`),
  KEY `craft_entrytypes_sectionId_fk` (`sectionId`),
  KEY `craft_entrytypes_fieldLayoutId_fk` (`fieldLayoutId`),
  CONSTRAINT `craft_entrytypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_entrytypes_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_entrytypes`
--

LOCK TABLES `craft_entrytypes` WRITE;
/*!40000 ALTER TABLE `craft_entrytypes` DISABLE KEYS */;
INSERT INTO `craft_entrytypes` VALUES (1,1,24,'Homepage','homepage',1,'Titel',NULL,NULL,'2014-12-31 14:08:16','2014-12-31 16:13:29','88fcb01d-0452-404b-a87e-42c745e3672a'),(3,3,25,'unternehmen','unternehmen',0,NULL,'{section.name|raw}',NULL,'2014-12-31 16:11:41','2014-12-31 16:13:40','b5652ffc-9e32-484c-b5ab-8203629fab7d'),(4,4,31,'Dienstleistungen','dienstleistungen',1,'Titel',NULL,NULL,'2014-12-31 18:24:16','2014-12-31 18:49:00','fa18fda8-d156-4b62-bfdd-0f01903d096c'),(5,5,30,'Produkte','produkte',1,'Titel',NULL,NULL,'2014-12-31 18:47:18','2014-12-31 18:47:48','ccb0c207-54d3-4f4b-b922-56ebded130fd'),(6,6,36,'Kontakt','kontakt',0,NULL,'{fn}',NULL,'2015-01-01 10:43:45','2015-01-01 10:49:47','756e99a6-5fda-498b-85e5-55aa8bac34ff'),(7,6,35,'Land','land',1,'Titel',NULL,NULL,'2015-01-01 10:48:41','2015-01-01 10:49:22','9231fc34-f51d-4ad1-8593-61b0761e1507'),(8,7,39,'Impressum','impressum',0,NULL,'{section.name|raw}',NULL,'2015-01-01 11:27:24','2015-01-01 11:30:33','b5788e54-a61e-4e10-94f7-2866c7237777');
/*!40000 ALTER TABLE `craft_entrytypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_entryversions`
--

DROP TABLE IF EXISTS `craft_entryversions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_entryversions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entryId` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `num` smallint(6) unsigned NOT NULL,
  `notes` tinytext COLLATE utf8_unicode_ci,
  `data` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_entryversions_entryId_locale_idx` (`entryId`,`locale`),
  KEY `craft_entryversions_sectionId_fk` (`sectionId`),
  KEY `craft_entryversions_creatorId_fk` (`creatorId`),
  KEY `craft_entryversions_locale_fk` (`locale`),
  CONSTRAINT `craft_entryversions_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `craft_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_entryversions_entryId_fk` FOREIGN KEY (`entryId`) REFERENCES `craft_entries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_entryversions_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_entryversions_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_entryversions`
--

LOCK TABLES `craft_entryversions` WRITE;
/*!40000 ALTER TABLE `craft_entryversions` DISABLE KEYS */;
INSERT INTO `craft_entryversions` VALUES (1,2,1,1,'de',1,'','{\"typeId\":\"1\",\"authorId\":null,\"title\":\"Homepage\",\"slug\":\"homepage\",\"postDate\":1420042351,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"4\":[\"6\"],\"1\":\"<p>Es stimmt, diese Site hat noch nicht viel an Inhalt zu bieten. Aber keine Sorge, Benjas sind doof, und unsere Webentwickler haben das CMS soeben installiert und gerade in diesem Moment bereiten sie die Inhalte vor. Schon ganz bald ist Craft.dev eine Quelle neuer Perspektiven, klarer Analysen und scharfsinniger Meinungen, ein Ort, an den Sie wieder und wieder zur\\u00fcckkehren werden.<br><\\/p>\"}}','2014-12-31 16:38:07','2014-12-31 16:38:07','252e71a1-241e-4a2c-9f2a-d50571435bc3'),(2,2,1,1,'de',2,'','{\"typeId\":\"1\",\"authorId\":null,\"title\":\"Homepage\",\"slug\":\"homepage\",\"postDate\":1420042351,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"4\":[\"6\"],\"1\":\"<p>Die shp holz gmbh m\\u00f6chte sich bei Ihnen vorstellen!<\\/p><p>Wir sind ein international t\\u00e4tiges Holzhandelsunternehmen mit Hauptsitz in \\u00d6sterreich. Handelsware sind Rohholz und Rohholzprodukte in den jeweiligen Kundenspezifischen Ausformungen<\\/p><p>Neben unserer reinen Holzhandelst\\u00e4tigkeit bieten wir auch Dienstleistungen rund um Holz und Wald an! Genauere Informationen finden Sie in den einzelnen Themenseiten!<\\/p><p>Oder Sie kontaktieren uns einfach!<\\/p><p>Gerhard Pipp<br>Gesch\\u00e4ftsf\\u00fchrender Gesellschafter!<\\/p>\"}}','2014-12-31 16:39:02','2014-12-31 16:39:02','435931ea-e83e-4422-acdb-b825595ac2c8'),(3,10,4,1,'de',1,'','{\"typeId\":null,\"authorId\":\"1\",\"title\":\"Ipsum1\",\"slug\":\"ipsum1\",\"postDate\":1420050440,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"4\":[\"9\"],\"1\":\"<p>Distinctively re-engineer revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and real-time potentialities. Appropriately communicate one-to-one technology after plug-and-play networks.<\\/p><p>Quickly aggregate B2B users and worldwide potentialities. <\\/p>\"}}','2014-12-31 18:27:21','2014-12-31 18:27:21','11503bbb-1ec2-4f2c-8c38-0facb35443a5'),(4,11,4,1,'de',1,'','{\"typeId\":null,\"authorId\":\"1\",\"title\":\"Ispum2\",\"slug\":\"ispum2\",\"postDate\":1420050568,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"4\":\"\",\"1\":\"<p>Progressively plagiarize resource-leveling e-commerce through resource-leveling core competencies. Dramatically mesh low-risk high-yield alignments before transparent e-tailers.<\\/p><p>Appropriately empower dynamic leadership skills after business portals. Globally myocardinate interactive supply chains with distinctive quality vectors. Globally revolutionize global sources through interoperable services<\\/p>\"}}','2014-12-31 18:29:28','2014-12-31 18:29:28','73fd0bda-2ce5-4d14-8d7c-5b6fe932c461'),(5,11,4,1,'de',2,'','{\"typeId\":\"4\",\"authorId\":\"1\",\"title\":\"Ispum2\",\"slug\":\"ispum2\",\"postDate\":1420050540,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"4\":[\"6\"],\"1\":\"<p>Progressively plagiarize resource-leveling e-commerce through resource-leveling core competencies. Dramatically mesh low-risk high-yield alignments before transparent e-tailers.<\\/p><p>Appropriately empower dynamic leadership skills after business portals. Globally myocardinate interactive supply chains with distinctive quality vectors. Globally revolutionize global sources through interoperable services<\\/p>\"}}','2014-12-31 18:29:57','2014-12-31 18:29:57','6af8ec09-cf9c-4dc8-a4d2-0ff5a5fcb701'),(6,11,4,1,'de',3,'','{\"typeId\":\"4\",\"authorId\":\"1\",\"title\":\"Ispum2\",\"slug\":\"ispum2\",\"postDate\":1420050540,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"4\":[\"6\"],\"1\":\"<p>Progressively plagiarize resource-leveling e-commerce through resource-leveling core competencies. Dramatically mesh low-risk high-yield alignments before transparent e-tailers.<\\/p><p>Appropriately empower dynamic leadership skills after business portals. Globally myocardinate interactive supply chains with distinctive quality vectors. Globally revolutionize global sources through interoperable services.<\\/p><p>Progressively plagiarize resource-leveling e-commerce through resource-leveling core competencies.<span><\\/span><br><\\/p>\"}}','2014-12-31 18:31:22','2014-12-31 18:31:22','941728b2-5099-4729-878e-cf2f4ef38bc6'),(7,11,4,1,'de',4,'','{\"typeId\":\"4\",\"authorId\":\"1\",\"title\":\"Ispum2\",\"slug\":\"ispum2\",\"postDate\":1420050540,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"4\":[\"6\"],\"1\":\"<p>Progressively plagiarize resource-leveling e-commerce through resource-leveling core competencies. Dramatically mesh low-risk high-yield alignments before transparent e-tailers.<\\/p><p>Appropriately empower dynamic leadership skills after business portals. Globally myocardinate interactive supply chains with distinctive quality vectors. Globally revolutionize global sources through interoperable services.<\\/p>\"}}','2014-12-31 18:32:12','2014-12-31 18:32:12','2e6e892d-4dff-4024-a037-f3a35f285989'),(8,10,4,1,'de',2,'','{\"typeId\":\"4\",\"authorId\":\"1\",\"title\":\"Ipsum1\",\"slug\":\"ipsum1\",\"postDate\":1420050420,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"4\":[\"9\"],\"1\":\"<p>Distinctively re-engineer revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and real-time potentialities. Appropriately communicate one-to-one technology after plug-and-play networks.<\\/p><p>Quickly aggregate B2B users and worldwide potentialities. <\\/p><p>Progressively plagiarize resource-leveling e-commerce through resource-leveling core competencies.<span><\\/span><br><\\/p>\"}}','2014-12-31 18:32:19','2014-12-31 18:32:19','3a3d9909-2464-4ee3-9d92-576d8c0f6f1e'),(9,16,6,1,'de',1,'','{\"typeId\":\"7\",\"authorId\":\"1\",\"title\":\"\\u00d6sterreich\",\"slug\":\"\\u00f6sterreich\",\"postDate\":1420110271,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"4\":[\"15\"],\"8\":\"austria\"}}','2015-01-01 11:04:31','2015-01-01 11:04:31','9835e214-dc39-4dbf-a7e6-cf31a6020ac3'),(10,18,6,1,'de',1,'','{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"DI Heribert Unkown\",\"slug\":\"di-heribert-unkown\",\"postDate\":1420110895,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"4\":[\"17\"],\"8\":\"austria\",\"1\":\"<p>Arbeitet.<\\/p>\",\"10\":\"DI Heribert Unkown\"}}','2015-01-01 11:14:55','2015-01-01 11:14:55','80d96791-d75d-468a-befd-efe2e76b9540'),(12,20,7,1,'de',1,'','{\"typeId\":\"8\",\"authorId\":null,\"title\":\"Impressum\",\"slug\":\"impressum\",\"postDate\":1420111644,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"14\":\"example@example.com\",\"7\":\"8010\",\"6\":\"Graz\",\"5\":\"Diverser Weg 1\",\"11\":\"+43 316 123456789\"}}','2015-01-01 11:31:20','2015-01-01 11:31:20','01f34f2e-d24b-4d4b-9532-c654c2e38bd2'),(13,2,1,1,'de',3,'','{\"typeId\":\"1\",\"authorId\":null,\"title\":\"Homepage\",\"slug\":\"homepage\",\"postDate\":1420042351,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"4\":[\"6\"],\"1\":\"<p>Die shp holz gmbh m\\u00f6chte sich bei Ihnen vorstellen.<\\/p><p>Wir sind ein international t\\u00e4tiges Holzhandelsunternehmen mit Hauptsitz in \\u00d6sterreich. Handelsware sind Rohholz und Rohholzprodukte in den jeweiligen Kundenspezifischen Ausformungen<\\/p><p>Neben unserer reinen Holzhandelst\\u00e4tigkeit bieten wir auch Dienstleistungen rund um Holz und Wald an! Genauere Informationen finden Sie in den einzelnen Themenseiten.<\\/p><p>Oder Sie kontaktieren uns einfach!<\\/p><p>Gerhard Pipp<br>Gesch\\u00e4ftsf\\u00fchrender Gesellschafter<\\/p>\"}}','2015-01-10 14:41:18','2015-01-10 14:41:18','9ed3e55c-a811-4b37-bb9e-8a6a70b5993d'),(14,2,1,1,'de',4,'','{\"typeId\":\"1\",\"authorId\":null,\"title\":\"Homepage\",\"slug\":\"homepage\",\"postDate\":1420042351,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"4\":[\"6\"],\"1\":\"<p>\\r\\n\\tDie shp holz gmbh m\\u00f6chte sich bei Ihnen vorstellen.\\r\\n<\\/p><p>\\r\\n\\tWir sind ein international t\\u00e4tiges Holzhandelsunternehmen mit Hauptsitz in \\u00d6sterreich. Handelsware sind Rohholz und Rohholzprodukte in den jeweiligen Kundenspezifischen Ausformungen\\r\\n<\\/p><p>\\r\\n\\tNeben unserer reinen Holzhandelst\\u00e4tigkeit bieten wir auch Dienstleistungen rund um Holz und Wald an! Genauere Informationen finden Sie in den einzelnen Themenseiten.\\r\\n<\\/p><p>\\r\\n\\tOder Sie kontaktieren uns einfach!\\r\\n<\\/p><p>\\r\\n\\tGerhard Pipp\\r\\n\\t<br>\\r\\n\\tGesch\\u00e4ftsf\\u00fchrender Gesellschafter\\r\\n<\\/p>\"}}','2015-01-10 14:41:32','2015-01-10 14:41:32','6eb8dce4-4853-439c-9b7f-7ee86bdf91e4'),(15,2,1,1,'de',5,'','{\"typeId\":\"1\",\"authorId\":null,\"title\":\"Willkommen\",\"slug\":\"homepage\",\"postDate\":1420042351,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"4\":[\"6\"],\"1\":\"<p>\\r\\n\\tDie shp m\\u00f6chte sich bei Ihnen vorstellen.\\r\\n<\\/p><p>\\r\\n\\tWir sind ein international t\\u00e4tiges Holzhandelsunternehmen mit Hauptsitz in \\u00d6sterreich. Handelsware sind Rohholz und Rohholzprodukte in den jeweiligen kundenspezifischen Ausformungen.\\r\\n<\\/p><p>\\r\\n\\tNeben unserer reinen Holzhandelst\\u00e4tigkeit bieten wir auch Dienstleistungen rund um Holz und Wald an! Genauere Informationen finden Sie in den einzelnen Themenseiten.\\r\\n<\\/p><p>\\r\\n\\tOder Sie kontaktieren uns einfach!\\r\\n<\\/p><p>\\r\\n\\tGerhard Pipp\\r\\n\\t<br>\\r\\n\\tGesch\\u00e4ftsf\\u00fchrender Gesellschafter\\r\\n<\\/p>\"}}','2015-01-24 13:38:02','2015-01-24 13:38:02','f29a0fd7-8ae1-41de-969e-b294df097e8b'),(16,2,1,1,'de',6,'','{\"typeId\":\"1\",\"authorId\":null,\"title\":\"Willkommen\",\"slug\":\"homepage\",\"postDate\":1420042351,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"4\":[\"6\"],\"1\":\"<p>\\r\\n\\tDie shp m\\u00f6chte sich bei Ihnen vorstellen.\\r\\n<\\/p><p>\\r\\n\\tWir sind ein international t\\u00e4tiges Holzhandelsunternehmen mit Hauptsitz in \\u00d6sterreich. Handelsware sind Rohholz und Rohholzprodukte in den jeweiligen kundenspezifischen Ausformungen.\\r\\n<\\/p><p>\\r\\n\\tNeben unserer reinen Holzhandelst\\u00e4tigkeit bieten wir auch Dienstleistungen rund um Holz und Wald an. Genauere Informationen finden Sie auf den einzelnen Themenseiten.\\r\\n<\\/p><p>\\r\\n\\tOder Sie kontaktieren uns einfach!\\r\\n<\\/p><p>\\r\\n\\tGerhard Pipp\\r\\n\\t<br>\\r\\n\\tGesch\\u00e4ftsf\\u00fchrender Gesellschafter\\r\\n<\\/p>\"}}','2015-01-24 13:39:08','2015-01-24 13:39:08','8907d1b1-7373-4202-a2b3-0db009cb0a21'),(17,8,3,1,'de',1,'','{\"typeId\":\"3\",\"authorId\":null,\"title\":\"Unternehmen\",\"slug\":\"unternehmen\",\"postDate\":1420109041,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"4\":[\"9\"],\"1\":\"<p>\\r\\n\\tDie Vorg\\u00e4ngerfirma \\\"hwp holzverarbeitungs gmbh\\\" wurde im Jahre 2002 von drei Gesellschaftern gegr\\u00fcndet. In dieser Form bestand die Gesellschaft bis 2012.\\r\\n<\\/p><p>\\r\\n\\t2012 war auch das Jahr in dem eine Aufspaltung der hwp erfolgte, wobei die Stammfirma erhalten blieb und vom derzeitigen Gesellschafter Gerhard Pipp unter dem Namen shp holz gmbh bis heute weiter gef\\u00fchrt wird.\\r\\n<\\/p><p>\\r\\n\\tIm Jahr 2013 entstand ein Schwesterunternehmen, die \\r\\n\\t<strong>shp drewno<\\/strong> mit Firmenstandort R\\u00f3\\u017ca\\u0144sko<span><\\/span> in Polen.\\r\\n<\\/p><p>\\r\\n\\t<br>\\r\\n<\\/p>\"}}','2015-01-24 14:00:12','2015-01-24 14:00:12','922fa57d-f217-4c5b-9a14-c2a0a8c71736'),(18,8,3,1,'de',2,'','{\"typeId\":\"3\",\"authorId\":null,\"title\":\"Unternehmen\",\"slug\":\"unternehmen\",\"postDate\":1420109041,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"4\":[\"9\"],\"1\":\"<p>\\r\\n\\tDie Vorg\\u00e4ngerfirma \\\"hwp holzverarbeitungs gmbh\\\" wurde im Jahre 2002 von drei Gesellschaftern gegr\\u00fcndet. In dieser Form bestand die Gesellschaft bis 2012.\\r\\n<\\/p><p>\\r\\n\\t2012 war auch das Jahr in dem eine Aufspaltung der hwp erfolgte, wobei die Stammfirma erhalten blieb und vom derzeitigen Gesellschafter Gerhard Pipp unter dem Namen shp holz gmbh bis heute weiter gef\\u00fchrt wird.\\r\\n<\\/p><p>\\r\\n\\tIm Jahr 2013 entstand ein Schwesterunternehmen, die \\r\\n\\t<strong>shp drewno<\\/strong> mit Firmenstandort R\\u00f3\\u017ca\\u0144sko in Polen.\\r\\n<\\/p><p>\\r\\n\\t<br>\\r\\n<\\/p>\"}}','2015-01-24 14:00:20','2015-01-24 14:00:20','79e90149-c1b9-4949-9ed3-211f4beb4f59'),(19,8,3,1,'de',3,'','{\"typeId\":\"3\",\"authorId\":null,\"title\":\"Unternehmen\",\"slug\":\"unternehmen\",\"postDate\":1420109041,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"4\":[\"9\"],\"1\":\"<p>\\r\\n\\tDie Vorg\\u00e4ngerfirma \\\"hwp holzverarbeitungs gmbh\\\" wurde im Jahre 2002 von drei Gesellschaftern gegr\\u00fcndet. In dieser Form bestand die Gesellschaft bis 2012.\\r\\n<\\/p><p>\\r\\n\\t2012 war auch das Jahr in dem eine Aufspaltung der hwp erfolgte, wobei die Stammfirma erhalten blieb und vom derzeitigen Gesellschafter Gerhard Pipp unter dem Namen shp holz gmbh bis heute weiter gef\\u00fchrt wird.\\r\\n<\\/p><p>\\r\\n\\tIm Jahr 2013 entstand ein Schwesterunternehmen, die \\r\\n\\t<strong>shp drewno<\\/strong> mit Firmenstandort R\\u00f3\\u017ca\\u0144sko in Polen.\\r\\n<\\/p><p>\\r\\n\\t<br>\\r\\n<\\/p>\"}}','2015-01-24 14:00:47','2015-01-24 14:00:47','e5471796-06cf-4cc9-9cb2-16e82781d096'),(20,8,3,1,'de',4,'','{\"typeId\":\"3\",\"authorId\":null,\"title\":\"Unternehmen\",\"slug\":\"unternehmen\",\"postDate\":1420109041,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"4\":[\"9\"],\"1\":\"<p>\\r\\n\\tDie Vorg\\u00e4ngerfirma \\\"hwp holzverarbeitungs gmbh\\\" wurde im Jahre 2002 von drei Gesellschaftern gegr\\u00fcndet. In dieser Form bestand die Gesellschaft bis 2012.\\r\\n<\\/p><p>\\r\\n\\t2012 war auch das Jahr in dem eine Aufspaltung der hwp erfolgte, wobei die Stammfirma erhalten blieb und vom derzeitigen Gesellschafter Gerhard Pipp unter dem Namen shp holz gmbh bis heute weiter gef\\u00fchrt wird.\\r\\n<\\/p><p>\\r\\n\\tIm Jahr 2013 entstand ein Schwesterunternehmen, die \\r\\n\\t<strong>shp drewno<\\/strong> mit Firmenstandort R\\u00f3\\u017ca\\u0144sko in Polen.\\r\\n<\\/p><p>\\r\\n\\t<br>\\r\\n<\\/p>\"}}','2015-01-24 14:17:09','2015-01-24 14:17:09','36bd51c1-0ea2-4897-8872-2a6b16967aff'),(21,16,6,1,'de',2,'','{\"typeId\":\"7\",\"authorId\":\"1\",\"title\":\"\\u00d6sterreich\",\"slug\":\"\\u00f6sterreich\",\"postDate\":1420110240,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"4\":[\"15\"],\"8\":\"austria\"}}','2015-01-24 14:41:43','2015-01-24 14:41:43','cd7a1318-3e11-4bc6-8bc5-494bba24f3e7'),(22,18,6,1,'de',2,'','{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"DI Heribert Unkown\",\"slug\":\"di-heribert-unkown\",\"postDate\":1420110840,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"4\":[\"17\"],\"8\":\"austria\",\"1\":\"<p>Arbeitet.<\\/p>\",\"10\":\"DI Heribert Unkown\"}}','2015-01-24 14:41:48','2015-01-24 14:41:48','867f7256-8425-436b-9ce9-70c39f6641c0'),(23,18,6,1,'de',3,'','{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"DI Heribert Unkown\",\"slug\":\"di-heribert-unkown\",\"postDate\":1420110840,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"4\":[\"17\"],\"8\":\"austria\",\"1\":\"<p>Arbeitet.<\\/p>\",\"10\":\"DI Heribert Unkown\"}}','2015-01-24 14:42:08','2015-01-24 14:42:08','d2790109-132a-40f1-ac46-6f3f63f6b37f'),(24,16,6,1,'de',3,'','{\"typeId\":\"7\",\"authorId\":\"1\",\"title\":\"\\u00d6sterreich\",\"slug\":\"\\u00f6sterreich\",\"postDate\":1420110240,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"4\":[\"15\"],\"8\":\"austria\"}}','2015-01-24 14:43:02','2015-01-24 14:43:02','f6fab803-c505-43da-91ad-339019476d6c'),(25,18,6,1,'de',4,'','{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Brigitte Hebenstreit\",\"slug\":\"di-heribert-unkown\",\"postDate\":1420110840,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"4\":[\"17\"],\"8\":\"austria\",\"1\":\"<p>B\\u00fcroorganisation<\\/p><p>Tel: +43 664 854 78 51<\\/p><p>E-Mail:  b.hebenstreit@shp-holz.at<\\/p>\",\"10\":\"Brigitte Hebenstreit\"}}','2015-01-24 14:45:58','2015-01-24 14:45:58','eb56f74a-8972-481b-8909-7159e02f74f7'),(26,22,6,1,'de',1,'','{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"DI Gerhard Pipp\",\"slug\":\"di-gerhard-pipp\",\"postDate\":1422110820,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"4\":[\"17\"],\"8\":\"austria\",\"1\":\"<p>Gesch\\u00e4ftsf\\u00fchrender Gesellschafter<br>Tel: +43 664 506 03 72<br>E-mail: g.pipp@shp-holz.at<\\/p>\",\"10\":\"DI Gerhard Pipp\"}}','2015-01-24 14:48:07','2015-01-24 14:48:07','9f0a55f9-43b9-48fa-968a-f28fbe0978a5'),(27,18,6,1,'de',5,'','{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Brigitte Hebenstreit\",\"slug\":\"di-heribert-unkown\",\"postDate\":1420110840,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"4\":[\"17\"],\"8\":\"austria\",\"1\":\"<p>B\\u00fcroorganisation<br>Tel: +43 664 854 78 51<br>E-Mail:  b.hebenstreit@shp-holz.at<\\/p>\",\"10\":\"Brigitte Hebenstreit\"}}','2015-01-24 14:48:50','2015-01-24 14:48:50','7ac85725-4d4e-445a-af36-0fa3783eccdd'),(28,16,6,1,'de',4,'','{\"typeId\":\"7\",\"authorId\":\"1\",\"title\":\"\\u00d6sterreich\",\"slug\":\"\\u00f6sterreich\",\"postDate\":1420110240,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"4\":[\"15\"],\"8\":\"austria\"}}','2015-01-24 14:49:39','2015-01-24 14:49:39','f643df03-5ac0-46ec-948b-2dffa03a5198'),(29,23,6,1,'de',1,'','{\"typeId\":\"7\",\"authorId\":\"1\",\"title\":\"Deutschland\",\"slug\":\"germany\",\"postDate\":1422111024,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"4\":[\"15\"],\"8\":\"germany\"}}','2015-01-24 14:50:24','2015-01-24 14:50:24','6466c27f-b3d0-4abc-a885-ae210b2ae7a3'),(30,24,6,1,'de',1,'','{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Hans Henning Baake\",\"slug\":\"hans-henning-baake\",\"postDate\":1422111120,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"4\":[\"17\"],\"8\":\"germany\",\"1\":\"<p>Einkaufleitung Deutschland<br>Tel: +49 173 633 64 78<\\/p>\",\"10\":\"Hans Henning Baake\"}}','2015-01-24 14:52:58','2015-01-24 14:52:58','d6a424cc-1965-4878-bf49-a13c1b4814c5'),(31,24,6,1,'de',2,'','{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Hans Henning Baake\",\"slug\":\"hans-henning-baake\",\"postDate\":1422111120,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"4\":[\"17\"],\"8\":\"germany\",\"1\":\"<p>Einkaufsleitung Deutschland<br>Tel: +49 173 633 64 78<br>E-Mail: baake-breege@t-online.de<\\/p>\",\"10\":\"Hans Henning Baake\"}}','2015-01-24 14:53:59','2015-01-24 14:53:59','dae23f9a-c029-4396-ba70-b50d1d9f6b8d'),(32,25,6,1,'de',1,'','{\"typeId\":\"7\",\"authorId\":\"1\",\"title\":\"Polen\",\"slug\":\"polen\",\"postDate\":1422111329,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"4\":[\"15\"],\"8\":\"poland\"}}','2015-01-24 14:55:29','2015-01-24 14:55:29','6ed90295-1591-4949-8465-f857565da7dd'),(33,24,6,1,'de',3,'','{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Hans Henning Baake\",\"slug\":\"hans-henning-baake\",\"postDate\":1422111120,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"4\":[\"17\"],\"8\":\"germany\",\"1\":\"<p>Einkaufsleitung Deutschland<br>Tel: +49 173 633 64 78<br>E-Mail: baake-breege@t-online.de<\\/p>\",\"10\":\"Hans Henning Baake\"}}','2015-01-24 14:55:48','2015-01-24 14:55:48','0687fa22-f652-4991-bb22-7cdb2aa3803a'),(34,26,6,1,'de',1,'','{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Hans Henning Baake\",\"slug\":\"hans-henning-baake\",\"postDate\":1422111420,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"4\":[\"17\"],\"8\":\"poland\",\"1\":\"<p>Einkaufsleitung Polen<\\/p>Tel: +48 887 60 08 20<br>E-Mail: baake-breege@t-online.de\",\"10\":\"Hans Henning Baake\"}}','2015-01-24 14:57:18','2015-01-24 14:57:18','25de54b1-5719-45ef-9353-6f148fa29112'),(35,27,6,1,'de',1,'','{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Agata Kotyk\",\"slug\":\"agata-kotyk\",\"postDate\":1422111600,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"4\":[\"17\"],\"8\":\"poland\",\"1\":\"<p>Logistik<br>Tel: +48 887 70 08 10<br>E-Mail: shp.holz.polen@gmail.at<\\/p>\",\"10\":\"Agata Kotyk\"}}','2015-01-24 15:00:22','2015-01-24 15:00:22','9998a109-ce92-4d31-b1c2-eef9228e0141'),(36,28,6,1,'de',1,'','{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Illona Poplawska\",\"slug\":\"illona-poplawska\",\"postDate\":1422111712,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"4\":[\"17\"],\"8\":\"poland\",\"1\":\"<p>Buchhaltung<br>Tel: +48 887 700 830<br>E-Mail: shp.holz.polen@gmail.com<\\/p>\",\"10\":\"Illona Poplawska\"}}','2015-01-24 15:01:52','2015-01-24 15:01:52','81e02f4a-4c5b-4e75-8fb5-01900a2eda07');
/*!40000 ALTER TABLE `craft_entryversions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_fieldgroups`
--

DROP TABLE IF EXISTS `craft_fieldgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_fieldgroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_fieldgroups_name_unq_idx` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_fieldgroups`
--

LOCK TABLES `craft_fieldgroups` WRITE;
/*!40000 ALTER TABLE `craft_fieldgroups` DISABLE KEYS */;
INSERT INTO `craft_fieldgroups` VALUES (1,'Standard','2014-12-31 14:08:16','2014-12-31 14:08:16','5f5a1726-f68b-424c-9400-f293ed481b45'),(2,'Adresse','2014-12-31 15:44:54','2014-12-31 15:47:18','b4162d57-aa48-4be7-95a9-0172ae380b3d'),(3,'Visitenkarte','2014-12-31 15:47:32','2014-12-31 15:47:32','082c6f73-9413-4c43-b54b-27e569019864');
/*!40000 ALTER TABLE `craft_fieldgroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_fieldlayoutfields`
--

DROP TABLE IF EXISTS `craft_fieldlayoutfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_fieldlayoutfields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `sortOrder` tinyint(4) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_fieldlayoutfields_layoutId_fieldId_unq_idx` (`layoutId`,`fieldId`),
  KEY `craft_fieldlayoutfields_sortOrder_idx` (`sortOrder`),
  KEY `craft_fieldlayoutfields_tabId_fk` (`tabId`),
  KEY `craft_fieldlayoutfields_fieldId_fk` (`fieldId`),
  CONSTRAINT `craft_fieldlayoutfields_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fieldlayoutfields_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fieldlayoutfields_tabId_fk` FOREIGN KEY (`tabId`) REFERENCES `craft_fieldlayouttabs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_fieldlayoutfields`
--

LOCK TABLES `craft_fieldlayoutfields` WRITE;
/*!40000 ALTER TABLE `craft_fieldlayoutfields` DISABLE KEYS */;
INSERT INTO `craft_fieldlayoutfields` VALUES (2,5,2,1,1,1,'2014-12-31 14:08:17','2014-12-31 14:08:17','1a86a507-04d8-4cd1-aa07-a1ed971607c9'),(3,5,2,2,0,2,'2014-12-31 14:08:17','2014-12-31 14:08:17','4079befa-4af1-41d6-9d15-74b376e8d3eb'),(7,10,6,3,0,1,'2014-12-31 14:59:41','2014-12-31 14:59:41','e56128cd-44a2-4bc2-aa40-87053d4cf0e8'),(9,12,8,3,0,1,'2014-12-31 15:13:06','2014-12-31 15:13:06','beb28946-6822-41f7-9433-378c91a925b5'),(30,20,13,9,0,1,'2014-12-31 15:55:45','2014-12-31 15:55:45','5c826e6c-2260-4073-835e-f0103975d8bb'),(31,20,13,10,0,2,'2014-12-31 15:55:45','2014-12-31 15:55:45','5165db47-0a69-4379-af95-907154ea64aa'),(32,20,13,11,0,3,'2014-12-31 15:55:45','2014-12-31 15:55:45','2794299c-01c0-4e0c-8c31-bda08a69d016'),(33,20,13,12,0,4,'2014-12-31 15:55:45','2014-12-31 15:55:45','e542c99e-692c-4bd4-aab0-ded4f2b86db6'),(34,20,13,8,0,5,'2014-12-31 15:55:45','2014-12-31 15:55:45','f00187b3-4a1a-4d9a-a141-76b611834f39'),(35,20,13,7,0,6,'2014-12-31 15:55:45','2014-12-31 15:55:45','b8c7f90c-c807-4257-9a78-43f58b8a1fb0'),(36,20,13,6,0,7,'2014-12-31 15:55:45','2014-12-31 15:55:45','eee41905-8279-4bcf-aa2c-010177ce049d'),(37,20,13,5,0,8,'2014-12-31 15:55:45','2014-12-31 15:55:45','974f1fc9-f341-4e10-9463-2bb9715dcf6b'),(42,24,16,1,1,1,'2014-12-31 16:13:29','2014-12-31 16:13:29','eb45710f-9dad-49bd-aa12-a0dd4f61df8d'),(43,24,16,4,1,2,'2014-12-31 16:13:29','2014-12-31 16:13:29','bc014cdd-ed93-4fe6-bf73-8dd483257f95'),(44,25,17,4,1,1,'2014-12-31 16:13:40','2014-12-31 16:13:40','635b2331-88a2-48b4-8e13-6f1d5ef5e424'),(45,25,17,1,1,2,'2014-12-31 16:13:40','2014-12-31 16:13:40','5ca79fe4-6915-4aea-8e56-98bf538d2ec5'),(50,30,20,4,1,1,'2014-12-31 18:47:48','2014-12-31 18:47:48','a6a31216-ea4c-4f12-9358-e3cba3cd2239'),(51,30,20,1,1,2,'2014-12-31 18:47:48','2014-12-31 18:47:48','cec4f7ee-368c-4a82-8161-b0108b6053d6'),(52,31,21,4,1,1,'2014-12-31 18:49:00','2014-12-31 18:49:00','70d4f60d-b32f-4ea2-bd71-4bc79223e4be'),(53,31,21,1,1,2,'2014-12-31 18:49:00','2014-12-31 18:49:00','d054bc5a-72f6-4a10-9522-7af387f476a4'),(60,35,24,8,0,1,'2015-01-01 10:49:22','2015-01-01 10:49:22','b0fcbaac-6e96-4bd6-a4b0-4b51cadc4f72'),(61,35,24,4,0,2,'2015-01-01 10:49:22','2015-01-01 10:49:22','6b1bef9c-ca45-42b5-8cde-0fd87b71659f'),(62,36,25,4,1,1,'2015-01-01 10:49:47','2015-01-01 10:49:47','4a9a5153-45d9-4e23-9644-abeb932650d7'),(63,36,25,8,1,2,'2015-01-01 10:49:47','2015-01-01 10:49:47','384aa45c-4f34-4418-ad9b-0a7502bb2ff9'),(64,36,25,10,1,3,'2015-01-01 10:49:47','2015-01-01 10:49:47','75c40a71-d345-4daf-90bd-de0fe3fe881b'),(65,36,25,1,0,4,'2015-01-01 10:49:47','2015-01-01 10:49:47','f9ce22a3-6bdd-4026-a721-6bc8fdb6f78d'),(70,39,27,11,0,1,'2015-01-01 11:30:33','2015-01-01 11:30:33','1a2b2f00-f664-4202-a148-a2b959326fc4'),(71,39,27,6,0,2,'2015-01-01 11:30:33','2015-01-01 11:30:33','5c32fcbd-c5db-4b7f-8b79-ff5d751f6e6b'),(72,39,27,5,0,3,'2015-01-01 11:30:33','2015-01-01 11:30:33','232c265a-7cdd-43c1-90b3-2e13c5651621'),(73,39,27,7,0,4,'2015-01-01 11:30:33','2015-01-01 11:30:33','897f2b5b-424e-434d-be2a-8a5f71e7c803'),(74,39,27,14,0,5,'2015-01-01 11:30:33','2015-01-01 11:30:33','71a94327-5ae9-4aed-9508-fb3cb7386d79');
/*!40000 ALTER TABLE `craft_fieldlayoutfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_fieldlayouts`
--

DROP TABLE IF EXISTS `craft_fieldlayouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_fieldlayouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_fieldlayouts_type_idx` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_fieldlayouts`
--

LOCK TABLES `craft_fieldlayouts` WRITE;
/*!40000 ALTER TABLE `craft_fieldlayouts` DISABLE KEYS */;
INSERT INTO `craft_fieldlayouts` VALUES (1,'Tag','2014-12-31 14:08:16','2014-12-31 14:08:16','85d43867-861c-4328-bcc1-4083fbed7b7a'),(5,'Entry','2014-12-31 14:08:17','2014-12-31 14:08:17','968ef92e-35b2-4ab6-9110-ee26276b8f90'),(10,'GlobalSet','2014-12-31 14:59:41','2014-12-31 14:59:41','c859ea33-931c-4a53-9610-38becc13d163'),(12,'GlobalSet','2014-12-31 15:13:06','2014-12-31 15:13:06','02f22516-1b9d-40cf-b1bc-b07a0f883222'),(14,'Asset','2014-12-31 15:22:53','2014-12-31 15:22:53','6bf62682-a7a7-4cd4-aaac-db4d9307315f'),(20,'GlobalSet','2014-12-31 15:55:45','2014-12-31 15:55:45','c40dde7f-344b-4938-8923-54167fe2b520'),(24,'Entry','2014-12-31 16:13:29','2014-12-31 16:13:29','347c6e29-84d1-4a6f-8192-55c3605472fe'),(25,'Entry','2014-12-31 16:13:40','2014-12-31 16:13:40','512946f1-90dd-442f-93c4-06585b485fe7'),(30,'Entry','2014-12-31 18:47:48','2014-12-31 18:47:48','0f5c3ce6-3e66-4170-bdfb-f0a052aecc60'),(31,'Entry','2014-12-31 18:49:00','2014-12-31 18:49:00','99f7c72a-44ee-4216-85b8-3cb532a3291d'),(35,'Entry','2015-01-01 10:49:22','2015-01-01 10:49:22','61fc1cd9-31d8-4e65-bd9c-5d8b4bd1924d'),(36,'Entry','2015-01-01 10:49:47','2015-01-01 10:49:47','8e417893-dbe3-49db-bfe6-f2d3f5628c50'),(39,'Entry','2015-01-01 11:30:33','2015-01-01 11:30:33','626f4911-edbf-40ab-ac92-a76a0632bf40');
/*!40000 ALTER TABLE `craft_fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_fieldlayouttabs`
--

DROP TABLE IF EXISTS `craft_fieldlayouttabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_fieldlayouttabs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` tinyint(4) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_fieldlayouttabs_sortOrder_idx` (`sortOrder`),
  KEY `craft_fieldlayouttabs_layoutId_fk` (`layoutId`),
  CONSTRAINT `craft_fieldlayouttabs_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_fieldlayouttabs`
--

LOCK TABLES `craft_fieldlayouttabs` WRITE;
/*!40000 ALTER TABLE `craft_fieldlayouttabs` DISABLE KEYS */;
INSERT INTO `craft_fieldlayouttabs` VALUES (2,5,'Inhalt',1,'2014-12-31 14:08:17','2014-12-31 14:08:17','5a872e04-a204-443a-9546-a097dfbff17d'),(6,10,'Inhalt',1,'2014-12-31 14:59:41','2014-12-31 14:59:41','6d62d17f-9965-4f20-97ab-eb97ad33ba1d'),(8,12,'Inhalt',1,'2014-12-31 15:13:06','2014-12-31 15:13:06','272e67fc-5f0e-481a-b72d-ccb076a77668'),(13,20,'Inhalt',1,'2014-12-31 15:55:45','2014-12-31 15:55:45','2978b51c-7b45-4db2-9959-b758a77e2121'),(16,24,'Inhalt',1,'2014-12-31 16:13:29','2014-12-31 16:13:29','95a61c3f-4b63-4656-94c8-ccfac3b5f37e'),(17,25,'Inhalt',1,'2014-12-31 16:13:40','2014-12-31 16:13:40','5e559754-464a-482e-973c-2d6cb41f98cd'),(20,30,'Inhalt',1,'2014-12-31 18:47:48','2014-12-31 18:47:48','d27a19be-7981-44fc-94b6-5d5e780e968f'),(21,31,'Inhalt',1,'2014-12-31 18:49:00','2014-12-31 18:49:00','932dae62-aa9c-403e-9338-18c27caf40aa'),(24,35,'Inhalt',1,'2015-01-01 10:49:22','2015-01-01 10:49:22','51a4b0ca-4b7a-4dfa-b905-034900c08e68'),(25,36,'Person',1,'2015-01-01 10:49:47','2015-01-01 10:49:47','64077e3e-cd3d-4a14-bf2d-ccfa1e50a19e'),(27,39,'Inhalt',1,'2015-01-01 11:30:33','2015-01-01 11:30:33','eb938bee-ee30-4ab0-8236-b5608a498bce');
/*!40000 ALTER TABLE `craft_fieldlayouttabs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_fields`
--

DROP TABLE IF EXISTS `craft_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(58) COLLATE utf8_unicode_ci NOT NULL,
  `context` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'global',
  `instructions` text COLLATE utf8_unicode_ci,
  `translatable` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_fields_handle_context_unq_idx` (`handle`,`context`),
  KEY `craft_fields_context_idx` (`context`),
  KEY `craft_fields_groupId_fk` (`groupId`),
  CONSTRAINT `craft_fields_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_fieldgroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_fields`
--

LOCK TABLES `craft_fields` WRITE;
/*!40000 ALTER TABLE `craft_fields` DISABLE KEYS */;
INSERT INTO `craft_fields` VALUES (1,1,'Text','body','global',NULL,1,'RichText','{\"configFile\":\"Standard.json\",\"columnType\":\"text\"}','2014-12-31 14:08:16','2014-12-31 14:08:16','5f941545-6d6e-415a-87b1-dda1bff92e94'),(2,1,'Tags','tags','global',NULL,0,'Tags','{\"source\":\"taggroup:1\"}','2014-12-31 14:08:16','2014-12-31 14:08:16','a2e66229-ca8c-4316-bb0a-20e11f554f64'),(3,1,'Nur-Text','textonly','global','',0,'PlainText','{\"placeholder\":\"URL eingeben...\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2014-12-31 14:58:41','2014-12-31 15:10:10','34e1cc13-abd1-4c8f-80f4-d87c47f77d0e'),(4,1,'Bild','image','global','',0,'Assets','{\"useSingleFolder\":\"\",\"sources\":[\"folder:1\"],\"defaultUploadLocationSource\":\"1\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"1\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":\"\",\"limit\":\"\"}','2014-12-31 15:27:04','2014-12-31 18:39:31','dc1bf2c9-2f4f-4482-b61e-9e0129f8bfea'),(5,2,'Straße','streetaddress','global','',0,'PlainText','{\"placeholder\":\"Beispielweg 42\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2014-12-31 15:45:22','2014-12-31 15:45:22','af5852f5-b40a-49b6-b447-86472c6cfe89'),(6,2,'Stadt','locality','global','',0,'PlainText','{\"placeholder\":\"Beispielhausen\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2014-12-31 15:45:54','2014-12-31 15:45:54','c28d5066-7bac-427e-b465-ba99f4af6e3e'),(7,2,'Postleitzahl','postalcode','global','',0,'PlainText','{\"placeholder\":\"8442\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2014-12-31 15:46:18','2014-12-31 15:46:18','eb9a92c2-35e6-4362-baa3-3dd16c0c560f'),(8,2,'Land','countryname','global','',0,'PlainText','{\"placeholder\":\"Chinesien\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2014-12-31 15:46:58','2014-12-31 15:49:04','a800437c-93f0-4740-a00c-e454db0fea3c'),(9,3,'Organisation','org','global','',0,'PlainText','{\"placeholder\":\"Beispiel AG\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2014-12-31 15:48:18','2015-01-01 11:28:41','5998fc11-77ea-45ed-a7e1-5ae6de13f7ef'),(10,3,'Vollständiger Name','fn','global','',0,'PlainText','{\"placeholder\":\"DI Heribert Baumf\\u00e4ller\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2014-12-31 15:49:28','2014-12-31 15:55:24','8e981299-ceaf-40db-9034-ff97be6005b4'),(11,3,'Telfonnummer','tel','global','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2014-12-31 15:50:08','2014-12-31 15:50:08','f19f5a97-b7f3-4da9-9e9a-55954ebcc49f'),(12,3,'UID','uidinternational','global','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2014-12-31 15:50:49','2014-12-31 15:50:49','d5772fbb-1ad6-4fe1-bd6d-9c83445927f9'),(14,3,'Email','email','global','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2015-01-01 11:29:29','2015-01-01 11:30:05','b8f4a069-87c3-4000-ba8b-16371c622da9');
/*!40000 ALTER TABLE `craft_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_globalsets`
--

DROP TABLE IF EXISTS `craft_globalsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_globalsets` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int(10) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_globalsets_name_unq_idx` (`name`),
  UNIQUE KEY `craft_globalsets_handle_unq_idx` (`handle`),
  KEY `craft_globalsets_fieldLayoutId_fk` (`fieldLayoutId`),
  CONSTRAINT `craft_globalsets_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_globalsets_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_globalsets`
--

LOCK TABLES `craft_globalsets` WRITE;
/*!40000 ALTER TABLE `craft_globalsets` DISABLE KEYS */;
INSERT INTO `craft_globalsets` VALUES (4,'url','url',10,'2014-12-31 14:49:48','2014-12-31 14:59:41','ae961d7f-f725-4bde-ac31-33093959c2c1'),(5,'untertitel','subtitle',12,'2014-12-31 15:04:51','2014-12-31 15:13:06','a3e7dd4b-573f-4eaa-addd-1be56e835072'),(7,'fußzeile','footer',20,'2014-12-31 15:44:38','2014-12-31 15:55:45','d3e5076a-c952-4c2d-a114-2ba91813aa9c');
/*!40000 ALTER TABLE `craft_globalsets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_info`
--

DROP TABLE IF EXISTS `craft_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `build` int(11) unsigned NOT NULL,
  `schemaVersion` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `releaseDate` datetime NOT NULL,
  `edition` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `siteName` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `siteUrl` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `timezone` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `on` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `maintenance` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `track` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_info`
--

LOCK TABLES `craft_info` WRITE;
/*!40000 ALTER TABLE `craft_info` DISABLE KEYS */;
INSERT INTO `craft_info` VALUES (1,'2.3',2621,'2.3.1','2014-12-22 18:56:52',2,'shp holz gmbh','http://craft.dev','UTC',1,0,'stable','2014-12-31 14:08:15','2014-12-31 16:26:38','a946e9c8-de48-4608-b144-aa4fdc161f97');
/*!40000 ALTER TABLE `craft_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_locales`
--

DROP TABLE IF EXISTS `craft_locales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_locales` (
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` tinyint(4) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`locale`),
  KEY `craft_locales_sortOrder_idx` (`sortOrder`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_locales`
--

LOCK TABLES `craft_locales` WRITE;
/*!40000 ALTER TABLE `craft_locales` DISABLE KEYS */;
INSERT INTO `craft_locales` VALUES ('de',1,'2014-12-31 14:08:15','2014-12-31 14:08:15','009fb8f4-5f9f-407a-b5cf-b6a7c6344d39'),('pl',2,'2015-01-01 11:37:12','2015-01-01 11:37:12','85cbbda2-d3e4-4f3f-88f1-3caff62954e8');
/*!40000 ALTER TABLE `craft_locales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_matrixblocks`
--

DROP TABLE IF EXISTS `craft_matrixblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_matrixblocks` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) DEFAULT NULL,
  `sortOrder` tinyint(4) DEFAULT NULL,
  `ownerLocale` char(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_matrixblocks_ownerId_idx` (`ownerId`),
  KEY `craft_matrixblocks_fieldId_idx` (`fieldId`),
  KEY `craft_matrixblocks_typeId_idx` (`typeId`),
  KEY `craft_matrixblocks_sortOrder_idx` (`sortOrder`),
  KEY `craft_matrixblocks_ownerLocale_fk` (`ownerLocale`),
  CONSTRAINT `craft_matrixblocks_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_matrixblocks_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_matrixblocks_ownerId_fk` FOREIGN KEY (`ownerId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_matrixblocks_ownerLocale_fk` FOREIGN KEY (`ownerLocale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_matrixblocks_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `craft_matrixblocktypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_matrixblocks`
--

LOCK TABLES `craft_matrixblocks` WRITE;
/*!40000 ALTER TABLE `craft_matrixblocks` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_matrixblocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_matrixblocktypes`
--

DROP TABLE IF EXISTS `craft_matrixblocktypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_matrixblocktypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` tinyint(4) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_matrixblocktypes_name_fieldId_unq_idx` (`name`,`fieldId`),
  UNIQUE KEY `craft_matrixblocktypes_handle_fieldId_unq_idx` (`handle`,`fieldId`),
  KEY `craft_matrixblocktypes_fieldId_fk` (`fieldId`),
  KEY `craft_matrixblocktypes_fieldLayoutId_fk` (`fieldLayoutId`),
  CONSTRAINT `craft_matrixblocktypes_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_matrixblocktypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_matrixblocktypes`
--

LOCK TABLES `craft_matrixblocktypes` WRITE;
/*!40000 ALTER TABLE `craft_matrixblocktypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_matrixblocktypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_migrations`
--

DROP TABLE IF EXISTS `craft_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pluginId` int(11) DEFAULT NULL,
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_migrations_version_unq_idx` (`version`),
  KEY `craft_migrations_pluginId_fk` (`pluginId`),
  CONSTRAINT `craft_migrations_pluginId_fk` FOREIGN KEY (`pluginId`) REFERENCES `craft_plugins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_migrations`
--

LOCK TABLES `craft_migrations` WRITE;
/*!40000 ALTER TABLE `craft_migrations` DISABLE KEYS */;
INSERT INTO `craft_migrations` VALUES (1,NULL,'m000000_000000_base','2014-12-31 14:08:15','2014-12-31 14:08:15','2014-12-31 14:08:15','532aa610-d14e-45c0-8f0a-05a789e07f92'),(2,NULL,'m140730_000001_add_filename_and_format_to_transformindex','2014-12-31 14:08:15','2014-12-31 14:08:15','2014-12-31 14:08:15','2c93d225-646b-4bd4-92dd-5e7a805047db'),(3,NULL,'m140815_000001_add_format_to_transforms','2014-12-31 14:08:15','2014-12-31 14:08:15','2014-12-31 14:08:15','c5732e7d-4235-4d63-8e72-3a02adbe05aa'),(4,NULL,'m140822_000001_allow_more_than_128_items_per_field','2014-12-31 14:08:15','2014-12-31 14:08:15','2014-12-31 14:08:15','274b73a1-86d0-4d7d-8afd-8e935d87034e'),(5,NULL,'m140829_000001_single_title_formats','2014-12-31 14:08:15','2014-12-31 14:08:15','2014-12-31 14:08:15','729e36ae-b764-41a9-9719-71396d46850b'),(6,NULL,'m140831_000001_extended_cache_keys','2014-12-31 14:08:15','2014-12-31 14:08:15','2014-12-31 14:08:15','14f32398-ff02-4254-a5ab-9c68db28146e'),(7,NULL,'m140922_000001_delete_orphaned_matrix_blocks','2014-12-31 14:08:15','2014-12-31 14:08:15','2014-12-31 14:08:15','8beb4666-947b-4a9d-84d2-543ee0cb33b3'),(8,NULL,'m141008_000001_elements_index_tune','2014-12-31 14:08:15','2014-12-31 14:08:15','2014-12-31 14:08:15','36a56038-51e8-4907-8a25-c1e44c8d8890'),(9,NULL,'m141009_000001_assets_source_handle','2014-12-31 14:08:15','2014-12-31 14:08:15','2014-12-31 14:08:15','dd00203b-81fc-4a10-934b-b57837858cdd'),(10,NULL,'m141024_000001_field_layout_tabs','2014-12-31 14:08:15','2014-12-31 14:08:15','2014-12-31 14:08:15','8b76dbe2-2337-46fe-8e73-aea142b15186'),(11,NULL,'m141030_000001_drop_structure_move_permission','2014-12-31 14:08:15','2014-12-31 14:08:15','2014-12-31 14:08:15','c0384645-3f8f-46b0-9b9f-9b41e05e8913'),(12,NULL,'m141103_000001_tag_titles','2014-12-31 14:08:15','2014-12-31 14:08:15','2014-12-31 14:08:15','0d4ce409-36c9-4936-a1d0-8f655316f08c'),(13,NULL,'m141109_000001_user_status_shuffle','2014-12-31 14:08:15','2014-12-31 14:08:15','2014-12-31 14:08:15','2b8ac8ad-002b-4897-b522-f0ca254851e7'),(14,NULL,'m141126_000001_user_week_start_day','2014-12-31 14:08:15','2014-12-31 14:08:15','2014-12-31 14:08:15','71b165df-add2-46a5-aaef-af26e705e56f');
/*!40000 ALTER TABLE `craft_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_plugins`
--

DROP TABLE IF EXISTS `craft_plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `version` char(15) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `settings` text COLLATE utf8_unicode_ci,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_plugins`
--

LOCK TABLES `craft_plugins` WRITE;
/*!40000 ALTER TABLE `craft_plugins` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_plugins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_rackspaceaccess`
--

DROP TABLE IF EXISTS `craft_rackspaceaccess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_rackspaceaccess` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `connectionKey` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `storageUrl` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cdnUrl` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_rackspaceaccess_connectionKey_unq_idx` (`connectionKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_rackspaceaccess`
--

LOCK TABLES `craft_rackspaceaccess` WRITE;
/*!40000 ALTER TABLE `craft_rackspaceaccess` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_rackspaceaccess` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_relations`
--

DROP TABLE IF EXISTS `craft_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceLocale` char(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_relations_fieldId_sourceId_sourceLocale_targetId_unq_idx` (`fieldId`,`sourceId`,`sourceLocale`,`targetId`),
  KEY `craft_relations_sourceId_fk` (`sourceId`),
  KEY `craft_relations_sourceLocale_fk` (`sourceLocale`),
  KEY `craft_relations_targetId_fk` (`targetId`),
  CONSTRAINT `craft_relations_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_relations_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_relations_sourceLocale_fk` FOREIGN KEY (`sourceLocale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_relations_targetId_fk` FOREIGN KEY (`targetId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_relations`
--

LOCK TABLES `craft_relations` WRITE;
/*!40000 ALTER TABLE `craft_relations` DISABLE KEYS */;
INSERT INTO `craft_relations` VALUES (9,4,11,NULL,6,1,'2014-12-31 18:32:12','2014-12-31 18:32:12','80104fbe-5938-4768-884a-6a87d48e896a'),(10,4,10,NULL,9,1,'2014-12-31 18:32:19','2014-12-31 18:32:19','3579e7db-1988-4955-ac9d-0dde8d17d211'),(19,4,2,NULL,6,1,'2015-01-24 13:39:08','2015-01-24 13:39:08','1dadde55-ae40-4161-933c-e490cdb8d16b'),(23,4,8,NULL,9,1,'2015-01-24 14:17:09','2015-01-24 14:17:09','07b00399-725a-444f-9759-6f790b8b6548'),(25,4,12,NULL,6,1,'2015-01-24 14:31:26','2015-01-24 14:31:26','f5173f62-4eab-4b73-ad87-4b6334311c0f'),(26,4,14,NULL,13,1,'2015-01-24 14:38:39','2015-01-24 14:38:39','1c407245-0a3a-4913-ba1e-7d496cbbaecb'),(27,4,21,NULL,13,1,'2015-01-24 14:41:26','2015-01-24 14:41:26','1631b955-16b5-4584-b68f-2ccfc2dbe2af'),(33,4,22,NULL,17,1,'2015-01-24 14:48:07','2015-01-24 14:48:07','46153e3c-e93a-46bd-aba0-44e77f85c2cb'),(34,4,18,NULL,17,1,'2015-01-24 14:48:50','2015-01-24 14:48:50','1d086966-70a6-4cf2-b649-aca774a1fbc1'),(35,4,16,NULL,15,1,'2015-01-24 14:49:39','2015-01-24 14:49:39','62e895b5-d2f9-483e-ac8b-766e81e1cd2f'),(36,4,23,NULL,15,1,'2015-01-24 14:50:24','2015-01-24 14:50:24','c86dac51-2715-4a53-91ba-7c56c75e7812'),(39,4,25,NULL,15,1,'2015-01-24 14:55:29','2015-01-24 14:55:29','fe1b8eba-dfd9-4640-9292-f910f4781e58'),(40,4,24,NULL,17,1,'2015-01-24 14:55:48','2015-01-24 14:55:48','e1af45ba-f6a9-4bf9-ad34-6ae70bba0968'),(41,4,26,NULL,17,1,'2015-01-24 14:57:18','2015-01-24 14:57:18','d64a0e86-0b76-499b-a373-69be68e19560'),(42,4,27,NULL,17,1,'2015-01-24 15:00:22','2015-01-24 15:00:22','dc477ddf-a653-4bb3-b3ec-0c31fe5c8d48'),(43,4,28,NULL,17,1,'2015-01-24 15:01:52','2015-01-24 15:01:52','8575bbe1-d355-495d-9ebb-bdf10f300844');
/*!40000 ALTER TABLE `craft_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_routes`
--

DROP TABLE IF EXISTS `craft_routes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_routes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locale` char(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `urlParts` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `urlPattern` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `template` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` tinyint(4) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_routes_urlPattern_unq_idx` (`urlPattern`),
  KEY `craft_routes_locale_idx` (`locale`),
  CONSTRAINT `craft_routes_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_routes`
--

LOCK TABLES `craft_routes` WRITE;
/*!40000 ALTER TABLE `craft_routes` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_routes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_searchindex`
--

DROP TABLE IF EXISTS `craft_searchindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `fieldId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `keywords` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`locale`),
  FULLTEXT KEY `craft_searchindex_keywords_idx` (`keywords`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_searchindex`
--

LOCK TABLES `craft_searchindex` WRITE;
/*!40000 ALTER TABLE `craft_searchindex` DISABLE KEYS */;
INSERT INTO `craft_searchindex` VALUES (1,'username',0,'de',' admin '),(1,'firstname',0,'de',''),(1,'lastname',0,'de',''),(1,'fullname',0,'de',''),(1,'email',0,'de',' christoph minixhofer gmail com '),(1,'slug',0,'de',''),(2,'field',1,'de',' die shp moechte sich bei ihnen vorstellen wir sind ein international taetiges holzhandelsunternehmen mit hauptsitz in österreich handelsware sind rohholz und rohholzprodukte in den jeweiligen kundenspezifischen ausformungen neben unserer reinen holzhandelstaetigkeit bieten wir auch dienstleistungen rund um holz und wald an genauere informationen finden sie auf den einzelnen themenseiten oder sie kontaktieren uns einfach gerhard pipp geschaeftsfuehrender gesellschafter '),(2,'slug',0,'de',' homepage '),(2,'title',0,'de',' willkommen '),(15,'slug',0,'de',' map austria '),(15,'title',0,'de',' map austria '),(16,'field',8,'de',' austria '),(16,'field',4,'de',' map austria '),(16,'slug',0,'de',' oesterreich '),(16,'title',0,'de',' österreich '),(17,'filename',0,'de',' 128 jpg '),(17,'extension',0,'de',' jpg '),(17,'kind',0,'de',' image '),(17,'slug',0,'de',' 128 '),(17,'title',0,'de',' 128 '),(18,'field',4,'de',' 128 '),(18,'field',8,'de',' austria '),(15,'kind',0,'de',' image '),(15,'extension',0,'de',' png '),(15,'filename',0,'de',' map austria png '),(4,'slug',0,'de',''),(4,'field',1,'de',' http 1d0be github io shp holz '),(4,'field',3,'de',' http 1d0be github io shp holz '),(5,'field',1,'de',' holz gmbh '),(5,'slug',0,'de',''),(5,'field',3,'de',' holz gmbh '),(6,'filename',0,'de',' index image png '),(6,'extension',0,'de',' png '),(6,'kind',0,'de',' image '),(6,'slug',0,'de',' index image '),(6,'title',0,'de',' index image '),(2,'field',4,'de',' index image '),(7,'slug',0,'de',''),(7,'field',9,'de',' shp holz gmbh '),(7,'field',10,'de',' di gerhard pipp '),(7,'field',11,'de',' 43 31 66 93 38 90 '),(7,'field',12,'de',' atu 55070602 '),(7,'field',8,'de',' austria '),(7,'field',7,'de',' 8046 '),(7,'field',6,'de',' graz '),(7,'field',5,'de',' andritzer reichsstrasse 162 '),(7,'field',13,'de',' pipp '),(8,'slug',0,'de',' unternehmen '),(8,'title',0,'de',' unternehmen '),(9,'filename',0,'de',' company jpg '),(9,'extension',0,'de',' jpg '),(9,'kind',0,'de',' image '),(9,'slug',0,'de',' company '),(9,'title',0,'de',' company '),(8,'field',4,'de',' company '),(8,'field',1,'de',' die vorgaengerfirma hwp holzverarbeitungs gmbh wurde im jahre 2002 von drei gesellschaftern gegruendet in dieser form bestand die gesellschaft bis 2012 2012 war auch das jahr in dem eine aufspaltung der hwp erfolgte wobei die stammfirma erhalten blieb und vom derzeitigen gesellschafter gerhard pipp unter dem namen shp holz gmbh bis heute weiter gefuehrt wird im jahr 2013 entstand ein schwesterunternehmen die shp drewno mit firmenstandort rożańsko in polen '),(10,'field',4,'de',' company '),(10,'field',1,'de',' distinctively re engineer revolutionary meta services and premium architectures intrinsically incubate intuitive opportunities and real time potentialities appropriately communicate one to one technology after plug and play networks quickly aggregate b2b users and worldwide potentialities progressively plagiarize resource leveling e commerce through resource leveling core competencies '),(10,'slug',0,'de',' ipsum1 '),(10,'title',0,'de',' ipsum1 '),(11,'field',4,'de',' index image '),(11,'field',1,'de',' progressively plagiarize resource leveling e commerce through resource leveling core competencies dramatically mesh low risk high yield alignments before transparent e tailers appropriately empower dynamic leadership skills after business portals globally myocardinate interactive supply chains with distinctive quality vectors globally revolutionize global sources through interoperable services '),(11,'slug',0,'de',' ispum2 '),(11,'title',0,'de',' ispum2 '),(12,'field',4,'de',' index image '),(12,'field',1,'de',' wir liefern sowohl nadel als auch laubholzsortimente nach den anforderungen des jeweiligen kunden zum beispiel gemaess den oesterreichischen holzhandelsusancengemaess den heilbronner sortierklassen fuer langholz '),(12,'slug',0,'de',' rundholz fuer die saegeindustrie '),(12,'title',0,'de',' rundholz fuer die saegeindustrie '),(13,'filename',0,'de',' 6260730214_61c9e39a45_b jpg '),(13,'extension',0,'de',' jpg '),(13,'kind',0,'de',' image '),(13,'slug',0,'de',' 6260730214 61c9e39a45 b '),(13,'title',0,'de',' 6260730214 61c9e39a45 b '),(14,'field',4,'de',' 6260730214 61c9e39a45 b '),(14,'field',1,'de',' in den qualitaeten fuer deutschland is und in mdf qualitaet und osb qualitaet fuer österreichfaser und schleifholz '),(21,'field',4,'de',' 6260730214 61c9e39a45 b '),(21,'field',1,'de',' energieholz in form vonlangholz und energiehackgut fuer heizwerkelangholz fuer die brennholzerzeugungwaldhackgut fuer heizwerkebrennholz ofenfertig in grossmengenpellets und briketts '),(14,'slug',0,'de',' industrieholz fuer die papier und plattenindustrie '),(14,'title',0,'de',' industrieholz fuer die papier und plattenindustrie '),(18,'field',10,'de',' brigitte hebenstreit '),(18,'field',1,'de',' bueroorganisationtel 43 664 854 78 51e mail b hebenstreit shp holz at '),(18,'slug',0,'de',' di heribert unkown '),(18,'title',0,'de',' brigitte hebenstreit '),(20,'field',14,'de',' example example com '),(20,'field',7,'de',' 8010 '),(20,'field',6,'de',' graz '),(20,'field',5,'de',' diverser weg 1 '),(20,'field',11,'de',' 43 316 123456789 '),(20,'slug',0,'de',' impressum '),(20,'title',0,'de',' impressum '),(4,'field',3,'pl',' http 1d0be github io shp holz '),(5,'field',3,'pl',' holz gmbh '),(7,'field',9,'pl',' shp holz gmbh '),(7,'field',10,'pl',' di gerhard pipp '),(7,'field',11,'pl',' 43 31 66 93 38 90 '),(7,'field',12,'pl',' atu 55070602 '),(7,'field',8,'pl',' austria '),(7,'field',7,'pl',' 8046 '),(7,'field',6,'pl',' graz '),(7,'field',5,'pl',' andritzer reichsstrasse 162 '),(21,'slug',0,'de',' energieholz '),(21,'title',0,'de',' energieholz '),(22,'field',4,'de',' 128 '),(22,'field',8,'de',' austria '),(22,'field',10,'de',' di gerhard pipp '),(22,'field',1,'de',' geschaeftsfuehrender gesellschaftertel 43 664 506 03 72e mail g pipp shp holz at '),(22,'slug',0,'de',''),(22,'title',0,'de',' di gerhard pipp '),(23,'field',8,'de',' germany '),(23,'field',4,'de',' map austria '),(23,'slug',0,'de',' germany '),(23,'title',0,'de',' deutschland '),(24,'field',4,'de',' 128 '),(24,'field',8,'de',' germany '),(24,'field',10,'de',' hans henning baake '),(24,'field',1,'de',' einkaufsleitung deutschlandtel 49 173 633 64 78e mail baake breege t online de '),(24,'slug',0,'de',' hans henning baake '),(24,'title',0,'de',' hans henning baake '),(25,'field',8,'de',' poland '),(25,'field',4,'de',' map austria '),(25,'slug',0,'de',' polen '),(25,'title',0,'de',' polen '),(26,'field',4,'de',' 128 '),(26,'field',8,'de',' poland '),(26,'field',10,'de',' hans henning baake '),(26,'field',1,'de',' einkaufsleitung polentel 48 887 60 08 20e mail baake breege t online de '),(26,'slug',0,'de',''),(26,'title',0,'de',' hans henning baake '),(27,'field',4,'de',' 128 '),(27,'field',8,'de',' poland '),(27,'field',10,'de',' agata kotyk '),(27,'field',1,'de',' logistiktel 48 887 70 08 10e mail shp holz polen gmail at '),(27,'slug',0,'de',''),(27,'title',0,'de',' agata kotyk '),(28,'field',4,'de',' 128 '),(28,'field',8,'de',' poland '),(28,'field',10,'de',' illona poplawska '),(28,'field',1,'de',' buchhaltungtel 48 887 700 830e mail shp holz polen gmail com '),(28,'slug',0,'de',''),(28,'title',0,'de',' illona poplawska ');
/*!40000 ALTER TABLE `craft_searchindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_sections`
--

DROP TABLE IF EXISTS `craft_sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('single','channel','structure') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'channel',
  `hasUrls` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `template` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enableVersioning` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_sections_name_unq_idx` (`name`),
  UNIQUE KEY `craft_sections_handle_unq_idx` (`handle`),
  KEY `craft_sections_structureId_fk` (`structureId`),
  CONSTRAINT `craft_sections_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `craft_structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_sections`
--

LOCK TABLES `craft_sections` WRITE;
/*!40000 ALTER TABLE `craft_sections` DISABLE KEYS */;
INSERT INTO `craft_sections` VALUES (1,NULL,'Homepage','homepage','single',1,'index',1,'2014-12-31 14:08:16','2014-12-31 16:12:31','9c8b62ae-d652-4363-b933-a6d65c30eeed'),(3,NULL,'Unternehmen','unternehmen','single',1,'index',1,'2014-12-31 16:11:41','2015-01-01 10:44:01','2c726bb6-5f8e-441a-a984-f1e921896ad6'),(4,NULL,'Dienstleistungen','dienstleistungen','channel',0,NULL,1,'2014-12-31 18:24:16','2014-12-31 18:24:16','aa44f906-1ce8-4226-885f-d98b35617ef1'),(5,NULL,'Produkte','produkte','channel',0,NULL,0,'2014-12-31 18:47:18','2014-12-31 18:47:18','67f1719e-5c3e-41e4-865a-3def1fcd1422'),(6,NULL,'Kontakt','kontakt','channel',0,NULL,1,'2015-01-01 10:43:45','2015-01-01 10:43:45','176ee9d5-6157-48e5-8153-f6ee394dc3bd'),(7,NULL,'Impressum','impressum','single',1,'impressum',1,'2015-01-01 11:27:24','2015-01-01 11:27:24','c3ed0084-b8b9-4a69-bcd4-f1f128df1c4e');
/*!40000 ALTER TABLE `craft_sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_sections_i18n`
--

DROP TABLE IF EXISTS `craft_sections_i18n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_sections_i18n` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `enabledByDefault` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `urlFormat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nestedUrlFormat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_sections_i18n_sectionId_locale_unq_idx` (`sectionId`,`locale`),
  KEY `craft_sections_i18n_locale_fk` (`locale`),
  CONSTRAINT `craft_sections_i18n_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_sections_i18n_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_sections_i18n`
--

LOCK TABLES `craft_sections_i18n` WRITE;
/*!40000 ALTER TABLE `craft_sections_i18n` DISABLE KEYS */;
INSERT INTO `craft_sections_i18n` VALUES (1,1,'de',0,'__home__',NULL,'2014-12-31 14:08:16','2014-12-31 15:26:10','c096b67f-dcf8-4f6e-b08f-53d997e56baf'),(3,3,'de',0,'unternehmen',NULL,'2014-12-31 16:11:41','2014-12-31 16:11:41','ac8e2ba5-bb57-465c-904f-206f78d258e2'),(4,4,'de',0,NULL,NULL,'2014-12-31 18:24:16','2014-12-31 18:24:16','2f15a93d-870e-4a86-b3b1-289978b155ed'),(5,5,'de',0,NULL,NULL,'2014-12-31 18:47:18','2014-12-31 18:47:18','1dd1b2d0-7205-4876-81f3-e832bb9a867c'),(6,6,'de',0,NULL,NULL,'2015-01-01 10:43:45','2015-01-01 10:43:45','bfd085cf-e52a-4f6f-be63-a710ddd4ed5c'),(7,7,'de',0,'impressum',NULL,'2015-01-01 11:27:24','2015-01-01 11:27:24','16348949-dca0-403e-9df9-02c419f5d41f');
/*!40000 ALTER TABLE `craft_sections_i18n` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_sessions`
--

DROP TABLE IF EXISTS `craft_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `token` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_sessions_uid_idx` (`uid`),
  KEY `craft_sessions_token_idx` (`token`),
  KEY `craft_sessions_dateUpdated_idx` (`dateUpdated`),
  KEY `craft_sessions_userId_fk` (`userId`),
  CONSTRAINT `craft_sessions_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_sessions`
--

LOCK TABLES `craft_sessions` WRITE;
/*!40000 ALTER TABLE `craft_sessions` DISABLE KEYS */;
INSERT INTO `craft_sessions` VALUES (1,1,'934a33812c1d74eecfaf0456c03f1c01a8c6a90eczozNjoiYmFiNzM1ODAtZTMwNC00N2YzLWE5MTEtNjBhZGQyZjI2MTM2Ijs=','2014-12-31 14:08:16','2014-12-31 14:08:16','ef0f88b5-bc53-4fb9-b35f-4f21ee766c1a'),(2,1,'e5374384d9f1fc4597a86505aa4b89f21b062d06czozNjoiOWUwOWE1MGYtOWZlNS00ZTRiLWIwNjYtN2U2NmFkOGIyNmZlIjs=','2014-12-31 18:04:07','2014-12-31 18:04:07','0051e810-2b22-4b43-b2b9-6dce96368b6f'),(3,1,'09b39d879ee388b5a58471aa545e2b768219537eczozNjoiMTM5MWVmN2YtZDc2MC00NzEyLWJjOTQtOTFlYWIyZmNkNjJjIjs=','2014-12-31 20:59:51','2014-12-31 20:59:51','0c99a482-fec9-4979-8862-351b39208bda'),(4,1,'5ec1667fdfa7d0d058bc2c5512c7f1ac7b8d1a12czozNjoiYmU2N2JjNmMtZjFiYS00ZTI2LTljM2YtMGZlZDM1ZGY5NjExIjs=','2015-01-01 10:39:42','2015-01-01 10:39:42','91d004cc-5f07-4b30-829c-9e81c9b4fb79');
/*!40000 ALTER TABLE `craft_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_shunnedmessages`
--

DROP TABLE IF EXISTS `craft_shunnedmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_shunnedmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_shunnedmessages_userId_message_unq_idx` (`userId`,`message`),
  CONSTRAINT `craft_shunnedmessages_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_shunnedmessages`
--

LOCK TABLES `craft_shunnedmessages` WRITE;
/*!40000 ALTER TABLE `craft_shunnedmessages` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_shunnedmessages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_structureelements`
--

DROP TABLE IF EXISTS `craft_structureelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_structureelements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) unsigned DEFAULT NULL,
  `lft` int(11) unsigned NOT NULL,
  `rgt` int(11) unsigned NOT NULL,
  `level` smallint(6) unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_structureelements_structureId_elementId_unq_idx` (`structureId`,`elementId`),
  KEY `craft_structureelements_root_idx` (`root`),
  KEY `craft_structureelements_lft_idx` (`lft`),
  KEY `craft_structureelements_rgt_idx` (`rgt`),
  KEY `craft_structureelements_level_idx` (`level`),
  KEY `craft_structureelements_elementId_fk` (`elementId`),
  CONSTRAINT `craft_structureelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_structureelements_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `craft_structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_structureelements`
--

LOCK TABLES `craft_structureelements` WRITE;
/*!40000 ALTER TABLE `craft_structureelements` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_structureelements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_structures`
--

DROP TABLE IF EXISTS `craft_structures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_structures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_structures`
--

LOCK TABLES `craft_structures` WRITE;
/*!40000 ALTER TABLE `craft_structures` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_structures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_systemsettings`
--

DROP TABLE IF EXISTS `craft_systemsettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_systemsettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_systemsettings_category_unq_idx` (`category`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_systemsettings`
--

LOCK TABLES `craft_systemsettings` WRITE;
/*!40000 ALTER TABLE `craft_systemsettings` DISABLE KEYS */;
INSERT INTO `craft_systemsettings` VALUES (1,'email','{\"protocol\":\"php\",\"emailAddress\":\"christoph.minixhofer@gmail.com\",\"senderName\":\"shp holz gmbh\"}','2014-12-31 14:08:16','2014-12-31 14:08:16','ec343469-5769-4525-8044-e2d0e2ce21dc');
/*!40000 ALTER TABLE `craft_systemsettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_taggroups`
--

DROP TABLE IF EXISTS `craft_taggroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_taggroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int(10) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_taggroups_name_unq_idx` (`name`),
  UNIQUE KEY `craft_taggroups_handle_unq_idx` (`handle`),
  KEY `craft_taggroups_fieldLayoutId_fk` (`fieldLayoutId`),
  CONSTRAINT `craft_taggroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_taggroups`
--

LOCK TABLES `craft_taggroups` WRITE;
/*!40000 ALTER TABLE `craft_taggroups` DISABLE KEYS */;
INSERT INTO `craft_taggroups` VALUES (1,'Standard','default',1,'2014-12-31 14:08:16','2014-12-31 14:08:16','886d56a3-319e-42d8-9d97-f01362302929');
/*!40000 ALTER TABLE `craft_taggroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_tags`
--

DROP TABLE IF EXISTS `craft_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_tags_groupId_fk` (`groupId`),
  CONSTRAINT `craft_tags_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_taggroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_tags_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_tags`
--

LOCK TABLES `craft_tags` WRITE;
/*!40000 ALTER TABLE `craft_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_tasks`
--

DROP TABLE IF EXISTS `craft_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `root` int(11) unsigned DEFAULT NULL,
  `lft` int(11) unsigned NOT NULL,
  `rgt` int(11) unsigned NOT NULL,
  `level` smallint(6) unsigned NOT NULL,
  `currentStep` int(11) unsigned DEFAULT NULL,
  `totalSteps` int(11) unsigned DEFAULT NULL,
  `status` enum('pending','error','running') COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_tasks_root_idx` (`root`),
  KEY `craft_tasks_lft_idx` (`lft`),
  KEY `craft_tasks_rgt_idx` (`rgt`),
  KEY `craft_tasks_level_idx` (`level`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_tasks`
--

LOCK TABLES `craft_tasks` WRITE;
/*!40000 ALTER TABLE `craft_tasks` DISABLE KEYS */;
INSERT INTO `craft_tasks` VALUES (13,10,2,1,1,4,9,'error','ResaveElements',NULL,'{\"elementType\":\"Entry\",\"criteria\":{\"locale\":\"de\",\"status\":null,\"localeEnabled\":null}}','2015-01-01 11:37:13','2015-01-01 11:37:13','d33a032b-603f-470d-811c-e2aec83fd092');
/*!40000 ALTER TABLE `craft_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_templatecachecriteria`
--

DROP TABLE IF EXISTS `craft_templatecachecriteria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_templatecachecriteria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cacheId` int(11) NOT NULL,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `criteria` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `craft_templatecachecriteria_cacheId_fk` (`cacheId`),
  KEY `craft_templatecachecriteria_type_idx` (`type`),
  CONSTRAINT `craft_templatecachecriteria_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `craft_templatecaches` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_templatecachecriteria`
--

LOCK TABLES `craft_templatecachecriteria` WRITE;
/*!40000 ALTER TABLE `craft_templatecachecriteria` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_templatecachecriteria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_templatecacheelements`
--

DROP TABLE IF EXISTS `craft_templatecacheelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_templatecacheelements` (
  `cacheId` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  KEY `craft_templatecacheelements_cacheId_fk` (`cacheId`),
  KEY `craft_templatecacheelements_elementId_fk` (`elementId`),
  CONSTRAINT `craft_templatecacheelements_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `craft_templatecaches` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_templatecacheelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_templatecacheelements`
--

LOCK TABLES `craft_templatecacheelements` WRITE;
/*!40000 ALTER TABLE `craft_templatecacheelements` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_templatecacheelements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_templatecaches`
--

DROP TABLE IF EXISTS `craft_templatecaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_templatecaches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cacheKey` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `body` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `craft_templatecaches_expiryDate_cacheKey_locale_path_idx` (`expiryDate`,`cacheKey`,`locale`,`path`),
  KEY `craft_templatecaches_locale_fk` (`locale`),
  CONSTRAINT `craft_templatecaches_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_templatecaches`
--

LOCK TABLES `craft_templatecaches` WRITE;
/*!40000 ALTER TABLE `craft_templatecaches` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_templatecaches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_tokens`
--

DROP TABLE IF EXISTS `craft_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `route` text COLLATE utf8_unicode_ci,
  `usageLimit` tinyint(3) unsigned DEFAULT NULL,
  `usageCount` tinyint(3) unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_tokens_token_unq_idx` (`token`),
  KEY `craft_tokens_expiryDate_idx` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_tokens`
--

LOCK TABLES `craft_tokens` WRITE;
/*!40000 ALTER TABLE `craft_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_usergroups`
--

DROP TABLE IF EXISTS `craft_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_usergroups`
--

LOCK TABLES `craft_usergroups` WRITE;
/*!40000 ALTER TABLE `craft_usergroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_usergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_usergroups_users`
--

DROP TABLE IF EXISTS `craft_usergroups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_usergroups_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_usergroups_users_groupId_userId_unq_idx` (`groupId`,`userId`),
  KEY `craft_usergroups_users_userId_fk` (`userId`),
  CONSTRAINT `craft_usergroups_users_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_usergroups_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_usergroups_users`
--

LOCK TABLES `craft_usergroups_users` WRITE;
/*!40000 ALTER TABLE `craft_usergroups_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_usergroups_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_userpermissions`
--

DROP TABLE IF EXISTS `craft_userpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_userpermissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_userpermissions_name_unq_idx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_userpermissions`
--

LOCK TABLES `craft_userpermissions` WRITE;
/*!40000 ALTER TABLE `craft_userpermissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_userpermissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_userpermissions_usergroups`
--

DROP TABLE IF EXISTS `craft_userpermissions_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_userpermissions_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_userpermissions_usergroups_permissionId_groupId_unq_idx` (`permissionId`,`groupId`),
  KEY `craft_userpermissions_usergroups_groupId_fk` (`groupId`),
  CONSTRAINT `craft_userpermissions_usergroups_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_userpermissions_usergroups_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `craft_userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_userpermissions_usergroups`
--

LOCK TABLES `craft_userpermissions_usergroups` WRITE;
/*!40000 ALTER TABLE `craft_userpermissions_usergroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_userpermissions_usergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_userpermissions_users`
--

DROP TABLE IF EXISTS `craft_userpermissions_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_userpermissions_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_userpermissions_users_permissionId_userId_unq_idx` (`permissionId`,`userId`),
  KEY `craft_userpermissions_users_userId_fk` (`userId`),
  CONSTRAINT `craft_userpermissions_users_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `craft_userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_userpermissions_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_userpermissions_users`
--

LOCK TABLES `craft_userpermissions_users` WRITE;
/*!40000 ALTER TABLE `craft_userpermissions_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_userpermissions_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_users`
--

DROP TABLE IF EXISTS `craft_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `photo` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `firstName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `preferredLocale` char(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `weekStartDay` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `admin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `client` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `locked` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `suspended` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pending` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `archived` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIPAddress` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(4) unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `verificationCode` char(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `passwordResetRequired` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_users_username_unq_idx` (`username`),
  UNIQUE KEY `craft_users_email_unq_idx` (`email`),
  KEY `craft_users_verificationCode_idx` (`verificationCode`),
  KEY `craft_users_uid_idx` (`uid`),
  KEY `craft_users_preferredLocale_fk` (`preferredLocale`),
  CONSTRAINT `craft_users_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_users_preferredLocale_fk` FOREIGN KEY (`preferredLocale`) REFERENCES `craft_locales` (`locale`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_users`
--

LOCK TABLES `craft_users` WRITE;
/*!40000 ALTER TABLE `craft_users` DISABLE KEYS */;
INSERT INTO `craft_users` VALUES (1,'admin',NULL,NULL,NULL,'christoph.minixhofer@gmail.com','$2a$13$uRIQVXkc0/.dWzCyq7HyL.11htsN4/R9YHTSDi24q6GH7xQV7cOpy',NULL,0,1,0,0,0,0,0,'2015-01-10 14:40:29','10.0.2.2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'2014-12-31 14:08:16','2014-12-31 14:08:16','2015-01-10 14:40:29','954d7593-668c-4e2c-9e0e-879cb3d152b6');
/*!40000 ALTER TABLE `craft_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_widgets`
--

DROP TABLE IF EXISTS `craft_widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` tinyint(4) DEFAULT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_widgets_userId_fk` (`userId`),
  CONSTRAINT `craft_widgets_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_widgets`
--

LOCK TABLES `craft_widgets` WRITE;
/*!40000 ALTER TABLE `craft_widgets` DISABLE KEYS */;
INSERT INTO `craft_widgets` VALUES (1,1,'RecentEntries',1,NULL,1,'2014-12-31 14:08:19','2014-12-31 14:08:19','671c289b-9391-428c-8b51-2e970bcbb440'),(2,1,'GetHelp',2,NULL,1,'2014-12-31 14:08:19','2014-12-31 14:08:19','a78f42bc-6646-44aa-ad88-d8cb4962f9e8'),(3,1,'Updates',3,NULL,1,'2014-12-31 14:08:19','2014-12-31 14:08:19','ef1dbf3d-40cc-4522-8f33-c130fa0c9d8e'),(4,1,'Feed',4,'{\"url\":\"http:\\/\\/feeds.feedburner.com\\/blogandtonic\",\"title\":\"Blog & Tonic\"}',1,'2014-12-31 14:08:19','2014-12-31 14:08:19','529d1d30-0afc-403a-a75b-f558328bdd3b');
/*!40000 ALTER TABLE `craft_widgets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-01-30 12:41:24
