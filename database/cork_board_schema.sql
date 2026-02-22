-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 22, 2026 at 06:53 AM
-- Server version: 8.4.3
-- PHP Version: 8.3.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cork_board`
--
CREATE DATABASE IF NOT EXISTS `cork_board` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `cork_board`;

-- --------------------------------------------------------

--
-- Table structure for table `boards`
--

CREATE TABLE `boards` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `title` varchar(100) NOT NULL,
  `color` varchar(20) DEFAULT '#ffffff',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE `notes` (
  `id` int NOT NULL,
  `board_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `note_content`
--

CREATE TABLE `note_content` (
  `note_id` int NOT NULL,
  `content` text NOT NULL,
  `color` varchar(20) DEFAULT '#ffffff',
  `pin_color` varchar(20) DEFAULT '#ff2400',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `note_layout`
--

CREATE TABLE `note_layout` (
  `note_id` int NOT NULL,
  `pos_x` int DEFAULT '0',
  `pos_y` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `is_admin` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_user_notes`
-- (See below for the actual view)
--
CREATE TABLE `view_user_notes` (
`user_id` int
,`username` varchar(50)
,`board_id` int
,`board` varchar(100)
,`board_create` timestamp
,`note_id` int
,`note_create` timestamp
,`note_update` timestamp
);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `boards`
--
ALTER TABLE `boards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_boards_user` (`user_id`);

--
-- Indexes for table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_notes_board` (`board_id`);

--
-- Indexes for table `note_content`
--
ALTER TABLE `note_content`
  ADD PRIMARY KEY (`note_id`);

--
-- Indexes for table `note_layout`
--
ALTER TABLE `note_layout`
  ADD PRIMARY KEY (`note_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `boards`
--
ALTER TABLE `boards`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

-- --------------------------------------------------------

--
-- Structure for view `view_user_notes`
--
DROP TABLE IF EXISTS `view_user_notes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_user_notes`  AS SELECT `b`.`user_id` AS `user_id`, `u`.`username` AS `username`, `n`.`board_id` AS `board_id`, `b`.`title` AS `board`, `b`.`created_at` AS `board_create`, `n`.`id` AS `note_id`, `nc`.`created_at` AS `note_create`, `nc`.`updated_at` AS `note_update` FROM (((`notes` `n` join `note_content` `nc` on((`n`.`id` = `nc`.`note_id`))) join `boards` `b` on((`n`.`board_id` = `b`.`id`))) join `users` `u` on((`b`.`user_id` = `u`.`id`))) ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `boards`
--
ALTER TABLE `boards`
  ADD CONSTRAINT `boards_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `notes`
--
ALTER TABLE `notes`
  ADD CONSTRAINT `notes_ibfk_1` FOREIGN KEY (`board_id`) REFERENCES `boards` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `note_content`
--
ALTER TABLE `note_content`
  ADD CONSTRAINT `note_content_ibfk_1` FOREIGN KEY (`note_id`) REFERENCES `notes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `note_layout`
--
ALTER TABLE `note_layout`
  ADD CONSTRAINT `note_layout_ibfk_1` FOREIGN KEY (`note_id`) REFERENCES `notes` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
