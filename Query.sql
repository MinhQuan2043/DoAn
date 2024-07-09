-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: hotel_booking
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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `address_line` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--paymenthotel_managerhotelbookingbooked_roomavailabilityadminaddressavailabilityuserrole

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'15 Đ. Tôn Đức Thắng, Bến Nghé, Quận 1','Hồ Chí Minh','Việt Nam'),(2,'22-36 Đ. Nguyễn Huệ, Bến Nghé, Quận 1','Hồ Chí Minh','Việt Nam'),(3,'2 Công trường Lam Sơn, Bến Nghé, Quận 1','Hồ Chí Minh','Việt Nam'),(4,'05 P. Từ Hoa, Quảng An, Tây Hồ','Hà Nội','Việt Nam'),(5,'K5, Đ. Nghi Tàm/11 Đ. Xuân Diệu, Quảng An, Tây Hồ','Hà Nội','Việt Nam'),(6,'Urban Area, Keangnam Hanoi Landmark Tower, Plot E6, Keangnam, Cầu Giấy','Hà Nội','Việt Nam');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_hawikyhwwfvbnog5byokutpff` (`user_id`),
  CONSTRAINT `FK8ahhk8vqegfrt6pd1p9i03aej` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`mysql
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,1);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `availability`
--

DROP TABLE IF EXISTS `availability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `availability` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `available_rooms` int NOT NULL,
  `date` date NOT NULL,
  `hotel_id` bigint NOT NULL,
  `room_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9wrk0t8eqhhaci64arkcllk8c` (`hotel_id`),
  KEY `FKp6w1yyf6rerg3ihlnpdsgidrg` (`room_id`),
  CONSTRAINT `FK9wrk0t8eqhhaci64arkcllk8c` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`id`),
  CONSTRAINT `FKp6w1yyf6rerg3ihlnpdsgidrg` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `availability`
--

LOCK TABLES `availability` WRITE;
/*!40000 ALTER TABLE `availability` DISABLE KEYS */;
INSERT INTO `availability` VALUES (1,5,'2023-09-01',4,7),(2,7,'2023-09-02',4,8),(3,34,'2024-06-27',1,1);
/*!40000 ALTER TABLE `availability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booked_room`
--

DROP TABLE IF EXISTS `booked_room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booked_room` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `count` int NOT NULL,
  `room_type` enum('DOUBLE','SINGLE') NOT NULL,
  `booking_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKbpl3is8trxr5ghidw8sik4ix1` (`booking_id`),
  CONSTRAINT `FKbpl3is8trxr5ghidw8sik4ix1` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booked_room`
--

