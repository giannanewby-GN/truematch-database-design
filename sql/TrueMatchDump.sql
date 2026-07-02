-- MySQL dump 10.13  Distrib 8.0.45, for macos15 (arm64)
--
-- Host: localhost    Database: truematch_db
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

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '30241b16-1cbb-11f1-ad82-43d667825832:1-661';

--
-- Current Database: `truematch_db`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `truematch_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `truematch_db`;

--
-- Table structure for table `Conversation`
--

DROP TABLE IF EXISTS `Conversation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Conversation` (
  `conversation_id` int NOT NULL AUTO_INCREMENT,
  `match_id` int NOT NULL,
  `Conversation_status` varchar(20) NOT NULL,
  `created_at` datetime NOT NULL,
  `last_message_at` datetime DEFAULT NULL,
  PRIMARY KEY (`conversation_id`),
  KEY `FK_conversation_macth_idx` (`match_id`),
  CONSTRAINT `FK_conversation_macth` FOREIGN KEY (`match_id`) REFERENCES `Match` (`match_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Conversation`
--

LOCK TABLES `Conversation` WRITE;
/*!40000 ALTER TABLE `Conversation` DISABLE KEYS */;
INSERT INTO `Conversation` VALUES (1,1,'Active','2026-04-10 19:00:00','2026-04-10 19:08:00'),(2,2,'Active','2026-04-12 20:15:00','2026-04-12 20:25:00'),(3,3,'Pending','2026-04-15 18:30:00','2026-04-15 18:35:00');
/*!40000 ALTER TABLE `Conversation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Event`
--

DROP TABLE IF EXISTS `Event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Event` (
  `event_id` int NOT NULL AUTO_INCREMENT,
  `event_name` varchar(45) NOT NULL,
  `event_type` varchar(45) NOT NULL,
  `description` text,
  `city` varchar(45) NOT NULL,
  `state` varchar(2) NOT NULL,
  `start_datetime` datetime NOT NULL,
  `end_datetime` datetime NOT NULL,
  PRIMARY KEY (`event_id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Event`
--

LOCK TABLES `Event` WRITE;
/*!40000 ALTER TABLE `Event` DISABLE KEYS */;
INSERT INTO `Event` VALUES (100,'Coffee Mixer','Social','Casual meetup for local singles','Las Vegas','NV','2026-04-25 18:00:00','2026-04-25 20:00:00'),(102,'Sunset Hike','Outdoor','Group hike for active users','Henderson','NV','2026-04-25 17:30:00','2026-04-25 21:00:00'),(103,'Speed Date Event','Social','Speed dating for singles','North Las Vegas','NV','2026-05-01 15:00:00','2026-05-01 18:00:00');
/*!40000 ALTER TABLE `Event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Event_Participation`
--

DROP TABLE IF EXISTS `Event_Participation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Event_Participation` (
  `event_id` int NOT NULL,
  `user_id` int NOT NULL,
  `rsvp_status` varchar(15) NOT NULL,
  `rsvp_timestamp` datetime DEFAULT NULL,
  `feedback` text,
  PRIMARY KEY (`event_id`,`user_id`),
  KEY `FK_event_participation_user_idx` (`user_id`),
  CONSTRAINT `FK_event_participation_event` FOREIGN KEY (`event_id`) REFERENCES `Event` (`event_id`),
  CONSTRAINT `FK_event_participation_user` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Event_Participation`
--

