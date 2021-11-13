-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 24, 2021 at 08:45 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 7.4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `servicetop`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wallet` decimal(28,8) NOT NULL,
  `verification_code` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `username`, `email`, `password`, `image`, `wallet`, `verification_code`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@gmail.com', '$2y$10$EYVIVbr7OdHUv9XBUt161ucLdiYFt180.3bpFuljYcnT6BtFDCCQS', '6131052ac0b9c1630602538.jpeg', '500.00000000', NULL, '7xdmxeys0JSb1oVGP0H5UmXOW47jMLHZtMBgOY8Z8prmxJM1ZFcEERHaCz16', '2021-08-03 11:42:27', '2021-09-24 07:46:39');

-- --------------------------------------------------------

--
-- Table structure for table `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_categories`
--

INSERT INTO `blog_categories` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'PC Repairing', 'pc-repairing', '2021-09-09 19:01:06', '2021-09-09 19:01:06'),
(2, 'Cleaning', 'cleaning', '2021-09-09 19:01:57', '2021-09-09 19:01:57');

-- --------------------------------------------------------

--
-- Table structure for table `blog_comments`
--

CREATE TABLE `blog_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `blog_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `disabled` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=> pending, 1=> approved\r\n',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `trx` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `service_id` bigint(20) UNSIGNED NOT NULL,
  `service_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `hours` int(11) DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `start_time` time NOT NULL,
  `end_time` time DEFAULT NULL,
  `amount` decimal(8,2) NOT NULL,
  `charge` decimal(28,8) DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_accepted` int(11) NOT NULL DEFAULT 0,
  `payment_confirmed` tinyint(1) NOT NULL DEFAULT 0,
  `payment_type` int(11) NOT NULL DEFAULT 1,
  `payment_proof` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_completed` tinyint(1) NOT NULL DEFAULT 0,
  `job_end` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1=> job end, 2=> requested for job end',
  `btc_wallet` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `btc_amount` decimal(28,8) DEFAULT NULL,
  `btc_trx` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `trx`, `user_id`, `service_id`, `service_date`, `hours`, `end_date`, `start_time`, `end_time`, `amount`, `charge`, `message`, `location`, `is_accepted`, `payment_confirmed`, `payment_type`, `payment_proof`, `is_completed`, `job_end`, `btc_wallet`, `btc_amount`, `btc_trx`, `created_at`, `updated_at`) VALUES
(1, 'W0RWCU4JIA0C6O2', 5, 2, '2021-09-23 10:58:00', 2, '2021-09-11 02:00:00', '12:00:00', '02:00:00', '1000.00', NULL, 'test', 'NewYork', 1, 0, 1, NULL, 0, 1, '3AQXm1UhY3gSYQF64vQQVCRanL43u6Rtm6', '0.02292000', 'CPFI42CZ87XT6LWGNY6YD8QHXF', '2021-09-09 19:57:37', '2021-09-23 00:58:00'),
(2, 'PM6IMQOLP0FNZFX', 5, 8, '2021-09-22 11:09:13', 2, '2021-09-12 02:00:00', '12:00:00', '02:00:00', '1000.00', '2.00000000', 'test', 'Boston', 1, 1, 0, '{\"details\":\"test\",\"transaction_number\":\"test\",\"test\":{\"file\":\"613ad77eda9101631246206.jpg\",\"type\":\"file\"}}', 0, 0, NULL, NULL, NULL, '2021-09-10 03:42:55', '2021-09-22 01:09:13'),
(3, 'W7HSFN8UW08FC0O', 5, 7, '2021-09-22 11:07:33', 5, '2021-09-18 05:00:00', '12:00:00', '05:00:00', '2500.00', NULL, 'test', 'Boston', 1, 0, 1, NULL, 1, 1, NULL, NULL, NULL, '2021-09-13 14:23:55', '2021-09-13 14:28:46'),
(4, '6BTMNGJ2SVWIWA4', 5, 16, '2021-09-24 17:48:42', 3, '2021-09-26 03:00:00', '01:30:00', '04:30:00', '1500.00', NULL, 'come quickly', 'Wangaratta', 1, 1, 1, NULL, 1, 2, NULL, NULL, NULL, '2021-09-24 07:43:59', '2021-09-24 07:48:42');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'PC Repairing', 'pc-repairing', '613a352f140251631204655.jpg', 1, '2021-09-09 16:24:15', '2021-09-24 07:18:44'),
(3, 'Plumbing', 'plumbing', '613ad12723b881631244583.jpg', 1, '2021-09-09 17:28:48', '2021-09-24 07:17:57'),
(4, 'Home Repairing', 'home-repairing', '613ad1622bdc51631244642.jpg', 1, '2021-09-09 17:28:48', '2021-09-24 07:18:08'),
(5, 'Car Repair', 'car-repair', '613ad178d0a6e1631244664.jpg', 1, '2021-09-09 17:28:48', '2021-09-24 07:18:17'),
(6, 'Cleaning', 'cleaning', '613f9c62cb56e1631558754.jpg', 1, '2021-09-09 17:28:48', '2021-09-24 07:18:29'),
(10, 'Electrician', 'electrician', '613f900fbd8351631555599.jpg', 1, '2021-09-13 17:53:20', '2021-09-24 07:17:41');

-- --------------------------------------------------------

--
-- Table structure for table `chats`
--

CREATE TABLE `chats` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `provider_id` bigint(20) UNSIGNED DEFAULT NULL,
  `booking_id` bigint(20) NOT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sender` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chats`
--

INSERT INTO `chats` (`id`, `user_id`, `provider_id`, `booking_id`, `message`, `sender`, `created_at`, `updated_at`) VALUES
(1, 5, 1, 1, 'Please come early', 'user', '2021-09-09 19:58:09', '2021-09-09 19:58:09'),
(2, 5, 1, 1, 'ok i will', 'provider', '2021-09-09 20:00:21', '2021-09-09 20:00:21'),
(3, 5, 4, 2, 'Come First', 'user', '2021-09-15 04:44:41', '2021-09-15 04:44:41'),
(4, 5, 4, 4, 'Please come early', 'user', '2021-09-24 07:44:32', '2021-09-24 07:44:32');

-- --------------------------------------------------------

--
-- Table structure for table `cookie_consents`
--

CREATE TABLE `cookie_consents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `allow_modal` tinyint(1) NOT NULL DEFAULT 0,
  `button_text` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cookie_text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cookie_consents`
--

INSERT INTO `cookie_consents` (`id`, `allow_modal`, `button_text`, `cookie_text`, `created_at`, `updated_at`) VALUES
(1, 1, 'Accept', 'This website uses cookies to ensure you get the best experience on our website.', '2021-08-06 03:27:09', '2021-09-15 21:25:36');

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `template` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `meaning` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `name`, `subject`, `template`, `meaning`, `created_at`, `updated_at`) VALUES
(1, 'PASSWORD_RESET', 'Password Reset Code', '<p><b>Hi {username},\r\n</b></p><p>\r\nHere is your password reset code : {code}\r\n</p><p>\r\nThanks,\r\n</p><p>\r\n{sent_from}</p>', '{\"username\":\"Email Receiver Name\", \"code\" : \"Email Verification Code\", \"sent_from\" : \"Email Sent from\"}', NULL, '2021-09-05 19:45:59'),
(2, 'PAYMENT_SUCCESSFULL', 'PAYMENT SUCCESSFULL', '<p><b>Hi {username},</b></p><p><b>Your Payment for {service} has been successfully paid.</b></p><p><b>Transaction Number : {trx}</b></p><p><b>Total Amount : {amount} {currency}</b></p><p><b><br></b></p><p><b>\r\n</b></p><p>\r\n\r\n</p><p>\r\nThanks,\r\n</p><p>\r\n{sent_from}</p>', '{\"username\":\"Email Receiver Name\",\"trx\":\"Transaction Number\",\"amount\":\"Payment Amount\",\"service\":\"Service Name\",\"currency\":\"Currency for Payment\",\"sent_from\" : \"Email Sent from\"}', NULL, '2021-08-18 09:59:46'),
(3, 'PAYMENT_RECEIVED', 'PAYMENT RECEIVED', '<p><b>Hi {username},</b></p><p><b>You Received Payment for {service} has been successfully paid.</b></p><p><b>Transaction Number : {trx}</b></p><p><b>Total Amount : {amount} {currency}</b></p><p><b><br></b></p><p><b>\r\n</b></p><p>\r\n\r\n</p><p>\r\nThanks,\r\n</p><p>\r\n{sent_from}</p>', '{\"username\":\"Email Receiver Name\",\"trx\":\"Transaction Number\",\"amount\":\"Payment Amount\",\"service\":\"Service Name\",\"currency\":\"Currency for Payment\",\"sent_from\" : \"Email Sent from\"}', NULL, '2021-08-19 07:08:28'),
(4, 'VERIFY_EMAIL', 'Verify Your Email', '<p><b>Hi {username},</b></p><p><b>Your verification code is {code}</b></p><p><b><br></b></p><p><b>\r\n</b></p><p>\r\n\r\n</p><p>\r\nThanks,\r\n</p><p>\r\n{sent_from}</p>', '{\"username\":\"Email Receiver Name\",\"code\":\"Email Verification Code\",\"sent_from\" : \"Email Sent from\"}', NULL, '2021-08-20 20:27:15'),
(5, 'BOOKING_SERVICE', 'Service booking', '<p><b>Hi {username},</b></p><p><b>Your service is booked by {user}</b></p><p><b>Service Name: {service}</b></p><p><b>Transaction Id : {trx}</b></p><p><b>&nbsp;</b></p><p><b><br></b></p><p><b>\r\n</b></p><p>\r\n\r\n</p><p>\r\nThanks,\r\n</p><p>\r\n{sent_from}</p>', '{\"username\":\"Email Receiver Name\",\"trx\":\"Transaction for booking\",\"user\":\"Booking User\",\"service\":\"Booking Service\",\"sent_from\" : \"Email Sent from\"}', NULL, '2021-08-29 11:29:38'),
(6, 'BOOKING_ACCEPTED', 'Service booking accepted', '<p><b>Hi {username},</b></p><p><b>Your service is accepted by {user}</b></p><p><b>Service Name: {service}</b></p><p><b>Transaction Id : {trx}</b></p><p><b>&nbsp;</b></p><p><b><br></b></p><p><b>\n</b></p><p>\n\n</p><p>\nThanks,\n</p><p>\n{sent_from}</p>', '{\"username\":\"Email Receiver Name\",\"trx\":\"Transaction for booking\",\"user\":\"Accepted Provider\"\r\n,\"service\":\"Booking Service\",\"sent_from\" : \"Email Sent from\"}', NULL, '2021-08-21 11:34:32'),
(7, 'WITHDRAW_BALANCE', 'Withdraw balance', '<p><b>Hi {username},</b></p><p><b>A withdraw Request form {user}</b></p><p><b>Withdraw Method Name: {method}</b></p><p><b>Withdraw Amount: {amount}</b></p><p><b>Transaction Id : {trx}</b></p><p><b>&nbsp;</b></p><p><b><br></b></p><p><b>\r\n</b></p><p>\r\n\r\n</p><p>\r\nThanks,\r\n</p><p>\r\n{sent_from}</p>', '{\"username\":\"Email Receiver Name\",\"trx\":\"Transaction for withdraw\",\"user\":\"withdrawal user\"\r\n,\"amount\":\"Withdraw Amount\",\"sent_from\" : \"Email Sent from\",\"method\":\"Withdraw Method Name\"}', NULL, '2021-08-22 20:18:59'),
(8, 'WITHDRAW_ACCEPTED', 'Withdraw confirmed', '<p><b>Hi {username},</b></p><p><b>Your withdraw request of {amount} {currency} accepted successfully</b></p><p><b>Withdraw Method Name: {method}</b></p><p><b>Transaction Id : {trx}</b></p><p><b>&nbsp;</b></p><p><b><br></b></p><p><b>\r\n</b></p><p>\r\n\r\n</p><p>\r\nThanks,\r\n</p><p>\r\n{sent_from}</p>', '{\"username\":\"Email Receiver Name\",\"trx\":\"Transaction for withdraw\",\"amount\":\"Withdraw Amount\",\"sent_from\" : \"Email Sent from\",\"method\":\"Withdraw Method Name\",\"currency\":\"Withdraw Currency\"}', NULL, '2021-08-23 10:29:51'),
(9, 'WITHDRAW_REJECTED', 'Withdraw rejected', '<p><b>Hi {username},</b></p><p><b>A withdraw Request of {amount} {currency} has been rejected</b></p><p><b>Reason of Rejection : {reason}</b></p><p><b>Withdraw Method Name: {method}</b></p><p><b>Transaction Id : {trx}</b></p><p><b>&nbsp;</b></p><p><b><br></b></p><p><b>\r\n</b></p><p>\r\n\r\n</p><p>\r\nThanks,\r\n</p><p>\r\n{sent_from}</p>', '{\"username\":\"Email Receiver Name\",\"trx\":\"Transaction for withdraw\",\"amount\":\"Withdraw Amount\",\"sent_from\" : \"Email Sent from\",\"method\":\"Withdraw Method Name\",\"currency\":\"Withdraw Currency\",\"reason\":\"Withdraw Rejection Reason\"}', NULL, '2021-08-23 10:40:28'),
(10, 'SERVICE_COMPLETE', 'Service completed', '<p><b>Hi {username},</b></p><p><b>Service Marked as completed.</b></p><p><b>service name :{service}</b></p><p><b>trx:{trx}</b></p><p><b>&nbsp;</b></p><p><b><br></b></p><p><b>\r\n</b></p><p>\r\n\r\n</p><p>\r\nThanks,\r\n</p><p>\r\n{sent_from}</p>', '{\"username\":\"Email Receiver Name\",\"trx\":\"Transaction Number for bookin\",\"service\":\"Service Name\",\"sent_from\" : \"Email Sent from\"}', NULL, '2021-08-23 20:43:27'),
(11, 'SEND_MESSAGE', 'send message', '<p><b>Hi {username},</b></p><p><b>You have a Message From {user}&nbsp;</b></p><p><b>Message : {message}</b></p><p><b>&nbsp;</b></p><p><b><br></b></p><p><b>\r\n</b></p><p>\r\n\r\n</p><p>\r\nThanks,\r\n</p><p>\r\n{sent_from}</p>', '{\"username\":\"Email Receiver Name\",\"message\":\"send Message\",\"user\":\"Sender\",\"sent_from\" : \"Email Sent from\"}', NULL, '2021-08-27 18:27:57'),
(12, 'PAYMENT_CONFIRMED', 'payment confirmed', '<p><b>Hi {username},</b></p><p><b>Your Payment for {service} is accepted</b></p><p><b>Amount : {amount} {currency}</b></p><p><b>Charge : {charge} {currency}</b></p><p><b>Booking Id : {trx}</b></p><p><b>&nbsp;</b></p><p><b><br></b></p><p><b>\r\n</b></p><p>\r\n\r\n</p><p>\r\nThanks,\r\n</p><p>\r\n{sent_from}</p>', '{\"username\":\"Email Receiver Name\",\"amount\":\"Payment Amount\",\"charge\":\"Payment Charge\",\"service\":\"Service Name\",\"trx\":\"Transaction ID\",\"currency\":\"Payment Currency\",\"sent_from\" : \"Email Sent from\"}', NULL, '2021-08-29 11:28:08'),
(13, 'PAYMENT_REJECTED', 'payment rejected', '<p><b>Hi {username},</b></p><p><b>Your payement is rejected&nbsp;</b></p><p><b>Pay for {service}</b></p><p><b>charge : {charge}</b></p><p><b>amount : {amount}</b></p><p><b>Booking Id : {trx}</b></p><p><b>&nbsp;</b></p><p><b><br></b></p><p><b>\r\n</b></p><p>\r\n\r\n</p><p>\r\nThanks,\r\n</p><p>\r\n{sent_from}</p>', '{\"username\":\"Email Receiver Name\",\"amount\":\"Payment Amount\",\"charge\":\"Payment Charge\",\"service\":\"Service Name\",\"trx\":\"Transaction ID\",\"currency\":\"Payment Currency\",\"sent_from\" : \"Email Sent from\"}', NULL, '2021-08-29 11:26:39'),
(14, 'BOOKING_REJECTED', 'Service booking rejected', '<p><b>Hi {username},</b></p><p><b>Your service is rejected by {user}</b></p><p><b>Service Name: {service}</b></p><p><b>Booking Id : {booking_id}</b></p><p><b>&nbsp;</b></p><p><b><br></b></p><p><b>\r\n</b></p><p>\r\n\r\n</p><p>\r\nThanks,\r\n</p><p>\r\n{sent_from}</p>', '{\"username\":\"Email Receiver Name\",\"booking_id\":\"Booking Id\",\"user\":\"Accepted Provider\"\r\n,\"service\":\"Booking Service\",\"sent_from\" : \"Email Sent from\"}', NULL, '2021-08-26 16:49:41'),
(16, 'JOB_CONTRACT_END_REQUEST', 'You have requested to end a service job', '<p><b>Hi {username},\r\n</b></p><p><b>You Have Requested to end a job contract.</b></p><p><b>Request from : {provider}</b></p><p><b>Requested Job Service name : {service}</b></p><p><b>Booking Id : {booking_id}</b></p><p><b><br></b></p><p><b>Thanks,\r\n</b></p><p><b>\r\n{sent_from}</b></p>', '{\"username\":\"Email Receiver Name\",\"booking_id\":\"Booking Id\",\"provider\":\"Service Provider\"\n,\"service\":\"Booking Service\",\"sent_from\" : \"Email Sent from\"}', NULL, '2021-08-26 19:03:31'),
(17, 'END_CONTRACT', 'Service Job end', '<p><b>Hi {username},\r\n</b></p><p>Service job ended by Admin</p><p>Service Name : {service}</p><p>Booking Id : {booking_id}</p><p><b>Thanks,\r\n</b></p><p><b>\r\n{sent_from}</b></p>', '{\"username\":\"Email Receiver Name\",\"booking_id\":\"Booking Id\",\"service\":\"Booking Service\",\"sent_from\" : \"Email Sent from\"}', NULL, '2021-08-26 19:15:40'),
(18, 'SERVICE_APPROVAL', 'Service Approved', '<p><b>Hi {username},\r\n</b></p><p>Your Service Has been approved</p><p>Service Name : {service}</p><p><b>Thanks,\r\n</b></p><p><b>\r\n{sent_from}</b></p>', '{\"username\":\"Email Receiver Name\",\"service\":\"Service Name\",\"sent_from\" : \"Email Sent from\"}', NULL, '2021-08-29 11:24:18'),
(19, 'SERVICE_REJECTED', 'Service rejected', '<p><b>Hi {username},\r\n</b></p><p>Your Service Has been rejected</p><p>Service Name : {service}</p><p>\r\nReason of Rejection : {reason}\r\n</p><p><b>Thanks,\r\n</b></p><p><b>\r\n{sent_from}</b></p>', '{\"username\":\"Email Receiver Name\",\"service\":\"Service Name\",\"reason\":\"Reason of reject\",\"sent_from\" : \"Email Sent from\"}', NULL, '2021-08-29 11:23:59');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faq_categories`
--

CREATE TABLE `faq_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faq_categories`
--

INSERT INTO `faq_categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Withdraw', '2021-09-09 19:02:14', '2021-09-09 19:02:14'),
(2, 'Payment', '2021-09-09 19:02:26', '2021-09-09 19:02:26');

