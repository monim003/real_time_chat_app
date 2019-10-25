-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 25, 2019 at 05:03 PM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 7.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chat`
--

-- --------------------------------------------------------

--
-- Table structure for table `chat_message`
--

CREATE TABLE `chat_message` (
  `chat_message_id` int(11) NOT NULL,
  `to_user_id` int(11) NOT NULL,
  `from_user_id` int(11) NOT NULL,
  `chat_message` text NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chat_message`
--

INSERT INTO `chat_message` (`chat_message_id`, `to_user_id`, `from_user_id`, `chat_message`, `timestamp`, `status`) VALUES
(1, 3, 4, 'hi', '2019-10-08 19:16:34', 1),
(2, 3, 0, 'hi', '2019-10-08 19:16:46', 1),
(3, 3, 4, 'hi', '2019-10-08 19:18:01', 1),
(4, 3, 4, 'hi', '2019-10-08 19:18:45', 1),
(5, 3, 4, 'hi', '2019-10-08 19:19:43', 1),
(6, 4, 3, 'hi\n', '2019-10-23 17:01:38', 0),
(7, 3, 4, 'what r u doing', '2019-10-08 19:21:26', 1),
(8, 3, 4, 'hello', '2019-10-09 08:51:42', 1),
(9, 4, 3, 'yes i am here', '2019-10-23 17:01:38', 0),
(10, 3, 4, 'ok', '2019-10-09 08:53:42', 1),
(11, 3, 4, 'ok', '2019-10-09 09:01:16', 1),
(12, 4, 3, 'this is working', '2019-10-23 17:01:38', 0),
(13, 3, 4, 'thanks', '2019-10-09 09:01:37', 1),
(14, 3, 4, '111111111111111', '2019-10-09 18:16:57', 1),
(15, 4, 5, 'hello\n', '2019-10-23 16:49:10', 0),
(16, 4, 5, 'hello', '2019-10-23 16:49:10', 0),
(17, 4, 5, 'saidoiasfj', '2019-10-23 16:49:10', 0),
(18, 4, 5, 'mmm', '2019-10-23 16:49:10', 0),
(19, 4, 5, 'oaosido', '2019-10-23 16:49:33', 0),
(20, 5, 4, 'not working', '2019-10-23 16:59:06', 0),
(21, 5, 4, 'ok', '2019-10-23 16:59:57', 0),
(22, 4, 5, 'yes', '2019-10-23 17:00:03', 0),
(23, 4, 5, 'okk', '2019-10-23 17:00:15', 0),
(24, 5, 4, 'noo', '2019-10-23 17:00:32', 0),
(25, 4, 5, 'ok\n', '2019-10-23 17:00:52', 0),
(26, 5, 4, 'not ok', '2019-10-23 17:01:07', 0),
(27, 4, 5, 'ok', '2019-10-23 17:01:17', 0),
(28, 4, 5, 'oh no', '2019-10-23 17:01:27', 0),
(29, 4, 5, 'this is test message', '2019-10-23 17:03:24', 0),
(30, 5, 4, 'got mesasge', '2019-10-23 17:04:28', 0),
(31, 5, 4, 'got it', '2019-10-23 17:04:28', 0),
(32, 4, 5, 'yes getting message', '2019-10-23 17:04:34', 0),
(33, 4, 5, 'working fine', '2019-10-23 17:04:48', 0),
(34, 4, 5, 'jndfjs', '2019-10-23 17:26:17', 0),
(35, 4, 5, 'ksjdnkjsfa', '2019-10-23 17:26:17', 0),
(36, 4, 5, 'ksjdnkjsfa', '2019-10-23 17:26:17', 0),
(37, 4, 5, 'pk', '2019-10-23 17:26:25', 0);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `user_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`user_id`, `username`, `password`) VALUES
(3, 'saroar', '$2y$10$jCKZBRoHHkKB/xx2OfDB6epNUXu8xMAlcXzkv4syKm8HA5Ey2JdCi'),
(4, 'monim', '$2y$10$qAxERTRqAwY2uF7NRFT2guEbT6rByMWC6uhiKgnj2aRA8Lj5JY5S2'),
(5, 'samia', '$2y$10$v8RtNB3JznZISDa8LpQkP.Qe0Hlbv9OiSclcC6B5QK464hIlCmanC');

-- --------------------------------------------------------

--
-- Table structure for table `login_details`
--

CREATE TABLE `login_details` (
  `login_details_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `last_activity` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL,
  `is_type` enum('no','yes') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login_details`
--

INSERT INTO `login_details` (`login_details_id`, `user_id`, `last_activity`, `status`, `is_type`) VALUES
(1, 4, '2019-10-23 18:03:09', 1, 'no'),
(2, 3, '2019-10-05 17:02:54', 1, 'no'),
(3, 4, '2019-10-23 18:03:09', 1, 'no'),
(4, 4, '2019-10-23 18:03:09', 1, 'no'),
(5, 4, '2019-10-23 18:03:09', 1, 'no'),
(6, 4, '2019-10-23 18:03:09', 1, 'no'),
(7, 4, '2019-10-23 18:03:09', 1, 'no'),
(8, 4, '2019-10-23 18:03:09', 1, 'no'),
(9, 4, '2019-10-23 18:03:09', 1, 'no'),
(10, 4, '2019-10-23 18:03:09', 1, 'no'),
(11, 4, '2019-10-23 18:03:09', 1, 'no'),
(12, 4, '2019-10-23 18:03:09', 1, 'no'),
(13, 3, '2019-10-05 17:02:54', 1, 'no'),
(14, 4, '2019-10-23 18:03:09', 1, 'no'),
(15, 3, '2019-10-05 17:02:54', 1, 'no'),
(16, 3, '2019-10-05 17:02:54', 1, 'no'),
(17, 3, '2019-10-05 17:02:54', 1, 'no'),
(18, 3, '2019-10-05 17:02:54', 1, 'no'),
(19, 3, '2019-10-05 17:02:54', 1, 'no'),
(20, 4, '2019-10-23 18:03:09', 1, 'no'),
(21, 5, '2019-10-23 18:04:28', 1, 'no'),
(22, 5, '2019-10-23 18:04:28', 1, 'no'),
(23, 4, '2019-10-23 18:03:09', 1, 'no'),
(24, 4, '2019-10-23 18:03:09', 1, 'no'),
(25, 4, '2019-10-23 18:03:09', 1, 'no'),
(26, 3, '2019-10-08 19:20:25', 1, 'no'),
(27, 4, '2019-10-23 18:03:09', 1, 'no'),
(28, 3, '2019-10-09 08:52:56', 1, 'no'),
(29, 4, '2019-10-23 18:03:09', 1, 'no'),
(30, 4, '2019-10-23 18:03:09', 1, 'no'),
(31, 4, '2019-10-23 18:03:09', 1, 'no'),
(32, 5, '2019-10-23 18:04:28', 1, 'no'),
(33, 4, '2019-10-23 18:03:09', 1, 'no'),
(34, 5, '2019-10-23 18:04:28', 1, 'no'),
(35, 5, '2019-10-23 18:04:28', 1, 'no'),
(36, 4, '2019-10-23 18:03:09', 1, 'no'),
(37, 5, '2019-10-23 18:04:28', 1, 'no'),
(38, 4, '2019-10-23 18:03:09', 1, 'no'),
(39, 4, '2019-10-23 18:03:09', 1, 'no'),
(40, 5, '2019-10-23 18:04:28', 1, 'no'),
(41, 4, '2019-10-23 18:03:09', 1, 'no'),
(42, 5, '2019-10-23 18:04:28', 1, 'no'),
(43, 4, '2019-10-23 18:04:51', 1, 'no'),
(44, 5, '2019-10-23 18:04:28', 1, 'no');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chat_message`
--
ALTER TABLE `chat_message`
  ADD PRIMARY KEY (`chat_message_id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `login_details`
--
ALTER TABLE `login_details`
  ADD PRIMARY KEY (`login_details_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chat_message`
--
ALTER TABLE `chat_message`
  MODIFY `chat_message_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `login_details`
--
ALTER TABLE `login_details`
  MODIFY `login_details_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
