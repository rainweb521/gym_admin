/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50723
 Source Host           : localhost:3306
 Source Schema         : gym_admin

 Target Server Type    : MySQL
 Target Server Version : 50723
 File Encoding         : 65001

 Date: 13/05/2020 17:11:00
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_action_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_action_log`;
CREATE TABLE `sys_action_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(255) DEFAULT NULL COMMENT '日志名称',
  `type` tinyint(4) DEFAULT NULL COMMENT '日志类型',
  `ipaddr` varchar(255) DEFAULT NULL COMMENT '操作IP地址',
  `clazz` varchar(255) DEFAULT NULL COMMENT '产生日志的类',
  `method` varchar(255) DEFAULT NULL COMMENT '产生日志的方法',
  `model` varchar(255) DEFAULT NULL COMMENT '产生日志的表',
  `record_id` bigint(20) DEFAULT NULL COMMENT '产生日志的数据id',
  `message` text COMMENT '日志消息',
  `create_date` datetime DEFAULT NULL COMMENT '记录时间',
  `oper_name` varchar(255) DEFAULT NULL COMMENT '产生日志的用户昵称',
  `oper_by` bigint(20) DEFAULT NULL COMMENT '产生日志的用户',
  PRIMARY KEY (`id`),
  KEY `FK32gm4dja0jetx58r9dc2uljiu` (`oper_by`),
  CONSTRAINT `sys_action_log_ibfk_1` FOREIGN KEY (`oper_by`) REFERENCES `sys_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=387 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_action_log
-- ----------------------------
BEGIN;
INSERT INTO `sys_action_log` VALUES (330, '用户登录', 2, '0:0:0:0:0:0:0:1', 'com.linln.admin.system.controller.LoginController', 'login', NULL, NULL, '后台登录成功', '2020-02-23 00:14:02', '超级管理员', 1);
INSERT INTO `sys_action_log` VALUES (331, '用户登录', 2, '0:0:0:0:0:0:0:1', 'com.linln.admin.system.controller.LoginController', 'login', NULL, NULL, '后台登录成功', '2020-02-23 00:18:44', '超级管理员', 1);
INSERT INTO `sys_action_log` VALUES (332, '菜单管理', 1, '0:0:0:0:0:0:0:1', 'com.linln.admin.system.controller.MenuController', 'save', 'sys_menu', 196, '添加菜单：体能折线图', '2020-02-23 00:27:00', '超级管理员', 1);
INSERT INTO `sys_action_log` VALUES (333, '用户登录', 2, '127.0.0.1', 'com.linln.admin.system.controller.LoginController', 'login', NULL, NULL, '后台登录成功', '2020-02-23 13:53:06', '超级管理员', 1);
INSERT INTO `sys_action_log` VALUES (334, '用户管理', 1, '127.0.0.1', 'com.linln.admin.system.controller.UserController', 'save', 'sys_user', 6, '添加用户成功：haha', '2020-02-23 13:53:34', '超级管理员', 1);
INSERT INTO `sys_action_log` VALUES (335, '日志管理', 1, '127.0.0.1', 'com.linln.admin.system.controller.RoleController', 'save', 'sys_role', 5, '添加日志成功：器材', '2020-02-23 13:53:57', '超级管理员', 1);
INSERT INTO `sys_action_log` VALUES (336, '角色授权', 1, '127.0.0.1', 'com.linln.admin.system.controller.RoleController', 'auth', 'sys_role', 5, '角色授权成功：器材', '2020-02-23 13:54:06', '超级管理员', 1);
INSERT INTO `sys_action_log` VALUES (337, '角色分配', 1, '127.0.0.1', 'com.linln.admin.system.controller.UserController', 'auth', 'sys_user', 5, '角色分配成功：rain123', '2020-02-23 13:54:14', '超级管理员', 1);
INSERT INTO `sys_action_log` VALUES (338, '用户登录', 2, '127.0.0.1', 'com.linln.admin.system.controller.LoginController', 'login', NULL, NULL, '后台登录失败：[haha]您不是后台管理员！', '2020-02-23 13:54:21', 'haha', NULL);
INSERT INTO `sys_action_log` VALUES (339, '用户登录', 2, '127.0.0.1', 'com.linln.admin.system.controller.LoginController', 'login', NULL, NULL, '后台登录失败：[haha]您不是后台管理员！', '2020-02-23 13:54:23', 'haha', NULL);
INSERT INTO `sys_action_log` VALUES (340, '用户登录', 2, '127.0.0.1', 'com.linln.admin.system.controller.LoginController', 'login', NULL, NULL, '后台登录失败：[haha]您不是后台管理员！', '2020-02-23 13:54:33', 'haha', NULL);
INSERT INTO `sys_action_log` VALUES (341, '用户登录', 2, '127.0.0.1', 'com.linln.admin.system.controller.LoginController', 'login', NULL, NULL, '后台登录成功', '2020-02-23 13:54:38', '超级管理员', 1);
INSERT INTO `sys_action_log` VALUES (342, '角色分配', 1, '127.0.0.1', 'com.linln.admin.system.controller.UserController', 'auth', 'sys_user', 6, '角色分配成功：haha', '2020-02-23 13:54:47', '超级管理员', 1);
INSERT INTO `sys_action_log` VALUES (343, '用户登录', 2, '127.0.0.1', 'com.linln.admin.system.controller.LoginController', 'login', NULL, NULL, '后台登录成功', '2020-02-23 13:54:55', '哈哈', 6);
INSERT INTO `sys_action_log` VALUES (344, '用户登录', 2, '127.0.0.1', 'com.linln.admin.system.controller.LoginController', 'login', NULL, NULL, '后台登录成功', '2020-02-23 13:55:09', '超级管理员', 1);
INSERT INTO `sys_action_log` VALUES (345, '角色授权', 1, '127.0.0.1', 'com.linln.admin.system.controller.RoleController', 'auth', 'sys_role', 5, '角色授权成功：器材', '2020-02-23 13:55:42', '超级管理员', 1);
INSERT INTO `sys_action_log` VALUES (346, '用户登录', 2, '127.0.0.1', 'com.linln.admin.system.controller.LoginController', 'login', NULL, NULL, '后台登录成功', '2020-02-23 13:55:58', '哈哈', 6);
INSERT INTO `sys_action_log` VALUES (347, '角色授权', 1, '127.0.0.1', 'com.linln.admin.system.controller.RoleController', 'auth', 'sys_role', 5, '角色授权成功：器材', '2020-02-23 13:56:17', '超级管理员', 1);
INSERT INTO `sys_action_log` VALUES (348, '用户登录', 2, '127.0.0.1', 'com.linln.admin.system.controller.LoginController', 'login', NULL, NULL, '后台登录成功', '2020-02-23 13:56:28', '哈哈', 6);
INSERT INTO `sys_action_log` VALUES (349, '用户登录', 2, '127.0.0.1', 'com.linln.admin.system.controller.LoginController', 'login', NULL, NULL, '后台登录成功', '2020-02-23 13:57:18', '哈哈', 6);
INSERT INTO `sys_action_log` VALUES (350, '角色授权', 1, '127.0.0.1', 'com.linln.admin.system.controller.RoleController', 'auth', 'sys_role', 5, '角色授权成功：器材', '2020-02-23 13:59:07', '超级管理员', 1);
INSERT INTO `sys_action_log` VALUES (351, '用户登录', 2, '127.0.0.1', 'com.linln.admin.system.controller.LoginController', 'login', NULL, NULL, '后台登录成功', '2020-02-23 13:59:13', '哈哈', 6);
INSERT INTO `sys_action_log` VALUES (352, '角色授权', 1, '127.0.0.1', 'com.linln.admin.system.controller.RoleController', 'auth', 'sys_role', 5, '角色授权成功：器材', '2020-02-23 13:59:25', '超级管理员', 1);
INSERT INTO `sys_action_log` VALUES (353, '用户登录', 2, '127.0.0.1', 'com.linln.admin.system.controller.LoginController', 'login', NULL, NULL, '后台登录成功', '2020-02-23 14:00:20', '哈哈', 6);
INSERT INTO `sys_action_log` VALUES (354, '角色分配', 1, '127.0.0.1', 'com.linln.admin.system.controller.UserController', 'auth', 'sys_user', 6, '角色分配成功：haha', '2020-02-23 14:05:29', '超级管理员', 1);
INSERT INTO `sys_action_log` VALUES (355, '用户登录', 2, '127.0.0.1', 'com.linln.admin.system.controller.LoginController', 'login', NULL, NULL, '后台登录成功', '2020-02-23 14:05:37', '哈哈', 6);
INSERT INTO `sys_action_log` VALUES (356, '角色授权', 1, '127.0.0.1', 'com.linln.admin.system.controller.RoleController', 'auth', 'sys_role', 4, '角色授权成功：教练员', '2020-02-23 14:05:54', '超级管理员', 1);
INSERT INTO `sys_action_log` VALUES (357, '用户登录', 2, '127.0.0.1', 'com.linln.admin.system.controller.LoginController', 'login', NULL, NULL, '后台登录成功', '2020-02-23 14:06:00', '哈哈', 6);
INSERT INTO `sys_action_log` VALUES (358, '用户登录', 2, '127.0.0.1', 'com.linln.admin.system.controller.LoginController', 'login', NULL, NULL, '后台登录成功', '2020-02-24 22:45:28', '超级管理员', 1);
INSERT INTO `sys_action_log` VALUES (359, '角色分配', 1, '127.0.0.1', 'com.linln.admin.system.controller.UserController', 'auth', 'sys_user', 1, '角色分配成功：admin', '2020-02-24 22:46:21', '超级管理员', 1);
INSERT INTO `sys_action_log` VALUES (360, '角色授权', 1, '127.0.0.1', 'com.linln.admin.system.controller.RoleController', 'auth', 'sys_role', 1, '角色授权成功：管理员', '2020-02-24 22:47:51', '超级管理员', 1);
INSERT INTO `sys_action_log` VALUES (361, '角色授权', 1, '127.0.0.1', 'com.linln.admin.system.controller.RoleController', 'auth', 'sys_role', 2, '角色授权成功：开发组', '2020-02-24 22:48:09', '超级管理员', 1);
INSERT INTO `sys_action_log` VALUES (362, '用户登录', 2, '127.0.0.1', 'com.linln.admin.system.controller.LoginController', 'login', NULL, NULL, '后台登录成功', '2020-02-24 22:48:46', '超级管理员', 1);
INSERT INTO `sys_action_log` VALUES (363, '角色分配', 1, '127.0.0.1', 'com.linln.admin.system.controller.UserController', 'auth', 'sys_user', 1, '角色分配成功：admin', '2020-02-24 22:49:04', '超级管理员', 1);
INSERT INTO `sys_action_log` VALUES (364, '用户登录', 2, '127.0.0.1', 'com.linln.admin.system.controller.LoginController', 'login', NULL, NULL, '后台登录成功', '2020-02-24 22:49:07', '超级管理员', 1);
INSERT INTO `sys_action_log` VALUES (365, '用户登录', 2, '127.0.0.1', 'com.linln.admin.system.controller.LoginController', 'login', NULL, NULL, '后台登录成功', '2020-02-24 22:51:38', '超级管理员', 1);
INSERT INTO `sys_action_log` VALUES (366, '用户登录', 2, '127.0.0.1', 'com.linln.admin.system.controller.LoginController', 'login', NULL, NULL, '后台登录成功', '2020-02-24 22:52:19', '超级管理员', 1);
INSERT INTO `sys_action_log` VALUES (367, '用户登录', 2, '127.0.0.1', 'com.linln.admin.system.controller.LoginController', 'login', NULL, NULL, '后台登录成功', '2020-02-24 22:52:55', '超级管理员', 1);
INSERT INTO `sys_action_log` VALUES (368, '角色授权', 1, '127.0.0.1', 'com.linln.admin.system.controller.RoleController', 'auth', 'sys_role', 1, '角色授权成功：管理员', '2020-02-24 22:53:12', '超级管理员', 1);
INSERT INTO `sys_action_log` VALUES (369, '菜单管理', 1, '127.0.0.1', 'com.linln.admin.system.controller.MenuController', 'save', 'sys_menu', 195, '更新菜单：报表信息', '2020-02-24 22:53:41', '超级管理员', 1);
INSERT INTO `sys_action_log` VALUES (370, '菜单管理', 1, '127.0.0.1', 'com.linln.admin.system.controller.MenuController', 'save', 'sys_menu', 196, '更新菜单：体能折线图', '2020-02-24 22:53:50', '超级管理员', 1);
INSERT INTO `sys_action_log` VALUES (371, '菜单管理', 1, '127.0.0.1', 'com.linln.admin.system.controller.MenuController', 'save', 'sys_menu', 7, '更新菜单：用户管理', '2020-02-24 22:54:08', '超级管理员', 1);
INSERT INTO `sys_action_log` VALUES (372, '菜单管理', 1, '127.0.0.1', 'com.linln.admin.system.controller.MenuController', 'save', 'sys_menu', 7, '更新菜单：用户管理', '2020-02-24 22:54:21', '超级管理员', 1);
INSERT INTO `sys_action_log` VALUES (373, '菜单管理', 1, '127.0.0.1', 'com.linln.admin.system.controller.MenuController', 'save', 'sys_menu', 189, '更新菜单：器材管理', '2020-02-24 22:55:15', '超级管理员', 1);
INSERT INTO `sys_action_log` VALUES (374, '菜单管理', 1, '127.0.0.1', 'com.linln.admin.system.controller.MenuController', 'save', 'sys_menu', 167, '更新菜单：会员卡管理', '2020-02-24 22:55:54', '超级管理员', 1);
INSERT INTO `sys_action_log` VALUES (375, '菜单管理', 1, '127.0.0.1', 'com.linln.admin.system.controller.MenuController', 'save', 'sys_menu', 174, '更新菜单：课程管理', '2020-02-24 22:56:06', '超级管理员', 1);
INSERT INTO `sys_action_log` VALUES (376, '菜单管理', 1, '127.0.0.1', 'com.linln.admin.system.controller.MenuController', 'save', 'sys_menu', 189, '更新菜单：器材管理', '2020-02-24 22:56:19', '超级管理员', 1);
INSERT INTO `sys_action_log` VALUES (377, '角色授权', 1, '127.0.0.1', 'com.linln.admin.system.controller.RoleController', 'auth', 'sys_role', 5, '角色授权成功：器材', '2020-02-24 22:56:43', '超级管理员', 1);
INSERT INTO `sys_action_log` VALUES (378, '角色分配', 1, '127.0.0.1', 'com.linln.admin.system.controller.UserController', 'auth', 'sys_user', 6, '角色分配成功：haha', '2020-02-24 22:56:51', '超级管理员', 1);
INSERT INTO `sys_action_log` VALUES (379, '用户登录', 2, '127.0.0.1', 'com.linln.admin.system.controller.LoginController', 'login', NULL, NULL, '后台登录成功', '2020-02-24 22:57:05', '哈哈', 6);
INSERT INTO `sys_action_log` VALUES (380, '角色授权', 1, '127.0.0.1', 'com.linln.admin.system.controller.RoleController', 'auth', 'sys_role', 5, '角色授权成功：器材', '2020-02-24 22:57:45', '超级管理员', 1);
INSERT INTO `sys_action_log` VALUES (381, '用户登录', 2, '127.0.0.1', 'com.linln.admin.system.controller.LoginController', 'login', NULL, NULL, '后台登录成功', '2020-02-24 22:57:59', '哈哈', 6);
INSERT INTO `sys_action_log` VALUES (382, '用户登录', 2, '127.0.0.1', 'com.linln.admin.system.controller.LoginController', 'login', NULL, NULL, '后台登录失败：[admin]用户名或密码错误', '2020-03-13 22:13:53', 'admin', NULL);
INSERT INTO `sys_action_log` VALUES (383, '用户登录', 2, '127.0.0.1', 'com.linln.admin.system.controller.LoginController', 'login', NULL, NULL, '后台登录失败：[admin]用户名或密码错误', '2020-03-13 22:13:57', 'admin', NULL);
INSERT INTO `sys_action_log` VALUES (384, '用户登录', 2, '127.0.0.1', 'com.linln.admin.system.controller.LoginController', 'login', NULL, NULL, '后台登录成功', '2020-03-13 22:14:00', '超级管理员', 1);
INSERT INTO `sys_action_log` VALUES (385, '用户登录', 2, '127.0.0.1', 'com.linln.admin.system.controller.LoginController', 'login', NULL, NULL, '后台登录成功', '2020-03-20 23:19:04', '超级管理员', 1);
INSERT INTO `sys_action_log` VALUES (386, '用户登录', 2, '127.0.0.1', 'com.linln.admin.system.controller.LoginController', 'login', NULL, NULL, '后台登录成功', '2020-03-20 23:19:21', '超级管理员', 1);
COMMIT;

-- ----------------------------
-- Table structure for sys_course
-- ----------------------------
DROP TABLE IF EXISTS `sys_course`;
CREATE TABLE `sys_course` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `count` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `end` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `start` varchar(255) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `create_by` bigint(20) DEFAULT NULL,
  `update_by` bigint(20) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKmcncr1bpwx4w4pyxyw75v8bg1` (`create_by`),
  KEY `FK95qgkf8h8itfk6045383bamvx` (`update_by`),
  KEY `FK94qgkf8h8turk6045383bamvx` (`user_id`) USING BTREE,
  CONSTRAINT `sys_course_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`id`),
  CONSTRAINT `sys_course_ibfk_2` FOREIGN KEY (`update_by`) REFERENCES `sys_user` (`id`),
  CONSTRAINT `sys_course_ibfk_3` FOREIGN KEY (`create_by`) REFERENCES `sys_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_course