-- --------------------------------------------------------

--
-- Table structure for table `gateways`
--

CREATE TABLE `gateways` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `gateway_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gateway_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gateway_parameters` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `gateway_type` tinyint(1) NOT NULL COMMENT '0=> manual, 1=> autometic',
  `user_proof_param` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `btc_wallet` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `btc_amount` decimal(28,8) DEFAULT NULL,
  `rate` decimal(28,8) NOT NULL,
  `charge` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gateways`
--

INSERT INTO `gateways` (`id`, `gateway_name`, `gateway_image`, `gateway_parameters`, `gateway_type`, `user_proof_param`, `btc_wallet`, `btc_amount`, `rate`, `charge`, `status`, `created_at`, `updated_at`) VALUES
(2, 'paypal', '6126ac7600fe01629924470.png', '{\"gateway_currency\":\"USD\",\"paypal_client_id\":\"AQtCVGlS22wqYBGWPHW1a6aAVuUcFwSOWzUGoRvsbth2vUNNxrekowLwrYRwIYLMAetedRPu3hKMO57C\",\"paypal_client_secret\":\"EMksMmpKq5xfnJP3So7fVTyjghVV4mtUa70qsXbNAiw3nBF3ir6ENXZasxT-3cPDZ8ZXJX0DaggQFptv\",\"mode\":\"sandbox\"}', 1, NULL, NULL, NULL, '1.00000000', '0.00000000', 1, '2021-08-07 03:15:07', '2021-09-13 19:46:55'),
(3, 'stripe', '6126ac7c9f6401629924476.png', '{\"gateway_currency\":\"USD\",\"stripe_client_id\":\"pk_test_51JPpg8Ep0youpBChKWG5eyrUnj7weSPl3FlIaU8unUrqOfoA0aAFGJq6biVmcZBjKdD7Jf7HXmH6DKaxjtJsWn9200QGc9BTns\",\"stripe_client_secret\":\"sk_test_51JPpg8Ep0youpBChPXaj1T1fXk5zhCTg8A8hCCF5sfrFm7C0n7pIYfGoMptc1xqoFb5Mnro56LB3jn21JsTvnGtP00ZTxKIaJ8\"}', 1, NULL, NULL, NULL, '1.00000000', '5.00000000', 1, '2021-08-07 03:29:38', '2021-09-13 19:46:47'),
(4, 'bank', '612e7f689548e1630437224.jpg', '{\"name\":\"AJ International Bank Ltd.\",\"account_number\":\"124568\",\"routing_number\":\"1234568\",\"branch_name\":\"NV Road, NYC\",\"gateway_currency\":\"USD\"}', 0, '[{\"field_name\":\"details\",\"type\":\"textarea\",\"validation\":\"required\"},{\"field_name\":\"Transaction Number\",\"type\":\"text\",\"validation\":\"required\"},{\"field_name\":\"test\",\"type\":\"file\",\"validation\":\"required\"}]', NULL, NULL, '1.00000000', '2.00000000', 1, '2021-08-07 06:20:30', '2021-09-14 07:33:59'),
(5, 'coin', '614cbbe56122d1632418789.jpg', '{\"gateway_currency\":\"USD\",\"public_key\":\"b21aa27fd107f676e9f39d3e815b17964e36a87027587e3349c4922bc37095ef\",\"private_key\":\"00768014045E5b3a2ac2afA842c2c492534F4a6BD76051038e3B2BD53815fc08\",\"merchant_id\":\"35f09ca0721beeda7f1644ed4104178a\"}', 1, NULL, NULL, NULL, '1.00000000', '0.00000000', 1, '2021-09-22 23:09:52', '2021-09-23 07:39:49');

-- --------------------------------------------------------

--
-- Table structure for table `general_settings`
--

CREATE TABLE `general_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sitename` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `commission` decimal(5,2) NOT NULL DEFAULT 0.00,
  `site_direction` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ltr',
  `email_method` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smtp_config` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `site_currency` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_icon` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_reg` tinyint(1) NOT NULL DEFAULT 1,
  `blog_comment` tinyint(1) NOT NULL DEFAULT 1,
  `login_page` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `service_default_image` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secondary_color` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_from` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `allow_recaptcha` tinyint(1) NOT NULL DEFAULT 0,
  `recaptcha_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recaptcha_secret` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twak_allow` tinyint(1) NOT NULL DEFAULT 0,
  `twak_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `preloader_status` tinyint(1) NOT NULL,
  `preloader_image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `analytics_key` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `analytics_status` tinyint(1) NOT NULL,
  `fb_app_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `general_settings`
--

INSERT INTO `general_settings` (`id`, `sitename`, `commission`, `site_direction`, `email_method`, `smtp_config`, `site_currency`, `currency_icon`, `user_reg`, `blog_comment`, `login_page`, `logo`, `default_image`, `service_default_image`, `icon`, `color`, `secondary_color`, `email_from`, `allow_recaptcha`, `recaptcha_key`, `recaptcha_secret`, `twak_allow`, `twak_key`, `seo_description`, `preloader_status`, `preloader_image`, `analytics_key`, `analytics_status`, `fb_app_key`, `created_at`, `updated_at`) VALUES
(1, 'ServiceTop', '20.00', 'ltr', 'smtp', '{\"smtp_host\":\"smtp.mailtrap.io\",\"smtp_username\":\"bd87ab8e06d372\",\"smtp_password\":\"a8dc90bbbbe358\",\"smtp_port\":\"587\",\"smtp_encryption\":\"tls\"}', 'USD', '$', 1, 0, '{\"login_image\":\"613f2a06120da1631529478.jpg\",\"overlay\":\"Good Morning\"}', 'logo.png', 'default_image.jpg', 'service_default_image.jpg', 'icon.png', '#5F3AFC', '#F1634C', 'websolutionus@example.com', 1, '6Lc9gjUbAAAAAN3s1TaTyOrE1hDdCUfg5ErMP9cy', '6Lc9gjUbAAAAABUslqC9XkznczQBeMU5dQSsvfoM', 1, '6124fa49d6e7610a49b1c136/1fds73c17', 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Eligendi, corrupti.', 0, '613ae4374f89d1631249463.gif', 'test', 1, NULL, '2021-08-06 02:53:27', '2021-09-24 07:30:20');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `service_id` bigint(20) UNSIGNED NOT NULL,
  `location` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2021_08_03_120625_create_admins_table', 1),
(5, '2021_08_04_095130_create_pages_table', 2),
(6, '2021_08_04_181444_create_section_data_table', 3),
(8, '2021_08_05_165324_create_general_settings_table', 4),
(9, '2021_08_06_091618_create_cookie_consents_table', 5),
(10, '2021_08_06_105518_create_gateways_table', 6),
(11, '2021_08_08_100346_create_email_templates_table', 7),
(12, '2021_08_10_193823_create_subscribes_table', 8),
(13, '2021_08_11_063021_create_categories_table', 9),
(14, '2021_08_11_155740_create_services_table', 10),
(15, '2021_08_11_192839_create_schedules_table', 11),
(16, '2021_08_11_192852_create_locations_table', 11),
(17, '2021_08_15_195530_create_blog_comments_table', 12),
(18, '2021_08_17_115858_create_reviews_table', 13),
(19, '2021_08_17_194018_create_bookings_table', 14),
(21, '2021_08_18_155158_create_transactions_table', 15),
(22, '2021_08_22_004156_create_withdraw_gateways_table', 16),
(23, '2021_08_22_023059_create_withdraw_logs_table', 16),
(24, '2021_08_24_133013_create_chats_table', 17),
(25, '2021_08_26_143127_create_languages_table', 18);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `page_order` int(11) NOT NULL,
  `sections` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_section_data` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_dropdown` tinyint(1) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `name`, `slug`, `page_order`, `sections`, `custom_section_data`, `seo_description`, `is_dropdown`, `status`, `created_at`, `updated_at`) VALUES
