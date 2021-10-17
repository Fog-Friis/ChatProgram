-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 17, 2021 at 08:03 PM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chat_program`
--

-- --------------------------------------------------------

--
-- Table structure for table `beskeder`
--

DROP TABLE IF EXISTS `beskeder`;
CREATE TABLE `beskeder` (
  `Brugernavn` varchar(255) NOT NULL,
  `Besked` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `beskeder`
--

INSERT INTO `beskeder` (`Brugernavn`, `Besked`) VALUES
('Hej', 'Hej');

-- --------------------------------------------------------

--
-- Table structure for table `personer`
--

DROP TABLE IF EXISTS `personer`;
CREATE TABLE `personer` (
  `ID` int(10) NOT NULL DEFAULT '3',
  `email` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `brugernavn` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `personer`
--

INSERT INTO `personer` (`ID`, `email`, `password`, `brugernavn`) VALUES
(1, 'thor@test.dk', '937E8D5FBB48BD4949536CD65B8D35C426B80D2F830C5C308E2CDEC422AE2244', 'Hej'),
(2, 'thor@test.com', '4F9DB7F8E5068A3ED09C4BDF2DDD980A290126B497155ABA1B4A385622D13144', 'thor');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `personer`
--
ALTER TABLE `personer`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `brugernavn` (`brugernavn`),
  ADD UNIQUE KEY `email` (`email`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
