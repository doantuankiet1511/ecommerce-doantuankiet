-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: fukiappdb
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add category',6,'add_category'),(22,'Can change category',6,'change_category'),(23,'Can delete category',6,'delete_category'),(24,'Can view category',6,'view_category'),(25,'Can add user',7,'add_user'),(26,'Can change user',7,'change_user'),(27,'Can delete user',7,'delete_user'),(28,'Can view user',7,'view_user'),(29,'Can add shop',8,'add_shop'),(30,'Can change shop',8,'change_shop'),(31,'Can delete shop',8,'delete_shop'),(32,'Can view shop',8,'view_shop'),(33,'Can add product',9,'add_product'),(34,'Can change product',9,'change_product'),(35,'Can delete product',9,'delete_product'),(36,'Can view product',9,'view_product'),(37,'Can add application',10,'add_application'),(38,'Can change application',10,'change_application'),(39,'Can delete application',10,'delete_application'),(40,'Can view application',10,'view_application'),(41,'Can add access token',11,'add_accesstoken'),(42,'Can change access token',11,'change_accesstoken'),(43,'Can delete access token',11,'delete_accesstoken'),(44,'Can view access token',11,'view_accesstoken'),(45,'Can add grant',12,'add_grant'),(46,'Can change grant',12,'change_grant'),(47,'Can delete grant',12,'delete_grant'),(48,'Can view grant',12,'view_grant'),(49,'Can add refresh token',13,'add_refreshtoken'),(50,'Can change refresh token',13,'change_refreshtoken'),(51,'Can delete refresh token',13,'delete_refreshtoken'),(52,'Can view refresh token',13,'view_refreshtoken'),(53,'Can add id token',14,'add_idtoken'),(54,'Can change id token',14,'change_idtoken'),(55,'Can delete id token',14,'delete_idtoken'),(56,'Can view id token',14,'view_idtoken'),(57,'Can add review',15,'add_review'),(58,'Can change review',15,'change_review'),(59,'Can delete review',15,'delete_review'),(60,'Can view review',15,'view_review'),(61,'Can add comment',16,'add_comment'),(62,'Can change comment',16,'change_comment'),(63,'Can delete comment',16,'delete_comment'),(64,'Can view comment',16,'view_comment'),(65,'Can add tag',17,'add_tag'),(66,'Can change tag',17,'change_tag'),(67,'Can delete tag',17,'delete_tag'),(68,'Can view tag',17,'view_tag'),(69,'Can add notification',18,'add_notification'),(70,'Can change notification',18,'change_notification'),(71,'Can delete notification',18,'delete_notification'),(72,'Can view notification',18,'view_notification'),(73,'Can add like',19,'add_like'),(74,'Can change like',19,'change_like'),(75,'Can delete like',19,'delete_like'),(76,'Can view like',19,'view_like'),(77,'Can add payment method',20,'add_paymentmethod'),(78,'Can change payment method',20,'change_paymentmethod'),(79,'Can delete payment method',20,'delete_paymentmethod'),(80,'Can view payment method',20,'view_paymentmethod'),(81,'Can add order detail',21,'add_orderdetail'),(82,'Can change order detail',21,'change_orderdetail'),(83,'Can delete order detail',21,'delete_orderdetail'),(84,'Can view order detail',21,'view_orderdetail'),(85,'Can add order',22,'add_order'),(86,'Can change order',22,'change_order'),(87,'Can delete order',22,'delete_order'),(88,'Can view order',22,'view_order');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
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
  `object_id` longtext COLLATE utf8mb4_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_shops_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_shops_user_id` FOREIGN KEY (`user_id`) REFERENCES `shops_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2023-08-04 14:15:05.159237','2','employee',1,'[{\"added\": {}}]',7,1),(2,'2023-08-04 14:17:46.553648','1','admin',2,'[{\"changed\": {\"fields\": [\"Avatar\", \"Role\", \"Is verified\"]}}]',7,1),(3,'2023-08-04 14:18:35.047127','1','admin',2,'[{\"changed\": {\"fields\": [\"Password\"]}}]',7,1),(4,'2023-08-04 14:19:37.911791','1','Health & Beauty',1,'[{\"added\": {}}]',6,1),(5,'2023-08-04 14:20:24.875563','2','Fashion & Accessories',1,'[{\"added\": {}}]',6,1),(6,'2023-08-04 14:20:44.324062','3','Sports & Travel',1,'[{\"added\": {}}]',6,1),(7,'2023-08-04 14:20:55.467932','4','Body Soap & Shower Gel',1,'[{\"added\": {}}]',6,1),(8,'2023-08-04 14:21:19.276333','5','Electronic Device',1,'[{\"added\": {}}]',6,1),(9,'2023-08-04 14:21:26.729995','6','Food',1,'[{\"added\": {}}]',6,1),(10,'2023-08-04 14:21:36.165219','7','Book',1,'[{\"added\": {}}]',6,1),(11,'2023-08-04 14:25:39.649326','1','Classic Store',1,'[{\"added\": {}}]',8,1),(12,'2023-08-04 14:41:36.955693','1','Sữa Tắm Nam Bath & Body Works Men’s Collection 295ml',1,'[{\"added\": {}}]',9,1),(13,'2023-08-04 14:43:07.991778','1','Sữa Tắm Nam Bath & Body Works Men’s Collection 295ml',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',9,1),(14,'2023-08-04 14:43:13.266645','1','Sữa Tắm Nam Bath & Body Works Men’s Collection 295ml',2,'[]',9,1),(15,'2023-08-04 14:44:52.831012','2','Xả Khô Nashi Instant Mask Styling 150ML',1,'[{\"added\": {}}]',9,1),(16,'2023-08-04 14:46:28.928969','3','Sữa rửa mặt Jack Black Balancing Foam Cleanser 150ml',1,'[{\"added\": {}}]',9,1),(17,'2023-08-05 12:34:20.058946','1','Men',1,'[{\"added\": {}}]',17,1),(18,'2023-08-05 12:34:24.624275','2','Women',1,'[{\"added\": {}}]',17,1),(19,'2023-08-05 12:34:44.907516','1','Sữa Tắm Nam Bath & Body Works Men’s Collection 295ml',2,'[{\"changed\": {\"fields\": [\"Tags\"]}}]',9,1),(20,'2023-08-05 12:35:10.072090','2','Xả Khô Nashi Instant Mask Styling 150ML',2,'[{\"changed\": {\"fields\": [\"Tags\"]}}]',9,1),(21,'2023-08-05 12:35:16.793347','3','Sữa rửa mặt Jack Black Balancing Foam Cleanser 150ml',2,'[{\"changed\": {\"fields\": [\"Tags\"]}}]',9,1),(22,'2023-08-28 05:38:35.370382','1','Trực tiếp',1,'[{\"added\": {}}]',20,1),(23,'2023-08-28 05:38:43.424663','2','MoMo',1,'[{\"added\": {}}]',20,1),(24,'2023-09-01 07:02:55.970878','1','Classic Store',2,'[{\"changed\": {\"fields\": [\"description\", \"Avatar\"]}}]',8,1),(25,'2023-09-01 07:03:32.925365','1','Classic Store',2,'[{\"changed\": {\"fields\": [\"description\", \"Avatar\"]}}]',8,1),(26,'2023-09-21 03:02:20.164603','31','Tiki',3,'',8,1),(27,'2023-09-21 03:04:31.751540','32','Tiki',3,'',8,1),(28,'2023-09-21 03:08:50.010071','33','Tiki',3,'',8,1),(29,'2023-09-21 03:10:56.975423','34','Tiki',3,'',8,1),(30,'2023-09-21 03:19:20.455662','35','Tiki',3,'',8,1),(31,'2023-09-21 03:33:22.365444','36','Tiki',3,'',8,1),(32,'2023-09-21 03:36:13.677364','37','Tiki',3,'',8,1),(33,'2023-09-21 03:37:43.838377','38','Tiki',3,'',8,1),(34,'2023-09-21 03:43:58.164269','39','Tiki',3,'',8,1),(35,'2023-09-21 03:47:09.795747','40','Tiki',3,'',8,1),(36,'2023-09-21 03:51:39.392931','41','Tiki',3,'',8,1),(37,'2023-09-21 03:56:49.295980','42','Tiki',3,'',8,1),(38,'2023-09-21 03:58:29.605889','43','Tiki',3,'',8,1),(39,'2023-09-21 03:59:21.037188','44','Tiki',3,'',8,1),(40,'2023-09-21 18:34:27.132020','23','seller7',3,'',7,1),(41,'2023-09-21 18:34:39.185136','46','NEW',3,'',8,1),(42,'2023-09-21 18:34:47.243212','22','seller9',3,'',7,1);
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
  `app_label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(11,'oauth2_provider','accesstoken'),(10,'oauth2_provider','application'),(12,'oauth2_provider','grant'),(14,'oauth2_provider','idtoken'),(13,'oauth2_provider','refreshtoken'),(22,'orders','order'),(21,'orders','orderdetail'),(20,'orders','paymentmethod'),(5,'sessions','session'),(6,'shops','category'),(16,'shops','comment'),(19,'shops','like'),(18,'shops','notification'),(9,'shops','product'),(15,'shops','review'),(8,'shops','shop'),(17,'shops','tag'),(7,'shops','user');
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
  `app` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-08-04 11:29:46.314444'),(2,'contenttypes','0002_remove_content_type_name','2023-08-04 11:29:46.341352'),(3,'auth','0001_initial','2023-08-04 11:29:46.447000'),(4,'auth','0002_alter_permission_name_max_length','2023-08-04 11:29:46.469144'),(5,'auth','0003_alter_user_email_max_length','2023-08-04 11:29:46.474122'),(6,'auth','0004_alter_user_username_opts','2023-08-04 11:29:46.477524'),(7,'auth','0005_alter_user_last_login_null','2023-08-04 11:29:46.482209'),(8,'auth','0006_require_contenttypes_0002','2023-08-04 11:29:46.485306'),(9,'auth','0007_alter_validators_add_error_messages','2023-08-04 11:29:46.489280'),(10,'auth','0008_alter_user_username_max_length','2023-08-04 11:29:46.494273'),(11,'auth','0009_alter_user_last_name_max_length','2023-08-04 11:29:46.499203'),(12,'auth','0010_alter_group_name_max_length','2023-08-04 11:29:46.509169'),(13,'auth','0011_update_proxy_permissions','2023-08-04 11:29:46.514152'),(14,'auth','0012_alter_user_first_name_max_length','2023-08-04 11:29:46.519135'),(15,'shops','0001_initial','2023-08-04 11:29:46.641407'),(16,'admin','0001_initial','2023-08-04 11:29:46.696034'),(17,'admin','0002_logentry_remove_auto_add','2023-08-04 11:29:46.701017'),(18,'admin','0003_logentry_add_action_flag_choices','2023-08-04 11:29:46.706495'),(19,'sessions','0001_initial','2023-08-04 11:29:46.723300'),(20,'shops','0002_user_avatar_shop_product','2023-08-04 13:11:30.140755'),(21,'shops','0003_rename_active_product_is_active_and_more','2023-08-04 14:11:40.816403'),(22,'shops','0004_alter_user_is_verified','2023-08-04 14:16:51.222021'),(23,'shops','0005_alter_product_price_alter_user_role','2023-08-04 14:28:37.464967'),(24,'shops','0006_alter_product_description','2023-08-04 14:39:25.332456'),(25,'oauth2_provider','0001_initial','2023-08-04 15:43:15.108705'),(26,'oauth2_provider','0002_auto_20190406_1805','2023-08-04 15:43:15.158657'),(27,'oauth2_provider','0003_auto_20201211_1314','2023-08-04 15:43:15.195401'),(28,'oauth2_provider','0004_auto_20200902_2022','2023-08-04 15:43:15.412159'),(29,'oauth2_provider','0005_auto_20211222_2352','2023-08-04 15:43:15.448649'),(30,'oauth2_provider','0006_alter_application_client_secret','2023-08-04 15:43:15.466708'),(31,'oauth2_provider','0007_application_post_logout_redirect_uris','2023-08-04 15:43:15.506399'),(32,'shops','0007_tag_comment_product_tags_review','2023-08-05 12:13:46.114688'),(33,'shops','0008_notification','2023-08-07 03:18:48.504873'),(34,'shops','0009_like','2023-08-19 11:11:35.746081'),(35,'orders','0001_initial','2023-08-28 04:44:43.186251'),(36,'orders','0002_alter_orderdetail_order','2023-08-28 08:07:06.209104');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('4y2rfyuihesabmfp8t4fdf91bokcrlan','.eJxVjMsOwiAQRf-FtSFFwsule7-BzMCMVA0kpV0Z_12adKHbc869bxFhW0vcOi1xzuIilDj9MoT0pLqL_IB6bzK1ui4zyj2Rh-3y1jK9rkf7d1Cgl7G26BUZUBqz1szZuUA2UEoA1qH15Nm5iXkKitCD0efBeShlrDIaxOcLASo4SA:1qRvdY:7KoqQ6J0V17eilnRb5gleH7LvJPyU1Hetk0NlL16R2Y','2023-08-18 14:18:40.598756'),('95jj4umiauf5b2qs8r78uqys45gri5h2','.eJxVjMsOwiAQRf-FtSFFwsule7-BzMCMVA0kpV0Z_12adKHbc869bxFhW0vcOi1xzuIilDj9MoT0pLqL_IB6bzK1ui4zyj2Rh-3y1jK9rkf7d1Cgl7G26BUZUBqz1szZuUA2UEoA1qH15Nm5iXkKitCD0efBeShlrDIaxOcLASo4SA:1qiSiW:kihGobeljSJFNUcXdv2vdC9P773N2LDObvRIwvDbfuU','2023-10-03 04:52:08.207837'),('t9mkc0s71fbxsptgywthly64omuq3ond','.eJxVjMsOwiAQRf-FtSFFwsule7-BzMCMVA0kpV0Z_12adKHbc869bxFhW0vcOi1xzuIilDj9MoT0pLqL_IB6bzK1ui4zyj2Rh-3y1jK9rkf7d1Cgl7G26BUZUBqz1szZuUA2UEoA1qH15Nm5iXkKitCD0efBeShlrDIaxOcLASo4SA:1qhXcb:KllEmJ2-7XXb0LXGyiBFn-Oa_T8W26tKDdkqYuGsGTU','2023-09-30 15:54:13.414798'),('u1pvsdj3mz1pksjj29f8bcilbglfw1bw','.eJxVjMsOwiAQRf-FtSFFwsule7-BzMCMVA0kpV0Z_12adKHbc869bxFhW0vcOi1xzuIilDj9MoT0pLqL_IB6bzK1ui4zyj2Rh-3y1jK9rkf7d1Cgl7G26BUZUBqz1szZuUA2UEoA1qH15Nm5iXkKitCD0efBeShlrDIaxOcLASo4SA:1qaUxD:EQ-LjENz61cWAvU9vuWduxmq2CoPoJnVPJxqG-OOwSg','2023-09-11 05:38:23.361986'),('wkqgmdhgtgonn5h1gw98pxmed4nay2au','.eJxVjMsOwiAQRf-FtSFFwsule7-BzMCMVA0kpV0Z_12adKHbc869bxFhW0vcOi1xzuIilDj9MoT0pLqL_IB6bzK1ui4zyj2Rh-3y1jK9rkf7d1Cgl7G26BUZUBqz1szZuUA2UEoA1qH15Nm5iXkKitCD0efBeShlrDIaxOcLASo4SA:1qj9xD:6h-rogM7ahyi5oPfrFnXgJ0Gt1wE1ymTkznYp7qjMvw','2023-10-05 03:02:11.061853');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_accesstoken`
--

DROP TABLE IF EXISTS `oauth2_provider_accesstoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_accesstoken` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires` datetime(6) NOT NULL,
  `scope` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `application_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `source_refresh_token_id` bigint DEFAULT NULL,
  `id_token_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`),
  UNIQUE KEY `source_refresh_token_id` (`source_refresh_token_id`),
  UNIQUE KEY `id_token_id` (`id_token_id`),
  KEY `oauth2_provider_acce_application_id_b22886e1_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_accesstoken_user_id_6e4c9a65_fk_shops_user_id` (`user_id`),
  CONSTRAINT `oauth2_provider_acce_application_id_b22886e1_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_acce_id_token_id_85db651b_fk_oauth2_pr` FOREIGN KEY (`id_token_id`) REFERENCES `oauth2_provider_idtoken` (`id`),
  CONSTRAINT `oauth2_provider_acce_source_refresh_token_e66fbc72_fk_oauth2_pr` FOREIGN KEY (`source_refresh_token_id`) REFERENCES `oauth2_provider_refreshtoken` (`id`),
  CONSTRAINT `oauth2_provider_accesstoken_user_id_6e4c9a65_fk_shops_user_id` FOREIGN KEY (`user_id`) REFERENCES `shops_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=307 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_accesstoken`
--

LOCK TABLES `oauth2_provider_accesstoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_accesstoken` DISABLE KEYS */;
INSERT INTO `oauth2_provider_accesstoken` VALUES (1,'bmP8gDQ0jhYQfgWzsphiFe8lnf3BA4','2023-08-06 00:52:01.014092','read write',1,7,'2023-08-05 14:52:01.014092','2023-08-05 14:52:01.014092',NULL,NULL),(2,'8cMu2LrKSmyXSOsGlBLuamI2S2lEeH','2023-08-06 01:56:23.408487','read write',1,1,'2023-08-05 15:56:23.408487','2023-08-05 15:56:23.408487',NULL,NULL),(3,'46rNr1ZbAWAmndUicZiqw78IDsGb5r','2023-08-06 02:01:27.037759','read write',1,1,'2023-08-05 16:01:27.037759','2023-08-05 16:01:27.037759',NULL,NULL),(4,'R7rCFXKSIw8wilCl221FD8cfsnunpw','2023-08-06 20:53:12.042249','read write',1,1,'2023-08-06 10:53:12.042249','2023-08-06 10:53:12.042249',NULL,NULL),(5,'9K9DdhcOJFapDnd6W9vLUrFBOhHOA3','2023-08-06 22:11:07.170571','read write',1,2,'2023-08-06 12:11:07.171569','2023-08-06 12:11:07.171569',NULL,NULL),(6,'5QL855Hik23SN02Un5V740p7GtO0AC','2023-08-06 22:11:26.927471','read write',1,7,'2023-08-06 12:11:26.927471','2023-08-06 12:11:26.927471',NULL,NULL),(7,'L5wjrcwi3BqecCzuJJX2CnlcydBd8k','2023-08-06 22:17:06.470688','read write',1,1,'2023-08-06 12:17:06.470688','2023-08-06 12:17:06.470688',NULL,NULL),(8,'lQmh890CpUYT0PMTyek1lpSJEEOPDA','2023-08-07 04:16:28.104950','read write',1,7,'2023-08-06 18:16:28.104950','2023-08-06 18:16:28.104950',NULL,NULL),(9,'R4DWz1ufDsykuJPqu6sN5fBtnlfnUq','2023-08-07 12:50:27.085679','read write',1,3,'2023-08-07 02:50:27.086671','2023-08-07 02:50:27.086671',NULL,NULL),(10,'fdYcxEHNwfXesRvAKtpGDP9PHaRDhL','2023-08-07 12:58:22.786776','read write',1,7,'2023-08-07 02:58:22.786776','2023-08-07 02:58:22.786776',NULL,NULL),(11,'z7mfFKZsMyv2ltNw0xMqmPICDISlUZ','2023-08-07 12:58:53.570214','read write',1,1,'2023-08-07 02:58:53.570214','2023-08-07 02:58:53.570214',NULL,NULL),(12,'5bocxN9aCTzBJGsdeikRM5uZRypBBI','2023-08-07 12:59:21.294831','read write',1,3,'2023-08-07 02:59:21.295888','2023-08-07 02:59:21.295888',NULL,NULL),(13,'KLLAi1UgR9Yl5o9fne8XQqz9IiR7IR','2023-08-07 13:00:26.861149','read write',1,7,'2023-08-07 03:00:26.861149','2023-08-07 03:00:26.861149',NULL,NULL),(14,'I2FlYPHdJtppy48myQLbojvg5D9udu','2023-08-07 13:00:39.643326','read write',1,1,'2023-08-07 03:00:39.643326','2023-08-07 03:00:39.643326',NULL,NULL),(15,'MdcranNvlay0NBSaqHF73gxMVZJn1u','2023-08-07 13:00:57.306107','read write',1,3,'2023-08-07 03:00:57.306107','2023-08-07 03:00:57.306107',NULL,NULL),(16,'2nP9Ck1lZqhlSmcHhnQoQ2go3YhS81','2023-08-07 13:01:54.969299','read write',1,2,'2023-08-07 03:01:54.970292','2023-08-07 03:01:54.970292',NULL,NULL),(17,'Mo9SNXJGaFtQDs0d2ZZ0RInWPGTQH1','2023-08-07 13:25:41.544671','read write',1,8,'2023-08-07 03:25:41.544671','2023-08-07 03:25:41.544671',NULL,NULL),(18,'OozvDOBdsAN08DklnsjFS0zU9iRJ1A','2023-08-07 13:41:53.899676','read write',1,2,'2023-08-07 03:41:53.899676','2023-08-07 03:41:53.899676',NULL,NULL),(19,'uprZHTMPmuhQRNp4AK0EUAM0tfFWC8','2023-08-07 13:45:13.122941','read write',1,8,'2023-08-07 03:45:13.123934','2023-08-07 03:45:13.123934',NULL,NULL),(20,'umKnbQS0md9el3Z2S4eVdIpB5P2ouN','2023-08-07 13:46:06.925927','read write',1,1,'2023-08-07 03:46:06.925927','2023-08-07 03:46:06.925927',NULL,NULL),(21,'3jUAVKQqijpyOjcYj0zhwfbyHg25tf','2023-08-11 16:39:39.545946','read write',1,1,'2023-08-11 06:39:39.546936','2023-08-11 06:39:39.546936',NULL,NULL),(22,'8g71Y66SGlhYpWrr0aAS9isZ79KAAv','2023-08-13 00:38:28.892323','read write',1,1,'2023-08-12 14:38:28.892825','2023-08-12 14:38:28.892825',NULL,NULL),(23,'qVmuRZsBHfnnMV26nJTYYRn7G4bwjH','2023-08-13 01:08:09.158842','read write',1,1,'2023-08-12 15:08:09.158842','2023-08-12 15:08:09.158842',NULL,NULL),(24,'erzh5DlFORm9PIEHqcEM8zUKgaX5R9','2023-08-13 01:08:10.946936','read write',1,1,'2023-08-12 15:08:10.946936','2023-08-12 15:08:10.946936',NULL,NULL),(25,'qMg7TSwyal0GhIRFkGudSinRMjozSC','2023-08-13 03:04:42.778862','read write',1,1,'2023-08-12 17:04:42.778862','2023-08-12 17:04:42.778862',NULL,NULL),(26,'TvvmUuTyKylyJg3ojOU3tYAqxpQBOS','2023-08-13 03:17:36.570977','read write',1,1,'2023-08-12 17:17:36.570977','2023-08-12 17:17:36.570977',NULL,NULL),(27,'v9dB3vqNOkqWqQI8KjN4JY3B1QzMIs','2023-08-13 03:19:15.471021','read write',1,1,'2023-08-12 17:19:15.471021','2023-08-12 17:19:15.471021',NULL,NULL),(28,'iRXHu3JvpemJ07WuQ26Bh3oowMOPxa','2023-08-13 03:20:15.572357','read write',1,1,'2023-08-12 17:20:15.572357','2023-08-12 17:20:15.572357',NULL,NULL),(29,'pxuNGEa1fU3TZL4nWKaGpNd8A7PwFe','2023-08-13 03:20:42.088443','read write',1,1,'2023-08-12 17:20:42.089422','2023-08-12 17:20:42.089422',NULL,NULL),(30,'NUs9GEFLh1IoLz553PuBJcoLvmnu6A','2023-08-13 03:24:45.077671','read write',1,1,'2023-08-12 17:24:45.077671','2023-08-12 17:24:45.077671',NULL,NULL),(31,'94fFupAULshY01ADBnEBV2G8fS4LE3','2023-08-13 03:25:27.531135','read write',1,1,'2023-08-12 17:25:27.532133','2023-08-12 17:25:27.532133',NULL,NULL),(32,'N6x1potBup0SRDpeLXDuAZ6DpD1o3r','2023-08-13 16:40:21.196358','read write',1,1,'2023-08-13 06:40:21.197356','2023-08-13 06:40:21.197356',NULL,NULL),(33,'GX1T8gqlkPmlO0XlxBQBgL4HBoV47U','2023-08-13 16:57:34.043399','read write',1,1,'2023-08-13 06:57:34.043399','2023-08-13 06:57:34.043399',NULL,NULL),(34,'h7w01mgvVEtuQBnb9GU71XqLkVdJx6','2023-08-17 05:27:58.069076','read write',1,10,'2023-08-16 19:27:58.069076','2023-08-16 19:27:58.069076',NULL,NULL),(35,'5tDiSUEU1sfetRDrPLwWpzJCxuPX0K','2023-08-20 04:34:08.243252','read write',1,1,'2023-08-19 18:34:08.244246','2023-08-19 18:34:08.244246',NULL,NULL),(36,'xenhs4hdV6hTp5CIl4d1ZrlYcaocti','2023-08-20 04:35:25.596048','read write',1,10,'2023-08-19 18:35:25.596048','2023-08-19 18:35:25.596048',NULL,NULL),(37,'rK9FeZsS6reKH3RsAIJ9kDM7JSszX3','2023-08-20 21:20:14.362475','read write',1,10,'2023-08-20 11:20:14.362475','2023-08-20 11:20:14.362475',NULL,NULL),(38,'Jvvm8nG4Q5mNJILmvRd1nKTGBGQLzt','2023-08-21 03:49:29.167756','read write',1,1,'2023-08-20 17:49:29.167756','2023-08-20 17:49:29.167756',NULL,NULL),(39,'A76G3uhbn3Hyh1PIprpY3tRzvqjrL2','2023-08-21 03:58:26.298038','read write',1,10,'2023-08-20 17:58:26.298038','2023-08-20 17:58:26.298038',NULL,NULL),(40,'82ikeZnxReP7coBxkTpPvFxrEfECQg','2023-08-21 15:01:31.671535','read write',1,10,'2023-08-21 05:01:31.671535','2023-08-21 05:01:31.671535',NULL,NULL),(41,'DwcpfMTMJXXtWwxU6waJEYU7SYe3PQ','2023-08-21 15:50:45.801677','read write',1,10,'2023-08-21 05:50:45.802674','2023-08-21 05:50:45.802674',NULL,NULL),(42,'obXaaJHxQnErMztsFI5zFrQkFS4Qgc','2023-08-22 00:16:51.296347','read write',1,10,'2023-08-21 14:16:51.297339','2023-08-21 14:16:51.297339',NULL,NULL),(43,'T0JerygMnddfkBit3PCrHu44AJOSZA','2023-08-22 02:31:06.752445','read write',1,10,'2023-08-21 16:31:06.752445','2023-08-21 16:31:06.752445',NULL,NULL),(44,'G3QipwKoryb8ubMoYq6mlkvjQjrxyu','2023-08-22 03:13:28.593255','read write',1,10,'2023-08-21 17:13:28.593255','2023-08-21 17:13:28.593255',NULL,NULL),(45,'dhzoFh5Coz480ZNb6nkh5BJT472ebW','2023-08-22 04:41:47.103185','read write',1,10,'2023-08-21 18:41:47.104179','2023-08-21 18:41:47.104179',NULL,NULL),(46,'wwDhpkYfZmJuqZ3tW0O3egzb2zsfCe','2023-08-22 04:45:27.309796','read write',1,10,'2023-08-21 18:45:27.310795','2023-08-21 18:45:27.310795',NULL,NULL),(47,'GxMkNPx58jZksTTTiWt0fkdGQWQ6tn','2023-08-22 04:54:15.345711','read write',1,10,'2023-08-21 18:54:15.345711','2023-08-21 18:54:15.345711',NULL,NULL),(48,'EP1yZlZDRRaFB2YkydMtbKy1hVjGbr','2023-08-22 05:04:35.587203','read write',1,10,'2023-08-21 19:04:35.587203','2023-08-21 19:04:35.587203',NULL,NULL),(49,'BgQDwVVC4f67CY85tCXZPEV2finYlG','2023-08-22 13:42:11.999504','read write',1,1,'2023-08-22 03:42:11.999504','2023-08-22 03:42:11.999504',NULL,NULL),(50,'zWBiyJuJRH7B0KRSWPzwv8h5kpN4Tt','2023-08-22 13:45:41.590319','read write',1,10,'2023-08-22 03:45:41.590319','2023-08-22 03:45:41.590319',NULL,NULL),(51,'JujdAypsLDQRLX5e1WAJhoptSGuuX1','2023-08-22 13:50:26.897570','read write',1,1,'2023-08-22 03:50:26.897570','2023-08-22 03:50:26.897570',NULL,NULL),(52,'qqMjvKkPb1yyQvhCpzaNbj6ClhQE5G','2023-08-22 13:52:50.614475','read write',1,10,'2023-08-22 03:52:50.614475','2023-08-22 03:52:50.614475',NULL,NULL),(53,'cJTyOg9QqyGB9CbVjmpVvfiIihMAyA','2023-08-22 15:43:13.362809','read write',1,10,'2023-08-22 05:43:13.362809','2023-08-22 05:43:13.362809',NULL,NULL),(54,'yC34A4Q3gnvhleHk1Pk7aQpOaaf9X9','2023-08-23 00:22:20.458771','read write',1,10,'2023-08-22 14:22:20.458771','2023-08-22 14:22:20.458771',NULL,NULL),(55,'ioE8sdxGXCUBrGtcGN9GhItjx8Qs5p','2023-08-23 03:07:58.823413','read write',1,10,'2023-08-22 17:07:58.823413','2023-08-22 17:07:58.823413',NULL,NULL),(56,'G2VrMXH1pOKjJbtZj3q9R1KLYISlbH','2023-08-23 13:53:07.214591','read write',1,10,'2023-08-23 03:53:07.214591','2023-08-23 03:53:07.214591',NULL,NULL),(57,'04wKa06OVOTb456yVIcGsTmIK9NXQi','2023-08-23 22:26:08.551274','read write',1,10,'2023-08-23 12:26:08.551274','2023-08-23 12:26:08.551274',NULL,NULL),(58,'pHhGMFjROiRz91pTxPnmyG0JGIqtjP','2023-08-24 03:30:29.729040','read write',1,10,'2023-08-23 17:30:29.729040','2023-08-23 17:30:29.729040',NULL,NULL),(59,'iNgpVzZjloDqJTaTj3Gbocg0wTzNye','2023-08-24 03:38:25.124483','read write',1,10,'2023-08-23 17:38:25.124483','2023-08-23 17:38:25.124483',NULL,NULL),(60,'k1Hbf2NVcpg3p0YxLpyDwtb3vfr0oz','2023-08-24 14:52:08.925528','read write',1,10,'2023-08-24 04:52:08.925528','2023-08-24 04:52:08.925528',NULL,NULL),(61,'06iQS70abYqDzJ00onMtYsB6YtGWm9','2023-08-24 16:34:03.217214','read write',1,10,'2023-08-24 06:34:03.217214','2023-08-24 06:34:03.217214',NULL,NULL),(62,'WQBl4joQgw4dvPk5R3gpEhmhSBJg6g','2023-08-25 02:21:21.876438','read write',1,17,'2023-08-24 16:21:21.877431','2023-08-24 16:21:21.877431',NULL,NULL),(63,'kcTQQ3ApefQc8NhYNdiOcgEh2mYhQt','2023-08-25 02:21:33.717443','read write',1,16,'2023-08-24 16:21:33.717443','2023-08-24 16:21:33.717443',NULL,NULL),(64,'fimOcygstdqmJEPcBeo1CnrO3qAmdJ','2023-08-25 02:31:03.320588','read write',1,10,'2023-08-24 16:31:03.320588','2023-08-24 16:31:03.320588',NULL,NULL),(65,'b3LlcS8PJTacCwko2dP0YjrInxhguo','2023-08-25 15:01:31.069143','read write',1,10,'2023-08-25 05:01:31.069143','2023-08-25 05:01:31.069143',NULL,NULL),(66,'Vp1R7mx8rVTaYC1LWMVTuUSPpwNsIJ','2023-08-25 15:03:32.660654','read write',1,10,'2023-08-25 05:03:32.660654','2023-08-25 05:03:32.660654',NULL,NULL),(67,'tXxKN9rQLUh13ZCxyaa6qLR7NhfEfG','2023-08-25 15:06:50.414859','read write',1,10,'2023-08-25 05:06:50.414859','2023-08-25 05:06:50.414859',NULL,NULL),(68,'5z4SqYW7boAOVzVCrJUriGFXSZZsjm','2023-08-25 15:27:28.483764','read write',1,10,'2023-08-25 05:27:28.483764','2023-08-25 05:27:28.483764',NULL,NULL),(69,'PsvmvtekVARiT19QYoRar7DeJCkj5m','2023-08-25 15:43:32.951778','read write',1,10,'2023-08-25 05:43:32.951778','2023-08-25 05:43:32.951778',NULL,NULL),(70,'OF4DMP3eW72cDDvYuwpGTxfU8cPvB8','2023-08-26 21:26:28.749029','read write',1,10,'2023-08-26 11:26:28.749029','2023-08-26 11:26:28.749029',NULL,NULL),(71,'GQcnmOaLr2u4JcDrBdQvD4W9UA3osy','2023-08-26 21:42:05.458150','read write',1,10,'2023-08-26 11:42:05.458150','2023-08-26 11:42:05.458150',NULL,NULL),(72,'uBELOEmmJWrvbIc9VNcUsuNU1R2Xrw','2023-08-26 22:30:08.529259','read write',1,10,'2023-08-26 12:30:08.529259','2023-08-26 12:30:08.529259',NULL,NULL),(73,'3i0CHpUGfJkTwCMZvn3FA4WawxCrmk','2023-08-28 00:42:29.825794','read write',1,10,'2023-08-27 14:42:29.826730','2023-08-27 14:42:29.826730',NULL,NULL),(74,'h1M6ixosRiYrUDjAF2WxKGIxOOwEi0','2023-08-28 00:43:42.822755','read write',1,10,'2023-08-27 14:43:42.822755','2023-08-27 14:43:42.822755',NULL,NULL),(75,'NNg4gal2KSmpnX15WBcnzztkZZ0wI7','2023-08-28 00:48:00.553329','read write',1,10,'2023-08-27 14:48:00.554326','2023-08-27 14:48:00.554326',NULL,NULL),(76,'T3HBXSNJTUCtpuApnnBizpvhvQdQGl','2023-08-28 15:43:34.838246','read write',1,10,'2023-08-28 05:43:34.838246','2023-08-28 05:43:34.838246',NULL,NULL),(77,'UgXGv3OHnYJB1Xofgkyao8gryxfip6','2023-08-29 00:04:19.822890','read write',1,10,'2023-08-28 14:04:19.822890','2023-08-28 14:04:19.822890',NULL,NULL),(78,'E48kWmrIIPwu9b9f6hGRsWyJnOU9RI','2023-08-29 00:14:21.091793','read write',1,10,'2023-08-28 14:14:21.091793','2023-08-28 14:14:21.091793',NULL,NULL),(79,'zMUJq1kEMca1aPmVvo3oroZBqTlIJU','2023-08-29 03:24:43.123244','read write',1,10,'2023-08-28 17:24:43.124241','2023-08-28 17:24:43.124241',NULL,NULL),(80,'SYNg9A4doWopqv7Y8alhXyIEklqn1U','2023-08-29 05:01:25.979943','read write',1,10,'2023-08-28 19:01:25.980943','2023-08-28 19:01:25.980943',NULL,NULL),(81,'oqjNXKnZiWlc5VtL7t9izkqpfq8LY3','2023-08-29 05:02:35.305248','read write',1,10,'2023-08-28 19:02:35.305248','2023-08-28 19:02:35.305248',NULL,NULL),(82,'GcOrrw2R91wzkhqoQf8lonND1Z9btk','2023-08-29 05:03:11.127499','read write',1,10,'2023-08-28 19:03:11.127499','2023-08-28 19:03:11.127499',NULL,NULL),(83,'bruzfTT7Z039oKnqoKN8MZWfqedLjM','2023-08-29 05:05:34.468644','read write',1,10,'2023-08-28 19:05:34.469645','2023-08-28 19:05:34.469645',NULL,NULL),(84,'r1e2APLo0vnhFcaXN1ab96tyyfCoxc','2023-08-29 05:06:03.136254','read write',1,10,'2023-08-28 19:06:03.136254','2023-08-28 19:06:03.136254',NULL,NULL),(85,'Tt7TO8DqjYs68w8WgiyFL0dXZnbFnX','2023-08-29 05:23:15.042067','read write',1,10,'2023-08-28 19:23:15.042067','2023-08-28 19:23:15.042067',NULL,NULL),(86,'sHEJ7s6PEd65DQZdY3APPtppMwJ5VL','2023-08-29 05:24:11.962649','read write',1,10,'2023-08-28 19:24:11.962649','2023-08-28 19:24:11.962649',NULL,NULL),(87,'UrbwOfoyhpTdGxcWv58rLtstsZJWWs','2023-08-29 05:29:23.526390','read write',1,10,'2023-08-28 19:29:23.527386','2023-08-28 19:29:23.527386',NULL,NULL),(88,'SnuPGVZErF8suoeRbQU9CCm0VhQnvc','2023-08-29 12:43:31.476061','read write',1,10,'2023-08-29 02:43:31.477057','2023-08-29 02:43:31.477057',NULL,NULL),(89,'UvaosNC8WQAz7BObktk9c5VeSrY2qN','2023-08-29 12:45:23.877440','read write',1,10,'2023-08-29 02:45:23.877440','2023-08-29 02:45:23.877440',NULL,NULL),(90,'fWmkI2qWBJcAolFpW4OL12rObGYdK6','2023-08-29 12:52:50.722234','read write',1,10,'2023-08-29 02:52:50.722234','2023-08-29 02:52:50.722234',NULL,NULL),(91,'IEjdlyf3wwp0afEjVtsiO6z3wUWJKR','2023-08-29 13:37:40.594885','read write',1,10,'2023-08-29 03:37:40.594885','2023-08-29 03:37:40.594885',NULL,NULL),(92,'RnnpEYxYrSQ3Fplb1lJjBngHPJzdju','2023-08-29 13:47:56.171489','read write',1,10,'2023-08-29 03:47:56.171489','2023-08-29 03:47:56.171489',NULL,NULL),(93,'twotS9XZPpors0PgpBh7cwVss4AhsL','2023-08-29 14:01:22.888698','read write',1,10,'2023-08-29 04:01:22.888698','2023-08-29 04:01:22.888698',NULL,NULL),(94,'xvW09aleFr5uCVkwtEhxApsUScE0LS','2023-08-29 14:06:38.859521','read write',1,10,'2023-08-29 04:06:38.859521','2023-08-29 04:06:38.859521',NULL,NULL),(95,'1Q4VeRTlKoroKjnJyvxP0rKwuEwkib','2023-08-29 14:08:53.375186','read write',1,1,'2023-08-29 04:08:53.375186','2023-08-29 04:08:53.375186',NULL,NULL),(96,'3apD3P4ckDzUhCZPmCjvX2WYlzyWBa','2023-08-29 14:46:58.236036','read write',1,1,'2023-08-29 04:46:58.237034','2023-08-29 04:46:58.237034',NULL,NULL),(97,'Uz0SRoLWUwznOHbtRITIzjdnwxVRML','2023-08-29 15:05:48.427788','read write',1,1,'2023-08-29 05:05:48.428781','2023-08-29 05:05:48.428781',NULL,NULL),(98,'ozbiohV6qtZ6hkMe4XkwEvK76DOvSG','2023-08-29 15:11:29.407351','read write',1,10,'2023-08-29 05:11:29.408348','2023-08-29 05:11:29.408348',NULL,NULL),(99,'2EIpoiwCWIzzwUEWxyuLTGxRlXNGia','2023-08-29 15:12:00.115053','read write',1,1,'2023-08-29 05:12:00.115053','2023-08-29 05:12:00.115053',NULL,NULL),(100,'MBu4u4YvZRpGIeD1KVcz9ZzaDdGvuU','2023-08-29 15:12:29.980119','read write',1,10,'2023-08-29 05:12:29.980119','2023-08-29 05:12:29.980119',NULL,NULL),(101,'h0KnfaxDHrZOeNvVfd03yC1DRYqDPr','2023-08-29 15:12:46.050355','read write',1,10,'2023-08-29 05:12:46.050355','2023-08-29 05:12:46.050355',NULL,NULL),(102,'OLASV4X3osAs8PuS5bw6Nbu4o2bWpz','2023-08-29 15:14:22.344360','read write',1,1,'2023-08-29 05:14:22.344360','2023-08-29 05:14:22.344360',NULL,NULL),(103,'SBUQS7W54mDjP9Tm3krsuR5UtkFI6H','2023-08-29 15:14:40.629347','read write',1,16,'2023-08-29 05:14:40.629347','2023-08-29 05:14:40.629347',NULL,NULL),(104,'BOBjYr5Pb5etdWbKNFuzi8zUIUg9Y6','2023-08-29 17:04:03.373875','read write',1,16,'2023-08-29 07:04:03.374877','2023-08-29 07:04:03.374877',NULL,NULL),(105,'P911Z5qdTBBiv0YwvzR2Gqq1n9V8qG','2023-08-29 20:51:11.712344','read write',1,16,'2023-08-29 10:51:11.712344','2023-08-29 10:51:11.712344',NULL,NULL),(106,'ynVGVpQ60KrTqLrwKL6pNgLBgHSUGA','2023-08-29 21:05:46.435142','read write',1,16,'2023-08-29 11:05:46.435142','2023-08-29 11:05:46.435142',NULL,NULL),(107,'5oCYdcmncDpe6Ch3Otoso5TUQlDlEv','2023-08-29 21:06:17.395920','read write',1,1,'2023-08-29 11:06:17.395920','2023-08-29 11:06:17.395920',NULL,NULL),(108,'tRU955qOCpDWV2Bv7N8FYOtdpv7OfJ','2023-08-29 21:13:17.501077','read write',1,18,'2023-08-29 11:13:17.502414','2023-08-29 11:13:17.502414',NULL,NULL),(109,'9qaOQA4x91mfd59GaXi18QP9HcTYUT','2023-08-30 00:49:09.534665','read write',1,10,'2023-08-29 14:49:09.534665','2023-08-29 14:49:09.534665',NULL,NULL),(110,'OgGTZW0xhBoY10LLZc0fjmW7j3Ni1M','2023-08-30 01:01:33.915336','read write',1,1,'2023-08-29 15:01:33.915336','2023-08-29 15:01:33.915336',NULL,NULL),(111,'jzB6BBwIgZ4bhQN54A0t7m68WQeuNY','2023-08-30 01:04:09.082839','read write',1,2,'2023-08-29 15:04:09.083832','2023-08-29 15:04:09.083832',NULL,NULL),(112,'zrppVN3qEnKHzPVknDVIWIBclnbxcF','2023-08-30 01:05:23.652354','read write',1,1,'2023-08-29 15:05:23.652354','2023-08-29 15:05:23.652354',NULL,NULL),(113,'mttQGvmfHUUPTeIdGXIhDW8hcjBgYQ','2023-08-30 03:17:14.080296','read write',1,1,'2023-08-29 17:17:14.080296','2023-08-29 17:17:14.080296',NULL,NULL),(114,'i770bxn9rheO23vhoCWrZSxsWAL1gz','2023-08-30 03:34:23.807484','read write',1,1,'2023-08-29 17:34:23.807484','2023-08-29 17:34:23.807484',NULL,NULL),(115,'jYDHK7NePueKxT7Ve5OHgUIY8nZkf3','2023-08-30 04:46:44.104342','read write',1,1,'2023-08-29 18:46:44.105342','2023-08-29 18:46:44.105342',NULL,NULL),(116,'L1cub1GTPGJL2ym94NSiQlrAB9ChCj','2023-08-30 14:51:19.780813','read write',1,1,'2023-08-30 04:51:19.781810','2023-08-30 04:51:19.781810',NULL,NULL),(117,'jv4UvfeLbnydyUbBqMvJGsiKoYSyK6','2023-08-30 23:24:32.950128','read write',1,1,'2023-08-30 13:24:32.950128','2023-08-30 13:24:32.950128',NULL,NULL),(118,'G7SDdwP4n7AxcWkGgZgNLnImKfkOVy','2023-08-31 00:54:14.056896','read write',1,1,'2023-08-30 14:54:14.056896','2023-08-30 14:54:14.056896',NULL,NULL),(119,'46ToCqLEzCYmqy9TmdfSsClLOyLDJz','2023-08-31 03:07:16.718146','read write',1,1,'2023-08-30 17:07:16.719391','2023-08-30 17:07:16.719391',NULL,NULL),(120,'SxO1joMV8tmZDawW5MZLnX4qFvQaMg','2023-08-31 05:13:58.500899','read write',1,2,'2023-08-30 19:13:58.501900','2023-08-30 19:13:58.501900',NULL,NULL),(121,'U2tFGIK6o6f6zahafHcAwnXLHIjbQg','2023-08-31 05:14:30.694099','read write',1,1,'2023-08-30 19:14:30.694099','2023-08-30 19:14:30.694099',NULL,NULL),(122,'XMmYrSastcrVeXg4XIrp22ViJ0jlMj','2023-08-31 15:05:50.005730','read write',1,1,'2023-08-31 05:05:50.005730','2023-08-31 05:05:50.005730',NULL,NULL),(123,'1qE7N59BEgdEMgZQbIVLgda2gEdsrL','2023-08-31 22:04:02.202851','read write',1,1,'2023-08-31 12:04:02.203848','2023-08-31 12:04:02.203848',NULL,NULL),(124,'F6kvPIToZpNg94kLhgrYCuUk6tqOV2','2023-09-01 00:28:40.576588','read write',1,1,'2023-08-31 14:28:40.577581','2023-08-31 14:28:40.577581',NULL,NULL),(125,'DSK0F6Dsj98NADkED4S39nO0B9fyQh','2023-09-01 00:31:25.393588','read write',1,2,'2023-08-31 14:31:25.393588','2023-08-31 14:31:25.393588',NULL,NULL),(126,'pgezVyMRIDuiMdlvYeYmlSem9EKLtO','2023-09-01 00:31:43.616857','read write',1,1,'2023-08-31 14:31:43.617853','2023-08-31 14:31:43.617853',NULL,NULL),(127,'hYqAeDVakWcyp7qsFITxLKWQtmkgel','2023-09-01 00:38:35.177635','read write',1,1,'2023-08-31 14:38:35.178627','2023-08-31 14:38:35.178627',NULL,NULL),(128,'xcudpZv8npuOwrcWevt73h3wxYuWUM','2023-09-01 00:46:05.166261','read write',1,1,'2023-08-31 14:46:05.167264','2023-08-31 14:46:05.167264',NULL,NULL),(129,'IJhQ7fAIIWKXwQeZWU1lZDE1Ge6IIc','2023-09-01 04:58:25.149813','read write',1,1,'2023-08-31 18:58:25.149813','2023-08-31 18:58:25.149813',NULL,NULL),(130,'0Uk7agPJVAqde2jebsKqhCEfV9xwd8','2023-09-01 16:33:37.713059','read write',1,1,'2023-09-01 06:33:37.714118','2023-09-01 06:33:37.714118',NULL,NULL),(131,'sLNY3vKCfJxeGelAUaPPfzuqglnH4t','2023-09-01 17:00:32.994368','read write',1,1,'2023-09-01 07:00:32.994368','2023-09-01 07:00:32.994368',NULL,NULL),(132,'cgYq2ggDUeChJF0bmG4Fcdi4iyFMms','2023-09-02 17:51:35.724281','read write',1,1,'2023-09-02 07:51:35.724281','2023-09-02 07:51:35.724281',NULL,NULL),(133,'ddQLIk53YAa7KU1dbIGsZ6jibDWucZ','2023-09-02 22:55:49.472013','read write',1,1,'2023-09-02 12:55:49.473007','2023-09-02 12:55:49.473007',NULL,NULL),(134,'efUmAonmuxPOXtksBAjc2cKkxG363Y','2023-09-02 22:56:50.542403','read write',1,10,'2023-09-02 12:56:50.543398','2023-09-02 12:56:50.543398',NULL,NULL),(135,'QuEcTz6rOocUDSk2F19R9LbZT04vEk','2023-09-02 23:17:54.498313','read write',1,16,'2023-09-02 13:17:54.498313','2023-09-02 13:17:54.498313',NULL,NULL),(136,'scGfudezQy5ZglgIqwnPU7N5DzVMpd','2023-09-02 23:19:14.981723','read write',1,1,'2023-09-02 13:19:14.982719','2023-09-02 13:19:14.982719',NULL,NULL),(137,'EJIKz3glgEU4uyHuWQFBtZ72U4cFBp','2023-09-02 23:19:48.090851','read write',1,1,'2023-09-02 13:19:48.091849','2023-09-02 13:19:48.091849',NULL,NULL),(138,'qscihgB8rwQDUs4ZUcokpHu0dcHr3U','2023-09-02 23:20:01.863604','read write',1,16,'2023-09-02 13:20:01.863604','2023-09-02 13:20:01.863604',NULL,NULL),(139,'EEKEwJ0R9e5FrSRvtvBdeMgCFDuJx3','2023-09-02 23:26:19.995093','read write',1,16,'2023-09-02 13:26:19.996087','2023-09-02 13:26:19.996087',NULL,NULL),(140,'FVzETNJ60ajZjBuumROE5KZgfmLqw4','2023-09-02 23:29:21.012980','read write',1,16,'2023-09-02 13:29:21.012980','2023-09-02 13:29:21.012980',NULL,NULL),(141,'vFYZZ5kbUA8KujUXcm0EMpG8enGydP','2023-09-02 23:30:36.902264','read write',1,16,'2023-09-02 13:30:36.902264','2023-09-02 13:30:36.902264',NULL,NULL),(142,'n0i2KCjkAhkXmSm1qZ4X3g5XWCmBQl','2023-09-02 23:33:16.721596','read write',1,1,'2023-09-02 13:33:16.721596','2023-09-02 13:33:16.721596',NULL,NULL),(143,'yBeNfa3QTocyPOxor2Glyc0ORr7elA','2023-09-02 23:38:23.010387','read write',1,1,'2023-09-02 13:38:23.010387','2023-09-02 13:38:23.010387',NULL,NULL),(144,'C8WPrv2eOCFqylJJBTmBVP8nBsWjz6','2023-09-02 23:38:31.244712','read write',1,1,'2023-09-02 13:38:31.244712','2023-09-02 13:38:31.244712',NULL,NULL),(145,'oFmkedCB0iWA2KnLNOwLVvXvxTqZkM','2023-09-02 23:39:22.194667','read write',1,1,'2023-09-02 13:39:22.194667','2023-09-02 13:39:22.194667',NULL,NULL),(146,'9CM2KbkrVXOkMjcqdbMMiYOwSCoUct','2023-09-02 23:40:03.713747','read write',1,1,'2023-09-02 13:40:03.713747','2023-09-02 13:40:03.713747',NULL,NULL),(147,'rbNe8tpWCNqLKxMGhdFnbf5uio516J','2023-09-02 23:40:32.322112','read write',1,1,'2023-09-02 13:40:32.322112','2023-09-02 13:40:32.322112',NULL,NULL),(148,'wnzxLosCYW8jlwXl1kdtKeG2i03tOM','2023-09-02 23:41:08.751357','read write',1,16,'2023-09-02 13:41:08.751357','2023-09-02 13:41:08.752353',NULL,NULL),(149,'TFHPrKKDLonOkCWO0YddR1N4oNCGmM','2023-09-02 23:42:50.809924','read write',1,1,'2023-09-02 13:42:50.810924','2023-09-02 13:42:50.810924',NULL,NULL),(150,'EzgKF1c95x2EyqTTDL7w7fTgLFPAnW','2023-09-02 23:43:05.277267','read write',1,1,'2023-09-02 13:43:05.277267','2023-09-02 13:43:05.277267',NULL,NULL),(151,'6VQYtXhFaaTVnIOYPBQy41HOttXRUl','2023-09-02 23:44:41.652354','read write',1,19,'2023-09-02 13:44:41.652354','2023-09-02 13:44:41.652354',NULL,NULL),(152,'OfI1IzG5pWNwedPpe2bcGgzd5OySNm','2023-09-02 23:45:39.917129','read write',1,16,'2023-09-02 13:45:39.917129','2023-09-02 13:45:39.917129',NULL,NULL),(153,'lLDr7HKl7kVRY3flLRgKhOwQo1pHvs','2023-09-03 00:06:23.422261','read write',1,16,'2023-09-02 14:06:23.422261','2023-09-02 14:06:23.422261',NULL,NULL),(154,'OpXSL3G4J5saSX31d1yyzcskndnA6L','2023-09-03 00:10:37.616229','read write',1,16,'2023-09-02 14:10:37.616229','2023-09-02 14:10:37.616229',NULL,NULL),(155,'1bLTouWaQxFEF9qqboqp1sqcxd04GL','2023-09-03 00:14:11.640987','read write',1,16,'2023-09-02 14:14:11.640987','2023-09-02 14:14:11.640987',NULL,NULL),(156,'xYyyMUTVGTNMIa4jizTawkuuxmimuM','2023-09-03 00:24:39.722433','read write',1,16,'2023-09-02 14:24:39.722433','2023-09-02 14:24:39.722433',NULL,NULL),(157,'udiwvYxKqxm321h9WwuSnBHHTHnSRu','2023-09-03 00:27:20.445228','read write',1,16,'2023-09-02 14:27:20.445745','2023-09-02 14:27:20.445745',NULL,NULL),(158,'8cXt0yuq3Q7bdEcF7tBKKbJey1YjOC','2023-09-03 00:28:26.331723','read write',1,16,'2023-09-02 14:28:26.331723','2023-09-02 14:28:26.331723',NULL,NULL),(159,'6VS5kOPNdi2bBVOCwYq8V8s6iJV94e','2023-09-03 00:42:42.463645','read write',1,16,'2023-09-02 14:42:42.463645','2023-09-02 14:42:42.463645',NULL,NULL),(160,'lhtvgupVPl8Z0HjcYChoXa5KMG2yup','2023-09-03 00:45:27.542112','read write',1,16,'2023-09-02 14:45:27.542112','2023-09-02 14:45:27.542112',NULL,NULL),(161,'mEAHGHT602XkwPyEnnh49B2GMTYUAB','2023-09-03 00:46:05.646400','read write',1,16,'2023-09-02 14:46:05.646400','2023-09-02 14:46:05.646400',NULL,NULL),(162,'SBt9dWTSRIkn7SEg1N6M8goVTFnDSD','2023-09-03 00:47:18.064637','read write',1,16,'2023-09-02 14:47:18.064637','2023-09-02 14:47:18.064637',NULL,NULL),(163,'hZ7mbc828TcKj3ttEcy5MLJ8eirikT','2023-09-03 00:49:31.061078','read write',1,16,'2023-09-02 14:49:31.062075','2023-09-02 14:49:31.062075',NULL,NULL),(164,'WjgNXnN8sA5juf5GAm3IbKWdDaO9Qk','2023-09-03 00:56:27.074534','read write',1,16,'2023-09-02 14:56:27.074534','2023-09-02 14:56:27.074534',NULL,NULL),(165,'OYAczMtuhK8I6Bb6BcNZTVSXZtQcV4','2023-09-03 00:58:08.012022','read write',1,16,'2023-09-02 14:58:08.012022','2023-09-02 14:58:08.012022',NULL,NULL),(166,'4d1vLU0awAKmw1rPgYapvHGqAmQOPf','2023-09-03 01:00:08.144749','read write',1,16,'2023-09-02 15:00:08.144749','2023-09-02 15:00:08.144749',NULL,NULL),(167,'LZvaeOXJuBFaBHMPnJ823ybUlqCmUD','2023-09-03 01:03:35.040683','read write',1,16,'2023-09-02 15:03:35.040683','2023-09-02 15:03:35.040683',NULL,NULL),(168,'canZTHAejmM35pvbO3QjZiWDewqVWe','2023-09-03 01:16:45.496855','read write',1,16,'2023-09-02 15:16:45.497364','2023-09-02 15:16:45.497364',NULL,NULL),(169,'YuFArWFt9O83zaEpptyujcrj6isrGy','2023-09-03 02:48:43.228273','read write',1,18,'2023-09-02 16:48:43.228273','2023-09-02 16:48:43.228273',NULL,NULL),(170,'eNqKvTFgWfnXeJhHg46nKByL2odJ1f','2023-09-03 03:20:15.400785','read write',1,1,'2023-09-02 17:20:15.400785','2023-09-02 17:20:15.400785',NULL,NULL),(171,'h58GadGWD5ROXIGnIKNvNwjYt9wakF','2023-09-03 03:39:41.469913','read write',1,16,'2023-09-02 17:39:41.470911','2023-09-02 17:39:41.470911',NULL,NULL),(172,'5BXL8JBArZOZqyeo48mQDrhVfAl6zI','2023-09-03 03:40:19.657071','read write',1,18,'2023-09-02 17:40:19.657071','2023-09-02 17:40:19.657071',NULL,NULL),(173,'Sm9C5bAOokPwEfSiRLybQCPvqnvzmK','2023-09-03 03:41:32.864883','read write',1,19,'2023-09-02 17:41:32.865906','2023-09-02 17:41:32.865906',NULL,NULL),(174,'5231jLENGenCNDMZpTDNr2zkNPVNtt','2023-09-03 03:42:40.793671','read write',1,1,'2023-09-02 17:42:40.794666','2023-09-02 17:42:40.794666',NULL,NULL),(175,'xiO8j8JdN5HOgwW8zVyzztWD5e32Xb','2023-09-03 03:43:09.162663','read write',1,19,'2023-09-02 17:43:09.162663','2023-09-02 17:43:09.162663',NULL,NULL),(176,'H6WN6YJ4NGi04yjyCRTW5dViiHjLPc','2023-09-03 03:43:51.727120','read write',1,19,'2023-09-02 17:43:51.727120','2023-09-02 17:43:51.727120',NULL,NULL),(177,'HkBfaWdr82Gq2CORwXNOQmCXqBoLs5','2023-09-03 03:44:07.475518','read write',1,18,'2023-09-02 17:44:07.475518','2023-09-02 17:44:07.475518',NULL,NULL),(178,'QCMegB39LzwbSArleoRtMyOkszC66C','2023-09-03 03:44:50.736759','read write',1,18,'2023-09-02 17:44:50.736759','2023-09-02 17:44:50.736759',NULL,NULL),(179,'U5XXLJqHlquMY2L6gsnahvUV7xekKq','2023-09-03 03:51:28.609543','read write',1,1,'2023-09-02 17:51:28.610540','2023-09-02 17:51:28.610540',NULL,NULL),(180,'z4jkBdQYMLA68f15nuns19qZ7jwUNp','2023-09-03 03:52:17.078463','read write',1,18,'2023-09-02 17:52:17.078463','2023-09-02 17:52:17.078463',NULL,NULL),(181,'ZBLnsccofo0r1pUKrYkOS0NY9uhn3y','2023-09-03 03:54:48.127985','read write',1,18,'2023-09-02 17:54:48.127985','2023-09-02 17:54:48.127985',NULL,NULL),(182,'CSTPVhQRlOQRKfuGwK3lYXG81dPlaN','2023-09-03 03:55:23.816505','read write',1,18,'2023-09-02 17:55:23.816505','2023-09-02 17:55:23.816505',NULL,NULL),(183,'HVB4c2FJgTMTTjNoF2PIiBkmPeEU5b','2023-09-03 03:57:10.503915','read write',1,19,'2023-09-02 17:57:10.503915','2023-09-02 17:57:10.503915',NULL,NULL),(184,'qdC0Xu3VpHm9YOWxlH8vx636leODR2','2023-09-03 03:57:21.063691','read write',1,18,'2023-09-02 17:57:21.064684','2023-09-02 17:57:21.064684',NULL,NULL),(185,'WMVipQmpZJTiDBmaPgQrtD8gbg1Nhp','2023-09-03 03:58:03.706724','read write',1,18,'2023-09-02 17:58:03.706724','2023-09-02 17:58:03.706724',NULL,NULL),(186,'PJ5itKny7OVO6NWKNCyj6CUWhQPjyX','2023-09-03 04:03:15.002474','read write',1,18,'2023-09-02 18:03:15.002474','2023-09-02 18:03:15.002474',NULL,NULL),(187,'17DNeTCnT7WfRgm2bzGZsX3fMjLrQi','2023-09-03 04:07:01.501782','read write',1,18,'2023-09-02 18:07:01.502287','2023-09-02 18:07:01.502287',NULL,NULL),(188,'yL3bmbHuMYV7XY8NzXgpeps5w6SGJx','2023-09-03 04:07:51.119293','read write',1,18,'2023-09-02 18:07:51.119293','2023-09-02 18:07:51.119293',NULL,NULL),(189,'M8aVeyOMRUIA2UnZcVjKCNwmCexZaa','2023-09-03 04:25:01.819613','read write',1,10,'2023-09-02 18:25:01.820609','2023-09-02 18:25:01.820609',NULL,NULL),(190,'pmixK86Tp2lAOTj0jSHgqQtMkLbWn4','2023-09-03 04:58:34.664661','read write',1,10,'2023-09-02 18:58:34.664661','2023-09-02 18:58:34.664661',NULL,NULL),(191,'v19VSDxSkJbkRQA9TYVWaeDsV8Lg8P','2023-09-03 05:07:50.228356','read write',1,1,'2023-09-02 19:07:50.228356','2023-09-02 19:07:50.228356',NULL,NULL),(192,'oyt9HUxE6W1JJSjA840EpLIsovBoH8','2023-09-03 05:13:10.304769','read write',1,10,'2023-09-02 19:13:10.304769','2023-09-02 19:13:10.304769',NULL,NULL),(193,'U6ruqtO7dzg5siHIgPOv9l5Rn93Zjy','2023-09-04 17:35:19.138079','read write',1,1,'2023-09-04 07:35:19.138079','2023-09-04 07:35:19.138079',NULL,NULL),(194,'4ibB1b3MYfBLXvx1sBNrfrkfR4mHRT','2023-09-04 21:41:20.760309','read write',1,1,'2023-09-04 11:41:20.760309','2023-09-04 11:41:20.760309',NULL,NULL),(195,'vLbE5Qf1yKDpBaP3nj1MDuyER5OrJK','2023-09-05 01:49:44.746069','read write',1,1,'2023-09-04 15:49:44.746069','2023-09-04 15:49:44.746069',NULL,NULL),(196,'mjIB1YaldzBSPxzCfEa2sLHNrRx8sX','2023-09-05 03:27:20.930404','read write',1,10,'2023-09-04 17:27:20.930404','2023-09-04 17:27:20.930404',NULL,NULL),(197,'hxLFujeW6X8KaJcrgSXbaUn9lQZxrW','2023-09-05 03:27:37.426388','read write',1,18,'2023-09-04 17:27:37.426388','2023-09-04 17:27:37.426388',NULL,NULL),(198,'Jw9MLijLTwHvFc2cLm4os2LsuDN39Q','2023-09-05 03:27:53.718822','read write',1,7,'2023-09-04 17:27:53.718822','2023-09-04 17:27:53.718822',NULL,NULL),(199,'PM4LxpJCnvc5U9b8ndF7b89a84iixW','2023-09-05 03:28:24.588242','read write',1,2,'2023-09-04 17:28:24.588242','2023-09-04 17:28:24.588242',NULL,NULL),(200,'DqKbfjzkh90I8x7qeweGo6cMvtNJb5','2023-09-05 03:30:31.290674','read write',1,1,'2023-09-04 17:30:31.290674','2023-09-04 17:30:31.290674',NULL,NULL),(201,'Cb6fKjBLMJGwPm233iT19t6MKUHwC6','2023-09-05 03:30:48.088132','read write',1,2,'2023-09-04 17:30:48.088132','2023-09-04 17:30:48.088132',NULL,NULL),(202,'6wum2zs0LyuryS7y1bZr74hYGkkqDt','2023-09-05 03:33:47.335605','read write',1,1,'2023-09-04 17:33:47.335605','2023-09-04 17:33:47.335605',NULL,NULL),(203,'luknQwVyk4UKDdeEoEFoMsqIKT9tEz','2023-09-05 03:35:27.106369','read write',1,10,'2023-09-04 17:35:27.106369','2023-09-04 17:35:27.106369',NULL,NULL),(204,'wHhXpNpbSEawlZiN5hsJbl8n6fQiS6','2023-09-05 03:36:32.182324','read write',1,10,'2023-09-04 17:36:32.182324','2023-09-04 17:36:32.182324',NULL,NULL),(205,'nXDwPzOSr9ryPbUm12Dld3XDPkl5zC','2023-09-05 03:58:30.771418','read write',1,18,'2023-09-04 17:58:30.772415','2023-09-04 17:58:30.772415',NULL,NULL),(206,'PQhrUmUacQ2IQfT488IuLgIUZtV8qD','2023-09-05 03:59:07.298519','read write',1,1,'2023-09-04 17:59:07.298519','2023-09-04 17:59:07.298519',NULL,NULL),(207,'ffI4RQh0BPcnVCijpMFXsb7bm3obxf','2023-09-05 04:00:16.305202','read write',1,10,'2023-09-04 18:00:16.305202','2023-09-04 18:00:16.305202',NULL,NULL),(208,'N4N5Iobru04s7OFoXk6AtoANAb2Ixq','2023-09-05 04:24:29.967624','read write',1,1,'2023-09-04 18:24:29.967624','2023-09-04 18:24:29.967624',NULL,NULL),(209,'JOJSHp8RPVk6TXvfnfHYzSVMYRfyEH','2023-09-05 04:34:59.216675','read write',1,2,'2023-09-04 18:34:59.217676','2023-09-04 18:34:59.217676',NULL,NULL),(210,'d7JUYr6AahPSlkIy8qiUdvfdtK4Lj3','2023-09-05 04:35:22.020647','read write',1,1,'2023-09-04 18:35:22.020647','2023-09-04 18:35:22.020647',NULL,NULL),(211,'ztZdmqgItUmpMyFh0pmMIZ4Iu5wtMa','2023-09-05 04:35:46.056589','read write',1,2,'2023-09-04 18:35:46.056589','2023-09-04 18:35:46.056589',NULL,NULL),(212,'jmEoNbpiJD8DFlHwTHfGX3vM85VTnM','2023-09-05 04:38:14.275854','read write',1,1,'2023-09-04 18:38:14.275854','2023-09-04 18:38:14.275854',NULL,NULL),(213,'q6PEb1jgGffsbzPedT2n2Joe8ZQR5C','2023-09-05 04:41:17.445936','read write',1,2,'2023-09-04 18:41:17.445936','2023-09-04 18:41:17.445936',NULL,NULL),(214,'dIzoykvV5yP1fCiy14WI9qqk5nqZxs','2023-09-05 04:46:26.850496','read write',1,18,'2023-09-04 18:46:26.850496','2023-09-04 18:46:26.850496',NULL,NULL),(215,'XKnAOIpddTs9i8VzSKbXCzfIeOUdjJ','2023-09-05 04:46:50.405233','read write',1,1,'2023-09-04 18:46:50.405233','2023-09-04 18:46:50.405233',NULL,NULL),(216,'lsiVoqBruQ7qCJGiKScMZcFIzFVAwL','2023-09-05 15:23:39.692612','read write',1,1,'2023-09-05 05:23:39.692612','2023-09-05 05:23:39.692612',NULL,NULL),(217,'B3X6zUptRL7sdpgG67o2TR2CChANvl','2023-09-05 21:50:08.250169','read write',1,1,'2023-09-05 11:50:08.250169','2023-09-05 11:50:08.250169',NULL,NULL),(218,'7nfLJIqtCAMesiYw7p2gt2sx20dWbC','2023-09-06 03:08:22.415419','read write',1,1,'2023-09-05 17:08:22.415419','2023-09-05 17:08:22.415419',NULL,NULL),(219,'MkBkn5ePq1EONGaMGf0tMT9z4Gw0ro','2023-09-06 03:45:09.818269','read write',1,1,'2023-09-05 17:45:09.818269','2023-09-05 17:45:09.818269',NULL,NULL),(220,'bYRNRNZDbefixuqGxz0WRJCZhOekq8','2023-09-06 03:47:02.825788','read write',1,1,'2023-09-05 17:47:02.825788','2023-09-05 17:47:02.825788',NULL,NULL),(221,'QH78HwKyfWgEcUWPUCWMb7n78AxPXO','2023-09-06 03:48:10.296893','read write',1,1,'2023-09-05 17:48:10.296893','2023-09-05 17:48:10.296893',NULL,NULL),(222,'Loo6oFUpauA6fR1nTbrKxiA9CgvZQo','2023-09-06 15:38:30.966149','read write',1,1,'2023-09-06 05:38:30.966149','2023-09-06 05:38:30.966149',NULL,NULL),(223,'CP9oY8AhBeEf1v7GXp89ZPW59SWLXE','2023-09-07 01:45:27.307803','read write',1,1,'2023-09-06 15:45:27.307803','2023-09-06 15:45:27.307803',NULL,NULL),(224,'eB894Zp86Ny2upXp4ztfpRrX1aGHvR','2023-09-07 04:47:38.268131','read write',1,1,'2023-09-06 18:47:38.268131','2023-09-06 18:47:38.268131',NULL,NULL),(225,'17bJVFWEaquRvATF90Qh7geJ2vXI3C','2023-09-07 12:17:18.608565','read write',1,1,'2023-09-07 02:17:18.608565','2023-09-07 02:17:18.608565',NULL,NULL),(226,'d2RMmsx3m2dqi20LQ6DiB3r7knEVLa','2023-09-07 17:26:38.223913','read write',1,10,'2023-09-07 07:26:38.224906','2023-09-07 07:26:38.224906',NULL,NULL),(227,'x0PtmppxPBcDhKQhCyjFwIwsP2OS33','2023-09-07 18:57:15.525468','read write',1,1,'2023-09-07 08:57:15.525468','2023-09-07 08:57:15.525468',NULL,NULL),(228,'aFi0UILg088OTufj5W7kwTvek38EkE','2023-09-08 01:18:19.680233','read write',1,1,'2023-09-07 15:18:19.680233','2023-09-07 15:18:19.680233',NULL,NULL),(229,'dAusMNIktglm6ziuKkJm58u8ORIfcH','2023-09-08 14:46:08.574034','read write',1,1,'2023-09-08 04:46:08.575030','2023-09-08 04:46:08.575030',NULL,NULL),(230,'4cXJQlyD8vpblCpnJ0EoYF0p8DA59T','2023-09-08 14:47:08.188175','read write',1,10,'2023-09-08 04:47:08.188175','2023-09-08 04:47:08.188175',NULL,NULL),(231,'oGz4qYGAz0SmVWoCnCEacXIUpE0kx9','2023-09-08 14:47:36.787286','read write',1,2,'2023-09-08 04:47:36.788290','2023-09-08 04:47:36.788290',NULL,NULL),(232,'MxC1F99WbEa1pwTaPuOMfiEIyueKhk','2023-09-08 14:47:54.537168','read write',1,7,'2023-09-08 04:47:54.538164','2023-09-08 04:47:54.538164',NULL,NULL),(233,'Y1aiFz6oJ0zZ9MIDPy9WLGD1efiHnR','2023-09-08 14:48:43.466852','read write',1,10,'2023-09-08 04:48:43.466852','2023-09-08 04:48:43.466852',NULL,NULL),(234,'eeRkOH6LIKLEVthf7gXdvUzKgrSyUs','2023-09-08 20:59:36.604855','read write',1,1,'2023-09-08 10:59:36.605852','2023-09-08 10:59:36.605852',NULL,NULL),(235,'W85Wl8l6lRfTY9htktKwU9wNvBcYWT','2023-09-08 22:27:52.222175','read write',1,1,'2023-09-08 12:27:52.222175','2023-09-08 12:27:52.222175',NULL,NULL),(236,'TQ2YbFKWaD6svRTRvfMGqbfpjsRHFw','2023-09-09 04:20:36.119220','read write',1,10,'2023-09-08 18:20:36.119220','2023-09-08 18:20:36.119220',NULL,NULL),(237,'dGJmCQ3yKraRuE8Vnort04Cm5XdsfL','2023-09-09 04:32:35.765740','read write',1,1,'2023-09-08 18:32:35.765740','2023-09-08 18:32:35.765740',NULL,NULL),(238,'SjlfNCsWE3dKfVyjNB24iwmKUE3u7j','2023-09-09 04:36:52.822418','read write',1,10,'2023-09-08 18:36:52.823415','2023-09-08 18:36:52.823415',NULL,NULL),(239,'G9nFJJv0JsOA12rYpHITVnFaH7jRxC','2023-09-09 04:58:18.979337','read write',1,10,'2023-09-08 18:58:18.979337','2023-09-08 18:58:18.979337',NULL,NULL),(240,'ZSnprTuFMz74KdjtlngcLUqNc8v6AK','2023-09-09 04:59:03.470932','read write',1,10,'2023-09-08 18:59:03.470932','2023-09-08 18:59:03.470932',NULL,NULL),(241,'EUCjP3YMDROSA4lSICY1JM7n3DOiQ1','2023-09-09 04:59:12.547964','read write',1,1,'2023-09-08 18:59:12.547964','2023-09-08 18:59:12.547964',NULL,NULL),(242,'n2JNuqowM0SP2wAweIIL46hZNG1dw0','2023-09-09 04:59:20.485300','read write',1,10,'2023-09-08 18:59:20.485300','2023-09-08 18:59:20.485300',NULL,NULL),(243,'A6LyF1oxb3WIiKejB22jX8H5mA3qvg','2023-09-09 04:59:37.651415','read write',1,10,'2023-09-08 18:59:37.652413','2023-09-08 18:59:37.652413',NULL,NULL),(244,'io8sFhKbKuyuR8F8V6WUYTm8Uqeum5','2023-09-09 05:06:48.380247','read write',1,10,'2023-09-08 19:06:48.380247','2023-09-08 19:06:48.380247',NULL,NULL),(245,'xF7G8Fi7FCtgyn9SBFTEGNwTQ2yiin','2023-09-11 03:17:23.315794','read write',1,1,'2023-09-10 17:17:23.317377','2023-09-10 17:17:23.317377',NULL,NULL),(246,'KnZJseGcoGBiyWBdd4u1pk9Tj55eD3','2023-09-11 03:20:01.983627','read write',1,10,'2023-09-10 17:20:01.983627','2023-09-10 17:20:01.983627',NULL,NULL),(247,'pgRa2v4QlEkx6PsABJ4sB1czB5BItX','2023-09-11 03:40:13.095165','read write',1,1,'2023-09-10 17:40:13.095165','2023-09-10 17:40:13.095165',NULL,NULL),(248,'GOTM6mpimNj8OJp5n8sWeljphAhMwJ','2023-09-11 15:42:55.571095','read write',1,1,'2023-09-11 05:42:55.572089','2023-09-11 05:42:55.572089',NULL,NULL),(249,'qVfQU1CbOhX0ymA1JUTTDo2A9Si0kC','2023-09-12 15:07:09.606575','read write',1,1,'2023-09-12 05:07:09.606575','2023-09-12 05:07:09.606575',NULL,NULL),(250,'vZJi3ODMEyE8eAFpNkFsjyl6mwjUyX','2023-09-12 15:55:36.265224','read write',1,10,'2023-09-12 05:55:36.265224','2023-09-12 05:55:36.265224',NULL,NULL),(251,'j0kzvs1zdMdw1D7rEZRMqvl7cgTuDE','2023-09-13 02:18:45.740234','read write',1,10,'2023-09-12 16:18:45.740234','2023-09-12 16:18:45.740234',NULL,NULL),(252,'MVOeZbafEAXQADgK9tqpYP1VWK3KCr','2023-09-13 02:36:13.890922','read write',1,1,'2023-09-12 16:36:13.890922','2023-09-12 16:36:13.890922',NULL,NULL),(253,'cfVldz2WaTs9lBR15ZT4K6FVdKzQIC','2023-09-13 15:19:24.228810','read write',1,10,'2023-09-13 05:19:24.228810','2023-09-13 05:19:24.228810',NULL,NULL),(254,'FCtXrxATtQUXyCGnXS2y7VWt2zmsPB','2023-09-14 00:14:10.064231','read write',1,10,'2023-09-13 14:14:10.064231','2023-09-13 14:14:10.064231',NULL,NULL),(255,'KAnJB2wJnmgRuQg4EBGWsZIzLV2RfJ','2023-09-14 04:53:41.103934','read write',1,1,'2023-09-13 18:53:41.104927','2023-09-13 18:53:41.104927',NULL,NULL),(256,'wbFGX6ar8XiHMQJRkDQdpUtmXfmxtY','2023-09-15 15:18:44.499882','read write',1,1,'2023-09-15 05:18:44.499882','2023-09-15 05:18:44.499882',NULL,NULL),(257,'E1vHGFDZQDOQJWDmukyRdgJE6mdMK9','2023-09-16 00:25:31.666118','read write',1,1,'2023-09-15 14:25:31.666118','2023-09-15 14:25:31.666118',NULL,NULL),(258,'KTSa1bJwBk1B3MDEe60M0DxEgORJo5','2023-09-16 00:48:58.903629','read write',1,1,'2023-09-15 14:48:58.904626','2023-09-15 14:48:58.904626',NULL,NULL),(259,'PuF7yx0TvmhtksuhHSTYeeP6iSM3Uf','2023-09-17 02:42:00.125316','read write',1,10,'2023-09-16 16:42:00.126312','2023-09-16 16:42:00.126312',NULL,NULL),(260,'APvK698hrSK5pGDL9Afx3kjLppuO6g','2023-09-17 18:30:18.552885','read write',1,1,'2023-09-17 08:30:18.553395','2023-09-17 08:30:18.553395',NULL,NULL),(261,'m8QRJQXMHP1ePWDo8PgZIsEjhmTJ65','2023-09-17 23:19:38.786404','read write',1,10,'2023-09-17 13:19:38.786404','2023-09-17 13:19:38.786404',NULL,NULL),(262,'qe2kZX1LCNtjYIX3ek1U92lwj2AGW3','2023-09-17 23:20:41.190671','read write',1,1,'2023-09-17 13:20:41.191672','2023-09-17 13:20:41.191672',NULL,NULL),(263,'xwDPJOYs6ePf6LVLEvAGZ5Y6oGwbuh','2023-09-17 23:21:22.967629','read write',1,10,'2023-09-17 13:21:22.967629','2023-09-17 13:21:22.967629',NULL,NULL),(264,'V6NwQIWqMNHB6o3wwS4JemI9ZhbAGq','2023-09-17 23:52:18.803204','read write',1,10,'2023-09-17 13:52:18.804204','2023-09-17 13:52:18.804204',NULL,NULL),(265,'4MFsRqPFQxIcJyeShADUAPwffnZ8qI','2023-09-18 03:50:30.410414','read write',1,10,'2023-09-17 17:50:30.410414','2023-09-17 17:50:30.410414',NULL,NULL),(266,'3JxlQVTpUhl0euhbLo4xjVj0HkziNm','2023-09-18 04:10:54.146495','read write',1,1,'2023-09-17 18:10:54.146495','2023-09-17 18:10:54.146495',NULL,NULL),(267,'uMSSwC0ZQK6xdN8O4wt34bdYIcykzE','2023-09-18 04:13:25.165370','read write',1,1,'2023-09-17 18:13:25.165370','2023-09-17 18:13:25.165370',NULL,NULL),(268,'7LxXM6Wjkjvque5uQ2AkbeVh11ROAj','2023-09-18 04:19:17.965132','read write',1,10,'2023-09-17 18:19:17.965132','2023-09-17 18:19:17.965132',NULL,NULL),(269,'JQY848k4TUw56AGqtZqDJSQBXnFujk','2023-09-18 04:28:49.313045','read write',1,1,'2023-09-17 18:28:49.313045','2023-09-17 18:28:49.313045',NULL,NULL),(270,'XIHfHk12bnNNdUEnuX6uUn8A319GCv','2023-09-18 04:32:00.958776','read write',1,10,'2023-09-17 18:32:00.958776','2023-09-17 18:32:00.958776',NULL,NULL),(271,'2VEbPORlGKH24GE6ukpqriaBL2qmUZ','2023-09-18 04:36:22.480721','read write',1,10,'2023-09-17 18:36:22.480721','2023-09-17 18:36:22.480721',NULL,NULL),(272,'0sNeBsWpyzxn64NY5Vhk6wLgoY8zLr','2023-09-18 04:39:22.148155','read write',1,1,'2023-09-17 18:39:22.148155','2023-09-17 18:39:22.148155',NULL,NULL),(273,'knDl2Hh7SWZwbSMNVQsX8wHYdIy4yF','2023-09-18 04:42:17.684339','read write',1,10,'2023-09-17 18:42:17.684339','2023-09-17 18:42:17.684339',NULL,NULL),(274,'P71M1JE5I9Z9Vw96DGiNm0AzyPynRj','2023-09-18 04:43:01.202031','read write',1,10,'2023-09-17 18:43:01.202031','2023-09-17 18:43:01.202031',NULL,NULL),(275,'eLW9pAyBX1iifSfAhTV6vTW5k2S0zE','2023-09-18 04:57:32.631515','read write',1,1,'2023-09-17 18:57:32.631515','2023-09-17 18:57:32.631515',NULL,NULL),(276,'fVec9ugzZtcESj2cGY4xXFvMnL5dLC','2023-09-18 05:00:24.313366','read write',1,10,'2023-09-17 19:00:24.313366','2023-09-17 19:00:24.313366',NULL,NULL),(277,'VasrM7ofLvCPK1o8kMPaMsMSvsTbmO','2023-09-18 05:24:16.174495','read write',1,10,'2023-09-17 19:24:16.174495','2023-09-17 19:24:16.174495',NULL,NULL),(278,'FCERcyza4MjymLUwPTQv9SwyQpQdta','2023-09-18 05:25:03.645022','read write',1,10,'2023-09-17 19:25:03.645022','2023-09-17 19:25:03.645022',NULL,NULL),(279,'LvvnY6ZefTXv7uvpupHYQG0RuAoHcS','2023-09-18 14:24:11.706965','read write',1,10,'2023-09-18 04:24:11.707967','2023-09-18 04:24:11.707967',NULL,NULL),(280,'Uc17ou2lhIi7aYmz4LTzSmwTjtZ65d','2023-09-18 14:25:50.356259','read write',1,10,'2023-09-18 04:25:50.356259','2023-09-18 04:25:50.356259',NULL,NULL),(281,'135G1oMtFLO0Fk9nscBBIUfnHCKar5','2023-09-18 14:33:51.103311','read write',1,1,'2023-09-18 04:33:51.103311','2023-09-18 04:33:51.103311',NULL,NULL),(282,'zCUzJGpntxmTTeHTEkqbaTww9dExFk','2023-09-18 19:38:39.950356','read write',1,10,'2023-09-18 09:38:39.950356','2023-09-18 09:38:39.950356',NULL,NULL),(283,'fFtj2Ik8IoCWLwEBu8FJ7QM0pSHs2i','2023-09-18 19:39:05.570084','read write',1,10,'2023-09-18 09:39:05.570084','2023-09-18 09:39:05.570084',NULL,NULL),(284,'73HyFtLe5vTF7zdfaHp4923x79J75g','2023-09-18 19:46:18.169304','read write',1,10,'2023-09-18 09:46:18.169304','2023-09-18 09:46:18.169304',NULL,NULL),(285,'UlfmLGCgRRSiqL2PgmSXx2ZQVlXcvv','2023-09-18 20:15:57.619492','read write',1,10,'2023-09-18 10:15:57.620493','2023-09-18 10:15:57.620493',NULL,NULL),(286,'Lk9qzEOXKYVnL62iz6DhhMc92O5FhH','2023-09-18 20:29:02.182082','read write',1,10,'2023-09-18 10:29:02.182082','2023-09-18 10:29:02.182082',NULL,NULL),(287,'jiqIpIHlB1xOGYkKXwgV5vLKbg8BBh','2023-09-18 20:29:13.378798','read write',1,1,'2023-09-18 10:29:13.378798','2023-09-18 10:29:13.378798',NULL,NULL),(288,'bFMc6FEihyRA4ZsETM5ALvO9FvJV5B','2023-09-18 21:28:07.917517','read write',1,1,'2023-09-18 11:28:07.917517','2023-09-18 11:28:07.917517',NULL,NULL),(289,'kKJIoX8ZWog4WTGgOaY9NWhbMh8QHM','2023-09-19 14:58:37.134622','read write',1,1,'2023-09-19 04:58:37.135623','2023-09-19 04:58:37.135623',NULL,NULL),(290,'wburJfl9de1w6E3dUXgY3vScuousOy','2023-09-21 12:59:49.912477','read write',1,1,'2023-09-21 02:59:49.912477','2023-09-21 02:59:49.912477',NULL,NULL),(291,'xRPhKxd79CYYkKLqCTdnvTGSKAljjV','2023-09-21 13:00:28.060519','read write',1,20,'2023-09-21 03:00:28.060519','2023-09-21 03:00:28.060519',NULL,NULL),(292,'xS9ssn7HBVoePfsladvOBZ201XgZK1','2023-09-21 13:32:33.204559','read write',1,20,'2023-09-21 03:32:33.204559','2023-09-21 03:32:33.204559',NULL,NULL),(293,'65ORc8p0FeKom40vrQSnkvYl9BAGF0','2023-09-21 14:44:55.693023','read write',1,20,'2023-09-21 04:44:55.693023','2023-09-21 04:44:55.693023',NULL,NULL),(294,'sVlZG2XZGw2vfczRY8qRXUKcznMbbz','2023-09-21 18:10:47.211122','read write',1,20,'2023-09-21 08:10:47.212117','2023-09-21 08:10:47.212117',NULL,NULL),(295,'Kawz0ZA0XeHcewxIHYQiZrtQ53Ijg6','2023-09-21 21:43:12.200827','read write',1,21,'2023-09-21 11:43:12.200827','2023-09-21 11:43:12.200827',NULL,NULL),(296,'hoYx7qiJ7kOhySsyFuEScoKfqxpnve','2023-09-21 21:43:44.377821','read write',1,1,'2023-09-21 11:43:44.378821','2023-09-21 11:43:44.378821',NULL,NULL),(298,'RoTP4APBGHg46N9R7IoJPrhxH2K4gn','2023-09-22 04:19:53.822824','read write',1,1,'2023-09-21 18:19:53.822824','2023-09-21 18:19:53.822824',NULL,NULL),(299,'24VAYJVfJPtt7JvBHcz5VxyE8elVvE','2023-09-22 04:22:10.194128','read write',1,1,'2023-09-21 18:22:10.194128','2023-09-21 18:22:10.194128',NULL,NULL),(301,'DXmShth3Px5a1gzHzk8GFpSDoYZ60y','2023-09-22 04:35:31.483322','read write',1,1,'2023-09-21 18:35:31.483322','2023-09-21 18:35:31.483322',NULL,NULL),(302,'KpaDZ3o65EVvNEjT2TyQFSpAvzReKI','2023-09-22 17:19:45.859120','read write',1,1,'2023-09-22 07:19:45.859120','2023-09-22 07:19:45.859120',NULL,NULL),(303,'lVfZeJQMyvxqx9Wi1EvigN02FDcLBt','2023-09-22 17:21:36.101919','read write',1,10,'2023-09-22 07:21:36.102915','2023-09-22 07:21:36.102915',NULL,NULL),(304,'HsbDo4cTlomSvkDHRrrF8BUVkuzVV1','2023-09-22 17:38:50.543925','read write',1,10,'2023-09-22 07:38:50.543925','2023-09-22 07:38:50.543925',NULL,NULL),(305,'Em5zUfCuN05WPnUn4M29C4YR7A25JM','2023-09-22 17:42:57.133199','read write',1,10,'2023-09-22 07:42:57.133199','2023-09-22 07:42:57.133199',NULL,NULL),(306,'gnuSBlgwa7mF031Zx1M29mcQGnuiOc','2023-09-22 17:50:47.922898','read write',1,10,'2023-09-22 07:50:47.922898','2023-09-22 07:50:47.922898',NULL,NULL);
/*!40000 ALTER TABLE `oauth2_provider_accesstoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_application`
--

DROP TABLE IF EXISTS `oauth2_provider_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_application` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `client_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect_uris` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `authorization_grant_type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_secret` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `skip_authorization` tinyint(1) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `algorithm` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_logout_redirect_uris` longtext COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (_utf8mb3''),
  PRIMARY KEY (`id`),
  UNIQUE KEY `client_id` (`client_id`),
  KEY `oauth2_provider_application_user_id_79829054_fk_shops_user_id` (`user_id`),
  KEY `oauth2_provider_application_client_secret_53133678` (`client_secret`),
  CONSTRAINT `oauth2_provider_application_user_id_79829054_fk_shops_user_id` FOREIGN KEY (`user_id`) REFERENCES `shops_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_application`
--

LOCK TABLES `oauth2_provider_application` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_application` DISABLE KEYS */;
INSERT INTO `oauth2_provider_application` VALUES (1,'dOpYblCChifIEB47b9RvjwZMhHWoNPKYjuy8z3gO','','confidential','password','pbkdf2_sha256$600000$J7ANUBP2gue7TXbWTG4a6v$AnYL0d1l0AezWLDJK4XAetDTbS+NAAHd+RUBjrC9NbI=','FukiApp',1,0,'2023-08-04 15:49:32.467534','2023-08-04 15:49:32.467534','','');
/*!40000 ALTER TABLE `oauth2_provider_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_grant`
--

DROP TABLE IF EXISTS `oauth2_provider_grant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_grant` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires` datetime(6) NOT NULL,
  `redirect_uri` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `scope` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `application_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `code_challenge` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code_challenge_method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nonce` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `claims` longtext COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (_utf8mb3''),
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `oauth2_provider_gran_application_id_81923564_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_grant_user_id_e8f62af8_fk_shops_user_id` (`user_id`),
  CONSTRAINT `oauth2_provider_gran_application_id_81923564_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_grant_user_id_e8f62af8_fk_shops_user_id` FOREIGN KEY (`user_id`) REFERENCES `shops_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_grant`
--

LOCK TABLES `oauth2_provider_grant` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_grant` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_provider_grant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_idtoken`
--

DROP TABLE IF EXISTS `oauth2_provider_idtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_idtoken` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `jti` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires` datetime(6) NOT NULL,
  `scope` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `application_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `jti` (`jti`),
  KEY `oauth2_provider_idto_application_id_08c5ff4f_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_idtoken_user_id_dd512b59_fk_shops_user_id` (`user_id`),
  CONSTRAINT `oauth2_provider_idto_application_id_08c5ff4f_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_idtoken_user_id_dd512b59_fk_shops_user_id` FOREIGN KEY (`user_id`) REFERENCES `shops_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_idtoken`
--

LOCK TABLES `oauth2_provider_idtoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_idtoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_provider_idtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_refreshtoken`
--

DROP TABLE IF EXISTS `oauth2_provider_refreshtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_refreshtoken` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` bigint DEFAULT NULL,
  `application_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `revoked` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `access_token_id` (`access_token_id`),
  UNIQUE KEY `oauth2_provider_refreshtoken_token_revoked_af8a5134_uniq` (`token`,`revoked`),
  KEY `oauth2_provider_refr_application_id_2d1c311b_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_refreshtoken_user_id_da837fce_fk_shops_user_id` (`user_id`),
  CONSTRAINT `oauth2_provider_refr_access_token_id_775e84e8_fk_oauth2_pr` FOREIGN KEY (`access_token_id`) REFERENCES `oauth2_provider_accesstoken` (`id`),
  CONSTRAINT `oauth2_provider_refr_application_id_2d1c311b_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_refreshtoken_user_id_da837fce_fk_shops_user_id` FOREIGN KEY (`user_id`) REFERENCES `shops_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=307 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_refreshtoken`
--

LOCK TABLES `oauth2_provider_refreshtoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_refreshtoken` DISABLE KEYS */;
INSERT INTO `oauth2_provider_refreshtoken` VALUES (1,'APCJsHaWgmcbGWDUsh4kolh3kyuMTR',1,1,7,'2023-08-05 14:52:01.016086','2023-08-05 14:52:01.016086',NULL),(2,'Cr4NNmC5h0nUTXK6WDyuj32uogerao',2,1,1,'2023-08-05 15:56:23.409489','2023-08-05 15:56:23.409489',NULL),(3,'zdnaFApPwbEDO6xvbZyTEllIOngD1m',3,1,1,'2023-08-05 16:01:27.039056','2023-08-05 16:01:27.039056',NULL),(4,'azBsDqXcUWBxh0F0U4U6wtwJbeEnFF',4,1,1,'2023-08-06 10:53:12.044239','2023-08-06 10:53:12.044239',NULL),(5,'3BP42kgxdUTp7PskTV18hJkAInrY4I',5,1,2,'2023-08-06 12:11:07.171569','2023-08-06 12:11:07.171569',NULL),(6,'MpseHRg29oVtYDxxqT2QSLfXbNAO6p',6,1,7,'2023-08-06 12:11:26.928469','2023-08-06 12:11:26.929269',NULL),(7,'zjTCKBjJ1Y0XmYdLL6wxQKHcdSDBSm',7,1,1,'2023-08-06 12:17:06.471684','2023-08-06 12:17:06.471684',NULL),(8,'BmTCQab06h74iRlolspDZ3H32pNnh0',8,1,7,'2023-08-06 18:16:28.105982','2023-08-06 18:16:28.105982',NULL),(9,'yX2dKHoJQ4ggY3aSt1LSL1LJXBFYsG',9,1,3,'2023-08-07 02:50:27.087566','2023-08-07 02:50:27.087566',NULL),(10,'l9CR1rnb7DwJhYgZIV7QnOpzhS5nCK',10,1,7,'2023-08-07 02:58:22.787775','2023-08-07 02:58:22.787775',NULL),(11,'HEihKDkrJXt4DfVltwMooGateRfZT7',11,1,1,'2023-08-07 02:58:53.571214','2023-08-07 02:58:53.571214',NULL),(12,'rW1xOHJtmSpBF9bIw1WeXb7HbKIhQ5',12,1,3,'2023-08-07 02:59:21.295888','2023-08-07 02:59:21.295888',NULL),(13,'gtI0ozMiaRN9ojPxAwe6JR2NkEFHc3',13,1,7,'2023-08-07 03:00:26.862144','2023-08-07 03:00:26.862144',NULL),(14,'Tr11ggCHjE6VilvZjwoBtEHybEtGxi',14,1,1,'2023-08-07 03:00:39.644320','2023-08-07 03:00:39.644320',NULL),(15,'Nqb8m4WGBgY2A7rbMatptjt7bVzKbs',15,1,3,'2023-08-07 03:00:57.307103','2023-08-07 03:00:57.307103',NULL),(16,'vGYpQdl4LpP9cUOd0lkju1MkLKEIF8',16,1,2,'2023-08-07 03:01:54.971289','2023-08-07 03:01:54.971289',NULL),(17,'cu6KhfJ2YwtKObWOkz8qfe2WXYAGu9',17,1,8,'2023-08-07 03:25:41.546281','2023-08-07 03:25:41.546281',NULL),(18,'Txe2FwC8BOJeiQu6bP6NSp2JNq8Vy9',18,1,2,'2023-08-07 03:41:53.900668','2023-08-07 03:41:53.900668',NULL),(19,'P3Blx4DIccsZgFbubeAmp2wJlvG2Rl',19,1,8,'2023-08-07 03:45:13.124932','2023-08-07 03:45:13.124932',NULL),(20,'8uSptXOaK7fn7pC2lDvKK4Y0IWABUC',20,1,1,'2023-08-07 03:46:06.926920','2023-08-07 03:46:06.926920',NULL),(21,'TKutx0mdjYwcqxQBs9k87korQlMlAn',21,1,1,'2023-08-11 06:39:39.552912','2023-08-11 06:39:39.552912',NULL),(22,'W1Jp5XOq7ZAAdT6jUoo6J8p4pNE0Od',22,1,1,'2023-08-12 14:38:28.894354','2023-08-12 14:38:28.894354',NULL),(23,'EnuK4Kv8UeZTFPsy0ZqbTqJEJ0pz2H',23,1,1,'2023-08-12 15:08:09.159841','2023-08-12 15:08:09.159841',NULL),(24,'RRGu9vXR4LNDR4VIcswY4sicvTN9U3',24,1,1,'2023-08-12 15:08:10.948386','2023-08-12 15:08:10.948386',NULL),(25,'mRilBNcRyIpoCQc1b7mgZ4pQw02tnX',25,1,1,'2023-08-12 17:04:42.780583','2023-08-12 17:04:42.780583',NULL),(26,'Pi9le5AqFI3j5YNa81wQTcxouyG0Pu',26,1,1,'2023-08-12 17:17:36.572565','2023-08-12 17:17:36.572565',NULL),(27,'qrVxX3V0y2eBRgWbiI412kyLFABq22',27,1,1,'2023-08-12 17:19:15.473132','2023-08-12 17:19:15.473132',NULL),(28,'GhaPfWNPw9IclOGWI33g6ZfaAhUpOu',28,1,1,'2023-08-12 17:20:15.573403','2023-08-12 17:20:15.573403',NULL),(29,'T11ubt9KU0bCxPnp98jkhrXDu97BjY',29,1,1,'2023-08-12 17:20:42.090254','2023-08-12 17:20:42.090254',NULL),(30,'pP6dgrjVlBhYUugISw9ugXW5L2QH4c',30,1,1,'2023-08-12 17:24:45.078671','2023-08-12 17:24:45.078671',NULL),(31,'JLQhkAYo3PG4CmmjNi7nzg3AjDy3WC',31,1,1,'2023-08-12 17:25:27.532133','2023-08-12 17:25:27.532133',NULL),(32,'TeIRBNq7YKZ6oRfbxsQbCsQj19WOPE',32,1,1,'2023-08-13 06:40:21.198357','2023-08-13 06:40:21.198357',NULL),(33,'IkLTY7i1LchgyafAXQLgsGuc2FqT61',33,1,1,'2023-08-13 06:57:34.044397','2023-08-13 06:57:34.044397',NULL),(34,'5ABV2c0TJsOH7qXp8eJ3dHED2Fd8i3',34,1,10,'2023-08-16 19:27:58.070640','2023-08-16 19:27:58.070640',NULL),(35,'f946M4F301au3xsmDw75GK4n7yD2mM',35,1,1,'2023-08-19 18:34:08.246239','2023-08-19 18:34:08.246239',NULL),(36,'zDg4QBPVESQKxw9GD349NFWJxAw8Ya',36,1,10,'2023-08-19 18:35:25.597550','2023-08-19 18:35:25.597550',NULL),(37,'ovjPmAA8XA0ApB9VI77Ci31d4M9041',37,1,10,'2023-08-20 11:20:14.364033','2023-08-20 11:20:14.364033',NULL),(38,'VrcS5lsSDMBgD6zDjnJUIMj2hkS2PP',38,1,1,'2023-08-20 17:49:29.169749','2023-08-20 17:49:29.169749',NULL),(39,'gM1g5WQe5U7rYVdbcnhTTU7JWbgA8p',39,1,10,'2023-08-20 17:58:26.299519','2023-08-20 17:58:26.299519',NULL),(40,'p0qeXZyWi5Bo4ZhArc7LxduQnwFDZC',40,1,10,'2023-08-21 05:01:31.673580','2023-08-21 05:01:31.673580',NULL),(41,'G1ERunW7WtBVV6GLd4dOpBHA60fQcE',41,1,10,'2023-08-21 05:50:45.803667','2023-08-21 05:50:45.803667',NULL),(42,'9WMT3ow33DQ2tMIkJfvmGiBY4XvFyQ',42,1,10,'2023-08-21 14:16:51.299255','2023-08-21 14:16:51.299255',NULL),(43,'r32RCBigmySkWQQd8WFXFdiiHfOoEF',43,1,10,'2023-08-21 16:31:06.753442','2023-08-21 16:31:06.753442',NULL),(44,'8JUK5UzTuNFoW1gpycACzoMofED2BP',44,1,10,'2023-08-21 17:13:28.594247','2023-08-21 17:13:28.594247',NULL),(45,'VuS0E0nzqz4WSFRgLKqjtzdhjTvgFf',45,1,10,'2023-08-21 18:41:47.104179','2023-08-21 18:41:47.104179',NULL),(46,'r24FwpKpKwHzhlOznH8mTrbUmvpmm7',46,1,10,'2023-08-21 18:45:27.311791','2023-08-21 18:45:27.311791',NULL),(47,'koHrl5uaFGJQtj5zWyF9i4K2tIJJHs',47,1,10,'2023-08-21 18:54:15.346701','2023-08-21 18:54:15.346701',NULL),(48,'fZEQJLIZVLkguUeF5kFFMH0BVCfYT2',48,1,10,'2023-08-21 19:04:35.588201','2023-08-21 19:04:35.588201',NULL),(49,'XYBir2hzjqE287OtkUsHUPXlxBg6ar',49,1,1,'2023-08-22 03:42:12.000506','2023-08-22 03:42:12.000506',NULL),(50,'IS6UskAebphpBGoVbQ0I76OHJWkRQq',50,1,10,'2023-08-22 03:45:41.591351','2023-08-22 03:45:41.591351',NULL),(51,'khL4h3ltHhIycdtWPMW8HWQETZqhvl',51,1,1,'2023-08-22 03:50:26.898565','2023-08-22 03:50:26.898565',NULL),(52,'cYP5luXSrnGiGtaCZ2WlccRbT3Ehep',52,1,10,'2023-08-22 03:52:50.615542','2023-08-22 03:52:50.615542',NULL),(53,'BBRgCz9tjKXX2PnTiWRwvkf8giIc9u',53,1,10,'2023-08-22 05:43:13.363802','2023-08-22 05:43:13.363802',NULL),(54,'OyiDBHgDgK7bk5nwet2cNVmlBnfSuL',54,1,10,'2023-08-22 14:22:20.460688','2023-08-22 14:22:20.460688',NULL),(55,'k12G27uRpeLaoIil5ECO93YJohSl2f',55,1,10,'2023-08-22 17:07:58.825924','2023-08-22 17:07:58.825924',NULL),(56,'lMd5VMMcqxVR9URbpjkoTqkFup7vnX',56,1,10,'2023-08-23 03:53:07.216591','2023-08-23 03:53:07.216591',NULL),(57,'jEEAaWjf0Eqm6h0f5O47MMviDOK5Bp',57,1,10,'2023-08-23 12:26:08.552322','2023-08-23 12:26:08.552322',NULL),(58,'pKza8BVLiKMtnW66jV6EjOVV7e2Axt',58,1,10,'2023-08-23 17:30:29.731074','2023-08-23 17:30:29.731074',NULL),(59,'At7KNDkvjYOMr198VGxT3wBYDwgZcu',59,1,10,'2023-08-23 17:38:25.125567','2023-08-23 17:38:25.125567',NULL),(60,'nkCcOe6lLTipq1pMLHvh1BBLtHxfGf',60,1,10,'2023-08-24 04:52:08.926594','2023-08-24 04:52:08.926594',NULL),(61,'jcLOxjGXc4ids8WfhlochRnOGETBpZ',61,1,10,'2023-08-24 06:34:03.218215','2023-08-24 06:34:03.218215',NULL),(62,'sJjIerzDHjzZrB2A7cH5KO7zjLMxk0',62,1,17,'2023-08-24 16:21:21.878650','2023-08-24 16:21:21.878650',NULL),(63,'jxuHCpBxKj7WkMuzKAnbuXsyNDXTZ0',63,1,16,'2023-08-24 16:21:33.719045','2023-08-24 16:21:33.719045',NULL),(64,'8Zm6wYpVZcuAHACM9FD2QnHkTnXHFW',64,1,10,'2023-08-24 16:31:03.321601','2023-08-24 16:31:03.321601',NULL),(65,'g7bSRzr34mkl3WwWhCOdnzrjPxWNRg',65,1,10,'2023-08-25 05:01:31.070147','2023-08-25 05:01:31.070147',NULL),(66,'GAZf9XsDaKpsxPwD81R90eMqwzINBW',66,1,10,'2023-08-25 05:03:32.661679','2023-08-25 05:03:32.661679',NULL),(67,'NMLIrW0ZBgYgJrxrJuqSZf4UMwrEJu',67,1,10,'2023-08-25 05:06:50.415828','2023-08-25 05:06:50.415828',NULL),(68,'AIvIahNQ808zv2FZciBJCjiGFTGTiL',68,1,10,'2023-08-25 05:27:28.484237','2023-08-25 05:27:28.484237',NULL),(69,'WSFyYmoebWH0avRKL5rZZ5PKQYeHdW',69,1,10,'2023-08-25 05:43:32.952783','2023-08-25 05:43:32.952783',NULL),(70,'20OARg83GBHqmLAZB2KloBu0ngQF0Q',70,1,10,'2023-08-26 11:26:28.751026','2023-08-26 11:26:28.751026',NULL),(71,'dseUZbiwBdfRMFFYTMgHAMlhIlcdA7',71,1,10,'2023-08-26 11:42:05.460139','2023-08-26 11:42:05.460139',NULL),(72,'L7aY8uAWqWoI42oqc50DRddd5j9gyp',72,1,10,'2023-08-26 12:30:08.530316','2023-08-26 12:30:08.530316',NULL),(73,'nfouSsB3JorZwARRtjj0oJtDVhwYiB',73,1,10,'2023-08-27 14:42:29.827727','2023-08-27 14:42:29.827727',NULL),(74,'HRdCmDoghccpboL0nZBK4V5EchgxTb',74,1,10,'2023-08-27 14:43:42.822755','2023-08-27 14:43:42.822755',NULL),(75,'s3rK8jOmcfHjww6TVvcUXDcyif5PhX',75,1,10,'2023-08-27 14:48:00.556225','2023-08-27 14:48:00.557225',NULL),(76,'LMJ9mGSJPQFgfTWk730fWX6JdphEnI',76,1,10,'2023-08-28 05:43:34.839243','2023-08-28 05:43:34.839243',NULL),(77,'PbIt3Gs0lBo2TDavdmq4aYmDiQscBJ',77,1,10,'2023-08-28 14:04:19.823894','2023-08-28 14:04:19.823894',NULL),(78,'dswVuGT1XXMdpCWwy5qxmbcO52reX8',78,1,10,'2023-08-28 14:14:21.092843','2023-08-28 14:14:21.092843',NULL),(79,'nT5GPGPyNbjkMcD6wklKkp6EXxieGW',79,1,10,'2023-08-28 17:24:43.125238','2023-08-28 17:24:43.125238',NULL),(80,'vU4M0bzeR7NdlwyUsqgDRMZHaIHUiD',80,1,10,'2023-08-28 19:01:25.981940','2023-08-28 19:01:25.981940',NULL),(81,'Z2LPqsaTyd1qxB2kJgbwmLhbNjKLi8',81,1,10,'2023-08-28 19:02:35.305248','2023-08-28 19:02:35.305248',NULL),(82,'CFP6zmJK8QfK26JGKF8d4D47fWPEPa',82,1,10,'2023-08-28 19:03:11.128838','2023-08-28 19:03:11.128838',NULL),(83,'yzLo4t5SerWmnzBV4pnu5FcqSwtRrm',83,1,10,'2023-08-28 19:05:34.469645','2023-08-28 19:05:34.469645',NULL),(84,'6C0tpJGYamEfLdH8s6aRzxoF0kBbz5',84,1,10,'2023-08-28 19:06:03.137291','2023-08-28 19:06:03.137291',NULL),(85,'8iWZbJ1W7eL31ApyrZ1T7GuBehO5VX',85,1,10,'2023-08-28 19:23:15.043571','2023-08-28 19:23:15.043571',NULL),(86,'tDawxMW8K9dmvYNKwyysWHwEXUzW7U',86,1,10,'2023-08-28 19:24:11.964149','2023-08-28 19:24:11.964149',NULL),(87,'BqIKSuRgOEcmuLfg7T6TYNNyBqDTuB',87,1,10,'2023-08-28 19:29:23.527386','2023-08-28 19:29:23.527386',NULL),(88,'iHhZdyCtW52PJtONKIYJY9yLtlyaMq',88,1,10,'2023-08-29 02:43:31.477057','2023-08-29 02:43:31.477057',NULL),(89,'74i7GuFtOvIlb3tVJC2lZgwF79B0tE',89,1,10,'2023-08-29 02:45:23.878469','2023-08-29 02:45:23.878469',NULL),(90,'CEuMpid9zSQvB0A5ef7MwXhaZ5WBlV',90,1,10,'2023-08-29 02:52:50.723231','2023-08-29 02:52:50.723231',NULL),(91,'FD7xv2LhAU6sO9VUM5HL6IV74xtILV',91,1,10,'2023-08-29 03:37:40.595892','2023-08-29 03:37:40.595892',NULL),(92,'8ILlGvGYst5OvC6D5QbCbxU4PJefv5',92,1,10,'2023-08-29 03:47:56.172482','2023-08-29 03:47:56.172482',NULL),(93,'aUCY8heC8MbsZ2v9qwkJUlPSy8BgwV',93,1,10,'2023-08-29 04:01:22.889734','2023-08-29 04:01:22.889734',NULL),(94,'Oq8Vdp6Wx81Cw49fx6QGbb9Eo1GsIV',94,1,10,'2023-08-29 04:06:38.860513','2023-08-29 04:06:38.860513',NULL),(95,'pCCm3F7WaogfOC3b8nSwdgr7XZtPe9',95,1,1,'2023-08-29 04:08:53.376532','2023-08-29 04:08:53.376532',NULL),(96,'TpnUOVesTy82frH1l0fIWR6ERK1GSY',96,1,1,'2023-08-29 04:46:58.238030','2023-08-29 04:46:58.238030',NULL),(97,'TFvJAVIIfUYQS4kqVMFAxJNpt69mNr',97,1,1,'2023-08-29 05:05:48.428781','2023-08-29 05:05:48.428781',NULL),(98,'Yb4DyKmq4q8sj5wBKUnnJvq2FIQQEy',98,1,10,'2023-08-29 05:11:29.408348','2023-08-29 05:11:29.408348',NULL),(99,'tMyxo0AE0eRvdRaw0v6zLeKKmu70JM',99,1,1,'2023-08-29 05:12:00.115053','2023-08-29 05:12:00.116049',NULL),(100,'Z7x3BlJ09RUgNBHFbVDEXoh5g7Rc0E',100,1,10,'2023-08-29 05:12:29.980690','2023-08-29 05:12:29.980690',NULL),(101,'EEddY2uKWVsBcJuV5YgAamC9P8BpqQ',101,1,10,'2023-08-29 05:12:46.051351','2023-08-29 05:12:46.051351',NULL),(102,'c5nKkT57GQxm5VwgDnrFgIXoPgj4rQ',102,1,1,'2023-08-29 05:14:22.345357','2023-08-29 05:14:22.345357',NULL),(103,'JsPavGhbeqRcT2ojRtcIJQkRbKyjhF',103,1,16,'2023-08-29 05:14:40.630205','2023-08-29 05:14:40.630205',NULL),(104,'Ka92JmSv4mN7ElQuEAqZ2zkTVxKz64',104,1,16,'2023-08-29 07:04:03.376070','2023-08-29 07:04:03.376070',NULL),(105,'9F5VG8nvO6V4R8DQgekUInInDrM0FF',105,1,16,'2023-08-29 10:51:11.713326','2023-08-29 10:51:11.713326',NULL),(106,'bqUxukD04aCH6GaTAYQ7T44Gs1aTfR',106,1,16,'2023-08-29 11:05:46.436140','2023-08-29 11:05:46.436140',NULL),(107,'g2Yfb3zNCMMzamBovCm7evhKcebFf2',107,1,1,'2023-08-29 11:06:17.396948','2023-08-29 11:06:17.396948',NULL),(108,'vdEQsBwyyytZEjtSGOa9Wfn8v50nWc',108,1,18,'2023-08-29 11:13:17.504084','2023-08-29 11:13:17.504084',NULL),(109,'Mt2aVO91IVEBFre1XeT7bVgG0Dk40u',109,1,10,'2023-08-29 14:49:09.539000','2023-08-29 14:49:09.539000',NULL),(110,'N72uObiLqalz8lyLq9Fx884RoUMowj',110,1,1,'2023-08-29 15:01:33.916412','2023-08-29 15:01:33.916412',NULL),(111,'DTB1OPNpm5jfiJI8tWWlrJC23fDf9F',111,1,2,'2023-08-29 15:04:09.084551','2023-08-29 15:04:09.084551',NULL),(112,'btfWKbm7UUj6fzp2TZMC7gTc3Blen6',112,1,1,'2023-08-29 15:05:23.654349','2023-08-29 15:05:23.654349',NULL),(113,'ckgcIEd0tlJ0BRZZA7XBedB8i7iBX0',113,1,1,'2023-08-29 17:17:14.081000','2023-08-29 17:17:14.081000',NULL),(114,'DDdjD7DrhfRLFY9jCgjfTnbwHeH7wj',114,1,1,'2023-08-29 17:34:23.808481','2023-08-29 17:34:23.808481',NULL),(115,'18XZI4dNpr91xFzC1a2B3GmATsA67o',115,1,1,'2023-08-29 18:46:44.105342','2023-08-29 18:46:44.105342',NULL),(116,'RPa8PrglT4flUHUGOJBAGKJbPbOZ4E',116,1,1,'2023-08-30 04:51:19.782808','2023-08-30 04:51:19.782808',NULL),(117,'iQKZkjE7mSo1gbEsI01MvQZntaqGT3',117,1,1,'2023-08-30 13:24:32.951171','2023-08-30 13:24:32.952121',NULL),(118,'nh4D7aOKmoIARfNbzqv54aWQ2oazSs',118,1,1,'2023-08-30 14:54:14.057901','2023-08-30 14:54:14.057901',NULL),(119,'1bdAdZGD9beLgeaz8SAZ1Ubalnxg1f',119,1,1,'2023-08-30 17:07:16.719908','2023-08-30 17:07:16.719908',NULL),(120,'kfO275xFgGeyNFubdZfSlVtmtqXt51',120,1,2,'2023-08-30 19:13:58.503900','2023-08-30 19:13:58.503900',NULL),(121,'f997j471xzQpKcaBdJsJTTywy5xeMc',121,1,1,'2023-08-30 19:14:30.695149','2023-08-30 19:14:30.695149',NULL),(122,'Ri4n9txpVTOVR0dxoqGjyqGexUPizW',122,1,1,'2023-08-31 05:05:50.006816','2023-08-31 05:05:50.006816',NULL),(123,'bjjrkDvEvOaNqZw8irczuo4CZnmqgD',123,1,1,'2023-08-31 12:04:02.204844','2023-08-31 12:04:02.204844',NULL),(124,'OW5QmUFs5e6bRHBzlw44VWuFjcz7Tv',124,1,1,'2023-08-31 14:28:40.578578','2023-08-31 14:28:40.578578',NULL),(125,'kAHWcuCzQZT795g9xwFfgT9t5X5A5X',125,1,2,'2023-08-31 14:31:25.394581','2023-08-31 14:31:25.394581',NULL),(126,'4V0z5ZRF7BdBhxPQ95MOGcU1LnSYtO',126,1,1,'2023-08-31 14:31:43.617853','2023-08-31 14:31:43.617853',NULL),(127,'2wVnDjSZ06iNGxKsUU8bIGOpMTUkIe',127,1,1,'2023-08-31 14:38:35.178627','2023-08-31 14:38:35.178627',NULL),(128,'KRwD39xyL1v2WBKu6ARHEl5kS4jXNL',128,1,1,'2023-08-31 14:46:05.168254','2023-08-31 14:46:05.168254',NULL),(129,'Na6BGBp57SyCoLLvjEzk2YUkyiqeUQ',129,1,1,'2023-08-31 18:58:25.151869','2023-08-31 18:58:25.151869',NULL),(130,'C6BfNuB08B58lvTftwFHA9dgChX2ph',130,1,1,'2023-09-01 06:33:37.715497','2023-09-01 06:33:37.715497',NULL),(131,'JdFOH9bM5FSjdKhRm7POHWgn6U5kZq',131,1,1,'2023-09-01 07:00:32.995365','2023-09-01 07:00:32.995365',NULL),(132,'ZtxYIVNPhxJ6w08PWMh0Zo3PFYjYlW',132,1,1,'2023-09-02 07:51:35.726272','2023-09-02 07:51:35.726272',NULL),(133,'U6pINAMI09TniiYvN5nIL3C9nYQZHE',133,1,1,'2023-09-02 12:55:49.474053','2023-09-02 12:55:49.474053',NULL),(134,'vXp0LDybdxsg6NNtlu6TX2GtEATZBJ',134,1,10,'2023-09-02 12:56:50.544396','2023-09-02 12:56:50.544396',NULL),(135,'hVqpQX3uc4rpDP6BKL0od8VL38gqxl',135,1,16,'2023-09-02 13:17:54.499306','2023-09-02 13:17:54.499306',NULL),(136,'V5RX1sYAf3fHD2j0HLF9G3eeTW62Yq',136,1,1,'2023-09-02 13:19:14.983016','2023-09-02 13:19:14.983016',NULL),(137,'RgVlrNeP4ePXxhAFGaPXykjLDXwWnW',137,1,1,'2023-09-02 13:19:48.091849','2023-09-02 13:19:48.091849',NULL),(138,'H1TiXvFkP1iRVkQwYkLaGkd5JizHCq',138,1,16,'2023-09-02 13:20:01.864675','2023-09-02 13:20:01.864675',NULL),(139,'Fqswxnlm9emlozfjUH29KebKSiIg8F',139,1,16,'2023-09-02 13:26:19.997087','2023-09-02 13:26:19.997087',NULL),(140,'lvrsJMvI6tnJ85wpOFGBIJI6CARbiQ',140,1,16,'2023-09-02 13:29:21.016161','2023-09-02 13:29:21.016161',NULL),(141,'nuEyNUI7XHwzlBksyte7y7F36OqOSP',141,1,16,'2023-09-02 13:30:36.902846','2023-09-02 13:30:36.902846',NULL),(142,'F5L0yjnVzExfhCmKXM0Q0Q8OBAh7ra',142,1,1,'2023-09-02 13:33:16.722582','2023-09-02 13:33:16.722582',NULL),(143,'jW29e7jxoLlgyng5cVBAz8iqZOqXq8',143,1,1,'2023-09-02 13:38:23.011383','2023-09-02 13:38:23.011383',NULL),(144,'MKatZmfI7Qf70wvNKsbN1CNYLx6ZJp',144,1,1,'2023-09-02 13:38:31.245718','2023-09-02 13:38:31.245718',NULL),(145,'wf1JJ6CpH34AckPKFsqwQFETUsCw9K',145,1,1,'2023-09-02 13:39:22.195662','2023-09-02 13:39:22.195662',NULL),(146,'P6f0PwhChpJa0Rpe8WckNT8993VxSW',146,1,1,'2023-09-02 13:40:03.714752','2023-09-02 13:40:03.714752',NULL),(147,'mu7nrdXvg9lQt1N141MWH6pBre0dHo',147,1,1,'2023-09-02 13:40:32.323621','2023-09-02 13:40:32.323621',NULL),(148,'PCFce1l5LDsocY34WS07w0XdYT0All',148,1,16,'2023-09-02 13:41:08.752353','2023-09-02 13:41:08.752353',NULL),(149,'BPe0JyZEUXluJOrU9p3kIzUO2crCOQ',149,1,1,'2023-09-02 13:42:50.811491','2023-09-02 13:42:50.811491',NULL),(150,'y8H6PNM7Vj5ZjWZb0Ms0HznIBu3BrT',150,1,1,'2023-09-02 13:43:05.278265','2023-09-02 13:43:05.278265',NULL),(151,'8p1a8keQATvHCFzrBzcMpzIzbPmqnh',151,1,19,'2023-09-02 13:44:41.652876','2023-09-02 13:44:41.652876',NULL),(152,'WZ0IeBpISPFeH4ez87EgJCJXwATeyM',152,1,16,'2023-09-02 13:45:39.918129','2023-09-02 13:45:39.918129',NULL),(153,'8L6uIIv2GG7I5RJtKfSObgw64dWCDI',153,1,16,'2023-09-02 14:06:23.423488','2023-09-02 14:06:23.423488',NULL),(154,'3ShVMsjiqS6d7CpgUqCmQ76ieu2Mg8',154,1,16,'2023-09-02 14:10:37.617225','2023-09-02 14:10:37.617225',NULL),(155,'AQGZdBFE3igxoTj5u5mNoj1gH1jtRd',155,1,16,'2023-09-02 14:14:11.641979','2023-09-02 14:14:11.641979',NULL),(156,'UxS71sRnicQlQNk5nPAVGWFrbj33od',156,1,16,'2023-09-02 14:24:39.723439','2023-09-02 14:24:39.723439',NULL),(157,'thWNe0o7BQzRO4t6y9AP1Q5AvoVbFu',157,1,16,'2023-09-02 14:27:20.445745','2023-09-02 14:27:20.445745',NULL),(158,'ZlZzoBbxs5Qz5rjry6QFU10qdZcuno',158,1,16,'2023-09-02 14:28:26.332754','2023-09-02 14:28:26.332754',NULL),(159,'JzmQ1gFNBHUEzUk8vWX0Dp4cu2NjJq',159,1,16,'2023-09-02 14:42:42.464637','2023-09-02 14:42:42.464637',NULL),(160,'pURCK63Cj9nxroIlFNl1IvTfMEepHZ',160,1,16,'2023-09-02 14:45:27.543105','2023-09-02 14:45:27.543105',NULL),(161,'qRzIFjcrbin6RzNjrKhhC8sr6BxSxO',161,1,16,'2023-09-02 14:46:05.647397','2023-09-02 14:46:05.647397',NULL),(162,'SxeaoqKB7TLpaBKjAqBbXaDefeXnCt',162,1,16,'2023-09-02 14:47:18.065633','2023-09-02 14:47:18.065633',NULL),(163,'4RrLeAUGOR2EywzKBDps4yj8zOzmuZ',163,1,16,'2023-09-02 14:49:31.062075','2023-09-02 14:49:31.062075',NULL),(164,'Ns0Fay0OORVMEINh1GvMeKmYl9eok7',164,1,16,'2023-09-02 14:56:27.075583','2023-09-02 14:56:27.075583',NULL),(165,'Q2PsyJ5kzwiw51HQXHaJuUBZKpP6ok',165,1,16,'2023-09-02 14:58:08.013027','2023-09-02 14:58:08.013027',NULL),(166,'VpaQWOaGe60VIL5QzdHTa9HcMyjFh8',166,1,16,'2023-09-02 15:00:08.145746','2023-09-02 15:00:08.145746',NULL),(167,'kBIEwx7szkQtz6a5cyHfYbZdGXqPO0',167,1,16,'2023-09-02 15:03:35.040683','2023-09-02 15:03:35.040683',NULL),(168,'CzGTB66TT2glcdCRa6YNG0x2teZpXB',168,1,16,'2023-09-02 15:16:45.498366','2023-09-02 15:16:45.498366',NULL),(169,'Fq9WJgEUA7KyfsMrHuu1ourJeMoqSL',169,1,18,'2023-09-02 16:48:43.229313','2023-09-02 16:48:43.229313',NULL),(170,'Je49LJt2JIfG0PQzGStJAPKHsGpX0L',170,1,1,'2023-09-02 17:20:15.402217','2023-09-02 17:20:15.402217',NULL),(171,'j0AN4pA2fJzf62BbEBWhVZwcd03Xq4',171,1,16,'2023-09-02 17:39:41.471911','2023-09-02 17:39:41.471911',NULL),(172,'0Dxyz8pYZiiGYE3SSHfu2lqCxNkUY7',172,1,18,'2023-09-02 17:40:19.658101','2023-09-02 17:40:19.658101',NULL),(173,'wa8s0QzpYMH0CHDxQ0ghEMQQLCuBl1',173,1,19,'2023-09-02 17:41:32.866175','2023-09-02 17:41:32.866175',NULL),(174,'wNU0OOosJAKCY2Z0QchQCQwQnB3fbH',174,1,1,'2023-09-02 17:42:40.795176','2023-09-02 17:42:40.795176',NULL),(175,'Yz8bo7JuDQKIyUk5MpcprJO10KUbHZ',175,1,19,'2023-09-02 17:43:09.164168','2023-09-02 17:43:09.164168',NULL),(176,'DEJuF2VUkzIbCxBJuqWaxfHVnezmr6',176,1,19,'2023-09-02 17:43:51.728125','2023-09-02 17:43:51.728125',NULL),(177,'0n5ffGDRI1JjchuQJl24kdC5N2rqoT',177,1,18,'2023-09-02 17:44:07.476561','2023-09-02 17:44:07.476561',NULL),(178,'Tng6DSsctPNxRoHWtHN2J4xi14ftSK',178,1,18,'2023-09-02 17:44:50.737756','2023-09-02 17:44:50.737756',NULL),(179,'AxTBn3gFg42jUdWmd5nmkPIQ6TbNvo',179,1,1,'2023-09-02 17:51:28.610540','2023-09-02 17:51:28.610540',NULL),(180,'7lXnd7VZYNcykos19mkNvG4IVVYlFU',180,1,18,'2023-09-02 17:52:17.078463','2023-09-02 17:52:17.078463',NULL),(181,'S9Hbom5mNUzl5RhYHwu3EpzuyMjsOv',181,1,18,'2023-09-02 17:54:48.129176','2023-09-02 17:54:48.129176',NULL),(182,'VEN8voym6YEUP6F7LBhJ3ib106ZME0',182,1,18,'2023-09-02 17:55:23.817563','2023-09-02 17:55:23.817563',NULL),(183,'AjItUcf3pT921bIf2yF67QoHcjkMpI',183,1,19,'2023-09-02 17:57:10.504912','2023-09-02 17:57:10.504912',NULL),(184,'vwNvSRAbZQbQQpD196XEVanw7Iylrv',184,1,18,'2023-09-02 17:57:21.065286','2023-09-02 17:57:21.065286',NULL),(185,'rkjZW1iqVWtZggRJY1FX6fZIzwqDjI',185,1,18,'2023-09-02 17:58:03.707717','2023-09-02 17:58:03.707717',NULL),(186,'VJmAsKEY4E6bGM7BoxeUrrOOqbWYHA',186,1,18,'2023-09-02 18:03:15.003472','2023-09-02 18:03:15.003472',NULL),(187,'ZSdLcP9eInFF90qV88GCp2JKvr7ChB',187,1,18,'2023-09-02 18:07:01.502879','2023-09-02 18:07:01.502879',NULL),(188,'hzpCGTvOUdO9mec5T0mVvo7wcfvXoC',188,1,18,'2023-09-02 18:07:51.120293','2023-09-02 18:07:51.120293',NULL),(189,'59hvrah9lZv8mFNfai1Fsc2Ys3wvaC',189,1,10,'2023-09-02 18:25:01.821606','2023-09-02 18:25:01.821606',NULL),(190,'ym8jTafxuu1SSEclJQguro5keUozPV',190,1,10,'2023-09-02 18:58:34.665659','2023-09-02 18:58:34.665659',NULL),(191,'7Y5rdoMASQKPxPjli5JzaQBE3Ghtfg',191,1,1,'2023-09-02 19:07:50.229354','2023-09-02 19:07:50.229354',NULL),(192,'4LgCOpSb3Zvf88w9oYBXd1EoybPeQt',192,1,10,'2023-09-02 19:13:10.305765','2023-09-02 19:13:10.305765',NULL),(193,'0yEQxizsQZGAhcZQijJsF3ioVoF7rx',193,1,1,'2023-09-04 07:35:19.141187','2023-09-04 07:35:19.141187',NULL),(194,'X8OTf1AaVdsejoQrsbmJuFaSkXVROb',194,1,1,'2023-09-04 11:41:20.761986','2023-09-04 11:41:20.761986',NULL),(195,'d1xamVbCyALc9v0xGaVZwzCXl26zTS',195,1,1,'2023-09-04 15:49:44.747577','2023-09-04 15:49:44.747577',NULL),(196,'jcGkB375k2ByjJ8KtrMW058qf0HWXe',196,1,10,'2023-09-04 17:27:20.931402','2023-09-04 17:27:20.931402',NULL),(197,'ssV3LUwC34jb2KQsXkwa13kRq0wSp3',197,1,18,'2023-09-04 17:27:37.426946','2023-09-04 17:27:37.426946',NULL),(198,'sJesbH2SpAASUbOCgSCdWhUS3WjeI9',198,1,7,'2023-09-04 17:27:53.718822','2023-09-04 17:27:53.718822',NULL),(199,'uOYTqBHXD3T4lCc5AoY6GCnuRvcjo6',199,1,2,'2023-09-04 17:28:24.589246','2023-09-04 17:28:24.589246',NULL),(200,'xjbCtjYIi0NRvGSaehPYhQj1I3oEq7',200,1,1,'2023-09-04 17:30:31.291701','2023-09-04 17:30:31.291701',NULL),(201,'11uw6cEHO0JZiWtbpCgb6gfe2w8iLy',201,1,2,'2023-09-04 17:30:48.088132','2023-09-04 17:30:48.088132',NULL),(202,'XEx3HKxulIqtunuKdhPduFPqix0CS4',202,1,1,'2023-09-04 17:33:47.336603','2023-09-04 17:33:47.336603',NULL),(203,'fNsJ39ApqubrtAlMIKEef2ySbvI4Aj',203,1,10,'2023-09-04 17:35:27.107371','2023-09-04 17:35:27.107371',NULL),(204,'R3R9lpWDXw3Qyf30wCHt0KYBeVyhqf',204,1,10,'2023-09-04 17:36:32.183321','2023-09-04 17:36:32.183321',NULL),(205,'Ygx7iW6mxHLY6kJOGq3ROq71IqvIxX',205,1,18,'2023-09-04 17:58:30.772415','2023-09-04 17:58:30.772415',NULL),(206,'6PJPY7bVgcyPymVqGsYn0s5h1OEjYY',206,1,1,'2023-09-04 17:59:07.299521','2023-09-04 17:59:07.299521',NULL),(207,'ecP2nsiCjcnepMQfcB7mWCQy5Y8waO',207,1,10,'2023-09-04 18:00:16.306196','2023-09-04 18:00:16.306196',NULL),(208,'h0ZmlAqdgvs09SMPkQ4H973bNPOE8T',208,1,1,'2023-09-04 18:24:29.968617','2023-09-04 18:24:29.968617',NULL),(209,'SJaVakAqy1h5D2MJZQltqGuPFhQeiJ',209,1,2,'2023-09-04 18:34:59.221441','2023-09-04 18:34:59.221441',NULL),(210,'OR5cjf7yXc862rNtsIHWU9nAVzgB3U',210,1,1,'2023-09-04 18:35:22.021768','2023-09-04 18:35:22.021768',NULL),(211,'bO5gi9cBGP77KYyOG5LFCuSUuVLKuh',211,1,2,'2023-09-04 18:35:46.057594','2023-09-04 18:35:46.057594',NULL),(212,'etczY7X8InlTiwhoVTi77dglRF6yfc',212,1,1,'2023-09-04 18:38:14.276855','2023-09-04 18:38:14.276855',NULL),(213,'FSnsA8tKq5WjU3aQoxrEFXrcbgEdzz',213,1,2,'2023-09-04 18:41:17.446940','2023-09-04 18:41:17.446940',NULL),(214,'fBsmH1zt4aPtqtRih5hTJt6YsbfLkt',214,1,18,'2023-09-04 18:46:26.851541','2023-09-04 18:46:26.851541',NULL),(215,'zmrgB9o4uL1PFTJ5FHnoU6mjcLWD89',215,1,1,'2023-09-04 18:46:50.406228','2023-09-04 18:46:50.406228',NULL),(216,'56Ql1urVufZUsVU13eu5IJaDAUUOMZ',216,1,1,'2023-09-05 05:23:39.693616','2023-09-05 05:23:39.693616',NULL),(217,'McjbLgm334oaTc4JFLVbwojgfzlLdb',217,1,1,'2023-09-05 11:50:08.251173','2023-09-05 11:50:08.252174',NULL),(218,'3bn7aKhekWjxkbZ2dg9eeWTuNDtqSX',218,1,1,'2023-09-05 17:08:22.417656','2023-09-05 17:08:22.417656',NULL),(219,'xBCxKCQuQEaOazioE8UaB5m4yhAPIh',219,1,1,'2023-09-05 17:45:09.819771','2023-09-05 17:45:09.819771',NULL),(220,'u9epUy4ZVH6vhDa2Ojhmt0XKkV0DNy',220,1,1,'2023-09-05 17:47:02.826878','2023-09-05 17:47:02.826878',NULL),(221,'nkZXBhDZPBKjxbHQmp0mc4PG0edHAR',221,1,1,'2023-09-05 17:48:10.297901','2023-09-05 17:48:10.297901',NULL),(222,'y9iC2B15WeixkWFPBZnvo2t7SXT08N',222,1,1,'2023-09-06 05:38:30.967150','2023-09-06 05:38:30.967150',NULL),(223,'UOdrgCH2afjf6pVPFoxoVeAVkY7K41',223,1,1,'2023-09-06 15:45:27.310478','2023-09-06 15:45:27.310478',NULL),(224,'DNYDBkw6H0uuMBv3fHERvZZCnWExFv',224,1,1,'2023-09-06 18:47:38.271902','2023-09-06 18:47:38.271902',NULL),(225,'80kWiVP226BkpKiUe8brPCFWpq8jqc',225,1,1,'2023-09-07 02:17:18.609565','2023-09-07 02:17:18.609565',NULL),(226,'6GONiFzbYrVJFQgpNR2VinhdDQXNG3',226,1,10,'2023-09-07 07:26:38.227567','2023-09-07 07:26:38.227567',NULL),(227,'PL9OyNs8ul0HnfAR3bC1xvat9V3kQX',227,1,1,'2023-09-07 08:57:15.527078','2023-09-07 08:57:15.527078',NULL),(228,'eaoT5cgKN0edar45gaqadchBwkqTVx',228,1,1,'2023-09-07 15:18:19.682231','2023-09-07 15:18:19.682231',NULL),(229,'9xpOP5M43AjGPNDstDYAJJPV4T7HHJ',229,1,1,'2023-09-08 04:46:08.576026','2023-09-08 04:46:08.576026',NULL),(230,'lEoESaJOYO6tFXJGJ1GyUGpMzXzmwU',230,1,10,'2023-09-08 04:47:08.189172','2023-09-08 04:47:08.189172',NULL),(231,'TlZDpK7POmbdJrhCmF7JwNpT2kClNh',231,1,2,'2023-09-08 04:47:36.789936','2023-09-08 04:47:36.789936',NULL),(232,'Px0BZUvy1uTyP692gmhEo0vsBEe4jj',232,1,7,'2023-09-08 04:47:54.539960','2023-09-08 04:47:54.539960',NULL),(233,'JwMUB1SAFNCZgOK6IFnu51IY3oUC4i',233,1,10,'2023-09-08 04:48:43.467845','2023-09-08 04:48:43.467845',NULL),(234,'C4BoRJQSFVp8Yc5FPXqp0uq41IiJqN',234,1,1,'2023-09-08 10:59:36.606849','2023-09-08 10:59:36.606849',NULL),(235,'NPCbAPSAHtp0Zs6H1a2aCXPTEugnHj',235,1,1,'2023-09-08 12:27:52.223169','2023-09-08 12:27:52.223169',NULL),(236,'c4a68yRNXst2WwywR03Hh9YtYb9FPx',236,1,10,'2023-09-08 18:20:36.119780','2023-09-08 18:20:36.119780',NULL),(237,'b6PAscYuPAYcMLYQGys8twr8PuUlXL',237,1,1,'2023-09-08 18:32:35.767241','2023-09-08 18:32:35.767241',NULL),(238,'NTN8Ni2LzWGYYDpuOboEETnEppBFCU',238,1,10,'2023-09-08 18:36:52.824413','2023-09-08 18:36:52.824413',NULL),(239,'YR26dU5MsaeHfFb8fjOk3piZwNKZO7',239,1,10,'2023-09-08 18:58:18.980337','2023-09-08 18:58:18.980337',NULL),(240,'jtOckUrkHXdOPSbBWNuxnd6Fquy2aW',240,1,10,'2023-09-08 18:59:03.471938','2023-09-08 18:59:03.471938',NULL),(241,'lCg3FPPWaoPf4gpCtSD3WlEmrJYTpQ',241,1,1,'2023-09-08 18:59:12.547964','2023-09-08 18:59:12.547964',NULL),(242,'dL2p5WPBjCVF8z50eWVbthcX05g8Ld',242,1,10,'2023-09-08 18:59:20.486293','2023-09-08 18:59:20.486293',NULL),(243,'l5TVxuU8GYsFxxfMVOUewPA3Vl60EU',243,1,10,'2023-09-08 18:59:37.652413','2023-09-08 18:59:37.652413',NULL),(244,'S9np3G5MZvfQQPjtQrAas6iOqNEYUg',244,1,10,'2023-09-08 19:06:48.381259','2023-09-08 19:06:48.381259',NULL),(245,'7j6p3hxzYbexwGotYZoJLMi8jok6yh',245,1,1,'2023-09-10 17:17:23.318557','2023-09-10 17:17:23.318557',NULL),(246,'1KuDucOun6p2hufVJ3MRnCdKKV9IgD',246,1,10,'2023-09-10 17:20:01.986199','2023-09-10 17:20:01.986199',NULL),(247,'fGtsCzd6gPeo5dXXgZrS3NmFIUJRUg',247,1,1,'2023-09-10 17:40:13.096165','2023-09-10 17:40:13.096165',NULL),(248,'26eJecdUNOzp35t1DfPb9EKLsjbS1j',248,1,1,'2023-09-11 05:42:55.574234','2023-09-11 05:42:55.574234',NULL),(249,'M1zV29KLGHRiwoaB7NiMxYK51PtBFY',249,1,1,'2023-09-12 05:07:09.607580','2023-09-12 05:07:09.607580',NULL),(250,'M12VqfMvzl6ytvHzn8OWSpJVYqJUfs',250,1,10,'2023-09-12 05:55:36.266222','2023-09-12 05:55:36.266222',NULL),(251,'wAI7xvtZsGERh62UlyMmDwBsFCUhff',251,1,10,'2023-09-12 16:18:45.741235','2023-09-12 16:18:45.741235',NULL),(252,'6cVWZ5b22zIGtTaWmUgG0dM5Ne4b4n',252,1,1,'2023-09-12 16:36:13.891937','2023-09-12 16:36:13.891937',NULL),(253,'kZy9eoSbLujmGZBKD5KzxfYWzKdvF0',253,1,10,'2023-09-13 05:19:24.230806','2023-09-13 05:19:24.230806',NULL),(254,'1IH5FG51CPFzLotUdYoceaAWzQlTn6',254,1,10,'2023-09-13 14:14:10.067296','2023-09-13 14:14:10.067296',NULL),(255,'77e3W9mdeZMdjVTsGeolGM8yaNbVig',255,1,1,'2023-09-13 18:53:41.105925','2023-09-13 18:53:41.105925',NULL),(256,'MOzUrWz5XuvVIbwWDeU2b2GyMq4sc9',256,1,1,'2023-09-15 05:18:44.502014','2023-09-15 05:18:44.502014',NULL),(257,'waNsidFOOXQ60jc3SVEEpBJzQj0aRy',257,1,1,'2023-09-15 14:25:31.668168','2023-09-15 14:25:31.668168',NULL),(258,'qsQgByNHdgukn4kff9y5lISq4ctaHx',258,1,1,'2023-09-15 14:48:58.904952','2023-09-15 14:48:58.904952',NULL),(259,'6lPprRJdKpmLGDcRLeGD1xXPWdbqQg',259,1,10,'2023-09-16 16:42:00.127309','2023-09-16 16:42:00.127309',NULL),(260,'obXkFjK9kspU7SGarYLYUvnt8S3y5g',260,1,1,'2023-09-17 08:30:18.556317','2023-09-17 08:30:18.556317',NULL),(261,'oSTlJOV10Y9hoI7RO4OZjIyIiDVkPO',261,1,10,'2023-09-17 13:19:38.787409','2023-09-17 13:19:38.787409',NULL),(262,'yZCKzR6MoJ8oKNtnQVpC2PvXVhAnto',262,1,1,'2023-09-17 13:20:41.192615','2023-09-17 13:20:41.192615',NULL),(263,'uu6yeXkSSbSkNIDgtS6vOaqmvCBWvw',263,1,10,'2023-09-17 13:21:22.968816','2023-09-17 13:21:22.968816',NULL),(264,'BLbzkcrtosudZKqCeCV5Xd6IkOoYig',264,1,10,'2023-09-17 13:52:18.805205','2023-09-17 13:52:18.805205',NULL),(265,'WZN3QVsgpILhbk2GSSEpMHWn1IpPt1',265,1,10,'2023-09-17 17:50:30.412417','2023-09-17 17:50:30.412417',NULL),(266,'8hH7fktEzki07TJGh2yYqY5mnJqivO',266,1,1,'2023-09-17 18:10:54.148037','2023-09-17 18:10:54.148037',NULL),(267,'4oAECqYcQfdLiPnT5vfHZEvJWjkK8R',267,1,1,'2023-09-17 18:13:25.166299','2023-09-17 18:13:25.166299',NULL),(268,'5E0il1ZrI6IJ8TDjHKSB2ZJPkvdQKB',268,1,10,'2023-09-17 18:19:17.967637','2023-09-17 18:19:17.967637',NULL),(269,'HbNfpFs6P2Rg5k4RTLROwzAXNnUawj',269,1,1,'2023-09-17 18:28:49.313635','2023-09-17 18:28:49.313635',NULL),(270,'FX3tzRZxTA8rCdZAkr7h8OgzAUYogA',270,1,10,'2023-09-17 18:32:00.959255','2023-09-17 18:32:00.959255',NULL),(271,'AU1OrOyK4kH609bpDoWDW27eSrhluG',271,1,10,'2023-09-17 18:36:22.481775','2023-09-17 18:36:22.481775',NULL),(272,'9KIay5C9CKxxnLm7bBn8W1deNLyxYj',272,1,1,'2023-09-17 18:39:22.149152','2023-09-17 18:39:22.149152',NULL),(273,'yp7Nqsx45h90Yu5utST35W8Zui4G7K',273,1,10,'2023-09-17 18:42:17.685396','2023-09-17 18:42:17.685396',NULL),(274,'4aWOXtBPV4PPMeiYzM3mugwZPjG26s',274,1,10,'2023-09-17 18:43:01.202536','2023-09-17 18:43:01.202536',NULL),(275,'bmJFZnGnJ7eAYLybBMASHDBlJvxZrx',275,1,1,'2023-09-17 18:57:32.632523','2023-09-17 18:57:32.632523',NULL),(276,'Y78a8x6hB4tXINIR3qQN3wLEbw9E9s',276,1,10,'2023-09-17 19:00:24.313924','2023-09-17 19:00:24.313924',NULL),(277,'2BxhvRJX3F5sgGMRfu9mZBb1doLBvv',277,1,10,'2023-09-17 19:24:16.175517','2023-09-17 19:24:16.175517',NULL),(278,'VaY9ZCqC5gd9hsWKOEXJ1yDL4GYUrN',278,1,10,'2023-09-17 19:25:03.646048','2023-09-17 19:25:03.646048',NULL),(279,'0HPSMeZPl7oodnFkODYSdY5oPQCyFs',279,1,10,'2023-09-18 04:24:11.709687','2023-09-18 04:24:11.709687',NULL),(280,'VErnNsaE5VAzDVDvoCgJneFNrO4L6A',280,1,10,'2023-09-18 04:25:50.357263','2023-09-18 04:25:50.357263',NULL),(281,'ZIWFCPvSo90uxTPIyEYzLPv1G96X9K',281,1,1,'2023-09-18 04:33:51.104373','2023-09-18 04:33:51.104373',NULL),(282,'HI6Bm6epPAEmfkAwTnBtImRumcEUgZ',282,1,10,'2023-09-18 09:38:39.951917','2023-09-18 09:38:39.951917',NULL),(283,'ayuRbR72wwyz4MkhhCfq9lWW28p7Rg',283,1,10,'2023-09-18 09:39:05.570970','2023-09-18 09:39:05.570970',NULL),(284,'Tj9rrce1AJC9M6GYiaPmxQq26puT7L',284,1,10,'2023-09-18 09:46:18.170305','2023-09-18 09:46:18.170305',NULL),(285,'TFoDVRWRx3nniocZuuHf500kS1nRdT',285,1,10,'2023-09-18 10:15:57.620493','2023-09-18 10:15:57.620493',NULL),(286,'woXMrri29rHEXYwpJ0QrZmN8RxDwnH',286,1,10,'2023-09-18 10:29:02.183086','2023-09-18 10:29:02.183086',NULL),(287,'a8AjLkFiZw54oG2zPTLyfwjpSPIGeC',287,1,1,'2023-09-18 10:29:13.379794','2023-09-18 10:29:13.379794',NULL),(288,'obkUuFUu1Gh2MNjSJBJwqVsutuzD0r',288,1,1,'2023-09-18 11:28:07.918516','2023-09-18 11:28:07.918516',NULL),(289,'42U4hWmkuwDo1Hya412zPTQtcBZ0VS',289,1,1,'2023-09-19 04:58:37.136623','2023-09-19 04:58:37.136623',NULL),(290,'fgkqXD6rCjUQoVMlOdpBlNwzje31GZ',290,1,1,'2023-09-21 02:59:49.913477','2023-09-21 02:59:49.913477',NULL),(291,'QO0fkacfcGm8pM1gx0D7by8suFOAQr',291,1,20,'2023-09-21 03:00:28.061520','2023-09-21 03:00:28.061520',NULL),(292,'E6IFHPUuxurgC9NqhRyCuiZy7VNr0E',292,1,20,'2023-09-21 03:32:33.205567','2023-09-21 03:32:33.205567',NULL),(293,'LW1NdIcgRN6yPQwwDIWMMC7amusNFD',293,1,20,'2023-09-21 04:44:55.694024','2023-09-21 04:44:55.694024',NULL),(294,'YwWjxv5xN0BVTm1C8DG79ig665vuoP',294,1,20,'2023-09-21 08:10:47.213124','2023-09-21 08:10:47.213124',NULL),(295,'ENZBCeUfzn6AYk29xg6fVFLyZRm1j4',295,1,21,'2023-09-21 11:43:12.201832','2023-09-21 11:43:12.201832',NULL),(296,'PSq9Fe6iNVqJbOKmcrcBeKRoBi7nbi',296,1,1,'2023-09-21 11:43:44.378821','2023-09-21 11:43:44.378821',NULL),(298,'H5s6tcOw7qGntKVqtLWpQdgJNgQxQh',298,1,1,'2023-09-21 18:19:53.824828','2023-09-21 18:19:53.824828',NULL),(299,'BnTpwXaw8OOaljdcTLvEyHJoKpEn49',299,1,1,'2023-09-21 18:22:10.195136','2023-09-21 18:22:10.195136',NULL),(301,'IeEy8Z7makTE8tSZUsKVH3g7eEHKUa',301,1,1,'2023-09-21 18:35:31.484321','2023-09-21 18:35:31.484321',NULL),(302,'0FCJlBxiyCAAdU4VGUQihhWWtGLgCg',302,1,1,'2023-09-22 07:19:45.860379','2023-09-22 07:19:45.860379',NULL),(303,'gVL6AwWrIZX8pfe1vTDHJRiFms1Oel',303,1,10,'2023-09-22 07:21:36.103419','2023-09-22 07:21:36.103419',NULL),(304,'fMXXoEOuQuiqGtePX0TuEQnVdrB4s5',304,1,10,'2023-09-22 07:38:50.544925','2023-09-22 07:38:50.544925',NULL),(305,'7ikEwp1wPoEYHUl4gz9I0W6UDghI3r',305,1,10,'2023-09-22 07:42:57.134207','2023-09-22 07:42:57.134207',NULL),(306,'S9TuHZjp1qbd2r5CrUMs786pE18eOH',306,1,10,'2023-09-22 07:50:47.923895','2023-09-22 07:50:47.923895',NULL);
/*!40000 ALTER TABLE `oauth2_provider_refreshtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_order`
--

DROP TABLE IF EXISTS `orders_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `receiver_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `receiver_phone` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `receiver_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `status` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method_id` bigint NOT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_order_payment_method_id_532d9073_fk_orders_pa` (`payment_method_id`),
  KEY `orders_order_user_id_e9b59eb1_fk_shops_user_id` (`user_id`),
  CONSTRAINT `orders_order_payment_method_id_532d9073_fk_orders_pa` FOREIGN KEY (`payment_method_id`) REFERENCES `orders_paymentmethod` (`id`),
  CONSTRAINT `orders_order_user_id_e9b59eb1_fk_shops_user_id` FOREIGN KEY (`user_id`) REFERENCES `shops_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_order`
--

LOCK TABLES `orders_order` WRITE;
/*!40000 ALTER TABLE `orders_order` DISABLE KEYS */;
INSERT INTO `orders_order` VALUES (1,'2023-08-29 16:47:45.463173','2023-08-29 16:47:45.466114','HD262017','Ken','123456789','Hồ Chí Minh',670000.00,'PENDING',1,10),(2,'2023-08-29 16:53:19.569329','2023-08-29 16:53:19.571482','HD700685','Ken','123456789','Hồ Chí Minh',1340000.00,'PENDING',2,10),(3,'2023-08-29 16:56:05.415196','2023-08-29 16:56:05.417264','HD167405','Ken','123456789','Hồ Chí Minh',250000.00,'PENDING',1,NULL),(4,'2023-08-29 16:57:08.073249','2023-08-29 16:57:08.076259','HD658186','Ken','123456789','Hồ Chí Minh',670000.00,'PENDING',2,NULL),(5,'2023-09-04 11:32:17.473113','2023-09-04 11:32:17.476178','HD678135','Ken','123456789','Hồ Chí Minh',60000.00,'PENDING',1,NULL),(6,'2023-09-04 12:02:14.954772','2023-09-04 12:02:14.958249','HD176691','Ken','123456789','Hồ Chí Minh',945000.00,'PENDING',1,NULL),(7,'2023-09-04 14:22:37.230882','2023-09-04 14:22:37.233691','HD847077','Ken','123456789','Hồ Chí Minh',600000.00,'PENDING',1,NULL),(8,'2023-09-05 17:45:01.905589','2023-09-05 17:45:01.908823','HD725231','Ken','123456789','Hồ Chí Minh',240000.00,'PENDING',1,NULL),(9,'2023-09-05 17:46:55.871386','2023-09-05 17:46:55.873263','HD438342','Ken','123456789','Hồ Chí Minh',2000000.00,'PENDING',1,NULL),(10,'2023-09-05 17:48:02.406207','2023-09-05 17:48:02.408978','HD180214','Ken','123456789','Hồ Chí Minh',290000.00,'PENDING',1,NULL),(11,'2023-09-08 06:47:57.700910','2023-09-08 06:47:57.704407','HD367062','','','',670000.00,'PENDING',2,NULL),(12,'2023-09-08 08:19:37.115338','2023-09-08 08:19:37.117328','HD880456','Ken','123456789','Hồ Chí Minh',420000.00,'PENDING',2,NULL),(13,'2023-09-08 08:23:38.494462','2023-09-08 08:23:38.496460','HD859366','Ken','123456789','Hồ Chí Minh',52000.00,'PENDING',2,NULL),(14,'2023-09-08 08:24:22.825379','2023-09-08 08:24:22.828141','HD720874','','','',40000.00,'PENDING',2,NULL),(15,'2023-09-08 08:32:32.696223','2023-09-08 08:32:32.699212','HD182642','','','',550000.00,'PENDING',2,NULL),(16,'2023-09-08 08:33:55.647148','2023-09-08 08:33:55.649788','HD656929','','','',695000.00,'PENDING',2,NULL),(17,'2023-09-08 08:39:40.997203','2023-09-08 08:39:40.999247','HD563527','','','',275000.00,'PENDING',2,NULL),(18,'2023-09-08 08:56:49.536755','2023-09-08 08:56:49.539766','HD566994','','','',670000.00,'PENDING',2,NULL),(19,'2023-09-08 10:03:20.041199','2023-09-08 10:03:20.044190','HD156396','Ken','123456789','Hồ Chí Minh',670000.00,'PENDING',2,NULL),(20,'2023-09-08 10:09:17.842912','2023-09-08 10:09:17.845902','HD444337','Ken','123456789','Hồ Chí Minh',670000.00,'PENDING',2,NULL),(21,'2023-09-08 10:18:51.113692','2023-09-08 10:18:51.115685','HD406880','Ken','123456789','Hồ Chí Minh',20000.00,'PENDING',2,NULL),(22,'2023-09-08 10:20:55.012470','2023-09-08 10:20:55.014464','HD879935','','','',670000.00,'PENDING',2,NULL),(23,'2023-09-08 10:25:46.194594','2023-09-08 10:25:46.197584','HD635705','','','',670000.00,'PENDING',2,NULL),(24,'2023-09-08 10:33:54.712838','2023-09-08 10:33:54.714835','HD137829','','','',40000.00,'PENDING',2,NULL),(25,'2023-09-08 10:39:58.812804','2023-09-08 10:39:58.814791','HD612286','','','',670000.00,'PENDING',2,NULL),(26,'2023-09-08 10:50:28.546879','2023-09-08 10:50:28.549868','MOMO755524','','','',670000.00,'PENDING',2,NULL),(27,'2023-09-08 10:51:22.974079','2023-09-08 10:51:22.976079','HD280506','','','',670000.00,'PENDING',1,NULL),(28,'2023-09-08 10:57:22.585636','2023-09-08 10:57:22.587673','MOMO302676','Ken','123456789','Hồ Chí Minh',695036.00,'PENDING',2,NULL),(29,'2023-09-08 11:10:32.094520','2023-09-08 11:10:32.096512','HD613292','Ken','123456789','Hồ Chí Minh',670000.00,'PENDING',1,1),(30,'2023-09-08 11:11:16.098889','2023-09-08 11:11:16.101379','HD837300','Ken','123456789','Hồ Chí Minh',32000.00,'PENDING',1,1),(31,'2023-09-08 11:11:30.093273','2023-09-08 11:11:30.095264','MOMO657414','Ken','123456789','Hồ Chí Minh',60000.00,'PENDING',2,1),(32,'2023-09-08 11:18:13.478527','2023-09-08 11:18:13.480521','MOMO396043','Ken','123456789','Hồ Chí Minh',250000.00,'PENDING',2,NULL),(33,'2023-09-08 11:34:42.278390','2023-09-08 11:34:42.280335','MOMO203072','Ken','123456789','Hồ Chí Minh',40000.00,'PENDING',2,NULL),(34,'2023-09-08 11:46:31.656077','2023-09-08 11:46:31.658721','HD561657','Ken','123456789','Hồ Chí Minh',670000.00,'PENDING',2,NULL),(35,'2023-09-08 11:47:39.699943','2023-09-08 11:47:39.702917','HD276292','Ken','123456789','Hồ Chí Minh',695000.00,'PENDING',2,NULL),(36,'2023-09-08 12:21:07.793602','2023-09-08 12:21:07.795819','HD865926','Ken','123456789','Hồ Chí Minh',670000.00,'PENDING',1,NULL),(37,'2023-09-08 12:28:07.580399','2023-09-08 12:28:07.583390','HD371369','Ken','123456789','Hồ Chí Minh',670000.00,'PENDING',2,1),(38,'2023-09-08 12:29:27.879507','2023-09-08 12:29:27.882497','MOMO440538','Ken','123456789','Hồ Chí Minh',670000.00,'PENDING',2,NULL),(39,'2023-09-08 12:31:27.019678','2023-09-08 12:31:27.020675','MOMO311248','Ken','123456789','Hồ Chí Minh',40000.00,'PENDING',2,NULL),(40,'2023-09-08 12:35:43.716410','2023-09-08 12:35:43.719400','MOMO399927','Ken','123456789','Hồ Chí Minh',945000.00,'PENDING',2,NULL),(41,'2023-09-08 12:37:29.805950','2023-09-08 12:37:29.807939','MOMO584467','Ken','123456789','Hồ Chí Minh',670000.00,'PENDING',2,NULL),(42,'2023-09-08 12:38:25.900122','2023-09-08 12:38:25.902130','MOMO239582','Ken','123456789','Hồ Chí Minh',670000.00,'PENDING',2,NULL),(43,'2023-09-08 12:38:56.912625','2023-09-08 12:38:56.914617','MOMO678976','Ken','123456789','Hồ Chí Minh',670000.00,'PENDING',2,NULL),(44,'2023-09-08 12:39:22.978176','2023-09-08 12:39:22.980169','MOMO327918','Ken','123456789','Hồ Chí Minh',275000.00,'PENDING',2,NULL),(45,'2023-09-08 18:37:16.558042','2023-09-08 18:37:16.560038','HD867021','Ken','123456789','Hồ Chí Minh',670000.00,'PENDING',1,10),(46,'2023-09-08 18:38:46.829667','2023-09-08 18:38:46.832657','MOMO686975','Ken','123456789','Hồ Chí Minh',40000.00,'PENDING',2,10),(47,'2023-09-21 11:59:41.257856','2023-09-21 11:59:41.260856','MOMO570747','Sakura','123456789','Hồ Chí Minh',695000.00,'PENDING',2,NULL);
/*!40000 ALTER TABLE `orders_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_orderdetail`
--

DROP TABLE IF EXISTS `orders_orderdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_orderdetail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) NOT NULL,
  `quantity` int NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `order_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_orderdetail_order_id_8d02dd1f_fk_orders_order_id` (`order_id`),
  KEY `orders_orderdetail_product_id_3ecd225e_fk_shops_product_id` (`product_id`),
  CONSTRAINT `orders_orderdetail_order_id_8d02dd1f_fk_orders_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders_order` (`id`),
  CONSTRAINT `orders_orderdetail_product_id_3ecd225e_fk_shops_product_id` FOREIGN KEY (`product_id`) REFERENCES `shops_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_orderdetail`
--

LOCK TABLES `orders_orderdetail` WRITE;
/*!40000 ALTER TABLE `orders_orderdetail` DISABLE KEYS */;
INSERT INTO `orders_orderdetail` VALUES (1,'2023-08-29 16:47:45.469615','2023-08-29 16:47:45.471501',1,250000.00,1,1),(2,'2023-08-29 16:47:45.474054','2023-08-29 16:47:45.475272',1,420000.00,1,2),(3,'2023-08-29 16:53:19.575509','2023-08-29 16:53:19.577205',2,250000.00,2,1),(4,'2023-08-29 16:53:19.580079','2023-08-29 16:53:19.581071',2,420000.00,2,2),(5,'2023-08-29 16:56:05.420035','2023-08-29 16:56:05.421893',1,250000.00,3,1),(6,'2023-08-29 16:57:08.079251','2023-08-29 16:57:08.081341',1,250000.00,4,1),(7,'2023-08-29 16:57:08.084103','2023-08-29 16:57:08.085081',1,420000.00,4,2),(8,'2023-09-04 14:22:37.236669','2023-09-04 14:22:37.237665',3,200000.00,7,22),(9,'2023-09-04 14:22:37.236669','2023-09-04 14:22:37.236669',1,200000.00,7,22),(10,'2023-09-05 17:45:01.911664','2023-09-05 17:45:01.913641',12,20000.00,8,17),(11,'2023-09-05 17:46:55.875393','2023-09-05 17:46:55.877769',8,250000.00,9,1),(12,'2023-09-05 17:48:02.412427','2023-09-05 17:48:02.414429',1,250000.00,10,1),(13,'2023-09-05 17:48:02.417175','2023-09-05 17:48:02.418735',2,20000.00,10,17),(14,'2023-09-08 06:47:57.708396','2023-09-08 06:47:57.710395',1,250000.00,11,1),(15,'2023-09-08 06:47:57.713379','2023-09-08 06:47:57.715380',1,420000.00,11,2),(16,'2023-09-08 08:19:37.122317','2023-09-08 08:19:37.124006',1,420000.00,12,2),(17,'2023-09-08 08:23:38.500443','2023-09-08 08:23:38.503779',1,20000.00,13,18),(18,'2023-09-08 08:23:38.508768','2023-09-08 08:23:38.511762',1,20000.00,13,17),(19,'2023-09-08 08:23:38.514747','2023-09-08 08:23:38.516746',1,12000.00,13,23),(20,'2023-09-08 08:24:22.830382','2023-09-08 08:24:22.832667',1,20000.00,14,18),(21,'2023-09-08 08:24:22.834365','2023-09-08 08:24:22.836419',1,20000.00,14,17),(22,'2023-09-08 08:32:32.703202','2023-09-08 08:32:32.705193',2,275000.00,15,16),(23,'2023-09-08 08:33:55.652533','2023-09-08 08:33:55.653988',1,275000.00,16,16),(24,'2023-09-08 08:33:55.655653','2023-09-08 08:33:55.657345',1,420000.00,16,2),(25,'2023-09-08 08:39:41.002875','2023-09-08 08:39:41.003870',1,275000.00,17,16),(26,'2023-09-08 08:56:49.542681','2023-09-08 08:56:49.543672',1,250000.00,18,1),(27,'2023-09-08 08:56:49.545888','2023-09-08 08:56:49.547993',1,420000.00,18,2),(28,'2023-09-08 10:03:20.048176','2023-09-08 10:03:20.050294',1,250000.00,19,1),(29,'2023-09-08 10:03:20.053886','2023-09-08 10:03:20.055732',1,420000.00,19,2),(30,'2023-09-08 10:09:17.849890','2023-09-08 10:09:17.851878',1,250000.00,20,1),(31,'2023-09-08 10:09:17.853871','2023-09-08 10:09:17.855909',1,420000.00,20,2),(32,'2023-09-08 10:18:51.119672','2023-09-08 10:18:51.121665',1,20000.00,21,18),(33,'2023-09-08 10:20:55.018455','2023-09-08 10:20:55.020448',1,250000.00,22,1),(34,'2023-09-08 10:20:55.022438','2023-09-08 10:20:55.024429',1,420000.00,22,2),(35,'2023-09-08 10:25:46.201571','2023-09-08 10:25:46.203565',1,250000.00,23,1),(36,'2023-09-08 10:25:46.207553','2023-09-08 10:25:46.209550',1,420000.00,23,2),(37,'2023-09-08 10:33:54.718817','2023-09-08 10:33:54.720809',2,20000.00,24,18),(38,'2023-09-08 10:39:58.818779','2023-09-08 10:39:58.820779',1,250000.00,25,1),(39,'2023-09-08 10:39:58.823762','2023-09-08 10:39:58.825756',1,420000.00,25,2),(40,'2023-09-08 10:50:28.553855','2023-09-08 10:50:28.554851',1,250000.00,26,1),(41,'2023-09-08 10:50:28.558845','2023-09-08 10:50:28.560831',1,420000.00,26,2),(42,'2023-09-08 10:51:22.980070','2023-09-08 10:51:22.982057',1,250000.00,27,1),(43,'2023-09-08 10:51:22.985405','2023-09-08 10:51:22.986680',1,420000.00,27,2),(44,'2023-09-08 10:57:22.590667','2023-09-08 10:57:22.592659',1,420000.00,28,2),(45,'2023-09-08 10:57:22.596652','2023-09-08 10:57:22.597647',1,275000.00,28,16),(46,'2023-09-08 10:57:22.600632','2023-09-08 10:57:22.602625',3,12.00,28,24),(47,'2023-09-08 11:10:32.100063','2023-09-08 11:10:32.102056',1,250000.00,29,1),(48,'2023-09-08 11:10:32.104056','2023-09-08 11:10:32.106047',1,420000.00,29,2),(49,'2023-09-08 11:11:16.103407','2023-09-08 11:11:16.105650',1,12000.00,30,23),(50,'2023-09-08 11:11:16.107651','2023-09-08 11:11:16.109785',1,20000.00,30,21),(51,'2023-09-08 11:11:30.098254','2023-09-08 11:11:30.100369',3,20000.00,31,18),(52,'2023-09-08 11:18:13.483857','2023-09-08 11:18:13.485851',1,250000.00,32,1),(53,'2023-09-08 11:34:42.284322','2023-09-08 11:34:42.286315',1,20000.00,33,18),(54,'2023-09-08 11:34:42.289311','2023-09-08 11:34:42.290318',1,20000.00,33,17),(55,'2023-09-08 11:46:31.660722','2023-09-08 11:46:31.663223',1,250000.00,34,1),(56,'2023-09-08 11:46:31.665218','2023-09-08 11:46:31.666960',1,420000.00,34,2),(57,'2023-09-08 11:47:39.705915','2023-09-08 11:47:39.707908',1,275000.00,35,16),(58,'2023-09-08 11:47:39.709996','2023-09-08 11:47:39.712375',1,420000.00,35,2),(59,'2023-09-08 12:21:07.797684','2023-09-08 12:21:07.800077',1,250000.00,36,1),(60,'2023-09-08 12:21:07.801732','2023-09-08 12:21:07.803853',1,420000.00,36,2),(61,'2023-09-08 12:28:07.587886','2023-09-08 12:28:07.590876',1,250000.00,37,1),(62,'2023-09-08 12:28:07.593871','2023-09-08 12:28:07.594868',1,420000.00,37,2),(63,'2023-09-08 12:29:27.885496','2023-09-08 12:29:27.887481',1,250000.00,38,1),(64,'2023-09-08 12:29:27.891471','2023-09-08 12:29:27.892468',1,420000.00,38,2),(65,'2023-09-08 12:31:27.025300','2023-09-08 12:31:27.027277',1,20000.00,39,17),(66,'2023-09-08 12:31:27.031264','2023-09-08 12:31:27.032260',1,20000.00,39,18),(67,'2023-09-08 12:35:43.723391','2023-09-08 12:35:43.725384',1,250000.00,40,1),(68,'2023-09-08 12:35:43.727374','2023-09-08 12:35:43.729889',1,420000.00,40,2),(69,'2023-09-08 12:35:43.732877','2023-09-08 12:35:43.733870',1,275000.00,40,16),(70,'2023-09-08 12:37:29.811385','2023-09-08 12:37:29.813320',1,250000.00,41,1),(71,'2023-09-08 12:37:29.815389','2023-09-08 12:37:29.817096',1,420000.00,41,2),(72,'2023-09-08 12:38:25.905785','2023-09-08 12:38:25.907778',1,250000.00,42,1),(73,'2023-09-08 12:38:25.910143','2023-09-08 12:38:25.920144',1,420000.00,42,2),(74,'2023-09-08 12:38:56.917608','2023-09-08 12:38:56.919602',1,250000.00,43,1),(75,'2023-09-08 12:38:56.921595','2023-09-08 12:38:56.923589',1,420000.00,43,2),(76,'2023-09-08 12:39:22.983161','2023-09-08 12:39:22.985152',1,275000.00,44,16),(77,'2023-09-08 18:37:16.563025','2023-09-08 18:37:16.565022',1,250000.00,45,1),(78,'2023-09-08 18:37:16.571436','2023-09-08 18:37:16.574805',1,420000.00,45,2),(79,'2023-09-08 18:38:46.835184','2023-09-08 18:38:46.837572',1,20000.00,46,18),(80,'2023-09-08 18:38:46.840566','2023-09-08 18:38:46.842560',1,20000.00,46,17),(81,'2023-09-21 11:59:41.264871','2023-09-21 11:59:41.266860',1,420000.00,47,2),(82,'2023-09-21 11:59:41.269859','2023-09-21 11:59:41.271859',1,275000.00,47,16);
/*!40000 ALTER TABLE `orders_orderdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_paymentmethod`
--

DROP TABLE IF EXISTS `orders_paymentmethod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_paymentmethod` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_paymentmethod`
--

LOCK TABLES `orders_paymentmethod` WRITE;
/*!40000 ALTER TABLE `orders_paymentmethod` DISABLE KEYS */;
INSERT INTO `orders_paymentmethod` VALUES (1,'Trực tiếp',1),(2,'MoMo',1);
/*!40000 ALTER TABLE `orders_paymentmethod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shops_category`
--

DROP TABLE IF EXISTS `shops_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shops_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shops_category`
--

LOCK TABLES `shops_category` WRITE;
/*!40000 ALTER TABLE `shops_category` DISABLE KEYS */;
INSERT INTO `shops_category` VALUES (4,'Body Soap & Shower Gel'),(7,'Book'),(5,'Electronic Device'),(2,'Fashion & Accessories'),(6,'Food'),(1,'Health & Beauty'),(3,'Sports & Travel');
/*!40000 ALTER TABLE `shops_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shops_comment`
--

DROP TABLE IF EXISTS `shops_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shops_comment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `is_active` tinyint(1) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) NOT NULL,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` bigint NOT NULL,
  `reply_to_id` bigint DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shops_comment_product_id_cf48e9c7_fk_shops_product_id` (`product_id`),
  KEY `shops_comment_reply_to_id_de0a475f_fk_shops_comment_id` (`reply_to_id`),
  KEY `shops_comment_user_id_c61bfefb_fk_shops_user_id` (`user_id`),
  CONSTRAINT `shops_comment_product_id_cf48e9c7_fk_shops_product_id` FOREIGN KEY (`product_id`) REFERENCES `shops_product` (`id`),
  CONSTRAINT `shops_comment_reply_to_id_de0a475f_fk_shops_comment_id` FOREIGN KEY (`reply_to_id`) REFERENCES `shops_comment` (`id`),
  CONSTRAINT `shops_comment_user_id_c61bfefb_fk_shops_user_id` FOREIGN KEY (`user_id`) REFERENCES `shops_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shops_comment`
--

LOCK TABLES `shops_comment` WRITE;
/*!40000 ALTER TABLE `shops_comment` DISABLE KEYS */;
INSERT INTO `shops_comment` VALUES (2,1,'2023-08-07 02:56:56.405286','2023-08-07 02:56:56.405286','Bình luận thêm nè',2,NULL,3),(3,1,'2023-08-07 03:04:34.112894','2023-08-07 03:04:34.112894','Phản hồi nè',2,2,2),(4,1,'2023-08-20 11:20:35.256102','2023-08-24 05:17:07.924440','Good!',1,NULL,10),(5,1,'2023-08-20 11:24:54.484987','2023-08-23 14:46:18.328545','ok',1,4,10),(6,1,'2023-08-20 11:30:29.061728','2023-08-20 11:30:29.061728','hi',1,NULL,10),(7,1,'2023-08-20 11:31:30.363209','2023-08-20 11:31:30.363209','hi',1,NULL,10),(8,1,'2023-08-20 11:32:12.373052','2023-08-20 11:32:12.373052','hi1',1,NULL,10),(10,1,'2023-08-21 17:05:01.975360','2023-08-21 17:05:01.975360','ok',2,3,10),(11,1,'2023-08-21 17:05:18.651473','2023-08-23 19:10:08.085684','ok',2,NULL,10),(12,1,'2023-08-21 17:09:46.908593','2023-08-23 19:23:01.096334','hi',2,11,10),(17,1,'2023-08-22 17:57:29.735814','2023-08-22 17:57:29.735814','test\ndemo',1,NULL,10),(18,1,'2023-08-22 17:57:41.929722','2023-08-22 17:57:41.929722','test\ntest test',1,NULL,10),(23,1,'2023-08-23 04:12:55.876510','2023-08-23 04:12:55.876510','hiiii',1,NULL,10),(24,1,'2023-08-23 04:49:06.496665','2023-08-23 04:49:06.496665','hi',1,NULL,10),(25,1,'2023-08-23 04:49:13.921689','2023-08-23 04:49:13.921689','okelaaaa',1,NULL,10),(26,1,'2023-08-23 05:10:39.427060','2023-08-23 05:10:39.427060','hey',1,NULL,10),(27,1,'2023-08-23 06:18:16.959322','2023-08-23 06:18:16.959322','hi',1,NULL,10),(28,1,'2023-08-23 06:18:38.879039','2023-08-23 06:18:38.879039','hi',1,NULL,10),(29,1,'2023-08-23 06:18:47.402069','2023-08-23 06:18:47.402069','hi',1,NULL,10),(30,1,'2023-08-23 07:19:35.907161','2023-08-23 07:19:35.907161','hi',1,NULL,10),(32,1,'2023-08-23 07:23:28.814386','2023-08-23 07:23:28.814386','oke 32',1,30,10),(33,1,'2023-08-23 07:24:07.913246','2023-08-23 07:24:07.913246','hi33',1,30,10),(34,1,'2023-08-23 07:24:45.167100','2023-08-23 07:24:45.167100','hi34',1,30,10),(35,1,'2023-08-23 07:25:38.751047','2023-08-23 07:25:38.751047','ok',1,30,10),(36,1,'2023-08-23 07:47:50.347749','2023-08-23 07:47:50.347749','hy',1,30,10),(42,1,'2023-08-23 12:43:22.634255','2023-08-23 12:43:22.634255','oke',1,NULL,10),(44,1,'2023-08-23 12:45:03.717890','2023-08-23 12:45:03.717890','ok42',1,42,10),(46,1,'2023-08-23 13:36:12.003904','2023-08-24 17:10:20.893701','hi 42 new',1,42,10),(58,1,'2023-08-23 13:53:27.006566','2023-08-23 13:53:27.006566','hi46',1,46,10),(59,1,'2023-08-23 13:53:41.378500','2023-08-23 13:53:41.378500','hi58',1,58,10),(60,1,'2023-08-23 13:54:00.701031','2023-08-23 13:54:00.701031','hi 59',1,59,10),(61,1,'2023-08-23 13:55:46.947762','2023-08-23 13:55:46.947762','hi',1,60,10),(62,1,'2023-08-23 13:56:58.163140','2023-08-23 13:56:58.163140','he',1,60,10),(63,1,'2023-08-23 13:58:02.921514','2023-08-23 13:58:02.921514','hiiii',1,62,10),(64,1,'2023-08-23 14:11:22.542915','2023-08-23 14:11:22.542915','hi',1,63,10),(65,1,'2023-08-23 14:11:32.637886','2023-08-23 14:11:32.637886','hi:))',1,64,10),(66,1,'2023-08-23 14:14:00.943066','2023-08-23 14:14:00.943066','hi65',1,65,10),(67,1,'2023-08-23 14:14:46.558438','2023-08-23 14:14:46.558438','hi66',1,66,10),(68,1,'2023-08-23 14:15:26.886527','2023-08-23 14:20:21.596576','hi68',1,67,10),(70,1,'2023-08-23 17:38:32.074426','2023-08-23 18:19:06.492244','hi70',1,NULL,10),(71,1,'2023-08-23 17:44:47.713369','2023-08-23 18:02:43.990042','hi7',1,70,10),(72,1,'2023-08-23 18:05:30.845495','2023-08-23 18:51:48.679254','ok1234',1,70,10),(73,1,'2023-08-23 18:52:31.386894','2023-08-24 05:08:22.385437','ok73',1,72,10),(74,1,'2023-08-24 05:21:11.665136','2023-08-24 05:21:11.665136','h',1,NULL,10),(75,1,'2023-08-24 05:21:26.726767','2023-08-25 05:07:07.157801','5',1,74,10),(76,1,'2023-08-24 05:24:12.678962','2023-08-24 05:24:12.678962','2',1,NULL,10),(77,1,'2023-08-24 16:50:03.056042','2023-08-24 16:50:03.056042','ok',1,76,10),(79,1,'2023-08-25 05:04:04.999208','2023-08-25 05:04:04.999208','hi2',1,76,10),(80,1,'2023-08-25 05:04:15.734404','2023-08-25 05:04:15.735403','oke',1,79,10),(81,1,'2023-09-12 16:19:24.357016','2023-09-12 16:19:24.357016','ok',1,NULL,10),(82,1,'2023-09-12 16:22:22.705397','2023-09-12 16:22:22.705397','ok',1,NULL,10),(83,1,'2023-09-12 16:27:49.286764','2023-09-12 16:27:49.286764','ok1',1,NULL,10),(84,1,'2023-09-12 16:28:15.354202','2023-09-12 16:28:15.354202','ok12',1,83,10),(85,1,'2023-09-13 14:35:53.430647','2023-09-13 14:35:53.430647','ok',1,82,10);
/*!40000 ALTER TABLE `shops_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shops_like`
--

DROP TABLE IF EXISTS `shops_like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shops_like` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `is_active` tinyint(1) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) NOT NULL,
  `liked` tinyint(1) NOT NULL,
  `product_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `shops_like_product_id_user_id_78c95573_uniq` (`product_id`,`user_id`),
  KEY `shops_like_user_id_94e6d06c_fk_shops_user_id` (`user_id`),
  CONSTRAINT `shops_like_product_id_d3bb940e_fk_shops_product_id` FOREIGN KEY (`product_id`) REFERENCES `shops_product` (`id`),
  CONSTRAINT `shops_like_user_id_94e6d06c_fk_shops_user_id` FOREIGN KEY (`user_id`) REFERENCES `shops_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shops_like`
--

LOCK TABLES `shops_like` WRITE;
/*!40000 ALTER TABLE `shops_like` DISABLE KEYS */;
INSERT INTO `shops_like` VALUES (1,1,'2023-08-19 18:35:57.701908','2023-09-12 16:29:52.674205',0,1,10),(2,1,'2023-08-21 05:01:36.737387','2023-09-12 16:29:55.389304',0,2,10),(3,1,'2023-09-08 18:50:23.458252','2023-09-12 16:29:59.844200',1,16,10),(4,1,'2023-09-08 18:50:32.360430','2023-09-08 18:50:51.069461',0,17,10),(5,1,'2023-09-08 18:50:35.177812','2023-09-08 19:06:56.809163',0,18,10),(6,1,'2023-09-08 19:07:03.149648','2023-09-08 19:13:18.071522',0,23,10);
/*!40000 ALTER TABLE `shops_like` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shops_notification`
--

DROP TABLE IF EXISTS `shops_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shops_notification` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `sender` int NOT NULL,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `recipient_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shops_notification_recipient_id_43e53350_fk_shops_user_id` (`recipient_id`),
  CONSTRAINT `shops_notification_recipient_id_43e53350_fk_shops_user_id` FOREIGN KEY (`recipient_id`) REFERENCES `shops_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shops_notification`
--

LOCK TABLES `shops_notification` WRITE;
/*!40000 ALTER TABLE `shops_notification` DISABLE KEYS */;
INSERT INTO `shops_notification` VALUES (1,8,'Đăng kí trở thành nhà bán hàng - seller1','2023-08-07 03:25:00.629513',1),(2,2,'Đã xác nhận tài khoản seller1 thành công.','2023-08-07 03:42:19.329011',8),(3,9,'Đăng kí trở thành nhà bán hàng - seller2','2023-08-07 03:50:03.073659',1),(4,9,'Đăng kí trở thành nhà bán hàng - seller2','2023-08-07 03:50:03.075872',2),(5,14,'Đăng kí trở thành nhà bán hàng - seller4','2023-08-24 13:06:48.671167',1),(6,14,'Đăng kí trở thành nhà bán hàng - seller4','2023-08-24 13:06:48.674303',2),(7,15,'Đăng kí trở thành nhà bán hàng - seller5','2023-08-24 13:16:52.741516',1),(8,15,'Đăng kí trở thành nhà bán hàng - seller5','2023-08-24 13:16:52.743536',2),(9,16,'Đăng kí trở thành nhà bán hàng - seller3','2023-08-24 16:20:38.243757',1),(10,16,'Đăng kí trở thành nhà bán hàng - seller3','2023-08-24 16:20:38.246649',2),(11,1,'Bạn vừa mới đăng kí trở thành nhà bán hàng - seller5! Vui lòng chờ xác nhận','2023-08-29 11:12:21.190914',18),(12,18,'Đăng kí trở thành nhà bán hàng - seller5','2023-08-29 11:12:21.194828',1),(13,18,'Đăng kí trở thành nhà bán hàng - seller5','2023-08-29 11:12:21.196765',2),(14,1,'Đã xác nhận tài khoản seller2 thành công.','2023-09-01 11:03:07.348196',9),(15,1,'Đã xác nhận tài khoản seller3 thành công.','2023-09-01 11:06:27.473889',16),(16,1,'Đã xác nhận tài khoản seller5 thành công.','2023-09-01 11:06:34.485658',18),(17,1,'Đã xác nhận tài khoản seller1 thành công.','2023-09-01 11:07:20.412121',8),(18,1,'Đã xác nhận tài khoản seller2 thành công.','2023-09-01 11:07:23.141202',9),(19,1,'Đã xác nhận tài khoản seller3 thành công.','2023-09-01 11:07:26.289651',16),(20,1,'Đã xác nhận tài khoản seller1 thành công.','2023-09-01 11:09:22.076263',8),(21,1,'Đã xác nhận tài khoản seller2 thành công.','2023-09-01 11:11:33.284694',9),(22,1,'Đã xác nhận tài khoản seller3 thành công.','2023-09-01 11:12:05.889317',16),(23,1,'Đã xác nhận tài khoản seller5 thành công.','2023-09-01 11:12:21.288310',18),(24,1,'Đã xác nhận tài khoản seller1 thành công.','2023-09-01 11:15:32.302500',8),(25,1,'Đã xác nhận tài khoản seller2 thành công.','2023-09-01 11:17:02.151598',9),(26,1,'Đã xác nhận tài khoản seller3 thành công.','2023-09-01 11:18:56.798479',16),(27,1,'Đã xác nhận tài khoản seller5 thành công.','2023-09-01 11:19:07.418307',18),(28,1,'Đã xác nhận tài khoản seller1 thành công.','2023-09-01 11:29:51.266900',8),(29,1,'Đã xác nhận tài khoản seller2 thành công.','2023-09-01 11:31:02.495831',9),(30,1,'Đã xác nhận tài khoản seller3 thành công.','2023-09-01 11:31:06.809507',16),(31,1,'Đã xác nhận tài khoản seller5 thành công.','2023-09-01 11:31:10.417647',18),(32,1,'Đã xác nhận tài khoản seller1 thành công.','2023-09-01 11:33:25.896045',8),(33,1,'Đã xác nhận tài khoản seller2 thành công.','2023-09-01 11:33:30.344686',9),(34,1,'Đã xác nhận tài khoản seller3 thành công.','2023-09-01 11:34:35.193155',16),(35,1,'Đã xác nhận tài khoản seller5 thành công.','2023-09-01 11:34:50.601111',18),(36,1,'Đã xác nhận tài khoản seller1 thành công.','2023-09-01 11:36:56.302866',8),(37,1,'Đã xác nhận tài khoản seller2 thành công.','2023-09-02 13:19:23.492288',9),(38,1,'Đã xác nhận tài khoản seller3 thành công.','2023-09-02 13:19:54.676522',16),(39,1,'Đã xác nhận tài khoản seller5 thành công.','2023-09-02 17:51:55.870305',18),(46,1,'Bạn vừa mới đăng kí trở thành nhà bán hàng - seller8! Vui lòng chờ xác nhận','2023-09-21 02:59:40.044899',20),(47,20,'Đăng kí trở thành nhà bán hàng - seller8','2023-09-21 02:59:40.048847',1),(48,20,'Đăng kí trở thành nhà bán hàng - seller8','2023-09-21 02:59:40.050519',2),(49,1,'Đã xác nhận tài khoản seller8 thành công.','2023-09-21 03:00:17.793078',20),(51,22,'Đăng kí trở thành nhà bán hàng - seller9','2023-09-21 11:43:38.046910',1),(52,22,'Đăng kí trở thành nhà bán hàng - seller9','2023-09-21 11:43:38.048697',2),(55,23,'Đăng kí trở thành nhà bán hàng - seller7','2023-09-21 18:23:44.919146',1),(56,23,'Đăng kí trở thành nhà bán hàng - seller7','2023-09-21 18:23:44.921095',2),(57,1,'Bạn vừa mới đăng kí trở thành nhà bán hàng - seller9! Vui lòng chờ xác nhận','2023-09-21 18:37:11.498263',24),(58,24,'Đăng kí trở thành nhà bán hàng - seller9','2023-09-21 18:37:11.500209',1),(59,24,'Đăng kí trở thành nhà bán hàng - seller9','2023-09-21 18:37:11.502212',2);
/*!40000 ALTER TABLE `shops_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shops_product`
--

DROP TABLE IF EXISTS `shops_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shops_product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `is_active` tinyint(1) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `price` decimal(10,2) NOT NULL,
  `category_id` bigint NOT NULL,
  `shop_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `shops_product_name_shop_id_62390af0_uniq` (`name`,`shop_id`),
  KEY `shops_product_category_id_75a38fc1_fk_shops_category_id` (`category_id`),
  KEY `shops_product_shop_id_b4feef5b_fk_shops_shop_id` (`shop_id`),
  CONSTRAINT `shops_product_category_id_75a38fc1_fk_shops_category_id` FOREIGN KEY (`category_id`) REFERENCES `shops_category` (`id`),
  CONSTRAINT `shops_product_shop_id_b4feef5b_fk_shops_shop_id` FOREIGN KEY (`shop_id`) REFERENCES `shops_shop` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shops_product`
--

LOCK TABLES `shops_product` WRITE;
/*!40000 ALTER TABLE `shops_product` DISABLE KEYS */;
INSERT INTO `shops_product` VALUES (1,1,'2023-08-04 14:41:36.955108','2023-09-12 16:37:19.312342','Sữa Tắm Nam Bath & Body Works Men’s Collection 295ml','fukimedia/products/2023/08/bath-body-works-noir_ln8ilj','<p>Sản phẩm sữa tắm Bath &amp; Body Works l&agrave; một trong những thương hiệu rất lớn ở Mỹ, sữa tắm với c&ocirc;ng dụng gi&uacute;p l&agrave;m sạch, cung cấp độ ẩm v&agrave; lưu lại hương thơm cho m&aacute;i t&oacute;c v&agrave; l&agrave;n da khỏe mạnh. Sản phẩm c&ograve;n rất tiện lợi cho nam v&igrave; chức năng 2 trong 1 vừa tắm to&agrave;n th&acirc;n v&agrave; gội sạch, vừa đem lại hương thơm m&aacute;t cho m&aacute;i t&oacute;c.</p>',250000.00,4,1),(2,1,'2023-08-04 14:44:51.772441','2023-08-30 17:41:20.180967','Xả Khô Nashi Instant Mask Styling 150ML','fukimedia/products/2023/08/xa-kho-nashi-instant_hwnlwz','<p>Xả Kh&ocirc; Nashi Instant Mask Styling 150ML</p>',420000.00,4,1),(16,1,'2023-08-06 18:24:30.099487','2023-08-06 18:24:32.434740','Thực Phẩm Bảo Vệ Sức Khỏe DHC Bổ Sung Vitamin C Hard Capsule Viên Nang Cứng 180v p1','fukimedia/products/2023/08/DHCVitaminC_c5k2d5','Thực Phẩm Bảo Vệ Sức Khỏe DHC Bổ Sung Vitamin C Hard Capsule Viên Nang Cứng 180v\n\nThực Phẩm Bảo Vệ Sức Khỏe DHC Bổ Sung Vitamin C Hard Capsule Viên Nang Cứng bổ sung vitamin C, vitamin B2 cho cơ thể; hỗ trợ duy trì sức khỏe của da, hỗ trợ giảm thâm da; giúp da sáng mịn. Sản phẩm có thành phần chính là Vitamin C có thể hấp thụ vào cơ thể cao gấp 3 lần sản phẩm thông thường, giúp thúc đẩy quá trình sản sinh năng lượng, tăng cường sức dẻo dai cho cơ thể, hoạt hoá tế bào và chống oxy hoá. Sản phẩm này không phải là thuốc và không có tác dụng thay thế thuốc chữa bệnh.',275000.00,3,11),(17,1,'2023-08-31 14:45:04.770923','2023-09-01 12:26:14.541449','new','fukimedia/products/2023/08/avatar_admin_a9c6sn','ok',20000.00,4,1),(18,1,'2023-08-31 14:45:10.623699','2023-08-31 14:45:11.446180','new1','fukimedia/products/2023/08/avatar_admin_vw6xaq','ok',20000.00,2,1),(19,1,'2023-08-31 14:45:14.383299','2023-08-31 14:45:15.070918','new2','fukimedia/products/2023/08/avatar_admin_lyth2w','ok',20000.00,2,1),(20,1,'2023-08-31 14:45:18.024002','2023-09-01 13:11:28.327035','new3','fukimedia/products/2023/08/avatar_admin_vh1zbt','ok',20000.00,2,1),(21,1,'2023-08-31 14:45:20.978511','2023-09-02 08:11:57.080502','anew4','fukimedia/products/2023/08/avatar_admin_vejd8t','ok',20000.00,2,1),(22,1,'2023-08-31 14:45:24.148956','2023-09-02 08:11:50.097504','bnew5','fukimedia/products/2023/08/avatar_admin_sevxbt','ok',200000.00,4,1),(23,1,'2023-09-02 15:27:04.943151','2023-09-02 15:27:07.214892','new','fukimedia/products/2023/09/sakura_lpayjf','',12000.00,6,27),(24,1,'2023-09-02 17:27:38.619108','2023-09-02 17:33:16.902486','demo','fukimedia/products/2023/09/avatar_default_vuiow5','<p>hello demo</p><p>NEW MEN sản phẩm</p>',12.00,7,1),(29,1,'2023-09-11 05:43:40.441468','2023-09-13 18:54:07.641554','demo1','fukimedia/products/2023/09/avatar_customer_xl1ihe','',200000.00,2,1),(30,1,'2023-09-12 05:10:11.715514','2023-09-12 05:10:13.703352','demo2','fukimedia/products/2023/09/sakura_pnfkpq','',120000.00,3,1),(31,1,'2023-09-12 05:25:19.796416','2023-09-12 05:25:21.833695','demo3','fukimedia/products/2023/09/sua-rua-mat-jack-black-tri-mun_qbimka','',200000.00,5,1),(32,1,'2023-09-21 05:27:32.251232','2023-09-21 05:52:56.570859','ok','fukimedia/products/2023/09/LifebuoyMatcha_ngun8x','',200000.00,3,45);
/*!40000 ALTER TABLE `shops_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shops_product_tags`
--

DROP TABLE IF EXISTS `shops_product_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shops_product_tags` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_id` bigint NOT NULL,
  `tag_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `shops_product_tags_product_id_tag_id_b376a181_uniq` (`product_id`,`tag_id`),
  KEY `shops_product_tags_tag_id_7944ef89_fk_shops_tag_id` (`tag_id`),
  CONSTRAINT `shops_product_tags_product_id_2a934f18_fk_shops_product_id` FOREIGN KEY (`product_id`) REFERENCES `shops_product` (`id`),
  CONSTRAINT `shops_product_tags_tag_id_7944ef89_fk_shops_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `shops_tag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=455 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shops_product_tags`
--

LOCK TABLES `shops_product_tags` WRITE;
/*!40000 ALTER TABLE `shops_product_tags` DISABLE KEYS */;
INSERT INTO `shops_product_tags` VALUES (1,1,1),(2,2,1),(3,2,2),(371,17,20),(372,17,22),(373,18,20),(374,18,22),(375,19,20),(376,19,22),(439,20,1),(437,20,20),(438,20,22),(440,21,1),(441,21,22),(442,21,30),(443,21,31),(448,23,1),(447,23,22),(452,29,22),(453,29,30),(450,30,22),(451,31,22),(454,32,22);
/*!40000 ALTER TABLE `shops_product_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shops_review`
--

DROP TABLE IF EXISTS `shops_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shops_review` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `is_active` tinyint(1) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) NOT NULL,
  `rate` smallint NOT NULL,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `shops_review_product_id_user_id_0b25d746_uniq` (`product_id`,`user_id`),
  KEY `shops_review_user_id_360896f9_fk_shops_user_id` (`user_id`),
  CONSTRAINT `shops_review_product_id_32e1afbb_fk_shops_product_id` FOREIGN KEY (`product_id`) REFERENCES `shops_product` (`id`),
  CONSTRAINT `shops_review_user_id_360896f9_fk_shops_user_id` FOREIGN KEY (`user_id`) REFERENCES `shops_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shops_review`
--

LOCK TABLES `shops_review` WRITE;
/*!40000 ALTER TABLE `shops_review` DISABLE KEYS */;
INSERT INTO `shops_review` VALUES (1,1,'2023-08-07 02:51:32.975225','2023-08-07 02:53:26.202627',4,'Sản phẩm tốt, giữ mùi hương lâu',1,3),(2,1,'2023-08-21 14:17:04.652117','2023-08-22 14:24:49.651995',2,'hiiiiiiiiii',1,10),(3,1,'2023-08-21 16:31:15.759164','2023-08-22 05:46:20.655881',0,'hihi',2,10);
/*!40000 ALTER TABLE `shops_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shops_shop`
--

DROP TABLE IF EXISTS `shops_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shops_shop` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `is_active` tinyint(1) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `avatar` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `shops_shop_user_id_84155b5b_fk_shops_user_id` FOREIGN KEY (`user_id`) REFERENCES `shops_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shops_shop`
--

LOCK TABLES `shops_shop` WRITE;
/*!40000 ALTER TABLE `shops_shop` DISABLE KEYS */;
INSERT INTO `shops_shop` VALUES (1,1,'2023-08-04 14:25:38.641395','2023-09-02 17:39:30.588867','Classic Store','<p><strong>CLASSIC – MEN’S GROOMING STORE</strong></p><p>Được thành lập từ năm 2016. Classic Store đã trở thành địa chỉ mua sắm những sản phẩm tạo kiểu tóc, làm đẹp uy tín dành riêng cho Nam giới.</p>','fukimedia/shops/2023/09/avatar_default_ctyl5x',1),(11,1,'2023-08-06 18:19:22.261156','2023-08-06 18:19:22.261156','Watsons','','/default/local-store_kj6ybp.png',7),(27,1,'2023-09-02 15:20:59.476060','2023-09-02 17:39:53.283238','seller seller2','<h2>ok</h2>','fukimedia/shops/2023/09/sakura_pqd1am',16),(30,1,'2023-09-02 18:08:38.274553','2023-09-02 18:08:38.274553','doremon','','/default/local-store_kj6ybp.png',18),(45,1,'2023-09-21 03:59:33.598253','2023-09-21 08:21:45.687105','Tiki',NULL,'/default/local-store_kj6ybp.png',20);
/*!40000 ALTER TABLE `shops_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shops_tag`
--

DROP TABLE IF EXISTS `shops_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shops_tag` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `is_active` tinyint(1) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shops_tag`
--

LOCK TABLES `shops_tag` WRITE;
/*!40000 ALTER TABLE `shops_tag` DISABLE KEYS */;
INSERT INTO `shops_tag` VALUES (1,1,'2023-08-05 12:34:20.057954','2023-08-05 12:34:20.057954','Men'),(2,1,'2023-08-05 12:34:24.623278','2023-08-05 12:34:24.623278','Women'),(10,1,'2023-08-06 11:37:21.088327','2023-08-06 11:37:21.088327','Health'),(11,1,'2023-08-30 04:58:15.116488','2023-08-30 04:58:15.116488','['),(12,1,'2023-08-30 04:58:15.123926','2023-08-30 04:58:15.123926','\"'),(13,1,'2023-08-30 04:58:15.127356','2023-08-30 04:58:15.128358','n'),(14,1,'2023-08-30 04:58:15.131542','2023-08-30 04:58:15.131542','e'),(15,1,'2023-08-30 04:58:15.136091','2023-08-30 04:58:15.136091','w'),(16,1,'2023-08-30 04:58:15.140286','2023-08-30 04:58:15.140286',','),(17,1,'2023-08-30 04:58:15.145432','2023-08-30 04:58:15.145432','o'),(18,1,'2023-08-30 04:58:15.150058','2023-08-30 04:58:15.150058','k'),(19,1,'2023-08-30 04:58:15.154464','2023-08-30 04:58:15.154464',']'),(20,1,'2023-08-30 05:22:08.144339','2023-08-30 05:22:08.144339','new'),(21,1,'2023-08-30 05:41:28.478467','2023-08-30 05:41:28.478467','oke'),(22,1,'2023-08-30 07:31:56.588734','2023-08-30 07:31:56.588734','ok'),(23,1,'2023-08-30 10:00:11.485993','2023-08-30 10:00:11.485993','phone'),(24,1,'2023-08-30 10:00:11.490953','2023-08-30 10:00:11.490953','fashion'),(25,1,'2023-08-30 19:18:05.735952','2023-08-30 19:18:05.735952','{\'name\': \'demo\'}'),(26,1,'2023-08-30 19:18:05.742584','2023-08-30 19:18:05.742584','{\'name\': \'new\'}'),(27,1,'2023-08-30 19:18:05.747565','2023-08-30 19:18:05.747565','{\'name\': \'ok\'}'),(28,1,'2023-08-30 19:19:10.362512','2023-08-30 19:19:10.362512','demo'),(29,1,'2023-08-30 19:21:55.350964','2023-08-30 19:21:55.350964','hi'),(30,1,'2023-08-31 06:39:40.373511','2023-08-31 06:39:40.373511','name'),(31,1,'2023-08-31 09:00:04.144730','2023-08-31 09:00:04.144730','tag');
/*!40000 ALTER TABLE `shops_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shops_user`
--

DROP TABLE IF EXISTS `shops_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shops_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `avatar` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_verified` tinyint(1) NOT NULL,
  `role` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shops_user`
--

LOCK TABLES `shops_user` WRITE;
/*!40000 ALTER TABLE `shops_user` DISABLE KEYS */;
INSERT INTO `shops_user` VALUES (1,'pbkdf2_sha256$600000$unZLZgIFpOdwsc25UPmAwO$pC3mwlIZBadWOjvgdiblbf95uOKq8Ma9Y8NFiPNoU0E=','2023-09-21 03:02:11.060079',1,'admin','admin','admin','admin@gmail.com',1,1,'2023-08-04 11:30:57.000000','fukimedia/users/2023/09/avatar_admin_hlmnjh',1,'Employee'),(2,'pbkdf2_sha256$600000$6CZjd2iU1zzpNjThaCYFTa$m/CIqDNiXGpQwRD3X0GpIziPCQNkAlTA5ZepeI1lKRE=',NULL,0,'employee','','','',0,1,'2023-08-04 14:12:33.000000','fukimedia/users/2023/08/avatar_employee_c3ygxh',1,'Employee'),(3,'pbkdf2_sha256$600000$6CZjd2iU1zzpNjThaCYFTa$m/CIqDNiXGpQwRD3X0GpIziPCQNkAlTA5ZepeI1lKRE=',NULL,0,'customer','','','',0,1,'2023-08-04 15:14:39.527266','fukimedia/users/2023/08/sakura_zhpsvi',1,'Customer'),(7,'pbkdf2_sha256$600000$kE6AOOa7tzFkGl04VAj0U2$aPcMfn9gdUYQitbezaDCDcfMriJsk8sPMICzef24Qrk=',NULL,0,'seller','','','',0,1,'2023-08-05 14:40:41.646247','fukimedia/users/2023/08/sakura_xhja3j',1,'Seller'),(8,'pbkdf2_sha256$600000$6miB9Khu20xqmyhzt64e7g$E/FyGWK1UK9FvZq8sygRmPTxuzaYkGvzPrRBupKsIeI=',NULL,0,'seller1','','','',0,1,'2023-08-07 03:25:00.443939','/default/avatar_default_pgdx3q.jpg',1,'Seller'),(9,'pbkdf2_sha256$600000$1GsscicRw0c8N9jvCHPwH6$q8z/pf3JmWbaGkZcMSZy4ozYH+e74bM2M80ybiDicZg=',NULL,0,'seller2','','','',0,1,'2023-08-07 03:50:02.867314','/default/avatar_default_pgdx3q.jpg',1,'Seller'),(10,'pbkdf2_sha256$600000$BEASI2JbEmXJpNOoniklH2$OKdCKJxSW9LVeiawZvL4VT7hGz63z7lR7yeUAUvLyfg=',NULL,0,'doremon','doremon','admin','admin@gmail.com',0,1,'2023-08-16 19:27:50.663843','fukimedia/users/2023/08/avatar_default_wz4yah',1,'Customer'),(16,'pbkdf2_sha256$600000$pV2QtwdMtT4dTMRLZcP0oo$ZLAFc1/5eWoVISwytgA7C8gMfwSrhz+F4E7mJF5Or6M=',NULL,0,'seller3','seller1','seller3','',0,1,'2023-08-24 16:20:38.049124','/default/avatar_default_pgdx3q.jpg',1,'Seller'),(17,'pbkdf2_sha256$600000$w6GtyXJSm7FJ4fOrFsndLZ$4FBtKmDAX02KKtBpg4JhETau9nwhuRJqcE5HsQw677A=',NULL,0,'seller4','seller','seller3','',0,1,'2023-08-24 16:21:05.039096','/default/avatar_default_pgdx3q.jpg',1,'Customer'),(18,'pbkdf2_sha256$600000$2XuMUTJ8HrwJMy6oM7MAAA$sL3FCz7F8TBldXBSVdjqTyUtMsREB8Z/N8gDs49xqXc=',NULL,0,'seller6','seller','seller3','',0,1,'2023-08-29 11:12:20.995231','/default/avatar_default_pgdx3q.jpg',1,'Seller'),(19,'pbkdf2_sha256$600000$FUoIF1ZhsQhDWCNTeKuA6n$dnPvEKxj2z0UeiqWsyPz64imYyu0fFQk7QDuMSkp1L0=',NULL,0,'sakura','sakura','','',0,1,'2023-09-02 13:44:33.592766','/default/avatar_default_pgdx3q.jpg',1,'Customer'),(20,'pbkdf2_sha256$600000$l4GkpnPSZVTteXjwK63ISk$AptGMEHamZ6ssaMkrr3rwLzJd5c7uZ8W0aqs/0CkEro=',NULL,0,'seller8','sakura','sakura','',0,1,'2023-09-21 02:59:39.861705','/default/avatar_default_pgdx3q.jpg',1,'Seller'),(21,'pbkdf2_sha256$600000$SnG5WsrSEdXQ4kDvxzHTI3$x4U8UGOhYvDwNFN33WwQTFg6lLwtTxGDvAPZ7LAP+Ng=',NULL,0,'ken','Ken','Nguyen','',0,1,'2023-09-21 11:43:06.503408','/default/avatar_default_pgdx3q.jpg',1,'Customer'),(24,'pbkdf2_sha256$600000$4G0XAVGQQ2GK7yMaAKAhwn$BfbcAq9/7Dq62uGV5+pEpNA9glYPLoUTuYBn0Dm4Hzg=',NULL,0,'seller9','seller','seller3','',0,1,'2023-09-21 18:37:11.322349','/default/avatar_default_pgdx3q.jpg',0,'Seller'),(25,'pbkdf2_sha256$600000$BciE2HawdgHBKlL5zkBiiq$jA8Ig/wgxwRi4bY+h0T19Ly62/LVsWapjcFx4EhD+fM=',NULL,0,'doremon01','doremon','Nguyen','',0,1,'2023-09-22 06:28:17.767795','/default/avatar_default_pgdx3q.jpg',1,'Customer');
/*!40000 ALTER TABLE `shops_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shops_user_groups`
--

DROP TABLE IF EXISTS `shops_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shops_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `shops_user_groups_user_id_group_id_96e497f3_uniq` (`user_id`,`group_id`),
  KEY `shops_user_groups_group_id_67ba31aa_fk_auth_group_id` (`group_id`),
  CONSTRAINT `shops_user_groups_group_id_67ba31aa_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `shops_user_groups_user_id_0b76fe3f_fk_shops_user_id` FOREIGN KEY (`user_id`) REFERENCES `shops_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shops_user_groups`
--

LOCK TABLES `shops_user_groups` WRITE;
/*!40000 ALTER TABLE `shops_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `shops_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shops_user_user_permissions`
--

DROP TABLE IF EXISTS `shops_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shops_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `shops_user_user_permissions_user_id_permission_id_4f52b5d1_uniq` (`user_id`,`permission_id`),
  KEY `shops_user_user_perm_permission_id_0d33e52c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `shops_user_user_perm_permission_id_0d33e52c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `shops_user_user_permissions_user_id_8755d56a_fk_shops_user_id` FOREIGN KEY (`user_id`) REFERENCES `shops_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shops_user_user_permissions`
--

LOCK TABLES `shops_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `shops_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `shops_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-11 12:37:40
