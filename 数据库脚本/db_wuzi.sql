/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50505
Source Host           : 127.0.0.1:3306
Source Database       : db_wuzi

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2018-05-03 19:31:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for dept
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept` (
  `deptid` int(11) NOT NULL AUTO_INCREMENT COMMENT '部门ID',
  `deptname` varchar(255) DEFAULT NULL COMMENT '部门名称',
  `userid` int(11) DEFAULT NULL COMMENT '登记人',
  `userName` varchar(255) DEFAULT NULL COMMENT '用户姓名',
  `create_time` varchar(255) DEFAULT NULL COMMENT '创建时间',
  `update_time` varchar(255) DEFAULT NULL COMMENT '最后更新时间',
  `is_delete` varchar(255) DEFAULT NULL COMMENT '是否删除？',
  `count` int(11) DEFAULT '0' COMMENT '部门领用物资次数',
  `count2` int(11) DEFAULT NULL COMMENT '部门借用物资次数',
  PRIMARY KEY (`deptid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dept
-- ----------------------------
INSERT INTO `dept` VALUES ('1', '科技部', '2', 'jack', null, '2018-04-21 20:46:10', '1', '0', null);
INSERT INTO `dept` VALUES ('2', '科技部', '2', 'jack', '2018-04-21 13:36:24', '2018-04-21 20:46:47', '0', '3', null);
INSERT INTO `dept` VALUES ('3', '质量管理部', '2', 'jack', '2018-04-21 13:47:01', '2018-04-21 20:46:30', '0', '3', null);
INSERT INTO `dept` VALUES ('4', '人事部', '2', 'jack', '2018-04-21 13:48:02', '2018-04-21 20:46:40', '0', '2', null);

-- ----------------------------
-- Table structure for deptbaosun
-- ----------------------------
DROP TABLE IF EXISTS `deptbaosun`;
CREATE TABLE `deptbaosun` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `deptid` int(11) DEFAULT NULL COMMENT '部门编号',
  `deptname` varchar(255) DEFAULT NULL COMMENT '部门名称',
  `goodsid` int(11) DEFAULT NULL,
  `goodsName` varchar(255) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL COMMENT '登记人',
  `userName` varchar(255) DEFAULT NULL,
  `create_time` varchar(255) DEFAULT NULL COMMENT '创建时间',
  `update_time` varchar(255) DEFAULT NULL,
  `is_delete` varchar(255) DEFAULT NULL COMMENT '是否删除？',
  `count` int(11) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of deptbaosun
-- ----------------------------
INSERT INTO `deptbaosun` VALUES ('47', '2', '科技部', '9', '笔记本', '2', 'jack', '2018-04-23 19:31:57', '2018-04-23 19:31:57', '0', '2', null);
INSERT INTO `deptbaosun` VALUES ('48', '3', '质量管理部', '6', '娃哈哈', '2', 'jack', '2018-05-03 19:21:22', '2018-05-03 19:21:22', '0', '1', '喝掉了');

