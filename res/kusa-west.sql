-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 15, 2022 at 09:19 AM
-- Server version: 5.7.31
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kusa-west`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_kusa`
--

DROP TABLE IF EXISTS `admin_kusa`;
CREATE TABLE IF NOT EXISTS `admin_kusa` (
  `admin_id` int(10) NOT NULL AUTO_INCREMENT,
  `email` varchar(60) DEFAULT NULL,
  `names` varchar(200) DEFAULT NULL,
  `phone` varchar(30) NOT NULL,
  `idnumber` varchar(10) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_kusa`
--

INSERT INTO `admin_kusa` (`admin_id`, `email`, `names`, `phone`, `idnumber`, `password`) VALUES
(1, 'mwanikisamuel91@gmail.com', 'Samuel Ndegwa', '0726159307', '31854313', '12345678'),
(3, 'betty@gmail.com', 'Betty Nanjala', '0726159307', '33854313', '12345678'),
(4, 'kevokario@gmail.com', 'Kelvin Otieno', '0726159307', '12345678', '12345678'),
(5, '1', '2', '3', '4', '5');

-- --------------------------------------------------------

--
-- Table structure for table `athletes`
--

DROP TABLE IF EXISTS `athletes`;
CREATE TABLE IF NOT EXISTS `athletes` (
  `athlete_id` int(10) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(60) DEFAULT NULL,
  `second_name` varchar(60) DEFAULT NULL,
  `last_name` varchar(60) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `nationality` varchar(20) DEFAULT NULL,
  `county` varchar(60) DEFAULT NULL,
  `dob` varchar(18) DEFAULT NULL,
  `national_id` varchar(9) DEFAULT NULL,
  `phone_no` varchar(16) DEFAULT NULL,
  `email` varchar(65) DEFAULT NULL,
  `primary_name` varchar(60) DEFAULT NULL,
  `primary_grade` varchar(60) DEFAULT NULL,
  `secondary_name` varchar(60) DEFAULT NULL,
  `secondary_grade` varchar(60) DEFAULT NULL,
  `institiution_id` int(10) DEFAULT NULL,
  `regno` varchar(25) DEFAULT NULL,
  `current_year_of_study` varchar(10) DEFAULT NULL,
  `sport_id` int(255) DEFAULT NULL,
  `sport_duration` varchar(50) NOT NULL,
  `other_sports` text,
  `personal_photo` varchar(200) DEFAULT NULL,
  `birth_certificate` varchar(200) DEFAULT NULL,
  `national_id_front` varchar(200) DEFAULT NULL,
  `national_id_back` varchar(200) DEFAULT NULL,
  `student_id` varchar(200) DEFAULT NULL,
  `nhif_photo` varchar(200) DEFAULT NULL,
  `high_school_cert` varchar(200) DEFAULT NULL,
  `password` varchar(100) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`athlete_id`),
  KEY `institiution_id` (`institiution_id`),
  KEY `sport_id` (`sport_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `athletes`
--

INSERT INTO `athletes` (`athlete_id`, `first_name`, `second_name`, `last_name`, `gender`, `nationality`, `county`, `dob`, `national_id`, `phone_no`, `email`, `primary_name`, `primary_grade`, `secondary_name`, `secondary_grade`, `institiution_id`, `regno`, `current_year_of_study`, `sport_id`, `sport_duration`, `other_sports`, `personal_photo`, `birth_certificate`, `national_id_front`, `national_id_back`, `student_id`, `nhif_photo`, `high_school_cert`, `password`, `status`) VALUES
(1, 'Samuel', 'Ndegwa', 'Mwangi', 'Male', 'Kenya', 'Nyeri', '2/2/1999', '31854313', '0726159307', 'mwanikisamuel91@gmail.com', 'Karaba Primary', 'B', 'Muranga High School', 'A', 1, 'COM/0002/14', '2', 6, '1 - 2 Years', 'Swiming, Skating', 'noimage.jpg', 'c1.png', '145695national_id.jpg', 'c8.jpg', 'c10.jpg', 'c3.jpg', 'c2.jpg', '87654321', 0),
(2, 'Jencita', 'Wangeci', 'Mwangi', 'Female', 'Kenya', 'Muranga', '1998-09-29', '31854315', '0726159307', 'jecinta@gmail.com', 'Magombe Primary School', 'A (plain)', 'Magondu Secondary School', 'A (plain)', 1, 'BBM/0001/14', '-', 10, '1 - 2 years', 'Football, Skating', 'noimage.jpg', '31854315_1569329022.JPG', '31854315_1569329043.jpg', '31854315_1569329067.jpg', '31854315_1569329092.jpg', '--nhif-photo--', '31854315_1569329122.jpg', '31854315', 1),
(3, 'Eliakim', 'Otieno', 'Ayugi', 'Male', 'Kenya', 'Kisumu', '1999-09-22', '34343434', '0726159307', 'Ayugi@gmail.com', 'Kibabii Primary School', 'B+ (plus)', 'Kibabii High School', 'B+ (plus)', 1, 'COM/0023/14', '-', 6, '1 - 2 years', 'Rugby', 'noimage.jpg', '34343434_1569333045.jpg', '34343434_1569333059.jpg', '34343434_1569333068.jpg', '34343434_1569333079.jpg', '--nhif-photo--', '34343434_1569333092.jpg', '34343434', 1),
(4, 'collins', 'mundia', 'muthoni', 'Male', 'Kenya', 'kiambu', '2000-12-21', '32164089', '0704219247', 'kevokario@gmail.com', 'mamangina', 'B+ (plus)', 'rungiri', 'B+ (plus)', 1, 'com/0005/14', '-', 8, '8 - 11 months', 'No other Sports', 'noimage.jpg', '32164089_1569360280.jpg', '32164089_1569360291.jpg', '32164089_1571433707.jpg', '32164089_1569360328.jpg', '--nhif-photo--', '32164089_1569360344.jpg', 'monster', 1),
(5, 'muthoni', 'kelvin', 'kario', 'Male', 'Kenya', 'kiambu', '2014-09-29', '32163089', '0704219247', 'kevokario@gmail.com', 'mamangina', 'A- (minus)', 'rungiri', 'B+ (plus)', 1, 'com/0005/14', '-', 10, '4 - 8 months', 'No other Sports', 'noimage.jpg', '32163089_1569360806.jpg', '--national-id-front--', '32163089_1569361397.jpg', '32163089_1569361414.png', '--nhif-photo--', '32163089_1569361429.jpg', '32163089', 1),
(6, 'Samuel', 'Ndegwa', 'Mwangi', 'Male', 'Kenya', 'Kisumu', '1996-02-22', '32853321', '0726159307', 'mwanikisamuel91@gmail.com', 'Kenya', 'A (plain)', 'Bondo High School', 'C+ (plus)', 9, 'COM/0023/18', '-', 6, '2 - 5 years', 'N/A', 'noimage.jpg', '--birth-certificate--', '145695national_id.jpg', '--national-id-back--', '--student-id--', '--nhif-photo--', '--high-school-cert--', '32853321', 0),
(7, 'Jayden ', 'Kigogo', 'Mahuru', 'Male', 'Kenya', 'Nyeri', '1999-03-12', '31854333', '0726159307', 'mwanikisamuel91@gmail.com', 'Kawaya Primary', 'A (plain)', 'Gatururu', 'A (plain)', 1, 'COM/000/000', '-', 6, '2 - 5 years', 'Handball, Tennis', 'noimage.jpg', '31854333_1617470363.png', '145695national_id.jpg', '31854333_1617470501.jpg', '31854333_1617470503.jpg', '--nhif-photo--', '31854333_1617470504.png', '31854333', 0),
(8, 'Lawrence', 'Wambugu', 'Mwangi', 'Male', 'Kenya', 'Nyeri', '1991-08-31', '34343443', '0712345678', 'www@www.com', 'Kawaya Primary', 'A (plain)', 'Gatururu', 'A (plain)', 3, 'COM/898/2021', '-', 6, '8 - 11 months', 'no', 'noimage.jpg', '34343443_1633939900.jpg', '34343443_1633939906.jpg', '34343443_1633939920.jpg', '34343443_1633939933.jpg', '--nhif-photo--', '34343443_1633939945.jpg', '34343443', 0),
(9, 'Eliud', 'Njoroge', 'Mwangi', 'Male', 'Kenya', 'Nyeri', '2002-07-10', '76543344', '07261593234', 'mwas@gmail.com', 'Karaba', 'B+ (plus)', 'Muranga', 'B (plain)', 2, 'COM/0005/14', '-', 6, '4 - 8 months', 'No', '76543344_1664785458.jpg', '76543344_1664785488.jpg', '76543344_1664785507.jpg', '76543344_1664785516.jpg', '76543344_1664785527.jpg', '--nhif-photo--', '76543344_1664785541.jpg', '76543344', 0),
(10, 'Esther', 'Muthoni', 'Mwangi', 'Female', 'Kenya', 'Nakuru', '2000-09-08', '34567890', '0712345678', 'mso@gmail.com', 'Mutune Primary', 'A (plain)', 'Muyello Secondary', 'A (plain)', 1, 'COM/0005/0002', '-', 6, '8 - 11 months', 'Handball, Taekwondo', '--personal-photo--', '952388secondary.jpg', '501555national_id.jpg', '463236national_id.jpg', '716305national_id.jpg', '244368secondary.jpg', '524400university.jpg', '34567890', 0),
(12, 'zxcvg', 'cvbn', 'cvbnm', 'Male', 'Kenya', 'sdfghj', '2000-09-09', '87675655', '0726159307', 'mum@gmail.com', 'Karaba', 'D (plain)', 'Muranga', 'C- (minus)', 1, 'COM/0005/088', '-', 10, '2 - 5 years', 'asdfghj', '600923istockphoto-1125335892-612x612.jpg', '--birth-certificate--', '--national-id-front--', '--national-id-back--', '--student-id--', '--nhif-photo--', '--high-school-cert--', '1234', 0),
(13, 'zxcdfvbnm', 'cfvgbh', 'fghj', 'Female', 'Kenya', 'dfghj', '2000-05-30', '23456782', '0726159307', 'mwanikisamuel91@gmail.com', 'Karaba', 'D+ (plus)', 'Muyello Secondary', 'D (plain)', 8, 'COM/0005/14', '-', 6, '1 - 2 years', 'No other Sports', '--personal-photo--', '--birth-certificate--', '145695national_id.jpg', '--national-id-back--', '--student-id--', '--nhif-photo--', '--high-school-cert--', '23456782', 0);

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
CREATE TABLE IF NOT EXISTS `events` (
  `event_id` int(10) NOT NULL AUTO_INCREMENT,
  `event_name` varchar(200) NOT NULL,
  `event_type` varchar(200) NOT NULL,
  `event_venue` varchar(100) NOT NULL,
  `fee_applicable` varchar(30) NOT NULL,
  `event_date` varchar(50) NOT NULL,
  `event_stamp` varchar(50) NOT NULL,
  PRIMARY KEY (`event_id`),
  UNIQUE KEY `event_id` (`event_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`event_id`, `event_name`, `event_type`, `event_venue`, `fee_applicable`, `event_date`, `event_stamp`) VALUES
(3, 'KUSA Football', 'KUSA Western Cup', 'Kibabii University', '2000', '2019-10-23', '20191023'),
(4, 'KUSA Handball ', 'KUSA Western Cup', 'Kibabii University', '2000', '2019-10-25', '20191025'),
(5, 'Kusa Opens', 'Footall Championship', 'MUST', '1500', '2019-10-24', '20191024'),
(6, 'KUSA Volletball', 'Kusa Championship', 'Kibabii University', '1000', '2019-10-30', '20191030'),
(7, 'KUSA Football', 'Kusa nationals', 'U.O.K', '1000', '2019-12-03', '20191203'),
(8, 'Captains and coaches Workshop', 'Workshop', 'Kibabii University', '0', '2022-10-13', '20221013'),
(9, 'Crosss Country', 'Athletic', 'Maseno', '0', '2022-10-29', '20221029'),
(10, 'Football Match', 'Competition', 'Maseno University', '0', '2022-12-05', '20221205');

-- --------------------------------------------------------

--
-- Table structure for table `event_applications`
--

DROP TABLE IF EXISTS `event_applications`;
CREATE TABLE IF NOT EXISTS `event_applications` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `event_id` int(10) NOT NULL,
  `athlete_id` int(10) NOT NULL,
  `institiution_id` int(10) NOT NULL,
  `date_applied` varchar(100) NOT NULL,
  `status_approval` int(1) NOT NULL,
  `status_participate` int(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `event_id` (`event_id`),
  KEY `athlete_id` (`athlete_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `event_applications`
--

INSERT INTO `event_applications` (`id`, `event_id`, `athlete_id`, `institiution_id`, `date_applied`, `status_approval`, `status_participate`) VALUES
(1, 3, 1, 1, '2019-10-10', 1, 0),
(2, 5, 3, 1, '2019-10-12', 1, 0),
(3, 5, 2, 1, '2019-10-12', 1, 0),
(4, 6, 2, 1, '2019-10-12', 1, 0),
(5, 3, 2, 1, '2019-10-12', 1, 0),
(6, 4, 2, 1, '2019-10-12', 1, 0),
(7, 6, 1, 1, '2019-10-16', 1, 0),
(8, 8, 10, 1, '2022-10-12  21:55', 1, 0),
(9, 9, 9, 2, '2022-10-13  08:58', 0, 0),
(10, 9, 10, 1, '2022-10-13  09:00', 0, 0),
(11, 10, 9, 2, '2022-11-06  17:18', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `frontgallery`
--

DROP TABLE IF EXISTS `frontgallery`;
CREATE TABLE IF NOT EXISTS `frontgallery` (
  `id` int(200) NOT NULL AUTO_INCREMENT,
  `image` varchar(200) NOT NULL,
  `title` text NOT NULL,
  `time_uploaded` varchar(50) NOT NULL,
  `time_counter` varchar(50) NOT NULL,
  `status` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `frontgallery`
--

INSERT INTO `frontgallery` (`id`, `image`, `title`, `time_uploaded`, `time_counter`, `status`) VALUES
(1, 'ddddd.jpg', 'testing', '2021-03-29 At 11:14', '202103291114', '1'),
(2, 'IMG-20190915-WA0010.jpg', 'Kenya Open at Kasarani, December 2018', '2019-09-15 At 17:17', '201909151717', '1'),
(3, 'e4.jpg', 'Testing Gallery 2', '2019-09-16 At 17:10', '201909161710', '1'),
(4, 'wwwww.jpg', 'Kenya Open at Kasarani, December 2018', '2019-09-15 At 17:19', '201909151719', '1'),
(5, 'Keny in Rabat, Morocco.jpg', 'Testing Gallery', '2019-09-16 At 17:04', '201909161704', '1'),
(6, 'open14.jpg', 'Testing Gallery', '2019-09-16 At 17:04', '201909161704', '1'),
(7, 'ssdd.jpg', 'testing', '2021-03-29 At 10:46', '202103291046', '1'),
(8, 'open13.jpg', 'Kenya Open at Kasarani, December 2018', '2019-09-15 At 17:11', '201909151711', '1'),
(9, 'e5.jpg', 'Kenya Taekwondo National Team participated in championship games at Fayoum University in Alexandria City, Egypt', '', '201909151427', '1');

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

DROP TABLE IF EXISTS `gallery`;
CREATE TABLE IF NOT EXISTS `gallery` (
  `id` int(200) NOT NULL AUTO_INCREMENT,
  `image` varchar(500) NOT NULL,
  `title` text NOT NULL,
  `description` text NOT NULL,
  `time_uploaded` varchar(1000) NOT NULL,
  `time_counter` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gallery`
--

INSERT INTO `gallery` (`id`, `image`, `title`, `description`, `time_uploaded`, `time_counter`) VALUES
(1, '12.jpg', 'Testing', 'This is a testing Image', '2019-09-13 At 16:43', '201909131643'),
(2, '37.png', 'Testin 2', 'Were are testing this Image', '2019-09-15 At 14:27', '201909151427'),
(3, '32.jpg', 'Testin 3', 'This is image testing 3', '2019-09-13 At 16:43', '201909131643'),
(4, '10.jpg', 'Testin 4', 'Testing Image 4', '2019-09-13 At 16:47', '201909131647'),
(5, '19.jpg', 'sdghj', 'sdfghjk', '2019-09-13 At 16:53', '201909131653'),
(6, '20.jpg', 'asdfghjkl', 'asdfg sdfghjkl', '2019-09-13 At 16:58', '201909131658'),
(7, 'ribbon.jpg', 'xdcfvghnm,', 'sdfgbhnjm,', '2019-09-15 At 16:11', '201909151611'),
(8, '15.png', 'xcvb n', 'dcvbnm', '2019-09-15 At 16:21', '201909151621'),
(9, 'Kenya_NOC_logo.jpg', 'dgggvv', 'dsbbhbbe', '2019-09-15 At 16:23', '201909151623'),
(10, '7.jpg', 'dfghj', 'dfgbhnjm', '2019-09-15 At 16:32', '201909151632'),
(11, 'e1.jpg', 'Kenya Taekwondo National Team participated in championship games at Fayoum University in Alexandria City, Egypt', 'Kenya Taekwondo National Team participated in championship games at Fayoum University in Alexandria City, Egypt', '2019-09-15 At 17:01', '201909151701'),
(12, 'e2.jpg', 'Kenya Taekwondo National Team participated in championship games at Fayoum University in Alexandria City, Egypt', 'Kenya Taekwondo National Team participated in championship games at Fayoum University in Alexandria City, Egypt', '2019-09-15 At 17:02', '201909151702'),
(13, 'e4.jpg', 'Kenya Taekwondo National Team participated in championship games at Fayoum University in Alexandria City, Egypt', 'Kenya Taekwondo National Team participated in championship games at Fayoum University in Alexandria City, Egypt', '2019-09-15 At 17:02', '201909151702'),
(14, 'e5.jpg', 'Kenya Taekwondo National Team participated in championship games at Fayoum University in Alexandria City, Egypt', 'Kenya Taekwondo National Team participated in championship games at Fayoum University in Alexandria City, Egypt', '2019-09-15 At 17:05', '201909151705'),
(15, 'e6.jpg', 'Kenya Taekwondo National Team participated in championship games at Fayoum University in Alexandria City, Egypt', 'Kenya Taekwondo National Team participated in championship games at Fayoum University in Alexandria City, Egypt', '2019-09-15 At 17:06', '201909151706'),
(16, '57.jpg', 'Athletee doing practice', 'Athletee doing practice', '2019-09-15 At 17:10', '201909151710'),
(17, 'open13.jpg', 'Kenya Open at Kasarani, December 2018', 'Kenya Open at Kasarani, December 2018', '2019-09-15 At 17:11', '201909151711'),
(18, 'open14.jpg', 'Kenya Open at Kasarani, December 2018', 'Kenya Open at Kasarani, December 2018', '2019-09-15 At 17:17', '201909151717'),
(19, 't7.jpg', 'Kenya Open at Kasarani, December 2018', 'Kenya Open at Kasarani, December 2018', '2019-09-15 At 17:19', '201909151719'),
(20, '17.jpg', 'Testing Replace', 'This image is ment', '2019-09-16 At 13:08', '201909161308'),
(21, '29.png', 'Testing Replace 2', 'sdfghjkl', '2019-09-16 At 13:12', '201909161312'),
(22, 'Chair.jpg', 'Testing Gallery', 'fffff', '2019-09-16 At 17:04', '201909161704'),
(23, 'wwwww.jpg', 'Team Kenya in Rabat, Morocco', 'Team Kenya in Rabat, Morocco', '2019-09-24 At 22:16', '201909242216'),
(24, 'Keny in Rabat, Morocco.jpg', 'Team Kenya in Rabat, Morocco', 'Team Kenya in Rabat, Morocco', '2019-09-24 At 22:18', '201909242218'),
(25, 'IMG-20190915-WA0003(1).jpg', 'Team Kenya in Rabat, Morocco', 'Team Kenya in Rabat, Morocco', '2019-09-24 At 22:19', '201909242219'),
(26, 'IMG-20190915-WA0010.jpg', 'Team Kenya in Rabat, Morocco', 'Team Kenya in Rabat, Morocco', '2019-09-24 At 22:20', '201909242220'),
(27, 'ggghh.png', 'testing', 'blublublublub;u', '2021-03-29 At 10:12', '202103291012'),
(28, 'ssdd.jpg', 'testing', 'asdfghj', '2021-03-29 At 10:46', '202103291046'),
(29, 'ddddd.jpg', 'testing', 'asdfhtrg yy6y656', '2021-03-29 At 11:14', '202103291114');

-- --------------------------------------------------------

--
-- Table structure for table `hot_advert`
--

DROP TABLE IF EXISTS `hot_advert`;
CREATE TABLE IF NOT EXISTS `hot_advert` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hot_advert`
--

INSERT INTO `hot_advert` (`id`, `description`) VALUES
(1, 'Welcome to KUSA Western Conference. Kenya University Sports Association(KUSA) Western Conference is requesting all Universities and Colleges within Western part of the Country to advise their students who participate in any sport recognized by KUSA, to first this site and register as a member for free.');

-- --------------------------------------------------------

--
-- Table structure for table `institiution`
--

DROP TABLE IF EXISTS `institiution`;
CREATE TABLE IF NOT EXISTS `institiution` (
  `institiution_id` int(10) NOT NULL AUTO_INCREMENT,
  `institiution_name` varchar(60) DEFAULT NULL,
  `institiution_logo` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`institiution_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `institiution`
--

INSERT INTO `institiution` (`institiution_id`, `institiution_name`, `institiution_logo`) VALUES
(1, 'Kibabii University', 'MUTLogo.PNG'),
(2, 'Masinde Muliro University', 'log1.png'),
(3, 'Kaimosi University College', 'log.png'),
(4, 'Kabianga University', 'county.jpg'),
(5, 'Maseno University', 'c6.jpg'),
(6, '$College', '$logoImage'),
(7, 'Muranga University', 'c10.jpg'),
(8, 'Mang\'u University', 'c1.png'),
(9, 'Murang\'a University', 'c2.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `money_in_out`
--

DROP TABLE IF EXISTS `money_in_out`;
CREATE TABLE IF NOT EXISTS `money_in_out` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `giver_receiver` varchar(200) DEFAULT NULL,
  `specific_name` varchar(300) DEFAULT NULL,
  `comment` varchar(1000) DEFAULT NULL,
  `amount_in` varchar(50) DEFAULT NULL,
  `amount_out` varchar(100) DEFAULT NULL,
  `ref_number` varchar(400) DEFAULT NULL,
  `transaction_date` varchar(100) DEFAULT NULL,
  `transaction_year` varchar(30) DEFAULT NULL,
  `user` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `money_in_out`
--

INSERT INTO `money_in_out` (`id`, `giver_receiver`, `specific_name`, `comment`, `amount_in`, `amount_out`, `ref_number`, `transaction_date`, `transaction_year`, `user`) VALUES
(1, 'Donor', '', 'To fund daily activities', '100000', '', 'MLH098767Y', '2019-01-01', '2019', 'Ndegwa'),
(3, 'Sponsor', '', 'Annual Leaague', '200000', '', 'JTG45678H', '2019-01-01', '2019', 'Ndegwa'),
(4, 'Ministry Fund', '', 'To construct new office', '500000', '', 'HTS23456GH', '2019-01-01', '2019', 'Ndegwa'),
(5, 'Donor', '', 'Kenya open fund', '100000', '', 'FGD234567G', '2019-01-01', '2019', 'Ndegwa'),
(6, 'Western Conference', '', 'To be used in hosting kenya opens 2019', '', '100000', '', '2019-01-01', '2019', 'Ndegwa'),
(7, 'Coach ID Number 3634555', '', 'Registration', '1000', '', 'GHF34567D', '2019-01-01', '2019', 'Ndegwa'),
(8, 'Athletee ID Number 33258304', '', 'Registration', '1000', '', 'ML7734VG7', '2019-01-01', '2019', 'Ndegwa'),
(9, 'Referee ID Number 10293847', '', 'Registration', '1000', '', 'MKGHJ23H34', '2019-01-01', '2019', 'Ndegwa'),
(10, 'Techno Kenya', '', 'Payment for software delivery to ktf.', '', '50000', '', '2019-01-02', '2019', 'Ndegwa'),
(11, 'Kibabii University', '', 'Registration', '1000', '', 'GS5557D7', '2019-01-10', '2019', 'Ndegwa'),
(12, 'Coach ID Number 31854313', '', 'Registration', '1000', '', 'KY254DDRWR', '2019-01-10', '2019', 'Ndegwa'),
(13, 'Mutwe', '', 'Registration', '1000', '', 'HH353FRH', '2019-01-10', '2019', 'Ndegwa'),
(14, 'Coach ID Number 23212863', '', 'Registration', '1000', '', 'VTYY45688H', '2019-01-10', '2019', 'Ndegwa'),
(15, 'Kisumu', '', 'Registration', '1000', '', 'GYGD345678j', '2019-01-10', '2019', 'Ndegwa'),
(16, 'Donor', '', 'air ticket', '1000089', '', 'qwrtrytty', '2019-01-10', '2019', 'Ndegwa'),
(17, 'Athletee ID Number 31854313', '', 'Registration', '1000', '', 'MV234567DR', '2019-09-20', '2019', 'Ndegwa'),
(18, 'Sponsor', 'USA government', 'For purchase of domain', '56000', '', 'HTHG9888J', '2019-10-07', '2019', 'Samuel Ndegwa'),
(19, 'Donor', 'Italy Government', 'Purchase of football kits', '100000', '', 'FEH097766G', '2019-10-08', '2019', 'Samuel Ndegwa'),
(20, 'Samuel Ndegwa Mwangi ID Number 31854313', 'Samuel Ndegwa Mwangi ID Number 31854313', 'Event Application', '2000', '', 'YRES33443LK', '2019-10-12', '2019', 'Samuel Ndegwa'),
(21, 'Samuel Ndegwa Mwangi ID Number 31854313', 'Samuel Ndegwa Mwangi ID Number 31854313', 'Event Application', '2000', '', 'YTQS33443LI', '2019-10-12', '2019', 'Samuel Ndegwa'),
(22, 'Samuel Ndegwa Mwangi ID Number 31854313', 'Samuel Ndegwa Mwangi ID Number 31854313', 'Event Application', '2000', '', 'SRES33443MN', '2019-10-12', '2019', 'Samuel Ndegwa'),
(23, 'Eliakim Otieno Ayugi ID Number 34343434', 'Eliakim Otieno Ayugi ID Number 34343434', 'Event Application', '1500', '', 'WRES33443NM', '2019-10-12', '2019', 'Samuel Ndegwa'),
(24, 'Samuel Ndegwa Mwangi ID Number 31854313', 'Samuel Ndegwa Mwangi ID Number 31854313', 'Event Application', '2000', '', 'JFYWF3456j', '2019-10-12', '2019', 'Samuel Ndegwa'),
(25, 'Eliakim Otieno Ayugi ID Number 34343434', 'Eliakim Otieno Ayugi ID Number 34343434', 'Event Application', '1500', '', 'SYGF3456SD', '2019-10-12', '2019', 'Samuel Ndegwa'),
(26, 'Jencita Wangeci Mwangi ID Number 31854315', 'Jencita Wangeci Mwangi ID Number 31854315', 'Event Application', '2000', '', 'sdfgh4567jn', '2019-10-12', '2019', 'Samuel Ndegwa'),
(27, 'Jencita Wangeci Mwangi ID Number 31854315', 'Jencita Wangeci Mwangi ID Number 31854315', 'Event Application', '1500', '', 'asdfgh45678g', '2019-10-12', '2019', 'Samuel Ndegwa'),
(28, 'Jencita Wangeci Mwangi ID Number 31854315', 'Jencita Wangeci Mwangi ID Number 31854315', 'Event Application', '1500', '', 'sdfghh456fg', '2019-10-12', '2019', 'Samuel Ndegwa'),
(29, 'Jencita Wangeci Mwangi ID Number 31854315', 'Jencita Wangeci Mwangi ID Number 31854315', 'Event Application', '1500', '', 'asdfghj3456yhg', '2019-10-12', '2019', 'Samuel Ndegwa'),
(30, 'Jencita Wangeci Mwangi ID Number 31854315', 'Jencita Wangeci Mwangi ID Number 31854315', 'Event Application', '1000', '', 'asdfghj434567', '2019-10-12', '2019', 'Samuel Ndegwa'),
(31, 'Jencita Wangeci Mwangi ID Number 31854315', 'Jencita Wangeci Mwangi ID Number 31854315', 'Event Application', '1000', '', 'asdfghj434567', '2019-10-12', '2019', 'Samuel Ndegwa'),
(32, 'Jencita Wangeci Mwangi ID Number 31854315', 'Jencita Wangeci Mwangi ID Number 31854315', 'Event Application', '1000', '', 'asdfghj434567', '2019-10-12', '2019', 'Samuel Ndegwa'),
(33, 'Jencita Wangeci Mwangi ID Number 31854315', 'Jencita Wangeci Mwangi ID Number 31854315', 'Event Application', '1000', '', 'asdfghj434567', '2019-10-12', '2019', 'Samuel Ndegwa'),
(34, 'Samuel Ndegwa Mwangi ID Number 31854313', 'Samuel Ndegwa Mwangi ID Number 31854313', 'Event Application', '2000', '', 'FFEWAW3443LK', '2019-10-17', '2019', 'Samuel'),
(35, 'Samuel Ndegwa Mwangi ID Number 31854313', 'Samuel Ndegwa Mwangi ID Number 31854313', 'Event Application', '2000', '', 'FFEWAW3443LM', '2019-10-20', '2019', 'Samuel'),
(36, 'Jencita Wangeci Mwangi ID Number 31854315', 'Jencita Wangeci Mwangi ID Number 31854315', 'Event Application', '2000', '', 'WRES33443NJ', '2019-10-20', '2019', 'Samuel'),
(37, 'Jencita Wangeci Mwangi ID Number 31854315', 'Jencita Wangeci Mwangi ID Number 31854315', 'Event Application', '1500', '', 'GHGH78737H', '2019-10-31', '2019', 'Samuel'),
(38, 'Jack Oyugi', '456353636', 'To purchase water', '', '89', '', '2019-11-12', '2019', ''),
(39, 'Esther Muthoni Mwangi ID Number 34567890', 'Esther Muthoni Mwangi ID Number 34567890', 'Event Application', '0', NULL, 'wertyujikv', '2022-10-12', '2022', 'John ');

-- --------------------------------------------------------

--
-- Table structure for table `news_in`
--

DROP TABLE IF EXISTS `news_in`;
CREATE TABLE IF NOT EXISTS `news_in` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `image` varchar(200) NOT NULL,
  `news_link` varchar(200) NOT NULL,
  `title` varchar(400) NOT NULL,
  `description` text NOT NULL,
  `time_in` varchar(100) NOT NULL,
  `time_stamp` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `news_in`
--

INSERT INTO `news_in` (`id`, `image`, `news_link`, `title`, `description`, `time_in`, `time_stamp`) VALUES
(1, 'k1.jpg', 'kusa-university-results', 'Results for Western Universities Games held at Kibabii Univesity On 2nd to 3rd November 2019', 'SILVER</span>     \r\n<br>3.      Christin kiamuui                               MMUST           <span class=\"badge\">BRONZE</span>\r\n<h5>FLY WEIGHT LADIES ï¿½ 49 KG</h5>\r\n  1.      Edna Sichangi                           KIBU                        <span class=\"badge\"> GOLD</span>\r\n<br>2.      Wilkistsar Akoth                                KISII                         <span class=\"badge\"> SILVER</span>\r\n<br>3.      Mildred Wafula                                  KIBU                         <span class=\"badge\">BRONZE</span>\r\n<br>4.      Mary Kadzo                              MMUST                  <span class=\"badge\"> BRONZE</span>\r\n<br><h5> BANTAM WEIGHT LADIES 52 KG</h5>\r\n  1.      Lauret Vuzili                                       KIBU                         <span class=\"badge\"> GOLD</span>\r\n<br>2.      Mariam Wangeci                                  KAFUCO                    <span class=\"badge\">SILVER</span>\r\n <h5>FEATHER WEIGHT LADIES.</h5>\r\n1.      Jane Muthino                                        MMUST              <span class=\"badge\"> GOLD</span>\r\n<br>2.      Teresia Nduta                                        KISII                      <span class=\"badge\">SILVER</span>\r\n<br>3.      Damaris Nambuga                                 KIBU            <span class=\"badge\">BRONZE></span>\r\n<br>4.      Elizabeth Wambua                                 KIBU           <span class=\"badge\">BRONZE</span>\r\n<br><h5>LIGHT WEIGHT WOMEN.</h5>\r\n1.      Christabel Sirengo                                    KIBU             <span class=\"badge\"> GOLD</span>\r\n<br>2.      Teresia Wamaitha                                    RONGO              <span class=\"badge\"> SILVER</span>\r\n<br>3.      Catherina Tata                                          KISII           <span class=\"badge\">BRONZE</span>\r\n<br>4.      Veronica Nyambura                                 RONGO         <span class=\"badge\">BRONZE</span>\r\n<br><h5>WELTER WEIGHT WOMEN.</h5>\r\n1.      Ebby Nato                                                 KIBU                          <span class=\"badge\"> GOLD</span>\r\n<br>2.      Valary Karita                                             MMUST                      <span class=\"badge\">SILVER</span>\r\n<br>3.      Maureen Waithera                                     MMUST                    <span class=\"badge\"> BRONZE</span>\r\n<h5>MID WEIGHT WOMEN.</h5>\r\n1.      Jully Musangi                                       KIBU                             <span class=\"badge\"> GOLD </span>  \r\n<br>2.      Zurah Nabukum                                   KIBU                              <span class=\"badge\">SILVER</span>\r\n<br>3.      Charity Mutuku                                    MMUST                        <span class=\"badge\">BRONZE</span>\r\n<h5> HEAVY WEIGHT LADIES.</h5>\r\n1.      Gueta Towit                                           KIBU                             <span class=\"badge\"> GOLD</span>\r\n<br>2.      Valerie Makokha                                   KIBU                             <span class=\"badge\"> SILVER</span>\r\n<br>3.      Gloria Nagweya                                     MMUST                        <span class=\"badge\">BRONZE</span>\r\n\r\n<br><h4>TAEKWONDO MEN RESULTS</h4>\r\n<h5>FIN WEIGHT MEN -54 KG  </h5> \r\n1.      Benjamin Kasii                         KIBU                         <span class=\"badge\">GOLD</span>\r\n<br>2.      Mvuko Duma Khamisi            RONGO                    <span class=\"badge\">SILVER</span>\r\n<br>3.      Mwalimu Kelvin                      RONGO                     <span class=\"badge\">BRONZE</span>\r\n<br>4.      Gabriel Mutiso                        KISII                           <span class=\"badge\">BRONZE</span>\r\n<h5>FLY WEIGHT MEN 58 KG</h5>\r\n1.      Roward Ali                               MMUST                   <span class=\"badge\">GOLD</span>\r\n<br>2.      Graven Yiminy                         KIBU                         <span class=\"badge\">SILVER</span>\r\n<br>3.      Joab Lepausanty                     KAFUCO                   <span class=\"badge\">BRONZE</span>\r\n<br>4.      Victor Sevot                             MMUST                   <span class=\"badge\">BRONZE</span>\r\n<h5>BANTAM WEIGHT MEN- 63 KG</h5>\r\n1.      Eric Ogal                                 KIBU                         <span class=\"badge\">GOLD</span>\r\n<br>2.      Steven Kilonzo                      MMUST                    <span class=\"badge\">SILVER</span>\r\n<br>3.      Moses Nafasi                        MMUST                    <span class=\"badge\">BRONZE</span>\r\n<br>4.      Muema Daniel Kyuli              KAFUCO                         <span class=\"badge\">BRONZE</span>\r\n\r\n<h5>FEATHER WEIGHT MEN.</h5>\r\n1.      Dennis Arwa                                           KIBU                             <span class=\"badge\"> GOLD</span>\r\n<br>2.      Washington Okeyo                               JOOUST                         <span class=\"badge\">SILVER</span>\r\n<br>3.      Lewis Khamoni                                      KISII                               <span class=\"badge\"> BRONZE</span>\r\n<br>4.      Leparsanty joab                                    KAFUCO                   <span class=\"badge\">Bronze</span>\r\n\r\n<h5>LIGHT WEIGHT MEN.</h5>\r\n1.      Meshack Oduyo                                         KIBU                              <span class=\"badge\">GOLD</span>\r\n<br>2.      Brian Ochieng                                           KIBU                              SILVER\r\n<br>3.      Meshack Ochieng                                     KISII                            <span class=\"badge\">  BRONZE</span>\r\n<br>4.      Dennis Odhiambo                                    KAFUCO                      <span class=\"badge\">  BRONZE</span>\r\n\r\n<h5>WELTER WEIGHT MEN.</h5>\r\n1.      Juma Ishamel                                              KIBU                            <span class=\"badge\"> GOLD</span>\r\n<br>2.      Emmanuel Otieno                                      MMUST                       <span class=\"badge\">SILVER </span>\r\n<br>3.      Wamalwa Dominic                                     MMUST                     <span class=\"badge\"> BRONZE</span>\r\n<br>4.      Kelvin Kibe                                                   KISII                            <span class=\"badge\"> BRONZE</span>\r\n\r\n\r\n<h5>MID WEIGHT MEN</h5>\r\n1.      Leonard Mukanda                             KIBU                         <span class=\"badge\">GOLD</span>\r\n<br>2.      Ofisi Baraza                                         MMUST                    <span class=\"badge\">SILVER</span>\r\n<br>3.      Kevin Mbugua                                    KISII                          <span class=\"badge\"> BRONZE</span>\r\n<br>4.      Meshack Masanga                             MASENO                 <span class=\"badge\"> BRONZE</span>\r\n\r\n<h5>HEAVY WEIGHT MEN.</h5>\r\n1.      Innocent Wafula                                   KIBU                             <span class=\"badge\">GOLD</span>\r\n<br>2.      Abdirizak Hamed                                  MMUST                        <span class=\"badge\">SILVER</span>\r\n\r\n\r\n<h4>KARATE</h4>\r\n<h5>KATA WOMEN</h5>\r\n1.      WAWERU BRENDA   MASINDE MULIRO UNIVERSITY\r\n<br>2.      SELINE ANYANGO  MASENO UNIVERSITY\r\n<br>3.      CHRISTINE AKINYI        MASENO UNIVERSITY\r\n<br>4.      LINDA WERE              MASENO UNIVERSITY\r\n<h4>KUMITE</h4>\r\n<h5>LADIES KUMITE 50KGS</h5>\r\n1.      WAWERU BRENDA   MASINDE MULIRO UNIVERSITY\r\n<br>2.      PHILOMENA NJERI         KIBABII UNIVERSITY\r\n<br>3.      VIVIAN JEPTUM   MASENO UNIVERSITY\r\n<br>4.      IRENE WAFULA    MASINDE MULIRO UNIVERSITY\r\n<h5>LADIES KUMITE UNDER 55KGS</h5>\r\n1.      CHRISTINE AKINYI        MASENO UNIVERSITY\r\n<br>2.      SARAH WAKHUNGU  MASINDE MULIRO UNIVERSITY\r\n<br>3.      MUTAKA SINAIDE  KIABABII UNIVERSITY\r\n<h5>LADIES KUMITE UNDER 61 KGS</h5>\r\n1.      MAURICE ANYANGO MASENO UNIVERSITY\r\n<br>2.      MONICA NJERI    MASENO UNIVERSITY\r\n<br>3.      WAWIRE SAFINA   KIBABII UNIVERSITY\r\n<br>4.      CATHERINE TATA  KISII UNIVERSITY\r\n\r\n\r\n\r\n<h5>LADIES KUMITE UNDER 67 KGS</h5>\r\n1.      LINDA WERE              MASENO UNIVERSITY\r\n<br>2.      MARY MWENDA             MASINDE MULIRO UNIVERSITY\r\n<br>3.      LYDIA OOKO ANYANGO      KIBABII UNIVERSITY\r\n<br>4.      ARATONI SARAH           KIBABII UNIVERSITY\r\n<h5>LADIES KUMITE OVER 67 KGS</h5>\r\n1.      EMMACULATE ADHIAMBO     MASENO UNIVERSITY\r\n<br>2.      SELINE ANYANGO          MASENO UNIVERSITY\r\n<br>3.      ELIZABENTH WANJIRU      KIBABII UNIVERSITY\r\n\r\n<h5>KATA MEN</h5>\r\n1.      KEVIN OGUTU     MASINDE MULIRO UNIVERSITY\r\n<br>2.      BONIFACE OPIYO  RONGO UNIVERSITY\r\n<br>3.      FRANCIS NJAU            MASINDE MULIRO UNIVERSITY\r\n<br>4.      JUSTUS OMONDI   MASINDE MULIRO UNIVERSITY\r\n\r\n<h4>KUMITE MEN</h4>\r\n<h5>MALE KUMITE UNDER 60 KGS</h5>\r\n1.      HENRY WAKHUNGU  KIBABII UNIVERSITY\r\n<br>2.      DENIS THUKU             MASENO UNIVERSITY\r\n<br>3.      ASHA ONDIGU             RONGO UNIVERSITY\r\n<br>4.      YABESH OGETO    MASENO UNIVERSITY\r\n<h5>MALE KUMITE UNDER 67KGS</h5>\r\n1.      KEVIN OGUTU     MASINDE MULIRO UNIVERSITY\r\n<br>2.      ISAAC JUMA      MASINDE MULIRO UNIVERSITY\r\n<br>3.      RAPHAEL MUSEVENI        MASENO UNIVERSITY\r\n<br>4.      ORWAKO EVANS    JARAMOGI OGINGA ODINGA UNIVERSITY\r\n\r\n<h5>MALE KUMITE UNDER 75 KGS</h5>\r\n1.      BINEAH WANJALA  MASINDE MULIRO UNIVERSITY\r\n<br>2.      FREDRICK ODHIAMBO       RONGO UNIVERSITY\r\n<br>3.      OBEDI BULUMA    KIBABII UNIVERSITY\r\n<br>4.      MERCEL ODHIAMBO MASENO UNIVERSITY\r\n\r\n\r\n<h5>MALE KUMITE UNDER 88 KGS</h5>\r\n1.      GILBERT SARUNI  MASINDE MULIRO UNIVERSITY\r\n<br>2.      NIMROD AYUGA    KISII UNIVERSITY\r\n<br>3.      BRIAN ODHIAMBO  RONGO UNIVERSITY\r\n<br>4.      EMMANUEL OKOTH  Rongo University\r\n\r\n<h5>MALE KUMITE OVER 84 KGS</h5>\r\n1.      OCHOLA PHILIS   RONGO UNIVERSITY\r\n<br>2.      KEVIN NALIANYA  KIBABII UNIVERSITY\r\n<br>3.      KEVIN MBUGUA    KISII UNIVERSITY\r\n<br>4.      MBOYA KELVIN    MASINDE MULIRO UNIVERSITY\r\n\r\n\r\n\r\n<h4>BADMINTON MEN</h4>\r\n1.      MASENO UNIVERSITY\r\n<br>2.      MASINDE MULIRO UNIVERSITY\r\n<br>3.      KISII UNIVERSITY\r\n\r\n<h4>BADMINTON WOMEN</h4>\r\n1.      MASINDE MULIRO UNIVERSITY\r\n<br>2.      MASENO UNIVERSITY\r\n<br>3.      KIBABII UNIVERSITY\r\n<h4>TENNIS MEN</h4>\r\n1.      MASINDE MULIRO UNIVERSITY\r\n<br>2.      MASENO UNIVERSITY\r\n<br>3.      KISII UNIVERSITY\r\n</p>\"> \"> ', '10-12-2019', '10122019'),
(2, 'k1.jpg', 'kusa-university-results', 'Results for Western Universities Games held at Kibabii Univesity On 2nd to 3rd November 2019', '<h3>KUSA Western Confrence results</h3>\r\n<h4>Results for Western Universities Games held at Kibabii Univesity On 2nd to 3rd November 2019</h4>\r\n<p><h3>TAEKWONDO RESULTS</h3>\r\n\r\n<h4>TAEKWONDO WOMEN RESULT</h4>\r\n<h5>FIN WEIGHT LADIES – 46KG</h5>\r\n1.      Bilha Dorcas                                    KIBU                   <span class=\"badge\"> GOLD</span>\r\n<br>2.      Linda muremi                            KIBU                    <span class=\"badge\">SILVER</span>     \r\n<br>3.      Christine kiamuui                               MMUST           <span class=\"badge\">BRONZE</span>\r\n<h5>FLY WEIGHT LADIES – 49 KG</h5>\r\n  1.      Edna Sichangi                           KIBU                        <span class=\"badge\"> GOLD</span>\r\n<br>2.      Wilkistsar Akoth                                KISII                         <span class=\"badge\"> SILVER</span>\r\n<br>3.      Mildred Wafula                                  KIBU                         <span class=\"badge\">BRONZE</span>\r\n<br>4.      Mary Kadzo                              MMUST                  <span class=\"badge\"> BRONZE</span>\r\n<br><h5> BANTAM WEIGHT LADIES 52 KG</h5>\r\n  1.      Lauret Vuzili                                       KIBU                         <span class=\"badge\"> GOLD</span>\r\n<br>2.      Mariam Wangeci                                  KAFUCO                    <span class=\"badge\">SILVER</span>\r\n <h5>FEATHER WEIGHT LADIES.</h5>\r\n1.      Jane Muthino                                        MMUST              <span class=\"badge\"> GOLD</span>\r\n<br>2.      Teresia Nduta                                        KISII                      <span class=\"badge\">SILVER</span>\r\n<br>3.      Damaris Nambuga                                 KIBU            <span class=\"badge\">BRONZE></span>\r\n<br>4.      Elizabeth Wambua                                 KIBU           <span class=\"badge\">BRONZE</span>\r\n<br><h5>LIGHT WEIGHT WOMEN.</h5>\r\n1.      Christabel Sirengo                                    KIBU             <span class=\"badge\"> GOLD</span>\r\n<br>2.      Teresia Wamaitha                                    RONGO              <span class=\"badge\"> SILVER</span>\r\n<br>3.      Catherina Tata                                          KISII           <span class=\"badge\">BRONZE</span>\r\n<br>4.      Veronica Nyambura                                 RONGO         <span class=\"badge\">BRONZE</span>\r\n<br><h5>WELTER WEIGHT WOMEN.</h5>\r\n1.      Ebby Nato                                                 KIBU                          <span class=\"badge\"> GOLD</span>\r\n<br>2.      Valary Karita                                             MMUST                      <span class=\"badge\">SILVER</span>\r\n<br>3.      Maureen Waithera                                     MMUST                    <span class=\"badge\"> BRONZE</span>\r\n<h5>MID WEIGHT WOMEN.</h5>\r\n1.      Jully Musangi                                       KIBU                             <span class=\"badge\"> GOLD </span>  \r\n<br>2.      Zurah Nabukum                                   KIBU                              <span class=\"badge\">SILVER</span>\r\n<br>3.      Charity Mutuku                                    MMUST                        <span class=\"badge\">BRONZE</span>\r\n<h5> HEAVY WEIGHT LADIES.</h5>\r\n1.      Gueta Towit                                           KIBU                             <span class=\"badge\"> GOLD</span>\r\n<br>2.      Valerie Makokha                                   KIBU                             <span class=\"badge\"> SILVER</span>\r\n<br>3.      Gloria Nagweya                                     MMUST                        <span class=\"badge\">BRONZE</span>\r\n\r\n<br><h4>TAEKWONDO MEN RESULTS</h4>\r\n<h5>FIN WEIGHT MEN -54 KG  </h5> \r\n1.      Benjamin Kasii                         KIBU                         <span class=\"badge\">GOLD</span>\r\n<br>2.      Mvuko Duma Khamisi            RONGO                    <span class=\"badge\">SILVER</span>\r\n<br>3.      Mwalimu Kelvin                      RONGO                     <span class=\"badge\">BRONZE</span>\r\n<br>4.      Gabriel Mutiso                        KISII                           <span class=\"badge\">BRONZE</span>\r\n<h5>FLY WEIGHT MEN 58 KG</h5>\r\n1.      Roward Ali                               MMUST                   <span class=\"badge\">GOLD</span>\r\n<br>2.      Graven Yiminy                         KIBU                         <span class=\"badge\">SILVER</span>\r\n<br>3.      Joab Lepausanty                     KAFUCO                   <span class=\"badge\">BRONZE</span>\r\n<br>4.      Victor Sevot                             MMUST                   <span class=\"badge\">BRONZE</span>\r\n<h5>BANTAM WEIGHT MEN- 63 KG</h5>\r\n1.      Eric Ogal                                 KIBU                         <span class=\"badge\">GOLD</span>\r\n<br>2.      Steven Kilonzo                      MMUST                    <span class=\"badge\">SILVER</span>\r\n<br>3.      Moses Nafasi                        MMUST                    <span class=\"badge\">BRONZE</span>\r\n<br>4.      Muema Daniel Kyuli              KAFUCO                         <span class=\"badge\">BRONZE</span>\r\n\r\n<h5>FEATHER WEIGHT MEN.</h5>\r\n1.      Dennis Arwa                                           KIBU                             <span class=\"badge\"> GOLD</span>\r\n<br>2.      Washington Okeyo                               JOOUST                         <span class=\"badge\">SILVER</span>\r\n<br>3.      Lewis Khamoni                                      KISII                               <span class=\"badge\"> BRONZE</span>\r\n<br>4.      Leparsanty joab                                    KAFUCO                   <span class=\"badge\">Bronze</span>\r\n\r\n<h5>LIGHT WEIGHT MEN.</h5>\r\n1.      Meshack Oduyo                                         KIBU                              <span class=\"badge\">GOLD</span>\r\n<br>2.      Brian Ochieng                                           KIBU                              SILVER\r\n<br>3.      Meshack Ochieng                                     KISII                            <span class=\"badge\">  BRONZE</span>\r\n<br>4.      Dennis Odhiambo                                    KAFUCO                      <span class=\"badge\">  BRONZE</span>\r\n\r\n<h5>WELTER WEIGHT MEN.</h5>\r\n1.      Juma Ishamel                                              KIBU                            <span class=\"badge\"> GOLD</span>\r\n<br>2.      Emmanuel Otieno                                      MMUST                       <span class=\"badge\">SILVER </span>\r\n<br>3.      Wamalwa Dominic                                     MMUST                     <span class=\"badge\"> BRONZE</span>\r\n<br>4.      Kelvin Kibe                                                   KISII                            <span class=\"badge\"> BRONZE</span>\r\n\r\n\r\n<h5>MID WEIGHT MEN</h5>\r\n1.      Leonard Mukanda                             KIBU                         <span class=\"badge\">GOLD</span>\r\n<br>2.      Ofisi Baraza                                         MMUST                    <span class=\"badge\">SILVER</span>\r\n<br>3.      Kevin Mbugua                                    KISII                          <span class=\"badge\"> BRONZE</span>\r\n<br>4.      Meshack Masanga                             MASENO                 <span class=\"badge\"> BRONZE</span>\r\n\r\n<h5>HEAVY WEIGHT MEN.</h5>\r\n1.      Innocent Wafula                                   KIBU                             <span class=\"badge\">GOLD</span>\r\n<br>2.      Abdirizak Hamed                                  MMUST                        <span class=\"badge\">SILVER</span>\r\n\r\n\r\n<h4>KARATE</h4>\r\n<h5>KATA WOMEN</h5>\r\n1.      WAWERU BRENDA   MASINDE MULIRO UNIVERSITY\r\n<br>2.      SELINE ANYANGO  MASENO UNIVERSITY\r\n<br>3.      CHRISTINE AKINYI        MASENO UNIVERSITY\r\n<br>4.      LINDA WERE              MASENO UNIVERSITY\r\n<h4>KUMITE</h4>\r\n<h5>LADIES KUMITE 50KGS</h5>\r\n1.      WAWERU BRENDA   MASINDE MULIRO UNIVERSITY\r\n<br>2.      PHILOMENA NJERI         KIBABII UNIVERSITY\r\n<br>3.      VIVIAN JEPTUM   MASENO UNIVERSITY\r\n<br>4.      IRENE WAFULA    MASINDE MULIRO UNIVERSITY\r\n<h5>LADIES KUMITE UNDER 55KGS</h5>\r\n1.      CHRISTINE AKINYI        MASENO UNIVERSITY\r\n<br>2.      SARAH WAKHUNGU  MASINDE MULIRO UNIVERSITY\r\n<br>3.      MUTAKA SINAIDE  KIABABII UNIVERSITY\r\n<h5>LADIES KUMITE UNDER 61 KGS</h5>\r\n1.      MAURICE ANYANGO MASENO UNIVERSITY\r\n<br>2.      MONICA NJERI    MASENO UNIVERSITY\r\n<br>3.      WAWIRE SAFINA   KIBABII UNIVERSITY\r\n<br>4.      CATHERINE TATA  KISII UNIVERSITY\r\n\r\n\r\n\r\n<h5>LADIES KUMITE UNDER 67 KGS</h5>\r\n1.      LINDA WERE              MASENO UNIVERSITY\r\n<br>2.      MARY MWENDA             MASINDE MULIRO UNIVERSITY\r\n<br>3.      LYDIA OOKO ANYANGO      KIBABII UNIVERSITY\r\n<br>4.      ARATONI SARAH           KIBABII UNIVERSITY\r\n<h5>LADIES KUMITE OVER 67 KGS</h5>\r\n1.      EMMACULATE ADHIAMBO     MASENO UNIVERSITY\r\n<br>2.      SELINE ANYANGO          MASENO UNIVERSITY\r\n<br>3.      ELIZABENTH WANJIRU      KIBABII UNIVERSITY\r\n\r\n<h5>KATA MEN</h5>\r\n1.      KEVIN OGUTU     MASINDE MULIRO UNIVERSITY\r\n<br>2.      BONIFACE OPIYO  RONGO UNIVERSITY\r\n<br>3.      FRANCIS NJAU            MASINDE MULIRO UNIVERSITY\r\n<br>4.      JUSTUS OMONDI   MASINDE MULIRO UNIVERSITY\r\n\r\n<h4>KUMITE MEN</h4>\r\n<h5>MALE KUMITE UNDER 60 KGS</h5>\r\n1.      HENRY WAKHUNGU  KIBABII UNIVERSITY\r\n<br>2.      DENIS THUKU             MASENO UNIVERSITY\r\n<br>3.      ASHA ONDIGU             RONGO UNIVERSITY\r\n<br>4.      YABESH OGETO    MASENO UNIVERSITY\r\n<h5>MALE KUMITE UNDER 67KGS</h5>\r\n1.      KEVIN OGUTU     MASINDE MULIRO UNIVERSITY\r\n<br>2.      ISAAC JUMA      MASINDE MULIRO UNIVERSITY\r\n<br>3.      RAPHAEL MUSEVENI        MASENO UNIVERSITY\r\n<br>4.      ORWAKO EVANS    JARAMOGI OGINGA ODINGA UNIVERSITY\r\n\r\n<h5>MALE KUMITE UNDER 75 KGS</h5>\r\n1.      BINEAH WANJALA  MASINDE MULIRO UNIVERSITY\r\n<br>2.      FREDRICK ODHIAMBO       RONGO UNIVERSITY\r\n<br>3.      OBEDI BULUMA    KIBABII UNIVERSITY\r\n<br>4.      MERCEL ODHIAMBO MASENO UNIVERSITY\r\n\r\n\r\n<h5>MALE KUMITE UNDER 88 KGS</h5>\r\n1.      GILBERT SARUNI  MASINDE MULIRO UNIVERSITY\r\n<br>2.      NIMROD AYUGA    KISII UNIVERSITY\r\n<br>3.      BRIAN ODHIAMBO  RONGO UNIVERSITY\r\n<br>4.      EMMANUEL OKOTH  Rongo University\r\n\r\n<h5>MALE KUMITE OVER 84 KGS</h5>\r\n1.      OCHOLA PHILIS   RONGO UNIVERSITY\r\n<br>2.      KEVIN NALIANYA  KIBABII UNIVERSITY\r\n<br>3.      KEVIN MBUGUA    KISII UNIVERSITY\r\n<br>4.      MBOYA KELVIN    MASINDE MULIRO UNIVERSITY\r\n\r\n\r\n\r\n<h4>BADMINTON MEN</h4>\r\n1.      MASENO UNIVERSITY\r\n<br>2.      MASINDE MULIRO UNIVERSITY\r\n<br>3.      KISII UNIVERSITY\r\n\r\n<h4>BADMINTON WOMEN</h4>\r\n1.      MASINDE MULIRO UNIVERSITY\r\n<br>2.      MASENO UNIVERSITY\r\n<br>3.      KIBABII UNIVERSITY\r\n<h4>TENNIS MEN</h4>\r\n1.      MASINDE MULIRO UNIVERSITY\r\n<br>2.      MASENO UNIVERSITY\r\n<br>3.      KISII UNIVERSITY\r\n</p>', '11-12-2019', '11122019'),
(3, 'k1.jpg', 'kusa-university-results', 'Results for Western Universities Games held at Kibabii Univesity On 2nd to 3rd November 2019', '<h3>KUSA Western Confrence results</h3>\r\n<h4>Results for Western Universities Games held at Kibabii Univesity On 2nd to 3rd November 2019</h4>\r\n<p><h3>TAEKWONDO RESULTS</h3>\r\n\r\n<h4>TAEKWONDO WOMEN RESULT</h4>\r\n<h5>FIN WEIGHT LADIES – 46KG</h5>\r\n1.      Bilha Dorcas                                    KIBU                   <span class=\"badge\"> GOLD</span>\r\n<br>2.      Linda muremi                            KIBU                    <span class=\"badge\">SILVER</span>     \r\n<br>3.      Christine kiamuui                               MMUST           <span class=\"badge\">BRONZE</span>\r\n<h5>FLY WEIGHT LADIES – 49 KG</h5>\r\n  1.      Edna Sichangi                           KIBU                        <span class=\"badge\"> GOLD</span>\r\n<br>2.      Wilkistsar Akoth                                KISII                         <span class=\"badge\"> SILVER</span>\r\n<br>3.      Mildred Wafula                                  KIBU                         <span class=\"badge\">BRONZE</span>\r\n<br>4.      Mary Kadzo                              MMUST                  <span class=\"badge\"> BRONZE</span>\r\n<br><h5> BANTAM WEIGHT LADIES 52 KG</h5>\r\n  1.      Lauret Vuzili                                       KIBU                         <span class=\"badge\"> GOLD</span>\r\n<br>2.      Mariam Wangeci                                  KAFUCO                    <span class=\"badge\">SILVER</span>\r\n <h5>FEATHER WEIGHT LADIES.</h5>\r\n1.      Jane Muthino                                        MMUST              <span class=\"badge\"> GOLD</span>\r\n<br>2.      Teresia Nduta                                        KISII                      <span class=\"badge\">SILVER</span>\r\n<br>3.      Damaris Nambuga                                 KIBU            <span class=\"badge\">BRONZE></span>\r\n<br>4.      Elizabeth Wambua                                 KIBU           <span class=\"badge\">BRONZE</span>\r\n<br><h5>LIGHT WEIGHT WOMEN.</h5>\r\n1.      Christabel Sirengo                                    KIBU             <span class=\"badge\"> GOLD</span>\r\n<br>2.      Teresia Wamaitha                                    RONGO              <span class=\"badge\"> SILVER</span>\r\n<br>3.      Catherina Tata                                          KISII           <span class=\"badge\">BRONZE</span>\r\n<br>4.      Veronica Nyambura                                 RONGO         <span class=\"badge\">BRONZE</span>\r\n<br><h5>WELTER WEIGHT WOMEN.</h5>\r\n1.      Ebby Nato                                                 KIBU                          <span class=\"badge\"> GOLD</span>\r\n<br>2.      Valary Karita                                             MMUST                      <span class=\"badge\">SILVER</span>\r\n<br>3.      Maureen Waithera                                     MMUST                    <span class=\"badge\"> BRONZE</span>\r\n<h5>MID WEIGHT WOMEN.</h5>\r\n1.      Jully Musangi                                       KIBU                             <span class=\"badge\"> GOLD </span>  \r\n<br>2.      Zurah Nabukum                                   KIBU                              <span class=\"badge\">SILVER</span>\r\n<br>3.      Charity Mutuku                                    MMUST                        <span class=\"badge\">BRONZE</span>\r\n<h5> HEAVY WEIGHT LADIES.</h5>\r\n1.      Gueta Towit                                           KIBU                             <span class=\"badge\"> GOLD</span>\r\n<br>2.      Valerie Makokha                                   KIBU                             <span class=\"badge\"> SILVER</span>\r\n<br>3.      Gloria Nagweya                                     MMUST                        <span class=\"badge\">BRONZE</span>\r\n\r\n<br><h4>TAEKWONDO MEN RESULTS</h4>\r\n<h5>FIN WEIGHT MEN -54 KG  </h5> \r\n1.      Benjamin Kasii                         KIBU                         <span class=\"badge\">GOLD</span>\r\n<br>2.      Mvuko Duma Khamisi            RONGO                    <span class=\"badge\">SILVER</span>\r\n<br>3.      Mwalimu Kelvin                      RONGO                     <span class=\"badge\">BRONZE</span>\r\n<br>4.      Gabriel Mutiso                        KISII                           <span class=\"badge\">BRONZE</span>\r\n<h5>FLY WEIGHT MEN 58 KG</h5>\r\n1.      Roward Ali                               MMUST                   <span class=\"badge\">GOLD</span>\r\n<br>2.      Graven Yiminy                         KIBU                         <span class=\"badge\">SILVER</span>\r\n<br>3.      Joab Lepausanty                     KAFUCO                   <span class=\"badge\">BRONZE</span>\r\n<br>4.      Victor Sevot                             MMUST                   <span class=\"badge\">BRONZE</span>\r\n<h5>BANTAM WEIGHT MEN- 63 KG</h5>\r\n1.      Eric Ogal                                 KIBU                         <span class=\"badge\">GOLD</span>\r\n<br>2.      Steven Kilonzo                      MMUST                    <span class=\"badge\">SILVER</span>\r\n<br>3.      Moses Nafasi                        MMUST                    <span class=\"badge\">BRONZE</span>\r\n<br>4.      Muema Daniel Kyuli              KAFUCO                         <span class=\"badge\">BRONZE</span>\r\n\r\n<h5>FEATHER WEIGHT MEN.</h5>\r\n1.      Dennis Arwa                                           KIBU                             <span class=\"badge\"> GOLD</span>\r\n<br>2.      Washington Okeyo                               JOOUST                         <span class=\"badge\">SILVER</span>\r\n<br>3.      Lewis Khamoni                                      KISII                               <span class=\"badge\"> BRONZE</span>\r\n<br>4.      Leparsanty joab                                    KAFUCO                   <span class=\"badge\">Bronze</span>\r\n\r\n<h5>LIGHT WEIGHT MEN.</h5>\r\n1.      Meshack Oduyo                                         KIBU                              <span class=\"badge\">GOLD</span>\r\n<br>2.      Brian Ochieng                                           KIBU                              SILVER\r\n<br>3.      Meshack Ochieng                                     KISII                            <span class=\"badge\">  BRONZE</span>\r\n<br>4.      Dennis Odhiambo                                    KAFUCO                      <span class=\"badge\">  BRONZE</span>\r\n\r\n<h5>WELTER WEIGHT MEN.</h5>\r\n1.      Juma Ishamel                                              KIBU                            <span class=\"badge\"> GOLD</span>\r\n<br>2.      Emmanuel Otieno                                      MMUST                       <span class=\"badge\">SILVER </span>\r\n<br>3.      Wamalwa Dominic                                     MMUST                     <span class=\"badge\"> BRONZE</span>\r\n<br>4.      Kelvin Kibe                                                   KISII                            <span class=\"badge\"> BRONZE</span>\r\n\r\n\r\n<h5>MID WEIGHT MEN</h5>\r\n1.      Leonard Mukanda                             KIBU                         <span class=\"badge\">GOLD</span>\r\n<br>2.      Ofisi Baraza                                         MMUST                    <span class=\"badge\">SILVER</span>\r\n<br>3.      Kevin Mbugua                                    KISII                          <span class=\"badge\"> BRONZE</span>\r\n<br>4.      Meshack Masanga                             MASENO                 <span class=\"badge\"> BRONZE</span>\r\n\r\n<h5>HEAVY WEIGHT MEN.</h5>\r\n1.      Innocent Wafula                                   KIBU                             <span class=\"badge\">GOLD</span>\r\n<br>2.      Abdirizak Hamed                                  MMUST                        <span class=\"badge\">SILVER</span>\r\n\r\n\r\n<h4>KARATE</h4>\r\n<h5>KATA WOMEN</h5>\r\n1.      WAWERU BRENDA   MASINDE MULIRO UNIVERSITY\r\n<br>2.      SELINE ANYANGO  MASENO UNIVERSITY\r\n<br>3.      CHRISTINE AKINYI        MASENO UNIVERSITY\r\n<br>4.      LINDA WERE              MASENO UNIVERSITY\r\n<h4>KUMITE</h4>\r\n<h5>LADIES KUMITE 50KGS</h5>\r\n1.      WAWERU BRENDA   MASINDE MULIRO UNIVERSITY\r\n<br>2.      PHILOMENA NJERI         KIBABII UNIVERSITY\r\n<br>3.      VIVIAN JEPTUM   MASENO UNIVERSITY\r\n<br>4.      IRENE WAFULA    MASINDE MULIRO UNIVERSITY\r\n<h5>LADIES KUMITE UNDER 55KGS</h5>\r\n1.      CHRISTINE AKINYI        MASENO UNIVERSITY\r\n<br>2.      SARAH WAKHUNGU  MASINDE MULIRO UNIVERSITY\r\n<br>3.      MUTAKA SINAIDE  KIABABII UNIVERSITY\r\n<h5>LADIES KUMITE UNDER 61 KGS</h5>\r\n1.      MAURICE ANYANGO MASENO UNIVERSITY\r\n<br>2.      MONICA NJERI    MASENO UNIVERSITY\r\n<br>3.      WAWIRE SAFINA   KIBABII UNIVERSITY\r\n<br>4.      CATHERINE TATA  KISII UNIVERSITY\r\n\r\n\r\n\r\n<h5>LADIES KUMITE UNDER 67 KGS</h5>\r\n1.      LINDA WERE              MASENO UNIVERSITY\r\n<br>2.      MARY MWENDA             MASINDE MULIRO UNIVERSITY\r\n<br>3.      LYDIA OOKO ANYANGO      KIBABII UNIVERSITY\r\n<br>4.      ARATONI SARAH           KIBABII UNIVERSITY\r\n<h5>LADIES KUMITE OVER 67 KGS</h5>\r\n1.      EMMACULATE ADHIAMBO     MASENO UNIVERSITY\r\n<br>2.      SELINE ANYANGO          MASENO UNIVERSITY\r\n<br>3.      ELIZABENTH WANJIRU      KIBABII UNIVERSITY\r\n\r\n<h5>KATA MEN</h5>\r\n1.      KEVIN OGUTU     MASINDE MULIRO UNIVERSITY\r\n<br>2.      BONIFACE OPIYO  RONGO UNIVERSITY\r\n<br>3.      FRANCIS NJAU            MASINDE MULIRO UNIVERSITY\r\n<br>4.      JUSTUS OMONDI   MASINDE MULIRO UNIVERSITY\r\n\r\n<h4>KUMITE MEN</h4>\r\n<h5>MALE KUMITE UNDER 60 KGS</h5>\r\n1.      HENRY WAKHUNGU  KIBABII UNIVERSITY\r\n<br>2.      DENIS THUKU             MASENO UNIVERSITY\r\n<br>3.      ASHA ONDIGU             RONGO UNIVERSITY\r\n<br>4.      YABESH OGETO    MASENO UNIVERSITY\r\n<h5>MALE KUMITE UNDER 67KGS</h5>\r\n1.      KEVIN OGUTU     MASINDE MULIRO UNIVERSITY\r\n<br>2.      ISAAC JUMA      MASINDE MULIRO UNIVERSITY\r\n<br>3.      RAPHAEL MUSEVENI        MASENO UNIVERSITY\r\n<br>4.      ORWAKO EVANS    JARAMOGI OGINGA ODINGA UNIVERSITY\r\n\r\n<h5>MALE KUMITE UNDER 75 KGS</h5>\r\n1.      BINEAH WANJALA  MASINDE MULIRO UNIVERSITY\r\n<br>2.      FREDRICK ODHIAMBO       RONGO UNIVERSITY\r\n<br>3.      OBEDI BULUMA    KIBABII UNIVERSITY\r\n<br>4.      MERCEL ODHIAMBO MASENO UNIVERSITY\r\n\r\n\r\n<h5>MALE KUMITE UNDER 88 KGS</h5>\r\n1.      GILBERT SARUNI  MASINDE MULIRO UNIVERSITY\r\n<br>2.      NIMROD AYUGA    KISII UNIVERSITY\r\n<br>3.      BRIAN ODHIAMBO  RONGO UNIVERSITY\r\n<br>4.      EMMANUEL OKOTH  Rongo University\r\n\r\n<h5>MALE KUMITE OVER 84 KGS</h5>\r\n1.      OCHOLA PHILIS   RONGO UNIVERSITY\r\n<br>2.      KEVIN NALIANYA  KIBABII UNIVERSITY\r\n<br>3.      KEVIN MBUGUA    KISII UNIVERSITY\r\n<br>4.      MBOYA KELVIN    MASINDE MULIRO UNIVERSITY\r\n\r\n\r\n\r\n<h4>BADMINTON MEN</h4>\r\n1.      MASENO UNIVERSITY\r\n<br>2.      MASINDE MULIRO UNIVERSITY\r\n<br>3.      KISII UNIVERSITY\r\n\r\n<h4>BADMINTON WOMEN</h4>\r\n1.      MASINDE MULIRO UNIVERSITY\r\n<br>2.      MASENO UNIVERSITY\r\n<br>3.      KIBABII UNIVERSITY\r\n<h4>TENNIS MEN</h4>\r\n1.      MASINDE MULIRO UNIVERSITY\r\n<br>2.      MASENO UNIVERSITY\r\n<br>3.      KISII UNIVERSITY\r\n</p>', '12-12-2019', '12122019'),
(4, 'k1.jpg', 'kusa-university-results', 'Results for Western Universities Games held at Kibabii Univesity On 2nd to 3rd November 2019', '<h3>KUSA Western Confrence results</h3>\r\n<h4>Results for Western Universities Games held at Kibabii Univesity On 2nd to 3rd November 2019</h4>\r\n<p><h3>TAEKWONDO RESULTS</h3>\r\n\r\n<h4>TAEKWONDO WOMEN RESULT</h4>\r\n<h5>FIN WEIGHT LADIES – 46KG</h5>\r\n1.      Bilha Dorcas                                    KIBU                   <span class=\"badge\"> GOLD</span>\r\n<br>2.      Linda muremi                            KIBU                    <span class=\"badge\">SILVER</span>     \r\n<br>3.      Christine kiamuui                               MMUST           <span class=\"badge\">BRONZE</span>\r\n<h5>FLY WEIGHT LADIES – 49 KG</h5>\r\n  1.      Edna Sichangi                           KIBU                        <span class=\"badge\"> GOLD</span>\r\n<br>2.      Wilkistsar Akoth                                KISII                         <span class=\"badge\"> SILVER</span>\r\n<br>3.      Mildred Wafula                                  KIBU                         <span class=\"badge\">BRONZE</span>\r\n<br>4.      Mary Kadzo                              MMUST                  <span class=\"badge\"> BRONZE</span>\r\n<br><h5> BANTAM WEIGHT LADIES 52 KG</h5>\r\n  1.      Lauret Vuzili                                       KIBU                         <span class=\"badge\"> GOLD</span>\r\n<br>2.      Mariam Wangeci                                  KAFUCO                    <span class=\"badge\">SILVER</span>\r\n <h5>FEATHER WEIGHT LADIES.</h5>\r\n1.      Jane Muthino                                        MMUST              <span class=\"badge\"> GOLD</span>\r\n<br>2.      Teresia Nduta                                        KISII                      <span class=\"badge\">SILVER</span>\r\n<br>3.      Damaris Nambuga                                 KIBU            <span class=\"badge\">BRONZE></span>\r\n<br>4.      Elizabeth Wambua                                 KIBU           <span class=\"badge\">BRONZE</span>\r\n<br><h5>LIGHT WEIGHT WOMEN.</h5>\r\n1.      Christabel Sirengo                                    KIBU             <span class=\"badge\"> GOLD</span>\r\n<br>2.      Teresia Wamaitha                                    RONGO              <span class=\"badge\"> SILVER</span>\r\n<br>3.      Catherina Tata                                          KISII           <span class=\"badge\">BRONZE</span>\r\n<br>4.      Veronica Nyambura                                 RONGO         <span class=\"badge\">BRONZE</span>\r\n<br><h5>WELTER WEIGHT WOMEN.</h5>\r\n1.      Ebby Nato                                                 KIBU                          <span class=\"badge\"> GOLD</span>\r\n<br>2.      Valary Karita                                             MMUST                      <span class=\"badge\">SILVER</span>\r\n<br>3.      Maureen Waithera                                     MMUST                    <span class=\"badge\"> BRONZE</span>\r\n<h5>MID WEIGHT WOMEN.</h5>\r\n1.      Jully Musangi                                       KIBU                             <span class=\"badge\"> GOLD </span>  \r\n<br>2.      Zurah Nabukum                                   KIBU                              <span class=\"badge\">SILVER</span>\r\n<br>3.      Charity Mutuku                                    MMUST                        <span class=\"badge\">BRONZE</span>\r\n<h5> HEAVY WEIGHT LADIES.</h5>\r\n1.      Gueta Towit                                           KIBU                             <span class=\"badge\"> GOLD</span>\r\n<br>2.      Valerie Makokha                                   KIBU                             <span class=\"badge\"> SILVER</span>\r\n<br>3.      Gloria Nagweya                                     MMUST                        <span class=\"badge\">BRONZE</span>\r\n\r\n<br><h4>TAEKWONDO MEN RESULTS</h4>\r\n<h5>FIN WEIGHT MEN -54 KG  </h5> \r\n1.      Benjamin Kasii                         KIBU                         <span class=\"badge\">GOLD</span>\r\n<br>2.      Mvuko Duma Khamisi            RONGO                    <span class=\"badge\">SILVER</span>\r\n<br>3.      Mwalimu Kelvin                      RONGO                     <span class=\"badge\">BRONZE</span>\r\n<br>4.      Gabriel Mutiso                        KISII                           <span class=\"badge\">BRONZE</span>\r\n<h5>FLY WEIGHT MEN 58 KG</h5>\r\n1.      Roward Ali                               MMUST                   <span class=\"badge\">GOLD</span>\r\n<br>2.      Graven Yiminy                         KIBU                         <span class=\"badge\">SILVER</span>\r\n<br>3.      Joab Lepausanty                     KAFUCO                   <span class=\"badge\">BRONZE</span>\r\n<br>4.      Victor Sevot                             MMUST                   <span class=\"badge\">BRONZE</span>\r\n<h5>BANTAM WEIGHT MEN- 63 KG</h5>\r\n1.      Eric Ogal                                 KIBU                         <span class=\"badge\">GOLD</span>\r\n<br>2.      Steven Kilonzo                      MMUST                    <span class=\"badge\">SILVER</span>\r\n<br>3.      Moses Nafasi                        MMUST                    <span class=\"badge\">BRONZE</span>\r\n<br>4.      Muema Daniel Kyuli              KAFUCO                         <span class=\"badge\">BRONZE</span>\r\n\r\n<h5>FEATHER WEIGHT MEN.</h5>\r\n1.      Dennis Arwa                                           KIBU                             <span class=\"badge\"> GOLD</span>\r\n<br>2.      Washington Okeyo                               JOOUST                         <span class=\"badge\">SILVER</span>\r\n<br>3.      Lewis Khamoni                                      KISII                               <span class=\"badge\"> BRONZE</span>\r\n<br>4.      Leparsanty joab                                    KAFUCO                   <span class=\"badge\">Bronze</span>\r\n\r\n<h5>LIGHT WEIGHT MEN.</h5>\r\n1.      Meshack Oduyo                                         KIBU                              <span class=\"badge\">GOLD</span>\r\n<br>2.      Brian Ochieng                                           KIBU                              SILVER\r\n<br>3.      Meshack Ochieng                                     KISII                            <span class=\"badge\">  BRONZE</span>\r\n<br>4.      Dennis Odhiambo                                    KAFUCO                      <span class=\"badge\">  BRONZE</span>\r\n\r\n<h5>WELTER WEIGHT MEN.</h5>\r\n1.      Juma Ishamel                                              KIBU                            <span class=\"badge\"> GOLD</span>\r\n<br>2.      Emmanuel Otieno                                      MMUST                       <span class=\"badge\">SILVER </span>\r\n<br>3.      Wamalwa Dominic                                     MMUST                     <span class=\"badge\"> BRONZE</span>\r\n<br>4.      Kelvin Kibe                                                   KISII                            <span class=\"badge\"> BRONZE</span>\r\n\r\n\r\n<h5>MID WEIGHT MEN</h5>\r\n1.      Leonard Mukanda                             KIBU                         <span class=\"badge\">GOLD</span>\r\n<br>2.      Ofisi Baraza                                         MMUST                    <span class=\"badge\">SILVER</span>\r\n<br>3.      Kevin Mbugua                                    KISII                          <span class=\"badge\"> BRONZE</span>\r\n<br>4.      Meshack Masanga                             MASENO                 <span class=\"badge\"> BRONZE</span>\r\n\r\n<h5>HEAVY WEIGHT MEN.</h5>\r\n1.      Innocent Wafula                                   KIBU                             <span class=\"badge\">GOLD</span>\r\n<br>2.      Abdirizak Hamed                                  MMUST                        <span class=\"badge\">SILVER</span>\r\n\r\n\r\n<h4>KARATE</h4>\r\n<h5>KATA WOMEN</h5>\r\n1.      WAWERU BRENDA   MASINDE MULIRO UNIVERSITY\r\n<br>2.      SELINE ANYANGO  MASENO UNIVERSITY\r\n<br>3.      CHRISTINE AKINYI        MASENO UNIVERSITY\r\n<br>4.      LINDA WERE              MASENO UNIVERSITY\r\n<h4>KUMITE</h4>\r\n<h5>LADIES KUMITE 50KGS</h5>\r\n1.      WAWERU BRENDA   MASINDE MULIRO UNIVERSITY\r\n<br>2.      PHILOMENA NJERI         KIBABII UNIVERSITY\r\n<br>3.      VIVIAN JEPTUM   MASENO UNIVERSITY\r\n<br>4.      IRENE WAFULA    MASINDE MULIRO UNIVERSITY\r\n<h5>LADIES KUMITE UNDER 55KGS</h5>\r\n1.      CHRISTINE AKINYI        MASENO UNIVERSITY\r\n<br>2.      SARAH WAKHUNGU  MASINDE MULIRO UNIVERSITY\r\n<br>3.      MUTAKA SINAIDE  KIABABII UNIVERSITY\r\n<h5>LADIES KUMITE UNDER 61 KGS</h5>\r\n1.      MAURICE ANYANGO MASENO UNIVERSITY\r\n<br>2.      MONICA NJERI    MASENO UNIVERSITY\r\n<br>3.      WAWIRE SAFINA   KIBABII UNIVERSITY\r\n<br>4.      CATHERINE TATA  KISII UNIVERSITY\r\n\r\n\r\n\r\n<h5>LADIES KUMITE UNDER 67 KGS</h5>\r\n1.      LINDA WERE              MASENO UNIVERSITY\r\n<br>2.      MARY MWENDA             MASINDE MULIRO UNIVERSITY\r\n<br>3.      LYDIA OOKO ANYANGO      KIBABII UNIVERSITY\r\n<br>4.      ARATONI SARAH           KIBABII UNIVERSITY\r\n<h5>LADIES KUMITE OVER 67 KGS</h5>\r\n1.      EMMACULATE ADHIAMBO     MASENO UNIVERSITY\r\n<br>2.      SELINE ANYANGO          MASENO UNIVERSITY\r\n<br>3.      ELIZABENTH WANJIRU      KIBABII UNIVERSITY\r\n\r\n<h5>KATA MEN</h5>\r\n1.      KEVIN OGUTU     MASINDE MULIRO UNIVERSITY\r\n<br>2.      BONIFACE OPIYO  RONGO UNIVERSITY\r\n<br>3.      FRANCIS NJAU            MASINDE MULIRO UNIVERSITY\r\n<br>4.      JUSTUS OMONDI   MASINDE MULIRO UNIVERSITY\r\n\r\n<h4>KUMITE MEN</h4>\r\n<h5>MALE KUMITE UNDER 60 KGS</h5>\r\n1.      HENRY WAKHUNGU  KIBABII UNIVERSITY\r\n<br>2.      DENIS THUKU             MASENO UNIVERSITY\r\n<br>3.      ASHA ONDIGU             RONGO UNIVERSITY\r\n<br>4.      YABESH OGETO    MASENO UNIVERSITY\r\n<h5>MALE KUMITE UNDER 67KGS</h5>\r\n1.      KEVIN OGUTU     MASINDE MULIRO UNIVERSITY\r\n<br>2.      ISAAC JUMA      MASINDE MULIRO UNIVERSITY\r\n<br>3.      RAPHAEL MUSEVENI        MASENO UNIVERSITY\r\n<br>4.      ORWAKO EVANS    JARAMOGI OGINGA ODINGA UNIVERSITY\r\n\r\n<h5>MALE KUMITE UNDER 75 KGS</h5>\r\n1.      BINEAH WANJALA  MASINDE MULIRO UNIVERSITY\r\n<br>2.      FREDRICK ODHIAMBO       RONGO UNIVERSITY\r\n<br>3.      OBEDI BULUMA    KIBABII UNIVERSITY\r\n<br>4.      MERCEL ODHIAMBO MASENO UNIVERSITY\r\n\r\n\r\n<h5>MALE KUMITE UNDER 88 KGS</h5>\r\n1.      GILBERT SARUNI  MASINDE MULIRO UNIVERSITY\r\n<br>2.      NIMROD AYUGA    KISII UNIVERSITY\r\n<br>3.      BRIAN ODHIAMBO  RONGO UNIVERSITY\r\n<br>4.      EMMANUEL OKOTH  Rongo University\r\n\r\n<h5>MALE KUMITE OVER 84 KGS</h5>\r\n1.      OCHOLA PHILIS   RONGO UNIVERSITY\r\n<br>2.      KEVIN NALIANYA  KIBABII UNIVERSITY\r\n<br>3.      KEVIN MBUGUA    KISII UNIVERSITY\r\n<br>4.      MBOYA KELVIN    MASINDE MULIRO UNIVERSITY\r\n\r\n\r\n\r\n<h4>BADMINTON MEN</h4>\r\n1.      MASENO UNIVERSITY\r\n<br>2.      MASINDE MULIRO UNIVERSITY\r\n<br>3.      KISII UNIVERSITY\r\n\r\n<h4>BADMINTON WOMEN</h4>\r\n1.      MASINDE MULIRO UNIVERSITY\r\n<br>2.      MASENO UNIVERSITY\r\n<br>3.      KIBABII UNIVERSITY\r\n<h4>TENNIS MEN</h4>\r\n1.      MASINDE MULIRO UNIVERSITY\r\n<br>2.      MASENO UNIVERSITY\r\n<br>3.      KISII UNIVERSITY\r\n</p>', '13-12-2019', '13122019');
INSERT INTO `news_in` (`id`, `image`, `news_link`, `title`, `description`, `time_in`, `time_stamp`) VALUES
(5, 'k1.jpg', 'kusa-university-results', 'Results for Western Universities Games held at Kibabii Univesity On 2nd to 3rd November 2019', '<h3>KUSA Western Confrence results</h3>\r\n<h4>Results for Western Universities Games held at Kibabii Univesity On 2nd to 3rd November 2019</h4>\r\n<p><h3>TAEKWONDO RESULTS</h3>\r\n\r\n<h4>TAEKWONDO WOMEN RESULT</h4>\r\n<h5>FIN WEIGHT LADIES – 46KG</h5>\r\n1.      Bilha Dorcas                                    KIBU                   <span class=\"badge\"> GOLD</span>\r\n<br>2.      Linda muremi                            KIBU                    <span class=\"badge\">SILVER</span>     \r\n<br>3.      Christine kiamuui                               MMUST           <span class=\"badge\">BRONZE</span>\r\n<h5>FLY WEIGHT LADIES – 49 KG</h5>\r\n  1.      Edna Sichangi                           KIBU                        <span class=\"badge\"> GOLD</span>\r\n<br>2.      Wilkistsar Akoth                                KISII                         <span class=\"badge\"> SILVER</span>\r\n<br>3.      Mildred Wafula                                  KIBU                         <span class=\"badge\">BRONZE</span>\r\n<br>4.      Mary Kadzo                              MMUST                  <span class=\"badge\"> BRONZE</span>\r\n<br><h5> BANTAM WEIGHT LADIES 52 KG</h5>\r\n  1.      Lauret Vuzili                                       KIBU                         <span class=\"badge\"> GOLD</span>\r\n<br>2.      Mariam Wangeci                                  KAFUCO                    <span class=\"badge\">SILVER</span>\r\n <h5>FEATHER WEIGHT LADIES.</h5>\r\n1.      Jane Muthino                                        MMUST              <span class=\"badge\"> GOLD</span>\r\n<br>2.      Teresia Nduta                                        KISII                      <span class=\"badge\">SILVER</span>\r\n<br>3.      Damaris Nambuga                                 KIBU            <span class=\"badge\">BRONZE></span>\r\n<br>4.      Elizabeth Wambua                                 KIBU           <span class=\"badge\">BRONZE</span>\r\n<br><h5>LIGHT WEIGHT WOMEN.</h5>\r\n1.      Christabel Sirengo                                    KIBU             <span class=\"badge\"> GOLD</span>\r\n<br>2.      Teresia Wamaitha                                    RONGO              <span class=\"badge\"> SILVER</span>\r\n<br>3.      Catherina Tata                                          KISII           <span class=\"badge\">BRONZE</span>\r\n<br>4.      Veronica Nyambura                                 RONGO         <span class=\"badge\">BRONZE</span>\r\n<br><h5>WELTER WEIGHT WOMEN.</h5>\r\n1.      Ebby Nato                                                 KIBU                          <span class=\"badge\"> GOLD</span>\r\n<br>2.      Valary Karita                                             MMUST                      <span class=\"badge\">SILVER</span>\r\n<br>3.      Maureen Waithera                                     MMUST                    <span class=\"badge\"> BRONZE</span>\r\n<h5>MID WEIGHT WOMEN.</h5>\r\n1.      Jully Musangi                                       KIBU                             <span class=\"badge\"> GOLD </span>  \r\n<br>2.      Zurah Nabukum                                   KIBU                              <span class=\"badge\">SILVER</span>\r\n<br>3.      Charity Mutuku                                    MMUST                        <span class=\"badge\">BRONZE</span>\r\n<h5> HEAVY WEIGHT LADIES.</h5>\r\n1.      Gueta Towit                                           KIBU                             <span class=\"badge\"> GOLD</span>\r\n<br>2.      Valerie Makokha                                   KIBU                             <span class=\"badge\"> SILVER</span>\r\n<br>3.      Gloria Nagweya                                     MMUST                        <span class=\"badge\">BRONZE</span>\r\n\r\n<br><h4>TAEKWONDO MEN RESULTS</h4>\r\n<h5>FIN WEIGHT MEN -54 KG  </h5> \r\n1.      Benjamin Kasii                         KIBU                         <span class=\"badge\">GOLD</span>\r\n<br>2.      Mvuko Duma Khamisi            RONGO                    <span class=\"badge\">SILVER</span>\r\n<br>3.      Mwalimu Kelvin                      RONGO                     <span class=\"badge\">BRONZE</span>\r\n<br>4.      Gabriel Mutiso                        KISII                           <span class=\"badge\">BRONZE</span>\r\n<h5>FLY WEIGHT MEN 58 KG</h5>\r\n1.      Roward Ali                               MMUST                   <span class=\"badge\">GOLD</span>\r\n<br>2.      Graven Yiminy                         KIBU                         <span class=\"badge\">SILVER</span>\r\n<br>3.      Joab Lepausanty                     KAFUCO                   <span class=\"badge\">BRONZE</span>\r\n<br>4.      Victor Sevot                             MMUST                   <span class=\"badge\">BRONZE</span>\r\n<h5>BANTAM WEIGHT MEN- 63 KG</h5>\r\n1.      Eric Ogal                                 KIBU                         <span class=\"badge\">GOLD</span>\r\n<br>2.      Steven Kilonzo                      MMUST                    <span class=\"badge\">SILVER</span>\r\n<br>3.      Moses Nafasi                        MMUST                    <span class=\"badge\">BRONZE</span>\r\n<br>4.      Muema Daniel Kyuli              KAFUCO                         <span class=\"badge\">BRONZE</span>\r\n\r\n<h5>FEATHER WEIGHT MEN.</h5>\r\n1.      Dennis Arwa                                           KIBU                             <span class=\"badge\"> GOLD</span>\r\n<br>2.      Washington Okeyo                               JOOUST                         <span class=\"badge\">SILVER</span>\r\n<br>3.      Lewis Khamoni                                      KISII                               <span class=\"badge\"> BRONZE</span>\r\n<br>4.      Leparsanty joab                                    KAFUCO                   <span class=\"badge\">Bronze</span>\r\n\r\n<h5>LIGHT WEIGHT MEN.</h5>\r\n1.      Meshack Oduyo                                         KIBU                              <span class=\"badge\">GOLD</span>\r\n<br>2.      Brian Ochieng                                           KIBU                              SILVER\r\n<br>3.      Meshack Ochieng                                     KISII                            <span class=\"badge\">  BRONZE</span>\r\n<br>4.      Dennis Odhiambo                                    KAFUCO                      <span class=\"badge\">  BRONZE</span>\r\n\r\n<h5>WELTER WEIGHT MEN.</h5>\r\n1.      Juma Ishamel                                              KIBU                            <span class=\"badge\"> GOLD</span>\r\n<br>2.      Emmanuel Otieno                                      MMUST                       <span class=\"badge\">SILVER </span>\r\n<br>3.      Wamalwa Dominic                                     MMUST                     <span class=\"badge\"> BRONZE</span>\r\n<br>4.      Kelvin Kibe                                                   KISII                            <span class=\"badge\"> BRONZE</span>\r\n\r\n\r\n<h5>MID WEIGHT MEN</h5>\r\n1.      Leonard Mukanda                             KIBU                         <span class=\"badge\">GOLD</span>\r\n<br>2.      Ofisi Baraza                                         MMUST                    <span class=\"badge\">SILVER</span>\r\n<br>3.      Kevin Mbugua                                    KISII                          <span class=\"badge\"> BRONZE</span>\r\n<br>4.      Meshack Masanga                             MASENO                 <span class=\"badge\"> BRONZE</span>\r\n\r\n<h5>HEAVY WEIGHT MEN.</h5>\r\n1.      Innocent Wafula                                   KIBU                             <span class=\"badge\">GOLD</span>\r\n<br>2.      Abdirizak Hamed                                  MMUST                        <span class=\"badge\">SILVER</span>\r\n\r\n\r\n<h4>KARATE</h4>\r\n<h5>KATA WOMEN</h5>\r\n1.      WAWERU BRENDA   MASINDE MULIRO UNIVERSITY\r\n<br>2.      SELINE ANYANGO  MASENO UNIVERSITY\r\n<br>3.      CHRISTINE AKINYI        MASENO UNIVERSITY\r\n<br>4.      LINDA WERE              MASENO UNIVERSITY\r\n<h4>KUMITE</h4>\r\n<h5>LADIES KUMITE 50KGS</h5>\r\n1.      WAWERU BRENDA   MASINDE MULIRO UNIVERSITY\r\n<br>2.      PHILOMENA NJERI         KIBABII UNIVERSITY\r\n<br>3.      VIVIAN JEPTUM   MASENO UNIVERSITY\r\n<br>4.      IRENE WAFULA    MASINDE MULIRO UNIVERSITY\r\n<h5>LADIES KUMITE UNDER 55KGS</h5>\r\n1.      CHRISTINE AKINYI        MASENO UNIVERSITY\r\n<br>2.      SARAH WAKHUNGU  MASINDE MULIRO UNIVERSITY\r\n<br>3.      MUTAKA SINAIDE  KIABABII UNIVERSITY\r\n<h5>LADIES KUMITE UNDER 61 KGS</h5>\r\n1.      MAURICE ANYANGO MASENO UNIVERSITY\r\n<br>2.      MONICA NJERI    MASENO UNIVERSITY\r\n<br>3.      WAWIRE SAFINA   KIBABII UNIVERSITY\r\n<br>4.      CATHERINE TATA  KISII UNIVERSITY\r\n\r\n\r\n\r\n<h5>LADIES KUMITE UNDER 67 KGS</h5>\r\n1.      LINDA WERE              MASENO UNIVERSITY\r\n<br>2.      MARY MWENDA             MASINDE MULIRO UNIVERSITY\r\n<br>3.      LYDIA OOKO ANYANGO      KIBABII UNIVERSITY\r\n<br>4.      ARATONI SARAH           KIBABII UNIVERSITY\r\n<h5>LADIES KUMITE OVER 67 KGS</h5>\r\n1.      EMMACULATE ADHIAMBO     MASENO UNIVERSITY\r\n<br>2.      SELINE ANYANGO          MASENO UNIVERSITY\r\n<br>3.      ELIZABENTH WANJIRU      KIBABII UNIVERSITY\r\n\r\n<h5>KATA MEN</h5>\r\n1.      KEVIN OGUTU     MASINDE MULIRO UNIVERSITY\r\n<br>2.      BONIFACE OPIYO  RONGO UNIVERSITY\r\n<br>3.      FRANCIS NJAU            MASINDE MULIRO UNIVERSITY\r\n<br>4.      JUSTUS OMONDI   MASINDE MULIRO UNIVERSITY\r\n\r\n<h4>KUMITE MEN</h4>\r\n<h5>MALE KUMITE UNDER 60 KGS</h5>\r\n1.      HENRY WAKHUNGU  KIBABII UNIVERSITY\r\n<br>2.      DENIS THUKU             MASENO UNIVERSITY\r\n<br>3.      ASHA ONDIGU             RONGO UNIVERSITY\r\n<br>4.      YABESH OGETO    MASENO UNIVERSITY\r\n<h5>MALE KUMITE UNDER 67KGS</h5>\r\n1.      KEVIN OGUTU     MASINDE MULIRO UNIVERSITY\r\n<br>2.      ISAAC JUMA      MASINDE MULIRO UNIVERSITY\r\n<br>3.      RAPHAEL MUSEVENI        MASENO UNIVERSITY\r\n<br>4.      ORWAKO EVANS    JARAMOGI OGINGA ODINGA UNIVERSITY\r\n\r\n<h5>MALE KUMITE UNDER 75 KGS</h5>\r\n1.      BINEAH WANJALA  MASINDE MULIRO UNIVERSITY\r\n<br>2.      FREDRICK ODHIAMBO       RONGO UNIVERSITY\r\n<br>3.      OBEDI BULUMA    KIBABII UNIVERSITY\r\n<br>4.      MERCEL ODHIAMBO MASENO UNIVERSITY\r\n\r\n\r\n<h5>MALE KUMITE UNDER 88 KGS</h5>\r\n1.      GILBERT SARUNI  MASINDE MULIRO UNIVERSITY\r\n<br>2.      NIMROD AYUGA    KISII UNIVERSITY\r\n<br>3.      BRIAN ODHIAMBO  RONGO UNIVERSITY\r\n<br>4.      EMMANUEL OKOTH  Rongo University\r\n\r\n<h5>MALE KUMITE OVER 84 KGS</h5>\r\n1.      OCHOLA PHILIS   RONGO UNIVERSITY\r\n<br>2.      KEVIN NALIANYA  KIBABII UNIVERSITY\r\n<br>3.      KEVIN MBUGUA    KISII UNIVERSITY\r\n<br>4.      MBOYA KELVIN    MASINDE MULIRO UNIVERSITY\r\n\r\n\r\n\r\n<h4>BADMINTON MEN</h4>\r\n1.      MASENO UNIVERSITY\r\n<br>2.      MASINDE MULIRO UNIVERSITY\r\n<br>3.      KISII UNIVERSITY\r\n\r\n<h4>BADMINTON WOMEN</h4>\r\n1.      MASINDE MULIRO UNIVERSITY\r\n<br>2.      MASENO UNIVERSITY\r\n<br>3.      KIBABII UNIVERSITY\r\n<h4>TENNIS MEN</h4>\r\n1.      MASINDE MULIRO UNIVERSITY\r\n<br>2.      MASENO UNIVERSITY\r\n<br>3.      KISII UNIVERSITY\r\n</p>', '14-12-2019', '14122019'),
(8, '162201137_4059797357366269_7514638768067847391_n.jpg', 'Coach-Jack-Oyugi-Voted-Board-Member-of-the-Federation-for-Eastern-Africa-University-Sports', 'Coach Jack Oyugi Voted as Board Member of the Federation for Eastern Africa University Sports', 'Kibabii University based Coach, Jack Otieno Oyugi was voted as Board Member of the Federation for Eastern Africa University Sports by East African University leaders. Speaking after his election Coach Jack thanked East African University leaders and promised to deliver.', '2021-03-28 At 21:01', '202103282101'),
(9, '162526530_10221815590716989_4684217879258718549_o.jpg', 'FEAUS-Elective-GA-held-at-Makerere-University', 'FEAUS Elective GA went down at Makerere University.', 'FEAUS Elective GA was held at Makerere University. Baluka Agnes Masajja was elected as First Vice president of he Federation for Eastern Africa University Sports.', '2021-03-28 At 21:07', '202103282107'),
(10, '84344717_1183331938537266_37530772852178944_o.jpg', 'Masinde-Muliro-becomes-second-after-Maseno-University-to-adopt-Americ', 'Masinde Muliro University of Science and Tech becomes second after Maseno University to adopt American Flag Football', 'Masinde Muliro University of Science and Tech becomes second after Maseno University to adopt American Flag Football\r\nEarlier today American Flag Football was officially launched at Masinde Muliro University of Science and Tech by Kenya Federation of American Football.', '2021-03-28 At 21:13', '202103282113'),
(11, 'Kibabii-Universitys-3rd-year-student-qualifies-for-the-Olympics.jpg', 'Kibabii-University-is-celebrating-the-victory-of-their-3rd-year-student-Faith-Ogallo', 'Faith Ogallo made Kenya proud in just concluded Olympic qualifiers in Rabat, Morocco.', 'The 12th all African Games silver medalist and Dubai G2 bronze medalist Faith Ogallo has earned Kenya Taekwondo a slot at the Olympics by defeating her opponent from Chad 27 â€“ 21. Ogallo officially qualifies for the Olympics in Tokyo Japan and will represent Kenya in the middle/heavyweight category at the games which will run from July 24th to August 2nd, 2020.\r\n\r\nThe Vice Chancellor Prof. Isaac Ipara Odeo blessed Faith and her colleagues during Kibabii Universityâ€™s Sportsmen and women of the Year Awards where she was awarded with the International Recognition Award at the ceremony.\r\n\r\nKibabii University appreciates the contributors of Ogalloâ€™s success and especially Kenya Taekwondo Federation that gave her the opportunity to showcase her prowess.\r\n\r\nThe Prof. Odeo has named Ogallo Faith and Lingokal Mushon Benson as KIBUâ€™s sports ambassadors and the University will brand them as their heroes.', '2021-03-28 At 21:19', '202103282119'),
(12, 'unnamed_1.png', 'MMUST-Rugby-team-roars-its-way-into-Kenya-Cup', 'MMUST Rugby team roars its way into Kenya Cup', 'Masinde Muliro University of Science and Technology Rugby team has qualified to join Kenya Cup Rugby competitions, after edging out Mean Machine from the University of Nairobi 22-12 in a highly thrilling Kenya Cup qualifiers played in MMUST on 13th February 2021.\r\n\r\nThe western based varsity boys came into this match guns blazing owing to the fact that their fate to remain on the pitch for the remaining part of the year hinged on the outcome of this match. This is after the ministry of health restricted all other levels of the league, allowing only teams in Kenya Cup to continue with the league. Nothing could disrupt their focus on the prize. Not even the heavy rains that poured just before the match begun. Once the match kicked off at 3:45 pm, Mean Machine seemed to have the game as the hosts settled into the game slowly. This made it easy for Mean Machine to capitalize on the penalties committed by MMUST', '2021-03-28 At 21:22', '202103282122');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
CREATE TABLE IF NOT EXISTS `payments` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `payment_type` varchar(300) NOT NULL,
  `payment_desc` varchar(500) NOT NULL,
  `amount` varchar(30) NOT NULL,
  `deadline` varchar(50) NOT NULL DEFAULT 'No Deadline',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `payment_type`, `payment_desc`, `amount`, `deadline`) VALUES
(1, 'Game Participation', 'KUSA Western Championship', '3000.00', '2019-10-31'),
(2, 'Registration', 'Membership renewal', '1000.00', ''),
(3, 'Semina Participation', 'Soccer team advisory', '2000.00', 'No deadline'),
(4, 'Others', 'Athletes contribution', '200.00', '2019-10-28');

-- --------------------------------------------------------

--
-- Table structure for table `slider`
--

DROP TABLE IF EXISTS `slider`;
CREATE TABLE IF NOT EXISTS `slider` (
  `id` int(200) NOT NULL AUTO_INCREMENT,
  `image` varchar(200) NOT NULL,
  `title` varchar(1000) NOT NULL,
  `time_uploaded` varchar(50) NOT NULL,
  `time_counter` varchar(50) NOT NULL,
  `status` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `slider`
--

INSERT INTO `slider` (`id`, `image`, `title`, `time_uploaded`, `time_counter`, `status`) VALUES
(1, 's5.jpg', 'Bringing Western Kenya Region Sports Universities Together', '2019-09-24 At 22:16', '201909242216', '1'),
(2, 's2.jpg', 'Kenya Taekwondo National Team participated in championship games at Fayoum University in Alexandria City, Egypt', '2019-09-15 At 17:11', '201909151711', '1'),
(3, 's3.jpg', 'Kenya Taekwondo National Team participated in championship games at Fayoum University in Alexandria City, Egypt', '2019-09-15 At 17:02', '201909151702', '1');

-- --------------------------------------------------------

--
-- Table structure for table `sms_athlete`
--

DROP TABLE IF EXISTS `sms_athlete`;
CREATE TABLE IF NOT EXISTS `sms_athlete` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `senderId` int(10) DEFAULT NULL,
  `senderCategory` varchar(20) DEFAULT NULL,
  `recieverId` int(10) DEFAULT NULL,
  `recieverCategory` varchar(20) DEFAULT NULL,
  `message` text,
  `time` varchar(10) DEFAULT NULL,
  `date` varchar(20) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sms_athlete`
--

INSERT INTO `sms_athlete` (`id`, `senderId`, `senderCategory`, `recieverId`, `recieverCategory`, `message`, `time`, `date`, `status`) VALUES
(1, 31854313, 'Athlete', 31854313, 'Admin', 'Hello, \r\nI am unable to uploads my documents. \r\nKindly assist.\r\nThaks', '6:30AM', '15/10/2019', 0),
(2, 31854315, 'Athlete', 31854315, 'Admin', 'Hello, Kindly update me on my approval status. I applied for Kusa Football and my status is still pending. Kindly Assist.', '6:15PM', '15/10/2019', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sports`
--

DROP TABLE IF EXISTS `sports`;
CREATE TABLE IF NOT EXISTS `sports` (
  `sport_id` int(10) NOT NULL AUTO_INCREMENT,
  `sport_name` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`sport_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sports`
--

INSERT INTO `sports` (`sport_id`, `sport_name`) VALUES
(6, 'Football'),
(7, 'Volley Ball'),
(8, 'Rugby'),
(9, 'Taekwondo'),
(10, 'Handball');

-- --------------------------------------------------------

--
-- Table structure for table `top_story`
--

DROP TABLE IF EXISTS `top_story`;
CREATE TABLE IF NOT EXISTS `top_story` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `image` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(500) NOT NULL,
  `date_uploaded` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `top_story`
--

INSERT INTO `top_story` (`id`, `image`, `title`, `description`, `date_uploaded`) VALUES
(1, 'IMG-20190915-WA0008.jpg', '12th All African Games, Rabat Morocco 2019', 'Universities fro Western Kenya represented Kenya well in just concluded  12th All African Games, Rabat Morocco 2019. Our students were able to win many medals which included golds. ', '2019-09-24');

-- --------------------------------------------------------

--
-- Table structure for table `tutor`
--

DROP TABLE IF EXISTS `tutor`;
CREATE TABLE IF NOT EXISTS `tutor` (
  `tutor_id` int(10) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(60) DEFAULT NULL,
  `second_name` varchar(60) DEFAULT NULL,
  `last_name` varchar(60) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `nationality` varchar(20) DEFAULT NULL,
  `county` varchar(60) DEFAULT NULL,
  `dob` varchar(18) DEFAULT NULL,
  `national_id` varchar(9) DEFAULT NULL,
  `phone_no` varchar(16) DEFAULT NULL,
  `email` varchar(65) DEFAULT NULL,
  `primary_name` varchar(60) DEFAULT NULL,
  `secondary_name` varchar(60) DEFAULT NULL,
  `tertiary_name` varchar(60) DEFAULT NULL,
  `institiution_id` int(10) DEFAULT NULL,
  `pfno` varchar(60) DEFAULT NULL,
  `sport_id` int(255) DEFAULT NULL,
  `personal_photo` varchar(200) DEFAULT NULL,
  `national_id_front` varchar(200) DEFAULT NULL,
  `national_id_back` varchar(200) DEFAULT NULL,
  `job_id` varchar(200) DEFAULT NULL,
  `status` varchar(1) NOT NULL DEFAULT '0',
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`tutor_id`),
  KEY `institiution_id` (`institiution_id`),
  KEY `sport_id` (`sport_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tutor`
--

INSERT INTO `tutor` (`tutor_id`, `first_name`, `second_name`, `last_name`, `gender`, `nationality`, `county`, `dob`, `national_id`, `phone_no`, `email`, `primary_name`, `secondary_name`, `tertiary_name`, `institiution_id`, `pfno`, `sport_id`, `personal_photo`, `national_id_front`, `national_id_back`, `job_id`, `status`, `password`) VALUES
(1, 'Samuel', 'Ndegwa', 'Mwangi', 'Male', 'Kenya', 'Nyeri', '2/2/1999', '31854313', '0726159307', 'mwanikisamuel91@gmail.com', 'Karaba Primary School', 'Muranga High School', 'Kibabii University', 1, '234', 8, 'tet.jpg', 'c13.jpg', 'c8.jpg', 'c10.jpg', '1', '862zy31854313'),
(2, 'Salome', 'Nafula', 'Wanyama', 'Female', 'Kenya', 'Bungoma', '2/2/1999', '31854314', '0726159307', 'nafula@yahoo.com', 'Bungoma Primary School', 'Bungoma Girls Secondary', 'Kibabii University', 3, '456', 9, 'ret.jpg', 'c13.jpg', 'c8.jpg', 'c10.jpg', '1', '12345678'),
(3, 'Eliud', 'Kimani', 'Kuria', 'Male', 'Kenya', 'Nyandarua', '1985-11-25', '35854313', '0726159307', 'mwanikisamuel91@gmail.com', 'Kanjoya Primary School', 'Maseno Secondary School', 'Uniersity of Nairobi', 5, 'PF0067', 6, '35854313_1573328351.jpg', '35854313_1573328372.jpg', '35854313_1573328386.jpg', '35854313_1573328420.jpg', '1', '35854313'),
(4, 'Eliakim', 'Otieno', 'Ayugi', 'Male', 'Kenya', 'Kisumu', '2003-06-17', '23456789', '0726159456', 'jack@gmail.com', 'Karaba', 'Muranga', 'Maseno', 2, '0012', 8, '--personal-photo--', '--nationalid-front--', '--national-id-back--', '--job-id--', '0', '23456789'),
(5, 'John ', 'Mwangi', 'Michuki', 'Male', 'Kenya', 'Embu', '1980-09-09', '98765432', '0723456770', 'john@gmail.com', 'Mutune Primary', 'Muranga ', 'Maseno', 1, '00987', 8, '98765432_1665590887.jpg', '98765432_1665590894.jpg', '98765432_1665590903.jpg', '98765432_1665590916.jpg', '1', '98765432');

-- --------------------------------------------------------

--
-- Table structure for table `uploading`
--

DROP TABLE IF EXISTS `uploading`;
CREATE TABLE IF NOT EXISTS `uploading` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `file_name` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `uploading`
--

INSERT INTO `uploading` (`id`, `name`, `email`, `file_name`) VALUES
(1, 'Samuel Ndegwa', 'mwas@gmail.com', 'uploads/256161secondary.jpg'),
(2, 'mwangi', 'alfredjuma2015@yahoo.com', 'uploads/212213university.jpg'),
(3, 'Elohim', 'kiongo@gmail.com', '404135maseno.jpg'),
(4, 'name', 'email', '969179national_id.jpg');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `athletes`
--
ALTER TABLE `athletes`
  ADD CONSTRAINT `athletes_ibfk_1` FOREIGN KEY (`institiution_id`) REFERENCES `institiution` (`institiution_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `athletes_ibfk_2` FOREIGN KEY (`sport_id`) REFERENCES `sports` (`sport_id`) ON UPDATE CASCADE;

--
-- Constraints for table `event_applications`
--
ALTER TABLE `event_applications`
  ADD CONSTRAINT `event_applications_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`event_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `event_applications_ibfk_2` FOREIGN KEY (`athlete_id`) REFERENCES `athletes` (`athlete_id`) ON UPDATE CASCADE;

--
-- Constraints for table `tutor`
--
ALTER TABLE `tutor`
  ADD CONSTRAINT `tutor_ibfk_1` FOREIGN KEY (`institiution_id`) REFERENCES `institiution` (`institiution_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tutor_ibfk_2` FOREIGN KEY (`sport_id`) REFERENCES `sports` (`sport_id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
