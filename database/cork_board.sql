-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.4.3 - MySQL Community Server - GPL
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


-- Dumping database structure for cork_board
CREATE DATABASE IF NOT EXISTS `cork_board` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `cork_board`;

-- Dumping structure for table cork_board.boards
CREATE TABLE IF NOT EXISTS `boards` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `title` varchar(100) NOT NULL,
  `color` varchar(20) DEFAULT '#ffffff',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_boards_user` (`user_id`),
  CONSTRAINT `boards_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table cork_board.boards: ~4 rows (approximately)
INSERT INTO `boards` (`id`, `user_id`, `title`, `color`, `created_at`, `updated_at`) VALUES
	(1, 2, 'FACEBOOK', '#383d99', '2025-10-19 18:48:13', '2025-10-19 18:57:05'),
	(3, 2, 'Yeah', '#3b3b3b', '2025-10-19 23:31:28', '2025-10-19 23:33:35'),
	(5, 3, 'Boarding', '#79674e', '2025-10-20 03:10:15', '2025-10-20 03:10:27'),
	(6, 3, 'a', '#9c7d52', '2025-10-20 03:11:07', '2025-10-20 03:11:07');

-- Dumping structure for table cork_board.notes
CREATE TABLE IF NOT EXISTS `notes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `board_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_notes_board` (`board_id`),
  CONSTRAINT `notes_ibfk_1` FOREIGN KEY (`board_id`) REFERENCES `boards` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table cork_board.notes: ~20 rows (approximately)
INSERT INTO `notes` (`id`, `board_id`) VALUES
	(1, 1),
	(2, 1),
	(3, 1),
	(4, 1),
	(5, 1),
	(6, 1),
	(8, 1),
	(12, 1),
	(27, 3),
	(28, 3),
	(29, 3),
	(30, 3),
	(31, 3),
	(32, 3),
	(33, 3),
	(34, 3),
	(35, 3),
	(36, 3),
	(37, 3);

-- Dumping structure for table cork_board.note_content
CREATE TABLE IF NOT EXISTS `note_content` (
  `note_id` int NOT NULL,
  `content` text NOT NULL,
  `color` varchar(20) DEFAULT '#ffffff',
  `pin_color` varchar(20) DEFAULT '#ff2400',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`note_id`),
  CONSTRAINT `note_content_ibfk_1` FOREIGN KEY (`note_id`) REFERENCES `notes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table cork_board.note_content: ~20 rows (approximately)
INSERT INTO `note_content` (`note_id`, `content`, `color`, `pin_color`, `created_at`, `updated_at`) VALUES
	(1, '', '#ffffff', '#ffffff', '2025-10-19 18:48:38', '2025-10-19 18:57:27'),
	(2, '', '#ffffff', '#ffffff', '2025-10-19 18:53:11', '2025-10-19 18:55:58'),
	(3, '', '#ffffff', '#ffffff', '2025-10-19 18:53:22', '2025-10-19 18:55:44'),
	(4, '', '#ffffff', '#ffffff', '2025-10-19 18:53:29', '2025-10-19 18:55:52'),
	(5, '', '#ffffff', '#ffffff', '2025-10-19 18:53:35', '2025-10-19 18:55:47'),
	(6, '', '#ffffff', '#ffffff', '2025-10-19 18:54:21', '2025-10-19 18:56:01'),
	(8, '', '#ffffff', '#ffffff', '2025-10-19 18:54:51', '2025-10-19 18:56:05'),
	(12, '', '#ffffff', '#ffffff', '2025-10-19 18:55:12', '2025-10-19 18:56:10'),
	(27, 'Landen Tactics improved:\nEvery 2.2 seconds when deployed, restores 1 Skill Point to all deployed Sniper allies that have an Offensive Recovery skill; this unit restores 1 SP every 1.8s when there is another Sniper Operator deployed', '#f9efd2', '#cd6437', '2025-10-19 23:31:45', '2025-10-19 23:35:43'),
	(28, 'Landen Tactics improved:\nEvery 2.5 seconds when deployed, restores 1 Skill Point to all deployed Sniper allies that have an Offensive Recovery skill; in Integrated Strategies, the effect applies to all Operators with Offensive Recovery skills, and Archetto\'s attacks can restore their SP; during the duration of an Operator\'s Offensive Recovery skill, they gain +50% ATK.', '#dedede', '#564848', '2025-10-19 23:31:48', '2025-10-19 23:36:20'),
	(29, 'Iron Bowstring improved:\nWhen deployed, this unit gains 1 Shield and 9 Skill Points. Restores 7 Skill Points when the Shield breaks', '#fff0b8', '#ffd970', '2025-10-19 23:32:15', '2025-10-19 23:35:57'),
	(30, 'APPLE PIE!', '#ffcccc', '#ce3838', '2025-10-19 23:32:36', '2025-10-19 23:32:36'),
	(31, 'Lemon', '#fff5b8', '#fff04d', '2025-10-19 23:32:50', '2025-10-19 23:33:04'),
	(32, 'Wyfe', '#ffdb8f', '#ce3838', '2025-10-19 23:34:12', '2025-10-19 23:34:12'),
	(33, 'The next attack deals 230% ATK as Physical damage to the target and 180% ATK as Physical damage to up to 3 other nearby enemies', '#ffb8b8', '#ce3838', '2025-10-19 23:34:32', '2025-10-19 23:34:32'),
	(34, 'Immediately fire an arrow that deals 140% ATK damage 5 times in a row. The arrow can repeatedly ricochet to nearby enemies that have not been targeted yet (each ricochet reduces available ricochets by 1); Can store 3 charges', '#ffc7c7', '#ce3838', '2025-10-19 23:34:43', '2025-10-19 23:34:43'),
	(35, 'ATK +30%, attack range +1 tile, attacks hit 3 times in a row and target 2 enemies simultaneously', '#ffc7c7', '#ce3838', '2025-10-19 23:35:07', '2025-10-19 23:36:35'),
	(36, 'The world', '#b8d3ff', '#5d54a0', '2025-10-19 23:36:55', '2025-10-19 23:36:55'),
	(37, 'Angry Birds', '#ffb8b8', '#ff943d', '2025-10-19 23:37:12', '2025-10-19 23:37:13');