-- ----------------------------
-- Table structure for deptjiechu
-- ----------------------------
DROP TABLE IF EXISTS `deptjiechu`;
CREATE TABLE `deptjiechu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `deptid` int(11) DEFAULT NULL COMMENT '部门编号',
  `deptname` varchar(255) DEFAULT NULL COMMENT '部门名称',
  `goodsid` int(11) DEFAULT NULL,
  `goodsName` varchar(255) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL COMMENT '登记人',
  `userName` varchar(255) DEFAULT NULL,
  `create_time` varchar(255) DEFAULT NULL COMMENT '创建时间',
  `update_time` varchar(255) DEFAULT NULL,
  `is_delete` varchar(255) DEFAULT NULL COMMENT '是否删除？',
  `count` int(11) DEFAULT NULL,
  `state` varchar(5) DEFAULT '3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of deptjiechu
-- ----------------------------
INSERT INTO `deptjiechu` VALUES ('49', '4', '人事部', '12', '青瓜', '2', 'jack', '2018-04-22 16:38:16', '2018-04-22 16:38:16', '0', '888', '6');
INSERT INTO `deptjiechu` VALUES ('50', '3', '质量管理部', '7', '绝味鸭脖', '2', 'jack', '2018-04-22 16:42:23', '2018-04-22 16:42:23', '0', '6', '6');
INSERT INTO `deptjiechu` VALUES ('51', '4', '人事部', '6', '娃哈哈', '2', 'jack', '2018-04-23 17:28:40', '2018-04-23 17:28:40', '0', '20', '6');
INSERT INTO `deptjiechu` VALUES ('52', '2', '科技部', '6', '娃哈哈', '2', 'jack', '2018-04-24 11:19:10', '2018-04-24 11:19:10', '0', '50', '5');
INSERT INTO `deptjiechu` VALUES ('53', '2', '科技部', '7', '绝味鸭脖', '2', 'jack', '2018-04-26 10:20:44', '2018-04-26 10:20:44', '0', '2', '6');
INSERT INTO `deptjiechu` VALUES ('54', '2', '科技部', '9', '笔记本', '2', 'jack', '2018-04-26 10:20:48', '2018-04-26 10:20:48', '0', '2', '3');
INSERT INTO `deptjiechu` VALUES ('55', '2', '科技部', '6', '娃哈哈', '2', 'jack', '2018-04-26 10:20:52', '2018-04-26 10:20:52', '0', '2', '4');
INSERT INTO `deptjiechu` VALUES ('56', '2', '科技部', '12', '青瓜', '2', 'jack', '2018-04-26 10:20:55', '2018-04-26 10:20:55', '0', '2', '4');
INSERT INTO `deptjiechu` VALUES ('57', '2', '科技部', '6', '娃哈哈', '2', 'jack', '2018-05-03 19:12:37', '2018-05-03 19:12:37', '0', '222', '4');
INSERT INTO `deptjiechu` VALUES ('58', '4', '人事部', '6', '娃哈哈', '2', 'jack', '2018-05-03 19:14:39', '2018-05-03 19:14:39', '0', '100', '4');

-- ----------------------------
-- Table structure for deptlingyong
-- ----------------------------
DROP TABLE IF EXISTS `deptlingyong`;
CREATE TABLE `deptlingyong` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `deptid` int(11) DEFAULT NULL COMMENT '部门编号',
  `deptname` varchar(255) DEFAULT NULL COMMENT '部门名称',
  `goodsid` int(11) DEFAULT NULL,
  `goodsName` varchar(255) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL COMMENT '登记人',
  `userName` varchar(255) DEFAULT NULL,
  `create_time` varchar(255) DEFAULT NULL COMMENT '创建时间',
  `update_time` varchar(255) DEFAULT NULL,
  `is_delete` varchar(255) DEFAULT NULL COMMENT '是否删除？',
  `count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of deptlingyong
-- ----------------------------
INSERT INTO `deptlingyong` VALUES ('44', '2', '科技部', '13', '葡萄', '2', 'jack', '2018-04-22 15:43:26', '2018-04-22 15:43:26', '0', '88');
INSERT INTO `deptlingyong` VALUES ('45', '2', '科技部', '11', '女朋友', '2', 'jack', '2018-04-22 15:43:40', '2018-04-22 15:43:40', '0', '1');
INSERT INTO `deptlingyong` VALUES ('46', '2', '科技部', '10', '水笔', '2', 'jack', '2018-04-22 15:43:45', '2018-04-22 15:43:45', '0', '89');
INSERT INTO `deptlingyong` VALUES ('47', '4', '人事部', '6', '娃哈哈', '2', 'jack', '2018-04-24 11:18:27', '2018-04-24 11:18:27', '0', '10');
INSERT INTO `deptlingyong` VALUES ('48', '4', '人事部', '6', '娃哈哈', '2', 'jack', '2018-04-24 11:18:54', '2018-04-24 11:18:54', '0', '10');
INSERT INTO `deptlingyong` VALUES ('49', '3', '质量管理部', '6', '娃哈哈', '2', 'jack', '2018-04-26 11:06:14', '2018-04-26 11:06:14', '0', '50');
INSERT INTO `deptlingyong` VALUES ('50', '3', '质量管理部', '6', '娃哈哈', '2', 'jack', '2018-05-03 19:14:04', '2018-05-03 19:14:04', '0', '100');
INSERT INTO `deptlingyong` VALUES ('51', '3', '质量管理部', '6', '娃哈哈', '2', 'jack', '2018-05-03 19:14:24', '2018-05-03 19:14:24', '0', '100');

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
  `kc` int(8) DEFAULT '0' COMMENT '库存',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('6', '娃哈哈', '2', 'jack', '2018-04-13 13:02:43', '2018-04-18 17:19:49', '0', '9999242');
