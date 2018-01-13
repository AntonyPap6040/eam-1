-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 11, 2018 at 04:49 PM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 7.1.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ikadatabase`
--

-- --------------------------------------------------------

--
-- Table structure for table `application`
--

CREATE TABLE `application` (
  `username` varchar(45) NOT NULL,
  `application_type` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `surname` varchar(45) NOT NULL,
  `IDnum` varchar(45) NOT NULL,
  `IDtype` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `application`
--

INSERT INTO `application` (`username`, `application_type`, `name`, `surname`, `IDnum`, `IDtype`) VALUES
('georgePap', 'ΑΠΔ', 'ΓΕΩΡΓΙΟΣ', 'ΠΑΠΑΔΗΜΗΤΡΙΟΥ', 'AB257896', 'ΑΣΤΥΝΟΜΙΚΗ');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `username` varchar(45) NOT NULL,
  `salary` int(11) NOT NULL,
  `working_years` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `employer`
--

CREATE TABLE `employer` (
  `company` varchar(45) NOT NULL,
  `employeenum` int(11) NOT NULL,
  `username` varchar(45) NOT NULL,
  `AME` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employer`
--

INSERT INTO `employer` (`company`, `employeenum`, `username`, `AME`) VALUES
('ΥΕΑΗ.ΑΕ', 15, 'georgePap', 4);

-- --------------------------------------------------------

--
-- Table structure for table `pensioner`
--

CREATE TABLE `pensioner` (
  `years` varchar(45) NOT NULL,
  `salary` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pensioner`
--

INSERT INTO `pensioner` (`years`, `salary`, `username`) VALUES
('36', '40000', 'katePer'),
('40', '30000', 'vasSpan');

-- --------------------------------------------------------

--
-- Table structure for table `userprofile`
--

CREATE TABLE `userprofile` (
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `AFM_user` varchar(45) NOT NULL,
  `AMKA_user` varchar(45) NOT NULL,
  `user_type` int(20) NOT NULL,
  `name` varchar(45) NOT NULL,
  `surname` varchar(45) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `IDnum` varchar(45) NOT NULL,
  `IDtype` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `userprofile`
--

INSERT INTO `userprofile` (`username`, `password`, `AFM_user`, `AMKA_user`, `user_type`, `name`, `surname`, `phone`, `email`, `IDnum`, `IDtype`) VALUES
('georgePap', '14789', '000000001', '00000000001', 1, 'ΓΕΩΡΓΙΟΣ', 'ΠΑΠΑΔΗΜΗΤΡΙΟΥ', '6957896325', 'geo@gmail.com', 'ΑΣ214569', 'ΑΣΤΥΝΟΜΙΚΗ'),
('katePer', '125896', '000000002', '00000000002', 2, 'ΚΑΤΕΡΙΝΑ', 'ΠΕΡΑΚΗ', '6956472347', 'kate@yahoo.com', 'ΑΔ596321', 'ΑΣΤΥΝΟΜΙΚΗ'),
('vasSpan', '1478569', '000000003', '00000000003', 2, 'ΒΑΣΙΛΗΣ', 'ΣΠΑΝΟΥΛΗΣ', '6956325893', 'span713@gmail.com', 'AB257896', 'ΔΙΑΒΑΤΗΡΙΟ');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `application`
--
ALTER TABLE `application`
  ADD PRIMARY KEY (`username`),
  ADD UNIQUE KEY `user_id_UNIQUE` (`username`),
  ADD UNIQUE KEY `IDnum_UNIQUE` (`IDnum`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD KEY `fk_employee_userprofile1_idx` (`username`);

--
-- Indexes for table `employer`
--
ALTER TABLE `employer`
  ADD UNIQUE KEY `AME_UNIQUE` (`AME`),
  ADD KEY `fk_employer_userprofile1_idx` (`username`);

--
-- Indexes for table `pensioner`
--
ALTER TABLE `pensioner`
  ADD KEY `fk_pensioner_userprofile1_idx` (`username`);

--
-- Indexes for table `userprofile`
--
ALTER TABLE `userprofile`
  ADD PRIMARY KEY (`username`),
  ADD UNIQUE KEY `idIKA_UNIQUE` (`username`),
  ADD UNIQUE KEY `AFM_user_UNIQUE` (`AFM_user`),
  ADD UNIQUE KEY `AMKA_user_UNIQUE` (`AMKA_user`),
  ADD UNIQUE KEY `phone_UNIQUE` (`phone`),
  ADD UNIQUE KEY `email_UNIQUE` (`email`),
  ADD UNIQUE KEY `IDnum_UNIQUE` (`IDnum`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `application`
--
ALTER TABLE `application`
  ADD CONSTRAINT `fk_application_user1` FOREIGN KEY (`username`) REFERENCES `userprofile` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `fk_employee_userprofile1` FOREIGN KEY (`username`) REFERENCES `userprofile` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `employer`
--
ALTER TABLE `employer`
  ADD CONSTRAINT `fk_employer_userprofile1` FOREIGN KEY (`username`) REFERENCES `userprofile` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `pensioner`
--
ALTER TABLE `pensioner`
  ADD CONSTRAINT `fk_pensioner_userprofile1` FOREIGN KEY (`username`) REFERENCES `userprofile` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