-- Dumping structure for table cork_board.note_layout
CREATE TABLE IF NOT EXISTS `note_layout` (
  `note_id` int NOT NULL,
  `pos_x` int DEFAULT '0',
  `pos_y` int DEFAULT '0',
  PRIMARY KEY (`note_id`),
  CONSTRAINT `note_layout_ibfk_1` FOREIGN KEY (`note_id`) REFERENCES `notes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table cork_board.note_layout: ~20 rows (approximately)
INSERT INTO `note_layout` (`note_id`, `pos_x`, `pos_y`) VALUES
	(1, 9718, 9648),
	(2, 9719, 9048),
	(3, 10026, 9338),
	(4, 9415, 9340),
	(5, 9723, 9342),
	(6, 9763, 8782),
	(8, 10022, 8724),
	(12, 9718, 9951),
	(27, 8968, 9186),
	(28, 9654, 9205),
	(29, 9308, 9315),
	(30, 10469, 8991),
	(31, 10847, 8996),
	(32, 9310, 8397),
	(33, 9651, 8593),
	(34, 8968, 8583),
	(35, 9312, 8763),
	(36, 10512, 9355),
	(37, 10877, 9364);

-- Dumping structure for table cork_board.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `is_admin` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table cork_board.users: ~3 rows (approximately)
INSERT INTO `users` (`id`, `username`, `email`, `password_hash`, `created_at`, `is_admin`) VALUES
	(1, 'Admin', 'admin@min.min', '0192023a7bbd73250516f069df18b500', '2025-10-19 03:11:27', 1),
	(2, 'wan', 'akuwan@wan.wan', '$2y$10$SvhnV03Rs0GmR2Eojv.Z.u85/QyQXVgPAjPI.EmjgvKyAybyqmUfe', '2025-10-19 18:45:49', 0),
	(3, 'doom', 'mail@id.so', '$2y$10$3JAK/9Fw5MCCDT6KdkKUAeF1xjhsz50YrQ449QrQtzeQZCamPfOd.', '2025-10-20 03:04:36', 0);

-- Dumping structure for view cork_board.view_user_notes
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `view_user_notes` (
	`user_id` INT NOT NULL,
	`username` VARCHAR(1) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`board_id` INT NOT NULL,
	`board` VARCHAR(1) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`board_create` TIMESTAMP NULL,
	`note_id` INT NOT NULL,
	`note_create` TIMESTAMP NULL,
	`note_update` TIMESTAMP NULL
) ENGINE=MyISAM;

-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `view_user_notes`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `view_user_notes` AS select `b`.`user_id` AS `user_id`,`u`.`username` AS `username`,`n`.`board_id` AS `board_id`,`b`.`title` AS `board`,`b`.`created_at` AS `board_create`,`n`.`id` AS `note_id`,`nc`.`created_at` AS `note_create`,`nc`.`updated_at` AS `note_update` from (((`notes` `n` join `note_content` `nc` on((`n`.`id` = `nc`.`note_id`))) join `boards` `b` on((`n`.`board_id` = `b`.`id`))) join `users` `u` on((`b`.`user_id` = `u`.`id`)));

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
