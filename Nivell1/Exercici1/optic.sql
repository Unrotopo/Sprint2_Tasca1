-- MySQL Workbench Synchronization
-- Generated: 2025-04-03 13:06
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: otror

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `optic` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `optic`.`suppliers` (
  `suppliers_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `phone_num` VARCHAR(45) NULL DEFAULT NULL,
  `fax` VARCHAR(45) NULL DEFAULT NULL,
  `fiscal_id` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`suppliers_id`),
  UNIQUE INDEX `fiscal_id_UNIQUE` (`fiscal_id` ASC) VISIBLE,
  INDEX `name` (`name` ASC) INVISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `optic`.`addresses` (
  `addresses_id` INT(11) NOT NULL AUTO_INCREMENT,
  `street` VARCHAR(45) NULL DEFAULT NULL,
  `street_num` INT(10) UNSIGNED NULL DEFAULT NULL,
  `floor` INT(11) NULL DEFAULT NULL,
  `door` CHAR(1) NULL DEFAULT NULL,
  `city` VARCHAR(45) NULL DEFAULT NULL,
  `zip_code` VARCHAR(45) NULL DEFAULT NULL,
  `country` VARCHAR(45) NULL DEFAULT NULL,
  `suppliers_suppliers_id` INT(11) NOT NULL,
  `clients_clients_id` INT(11) NOT NULL,
  PRIMARY KEY (`addresses_id`),
  INDEX `fk_addresses_suppliers1_idx` (`suppliers_suppliers_id` ASC) VISIBLE,
  INDEX `fk_addresses_clients1_idx` (`clients_clients_id` ASC) VISIBLE,
  CONSTRAINT `fk_addresses_suppliers1`
    FOREIGN KEY (`suppliers_suppliers_id`)
    REFERENCES `optic`.`suppliers` (`suppliers_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_addresses_clients1`
    FOREIGN KEY (`clients_clients_id`)
    REFERENCES `optic`.`clients` (`clients_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `optic`.`glasses` (
  `glasses_id` INT(11) NOT NULL AUTO_INCREMENT,
  `brand` VARCHAR(45) NULL DEFAULT NULL,
  `prescription` FLOAT(11) NULL DEFAULT NULL,
  `frame` VARCHAR(1) NULL DEFAULT NULL COMMENT 'Possible values:\n\nF = floating frame\nP = plastic frame\nM = metalic frame',
  `frame_color` VARCHAR(45) NULL DEFAULT NULL,
  `lens_color_left` VARCHAR(45) NULL DEFAULT NULL,
  `lens_color_right` VARCHAR(45) NULL DEFAULT NULL,
  `price` DECIMAL NULL DEFAULT NULL,
  `suppliers_suppliers_id` INT(11) NOT NULL,
  PRIMARY KEY (`glasses_id`, `suppliers_suppliers_id`),
  INDEX `fk_glasses_suppliers1_idx` (`suppliers_suppliers_id` ASC) VISIBLE,
  INDEX `brand` (`brand` ASC) VISIBLE,
  CONSTRAINT `fk_glasses_suppliers1`
    FOREIGN KEY (`suppliers_suppliers_id`)
    REFERENCES `optic`.`suppliers` (`suppliers_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `optic`.`clients` (
  `clients_id` INT(11) NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NULL DEFAULT NULL,
  `last_name` VARCHAR(45) NULL DEFAULT NULL,
  `phone` VARCHAR(45) NULL DEFAULT NULL,
  `mail` VARCHAR(225) NULL DEFAULT NULL,
  `creation_date` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `recomended_by` INT(11) NOT NULL,
  PRIMARY KEY (`clients_id`),
  UNIQUE INDEX `mail_UNIQUE` (`mail` ASC) VISIBLE,
  INDEX `fk_clients_clients1_idx` (`recomended_by` ASC) VISIBLE,
  INDEX `phone` (`phone` ASC) INVISIBLE,
  INDEX `mail` (`mail` ASC) VISIBLE,
  CONSTRAINT `fk_clients_clients1`
    FOREIGN KEY (`recomended_by`)
    REFERENCES `optic`.`clients` (`clients_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `optic`.`sales` (
  `sales_id` INT(11) NOT NULL AUTO_INCREMENT,
  `clients_clients_id` INT(11) NOT NULL,
  `sales_total` DECIMAL NULL DEFAULT NULL,
  `sales_date` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `employee_employee_id` INT(11) NOT NULL,
  PRIMARY KEY (`sales_id`, `clients_clients_id`, `employee_employee_id`),
  INDEX `fk_glasses_purchased_clients1_idx` (`clients_clients_id` ASC) VISIBLE,
  INDEX `fk_sales_employee1_idx` (`employee_employee_id` ASC) VISIBLE,
  INDEX `client` (`clients_clients_id` ASC) VISIBLE,
  INDEX `date` (`sales_date` ASC) VISIBLE,
  CONSTRAINT `fk_glasses_purchased_clients1`
    FOREIGN KEY (`clients_clients_id`)
    REFERENCES `optic`.`clients` (`clients_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sales_employee1`
    FOREIGN KEY (`employee_employee_id`)
    REFERENCES `optic`.`employee` (`employee_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `optic`.`employee` (
  `employee_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`employee_id`),
  INDEX `name` (`name` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `optic`.`sales_unique` (
  `sales_unique_id` INT(11) NOT NULL AUTO_INCREMENT,
  `price` DECIMAL NULL DEFAULT NULL,
  `glasses_glasses_id` INT(11) NOT NULL,
  `sales_sales_id` INT(11) NOT NULL,
  `sales_clients_clients_id` INT(11) NOT NULL,
  PRIMARY KEY (`sales_unique_id`, `glasses_glasses_id`),
  INDEX `fk_sales_unique_glasses1_idx` (`glasses_glasses_id` ASC) VISIBLE,
  INDEX `fk_sales_unique_sales1_idx` (`sales_sales_id` ASC, `sales_clients_clients_id` ASC) VISIBLE,
  CONSTRAINT `fk_sales_unique_glasses1`
    FOREIGN KEY (`glasses_glasses_id`)
    REFERENCES `optic`.`glasses` (`glasses_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sales_unique_sales1`
    FOREIGN KEY (`sales_sales_id` , `sales_clients_clients_id`)
    REFERENCES `optic`.`sales` (`sales_id` , `clients_clients_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
