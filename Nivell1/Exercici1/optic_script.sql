-- MySQL Workbench Synchronization
-- Generated: 2025-05-06 11:03
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: otror

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

ALTER SCHEMA `optic_shop`  DEFAULT CHARACTER SET utf8  DEFAULT COLLATE utf8_general_ci ;

ALTER TABLE `optic_shop`.`clients` 
DROP FOREIGN KEY `fk_clients_clients1`;

ALTER TABLE `optic_shop`.`glasses` 
DROP FOREIGN KEY `fk_glasses_suppliers1`;

ALTER TABLE `optic_shop`.`suppliers` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ,
CHANGE COLUMN `suppliers_name` `suppliers_name` VARCHAR(45) NOT NULL ,
CHANGE COLUMN `suppliers_phone` `suppliers_phone` VARCHAR(45) NOT NULL ,
CHANGE COLUMN `suppliers_fiscal_id` `suppliers_fiscal_id` VARCHAR(45) NOT NULL ;

ALTER TABLE `optic_shop`.`addresses` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ,
CHANGE COLUMN `addresses_street` `addresses_street` VARCHAR(45) NOT NULL ,
CHANGE COLUMN `addresses_street_num` `addresses_street_num` VARCHAR(45) NOT NULL ,
CHANGE COLUMN `addresses_city` `addresses_city` VARCHAR(45) NOT NULL ,
CHANGE COLUMN `addresses_zip` `addresses_zip` VARCHAR(45) NOT NULL ,
CHANGE COLUMN `addresses_country` `addresses_country` VARCHAR(45) NOT NULL ;

ALTER TABLE `optic_shop`.`clients` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ,
DROP COLUMN `recomended_by_id`,
ADD COLUMN `recomended_by_recomended_by_id` INT(11) NOT NULL AFTER `addresses_addresses_id`,
CHANGE COLUMN `clients_first_name` `clients_first_name` VARCHAR(45) NOT NULL ,
CHANGE COLUMN `clients_last_name` `clients_last_name` VARCHAR(45) NOT NULL ,
CHANGE COLUMN `clients_phone` `clients_phone` VARCHAR(45) NOT NULL ,
CHANGE COLUMN `clients_email` `clients_email` VARCHAR(45) NOT NULL ,
CHANGE COLUMN `clients_creation_date` `clients_creation_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ,
ADD INDEX `fk_clients_recomended_by1_idx` (`recomended_by_recomended_by_id` ASC) VISIBLE,
DROP INDEX `fk_recomended_by1_idx` ;
;

ALTER TABLE `optic_shop`.`glasses` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ,
DROP COLUMN `suppliers_suppliers_id`,
DROP COLUMN `glasses_brand`,
ADD COLUMN `brands_brands_id` INT(11) NOT NULL AFTER `glasses_price`,
CHANGE COLUMN `glasses_prescription` `glasses_prescription` DECIMAL(4,2) NOT NULL ,
CHANGE COLUMN `glasses_frame` `glasses_frame` ENUM("M", "P", "F") NOT NULL ,
CHANGE COLUMN `glasses_frame_color` `glasses_frame_color` VARCHAR(45) NOT NULL ,
CHANGE COLUMN `glasses_lens_color_left` `glasses_lens_color_left` VARCHAR(45) NOT NULL ,
CHANGE COLUMN `glasses_lens_color_right` `glasses_lens_color_right` VARCHAR(45) NOT NULL ,
CHANGE COLUMN `glasses_price` `glasses_price` DECIMAL(6,2) NOT NULL ,
ADD INDEX `fk_glasses_brands1_idx` (`brands_brands_id` ASC) VISIBLE,
DROP INDEX `fk_glasses_suppliers1_idx` ;
;

ALTER TABLE `optic_shop`.`sales` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ,
CHANGE COLUMN `sales_total` `sales_total` DECIMAL(7,2) NOT NULL ,
CHANGE COLUMN `sales_date` `sales_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ;

ALTER TABLE `optic_shop`.`sales_has_glasses` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `optic_shop`.`employees` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ,
CHANGE COLUMN `employees_name` `employees_name` VARCHAR(45) NOT NULL ;

CREATE TABLE IF NOT EXISTS `optic_shop`.`recomended_by` (
  `recomended_by_id` INT(11) NOT NULL AUTO_INCREMENT,
  `recomended_by_client_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`recomended_by_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `optic_shop`.`brands` (
  `brands_id` INT(11) NOT NULL AUTO_INCREMENT,
  `brands_name` VARCHAR(45) NOT NULL,
  `suppliers_suppliers_id` INT(11) NOT NULL,
  PRIMARY KEY (`brands_id`),
  INDEX `fk_brands_suppliers1_idx` (`suppliers_suppliers_id` ASC) VISIBLE,
  CONSTRAINT `fk_brands_suppliers1`
    FOREIGN KEY (`suppliers_suppliers_id`)
    REFERENCES `optic_shop`.`suppliers` (`suppliers_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

ALTER TABLE `optic_shop`.`clients` 
ADD CONSTRAINT `fk_clients_recomended_by1`
  FOREIGN KEY (`recomended_by_recomended_by_id`)
  REFERENCES `optic_shop`.`recomended_by` (`recomended_by_id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

ALTER TABLE `optic_shop`.`glasses` 
ADD CONSTRAINT `fk_glasses_brands1`
  FOREIGN KEY (`brands_brands_id`)
  REFERENCES `optic_shop`.`brands` (`brands_id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
