-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 07, 2023 at 04:55 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `smartstudents`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `student_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `username`, `password`, `student_ID`) VALUES
(1, 'admin', 'admin', 3);

-- --------------------------------------------------------

--
-- Table structure for table `fillup_form`
--

CREATE TABLE `fillup_form` (
  `studentID` int(11) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `middle` varchar(50) NOT NULL,
  `age` int(11) NOT NULL,
  `d_o_b` date NOT NULL,
  `address` text NOT NULL,
  `Phone_num` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fillup_form`
--

INSERT INTO `fillup_form` (`studentID`, `firstname`, `lastname`, `middle`, `age`, `d_o_b`, `address`, `Phone_num`) VALUES
(3, 'Kyle Matthew', 'Calingasan', 'Dela Pena', 20, '2003-09-13', 'Alitagtag, Batangas', 9999999),
(4, 'Chester Jeff', 'Arano', 'Ascona', 20, '2003-08-03', 'San Jose, Alitagtag', 9888888),
(6, 'Clark', 'Alisuag', 'Pogi', 20, '2003-11-13', 'Poblacion West, Alitagtag', 97777777),
(8, 'Jose Mari', 'Chan', 'kun', 21, '2002-11-29', 'Manila, Philippines', 1234567890);

-- --------------------------------------------------------

--
-- Table structure for table `next_fillup_form`
--

CREATE TABLE `next_fillup_form` (
  `student_ID` int(11) NOT NULL,
  `srcode` int(11) NOT NULL,
  `depart` text NOT NULL,
  `course` varchar(50) NOT NULL,
  `year` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `next_fillup_form`
--

INSERT INTO `next_fillup_form` (`student_ID`, `srcode`, `depart`, `course`, `year`) VALUES
(3, 2212345, 'CICS', 'BS in Information Technology', '2023-2024'),
(4, 2211111, 'CICS', 'BS in Information Technology', '2023-2024'),
(6, 2233333, 'CICS', 'BS in Information Technology', '2023-2024'),
(8, 2266666, 'CICS', 'BS in Information Technology', '2023-2024');

-- --------------------------------------------------------

--
-- Table structure for table `signup_form`
--

CREATE TABLE `signup_form` (
  `student_signupID` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `signup_form`
--

INSERT INTO `signup_form` (`student_signupID`, `name`, `email`, `password`) VALUES
(1, 'Keith Andrei', 'keith@gmail.com', 'keithc'),
(2, 'Geo Ong', 'geoong@gmail.com', 'geo'),
(3, 'Kyle Matthew Calingasan', 'kyle@gmail.com', 'kayl123'),
(4, 'Cjay', 'cjay@gmail.com', 'cjay12345'),
(5, 'Alyssa Mae Atienza', 'alyssamaeatienza@gmail.com', '12345'),
(6, 'Clark Alisuag', 'clark@gmail.com', '123456'),
(8, 'Jose Mari Chan', 'jose@gmail.com', 'jose12345');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`),
  ADD KEY `idx_student_ID` (`student_ID`);

--
-- Indexes for table `fillup_form`
--
ALTER TABLE `fillup_form`
  ADD PRIMARY KEY (`studentID`);

--
-- Indexes for table `next_fillup_form`
--
ALTER TABLE `next_fillup_form`
  ADD PRIMARY KEY (`student_ID`);

--
-- Indexes for table `signup_form`
--
ALTER TABLE `signup_form`
  ADD PRIMARY KEY (`student_signupID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `fillup_form`
--
ALTER TABLE `fillup_form`
  MODIFY `studentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `next_fillup_form`
--
ALTER TABLE `next_fillup_form`
  MODIFY `student_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `signup_form`
--
ALTER TABLE `signup_form`
  MODIFY `student_signupID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`student_ID`) REFERENCES `signup_form` (`student_signupID`);

--
-- Constraints for table `fillup_form`
--
ALTER TABLE `fillup_form`
  ADD CONSTRAINT `fillup_form_ibfk_1` FOREIGN KEY (`studentID`) REFERENCES `signup_form` (`student_signupID`);

--
-- Constraints for table `next_fillup_form`
--
ALTER TABLE `next_fillup_form`
  ADD CONSTRAINT `next_fillup_form_ibfk_1` FOREIGN KEY (`student_ID`) REFERENCES `signup_form` (`student_signupID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
