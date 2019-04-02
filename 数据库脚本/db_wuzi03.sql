/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : db_wuzi

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2018-04-18 17:58:35
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `goodsName` varchar(50) DEFAULT NULL COMMENT '物资名称',
  `userid` int(11) DEFAULT NULL COMMENT '登记人',
  `userName` varchar(255) DEFAULT NULL,
  `create_time` varchar(255) DEFAULT NULL COMMENT '创建时间',
  `update_time` varchar(255) DEFAULT NULL,
  `is_delete` varchar(255) DEFAULT NULL COMMENT '是否删除？',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('4', '娃哈哈', '2', null, '2018-04-13 11:10:49', '2018-04-13 11:10:49', '1');
INSERT INTO `goods` VALUES ('5', '娃哈哈', '2', null, '2018-04-13 11:15:51', '2018-04-13 11:10:49', '1');
INSERT INTO `goods` VALUES ('6', '娃哈哈', '2', 'jack', '2018-04-13 13:02:43', '2018-04-18 17:19:49', '0');
INSERT INTO `goods` VALUES ('7', '绝味鸭脖', '2', 'jack', '2018-04-18 17:54:03', '2018-04-18 17:54:03', '0');

-- ----------------------------
-- Table structure for procurement_registration
-- ----------------------------
DROP TABLE IF EXISTS `procurement_registration`;
CREATE TABLE `procurement_registration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodsid` int(11) DEFAULT NULL COMMENT '物资编号',
  `goodsName` varchar(255) DEFAULT NULL COMMENT '物资名称',
  `state` varchar(255) DEFAULT NULL COMMENT '状态：0：已登记，1：采购完成，2：采购失败',
  `note` varchar(255) DEFAULT NULL COMMENT '备注（如果采购失败，请务必加上备注）',
  `userid` int(11) DEFAULT NULL COMMENT '登记人',
  `create_time` varchar(255) DEFAULT NULL COMMENT '创建时间',
  `update_time` varchar(255) DEFAULT NULL,
  `is_delete` varchar(255) DEFAULT NULL COMMENT '是否删除？',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='采购登记';

-- ----------------------------
-- Records of procurement_registration
-- ----------------------------

-- ----------------------------
-- Table structure for supplier
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_name` varchar(255) DEFAULT NULL COMMENT '供应商名称',
  `create_time` varchar(255) DEFAULT NULL,
  `update_time` varchar(255) DEFAULT NULL,
  `is_delete` varchar(255) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='供应商';

-- ----------------------------
-- Records of supplier
-- ----------------------------

-- ----------------------------
-- Table structure for t_auth
-- ----------------------------
DROP TABLE IF EXISTS `t_auth`;
CREATE TABLE `t_auth` (
  `authId` int(11) NOT NULL AUTO_INCREMENT,
  `authName` varchar(20) DEFAULT NULL,
  `authPath` varchar(100) DEFAULT NULL,
  `parentId` int(11) DEFAULT NULL,
  `authDescription` varchar(200) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `iconCls` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`authId`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_auth
-- ----------------------------
INSERT INTO `t_auth` VALUES ('1', '后台', '   ', '-1', '父节点', 'closed', 'icon-home');
INSERT INTO `t_auth` VALUES ('2', '系统管理', '', '1', '系统管理', 'closed', 'icon-permission');
INSERT INTO `t_auth` VALUES ('12', '用户管理', '/user/getPage.do', '2', '', 'open', 'icon-student');
INSERT INTO `t_auth` VALUES ('13', '角色管理', '/role/getRolePage.do', '2', '', 'open', 'icon-roleManage');
INSERT INTO `t_auth` VALUES ('14', '菜单管理', '/menu/getMenuPage.do', '2', '菜单管理', 'open', 'icon-menuManage');
INSERT INTO `t_auth` VALUES ('15', '修改密码', '', '1', null, 'open', 'icon-modifyPassword');
INSERT INTO `t_auth` VALUES ('16', '安全退出', '', '1', null, 'open', 'icon-exit');
INSERT INTO `t_auth` VALUES ('38', '物资入库', '', '1', '', 'open', 'icon-back');
INSERT INTO `t_auth` VALUES ('39', '基础信息维护', '', '1', '', 'closed', 'icon-print');
INSERT INTO `t_auth` VALUES ('40', '采购登记', '/caigou/getPage.do', '39', '', 'open', 'icon-ok');
INSERT INTO `t_auth` VALUES ('41', '物资管理', '/admin/goods/getPage.do', '39', '物资管理', 'open', 'icon-save');

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `roleId` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `roleName` varchar(20) DEFAULT NULL COMMENT '角色名称',
  `authIds` varchar(500) DEFAULT NULL COMMENT '权限ID',
  `roleDescription` varchar(200) DEFAULT NULL COMMENT '角色描述',
  PRIMARY KEY (`roleId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1', '超级管理员', '1,2,12,13,14,24,15,16,18,19,22,23,20,21,25,26,27,28,40,29,30,31,32,33,34,35,41,37,38,39', '具有最高权限');
INSERT INTO `t_role` VALUES ('10', '基础信息录入员', null, '基础信息录入员');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userName` varchar(20) DEFAULT NULL COMMENT '用户名称',
  `password` varchar(20) DEFAULT NULL COMMENT '密码',
  `roleId` int(11) DEFAULT NULL COMMENT '角色ID',
  `userDescription` varchar(200) DEFAULT NULL COMMENT '备注',
  `realName` varchar(30) DEFAULT NULL COMMENT '真实姓名',
  `birthDate` datetime DEFAULT NULL COMMENT '出生年月',
  `pic` varchar(50) DEFAULT NULL COMMENT '头像',
  `sex` varchar(10) DEFAULT NULL COMMENT '性别',
  PRIMARY KEY (`userId`),
  KEY `FK_t_user` (`roleId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('2', 'jack', '123', '1', null, '超级管理员', '2018-02-27 19:55:45', null, '男');
INSERT INTO `t_user` VALUES ('8', 'luna', '123', '9', null, '露娜', '2018-03-06 15:30:55', null, '女');
INSERT INTO `t_user` VALUES ('9', 'luban', '2', '10', null, '鲁班七号', '2018-04-11 15:03:51', null, '男');