(1, 'home', 'home', 1, '[\"service\",\"counter\",\"category\",\"testimonial\",\"team\",\"blog\",\"subscribe\",\"brand\"]', NULL, 'Home Page', 0, 1, '2021-09-09 16:22:03', '2021-09-14 06:57:18'),
(2, 'About us', 'about-us', 2, '[\"about\",\"subscribe\",\"brand\"]', NULL, 'About', 0, 1, '2021-09-09 19:45:19', '2021-09-14 06:56:15'),
(4, 'FAQ', 'faq', 4, '[\"faq\",\"subscribe\",\"brand\"]', NULL, 'FAQ', 0, 1, '2021-09-11 16:51:35', '2021-09-24 07:37:11'),
(5, 'Contact Us', 'contact-us', 6, '[\"contact\"]', NULL, 'Contact Us', 0, 1, '2021-09-11 16:59:09', '2021-09-14 06:55:44'),
(6, 'Blog', 'blog', 5, '[\"blog\"]', NULL, 'Blog', 0, 1, '2021-09-11 17:41:12', '2021-09-14 06:56:01'),
(7, 'Experts', 'experts', 3, '[\"team\"]', NULL, 'Experts', 0, 1, '2021-09-13 06:57:11', '2021-09-24 07:36:52');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `service_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `review` int(11) NOT NULL,
  `review_message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `service_id`, `user_id`, `review`, `review_message`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 5, 5, 'very good', 1, '2021-09-09 20:07:31', '2021-09-09 20:07:31'),
(2, 7, 5, 1, 'poor', 1, '2021-09-16 10:46:54', '2021-09-16 10:46:54');

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

CREATE TABLE `schedules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `week_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `schedules`
--

