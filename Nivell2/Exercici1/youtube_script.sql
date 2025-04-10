CREATE DATABASE  IF NOT EXISTS `youtube` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `youtube`;
-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: youtube
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `channels`
--

DROP TABLE IF EXISTS `channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `channels` (
  `channels_id` int NOT NULL AUTO_INCREMENT,
  `channels_name` varchar(45) DEFAULT NULL,
  `channels_description` varchar(45) DEFAULT NULL,
  `channels_creation_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`channels_id`),
  UNIQUE KEY `channels_name_UNIQUE` (`channels_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channels`
--

LOCK TABLES `channels` WRITE;
/*!40000 ALTER TABLE `channels` DISABLE KEYS */;
/*!40000 ALTER TABLE `channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment_opinion`
--

DROP TABLE IF EXISTS `comment_opinion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment_opinion` (
  `comment_opinion_id` int NOT NULL AUTO_INCREMENT,
  `comment_dis_likes` enum('1','0') DEFAULT NULL COMMENT 'Possible values:\n\n"1" = Comment liked by user\n"0" = Comment disliked by user',
  `comment_opinion_datetime` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `videos_videos_id` int NOT NULL,
  `users_users_id` int NOT NULL,
  PRIMARY KEY (`comment_opinion_id`),
  KEY `fk_comment_opinion_videos1_idx` (`videos_videos_id`),
  KEY `fk_comment_opinion_users1_idx` (`users_users_id`),
  CONSTRAINT `fk_comment_opinion_users1` FOREIGN KEY (`users_users_id`) REFERENCES `users` (`users_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_comment_opinion_videos1` FOREIGN KEY (`videos_videos_id`) REFERENCES `videos` (`videos_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_opinion`
--

LOCK TABLES `comment_opinion` WRITE;
/*!40000 ALTER TABLE `comment_opinion` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment_opinion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `comments_id` int NOT NULL AUTO_INCREMENT,
  `comments_text` varchar(45) DEFAULT NULL,
  `comments_creation_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `videos_videos_id` int NOT NULL,
  `users_users_id` int NOT NULL,
  PRIMARY KEY (`comments_id`),
  KEY `fk_comments_videos1_idx` (`videos_videos_id`),
  KEY `fk_comments_users1_idx` (`users_users_id`),
  CONSTRAINT `fk_comments_users1` FOREIGN KEY (`users_users_id`) REFERENCES `users` (`users_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_comments_videos1` FOREIGN KEY (`videos_videos_id`) REFERENCES `videos` (`videos_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `labels`
--

DROP TABLE IF EXISTS `labels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `labels` (
  `labels_id` int NOT NULL AUTO_INCREMENT,
  `labels_name` varchar(45) DEFAULT NULL,
  `videos_videos_id` int NOT NULL,
  PRIMARY KEY (`labels_id`),
  KEY `fk_labels_videos1_idx` (`videos_videos_id`),
  CONSTRAINT `fk_labels_videos1` FOREIGN KEY (`videos_videos_id`) REFERENCES `videos` (`videos_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `labels`
--

LOCK TABLES `labels` WRITE;
/*!40000 ALTER TABLE `labels` DISABLE KEYS */;
/*!40000 ALTER TABLE `labels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlists`
--

DROP TABLE IF EXISTS `playlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlists` (
  `playlists_id` int NOT NULL AUTO_INCREMENT,
  `playlists_name` varchar(45) DEFAULT NULL,
  `playlists_creation_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `playlists_state` enum('public','private') DEFAULT NULL,
  `users_users_id` int NOT NULL,
  PRIMARY KEY (`playlists_id`),
  UNIQUE KEY `playlists_name_UNIQUE` (`playlists_name`),
  KEY `fk_playlists_users1_idx` (`users_users_id`),
  CONSTRAINT `fk_playlists_users1` FOREIGN KEY (`users_users_id`) REFERENCES `users` (`users_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlists`
--

LOCK TABLES `playlists` WRITE;
/*!40000 ALTER TABLE `playlists` DISABLE KEYS */;
/*!40000 ALTER TABLE `playlists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriptions`
--

DROP TABLE IF EXISTS `subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscriptions` (
  `subscriptions_id` int NOT NULL AUTO_INCREMENT,
  `channels_channels_id` int NOT NULL,
  `users_users_id` int NOT NULL,
  PRIMARY KEY (`subscriptions_id`),
  KEY `fk_suscriptions_channels1_idx` (`channels_channels_id`),
  KEY `fk_suscriptions_users1_idx` (`users_users_id`),
  CONSTRAINT `fk_suscriptions_channels1` FOREIGN KEY (`channels_channels_id`) REFERENCES `channels` (`channels_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_suscriptions_users1` FOREIGN KEY (`users_users_id`) REFERENCES `users` (`users_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriptions`
--

LOCK TABLES `subscriptions` WRITE;
/*!40000 ALTER TABLE `subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `users_id` int NOT NULL AUTO_INCREMENT,
  `users_mail` varchar(45) DEFAULT NULL,
  `users_password` varchar(45) DEFAULT NULL,
  `users_name` varchar(45) DEFAULT NULL,
  `users_bdate` date DEFAULT NULL,
  `users_sex` varchar(45) DEFAULT NULL,
  `users_country` varchar(45) DEFAULT NULL,
  `users_zip_code` varchar(45) DEFAULT NULL,
  `videos_videos_id` int NOT NULL,
  `channels_channels_id` int NOT NULL,
  PRIMARY KEY (`users_id`),
  UNIQUE KEY `users_mail_UNIQUE` (`users_mail`),
  UNIQUE KEY `users_password_UNIQUE` (`users_password`),
  UNIQUE KEY `users_bdate_UNIQUE` (`users_bdate`),
  KEY `fk_user_video1_idx` (`videos_videos_id`),
  KEY `fk_user_channel1_idx` (`channels_channels_id`),
  KEY `name` (`users_name`),
  CONSTRAINT `fk_user_channel1` FOREIGN KEY (`channels_channels_id`) REFERENCES `channels` (`channels_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user_video1` FOREIGN KEY (`videos_videos_id`) REFERENCES `videos` (`videos_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video_reactions`
--

DROP TABLE IF EXISTS `video_reactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `video_reactions` (
  `video_reactions_id` int NOT NULL AUTO_INCREMENT,
  `video_reactions_sign` enum('1','0') DEFAULT NULL COMMENT 'Possible values:\n\n"1" = Like\n"0" = Dislike',
  `video_reactions_datetime` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `users_users_id` int NOT NULL,
  `videos_videos_id` int NOT NULL,
  PRIMARY KEY (`video_reactions_id`),
  KEY `fk_likes_users1_idx` (`users_users_id`),
  KEY `fk_video_reactions_videos1_idx` (`videos_videos_id`),
  CONSTRAINT `fk_likes_users1` FOREIGN KEY (`users_users_id`) REFERENCES `users` (`users_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_video_reactions_videos1` FOREIGN KEY (`videos_videos_id`) REFERENCES `videos` (`videos_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video_reactions`
--

LOCK TABLES `video_reactions` WRITE;
/*!40000 ALTER TABLE `video_reactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `video_reactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videos`
--

DROP TABLE IF EXISTS `videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `videos` (
  `videos_id` int NOT NULL AUTO_INCREMENT,
  `videos_title` varchar(45) DEFAULT NULL,
  `videos_description` varchar(45) DEFAULT NULL,
  `videos_size` varchar(45) DEFAULT NULL,
  `videos_file_name` varchar(45) DEFAULT NULL,
  `videos_duration` varchar(45) DEFAULT NULL,
  `videos_thumbnail` varchar(45) DEFAULT NULL,
  `videos_reproduction_num` int DEFAULT NULL,
  `videos_likes_num` int DEFAULT NULL,
  `videos_dislikes_num` int DEFAULT NULL,
  `videos_state` enum('public','hiden','private') DEFAULT NULL,
  `videos_creation_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `playlists_playlists_id` int NOT NULL,
  PRIMARY KEY (`videos_id`),
  UNIQUE KEY `videos_file_name_UNIQUE` (`videos_file_name`),
  KEY `fk_videos_playlists1_idx` (`playlists_playlists_id`),
  CONSTRAINT `fk_videos_playlists1` FOREIGN KEY (`playlists_playlists_id`) REFERENCES `playlists` (`playlists_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videos`
--

LOCK TABLES `videos` WRITE;
/*!40000 ALTER TABLE `videos` DISABLE KEYS */;
/*!40000 ALTER TABLE `videos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-09 10:34:36
