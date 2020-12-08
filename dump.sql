

CREATE DATABASE IF NOT EXISTS `quest` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `quest`;

CREATE TABLE IF NOT EXISTS `pixel_stat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(50) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `view_date` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `page_url` varchar(255) NOT NULL,
  `views_count` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key-unique-user-page` (`ip_address`,`user_agent`,`page_url`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