INSERT INTO `schedules` (`id`, `user_id`, `week_name`, `start_time`, `end_time`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Saturday', '2021-09-13 00:00:00', '2021-09-13 04:00:00', 1, '2021-09-09 17:31:10', '2021-09-13 14:17:01'),
(2, 1, 'Sunday', '2021-09-09 00:00:00', '2021-09-09 07:00:00', 1, '2021-09-09 17:32:04', '2021-09-09 17:32:04'),
(3, 2, 'Saturday', '2021-09-09 00:00:00', '2021-09-09 05:30:00', 1, '2021-09-09 17:36:52', '2021-09-09 17:36:52'),
(4, 2, 'Sunday', '2021-09-09 10:30:00', '2021-09-09 23:00:00', 1, '2021-09-09 17:37:03', '2021-09-09 17:37:03'),
(5, 3, 'Saturday', '2021-09-09 00:00:00', '2021-09-09 05:30:00', 1, '2021-09-09 17:40:30', '2021-09-09 17:40:30'),
(6, 3, 'Sunday', '2021-09-09 00:00:00', '2021-09-09 01:30:00', 1, '2021-09-09 17:40:37', '2021-09-09 17:40:37'),
(7, 4, 'Saturday', '2021-09-10 00:00:00', '2021-09-10 04:00:00', 1, '2021-09-09 18:32:25', '2021-09-09 18:32:25'),
(8, 4, 'Sunday', '2021-09-10 00:00:00', '2021-09-10 05:00:00', 1, '2021-09-09 18:32:34', '2021-09-09 18:32:34'),
(9, 1, 'Wednesday', '2021-09-13 01:30:00', '2021-09-13 05:30:00', 1, '2021-09-13 14:16:39', '2021-09-13 14:16:39'),
(10, 4, 'Thursday', '2021-09-13 00:00:00', '2021-09-13 00:30:00', 1, '2021-09-13 16:41:25', '2021-09-13 16:41:25');

-- --------------------------------------------------------

--
-- Table structure for table `section_data`
--

CREATE TABLE `section_data` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `section_data`
--

INSERT INTO `section_data` (`id`, `key`, `data`, `category`, `created_at`, `updated_at`) VALUES
(1, 'service.content', '{\"title\":\"How This Works\",\"sub_title\":\"Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.\"}', NULL, '2021-09-09 18:37:35', '2021-09-09 18:37:35'),
(2, 'service.element', '{\"image\":\"613a554b769471631212875.png\",\"title\":\"Find An Expert\",\"details\":\"Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has.\"}', '', '2021-09-09 18:41:15', '2021-09-09 18:41:15'),
(3, 'service.element', '{\"image\":\"613a55662c7c61631212902.png\",\"title\":\"Create Account\",\"details\":\"Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has.\"}', '', '2021-09-09 18:41:42', '2021-09-09 18:41:42'),
(4, 'service.element', '{\"image\":\"613a558162d791631212929.png\",\"title\":\"Get Service\",\"details\":\"Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has.\"}', '', '2021-09-09 18:42:09', '2021-09-09 18:42:09'),
(5, 'banner.content', '{\"image\":\"613a55c9011ad1631213001.png\",\"title\":\"Search Experts\",\"sub_title\":\"Find out the best experts around your location and hire them immediately\"}', NULL, '2021-09-09 18:43:21', '2021-09-09 18:43:21'),
(6, 'counter.content', '{\"backgroud\":\"613a56eb3c39a1631213291.png\"}', NULL, '2021-09-09 18:45:04', '2021-09-09 18:48:11'),
(7, 'counter.element', '{\"icon\":\"fas fa-user-cog\",\"counter\":\"20\",\"title\":\"Service Providers\"}', '', '2021-09-09 18:46:26', '2021-09-09 18:46:26'),
(8, 'counter.element', '{\"icon\":\"fas fa-user-lock\",\"counter\":\"100\",\"title\":\"Happy Customers\"}', '', '2021-09-09 18:46:59', '2021-09-09 18:46:59'),
(9, 'counter.element', '{\"icon\":\"fas fa-bullhorn\",\"counter\":\"300\",\"title\":\"Successful Jobs\"}', '', '2021-09-09 18:47:21', '2021-09-09 18:47:21'),
(10, 'counter.element', '{\"icon\":\"fas fa-list-alt\",\"counter\":\"10\",\"title\":\"Item Categories\"}', '', '2021-09-09 18:47:43', '2021-09-09 18:47:43'),
(11, 'category.content', '{\"title\":\"Expert Categories\",\"button_text\":\"View All Categories\",\"sub_title\":\"Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.\"}', NULL, '2021-09-09 18:49:14', '2021-09-09 18:49:14'),
(12, 'testimonial.content', '{\"image\":\"613a59043f8901631213828.png\",\"title\":\"Customer Feedbacks\",\"sub_heading\":\"Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.\"}', NULL, '2021-09-09 18:57:08', '2021-09-09 18:57:08'),
(13, 'testimonial.element', '{\"client_image\":\"613a592ab2ead1631213866.jpg\",\"quote\":\"Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.\",\"name\":\"Jhon Doe\",\"designation\":\"Google Inc\"}', '', '2021-09-09 18:57:46', '2021-09-09 18:57:46'),
(14, 'testimonial.element', '{\"client_image\":\"613a59419a94a1631213889.jpg\",\"quote\":\"Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.\",\"name\":\"Jhon Doe\",\"designation\":\"Google Inc\"}', '', '2021-09-09 18:58:09', '2021-09-09 18:58:09'),
(15, 'team.content', '{\"title\":\"Featured Experts\",\"sub_title\":\"Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.\"}', NULL, '2021-09-09 18:58:55', '2021-09-09 18:58:55'),
(16, 'blog.content', '{\"heading\":\"Our Blog\",\"sub_heading\":\"Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.\"}', NULL, '2021-09-09 18:59:37', '2021-09-09 18:59:37'),
(17, 'blog.element', '{\"category\":\"2\",\"heading\":\"Post Title Here\",\"tag\":\"Tips\",\"seo_description\":\"Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.\",\"short_description\":\"Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.\",\"details\":\"<p>Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.<br><\\/p>\",\"image\":\"613a5aa9ebacb1631214249.jpg\"}', '2', '2021-09-09 19:04:10', '2021-09-14 20:24:24'),
(18, 'blog.element', '{\"category\":\"2\",\"heading\":\"How to Clean Hardwood\",\"tag\":\"Cleaner\",\"seo_description\":\"Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.\",\"short_description\":\"Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.\",\"details\":\"<p>Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.<br><\\/p>\",\"image\":\"613a5acf972ab1631214287.jpg\"}', '2', '2021-09-09 19:04:47', '2021-09-14 20:24:10'),
(19, 'blog.element', '{\"category\":\"2\",\"heading\":\"Lorem ipsum dolor sit amet\",\"tag\":\"Tips\",\"seo_description\":\"Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.\",\"short_description\":\"Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.\",\"details\":\"<p>Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.<br><\\/p>\",\"image\":\"613a5ae9155771631214313.jpg\"}', '2', '2021-09-09 19:05:13', '2021-09-14 20:23:57'),
(20, 'blog.element', '{\"category\":\"1\",\"heading\":\"How to Clean Your Glass Top\",\"tag\":\"Tips\",\"seo_description\":\"Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.\",\"short_description\":\"Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.\",\"details\":\"<div><span style=\\\"font-size:16px;\\\">Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.<\\/span><span style=\\\"text-align:left;font-size:16px;\\\">Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.<\\/span><span style=\\\"text-align:left;font-size:16px;\\\">Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.<\\/span><span style=\\\"font-size:16px;\\\">Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.<\\/span><\\/div>\",\"image\":\"613a5b64c83cc1631214436.jpg\"}', '1', '2021-09-09 19:07:16', '2021-09-14 20:23:46'),
(21, 'blog.element', '{\"category\":\"1\",\"heading\":\"Clean Hardwood Floors\",\"tag\":\"Tips\",\"seo_description\":\"Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.\",\"short_description\":\"Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.\",\"details\":\"<p>Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.<br><\\/p>\",\"image\":\"613a5b912794d1631214481.jpg\"}', '1', '2021-09-09 19:08:01', '2021-09-14 20:23:34'),
(22, 'blog.element', '{\"category\":\"1\",\"heading\":\"When You Hire A Cleaner\",\"tag\":\"Tips\",\"seo_description\":\"Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.\",\"short_description\":\"Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.\",\"details\":\"<p>Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.<br><\\/p>\",\"image\":\"613a5c1f3c9de1631214623.jpg\"}', '1', '2021-09-09 19:10:23', '2021-09-14 20:23:23'),
(23, 'subscribe.content', '{\"image\":\"613a5ccab4a7d1631214794.jpg\",\"title\":\"Subscribe For Our Newsletter\",\"button_text\":\"Subscribe\",\"sub_title\":\"Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.\"}', NULL, '2021-09-09 19:13:14', '2021-09-09 19:13:14'),
(24, 'brand.element', '{\"image\":\"613adebf0bd401631248063.jpg\"}', '', '2021-09-09 19:20:44', '2021-09-10 04:27:43'),
(25, 'brand.element', '{\"image\":\"613a5e984a7f61631215256.jpg\"}', '', '2021-09-09 19:20:56', '2021-09-09 19:20:56'),
(26, 'brand.element', '{\"image\":\"613ade86185131631248006.jpg\"}', '', '2021-09-09 19:27:31', '2021-09-10 04:26:46'),
(27, 'policy.element', '{\"page_name\":\"Terms & Conditions\",\"slug\":\"terms-conditions\",\"details\":\"<p><span style=\\\"color: rgb(79, 91, 109); font-family: Rubik, sans-serif; font-size: 16px; letter-spacing: 0.16px; text-align: center;\\\">Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.<\\/span><span style=\\\"color: rgb(79, 91, 109); font-family: Rubik, sans-serif; font-size: 16px; letter-spacing: 0.16px; text-align: center;\\\">Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.<\\/span><span style=\\\"color: rgb(79, 91, 109); font-family: Rubik, sans-serif; font-size: 16px; letter-spacing: 0.16px; text-align: center;\\\">Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.<\\/span><span style=\\\"color: rgb(79, 91, 109); font-family: Rubik, sans-serif; font-size: 16px; letter-spacing: 0.16px; text-align: center;\\\">Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.<\\/span><span style=\\\"color: rgb(79, 91, 109); font-family: Rubik, sans-serif; font-size: 16px; letter-spacing: 0.16px; text-align: center;\\\">Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.<\\/span><span style=\\\"color: rgb(79, 91, 109); font-family: Rubik, sans-serif; font-size: 16px; letter-spacing: 0.16px; text-align: center;\\\">Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.<\\/span><span style=\\\"color: rgb(79, 91, 109); font-family: Rubik, sans-serif; font-size: 16px; letter-spacing: 0.16px; text-align: center;\\\">Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.<\\/span><span style=\\\"color: rgb(79, 91, 109); font-family: Rubik, sans-serif; font-size: 16px; letter-spacing: 0.16px; text-align: center;\\\">Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.<\\/span><span style=\\\"color: rgb(79, 91, 109); font-family: Rubik, sans-serif; font-size: 16px; letter-spacing: 0.16px; text-align: center;\\\">Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.<\\/span><span style=\\\"color: rgb(79, 91, 109); font-family: Rubik, sans-serif; font-size: 16px; letter-spacing: 0.16px; text-align: center;\\\">Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.<\\/span><span style=\\\"color: rgb(79, 91, 109); font-family: Rubik, sans-serif; font-size: 16px; letter-spacing: 0.16px; text-align: center;\\\">Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.<\\/span><span style=\\\"color: rgb(79, 91, 109); font-family: Rubik, sans-serif; font-size: 16px; letter-spacing: 0.16px; text-align: center;\\\">Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.<\\/span><span style=\\\"color: rgb(79, 91, 109); font-family: Rubik, sans-serif; font-size: 16px; letter-spacing: 0.16px; text-align: center;\\\">Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.<\\/span><span style=\\\"color: rgb(79, 91, 109); font-family: Rubik, sans-serif; font-size: 16px; letter-spacing: 0.16px; text-align: center;\\\">Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.<\\/span><span style=\\\"color: rgb(79, 91, 109); font-family: Rubik, sans-serif; font-size: 16px; letter-spacing: 0.16px; text-align: center;\\\">Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.<\\/span><span style=\\\"color: rgb(79, 91, 109); font-family: Rubik, sans-serif; font-size: 16px; letter-spacing: 0.16px; text-align: center;\\\">Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.<\\/span><span style=\\\"color: rgb(79, 91, 109); font-family: Rubik, sans-serif; font-size: 16px; letter-spacing: 0.16px; text-align: center;\\\">Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.<\\/span><span style=\\\"color: rgb(79, 91, 109); font-family: Rubik, sans-serif; font-size: 16px; letter-spacing: 0.16px; text-align: center;\\\">Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.<\\/span><br><\\/p>\"}', '', '2021-09-09 19:39:24', '2021-09-09 19:39:24'),
(28, 'policy.element', '{\"page_name\":\"Privacy Policy\",\"slug\":\"privacy-policy\",\"details\":\"<p><span style=\\\"color: rgb(79, 91, 109); font-family: Rubik, sans-serif; font-size: 16px; letter-spacing: 0.16px; text-align: center;\\\">Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.<\\/span><span style=\\\"color: rgb(79, 91, 109); font-family: Rubik, sans-serif; font-size: 16px; letter-spacing: 0.16px; text-align: center;\\\">Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.<\\/span><span style=\\\"color: rgb(79, 91, 109); font-family: Rubik, sans-serif; font-size: 16px; letter-spacing: 0.16px; text-align: center;\\\">Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.<\\/span><span style=\\\"color: rgb(79, 91, 109); font-family: Rubik, sans-serif; font-size: 16px; letter-spacing: 0.16px; text-align: center;\\\">Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.<\\/span><span style=\\\"color: rgb(79, 91, 109); font-family: Rubik, sans-serif; font-size: 16px; letter-spacing: 0.16px; text-align: center;\\\">Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.<\\/span><span style=\\\"color: rgb(79, 91, 109); font-family: Rubik, sans-serif; font-size: 16px; letter-spacing: 0.16px; text-align: center;\\\">Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.<\\/span><span style=\\\"color: rgb(79, 91, 109); font-family: Rubik, sans-serif; font-size: 16px; letter-spacing: 0.16px; text-align: center;\\\">Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.<\\/span><span style=\\\"color: rgb(79, 91, 109); font-family: Rubik, sans-serif; font-size: 16px; letter-spacing: 0.16px; text-align: center;\\\">Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.<\\/span><span style=\\\"color: rgb(79, 91, 109); font-family: Rubik, sans-serif; font-size: 16px; letter-spacing: 0.16px; text-align: center;\\\">Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.<\\/span><span style=\\\"color: rgb(79, 91, 109); font-family: Rubik, sans-serif; font-size: 16px; letter-spacing: 0.16px; text-align: center;\\\">Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.<\\/span><span style=\\\"color: rgb(79, 91, 109); font-family: Rubik, sans-serif; font-size: 16px; letter-spacing: 0.16px; text-align: center;\\\">Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.<\\/span><span style=\\\"color: rgb(79, 91, 109); font-family: Rubik, sans-serif; font-size: 16px; letter-spacing: 0.16px; text-align: center;\\\">Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.<\\/span><span style=\\\"color: rgb(79, 91, 109); font-family: Rubik, sans-serif; font-size: 16px; letter-spacing: 0.16px; text-align: center;\\\">Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.<\\/span><span style=\\\"color: rgb(79, 91, 109); font-family: Rubik, sans-serif; font-size: 16px; letter-spacing: 0.16px; text-align: center;\\\">Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.<\\/span><span style=\\\"color: rgb(79, 91, 109); font-family: Rubik, sans-serif; font-size: 16px; letter-spacing: 0.16px; text-align: center;\\\">Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.<\\/span><span style=\\\"color: rgb(79, 91, 109); font-family: Rubik, sans-serif; font-size: 16px; letter-spacing: 0.16px; text-align: center;\\\">Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.<\\/span><span style=\\\"color: rgb(79, 91, 109); font-family: Rubik, sans-serif; font-size: 16px; letter-spacing: 0.16px; text-align: center;\\\">Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.<\\/span><span style=\\\"color: rgb(79, 91, 109); font-family: Rubik, sans-serif; font-size: 16px; letter-spacing: 0.16px; text-align: center;\\\">Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.<\\/span><span style=\\\"color: rgb(79, 91, 109); font-family: Rubik, sans-serif; font-size: 16px; letter-spacing: 0.16px; text-align: center;\\\">Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.<\\/span><span style=\\\"color: rgb(79, 91, 109); font-family: Rubik, sans-serif; font-size: 16px; letter-spacing: 0.16px; text-align: center;\\\">Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.<\\/span><br><\\/p>\"}', '', '2021-09-09 19:39:34', '2021-09-09 19:39:34'),
(29, 'footer.content', '{\"copyright\":\"Copyright \\u00a9 servicePro. All Right Reserved.\",\"short_description\":\"Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has.\",\"image\":\"613a649e4ab2c1631216798.png\"}', NULL, '2021-09-09 19:40:58', '2021-09-09 19:50:06'),
(30, 'contact.content', '{\"title\":\"Get In Touch\",\"sub_title\":\"Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.\",\"phone\":\"123456789\",\"email\":\"test@test.com\",\"address\":\"house-4, road-5, Sydney\",\"button_text\":\"Send Message\",\"map_link\":\"https:\\/\\/www.google.com\\/maps\\/embed?pb=!1m18!1m12!1m3!1d387193.30604913796!2d-74.25987358395489!3d40.69714939974002!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c24fa5d33f083b%3A0xc80b8f06e177fe62!2sNew%20York%2C%20NY%2C%20USA!5e0!3m2!1sen!2sbd!4v1599585647433!5m2!1sen!2sbd\"}', NULL, '2021-09-09 19:42:01', '2021-09-09 19:42:01'),
(31, 'social.element', '{\"social_icon\":\"fab fa-facebook-f\",\"social_link\":\"www.facebook.com\"}', '', '2021-09-09 19:42:36', '2021-09-09 19:42:36'),
(32, 'social.element', '{\"social_icon\":\"fab fa-twitter\",\"social_link\":\"http:\\/\\/www.twitter.com\"}', '', '2021-09-09 19:42:42', '2021-09-09 19:42:42'),
(33, 'social.element', '{\"social_icon\":\"fab fa-linkedin-in\",\"social_link\":\"http:\\/\\/www.linkedin.com\"}', '', '2021-09-09 19:42:47', '2021-09-09 19:42:47'),
(34, 'faq.element', '{\"category\":\"2\",\"question\":\"How to make Payment for Service\",\"answer\":\"<p><span style=\\\"color: rgb(75, 75, 75); font-family: Rubik, sans-serif; font-size: 16px;\\\">Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.<\\/span><span style=\\\"color: rgb(75, 75, 75); font-family: Rubik, sans-serif; font-size: 16px;\\\">Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.<\\/span><span style=\\\"color: rgb(75, 75, 75); font-family: Rubik, sans-serif; font-size: 16px;\\\">Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.<\\/span><br><\\/p>\"}', '2', '2021-09-09 19:43:17', '2021-09-09 19:43:17'),
(35, 'faq.element', '{\"category\":\"2\",\"question\":\"Everybody Gets a Dashboard\",\"answer\":\"<p><span style=\\\"color: rgb(75, 75, 75); font-family: Rubik, sans-serif; font-size: 16px;\\\">Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.<\\/span><span style=\\\"color: rgb(75, 75, 75); font-family: Rubik, sans-serif; font-size: 16px;\\\">Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.<\\/span><span style=\\\"color: rgb(75, 75, 75); font-family: Rubik, sans-serif; font-size: 16px;\\\">Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.<\\/span><br><\\/p>\"}', '2', '2021-09-09 19:43:28', '2021-09-09 19:43:28'),
(36, 'faq.element', '{\"category\":\"1\",\"question\":\"How to Withdraw\",\"answer\":\"<p><span style=\\\"color: rgb(75, 75, 75); font-family: Rubik, sans-serif; font-size: 16px;\\\">Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.<\\/span><span style=\\\"color: rgb(75, 75, 75); font-family: Rubik, sans-serif; font-size: 16px;\\\">Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.<\\/span><span style=\\\"color: rgb(75, 75, 75); font-family: Rubik, sans-serif; font-size: 16px;\\\">Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.<\\/span><br><\\/p>\"}', '1', '2021-09-09 19:43:37', '2021-09-09 19:43:37'),
(37, 'faq.element', '{\"category\":\"1\",\"question\":\"How to Withdraw\",\"answer\":\"<p><span style=\\\"color: rgb(75, 75, 75); font-family: Rubik, sans-serif; font-size: 16px;\\\">Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.<\\/span><span style=\\\"color: rgb(75, 75, 75); font-family: Rubik, sans-serif; font-size: 16px;\\\">Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.<\\/span><span style=\\\"color: rgb(75, 75, 75); font-family: Rubik, sans-serif; font-size: 16px;\\\">Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.<\\/span><br><\\/p>\"}', '1', '2021-09-09 19:43:49', '2021-09-09 19:43:49'),
(38, 'about.content', '{\"short_description\":\"Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has\",\"details\":\"<p>Lorem ipsum dolor sit amet, rebum augue numquam cu quo. Ferri altera scaevola mea ex. Reque omnium eruditi te quo, per ex voluptua dissentias theophrastus, ut his legimus ponderum. Ex viris dicam molestiae est, ne eligendi argumentum ius. Accusam recteque evertitur nam ad, duo ut mundi interesset. Solet dolorem definitiones usu et, partem lobortis percipitur in sit, quo at omnis mandamus.<\\/p><p>Diam iuvaret corpora est ut, dissentias neglegentur pri ut. Nemore blandit detracto no qui, sale ponderum usu ex, ex doming omnesque nominati eum. Cu duo legimus deterruisset mediocritatem. Oporteat dissentiet ei pri, denique euripidis his ut. Per ponderum efficiendi no, enim dissentias ius ut, his pertinax repudiandae et. Sit ea nobis putent impetus, pri at assum delectus philosophia. Unum summo contentiones cu sea, clita urbanitas ad cum.<br><\\/p><p>Has ei dicta meliore. Aliquip atomorum scriptorem pri ad. Ad pri simul legimus. Bonorum nonumes eos ut, id laudem animal vix. Sit ei animal volumus, has voluptua moderatius ut, aliquid propriae perfecto ad vix. Facer fabulas molestiae an pri, sit ei esse tractatos forensibus. Id pro commodo bonorum.<br><\\/p><p>Duo voluptatum neglegentur an. Pri id quodsi omnesque. Usu ei diceret facilis fastidii, populo meliore et mea, te est debitis salutatus. Usu ad option scripserit, enim solet eu pri.<br><\\/p><p>Qui voluptua aliquando ei, ne vim electram disputationi. Mei ea habemus indoctum maiestatis, habemus adipiscing eu vim. Etiam graeco doctus usu no, nam ex sonet possim mediocritatem. Ius at diam fuisset, in intellegam cotidieque his.<br><\\/p>\"}', NULL, '2021-09-09 19:44:20', '2021-09-13 20:29:21'),
(39, 'breadcrumb.content', '{\"image\":\"613a643191f3b1631216689.jpg\"}', NULL, '2021-09-09 19:44:49', '2021-09-09 19:44:49');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `service_image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rate` decimal(8,2) NOT NULL,
  `duration` int(11) NOT NULL,
  `details` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `faq` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gallery` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `reason_of_reject` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `admin_approval` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `category_id`, `user_id`, `name`, `service_image`, `rate`, `duration`, `details`, `faq`, `video`, `gallery`, `location`, `reason_of_reject`, `status`, `admin_approval`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'PC Repairing', '613a440322e301631208451.jpg', '500.00', 0, 'Lorem ipsum dolor sit amet, in modo intellegam omittantur nec, at adhuc homero posidonium duo, epicuri vituperata an quo. At his aperiri consectetuer, cu probo commodo probatus mel, cum cu nulla pertinax invenire. Munere adipisci comprehensam no eum, at elitr accusam mel. No idque dolor assueverit ius, denique vituperatoribus in sea. Solet numquam sapientem cu has, ius quis regione no.Ei modo probatus lobortis has. Natum efficiantur consequuntur vim cu. Cibo quaerendum eu sea, sumo congue quaeque qui id, eu vel posse libris reprehendunt. Eam natum torquatos in, vivendum periculis eum te. Has exerci constituam in, an nam apeirian voluptaria, nam ea lorem reprimique philosophia. Ea falli adolescens efficiendi nam.Ea legere reformidans ius, dolorem menandri his id. Eum eu scripta hendrerit ullamcorper, eos eu omnis everti phaedrum, et usu quis ludus vitae. Detracto interesset quaerendum ad sit, dolor recusabo per et. Nisl salutatus sed at. Suas appareat pro ne, ne mea pericula deterruisset. Soluta quaeque officiis per at.\r\nEquidem nusquam dissentias ne vim. Per te quidam noster. Mea at soleat insolens. Pri tantas persius an, id quando volutpat per.', '[{\"question\":\"How to Get Service\",\"answer\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.\"},{\"question\":\"How to Pay Me\",\"answer\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.\"}]', '[\"9sg4PRf0vHo\",\"9sg4PRf0vHo\"]', '[\"613a4403597261631208451.jpg\",\"613a44038706a1631208451.jpg\",\"613a4403afb1a1631208451.jpg\"]', '\"Boston, Armidale, Ballina\"', NULL, 1, 1, '2021-09-09 17:27:31', '2021-09-09 18:35:15'),
(2, 10, 1, 'Electrician', '', '500.00', 0, 'Lorem ipsum dolor sit amet, in modo intellegam omittantur nec, at adhuc homero posidonium duo, epicuri vituperata an quo. At his aperiri consectetuer, cu probo commodo probatus mel, cum cu nulla pertinax invenire. Munere adipisci comprehensam no eum, at elitr accusam mel. No idque dolor assueverit ius, denique vituperatoribus in sea. Solet numquam sapientem cu has, ius quis regione no.Ei modo probatus lobortis has. Natum efficiantur consequuntur vim cu. Cibo quaerendum eu sea, sumo congue quaeque qui id, eu vel posse libris reprehendunt. Eam natum torquatos in, vivendum periculis eum te. Has exerci constituam in, an nam apeirian voluptaria, nam ea lorem reprimique philosophia. Ea falli adolescens efficiendi nam.Ea legere reformidans ius, dolorem menandri his id. Eum eu scripta hendrerit ullamcorper, eos eu omnis everti phaedrum, et usu quis ludus vitae. Detracto interesset quaerendum ad sit, dolor recusabo per et. Nisl salutatus sed at. Suas appareat pro ne, ne mea pericula deterruisset. Soluta quaeque officiis per at.\r\nEquidem nusquam dissentias ne vim. Per te quidam noster. Mea at soleat insolens. Pri tantas persius an, id quando volutpat per.', '[{\"question\":\"How to Get Service\",\"answer\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.\"},{\"question\":\"How to Pay Me\",\"answer\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.\"}]', '[\"9sg4PRf0vHo\",\"9sg4PRf0vHo\"]', '[\"613a44a0f128d1631208608.jpg\",\"613a44a10dad21631208609.jpg\",\"613a44a13ab1e1631208609.jpg\"]', '\"Boston, Sydney, Los Angeles\"', NULL, 1, 1, '2021-09-09 17:30:09', '2021-09-09 18:35:02'),
(3, 6, 2, 'Electrical', '', '500.00', 0, 'Lorem ipsum dolor sit amet, in modo intellegam omittantur nec, at adhuc homero posidonium duo, epicuri vituperata an quo. At his aperiri consectetuer, cu probo commodo probatus mel, cum cu nulla pertinax invenire. Munere adipisci comprehensam no eum, at elitr accusam mel. No idque dolor assueverit ius, denique vituperatoribus in sea. Solet numquam sapientem cu has, ius quis regione no.Ei modo probatus lobortis has. Natum efficiantur consequuntur vim cu. Cibo quaerendum eu sea, sumo congue quaeque qui id, eu vel posse libris reprehendunt. Eam natum torquatos in, vivendum periculis eum te. Has exerci constituam in, an nam apeirian voluptaria, nam ea lorem reprimique philosophia. Ea falli adolescens efficiendi nam.Ea legere reformidans ius, dolorem menandri his id. Eum eu scripta hendrerit ullamcorper, eos eu omnis everti phaedrum, et usu quis ludus vitae. Detracto interesset quaerendum ad sit, dolor recusabo per et. Nisl salutatus sed at. Suas appareat pro ne, ne mea pericula deterruisset. Soluta quaeque officiis per at.', '[{\"question\":\"How to Get Service\",\"answer\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.\"},{\"question\":\"How to Pay Me\",\"answer\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.\"}]', '[\"9sg4PRf0vHo\",\"9sg4PRf0vHo\"]', '[\"613a45f4ceb871631208948.jpg\",\"613a45f51bf4a1631208949.jpg\",\"613a45f543e8f1631208949.jpg\"]', 'Boston, NewYork, Los Angeles', NULL, 1, 1, '2021-09-09 17:35:49', '2021-09-16 08:49:53'),
(4, 1, 2, 'PC Repairing', '', '500.00', 0, 'Lorem ipsum dolor sit amet, in modo intellegam omittantur nec, at adhuc homero posidonium duo, epicuri vituperata an quo. At his aperiri consectetuer, cu probo commodo probatus mel, cum cu nulla pertinax invenire. Munere adipisci comprehensam no eum, at elitr accusam mel. No idque dolor assueverit ius, denique vituperatoribus in sea. Solet numquam sapientem cu has, ius quis regione no.Ei modo probatus lobortis has. Natum efficiantur consequuntur vim cu. Cibo quaerendum eu sea, sumo congue quaeque qui id, eu vel posse libris reprehendunt. Eam natum torquatos in, vivendum periculis eum te. Has exerci constituam in, an nam apeirian voluptaria, nam ea lorem reprimique philosophia. Ea falli adolescens efficiendi nam.Ea legere reformidans ius, dolorem menandri his id. Eum eu scripta hendrerit ullamcorper, eos eu omnis everti phaedrum, et usu quis ludus vitae. Detracto interesset quaerendum ad sit, dolor recusabo per et. Nisl salutatus sed at. Suas appareat pro ne, ne mea pericula deterruisset. Soluta quaeque officiis per at.', '[{\"question\":\"How to Get Service\",\"answer\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.\"},{\"question\":\"How to Pay Me\",\"answer\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.\"}]', '[\"9sg4PRf0vHo\",\"9sg4PRf0vHo\"]', '[\"613a46214a3fc1631208993.jpg\",\"613a46218019c1631208993.jpg\",\"613a4621b44fe1631208993.jpg\"]', '\"Dubbo, Forbes, Gosford\"', NULL, 1, 1, '2021-09-09 17:36:33', '2021-09-09 18:34:34'),
(5, 10, 3, 'Electrician', '', '500.00', 0, 'Lorem ipsum dolor sit amet, in modo intellegam omittantur nec, at adhuc homero posidonium duo, epicuri vituperata an quo. At his aperiri consectetuer, cu probo commodo probatus mel, cum cu nulla pertinax invenire. Munere adipisci comprehensam no eum, at elitr accusam mel. No idque dolor assueverit ius, denique vituperatoribus in sea. Solet numquam sapientem cu has, ius quis regione no.Ei modo probatus lobortis has. Natum efficiantur consequuntur vim cu. Cibo quaerendum eu sea, sumo congue quaeque qui id, eu vel posse libris reprehendunt. Eam natum torquatos in, vivendum periculis eum te. Has exerci constituam in, an nam apeirian voluptaria, nam ea lorem reprimique philosophia. Ea falli adolescens efficiendi nam.Ea legere reformidans ius, dolorem menandri his id. Eum eu scripta hendrerit ullamcorper, eos eu omnis everti phaedrum, et usu quis ludus vitae. Detracto interesset quaerendum ad sit, dolor recusabo per et. Nisl salutatus sed at. Suas appareat pro ne, ne mea pericula deterruisset. Soluta quaeque officiis per at.', '[{\"question\":\"How to Get Service\",\"answer\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.\"},{\"question\":\"How to Pay Me\",\"answer\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.\"}]', '[\"9sg4PRf0vHo\",\"9sg4PRf0vHo\"]', '[\"613a46cf2ae961631209167.jpg\",\"613a46cf596031631209167.jpg\",\"613a46cf868d21631209167.jpg\"]', '\"Moree, Newcastle, Tenterfield\"', NULL, 1, 1, '2021-09-09 17:39:27', '2021-09-09 18:34:21'),
(6, 1, 3, 'PC Repairing', '', '500.00', 1, 'Lorem ipsum dolor sit amet, in modo intellegam omittantur nec, at adhuc homero posidonium duo, epicuri vituperata an quo. At his aperiri consectetuer, cu probo commodo probatus mel, cum cu nulla pertinax invenire. Munere adipisci comprehensam no eum, at elitr accusam mel. No idque dolor assueverit ius, denique vituperatoribus in sea. Solet numquam sapientem cu has, ius quis regione no.Ei modo probatus lobortis has. Natum efficiantur consequuntur vim cu. Cibo quaerendum eu sea, sumo congue quaeque qui id, eu vel posse libris reprehendunt. Eam natum torquatos in, vivendum periculis eum te. Has exerci constituam in, an nam apeirian voluptaria, nam ea lorem reprimique philosophia. Ea falli adolescens efficiendi nam.Ea legere reformidans ius, dolorem menandri his id. Eum eu scripta hendrerit ullamcorper, eos eu omnis everti phaedrum, et usu quis ludus vitae. Detracto interesset quaerendum ad sit, dolor recusabo per et. Nisl salutatus sed at. Suas appareat pro ne, ne mea pericula deterruisset. Soluta quaeque officiis per at.', '[{\"question\":\"How to Get Service\",\"answer\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.\"},{\"question\":\"How to Pay Me\",\"answer\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.\"}]', '[\"9sg4PRf0vHo\",\"9sg4PRf0vHo\"]', '[\"613a47012b2131631209217.jpg\",\"613a470157c261631209217.jpg\",\"613a470185e331631209217.jpg\"]', '\"Dubbo, NewYork, Armidale\"', NULL, 1, 1, '2021-09-09 17:40:17', '2021-09-09 18:34:10'),
(7, 3, 4, 'PC Repairing', '613a527c025551631212156.jpg', '500.00', 0, 'Lorem ipsum dolor sit amet, in modo intellegam omittantur nec, at adhuc homero posidonium duo, epicuri vituperata an quo. At his aperiri consectetuer, cu probo commodo probatus mel, cum cu nulla pertinax invenire. Munere adipisci comprehensam no eum, at elitr accusam mel. No idque dolor assueverit ius, denique vituperatoribus in sea. Solet numquam sapientem cu has, ius quis regione no.Ei modo probatus lobortis has. Natum efficiantur consequuntur vim cu. Cibo quaerendum eu sea, sumo congue quaeque qui id, eu vel posse libris reprehendunt. Eam natum torquatos in, vivendum periculis eum te. Has exerci constituam in, an nam apeirian voluptaria, nam ea lorem reprimique philosophia. Ea falli adolescens efficiendi nam.Ea legere reformidans ius, dolorem menandri his id. Eum eu scripta hendrerit ullamcorper, eos eu omnis everti phaedrum, et usu quis ludus vitae. Detracto interesset quaerendum ad sit, dolor recusabo per et. Nisl salutatus sed at. Suas appareat pro ne, ne mea pericula deterruisset. Soluta quaeque officiis per at.', '[{\"question\":\"How to Get Service\",\"answer\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.\"},{\"question\":\"How to Pay Me\",\"answer\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.\"}]', '[\"9sg4PRf0vHo\",\"9sg4PRf0vHo\"]', '[\"613a527c7f1b21631212156.jpg\",\"613a527caf4801631212156.jpg\",\"613a527ce65ae1631212156.jpg\"]', 'Boston, NewYork, Los Angeles', NULL, 1, 1, '2021-09-09 18:29:19', '2021-09-16 08:52:27'),
(8, 10, 4, 'Electrician', '613a52d4729dc1631212244.jpg', '500.00', 0, 'Lorem ipsum dolor sit amet, in modo intellegam omittantur nec, at adhuc homero posidonium duo, epicuri vituperata an quo. At his aperiri consectetuer, cu probo commodo probatus mel, cum cu nulla pertinax invenire. Munere adipisci comprehensam no eum, at elitr accusam mel. No idque dolor assueverit ius, denique vituperatoribus in sea. Solet numquam sapientem cu has, ius quis regione no.Ei modo probatus lobortis has. Natum efficiantur consequuntur vim cu. Cibo quaerendum eu sea, sumo congue quaeque qui id, eu vel posse libris reprehendunt. Eam natum torquatos in, vivendum periculis eum te. Has exerci constituam in, an nam apeirian voluptaria, nam ea lorem reprimique philosophia. Ea falli adolescens efficiendi nam.Ea legere reformidans ius, dolorem menandri his id. Eum eu scripta hendrerit ullamcorper, eos eu omnis everti phaedrum, et usu quis ludus vitae. Detracto interesset quaerendum ad sit, dolor recusabo per et. Nisl salutatus sed at. Suas appareat pro ne, ne mea pericula deterruisset. Soluta quaeque officiis per at.', '[{\"question\":\"How to Get Service\",\"answer\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.\"},{\"question\":\"How to Pay Me\",\"answer\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.\"}]', '[\"9sg4PRf0vHo\",\"9sg4PRf0vHo\"]', '[\"613a52d4a6cb21631212244.jpg\",\"613a52d4d5c7b1631212244.jpg\",\"613a52d510b0f1631212245.jpg\"]', '\"Boston, Armidale, Los Angeles\"', NULL, 1, 1, '2021-09-09 18:30:45', '2021-09-09 18:33:49'),
(9, 3, 1, 'Single Window Cleaning', '', '500.00', 0, 'Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.', '[{\"question\":\"How to Get Service\",\"answer\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.\"},{\"question\":\"How to Pay Me\",\"answer\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.\"}]', '[\"9sg4PRf0vHo\",\"9sg4PRf0vHo\"]', '[\"613ad2b8e8aba1631244984.jpg\",\"613ad2b92ddf61631244985.jpg\",\"613ad2b964aa31631244985.jpg\"]', '\"Gosford, NewYork, Los Angeles\"', NULL, 1, 1, '2021-09-10 03:36:25', '2021-09-10 03:40:20'),
(10, 4, 1, 'Home Repairing', '', '500.00', 0, 'Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.', '[{\"question\":\"How to Get Service\",\"answer\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.\"},{\"question\":\"How to Pay Me\",\"answer\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.\"}]', '[\"9sg4PRf0vHo\",\"9sg4PRf0vHo\"]', '[\"613ad2ea98b411631245034.jpg\",\"613ad2eaca4f71631245034.jpg\",\"613ad2eaecd981631245034.jpg\"]', '\"Winton, NewYork, Los Angeles\"', NULL, 1, 1, '2021-09-10 03:37:15', '2021-09-10 03:40:10'),
(11, 5, 1, 'Car Repair', '', '500.00', 1, 'Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.', '[{\"question\":\"How to Get Service\",\"answer\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.\"},{\"question\":\"How to Pay Me\",\"answer\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.\"}]', '[\"9sg4PRf0vHo\",\"9sg4PRf0vHo\"]', '[\"613ad315558581631245077.jpg\",\"613ad31585e681631245077.jpg\",\"613ad315bb0cd1631245077.jpg\"]', '\"Boston, NewYork, Los Angeles\"', NULL, 1, 1, '2021-09-10 03:37:57', '2021-09-10 03:39:07'),
(12, 3, 1, 'Single Window Cleaning', '', '500.00', 0, 'Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.', '[{\"question\":\"How to Get Service\",\"answer\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.\"},{\"question\":\"How to Pay Me\",\"answer\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.\"}]', '[\"9sg4PRf0vHo\",\"9sg4PRf0vHo\"]', '[\"613ad340ad9411631245120.jpg\",\"613ad340ddb6e1631245120.jpg\",\"613ad3410d7251631245121.jpg\"]', 'Boston, NewYork, Naracoorte', NULL, 1, 1, '2021-09-10 03:38:41', '2021-09-16 08:46:44'),
(13, 3, 4, 'Plumber', '', '500.00', 0, 'Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.', '[{\"question\":\"How to Get Service\",\"answer\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.\"},{\"question\":\"How to Pay Me\",\"answer\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.\"}]', '[\"9sg4PRf0vHo\",\"9sg4PRf0vHo\"]', '[\"613ad922afae61631246626.jpg\",\"613ad922c2dbd1631246626.jpg\",\"613ad922eb1371631246626.jpg\"]', '\"Boston, Smithton, Los Angeles\"', NULL, 1, 1, '2021-09-10 04:03:47', '2021-09-10 04:14:26'),
(14, 4, 4, 'Home Repairing', '', '500.00', 0, 'Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.', '[{\"question\":\"How to Get Service\",\"answer\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.\"},{\"question\":\"How to Pay Me\",\"answer\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.\"}]', '[\"9sg4PRf0vHo\",\"9sg4PRf0vHo\"]', '[\"613ad94bdca001631246667.jpg\",\"613ad94c17d071631246668.jpg\",\"613ad94c459481631246668.jpg\"]', '\"Echuca, Portland, Los Angeles\"', NULL, 1, 1, '2021-09-10 04:04:28', '2021-09-10 04:14:38'),
(15, 5, 4, 'Car Mechanic', '', '500.00', 0, 'Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.', '[{\"question\":\"How to Get Service\",\"answer\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.\"},{\"question\":\"How to Pay Me\",\"answer\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.\"}]', '[\"9sg4PRf0vHo\",\"9sg4PRf0vHo\"]', '[\"613ad985601371631246725.jpg\",\"613ad985777f71631246725.jpg\",\"613ad9858bd5a1631246725.jpg\"]', '\"Boston, NewYork, Los Angeles\"', NULL, 1, 1, '2021-09-10 04:05:25', '2021-09-10 04:16:17'),
(16, 6, 4, 'Single Window Cleaning', '', '500.00', 0, 'Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.', '[{\"question\":\"How to Get Service\",\"answer\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.\"},{\"question\":\"How to Pay Me\",\"answer\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.\"}]', '[\"9sg4PRf0vHo\",\"9sg4PRf0vHo\"]', '[\"613ad9a92b2cd1631246761.jpg\",\"613ad9a961c251631246761.jpg\",\"613ad9a9784c81631246761.jpg\"]', '\"Wangaratta\"', NULL, 1, 1, '2021-09-10 04:06:01', '2021-09-10 04:16:06'),
(17, 3, 3, 'Plumber', '', '500.00', 0, 'Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.', '[{\"question\":\"How to Get Service\",\"answer\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.\"},{\"question\":\"How to Pay Me\",\"answer\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.\"}]', '[\"9sg4PRf0vHo\",\"9sg4PRf0vHo\"]', '[\"613ada00d7ec61631246848.jpg\",\"613ada011887a1631246849.jpg\",\"613ada013b6d11631246849.jpg\"]', '\"Mandurah\"', NULL, 1, 1, '2021-09-10 04:07:29', '2021-09-10 04:15:56'),
(18, 10, 3, 'Home Repairing', '', '500.00', 0, 'Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.', '[{\"question\":\"How to Get Service\",\"answer\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.\"},{\"question\":\"How to Pay Me\",\"answer\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.\"}]', '[\"9sg4PRf0vHo\",\"9sg4PRf0vHo\"]', '[\"613ada2a344051631246890.jpg\",\"613ada2a702f21631246890.jpg\",\"613ada2a8b0631631246890.jpg\"]', 'Mandurah, NewYork, Wangaratta', NULL, 1, 1, '2021-09-10 04:08:10', '2021-09-16 08:51:04'),
(19, 5, 3, 'Car Repair', '', '500.00', 0, 'Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.', '[{\"question\":\"How to Get Service\",\"answer\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.\"},{\"question\":\"How to Pay Me\",\"answer\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.\"}]', '[\"9sg4PRf0vHo\",\"9sg4PRf0vHo\"]', '[\"613ada5beb7071631246939.jpg\",\"613ada5c2da021631246940.jpg\",\"613ada5c5d58a1631246940.jpg\"]', '\"NewYork,Los Angeles\"', NULL, 1, 1, '2021-09-10 04:09:00', '2021-09-10 04:15:35'),
(20, 6, 3, 'PC Repairing', '', '500.00', 0, 'Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.', '[{\"question\":\"How to Get Service\",\"answer\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.\"},{\"question\":\"How to Pay Me\",\"answer\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.\"}]', '[\"9sg4PRf0vHo\",\"9sg4PRf0vHo\"]', '[\"613ada81d5b0c1631246977.jpg\",\"613ada8211eed1631246978.jpg\",\"613ada822a9391631246978.jpg\"]', '\"Boston\"', NULL, 1, 1, '2021-09-10 04:09:38', '2021-09-10 04:15:25'),
(21, 3, 2, 'Plumber', '', '500.00', 0, 'Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.', '[{\"question\":\"How to Get Service\",\"answer\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.\"},{\"question\":\"How to Pay Me\",\"answer\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.\"}]', '[\"9sg4PRf0vHo\",\"9sg4PRf0vHo\"]', '[\"613adaf0420dd1631247088.jpg\",\"613adaf072f3d1631247088.jpg\",\"613adaf08c0481631247088.jpg\"]', '\"Boston, NewYork, Los Angeles\"', NULL, 1, 1, '2021-09-10 04:11:28', '2021-09-10 04:15:15'),
(22, 4, 2, 'Home Repairing', '', '500.00', 0, 'Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.', '[{\"question\":\"How to Get Service\",\"answer\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.\"},{\"question\":\"How to Pay Me\",\"answer\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.\"}]', '[\"9sg4PRf0vHo\",\"9sg4PRf0vHo\"]', '[\"613adb12b57c71631247122.jpg\",\"613adb12e5a0f1631247122.jpg\",\"613adb132f63f1631247123.jpg\"]', '\"Boston, Dubbo, Los Angeles\"', NULL, 1, 1, '2021-09-10 04:12:03', '2021-09-10 04:15:06'),
(23, 5, 2, 'Car Mechanic', '', '500.00', 0, 'Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.', '[{\"question\":\"How to Get Service\",\"answer\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.\"},{\"question\":\"How to Pay Me\",\"answer\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.\"}]', '[\"9sg4PRf0vHo\",\"9sg4PRf0vHo\"]', '[\"613adb3865e351631247160.jpg\",\"613adb389b95e1631247160.jpg\",\"613adb38d62931631247160.jpg\"]', '\"Boston, NewYork, Los Angeles\"', NULL, 1, 1, '2021-09-10 04:12:41', '2021-09-10 04:14:57'),
(24, 6, 2, 'Cleaning', '', '500.00', 0, 'Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.', '[{\"question\":\"How to Get Service\",\"answer\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.\"},{\"question\":\"How to Pay Me\",\"answer\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.\"}]', '[\"9sg4PRf0vHo\",\"9sg4PRf0vHo\"]', '[\"613adb5e6f00e1631247198.jpg\",\"613adb5e99b1e1631247198.jpg\",\"613adb5eb21f11631247198.jpg\"]', '\"Boston, Washington, Los Angeles\"', 'test', 1, 1, '2021-09-10 04:13:18', '2021-09-13 11:47:24');

-- --------------------------------------------------------

--
-- Table structure for table `subscribes`
--

CREATE TABLE `subscribes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscribes`
--

INSERT INTO `subscribes` (`id`, `email`, `created_at`, `updated_at`) VALUES
(1, 'messi@messi.com', '2021-09-10 04:17:46', '2021-09-10 04:17:46'),
(2, 'admin@gmail.com', '2021-09-10 04:18:42', '2021-09-10 04:18:42'),
(3, 'admin@yopmail.com', '2021-09-10 04:19:08', '2021-09-10 04:19:08');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `trx` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gateway_transaction` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `commission` decimal(28,8) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `service_id` bigint(20) UNSIGNED DEFAULT NULL,
  `amount` int(11) NOT NULL,
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `charge` decimal(10,0) NOT NULL,
  `details` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `trx`, `gateway_transaction`, `commission`, `user_id`, `service_id`, `amount`, `currency`, `charge`, `details`, `type`, `created_at`, `updated_at`) VALUES
