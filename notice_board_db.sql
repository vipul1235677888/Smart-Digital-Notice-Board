-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 23, 2026 at 06:55 AM
-- Server version: 8.0.44
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `notice_board_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `acknowledgements`
--

CREATE TABLE `acknowledgements` (
  `ack_id` int NOT NULL,
  `notice_id` int NOT NULL,
  `user_id` int NOT NULL,
  `ack_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `device_info` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `acknowledgements`
--

INSERT INTO `acknowledgements` (`ack_id`, `notice_id`, `user_id`, `ack_at`, `device_info`) VALUES
(1, 2, 3, '2026-05-23 14:28:49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36'),
(2, 5, 1, '2026-05-24 05:29:20', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36'),
(3, 1, 13, '2026-05-24 08:27:49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36'),
(4, 7, 3, '2026-05-24 14:33:35', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36'),
(5, 1, 14, '2026-05-24 14:36:00', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36'),
(6, 7, 14, '2026-05-24 14:36:03', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36'),
(7, 2, 14, '2026-05-24 14:36:15', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36'),
(8, 3, 14, '2026-05-24 14:36:22', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36'),
(9, 18, 6, '2026-05-25 07:40:47', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36'),
(10, 9, 6, '2026-05-25 07:43:42', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36'),
(11, 17, 6, '2026-05-25 07:43:49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36'),
(12, 13, 6, '2026-05-25 07:43:58', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36'),
(13, 21, 6, '2026-05-25 07:44:18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36'),
(14, 12, 6, '2026-05-25 07:44:36', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36'),
(15, 10, 6, '2026-05-25 07:44:46', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36'),
(16, 5, 6, '2026-05-25 07:44:58', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36'),
(17, 20, 6, '2026-05-25 07:45:02', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36'),
(18, 20, 9, '2026-05-25 07:45:50', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36'),
(19, 18, 9, '2026-05-25 07:45:54', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36'),
(20, 13, 9, '2026-05-25 07:45:58', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36'),
(21, 11, 9, '2026-05-25 07:46:07', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36'),
(22, 15, 9, '2026-05-25 07:46:11', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36'),
(23, 21, 9, '2026-05-25 07:46:16', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36'),
(24, 10, 9, '2026-05-25 07:46:33', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36'),
(25, 17, 9, '2026-05-25 07:46:41', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36'),
(26, 9, 9, '2026-05-25 07:46:46', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36'),
(27, 20, 8, '2026-05-25 07:47:23', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36'),
(28, 19, 8, '2026-05-25 07:47:25', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36'),
(29, 16, 8, '2026-05-25 07:47:28', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36'),
(30, 13, 8, '2026-05-25 07:47:30', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36'),
(31, 21, 8, '2026-05-25 07:47:42', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36'),
(32, 11, 8, '2026-05-25 07:47:47', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36'),
(33, 14, 8, '2026-05-25 07:47:52', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36'),
(34, 3, 8, '2026-05-25 07:47:56', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36'),
(35, 18, 8, '2026-05-25 07:48:02', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36'),
(36, 9, 8, '2026-05-25 07:48:06', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36'),
(37, 20, 5, '2026-05-25 07:49:50', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36'),
(38, 2, 5, '2026-05-25 07:49:57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36'),
(39, 18, 5, '2026-05-25 07:50:00', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36'),
(40, 15, 5, '2026-05-25 07:50:03', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36'),
(41, 13, 5, '2026-05-25 07:50:05', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36'),
(42, 21, 5, '2026-05-25 07:50:09', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36'),
(43, 10, 5, '2026-05-25 07:50:17', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36'),
(44, 11, 5, '2026-05-25 07:50:25', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36'),
(45, 3, 5, '2026-05-25 07:50:33', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36'),
(46, 9, 5, '2026-05-25 07:50:41', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36'),
(47, 13, 10, '2026-05-25 07:53:44', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36'),
(48, 21, 10, '2026-05-25 07:53:48', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36'),
(49, 9, 10, '2026-05-25 07:53:52', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36'),
(50, 3, 10, '2026-05-25 07:53:58', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36'),
(51, 18, 10, '2026-05-25 07:54:01', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36'),
(52, 22, 10, '2026-05-25 07:54:07', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36'),
(53, 20, 10, '2026-05-25 07:54:08', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36'),
(54, 15, 10, '2026-05-25 07:54:12', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36'),
(55, 20, 7, '2026-05-25 07:54:43', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36'),
(56, 9, 7, '2026-05-25 07:54:47', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36'),
(57, 21, 7, '2026-05-25 07:54:52', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36'),
(58, 13, 7, '2026-05-25 07:54:58', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36'),
(59, 3, 7, '2026-05-25 07:55:03', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36'),
(60, 18, 7, '2026-05-25 07:55:07', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36'),
(61, 12, 7, '2026-05-25 07:55:16', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36'),
(62, 10, 7, '2026-05-25 07:55:21', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36'),
(63, 22, 7, '2026-05-25 07:55:27', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36'),
(64, 20, 12, '2026-05-25 07:56:00', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36'),
(65, 13, 12, '2026-05-25 07:56:03', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36'),
(66, 21, 12, '2026-05-25 07:56:06', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36'),
(67, 9, 12, '2026-05-25 07:56:11', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36'),
(68, 18, 12, '2026-05-25 07:56:15', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36'),
(69, 17, 12, '2026-05-25 07:56:18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36'),
(70, 22, 12, '2026-05-25 07:56:22', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36'),
(71, 16, 12, '2026-05-25 07:56:32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36'),
(72, 1, 12, '2026-05-25 07:56:36', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36'),
(73, 11, 12, '2026-05-25 07:56:48', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36'),
(74, 19, 15, '2026-05-25 08:00:01', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36'),
(75, 13, 15, '2026-05-25 08:00:05', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36'),
(76, 11, 15, '2026-05-25 08:00:10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36'),
(77, 18, 15, '2026-05-25 08:00:13', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36'),
(78, 20, 3, '2026-05-25 09:25:22', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36');

-- --------------------------------------------------------

--
-- Table structure for table `audit_log`
--

CREATE TABLE `audit_log` (
  `log_id` int NOT NULL,
  `notice_id` int DEFAULT NULL,
  `action` varchar(50) NOT NULL,
  `changed_by` int DEFAULT NULL,
  `old_value` text,
  `changed_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `audit_log`
--

INSERT INTO `audit_log` (`log_id`, `notice_id`, `action`, `changed_by`, `old_value`, `changed_at`) VALUES
(1, 3, 'INSERT', 1, NULL, '2026-05-23 14:32:17'),
(2, NULL, 'INSERT', 1, NULL, '2026-05-23 14:50:17'),
(3, NULL, 'UPDATE', 1, 'This tests the audit log trigger.', '2026-05-23 15:33:11'),
(4, 5, 'INSERT', 1, NULL, '2026-05-24 04:36:35'),
(5, NULL, 'INSERT', 2, NULL, '2026-05-24 05:54:04'),
(6, 5, 'UPDATE', 1, 'testing audit log', '2026-05-24 06:27:44'),
(8, NULL, 'DELETE', 2, 'Deleted notice #6: sample', '2026-05-24 06:52:03'),
(9, 7, 'INSERT', 1, NULL, '2026-05-24 14:31:30'),
(10, NULL, 'INSERT', 1, NULL, '2026-05-24 17:57:26'),
(11, NULL, 'DELETE', 1, 'Deleted notice #8: sample 1', '2026-05-24 17:57:49'),
(12, 9, 'INSERT', 1, NULL, '2026-05-25 03:14:27'),
(13, 10, 'INSERT', 1, NULL, '2026-05-25 03:16:31'),
(14, 11, 'INSERT', 1, NULL, '2026-05-25 03:19:08'),
(15, 12, 'INSERT', 1, NULL, '2026-05-25 03:21:07'),
(16, 13, 'INSERT', 1, NULL, '2026-05-25 03:24:07'),
(17, 14, 'INSERT', 1, NULL, '2026-05-25 03:26:44'),
(18, 15, 'INSERT', 1, NULL, '2026-05-25 03:29:23'),
(19, 16, 'INSERT', 1, NULL, '2026-05-25 03:33:27'),
(20, 17, 'INSERT', 1, NULL, '2026-05-25 03:36:51'),
(21, 18, 'INSERT', 1, NULL, '2026-05-25 03:38:27'),
(22, 19, 'INSERT', 2, NULL, '2026-05-25 03:40:27'),
(23, 20, 'INSERT', 2, NULL, '2026-05-25 03:41:47'),
(24, 21, 'INSERT', 2, NULL, '2026-05-25 03:42:53'),
(25, 22, 'INSERT', 2, NULL, '2026-05-25 03:43:58'),
(26, NULL, 'INSERT', 1, NULL, '2026-05-25 09:12:03'),
(27, NULL, 'DELETE', 1, 'Deleted notice #23: feedback', '2026-05-25 09:20:36');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int NOT NULL,
  `cat_name` varchar(50) NOT NULL,
  `colour_code` varchar(7) DEFAULT '#3B82F6',
  `description` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_name`, `colour_code`, `description`, `created_at`) VALUES
(1, 'Exam', '#EF4444', NULL, '2026-05-23 14:07:39'),
(2, 'Event', '#3B82F6', NULL, '2026-05-23 14:07:39'),
(3, 'Holiday', '#10B981', NULL, '2026-05-23 14:07:39'),
(4, 'Urgent', '#F59E0B', NULL, '2026-05-23 14:07:39');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `dept_id` int NOT NULL,
  `dept_name` varchar(100) NOT NULL,
  `description` text,
  `hod_name` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`dept_id`, `dept_name`, `description`, `hod_name`, `created_at`) VALUES
(1, 'Computer Science', 'CSE Department', 'Dr. Sharma', '2026-05-23 14:07:39'),
(2, 'Library', 'Central Library', 'Mrs. Nair', '2026-05-23 14:07:39'),
(3, 'Admin Office', 'College Admin', 'Mr. Rao', '2026-05-23 14:07:39'),
(4, 'Electronics & Communication', 'ECE Department', 'Dr. Krishnamurthy', '2026-05-23 14:53:23'),
(5, 'Mechanical Engineering', 'MECH Department', 'Dr. Venkatesh', '2026-05-23 14:53:23'),
(6, 'Civil Engineering', 'CIVIL Department', 'Dr. Ramaiah', '2026-05-23 14:53:23'),
(7, 'Electrical Engineering', 'EEE Department', 'Dr. Lakshmi', '2026-05-23 14:53:23'),
(8, 'Information Technology', 'IT Department', 'Dr. Pradeep', '2026-05-23 14:53:23'),
(9, 'Artificial Intelligence', 'AI & ML Department', 'Dr. Suresh', '2026-05-23 14:53:23'),
(10, 'Chemical Engineering', 'CHEM Department', 'Dr. Anand', '2026-05-23 14:53:23'),
(11, 'Biotechnology', 'BT Department', 'Dr. Kavitha', '2026-05-23 14:53:23'),
(12, 'Aerospace Engineering', 'AERO Department', 'Dr. Vikram', '2026-05-23 14:53:23'),
(13, 'MBA', 'Management Department', 'Dr. Nandini', '2026-05-23 14:53:23');

-- --------------------------------------------------------

--
-- Table structure for table `notices`
--

CREATE TABLE `notices` (
  `notice_id` int NOT NULL,
  `user_id` int NOT NULL,
  `dept_id` int DEFAULT NULL,
  `title` varchar(200) NOT NULL,
  `content` text NOT NULL,
  `priority` enum('urgent','normal','low') DEFAULT 'normal',
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `notices`
--

INSERT INTO `notices` (`notice_id`, `user_id`, `dept_id`, `title`, `content`, `priority`, `start_date`, `end_date`, `is_active`, `created_at`) VALUES
(1, 1, 1, 'End Semester Exam Schedule', 'End semester exams will be held from Dec 1st to Dec 15th. Check your hall tickets.', 'urgent', '2026-05-23', '2026-06-22', 1, '2026-05-23 14:07:39'),
(2, 1, NULL, 'College Fest Registration Open', 'Annual college fest registrations are now open. Last date is Nov 25th.', 'normal', '2026-05-23', '2026-06-07', 1, '2026-05-23 14:07:39'),
(3, 1, NULL, 'Christmas Vacations', 'This is to note that your Christmas vacations will begin from 21st December and go on till 31st December. Thank you.', 'normal', '2026-05-23', NULL, 1, '2026-05-23 14:32:17'),
(5, 1, 3, 'test notice', 'testing audit log in frontend', 'normal', '2026-05-24', '2026-05-30', 1, '2026-05-24 04:36:35'),
(7, 1, 1, 'workshop', 'dance workshop', 'normal', '2026-05-24', '2026-06-01', 1, '2026-05-24 14:31:30'),
(9, 1, NULL, 'ID Card Collection', 'All students must report to the office for the collection of ID cards.', 'normal', '2026-05-25', '2026-05-28', 1, '2026-05-25 03:14:27'),
(10, 1, 12, 'Industrial Visit', 'Students are invited to register for the upcoming aerospace industrial visit.', 'normal', '2026-05-25', '2026-06-01', 1, '2026-05-25 03:16:31'),
(11, 1, 9, 'Techwhiz Hackathon', 'Registrations are now open for the department AI Innovation Challenge.', 'normal', '2026-05-25', '2026-06-25', 1, '2026-05-25 03:19:08'),
(12, 1, 11, 'Research Seminar', 'A seminar on recent Biotechnology advancements will be conducted this Friday.', 'normal', '2026-05-25', '2026-05-29', 1, '2026-05-25 03:21:07'),
(13, 1, 1, 'Placement Training', 'Placement preparation sessions will begin next week.', 'urgent', '2026-05-25', '2026-06-01', 1, '2026-05-25 03:24:07'),
(14, 1, 2, 'Availability of New Resources ', 'Newly added books, research papers and journals are available for issue.', 'normal', '2026-05-25', NULL, 1, '2026-05-25 03:26:44'),
(15, 1, NULL, 'Garba Night', 'Join us for a spectacular evening showcasing your talent in dandiya!!!', 'urgent', '2026-05-25', '2026-10-31', 1, '2026-05-25 03:29:23'),
(16, 1, NULL, 'Graduation for class of 2022', 'We are delighted to announce the graduation ceremony to celebrate the achievements of our graduating batch!', 'urgent', '2026-05-25', '2026-05-29', 1, '2026-05-25 03:33:27'),
(17, 1, NULL, 'Dussehra Vacations', 'This is to note that your Dussehra vacations will begin from October 25th to 30th.\r\nThank you', 'normal', '2026-05-25', '2026-10-31', 1, '2026-05-25 03:36:51'),
(18, 1, NULL, 'End Sem Vacations', 'This is to note that you will be getting a month of vacation after your VTU finals.\r\nThank You', 'urgent', '2026-05-25', '2026-06-30', 1, '2026-05-25 03:38:27'),
(19, 2, 10, 'Laboratory Safety Notice', 'Students are advised to follow all the safety guidelines during practical sessions.', 'urgent', '2026-05-25', NULL, 1, '2026-05-25 03:40:27'),
(20, 2, 6, 'Internal Assessment Schedule', 'Kindly note that internal assessments will be conducted as per the updated timetable.', 'urgent', '2026-05-25', NULL, 1, '2026-05-25 03:41:47'),
(21, 2, 4, 'Mini Project Evaluation', 'Students must demonstrate project progress on the scheduled review date.', 'normal', '2026-05-25', '2026-06-01', 1, '2026-05-25 03:42:53'),
(22, 2, 13, 'Guest Lecture Announcement', 'A guest lecture on business leadership will be conducted this week.', 'low', '2026-05-25', '2026-06-04', 1, '2026-05-25 03:43:58');

--
-- Triggers `notices`
--
DELIMITER $$
CREATE TRIGGER `trg_after_notice_delete` BEFORE DELETE ON `notices` FOR EACH ROW BEGIN
    INSERT INTO audit_log (notice_id, action, changed_by, old_value, changed_at)
    VALUES (
        NULL,
        'DELETE',
        OLD.user_id,
        CONCAT('Deleted notice #', OLD.notice_id, ': ', OLD.title),
        NOW()
    );
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_after_notice_insert` AFTER INSERT ON `notices` FOR EACH ROW BEGIN
    INSERT INTO audit_log (notice_id, action, changed_by)
    VALUES (NEW.notice_id, 'INSERT', NEW.user_id);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_after_notice_update` AFTER UPDATE ON `notices` FOR EACH ROW BEGIN
    INSERT INTO audit_log (notice_id, action, changed_by, old_value)
    VALUES (NEW.notice_id, 'UPDATE', NEW.user_id, OLD.content);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `notice_categories`
--

CREATE TABLE `notice_categories` (
  `notice_id` int NOT NULL,
  `cat_id` int NOT NULL,
  `tagged_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `notice_categories`
--

INSERT INTO `notice_categories` (`notice_id`, `cat_id`, `tagged_at`) VALUES
(3, 3, '2026-05-23 14:32:17'),
(5, 2, '2026-05-24 06:27:45'),
(7, 2, '2026-05-24 14:31:30'),
(9, 4, '2026-05-25 03:14:27'),
(10, 2, '2026-05-25 03:16:31'),
(11, 2, '2026-05-25 03:19:08'),
(12, 2, '2026-05-25 03:21:07'),
(13, 1, '2026-05-25 03:24:07'),
(13, 4, '2026-05-25 03:24:07'),
(15, 2, '2026-05-25 03:29:23'),
(16, 2, '2026-05-25 03:33:27'),
(17, 3, '2026-05-25 03:36:51'),
(18, 3, '2026-05-25 03:38:27'),
(19, 4, '2026-05-25 03:40:27'),
(20, 1, '2026-05-25 03:41:47'),
(21, 1, '2026-05-25 03:42:53'),
(21, 4, '2026-05-25 03:42:53'),
(22, 2, '2026-05-25 03:43:58');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','staff','student') DEFAULT 'student',
  `dept_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `password`, `role`, `dept_id`, `created_at`) VALUES
(1, 'admin', 'admin@college.edu', '0192023a7bbd73250516f069df18b500', 'admin', 1, '2026-05-23 14:07:39'),
(2, 'staff_cse', 'staff@college.edu', 'de9bf5643eabf80f4a56fda3bbb84483', 'staff', 1, '2026-05-23 14:07:39'),
(3, 'student_raj', 'raj@college.edu', 'cac5ff630494aa784ce97b9fafac2500', 'student', 1, '2026-05-23 14:07:39'),
(4, 'student_priya', 'priya@college.edu', '48467d2cc726e8847fbc51f5b0bdc1d1', 'student', 1, '2026-05-23 14:49:38'),
(5, 'student_arjun', 'arjun@college.edu', '451d3eb1573c7ebb70c08dfee9766509', 'student', 1, '2026-05-23 14:49:38'),
(6, 'student_sneha', 'sneha@college.edu', '5589b86d03110cd30f21cf09a67760d6', 'student', 1, '2026-05-23 14:49:38'),
(7, 'student_karthik', 'karthik@college.edu', '10bc229281c382d44789aeac9bfd7bea', 'student', 1, '2026-05-23 14:49:38'),
(8, 'student_divya', 'divya@college.edu', '6a670fed44634a9e6967bc5cec37840b', 'student', 1, '2026-05-23 14:49:38'),
(9, 'student_rahul', 'rahul@college.edu', '2acb7811397a5c3bea8cba57b0388b79', 'student', 1, '2026-05-23 14:49:38'),
(10, 'student_meera', 'meera@college.edu', 'f4670c89f623f98bd700b46e7ab9ee6c', 'student', 2, '2026-05-23 14:49:38'),
(11, 'student_arun', 'arun@college.edu', 'a10372605b860035a32286c3fa356e8e', 'student', 2, '2026-05-23 14:49:38'),
(12, 'student_lakshmi', 'lakshmi@college.edu', 'a7b99bcb9226205dd125de9f2c7d25fd', 'student', 3, '2026-05-23 14:49:38'),
(13, 'student_abc', 'abc@gmail.com', 'e99a18c428cb38d5f260853678922e03', 'student', 9, '2026-05-24 08:27:09'),
(14, 'student_tara', 'tara@gmail.com', '766d8894c7576f9cfc55758a9f6e082c', 'student', 2, '2026-05-24 14:35:40'),
(15, 'student_aksh', 'aksh@college.edu', '5a29e39705fe43462188210bee26a5d6', 'student', 9, '2026-05-25 07:59:29');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `acknowledgements`
--
ALTER TABLE `acknowledgements`
  ADD PRIMARY KEY (`ack_id`),
  ADD KEY `notice_id` (`notice_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `audit_log`
--
ALTER TABLE `audit_log`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `changed_by` (`changed_by`),
  ADD KEY `audit_log_notice_fk` (`notice_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`),
  ADD UNIQUE KEY `cat_name` (`cat_name`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`dept_id`),
  ADD UNIQUE KEY `dept_name` (`dept_name`);

--
-- Indexes for table `notices`
--
ALTER TABLE `notices`
  ADD PRIMARY KEY (`notice_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `dept_id` (`dept_id`);

--
-- Indexes for table `notice_categories`
--
ALTER TABLE `notice_categories`
  ADD PRIMARY KEY (`notice_id`,`cat_id`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `dept_id` (`dept_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `acknowledgements`
--
ALTER TABLE `acknowledgements`
  MODIFY `ack_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `audit_log`
--
ALTER TABLE `audit_log`
  MODIFY `log_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `dept_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `notices`
--
ALTER TABLE `notices`
  MODIFY `notice_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `acknowledgements`
--
ALTER TABLE `acknowledgements`
  ADD CONSTRAINT `acknowledgements_ibfk_1` FOREIGN KEY (`notice_id`) REFERENCES `notices` (`notice_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `acknowledgements_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `audit_log`
--
ALTER TABLE `audit_log`
  ADD CONSTRAINT `audit_log_ibfk_2` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `audit_log_notice_fk` FOREIGN KEY (`notice_id`) REFERENCES `notices` (`notice_id`) ON DELETE SET NULL;

--
-- Constraints for table `notices`
--
ALTER TABLE `notices`
  ADD CONSTRAINT `notices_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `notices_ibfk_2` FOREIGN KEY (`dept_id`) REFERENCES `departments` (`dept_id`);

--
-- Constraints for table `notice_categories`
--
ALTER TABLE `notice_categories`
  ADD CONSTRAINT `notice_categories_ibfk_1` FOREIGN KEY (`notice_id`) REFERENCES `notices` (`notice_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `notice_categories_ibfk_2` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`cat_id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`dept_id`) REFERENCES `departments` (`dept_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