-- ----------------------------
BEGIN;
INSERT INTO `sys_course` VALUES (1, 100, '2020-02-22 14:50:49', '2020-02-13', '瑜伽课程', '', '2020-02-20', 1, '体能', '2020-02-22 16:02:52', 2, 1, 1, NULL);
INSERT INTO `sys_course` VALUES (2, 10, '2020-02-22 15:03:41', '2020-2', '体操课程', '', '2020-1', 1, '运动', '2020-02-22 15:03:41', 1, 1, 1, NULL);
INSERT INTO `sys_course` VALUES (3, 100, '2020-02-22 15:53:19', '2020-02-05', '123', '', '2020-01-27', 1, '123', '2020-02-22 15:53:19', 2, 1, 1, NULL);
INSERT INTO `sys_course` VALUES (4, 10, '2020-02-22 15:59:13', '2020-02-19', '测试课程', '', '2020-01-29', 1, '测试', '2020-02-22 15:59:13', 2, 1, 1, NULL);
INSERT INTO `sys_course` VALUES (5, 11, '2020-02-22 16:03:43', '2020-02-20', '123', '', '2020-02-20', 1, '123', '2020-02-22 17:08:34', 2, 1, 1, 100.00);
COMMIT;

-- ----------------------------
-- Table structure for sys_course_copy1
-- ----------------------------
DROP TABLE IF EXISTS `sys_course_copy1`;
CREATE TABLE `sys_course_copy1` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `count` int(11) DEFAULT NULL COMMENT '容纳人数',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `end` varchar(255) DEFAULT NULL COMMENT '结束时间',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `start` varchar(255) DEFAULT NULL COMMENT '开始时间',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态',
  `type` varchar(255) DEFAULT NULL COMMENT '授课类型',
  `user_id` bigint(20) DEFAULT NULL COMMENT '教练id',
  `user_name` varchar(20) DEFAULT NULL COMMENT '教练姓名',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `room` varchar(50) DEFAULT NULL COMMENT '教室',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_course_copy1
