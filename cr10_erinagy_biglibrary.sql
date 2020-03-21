-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 21, 2020 at 04:46 PM
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
-- Database: `cr10_erinagy_biglibrary`
--

-- --------------------------------------------------------

--
-- Table structure for table `author`
--

CREATE TABLE `author` (
  `author_id` int(11) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `author`
--

INSERT INTO `author` (`author_id`, `first_name`, `last_name`) VALUES
(1, 'Osamu', 'Tezuka'),
(2, 'Eiichiro', 'Oda'),
(3, 'Hayao', 'Miyazaki'),
(4, 'Umezu', 'Kazuo'),
(5, 'J. K. ', 'Rowling');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `media_id` int(100) NOT NULL,
  `title` varchar(50) NOT NULL,
  `ISBN` int(13) NOT NULL,
  `availability` enum('yes','no') DEFAULT 'yes',
  `fk_publisher_id` int(11) DEFAULT NULL,
  `fk_author_id` int(11) DEFAULT NULL,
  `fk_type_id` int(11) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `publish_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`media_id`, `title`, `ISBN`, `availability`, `fk_publisher_id`, `fk_author_id`, `fk_type_id`, `image_url`, `publish_date`) VALUES
(1, 'Princess Mononoke', 2147483647, 'yes', 1, 3, 2, 'https://images-na.ssl-images-amazon.com/images/I/51BO5u3F2nL._AC_SY445_.jpg', '2001-11-21'),
(2, 'My Neighbor Totoro', 2147483647, 'no', 1, 3, 3, 'https://images-na.ssl-images-amazon.com/images/I/81UbyXk3DAL._SL1500_.jpg', '2000-05-05'),
(6, 'Harry Potter and the Philosophers Stone', 12315888, 'yes', 3, 5, 1, 'https://images-na.ssl-images-amazon.com/images/I/81V3k2PxkIL.jpg', '1996-03-21'),
(7, 'Harry Potter and the Chamber of Secrets ', 23565655, 'no', 1, 5, 1, 'https://images-na.ssl-images-amazon.com/images/I/511X2B00B0L._SX335_BO1,204,203,200_.jpg', '1998-03-21'),
(8, 'Ambassador Atom', 2147483647, 'yes', 1, 1, 1, 'https://upload.wikimedia.org/wikipedia/en/b/bd/Ambassador_Atom_Cover.jpg', '1951-05-26'),
(9, 'Princess Knight', 232111212, 'yes', 1, 1, 1, 'https://upload.wikimedia.org/wikipedia/en/c/c0/Princess_Knight-1.jpg', '1960-07-21'),
(10, 'Black Jack ', 2147483647, 'yes', 1, 1, 1, 'https://upload.wikimedia.org/wikipedia/en/d/dd/Black_Jack_manga_vol_1.jpg', '1960-11-21'),
(11, 'One Piece 01', 1232133323, 'yes', 1, 2, 1, 'https://upload.wikimedia.org/wikipedia/en/9/90/One_Piece%2C_Volume_61_Cover_%28Japanese%29.jpg', '1996-03-21'),
(12, 'One Piece 02', 2147483647, 'yes', 1, 2, 1, 'https://upload.wikimedia.org/wikipedia/en/9/90/One_Piece%2C_Volume_61_Cover_%28Japanese%29.jpg', '1996-07-21'),
(13, 'One Piece 03', 1323232322, 'no', 1, 2, 1, 'https://upload.wikimedia.org/wikipedia/en/9/90/One_Piece%2C_Volume_61_Cover_%28Japanese%29.jpg', '1997-05-21');

-- --------------------------------------------------------

--
-- Table structure for table `media_type`
--

CREATE TABLE `media_type` (
  `type_id` int(20) NOT NULL,
  `type_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `media_type`
--

INSERT INTO `media_type` (`type_id`, `type_name`) VALUES
(1, 'BOOK'),
(2, 'DVD'),
(3, 'CD');

-- --------------------------------------------------------

--
-- Table structure for table `publisher`
--

CREATE TABLE `publisher` (
  `publisher_id` int(20) NOT NULL,
  `publisher_name` varchar(50) NOT NULL,
  `fk_size_id` int(11) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `publisher`
--

INSERT INTO `publisher` (`publisher_id`, `publisher_name`, `fk_size_id`, `address`) VALUES
(1, 'Hayakawa Shoten', 1, 'Chiyoda, Tokyo, Japan'),
(2, 'Gakken', 1, 'Shinagawa-ku, Tokyo 141-8510, Japan'),
(3, 'Akita Shoten', 1, 'Chiyoda, Tokyo, Japan');

-- --------------------------------------------------------

--
-- Table structure for table `publisher_size`
--

CREATE TABLE `publisher_size` (
  `size_id` int(20) NOT NULL,
  `size_type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `publisher_size`
--

INSERT INTO `publisher_size` (`size_id`, `size_type`) VALUES
(1, 'big'),
(2, 'medium'),
(3, 'small');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`author_id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`media_id`),
  ADD KEY `fk_publisher_id` (`fk_publisher_id`),
  ADD KEY `fk_author_id` (`fk_author_id`),
  ADD KEY `fk_type_id` (`fk_type_id`);

--
-- Indexes for table `media_type`
--
ALTER TABLE `media_type`
  ADD PRIMARY KEY (`type_id`);

--
-- Indexes for table `publisher`
--
ALTER TABLE `publisher`
  ADD PRIMARY KEY (`publisher_id`),
  ADD KEY `fk_size_id` (`fk_size_id`);

--
-- Indexes for table `publisher_size`
--
ALTER TABLE `publisher_size`
  ADD PRIMARY KEY (`size_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `author`
--
ALTER TABLE `author`
  MODIFY `author_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `media_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `media_type`
--
ALTER TABLE `media_type`
  MODIFY `type_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `publisher`
--
ALTER TABLE `publisher`
  MODIFY `publisher_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `publisher_size`
--
ALTER TABLE `publisher_size`
  MODIFY `size_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `media`
--
ALTER TABLE `media`
  ADD CONSTRAINT `media_ibfk_1` FOREIGN KEY (`fk_publisher_id`) REFERENCES `publisher` (`publisher_id`),
  ADD CONSTRAINT `media_ibfk_2` FOREIGN KEY (`fk_author_id`) REFERENCES `author` (`author_id`),
  ADD CONSTRAINT `media_ibfk_3` FOREIGN KEY (`fk_type_id`) REFERENCES `media_type` (`type_id`);

--
-- Constraints for table `publisher`
--
ALTER TABLE `publisher`
  ADD CONSTRAINT `publisher_ibfk_1` FOREIGN KEY (`fk_size_id`) REFERENCES `publisher_size` (`size_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
