-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 23, 2024 at 10:01 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laundry_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `archived_category`
--

CREATE TABLE `archived_category` (
  `archive_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `laundry_category_option` varchar(255) NOT NULL,
  `archived_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `archived_category`
--

INSERT INTO `archived_category` (`archive_id`, `category_id`, `laundry_category_option`, `archived_at`) VALUES
(1, 9, 'rugs', '2024-09-18 10:33:07'),
(2, 10, 'clothes ', '2024-09-21 06:30:14'),
(3, 4, 'shoes', '2024-11-15 02:16:11'),
(4, 5, 'Mushroom', '2024-11-15 02:21:46'),
(5, 6, 'Socks', '2024-11-15 02:23:15'),
(6, 8, 'Scarf', '2024-11-15 02:28:49'),
(7, 7, 'Headband', '2024-11-15 06:37:24');

-- --------------------------------------------------------

--
-- Table structure for table `archived_customers`
--

CREATE TABLE `archived_customers` (
  `archive_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `contact_number` varchar(20) NOT NULL,
  `province` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `brgy` varchar(255) NOT NULL,
  `archived_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `archived_customers`
--

INSERT INTO `archived_customers` (`archive_id`, `customer_id`, `customer_name`, `contact_number`, `province`, `city`, `address`, `brgy`, `archived_at`) VALUES
(3, 22, 'vanilla', '23456645654', '', '', 'sjdm', '', '2024-09-16 16:17:34'),
(4, 23, 'ming', '34567654321', '', '', 'sjdm', '', '2024-09-16 16:34:10'),
(5, 28, 'frf', '34567897654', '', '', 'ggg', '', '2024-10-02 10:53:58'),
(6, 33, 'nitnit lomi', '80000888888', '', '', '', '', '2024-10-02 10:54:12'),
(7, 34, 'nitnit lomi', '70000000000', '', '', '', '', '2024-10-02 10:54:17'),
(8, 27, 'milky', '33325253252', '', '', 'quezon city', '', '2024-11-01 15:27:42'),
(9, 24, 'christine', '09997852239', '', '', 'laguna', '', '2024-11-01 15:29:05'),
(10, 36, 'Christinee', '09951273842', '', '', 'SJDM', '', '2024-11-01 16:12:12'),
(11, 29, 'denise', '22220000000', '', '', '', '', '2024-11-01 16:55:31'),
(12, 26, 'winnie', '53459876574', '', '', 'ctvl', '', '2024-11-02 08:04:34'),
(13, 31, 'nitinit', '50000000000', '', '', '', '', '2024-11-02 11:26:10'),
(14, 51, 'Minnie', '23456432456', '', '', '', '', '2024-11-06 07:31:28'),
(15, 42, 'Kristine', '65644564564', '', '', 'Isabela Road', '', '2024-11-06 07:32:01'),
(16, 43, 'Milton', '74747444445', '', '', '', '', '2024-11-06 07:34:22'),
(17, 50, 'Mickey', '23455643535', '', '', '', '', '2024-11-06 07:43:35'),
(18, 49, 'Gwen', '42343435345', '', '', 'sjdm', '', '2024-11-06 07:45:06'),
(19, 81, 'DANI DS', '09876890987', '', '', 'CITRUS', '', '2024-11-13 08:26:53'),
(20, 82, 'Gabrielle Dela Cruz', '09765434562', 'bulacan', 'sjdm', 'Citrus', '', '2024-11-13 08:39:58'),
(21, 83, 'Albert Einstein', '09876546789', 'bulacan', 'sjdm', 'California', 'Gumaoc West', '2024-11-13 08:46:57'),
(22, 86, 'Alexia Tuloy', '09090876865', 'bulacan', 'sjdm', 'Sarmiento', 'Gaya-gaya', '2024-11-13 09:20:21'),
(23, 85, 'Alexia Dela Cruz', '09678978987', '', '', '', '', '2024-11-13 09:54:48'),
(24, 84, 'Alexia Dela Cruz', '09876567897', '', '', '', '', '2024-11-13 09:54:55'),
(25, 101, 'Maria Weibo', '09879878777', 'bulacan', 'sjdm', 'Farm', 'Kaypian', '2024-11-14 21:33:46'),
(26, 108, '134', '09123134345', 'bulacan', 'sjdm', '132131', 'Gaya-gaya', '2024-11-15 02:15:58'),
(27, 107, '234', '09462342645', 'bulacan', 'sjdm', 'test2', 'Gumaoc East', '2024-11-15 02:40:31'),
(28, 111, 'patient1', '09123142353', 'bulacan', 'sjdm', 'bsu', 'Kaypian', '2024-11-15 07:38:57'),
(29, 116, '3E', '09123123131', 'bulacan', 'sjdm', 'BSU', 'Kaypian', '2024-11-15 08:14:57');

-- --------------------------------------------------------

--
-- Table structure for table `archived_service`
--

CREATE TABLE `archived_service` (
  `archive_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `laundry_service_option` varchar(255) NOT NULL,
  `archived_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `archived_service`
--

INSERT INTO `archived_service` (`archive_id`, `service_id`, `laundry_service_option`, `archived_at`) VALUES
(1, 5, 'Dry only', '2024-09-16 17:24:16'),
(2, 4, 'Wash only', '2024-09-18 10:47:12'),
(3, 7, 'Shoe clean', '2024-11-12 07:27:59'),
(4, 9, 'Pressed', '2024-11-15 02:33:39');

-- --------------------------------------------------------

--
-- Table structure for table `archived_users`
--

CREATE TABLE `archived_users` (
  `archive_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `user_role` varchar(50) NOT NULL,
  `archived_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `archived_users`
--

INSERT INTO `archived_users` (`archive_id`, `user_id`, `username`, `first_name`, `last_name`, `user_role`, `archived_at`) VALUES
(1, 54, 'dan1233', 'dan', 'brown', 'admin', '2024-09-11 13:51:05'),
(3, 56, 'pongSy', 'pong', 'Sy', 'admin', '2024-09-11 15:20:08'),
(4, 57, 'vanilla28', 'Vanilla', 'Cream', 'admin', '2024-09-14 08:20:37'),
(5, 58, 'jellybeanDC', 'Jellybean', 'Dela Cruz', 'admin', '2024-09-16 14:21:46'),
(6, 59, 'den123', 'denise', 'v', 'staff', '2024-09-30 05:23:57'),
(7, 60, 'MagGreene', 'Maggie', 'Greene', 'admin', '2024-10-05 14:41:24'),
(8, 61, 'AriGrande93', 'Ariana', 'Grande', 'staff', '2024-10-05 14:41:28'),
(9, 62, 'AGrande', 'Ari', 'Grande', 'admin', '2024-10-05 14:41:33'),
(10, 68, 'Almira', 'Almira', 'Serkira', 'admin', '2024-11-06 08:44:07'),
(11, 70, 'deniseV0', 'denise', 'v', 'admin', '2024-11-06 08:51:04'),
(12, 69, 'deniseV', 'denise', 'v', 'admin', '2024-11-06 08:51:08'),
(13, 71, 'villa00', 'denise', 'villa', 'admin', '2024-11-06 08:52:00'),
(14, 74, 'Pedro', 'Pedro', 'Dela Cruz', 'admin', '2024-11-13 22:08:42'),
(15, 75, 'Peabo', 'Peabo', 'Bryson', 'admin', '2024-11-14 21:07:23'),
(16, 76, 'sabrinaC', 'Sabrina', 'Crpntr', 'admin', '2024-11-14 22:19:53'),
(17, 78, 'MikaMahinay', 'Mikaela', 'Mahinay', 'admin', '2024-11-15 06:12:06'),
(18, 77, 'MuningSantos', 'Muning', 'Santooos', 'admin', '2024-11-18 14:07:33'),
(19, 80, 'MarcyVillaroel', 'Marceline', 'Villaroel', 'admin', '2024-11-18 14:38:20'),
(20, 73, 'SamSam', 'Sam', 'Smith', 'staff', '2024-11-18 15:22:39'),
(21, 81, 'ACara', 'Alessia', 'Cara', 'admin', '2024-11-18 15:23:00'),
(22, 83, 'HeartManaloto', 'Heart', 'Manaloto', 'admin', '2024-11-18 16:37:41'),
(23, 84, 'Bey', 'Beyonce', 'Knowles', 'admin', '2024-11-18 16:48:43'),
(24, 72, 'villa', 'denise', 'vill', 'admin', '2024-11-18 17:11:27'),
(25, 82, 'SUGAR', 'Yoongi', 'Min', 'admin', '2024-11-18 17:13:54'),
(26, 85, 'JeonJungkook', 'Jungkook', 'Jeon', 'admin', '2024-11-19 15:26:37'),
(27, 86, 'AllanaPascual', 'Allana', 'Pascual', 'admin', '2024-11-19 15:27:35'),
(28, 87, 'MarielLapinig', 'Mariel', 'Lapinig', 'admin', '2024-11-19 15:28:27'),
(29, 88, 'YielLapinig', 'Yiel', 'Lapinig', 'admin', '2024-11-19 15:33:17'),
(30, 89, 'deynn', 'Danielle', 'Dela Cruz', 'admin', '2024-11-20 14:18:22');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(255) NOT NULL,
  `laundry_category_option` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `laundry_category_option`) VALUES
(1, 'Clothes/Table Napkins/Pillowcase'),
(2, 'Bedsheet/Table Cloths/Curtain'),
(3, 'Comforter/Bath towel'),
(9, 'Stuff toy'),
(10, 'shoes'),
(11, 'blanket'),
(12, 'slippers'),
(13, 'dollars');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `contact_number` varchar(20) NOT NULL,
  `province` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `brgy` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `customer_name`, `contact_number`, `province`, `city`, `address`, `brgy`) VALUES
(19, 'tin', '87654367890', '', '', 'sjdm', ''),
(30, 'nitnit', '00999999999', '', '', '', ''),
(32, 'roi', '80000000000', '', '', '', ''),
(35, 'christine', '82828228288', '', '', '', ''),
(37, 'Idowl', '09123457899', '', '', '', ''),
(38, 'Hatig', '09123456789', '', '', '', ''),
(41, 'Liam ', '44444444444', '', '', 'Argentina', ''),
(44, 'Kristine', '43442424234', '', '', '', ''),
(45, 'Kristine', '43535345334', '', '', '', ''),
(46, 'Kristine', '34343324423', '', '', '', ''),
(47, 'Kristine', '23456576876', '', '', '', ''),
(48, 'Cristine', '11111111111', '', '', 'SJDM', ''),
(52, 'Pink Sweat', '22222222222', '', '', 'Cypress', ''),
(53, 'adi', '90000000000', '', '', '', ''),
(54, 'tobi', '88888888888', '', '', 'verde green', ''),
(55, 'tiiin', '89687998787', '', '', 'sjdm', ''),
(56, 'pedro', '00000000000', '', '', 'sjdm', ''),
(57, 'tintin', '09320902894', '', '', '', ''),
(58, 'mingming', '23456786543', '', '', '', ''),
(59, 'milky', '34567890876', '', '', 'blk 2 lot 16', ''),
(60, 'Winnie', '56789032222', '', '', '', ''),
(61, 'Chito', '24356756434', '', '', '', ''),
(62, 'chitoo', '28343734890', '', '', 'Block 2 Lot 8, Towerville subd.', ''),
(63, 'chitoo', '98976578902', '', '', '', ''),
(64, 'Charlize', '34567843544', '', '', 'blk 3 lot 6 skyline', ''),
(65, 'Mika Ela', '87272984390', '', '', '', ''),
(66, 'Pearl Magbanua', '35534657643', '', '', 'blk 3 lot 6 skyline', ''),
(67, 'denise v', '09555555555', '', '', '', ''),
(68, 'den', '99999999999', '', '', '', ''),
(69, 'fht', '54657877777', '', '', '', ''),
(70, 'Muning Dela Cruz', '09876890876', '', '', '', ''),
(71, 'Muning Dela Cruz', '09876789034', '', '', '', ''),
(72, 'Mingming', '35464765874', '', '', '', ''),
(73, 'Tintin Magbanua', '09404304930', '', '', 'Citiville', ''),
(74, 'Melanie ', '09876578909', '', '', 'Heaven subd', ''),
(75, 'hello', '98765667890', '', '', 'sarmiento', ''),
(76, 'Danielle', '09997657897', '', '', '', ''),
(77, 'Dani DC', '09567890876', '', '', 'Orange', ''),
(78, 'Mung Go', '09534534643', '', '', '', ''),
(79, 'juju beat', '09173627362', '', '', 'verde green 888', ''),
(80, 'Dani ela DC', '09876899087', '', '', 'Marcela', ''),
(87, 'JC Bieber', '09789899989', '', '', '', ''),
(88, 'Maria DB', '09872637621', 'bulacan', 'sjdm', 'Towerville', 'Gaya-gaya'),
(89, 'Samuel Valentine', '09878998997', 'bulacan', 'sjdm', 'Sarmiento', 'Muzon Proper'),
(90, 'denise', '09123472384', '', '', '', ''),
(91, 'sabrina', '09882772363', '', '', '', ''),
(92, 'barry', '09834723423', '', '', '', ''),
(93, 'huhu', '09127384236', '', '', '', ''),
(94, 'g wolf', '09433544535', '', '', '', ''),
(95, 'assssfafwe', '09878767682', '', '', '', ''),
(96, 'Manny Regalado', '09675789765', '', '', 'Lemery', ''),
(97, 'Mina De', '09849023748', '', '', '', ''),
(98, 'Cattleya Arce', '09898989887', 'bulacan', 'sjdm', 'Lemery street', 'Graceville'),
(99, 'Trisha Mae', '09897877686', '', '', '', ''),
(100, 'Jolibee Macdonalds', '09889898978', 'bulacan', 'sjdm', 'Ramon Magsaysay Street', 'Gumaoc West'),
(102, 'Kim Jisoo', '09089898988', 'bulacan', 'sjdm', 'Pamela street', 'Gaya-gaya'),
(103, 'Rudolf Magallanes', '09098989898', '', '', '', ''),
(104, 'Alexis Brown', '09898986557', '', '', '', ''),
(105, 'Mandry Moore', '09878787877', 'bulacan', 'sjdm', 'Sunflower st.', 'Tungkong Mangga'),
(106, '2342rthrthgrt', '09463242342', 'bulacan', 'sjdm', 'test1', 'Gaya-gaya'),
(109, 'Reliza Gatchalian', '09123324356', 'bulacan', 'sjdm', 'Sarmiento', 'Kaypian'),
(110, 'Reliza Gatchalian', '09765678768', '', '', '', ''),
(112, 'Claire', '09134141424', 'bulacan', 'sjdm', 'bsu', 'Kaypian'),
(113, 'leah', '09035324234', 'bulacan', 'sjdm', 'bsu', 'Graceville'),
(114, 'Jonathan Demate', '09878786887', 'bulacan', 'sjdm', 'bsu', 'Francisco Homes - Mulawin'),
(115, 'Michael', '09234245456', 'bulacan', 'sjdm', 'bsu', 'Gaya-gaya'),
(117, 'Winnie Pooh', '09898900009', 'bulacan', 'sjdm', 'Citiville', 'Tungkong Mangga'),
(118, 'Sadie Sink', '09989898989', 'bulacan', 'sjdm', 'Hollywood Street', 'Muzon South'),
(119, 'Christian Serratos', '09089898909', 'bulacan', 'sjdm', 'Gumamela street', 'Muzon South'),
(120, 'Glinda', '09009009909', 'bulacan', 'sjdm', 'Oz University heights', 'San Roque'),
(121, 'Elphaba', '09090890000', 'bulacan', 'sjdm', 'Oz University Heights\n', 'Kaybanban'),
(122, 'Marcella Santos', '09090000000', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_category`
--

CREATE TABLE `delivery_category` (
  `d_categoryID` int(255) NOT NULL,
  `delivery_category` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `delivery_category`
--

INSERT INTO `delivery_category` (`d_categoryID`, `delivery_category`) VALUES
(1, 'Delivery (outside Gaya-gaya)'),
(2, 'Delivery (within Gaya-gaya)');

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `service_id` int(11) NOT NULL,
  `laundry_service_option` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `service`
--

INSERT INTO `service` (`service_id`, `laundry_service_option`) VALUES
(1, 'Wash/Dry/Fold'),
(2, 'Wash/Dry/Press'),
(3, 'Dry only'),
(6, 'Wash only'),
(8, 'Press'),
(10, 'Press only'),
(11, 'shoes'),
(12, 'dry only'),
(13, 'FOLD ONLY'),
(14, 'money laundering');

-- --------------------------------------------------------

--
-- Table structure for table `service_category_price`
--

CREATE TABLE `service_category_price` (
  `id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `service_category_price`
--

INSERT INTO `service_category_price` (`id`, `service_id`, `category_id`, `price`) VALUES
(1, 1, 1, '35.00'),
(2, 1, 2, '45.00'),
(3, 1, 3, '55.00'),
(4, 2, 1, '80.00'),
(5, 2, 2, '100.00'),
(6, 3, 1, '35.00'),
(7, 3, 2, '45.00'),
(8, 3, 3, '55.00'),
(9, 6, 1, '15.00'),
(10, 10, 9, '36.00'),
(11, 11, 10, '50.00'),
(12, 12, 11, '51.00'),
(13, 13, 12, '25.00'),
(14, 14, 13, '6000.00');

-- --------------------------------------------------------

--
-- Table structure for table `service_options`
--

CREATE TABLE `service_options` (
  `option_id` int(255) NOT NULL,
  `option_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `service_options`
--

INSERT INTO `service_options` (`option_id`, `option_name`) VALUES
(1, 'Delivery'),
(2, 'Customer Pick-Up'),
(3, 'Rush');

-- --------------------------------------------------------

--
-- Table structure for table `service_option_price`
--

CREATE TABLE `service_option_price` (
  `option_price_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `d_categoryID` int(255) NOT NULL,
  `service_option_type` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `service_option_price`
--

INSERT INTO `service_option_price` (`option_price_id`, `option_id`, `d_categoryID`, `service_option_type`, `price`) VALUES
(1, 1, 1, 'Delivery (outside gaya-gaya)', '50.00'),
(3, 3, 0, 'Rush', '25.00'),
(4, 1, 2, 'Delivery (within gaya-gaya)', '25.00');

-- --------------------------------------------------------

--
-- Table structure for table `service_request`
--

CREATE TABLE `service_request` (
  `request_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer_order_id` varchar(50) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `contact_number` varchar(20) NOT NULL,
  `service_id` int(255) NOT NULL,
  `laundry_service_option` varchar(100) NOT NULL,
  `category_id` int(255) NOT NULL,
  `laundry_category_option` varchar(100) NOT NULL,
  `quantity` int(100) NOT NULL,
  `weight` decimal(10,2) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `request_date` date NOT NULL,
  `service_request_date` date NOT NULL DEFAULT current_timestamp(),
  `service_req_time` time NOT NULL DEFAULT current_timestamp(),
  `order_status` enum('completed','active','cancelled') NOT NULL DEFAULT 'active',
  `remarks` enum('pending','delivered','undelivered','claimed','unclaimed') DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `service_request`
--

INSERT INTO `service_request` (`request_id`, `customer_id`, `customer_order_id`, `customer_name`, `contact_number`, `service_id`, `laundry_service_option`, `category_id`, `laundry_category_option`, `quantity`, `weight`, `price`, `request_date`, `service_request_date`, `service_req_time`, `order_status`, `remarks`) VALUES
(1, 16, '0', 'dsfs', '32434242224', 1, 'Wash/Dry/Fold', 1, 'Clothes/Table Napkins/Pillowcase', 5, '5.00', '35.00', '2024-09-04', '2024-09-01', '21:01:52', '', 'delivered'),
(2, 17, '0', 'rd', '98767546789', 1, 'Wash/Dry/Fold', 1, 'Clothes/Table Napkins/Pillowcase', 2, '7.00', '35.00', '0000-00-00', '2024-09-01', '21:01:52', '', 'delivered'),
(3, 18, '0', 'roi', '98767546786', 1, 'Wash/Dry/Fold', 3, 'Comforter/Bath towel\r\n', 7, '18.00', '65.00', '2024-09-04', '2024-09-01', '21:01:52', 'completed', 'delivered'),
(4, 19, '0', 'tun', '87654367890', 1, 'Wash/Dry/Fold', 2, 'Bedsheet/Table Cloths/Curtain\r\n', 3, '6.00', '55.00', '0000-00-00', '2024-09-01', '21:01:52', 'cancelled', 'delivered'),
(5, 20, '0', 'dsgs', '43567890765', 1, 'Wash/Dry/Fold', 2, 'Bedsheet/Table Cloths/Curtain\r\n', 5, '20.00', '55.00', '0000-00-00', '2024-09-06', '21:01:52', 'cancelled', 'delivered'),
(6, 21, '0', 'chris', '34565432345', 3, 'Dry only', 3, 'Comforter/Bath towel\r\n', 3, '6.00', '55.00', '0000-00-00', '2024-09-06', '21:01:52', 'active', 'delivered'),
(7, 22, '0', 'vanilla', '23456645654', 2, 'Wash/Dry/Press', 1, 'Clothes/Table Napkins/Pillowcase', 8, '7.00', '80.00', '2024-09-20', '2024-09-17', '00:15:01', 'completed', 'delivered'),
(8, 23, '0', 'ming', '34567654321', 2, 'Wash/Dry/Press', 2, 'Bedsheet/Table Cloths/Curtain\r\n', 6, '6.00', '100.00', '2024-09-20', '2024-09-17', '00:32:52', 'completed', 'delivered'),
(9, 24, '0', 'christine', '09997852239', 2, 'Wash/Dry/Press', 2, 'Bedsheet/Table Cloths/Curtain\r\n', 6, '6.00', '100.00', '2024-09-23', '2024-09-20', '17:54:59', 'completed', 'delivered'),
(10, 24, '0', 'christine', '09997852239', 1, 'Wash/Dry/Fold', 2, 'Bedsheet/Table Cloths/Curtain\r\n', 5, '7.00', '55.00', '2024-09-23', '2024-09-20', '18:17:59', 'completed', 'delivered'),
(11, 25, '0', 'tintin', '09059748294', 3, 'Dry only', 3, 'Comforter/Bath towel\r\n', 7, '6.00', '55.00', '2024-09-23', '2024-09-20', '18:26:02', 'completed', 'delivered'),
(12, 25, '0', 'tintin', '09059748294', 1, 'Wash/Dry/Fold', 1, 'Clothes/Table Napkins/Pillowcase', 4, '5.00', '35.00', '2024-09-23', '2024-09-20', '18:26:02', 'completed', 'delivered'),
(13, 26, '0', 'winnie', '53459876574', 1, 'Wash/Dry/Fold', 2, 'Bedsheet/Table Cloths/Curtain\r\n', 4, '6.00', '55.00', '2024-09-23', '2024-09-20', '21:18:18', 'completed', 'delivered'),
(14, 27, '0', 'milky', '33325253252', 2, 'Wash/Dry/Press', 2, 'Bedsheet/Table Cloths/Curtain\r\n', 5, '6.00', '100.00', '2024-09-25', '2024-09-22', '21:18:02', 'completed', 'delivered'),
(15, 24, '', 'Christine', '09997852239', 2, 'Wash/Dry/Press', 1, 'Clothes/Table Napkins/Pillowcase', 4, '7.00', '80.00', '0000-00-00', '2024-09-28', '22:50:13', 'cancelled', 'delivered'),
(17, 28, '', 'frf', '34567897654', 1, 'Wash/Dry/Fold', 2, 'Bedsheet/Table Cloths/Curtain\r\n', 6, '7.00', '55.00', '0000-00-00', '2024-09-30', '15:38:52', 'cancelled', 'delivered'),
(18, 29, '', 'denise', '22220000000', 1, 'Wash/Dry/Fold', 2, 'Bedsheet/Table Cloths/Curtain\r\n', 2, '5.00', '55.00', '2024-09-28', '2024-09-30', '15:43:15', 'completed', 'delivered'),
(21, 31, 'order_66fa5b508b935', 'nitinit', '50000000000', 1, 'Wash/Dry/Fold', 2, 'Bedsheet/Table Cloths/Curtain\r\n', 1, '6.00', '55.00', '2024-09-30', '2024-09-30', '16:03:28', 'completed', 'delivered'),
(22, 18, 'order_66fa5c9080943', 'roi', '80000000000', 2, 'Wash/Dry/Press', 2, 'Bedsheet/Table Cloths/Curtain\r\n', 1, '7.00', '100.00', '2024-09-30', '2024-09-30', '16:08:48', 'completed', 'delivered'),
(23, 33, 'order_66fa5cd4099d7', 'nitnit lomi', '80000888888', 1, 'Wash/Dry/Fold', 2, 'Bedsheet/Table Cloths/Curtain\r\n', 2, '5.00', '55.00', '0000-00-00', '2024-09-30', '16:09:56', 'cancelled', 'delivered'),
(24, 33, 'order_66fa5d5c78310', 'nitnit lomi', '70000000000', 1, 'Wash/Dry/Fold', 1, 'Clothes/Table Napkins/Pillowcase', 2, '6.00', '35.00', '2024-09-28', '2024-09-30', '16:12:12', 'completed', 'delivered'),
(25, 33, 'order_66fa5d5c78310', 'nitnit lomi', '70000000000', 2, 'Wash/Dry/Press', 1, 'Clothes/Table Napkins/Pillowcase', 1, '6.00', '80.00', '2024-09-28', '2024-09-30', '16:12:12', 'completed', 'delivered'),
(26, 24, 'order_66fd2c6e35fe1', 'christine', '82828228288', 2, 'Wash/Dry/Press', 2, 'Bedsheet/Table Cloths/Curtain\r\n', 6, '7.00', '100.00', '2024-10-02', '2024-10-02', '19:20:14', 'completed', 'delivered'),
(27, 36, 'ord_6703ed88000fa', 'Christinee', '09951273842', 1, 'Wash/Dry/Fold', 3, 'Comforter/Bath towel\r\n', 3, '8.00', '65.00', '2024-10-07', '2024-10-07', '22:17:44', 'completed', 'delivered'),
(28, 37, 'ord_670f2750b0128', 'Idowl', '09123457899', 3, 'Dry only', 1, 'Clothes/Table Napkins/Pillowcase', 1, '20.00', '35.00', '0000-00-00', '2024-10-16', '10:39:12', 'cancelled', 'delivered'),
(29, 41, 'ord_67132a9f8e8a9', 'Liam ', '44444444444', 1, 'Wash/Dry/Fold', 2, 'Bedsheet/Table Cloths/Curtain\r\n', 4, '10.00', '55.00', '2024-10-19', '2024-10-19', '11:42:23', 'completed', 'delivered'),
(30, 42, 'ord_67191dff2f712', 'Kristine', '65644564564', 1, 'Wash/Dry/Fold', 1, 'Clothes/Table Napkins/Pillowcase', 4, '10.00', '35.00', '2024-10-24', '2024-10-24', '00:02:07', 'completed', 'delivered'),
(31, 42, 'ord_671925e957323', 'Kristine', '43442424234', 2, 'Wash/Dry/Press', 2, 'Bedsheet/Table Cloths/Curtain\r\n', 5, '5.00', '100.00', '2024-10-24', '2024-10-24', '00:35:53', 'completed', 'delivered'),
(32, 42, 'ord_671925e957323', 'Kristine', '43535345334', 2, 'Wash/Dry/Press', 1, 'Clothes/Table Napkins/Pillowcase', 2, '5.00', '80.00', '2024-10-24', '2024-10-24', '00:35:53', 'completed', 'delivered'),
(33, 42, 'ord_671925e957323', 'Kristine', '43535345334', 2, 'Wash/Dry/Press', 2, 'Bedsheet/Table Cloths/Curtain\r\n', 6, '6.00', '100.00', '2024-10-24', '2024-10-24', '00:35:53', 'completed', 'delivered'),
(34, 42, 'ord_671931b845adb', 'Kristine', '34343324423', 1, 'Wash/Dry/Fold', 1, 'Clothes/Table Napkins/Pillowcase', 6, '10.00', '35.00', '2024-10-24', '2024-10-24', '01:26:16', 'completed', 'delivered'),
(35, 42, 'ord_6719a82daae51', 'Kristine', '23456576876', 1, 'Wash/Dry/Fold', 1, 'Clothes/Table Napkins/Pillowcase', 1, '5.00', '35.00', '2024-10-24', '2024-10-24', '09:51:41', 'completed', 'delivered'),
(36, 48, 'ord_6719a8bc89519', 'Cristine', '11111111111', 1, 'Wash/Dry/Fold', 1, 'Clothes/Table Napkins/Pillowcase', 2, '5.00', '35.00', '2024-10-24', '2024-10-24', '09:54:04', 'completed', 'delivered'),
(37, 48, 'ord_6719a8bc89519', 'Cristine', '11111111111', 2, 'Wash/Dry/Press', 2, 'Bedsheet/Table Cloths/Curtain\r\n', 3, '6.00', '100.00', '2024-10-24', '2024-10-24', '09:54:04', 'completed', 'delivered'),
(38, 49, 'ord_6721e19056af1', 'Gwen', '42343435345', 2, 'Wash/Dry/Press', 2, 'Bedsheet/Table Cloths/Curtain\r\n', 6, '6.00', '100.00', '2024-11-02', '2024-10-30', '15:34:40', 'completed', 'delivered'),
(39, 50, 'ord_6721e2e779428', 'Mickey', '23455643535', 1, 'Wash/Dry/Fold', 1, 'Clothes/Table Napkins/Pillowcase', 7, '6.00', '35.00', '0000-00-00', '2024-10-30', '15:40:23', 'active', 'delivered'),
(40, 51, 'ord_6721e3af8bea7', 'Minnie', '23456432456', 1, 'Wash/Dry/Fold', 1, 'Clothes/Table Napkins/Pillowcase', 5, '7.00', '35.00', '0000-00-00', '2024-10-30', '15:43:43', 'active', 'delivered'),
(41, 52, 'ord_672b3071a4042', 'Pink Sweat', '22222222222', 1, 'Wash/Dry/Fold', 3, 'Comforter/Bath towel\r\n', 6, '6.00', '55.00', '2024-11-07', '2024-11-06', '17:01:37', 'completed', 'delivered'),
(42, 53, 'ord_672b31f279e58', 'adi', '90000000000', 1, 'Wash/Dry/Fold', 1, 'Clothes/Table Napkins/Pillowcase', 1, '5.00', '35.00', '2024-11-09', '2024-11-06', '17:08:02', 'completed', 'delivered'),
(43, 54, 'ord_672b32751a9f9', 'tobi', '88888888888', 1, 'Wash/Dry/Fold', 3, 'Comforter/Bath towel\r\n', 1, '7.00', '55.00', '2024-11-07', '2024-11-06', '17:10:13', 'completed', 'delivered'),
(44, 55, 'ord_672dbb38a8fb1', 'tiiin', '89687998787', 1, 'Wash/Dry/Fold', 1, 'Clothes/Table Napkins/Pillowcase', 4, '7.00', '35.00', '2024-11-12', '2024-11-08', '15:18:16', 'completed', 'delivered'),
(45, 55, 'ord_672dbb38a8fb1', 'tiiin', '89687998787', 2, 'Wash/Dry/Press', 2, 'Bedsheet/Table Cloths/Curtain\r\n', 2, '6.00', '100.00', '2024-11-12', '2024-11-08', '15:18:16', 'completed', 'delivered'),
(46, 56, 'ord_672dd6472ea5d', 'pedro', '00000000000', 1, 'Wash/Dry/Fold', 2, 'Bedsheet/Table Cloths/Curtain\r\n', 3, '8.00', '45.00', '2024-11-09', '2024-11-08', '17:13:43', 'completed', 'delivered'),
(47, 56, 'ord_672dd6472ea5d', 'pedro', '00000000000', 3, 'Dry only', 3, 'Comforter/Bath towel\r\n', 3, '6.00', '55.00', '2024-11-09', '2024-11-08', '17:13:43', 'completed', 'delivered'),
(48, 57, 'ord_672f38fc2e483', 'tintin', '09320902894', 2, 'Wash/Dry/Press', 2, 'Bedsheet/Table Cloths/Curtain\r\n', 4, '9.00', '100.00', '0000-00-00', '2024-11-09', '18:27:08', 'active', 'delivered'),
(49, 58, 'ord_672f3c1850cc0', 'mingming', '23456786543', 6, 'Wash only', 2, 'Bedsheet/Table Cloths/Curtain\r\n', 6, '5.00', '100.00', '0000-00-00', '2024-11-09', '18:40:24', 'cancelled', 'delivered'),
(50, 59, 'ord_672f4043e6294', 'milky', '34567890876', 2, 'Wash/Dry/Press', 1, 'Clothes/Table Napkins/Pillowcase', 3, '8.00', '80.00', '2024-11-15', '2024-11-09', '18:58:11', 'completed', 'delivered'),
(51, 60, 'ord_672f410c333f7', 'Winnie', '56789032222', 1, 'Wash/Dry/Fold', 2, 'Bedsheet/Table Cloths/Curtain\r\n', 5, '8.00', '46.00', '0000-00-00', '2024-11-09', '19:01:32', 'active', 'delivered'),
(52, 62, 'ord_672f426e18668', 'chitoo', '28343734890', 1, 'Wash/Dry/Fold', 1, 'Clothes/Table Napkins/Pillowcase', 5, '7.00', '35.00', '2024-11-12', '2024-11-09', '19:07:26', 'completed', 'delivered'),
(53, 62, 'ord_672f4380e7331', 'chitoo', '98976578902', 1, 'Wash/Dry/Fold', 1, 'Clothes/Table Napkins/Pillowcase', 5, '7.00', '35.00', '2024-11-12', '2024-11-09', '19:12:00', 'completed', 'delivered'),
(54, 64, 'ord_672f6ed480954', 'Charlize', '34567843544', 2, 'Wash/Dry/Press', 1, 'Clothes/Table Napkins/Pillowcase', 5, '6.00', '80.00', '2024-11-12', '2024-11-09', '22:16:52', 'completed', 'delivered'),
(55, 65, 'ord_672f70083d3bd', 'Mika Ela', '87272984390', 1, 'Wash/Dry/Fold', 2, 'Bedsheet/Table Cloths/Curtain\r\n', 6, '8.00', '46.00', '0000-00-00', '2024-11-09', '22:22:00', 'active', 'delivered'),
(56, 65, 'ord_672f70083d3bd', 'Mika Ela', '87272984390', 1, 'Wash/Dry/Fold', 1, 'Clothes/Table Napkins/Pillowcase', 6, '8.00', '35.00', '0000-00-00', '2024-11-09', '22:22:00', 'active', 'delivered'),
(57, 66, 'ord_672f98b5e2da3', 'Pearl Magbanua', '35534657643', 2, 'Wash/Dry/Press', 1, 'Clothes/Table Napkins/Pillowcase', 5, '5.00', '80.00', '2024-11-13', '2024-11-10', '01:15:33', 'completed', 'delivered'),
(58, 67, 'ord_6731ba6911d9a', 'denise v', '09555555555', 1, 'Wash/Dry/Fold', 1, 'Clothes/Table Napkins/Pillowcase', 2, '6.00', '35.00', '0000-00-00', '2024-11-11', '16:03:53', 'cancelled', 'delivered'),
(59, 68, 'ord_6731bb7f5cad9', 'den', '99999999999', 1, 'Wash/Dry/Fold', 2, 'Bedsheet/Table Cloths/Curtain\r\n', 1, '6.00', '45.00', '2024-11-12', '2024-11-11', '16:08:31', 'completed', 'delivered'),
(60, 69, 'ord_6731bd39a8a32', 'fht', '54657877777', 2, 'Wash/Dry/Press', 2, 'Bedsheet/Table Cloths/Curtain\r\n', 3, '7.00', '100.00', '0000-00-00', '2024-11-11', '16:15:53', 'cancelled', 'delivered'),
(61, 70, 'ord_6731bf9a8cbf2', 'Muning Dela Cruz', '09876890876', 1, 'Wash/Dry/Fold', 1, 'Clothes/Table Napkins/Pillowcase', 6, '8.00', '35.00', '0000-00-00', '2024-11-11', '16:26:02', 'active', 'delivered'),
(62, 70, 'ord_6731c052011b7', 'Muning Dela Cruz', '09876789034', 2, 'Wash/Dry/Press', 2, 'Bedsheet/Table Cloths/Curtain\r\n', 6, '7.00', '100.00', '0000-00-00', '2024-11-11', '16:29:06', 'active', 'delivered'),
(63, 58, 'ord_6731c11d514c2', 'Mingming', '35464765874', 3, 'Dry only', 3, 'Comforter/Bath towel\r\n', 8, '7.00', '55.00', '0000-00-00', '2024-11-11', '16:32:29', 'active', 'delivered'),
(64, 58, 'ord_6731c1e246296', 'Mingming', '35464765874', 2, 'Wash/Dry/Press', 1, 'Clothes/Table Napkins/Pillowcase', 10, '8.00', '80.00', '0000-00-00', '2024-11-11', '16:35:46', 'active', 'delivered'),
(65, 73, 'ord_67321ccaec306', 'Tintin Magbanua', '09404304930', 3, 'Dry only', 1, 'Clothes/Table Napkins/Pillowcase', 4, '5.00', '35.00', '2024-11-14', '2024-11-11', '23:03:38', 'completed', 'delivered'),
(66, 74, 'ord_67322c125dc2a', 'Melanie ', '09876578909', 1, 'Wash/Dry/Fold', 1, 'Clothes/Table Napkins/Pillowcase', 7, '8.00', '35.00', '2024-11-12', '2024-11-12', '00:08:50', 'completed', 'delivered'),
(68, 77, 'ord_6733172f30393', 'Dani DC', '09567890876', 1, 'Wash/Dry/Fold', 2, 'Bedsheet/Table Cloths/Curtain\r\n', 6, '8.00', '45.00', '2024-11-15', '2024-11-12', '16:51:59', 'completed', 'delivered'),
(69, 78, 'ord_67331cbc7ec9f', 'Mung Go', '09534534643', 2, 'Wash/Dry/Press', 2, 'Bedsheet/Table Cloths/Curtain\r\n', 7, '8.00', '100.00', '0000-00-00', '2024-11-12', '17:15:40', 'cancelled', 'delivered'),
(70, 79, 'ord_6733282bdee4a', 'juju beat', '09173627362', 1, 'Wash/Dry/Fold', 2, 'Bedsheet/Table Cloths/Curtain\r\n', 1, '8.00', '45.00', '2024-11-15', '2024-11-12', '18:04:27', 'completed', 'delivered'),
(71, 80, 'ord_67342db130f07', 'Dani ela DC', '09876899087', 1, 'Wash/Dry/Fold', 1, 'Clothes/Table Napkins/Pillowcase', 7, '7.00', '35.00', '2024-11-16', '2024-11-13', '12:40:17', 'completed', 'delivered'),
(72, 81, 'ord_673462470f27c', 'DANI DS', '09876890987', 1, 'Wash/Dry/Fold', 1, 'Clothes/Table Napkins/Pillowcase', 8, '8.00', '35.00', '2024-11-14', '2024-11-13', '16:24:39', 'completed', 'delivered'),
(73, 82, 'ord_673463f1a8105', 'Gabrielle Dela Cruz', '09765434562', 1, 'Wash/Dry/Fold', 1, 'Clothes/Table Napkins/Pillowcase', 6, '6.00', '35.00', '2024-11-14', '2024-11-13', '16:31:45', 'completed', 'delivered'),
(74, 83, 'ord_6734671ac1a77', 'Albert Einstein', '09876546789', 1, 'Wash/Dry/Fold', 2, 'Bedsheet/Table Cloths/Curtain\r\n', 7, '7.00', '45.00', '2024-11-16', '2024-11-13', '16:45:14', 'completed', 'delivered'),
(75, 84, 'ord_67346da059dc5', 'Alexia Dela Cruz', '09876567897', 1, 'Wash/Dry/Fold', 1, 'Clothes/Table Napkins/Pillowcase', 7, '7.00', '35.00', '0000-00-00', '2024-11-13', '17:13:04', 'active', 'delivered'),
(76, 84, 'ord_67346e66b21f9', 'Alexia Dela Cruz', '09678978987', 1, 'Wash/Dry/Fold', 1, 'Clothes/Table Napkins/Pillowcase', 7, '7.00', '35.00', '0000-00-00', '2024-11-13', '17:16:22', 'active', 'delivered'),
(77, 86, 'ord_67346ecce84a5', 'Alexia Tuloy', '09090876865', 1, 'Wash/Dry/Fold', 1, 'Clothes/Table Napkins/Pillowcase', 7, '7.00', '35.00', '2024-11-16', '2024-11-13', '17:18:04', 'completed', 'delivered'),
(78, 87, 'ord_6734a9cb94f45', 'JC Bieber', '09789899989', 2, 'Wash/Dry/Press', 3, 'Comforter/Bath towel\r\n', 5, '5.00', '100.00', '2024-11-16', '2024-11-13', '21:29:47', 'completed', 'delivered'),
(79, 88, 'ord_6734aac6828c4', 'Maria DB', '09872637621', 2, 'Wash/Dry/Press', 1, 'Clothes/Table Napkins/Pillowcase', 5, '5.00', '80.00', '2024-11-14', '2024-11-13', '21:33:58', 'completed', 'delivered'),
(80, 89, 'ord_6735b50a2c517', 'Samuel Valentine', '09878998997', 1, 'Wash/Dry/Fold', 2, 'Bedsheet/Table Cloths/Curtain\r\n', 2, '6.00', '45.00', '2024-11-17', '2024-11-14', '16:30:02', 'completed', 'delivered'),
(81, 90, 'ord_6735c199196da', 'denise', '09123472384', 2, 'Wash/Dry/Press', 2, 'Bedsheet/Table Cloths/Curtain', 2, '7.00', '100.00', '2024-11-17', '2024-11-14', '17:23:37', 'completed', 'delivered'),
(82, 91, 'ord_6735c41d90f78', 'sabrina', '09882772363', 2, 'Wash/Dry/Press', 1, 'Clothes/Table Napkins/Pillowcase', 2, '9.00', '80.00', '2024-11-17', '2024-11-14', '17:34:21', 'completed', 'delivered'),
(83, 92, 'ord_6735c498b4b3c', 'barry', '09834723423', 1, 'Wash/Dry/Fold', 1, 'Clothes/Table Napkins/Pillowcase', 2, '8.00', '35.00', '2024-11-17', '2024-11-14', '17:36:24', 'completed', 'delivered'),
(84, 93, 'ord_6735c56636b5c', 'huhu', '09127384236', 2, 'Wash/Dry/Press', 1, 'Clothes/Table Napkins/Pillowcase', 1, '6.00', '80.00', '2024-11-17', '2024-11-14', '17:39:50', 'completed', 'delivered'),
(85, 94, 'ord_6735c6fb63701', 'g wolf', '09433544535', 2, 'Wash/Dry/Press', 2, 'Bedsheet/Table Cloths/Curtain', 2, '6.00', '100.00', '2024-11-17', '2024-11-14', '17:46:35', 'completed', 'delivered'),
(86, 95, 'ord_6735c7d16780b', 'assssfafwe', '09878767682', 2, 'Wash/Dry/Press', 1, 'Clothes/Table Napkins/Pillowcase', 1, '6.00', '80.00', '2024-11-17', '2024-11-14', '17:50:09', 'completed', 'delivered'),
(87, 96, 'ord_6735c88283a72', 'Manny Regalado', '09675789765', 2, 'Wash/Dry/Press', 1, 'Clothes/Table Napkins/Pillowcase', 7, '7.00', '80.00', '2024-11-17', '2024-11-14', '17:53:06', 'completed', 'delivered'),
(88, 97, 'ord_6735cba1e655b', 'Mina De', '09849023748', 1, 'Wash/Dry/Fold', 2, 'Bedsheet/Table Cloths/Curtain', 3, '9.00', '45.00', '2024-11-15', '2024-11-14', '18:06:25', 'completed', 'delivered'),
(89, 98, 'ord_6735fa7d2150f', 'Cattleya Arce', '09898989887', 1, 'Wash/Dry/Fold', 2, 'Bedsheet/Table Cloths/Curtain', 5, '7.00', '45.00', '2024-11-17', '2024-11-14', '21:26:21', 'completed', 'delivered'),
(90, 99, 'ord_6735faf7d7d23', 'Trisha Mae', '09897877686', 2, 'Wash/Dry/Press', 2, 'Bedsheet/Table Cloths/Curtain', 5, '8.00', '100.00', '2024-11-17', '2024-11-14', '21:28:23', 'completed', 'delivered'),
(91, 100, 'ord_6735fedba1d3e', 'Jolibee Macdonalds', '09889898978', 2, 'Wash/Dry/Press', 1, 'Clothes/Table Napkins/Pillowcase', 4, '6.00', '80.00', '2024-11-17', '2024-11-14', '21:44:59', 'completed', 'delivered'),
(92, 100, 'ord_6735fedba1d3e', 'Jolibee Macdonalds', '09889898978', 1, 'Wash/Dry/Fold', 1, 'Clothes/Table Napkins/Pillowcase', 5, '5.00', '35.00', '2024-11-17', '2024-11-14', '21:44:59', 'completed', 'delivered'),
(93, 101, 'ord_6736003865a66', 'Maria Weibo', '09879878777', 1, 'Wash/Dry/Fold', 1, 'Clothes/Table Napkins/Pillowcase', 7, '6.00', '35.00', '2024-11-17', '2024-11-14', '21:50:48', 'completed', 'delivered'),
(94, 102, 'ord_673602d2b8819', 'Kim Jisoo', '09089898988', 1, 'Wash/Dry/Fold', 1, 'Clothes/Table Napkins/Pillowcase', 5, '6.00', '35.00', '2024-11-17', '2024-11-14', '22:01:54', 'completed', 'delivered'),
(95, 103, 'ord_67360ba77dd53', 'Rudolf Magallanes', '09098989898', 1, 'Wash/Dry/Fold', 2, 'Bedsheet/Table Cloths/Curtain', 5, '7.00', '45.00', '0000-00-00', '2024-11-14', '22:39:35', 'active', 'delivered'),
(96, 104, 'ord_67360db87ded4', 'Alexis Brown', '09898986557', 2, 'Wash/Dry/Press', 1, 'Clothes/Table Napkins/Pillowcase', 5, '7.00', '80.00', '2024-11-17', '2024-11-14', '22:48:24', 'completed', 'delivered'),
(97, 105, 'ord_673679412011a', 'Mandry Moore', '09878787877', 1, 'Wash/Dry/Fold', 1, 'Clothes/Table Napkins/Pillowcase', 7, '8.00', '35.00', '2024-11-15', '2024-11-15', '06:27:13', 'completed', 'delivered'),
(98, 106, 'ord_67369beb25d40', '2342rthrthgrt', '09463242342', 3, 'Dry only', 2, 'Bedsheet/Table Cloths/Curtain', 8, '5.00', '45.00', '2024-11-16', '2024-11-15', '08:55:07', 'completed', 'delivered'),
(99, 107, 'ord_67369d39d762c', '234', '09462342645', 1, 'Wash/Dry/Fold', 1, 'Clothes/Table Napkins/Pillowcase', 10, '5.00', '35.00', '2024-11-16', '2024-11-15', '09:00:41', 'completed', 'delivered'),
(100, 108, 'ord_67369e84c1f5d', '134', '09123134345', 2, 'Wash/Dry/Press', 1, 'Clothes/Table Napkins/Pillowcase', 6, '5.00', '80.00', '2024-11-16', '2024-11-15', '09:06:12', 'completed', 'delivered'),
(101, 109, 'ord_6736a6ab63ec1', 'Reliza Gatchalian', '09765678768', 1, 'Wash/Dry/Fold', 1, 'Clothes/Table Napkins/Pillowcase', 1, '7.50', '35.00', '2024-11-16', '2024-11-15', '09:40:59', 'completed', 'delivered'),
(102, 109, 'ord_6736a6ab63ec1', 'Reliza Gatchalian', '09765678768', 2, 'Wash/Dry/Press', 1, 'Clothes/Table Napkins/Pillowcase', 1, '5.00', '80.00', '2024-11-16', '2024-11-15', '09:40:59', 'completed', 'delivered'),
(103, 111, 'ord_6736b8e3f1c8a', 'patient1', '09123142353', 2, 'Wash/Dry/Press', 2, 'Bedsheet/Table Cloths/Curtain', 1, '5.00', '100.00', '2024-11-16', '2024-11-15', '10:58:43', 'completed', 'delivered'),
(104, 112, 'ord_6736cdd20694c', 'Claire', '09134141424', 1, 'Wash/Dry/Fold', 1, 'Clothes/Table Napkins/Pillowcase', 1, '5.00', '35.00', '2024-11-16', '2024-11-15', '12:28:02', 'completed', 'delivered'),
(105, 112, 'ord_6736cdd20694c', 'Claire', '09134141424', 1, 'Wash/Dry/Fold', 2, 'Bedsheet/Table Cloths/Curtain', 2, '7.03', '45.00', '2024-11-16', '2024-11-15', '12:28:02', 'completed', 'delivered'),
(106, 113, 'ord_6736d420aea8b', 'leah', '09035324234', 1, 'Wash/Dry/Fold', 1, 'Clothes/Table Napkins/Pillowcase', 1, '5.00', '35.00', '2024-11-16', '2024-11-15', '12:54:56', 'completed', 'delivered'),
(107, 114, 'ord_6736f21163258', 'Jonathan Demate', '09878786887', 1, 'Wash/Dry/Fold', 3, 'Comforter/Bath towel', 1, '5.00', '55.00', '2024-11-16', '2024-11-15', '15:02:41', 'completed', 'delivered'),
(108, 115, 'ord_6736f5858114d', 'Michael', '09234245456', 1, 'Wash/Dry/Fold', 1, 'Clothes/Table Napkins/Pillowcase', 1, '5.00', '35.00', '2024-11-16', '2024-11-15', '15:17:25', 'completed', 'delivered'),
(109, 115, 'ord_6736f5858114d', 'Michael', '09234245456', 2, 'Wash/Dry/Press', 1, 'Clothes/Table Napkins/Pillowcase', 1, '5.00', '80.00', '2024-11-16', '2024-11-15', '15:17:25', 'completed', 'delivered'),
(110, 116, 'ord_67370186519fe', '3E', '09123123131', 1, 'Wash/Dry/Fold', 1, 'Clothes/Table Napkins/Pillowcase', 2, '5.00', '35.00', '2024-11-16', '2024-11-15', '16:08:38', 'completed', 'delivered'),
(111, 116, 'ord_67370186519fe', '3E', '09123123131', 2, 'Wash/Dry/Press', 1, 'Clothes/Table Napkins/Pillowcase', 2, '6.00', '80.00', '2024-11-16', '2024-11-15', '16:08:38', 'completed', 'delivered'),
(112, 117, 'ord_673f16563bb22', 'Winnie Pooh', '09898900009', 2, 'Wash/Dry/Press', 2, 'Bedsheet/Table Cloths/Curtain', 4, '7.00', '100.00', '2024-11-22', '2024-11-21', '19:15:34', 'completed', 'delivered'),
(113, 118, 'ord_673f181b96863', 'Sadie Sink', '09989898989', 1, 'Wash/Dry/Fold', 1, 'Clothes/Table Napkins/Pillowcase', 2, '5.00', '35.00', '2024-11-24', '2024-11-21', '19:23:07', 'completed', 'claimed'),
(114, 119, 'ord_673f1ab23d43e', 'Christian Serratos', '09089898909', 1, 'Wash/Dry/Fold', 3, 'Comforter/Bath towel', 5, '8.00', '55.00', '2024-11-22', '2024-11-21', '19:34:10', 'completed', 'pending'),
(115, 120, 'ord_673f26feba0a2', 'Glinda', '09009009909', 1, 'Wash/Dry/Fold', 3, 'Comforter/Bath towel', 7, '5.00', '55.00', '2024-11-24', '2024-11-21', '20:26:38', 'completed', 'pending'),
(116, 121, 'ord_673f27d2690f9', 'Elphaba', '09090890000', 2, 'Wash/Dry/Press', 2, 'Bedsheet/Table Cloths/Curtain', 8, '6.00', '100.00', '2024-11-24', '2024-11-21', '20:30:10', 'completed', 'pending'),
(117, 122, 'ord_673f2cde42407', 'Marcella Santos', '09090000000', 2, 'Wash/Dry/Press', 1, 'Clothes/Table Napkins/Pillowcase', 7, '5.00', '80.00', '0000-00-00', '2024-11-21', '20:51:42', 'active', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `setting_id` int(11) NOT NULL,
  `min_kilos` int(100) NOT NULL,
  `max_kilos` int(100) NOT NULL,
  `delivery_day` int(8) NOT NULL,
  `rush_delivery_day` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`setting_id`, `min_kilos`, `max_kilos`, `delivery_day`, `rush_delivery_day`) VALUES
(1, 5, 20, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `transaction_id` int(11) NOT NULL,
  `request_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `customer_name` varchar(30) DEFAULT NULL,
  `province` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `customer_address` varchar(50) NOT NULL,
  `brgy` varchar(255) NOT NULL,
  `service_option_id` int(100) NOT NULL,
  `service_option_name` varchar(50) NOT NULL,
  `laundry_cycle` enum('Standard','Rush') NOT NULL,
  `total_amount` decimal(65,2) DEFAULT NULL,
  `delivery_fee` decimal(65,2) DEFAULT NULL,
  `rush_fee` decimal(65,2) DEFAULT NULL,
  `amount_tendered` decimal(65,2) DEFAULT NULL,
  `money_change` decimal(65,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`transaction_id`, `request_id`, `customer_id`, `customer_name`, `province`, `city`, `customer_address`, `brgy`, `service_option_id`, `service_option_name`, `laundry_cycle`, `total_amount`, `delivery_fee`, `rush_fee`, `amount_tendered`, `money_change`) VALUES
(5, 9, 24, 'christine', '', '', '', '', 1, 'Delivery', 'Rush', '460.00', '50.00', '25.00', '500.00', '40.00'),
(6, 10, 24, 'christine', '', '', '', '', 1, 'Delivery', 'Rush', '460.00', '50.00', '25.00', '500.00', '40.00'),
(7, 11, 25, 'tintin', '', '', '', '', 1, 'Delivery', 'Rush', '580.00', '50.00', '25.00', '600.00', '20.00'),
(8, 12, 25, 'tintin', '', '', '', '', 1, 'Delivery', 'Rush', '580.00', '50.00', '25.00', '600.00', '20.00'),
(9, 13, 26, 'winnie', '', '', '', '', 1, 'Delivery', 'Rush', '405.00', '50.00', '25.00', '420.00', '15.00'),
(10, 14, 27, 'milky', '', '', '', '', 1, 'Delivery', 'Standard', '650.00', '50.00', '0.00', '700.00', '50.00'),
(11, 18, 29, 'denise', '', '', '', '', 1, 'Delivery', 'Rush', '350.00', '50.00', '25.00', '500.00', '150.00'),
(12, 21, 31, 'nitinit', '', '', '', '', 1, 'Delivery', 'Rush', '405.00', '50.00', '25.00', '500.00', '95.00'),
(13, 22, 18, 'roi', '', '', '', '', 1, 'Delivery', 'Standard', '750.00', '50.00', '0.00', '800.00', '50.00'),
(14, 24, 33, 'nitnit lomi', '', '', '', '', 2, 'Customer Pick-Up', 'Rush', '715.00', '0.00', '25.00', '1000.00', '285.00'),
(15, 25, 33, 'nitnit lomi', '', '', '', '', 2, 'Customer Pick-Up', 'Rush', '715.00', '0.00', '25.00', '1000.00', '285.00'),
(16, 26, 24, 'christine', '', '', 'laguna', '', 1, 'Delivery', 'Rush', '775.00', '50.00', '25.00', '800.00', '25.00'),
(17, 27, 36, 'Christinee', '', '', 'SJDM', '', 1, 'Delivery', 'Rush', '595.00', '50.00', '25.00', '600.00', '5.00'),
(18, 29, 41, 'Liam ', '', '', 'Argentina', '', 1, 'Delivery', 'Rush', '625.00', '50.00', '25.00', '700.00', '75.00'),
(19, 30, 42, 'Kristine', '', '', 'Isabela', '', 2, 'Customer Pick-Up', 'Standard', '350.00', '0.00', '0.00', '500.00', '150.00'),
(20, 31, 42, 'Kristine', '', '', 'Isabela', '', 1, 'Delivery', 'Rush', '1575.00', '50.00', '25.00', '1600.00', '25.00'),
(21, 32, 42, 'Kristine', '', '', 'Isabela', '', 1, 'Delivery', 'Rush', '1575.00', '50.00', '25.00', '1600.00', '25.00'),
(22, 33, 42, 'Kristine', '', '', 'Isabela', '', 1, 'Delivery', 'Rush', '1575.00', '50.00', '25.00', '1600.00', '25.00'),
(23, 34, 42, 'Kristine', '', '', 'Isabela Road', '', 1, 'Delivery', 'Rush', '250.00', '50.00', '25.00', '300.00', '50.00'),
(24, 35, 42, 'Kristine', '', '', 'Isabela Road', '', 1, 'Delivery', 'Rush', '250.00', '50.00', '25.00', '300.00', '50.00'),
(25, 36, 48, 'Cristine', '', '', 'SJDM', '', 1, 'Delivery', 'Rush', '850.00', '50.00', '25.00', '1000.00', '150.00'),
(26, 37, 48, 'Cristine', '', '', 'SJDM', '', 1, 'Delivery', 'Rush', '850.00', '50.00', '25.00', '1000.00', '150.00'),
(27, 38, 49, 'Gwen', '', '', 'sjdm', '', 1, 'Delivery', 'Rush', '675.00', '50.00', '25.00', '700.00', '25.00'),
(28, 41, 52, 'Pink Sweat', '', '', 'Cypress', '', 2, 'Customer Pick-Up', 'Rush', '380.00', '0.00', '50.00', '400.00', '20.00'),
(29, 42, 53, 'adi', '', '', '', '', 2, 'Customer Pick-Up', 'Standard', '175.00', '0.00', '0.00', '500.00', '325.00'),
(30, 43, 54, 'tobi', '', '', 'verde green', '', 1, 'Delivery', 'Rush', '485.00', '50.00', '50.00', '500.00', '15.00'),
(31, 44, 55, 'tiiin', '', '', 'sjdm', '', 1, 'Delivery', 'Rush', '945.00', '50.00', '50.00', '1000.00', '55.00'),
(32, 45, 55, 'tiiin', '', '', 'sjdm', '', 1, 'Delivery', 'Rush', '945.00', '50.00', '50.00', '1000.00', '55.00'),
(33, 46, 56, 'pedro', '', '', 'sjdm', '', 1, 'Delivery', 'Rush', '790.00', '50.00', '50.00', '1000.00', '210.00'),
(34, 47, 56, 'pedro', '', '', 'sjdm', '', 1, 'Delivery', 'Rush', '790.00', '50.00', '50.00', '1000.00', '210.00'),
(35, 50, 59, 'milky', '', '', 'blk 2 lot 16', '', 1, 'Delivery', 'Standard', '690.00', '50.00', '0.00', '1000.00', '310.00'),
(36, 52, 62, 'chitoo', '', '', 'Block 2 Lot 8, Towerville subd.', '', 1, 'Delivery', 'Standard', '295.00', '50.00', '0.00', '500.00', '205.00'),
(37, 53, 62, 'chitoo', '', '', 'Block 2 Lot 8, Towerville subd.', '', 1, 'Delivery', 'Standard', '295.00', '50.00', '0.00', '500.00', '205.00'),
(38, 54, 64, 'Charlize', '', '', 'blk 3 lot 6 skyline', '', 1, 'Delivery', 'Standard', '530.00', '50.00', '0.00', '600.00', '70.00'),
(39, 57, 66, 'Pearl Magbanua', '', '', 'blk 3 lot 6 skyline', '', 1, 'Delivery', 'Standard', '450.00', '50.00', '0.00', '500.00', '50.00'),
(40, 59, 68, 'den', '', '', '', '', 2, 'Customer Pick-Up', 'Rush', '320.00', '0.00', '50.00', '500.00', '180.00'),
(41, 65, 73, 'Tintin Magbanua', '', '', 'Citiville', '', 1, 'Delivery', 'Standard', '225.00', '50.00', '0.00', '1000.00', '775.00'),
(42, 66, 74, 'Melanie ', '', '', 'Heaven subd', '', 1, 'Delivery', 'Rush', '380.00', '50.00', '50.00', '500.00', '120.00'),
(43, 67, 75, 'hello', '', '', 'sarmiento', '', 0, '--Select Option--', 'Rush', '330.00', '0.00', '50.00', '500.00', '170.00'),
(44, 68, 77, 'Dani DC', '', '', 'Orange', '', 2, 'Customer Pick-Up', 'Standard', '360.00', '0.00', '0.00', '500.00', '140.00'),
(45, 70, 79, 'juju beat', '', '', 'verde green 888', '', 1, 'Delivery', 'Standard', '410.00', '50.00', '0.00', '500.00', '90.00'),
(46, 71, 80, 'Dani ela DC', '', '', 'Marcela', '', 1, 'Delivery', 'Standard', '295.00', '50.00', '0.00', '500.00', '205.00'),
(47, 72, 81, 'DANI DS', 'bulacan', 'sjdm', 'CITRUS', 'Muzon South', 1, 'Delivery', 'Rush', '380.00', '50.00', '50.00', '500.00', '120.00'),
(48, 73, 82, 'Gabrielle Dela Cruz', 'bulacan', 'sjdm', 'Citrus', 'Maharlika', 1, 'Delivery', 'Rush', '310.00', '50.00', '50.00', '500.00', '190.00'),
(49, 74, 83, 'Albert Einstein', 'bulacan', 'sjdm', 'California', 'Gumaoc West', 1, 'Delivery', 'Standard', '365.00', '50.00', '0.00', '500.00', '135.00'),
(50, 77, 86, 'Alexia Tuloy', 'bulacan', 'sjdm', 'Sarmiento', 'Gaya-gaya', 1, 'Delivery', 'Standard', '270.00', '25.00', '0.00', '500.00', '230.00'),
(51, 78, 87, 'JC Bieber', '', '', '', '', 1, 'Delivery', 'Standard', '550.00', '50.00', '0.00', '600.00', '50.00'),
(52, 79, 88, 'Maria DB', 'bulacan', 'sjdm', 'Towerville', 'Gaya-gaya', 1, 'Delivery', 'Rush', '475.00', '25.00', '50.00', '500.00', '25.00'),
(53, 80, 89, 'Samuel Valentine', 'bulacan', 'sjdm', 'Sarmiento', 'Muzon Proper', 1, 'Delivery', 'Standard', '320.00', '50.00', '0.00', '500.00', '180.00'),
(54, 81, 90, 'denise', '', '', '', '', 2, 'Customer Pick-Up', 'Standard', '700.00', '0.00', '0.00', '1000.00', '300.00'),
(55, 82, 91, 'sabrina', '', '', '', '', 1, 'Delivery', 'Standard', '770.00', '50.00', '0.00', '1000.00', '230.00'),
(56, 83, 92, 'barry', '', '', '', '', 1, 'Delivery', 'Standard', '330.00', '50.00', '0.00', '500.00', '170.00'),
(57, 84, 93, 'huhu', '', '', '', '', 1, 'Delivery', 'Standard', '530.00', '50.00', '0.00', '0.00', '-530.00'),
(58, 85, 94, 'g wolf', '', '', '', '', 1, 'Delivery', 'Standard', '650.00', '50.00', '0.00', '1000.00', '350.00'),
(59, 86, 95, 'assssfafwe', '', '', '', '', 1, 'Delivery', 'Standard', '530.00', '50.00', '0.00', '1000.00', '470.00'),
(60, 87, 96, 'Manny Regalado', '', '', 'Lemery', '', 1, 'Delivery', 'Standard', '610.00', '50.00', '0.00', '650.00', '40.00'),
(61, 88, 97, 'Mina De', '', '', '', '', 1, 'Delivery', 'Rush', '505.00', '50.00', '50.00', '1000.00', '495.00'),
(62, 89, 98, 'Cattleya Arce', 'bulacan', 'sjdm', 'Lemery street', 'Graceville', 1, 'Delivery', 'Standard', '365.00', '50.00', '0.00', '500.00', '135.00'),
(63, 90, 99, 'Trisha Mae', '', '', '', '', 2, 'Customer Pick-Up', 'Standard', '800.00', '0.00', '0.00', '1000.00', '200.00'),
(64, 91, 100, 'Jolibee Macdonalds', 'bulacan', 'sjdm', 'Ramon Magsaysay Street', 'Gumaoc West', 1, 'Delivery', 'Standard', '705.00', '50.00', '0.00', '800.00', '95.00'),
(65, 92, 100, 'Jolibee Macdonalds', 'bulacan', 'sjdm', 'Ramon Magsaysay Street', 'Gumaoc West', 1, 'Delivery', 'Standard', '705.00', '50.00', '0.00', '800.00', '95.00'),
(66, 93, 101, 'Maria Weibo', 'bulacan', 'sjdm', 'Farm', 'Kaypian', 1, 'Delivery', 'Standard', '260.00', '50.00', '0.00', '500.00', '240.00'),
(67, 94, 102, 'Kim Jisoo', 'bulacan', 'sjdm', 'Pamela street', 'Gaya-gaya', 1, 'Delivery', 'Standard', '235.00', '25.00', '0.00', '500.00', '265.00'),
(68, 96, 104, 'Alexis Brown', '', '', '', '', 2, 'Customer Pick-Up', 'Standard', '560.00', '0.00', '0.00', '1000.00', '440.00'),
(69, 97, 105, 'Mandry Moore', 'bulacan', 'sjdm', 'Sunflower st.', 'Tungkong Mangga', 1, 'Delivery', 'Rush', '355.00', '50.00', '25.00', '500.00', '145.00'),
(70, 98, 106, '2342rthrthgrt', 'bulacan', 'sjdm', 'test1', 'Gaya-gaya', 1, 'Delivery', 'Rush', '275.00', '25.00', '25.00', '275.00', '0.00'),
(71, 99, 107, '234', 'bulacan', 'sjdm', 'test2', 'Gumaoc East', 2, 'Customer Pick-Up', 'Rush', '200.00', '0.00', '25.00', '200.00', '0.00'),
(72, 100, 108, '134', 'bulacan', 'sjdm', '132131', 'Gaya-gaya', 1, 'Delivery', 'Rush', '450.00', '25.00', '25.00', '450.00', '0.00'),
(73, 101, 109, 'Reliza Gatchalian', 'bulacan', 'sjdm', 'Sarmiento', 'Kaypian', 2, 'Customer Pick-Up', 'Rush', '687.50', '0.00', '25.00', '1000.00', '312.50'),
(74, 102, 109, 'Reliza Gatchalian', 'bulacan', 'sjdm', 'Sarmiento', 'Kaypian', 2, 'Customer Pick-Up', 'Rush', '687.50', '0.00', '25.00', '1000.00', '312.50'),
(75, 103, 111, 'patient1', 'bulacan', 'sjdm', 'bsu', 'Kaypian', 2, 'Customer Pick-Up', 'Rush', '525.00', '0.00', '25.00', '600.00', '75.00'),
(76, 104, 112, 'Claire', 'bulacan', 'sjdm', 'bsu', 'Kaypian', 2, 'Customer Pick-Up', 'Rush', '516.35', '0.00', '25.00', '600.00', '83.65'),
(77, 105, 112, 'Claire', 'bulacan', 'sjdm', 'bsu', 'Kaypian', 2, 'Customer Pick-Up', 'Rush', '516.35', '0.00', '25.00', '600.00', '83.65'),
(78, 106, 113, 'leah', 'bulacan', 'sjdm', 'bsu', 'Graceville', 1, 'Delivery', 'Rush', '250.00', '50.00', '25.00', '250.00', '0.00'),
(79, 107, 114, 'Jonathan Demate', 'bulacan', 'sjdm', 'bsu', 'Francisco Homes - Mulawin', 2, 'Customer Pick-Up', 'Rush', '300.00', '0.00', '25.00', '500.00', '200.00'),
(80, 108, 115, 'Michael', 'bulacan', 'sjdm', 'bsu', 'Gaya-gaya', 1, 'Delivery', 'Rush', '625.00', '25.00', '25.00', '700.00', '75.00'),
(81, 109, 115, 'Michael', 'bulacan', 'sjdm', 'bsu', 'Gaya-gaya', 1, 'Delivery', 'Rush', '625.00', '25.00', '25.00', '700.00', '75.00'),
(82, 110, 116, '3E', 'bulacan', 'sjdm', 'BSU', 'Kaypian', 2, 'Customer Pick-Up', 'Rush', '680.00', '0.00', '25.00', '700.00', '20.00'),
(83, 111, 116, '3E', 'bulacan', 'sjdm', 'BSU', 'Kaypian', 2, 'Customer Pick-Up', 'Rush', '680.00', '0.00', '25.00', '700.00', '20.00'),
(84, 112, 117, 'Winnie Pooh', 'bulacan', 'sjdm', 'Citiville', 'Tungkong Mangga', 2, 'Customer Pick-Up', 'Rush', '725.00', '0.00', '25.00', '800.00', '75.00'),
(85, 113, 118, 'Sadie Sink', 'bulacan', 'sjdm', 'Hollywood Street', 'Muzon South', 2, 'Customer Pick-Up', 'Standard', '175.00', '0.00', '0.00', '200.00', '25.00'),
(86, 114, 119, 'Christian Serratos', 'bulacan', 'sjdm', 'Gumamela street', 'Muzon South', 2, 'Customer Pick-Up', 'Rush', '465.00', '0.00', '25.00', '500.00', '35.00'),
(87, 115, 120, 'Glinda', 'bulacan', 'sjdm', 'Oz University heights', 'San Roque', 1, 'Delivery', 'Standard', '325.00', '50.00', '0.00', '500.00', '175.00'),
(88, 116, 121, 'Elphaba', 'bulacan', 'sjdm', 'Oz University Heights\n', 'Kaybanban', 2, 'Customer Pick-Up', 'Standard', '600.00', '0.00', '0.00', '600.00', '0.00');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `user_role` enum('admin','staff') NOT NULL,
  `password` varchar(255) NOT NULL,
  `last_active` datetime DEFAULT current_timestamp(),
  `user_status` enum('Active','Inactive') NOT NULL,
  `question` varchar(255) NOT NULL,
  `answer` varchar(255) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `username`, `first_name`, `last_name`, `user_role`, `password`, `last_active`, `user_status`, `question`, `answer`, `date_created`) VALUES
(1, 'dorisDC', 'Doris', 'Medrano', 'admin', '', '2024-06-28 22:48:05', 'Inactive', '', '', '2024-06-23 10:00:05'),
(42, 'msc43', 'mascaraa', 'haws', 'admin', '', '2024-08-22 16:00:57', 'Inactive', '', '', '2024-08-22 16:00:57'),
(45, 'mascara12', 'mascara', 'cdh', 'admin', '$2y$10$g8v', '2024-08-28 22:22:20', 'Inactive', '', '', '2024-08-28 22:22:20'),
(63, 'MaggieGreene', 'Maggie', 'Greene', 'admin', '$2y$10$gL7C7FnTEX5qAq3Xvh3gZuH9exjSUKK0nd4vxvyPQ3X.aGbsMY05O', '2024-11-15 13:57:56', 'Active', '', '', '2024-10-05 22:23:50'),
(64, 'Ariana Butera', 'Ariana', 'Butera', 'staff', '$2y$10$MIiAilu.k73bYBiczjgzpep3XVNvcGPN6AypViZdp3si4rW5sxhjC', '2024-10-05 22:43:51', 'Inactive', '', '', '2024-10-05 22:43:51'),
(65, 'mkyg', 'milky', 'grande', 'admin', '$2y$10$vAUCI6A//eF5N1r5cHoX..iueBMkB46Hj0YCh8342r8l1TxlihNim', '2024-10-24 01:17:56', 'Inactive', '', '', '2024-10-24 01:17:56'),
(66, 'Tintin', 'Christine', 'Haduca', 'admin', '$2y$10$/e69dBhhIaozerLj28t7eOvrxjmGwyjAl3NIZ7OfbsPxBWi/1lThi', '2024-11-23 16:46:38', 'Active', '', '', '2024-11-03 22:28:15'),
(67, 'Tin', 'Tin', 'Hdc', 'admin', '$2y$10$M1RnI4O8B0L46utW5tXz2uLWid6FILo.HkYEXAgPK3.6L0XnOEJom', '2024-11-06 16:40:52', 'Active', 'What year were you born?', '$2y$10$4mbziMKzzuyNqOmLZMGnIOE14hGHbSWI2/4xx7Qi7lu2TNH8pMSCy', '2024-11-06 16:40:52'),
(79, 'NickiMinaj', 'Nicki', 'Minaj', 'staff', '$2y$10$qISkB5cmAOxFYuAveMMfhO0yNzg/7Edwgtyp9zWuwIcnKuOfLYH3S', '2024-11-15 15:50:45', 'Active', 'What year were you born?', '$2y$10$FHv4urbOcPHue8CwYQn33.7SU3YrIQHcM1mMn8L4EmiZXNhTJTysy', '2024-11-15 11:04:59'),
(90, 'deyn', 'Danielle', 'Dela Cruz', 'admin', '$2y$10$KLgWTsZAgYmatav83HV7o.652sX5xH9aRGZielKVnz5B08BsxlPNm', '2024-11-20 22:18:58', 'Active', 'What year were you born?', '$2y$10$9iVYiHT7D1nuqwMuSixxzej2IwwH3XXEhS0c2mzNW1akU8/to67mu', '2024-11-20 22:18:58');

-- --------------------------------------------------------

--
-- Table structure for table `user_profile`
--

CREATE TABLE `user_profile` (
  `profile_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `user_role` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_profile`
--

INSERT INTO `user_profile` (`profile_id`, `user_id`, `username`, `password`, `user_role`) VALUES
(1, 1, 'dorisDC', '12345678', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `archived_category`
--
ALTER TABLE `archived_category`
  ADD PRIMARY KEY (`archive_id`);

--
-- Indexes for table `archived_customers`
--
ALTER TABLE `archived_customers`
  ADD PRIMARY KEY (`archive_id`);

--
-- Indexes for table `archived_service`
--
ALTER TABLE `archived_service`
  ADD PRIMARY KEY (`archive_id`);

--
-- Indexes for table `archived_users`
--
ALTER TABLE `archived_users`
  ADD PRIMARY KEY (`archive_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `delivery_category`
--
ALTER TABLE `delivery_category`
  ADD PRIMARY KEY (`d_categoryID`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`service_id`);

--
-- Indexes for table `service_category_price`
--
ALTER TABLE `service_category_price`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_options`
--
ALTER TABLE `service_options`
  ADD PRIMARY KEY (`option_id`);

--
-- Indexes for table `service_option_price`
--
ALTER TABLE `service_option_price`
  ADD PRIMARY KEY (`option_price_id`);

--
-- Indexes for table `service_request`
--
ALTER TABLE `service_request`
  ADD PRIMARY KEY (`request_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`setting_id`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`transaction_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `user_profile`
--
ALTER TABLE `user_profile`
  ADD PRIMARY KEY (`profile_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `archived_category`
--
ALTER TABLE `archived_category`
  MODIFY `archive_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `archived_customers`
--
ALTER TABLE `archived_customers`
  MODIFY `archive_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `archived_service`
--
ALTER TABLE `archived_service`
  MODIFY `archive_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `archived_users`
--
ALTER TABLE `archived_users`
  MODIFY `archive_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;

--
-- AUTO_INCREMENT for table `delivery_category`
--
ALTER TABLE `delivery_category`
  MODIFY `d_categoryID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `service`
--
ALTER TABLE `service`
  MODIFY `service_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `service_category_price`
--
ALTER TABLE `service_category_price`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `service_options`
--
ALTER TABLE `service_options`
  MODIFY `option_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `service_option_price`
--
ALTER TABLE `service_option_price`
  MODIFY `option_price_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `service_request`
--
ALTER TABLE `service_request`
  MODIFY `request_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `setting_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `user_profile`
--
ALTER TABLE `user_profile`
  MODIFY `profile_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
