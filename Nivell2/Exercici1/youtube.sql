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
  `users_users_id` int NOT NULL,
  PRIMARY KEY (`channels_id`),
  UNIQUE KEY `channels_name_UNIQUE` (`channels_name`),
  KEY `fk_channels_users1_idx` (`users_users_id`),
  CONSTRAINT `fk_channels_users1` FOREIGN KEY (`users_users_id`) REFERENCES `users` (`users_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `users_users_id` int NOT NULL,
  `videos_videos_id` int NOT NULL,
  PRIMARY KEY (`comments_id`),
  KEY `fk_comments_users1_idx` (`users_users_id`),
  KEY `fk_comments_videos1_idx` (`videos_videos_id`),
  CONSTRAINT `fk_comments_users1` FOREIGN KEY (`users_users_id`) REFERENCES `users` (`users_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_comments_videos1` FOREIGN KEY (`videos_videos_id`) REFERENCES `videos` (`videos_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `labels`
--

DROP TABLE IF EXISTS `labels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `labels` (
  `labels_id` int NOT NULL AUTO_INCREMENT,
  `labels_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`labels_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

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
-- Table structure for table `playlists_has_videos`
--

DROP TABLE IF EXISTS `playlists_has_videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlists_has_videos` (
  `playlists_has_videos_id` int NOT NULL AUTO_INCREMENT,
  `videos_videos_id` int NOT NULL,
  `playlists_playlists_id` int NOT NULL,
  PRIMARY KEY (`playlists_has_videos_id`,`videos_videos_id`,`playlists_playlists_id`),
  KEY `fk_playlists_has_videos_videos1_idx` (`videos_videos_id`),
  KEY `fk_playlists_has_videos_playlists1_idx` (`playlists_playlists_id`),
  CONSTRAINT `fk_playlists_has_videos_playlists1` FOREIGN KEY (`playlists_playlists_id`) REFERENCES `playlists` (`playlists_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_playlists_has_videos_videos1` FOREIGN KEY (`videos_videos_id`) REFERENCES `videos` (`videos_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  PRIMARY KEY (`users_id`),
  UNIQUE KEY `users_mail_UNIQUE` (`users_mail`),
  UNIQUE KEY `users_password_UNIQUE` (`users_password`),
  UNIQUE KEY `users_bdate_UNIQUE` (`users_bdate`),
  KEY `name` (`users_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users_has_subscriptions`
--

DROP TABLE IF EXISTS `users_has_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_has_subscriptions` (
  `users_has_subscriptions_id` int NOT NULL AUTO_INCREMENT,
  `users_users_id` int NOT NULL,
  `subscriptions_subscriptions_id` int NOT NULL,
  `channels_channels_id` int NOT NULL,
  PRIMARY KEY (`users_has_subscriptions_id`,`users_users_id`,`subscriptions_subscriptions_id`,`channels_channels_id`),
  KEY `fk_users_has_subscriptions_users1_idx` (`users_users_id`),
  KEY `fk_users_has_subscriptions_channels1_idx` (`channels_channels_id`),
  CONSTRAINT `fk_users_has_subscriptions_channels1` FOREIGN KEY (`channels_channels_id`) REFERENCES `channels` (`channels_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_users_has_subscriptions_users1` FOREIGN KEY (`users_users_id`) REFERENCES `users` (`users_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users_react_to_comments`
--

DROP TABLE IF EXISTS `users_react_to_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_react_to_comments` (
  `users_react_to_comments_id` int NOT NULL AUTO_INCREMENT,
  `users_users_id` int NOT NULL,
  `comments_comments_id` int NOT NULL,
  `users_react_to_comments_type` enum('1','0') DEFAULT NULL COMMENT 'Possible values:\n\n"1" = Like\n"2" = Dislike',
  `users_react_to_comments_timestamp` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`users_react_to_comments_id`,`users_users_id`,`comments_comments_id`),
  KEY `fk_users_react_to_comments_users1_idx` (`users_users_id`),
  KEY `fk_users_react_to_comments_comments1_idx` (`comments_comments_id`),
  CONSTRAINT `fk_users_react_to_comments_comments1` FOREIGN KEY (`comments_comments_id`) REFERENCES `comments` (`comments_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_users_react_to_comments_users1` FOREIGN KEY (`users_users_id`) REFERENCES `users` (`users_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `videos_videos_id` int NOT NULL,
  `users_users_id` int NOT NULL,
  PRIMARY KEY (`video_reactions_id`,`videos_videos_id`,`users_users_id`),
  KEY `fk_video_reactions_videos1_idx` (`videos_videos_id`),
  KEY `fk_video_reactions_users1_idx` (`users_users_id`),
  CONSTRAINT `fk_video_reactions_users1` FOREIGN KEY (`users_users_id`) REFERENCES `users` (`users_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_video_reactions_videos1` FOREIGN KEY (`videos_videos_id`) REFERENCES `videos` (`videos_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `users_users_id` int NOT NULL,
  PRIMARY KEY (`videos_id`),
  UNIQUE KEY `videos_file_name_UNIQUE` (`videos_file_name`),
  KEY `fk_videos_users1_idx` (`users_users_id`),
  CONSTRAINT `fk_videos_users1` FOREIGN KEY (`users_users_id`) REFERENCES `users` (`users_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `videos_has_labels`
--

DROP TABLE IF EXISTS `videos_has_labels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `videos_has_labels` (
  `videos_has_labels_id` int NOT NULL AUTO_INCREMENT,
  `labels_labels_id` int NOT NULL,
  `videos_videos_id` int NOT NULL,
  PRIMARY KEY (`videos_has_labels_id`,`labels_labels_id`,`videos_videos_id`),
  KEY `fk_videos_has_labels_labels1_idx` (`labels_labels_id`),
  KEY `fk_videos_has_labels_videos1_idx` (`videos_videos_id`),
  CONSTRAINT `fk_videos_has_labels_labels1` FOREIGN KEY (`labels_labels_id`) REFERENCES `labels` (`labels_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_videos_has_labels_videos1` FOREIGN KEY (`videos_videos_id`) REFERENCES `videos` (`videos_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-20 11:56:39