LOCK TABLES `Event_Participation` WRITE;
/*!40000 ALTER TABLE `Event_Participation` DISABLE KEYS */;
INSERT INTO `Event_Participation` VALUES (100,1,'Going','2026-04-20 10:30:00','Excited to meet new people.'),(100,2,'Going','2026-04-20 11:00:00',NULL),(102,3,'Interested','2026-04-21 12:15:00',NULL),(102,6,'Going','2026-04-21 13:45:00','Looks fun.'),(103,4,'Going','2026-04-22 09:20:00',NULL),(103,5,'Interested','2026-04-22 10:10:00',NULL);
/*!40000 ALTER TABLE `Event_Participation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Interest`
--

DROP TABLE IF EXISTS `Interest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Interest` (
  `interest_id` int NOT NULL AUTO_INCREMENT,
  `interest_name` varchar(45) NOT NULL,
  PRIMARY KEY (`interest_id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Interest`
--

LOCK TABLES `Interest` WRITE;
/*!40000 ALTER TABLE `Interest` DISABLE KEYS */;
INSERT INTO `Interest` VALUES (100,'Hiking'),(101,'Coffee'),(102,'Movies'),(103,'Anime'),(104,'Cooking'),(105,'Music'),(106,'Fitness');
/*!40000 ALTER TABLE `Interest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Match`
--

DROP TABLE IF EXISTS `Match`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Match` (
  `match_id` int NOT NULL AUTO_INCREMENT,
  `user_1_id` int NOT NULL,
  `user_2_id` int NOT NULL,
  `match_timestamp` datetime NOT NULL,
  `match_status` varchar(20) NOT NULL,
  `compatibility_score` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`match_id`),
  KEY `FK_match_user1_idx` (`user_1_id`),
  KEY `FK_match_user2_idx` (`user_2_id`),
  CONSTRAINT `FK_match_user1` FOREIGN KEY (`user_1_id`) REFERENCES `User` (`user_id`),
  CONSTRAINT `FK_match_user2` FOREIGN KEY (`user_2_id`) REFERENCES `User` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Match`
--

LOCK TABLES `Match` WRITE;
/*!40000 ALTER TABLE `Match` DISABLE KEYS */;
INSERT INTO `Match` VALUES (1,1,2,'2026-04-10 18:35:00','Active',88.50),(2,3,4,'2026-04-12 19:20:00','Active',82.00),(3,5,6,'2026-04-15 17:25:00','Pending',76.25);
/*!40000 ALTER TABLE `Match` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Message`
--

DROP TABLE IF EXISTS `Message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Message` (
  `message_id` int NOT NULL AUTO_INCREMENT,
  `conversation_id` int NOT NULL,
  `sender_user_id` int NOT NULL,
  `message_text` text NOT NULL,
  `sent_at` datetime NOT NULL,
  `message_type` varchar(25) DEFAULT NULL,
  `media_url` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`message_id`),
  KEY `FK_message_conversation_idx` (`conversation_id`),
  KEY `FK_message_user_idx` (`sender_user_id`),
  CONSTRAINT `FK_message_conversation` FOREIGN KEY (`conversation_id`) REFERENCES `Conversation` (`conversation_id`),
  CONSTRAINT `FK_message_user` FOREIGN KEY (`sender_user_id`) REFERENCES `User` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Message`
--

LOCK TABLES `Message` WRITE;
/*!40000 ALTER TABLE `Message` DISABLE KEYS */;
INSERT INTO `Message` VALUES (1,1,1,'Hey! I saw you like coffee too.','2026-04-10 19:05:00','Text',NULL),(2,1,2,'Yes, coffee dates are always a good idea.','2026-04-10 19:08:00','Text',NULL),(3,2,3,'Hi! Your profile made me laugh.','2026-04-12 20:20:00','Text',NULL),(4,2,4,'Thanks! I liked your bio too.','2026-04-12 20:25:00','Text',NULL),(5,3,5,'Hey Ethan, do you go to the gym often?','2026-04-15 18:35:00','Text',NULL);
/*!40000 ALTER TABLE `Message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Payment`
--

DROP TABLE IF EXISTS `Payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Payment` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `subscription_id` int NOT NULL,
  `amount` decimal(6,2) NOT NULL,
  `payment_method` varchar(45) NOT NULL,
  `payment_status` varchar(15) NOT NULL,
  `paid_at` datetime DEFAULT NULL,
  `promo_code` varchar(45) DEFAULT NULL,
  `discount_amount` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `FK_payment_subscription_idx` (`subscription_id`),
  CONSTRAINT `FK_payment_subscription` FOREIGN KEY (`subscription_id`) REFERENCES `User_Subscription` (`subscription_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Payment`
--

LOCK TABLES `Payment` WRITE;
/*!40000 ALTER TABLE `Payment` DISABLE KEYS */;
INSERT INTO `Payment` VALUES (1,1,19.99,'Credit Card','Paid','2026-04-01 08:00:00',NULL,0.00),(2,2,9.99,'Debit Card','Paid','2026-04-02 09:00:00',NULL,0.00),(3,3,14.99,'PayPal','Paid','2026-04-03 10:00:00','WELCOME5',5.00),(4,4,9.99,'Credit Card','Failed',NULL,NULL,0.00),(5,5,19.99,'Debit Card','Paid','2026-04-05 12:00:00',NULL,0.00),(6,6,9.99,'Credit Card','Refunded','2026-04-06 13:00:00',NULL,0.00);
/*!40000 ALTER TABLE `Payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Subscription_Plan`
--

DROP TABLE IF EXISTS `Subscription_Plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Subscription_Plan` (
  `plan_id` int NOT NULL,
  `plan_name` varchar(45) NOT NULL,
  `monthly_price` decimal(5,2) NOT NULL,
  `description` text,
  PRIMARY KEY (`plan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Subscription_Plan`
--

LOCK TABLES `Subscription_Plan` WRITE;
/*!40000 ALTER TABLE `Subscription_Plan` DISABLE KEYS */;
INSERT INTO `Subscription_Plan` VALUES (1,'Basic',0.00,'Free plan with limited matches.'),(2,'Premium',9.99,'Includes more likes and profile boosts.'),(3,'Elite',19.99,'Includes advanced matching and priority visibility.');
/*!40000 ALTER TABLE `Subscription_Plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `User` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(25) NOT NULL,
  `last_name` varchar(25) NOT NULL,
  `email` varchar(45) NOT NULL,
  `phone_number` varchar(45) DEFAULT NULL,
  `account_status` varchar(45) NOT NULL,
  `created_at` date NOT NULL,
  `last_login_at` datetime NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (1,'Ava','Johnson','avaj@email.com','7025551001','Active','2026-01-05','2026-04-24 14:30:00'),(2,'Liam','Carter','liamc@email.com','7025551002','Active','2026-01-08','2026-04-21 20:10:00'),(3,'Mia','Rodriguez','miar@email.com','7025551003','Active','2026-01-12','2026-04-18 16:30:00'),(4,'Noah','Kim','noahk@email.com','7025551004','Active','2026-01-15','2026-04-22 12:20:00'),(5,'Sophia','Lee','sophial@email.com','7025551005','Active','2026-02-01','2026-04-20 18:45:00'),(6,'Ethan','Brooks','ethanb@email.com','7025551006','Suspended','2026-02-04','2026-04-19 09:10:00');
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User_Interaction`
--

DROP TABLE IF EXISTS `User_Interaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `User_Interaction` (
  `interaction_id` int NOT NULL AUTO_INCREMENT,
  `actor_user_id` int NOT NULL,
  `target_user_id` int NOT NULL,
  `interaction_type` varchar(45) NOT NULL,
  `interaction_timestamp` datetime NOT NULL,
  PRIMARY KEY (`interaction_id`),
  KEY `fk_user_preference_user2_idx` (`target_user_id`),
  KEY `FK_user_interaction_user1` (`actor_user_id`),
  CONSTRAINT `FK_user_interaction_user1` FOREIGN KEY (`actor_user_id`) REFERENCES `User` (`user_id`),
  CONSTRAINT `fk_user_preference_user2` FOREIGN KEY (`target_user_id`) REFERENCES `User` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User_Interaction`
--

LOCK TABLES `User_Interaction` WRITE;
/*!40000 ALTER TABLE `User_Interaction` DISABLE KEYS */;
INSERT INTO `User_Interaction` VALUES (1,1,2,'Like','2026-04-10 18:00:00'),(2,2,1,'Like','2026-04-10 18:30:00'),(3,3,4,'Like','2026-04-12 19:00:00'),(4,4,3,'Like','2026-04-12 19:15:00'),(5,5,6,'Like','2026-04-15 17:00:00'),(6,6,5,'Like','2026-04-15 17:20:00');
/*!40000 ALTER TABLE `User_Interaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User_Interest`
--

DROP TABLE IF EXISTS `User_Interest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `User_Interest` (
  `user_id` int NOT NULL,
  `interest_id` int NOT NULL,
  `added_at` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`,`interest_id`),
  KEY `FK_user_interest_interest_idx` (`interest_id`),
  CONSTRAINT `FK_user_interest_interest` FOREIGN KEY (`interest_id`) REFERENCES `Interest` (`interest_id`),
  CONSTRAINT `FK_user_interest_user` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User_Interest`
--

LOCK TABLES `User_Interest` WRITE;
/*!40000 ALTER TABLE `User_Interest` DISABLE KEYS */;
INSERT INTO `User_Interest` VALUES (1,101,'2026-04-01 10:00:00'),(1,105,'2026-04-01 10:05:00'),(2,102,'2026-04-02 11:05:00'),(2,106,'2026-04-02 11:00:00'),(3,101,'2026-04-03 12:00:00'),(3,104,'2026-04-03 12:05:00'),(4,102,'2026-04-04 13:05:00'),(4,103,'2026-04-04 13:00:00'),(5,101,'2026-04-05 14:00:00'),(5,105,'2026-04-05 14:05:00'),(6,100,'2026-04-06 15:05:00'),(6,106,'2026-04-06 15:00:00');
/*!40000 ALTER TABLE `User_Interest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User_Preference`
--

DROP TABLE IF EXISTS `User_Preference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `User_Preference` (
  `preference_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `preferred_gender` varchar(10) DEFAULT NULL,
  `preferred_age_min` int DEFAULT NULL,
  `preferred_age_max` int DEFAULT NULL,
  `preferred_distance_miles` int NOT NULL,
  `fitness_level` varchar(10) DEFAULT NULL,
  `diet_preference` varchar(20) DEFAULT NULL,
  `smoking_status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`preference_id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `fk_user_preference_user` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User_Preference`
--

LOCK TABLES `User_Preference` WRITE;
/*!40000 ALTER TABLE `User_Preference` DISABLE KEYS */;
INSERT INTO `User_Preference` VALUES (1,1,'Male',21,28,25,'Moderate','Balanced','No'),(2,2,'Female',20,27,20,'Active','Balanced','No'),(3,3,'Male',22,30,30,'Moderate','Balanced','No'),(4,4,'Female',21,29,15,'Light','Vegetarian','No'),(5,5,'Male',23,32,25,'Moderate','Balanced','No'),(6,6,'Female',20,26,20,'Active','High Protein','No');
/*!40000 ALTER TABLE `User_Preference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User_Profile`
--

DROP TABLE IF EXISTS `User_Profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `User_Profile` (
  `profile_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `gender` varchar(7) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `bio` text,
  `city` varchar(45) NOT NULL,
  `state` varchar(2) NOT NULL,
  `fitness_level` varchar(8) DEFAULT NULL,
  `diet_pref` varchar(20) DEFAULT NULL,
  `smoking_status` varchar(20) DEFAULT NULL,
  `is_verified` tinyint(1) NOT NULL,
  PRIMARY KEY (`profile_id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `fk_user_profile_user` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User_Profile`
--

LOCK TABLES `User_Profile` WRITE;
/*!40000 ALTER TABLE `User_Profile` DISABLE KEYS */;
INSERT INTO `User_Profile` VALUES (1,1,'Female','2004-05-24','Always chasing sunsets and the next trend.','Henderson','NV','Moderate','Vegan','No',1),(2,2,'Male','2002-03-24','Game on, always competing in something.','Las Vegas','NV','Light','Vegetarian','No',1),(3,3,'Female','2004-10-27','Color-coded planner and big goals energy.','North Las Vegas','NV','Active','Balanced','No',1),(4,4,'Male','2003-01-05','Debugging life one problem at a time.','North Las Vegas','NV','Light','Balanced','No',0),(5,5,'Female','2000-11-20','Living life one aesthetic coffee shop at a time.','Las Vegas','NV','Moderate','Balanced','No',1),(6,6,'Male','2005-02-20','Lift, fuel, repeat.','Henderson','NV','Active','High Protein','No',1);
/*!40000 ALTER TABLE `User_Profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User_Report`
--

DROP TABLE IF EXISTS `User_Report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `User_Report` (
  `report_id` int NOT NULL AUTO_INCREMENT,
  `reported_by_user_id` int NOT NULL,
  `reported_user_id` int NOT NULL,
  `message_id` int NOT NULL,
  `report_type` varchar(30) NOT NULL,
  `description` text,
  `report_status` varchar(15) NOT NULL,
  `report_timestamp` datetime NOT NULL,
  PRIMARY KEY (`report_id`),
  KEY `FK_user_reported_by_user_idx` (`reported_by_user_id`),
  KEY `FK_user_reported_user_idx` (`reported_user_id`),
  KEY `FK_user_report_message_idx` (`message_id`),
  CONSTRAINT `FK_user_report_message` FOREIGN KEY (`message_id`) REFERENCES `Message` (`message_id`),
  CONSTRAINT `FK_user_reported_by_user` FOREIGN KEY (`reported_by_user_id`) REFERENCES `User` (`user_id`),
  CONSTRAINT `FK_user_reported_user` FOREIGN KEY (`reported_user_id`) REFERENCES `User` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User_Report`
--

LOCK TABLES `User_Report` WRITE;
/*!40000 ALTER TABLE `User_Report` DISABLE KEYS */;
INSERT INTO `User_Report` VALUES (1,1,2,2,'Inappropriate','Message was reported for review.','Open','2026-04-11 09:00:00'),(2,3,4,4,'Spam','User may be sending repeated messages.','Reviewing','2026-04-13 10:30:00');
/*!40000 ALTER TABLE `User_Report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User_Subscription`
--

DROP TABLE IF EXISTS `User_Subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `User_Subscription` (
  `subscription_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `plan_id` int NOT NULL,
  `star_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `auto_renew` tinyint(1) NOT NULL,
  `subscription_status` varchar(45) NOT NULL,
  PRIMARY KEY (`subscription_id`),
  KEY `FK_user_subscription_plan_idx` (`plan_id`),
  KEY `FK_user_subscription_user_idx` (`user_id`),
  CONSTRAINT `FK_user_subscription_plan` FOREIGN KEY (`plan_id`) REFERENCES `Subscription_Plan` (`plan_id`),
  CONSTRAINT `FK_user_subscription_user` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User_Subscription`
--

LOCK TABLES `User_Subscription` WRITE;
/*!40000 ALTER TABLE `User_Subscription` DISABLE KEYS */;
INSERT INTO `User_Subscription` VALUES (1,1,3,'2026-04-01','2026-05-01',1,'Active'),(2,2,2,'2026-04-02','2026-05-02',1,'Active'),(3,3,3,'2026-04-03','2026-05-03',1,'Active'),(4,4,2,'2026-04-04','2026-05-04',0,'Past Due'),(5,5,3,'2026-04-05','2026-05-05',1,'Active'),(6,6,2,'2026-04-06','2026-05-06',0,'Cancelled');
/*!40000 ALTER TABLE `User_Subscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `groupproject`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `groupproject` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `groupproject`;

--
-- Table structure for table `act_agreement`
--

DROP TABLE IF EXISTS `act_agreement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_agreement` (
  `AgreementID` varchar(10) NOT NULL,
  `ArtistID` varchar(10) NOT NULL,
  `EventID` varchar(10) NOT NULL,
  `ArtistFeePercent` double NOT NULL,
  `FlatFeeAmount` int NOT NULL,
  PRIMARY KEY (`AgreementID`),
  KEY `fk_act_agreement_artist` (`ArtistID`),
  KEY `fk_act_agreement_event` (`EventID`),
  CONSTRAINT `fk_act_agreement_artist` FOREIGN KEY (`ArtistID`) REFERENCES `artist` (`ArtistID`),
  CONSTRAINT `fk_act_agreement_event` FOREIGN KEY (`EventID`) REFERENCES `event` (`EventID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_agreement`
--

LOCK TABLES `act_agreement` WRITE;
/*!40000 ALTER TABLE `act_agreement` DISABLE KEYS */;
INSERT INTO `act_agreement` VALUES ('A271','39181','1234',0.005,1000),('A272','28318','1235',0.05,10000),('A273','42817','1236',0.2,50000),('A274','96183','1237',0.05,5000),('A275','42928','1238',0.1,27500),('A276','19712','1239',0.2,40000),('A277','52971','1240',0.2,65000),('A278','68611','1241',0.1,22000),('A279','12319','1242',0.05,13000),('A280','97128','1243',0.2,10000),('A281','78721','1244',0.1,35000),('A282','87128','1245',0.2,50000),('A283','21019','1246',0.005,1500),('A284','11091','1247',0.005,500);
/*!40000 ALTER TABLE `act_agreement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artist`
--

DROP TABLE IF EXISTS `artist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artist` (
  `ArtistID` varchar(10) NOT NULL,
  `ArtistName` text NOT NULL,
  `Genre` text NOT NULL,
  PRIMARY KEY (`ArtistID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artist`
--

LOCK TABLES `artist` WRITE;
/*!40000 ALTER TABLE `artist` DISABLE KEYS */;
INSERT INTO `artist` VALUES ('11091','Bivens','EDM'),('12319','Taylor Fast','Pop'),('19712','Sabrina Plumber','Pop'),('21019','LiveRat','EDM'),('28318','Smokey Robin','R&B'),('39181','Garage Fury','Rock'),('42817','ZAS','R&B'),('42928','Dua LookUp','Pop'),('52971','Been-Drake NoMore','Rap'),('68611','CCMUCH$','Rap'),('78721','Old the Troll','Rock'),('87128','New York Orchestra','Classical'),('96183','Manchado ft. Manny','Latin'),('97128','ZE','Rap');
/*!40000 ALTER TABLE `artist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contractor`
--

DROP TABLE IF EXISTS `contractor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contractor` (
  `StaffID` varchar(10) NOT NULL,
  `ContractCompany` text NOT NULL,
  `HourlyRate` int NOT NULL,
  PRIMARY KEY (`StaffID`),
  CONSTRAINT `fk_contractor_staff` FOREIGN KEY (`StaffID`) REFERENCES `staff_member` (`StaffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contractor`
--

LOCK TABLES `contractor` WRITE;
/*!40000 ALTER TABLE `contractor` DISABLE KEYS */;
INSERT INTO `contractor` VALUES ('C1','Joint Security',12),('C10','Joint Security',12),('C11','Joint Security',12),('C12','HelpingHands',15),('C13','HelpingHands',15),('C14','HelpingHands',15),('C15','HelpingHands',15),('C16','HelpingHands',15),('C17','HelpingHands',15),('C18','HelpingHands',15),('C19','HelpingHands',15),('C2','Joint Security',12),('C20','HelpingHands',15),('C21','HelpingHands',15),('C22','HelpingHands',15),('C23','HelpingHands',15),('C24','HelpingHands',15),('C25','HelpingHands',15),('C26','HelpingHands',15),('C27','HelpingHands',15),('C28','HelpingHands',15),('C29','HelpingHands',15),('C3','Joint Security',12),('C4','Joint Security',12),('C5','Joint Security',12),('C6','Joint Security',12),('C7','Joint Security',12),('C8','Joint Security',12),('C9','Joint Security',12);
/*!40000 ALTER TABLE `contractor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `CustomerID` varchar(10) NOT NULL,
  `FName` text NOT NULL,
  `LName` text NOT NULL,
  `Email` text NOT NULL,
  `DOB` date NOT NULL,
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('C34','Drew','Miller','DrewMiller@gmail.com','1996-09-16'),('C35','Mike','Garcia','MikeGarcia@gmail.com','2064-09-07'),('C36','Paul','Brown','PaulBrown@gmail.com','1977-10-10'),('C37','Dola','Ortiz','DolaOrtiz@gmail.com','2057-05-15'),('C38','Dora','Cox','DoraCox@gmail.com','2069-10-23'),('C39','Chris','Woods','ChrisWoods@gmail.com','1991-09-05'),('C41','Pat','Payne','PatPayne@gmail.com','2051-06-14'),('C42','Pete','Gardner','PeteGardner@gmail.com','1996-11-08'),('C43','Paula','Ryan','PaulaRyan@gmail.com','2061-02-19'),('C44','Emile','Weaver','EmileWeaver@gmail.com','2040-12-22'),('C45','Kevin','Pierce','KevinPierce@gmail.com','1970-08-20'),('C46','Manny','Hansen','MannyHansen@gmail.com','2064-09-18'),('C47','Matthew','Knight','MatthewKnight@gmail.com','2052-08-17'),('C48','Noah','Hart','NoahHart@gmail.com','1991-10-16'),('C49','Liam','Hawkins','LiamHawkins@gmail.com','1981-08-11'),('C50','Willam','Morrison','WillamMorrison@gmail.com','1989-09-20'),('C51','Zion','Burke','ZionBurke@gmail.com','2049-02-20'),('C52','Mohammad','Valdez','MohammadValdez@gmail.com','1996-04-09'),('C53','Luke','Wheeler','LukeWheeler@gmail.com','2061-04-22'),('C54','David','Greene','DavidGreene@gmail.com','1984-11-28'),('C55','Henry','Nunez','HenryNunez@gmail.com','1988-07-03'),('C56','Peter','Grant','PeterGrant@gmail.com','1984-04-19'),('C57','Micheal','Watkins','MichealWatkins@gmail.com','1993-10-11'),('C58','Jacob','Sandoval','JacobSandoval@gmail.com','2059-02-15'),('C59','Zoey','Carpenter','ZoeyCarpenter@gmail.com','1973-03-11'),('C60','Emma','Lawerence','EmmaLawerence@gmail.com','2041-08-06'),('C61','Oliva','Estrada','OlivaEstrada@gmail.com','2068-11-27'),('C62','Ava','Ortega','AvaOrtega@gmail.com','1971-04-27'),('C63','Sam','Pena','SamPena@gmail.com','2064-12-10'),('C64','Emily','Brown','EmilyBrown@gmail.com','1979-12-21'),('C65','Ameila','Berry','AmeilaBerry@gmail.com','1980-07-20'),('C66','Nora','Delgado','NoraDelgado@gmail.com','1975-02-01'),('C67','Zoe','Alvardo','ZoeAlvardo@gmail.com','1970-07-10'),('C69','Alexa','Riley','AlexaRiley@gmail.com','2057-02-08'),('C71','Alex','Lane','AlexLane@gmail.com','1997-04-01'),('C73','Stella','Hudson','StellaHudson@gmail.com','1988-04-16'),('C74','Aaron','Carroll','AaronCarroll@gmail.com','2048-09-28'),('C75','Hunter','Armstrong','HunterArmstrong@gmail.com','2044-11-04'),('C76','Caleb','Duncan','CalebDuncan@gmail.com','1992-03-14'),('C78','Madison','Cunningham','MadisonCunningham@gmail.com','1979-11-28'),('C81','Joey','Elliot','JoeyElliot@gmail.com','2059-10-13'),('C82','Audrey','Petters','AudreyPetters@gmail.com','1973-09-27'),('C83','Layla','Vazquez','LaylaVazquez@gmail.com','2056-03-02'),('C84','Addy','Spencer','AddySpencer@gmail.com','1971-09-02'),('C85','Lily','Dunn','LilyDunn@gmail.com','1981-07-12'),('C86','James','Grant','JamesGrant@gmail.com','1980-07-10'),('C87','Josh','Stot','JoshStot@gmail.com','2044-10-15'),('C88','Wyatt','Stone','WyattStone@gmail.com','1993-07-08'),('C90','Josh','Soto','JoshSoto@gmail.com','2052-02-06'),('C92','Logan','Black','LoganBlack@gmail.com','2058-05-04'),('C93','Charles','Boyd','CharlesBoyd@gmail.com','2057-01-14'),('C95','Ryan','Williams','RyanWilliams@gmail.com','1976-04-05'),('C96','Lewis','Johnson','LewisJohnson@gmail.com','2069-08-02'),('C97','Thomas','Brown','ThomasBrown@gmail.com','1984-03-17');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `StaffID` varchar(10) NOT NULL,
  `HireDate` date NOT NULL,
  `JobTitle` text NOT NULL,
  PRIMARY KEY (`StaffID`),
  CONSTRAINT `fk_employee_staff` FOREIGN KEY (`StaffID`) REFERENCES `staff_member` (`StaffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES ('S1','2023-01-03','Security'),('S10','2022-03-27','Security'),('S11','2023-06-05','Security'),('S12','2019-02-01','Security'),('S13','2024-04-10','F&B - Cook'),('S14','2006-05-12','F&B - Cook'),('S15','2016-08-30','F&B - Cook'),('S16','2024-06-02','F&B - Cook'),('S17','2020-07-27','F&B - Cook'),('S18','2021-04-27','F&B - Cook'),('S19','2021-10-18','F&B - Cook'),('S2','2007-07-23','Security'),('S20','2018-01-05','F&B - Cook'),('S21','2014-08-29','F&B - Cook'),('S22','2020-04-24','F&B - Cook'),('S23','2024-02-20','F&B - Cook'),('S24','2020-06-24','F&B - Cook'),('S25','2017-02-01','F&B - Cook'),('S26','2021-11-10','F&B - Worker'),('S27','2024-11-27','F&B - Worker'),('S28','2020-07-02','F&B - Worker'),('S29','2019-01-29','F&B - Worker'),('S3','2020-04-10','Security'),('S30','2009-09-09','F&B - Worker'),('S31','2020-03-01','Retail'),('S32','2022-05-07','Retail'),('S33','2004-12-07','Retail'),('S34','2020-05-25','Retail'),('S35','2025-01-02','Retail'),('S36','2025-01-03','Retail'),('S37','2025-01-03','Retail'),('S38','2025-01-07','Retail'),('S39','2024-12-31','Retail'),('S4','2021-05-09','Security'),('S40','2017-07-05','Janitorial'),('S41','2020-09-25','Janitorial'),('S42','2020-12-14','Janitorial'),('S43','2019-04-19','Janitorial'),('S44','2022-06-22','Janitorial'),('S45','2019-01-23','Janitorial'),('S46','2018-09-03','Janitorial'),('S5','2024-10-28','Security'),('S6','2018-11-10','Security'),('S7','2021-02-28','Security'),('S8','2019-01-19','Security'),('S9','2022-03-30','Security');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event` (
  `EventID` varchar(10) NOT NULL,
  `VenueID` varchar(10) NOT NULL,
  `EventName` text,
  `EventDate` date DEFAULT NULL,
  `EventTime` text,
  `MusicType` text,
  `MinAge` int DEFAULT NULL,
  PRIMARY KEY (`EventID`),
  KEY `fk_event_venue` (`VenueID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` VALUES ('1234','D','Garage Fury Live Via GOLD ONES','2025-01-10','7pm','Rock',18),('1235','C','Smokey Robin Live Via GOLD ONES','2025-02-08','3pm','R&B',0),('1236','A','ZAS Live Via GOLD ONES','2025-02-22','12pm','R&B',0),('1237','C','Manchado ft. Manny Live Via GOLD ONES','2025-04-05','5pm','Latin',0),('1238','B','Dua LookUp Live Via GOLD ONES','2025-04-20','6pm','Pop',0),('1239','A','Sabrina Plumber Live Via GOLD ONES','2025-05-03','3pm','Pop',0),('1240','A','Been-Drake NoMore Live Via GOLD ONES','2025-05-13','7pm','Rap',18),('1241','B','CCMUCH$ Live Via GOLD ONES','2025-07-16','8pm','Rap',18),('1242','C','Taylor Fast Live Via GOLD ONES','2025-07-31','7pm','Pop',0),('1243','A','ZE Live Via GOLD ONES','2025-08-27','6pm','Rap',18),('1244','B','Old the Troll Live Via GOLD ONES','2025-10-03','5pm','Rock',18),('1245','A','New York Orchestra Live Via GOLD ONES','2025-10-26','12pm','Classical',0),('1246','D','LiveRat Live Via GOLD ONES','2025-11-15','9pm','EDM',21),('1247','D','Bivens Live Via GOLD ONES','2025-12-21','10pm','EDM',21);
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_staff`
--

DROP TABLE IF EXISTS `event_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_staff` (
  `EventID` varchar(10) NOT NULL,
  `StaffID` varchar(10) NOT NULL,
  `Role` text,
  `HoursWorked` int DEFAULT NULL,
  PRIMARY KEY (`EventID`,`StaffID`),
  KEY `fk_event_staff_staff` (`StaffID`),
  CONSTRAINT `fk_event_staff_event` FOREIGN KEY (`EventID`) REFERENCES `event` (`EventID`),
  CONSTRAINT `fk_event_staff_staff` FOREIGN KEY (`StaffID`) REFERENCES `staff_member` (`StaffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_staff`
--

LOCK TABLES `event_staff` WRITE;
/*!40000 ALTER TABLE `event_staff` DISABLE KEYS */;
INSERT INTO `event_staff` VALUES ('1234','C20','Retail',1),('1234','S1','Security',5),('1234','S13','F&B - Cook',3),('1234','S28','F&B - Worker',2),('1234','S3','Security',1),('1234','S40','Janitorial',3),('1234','S41','Janitorial',6),('1235','C16','F&B - Worker',7),('1235','C28','Retail',5),('1235','C29','Retail',6),('1235','S14','F&B - Cook',3),('1235','S15','F&B - Cook',8),('1235','S2','Security',7),('1235','S30','F&B - Worker',6),('1235','S4','Security',1),('1235','S42','Janitorial',4),('1235','S43','Janitorial',2),('1236','S16','F&B - Cook',2),('1236','S17','F&B - Cook',4),('1236','S18','F&B - Cook',5),('1236','S19','F&B - Cook',3),('1236','S26','F&B - Worker',5),('1236','S27','F&B - Worker',4),('1236','S28','F&B - Worker',4),('1236','S29','F&B - Worker',8),('1236','S30','F&B - Worker',2),('1236','S35','Retail',7),('1236','S36','Retail',1),('1236','S37','Retail',7),('1236','S44','Janitorial',1),('1236','S45','Janitorial',7),('1236','S46','Janitorial',1),('1236','S5','Security',7),('1236','S6','Security',5),('1237','S20','F&B - Cook',6),('1237','S21','F&B - Cook',1),('1237','S29','F&B - Worker',7),('1237','S30','F&B - Worker',6),('1237','S31','Retail',7),('1237','S36','Retail',7),('1237','S44','Janitorial',3),('1237','S45','Janitorial',8),('1237','S7','Security',4),('1237','S8','Security',4),('1238','C13','Janitorial',2),('1238','S10','Security',2),('1238','S22','F&B - Cook',5),('1238','S23','F&B - Cook',3),('1238','S24','F&B - Cook',1),('1238','S26','F&B - Worker',4),('1238','S27','F&B - Worker',1),('1238','S28','F&B - Worker',1),('1238','S29','F&B - Worker',4),('1238','S32','Retail',7),('1238','S33','Retail',3),('1238','S34','Retail',1),('1238','S45','Janitorial',7),('1238','S9','Security',1),('1239','C12','Retail',7),('1239','C13','Retail',2),('1239','C14','Retail',5),('1239','S11','Security',5),('1239','S12','Security',2),('1239','S23','F&B - Cook',6),('1239','S24','F&B - Cook',5),('1239','S25','F&B - Cook',1),('1239','S27','F&B - Worker',8),('1239','S28','F&B - Worker',1),('1239','S29','F&B - Worker',8),('1239','S44','Janitorial',7),('1239','S45','Janitorial',4),('1240','C14','Janitorial',6),('1240','C15','Janitorial',7),('1240','C24','Retail',4),('1240','C25','Retail',8),('1240','S12','Security',1),('1240','S13','F&B - Cook',6),('1240','S17','F&B - Cook',4),('1240','S19','F&B - Cook',6),('1240','S24','F&B - Cook',2),('1240','S26','F&B - Worker',6),('1240','S27','F&B - Worker',8),('1240','S28','F&B - Worker',5),('1240','S29','F&B - Worker',2),('1240','S30','F&B - Worker',4),('1240','S31','Retail',4),('1240','S37','Retail',1),('1240','S9','Security',4),('1241','C16','Janitorial',1),('1241','C17','Janitorial',5),('1241','C21','Retail',2),('1241','C28','Retail',2),('1241','C29','Retail',2),('1241','S1','Security',2),('1241','S10','Security',2),('1241','S16','F&B - Cook',4),('1241','S17','F&B - Cook',4),('1241','S18','F&B - Cook',8),('1241','S28','F&B - Worker',6),('1241','S29','F&B - Worker',4),('1241','S30','F&B - Worker',1),('1242','C10','Security',8),('1242','C18','Janitorial',8),('1242','C19','Janitorial',6),('1242','C26','Retail',5),('1242','C27','Retail',3),('1242','C9','Security',5),('1242','S14','F&B - Cook',6),('1242','S15','F&B - Cook',5),('1242','S26','F&B - Worker',1),('1242','S27','F&B - Worker',6),('1243','C11','Security',2),('1243','C20','Janitorial',4),('1243','C21','Janitorial',7),('1243','C25','F&B - Worker',5),('1243','C26','F&B - Worker',8),('1243','C27','F&B - Worker',8),('1243','C28','F&B - Worker',2),('1243','S22','F&B - Cook',7),('1243','S23','F&B - Cook',8),('1243','S24','F&B - Cook',4),('1243','S25','F&B - Cook',7),('1243','S34','Retail',8),('1243','S35','Retail',4),('1243','S36','Retail',4),('1243','S37','Retail',3),('1243','S5','Security',6),('1244','C12','F&B - Worker',8),('1244','C22','Janitorial',1),('1244','C23','Janitorial',8),('1244','C28','F&B - Worker',4),('1244','C29','F&B - Worker',4),('1244','C7','Security',2),('1244','C8','Security',4),('1244','S13','F&B - Cook',5),('1244','S14','F&B - Cook',1),('1244','S15','F&B - Cook',1),('1244','S31','Retail',5),('1244','S32','Retail',6),('1244','S33','Retail',8),('1245','C13','F&B - Worker',8),('1245','C14','F&B - Worker',4),('1245','C15','F&B - Worker',7),('1245','C24','Janitorial',4),('1245','C25','Janitorial',1),('1245','C5','Security',1),('1245','C6','Security',8),('1245','S18','F&B - Cook',7),('1245','S19','F&B - Cook',5),('1245','S20','F&B - Cook',2),('1245','S21','F&B - Cook',6),('1245','S26','F&B - Worker',1),('1245','S27','F&B - Worker',7),('1245','S32','Retail',5),('1245','S33','Retail',4),('1245','S34','Retail',4),('1245','S35','Retail',2),('1246','C26','Janitorial',6),('1246','C27','Janitorial',6),('1246','C3','Security',1),('1246','C4','Security',2),('1246','S23','F&B - Cook',3),('1246','S27','F&B - Worker',2),('1246','S28','F&B - Worker',6),('1246','S36','Retail',5),('1246','S37','Retail',8),('1247','C1','Security',2),('1247','C2','Security',5),('1247','C28','Janitorial',1),('1247','C29','Janitorial',2),('1247','S18','F&B - Cook',4),('1247','S19','F&B - Cook',6),('1247','S29','F&B - Worker',4),('1247','S30','F&B - Worker',7),('1247','S38','Retail',5),('1247','S39','Retail',4);
/*!40000 ALTER TABLE `event_staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_vendor`
--

DROP TABLE IF EXISTS `event_vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_vendor` (
  `VendorID` varchar(10) NOT NULL,
  `EventID` varchar(10) NOT NULL,
  `Location` text,
  PRIMARY KEY (`VendorID`,`EventID`),
  KEY `fk_event_vendor_event` (`EventID`),
  CONSTRAINT `fk_event_vendor_event` FOREIGN KEY (`EventID`) REFERENCES `event` (`EventID`),
  CONSTRAINT `fk_event_vendor_vendor` FOREIGN KEY (`VendorID`) REFERENCES `vendor` (`VendorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_vendor`
--

LOCK TABLES `event_vendor` WRITE;
/*!40000 ALTER TABLE `event_vendor` DISABLE KEYS */;
INSERT INTO `event_vendor` VALUES ('','1242','Outside'),('BV12','1237','Outside'),('BV12','1247','Inside'),('BV13','1238','Outside'),('BV14','1234','Outside'),('BV14','1238','Inside'),('BV14','1244','Inside'),('BV15','1239','Inside'),('BV15','1246','Outside'),('BV16','1242','Inside'),('BV16','1245','Outside'),('BV17','1235','Inside'),('BV17','1243','Outside'),('BV17','1245','Outside'),('BV18','1236','Outside'),('BV18','1240','Outside'),('BV19','1236','Outside'),('BV19','1241','Outside'),('FV1','1241','Inside'),('FV10','1237','Inside'),('FV10','1247','Outside'),('FV11','1240','Inside'),('FV11','1244','Inside'),('FV2','1239','Inside'),('FV2','1245','Outside'),('FV3','1234','Outside'),('FV4','1236','Inside'),('FV5','1243','Inside'),('FV5','1244','Outside'),('FV5','1246','Outside'),('FV6','1238','Outside'),('FV6','1245','Inside'),('FV7','1235','Inside'),('FV8','1236','Inside'),('FV8','1240','Inside'),('FV9','1242','Inside'),('FV9','1243','Inside'),('RV1','1234','Inside'),('RV10','1243','Outside'),('RV11','1235','Inside'),('RV12','1239','Outside'),('RV12','1246','Inside'),('RV13','1240','Inside'),('RV13','1245','Outside'),('RV14','1241','Outside'),('RV14','1243','Inside'),('RV15','1244','Outside'),('RV16','1236','Outside'),('RV17','1240','Inside'),('RV17','1244','Inside'),('RV19','1236','Inside'),('RV19','1247','Inside'),('RV2','1235','Inside'),('RV2','1246','Outside'),('RV20','1237','Outside'),('RV3','1237','Outside'),('RV4','1238','Outside'),('RV4','1247','Inside'),('RV5','1242','Inside'),('RV5','1245','Inside'),('RV6','1241','Inside'),('RV7','1234','Outside'),('RV8','1238','Outside'),('RV9','1239','Inside');
/*!40000 ALTER TABLE `event_vendor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food_bev_vendor`
--

DROP TABLE IF EXISTS `food_bev_vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food_bev_vendor` (
  `VendorID` varchar(10) NOT NULL,
  `CuisineType` text,
  PRIMARY KEY (`VendorID`),
  CONSTRAINT `fk_food_bev_vendor` FOREIGN KEY (`VendorID`) REFERENCES `vendor` (`VendorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_bev_vendor`
--

LOCK TABLES `food_bev_vendor` WRITE;
/*!40000 ALTER TABLE `food_bev_vendor` DISABLE KEYS */;
INSERT INTO `food_bev_vendor` VALUES ('BV12','Bar'),('BV13','Bar'),('BV14','Bar'),('BV15','Bar'),('BV16','Bar'),('BV17','Bar'),('BV18','Bar'),('BV19','Bar'),('FV1','Snacks'),('FV10','Pizza'),('FV11','Mexican'),('FV2','Snacks'),('FV3','Snacks'),('FV4','Snacks'),('FV5','Snacks'),('FV6','America'),('FV7','America'),('FV8','America'),('FV9','Pizza');
/*!40000 ALTER TABLE `food_bev_vendor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `online_ticket`
--

DROP TABLE IF EXISTS `online_ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `online_ticket` (
  `TicketID` varchar(10) NOT NULL,
  `PurchaseChannel` text,
  PRIMARY KEY (`TicketID`),
  CONSTRAINT `fk_online_ticket` FOREIGN KEY (`TicketID`) REFERENCES `ticket` (`TicketID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `online_ticket`
--

LOCK TABLES `online_ticket` WRITE;
/*!40000 ALTER TABLE `online_ticket` DISABLE KEYS */;
INSERT INTO `online_ticket` VALUES ('T1','Website Main'),('T10','Website Employee'),('T11','Website Employee'),('T12','Website Main'),('T13','Website Main'),('T14','Website Main'),('T15','Website Main'),('T16','Website Main'),('T17','Website Main'),('T18','Website Main'),('T19','Website Main'),('T2','Call'),('T20','Website Main'),('T21','Website Main'),('T22','Website Main'),('T23','Website Main'),('T24','Website Main'),('T25','Website Main'),('T26','Website Main'),('T27','Website Main'),('T28','Website Main'),('T29','Website Main'),('T3','Call'),('T4','Call'),('T5','Call'),('T6','Call'),('T7','Call'),('T8','Website Employee'),('T9','Website Employee');
/*!40000 ALTER TABLE `online_ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `OrderID` varchar(10) NOT NULL,
  `CustomerID` varchar(10) NOT NULL,
  `OrderDate` date DEFAULT NULL,
  `OrderTotal` int DEFAULT NULL,
  `OrderStatus` text,
  PRIMARY KEY (`OrderID`),
  KEY `fk_order_customer` (`CustomerID`),
  CONSTRAINT `fk_order_customer` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES ('O1','C34','2025-04-29',39,'Complete'),('O10','C43','2025-07-28',24,'Complete'),('O11','C44','2025-01-02',56,'Complete'),('O12','C45','2025-10-01',42,'Complete'),('O13','C46','2025-10-20',29,'Complete'),('O14','C47','2025-08-26',120,'Complete'),('O15','C48','2025-11-14',50,'Complete'),('O16','C49','2025-08-26',60,'Complete'),('O17','C50','2025-11-13',34,'Complete'),('O18','C51','2025-11-13',34,'Complete'),('O19','C52','2025-12-20',13,'Complete'),('O2','C35','2025-02-01',70,'Complete'),('O20','C53','2025-02-06',34,'Complete'),('O21','C54','2025-05-12',42,'Complete'),('O22','C55','2025-05-02',15,'Complete'),('O23','C56','2025-05-01',13,'Complete'),('O24','C57','2025-02-06',36,'Complete'),('O25','C58','2025-09-30',28,'Complete'),('O26','C59','2025-04-28',26,'Complete'),('O27','C60','2025-10-25',49,'Complete'),('O28','C61','2025-04-26',41,'Complete'),('O29','C62','2025-04-19',21,'Complete'),('O3','C36','2025-03-31',22,'Complete'),('O30','C63','2025-04-29',35,'Complete'),('O31','C64','2025-04-29',37,'Complete'),('O32','C65','2025-04-29',38,'Complete'),('O33','C66','2025-12-10',17,'Complete'),('O34','C67','2025-12-11',27,'Complete'),('O35','C56','2025-12-12',20,'Complete'),('O36','C69','2025-01-01',35,'Complete'),('O37','C36','2025-05-12',27,'Complete'),('O38','C71','2025-07-08',35,'Complete'),('O39','C46','2025-05-09',21,'Complete'),('O4','C37','2025-01-07',29,'Complete'),('O40','C73','2025-12-20',35,'Complete'),('O41','C74','2025-11-10',85,'Complete'),('O42','C75','2025-11-10',85,'Complete'),('O43','C56','2025-12-19',21,'Complete'),('O44','C78','2025-10-01',32,'Complete'),('O45','C34','2025-10-25',27,'Complete'),('O46','C56','2025-10-01',33,'Complete'),('O47','C81','2025-04-04',19,'Complete'),('O48','C82','2025-05-10',75,'Complete'),('O49','C83','2025-08-20',47,'Complete'),('O5','C38','2025-02-21',14,'Complete'),('O50','C84','2025-07-10',30,'Complete'),('O51','C86','2025-07-23',30,'Complete'),('O52','C87','2025-02-02',70,'Complete'),('O53','C88','2025-05-01',70,'Complete'),('O54','C46','2025-02-10',24,'Complete'),('O55','C90','2025-04-01',28,'Complete'),('O56','C36','2025-04-18',40,'Complete'),('O57','C92','2025-01-01',50,'Complete'),('O58','C93','2025-02-10',16,'Complete'),('O59','C56','2025-04-04',38,'Complete'),('O6','C39','2025-04-15',87,'Complete'),('O60','C95','2025-06-23',60,'Incomplete'),('O61','C96','2025-01-24',70,'Incomplete'),('O62','C97','2025-11-30',89,'Incomplete'),('O7','C56','2025-07-15',31,'Complete'),('O8','C41','2025-02-07',39,'Complete'),('O9','C42','2025-02-18',24,'Complete');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `PaymentID` varchar(10) NOT NULL,
  `OrderID` varchar(10) NOT NULL,
  `PaymentMethod` text,
  `PaymentDate` date DEFAULT NULL,
  `PaymentAmount` int DEFAULT NULL,
  `PaymentStatus` text,
  PRIMARY KEY (`PaymentID`),
  KEY `fk_payment_order` (`OrderID`),
  CONSTRAINT `fk_payment_order` FOREIGN KEY (`OrderID`) REFERENCES `order` (`OrderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES ('P100','O50','Credit','2025-07-10',30,'Complete'),('P101','O50','Credit','2025-07-11',30,'Complete'),('P102','O51','Debit','2025-07-23',30,'Complete'),('P103','O52','Credit','2025-02-02',70,'Complete'),('P104','O53','Credit','2025-05-01',70,'Complete'),('P105','O54','Credit','2025-02-10',24,'Complete'),('P106','O55','Debit','2025-04-01',28,'Complete'),('P107','O56','Debit','2025-04-18',40,'Complete'),('P108','O57','Debit','2025-01-01',50,'Complete'),('P109','O58','Debit','2025-02-10',16,'Complete'),('P110','O59','Debit','2025-04-04',38,'Complete'),('P111','O60','Credit','2025-06-23',60,'Incomplete'),('P112','O61','Credit','2025-01-24',70,'Incomplete'),('P113','O62','Debit','2025-11-30',89,'Incomplete'),('P50','O1','Credit','2025-04-29',39,'Complete'),('P51','O2','Credit','2025-02-01',70,'Complete'),('P52','O3','Debit','2025-03-31',22,'Complete'),('P53','O4','Debit','2025-01-07',29,'Complete'),('P54','O5','Credit','2025-02-21',14,'Complete'),('P55','O6','Debit','2025-04-15',87,'Complete'),('P56','O7','Credit','2025-07-15',31,'Complete'),('P57','O8','Credit','2025-02-07',39,'Complete'),('P58','O9','Credit','2025-02-18',24,'Complete'),('P59','O10','Debit','2025-07-28',24,'Complete'),('P60','O11','Credit','2025-01-02',56,'Complete'),('P61','O12','Credit','2025-10-01',42,'Complete'),('P62','O13','Debit','2025-10-20',29,'Complete'),('P63','O14','Credit','2025-08-26',120,'Complete'),('P64','O15','Debit','2025-11-14',50,'Complete'),('P65','O16','Debit','2025-08-26',60,'Complete'),('P66','O17','Credit','2025-11-13',34,'Complete'),('P67','O18','Credit','2025-11-13',34,'Complete'),('P68','O19','Credit','2025-12-20',13,'Complete'),('P69','O20','Credit','2025-02-06',34,'Complete'),('P70','O21','Credit','2025-05-12',42,'Complete'),('P71','O22','Credit','2025-05-02',15,'Complete'),('P72','O23','Credit','2025-05-01',13,'Complete'),('P73','O24','Credit','2025-02-06',36,'Complete'),('P74','O25','Credit','2025-09-30',28,'Complete'),('P75','O26','Debit','2025-04-28',26,'Complete'),('P76','O27','Debit','2025-10-25',49,'Complete'),('P77','O28','Debit','2025-04-26',41,'Complete'),('P78','O29','Credit','2025-04-19',21,'Complete'),('P79','O30','Credit','2025-04-29',35,'Complete'),('P80','O31','Credit','2025-04-29',37,'Complete'),('P81','O32','Debit','2025-04-29',38,'Complete'),('P82','O33','Debit','2025-12-10',17,'Complete'),('P83','O34','Credit','2025-12-11',27,'Complete'),('P84','O35','Debit','2025-12-12',20,'Complete'),('P85','O36','Debit','2025-01-01',35,'Complete'),('P86','O37','Credit','2025-05-12',27,'Complete'),('P87','O38','Credit','2025-07-08',35,'Complete'),('P88','O39','Debit','2025-05-09',21,'Complete'),('P89','O40','Credit','2025-12-20',35,'Complete'),('P90','O41','Credit','2025-11-10',85,'Complete'),('P91','O42','Credit','2025-11-10',85,'Complete'),('P92','O42','Credit','2025-07-30',85,'Complete'),('P93','O43','Debit','2025-12-19',21,'Complete'),('P94','O44','Credit','2025-10-01',32,'Complete'),('P95','O45','Debit','2025-10-25',27,'Complete'),('P96','O46','Debit','2025-10-01',33,'Complete'),('P97','O47','Credit','2025-04-04',19,'Complete'),('P98','O48','Debit','2025-05-10',75,'Complete'),('P99','O49','Debit','2025-08-20',47,'Complete');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `physical_ticket`
--

DROP TABLE IF EXISTS `physical_ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `physical_ticket` (
  `TicketID` varchar(10) NOT NULL,
  `POSLocation` int DEFAULT NULL,
  PRIMARY KEY (`TicketID`),
  CONSTRAINT `fk_physical_ticket` FOREIGN KEY (`TicketID`) REFERENCES `ticket` (`TicketID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `physical_ticket`
--

LOCK TABLES `physical_ticket` WRITE;
/*!40000 ALTER TABLE `physical_ticket` DISABLE KEYS */;
INSERT INTO `physical_ticket` VALUES ('T30',6),('T31',3),('T32',6),('T33',1),('T34',10),('T35',2),('T36',8),('T37',7),('T38',9),('T39',2),('T40',3),('T41',5),('T42',5),('T43',8),('T44',5),('T45',4),('T46',9),('T47',10),('T48',4);
/*!40000 ALTER TABLE `physical_ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `retail_vendor`
--

DROP TABLE IF EXISTS `retail_vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `retail_vendor` (
  `VendorID` varchar(10) NOT NULL,
  `MerchandizeType` text,
  PRIMARY KEY (`VendorID`),
  CONSTRAINT `fk_retail_vendor` FOREIGN KEY (`VendorID`) REFERENCES `vendor` (`VendorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `retail_vendor`
--

LOCK TABLES `retail_vendor` WRITE;
/*!40000 ALTER TABLE `retail_vendor` DISABLE KEYS */;
INSERT INTO `retail_vendor` VALUES ('RV1','Clothing'),('RV10','Posters'),('RV11','Accessories'),('RV12','Accessories'),('RV13','Accessories'),('RV14','Accessories'),('RV15','Accessories'),('RV16','Toys'),('RV17','Toys'),('RV18','Toys'),('RV19','Collectables'),('RV2','Clothing'),('RV20','Collectables'),('RV3','Clothing'),('RV4','Clothing'),('RV5','Clothing'),('RV6','Clothing'),('RV7','Posters'),('RV8','Posters'),('RV9','Posters');
/*!40000 ALTER TABLE `retail_vendor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_member`
--

DROP TABLE IF EXISTS `staff_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff_member` (
  `StaffID` varchar(10) NOT NULL,
  `StaffName` text,
  `StaffPhone` text,
  PRIMARY KEY (`StaffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_member`
--

LOCK TABLES `staff_member` WRITE;
/*!40000 ALTER TABLE `staff_member` DISABLE KEYS */;
INSERT INTO `staff_member` VALUES ('C1','Sage Green','9291385878'),('C10','Harper White','4277081219'),('C11','Nova Harris','6372548139'),('C12','Levi Anderson','9028049537'),('C13','Bryan Perez','5779883627'),('C14','Otto Parker','6355123406'),('C15','JJ Taylor','1240985412'),('C16','Spencer Moore','4119873869'),('C17','Sebastian Lee','3089129789'),('C18','Sam Davis','7736594029'),('C19','Samual Willams','4193162957'),('C2','Rowan Adams','8750819523'),('C20','Tom Monroe','3044052001'),('C21','Asia Hammerfeld','8907146994'),('C22','Mark Bond','3588107158'),('C23','Jackson Max','6142384683'),('C24','John Steel','1705829380'),('C25','Felix Johnson','7954064521'),('C26','Ludwig Kim','6018677879'),('C27','Marshell Brown','1815114125'),('C28','Sophia Ramsey','5694118781'),('C29','Isabella Lacost','9145852394'),('C3','Amelia Baker','4750188035'),('C4','Olivia Campbell','4019080708'),('C5','Josh Ramirez','8753535156'),('C6','Joshua Sanchez','6730443055'),('C7','Ashely Young','3148114424'),('C8','Luka Clarkson','4664036583'),('C9','Oliver Lewis','8842872534'),('S1','John Doe','9508244552'),('S10','Piper Craft','5853656700'),('S11','Ashely Remort','8861058773'),('S12','Caitlin Ports','2443792225'),('S13','Avery Abernackle','8203257781'),('S14','Amanda June','4321367842'),('S15','Vik Randum','2583275404'),('S16','Darwan Contler','4490000592'),('S17','Duke Thomas','9769843633'),('S18','Dougles Jackson','9091774994'),('S19','Cathy Reaves','7731826077'),('S2','Jane Doe','9842514065'),('S20','Cara Park','8387760161'),('S21','Joe Moama','8829287630'),('S22','Brad Lambert','8306957343'),('S23','Omar Perez','6841696744'),('S24','Justin O\'Neale','8536215269'),('S25','Kelly Bertsrand','9475875746'),('S26','Bo Havterz','1735678614'),('S27','Ellias Peterson','9627652680'),('S28','Franky Clam','3983037401'),('S29','Alex Young','9784466401'),('S3','Kevin Smith','6653208953'),('S30','Alec Souter','6356120401'),('S31','Skeet Wright','1904958703'),('S32','Kermit King','2754530062'),('S33','Alvin Scott','7607550528'),('S34','Freja Garcia','7997866683'),('S35','Sarah Johnson','4950696664'),('S36','Calvin Rodriguez','3659860785'),('S37','Tevin Hill','2311224205'),('S38','James Martinez','9262052734'),('S39','Vince Lopez','8142393986'),('S4','George Irbin','6212388069'),('S40','Sierra Wilson','9855843223'),('S41','Emma Chamber','3455939594'),('S42','Noah Lies','3596682933'),('S43','Liam Larxart','9601269713'),('S44','Caleb Manifold','7305674047'),('S45','Mike Terrimonce','6141434243'),('S46','Mia Hart','1271938487'),('S5','Michel Hapnit','4140922232'),('S6','Micheal Lestour','3635166889'),('S7','Mike Alresta','2696009097'),('S8','Alex Mark','3034380857'),('S9','Luke Van-Dyn','8990489328');
/*!40000 ALTER TABLE `staff_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `third_party_online_ticket`
--

DROP TABLE IF EXISTS `third_party_online_ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `third_party_online_ticket` (
  `TicketID` varchar(10) NOT NULL,
  `ThirdPartyName` text,
  PRIMARY KEY (`TicketID`),
  CONSTRAINT `fk_third_party_online_ticket` FOREIGN KEY (`TicketID`) REFERENCES `ticket` (`TicketID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `third_party_online_ticket`
--

LOCK TABLES `third_party_online_ticket` WRITE;
/*!40000 ALTER TABLE `third_party_online_ticket` DISABLE KEYS */;
INSERT INTO `third_party_online_ticket` VALUES ('T49','TicketMaster'),('T50','EventBrite'),('T51','SeatGeek'),('T52','SeatGeek'),('T53','SeatGeek'),('T54','SeatGeek'),('T55','SeatGeek'),('T56','SeatGeek'),('T57','EventBrite'),('T58','EventBrite'),('T59','EventBrite'),('T60','EventBrite'),('T61','EventBrite'),('T62','EventBrite'),('T63','EventBrite'),('T64','EventBrite'),('T65','EventBrite'),('T66','EventBrite'),('T67','EventBrite'),('T68','EventBrite'),('T69','TicketMaster'),('T70','TicketMaster'),('T71','TicketMaster'),('T72','TicketMaster'),('T73','TicketMaster'),('T74','TicketMaster'),('T75','TicketMaster'),('T76','TicketMaster'),('T77','TicketMaster'),('T78','TicketMaster'),('T79','TicketMaster'),('T80','TicketMaster'),('T81','SeatGeek'),('T82','SeatGeek'),('T83','EventBrite'),('T84','EventBrite');
/*!40000 ALTER TABLE `third_party_online_ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket` (
  `TicketID` varchar(10) NOT NULL,
  `OrderID` varchar(10) NOT NULL,
  `EventID` varchar(10) NOT NULL,
  `Price` int DEFAULT NULL,
  `Tier` int DEFAULT NULL,
  `PurchaseDate` date DEFAULT NULL,
  PRIMARY KEY (`TicketID`),
  KEY `fk_ticket_event` (`EventID`),
  KEY `fk_ticket_order` (`OrderID`),
  CONSTRAINT `fk_ticket_event` FOREIGN KEY (`EventID`) REFERENCES `event` (`EventID`),
  CONSTRAINT `fk_ticket_order` FOREIGN KEY (`OrderID`) REFERENCES `order` (`OrderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES ('T1','O1','1240',28,5,'2025-04-29'),('T10','O6','1238',87,2,'2025-04-15'),('T11','O6','1238',87,4,'2025-04-15'),('T12','O7','1241',21,1,'2025-07-15'),('T13','O8','1235',25,4,'2025-02-07'),('T14','O9','1236',44,4,'2025-02-18'),('T15','O10','1242',39,4,'2025-07-28'),('T16','O11','1234',56,3,'2025-01-02'),('T17','O11','1234',56,1,'2025-01-02'),('T18','O11','1234',56,4,'2025-01-02'),('T19','O12','1244',28,1,'2025-10-01'),('T2','O2','1235',70,5,'2025-02-01'),('T20','O13','1245',34,3,'2025-10-20'),('T21','O14','1243',120,3,'2025-08-26'),('T22','O14','1243',120,3,'2025-08-26'),('T23','O14','1243',120,2,'2025-08-26'),('T24','O14','1243',120,4,'2025-08-26'),('T25','O14','1243',120,4,'2025-08-26'),('T26','O15','1246',50,4,'2025-11-14'),('T27','O15','1246',50,2,'2025-11-14'),('T28','O16','1243',60,3,'2025-08-26'),('T29','O16','1243',60,3,'2025-08-26'),('T3','O2','1235',70,1,'2025-02-01'),('T30','O17','1246',40,4,'2025-11-13'),('T31','O18','1246',32,3,'2025-11-13'),('T32','O19','1247',28,1,'2025-12-20'),('T33','O20','1235',34,2,'2025-02-06'),('T34','O21','1240',35,2,'2025-05-12'),('T35','O22','1239',17,5,'2025-05-02'),('T36','O23','1239',49,1,'2025-05-01'),('T37','O24','1235',14,5,'2025-02-06'),('T38','O25','1244',42,5,'2025-09-30'),('T39','O26','1239',22,3,'2025-04-28'),('T4','O2','1235',70,3,'2025-02-01'),('T40','O27','1245',43,5,'2025-10-25'),('T41','O28','1239',43,5,'2025-04-26'),('T42','O29','1238',46,1,'2025-04-19'),('T43','O30','1239',36,1,'2025-04-29'),('T44','O31','1239',21,1,'2025-04-29'),('T45','O32','1239',16,1,'2025-04-29'),('T46','O33','1247',35,5,'2025-12-10'),('T47','O34','1247',11,4,'2025-12-11'),('T48','O35','1247',28,2,'2025-12-12'),('T49','O36','1234',39,4,'2025-01-01'),('T5','O3','1237',34,3,'2025-03-31'),('T50','O37','1240',33,4,'2025-05-12'),('T51','O38','1241',35,2,'2025-07-08'),('T52','O38','1241',35,3,'2025-07-08'),('T53','O39','1240',44,2,'2025-05-09'),('T54','O40','1247',39,1,'2025-12-20'),('T55','O41','1246',85,4,'2025-11-10'),('T56','O41','1246',85,4,'2025-11-10'),('T57','O42','1246',85,3,'2025-11-10'),('T58','O42','1242',85,3,'2025-07-30'),('T59','O42','1242',85,5,'2025-07-30'),('T6','O4','1234',45,5,'2025-01-07'),('T60','O43','1247',48,1,'2025-12-19'),('T61','O44','1244',44,4,'2025-10-01'),('T62','O45','1245',29,5,'2025-10-25'),('T63','O46','1244',27,2,'2025-10-01'),('T64','O47','1237',46,5,'2025-04-04'),('T65','O48','1240',75,1,'2025-05-10'),('T66','O48','1240',75,1,'2025-05-10'),('T67','O48','1240',75,3,'2025-05-10'),('T68','O48','1240',75,5,'2025-05-10'),('T69','O49','1243',32,4,'2025-08-20'),('T7','O5','1236',23,4,'2025-02-21'),('T70','O50','1241',30,5,'2025-07-10'),('T71','O50','1241',30,1,'2025-07-11'),('T72','O51','1242',21,5,'2025-07-23'),('T73','O52','1235',70,1,'2025-02-02'),('T74','O52','1235',70,2,'2025-02-02'),('T75','O52','1235',70,1,'2025-02-02'),('T76','O53','1239',70,5,'2025-05-01'),('T77','O54','1236',37,5,'2025-02-10'),('T78','O55','1237',42,4,'2025-04-01'),('T79','O56','1238',40,5,'2025-04-18'),('T8','O6','1238',87,4,'2025-04-15'),('T80','O56','1238',40,5,'2025-04-18'),('T81','O57','1234',50,2,'2025-01-01'),('T82','O57','1234',50,3,'2025-01-01'),('T83','O58','1236',50,3,'2025-02-10'),('T84','O59','1237',38,5,'2025-04-04'),('T9','O6','1238',87,3,'2025-04-15');
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendor`
--

DROP TABLE IF EXISTS `vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendor` (
  `VendorID` varchar(10) NOT NULL,
  `VendorName` text,
  `ContactPhone` text,
  `ContactEmail` text,
  PRIMARY KEY (`VendorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendor`
--

LOCK TABLES `vendor` WRITE;
/*!40000 ALTER TABLE `vendor` DISABLE KEYS */;
INSERT INTO `vendor` VALUES ('BV12','TheBeast','5773768766','TheBeast@goldones.com'),('BV13','BarWall','4611468893','BarWall@goldones.com'),('BV14','Saloon','8506566899','Saloon@goldones.com'),('BV15','GoldenTavern','1896410491','GoldenTavern@goldones.com'),('BV16','OneLastDrink','8346392573','OneLastDrink@goldones.com'),('BV17','FullGlassBar','9050295776','FullGlassBar@goldones.com'),('BV18','LacysBar','8875573600','LacysBar@goldones.com'),('BV19','RoamingDrinks','6761995035','RoamingDrinks@goldones.com'),('FV1','SnackHaven','8953443628','SnackHaven@goldones.com'),('FV10','PizzaGate','7653092221','PizzaGate@goldones.com'),('FV11','CarnitasLocos','5347170076','CarnitasLocos@goldones.com'),('FV2','SnackAttack','3195523122','SnackAttack@goldones.com'),('FV3','Treats&All','4599363595','Treats&All@goldones.com'),('FV4','Snackmania','3579648229','Snackmania@goldones.com'),('FV5','SnackGalaxy','6228674772','SnackGalaxy@goldones.com'),('FV6','BestBurgers','7928597489','BestBurgers@goldones.com'),('FV7','Out&In','1615451422','Out&In@goldones.com'),('FV8','HotdogRacers','6442728840','HotdogRacers@goldones.com'),('FV9','MadSlices','3622720573','MadSlices@goldones.com'),('RV1','GTQuarters','9091999089','GTQuarters@goldones.com'),('RV10','PerfectPosters','9212286142','PerfectPosters@goldones.com'),('RV11','LightTheNight','7775713386','LightTheNight@goldones.com'),('RV12','LitAccessories','6613559312','LitAccessories@goldones.com'),('RV13','BracletsOhMy','1001764668','BracletsOhMy@goldones.com'),('RV14','ThingsLikeThis','9617087391','ThingsLikeThis@goldones.com'),('RV15','ItemShop','3798469292','ItemShop@goldones.com'),('RV16','ToyBarrel','6222583856','ToyBarrel@goldones.com'),('RV17','FunTimeToys','9404785652','FunTimeToys@goldones.com'),('RV18','ToyHunter','3099111910','ToyHunter@goldones.com'),('RV19','NowOrNever','2157963234','NowOrNever@goldones.com'),('RV2','Stacys','6483689870','Stacys@goldones.com'),('RV20','CollectThemAll','1403333160','CollectThemAll@goldones.com'),('RV3','ColdIdea','8671445326','ColdIdea@goldones.com'),('RV4','Andrews','6265739435','Andrews@goldones.com'),('RV5','ShirtLocker','7475506537','ShirtLocker@goldones.com'),('RV6','DressPalace','8613555947','DressPalace@goldones.com'),('RV7','HangEmUp','8356989706','HangEmUp@goldones.com'),('RV8','DisPlayThem','1346813238','DisPlayThem@goldones.com'),('RV9','ShowPosters','3451913351','ShowPosters@goldones.com');
/*!40000 ALTER TABLE `vendor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venue_arena`
--

DROP TABLE IF EXISTS `venue_arena`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venue_arena` (
  `VenueID` varchar(10) NOT NULL,
  `VenueName` text,
  `Capacity` int DEFAULT NULL,
  PRIMARY KEY (`VenueID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venue_arena`
--

LOCK TABLES `venue_arena` WRITE;
/*!40000 ALTER TABLE `venue_arena` DISABLE KEYS */;
INSERT INTO `venue_arena` VALUES ('A','Luke and Furn Arena',10000),('B','Mint Moblie Pavilion ',5000),('C','Event Palace',1500),('D','The Roof',500);
/*!40000 ALTER TABLE `venue_arena` ENABLE KEYS */;
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

-- Dump completed on 2026-07-02  9:26:57
