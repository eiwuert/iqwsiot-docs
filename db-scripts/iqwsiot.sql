-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 11, 2017 at 01:13 PM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `iqwsiot`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_device_map`
--

CREATE TABLE `account_device_map` (
  `account_id` int(11) NOT NULL,
  `device_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- --------------------------------------------------------

--
-- Table structure for table `account_master`
--

CREATE TABLE `account_master` (
  `account_id` int(11) NOT NULL,
  `account_name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- --------------------------------------------------------

--
-- Table structure for table `device_master`
--

CREATE TABLE `device_master` (
  `device_id` int(11) NOT NULL,
  `device_ref` int(11) NOT NULL,
  `serial_num` int(11) NOT NULL,
  `device_name` text NOT NULL,
  `device_secret_key` varchar(30) NOT NULL,
  `device_status` enum('NEW','READY_FOR_PROVISION','PROVISION','PROVISIONED','ACTIVE','INACTIVE','DELETED') NOT NULL DEFAULT 'NEW',
  `device_hardware_ver` int(11) NOT NULL,
  `device_bootloader_ver` varchar(11) NOT NULL,
  `device_firmware_ver` int(11) NOT NULL,
  `mac_address` varchar(18) NOT NULL,
  `imei_number` int(16) NOT NULL,
  `sim_number` int(19) NOT NULL,
  `imsi` int(16) NOT NULL,
  `phone_number` int(11) NOT NULL,
  `connection_status` enum('ONLINE','OFFLINE','UNKNOWN','') NOT NULL DEFAULT 'UNKNOWN',
  `updated_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `config_last_updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `config_last_synced` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- --------------------------------------------------------

--
-- Table structure for table `device_sensor_map`
--

CREATE TABLE `device_sensor_map` (
  `device_id` int(11) NOT NULL,
  `sensor_type_id` int(11) NOT NULL,
  `sensor_type` text NOT NULL,
  `sensor_name` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- --------------------------------------------------------

--
-- Table structure for table `gps_sensor_data`
--

CREATE TABLE `gps_sensor_data` (
  `entry_id` int(11) NOT NULL,
  `utc_time_stamp` datetime DEFAULT NULL,
  `latitude` decimal(9,7) DEFAULT NULL,
  `longitude` decimal(10,7) DEFAULT NULL,
  `altitude` decimal(10,0) DEFAULT NULL,
  `speed` decimal(11,6) DEFAULT NULL,
  `last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- --------------------------------------------------------

--
-- Table structure for table `humidity_sensor_data`
--

CREATE TABLE `humidity_sensor_data` (
  `entry_id` int(11) NOT NULL,
  `humidity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- --------------------------------------------------------

--
-- Table structure for table `imei_master`
--

CREATE TABLE `imei_master` (
  `imei_number` bigint(16) NOT NULL,
  `imei_status` enum('NEW','ACTIVE','INACTIVE','DELETED') NOT NULL DEFAULT 'NEW',
  `updated_timestamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- --------------------------------------------------------

--
-- Table structure for table `lock_sensor_data`
--

CREATE TABLE `lock_sensor_data` (
  `entry_id` int(11) NOT NULL,
  `lock_status` enum('LOCKED','UNLOCKED','UNKNOWN','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- --------------------------------------------------------

--
-- Table structure for table `sensor_data_master`
--

CREATE TABLE `sensor_data_master` (
  `entry_id` int(11) NOT NULL,
  `device_id` text NOT NULL,
  `message_id` text,
  `battery_level` int(11) NOT NULL,
  `gps_sensor` tinyint(1) NOT NULL,
  `temperature_sensor` tinyint(1) NOT NULL,
  `lock_sensor` tinyint(1) NOT NULL,
  `humidity_sensor` tinyint(1) NOT NULL,
  `last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- --------------------------------------------------------

--
-- Table structure for table `sensor_type_master`
--

CREATE TABLE `sensor_type_master` (
  `sensor_type_id` int(11) NOT NULL,
  `sensor_type` text NOT NULL,
  `sensor_type_description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sensor_type_master`
--

INSERT INTO `sensor_type_master` (`sensor_type_id`, `sensor_type`, `sensor_type_description`) VALUES
(1, 'GPS Sensor', 'Sensor to capture GPS data'),
(2, 'Temperature Sensor', 'Sensor to measure temperature'),
(3, 'Lock Sensor', 'Sensor to detect lock status');

-- --------------------------------------------------------

--
-- Table structure for table `temperature_sensor_data`
--

CREATE TABLE `temperature_sensor_data` (
  `entry_id` int(11) NOT NULL,
  `temperature` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- --------------------------------------------------------

--
-- Table structure for table `ums_login_details`
--

CREATE TABLE `ums_login_details` (
  `user_id` int(11) NOT NULL,
  `system_session_id` varchar(50) NOT NULL,
  `native_token` varchar(100) DEFAULT NULL,
  `login_time` datetime NOT NULL,
  `access_ip` varchar(45) DEFAULT NULL,
  `access_port` varchar(5) DEFAULT NULL,
  `access_gateway` varchar(45) DEFAULT NULL,
  `actual_access_ip` varchar(45) DEFAULT NULL,
  `device_type` varchar(100) DEFAULT NULL,
  `operating_system` varchar(100) DEFAULT NULL,
  `operating_system_manufacturer` varchar(100) DEFAULT NULL,
  `browser_name` varchar(100) DEFAULT NULL,
  `browser_version` varchar(100) DEFAULT NULL,
  `browser_manufacturer` varchar(100) DEFAULT NULL,
  `browser_type` varchar(100) DEFAULT NULL,
  `browser_rendering_engine` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- --------------------------------------------------------

--
-- Table structure for table `ums_session_details`
--

CREATE TABLE `ums_session_details` (
  `USER_ID` int(11) NOT NULL,
  `SYSTEM_SESSION_ID` varchar(50) NOT NULL,
  `SESSION_STATUS` int(2) NOT NULL,
  `NATIVE_TOKEN` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- --------------------------------------------------------

--
-- Table structure for table `ums_user`
--

CREATE TABLE `ums_user` (
  `user_id` int(11) NOT NULL,
  `user_access_key` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(90) NOT NULL,
  `user_type` int(1) NOT NULL,
  `user_status` int(2) NOT NULL,
  `additional_id` varchar(100) DEFAULT NULL,
  `user_creation_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_created_by` int(11) DEFAULT NULL,
  `user_updated_stamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `user_updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- --------------------------------------------------------

--
-- Table structure for table `ums_user_details`
--

CREATE TABLE `ums_user_details` (
  `user_id` int(11) NOT NULL,
  `user_first_name` varchar(100) DEFAULT NULL,
  `user_last_name` varchar(100) DEFAULT NULL,
  `user_alias` varchar(50) DEFAULT NULL,
  `user_address` varchar(500) DEFAULT NULL,
  `primary_phone` varchar(30) DEFAULT NULL,
  `primary_email` varchar(100) DEFAULT NULL,
  `alternate_phone` varchar(30) DEFAULT NULL,
  `alternate_email` varchar(100) DEFAULT NULL,
  `gender` int(1) DEFAULT NULL,
  `date_of_birth_stamp` date DEFAULT NULL,
  `anniversary_stamp` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Indexes for table `account_master`
--
ALTER TABLE `account_master`
  ADD PRIMARY KEY (`account_id`);

--
-- Indexes for table `device_master`
--
ALTER TABLE `device_master`
  ADD PRIMARY KEY (`device_id`);

--
-- Indexes for table `gps_sensor_data`
--
ALTER TABLE `gps_sensor_data`
  ADD PRIMARY KEY (`entry_id`);

--
-- Indexes for table `humidity_sensor_data`
--
ALTER TABLE `humidity_sensor_data`
  ADD UNIQUE KEY `idx_entry_id_unique` (`entry_id`);

--
-- Indexes for table `imei_master`
--
ALTER TABLE `imei_master`
  ADD UNIQUE KEY `imei_number_unique` (`imei_number`) USING BTREE;

--
-- Indexes for table `lock_sensor_data`
--
ALTER TABLE `lock_sensor_data`
  ADD UNIQUE KEY `idx_entry_id_unique` (`entry_id`);

--
-- Indexes for table `sensor_data_master`
--
ALTER TABLE `sensor_data_master`
  ADD PRIMARY KEY (`entry_id`);

--
-- Indexes for table `temperature_sensor_data`
--
ALTER TABLE `temperature_sensor_data`
  ADD UNIQUE KEY `idx_entry_id_unique` (`entry_id`);

--
-- Indexes for table `ums_login_details`
--
ALTER TABLE `ums_login_details`
  ADD PRIMARY KEY (`system_session_id`),
  ADD KEY `USER_ID` (`user_id`);

--
-- Indexes for table `ums_session_details`
--
ALTER TABLE `ums_session_details`
  ADD PRIMARY KEY (`SYSTEM_SESSION_ID`),
  ADD KEY `USER_ID` (`USER_ID`);

--
-- Indexes for table `ums_user`
--
ALTER TABLE `ums_user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `idx_user_access_key_unique` (`user_access_key`) USING BTREE;

--
-- Indexes for table `ums_user_details`
--
ALTER TABLE `ums_user_details`
  ADD KEY `USER_ID` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_master`
--
ALTER TABLE `account_master`
  MODIFY `account_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `device_master`
--
ALTER TABLE `device_master`
  MODIFY `device_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `gps_sensor_data`
--
ALTER TABLE `gps_sensor_data`
  MODIFY `entry_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `sensor_data_master`
--
ALTER TABLE `sensor_data_master`
  MODIFY `entry_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `ums_user`
--
ALTER TABLE `ums_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `ums_login_details`
--
ALTER TABLE `ums_login_details`
  ADD CONSTRAINT `ums_login_details_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `ums_user` (`user_id`);

--
-- Constraints for table `ums_session_details`
--
ALTER TABLE `ums_session_details`
  ADD CONSTRAINT `ums_session_details_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `ums_user` (`user_id`);

--
-- Constraints for table `ums_user_details`
--
ALTER TABLE `ums_user_details`
  ADD CONSTRAINT `ums_user_details_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `ums_user` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
