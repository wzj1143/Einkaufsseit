-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: vorrat_new
-- ------------------------------------------------------
-- Server version	8.0.22

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
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add bestellung info',7,'add_bestellunginfo'),(26,'Can change bestellung info',7,'change_bestellunginfo'),(27,'Can delete bestellung info',7,'delete_bestellunginfo'),(28,'Can view bestellung info',7,'view_bestellunginfo'),(29,'Can add bestellung details',8,'add_bestellungdetails'),(30,'Can change bestellung details',8,'change_bestellungdetails'),(31,'Can delete bestellung details',8,'delete_bestellungdetails'),(32,'Can view bestellung details',8,'view_bestellungdetails'),(33,'Can add waren kategorien',9,'add_warenkategorien'),(34,'Can change waren kategorien',9,'change_warenkategorien'),(35,'Can delete waren kategorien',9,'delete_warenkategorien'),(36,'Can view waren kategorien',9,'view_warenkategorien'),(37,'Can add waren info',10,'add_wareninfo'),(38,'Can change waren info',10,'change_wareninfo'),(39,'Can delete waren info',10,'delete_wareninfo'),(40,'Can view waren info',10,'view_wareninfo'),(41,'Can add user',11,'add_user'),(42,'Can change user',11,'change_user'),(43,'Can delete user',11,'delete_user'),(44,'Can view user',11,'view_user');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
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
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(8,'Einkaufswagen','bestellungdetails'),(7,'Einkaufswagen','bestellunginfo'),(6,'sessions','session'),(11,'Users','user'),(10,'Waren','wareninfo'),(9,'Waren','warenkategorien');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'Waren','0001_initial','2021-02-08 12:42:47.535615'),(2,'Users','0001_initial','2021-02-08 12:42:48.705263'),(3,'Einkaufswagen','0001_initial','2021-02-08 12:42:49.672112'),(4,'contenttypes','0001_initial','2021-02-08 12:42:52.025482'),(5,'auth','0001_initial','2021-02-08 12:42:56.517549'),(6,'admin','0001_initial','2021-02-08 12:43:03.818897'),(7,'admin','0002_logentry_remove_auto_add','2021-02-08 12:43:04.638854'),(8,'admin','0003_logentry_add_action_flag_choices','2021-02-08 12:43:04.849067'),(9,'contenttypes','0002_remove_content_type_name','2021-02-08 12:43:07.577642'),(10,'auth','0002_alter_permission_name_max_length','2021-02-08 12:43:09.509027'),(11,'auth','0003_alter_user_email_max_length','2021-02-08 12:43:13.353292'),(12,'auth','0004_alter_user_username_opts','2021-02-08 12:43:13.431325'),(13,'auth','0005_alter_user_last_login_null','2021-02-08 12:43:15.179042'),(14,'auth','0006_require_contenttypes_0002','2021-02-08 12:43:15.250461'),(15,'auth','0007_alter_validators_add_error_messages','2021-02-08 12:43:15.349506'),(16,'auth','0008_alter_user_username_max_length','2021-02-08 12:43:16.767936'),(17,'auth','0009_alter_user_last_name_max_length','2021-02-08 12:43:18.646768'),(18,'auth','0010_alter_group_name_max_length','2021-02-08 12:43:23.257401'),(19,'auth','0011_update_proxy_permissions','2021-02-08 12:43:23.427810'),(20,'auth','0012_alter_user_first_name_max_length','2021-02-08 12:43:25.126435'),(21,'sessions','0001_initial','2021-02-08 12:43:25.917501'),(22,'Einkaufswagen','0002_auto_20210208_1514','2021-02-08 14:15:07.981737');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('k0sudfj1dfoh1pet9fqcm6kribukqbmj','eyJpc19sb2dpbiI6dHJ1ZSwidXNlcl9uYW1lIjoidXNlcjEifQ:1l9Crx:aaqtU33dVKJjCat3uJcjhLyZx8H8pQPFKLNV8KTOhwE','2021-02-22 20:10:49.174780');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `einkaufswagen_bestellungdetails`
--

