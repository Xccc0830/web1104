-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- 主機: 127.0.0.1
-- 產生時間： 
-- 伺服器版本: 10.1.22-MariaDB
-- PHP 版本： 7.1.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `practice`
--

-- --------------------------------------------------------

--
-- 資料表結構 `registration`
--

CREATE TABLE `registration` (
  `regid` int(10) UNSIGNED NOT NULL,
  `userid` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `eventid` int(10) UNSIGNED NOT NULL,
  `sessions` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dinner` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fee` int(10) UNSIGNED DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 資料表的匯出資料 `registration`
--

INSERT INTO `registration` (`regid`, `userid`, `eventid`, `sessions`, `dinner`, `fee`, `created_at`) VALUES
(2, 'admin', 2, '', '', 0, '2025-10-28 14:13:56'),
(4, 'admin', 1, '', '', 0, '2025-10-28 14:19:09'),
(8, 'user1', 2, '', '', 0, '2025-10-28 14:27:54'),
(9, 'user1', 1, '', '需要', 60, '2025-10-28 14:30:48');

--
-- 已匯出資料表的索引
--

--
-- 資料表索引 `registration`
--
ALTER TABLE `registration`
  ADD PRIMARY KEY (`regid`),
  ADD UNIQUE KEY `unique_user_event` (`userid`,`eventid`),
  ADD KEY `fk_registration_event` (`eventid`);

--
-- 在匯出的資料表使用 AUTO_INCREMENT
--

--
-- 使用資料表 AUTO_INCREMENT `registration`
--
ALTER TABLE `registration`
  MODIFY `regid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- 已匯出資料表的限制(Constraint)
--

--
-- 資料表的 Constraints `registration`
--
ALTER TABLE `registration`
  ADD CONSTRAINT `fk_registration_event` FOREIGN KEY (`eventid`) REFERENCES `event` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_registration_user` FOREIGN KEY (`userid`) REFERENCES `user` (`account`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
