
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
DROP TABLE IF EXISTS `about`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `about` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `about_content` longtext DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `about` WRITE;
/*!40000 ALTER TABLE `about` DISABLE KEYS */;
/*!40000 ALTER TABLE `about` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `addons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reorder_id` int(11) NOT NULL,
  `addongroup_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `price` varchar(20) NOT NULL DEFAULT '0',
  `is_available` int(11) NOT NULL DEFAULT 1 COMMENT '1 = Yes , 2 = No',
  `is_deleted` int(11) NOT NULL DEFAULT 2 COMMENT '1 = Yes , 2 = No',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `addons` WRITE;
/*!40000 ALTER TABLE `addons` DISABLE KEYS */;
INSERT INTO `addons` VALUES (1,0,2,'Sült burgonya','0',1,2,'2025-09-04 14:05:24','2025-09-04 14:22:52'),(2,0,1,'Házi öntet','0',1,2,'2025-09-04 14:07:15','2025-09-04 14:07:15'),(3,0,1,'Magyaros szósz','0',1,2,'2025-09-04 14:08:10','2025-09-04 14:08:10'),(4,0,1,'Nem kérek rá/mellé','0',1,2,'2025-09-04 14:08:26','2025-09-04 14:08:26'),(5,0,2,'Párolt jázmin rizs','0',1,2,'2025-09-04 14:23:04','2025-10-12 15:11:00'),(6,0,2,'Vegyet körettel','0',1,2,'2025-09-04 14:23:16','2025-10-12 15:11:06'),(7,0,2,'Fűszeres steakburgonya','200',1,2,'2025-09-04 14:23:43','2025-09-04 14:23:43'),(8,0,2,'édesburgonya','660',1,1,'2025-09-04 14:23:58','2025-09-30 16:09:21'),(9,0,1,'Kapros-joghurtos','0',1,2,'2025-09-07 11:09:18','2025-09-07 11:09:26'),(10,0,1,'Tzatziki','0',1,2,'2025-09-07 11:09:48','2025-09-07 11:09:48'),(11,0,3,'Curys','0',1,2,'2025-09-25 17:07:33','2025-09-25 17:07:33'),(12,0,3,'Csípős','0',1,2,'2025-09-25 17:07:46','2025-09-25 17:07:46'),(13,0,3,'Mentás','0',1,2,'2025-09-25 17:07:57','2025-09-25 17:07:57'),(14,0,3,'Zöldfűszeres','0',1,2,'2025-09-25 17:08:11','2025-09-25 17:08:11'),(15,0,4,'Pepsi','0',1,2,'2025-09-25 17:42:33','2025-09-25 17:42:33'),(16,0,4,'Coca-Cola','0',1,2,'2025-09-25 17:42:41','2025-10-12 10:01:01'),(17,0,4,'Mirinda','0',1,2,'2025-09-25 17:42:54','2025-09-25 17:42:54'),(18,0,4,'Pepsi Zero','0',1,2,'2025-09-25 17:44:04','2025-09-25 17:44:04'),(19,0,5,'Pepsi zero','0',1,2,'2025-09-30 16:30:29','2025-09-30 16:30:29'),(20,0,5,'Mirinda','0',1,2,'2025-09-30 16:30:40','2025-09-30 16:30:40'),(21,0,5,'Cola','0',1,2,'2025-09-30 16:30:52','2025-09-30 16:30:52'),(22,0,5,'Pepsi','0',1,2,'2025-09-30 16:31:00','2025-09-30 16:31:00'),(23,0,6,'Kakaós','0',1,2,'2025-09-30 17:58:22','2025-09-30 17:58:22'),(24,0,6,'Ízes','0',1,2,'2025-09-30 17:58:30','2025-09-30 17:58:30'),(25,0,6,'Nutellás','0',1,2,'2025-09-30 17:58:46','2025-09-30 17:58:46'),(26,0,6,'Fahéjas','0',1,2,'2025-09-30 17:58:59','2025-09-30 17:58:59'),(27,0,6,'Csokis','0',1,2,'2025-09-30 17:59:26','2025-09-30 17:59:26'),(28,0,6,'Karamellás','0',1,2,'2025-09-30 17:59:37','2025-09-30 17:59:37'),(29,0,7,'Csokis','0',1,2,'2025-09-30 18:03:08','2025-09-30 18:03:08'),(30,0,7,'Diós','0',1,2,'2025-09-30 18:03:17','2025-09-30 18:03:17'),(31,0,7,'Citromos','0',1,2,'2025-09-30 18:03:24','2025-09-30 18:03:24'),(32,0,8,'Diós','0',1,2,'2025-09-30 18:04:40','2025-09-30 18:04:40'),(33,0,8,'Csokis-diós','0',1,2,'2025-09-30 18:04:50','2025-09-30 18:04:50'),(34,0,9,'Lilahagyma','0',1,2,'2025-10-11 12:32:53','2025-10-11 12:40:25'),(35,0,9,'Paprika','0',1,2,'2025-10-11 12:40:14','2025-10-11 12:40:42'),(36,0,9,'Uborka','0',1,2,'2025-10-11 12:40:56','2025-10-11 12:40:56'),(37,0,9,'Paradicsom','0',1,2,'2025-10-11 12:41:28','2025-10-11 12:41:28'),(38,0,9,'Jégsaláta','0',1,2,'2025-10-11 12:42:04','2025-10-11 12:42:04'),(39,0,9,'Ketchup','0',1,2,'2025-10-11 12:42:21','2025-10-11 12:42:21'),(40,0,2,'Édesburgonya','440',1,2,'2025-10-11 13:57:35','2025-10-12 15:08:58'),(41,0,9,'Lilakáposzta','0',1,2,'2025-10-12 08:56:47','2025-10-12 08:56:47'),(42,0,4,'Soproni 0.5','100',1,2,'2025-10-12 09:59:15','2025-10-12 10:00:21'),(43,0,4,'Kőbányai 0.5','100',1,2,'2025-10-12 09:59:32','2025-10-12 10:00:28'),(44,0,4,'Borsodi 0.5','100',1,2,'2025-10-12 09:59:42','2025-10-12 10:00:33'),(45,0,4,'Soproni zéró 0.5','100',1,2,'2025-10-12 10:00:08','2025-10-12 10:01:33'),(46,0,4,'Coca-Cola zero','0',1,2,'2025-10-12 10:01:11','2025-10-12 10:01:11'),(47,0,5,'Soproni 0.5','100',1,2,'2025-10-12 09:59:15','2025-10-12 10:00:21'),(48,0,5,'Kőbányai 0.5','100',1,2,'2025-10-12 09:59:32','2025-10-12 10:00:28'),(49,0,5,'Borsodi 0.5','100',1,2,'2025-10-12 09:59:42','2025-10-12 10:00:33'),(50,0,5,'Soproni zéró 0.5','100',1,2,'2025-10-12 10:00:08','2025-10-12 10:01:33'),(51,0,6,'Coca-Cola zero','0',1,2,'2025-10-12 10:01:11','2025-10-12 10:01:11'),(52,0,10,'Édesburgonya','740',1,2,'2025-10-12 15:09:52','2025-10-12 15:09:52'),(53,0,10,'Fűszeres steakburgonya','200',1,2,'2025-10-12 15:10:13','2025-10-12 15:10:13'),(54,0,10,'Vegyet körettel','0',1,2,'2025-10-12 15:10:27','2025-10-12 15:10:27'),(55,0,10,'Párolt jázmin rizs','0',1,2,'2025-10-12 15:10:38','2025-10-12 15:10:38'),(56,0,10,'Sült burgonya','0',1,2,'2025-10-12 15:10:47','2025-10-12 15:10:47'),(57,0,11,'Csípős szósz','200',1,2,'2026-09-27 20:45:25','2026-09-27 20:59:11'),(58,0,11,'Fokhagymás szósz','200',1,2,'2026-09-27 20:45:32','2026-09-27 20:45:32');
/*!40000 ALTER TABLE `addons` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `addons_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addons_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reorder_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `selection_type` int(11) NOT NULL COMMENT '1=Required 2=Optional',
  `selection_count` int(11) NOT NULL COMMENT '1=Single 2=Multiple',
  `min_count` int(11) NOT NULL DEFAULT 1,
  `max_count` int(11) NOT NULL,
  `is_available` int(11) NOT NULL DEFAULT 1 COMMENT '1 = Yes , 2 = No',
  `is_deleted` int(11) NOT NULL DEFAULT 2 COMMENT '1 = Yes , 2 = No',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `addons_group` WRITE;
/*!40000 ALTER TABLE `addons_group` DISABLE KEYS */;
INSERT INTO `addons_group` VALUES (1,0,'Mártások',2,2,0,2,1,2,'2025-09-04 09:11:18','2025-09-07 11:57:48'),(2,0,'Köret',1,1,1,1,1,2,'2025-09-04 14:03:17','2025-09-04 14:03:17'),(3,0,'Szósz',1,2,2,2,1,2,'2025-09-25 17:06:44','2025-09-25 17:06:44'),(4,0,'Üdítő',1,1,1,1,1,2,'2025-09-25 17:42:13','2025-09-25 17:42:13'),(5,0,'Üditő 2',1,1,1,1,1,2,'2025-09-30 16:30:04','2025-09-30 16:30:04'),(6,0,'Ízesités',1,1,1,1,1,2,'2025-09-30 17:58:06','2025-09-30 18:00:47'),(7,0,'Marlenka ízesítése',1,1,1,1,1,2,'2025-09-30 18:02:57','2025-09-30 18:02:57'),(8,0,'Baklava ízesitése',1,1,1,1,1,2,'2025-09-30 18:04:30','2025-09-30 18:04:30'),(9,0,'Kihagyandó összetevők',2,2,0,6,1,2,'2025-10-11 12:32:37','2026-09-27 20:54:32'),(10,0,'Köret:',1,2,1,1,1,2,'2025-10-12 15:09:28','2025-10-12 15:09:28'),(11,0,'Extra szósz',2,1,1,1,1,2,'2026-09-27 20:45:06','2026-09-27 20:45:06');
/*!40000 ALTER TABLE `addons_group` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `address_type` int(11) DEFAULT NULL COMMENT '(1- Home, 2-Office, 3-Other)',
  `address` text CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `landmark` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `postal_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `country` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `is_default` int(11) NOT NULL COMMENT '1=yes,2=no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `age_verification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `age_verification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `age_verification_on_off` int(11) DEFAULT NULL COMMENT '1=yes,2=no',
  `popup_type` varchar(255) DEFAULT NULL,
  `min_age` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `age_verification` WRITE;
/*!40000 ALTER TABLE `age_verification` DISABLE KEYS */;
/*!40000 ALTER TABLE `age_verification` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `app_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(100) NOT NULL,
  `value` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `app_settings` WRITE;
/*!40000 ALTER TABLE `app_settings` DISABLE KEYS */;
INSERT INTO `app_settings` VALUES (1,'delivery_enabled','1',NULL,NULL);
/*!40000 ALTER TABLE `app_settings` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reorder_id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `cat_id` int(11) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL COMMENT '1=category,2=item',
  `image` varchar(255) NOT NULL,
  `is_available` int(11) NOT NULL DEFAULT 1 COMMENT '1=yes,2=no',
  `section` int(11) NOT NULL DEFAULT 0 COMMENT '1=section-,2=section2,3=section3,4=section4',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `banner` WRITE;
/*!40000 ALTER TABLE `banner` DISABLE KEYS */;
/*!40000 ALTER TABLE `banner` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `barion_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `barion_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `env` enum('test','prod') NOT NULL DEFAULT 'test',
  `poskey` varchar(64) NOT NULL,
  `shop_email` varchar(190) DEFAULT NULL,
  `redirect_url` varchar(255) NOT NULL,
  `callback_url` varchar(255) NOT NULL,
  `currency` char(3) NOT NULL DEFAULT 'HUF',
  `is_enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_barion_env` (`env`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `barion_settings` WRITE;
/*!40000 ALTER TABLE `barion_settings` DISABLE KEYS */;
INSERT INTO `barion_settings` VALUES (1,'test','','','','','HUF',1,'2025-09-16 15:07:23','2026-09-27 17:24:10'),(3,'prod','','','','','HUF',0,'2025-10-14 15:15:53','2026-09-27 17:24:10');
/*!40000 ALTER TABLE `barion_settings` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `barion_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `barion_transactions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) unsigned NOT NULL,
  `payment_id` char(32) NOT NULL,
  `status` varchar(32) NOT NULL DEFAULT 'Initialized',
  `amount` decimal(12,2) NOT NULL,
  `currency` char(3) NOT NULL DEFAULT 'HUF',
  `payer_email` varchar(190) DEFAULT NULL,
  `draft_json` longtext DEFAULT NULL,
  `raw_response` longtext DEFAULT NULL,
  `last_callback_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_barion_paymentid` (`payment_id`),
  KEY `idx_bt_order` (`order_id`),
  KEY `idx_bt_status` (`status`),
  KEY `idx_bt_created` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `barion_transactions` WRITE;
/*!40000 ALTER TABLE `barion_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `barion_transactions` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `blogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blogs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reorder_id` int(11) NOT NULL,
  `slug` longtext NOT NULL,
  `image` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `blogs` WRITE;
/*!40000 ALTER TABLE `blogs` DISABLE KEYS */;
/*!40000 ALTER TABLE `blogs` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `booking_number` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `guests` int(11) NOT NULL,
  `date` varchar(255) NOT NULL,
  `time` varchar(255) NOT NULL,
  `reservation_type` varchar(255) NOT NULL,
  `special_request` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL COMMENT '1=pending,2=accepted,3=rejected',
  `table_number` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `session_id` text DEFAULT NULL,
  `item_id` varchar(255) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `item_image` varchar(255) NOT NULL,
  `item_type` int(11) DEFAULT NULL COMMENT '1=veg,2=nonveg',
  `addons_id` varchar(255) DEFAULT NULL,
  `addons_name` varchar(255) DEFAULT NULL,
  `addons_price` varchar(255) DEFAULT NULL,
  `addons_total_price` float DEFAULT 0,
  `qty` int(11) NOT NULL,
  `item_price` varchar(255) NOT NULL,
  `tax` varchar(255) DEFAULT NULL,
  `is_available` int(11) NOT NULL DEFAULT 1 COMMENT '1 = Yes . 2 = No',
  `extras_id` varchar(255) DEFAULT NULL,
  `extras_name` varchar(255) DEFAULT NULL,
  `extras_price` varchar(255) DEFAULT NULL,
  `extras_total_price` int(11) DEFAULT NULL,
  `buynow` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=449 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `reorder_id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `is_available` int(11) NOT NULL DEFAULT 1 COMMENT '1 = Yes , 2 = No',
  `is_deleted` int(11) NOT NULL DEFAULT 2 COMMENT '1 = Yes , 2 = No',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,7,'Hamburgerek','hamburgerek','foodpro-burger.png',1,2,'2025-07-21 13:01:34','2025-10-02 16:17:01'),(2,2,'Gyros','gyros','foodpro-wrap.png',1,2,'2025-07-21 13:01:45','2025-10-02 16:17:01'),(3,3,'Gyros Tálak','gyros-talak','foodpro-grill.png',1,2,'2025-07-21 13:02:03','2025-10-02 16:17:01'),(4,5,'Kézműves Hamburger','kezmuves-hamburger','foodpro-burger.png',1,2,'2025-09-04 09:09:13','2025-10-02 16:17:01'),(5,1,'Italok','italok','foodpro-drinks.png',1,2,'2025-09-04 18:01:38','2025-10-11 12:24:33'),(7,9,'Hot-Dog','hot-dog','foodpro-wrap.png',1,2,'2025-09-06 11:45:48','2025-09-30 17:48:26'),(8,10,'Lepények','lepenyek','foodpro-wrap.png',2,2,'2025-09-06 11:47:01','2025-10-02 16:15:25'),(9,10,'Saláták','salatak','foodpro-salad.png',1,2,'2025-09-06 11:47:35','2025-10-02 16:17:01'),(10,10,'Desszertek','desszertek','foodpro-dessert.png',1,2,'2025-09-06 11:48:07','2025-09-07 11:11:27'),(11,10,'Édességek Rágcsák','edessegek-ragcsak','foodpro-dessert.png',2,2,'2025-09-06 11:48:46','2025-10-12 14:38:01'),(12,6,'Óriás Hamurger','orias-hamurger','foodpro-burger.png',1,2,'2025-09-07 11:01:37','2025-10-02 16:17:01'),(13,9,'Szendvicsek','szendvicsek','foodpro-wrap.png',1,2,'2025-09-07 11:16:32','2025-10-02 16:15:09'),(14,4,'Kebab','kebab','foodpro-wrap.png',1,2,'2025-09-25 17:03:12','2025-10-02 16:17:01'),(15,8,'Sültek','sultek','foodpro-grill.png',1,2,'2025-09-30 17:26:30','2025-10-02 16:17:01'),(16,10,'Kész ételek','kesz-etelek','foodpro-grill.png',1,2,'2025-09-30 17:48:09','2025-10-02 16:15:09'),(17,10,'Menük','menuk','foodpro-grill.png',1,2,'2025-10-11 12:46:15','2025-10-11 13:10:23');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `email` varchar(20) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `custom_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reorder_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` int(11) NOT NULL COMMENT '1=default,2=process,3=complete,4=cancel',
  `is_available` int(11) NOT NULL DEFAULT 1,
  `is_deleted` int(11) NOT NULL DEFAULT 2,
  `order_type` int(11) NOT NULL DEFAULT 1 COMMENT '1=delivery,2=pickup,3=pos',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `custom_status` WRITE;
/*!40000 ALTER TABLE `custom_status` DISABLE KEYS */;
INSERT INTO `custom_status` VALUES (1,1,'Függő',1,1,2,1,'2024-01-10 06:17:07','2024-06-17 06:11:33'),(2,4,'Lezárt',3,1,2,1,'2024-01-10 06:17:07','2024-07-13 01:27:02'),(3,5,'Törölt',4,1,2,1,'2024-01-10 06:17:07','2024-07-13 01:27:02'),(4,6,'Függő',1,1,2,2,'2024-01-10 06:17:07','2024-07-13 01:41:34'),(5,9,'Lezárt',3,1,2,2,'2024-01-10 06:17:07','2024-07-13 01:42:26'),(6,10,'Törölt',4,1,2,2,'2024-01-10 06:17:07','2024-07-13 01:42:26'),(7,10,'Függő',1,1,2,3,'2024-01-10 06:17:07','2024-07-13 01:41:56'),(8,10,'Lezárt',3,1,2,3,'2024-01-10 06:17:07','2024-07-13 01:27:02'),(9,10,'Törölt',4,1,2,3,'2024-01-10 06:17:07','2024-07-13 01:23:53'),(10,2,'Elfogadott',2,1,2,1,'2024-07-13 01:23:27','2024-08-05 23:33:52'),(11,3,'Elkészült',2,1,2,1,'2024-07-13 01:26:52','2024-07-13 01:27:02'),(12,8,'Átvehető',2,1,2,2,'2024-07-13 01:41:46','2024-07-13 01:42:26'),(13,7,'Elfogadott',2,1,2,2,'2024-07-13 01:42:19','2024-07-13 01:42:26');
/*!40000 ALTER TABLE `custom_status` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `extras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `extras` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` float NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=360 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `extras` WRITE;
/*!40000 ALTER TABLE `extras` DISABLE KEYS */;
INSERT INTO `extras` VALUES (24,6,'Sajt',320,'2025-09-06 11:57:58','2025-09-06 11:57:58'),(25,6,'Sonka',170,'2025-09-06 11:57:58','2025-09-06 11:57:58'),(26,6,'Sonka',170,'2025-09-06 11:57:58','2025-09-06 11:57:58'),(27,6,'Bacon',210,'2025-09-06 11:57:58','2025-09-06 11:57:58'),(28,6,'Cheddar sajt',170,'2025-09-06 11:57:58','2025-09-06 11:57:58'),(29,6,'olíva bogyó',170,'2025-09-06 11:57:58','2025-09-06 11:57:58'),(30,6,'Kukorica',170,'2025-09-06 11:57:58','2025-09-06 11:57:58'),(31,6,'Feta sajt',210,'2025-09-06 11:57:58','2025-09-06 11:57:58'),(32,6,'Pirított hagyma',260,'2025-09-06 11:57:58','2025-09-06 11:57:58'),(33,6,'Lila hagyma',170,'2025-09-06 11:57:58','2025-09-06 11:57:58'),(34,6,'Paradicsom',170,'2025-09-06 11:57:58','2025-09-06 11:57:58'),(35,6,'Uborka',170,'2025-09-06 11:57:58','2025-09-06 11:57:58'),(36,6,'Paprika',170,'2025-09-06 11:57:58','2025-09-06 11:57:58'),(37,6,'Ketchup',290,'2025-09-06 11:57:58','2025-09-06 11:57:58'),(38,6,'Mustár',290,'2025-09-06 11:57:58','2025-09-06 11:57:58'),(39,6,'Majonéz',290,'2025-09-06 11:57:58','2025-09-06 11:57:58'),(40,6,'Tartár mártás',290,'2025-09-06 11:57:58','2025-09-06 11:57:58'),(41,78,'Sajt',280,'2025-09-07 11:07:35','2025-09-25 18:14:41'),(42,78,'Sonka',170,'2025-09-07 11:07:35','2025-09-25 18:14:41'),(43,78,'Sonka',170,'2025-09-07 11:07:35','2025-09-25 18:14:41'),(44,78,'Bacon',210,'2025-09-07 11:07:35','2025-09-25 18:14:41'),(45,78,'Cheddar sajt',170,'2025-09-07 11:07:35','2025-09-25 18:14:41'),(46,78,'olíva bogyó',170,'2025-09-07 11:07:35','2025-09-25 18:14:42'),(47,78,'Kukorica',170,'2025-09-07 11:07:35','2025-09-25 18:14:42'),(48,78,'Feta sajt',210,'2025-09-07 11:07:35','2025-09-25 18:14:42'),(49,78,'Pirított hagyma',260,'2025-09-07 11:07:35','2025-09-25 18:14:42'),(50,78,'Lila hagyma',170,'2025-09-07 11:07:35','2025-09-25 18:14:42'),(51,78,'Paradicsom',170,'2025-09-07 11:07:35','2025-09-25 18:14:42'),(52,78,'Uborka',170,'2025-09-07 11:07:35','2025-09-25 18:14:42'),(53,78,'Paprika',170,'2025-09-07 11:07:35','2025-09-25 18:14:42'),(54,78,'Ketchup',290,'2025-09-07 11:07:35','2025-09-25 18:14:42'),(55,78,'Mustár',290,'2025-09-07 11:07:35','2025-09-25 18:14:42'),(56,78,'Majonéz',290,'2025-09-07 11:07:35','2025-09-25 18:14:42'),(57,78,'Tartár mártás',290,'2025-09-07 11:07:35','2025-09-25 18:14:42'),(58,119,'Currys',290,'2025-09-25 17:51:22','2025-09-30 16:22:47'),(59,119,'Csípős',290,'2025-09-25 17:54:22','2025-09-30 16:22:47'),(60,119,'Mentás',290,'2025-09-25 17:54:22','2025-09-30 16:22:47'),(61,119,'Zöldfűszeres',290,'2025-09-25 17:54:22','2025-09-30 16:22:47'),(62,120,'Currys',290,'2025-09-25 17:56:00','2025-09-30 16:21:57'),(63,120,'Csipős',290,'2025-09-25 17:56:00','2025-09-30 16:21:57'),(64,120,'Mentás',290,'2025-09-25 17:56:00','2025-09-30 16:21:57'),(65,120,'Zöldfűszeres',290,'2025-09-25 17:56:00','2025-09-30 16:21:57'),(66,123,'Currys',290,'2025-09-25 18:05:10','2025-09-25 18:05:10'),(67,123,'Csípős',290,'2025-09-25 18:05:10','2025-09-25 18:05:10'),(68,123,'Mentás',290,'2025-09-25 18:05:10','2025-09-25 18:05:10'),(69,123,'Zöldfűszeres',290,'2025-09-25 18:05:10','2025-09-25 18:05:10'),(70,122,'Currys',290,'2025-09-25 18:05:51','2025-09-25 18:05:51'),(71,122,'Csípős',290,'2025-09-25 18:05:51','2025-09-25 18:05:51'),(72,122,'Mentás',290,'2025-09-25 18:05:51','2025-09-25 18:05:51'),(73,122,'Zöldfűszeres',290,'2025-09-25 18:05:51','2025-09-25 18:05:51'),(78,121,'Currys',290,'2025-09-25 18:08:21','2025-09-30 16:20:50'),(79,121,'Csípős',290,'2025-09-25 18:08:21','2025-09-30 16:20:50'),(80,121,'Mentás',290,'2025-09-25 18:08:21','2025-09-30 16:20:50'),(81,121,'Zöldfűszeres',290,'2025-09-25 18:08:21','2025-09-30 16:20:50'),(82,124,'Currys',290,'2025-09-25 18:09:21','2025-09-30 16:21:08'),(83,124,'Csípős',290,'2025-09-25 18:09:21','2025-09-30 16:21:08'),(84,124,'Mentás',290,'2025-09-25 18:09:21','2025-09-30 16:21:08'),(85,124,'Zöldfűszeres',290,'2025-09-25 18:09:21','2025-09-30 16:21:08'),(86,76,'Sajt',280,'2025-09-25 18:11:45','2026-09-27 20:46:14'),(87,76,'Sonka',170,'2025-09-25 18:11:45','2026-09-27 20:46:14'),(88,76,'Sonka',170,'2025-09-25 18:11:45','2026-09-27 20:46:14'),(89,76,'Bacon',210,'2025-09-25 18:11:45','2026-09-27 20:46:14'),(90,76,'Cheddar sajt',170,'2025-09-25 18:11:45','2026-09-27 20:46:14'),(91,76,'olíva bogyó',170,'2025-09-25 18:11:45','2026-09-27 20:46:14'),(92,76,'Kukorica',170,'2025-09-25 18:11:45','2026-09-27 20:46:14'),(93,76,'Feta sajt',210,'2025-09-25 18:11:45','2026-09-27 20:46:14'),(94,76,'Pirított hagyma',260,'2025-09-25 18:11:45','2026-09-27 20:46:14'),(95,76,'Lila hagyma',170,'2025-09-25 18:11:45','2026-09-27 20:46:14'),(96,76,'Paradicsom',170,'2025-09-25 18:11:45','2026-09-27 20:46:14'),(97,76,'Uborka',170,'2025-09-25 18:11:45','2026-09-27 20:46:14'),(98,76,'Paprika',170,'2025-09-25 18:11:45','2026-09-27 20:46:14'),(99,76,'Ketchup',290,'2025-09-25 18:11:45','2026-09-27 20:46:14'),(100,76,'Mustár',290,'2025-09-25 18:11:45','2026-09-27 20:46:14'),(101,76,'Majonéz',290,'2025-09-25 18:11:45','2026-09-27 20:46:14'),(102,76,'Tartár mártás',290,'2025-09-25 18:11:45','2026-09-27 20:46:14'),(103,77,'Sajt',280,'2025-09-25 18:13:53','2025-09-25 18:39:21'),(104,77,'Sonka',170,'2025-09-25 18:13:53','2025-09-25 18:39:21'),(105,77,'Sonka',170,'2025-09-25 18:13:53','2025-09-25 18:39:21'),(106,77,'Bacon',210,'2025-09-25 18:13:53','2025-09-25 18:39:21'),(107,77,'Cheddar sajt',170,'2025-09-25 18:13:53','2025-09-25 18:39:21'),(108,77,'olíva bogyó',170,'2025-09-25 18:13:53','2025-09-25 18:39:21'),(109,77,'Kukorica',170,'2025-09-25 18:13:53','2025-09-25 18:39:21'),(110,77,'Feta sajt',210,'2025-09-25 18:13:53','2025-09-25 18:39:21'),(111,77,'Pirított hagyma',260,'2025-09-25 18:13:53','2025-09-25 18:39:21'),(112,77,'Lila hagyma',170,'2025-09-25 18:13:53','2025-09-25 18:39:21'),(113,77,'Paradicsom',170,'2025-09-25 18:13:53','2025-09-25 18:39:21'),(114,77,'Uborka',170,'2025-09-25 18:13:53','2025-09-25 18:39:21'),(115,77,'Paprika',170,'2025-09-25 18:13:53','2025-09-25 18:39:21'),(116,77,'Ketchup',290,'2025-09-25 18:13:53','2025-09-25 18:39:21'),(117,77,'Mustár',290,'2025-09-25 18:13:53','2025-09-25 18:39:21'),(118,77,'Majonéz',290,'2025-09-25 18:13:53','2025-09-25 18:39:21'),(119,77,'Tartár mártás',290,'2025-09-25 18:13:53','2025-09-25 18:39:21'),(120,125,'Sajt',230,'2025-09-25 18:38:16','2025-09-30 16:23:44'),(121,125,'Sonka',170,'2025-09-25 18:38:16','2025-09-30 16:23:44'),(122,125,'Sonka',170,'2025-09-25 18:38:16','2025-09-30 16:23:44'),(123,125,'Bacon',210,'2025-09-25 18:38:16','2025-09-30 16:23:44'),(124,125,'Cheddar sajt',170,'2025-09-25 18:38:16','2025-09-30 16:23:44'),(125,125,'olíva bogyó',170,'2025-09-25 18:38:16','2025-09-30 16:23:44'),(126,125,'Kukorica',170,'2025-09-25 18:38:16','2025-09-30 16:23:44'),(127,125,'Feta sajt',210,'2025-09-25 18:38:16','2025-09-30 16:23:44'),(128,125,'Pirított hagyma',260,'2025-09-25 18:38:16','2025-09-30 16:23:44'),(129,125,'Lila hagyma',170,'2025-09-25 18:38:16','2025-09-30 16:23:44'),(130,125,'Paradicsom',170,'2025-09-25 18:38:16','2025-09-30 16:23:44'),(131,125,'Uborka',170,'2025-09-25 18:38:16','2025-09-30 16:23:44'),(132,125,'Paprika',170,'2025-09-25 18:38:16','2025-09-30 16:23:44'),(133,125,'Ketchup',290,'2025-09-25 18:38:16','2025-09-30 16:23:44'),(134,125,'Mustár',290,'2025-09-25 18:38:16','2025-09-30 16:23:44'),(135,125,'Majonéz',290,'2025-09-25 18:38:16','2025-09-30 16:23:44'),(136,125,'Tartár mártás',290,'2025-09-25 18:38:16','2025-09-30 16:23:44'),(137,128,'Sajt',490,'2025-09-30 16:07:39','2025-10-11 13:58:38'),(138,128,'Sonka',170,'2025-09-30 16:07:39','2025-10-11 13:58:38'),(139,128,'Sonka',170,'2025-09-30 16:07:39','2025-10-11 13:58:38'),(140,128,'Bacon',210,'2025-09-30 16:07:39','2025-10-11 13:58:38'),(141,128,'Cheddar sajt',170,'2025-09-30 16:07:39','2025-10-11 13:58:38'),(142,128,'olíva bogyó',170,'2025-09-30 16:07:39','2025-10-11 13:58:38'),(143,128,'Kukorica',170,'2025-09-30 16:07:39','2025-10-11 13:58:38'),(144,128,'Feta sajt',210,'2025-09-30 16:07:39','2025-10-11 13:58:38'),(145,128,'Pirított hagyma',260,'2025-09-30 16:07:39','2025-10-11 13:58:38'),(146,128,'Lila hagyma',170,'2025-09-30 16:07:39','2025-10-11 13:58:38'),(147,128,'Paradicsom',170,'2025-09-30 16:07:39','2025-10-11 13:58:38'),(148,128,'Uborka',170,'2025-09-30 16:07:39','2025-10-11 13:58:38'),(149,128,'Paprika',170,'2025-09-30 16:07:39','2025-10-11 13:58:38'),(150,128,'Ketchup',290,'2025-09-30 16:07:39','2025-10-11 13:58:38'),(151,128,'Mustár',290,'2025-09-30 16:07:39','2025-10-11 13:58:38'),(152,128,'Majonéz',290,'2025-09-30 16:07:39','2025-10-11 13:58:38'),(153,128,'Tartár mártás',290,'2025-09-30 16:07:39','2025-10-11 13:58:38'),(154,129,'Sajt',320,'2025-09-30 16:11:24','2025-10-11 14:00:16'),(155,129,'Sonka',170,'2025-09-30 16:11:24','2025-10-11 14:00:16'),(156,129,'Sonka',170,'2025-09-30 16:11:24','2025-10-11 14:00:16'),(157,129,'Bacon',210,'2025-09-30 16:11:24','2025-10-11 14:00:16'),(158,129,'Cheddar sajt',170,'2025-09-30 16:11:24','2025-10-11 14:00:16'),(159,129,'olíva bogyó',170,'2025-09-30 16:11:24','2025-10-11 14:00:16'),(160,129,'Kukorica',170,'2025-09-30 16:11:24','2025-10-11 14:00:16'),(161,129,'Feta sajt',210,'2025-09-30 16:11:24','2025-10-11 14:00:16'),(162,129,'Pirított hagyma',260,'2025-09-30 16:11:24','2025-10-11 14:00:16'),(163,129,'Lila hagyma',170,'2025-09-30 16:11:24','2025-10-11 14:00:16'),(164,129,'Paradicsom',170,'2025-09-30 16:11:24','2025-10-11 14:00:16'),(165,129,'Uborka',170,'2025-09-30 16:11:24','2025-10-11 14:00:16'),(166,129,'Paprika',170,'2025-09-30 16:11:24','2025-10-11 14:00:16'),(167,129,'Ketchup',290,'2025-09-30 16:11:24','2025-10-11 14:00:16'),(168,129,'Mustár',290,'2025-09-30 16:11:24','2025-10-11 14:00:16'),(169,129,'Majonéz',290,'2025-09-30 16:11:24','2025-10-11 14:00:16'),(170,129,'Tartár mártás',290,'2025-09-30 16:11:24','2025-10-11 14:00:16'),(171,130,'Sajt',320,'2025-09-30 16:12:43','2025-09-30 16:12:43'),(172,130,'Sonka',170,'2025-09-30 16:12:43','2025-09-30 16:12:43'),(173,130,'Sonka',170,'2025-09-30 16:12:43','2025-09-30 16:12:43'),(174,130,'Bacon',210,'2025-09-30 16:12:43','2025-09-30 16:12:43'),(175,130,'Cheddar sajt',170,'2025-09-30 16:12:43','2025-09-30 16:12:43'),(176,130,'olíva bogyó',170,'2025-09-30 16:12:43','2025-09-30 16:12:43'),(177,130,'Kukorica',170,'2025-09-30 16:12:43','2025-09-30 16:12:43'),(178,130,'Feta sajt',210,'2025-09-30 16:12:43','2025-09-30 16:12:43'),(179,130,'Pirított hagyma',260,'2025-09-30 16:12:43','2025-09-30 16:12:43'),(180,130,'Lila hagyma',170,'2025-09-30 16:12:43','2025-09-30 16:12:43'),(181,130,'Paradicsom',170,'2025-09-30 16:12:43','2025-09-30 16:12:43'),(182,130,'Uborka',170,'2025-09-30 16:12:43','2025-09-30 16:12:43'),(183,130,'Paprika',170,'2025-09-30 16:12:43','2025-09-30 16:12:43'),(184,130,'Ketchup',290,'2025-09-30 16:12:43','2025-09-30 16:12:43'),(185,130,'Mustár',290,'2025-09-30 16:12:43','2025-09-30 16:12:43'),(186,130,'Majonéz',290,'2025-09-30 16:12:43','2025-09-30 16:12:43'),(187,130,'Tartár mártás',290,'2025-09-30 16:12:43','2025-09-30 16:12:43'),(188,131,'Sajt',320,'2025-09-30 16:13:26','2025-09-30 16:13:26'),(189,131,'Sonka',170,'2025-09-30 16:13:26','2025-09-30 16:13:26'),(190,131,'Sonka',170,'2025-09-30 16:13:26','2025-09-30 16:13:26'),(191,131,'Bacon',210,'2025-09-30 16:13:26','2025-09-30 16:13:26'),(192,131,'Cheddar sajt',170,'2025-09-30 16:13:26','2025-09-30 16:13:26'),(193,131,'olíva bogyó',170,'2025-09-30 16:13:26','2025-09-30 16:13:26'),(194,131,'Kukorica',170,'2025-09-30 16:13:26','2025-09-30 16:13:26'),(195,131,'Feta sajt',210,'2025-09-30 16:13:26','2025-09-30 16:13:26'),(196,131,'Pirított hagyma',260,'2025-09-30 16:13:26','2025-09-30 16:13:26'),(197,131,'Lila hagyma',170,'2025-09-30 16:13:26','2025-09-30 16:13:26'),(198,131,'Paradicsom',170,'2025-09-30 16:13:26','2025-09-30 16:13:26'),(199,131,'Uborka',170,'2025-09-30 16:13:26','2025-09-30 16:13:26'),(200,131,'Paprika',170,'2025-09-30 16:13:26','2025-09-30 16:13:26'),(201,131,'Ketchup',290,'2025-09-30 16:13:26','2025-09-30 16:13:26'),(202,131,'Mustár',290,'2025-09-30 16:13:26','2025-09-30 16:13:26'),(203,131,'Majonéz',290,'2025-09-30 16:13:26','2025-09-30 16:13:26'),(204,131,'Tartár mártás',290,'2025-09-30 16:13:26','2025-09-30 16:13:26'),(205,132,'Sajt',320,'2025-09-30 16:15:35','2025-10-12 15:11:40'),(206,132,'Sonka',170,'2025-09-30 16:15:35','2025-10-12 15:11:40'),(207,132,'Sonka',170,'2025-09-30 16:15:35','2025-10-12 15:11:40'),(208,132,'Bacon',210,'2025-09-30 16:15:35','2025-10-12 15:11:40'),(209,132,'Cheddar sajt',170,'2025-09-30 16:15:35','2025-10-12 15:11:40'),(210,132,'olíva bogyó',170,'2025-09-30 16:15:35','2025-10-12 15:11:40'),(211,132,'Kukorica',170,'2025-09-30 16:15:35','2025-10-12 15:11:40'),(212,132,'Feta sajt',210,'2025-09-30 16:15:35','2025-10-12 15:11:40'),(213,132,'Pirított hagyma',260,'2025-09-30 16:15:35','2025-10-12 15:11:40'),(214,132,'Lila hagyma',170,'2025-09-30 16:15:35','2025-10-12 15:11:40'),(215,132,'Paradicsom',170,'2025-09-30 16:15:35','2025-10-12 15:11:40'),(216,132,'Uborka',170,'2025-09-30 16:15:35','2025-10-12 15:11:40'),(217,132,'Paprika',170,'2025-09-30 16:15:35','2025-10-12 15:11:40'),(218,132,'Ketchup',290,'2025-09-30 16:15:35','2025-10-12 15:11:40'),(219,132,'Mustár',290,'2025-09-30 16:15:35','2025-10-12 15:11:40'),(220,132,'Majonéz',290,'2025-09-30 16:15:35','2025-10-12 15:11:40'),(221,132,'Tartár mártás',290,'2025-09-30 16:15:35','2025-10-12 15:11:40'),(222,133,'Sajt',320,'2025-09-30 16:16:41','2025-10-12 15:11:31'),(223,133,'Sonka',170,'2025-09-30 16:16:41','2025-10-12 15:11:31'),(224,133,'Sonka',170,'2025-09-30 16:16:41','2025-10-12 15:11:31'),(225,133,'Bacon',210,'2025-09-30 16:16:41','2025-10-12 15:11:31'),(226,133,'Cheddar sajt',170,'2025-09-30 16:16:41','2025-10-12 15:11:31'),(227,133,'olíva bogyó',170,'2025-09-30 16:16:41','2025-10-12 15:11:31'),(228,133,'Kukorica',170,'2025-09-30 16:16:41','2025-10-12 15:11:31'),(229,133,'Feta sajt',210,'2025-09-30 16:16:41','2025-10-12 15:11:31'),(230,133,'Pirított hagyma',260,'2025-09-30 16:16:41','2025-10-12 15:11:31'),(231,133,'Lila hagyma',170,'2025-09-30 16:16:41','2025-10-12 15:11:31'),(232,133,'Paradicsom',170,'2025-09-30 16:16:41','2025-10-12 15:11:31'),(233,133,'Uborka',170,'2025-09-30 16:16:41','2025-10-12 15:11:31'),(234,133,'Paprika',170,'2025-09-30 16:16:41','2025-10-12 15:11:31'),(235,133,'Ketchup',290,'2025-09-30 16:16:41','2025-10-12 15:11:31'),(236,133,'Mustár',290,'2025-09-30 16:16:41','2025-10-12 15:11:31'),(237,133,'Majonéz',290,'2025-09-30 16:16:41','2025-10-12 15:11:31'),(238,133,'Tartár mártás',290,'2025-09-30 16:16:41','2025-10-12 15:11:31'),(239,121,'Sajt',450,'2025-09-30 16:20:50','2025-09-30 16:20:50'),(240,121,'Sonka',170,'2025-09-30 16:20:50','2025-09-30 16:20:50'),(241,121,'Sonka',170,'2025-09-30 16:20:50','2025-09-30 16:20:50'),(242,121,'Bacon',210,'2025-09-30 16:20:50','2025-09-30 16:20:50'),(243,121,'Cheddar sajt',170,'2025-09-30 16:20:50','2025-09-30 16:20:50'),(244,121,'olíva bogyó',170,'2025-09-30 16:20:50','2025-09-30 16:20:50'),(245,121,'Kukorica',170,'2025-09-30 16:20:50','2025-09-30 16:20:50'),(246,121,'Feta sajt',210,'2025-09-30 16:20:50','2025-09-30 16:20:50'),(247,121,'Pirított hagyma',260,'2025-09-30 16:20:50','2025-09-30 16:20:50'),(248,121,'Lila hagyma',170,'2025-09-30 16:20:50','2025-09-30 16:20:50'),(249,121,'Paradicsom',170,'2025-09-30 16:20:50','2025-09-30 16:20:50'),(250,121,'Uborka',170,'2025-09-30 16:20:50','2025-09-30 16:20:50'),(251,121,'Paprika',170,'2025-09-30 16:20:50','2025-09-30 16:20:50'),(252,121,'Ketchup',290,'2025-09-30 16:20:50','2025-09-30 16:20:50'),(253,121,'Mustár',290,'2025-09-30 16:20:50','2025-09-30 16:20:50'),(254,121,'Majonéz',290,'2025-09-30 16:20:50','2025-09-30 16:20:50'),(255,121,'Tartár mártás',290,'2025-09-30 16:20:50','2025-09-30 16:20:50'),(256,124,'Sajt',450,'2025-09-30 16:21:08','2025-09-30 16:21:08'),(257,124,'Sonka',170,'2025-09-30 16:21:08','2025-09-30 16:21:08'),(258,124,'Sonka',170,'2025-09-30 16:21:08','2025-09-30 16:21:08'),(259,124,'Bacon',210,'2025-09-30 16:21:08','2025-09-30 16:21:08'),(260,124,'Cheddar sajt',170,'2025-09-30 16:21:08','2025-09-30 16:21:08'),(261,124,'olíva bogyó',170,'2025-09-30 16:21:08','2025-09-30 16:21:08'),(262,124,'Kukorica',170,'2025-09-30 16:21:08','2025-09-30 16:21:08'),(263,124,'Feta sajt',210,'2025-09-30 16:21:08','2025-09-30 16:21:08'),(264,124,'Pirított hagyma',260,'2025-09-30 16:21:08','2025-09-30 16:21:08'),(265,124,'Lila hagyma',170,'2025-09-30 16:21:08','2025-09-30 16:21:08'),(266,124,'Paradicsom',170,'2025-09-30 16:21:08','2025-09-30 16:21:08'),(267,124,'Uborka',170,'2025-09-30 16:21:08','2025-09-30 16:21:08'),(268,124,'Paprika',170,'2025-09-30 16:21:08','2025-09-30 16:21:08'),(269,124,'Ketchup',290,'2025-09-30 16:21:08','2025-09-30 16:21:08'),(270,124,'Mustár',290,'2025-09-30 16:21:08','2025-09-30 16:21:08'),(271,124,'Majonéz',290,'2025-09-30 16:21:08','2025-09-30 16:21:08'),(272,124,'Tartár mártás',290,'2025-09-30 16:21:08','2025-09-30 16:21:08'),(273,120,'Sajt',230,'2025-09-30 16:21:57','2025-09-30 16:21:57'),(274,120,'Sonka',170,'2025-09-30 16:21:57','2025-09-30 16:21:57'),(275,120,'Sonka',170,'2025-09-30 16:21:57','2025-09-30 16:21:57'),(276,120,'Bacon',210,'2025-09-30 16:21:57','2025-09-30 16:21:57'),(277,120,'Cheddar sajt',170,'2025-09-30 16:21:57','2025-09-30 16:21:57'),(278,120,'olíva bogyó',170,'2025-09-30 16:21:57','2025-09-30 16:21:57'),(279,120,'Kukorica',170,'2025-09-30 16:21:57','2025-09-30 16:21:57'),(280,120,'Feta sajt',210,'2025-09-30 16:21:57','2025-09-30 16:21:57'),(281,120,'Pirított hagyma',260,'2025-09-30 16:21:57','2025-09-30 16:21:57'),(282,120,'Lila hagyma',170,'2025-09-30 16:21:57','2025-09-30 16:21:57'),(283,120,'Paradicsom',170,'2025-09-30 16:21:57','2025-09-30 16:21:57'),(284,120,'Uborka',170,'2025-09-30 16:21:57','2025-09-30 16:21:57'),(285,120,'Paprika',170,'2025-09-30 16:21:57','2025-09-30 16:21:57'),(286,120,'Ketchup',290,'2025-09-30 16:21:57','2025-09-30 16:21:57'),(287,120,'Mustár',290,'2025-09-30 16:21:57','2025-09-30 16:21:57'),(288,120,'Majonéz',290,'2025-09-30 16:21:57','2025-09-30 16:21:57'),(289,120,'Tartár mártás',290,'2025-09-30 16:21:57','2025-09-30 16:21:57'),(290,119,'Sajt',230,'2025-09-30 16:22:47','2025-09-30 16:22:47'),(291,119,'Sonka',170,'2025-09-30 16:22:47','2025-09-30 16:22:47'),(292,119,'Sonka',170,'2025-09-30 16:22:47','2025-09-30 16:22:47'),(293,119,'Bacon',210,'2025-09-30 16:22:47','2025-09-30 16:22:47'),(294,119,'Cheddar sajt',170,'2025-09-30 16:22:47','2025-09-30 16:22:47'),(295,119,'olíva bogyó',170,'2025-09-30 16:22:47','2025-09-30 16:22:47'),(296,119,'Kukorica',170,'2025-09-30 16:22:47','2025-09-30 16:22:47'),(297,119,'Feta sajt',210,'2025-09-30 16:22:47','2025-09-30 16:22:47'),(298,119,'Pirított hagyma',260,'2025-09-30 16:22:47','2025-09-30 16:22:47'),(299,119,'Lila hagyma',170,'2025-09-30 16:22:47','2025-09-30 16:22:47'),(300,119,'Paradicsom',170,'2025-09-30 16:22:47','2025-09-30 16:22:47'),(301,119,'Uborka',170,'2025-09-30 16:22:47','2025-09-30 16:22:47'),(302,119,'Paprika',170,'2025-09-30 16:22:47','2025-09-30 16:22:47'),(303,119,'Ketchup',290,'2025-09-30 16:22:47','2025-09-30 16:22:47'),(304,119,'Mustár',290,'2025-09-30 16:22:47','2025-09-30 16:22:47'),(305,119,'Majonéz',290,'2025-09-30 16:22:47','2025-09-30 16:22:47'),(306,119,'Tartár mártás',290,'2025-09-30 16:22:47','2025-09-30 16:22:47'),(307,127,'Sajt',230,'2025-09-30 16:23:22','2025-09-30 16:23:22'),(308,127,'Sonka',170,'2025-09-30 16:23:22','2025-09-30 16:23:22'),(309,127,'Sonka',170,'2025-09-30 16:23:22','2025-09-30 16:23:22'),(310,127,'Bacon',210,'2025-09-30 16:23:22','2025-09-30 16:23:22'),(311,127,'Cheddar sajt',170,'2025-09-30 16:23:22','2025-09-30 16:23:22'),(312,127,'olíva bogyó',170,'2025-09-30 16:23:22','2025-09-30 16:23:22'),(313,127,'Kukorica',170,'2025-09-30 16:23:22','2025-09-30 16:23:22'),(314,127,'Feta sajt',210,'2025-09-30 16:23:22','2025-09-30 16:23:22'),(315,127,'Pirított hagyma',260,'2025-09-30 16:23:22','2025-09-30 16:23:22'),(316,127,'Lila hagyma',170,'2025-09-30 16:23:22','2025-09-30 16:23:22'),(317,127,'Paradicsom',170,'2025-09-30 16:23:22','2025-09-30 16:23:22'),(318,127,'Uborka',170,'2025-09-30 16:23:22','2025-09-30 16:23:22'),(319,127,'Paprika',170,'2025-09-30 16:23:22','2025-09-30 16:23:22'),(320,127,'Ketchup',290,'2025-09-30 16:23:22','2025-09-30 16:23:22'),(321,127,'Mustár',290,'2025-09-30 16:23:22','2025-09-30 16:23:22'),(322,127,'Majonéz',290,'2025-09-30 16:23:22','2025-09-30 16:23:22'),(323,127,'Tartár mártás',290,'2025-09-30 16:23:22','2025-09-30 16:23:22'),(324,126,'Sajt',230,'2025-09-30 16:23:35','2025-09-30 16:23:35'),(325,126,'Sonka',170,'2025-09-30 16:23:35','2025-09-30 16:23:35'),(326,126,'Sonka',170,'2025-09-30 16:23:35','2025-09-30 16:23:35'),(327,126,'Bacon',210,'2025-09-30 16:23:35','2025-09-30 16:23:35'),(328,126,'Cheddar sajt',170,'2025-09-30 16:23:35','2025-09-30 16:23:35'),(329,126,'olíva bogyó',170,'2025-09-30 16:23:35','2025-09-30 16:23:35'),(330,126,'Kukorica',170,'2025-09-30 16:23:35','2025-09-30 16:23:35'),(331,126,'Feta sajt',210,'2025-09-30 16:23:35','2025-09-30 16:23:35'),(332,126,'Pirított hagyma',260,'2025-09-30 16:23:35','2025-09-30 16:23:35'),(333,126,'Lila hagyma',170,'2025-09-30 16:23:35','2025-09-30 16:23:35'),(334,126,'Paradicsom',170,'2025-09-30 16:23:35','2025-09-30 16:23:35'),(335,126,'Uborka',170,'2025-09-30 16:23:35','2025-09-30 16:23:35'),(336,126,'Paprika',170,'2025-09-30 16:23:35','2025-09-30 16:23:35'),(337,126,'Ketchup',290,'2025-09-30 16:23:35','2025-09-30 16:23:35'),(338,126,'Mustár',290,'2025-09-30 16:23:35','2025-09-30 16:23:35'),(339,126,'Majonéz',290,'2025-09-30 16:23:35','2025-09-30 16:23:35'),(340,126,'Tartár mártás',290,'2025-09-30 16:23:35','2025-09-30 16:23:35'),(341,164,'+2db Nuggets',260,'2025-09-30 17:40:13','2025-09-30 17:40:13'),(342,168,'+2db Nuggets',300,'2025-09-30 17:47:11','2025-09-30 17:47:11'),(343,168,'+4db nuggets',600,'2025-09-30 17:47:11','2025-09-30 17:47:11'),(344,178,'Sima',0,'2025-10-02 16:25:21','2025-10-02 17:00:13'),(345,178,'Zéro',0,'2025-10-02 16:25:21','2025-10-02 17:00:13'),(346,177,'Sima',0,'2025-10-02 16:25:51','2025-10-02 16:29:16'),(347,177,'Zéro',0,'2025-10-02 16:25:51','2025-10-02 16:29:16'),(348,180,'Sima',0,'2025-10-02 16:30:17','2025-10-02 16:34:20'),(349,180,'Mentes',0,'2025-10-02 16:30:17','2025-10-02 16:34:20'),(350,185,'Zero',0,'2025-10-02 16:39:12','2025-10-02 16:39:12'),(351,185,'Tuti frutti',0,'2025-10-02 16:39:12','2025-10-02 16:39:12'),(352,185,'Focus',0,'2025-10-02 16:39:12','2025-10-02 16:39:12'),(353,185,'Dinnyés',0,'2025-10-02 16:39:12','2025-10-02 16:39:12'),(354,272,'Sima',0,'2025-10-12 15:05:03','2025-10-12 15:05:03'),(355,272,'Zéró',0,'2025-10-12 15:05:03','2025-10-12 15:05:03'),(356,274,'Sima',0,'2025-10-12 15:31:45','2025-10-12 15:31:45'),(357,274,'Zero',0,'2025-10-12 15:31:45','2025-10-12 15:31:45'),(358,60,'Cheddar sajt',320,'2026-09-27 20:53:48','2026-09-27 20:53:48'),(359,60,'Bacon',390,'2026-09-27 20:53:48','2026-09-27 20:53:48');
/*!40000 ALTER TABLE `extras` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `faqs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faqs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reorder_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `faqs` WRITE;
/*!40000 ALTER TABLE `faqs` DISABLE KEYS */;
/*!40000 ALTER TABLE `faqs` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `favorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favorite` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `item_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `favorite` WRITE;
/*!40000 ALTER TABLE `favorite` DISABLE KEYS */;
/*!40000 ALTER TABLE `favorite` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `footer_features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `footer_features` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `icon` varchar(255) NOT NULL,
  `title` text NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `footer_features` WRITE;
/*!40000 ALTER TABLE `footer_features` DISABLE KEYS */;
/*!40000 ALTER TABLE `footer_features` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `galleries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `galleries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `galleries` WRITE;
/*!40000 ALTER TABLE `galleries` DISABLE KEYS */;
/*!40000 ALTER TABLE `galleries` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `global_extras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `global_extras` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `branch_id` int(11) NOT NULL,
  `reorder_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `price` text NOT NULL,
  `is_available` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `global_extras` WRITE;
/*!40000 ALTER TABLE `global_extras` DISABLE KEYS */;
INSERT INTO `global_extras` VALUES (1,1,0,'Sajt','320',1,'2025-09-04 09:12:42','2025-09-04 09:13:17'),(2,1,0,'Sonka','170',1,'2025-09-04 14:25:10','2025-09-04 14:25:10'),(3,1,0,'Sonka','170',1,'2025-09-04 14:25:14','2025-09-04 14:25:14'),(4,1,0,'Bacon','210',1,'2025-09-04 14:25:24','2025-09-04 14:25:49'),(5,1,0,'Cheddar sajt','170',1,'2025-09-04 14:25:43','2025-09-04 14:25:43'),(6,1,0,'olíva bogyó','170',1,'2025-09-04 14:26:05','2025-09-04 14:26:05'),(7,1,0,'Kukorica','170',1,'2025-09-04 14:26:17','2025-09-04 14:26:17'),(8,1,0,'Feta sajt','210',1,'2025-09-04 14:26:57','2025-09-04 14:26:57'),(9,1,0,'Pirított hagyma','260',1,'2025-09-04 14:27:15','2025-09-04 14:27:15'),(10,1,0,'Lila hagyma','170',1,'2025-09-04 14:27:31','2025-09-04 14:27:31'),(11,1,0,'Paradicsom','170',1,'2025-09-04 14:27:46','2025-09-04 14:27:46'),(12,1,0,'Uborka','170',1,'2025-09-04 14:27:58','2025-09-04 14:27:58'),(13,1,0,'Paprika','170',1,'2025-09-04 14:28:12','2025-09-04 14:28:12'),(14,1,0,'Ketchup','290',1,'2025-09-04 14:28:26','2025-09-04 14:28:26'),(15,1,0,'Mustár','290',1,'2025-09-04 14:28:34','2025-09-04 14:28:34'),(16,1,0,'Majonéz','290',1,'2025-09-04 14:28:50','2025-09-04 14:29:07'),(17,1,0,'Tartár mártás','290',1,'2025-09-04 14:29:25','2025-09-04 14:29:25');
/*!40000 ALTER TABLE `global_extras` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `reorder_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `subcat_id` int(11) NOT NULL COMMENT 'subcategory id from subcategories table',
  `item_name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `item_type` int(11) DEFAULT NULL COMMENT '1=veg,2=nonveg',
  `has_extras` int(11) DEFAULT 2 COMMENT '1=yes,2=no',
  `price` varchar(11) DEFAULT '0',
  `qty` int(11) DEFAULT NULL,
  `original_price` varchar(255) DEFAULT '0',
  `addons_id` varchar(255) DEFAULT NULL,
  `item_description` longtext DEFAULT NULL,
  `item_allergens` longtext DEFAULT NULL,
  `preparation_time` varchar(255) DEFAULT NULL COMMENT 'In minutes',
  `tax` varchar(255) NOT NULL,
  `video_url` varchar(255) DEFAULT NULL,
  `avg_ratting` float NOT NULL,
  `discount_percentage` float NOT NULL,
  `item_status` int(11) NOT NULL DEFAULT 1 COMMENT '1 = Yes , 2 = No',
  `is_featured` int(11) DEFAULT 2 COMMENT '1=yes,2=no',
  `is_top_deals` int(11) NOT NULL DEFAULT 2 COMMENT '1=Yes 2=No',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `today_unavailable` tinyint(1) DEFAULT 0,
  `unavailable_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=275 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (60,0,4,0,'Házi Burger','hazi-burger',NULL,1,1,'2260',NULL,'0','9,11','170 gr marha húspogácsa, hamburger puffancs, hamburger szósz, 2 db cheddar sajt szelet, karamellizált lilahagyma, 1 paradicsom szelet, jégsaláta','<p>1,3,7,6</p>','0','1',NULL,0,0,1,2,2,'2025-09-07 12:47:23','2026-09-27 20:53:48',0,NULL),(61,0,4,0,'Házi Burger Plusz','hazi-burger-plusz',NULL,1,2,'2420',NULL,'0','9','170 gr marha húspogácsa, 2 db bacon szelet, hamburger puffancs, hamburger szósz, 2 db cheddar sajt szelet, karamellizált lilahagyma, 1 paradicsom szelet, jégsaláta','1,3,7,6','0','1',NULL,0,0,1,2,2,'2025-09-07 12:47:23','2025-10-12 10:31:54',0,NULL),(62,0,4,0,'Házi Burger Maxi','hazi-burger-maxi',NULL,1,2,'2640',NULL,'0','9','170 gr marha húspogácsa, 2 db bacon szelet, 1 db tükörtojás, hamburger puffancs, 2 db cheddar sajt szelet, hamburger szósz, karamellizált lilahagyma, 1 paradicsom szelet, jégsaláta','1,3,7,6','0','1',NULL,0,0,1,2,2,'2025-09-07 12:47:23','2025-09-09 14:54:15',0,NULL),(63,0,4,0,'Jasper burger','jasper-burger',NULL,1,2,'2420',NULL,'0','9','170 gr marha húspogácsa, 2 db bacon szelet, hamburger puffancs, barbecue szósz, 2 db cheddar sajt szelet, savanyú uborka, karamellizált lilahagyma, jégsaláta','1,7,6','0','1',NULL,0,0,1,2,2,'2025-09-07 12:47:23','2025-09-09 14:53:34',0,NULL),(64,0,4,0,'Chicken burger','chicken-burger',NULL,1,2,'1860',NULL,'0','9','150gr natúr cs.mell hús szelet, hamburger puffancs, hamburger szósz, 2 db cheddar sajt szelet, paradicsom 1 szelet, jégsaláta','1,7','0','1',NULL,0,0,1,2,2,'2025-09-07 12:47:23','2025-09-07 12:47:23',0,NULL),(65,0,4,0,'Fishburger','fishburger',NULL,1,2,'1790',NULL,'0','9','4 db halrudacska, hamburger puffancs, házi öntet, 2 szelet paradicsom, jégsaláta','1,4,3','0','1',NULL,0,0,1,2,2,'2025-09-07 12:47:23','2025-09-09 14:50:55',0,NULL),(66,0,7,0,'Hot-dog sima','hot-dog-sima',NULL,1,2,'1130',NULL,'0',NULL,'Gyros kifli, Virsli, Ketchup, Mustár','1,6,10','0','1',NULL,0,0,1,2,2,'2025-09-07 12:51:51','2025-09-30 17:05:14',0,NULL),(67,0,7,0,'Hot-dog Sajtos','hot-dog-sajtos',NULL,1,2,'1390',NULL,'0',NULL,'Gyros kifli, Virsli, Trappista sajt, Ketchup, Mustár','1,6,7,10','0','2',NULL,0,0,1,2,2,'2025-09-07 12:51:51','2025-09-30 17:07:48',0,NULL),(68,0,7,0,'Hot-dog Chilis','hot-dog-chilis',NULL,1,2,'1180',NULL,'0',NULL,'Gyros kifli, Virsli, Chilli szósz,mustár','1,6,10','0','1',NULL,0,0,1,2,2,'2025-09-07 12:51:51','2025-09-30 17:08:32',0,NULL),(69,0,7,0,'Hot-dog Sajtos-Chilis','hot-dog-sajtos-chilis',NULL,1,2,'1430',NULL,'0',NULL,'Gyros kifli, Virsli, Trappista sajt, Chilli szósz','1,6,7,10','0','1',NULL,0,0,1,2,2,'2025-09-07 12:51:51','2025-09-30 17:09:01',0,NULL),(70,0,7,0,'Hot-dog zöldséges','hot-dog-zoldseges',NULL,1,2,'1250',NULL,'0',NULL,'Gyros kifli, Virsli, Ketchup, Mustár, Paradicsom, Paprika, Uborka','1,6,10','0','2',NULL,0,0,1,2,2,'2025-09-07 12:51:51','2025-09-30 17:09:44',0,NULL),(71,0,7,0,'Hot-dog zöldséges sajtos','hot-dog-zoldseges-sajtos',NULL,1,2,'1490',NULL,'0',NULL,'Gyros kifli, Virsli, Trappista sajt, Ketchup, Mustár, Paradicsom, Paprika, Uborka','1,6,7,10','0','1',NULL,0,0,1,2,2,'2025-09-07 12:51:51','2025-09-30 17:10:06',0,NULL),(76,0,2,0,'Gyros kifliben','gyros-kifliben',NULL,2,1,'1790',NULL,'0','9,11','Gyros kifli, Gyros-hús (csirkemell), Gyros mártás, Paradicsom, Paprika, Uborka, Lilahagyma. Választható öntetek: házi öntet, magyaros házi öntet (csípős), kapros-joghurtos öntet, tzatziki öntet','<p>1,7</p>','0','1',NULL,0,0,1,2,2,'2025-09-07 13:06:11','2026-09-27 20:46:14',0,NULL),(77,0,2,0,'Gyros pitában','gyros-pitaban',NULL,1,1,'1790',NULL,'0','9','Gyros pita, csirkemell gyros hús, gyros mártás, sült burgonya, paradicsom,uborka, lilahagyma, ketchup','1,7','0','1',NULL,0,0,1,2,2,'2025-09-07 13:06:11','2025-09-25 18:39:21',0,NULL),(78,0,2,0,'Gyros tortillában','gyros-tortillaban',NULL,1,1,'1790',NULL,'0','9','Gyros tortilla, Gyros-hús (csirkemell), Gyros mártás, Paradicsom, Paprika, Uborka, Lilahagyma. Választható öntetek: házi öntet, magyaros házi öntet (csípős), kapros-joghurtos öntet, tzatziki öntet','1,7','0','1',NULL,0,0,1,2,2,'2025-09-07 13:06:11','2025-09-25 18:14:41',0,NULL),(85,0,8,0,'Chillis Marhahúsos','chillis-marhahusos',NULL,1,2,'1870',NULL,'0',NULL,NULL,'1','0','1',NULL,0,0,2,2,2,'2025-09-07 13:21:02','2025-10-02 16:15:25',0,NULL),(86,0,8,0,'Extra Lepény','extra-lepeny',NULL,1,2,'1870',NULL,'0',NULL,NULL,'1','0','1',NULL,0,0,2,2,2,'2025-09-07 13:21:02','2025-10-02 16:15:25',0,NULL),(87,0,8,0,'Görög Csirkés Lepény','gorog-csirkes-lepeny',NULL,1,2,'1870',NULL,'0',NULL,NULL,'1,7','0','1',NULL,0,0,2,2,2,'2025-09-07 13:21:02','2025-10-02 16:15:25',0,NULL),(88,0,8,0,'Kolbászos Lepény','kolbaszos-lepeny',NULL,1,2,'1870',NULL,'0',NULL,NULL,'1','0','1',NULL,0,0,2,2,2,'2025-09-07 13:21:02','2025-10-02 16:15:25',0,NULL),(89,0,8,0,'Paradicsomos Mozzarellás','paradicsomos-mozzarellas',NULL,1,2,'1870',NULL,'0',NULL,NULL,'1,7','0','1',NULL,0,0,2,2,2,'2025-09-07 13:21:02','2025-10-02 16:15:25',0,NULL),(90,0,8,0,'Parajos-Fetás','parajos-fetas',NULL,1,2,'1870',NULL,'0',NULL,NULL,'1,7','0','1',NULL,0,0,2,2,2,'2025-09-07 13:21:02','2025-10-02 16:15:25',0,NULL),(91,0,8,0,'Sonkás-Sajtos','sonkas-sajtos-lepeny',NULL,1,2,'1870',NULL,'0',NULL,NULL,'1,7','0','1',NULL,0,0,2,2,2,'2025-09-07 13:21:02','2025-10-02 16:15:25',0,NULL),(92,0,9,0,'Cézár saláta','cezar-salata',NULL,1,2,'2290',NULL,'0','9','Sült csirkemell darabkák, Paradicsom, Jégsaláta, Uborka, Cézár öntet, Pirított kenyér kockák','1','0','1',NULL,0,0,1,2,2,'2025-09-07 13:22:19','2025-09-30 17:56:07',0,NULL),(93,0,9,0,'Görög saláta','gorog-salata',NULL,1,2,'1990',NULL,'0','9','Paradicsom, Paprika, Uborka, Feta sajt, Olívabogyó','7','0','1',NULL,0,0,1,2,2,'2025-09-07 13:22:19','2025-09-30 17:57:09',0,NULL),(95,0,9,0,'Csirkemell saláta','csirkemell-salata',NULL,1,2,'2290',NULL,'0','9','Paradicsom, Paprika, Uborka, Jégsaláta, Sült csirkemell darabkák, Gyros mártás','','0','1',NULL,0,0,1,2,2,'2025-09-07 13:22:19','2025-09-30 17:54:25',0,NULL),(112,0,11,0,'Milka táblás','milka-tablas',NULL,1,2,'760',NULL,'0',NULL,NULL,NULL,'0','1',NULL,0,0,2,2,2,'2025-09-07 13:31:19','2025-10-12 14:38:01',0,NULL),(113,0,11,0,'Mogyoró/csom.','mogyoro-csom',NULL,1,2,'570',NULL,'0',NULL,NULL,NULL,'0','1',NULL,0,0,2,2,2,'2025-09-07 13:31:19','2025-10-12 14:38:01',0,NULL),(114,0,11,0,'Ropi/csom.','ropi-csom',NULL,1,2,'310',NULL,'0',NULL,NULL,NULL,'0','1',NULL,0,0,2,2,2,'2025-09-07 13:31:19','2025-10-12 14:38:01',0,NULL),(115,0,11,0,'Orbit rágó/csom.','orbit-rago-csom',NULL,1,2,'420',NULL,'0',NULL,NULL,NULL,'0','1',NULL,0,0,2,2,2,'2025-09-07 13:31:19','2025-10-12 14:38:01',0,NULL),(116,0,11,0,'Chio chips','chio-chips',NULL,1,2,'680',NULL,'0',NULL,NULL,NULL,'0','1',NULL,0,0,2,2,2,'2025-09-07 13:31:19','2025-10-12 14:38:01',0,NULL),(117,0,11,0,'Balaton szelet','balaton-szelet',NULL,1,2,'290',NULL,'0',NULL,NULL,NULL,'0','1',NULL,0,0,2,2,2,'2025-09-07 13:31:19','2025-10-12 14:38:01',0,NULL),(118,0,11,0,'Moments','moments',NULL,1,2,'290',NULL,'0',NULL,NULL,NULL,'0','1',NULL,0,0,2,2,2,'2025-09-07 13:31:19','2025-10-12 14:38:01',0,NULL),(119,0,14,0,'Csirke Döner (pitában)','csirke-doner-pitaban',NULL,1,2,'1890',NULL,'0','3,9','csirke kebab hús, pita, paradicsom, jégsaláta, uborka, lila káposzta, 2 féle választható szósz','1','30','1',NULL,0,0,1,1,2,'2025-09-25 17:04:28','2025-09-30 16:22:47',0,NULL),(120,0,14,0,'Csirke Dürüm (tortillában)','csirke-durum-tortillaban',NULL,1,2,'2390',NULL,'0','3,9','csirke kebab hús, tortilla, paradicsom, jégsaláta, uborka, lila káposzta, 2 féle választható szósz','1','30','1',NULL,0,0,1,2,2,'2025-09-25 17:16:46','2025-09-30 16:21:57',0,NULL),(121,0,14,0,'Kebab-tál','kebab-tal',NULL,2,2,'2990',NULL,'0','3,9','(csirke kebab hús 15 dkg, rácsos pita, sültburgonya 20 dkg, paradicsom, jégsaláta, uborka, lila káposzta, 2 féle választható szósz)','1','30','1',NULL,0,0,1,2,2,'2025-09-25 17:18:14','2025-09-30 16:20:50',0,NULL),(122,0,14,0,'Kebab-tál EXTRA','kebab-tal-extra',NULL,1,2,'3490',NULL,'0','3,9','(csirke kebab hús 20 dkg, rácsos pita, sültburgonya 30 dkg, paradicsom, jégsaláta, uborka, lila káposzta, 2 féle választható szósz)','1','40','1',NULL,0,0,1,2,2,'2025-09-25 17:21:03','2025-09-25 17:21:03',0,NULL),(123,0,14,0,'Csirke Döner (pitában) menü','csirke-doner-pitaban-menu',NULL,1,2,'2550',NULL,'0','3,4,9','(csirke döner, sültburgonya 15 dkg, 0,33l dobozos üdítő választható ízben)','1','30','1,4',NULL,0,0,1,2,2,'2025-09-25 17:45:31','2025-09-25 17:45:31',0,NULL),(124,0,14,0,'Csirke Dürüm (tortillában) menü','csirke-durum-tortillaban-menu',NULL,1,1,'2950',NULL,'0','3,4,9','csirke dürüm, sültburgonya 15 dkg, 0,33l dobozos üdítő választható ízben','1','30','1,4',NULL,0,0,1,2,2,'2025-09-25 18:08:14','2025-09-30 16:21:08',0,NULL),(125,0,2,0,'Gyros pitában menü','gyros-pitaban-menu',NULL,1,1,'2490',NULL,'0','4,9','gyros pitában, sültburgonya 15 dkg,  0,33l dobozos üdítő választható ízben','1,7','30','1,4',NULL,0,0,1,2,2,'2025-09-25 18:38:16','2025-09-30 16:23:44',0,NULL),(126,0,2,0,'Gyros tortillában menü','gyros-tortillaban-menu',NULL,1,1,'2490',NULL,'0','4,9','gyros tortillában, sültburgonya 15 dkg,  0,33l dobozos üdítő választható ízben','1,7','30','1,4',NULL,0,0,1,2,2,'2025-09-25 18:40:38','2025-09-30 16:23:35',0,NULL),(127,0,2,0,'Gyros kifliben menü','gyros-kifliben-menu',NULL,1,1,'2490',NULL,'0','4,9','gyros kifliben, sültburgonya 15 dkg,  0,33l dobozos üdítő választható ízben','1,7','30','1,4',NULL,0,0,1,2,2,'2025-09-25 18:47:43','2025-09-30 16:23:22',0,NULL),(128,0,3,0,'Gyros-tál','gyros-tal',NULL,1,1,'2340',NULL,'0','1,2,9','csirkemell gyros hús, sült burgonya, gyros mártás, paradicsom, jégsaláta, uborka, lilahagyma, ketchup','1,7,9,10','30','1',NULL,0,0,1,2,2,'2025-09-30 16:07:03','2025-10-11 13:58:38',0,NULL),(129,0,3,0,'Gyros-tál, sajttal','gyros-tal-sajttal',NULL,1,1,'2830',NULL,'0','1,2,9','( csirkemell gyros hús, gyros mártás, sült burgonya, trappista sajt, paradicsom, jégsaláta, uborka, lilahagyma, ketchup','1,7,9,10','30','1',NULL,0,0,1,2,2,'2025-09-30 16:11:24','2025-10-11 14:00:16',0,NULL),(132,0,3,0,'Gyros-tál EXTRA, sajt nélkül','gyros-tal-extra-sajt-nelkul',NULL,1,1,'3130',NULL,'0','1,9,10','csirkemell gyros hús, sült burgonya, gyros mártás, paradicsom, jégsaláta, uborka, lilahagyma, ketchup','<p>1,9,10</p>','30','1',NULL,0,0,1,2,2,'2025-09-30 16:15:35','2025-10-12 15:11:40',0,NULL),(133,0,3,0,'Gyros-tál EXTRA, sajttal','gyros-tal-extra-sajttal',NULL,1,1,'3720',NULL,'0','1,9,10','csirkemell gyros hús, sült burgonya, trappista sajt, gyros mártás, paradicsom, jégsaláta, uborka, lilahagyma, ketchup','<p>1,7,9,10</p>','30','1',NULL,0,0,1,2,2,'2025-09-30 16:16:41','2025-10-12 15:11:31',0,NULL),(134,0,4,3,'Házi burger párosajánlat','hazi-burger-parosajanlat',NULL,1,2,'4780',NULL,'0','4,5,9','2 db Házi burger, 2 adag sültburgonya, 2 db 0,33l-es dobozos üdítő','1,3,7,6','40','1,3,4,5',NULL,0,0,1,2,2,'2025-09-30 16:28:49','2025-09-30 18:08:09',0,NULL),(135,0,4,3,'Házi burger menü','hazi-burger-menu',NULL,1,2,'2660',NULL,'0','4,9','Házi burger + sült burgonya + 0,33l-es dob.üdítő','1,3,7,6','30','1,4',NULL,0,0,1,2,2,'2025-09-30 16:33:11','2025-09-30 18:07:32',0,NULL),(136,0,4,3,'Házi burger plusz menü','hazi-burger-plusz-menu',NULL,1,2,'2790',NULL,'0','4,9','Házi burger plusz + sült burgonya + 0,33l-es dob.üdítő','1,3,7,6','30','1,4',NULL,0,0,1,2,2,'2025-09-30 16:34:46','2025-10-11 12:23:41',0,NULL),(137,0,4,3,'Házi burger maxi menü','hazi-burger-maxi-menu',NULL,1,2,'2950',NULL,'0','4,9','Házi burger maxi + sült burgonya + 0,33l-es dob.üdítő','1,3,7,6','30','1,4',NULL,0,0,1,2,2,'2025-09-30 16:36:34','2025-09-30 18:07:22',0,NULL),(138,0,4,3,'Jasper-burger menü','jasper-burger-menu',NULL,1,2,'2790',NULL,'0','4,9','Jasper-burger + sült burgonya + 0,33l-es dob.üdítő','1,3,7,6','30','1,4',NULL,0,0,1,2,2,'2025-09-30 16:38:41','2025-09-30 18:08:21',0,NULL),(139,0,4,3,'Chickenburger menü','chickenburger-menu',NULL,1,2,'2330',NULL,'0','4,9','Chickenburger + sült burgonya + 0,33l-es dob.üdítő','1','30','1,4',NULL,0,0,1,2,2,'2025-09-30 16:39:28','2025-09-30 18:09:10',0,NULL),(140,0,4,3,'Fishburger menü','fishburger-menu',NULL,1,2,'2230',NULL,'0','4,9','Fishburger + sült burgonya + 0,33l-es dob.üdítő','1,4','30','1,4',NULL,0,0,1,2,2,'2025-09-30 16:40:46','2025-09-30 18:09:19',0,NULL),(141,0,1,0,'Hamburger (classic)-menü (sertés húsból)','hamburger-classic-menu-sertes-husbol',NULL,1,2,'2090',NULL,'0','4,9','Hamburger (classic) + sült burgonya + 0,33l-es dob.üdítő','1','30','1,4',NULL,0,0,1,2,2,'2025-09-30 16:43:08','2025-09-30 16:43:08',0,NULL),(142,0,1,0,'Hamburger classic','hamburger-classic',NULL,1,2,'1460',NULL,'0','9','puffancs, sertés húspogácsa,  paradicsom, paprika, uborka, lilahagyma, ketchup, mustár, jégsaláta','10','30','2',NULL,0,0,1,2,2,'2025-09-30 16:44:11','2025-09-30 16:44:11',0,NULL),(143,0,1,0,'Hamburger sajtos','hamburger-sajtos',NULL,1,2,'1690',NULL,'0','9','puffancs, sertés húspogácsa, trappista sajt, paradicsom, paprika, uborka, lilahagyma, jégsaláta ketchup, mustár','7,10','30','2',NULL,0,0,1,2,2,'2025-09-30 16:44:52','2025-09-30 16:44:52',0,NULL),(144,0,1,0,'Hamburger chillis ízesítéssel','hamburger-chillis-izesitessel',NULL,1,2,'1510',NULL,'0','9','puffancs, sertés húspogácsa,  paradicsom, paprika, uborka, lilahagyma, mustár, chili szósz, jégsaláta','10','30','2',NULL,0,0,1,2,2,'2025-09-30 16:47:18','2025-09-30 16:47:18',0,NULL),(145,0,1,0,'Hamburger sajtos-chillis ízesítéssel','hamburger-sajtos-chillis-izesitessel',NULL,1,2,'1750',NULL,'0','9','puffancs, sertés húspogácsa, trappista sajt, paradicsom, paprika, uborka, lilahagyma, mustár, chili szósz, jégsaláta','7,10','30','2',NULL,0,0,1,2,2,'2025-09-30 16:49:55','2025-09-30 16:49:55',0,NULL),(146,0,1,0,'Hamburger dupla húspogácsával','hamburger-dupla-huspogacsaval',NULL,1,2,'1780',NULL,'0','9','puffancs, 2 db sertés húspogácsa,  paradicsom, paprika, uborka, lilahagyma, mustár, ketchup, jégsaláta','10','30','2',NULL,0,0,1,2,2,'2025-09-30 16:50:42','2025-09-30 16:50:42',0,NULL),(147,0,1,0,'Hamburger dupla húspogácsával,sajttal','hamburger-dupla-huspogacsavalsajttal',NULL,1,2,'2030',NULL,'0','9','puffancs, 2 db sertés húspogácsa, trappista sajt, paradicsom, paprika, uborka, lilahagyma, mustár, ketchup, jégsaláta','7,10','30','2',NULL,0,0,1,2,2,'2025-09-30 16:51:47','2025-09-30 16:51:47',0,NULL),(148,0,1,0,'Hamburger dupla húspogácsával, chillis ízesítéssel','hamburger-dupla-huspogacsaval-chillis-izesitessel',NULL,1,2,'1810',NULL,'0','9','puffancs, 2 db sertés húspogácsa,  paradicsom, paprika, uborka, lilahagyma, mustár, chili szósz, jégsaláta','10','30','2',NULL,0,0,1,2,2,'2025-09-30 16:52:54','2025-09-30 16:52:54',0,NULL),(149,0,12,0,'Óriás hamburger normal','orias-hamburger-normal',NULL,1,2,'2160',NULL,'0','9','buci, 2 db sertés húspogácsa,  paradicsom, paprika, uborka, lilahagyma, mustár, ketchup, jégsaláta','10','30','2',NULL,0,0,1,2,2,'2025-09-30 17:02:00','2025-09-30 17:02:00',0,NULL),(150,0,12,0,'Óriás hamburger sajtos','orias-hamburger-sajtos-149',NULL,1,2,'2530',NULL,'0','9','buci, 2 db sertés húspogácsa, trappista sajt, paradicsom, paprika, uborka, lilahagyma, mustár, ketchup, jégsaláta','7,10','30','2',NULL,0,0,1,2,2,'2025-09-30 17:02:50','2025-09-30 17:02:50',0,NULL),(151,0,12,0,'Óriás hamburger chillis','orias-hamburger-chillis',NULL,1,2,'2210',NULL,'0','9','buci, 2 db sertés húspogácsa,  paradicsom, paprika, uborka, lilahagyma, mustár, chili szósz, jégsaláta','10','30','2',NULL,0,0,1,2,2,'2025-09-30 17:03:33','2025-09-30 17:03:33',0,NULL),(152,0,12,0,'Óriás hamburger sajtos-chillis','orias-hamburger-sajtos-chillis',NULL,1,2,'2560',NULL,'0','9','buci, 2 db sertés húspogácsa, trappista sajt, paradicsom, paprika, uborka, lilahagyma, mustár, ketchup, jégsaláta','7,10','30','2',NULL,0,0,1,2,2,'2025-09-30 17:04:17','2025-09-30 17:04:23',0,NULL),(153,0,13,0,'Melegszendvics sonkás-sajtos','melegszendvics-sonkas-sajtos',NULL,1,2,'1050',NULL,'0','','kifli, sonka szelet, trappista sajt, ketchup','7','30','2',NULL,0,0,1,2,2,'2025-09-30 17:15:07','2025-09-30 17:15:07',0,NULL),(154,0,13,0,'Melegszendvics provenci krém-sajtos','melegszendvics-provenci-krem-sajtos',NULL,1,2,'990',NULL,'0','','kifli, provenci krém, trappista sajt, ketchup','7','30','2',NULL,0,0,1,2,2,'2025-09-30 17:15:48','2025-09-30 17:15:48',0,NULL),(155,0,13,0,'Melegszendvics szalámis-sajtos','melegszendvics-szalamis-sajtos',NULL,1,2,'1280',NULL,'0',NULL,'( kifli, szalámi szeletek, trappista sajt, ketchup','7','30','2',NULL,0,0,1,2,2,'2025-09-30 17:23:47','2025-09-30 17:23:47',0,NULL),(156,0,3,0,'Vega-tál','vega-tal',NULL,1,2,'2050',NULL,'0','2,9','( sült burgonya, trappista sajt, gyros mártás, paradicsom, paprika, uborka, lilahagyma, ketchup','1,7','30','1',NULL,0,0,1,2,2,'2025-09-30 17:24:30','2025-09-30 17:24:30',0,NULL),(157,0,1,0,'Vega-burger','vega-burger',NULL,1,2,'1760',NULL,'0',NULL,'puffancs, rántott sajt, rántott hagyma karikák, paradicsom, paprika, uborka, majonéz, ketchup, jégsaláta','1,7,3','30','2',NULL,0,0,1,2,2,'2025-09-30 17:25:08','2025-09-30 17:25:08',0,NULL),(158,0,15,0,'Rántott sajt választható körettel','rantott-sajt-valaszthato-korettel',NULL,1,2,'1990',NULL,'0','2','2 db rántott trappista sajt, választható köret: sült burgonya, jázmin rizs, vegyes köret','1,3,7','30','2',NULL,0,0,1,2,2,'2025-09-30 17:28:32','2025-09-30 17:28:32',0,NULL),(159,0,15,0,'Natúr csirkemell szeletek sajttal, választható körettel','natur-csirkemell-szeletek-sajttal-valaszthato-korettel',NULL,1,2,'1860',NULL,'0','2','2 db natúr csirkemell szelet, választható köret: sült burgonya, jázmin rizs, vegyes köret','7','30','1',NULL,0,0,1,2,2,'2025-09-30 17:29:11','2025-09-30 17:29:11',0,NULL),(160,0,15,0,'Rántott halrudacskák választható körettel','rantott-halrudacskak-valaszthato-korettel',NULL,1,2,'1790',NULL,'0','2','6 db rántott halrudacska, választható köret: sült burgonya, jázmin rizs, vegyes köret','1,4','30','1',NULL,0,0,1,2,2,'2025-09-30 17:33:13','2025-09-30 17:33:13',0,NULL),(161,0,15,0,'Rántott csirkemell szeletek választható körettel','rantott-csirkemell-szeletek-valaszthato-korettel',NULL,1,2,'2310',NULL,'0','2','2 db rántott csirkemell szelet, választhatóköret: sült burgonya, jázmin rizs, vegyes köret','1,3','30','1',NULL,0,0,1,2,2,'2025-09-30 17:34:16','2025-09-30 17:34:16',0,NULL),(162,0,15,0,'Édes-chillis csirkemell falatkák választható körettel','edes-chillis-csirkemell-falatkak-valaszthato-korettel',NULL,1,2,'2790',NULL,'0','2','10 db rántott édes-chillis csirkemell falatkák, választható köret: sült burgonya, jázmin rizs, vegyes köret','1','30','1',NULL,0,0,1,2,2,'2025-09-30 17:35:13','2025-09-30 17:35:13',0,NULL),(163,0,15,0,'Texasi-csirke szárny falatkák választható körettel','texasi-csirke-szarny-falatkak-valaszthato-korettel',NULL,1,2,'2690',NULL,'0','2','5 db rántott, texasi- csirke szárny, választható köret: sült burgonya, jázmin rizs, vegyes köret','1','30','1',NULL,0,0,1,2,2,'2025-09-30 17:35:58','2025-09-30 17:35:58',0,NULL),(164,0,15,0,'Nuggets-menü','nuggets-menu',NULL,1,1,'1660',NULL,'0','2,4','4 vagy 6 db csirkemell NUGGETS falatkák + választható köret: sült burgonya, jázmin rizs, vegyes köret + szósz + 0,33l-es dob. üdítő','1,3,7','30','1,4',NULL,0,0,1,2,2,'2025-09-30 17:40:13','2025-09-30 17:40:13',0,NULL),(165,0,15,0,'Rántott sajt-menü','rantott-sajt-menu',NULL,1,2,'2150',NULL,'0','2,4','2 db rántott sajt + választható köret: sült burgonya, jázmin rizs, vegyes köret + szósz + 0,33l-es dob. üdítő','1,7','30','1,4',NULL,0,0,1,2,2,'2025-09-30 17:41:16','2025-09-30 17:41:16',0,NULL),(166,0,15,0,'Édes chillis csirke falatkák-menü','edes-chillis-csirke-falatkak-menu',NULL,1,2,'2890',NULL,'0','2','10 db édes –chillis rántott csirkemell falatkák + választható köret: sült burgonya, jázmin rizs, vegyes köret + szósz + 0,33l-es dob. üdítő','<p>1</p>','30','1,4',NULL,0,0,1,2,2,'2025-09-30 17:44:34','2025-10-14 15:22:41',0,NULL),(167,0,15,0,'Rántott szelet-menü','rantott-szelet-menu',NULL,1,2,'2660',NULL,'0','2,4','2 db rántott csirkemell szelet + választható köret: sült burgonya, jázmin rizs, vegyes köret + savanyú uborka + 0,33l-es dob. üdítő','<p>1</p>','30','1,4',NULL,0,0,1,2,2,'2025-09-30 17:45:18','2025-10-14 15:24:41',0,NULL),(168,0,15,0,'Csirke Nuggets falatkák 4, 6 vagy 8 db','csirke-nuggets-falatkak-4-6-vagy-8-db',NULL,2,1,'650',NULL,'0','','csirkemell nuggets falatkák','1,3,7','30','1',NULL,0,0,1,2,2,'2025-09-30 17:47:11','2025-09-30 17:47:11',0,NULL),(169,0,16,0,'Babgulyás 500ml','babgulyas-500ml',NULL,1,2,'1410',NULL,'0',NULL,'sertés lapockából és füstölt csülökből','1,9','40','1',NULL,0,0,1,2,2,'2025-09-30 17:49:03','2025-09-30 17:49:03',0,NULL),(170,0,15,0,'Sült burgonya','sult-burgonya',NULL,1,2,'720',NULL,'0',NULL,'1 adag kb.15 dkg','','20','2',NULL,0,0,1,2,2,'2025-09-30 17:50:12','2025-09-30 17:50:12',0,NULL),(171,0,15,0,'Párolt jázmin rizs','parolt-jazmin-rizs',NULL,1,2,'720',NULL,'0',NULL,'1 adag kb. 25 dkg','','20','2',NULL,0,0,1,2,2,'2025-09-30 17:50:51','2025-09-30 17:50:58',0,NULL),(172,0,15,0,'Vegyes köret','vegyes-koret',NULL,1,2,'720',NULL,'0',NULL,'sült burgonya, jázmin rizs','','20','2',NULL,0,0,1,2,2,'2025-09-30 17:53:47','2025-09-30 17:53:47',0,NULL),(173,0,10,0,'Palacsinta','palacsinta',NULL,1,2,'430',NULL,'0','6','kakaós, ízes, nutellás, fahéjas, csokis, karamellás ízekben','1,3,7','20','2',NULL,0,0,1,2,2,'2025-09-30 18:00:00','2025-09-30 18:00:07',0,NULL),(174,0,10,0,'Gesztenyepüré','gesztenyepure',NULL,1,2,'980',NULL,'0',NULL,'reszelt gesztenyepüré, tejszínhab','7','20','2',NULL,0,0,1,2,2,'2025-09-30 18:01:38','2025-09-30 18:01:38',0,NULL),(175,0,10,0,'Marlenka szelet','marlenka-szelet',NULL,1,2,'590',NULL,'0','7','csokis, diós, citromos ízekben','1,3,7,8','20','2',NULL,0,0,1,2,2,'2025-09-30 18:02:36','2025-09-30 18:03:45',0,NULL),(176,0,10,0,'Baklava szelet','baklava-szelet',NULL,1,2,'890',NULL,'0','8','diós, csokis-diós ízekben','1,8','20','2',NULL,0,0,1,2,2,'2025-09-30 18:05:26','2025-09-30 18:05:26',0,NULL),(177,0,5,6,'Pepsi 1L','pepsi-1l',NULL,1,1,'940',NULL,'0',NULL,NULL,NULL,'2','4',NULL,0,0,1,2,2,'2025-10-02 16:24:06','2025-10-02 16:29:16',0,NULL),(178,0,5,6,'Pepsi 0,33','pepsi-033',NULL,1,1,'520',NULL,'0',NULL,NULL,NULL,'2','4',NULL,0,0,1,2,2,'2025-10-02 16:25:21','2025-10-02 17:00:13',0,NULL),(179,0,5,6,'Ice Tea 0,5','ice-tea-05',NULL,1,2,'630',NULL,'0',NULL,NULL,NULL,'2','4',NULL,0,0,1,2,2,'2025-10-02 16:28:41','2025-10-02 16:34:34',0,NULL),(180,0,5,6,'Ásványviz 0,5','asvanyviz-05',NULL,1,1,'370',NULL,'0',NULL,NULL,NULL,'2','4',NULL,0,0,1,2,2,'2025-10-02 16:30:17','2025-10-02 16:34:20',0,NULL),(181,0,5,7,'Toma Gyümölcs 0,25','toma-gyumolcs-025',NULL,1,2,'540',NULL,'0',NULL,'',NULL,'2','4',NULL,0,0,1,2,2,'2025-10-02 16:33:41','2025-10-02 16:34:48',0,NULL),(182,0,5,0,'Toma Gyümölcs 0,33','toma-gyumolcs-033',NULL,1,2,'630',NULL,'0',NULL,NULL,NULL,'2','4',NULL,0,0,1,2,2,'2025-10-02 16:35:35','2025-10-02 16:35:35',0,NULL),(183,0,5,7,'Toma Gyümölcs 0,5','toma-gyumolcs-05',NULL,1,2,'630',NULL,'0',NULL,NULL,NULL,'2','4',NULL,0,0,1,2,2,'2025-10-02 16:36:03','2025-10-02 16:36:09',0,NULL),(184,0,5,4,'Red Bull','red-bull',NULL,1,2,'860',NULL,'0',NULL,NULL,NULL,'2','4',NULL,0,0,1,2,2,'2025-10-02 16:37:17','2025-10-02 16:37:17',0,NULL),(185,0,5,4,'HELL','hell',NULL,1,1,'520',NULL,'0',NULL,NULL,NULL,'2','4',NULL,0,0,1,2,2,'2025-10-02 16:39:12','2025-10-02 16:39:12',0,NULL),(186,0,5,4,'HELL energy cofee','hell-energy-cofee',NULL,1,2,'650',NULL,'0',NULL,NULL,NULL,'2','4',NULL,0,0,1,2,2,'2025-10-02 16:39:49','2025-10-02 16:39:49',0,NULL),(187,0,5,4,'Bomba','bomba',NULL,1,2,'550',NULL,'0',NULL,NULL,NULL,'2','4',NULL,0,0,1,2,2,'2025-10-02 16:40:21','2025-10-02 16:40:21',0,NULL),(188,0,5,4,'Tutty juice','tutty-juice',NULL,1,2,'520',NULL,'0',NULL,NULL,NULL,'2','4',NULL,0,0,1,2,2,'2025-10-02 16:41:12','2025-10-02 16:41:12',0,NULL),(189,0,5,6,'Mirinda 1L','mirinda-1l',NULL,1,2,'830',NULL,'0',NULL,NULL,NULL,'2','4',NULL,0,0,1,2,2,'2025-10-02 16:41:57','2025-10-02 16:41:57',0,NULL),(190,0,5,5,'Borsodi','borsodi',NULL,1,2,'620',NULL,'0',NULL,NULL,NULL,'2','4',NULL,0,0,1,2,2,'2025-10-02 16:42:59','2025-10-02 16:42:59',0,NULL),(191,0,5,5,'Kőbányai','kobanyai',NULL,1,2,'620',NULL,'0',NULL,NULL,NULL,'2','4',NULL,0,0,1,2,2,'2025-10-02 16:44:01','2025-10-02 16:44:01',0,NULL),(192,0,5,5,'Soproni','soproni',NULL,1,2,'620',NULL,'0',NULL,NULL,NULL,'2','4',NULL,0,0,1,2,2,'2025-10-02 16:44:59','2025-10-02 16:44:59',0,NULL),(193,0,5,5,'Soproni Radler 2% meggy','soproni-radler-2-meggy',NULL,1,2,'670',NULL,'0',NULL,NULL,NULL,'2','4',NULL,0,0,1,2,2,'2025-10-02 16:46:11','2025-10-02 16:46:11',0,NULL),(194,0,5,5,'Soproni Zéro 0,0%','soproni-zero-00',NULL,1,2,'620',NULL,'0',NULL,NULL,NULL,'2','4',NULL,0,0,1,2,2,'2025-10-02 16:48:06','2025-10-02 16:48:06',0,NULL),(195,0,5,5,'Soproni zéró citrom 0,0%','soproni-zero-citrom-00',NULL,1,2,'620',NULL,'0',NULL,NULL,NULL,'2','4',NULL,0,0,1,2,2,'2025-10-02 16:48:55','2025-10-02 16:48:55',0,NULL),(196,0,5,5,'Gösser 0,0%','gosser-00',NULL,1,2,'620',NULL,'0',NULL,NULL,NULL,'2','4',NULL,0,0,1,2,2,'2025-10-02 16:51:03','2025-10-02 16:51:03',0,NULL),(197,0,5,5,'Tuborg green 0,33','tuborg-green-033',NULL,1,2,'630',NULL,'0',NULL,NULL,NULL,'2','4',NULL,0,0,1,2,2,'2025-10-02 16:52:41','2025-10-02 16:52:41',0,NULL),(198,0,5,5,'Gösser Citrom','gosser-citrom',NULL,1,2,'650',NULL,'0',NULL,NULL,NULL,'2','4',NULL,0,0,1,2,2,'2025-10-02 16:53:20','2025-10-02 16:53:20',0,NULL),(199,0,5,5,'Heineken 0,33','heineken-033',NULL,1,2,'650',NULL,'0',NULL,NULL,NULL,'2','4',NULL,0,0,1,2,2,'2025-10-02 16:54:05','2025-10-02 16:54:05',0,NULL),(200,0,5,5,'Heineken zero 0,33','heineken-zero-033',NULL,1,2,'650',NULL,'0',NULL,NULL,NULL,'2','4',NULL,0,0,1,2,2,'2025-10-02 16:55:04','2025-10-02 16:55:04',0,NULL),(201,0,5,5,'Miller 0,33','miller-033',NULL,1,2,'650',NULL,'0',NULL,NULL,NULL,'2','4',NULL,0,0,1,2,2,'2025-10-02 16:55:55','2025-10-02 16:55:55',0,NULL),(236,0,17,11,'Csirke Döner (pitában) menü','csirke-doner-pitaban-menu-251',NULL,1,2,'2550',NULL,'0','3,4,9','(csirke döner, sültburgonya 15 dkg, 0,33l dobozos üdítő választható ízben)','1,7','30','1,4',NULL,0,0,1,2,2,'2025-09-25 17:45:31','2025-10-11 13:49:01',0,NULL),(237,0,17,11,'Csirke Dürüm (tortillában) menü','csirke-durum-tortillaban-menu',NULL,1,1,'2950',NULL,'0','3,4,9','csirke dürüm, sültburgonya 15 dkg, 0,33l dobozos üdítő választható ízben','1,7','30','1,4',NULL,0,0,1,2,2,'2025-09-25 18:08:14','2025-09-30 16:21:08',0,NULL),(241,0,17,8,'Házi burger menü','hazi-burger-menu',NULL,1,2,'2660',NULL,'0','4,9','Házi burger + sült burgonya + 0,33l-es dob.üdítő','1,3,7,6','30','1,4',NULL,0,0,1,2,2,'2025-09-30 16:33:11','2025-09-30 18:07:32',0,NULL),(242,0,17,8,'Házi burger plusz menü','hazi-burger-plusz-menu',NULL,1,2,'2790',NULL,'0','4,9','Házi burger plusz + sült burgonya + 0,33l-es dob.üdítő','1,3,7,6','30','1,4',NULL,0,0,1,2,2,'2025-09-30 16:34:46','2025-10-11 12:23:41',0,NULL),(243,0,17,8,'Házi burger maxi menü','hazi-burger-maxi-menu',NULL,1,2,'2950',NULL,'0','4,9','Házi burger maxi + sült burgonya + 0,33l-es dob.üdítő','1,3,7,6','30','1,4',NULL,0,0,1,2,2,'2025-09-30 16:36:34','2025-09-30 18:07:22',0,NULL),(244,0,17,8,'Jasper-burger menü','jasper-burger-menu',NULL,1,2,'2790',NULL,'0','4,9','Jasper-burger + sült burgonya + 0,33l-es dob.üdítő','1','30','1,4',NULL,0,0,1,2,2,'2025-09-30 16:38:41','2025-09-30 18:08:21',0,NULL),(245,0,17,8,'Chickenburger menü','chickenburger-menu-251',NULL,1,2,'2330',NULL,'0','4,9','Chickenburger + sült burgonya + 0,33l-es dob.üdítő','1','30','1,4',NULL,0,0,1,2,2,'2025-09-30 16:39:28','2025-10-11 13:48:50',0,NULL),(246,0,17,8,'Fishburger menü','fishburger-menu-251',NULL,1,2,'2230',NULL,'0','4,9','Fishburger + sült burgonya + 0,33l-es dob.üdítő','1,4','30','1,4',NULL,0,0,1,2,2,'2025-09-30 16:40:46','2025-10-11 13:47:35',0,NULL),(247,0,17,8,'Hamburger (classic)-menü (sertés húsból)','hamburger-classic-menu-sertes-husbol',NULL,1,2,'2090',NULL,'0','4,9','Hamburger (classic) + sült burgonya + 0,33l-es dob.üdítő','1','30','1,4',NULL,0,0,1,2,2,'2025-09-30 16:43:08','2025-09-30 16:43:08',0,NULL),(248,0,17,9,'Nuggets-menü','nuggets-menu-251',NULL,1,1,'1660',NULL,'0','2,4','4 vagy 6 db csirkemell NUGGETS falatkák + választható köret: sült burgonya, jázmin rizs, vegyes köret + szósz + 0,33l-es dob. üdítő','1,3,7','30','1,4',NULL,0,0,1,2,2,'2025-09-30 17:40:13','2025-10-11 13:47:21',0,NULL),(249,0,17,9,'Rántott sajt-menü','rantott-sajt-menu-251',NULL,1,2,'2150',NULL,'0','2,4','2 db rántott sajt + választható köret: sült burgonya, jázmin rizs, vegyes köret + szósz + 0,33l-es dob. üdítő','1,7','30','1,4',NULL,0,0,1,2,2,'2025-09-30 17:41:16','2025-10-11 13:47:09',0,NULL),(250,0,17,9,'Édes chillis csirke falatkák-menü','edes-chillis-csirke-falatkak-menu-274',NULL,1,2,'2890',NULL,'0','2','10 db édes –chillis rántott csirkemell falatkák + választható köret: sült burgonya, jázmin rizs, vegyes köret + szósz + 0,33l-es dob. üdítő','<p>1</p>','30','1,4',NULL,0,0,1,2,2,'2025-09-30 17:44:34','2025-10-14 15:23:02',0,NULL),(251,0,17,9,'Rántott szelet-menü','rantott-szelet-menu-274',NULL,1,2,'2660',NULL,'0','2,4','2 db rántott csirkemell szelet + választható köret: sült burgonya, jázmin rizs, vegyes köret + savanyú uborka + 0,33l-es dob. üdítő','<p>1</p>','30','1,4',NULL,0,0,1,2,2,'2025-09-30 17:45:18','2025-10-14 15:24:36',0,NULL),(268,0,17,3,'Házi burger párosajánlat','hazi-burger-parosajanlat',NULL,1,2,'4780',NULL,'0','4,5,9','2 db Házi burger, 2 adag sültburgonya, 2 db 0,33l-es dobozos üdítő','1','40','1,3,4,5',NULL,0,0,1,2,2,'2025-09-30 16:28:49','2025-09-30 18:08:09',0,NULL),(269,0,17,12,'Gyros kifliben menü','gyros-kifliben-menu-271',NULL,1,1,'2490',NULL,'0','4,9','gyros kifliben, sültburgonya 15 dkg,  0,33l dobozos üdítő választható ízben','1,7','30','1,4',NULL,0,0,1,2,2,'2025-09-25 18:47:43','2025-10-12 09:08:21',0,NULL),(270,0,17,12,'Gyros tortillában menü','gyros-tortillaban-menu-271',NULL,1,1,'2490',NULL,'0','4,9','gyros tortillában, sültburgonya 15 dkg,  0,33l dobozos üdítő választható ízben','1,7','30','1,4',NULL,0,0,1,2,2,'2025-09-25 18:40:38','2025-10-12 09:09:39',0,NULL),(271,0,17,12,'Gyros pitában menü','gyros-pitaban-menu-271',NULL,1,1,'2490',NULL,'0','4,9','gyros pitában, sültburgonya 15 dkg,  0,33l dobozos üdítő választható ízben','1,7','30','1,4',NULL,0,0,1,2,2,'2025-09-25 18:38:16','2025-10-12 09:10:29',0,NULL),(272,0,5,6,'Pepsi 0,5','pepsi-05',NULL,1,1,'680',NULL,'0',NULL,NULL,NULL,'1','4',NULL,0,0,1,2,2,'2025-10-12 15:04:19','2025-10-12 15:05:03',0,NULL),(273,0,5,6,'Schweppes 0,5','schweppes-05',NULL,1,2,'630',NULL,'0',NULL,NULL,NULL,'0','4',NULL,0,0,1,2,2,'2025-10-12 15:29:00','2025-10-12 15:29:00',0,NULL),(274,0,5,6,'Pepsi 0,22','pepsi-022',NULL,1,1,'480',NULL,'0',NULL,NULL,NULL,'0','4',NULL,0,0,1,2,2,'2025-10-12 15:31:45','2025-10-12 15:31:45',0,NULL);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `item_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_images` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` bigint(20) unsigned NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_images_item_id_foreign` (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=244 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `item_images` WRITE;
/*!40000 ALTER TABLE `item_images` DISABLE KEYS */;
INSERT INTO `item_images` VALUES (1,1,'item-687e3a6d9f42d.jpg','2025-07-21 13:02:37','2025-07-21 13:02:37'),(62,60,'foodpro-burger.png','2025-09-07 12:47:23','2025-09-09 14:54:54'),(63,61,'foodpro-burger.png','2025-09-07 12:47:23','2025-09-09 14:54:35'),(64,62,'foodpro-burger.png','2025-09-07 12:47:23','2025-09-09 14:54:13'),(65,63,'foodpro-burger.png','2025-09-07 12:47:23','2025-09-09 14:53:48'),(66,64,'foodpro-burger.png','2025-09-07 12:47:23','2025-09-09 14:51:08'),(67,65,'foodpro-burger.png','2025-09-07 12:47:23','2025-09-09 14:50:51'),(68,66,'foodpro-wrap.png','2025-09-07 12:51:51','2025-09-30 17:05:12'),(69,67,'foodpro-wrap.png','2025-09-07 12:51:51','2025-09-30 17:07:33'),(70,68,'foodpro-wrap.png','2025-09-07 12:51:51','2025-09-30 17:08:16'),(71,69,'foodpro-wrap.png','2025-09-07 12:51:51','2025-09-30 17:08:59'),(72,70,'foodpro-wrap.png','2025-09-07 12:51:51','2025-09-30 17:09:33'),(73,71,'foodpro-wrap.png','2025-09-07 12:51:51','2025-09-30 17:10:03'),(78,76,'foodpro-wrap.png','2025-09-07 13:06:11','2025-09-25 18:11:08'),(79,77,'foodpro-wrap.png','2025-09-07 13:06:11','2025-09-25 18:15:23'),(80,78,'foodpro-wrap.png','2025-09-07 13:06:11','2025-09-07 11:06:51'),(87,85,'foodpro-wrap.png','2025-09-07 13:21:02','2025-09-07 13:21:02'),(88,86,'foodpro-wrap.png','2025-09-07 13:21:02','2025-09-07 13:21:02'),(89,87,'foodpro-wrap.png','2025-09-07 13:21:02','2025-09-07 13:21:02'),(90,88,'foodpro-wrap.png','2025-09-07 13:21:02','2025-09-07 13:21:02'),(91,89,'foodpro-wrap.png','2025-09-07 13:21:02','2025-09-07 13:21:02'),(92,90,'foodpro-wrap.png','2025-09-07 13:21:02','2025-09-07 13:21:02'),(93,91,'foodpro-wrap.png','2025-09-07 13:21:02','2025-09-07 13:21:02'),(94,92,'foodpro-salad.png','2025-09-07 13:22:19','2025-09-30 17:56:05'),(95,93,'foodpro-salad.png','2025-09-07 13:22:19','2025-09-30 17:56:22'),(97,95,'foodpro-salad.png','2025-09-07 13:22:19','2025-09-30 17:54:23'),(114,112,'foodpro-dessert.png','2025-09-07 13:31:19','2025-09-07 13:31:19'),(115,113,'foodpro-dessert.png','2025-09-07 13:31:19','2025-09-07 13:31:19'),(116,114,'foodpro-dessert.png','2025-09-07 13:31:19','2025-09-07 13:31:19'),(117,115,'foodpro-dessert.png','2025-09-07 13:31:19','2025-09-07 13:31:19'),(118,116,'foodpro-dessert.png','2025-09-07 13:31:19','2025-09-07 13:31:19'),(119,117,'foodpro-dessert.png','2025-09-07 13:31:19','2025-09-07 13:31:19'),(120,118,'foodpro-dessert.png','2025-09-07 13:31:19','2025-09-07 13:31:19'),(121,119,'foodpro-wrap.png','2025-09-25 17:04:28','2025-09-25 17:16:58'),(122,120,'foodpro-wrap.png','2025-09-25 17:16:46','2025-09-25 17:16:46'),(123,121,'foodpro-wrap.png','2025-09-25 17:18:14','2025-09-25 17:18:14'),(124,122,'foodpro-wrap.png','2025-09-25 17:21:03','2025-09-25 17:21:03'),(125,123,'foodpro-wrap.png','2025-09-25 17:45:31','2025-09-25 17:45:31'),(126,124,'foodpro-wrap.png','2025-09-25 18:08:14','2025-09-25 18:08:14'),(127,125,'foodpro-wrap.png','2025-09-25 18:38:16','2025-10-12 09:10:49'),(128,126,'foodpro-wrap.png','2025-09-25 18:40:38','2025-10-12 09:10:04'),(130,202,'item-68ea540a0a896.png','2025-09-30 16:07:03','2025-10-11 12:56:42'),(131,129,'foodpro-grill.png','2025-09-30 16:11:24','2025-09-30 16:11:24'),(132,130,'item-68dc017b8ac83.png','2025-09-30 16:12:43','2025-09-30 16:12:43'),(133,131,'item-68dc01a6b3097.png','2025-09-30 16:13:26','2025-09-30 16:13:26'),(134,132,'foodpro-grill.png','2025-09-30 16:15:35','2025-09-30 16:15:35'),(135,133,'foodpro-grill.png','2025-09-30 16:16:41','2025-09-30 16:16:41'),(136,134,'foodpro-burger.png','2025-09-30 16:28:49','2025-09-30 16:28:49'),(137,135,'foodpro-burger.png','2025-09-30 16:33:11','2025-09-30 16:33:11'),(138,136,'foodpro-burger.png','2025-09-30 16:34:46','2025-09-30 16:34:46'),(139,137,'foodpro-burger.png','2025-09-30 16:36:34','2025-09-30 16:36:34'),(140,138,'foodpro-burger.png','2025-09-30 16:38:41','2025-09-30 16:38:41'),(141,139,'foodpro-burger.png','2025-09-30 16:39:28','2025-09-30 16:39:28'),(142,140,'foodpro-burger.png','2025-09-30 16:40:46','2025-09-30 16:40:46'),(143,141,'foodpro-burger.png','2025-09-30 16:43:08','2025-09-30 16:43:08'),(144,142,'foodpro-burger.png','2025-09-30 16:44:11','2025-09-30 16:44:11'),(145,143,'foodpro-burger.png','2025-09-30 16:44:52','2025-09-30 16:44:52'),(146,144,'foodpro-burger.png','2025-09-30 16:47:18','2025-09-30 16:47:18'),(147,145,'foodpro-burger.png','2025-09-30 16:49:55','2025-09-30 16:49:55'),(148,146,'foodpro-burger.png','2025-09-30 16:50:42','2025-09-30 16:50:42'),(149,147,'foodpro-burger.png','2025-09-30 16:51:47','2025-09-30 16:51:47'),(150,148,'foodpro-burger.png','2025-09-30 16:52:54','2025-09-30 16:52:54'),(151,149,'foodpro-burger.png','2025-09-30 17:02:00','2025-09-30 17:02:00'),(152,150,'foodpro-burger.png','2025-09-30 17:02:50','2025-09-30 17:02:50'),(153,151,'foodpro-burger.png','2025-09-30 17:03:33','2025-09-30 17:03:33'),(154,152,'foodpro-burger.png','2025-09-30 17:04:17','2025-09-30 17:04:17'),(155,153,'foodpro-wrap.png','2025-09-30 17:15:07','2025-09-30 17:15:07'),(156,154,'foodpro-wrap.png','2025-09-30 17:15:48','2025-09-30 17:15:48'),(157,155,'foodpro-wrap.png','2025-09-30 17:23:47','2025-09-30 17:23:47'),(158,156,'foodpro-grill.png','2025-09-30 17:24:30','2025-09-30 17:24:30'),(159,157,'foodpro-burger.png','2025-09-30 17:25:08','2025-09-30 17:25:08'),(160,158,'foodpro-grill.png','2025-09-30 17:28:32','2025-09-30 17:28:32'),(161,159,'foodpro-grill.png','2025-09-30 17:29:11','2025-09-30 17:29:11'),(162,160,'foodpro-grill.png','2025-09-30 17:33:13','2025-09-30 17:33:13'),(163,161,'foodpro-grill.png','2025-09-30 17:34:16','2025-09-30 17:34:16'),(164,162,'foodpro-grill.png','2025-09-30 17:35:13','2025-09-30 17:35:13'),(165,163,'foodpro-grill.png','2025-09-30 17:35:58','2025-09-30 17:35:58'),(166,164,'foodpro-grill.png','2025-09-30 17:40:13','2025-09-30 17:40:13'),(167,165,'foodpro-grill.png','2025-09-30 17:41:16','2025-09-30 17:41:16'),(168,166,'foodpro-grill.png','2025-09-30 17:44:34','2025-09-30 17:44:34'),(169,167,'foodpro-grill.png','2025-09-30 17:45:18','2025-09-30 17:45:18'),(170,168,'foodpro-grill.png','2025-09-30 17:47:11','2025-09-30 17:47:11'),(171,169,'foodpro-grill.png','2025-09-30 17:49:03','2025-09-30 17:49:03'),(172,170,'foodpro-grill.png','2025-09-30 17:50:12','2025-09-30 17:50:12'),(173,171,'foodpro-grill.png','2025-09-30 17:50:51','2025-09-30 17:50:51'),(174,172,'foodpro-grill.png','2025-09-30 17:53:47','2025-09-30 17:53:47'),(175,173,'foodpro-dessert.png','2025-09-30 18:00:00','2025-09-30 18:00:00'),(176,174,'foodpro-dessert.png','2025-09-30 18:01:38','2025-09-30 18:01:38'),(177,175,'foodpro-dessert.png','2025-09-30 18:02:36','2025-09-30 18:02:36'),(178,176,'foodpro-dessert.png','2025-09-30 18:05:26','2025-09-30 18:05:26'),(179,177,'foodpro-drinks.png','2025-10-02 16:24:06','2025-10-02 16:24:06'),(180,178,'foodpro-drinks.png','2025-10-02 16:25:21','2025-10-02 16:27:07'),(181,179,'foodpro-drinks.png','2025-10-02 16:28:41','2025-10-02 16:28:41'),(182,180,'foodpro-drinks.png','2025-10-02 16:30:17','2025-10-02 16:30:17'),(183,181,'foodpro-drinks.png','2025-10-02 16:33:41','2025-10-02 16:33:41'),(184,182,'foodpro-drinks.png','2025-10-02 16:35:35','2025-10-02 16:35:35'),(185,183,'foodpro-drinks.png','2025-10-02 16:36:03','2025-10-02 16:36:03'),(186,184,'foodpro-drinks.png','2025-10-02 16:37:17','2025-10-02 16:37:17'),(187,185,'foodpro-drinks.png','2025-10-02 16:39:12','2025-10-02 16:39:12'),(188,186,'foodpro-drinks.png','2025-10-02 16:39:49','2025-10-02 16:39:49'),(189,187,'foodpro-drinks.png','2025-10-02 16:40:21','2025-10-02 16:40:21'),(190,188,'foodpro-drinks.png','2025-10-02 16:41:12','2025-10-02 16:41:12'),(191,189,'foodpro-drinks.png','2025-10-02 16:41:57','2025-10-02 16:41:57'),(192,190,'foodpro-drinks.png','2025-10-02 16:42:59','2025-10-02 16:42:59'),(193,191,'foodpro-drinks.png','2025-10-02 16:44:01','2025-10-02 16:44:01'),(194,192,'foodpro-drinks.png','2025-10-02 16:44:59','2025-10-02 16:44:59'),(195,193,'foodpro-drinks.png','2025-10-02 16:46:11','2025-10-02 16:46:11'),(196,194,'foodpro-drinks.png','2025-10-02 16:48:06','2025-10-02 16:50:31'),(197,195,'foodpro-drinks.png','2025-10-02 16:48:55','2025-10-02 16:48:55'),(198,196,'foodpro-drinks.png','2025-10-02 16:51:03','2025-10-02 16:51:03'),(199,197,'foodpro-drinks.png','2025-10-02 16:52:41','2025-10-02 16:52:41'),(200,198,'foodpro-drinks.png','2025-10-02 16:53:20','2025-10-02 16:53:20'),(201,199,'foodpro-drinks.png','2025-10-02 16:54:05','2025-10-02 16:54:05'),(202,200,'foodpro-drinks.png','2025-10-02 16:55:04','2025-10-02 16:55:04'),(203,201,'foodpro-drinks.png','2025-10-02 16:55:55','0000-00-00 00:00:00'),(204,127,'foodpro-wrap.png','2025-09-25 18:47:43','2025-10-12 09:08:44'),(205,236,'foodpro-grill.png','2025-09-25 17:45:31','2025-09-25 17:45:31'),(206,237,'foodpro-grill.png','2025-09-25 18:08:14','2025-09-25 18:08:14'),(210,252,'item-68ea540a0a896.png','2025-09-30 16:07:03','2025-10-11 12:56:42'),(211,241,'foodpro-grill.png','2025-09-30 16:33:11','2025-09-30 16:33:11'),(212,242,'foodpro-grill.png','2025-09-30 16:34:46','2025-09-30 16:34:46'),(213,243,'foodpro-grill.png','2025-09-30 16:36:34','2025-09-30 16:36:34'),(214,244,'foodpro-grill.png','2025-09-30 16:38:41','2025-09-30 16:38:41'),(215,245,'foodpro-grill.png','2025-09-30 16:39:28','2025-09-30 16:39:28'),(216,246,'foodpro-grill.png','2025-09-30 16:40:46','2025-09-30 16:40:46'),(217,247,'foodpro-grill.png','2025-09-30 16:43:08','2025-09-30 16:43:08'),(218,248,'foodpro-grill.png','2025-09-30 17:40:13','2025-09-30 17:40:13'),(219,249,'foodpro-grill.png','2025-09-30 17:41:16','2025-09-30 17:41:16'),(220,250,'foodpro-grill.png','2025-09-30 17:44:34','2025-09-30 17:44:34'),(221,251,'foodpro-grill.png','2025-09-30 17:45:18','2025-09-30 17:45:18'),(236,128,'foodpro-grill.png','2025-10-11 13:58:34','2025-10-11 13:58:34'),(237,268,'foodpro-grill.png','2025-10-12 08:54:20','2025-10-12 08:54:21'),(238,269,'foodpro-grill.png','2025-10-12 09:08:18','2025-10-12 09:08:18'),(239,270,'foodpro-grill.png','2025-10-12 09:09:33','2025-10-12 09:09:33'),(240,271,'foodpro-grill.png','2025-10-12 09:10:26','2025-10-12 09:10:26'),(241,272,'foodpro-drinks.png','2025-10-12 15:04:19','2025-10-12 15:04:19'),(242,273,'foodpro-drinks.png','2025-10-12 15:29:00','2025-10-12 15:29:00'),(243,274,'foodpro-drinks.png','2025-10-12 15:31:45','2025-10-12 15:31:45');
/*!40000 ALTER TABLE `item_images` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `languages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `layout` int(11) NOT NULL DEFAULT 1 COMMENT '1=ltr,2=rtl',
  `is_default` int(11) NOT NULL DEFAULT 2 COMMENT '1 = yes , 2 = no',
  `is_available` int(11) NOT NULL DEFAULT 1 COMMENT '1=yes,2=no',
  `is_deleted` int(11) NOT NULL DEFAULT 2 COMMENT '1 = yes , 2 = no	',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,'en','English','flag-food-pro.svg',1,2,1,2,'2022-12-13 05:15:46','2025-09-07 11:47:34'),(4,'hu','Hungarian','flag-food-pro.svg',1,1,1,2,'2025-09-07 11:35:53','2025-09-07 11:48:07'),(5,'uk','Ukrainian','flag-food-pro.svg',1,2,1,2,'2025-09-07 11:36:57','2025-09-07 11:46:50');
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `manage_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manage_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `titles` text DEFAULT NULL,
  `modules` varchar(255) NOT NULL,
  `is_available` tinyint(1) NOT NULL COMMENT '1=yes,2=no',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `manage_roles` WRITE;
/*!40000 ALTER TABLE `manage_roles` DISABLE KEYS */;
INSERT INTO `manage_roles` VALUES (1,'Főni','Vezérlőpult,Rendelések,Riport,Sliderek,Bannerek,Kategóriák,Alkategóriák,Kiegészítő csoport,Termékek,Kiszállítási terület,Nyitvatartás,Üzletértékelések,Érdeklődések,Vendégek,Munkatársi szerepkörök,Munkatársak,Oldalak,Gyorsítótár törlése,Csom.,Globális extrák','0,1,2,3,4,7,8,9,10,11,12,14,16,17,19,20,21,24,30,31',1,'2025-09-13 09:33:24','2025-09-13 19:13:30'),(2,'Pultos','Vezérlőpult,Rendelések,Kiszállítási terület,Üzletértékelések,Érdeklődések','0,1,11,14,16',1,'2025-09-13 09:39:02','2025-09-13 19:12:10');
/*!40000 ALTER TABLE `manage_roles` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(6,'2020_06_05_070854_create_categories_table',2),(7,'2020_06_05_103122_create_item_table',3),(9,'2020_06_05_110205_create_item_images_table',4),(10,'2020_06_05_125414_create_ingredients_table',5),(14,'2020_06_06_055110_create_cart_table',6),(16,'2020_06_07_051607_create_order_table',7),(18,'2020_06_07_063234_create_order_details_table',8),(19,'2020_06_16_094849_create_ratting_table',9),(20,'2022_05_06_115647_create_roles_table',10),(21,'2022_05_19_042851_create_subcategories_table',11),(22,'2022_05_25_053255_create_blogs_table',12),(23,'2022_05_25_072838_create_teams_table',13),(24,'2022_05_25_100726_create_tutorials_table',14),(25,'2022_05_25_105457_create_faqs_table',15),(26,'2022_05_25_110626_create_galleries_table',16),(27,'2022_05_27_084728_create_zones_table',17),(29,'2022_06_18_074001_create_bookings_table',18),(30,'2019_12_14_000001_create_personal_access_tokens_table',19),(31,'2023_08_10_043354_create_subscribe_table',19),(32,'2025_09_13_000000_add_delivery_enabled_to_settings',20),(33,'2026_09_27_000001_add_admin_skin_to_settings',21),(34,'2026_09_28_000001_add_navigation_config_to_settings',22);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `model_has_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `model_has_roles` WRITE;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `cat_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_number` varchar(100) NOT NULL,
  `order_number_digit` varchar(255) DEFAULT NULL,
  `order_number_start` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `driver_id` int(11) DEFAULT NULL,
  `order_type` varchar(11) NOT NULL DEFAULT '1' COMMENT '1 = Delivery , 2 = Pickup',
  `address_type` varchar(10) DEFAULT NULL COMMENT '1- Home, 2-Office, 3-Other',
  `address` varchar(255) DEFAULT NULL,
  `landmark` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `postal_code` varchar(255) DEFAULT NULL,
  `offer_code` varchar(50) DEFAULT NULL,
  `discount_amount` varchar(50) DEFAULT '0.00',
  `delivery_charge` varchar(50) DEFAULT '0.00',
  `tax_amount` varchar(50) DEFAULT '0.00',
  `tax_name` varchar(255) DEFAULT NULL,
  `grand_total` varchar(255) NOT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `transaction_type` varchar(255) NOT NULL COMMENT '1 = cod, 2=wallet,3=razorpay,4=stripe/5=flutterwave,6=paystack',
  `payment_status` int(11) NOT NULL COMMENT '1=Unpaid, 2=Paid',
  `status` varchar(11) NOT NULL COMMENT '1=Order-placed(both)\r\n2=accepted-by-admin(both)\r\n3=order-ready(both)\r\n4=order-on-the-way(delivery) && waiting-for-pickup(pickup)\r\n5=order-completed(both)\r\n6=cancelled-by-admin(both)\r\n7=cancelled-by-user(both)',
  `status_type` int(11) DEFAULT NULL,
  `order_from` varchar(10) DEFAULT NULL,
  `is_notification` int(11) NOT NULL DEFAULT 1 COMMENT '1 = Unread , 2 = Read',
  `order_notes` text DEFAULT NULL,
  `delivery_date` varchar(255) DEFAULT NULL,
  `delivery_time` varchar(255) DEFAULT NULL,
  `admin_notes` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `order_id` bigint(20) unsigned DEFAULT NULL,
  `item_id` bigint(20) unsigned DEFAULT NULL,
  `item_name` varchar(255) DEFAULT NULL,
  `item_image` varchar(255) DEFAULT NULL,
  `item_type` int(11) DEFAULT NULL COMMENT '1=veg,2=nonveg ',
  `addons_id` varchar(255) DEFAULT NULL,
  `addons_name` varchar(255) DEFAULT NULL,
  `addons_price` varchar(255) DEFAULT NULL,
  `addons_total_price` varchar(255) DEFAULT NULL,
  `extras_id` varchar(255) DEFAULT NULL,
  `extras_name` varchar(255) DEFAULT NULL,
  `extras_price` varchar(255) DEFAULT NULL,
  `extras_total_price` varchar(255) DEFAULT NULL,
  `item_price` varchar(255) NOT NULL,
  `tax` double DEFAULT NULL,
  `qty` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `otp_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `otp_configuration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `twilio_sid` text DEFAULT NULL,
  `twilio_auth_token` text DEFAULT NULL,
  `twilio_mobile_number` text DEFAULT NULL,
  `msg_authkey` varchar(255) DEFAULT NULL,
  `msg_template_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `otp_configuration` WRITE;
/*!40000 ALTER TABLE `otp_configuration` DISABLE KEYS */;
/*!40000 ALTER TABLE `otp_configuration` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reorder_id` int(11) NOT NULL,
  `unique_identifier` varchar(255) DEFAULT NULL,
  `environment` int(11) NOT NULL DEFAULT 1 COMMENT '1=sandbox,2=production',
  `payment_name` text NOT NULL,
  `payment_type` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `public_key` text DEFAULT NULL,
  `secret_key` text DEFAULT NULL,
  `encryption_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `base_url_by_region` text DEFAULT NULL,
  `is_available` int(11) NOT NULL,
  `is_activate` int(11) NOT NULL COMMENT '1 = Yes, 2 = No',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,0,NULL,1,'Fizetés átvételkor',1,'cod.png','','','','','',1,1,'2020-12-28 19:54:50','2025-09-04 12:32:30'),(2,5,NULL,1,'H?ségpontok',2,'wallet.png','HUF','','','','',1,2,'2020-12-28 19:45:15','2025-09-13 06:17:28'),(3,1,'razorpay',1,'RazorPay',3,'razorpay.png','HUF','','','','',1,2,'2020-12-28 19:45:15','2024-08-05 03:53:27'),(4,4,'stripe',1,'Stripe',4,'stripe.png','USD','','','','',1,2,'2020-12-28 19:45:15','2024-08-05 03:53:21'),(5,2,'flutterwave',1,'Flutterwave',5,'flutterwave.phg','NGN','','','','',1,2,'2020-12-28 19:45:15','2024-08-05 03:53:27'),(6,3,'paystack',1,'Paystack',6,'paystack.png','GHS','','','','',1,2,'2020-12-28 19:45:15','2024-08-05 03:53:21'),(7,6,'mercadopago',1,'MercadoPago',7,'mercadopago.png','$','','','','',1,2,'2023-04-04 23:42:36','2024-08-05 03:53:21'),(8,7,'myfatoorah',1,'myFatoorah',8,'myfatoorah.png','KWD','','','','',1,2,'2023-04-05 20:44:44','2024-08-05 03:53:21'),(9,8,'paypal',1,'paypal',9,'paypal.png','USD','','','','',1,2,'2023-04-12 04:54:28','2024-08-05 03:53:21'),(10,9,'toyyibpay',1,'ToyyibPay',10,'toyyibpay.png','INR','','','','',1,2,'2023-04-14 22:52:50','2024-08-05 03:53:21'),(11,10,'paytab',1,'Paytab',11,'paytab.png','INR','','','','',1,2,'2024-02-22 06:18:21','2024-08-05 03:53:21'),(12,11,'phonepe',1,'PhonePe',12,'phonepe.png','INR','','','','',1,2,'2024-02-22 06:18:21','2024-08-05 03:53:21'),(13,12,'mollie',1,'Mollie',13,'mollie.png','EUR','','','','',1,2,'2024-02-22 06:18:21','2024-08-05 03:53:21'),(14,13,'khalti',1,'khalti',14,'khalti.png','INR','','','','',1,2,'2024-02-22 06:18:21','2024-08-05 03:53:21'),(19,14,'barion',1,'Bankkártyás fizetés (Barion teszt)',16,'paytab.png','HUF','','','','',2,1,'2025-09-16 19:17:06','2025-09-16 19:17:06');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `payment_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `payment_id` char(32) NOT NULL,
  `event` varchar(50) NOT NULL,
  `message` text DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_pl_payment` (`payment_id`),
  KEY `idx_pl_created` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=237 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `payment_logs` WRITE;
/*!40000 ALTER TABLE `payment_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_logs` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `pincode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pincode` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pincode` varchar(10) NOT NULL,
  `delivery_charge` varchar(255) NOT NULL,
  `is_available` int(11) NOT NULL DEFAULT 1 COMMENT '1=yes,2=no',
  `is_deleted` int(11) NOT NULL DEFAULT 2 COMMENT '1=yes,2=no',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `pincode` WRITE;
/*!40000 ALTER TABLE `pincode` DISABLE KEYS */;
/*!40000 ALTER TABLE `pincode` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `pixcel_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pixcel_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `facebook_pixcel_id` varchar(255) DEFAULT NULL,
  `twitter_pixcel_id` varchar(255) DEFAULT NULL,
  `linkedin_pixcel_id` varchar(255) DEFAULT NULL,
  `google_tag_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `pixcel_settings` WRITE;
/*!40000 ALTER TABLE `pixcel_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `pixcel_settings` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `privacypolicy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `privacypolicy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `privacypolicy_content` longtext NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `privacypolicy` WRITE;
/*!40000 ALTER TABLE `privacypolicy` DISABLE KEYS */;
/*!40000 ALTER TABLE `privacypolicy` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `promocode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promocode` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `reorder_id` int(11) NOT NULL,
  `offer_name` varchar(255) NOT NULL,
  `offer_code` varchar(20) NOT NULL,
  `offer_type` int(11) NOT NULL COMMENT '1=fixed,2=percentage',
  `offer_amount` varchar(255) NOT NULL,
  `min_amount` int(11) NOT NULL,
  `per_user` int(11) NOT NULL,
  `usage_type` int(11) NOT NULL COMMENT '1=One time,2=multiple times',
  `usage_limit` int(11) DEFAULT NULL,
  `start_date` text NOT NULL,
  `expire_date` text NOT NULL,
  `description` longtext NOT NULL,
  `is_available` int(11) NOT NULL DEFAULT 1 COMMENT '1 = Yes , 2 = No',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `promocode` WRITE;
/*!40000 ALTER TABLE `promocode` DISABLE KEYS */;
INSERT INTO `promocode` VALUES (1,1,'Special Online Order Offer','MEGA30',1,'50',50,2,1,1,'2024-08-30','2028-12-30','Lorem Ipsum is simply dummy text of the printing and typesetting industry',1,'2022-05-02 02:26:04','2024-08-30 01:19:59');
/*!40000 ALTER TABLE `promocode` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `ratting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ratting` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `reorder_id` int(11) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `ratting` varchar(255) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `image` text DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '1=Approved 2=Decline	',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ratting_user_id_foreign` (`user_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `ratting` WRITE;
/*!40000 ALTER TABLE `ratting` DISABLE KEYS */;
/*!40000 ALTER TABLE `ratting` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `refundpolicy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refundpolicy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `refundpolicy_content` longtext NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `refundpolicy` WRITE;
/*!40000 ALTER TABLE `refundpolicy` DISABLE KEYS */;
/*!40000 ALTER TABLE `refundpolicy` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `label` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `theme` int(11) NOT NULL,
  `maintenance_mode` int(11) NOT NULL DEFAULT 2 COMMENT '1=yes,2=no',
  `online_table_booking` int(11) NOT NULL DEFAULT 1 COMMENT '1=Yes 2=No',
  `login_required` varchar(20) NOT NULL COMMENT '1-for yes , 2 - for no',
  `is_checkout_login_required` int(11) NOT NULL COMMENT '1=yes,2=no',
  `android` text DEFAULT NULL,
  `ios` text DEFAULT NULL,
  `app_bottom_image` text DEFAULT NULL,
  `mobile_app_image` varchar(255) DEFAULT NULL,
  `mobile_app_title` text DEFAULT NULL,
  `mobile_app_description` text DEFAULT NULL,
  `copyright` text DEFAULT NULL,
  `title` text DEFAULT NULL,
  `short_title` text DEFAULT NULL,
  `og_title` text DEFAULT NULL,
  `og_description` longtext DEFAULT NULL,
  `notification_tune` text NOT NULL COMMENT 'Notification For Admin',
  `mobile` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `address_url` text DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `currency_position` int(11) DEFAULT NULL COMMENT '1=left,2=right\r\n',
  `currency_space` varchar(255) NOT NULL DEFAULT '1' COMMENT '1=Yes,2=No',
  `currency_formate` varchar(255) DEFAULT NULL,
  `decimal_separator` varchar(255) NOT NULL DEFAULT '1' COMMENT '1=Dot,2=Comma	',
  `time_format` varchar(255) DEFAULT NULL COMMENT '1=24,2=12',
  `date_format` varchar(255) DEFAULT NULL,
  `max_order_qty` int(11) NOT NULL,
  `min_order_amount` int(11) NOT NULL,
  `max_order_amount` int(11) NOT NULL,
  `order_prefix` varchar(255) DEFAULT NULL,
  `order_number_start` varchar(255) DEFAULT NULL,
  `firebase` text NOT NULL,
  `referral_amount` int(11) NOT NULL,
  `timezone` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL COMMENT 'about-image',
  `logo` varchar(255) DEFAULT NULL,
  `favicon` varchar(255) DEFAULT NULL,
  `web_primary_color` varchar(255) NOT NULL,
  `web_secondary_color` varchar(255) NOT NULL,
  `admin_primary_color` varchar(255) NOT NULL,
  `admin_secondary_color` varchar(255) NOT NULL,
  `admin_skin` varchar(20) NOT NULL DEFAULT 'spring',
  `footer_title` varchar(255) DEFAULT NULL,
  `footer_description` varchar(255) DEFAULT NULL,
  `footer_logo` varchar(255) DEFAULT NULL,
  `og_image` varchar(255) DEFAULT NULL,
  `pwa` varchar(255) DEFAULT NULL,
  `pwa_app_logo` varchar(255) DEFAULT NULL,
  `pwa_app_name` varchar(255) DEFAULT NULL,
  `pwa_app_title` varchar(255) DEFAULT NULL,
  `pwa_background_color` varchar(255) DEFAULT NULL,
  `pwa_theme_color` varchar(255) DEFAULT NULL,
  `google_mode` int(11) DEFAULT NULL,
  `google_client_id` varchar(255) NOT NULL,
  `google_client_secret` varchar(255) NOT NULL,
  `google_redirect_url` varchar(255) NOT NULL DEFAULT 'http://your-domain-url.com/checklogin/google/callback-google',
  `facebook_mode` int(11) DEFAULT NULL,
  `facebook_client_id` varchar(255) NOT NULL,
  `facebook_client_secret` varchar(255) NOT NULL,
  `facebook_redirect_url` varchar(255) NOT NULL DEFAULT 'http://your-domain-url.com/checklogin/facebook/callback-facebook	',
  `mail_driver` varchar(255) DEFAULT NULL,
  `mail_host` varchar(255) DEFAULT NULL,
  `mail_port` varchar(255) DEFAULT NULL,
  `mail_username` varchar(255) DEFAULT NULL,
  `mail_password` varchar(255) DEFAULT NULL,
  `mail_encryption` varchar(255) DEFAULT NULL,
  `mail_fromaddress` varchar(255) DEFAULT NULL,
  `mail_fromname` varchar(255) DEFAULT NULL,
  `recaptcha_on_off` int(11) DEFAULT NULL,
  `recaptcha_version` varchar(255) DEFAULT NULL,
  `google_recaptcha_site_key` varchar(255) DEFAULT '-',
  `google_recaptcha_secret_key` varchar(255) DEFAULT NULL,
  `score_threshold` varchar(255) DEFAULT NULL,
  `pickup_delivery` int(11) DEFAULT NULL,
  `review_auto_approved` text DEFAULT NULL,
  `review_approved_status` int(11) NOT NULL DEFAULT 2 COMMENT '1=Yes 2=No',
  `verification` varchar(50) DEFAULT NULL,
  `tawk_widget_id` text NOT NULL,
  `tawk_on_off` int(11) NOT NULL,
  `interval_type` int(11) DEFAULT NULL,
  `interval_time` int(11) NOT NULL DEFAULT 1,
  `perslot_booking_limit` int(11) DEFAULT NULL,
  `ordertype_date_time` int(11) DEFAULT 2,
  `quick_call` int(11) NOT NULL,
  `quick_call_name` varchar(255) DEFAULT NULL,
  `quick_call_description` text DEFAULT NULL,
  `quick_call_mobile` varchar(255) DEFAULT NULL,
  `quick_call_position` int(11) NOT NULL,
  `quick_call_image` varchar(255) DEFAULT NULL,
  `wizz_chat_settings` longtext DEFAULT NULL,
  `wizz_chat_on_off` text DEFAULT NULL,
  `fake_sales_notification` int(11) NOT NULL,
  `product_source` int(11) NOT NULL,
  `next_time_popup` int(11) NOT NULL,
  `notification_display_time` int(11) NOT NULL,
  `sales_notification_position` int(11) NOT NULL,
  `product_fake_view` int(11) NOT NULL,
  `fake_view_message` text DEFAULT NULL,
  `min_view_count` int(11) NOT NULL,
  `max_view_count` int(11) NOT NULL,
  `why_choose_title` varchar(255) DEFAULT NULL,
  `why_choose_subtitle` varchar(255) DEFAULT NULL,
  `why_choose_description` text DEFAULT NULL,
  `why_choose_image` varchar(255) DEFAULT NULL,
  `google_review_url` varchar(255) DEFAULT NULL,
  `auth_bg_image` text DEFAULT NULL,
  `faqs_image` text DEFAULT NULL,
  `booknow_bg_image` text DEFAULT NULL,
  `refer_earn_bg_image` text DEFAULT NULL,
  `subscribe_newsletter_image` text DEFAULT NULL,
  `no_data_image` text DEFAULT NULL,
  `default_language` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `value` text DEFAULT NULL,
  `navigation_config` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'food_pro',1,2,2,'1',2,NULL,NULL,NULL,NULL,NULL,NULL,'© Food Pro','Food Pro','Food Pro','Food Pro – online ételrendelés','Minta éttermi rendelési felület. Az étterem adatai az adminban állíthatók.','notification.mp3',NULL,NULL,NULL,NULL,'Ft',2,'1','0','2','1','Y-m-d',50,0,500000,'FP-','1001','',30,'Europe/Budapest','order-success.svg','logo-food-pro.svg','favicon-food-pro.svg','#176b5b','#efb365','#176b5b','#efb365','spring','Food Pro','Friss ételek, egyszerű online rendelés.','footer-food-pro.svg','og_image-food-pro.png','2',NULL,'Food Pro','Food Pro','#ac1415','#000000',2,'','','',2,'','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,'v2','',NULL,'0.5',1,'5,4',1,'1','',2,2,1,2,1,2,NULL,NULL,NULL,1,NULL,NULL,'2',2,1,1000,2000,1,2,NULL,10,100,'Miért érdemes nálunk rendelni?','Egyszerű rendelés','Válassz a kínálatból, add le a rendelést, és kövesd annak állapotát.','why_choose_image-66bb2514a5c8c.jpg',NULL,'auth_bg_image-food-pro.png',NULL,'booknow_bg_image-food-pro.png',NULL,NULL,'no_data_image-food-pro.svg','HU','2026-09-27 21:00:21','2026-09-27 18:36:59',NULL,NULL);
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `shipping_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipping_area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reorder_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `delivery_charge` text NOT NULL,
  `min_order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `shipping_area` WRITE;
/*!40000 ALTER TABLE `shipping_area` DISABLE KEYS */;
INSERT INTO `shipping_area` VALUES (41,1,'Minta kiszállítási zóna – állítsd be az adminban','500',0,'2026-09-27 20:19:20','2026-09-27 20:19:20');
/*!40000 ALTER TABLE `shipping_area` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `slider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reorder_id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `type` int(11) DEFAULT NULL,
  `cat_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(50) NOT NULL,
  `is_available` int(11) NOT NULL DEFAULT 1 COMMENT '1=yes,2=no\r\n',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `slider` WRITE;
/*!40000 ALTER TABLE `slider` DISABLE KEYS */;
INSERT INTO `slider` VALUES (8,1,'Friss ízek, egyszerű rendelés',NULL,NULL,NULL,'Válassz a kínálatból, és rendelj néhány kattintással.','slider-food-pro.png',1,'2026-09-27 20:19:20','2026-09-27 20:19:20');
/*!40000 ALTER TABLE `slider` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `social_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `icon` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `social_links` WRITE;
/*!40000 ALTER TABLE `social_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_links` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `subcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subcategories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reorder_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL COMMENT 'category id from categories table',
  `subcategory_name` varchar(255) NOT NULL,
  `slug` text NOT NULL,
  `is_available` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=yes,2=no',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 2 COMMENT '1=yes,2=no',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `subcategories` WRITE;
/*!40000 ALTER TABLE `subcategories` DISABLE KEYS */;
INSERT INTO `subcategories` VALUES (3,1,4,'Menük','menuk',1,2,'2025-09-30 18:06:39','2025-10-02 17:00:32'),(4,3,5,'Energiaital','energiaital',1,2,'2025-10-02 16:20:37','2025-10-02 17:00:32'),(5,5,5,'Sör','sor',1,2,'2025-10-02 16:20:45','2025-10-02 17:00:35'),(6,2,5,'Üditő','udito',1,2,'2025-10-02 16:21:23','2025-10-02 17:00:32'),(7,4,5,'Gyümülcslé','gyumulcsle',1,2,'2025-10-02 16:32:58','2025-10-02 17:00:35'),(8,0,17,'Kézműve hamburgerek','kezmuve-hamburgerek',1,2,'2025-10-11 13:43:59','2025-10-11 13:43:59'),(9,0,17,'Sültek','sultek',1,2,'2025-10-11 13:44:23','2025-10-11 13:44:23'),(11,0,17,'Kebabok','kebabok',1,2,'2025-10-11 13:46:27','2025-10-11 13:46:27'),(12,0,17,'Gyros','gyros',1,2,'2025-10-11 13:50:40','2025-10-11 13:50:40');
/*!40000 ALTER TABLE `subcategories` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `subscribe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscribe` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `subscribe` WRITE;
/*!40000 ALTER TABLE `subscribe` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscribe` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `systemaddons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `systemaddons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `unique_identifier` varchar(255) NOT NULL,
  `version` varchar(20) NOT NULL,
  `activated` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `type` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `systemaddons` WRITE;
/*!40000 ALTER TABLE `systemaddons` DISABLE KEYS */;
INSERT INTO `systemaddons` VALUES (1,'Food Pro webáruház','theme_1','9.0',1,'theme_1.png',1,'2023-07-08 06:56:57','2023-07-08 06:56:57'),(2,'Nyelvek','language','9.0',1,'language.png',1,'2023-07-08 06:57:04','2025-09-04 14:35:05'),(3,'Értesítések','notification','9.0',1,'notification.png',1,'2023-07-08 06:57:04','2024-06-08 08:57:11'),(4,'Süti hozzájárulás','cookie_consent','9.0',1,'cookie_consent.png',1,'2023-07-08 06:57:04','2023-07-08 06:57:04'),(5,'Vásárlói fiókok','customer_login','9.0',1,'customer_login.png',1,'2023-07-08 06:57:04','2025-07-25 19:02:17'),(6,'Munkatársak és szerepkörök','employee','9.0',1,'employee.png',1,'2023-07-08 06:57:04','2025-09-13 09:25:10'),(7,'Blog','blog','9.0',2,'blog.png',1,'2023-07-08 06:57:04','2025-07-25 19:02:33'),(8,'Kuponok','coupon','9.0',2,'coupon.png',1,'2023-07-08 06:57:04','2025-07-25 19:02:36'),(9,'Étterem értékelések','store_review','9.0',2,'testimonials.png',1,'2023-07-08 06:57:04','2025-09-19 16:31:25'),(10,'Termék értékelések','product_review','9.0',2,'product_review.png',1,'2023-07-08 06:56:57','2025-09-06 12:14:16'),(11,'Gyors hívás','quick_call','9.0',2,'quick_call.png',1,'2023-07-08 06:57:04','2025-09-04 14:35:11');
/*!40000 ALTER TABLE `systemaddons` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `tax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tax` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reorder_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` int(11) NOT NULL,
  `tax` varchar(255) NOT NULL,
  `is_available` int(11) NOT NULL DEFAULT 1 COMMENT '1=Yes,2=No',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `tax` WRITE;
/*!40000 ALTER TABLE `tax` DISABLE KEYS */;
INSERT INTO `tax` VALUES (1,0,'Csomagolás',1,'100',1,'2025-09-06 15:47:05','2025-09-06 15:53:32'),(2,0,'csomagolás',1,'30',1,'2025-09-13 19:14:15','2025-09-13 19:14:34'),(3,0,'Csomagolás2',1,'100',1,'2025-09-30 16:28:04','2025-09-30 16:28:04'),(4,0,'DRS palack díj',1,'50',1,'2025-10-02 16:29:03','2025-10-11 12:23:07'),(5,0,'DRS palack díj2',1,'50',1,'2025-10-11 12:29:34','2025-10-11 12:29:34');
/*!40000 ALTER TABLE `tax` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teams` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reorder_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `designation` varchar(255) NOT NULL,
  `fb` text DEFAULT NULL,
  `youtube` text DEFAULT NULL,
  `insta` text DEFAULT NULL,
  `twitter` text DEFAULT NULL,
  `description` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `terms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `termscondition_content` longtext NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `terms` WRITE;
/*!40000 ALTER TABLE `terms` DISABLE KEYS */;
/*!40000 ALTER TABLE `terms` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `day` varchar(50) NOT NULL,
  `open_time` varchar(20) NOT NULL,
  `break_start` varchar(255) NOT NULL,
  `break_end` varchar(255) NOT NULL,
  `close_time` varchar(20) NOT NULL,
  `always_close` int(11) NOT NULL DEFAULT 2 COMMENT '1 = Yes , 2 = No',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `time` WRITE;
/*!40000 ALTER TABLE `time` DISABLE KEYS */;
INSERT INTO `time` VALUES (1,'monday','00:00','','','23:59',2,'2026-09-27 17:45:45','2025-09-13 10:05:06'),(2,'tuesday','00:00','','','23:59',2,'2026-09-27 17:45:45','2025-09-13 10:05:06'),(3,'wednesday','00:00','','','23:59',2,'2026-09-27 17:45:45','2025-09-13 10:05:06'),(4,'thursday','00:00','','','23:59',2,'2026-09-27 17:45:45','2025-09-13 10:05:06'),(5,'friday','00:00','','','23:59',2,'2026-09-27 17:45:45','2025-09-13 10:05:06'),(6,'saturday','00:00','','','23:59',2,'2026-09-27 17:45:45','2025-09-13 10:05:06'),(7,'sunday','00:00','','','23:59',2,'2026-09-27 17:45:45','2025-09-13 10:05:06');
/*!40000 ALTER TABLE `time` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `top_deals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_deals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `offer_type` int(11) NOT NULL,
  `deal_type` int(11) NOT NULL COMMENT '1=one time,2=daily',
  `top_deals_switch` int(11) NOT NULL DEFAULT 2 COMMENT '1=yes,2=no',
  `offer_amount` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `top_deals` WRITE;
/*!40000 ALTER TABLE `top_deals` DISABLE KEYS */;
/*!40000 ALTER TABLE `top_deals` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `order_number` varchar(50) DEFAULT NULL,
  `amount` varchar(20) NOT NULL,
  `transaction_id` text DEFAULT NULL,
  `transaction_type` varchar(255) NOT NULL COMMENT '1 = order placed (using wallet)\r\n2 = order cancel\r\n3 = added-money-wallet-using- Razorpay\r\n4 = added-money-wallet-using- Stripe\r\n5 = added-money-wallet-using- Flutterwave\r\n6 = added-money-wallet-using- Paystack\r\n7 = Referral \r\n8 = Money added by Admin\r\n9 = Money deducted by Admin',
  `username` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `tutorials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tutorials` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `tutorials` WRITE;
/*!40000 ALTER TABLE `tutorials` DISABLE KEYS */;
/*!40000 ALTER TABLE `tutorials` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `profile_image` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `login_type` varchar(10) NOT NULL,
  `google_id` text DEFAULT NULL,
  `facebook_id` text DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL COMMENT 'id from manage_roles table',
  `type` int(11) NOT NULL,
  `identity_image` text DEFAULT NULL,
  `identity_type` text DEFAULT NULL,
  `identity_number` text DEFAULT NULL,
  `token` longtext NOT NULL,
  `wallet` varchar(50) DEFAULT '00',
  `referral_code` varchar(10) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `referral_amount` int(11) NOT NULL DEFAULT 0,
  `is_available` int(11) NOT NULL DEFAULT 1 COMMENT '1 = Yes , 2 = No',
  `is_online` int(11) NOT NULL DEFAULT 2 COMMENT '1=yes,2=no',
  `is_notification` int(11) DEFAULT 1 COMMENT '1=yes,2=no',
  `is_mail` int(11) DEFAULT 1 COMMENT '1=yes,2=no',
  `otp` varchar(6) DEFAULT NULL,
  `is_verified` int(11) DEFAULT NULL COMMENT '1 = Yes , 2 = No',
  `is_deleted` int(11) NOT NULL DEFAULT 2 COMMENT '1=Yes 2=No',
  `remember_token` text DEFAULT NULL,
  `license_type` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (30,'Food Pro Admin','admin@foodpro.local',NULL,'profile-food-pro.svg','$2y$10$OIsY5LYTBW/FPaVCR4Dkx.bg8v6wtxxfj5o9YHoTp642S.7jwVEHm','email',NULL,NULL,NULL,1,NULL,NULL,NULL,'','00',NULL,NULL,0,1,1,1,1,NULL,1,2,NULL,NULL,'2026-09-27 20:19:20','2026-09-27 20:19:20');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `variation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `variation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `price` varchar(255) DEFAULT '0',
  `original_price` varchar(255) DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `discount_percentage` float NOT NULL,
  `qty` int(11) DEFAULT NULL,
  `min_order` int(11) DEFAULT 0,
  `max_order` int(11) DEFAULT 0,
  `low_qty` varchar(255) DEFAULT '0',
  `stock_management` int(11) DEFAULT NULL,
  `is_available` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `variation` WRITE;
/*!40000 ALTER TABLE `variation` DISABLE KEYS */;
/*!40000 ALTER TABLE `variation` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `whatsapp_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `whatsapp_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_message` longtext NOT NULL,
  `whatsapp_message` longtext NOT NULL,
  `status_message` longtext NOT NULL,
  `whatsapp_number` varchar(255) NOT NULL,
  `whatsapp_phone_number_id` varchar(255) NOT NULL,
  `whatsapp_access_token` longtext NOT NULL,
  `whatsapp_chat_on_off` int(11) NOT NULL,
  `whatsapp_chat_position` int(11) NOT NULL DEFAULT 1 COMMENT '1=left, 2=right',
  `order_created` int(11) NOT NULL COMMENT '1 = Yes , 2 = No',
  `status_change` int(11) NOT NULL COMMENT '1 = Yes , 2 = No',
  `message_type` int(11) NOT NULL COMMENT '1 = automatic_using_api , 2 = manually	',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `whatsapp_message` WRITE;
/*!40000 ALTER TABLE `whatsapp_message` DISABLE KEYS */;
INSERT INTO `whatsapp_message` VALUES (1,'🔵 {item_name} X  {qty}  {variantsdata} - {item_price}','Hi,\r\n\r\nI would like to place an order 👇 \r\n{delivery_type} Order No: {order_no} \r\n\r\n---------------------------  \r\n\r\n{item_variable}  \r\n\r\n--------------------------- \r\n👉Tax : {total_tax} \r\n👉Delivery charge : {delivery_charge} \r\n👉Discount : - {discount_amount} \r\n--------------------------- \r\n📃 Total : {grand_total} \r\n--------------------------- \r\n📄 Comment :  {notes}  \r\n\r\n✅ Customer Info  \r\n\r\nCustomer name : {customer_name} \r\nCustomer phone : {customer_mobile}  \r\n\r\n📍 Delivery Details  Address : {address} , {house_no} , {area} \r\n \r\n--------------------------- \r\n\r\n💳 Payment type : {payment_type}  \r\n\r\nWe will confirm your order upon receiving the message.  \r\n\r\nTrack your order 👇 \r\n{track_order_url}  \r\n\r\nClick here for next order 👇 \r\n{store_url}','🛍️ Order Status Update 📦\r\n\r\nHello {customer_name},\r\n\r\nWe\'re excited to share the latest status of your order with us. Here are the details:\r\n\r\n📝 Order Number: #{order_no}\r\n\r\n📦 **Order Status**: {status}\r\n\r\n📌 **Tracking Information**:\r\n   - You can track your order with the tracking number: #{order_no}.\r\n   - Tracking Link: {track_order_url}\r\n\r\nIf you have any questions or need assistance, feel free to reply to this message.\r\n\r\nWe appreciate your business and hope you enjoy your purchase.\r\n\r\nBest regards','919499874557','109087992245712','EAAVIMtjwDLUBOZBDXpokc4fOsthyrJMBedXuosucelmwXYxwLt0TYcDIPMNl333kJ1n7qaLpbgdCqGFbKeYhlJYlk3aCuOdZAp4pCd0Xjf7Qp3Bz5W5vlpIxsThtQCPok31NpEMbZBxigWGdwZBAkIqsH7G66faVfrP8BlIf3ysZCLEVxr9xlL9RguNzYOb6oop0dm4IZBqcmXaSFIwbIthcycafdNdFXNlcEZD',1,1,1,2,2,'2024-08-31 08:25:59','2024-08-31 02:55:59');
/*!40000 ALTER TABLE `whatsapp_message` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `whychooseus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `whychooseus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reorder_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `subtitle` varchar(255) DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `whychooseus` WRITE;
/*!40000 ALTER TABLE `whychooseus` DISABLE KEYS */;
/*!40000 ALTER TABLE `whychooseus` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `zones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zones` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `coordinates` text NOT NULL,
  `delivery_charge` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `zones` WRITE;
/*!40000 ALTER TABLE `zones` DISABLE KEYS */;
/*!40000 ALTER TABLE `zones` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

