-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.32-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for pj-projekat
CREATE DATABASE IF NOT EXISTS `pj-projekat` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `pj-projekat`;

-- Dumping structure for table pj-projekat.customer
CREATE TABLE IF NOT EXISTS `customer` (
  `customer_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table pj-projekat.customer: ~1 rows (approximately)
INSERT INTO `customer` (`customer_id`, `first_name`, `last_name`, `phone`, `email`) VALUES
	(1, 'RASDADAD', 'asdsad', '313213213', '2@gmail.com'),
	(2, '1', '1', '1', '1@1');

-- Dumping structure for table pj-projekat.poem_request
CREATE TABLE IF NOT EXISTS `poem_request` (
  `poem_request_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned NOT NULL,
  `poet_id` int(10) unsigned NOT NULL,
  `poem_theme` varchar(255) NOT NULL DEFAULT '',
  `additional_note` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`poem_request_id`),
  KEY `fk_poem_request_customer_id` (`customer_id`),
  KEY `fk_poem_request_poet_id` (`poet_id`),
  CONSTRAINT `fk_poem_request_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_poem_request_poet_id` FOREIGN KEY (`poet_id`) REFERENCES `poet` (`poet_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table pj-projekat.poem_request: ~1 rows (approximately)
INSERT INTO `poem_request` (`poem_request_id`, `customer_id`, `poet_id`, `poem_theme`, `additional_note`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 1, 2, 'ADVENTURE', 'sadsa', '2025-07-02 16:56:13', '2025-07-02 16:56:18', '2025-07-02 16:56:21'),
	(2, 2, 2, 'Love', '11', '2025-07-02 16:58:49', NULL, NULL);

-- Dumping structure for table pj-projekat.poet
CREATE TABLE IF NOT EXISTS `poet` (
  `poet_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `poet_name` varchar(255) NOT NULL,
  PRIMARY KEY (`poet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table pj-projekat.poet: ~6 rows (approximately)
INSERT INTO `poet` (`poet_id`, `poet_name`) VALUES
	(1, 'Roven Hollowbeak'),
	(2, 'Talon Windmere'),
	(3, 'Corbin Nightwing'),
	(4, 'Nella Ashfeather'),
	(5, 'Peregrine Ravenshawk'),
	(6, 'Elira Greycrow');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