(1, 'W0RWCU4JIA0C6O2', 'ch_3JXtRKEp0youpBCh1dthTi8V', '200.00000000', 5, 2, 1000, 'BDT', '54', 'Payment Successfull for Electrician', '-', '2021-08-09 20:01:45', '2021-09-09 20:01:45'),
(2, 'W0RWCU4JIA0C6O2', 'ch_3JXtRKEp0youpBCh1dthTi8V', '200.00000000', 1, 2, 1000, 'BDT', '54', 'Paid for Electrician', '+', '2021-09-09 20:01:45', '2021-09-09 20:01:45'),
(3, 'UXZOK8PJPHFXVGB', NULL, '0.00000000', 1, NULL, 205, 'BDT', '5', 'Withdraw via Payoneer', '-', '2021-09-09 20:04:25', '2021-09-09 20:04:25'),
(4, 'PM6IMQOLP0FNZFX', NULL, '0.00000000', 5, 8, 1000, 'BDT', '2', 'Payment Accepted for Electrician', '-', '2021-09-10 03:49:57', '2021-09-10 03:49:57'),
(5, 'PM6IMQOLP0FNZFX', NULL, '0.00000000', 4, 8, 1000, 'BDT', '2', 'Paid for Electrician', '+', '2021-09-10 03:49:57', '2021-09-10 03:49:57'),
(6, 'PM6IMQOLP0FNZFX', NULL, '0.00000000', 5, 8, 1000, 'BDT', '2', 'Payment Accepted for Electrician', '-', '2021-09-10 03:57:37', '2021-09-10 03:57:37'),
(7, 'PM6IMQOLP0FNZFX', NULL, '0.00000000', 4, 8, 1000, 'BDT', '2', 'Paid for Electrician', '+', '2021-09-10 03:57:37', '2021-09-10 03:57:37'),
(8, 'PM6IMQOLP0FNZFX', NULL, '0.00000000', 5, 8, 1000, 'BDT', '2', 'Payment Accepted for Electrician', '-', '2021-09-13 13:07:12', '2021-09-13 13:07:12'),
(9, 'PM6IMQOLP0FNZFX', NULL, '0.00000000', 4, 8, 1000, 'BDT', '2', 'Paid for Electrician', '+', '2021-09-13 13:07:12', '2021-09-13 13:07:12'),
(10, 'UXZOK8PJPHFXVGB', NULL, '0.00000000', 1, NULL, 205, 'BDT', '5', 'Withdraw via Payoneer', '-', '2021-09-13 13:12:38', '2021-09-13 13:12:38'),
(11, 'UXZOK8PJPHFXVGB', NULL, '0.00000000', 1, NULL, 205, 'BDT', '5', 'Rejected Withdraw via Payoneer', '+', '2021-09-13 13:13:03', '2021-09-13 13:13:03'),
(12, 'W7HSFN8UW08FC0O', 'ch_3JZG6xEp0youpBCh0vzHpsnH', '500.00000000', 5, 7, 2500, 'BDT', '98', 'Payment Successfull for PC Repairing', '-', '2021-09-13 14:26:20', '2021-09-13 14:26:20'),
(13, 'W7HSFN8UW08FC0O', 'ch_3JZG6xEp0youpBCh0vzHpsnH', '500.00000000', 4, 7, 2500, 'BDT', '98', 'Paid for PC Repairing', '+', '2021-09-13 14:26:20', '2021-09-13 14:26:20'),
(14, 'MQGZVQZCAHFYHLW', NULL, '0.00000000', 4, NULL, 205, 'BDT', '5', 'Withdraw via Payoneer', '-', '2021-09-13 16:36:00', '2021-09-13 16:36:00'),
(15, 'PM6IMQOLP0FNZFX', 'ch_3JcTK6Ep0youpBCh0y3Fx9O0', '200.00000000', 5, 8, 1000, 'USD', '29', 'Payment Successfull for Electrician', '-', '2021-09-22 01:09:14', '2021-09-22 01:09:14'),
(16, 'PM6IMQOLP0FNZFX', 'ch_3JcTK6Ep0youpBCh0y3Fx9O0', '200.00000000', 4, 8, 1000, 'USD', '29', 'Paid for Electrician', '+', '2021-09-22 01:09:14', '2021-09-22 01:09:14'),
(17, '6BTMNGJ2SVWIWA4', 'ch_3JdITqEp0youpBCh1Ta5MvmG', '300.00000000', 5, 16, 1500, 'USD', '44', 'Payment Successfull for Single Window Cleaning', '-', '2021-09-24 07:46:39', '2021-09-24 07:46:39'),
(18, '6BTMNGJ2SVWIWA4', 'ch_3JdITqEp0youpBCh1Ta5MvmG', '300.00000000', 4, 16, 1500, 'USD', '44', 'Paid for Single Window Cleaning', '+', '2021-09-24 07:46:39', '2021-09-24 07:46:39');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_type` int(11) NOT NULL,
  `fname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `balance` decimal(28,8) DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `designation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `experience` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qualification` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `social` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ev` int(11) NOT NULL DEFAULT 0,
  `verification_code` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_type`, `fname`, `lname`, `username`, `slug`, `balance`, `email`, `mobile`, `image`, `address`, `designation`, `details`, `experience`, `qualification`, `email_verified_at`, `password`, `featured`, `social`, `ev`, `verification_code`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 2, 'Charles', 'Gamble', 'charles', 'charles', '800.00000000', 'charles@gmail.com', '123456789', '613a384d3f3371631205453.jpg', '{\"country\":\"Australia\",\"city\":\"Sydney\",\"zip\":\"1234\",\"state\":\"Sydney\"}', 'Plumber', '<div><div><div><div><p>Lorem ipsum dolor sit amet, in modo intellegam omittantur nec, at adhuc homero posidonium duo, epicuri vituperata an quo. At his aperiri consectetuer, cu probo commodo probatus mel, cum cu nulla pertinax invenire. Munere adipisci comprehensam no eum, at elitr accusam mel. No idque dolor assueverit ius, denique vituperatoribus in sea. Solet numquam sapientem cu has, ius quis regione no.Ei modo probatus lobortis has. Naum efficiantur consequuntur vim cu. Cibo quaerendum eu sea, sumo congue quaeque qui id, eu vel posse libris reprehendunt. Eam natum torquatos in, vivendum periculis eum te. Has exerci constituam in, an nam apeirian voluptaria, nam ea lorem reprimique philosophia. Ea falli adolescens efficiendi nam.Ea legere reformidan ius, dolorem menandri his id. Eum eu scripta hendrerit ullamcorper, eos eu omnis everti phaedrum, et usu quis ludus vitae. Detracto interesset quaerendum ad sit, dolor recusabo per et. Nisl salutatus sed at. Suas appareat pro ne, ne mea pericula deterruisset. Soluta quaeque officiis per at.</p></div></div></div></div>', '<p>Lorem ipsum dolor sit amet, in modo intellegam omittantur nec, at adhuc homero posidonium duo, epicuri vituperata an quo. At his aperiri consectetuer, cu probo commodo probatus mel, cum cu nulla pertinax invenire. Munere adipisci comprehensam no eum, at elitr accusam mel. No idque dolor assueverit ius, denique vituperatoribus in sea. Solet numquam sapientem cu has, ius quis regione no.Ei modo probatus lobortis has. Naum efficiantur consequuntur vim cu. Cibo quaerendum eu sea, sumo congue quaeque qui id, eu vel posse libris reprehendunt. Eam natum torquatos in, vivendum periculis eum te. Has exerci constituam in, an nam apeirian voluptaria, nam ea lorem reprimique philosophia. Ea falli adolescens efficiendi nam.Ea legere reformidan ius, dolorem menandri his id. Eum eu scripta hendrerit ullamcorper, eos eu omnis everti phaedrum, et usu quis ludus vitae. Detracto interesset quaerendum ad sit, dolor recusabo per et. Nisl salutatus sed at. Suas appareat pro ne, ne mea pericula deterruisset. Soluta quaeque officiis per at.<br></p>', '<p>Lorem ipsum dolor sit amet, in modo intellegam omittantur nec, at adhuc homero posidonium duo, epicuri vituperata an quo. At his aperiri consectetuer, cu probo commodo probatus mel, cum cu nulla pertinax invenire. Munere adipisci comprehensam no eum, at elitr accusam mel. No idque dolor assueverit ius, denique vituperatoribus in sea. Solet numquam sapientem cu has, ius quis regione no.Ei modo probatus lobortis has. Naum efficiantur consequuntur vim cu. Cibo quaerendum eu sea, sumo congue quaeque qui id, eu vel posse libris reprehendunt. Eam natum torquatos in, vivendum periculis eum te. Has exerci constituam in, an nam apeirian voluptaria, nam ea lorem reprimique philosophia. Ea falli adolescens efficiendi nam.Ea legere reformidan ius, dolorem menandri his id. Eum eu scripta hendrerit ullamcorper, eos eu omnis everti phaedrum, et usu quis ludus vitae. Detracto interesset quaerendum ad sit, dolor recusabo per et. Nisl salutatus sed at. Suas appareat pro ne, ne mea pericula deterruisset. Soluta quaeque officiis per at.<br></p>', NULL, '$2y$10$LhFhsUlFoTkyqee/0cfIQOv1pLTi4YIaeUTcwy6uOBs1exeuFEQ6q', 1, '{\"facebook\":\"http:\\\\\\\\www.facebok.com\",\"twitter\":\"http:\\\\\\\\www.twitter.com\",\"youtube\":\"http:\\\\\\\\www.youtube.com\"}', 1, NULL, 1, NULL, '2021-09-09 16:28:20', '2021-09-13 13:13:03'),
