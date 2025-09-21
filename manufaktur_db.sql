-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: manufactur_db
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

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

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_reset_tokens_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2019_12_14_000001_create_personal_access_tokens_table',1),(5,'2025_09_20_190342_create_products_table',1),(6,'2025_09_20_190347_create_production_plans_table',1),(7,'2025_09_20_190351_create_production_orders_table',1),(8,'2025_09_20_190356_create_production_logs_table',1),(9,'2025_09_21_052559_add_timestamps_to_production_logs_table',2),(10,'2025_09_21_060801_add_stock_to_products_table',3);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

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
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
INSERT INTO `personal_access_tokens` VALUES (32,'App\\Models\\User',2,'auth-token','a2473c21e780093f011f086f19d2e68d66dda3ba18e36e8c71ad97e1c06ca9d4','[\"*\"]','2025-09-20 21:46:11',NULL,'2025-09-20 21:45:28','2025-09-20 21:46:11'),(34,'App\\Models\\User',3,'auth-token','133c8d450c3f5479a3548f2ad61fc05b544c3e6487945e6b0327c82812ebabda','[\"*\"]','2025-09-20 22:15:47',NULL,'2025-09-20 22:15:18','2025-09-20 22:15:47'),(35,'App\\Models\\User',1,'auth-token','22a82b700dad8158f1dc80e3b50b9238a0e6097022b839ac551da9fe1886b980','[\"*\"]','2025-09-20 22:18:15',NULL,'2025-09-20 22:15:57','2025-09-20 22:18:15');
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `production_logs`
--

DROP TABLE IF EXISTS `production_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `production_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `production_order_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `status_change` enum('menunggu','sedang dikerjakan','selesai') NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `production_logs_production_order_id_foreign` (`production_order_id`),
  KEY `production_logs_user_id_foreign` (`user_id`),
  CONSTRAINT `production_logs_production_order_id_foreign` FOREIGN KEY (`production_order_id`) REFERENCES `production_orders` (`id`),
  CONSTRAINT `production_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `production_logs`
--

LOCK TABLES `production_logs` WRITE;
/*!40000 ALTER TABLE `production_logs` DISABLE KEYS */;
INSERT INTO `production_logs` VALUES (1,1,3,'sedang dikerjakan','2025-09-21 05:26:58','Pengerjaan order dimulai.','2025-09-20 21:26:58','2025-09-20 21:26:58'),(2,1,3,'selesai','2025-09-21 05:37:31','Pengerjaan order selesai. Jumlah aktual: 2, Reject: 0','2025-09-20 21:37:31','2025-09-20 21:37:31'),(3,1,3,'sedang dikerjakan','2025-09-21 05:40:45','Pengerjaan order dimulai.','2025-09-20 21:40:45','2025-09-20 21:40:45'),(4,1,3,'selesai','2025-09-21 05:40:51','Pengerjaan order selesai. Jumlah aktual: 3, Reject: 0','2025-09-20 21:40:51','2025-09-20 21:40:51'),(5,2,3,'sedang dikerjakan','2025-09-21 06:15:39','Pengerjaan order dimulai.','2025-09-20 22:15:39','2025-09-20 22:15:39'),(6,2,3,'selesai','2025-09-21 06:15:47','Pengerjaan order selesai. Jumlah aktual: 5, Reject: 1','2025-09-20 22:15:47','2025-09-20 22:15:47');
/*!40000 ALTER TABLE `production_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `production_orders`
--

DROP TABLE IF EXISTS `production_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `production_orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `production_plan_id` bigint(20) unsigned NOT NULL,
  `target_completion_date` date NOT NULL,
  `actual_quantity` int(10) unsigned DEFAULT NULL,
  `reject_quantity` int(10) unsigned DEFAULT NULL,
  `status` enum('menunggu','sedang dikerjakan','selesai') NOT NULL DEFAULT 'menunggu',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `production_orders_production_plan_id_unique` (`production_plan_id`),
  CONSTRAINT `production_orders_production_plan_id_foreign` FOREIGN KEY (`production_plan_id`) REFERENCES `production_plans` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `production_orders`
--

LOCK TABLES `production_orders` WRITE;
/*!40000 ALTER TABLE `production_orders` DISABLE KEYS */;
INSERT INTO `production_orders` VALUES (1,3,'2025-09-24',3,0,'selesai','2025-09-20 21:06:15','2025-09-20 21:40:51'),(2,4,'2025-09-25',5,1,'selesai','2025-09-20 21:48:34','2025-09-20 22:15:47'),(3,5,'2025-09-26',NULL,NULL,'menunggu','2025-09-20 22:15:05','2025-09-20 22:15:05');
/*!40000 ALTER TABLE `production_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `production_plans`
--

DROP TABLE IF EXISTS `production_plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `production_plans` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `quantity` int(10) unsigned NOT NULL,
  `due_date` date NOT NULL,
  `status` enum('dibuat','menunggu persetujuan','disetujui','ditolak','diproses') NOT NULL DEFAULT 'dibuat',
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `production_plans_user_id_foreign` (`user_id`),
  KEY `production_plans_product_id_foreign` (`product_id`),
  CONSTRAINT `production_plans_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `production_plans_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `production_plans`
--

LOCK TABLES `production_plans` WRITE;
/*!40000 ALTER TABLE `production_plans` DISABLE KEYS */;
INSERT INTO `production_plans` VALUES (3,2,2,1,'2025-09-24','diproses','-','2025-09-20 20:54:28','2025-09-20 21:37:31'),(4,2,2,2,'2025-09-25','diproses','-','2025-09-20 21:00:23','2025-09-20 22:15:47'),(5,2,2,3,'2025-09-26','disetujui','sadasd','2025-09-20 21:01:23','2025-09-20 22:15:05'),(6,2,1,3,'2025-09-24','ditolak',NULL,'2025-09-20 21:46:10','2025-09-20 21:58:46');
/*!40000 ALTER TABLE `production_plans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `sku` varchar(255) NOT NULL,
  `unit` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_sku_unique` (`sku`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Widget Aluminium',0,'AL-WGT-001','Pcs','2025-09-20 11:47:26','2025-09-20 11:47:26'),(2,'Gasket Karet 10mm',5,'KR-GSK-001','Pcs','2025-09-20 11:47:26','2025-09-20 22:15:47'),(3,'Bolt Stainless Steel M8',0,'ST-BLT-001','Kg','2025-09-20 11:47:26','2025-09-20 11:47:26');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('Manager','Staff_PPIC','Staff_Produksi') NOT NULL DEFAULT 'Staff_PPIC',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Manager','manager@gmail.com',NULL,'$2y$12$cZY8YwKBK55TxnU6rxCFoejVfVFTXjmkbZaKpXnZRm.6uJ4spzRd.','Manager',NULL,'2025-09-20 11:47:25','2025-09-20 11:47:25'),(2,'Staff PPIC','ppic@gmail.com',NULL,'$2y$12$D8ouiiRtreiVX31SxiT3JeosFu8Q27jfxJG4wIGd0ta1/MX7HVdrS','Staff_PPIC',NULL,'2025-09-20 11:47:26','2025-09-20 11:47:26'),(3,'Staff Produksi','produksi@gmail.com',NULL,'$2y$12$XHK6aSwR1/vF0kRAaHHMiO2QZURBtdDjoJ/gk2NyQMurlP9XQBWLm','Staff_Produksi',NULL,'2025-09-20 11:47:26','2025-09-20 11:47:26');
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

-- Dump completed on 2025-09-21 14:23:16