INSERT INTO `goods` VALUES ('8', '绝味鸭脖', '2', 'jack', '2018-04-21 13:32:12', '2018-04-21 13:32:12', '1', '0');
INSERT INTO `goods` VALUES ('9', '笔记本', '2', 'jack', '2018-04-22 15:37:26', '2018-04-22 15:37:26', '0', '998');
INSERT INTO `goods` VALUES ('10', '水笔', '2', 'jack', '2018-04-22 15:37:31', '2018-04-22 15:37:31', '0', '1000');
INSERT INTO `goods` VALUES ('11', '女朋友', '2', 'jack', '2018-04-22 15:37:39', '2018-04-22 15:37:39', '0', '0');
INSERT INTO `goods` VALUES ('12', '青瓜', '2', 'jack', '2018-04-22 15:37:54', '2018-04-22 15:37:54', '0', '2772');
INSERT INTO `goods` VALUES ('13', '葡萄', '2', 'jack', '2018-04-22 15:38:01', '2018-04-22 15:38:01', '0', '0');
INSERT INTO `goods` VALUES ('14', '脉动', '2', 'jack', '2018-04-22 15:38:08', '2018-04-22 15:38:08', '0', '0');

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
  `userName` varchar(255) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='采购登记';

-- ----------------------------
-- Records of procurement_registration
-- ----------------------------
INSERT INTO `procurement_registration` VALUES ('15', '12', '青瓜', '0', null, '2', '2018-04-22 17:17:33', '2018-04-22 17:17:33', '0', 'jack', '100');
INSERT INTO `procurement_registration` VALUES ('16', '9', '笔记本', '0', null, '2', '2018-04-22 17:19:26', '2018-04-22 17:19:26', '0', 'jack', '100');
INSERT INTO `procurement_registration` VALUES ('17', '12', '青瓜', '0', null, '2', '2018-04-22 17:52:38', '2018-04-22 17:52:38', '0', 'jack', '1000');
INSERT INTO `procurement_registration` VALUES ('18', '6', '娃哈哈', '0', null, '2', '2018-04-23 17:28:21', '2018-04-23 17:28:21', '0', 'jack', '80');
INSERT INTO `procurement_registration` VALUES ('19', '6', '娃哈哈', '0', null, '2', '2018-05-03 19:13:22', '2018-05-03 19:13:22', '0', 'jack', '10000000');
INSERT INTO `procurement_registration` VALUES ('20', '10', '水笔', '0', null, '2', '2018-05-03 19:30:14', '2018-05-03 19:30:14', '0', 'jack', '1000');
INSERT INTO `procurement_registration` VALUES ('21', '9', '笔记本', '0', null, '2', '2018-05-03 19:30:23', '2018-05-03 19:30:23', '0', 'jack', '1000');

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
  `userName` varchar(255) DEFAULT NULL,
  `addr` varchar(255) DEFAULT NULL COMMENT '地址',
  `tel` varchar(255) DEFAULT NULL COMMENT '联系方式',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='供应商';

