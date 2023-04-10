/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50720
 Source Host           : localhost:3306
 Source Schema         : compare

 Target Server Type    : MySQL
 Target Server Version : 50720
 File Encoding         : 65001

 Date: 11/04/2023 00:21:20
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for field_compare
-- ----------------------------
DROP TABLE IF EXISTS `field_compare`;
CREATE TABLE `field_compare`  (
  `compare_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `table_id` int(11) NULL DEFAULT NULL COMMENT '比对表名',
  `table_field` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '比对表字段',
  `interface_id` int(11) NULL DEFAULT NULL COMMENT '比对接口Id',
  `interface_field` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '比对接口字段',
  `field_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段说明',
  `compare_detail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '比对描述',
  PRIMARY KEY (`compare_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of field_compare
-- ----------------------------
INSERT INTO `field_compare` VALUES (1, 1, 'room_id', 1, 'roomId', '机房Id', NULL);
INSERT INTO `field_compare` VALUES (2, 1, 'name', 1, 'roomName', '机房名称', NULL);
INSERT INTO `field_compare` VALUES (3, 1, 'code', 1, 'roomCode', '机房编码', NULL);

-- ----------------------------
-- Table structure for interface_compare
-- ----------------------------
DROP TABLE IF EXISTS `interface_compare`;
CREATE TABLE `interface_compare`  (
  `interface_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '接口ID',
  `interface_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '接口名称',
  `interface_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '接口描述',
  PRIMARY KEY (`interface_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of interface_compare
-- ----------------------------
INSERT INTO `interface_compare` VALUES (1, '/Cloud-interface/rest/standardized/roomQuery', '机房资源标准化接口');
INSERT INTO `interface_compare` VALUES (2, '/Cloud-interface/rest/standardized/buildingQuery', '机楼标准化接口');
INSERT INTO `interface_compare` VALUES (3, '/Cloud-interface/rest/standardized/dataCenterQuery', '数据中心标准化接口');
INSERT INTO `interface_compare` VALUES (4, '/Cloud-interface/rest/standardized/machineQuery', '物理机标准化接口');

-- ----------------------------
-- Table structure for table_compare
-- ----------------------------
DROP TABLE IF EXISTS `table_compare`;
CREATE TABLE `table_compare`  (
  `table_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '对比表',
  `table_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对比表名',
  `table_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表描述',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of table_compare
-- ----------------------------
INSERT INTO `table_compare` VALUES (1, 'rm_room', '机房');
INSERT INTO `table_compare` VALUES (2, 'rm_build', '机楼');
INSERT INTO `table_compare` VALUES (3, 'rm_resource', '资源池');
INSERT INTO `table_compare` VALUES (4, 'rm_device', '物理设备表');

SET FOREIGN_KEY_CHECKS = 1;