(2, 2, 'Keith', 'Williams', 'more 123', 'keith_123', NULL, 'more@gmail.com', '123456789', '613a45c2c795f1631208898.jpg', '{\"country\":\"Argentina\",\"city\":\"argentina\",\"zip\":\"1234\",\"state\":\"arget\"}', 'Electrician', '<p>Lorem ipsum dolor sit amet, in modo intellegam omittantur nec, at adhuc homero posidonium duo, epicuri vituperata an quo. At his aperiri consectetuer, cu probo commodo probatus mel, cum cu nulla pertinax invenire. Munere adipisci comprehensam no eum, at elitr accusam mel. No idque dolor assueverit ius, denique vituperatoribus in sea. Solet numquam sapientem cu has, ius quis regione no.Ei modo probatus lobortis has. Natum efficiantur consequuntur vim cu. Cibo quaerendum eu sea, sumo congue quaeque qui id, eu vel posse libris reprehendunt. Eam natum torquatos in, vivendum periculis eum te. Has exerci constituam in, an nam apeirian voluptaria, nam ea lorem reprimique philosophia. Ea falli adolescens efficiendi nam.Ea legere reformidans ius, dolorem menandri his id. Eum eu scripta hendrerit ullamcorper, eos eu omnis everti phaedrum, et usu quis ludus vitae. Detracto interesset quaerendum ad sit, dolor recusabo per et. Nisl salutatus sed at. Suas appareat pro ne, ne mea pericula deterruisset. Soluta quaeque officiis per at.</p>', '<p>Lorem ipsum dolor sit amet, in modo intellegam omittantur nec, at adhuc homero posidonium duo, epicuri vituperata an quo. At his aperiri consectetuer, cu probo commodo probatus mel, cum cu nulla pertinax invenire. Munere adipisci comprehensam no eum, at elitr accusam mel. No idque dolor assueverit ius, denique vituperatoribus in sea. Solet numquam sapientem cu has, ius quis regione no.Ei modo probatus lobortis has. Natum efficiantur consequuntur vim cu. Cibo quaerendum eu sea, sumo congue quaeque qui id, eu vel posse libris reprehendunt. Eam natum torquatos in, vivendum periculis eum te. Has exerci constituam in, an nam apeirian voluptaria, nam ea lorem reprimique philosophia. Ea falli adolescens efficiendi nam.Ea legere reformidans ius, dolorem menandri his id. Eum eu scripta hendrerit ullamcorper, eos eu omnis everti phaedrum, et usu quis ludus vitae. Detracto interesset quaerendum ad sit, dolor recusabo per et. Nisl salutatus sed at. Suas appareat pro ne, ne mea pericula deterruisset. Soluta quaeque officiis per at.<br></p>', '<p>Lorem ipsum dolor sit amet, in modo intellegam omittantur nec, at adhuc homero posidonium duo, epicuri vituperata an quo. At his aperiri consectetuer, cu probo commodo probatus mel, cum cu nulla pertinax invenire. Munere adipisci comprehensam no eum, at elitr accusam mel. No idque dolor assueverit ius, denique vituperatoribus in sea. Solet numquam sapientem cu has, ius quis regione no.Ei modo probatus lobortis has. Natum efficiantur consequuntur vim cu. Cibo quaerendum eu sea, sumo congue quaeque qui id, eu vel posse libris reprehendunt. Eam natum torquatos in, vivendum periculis eum te. Has exerci constituam in, an nam apeirian voluptaria, nam ea lorem reprimique philosophia. Ea falli adolescens efficiendi nam.Ea legere reformidans ius, dolorem menandri his id. Eum eu scripta hendrerit ullamcorper, eos eu omnis everti phaedrum, et usu quis ludus vitae. Detracto interesset quaerendum ad sit, dolor recusabo per et. Nisl salutatus sed at. Suas appareat pro ne, ne mea pericula deterruisset. Soluta quaeque officiis per at.<br></p>', NULL, '$2y$10$vyA2uxGQf4ZP9h/lw1YP4ePJDNcuIZmp1SbB51p25Lnk3ojgDGnHi', 1, '{\"facebook\":\"http:\\\\\\\\www.facebok.com\",\"twitter\":\"http:\\\\\\\\www.twitter.com\",\"youtube\":\"http:\\\\\\\\www.youtube.com\"}', 1, NULL, 1, NULL, '2021-09-09 17:33:23', '2021-09-13 07:11:38'),
(3, 2, 'James', 'Andujar', 'James', 'James', NULL, 'james@gmail.com', '123456', '613adcf3751cf1631247603.jpg', '{\"country\":\"Australia\",\"city\":\"Sydney\",\"zip\":\"1234\",\"state\":\"Sydney\"}', 'Electrician', '<p>Lorem ipsum dolor sit amet, in modo intellegam omittantur nec, at adhuc homero posidonium duo, epicuri vituperata an quo. At his aperiri consectetuer, cu probo commodo probatus mel, cum cu nulla pertinax invenire. Munere adipisci comprehensam no eum, at elitr accusam mel. No idque dolor assueverit ius, denique vituperatoribus in sea. Solet numquam sapientem cu has, ius quis regione no.Ei modo probatus lobortis has. Natum efficiantur consequuntur vim cu. Cibo quaerendum eu sea, sumo congue quaeque qui id, eu vel posse libris reprehendunt. Eam natum torquatos in, vivendum periculis eum te. Has exerci constituam in, an nam apeirian voluptaria, nam ea lorem reprimique philosophia. Ea falli adolescens efficiendi nam.Ea legere reformidans ius, dolorem menandri his id. Eum eu scripta hendrerit ullamcorper, eos eu omnis everti phaedrum, et usu quis ludus vitae. Detracto interesset quaerendum ad sit, dolor recusabo per et. Nisl salutatus sed at. Suas appareat pro ne, ne mea pericula deterruisset. Soluta quaeque officiis per at.<br></p>', '<p>Lorem ipsum dolor sit amet, in modo intellegam omittantur nec, at adhuc homero posidonium duo, epicuri vituperata an quo. At his aperiri consectetuer, cu probo commodo probatus mel, cum cu nulla pertinax invenire. Munere adipisci comprehensam no eum, at elitr accusam mel. No idque dolor assueverit ius, denique vituperatoribus in sea. Solet numquam sapientem cu has, ius quis regione no.Ei modo probatus lobortis has. Natum efficiantur consequuntur vim cu. Cibo quaerendum eu sea, sumo congue quaeque qui id, eu vel posse libris reprehendunt. Eam natum torquatos in, vivendum periculis eum te. Has exerci constituam in, an nam apeirian voluptaria, nam ea lorem reprimique philosophia. Ea falli adolescens efficiendi nam.Ea legere reformidans ius, dolorem menandri his id. Eum eu scripta hendrerit ullamcorper, eos eu omnis everti phaedrum, et usu quis ludus vitae. Detracto interesset quaerendum ad sit, dolor recusabo per et. Nisl salutatus sed at. Suas appareat pro ne, ne mea pericula deterruisset. Soluta quaeque officiis per at.<br></p>', '<p>Lorem ipsum dolor sit amet, in modo intellegam omittantur nec, at adhuc homero posidonium duo, epicuri vituperata an quo. At his aperiri consectetuer, cu probo commodo probatus mel, cum cu nulla pertinax invenire. Munere adipisci comprehensam no eum, at elitr accusam mel. No idque dolor assueverit ius, denique vituperatoribus in sea. Solet numquam sapientem cu has, ius quis regione no.Ei modo probatus lobortis has. Natum efficiantur consequuntur vim cu. Cibo quaerendum eu sea, sumo congue quaeque qui id, eu vel posse libris reprehendunt. Eam natum torquatos in, vivendum periculis eum te. Has exerci constituam in, an nam apeirian voluptaria, nam ea lorem reprimique philosophia. Ea falli adolescens efficiendi nam.Ea legere reformidans ius, dolorem menandri his id. Eum eu scripta hendrerit ullamcorper, eos eu omnis everti phaedrum, et usu quis ludus vitae. Detracto interesset quaerendum ad sit, dolor recusabo per et. Nisl salutatus sed at. Suas appareat pro ne, ne mea pericula deterruisset. Soluta quaeque officiis per at.<br></p>', NULL, '$2y$10$JYZEB3FoB/F/G2l3UiQt4uveCpnPdnkcvenXfHjL1MbBd.JkelbK2', 1, '{\"facebook\":\"http:\\\\\\\\www.facebok.com\",\"twitter\":\"http:\\\\\\\\www.twitter.com\",\"youtube\":\"http:\\\\\\\\www.youtube.com\"}', 1, NULL, 1, NULL, '2021-09-09 17:37:50', '2021-09-13 07:10:55'),
(4, 2, 'Peter', 'Wilson', 'Wilson', 'Wilson', '5395.00000000', 'provider@gmail.com', '123456789', '613a51dac80681631211994.jpg', '{\"country\":\"Australia\",\"city\":\"Sydney\",\"zip\":\"1234\",\"state\":\"Sydney\"}', 'Electrician', '<p>Lorem ipsum dolor sit amet, in modo intellegam omittantur nec, at adhuc homero posidonium duo, epicuri vituperata an quo. At his aperiri consectetuer, cu probo commodo probatus mel, cum cu nulla pertinax invenire. Munere adipisci comprehensam no eum, at elitr accusam mel. No idque dolor assueverit ius, denique vituperatoribus in sea. Solet numquam sapientem cu has, ius quis regione no.Ei modo probatus lobortis has. Natum efficiantur consequuntur vim cu. Cibo quaerendum eu sea, sumo congue quaeque qui id, eu vel posse libris reprehendunt. Eam natum torquatos in, vivendum periculis eum te. Has exerci constituam in, an nam apeirian voluptaria, nam ea lorem reprimique philosophia. Ea falli adolescens efficiendi nam.Ea legere reformidans ius, dolorem menandri his id. Eum eu scripta hendrerit ullamcorper, eos eu omnis everti phaedrum, et usu quis ludus vitae. Detracto interesset quaerendum ad sit, dolor recusabo per et. Nisl salutatus sed at. Suas appareat pro ne, ne mea pericula deterruisset. Soluta quaeque officiis per at.<br></p>', '<p>Lorem ipsum dolor sit amet, in modo intellegam omittantur nec, at adhuc homero posidonium duo, epicuri vituperata an quo. At his aperiri consectetuer, cu probo commodo probatus mel, cum cu nulla pertinax invenire. Munere adipisci comprehensam no eum, at elitr accusam mel. No idque dolor assueverit ius, denique vituperatoribus in sea. Solet numquam sapientem cu has, ius quis regione no.Ei modo probatus lobortis has. Natum efficiantur consequuntur vim cu. Cibo quaerendum eu sea, sumo congue quaeque qui id, eu vel posse libris reprehendunt. Eam natum torquatos in, vivendum periculis eum te. Has exerci constituam in, an nam apeirian voluptaria, nam ea lorem reprimique philosophia. Ea falli adolescens efficiendi nam.Ea legere reformidans ius, dolorem menandri his id. Eum eu scripta hendrerit ullamcorper, eos eu omnis everti phaedrum, et usu quis ludus vitae. Detracto interesset quaerendum ad sit, dolor recusabo per et. Nisl salutatus sed at. Suas appareat pro ne, ne mea pericula deterruisset. Soluta quaeque officiis per at.<br></p>', '<p>Lorem ipsum dolor sit amet, in modo intellegam omittantur nec, at adhuc homero posidonium duo, epicuri vituperata an quo. At his aperiri consectetuer, cu probo commodo probatus mel, cum cu nulla pertinax invenire. Munere adipisci comprehensam no eum, at elitr accusam mel. No idque dolor assueverit ius, denique vituperatoribus in sea. Solet numquam sapientem cu has, ius quis regione no.Ei modo probatus lobortis has. Natum efficiantur consequuntur vim cu. Cibo quaerendum eu sea, sumo congue quaeque qui id, eu vel posse libris reprehendunt. Eam natum torquatos in, vivendum periculis eum te. Has exerci constituam in, an nam apeirian voluptaria, nam ea lorem reprimique philosophia. Ea falli adolescens efficiendi nam.Ea legere reformidans ius, dolorem menandri his id. Eum eu scripta hendrerit ullamcorper, eos eu omnis everti phaedrum, et usu quis ludus vitae. Detracto interesset quaerendum ad sit, dolor recusabo per et. Nisl salutatus sed at. Suas appareat pro ne, ne mea pericula deterruisset. Soluta quaeque officiis per at.<br></p>', NULL, '$2y$10$K2NinZlwVRgAC.JCYiTLbuUEl1lW1yyCYFK0UxbaAZ7I8IpNi.HGu', 1, '{\"facebook\":\"http:\\\\\\\\www.facebok.com\",\"twitter\":\"http:\\\\\\\\www.twitter.com\",\"youtube\":\"http:\\\\\\\\www.youtube.com\"}', 1, NULL, 1, NULL, '2021-09-09 18:24:30', '2021-09-24 07:46:39'),
(5, 1, 'Alan', 'Walker', 'alanwalker', 'alanwalker', NULL, 'user@gmail.com', '123456', '613a6671708761631217265.jpg', '{\"country\":\"Australia\",\"city\":\"Sydney\",\"state\":\"Sydney\",\"zip\":\"1234\",\"address\":\"house-4,road-5\"}', NULL, NULL, NULL, NULL, NULL, '$2y$10$7Xt5ydGliEHAKwmoyUvPLebkYM7Lztr/hLlb16zr5JgICGa6JrO32', 0, NULL, 1, 960452, 1, NULL, '2021-09-09 19:53:37', '2021-09-21 20:06:38');

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_gateways`
--

CREATE TABLE `withdraw_gateways` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `charge` decimal(28,8) NOT NULL,
  `charge_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `min_withdraw` decimal(8,2) NOT NULL,
  `max_withdraw` decimal(8,2) NOT NULL,
  `withdraw_instruction` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `withdraw_gateways`
