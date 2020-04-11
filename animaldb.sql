-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 09, 2020 at 04:39 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `animaldb`
--
use animaldb;
-- --------------------------------------------------------

--
-- Table structure for table `adoptivefamily`
--

CREATE TABLE `adoptivefamily` (
  `animal_ID` char(8) NOT NULL,
  `lname` varchar(20) NOT NULL,
  `phone` char(10) NOT NULL,
  `street` varchar(100) NOT NULL,
  `city` varchar(20) NOT NULL,
  `postalCode` char(6) NOT NULL,
  `pay_amount` decimal(20,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `animal`
--

CREATE TABLE `animal` (
  `ID` char(8) NOT NULL,
  `species` varchar(20) NOT NULL,
  `SPCA_branch_name` varchar(20) DEFAULT NULL,
  `shelter_name` varchar(20) DEFAULT NULL,
  `rescurer_name` varchar(20) DEFAULT NULL,
  `driver_fname` varchar(50) DEFAULT NULL,
  `driver_lname` varchar(50) DEFAULT NULL,
  `date_leave_shelter` date NOT NULL,
  `date_arrive_shelter` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `animal`
--

INSERT INTO `animal` (`ID`, `species`, `SPCA_branch_name`, `shelter_name`, `rescurer_name`, `driver_fname`, `driver_lname`, `date_leave_shelter`, `date_arrive_shelter`) VALUES
('14589632', 'dog', 'Ontario SPCA', NULL, NULL, 'Johnson', 'Lauren', '2019-11-08', '2019-04-10'),
('23459621', 'cat', 'Ontario SPCA', NULL, NULL, NULL, NULL, '2020-04-06', '2020-01-04'),
('32147895', 'rabbit', 'Ontario SPCA', NULL, NULL, 'Peter', 'Yu', '2020-04-06', '2018-05-10'),
('47853211', 'rodent', 'BC SPCA', NULL, NULL, 'David', 'Song', '2020-04-06', '2018-05-10'),
('56789412', 'rodent', NULL, NULL, 'Animal Care', 'Peter', 'Yu', '2020-04-08', '2019-11-12');

-- --------------------------------------------------------

--
-- Table structure for table `associate`
--

CREATE TABLE `associate` (
  `rescuer` varchar(20) NOT NULL,
  `driver_fname` varchar(20) NOT NULL,
  `driver_lname` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `associate`
--

INSERT INTO `associate` (`rescuer`, `driver_fname`, `driver_lname`) VALUES
('Animal Care', 'David', 'Song');

-- --------------------------------------------------------

--
-- Table structure for table `donor`
--

CREATE TABLE `donor` (
  `donate_ID` char(3) NOT NULL,
  `donator_fname` varchar(20) NOT NULL,
  `donator_lname` varchar(20) NOT NULL,
  `donate_place` varchar(30) NOT NULL,
  `donate_date` date NOT NULL,
  `donate_amount` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `donor`
--

INSERT INTO `donor` (`donate_ID`, `donator_fname`, `donator_lname`, `donate_place`, `donate_date`, `donate_amount`) VALUES
('001', 'Sunny', 'Yang', 'Animal Care', '2018-04-06', '150.00'),
('002', 'Kelly', 'Ge', 'Ontario SPCA', '2018-04-08', '300.00'),
('003', 'Theo', 'Xiao', 'Cat Home', '2018-02-01', '450.00'),
('004', 'Sunny', 'Yang', 'BC SPCA', '2018-02-01', '600.00'),
('005', 'Kelly', 'Ge', 'Ontario SPCA', '2018-09-01', '600.00'),
('006', 'Sunny', 'Yang', 'Bunny Home', '2018-03-01', '400.00'),
('007', 'Sunny', 'Yang', 'Bunny Home', '2019-07-10', '50.00');

-- --------------------------------------------------------

--
-- Table structure for table `driver`
--

CREATE TABLE `driver` (
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `emergency_phone` char(10) DEFAULT NULL,
  `license_plate` varchar(10) DEFAULT NULL,
  `license_number` char(15) DEFAULT NULL,
  `Work_Place` varchar(20) NOT NULL,
  `transport_animal` char(8) DEFAULT NULL,
  `transport_from` varchar(35) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `driver`
--

INSERT INTO `driver` (`fname`, `lname`, `emergency_phone`, `license_plate`, `license_number`, `Work_Place`, `transport_animal`, `transport_from`) VALUES
('David', 'Song', '6138889931', 'B42249', '456128963452751', 'Animal Care', '47853211', 'BC SPCA'),
('Johnson', 'Lauren', '4169863321', 'C48108', '852369741951753', 'Animal Care', '23459621', 'Ontario SPCA'),
('Lily', 'Zhou', '4165579632', 'A62310', '963258123456951', 'Animal Care', '56789412', 'Animal Care'),
('Peter', 'Yu', '4169875564', 'A42947', '963852741321654', 'Animal Care', '32147895', 'Ontario SPCA');

-- --------------------------------------------------------

--
-- Table structure for table `ledger`
--

CREATE TABLE `ledger` (
  `transfer_from` varchar(20) NOT NULL,
  `trasnfer_to` varchar(20) NOT NULL,
  `trasnfer_amount` decimal(20,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ledger`
--

INSERT INTO `ledger` (`transfer_from`, `trasnfer_to`, `trasnfer_amount`) VALUES
('adopted_family', 'shelter', '50.00'),
('rescurer', 'SPCA', '400.00'),
('shelter', 'SPCA', '200.00');

-- --------------------------------------------------------

--
-- Table structure for table `owner`
--

CREATE TABLE `owner` (
  `owner_fname` varchar(20) NOT NULL,
  `owner_lname` varchar(20) NOT NULL,
  `owner_street` varchar(100) DEFAULT NULL,
  `owner_city` varchar(20) DEFAULT NULL,
  `owner_postalCode` char(6) DEFAULT NULL,
  `owner_workplace` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `owner`
--

INSERT INTO `owner` (`owner_fname`, `owner_lname`, `owner_street`, `owner_city`, `owner_postalCode`, `owner_workplace`) VALUES
('Anna', 'Li', 'princess', 'Kingston', 'k7l5c2', 'shelter'),
('Gates', 'Bill', '888 Fork Street', 'New York', 'N2J6G3', NULL),
('Huang', 'Li', 'king', 'Kingston', 'k735t9', 'SPCA'),
('Hui', 'Lin', 'yonge', 'Toronto', 't6r7g3', 'shelter');

-- --------------------------------------------------------

--
-- Table structure for table `owner_phone`
--

CREATE TABLE `owner_phone` (
  `owner_fname` varchar(20) NOT NULL,
  `owner_lname` varchar(20) NOT NULL,
  `owner_phone` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `owner_phone`
--

INSERT INTO `owner_phone` (`owner_fname`, `owner_lname`, `owner_phone`) VALUES
('Anna', 'Li', '6137701111');

-- --------------------------------------------------------

--
-- Table structure for table `rescurer`
--

CREATE TABLE `rescurer` (
  `name` varchar(20) NOT NULL,
  `street` varchar(100) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `postalCode` char(6) DEFAULT NULL,
  `donator_fname` varchar(20) DEFAULT NULL,
  `donator_lname` varchar(20) DEFAULT NULL,
  `owner_fname` varchar(20) NOT NULL,
  `owner_lname` varchar(20) NOT NULL,
  `transfer_from` varchar(20) NOT NULL,
  `trasnfer_to` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rescurer`
--

INSERT INTO `rescurer` (`name`, `street`, `city`, `postalCode`, `donator_fname`, `donator_lname`, `owner_fname`, `owner_lname`, `transfer_from`, `trasnfer_to`) VALUES
('Animal Care', '4532 Princess Street', 'Toronto', 'O1N8T9', 'Sunny', 'Yang', 'Hui', 'Lin', 'adopted_family', 'shelter');

-- --------------------------------------------------------

--
-- Table structure for table `rescurer_phone`
--

CREATE TABLE `rescurer_phone` (
  `rescurer_name` varchar(20) NOT NULL,
  `rescurer_phone` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rescurer_phone`
--

INSERT INTO `rescurer_phone` (`rescurer_name`, `rescurer_phone`) VALUES
('Animal Care', '4169994562');

-- --------------------------------------------------------

--
-- Table structure for table `shelter`
--

CREATE TABLE `shelter` (
  `name` varchar(20) NOT NULL,
  `street` varchar(100) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `postalCode` char(6) DEFAULT NULL,
  `website_URL` varchar(100) DEFAULT NULL,
  `donator_fname` varchar(20) DEFAULT NULL,
  `donator_lname` varchar(20) DEFAULT NULL,
  `owner_fname` varchar(20) NOT NULL,
  `owner_lname` varchar(20) NOT NULL,
  `transfer_from` varchar(20) NOT NULL,
  `trasnfer_to` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shelter`
--

INSERT INTO `shelter` (`name`, `street`, `city`, `postalCode`, `website_URL`, `donator_fname`, `donator_lname`, `owner_fname`, `owner_lname`, `transfer_from`, `trasnfer_to`) VALUES
('Bunny Home', '332 Howe Street', 'Vancouver', 'V9A2G2', NULL, 'Sunny', 'Yang', 'Hui', 'Lin', 'adopted_family', 'shelter'),
('Cat Home', '1085 Pacific Blvd', 'Vancouver', 'V2C6P4', 'www.helpcats.ca', 'Theo', 'Xiao', 'Gates', 'Bill', 'adopted_family', 'shelter'),
('Dog Home', '1265 Morningside Ave', 'Toronto', 'M1C1A6', 'www.doghome.ca', NULL, NULL, 'Anna', 'Li', 'shelter', 'SPCA');

-- --------------------------------------------------------

--
-- Table structure for table `shelter_animal_type`
--

CREATE TABLE `shelter_animal_type` (
  `shelter_name` varchar(20) NOT NULL,
  `shelter_animal_type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shelter_animal_type`
--

INSERT INTO `shelter_animal_type` (`shelter_name`, `shelter_animal_type`) VALUES
('Bunny Home', 'bunny'),
('Cat Home', 'cat'),
('Dog Home', 'dog');

-- --------------------------------------------------------

--
-- Table structure for table `shelter_max_number`
--

CREATE TABLE `shelter_max_number` (
  `shelter_name` varchar(20) NOT NULL,
  `shelter_max_number` decimal(65,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shelter_max_number`
--

INSERT INTO `shelter_max_number` (`shelter_name`, `shelter_max_number`) VALUES
('Dog Home', '1000');

-- --------------------------------------------------------

--
-- Table structure for table `shelter_phone`
--

CREATE TABLE `shelter_phone` (
  `shelter_name` varchar(20) NOT NULL,
  `shelter_phone` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shelter_phone`
--

INSERT INTO `shelter_phone` (`shelter_name`, `shelter_phone`) VALUES
('Bunny Home', '4165550023');

-- --------------------------------------------------------

--
-- Table structure for table `spca_branch`
--

CREATE TABLE `spca_branch` (
  `name` varchar(20) NOT NULL,
  `street` varchar(100) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `postalCode` char(6) DEFAULT NULL,
  `donator_fname` varchar(20) DEFAULT NULL,
  `donator_lname` varchar(20) DEFAULT NULL,
  `owner_fname` varchar(20) NOT NULL,
  `owner_lname` varchar(20) NOT NULL,
  `transfer_from` varchar(20) NOT NULL,
  `trasnfer_to` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `spca_branch`
--

INSERT INTO `spca_branch` (`name`, `street`, `city`, `postalCode`, `donator_fname`, `donator_lname`, `owner_fname`, `owner_lname`, `transfer_from`, `trasnfer_to`) VALUES
('BC SPCA', '1023 Canada Place', 'Vancouver', 'V6C3G9', 'Sunny', 'Yang', 'Hui', 'Lin', 'rescurer', 'SPCA'),
('Ontario SPCA', '2232 Kingston Road', 'Toronto', 'M1N1T9', 'Kelly', 'Ge', 'Huang', 'Li', 'rescurer', 'SPCA');

-- --------------------------------------------------------

--
-- Table structure for table `spca_phone`
--

CREATE TABLE `spca_phone` (
  `SPCA_name` varchar(20) NOT NULL,
  `SPCA_phone` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `spca_phone`
--

INSERT INTO `spca_phone` (`SPCA_name`, `SPCA_phone`) VALUES
('BC SPCA', '7897704598'),
('Ontario SPCA', '6137704598');

-- --------------------------------------------------------

--
-- Table structure for table `vet`
--

CREATE TABLE `vet` (
  `vet_fname` varchar(50) NOT NULL,
  `vet_lname` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vet`
--

INSERT INTO `vet` (`vet_fname`, `vet_lname`) VALUES
('Kindman', 'Smartvet');

-- --------------------------------------------------------

--
-- Table structure for table `visit`
--

CREATE TABLE `visit` (
  `animal_ID` char(8) NOT NULL,
  `vet_visit_condition` varchar(100) DEFAULT NULL,
  `weihgt` varchar(100) DEFAULT NULL,
  `visit_date` date DEFAULT NULL,
  `vetFname` varchar(50) NOT NULL,
  `vetLname` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `visit`
--

INSERT INTO `visit` (`animal_ID`, `vet_visit_condition`, `weihgt`, `visit_date`, `vetFname`, `vetLname`) VALUES
('14589632', 'healthy', NULL, NULL, 'Kindman', 'Smartvet');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adoptivefamily`
--
ALTER TABLE `adoptivefamily`
  ADD PRIMARY KEY (`animal_ID`,`lname`,`phone`,`street`,`city`,`postalCode`);

--
-- Indexes for table `animal`
--
ALTER TABLE `animal`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `SPCA_branch_name` (`SPCA_branch_name`),
  ADD KEY `shelter_name` (`shelter_name`),
  ADD KEY `rescurer_name` (`rescurer_name`),
  ADD KEY `driver_fname` (`driver_fname`,`driver_lname`);

--
-- Indexes for table `associate`
--
ALTER TABLE `associate`
  ADD PRIMARY KEY (`rescuer`,`driver_fname`,`driver_lname`),
  ADD KEY `driver_fname` (`driver_fname`,`driver_lname`);

--
-- Indexes for table `donor`
--
ALTER TABLE `donor`
  ADD PRIMARY KEY (`donate_ID`);

--
-- Indexes for table `driver`
--
ALTER TABLE `driver`
  ADD PRIMARY KEY (`fname`,`lname`),
  ADD KEY `Work_Place` (`Work_Place`);

--
-- Indexes for table `ledger`
--
ALTER TABLE `ledger`
  ADD PRIMARY KEY (`transfer_from`,`trasnfer_to`);

--
-- Indexes for table `owner`
--
ALTER TABLE `owner`
  ADD PRIMARY KEY (`owner_fname`,`owner_lname`);

--
-- Indexes for table `owner_phone`
--
ALTER TABLE `owner_phone`
  ADD PRIMARY KEY (`owner_fname`,`owner_lname`,`owner_phone`);

--
-- Indexes for table `rescurer`
--
ALTER TABLE `rescurer`
  ADD PRIMARY KEY (`name`),
  ADD KEY `transfer_from` (`transfer_from`,`trasnfer_to`),
  ADD KEY `owner_fname` (`owner_fname`,`owner_lname`);

--
-- Indexes for table `rescurer_phone`
--
ALTER TABLE `rescurer_phone`
  ADD PRIMARY KEY (`rescurer_name`,`rescurer_phone`);

--
-- Indexes for table `shelter`
--
ALTER TABLE `shelter`
  ADD PRIMARY KEY (`name`),
  ADD KEY `transfer_from` (`transfer_from`,`trasnfer_to`),
  ADD KEY `owner_fname` (`owner_fname`,`owner_lname`);

--
-- Indexes for table `shelter_animal_type`
--
ALTER TABLE `shelter_animal_type`
  ADD PRIMARY KEY (`shelter_name`,`shelter_animal_type`);

--
-- Indexes for table `shelter_max_number`
--
ALTER TABLE `shelter_max_number`
  ADD PRIMARY KEY (`shelter_name`,`shelter_max_number`);

--
-- Indexes for table `shelter_phone`
--
ALTER TABLE `shelter_phone`
  ADD PRIMARY KEY (`shelter_name`,`shelter_phone`);

--
-- Indexes for table `spca_branch`
--
ALTER TABLE `spca_branch`
  ADD PRIMARY KEY (`name`),
  ADD KEY `owner_fname` (`owner_fname`,`owner_lname`),
  ADD KEY `transfer_from` (`transfer_from`,`trasnfer_to`);

--
-- Indexes for table `spca_phone`
--
ALTER TABLE `spca_phone`
  ADD PRIMARY KEY (`SPCA_name`,`SPCA_phone`);

--
-- Indexes for table `vet`
--
ALTER TABLE `vet`
  ADD PRIMARY KEY (`vet_fname`,`vet_lname`);

--
-- Indexes for table `visit`
--
ALTER TABLE `visit`
  ADD PRIMARY KEY (`vetFname`,`vetLname`,`animal_ID`),
  ADD KEY `animal_ID` (`animal_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `animal`
--
ALTER TABLE `animal`
  ADD CONSTRAINT `animal_ibfk_1` FOREIGN KEY (`SPCA_branch_name`) REFERENCES `spca_branch` (`name`),
  ADD CONSTRAINT `animal_ibfk_2` FOREIGN KEY (`shelter_name`) REFERENCES `shelter` (`name`),
  ADD CONSTRAINT `animal_ibfk_3` FOREIGN KEY (`rescurer_name`) REFERENCES `rescurer` (`name`),
  ADD CONSTRAINT `animal_ibfk_4` FOREIGN KEY (`driver_fname`,`driver_lname`) REFERENCES `driver` (`fname`, `lname`);

--
-- Constraints for table `associate`
--
ALTER TABLE `associate`
  ADD CONSTRAINT `associate_ibfk_1` FOREIGN KEY (`rescuer`) REFERENCES `rescurer` (`name`),
  ADD CONSTRAINT `associate_ibfk_2` FOREIGN KEY (`driver_fname`,`driver_lname`) REFERENCES `driver` (`fname`, `lname`);

--
-- Constraints for table `driver`
--
ALTER TABLE `driver`
  ADD CONSTRAINT `driver_ibfk_1` FOREIGN KEY (`Work_Place`) REFERENCES `rescurer` (`name`);

--
-- Constraints for table `owner_phone`
--
ALTER TABLE `owner_phone`
  ADD CONSTRAINT `owner_phone_ibfk_1` FOREIGN KEY (`owner_fname`,`owner_lname`) REFERENCES `owner` (`owner_fname`, `owner_lname`);

--
-- Constraints for table `rescurer`
--
ALTER TABLE `rescurer`
  ADD CONSTRAINT `rescurer_ibfk_2` FOREIGN KEY (`transfer_from`,`trasnfer_to`) REFERENCES `ledger` (`transfer_from`, `trasnfer_to`),
  ADD CONSTRAINT `rescurer_ibfk_3` FOREIGN KEY (`owner_fname`,`owner_lname`) REFERENCES `owner` (`owner_fname`, `owner_lname`);

--
-- Constraints for table `rescurer_phone`
--
ALTER TABLE `rescurer_phone`
  ADD CONSTRAINT `rescurer_phone_ibfk_1` FOREIGN KEY (`rescurer_name`) REFERENCES `rescurer` (`name`);

--
-- Constraints for table `shelter`
--
ALTER TABLE `shelter`

  ADD CONSTRAINT `shelter_ibfk_2` FOREIGN KEY (`transfer_from`,`trasnfer_to`) REFERENCES `ledger` (`transfer_from`, `trasnfer_to`),
  ADD CONSTRAINT `shelter_ibfk_3` FOREIGN KEY (`owner_fname`,`owner_lname`) REFERENCES `owner` (`owner_fname`, `owner_lname`);

--
-- Constraints for table `shelter_animal_type`
--
ALTER TABLE `shelter_animal_type`
  ADD CONSTRAINT `shelter_animal_type_ibfk_1` FOREIGN KEY (`shelter_name`) REFERENCES `shelter` (`name`);

--
-- Constraints for table `shelter_max_number`
--
ALTER TABLE `shelter_max_number`
  ADD CONSTRAINT `shelter_max_number_ibfk_1` FOREIGN KEY (`shelter_name`) REFERENCES `shelter` (`name`);

--
-- Constraints for table `shelter_phone`
--
ALTER TABLE `shelter_phone`
  ADD CONSTRAINT `shelter_phone_ibfk_1` FOREIGN KEY (`shelter_name`) REFERENCES `shelter` (`name`);

--
-- Constraints for table `spca_branch`
--
ALTER TABLE `spca_branch`
  ADD CONSTRAINT `spca_branch_ibfk_2` FOREIGN KEY (`owner_fname`,`owner_lname`) REFERENCES `owner` (`owner_fname`, `owner_lname`),
  ADD CONSTRAINT `spca_branch_ibfk_3` FOREIGN KEY (`transfer_from`,`trasnfer_to`) REFERENCES `ledger` (`transfer_from`, `trasnfer_to`);

--
-- Constraints for table `spca_phone`
--
ALTER TABLE `spca_phone`
  ADD CONSTRAINT `spca_phone_ibfk_1` FOREIGN KEY (`SPCA_name`) REFERENCES `spca_branch` (`name`);

--
-- Constraints for table `visit`
--
ALTER TABLE `visit`
  ADD CONSTRAINT `visit_ibfk_1` FOREIGN KEY (`animal_ID`) REFERENCES `animal` (`ID`),
  ADD CONSTRAINT `visit_ibfk_2` FOREIGN KEY (`vetFname`,`vetLname`) REFERENCES `vet` (`vet_fname`, `vet_lname`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
