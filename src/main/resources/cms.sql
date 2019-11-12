/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50717
 Source Host           : localhost:3306
 Source Schema         : cms_jd1908

 Target Server Type    : MySQL
 Target Server Version : 50717
 File Encoding         : 65001

 Date: 12/11/2019 15:54:43
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for base_privilege
-- ----------------------------
DROP TABLE IF EXISTS `base_privilege`;
CREATE TABLE `base_privilege` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `route` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_privilege_privilege` (`parent_id`),
  CONSTRAINT `fk_privilege_privilege` FOREIGN KEY (`parent_id`) REFERENCES `base_privilege` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of base_privilege
-- ----------------------------
BEGIN;
INSERT INTO `base_privilege` VALUES (1, '栏目管理', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `base_privilege` VALUES (2, '文章管理', NULL, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for base_role
-- ----------------------------
DROP TABLE IF EXISTS `base_role`;
CREATE TABLE `base_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of base_role
-- ----------------------------
BEGIN;
INSERT INTO `base_role` VALUES (1, '编辑');
INSERT INTO `base_role` VALUES (2, '管理员');
COMMIT;

-- ----------------------------
-- Table structure for base_role_privilege
-- ----------------------------
DROP TABLE IF EXISTS `base_role_privilege`;
CREATE TABLE `base_role_privilege` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL,
  `privilege_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_role_privilege_role` (`role_id`),
  KEY `fk_role_privilege_privilege` (`privilege_id`),
  CONSTRAINT `fk_role_privilege_privilege` FOREIGN KEY (`privilege_id`) REFERENCES `base_privilege` (`id`),
  CONSTRAINT `fk_role_privilege_role` FOREIGN KEY (`role_id`) REFERENCES `base_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of base_role_privilege
-- ----------------------------
BEGIN;
INSERT INTO `base_role_privilege` VALUES (1, 1, 2);
COMMIT;

-- ----------------------------
-- Table structure for base_user
-- ----------------------------
DROP TABLE IF EXISTS `base_user`;
CREATE TABLE `base_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `realname` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `birth` bigint(255) DEFAULT NULL,
  `register_time` bigint(20) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `user_face` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of base_user
-- ----------------------------
BEGIN;
INSERT INTO `base_user` VALUES (1, 'larry', NULL, NULL, '莱瑞', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `base_user` VALUES (2, 'terry', NULL, NULL, '泰瑞', NULL, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for base_user_role
-- ----------------------------
DROP TABLE IF EXISTS `base_user_role`;
CREATE TABLE `base_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_role_user` (`user_id`),
  KEY `fk_user_role_role` (`role_id`),
  CONSTRAINT `fk_user_role_role` FOREIGN KEY (`role_id`) REFERENCES `base_role` (`id`),
  CONSTRAINT `fk_user_role_user` FOREIGN KEY (`user_id`) REFERENCES `base_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of base_user_role
-- ----------------------------
BEGIN;
INSERT INTO `base_user_role` VALUES (1, 1, 1);
INSERT INTO `base_user_role` VALUES (2, 2, 1);
COMMIT;

-- ----------------------------
-- Table structure for cms_article
-- ----------------------------
DROP TABLE IF EXISTS `cms_article`;
CREATE TABLE `cms_article` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `source` text,
  `publish_time` bigint(20) DEFAULT NULL,
  `read_times` bigint(20) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `thump_up` bigint(255) DEFAULT NULL,
  `thump_down` bigint(255) DEFAULT NULL,
  `author_id` bigint(20) DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_article_category` (`category_id`),
  KEY `fk_article_user` (`author_id`),
  CONSTRAINT `fk_article_category` FOREIGN KEY (`category_id`) REFERENCES `cms_category` (`id`),
  CONSTRAINT `fk_article_user` FOREIGN KEY (`author_id`) REFERENCES `base_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_article
-- ----------------------------
BEGIN;
INSERT INTO `cms_article` VALUES (1, 'springboot的应用技术', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 3);
INSERT INTO `cms_article` VALUES (2, 'springmvc的注解使用', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 3);
INSERT INTO `cms_article` VALUES (3, 'test01', NULL, NULL, 1573531370110, NULL, '未审核', 0, 0, 1, 4);
COMMIT;

-- ----------------------------
-- Table structure for cms_category
-- ----------------------------
DROP TABLE IF EXISTS `cms_category`;
CREATE TABLE `cms_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `no` int(11) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_category_category` (`parent_id`),
  CONSTRAINT `fk_category_category` FOREIGN KEY (`parent_id`) REFERENCES `cms_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_category
-- ----------------------------
BEGIN;
INSERT INTO `cms_category` VALUES (3, 'IT', NULL, 1, NULL);
INSERT INTO `cms_category` VALUES (4, '娱乐', NULL, 2, NULL);
COMMIT;

-- ----------------------------
-- Table structure for cms_comment
-- ----------------------------
DROP TABLE IF EXISTS `cms_comment`;
CREATE TABLE `cms_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` text,
  `comment_time` bigint(20) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `article_id` bigint(20) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_comment_user` (`user_id`),
  KEY `fk_comment_article` (`article_id`),
  KEY `fk_comment_comment` (`parent_id`),
  CONSTRAINT `fk_comment_article` FOREIGN KEY (`article_id`) REFERENCES `cms_article` (`id`),
  CONSTRAINT `fk_comment_comment` FOREIGN KEY (`parent_id`) REFERENCES `cms_comment` (`id`),
  CONSTRAINT `fk_comment_user` FOREIGN KEY (`user_id`) REFERENCES `base_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_comment
-- ----------------------------
BEGIN;
INSERT INTO `cms_comment` VALUES (1, '作者厉害', NULL, NULL, NULL, 1, NULL);
INSERT INTO `cms_comment` VALUES (2, '作者牛皮', NULL, NULL, NULL, 1, NULL);
INSERT INTO `cms_comment` VALUES (3, 'springmvc到底怎么用？', NULL, NULL, NULL, 2, NULL);
COMMIT;

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test
-- ----------------------------
BEGIN;
INSERT INTO `test` VALUES (1, 'terry', 12);
INSERT INTO `test` VALUES (2, 'larry', 13);
INSERT INTO `test` VALUES (3, '李四', 123321);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
