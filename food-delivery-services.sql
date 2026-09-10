-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: food_delivery_db
-- ------------------------------------------------------
-- Server version	9.6.0

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '8e37276b-1edd-11f1-9ee8-3bbbf6a0405e:1-2489';

--
-- Table structure for table `accounts_address`
--

DROP TABLE IF EXISTS `accounts_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_address` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `receiver_name` varchar(150) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` longtext NOT NULL,
  `is_default` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_address_user_id_c8c74ddf_fk_accounts_user_id` (`user_id`),
  CONSTRAINT `accounts_address_user_id_c8c74ddf_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_address`
--

LOCK TABLES `accounts_address` WRITE;
/*!40000 ALTER TABLE `accounts_address` DISABLE KEYS */;
INSERT INTO `accounts_address` VALUES (2,'Meo Meo','0956289201','33/7 Đặng Văn Ngữ',1,'2026-09-10 06:13:13.685979','2026-09-10 07:03:35.108542',1);
/*!40000 ALTER TABLE `accounts_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_user`
--

DROP TABLE IF EXISTS `accounts_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `email` varchar(254) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `avatar` varchar(100) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_user`
--

LOCK TABLES `accounts_user` WRITE;
/*!40000 ALTER TABLE `accounts_user` DISABLE KEYS */;
INSERT INTO `accounts_user` VALUES (1,'pbkdf2_sha256$1500000$5SKP6HwgLO8i6cOSJnFgCQ$z70KxBBL6Kzzk88i1Q8K4w9GTN1773wYGyVHNVAEDXc=',NULL,0,'meomeo','Meo','Meo',0,1,'2026-09-09 18:44:43.031608','arichansts@gmail.com','1234567891','avatars/AFLAC.jpg','2026-09-09 18:44:43.732603','2026-09-10 07:03:12.041115');
/*!40000 ALTER TABLE `accounts_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_user_groups`
--

DROP TABLE IF EXISTS `accounts_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_user_groups_user_id_group_id_59c0b32f_uniq` (`user_id`,`group_id`),
  KEY `accounts_user_groups_group_id_bd11a704_fk_auth_group_id` (`group_id`),
  CONSTRAINT `accounts_user_groups_group_id_bd11a704_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `accounts_user_groups_user_id_52b62117_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_user_groups`
--

LOCK TABLES `accounts_user_groups` WRITE;
/*!40000 ALTER TABLE `accounts_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_user_user_permissions`
--

DROP TABLE IF EXISTS `accounts_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_user_user_permi_user_id_permission_id_2ab516c2_uniq` (`user_id`,`permission_id`),
  KEY `accounts_user_user_p_permission_id_113bb443_fk_auth_perm` (`permission_id`),
  CONSTRAINT `accounts_user_user_p_permission_id_113bb443_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `accounts_user_user_p_user_id_e4f0a161_fk_accounts_` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_user_user_permissions`
--

LOCK TABLES `accounts_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `accounts_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_usersettings`
--

DROP TABLE IF EXISTS `accounts_usersettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_usersettings` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email_notifications` tinyint(1) NOT NULL,
  `order_notifications` tinyint(1) NOT NULL,
  `promotional_notifications` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `accounts_usersettings_user_id_3952da55_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_usersettings`
--

LOCK TABLES `accounts_usersettings` WRITE;
/*!40000 ALTER TABLE `accounts_usersettings` DISABLE KEYS */;
INSERT INTO `accounts_usersettings` VALUES (1,0,0,0,'2026-09-10 05:46:58.832703','2026-09-10 06:13:19.813775',1);
/*!40000 ALTER TABLE `accounts_usersettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',3,'add_permission'),(6,'Can change permission',3,'change_permission'),(7,'Can delete permission',3,'delete_permission'),(8,'Can view permission',3,'view_permission'),(9,'Can add group',2,'add_group'),(10,'Can change group',2,'change_group'),(11,'Can delete group',2,'delete_group'),(12,'Can view group',2,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add user',6,'add_user'),(22,'Can change user',6,'change_user'),(23,'Can delete user',6,'delete_user'),(24,'Can view user',6,'view_user'),(25,'Can add category',7,'add_category'),(26,'Can change category',7,'change_category'),(27,'Can delete category',7,'delete_category'),(28,'Can view category',7,'view_category'),(29,'Can add food',8,'add_food'),(30,'Can change food',8,'change_food'),(31,'Can delete food',8,'delete_food'),(32,'Can view food',8,'view_food'),(33,'Can add cart',9,'add_cart'),(34,'Can change cart',9,'change_cart'),(35,'Can delete cart',9,'delete_cart'),(36,'Can view cart',9,'view_cart'),(37,'Can add cart item',10,'add_cartitem'),(38,'Can change cart item',10,'change_cartitem'),(39,'Can delete cart item',10,'delete_cartitem'),(40,'Can view cart item',10,'view_cartitem'),(41,'Can add order',11,'add_order'),(42,'Can change order',11,'change_order'),(43,'Can delete order',11,'delete_order'),(44,'Can view order',11,'view_order'),(45,'Can add order item',12,'add_orderitem'),(46,'Can change order item',12,'change_orderitem'),(47,'Can delete order item',12,'delete_orderitem'),(48,'Can view order item',12,'view_orderitem'),(49,'Can add notification',13,'add_notification'),(50,'Can change notification',13,'change_notification'),(51,'Can delete notification',13,'delete_notification'),(52,'Can view notification',13,'view_notification'),(53,'Can add wallet transaction',15,'add_wallettransaction'),(54,'Can change wallet transaction',15,'change_wallettransaction'),(55,'Can delete wallet transaction',15,'delete_wallettransaction'),(56,'Can view wallet transaction',15,'view_wallettransaction'),(57,'Can add wallet',14,'add_wallet'),(58,'Can change wallet',14,'change_wallet'),(59,'Can delete wallet',14,'delete_wallet'),(60,'Can view wallet',14,'view_wallet'),(61,'Can add contact message',16,'add_contactmessage'),(62,'Can change contact message',16,'change_contactmessage'),(63,'Can delete contact message',16,'delete_contactmessage'),(64,'Can view contact message',16,'view_contactmessage'),(65,'Can add address',17,'add_address'),(66,'Can change address',17,'change_address'),(67,'Can delete address',17,'delete_address'),(68,'Can view address',17,'view_address'),(69,'Can add user settings',18,'add_usersettings'),(70,'Can change user settings',18,'change_usersettings'),(71,'Can delete user settings',18,'delete_usersettings'),(72,'Can view user settings',18,'view_usersettings');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_cart`
--

DROP TABLE IF EXISTS `cart_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_cart` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `cart_cart_user_id_9b4220b9_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_cart`
--

LOCK TABLES `cart_cart` WRITE;
/*!40000 ALTER TABLE `cart_cart` DISABLE KEYS */;
INSERT INTO `cart_cart` VALUES (1,'2026-09-09 18:44:54.120511','2026-09-09 18:44:54.120553',1);
/*!40000 ALTER TABLE `cart_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_cartitem`
--

DROP TABLE IF EXISTS `cart_cartitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_cartitem` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int unsigned NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `cart_id` bigint NOT NULL,
  `food_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_cart_food` (`cart_id`,`food_id`),
  KEY `cart_cartitem_food_id_7bb68841_fk_foods_food_id` (`food_id`),
  CONSTRAINT `cart_cartitem_cart_id_370ad265_fk_cart_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `cart_cart` (`id`),
  CONSTRAINT `cart_cartitem_food_id_7bb68841_fk_foods_food_id` FOREIGN KEY (`food_id`) REFERENCES `foods_food` (`id`),
  CONSTRAINT `cart_cartitem_chk_1` CHECK ((`quantity` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_cartitem`
--

LOCK TABLES `cart_cartitem` WRITE;
/*!40000 ALTER TABLE `cart_cartitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_cartitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_contactmessage`
--

DROP TABLE IF EXISTS `contact_contactmessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_contactmessage` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(254) NOT NULL,
  `subject` varchar(200) NOT NULL,
  `message` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `is_resolved` tinyint(1) NOT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contact_contactmessage_user_id_0ac8080c_fk_accounts_user_id` (`user_id`),
  CONSTRAINT `contact_contactmessage_user_id_0ac8080c_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_contactmessage`
--

LOCK TABLES `contact_contactmessage` WRITE;
/*!40000 ALTER TABLE `contact_contactmessage` DISABLE KEYS */;
INSERT INTO `contact_contactmessage` VALUES (1,'Meo Meo','arichansts@gmail.com','Geography in foods','Nice to meet u!! What is Geography in foods?? ?','2026-09-09 20:00:24.964432',0,1);
/*!40000 ALTER TABLE `contact_contactmessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_accounts_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (17,'accounts','address'),(6,'accounts','user'),(18,'accounts','usersettings'),(1,'admin','logentry'),(2,'auth','group'),(3,'auth','permission'),(9,'cart','cart'),(10,'cart','cartitem'),(16,'contact','contactmessage'),(4,'contenttypes','contenttype'),(7,'foods','category'),(8,'foods','food'),(13,'notifications','notification'),(11,'orders','order'),(12,'orders','orderitem'),(5,'sessions','session'),(14,'wallet','wallet'),(15,'wallet','wallettransaction');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2026-09-09 18:11:30.421916'),(2,'contenttypes','0002_remove_content_type_name','2026-09-09 18:11:30.630479'),(3,'auth','0001_initial','2026-09-09 18:11:31.187494'),(4,'auth','0002_alter_permission_name_max_length','2026-09-09 18:11:31.315233'),(5,'auth','0003_alter_user_email_max_length','2026-09-09 18:11:31.325974'),(6,'auth','0004_alter_user_username_opts','2026-09-09 18:11:31.336327'),(7,'auth','0005_alter_user_last_login_null','2026-09-09 18:11:31.347781'),(8,'auth','0006_require_contenttypes_0002','2026-09-09 18:11:31.354451'),(9,'auth','0007_alter_validators_add_error_messages','2026-09-09 18:11:31.367396'),(10,'auth','0008_alter_user_username_max_length','2026-09-09 18:11:31.380819'),(11,'auth','0009_alter_user_last_name_max_length','2026-09-09 18:11:31.393739'),(12,'auth','0010_alter_group_name_max_length','2026-09-09 18:11:31.429853'),(13,'auth','0011_update_proxy_permissions','2026-09-09 18:11:31.441010'),(14,'auth','0012_alter_user_first_name_max_length','2026-09-09 18:11:31.453278'),(15,'accounts','0001_initial','2026-09-09 18:11:32.086216'),(16,'admin','0001_initial','2026-09-09 18:11:32.403515'),(17,'admin','0002_logentry_remove_auto_add','2026-09-09 18:11:32.414451'),(18,'admin','0003_logentry_add_action_flag_choices','2026-09-09 18:11:32.431417'),(19,'sessions','0001_initial','2026-09-09 18:11:32.515645'),(20,'foods','0001_initial','2026-09-09 18:12:11.918348'),(21,'cart','0001_initial','2026-09-09 18:12:43.574924'),(22,'orders','0001_initial','2026-09-09 18:13:16.423776'),(23,'notifications','0001_initial','2026-09-09 19:35:46.992631'),(24,'wallet','0001_initial','2026-09-09 19:45:43.742180'),(25,'contact','0001_initial','2026-09-09 19:58:00.871343'),(26,'accounts','0002_address_usersettings','2026-09-09 20:10:20.660164'),(27,'accounts','0003_remove_usersettings_dark_mode','2026-09-09 20:30:42.385482');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `foods_category`
--

DROP TABLE IF EXISTS `foods_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `foods_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `icon` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foods_category`
--

LOCK TABLES `foods_category` WRITE;
/*!40000 ALTER TABLE `foods_category` DISABLE KEYS */;
INSERT INTO `foods_category` VALUES (1,'Burger','Delicious burgers made with fresh ingredients and flavorful fillings.','fast-food-outline','2026-09-09 18:29:54.443340'),(2,'Healthy','Fresh and nutritious meals for a healthy and balanced lifestyle.','leaf-outline','2026-09-09 18:29:54.453349'),(3,'Coffee','A selection of aromatic coffee made from high-quality coffee beans.','cafe-outline','2026-09-09 18:29:54.460486'),(4,'Ice Cream','Creamy and refreshing ice cream desserts for every sweet tooth.','ice-cream-outline','2026-09-09 18:29:54.468028'),(5,'Pizza','Classic and delicious pizzas with a variety of flavorful toppings.','pizza-outline','2026-09-09 18:29:54.475149'),(6,'Seafood','Fresh seafood selections prepared with delicious flavors.','fish-outline','2026-09-09 18:29:54.483271'),(7,'Wine','A collection of red, white, sparkling, and sweet wines.','wine-outline','2026-09-09 18:29:54.490599');
/*!40000 ALTER TABLE `foods_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `foods_food`
--

DROP TABLE IF EXISTS `foods_food`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `foods_food` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `description` longtext NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image` varchar(500) DEFAULT NULL,
  `is_available` tinyint(1) NOT NULL,
  `is_recommended` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `category_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `foods_food_category_id_1bb11251_fk_foods_category_id` (`category_id`),
  CONSTRAINT `foods_food_category_id_1bb11251_fk_foods_category_id` FOREIGN KEY (`category_id`) REFERENCES `foods_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foods_food`
--

LOCK TABLES `foods_food` WRITE;
/*!40000 ALTER TABLE `foods_food` DISABLE KEYS */;
INSERT INTO `foods_food` VALUES (1,'Chicken Burger','A juicy chicken patty served with fresh vegetables and creamy sauce in a soft burger bun.',5.99,'https://res.cloudinary.com/decumd3lu/image/upload/v1788927502/chicken_burger_agkwfa.jpg',1,1,'2026-09-09 18:29:54.501340','2026-09-09 18:29:54.501374',1),(2,'Beef Burger','A classic beef burger with a juicy beef patty, fresh vegetables, cheese, and savory sauce.',6.99,'https://res.cloudinary.com/decumd3lu/image/upload/v1788927502/beef_burger_j2egex.jpg',1,1,'2026-09-09 18:29:54.509577','2026-09-09 18:29:54.509607',1),(3,'Egg Burger','A delicious burger topped with a freshly cooked egg, vegetables, and creamy sauce.',5.49,'https://res.cloudinary.com/decumd3lu/image/upload/v1788927501/egg_burger_zqdirv.jpg',1,0,'2026-09-09 18:29:54.519641','2026-09-09 18:29:54.519671',1),(4,'Fish Burger','A crispy fish fillet burger served with fresh lettuce and a flavorful creamy sauce.',6.49,'https://res.cloudinary.com/decumd3lu/image/upload/v1788927501/fish_burger_dzrsqx.jpg',1,0,'2026-09-09 18:29:54.527410','2026-09-09 18:29:54.527442',1),(5,'Assorted Burger','A satisfying assorted burger featuring a delicious combination of flavorful ingredients.',7.49,'https://res.cloudinary.com/decumd3lu/image/upload/v1788927501/Assorted_burger_sbm1yy.jpg',1,1,'2026-09-09 18:29:54.535384','2026-09-09 18:29:54.535413',1),(6,'Sausage Burger','A tasty burger filled with savory sausage, fresh vegetables, and special sauce.',5.99,'https://res.cloudinary.com/decumd3lu/image/upload/v1788927501/sausage_burger_ucvhqk.jpg',1,0,'2026-09-09 18:29:54.543234','2026-09-09 18:29:54.543265',1),(7,'Shrimp Burger','A flavorful shrimp burger combined with fresh vegetables and a creamy signature sauce.',7.49,'https://res.cloudinary.com/decumd3lu/image/upload/v1788927501/Shrimp_burger_rhzvn7.jpg',1,1,'2026-09-09 18:29:54.550997','2026-09-09 18:29:54.551027',1),(8,'Pork Burger','A tender pork patty burger served with crisp vegetables and savory sauce.',5.99,'https://res.cloudinary.com/decumd3lu/image/upload/v1788927500/pork_burger_jbwl4d.jpg',1,0,'2026-09-09 18:29:54.559374','2026-09-09 18:29:54.559405',1),(9,'Chicken Breast and Avocado Salad','A fresh salad combining grilled chicken breast, creamy avocado, and crisp vegetables.',8.99,'https://res.cloudinary.com/decumd3lu/image/upload/v1788934404/Chicken_breast_and_avocado_salad_jjs1wd.jpg',1,1,'2026-09-09 18:29:54.567216','2026-09-09 18:29:54.567246',2),(10,'Smoked Salmon Salad','A refreshing salad with smoked salmon, fresh vegetables, and a light dressing.',10.99,'https://res.cloudinary.com/decumd3lu/image/upload/v1788934403/Smoked_salmon_salad_xxi5sa.jpg',1,1,'2026-09-09 18:29:54.575623','2026-09-09 18:29:54.575653',2),(11,'Greek Salad','A classic Greek salad made with fresh vegetables, olives, and feta cheese.',7.99,'https://res.cloudinary.com/decumd3lu/image/upload/v1788934401/Greek_Salad_w3tf0s.jpg',1,0,'2026-09-09 18:29:54.583492','2026-09-09 18:29:54.583524',2),(12,'Brown Rice with Grilled Chicken Breast','Nutritious brown rice served with tender grilled chicken breast and fresh vegetables.',9.49,'https://res.cloudinary.com/decumd3lu/image/upload/v1788934399/Brown_rice_with_grilled_chicken_breast_btdovp.jpg',1,1,'2026-09-09 18:29:54.591570','2026-09-09 18:29:54.591601',2),(13,'Pan Seared Salmon with Asparagus','Pan-seared salmon served with fresh asparagus for a nutritious and flavorful meal.',12.99,'https://res.cloudinary.com/decumd3lu/image/upload/v1788934398/Pan_seared_salmon_with_asparagus_t7xzjk.jpg',1,1,'2026-09-09 18:29:54.599363','2026-09-09 18:29:54.599394',2),(14,'Healthy Shaking Beef','Tender beef cubes tossed with fresh vegetables and a flavorful healthy-style sauce.',10.99,'https://res.cloudinary.com/decumd3lu/image/upload/v1788934396/Healthy_Shaking_Beef_kuasfo.jpg',1,0,'2026-09-09 18:29:54.607224','2026-09-09 18:29:54.607254',2),(15,'Poke Bowl','A fresh and nutritious bowl combining seafood, vegetables, rice, and flavorful toppings.',9.99,'https://res.cloudinary.com/decumd3lu/image/upload/v1788934394/Poke_Bowl_enpilv.jpg',1,1,'2026-09-09 18:29:54.615087','2026-09-09 18:29:54.615119',2),(16,'Buddha Bowl','A wholesome bowl packed with vegetables, grains, and nutritious plant-based ingredients.',8.99,'https://res.cloudinary.com/decumd3lu/image/upload/v1788934392/Buddha_Bowl_hiffwj.jpg',1,0,'2026-09-09 18:29:54.623115','2026-09-09 18:29:54.623146',2),(17,'Whole Wheat Bread with Butter and Egg','Whole wheat bread served with butter and a freshly prepared egg for a simple healthy meal.',5.99,'https://res.cloudinary.com/decumd3lu/image/upload/v1788934391/Whole_wheat_bread_with_butter_and_egg_xymbsu.jpg',1,0,'2026-09-09 18:29:54.631390','2026-09-09 18:29:54.631421',2),(18,'Pumpkin Soup','A warm and creamy pumpkin soup made with fresh pumpkin and delicate seasoning.',6.49,'https://res.cloudinary.com/decumd3lu/image/upload/v1788934389/Pumpkin_soup_g6p3hh.jpg',1,0,'2026-09-09 18:29:54.639583','2026-09-09 18:29:54.639613',2),(19,'Fresh Spring Rolls','Fresh rice paper rolls filled with vegetables, herbs, and delicious healthy ingredients.',6.99,'https://res.cloudinary.com/decumd3lu/image/upload/v1788934389/Fresh_Spring_Rolls_wvyibz.jpg',1,1,'2026-09-09 18:29:54.647540','2026-09-09 18:29:54.647569',2),(20,'Smoothie Bowl','A refreshing smoothie bowl topped with fresh fruits and nutritious ingredients.',7.49,'https://res.cloudinary.com/decumd3lu/image/upload/v1788934388/Smoothie_Bowl_vv58tu.jpg',1,1,'2026-09-09 18:29:54.655550','2026-09-09 18:29:54.655580',2),(21,'Arabica','Aromatic Arabica coffee with a smooth body and naturally rich flavor.',3.49,'https://res.cloudinary.com/decumd3lu/image/upload/v1788930669/Arabica_jspwo4.jpg',1,1,'2026-09-09 18:29:54.663316','2026-09-09 18:29:54.663347',3),(22,'Robusta','Bold and strong Robusta coffee with an intense aroma and rich taste.',3.29,'https://res.cloudinary.com/decumd3lu/image/upload/v1788930668/Robusta_mnpk2u.jpg',1,0,'2026-09-09 18:29:54.671283','2026-09-09 18:29:54.671313',3),(23,'Liberica','Distinctive Liberica coffee known for its unique aroma and bold character.',3.79,'https://res.cloudinary.com/decumd3lu/image/upload/v1788930666/Liberica_spxwms.jpg',1,0,'2026-09-09 18:29:54.679291','2026-09-09 18:29:54.679321',3),(24,'Espresso','A concentrated shot of rich and aromatic espresso with a smooth crema.',2.99,'https://res.cloudinary.com/decumd3lu/image/upload/v1788930664/Espresso_szrx8p.jpg',1,1,'2026-09-09 18:29:54.687854','2026-09-09 18:29:54.687883',3),(25,'Vietnam Filter Coffee','Traditional Vietnamese drip coffee with a rich, bold flavor and aromatic finish.',3.49,'https://res.cloudinary.com/decumd3lu/image/upload/v1788930664/Vietnam_Filter_Coffee_gi335x.jpg',1,1,'2026-09-09 18:29:54.695909','2026-09-09 18:29:54.695939',3),(26,'Cold Brew','Smooth and refreshing coffee slowly brewed with cold water for a mellow taste.',4.49,'https://res.cloudinary.com/decumd3lu/image/upload/v1788930663/Cold_Brew_bslvsi.jpg',1,1,'2026-09-09 18:29:54.704286','2026-09-09 18:29:54.704317',3),(27,'Pour-over','Hand-brewed coffee with a clean flavor, delicate aroma, and balanced finish.',4.29,'https://res.cloudinary.com/decumd3lu/image/upload/v1788930663/Pour-over_iz2ppj.jpg',1,0,'2026-09-09 18:29:54.712596','2026-09-09 18:29:54.712626',3),(28,'French Press','Rich and full-bodied coffee brewed using the classic French press method.',4.29,'https://res.cloudinary.com/decumd3lu/image/upload/v1788930660/French_Press_reko4p.jpg',1,0,'2026-09-09 18:29:54.720702','2026-09-09 18:29:54.720732',3),(29,'Americano','Smooth espresso diluted with hot water for a clean and refreshing coffee experience.',3.49,'https://res.cloudinary.com/decumd3lu/image/upload/v1788930659/Americano_kazbzn.jpg',1,1,'2026-09-09 18:29:54.728723','2026-09-09 18:29:54.728753',3),(30,'Latte','Smooth espresso combined with steamed milk and a light layer of creamy foam.',4.49,'https://res.cloudinary.com/decumd3lu/image/upload/v1788930657/Latte_u1qxom.jpg',1,1,'2026-09-09 18:29:54.737020','2026-09-09 18:29:54.737051',3),(31,'Cappuccino','Classic espresso topped with steamed milk and a generous layer of milk foam.',4.49,'https://res.cloudinary.com/decumd3lu/image/upload/v1788930656/Cappuccino_oosdwy.jpg',1,1,'2026-09-09 18:29:54.745130','2026-09-09 18:29:54.745159',3),(32,'Mocha','A delicious combination of espresso, chocolate, and steamed milk with a creamy finish.',4.99,'https://res.cloudinary.com/decumd3lu/image/upload/v1788930656/Mocha_nmjl0r.jpg',1,1,'2026-09-09 18:29:54.753117','2026-09-09 18:29:54.753147',3),(33,'Flat White','Velvety espresso-based coffee with finely textured steamed milk.',4.49,'https://res.cloudinary.com/decumd3lu/image/upload/v1788930656/Flat_White_d19ufy.jpg',1,0,'2026-09-09 18:29:54.760875','2026-09-09 18:29:54.760904',3),(34,'Macchiato','Rich espresso lightly marked with steamed milk for a bold and creamy flavor.',3.99,'https://res.cloudinary.com/decumd3lu/image/upload/v1788930655/macchiato_byslty.jpg',1,0,'2026-09-09 18:29:54.768644','2026-09-09 18:29:54.768674',3),(35,'Philadelphia Ice Cream','Rich and creamy Philadelphia-style ice cream with a smooth and refreshing texture.',4.99,'https://res.cloudinary.com/decumd3lu/image/upload/v1788930068/Philadelphia_Ice_Cream_ramgby.jpg',1,0,'2026-09-09 18:29:54.776158','2026-09-09 18:29:54.776188',4),(36,'French Ice Cream','Luxuriously creamy French-style ice cream with a rich and delicate flavor.',5.49,'https://res.cloudinary.com/decumd3lu/image/upload/v1788930067/French_Ice_Cream_d0xydj.jpg',1,1,'2026-09-09 18:29:54.784145','2026-09-09 18:29:54.784174',4),(37,'Gelato','Silky Italian-style gelato with an intense flavor and wonderfully smooth texture.',5.49,'https://res.cloudinary.com/decumd3lu/image/upload/v1788930066/Gelato_mjqf5d.jpg',1,1,'2026-09-09 18:29:54.792065','2026-09-09 18:29:54.792094',4),(38,'Soft Serve','Light and creamy soft serve ice cream with a smooth and refreshing finish.',3.99,'https://res.cloudinary.com/decumd3lu/image/upload/v1788930065/Soft_Serve_t2rjcy.jpg',1,1,'2026-09-09 18:29:54.800195','2026-09-09 18:29:54.800224',4),(39,'Sherbet','Refreshing fruit-based frozen dessert with a light and tangy flavor.',4.29,'https://res.cloudinary.com/decumd3lu/image/upload/v1788930064/Sherbet_awlffe.jpg',1,0,'2026-09-09 18:29:54.808160','2026-09-09 18:29:54.808190',4),(40,'Sorbet','Refreshing dairy-free frozen dessert made with fruity and vibrant flavors.',4.29,'https://res.cloudinary.com/decumd3lu/image/upload/v1788930063/Sorbet_qnlpno.jpg',1,1,'2026-09-09 18:29:54.816270','2026-09-09 18:29:54.816300',4),(41,'Sorbetto','Italian-style fruit sorbetto with a refreshing texture and bright natural flavor.',4.49,'https://res.cloudinary.com/decumd3lu/image/upload/v1788930062/Sorbetto_rpvorg.jpg',1,0,'2026-09-09 18:29:54.824338','2026-09-09 18:29:54.824369',4),(42,'Vegan Ice Cream','Creamy plant-based ice cream made for a delicious dairy-free dessert experience.',5.29,'https://res.cloudinary.com/decumd3lu/image/upload/v1788930060/Vegan_Ice_Cream_je8kil.jpg',1,0,'2026-09-09 18:29:54.832386','2026-09-09 18:29:54.832415',4),(43,'Frozen Yogurt','Light and tangy frozen yogurt with a smooth and refreshing texture.',4.49,'https://res.cloudinary.com/decumd3lu/image/upload/v1788930060/Frozen_Yogurt_tycbog.jpg',1,0,'2026-09-09 18:29:54.840290','2026-09-09 18:29:54.840321',4),(44,'Mochi Ice Cream','Soft Japanese mochi wrapped around creamy ice cream for a delightful dessert.',5.99,'https://res.cloudinary.com/decumd3lu/image/upload/v1788930059/Mochi_Ice_Cream_kymb3l.jpg',1,1,'2026-09-09 18:29:54.850078','2026-09-09 18:29:54.850107',4),(45,'Bingsu','Korean shaved ice dessert served with sweet toppings and creamy ingredients.',6.49,'https://res.cloudinary.com/decumd3lu/image/upload/v1788930059/Bingsu_u9cflq.jpg',1,1,'2026-09-09 18:29:54.858103','2026-09-09 18:29:54.858134',4),(46,'Kulfi','Traditional Indian frozen dessert with a rich, creamy, and aromatic flavor.',5.29,'https://res.cloudinary.com/decumd3lu/image/upload/v1788930059/Kulfi_cgvuth.jpg',1,0,'2026-09-09 18:29:54.866272','2026-09-09 18:29:54.866301',4),(47,'Neapolitan Pizza','Classic Italian pizza with a soft crust, tomato sauce, mozzarella, and fresh basil.',10.99,'https://res.cloudinary.com/decumd3lu/image/upload/v1788928638/Neapolitan_Pizza_gx9ps3.jpg',1,1,'2026-09-09 18:29:54.874118','2026-09-09 18:29:54.874148',5),(48,'BBQ Chicken Pizza','Savory pizza topped with tender chicken, barbecue sauce, cheese, and fresh ingredients.',11.99,'https://res.cloudinary.com/decumd3lu/image/upload/v1788928637/BBQ_Chicken_Pizza_j9bnnw.jpg',1,1,'2026-09-09 18:29:54.882483','2026-09-09 18:29:54.882511',5),(49,'New York Style Pizza','Classic New York-style pizza with a thin, foldable crust and flavorful toppings.',10.49,'https://res.cloudinary.com/decumd3lu/image/upload/v1788928637/New_York_style_Pizza_iclzyt.jpg',1,0,'2026-09-09 18:29:54.890369','2026-09-09 18:29:54.890400',5),(50,'Chicago Deep Dish Pizza','Deep-dish pizza with a thick buttery crust, rich tomato sauce, cheese, and toppings.',12.99,'https://res.cloudinary.com/decumd3lu/image/upload/v1788928637/Chicago_Deep_Dish_Pizza_wkjewf.jpg',1,1,'2026-09-09 18:29:54.898218','2026-09-09 18:29:54.898249',5),(51,'Ground Beef Pizza','Flavorful pizza topped with seasoned ground beef, melted cheese, and fresh ingredients.',11.49,'https://res.cloudinary.com/decumd3lu/image/upload/v1788928637/Ground_Beef_Pizza_ournyc.jpg',1,0,'2026-09-09 18:29:54.906550','2026-09-09 18:29:54.906582',5),(52,'Pizza Marinara','Simple Italian pizza topped with tomato sauce, garlic, oregano, and olive oil.',8.99,'https://res.cloudinary.com/decumd3lu/image/upload/v1788928637/Pizza_arinara_klcqf3.jpg',1,0,'2026-09-09 18:29:54.914624','2026-09-09 18:29:54.914655',5),(53,'Pizza Capricciosa','Classic Italian pizza topped with cheese, mushrooms, ham, artichokes, and olives.',12.49,'https://res.cloudinary.com/decumd3lu/image/upload/v1788928637/Pizza_Capricciosa_zkkhl6.jpg',1,1,'2026-09-09 18:29:54.922686','2026-09-09 18:29:54.922716',5),(54,'Seafood Pizza','Delicious pizza topped with fresh seafood, melted cheese, tomato sauce, and herbs.',13.49,'https://res.cloudinary.com/decumd3lu/image/upload/v1788928637/seafood_pizza_vvkgpe.jpg',1,1,'2026-09-09 18:29:54.930381','2026-09-09 18:29:54.930412',5),(55,'Pizza Hawaii','Sweet and savory pizza combining ham, pineapple, tomato sauce, and melted cheese.',10.99,'https://res.cloudinary.com/decumd3lu/image/upload/v1788928636/Pizza_Hawaii_wcf37c.jpg',1,0,'2026-09-09 18:29:54.938400','2026-09-09 18:29:54.938430',5),(56,'Pizza Quattro Formaggi','Rich Italian pizza made with a delicious blend of four different cheeses.',12.49,'https://res.cloudinary.com/decumd3lu/image/upload/v1788928636/Pizza_Quattro_Formaggi_kbvbyt.jpg',1,1,'2026-09-09 18:29:54.946201','2026-09-09 18:29:54.946231',5),(57,'Pizza Pepperoni','Classic pizza topped with spicy pepperoni, melted mozzarella, and rich tomato sauce.',11.49,'https://res.cloudinary.com/decumd3lu/image/upload/v1788928636/Pizza_Pepperoni_h93mrr.jpg',1,1,'2026-09-09 18:29:54.954274','2026-09-09 18:29:54.954305',5),(58,'Pizza Margherita','Classic Italian pizza made with tomato sauce, mozzarella cheese, and fresh basil.',9.99,'https://res.cloudinary.com/decumd3lu/image/upload/v1788928636/Pizza_Margherita_ylkqp0.jpg',1,1,'2026-09-09 18:29:54.962175','2026-09-09 18:29:54.962205',5),(59,'Shrimp','Fresh and succulent shrimp with a naturally sweet and delicate seafood flavor.',9.99,'https://res.cloudinary.com/decumd3lu/image/upload/v1788933844/Shrimp_tr7amh.jpg',1,1,'2026-09-09 18:29:54.970416','2026-09-09 18:29:54.970446',6),(60,'Crab','Fresh crab with sweet and tender meat, perfect for seafood lovers.',12.99,'https://res.cloudinary.com/decumd3lu/image/upload/v1788933832/crab_gauylo.jpg',1,1,'2026-09-09 18:29:54.978349','2026-09-09 18:29:54.978380',6),(61,'Lobster','Premium lobster with tender meat and a rich, naturally sweet seafood flavor.',19.99,'https://res.cloudinary.com/decumd3lu/image/upload/v1788933831/Lobster_vmm9kt.jpg',1,1,'2026-09-09 18:29:54.986056','2026-09-09 18:29:54.986087',6),(62,'Squid','Tender squid with a delicate seafood flavor and satisfying texture.',8.99,'https://res.cloudinary.com/decumd3lu/image/upload/v1788933829/Squid_jeyvnd.jpg',1,0,'2026-09-09 18:29:54.993896','2026-09-09 18:29:54.993926',6),(63,'Octopus','Tender octopus with a delicate flavor and satisfying texture.',11.99,'https://res.cloudinary.com/decumd3lu/image/upload/v1788933827/octopus_qfqtej.jpg',1,0,'2026-09-09 18:29:55.001644','2026-09-09 18:29:55.001673',6),(64,'Oysters','Fresh oysters with a delicate briny flavor and smooth texture.',13.99,'https://res.cloudinary.com/decumd3lu/image/upload/v1788933825/Oysters_o2yssu.jpg',1,1,'2026-09-09 18:29:55.009426','2026-09-09 18:29:55.009457',6),(65,'Abalone','Premium abalone with a delicate flavor and firm yet tender texture.',18.99,'https://res.cloudinary.com/decumd3lu/image/upload/v1788933805/Abalone_ct9cjm.jpg',1,1,'2026-09-09 18:29:55.021004','2026-09-09 18:29:55.021034',6),(66,'Scallops','Tender scallops with a naturally sweet flavor and delicate texture.',14.99,'https://res.cloudinary.com/decumd3lu/image/upload/v1788933759/Scallops_aryk3e.jpg',1,1,'2026-09-09 18:29:55.029362','2026-09-09 18:29:55.029392',6),(67,'Salmon','Fresh salmon with a rich flavor and tender, buttery texture.',13.99,'https://res.cloudinary.com/decumd3lu/image/upload/v1788933758/Salmon_q2zvj5.jpg',1,1,'2026-09-09 18:29:55.037809','2026-09-09 18:29:55.037837',6),(68,'Tuna','Fresh tuna with a rich, meaty texture and distinctive seafood flavor.',12.99,'https://res.cloudinary.com/decumd3lu/image/upload/v1788933756/Tuna_qgxnmc.jpg',1,0,'2026-09-09 18:29:55.046082','2026-09-09 18:29:55.046112',6),(69,'Mackerel','Flavorful mackerel with a rich taste and firm, tender texture.',9.49,'https://res.cloudinary.com/decumd3lu/image/upload/v1788933755/Mackerel_vpqaqr.jpg',1,0,'2026-09-09 18:29:55.054887','2026-09-09 18:29:55.054919',6),(70,'Seabass','Tender seabass with a mild flavor and delicate texture.',11.99,'https://res.cloudinary.com/decumd3lu/image/upload/v1788933741/Seabass_h8wrkm.jpg',1,0,'2026-09-09 18:29:55.065189','2026-09-09 18:29:55.065247',6),(71,'Cabernet Sauvignon','A full-bodied red wine with rich fruit flavors and a smooth, structured finish.',18.99,'https://res.cloudinary.com/decumd3lu/image/upload/v1788929367/Cabernet_Sauvignon_vmdgcr.jpg',1,1,'2026-09-09 18:29:55.077434','2026-09-09 18:29:55.077461',7),(72,'Merlot','A smooth and approachable red wine with soft fruit flavors and a mellow finish.',17.99,'https://res.cloudinary.com/decumd3lu/image/upload/v1788929366/Merlot_zc1v6v.jpg',1,0,'2026-09-09 18:29:55.086347','2026-09-09 18:29:55.086377',7),(73,'Pinot Noir','An elegant red wine with delicate fruit aromas and a smooth, balanced character.',19.99,'https://res.cloudinary.com/decumd3lu/image/upload/v1788929365/Pinot_Noir_b6llvc.jpg',1,1,'2026-09-09 18:29:55.095237','2026-09-09 18:29:55.095272',7),(74,'Syrah','A bold red wine with rich fruit flavors, spice, and a deep finish.',18.49,'https://res.cloudinary.com/decumd3lu/image/upload/v1788929364/Syrah_o80fs0.jpg',1,0,'2026-09-09 18:29:55.103383','2026-09-09 18:29:55.103414',7),(75,'Chardonnay','A smooth white wine with balanced fruit flavors and a refreshing finish.',17.49,'https://res.cloudinary.com/decumd3lu/image/upload/v1788929363/Chardonnay_vdgpjq.jpg',1,1,'2026-09-09 18:29:55.112161','2026-09-09 18:29:55.112193',7),(76,'Sauvignon Blanc','A crisp and refreshing white wine with bright citrus and herbal notes.',16.99,'https://res.cloudinary.com/decumd3lu/image/upload/v1788929362/Sauvignon_Blanc_cedjbd.jpg',1,0,'2026-09-09 18:29:55.120155','2026-09-09 18:29:55.120182',7),(77,'Riesling','An aromatic white wine with refreshing acidity and delicate fruit flavors.',17.99,'https://res.cloudinary.com/decumd3lu/image/upload/v1788929361/Riesling_nr0esz.jpg',1,0,'2026-09-09 18:29:55.128558','2026-09-09 18:29:55.128588',7),(78,'Rosé Wine','A refreshing rosé wine with delicate fruit aromas and a light, crisp character.',16.49,'https://res.cloudinary.com/decumd3lu/image/upload/v1788929361/Ros%C3%A9_Wine_sjzyba.jpg',1,1,'2026-09-09 18:29:55.136345','2026-09-09 18:29:55.136377',7),(79,'Prosecco','A light and refreshing Italian sparkling wine with bright fruity notes.',20.99,'https://res.cloudinary.com/decumd3lu/image/upload/v1788929359/Prosecco_eo2ghl.jpg',1,1,'2026-09-09 18:29:55.144209','2026-09-09 18:29:55.144239',7),(80,'Champagne','Elegant French sparkling wine with fine bubbles and a refined, celebratory character.',29.99,'https://res.cloudinary.com/decumd3lu/image/upload/v1788929359/Champagne_ewiphw.jpg',1,1,'2026-09-09 18:29:55.151897','2026-09-09 18:29:55.151927',7),(81,'Cava','Refreshing Spanish sparkling wine with crisp acidity and delicate fruit notes.',19.99,'https://res.cloudinary.com/decumd3lu/image/upload/v1788929358/Cava_xtrq6w.jpg',1,0,'2026-09-09 18:29:55.159523','2026-09-09 18:29:55.159553',7),(82,'Fortified Wine','Rich and complex fortified wine with a deeper flavor and warming finish.',21.99,'https://res.cloudinary.com/decumd3lu/image/upload/v1788929358/Fortified_Wine_zjukuh.jpg',1,0,'2026-09-09 18:29:55.167230','2026-09-09 18:29:55.167261',7),(83,'Sweet Red Wine','A smooth sweet red wine with rich fruity flavors and a pleasant finish.',17.99,'https://res.cloudinary.com/decumd3lu/image/upload/v1788929358/Sweet_Red_Wine_ddjwg3.jpg',1,0,'2026-09-09 18:29:55.175223','2026-09-09 18:29:55.175255',7);
/*!40000 ALTER TABLE `foods_food` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications_notification`
--

DROP TABLE IF EXISTS `notifications_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications_notification` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `notification_type` varchar(20) NOT NULL,
  `title` varchar(150) NOT NULL,
  `message` longtext NOT NULL,
  `is_read` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `order_id` bigint DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notification_order_id_4ee8e5c3_fk_orders_order_id` (`order_id`),
  KEY `notifications_notification_user_id_b5e8c0ff_fk_accounts_user_id` (`user_id`),
  CONSTRAINT `notifications_notification_order_id_4ee8e5c3_fk_orders_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders_order` (`id`),
  CONSTRAINT `notifications_notification_user_id_b5e8c0ff_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications_notification`
--

LOCK TABLES `notifications_notification` WRITE;
/*!40000 ALTER TABLE `notifications_notification` DISABLE KEYS */;
INSERT INTO `notifications_notification` VALUES (1,'ORDER','Order placed','Your order #9 has been placed successfully.',1,'2026-09-09 19:36:44.311016',9,1),(2,'PAYMENT','Wallet deposit','$200000.00 has been added to your wallet successfully.',1,'2026-09-09 19:46:09.912772',NULL,1),(3,'ORDER','Order placed','Your order #10 has been placed successfully.',0,'2026-09-10 04:22:11.635396',10,1),(4,'PAYMENT','Wallet deposit','$20.00 has been added to your wallet successfully.',0,'2026-09-10 07:08:35.789616',NULL,1),(5,'ORDER','Order placed','Your order #11 has been placed successfully.',0,'2026-09-10 09:33:08.072126',11,1);
/*!40000 ALTER TABLE `notifications_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_order`
--

DROP TABLE IF EXISTS `orders_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `delivery_name` varchar(150) NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `delivery_fee` decimal(10,2) NOT NULL,
  `status` varchar(30) NOT NULL,
  `payment_method` varchar(20) NOT NULL,
  `delivery_address` longtext NOT NULL,
  `phone` varchar(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_order_user_id_e9b59eb1_fk_accounts_user_id` (`user_id`),
  CONSTRAINT `orders_order_user_id_e9b59eb1_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_order`
--

LOCK TABLES `orders_order` WRITE;
/*!40000 ALTER TABLE `orders_order` DISABLE KEYS */;
INSERT INTO `orders_order` VALUES (1,'Ari Grande',17.28,5.00,'PENDING','COD','33/7 Đặng Văn Ngữ','0332614284','2026-09-09 18:45:34.594076','2026-09-09 18:45:34.594124',1),(9,'Hướng Dương',9.99,5.00,'PENDING','COD','Vincent Van Gogh museum','0123456689','2026-09-09 19:36:44.309206','2026-09-09 19:36:44.309242',1),(10,'Cute Crab',30.98,5.00,'PENDING','WALLET','Netherlands','1234567891','2026-09-10 04:22:11.633903','2026-09-10 04:22:11.633929',1),(11,'Happy House',13.99,5.00,'PENDING','WALLET','Japan & Netherlands','0123456689','2026-09-10 09:33:08.070186','2026-09-10 09:33:08.070234',1);
/*!40000 ALTER TABLE `orders_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_orderitem`
--

DROP TABLE IF EXISTS `orders_orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_orderitem` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `food_name` varchar(150) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `quantity` int unsigned NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `food_id` bigint NOT NULL,
  `order_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_orderitem_food_id_25867428_fk_foods_food_id` (`food_id`),
  KEY `orders_orderitem_order_id_fe61a34d_fk_orders_order_id` (`order_id`),
  CONSTRAINT `orders_orderitem_food_id_25867428_fk_foods_food_id` FOREIGN KEY (`food_id`) REFERENCES `foods_food` (`id`),
  CONSTRAINT `orders_orderitem_order_id_fe61a34d_fk_orders_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders_order` (`id`),
  CONSTRAINT `orders_orderitem_chk_1` CHECK ((`quantity` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_orderitem`
--

LOCK TABLES `orders_orderitem` WRITE;
/*!40000 ALTER TABLE `orders_orderitem` DISABLE KEYS */;
INSERT INTO `orders_orderitem` VALUES (1,'Beef Burger',6.99,1,6.99,2,1),(2,'Vegan Ice Cream',5.29,1,5.29,42,1),(3,'Philadelphia Ice Cream',4.99,1,4.99,35,9),(4,'Crab',12.99,2,25.98,60,10),(5,'Buddha Bowl',8.99,1,8.99,16,11);
/*!40000 ALTER TABLE `orders_orderitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wallet_wallet`
--

DROP TABLE IF EXISTS `wallet_wallet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wallet_wallet` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `balance` decimal(12,2) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `wallet_wallet_user_id_8c75caaa_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallet_wallet`
--

LOCK TABLES `wallet_wallet` WRITE;
/*!40000 ALTER TABLE `wallet_wallet` DISABLE KEYS */;
INSERT INTO `wallet_wallet` VALUES (1,200006.01,'2026-09-09 19:46:06.009438','2026-09-10 09:33:08.067611',1);
/*!40000 ALTER TABLE `wallet_wallet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wallet_wallettransaction`
--

DROP TABLE IF EXISTS `wallet_wallettransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wallet_wallettransaction` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `transaction_type` varchar(20) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `description` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `order_id` bigint DEFAULT NULL,
  `wallet_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wallet_wallettransaction_order_id_13da7fe5_fk_orders_order_id` (`order_id`),
  KEY `wallet_wallettransaction_wallet_id_b438357c_fk_wallet_wallet_id` (`wallet_id`),
  CONSTRAINT `wallet_wallettransaction_order_id_13da7fe5_fk_orders_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders_order` (`id`),
  CONSTRAINT `wallet_wallettransaction_wallet_id_b438357c_fk_wallet_wallet_id` FOREIGN KEY (`wallet_id`) REFERENCES `wallet_wallet` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallet_wallettransaction`
--

LOCK TABLES `wallet_wallettransaction` WRITE;
/*!40000 ALTER TABLE `wallet_wallettransaction` DISABLE KEYS */;
INSERT INTO `wallet_wallettransaction` VALUES (1,'DEPOSIT',200000.00,'Wallet deposit','2026-09-09 19:46:09.911043',NULL,1),(2,'DEPOSIT',20.00,'Wallet deposit','2026-09-10 07:08:35.787813',NULL,1),(3,'PAYMENT',13.99,'Payment for Order #11','2026-09-10 09:33:08.075442',11,1);
/*!40000 ALTER TABLE `wallet_wallettransaction` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-11  4:25:04
