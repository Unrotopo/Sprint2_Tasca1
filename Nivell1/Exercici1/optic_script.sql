-- MySQL Workbench Synchronization
-- Generated: 2025-04-09 15:42
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: otror

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `optic_shop` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `optic_shop`.`suppliers` (
  `suppliers_id` INT(11) NOT NULL AUTO_INCREMENT,
  `suppliers_name` VARCHAR(45) NULL DEFAULT NULL,
  `suppliers_phone` VARCHAR(45) NULL DEFAULT NULL,
  `suppliers_fax` VARCHAR(45) NULL DEFAULT NULL,
  `suppliers_fiscal_id` VARCHAR(45) NULL DEFAULT NULL,
  `addresses_addresses_id` INT(11) NOT NULL,
  PRIMARY KEY (`suppliers_id`, `addresses_addresses_id`),
  INDEX `fk_suppliers_addresses1_idx` (`addresses_addresses_id` ASC) VISIBLE,
  CONSTRAINT `fk_suppliers_addresses1`
    FOREIGN KEY (`addresses_addresses_id`)
    REFERENCES `optic_shop`.`addresses` (`addresses_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `optic_shop`.`addresses` (
  `addresses_id` INT(11) NOT NULL,
  `addresses_street` VARCHAR(45) NULL DEFAULT NULL,
  `addresses_street_num` VARCHAR(45) NULL DEFAULT NULL,
  `addresses_floor` VARCHAR(45) NULL DEFAULT NULL,
  `addresses_door` VARCHAR(45) NULL DEFAULT NULL,
  `addresses_city` VARCHAR(45) NULL DEFAULT NULL,
  `addresses_zip` VARCHAR(45) NULL DEFAULT NULL,
  `addresses_country` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`addresses_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `optic_shop`.`clients` (
  `clients_id` INT(11) NOT NULL,
  `clients_first_name` VARCHAR(45) NULL DEFAULT NULL,
  `clients_last_name` VARCHAR(45) NULL DEFAULT NULL,
  `clients_phone` VARCHAR(45) NULL DEFAULT NULL,
  `clients_email` VARCHAR(45) NULL DEFAULT NULL,
  `clients_creation_date` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `recomended_by_id` INT(11) NOT NULL,
  `addresses_addresses_id` INT(11) NOT NULL,
  PRIMARY KEY (`clients_id`, `addresses_addresses_id`),
  INDEX `fk_recomended_by1_idx` (`recomended_by_id` ASC) VISIBLE,
  INDEX `fk_clients_addresses1_idx` (`addresses_addresses_id` ASC) VISIBLE,
  CONSTRAINT `fk_clients_clients1`
    FOREIGN KEY (`recomended_by_id`)
    REFERENCES `optic_shop`.`clients` (`clients_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_clients_addresses1`
    FOREIGN KEY (`addresses_addresses_id`)
    REFERENCES `optic_shop`.`addresses` (`addresses_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `optic_shop`.`glasses` (
  `glasses_id` INT(11) NOT NULL,
  `glasses_brand` VARCHAR(45) NULL DEFAULT NULL,
  `glasses_prescription` DECIMAL(4,2) NULL DEFAULT NULL,
  `glasses_frame` ENUM("M", "P", "F") NULL DEFAULT NULL,
  `glasses_frame_color` VARCHAR(45) NULL DEFAULT NULL,
  `glasses_lens_color_left` VARCHAR(45) NULL DEFAULT NULL,
  `glasses_lens_color_right` VARCHAR(45) NULL DEFAULT NULL,
  `glasses_price` DECIMAL(6,2) NULL DEFAULT NULL,
  `suppliers_suppliers_id` INT(11) NOT NULL,
  PRIMARY KEY (`glasses_id`),
  INDEX `fk_glasses_suppliers1_idx` (`suppliers_suppliers_id` ASC) VISIBLE,
  CONSTRAINT `fk_glasses_suppliers1`
    FOREIGN KEY (`suppliers_suppliers_id`)
    REFERENCES `optic_shop`.`suppliers` (`suppliers_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `optic_shop`.`sales` (
  `sales_id` INT(11) NOT NULL,
  `sales_total` DECIMAL(7,2) NULL DEFAULT NULL,
  `sales_date` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `clients_clients_id` INT(11) NOT NULL,
  `employees_employees_id` INT(11) NOT NULL,
  PRIMARY KEY (`sales_id`),
  INDEX `fk_sales_clients1_idx` (`clients_clients_id` ASC) VISIBLE,
  INDEX `fk_sales_employees1_idx` (`employees_employees_id` ASC) VISIBLE,
  CONSTRAINT `fk_sales_clients1`
    FOREIGN KEY (`clients_clients_id`)
    REFERENCES `optic_shop`.`clients` (`clients_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_sales_employees1`
    FOREIGN KEY (`employees_employees_id`)
    REFERENCES `optic_shop`.`employees` (`employees_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `optic_shop`.`sales_has_glasses` (
  `sales_has_glasses_id` INT(11) NOT NULL,
  `glasses_glasses_id` INT(11) NOT NULL,
  `sales_sales_id` INT(11) NOT NULL,
  PRIMARY KEY (`sales_has_glasses_id`, `glasses_glasses_id`, `sales_sales_id`),
  INDEX `fk_sales_has_glasses_glasses_idx` (`glasses_glasses_id` ASC) VISIBLE,
  INDEX `fk_sales_has_glasses_sales1_idx` (`sales_sales_id` ASC) VISIBLE,
  CONSTRAINT `fk_sales_has_glasses_glasses`
    FOREIGN KEY (`glasses_glasses_id`)
    REFERENCES `optic_shop`.`glasses` (`glasses_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_sales_has_glasses_sales1`
    FOREIGN KEY (`sales_sales_id`)
    REFERENCES `optic_shop`.`sales` (`sales_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `optic_shop`.`employees` (
  `employees_id` INT(11) NOT NULL AUTO_INCREMENT,
  `employees_name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`employees_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
