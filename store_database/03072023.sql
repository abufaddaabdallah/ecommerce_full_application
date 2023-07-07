-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 167.99.251.167    Database: ecommerce
-- ------------------------------------------------------
-- Server version	8.0.33-0ubuntu0.22.10.2

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
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `building_no` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_id_idx` (`order_id`),
  CONSTRAINT `fk_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (57,60,'35.935171879827976','31.8650700160803','Amman','Jordan','Kherbat as-Souk','VW8M+2W4','','2023-05-31 20:27:21','2023-05-31 20:27:21',NULL),(58,61,'35.9388418123126','31.865001391811216','Amman','Jordan','Kherbat as-Souk','VW7Q+VCR','','2023-06-02 15:34:31','2023-06-02 15:34:31',NULL),(59,62,'35.93708261847496','31.866381270825954','Amman','Jordan','Kherbat as-Souk','VW8P+8VW','','2023-06-02 17:45:34','2023-06-02 17:45:34',NULL),(60,63,'35.93703232705593','31.860359595993835','Amman','Jordan','Kherbat as-Souk','VW6P+6PJ','','2023-06-13 09:27:59','2023-06-13 09:27:59',NULL),(61,64,'35.93191400170326','31.861465606711537','Amman','Jordan','Kherbat as-Souk','VW6J+VQF','','2023-06-13 11:23:34','2023-06-13 11:23:34',NULL),(62,65,'35.93856353312731','31.861060108957098','Amman','Jordan','Kherbat as-Souk','VW6P+9V4','','2023-06-13 11:49:50','2023-06-13 11:49:50',NULL),(63,66,'35.936814062297344','31.859796618913077','Amman','Jordan','Kherbat as-Souk','ش. آمنة بنت الأرقم، عمّان،، VW5P+WFQ','','2023-06-13 11:51:15','2023-06-13 11:51:15',NULL),(64,67,'35.93438230454922','31.865821462721385','Amman','Jordan','Kherbat as-Souk','ش. دار السلام،، VW8M+FPW','','2023-06-13 15:29:10','2023-06-13 15:29:10',NULL),(65,68,'35.934519432485104','31.865735754262825','Amman','Jordan','Kherbat as-Souk','ش. دار السلام،، VW8M+FPW','','2023-06-13 15:35:53','2023-06-13 15:35:53',NULL),(66,69,'35.93757413327694','31.891633450471648','Amman','Jordan','Al Qweismeh','الجويدة،، VWRP+WQ6','','2023-06-14 11:29:19','2023-06-14 11:29:19',NULL),(67,70,'35.93679394572973','31.85975333474635','Amman','Jordan','Kherbat as-Souk','ش. آمنة بنت الأرقم، عمّان،، VW5P+WFQ','','2023-06-14 11:30:16','2023-06-14 11:30:16',NULL),(68,71,'35.93680165708065','31.85976159291132','Amman','Jordan','Kherbat as-Souk','ش. آمنة بنت الأرقم، عمّان،، VW5P+WFQ','','2023-06-14 11:30:45','2023-06-14 11:30:45',NULL),(69,72,'35.93679562211037','31.859782665466827','Amman','Jordan','Kherbat as-Souk','ش. آمنة بنت الأرقم، عمّان،، VW5P+WFQ','','2023-06-14 11:35:03','2023-06-14 11:35:03',NULL),(70,73,'35.93679562211037','31.859782665466827','Amman','Jordan','Kherbat as-Souk','ش. آمنة بنت الأرقم، عمّان،، VW5P+WFQ','','2023-06-14 11:37:41','2023-06-14 11:37:41',NULL),(71,74,'35.93353372067213','31.86663867890483','Amman','Jordan','Kherbat as-Souk','VW8M+PQM','','2023-06-14 11:43:55','2023-06-14 11:43:55',NULL),(72,75,'35.93417476862669','31.85657958175621','Amman','Jordan','Kherbat as-Souk','VW4M+GPC','','2023-06-14 12:21:22','2023-06-14 12:21:22',NULL),(73,76,'35.93439906835556','31.862280013947863','Amman','Jordan','Kherbat as-Souk','VW6M+RPW','','2023-06-14 21:22:49','2023-06-14 21:22:49',NULL),(74,77,'35.93439906835556','31.862280013947863','Amman','Jordan','Kherbat as-Souk','VW6M+RPW','','2023-06-14 21:24:42','2023-06-14 21:24:42',NULL),(75,78,'35.93697801232338','31.86089608688686','Amman','Jordan','Kherbat as-Souk','VW6P+9V4','','2023-06-15 03:41:38','2023-06-15 03:41:38',NULL),(76,79,'35.93697801232338','31.86089608688686','Amman','Jordan','Kherbat as-Souk','VW6P+9V4','','2023-06-15 03:42:05','2023-06-15 03:42:05',NULL),(77,80,'35.93697801232338','31.86089608688686','Amman','Jordan','Kherbat as-Souk','VW6P+9V4','','2023-06-15 03:43:41','2023-06-15 03:43:41',NULL),(78,81,'36.01850710809231','32.007720577057896','Russeifa','Jordan','','الرصيفة،، 2259+373','','2023-06-15 08:21:58','2023-06-15 08:21:58',NULL),(79,82,'35.93722879886627','31.86049912948826','Amman','Jordan','Kherbat as-Souk','VW6P+9V4','','2023-06-15 08:22:20','2023-06-15 08:22:20',NULL),(80,83,'36.01925678551197','32.012677892608544','Russeifa','Jordan','','2279+5VC','','2023-06-15 08:25:19','2023-06-15 08:25:19',NULL),(81,84,'36.01925678551197','32.012677892608544','Russeifa','Jordan','','2279+5VC','','2023-06-15 08:26:54','2023-06-15 08:26:54',NULL),(82,85,'35.93722879886627','31.86049912948826','Amman','Jordan','Kherbat as-Souk','VW6P+9V4','','2023-06-15 08:27:56','2023-06-15 08:27:56',NULL),(83,86,'35.936845','31.8597812','Amman','Jordan','Kherbat as-Souk','ش. آمنة بنت الأرقم، عمّان،، VW5P+WFQ',NULL,'2023-06-15 09:00:34','2023-06-15 09:00:34',NULL),(84,87,'35.9368605','31.8597839','Amman','Jordan','Kherbat as-Souk','ش. آمنة بنت الأرقم، عمّان،، VW5P+WFQ',NULL,'2023-06-16 15:21:09','2023-06-16 15:21:09',NULL),(85,88,'35.9368454','31.8597835','Amman','Jordan','Kherbat as-Souk','ش. آمنة بنت الأرقم، عمّان،، VW5P+WFQ',NULL,'2023-06-16 15:21:25','2023-06-16 15:21:25',NULL),(86,89,'35.9368442','31.859783','Amman','Jordan','Kherbat as-Souk','ش. آمنة بنت الأرقم، عمّان،، VW5P+WFQ',NULL,'2023-06-16 15:21:59','2023-06-16 15:21:59',NULL),(87,90,'35.93687977641821','31.85979035410073','Amman','Jordan','Kherbat as-Souk','ش. آمنة بنت الأرقم، عمّان،، VW5P+WFQ',NULL,'2023-06-16 16:16:16','2023-06-16 16:16:16',NULL),(88,91,'35.935581251978874','31.859208009457546','Amman','Jordan','Kherbat as-Souk','VW5P+M6P',NULL,'2023-06-16 16:19:07','2023-06-16 16:19:07',NULL),(89,92,'35.9368412','31.8597814','Amman','Jordan','Kherbat as-Souk','ش. آمنة بنت الأرقم، عمّان،، VW5P+WFQ',NULL,'2023-06-16 16:37:18','2023-06-16 16:37:18',NULL),(90,93,'35.9368437','31.8597829','Amman','Jordan','Kherbat as-Souk','ش. آمنة بنت الأرقم، عمّان،، VW5P+WFQ',NULL,'2023-06-16 16:39:29','2023-06-16 16:39:29',NULL),(91,94,'35.936845','31.8597811','Amman','Jordan','Kherbat as-Souk','ش. آمنة بنت الأرقم، عمّان،، VW5P+WFQ',NULL,'2023-06-16 16:41:13','2023-06-16 16:41:13',NULL),(92,95,'35.9368528','31.8597795','Amman','Jordan','Kherbat as-Souk','ش. آمنة بنت الأرقم، عمّان،، VW5P+WFQ',NULL,'2023-06-16 16:42:07','2023-06-16 16:42:07',NULL),(93,96,'35.9368487','31.8597804','Amman','Jordan','Kherbat as-Souk','ش. آمنة بنت الأرقم، عمّان،، VW5P+WFQ',NULL,'2023-06-16 16:42:48','2023-06-16 16:42:48',NULL),(94,97,'35.9368456','31.8597814','Amman','Jordan','Kherbat as-Souk','ش. آمنة بنت الأرقم، عمّان،، VW5P+WFQ',NULL,'2023-06-16 16:44:33','2023-06-16 16:44:33',NULL),(95,98,'35.9368439','31.8597809','Amman','Jordan','Kherbat as-Souk','ش. آمنة بنت الأرقم، عمّان،، VW5P+WFQ',NULL,'2023-06-16 16:46:53','2023-06-16 16:46:53',NULL),(96,99,'35.9368456','31.8597815','Amman','Jordan','Kherbat as-Souk','ش. آمنة بنت الأرقم، عمّان،، VW5P+WFQ',NULL,'2023-06-16 16:48:11','2023-06-16 16:48:11',NULL),(97,100,'35.936843','31.8597819','Amman','Jordan','Kherbat as-Souk','ش. آمنة بنت الأرقم، عمّان،، VW5P+WFQ',NULL,'2023-06-16 16:51:35','2023-06-16 16:51:35',NULL),(98,101,'35.9368479','31.8597814','Amman','Jordan','Kherbat as-Souk','ش. آمنة بنت الأرقم، عمّان،، VW5P+WFQ',NULL,'2023-06-16 16:54:26','2023-06-16 16:54:26',NULL),(99,102,'35.936845','31.8597802','Amman','Jordan','Kherbat as-Souk','ش. آمنة بنت الأرقم، عمّان،، VW5P+WFQ',NULL,'2023-06-16 16:55:16','2023-06-16 16:55:16',NULL),(100,103,'35.9368456','31.8597812','Amman','Jordan','Kherbat as-Souk','ش. آمنة بنت الأرقم، عمّان،، VW5P+WFQ',NULL,'2023-06-16 16:58:46','2023-06-16 16:58:46',NULL),(101,104,'35.9368434','31.8597834','Amman','Jordan','Kherbat as-Souk','ش. آمنة بنت الأرقم، عمّان،، VW5P+WFQ',NULL,'2023-06-16 18:19:47','2023-06-16 18:19:47',NULL),(102,105,'35.9368592','31.8597812','Amman','Jordan','Kherbat as-Souk','ش. آمنة بنت الأرقم، عمّان،، VW5P+WFQ',NULL,'2023-06-21 14:44:34','2023-06-21 14:44:34',NULL),(103,106,'35.9368586','31.8597791','عمّان','الأردن','منطقة خريبة السوق','ش. آمنة بنت الأرقم، عمّان،، VW5P+WFQ، عمّان، الأردن',NULL,'2023-06-21 15:26:59','2023-06-21 15:26:59',NULL),(104,107,'35.9368598','31.8597803','عمّان','الأردن','منطقة خريبة السوق','ش. آمنة بنت الأرقم، عمّان،، VW5P+WFQ، عمّان، الأردن',NULL,'2023-06-21 15:45:42','2023-06-21 15:45:42',NULL),(105,108,'35.93687541782856','31.85979889702656','Amman','Jordan','Kherbat as-Souk','ش. آمنة بنت الأرقم، عمّان،، VW5P+WFQ',NULL,'2023-06-21 15:59:35','2023-06-21 15:59:35',NULL),(106,109,'35.05451213568449','29.58050503211376','Aqaba','Jordan','aqaba','Al Shamiyah - الشامية، H3J4+92J',NULL,'2023-06-21 16:21:10','2023-06-21 16:21:10',NULL),(107,110,'35.9368591','31.8597805','Amman ','Jordan ','jawa','jawa',NULL,'2023-06-22 21:03:40','2023-06-22 21:03:40',NULL),(108,111,'35.936851277947426','31.859783804523733','Amman','Jordan','Kherbat as-Souk','ش. آمنة بنت الأرقم، عمّان،، VW5P+WFQ',NULL,'2023-06-22 21:10:20','2023-06-22 21:10:20',NULL),(109,112,'35.9368575','31.8597802','Amman','Jordan','Kherbat as-Souk','ش. آمنة بنت الأرقم، عمّان،، VW5P+WFQ',NULL,'2023-06-24 11:42:11','2023-06-24 11:42:11',NULL),(110,113,'35.9368591','31.8597797','Amman','Jordan','Kherbat as-Souk','ش. آمنة بنت الأرقم، عمّان،، VW5P+WFQ',NULL,'2023-06-24 20:26:37','2023-06-24 20:26:37',NULL),(111,114,'35.9368588','31.8597798','Amman','Jordan','Kherbat as-Souk','ش. آمنة بنت الأرقم، عمّان،، VW5P+WFQ',NULL,'2023-06-24 20:27:22','2023-06-24 20:27:22',NULL),(112,115,'35.85317775607109','31.996444009911784','Amman','Jordan','Tla al-Ali','Wasfi At-Tall St. 249',NULL,'2023-06-25 10:23:48','2023-06-25 10:23:48',NULL),(113,116,'35.926063768565655','31.86996327882186','Amman','Jordan','Kherbat as-Souk','شارع البلدية القديم - خريبة السوق، VWCG+4F3',NULL,'2023-06-30 18:40:52','2023-06-30 18:40:52',NULL),(114,117,'35.92876508831978','31.869403777208543','Amman','Jordan','Kherbat as-Souk','ش. خريبة السوق، عمّان،، Amman',NULL,'2023-06-30 19:24:05','2023-06-30 19:24:05',NULL),(115,118,'35.9259594976902','31.87039350904984','Amman','Jordan','Kherbat as-Souk','Kasseb Al-Jazi St. 17',NULL,'2023-06-30 20:50:01','2023-06-30 20:50:01',NULL);
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adonis_schema`
--

DROP TABLE IF EXISTS `adonis_schema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adonis_schema` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `batch` int NOT NULL,
  `migration_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adonis_schema`
--

LOCK TABLES `adonis_schema` WRITE;
/*!40000 ALTER TABLE `adonis_schema` DISABLE KEYS */;
INSERT INTO `adonis_schema` VALUES (1,'database/migrations/1680294383556_users',1,'2023-05-11 11:51:25'),(2,'database/migrations/1683745689564_api_tokens',2,'2023-05-11 11:59:43'),(3,'database/migrations/1683806264847_api_tokens',3,'2023-05-11 12:01:16');
/*!40000 ALTER TABLE `adonis_schema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adonis_schema_versions`
--

DROP TABLE IF EXISTS `adonis_schema_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adonis_schema_versions` (
  `version` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adonis_schema_versions`
