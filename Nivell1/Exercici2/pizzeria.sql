-- MySQL Workbench Synchronization
-- Generated: 2025-05-06 11:06
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: otror

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

ALTER SCHEMA `pizzeria`  DEFAULT CHARACTER SET utf8  DEFAULT COLLATE utf8_general_ci ;

ALTER TABLE `pizzeria`.`client` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ,
CHANGE COLUMN `client_name` `client_name` VARCHAR(45) NOT NULL ,
CHANGE COLUMN `client_surname` `client_surname` VARCHAR(45) NOT NULL ,
CHANGE COLUMN `client_phone` `client_phone` VARCHAR(45) NOT NULL ;

ALTER TABLE `pizzeria`.`city` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ,
CHANGE COLUMN `city_name` `city_name` VARCHAR(45) NOT NULL ;

ALTER TABLE `pizzeria`.`region` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ,
CHANGE COLUMN `region_name` `region_name` VARCHAR(45) NOT NULL ;

ALTER TABLE `pizzeria`.`order` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ,
CHANGE COLUMN `order_creation` `order_creation` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ,
CHANGE COLUMN `order_type` `order_type` ENUM("restaurant", "take_away") NOT NULL ,
CHANGE COLUMN `order_price` `order_price` DECIMAL(10,2) NOT NULL ;

ALTER TABLE `pizzeria`.`pizza_category` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ,
CHANGE COLUMN `pizza_category_name` `pizza_category_name` VARCHAR(45) NOT NULL ;

ALTER TABLE `pizzeria`.`shop` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ,
CHANGE COLUMN `shop_address` `shop_address` VARCHAR(45) NOT NULL ,
CHANGE COLUMN `shop_zip_code` `shop_zip_code` VARCHAR(45) NOT NULL ;

ALTER TABLE `pizzeria`.`employee` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ,
CHANGE COLUMN `employee_name` `employee_name` VARCHAR(45) NOT NULL ,
CHANGE COLUMN `employee_surname` `employee_surname` VARCHAR(45) NOT NULL ,
CHANGE COLUMN `employee_id_num` `employee_id_num` VARCHAR(45) NOT NULL ,
CHANGE COLUMN `employee_phone` `employee_phone` VARCHAR(45) NOT NULL ,
CHANGE COLUMN `employee_position` `employee_position` ENUM("delivery", "cook") NOT NULL ;

ALTER TABLE `pizzeria`.`products` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ,
CHANGE COLUMN `products_name` `products_name` VARCHAR(45) NOT NULL ,
CHANGE COLUMN `products_description` `products_description` VARCHAR(45) NOT NULL ,
CHANGE COLUMN `products_picture` `products_picture` BLOB NOT NULL ,
CHANGE COLUMN `products_price` `products_price` DECIMAL(10,2) NOT NULL ,
CHANGE COLUMN `products_type` `products_type` ENUM("pizzas", "burguers", "drinks") NOT NULL ;

ALTER TABLE `pizzeria`.`order_uniques` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ,
CHANGE COLUMN `order_uniques_amount` `order_uniques_amount` INT(11) NOT NULL ,
CHANGE COLUMN `order_uniques_price` `order_uniques_price` DECIMAL(10,2) NOT NULL ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
