/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 80028
Source Host           : localhost:3306
Source Database       : ry-vue

Target Server Type    : MYSQL
Target Server Version : 80028
File Encoding         : 65001

Date: 2024-10-05 22:33:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table` (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) COLLATE utf8_unicode_ci DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) COLLATE utf8_unicode_ci DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci COMMENT='代码生成业务表';

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES ('4', 'sys_feedback', '用户反馈', null, null, 'SysFeedback', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'feedback', '用户反馈', 'Tr_', '0', '/', '{}', 'admin', '2024-09-18 13:44:04', '', '2024-09-18 13:45:10', null);
INSERT INTO `gen_table` VALUES ('5', 'message', '留言板', null, null, 'Message', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'message', '留言板', 'Tr', '0', '/', '{}', 'admin', '2024-10-03 09:09:04', '', '2024-10-03 09:12:43', null);
INSERT INTO `gen_table` VALUES ('6', 'rotation_map', '轮播图表', null, null, 'RotationMap', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'Rotationmap', '轮播图', 'Tr', '0', '/', '{}', 'admin', '2024-10-04 18:48:57', '', '2024-10-04 18:50:50', null);
INSERT INTO `gen_table` VALUES ('7', 'priject_content', '项目信息表', null, null, 'PrijectContent', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'content', '项目信息', 'Tr', '0', '/', '{}', 'admin', '2024-10-04 20:07:44', '', '2024-10-04 20:09:12', null);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column` (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) COLLATE utf8_unicode_ci DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '字典类型',
  `sort` int DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci COMMENT='代码生成业务表字段';

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES ('34', '4', 'id', 'ID', 'bigint', 'Long', 'id', '1', '1', '0', '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2024-09-18 13:44:04', '', '2024-09-18 13:45:10');
INSERT INTO `gen_table_column` VALUES ('35', '4', 'img_url', '图片路径', 'varchar(30)', 'String', 'imgUrl', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'imageUpload', '', '2', 'admin', '2024-09-18 13:44:04', '', '2024-09-18 13:45:10');
INSERT INTO `gen_table_column` VALUES ('36', '4', 'content', '描述', 'varchar(30)', 'String', 'content', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'editor', '', '3', 'admin', '2024-09-18 13:44:04', '', '2024-09-18 13:45:10');
INSERT INTO `gen_table_column` VALUES ('37', '4', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', null, null, null, 'EQ', 'input', '', '4', 'admin', '2024-09-18 13:44:04', '', '2024-09-18 13:45:10');
INSERT INTO `gen_table_column` VALUES ('38', '4', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', null, null, null, 'EQ', 'datetime', '', '5', 'admin', '2024-09-18 13:44:04', '', '2024-09-18 13:45:10');
INSERT INTO `gen_table_column` VALUES ('39', '4', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '0', '0', '0', null, 'EQ', 'textarea', '', '6', 'admin', '2024-09-18 13:44:04', '', '2024-09-18 13:45:10');
INSERT INTO `gen_table_column` VALUES ('40', '4', 'extend1', 'extend1', 'varchar(64)', 'String', 'extend1', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', '7', 'admin', '2024-09-18 13:44:04', '', '2024-09-18 13:45:10');
INSERT INTO `gen_table_column` VALUES ('41', '4', 'extend2', 'extend2', 'varchar(64)', 'String', 'extend2', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', '8', 'admin', '2024-09-18 13:44:04', '', '2024-09-18 13:45:10');
INSERT INTO `gen_table_column` VALUES ('42', '4', 'extend3', 'extend3', 'varchar(64)', 'String', 'extend3', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', '9', 'admin', '2024-09-18 13:44:04', '', '2024-09-18 13:45:10');
INSERT INTO `gen_table_column` VALUES ('43', '4', 'extend4', 'extend4', 'varchar(64)', 'String', 'extend4', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', '10', 'admin', '2024-09-18 13:44:04', '', '2024-09-18 13:45:10');
INSERT INTO `gen_table_column` VALUES ('44', '5', 'handle', '主键', 'varchar(40)', 'String', 'handle', '1', '0', '0', '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2024-10-03 09:09:04', '', '2024-10-03 09:12:43');
INSERT INTO `gen_table_column` VALUES ('45', '5', 'send_user', '发送人', 'varchar(20)', 'String', 'sendUser', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', '2', 'admin', '2024-10-03 09:09:04', '', '2024-10-03 09:12:43');
INSERT INTO `gen_table_column` VALUES ('46', '5', 'receive_user', '接收人', 'varchar(20)', 'String', 'receiveUser', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', '3', 'admin', '2024-10-03 09:09:04', '', '2024-10-03 09:12:43');
INSERT INTO `gen_table_column` VALUES ('47', '5', 'content', '留言内容', 'varchar(500)', 'String', 'content', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'editor', '', '4', 'admin', '2024-10-03 09:09:04', '', '2024-10-03 09:12:43');
INSERT INTO `gen_table_column` VALUES ('48', '5', 'is_read', '是否已读', 'tinyint(1)', 'Integer', 'isRead', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', 'is_read', '5', 'admin', '2024-10-03 09:09:04', '', '2024-10-03 09:12:43');
INSERT INTO `gen_table_column` VALUES ('49', '5', 'create_time', '留言时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', null, null, null, 'EQ', 'datetime', '', '6', 'admin', '2024-10-03 09:09:04', '', '2024-10-03 09:12:43');
INSERT INTO `gen_table_column` VALUES ('50', '6', 'id', '住建', 'int', 'Long', 'id', '1', '1', '0', '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2024-10-04 18:48:57', '', '2024-10-04 18:50:50');
INSERT INTO `gen_table_column` VALUES ('51', '6', 'img_url', '图片', 'varchar(1000)', 'String', 'imgUrl', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'imageUpload', '', '2', 'admin', '2024-10-04 18:48:57', '', '2024-10-04 18:50:50');
INSERT INTO `gen_table_column` VALUES ('52', '6', 'title', '标题', 'varchar(255)', 'String', 'title', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', '3', 'admin', '2024-10-04 18:48:57', '', '2024-10-04 18:50:50');
INSERT INTO `gen_table_column` VALUES ('53', '6', 'create_date', '添加时间', 'datetime', 'Date', 'createDate', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', '4', 'admin', '2024-10-04 18:48:57', '', '2024-10-04 18:50:50');
INSERT INTO `gen_table_column` VALUES ('54', '6', 'extend1', null, 'varchar(255)', 'String', 'extend1', '0', '0', '0', '1', '0', '0', '0', 'EQ', 'input', '', '5', 'admin', '2024-10-04 18:48:57', '', '2024-10-04 18:50:50');
INSERT INTO `gen_table_column` VALUES ('55', '6', 'extend2', null, 'varchar(255)', 'String', 'extend2', '0', '0', '0', '1', '0', '0', '0', 'EQ', 'input', '', '6', 'admin', '2024-10-04 18:48:57', '', '2024-10-04 18:50:50');
INSERT INTO `gen_table_column` VALUES ('56', '6', 'extend3', null, 'varchar(255)', 'String', 'extend3', '0', '0', '0', '1', '0', '0', '0', 'EQ', 'input', '', '7', 'admin', '2024-10-04 18:48:57', '', '2024-10-04 18:50:50');
INSERT INTO `gen_table_column` VALUES ('57', '6', 'extend4', null, 'varchar(255)', 'String', 'extend4', '0', '0', '0', '1', '0', '0', '0', 'EQ', 'input', '', '8', 'admin', '2024-10-04 18:48:57', '', '2024-10-04 18:50:50');
INSERT INTO `gen_table_column` VALUES ('58', '7', 'id', null, 'int', 'Long', 'id', '1', '1', '0', '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2024-10-04 20:07:44', '', '2024-10-04 20:09:12');
INSERT INTO `gen_table_column` VALUES ('59', '7', 'title', '标题', 'varchar(255)', 'String', 'title', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', '2', 'admin', '2024-10-04 20:07:44', '', '2024-10-04 20:09:12');
INSERT INTO `gen_table_column` VALUES ('60', '7', 'content', '内容', 'varchar(500)', 'String', 'content', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'editor', '', '3', 'admin', '2024-10-04 20:07:44', '', '2024-10-04 20:09:12');
INSERT INTO `gen_table_column` VALUES ('61', '7', 'img', '图片', 'varchar(500)', 'String', 'img', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'imageUpload', '', '4', 'admin', '2024-10-04 20:07:44', '', '2024-10-04 20:09:12');
INSERT INTO `gen_table_column` VALUES ('62', '7', 'create_by', '添加人', 'varchar(255)', 'String', 'createBy', '0', '0', '0', '0', null, null, null, 'EQ', 'input', '', '5', 'admin', '2024-10-04 20:07:44', '', '2024-10-04 20:09:12');
INSERT INTO `gen_table_column` VALUES ('63', '7', 'create_date', '添加时间', 'datetime', 'Date', 'createDate', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'datetime', '', '6', 'admin', '2024-10-04 20:07:44', '', '2024-10-04 20:09:12');
INSERT INTO `gen_table_column` VALUES ('64', '7', 'create_dept', '专业', 'varchar(255)', 'String', 'createDept', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', '7', 'admin', '2024-10-04 20:07:44', '', '2024-10-04 20:09:12');
INSERT INTO `gen_table_column` VALUES ('65', '7', 'create_avatar', '头像', 'varchar(500)', 'String', 'createAvatar', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'textarea', '', '8', 'admin', '2024-10-04 20:07:44', '', '2024-10-04 20:09:12');
INSERT INTO `gen_table_column` VALUES ('66', '7', 'extend1', null, 'varchar(255)', 'String', 'extend1', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', '9', 'admin', '2024-10-04 20:07:44', '', '2024-10-04 20:09:12');
INSERT INTO `gen_table_column` VALUES ('67', '7', 'extend2', null, 'varchar(255)', 'String', 'extend2', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', '10', 'admin', '2024-10-04 20:07:44', '', '2024-10-04 20:09:12');
INSERT INTO `gen_table_column` VALUES ('68', '7', 'extend3', null, 'varchar(255)', 'String', 'extend3', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', '11', 'admin', '2024-10-04 20:07:44', '', '2024-10-04 20:09:12');

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `handle` varchar(40) NOT NULL COMMENT '主键',
  `send_user` varchar(20) DEFAULT NULL COMMENT '发送人',
  `receive_user` varchar(20) DEFAULT NULL COMMENT '接收人',
  `content` varchar(500) DEFAULT NULL COMMENT '留言内容',
  `is_read` tinyint(1) DEFAULT '0' COMMENT '是否已读',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '留言时间',
  PRIMARY KEY (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='留言板';

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('24fba136-e145-48c8-967e-0a36c6be33f0', '111', 'admin', '你好', '0', '2024-10-05 22:00:53');
INSERT INTO `message` VALUES ('2b109036-342e-46ea-bbea-f9f22fbb9000', 'ceshi', '111', '测试', '0', '2024-10-05 22:15:37');
INSERT INTO `message` VALUES ('2e275b25-3aaf-422a-8893-639d7f6a9eeb', '111', '123', '你好', '0', '2024-10-04 01:29:23');
INSERT INTO `message` VALUES ('51b4c1aa-7ca3-4d4d-99a2-5b54448ed0d1', '123', '111', '睡觉睡觉', '0', '2024-10-04 01:29:40');
INSERT INTO `message` VALUES ('74c3d10e-b743-47ba-baa9-4ad47b47410c', '123', 'ceshi', '你好', '0', '2024-10-05 22:14:17');
INSERT INTO `message` VALUES ('7d047bed-83fe-422b-bded-afb929ba5877', '111', '123', '嗯嗯睡了睡了', '0', '2024-10-04 01:29:51');
INSERT INTO `message` VALUES ('8f93f7cf-7d56-44a0-94e1-a1e012cb3bc8', '123', '111', '你好', '0', '2024-10-04 01:29:10');
INSERT INTO `message` VALUES ('bc894de5-d49f-4833-8e52-f9d1478e1ed4', 'ceshi', '111', '你好', '0', '2024-10-05 22:13:56');

-- ----------------------------
-- Table structure for priject_content
-- ----------------------------
DROP TABLE IF EXISTS `priject_content`;
CREATE TABLE `priject_content` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '标题',
  `content` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '内容',
  `img` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '图片',
  `create_by` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '添加人',
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `create_dept` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '专业',
  `create_avatar` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '头像',
  `extend1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extend2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extend3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci COMMENT='项目信息表';

-- ----------------------------
-- Records of priject_content
-- ----------------------------
INSERT INTO `priject_content` VALUES ('2', '1', '2', '/profile/avatar/2024/10/05/t016b562cfd7904cbd1_20241005214544A001.jpg', null, '2024-10-05 21:45:54', '会计', '/profile/avatar/2024/10/04/1727976472363_20241004012752A004.png', '123', null, null);
INSERT INTO `priject_content` VALUES ('3', '11', '22', '/profile/avatar/2024/10/05/t045a3fc9366567d918_20241005214639A002.jpg', null, '2024-10-05 21:46:39', '会计', '/profile/avatar/2024/10/04/1727976472363_20241004012752A004.png', '123', null, null);
INSERT INTO `priject_content` VALUES ('5', '测试2', '测试2', '/profile/avatar/2024/10/05/t045a3fc9366567d918_20241005220801A001.jpg', null, '2024-10-05 22:08:01', '会计', '/profile/avatar/2024/10/04/1727974533446_20241004005533A001.png', '111', null, null);

-- ----------------------------
-- Table structure for rotation_map
-- ----------------------------
DROP TABLE IF EXISTS `rotation_map`;
CREATE TABLE `rotation_map` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '住建',
  `img_url` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '图片',
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '标题',
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `extend1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extend2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extend3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extend4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci COMMENT='轮播图表';

-- ----------------------------
-- Records of rotation_map
-- ----------------------------
INSERT INTO `rotation_map` VALUES ('3', '/profile/upload/2024/10/04/t016b562cfd7904cbd1_20241004190412A003.jpg', null, '2024-10-04 19:04:12', null, null, null, null);
INSERT INTO `rotation_map` VALUES ('4', '/profile/upload/2024/10/04/t016d73e1922d926257_20241004190415A004.jpg', null, '2024-10-04 19:04:16', null, null, null, null);
INSERT INTO `rotation_map` VALUES ('5', '/profile/upload/2024/10/04/t0102af9d75e5267053_20241004190420A005.jpg', null, '2024-10-04 19:04:20', null, null, null, null);
INSERT INTO `rotation_map` VALUES ('6', '/profile/upload/2024/10/04/t045a3fc9366567d918_20241004190423A006.jpg', null, '2024-10-04 19:04:24', null, null, null, null);

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) COLLATE utf8_unicode_ci DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci COMMENT='参数配置表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2024-09-17 00:16:08', '', null, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES ('2', '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2024-09-17 00:16:08', '', null, '初始化密码 123456');
INSERT INTO `sys_config` VALUES ('3', '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2024-09-17 00:16:08', '', null, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES ('4', '账号自助-验证码开关', 'sys.account.captchaEnabled', 'false', 'Y', 'admin', '2024-09-17 00:16:08', '', null, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES ('5', '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'true', 'Y', 'admin', '2024-09-17 00:16:08', '', null, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES ('6', '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2024-09-17 00:16:08', '', null, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '部门名称',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `status` char(1) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci COMMENT='部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('1', '0', '', '大学', '0', null, null, null, '0', '0', '', null, '', null);
INSERT INTO `sys_dept` VALUES ('200', '1', ',1', '计算机', '1', null, null, null, '0', '0', 'admin', '2024-10-02 17:56:19', '', null);
INSERT INTO `sys_dept` VALUES ('201', '1', ',1', '会计', '2', null, null, null, '0', '0', 'admin', '2024-10-02 17:56:28', '', null);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) COLLATE utf8_unicode_ci DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci COMMENT='字典数据表';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES ('1', '1', '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2024-09-17 00:16:08', '', null, '性别男');
INSERT INTO `sys_dict_data` VALUES ('2', '2', '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-09-17 00:16:08', '', null, '性别女');
INSERT INTO `sys_dict_data` VALUES ('3', '3', '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-09-17 00:16:08', '', null, '性别未知');
INSERT INTO `sys_dict_data` VALUES ('4', '1', '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2024-09-17 00:16:08', '', null, '显示菜单');
INSERT INTO `sys_dict_data` VALUES ('5', '2', '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2024-09-17 00:16:08', '', null, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES ('6', '1', '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2024-09-17 00:16:08', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('7', '2', '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2024-09-17 00:16:08', '', null, '停用状态');
INSERT INTO `sys_dict_data` VALUES ('8', '1', '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2024-09-17 00:16:08', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('9', '2', '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2024-09-17 00:16:08', '', null, '停用状态');
INSERT INTO `sys_dict_data` VALUES ('10', '1', '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2024-09-17 00:16:08', '', null, '默认分组');
INSERT INTO `sys_dict_data` VALUES ('11', '2', '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2024-09-17 00:16:08', '', null, '系统分组');
INSERT INTO `sys_dict_data` VALUES ('12', '1', '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2024-09-17 00:16:08', '', null, '系统默认是');
INSERT INTO `sys_dict_data` VALUES ('13', '2', '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2024-09-17 00:16:08', '', null, '系统默认否');
INSERT INTO `sys_dict_data` VALUES ('14', '1', '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2024-09-17 00:16:08', '', null, '通知');
INSERT INTO `sys_dict_data` VALUES ('15', '2', '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2024-09-17 00:16:08', '', null, '公告');
INSERT INTO `sys_dict_data` VALUES ('16', '1', '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2024-09-17 00:16:08', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('17', '2', '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2024-09-17 00:16:08', '', null, '关闭状态');
INSERT INTO `sys_dict_data` VALUES ('18', '99', '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-09-17 00:16:08', '', null, '其他操作');
INSERT INTO `sys_dict_data` VALUES ('19', '1', '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-09-17 00:16:08', '', null, '新增操作');
INSERT INTO `sys_dict_data` VALUES ('20', '2', '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-09-17 00:16:08', '', null, '修改操作');
INSERT INTO `sys_dict_data` VALUES ('21', '3', '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-09-17 00:16:08', '', null, '删除操作');
INSERT INTO `sys_dict_data` VALUES ('22', '4', '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2024-09-17 00:16:08', '', null, '授权操作');
INSERT INTO `sys_dict_data` VALUES ('23', '5', '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-09-17 00:16:08', '', null, '导出操作');
INSERT INTO `sys_dict_data` VALUES ('24', '6', '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-09-17 00:16:08', '', null, '导入操作');
INSERT INTO `sys_dict_data` VALUES ('25', '7', '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-09-17 00:16:08', '', null, '强退操作');
INSERT INTO `sys_dict_data` VALUES ('26', '8', '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-09-17 00:16:08', '', null, '生成操作');
INSERT INTO `sys_dict_data` VALUES ('27', '9', '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-09-17 00:16:08', '', null, '清空操作');
INSERT INTO `sys_dict_data` VALUES ('28', '1', '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2024-09-17 00:16:08', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('29', '2', '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2024-09-17 00:16:08', '', null, '停用状态');
INSERT INTO `sys_dict_data` VALUES ('100', '0', '是', '1', 'is_read', null, 'default', 'N', '0', 'admin', '2024-10-03 09:11:29', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('101', '0', '否', '0', 'is_read', null, 'default', 'N', '0', 'admin', '2024-10-03 09:11:38', '', null, null);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '字典类型',
  `status` char(1) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci COMMENT='字典类型表';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES ('1', '用户性别', 'sys_user_sex', '0', 'admin', '2024-09-17 00:16:08', '', null, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES ('2', '菜单状态', 'sys_show_hide', '0', 'admin', '2024-09-17 00:16:08', '', null, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES ('3', '系统开关', 'sys_normal_disable', '0', 'admin', '2024-09-17 00:16:08', '', null, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES ('4', '任务状态', 'sys_job_status', '0', 'admin', '2024-09-17 00:16:08', '', null, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES ('5', '任务分组', 'sys_job_group', '0', 'admin', '2024-09-17 00:16:08', '', null, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES ('6', '系统是否', 'sys_yes_no', '0', 'admin', '2024-09-17 00:16:08', '', null, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES ('7', '通知类型', 'sys_notice_type', '0', 'admin', '2024-09-17 00:16:08', '', null, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES ('8', '通知状态', 'sys_notice_status', '0', 'admin', '2024-09-17 00:16:08', '', null, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES ('9', '操作类型', 'sys_oper_type', '0', 'admin', '2024-09-17 00:16:08', '', null, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES ('10', '系统状态', 'sys_common_status', '0', 'admin', '2024-09-17 00:16:08', '', null, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES ('100', '是否已读', 'is_read', '0', 'admin', '2024-10-03 09:11:03', '', null, null);

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job` (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) COLLATE utf8_unicode_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) COLLATE utf8_unicode_ci DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) COLLATE utf8_unicode_ci DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci COMMENT='定时任务调度表';

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES ('1', '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2024-09-17 00:16:08', '', null, '');
INSERT INTO `sys_job` VALUES ('2', '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2024-09-17 00:16:08', '', null, '');
INSERT INTO `sys_job` VALUES ('3', '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2024-09-17 00:16:08', '', null, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) COLLATE utf8_unicode_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '日志信息',
  `status` char(1) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci COMMENT='定时任务调度日志表';

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '操作系统',
  `status` char(1) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`),
  KEY `idx_sys_logininfor_s` (`status`),
  KEY `idx_sys_logininfor_lt` (`login_time`)
) ENGINE=InnoDB AUTO_INCREMENT=197 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci COMMENT='系统访问记录';

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES ('100', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-17 00:23:14');
INSERT INTO `sys_logininfor` VALUES ('101', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-09-17 00:23:46');
INSERT INTO `sys_logininfor` VALUES ('102', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-17 00:23:52');
INSERT INTO `sys_logininfor` VALUES ('103', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-18 08:31:08');
INSERT INTO `sys_logininfor` VALUES ('104', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-09-18 10:21:26');
INSERT INTO `sys_logininfor` VALUES ('105', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-18 10:21:29');
INSERT INTO `sys_logininfor` VALUES ('106', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-09-18 11:01:47');
INSERT INTO `sys_logininfor` VALUES ('107', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-18 11:01:50');
INSERT INTO `sys_logininfor` VALUES ('108', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2024-09-18 13:43:54');
INSERT INTO `sys_logininfor` VALUES ('109', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2024-09-18 13:49:17');
INSERT INTO `sys_logininfor` VALUES ('110', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2024-09-18 13:49:24');
INSERT INTO `sys_logininfor` VALUES ('111', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2024-09-18 20:32:08');
INSERT INTO `sys_logininfor` VALUES ('112', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2024-09-18 20:35:07');
INSERT INTO `sys_logininfor` VALUES ('113', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2024-09-18 20:35:56');
INSERT INTO `sys_logininfor` VALUES ('114', 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '1', '验证码已失效', '2024-10-02 17:28:39');
INSERT INTO `sys_logininfor` VALUES ('115', 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '1', '验证码已失效', '2024-10-02 17:28:41');
INSERT INTO `sys_logininfor` VALUES ('116', 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '1', '验证码已失效', '2024-10-02 17:28:42');
INSERT INTO `sys_logininfor` VALUES ('117', 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '1', '验证码已失效', '2024-10-02 17:28:44');
INSERT INTO `sys_logininfor` VALUES ('118', 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '1', '验证码已失效', '2024-10-02 17:30:03');
INSERT INTO `sys_logininfor` VALUES ('119', 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '1', '验证码已失效', '2024-10-02 17:32:55');
INSERT INTO `sys_logininfor` VALUES ('120', 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '1', '验证码已失效', '2024-10-02 17:35:07');
INSERT INTO `sys_logininfor` VALUES ('121', 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '0', '登录成功', '2024-10-02 17:35:24');
INSERT INTO `sys_logininfor` VALUES ('122', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-02 17:39:43');
INSERT INTO `sys_logininfor` VALUES ('123', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-02 17:54:54');
INSERT INTO `sys_logininfor` VALUES ('124', '11', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '0', '注册成功', '2024-10-02 18:08:31');
INSERT INTO `sys_logininfor` VALUES ('125', '17690920999', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '0', '注册成功', '2024-10-02 19:04:35');
INSERT INTO `sys_logininfor` VALUES ('126', '17690920999', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '1', '用户不存在/密码错误', '2024-10-02 19:04:53');
INSERT INTO `sys_logininfor` VALUES ('127', '17690920999', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '1', '用户不存在/密码错误', '2024-10-02 19:04:55');
INSERT INTO `sys_logininfor` VALUES ('128', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-02 19:05:01');
INSERT INTO `sys_logininfor` VALUES ('129', '11', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '0', '注册成功', '2024-10-02 19:07:26');
INSERT INTO `sys_logininfor` VALUES ('130', '17690929999', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '0', '注册成功', '2024-10-02 22:00:42');
INSERT INTO `sys_logininfor` VALUES ('131', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-02 22:00:49');
INSERT INTO `sys_logininfor` VALUES ('132', '17690929999', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '1', '用户不存在/密码错误', '2024-10-02 22:01:09');
INSERT INTO `sys_logininfor` VALUES ('133', '17690929999', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '1', '用户不存在/密码错误', '2024-10-02 22:03:17');
INSERT INTO `sys_logininfor` VALUES ('134', '17690929999', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '1', '用户不存在/密码错误', '2024-10-02 22:03:18');
INSERT INTO `sys_logininfor` VALUES ('135', '17690929999', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '1', '用户不存在/密码错误', '2024-10-02 22:03:19');
INSERT INTO `sys_logininfor` VALUES ('136', '17690929999', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '1', '用户不存在/密码错误', '2024-10-02 22:05:20');
INSERT INTO `sys_logininfor` VALUES ('137', '17690929999', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '1', '密码输入错误5次，帐户锁定10分钟', '2024-10-02 22:05:40');
INSERT INTO `sys_logininfor` VALUES ('138', '111', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '0', '注册成功', '2024-10-02 22:06:52');
INSERT INTO `sys_logininfor` VALUES ('139', '111', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '0', '登录成功', '2024-10-02 22:07:00');
INSERT INTO `sys_logininfor` VALUES ('140', '11', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '1', '用户不存在/密码错误', '2024-10-02 22:15:16');
INSERT INTO `sys_logininfor` VALUES ('141', '111', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '0', '登录成功', '2024-10-02 22:15:26');
INSERT INTO `sys_logininfor` VALUES ('142', '111', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '0', '登录成功', '2024-10-02 22:16:57');
INSERT INTO `sys_logininfor` VALUES ('143', '111', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2024-10-02 22:30:11');
INSERT INTO `sys_logininfor` VALUES ('144', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-03 09:08:53');
INSERT INTO `sys_logininfor` VALUES ('145', '111', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '0', '登录成功', '2024-10-03 09:54:02');
INSERT INTO `sys_logininfor` VALUES ('146', '111', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2024-10-03 09:54:52');
INSERT INTO `sys_logininfor` VALUES ('147', '111', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2024-10-03 19:48:35');
INSERT INTO `sys_logininfor` VALUES ('148', '111', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2024-10-03 19:52:43');
INSERT INTO `sys_logininfor` VALUES ('149', '111', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2024-10-03 20:02:03');
INSERT INTO `sys_logininfor` VALUES ('150', '111', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '0', '登录成功', '2024-10-03 20:10:26');
INSERT INTO `sys_logininfor` VALUES ('151', '111', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '0', '登录成功', '2024-10-03 20:11:41');
INSERT INTO `sys_logininfor` VALUES ('152', '111', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2024-10-03 21:04:43');
INSERT INTO `sys_logininfor` VALUES ('153', '111', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '0', '登录成功', '2024-10-03 21:09:28');
INSERT INTO `sys_logininfor` VALUES ('154', '111', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2024-10-03 23:25:25');
INSERT INTO `sys_logininfor` VALUES ('155', '111', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '0', '登录成功', '2024-10-03 23:37:36');
INSERT INTO `sys_logininfor` VALUES ('156', '111', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2024-10-04 00:05:01');
INSERT INTO `sys_logininfor` VALUES ('157', '111', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2024-10-04 00:13:10');
INSERT INTO `sys_logininfor` VALUES ('158', 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '1', '用户不存在/密码错误', '2024-10-04 00:19:14');
INSERT INTO `sys_logininfor` VALUES ('159', 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '0', '登录成功', '2024-10-04 00:19:24');
INSERT INTO `sys_logininfor` VALUES ('160', '111', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2024-10-04 00:23:19');
INSERT INTO `sys_logininfor` VALUES ('161', '123', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '0', '注册成功', '2024-10-04 00:24:52');
INSERT INTO `sys_logininfor` VALUES ('162', '111', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '0', '登录成功', '2024-10-04 00:25:00');
INSERT INTO `sys_logininfor` VALUES ('163', '111', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '0', '登录成功', '2024-10-04 00:43:32');
INSERT INTO `sys_logininfor` VALUES ('164', '111', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '退出成功', '2024-10-04 00:45:24');
INSERT INTO `sys_logininfor` VALUES ('165', 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2024-10-04 00:45:34');
INSERT INTO `sys_logininfor` VALUES ('166', '111', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2024-10-04 00:47:34');
INSERT INTO `sys_logininfor` VALUES ('167', '111', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '0', '登录成功', '2024-10-04 00:49:48');
INSERT INTO `sys_logininfor` VALUES ('168', '111', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '退出成功', '2024-10-04 00:54:03');
INSERT INTO `sys_logininfor` VALUES ('169', '123', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2024-10-04 00:54:15');
INSERT INTO `sys_logininfor` VALUES ('170', '111', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '0', '登录成功', '2024-10-04 00:54:37');
INSERT INTO `sys_logininfor` VALUES ('171', '123', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2024-10-04 01:24:35');
INSERT INTO `sys_logininfor` VALUES ('172', '123', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2024-10-04 01:26:32');
INSERT INTO `sys_logininfor` VALUES ('173', '111', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '0', '登录成功', '2024-10-04 01:27:03');
INSERT INTO `sys_logininfor` VALUES ('174', '123', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2024-10-04 01:27:56');
INSERT INTO `sys_logininfor` VALUES ('175', '123', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2024-10-04 01:28:58');
INSERT INTO `sys_logininfor` VALUES ('176', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-04 18:47:01');
INSERT INTO `sys_logininfor` VALUES ('177', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-04 18:57:10');
INSERT INTO `sys_logininfor` VALUES ('178', '111', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '0', '登录成功', '2024-10-04 19:04:41');
INSERT INTO `sys_logininfor` VALUES ('179', '123', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2024-10-04 19:09:23');
INSERT INTO `sys_logininfor` VALUES ('180', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-04 20:07:35');
INSERT INTO `sys_logininfor` VALUES ('181', '111', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '0', '登录成功', '2024-10-04 23:56:06');
INSERT INTO `sys_logininfor` VALUES ('182', '123', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2024-10-05 00:08:37');
INSERT INTO `sys_logininfor` VALUES ('183', '111', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '0', '登录成功', '2024-10-05 21:15:26');
INSERT INTO `sys_logininfor` VALUES ('184', '123', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2024-10-05 21:17:07');
INSERT INTO `sys_logininfor` VALUES ('185', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-05 21:49:34');
INSERT INTO `sys_logininfor` VALUES ('186', '111', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-10-05 21:59:49');
INSERT INTO `sys_logininfor` VALUES ('187', '111', '192.168.1.6', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '0', '退出成功', '2024-10-05 22:11:20');
INSERT INTO `sys_logininfor` VALUES ('188', '123', '192.168.1.6', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '0', '登录成功', '2024-10-05 22:11:37');
INSERT INTO `sys_logininfor` VALUES ('189', '123', '192.168.1.6', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '0', '退出成功', '2024-10-05 22:12:02');
INSERT INTO `sys_logininfor` VALUES ('190', '111', '192.168.1.6', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '0', '登录成功', '2024-10-05 22:12:40');
INSERT INTO `sys_logininfor` VALUES ('191', '111', '192.168.1.6', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '0', '退出成功', '2024-10-05 22:12:49');
INSERT INTO `sys_logininfor` VALUES ('192', 'ceshi', '192.168.1.6', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '0', '注册成功', '2024-10-05 22:13:02');
INSERT INTO `sys_logininfor` VALUES ('193', 'ceshi', '192.168.1.6', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '0', '登录成功', '2024-10-05 22:13:09');
INSERT INTO `sys_logininfor` VALUES ('194', 'ceshi', '192.168.1.6', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '0', '退出成功', '2024-10-05 22:16:18');
INSERT INTO `sys_logininfor` VALUES ('195', '111', '192.168.1.6', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '0', '登录成功', '2024-10-05 22:16:22');
INSERT INTO `sys_logininfor` VALUES ('196', '111', '192.168.1.6', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '0', '退出成功', '2024-10-05 22:17:09');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '路由参数',
  `route_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '路由名称',
  `is_frame` int DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) COLLATE utf8_unicode_ci DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2008 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci COMMENT='菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '系统管理', '0', '1', 'system', null, '', '', '1', '0', 'M', '0', '0', '', 'system', 'admin', '2024-09-17 00:16:08', '', null, '系统管理目录');
INSERT INTO `sys_menu` VALUES ('2', '系统监控', '0', '2', 'monitor', null, '', '', '1', '0', 'M', '1', '1', '', 'monitor', 'admin', '2024-09-17 00:16:08', 'admin', '2024-10-02 18:02:47', '系统监控目录');
INSERT INTO `sys_menu` VALUES ('3', '系统工具', '0', '3', 'tool', null, '', '', '1', '0', 'M', '0', '0', '', 'tool', 'admin', '2024-09-17 00:16:08', '', null, '系统工具目录');
INSERT INTO `sys_menu` VALUES ('100', '用户管理', '1', '1', 'user', 'system/user/index', '', '', '1', '0', 'C', '0', '0', 'system:user:list', 'user', 'admin', '2024-09-17 00:16:08', '', null, '用户管理菜单');
INSERT INTO `sys_menu` VALUES ('101', '角色管理', '1', '2', 'role', 'system/role/index', '', '', '1', '0', 'C', '1', '1', 'system:role:list', 'peoples', 'admin', '2024-09-17 00:16:08', 'admin', '2024-10-02 18:01:59', '角色管理菜单');
INSERT INTO `sys_menu` VALUES ('102', '菜单管理', '1', '3', 'menu', 'system/menu/index', '', '', '1', '0', 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2024-09-17 00:16:08', '', null, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES ('103', '专业管理', '1', '4', 'dept', 'system/dept/index', '', '', '1', '0', 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2024-09-17 00:16:08', 'admin', '2024-10-02 18:02:11', '部门管理菜单');
INSERT INTO `sys_menu` VALUES ('104', '岗位管理', '1', '5', 'post', 'system/post/index', '', '', '1', '0', 'C', '1', '1', 'system:post:list', 'post', 'admin', '2024-09-17 00:16:08', 'admin', '2024-10-02 18:02:20', '岗位管理菜单');
INSERT INTO `sys_menu` VALUES ('105', '字典管理', '1', '6', 'dict', 'system/dict/index', '', '', '1', '0', 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2024-09-17 00:16:08', '', null, '字典管理菜单');
INSERT INTO `sys_menu` VALUES ('106', '参数设置', '1', '7', 'config', 'system/config/index', '', '', '1', '0', 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2024-09-17 00:16:08', '', null, '参数设置菜单');
INSERT INTO `sys_menu` VALUES ('107', '通知公告', '1', '8', 'notice', 'system/notice/index', '', '', '1', '0', 'C', '1', '1', 'system:notice:list', 'message', 'admin', '2024-09-17 00:16:08', 'admin', '2024-10-02 18:02:35', '通知公告菜单');
INSERT INTO `sys_menu` VALUES ('108', '日志管理', '1', '9', 'log', '', '', '', '1', '0', 'M', '1', '1', '', 'log', 'admin', '2024-09-17 00:16:08', 'admin', '2024-10-02 18:02:40', '日志管理菜单');
INSERT INTO `sys_menu` VALUES ('109', '在线用户', '2', '1', 'online', 'monitor/online/index', '', '', '1', '0', 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2024-09-17 00:16:08', '', null, '在线用户菜单');
INSERT INTO `sys_menu` VALUES ('110', '定时任务', '2', '2', 'job', 'monitor/job/index', '', '', '1', '0', 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2024-09-17 00:16:08', '', null, '定时任务菜单');
INSERT INTO `sys_menu` VALUES ('111', '数据监控', '2', '3', 'druid', 'monitor/druid/index', '', '', '1', '0', 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2024-09-17 00:16:08', '', null, '数据监控菜单');
INSERT INTO `sys_menu` VALUES ('112', '服务监控', '2', '4', 'server', 'monitor/server/index', '', '', '1', '0', 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2024-09-17 00:16:08', '', null, '服务监控菜单');
INSERT INTO `sys_menu` VALUES ('113', '缓存监控', '2', '5', 'cache', 'monitor/cache/index', '', '', '1', '0', 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2024-09-17 00:16:08', '', null, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES ('114', '缓存列表', '2', '6', 'cacheList', 'monitor/cache/list', '', '', '1', '0', 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2024-09-17 00:16:08', '', null, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES ('115', '表单构建', '3', '1', 'build', 'tool/build/index', '', '', '1', '0', 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2024-09-17 00:16:08', '', null, '表单构建菜单');
INSERT INTO `sys_menu` VALUES ('116', '代码生成', '3', '2', 'gen', 'tool/gen/index', '', '', '1', '0', 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2024-09-17 00:16:08', '', null, '代码生成菜单');
INSERT INTO `sys_menu` VALUES ('117', '系统接口', '3', '3', 'swagger', 'tool/swagger/index', '', '', '1', '0', 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2024-09-17 00:16:08', '', null, '系统接口菜单');
INSERT INTO `sys_menu` VALUES ('500', '操作日志', '108', '1', 'operlog', 'monitor/operlog/index', '', '', '1', '0', 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2024-09-17 00:16:08', '', null, '操作日志菜单');
INSERT INTO `sys_menu` VALUES ('501', '登录日志', '108', '2', 'logininfor', 'monitor/logininfor/index', '', '', '1', '0', 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2024-09-17 00:16:08', '', null, '登录日志菜单');
INSERT INTO `sys_menu` VALUES ('1000', '用户查询', '100', '1', '', '', '', '', '1', '0', 'F', '0', '0', 'system:user:query', '#', 'admin', '2024-09-17 00:16:08', '', null, '');
INSERT INTO `sys_menu` VALUES ('1001', '用户新增', '100', '2', '', '', '', '', '1', '0', 'F', '0', '0', 'system:user:add', '#', 'admin', '2024-09-17 00:16:08', '', null, '');
INSERT INTO `sys_menu` VALUES ('1002', '用户修改', '100', '3', '', '', '', '', '1', '0', 'F', '0', '0', 'system:user:edit', '#', 'admin', '2024-09-17 00:16:08', '', null, '');
INSERT INTO `sys_menu` VALUES ('1003', '用户删除', '100', '4', '', '', '', '', '1', '0', 'F', '0', '0', 'system:user:remove', '#', 'admin', '2024-09-17 00:16:08', '', null, '');
INSERT INTO `sys_menu` VALUES ('1004', '用户导出', '100', '5', '', '', '', '', '1', '0', 'F', '0', '0', 'system:user:export', '#', 'admin', '2024-09-17 00:16:08', '', null, '');
INSERT INTO `sys_menu` VALUES ('1005', '用户导入', '100', '6', '', '', '', '', '1', '0', 'F', '0', '0', 'system:user:import', '#', 'admin', '2024-09-17 00:16:08', '', null, '');
INSERT INTO `sys_menu` VALUES ('1006', '重置密码', '100', '7', '', '', '', '', '1', '0', 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2024-09-17 00:16:08', '', null, '');
INSERT INTO `sys_menu` VALUES ('1007', '角色查询', '101', '1', '', '', '', '', '1', '0', 'F', '0', '0', 'system:role:query', '#', 'admin', '2024-09-17 00:16:08', '', null, '');
INSERT INTO `sys_menu` VALUES ('1008', '角色新增', '101', '2', '', '', '', '', '1', '0', 'F', '0', '0', 'system:role:add', '#', 'admin', '2024-09-17 00:16:08', '', null, '');
INSERT INTO `sys_menu` VALUES ('1009', '角色修改', '101', '3', '', '', '', '', '1', '0', 'F', '0', '0', 'system:role:edit', '#', 'admin', '2024-09-17 00:16:08', '', null, '');
INSERT INTO `sys_menu` VALUES ('1010', '角色删除', '101', '4', '', '', '', '', '1', '0', 'F', '0', '0', 'system:role:remove', '#', 'admin', '2024-09-17 00:16:08', '', null, '');
INSERT INTO `sys_menu` VALUES ('1011', '角色导出', '101', '5', '', '', '', '', '1', '0', 'F', '0', '0', 'system:role:export', '#', 'admin', '2024-09-17 00:16:08', '', null, '');
INSERT INTO `sys_menu` VALUES ('1012', '菜单查询', '102', '1', '', '', '', '', '1', '0', 'F', '0', '0', 'system:menu:query', '#', 'admin', '2024-09-17 00:16:08', '', null, '');
INSERT INTO `sys_menu` VALUES ('1013', '菜单新增', '102', '2', '', '', '', '', '1', '0', 'F', '0', '0', 'system:menu:add', '#', 'admin', '2024-09-17 00:16:08', '', null, '');
INSERT INTO `sys_menu` VALUES ('1014', '菜单修改', '102', '3', '', '', '', '', '1', '0', 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2024-09-17 00:16:08', '', null, '');
INSERT INTO `sys_menu` VALUES ('1015', '菜单删除', '102', '4', '', '', '', '', '1', '0', 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2024-09-17 00:16:08', '', null, '');
INSERT INTO `sys_menu` VALUES ('1016', '部门查询', '103', '1', '', '', '', '', '1', '0', 'F', '0', '0', 'system:dept:query', '#', 'admin', '2024-09-17 00:16:08', '', null, '');
INSERT INTO `sys_menu` VALUES ('1017', '部门新增', '103', '2', '', '', '', '', '1', '0', 'F', '0', '0', 'system:dept:add', '#', 'admin', '2024-09-17 00:16:08', '', null, '');
INSERT INTO `sys_menu` VALUES ('1018', '部门修改', '103', '3', '', '', '', '', '1', '0', 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2024-09-17 00:16:08', '', null, '');
INSERT INTO `sys_menu` VALUES ('1019', '部门删除', '103', '4', '', '', '', '', '1', '0', 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2024-09-17 00:16:08', '', null, '');
INSERT INTO `sys_menu` VALUES ('1020', '岗位查询', '104', '1', '', '', '', '', '1', '0', 'F', '0', '0', 'system:post:query', '#', 'admin', '2024-09-17 00:16:08', '', null, '');
INSERT INTO `sys_menu` VALUES ('1021', '岗位新增', '104', '2', '', '', '', '', '1', '0', 'F', '0', '0', 'system:post:add', '#', 'admin', '2024-09-17 00:16:08', '', null, '');
INSERT INTO `sys_menu` VALUES ('1022', '岗位修改', '104', '3', '', '', '', '', '1', '0', 'F', '0', '0', 'system:post:edit', '#', 'admin', '2024-09-17 00:16:08', '', null, '');
INSERT INTO `sys_menu` VALUES ('1023', '岗位删除', '104', '4', '', '', '', '', '1', '0', 'F', '0', '0', 'system:post:remove', '#', 'admin', '2024-09-17 00:16:08', '', null, '');
INSERT INTO `sys_menu` VALUES ('1024', '岗位导出', '104', '5', '', '', '', '', '1', '0', 'F', '0', '0', 'system:post:export', '#', 'admin', '2024-09-17 00:16:08', '', null, '');
INSERT INTO `sys_menu` VALUES ('1025', '字典查询', '105', '1', '#', '', '', '', '1', '0', 'F', '0', '0', 'system:dict:query', '#', 'admin', '2024-09-17 00:16:08', '', null, '');
INSERT INTO `sys_menu` VALUES ('1026', '字典新增', '105', '2', '#', '', '', '', '1', '0', 'F', '0', '0', 'system:dict:add', '#', 'admin', '2024-09-17 00:16:08', '', null, '');
INSERT INTO `sys_menu` VALUES ('1027', '字典修改', '105', '3', '#', '', '', '', '1', '0', 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2024-09-17 00:16:08', '', null, '');
INSERT INTO `sys_menu` VALUES ('1028', '字典删除', '105', '4', '#', '', '', '', '1', '0', 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2024-09-17 00:16:08', '', null, '');
INSERT INTO `sys_menu` VALUES ('1029', '字典导出', '105', '5', '#', '', '', '', '1', '0', 'F', '0', '0', 'system:dict:export', '#', 'admin', '2024-09-17 00:16:08', '', null, '');
INSERT INTO `sys_menu` VALUES ('1030', '参数查询', '106', '1', '#', '', '', '', '1', '0', 'F', '0', '0', 'system:config:query', '#', 'admin', '2024-09-17 00:16:08', '', null, '');
INSERT INTO `sys_menu` VALUES ('1031', '参数新增', '106', '2', '#', '', '', '', '1', '0', 'F', '0', '0', 'system:config:add', '#', 'admin', '2024-09-17 00:16:08', '', null, '');
INSERT INTO `sys_menu` VALUES ('1032', '参数修改', '106', '3', '#', '', '', '', '1', '0', 'F', '0', '0', 'system:config:edit', '#', 'admin', '2024-09-17 00:16:08', '', null, '');
INSERT INTO `sys_menu` VALUES ('1033', '参数删除', '106', '4', '#', '', '', '', '1', '0', 'F', '0', '0', 'system:config:remove', '#', 'admin', '2024-09-17 00:16:08', '', null, '');
INSERT INTO `sys_menu` VALUES ('1034', '参数导出', '106', '5', '#', '', '', '', '1', '0', 'F', '0', '0', 'system:config:export', '#', 'admin', '2024-09-17 00:16:08', '', null, '');
INSERT INTO `sys_menu` VALUES ('1035', '公告查询', '107', '1', '#', '', '', '', '1', '0', 'F', '0', '0', 'system:notice:query', '#', 'admin', '2024-09-17 00:16:08', '', null, '');
INSERT INTO `sys_menu` VALUES ('1036', '公告新增', '107', '2', '#', '', '', '', '1', '0', 'F', '0', '0', 'system:notice:add', '#', 'admin', '2024-09-17 00:16:08', '', null, '');
INSERT INTO `sys_menu` VALUES ('1037', '公告修改', '107', '3', '#', '', '', '', '1', '0', 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2024-09-17 00:16:08', '', null, '');
INSERT INTO `sys_menu` VALUES ('1038', '公告删除', '107', '4', '#', '', '', '', '1', '0', 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2024-09-17 00:16:08', '', null, '');
INSERT INTO `sys_menu` VALUES ('1039', '操作查询', '500', '1', '#', '', '', '', '1', '0', 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2024-09-17 00:16:08', '', null, '');
INSERT INTO `sys_menu` VALUES ('1040', '操作删除', '500', '2', '#', '', '', '', '1', '0', 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2024-09-17 00:16:08', '', null, '');
INSERT INTO `sys_menu` VALUES ('1041', '日志导出', '500', '3', '#', '', '', '', '1', '0', 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2024-09-17 00:16:08', '', null, '');
INSERT INTO `sys_menu` VALUES ('1042', '登录查询', '501', '1', '#', '', '', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2024-09-17 00:16:08', '', null, '');
INSERT INTO `sys_menu` VALUES ('1043', '登录删除', '501', '2', '#', '', '', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2024-09-17 00:16:08', '', null, '');
INSERT INTO `sys_menu` VALUES ('1044', '日志导出', '501', '3', '#', '', '', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2024-09-17 00:16:08', '', null, '');
INSERT INTO `sys_menu` VALUES ('1045', '账户解锁', '501', '4', '#', '', '', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2024-09-17 00:16:08', '', null, '');
INSERT INTO `sys_menu` VALUES ('1046', '在线查询', '109', '1', '#', '', '', '', '1', '0', 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2024-09-17 00:16:08', '', null, '');
INSERT INTO `sys_menu` VALUES ('1047', '批量强退', '109', '2', '#', '', '', '', '1', '0', 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2024-09-17 00:16:08', '', null, '');
INSERT INTO `sys_menu` VALUES ('1048', '单条强退', '109', '3', '#', '', '', '', '1', '0', 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2024-09-17 00:16:08', '', null, '');
INSERT INTO `sys_menu` VALUES ('1049', '任务查询', '110', '1', '#', '', '', '', '1', '0', 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2024-09-17 00:16:08', '', null, '');
INSERT INTO `sys_menu` VALUES ('1050', '任务新增', '110', '2', '#', '', '', '', '1', '0', 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2024-09-17 00:16:08', '', null, '');
INSERT INTO `sys_menu` VALUES ('1051', '任务修改', '110', '3', '#', '', '', '', '1', '0', 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2024-09-17 00:16:08', '', null, '');
INSERT INTO `sys_menu` VALUES ('1052', '任务删除', '110', '4', '#', '', '', '', '1', '0', 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2024-09-17 00:16:08', '', null, '');
INSERT INTO `sys_menu` VALUES ('1053', '状态修改', '110', '5', '#', '', '', '', '1', '0', 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2024-09-17 00:16:08', '', null, '');
INSERT INTO `sys_menu` VALUES ('1054', '任务导出', '110', '6', '#', '', '', '', '1', '0', 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2024-09-17 00:16:08', '', null, '');
INSERT INTO `sys_menu` VALUES ('1055', '生成查询', '116', '1', '#', '', '', '', '1', '0', 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2024-09-17 00:16:08', '', null, '');
INSERT INTO `sys_menu` VALUES ('1056', '生成修改', '116', '2', '#', '', '', '', '1', '0', 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2024-09-17 00:16:08', '', null, '');
INSERT INTO `sys_menu` VALUES ('1057', '生成删除', '116', '3', '#', '', '', '', '1', '0', 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2024-09-17 00:16:08', '', null, '');
INSERT INTO `sys_menu` VALUES ('1058', '导入代码', '116', '4', '#', '', '', '', '1', '0', 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2024-09-17 00:16:08', '', null, '');
INSERT INTO `sys_menu` VALUES ('1059', '预览代码', '116', '5', '#', '', '', '', '1', '0', 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2024-09-17 00:16:08', '', null, '');
INSERT INTO `sys_menu` VALUES ('1060', '生成代码', '116', '6', '#', '', '', '', '1', '0', 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2024-09-17 00:16:08', '', null, '');
INSERT INTO `sys_menu` VALUES ('2005', '平台管理', '0', '1', 'jiaoliu', null, null, '', '1', '0', 'M', '0', '0', null, 'list', 'admin', '2024-10-02 18:04:00', '', null, '');
INSERT INTO `sys_menu` VALUES ('2006', '轮播图', '2005', '1', 'rotationmap', 'system/Rotationmap/index', '', '', '1', '0', 'C', '0', '0', 'system:Rotationmap:list', '#', 'admin', '2024-10-04 18:58:58', 'admin', '2024-10-04 19:00:47', '');
INSERT INTO `sys_menu` VALUES ('2007', '项目管理', '2005', '1', 'content', 'system/content/index', null, '', '1', '0', 'C', '0', '0', 'system:content:list', '#', 'admin', '2024-10-04 20:11:49', '', null, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) COLLATE utf8_unicode_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci COMMENT='通知公告表';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES ('1', '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2024-09-17 00:16:08', '', null, '管理员');
INSERT INTO `sys_notice` VALUES ('2', '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2024-09-17 00:16:08', '', null, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '模块标题',
  `business_type` int DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(200) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '请求方式',
  `operator_type` int DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '返回参数',
  `status` int DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint DEFAULT '0' COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`),
  KEY `idx_sys_oper_log_bt` (`business_type`),
  KEY `idx_sys_oper_log_s` (`status`),
  KEY `idx_sys_oper_log_ot` (`oper_time`)
) ENGINE=InnoDB AUTO_INCREMENT=206 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci COMMENT='操作日志记录';

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES ('100', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', '研发部门', '/system/menu/4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', '0', null, '2024-09-17 00:25:06', '11');
INSERT INTO `sys_oper_log` VALUES ('101', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-09-17 00:16:08\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":4,\"menuName\":\"若依官网\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"path\":\"http://ruoyi.vip\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-09-17 00:25:17', '12');
INSERT INTO `sys_oper_log` VALUES ('102', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', '研发部门', '/system/menu/4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', '0', null, '2024-09-17 00:25:19', '5');
INSERT INTO `sys_oper_log` VALUES ('103', '代码生成', '6', 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"sys_topimg\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-09-18 08:49:08', '72');
INSERT INTO `sys_oper_log` VALUES ('104', '代码生成', '6', 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"sys_reginfo,sys_remip\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-09-18 08:49:18', '63');
INSERT INTO `sys_oper_log` VALUES ('105', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"topimg\",\"className\":\"SysTopimg\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-09-18 08:49:08\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ImgUrl\",\"columnComment\":\"图片路径\",\"columnId\":2,\"columnName\":\"img_url\",\"columnType\":\"varchar(200)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-18 08:49:08\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"imageUpload\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"imgUrl\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Title\",\"columnComment\":\"标题\",\"columnId\":3,\"columnName\":\"title\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-18 08:49:08\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"title\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateBy\",\"columnComment\":\"创建者\",\"columnId\":4,\"columnName\":\"create_by\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-18 08:49:08\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"createBy\",\"javaType\":\"String\",\"list\":false,\"params\"', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-09-18 08:50:44', '27');
INSERT INTO `sys_oper_log` VALUES ('106', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"reginfo\",\"className\":\"SysReginfo\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":11,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-09-18 08:49:18\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ImgUrl\",\"columnComment\":\"图片路径\",\"columnId\":12,\"columnName\":\"img_url\",\"columnType\":\"varchar(200)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-18 08:49:18\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"imageUpload\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"imgUrl\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Title\",\"columnComment\":\"标题\",\"columnId\":13,\"columnName\":\"title\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-18 08:49:18\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"title\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"作者\",\"columnId\":14,\"columnName\":\"name\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-18 08:49:18\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\"', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-09-18 08:53:34', '32');
INSERT INTO `sys_oper_log` VALUES ('107', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"remip\",\"className\":\"SysRemip\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":24,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-09-18 08:49:18\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ImgUrl\",\"columnComment\":\"图片路径\",\"columnId\":25,\"columnName\":\"img_url\",\"columnType\":\"varchar(200)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-18 08:49:18\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"imageUpload\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"imgUrl\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Title\",\"columnComment\":\"标题\",\"columnId\":26,\"columnName\":\"title\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-18 08:49:18\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"title\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateBy\",\"columnComment\":\"创建者\",\"columnId\":27,\"columnName\":\"create_by\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-18 08:49:18\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"createBy\",\"javaType\":\"String\",\"list\":false,\"par', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-09-18 08:56:01', '21');
INSERT INTO `sys_oper_log` VALUES ('108', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"topimg\",\"className\":\"SysTopimg\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-09-18 08:49:08\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-09-18 08:50:44\",\"usableColumn\":false},{\"capJavaField\":\"ImgUrl\",\"columnComment\":\"图片路径\",\"columnId\":2,\"columnName\":\"img_url\",\"columnType\":\"varchar(200)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-18 08:49:08\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"imageUpload\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"imgUrl\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-09-18 08:50:44\",\"usableColumn\":false},{\"capJavaField\":\"Title\",\"columnComment\":\"标题\",\"columnId\":3,\"columnName\":\"title\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-18 08:49:08\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"title\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-09-18 08:50:44\",\"usableColumn\":false},{\"capJavaField\":\"CreateBy\",\"columnComment\":\"创建者\",\"columnId\":4,\"columnName\":\"create_by\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-18 08:49:08\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-09-18 08:56:07', '20');
INSERT INTO `sys_oper_log` VALUES ('109', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"reginfo\",\"className\":\"SysReginfo\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":11,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-09-18 08:49:18\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-09-18 08:53:34\",\"usableColumn\":false},{\"capJavaField\":\"ImgUrl\",\"columnComment\":\"图片路径\",\"columnId\":12,\"columnName\":\"img_url\",\"columnType\":\"varchar(200)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-18 08:49:18\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"imageUpload\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"imgUrl\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-09-18 08:53:34\",\"usableColumn\":false},{\"capJavaField\":\"Title\",\"columnComment\":\"标题\",\"columnId\":13,\"columnName\":\"title\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-18 08:49:18\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"title\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-09-18 08:53:34\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"作者\",\"columnId\":14,\"columnName\":\"name\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-18 08:49:18\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncreme', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-09-18 08:56:14', '27');
INSERT INTO `sys_oper_log` VALUES ('110', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"remip\",\"className\":\"SysRemip\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":24,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-09-18 08:49:18\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-09-18 08:56:01\",\"usableColumn\":false},{\"capJavaField\":\"ImgUrl\",\"columnComment\":\"图片路径\",\"columnId\":25,\"columnName\":\"img_url\",\"columnType\":\"varchar(200)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-18 08:49:18\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"imageUpload\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"imgUrl\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-09-18 08:56:01\",\"usableColumn\":false},{\"capJavaField\":\"Title\",\"columnComment\":\"标题\",\"columnId\":26,\"columnName\":\"title\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-18 08:49:18\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"title\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-09-18 08:56:01\",\"usableColumn\":false},{\"capJavaField\":\"CreateBy\",\"columnComment\":\"创建者\",\"columnId\":27,\"columnName\":\"create_by\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-18 08:49:18\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-09-18 08:56:19', '21');
INSERT INTO `sys_oper_log` VALUES ('111', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_topimg\"}', null, '0', null, '2024-09-18 08:56:22', '55');
INSERT INTO `sys_oper_log` VALUES ('112', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_reginfo\"}', null, '0', null, '2024-09-18 08:59:57', '53');
INSERT INTO `sys_oper_log` VALUES ('113', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_remip\"}', null, '0', null, '2024-09-18 09:02:03', '50');
INSERT INTO `sys_oper_log` VALUES ('114', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"wechat\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"谷子圈\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"guziquan\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-09-18 09:07:15', '23');
INSERT INTO `sys_oper_log` VALUES ('115', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/topimg/index\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"头部图片管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"topimg\",\"perms\":\"system:topimg:list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-09-18 09:09:19', '10');
INSERT INTO `sys_oper_log` VALUES ('116', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/remip/index\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"热门IP管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2000,\"path\":\"remip\",\"perms\":\"system:remip:list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-09-18 09:10:29', '7');
INSERT INTO `sys_oper_log` VALUES ('117', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/reginfo/index\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"最新热谷信息\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2000,\"path\":\"reginfo\",\"perms\":\"system:reginfo:list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-09-18 09:11:34', '12');
INSERT INTO `sys_oper_log` VALUES ('118', '头部图片', '1', 'com.ruoyi.system.controller.SysTopimgController.add()', 'POST', '1', 'admin', '研发部门', '/system/topimg', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-09-18 09:27:01\",\"extend1\":\"1\",\"id\":100,\"imgUrl\":\"/profile/upload/2024/09/18/t049d6ac4f6753f10c4_20240918092654A001.jpg\",\"params\":{},\"title\":\"测试1\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-09-18 09:27:01', '22');
INSERT INTO `sys_oper_log` VALUES ('119', '头部图片', '1', 'com.ruoyi.system.controller.SysTopimgController.add()', 'POST', '1', 'admin', '研发部门', '/system/topimg', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-09-18 09:27:17\",\"extend1\":\"2\",\"id\":101,\"imgUrl\":\"/profile/upload/2024/09/18/t016b562cfd7904cbd1_20240918092716A003.jpg\",\"params\":{},\"title\":\"测试2\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-09-18 09:27:17', '15');
INSERT INTO `sys_oper_log` VALUES ('120', '头部图片', '1', 'com.ruoyi.system.controller.SysTopimgController.add()', 'POST', '1', 'admin', '研发部门', '/system/topimg', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-09-18 09:27:25\",\"extend1\":\"3\",\"id\":102,\"imgUrl\":\"/profile/upload/2024/09/18/t016d73e1922d926257_20240918092724A004.jpg\",\"params\":{},\"title\":\"测试3\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-09-18 09:27:25', '6');
INSERT INTO `sys_oper_log` VALUES ('121', '头部图片', '1', 'com.ruoyi.system.controller.SysTopimgController.add()', 'POST', '1', 'admin', '研发部门', '/system/topimg', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-09-18 09:27:37\",\"extend1\":\"4\",\"id\":103,\"imgUrl\":\"/profile/upload/2024/09/18/t045a3fc9366567d918_20240918092731A005.jpg\",\"params\":{},\"title\":\"测试4\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-09-18 09:27:37', '7');
INSERT INTO `sys_oper_log` VALUES ('122', '热门ip', '1', 'com.ruoyi.system.controller.SysRemipController.add()', 'POST', '1', 'admin', '研发部门', '/system/remip', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-09-18 10:21:46\",\"id\":100,\"imgUrl\":\"/profile/upload/2024/09/18/t016b562cfd7904cbd1_20240918102145A001.jpg\",\"params\":{},\"title\":\"测试1\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-09-18 10:21:46', '14');
INSERT INTO `sys_oper_log` VALUES ('123', '热门ip', '1', 'com.ruoyi.system.controller.SysRemipController.add()', 'POST', '1', 'admin', '研发部门', '/system/remip', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-09-18 10:21:51\",\"id\":101,\"params\":{},\"title\":\"测试2\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-09-18 10:21:51', '6');
INSERT INTO `sys_oper_log` VALUES ('124', '热门ip', '3', 'com.ruoyi.system.controller.SysRemipController.remove()', 'DELETE', '1', 'admin', '研发部门', '/system/remip/101', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-09-18 10:21:58', '12');
INSERT INTO `sys_oper_log` VALUES ('125', '热门ip', '1', 'com.ruoyi.system.controller.SysRemipController.add()', 'POST', '1', 'admin', '研发部门', '/system/remip', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-09-18 10:22:05\",\"id\":102,\"imgUrl\":\"/profile/upload/2024/09/18/t016d73e1922d926257_20240918102203A002.jpg\",\"params\":{},\"title\":\"测试2\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-09-18 10:22:05', '5');
INSERT INTO `sys_oper_log` VALUES ('126', '热门ip', '1', 'com.ruoyi.system.controller.SysRemipController.add()', 'POST', '1', 'admin', '研发部门', '/system/remip', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-09-18 10:22:14\",\"id\":103,\"imgUrl\":\"/profile/upload/2024/09/18/t045a3fc9366567d918_20240918102213A003.jpg\",\"params\":{},\"title\":\"测试3\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-09-18 10:22:14', '6');
INSERT INTO `sys_oper_log` VALUES ('127', '热门ip', '1', 'com.ruoyi.system.controller.SysRemipController.add()', 'POST', '1', 'admin', '研发部门', '/system/remip', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-09-18 10:22:20\",\"id\":104,\"imgUrl\":\"/profile/upload/2024/09/18/t049d6ac4f6753f10c4_20240918102219A004.jpg\",\"params\":{},\"title\":\"测试4\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-09-18 10:22:20', '5');
INSERT INTO `sys_oper_log` VALUES ('128', '热门ip', '1', 'com.ruoyi.system.controller.SysRemipController.add()', 'POST', '1', 'admin', '研发部门', '/system/remip', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-09-18 10:22:27\",\"id\":105,\"imgUrl\":\"/profile/upload/2024/09/18/t0102af9d75e5267053_20240918102224A005.jpg\",\"params\":{},\"title\":\"测试5\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-09-18 10:22:27', '7');
INSERT INTO `sys_oper_log` VALUES ('129', '热门ip', '1', 'com.ruoyi.system.controller.SysRemipController.add()', 'POST', '1', 'admin', '研发部门', '/system/remip', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-09-18 10:22:40\",\"id\":106,\"imgUrl\":\"/profile/upload/2024/09/18/t04891b1fded44dd4fe_20240918102237A007.jpg\",\"params\":{},\"title\":\"测试6\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-09-18 10:22:40', '5');
INSERT INTO `sys_oper_log` VALUES ('130', '热门ip', '1', 'com.ruoyi.system.controller.SysRemipController.add()', 'POST', '1', 'admin', '研发部门', '/system/remip', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-09-18 10:22:48\",\"id\":107,\"imgUrl\":\"/profile/upload/2024/09/18/t016b562cfd7904cbd1_20240918102245A008.jpg\",\"params\":{},\"title\":\"测试7\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-09-18 10:22:48', '5');
INSERT INTO `sys_oper_log` VALUES ('131', '最新热谷信息', '1', 'com.ruoyi.system.controller.SysReginfoController.add()', 'POST', '1', 'admin', '研发部门', '/system/reginfo', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-09-18 10:26:51\",\"id\":100,\"imgUrl\":\"/profile/upload/2024/09/18/t016b562cfd7904cbd1_20240918102620A009.jpg\",\"name\":\"Tr\",\"params\":{},\"shicj\":\"18\",\"shoufj\":\"5\",\"title\":\"测试1\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-09-18 10:26:51', '8');
INSERT INTO `sys_oper_log` VALUES ('132', '最新热谷信息', '1', 'com.ruoyi.system.controller.SysReginfoController.add()', 'POST', '1', 'admin', '研发部门', '/system/reginfo', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-09-18 10:27:15\",\"id\":101,\"imgUrl\":\"/profile/upload/2024/09/18/t016d73e1922d926257_20240918102704A010.jpg\",\"name\":\"测试2\",\"params\":{},\"shicj\":\"16\",\"shoufj\":\"10\",\"title\":\"测试2\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-09-18 10:27:15', '4');
INSERT INTO `sys_oper_log` VALUES ('133', '最新热谷信息', '1', 'com.ruoyi.system.controller.SysReginfoController.add()', 'POST', '1', 'admin', '研发部门', '/system/reginfo', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-09-18 10:27:30\",\"id\":102,\"imgUrl\":\"/profile/upload/2024/09/18/t0102af9d75e5267053_20240918102719A011.jpg\",\"name\":\"测试3\",\"params\":{},\"shicj\":\"18\",\"shoufj\":\"6\",\"title\":\"测试3\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-09-18 10:27:30', '7');
INSERT INTO `sys_oper_log` VALUES ('134', '用户头像', '2', 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', '1', 'admin', '研发部门', '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2024/09/18/avatar_20240918110220A001.png\",\"code\":200}', '0', null, '2024-09-18 11:02:20', '36');
INSERT INTO `sys_oper_log` VALUES ('135', '用户头像', '2', 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', '1', 'admin', '研发部门', '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2024/09/18/t016b562cfd7904cbd1_20240918110320A002.jpg\",\"code\":200}', '0', null, '2024-09-18 11:03:20', '9');
INSERT INTO `sys_oper_log` VALUES ('136', '代码生成', '6', 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"sys_feedback\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-09-18 13:44:04', '71');
INSERT INTO `sys_oper_log` VALUES ('137', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"feedback\",\"className\":\"SysFeedback\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":34,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-09-18 13:44:04\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ImgUrl\",\"columnComment\":\"图片路径\",\"columnId\":35,\"columnName\":\"img_url\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-18 13:44:04\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"imageUpload\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"imgUrl\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Content\",\"columnComment\":\"描述\",\"columnId\":36,\"columnName\":\"content\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-18 13:44:04\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"editor\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"content\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateBy\",\"columnComment\":\"创建者\",\"columnId\":37,\"columnName\":\"create_by\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-18 13:44:04\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"createBy\",\"javaType\":\"String\",\"list\":', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-09-18 13:45:10', '28');
INSERT INTO `sys_oper_log` VALUES ('138', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_feedback\"}', null, '0', null, '2024-09-18 13:45:13', '142');
INSERT INTO `sys_oper_log` VALUES ('139', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/feedback/index\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"用户反馈\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"feedback\",\"perms\":\"system:feedback:list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-09-18 13:47:50', '27');
INSERT INTO `sys_oper_log` VALUES ('140', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/feedback/index\",\"createTime\":\"2024-09-18 13:47:49\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2004,\"menuName\":\"用户反馈\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2000,\"path\":\"feedback\",\"perms\":\"system:feedback:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-09-18 13:50:47', '18');
INSERT INTO `sys_oper_log` VALUES ('141', '用户反馈', '1', 'com.ruoyi.system.controller.SysFeedbackController.add()', 'POST', '1', 'admin', '研发部门', '/system/feedback', '127.0.0.1', '内网IP', '{\"content\":\"111\",\"createTime\":\"2024-09-18 13:51:03\",\"imgUrl\":\"/profile/upload/2024/09/18/t016b562cfd7904cbd1_20240918135055A001.jpg\",\"params\":{}}', null, '1', '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'img_url\' at row 1\r\n### The error may exist in file [E:\\桌面\\小程序\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\SysFeedbackMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysFeedbackMapper.insertSysFeedback-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_feedback          ( img_url,             content,                          create_time )           values ( ?,             ?,                          ? )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'img_url\' at row 1\n; Data truncation: Data too long for column \'img_url\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'img_url\' at row 1', '2024-09-18 13:51:03', '47');
INSERT INTO `sys_oper_log` VALUES ('142', '用户反馈', '1', 'com.ruoyi.system.controller.SysFeedbackController.add()', 'POST', '1', 'admin', '研发部门', '/system/feedback', '127.0.0.1', '内网IP', '{\"content\":\"111\",\"createTime\":\"2024-09-18 13:51:16\",\"imgUrl\":\"/profile/upload/2024/09/18/t016b562cfd7904cbd1_20240918135055A001.jpg\",\"params\":{}}', null, '1', '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'img_url\' at row 1\r\n### The error may exist in file [E:\\桌面\\小程序\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\SysFeedbackMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysFeedbackMapper.insertSysFeedback-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_feedback          ( img_url,             content,                          create_time )           values ( ?,             ?,                          ? )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'img_url\' at row 1\n; Data truncation: Data too long for column \'img_url\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'img_url\' at row 1', '2024-09-18 13:51:16', '4');
INSERT INTO `sys_oper_log` VALUES ('143', '用户反馈', '1', 'com.ruoyi.system.controller.SysFeedbackController.add()', 'POST', '1', 'admin', '研发部门', '/system/feedback', '127.0.0.1', '内网IP', '{\"content\":\"111\",\"createTime\":\"2024-09-18 13:51:28\",\"id\":100,\"imgUrl\":\"/profile/upload/2024/09/18/t016b562cfd7904cbd1_20240918135055A001.jpg\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-09-18 13:51:28', '10');
INSERT INTO `sys_oper_log` VALUES ('144', '用户反馈', '3', 'com.ruoyi.system.controller.SysFeedbackController.remove()', 'DELETE', '1', 'admin', '研发部门', '/system/feedback/100,101,102,103,104,105,106,107,108', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-09-18 13:59:33', '15');
INSERT INTO `sys_oper_log` VALUES ('145', '用户反馈', '3', 'com.ruoyi.system.controller.SysFeedbackController.remove()', 'DELETE', '1', 'admin', '研发部门', '/system/feedback/109,110,111,112,113,114', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-09-18 14:14:35', '17');
INSERT INTO `sys_oper_log` VALUES ('146', '用户反馈', '3', 'com.ruoyi.system.controller.SysFeedbackController.remove()', 'DELETE', '1', 'admin', '研发部门', '/system/feedback/115', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-09-18 20:32:30', '12');
INSERT INTO `sys_oper_log` VALUES ('147', '用户反馈', '3', 'com.ruoyi.system.controller.SysFeedbackController.remove()', 'DELETE', '1', 'admin', '研发部门', '/system/feedback/116', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-09-18 20:32:32', '6');
INSERT INTO `sys_oper_log` VALUES ('148', '最新热谷信息', '1', 'com.ruoyi.system.controller.SysReginfoController.add()', 'POST', '1', 'admin', '研发部门', '/system/reginfo', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-09-18 20:36:49\",\"id\":103,\"imgUrl\":\"/profile/upload/2024/09/18/t045a3fc9366567d918_20240918203635A002.jpg\",\"name\":\"测试111\",\"params\":{},\"shicj\":\"10\",\"shoufj\":\"5\",\"title\":\"测试111\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-09-18 20:36:50', '11');
INSERT INTO `sys_oper_log` VALUES ('149', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', '研发部门', '/system/menu/2000', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}', '0', null, '2024-10-02 17:40:02', '8');
INSERT INTO `sys_oper_log` VALUES ('150', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', '研发部门', '/system/menu/2001', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-10-02 17:40:06', '16');
INSERT INTO `sys_oper_log` VALUES ('151', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', '研发部门', '/system/menu/2002', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-10-02 17:40:08', '11');
INSERT INTO `sys_oper_log` VALUES ('152', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', '研发部门', '/system/menu/2003', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-10-02 17:40:11', '17');
INSERT INTO `sys_oper_log` VALUES ('153', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', '研发部门', '/system/menu/2004', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-10-02 17:40:13', '12');
INSERT INTO `sys_oper_log` VALUES ('154', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', '研发部门', '/system/menu/2000', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-10-02 17:40:15', '9');
INSERT INTO `sys_oper_log` VALUES ('155', '部门管理', '1', 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', '1', 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\",1\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"计算机\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-10-02 17:56:19', '16');
INSERT INTO `sys_oper_log` VALUES ('156', '部门管理', '1', 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', '1', 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\",1\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"会计\",\"orderNum\":2,\"params\":{},\"parentId\":1,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-10-02 17:56:28', '12');
INSERT INTO `sys_oper_log` VALUES ('157', '用户管理', '2', 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', '1', 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-09-17 00:16:08\",\"delFlag\":\"0\",\"dept\":{\"children\":[],\"deptId\":105,\"params\":{}},\"deptId\":200,\"email\":\"ry@qq.com\",\"loginDate\":\"2024-09-17 00:16:08\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[2],\"remark\":\"测试员\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"ry\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-10-02 17:59:56', '42');
INSERT INTO `sys_oper_log` VALUES ('158', '用户管理', '1', 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', '1', 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":200,\"nickName\":\"11\",\"params\":{},\"phonenumber\":\"17699999999\",\"postIds\":[],\"roleIds\":[],\"status\":\"0\",\"userId\":100,\"userName\":\"22\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-10-02 18:01:14', '78');
INSERT INTO `sys_oper_log` VALUES ('159', '用户管理', '2', 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', '1', 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-10-02 18:01:14\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\",1\",\"children\":[],\"deptId\":200,\"deptName\":\"计算机\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"status\":\"0\"},\"deptId\":201,\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"11\",\"params\":{},\"phonenumber\":\"17699999999\",\"postIds\":[],\"roleIds\":[],\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":100,\"userName\":\"22\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-10-02 18:01:30', '18');
INSERT INTO `sys_oper_log` VALUES ('160', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/role/index\",\"createTime\":\"2024-09-17 00:16:08\",\"icon\":\"peoples\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":101,\"menuName\":\"角色管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":1,\"path\":\"role\",\"perms\":\"system:role:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-10-02 18:01:59', '10');
INSERT INTO `sys_oper_log` VALUES ('161', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/dept/index\",\"createTime\":\"2024-09-17 00:16:08\",\"icon\":\"tree\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":103,\"menuName\":\"专业管理\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":1,\"path\":\"dept\",\"perms\":\"system:dept:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-10-02 18:02:11', '10');
INSERT INTO `sys_oper_log` VALUES ('162', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/post/index\",\"createTime\":\"2024-09-17 00:16:08\",\"icon\":\"post\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":104,\"menuName\":\"岗位管理\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":1,\"path\":\"post\",\"perms\":\"system:post:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-10-02 18:02:20', '9');
INSERT INTO `sys_oper_log` VALUES ('163', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/notice/index\",\"createTime\":\"2024-09-17 00:16:08\",\"icon\":\"message\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":107,\"menuName\":\"通知公告\",\"menuType\":\"C\",\"orderNum\":8,\"params\":{},\"parentId\":1,\"path\":\"notice\",\"perms\":\"system:notice:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-10-02 18:02:35', '10');
INSERT INTO `sys_oper_log` VALUES ('164', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2024-09-17 00:16:08\",\"icon\":\"log\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":108,\"menuName\":\"日志管理\",\"menuType\":\"M\",\"orderNum\":9,\"params\":{},\"parentId\":1,\"path\":\"log\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-10-02 18:02:40', '10');
INSERT INTO `sys_oper_log` VALUES ('165', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-09-17 00:16:08\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2,\"menuName\":\"系统监控\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"monitor\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-10-02 18:02:48', '8');
INSERT INTO `sys_oper_log` VALUES ('166', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"平台管理\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"jiaoliu\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-10-02 18:04:00', '11');
INSERT INTO `sys_oper_log` VALUES ('167', '用户管理', '3', 'com.ruoyi.web.controller.system.SysUserController.remove()', 'DELETE', '1', 'admin', null, '/system/user/102', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-10-02 19:05:54', '27');
INSERT INTO `sys_oper_log` VALUES ('168', '用户管理', '3', 'com.ruoyi.web.controller.system.SysUserController.remove()', 'DELETE', '1', 'admin', null, '/system/user/100,101', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-10-02 19:07:03', '9');
INSERT INTO `sys_oper_log` VALUES ('169', '用户管理', '3', 'com.ruoyi.web.controller.system.SysUserController.remove()', 'DELETE', '1', 'admin', null, '/system/user/2', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-10-02 22:09:06', '24');
INSERT INTO `sys_oper_log` VALUES ('170', '代码生成', '6', 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', null, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"message\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-10-03 09:09:04', '48');
INSERT INTO `sys_oper_log` VALUES ('171', '字典类型', '1', 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', '1', 'admin', null, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"是否已读\",\"dictType\":\"is_read\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-10-03 09:11:03', '10');
INSERT INTO `sys_oper_log` VALUES ('172', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', '1', 'admin', null, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"是\",\"dictSort\":0,\"dictType\":\"is_read\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-10-03 09:11:29', '7');
INSERT INTO `sys_oper_log` VALUES ('173', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', '1', 'admin', null, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"否\",\"dictSort\":0,\"dictType\":\"is_read\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-10-03 09:11:38', '8');
INSERT INTO `sys_oper_log` VALUES ('174', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"message\",\"className\":\"Message\",\"columns\":[{\"capJavaField\":\"Handle\",\"columnComment\":\"主键\",\"columnId\":44,\"columnName\":\"handle\",\"columnType\":\"varchar(40)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-03 09:09:04\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"handle\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"SendUser\",\"columnComment\":\"发送人\",\"columnId\":45,\"columnName\":\"send_user\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-03 09:09:04\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"sendUser\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ReceiveUser\",\"columnComment\":\"接收人\",\"columnId\":46,\"columnName\":\"receive_user\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-03 09:09:04\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"receiveUser\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Content\",\"columnComment\":\"留言内容\",\"columnId\":47,\"columnName\":\"content\",\"columnType\":\"varchar(500)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-03 09:09:04\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"editor\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-10-03 09:12:18', '24');
INSERT INTO `sys_oper_log` VALUES ('175', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"message\",\"className\":\"Message\",\"columns\":[{\"capJavaField\":\"Handle\",\"columnComment\":\"主键\",\"columnId\":44,\"columnName\":\"handle\",\"columnType\":\"varchar(40)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-03 09:09:04\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"handle\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2024-10-03 09:12:18\",\"usableColumn\":false},{\"capJavaField\":\"SendUser\",\"columnComment\":\"发送人\",\"columnId\":45,\"columnName\":\"send_user\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-03 09:09:04\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"sendUser\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2024-10-03 09:12:18\",\"usableColumn\":false},{\"capJavaField\":\"ReceiveUser\",\"columnComment\":\"接收人\",\"columnId\":46,\"columnName\":\"receive_user\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-03 09:09:04\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"receiveUser\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2024-10-03 09:12:18\",\"usableColumn\":false},{\"capJavaField\":\"Content\",\"columnComment\":\"留言内容\",\"columnId\":47,\"columnName\":\"content\",\"columnType\":\"varchar(500)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-03 09:09:04\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"editor\",\"increment\":', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-10-03 09:12:43', '16');
INSERT INTO `sys_oper_log` VALUES ('176', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"message\"}', null, '0', null, '2024-10-03 09:12:45', '125');
INSERT INTO `sys_oper_log` VALUES ('177', '用户头像', '2', 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', '1', '111', '会计', '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2024/10/04/1727974533446_20241004005533A001.png\",\"code\":200}', '0', null, '2024-10-04 00:55:33', '42');
INSERT INTO `sys_oper_log` VALUES ('178', '用户头像', '2', 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', '1', '123', '会计', '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2024/10/04/1727974545505_20241004005545A002.png\",\"code\":200}', '0', null, '2024-10-04 00:55:45', '8');
INSERT INTO `sys_oper_log` VALUES ('179', '用户头像', '2', 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', '1', '123', '会计', '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2024/10/04/1727974551786_20241004005551A003.png\",\"code\":200}', '0', null, '2024-10-04 00:55:51', '7');
INSERT INTO `sys_oper_log` VALUES ('180', '用户头像', '2', 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', '1', '123', '会计', '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2024/10/04/1727976472363_20241004012752A004.png\",\"code\":200}', '0', null, '2024-10-04 01:27:52', '7');
INSERT INTO `sys_oper_log` VALUES ('181', '代码生成', '3', 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', '1', 'admin', null, '/tool/gen/1', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-10-04 18:47:20', '25');
INSERT INTO `sys_oper_log` VALUES ('182', '代码生成', '3', 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', '1', 'admin', null, '/tool/gen/2', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-10-04 18:47:23', '8');
INSERT INTO `sys_oper_log` VALUES ('183', '代码生成', '3', 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', '1', 'admin', null, '/tool/gen/3', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-10-04 18:47:26', '8');
INSERT INTO `sys_oper_log` VALUES ('184', '代码生成', '6', 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', null, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"rotation_map\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-10-04 18:48:57', '45');
INSERT INTO `sys_oper_log` VALUES ('185', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"Rotationmap\",\"className\":\"RotationMap\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"住建\",\"columnId\":50,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-10-04 18:48:57\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ImgUrl\",\"columnComment\":\"图片\",\"columnId\":51,\"columnName\":\"img_url\",\"columnType\":\"varchar(1000)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-04 18:48:57\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"imageUpload\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"imgUrl\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Title\",\"columnComment\":\"标题\",\"columnId\":52,\"columnName\":\"title\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-04 18:48:57\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"title\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateDate\",\"columnComment\":\"添加时间\",\"columnId\":53,\"columnName\":\"create_date\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-10-04 18:48:57\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-10-04 18:50:50', '23');
INSERT INTO `sys_oper_log` VALUES ('186', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"rotation_map\"}', null, '0', null, '2024-10-04 18:50:53', '139');
INSERT INTO `sys_oper_log` VALUES ('187', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"轮播图\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2005,\"path\":\"rotationmap\",\"perms\":\"system:Rotationmap:list\",\"query\":\"system/Rotationmap/index\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-10-04 18:58:58', '17');
INSERT INTO `sys_oper_log` VALUES ('188', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/Rotationmap/index\",\"createTime\":\"2024-10-04 18:58:58\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2006,\"menuName\":\"轮播图\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2005,\"path\":\"rotationmap\",\"perms\":\"system:Rotationmap:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-10-04 19:00:47', '20');
INSERT INTO `sys_oper_log` VALUES ('189', '轮播图', '1', 'com.ruoyi.system.controller.RotationMapController.add()', 'POST', '1', 'admin', null, '/system/Rotationmap', '127.0.0.1', '内网IP', '{\"id\":1,\"imgUrl\":\"/profile/upload/2024/10/04/t016b562cfd7904cbd1_20241004190157A001.jpg\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-10-04 19:02:06', '13');
INSERT INTO `sys_oper_log` VALUES ('190', '轮播图', '3', 'com.ruoyi.system.controller.RotationMapController.remove()', 'DELETE', '1', 'admin', null, '/system/Rotationmap/1', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-10-04 19:03:14', '7');
INSERT INTO `sys_oper_log` VALUES ('191', '轮播图', '1', 'com.ruoyi.system.controller.RotationMapController.add()', 'POST', '1', 'admin', null, '/system/Rotationmap', '127.0.0.1', '内网IP', '{\"id\":2,\"imgUrl\":\"/profile/upload/2024/10/04/t045a3fc9366567d918_20241004190321A002.jpg\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-10-04 19:03:22', '7');
INSERT INTO `sys_oper_log` VALUES ('192', '轮播图', '3', 'com.ruoyi.system.controller.RotationMapController.remove()', 'DELETE', '1', 'admin', null, '/system/Rotationmap/2', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-10-04 19:04:08', '8');
INSERT INTO `sys_oper_log` VALUES ('193', '轮播图', '1', 'com.ruoyi.system.controller.RotationMapController.add()', 'POST', '1', 'admin', null, '/system/Rotationmap', '127.0.0.1', '内网IP', '{\"id\":3,\"imgUrl\":\"/profile/upload/2024/10/04/t016b562cfd7904cbd1_20241004190412A003.jpg\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-10-04 19:04:12', '6');
INSERT INTO `sys_oper_log` VALUES ('194', '轮播图', '1', 'com.ruoyi.system.controller.RotationMapController.add()', 'POST', '1', 'admin', null, '/system/Rotationmap', '127.0.0.1', '内网IP', '{\"id\":4,\"imgUrl\":\"/profile/upload/2024/10/04/t016d73e1922d926257_20241004190415A004.jpg\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-10-04 19:04:16', '6');
INSERT INTO `sys_oper_log` VALUES ('195', '轮播图', '1', 'com.ruoyi.system.controller.RotationMapController.add()', 'POST', '1', 'admin', null, '/system/Rotationmap', '127.0.0.1', '内网IP', '{\"id\":5,\"imgUrl\":\"/profile/upload/2024/10/04/t0102af9d75e5267053_20241004190420A005.jpg\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-10-04 19:04:20', '8');
INSERT INTO `sys_oper_log` VALUES ('196', '轮播图', '1', 'com.ruoyi.system.controller.RotationMapController.add()', 'POST', '1', 'admin', null, '/system/Rotationmap', '127.0.0.1', '内网IP', '{\"id\":6,\"imgUrl\":\"/profile/upload/2024/10/04/t045a3fc9366567d918_20241004190423A006.jpg\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-10-04 19:04:24', '6');
INSERT INTO `sys_oper_log` VALUES ('197', '代码生成', '6', 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', null, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"priject_content\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-10-04 20:07:44', '49');
INSERT INTO `sys_oper_log` VALUES ('198', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"content\",\"className\":\"PrijectContent\",\"columns\":[{\"capJavaField\":\"Id\",\"columnId\":58,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-10-04 20:07:44\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Title\",\"columnComment\":\"标题\",\"columnId\":59,\"columnName\":\"title\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-04 20:07:44\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"title\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Content\",\"columnComment\":\"内容\",\"columnId\":60,\"columnName\":\"content\",\"columnType\":\"varchar(500)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-04 20:07:44\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"editor\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"content\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Img\",\"columnComment\":\"图片\",\"columnId\":61,\"columnName\":\"img\",\"columnType\":\"varchar(500)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-04 20:07:44\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"imageUpload\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"img\",\"javaType\":\"String\",\"list\":tru', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-10-04 20:09:12', '25');
INSERT INTO `sys_oper_log` VALUES ('199', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"priject_content\"}', null, '0', null, '2024-10-04 20:09:15', '127');
INSERT INTO `sys_oper_log` VALUES ('200', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/content/index\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"项目管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2005,\"path\":\"content\",\"perms\":\"system:content:list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-10-04 20:11:49', '23');
INSERT INTO `sys_oper_log` VALUES ('201', '项目信息', '1', 'com.ruoyi.system.controller.PrijectContentController.add()', 'POST', '1', 'admin', null, '/system/content', '127.0.0.1', '内网IP', '{\"content\":\"测试11111111111\",\"id\":1,\"img\":\"/profile/upload/2024/10/04/t016b562cfd7904cbd1_20241004201538A001.jpg\",\"params\":{},\"title\":\"测试\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-10-04 20:15:39', '17');
INSERT INTO `sys_oper_log` VALUES ('202', '项目信息', '2', 'com.ruoyi.system.controller.PrijectContentController.edit()', 'PUT', '1', 'admin', null, '/system/content', '127.0.0.1', '内网IP', '{\"content\":\"测试11111111111\",\"createDate\":\"2024-10-04 20:15:39\",\"id\":1,\"img\":\"/profile/upload/2024/10/04/t016b562cfd7904cbd1_20241004201538A001.jpg\",\"params\":{},\"title\":\"测试\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-10-05 21:49:46', '8');
INSERT INTO `sys_oper_log` VALUES ('203', '项目信息', '2', 'com.ruoyi.system.controller.PrijectContentController.edit()', 'PUT', '1', 'admin', null, '/system/content', '127.0.0.1', '内网IP', '{\"content\":\"测试11111111111\",\"createDate\":\"2024-10-04 20:15:39\",\"id\":1,\"img\":\"/profile/upload/2024/10/04/t016b562cfd7904cbd1_20241004201538A001.jpg\",\"params\":{},\"title\":\"测试\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-10-05 21:52:16', '115239');
INSERT INTO `sys_oper_log` VALUES ('204', '项目信息', '2', 'com.ruoyi.system.controller.PrijectContentController.edit()', 'PUT', '1', 'admin', null, '/system/content', '127.0.0.1', '内网IP', '{\"content\":\"测试11111111111\",\"createAvatar\":\"/profile/avatar/2024/09/18/58V36oEDuzoGa77e651bd3f10c296fe315be1722de72_20240918203714A003.jpg\",\"createDate\":\"2024-10-04 20:15:39\",\"extend1\":\"admin\",\"id\":1,\"img\":\"/profile/upload/2024/10/04/t016b562cfd7904cbd1_20241004201538A001.jpg\",\"params\":{},\"title\":\"测试\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-10-05 21:52:47', '2821');
INSERT INTO `sys_oper_log` VALUES ('205', '用户头像', '2', 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', '1', 'ceshi', '计算机', '/system/user/profile/avatar', '192.168.1.6', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2024/10/05/1728137618642_20241005221338A003.png\",\"code\":200}', '0', null, '2024-10-05 22:13:38', '12');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) COLLATE utf8_unicode_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci COMMENT='岗位信息表';

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES ('1', 'ceo', '董事长', '1', '0', 'admin', '2024-09-17 00:16:08', '', null, '');
INSERT INTO `sys_post` VALUES ('2', 'se', '项目经理', '2', '0', 'admin', '2024-09-17 00:16:08', '', null, '');
INSERT INTO `sys_post` VALUES ('3', 'hr', '人力资源', '3', '0', 'admin', '2024-09-17 00:16:08', '', null, '');
INSERT INTO `sys_post` VALUES ('4', 'user', '普通员工', '4', '0', 'admin', '2024-09-17 00:16:08', '', null, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) COLLATE utf8_unicode_ci DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
  `status` char(1) COLLATE utf8_unicode_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci COMMENT='角色信息表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '超级管理员', 'admin', '1', '1', '1', '1', '0', '0', 'admin', '2024-09-17 00:16:08', '', null, '超级管理员');
INSERT INTO `sys_role` VALUES ('2', '普通角色', 'common', '2', '2', '1', '1', '0', '0', 'admin', '2024-09-17 00:16:08', '', null, '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci COMMENT='角色和部门关联表';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES ('2', '100');
INSERT INTO `sys_role_dept` VALUES ('2', '101');
INSERT INTO `sys_role_dept` VALUES ('2', '105');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci COMMENT='角色和菜单关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('2', '1');
INSERT INTO `sys_role_menu` VALUES ('2', '2');
INSERT INTO `sys_role_menu` VALUES ('2', '3');
INSERT INTO `sys_role_menu` VALUES ('2', '4');
INSERT INTO `sys_role_menu` VALUES ('2', '100');
INSERT INTO `sys_role_menu` VALUES ('2', '101');
INSERT INTO `sys_role_menu` VALUES ('2', '102');
INSERT INTO `sys_role_menu` VALUES ('2', '103');
INSERT INTO `sys_role_menu` VALUES ('2', '104');
INSERT INTO `sys_role_menu` VALUES ('2', '105');
INSERT INTO `sys_role_menu` VALUES ('2', '106');
INSERT INTO `sys_role_menu` VALUES ('2', '107');
INSERT INTO `sys_role_menu` VALUES ('2', '108');
INSERT INTO `sys_role_menu` VALUES ('2', '109');
INSERT INTO `sys_role_menu` VALUES ('2', '110');
INSERT INTO `sys_role_menu` VALUES ('2', '111');
INSERT INTO `sys_role_menu` VALUES ('2', '112');
INSERT INTO `sys_role_menu` VALUES ('2', '113');
INSERT INTO `sys_role_menu` VALUES ('2', '114');
INSERT INTO `sys_role_menu` VALUES ('2', '115');
INSERT INTO `sys_role_menu` VALUES ('2', '116');
INSERT INTO `sys_role_menu` VALUES ('2', '117');
INSERT INTO `sys_role_menu` VALUES ('2', '500');
INSERT INTO `sys_role_menu` VALUES ('2', '501');
INSERT INTO `sys_role_menu` VALUES ('2', '1000');
INSERT INTO `sys_role_menu` VALUES ('2', '1001');
INSERT INTO `sys_role_menu` VALUES ('2', '1002');
INSERT INTO `sys_role_menu` VALUES ('2', '1003');
INSERT INTO `sys_role_menu` VALUES ('2', '1004');
INSERT INTO `sys_role_menu` VALUES ('2', '1005');
INSERT INTO `sys_role_menu` VALUES ('2', '1006');
INSERT INTO `sys_role_menu` VALUES ('2', '1007');
INSERT INTO `sys_role_menu` VALUES ('2', '1008');
INSERT INTO `sys_role_menu` VALUES ('2', '1009');
INSERT INTO `sys_role_menu` VALUES ('2', '1010');
INSERT INTO `sys_role_menu` VALUES ('2', '1011');
INSERT INTO `sys_role_menu` VALUES ('2', '1012');
INSERT INTO `sys_role_menu` VALUES ('2', '1013');
INSERT INTO `sys_role_menu` VALUES ('2', '1014');
INSERT INTO `sys_role_menu` VALUES ('2', '1015');
INSERT INTO `sys_role_menu` VALUES ('2', '1016');
INSERT INTO `sys_role_menu` VALUES ('2', '1017');
INSERT INTO `sys_role_menu` VALUES ('2', '1018');
INSERT INTO `sys_role_menu` VALUES ('2', '1019');
INSERT INTO `sys_role_menu` VALUES ('2', '1020');
INSERT INTO `sys_role_menu` VALUES ('2', '1021');
INSERT INTO `sys_role_menu` VALUES ('2', '1022');
INSERT INTO `sys_role_menu` VALUES ('2', '1023');
INSERT INTO `sys_role_menu` VALUES ('2', '1024');
INSERT INTO `sys_role_menu` VALUES ('2', '1025');
INSERT INTO `sys_role_menu` VALUES ('2', '1026');
INSERT INTO `sys_role_menu` VALUES ('2', '1027');
INSERT INTO `sys_role_menu` VALUES ('2', '1028');
INSERT INTO `sys_role_menu` VALUES ('2', '1029');
INSERT INTO `sys_role_menu` VALUES ('2', '1030');
INSERT INTO `sys_role_menu` VALUES ('2', '1031');
INSERT INTO `sys_role_menu` VALUES ('2', '1032');
INSERT INTO `sys_role_menu` VALUES ('2', '1033');
INSERT INTO `sys_role_menu` VALUES ('2', '1034');
INSERT INTO `sys_role_menu` VALUES ('2', '1035');
INSERT INTO `sys_role_menu` VALUES ('2', '1036');
INSERT INTO `sys_role_menu` VALUES ('2', '1037');
INSERT INTO `sys_role_menu` VALUES ('2', '1038');
INSERT INTO `sys_role_menu` VALUES ('2', '1039');
INSERT INTO `sys_role_menu` VALUES ('2', '1040');
INSERT INTO `sys_role_menu` VALUES ('2', '1041');
INSERT INTO `sys_role_menu` VALUES ('2', '1042');
INSERT INTO `sys_role_menu` VALUES ('2', '1043');
INSERT INTO `sys_role_menu` VALUES ('2', '1044');
INSERT INTO `sys_role_menu` VALUES ('2', '1045');
INSERT INTO `sys_role_menu` VALUES ('2', '1046');
INSERT INTO `sys_role_menu` VALUES ('2', '1047');
INSERT INTO `sys_role_menu` VALUES ('2', '1048');
INSERT INTO `sys_role_menu` VALUES ('2', '1049');
INSERT INTO `sys_role_menu` VALUES ('2', '1050');
INSERT INTO `sys_role_menu` VALUES ('2', '1051');
INSERT INTO `sys_role_menu` VALUES ('2', '1052');
INSERT INTO `sys_role_menu` VALUES ('2', '1053');
INSERT INTO `sys_role_menu` VALUES ('2', '1054');
INSERT INTO `sys_role_menu` VALUES ('2', '1055');
INSERT INTO `sys_role_menu` VALUES ('2', '1056');
INSERT INTO `sys_role_menu` VALUES ('2', '1057');
INSERT INTO `sys_role_menu` VALUES ('2', '1058');
INSERT INTO `sys_role_menu` VALUES ('2', '1059');
INSERT INTO `sys_role_menu` VALUES ('2', '1060');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) COLLATE utf8_unicode_ci DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '手机号码',
  `sex` char(1) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '密码',
  `status` char(1) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci COMMENT='用户信息表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '103', 'admin', '管理员1222', '00', 'ry@163.com', '15888888888', '1', '/profile/avatar/2024/09/18/58V36oEDuzoGa77e651bd3f10c296fe315be1722de72_20240918203714A003.jpg', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2024-10-05 21:49:35', 'admin', '2024-09-17 00:16:08', '', '2024-10-05 21:49:34', '管理员');
INSERT INTO `sys_user` VALUES ('2', '200', 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '2', '127.0.0.1', '2024-09-17 00:16:08', 'admin', '2024-09-17 00:16:08', 'admin', '2024-10-02 17:59:56', '测试员');
INSERT INTO `sys_user` VALUES ('104', '200', '17690929999', '17690929999', '00', '', '17690929999', '0', '', '$2a$10$ecIW8IJeMsNH6BQYo0omN.v6Cb/CjhemNfc2hSbdL1J0erzqVyJ2a', '0', '0', '', null, '', '2024-10-02 22:00:42', '', null, null);
INSERT INTO `sys_user` VALUES ('105', '201', '111', '111', '00', '', '111', '0', '/profile/avatar/2024/10/04/1727974533446_20241004005533A001.png', '$2a$10$vdOBUZKimpkZ20jtUOsMIeHwqNH1nd/qS9xDXujG5d8f8YxysW1ve', '0', '0', '192.168.1.6', '2024-10-05 22:16:23', '', '2024-10-02 22:06:52', '', '2024-10-05 22:16:22', null);
INSERT INTO `sys_user` VALUES ('106', '201', '123', '123', '00', '', '123', '0', '/profile/avatar/2024/10/04/1727976472363_20241004012752A004.png', '$2a$10$zzWCg.79WMVRzmmZdfUl8O9heobuYUSkUMSYnEfd8OzHcEnIv.hVu', '0', '0', '192.168.1.6', '2024-10-05 22:11:37', '', '2024-10-04 00:24:52', '', '2024-10-05 22:11:37', null);
INSERT INTO `sys_user` VALUES ('107', '200', 'ceshi', 'ceshi', '00', '', '17699999999', '0', '/profile/avatar/2024/10/05/1728137618642_20241005221338A003.png', '$2a$10$RZsL/OC5BDd.ceIJi8y38eED5gCdIeiDBjlOqyw.VqrfPw.gtNgIi', '0', '0', '192.168.1.6', '2024-10-05 22:13:10', '', '2024-10-05 22:13:02', '', '2024-10-05 22:13:09', null);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci COMMENT='用户与岗位关联表';

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci COMMENT='用户和角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