--

LOCK TABLES `adonis_schema_versions` WRITE;
/*!40000 ALTER TABLE `adonis_schema_versions` DISABLE KEYS */;
INSERT INTO `adonis_schema_versions` VALUES (2);
/*!40000 ALTER TABLE `adonis_schema_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_tokens`
--

DROP TABLE IF EXISTS `api_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_tokens` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id_2` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `api_tokens_user_id_2_foreign` (`user_id_2`),
  CONSTRAINT `api_tokens_user_id_2_foreign` FOREIGN KEY (`user_id_2`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_tokens`
--

LOCK TABLES `api_tokens` WRITE;
/*!40000 ALTER TABLE `api_tokens` DISABLE KEYS */;
INSERT INTO `api_tokens` VALUES (1,2,'Opaque Access Token','api','7072438a332dacc75ca69b98f3ad6d858da1b912a4b067111248fcde8aff570c',NULL,'2023-05-11 12:49:40','2023-05-11 12:49:40',NULL),(2,2,'Opaque Access Token','api','053285da9b3c0ed882dfd9c63f569aa0ffcd262f7b299b9347d6a59f8032bddf',NULL,'2023-05-13 06:36:42','2023-05-13 06:36:42',NULL),(3,2,'Opaque Access Token','api','aad95e90128ec1266ec3e01bb11ead09eddf283807e61a0399c2db04ba6274ee',NULL,'2023-05-14 20:07:50','2023-05-14 20:07:50',NULL),(4,2,'Opaque Access Token','api','76e13cb6795a351443b07725d6f11ab8508e048d358c89bf91fb1d9152709e74',NULL,'2023-05-16 06:40:42','2023-05-16 06:40:42',NULL),(5,2,'Opaque Access Token','api','afe2e2797cf7733e6f2ac757503abe362bc4bf203f078a87041d2249784734eb',NULL,'2023-05-16 07:57:39','2023-05-16 07:57:39',NULL),(6,2,'Opaque Access Token','api','7d26d5310aba8fef3d79f2bf336610c9c6ee831be2a33ab11cc134f83e66865c',NULL,'2023-05-16 08:03:37','2023-05-16 08:03:37',NULL),(7,2,'Opaque Access Token','api','9718a11896b455a445dc52e18f6497bcab185262cb2b02a5e6e30f93994db397',NULL,'2023-05-16 08:08:29','2023-05-16 08:08:29',NULL),(8,2,'Opaque Access Token','api','07312b0d79d9ca26a0d50afdf5306f0ca2c784587a425754710bd43e99d1738d',NULL,'2023-05-16 15:43:08','2023-05-16 15:43:08',NULL),(9,2,'Opaque Access Token','api','c6a0340538c41746d0d6e8c98efe162d6fddc6c8693e67bdfbac9b0ce5a40dad',NULL,'2023-05-16 15:43:45','2023-05-16 15:43:45',NULL),(10,2,'Opaque Access Token','api','97bb1774b7c20be208076ce4e301d6359dca776c9a417871514b322dcb2b1117',NULL,'2023-05-16 15:49:08','2023-05-16 15:49:08',NULL),(11,2,'Opaque Access Token','api','e607d85107b3c37d89290021d172f3d7e4ea408edcdd6b874f3993bf4d2d4cbf',NULL,'2023-05-16 15:59:51','2023-05-16 15:59:51',NULL),(12,2,'Opaque Access Token','api','90dc00ea62cc3284787d43258d647fb4f2625caf974c0fd0e7a7f555e7aeccbe',NULL,'2023-05-16 16:03:50','2023-05-16 16:03:50',NULL),(13,2,'Opaque Access Token','api','441fd168a453e28daa7db0f41b0d459814d2b8451ee45cc2d034c246d9800ff2',NULL,'2023-05-16 16:04:49','2023-05-16 16:04:49',NULL),(14,2,'Opaque Access Token','api','204fbe3a9d27c3ddefabd1d6c5f82c03efa8d1dc2d0d4bc64e82589fcd7a6815',NULL,'2023-05-16 16:05:56','2023-05-16 16:05:56',NULL),(15,2,'Opaque Access Token','api','ef47f83ab10ff170b5ef22bfdbea7fcd4d29af72105ac3f49aeeafc0203c5f31',NULL,'2023-05-17 08:52:53','2023-05-17 08:52:53',NULL),(16,2,'Opaque Access Token','api','5d359d581c0fcc1be8b4dcc9c80ebe5ead1521d97702dcf52136e43169b9af6f',NULL,'2023-06-08 15:24:40','2023-06-08 15:24:40',NULL),(17,2,'Opaque Access Token','api','60070731e2d7dfb0cee33c321cd749929af5846e9bf1969be6980258f7fbac11',NULL,'2023-06-08 18:26:23','2023-06-08 15:26:23',NULL),(18,2,'Opaque Access Token','api','3d7531b59bea28d901ceafad0f9692fb4efefd34814cdac4045122de95c096b0',NULL,'2023-06-08 15:36:34','2023-06-08 15:36:34',NULL),(19,3,'Opaque Access Token','api','be75c411700b7d77aab299a0be97987beeb0a85097834fd77d773405d6a44583',NULL,'2023-06-12 19:55:29','2023-06-12 16:55:27',NULL),(20,4,'Opaque Access Token','api','60e853a3e58dca598c975bb1a2dd6bf33cc8ad6a1c4cf2bf9dfbf2b971dd4cdf',NULL,'2023-06-12 20:51:26','2023-06-12 17:51:26',NULL),(21,5,'Opaque Access Token','api','90b8e562073cf7cab9fdef21c1bb1db95afbaa558561ec2bf32e8ba2aa45c197',NULL,'2023-06-12 20:54:06','2023-06-12 17:54:06',NULL),(22,6,'Opaque Access Token','api','0de4f9042f478065d37ae28010a8ab8b31eec2634eaa92786530b6d975126e97',NULL,'2023-06-12 20:59:27','2023-06-12 17:59:27',NULL),(23,6,'Opaque Access Token','api','0a1595fe6128c7ab4e1a9c97aa6a690144952605a331cf81043e969dc11400b9',NULL,'2023-06-12 20:59:27','2023-06-12 17:59:27',NULL),(24,8,'Opaque Access Token','api','d24aa93a8e569c188a1b1f2dc33060dc0584379c3635c67b39c13cae339ac395',NULL,'2023-06-12 21:04:19','2023-06-12 18:04:19',NULL),(25,9,'Opaque Access Token','api','b75066aced725e0b11301447b34a305ae0aaea0f4584f7a830bd0711d2bfc824',NULL,'2023-06-12 21:06:09','2023-06-12 18:06:09',NULL),(26,10,'Opaque Access Token','api','95d2dfa3c6326918287a897cd2395bac4658fc83693fcb16afb65347f38d7c1f',NULL,'2023-06-12 21:07:12','2023-06-12 18:07:12',NULL),(27,10,'Opaque Access Token','api','7fcc311f9a027eb4283e7a2a967553165d58bd200a0116e76114c7b69aff3e24',NULL,'2023-06-12 21:10:34','2023-06-12 18:10:34',NULL),(28,2,'Opaque Access Token','api','676c2173192b2b9eb713509f40374537af1b4011b2c3f91c1379138efac5b2f5',NULL,'2023-06-12 23:00:30','2023-06-12 20:00:30',NULL),(29,4,'Opaque Access Token','api','76f4ebe76b91a19ee52d94273a49fb1a8aa24026aa56aad8bdc33a9eb6d1c5fb',NULL,'2023-06-13 15:34:55','2023-06-13 12:34:53',NULL),(30,4,'Opaque Access Token','api','9680420137938692510debc252b696668af07f4407ec11ca3311962ddad01077',NULL,'2023-06-13 17:45:15','2023-06-13 14:45:13',NULL),(31,4,'Opaque Access Token','api','4ac90f58a819270ebc388f77bbc4d99945f04c012574d66b3b29c97a7e37e57a',NULL,'2023-06-13 17:46:51','2023-06-13 14:46:49',NULL),(32,4,'Opaque Access Token','api','9a06fc2ca69a6f89e6a7f2790f37700342d8358ae6f3aebe798d8bd82ebab21d',NULL,'2023-06-13 17:47:15','2023-06-13 14:47:13',NULL),(33,4,'Opaque Access Token','api','fc6f068a405c3bc102d2c49242d6a2bcda4e0436d0010b87e38c4ee433b89c55',NULL,'2023-06-13 17:49:40','2023-06-13 14:49:38',NULL),(34,4,'Opaque Access Token','api','ca24dbe7bbd86c1318212ae89f78a34852521a34aaa2de674e8c7dac22bea504',NULL,'2023-06-13 17:50:56','2023-06-13 14:50:54',NULL),(35,4,'Opaque Access Token','api','0ce893cced55cce052a2cdf10a55f0a59f249ff5f87869b0f64e7a33609b3451',NULL,'2023-06-13 17:51:20','2023-06-13 14:51:18',NULL),(36,4,'Opaque Access Token','api','61e48837f2218880731257ea0770e6c23d91fb8302426e1c0b125b272a96cd3e',NULL,'2023-06-13 17:51:32','2023-06-13 14:51:30',NULL),(37,4,'Opaque Access Token','api','52d588f665a21d0f1ad5cb664ea0f09947032d14ec327c0634e0b66c6b13cb09',NULL,'2023-06-13 17:52:45','2023-06-13 14:52:43',NULL),(38,4,'Opaque Access Token','api','9a695696bc4c3a9d8c3256f546537f0621e11a64ba6ba2c74c63fbfa47eb3546',NULL,'2023-06-13 17:52:52','2023-06-13 14:52:50',NULL),(39,4,'Opaque Access Token','api','967b7880a5010c706c508041fc4dcf738ff26ed9baf0ef22d80b985ba069fedb',NULL,'2023-06-13 19:30:29','2023-06-13 16:30:27',NULL),(40,4,'Opaque Access Token','api','f6f53a00924377e8a2ee1491688ca014f64fa025384e8ba87995ebf3ac72ac42',NULL,'2023-06-13 19:33:34','2023-06-13 16:33:32',NULL),(41,4,'Opaque Access Token','api','db1187618720db6e1b52de8391261ad32a4b278da070412e90661a04042bb7d1',NULL,'2023-06-14 11:04:31','2023-06-14 08:04:28',NULL),(42,4,'Opaque Access Token','api','8eaa95efe1fdba030272edb6a6a66bce3dbb818a50f680371164b861a7e2a881',NULL,'2023-06-14 21:29:06','2023-06-14 18:29:02',NULL),(43,11,'Opaque Access Token','api','bc12a109b3c8648d73418d23c3d40c1dbdf5f888cc74a2b92bf2e68901bfd783',NULL,'2023-06-15 01:10:54','2023-06-14 22:10:50',NULL),(44,12,'Opaque Access Token','api','407808e898332493ffa2c58d05cfd07f372804d57caa82108b6df45712acface',NULL,'2023-06-15 01:52:06','2023-06-14 22:52:02',NULL),(45,13,'Opaque Access Token','api','30c2287fcdb640626a1f2376e11e67e81e9e791d075be4e71c7863d73c2c6f5c',NULL,'2023-06-15 01:52:46','2023-06-14 22:52:43',NULL),(46,13,'Opaque Access Token','api','c929c45e8258534d8f38eac7030a2b7ca7adc43529991415da138632fa18815d',NULL,'2023-06-15 01:53:51','2023-06-14 22:53:47',NULL),(47,13,'Opaque Access Token','api','75713cd775915f4dfc57b4aee11a0dd6d7a1a1a0187de9745688c39b2714cd59',NULL,'2023-06-15 01:55:22','2023-06-14 22:55:19',NULL),(48,13,'Opaque Access Token','api','7ea092fc480e232258372f5f61bead58abdcb3196383b49e0df12615290241eb',NULL,'2023-06-15 01:55:37','2023-06-14 22:55:34',NULL),(49,13,'Opaque Access Token','api','4c28cee078ebcb5d13c22da7d691f746785a1b6bff74a538a6e9c02e2f5896c3',NULL,'2023-06-15 07:44:44','2023-06-15 07:44:44',NULL),(50,13,'Opaque Access Token','api','8d1066334e52c76bccee7be84a8c053a9fcaee6e8522d7cbf7317621e003764c',NULL,'2023-06-15 07:47:26','2023-06-15 07:47:26',NULL),(51,13,'Opaque Access Token','api','3fdd02f85beb6272e3c459d4fbff30590a8614efac35ecfb0fb3bba48296893d',NULL,'2023-06-15 07:52:14','2023-06-15 07:52:14',NULL),(52,14,'Opaque Access Token','api','da4cc90920065560d4ba07820d9e1a144f2e9e86d493bf37121ba08d7f844751',NULL,'2023-06-15 08:02:17','2023-06-15 08:02:17',NULL),(53,14,'Opaque Access Token','api','c83ca31dc6f0804b4d317a92c3188778119834fb68664376f941252c847ddf4d',NULL,'2023-06-15 08:02:36','2023-06-15 08:02:36',NULL),(54,15,'Opaque Access Token','api','0f1df8b33c5744bd66d64761fbe1eed91e72934b215a4ec50162dca6544ef122',NULL,'2023-06-15 08:20:20','2023-06-15 08:20:20',NULL),(55,15,'Opaque Access Token','api','d8e995253bd0e936e4c5c3a0d59de6d151f47c5749c83b2f606f5ddcbd66a5c9',NULL,'2023-06-15 08:20:36','2023-06-15 08:20:36',NULL),(56,16,'Opaque Access Token','api','60da679a06f7b29e4c76069bf36763ab8861c817622d6071b7a8895b25e0b32e',NULL,'2023-06-15 08:35:25','2023-06-15 08:35:25',NULL),(57,13,'Opaque Access Token','api','ceb2a2b319eae71e2fc99546790fdc22f679135c4f1e90b5a9ce01cf33cda614',NULL,'2023-06-15 08:37:19','2023-06-15 08:37:19',NULL),(58,15,'Opaque Access Token','api','14320f94419d3f5128318fb716b86d64460ef28efd88bebd12517a62a39b7720',NULL,'2023-06-15 08:37:28','2023-06-15 08:37:28',NULL),(59,13,'Opaque Access Token','api','56303f84b6610c35444802d0fbde6fada6d71917c12ba9d92463493d03bcdb02',NULL,'2023-06-15 08:37:55','2023-06-15 08:37:55',NULL),(60,15,'Opaque Access Token','api','d28738723ed221253383fcc0ef602dbe55463fc6173814e153ec0647ead9718a',NULL,'2023-06-15 08:37:59','2023-06-15 08:37:59',NULL),(61,17,'Opaque Access Token','api','cd06ce7877e8540ead5bf4df4834c6df9361bc2eaaafbc0d7f3361bdf5080a5f',NULL,'2023-06-15 08:38:33','2023-06-15 08:38:33',NULL),(62,13,'Opaque Access Token','api','2e81630c09209b7c76db38a02f93f2d0ebc0bf2ef25c9448509e4f72ec21a0f1',NULL,'2023-06-15 08:41:32','2023-06-15 08:41:32',NULL),(63,18,'Opaque Access Token','api','00e8e312c8c23936f2514e581f7016526c692ff820a2d78c6ef065690eb3447a',NULL,'2023-06-19 11:35:59','2023-06-19 11:35:59',NULL),(64,18,'Opaque Access Token','api','d946c4249a51c3d1c6f26cb4cbb28a1d9aa73b8e2d5bc81c53b495e7dad2ce2f',NULL,'2023-06-19 11:36:16','2023-06-19 11:36:16',NULL),(65,4,'Opaque Access Token','api','606853a698df18059ffa691db6e60fd4dd875442367b521e9b78f55bb39cb90d',NULL,'2023-06-19 12:25:45','2023-06-19 12:25:45',NULL),(66,4,'Opaque Access Token','api','37b79e39190277e96ad6241e3e8188fd1e6e07f46b71fb291708e44d0b424a6e',NULL,'2023-06-19 12:54:35','2023-06-19 12:54:35',NULL),(67,4,'Opaque Access Token','api','c079dd0df2745185d4b2ffa9bcf230c0e383fc9a87e8c558b7694014195c0b36',NULL,'2023-06-19 13:02:11','2023-06-19 13:02:11',NULL),(68,4,'Opaque Access Token','api','f67466d570c4b5c3d13f1a706d9b7801a43f59c21ff41f9332808189bc2442f3',NULL,'2023-06-19 13:13:30','2023-06-19 13:13:30',NULL),(69,4,'Opaque Access Token','api','b2a1e5cf94de5d17b86b4507cae0433c13e1a6a64bfaaa3420d5d56d1019dd2d',NULL,'2023-06-19 13:13:33','2023-06-19 13:13:33',NULL),(70,4,'Opaque Access Token','api','1af5eb0c45ecdc4f9785e7da576f9ee02b949366c2ea4a02f36a422ecb8dc19a',NULL,'2023-06-19 13:13:35','2023-06-19 13:13:35',NULL),(71,19,'Opaque Access Token','api','bd61e8195e09c1d2903b1d32d7b060fc7613e1b2289996368a515bcfe2d60db3',NULL,'2023-06-20 03:33:17','2023-06-20 03:33:17',NULL),(72,19,'Opaque Access Token','api','35e2974eb87d95cbc96504229ceb6d289c0d95624dcb6cd8297663eb489ef82d',NULL,'2023-06-20 03:33:29','2023-06-20 03:33:29',NULL),(73,19,'Opaque Access Token','api','58fd4ca562c432184d8ad45547d0bf54c6df923a5e2e52dc9da33d8d0afc2405',NULL,'2023-06-20 03:44:52','2023-06-20 03:44:52',NULL),(74,20,'Opaque Access Token','api','193b36199ea7aeb1b93a870a4e2b14493a4f44a3d63eccbe002b38590e8ab6aa',NULL,'2023-06-20 04:46:28','2023-06-20 04:46:28',NULL),(75,20,'Opaque Access Token','api','edcacd96d4579ff3d224df49f1e389d84e34d3c16165d2448a08a0f15a00a356',NULL,'2023-06-20 04:46:49','2023-06-20 04:46:49',NULL),(76,20,'Opaque Access Token','api','c85a33ab95b212a9bb847e0fa9b92156cf64e97ac690d155847b7edcd8df300b',NULL,'2023-06-20 05:07:53','2023-06-20 05:07:53',NULL),(77,4,'Opaque Access Token','api','f4181fa9e2362ce56a895a2d2e1bbc40bf7e420c3fb10eb6777bc3af6f30455b',NULL,'2023-06-20 05:08:28','2023-06-20 05:08:28',NULL),(78,21,'Opaque Access Token','api','8f6be3b926ee3c364ab05a72f93b110167bfa48258ea78145f3e4d02c58c0152',NULL,'2023-06-21 08:22:55','2023-06-21 08:22:55',NULL),(79,21,'Opaque Access Token','api','4f89d27624777f8fd942e3754b77a925a6bb3be5ab753d6fb829bd99c3c574f4',NULL,'2023-06-21 09:12:01','2023-06-21 09:12:01',NULL),(80,21,'Opaque Access Token','api','a2048bf520cf8de53a20d3dfca737d7a56115375831c7a4e25525c5e5203f6b2',NULL,'2023-06-21 09:15:37','2023-06-21 09:15:37',NULL),(81,21,'Opaque Access Token','api','0be9a7da6474bfb51285c5478dff91db47ac67c049c9ccd60807109149021050',NULL,'2023-06-21 13:03:17','2023-06-21 13:03:17',NULL),(82,21,'Opaque Access Token','api','fb0844327021305f727fad3eb7e2eadee38f36fda0cb64bee5bbe669c15f9b71',NULL,'2023-06-21 14:00:30','2023-06-21 14:00:30',NULL),(83,22,'Opaque Access Token','api','e73cc41288eb6a96d7530933a53352e813a07a4f8a8cb8296773c84296145da8',NULL,'2023-06-21 14:42:45','2023-06-21 14:42:45',NULL),(84,22,'Opaque Access Token','api','c2b152e568f42774dd0701f5fbfc650ee5f1359235334ea6fd7176774ff31cd9',NULL,'2023-06-21 14:43:14','2023-06-21 14:43:14',NULL),(85,22,'Opaque Access Token','api','6837c884e83986878e3247afd8c676edf96cb0533af826598e4cab311a786971',NULL,'2023-06-21 14:48:02','2023-06-21 14:48:02',NULL),(86,22,'Opaque Access Token','api','2bf797cb95cb74f76302bb698d43a552e7bb1d8fa242166b60bd770d3e5becae',NULL,'2023-06-21 14:48:58','2023-06-21 14:48:58',NULL),(87,23,'Opaque Access Token','api','6d4b1ecfefee5a6202a55b7579378d9413762efd67421b72e3ce378f6c2d3a08',NULL,'2023-06-21 15:25:39','2023-06-21 15:25:39',NULL),(88,23,'Opaque Access Token','api','6c8ded5e1dab86ea5ed95541c9f56f2b31a5b05361b4dd99164a49e0dd7284da',NULL,'2023-06-21 15:26:08','2023-06-21 15:26:08',NULL),(89,23,'Opaque Access Token','api','b5dd22cca94b4a384ce8eaf6cbd46a5cd8202c20f2c2c8d45031be75140bf6bb',NULL,'2023-06-21 15:28:31','2023-06-21 15:28:31',NULL),(90,24,'Opaque Access Token','api','eaeb4d378e02c3a45666e4f1cb919076f3dfebe66c0683173de73e6655f7603f',NULL,'2023-06-21 15:41:00','2023-06-21 15:41:00',NULL),(91,24,'Opaque Access Token','api','326a6aae2b1d5ed14cb8b1fa84cc5c1b998025022aaa8ca117bfce901dccdf92',NULL,'2023-06-21 15:41:11','2023-06-21 15:41:11',NULL),(92,25,'Opaque Access Token','api','2af25eda694963110dc303493e68493846dd2189c4d0170ebc696b15f55866d2',NULL,'2023-06-21 15:42:35','2023-06-21 15:42:35',NULL),(93,25,'Opaque Access Token','api','cef55ac7e4877435ce859bfee99c814964f0f92c913f3bb892ffe1b8adf15581',NULL,'2023-06-21 15:42:57','2023-06-21 15:42:57',NULL),(94,25,'Opaque Access Token','api','f3eb61cf1fbb901367fcb2f9a50771bff09e6330e18cbf22745a13e4300b302a',NULL,'2023-06-21 15:47:12','2023-06-21 15:47:12',NULL),(95,21,'Opaque Access Token','api','a4540d5b2dd9f268edb948b8900f52318da76c679a032d76a5a0becca500f66d',NULL,'2023-06-21 15:56:28','2023-06-21 15:56:28',NULL),(96,21,'Opaque Access Token','api','b8babb8e66092e46e3e709d78629c3e8c3afb6286ae20acb0972e4556d946b75',NULL,'2023-06-21 16:17:03','2023-06-21 16:17:03',NULL),(97,26,'Opaque Access Token','api','420e65e49d51fd8c2d93b835c3b814a0cc6bc1f610a5b34d294fea852117a46f',NULL,'2023-06-21 16:18:53','2023-06-21 16:18:53',NULL),(98,26,'Opaque Access Token','api','1751befd851e662ec41d6dc82a7682ca64065e96eec7ac01fc1e7915a1182363',NULL,'2023-06-21 16:19:18','2023-06-21 16:19:18',NULL),(99,26,'Opaque Access Token','api','d810f9f477de628e9cf71fa3b979800cbd200b7e7086871bcf2740394cad8d68',NULL,'2023-06-21 16:21:48','2023-06-21 16:21:48',NULL),(100,26,'Opaque Access Token','api','021beb9960a9c3975b510b980dab1b79f33e94604dbf755f29645d553688eaaf',NULL,'2023-06-21 16:23:43','2023-06-21 16:23:43',NULL),(101,21,'Opaque Access Token','api','93b8c46cc36bd5f89960ae6ee864b2dee675e120951e719a7084a1524edd8a75',NULL,'2023-06-22 09:47:21','2023-06-22 09:47:21',NULL),(102,21,'Opaque Access Token','api','c1c812dc052bde2e901d9a08d0b54f8b547dbfdbf54b8b14ca8d4995f2671820',NULL,'2023-06-22 19:57:17','2023-06-22 16:57:15',NULL),(103,20,'Opaque Access Token','api','26871ae85bec40848e844dab1c4788dd87a1730ab7f3af171131e85b0fb0e69e',NULL,'2023-06-22 23:00:31','2023-06-22 20:00:31',NULL),(104,21,'Opaque Access Token','api','c17ffd799db81177526d2339bbe62292eed48e2cdee223ba766c364dab989747',NULL,'2023-06-22 23:02:13','2023-06-22 20:02:13',NULL),(105,27,'Opaque Access Token','api','ccd35daab692365c9b37eb97d02a432733871fccad427663c9fcdcb1ed0243f9',NULL,'2023-06-22 21:01:57','2023-06-22 21:01:57',NULL),(106,27,'Opaque Access Token','api','1db06e1573846e197580bf5a97e366ca6e582df7c4fcace187f705b93d22d679',NULL,'2023-06-22 21:02:35','2023-06-22 21:02:35',NULL),(107,20,'Opaque Access Token','api','8d8f7ab7e596edb8482239a22319ee9d4acad8e1288db71185b2d4debed2ed60',NULL,'2023-06-22 21:08:55','2023-06-22 21:08:55',NULL),(108,4,'Opaque Access Token','api','2349d41481f67c4a3843183ffefddd688c89258f7cca1ea06dca28fdbf9c86a5',NULL,'2023-06-24 20:24:54','2023-06-24 20:24:54',NULL),(109,4,'Opaque Access Token','api','3a81ef77e84899e7e97267da8dfb3fd31355644c35dad4b7317ef32a0006d0d3',NULL,'2023-06-24 20:27:49','2023-06-24 20:27:49',NULL),(110,4,'Opaque Access Token','api','47a40d7266f3a8c864dae22816c0755370e398b0b409e09ab87bcc0d9e80988e',NULL,'2023-06-24 20:37:10','2023-06-24 20:37:10',NULL),(111,28,'Opaque Access Token','api','30fb355c38689b72a47880eb964ece3569a97d100cac5dd8f14457ff8267b839',NULL,'2023-06-25 10:22:16','2023-06-25 10:22:16',NULL),(112,28,'Opaque Access Token','api','24d7cecd487d19cb4a0142e0736b59445c1beed94ceedab5329e86949bad09ec',NULL,'2023-06-25 10:22:37','2023-06-25 10:22:37',NULL),(113,29,'Opaque Access Token','api','446398fbfad994317989c867ff7d481f1ddeaf68c428b3816e3468060115f5ec',NULL,'2023-06-30 18:34:43','2023-06-30 18:34:43',NULL),(114,29,'Opaque Access Token','api','bd73cb91a48b66f997f79e5a7f441a02ea07dcf8efdbf4dd6f3ef70182e72b39',NULL,'2023-06-30 18:34:56','2023-06-30 18:34:56',NULL),(115,29,'Opaque Access Token','api','6bef829ee6ceca055740d9d7742a537838a5e568eb6cbee55f14d6b441aa604f',NULL,'2023-06-30 18:37:49','2023-06-30 18:37:49',NULL),(116,29,'Opaque Access Token','api','3203b191c2e992df261001c5cf4dac5e9d3fbdb1e6d892a6585cbe0ce3554c1b',NULL,'2023-06-30 19:19:30','2023-06-30 19:19:30',NULL),(117,29,'Opaque Access Token','api','1875906632b3328a38d2ab050d1f5320029f243f9ecd6603531cb9f64672cafc',NULL,'2023-06-30 19:21:01','2023-06-30 19:21:01',NULL),(118,29,'Opaque Access Token','api','6fd39457c983d4f5e01b1ac952efadb0fa06c4824c3f134cf37bdec2f2dfcc0c',NULL,'2023-06-30 20:43:27','2023-06-30 20:43:27',NULL);
/*!40000 ALTER TABLE `api_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `categoriescol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'BTS',NULL,'https://crusher.fra1.cdn.digitaloceanspaces.com/photos/mens_clothes.svg','2023-06-15 00:10:54','2023-06-15 00:10:54',NULL,NULL),(2,'Naruto',NULL,'https://crusher.fra1.cdn.digitaloceanspaces.com/photos/mens_clothes.svg','2023-06-15 00:19:39','2023-06-15 00:19:39',NULL,NULL),(3,'Bleach',NULL,'https://crusher.fra1.cdn.digitaloceanspaces.com/photos/mens_clothes.svg','2023-06-15 00:19:39','2023-06-15 00:19:39',NULL,NULL),(4,'Attack On Titan',NULL,'https://crusher.fra1.cdn.digitaloceanspaces.com/photos/mens_clothes.svg','2023-06-15 00:19:39','2023-06-15 00:19:39',NULL,NULL),(5,'Blackpink',NULL,'https://crusher.fra1.cdn.digitaloceanspaces.com/photos/mens_clothes.svg','2023-06-15 00:10:55','2023-06-15 00:10:55',NULL,NULL),(6,'Aqaba',NULL,'https://crusher.fra1.cdn.digitaloceanspaces.com/photos/mens_clothes.svg','2023-06-15 00:13:56','2023-06-15 00:13:56',NULL,NULL),(7,'Palestine',NULL,'https://crusher.fra1.cdn.digitaloceanspaces.com/photos/mens_clothes.svg','2023-06-15 00:13:56','2023-06-15 00:13:56',NULL,NULL),(8,'Death Note',NULL,'https://crusher.fra1.cdn.digitaloceanspaces.com/photos/mens_clothes.svg','2023-06-15 00:13:57','2023-06-15 00:13:57',NULL,NULL),(9,'Hunter X Hunter',NULL,'https://crusher.fra1.cdn.digitaloceanspaces.com/photos/mens_clothes.svg','2023-06-15 00:13:57','2023-06-15 00:13:57',NULL,NULL),(10,'Dragon Ball',NULL,'https://crusher.fra1.cdn.digitaloceanspaces.com/photos/mens_clothes.svg','2023-06-15 00:13:57','2023-06-15 00:13:57',NULL,NULL),(11,'Gintama',NULL,'https://crusher.fra1.cdn.digitaloceanspaces.com/photos/mens_clothes.svg','2023-06-15 00:13:57','2023-06-15 00:13:57',NULL,NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `country_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_country_id_idx` (`country_id`),
  CONSTRAINT `fk_country_id` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discounts`
--

DROP TABLE IF EXISTS `discounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discounts` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `percent` decimal(10,0) NOT NULL,
  `active` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discounts`
--

LOCK TABLES `discounts` WRITE;
/*!40000 ALTER TABLE `discounts` DISABLE KEYS */;
INSERT INTO `discounts` VALUES (1,'1','1',1,1,'2023-05-13 06:49:34',NULL,NULL);
/*!40000 ALTER TABLE `discounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventories`
--

DROP TABLE IF EXISTS `inventories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventories` (
  `id` int NOT NULL,
  `quantity` int NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventories`
--

LOCK TABLES `inventories` WRITE;
/*!40000 ALTER TABLE `inventories` DISABLE KEYS */;
INSERT INTO `inventories` VALUES (1,1,'2023-05-13 06:44:15',NULL,NULL);
/*!40000 ALTER TABLE `inventories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_products`
--

DROP TABLE IF EXISTS `order_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `order_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `qty` int NOT NULL,
  `price` double DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_id_2_idx` (`order_id`),
  KEY `fk_product_id_2_idx` (`product_id`),
  KEY `fk_user_id_3_idx` (`user_id`),
  CONSTRAINT `fk_order_id_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `fk_product_id_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `fk_user_id_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_products`
--

LOCK TABLES `order_products` WRITE;
/*!40000 ALTER TABLE `order_products` DISABLE KEYS */;
INSERT INTO `order_products` VALUES (45,1,61,NULL,3,20,'2023-06-02 15:34:31','2023-06-02 15:34:31',NULL),(46,4,61,NULL,3,90,'2023-06-02 15:34:32','2023-06-02 15:34:32',NULL),(47,5,61,NULL,5,25,'2023-06-02 15:34:32','2023-06-02 15:34:32',NULL),(48,3,62,NULL,2,30,'2023-06-02 17:45:34','2023-06-02 17:45:34',NULL),(49,6,62,NULL,2,40,'2023-06-02 17:45:34','2023-06-02 17:45:34',NULL),(50,4,63,NULL,2,90,'2023-06-13 09:27:59','2023-06-13 09:27:59',NULL),(51,6,63,NULL,2,40,'2023-06-13 09:27:59','2023-06-13 09:27:59',NULL),(52,6,64,NULL,3,40,'2023-06-13 11:23:34','2023-06-13 11:23:34',NULL),(53,5,64,NULL,2,25,'2023-06-13 11:23:35','2023-06-13 11:23:35',NULL),(54,3,65,NULL,2,30,'2023-06-13 11:49:51','2023-06-13 11:49:51',NULL),(55,6,66,NULL,1,40,'2023-06-13 11:51:15','2023-06-13 11:51:15',NULL),(56,6,67,NULL,2,40,'2023-06-13 15:29:10','2023-06-13 15:29:10',NULL),(57,5,67,NULL,1,25,'2023-06-13 15:29:10','2023-06-13 15:29:10',NULL),(58,6,68,NULL,2,40,'2023-06-13 15:35:53','2023-06-13 15:35:53',NULL),(59,5,68,NULL,1,25,'2023-06-13 15:35:53','2023-06-13 15:35:53',NULL),(60,5,71,NULL,3,25,'2023-06-14 11:30:45','2023-06-14 11:30:45',NULL),(61,5,72,NULL,1,25,'2023-06-14 11:35:04','2023-06-14 11:35:04',NULL),(62,4,75,NULL,2,90,'2023-06-14 12:21:22','2023-06-14 12:21:22',NULL),(63,3,76,NULL,1,30,'2023-06-14 21:22:49','2023-06-14 21:22:49',NULL),(64,3,77,NULL,1,30,'2023-06-14 21:24:42','2023-06-14 21:24:42',NULL),(65,5,78,NULL,2,9,'2023-06-15 03:41:39','2023-06-15 03:41:39',NULL),(66,8,78,NULL,2,8,'2023-06-15 03:41:39','2023-06-15 03:41:39',NULL),(67,13,79,NULL,1,9,'2023-06-15 03:42:05','2023-06-15 03:42:05',NULL),(68,23,79,NULL,5,7,'2023-06-15 03:42:05','2023-06-15 03:42:05',NULL),(69,22,79,NULL,2,7,'2023-06-15 03:42:05','2023-06-15 03:42:05',NULL),(70,2,80,NULL,8,9,'2023-06-15 03:43:41','2023-06-15 03:43:41',NULL),(71,4,80,NULL,6,9,'2023-06-15 03:43:41','2023-06-15 03:43:41',NULL),(72,9,81,NULL,3,7,'2023-06-15 08:21:58','2023-06-15 08:21:58',NULL),(73,1,82,NULL,1,9,'2023-06-15 08:22:20','2023-06-15 08:22:20',NULL),(74,9,82,NULL,1,7,'2023-06-15 08:22:20','2023-06-15 08:22:20',NULL),(75,2,83,NULL,4,9,'2023-06-15 08:25:19','2023-06-15 08:25:19',NULL),(76,2,86,NULL,1,9,'2023-06-15 09:00:34','2023-06-15 09:00:34',NULL),(77,17,87,NULL,1,8,'2023-06-16 15:21:09','2023-06-16 15:21:09',NULL),(78,20,88,NULL,1,7,'2023-06-16 15:21:25','2023-06-16 15:21:25',NULL),(79,22,89,NULL,1,7,'2023-06-16 15:21:59','2023-06-16 15:21:59',NULL),(80,23,89,NULL,1,7,'2023-06-16 15:21:59','2023-06-16 15:21:59',NULL),(81,21,89,NULL,1,7,'2023-06-16 15:21:59','2023-06-16 15:21:59',NULL),(82,20,89,NULL,1,7,'2023-06-16 15:21:59','2023-06-16 15:21:59',NULL),(83,12,90,NULL,1,8,'2023-06-16 16:16:16','2023-06-16 16:16:16',NULL),(84,11,90,NULL,1,10,'2023-06-16 16:16:16','2023-06-16 16:16:16',NULL),(85,9,91,NULL,1,7,'2023-06-16 16:19:07','2023-06-16 16:19:07',NULL),(86,13,91,NULL,2,9,'2023-06-16 16:19:07','2023-06-16 16:19:07',NULL),(87,3,92,NULL,1,10,'2023-06-16 16:37:18','2023-06-16 16:37:18',NULL),(88,3,93,NULL,1,10,'2023-06-16 16:39:29','2023-06-16 16:39:29',NULL),(89,4,93,NULL,4,9,'2023-06-16 16:39:29','2023-06-16 16:39:29',NULL),(90,3,94,NULL,1,10,'2023-06-16 16:41:13','2023-06-16 16:41:13',NULL),(91,4,94,NULL,1,9,'2023-06-16 16:41:13','2023-06-16 16:41:13',NULL),(92,4,95,NULL,1,9,'2023-06-16 16:42:07','2023-06-16 16:42:07',NULL),(93,3,96,NULL,1,10,'2023-06-16 16:42:48','2023-06-16 16:42:48',NULL),(94,3,97,NULL,1,10,'2023-06-16 16:44:33','2023-06-16 16:44:33',NULL),(95,3,98,NULL,1,10,'2023-06-16 16:46:53','2023-06-16 16:46:53',NULL),(96,3,99,NULL,1,10,'2023-06-16 16:48:11','2023-06-16 16:48:11',NULL),(97,4,100,NULL,1,9,'2023-06-16 16:51:35','2023-06-16 16:51:35',NULL),(98,6,100,NULL,1,8,'2023-06-16 16:51:35','2023-06-16 16:51:35',NULL),(99,3,101,NULL,3,10,'2023-06-16 16:54:26','2023-06-16 16:54:26',NULL),(100,4,102,NULL,1,9,'2023-06-16 16:55:16','2023-06-16 16:55:16',NULL),(101,14,103,NULL,1,9,'2023-06-16 16:58:46','2023-06-16 16:58:46',NULL),(102,18,104,NULL,1,8,'2023-06-16 18:19:47','2023-06-16 18:19:47',NULL),(103,22,104,NULL,1,7,'2023-06-16 18:19:47','2023-06-16 18:19:47',NULL),(104,5,105,NULL,1,9,'2023-06-21 14:44:34','2023-06-21 14:44:34',NULL),(105,8,105,NULL,3,8,'2023-06-21 14:44:34','2023-06-21 14:44:34',NULL),(106,3,106,NULL,1,10,'2023-06-21 15:26:59','2023-06-21 15:26:59',NULL),(107,10,106,NULL,2,8,'2023-06-21 15:26:59','2023-06-21 15:26:59',NULL),(108,17,106,NULL,3,8,'2023-06-21 15:26:59','2023-06-21 15:26:59',NULL),(109,22,107,NULL,3,7,'2023-06-21 15:45:42','2023-06-21 15:45:42',NULL),(110,23,107,NULL,2,7,'2023-06-21 15:45:42','2023-06-21 15:45:42',NULL),(111,2,108,NULL,3,9,'2023-06-21 15:59:35','2023-06-21 15:59:35',NULL),(112,6,108,NULL,4,8,'2023-06-21 15:59:35','2023-06-21 15:59:35',NULL),(113,10,108,NULL,3,8,'2023-06-21 15:59:35','2023-06-21 15:59:35',NULL),(114,1,109,NULL,1,9,'2023-06-21 16:21:10','2023-06-21 16:21:10',NULL),(115,2,110,NULL,1,9,'2023-06-22 21:03:40','2023-06-22 21:03:40',NULL),(116,3,111,NULL,2,10,'2023-06-22 21:10:20','2023-06-22 21:10:20',NULL),(117,14,112,NULL,3,9,'2023-06-24 11:42:11','2023-06-24 11:42:11',NULL),(118,11,113,NULL,2,10,'2023-06-24 20:26:37','2023-06-24 20:26:37',NULL),(119,16,113,NULL,3,8,'2023-06-24 20:26:37','2023-06-24 20:26:37',NULL),(120,19,113,NULL,3,8,'2023-06-24 20:26:37','2023-06-24 20:26:37',NULL),(121,7,113,NULL,1,7,'2023-06-24 20:26:37','2023-06-24 20:26:37',NULL),(122,21,114,NULL,1,7,'2023-06-24 20:27:22','2023-06-24 20:27:22',NULL),(123,23,114,NULL,2,7,'2023-06-24 20:27:22','2023-06-24 20:27:22',NULL),(124,18,114,NULL,3,8,'2023-06-24 20:27:22','2023-06-24 20:27:22',NULL),(125,16,114,NULL,4,8,'2023-06-24 20:27:22','2023-06-24 20:27:22',NULL),(126,18,115,NULL,1,8,'2023-06-25 10:23:48','2023-06-25 10:23:48',NULL),(127,19,115,NULL,3,8,'2023-06-25 10:23:48','2023-06-25 10:23:48',NULL),(128,16,115,NULL,2,8,'2023-06-25 10:23:48','2023-06-25 10:23:48',NULL),(129,3,116,NULL,3,10,'2023-06-30 18:40:52','2023-06-30 18:40:52',NULL),(130,3,116,NULL,1,10,'2023-06-30 18:40:52','2023-06-30 18:40:52',NULL),(131,1,116,NULL,1,9,'2023-06-30 18:40:52','2023-06-30 18:40:52',NULL),(132,4,117,NULL,4,9,'2023-06-30 19:24:05','2023-06-30 19:24:05',NULL),(133,22,118,NULL,3,7,'2023-06-30 20:50:01','2023-06-30 20:50:01',NULL),(134,19,118,NULL,3,8,'2023-06-30 20:50:01','2023-06-30 20:50:01',NULL),(135,18,118,NULL,2,8,'2023-06-30 20:50:02','2023-06-30 20:50:02',NULL);
/*!40000 ALTER TABLE `order_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_statuses`
--

DROP TABLE IF EXISTS `order_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_statuses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_status_name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_statuses`
--

LOCK TABLES `order_statuses` WRITE;
/*!40000 ALTER TABLE `order_statuses` DISABLE KEYS */;
INSERT INTO `order_statuses` VALUES (1,'Review','2023-05-29 19:27:11','2023-05-29 19:27:11',NULL);
/*!40000 ALTER TABLE `order_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `total` double NOT NULL,
  `sub_total` double DEFAULT NULL,
  `tax_amount` double DEFAULT NULL,
  `payment_method_id` int NOT NULL DEFAULT '1',
  `status_id` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `payment_id` int DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_user_id_4_idx` (`user_id`),
  CONSTRAINT `fk_user_id_4` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (60,2,545.1999999999999,470,75.19999999999999,1,NULL,'2023-05-31 20:27:21','2023-05-31 20:27:21',NULL,1),(61,2,527.8,455,72.80000000000001,1,1,'2023-06-02 15:34:31','2023-06-02 15:34:31',NULL,1),(62,2,162.39999999999998,140,22.4,1,1,'2023-06-02 17:45:34','2023-06-02 17:45:34',NULL,1),(63,2,301.59999999999997,260,41.6,2,1,'2023-06-13 09:27:59','2023-06-13 09:27:59',NULL,1),(64,2,197.2,170,27.200000000000003,2,1,'2023-06-13 11:23:34','2023-06-13 11:23:34',NULL,1),(65,2,69.6,60,9.6,1,1,'2023-06-13 11:49:50','2023-06-13 11:49:50',NULL,1),(66,2,46.4,40,6.4,1,1,'2023-06-13 11:51:15','2023-06-13 11:51:15',NULL,1),(67,2,121.8,105,16.8,1,1,'2023-06-13 15:29:10','2023-06-13 15:29:10',NULL,1),(68,4,121.8,105,16.8,1,1,'2023-06-13 15:35:53','2023-06-13 15:35:53',NULL,1),(69,4,168.2,145,23.200000000000003,1,1,'2023-06-14 11:29:19','2023-06-14 11:29:19',NULL,1),(70,4,139.2,120,19.200000000000003,1,1,'2023-06-14 11:30:16','2023-06-14 11:30:16',NULL,1),(71,4,86.99999999999999,75,12,1,1,'2023-06-14 11:30:44','2023-06-14 11:30:44',NULL,1),(72,4,28.999999999999996,25,4,1,1,'2023-06-14 11:35:03','2023-06-14 11:35:03',NULL,1),(73,4,57.99999999999999,50,8,1,1,'2023-06-14 11:37:40','2023-06-14 11:37:40',NULL,1),(74,4,34.8,30,4.8,1,1,'2023-06-14 11:43:55','2023-06-14 11:43:55',NULL,1),(75,4,208.79999999999998,180,28.8,1,1,'2023-06-14 12:21:22','2023-06-14 12:21:22',NULL,1),(76,4,34.8,30,4.8,1,1,'2023-06-14 21:22:49','2023-06-14 21:22:49',NULL,1),(77,4,34.8,30,4.8,1,1,'2023-06-14 21:24:42','2023-06-14 21:24:42',NULL,1),(78,13,49.879999999999995,43,6.880000000000001,1,1,'2023-06-15 03:41:38','2023-06-15 03:41:38',NULL,1),(79,13,67.27999999999999,58,9.280000000000001,1,1,'2023-06-15 03:42:05','2023-06-15 03:42:05',NULL,1),(80,13,146.16,126,20.16,1,1,'2023-06-15 03:43:41','2023-06-15 03:43:41',NULL,1),(81,15,24.36,21,3.3600000000000003,1,1,'2023-06-15 08:21:58','2023-06-15 08:21:58',NULL,1),(82,14,18.56,16,2.56,1,1,'2023-06-15 08:22:20','2023-06-15 08:22:20',NULL,1),(83,15,41.76,36,5.76,1,1,'2023-06-15 08:25:19','2023-06-15 08:25:19',NULL,1),(84,15,41.76,36,5.76,1,1,'2023-06-15 08:26:54','2023-06-15 08:26:54',NULL,1),(85,14,18.56,16,2.56,1,1,'2023-06-15 08:27:56','2023-06-15 08:27:56',NULL,1),(86,13,10.44,9,1.44,1,1,'2023-06-15 09:00:34','2023-06-15 09:00:34',NULL,1),(87,13,9.28,8,1.28,1,1,'2023-06-16 15:21:09','2023-06-16 15:21:09',NULL,1),(88,13,8.12,7,1.12,1,1,'2023-06-16 15:21:25','2023-06-16 15:21:25',NULL,1),(89,13,32.48,28,4.48,1,1,'2023-06-16 15:21:59','2023-06-16 15:21:59',NULL,1),(90,13,20.88,18,2.88,1,1,'2023-06-16 16:16:16','2023-06-16 16:16:16',NULL,1),(91,13,29,25,4,1,1,'2023-06-16 16:19:07','2023-06-16 16:19:07',NULL,1),(92,13,11.6,10,1.6,1,1,'2023-06-16 16:37:18','2023-06-16 16:37:18',NULL,1),(93,13,53.36,46,7.359999999999999,1,1,'2023-06-16 16:39:29','2023-06-16 16:39:29',NULL,1),(94,13,22.04,19,3.04,1,1,'2023-06-16 16:41:13','2023-06-16 16:41:13',NULL,1),(95,13,10.44,9,1.44,1,1,'2023-06-16 16:42:07','2023-06-16 16:42:07',NULL,1),(96,13,11.6,10,1.6,1,1,'2023-06-16 16:42:48','2023-06-16 16:42:48',NULL,1),(97,13,11.6,10,1.6,1,1,'2023-06-16 16:44:33','2023-06-16 16:44:33',NULL,1),(98,13,11.6,10,1.6,1,1,'2023-06-16 16:46:53','2023-06-16 16:46:53',NULL,1),(99,13,11.6,10,1.6,1,1,'2023-06-16 16:48:11','2023-06-16 16:48:11',NULL,1),(100,13,19.72,17,2.7199999999999998,1,1,'2023-06-16 16:51:35','2023-06-16 16:51:35',NULL,1),(101,13,34.8,30,4.800000000000001,1,1,'2023-06-16 16:54:26','2023-06-16 16:54:26',NULL,1),(102,13,10.44,9,1.44,1,1,'2023-06-16 16:55:16','2023-06-16 16:55:16',NULL,1),(103,13,10.44,9,1.44,1,1,'2023-06-16 16:58:46','2023-06-16 16:58:46',NULL,1),(104,13,17.4,15,2.4000000000000004,1,1,'2023-06-16 18:19:47','2023-06-16 18:19:47',NULL,1),(105,22,38.279999999999994,33,5.279999999999999,1,1,'2023-06-21 14:44:34','2023-06-21 14:44:34',NULL,1),(106,23,57.99999999999999,50,8,1,1,'2023-06-21 15:26:59','2023-06-21 15:26:59',NULL,1),(107,25,40.599999999999994,35,5.6000000000000005,1,1,'2023-06-21 15:45:42','2023-06-21 15:45:42',NULL,1),(108,21,96.28,83,13.280000000000001,1,1,'2023-06-21 15:59:35','2023-06-21 15:59:35',NULL,1),(109,26,10.44,9,1.44,1,1,'2023-06-21 16:21:10','2023-06-21 16:21:10',NULL,1),(110,27,10.44,9,1.44,1,1,'2023-06-22 21:03:39','2023-06-22 21:03:39',NULL,1),(111,20,23.2,20,3.2,1,1,'2023-06-22 21:10:20','2023-06-22 21:10:20',NULL,1),(112,20,31.32,27,4.32,1,1,'2023-06-24 11:42:11','2023-06-24 11:42:11',NULL,1),(113,4,87,75,12,1,1,'2023-06-24 20:26:37','2023-06-24 20:26:37',NULL,1),(114,4,89.32,77,12.32,1,1,'2023-06-24 20:27:22','2023-06-24 20:27:22',NULL,1),(115,28,55.67999999999999,48,7.68,1,1,'2023-06-25 10:23:48','2023-06-25 10:23:48',NULL,1),(116,29,56.839999999999996,49,7.84,1,1,'2023-06-30 18:40:52','2023-06-30 18:40:52',NULL,1),(117,29,41.76,36,5.76,1,1,'2023-06-30 19:24:05','2023-06-30 19:24:05',NULL,1),(118,29,70.75999999999999,61,9.76,1,1,'2023-06-30 20:50:01','2023-06-30 20:50:01',NULL,1);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` int NOT NULL,
  `order_id` int NOT NULL,
  `amount` decimal(10,0) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `inventory_id` int DEFAULT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `size` varchar(255) DEFAULT NULL,
  `discount_id` int DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_discount_id_idx` (`discount_id`),
  CONSTRAINT `fk_discount_id` FOREIGN KEY (`discount_id`) REFERENCES `discounts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Kiloa eye\'s','Water-resistant','Black','https://crusher.fra1.cdn.digitaloceanspaces.com/photos/kiloa.jpeg',9,NULL,9.00,'L',1,'2023-06-15 00:16:41','2023-06-15 00:16:41',NULL),(2,'Erin Yegur','Water-resistant...DTF edition','Black','https://crusher.fra1.cdn.digitaloceanspaces.com/photos/erin.jpeg',4,NULL,9.00,'M',1,'2023-06-15 00:16:41','2023-06-15 00:16:41',NULL),(3,'Acatsuki','Water-resistant','Black','https://crusher.fra1.cdn.digitaloceanspaces.com/photos/acatsuki.jpeg',2,NULL,10.00,'S',1,'2023-06-15 00:16:41','2023-06-15 00:16:41',NULL),(4,'Itchigo','Water-resistant...DTF edition','Black','https://crusher.fra1.cdn.digitaloceanspaces.com/photos/bleach.jpeg',3,NULL,9.00,'L',1,'2023-06-15 00:16:41','2023-06-15 00:16:41',NULL),(5,'Bts brand',' Water-resistant...Fixed color...DTF edition','Black','https://crusher.fra1.cdn.digitaloceanspaces.com/photos/bts.jpeg',1,NULL,9.00,'XL',1,'2023-06-15 00:16:42','2023-06-15 00:16:42',NULL),(6,'Death Note ','Water-resistant...DTF edition','Black','https://crusher.fra1.cdn.digitaloceanspaces.com/photos/deathnote1.jpeg',8,NULL,8.00,'XS',1,'2023-06-15 00:16:42','2023-06-15 00:16:42',NULL),(7,'Blackpink band logo','High-quality pure cotton with ample European sizes... Made in India.','Black','https://crusher.fra1.cdn.digitaloceanspaces.com/photos/blackpink.PNG',5,NULL,7.00,'L',1,'2023-06-15 00:16:40','2023-06-15 00:16:40',NULL),(8,'Dragon Ball Anime','DTF edition','Black','https://crusher.fra1.cdn.digitaloceanspaces.com/photos/dragonballblack.PNG',10,NULL,8.00,NULL,1,'2023-06-15 00:16:39','2023-06-15 00:16:39',NULL),(9,'Hunter x Hunter Anime','DTF edition...Water-resistant','Black','https://crusher.fra1.cdn.digitaloceanspaces.com/photos/hunterblack.PNG',9,NULL,7.00,NULL,1,'2023-06-15 00:16:39','2023-06-15 00:16:39',NULL),(10,'Death Note L','Water-resistant...DTF edition','Black','https://crusher.fra1.cdn.digitaloceanspaces.com/photos/deathnoteblack.PNG',8,NULL,8.00,NULL,1,'2023-06-15 00:17:17','2023-06-15 00:17:17',NULL),(11,'Naruto Acatsuki','Water-resistant','Black','https://crusher.fra1.cdn.digitaloceanspaces.com/photos/acatsukiblack.PNG',2,NULL,10.00,NULL,1,'2023-06-15 00:17:17','2023-06-15 00:17:17',NULL),(12,'Aqaba',' Water-resistant...Fixed color...DTF edition','Black','https://crusher.fra1.cdn.digitaloceanspaces.com/photos/aqabablack.PNG',6,NULL,8.00,NULL,1,'2023-06-15 00:17:17','2023-06-15 00:17:17',NULL),(13,'BTS band','Full color...DTF','Black','https://crusher.fra1.cdn.digitaloceanspaces.com/photos/btsblack.PNG',1,NULL,9.00,NULL,1,'2023-06-15 00:17:17','2023-06-15 00:17:17',NULL),(14,'Kilua\'s eyes Hunter X Hunter','Water-resistant','Black','https://crusher.fra1.cdn.digitaloceanspaces.com/photos/hunter2black.PNG',9,NULL,9.00,NULL,1,'2023-06-15 00:17:17','2023-06-15 00:17:17',NULL),(15,'Gintama','Supreme Edition','Black','https://crusher.fra1.cdn.digitaloceanspaces.com/photos/gentamablack.PNG',11,NULL,7.00,NULL,1,'2023-06-15 00:17:17','2023-06-15 00:17:17',NULL),(16,'Aqaba City + Jordan flag','High quality...DTF','Black','https://crusher.fra1.cdn.digitaloceanspaces.com/photos/aqaba2black.PNG',6,NULL,8.00,NULL,1,'2023-06-15 00:17:17','2023-06-15 00:17:17',NULL),(17,'Aqaba',' Water-resistant...Fixed color...DTF edition','White','https://crusher.fra1.cdn.digitaloceanspaces.com/photos/aqabawhite.PNG',6,NULL,8.00,NULL,1,'2023-06-15 00:17:18','2023-06-15 00:17:18',NULL),(18,'Death Note L','Water-resistant...DTF edition','White','https://crusher.fra1.cdn.digitaloceanspaces.com/photos/deathnotewhite.PNG',8,NULL,8.00,NULL,1,'2023-06-15 00:17:18','2023-06-15 00:17:18',NULL),(19,'Dragon Ball Anime','DTF edition','White','https://crusher.fra1.cdn.digitaloceanspaces.com/photos/dragonballwhite.PNG',10,NULL,8.00,NULL,1,'2023-06-15 00:17:18','2023-06-15 00:17:18',NULL),(20,'Gintama','Supreme Edition','White','https://crusher.fra1.cdn.digitaloceanspaces.com/photos/gentamawhite.PNG',11,NULL,7.00,NULL,1,'2023-06-15 00:17:18','2023-06-15 00:17:18',NULL),(21,'Hunter x Hunter Anime','DTF edition...Water-resistant','White','https://crusher.fra1.cdn.digitaloceanspaces.com/photos/hunterwhite.PNG',9,NULL,7.00,NULL,1,'2023-06-15 00:17:18','2023-06-15 00:17:18',NULL),(22,'Palestine','Water-resistant','White','https://crusher.fra1.cdn.digitaloceanspaces.com/photos/palestinewhite.PNG',7,NULL,7.00,NULL,1,'2023-06-15 00:17:18','2023-06-15 00:17:18',NULL),(23,'Blackpink band logo','High-quality pure cotton with ample European sizes... Made in India.','White','https://crusher.fra1.cdn.digitaloceanspaces.com/photos/whitepink.PNG',5,NULL,7.00,NULL,1,'2023-06-15 00:17:18','2023-06-15 00:17:18',NULL);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_payments`
--

DROP TABLE IF EXISTS `user_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_payments` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `payment_type` varchar(255) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `account_no` int DEFAULT NULL,
  `expiry` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_id_idx` (`user_id`),
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_payments`
--

LOCK TABLES `user_payments` WRITE;
/*!40000 ALTER TABLE `user_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_statuses`
--

DROP TABLE IF EXISTS `user_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_statuses` (
  `id` int NOT NULL,
  `user_status_name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_statuses`
--

LOCK TABLES `user_statuses` WRITE;
/*!40000 ALTER TABLE `user_statuses` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_status_id` int DEFAULT NULL,
  `phone` varchar(45) NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `remember_me_token` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_status_id_idx` (`user_status_id`),
  CONSTRAINT `fk_user_status_id` FOREIGN KEY (`user_status_id`) REFERENCES `user_statuses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'A','F','AF','a.f@gmail.com','$scrypt$n=16384,r=8,p=1$bgOM63PAsdb+b8QTbI9jpg$kx43XQynTYuz/WWiXn67wdJHAobupXLD0dxZyZD2Jvo4OPfJDCQR/57w0jLv7pLmSBQINVAK+A9f0BUAl9U17g',NULL,'0782363190',NULL,'2023-05-10 17:40:26','2023-05-10 17:40:26',NULL,NULL),(3,NULL,NULL,'af2','a.f2@gmail.com','$scrypt$n=16384,r=8,p=1$LuSjdSs+e2+g/j/VLZUXjg$NU7lbuWlHQeoqAzZGkEmvfTYtjK8Txv1AcaVeG0UftbdyiZ5LqSxGoHRSeGXNw82m5eGacREoqQBuy9+O7pwEg',NULL,'0123456789',NULL,'2023-06-12 19:55:29','2023-06-12 19:55:29',NULL,NULL),(4,NULL,NULL,'AbuFadda ','abdallah.tiger2001@gmail.com','$scrypt$n=16384,r=8,p=1$TtXKAMx1fvydzk4c1QtwCw$eWt9iWneukqoW177ecl4dzqczhT0Um4+JYJEUqzKiP61L75R+0NxnSCbUE4vX3StxV3Ap8RBqUEywNYl9+RTGg',NULL,'1234567891',NULL,'2023-06-12 20:51:26','2023-06-12 20:51:26',NULL,NULL),(5,NULL,NULL,'AbuFadda q','abdallah.tiger2001@gmail.comq','$scrypt$n=16384,r=8,p=1$CC80Bf4CK1wrNF2t+S3rnQ$J8JA3fY+Rc7IZpHOhau47htgTW8B3S1nyxnD9e0VRYOy7mRI8Of5usaImet3+t7ZMkBdBZjUK5VUKfFv12/G3Q',NULL,'1234567892',NULL,'2023-06-12 20:54:06','2023-06-12 20:54:06',NULL,NULL),(6,NULL,NULL,'AbuFadda qs','abdallah.tiger2001@gmail.comqw','$scrypt$n=16384,r=8,p=1$fZlZNT8OPObgWHnr0sEJSA$x9KQ1BLGfNgkf17Qjf8C256839EvE1NVJ4LR2Ca8LQg0EK0qqntM8TaRaEb1g1Nxah6nqVvNtNcFsiVHEfNjqQ',NULL,'12345678922',NULL,'2023-06-12 20:59:27','2023-06-12 20:59:27',NULL,NULL),(7,NULL,NULL,'AbuFadda qs','abdallah.tiger2001@gmail.comqw','$scrypt$n=16384,r=8,p=1$hATlCnPECbjprY+UwF30Iw$23CWOEFr8p654BEWTIokI14KEhz9sAkQJEN+KDrWsGe+p8dD58b8wDisq4zHWAymrELXN8vSQdU26NYYQ6vusw',NULL,'12345678922',NULL,'2023-06-12 20:59:27','2023-06-12 20:59:27',NULL,NULL),(8,NULL,NULL,'AbuFadda qsgg','abdallah.tiger2001@gmail.comqwgg','$scrypt$n=16384,r=8,p=1$YCQahW6jlwY4bOaDgilErw$qFn+FBL1+MKHo1kD69kJ/xwz9xVWoY6BpIeiuWhDv2CT/6quufjKjBGfIDFP6E4uSdpcCKD0B3sFUMCjarX/4A',NULL,'1234567892255',NULL,'2023-06-12 21:04:19','2023-06-12 21:04:19',NULL,NULL),(9,NULL,NULL,'eyys','shdgx@jdh.kfjc','$scrypt$n=16384,r=8,p=1$RJQtpnFRsIfO3WnZwWMBqg$kJrerG0yGgVH5nSnt3TyitNaSO6Gb4SJeCraL84UCe4WywsijFiCLAHH5sY2PSxvv8244HfqdRb80zT30mXgcg',NULL,'2772572767573',NULL,'2023-06-12 21:06:09','2023-06-12 21:06:09',NULL,NULL),(10,NULL,NULL,'to fhfhdhd','chddhd@dhsh.jfj','$scrypt$n=16384,r=8,p=1$KktLxKsdVTh58YzHXlUfRw$Lc9MS2W1gi5y36sYqpU0lYVSl8PvY++po/vWvCpDj27n9P1kn3whgjBfXz8egjiwNjEvtGRB7Ykix97RSGVcOw',NULL,'52872745472',NULL,'2023-06-12 21:07:12','2023-06-12 21:07:12',NULL,NULL),(11,NULL,NULL,'abdallah ','abdallah.tiger2001@gmail.co','$scrypt$n=16384,r=8,p=1$8qcIYBSUlpsT9mxHcf+z0w$qs0JQ/+dsF425HhnJOON5uq4DKsDbh9WFV3M3qfF/J00FzWSVagxStPuy6Dm+aEoH347hr4DBM2HXeMgc0tTcQ',NULL,'0782363191',NULL,'2023-06-15 01:10:53','2023-06-15 01:10:53',NULL,NULL),(12,NULL,NULL,'malik12','malik@gmail.com','$scrypt$n=16384,r=8,p=1$83W+0cnkQ7bEsIKf4JRKQw$OUymSgQ4hzc8ovGULGq5BpaSTXjbMvcLAxck2FVu1H3PPxmStj9XtIA1ECWd1dAC2BMLlFLha9M+DQ4i4SuoRg',NULL,'0781234567',NULL,'2023-06-15 01:52:05','2023-06-15 01:52:05',NULL,NULL),(13,NULL,NULL,'malik','malik1000@gmail.com','$scrypt$n=16384,r=8,p=1$IJH/W2InHGgBztLxsLTfIw$xmXP4UcvFGOkPVNm0N5/3t6NXjIDhe/fxX9J70EQa6px9JIbbV6pZhDCqNAlfE9r00LhGrvMa0i5FUfP1Q11tw',NULL,'01234567890',NULL,'2023-06-15 01:52:46','2023-06-15 01:52:46',NULL,NULL),(14,NULL,NULL,'Malik Abu Fadda ','malikhosam@gmail.com','$scrypt$n=16384,r=8,p=1$XX4AhmWbms4ZqeCvz/FxXw$ITO78vJPfUm61Qp1Jr1ILwLp9sNouf9mV4XlhHYwf/nd3raWxHx9BE4CYmBZi7aS4e8fxdrGIisGL5wrX1/2CQ',NULL,'0780558960',NULL,'2023-06-15 08:02:17','2023-06-15 08:02:17',NULL,NULL),(15,NULL,NULL,'mahmoudthaher','mthaher3@gmail.com','$scrypt$n=16384,r=8,p=1$s/YHQvqSdhJomiD9xiniWQ$wmQNUi6N3hwdZnuuhF9NZWSJr5XOPLjKT3siNwS1456ULFiIBZnvNfksNRl2+Mu+IPybYcqCXppEFkG4zfF2lw',NULL,'0787006524',NULL,'2023-06-15 08:20:20','2023-06-15 08:20:20',NULL,NULL),(16,NULL,NULL,'test','s@g.cm','$scrypt$n=16384,r=8,p=1$C81ppk1v3PamwRVXXEruKQ$8cczX/qM1Rf4bdrAEI3oDTvukkJgol5tfnIWKgGX7h6rQvhx5bfyPwYwhyPz7gSZohQJ9rU+/y8LXZs/dPVqXg',NULL,'0787006523',NULL,'2023-06-15 08:35:25','2023-06-15 08:35:25',NULL,NULL),(17,NULL,NULL,'test1','s@g.com','$scrypt$n=16384,r=8,p=1$Zny0paz/yqlOY6b9OlaXNQ$AAYs2gCTwbwzUFmHE/xHUl+m88n9ndxNFurTsurcutpOUMUZUg+EJxMYQGl1US6BfCCI0j3X85PgU3RYbAwzBw',NULL,'0787006529',NULL,'2023-06-15 08:38:33','2023-06-15 08:38:33',NULL,NULL),(18,NULL,NULL,'Mohammed','moha@gmail.com','$scrypt$n=16384,r=8,p=1$zsyFU26jogQAU7SXGuvR7A$XI5s+VISB/5XccAaam+6c0Mti/Q7r/jGYzH0UIBIMkmUJz5Z6GWSbupVDO3bMKnA5CUjwDufuMaBzWGUxczSfA',NULL,'07999999999',NULL,'2023-06-19 11:35:59','2023-06-19 11:35:59',NULL,NULL),(19,NULL,NULL,'Abd','test@gmail.com','$scrypt$n=16384,r=8,p=1$6TAuxY22BlUwV4NO9Njl5g$lqQs11Rjw27xvkV+w8YCaV6jgRwnAKsAiI+mqvrDkT5ZcVLfWEVxr6l6a23uCOGxt2+Tf0PIzjAJTyPagMa2/A',NULL,'+0782363190',NULL,'2023-06-20 03:33:17','2023-06-20 03:33:17',NULL,NULL),(20,NULL,NULL,'bbb','test3@gmail.com','$scrypt$n=16384,r=8,p=1$zPASgio7qCbUM4UX+IyAVw$qHYRgYL/scBPORP9l0wrA77m/ysc2BTY0e79WELFrEnRnv/NDBIkZP6uWTyGeE6mH0Hw8jYI+w994TJ0OWB+0g',NULL,'+0782363191',NULL,'2023-06-20 04:46:28','2023-06-20 04:46:28',NULL,NULL),(21,NULL,NULL,'test4','test4@gmail.comm','$scrypt$n=16384,r=8,p=1$cvG6PwBBpmu3POnmZkQXjQ$VnPObYa6Ntn8TeAe8Kn/xXDq2S/xA4zRoBY/yNY3PQKwQfxgGDYl+ii0c93uUfKMuJNeNMbAlR96ETaaSd7wyw',NULL,'+962782363195',NULL,'2023-06-22 18:17:54','2023-06-22 21:17:56',NULL,NULL),(22,NULL,NULL,'maya','maya@gmail.com','$scrypt$n=16384,r=8,p=1$0qhfovSSn25FUih/9Sztpg$sh6NGFJQoLXvwP0ByY3Si7bCfNx1dqJ0fxO0iVsIcbPajB50pdNcDd0Wjog0n/4kqGGj/qq5ITJV3RvePVr3zg',NULL,'+962779863435',NULL,'2023-06-21 14:42:45','2023-06-21 14:42:45',NULL,NULL),(23,NULL,NULL,'omar','omar@gmail.com','$scrypt$n=16384,r=8,p=1$BFDRVj9mmQ8rqbYuOKyBcA$AcvZ70AlOWe7vtA/ZMYLqKggT//9ZU7GLIQNNn1NHYv/Wglu9t6RoMLAs40U3NhbTTgt8b2rTp6noKSD6Wvtcw',NULL,'+962786232280',NULL,'2023-06-21 15:25:39','2023-06-21 15:25:39',NULL,NULL),(24,NULL,NULL,'tariq ','tariqswaid977@gmail.com','$scrypt$n=16384,r=8,p=1$Mi9QBVybgdRK7AelYWA6HA$b6IwN5LSAS21OusAOS+ZmtiTaDpZOQn6ZCN1TaCuIT1B3EbfO3I4zgAEGGhRJOv7Cv0B4fH04uJka6saB5JspA',NULL,'+962797271355',NULL,'2023-06-21 15:41:00','2023-06-21 15:41:00',NULL,NULL),(25,NULL,NULL,'منير','moneer@gmail.com','$scrypt$n=16384,r=8,p=1$FsvAj5iiEBxcjGsFmy0VhQ$jWeummCUEdvWUmoq0c39KHxZ6SiW/g9jW0SfWwMnIul1pGauMeO8thRrEn32rqAcPkI/7hizRFC71AclojBDPQ',NULL,'+962797047634',NULL,'2023-06-21 15:42:35','2023-06-21 15:42:35',NULL,NULL),(26,NULL,NULL,'Mohmmad','mohmmad.abdr@gmail.com','$scrypt$n=16384,r=8,p=1$6RIHh6eWC/1wTCjdj8rP4g$yciz9mipXWsFQLKyK3UAg/PKzaD8vwSGUoPzKuJM0zL10XrqBGwPaooP9KZ+ejkzm2JzZIR/HUaeQO4MjG45Kw',NULL,'+962799693521',NULL,'2023-06-21 16:18:53','2023-06-21 16:18:53',NULL,NULL),(27,NULL,NULL,'Malik Hosam','malikhosam99@gmail.com','$scrypt$n=16384,r=8,p=1$9q6D/zVJRNdqfI4vpvOcsg$ZIybNBVqefaMtTyTOjriwYjYumN9N0Ku045muNIacyfw6v/Zx9ZQEDhTKJcLt4E8qNw3M38UT4yl1G9ioiFU8g',NULL,'+962780558955',NULL,'2023-06-22 21:01:57','2023-06-22 21:01:57',NULL,NULL),(28,NULL,NULL,'Abdallah AbuFadda','abufadda.abdallah@gmail.com','$scrypt$n=16384,r=8,p=1$WM1WWKA/YjSiSzjn7w67sw$GBoC3I/CLyXeizawEv9zgn0UKqZEuDAuBTQHD70uibmAJFty56NN1qiD+kkrhp5C8LpOGLI8yxB+WYG+tivfJA',NULL,'+962782363185',NULL,'2023-06-25 10:22:16','2023-06-25 10:22:16',NULL,NULL),(29,NULL,NULL,'belal','belal@gmail.com','$scrypt$n=16384,r=8,p=1$+5g3zT2m3hU/LAYxE4FohA$WKVIGTtA1dHSPqB/p1zHuOXahtagOCpe+VmXuaojTqLJcwKKehjb0yO7bXoq2c8wlibxgSn28oIBRFkmvMvi4A',NULL,'+962782685158',NULL,'2023-06-30 18:34:43','2023-06-30 18:34:43',NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-03 12:03:13
