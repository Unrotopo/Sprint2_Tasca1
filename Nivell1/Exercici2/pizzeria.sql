-- MySQL Workbench Synchronization
-- Generated: 2025-04-03 17:14
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: otror

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

ALTER SCHEMA `pizzeria`  DEFAULT CHARACTER SET utf8  DEFAULT COLLATE utf8_general_ci ;

ALTER TABLE `pizzeria`.`client` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `pizzeria`.`city` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `pizzeria`.`region` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `pizzeria`.`order` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ,
ADD COLUMN `order_price` DECIMAL NULL DEFAULT NULL AFTER `order_type`,
CHANGE COLUMN `order_type` `order_type` ENUM("restaurant", "take_away") NULL DEFAULT NULL ;

ALTER TABLE `pizzeria`.`drinks` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ,
CHANGE COLUMN `drinks_price` `drinks_price` DECIMAL NULL DEFAULT NULL ;

ALTER TABLE `pizzeria`.`burguers` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ,
CHANGE COLUMN `burguers_price` `burguers_price` DECIMAL NULL DEFAULT NULL ;

ALTER TABLE `pizzeria`.`pizzas` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ,
CHANGE COLUMN `pizzas_price` `pizzas_price` DECIMAL NULL DEFAULT NULL ;

ALTER TABLE `pizzeria`.`pizza_cathegory` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `pizzeria`.`shop` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `pizzeria`.`employee` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ,
CHANGE COLUMN `employee_position` `employee_position` ENUM("delivery", "cook") NULL DEFAULT NULL ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
