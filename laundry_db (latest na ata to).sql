-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 13, 2024 at 07:54 PM
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
(1, 12, 'Shoes', '2024-11-13 15:35:29');

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
(1, 530, 'sjdhajdha', '67000000000', '', '', '', '', '2024-11-13 15:35:08');

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
(1, 22, 'Shoe Clean', '2024-11-13 15:35:34');

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
(1, 6, 'spotty00', 'spotty', 'spot', 'admin', '2024-11-13 15:34:22');

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
(1, 'Clothes/Table Napkin/Pillowcase'),
(2, 'Bedsheet/Table Cloths/Curtain'),
(3, 'Comforter/Bath towel');

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
(463, 'denise', '11111111111', '', '', '1234', ''),
(464, 'nitnit', '22222222222', '', '', '', ''),
(465, 'serky', '33333333333', '', '', '', ''),
(466, 'Christine Haduca', '55555555555', '', '', '', ''),
(467, 'tobi', '77777777777', '', '', 'berde', ''),
(468, 'menggay', '66666666666', '', '', '', ''),
(476, 'Ariana Grande', '77776666333', '', '', 'L.A', ''),
(494, 'alex', '14141414323', '', '', '', ''),
(495, 'danielle', '67655544322', '', '', '', ''),
(507, 'Denise Villalobos', '10000000000', '', '', 'verde green', ''),
(508, 'Tintin', '90000000009', '', '', '', ''),
(509, 'frank ocean', '50999900000', '', '', '', ''),
(510, 'miguel', '99494583000', '', '', '', ''),
(511, 'roi', '98763900000', '', '', '', ''),
(512, 'ed sheeran', '70000000000', '', '', 'ierieu', ''),
(513, 'tintin palomo', '88000000000', '', '', '', ''),
(514, 'tintin palomo', '88800000000', '', '', '', ''),
(515, 'vanilla', '99900000000', '', '', '', ''),
(516, 'spot', '77000000000', '', '', '', ''),
(517, 'denise villalobos', '74630000000', '', '', '', ''),
(518, 'mitchell', '98000000000', '', '', '', ''),
(519, 'siopao', '10000000999', '', '', '', ''),
(548, 'Tobi', '87622222222', '', '', '', ''),
(553, 'Alexis Aballa', '09876543211', '', '', '', ''),
(554, 'Danielle', '09876543222', '', '', '', ''),
(559, 'Mike Ross', '09875555555', '', '', 'York New', ''),
(562, 'Chandler Bing', '09874276472', 'bulacan', 'sjdm', 'Heaven', 'Ciudad Real'),
(563, 'Nick Jonas', '09838733333', '', '', '', '');

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
  `service_id` int(255) NOT NULL,
  `laundry_service_option` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `service`
--

INSERT INTO `service` (`service_id`, `laundry_service_option`) VALUES
(1, 'Wash/Dry/Fold'),
(2, 'Wash/Dry/Press'),
(3, 'Dry Only');

-- --------------------------------------------------------

--
-- Table structure for table `service_category_price`
--