LOCK TABLES `booked_room` WRITE;
/*!40000 ALTER TABLE `booked_room` DISABLE KEYS */;
INSERT INTO `booked_room` VALUES (1,1,'SINGLE',1);
/*!40000 ALTER TABLE `booked_room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `booking_date` datetime(6) DEFAULT NULL,
  `checkin_date` date NOT NULL,
  `checkout_date` date NOT NULL,
  `confirmation_number` varchar(255) NOT NULL,
  `customer_id` bigint NOT NULL,
  `hotel_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_nxoscxy53bg6iswii0ku8ng5j` (`confirmation_number`),
  KEY `FKlnnelfsha11xmo2ndjq66fvro` (`customer_id`),
  KEY `FKhacdq9bfa3r9xdimovsnonbyi` (`hotel_id`),
  CONSTRAINT `FKhacdq9bfa3r9xdimovsnonbyi` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`id`),
  CONSTRAINT `FKlnnelfsha11xmo2ndjq66fvro` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (1,'2024-06-27 22:06:16.387958','2024-06-27','2024-06-28','bc21a5ec',2,1);
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_j7ja2xvrxudhvssosd4nu1o92` (`user_id`),
  CONSTRAINT `FKj8dlm21j202cadsbfkoem0s58` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,2),(2,6);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel`
--

DROP TABLE IF EXISTS `hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotel` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `address_id` bigint DEFAULT NULL,
  `hotel_manager_id` bigint NOT NULL,
  `image` varchar(255) NOT NULL,
  `map` mediumtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_dcpycvarhghd0g3l6reewmsak` (`name`),
  UNIQUE KEY `UK_owt8iiq4d3dff6uvmdyjbmmar` (`address_id`),
  KEY `FKkcfgroubk0buae4mmn359qv87` (`hotel_manager_id`),
  CONSTRAINT `FK48m0ei7s6biikxbrku04slp0s` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`),
  CONSTRAINT `FKkcfgroubk0buae4mmn359qv87` FOREIGN KEY (`hotel_manager_id`) REFERENCES `hotel_manager` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel`
--

LOCK TABLES `hotel` WRITE;
/*!40000 ALTER TABLE `hotel` DISABLE KEYS */;
INSERT INTO `hotel` VALUES (1,'Renaissance Riverside Sài Gòn',1,1,'https://content.r9cdn.net/rimg/himg/71/82/b7/leonardo-6373-155678908-127906.jpg?width=500&height=350&xhint=1000&yhint=1980&crop=true','<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3054.4395413739767!2d106.70542180469475!3d10.774399999999998!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752f24260a5a85%3A0x4b49ec5f1ee03081!2zS2jDoWNoIHPhuqFuIFJlbmFpc3NhbmNlIFJpdmVyc2lkZSBTw6BpIEfDsm4!5e1!3m2!1svi!2s!4v1719833810621!5m2!1svi!2s\" width=\"550\" height=\"310\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),(2,'The Reverie Sài Gòn',2,1,'https://reviewvilla.vn/wp-content/uploads/2022/03/The-Reverie-Saigon-1.jpg','<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3054.4628883919695!2d106.70470733780276!3d10.772098367349033!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752f46b91ff799%3A0xb004d0342a95cfa0!2zS2jDoWNoIHPhuqFuIFRoZSBSZXZlcmllIFPDoGkgR8Oybg!5e1!3m2!1svi!2s!4v1719836126696!5m2!1svi!2s\" width=\"550\" height=\"310\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),(3,'Park Hyatt Saigon',3,1,'https://cf.bstatic.com/xdata/images/hotel/max1024x768/137125647.jpg?k=fe213aa4a69b318c0cd99672f551f8f96883ee5c7a61e25ed70168076e3d84f1&o=&hp=1','<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3054.4055370413494!2d106.70247564968416!3d10.777751399999996!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752f462f8cac37%3A0x3d4cc4e3c1887abb!2sPark%20Hyatt%20Saigon!5e1!3m2!1svi!2s!4v1719836248857!5m2!1svi!2s\" width=\"550\" height=\"310\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),(4,'InterContinental Hà Nội Westlake',4,2,'https://cf.bstatic.com/xdata/images/hotel/max1024x768/8878373.jpg?k=76b2656c9acbf898eb93ebe48bda45538b7adfd3ce7d29387c946b3c5acd959c&o=&hp=1','<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d7947.7647615405995!2d105.8263659531329!3d21.058739032952495!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135aa5504cf4f8d%3A0x38355eb7fe4e696d!2sInterContinental%20H%C3%A0%20N%E1%BB%99i%20Westlake!5e1!3m2!1svi!2s!4v1719836353664!5m2!1svi!2s\" width=\"550\" height=\"310\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),(5,'Sheraton Hanoi Hotel',5,2,'https://tourduthuyenhalong.com.vn/wp-content/uploads/2018/07/khach-san-sheraton-ha-ni.jpg','<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d7947.7647615405995!2d105.8263659531329!3d21.058739032952495!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135aa55c73c75b3%3A0x6621f45772c25656!2sSheraton%20Hanoi%20Hotel!5e1!3m2!1svi!2s!4v1719836436150!5m2!1svi!2s\" width=\"550\" height=\"310\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),(6,'Intercontinental Hanoi Landmark Hotel',6,2,'https://landmark72.intercontinental.com/uploads/DSC04742.jpg','<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d22922.950943738473!2d105.76572426659656!3d21.018072902050076!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135ab54df748467%3A0xbce19e4662752253!2sIntercontinental%20Hanoi%20Landmark%20Hotel!5e1!3m2!1svi!2s!4v1719836572159!5m2!1svi!2s\" width=\"550\" height=\"310\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>');
/*!40000 ALTER TABLE `hotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel_manager`
--

DROP TABLE IF EXISTS `hotel_manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotel_manager` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_82ejf160xpaxvgstsl5t6xyay` (`user_id`),
  CONSTRAINT `FK1v3ld762qbgs2y7nf1lf28eqb` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel_manager`
--

LOCK TABLES `hotel_manager` WRITE;
/*!40000 ALTER TABLE `hotel_manager` DISABLE KEYS */;
INSERT INTO `hotel_manager` VALUES (1,3),(2,4),(3,5);
/*!40000 ALTER TABLE `hotel_manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `currency` enum('EUR','TRY','USD') NOT NULL,
  `payment_date` datetime(6) DEFAULT NULL,
  `payment_method` enum('CREDIT_CARD','DEBIT_CARD','PAYPAL') NOT NULL,
  `payment_status` enum('COMPLETED','FAILED','PENDING','REFUNDED') NOT NULL,
  `total_price` decimal(38,2) NOT NULL,
  `transaction_id` varchar(255) NOT NULL,
  `booking_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_tacis04bqalsngo46yvxlo7yb` (`transaction_id`),
  UNIQUE KEY `UK_ku02qy6369hn9uhy3n7jk9v6e` (`booking_id`),
  CONSTRAINT `FKqewrl4xrv9eiad6eab3aoja65` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,'USD','2024-06-27 22:06:16.393061','CREDIT_CARD','COMPLETED',370.00,'b5993382-6d6a-4759-ba66-2e729fce4740',1);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role_type` enum('ADMIN','CUSTOMER','HOTEL_MANAGER') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_8nhufvk7ufr23s4xoqglqtbdx` (`role_type`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'ADMIN'),(2,'CUSTOMER'),(3,'HOTEL_MANAGER');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `price_per_night` double NOT NULL,
  `room_count` int NOT NULL,
  `room_type` enum('DOUBLE','SINGLE') DEFAULT NULL,
  `hotel_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKdosq3ww4h9m2osim6o0lugng8` (`hotel_id`),
  CONSTRAINT `FKdosq3ww4h9m2osim6o0lugng8` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (1,270,35,'SINGLE',1),(2,359,45,'DOUBLE',1),(3,400,25,'SINGLE',2),(4,590,30,'DOUBLE',2),(5,691,30,'SINGLE',3),(6,800,75,'DOUBLE',3),(7,320,25,'SINGLE',4),(8,450,15,'DOUBLE',4),(9,300,50,'SINGLE',5),(10,400,50,'DOUBLE',5),(11,379,45,'SINGLE',6),(12,456,25,'DOUBLE',6);
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_date` datetime(6) DEFAULT NULL,
  `last_name` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `role_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_sb8bbouer5wak8vyiiy4pf2bx` (`username`),
  KEY `FKn82ha3ccdebhokx3a8fgdqeyy` (`role_id`),
  CONSTRAINT `FKn82ha3ccdebhokx3a8fgdqeyy` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'2024-06-27 21:58:50.848828','Admin','Admin','$2a$10$XIINZWUzbSAK0aQRqgtVPet3HMjZIJn7Tev0MDY0.QsTWTGW8a6wy','admin@hotel.com',1),(2,'2024-06-27 21:58:50.854443','Koker','Kaya Alp','$2a$10$ZPOxj0oXi.tybKQyEs5.J.AU4dAg8gvmF19eDuPyCLUNeTOh5ILdu','customer1@hotel.com',2),(3,'2024-06-27 21:58:50.856854','Doe','John','$2a$10$Cv7lVpg/9aJPL0MPi2xE3eYNsFukzjMrdJ6Dg7qkpHW/AXd9JLPe6','manager1@hotel.com',3),(4,'2024-06-27 21:58:50.859367','Mustermann','Max','$2a$10$qFXmuWu1ynT7pl5EGHW2m.dMHejGLr9CTpIA2w/caBvO6h7qge6Vm','manager2@hotel.com',3),(5,'2024-06-27 21:59:34.508336','Admin','Admin','$2a$10$9ArT1HwUrzweeXGLg1nDWuTVyVAU686qZsPLAIzeta83VRMwMcERW','admin@gmail.com',3),(6,'2024-06-27 22:00:15.888204','User','User','$2a$10$okQ04VOLs0Afu10BBHdVjepnfJY3vZJoCeZJQsqR/rkZgnYDAHf1y','user@gmail.com',2);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-01 19:46:20
user