DROP TABLE IF EXISTS `einkaufswagen_bestellungdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `einkaufswagen_bestellungdetails` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Ware_Meng` int NOT NULL,
  `Ware_Bestellung_id` int NOT NULL,
  `Ware_Kate_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Einkaufswagen_bestel_Ware_Bestellung_id_0cc5bb43_fk_Einkaufsw` (`Ware_Bestellung_id`),
  KEY `Einkaufswagen_bestel_Ware_Kate_id_cb3319a5_fk_Waren_war` (`Ware_Kate_id`),
  CONSTRAINT `Einkaufswagen_bestel_Ware_Bestellung_id_0cc5bb43_fk_Einkaufsw` FOREIGN KEY (`Ware_Bestellung_id`) REFERENCES `einkaufswagen_bestellunginfo` (`id`),
  CONSTRAINT `Einkaufswagen_bestel_Ware_Kate_id_cb3319a5_fk_Waren_war` FOREIGN KEY (`Ware_Kate_id`) REFERENCES `waren_wareninfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `einkaufswagen_bestellungdetails`
--

LOCK TABLES `einkaufswagen_bestellungdetails` WRITE;
/*!40000 ALTER TABLE `einkaufswagen_bestellungdetails` DISABLE KEYS */;
INSERT INTO `einkaufswagen_bestellungdetails` VALUES (1,2,1,28),(2,1,2,28),(3,2,2,35),(4,3,3,19),(5,2,3,2),(6,1,3,10),(7,1,4,13),(8,3,4,3),(9,5,4,25),(10,2,5,22),(11,2,5,24);
/*!40000 ALTER TABLE `einkaufswagen_bestellungdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `einkaufswagen_bestellunginfo`
--

DROP TABLE IF EXISTS `einkaufswagen_bestellunginfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `einkaufswagen_bestellunginfo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Bestellung_Nummer` varchar(100) NOT NULL,
  `Bestellung_Add` varchar(200) NOT NULL,
  `Bestellung_Empf` varchar(100) NOT NULL,
  `Bestellung_Tel` varchar(100) NOT NULL,
  `Bestellung_transkost` double NOT NULL,
  `Bestellung_Anmerkung` varchar(1000) NOT NULL,
  `Bestellung_Zustand` int NOT NULL,
  `Bestellung_User_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Einkaufswagen_bestel_Bestellung_User_id_90c258c9_fk_Users_use` (`Bestellung_User_id`),
  CONSTRAINT `Einkaufswagen_bestel_Bestellung_User_id_90c258c9_fk_Users_use` FOREIGN KEY (`Bestellung_User_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `einkaufswagen_bestellunginfo`
--