-- ----------------------------
-- Records of supplier
-- ----------------------------
INSERT INTO `supplier` VALUES ('1', 'wdwef', null, null, '1', null, null, null, null);
INSERT INTO `supplier` VALUES ('2', null, '2018-04-21 14:33:33', '2018-04-21 14:33:33', '1', '2', 'jack', null, null);
INSERT INTO `supplier` VALUES ('3', null, '2018-04-21 14:34:40', '2018-04-21 14:34:40', '1', '2', 'jack', null, null);
INSERT INTO `supplier` VALUES ('4', '个人给他人', '2018-04-21 14:36:49', '2018-04-21 20:38:31', '0', '2', 'jack', '32让 ', '33344567');
INSERT INTO `supplier` VALUES ('5', '纷纷v', '2018-04-21 14:37:12', '2018-04-21 20:38:37', '0', '2', 'jack', '32让 ', '33344567');
INSERT INTO `supplier` VALUES ('6', '纷纷v34图3', '2018-04-21 14:37:17', '2018-04-21 14:37:17', '1', '2', 'jack', null, null);
INSERT INTO `supplier` VALUES ('7', '纷纷v34图3', '2018-04-21 14:37:19', '2018-04-21 20:38:43', '0', '2', 'jack', '32让 ', '33344567');
INSERT INTO `supplier` VALUES ('8', '纷纷v34图3', '2018-04-21 14:37:23', '2018-04-21 20:38:46', '0', '2', 'jack', '32让 ', '33344567');
INSERT INTO `supplier` VALUES ('9', '纷纷v34图3', '2018-04-21 14:37:26', '2018-04-21 20:38:49', '0', '2', 'jack', '32让 ', '33344567');
INSERT INTO `supplier` VALUES ('10', '纷纷v34图3', '2018-04-21 14:37:32', '2018-04-21 14:37:32', '1', '2', 'jack', null, null);
INSERT INTO `supplier` VALUES ('11', '纷纷v34图3', '2018-04-21 14:37:34', '2018-04-21 14:37:34', '1', '2', 'jack', null, null);
INSERT INTO `supplier` VALUES ('12', '3的任务无法', '2018-04-21 14:37:37', '2018-04-21 20:38:57', '0', '2', 'jack', '32让 ', '33344567');
INSERT INTO `supplier` VALUES ('13', '纷纷v34图3', '2018-04-21 14:37:40', '2018-04-21 14:37:40', '1', '2', 'jack', null, null);
INSERT INTO `supplier` VALUES ('14', '纷纷v34图3', '2018-04-21 14:37:44', '2018-04-21 14:37:44', '1', '2', 'jack', null, null);
INSERT INTO `supplier` VALUES ('15', 'の 认为 ', '2018-04-21 20:38:17', '2018-04-21 20:38:17', '0', '2', 'jack', '32让 ', '33344567');

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
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

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
INSERT INTO `t_auth` VALUES ('38', '物资入库', '', '1', '', 'closed', 'icon-back');
INSERT INTO `t_auth` VALUES ('39', '基础信息维护', '', '1', '', 'closed', 'icon-print');
INSERT INTO `t_auth` VALUES ('41', '物资管理', '/admin/goods/getPage.do', '39', '物资管理', 'open', 'icon-save');
INSERT INTO `t_auth` VALUES ('43', '部门管理', '/admin/dept/getPage.do', '39', '', 'open', 'icon-home');
INSERT INTO `t_auth` VALUES ('44', '供应商管理', '/admin/supplier/getPage.do', '39', '供应商管理', 'open', 'icon-reload');
INSERT INTO `t_auth` VALUES ('45', '采购登记', '/admin/procurement_registration/getPage.do', '38', '', 'open', 'icon-ok');
INSERT INTO `t_auth` VALUES ('46', '物资出库', '', '1', '', 'closed', 'icon-redo');
INSERT INTO `t_auth` VALUES ('47', '部门领用', '/admin/bmly.do', '46', '', 'open', 'icon-ok');
INSERT INTO `t_auth` VALUES ('48', '查询统计', '', '1', '', 'closed', 'icon-search');
INSERT INTO `t_auth` VALUES ('49', '部门领用查询', '/admin/dept/getLycxPage.do', '48', '', 'open', 'icon-search');
INSERT INTO `t_auth` VALUES ('50', '部门领用汇总', '/admin/getPage.do?page=bmlyhz', '48', '', 'open', 'icon-permission');
INSERT INTO `t_auth` VALUES ('51', '采购单查询', '/admin/getPage.do?page=cgdcx', '48', '', 'open', 'icon-search');
INSERT INTO `t_auth` VALUES ('52', '入库查询', '/admin/getPage.do?page=rkcx', '48', '', 'open', 'icon-course');
INSERT INTO `t_auth` VALUES ('53', '部门报损查询', '/admin/getPage.do?page=bscx', '48', '', 'open', 'icon-search');
INSERT INTO `t_auth` VALUES ('54', '部门报损汇总', '/admin/getPage.do?page=bshz', '48', '', 'open', 'icon-search');
INSERT INTO `t_auth` VALUES ('55', '借出查询', '/admin/getPage.do?page=jccx', '48', '', 'open', 'icon-search');
INSERT INTO `t_auth` VALUES ('56', '部门汇总', '/admin/getPage.do?page=depthz', '48', '', 'open', 'icon-search');
INSERT INTO `t_auth` VALUES ('57', '物资处理', '', '1', '', 'closed', 'icon-edit');
INSERT INTO `t_auth` VALUES ('58', '物资借出', '/admin/getPage.do?page=wzjc', '46', '', 'open', 'icon-redo');
INSERT INTO `t_auth` VALUES ('59', '借出审核', '/admin/getPage.do?page=jcsh', '46', '', 'open', 'icon-search');
INSERT INTO `t_auth` VALUES ('60', '借出归还', '/admin/getPage.do?page=jcgh', '38', '', 'open', 'icon-undo');
INSERT INTO `t_auth` VALUES ('61', '审核入库', '/admin/getPage.do?page=jcghsh', '38', '', 'open', 'icon-ok');
INSERT INTO `t_auth` VALUES ('62', '物资盘点', '/admin/getPage.do?page=wzpd', '57', '', 'open', 'icon-back');
INSERT INTO `t_auth` VALUES ('63', '部门报损', '/admin/getPage.do?page=bmbs', '57', '', 'open', 'icon-item');

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
INSERT INTO `t_role` VALUES ('1', '超级管理员', '1,2,12,13,14,15,16,38,45,60,61,39,41,43,44,46,47,58,59,48,49,50,51,52,53,54,55,56,57,62,63', '具有最高权限');
INSERT INTO `t_role` VALUES ('10', '基础信息录入员', '1,15,16,38,45,60,61,39,41,43,44,46,47,58,59', '基础信息录入员');

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
INSERT INTO `t_user` VALUES ('9', 'luban', '123', '10', null, '鲁班七号', '2018-04-11 15:03:51', null, '男');