-- ----------------------------
BEGIN;
INSERT INTO `sys_course_copy1` VALUES (1, 100, '2020-02-22 14:50:49', '2020-02-13', '瑜伽课程', '', '2020-02-20', 1, '体能', 2, '1', NULL, NULL);
INSERT INTO `sys_course_copy1` VALUES (2, 10, '2020-02-22 15:03:41', '2020-2', '体操课程', '', '2020-1', 1, '运动', 1, '1', NULL, NULL);
INSERT INTO `sys_course_copy1` VALUES (3, 100, '2020-02-22 15:53:19', '2020-02-05', '123', '', '2020-01-27', 1, '123', 2, '1', NULL, NULL);
INSERT INTO `sys_course_copy1` VALUES (4, 10, '2020-02-22 15:59:13', '2020-02-19', '测试课程', '', '2020-01-29', 1, '测试', 2, '1', NULL, NULL);
INSERT INTO `sys_course_copy1` VALUES (5, 11, '2020-02-22 16:03:43', '2020-02-20', '123', '', '2020-02-20', 1, '123', 2, '1', 100.00, NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `title` varchar(255) DEFAULT NULL COMMENT '部门名称',
  `pid` bigint(20) DEFAULT NULL COMMENT '父级ID',
  `pids` varchar(255) DEFAULT NULL COMMENT '所有父级编号',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建用户',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新用户',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态（1:正常,2:冻结,3:删除）',
  PRIMARY KEY (`id`),
  KEY `FKifwd1h4ciusl3nnxrpfpv316u` (`create_by`),
  KEY `FK83g45s1cjqqfpifhulqhv807m` (`update_by`),
  CONSTRAINT `sys_dept_ibfk_1` FOREIGN KEY (`update_by`) REFERENCES `sys_user` (`id`),
  CONSTRAINT `sys_dept_ibfk_2` FOREIGN KEY (`create_by`) REFERENCES `sys_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
BEGIN;
INSERT INTO `sys_dept` VALUES (1, '总公司', 0, '[0]', 1, '', '2018-12-02 17:41:23', '2019-02-23 02:41:28', 1, 1, 1);
INSERT INTO `sys_dept` VALUES (2, '技术部门', 1, '[0],[1]', 1, '', '2018-12-02 17:51:04', '2019-04-27 13:12:46', 1, 1, 1);
INSERT INTO `sys_dept` VALUES (3, '市场部门', 1, '[0],[1]', 2, '', '2018-12-02 17:51:42', '2019-04-27 13:12:20', 1, 1, 1);
INSERT INTO `sys_dept` VALUES (4, '研发部门', 1, '[0],[1]', 3, '', '2018-12-02 17:51:55', '2019-04-27 13:12:20', 1, 1, 1);
INSERT INTO `sys_dept` VALUES (5, '测试部门', 1, '[0],[1]', 4, '', '2018-12-02 17:52:07', '2019-04-27 13:12:20', 1, 1, 1);
INSERT INTO `sys_dept` VALUES (6, '客户群体', 1, '[0],[1]', 5, '', '2020-02-22 20:45:58', '2020-02-22 20:45:58', 1, 1, 1);
COMMIT;

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `title` varchar(255) DEFAULT NULL COMMENT '字典名称',
  `name` varchar(255) DEFAULT NULL COMMENT '字典键名',
  `type` tinyint(4) DEFAULT NULL COMMENT '字典类型',
  `value` text COMMENT '字典键值',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建用户',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新用户',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态（1:正常,2:冻结,3:删除）',
  PRIMARY KEY (`id`),
  KEY `FKag4shuprf2tjot9i1mhh37kk6` (`create_by`),
  KEY `FKoyng5jlifhsme0gc1lwiub0lr` (`update_by`),
  CONSTRAINT `sys_dict_ibfk_1` FOREIGN KEY (`create_by`) REFERENCES `sys_user` (`id`),
  CONSTRAINT `sys_dict_ibfk_2` FOREIGN KEY (`update_by`) REFERENCES `sys_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict` VALUES (1, '数据状态', 'DATA_STATUS', 2, '1:正常,2:冻结,3:删除', '', '2018-10-05 16:03:11', '2018-10-05 16:11:41', 1, 1, 1);
INSERT INTO `sys_dict` VALUES (2, '字典类型', 'DICT_TYPE', 2, '2:键值对', '', '2018-10-05 20:08:55', '2019-01-17 23:39:23', 1, 1, 1);
INSERT INTO `sys_dict` VALUES (3, '用户性别', 'USER_SEX', 2, '1:男,2:女', '', '2018-10-05 20:12:32', '2018-10-05 20:12:32', 1, 1, 1);
INSERT INTO `sys_dict` VALUES (4, '菜单类型', 'MENU_TYPE', 2, '1:目录,2:菜单,3:按钮', '', '2018-10-05 20:24:57', '2019-11-06 20:08:46', 1, 1, 1);
INSERT INTO `sys_dict` VALUES (5, '搜索栏状态', 'SEARCH_STATUS', 2, '1:正常,2:冻结', '', '2018-10-05 20:25:45', '2019-02-26 00:34:34', 1, 1, 1);
INSERT INTO `sys_dict` VALUES (6, '日志类型', 'LOG_TYPE', 2, '1:业务,2:登录,3:系统', '', '2018-10-05 20:28:47', '2019-02-26 00:31:43', 1, 1, 1);
COMMIT;

-- ----------------------------
-- Table structure for sys_equipment
-- ----------------------------
DROP TABLE IF EXISTS `sys_equipment`;
CREATE TABLE `sys_equipment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `code` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `damage` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `manufacturer` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `product` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `create_by` bigint(20) DEFAULT NULL,
  `update_by` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKbsj733knr4qiikiqt9f49gbib` (`create_by`),
  KEY `FK7q3aemedyuwxm6pjmkbmiou3e` (`update_by`),
  CONSTRAINT `sys_equipment_ibfk_1` FOREIGN KEY (`update_by`) REFERENCES `sys_user` (`id`),
  CONSTRAINT `sys_equipment_ibfk_2` FOREIGN KEY (`create_by`) REFERENCES `sys_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_equipment
-- ----------------------------
BEGIN;
INSERT INTO `sys_equipment` VALUES (1, '东北角', 1001, '2020-02-22 20:02:17', '无损坏', '跑步', '北京', '跑步机', '1000', '2020-1', '无', 1, '大型', '2020-02-22 20:02:17', 1, 1);
COMMIT;

-- ----------------------------
-- Table structure for sys_file
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(255) DEFAULT NULL COMMENT '文件名',
  `path` varchar(255) DEFAULT NULL COMMENT '文件路径',
  `mime` varchar(255) DEFAULT NULL COMMENT 'MIME文件类型',
  `size` bigint(20) DEFAULT NULL COMMENT '文件大小',
  `md5` varchar(255) DEFAULT NULL COMMENT 'MD5值',
  `sha1` varchar(255) DEFAULT NULL COMMENT 'SHA1值',
  `create_by` bigint(20) DEFAULT NULL COMMENT '上传者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `FKkkles8yp0a156p4247cc22ovn` (`create_by`),
  CONSTRAINT `sys_file_ibfk_1` FOREIGN KEY (`create_by`) REFERENCES `sys_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_file
-- ----------------------------
BEGIN;
INSERT INTO `sys_file` VALUES (3, 'a6797da104614015bd384bc959620ad7.jpg', '/upload/picture/20200222/a6797da104614015bd384bc959620ad7.jpg', 'image/jpeg', 13812, '9ed449211d992287fc7d4089fa577500', '63a9c8de0eab2593805ae660f915c792732fa6c0', 1, '2020-02-22 20:45:07');
COMMIT;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `title` varchar(255) DEFAULT NULL COMMENT '菜单名称',
  `pid` bigint(20) DEFAULT NULL COMMENT '父级编号',
  `pids` varchar(255) DEFAULT NULL COMMENT '所有父级编号',
  `url` varchar(255) DEFAULT NULL COMMENT 'URL地址',
  `perms` varchar(255) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(255) DEFAULT NULL COMMENT '图标',
  `type` tinyint(4) DEFAULT NULL COMMENT '类型（1:一级菜单,2:子级菜单,3:不是菜单）',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建用户',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新用户',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态（1:正常,2:冻结,3:删除）',
  PRIMARY KEY (`id`),
  KEY `FKoxg2hi96yr9pf2m0stjomr3we` (`create_by`),
  KEY `FKsiko0qcr8ddamvrxf1tk4opgc` (`update_by`),
  CONSTRAINT `sys_menu_ibfk_1` FOREIGN KEY (`create_by`) REFERENCES `sys_user` (`id`),
  CONSTRAINT `sys_menu_ibfk_2` FOREIGN KEY (`update_by`) REFERENCES `sys_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=197 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` VALUES (1, '菜单管理', 2, '[0],[2]', '/system/menu/index', 'system:menu:index', '', 2, 3, '', '2018-09-29 00:02:10', '2020-02-24 22:54:08', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (2, '系统管理', 0, '[0]', '#', '#', 'fa fa-cog', 1, 5, '', '2018-09-29 00:05:50', '2020-02-22 21:34:34', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (3, '添加', 1, '[0],[2],[1]', '/system/menu/add', 'system:menu:add', '', 3, 1, '', '2018-09-29 00:06:57', '2019-02-24 16:12:59', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (4, '角色管理', 2, '[0],[2]', '/system/role/index', 'system:role:index', '', 2, 2, '', '2018-09-29 00:08:14', '2020-02-24 22:54:08', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (5, '添加', 4, '[0],[2],[4]', '/system/role/add', 'system:role:add', '', 3, 1, '', '2018-09-29 00:09:04', '2019-02-24 16:12:04', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (6, '主页', 0, '[0]', '/index', 'index', 'layui-icon layui-icon-home', 1, 1, '', '2018-09-29 00:09:56', '2019-02-27 21:34:56', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (7, '用户管理', 2, '[0],[2]', '/system/user/index', 'system:user:index', 'layui-icon layui-icon-user', 2, 1, '', '2018-09-29 00:43:50', '2020-02-24 22:54:21', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (8, '编辑', 1, '[0],[2],[1]', '/system/menu/edit', 'system:menu:edit', '', 3, 2, '', '2018-09-29 00:57:33', '2019-02-24 16:13:05', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (9, '详细', 1, '[0],[2],[1]', '/system/menu/detail', 'system:menu:detail', '', 3, 3, '', '2018-09-29 01:03:00', '2019-02-24 16:13:12', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (10, '修改状态', 1, '[0],[2],[1]', '/system/menu/status', 'system:menu:status', '', 3, 4, '', '2018-09-29 01:03:43', '2019-02-24 16:13:21', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (11, '编辑', 4, '[0],[2],[4]', '/system/role/edit', 'system:role:edit', '', 3, 2, '', '2018-09-29 01:06:13', '2019-02-24 16:12:10', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (12, '授权', 4, '[0],[2],[4]', '/system/role/auth', 'system:role:auth', '', 3, 3, '', '2018-09-29 01:06:57', '2019-02-24 16:12:17', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (13, '详细', 4, '[0],[2],[4]', '/system/role/detail', 'system:role:detail', '', 3, 4, '', '2018-09-29 01:08:00', '2019-02-24 16:12:24', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (14, '修改状态', 4, '[0],[2],[4]', '/system/role/status', 'system:role:status', '', 3, 5, '', '2018-09-29 01:08:22', '2019-02-24 16:12:43', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (15, '编辑', 7, '[0],[2],[7]', '/system/user/edit', 'system:user:edit', '', 3, 2, '', '2018-09-29 21:17:17', '2019-02-24 16:11:03', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (16, '添加', 7, '[0],[2],[7]', '/system/user/add', 'system:user:add', '', 3, 1, '', '2018-09-29 21:17:58', '2019-02-24 16:10:28', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (17, '修改密码', 7, '[0],[2],[7]', '/system/user/pwd', 'system:user:pwd', '', 3, 3, '', '2018-09-29 21:19:40', '2019-02-24 16:11:11', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (18, '权限分配', 7, '[0],[2],[7]', '/system/user/role', 'system:user:role', '', 3, 4, '', '2018-09-29 21:20:35', '2019-02-24 16:11:18', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (19, '详细', 7, '[0],[2],[7]', '/system/user/detail', 'system:user:detail', '', 3, 5, '', '2018-09-29 21:21:00', '2019-02-24 16:11:26', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (20, '修改状态', 7, '[0],[2],[7]', '/system/user/status', 'system:user:status', '', 3, 6, '', '2018-09-29 21:21:18', '2019-02-24 16:11:35', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (21, '字典管理', 2, '[0],[2]', '/system/dict/index', 'system:dict:index', '', 2, 5, '', '2018-10-05 00:55:52', '2020-02-22 19:52:09', 1, 1, 3);
INSERT INTO `sys_menu` VALUES (22, '字典添加', 21, '[0],[2],[21]', '/system/dict/add', 'system:dict:add', '', 3, 1, '', '2018-10-05 00:56:26', '2020-02-22 19:52:09', 1, 1, 3);
INSERT INTO `sys_menu` VALUES (23, '字典编辑', 21, '[0],[2],[21]', '/system/dict/edit', 'system:dict:edit', '', 3, 2, '', '2018-10-05 00:57:08', '2020-02-22 19:52:09', 1, 1, 3);
INSERT INTO `sys_menu` VALUES (24, '字典详细', 21, '[0],[2],[21]', '/system/dict/detail', 'system:dict:detail', '', 3, 3, '', '2018-10-05 00:57:42', '2020-02-22 19:52:09', 1, 1, 3);
INSERT INTO `sys_menu` VALUES (25, '修改状态', 21, '[0],[2],[21]', '/system/dict/status', 'system:dict:status', '', 3, 4, '', '2018-10-05 00:58:27', '2020-02-22 19:52:09', 1, 1, 3);
INSERT INTO `sys_menu` VALUES (26, '行为日志', 2, '[0],[2]', '/system/actionLog/index', 'system:actionLog:index', '', 2, 5, '', '2018-10-14 16:52:01', '2020-02-24 22:54:08', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (27, '日志详细', 26, '[0],[2],[26]', '/system/actionLog/detail', 'system:actionLog:detail', '', 3, 1, '', '2018-10-14 21:07:11', '2019-02-27 21:34:15', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (28, '日志删除', 26, '[0],[2],[26]', '/system/actionLog/delete', 'system:actionLog:delete', '', 3, 2, '', '2018-10-14 21:08:17', '2019-02-27 21:34:15', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (30, '开发中心', 0, '[0]', '#', '#', 'fa fa-gavel', 1, 5, '', '2018-10-19 16:38:23', '2020-02-22 21:33:19', 1, 1, 3);
INSERT INTO `sys_menu` VALUES (31, '代码生成', 30, '[0],[30]', '/dev/code', '#', '', 2, 1, '', '2018-10-19 16:39:04', '2020-02-22 21:33:19', 1, 1, 3);
INSERT INTO `sys_menu` VALUES (125, '表单构建', 30, '[0],[30]', '/dev/build', '#', '', 2, 2, '', '2018-11-25 16:12:23', '2020-02-22 21:33:19', 1, 1, 3);
INSERT INTO `sys_menu` VALUES (136, '部门管理', 2, '[0],[2]', '/system/dept/index', 'system:dept:index', '', 2, 4, '', '2018-12-02 16:33:23', '2020-02-24 22:54:08', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (137, '添加', 136, '[0],[2],[136]', '/system/dept/add', 'system:dept:add', '', 3, 1, '', '2018-12-02 16:33:23', '2019-02-24 16:13:34', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (138, '编辑', 136, '[0],[2],[136]', '/system/dept/edit', 'system:dept:edit', '', 3, 2, '', '2018-12-02 16:33:23', '2019-02-24 16:13:42', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (139, '详细', 136, '[0],[2],[136]', '/system/dept/detail', 'system:dept:detail', '', 3, 3, '', '2018-12-02 16:33:23', '2019-02-24 16:13:49', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (140, '改变状态', 136, '[0],[2],[136]', '/system/dept/status', 'system:dept:status', '', 3, 4, '', '2018-12-02 16:33:23', '2019-02-24 16:13:57', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (146, '数据接口', 30, '[0],[30]', '/dev/swagger', '#', '', 2, 3, '', '2018-12-09 21:11:11', '2020-02-22 21:33:19', 1, 1, 3);
INSERT INTO `sys_menu` VALUES (147, '体能信息', 0, '[0]', '/physical/physical/index', 'physical:physical:index', NULL, 1, 4, NULL, '2020-02-22 09:45:38', '2020-02-22 10:14:57', 1, 1, 3);
INSERT INTO `sys_menu` VALUES (148, '添加', 147, '[0],[147]', '/physical/physical/add', 'physical:physical:add', NULL, 3, 1, NULL, '2020-02-22 09:45:38', '2020-02-22 10:14:57', 1, 1, 3);
INSERT INTO `sys_menu` VALUES (149, '编辑', 147, '[0],[147]', '/physical/physical/edit', 'physical:physical:edit', NULL, 3, 1, NULL, '2020-02-22 09:45:38', '2020-02-22 10:14:57', 1, 1, 3);
INSERT INTO `sys_menu` VALUES (150, '详细', 147, '[0],[147]', '/physical/physical/detail', 'physical:physical:detail', NULL, 3, 1, NULL, '2020-02-22 09:45:38', '2020-02-22 10:14:57', 1, 1, 3);
INSERT INTO `sys_menu` VALUES (151, '修改状态', 147, '[0],[147]', '/physical/physical/status', 'physical:physical:status', NULL, 3, 1, NULL, '2020-02-22 09:45:38', '2020-02-22 10:14:57', 1, 1, 3);
INSERT INTO `sys_menu` VALUES (152, '体能信息', 0, '[0]', '/physical/physical/index', 'physical:physical:index', NULL, 1, 4, NULL, '2020-02-22 10:21:45', '2020-02-22 10:54:23', 1, 1, 3);
INSERT INTO `sys_menu` VALUES (153, '添加', 152, '[0],[152]', '/physical/physical/add', 'physical:physical:add', NULL, 3, 1, NULL, '2020-02-22 10:21:45', '2020-02-22 10:54:23', 1, 1, 3);
INSERT INTO `sys_menu` VALUES (154, '编辑', 152, '[0],[152]', '/physical/physical/edit', 'physical:physical:edit', NULL, 3, 1, NULL, '2020-02-22 10:21:45', '2020-02-22 10:54:23', 1, 1, 3);
INSERT INTO `sys_menu` VALUES (155, '详细', 152, '[0],[152]', '/physical/physical/detail', 'physical:physical:detail', NULL, 3, 1, NULL, '2020-02-22 10:21:45', '2020-02-22 10:54:23', 1, 1, 3);
INSERT INTO `sys_menu` VALUES (156, '修改状态', 152, '[0],[152]', '/physical/physical/status', 'physical:physical:status', NULL, 3, 1, NULL, '2020-02-22 10:21:45', '2020-02-22 10:54:23', 1, 1, 3);
INSERT INTO `sys_menu` VALUES (157, '体能信息', 0, '[0]', '/physical/physical/index', 'physical:physical:index', NULL, 1, 4, NULL, '2020-02-22 10:59:43', '2020-02-22 11:07:06', 1, 1, 3);
INSERT INTO `sys_menu` VALUES (158, '添加', 157, '[0],[157]', '/physical/physical/add', 'physical:physical:add', NULL, 3, 1, NULL, '2020-02-22 10:59:43', '2020-02-22 11:07:06', 1, 1, 3);
INSERT INTO `sys_menu` VALUES (159, '编辑', 157, '[0],[157]', '/physical/physical/edit', 'physical:physical:edit', NULL, 3, 1, NULL, '2020-02-22 10:59:43', '2020-02-22 11:07:06', 1, 1, 3);
INSERT INTO `sys_menu` VALUES (160, '详细', 157, '[0],[157]', '/physical/physical/detail', 'physical:physical:detail', NULL, 3, 1, NULL, '2020-02-22 10:59:43', '2020-02-22 11:07:06', 1, 1, 3);
INSERT INTO `sys_menu` VALUES (161, '修改状态', 157, '[0],[157]', '/physical/physical/status', 'physical:physical:status', NULL, 3, 1, NULL, '2020-02-22 10:59:43', '2020-02-22 11:07:06', 1, 1, 3);
INSERT INTO `sys_menu` VALUES (162, '体能信息', 173, '[0],[173]', '/physical/physical/index', 'physical:physical:index', '', 2, 2, '', '2020-02-22 11:07:11', '2020-02-22 19:45:26', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (163, '添加', 162, '[0],[162]', '/physical/physical/add', 'physical:physical:add', NULL, 3, 1, NULL, '2020-02-22 11:07:11', '2020-02-22 11:07:11', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (164, '编辑', 162, '[0],[162]', '/physical/physical/edit', 'physical:physical:edit', NULL, 3, 1, NULL, '2020-02-22 11:07:11', '2020-02-22 11:07:11', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (165, '详细', 162, '[0],[162]', '/physical/physical/detail', 'physical:physical:detail', NULL, 3, 1, NULL, '2020-02-22 11:07:11', '2020-02-22 11:07:11', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (166, '修改状态', 162, '[0],[162]', '/physical/physical/status', 'physical:physical:status', NULL, 3, 1, NULL, '2020-02-22 11:07:11', '2020-02-22 11:07:11', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (167, '会员卡管理', 2, '[0],[2]', '/vip/vip/index', 'vip:vip:index', 'layui-icon layui-icon-layer', 2, 9, '', '2020-02-22 12:05:11', '2020-02-24 22:55:54', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (168, '添加', 167, '[0],[167]', '/vip/vip/add', 'vip:vip:add', NULL, 3, 1, NULL, '2020-02-22 12:05:11', '2020-02-22 12:05:11', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (169, '编辑', 167, '[0],[167]', '/vip/vip/edit', 'vip:vip:edit', NULL, 3, 1, NULL, '2020-02-22 12:05:11', '2020-02-22 12:05:11', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (170, '详细', 167, '[0],[167]', '/vip/vip/detail', 'vip:vip:detail', NULL, 3, 1, NULL, '2020-02-22 12:05:11', '2020-02-22 12:05:11', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (171, '修改状态', 167, '[0],[167]', '/vip/vip/status', 'vip:vip:status', NULL, 3, 1, NULL, '2020-02-22 12:05:11', '2020-02-22 12:05:11', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (172, '会员卡信息', 173, '[0],[173]', '/vip/vip/detail', 'vip:vip:selfdetail', '', 2, 1, '', '2020-02-22 12:25:04', '2020-02-22 12:57:50', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (173, '我的服务', 0, '[0]', '#', '#', 'layui-icon layui-icon-face-smile', 1, 2, '', '2020-02-22 12:57:33', '2020-02-22 21:24:49', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (174, '课程管理', 2, '[0],[2]', '/course/course/index', 'course:course:index', 'layui-icon layui-icon-table', 2, 10, '', '2020-02-22 13:15:24', '2020-02-24 22:56:06', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (175, '添加', 174, '[0],[174]', '/course/course/add/4', 'course:course:add', '', 3, 1, '', '2020-02-22 13:15:24', '2020-02-22 15:36:35', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (176, '编辑', 174, '[0],[174]', '/course/course/edit', 'course:course:edit', NULL, 3, 2, NULL, '2020-02-22 13:15:24', '2020-02-22 15:36:35', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (177, '详细', 174, '[0],[174]', '/course/course/detail', 'course:course:detail', NULL, 3, 3, NULL, '2020-02-22 13:15:24', '2020-02-22 15:36:35', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (178, '修改状态', 174, '[0],[174]', '/course/course/status', 'course:course:status', NULL, 3, 4, NULL, '2020-02-22 13:15:24', '2020-02-22 15:36:35', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (179, '我的课程', 180, '[0],[180]', '/course/course/myself', 'course:course:myself', '', 2, 1, '', '2020-02-22 14:38:58', '2020-02-22 14:40:53', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (180, '私人课程', 0, '[0]', '#', '#', 'layui-icon layui-icon-rmb', 1, 3, '', '2020-02-22 14:40:28', '2020-02-22 21:34:34', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (181, '课程定制', 180, '[0],[180]', '/course/course/buy', 'course:course:buy', '', 2, 2, '', '2020-02-22 14:41:41', '2020-02-22 14:41:41', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (182, '课程评价', 188, '[0],[188]', '/survey/survey/index', 'survey:survey:index', '', 2, 2, '', '2020-02-22 18:57:45', '2020-02-22 19:41:58', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (183, '添加', 182, '[0],[182]', '/survey/survey/add', 'survey:survey:add', NULL, 3, 1, NULL, '2020-02-22 18:57:45', '2020-02-22 19:39:03', 1, 1, 3);
INSERT INTO `sys_menu` VALUES (184, '编辑', 182, '[0],[182]', '/survey/survey/edit', 'survey:survey:edit', NULL, 3, 1, NULL, '2020-02-22 18:57:45', '2020-02-22 19:39:22', 1, 1, 3);
INSERT INTO `sys_menu` VALUES (185, '详细', 182, '[0],[182]', '/survey/survey/detail', 'survey:survey:detail', NULL, 3, 1, NULL, '2020-02-22 18:57:45', '2020-02-22 19:39:08', 1, 1, 3);
INSERT INTO `sys_menu` VALUES (186, '修改状态', 182, '[0],[182]', '/survey/survey/status', 'survey:survey:status', NULL, 3, 1, NULL, '2020-02-22 18:57:45', '2020-02-22 19:39:13', 1, 1, 3);
INSERT INTO `sys_menu` VALUES (187, '教练评价', 188, '[0],[188]', '/survey/survey/index2', 'survey:survey:index2', '', 2, 1, '', '2020-02-22 19:38:57', '2020-02-22 19:41:46', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (188, '评价管理', 0, '[0]', '#', '#', 'layui-icon layui-icon-dialogue', 1, 8, '', '2020-02-22 19:41:29', '2020-02-22 21:34:34', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (189, '器材管理', 2, '[0],[2]', '/equipment/equipment/index', 'equipment:equipment:index', 'layui-icon layui-icon-util', 2, 8, '', '2020-02-22 19:59:10', '2020-02-24 22:56:19', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (190, '添加', 189, '[0],[189]', '/equipment/equipment/add', 'equipment:equipment:add', NULL, 3, 1, NULL, '2020-02-22 19:59:10', '2020-02-22 19:59:10', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (191, '编辑', 189, '[0],[189]', '/equipment/equipment/edit', 'equipment:equipment:edit', NULL, 3, 1, NULL, '2020-02-22 19:59:10', '2020-02-22 19:59:10', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (192, '详细', 189, '[0],[189]', '/equipment/equipment/detail', 'equipment:equipment:detail', NULL, 3, 1, NULL, '2020-02-22 19:59:10', '2020-02-22 19:59:10', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (193, '修改状态', 189, '[0],[189]', '/equipment/equipment/status', 'equipment:equipment:status', NULL, 3, 1, NULL, '2020-02-22 19:59:10', '2020-02-22 19:59:10', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (194, '账号数据导出', 2, '[0],[2]', '/system/user/export', 'system:user:export', '', 2, 6, '', '2020-02-22 21:21:27', '2020-02-24 22:54:08', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (195, '报表信息', 2, '[0],[2]', '/system/chart/area', 'system:chart:area', 'layui-icon layui-icon-chart', 2, 7, '', '2020-02-22 21:53:27', '2020-02-24 22:54:08', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (196, '体能折线图', 173, '[0],[173]', '/system/chart/line', 'system:chart:line', '', 2, 3, '', '2020-02-23 00:27:00', '2020-02-24 22:53:50', 1, 1, 1);
COMMIT;

-- ----------------------------
-- Table structure for sys_mycourse
-- ----------------------------
DROP TABLE IF EXISTS `sys_mycourse`;
CREATE TABLE `sys_mycourse` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT NULL,
  `course_id` int(10) DEFAULT NULL,
  `create_date` varchar(20) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_mycourse
-- ----------------------------
BEGIN;
INSERT INTO `sys_mycourse` VALUES (1, 1, 5, '2020-02-22', 1);
COMMIT;

-- ----------------------------
-- Table structure for sys_physical
-- ----------------------------
DROP TABLE IF EXISTS `sys_physical`;
CREATE TABLE `sys_physical` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `height` varchar(20) DEFAULT NULL COMMENT '身高',
  `weight` varchar(20) DEFAULT NULL COMMENT '体重',
  `bmi` varchar(20) DEFAULT NULL COMMENT 'bmi',
  `fat` varchar(20) DEFAULT NULL COMMENT '体内脂肪',
  `muscle` varchar(20) DEFAULT NULL COMMENT '肌肉',
  `moisture` varchar(20) DEFAULT NULL COMMENT '水分',
  `protein` varchar(20) DEFAULT NULL COMMENT '蛋白质',
  `bone` varchar(20) DEFAULT NULL COMMENT '骨量',
  `sex` varchar(20) DEFAULT NULL COMMENT '性别',
  `age` int(10) DEFAULT NULL COMMENT '年龄',
  `user_id` int(10) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `create_by` bigint(20) DEFAULT NULL,
  `update_by` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKqx8y3b7pq864wy6wl5rrumh4f` (`create_by`),
  KEY `FKku4j8f994th3dvrce1r4ms9q6` (`update_by`),
  CONSTRAINT `sys_physical_ibfk_1` FOREIGN KEY (`update_by`) REFERENCES `sys_user` (`id`),
  CONSTRAINT `sys_physical_ibfk_2` FOREIGN KEY (`create_by`) REFERENCES `sys_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_physical
-- ----------------------------
BEGIN;
INSERT INTO `sys_physical` VALUES (2, '1', '1', '1', '1', '1', '1', '1', '1', '1', 1, 1, '2020-02-22 11:09:19', '1', 1, '11', '2020-02-22 11:09:19', 1, 1);
INSERT INTO `sys_physical` VALUES (3, '1', '1', '1', '1', '1', '1', '1', '1', '11', 1, 10, '2020-02-22 11:22:21', '1', 1, '测试', '2020-02-22 11:22:21', 1, 1);
INSERT INTO `sys_physical` VALUES (4, '100', '100', '100', '100', '100', '100', '100', '100', '男', 29, 3, '2020-02-22 11:36:18', '', 1, '你好', '2020-02-22 11:36:18', 3, 3);
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `title` varchar(255) DEFAULT NULL COMMENT '角色名称（中文名）',
  `name` varchar(255) DEFAULT NULL COMMENT '标识名称',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建用户',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新用户',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态（1:正常,2:冻结,3:删除）',
  PRIMARY KEY (`id`),
  KEY `FKdkwvv0rm6j3d5l6hwsy2dplol` (`create_by`),
  KEY `FKrouqqi3f2bgc5o83wdstlh6q4` (`update_by`),
  CONSTRAINT `sys_role_ibfk_1` FOREIGN KEY (`create_by`) REFERENCES `sys_user` (`id`),
  CONSTRAINT `sys_role_ibfk_2` FOREIGN KEY (`update_by`) REFERENCES `sys_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` VALUES (1, '管理员', 'admin', '', '2018-09-29 00:12:40', '2020-02-24 22:53:12', 1, 1, 1);
INSERT INTO `sys_role` VALUES (2, '开发组', 'group', '', '2018-09-30 16:04:32', '2020-02-24 22:48:09', 1, 1, 1);
INSERT INTO `sys_role` VALUES (3, '用户组', 'customer', '', '2018-09-30 16:24:20', '2020-02-22 17:13:26', 1, 1, 1);
INSERT INTO `sys_role` VALUES (4, '教练员', 'coach', '', '2020-02-22 15:36:19', '2020-02-23 14:05:54', 1, 1, 1);
INSERT INTO `sys_role` VALUES (5, '器材', 'qicai', '', '2020-02-23 13:53:57', '2020-02-24 22:57:45', 1, 1, 1);
COMMIT;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) NOT NULL,
  `menu_id` bigint(20) NOT NULL,
  PRIMARY KEY (`role_id`,`menu_id`),
  KEY `FKf3mud4qoc7ayew8nml4plkevo` (`menu_id`),
  CONSTRAINT `sys_role_menu_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `sys_menu` (`id`),
  CONSTRAINT `sys_role_menu_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_menu` VALUES (1, 1);
INSERT INTO `sys_role_menu` VALUES (1, 2);
INSERT INTO `sys_role_menu` VALUES (5, 2);
INSERT INTO `sys_role_menu` VALUES (1, 3);
INSERT INTO `sys_role_menu` VALUES (1, 4);
INSERT INTO `sys_role_menu` VALUES (1, 5);
INSERT INTO `sys_role_menu` VALUES (1, 6);
INSERT INTO `sys_role_menu` VALUES (2, 6);
INSERT INTO `sys_role_menu` VALUES (3, 6);
INSERT INTO `sys_role_menu` VALUES (5, 6);
INSERT INTO `sys_role_menu` VALUES (1, 7);
INSERT INTO `sys_role_menu` VALUES (1, 8);
INSERT INTO `sys_role_menu` VALUES (1, 9);
INSERT INTO `sys_role_menu` VALUES (1, 10);
INSERT INTO `sys_role_menu` VALUES (1, 11);
INSERT INTO `sys_role_menu` VALUES (1, 12);
INSERT INTO `sys_role_menu` VALUES (1, 13);
INSERT INTO `sys_role_menu` VALUES (1, 14);
INSERT INTO `sys_role_menu` VALUES (1, 15);
INSERT INTO `sys_role_menu` VALUES (1, 16);
INSERT INTO `sys_role_menu` VALUES (1, 17);
INSERT INTO `sys_role_menu` VALUES (1, 18);
INSERT INTO `sys_role_menu` VALUES (1, 19);
INSERT INTO `sys_role_menu` VALUES (1, 20);
INSERT INTO `sys_role_menu` VALUES (1, 26);
INSERT INTO `sys_role_menu` VALUES (1, 27);
INSERT INTO `sys_role_menu` VALUES (1, 28);
INSERT INTO `sys_role_menu` VALUES (1, 136);
INSERT INTO `sys_role_menu` VALUES (1, 137);
INSERT INTO `sys_role_menu` VALUES (1, 138);
INSERT INTO `sys_role_menu` VALUES (1, 139);
INSERT INTO `sys_role_menu` VALUES (1, 140);
INSERT INTO `sys_role_menu` VALUES (1, 162);
INSERT INTO `sys_role_menu` VALUES (2, 162);
INSERT INTO `sys_role_menu` VALUES (3, 162);
INSERT INTO `sys_role_menu` VALUES (1, 163);
INSERT INTO `sys_role_menu` VALUES (2, 163);
INSERT INTO `sys_role_menu` VALUES (3, 163);
INSERT INTO `sys_role_menu` VALUES (1, 164);
INSERT INTO `sys_role_menu` VALUES (2, 164);
INSERT INTO `sys_role_menu` VALUES (3, 164);
INSERT INTO `sys_role_menu` VALUES (1, 165);
INSERT INTO `sys_role_menu` VALUES (2, 165);
INSERT INTO `sys_role_menu` VALUES (3, 165);
INSERT INTO `sys_role_menu` VALUES (1, 166);
INSERT INTO `sys_role_menu` VALUES (2, 166);
INSERT INTO `sys_role_menu` VALUES (3, 166);
INSERT INTO `sys_role_menu` VALUES (1, 167);
INSERT INTO `sys_role_menu` VALUES (1, 168);
INSERT INTO `sys_role_menu` VALUES (1, 169);
INSERT INTO `sys_role_menu` VALUES (1, 170);
INSERT INTO `sys_role_menu` VALUES (1, 171);
INSERT INTO `sys_role_menu` VALUES (1, 172);
INSERT INTO `sys_role_menu` VALUES (2, 172);
INSERT INTO `sys_role_menu` VALUES (1, 173);
INSERT INTO `sys_role_menu` VALUES (2, 173);
INSERT INTO `sys_role_menu` VALUES (1, 174);
INSERT INTO `sys_role_menu` VALUES (4, 174);
INSERT INTO `sys_role_menu` VALUES (1, 175);
INSERT INTO `sys_role_menu` VALUES (4, 175);
INSERT INTO `sys_role_menu` VALUES (1, 176);
INSERT INTO `sys_role_menu` VALUES (4, 176);
INSERT INTO `sys_role_menu` VALUES (1, 177);
INSERT INTO `sys_role_menu` VALUES (4, 177);
INSERT INTO `sys_role_menu` VALUES (1, 178);
INSERT INTO `sys_role_menu` VALUES (4, 178);
INSERT INTO `sys_role_menu` VALUES (1, 179);
INSERT INTO `sys_role_menu` VALUES (1, 180);
INSERT INTO `sys_role_menu` VALUES (1, 181);
INSERT INTO `sys_role_menu` VALUES (1, 182);
INSERT INTO `sys_role_menu` VALUES (1, 187);
INSERT INTO `sys_role_menu` VALUES (1, 188);
INSERT INTO `sys_role_menu` VALUES (1, 189);
INSERT INTO `sys_role_menu` VALUES (5, 189);
INSERT INTO `sys_role_menu` VALUES (1, 190);
INSERT INTO `sys_role_menu` VALUES (5, 190);
INSERT INTO `sys_role_menu` VALUES (1, 191);
INSERT INTO `sys_role_menu` VALUES (5, 191);
INSERT INTO `sys_role_menu` VALUES (1, 192);
INSERT INTO `sys_role_menu` VALUES (5, 192);
INSERT INTO `sys_role_menu` VALUES (1, 193);
INSERT INTO `sys_role_menu` VALUES (5, 193);
INSERT INTO `sys_role_menu` VALUES (1, 194);
INSERT INTO `sys_role_menu` VALUES (1, 195);
INSERT INTO `sys_role_menu` VALUES (1, 196);
INSERT INTO `sys_role_menu` VALUES (2, 196);
COMMIT;

-- ----------------------------
-- Table structure for sys_survey
-- ----------------------------
DROP TABLE IF EXISTS `sys_survey`;
CREATE TABLE `sys_survey` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `satisfaction` varchar(255) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `create_by` bigint(20) DEFAULT NULL,
  `update_by` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKc08qtpxnyuxq4o1nr3kgvlan4` (`create_by`),
  KEY `FK4bjke5lqkehme26qdce2qp706` (`update_by`),
  CONSTRAINT `sys_survey_ibfk_1` FOREIGN KEY (`update_by`) REFERENCES `sys_user` (`id`),
  CONSTRAINT `sys_survey_ibfk_2` FOREIGN KEY (`create_by`) REFERENCES `sys_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_survey
-- ----------------------------
BEGIN;
INSERT INTO `sys_survey` VALUES (1, '没有', '2020-02-22 19:28:59', '123', '88', '100', 3, '关于课程评价', 1, '2020-02-22 19:28:59', 1, 1, 1);
INSERT INTO `sys_survey` VALUES (2, '324', '2020-02-22 19:29:14', '小懒虫', '', '100', 1, '测试', 2, '2020-02-22 19:29:14', 1, 1, 1);
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `username` varchar(255) DEFAULT NULL COMMENT '用户名',
  `nickname` varchar(255) DEFAULT NULL COMMENT '用户昵称',
  `password` char(64) DEFAULT NULL COMMENT '密码',
  `salt` varchar(255) DEFAULT NULL COMMENT '密码盐',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `picture` varchar(255) DEFAULT NULL COMMENT '头像',
  `sex` tinyint(4) DEFAULT NULL COMMENT '性别（1:男,2:女）',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(255) DEFAULT NULL COMMENT '电话号码',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态（1:正常,2:冻结,3:删除）',
  PRIMARY KEY (`id`),
  KEY `FKb3pkx0wbo6o8i8lj0gxr37v1n` (`dept_id`),
  CONSTRAINT `sys_user_ibfk_1` FOREIGN KEY (`dept_id`) REFERENCES `sys_dept` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` VALUES (1, 'admin', '超级管理员', '5fa04c0758ae596e2a93cd2802640693a5b08bdfacd4307abce323c85e481154', '7rl2t9', 1, '/upload/picture/20200222/a6797da104614015bd384bc959620ad7.jpg', 1, '10086@163.com', '10086', '', '2020-02-14 23:00:03', '2020-02-24 22:49:04', 1);
INSERT INTO `sys_user` VALUES (2, 'linln', '小懒虫', '28bfc4f19b0d4b8a40018faf9aec4ad9db5491082dda439040b1c35ff8c533a7', 'gzNkXt', 2, NULL, 2, '1008612@qq.com', '1008612', '', '2020-02-12 16:25:22', '2020-02-22 15:49:54', 1);
INSERT INTO `sys_user` VALUES (3, 'rain', '小雨', 'aa62a8ce50f20dbb645e79d0a12d602c9046ba6808c075f8b59eba82a28e19eb', 'eOq7iC', 5, NULL, 1, '123@163.com', '15248409766', '', '2020-02-12 11:34:08', '2020-02-22 11:34:28', 1);
INSERT INTO `sys_user` VALUES (4, 'test', 'test', '303d05f64271920e941849ebcb84d02ffc135ead6694277dacf522c64db6532e', 'T5kPYU', 6, NULL, 1, '123@163.com', '15248409766', '无', '2020-02-22 21:08:32', '2020-02-22 21:08:32', 1);
INSERT INTO `sys_user` VALUES (5, 'rain123', 'raina', 'aada1803c298247d1db7ae95c0c1124fb2a23c99062913282c776421190febdd', 'HYCGGT', 6, NULL, 1, '123@163.com', '15248409766', '无', '2020-02-22 22:32:34', '2020-02-23 13:54:14', 1);
INSERT INTO `sys_user` VALUES (6, 'haha', '哈哈', 'bcf4017d77d6edb212305efd8208c9153c08d3b50868cf2985b2117df9eb91a4', 'r3XZ4y', 3, NULL, 1, '123@163.com', '15248409766', '', '2020-02-23 13:53:34', '2020-02-24 22:56:51', 1);
COMMIT;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FKhh52n8vd4ny9ff4x9fb8v65qx` (`role_id`),
  CONSTRAINT `sys_user_role_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`id`),
  CONSTRAINT `sys_user_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (3, 3);
INSERT INTO `sys_user_role` VALUES (4, 3);
INSERT INTO `sys_user_role` VALUES (2, 4);
INSERT INTO `sys_user_role` VALUES (5, 5);
INSERT INTO `sys_user_role` VALUES (6, 5);
COMMIT;

-- ----------------------------
-- Table structure for sys_vip
-- ----------------------------
DROP TABLE IF EXISTS `sys_vip`;
CREATE TABLE `sys_vip` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `card` varchar(20) DEFAULT NULL COMMENT '卡号',
  `level` varchar(20) DEFAULT NULL COMMENT '会员级别',
  `balance` decimal(10,2) DEFAULT NULL COMMENT '余额',
  `type` varchar(50) DEFAULT NULL COMMENT '会员卡类型 1月卡 2季卡 3半年卡 4 年卡',
  `user_id` int(10) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `create_by` bigint(20) DEFAULT NULL,
  `update_by` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKaddfmwi9qayac3pcqn06406lm` (`create_by`),
  KEY `FKrm4e62gfswd37pql4h2q5j1gd` (`update_by`),
  CONSTRAINT `sys_vip_ibfk_1` FOREIGN KEY (`create_by`) REFERENCES `sys_user` (`id`),
  CONSTRAINT `sys_vip_ibfk_2` FOREIGN KEY (`update_by`) REFERENCES `sys_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_vip
-- ----------------------------
BEGIN;
INSERT INTO `sys_vip` VALUES (1, '10002', '金卡', 1000.00, '月卡', 3, '2020-02-22 12:12:59', '无', 2, '2020-02-22 12:12:59', 1, 1);
INSERT INTO `sys_vip` VALUES (2, '10001', '超级会员', 900.00, '月卡', 1, '2020-02-22 17:11:42', '', 1, '2020-02-22 18:11:11', 1, 1);
COMMIT;

-- ----------------------------
-- Table structure for sys_vip_copy1
-- ----------------------------
DROP TABLE IF EXISTS `sys_vip_copy1`;
CREATE TABLE `sys_vip_copy1` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `card` varchar(20) DEFAULT NULL COMMENT '卡号',
  `level` varchar(20) DEFAULT NULL COMMENT '会员级别',
  `balance` decimal(10,2) DEFAULT NULL COMMENT '余额',
  `type` varchar(50) DEFAULT NULL COMMENT '会员卡类型 1月卡 2季卡 3半年卡 4 年卡',
  `user_id` int(10) DEFAULT NULL COMMENT '用户id',
  `create_date` datetime DEFAULT NULL COMMENT '建立时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `user_name` varchar(20) DEFAULT NULL COMMENT '用户姓名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_vip_copy1
-- ----------------------------
BEGIN;
INSERT INTO `sys_vip_copy1` VALUES (1, '10002', '金卡', 1000.00, '月卡', 3, '2020-02-22 12:12:59', '无', 2, '2020-02-22 12:12:59', '1');
INSERT INTO `sys_vip_copy1` VALUES (2, '10001', '超级会员', 900.00, '月卡', 1, '2020-02-22 17:11:42', '', 1, '2020-02-22 18:11:11', '1');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