--

INSERT INTO `withdraw_gateways` (`id`, `name`, `charge`, `charge_type`, `min_withdraw`, `max_withdraw`, `withdraw_instruction`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Payoneer', '5.00000000', 'fixed', '200.00', '50000.00', '<p>Bank Account : 12345689</p>', 1, '2021-09-09 20:03:28', '2021-09-09 20:03:28');

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_logs`
--

CREATE TABLE `withdraw_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `withdraw_gateway_id` bigint(20) UNSIGNED NOT NULL,
  `trx` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `charge` decimal(28,8) NOT NULL,
  `balance_remains` decimal(28,8) NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `reason_of_reject` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `withdraw_logs`
--

INSERT INTO `withdraw_logs` (`id`, `user_id`, `withdraw_gateway_id`, `trx`, `user_data`, `charge`, `balance_remains`, `amount`, `reason_of_reject`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'UXZOK8PJPHFXVGB', '{\"email\":\"admin@admin.com\",\"account_information\":\"tewsts\",\"note\":\"test\"}', '5.00000000', '595.00000000', '205.00', NULL, 1, '2021-09-09 20:03:49', '2021-09-13 13:13:03'),
(2, 4, 1, 'MQGZVQZCAHFYHLW', '{\"email\":\"admin@admin.com\",\"account_information\":\"\",\"note\":\"\"}', '5.00000000', '3395.00000000', '205.00', NULL, 1, '2021-09-13 16:35:09', '2021-09-13 16:36:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `blog_categories_name_unique` (`name`),
  ADD UNIQUE KEY `blog_categories_slug_unique` (`slug`);

--
-- Indexes for table `blog_comments`
--
ALTER TABLE `blog_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `bookings_trx_unique` (`trx`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_name_unique` (`name`);

--
-- Indexes for table `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cookie_consents`
--
ALTER TABLE `cookie_consents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email_templates_name_unique` (`name`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `faq_categories`
--
ALTER TABLE `faq_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `faq_categories_name_unique` (`name`);

--
-- Indexes for table `gateways`
--
ALTER TABLE `gateways`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `gateways_gateway_name_unique` (`gateway_name`);

--
-- Indexes for table `general_settings`
--
ALTER TABLE `general_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `languages_name_unique` (`key`),
  ADD UNIQUE KEY `type` (`type`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_name_unique` (`name`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `section_data`
--
ALTER TABLE `section_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribes`
--
ALTER TABLE `subscribes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subscribes_email_unique` (`email`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `withdraw_gateways`
--
ALTER TABLE `withdraw_gateways`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `withdraw_logs`
--
ALTER TABLE `withdraw_logs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `withdraw_logs_trx_unique` (`trx`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `blog_comments`
--
ALTER TABLE `blog_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `chats`
--
ALTER TABLE `chats`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cookie_consents`
--
ALTER TABLE `cookie_consents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `faq_categories`
--
ALTER TABLE `faq_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `gateways`
--
ALTER TABLE `gateways`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `general_settings`
--
ALTER TABLE `general_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `schedules`
--
ALTER TABLE `schedules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `section_data`
--
ALTER TABLE `section_data`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `subscribes`
--
ALTER TABLE `subscribes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `withdraw_gateways`
--
ALTER TABLE `withdraw_gateways`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `withdraw_logs`
--
ALTER TABLE `withdraw_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