CREATE TABLE `service_category_price` (
  `id` int(255) NOT NULL,
  `service_id` int(255) NOT NULL,
  `category_id` int(255) NOT NULL,
  `price` decimal(65,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `service_category_price`
--

INSERT INTO `service_category_price` (`id`, `service_id`, `category_id`, `price`) VALUES
(1, 1, 1, 35.00),
(2, 1, 2, 45.00),
(3, 1, 3, 65.00),
(4, 2, 1, 85.00),
(5, 2, 2, 100.00),
(6, 3, 1, 35.00),
(7, 3, 2, 45.00),
(8, 3, 3, 55.00);

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
(3, 'Rush\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `service_option_price`
--

CREATE TABLE `service_option_price` (
  `option_price_id` int(255) NOT NULL,
  `option_id` int(255) NOT NULL,
  `d_categoryID` int(255) NOT NULL,
  `service_option_type` varchar(100) NOT NULL,
  `price` decimal(65,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `service_option_price`
--

INSERT INTO `service_option_price` (`option_price_id`, `option_id`, `d_categoryID`, `service_option_type`, `price`) VALUES
(1, 1, 1, 'Delivery (outside gaya-gaya)', 50.00),
(7, 3, 0, 'Rush', 25.00),
(9, 1, 2, 'Delivery (within gaya-gaya)', 25.00);

-- --------------------------------------------------------

--
-- Table structure for table `service_request`
--

CREATE TABLE `service_request` (
  `request_id` int(11) NOT NULL,
  `customer_id` int(100) NOT NULL,
  `customer_order_id` varchar(255) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `contact_number` varchar(20) NOT NULL,
  `service_id` int(255) NOT NULL,
  `laundry_service_option` varchar(100) NOT NULL,
  `category_id` int(255) NOT NULL,
  `laundry_category_option` varchar(100) NOT NULL,
  `quantity` int(100) NOT NULL,
  `weight` decimal(65,0) NOT NULL,
  `price` decimal(65,2) NOT NULL,
  `request_date` date NOT NULL,
  `service_request_date` date NOT NULL DEFAULT current_timestamp(),
  `service_req_time` time NOT NULL DEFAULT current_timestamp(),
  `order_status` enum('completed','active','cancelled','') NOT NULL DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `service_request`
--

INSERT INTO `service_request` (`request_id`, `customer_id`, `customer_order_id`, `customer_name`, `contact_number`, `service_id`, `laundry_service_option`, `category_id`, `laundry_category_option`, `quantity`, `weight`, `price`, `request_date`, `service_request_date`, `service_req_time`, `order_status`) VALUES
(708, 463, 'order_66f3b40c4d8c4', 'denise', '11111111111', 1, 'Wash/Dry/Fold', 1, 'Clothes/Table Napkin/Pillowcase', 1, 5, 35.00, '2024-09-28', '2024-09-25', '14:56:12', 'completed'),
(709, 463, 'order_66f3b40c4d8c4', 'denise', '11111111111', 1, 'Wash/Dry/Fold', 2, 'Bedsheet/Table Cloths/Curtain', 1, 5, 55.00, '2024-09-28', '2024-09-25', '14:56:12', 'completed'),
(710, 463, 'order_66f3b463e2d5b', 'denise', '11111111111', 1, 'Wash/Dry/Fold', 3, 'Comforter/Bath towel', 1, 7, 65.00, '2024-09-28', '2024-09-25', '14:57:39', 'completed'),
(712, 464, 'order_66f3c0150a006', 'nitnit', '22222222222', 2, 'Wash/Dry/Press', 1, 'Clothes/Table Napkin/Pillowcase', 1, 5, 80.00, '2024-09-28', '2024-09-25', '15:47:33', 'completed'),
(713, 465, 'order_66f3e5d2eea90', 'serky', '33333333333', 3, 'Dry Only', 1, 'Clothes/Table Napkin/Pillowcase', 1, 5, 35.00, '2024-09-27', '2024-09-25', '18:28:34', 'completed'),
(714, 465, 'order_66f3e5d2eea90', 'serky', '33333333333', 3, 'Dry Only', 2, 'Bedsheet/Table Cloths/Curtain', 1, 5, 45.00, '2024-09-27', '2024-09-25', '18:28:34', 'completed'),
(715, 466, 'order_66f3e62c41f16', 'Christine Haduca', '55555555555', 2, 'Wash/Dry/Press', 1, 'Clothes/Table Napkin/Pillowcase', 1, 6, 80.00, '2024-09-28', '2024-09-25', '18:30:04', 'completed'),
(716, 467, 'order_66f518e8b4011', 'tobi', '77777777777', 1, 'Wash/Dry/Fold', 3, 'Comforter/Bath towel', 1, 7, 65.00, '2024-09-29', '2024-09-26', '16:18:48', 'completed'),
(717, 468, 'order_66f552fb7f201', 'menggay', '66666666666', 3, 'Dry Only', 1, 'Clothes/Table Napkin/Pillowcase', 1, 6, 35.00, '2024-09-28', '2024-09-26', '20:26:35', 'completed'),
(725, 476, 'order_66f56ed712f51', 'Ariana Grande', '77776666333', 1, 'Wash/Dry/Fold', 1, 'Clothes/Table Napkin/Pillowcase', 1, 7, 35.00, '2024-09-28', '2024-09-26', '22:25:27', 'completed'),
(743, 494, 'order_66f69ea45208f', 'alex', '14141414323', 1, 'Wash/Dry/Fold', 2, 'Bedsheet/Table Cloths/Curtain', 1, 5, 55.00, '2024-09-30', '2024-09-27', '20:01:40', 'completed'),
(744, 495, 'order_66f69eefec107', 'danielle', '67655544322', 2, 'Wash/Dry/Press', 1, 'Clothes/Table Napkin/Pillowcase', 2, 5, 80.00, '2024-09-30', '2024-09-27', '20:02:55', 'completed'),
(757, 507, 'order_66f6a4e454866', 'Denise Villalobos', '10000000000', 1, 'Wash/Dry/Fold', 1, 'Clothes/Table Napkin/Pillowcase', 1, 5, 55.00, '2024-09-29', '2024-09-27', '20:28:20', 'completed'),
(758, 508, 'order_66f6a58bcb35b', 'Tintin', '90000000009', 2, 'Wash/Dry/Press', 1, 'Clothes/Table Napkin/Pillowcase', 1, 5, 80.00, '2024-09-29', '2024-09-27', '20:31:07', 'completed'),
(759, 509, 'ord_6721e1e6f3c30', 'frank ocean', '50999900000', 1, 'Wash/Dry/Fold', 2, 'Bedsheet/Table Cloths/Curtain', 1, 5, 55.00, '0000-00-00', '2024-10-30', '15:36:07', 'active'),
(760, 511, 'ord_6724e8f6e3571', 'roi', '98763900000', 2, 'Wash/Dry/Press', 2, 'Bedsheet/Table Cloths/Curtain', 1, 5, 100.00, '2024-11-04', '2024-11-01', '22:43:02', 'completed'),
(761, 512, 'ord_6724eb7f1bb39', 'ed sheeran', '70000000000', 1, 'Wash/Dry/Fold', 3, 'Comforter/Bath towel', 1, 6, 65.00, '2024-11-03', '2024-11-01', '22:53:51', 'completed'),
(762, 513, 'ord_6724f3af380f2', 'tintin palomo', '88000000000', 1, 'Wash/Dry/Fold', 1, 'Clothes/Table Napkin/Pillowcase', 1, 6, 35.00, '0000-00-00', '2024-11-01', '23:28:47', 'cancelled'),
(763, 513, 'ord_6724f492b0df7', 'tintin palomo', '88800000000', 2, 'Wash/Dry/Press', 1, 'Clothes/Table Napkin/Pillowcase', 1, 6, 80.00, '0000-00-00', '2024-11-01', '23:32:34', 'cancelled'),
(764, 515, 'ord_6724f544ac7f0', 'vanilla', '99900000000', 1, 'Wash/Dry/Fold', 1, 'Clothes/Table Napkin/Pillowcase', 2, 6, 35.00, '0000-00-00', '2024-11-01', '23:35:32', 'cancelled'),
(765, 516, 'ord_6724f632c43a5', 'spot', '77000000000', 1, 'Wash/Dry/Fold', 1, 'Clothes/Table Napkin/Pillowcase', 1, 7, 35.00, '2024-11-03', '2024-11-01', '23:39:30', 'completed'),
(766, 507, 'ord_6728c2d64a4a6', 'denise villalobos', '74630000000', 2, 'Wash/Dry/Press', 1, 'Clothes/Table Napkin/Pillowcase', 1, 6, 80.00, '2024-11-05', '2024-11-04', '20:49:26', 'completed'),
(767, 518, 'ord_6728e0ce5710a', 'mitchell', '98000000000', 2, 'Wash/Dry/Press', 1, 'Clothes/Table Napkin/Pillowcase', 2, 8, 85.00, '2024-11-07', '2024-11-04', '22:57:18', 'completed'),
(768, 519, 'ord_6728e1288fc67', 'siopao', '10000000999', 1, 'Wash/Dry/Fold', 1, 'Clothes/Table Napkin/Pillowcase', 1, 5, 35.00, '0000-00-00', '2024-11-04', '22:58:48', 'cancelled'),
(769, 519, 'ord_6728e1288fc67', 'siopao', '10000000999', 2, 'Wash/Dry/Press', 1, 'Clothes/Table Napkin/Pillowcase', 1, 5, 85.00, '0000-00-00', '2024-11-04', '22:58:48', 'cancelled'),
(780, 463, 'ord_672a3f098b673', 'denise', '11111111111', 2, 'Wash/Dry/Press', 1, 'Clothes/Table Napkin/Pillowcase', 1, 7, 85.00, '2024-11-08', '2024-11-05', '23:51:37', 'completed'),
(781, 464, 'ord_672a3fc84cdad', 'nitnit', '22222222222', 1, 'Wash/Dry/Fold', 1, 'Clothes/Table Napkin/Pillowcase', 1, 6, 35.00, '2024-11-06', '2024-11-05', '23:54:48', 'completed'),
(783, 464, 'ord_672b008dcee32', 'nitnit', '22222222222', 2, 'Wash/Dry/Press', 1, 'Clothes/Table Napkin/Pillowcase', 1, 6, 85.00, '2024-11-09', '2024-11-06', '13:37:17', 'completed'),
(801, 463, 'ord_67343ff521f53', 'denise', '11111111111', 1, 'Wash/Dry/Fold', 2, 'Bedsheet/Table Cloths/Curtain', 1, 5, 45.00, '0000-00-00', '2024-11-13', '13:58:13', 'cancelled'),
(802, 463, 'ord_673444eaeaac8', 'denise', '11111111111', 2, 'Wash/Dry/Press', 1, 'Clothes/Table Napkin/Pillowcase', 2, 8, 85.00, '0000-00-00', '2024-11-13', '14:19:22', 'cancelled'),
(803, 463, 'ord_67344b3c66bbc', 'denise ', '11111111111', 2, 'Wash/Dry/Press', 1, 'Clothes/Table Napkin/Pillowcase', 1, 8, 85.00, '2024-11-14', '2024-11-13', '14:46:20', 'completed'),
(805, 467, 'ord_6734519d53664', 'Tobi', '87622222222', 2, 'Wash/Dry/Press', 1, 'Clothes/Table Napkin/Pillowcase', 1, 8, 85.00, '2024-11-16', '2024-11-13', '15:13:33', 'completed'),
(811, 553, 'ord_6734d80c6b957', 'Alexis Aballa', '09876543211', 1, 'Wash/Dry/Fold', 2, 'Bedsheet/Table Cloths/Curtain', 1, 6, 45.00, '0000-00-00', '2024-11-14', '00:47:08', 'active'),
(812, 554, 'ord_6734da36e8fb5', 'Danielle', '09876543222', 1, 'Wash/Dry/Fold', 3, 'Comforter/Bath towel', 1, 5, 65.00, '0000-00-00', '2024-11-14', '00:56:22', 'cancelled'),
(813, 554, 'ord_6734db21075e0', 'Danielle ', '09876543222', 1, 'Wash/Dry/Fold', 2, 'Bedsheet/Table Cloths/Curtain', 2, 7, 45.00, '0000-00-00', '2024-11-14', '01:00:17', 'cancelled'),
(818, 559, 'ord_6734e12cd0f45', 'Mike Ross', '09875555555', 1, 'Wash/Dry/Fold', 2, 'Bedsheet/Table Cloths/Curtain', 2, 7, 45.00, '2024-11-14', '2024-11-14', '01:26:04', 'completed'),
(821, 562, 'ord_6734e43c51b30', 'Chandler Bing', '09874276472', 1, 'Wash/Dry/Fold', 1, 'Clothes/Table Napkin/Pillowcase', 1, 7, 35.00, '2024-11-14', '2024-11-14', '01:39:08', 'completed'),
(822, 563, 'ord_6734e778defb6', 'Nick Jonas', '09838733333', 2, 'Wash/Dry/Press', 1, 'Clothes/Table Napkin/Pillowcase', 2, 7, 85.00, '2024-11-16', '2024-11-14', '01:52:56', 'completed');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `setting_id` int(100) NOT NULL,
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
  `transaction_id` int(100) NOT NULL,
  `request_id` int(100) NOT NULL,
  `customer_id` int(100) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `province` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `customer_address` varchar(255) NOT NULL,
  `brgy` varchar(255) NOT NULL,
  `service_option_id` int(255) NOT NULL,
  `service_option_name` varchar(100) NOT NULL,
  `laundry_cycle` enum('Standard','Rush') NOT NULL,
  `total_amount` decimal(65,2) NOT NULL,
  `delivery_fee` decimal(65,2) NOT NULL,
  `rush_fee` decimal(65,2) NOT NULL,
  `amount_tendered` decimal(65,2) NOT NULL,
  `money_change` decimal(65,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`transaction_id`, `request_id`, `customer_id`, `customer_name`, `province`, `city`, `customer_address`, `brgy`, `service_option_id`, `service_option_name`, `laundry_cycle`, `total_amount`, `delivery_fee`, `rush_fee`, `amount_tendered`, `money_change`) VALUES
(482, 708, 463, 'denise', '', '', 'qqq', '', 1, 'Delivery', 'Rush', 525.00, 50.00, 25.00, 600.00, 75.00),
(483, 709, 463, 'denise', '', '', 'qqq', '', 1, 'Delivery', 'Rush', 525.00, 50.00, 25.00, 600.00, 75.00),
(484, 710, 463, 'denise', '', '', '', '', 2, 'Customer Pick-Up', 'Standard', 455.00, 0.00, 0.00, 500.00, 45.00),
(486, 712, 464, 'nitnit', '', '', '', '', 2, 'Customer Pick-Up', 'Standard', 400.00, 0.00, 0.00, 500.00, 100.00),
(487, 713, 465, 'serky', '', '', '', '', 1, 'Delivery', 'Rush', 475.00, 50.00, 25.00, 500.00, 25.00),
(488, 714, 465, 'serky', '', '', '', '', 1, 'Delivery', 'Rush', 475.00, 50.00, 25.00, 500.00, 25.00),
(489, 715, 466, 'Christine Haduca', '', '', '', '', 1, 'Delivery', 'Standard', 530.00, 50.00, 0.00, 1000.00, 470.00),
(490, 716, 467, 'tobi', '', '', '', '', 2, 'Customer Pick-Up', 'Standard', 455.00, 0.00, 0.00, 500.00, 45.00),
(491, 717, 468, 'menggay', '', '', '', '', 1, 'Delivery', 'Rush', 285.00, 50.00, 25.00, 300.00, 15.00),
(498, 725, 476, 'Ariana Grande', '', '', 'L.A', '', 1, 'Delivery', 'Rush', 320.00, 50.00, 25.00, 400.00, 80.00),
(516, 743, 494, 'alex', '', '', '', '', 1, 'Delivery', 'Standard', 325.00, 50.00, 0.00, 500.00, 175.00),
(517, 744, 495, 'danielle', '', '', '', '', 1, 'Delivery', 'Standard', 450.00, 50.00, 0.00, 500.00, 50.00),
(530, 757, 507, 'Denise Villalobos', '', '', '', '', 1, 'Delivery', 'Rush', 350.00, 50.00, 25.00, 500.00, 150.00),
(531, 758, 508, 'Tintin', '', '', '', '', 1, 'Delivery', 'Rush', 475.00, 50.00, 25.00, 500.00, 25.00),
(532, 760, 511, 'roi', '', '', '', '', 2, 'Customer Pick-Up', 'Standard', 500.00, 0.00, 0.00, 500.00, 0.00),
(533, 761, 512, 'ed sheeran', '', '', 'ierieu', '', 1, 'Delivery', 'Rush', 465.00, 50.00, 25.00, 500.00, 35.00),
(534, 765, 516, 'spot', '', '', '', '', 1, 'Delivery', 'Rush', 320.00, 50.00, 25.00, 500.00, 180.00),
(535, 766, 507, 'denise villalobos', '', '', 'verde green', '', 2, 'Customer Pick-Up', 'Rush', 505.00, 0.00, 25.00, 0.00, -505.00),
(536, 767, 518, 'mitchell', '', '', '', '', 1, 'Delivery', 'Standard', 711.30, 50.00, 0.00, 1000.00, 288.70),
(544, 780, 463, 'denise', '', '', '', '', 2, 'Customer Pick-Up', 'Standard', 595.00, 0.00, 0.00, 1000.00, 405.00),
(545, 781, 464, 'nitnit', '', '', '', '', 2, 'Customer Pick-Up', 'Rush', 235.00, 0.00, 25.00, 500.00, 265.00),
(546, 783, 464, 'nitnit', '', '', '', '', 2, 'Customer Pick-Up', 'Standard', 510.00, 0.00, 0.00, 1000.00, 490.00),
(560, 805, 467, 'Tobi', 'bulacan', 'sjdm', 'berde', 'Gaya-gaya', 1, 'Delivery', 'Standard', 705.00, 25.00, 0.00, 1000.00, 295.00),
(564, 818, 559, 'Mike Ross', 'bulacan', 'sjdm', 'York New', 'Gaya-gaya', 1, 'Delivery', 'Rush', 365.00, 25.00, 25.00, 500.00, 135.00),
(565, 821, 562, 'Chandler Bing', 'bulacan', 'sjdm', 'Heaven', 'Ciudad Real', 1, 'Delivery', 'Rush', 320.00, 50.00, 25.00, 500.00, 180.00),
(566, 822, 563, 'Nick Jonas', '', '', '', '', 2, 'Customer Pick-Up', 'Standard', 595.00, 0.00, 0.00, 1000.00, 405.00);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `last_active` datetime NOT NULL DEFAULT current_timestamp(),
  `user_role` enum('admin','staff') NOT NULL,
  `user_status` enum('Active','Inactive') NOT NULL,
  `question` varchar(255) NOT NULL,
  `answer` varchar(255) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `first_name`, `last_name`, `password`, `last_active`, `user_role`, `user_status`, `question`, `answer`, `date_created`) VALUES
(7, 'tyler555', 'tyler', 'the creator', '$2y$10$B0eYKrrS8bTJWGW/N59SK..dUmXn/5JOYl5snHsyd3zIEsWlOcfcm', '2024-10-30 15:53:25', 'staff', 'Active', 'year', '$2y$10$umZv9CLm471AzvtUGcgJS.LLSiMr3bIHRtmKmlhPStMkzJPTNd1LG', '2024-10-30 15:53:25'),
(8, 'tintinP', 'tintin', 'haduca', '$2y$10$jfAr8po81Nvn4qVW5lpCm.0J.eCX6lOds4XuqGcDDzOuIbc0l41a.', '2024-10-30 16:33:19', 'admin', 'Active', 'What was your favorite food as a child?', '$2y$10$uA0pCQpcS3C6WNrMWcLlbu5vXioq8LiBe3dPxNJUrpYmy4e8zNq9i', '2024-10-30 16:33:19'),
(9, 'denise555', 'denise', 'villa', '$2y$10$u6VY0CNS0JZyfoST341YaODwCXhEWebBt871ENTt29LwovOpQJ98C', '2024-11-14 02:47:55', 'admin', 'Active', 'In what province were you born?', '$2y$10$OnWtlYcYYtHPKCwbanZHmeVJFr9jYFhExs2eLLZLIkbhSPfuYRm2q', '2024-11-14 02:47:55');

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
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `unique_customer` (`customer_name`,`contact_number`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `service_id` (`service_id`,`category_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `service_options`
--
ALTER TABLE `service_options`
  ADD PRIMARY KEY (`option_id`);

--
-- Indexes for table `service_option_price`
--
ALTER TABLE `service_option_price`
  ADD PRIMARY KEY (`option_price_id`),
  ADD KEY `option_id` (`option_id`),
  ADD KEY `d_categoryID` (`d_categoryID`);

--
-- Indexes for table `service_request`
--
ALTER TABLE `service_request`
  ADD PRIMARY KEY (`request_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `service_id` (`service_id`,`category_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`setting_id`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `request_id` (`request_id`,`customer_id`),
  ADD KEY `service_option_id` (`service_option_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `archived_category`
--
ALTER TABLE `archived_category`
  MODIFY `archive_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `archived_customers`
--
ALTER TABLE `archived_customers`
  MODIFY `archive_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `archived_service`
--
ALTER TABLE `archived_service`
  MODIFY `archive_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `archived_users`
--
ALTER TABLE `archived_users`
  MODIFY `archive_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=564;

--
-- AUTO_INCREMENT for table `delivery_category`
--
ALTER TABLE `delivery_category`
  MODIFY `d_categoryID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `service`
--
ALTER TABLE `service`
  MODIFY `service_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `service_category_price`
--
ALTER TABLE `service_category_price`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `service_options`
--
ALTER TABLE `service_options`
  MODIFY `option_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `service_option_price`
--
ALTER TABLE `service_option_price`
  MODIFY `option_price_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `service_request`
--
ALTER TABLE `service_request`
  MODIFY `request_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=823;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `setting_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `transaction_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=567;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `service_category_price`
--
ALTER TABLE `service_category_price`
  ADD CONSTRAINT `service_category_price_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `service_category_price_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `service` (`service_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `service_option_price`
--
ALTER TABLE `service_option_price`
  ADD CONSTRAINT `service_option_price_ibfk_1` FOREIGN KEY (`option_id`) REFERENCES `service_options` (`option_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `service_request`
--
ALTER TABLE `service_request`
  ADD CONSTRAINT `service_request_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `service_request_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `service` (`service_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `service_request_ibfk_3` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`request_id`) REFERENCES `service_request` (`request_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
