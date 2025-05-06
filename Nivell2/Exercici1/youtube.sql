-- MySQL Workbench Synchronization
-- Generated: 2025-05-06 11:09
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: otror

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

ALTER SCHEMA `youtube`  DEFAULT CHARACTER SET utf8  DEFAULT COLLATE utf8_general_ci ;

ALTER TABLE `youtube`.`users` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ,
CHANGE COLUMN `users_mail` `users_mail` VARCHAR(45) NOT NULL ,
CHANGE COLUMN `users_password` `users_password` VARCHAR(45) NOT NULL ,
CHANGE COLUMN `users_name` `users_name` VARCHAR(45) NOT NULL ,
CHANGE COLUMN `users_country` `users_country` VARCHAR(45) NOT NULL ,
CHANGE COLUMN `users_zip_code` `users_zip_code` VARCHAR(45) NOT NULL ;

ALTER TABLE `youtube`.`videos` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ,
CHANGE COLUMN `videos_title` `videos_title` VARCHAR(45) NOT NULL ,
CHANGE COLUMN `videos_description` `videos_description` VARCHAR(45) NOT NULL ,
CHANGE COLUMN `videos_size` `videos_size` VARCHAR(45) NOT NULL ,
CHANGE COLUMN `videos_file_name` `videos_file_name` VARCHAR(45) NOT NULL ,
CHANGE COLUMN `videos_duration` `videos_duration` VARCHAR(45) NOT NULL ,
CHANGE COLUMN `videos_thumbnail` `videos_thumbnail` VARCHAR(45) NOT NULL ,
CHANGE COLUMN `videos_reproduction_num` `videos_reproduction_num` INT(11) NOT NULL ,
CHANGE COLUMN `videos_likes_num` `videos_likes_num` INT(11) NOT NULL ,
CHANGE COLUMN `videos_dislikes_num` `videos_dislikes_num` INT(11) NOT NULL ,
CHANGE COLUMN `videos_state` `videos_state` ENUM("public", "hiden", "private") NOT NULL ,
CHANGE COLUMN `videos_creation_time` `videos_creation_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ;

ALTER TABLE `youtube`.`labels` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ,
CHANGE COLUMN `labels_name` `labels_name` VARCHAR(45) NOT NULL ;

ALTER TABLE `youtube`.`channels` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ,
CHANGE COLUMN `channels_name` `channels_name` VARCHAR(45) NOT NULL ,
CHANGE COLUMN `channels_description` `channels_description` VARCHAR(45) NOT NULL ,
CHANGE COLUMN `channels_creation_date` `channels_creation_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ;

ALTER TABLE `youtube`.`video_reactions` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ,
CHANGE COLUMN `video_reactions_sign` `video_reactions_sign` ENUM("1", "0") NOT NULL COMMENT 'Possible values:\n\n\"1\" = Like\n\"0\" = Dislike' ,
CHANGE COLUMN `video_reactions_datetime` `video_reactions_datetime` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ;

ALTER TABLE `youtube`.`playlists` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ,
CHANGE COLUMN `playlists_name` `playlists_name` VARCHAR(45) NOT NULL ,
CHANGE COLUMN `playlists_creation_date` `playlists_creation_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ,
CHANGE COLUMN `playlists_state` `playlists_state` ENUM("public", "private") NOT NULL ;

ALTER TABLE `youtube`.`comments` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ,
CHANGE COLUMN `comments_text` `comments_text` VARCHAR(45) NOT NULL ,
CHANGE COLUMN `comments_creation_time` `comments_creation_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ;

ALTER TABLE `youtube`.`videos_has_labels` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `youtube`.`users_has_subscriptions` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `youtube`.`playlists_has_videos` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `youtube`.`users_react_to_comments` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ,
CHANGE COLUMN `users_react_to_comments_type` `users_react_to_comments_type` ENUM("1", "0") NOT NULL COMMENT 'Possible values:\n\n\"1\" = Like\n\"2\" = Dislike' ,
CHANGE COLUMN `users_react_to_comments_timestamp` `users_react_to_comments_timestamp` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