LOCK TABLES `einkaufswagen_bestellunginfo` WRITE;
/*!40000 ALTER TABLE `einkaufswagen_bestellunginfo` DISABLE KEYS */;
INSERT INTO `einkaufswagen_bestellunginfo` VALUES (1,'1612793777727.23226405508.489999999','11','11','11',3.99,'11',1,1),(2,'1612795589654.967812478386.77','12','12','12',3.99,'12',1,1),(3,'1612802749156.6425859366.36','123','123','123',3.99,'123',1,2),(4,'1612804852710.280815212410.23','1234','1234','123',3.99,'12',1,2),(5,'1612815084953.03184023534.51','11','11','123',3.99,'12',1,1);
/*!40000 ALTER TABLE `einkaufswagen_bestellunginfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_user`
--

DROP TABLE IF EXISTS `users_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `password` varchar(255) NOT NULL,
  `adress` varchar(200) NOT NULL,
  `Email` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_user`
--

LOCK TABLES `users_user` WRITE;
/*!40000 ALTER TABLE `users_user` DISABLE KEYS */;
INSERT INTO `users_user` VALUES (1,'user1','12345','user1add','user1@11.de'),(2,'user2','12345','user2add','user2@12.de');
/*!40000 ALTER TABLE `users_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waren_wareninfo`
--

DROP TABLE IF EXISTS `waren_wareninfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `waren_wareninfo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Ware_Name` varchar(150) NOT NULL,
  `Ware_Preis` double NOT NULL,
  `Ware_Info` varchar(8000) NOT NULL,
  `Ware_Bild` varchar(100) NOT NULL,
  `Ware_Kategorien_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Waren_wareninfo_Ware_Kategorien_id_cc5fc998_fk_Waren_war` (`Ware_Kategorien_id`),
  CONSTRAINT `Waren_wareninfo_Ware_Kategorien_id_cc5fc998_fk_Waren_war` FOREIGN KEY (`Ware_Kategorien_id`) REFERENCES `waren_warenkategorien` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waren_wareninfo`
--

LOCK TABLES `waren_wareninfo` WRITE;
/*!40000 ALTER TABLE `waren_wareninfo` DISABLE KEYS */;
INSERT INTO `waren_wareninfo` VALUES (1,'Chinakohl',1.99,'Produziert aus Deutschland ','Chinakohl',2),(2,'Spinat',3.25,'Produziert aus Deutschland ','Spinat',2),(3,'Aubergine',0.87,'Produziert aus Deutschland ','Aubergine',2),(5,'Fleischtomaten',5.99,'Produziert aus Deutschland ','Fleischtomaten',2),(6,'Gurken',0.38,'Produziert aus Deutschland ','Gurken',2),(7,'Romana Salat',0.65,'Produziert aus Deutschland ','Romana Salat',2),(8,'Staudensellerie',1.27,'Produziert aus Deutschland ','Staudensellerie',2),(9,'Zucchini',3.9,'Produziert aus Deutschland ','Zucchini',2),(10,'Ananas',2.93,'Produziert aus China','Ananas',3),(11,'Apfel Kanzi',2.93,'Produziert aus Belgien','Apfel Kanzi',3),(12,'Chiquita Banana',0.39,'Produziert aus USA','Chiquita Banana',3),(13,'Drachenfrucht',5.99,'Produziert aus Deutchland','Drachenfrucht',3),(14,'Erdbeeren',11.98,'Produziert aus Deutschland ','Erdbeeren',3),(15,'Mango',2.44,'Produziert aus Deutschland ','Mango',3),(16,'Orange',0.61,'Produziert aus Deutschland ','Orange',3),(17,'Tafeltrauben',4.84,'Produziert aus Deutschland ','Tafeltrauben',3),(18,'Wassermelone',2.15,'Produziert aus Deutschland ','Wassermelone',3),(19,'Hahnchenschenkel',0.75,'Produziert aus Deutschland','Hahnchenschenkel',1),(20,'Hühnerbrust',9.99,'Produziert aus Deutschland','Hühnerbrust',1),(21,'Lammkoteletts',44.9,'Produziert aus Truthahn','Lammkoteletts',1),(22,'Lobster',38.99,'Produziert aus Deutschland','Lobster',1),(23,'Raucher Lachs',2.93,'Produziert aus Deutschland','Raucher Lachs',1),(24,'Rinder-Hüftsteak',5.96,'Produziert aus Deutschland','Rinder-Hüftsteak',1),(25,'Rind Suppenfleisch',16.9,'Produziert aus Deutschland','Rind Suppenfleisch',1),(26,'Schweinebauch',9.9,'Produziert aus Deutschland','Schweinebauch',1),(27,'Schweinerippen',9.99,'Produziert aus Deutschland','Schweinerippen',1),(28,'Absolut Vodka',14.99,'Produziert aus Schweden','Absolut Vodka',4),(29,'Barenmarke frische Vollmilch',1.25,'Produziert aus Deutschland','Barenmarke frische Vollmilch',4),(30,'Coca Cola',1.35,'Produziert aus Deutschland','Coca Cola',4),(31,'Fanta',1.35,'Produziert aus Deutschland','Fanta',4),(32,'Hohes C Orange',1.75,'Produziert aus Deutschland','Hohes C Orange',4),(33,'Krombacher Pils',0.95,'Produziert aus Deutschland','Krombacher Pils',4),(34,'Messmer Klassik',1.85,'Produziert aus Deutschland','Messmer Klassik',4),(35,'Nescafe',9.8,'Produziert aus Deutschland','Nescafe',4),(36,'Sprite',1.35,'Produziert aus Deutschland','Sprite',4);
/*!40000 ALTER TABLE `waren_wareninfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waren_warenkategorien`
--

DROP TABLE IF EXISTS `waren_warenkategorien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `waren_warenkategorien` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Waren_Kategorien_Name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waren_warenkategorien`
--

LOCK TABLES `waren_warenkategorien` WRITE;
/*!40000 ALTER TABLE `waren_warenkategorien` DISABLE KEYS */;
INSERT INTO `waren_warenkategorien` VALUES (1,'Fleisch'),(2,'Gemüse'),(3,'Obst'),(4,'Trinken');
/*!40000 ALTER TABLE `waren_warenkategorien` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-09  5:57:42
