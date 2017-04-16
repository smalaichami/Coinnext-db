/*
 Navicat Premium Data Transfer

 Source Server         : base
 Source Server Type    : MySQL
 Source Server Version : 50717
 Source Host           : 46.101.138.135
 Source Database       : otc_prod

 Target Server Type    : MySQL
 Target Server Version : 50717
 File Encoding         : utf-8

 Date: 04/16/2017 12:40:48 PM
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `admin_users`
-- ----------------------------
BEGIN;
INSERT INTO `admin_users` VALUES ('1', 'ychaim@gmail.com', 'ef74f2c056d8c1b16b5fd0f5f9ebcea9abd6b80ae83dc34b3f5959c68625a908', 'NRNUYOLCOV6SMNTVOU3G6R2GNYXES5CN', '2016-11-04 12:45:48', '2016-11-04 12:45:48');
COMMIT;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `buy_orders`
-- ----------------------------
DROP TABLE IF EXISTS `buy_orders`;
CREATE TABLE `buy_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `external_order_id` int(10) unsigned NOT NULL,
  `type` int(10) unsigned NOT NULL COMMENT 'market, limit',
  `buy_currency` int(10) unsigned NOT NULL,
  `sell_currency` int(10) unsigned NOT NULL,
  `amount` bigint(20) unsigned NOT NULL DEFAULT '0',
  `matched_amount` bigint(20) unsigned DEFAULT '0',
  `result_amount` bigint(20) unsigned DEFAULT '0',
  `fee` bigint(20) unsigned DEFAULT '0',
  `unit_price` bigint(20) unsigned DEFAULT '0',
  `status` int(10) unsigned NOT NULL DEFAULT '1' COMMENT 'open, partiallyCompleted, completed',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `external_order_id` (`external_order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  KEY `order_logs_order_id` (`order_id`)
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
  KEY `orders_user_id` (`user_id`),
  KEY `orders_action` (`action`),
  KEY `orders_buy_currency` (`buy_currency`)
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
  KEY `payments_wallet_id` (`wallet_id`),
  KEY `payments_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `sell_orders`
-- ----------------------------
DROP TABLE IF EXISTS `sell_orders`;
CREATE TABLE `sell_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `external_order_id` int(10) unsigned NOT NULL,
  `type` int(10) unsigned NOT NULL COMMENT 'market, limit',
  `buy_currency` int(10) unsigned NOT NULL,
  `sell_currency` int(10) unsigned NOT NULL,
  `amount` bigint(20) unsigned NOT NULL DEFAULT '0',
  `matched_amount` bigint(20) unsigned DEFAULT '0',
  `result_amount` bigint(20) unsigned DEFAULT '0',
  `fee` bigint(20) unsigned DEFAULT '0',
  `unit_price` bigint(20) unsigned DEFAULT '0',
  `status` int(10) unsigned NOT NULL DEFAULT '1' COMMENT 'open, partiallyCompleted, completed',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `external_order_id` (`external_order_id`)
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
  KEY `trade_stats_start_time` (`start_time`),
  KEY `trade_stats_type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  KEY `transactions_txid` (`txid`),
  KEY `transactions_user_id` (`user_id`)
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
  KEY `user_tokens_user_id` (`user_id`),
  KEY `user_tokens_active` (`active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  KEY `users_updated_at` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  KEY `wallets_user_id` (`user_id`),
  KEY `wallets_address` (`address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS = 1;
