-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: pizzeria
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
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `city_id` int NOT NULL AUTO_INCREMENT,
  `city_name` varchar(45) DEFAULT NULL,
  `region_region_id` int NOT NULL,
  PRIMARY KEY (`city_id`),
  KEY `fk_city_region_idx` (`region_region_id`),
  CONSTRAINT `fk_city_region` FOREIGN KEY (`region_region_id`) REFERENCES `region` (`region_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `client_id` int NOT NULL AUTO_INCREMENT,
  `client_name` varchar(45) DEFAULT NULL,
  `client_surname` varchar(45) DEFAULT NULL,
  `client_address` varchar(45) DEFAULT NULL,
  `client_zip_code` varchar(45) DEFAULT NULL,
  `client_region` varchar(45) DEFAULT NULL,
  `client_phone` varchar(45) DEFAULT NULL,
  `city_city_id` int NOT NULL,
  PRIMARY KEY (`client_id`),
  KEY `fk_client_city1_idx` (`city_city_id`),
  CONSTRAINT `fk_client_city1` FOREIGN KEY (`city_city_id`) REFERENCES `city` (`city_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `employee_id` int NOT NULL AUTO_INCREMENT,
  `employee_name` varchar(45) DEFAULT NULL,
  `employee_surname` varchar(45) DEFAULT NULL,
  `employee_id_num` varchar(45) DEFAULT NULL,
  `employee_phone` varchar(45) DEFAULT NULL,
  `employee_position` enum('delivery','cook') DEFAULT NULL,
  `shop_shop_id` int NOT NULL,
  PRIMARY KEY (`employee_id`),
  KEY `fk_employee_shop1_idx` (`shop_shop_id`),
  CONSTRAINT `fk_employee_shop1` FOREIGN KEY (`shop_shop_id`) REFERENCES `shop` (`shop_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `order_creation` datetime DEFAULT CURRENT_TIMESTAMP,
  `order_type` enum('restaurant','take_away') DEFAULT NULL,
  `order_price` decimal(10,0) DEFAULT NULL,
  `client_client_id` int NOT NULL,
  `employee_employee_id` int NOT NULL,
  `shop_shop_id` int NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `fk_order_client1_idx` (`client_client_id`),
  KEY `fk_order_employee1_idx` (`employee_employee_id`),
  KEY `fk_order_shop1_idx` (`shop_shop_id`),
  CONSTRAINT `fk_order_client1` FOREIGN KEY (`client_client_id`) REFERENCES `client` (`client_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_order_employee1` FOREIGN KEY (`employee_employee_id`) REFERENCES `employee` (`employee_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_order_shop1` FOREIGN KEY (`shop_shop_id`) REFERENCES `shop` (`shop_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order_uniques`
--

DROP TABLE IF EXISTS `order_uniques`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_uniques` (
  `order_uniques_id` int NOT NULL AUTO_INCREMENT,
  `order_uniques_amount` int DEFAULT NULL,
  `order_uniques_price` varchar(45) DEFAULT NULL,
  `products_products_id` int NOT NULL,
  `order_order_id` int NOT NULL,
  PRIMARY KEY (`order_uniques_id`),
  KEY `fk_order_uniques_products1_idx` (`products_products_id`),
  KEY `fk_order_uniques_order1_idx` (`order_order_id`),
  CONSTRAINT `fk_order_uniques_order1` FOREIGN KEY (`order_order_id`) REFERENCES `order` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_order_uniques_products1` FOREIGN KEY (`products_products_id`) REFERENCES `products` (`products_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pizza_cathegory`
--

DROP TABLE IF EXISTS `pizza_cathegory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pizza_cathegory` (
  `pizza_cathegory_id` int NOT NULL,
  `pizza_cathegory_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`pizza_cathegory_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `products_id` int NOT NULL,
  `products_name` varchar(45) DEFAULT NULL,
  `products_description` varchar(45) DEFAULT NULL,
  `products_pricture` varchar(45) DEFAULT NULL,
  `products_price` varchar(45) DEFAULT NULL,
  `products_type` enum('pizzas','burguers','drinks') DEFAULT NULL,
  `pizza_cathegory_pizza_cathegory_id` int NOT NULL,
  PRIMARY KEY (`products_id`),
  KEY `fk_product_pizza_cathegory1_idx` (`pizza_cathegory_pizza_cathegory_id`),
  CONSTRAINT `fk_product_pizza_cathegory1` FOREIGN KEY (`pizza_cathegory_pizza_cathegory_id`) REFERENCES `pizza_cathegory` (`pizza_cathegory_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `region` (
  `region_id` int NOT NULL AUTO_INCREMENT,
  `region_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`region_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shop`
--

DROP TABLE IF EXISTS `shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop` (
  `shop_id` int NOT NULL AUTO_INCREMENT,
  `shop_address` varchar(45) DEFAULT NULL,
  `shop_zip_code` varchar(45) DEFAULT NULL,
  `city_city_id` int NOT NULL,
  PRIMARY KEY (`shop_id`),
  KEY `fk_shop_city1_idx` (`city_city_id`),
  CONSTRAINT `fk_shop_city1` FOREIGN KEY (`city_city_id`) REFERENCES `city` (`city_id`) ON DELETE CASCADE ON UPDATE CASCADE
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

-- Dump completed on 2025-04-20 11:46:45
