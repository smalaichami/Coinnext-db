/*
 Navicat Premium Data Transfer

 Source Server         : base
 Source Server Type    : MySQL
 Source Server Version : 50717
 Source Host           : 46.101.138.135
 Source Database       : otc_dev

 Target Server Type    : MySQL
 Target Server Version : 50717
 File Encoding         : utf-8

 Date: 04/16/2017 12:40:10 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `SequelizeMeta`
-- ----------------------------
DROP TABLE IF EXISTS `SequelizeMeta`;
CREATE TABLE `SequelizeMeta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from` varchar(255) DEFAULT NULL,
  `to` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `SequelizeMeta`
-- ----------------------------
BEGIN;
INSERT INTO `SequelizeMeta` VALUES ('1', '20140330192430', '20140330192430'), ('2', '20140330192430', '20140425141930'), ('3', '20140330192430', '20140505195830'), ('4', '20140330192430', '20140507195900'), ('5', '20140330192430', '20140524211930'), ('6', '20140330192430', '20140607215430'), ('7', '20140330192430', '20140610135430');
COMMIT;

-- ----------------------------
--  Table structure for `admin_users`
-- ----------------------------
DROP TABLE IF EXISTS `admin_users`;
CREATE TABLE `admin_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `gauth_key` varchar(32) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `gauth_key` (`gauth_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `auth_stats`
-- ----------------------------
DROP TABLE IF EXISTS `auth_stats`;
CREATE TABLE `auth_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `ip` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `auth_stats_user_id` (`user_id`),
  KEY `auth_stats_ip` (`ip`),
  KEY `auth_stats_created_at` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `auth_stats`
-- ----------------------------
BEGIN;
INSERT INTO `auth_stats` VALUES ('1', '1', '96874309', '2016-12-27 13:00:30', '2016-12-27 13:00:30'), ('2', '1', '1077849918', '2016-12-28 09:24:27', '2016-12-28 09:24:27'), ('3', '2', '835613344', '2017-03-29 18:41:25', '2017-03-29 18:41:25'), ('4', '1', '1385586690', '2017-03-31 13:35:14', '2017-03-31 13:35:14'), ('5', '1', '835613344', '2017-03-31 15:24:39', '2017-03-31 15:24:39'), ('6', '1', '96874309', '2017-04-15 11:04:49', '2017-04-15 11:04:49');
COMMIT;

-- ----------------------------
--  Table structure for `chats`
-- ----------------------------
DROP TABLE IF EXISTS `chats`;
CREATE TABLE `chats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `message` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `chats_user_id` (`user_id`),
  KEY `chats_created_at` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `market_stats`
-- ----------------------------
DROP TABLE IF EXISTS `market_stats`;
CREATE TABLE `market_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(10) unsigned NOT NULL,
  `last_price` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'FLOAT x 100000000',
  `yesterday_price` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'FLOAT x 100000000',
  `day_high` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'FLOAT x 100000000',
  `day_low` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'FLOAT x 100000000',
  `top_bid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'FLOAT x 100000000',
  `top_ask` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'FLOAT x 100000000',
  `volume1` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'FLOAT x 100000000',
  `volume2` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'FLOAT x 100000000',
  `growth_ratio` bigint(20) NOT NULL DEFAULT '0' COMMENT 'FLOAT x 100000000',
  `today` datetime DEFAULT NULL,
  `status` int(10) unsigned NOT NULL COMMENT 'enabled, disabled',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type` (`type`),
  KEY `market_stats_status` (`status`),
  KEY `market_stats_type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `market_stats`
-- ----------------------------
BEGIN;
INSERT INTO `market_stats` VALUES ('1', '2', '10', '0', '0', '0', '0', '0', '0', '0', '0', null, '1', '2016-11-04 12:18:17', '2016-11-04 12:18:17'), ('2', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', null, '1', '2016-11-04 12:18:17', '2016-11-04 12:18:17'), ('3', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', null, '1', '2016-11-04 12:18:17', '2016-11-04 12:18:17'), ('4', '6', '0', '0', '0', '0', '0', '0', '0', '0', '0', null, '1', '2016-11-04 12:18:17', '2016-11-04 12:18:17'), ('5', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', null, '1', '2016-11-04 12:18:17', '2016-11-04 12:18:17'), ('6', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', null, '1', '2016-11-04 12:18:17', '2016-11-04 12:18:17'), ('7', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', null, '1', '2016-11-04 12:18:17', '2016-11-04 12:18:17'), ('8', '8', '0', '0', '0', '0', '0', '0', '0', '0', '0', null, '1', '2016-11-04 12:18:17', '2016-11-04 12:18:17'), ('9', '9', '0', '0', '0', '0', '0', '0', '0', '0', '0', null, '1', '2016-11-04 12:18:17', '2016-11-04 12:18:17'), ('10', '12', '0', '0', '0', '0', '0', '0', '0', '0', '0', null, '1', '2016-11-04 12:18:17', '2016-11-04 12:18:17'), ('11', '11', '0', '0', '0', '0', '0', '0', '0', '0', '0', null, '1', '2016-11-04 12:18:17', '2016-11-04 12:18:17'), ('12', '14', '0', '0', '0', '0', '0', '0', '0', '0', '0', null, '1', '2016-11-04 12:18:17', '2016-11-04 12:18:17'), ('13', '10', '0', '0', '0', '0', '0', '0', '0', '0', '0', null, '1', '2016-11-04 12:18:17', '2016-11-04 12:18:17'), ('14', '17', '0', '0', '0', '0', '0', '0', '0', '0', '0', null, '1', '2016-11-04 12:18:17', '2016-11-04 12:18:17'), ('15', '15', '0', '0', '0', '0', '0', '0', '0', '0', '0', null, '1', '2016-11-04 12:18:17', '2016-11-04 12:18:17'), ('16', '13', '0', '0', '0', '0', '0', '0', '0', '0', '0', null, '1', '2016-11-04 12:18:17', '2016-11-04 12:18:17'), ('17', '16', '0', '0', '0', '0', '0', '0', '0', '0', '0', null, '1', '2016-11-04 12:18:17', '2016-11-04 12:18:17'), ('18', '20', '0', '0', '0', '0', '0', '0', '0', '0', '0', null, '1', '2016-11-04 12:18:17', '2016-11-04 12:18:17'), ('19', '18', '0', '0', '0', '0', '0', '0', '0', '0', '0', null, '1', '2016-11-04 12:18:17', '2016-11-04 12:18:17'), ('20', '21', '0', '0', '0', '0', '0', '0', '0', '0', '0', null, '1', '2016-11-04 12:18:17', '2016-11-04 12:18:17'), ('21', '23', '0', '0', '0', '0', '0', '0', '0', '0', '0', null, '1', '2016-11-04 12:18:17', '2016-11-04 12:18:17'), ('22', '22', '0', '0', '0', '0', '0', '0', '0', '0', '0', null, '1', '2016-11-04 12:18:17', '2016-11-04 12:18:17'), ('23', '27', '0', '0', '0', '0', '0', '0', '0', '0', '0', null, '1', '2016-11-04 12:18:17', '2016-11-04 12:18:17'), ('24', '30', '0', '0', '0', '0', '0', '0', '0', '0', '0', null, '1', '2016-11-04 12:18:17', '2016-11-04 12:18:17'), ('25', '32', '0', '0', '0', '0', '0', '0', '0', '0', '0', null, '1', '2016-11-04 12:18:17', '2016-11-04 12:18:17'), ('26', '31', '0', '0', '0', '0', '0', '0', '0', '0', '0', null, '1', '2016-11-04 12:18:17', '2016-11-04 12:18:17'), ('27', '19', '0', '0', '0', '0', '0', '0', '0', '0', '0', null, '1', '2016-11-04 12:18:17', '2016-11-04 12:18:17'), ('28', '34', '0', '0', '0', '0', '0', '0', '0', '0', '0', null, '1', '2016-11-04 12:18:17', '2016-11-04 12:18:17'), ('29', '35', '0', '0', '0', '0', '0', '0', '0', '0', '0', null, '1', '2016-11-04 12:18:17', '2016-11-04 12:18:17'), ('30', '36', '0', '0', '0', '0', '0', '0', '0', '0', '0', null, '1', '2016-11-04 12:18:17', '2016-11-04 12:18:17'), ('31', '37', '0', '0', '0', '0', '0', '0', '0', '0', '0', null, '1', '2016-11-04 12:18:17', '2016-11-04 12:18:17'), ('32', '24', '0', '0', '0', '0', '0', '0', '0', '0', '0', null, '1', '2016-11-04 12:18:17', '2016-11-04 12:18:17'), ('33', '25', '0', '0', '0', '0', '0', '0', '0', '0', '0', null, '1', '2016-11-04 12:18:17', '2016-11-04 12:18:17'), ('34', '40', '0', '0', '0', '0', '0', '0', '0', '0', '0', null, '1', '2016-11-04 12:18:17', '2016-11-04 12:18:17'), ('35', '42', '0', '0', '0', '0', '0', '0', '0', '0', '0', null, '1', '2016-11-04 12:18:17', '2016-11-04 12:18:17'), ('36', '43', '0', '0', '0', '0', '0', '0', '0', '0', '0', null, '1', '2016-11-04 12:18:17', '2016-11-04 12:18:17'), ('37', '45', '0', '0', '0', '0', '0', '0', '0', '0', '0', null, '1', '2016-11-04 12:18:17', '2016-11-04 12:18:17'), ('38', '44', '0', '0', '0', '0', '0', '0', '0', '0', '0', null, '1', '2016-11-04 12:18:17', '2016-11-04 12:18:17'), ('39', '46', '0', '0', '0', '0', '0', '0', '0', '0', '0', null, '1', '2016-11-04 12:18:17', '2016-11-04 12:18:17'), ('40', '41', '0', '0', '0', '0', '0', '0', '0', '0', '0', null, '1', '2016-11-04 12:18:17', '2016-11-04 12:18:17'), ('41', '47', '0', '0', '0', '0', '0', '0', '0', '0', '0', null, '1', '2016-11-04 12:18:17', '2016-11-04 12:18:17'), ('42', '26', '0', '0', '0', '0', '0', '0', '0', '0', '0', null, '1', '2016-11-04 12:18:17', '2016-11-04 12:18:17'), ('43', '51', '0', '0', '0', '0', '0', '0', '0', '0', '0', null, '1', '2016-11-04 12:18:17', '2016-11-04 12:18:17'), ('44', '28', '0', '0', '0', '0', '0', '0', '0', '0', '0', null, '1', '2016-11-04 12:18:17', '2016-11-04 12:18:17'), ('45', '52', '0', '0', '0', '0', '0', '0', '0', '0', '0', null, '1', '2016-11-04 12:18:17', '2016-11-04 12:18:17'), ('46', '54', '0', '0', '0', '0', '0', '0', '0', '0', '0', null, '1', '2016-11-04 12:18:17', '2016-11-04 12:18:17'), ('47', '56', '0', '0', '0', '0', '0', '0', '0', '0', '0', null, '1', '2016-11-04 12:18:17', '2016-11-04 12:18:17'), ('48', '57', '0', '0', '0', '0', '0', '0', '0', '0', '0', null, '1', '2016-11-04 12:18:17', '2016-11-04 12:18:17'), ('49', '50', '0', '0', '0', '0', '0', '0', '0', '0', '0', null, '1', '2016-11-04 12:18:17', '2016-11-04 12:18:17'), ('50', '55', '0', '0', '0', '0', '0', '0', '0', '0', '0', null, '1', '2016-11-04 12:18:17', '2016-11-04 12:18:17'), ('51', '59', '0', '0', '0', '0', '0', '0', '0', '0', '0', null, '1', '2016-11-04 12:18:17', '2016-11-04 12:18:17'), ('52', '33', '0', '0', '0', '0', '0', '0', '0', '0', '0', null, '1', '2016-11-04 12:18:17', '2016-11-04 12:18:17'), ('53', '58', '0', '0', '0', '0', '0', '0', '0', '0', '0', null, '1', '2016-11-04 12:18:17', '2016-11-04 12:18:17'), ('54', '53', '0', '0', '0', '0', '0', '0', '0', '0', '0', null, '1', '2016-11-04 12:18:17', '2016-11-04 12:18:17'), ('55', '29', '0', '0', '0', '0', '0', '0', '0', '0', '0', null, '1', '2016-11-04 12:18:17', '2016-11-04 12:18:17'), ('56', '39', '0', '0', '0', '0', '0', '0', '0', '0', '0', null, '1', '2016-11-04 12:18:17', '2016-11-04 12:18:17'), ('57', '38', '0', '0', '0', '0', '0', '0', '0', '0', '0', null, '1', '2016-11-04 12:18:17', '2016-11-04 12:18:17'), ('58', '48', '0', '0', '0', '0', '0', '0', '0', '0', '0', null, '1', '2016-11-04 12:18:17', '2016-11-04 12:18:17'), ('59', '49', '0', '0', '0', '0', '0', '0', '0', '0', '0', null, '1', '2016-11-04 12:18:17', '2016-11-04 12:18:17');
COMMIT;

-- ----------------------------
--  Table structure for `order_logs`
-- ----------------------------
DROP TABLE IF EXISTS `order_logs`;
CREATE TABLE `order_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL,
  `matched_amount` bigint(20) unsigned DEFAULT '0' COMMENT 'FLOAT x 100000000',
  `result_amount` bigint(20) unsigned DEFAULT '0' COMMENT 'FLOAT x 100000000',
  `fee` bigint(20) unsigned DEFAULT '0' COMMENT 'FLOAT x 100000000',
  `unit_price` bigint(20) unsigned DEFAULT '0' COMMENT 'FLOAT x 100000000',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `time` datetime DEFAULT NULL,
  `status` int(10) unsigned NOT NULL DEFAULT '1' COMMENT 'open, partiallyCompleted, completed',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_logs_active` (`active`),
  KEY `order_logs_status` (`status`),
  KEY `order_logs_order_id` (`order_id`),
  KEY `order_logs_time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `type` int(10) unsigned NOT NULL COMMENT 'market, limit',
  `action` int(10) unsigned NOT NULL COMMENT 'buy, sell',
  `buy_currency` int(10) unsigned NOT NULL,
  `sell_currency` int(10) unsigned NOT NULL,
  `amount` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'FLOAT x 100000000',
  `matched_amount` bigint(20) unsigned DEFAULT '0' COMMENT 'FLOAT x 100000000',
  `result_amount` bigint(20) unsigned DEFAULT '0' COMMENT 'FLOAT x 100000000',
  `fee` bigint(20) unsigned DEFAULT '0' COMMENT 'FLOAT x 100000000',
  `unit_price` bigint(20) unsigned DEFAULT '0' COMMENT 'FLOAT x 100000000',
  `status` int(10) unsigned NOT NULL DEFAULT '1' COMMENT 'open, partiallyCompleted, completed',
  `in_queue` tinyint(1) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `close_time` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_action` (`action`),
  KEY `orders_user_id` (`user_id`),
  KEY `orders_buy_currency` (`buy_currency`),
  KEY `orders_sell_currency` (`sell_currency`),
  KEY `orders_status` (`status`),
  KEY `orders_created_at` (`created_at`),
  KEY `orders_close_time` (`close_time`),
  KEY `orders_deleted_at` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `payment_logs`
-- ----------------------------
DROP TABLE IF EXISTS `payment_logs`;
CREATE TABLE `payment_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_id` int(10) unsigned NOT NULL,
  `log` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `payment_logs_payment_id` (`payment_id`),
  KEY `payment_logs_created_at` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `payments`
-- ----------------------------
DROP TABLE IF EXISTS `payments`;
CREATE TABLE `payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `wallet_id` int(10) unsigned NOT NULL,
  `transaction_id` varchar(64) DEFAULT NULL,
  `currency` int(10) unsigned NOT NULL,
  `address` varchar(34) NOT NULL,
  `amount` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'FLOAT x 100000000',
  `fee` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'FLOAT x 100000000',
  `status` int(10) unsigned DEFAULT '1' COMMENT 'pending, processed, canceled',
  `remote_ip` int(11) DEFAULT NULL,
  `fraud` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `transaction_id` (`transaction_id`),
  KEY `payments_status` (`status`),
  KEY `payments_user_id` (`user_id`),
  KEY `payments_created_at` (`created_at`),
  KEY `payments_wallet_id` (`wallet_id`),
  KEY `payments_fraud` (`fraud`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `trade_stats`
-- ----------------------------
DROP TABLE IF EXISTS `trade_stats`;
CREATE TABLE `trade_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(10) unsigned NOT NULL,
  `open_price` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'FLOAT x 100000000',
  `close_price` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'FLOAT x 100000000',
  `high_price` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'FLOAT x 100000000',
  `low_price` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'FLOAT x 100000000',
  `volume` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'FLOAT x 100000000',
  `exchange_volume` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'FLOAT x 100000000',
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trade_stats_type` (`type`),
  KEY `trade_stats_start_time` (`start_time`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `trade_stats`
-- ----------------------------
BEGIN;
INSERT INTO `trade_stats` VALUES ('1', '1', '77984000000', '78000000000', '78090000000', '77308100000', '6831826722', '0', '2016-11-03 14:30:00', '2016-11-03 15:00:00'), ('2', '1', '78090000000', '77984000000', '78100000000', '77810300000', '5138206402', '0', '2016-11-03 15:00:00', '2016-11-03 15:30:00'), ('3', '1', '77703900000', '78100000000', '78198400000', '77601100000', '8314108012', '0', '2016-11-03 15:30:00', '2016-11-03 16:00:00'), ('4', '1', '77400000000', '77781000000', '77945900000', '77144000000', '18190308203', '0', '2016-11-03 16:00:00', '2016-11-03 16:30:00'), ('5', '1', '77395000000', '77408000000', '77600000000', '77150000000', '5547094078', '0', '2016-11-03 16:30:00', '2016-11-03 17:00:00'), ('6', '1', '77400000000', '77395000000', '77777500000', '77250000000', '5871336455', '0', '2016-11-03 17:00:00', '2016-11-03 17:30:00'), ('7', '1', '77456100000', '77400000000', '77649900000', '77144200000', '6769171032', '0', '2016-11-03 17:30:00', '2016-11-03 18:00:00'), ('8', '1', '77250000000', '77400000000', '77502400000', '76901200000', '17165156336', '0', '2016-11-03 18:00:00', '2016-11-03 18:30:00'), ('9', '1', '76701000000', '76901200000', '77280000000', '76700000000', '9200133851', '0', '2016-11-03 18:30:00', '2016-11-03 19:00:00'), ('10', '1', '76500200000', '76701000000', '77000000000', '76500200000', '7688759789', '0', '2016-11-03 19:00:00', '2016-11-03 19:30:00'), ('11', '1', '76110000000', '76609900000', '76609900000', '76101000000', '43946252646', '0', '2016-11-03 19:30:00', '2016-11-03 20:00:00'), ('12', '1', '76630000000', '76110000000', '76799300000', '76101000000', '10819007670', '0', '2016-11-03 20:00:00', '2016-11-03 20:30:00'), ('13', '1', '76100000000', '76430000000', '76630000000', '76100000000', '20148534192', '0', '2016-11-03 20:30:00', '2016-11-03 21:00:00'), ('14', '1', '76204000000', '76367100000', '76499000000', '76100100000', '10265387933', '0', '2016-11-03 21:00:00', '2016-11-03 21:30:00'), ('15', '1', '76485700000', '76498900000', '76498900000', '76200000000', '10662740328', '0', '2016-11-03 21:30:00', '2016-11-03 22:00:00'), ('16', '1', '76190000000', '76498000000', '76595000000', '76000000000', '10701773136', '0', '2016-11-03 22:00:00', '2016-11-03 22:30:00'), ('17', '1', '76247900000', '76030000000', '76450000000', '76005100000', '7633992603', '0', '2016-11-03 22:30:00', '2016-11-03 23:00:00'), ('18', '1', '75498700000', '76200000000', '76200000000', '75399000000', '23390507099', '0', '2016-11-03 23:00:00', '2016-11-03 23:30:00'), ('19', '1', '73899900000', '75498700000', '75500000000', '73523000000', '90209223436', '0', '2016-11-03 23:30:00', '2016-11-04 00:00:00'), ('20', '1', '74022000000', '73899900000', '75478800000', '73523000000', '46797145301', '0', '2016-11-04 00:00:00', '2016-11-04 00:30:00'), ('21', '1', '72500500000', '74112500000', '74112500000', '72500000000', '122864581651', '0', '2016-11-04 00:30:00', '2016-11-04 01:00:00'), ('22', '1', '73400000000', '72500500000', '73886000000', '72222200000', '59937747294', '0', '2016-11-04 01:00:00', '2016-11-04 01:30:00'), ('23', '1', '73357400000', '73653700000', '73989900000', '73200000000', '40302641668', '0', '2016-11-04 01:30:00', '2016-11-04 02:00:00'), ('24', '1', '73600000000', '73320100000', '74328000000', '72800100000', '20526895699', '0', '2016-11-04 02:00:00', '2016-11-04 02:30:00'), ('25', '1', '73620000000', '73600000000', '74017000000', '73510200000', '31027347296', '0', '2016-11-04 02:30:00', '2016-11-04 03:00:00'), ('26', '1', '72070000000', '73620000000', '73753900000', '72000000000', '66561072276', '0', '2016-11-04 03:00:00', '2016-11-04 03:30:00'), ('27', '1', '71450000000', '72070000000', '72299900000', '70659000000', '101348560361', '0', '2016-11-04 03:30:00', '2016-11-04 04:00:00'), ('28', '1', '71980000000', '71450000000', '72299900000', '71240000000', '33328169499', '0', '2016-11-04 04:00:00', '2016-11-04 04:30:00'), ('29', '1', '70149000000', '71968400000', '73400000000', '69000000000', '220899443381', '0', '2016-11-04 04:30:00', '2016-11-04 05:00:00'), ('30', '1', '72500000000', '70149000000', '74000000000', '67980000000', '248521726338', '0', '2016-11-04 05:00:00', '2016-11-04 05:30:00'), ('31', '1', '70800000000', '72747700000', '73000000000', '69300000000', '179770431450', '0', '2016-11-04 05:30:00', '2016-11-04 06:00:00'), ('32', '1', '70300000000', '71040000000', '72558400000', '67610000000', '251255904813', '0', '2016-11-04 06:00:00', '2016-11-04 06:30:00'), ('33', '1', '70878200000', '70200000000', '72500000000', '68966400000', '163863514872', '0', '2016-11-04 06:30:00', '2016-11-04 07:00:00'), ('34', '1', '71052200000', '70878200000', '71850000000', '69800000000', '110245756224', '0', '2016-11-04 07:00:00', '2016-11-04 07:30:00'), ('35', '1', '70300000000', '71200000000', '71900000000', '70249000000', '80981615886', '0', '2016-11-04 07:30:00', '2016-11-04 08:00:00'), ('36', '1', '69970000000', '70300000000', '70766000000', '69710000000', '53551401961', '0', '2016-11-04 08:00:00', '2016-11-04 08:30:00'), ('37', '1', '69550000000', '69970000000', '70999900000', '68820000000', '61148052543', '0', '2016-11-04 08:30:00', '2016-11-04 09:00:00'), ('38', '1', '70899000000', '69667500000', '71190000000', '69667500000', '42333686581', '0', '2016-11-04 09:00:00', '2016-11-04 09:30:00'), ('39', '1', '71499800000', '70899000000', '71500000000', '70150600000', '44739458863', '0', '2016-11-04 09:30:00', '2016-11-04 10:00:00'), ('40', '1', '71100000000', '71499800000', '71499900000', '70600000000', '51617074954', '0', '2016-11-04 10:00:00', '2016-11-04 10:30:00'), ('41', '1', '70153700000', '71100000000', '71180000000', '70153700000', '38855169839', '0', '2016-11-04 10:30:00', '2016-11-04 11:00:00'), ('42', '1', '71899900000', '70150400000', '71900000000', '70000000000', '68615872400', '0', '2016-11-04 11:00:00', '2016-11-04 11:30:00'), ('43', '1', '72499900000', '71840000000', '72930000000', '71565000000', '76343130188', '0', '2016-11-04 11:30:00', '2016-11-04 12:00:00'), ('44', '1', '73060000000', '72499900000', '73700000000', '72250000000', '59879273912', '0', '2016-11-04 12:00:00', '2016-11-04 12:30:00'), ('45', '1', '73310000000', '73300000000', '73400000000', '72565800000', '26610094641', '0', '2016-11-04 12:30:00', '2016-11-04 13:00:00'), ('46', '1', '72606500000', '73323700000', '73489900000', '72500000000', '22204022134', '0', '2016-11-04 13:00:00', '2016-11-04 13:30:00'), ('47', '1', '72200100000', '72606500000', '72690000000', '71600000000', '40690472449', '0', '2016-11-04 13:30:00', '2016-11-04 14:00:00'), ('48', '1', '72487200000', '72300000000', '72649900000', '72001100000', '12037654008', '0', '2016-11-04 14:00:00', '2016-11-04 14:30:00'), ('49', '1', '72437200000', '72437200000', '72437200000', '72437200000', '5000000', '0', '2016-11-04 14:30:00', '2016-11-04 15:00:00'), ('50', '2', '664000', '665000', '666000', '664000', '23219048310', '0', '2016-11-03 14:30:00', '2016-11-03 15:00:00'), ('51', '2', '665000', '713000', '865000', '564000', '56719048310', '0', '2016-11-03 15:00:00', '2016-11-03 15:30:00'), ('52', '2', '713000', '508000', '899000', '264000', '82719048310', '0', '2016-11-03 15:30:00', '2016-11-03 16:00:00'), ('53', '3', '664000', '665000', '666000', '664000', '23219048310', '0', '2016-11-03 14:30:00', '2016-11-03 15:00:00'), ('54', '3', '665000', '713000', '865000', '564000', '56719048310', '0', '2016-11-03 15:00:00', '2016-11-03 15:30:00'), ('55', '3', '713000', '508000', '899000', '264000', '82719048310', '0', '2016-11-03 15:30:00', '2016-11-03 16:00:00');
COMMIT;

-- ----------------------------
--  Table structure for `transactions`
-- ----------------------------
DROP TABLE IF EXISTS `transactions`;
CREATE TABLE `transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `wallet_id` int(10) unsigned DEFAULT NULL,
  `currency` int(10) unsigned NOT NULL,
  `account` varchar(50) DEFAULT NULL,
  `fee` bigint(20) unsigned DEFAULT '0' COMMENT 'FLOAT x 100000000',
  `address` varchar(34) NOT NULL,
  `amount` bigint(20) NOT NULL DEFAULT '0' COMMENT 'FLOAT x 100000000',
  `category` int(10) unsigned NOT NULL COMMENT 'send, receive',
  `txid` varchar(64) NOT NULL,
  `confirmations` int(10) unsigned DEFAULT '0',
  `balance_loaded` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `transactions_user_id` (`user_id`),
  KEY `transactions_wallet_id` (`wallet_id`),
  KEY `transactions_category` (`category`),
  KEY `transactions_balance_loaded` (`balance_loaded`),
  KEY `transactions_txid` (`txid`),
  KEY `transactions_created_at` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `user_tokens`
-- ----------------------------
DROP TABLE IF EXISTS `user_tokens`;
CREATE TABLE `user_tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `type` int(10) unsigned NOT NULL COMMENT 'email_confirmation, google_auth, change_password',
  `token` varchar(100) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`),
  KEY `user_tokens_type` (`type`),
  KEY `user_tokens_active` (`active`),
  KEY `user_tokens_user_id` (`user_id`),
  KEY `user_tokens_token` (`token`),
  KEY `user_tokens_created_at` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `user_tokens`
-- ----------------------------
BEGIN;
INSERT INTO `user_tokens` VALUES ('1', '1', '1', '4682eb8f5eec6db29b241db7663b49dd0aea2ff069127b3bbe446e25c957fde6', '1', '2016-12-27 13:00:29', '2016-12-27 13:00:29'), ('2', '2', '1', '9424513c88fe1f5607bb1f25e872520ca132bd2cec619f9babd28834a99d86b0', '1', '2017-03-29 18:41:24', '2017-03-29 18:41:24');
COMMIT;

-- ----------------------------
--  Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email_verified` tinyint(1) NOT NULL DEFAULT '0',
  `chat_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `email_auth_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username` (`username`),
  KEY `users_created_at` (`created_at`),
  KEY `users_updated_at` (`updated_at`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `users`
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES ('1', '896ddf80-c8c0-4994-a37b-38e9c1891aa7', 'ychaim@gmail.com', 'ef74f2c056d8c1b16b5fd0f5f9ebcea9abd6b80ae83dc34b3f5959c68625a908', 'Quegoru', '0', '1', '1', '2016-12-27 13:00:29', '2016-12-27 13:00:29'), ('2', 'e4119b63-158e-4902-843c-57ce4d79a89d', 'saravana.malaichami@gmail.com', '71121578ce02a010a5e13ff94c6552f80a02a9a18fd5fee5e3c57ebd5a7237f8', 'Dimenu', '0', '1', '1', '2017-03-29 18:41:24', '2017-03-29 18:41:24');
COMMIT;

-- ----------------------------
--  Table structure for `wallet_health`
-- ----------------------------
DROP TABLE IF EXISTS `wallet_health`;
CREATE TABLE `wallet_health` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `currency` int(10) unsigned NOT NULL,
  `blocks` int(10) unsigned NOT NULL DEFAULT '0',
  `connections` int(10) unsigned NOT NULL DEFAULT '0',
  `last_updated` datetime DEFAULT NULL,
  `balance` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'FLOAT x 100000000',
  `status` int(10) unsigned NOT NULL DEFAULT '1' COMMENT 'normal, delayed, blocked, inactive',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wallet_health_status` (`status`),
  KEY `wallet_health_currency` (`currency`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `wallets`
-- ----------------------------
DROP TABLE IF EXISTS `wallets`;
CREATE TABLE `wallets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `currency` int(10) unsigned NOT NULL,
  `address` varchar(34) DEFAULT NULL,
  `balance` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'FLOAT x 100000000',
  `hold_balance` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'FLOAT x 100000000',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `address` (`address`),
  KEY `wallets_address` (`address`),
  KEY `wallets_user_id` (`user_id`),
  KEY `wallets_currency` (`currency`),
  KEY `wallets_created_at` (`created_at`),
  KEY `wallets_balance` (`balance`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `wallets`
-- ----------------------------
BEGIN;
INSERT INTO `wallets` VALUES ('1', '1', '1', null, '0', '0', '2016-12-27 13:00:29', '2016-12-27 13:00:29'), ('2', '2', '1', null, '0', '0', '2017-03-29 18:41:24', '2017-03-29 18:41:24'), ('3', '2', '24', null, '0', '0', '2017-03-29 18:42:20', '2017-03-29 18:42:20'), ('4', '2', '22', null, '0', '0', '2017-03-29 18:42:30', '2017-03-29 18:42:30'), ('5', '1', '24', null, '0', '0', '2017-03-31 17:22:56', '2017-03-31 17:22:56'), ('6', '1', '41', null, '0', '0', '2017-03-31 17:23:39', '2017-03-31 17:23:39'), ('7', '1', '53', null, '0', '0', '2017-03-31 17:23:59', '2017-03-31 17:23:59'), ('8', '1', '57', null, '0', '0', '2017-04-15 11:05:27', '2017-04-15 11:05:27');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
