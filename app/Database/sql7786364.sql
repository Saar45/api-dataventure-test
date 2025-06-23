-- phpMyAdmin SQL Dump
-- version 4.7.1
-- https://www.phpmyadmin.net/
--
-- Host: sql7.freesqldatabase.com
-- Generation Time: Jun 23, 2025 at 05:30 PM
-- Server version: 5.5.62-0ubuntu0.14.04.1
-- PHP Version: 7.0.33-0ubuntu0.16.04.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sql7786364`
--

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `created_at`, `updated_at`) VALUES
(1, 'Alice Dupont', 'alice.dupont@example.com', '0612345678', '2025-06-21 00:00:00', NULL),
(3, 'Charlie Ndiaye', 'charlie.ndiaye@example.com', '0788123456', '2025-06-22 13:14:02', NULL),
(4, 'Dina Sow', 'dina.sow@example.com', '0677889900', '2025-06-23 13:14:02', NULL),
(5, 'Eric Toure', 'eric.toure@example.com', '0755112233', '2025-06-23 13:14:02', NULL),
(6, 'Fatou Bâ', 'fatou.ba@example.com', '0744001122', '2025-06-22 00:00:00', '2025-06-23 13:16:42'),
(7, 'Mouhamed Sarr', 'mouhamed@outlook.com', '0987654637', '2025-06-23 13:00:19', '2025-06-23 16:49:34'),
(9, 'Benjamin Poindexter', 'ben12@gmail.com', '6357283927', '2025-06-23 13:14:02', '2025-06-23 13:14:02'),
(10, 'Malick Ndiaye', 'milk@hotmail.fr', '0653784927', '2025-06-23 16:30:53', '2025-06-23 16:46:31'),
(12, 'Luke Cage', 'cageluke@hotmail.fr', '076545536', '2025-06-23 17:18:06', '2025-06-23 17:18:45');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
