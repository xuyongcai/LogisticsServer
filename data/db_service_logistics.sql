/*
 Navicat Premium Data Transfer

 Source Server         : local_mysql
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : localhost:3306
 Source Schema         : db_service_logistics

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 23/12/2018 15:14:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_auth
-- ----------------------------
DROP TABLE IF EXISTS `tb_auth`;
CREATE TABLE `tb_auth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL COMMENT '权限表名称',
  `auth_code` varchar(200) NOT NULL COMMENT '权限编码',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tb_auth_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_auth_user`;
CREATE TABLE `tb_auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_user_id` int(11) NOT NULL COMMENT '用户ID',
  `auth_codes` varchar(500) DEFAULT NULL COMMENT '权限编码json列表',
  `time` datetime DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户权限';

-- ----------------------------
-- Table structure for tb_auth_user_type
-- ----------------------------
DROP TABLE IF EXISTS `tb_auth_user_type`;
CREATE TABLE `tb_auth_user_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_auth_id` int(11) DEFAULT NULL,
  `user_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限和用户类型绑定表，一个用户类型对应多个权限';

-- ----------------------------
-- Table structure for tb_finance_recharge
-- ----------------------------
DROP TABLE IF EXISTS `tb_finance_recharge`;
CREATE TABLE `tb_finance_recharge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_user_id` int(11) NOT NULL,
  `company_out` varchar(255) DEFAULT NULL COMMENT '进行充值的公司名',
  `bank_name` varchar(255) DEFAULT NULL COMMENT '账户名',
  `bank_number` varchar(255) DEFAULT NULL COMMENT '银行账号',
  `bank` varchar(255) DEFAULT NULL COMMENT '银行名称',
  `bank_addr` varchar(255) DEFAULT NULL COMMENT '支行地址',
  `money` float NOT NULL DEFAULT '0' COMMENT '充值金额',
  `money_code` varchar(255) NOT NULL COMMENT '汇款识别码',
  `money_for` varchar(255) DEFAULT NULL COMMENT '用途',
  `status` varchar(255) DEFAULT NULL COMMENT '充值状态',
  `fk_admin_id` int(11) DEFAULT NULL COMMENT '操作的管理员',
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户充值表，记录用户充值信息';

-- ----------------------------
-- Table structure for tb_finance_recharge_status
-- ----------------------------
DROP TABLE IF EXISTS `tb_finance_recharge_status`;
CREATE TABLE `tb_finance_recharge_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tb_fleet_car
-- ----------------------------
DROP TABLE IF EXISTS `tb_fleet_car`;
CREATE TABLE `tb_fleet_car` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(30) NOT NULL COMMENT '车牌号如皖A5504',
  `type` varchar(100) NOT NULL COMMENT '车辆类型如面包车',
  `resource` varchar(100) NOT NULL COMMENT '车辆所属如自有车辆',
  `two_plate` varchar(30) DEFAULT NULL COMMENT '挂车车牌',
  `driver_phone` varchar(12) DEFAULT NULL COMMENT '随车电话',
  `driver_name` varchar(100) DEFAULT NULL COMMENT '随车司机姓名',
  `energy` varchar(100) DEFAULT NULL COMMENT '能耗类型',
  `length` varchar(100) DEFAULT NULL COMMENT '车辆长度',
  `weight` float DEFAULT NULL COMMENT '核定载重吨',
  `vin` varchar(255) DEFAULT NULL COMMENT '汽车VIN码',
  `brand` varchar(255) DEFAULT NULL COMMENT '车辆品牌',
  `engine` varchar(100) DEFAULT NULL COMMENT '发动机号',
  `axle` varchar(255) DEFAULT NULL COMMENT '车轴数',
  `wheelbase` varchar(255) DEFAULT NULL COMMENT '轴距',
  `tire` varchar(255) DEFAULT NULL COMMENT '轮胎数量',
  `factory_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '出厂日期',
  `buy_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '购买日期',
  `buy_price` int(11) DEFAULT NULL COMMENT '购买价格',
  `limited_time` datetime DEFAULT NULL COMMENT '年审日期',
  `tow_maintain_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '二级维护有效期',
  `insurance_policy` varchar(255) DEFAULT NULL COMMENT '保险单号',
  `insurance_company` varchar(255) DEFAULT NULL COMMENT '保险公司',
  `insurance_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '保险有效期',
  `front_img` varchar(500) DEFAULT NULL COMMENT '车头照片',
  `tail_img` varchar(500) DEFAULT NULL COMMENT '车尾照片',
  `remark` text COMMENT '车辆备注',
  `time` datetime DEFAULT NULL,
  `belong_user_id` int(11) DEFAULT NULL COMMENT '所属用户的外键',
  `visible` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否存在',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=334 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_fleet_car
-- ----------------------------
BEGIN;
INSERT INTO `tb_fleet_car` VALUES (20, '123', '爬梯车', '自有', '', '18949821385', '王昆仑', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-06 12:32:34', 129, 0);
INSERT INTO `tb_fleet_car` VALUES (21, '123', '栏板车', '自有', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-06 12:32:49', 129, 1);
INSERT INTO `tb_fleet_car` VALUES (22, '冀AKY616', '高栏车', '第三方', '', '15031919380', '谢凤波', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-07 02:07:11', 127, 0);
INSERT INTO `tb_fleet_car` VALUES (23, '冀AKY675', '高栏车', '第三方', '', '15175981857', '岳敬军', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-07 02:19:07', 127, 0);
INSERT INTO `tb_fleet_car` VALUES (24, '冀FM6751', '高栏车', '第三方', '', '18630298512', '郑路明', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-07 02:20:04', 127, 0);
INSERT INTO `tb_fleet_car` VALUES (25, '皖P123456', '平板车', '自有', '', '18656301000', '董先生', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-07 02:33:04', 127, 0);
INSERT INTO `tb_fleet_car` VALUES (26, '津AY0935', '高栏车', '第三方', '', '15022398268', '王君', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-07 07:11:47', 127, 1);
INSERT INTO `tb_fleet_car` VALUES (27, '津AZ3011', '高栏车', '第三方', '', '18920907301', '王君', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-07 07:49:26', 127, 1);
INSERT INTO `tb_fleet_car` VALUES (28, '津AY1265', '高栏车', '第三方', '', '15843971717', '王君', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-07 07:50:03', 127, 1);
INSERT INTO `tb_fleet_car` VALUES (29, '津AY3123', '高栏车', '第三方', '', '18920591336', '王王君', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-07 07:50:55', 127, 1);
INSERT INTO `tb_fleet_car` VALUES (30, '津C12930', '高栏车', '第三方', '', '13331497377', '王君', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-07 07:51:24', 127, 1);
INSERT INTO `tb_fleet_car` VALUES (31, '津C10228', '高栏车', '第三方', '', '18643907567', '王君', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-07 07:51:53', 127, 1);
INSERT INTO `tb_fleet_car` VALUES (32, '津C18957', '高栏车', '第三方', '', '18202521215', '王君', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-07 07:52:26', 127, 1);
INSERT INTO `tb_fleet_car` VALUES (33, '津C10226', '高栏车', '第三方', '', '18920092362', '王君', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-07 07:53:11', 127, 1);
INSERT INTO `tb_fleet_car` VALUES (34, '津C19885', '高栏车', '第三方', '', '17093702006', '王君', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-07 07:53:49', 127, 1);
INSERT INTO `tb_fleet_car` VALUES (35, '晋B93708', '高栏车', '第三方', '', '13903528196', '陈利兵', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-07 07:54:45', 127, 1);
INSERT INTO `tb_fleet_car` VALUES (36, '晋B94726', '高栏车', '第三方', '', '13934780168', '刘大伟', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-07 07:55:25', 127, 1);
INSERT INTO `tb_fleet_car` VALUES (37, '冀FK9396', '高栏车', '第三方', '', '18630239757', '孙卫凯', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-07 07:56:03', 127, 1);
INSERT INTO `tb_fleet_car` VALUES (38, '冀FL3405', '高栏车', '第三方', '', '13931244715', '王立学', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-07 07:56:37', 127, 1);
INSERT INTO `tb_fleet_car` VALUES (39, '冀FM4776', '高栏车', '第三方', '', '15303122829', '赵贺清', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-07 07:57:27', 127, 1);
INSERT INTO `tb_fleet_car` VALUES (40, '冀FN1350', '高栏车', '第三方', '', '15303122829', '赵贺清', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-07 07:58:08', 127, 1);
INSERT INTO `tb_fleet_car` VALUES (41, '冀FN1385', '高栏车', '第三方', '', '13780329517', '赵贺清', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-07 07:58:44', 127, 1);
INSERT INTO `tb_fleet_car` VALUES (42, '冀FM8708', '高栏车', '第三方', '', '15303122829', '赵贺清', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-07 07:59:22', 127, 1);
INSERT INTO `tb_fleet_car` VALUES (43, '冀FM4779', '高栏车', '第三方', '', '15303122829', '赵贺清', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-07 08:00:03', 127, 1);
INSERT INTO `tb_fleet_car` VALUES (44, '冀FK2992', '高栏车', '第三方', '', '13780223788', '白寿峰', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-07 08:00:39', 127, 1);
INSERT INTO `tb_fleet_car` VALUES (45, '冀ABC662', '高栏车', '第三方', '', '15075410519', '郭二亮', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-07 08:01:15', 127, 1);
INSERT INTO `tb_fleet_car` VALUES (46, '冀ATF425', '高栏车', '第三方', '', '13733214704', '路然', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-07 08:01:39', 127, 1);
INSERT INTO `tb_fleet_car` VALUES (47, '冀FK2460', '高栏车', '第三方', '', '15128296303', '王彦南', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-07 08:02:19', 127, 1);
INSERT INTO `tb_fleet_car` VALUES (48, '冀FK9345', '高栏车', '第三方', '', '15028445318', '毕红红', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-07 08:02:55', 127, 1);
INSERT INTO `tb_fleet_car` VALUES (49, '冀FM9066', '高栏车', '第三方', '', '13722257667', '郑继伟', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-07 08:03:59', 127, 1);
INSERT INTO `tb_fleet_car` VALUES (50, '冀FL2528', '高栏车', '第三方', '', '13785968292', '张中秋', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-07 08:04:44', 127, 1);
INSERT INTO `tb_fleet_car` VALUES (51, '冀FK3227', '高栏车', '第三方', '', '15833690777', '徐士岗', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-07 08:05:28', 127, 1);
INSERT INTO `tb_fleet_car` VALUES (52, '冀FL5755', '高栏车', '第三方', '', '15830956565', '单亚鹏', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-07 08:06:01', 127, 1);
INSERT INTO `tb_fleet_car` VALUES (53, '冀FJ9763', '高栏车', '第三方', '', '15830845899', '田建中', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-07 08:06:33', 127, 1);
INSERT INTO `tb_fleet_car` VALUES (54, '冀FM6710', '高栏车', '第三方', '', '13722959822', '翟桂余', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-07 08:07:19', 127, 1);
INSERT INTO `tb_fleet_car` VALUES (55, '冀FM2070', '高栏车', '第三方', '', '15633768572', '郭尚清', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-07 08:07:52', 127, 1);
INSERT INTO `tb_fleet_car` VALUES (56, '冀FM2070', '高栏车', '第三方', '', '15633768572', '郭尚清', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-07 08:09:10', 127, 1);
INSERT INTO `tb_fleet_car` VALUES (57, '冀FM6805', '高栏车', '第三方', '', '13722959822', '翟桂余', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-07 08:11:38', 127, 1);
INSERT INTO `tb_fleet_car` VALUES (58, '冀FM1217', '高栏车', '第三方', '', '13722959822', '翟桂余', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-07 08:12:10', 127, 1);
INSERT INTO `tb_fleet_car` VALUES (59, '冀FH5942', '高栏车', '第三方', '', '15028290043', '魏永哲', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-07 08:12:48', 127, 1);
INSERT INTO `tb_fleet_car` VALUES (60, '冀FL1885', '高栏车', '第三方', '', '13780427003', '刘新强', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-07 08:13:20', 127, 1);
INSERT INTO `tb_fleet_car` VALUES (61, '冀FJ7508', '高栏车', '第三方', '', '13703368061', '唐凤雷', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-07 08:13:58', 127, 1);
INSERT INTO `tb_fleet_car` VALUES (62, '冀FG4190', '高栏车', '第三方', '', '15720065288', '孟朋帅', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-07 08:14:30', 127, 1);
INSERT INTO `tb_fleet_car` VALUES (63, '冀FK2971', '高栏车', '第三方', '', '18332829969', '刘士卿', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-07 08:15:08', 127, 1);
INSERT INTO `tb_fleet_car` VALUES (64, '冀FH5757', '高栏车', '第三方', '', '15131234416', '刘永合', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-07 08:15:41', 127, 1);
INSERT INTO `tb_fleet_car` VALUES (65, '冀FL5908', '高栏车', '第三方', '', '15631233868', '齐云立', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-07 08:16:24', 127, 1);
INSERT INTO `tb_fleet_car` VALUES (66, '冀FG4504', '高栏车', '第三方', '', '13500386865', '安士龙', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-07 08:16:51', 127, 1);
INSERT INTO `tb_fleet_car` VALUES (67, '冀FL1293', '高栏车', '第三方', '', '18131239076', '郭艳辉', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-07 08:17:25', 127, 1);
INSERT INTO `tb_fleet_car` VALUES (68, '冀FL0787', '高栏车', '第三方', '', '18131239076', '郭艳辉', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-07 08:17:53', 127, 1);
INSERT INTO `tb_fleet_car` VALUES (69, '冀FM3706', '高栏车', '第三方', '', '15230268508', '夏志娟', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-07 08:18:25', 127, 1);
INSERT INTO `tb_fleet_car` VALUES (70, '冀FM3872', '高栏车', '第三方', '', '13503129778', '芦学庆', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-07 08:19:02', 127, 1);
INSERT INTO `tb_fleet_car` VALUES (71, '冀FL2449', '高栏车', '第三方', '', '18931382606', '武海鹏', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-07 08:19:31', 127, 1);
INSERT INTO `tb_fleet_car` VALUES (72, '冀AL4179', '高栏车', '第三方', '', '15230268508', '夏志娟', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-07 08:20:04', 127, 1);
INSERT INTO `tb_fleet_car` VALUES (73, '冀FM1221', '高栏车', '第三方', '', '13722959822', '翟桂余', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-07 08:20:30', 127, 1);
INSERT INTO `tb_fleet_car` VALUES (74, '冀FM6687', '高栏车', '第三方', '', '13722959822', '翟桂余', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-07 08:20:51', 127, 1);
INSERT INTO `tb_fleet_car` VALUES (75, '冀FM7005', '高栏车', '第三方', '', '13503220385', '韩娇娇', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-07 08:21:20', 127, 1);
INSERT INTO `tb_fleet_car` VALUES (76, '冀FM7195', '高栏车', '第三方', '', '13012054304', '马双', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-07 08:21:43', 127, 1);
INSERT INTO `tb_fleet_car` VALUES (77, '冀FM7193', '高栏车', '第三方', '', '13012054304', '马双', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-07 08:22:05', 127, 1);
INSERT INTO `tb_fleet_car` VALUES (78, '冀FN3069', '高栏车', '第三方', '', '13012054304', '马双', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-07 08:22:31', 127, 1);
INSERT INTO `tb_fleet_car` VALUES (79, '冀FN1961', '高栏车', '第三方', '', '13012054304', '马双', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-07 08:22:59', 127, 1);
INSERT INTO `tb_fleet_car` VALUES (80, '冀FK9151', '高栏车', '第三方', '', '15731213388', '齐云立', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-07 08:23:34', 127, 1);
INSERT INTO `tb_fleet_car` VALUES (81, '冀FJ9892', '高栏车', '第三方', '', '13785242163', '齐新强', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-07 08:23:58', 127, 1);
INSERT INTO `tb_fleet_car` VALUES (82, '冀FK5735', '高栏车', '第三方', '', '13785242163', '齐新强', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-07 08:24:29', 127, 1);
INSERT INTO `tb_fleet_car` VALUES (83, '冀FJ0831', '高栏车', '第三方', '', '13785242163', '齐新强', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-07 08:25:04', 127, 1);
INSERT INTO `tb_fleet_car` VALUES (84, '冀KF4359', '自卸车', '第三方', '', '', '薛永禄', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-10 17:45:39', 135, 0);
INSERT INTO `tb_fleet_car` VALUES (85, '冀FK9151', '自卸车', '第三方', '', '', '齐云立', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-10 17:46:51', 135, 0);
INSERT INTO `tb_fleet_car` VALUES (86, '冀FJ9151', '自卸车', '第三方', '', '', '齐新强', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-10 17:47:22', 135, 0);
INSERT INTO `tb_fleet_car` VALUES (87, '冀F25908', '自卸车', '第三方', '', '', '齐云立', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-10 18:42:00', 135, 0);
INSERT INTO `tb_fleet_car` VALUES (88, '冀FK9151', '自卸车', '第三方', '', '15731213388', '齐云立', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-10 18:43:44', 135, 0);
INSERT INTO `tb_fleet_car` VALUES (89, '冀FM1186', '自卸车', '第三方', '', '13932209391', '齐云立', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-10 18:44:30', 135, 0);
INSERT INTO `tb_fleet_car` VALUES (90, '冀FM1180', '自卸车', '第三方', '', '13932209391', '齐云立', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-10 18:45:11', 135, 0);
INSERT INTO `tb_fleet_car` VALUES (91, '冀FM1830', '自卸车', '第三方', '', '13932209391', '齐云立', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-10 18:46:37', 135, 0);
INSERT INTO `tb_fleet_car` VALUES (92, '冀FM3271', '自卸车', '第三方', '', '13932209391', '齐云立', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-10 18:47:09', 135, 0);
INSERT INTO `tb_fleet_car` VALUES (93, '冀FK5890', '自卸车', '第三方', '', '', '王栓', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-10 18:48:02', 135, 0);
INSERT INTO `tb_fleet_car` VALUES (94, '冀FK8363', '自卸车', '第三方', '', '13831209386', '崔秀启', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-10 18:49:27', 135, 0);
INSERT INTO `tb_fleet_car` VALUES (95, '冀FK2932', '自卸车', '第三方', '', '13831209386', '崔秀启', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-10 18:51:45', 135, 0);
INSERT INTO `tb_fleet_car` VALUES (96, '冀FN2702', '自卸车', '第三方', '', '13633229069', '翟桂余', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-10 18:52:45', 135, 0);
INSERT INTO `tb_fleet_car` VALUES (97, '冀FM6316', '自卸车', '第三方', '', '13831257926', '苏亚军', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-21 11:56:02', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (98, '冀FL4123', '自卸车', '第三方', '', '13613326482', '王永', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-21 11:56:51', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (99, '冀FM6477', '自卸车', '第三方', '', '15033215688', '陈晓亮', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-21 11:57:33', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (100, '冀FM6497', '自卸车', '第三方', '', '13831285448', '李保军', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-21 11:58:25', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (101, '冀FM5196', '自卸车', '第三方', '', '17325287692', '胡亭会', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-21 11:59:24', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (102, '冀FM6457', '自卸车', '第三方', '', '13731271833', '候存', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-21 12:00:16', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (103, '冀FL6891', '自卸车', '第三方', '', '17360738886', '王金明', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-21 12:01:00', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (104, '冀FM4757', '自卸车', '第三方', '', '17325287861', '李志刚', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-22 09:48:40', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (105, '冀FM5475', '自卸车', '第三方', '', '13400331196', '赵志峰', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-22 09:49:15', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (106, '冀FM5230', '自卸车', '第三方', '', '17325215686', '古宾宾', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-22 09:50:05', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (107, '冀FM6751', '自卸车', '第三方', '', '18630298513', '王占海', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-22 09:50:51', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (108, '冀FM4755', '自卸车', '第三方', '', '17713222610', '范晓雷', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-22 09:51:45', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (109, '冀FM6472', '自卸车', '第三方', '', '13930844523', '曹红亮', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-22 09:52:31', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (110, '冀FL5447', '自卸车', '第三方', '', '13832282819', '王彦云', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-22 09:53:36', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (111, '冀FM0898', '自卸车', '第三方', '', '17332221222', '郑路明', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-22 09:54:23', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (112, '冀FL6899', '自卸车', '第三方', '', '17332221222', '郑路明', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-22 09:55:10', 135, 0);
INSERT INTO `tb_fleet_car` VALUES (113, '冀FM0898', '自卸车', '第三方', '', '17332221222', '郑路明', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-22 16:26:11', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (114, '冀FL6899', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-22 16:26:44', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (115, '冀FK5890', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-22 16:27:02', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (116, '冀FL3560', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-22 16:27:20', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (117, '冀FD8107', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-22 16:27:42', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (118, '冀FK 2573', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-22 16:28:00', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (119, '冀EH5716', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-22 16:28:25', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (120, '冀EM7696', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-22 16:28:48', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (121, '冀EL8518', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-22 16:29:09', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (122, '冀FJ0831', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-22 16:29:30', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (123, '冀FK 5735', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-22 16:29:49', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (124, '冀FL5908', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-22 16:30:10', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (125, '冀EK7227', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-22 16:30:42', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (126, '冀FJ9892', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-22 16:31:03', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (127, '冀FR9151', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-22 16:31:23', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (128, '冀FL 9685', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-22 16:31:40', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (129, '冀FK4359', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-22 16:31:57', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (130, '冀FL0787', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-22 16:32:20', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (131, '冀FL1293', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-22 16:32:38', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (132, '冀FH1428', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-22 16:32:58', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (133, '冀FK3212', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-22 16:33:19', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (134, '冀FL3613', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-22 16:33:36', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (135, '冀FK8651', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-22 16:33:53', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (136, '冀FL6843', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-22 16:34:10', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (137, '冀FL2220', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-22 16:37:05', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (138, '冀FJ2379', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-22 16:37:28', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (139, '冀FM8708', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-22 17:39:26', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (140, '冀FM8708', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-22 17:51:58', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (141, '冀FN1350', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-22 17:52:20', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (142, '冀FN1385', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-22 17:52:36', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (143, '冀FM5182', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-22 17:52:58', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (144, '冀FM6058', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-22 17:53:15', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (145, '冀FM3924', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-22 17:53:30', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (146, '冀FK2932', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-22 17:53:48', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (147, '冀FK8363', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-22 17:54:07', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (148, '冀FL8958', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-22 17:54:42', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (149, '冀FL8790', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-22 17:55:02', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (150, '冀TW6199', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-22 17:55:58', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (151, '冀FK2208', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-22 17:56:32', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (152, '冀FM5670', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-22 17:57:02', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (153, '冀FK2932', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-22 17:57:24', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (154, '冀FN2702', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-22 17:57:55', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (155, '冀FL5908', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-22 18:16:42', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (156, '冀FK9151', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-22 18:17:09', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (157, '冀FM1186', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-22 18:17:30', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (158, '冀FM1830', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-22 18:17:51', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (159, '冀FM3271', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-22 18:18:16', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (160, '冀FK5890', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-22 18:18:37', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (161, '冀FK8363', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-22 18:18:55', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (162, '冀FM6058', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-22 18:19:17', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (163, '冀FM5182', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-22 18:19:41', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (164, '冀FJ0831', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-22 18:25:12', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (165, '冀FJ9892', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-22 18:25:29', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (166, '冀FH4073', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-22 18:25:49', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (167, '冀EL2210', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-22 18:26:08', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (168, '冀EL1972', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-22 18:26:26', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (169, '冀FK5735', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-22 18:26:48', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (170, '冀EM7696', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 08:30:37', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (171, '冀EL8518', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 08:30:53', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (172, '冀EH5716', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 08:31:10', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (173, '冀ATJ693', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 08:31:31', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (174, '冀ATG105', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 08:31:49', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (175, '冀AKT982', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 08:32:19', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (176, '冀ATG768', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 08:32:36', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (177, '冀A3355Z', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 08:33:00', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (178, '冀ATK677', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 08:33:22', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (179, '冀A4769Z', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 08:33:43', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (180, '冀FJ9892', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 08:34:02', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (181, '冀FJ0831', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 08:34:25', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (182, '冀FK5735', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 08:34:45', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (183, '冀ATF425', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 08:35:05', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (184, '冀ABC662', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 08:35:33', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (185, '冀ATJ966', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 08:35:52', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (186, '冀FK2932', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 08:36:11', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (187, '冀FK8363', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 08:36:32', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (188, '冀EL8518', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 08:36:55', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (189, '冀FM3271', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 08:37:12', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (190, '冀EM7696', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 08:37:30', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (191, '冀FL5908', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 08:37:47', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (192, '冀FK9151', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 08:38:08', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (193, '冀FL6899', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 08:38:28', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (194, '冀FM5506', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 08:38:47', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (195, '冀FM6316', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 08:39:03', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (196, '冀FL6899', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 08:39:20', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (197, '冀FM6497', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 08:39:38', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (198, '冀FM6316', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 08:39:59', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (199, '冀FM5506', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 08:40:19', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (200, '冀FL6899', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 08:40:35', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (201, '冀FL3560', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 08:40:52', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (202, '冀FK8363', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 09:20:45', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (203, '冀ATH44', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 09:53:04', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (204, '冀FK8363', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 09:53:19', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (205, '冀FK2932', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 09:53:36', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (206, '冀FM3924', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 09:53:52', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (207, '冀ATK165', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 09:54:11', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (208, '冀ATG458', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 09:57:48', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (209, '冀ABC613', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 09:58:06', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (210, '冀FN1185', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 09:58:25', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (211, '冀FD8107', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 09:58:42', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (212, '冀A92704', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 09:59:28', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (213, '冀FK2573', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 09:59:43', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (214, '冀FK4259', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 09:59:57', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (215, '冀FH1428', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 10:00:11', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (216, '冀ATF661', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 10:00:29', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (217, '冀FK4359', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 10:00:45', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (218, '冀AV8540', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 10:00:59', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (219, '冀FK5113', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 10:12:41', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (220, '冀FK4055', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 10:12:59', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (221, '冀FL6891', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 10:13:13', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (222, '冀FM4757', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 10:13:28', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (223, '冀FM6477', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 10:13:44', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (224, '冀FM1334', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 10:13:57', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (225, '冀FL8204', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 10:14:13', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (226, '冀FL1293', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 10:14:28', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (227, '冀FM6457', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 10:14:43', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (228, '冀FK677', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 10:14:58', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (229, '冀A4769Z', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 10:15:18', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (230, '冀AQ6606', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 10:15:33', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (231, '冀ABD802', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 10:15:49', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (232, '冀FK9939', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 10:16:04', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (233, '冀FM0898', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 10:16:17', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (234, '冀ATJ020', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 10:16:36', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (235, '冀ATJ055', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 10:16:50', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (236, '冀ATG695', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 10:17:09', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (237, '冀A4707Z', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 10:17:28', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (238, '冀A55546Y', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 10:17:49', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (239, '冀ATK066', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 10:18:09', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (240, '冀ATF425', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 10:18:32', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (241, '冀ABC662', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 10:18:54', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (242, '冀FL5934', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 10:19:12', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (243, '冀FK8363', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 10:19:37', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (244, '冀FK2932', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 10:19:54', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (245, '冀FL5222', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 15:57:31', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (246, '冀FM3399', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 15:58:03', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (247, '冀FL3438', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 15:58:17', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (248, '冀FL5447', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 15:58:32', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (249, '冀FM6472', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 15:58:47', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (250, '冀FM3611', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 15:59:05', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (251, '冀FL8344', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 15:59:19', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (252, '冀FH9016', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 15:59:34', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (253, '冀ATK139', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 15:59:50', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (254, '冀FM3271', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 16:00:04', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (255, '冀A8741U', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 16:00:24', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (256, '冀ATH919', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 16:00:39', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (257, '冀ATG436', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 16:00:57', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (258, '冀ATG482', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 16:01:15', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (259, '冀AY6175', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 16:01:33', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (260, '冀FM6457', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 16:01:49', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (261, '冀FM5230', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 16:02:22', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (262, '冀FM5506', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 16:02:45', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (263, '冀FK2932', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 16:03:02', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (264, '冀AV6253', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 16:03:20', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (265, '冀FL4177', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 16:03:37', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (266, '冀FJ0831', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 16:03:56', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (267, '冀FM1438', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 16:04:11', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (268, '冀FN2580', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 16:04:30', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (269, '冀FM4776', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 16:04:44', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (270, '冀FM4779', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 16:04:59', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (271, '冀FK5735', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 16:05:17', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (272, '冀ATJ055', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 16:30:00', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (273, '冀ATG695', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 16:30:17', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (274, '冀ATJ020', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 16:30:32', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (275, '冀ATH127', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 16:30:46', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (276, '冀FJ5630', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 16:31:03', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (277, '冀FM1224', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 16:31:25', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (278, '冀ABD956', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 16:31:38', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (279, '冀AKU833', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 16:31:56', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (280, '冀ATF817', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 16:32:15', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (281, '冀FN0892', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 16:32:30', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (282, '冀FM6477', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 16:41:02', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (283, '冀FM3924', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 16:41:15', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (284, '冀FL5908', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 16:41:30', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (285, '冀FM6497', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 16:41:45', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (286, '冀FM5196', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 16:42:00', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (287, '冀FM4163', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 16:42:15', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (288, '冀FJ9892', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 16:42:36', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (289, '冀FM4755', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 16:42:50', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (290, '冀FM6751', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 16:43:05', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (291, '冀FM4757', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 16:43:20', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (292, '冀FL8790', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 16:43:33', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (293, '冀FL2307', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 16:43:47', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (294, '冀FL1293', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 16:44:05', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (295, '冀FL8958', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 16:44:20', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (296, '冀FK8363', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 16:44:36', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (297, '冀FK9151', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 16:44:51', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (298, '冀ABC596', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-23 16:45:08', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (299, '冀JU1599', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-24 08:53:19', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (300, '冀GE1161', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-24 08:53:41', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (301, '冀GE6369', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-24 08:54:02', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (302, '冀GE6368', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-24 08:54:22', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (303, '冀GC8377', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-24 08:54:44', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (304, '冀GE1548', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-24 08:55:01', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (305, '晋B99278', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-24 10:10:37', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (306, '晋BA5130', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-24 10:10:59', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (307, '晋B95874', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-24 10:11:16', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (308, '津A23110', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-24 10:11:39', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (309, '冀GT1773', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-24 10:11:57', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (310, '冀JW7527', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-24 10:12:15', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (311, '晋B91167', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-24 10:12:32', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (312, '晋B97165', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-24 10:12:52', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (313, '晋BA3095', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-24 10:13:12', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (314, '冀JM0629', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-24 10:13:34', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (315, '冀CE8203', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-24 10:13:53', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (316, '津Z0285', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-24 10:14:46', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (317, '津AY0935', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-24 10:15:07', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (318, '津C03330', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-24 10:15:29', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (319, '津C03166', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-24 10:15:47', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (320, '津C01280', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-24 10:16:04', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (321, '津AZ0223', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-24 10:16:24', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (322, '津AY1265', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-24 10:16:42', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (323, '津C12930', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-24 10:16:58', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (324, '冀FM6316', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-24 10:17:17', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (325, '冀A82958', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-24 10:17:35', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (326, '冀A00258', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-24 10:17:52', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (327, '冀ATJ312', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-24 10:18:12', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (328, '冀ATK399', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-24 10:18:29', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (329, '冀FL5934', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-24 10:18:47', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (330, '冀FM5196', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-24 10:19:02', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (331, '冀FM5230', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-24 10:19:16', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (332, '晋B98006', '自卸车', '第三方', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2017-08-24 10:19:44', 135, 1);
INSERT INTO `tb_fleet_car` VALUES (333, '车辆甲', '爬梯车', '自有', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '[null]', '[null]', '', '2018-12-23 01:45:06', 261, 1);
COMMIT;

-- ----------------------------
-- Table structure for tb_fleet_driver
-- ----------------------------
DROP TABLE IF EXISTS `tb_fleet_driver`;
CREATE TABLE `tb_fleet_driver` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '姓名',
  `sex` varchar(10) DEFAULT NULL,
  `phone` varchar(20) NOT NULL COMMENT '手机号',
  `fk_user_id` int(11) DEFAULT '123456' COMMENT '司机用户表外键',
  `is_sms` tinyint(4) DEFAULT '1' COMMENT '是否短信通知司机',
  `idcard` varchar(255) DEFAULT NULL COMMENT '身份证号码',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `hometown` varchar(255) DEFAULT NULL COMMENT '籍贯',
  `remark` text,
  `time` datetime DEFAULT NULL,
  `belong_user_id` int(11) DEFAULT NULL COMMENT '所属用户的ID',
  `bank_number` varchar(255) DEFAULT NULL COMMENT '银行卡号',
  `bank_addr` varchar(255) DEFAULT NULL COMMENT '开户行',
  `visible` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_fleet_driver
-- ----------------------------
BEGIN;
INSERT INTO `tb_fleet_driver` VALUES (34, '王昆仑', '男', '18949821385', 130, 0, '', '', '', '', '2017-08-06 12:31:19', 129, '123213', '213213', 0);
INSERT INTO `tb_fleet_driver` VALUES (35, '王昆仑', '男', '18949821385', 131, 0, '', '', '', '', '2017-08-06 12:32:00', 129, '123', '123', 1);
INSERT INTO `tb_fleet_driver` VALUES (36, '董先生', '男', '18656301000', 132, 1, '', '', '', '', '2017-08-07 02:32:30', 127, '6217751323000007592', '徽商银行池州江南集中区支行', 0);
INSERT INTO `tb_fleet_driver` VALUES (37, '为空', '男', '12879784544', 136, 0, '', '', '', '', '2017-08-11 14:59:30', 129, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (38, '效应', '男', '18949821366', 137, 0, '', '', '', '', '2017-08-11 16:44:52', 129, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (39, '苏亚军', '男', '13831257926', 138, 0, '', '', '', '', '2017-08-22 09:56:03', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (40, '郑路明', '男', '17332221222', 139, 0, '', '', '', '', '2017-08-22 11:48:21', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (41, '王栓', '男', '13603126156', 140, 0, '', '', '', '', '2017-08-22 11:48:55', 135, '', '', 0);
INSERT INTO `tb_fleet_driver` VALUES (42, '陈晓亮', '男', '15033215688', 141, 0, '', '', '', '', '2017-08-22 14:27:52', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (43, '李保军', '男', '13831285448', 142, 0, '', '', '', '', '2017-08-22 14:28:20', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (44, '胡亭会', '男', '17325287692', 143, 0, '', '', '', '', '2017-08-22 14:28:43', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (45, '候存', '男', '13731271833', 144, 0, '', '', '', '', '2017-08-22 14:29:03', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (46, '王金明', '男', '17360738886', 145, 0, '', '', '', '', '2017-08-22 14:29:26', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (47, '李志刚', '男', '17325287861', 146, 0, '', '', '', '', '2017-08-22 14:29:46', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (48, '赵志峰', '男', '13400331196', 147, 0, '', '', '', '', '2017-08-22 14:30:10', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (49, '古宾宾', '男', '17325215686', 148, 0, '', '', '', '', '2017-08-22 14:30:45', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (50, '王占海', '男', '18630298513', 149, 0, '', '', '', '', '2017-08-22 14:31:29', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (51, '范晓雷', '男', '17713222610', 150, 0, '', '', '', '', '2017-08-22 14:31:48', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (52, '曹红亮', '男', '13930844523', 151, 0, '', '', '', '', '2017-08-22 14:32:44', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (53, '王彦云', '男', '13822282819', 152, 0, '', '', '', '', '2017-08-22 14:33:32', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (54, '王永', '男', '13613326482', 153, 0, '', '', '', '', '2017-08-22 14:39:08', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (55, '王栓', '男', '13603126156', 154, 0, '', '', '', '', '2017-08-22 16:16:05', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (56, '吉彦杰', '男', '13930213296', 155, 0, '', '', '', '', '2017-08-22 16:16:54', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (57, '汪聪聪', '男', '13931375622', 156, 0, '', '', '', '', '2017-08-22 16:17:35', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (58, '李士灵', '男', '13315936159', 157, 0, '', '', '', '', '2017-08-22 16:18:15', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (59, '苗少喆', '男', '18132922815', 158, 0, '', '', '', '', '2017-08-22 16:18:56', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (60, '卫增强', '男', '18733963206', 159, 0, '', '', '', '', '2017-08-22 16:19:27', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (61, '齐新强', '男', '13785242163', 160, 0, '', '', '', '', '2017-08-22 16:19:57', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (62, '齐云立', '男', '15631233868', 161, 0, '', '', '', '', '2017-08-22 16:20:25', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (63, '张献峰', '男', '18203195900', 162, 0, '', '', '', '', '2017-08-22 16:21:05', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (64, '肖本军', '男', '15803121538', 163, 0, '', '', '', '', '2017-08-22 16:21:30', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (65, '薛永禄', '男', '13483245626', 164, 0, '', '', '', '', '2017-08-22 16:22:19', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (66, '郭艳辉', '男', '15832232149', 165, 0, '', '', '', '', '2017-08-22 16:22:38', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (67, '吉大军', '男', '13931390872', 166, 0, '', '', '', '', '2017-08-22 16:23:02', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (68, '张伟花', '男', '13582230780', 167, 0, '', '', '', '', '2017-08-22 16:23:31', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (69, '孙建增', '男', '13833230532', 168, 0, '', '', '', '', '2017-08-22 16:23:51', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (70, '孙秋旭', '男', '13399229771', 169, 0, '', '', '', '', '2017-08-22 16:24:32', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (71, '闫峰', '男', '17717708097', 170, 0, '', '', '', '', '2017-08-22 16:24:52', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (72, '孙小海', '男', '15833864626', 171, 0, '', '', '', '', '2017-08-22 16:25:28', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (73, '赵贺清', '男', '15303122829', 172, 0, '', '', '', '', '2017-08-22 17:39:00', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (74, '翟桂余', '男', '13832260253', 173, 0, '', '', '', '', '2017-08-22 17:47:25', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (75, '崔秀启', '男', '13831209386', 174, 0, '', '', '', '', '2017-08-22 17:48:16', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (76, '高永红', '男', '17830201170', 175, 0, '', '', '', '', '2017-08-22 17:48:51', 135, '', '', 0);
INSERT INTO `tb_fleet_driver` VALUES (77, '高永红', '男', '17831020170', 176, 0, '', '', '', '', '2017-08-22 17:49:37', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (78, '崔宗宝', '男', '13803230376', 177, 0, '', '', '', '', '2017-08-22 17:49:59', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (79, '刘士超', '男', '15930210101', 178, 0, '', '', '', '', '2017-08-22 17:50:44', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (80, '李兴山', '男', '13833484571', 179, 0, '', '', '', '', '2017-08-22 17:51:22', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (81, '邓红立', '男', '15176291333', 180, 0, '', '', '', '', '2017-08-22 18:15:18', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (82, '赵素立', '男', '18931961558', 181, 0, '', '', '', '', '2017-08-22 18:16:02', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (83, '梁松', '男', '17758838281', 182, 0, '', '', '', '', '2017-08-23 08:26:06', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (84, '陈旺', '男', '15032736979', 183, 0, '', '', '', '', '2017-08-23 08:26:29', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (85, '梁建刚', '男', '18032120318', 184, 0, '', '', '', '', '2017-08-23 08:26:47', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (86, '申红伟', '男', '15830977569', 185, 0, '', '', '', '', '2017-08-23 08:27:47', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (87, '刘佩先', '男', '18131105689', 186, 0, '', '', '', '', '2017-08-23 08:28:18', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (88, '关红娟', '男', '15350595382', 187, 0, '', '', '', '', '2017-08-23 08:28:39', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (89, '路然', '男', '13733214704', 188, 0, '', '', '', '', '2017-08-23 08:29:05', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (90, '郭二亮', '男', '15075410519', 189, 0, '', '', '', '', '2017-08-23 08:29:25', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (91, '赵玉昆', '男', '15131678666', 190, 0, '', '', '', '', '2017-08-23 08:29:49', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (92, '赵红亮', '男', '18232176166', 191, 0, '', '', '', '', '2017-08-23 08:46:01', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (93, '张长均', '男', '15930184998', 192, 0, '', '', '', '', '2017-08-23 09:47:29', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (94, '张涛伟', '男', '13784334457', 193, 0, '', '', '', '', '2017-08-23 09:47:53', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (95, '严彦宾', '男', '18733161255', 194, 0, '', '', '', '', '2017-08-23 09:48:46', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (96, '梁红昌', '男', '13930462698', 195, 0, '', '', '', '', '2017-08-23 09:49:20', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (97, '张旭红', '男', '15128246488', 196, 0, '', '', '', '', '2017-08-23 09:49:36', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (98, '张金刚', '男', '13832122919', 197, 0, '', '', '', '', '2017-08-23 09:50:53', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (99, '吉帅', '男', '13733323581', 198, 0, '', '', '', '', '2017-08-23 09:51:22', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (100, '梁二喜', '男', '15032075887', 199, 0, '', '', '', '', '2017-08-23 09:52:17', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (101, '梁乐乐', '男', '15130650881', 200, 0, '', '', '', '', '2017-08-23 09:52:41', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (102, '康占亚', '男', '13933212091', 201, 0, '', '', '', '', '2017-08-23 10:08:19', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (103, '郭尚清', '男', '15100324444', 202, 0, '', '', '', '', '2017-08-23 10:08:44', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (104, '郭明霞', '男', '15075189905', 203, 0, '', '', '', '', '2017-08-23 10:09:15', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (105, '崔彦祥', '男', '15030158993', 204, 0, '', '', '', '', '2017-08-23 10:09:35', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (106, '张辉华', '男', '13582126272', 205, 0, '', '', '', '', '2017-08-23 10:10:13', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (107, '张中立', '男', '13933120413', 206, 0, '', '', '', '', '2017-08-23 10:10:30', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (108, '赵立兵', '男', '18333188937', 207, 0, '', '', '', '', '2017-08-23 10:11:00', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (109, '张景徐', '男', '13933887268', 208, 0, '', '', '', '', '2017-08-23 10:11:23', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (110, '张中华', '男', '13582136282', 209, 0, '', '', '', '', '2017-08-23 10:11:40', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (111, '张鹏飞', '男', '15027705810', 210, 0, '', '', '', '', '2017-08-23 10:11:57', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (112, '李连合', '男', '13832233006', 211, 0, '', '', '', '', '2017-08-23 15:48:57', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (113, '刘艳芳', '女', '18631238507', 212, 0, '', '', '', '', '2017-08-23 15:49:26', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (114, '王来旺', '男', '13503388233', 213, 0, '', '', '', '', '2017-08-23 15:49:58', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (115, '崔大兵', '男', '15231288288', 214, 0, '', '', '', '', '2017-08-23 15:50:19', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (116, '李作福', '男', '18333297108', 215, 0, '', '', '', '', '2017-08-23 15:50:41', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (117, '张海江', '男', '15232175338', 216, 0, '', '', '', '', '2017-08-23 15:50:59', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (118, '岳月分', '男', '15027716299', 217, 0, '', '', '', '', '2017-08-23 15:51:54', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (119, '金力华', '男', '15533615683', 218, 0, '', '', '', '', '2017-08-23 15:52:28', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (120, '孙彦茹', '女', '15075121491', 219, 0, '', '', '', '', '2017-08-23 15:53:11', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (121, '严军艳', '男', '18332133350', 220, 0, '', '', '', '', '2017-08-23 15:53:50', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (122, '杨九花', '女', '15128175737', 221, 0, '', '', '', '', '2017-08-23 15:54:25', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (123, '樊茂生', '男', '18703211330', 222, 0, '', '', '', '', '2017-08-23 15:55:00', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (124, '高雪宾', '男', '13833092333', 223, 0, '', '', '', '', '2017-08-23 15:55:55', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (125, '李雪敏', '男', '15833339354', 224, 0, '', '', '', '', '2017-08-23 15:56:40', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (126, '崔战斌', '男', '15903123861', 225, 0, '', '', '', '', '2017-08-23 16:07:19', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (127, '张雷晨', '男', '13933808394', 226, 0, '', '', '', '', '2017-08-23 16:26:28', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (128, '李正强', '男', '13582076305', 227, 0, '', '', '', '', '2017-08-23 16:26:47', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (129, '刘雷芳', '男', '13731487054', 228, 0, '', '', '', '', '2017-08-23 16:27:06', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (130, '赵光辉', '男', '15830105401', 229, 0, '', '', '', '', '2017-08-23 16:27:34', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (131, '鲍立强', '男', '13933836832', 230, 0, '', '', '', '', '2017-08-23 16:28:24', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (132, '周红印', '男', '13473881538', 231, 0, '', '', '', '', '2017-08-23 16:28:41', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (133, '姚对伟', '男', '13333024387', 232, 0, '', '', '', '', '2017-08-23 16:38:57', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (134, '高永红', '男', '13833090529', 233, 0, '', '', '', '', '2017-08-23 16:39:43', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (135, '夏志娟', '男', '13603280629', 234, 0, '', '', '', '', '2017-08-23 16:40:07', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (136, '张金贵', '男', '13832308983', 235, 0, '', '', '', '', '2017-08-23 16:40:32', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (137, '臧大永', '男', '13733262908', 236, 0, '', '', '', '', '2017-08-24 08:49:50', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (138, '石晶', '男', '18713370966', 237, 0, '', '', '', '', '2017-08-24 08:50:26', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (139, '张小勇', '男', '13831375133', 238, 0, '', '', '', '', '2017-08-24 08:50:51', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (140, '阮海江', '男', '13473334001', 239, 0, '', '', '', '', '2017-08-24 08:51:22', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (141, '李奋军', '男', '13730432566', 240, 0, '', '', '', '', '2017-08-24 08:52:19', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (142, '张玉洁', '男', '13934839800', 241, 0, '', '', '', '', '2017-08-24 10:05:19', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (143, '谷威清', '男', '13934930706', 242, 0, '', '', '', '', '2017-08-24 10:05:56', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (144, '王君', '男', '13720073110', 243, 0, '', '', '', '', '2017-08-24 10:06:19', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (145, '尹增光', '男', '15369766669', 244, 0, '', '', '', '', '2017-08-24 10:06:41', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (146, '许孝刚', '男', '13593042444', 245, 0, '', '', '', '', '2017-08-24 10:07:13', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (147, '谷威波', '男', '18334954449', 246, 0, '', '', '', '', '2017-08-24 10:07:58', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (148, '王志永', '男', '13820055572', 247, 0, '', '', '', '', '2017-08-24 10:08:23', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (149, '张辉桥', '男', '13831189825', 248, 0, '', '', '', '', '2017-08-24 10:09:21', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (150, '李景忠', '男', '13934905595', 249, 0, '', '', '', '', '2017-08-24 10:10:01', 135, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (151, '王昆仑1', '男', '18949821384', 254, 0, '341282199104260233', '', '', '', '2018-08-16 09:57:38', 129, '6217856300009682629', '中国银行', 1);
INSERT INTO `tb_fleet_driver` VALUES (152, '司机甲', '男', '13800138000', 262, 0, '', '', '', '', '2018-12-23 01:44:45', 261, '', '', 1);
INSERT INTO `tb_fleet_driver` VALUES (153, '司机乙', '男', '13800138001', 263, 0, '', '', '', '', '2018-12-23 01:49:56', 261, '', '', 1);
COMMIT;

-- ----------------------------
-- Table structure for tb_fleet_driver_license
-- ----------------------------
DROP TABLE IF EXISTS `tb_fleet_driver_license`;
CREATE TABLE `tb_fleet_driver_license` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_driver_id` int(11) NOT NULL COMMENT '司机表外键',
  `number` varchar(50) NOT NULL COMMENT '驾驶证号码',
  `level` varchar(50) NOT NULL COMMENT '驾驶证级别',
  `valid_time` date DEFAULT NULL COMMENT '有效日期',
  `unvalid_time` date DEFAULT NULL COMMENT '有效日期止',
  `pass_time` date DEFAULT NULL COMMENT '驾照考取日',
  `work_license` varchar(100) DEFAULT NULL COMMENT '从业资格证号码',
  `ic_number` varchar(100) DEFAULT NULL COMMENT 'IC卡号',
  `files` varchar(5000) DEFAULT NULL COMMENT '附件列表',
  `time` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tb_fleet_license
-- ----------------------------
DROP TABLE IF EXISTS `tb_fleet_license`;
CREATE TABLE `tb_fleet_license` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(50) NOT NULL COMMENT '证件编号',
  `type` varchar(50) NOT NULL COMMENT '证件类型',
  `pass_time` date DEFAULT NULL COMMENT '办证日期',
  `valid_date` date DEFAULT NULL COMMENT '有效日期',
  `unvalide_date` date DEFAULT NULL COMMENT '有效日期止',
  `files` varchar(5000) DEFAULT NULL COMMENT '附件',
  `fk_driver_id` int(11) DEFAULT NULL,
  `fk_car_id` int(11) DEFAULT NULL,
  `remark` text COMMENT '备注',
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tb_order
-- ----------------------------
DROP TABLE IF EXISTS `tb_order`;
CREATE TABLE `tb_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_number` varchar(255) DEFAULT NULL COMMENT '订单号',
  `serial_number` varchar(255) DEFAULT NULL COMMENT '流水号',
  `fk_customer_id` int(11) DEFAULT NULL COMMENT '下单的客户',
  `is_company` tinyint(4) DEFAULT '0' COMMENT '是否指定物流公司',
  `fk_want_company_id` int(11) DEFAULT NULL COMMENT '客户指定接单的物流公司',
  `fk_company_id` int(11) DEFAULT NULL COMMENT '接单的物流公司',
  `status` varchar(255) DEFAULT NULL COMMENT '订单状态，关联status表',
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=476 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_order
-- ----------------------------
BEGIN;
INSERT INTO `tb_order` VALUES (213, '20170804175158033', '150184031077358033', 127, 0, NULL, NULL, 'ORDER_PLACE', '2017-08-04 09:51:51');
INSERT INTO `tb_order` VALUES (214, '20170804175477314', '150184049547877314', 127, 0, NULL, NULL, 'ORDER_PLACE', '2017-08-04 09:54:55');
INSERT INTO `tb_order` VALUES (216, '20170807103463303', '150207325626187536', 127, 0, NULL, 135, 'ORDER_SIGN', '2017-08-06 02:34:16');
INSERT INTO `tb_order` VALUES (217, '20170804175158033', '150184031077358033', 127, 0, NULL, NULL, 'ORDER_PLACE', '2017-08-07 16:56:40');
INSERT INTO `tb_order` VALUES (221, '20170809151130525', '150226269036830525', 127, 0, NULL, NULL, 'ORDER_PLACE', '2017-08-09 15:11:30');
INSERT INTO `tb_order` VALUES (225, '20170816153925546', '150286918527425546', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-16 15:39:45');
INSERT INTO `tb_order` VALUES (226, '20170816154388836', '150286939240988836', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-16 15:43:12');
INSERT INTO `tb_order` VALUES (227, '20170816154512686', '150286952482512686', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-16 15:45:25');
INSERT INTO `tb_order` VALUES (228, '20170816154741255', '150286964963841255', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-16 15:47:30');
INSERT INTO `tb_order` VALUES (229, '20170816154936300', '150286975583136300', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-16 15:49:16');
INSERT INTO `tb_order` VALUES (230, '20170816155141025', '150286989526541025', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-16 15:51:35');
INSERT INTO `tb_order` VALUES (231, '20170816155464348', '150287006256764348', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-16 15:54:23');
INSERT INTO `tb_order` VALUES (232, '20170816155877081', '150287033802377081', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-16 15:58:58');
INSERT INTO `tb_order` VALUES (233, '20170816160036755', '150287044352336755', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-16 16:00:44');
INSERT INTO `tb_order` VALUES (234, '20170816160240262', '150287054915540262', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-16 16:02:29');
INSERT INTO `tb_order` VALUES (235, '20170816160412101', '150287064496812101', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-16 16:04:05');
INSERT INTO `tb_order` VALUES (236, '20170816160678668', '150287077579778668', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-16 16:06:16');
INSERT INTO `tb_order` VALUES (237, '20170816160788004', '150287087375888004', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-16 16:07:54');
INSERT INTO `tb_order` VALUES (238, '20170816160941824', '150287096617041824', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-16 16:09:26');
INSERT INTO `tb_order` VALUES (240, '20170816163587243', '150287255056287243', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-16 16:35:51');
INSERT INTO `tb_order` VALUES (241, '20170816163814583', '150287273357914583', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-16 16:38:54');
INSERT INTO `tb_order` VALUES (243, '20170816164337186', '150287302675937186', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-16 16:43:47');
INSERT INTO `tb_order` VALUES (244, '20170816164603623', '150287317352803623', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-16 16:46:14');
INSERT INTO `tb_order` VALUES (245, '20170816164931544', '150287335882531544', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-16 16:49:19');
INSERT INTO `tb_order` VALUES (246, '20170816165127406', '150287346155127406', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-16 16:51:02');
INSERT INTO `tb_order` VALUES (247, '20170816165262472', '150287355621462472', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-16 16:52:36');
INSERT INTO `tb_order` VALUES (248, '20170816165422174', '150287367779122174', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-16 16:54:38');
INSERT INTO `tb_order` VALUES (249, '20170816165653086', '150287377170757346', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-16 16:56:12');
INSERT INTO `tb_order` VALUES (250, '20170816165714043', '150287385710214043', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-16 16:57:37');
INSERT INTO `tb_order` VALUES (251, '20170816165933474', '150287394526633474', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-16 16:59:05');
INSERT INTO `tb_order` VALUES (252, '20170816170008235', '150287402462308235', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-16 17:00:25');
INSERT INTO `tb_order` VALUES (253, '20170816170246532', '150287416779846532', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-16 17:02:48');
INSERT INTO `tb_order` VALUES (254, '20170816170465067', '150287427817165067', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-16 17:04:38');
INSERT INTO `tb_order` VALUES (255, '20170816170564513', '150287435345364513', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-16 17:05:53');
INSERT INTO `tb_order` VALUES (256, '20170816170752010', '150287443314152010', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-16 17:07:13');
INSERT INTO `tb_order` VALUES (257, '20170816170824687', '150287451359224687', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-16 17:08:34');
INSERT INTO `tb_order` VALUES (258, '20170816171060814', '150287460815560814', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-16 17:10:08');
INSERT INTO `tb_order` VALUES (259, '20170816171107487', '150287469758407487', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-16 17:11:38');
INSERT INTO `tb_order` VALUES (260, '20170816171345100', '150287480178745100', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-16 17:13:22');
INSERT INTO `tb_order` VALUES (261, '20170816171573117', '150287492124773117', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-16 17:15:21');
INSERT INTO `tb_order` VALUES (262, '20170816171657063', '150287500434857063', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-16 17:16:44');
INSERT INTO `tb_order` VALUES (263, '20170816171800117', '150287509405900117', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-16 17:18:14');
INSERT INTO `tb_order` VALUES (264, '20170816171983325', '150287518412783325', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-16 17:19:44');
INSERT INTO `tb_order` VALUES (265, '20170816172125567', '150287526121225567', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-16 17:21:01');
INSERT INTO `tb_order` VALUES (266, '20170816172274825', '150287533780974825', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-16 17:22:18');
INSERT INTO `tb_order` VALUES (268, '20170816172686708', '150287558418786708', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-16 17:26:24');
INSERT INTO `tb_order` VALUES (269, '20170816172963420', '150287576855163420', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-16 17:29:29');
INSERT INTO `tb_order` VALUES (270, '20170816173165180', '150287586542065180', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-16 17:31:05');
INSERT INTO `tb_order` VALUES (271, '20170816173288383', '150287595414688383', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-16 17:32:34');
INSERT INTO `tb_order` VALUES (272, '20170816173452840', '150287606457652840', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-16 17:34:25');
INSERT INTO `tb_order` VALUES (274, '20170816173772653', '150287623311572653', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-16 17:37:13');
INSERT INTO `tb_order` VALUES (275, '20170816173832156', '150287631077632156', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-16 17:38:31');
INSERT INTO `tb_order` VALUES (276, '20170816173978224', '150287639735978224', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-16 17:39:57');
INSERT INTO `tb_order` VALUES (277, '20170816174173580', '150287650970273580', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-16 17:41:50');
INSERT INTO `tb_order` VALUES (278, '20170816174302538', '150287658729402538', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-16 17:43:07');
INSERT INTO `tb_order` VALUES (279, '20170816174461184', '150287666546761184', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-16 17:44:25');
INSERT INTO `tb_order` VALUES (280, '20170816174544843', '150287674326244843', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-16 17:45:43');
INSERT INTO `tb_order` VALUES (281, '20170816174737302', '150287682575737302', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-16 17:47:06');
INSERT INTO `tb_order` VALUES (282, '20170817102821333', '150293692754521333', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-17 10:28:48');
INSERT INTO `tb_order` VALUES (283, '20170817103230753', '150293712481330753', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-17 10:32:05');
INSERT INTO `tb_order` VALUES (284, '20170817103342115', '150293722022742115', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-17 10:33:40');
INSERT INTO `tb_order` VALUES (285, '20170817103544545', '150293730644444545', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-17 10:35:06');
INSERT INTO `tb_order` VALUES (286, '20170817103653321', '150293740915953321', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-17 10:36:49');
INSERT INTO `tb_order` VALUES (287, '20170817103738861', '150293747903038861', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-17 10:37:59');
INSERT INTO `tb_order` VALUES (288, '20170817103906486', '150293755837483654', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-17 10:39:18');
INSERT INTO `tb_order` VALUES (289, '20170817104033557', '150293763067233557', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-17 10:40:31');
INSERT INTO `tb_order` VALUES (290, '20170817104288402', '150293773660988402', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-17 10:42:17');
INSERT INTO `tb_order` VALUES (292, '20170817104680208', '150293796660780208', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-17 10:46:07');
INSERT INTO `tb_order` VALUES (293, '20170817104747312', '150293805602847312', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-17 10:47:36');
INSERT INTO `tb_order` VALUES (294, '20170817104874412', '150293812571278672', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-17 10:48:46');
INSERT INTO `tb_order` VALUES (295, '20170817105043446', '150293822296643446', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-17 10:50:23');
INSERT INTO `tb_order` VALUES (296, '20170817105117001', '150293829239717001', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-17 10:51:32');
INSERT INTO `tb_order` VALUES (297, '20170817105273485', '150293836612673485', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-17 10:52:46');
INSERT INTO `tb_order` VALUES (298, '20170817105426888', '150293847611626888', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-17 10:54:36');
INSERT INTO `tb_order` VALUES (299, '20170817105571467', '150293854608871467', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-17 10:55:46');
INSERT INTO `tb_order` VALUES (300, '20170817105631270', '150293861176631270', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-17 10:56:52');
INSERT INTO `tb_order` VALUES (301, '20170817105827785', '150293870230227785', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-17 10:58:22');
INSERT INTO `tb_order` VALUES (302, '20170817105972077', '150293878743472077', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-17 10:59:47');
INSERT INTO `tb_order` VALUES (303, '20170817110170574', '150293886296870574', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-17 11:01:03');
INSERT INTO `tb_order` VALUES (304, '20170817110207647', '150293894238107647', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-17 11:02:22');
INSERT INTO `tb_order` VALUES (305, '20170817110300543', '150293901453600543', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-17 11:03:35');
INSERT INTO `tb_order` VALUES (306, '20170817110436052', '150293908898136052', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-17 11:04:49');
INSERT INTO `tb_order` VALUES (307, '20170817110614803', '150293916076501161', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-17 11:06:01');
INSERT INTO `tb_order` VALUES (308, '20170817110777860', '150293924084677860', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-17 11:07:21');
INSERT INTO `tb_order` VALUES (309, '20170817110844113', '150293930830644113', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-17 11:08:28');
INSERT INTO `tb_order` VALUES (310, '20170817110905688', '150293938989505688', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-17 11:09:50');
INSERT INTO `tb_order` VALUES (311, '20170817111170635', '150293946265070635', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-17 11:11:03');
INSERT INTO `tb_order` VALUES (312, '20170817111244507', '150293953994444507', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-17 11:12:20');
INSERT INTO `tb_order` VALUES (313, '20170817111652777', '150293981440052777', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-17 11:16:54');
INSERT INTO `tb_order` VALUES (314, '20170817111804521', '150293988582904521', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-17 11:18:06');
INSERT INTO `tb_order` VALUES (315, '20170817111928207', '150293995711828207', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-17 11:19:17');
INSERT INTO `tb_order` VALUES (316, '20170817112078587', '150294002855478587', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-17 11:20:29');
INSERT INTO `tb_order` VALUES (317, '20170817112113355', '150294009007013355', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-17 11:21:30');
INSERT INTO `tb_order` VALUES (318, '20170817112233815', '150294015484133815', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-17 11:22:35');
INSERT INTO `tb_order` VALUES (319, '20170817112336642', '150294021675636642', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-17 11:23:37');
INSERT INTO `tb_order` VALUES (320, '20170817112458742', '150294028799358742', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-17 11:24:48');
INSERT INTO `tb_order` VALUES (321, '20170817112561880', '150294035628261880', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-17 11:25:56');
INSERT INTO `tb_order` VALUES (322, '20170817112700863', '150294043672600863', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-17 11:27:17');
INSERT INTO `tb_order` VALUES (323, '20170817112884257', '150294050801084257', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-17 11:28:28');
INSERT INTO `tb_order` VALUES (324, '20170817112921445', '150294058396221445', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-17 11:29:44');
INSERT INTO `tb_order` VALUES (325, '20170817113032332', '150294065533932332', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-17 11:30:55');
INSERT INTO `tb_order` VALUES (326, '20170817150102166', '150295326331402166', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-17 15:01:03');
INSERT INTO `tb_order` VALUES (327, '20170817150273740', '150295334663273740', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-17 15:02:27');
INSERT INTO `tb_order` VALUES (328, '20170817150361386', '150295343059361386', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-17 15:03:51');
INSERT INTO `tb_order` VALUES (329, '20170817150515264', '150295351432815264', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-17 15:05:14');
INSERT INTO `tb_order` VALUES (330, '20170817152088688', '150295443582188688', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-17 15:20:36');
INSERT INTO `tb_order` VALUES (331, '20170817152106313', '150295450441006313', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-17 15:21:44');
INSERT INTO `tb_order` VALUES (332, '20170817152208065', '150295457609208065', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-17 15:22:56');
INSERT INTO `tb_order` VALUES (333, '20170817152416502', '150295465364801852', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-17 15:24:14');
INSERT INTO `tb_order` VALUES (334, '20170817152505286', '150295472601605286', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-17 15:25:26');
INSERT INTO `tb_order` VALUES (335, '20170817152734066', '150295483006534066', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-17 15:27:10');
INSERT INTO `tb_order` VALUES (336, '20170817152807634', '150295491515007634', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-17 15:28:35');
INSERT INTO `tb_order` VALUES (337, '20170817152983146', '150295499228683146', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-17 15:29:52');
INSERT INTO `tb_order` VALUES (338, '20170817153182366', '150295507424182366', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-17 15:31:14');
INSERT INTO `tb_order` VALUES (339, '20170817153288004', '150295514469388004', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-17 15:32:25');
INSERT INTO `tb_order` VALUES (340, '20170817153316487', '150295522496816487', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-17 15:33:45');
INSERT INTO `tb_order` VALUES (341, '20170817153402734', '150295529256202734', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-17 15:34:53');
INSERT INTO `tb_order` VALUES (342, '20170817153640766', '150295536869334026', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-17 15:36:09');
INSERT INTO `tb_order` VALUES (343, '20170817153788274', '150295543801488274', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-17 15:37:18');
INSERT INTO `tb_order` VALUES (344, '20170817153866554', '150295551726966554', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-17 15:38:37');
INSERT INTO `tb_order` VALUES (345, '20170817153910385', '150295558601576445', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-17 15:39:46');
INSERT INTO `tb_order` VALUES (346, '20170817154117278', '150295567552117278', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-17 15:41:16');
INSERT INTO `tb_order` VALUES (347, '20170817154383064', '150295581014283064', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-17 15:43:30');
INSERT INTO `tb_order` VALUES (348, '20170817154726804', '150295602760526804', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-17 15:47:08');
INSERT INTO `tb_order` VALUES (349, '20170817154951510', '150295616505351510', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-17 15:49:25');
INSERT INTO `tb_order` VALUES (350, '20170817160070355', '150295680189670355', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-17 16:00:02');
INSERT INTO `tb_order` VALUES (351, '20170817160181303', '150295690971381303', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-17 16:01:50');
INSERT INTO `tb_order` VALUES (352, '20170817160352566', '150295698495952566', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-17 16:03:05');
INSERT INTO `tb_order` VALUES (353, '20170817160557054', '150295711899357054', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-17 16:05:19');
INSERT INTO `tb_order` VALUES (354, '20170817160648152', '150295718910448152', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-17 16:06:29');
INSERT INTO `tb_order` VALUES (355, '20170817160754071', '150295725855754071', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-17 16:07:39');
INSERT INTO `tb_order` VALUES (356, '20170817160854571', '150295733432054571', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-17 16:08:54');
INSERT INTO `tb_order` VALUES (357, '20170817161007677', '150295740311107677', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-17 16:10:03');
INSERT INTO `tb_order` VALUES (358, '20170817161114265', '150295747503114265', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-17 16:11:15');
INSERT INTO `tb_order` VALUES (359, '20170817161204875', '150295755121404875', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-17 16:12:31');
INSERT INTO `tb_order` VALUES (360, '20170817161422517', '150295765098922517', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-17 16:14:11');
INSERT INTO `tb_order` VALUES (361, '20170818143233808', '150303796036333808', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-18 14:32:40');
INSERT INTO `tb_order` VALUES (362, '20170818143360221', '150303802872260221', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-18 14:33:49');
INSERT INTO `tb_order` VALUES (363, '20170818143480531', '150303809150280531', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-18 14:34:52');
INSERT INTO `tb_order` VALUES (364, '20170818143670013', '150303816261270013', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-18 14:36:03');
INSERT INTO `tb_order` VALUES (365, '20170818143728658', '150303822576428658', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-18 14:37:06');
INSERT INTO `tb_order` VALUES (366, '20170818143881544', '150303829162481544', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-18 14:38:12');
INSERT INTO `tb_order` VALUES (367, '20170818143932183', '150303838966132183', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-18 14:39:50');
INSERT INTO `tb_order` VALUES (368, '20170818144170706', '150303846113570706', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-18 14:41:01');
INSERT INTO `tb_order` VALUES (369, '20170818144236325', '150303853456836325', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-18 14:42:15');
INSERT INTO `tb_order` VALUES (370, '20170818144380528', '150303860437680528', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-18 14:43:24');
INSERT INTO `tb_order` VALUES (371, '20170818144401035', '150303867610801035', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-18 14:44:36');
INSERT INTO `tb_order` VALUES (373, '20170818144741376', '150303887673841376', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-18 14:47:57');
INSERT INTO `tb_order` VALUES (374, '20170818144982442', '150303897146282442', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-18 14:49:31');
INSERT INTO `tb_order` VALUES (375, '20170818145010387', '150303903626510387', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-18 14:50:36');
INSERT INTO `tb_order` VALUES (376, '20170818145178232', '150303911512578232', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-18 14:51:55');
INSERT INTO `tb_order` VALUES (377, '20170818145307312', '150303918770707312', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-18 14:53:08');
INSERT INTO `tb_order` VALUES (378, '20170818145412063', '150303925104812063', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-18 14:54:11');
INSERT INTO `tb_order` VALUES (379, '20170818145571615', '150303932709371615', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-18 14:55:27');
INSERT INTO `tb_order` VALUES (380, '20170818145666067', '150303940932266067', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-18 14:56:49');
INSERT INTO `tb_order` VALUES (381, '20170818145733072', '150303947023433072', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-18 14:57:50');
INSERT INTO `tb_order` VALUES (382, '20170818145837253', '150303953274437253', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-18 14:58:53');
INSERT INTO `tb_order` VALUES (383, '20170818150022338', '150303963051622338', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-18 15:00:31');
INSERT INTO `tb_order` VALUES (384, '20170818150140001', '150303971386540001', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-18 15:01:54');
INSERT INTO `tb_order` VALUES (385, '20170818150416478', '150303984104416478', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-18 15:04:01');
INSERT INTO `tb_order` VALUES (386, '20170818150975001', '150304015368575001', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-18 15:09:14');
INSERT INTO `tb_order` VALUES (387, '20170818151058306', '150304022481058306', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-18 15:10:25');
INSERT INTO `tb_order` VALUES (388, '20170818151155150', '150304028617955150', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-18 15:11:26');
INSERT INTO `tb_order` VALUES (389, '20170818151240676', '150304034621040676', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-18 15:12:26');
INSERT INTO `tb_order` VALUES (390, '20170818151355015', '150304040629755015', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-18 15:13:26');
INSERT INTO `tb_order` VALUES (391, '20170818151452642', '150304047741752642', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-18 15:14:37');
INSERT INTO `tb_order` VALUES (392, '20170818151561613', '150304054628261613', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-18 15:15:46');
INSERT INTO `tb_order` VALUES (393, '20170818151714783', '150304064217814783', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-18 15:17:22');
INSERT INTO `tb_order` VALUES (394, '20170818151806135', '150304070201706135', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-18 15:18:22');
INSERT INTO `tb_order` VALUES (395, '20170818151947073', '150304076364347073', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-18 15:19:24');
INSERT INTO `tb_order` VALUES (396, '20170818152052440', '150304084528352440', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-18 15:20:45');
INSERT INTO `tb_order` VALUES (397, '20170818152224035', '150304092926124035', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-18 15:22:09');
INSERT INTO `tb_order` VALUES (398, '20170818152324131', '150304100562924131', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-18 15:23:26');
INSERT INTO `tb_order` VALUES (399, '20170818152413061', '150304107160413061', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-18 15:24:32');
INSERT INTO `tb_order` VALUES (400, '20170818152538653', '150304113642438653', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-18 15:25:36');
INSERT INTO `tb_order` VALUES (401, '20170818152724610', '150304124235124610', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-18 15:27:22');
INSERT INTO `tb_order` VALUES (402, '20170818152816727', '150304132502916727', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-18 15:28:45');
INSERT INTO `tb_order` VALUES (403, '20170818152958700', '150304139308758700', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-18 15:29:53');
INSERT INTO `tb_order` VALUES (404, '20170818153117687', '150304146289317687', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-18 15:31:03');
INSERT INTO `tb_order` VALUES (405, '20170818153221562', '150304152882021562', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-18 15:32:09');
INSERT INTO `tb_order` VALUES (406, '20170818153334015', '150304159523534015', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-18 15:33:15');
INSERT INTO `tb_order` VALUES (407, '20170818153455572', '150304165844455572', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-18 15:34:18');
INSERT INTO `tb_order` VALUES (408, '20170818153581273', '150304172062781273', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-18 15:35:21');
INSERT INTO `tb_order` VALUES (409, '20170818153681847', '150304178722681847', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-18 15:36:27');
INSERT INTO `tb_order` VALUES (410, '20170818153708830', '150304186470308830', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-18 15:37:45');
INSERT INTO `tb_order` VALUES (411, '20170818153826871', '150304193884626871', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-18 15:38:59');
INSERT INTO `tb_order` VALUES (412, '20170818154070573', '150304200398970573', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-18 15:40:04');
INSERT INTO `tb_order` VALUES (413, '20170818154106787', '150304206519306787', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-18 15:41:05');
INSERT INTO `tb_order` VALUES (414, '20170818154285687', '150304213024865605', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-18 15:42:10');
INSERT INTO `tb_order` VALUES (415, '20170818154504132', '150304231307004132', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-18 15:45:13');
INSERT INTO `tb_order` VALUES (416, '20170818154648308', '150304237383048308', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-18 15:46:14');
INSERT INTO `tb_order` VALUES (418, '20170819121816680', '150311628660116680', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-19 12:18:07');
INSERT INTO `tb_order` VALUES (419, '20170819121926228', '150311636066426228', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-19 12:19:21');
INSERT INTO `tb_order` VALUES (420, '20170819122055620', '150311642049155620', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-19 12:20:20');
INSERT INTO `tb_order` VALUES (421, '20170819122112354', '150311648766012354', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-19 12:21:28');
INSERT INTO `tb_order` VALUES (422, '20170819122288511', '150311656248888511', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-19 12:22:42');
INSERT INTO `tb_order` VALUES (423, '20170819122362082', '150311663978862082', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-19 12:24:00');
INSERT INTO `tb_order` VALUES (424, '20170819122555155', '150311670464755155', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-19 12:25:05');
INSERT INTO `tb_order` VALUES (425, '20170819122662855', '150311677412462855', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-19 12:26:14');
INSERT INTO `tb_order` VALUES (426, '20170819122752041', '150311684833052041', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-19 12:27:28');
INSERT INTO `tb_order` VALUES (427, '20170819122833617', '150311691261833617', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-19 12:28:33');
INSERT INTO `tb_order` VALUES (428, '20170822174600881', '150339516084400881', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-22 17:46:01');
INSERT INTO `tb_order` VALUES (429, '20170822180414442', '150339627726928407', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-22 18:04:37');
INSERT INTO `tb_order` VALUES (453, '20170824092807763', '150353808597004023', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-24 09:28:06');
INSERT INTO `tb_order` VALUES (454, '20170824092975374', '150353815860375374', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-24 09:29:19');
INSERT INTO `tb_order` VALUES (455, '20170824093088734', '150353822329488734', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-24 09:30:23');
INSERT INTO `tb_order` VALUES (456, '20170824093120271', '150353828872620271', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-24 09:31:29');
INSERT INTO `tb_order` VALUES (457, '20170824094774884', '150353927972674884', 250, 0, NULL, 135, 'ORDER_TAKING', '2017-08-24 09:48:00');
INSERT INTO `tb_order` VALUES (472, '20170921161201886', '150598155994276852', 252, 0, -1, 261, 'ORDER_TAKING', '2017-09-21 16:12:40');
INSERT INTO `tb_order` VALUES (473, '20170921161327757', '150598163652327757', 252, 0, -1, 129, 'ORDER_TAKING', '2017-09-21 16:13:57');
INSERT INTO `tb_order` VALUES (474, '20170921171758741', '150598546836658741', 252, 1, 135, NULL, 'ORDER_PLACE', '2017-09-21 17:17:48');
INSERT INTO `tb_order` VALUES (475, '20170921172944886', '150598614831144886', 252, 1, 135, NULL, 'ORDER_PLACE', '2017-09-21 17:29:08');
COMMIT;

-- ----------------------------
-- Table structure for tb_order_contract
-- ----------------------------
DROP TABLE IF EXISTS `tb_order_contract`;
CREATE TABLE `tb_order_contract` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_order_id` int(11) DEFAULT NULL COMMENT '订单外键',
  `order_number` varchar(200) DEFAULT NULL COMMENT '订单号',
  `contract_number` varchar(200) DEFAULT NULL COMMENT '合同编号',
  `aname` varchar(255) DEFAULT NULL COMMENT '甲方',
  `bname` varchar(255) DEFAULT NULL COMMENT '乙方',
  `bbank_name` varchar(255) DEFAULT NULL COMMENT '账户名',
  `bbank_number` varchar(255) DEFAULT NULL COMMENT '账号',
  `bbank` varchar(255) DEFAULT NULL COMMENT '开户行',
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=250 DEFAULT CHARSET=utf8 COMMENT='合同信息表';

-- ----------------------------
-- Records of tb_order_contract
-- ----------------------------
BEGIN;
INSERT INTO `tb_order_contract` VALUES (10, 216, '20170807103463303', 'HT-20170807103463303', '董先生', '安徽中刚国泰物流有限公司 ', '安徽中刚国泰物流有限公司 ', '6215589621231012333312', '徽商银行', '2017-08-07 02:34:57');
INSERT INTO `tb_order_contract` VALUES (11, 225, '20170816153925546', 'HT-20170816153925546', '中钢国泰', '', '', '', '', '2017-08-22 14:37:51');
INSERT INTO `tb_order_contract` VALUES (12, 226, '20170816154388836', 'HT-20170816154388836', '中钢国泰', '', '', '', '', '2017-08-22 16:05:11');
INSERT INTO `tb_order_contract` VALUES (13, 227, '20170816154512686', 'HT-20170816154512686', '中钢国泰', '', '', '', '', '2017-08-22 16:06:17');
INSERT INTO `tb_order_contract` VALUES (14, 228, '20170816154741255', 'HT-20170816154741255', '中钢国泰', '', '', '', '', '2017-08-22 16:07:12');
INSERT INTO `tb_order_contract` VALUES (15, 229, '20170816154936300', 'HT-20170816154936300', '中钢国泰', '', '', '', '', '2017-08-22 16:08:03');
INSERT INTO `tb_order_contract` VALUES (16, 230, '20170816155141025', 'HT-20170816155141025', '中钢国泰', '', '', '', '', '2017-08-22 16:08:37');
INSERT INTO `tb_order_contract` VALUES (17, 231, '20170816155464348', 'HT-20170816155464348', '中钢国泰', '', '', '', '', '2017-08-22 16:09:27');
INSERT INTO `tb_order_contract` VALUES (18, 232, '20170816155877081', 'HT-20170816155877081', '中钢国泰', '', '', '', '', '2017-08-22 16:10:07');
INSERT INTO `tb_order_contract` VALUES (19, 233, '20170816160036755', 'HT-20170816160036755', '中钢国泰', '', '', '', '', '2017-08-22 16:10:38');
INSERT INTO `tb_order_contract` VALUES (20, 234, '20170816160240262', 'HT-20170816160240262', '中钢国泰', '', '', '', '', '2017-08-22 16:11:11');
INSERT INTO `tb_order_contract` VALUES (21, 235, '20170816160412101', 'HT-20170816160412101', '中钢国泰', '', '', '', '', '2017-08-22 16:11:46');
INSERT INTO `tb_order_contract` VALUES (22, 236, '20170816160678668', 'HT-20170816160678668', '中钢国泰', '', '', '', '', '2017-08-22 16:12:17');
INSERT INTO `tb_order_contract` VALUES (23, 237, '20170816160788004', 'HT-20170816160788004', '中钢国泰', '', '', '', '', '2017-08-22 16:12:52');
INSERT INTO `tb_order_contract` VALUES (24, 238, '20170816160941824', 'HT-20170816160941824', '中钢国泰', '', '', '', '', '2017-08-22 16:13:32');
INSERT INTO `tb_order_contract` VALUES (25, 240, '20170816163587243', 'HT-20170816163587243', '中钢国泰', '', '', '', '', '2017-08-22 16:42:11');
INSERT INTO `tb_order_contract` VALUES (26, 241, '20170816163814583', 'HT-20170816163814583', '中钢国泰', '', '', '', '', '2017-08-22 16:44:21');
INSERT INTO `tb_order_contract` VALUES (27, 243, '20170816164337186', 'HT-20170816164337186', '中钢国泰', '', '', '', '', '2017-08-22 16:45:14');
INSERT INTO `tb_order_contract` VALUES (28, 244, '20170816164603623', 'HT-20170816164603623', '中钢国泰', '', '', '', '', '2017-08-22 16:45:59');
INSERT INTO `tb_order_contract` VALUES (29, 245, '20170816164931544', 'HT-20170816164931544', '中钢国泰', '', '', '', '', '2017-08-22 16:46:43');
INSERT INTO `tb_order_contract` VALUES (30, 246, '20170816165127406', 'HT-20170816165127406', '中钢国泰', '', '', '', '', '2017-08-22 16:47:31');
INSERT INTO `tb_order_contract` VALUES (31, 247, '20170816165262472', 'HT-20170816165262472', '中钢国泰', '', '', '', '', '2017-08-22 16:48:23');
INSERT INTO `tb_order_contract` VALUES (32, 248, '20170816165422174', 'HT-20170816165422174', '中钢国泰', '', '', '', '', '2017-08-22 16:49:00');
INSERT INTO `tb_order_contract` VALUES (33, 249, '20170816165653086', 'HT-20170816165653086', '中钢国泰', '', '', '', '', '2017-08-22 16:49:47');
INSERT INTO `tb_order_contract` VALUES (34, 250, '20170816165714043', 'HT-20170816165714043', '中钢国泰', '', '', '', '', '2017-08-22 16:51:10');
INSERT INTO `tb_order_contract` VALUES (35, 251, '20170816165933474', 'HT-20170816165933474', '中钢国泰', '', '', '', '', '2017-08-22 16:51:48');
INSERT INTO `tb_order_contract` VALUES (36, 252, '20170816170008235', 'HT-20170816170008235', '中钢国泰', '', '', '', '', '2017-08-22 16:52:50');
INSERT INTO `tb_order_contract` VALUES (37, 253, '20170816170246532', 'HT-20170816170246532', '中钢国泰', '', '', '', '', '2017-08-22 16:57:03');
INSERT INTO `tb_order_contract` VALUES (38, 254, '20170816170465067', 'HT-20170816170465067', '中钢国泰', '', '', '', '', '2017-08-22 17:23:36');
INSERT INTO `tb_order_contract` VALUES (39, 255, '20170816170564513', 'HT-20170816170564513', '中钢国泰', '', '', '', '', '2017-08-22 17:24:40');
INSERT INTO `tb_order_contract` VALUES (40, 256, '20170816170752010', 'HT-20170816170752010', '中钢国泰', '', '', '', '', '2017-08-22 17:25:47');
INSERT INTO `tb_order_contract` VALUES (41, 257, '20170816170824687', 'HT-20170816170824687', '中钢国泰', '', '', '', '', '2017-08-22 17:31:43');
INSERT INTO `tb_order_contract` VALUES (42, 258, '20170816171060814', 'HT-20170816171060814', '中钢国泰', '', '', '', '', '2017-08-22 17:32:46');
INSERT INTO `tb_order_contract` VALUES (43, 259, '20170816171107487', 'HT-20170816171107487', '中钢国泰', '', '', '', '', '2017-08-22 17:33:24');
INSERT INTO `tb_order_contract` VALUES (44, 260, '20170816171345100', 'HT-20170816171345100', '中钢国泰', '', '', '', '', '2017-08-22 17:34:11');
INSERT INTO `tb_order_contract` VALUES (45, 261, '20170816171573117', 'HT-20170816171573117', '中钢国泰', '', '', '', '', '2017-08-22 17:34:48');
INSERT INTO `tb_order_contract` VALUES (46, 262, '20170816171657063', 'HT-20170816171657063', '中钢国泰', '', '', '', '', '2017-08-22 17:35:23');
INSERT INTO `tb_order_contract` VALUES (47, 263, '20170816171800117', 'HT-20170816171800117', '中钢国泰', '', '', '', '', '2017-08-22 17:35:56');
INSERT INTO `tb_order_contract` VALUES (48, 264, '20170816171983325', 'HT-20170816171983325', '中钢国泰', '', '', '', '', '2017-08-22 17:36:36');
INSERT INTO `tb_order_contract` VALUES (49, 265, '20170816172125567', 'HT-20170816172125567', '中钢国泰', '', '', '', '', '2017-08-22 17:37:25');
INSERT INTO `tb_order_contract` VALUES (50, 266, '20170816172274825', 'HT-20170816172274825', '中钢国泰', '', '', '', '', '2017-08-22 17:38:01');
INSERT INTO `tb_order_contract` VALUES (52, 428, '20170822174600881', 'HT-20170822174600881', '中钢国泰', '', '', '', '', '2017-08-22 17:46:23');
INSERT INTO `tb_order_contract` VALUES (53, 268, '20170816172686708', 'HT-20170816172686708', '中钢国泰', '', '', '', '', '2017-08-22 17:59:14');
INSERT INTO `tb_order_contract` VALUES (54, 269, '20170816172963420', 'HT-20170816172963420', '中钢国泰', '', '', '', '', '2017-08-22 17:59:45');
INSERT INTO `tb_order_contract` VALUES (55, 270, '20170816173165180', 'HT-20170816173165180', '中钢国泰', '', '', '', '', '2017-08-22 18:00:18');
INSERT INTO `tb_order_contract` VALUES (56, 271, '20170816173288383', 'HT-20170816173288383', '中钢国泰', '', '', '', '', '2017-08-22 18:00:54');
INSERT INTO `tb_order_contract` VALUES (57, 272, '20170816173452840', 'HT-20170816173452840', '中钢国泰', '', '', '', '', '2017-08-22 18:01:27');
INSERT INTO `tb_order_contract` VALUES (59, 429, '20170822180414442', 'HT-20170822180414442', '中钢国泰', '', '', '', '', '2017-08-22 18:05:05');
INSERT INTO `tb_order_contract` VALUES (60, 274, '20170816173772653', 'HT-20170816173772653', '中钢国泰', '', '', '', '', '2017-08-22 18:08:02');
INSERT INTO `tb_order_contract` VALUES (61, 275, '20170816173832156', 'HT-20170816173832156', '中钢国泰', '', '', '', '', '2017-08-22 18:09:21');
INSERT INTO `tb_order_contract` VALUES (62, 276, '20170816173978224', 'HT-20170816173978224', '中钢国泰', '', '', '', '', '2017-08-22 18:10:08');
INSERT INTO `tb_order_contract` VALUES (63, 277, '20170816174173580', 'HT-20170816174173580', '中钢国泰', '', '', '', '', '2017-08-22 18:11:21');
INSERT INTO `tb_order_contract` VALUES (64, 278, '20170816174302538', 'HT-20170816174302538', '中钢国泰', '', '', '', '', '2017-08-22 18:11:47');
INSERT INTO `tb_order_contract` VALUES (65, 279, '20170816174461184', 'HT-20170816174461184', '中钢国泰', '', '', '', '', '2017-08-22 18:12:25');
INSERT INTO `tb_order_contract` VALUES (66, 280, '20170816174544843', 'HT-20170816174544843', '中钢国泰', '', '', '', '', '2017-08-22 18:12:58');
INSERT INTO `tb_order_contract` VALUES (67, 281, '20170816174737302', 'HT-20170816174737302', '中钢国泰', '', '', '', '', '2017-08-22 18:14:03');
INSERT INTO `tb_order_contract` VALUES (68, 282, '20170817102821333', 'HT-20170817102821333', '中钢国泰', '', '', '', '', '2017-08-22 18:27:47');
INSERT INTO `tb_order_contract` VALUES (69, 283, '20170817103230753', 'HT-20170817103230753', '中钢国泰', '', '', '', '', '2017-08-22 18:28:33');
INSERT INTO `tb_order_contract` VALUES (70, 284, '20170817103342115', 'HT-20170817103342115', '中钢国泰', '', '', '', '', '2017-08-22 18:29:15');
INSERT INTO `tb_order_contract` VALUES (71, 285, '20170817103544545', 'HT-20170817103544545', '中钢国泰', '', '', '', '', '2017-08-22 18:29:57');
INSERT INTO `tb_order_contract` VALUES (72, 286, '20170817103653321', 'HT-20170817103653321', '中钢国泰', '', '', '', '', '2017-08-22 18:30:34');
INSERT INTO `tb_order_contract` VALUES (73, 288, '20170817103906486', 'HT-20170817103906486', '中钢国泰', '', '', '', '', '2017-08-22 18:31:15');
INSERT INTO `tb_order_contract` VALUES (74, 289, '20170817104033557', 'HT-20170817104033557', '中钢国泰', '', '', '', '', '2017-08-22 18:32:22');
INSERT INTO `tb_order_contract` VALUES (75, 287, '20170817103738861', 'HT-20170817103738861', '中钢国泰', '', '', '', '', '2017-08-22 18:34:43');
INSERT INTO `tb_order_contract` VALUES (76, 290, '20170817104288402', 'HT-20170817104288402', '中钢国泰', '', '', '', '', '2017-08-22 18:35:23');
INSERT INTO `tb_order_contract` VALUES (77, 292, '20170817104680208', 'HT-20170817104680208', '中钢国泰', '', '', '', '', '2017-08-22 18:39:15');
INSERT INTO `tb_order_contract` VALUES (78, 293, '20170817104747312', 'HT-20170817104747312', '中钢国泰', '', '', '', '', '2017-08-22 18:40:05');
INSERT INTO `tb_order_contract` VALUES (79, 294, '20170817104874412', 'HT-20170817104874412', '中钢国泰', '', '', '', '', '2017-08-22 18:40:40');
INSERT INTO `tb_order_contract` VALUES (80, 295, '20170817105043446', 'HT-20170817105043446', '中钢国泰', '', '', '', '', '2017-08-22 18:41:19');
INSERT INTO `tb_order_contract` VALUES (81, 296, '20170817105117001', 'HT-20170817105117001', '中钢国泰', '', '', '', '', '2017-08-22 18:41:54');
INSERT INTO `tb_order_contract` VALUES (82, 297, '20170817105273485', 'HT-20170817105273485', '中钢国泰马', '', '', '', '', '2017-08-22 18:43:09');
INSERT INTO `tb_order_contract` VALUES (83, 298, '20170817105426888', 'HT-20170817105426888', '中钢国泰', '', '', '', '', '2017-08-23 08:41:51');
INSERT INTO `tb_order_contract` VALUES (84, 299, '20170817105571467', 'HT-20170817105571467', '中钢国泰', '', '', '', '', '2017-08-23 08:42:38');
INSERT INTO `tb_order_contract` VALUES (85, 300, '20170817105631270', 'HT-20170817105631270', '中钢国泰', '', '', '', '', '2017-08-23 08:43:46');
INSERT INTO `tb_order_contract` VALUES (86, 301, '20170817105827785', 'HT-20170817105827785', '中钢国泰', '', '', '', '', '2017-08-23 08:44:32');
INSERT INTO `tb_order_contract` VALUES (87, 302, '20170817105972077', 'HT-20170817105972077', '中钢国泰', '', '', '', '', '2017-08-23 08:46:33');
INSERT INTO `tb_order_contract` VALUES (88, 303, '20170817110170574', 'HT-20170817110170574', '中钢国泰', '', '', '', '', '2017-08-23 08:47:07');
INSERT INTO `tb_order_contract` VALUES (89, 304, '20170817110207647', 'HT-20170817110207647', '中钢国泰', '', '', '', '', '2017-08-23 08:47:40');
INSERT INTO `tb_order_contract` VALUES (90, 305, '20170817110300543', 'HT-20170817110300543', '中钢国泰', '', '', '', '', '2017-08-23 08:48:14');
INSERT INTO `tb_order_contract` VALUES (91, 306, '20170817110436052', 'HT-20170817110436052', '中钢国泰', '', '', '', '', '2017-08-23 08:48:51');
INSERT INTO `tb_order_contract` VALUES (92, 307, '20170817110614803', 'HT-20170817110614803', '中钢国泰', '', '', '', '', '2017-08-23 08:49:28');
INSERT INTO `tb_order_contract` VALUES (93, 308, '20170817110777860', 'HT-20170817110777860', '中钢国泰', '', '', '', '', '2017-08-23 08:50:11');
INSERT INTO `tb_order_contract` VALUES (94, 309, '20170817110844113', 'HT-20170817110844113', '中钢国泰', '', '', '', '', '2017-08-23 08:51:01');
INSERT INTO `tb_order_contract` VALUES (95, 310, '20170817110905688', 'HT-20170817110905688', '中钢国泰', '', '', '', '', '2017-08-23 08:51:39');
INSERT INTO `tb_order_contract` VALUES (96, 311, '20170817111170635', 'HT-20170817111170635', '中钢国泰', '', '', '', '', '2017-08-23 08:52:08');
INSERT INTO `tb_order_contract` VALUES (97, 312, '20170817111244507', 'HT-20170817111244507', '中钢国泰', '', '', '', '', '2017-08-23 08:52:48');
INSERT INTO `tb_order_contract` VALUES (98, 313, '20170817111652777', 'HT-20170817111652777', '中钢国泰', '', '', '', '', '2017-08-23 08:53:26');
INSERT INTO `tb_order_contract` VALUES (99, 314, '20170817111804521', 'HT-20170817111804521', '中钢国泰', '', '', '', '', '2017-08-23 08:54:34');
INSERT INTO `tb_order_contract` VALUES (100, 315, '20170817111928207', 'HT-20170817111928207', '中钢国泰', '', '', '', '', '2017-08-23 08:55:11');
INSERT INTO `tb_order_contract` VALUES (101, 316, '20170817112078587', 'HT-20170817112078587', '中钢国泰', '', '', '', '', '2017-08-23 08:55:52');
INSERT INTO `tb_order_contract` VALUES (102, 317, '20170817112113355', 'HT-20170817112113355', '中钢国泰', '', '', '', '', '2017-08-23 08:56:29');
INSERT INTO `tb_order_contract` VALUES (103, 318, '20170817112233815', 'HT-20170817112233815', '中钢国泰', '', '', '', '', '2017-08-23 08:57:12');
INSERT INTO `tb_order_contract` VALUES (104, 319, '20170817112336642', 'HT-20170817112336642', '中钢国泰', '', '', '', '', '2017-08-23 08:57:55');
INSERT INTO `tb_order_contract` VALUES (105, 320, '20170817112458742', 'HT-20170817112458742', '中钢国泰', '', '', '', '', '2017-08-23 08:58:31');
INSERT INTO `tb_order_contract` VALUES (106, 321, '20170817112561880', 'HT-20170817112561880', '中钢国泰', '', '', '', '', '2017-08-23 08:59:06');
INSERT INTO `tb_order_contract` VALUES (107, 322, '20170817112700863', 'HT-20170817112700863', '中钢国泰', '', '', '', '', '2017-08-23 08:59:35');
INSERT INTO `tb_order_contract` VALUES (108, 323, '20170817112884257', 'HT-20170817112884257', '中钢国泰', '', '', '', '', '2017-08-23 09:00:07');
INSERT INTO `tb_order_contract` VALUES (109, 324, '20170817112921445', 'HT-20170817112921445', '中钢国泰', '', '', '', '', '2017-08-23 09:00:34');
INSERT INTO `tb_order_contract` VALUES (110, 325, '20170817113032332', 'HT-20170817113032332', '中钢国泰', '', '', '', '', '2017-08-23 09:01:04');
INSERT INTO `tb_order_contract` VALUES (111, 327, '20170817150273740', 'HT-20170817150273740', '中钢国泰', '', '', '', '', '2017-08-23 09:02:02');
INSERT INTO `tb_order_contract` VALUES (112, 326, '20170817150102166', 'HT-20170817150102166', '中钢国泰', '', '', '', '', '2017-08-23 09:02:55');
INSERT INTO `tb_order_contract` VALUES (113, 328, '20170817150361386', 'HT-20170817150361386', '中钢国泰', '', '', '', '', '2017-08-23 09:03:28');
INSERT INTO `tb_order_contract` VALUES (114, 329, '20170817150515264', 'HT-20170817150515264', '中钢国泰', '', '', '', '', '2017-08-23 09:03:54');
INSERT INTO `tb_order_contract` VALUES (116, 330, '20170817152088688', 'HT-20170817152088688', '中钢国泰', '', '', '', '', '2017-08-23 09:54:57');
INSERT INTO `tb_order_contract` VALUES (117, 331, '20170817152106313', 'HT-20170817152106313', '中钢国泰', '', '', '', '', '2017-08-23 09:55:36');
INSERT INTO `tb_order_contract` VALUES (118, 332, '20170817152208065', 'HT-20170817152208065', '中钢国泰', '', '', '', '', '2017-08-23 09:56:09');
INSERT INTO `tb_order_contract` VALUES (119, 333, '20170817152416502', 'HT-20170817152416502', '中钢国泰', '', '', '', '', '2017-08-23 09:56:43');
INSERT INTO `tb_order_contract` VALUES (120, 334, '20170817152505286', 'HT-20170817152505286', '中钢国泰', '', '', '', '', '2017-08-23 09:57:16');
INSERT INTO `tb_order_contract` VALUES (121, 335, '20170817152734066', 'HT-20170817152734066', '中钢国泰', '', '', '', '', '2017-08-23 10:01:37');
INSERT INTO `tb_order_contract` VALUES (122, 336, '20170817152807634', 'HT-20170817152807634', '中钢国泰', '', '', '', '', '2017-08-23 10:02:12');
INSERT INTO `tb_order_contract` VALUES (123, 337, '20170817152983146', 'HT-20170817152983146', '中钢国泰', '', '', '', '', '2017-08-23 10:02:38');
INSERT INTO `tb_order_contract` VALUES (124, 338, '20170817153182366', 'HT-20170817153182366', '中钢国泰', '', '', '', '', '2017-08-23 10:03:19');
INSERT INTO `tb_order_contract` VALUES (125, 339, '20170817153288004', 'HT-20170817153288004', '中钢国泰', '', '', '', '', '2017-08-23 10:03:51');
INSERT INTO `tb_order_contract` VALUES (126, 340, '20170817153316487', 'HT-20170817153316487', '中钢国泰', '', '', '', '', '2017-08-23 10:04:40');
INSERT INTO `tb_order_contract` VALUES (127, 341, '20170817153402734', 'HT-20170817153402734', '中钢国泰', '', '', '', '', '2017-08-23 10:05:01');
INSERT INTO `tb_order_contract` VALUES (128, 342, '20170817153640766', 'HT-20170817153640766', '中钢国泰', '', '', '', '', '2017-08-23 10:05:59');
INSERT INTO `tb_order_contract` VALUES (129, 343, '20170817153788274', 'HT-20170817153788274', '中钢国泰', '', '', '', '', '2017-08-23 10:06:31');
INSERT INTO `tb_order_contract` VALUES (130, 344, '20170817153866554', 'HT-20170817153866554', '中钢国泰', '', '', '', '', '2017-08-23 10:07:08');
INSERT INTO `tb_order_contract` VALUES (131, 345, '20170817153910385', 'HT-20170817153910385', '中钢国泰', '', '', '', '', '2017-08-23 10:07:34');
INSERT INTO `tb_order_contract` VALUES (132, 346, '20170817154117278', 'HT-20170817154117278', '中钢国泰', '', '', '', '', '2017-08-23 10:21:10');
INSERT INTO `tb_order_contract` VALUES (133, 347, '20170817154383064', 'HT-20170817154383064', '中钢国泰', '', '', '', '', '2017-08-23 10:21:43');
INSERT INTO `tb_order_contract` VALUES (134, 348, '20170817154726804', 'HT-20170817154726804', '中钢国泰', '', '', '', '', '2017-08-23 10:22:20');
INSERT INTO `tb_order_contract` VALUES (135, 349, '20170817154951510', 'HT-20170817154951510', '中钢国泰', '', '', '', '', '2017-08-23 10:22:55');
INSERT INTO `tb_order_contract` VALUES (136, 350, '20170817160070355', 'HT-20170817160070355', '中钢国泰', '', '', '', '', '2017-08-23 10:23:26');
INSERT INTO `tb_order_contract` VALUES (137, 351, '20170817160181303', 'HT-20170817160181303', '中钢国泰', '', '', '', '', '2017-08-23 10:23:53');
INSERT INTO `tb_order_contract` VALUES (138, 352, '20170817160352566', 'HT-20170817160352566', '中钢国泰', '', '', '', '', '2017-08-23 10:24:20');
INSERT INTO `tb_order_contract` VALUES (139, 353, '20170817160557054', 'HT-20170817160557054', '中钢国泰', '', '', '', '', '2017-08-23 10:24:54');
INSERT INTO `tb_order_contract` VALUES (140, 354, '20170817160648152', 'HT-20170817160648152', '中钢国泰', '', '', '', '', '2017-08-23 10:25:25');
INSERT INTO `tb_order_contract` VALUES (141, 355, '20170817160754071', 'HT-20170817160754071', '中钢国泰', '', '', '', '', '2017-08-23 10:27:02');
INSERT INTO `tb_order_contract` VALUES (142, 356, '20170817160854571', 'HT-20170817160854571', '中钢国泰', '', '', '', '', '2017-08-23 10:27:50');
INSERT INTO `tb_order_contract` VALUES (143, 357, '20170817161007677', 'HT-20170817161007677', '中钢国泰', '', '', '', '', '2017-08-23 10:28:44');
INSERT INTO `tb_order_contract` VALUES (144, 358, '20170817161114265', 'HT-20170817161114265', '中钢国泰', '', '', '', '', '2017-08-23 10:29:41');
INSERT INTO `tb_order_contract` VALUES (145, 359, '20170817161204875', 'HT-20170817161204875', '中钢国泰', '', '', '', '', '2017-08-23 10:30:23');
INSERT INTO `tb_order_contract` VALUES (146, 360, '20170817161422517', 'HT-20170817161422517', '中钢国泰', '', '', '', '', '2017-08-23 10:31:04');
INSERT INTO `tb_order_contract` VALUES (147, 361, '20170818143233808', 'HT-20170818143233808', '中钢国泰', '', '', '', '', '2017-08-23 10:31:36');
INSERT INTO `tb_order_contract` VALUES (148, 362, '20170818143360221', 'HT-20170818143360221', '中钢国泰', '', '', '', '', '2017-08-23 10:32:03');
INSERT INTO `tb_order_contract` VALUES (149, 363, '20170818143480531', 'HT-20170818143480531', '中钢国泰', '', '', '', '', '2017-08-23 10:32:32');
INSERT INTO `tb_order_contract` VALUES (150, 364, '20170818143670013', 'HT-20170818143670013', '中钢国泰', '', '', '', '', '2017-08-23 10:33:01');
INSERT INTO `tb_order_contract` VALUES (151, 365, '20170818143728658', 'HT-20170818143728658', '中钢国泰', '', '', '', '', '2017-08-23 10:33:29');
INSERT INTO `tb_order_contract` VALUES (152, 366, '20170818143881544', 'HT-20170818143881544', '中钢国泰', '', '', '', '', '2017-08-23 10:34:03');
INSERT INTO `tb_order_contract` VALUES (153, 367, '20170818143932183', 'HT-20170818143932183', '中钢国泰', '', '', '', '', '2017-08-23 10:34:39');
INSERT INTO `tb_order_contract` VALUES (154, 368, '20170818144170706', 'HT-20170818144170706', '中钢国泰', '', '', '', '', '2017-08-23 10:35:15');
INSERT INTO `tb_order_contract` VALUES (155, 369, '20170818144236325', 'HT-20170818144236325', '中钢国泰', '', '', '', '', '2017-08-23 10:35:42');
INSERT INTO `tb_order_contract` VALUES (156, 370, '20170818144380528', 'HT-20170818144380528', '中钢国泰', '', '', '', '', '2017-08-23 10:36:10');
INSERT INTO `tb_order_contract` VALUES (157, 371, '20170818144401035', 'HT-20170818144401035', '中钢国泰', '', '', '', '', '2017-08-23 10:36:38');
INSERT INTO `tb_order_contract` VALUES (158, 373, '20170818144741376', 'HT-20170818144741376', '中钢国泰', '', '', '', '', '2017-08-23 16:07:50');
INSERT INTO `tb_order_contract` VALUES (159, 374, '20170818144982442', 'HT-20170818144982442', '中钢国泰', '', '', '', '', '2017-08-23 16:08:26');
INSERT INTO `tb_order_contract` VALUES (160, 375, '20170818145010387', 'HT-20170818145010387', '中钢国泰', '', '', '', '', '2017-08-23 16:09:11');
INSERT INTO `tb_order_contract` VALUES (161, 376, '20170818145178232', 'HT-20170818145178232', '中钢国泰', '', '', '', '', '2017-08-23 16:09:40');
INSERT INTO `tb_order_contract` VALUES (162, 377, '20170818145307312', 'HT-20170818145307312', '中钢国泰', '', '', '', '', '2017-08-23 16:10:09');
INSERT INTO `tb_order_contract` VALUES (163, 378, '20170818145412063', 'HT-20170818145412063', '中钢国泰', '', '', '', '', '2017-08-23 16:10:45');
INSERT INTO `tb_order_contract` VALUES (164, 379, '20170818145571615', 'HT-20170818145571615', '中钢国泰', '', '', '', '', '2017-08-23 16:11:16');
INSERT INTO `tb_order_contract` VALUES (165, 380, '20170818145666067', 'HT-20170818145666067', '中钢国泰', '', '', '', '', '2017-08-23 16:11:46');
INSERT INTO `tb_order_contract` VALUES (166, 381, '20170818145733072', 'HT-20170818145733072', '中钢国泰', '', '', '', '', '2017-08-23 16:12:14');
INSERT INTO `tb_order_contract` VALUES (167, 382, '20170818145837253', 'HT-20170818145837253', '中钢国泰', '', '', '', '', '2017-08-23 16:13:05');
INSERT INTO `tb_order_contract` VALUES (168, 383, '20170818150022338', 'HT-20170818150022338', '中钢国泰', '', '', '', '', '2017-08-23 16:13:39');
INSERT INTO `tb_order_contract` VALUES (169, 384, '20170818150140001', 'HT-20170818150140001', '中钢国泰', '', '', '', '', '2017-08-23 16:14:58');
INSERT INTO `tb_order_contract` VALUES (170, 385, '20170818150416478', 'HT-20170818150416478', '中钢国泰', '', '', '', '', '2017-08-23 16:15:39');
INSERT INTO `tb_order_contract` VALUES (171, 386, '20170818150975001', 'HT-20170818150975001', '中钢国泰', '', '', '', '', '2017-08-23 16:16:29');
INSERT INTO `tb_order_contract` VALUES (172, 387, '20170818151058306', 'HT-20170818151058306', '中钢国泰', '', '', '', '', '2017-08-23 16:17:08');
INSERT INTO `tb_order_contract` VALUES (173, 388, '20170818151155150', 'HT-20170818151155150', '中钢国泰', '', '', '', '', '2017-08-23 16:17:38');
INSERT INTO `tb_order_contract` VALUES (174, 389, '20170818151240676', 'HT-20170818151240676', '中钢国泰', '', '', '', '', '2017-08-23 16:18:09');
INSERT INTO `tb_order_contract` VALUES (175, 390, '20170818151355015', 'HT-20170818151355015', '中钢国泰', '', '', '', '', '2017-08-23 16:18:41');
INSERT INTO `tb_order_contract` VALUES (176, 391, '20170818151452642', 'HT-20170818151452642', '中钢国泰', '', '', '', '', '2017-08-23 16:19:14');
INSERT INTO `tb_order_contract` VALUES (177, 392, '20170818151561613', 'HT-20170818151561613', '中钢国泰', '', '', '', '', '2017-08-23 16:20:30');
INSERT INTO `tb_order_contract` VALUES (178, 393, '20170818151714783', 'HT-20170818151714783', '中钢国泰', '', '', '', '', '2017-08-23 16:20:58');
INSERT INTO `tb_order_contract` VALUES (179, 394, '20170818151806135', 'HT-20170818151806135', '中钢国泰', '', '', '', '', '2017-08-23 16:21:41');
INSERT INTO `tb_order_contract` VALUES (180, 395, '20170818151947073', 'HT-20170818151947073', '中钢国泰', '', '', '', '', '2017-08-23 16:22:35');
INSERT INTO `tb_order_contract` VALUES (181, 396, '20170818152052440', 'HT-20170818152052440', '中钢国泰', '', '', '', '', '2017-08-23 16:23:06');
INSERT INTO `tb_order_contract` VALUES (182, 397, '20170818152224035', 'HT-20170818152224035', '中钢国泰', '', '', '', '', '2017-08-23 16:23:34');
INSERT INTO `tb_order_contract` VALUES (183, 398, '20170818152324131', 'HT-20170818152324131', '中钢国泰', '', '', '', '', '2017-08-23 16:24:07');
INSERT INTO `tb_order_contract` VALUES (184, 399, '20170818152413061', 'HT-20170818152413061', '中钢国泰', '', '', '', '', '2017-08-23 16:24:39');
INSERT INTO `tb_order_contract` VALUES (185, 400, '20170818152538653', 'HT-20170818152538653', '中钢国泰', '', '', '', '', '2017-08-23 16:25:16');
INSERT INTO `tb_order_contract` VALUES (186, 427, '20170819122833617', 'HT-20170819122833617', '中钢国泰', '', '', '', '', '2017-08-23 16:33:27');
INSERT INTO `tb_order_contract` VALUES (187, 426, '20170819122752041', 'HT-20170819122752041', '中钢国泰', '', '', '', '', '2017-08-23 16:33:57');
INSERT INTO `tb_order_contract` VALUES (188, 425, '20170819122662855', 'HT-20170819122662855', '中钢国泰', '', '', '', '', '2017-08-23 16:34:20');
INSERT INTO `tb_order_contract` VALUES (189, 424, '20170819122555155', 'HT-20170819122555155', '中钢国泰', '', '', '', '', '2017-08-23 16:34:44');
INSERT INTO `tb_order_contract` VALUES (190, 423, '20170819122362082', 'HT-20170819122362082', '中钢国泰', '', '', '', '', '2017-08-23 16:35:05');
INSERT INTO `tb_order_contract` VALUES (191, 422, '20170819122288511', 'HT-20170819122288511', '中钢国泰', '', '', '', '', '2017-08-23 16:35:30');
INSERT INTO `tb_order_contract` VALUES (192, 421, '20170819122112354', 'HT-20170819122112354', '中钢国泰', '', '', '', '', '2017-08-23 16:35:55');
INSERT INTO `tb_order_contract` VALUES (193, 420, '20170819122055620', 'HT-20170819122055620', '中钢国泰', '', '', '', '', '2017-08-23 16:36:35');
INSERT INTO `tb_order_contract` VALUES (194, 419, '20170819121926228', 'HT-20170819121926228', '中钢国泰', '', '', '', '', '2017-08-23 16:37:19');
INSERT INTO `tb_order_contract` VALUES (195, 418, '20170819121816680', 'HT-20170819121816680', '中钢国泰', '', '', '', '', '2017-08-23 16:38:03');
INSERT INTO `tb_order_contract` VALUES (196, 401, '20170818152724610', 'HT-20170818152724610', '中钢国泰', '', '', '', '', '2017-08-23 16:45:53');
INSERT INTO `tb_order_contract` VALUES (197, 402, '20170818152816727', 'HT-20170818152816727', '中钢国泰', '', '', '', '', '2017-08-23 16:46:32');
INSERT INTO `tb_order_contract` VALUES (198, 403, '20170818152958700', 'HT-20170818152958700', '中钢国泰', '', '', '', '', '2017-08-23 16:47:02');
INSERT INTO `tb_order_contract` VALUES (199, 404, '20170818153117687', 'HT-20170818153117687', '中钢国泰', '', '', '', '', '2017-08-23 16:47:36');
INSERT INTO `tb_order_contract` VALUES (200, 405, '20170818153221562', 'HT-20170818153221562', '中钢国泰', '', '', '', '', '2017-08-23 16:48:12');
INSERT INTO `tb_order_contract` VALUES (201, 406, '20170818153334015', 'HT-20170818153334015', '中钢国泰', '', '', '', '', '2017-08-23 16:48:42');
INSERT INTO `tb_order_contract` VALUES (202, 407, '20170818153455572', 'HT-20170818153455572', '中钢国泰', '', '', '', '', '2017-08-23 16:49:26');
INSERT INTO `tb_order_contract` VALUES (203, 408, '20170818153581273', 'HT-20170818153581273', '中钢国泰', '', '', '', '', '2017-08-23 16:49:55');
INSERT INTO `tb_order_contract` VALUES (204, 409, '20170818153681847', 'HT-20170818153681847', '中钢国泰', '', '', '', '', '2017-08-23 16:50:20');
INSERT INTO `tb_order_contract` VALUES (205, 410, '20170818153708830', 'HT-20170818153708830', '中钢国泰', '', '', '', '', '2017-08-23 16:50:54');
INSERT INTO `tb_order_contract` VALUES (206, 411, '20170818153826871', 'HT-20170818153826871', '中钢国泰', '', '', '', '', '2017-08-23 16:51:14');
INSERT INTO `tb_order_contract` VALUES (207, 412, '20170818154070573', 'HT-20170818154070573', '中钢国泰', '', '', '', '', '2017-08-23 16:51:38');
INSERT INTO `tb_order_contract` VALUES (208, 414, '20170818154285687', 'HT-20170818154285687', '中钢国泰', '', '', '', '', '2017-08-23 16:52:09');
INSERT INTO `tb_order_contract` VALUES (209, 413, '20170818154106787', 'HT-20170818154106787', '中钢国泰', '', '', '', '', '2017-08-23 16:52:59');
INSERT INTO `tb_order_contract` VALUES (210, 415, '20170818154504132', 'HT-20170818154504132', '中钢国泰', '', '', '', '', '2017-08-23 16:53:38');
INSERT INTO `tb_order_contract` VALUES (211, 416, '20170818154648308', 'HT-20170818154648308', '中钢国泰', '', '', '', '', '2017-08-23 16:54:16');
INSERT INTO `tb_order_contract` VALUES (229, 453, '20170824092807763', 'HT-20170824092807763', '中钢国泰', '', '', '', '', '2017-08-24 10:26:17');
INSERT INTO `tb_order_contract` VALUES (230, 454, '20170824092975374', 'HT-20170824092975374', '中钢国泰', '', '', '', '', '2017-08-24 10:26:55');
INSERT INTO `tb_order_contract` VALUES (231, 455, '20170824093088734', 'HT-20170824093088734', '中钢国泰', '', '', '', '', '2017-08-24 10:27:42');
INSERT INTO `tb_order_contract` VALUES (232, 456, '20170824093120271', 'HT-20170824093120271', '中钢国泰', '', '', '', '', '2017-08-24 10:28:12');
INSERT INTO `tb_order_contract` VALUES (233, 457, '20170824094774884', 'HT-20170824094774884', '中钢国泰', '', '', '', '', '2017-08-24 10:28:48');
INSERT INTO `tb_order_contract` VALUES (248, 473, '20170921161327757', 'HT-20170921161327757', '大结局', '', '', '', '', '2018-08-16 09:12:40');
INSERT INTO `tb_order_contract` VALUES (249, 472, '20170921161201886', 'HT-20170921161201886', '护手霜', '', '', '', '', '2018-12-23 01:45:30');
COMMIT;

-- ----------------------------
-- Table structure for tb_order_customer
-- ----------------------------
DROP TABLE IF EXISTS `tb_order_customer`;
CREATE TABLE `tb_order_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_order_id` int(11) DEFAULT NULL,
  `serial_number` varchar(50) DEFAULT NULL COMMENT '流水号',
  `order_number` varchar(50) NOT NULL COMMENT '订单号',
  `send_name` varchar(255) NOT NULL COMMENT '发件人姓名',
  `send_phone` varchar(20) NOT NULL COMMENT '发件人手机',
  `send_addr` varchar(500) NOT NULL COMMENT '发件人省市区地址，用/隔开',
  `send_addr_info` varchar(500) NOT NULL COMMENT '发件人详细地址',
  `recive_name` varchar(255) NOT NULL COMMENT '收件人姓名',
  `recive_phone` varchar(20) NOT NULL COMMENT '收件人电话',
  `recive_addr` varchar(500) NOT NULL COMMENT '收件人地址',
  `recive_addr_info` varchar(500) NOT NULL COMMENT '收件人详细地址',
  `send_time` datetime DEFAULT NULL COMMENT '预计发送时间',
  `recive_time` datetime DEFAULT NULL COMMENT '限时到达时间',
  `dispatching_type` varchar(50) NOT NULL COMMENT '配送还是自提',
  `freight` float DEFAULT '0' COMMENT '运费',
  `safes` float DEFAULT '0' COMMENT '保险费用',
  `total` float DEFAULT '0' COMMENT '合计费用',
  `status` varchar(50) DEFAULT NULL COMMENT '订单状态，关联status表',
  `fk_user_id` int(11) DEFAULT NULL COMMENT '下单的用户',
  `remark` text,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=476 DEFAULT CHARSET=utf8 COMMENT='客户订单表';

-- ----------------------------
-- Records of tb_order_customer
-- ----------------------------
BEGIN;
INSERT INTO `tb_order_customer` VALUES (213, 213, '150184031077358033', '20170804175158033', '中钢国泰', '15319670000', '陕西省/榆林市/神木县', '马镰湾', '黄骅港', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-03 16:00:00', '2017-08-05 16:00:00', '自提', 540000, 0, 540000, 'ORDER_PLACE', 127, NULL, '2017-08-04 09:51:51');
INSERT INTO `tb_order_customer` VALUES (214, 214, '150184049547877314', '20170804175477314', '中钢国泰', '15319670000', '内蒙古自治区/鄂尔多斯市/伊金霍洛旗', '三界塔', '黄骅港', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-03 16:00:00', '2017-08-05 16:00:00', '自提', 140000, 0, 140000, 'ORDER_PLACE', 127, NULL, '2017-08-04 09:54:55');
INSERT INTO `tb_order_customer` VALUES (216, 216, '150207325626187536', '20170807103463303', '董先生', '18656301000', '天津市/市辖区/和平区', '湖滨', '谷先生', '15256312130', '河北省/秦皇岛市/北戴河区', '湖滨', '2017-08-06 16:00:00', '2017-08-09 16:00:00', '配送', 200, 10, 210, 'ORDER_SIGN', 127, NULL, '2017-08-06 02:34:16');
INSERT INTO `tb_order_customer` VALUES (217, 217, '150184031077358033', '20170804175158033', '中钢国泰', '15319670000', '陕西省/榆林市/神木县', '马镰湾', '黄骅港', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-03 16:00:00', '2017-08-05 16:00:00', '自提', 540000, 0, 540000, 'ORDER_PLACE', 127, NULL, '2017-08-07 16:56:40');
INSERT INTO `tb_order_customer` VALUES (221, 221, '150226269036830525', '20170809151130525', '中国国泰', '15319670000', '陕西省/榆林市/神木县', '马镰湾', '黄骅港', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-06 00:00:00', '2017-08-09 00:00:00', '自提', 2160000, 0, 2160000, 'ORDER_PLACE', 127, NULL, '2017-08-09 15:11:30');
INSERT INTO `tb_order_customer` VALUES (225, 225, '150286918527425546', '20170816153925546', '中钢国泰', '15391271771', '内蒙古自治区/鄂尔多斯市/伊金霍洛旗', '三界塔泽雨煤矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-01 00:00:00', '2017-08-10 00:00:00', '自提', 9611.25, 0, 9611.25, 'ORDER_TAKING', 135, NULL, '2017-08-16 15:39:45');
INSERT INTO `tb_order_customer` VALUES (226, 226, '150286939240988836', '20170816154388836', '中钢国泰', '15391271771', '内蒙古自治区/鄂尔多斯市/伊金霍洛旗', '三界塔泽雨煤矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-01 00:00:00', '2017-08-10 00:00:00', '自提', 9501.25, 0, 9501.25, 'ORDER_TAKING', 135, NULL, '2017-08-16 15:43:12');
INSERT INTO `tb_order_customer` VALUES (227, 227, '150286952482512686', '20170816154512686', '中钢国泰', '15391271771', '内蒙古自治区/鄂尔多斯市/伊金霍洛旗', '三界塔泽雨煤矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-01 00:00:00', '2017-08-10 00:00:00', '自提', 9666.25, 0, 9666.25, 'ORDER_TAKING', 135, NULL, '2017-08-16 15:45:25');
INSERT INTO `tb_order_customer` VALUES (228, 228, '150286964963841255', '20170816154741255', '中钢国泰', '15391271771', '内蒙古自治区/鄂尔多斯市/伊金霍洛旗', '三界塔泽雨煤矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-01 00:00:00', '2017-08-10 00:00:00', '自提', 9625, 0, 9625, 'ORDER_TAKING', 135, NULL, '2017-08-16 15:47:30');
INSERT INTO `tb_order_customer` VALUES (229, 229, '150286975583136300', '20170816154936300', '中钢国泰', '15391271771', '内蒙古自治区/鄂尔多斯市/伊金霍洛旗', '三界塔泽雨煤矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-01 00:00:00', '2017-08-10 00:00:00', '自提', 9611.25, 0, 9611.25, 'ORDER_TAKING', 135, NULL, '2017-08-16 15:49:16');
INSERT INTO `tb_order_customer` VALUES (230, 230, '150286989526541025', '20170816155141025', '中钢国泰', '15391271771', '内蒙古自治区/鄂尔多斯市/伊金霍洛旗', '三界塔泽雨煤矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-01 00:00:00', '2017-08-10 00:00:00', '自提', 9625, 0, 9625, 'ORDER_TAKING', 135, NULL, '2017-08-16 15:51:35');
INSERT INTO `tb_order_customer` VALUES (231, 231, '150287006256764348', '20170816155464348', '中钢国泰', '15391271771', '内蒙古自治区/鄂尔多斯市/伊金霍洛旗', '三界塔泽雨煤矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-01 00:00:00', '2017-08-10 00:00:00', '自提', 9597.5, 0, 9597.5, 'ORDER_TAKING', 135, NULL, '2017-08-16 15:54:23');
INSERT INTO `tb_order_customer` VALUES (232, 232, '150287033802377081', '20170816155877081', '中钢国泰', '15391271771', '内蒙古自治区/鄂尔多斯市/伊金霍洛旗', '三界塔泽雨煤矿', '中钢国泰', '18222231823', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-01 00:00:00', '2017-08-10 00:00:00', '自提', 9542.5, 0, 9542.5, 'ORDER_TAKING', 135, NULL, '2017-08-16 15:58:58');
INSERT INTO `tb_order_customer` VALUES (233, 233, '150287044352336755', '20170816160036755', '中钢国泰', '15391271771', '内蒙古自治区/鄂尔多斯市/伊金霍洛旗', '三界塔泽雨煤矿', '中钢国泰', '18222231823', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-01 00:00:00', '2017-08-10 00:00:00', '自提', 9409.5, 0, 9409.5, 'ORDER_TAKING', 135, NULL, '2017-08-16 16:00:44');
INSERT INTO `tb_order_customer` VALUES (234, 234, '150287054915540262', '20170816160240262', '中钢国泰', '15391271771', '内蒙古自治区/鄂尔多斯市/伊金霍洛旗', '三界塔泽雨煤矿', '中钢国泰', '18222231823', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-01 00:00:00', '2017-08-10 00:00:00', '自提', 9515, 0, 9515, 'ORDER_TAKING', 135, NULL, '2017-08-16 16:02:29');
INSERT INTO `tb_order_customer` VALUES (235, 235, '150287064496812101', '20170816160412101', '中钢国泰', '15391271771', '内蒙古自治区/鄂尔多斯市/伊金霍洛旗', '三界塔泽雨煤矿', '中钢国泰', '18222231823', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-01 00:00:00', '2017-08-10 00:00:00', '自提', 9666.25, 0, 9666.25, 'ORDER_TAKING', 135, NULL, '2017-08-16 16:04:05');
INSERT INTO `tb_order_customer` VALUES (236, 236, '150287077579778668', '20170816160678668', '中钢国泰', '15391271771', '内蒙古自治区/鄂尔多斯市/伊金霍洛旗', '三界塔泽雨煤矿', '中钢国泰', '18222231823', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-01 00:00:00', '2017-08-10 00:00:00', '自提', 9570, 0, 9570, 'ORDER_TAKING', 135, NULL, '2017-08-16 16:06:16');
INSERT INTO `tb_order_customer` VALUES (237, 237, '150287087375888004', '20170816160788004', '中钢国泰', '15391271771', '内蒙古自治区/鄂尔多斯市/伊金霍洛旗', '三界塔泽雨煤矿', '中钢国泰', '18222231823', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-01 00:00:00', '2017-08-10 00:00:00', '自提', 9652.5, 0, 9652.5, 'ORDER_TAKING', 135, NULL, '2017-08-16 16:07:54');
INSERT INTO `tb_order_customer` VALUES (238, 238, '150287096617041824', '20170816160941824', '中钢国泰', '15391271771', '内蒙古自治区/鄂尔多斯市/伊金霍洛旗', '三界塔泽雨煤矿', '中钢国泰', '18222231823', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-01 00:00:00', '2017-08-10 00:00:00', '自提', 9583.75, 0, 9583.75, 'ORDER_TAKING', 135, NULL, '2017-08-16 16:09:26');
INSERT INTO `tb_order_customer` VALUES (240, 240, '150287255056287243', '20170816163587243', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-01 00:00:00', '2017-08-10 00:00:00', '自提', 9447.25, 0, 9447.25, 'ORDER_TAKING', 135, NULL, '2017-08-16 16:35:51');
INSERT INTO `tb_order_customer` VALUES (241, 241, '150287273357914583', '20170816163814583', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-01 00:00:00', '2017-08-10 00:00:00', '自提', 9116, 0, 9116, 'ORDER_TAKING', 135, NULL, '2017-08-16 16:38:54');
INSERT INTO `tb_order_customer` VALUES (243, 243, '150287302675937186', '20170816164337186', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-01 00:00:00', '2017-08-10 00:00:00', '自提', 9367.75, 0, 9367.75, 'ORDER_TAKING', 135, NULL, '2017-08-16 16:43:47');
INSERT INTO `tb_order_customer` VALUES (244, 244, '150287317352803623', '20170816164603623', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-01 00:00:00', '2017-08-10 00:00:00', '自提', 9420.75, 0, 9420.75, 'ORDER_TAKING', 135, NULL, '2017-08-16 16:46:14');
INSERT INTO `tb_order_customer` VALUES (245, 245, '150287335882531544', '20170816164931544', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-01 00:00:00', '2017-08-10 00:00:00', '自提', 9275, 0, 9275, 'ORDER_TAKING', 135, NULL, '2017-08-16 16:49:19');
INSERT INTO `tb_order_customer` VALUES (246, 246, '150287346155127406', '20170816165127406', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-01 00:00:00', '2017-08-10 00:00:00', '自提', 9314.75, 0, 9314.75, 'ORDER_TAKING', 135, NULL, '2017-08-16 16:51:02');
INSERT INTO `tb_order_customer` VALUES (247, 247, '150287355621462472', '20170816165262472', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-01 00:00:00', '2017-08-10 00:00:00', '自提', 8957, 0, 8957, 'ORDER_TAKING', 135, NULL, '2017-08-16 16:52:36');
INSERT INTO `tb_order_customer` VALUES (248, 248, '150287367779122174', '20170816165422174', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-01 00:00:00', '2017-08-10 00:00:00', '自提', 9089.5, 0, 9089.5, 'ORDER_TAKING', 135, NULL, '2017-08-16 16:54:38');
INSERT INTO `tb_order_customer` VALUES (249, 249, '150287377170757346', '20170816165653086', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-01 00:00:00', '2017-08-10 00:00:00', '自提', 9235.25, 0, 9235.25, 'ORDER_TAKING', 135, NULL, '2017-08-16 16:56:12');
INSERT INTO `tb_order_customer` VALUES (250, 250, '150287385710214043', '20170816165714043', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-01 00:00:00', '2017-08-10 00:00:00', '自提', 9487, 0, 9487, 'ORDER_TAKING', 135, NULL, '2017-08-16 16:57:37');
INSERT INTO `tb_order_customer` VALUES (251, 251, '150287394526633474', '20170816165933474', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-01 00:00:00', '2017-08-10 00:00:00', '自提', 9222, 0, 9222, 'ORDER_TAKING', 135, NULL, '2017-08-16 16:59:05');
INSERT INTO `tb_order_customer` VALUES (252, 252, '150287402462308235', '20170816170008235', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-01 00:00:00', '2017-08-10 00:00:00', '自提', 9434, 0, 9434, 'ORDER_TAKING', 135, NULL, '2017-08-16 17:00:25');
INSERT INTO `tb_order_customer` VALUES (253, 253, '150287416779846532', '20170816170246532', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-01 00:00:00', '2017-08-10 00:00:00', '自提', 9222, 0, 9222, 'ORDER_TAKING', 135, NULL, '2017-08-16 17:02:48');
INSERT INTO `tb_order_customer` VALUES (254, 254, '150287427817165067', '20170816170465067', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-01 00:00:00', '2017-08-10 00:00:00', '自提', 9500.25, 0, 9500.25, 'ORDER_TAKING', 135, NULL, '2017-08-16 17:04:38');
INSERT INTO `tb_order_customer` VALUES (255, 255, '150287435345364513', '20170816170564513', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-01 00:00:00', '2017-08-10 00:00:00', '自提', 9566.5, 0, 9566.5, 'ORDER_TAKING', 135, NULL, '2017-08-16 17:05:53');
INSERT INTO `tb_order_customer` VALUES (256, 256, '150287443314152010', '20170816170752010', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-01 00:00:00', '2017-08-10 00:00:00', '自提', 9235.25, 0, 9235.25, 'ORDER_TAKING', 135, NULL, '2017-08-16 17:07:13');
INSERT INTO `tb_order_customer` VALUES (257, 257, '150287451359224687', '20170816170824687', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-01 00:00:00', '2017-08-10 00:00:00', '自提', 9513.5, 0, 9513.5, 'ORDER_TAKING', 135, NULL, '2017-08-16 17:08:34');
INSERT INTO `tb_order_customer` VALUES (258, 258, '150287460815560814', '20170816171060814', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-01 00:00:00', '2017-08-10 00:00:00', '自提', 9182.25, 0, 9182.25, 'ORDER_TAKING', 135, NULL, '2017-08-16 17:10:08');
INSERT INTO `tb_order_customer` VALUES (259, 259, '150287469758407487', '20170816171107487', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-01 00:00:00', '2017-08-10 00:00:00', '自提', 9182.25, 0, 9182.25, 'ORDER_TAKING', 135, NULL, '2017-08-16 17:11:38');
INSERT INTO `tb_order_customer` VALUES (260, 260, '150287480178745100', '20170816171345100', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-01 00:00:00', '2017-08-10 00:00:00', '自提', 9487, 0, 9487, 'ORDER_TAKING', 135, NULL, '2017-08-16 17:13:22');
INSERT INTO `tb_order_customer` VALUES (261, 261, '150287492124773117', '20170816171573117', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-01 00:00:00', '2017-08-10 00:00:00', '自提', 9275, 0, 9275, 'ORDER_TAKING', 135, NULL, '2017-08-16 17:15:21');
INSERT INTO `tb_order_customer` VALUES (262, 262, '150287500434857063', '20170816171657063', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-01 00:00:00', '2017-08-10 00:00:00', '自提', 9182.25, 0, 9182.25, 'ORDER_TAKING', 135, NULL, '2017-08-16 17:16:44');
INSERT INTO `tb_order_customer` VALUES (263, 263, '150287509405900117', '20170816171800117', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-01 00:00:00', '2017-08-10 00:00:00', '自提', 9235.25, 0, 9235.25, 'ORDER_TAKING', 135, NULL, '2017-08-16 17:18:14');
INSERT INTO `tb_order_customer` VALUES (264, 264, '150287518412783325', '20170816171983325', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-01 00:00:00', '2017-08-10 00:00:00', '自提', 9129.25, 0, 9129.25, 'ORDER_TAKING', 135, NULL, '2017-08-16 17:19:44');
INSERT INTO `tb_order_customer` VALUES (265, 265, '150287526121225567', '20170816172125567', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-01 00:00:00', '2017-08-10 00:00:00', '自提', 9208.75, 0, 9208.75, 'ORDER_TAKING', 135, NULL, '2017-08-16 17:21:01');
INSERT INTO `tb_order_customer` VALUES (266, 266, '150287533780974825', '20170816172274825', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-01 00:00:00', '2017-08-10 00:00:00', '自提', 9248.5, 0, 9248.5, 'ORDER_TAKING', 135, NULL, '2017-08-16 17:22:18');
INSERT INTO `tb_order_customer` VALUES (268, 268, '150287558418786708', '20170816172686708', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-02 00:00:00', '2017-08-10 00:00:00', '自提', 9023.25, 0, 9023.25, 'ORDER_TAKING', 135, NULL, '2017-08-16 17:26:24');
INSERT INTO `tb_order_customer` VALUES (269, 269, '150287576855163420', '20170816172963420', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-02 00:00:00', '2017-08-10 00:00:00', '自提', 9010, 0, 9010, 'ORDER_TAKING', 135, NULL, '2017-08-16 17:29:29');
INSERT INTO `tb_order_customer` VALUES (270, 270, '150287586542065180', '20170816173165180', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-02 00:00:00', '2017-08-10 00:00:00', '自提', 9275, 0, 9275, 'ORDER_TAKING', 135, NULL, '2017-08-16 17:31:05');
INSERT INTO `tb_order_customer` VALUES (271, 271, '150287595414688383', '20170816173288383', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-02 00:00:00', '2017-08-10 00:00:00', '自提', 9354.5, 0, 9354.5, 'ORDER_TAKING', 135, NULL, '2017-08-16 17:32:34');
INSERT INTO `tb_order_customer` VALUES (272, 272, '150287606457652840', '20170816173452840', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-02 00:00:00', '2017-08-10 00:00:00', '自提', 9182.25, 0, 9182.25, 'ORDER_TAKING', 135, NULL, '2017-08-16 17:34:25');
INSERT INTO `tb_order_customer` VALUES (274, 274, '150287623311572653', '20170816173772653', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-02 00:00:00', '2017-08-10 00:00:00', '自提', 9367.75, 0, 9367.75, 'ORDER_TAKING', 135, NULL, '2017-08-16 17:37:13');
INSERT INTO `tb_order_customer` VALUES (275, 275, '150287631077632156', '20170816173832156', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-02 00:00:00', '2017-08-10 00:00:00', '自提', 9142.5, 0, 9142.5, 'ORDER_TAKING', 135, NULL, '2017-08-16 17:38:31');
INSERT INTO `tb_order_customer` VALUES (276, 276, '150287639735978224', '20170816173978224', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-02 00:00:00', '2017-08-10 00:00:00', '自提', 9155.75, 0, 9155.75, 'ORDER_TAKING', 135, NULL, '2017-08-16 17:39:57');
INSERT INTO `tb_order_customer` VALUES (277, 277, '150287650970273580', '20170816174173580', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-03 00:00:00', '2017-08-12 00:00:00', '自提', 8970.25, 0, 8970.25, 'ORDER_TAKING', 135, NULL, '2017-08-16 17:41:50');
INSERT INTO `tb_order_customer` VALUES (278, 278, '150287658729402538', '20170816174302538', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-03 00:00:00', '2017-08-12 00:00:00', '自提', 9023.25, 0, 9023.25, 'ORDER_TAKING', 135, NULL, '2017-08-16 17:43:07');
INSERT INTO `tb_order_customer` VALUES (279, 279, '150287666546761184', '20170816174461184', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-03 00:00:00', '2017-08-12 00:00:00', '自提', 8957, 0, 8957, 'ORDER_TAKING', 135, NULL, '2017-08-16 17:44:25');
INSERT INTO `tb_order_customer` VALUES (280, 280, '150287674326244843', '20170816174544843', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-03 00:00:00', '2017-08-12 00:00:00', '自提', 9354.5, 0, 9354.5, 'ORDER_TAKING', 135, NULL, '2017-08-16 17:45:43');
INSERT INTO `tb_order_customer` VALUES (281, 281, '150287682575737302', '20170816174737302', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-03 00:00:00', '2017-08-12 00:00:00', '自提', 9354.5, 0, 9354.5, 'ORDER_TAKING', 135, NULL, '2017-08-16 17:47:06');
INSERT INTO `tb_order_customer` VALUES (282, 282, '150293692754521333', '20170817102821333', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-04 00:00:00', '2017-08-12 00:00:00', '自提', 9428.7, 0, 9428.7, 'ORDER_TAKING', 135, NULL, '2017-08-17 10:28:48');
INSERT INTO `tb_order_customer` VALUES (283, 283, '150293712481330753', '20170817103230753', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-04 00:00:00', '2017-08-12 00:00:00', '自提', 9513.5, 0, 9513.5, 'ORDER_TAKING', 135, NULL, '2017-08-17 10:32:05');
INSERT INTO `tb_order_customer` VALUES (284, 284, '150293722022742115', '20170817103342115', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-04 00:00:00', '2017-08-12 00:00:00', '自提', 9306.8, 0, 9306.8, 'ORDER_TAKING', 135, NULL, '2017-08-17 10:33:40');
INSERT INTO `tb_order_customer` VALUES (285, 285, '150293730644444545', '20170817103544545', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-04 00:00:00', '2017-08-12 00:00:00', '自提', 9312.1, 0, 9312.1, 'ORDER_TAKING', 135, NULL, '2017-08-17 10:35:06');
INSERT INTO `tb_order_customer` VALUES (286, 286, '150293740915953321', '20170817103653321', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-04 00:00:00', '2017-08-12 00:00:00', '自提', 9391.6, 0, 9391.6, 'ORDER_TAKING', 135, NULL, '2017-08-17 10:36:49');
INSERT INTO `tb_order_customer` VALUES (287, 287, '150293747903038861', '20170817103738861', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-04 00:00:00', '2017-08-12 00:00:00', '自提', 9434, 0, 9434, 'ORDER_TAKING', 135, NULL, '2017-08-17 10:37:59');
INSERT INTO `tb_order_customer` VALUES (288, 288, '150293755837483654', '20170817103906486', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-04 00:00:00', '2017-08-12 00:00:00', '自提', 9359.8, 0, 9359.8, 'ORDER_TAKING', 135, NULL, '2017-08-17 10:39:18');
INSERT INTO `tb_order_customer` VALUES (289, 289, '150293763067233557', '20170817104033557', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-04 00:00:00', '2017-08-12 00:00:00', '自提', 9418.1, 0, 9418.1, 'ORDER_TAKING', 135, NULL, '2017-08-17 10:40:31');
INSERT INTO `tb_order_customer` VALUES (290, 290, '150293773660988402', '20170817104288402', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-04 00:00:00', '2017-08-12 00:00:00', '自提', 9343.9, 0, 9343.9, 'ORDER_TAKING', 135, NULL, '2017-08-17 10:42:17');
INSERT INTO `tb_order_customer` VALUES (292, 292, '150293796660780208', '20170817104680208', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '1822239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-04 00:00:00', '2017-08-12 00:00:00', '自提', 9471.1, 0, 9471.1, 'ORDER_TAKING', 135, NULL, '2017-08-17 10:46:07');
INSERT INTO `tb_order_customer` VALUES (293, 293, '150293805602847312', '20170817104747312', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-04 00:00:00', '2017-08-12 00:00:00', '自提', 9513.5, 0, 9513.5, 'ORDER_TAKING', 135, NULL, '2017-08-17 10:47:36');
INSERT INTO `tb_order_customer` VALUES (294, 294, '150293812571278672', '20170817104874412', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-04 00:00:00', '2017-08-12 00:00:00', '自提', 9200.8, 0, 9200.8, 'ORDER_TAKING', 135, NULL, '2017-08-17 10:48:46');
INSERT INTO `tb_order_customer` VALUES (295, 295, '150293822296643446', '20170817105043446', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-04 00:00:00', '2017-08-12 00:00:00', '自提', 9237.9, 0, 9237.9, 'ORDER_TAKING', 135, NULL, '2017-08-17 10:50:23');
INSERT INTO `tb_order_customer` VALUES (296, 296, '150293829239717001', '20170817105117001', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-04 00:00:00', '2017-08-12 00:00:00', '自提', 8988.8, 0, 8988.8, 'ORDER_TAKING', 135, NULL, '2017-08-17 10:51:32');
INSERT INTO `tb_order_customer` VALUES (297, 297, '150293836612673485', '20170817105273485', '中钢国泰马', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-04 00:00:00', '2017-08-12 00:00:00', '自提', 9237.9, 0, 9237.9, 'ORDER_TAKING', 135, NULL, '2017-08-17 10:52:46');
INSERT INTO `tb_order_customer` VALUES (298, 298, '150293847611626888', '20170817105426888', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-05 00:00:00', '2017-08-13 00:00:00', '自提', 9089.5, 0, 9089.5, 'ORDER_TAKING', 135, NULL, '2017-08-17 10:54:36');
INSERT INTO `tb_order_customer` VALUES (299, 299, '150293854608871467', '20170817105571467', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-05 00:00:00', '2017-08-13 00:00:00', '自提', 9349.2, 0, 9349.2, 'ORDER_TAKING', 135, NULL, '2017-08-17 10:55:46');
INSERT INTO `tb_order_customer` VALUES (300, 300, '150293861176631270', '20170817105631270', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-05 00:00:00', '2017-08-13 00:00:00', '自提', 8994.1, 0, 8994.1, 'ORDER_TAKING', 135, NULL, '2017-08-17 10:56:52');
INSERT INTO `tb_order_customer` VALUES (301, 301, '150293870230227785', '20170817105827785', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-06 00:00:00', '2017-08-15 00:00:00', '自提', 9190.2, 0, 9190.2, 'ORDER_TAKING', 135, NULL, '2017-08-17 10:58:22');
INSERT INTO `tb_order_customer` VALUES (302, 302, '150293878743472077', '20170817105972077', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-06 00:00:00', '2017-08-15 00:00:00', '自提', 9396.9, 0, 9396.9, 'ORDER_TAKING', 135, NULL, '2017-08-17 10:59:47');
INSERT INTO `tb_order_customer` VALUES (303, 303, '150293886296870574', '20170817110170574', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-06 00:00:00', '2017-08-15 00:00:00', '自提', 9328, 0, 9328, 'ORDER_TAKING', 135, NULL, '2017-08-17 11:01:03');
INSERT INTO `tb_order_customer` VALUES (304, 304, '150293894238107647', '20170817110207647', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-06 00:00:00', '2017-08-15 00:00:00', '自提', 9190.2, 0, 9190.2, 'ORDER_TAKING', 135, NULL, '2017-08-17 11:02:22');
INSERT INTO `tb_order_customer` VALUES (305, 305, '150293901453600543', '20170817110300543', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-06 00:00:00', '2017-08-15 00:00:00', '自提', 9243.2, 0, 9243.2, 'ORDER_TAKING', 135, NULL, '2017-08-17 11:03:35');
INSERT INTO `tb_order_customer` VALUES (306, 306, '150293908898136052', '20170817110436052', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-06 00:00:00', '2017-08-15 00:00:00', '自提', 9073.6, 0, 9073.6, 'ORDER_TAKING', 135, NULL, '2017-08-17 11:04:49');
INSERT INTO `tb_order_customer` VALUES (307, 307, '150293916076501161', '20170817110614803', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-06 00:00:00', '2017-08-15 00:00:00', '自提', 9169, 0, 9169, 'ORDER_TAKING', 135, NULL, '2017-08-17 11:06:01');
INSERT INTO `tb_order_customer` VALUES (308, 308, '150293924084677860', '20170817110777860', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-06 00:00:00', '2017-08-15 00:00:00', '自提', 9492.3, 0, 9492.3, 'ORDER_TAKING', 135, NULL, '2017-08-17 11:07:21');
INSERT INTO `tb_order_customer` VALUES (309, 309, '150293930830644113', '20170817110844113', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-06 00:00:00', '2017-08-15 00:00:00', '自提', 9513.5, 0, 9513.5, 'ORDER_TAKING', 135, NULL, '2017-08-17 11:08:28');
INSERT INTO `tb_order_customer` VALUES (310, 310, '150293938989505688', '20170817110905688', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-06 00:00:00', '2017-08-15 00:00:00', '自提', 9222, 0, 9222, 'ORDER_TAKING', 135, NULL, '2017-08-17 11:09:50');
INSERT INTO `tb_order_customer` VALUES (311, 311, '150293946265070635', '20170817111170635', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-06 00:00:00', '2017-08-15 00:00:00', '自提', 9365.1, 0, 9365.1, 'ORDER_TAKING', 135, NULL, '2017-08-17 11:11:03');
INSERT INTO `tb_order_customer` VALUES (312, 312, '150293953994444507', '20170817111244507', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-06 00:00:00', '2017-08-15 00:00:00', '自提', 9349.2, 0, 9349.2, 'ORDER_TAKING', 135, NULL, '2017-08-17 11:12:20');
INSERT INTO `tb_order_customer` VALUES (313, 313, '150293981440052777', '20170817111652777', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-06 00:00:00', '2017-08-15 00:00:00', '自提', 9084.2, 0, 9084.2, 'ORDER_TAKING', 135, NULL, '2017-08-17 11:16:54');
INSERT INTO `tb_order_customer` VALUES (314, 314, '150293988582904521', '20170817111804521', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-06 00:00:00', '2017-08-15 00:00:00', '自提', 9349.2, 0, 9349.2, 'ORDER_TAKING', 135, NULL, '2017-08-17 11:18:06');
INSERT INTO `tb_order_customer` VALUES (315, 315, '150293995711828207', '20170817111928207', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-06 00:00:00', '2017-08-15 00:00:00', '自提', 9375.7, 0, 9375.7, 'ORDER_TAKING', 135, NULL, '2017-08-17 11:19:17');
INSERT INTO `tb_order_customer` VALUES (316, 316, '150294002855478587', '20170817112078587', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-06 00:00:00', '2017-08-15 00:00:00', '自提', 9296.2, 0, 9296.2, 'ORDER_TAKING', 135, NULL, '2017-08-17 11:20:29');
INSERT INTO `tb_order_customer` VALUES (317, 317, '150294009007013355', '20170817112113355', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-06 00:00:00', '2017-08-15 00:00:00', '自提', 9455.2, 0, 9455.2, 'ORDER_TAKING', 135, NULL, '2017-08-17 11:21:30');
INSERT INTO `tb_order_customer` VALUES (318, 318, '150294015484133815', '20170817112233815', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-06 00:00:00', '2017-08-15 00:00:00', '自提', 9100.1, 0, 9100.1, 'ORDER_TAKING', 135, NULL, '2017-08-17 11:22:35');
INSERT INTO `tb_order_customer` VALUES (319, 319, '150294021675636642', '20170817112336642', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-07 00:00:00', '2017-08-15 00:00:00', '自提', 9354.5, 0, 9354.5, 'ORDER_TAKING', 135, NULL, '2017-08-17 11:23:37');
INSERT INTO `tb_order_customer` VALUES (320, 320, '150294028799358742', '20170817112458742', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-07 00:00:00', '2017-08-15 00:00:00', '自提', 9471.1, 0, 9471.1, 'ORDER_TAKING', 135, NULL, '2017-08-17 11:24:48');
INSERT INTO `tb_order_customer` VALUES (321, 321, '150294035628261880', '20170817112561880', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-07 00:00:00', '2017-08-15 00:00:00', '自提', 9237.9, 0, 9237.9, 'ORDER_TAKING', 135, NULL, '2017-08-17 11:25:56');
INSERT INTO `tb_order_customer` VALUES (322, 322, '150294043672600863', '20170817112700863', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-10 00:00:00', '2017-08-17 00:00:00', '自提', 9232.6, 0, 9232.6, 'ORDER_TAKING', 135, NULL, '2017-08-17 11:27:17');
INSERT INTO `tb_order_customer` VALUES (323, 323, '150294050801084257', '20170817112884257', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-10 00:00:00', '2017-08-17 00:00:00', '自提', 9285.6, 0, 9285.6, 'ORDER_TAKING', 135, NULL, '2017-08-17 11:28:28');
INSERT INTO `tb_order_customer` VALUES (324, 324, '150294058396221445', '20170817112921445', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-10 00:00:00', '2017-08-17 00:00:00', '自提', 9206.1, 0, 9206.1, 'ORDER_TAKING', 135, NULL, '2017-08-17 11:29:44');
INSERT INTO `tb_order_customer` VALUES (325, 325, '150294065533932332', '20170817113032332', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-10 00:00:00', '2017-08-17 00:00:00', '自提', 9328, 0, 9328, 'ORDER_TAKING', 135, NULL, '2017-08-17 11:30:55');
INSERT INTO `tb_order_customer` VALUES (326, 326, '150295326331402166', '20170817150102166', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-12 00:00:00', '2017-08-20 00:00:00', '自提', 9290.9, 0, 9290.9, 'ORDER_TAKING', 135, NULL, '2017-08-17 15:01:03');
INSERT INTO `tb_order_customer` VALUES (327, 327, '150295334663273740', '20170817150273740', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-12 00:00:00', '2017-08-20 00:00:00', '自提', 9264.4, 0, 9264.4, 'ORDER_TAKING', 135, NULL, '2017-08-17 15:02:27');
INSERT INTO `tb_order_customer` VALUES (328, 328, '150295343059361386', '20170817150361386', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-12 00:00:00', '2017-08-20 00:00:00', '自提', 9216.7, 0, 9216.7, 'ORDER_TAKING', 135, NULL, '2017-08-17 15:03:51');
INSERT INTO `tb_order_customer` VALUES (329, 329, '150295351432815264', '20170817150515264', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-12 00:00:00', '2017-08-20 00:00:00', '自提', 9253.8, 0, 9253.8, 'ORDER_TAKING', 135, NULL, '2017-08-17 15:05:14');
INSERT INTO `tb_order_customer` VALUES (330, 330, '150295443582188688', '20170817152088688', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-10 00:00:00', '2017-08-17 00:00:00', '自提', 9328, 0, 9328, 'ORDER_TAKING', 135, NULL, '2017-08-17 15:20:36');
INSERT INTO `tb_order_customer` VALUES (331, 331, '150295450441006313', '20170817152106313', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-10 00:00:00', '2017-08-17 00:00:00', '自提', 9354.5, 0, 9354.5, 'ORDER_TAKING', 135, NULL, '2017-08-17 15:21:44');
INSERT INTO `tb_order_customer` VALUES (332, 332, '150295457609208065', '20170817152208065', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-10 00:00:00', '2017-08-17 00:00:00', '自提', 9359.8, 0, 9359.8, 'ORDER_TAKING', 135, NULL, '2017-08-17 15:22:56');
INSERT INTO `tb_order_customer` VALUES (333, 333, '150295465364801852', '20170817152416502', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '13921261316', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-10 00:00:00', '2017-08-17 00:00:00', '自提', 9222, 0, 9222, 'ORDER_TAKING', 135, NULL, '2017-08-17 15:24:14');
INSERT INTO `tb_order_customer` VALUES (334, 334, '150295472601605286', '20170817152505286', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰马', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-10 00:00:00', '2017-08-17 00:00:00', '自提', 9237.9, 0, 9237.9, 'ORDER_TAKING', 135, NULL, '2017-08-17 15:25:26');
INSERT INTO `tb_order_customer` VALUES (335, 335, '150295483006534066', '20170817152734066', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-11 00:00:00', '2017-08-20 00:00:00', '自提', 9290.9, 0, 9290.9, 'ORDER_TAKING', 135, NULL, '2017-08-17 15:27:10');
INSERT INTO `tb_order_customer` VALUES (336, 336, '150295491515007634', '20170817152807634', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-11 00:00:00', '2017-08-20 00:00:00', '自提', 9386.3, 0, 9386.3, 'ORDER_TAKING', 135, NULL, '2017-08-17 15:28:35');
INSERT INTO `tb_order_customer` VALUES (337, 337, '150295499228683146', '20170817152983146', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-11 00:00:00', '2017-08-20 00:00:00', '自提', 9227.3, 0, 9227.3, 'ORDER_TAKING', 135, NULL, '2017-08-17 15:29:52');
INSERT INTO `tb_order_customer` VALUES (338, 338, '150295507424182366', '20170817153182366', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '马镰湾盛博矿', '2017-08-11 00:00:00', '2017-08-20 00:00:00', '自提', 9084.2, 0, 9084.2, 'ORDER_TAKING', 135, NULL, '2017-08-17 15:31:14');
INSERT INTO `tb_order_customer` VALUES (339, 339, '150295514469388004', '20170817153288004', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-11 00:00:00', '2017-08-20 00:00:00', '自提', 9343.9, 0, 9343.9, 'ORDER_TAKING', 135, NULL, '2017-08-17 15:32:25');
INSERT INTO `tb_order_customer` VALUES (340, 340, '150295522496816487', '20170817153316487', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-11 00:00:00', '2017-08-20 00:00:00', '自提', 9259.1, 0, 9259.1, 'ORDER_TAKING', 135, NULL, '2017-08-17 15:33:45');
INSERT INTO `tb_order_customer` VALUES (341, 341, '150295529256202734', '20170817153402734', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-11 00:00:00', '2017-08-20 00:00:00', '自提', 9412.8, 0, 9412.8, 'ORDER_TAKING', 135, NULL, '2017-08-17 15:34:53');
INSERT INTO `tb_order_customer` VALUES (342, 342, '150295536869334026', '20170817153640766', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-11 00:00:00', '2017-08-20 00:00:00', '自提', 9349.2, 0, 9349.2, 'ORDER_TAKING', 135, NULL, '2017-08-17 15:36:09');
INSERT INTO `tb_order_customer` VALUES (343, 343, '150295543801488274', '20170817153788274', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-11 00:00:00', '2017-08-20 00:00:00', '自提', 9317.4, 0, 9317.4, 'ORDER_TAKING', 135, NULL, '2017-08-17 15:37:18');
INSERT INTO `tb_order_customer` VALUES (344, 344, '150295551726966554', '20170817153866554', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-11 00:00:00', '2017-08-20 00:00:00', '自提', 9343.9, 0, 9343.9, 'ORDER_TAKING', 135, NULL, '2017-08-17 15:38:37');
INSERT INTO `tb_order_customer` VALUES (345, 345, '150295558601576445', '20170817153910385', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-11 00:00:00', '2017-08-20 00:00:00', '自提', 9285.6, 0, 9285.6, 'ORDER_TAKING', 135, NULL, '2017-08-17 15:39:46');
INSERT INTO `tb_order_customer` VALUES (346, 346, '150295567552117278', '20170817154117278', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-12 00:00:00', '2017-08-20 00:00:00', '自提', 9248.5, 0, 9248.5, 'ORDER_TAKING', 135, NULL, '2017-08-17 15:41:16');
INSERT INTO `tb_order_customer` VALUES (347, 347, '150295581014283064', '20170817154383064', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-12 00:00:00', '2017-08-20 00:00:00', '自提', 9211.4, 0, 9211.4, 'ORDER_TAKING', 135, NULL, '2017-08-17 15:43:30');
INSERT INTO `tb_order_customer` VALUES (348, 348, '150295602760526804', '20170817154726804', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-12 00:00:00', '2017-08-20 00:00:00', '自提', 9153.1, 0, 9153.1, 'ORDER_TAKING', 135, NULL, '2017-08-17 15:47:08');
INSERT INTO `tb_order_customer` VALUES (349, 349, '150295616505351510', '20170817154951510', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-12 00:00:00', '2017-08-20 00:00:00', '自提', 9195.5, 0, 9195.5, 'ORDER_TAKING', 135, NULL, '2017-08-17 15:49:25');
INSERT INTO `tb_order_customer` VALUES (350, 350, '150295680189670355', '20170817160070355', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-12 00:00:00', '2017-08-20 00:00:00', '自提', 9253.8, 0, 9253.8, 'ORDER_TAKING', 135, NULL, '2017-08-17 16:00:02');
INSERT INTO `tb_order_customer` VALUES (351, 351, '150295690971381303', '20170817160181303', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-12 00:00:00', '2017-08-20 00:00:00', '自提', 9328, 0, 9328, 'ORDER_TAKING', 135, NULL, '2017-08-17 16:01:50');
INSERT INTO `tb_order_customer` VALUES (352, 352, '150295698495952566', '20170817160352566', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-12 00:00:00', '2017-08-20 00:00:00', '自提', 9333.3, 0, 9333.3, 'ORDER_TAKING', 135, NULL, '2017-08-17 16:03:05');
INSERT INTO `tb_order_customer` VALUES (353, 353, '150295711899357054', '20170817160557054', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-12 00:00:00', '2017-08-20 00:00:00', '自提', 9227.3, 0, 9227.3, 'ORDER_TAKING', 135, NULL, '2017-08-17 16:05:19');
INSERT INTO `tb_order_customer` VALUES (354, 354, '150295718910448152', '20170817160648152', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-12 00:00:00', '2017-08-20 00:00:00', '自提', 9338.6, 0, 9338.6, 'ORDER_TAKING', 135, NULL, '2017-08-17 16:06:29');
INSERT INTO `tb_order_customer` VALUES (355, 355, '150295725855754071', '20170817160754071', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-12 00:00:00', '2017-08-20 00:00:00', '自提', 9047.1, 0, 9047.1, 'ORDER_TAKING', 135, NULL, '2017-08-17 16:07:39');
INSERT INTO `tb_order_customer` VALUES (356, 356, '150295733432054571', '20170817160854571', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-12 00:00:00', '2017-08-20 00:00:00', '自提', 9163.7, 0, 9163.7, 'ORDER_TAKING', 135, NULL, '2017-08-17 16:08:54');
INSERT INTO `tb_order_customer` VALUES (357, 357, '150295740311107677', '20170817161007677', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-12 00:00:00', '2017-08-20 00:00:00', '自提', 9248.5, 0, 9248.5, 'ORDER_TAKING', 135, NULL, '2017-08-17 16:10:03');
INSERT INTO `tb_order_customer` VALUES (358, 358, '150295747503114265', '20170817161114265', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-12 00:00:00', '2017-08-20 00:00:00', '自提', 9312.1, 0, 9312.1, 'ORDER_TAKING', 135, NULL, '2017-08-17 16:11:15');
INSERT INTO `tb_order_customer` VALUES (359, 359, '150295755121404875', '20170817161204875', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-12 00:00:00', '2017-08-20 00:00:00', '自提', 9211.4, 0, 9211.4, 'ORDER_TAKING', 135, NULL, '2017-08-17 16:12:31');
INSERT INTO `tb_order_customer` VALUES (360, 360, '150295765098922517', '20170817161422517', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-12 00:00:00', '2017-08-20 00:00:00', '自提', 9269.7, 0, 9269.7, 'ORDER_TAKING', 135, NULL, '2017-08-17 16:14:11');
INSERT INTO `tb_order_customer` VALUES (361, 361, '150303796036333808', '20170818143233808', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-12 00:00:00', '2017-08-20 00:00:00', '自提', 9195.5, 0, 9195.5, 'ORDER_TAKING', 135, NULL, '2017-08-18 14:32:40');
INSERT INTO `tb_order_customer` VALUES (362, 362, '150303802872260221', '20170818143360221', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-12 00:00:00', '2017-08-20 00:00:00', '自提', 9200.8, 0, 9200.8, 'ORDER_TAKING', 135, NULL, '2017-08-18 14:33:49');
INSERT INTO `tb_order_customer` VALUES (363, 363, '150303809150280531', '20170818143480531', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-12 00:00:00', '2017-08-20 00:00:00', '自提', 9577.1, 0, 9577.1, 'ORDER_TAKING', 135, NULL, '2017-08-18 14:34:52');
INSERT INTO `tb_order_customer` VALUES (364, 364, '150303816261270013', '20170818143670013', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-12 00:00:00', '2017-08-20 00:00:00', '自提', 8935.8, 0, 8935.8, 'ORDER_TAKING', 135, NULL, '2017-08-18 14:36:03');
INSERT INTO `tb_order_customer` VALUES (365, 365, '150303822576428658', '20170818143728658', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-12 00:00:00', '2017-08-20 00:00:00', '自提', 9593, 0, 9593, 'ORDER_TAKING', 135, NULL, '2017-08-18 14:37:06');
INSERT INTO `tb_order_customer` VALUES (366, 366, '150303829162481544', '20170818143881544', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-12 00:00:00', '2017-08-20 00:00:00', '自提', 9052.4, 0, 9052.4, 'ORDER_TAKING', 135, NULL, '2017-08-18 14:38:12');
INSERT INTO `tb_order_customer` VALUES (367, 367, '150303838966132183', '20170818143932183', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-12 00:00:00', '2017-08-20 00:00:00', '自提', 9365.1, 0, 9365.1, 'ORDER_TAKING', 135, NULL, '2017-08-18 14:39:50');
INSERT INTO `tb_order_customer` VALUES (368, 368, '150303846113570706', '20170818144170706', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-12 00:00:00', '2017-08-20 00:00:00', '自提', 9349.2, 0, 9349.2, 'ORDER_TAKING', 135, NULL, '2017-08-18 14:41:01');
INSERT INTO `tb_order_customer` VALUES (369, 369, '150303853456836325', '20170818144236325', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-12 00:00:00', '2017-08-20 00:00:00', '自提', 9227.3, 0, 9227.3, 'ORDER_TAKING', 135, NULL, '2017-08-18 14:42:15');
INSERT INTO `tb_order_customer` VALUES (370, 370, '150303860437680528', '20170818144380528', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-12 00:00:00', '2017-08-20 00:00:00', '自提', 9322.7, 0, 9322.7, 'ORDER_TAKING', 135, NULL, '2017-08-18 14:43:24');
INSERT INTO `tb_order_customer` VALUES (371, 371, '150303867610801035', '20170818144401035', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-12 00:00:00', '2017-08-20 00:00:00', '自提', 9365.1, 0, 9365.1, 'ORDER_TAKING', 135, NULL, '2017-08-18 14:44:36');
INSERT INTO `tb_order_customer` VALUES (373, 373, '150303887673841376', '20170818144741376', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-13 00:00:00', '2017-08-21 00:00:00', '自提', 9137.2, 0, 9137.2, 'ORDER_TAKING', 135, NULL, '2017-08-18 14:47:57');
INSERT INTO `tb_order_customer` VALUES (374, 374, '150303897146282442', '20170818144982442', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-13 00:00:00', '2017-08-21 00:00:00', '自提', 9370.4, 0, 9370.4, 'ORDER_TAKING', 135, NULL, '2017-08-18 14:49:31');
INSERT INTO `tb_order_customer` VALUES (375, 375, '150303903626510387', '20170818145010387', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-13 00:00:00', '2017-08-21 00:00:00', '自提', 9434, 0, 9434, 'ORDER_TAKING', 135, NULL, '2017-08-18 14:50:36');
INSERT INTO `tb_order_customer` VALUES (376, 376, '150303911512578232', '20170818145178232', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-13 00:00:00', '2017-08-21 00:00:00', '自提', 9338.6, 0, 9338.6, 'ORDER_TAKING', 135, NULL, '2017-08-18 14:51:55');
INSERT INTO `tb_order_customer` VALUES (377, 377, '150303918770707312', '20170818145307312', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-13 00:00:00', '2017-08-21 00:00:00', '自提', 9312.1, 0, 9312.1, 'ORDER_TAKING', 135, NULL, '2017-08-18 14:53:08');
INSERT INTO `tb_order_customer` VALUES (378, 378, '150303925104812063', '20170818145412063', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-13 00:00:00', '2017-08-21 00:00:00', '自提', 9290.9, 0, 9290.9, 'ORDER_TAKING', 135, NULL, '2017-08-18 14:54:11');
INSERT INTO `tb_order_customer` VALUES (379, 379, '150303932709371615', '20170818145571615', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-13 00:00:00', '2017-08-21 00:00:00', '自提', 9349.2, 0, 9349.2, 'ORDER_TAKING', 135, NULL, '2017-08-18 14:55:27');
INSERT INTO `tb_order_customer` VALUES (380, 380, '150303940932266067', '20170818145666067', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-13 00:00:00', '2017-08-21 00:00:00', '自提', 9487, 0, 9487, 'ORDER_TAKING', 135, NULL, '2017-08-18 14:56:49');
INSERT INTO `tb_order_customer` VALUES (381, 381, '150303947023433072', '20170818145733072', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-13 00:00:00', '2017-08-20 00:00:00', '自提', 9158.4, 0, 9158.4, 'ORDER_TAKING', 135, NULL, '2017-08-18 14:57:50');
INSERT INTO `tb_order_customer` VALUES (382, 382, '150303953274437253', '20170818145837253', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-13 00:00:00', '2017-08-21 00:00:00', '自提', 9328, 0, 9328, 'ORDER_TAKING', 135, NULL, '2017-08-18 14:58:53');
INSERT INTO `tb_order_customer` VALUES (383, 383, '150303963051622338', '20170818150022338', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-13 00:00:00', '2017-08-21 00:00:00', '自提', 9216.7, 0, 9216.7, 'ORDER_TAKING', 135, NULL, '2017-08-18 15:00:31');
INSERT INTO `tb_order_customer` VALUES (384, 384, '150303971386540001', '20170818150140001', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-13 00:00:00', '2017-08-21 00:00:00', '自提', 9147.8, 0, 9147.8, 'ORDER_TAKING', 135, NULL, '2017-08-18 15:01:54');
INSERT INTO `tb_order_customer` VALUES (385, 385, '150303984104416478', '20170818150416478', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-13 00:00:00', '2017-08-21 00:00:00', '自提', 9147.8, 0, 9147.8, 'ORDER_TAKING', 135, NULL, '2017-08-18 15:04:01');
INSERT INTO `tb_order_customer` VALUES (386, 386, '150304015368575001', '20170818150975001', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-13 00:00:00', '2017-08-21 00:00:00', '自提', 9227.3, 0, 9227.3, 'ORDER_TAKING', 135, NULL, '2017-08-18 15:09:14');
INSERT INTO `tb_order_customer` VALUES (387, 387, '150304022481058306', '20170818151058306', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-13 00:00:00', '2017-08-21 00:00:00', '自提', 9237.9, 0, 9237.9, 'ORDER_TAKING', 135, NULL, '2017-08-18 15:10:25');
INSERT INTO `tb_order_customer` VALUES (388, 388, '150304028617955150', '20170818151155150', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-13 00:00:00', '2017-08-21 00:00:00', '自提', 9306.8, 0, 9306.8, 'ORDER_TAKING', 135, NULL, '2017-08-18 15:11:26');
INSERT INTO `tb_order_customer` VALUES (389, 389, '150304034621040676', '20170818151240676', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-13 00:00:00', '2017-08-21 00:00:00', '自提', 9264.4, 0, 9264.4, 'ORDER_TAKING', 135, NULL, '2017-08-18 15:12:26');
INSERT INTO `tb_order_customer` VALUES (390, 390, '150304040629755015', '20170818151355015', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-13 00:00:00', '2017-08-21 00:00:00', '自提', 9200.8, 0, 9200.8, 'ORDER_TAKING', 135, NULL, '2017-08-18 15:13:26');
INSERT INTO `tb_order_customer` VALUES (391, 391, '150304047741752642', '20170818151452642', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-13 00:00:00', '2017-08-21 00:00:00', '自提', 9312.1, 0, 9312.1, 'ORDER_TAKING', 135, NULL, '2017-08-18 15:14:37');
INSERT INTO `tb_order_customer` VALUES (392, 392, '150304054628261613', '20170818151561613', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-13 00:00:00', '2017-08-21 00:00:00', '自提', 9375.7, 0, 9375.7, 'ORDER_TAKING', 135, NULL, '2017-08-18 15:15:46');
INSERT INTO `tb_order_customer` VALUES (393, 393, '150304064217814783', '20170818151714783', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-13 00:00:00', '2017-08-21 00:00:00', '自提', 9317.4, 0, 9317.4, 'ORDER_TAKING', 135, NULL, '2017-08-18 15:17:22');
INSERT INTO `tb_order_customer` VALUES (394, 394, '150304070201706135', '20170818151806135', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-13 00:00:00', '2017-08-21 00:00:00', '自提', 9328, 0, 9328, 'ORDER_TAKING', 135, NULL, '2017-08-18 15:18:22');
INSERT INTO `tb_order_customer` VALUES (395, 395, '150304076364347073', '20170818151947073', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-13 00:00:00', '2017-08-21 00:00:00', '自提', 9508.2, 0, 9508.2, 'ORDER_TAKING', 135, NULL, '2017-08-18 15:19:24');
INSERT INTO `tb_order_customer` VALUES (396, 396, '150304084528352440', '20170818152052440', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-13 00:00:00', '2017-08-21 00:00:00', '自提', 9359.8, 0, 9359.8, 'ORDER_TAKING', 135, NULL, '2017-08-18 15:20:45');
INSERT INTO `tb_order_customer` VALUES (397, 397, '150304092926124035', '20170818152224035', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-13 00:00:00', '2017-08-21 00:00:00', '自提', 9147.8, 0, 9147.8, 'ORDER_TAKING', 135, NULL, '2017-08-18 15:22:09');
INSERT INTO `tb_order_customer` VALUES (398, 398, '150304100562924131', '20170818152324131', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-13 00:00:00', '2017-08-21 00:00:00', '自提', 9131.9, 0, 9131.9, 'ORDER_TAKING', 135, NULL, '2017-08-18 15:23:26');
INSERT INTO `tb_order_customer` VALUES (399, 399, '150304107160413061', '20170818152413061', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-13 00:00:00', '2017-08-21 00:00:00', '自提', 9237.9, 0, 9237.9, 'ORDER_TAKING', 135, NULL, '2017-08-18 15:24:32');
INSERT INTO `tb_order_customer` VALUES (400, 400, '150304113642438653', '20170818152538653', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-13 00:00:00', '2017-08-21 00:00:00', '自提', 9216.7, 0, 9216.7, 'ORDER_TAKING', 135, NULL, '2017-08-18 15:25:36');
INSERT INTO `tb_order_customer` VALUES (401, 401, '150304124235124610', '20170818152724610', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-14 00:00:00', '2017-08-22 00:00:00', '自提', 9264.4, 0, 9264.4, 'ORDER_TAKING', 135, NULL, '2017-08-18 15:27:22');
INSERT INTO `tb_order_customer` VALUES (402, 402, '150304132502916727', '20170818152816727', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-14 00:00:00', '2017-08-22 00:00:00', '自提', 9174.3, 0, 9174.3, 'ORDER_TAKING', 135, NULL, '2017-08-18 15:28:45');
INSERT INTO `tb_order_customer` VALUES (403, 403, '150304139308758700', '20170818152958700', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-14 00:00:00', '2017-08-22 00:00:00', '自提', 9359.8, 0, 9359.8, 'ORDER_TAKING', 135, NULL, '2017-08-18 15:29:53');
INSERT INTO `tb_order_customer` VALUES (404, 404, '150304146289317687', '20170818153117687', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-14 00:00:00', '2017-08-22 00:00:00', '自提', 9301.5, 0, 9301.5, 'ORDER_TAKING', 135, NULL, '2017-08-18 15:31:03');
INSERT INTO `tb_order_customer` VALUES (405, 405, '150304152882021562', '20170818153221562', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-14 00:00:00', '2017-08-22 00:00:00', '自提', 9264.4, 0, 9264.4, 'ORDER_TAKING', 135, NULL, '2017-08-18 15:32:09');
INSERT INTO `tb_order_customer` VALUES (406, 406, '150304159523534015', '20170818153334015', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-14 00:00:00', '2017-08-22 00:00:00', '自提', 9216.7, 0, 9216.7, 'ORDER_TAKING', 135, NULL, '2017-08-18 15:33:15');
INSERT INTO `tb_order_customer` VALUES (407, 407, '150304165844455572', '20170818153455572', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-14 00:00:00', '2017-08-22 00:00:00', '自提', 9566.5, 0, 9566.5, 'ORDER_TAKING', 135, NULL, '2017-08-18 15:34:18');
INSERT INTO `tb_order_customer` VALUES (408, 408, '150304172062781273', '20170818153581273', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-14 00:00:00', '2017-08-22 00:00:00', '自提', 9163.7, 0, 9163.7, 'ORDER_TAKING', 135, NULL, '2017-08-18 15:35:21');
INSERT INTO `tb_order_customer` VALUES (409, 409, '150304178722681847', '20170818153681847', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-14 00:00:00', '2017-08-22 00:00:00', '自提', 9312.1, 0, 9312.1, 'ORDER_TAKING', 135, NULL, '2017-08-18 15:36:27');
INSERT INTO `tb_order_customer` VALUES (410, 410, '150304186470308830', '20170818153708830', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-14 00:00:00', '2017-08-22 00:00:00', '自提', 9269.7, 0, 9269.7, 'ORDER_TAKING', 135, NULL, '2017-08-18 15:37:45');
INSERT INTO `tb_order_customer` VALUES (411, 411, '150304193884626871', '20170818153826871', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-14 00:00:00', '2017-08-22 00:00:00', '自提', 9465.8, 0, 9465.8, 'ORDER_TAKING', 135, NULL, '2017-08-18 15:38:59');
INSERT INTO `tb_order_customer` VALUES (412, 412, '150304200398970573', '20170818154070573', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-14 00:00:00', '2017-08-22 00:00:00', '自提', 9375.7, 0, 9375.7, 'ORDER_TAKING', 135, NULL, '2017-08-18 15:40:04');
INSERT INTO `tb_order_customer` VALUES (413, 413, '150304206519306787', '20170818154106787', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-14 00:00:00', '2017-08-22 00:00:00', '自提', 9243.2, 0, 9243.2, 'ORDER_TAKING', 135, NULL, '2017-08-18 15:41:05');
INSERT INTO `tb_order_customer` VALUES (414, 414, '150304213024865605', '20170818154285687', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-14 00:00:00', '2017-08-22 00:00:00', '自提', 9375.7, 0, 9375.7, 'ORDER_TAKING', 135, NULL, '2017-08-18 15:42:10');
INSERT INTO `tb_order_customer` VALUES (415, 415, '150304231307004132', '20170818154504132', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-14 00:00:00', '2017-08-22 00:00:00', '自提', 9365.1, 0, 9365.1, 'ORDER_TAKING', 135, NULL, '2017-08-18 15:45:13');
INSERT INTO `tb_order_customer` VALUES (416, 416, '150304237383048308', '20170818154648308', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-14 00:00:00', '2017-08-22 00:00:00', '自提', 9508.2, 0, 9508.2, 'ORDER_TAKING', 135, NULL, '2017-08-18 15:46:14');
INSERT INTO `tb_order_customer` VALUES (418, 418, '150311628660116680', '20170819121816680', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-15 00:00:00', '2017-08-23 00:00:00', '自提', 9211.4, 0, 9211.4, 'ORDER_TAKING', 135, NULL, '2017-08-19 12:18:07');
INSERT INTO `tb_order_customer` VALUES (419, 419, '150311636066426228', '20170819121926228', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-15 00:00:00', '2017-08-23 00:00:00', '自提', 9593, 0, 9593, 'ORDER_TAKING', 135, NULL, '2017-08-19 12:19:21');
INSERT INTO `tb_order_customer` VALUES (420, 420, '150311642049155620', '20170819122055620', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-15 00:00:00', '2017-08-23 00:00:00', '自提', 9227.3, 0, 9227.3, 'ORDER_TAKING', 135, NULL, '2017-08-19 12:20:20');
INSERT INTO `tb_order_customer` VALUES (421, 421, '150311648766012354', '20170819122112354', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-15 00:00:00', '2017-08-23 00:00:00', '自提', 9169, 0, 9169, 'ORDER_TAKING', 135, NULL, '2017-08-19 12:21:28');
INSERT INTO `tb_order_customer` VALUES (422, 422, '150311656248888511', '20170819122288511', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-15 00:00:00', '2017-08-23 00:00:00', '自提', 9349.2, 0, 9349.2, 'ORDER_TAKING', 135, NULL, '2017-08-19 12:22:42');
INSERT INTO `tb_order_customer` VALUES (423, 423, '150311663978862082', '20170819122362082', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-16 00:00:00', '2017-08-25 00:00:00', '自提', 9317.4, 0, 9317.4, 'ORDER_TAKING', 135, NULL, '2017-08-19 12:24:00');
INSERT INTO `tb_order_customer` VALUES (424, 424, '150311670464755155', '20170819122555155', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-16 00:00:00', '2017-08-25 00:00:00', '自提', 9116, 0, 9116, 'ORDER_TAKING', 135, NULL, '2017-08-19 12:25:05');
INSERT INTO `tb_order_customer` VALUES (425, 425, '150311677412462855', '20170819122662855', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-16 00:00:00', '2017-08-25 00:00:00', '自提', 9200.8, 0, 9200.8, 'ORDER_TAKING', 135, NULL, '2017-08-19 12:26:14');
INSERT INTO `tb_order_customer` VALUES (426, 426, '150311684833052041', '20170819122752041', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-16 00:00:00', '2017-08-25 00:00:00', '自提', 9322.7, 0, 9322.7, 'ORDER_TAKING', 135, NULL, '2017-08-19 12:27:28');
INSERT INTO `tb_order_customer` VALUES (427, 427, '150311691261833617', '20170819122833617', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-16 00:00:00', '2017-08-25 00:00:00', '自提', 9264.4, 0, 9264.4, 'ORDER_TAKING', 135, NULL, '2017-08-19 12:28:33');
INSERT INTO `tb_order_customer` VALUES (428, 428, '150339516084400881', '20170822174600881', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-02 00:00:00', '2017-08-12 00:00:00', '自提', 9248.5, 0, 9248.5, 'ORDER_TAKING', 135, NULL, '2017-08-22 17:46:01');
INSERT INTO `tb_order_customer` VALUES (429, 429, '150339627726928407', '20170822180414442', '中钢国泰', '13921261316', '陕西省/榆林市/神木县', '马镰湾盛博矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-02 00:00:00', '2017-08-12 00:00:00', '自提', 9328, 0, 9328, 'ORDER_TAKING', 135, NULL, '2017-08-22 18:04:37');
INSERT INTO `tb_order_customer` VALUES (453, 453, '150353808597004023', '20170824092807763', '中钢国泰', '15391271771', '内蒙古自治区/鄂尔多斯市/伊金霍洛旗', '三界塔泽雨煤矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-18 00:00:00', '2017-08-27 00:00:00', '自提', 9153, 0, 9153, 'ORDER_TAKING', 135, NULL, '2017-08-24 09:28:06');
INSERT INTO `tb_order_customer` VALUES (454, 454, '150353815860375374', '20170824092975374', '中钢国泰', '15391271771', '内蒙古自治区/鄂尔多斯市/伊金霍洛旗', '三界塔泽雨煤矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-18 00:00:00', '2017-08-27 00:00:00', '自提', 9153, 0, 9153, 'ORDER_TAKING', 135, NULL, '2017-08-24 09:29:19');
INSERT INTO `tb_order_customer` VALUES (455, 455, '150353822329488734', '20170824093088734', '中钢国泰', '15391271771', '内蒙古自治区/鄂尔多斯市/伊金霍洛旗', '三界塔泽雨煤矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-18 00:00:00', '2017-08-27 00:00:00', '自提', 9218, 0, 9218, 'ORDER_TAKING', 135, NULL, '2017-08-24 09:30:23');
INSERT INTO `tb_order_customer` VALUES (456, 456, '150353828872620271', '20170824093120271', '中钢国泰', '15391271771', '内蒙古自治区/鄂尔多斯市/伊金霍洛旗', '三界塔泽雨煤矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-18 00:00:00', '2017-08-27 00:00:00', '自提', 10530, 0, 10530, 'ORDER_TAKING', 135, NULL, '2017-08-24 09:31:29');
INSERT INTO `tb_order_customer` VALUES (457, 457, '150353927972674884', '20170824094774884', '中钢国泰', '15391271771', '内蒙古自治区/鄂尔多斯市/伊金霍洛旗', '三界塔泽雨煤矿', '中钢国泰', '18222239213', '河北省/沧州市/黄骅市', '渤海新区黄骅港河钢码头', '2017-08-18 00:00:00', '2017-08-27 00:00:00', '自提', 9391, 0, 9391, 'ORDER_TAKING', 135, NULL, '2017-08-24 09:48:00');
INSERT INTO `tb_order_customer` VALUES (472, 472, NULL, '20170921161201886', '护手霜', '189461988', '安徽省/合肥市/包河区', '我还和呵呵', '呵呵呵', '6161999', '安徽省/合肥市/包河区', '呵呵呵', '2017-08-21 00:00:00', '2017-08-21 00:00:00', '配送', 0, 0, 0, NULL, NULL, NULL, '2017-09-21 16:12:40');
INSERT INTO `tb_order_customer` VALUES (473, 473, NULL, '20170921161327757', '大结局', '61664666', '安徽省/合肥市/包河区', '给我呵呵', '给我呵呵', '185899', '安徽省/合肥市/包河区', '因为呵呵', '2017-08-21 00:00:00', '2017-08-21 00:00:00', '配送', 0, 0, 0, NULL, NULL, NULL, '2017-09-21 16:13:57');
INSERT INTO `tb_order_customer` VALUES (474, 474, NULL, '20170921171758741', '王昆仑', '18949821385', '安徽省/合肥市/包河区', '给我好哇好哇', '刚刚', '18846188555', '安徽省/合肥市/包河区', '感受感受v是vv', '2017-08-21 00:00:00', '2017-08-21 00:00:00', '配送', 0, 0, 0, NULL, NULL, NULL, '2017-09-21 17:17:48');
INSERT INTO `tb_order_customer` VALUES (475, 475, NULL, '20170921172944886', '呵呵呵', '64669', '安徽省/合肥市/包河区', '呵呵呵', '额呵呵呵', '18485688', '安徽省/合肥市/包河区', '个告诉过2', '2017-08-21 00:00:00', '2017-08-21 00:00:00', '配送', 0, 0, 0, NULL, NULL, NULL, '2017-09-21 17:29:08');
COMMIT;

-- ----------------------------
-- Table structure for tb_order_goods
-- ----------------------------
DROP TABLE IF EXISTS `tb_order_goods`;
CREATE TABLE `tb_order_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_order_id` int(11) DEFAULT NULL COMMENT '订单表ID',
  `name` varchar(255) DEFAULT NULL COMMENT '货物名称',
  `size` varchar(255) DEFAULT NULL COMMENT '货物的体积',
  `weight` float DEFAULT NULL COMMENT '货物总重量，单位吨',
  `number` int(11) DEFAULT NULL COMMENT '件数',
  `freight` float DEFAULT NULL COMMENT '运费',
  `remark` varchar(255) DEFAULT NULL COMMENT '货物备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=290 DEFAULT CHARSET=utf8 COMMENT='货物信息，用户下单时需要提供货物信息';

-- ----------------------------
-- Records of tb_order_goods
-- ----------------------------
BEGIN;
INSERT INTO `tb_order_goods` VALUES (23, 212, '煤', '0', 2000, 1, 0, '');
INSERT INTO `tb_order_goods` VALUES (24, 213, '煤', '0', 2000, 1, 0, '');
INSERT INTO `tb_order_goods` VALUES (25, 214, '煤', '0', 500, 1, 0, '');
INSERT INTO `tb_order_goods` VALUES (26, 216, '木材', '0', 0, 0, 0, '');
INSERT INTO `tb_order_goods` VALUES (34, 221, '煤', '0', 800, 1, 2160000, '');
INSERT INTO `tb_order_goods` VALUES (35, 221, '', '0', 0, 0, 0, '');
INSERT INTO `tb_order_goods` VALUES (36, 221, '', '0', 0, 0, 0, '');
INSERT INTO `tb_order_goods` VALUES (40, 228, '煤', '0', 35, 35, 9625, '');
INSERT INTO `tb_order_goods` VALUES (41, 230, '煤', '0', 35, 1, 9625, '');
INSERT INTO `tb_order_goods` VALUES (42, 231, '煤', '0', 34.9, 1, 9597.5, '');
INSERT INTO `tb_order_goods` VALUES (43, 232, '煤', '0', 34.7, 1, 9542.5, '');
INSERT INTO `tb_order_goods` VALUES (44, 233, '煤', '0', 34.85, 1, 9409.5, '');
INSERT INTO `tb_order_goods` VALUES (45, 234, '煤', '0', 34.6, 1, 9515, '');
INSERT INTO `tb_order_goods` VALUES (46, 235, '煤', '0', 35.15, 1, 9666.25, '');
INSERT INTO `tb_order_goods` VALUES (47, 236, '煤', '0', 34.8, 1, 9570, '');
INSERT INTO `tb_order_goods` VALUES (48, 237, '煤', '0', 35.1, 1, 9652.5, '');
INSERT INTO `tb_order_goods` VALUES (49, 238, '煤', '0', 34.85, 1, 9583.75, '');
INSERT INTO `tb_order_goods` VALUES (51, 240, '煤', '0', 35.65, 1, 9447.25, '');
INSERT INTO `tb_order_goods` VALUES (52, 241, '煤', '0', 34.4, 1, 9116, '');
INSERT INTO `tb_order_goods` VALUES (54, 243, '煤', '0', 35.35, 1, 9367.75, '');
INSERT INTO `tb_order_goods` VALUES (55, 244, '煤', '0', 35.55, 1, 9420.75, '');
INSERT INTO `tb_order_goods` VALUES (56, 245, '煤', '0', 35, 1, 9275, '');
INSERT INTO `tb_order_goods` VALUES (57, 246, '煤', '0', 35.15, 1, 9314.75, '');
INSERT INTO `tb_order_goods` VALUES (58, 247, '煤', '0', 33.8, 1, 8957, '');
INSERT INTO `tb_order_goods` VALUES (59, 248, '煤', '0', 34.3, 1, 9089.5, '');
INSERT INTO `tb_order_goods` VALUES (60, 249, '煤', '0', 34.85, 1, 9235.25, '');
INSERT INTO `tb_order_goods` VALUES (61, 250, '煤', '0', 35.8, 1, 9487, '');
INSERT INTO `tb_order_goods` VALUES (62, 251, '煤', '0', 34.8, 1, 9222, '');
INSERT INTO `tb_order_goods` VALUES (63, 252, '煤', '0', 35.6, 1, 9434, '');
INSERT INTO `tb_order_goods` VALUES (64, 253, '煤', '0', 34.8, 1, 9222, '');
INSERT INTO `tb_order_goods` VALUES (65, 254, '煤', '0', 35.85, 1, 9500.25, '');
INSERT INTO `tb_order_goods` VALUES (66, 255, '煤', '0', 36.1, 1, 9566.5, '');
INSERT INTO `tb_order_goods` VALUES (67, 256, '煤', '0', 34.85, 1, 9235.25, '');
INSERT INTO `tb_order_goods` VALUES (68, 257, '煤', '0', 35.9, 1, 9513.5, '');
INSERT INTO `tb_order_goods` VALUES (69, 258, '煤', '0', 34.65, 1, 9182.25, '');
INSERT INTO `tb_order_goods` VALUES (70, 259, '煤', '0', 34.65, 1, 9182.25, '');
INSERT INTO `tb_order_goods` VALUES (71, 260, '煤', '0', 35.8, 1, 9487, '');
INSERT INTO `tb_order_goods` VALUES (72, 261, '煤', '0', 35, 1, 9275, '');
INSERT INTO `tb_order_goods` VALUES (73, 262, '煤', '0', 34.65, 1, 9182.25, '');
INSERT INTO `tb_order_goods` VALUES (74, 263, '煤', '0', 34.85, 1, 9235.25, '');
INSERT INTO `tb_order_goods` VALUES (75, 264, '煤', '0', 34.45, 1, 9129.25, '');
INSERT INTO `tb_order_goods` VALUES (76, 265, '煤', '0', 34.75, 1, 9208.75, '');
INSERT INTO `tb_order_goods` VALUES (77, 266, '煤', '0', 34.9, 1, 9248.5, '');
INSERT INTO `tb_order_goods` VALUES (79, 268, '煤', '0', 34.05, 1, 9023.25, '');
INSERT INTO `tb_order_goods` VALUES (80, 269, '煤', '0', 34, 1, 9010, '');
INSERT INTO `tb_order_goods` VALUES (81, 270, '煤', '0', 35, 1, 9275, '');
INSERT INTO `tb_order_goods` VALUES (82, 271, '煤', '0', 35.3, 1, 9354.5, '');
INSERT INTO `tb_order_goods` VALUES (83, 272, '煤', '0', 34.65, 1, 9182.25, '');
INSERT INTO `tb_order_goods` VALUES (85, 274, '煤', '0', 35.35, 1, 9367.75, '');
INSERT INTO `tb_order_goods` VALUES (86, 275, '煤', '0', 34.5, 1, 9142.5, '');
INSERT INTO `tb_order_goods` VALUES (87, 276, '煤', '0', 34.55, 1, 9155.75, '');
INSERT INTO `tb_order_goods` VALUES (88, 277, '煤', '0', 33.85, 1, 8970.25, '');
INSERT INTO `tb_order_goods` VALUES (89, 278, '煤', '0', 34.05, 1, 9023.25, '');
INSERT INTO `tb_order_goods` VALUES (90, 279, '煤', '0', 33.8, 1, 8957, '');
INSERT INTO `tb_order_goods` VALUES (91, 280, '煤', '0', 35.3, 1, 9354.5, '');
INSERT INTO `tb_order_goods` VALUES (92, 281, '煤', '0', 35.3, 1, 9354.5, '');
INSERT INTO `tb_order_goods` VALUES (93, 282, '煤', '0', 35.58, 1, 9428.7, '');
INSERT INTO `tb_order_goods` VALUES (94, 283, '煤', '0', 35.9, 1, 9513.5, '');
INSERT INTO `tb_order_goods` VALUES (95, 284, '煤', '0', 35.12, 1, 9306.8, '');
INSERT INTO `tb_order_goods` VALUES (96, 285, '煤', '0', 35.14, 1, 9312.1, '');
INSERT INTO `tb_order_goods` VALUES (97, 286, '煤', '0', 35.44, 1, 9391.6, '');
INSERT INTO `tb_order_goods` VALUES (98, 287, '煤', '0', 35.6, 1, 9434, '');
INSERT INTO `tb_order_goods` VALUES (99, 288, '煤', '0', 35.32, 1, 9359.8, '');
INSERT INTO `tb_order_goods` VALUES (100, 289, '煤', '0', 35.54, 1, 9418.1, '');
INSERT INTO `tb_order_goods` VALUES (101, 290, '煤', '0', 35.26, 1, 9343.9, '');
INSERT INTO `tb_order_goods` VALUES (103, 292, '煤', '0', 35.74, 1, 9471.1, '');
INSERT INTO `tb_order_goods` VALUES (104, 293, '煤', '0', 35.9, 1, 9513.5, '');
INSERT INTO `tb_order_goods` VALUES (105, 294, '煤', '0', 34.72, 1, 9200.8, '');
INSERT INTO `tb_order_goods` VALUES (106, 295, '煤', '0', 34.86, 1, 9237.9, '');
INSERT INTO `tb_order_goods` VALUES (107, 296, '煤', '0', 33.92, 1, 8988.8, '');
INSERT INTO `tb_order_goods` VALUES (108, 297, '煤', '0', 34.86, 1, 9237.9, '');
INSERT INTO `tb_order_goods` VALUES (109, 298, '煤', '0', 34.3, 1, 9089.5, '');
INSERT INTO `tb_order_goods` VALUES (110, 299, '煤', '0', 35.28, 1, 9349.2, '');
INSERT INTO `tb_order_goods` VALUES (111, 300, '煤', '0', 33.94, 1, 8994.1, '');
INSERT INTO `tb_order_goods` VALUES (112, 301, '煤', '0', 34.68, 1, 9190.2, '');
INSERT INTO `tb_order_goods` VALUES (113, 302, '煤', '0', 35.46, 1, 9396.9, '');
INSERT INTO `tb_order_goods` VALUES (114, 303, '煤', '0', 35.2, 1, 9328, '');
INSERT INTO `tb_order_goods` VALUES (115, 304, '煤', '0', 34.68, 1, 9190.2, '');
INSERT INTO `tb_order_goods` VALUES (116, 305, '煤', '0', 34.88, 1, 9243.2, '');
INSERT INTO `tb_order_goods` VALUES (117, 306, '煤', '0', 34.24, 1, 9073.6, '');
INSERT INTO `tb_order_goods` VALUES (118, 307, '煤', '0', 34.6, 1, 9169, '');
INSERT INTO `tb_order_goods` VALUES (119, 308, '煤', '0', 35.82, 1, 9492.3, '');
INSERT INTO `tb_order_goods` VALUES (120, 309, '煤', '0', 35.9, 1, 9513.5, '');
INSERT INTO `tb_order_goods` VALUES (121, 310, '煤', '0', 34.8, 1, 9222, '');
INSERT INTO `tb_order_goods` VALUES (122, 311, '煤', '0', 35.34, 1, 9365.1, '');
INSERT INTO `tb_order_goods` VALUES (123, 312, '煤', '0', 35.28, 1, 9349.2, '');
INSERT INTO `tb_order_goods` VALUES (124, 313, '煤', '0', 34.28, 1, 9084.2, '');
INSERT INTO `tb_order_goods` VALUES (125, 314, '煤', '0', 35.28, 1, 9349.2, '');
INSERT INTO `tb_order_goods` VALUES (126, 315, '煤', '0', 35.38, 1, 9375.7, '');
INSERT INTO `tb_order_goods` VALUES (127, 315, '', '0', 0, 0, 0, '');
INSERT INTO `tb_order_goods` VALUES (128, 316, '煤', '0', 35.08, 1, 9296.2, '');
INSERT INTO `tb_order_goods` VALUES (129, 317, '煤', '0', 35.68, 1, 9455.2, '');
INSERT INTO `tb_order_goods` VALUES (130, 318, '煤', '0', 34.34, 1, 9100.1, '');
INSERT INTO `tb_order_goods` VALUES (131, 319, '煤', '0', 35.3, 1, 9354.5, '');
INSERT INTO `tb_order_goods` VALUES (132, 320, '煤', '0', 35.74, 1, 9471.1, '');
INSERT INTO `tb_order_goods` VALUES (133, 321, '煤', '0', 34.86, 1, 9237.9, '');
INSERT INTO `tb_order_goods` VALUES (134, 322, '煤', '0', 34.84, 1, 9232.6, '');
INSERT INTO `tb_order_goods` VALUES (135, 323, '煤', '0', 35.04, 1, 9285.6, '');
INSERT INTO `tb_order_goods` VALUES (136, 324, '煤', '0', 34.74, 1, 9206.1, '');
INSERT INTO `tb_order_goods` VALUES (137, 325, '煤', '0', 35.2, 1, 9328, '');
INSERT INTO `tb_order_goods` VALUES (138, 326, '煤', '0', 35.06, 1, 9290.9, '');
INSERT INTO `tb_order_goods` VALUES (139, 327, '煤', '0', 34.96, 1, 9264.4, '');
INSERT INTO `tb_order_goods` VALUES (140, 328, '煤', '0', 34.78, 1, 9216.7, '');
INSERT INTO `tb_order_goods` VALUES (141, 329, '煤', '0', 34.92, 1, 9253.8, '');
INSERT INTO `tb_order_goods` VALUES (142, 330, '煤', '0', 35.2, 1, 9328, '');
INSERT INTO `tb_order_goods` VALUES (143, 331, '煤', '0', 35.3, 1, 9354.5, '');
INSERT INTO `tb_order_goods` VALUES (144, 332, '煤', '0', 35.32, 1, 9359.8, '');
INSERT INTO `tb_order_goods` VALUES (145, 333, '煤', '0', 34.8, 1, 9222, '');
INSERT INTO `tb_order_goods` VALUES (146, 334, '煤', '0', 34.86, 1, 9237.9, '');
INSERT INTO `tb_order_goods` VALUES (147, 335, '煤', '0', 35.06, 1, 9290.9, '');
INSERT INTO `tb_order_goods` VALUES (148, 336, '煤', '0', 35.42, 1, 9386.3, '');
INSERT INTO `tb_order_goods` VALUES (149, 337, '煤', '0', 34.82, 1, 9227.3, '');
INSERT INTO `tb_order_goods` VALUES (150, 338, '煤', '0', 34.28, 1, 9084.2, '');
INSERT INTO `tb_order_goods` VALUES (151, 339, '煤', '0', 35.26, 1, 9343.9, '');
INSERT INTO `tb_order_goods` VALUES (152, 340, '煤', '0', 34.94, 1, 9259.1, '');
INSERT INTO `tb_order_goods` VALUES (153, 341, '煤', '0', 35.52, 1, 9412.8, '');
INSERT INTO `tb_order_goods` VALUES (154, 342, '煤', '0', 35.28, 1, 9349.2, '');
INSERT INTO `tb_order_goods` VALUES (155, 343, '煤', '0', 35.16, 1, 9317.4, '');
INSERT INTO `tb_order_goods` VALUES (156, 344, '煤', '0', 35.26, 1, 9343.9, '');
INSERT INTO `tb_order_goods` VALUES (157, 345, '煤', '0', 35.04, 1, 9285.6, '');
INSERT INTO `tb_order_goods` VALUES (158, 346, '煤', '0', 34.9, 1, 9248.5, '');
INSERT INTO `tb_order_goods` VALUES (159, 347, '煤', '0', 34.76, 1, 9211.4, '');
INSERT INTO `tb_order_goods` VALUES (160, 348, '煤', '0', 34.54, 1, 9153.1, '');
INSERT INTO `tb_order_goods` VALUES (161, 349, '煤', '0', 34.7, 1, 9195.5, '');
INSERT INTO `tb_order_goods` VALUES (162, 350, '煤', '0', 34.92, 1, 9253.8, '');
INSERT INTO `tb_order_goods` VALUES (163, 351, '煤', '0', 35.2, 1, 9328, '');
INSERT INTO `tb_order_goods` VALUES (164, 352, '煤', '0', 35.22, 1, 9333.3, '');
INSERT INTO `tb_order_goods` VALUES (165, 353, '煤', '0', 34.82, 1, 9227.3, '');
INSERT INTO `tb_order_goods` VALUES (166, 354, '煤', '0', 35.24, 1, 9338.6, '');
INSERT INTO `tb_order_goods` VALUES (167, 355, '煤', '0', 34.14, 1, 9047.1, '');
INSERT INTO `tb_order_goods` VALUES (168, 356, '煤', '0', 34.58, 1, 9163.7, '');
INSERT INTO `tb_order_goods` VALUES (169, 357, '煤', '0', 34.9, 1, 9248.5, '');
INSERT INTO `tb_order_goods` VALUES (170, 358, '煤', '0', 35.14, 1, 9312.1, '');
INSERT INTO `tb_order_goods` VALUES (171, 359, '煤', '0', 34.76, 1, 9211.4, '');
INSERT INTO `tb_order_goods` VALUES (172, 360, '煤', '0', 34.98, 1, 9269.7, '');
INSERT INTO `tb_order_goods` VALUES (173, 361, '煤', '0', 34.7, 1, 9195.5, '');
INSERT INTO `tb_order_goods` VALUES (174, 362, '煤', '0', 34.72, 1, 9200.8, '');
INSERT INTO `tb_order_goods` VALUES (175, 363, '煤', '0', 36.14, 1, 9577.1, '');
INSERT INTO `tb_order_goods` VALUES (176, 364, '煤', '0', 33.72, 1, 8935.8, '');
INSERT INTO `tb_order_goods` VALUES (177, 365, '煤', '0', 36.2, 1, 9593, '');
INSERT INTO `tb_order_goods` VALUES (178, 366, '煤', '0', 34.16, 1, 9052.4, '');
INSERT INTO `tb_order_goods` VALUES (179, 367, '煤', '0', 35.34, 1, 9365.1, '');
INSERT INTO `tb_order_goods` VALUES (180, 368, '煤', '0', 35.28, 1, 9349.2, '');
INSERT INTO `tb_order_goods` VALUES (181, 369, '煤', '0', 34.82, 1, 9227.3, '');
INSERT INTO `tb_order_goods` VALUES (182, 370, '煤', '0', 35.18, 1, 9322.7, '');
INSERT INTO `tb_order_goods` VALUES (183, 371, '煤', '0', 35.34, 1, 9365.1, '');
INSERT INTO `tb_order_goods` VALUES (185, 373, '煤', '0', 34.48, 1, 9137.2, '');
INSERT INTO `tb_order_goods` VALUES (186, 374, '煤', '0', 35.36, 1, 9370.4, '');
INSERT INTO `tb_order_goods` VALUES (187, 375, '煤', '0', 35.6, 1, 9434, '');
INSERT INTO `tb_order_goods` VALUES (188, 376, '煤', '0', 35.24, 1, 9338.6, '');
INSERT INTO `tb_order_goods` VALUES (189, 377, '煤', '0', 35.14, 1, 9312.1, '');
INSERT INTO `tb_order_goods` VALUES (190, 378, '煤', '0', 35.06, 1, 9290.9, '');
INSERT INTO `tb_order_goods` VALUES (191, 379, '煤', '0', 35.28, 1, 9349.2, '');
INSERT INTO `tb_order_goods` VALUES (192, 380, '煤', '0', 35.8, 1, 9487, '');
INSERT INTO `tb_order_goods` VALUES (193, 381, '煤', '0', 34.56, 1, 9158.4, '');
INSERT INTO `tb_order_goods` VALUES (194, 382, '煤', '0', 35.2, 1, 9328, '');
INSERT INTO `tb_order_goods` VALUES (195, 383, '煤', '0', 34.78, 1, 9216.7, '');
INSERT INTO `tb_order_goods` VALUES (196, 384, '煤', '0', 34.52, 1, 9147.8, '');
INSERT INTO `tb_order_goods` VALUES (197, 385, '煤', '0', 34.52, 1, 9147.8, '');
INSERT INTO `tb_order_goods` VALUES (198, 386, '煤', '0', 34.82, 1, 9227.3, '');
INSERT INTO `tb_order_goods` VALUES (199, 387, '煤', '0', 34.86, 1, 9237.9, '');
INSERT INTO `tb_order_goods` VALUES (200, 388, '煤', '0', 35.12, 1, 9306.8, '');
INSERT INTO `tb_order_goods` VALUES (201, 389, '煤', '0', 34.96, 1, 9264.4, '');
INSERT INTO `tb_order_goods` VALUES (202, 390, '煤', '0', 34.72, 1, 9200.8, '');
INSERT INTO `tb_order_goods` VALUES (203, 391, '煤', '0', 35.14, 1, 9312.1, '');
INSERT INTO `tb_order_goods` VALUES (204, 392, '煤', '0', 35.38, 1, 9375.7, '');
INSERT INTO `tb_order_goods` VALUES (205, 393, '煤', '0', 35.16, 1, 9317.4, '');
INSERT INTO `tb_order_goods` VALUES (206, 394, '煤', '0', 35.2, 1, 9328, '');
INSERT INTO `tb_order_goods` VALUES (207, 395, '煤', '0', 35.88, 1, 9508.2, '');
INSERT INTO `tb_order_goods` VALUES (208, 396, '煤', '0', 35.32, 1, 9359.8, '');
INSERT INTO `tb_order_goods` VALUES (209, 397, '煤', '0', 34.52, 1, 9147.8, '');
INSERT INTO `tb_order_goods` VALUES (210, 398, '煤', '0', 34.46, 1, 9131.9, '');
INSERT INTO `tb_order_goods` VALUES (211, 399, '煤', '0', 34.86, 1, 9237.9, '');
INSERT INTO `tb_order_goods` VALUES (212, 400, '煤', '0', 34.78, 1, 9216.7, '');
INSERT INTO `tb_order_goods` VALUES (213, 401, '煤', '0', 34.96, 1, 9264.4, '');
INSERT INTO `tb_order_goods` VALUES (214, 402, '煤', '0', 34.62, 1, 9174.3, '');
INSERT INTO `tb_order_goods` VALUES (215, 403, '煤', '0', 35.32, 1, 9359.8, '');
INSERT INTO `tb_order_goods` VALUES (216, 404, '煤', '0', 35.1, 1, 9301.5, '');
INSERT INTO `tb_order_goods` VALUES (217, 405, '煤', '0', 34.96, 1, 9264.4, '');
INSERT INTO `tb_order_goods` VALUES (218, 406, '煤', '0', 34.78, 1, 9216.7, '');
INSERT INTO `tb_order_goods` VALUES (219, 407, '煤', '0', 36.1, 1, 9566.5, '');
INSERT INTO `tb_order_goods` VALUES (220, 408, '煤', '0', 34.58, 1, 9163.7, '');
INSERT INTO `tb_order_goods` VALUES (221, 409, '煤', '0', 35.14, 1, 9312.1, '');
INSERT INTO `tb_order_goods` VALUES (222, 410, '煤', '0', 34.98, 1, 9269.7, '');
INSERT INTO `tb_order_goods` VALUES (223, 411, '煤', '0', 35.72, 1, 9465.8, '');
INSERT INTO `tb_order_goods` VALUES (224, 412, '煤', '0', 35.38, 1, 9375.7, '');
INSERT INTO `tb_order_goods` VALUES (225, 413, '煤', '0', 34.88, 1, 9243.2, '');
INSERT INTO `tb_order_goods` VALUES (226, 414, '煤', '0', 35.38, 1, 9375.7, '');
INSERT INTO `tb_order_goods` VALUES (227, 415, '煤', '0', 35.34, 1, 9365.1, '');
INSERT INTO `tb_order_goods` VALUES (228, 416, '煤', '0', 35.88, 1, 9508.2, '');
INSERT INTO `tb_order_goods` VALUES (230, 418, '煤', '0', 34.76, 1, 9211.4, '');
INSERT INTO `tb_order_goods` VALUES (231, 419, '煤', '0', 36.2, 1, 9593, '');
INSERT INTO `tb_order_goods` VALUES (232, 420, '煤', '0', 34.82, 1, 9227.3, '');
INSERT INTO `tb_order_goods` VALUES (233, 421, '煤', '0', 34.6, 1, 9169, '');
INSERT INTO `tb_order_goods` VALUES (234, 422, '煤', '0', 35.28, 1, 9349.2, '');
INSERT INTO `tb_order_goods` VALUES (235, 423, '煤', '0', 35.16, 1, 9317.4, '');
INSERT INTO `tb_order_goods` VALUES (236, 424, '煤', '0', 34.4, 1, 9116, '');
INSERT INTO `tb_order_goods` VALUES (237, 425, '煤', '0', 34.72, 1, 9200.8, '');
INSERT INTO `tb_order_goods` VALUES (238, 426, '煤', '0', 35.18, 1, 9322.7, '');
INSERT INTO `tb_order_goods` VALUES (239, 427, '煤', '0', 34.96, 1, 9264.4, '');
INSERT INTO `tb_order_goods` VALUES (240, 428, '煤', '0', 34.9, 1, 9248.5, '');
INSERT INTO `tb_order_goods` VALUES (241, 429, '煤', '0', 35.2, 1, 9328, '');
INSERT INTO `tb_order_goods` VALUES (266, 453, '煤', '0', 33.9, 1, 9153, '');
INSERT INTO `tb_order_goods` VALUES (267, 454, '煤', '0', 33.9, 1, 9153, '');
INSERT INTO `tb_order_goods` VALUES (268, 455, '煤', '0', 34.14, 1, 9218, '');
INSERT INTO `tb_order_goods` VALUES (269, 456, '煤', '0', 39, 1, 10530, '');
INSERT INTO `tb_order_goods` VALUES (270, 457, '煤', '0', 34.78, 1, 9391, '');
INSERT INTO `tb_order_goods` VALUES (284, 472, '还是上班', '呵呵呵', 646499, 8558, NULL, '呵呵呵');
INSERT INTO `tb_order_goods` VALUES (285, 472, '呵呵呵', '呵呵呵', 669.55, 854, NULL, '患得患失');
INSERT INTO `tb_order_goods` VALUES (286, 472, '不说是吧', '呵呵', 9494, 45, NULL, '额呵呵呵');
INSERT INTO `tb_order_goods` VALUES (287, 474, '呵呵呵', '', 6464700, 8455, NULL, '');
INSERT INTO `tb_order_goods` VALUES (288, 474, '合适的话', '', 959, 545, NULL, '');
INSERT INTO `tb_order_goods` VALUES (289, 475, '呵呵呵呵呵呵', '', 9599, 848, NULL, '');
COMMIT;

-- ----------------------------
-- Table structure for tb_order_sign
-- ----------------------------
DROP TABLE IF EXISTS `tb_order_sign`;
CREATE TABLE `tb_order_sign` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_order_id` int(11) DEFAULT NULL COMMENT '订单表id',
  `order_img` varchar(5000) DEFAULT NULL COMMENT '签收照片',
  `fk_fleet_driver` int(11) DEFAULT NULL COMMENT '签收司机外键',
  `is_fleet_driver` tinyint(4) DEFAULT NULL COMMENT '是否司机签收',
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='定单签收表';

-- ----------------------------
-- Records of tb_order_sign
-- ----------------------------
BEGIN;
INSERT INTO `tb_order_sign` VALUES (15, 216, 'http://otj3hc8no.bkt.clouddn.com/FnotfNLcQBCefEU4OpP1_61kxOj6', NULL, NULL, '2017-08-07 02:41:14');
COMMIT;

-- ----------------------------
-- Table structure for tb_order_status
-- ----------------------------
DROP TABLE IF EXISTS `tb_order_status`;
CREATE TABLE `tb_order_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_order_id` int(11) DEFAULT NULL,
  `order_number` varchar(100) NOT NULL COMMENT '订单编号，随机生成',
  `status` varchar(50) NOT NULL COMMENT '订单当前状态信息',
  `fk_user_id` int(11) NOT NULL COMMENT '操作的用户标识',
  `time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=582 DEFAULT CHARSET=utf8 COMMENT='记录订单状态变更';

-- ----------------------------
-- Records of tb_order_status
-- ----------------------------
BEGIN;
INSERT INTO `tb_order_status` VALUES (75, 0, '20170804174124117', 'ORDER_PLACE', 127, '2017-08-04 09:41:12');
INSERT INTO `tb_order_status` VALUES (76, 213, '20170804175158033', 'ORDER_PLACE', 127, '2017-08-04 09:51:51');
INSERT INTO `tb_order_status` VALUES (77, 214, '20170804175477314', 'ORDER_PLACE', 127, '2017-08-04 09:54:55');
INSERT INTO `tb_order_status` VALUES (78, NULL, '20170806203416507', 'ORDER_PLACE', 129, '2017-08-06 12:34:23');
INSERT INTO `tb_order_status` VALUES (79, NULL, '20170806203416507', 'ORDER_TAKING', 129, '2017-08-06 12:34:32');
INSERT INTO `tb_order_status` VALUES (80, NULL, '20170806203416507', 'ORDER_SIGN', 129, '2017-08-06 12:35:03');
INSERT INTO `tb_order_status` VALUES (81, NULL, '20170807103463303', 'ORDER_PLACE', 127, '2017-08-07 02:34:16');
INSERT INTO `tb_order_status` VALUES (82, NULL, '20170807103463303', 'ORDER_TAKING', 127, '2017-08-07 02:34:57');
INSERT INTO `tb_order_status` VALUES (83, NULL, '20170807103463303', 'ORDER_SIGN', 127, '2017-08-07 02:41:14');
INSERT INTO `tb_order_status` VALUES (84, NULL, '20170807182808636', 'ORDER_PLACE', 129, '2017-08-07 18:28:23');
INSERT INTO `tb_order_status` VALUES (85, NULL, '20170807183053836', 'ORDER_PLACE', 129, '2017-08-07 18:30:16');
INSERT INTO `tb_order_status` VALUES (86, NULL, '20170807184421652', 'ORDER_PLACE', 129, '2017-08-07 18:44:50');
INSERT INTO `tb_order_status` VALUES (87, NULL, '20170809151130525', 'ORDER_PLACE', 127, '2017-08-09 15:11:30');
INSERT INTO `tb_order_status` VALUES (88, NULL, '20170810172786187', 'ORDER_PLACE', 135, '2017-08-10 17:27:50');
INSERT INTO `tb_order_status` VALUES (89, NULL, '20170810175187841', 'ORDER_PLACE', 134, '2017-08-10 17:51:11');
INSERT INTO `tb_order_status` VALUES (90, NULL, '20170811114101343', 'ORDER_PLACE', 129, '2017-08-11 11:41:45');
INSERT INTO `tb_order_status` VALUES (91, NULL, '20170816153925546', 'ORDER_PLACE', 135, '2017-08-16 15:39:45');
INSERT INTO `tb_order_status` VALUES (92, NULL, '20170816154388836', 'ORDER_PLACE', 135, '2017-08-16 15:43:12');
INSERT INTO `tb_order_status` VALUES (93, NULL, '20170816154512686', 'ORDER_PLACE', 135, '2017-08-16 15:45:25');
INSERT INTO `tb_order_status` VALUES (94, NULL, '20170816154741255', 'ORDER_PLACE', 135, '2017-08-16 15:47:30');
INSERT INTO `tb_order_status` VALUES (95, NULL, '20170816154936300', 'ORDER_PLACE', 135, '2017-08-16 15:49:16');
INSERT INTO `tb_order_status` VALUES (96, NULL, '20170816155141025', 'ORDER_PLACE', 135, '2017-08-16 15:51:35');
INSERT INTO `tb_order_status` VALUES (97, NULL, '20170816155464348', 'ORDER_PLACE', 135, '2017-08-16 15:54:23');
INSERT INTO `tb_order_status` VALUES (98, NULL, '20170816155877081', 'ORDER_PLACE', 135, '2017-08-16 15:58:58');
INSERT INTO `tb_order_status` VALUES (99, NULL, '20170816160036755', 'ORDER_PLACE', 135, '2017-08-16 16:00:44');
INSERT INTO `tb_order_status` VALUES (100, NULL, '20170816160240262', 'ORDER_PLACE', 135, '2017-08-16 16:02:29');
INSERT INTO `tb_order_status` VALUES (101, NULL, '20170816160412101', 'ORDER_PLACE', 135, '2017-08-16 16:04:05');
INSERT INTO `tb_order_status` VALUES (102, NULL, '20170816160678668', 'ORDER_PLACE', 135, '2017-08-16 16:06:16');
INSERT INTO `tb_order_status` VALUES (103, NULL, '20170816160788004', 'ORDER_PLACE', 135, '2017-08-16 16:07:54');
INSERT INTO `tb_order_status` VALUES (104, NULL, '20170816160941824', 'ORDER_PLACE', 135, '2017-08-16 16:09:26');
INSERT INTO `tb_order_status` VALUES (105, NULL, '20170816163323810', 'ORDER_PLACE', 135, '2017-08-16 16:33:37');
INSERT INTO `tb_order_status` VALUES (106, NULL, '20170816163587243', 'ORDER_PLACE', 135, '2017-08-16 16:35:51');
INSERT INTO `tb_order_status` VALUES (107, NULL, '20170816163814583', 'ORDER_PLACE', 135, '2017-08-16 16:38:54');
INSERT INTO `tb_order_status` VALUES (108, NULL, '20170816164080408', 'ORDER_PLACE', 135, '2017-08-16 16:40:51');
INSERT INTO `tb_order_status` VALUES (109, NULL, '20170816164337186', 'ORDER_PLACE', 135, '2017-08-16 16:43:47');
INSERT INTO `tb_order_status` VALUES (110, NULL, '20170816164603623', 'ORDER_PLACE', 135, '2017-08-16 16:46:14');
INSERT INTO `tb_order_status` VALUES (111, NULL, '20170816164931544', 'ORDER_PLACE', 135, '2017-08-16 16:49:19');
INSERT INTO `tb_order_status` VALUES (112, NULL, '20170816165127406', 'ORDER_PLACE', 135, '2017-08-16 16:51:02');
INSERT INTO `tb_order_status` VALUES (113, NULL, '20170816165262472', 'ORDER_PLACE', 135, '2017-08-16 16:52:36');
INSERT INTO `tb_order_status` VALUES (114, NULL, '20170816165422174', 'ORDER_PLACE', 135, '2017-08-16 16:54:38');
INSERT INTO `tb_order_status` VALUES (115, NULL, '20170816165653086', 'ORDER_PLACE', 135, '2017-08-16 16:56:12');
INSERT INTO `tb_order_status` VALUES (116, NULL, '20170816165714043', 'ORDER_PLACE', 135, '2017-08-16 16:57:37');
INSERT INTO `tb_order_status` VALUES (117, NULL, '20170816165933474', 'ORDER_PLACE', 135, '2017-08-16 16:59:05');
INSERT INTO `tb_order_status` VALUES (118, NULL, '20170816170008235', 'ORDER_PLACE', 135, '2017-08-16 17:00:25');
INSERT INTO `tb_order_status` VALUES (119, NULL, '20170816170246532', 'ORDER_PLACE', 135, '2017-08-16 17:02:48');
INSERT INTO `tb_order_status` VALUES (120, NULL, '20170816170465067', 'ORDER_PLACE', 135, '2017-08-16 17:04:38');
INSERT INTO `tb_order_status` VALUES (121, NULL, '20170816170564513', 'ORDER_PLACE', 135, '2017-08-16 17:05:53');
INSERT INTO `tb_order_status` VALUES (122, NULL, '20170816170752010', 'ORDER_PLACE', 135, '2017-08-16 17:07:13');
INSERT INTO `tb_order_status` VALUES (123, NULL, '20170816170824687', 'ORDER_PLACE', 135, '2017-08-16 17:08:34');
INSERT INTO `tb_order_status` VALUES (124, NULL, '20170816171060814', 'ORDER_PLACE', 135, '2017-08-16 17:10:08');
INSERT INTO `tb_order_status` VALUES (125, NULL, '20170816171107487', 'ORDER_PLACE', 135, '2017-08-16 17:11:38');
INSERT INTO `tb_order_status` VALUES (126, NULL, '20170816171345100', 'ORDER_PLACE', 135, '2017-08-16 17:13:22');
INSERT INTO `tb_order_status` VALUES (127, NULL, '20170816171573117', 'ORDER_PLACE', 135, '2017-08-16 17:15:21');
INSERT INTO `tb_order_status` VALUES (128, NULL, '20170816171657063', 'ORDER_PLACE', 135, '2017-08-16 17:16:44');
INSERT INTO `tb_order_status` VALUES (129, NULL, '20170816171800117', 'ORDER_PLACE', 135, '2017-08-16 17:18:14');
INSERT INTO `tb_order_status` VALUES (130, NULL, '20170816171983325', 'ORDER_PLACE', 135, '2017-08-16 17:19:44');
INSERT INTO `tb_order_status` VALUES (131, NULL, '20170816172125567', 'ORDER_PLACE', 135, '2017-08-16 17:21:01');
INSERT INTO `tb_order_status` VALUES (132, NULL, '20170816172274825', 'ORDER_PLACE', 135, '2017-08-16 17:22:18');
INSERT INTO `tb_order_status` VALUES (133, NULL, '20170816172577740', 'ORDER_PLACE', 135, '2017-08-16 17:25:01');
INSERT INTO `tb_order_status` VALUES (134, NULL, '20170816172686708', 'ORDER_PLACE', 135, '2017-08-16 17:26:24');
INSERT INTO `tb_order_status` VALUES (135, NULL, '20170816172963420', 'ORDER_PLACE', 135, '2017-08-16 17:29:29');
INSERT INTO `tb_order_status` VALUES (136, NULL, '20170816173165180', 'ORDER_PLACE', 135, '2017-08-16 17:31:05');
INSERT INTO `tb_order_status` VALUES (137, NULL, '20170816173288383', 'ORDER_PLACE', 135, '2017-08-16 17:32:34');
INSERT INTO `tb_order_status` VALUES (138, NULL, '20170816173452840', 'ORDER_PLACE', 135, '2017-08-16 17:34:25');
INSERT INTO `tb_order_status` VALUES (139, NULL, '20170816173564083', 'ORDER_PLACE', 135, '2017-08-16 17:35:54');
INSERT INTO `tb_order_status` VALUES (140, NULL, '20170816173772653', 'ORDER_PLACE', 135, '2017-08-16 17:37:13');
INSERT INTO `tb_order_status` VALUES (141, NULL, '20170816173832156', 'ORDER_PLACE', 135, '2017-08-16 17:38:31');
INSERT INTO `tb_order_status` VALUES (142, NULL, '20170816173978224', 'ORDER_PLACE', 135, '2017-08-16 17:39:57');
INSERT INTO `tb_order_status` VALUES (143, NULL, '20170816174173580', 'ORDER_PLACE', 135, '2017-08-16 17:41:50');
INSERT INTO `tb_order_status` VALUES (144, NULL, '20170816174302538', 'ORDER_PLACE', 135, '2017-08-16 17:43:07');
INSERT INTO `tb_order_status` VALUES (145, NULL, '20170816174461184', 'ORDER_PLACE', 135, '2017-08-16 17:44:25');
INSERT INTO `tb_order_status` VALUES (146, NULL, '20170816174544843', 'ORDER_PLACE', 135, '2017-08-16 17:45:43');
INSERT INTO `tb_order_status` VALUES (147, NULL, '20170816174737302', 'ORDER_PLACE', 135, '2017-08-16 17:47:06');
INSERT INTO `tb_order_status` VALUES (148, NULL, '20170817102821333', 'ORDER_PLACE', 135, '2017-08-17 10:28:48');
INSERT INTO `tb_order_status` VALUES (149, NULL, '20170817103230753', 'ORDER_PLACE', 135, '2017-08-17 10:32:05');
INSERT INTO `tb_order_status` VALUES (150, NULL, '20170817103342115', 'ORDER_PLACE', 135, '2017-08-17 10:33:40');
INSERT INTO `tb_order_status` VALUES (151, NULL, '20170817103544545', 'ORDER_PLACE', 135, '2017-08-17 10:35:06');
INSERT INTO `tb_order_status` VALUES (152, NULL, '20170817103653321', 'ORDER_PLACE', 135, '2017-08-17 10:36:49');
INSERT INTO `tb_order_status` VALUES (153, NULL, '20170817103738861', 'ORDER_PLACE', 135, '2017-08-17 10:37:59');
INSERT INTO `tb_order_status` VALUES (154, NULL, '20170817103906486', 'ORDER_PLACE', 135, '2017-08-17 10:39:18');
INSERT INTO `tb_order_status` VALUES (155, NULL, '20170817104033557', 'ORDER_PLACE', 135, '2017-08-17 10:40:31');
INSERT INTO `tb_order_status` VALUES (156, NULL, '20170817104288402', 'ORDER_PLACE', 135, '2017-08-17 10:42:17');
INSERT INTO `tb_order_status` VALUES (157, NULL, '20170817104348662', 'ORDER_PLACE', 135, '2017-08-17 10:43:50');
INSERT INTO `tb_order_status` VALUES (158, NULL, '20170817104680208', 'ORDER_PLACE', 135, '2017-08-17 10:46:07');
INSERT INTO `tb_order_status` VALUES (159, NULL, '20170817104747312', 'ORDER_PLACE', 135, '2017-08-17 10:47:36');
INSERT INTO `tb_order_status` VALUES (160, NULL, '20170817104874412', 'ORDER_PLACE', 135, '2017-08-17 10:48:46');
INSERT INTO `tb_order_status` VALUES (161, NULL, '20170817105043446', 'ORDER_PLACE', 135, '2017-08-17 10:50:23');
INSERT INTO `tb_order_status` VALUES (162, NULL, '20170817105117001', 'ORDER_PLACE', 135, '2017-08-17 10:51:32');
INSERT INTO `tb_order_status` VALUES (163, NULL, '20170817105273485', 'ORDER_PLACE', 135, '2017-08-17 10:52:46');
INSERT INTO `tb_order_status` VALUES (164, NULL, '20170817105426888', 'ORDER_PLACE', 135, '2017-08-17 10:54:36');
INSERT INTO `tb_order_status` VALUES (165, NULL, '20170817105571467', 'ORDER_PLACE', 135, '2017-08-17 10:55:46');
INSERT INTO `tb_order_status` VALUES (166, NULL, '20170817105631270', 'ORDER_PLACE', 135, '2017-08-17 10:56:52');
INSERT INTO `tb_order_status` VALUES (167, NULL, '20170817105827785', 'ORDER_PLACE', 135, '2017-08-17 10:58:22');
INSERT INTO `tb_order_status` VALUES (168, NULL, '20170817105972077', 'ORDER_PLACE', 135, '2017-08-17 10:59:47');
INSERT INTO `tb_order_status` VALUES (169, NULL, '20170817110170574', 'ORDER_PLACE', 135, '2017-08-17 11:01:03');
INSERT INTO `tb_order_status` VALUES (170, NULL, '20170817110207647', 'ORDER_PLACE', 135, '2017-08-17 11:02:22');
INSERT INTO `tb_order_status` VALUES (171, NULL, '20170817110300543', 'ORDER_PLACE', 135, '2017-08-17 11:03:35');
INSERT INTO `tb_order_status` VALUES (172, NULL, '20170817110436052', 'ORDER_PLACE', 135, '2017-08-17 11:04:49');
INSERT INTO `tb_order_status` VALUES (173, NULL, '20170817110614803', 'ORDER_PLACE', 135, '2017-08-17 11:06:01');
INSERT INTO `tb_order_status` VALUES (174, NULL, '20170817110777860', 'ORDER_PLACE', 135, '2017-08-17 11:07:21');
INSERT INTO `tb_order_status` VALUES (175, NULL, '20170817110844113', 'ORDER_PLACE', 135, '2017-08-17 11:08:28');
INSERT INTO `tb_order_status` VALUES (176, NULL, '20170817110905688', 'ORDER_PLACE', 135, '2017-08-17 11:09:50');
INSERT INTO `tb_order_status` VALUES (177, NULL, '20170817111170635', 'ORDER_PLACE', 135, '2017-08-17 11:11:03');
INSERT INTO `tb_order_status` VALUES (178, NULL, '20170817111244507', 'ORDER_PLACE', 135, '2017-08-17 11:12:20');
INSERT INTO `tb_order_status` VALUES (179, NULL, '20170817111652777', 'ORDER_PLACE', 135, '2017-08-17 11:16:54');
INSERT INTO `tb_order_status` VALUES (180, NULL, '20170817111804521', 'ORDER_PLACE', 135, '2017-08-17 11:18:06');
INSERT INTO `tb_order_status` VALUES (181, NULL, '20170817111928207', 'ORDER_PLACE', 135, '2017-08-17 11:19:17');
INSERT INTO `tb_order_status` VALUES (182, NULL, '20170817112078587', 'ORDER_PLACE', 135, '2017-08-17 11:20:29');
INSERT INTO `tb_order_status` VALUES (183, NULL, '20170817112113355', 'ORDER_PLACE', 135, '2017-08-17 11:21:30');
INSERT INTO `tb_order_status` VALUES (184, NULL, '20170817112233815', 'ORDER_PLACE', 135, '2017-08-17 11:22:35');
INSERT INTO `tb_order_status` VALUES (185, NULL, '20170817112336642', 'ORDER_PLACE', 135, '2017-08-17 11:23:37');
INSERT INTO `tb_order_status` VALUES (186, NULL, '20170817112458742', 'ORDER_PLACE', 135, '2017-08-17 11:24:48');
INSERT INTO `tb_order_status` VALUES (187, NULL, '20170817112561880', 'ORDER_PLACE', 135, '2017-08-17 11:25:56');
INSERT INTO `tb_order_status` VALUES (188, NULL, '20170817112700863', 'ORDER_PLACE', 135, '2017-08-17 11:27:17');
INSERT INTO `tb_order_status` VALUES (189, NULL, '20170817112884257', 'ORDER_PLACE', 135, '2017-08-17 11:28:28');
INSERT INTO `tb_order_status` VALUES (190, NULL, '20170817112921445', 'ORDER_PLACE', 135, '2017-08-17 11:29:44');
INSERT INTO `tb_order_status` VALUES (191, NULL, '20170817113032332', 'ORDER_PLACE', 135, '2017-08-17 11:30:55');
INSERT INTO `tb_order_status` VALUES (192, NULL, '20170817150102166', 'ORDER_PLACE', 135, '2017-08-17 15:01:03');
INSERT INTO `tb_order_status` VALUES (193, NULL, '20170817150273740', 'ORDER_PLACE', 135, '2017-08-17 15:02:27');
INSERT INTO `tb_order_status` VALUES (194, NULL, '20170817150361386', 'ORDER_PLACE', 135, '2017-08-17 15:03:51');
INSERT INTO `tb_order_status` VALUES (195, NULL, '20170817150515264', 'ORDER_PLACE', 135, '2017-08-17 15:05:14');
INSERT INTO `tb_order_status` VALUES (196, NULL, '20170817152088688', 'ORDER_PLACE', 135, '2017-08-17 15:20:36');
INSERT INTO `tb_order_status` VALUES (197, NULL, '20170817152106313', 'ORDER_PLACE', 135, '2017-08-17 15:21:44');
INSERT INTO `tb_order_status` VALUES (198, NULL, '20170817152208065', 'ORDER_PLACE', 135, '2017-08-17 15:22:56');
INSERT INTO `tb_order_status` VALUES (199, NULL, '20170817152416502', 'ORDER_PLACE', 135, '2017-08-17 15:24:14');
INSERT INTO `tb_order_status` VALUES (200, NULL, '20170817152505286', 'ORDER_PLACE', 135, '2017-08-17 15:25:26');
INSERT INTO `tb_order_status` VALUES (201, NULL, '20170817152734066', 'ORDER_PLACE', 135, '2017-08-17 15:27:10');
INSERT INTO `tb_order_status` VALUES (202, NULL, '20170817152807634', 'ORDER_PLACE', 135, '2017-08-17 15:28:35');
INSERT INTO `tb_order_status` VALUES (203, NULL, '20170817152983146', 'ORDER_PLACE', 135, '2017-08-17 15:29:52');
INSERT INTO `tb_order_status` VALUES (204, NULL, '20170817153182366', 'ORDER_PLACE', 135, '2017-08-17 15:31:14');
INSERT INTO `tb_order_status` VALUES (205, NULL, '20170817153288004', 'ORDER_PLACE', 135, '2017-08-17 15:32:25');
INSERT INTO `tb_order_status` VALUES (206, NULL, '20170817153316487', 'ORDER_PLACE', 135, '2017-08-17 15:33:45');
INSERT INTO `tb_order_status` VALUES (207, NULL, '20170817153402734', 'ORDER_PLACE', 135, '2017-08-17 15:34:53');
INSERT INTO `tb_order_status` VALUES (208, NULL, '20170817153640766', 'ORDER_PLACE', 135, '2017-08-17 15:36:09');
INSERT INTO `tb_order_status` VALUES (209, NULL, '20170817153788274', 'ORDER_PLACE', 135, '2017-08-17 15:37:18');
INSERT INTO `tb_order_status` VALUES (210, NULL, '20170817153866554', 'ORDER_PLACE', 135, '2017-08-17 15:38:37');
INSERT INTO `tb_order_status` VALUES (211, NULL, '20170817153910385', 'ORDER_PLACE', 135, '2017-08-17 15:39:46');
INSERT INTO `tb_order_status` VALUES (212, NULL, '20170817154117278', 'ORDER_PLACE', 135, '2017-08-17 15:41:16');
INSERT INTO `tb_order_status` VALUES (213, NULL, '20170817154383064', 'ORDER_PLACE', 135, '2017-08-17 15:43:30');
INSERT INTO `tb_order_status` VALUES (214, NULL, '20170817154726804', 'ORDER_PLACE', 135, '2017-08-17 15:47:08');
INSERT INTO `tb_order_status` VALUES (215, NULL, '20170817154951510', 'ORDER_PLACE', 135, '2017-08-17 15:49:25');
INSERT INTO `tb_order_status` VALUES (216, NULL, '20170817160070355', 'ORDER_PLACE', 135, '2017-08-17 16:00:02');
INSERT INTO `tb_order_status` VALUES (217, NULL, '20170817160181303', 'ORDER_PLACE', 135, '2017-08-17 16:01:50');
INSERT INTO `tb_order_status` VALUES (218, NULL, '20170817160352566', 'ORDER_PLACE', 135, '2017-08-17 16:03:05');
INSERT INTO `tb_order_status` VALUES (219, NULL, '20170817160557054', 'ORDER_PLACE', 135, '2017-08-17 16:05:19');
INSERT INTO `tb_order_status` VALUES (220, NULL, '20170817160648152', 'ORDER_PLACE', 135, '2017-08-17 16:06:29');
INSERT INTO `tb_order_status` VALUES (221, NULL, '20170817160754071', 'ORDER_PLACE', 135, '2017-08-17 16:07:39');
INSERT INTO `tb_order_status` VALUES (222, NULL, '20170817160854571', 'ORDER_PLACE', 135, '2017-08-17 16:08:54');
INSERT INTO `tb_order_status` VALUES (223, NULL, '20170817161007677', 'ORDER_PLACE', 135, '2017-08-17 16:10:03');
INSERT INTO `tb_order_status` VALUES (224, NULL, '20170817161114265', 'ORDER_PLACE', 135, '2017-08-17 16:11:15');
INSERT INTO `tb_order_status` VALUES (225, NULL, '20170817161204875', 'ORDER_PLACE', 135, '2017-08-17 16:12:31');
INSERT INTO `tb_order_status` VALUES (226, NULL, '20170817161422517', 'ORDER_PLACE', 135, '2017-08-17 16:14:11');
INSERT INTO `tb_order_status` VALUES (227, NULL, '20170818143233808', 'ORDER_PLACE', 135, '2017-08-18 14:32:40');
INSERT INTO `tb_order_status` VALUES (228, NULL, '20170818143360221', 'ORDER_PLACE', 135, '2017-08-18 14:33:49');
INSERT INTO `tb_order_status` VALUES (229, NULL, '20170818143480531', 'ORDER_PLACE', 135, '2017-08-18 14:34:52');
INSERT INTO `tb_order_status` VALUES (230, NULL, '20170818143670013', 'ORDER_PLACE', 135, '2017-08-18 14:36:03');
INSERT INTO `tb_order_status` VALUES (231, NULL, '20170818143728658', 'ORDER_PLACE', 135, '2017-08-18 14:37:06');
INSERT INTO `tb_order_status` VALUES (232, NULL, '20170818143881544', 'ORDER_PLACE', 135, '2017-08-18 14:38:12');
INSERT INTO `tb_order_status` VALUES (233, NULL, '20170818143932183', 'ORDER_PLACE', 135, '2017-08-18 14:39:50');
INSERT INTO `tb_order_status` VALUES (234, NULL, '20170818144170706', 'ORDER_PLACE', 135, '2017-08-18 14:41:01');
INSERT INTO `tb_order_status` VALUES (235, NULL, '20170818144236325', 'ORDER_PLACE', 135, '2017-08-18 14:42:15');
INSERT INTO `tb_order_status` VALUES (236, NULL, '20170818144380528', 'ORDER_PLACE', 135, '2017-08-18 14:43:24');
INSERT INTO `tb_order_status` VALUES (237, NULL, '20170818144401035', 'ORDER_PLACE', 135, '2017-08-18 14:44:36');
INSERT INTO `tb_order_status` VALUES (238, NULL, '20170818144528636', 'ORDER_PLACE', 135, '2017-08-18 14:45:46');
INSERT INTO `tb_order_status` VALUES (239, NULL, '20170818144741376', 'ORDER_PLACE', 135, '2017-08-18 14:47:57');
INSERT INTO `tb_order_status` VALUES (240, NULL, '20170818144982442', 'ORDER_PLACE', 135, '2017-08-18 14:49:31');
INSERT INTO `tb_order_status` VALUES (241, NULL, '20170818145010387', 'ORDER_PLACE', 135, '2017-08-18 14:50:36');
INSERT INTO `tb_order_status` VALUES (242, NULL, '20170818145178232', 'ORDER_PLACE', 135, '2017-08-18 14:51:55');
INSERT INTO `tb_order_status` VALUES (243, NULL, '20170818145307312', 'ORDER_PLACE', 135, '2017-08-18 14:53:08');
INSERT INTO `tb_order_status` VALUES (244, NULL, '20170818145412063', 'ORDER_PLACE', 135, '2017-08-18 14:54:11');
INSERT INTO `tb_order_status` VALUES (245, NULL, '20170818145571615', 'ORDER_PLACE', 135, '2017-08-18 14:55:27');
INSERT INTO `tb_order_status` VALUES (246, NULL, '20170818145666067', 'ORDER_PLACE', 135, '2017-08-18 14:56:49');
INSERT INTO `tb_order_status` VALUES (247, NULL, '20170818145733072', 'ORDER_PLACE', 135, '2017-08-18 14:57:50');
INSERT INTO `tb_order_status` VALUES (248, NULL, '20170818145837253', 'ORDER_PLACE', 135, '2017-08-18 14:58:53');
INSERT INTO `tb_order_status` VALUES (249, NULL, '20170818150022338', 'ORDER_PLACE', 135, '2017-08-18 15:00:31');
INSERT INTO `tb_order_status` VALUES (250, NULL, '20170818150140001', 'ORDER_PLACE', 135, '2017-08-18 15:01:54');
INSERT INTO `tb_order_status` VALUES (251, NULL, '20170818150416478', 'ORDER_PLACE', 135, '2017-08-18 15:04:01');
INSERT INTO `tb_order_status` VALUES (252, NULL, '20170818150975001', 'ORDER_PLACE', 135, '2017-08-18 15:09:14');
INSERT INTO `tb_order_status` VALUES (253, NULL, '20170818151058306', 'ORDER_PLACE', 135, '2017-08-18 15:10:25');
INSERT INTO `tb_order_status` VALUES (254, NULL, '20170818151155150', 'ORDER_PLACE', 135, '2017-08-18 15:11:26');
INSERT INTO `tb_order_status` VALUES (255, NULL, '20170818151240676', 'ORDER_PLACE', 135, '2017-08-18 15:12:26');
INSERT INTO `tb_order_status` VALUES (256, NULL, '20170818151355015', 'ORDER_PLACE', 135, '2017-08-18 15:13:26');
INSERT INTO `tb_order_status` VALUES (257, NULL, '20170818151452642', 'ORDER_PLACE', 135, '2017-08-18 15:14:37');
INSERT INTO `tb_order_status` VALUES (258, NULL, '20170818151561613', 'ORDER_PLACE', 135, '2017-08-18 15:15:46');
INSERT INTO `tb_order_status` VALUES (259, NULL, '20170818151714783', 'ORDER_PLACE', 135, '2017-08-18 15:17:22');
INSERT INTO `tb_order_status` VALUES (260, NULL, '20170818151806135', 'ORDER_PLACE', 135, '2017-08-18 15:18:22');
INSERT INTO `tb_order_status` VALUES (261, NULL, '20170818151947073', 'ORDER_PLACE', 135, '2017-08-18 15:19:24');
INSERT INTO `tb_order_status` VALUES (262, NULL, '20170818152052440', 'ORDER_PLACE', 135, '2017-08-18 15:20:45');
INSERT INTO `tb_order_status` VALUES (263, NULL, '20170818152224035', 'ORDER_PLACE', 135, '2017-08-18 15:22:09');
INSERT INTO `tb_order_status` VALUES (264, NULL, '20170818152324131', 'ORDER_PLACE', 135, '2017-08-18 15:23:26');
INSERT INTO `tb_order_status` VALUES (265, NULL, '20170818152413061', 'ORDER_PLACE', 135, '2017-08-18 15:24:32');
INSERT INTO `tb_order_status` VALUES (266, NULL, '20170818152538653', 'ORDER_PLACE', 135, '2017-08-18 15:25:36');
INSERT INTO `tb_order_status` VALUES (267, NULL, '20170818152724610', 'ORDER_PLACE', 135, '2017-08-18 15:27:22');
INSERT INTO `tb_order_status` VALUES (268, NULL, '20170818152816727', 'ORDER_PLACE', 135, '2017-08-18 15:28:45');
INSERT INTO `tb_order_status` VALUES (269, NULL, '20170818152958700', 'ORDER_PLACE', 135, '2017-08-18 15:29:53');
INSERT INTO `tb_order_status` VALUES (270, NULL, '20170818153117687', 'ORDER_PLACE', 135, '2017-08-18 15:31:03');
INSERT INTO `tb_order_status` VALUES (271, NULL, '20170818153221562', 'ORDER_PLACE', 135, '2017-08-18 15:32:09');
INSERT INTO `tb_order_status` VALUES (272, NULL, '20170818153334015', 'ORDER_PLACE', 135, '2017-08-18 15:33:15');
INSERT INTO `tb_order_status` VALUES (273, NULL, '20170818153455572', 'ORDER_PLACE', 135, '2017-08-18 15:34:18');
INSERT INTO `tb_order_status` VALUES (274, NULL, '20170818153581273', 'ORDER_PLACE', 135, '2017-08-18 15:35:21');
INSERT INTO `tb_order_status` VALUES (275, NULL, '20170818153681847', 'ORDER_PLACE', 135, '2017-08-18 15:36:27');
INSERT INTO `tb_order_status` VALUES (276, NULL, '20170818153708830', 'ORDER_PLACE', 135, '2017-08-18 15:37:45');
INSERT INTO `tb_order_status` VALUES (277, NULL, '20170818153826871', 'ORDER_PLACE', 135, '2017-08-18 15:38:59');
INSERT INTO `tb_order_status` VALUES (278, NULL, '20170818154070573', 'ORDER_PLACE', 135, '2017-08-18 15:40:04');
INSERT INTO `tb_order_status` VALUES (279, NULL, '20170818154106787', 'ORDER_PLACE', 135, '2017-08-18 15:41:05');
INSERT INTO `tb_order_status` VALUES (280, NULL, '20170818154285687', 'ORDER_PLACE', 135, '2017-08-18 15:42:10');
INSERT INTO `tb_order_status` VALUES (281, NULL, '20170818154504132', 'ORDER_PLACE', 135, '2017-08-18 15:45:13');
INSERT INTO `tb_order_status` VALUES (282, NULL, '20170818154648308', 'ORDER_PLACE', 135, '2017-08-18 15:46:14');
INSERT INTO `tb_order_status` VALUES (283, NULL, '20170818154778624', 'ORDER_PLACE', 135, '2017-08-18 15:47:29');
INSERT INTO `tb_order_status` VALUES (284, NULL, '20170819121816680', 'ORDER_PLACE', 135, '2017-08-19 12:18:07');
INSERT INTO `tb_order_status` VALUES (285, NULL, '20170819121926228', 'ORDER_PLACE', 135, '2017-08-19 12:19:21');
INSERT INTO `tb_order_status` VALUES (286, NULL, '20170819122055620', 'ORDER_PLACE', 135, '2017-08-19 12:20:20');
INSERT INTO `tb_order_status` VALUES (287, NULL, '20170819122112354', 'ORDER_PLACE', 135, '2017-08-19 12:21:28');
INSERT INTO `tb_order_status` VALUES (288, NULL, '20170819122288511', 'ORDER_PLACE', 135, '2017-08-19 12:22:42');
INSERT INTO `tb_order_status` VALUES (289, NULL, '20170819122362082', 'ORDER_PLACE', 135, '2017-08-19 12:24:00');
INSERT INTO `tb_order_status` VALUES (290, NULL, '20170819122555155', 'ORDER_PLACE', 135, '2017-08-19 12:25:05');
INSERT INTO `tb_order_status` VALUES (291, NULL, '20170819122662855', 'ORDER_PLACE', 135, '2017-08-19 12:26:14');
INSERT INTO `tb_order_status` VALUES (292, NULL, '20170819122752041', 'ORDER_PLACE', 135, '2017-08-19 12:27:28');
INSERT INTO `tb_order_status` VALUES (293, NULL, '20170819122833617', 'ORDER_PLACE', 135, '2017-08-19 12:28:33');
INSERT INTO `tb_order_status` VALUES (294, NULL, '20170816153925546', 'ORDER_TAKING', 135, '2017-08-22 14:37:51');
INSERT INTO `tb_order_status` VALUES (295, NULL, '20170816154388836', 'ORDER_TAKING', 135, '2017-08-22 16:05:11');
INSERT INTO `tb_order_status` VALUES (296, NULL, '20170816154512686', 'ORDER_TAKING', 135, '2017-08-22 16:06:17');
INSERT INTO `tb_order_status` VALUES (297, NULL, '20170816154741255', 'ORDER_TAKING', 135, '2017-08-22 16:07:12');
INSERT INTO `tb_order_status` VALUES (298, NULL, '20170816154936300', 'ORDER_TAKING', 135, '2017-08-22 16:08:03');
INSERT INTO `tb_order_status` VALUES (299, NULL, '20170816155141025', 'ORDER_TAKING', 135, '2017-08-22 16:08:37');
INSERT INTO `tb_order_status` VALUES (300, NULL, '20170816155464348', 'ORDER_TAKING', 135, '2017-08-22 16:09:27');
INSERT INTO `tb_order_status` VALUES (301, NULL, '20170816155877081', 'ORDER_TAKING', 135, '2017-08-22 16:10:07');
INSERT INTO `tb_order_status` VALUES (302, NULL, '20170816160036755', 'ORDER_TAKING', 135, '2017-08-22 16:10:38');
INSERT INTO `tb_order_status` VALUES (303, NULL, '20170816160240262', 'ORDER_TAKING', 135, '2017-08-22 16:11:11');
INSERT INTO `tb_order_status` VALUES (304, NULL, '20170816160412101', 'ORDER_TAKING', 135, '2017-08-22 16:11:46');
INSERT INTO `tb_order_status` VALUES (305, NULL, '20170816160678668', 'ORDER_TAKING', 135, '2017-08-22 16:12:17');
INSERT INTO `tb_order_status` VALUES (306, NULL, '20170816160788004', 'ORDER_TAKING', 135, '2017-08-22 16:12:52');
INSERT INTO `tb_order_status` VALUES (307, NULL, '20170816160941824', 'ORDER_TAKING', 135, '2017-08-22 16:13:31');
INSERT INTO `tb_order_status` VALUES (308, NULL, '20170816163587243', 'ORDER_TAKING', 135, '2017-08-22 16:42:11');
INSERT INTO `tb_order_status` VALUES (309, NULL, '20170816163814583', 'ORDER_TAKING', 135, '2017-08-22 16:44:21');
INSERT INTO `tb_order_status` VALUES (310, NULL, '20170816164337186', 'ORDER_TAKING', 135, '2017-08-22 16:45:14');
INSERT INTO `tb_order_status` VALUES (311, NULL, '20170816164603623', 'ORDER_TAKING', 135, '2017-08-22 16:45:59');
INSERT INTO `tb_order_status` VALUES (312, NULL, '20170816164931544', 'ORDER_TAKING', 135, '2017-08-22 16:46:43');
INSERT INTO `tb_order_status` VALUES (313, NULL, '20170816165127406', 'ORDER_TAKING', 135, '2017-08-22 16:47:31');
INSERT INTO `tb_order_status` VALUES (314, NULL, '20170816165262472', 'ORDER_TAKING', 135, '2017-08-22 16:48:23');
INSERT INTO `tb_order_status` VALUES (315, NULL, '20170816165422174', 'ORDER_TAKING', 135, '2017-08-22 16:49:00');
INSERT INTO `tb_order_status` VALUES (316, NULL, '20170816165653086', 'ORDER_TAKING', 135, '2017-08-22 16:49:47');
INSERT INTO `tb_order_status` VALUES (317, NULL, '20170816165714043', 'ORDER_TAKING', 135, '2017-08-22 16:51:10');
INSERT INTO `tb_order_status` VALUES (318, NULL, '20170816165933474', 'ORDER_TAKING', 135, '2017-08-22 16:51:48');
INSERT INTO `tb_order_status` VALUES (319, NULL, '20170816170008235', 'ORDER_TAKING', 135, '2017-08-22 16:52:50');
INSERT INTO `tb_order_status` VALUES (320, NULL, '20170816170246532', 'ORDER_TAKING', 135, '2017-08-22 16:57:03');
INSERT INTO `tb_order_status` VALUES (321, NULL, '20170816170465067', 'ORDER_TAKING', 135, '2017-08-22 17:23:36');
INSERT INTO `tb_order_status` VALUES (322, NULL, '20170816170564513', 'ORDER_TAKING', 135, '2017-08-22 17:24:40');
INSERT INTO `tb_order_status` VALUES (323, NULL, '20170816170752010', 'ORDER_TAKING', 135, '2017-08-22 17:25:47');
INSERT INTO `tb_order_status` VALUES (324, NULL, '20170816170824687', 'ORDER_TAKING', 135, '2017-08-22 17:31:43');
INSERT INTO `tb_order_status` VALUES (325, NULL, '20170816171060814', 'ORDER_TAKING', 135, '2017-08-22 17:32:46');
INSERT INTO `tb_order_status` VALUES (326, NULL, '20170816171107487', 'ORDER_TAKING', 135, '2017-08-22 17:33:24');
INSERT INTO `tb_order_status` VALUES (327, NULL, '20170816171345100', 'ORDER_TAKING', 135, '2017-08-22 17:34:11');
INSERT INTO `tb_order_status` VALUES (328, NULL, '20170816171573117', 'ORDER_TAKING', 135, '2017-08-22 17:34:48');
INSERT INTO `tb_order_status` VALUES (329, NULL, '20170816171657063', 'ORDER_TAKING', 135, '2017-08-22 17:35:23');
INSERT INTO `tb_order_status` VALUES (330, NULL, '20170816171800117', 'ORDER_TAKING', 135, '2017-08-22 17:35:56');
INSERT INTO `tb_order_status` VALUES (331, NULL, '20170816171983325', 'ORDER_TAKING', 135, '2017-08-22 17:36:36');
INSERT INTO `tb_order_status` VALUES (332, NULL, '20170816172125567', 'ORDER_TAKING', 135, '2017-08-22 17:37:25');
INSERT INTO `tb_order_status` VALUES (333, NULL, '20170816172274825', 'ORDER_TAKING', 135, '2017-08-22 17:38:01');
INSERT INTO `tb_order_status` VALUES (334, NULL, '20170816172577740', 'ORDER_TAKING', 135, '2017-08-22 17:39:50');
INSERT INTO `tb_order_status` VALUES (335, NULL, '20170822174600881', 'ORDER_PLACE', 135, '2017-08-22 17:46:01');
INSERT INTO `tb_order_status` VALUES (336, NULL, '20170822174600881', 'ORDER_TAKING', 135, '2017-08-22 17:46:23');
INSERT INTO `tb_order_status` VALUES (337, NULL, '20170816172686708', 'ORDER_TAKING', 135, '2017-08-22 17:59:14');
INSERT INTO `tb_order_status` VALUES (338, NULL, '20170816172963420', 'ORDER_TAKING', 135, '2017-08-22 17:59:45');
INSERT INTO `tb_order_status` VALUES (339, NULL, '20170816173165180', 'ORDER_TAKING', 135, '2017-08-22 18:00:18');
INSERT INTO `tb_order_status` VALUES (340, NULL, '20170816173288383', 'ORDER_TAKING', 135, '2017-08-22 18:00:54');
INSERT INTO `tb_order_status` VALUES (341, NULL, '20170816173452840', 'ORDER_TAKING', 135, '2017-08-22 18:01:27');
INSERT INTO `tb_order_status` VALUES (342, NULL, '20170816173564083', 'ORDER_TAKING', 135, '2017-08-22 18:02:12');
INSERT INTO `tb_order_status` VALUES (343, NULL, '20170822180414442', 'ORDER_PLACE', 135, '2017-08-22 18:04:37');
INSERT INTO `tb_order_status` VALUES (344, NULL, '20170822180414442', 'ORDER_TAKING', 135, '2017-08-22 18:05:05');
INSERT INTO `tb_order_status` VALUES (345, NULL, '20170816173772653', 'ORDER_TAKING', 135, '2017-08-22 18:08:02');
INSERT INTO `tb_order_status` VALUES (346, NULL, '20170816173832156', 'ORDER_TAKING', 135, '2017-08-22 18:09:21');
INSERT INTO `tb_order_status` VALUES (347, NULL, '20170816173978224', 'ORDER_TAKING', 135, '2017-08-22 18:10:08');
INSERT INTO `tb_order_status` VALUES (348, NULL, '20170816174173580', 'ORDER_TAKING', 135, '2017-08-22 18:11:21');
INSERT INTO `tb_order_status` VALUES (349, NULL, '20170816174302538', 'ORDER_TAKING', 135, '2017-08-22 18:11:47');
INSERT INTO `tb_order_status` VALUES (350, NULL, '20170816174461184', 'ORDER_TAKING', 135, '2017-08-22 18:12:25');
INSERT INTO `tb_order_status` VALUES (351, NULL, '20170816174544843', 'ORDER_TAKING', 135, '2017-08-22 18:12:58');
INSERT INTO `tb_order_status` VALUES (352, NULL, '20170816174737302', 'ORDER_TAKING', 135, '2017-08-22 18:14:03');
INSERT INTO `tb_order_status` VALUES (353, NULL, '20170817102821333', 'ORDER_TAKING', 135, '2017-08-22 18:27:47');
INSERT INTO `tb_order_status` VALUES (354, NULL, '20170817103230753', 'ORDER_TAKING', 135, '2017-08-22 18:28:33');
INSERT INTO `tb_order_status` VALUES (355, NULL, '20170817103342115', 'ORDER_TAKING', 135, '2017-08-22 18:29:15');
INSERT INTO `tb_order_status` VALUES (356, NULL, '20170817103544545', 'ORDER_TAKING', 135, '2017-08-22 18:29:57');
INSERT INTO `tb_order_status` VALUES (357, NULL, '20170817103653321', 'ORDER_TAKING', 135, '2017-08-22 18:30:34');
INSERT INTO `tb_order_status` VALUES (358, NULL, '20170817103906486', 'ORDER_TAKING', 135, '2017-08-22 18:31:15');
INSERT INTO `tb_order_status` VALUES (359, NULL, '20170817104033557', 'ORDER_TAKING', 135, '2017-08-22 18:32:22');
INSERT INTO `tb_order_status` VALUES (360, NULL, '20170817103738861', 'ORDER_TAKING', 135, '2017-08-22 18:34:43');
INSERT INTO `tb_order_status` VALUES (361, NULL, '20170817104288402', 'ORDER_TAKING', 135, '2017-08-22 18:35:23');
INSERT INTO `tb_order_status` VALUES (362, NULL, '20170817104680208', 'ORDER_TAKING', 135, '2017-08-22 18:39:15');
INSERT INTO `tb_order_status` VALUES (363, NULL, '20170817104747312', 'ORDER_TAKING', 135, '2017-08-22 18:40:05');
INSERT INTO `tb_order_status` VALUES (364, NULL, '20170817104874412', 'ORDER_TAKING', 135, '2017-08-22 18:40:40');
INSERT INTO `tb_order_status` VALUES (365, NULL, '20170817105043446', 'ORDER_TAKING', 135, '2017-08-22 18:41:19');
INSERT INTO `tb_order_status` VALUES (366, NULL, '20170817105117001', 'ORDER_TAKING', 135, '2017-08-22 18:41:54');
INSERT INTO `tb_order_status` VALUES (367, NULL, '20170817105273485', 'ORDER_TAKING', 135, '2017-08-22 18:43:09');
INSERT INTO `tb_order_status` VALUES (368, NULL, '20170817105426888', 'ORDER_TAKING', 135, '2017-08-23 08:41:51');
INSERT INTO `tb_order_status` VALUES (369, NULL, '20170817105571467', 'ORDER_TAKING', 135, '2017-08-23 08:42:38');
INSERT INTO `tb_order_status` VALUES (370, NULL, '20170817105631270', 'ORDER_TAKING', 135, '2017-08-23 08:43:46');
INSERT INTO `tb_order_status` VALUES (371, NULL, '20170817105827785', 'ORDER_TAKING', 135, '2017-08-23 08:44:32');
INSERT INTO `tb_order_status` VALUES (372, NULL, '20170817105972077', 'ORDER_TAKING', 135, '2017-08-23 08:46:33');
INSERT INTO `tb_order_status` VALUES (373, NULL, '20170817110170574', 'ORDER_TAKING', 135, '2017-08-23 08:47:07');
INSERT INTO `tb_order_status` VALUES (374, NULL, '20170817110207647', 'ORDER_TAKING', 135, '2017-08-23 08:47:40');
INSERT INTO `tb_order_status` VALUES (375, NULL, '20170817110300543', 'ORDER_TAKING', 135, '2017-08-23 08:48:14');
INSERT INTO `tb_order_status` VALUES (376, NULL, '20170817110436052', 'ORDER_TAKING', 135, '2017-08-23 08:48:51');
INSERT INTO `tb_order_status` VALUES (377, NULL, '20170817110614803', 'ORDER_TAKING', 135, '2017-08-23 08:49:28');
INSERT INTO `tb_order_status` VALUES (378, NULL, '20170817110777860', 'ORDER_TAKING', 135, '2017-08-23 08:50:11');
INSERT INTO `tb_order_status` VALUES (379, NULL, '20170817110844113', 'ORDER_TAKING', 135, '2017-08-23 08:51:01');
INSERT INTO `tb_order_status` VALUES (380, NULL, '20170817110905688', 'ORDER_TAKING', 135, '2017-08-23 08:51:39');
INSERT INTO `tb_order_status` VALUES (381, NULL, '20170817111170635', 'ORDER_TAKING', 135, '2017-08-23 08:52:08');
INSERT INTO `tb_order_status` VALUES (382, NULL, '20170817111244507', 'ORDER_TAKING', 135, '2017-08-23 08:52:47');
INSERT INTO `tb_order_status` VALUES (383, NULL, '20170817111652777', 'ORDER_TAKING', 135, '2017-08-23 08:53:26');
INSERT INTO `tb_order_status` VALUES (384, NULL, '20170817111804521', 'ORDER_TAKING', 135, '2017-08-23 08:54:34');
INSERT INTO `tb_order_status` VALUES (385, NULL, '20170817111928207', 'ORDER_TAKING', 135, '2017-08-23 08:55:11');
INSERT INTO `tb_order_status` VALUES (386, NULL, '20170817112078587', 'ORDER_TAKING', 135, '2017-08-23 08:55:52');
INSERT INTO `tb_order_status` VALUES (387, NULL, '20170817112113355', 'ORDER_TAKING', 135, '2017-08-23 08:56:29');
INSERT INTO `tb_order_status` VALUES (388, NULL, '20170817112233815', 'ORDER_TAKING', 135, '2017-08-23 08:57:12');
INSERT INTO `tb_order_status` VALUES (389, NULL, '20170817112336642', 'ORDER_TAKING', 135, '2017-08-23 08:57:55');
INSERT INTO `tb_order_status` VALUES (390, NULL, '20170817112458742', 'ORDER_TAKING', 135, '2017-08-23 08:58:31');
INSERT INTO `tb_order_status` VALUES (391, NULL, '20170817112561880', 'ORDER_TAKING', 135, '2017-08-23 08:59:06');
INSERT INTO `tb_order_status` VALUES (392, NULL, '20170817112700863', 'ORDER_TAKING', 135, '2017-08-23 08:59:35');
INSERT INTO `tb_order_status` VALUES (393, NULL, '20170817112884257', 'ORDER_TAKING', 135, '2017-08-23 09:00:07');
INSERT INTO `tb_order_status` VALUES (394, NULL, '20170817112921445', 'ORDER_TAKING', 135, '2017-08-23 09:00:34');
INSERT INTO `tb_order_status` VALUES (395, NULL, '20170817113032332', 'ORDER_TAKING', 135, '2017-08-23 09:01:04');
INSERT INTO `tb_order_status` VALUES (396, NULL, '20170817150273740', 'ORDER_TAKING', 135, '2017-08-23 09:02:02');
INSERT INTO `tb_order_status` VALUES (397, NULL, '20170817150102166', 'ORDER_TAKING', 135, '2017-08-23 09:02:55');
INSERT INTO `tb_order_status` VALUES (398, NULL, '20170817150361386', 'ORDER_TAKING', 135, '2017-08-23 09:03:27');
INSERT INTO `tb_order_status` VALUES (399, NULL, '20170817150515264', 'ORDER_TAKING', 135, '2017-08-23 09:03:54');
INSERT INTO `tb_order_status` VALUES (400, NULL, '20170823091953411', 'ORDER_PLACE', 135, '2017-08-23 09:19:56');
INSERT INTO `tb_order_status` VALUES (401, NULL, '20170823091953411', 'ORDER_TAKING', 135, '2017-08-23 09:21:09');
INSERT INTO `tb_order_status` VALUES (402, NULL, '20170817152088688', 'ORDER_TAKING', 135, '2017-08-23 09:54:57');
INSERT INTO `tb_order_status` VALUES (403, NULL, '20170817152106313', 'ORDER_TAKING', 135, '2017-08-23 09:55:36');
INSERT INTO `tb_order_status` VALUES (404, NULL, '20170817152208065', 'ORDER_TAKING', 135, '2017-08-23 09:56:09');
INSERT INTO `tb_order_status` VALUES (405, NULL, '20170817152416502', 'ORDER_TAKING', 135, '2017-08-23 09:56:43');
INSERT INTO `tb_order_status` VALUES (406, NULL, '20170817152505286', 'ORDER_TAKING', 135, '2017-08-23 09:57:16');
INSERT INTO `tb_order_status` VALUES (407, NULL, '20170817152734066', 'ORDER_TAKING', 135, '2017-08-23 10:01:37');
INSERT INTO `tb_order_status` VALUES (408, NULL, '20170817152807634', 'ORDER_TAKING', 135, '2017-08-23 10:02:12');
INSERT INTO `tb_order_status` VALUES (409, NULL, '20170817152983146', 'ORDER_TAKING', 135, '2017-08-23 10:02:38');
INSERT INTO `tb_order_status` VALUES (410, NULL, '20170817153182366', 'ORDER_TAKING', 135, '2017-08-23 10:03:19');
INSERT INTO `tb_order_status` VALUES (411, NULL, '20170817153288004', 'ORDER_TAKING', 135, '2017-08-23 10:03:51');
INSERT INTO `tb_order_status` VALUES (412, NULL, '20170817153316487', 'ORDER_TAKING', 135, '2017-08-23 10:04:40');
INSERT INTO `tb_order_status` VALUES (413, NULL, '20170817153402734', 'ORDER_TAKING', 135, '2017-08-23 10:05:01');
INSERT INTO `tb_order_status` VALUES (414, NULL, '20170817153640766', 'ORDER_TAKING', 135, '2017-08-23 10:05:59');
INSERT INTO `tb_order_status` VALUES (415, NULL, '20170817153788274', 'ORDER_TAKING', 135, '2017-08-23 10:06:31');
INSERT INTO `tb_order_status` VALUES (416, NULL, '20170817153866554', 'ORDER_TAKING', 135, '2017-08-23 10:07:08');
INSERT INTO `tb_order_status` VALUES (417, NULL, '20170817153910385', 'ORDER_TAKING', 135, '2017-08-23 10:07:34');
INSERT INTO `tb_order_status` VALUES (418, NULL, '20170817154117278', 'ORDER_TAKING', 135, '2017-08-23 10:21:10');
INSERT INTO `tb_order_status` VALUES (419, NULL, '20170817154383064', 'ORDER_TAKING', 135, '2017-08-23 10:21:43');
INSERT INTO `tb_order_status` VALUES (420, NULL, '20170817154726804', 'ORDER_TAKING', 135, '2017-08-23 10:22:19');
INSERT INTO `tb_order_status` VALUES (421, NULL, '20170817154951510', 'ORDER_TAKING', 135, '2017-08-23 10:22:55');
INSERT INTO `tb_order_status` VALUES (422, NULL, '20170817160070355', 'ORDER_TAKING', 135, '2017-08-23 10:23:26');
INSERT INTO `tb_order_status` VALUES (423, NULL, '20170817160181303', 'ORDER_TAKING', 135, '2017-08-23 10:23:53');
INSERT INTO `tb_order_status` VALUES (424, NULL, '20170817160352566', 'ORDER_TAKING', 135, '2017-08-23 10:24:20');
INSERT INTO `tb_order_status` VALUES (425, NULL, '20170817160557054', 'ORDER_TAKING', 135, '2017-08-23 10:24:54');
INSERT INTO `tb_order_status` VALUES (426, NULL, '20170817160648152', 'ORDER_TAKING', 135, '2017-08-23 10:25:25');
INSERT INTO `tb_order_status` VALUES (427, NULL, '20170817160754071', 'ORDER_TAKING', 135, '2017-08-23 10:27:01');
INSERT INTO `tb_order_status` VALUES (428, NULL, '20170817160854571', 'ORDER_TAKING', 135, '2017-08-23 10:27:50');
INSERT INTO `tb_order_status` VALUES (429, NULL, '20170817161007677', 'ORDER_TAKING', 135, '2017-08-23 10:28:44');
INSERT INTO `tb_order_status` VALUES (430, NULL, '20170817161114265', 'ORDER_TAKING', 135, '2017-08-23 10:29:41');
INSERT INTO `tb_order_status` VALUES (431, NULL, '20170817161204875', 'ORDER_TAKING', 135, '2017-08-23 10:30:23');
INSERT INTO `tb_order_status` VALUES (432, NULL, '20170817161422517', 'ORDER_TAKING', 135, '2017-08-23 10:31:04');
INSERT INTO `tb_order_status` VALUES (433, NULL, '20170818143233808', 'ORDER_TAKING', 135, '2017-08-23 10:31:36');
INSERT INTO `tb_order_status` VALUES (434, NULL, '20170818143360221', 'ORDER_TAKING', 135, '2017-08-23 10:32:03');
INSERT INTO `tb_order_status` VALUES (435, NULL, '20170818143480531', 'ORDER_TAKING', 135, '2017-08-23 10:32:32');
INSERT INTO `tb_order_status` VALUES (436, NULL, '20170818143670013', 'ORDER_TAKING', 135, '2017-08-23 10:33:01');
INSERT INTO `tb_order_status` VALUES (437, NULL, '20170818143728658', 'ORDER_TAKING', 135, '2017-08-23 10:33:29');
INSERT INTO `tb_order_status` VALUES (438, NULL, '20170818143881544', 'ORDER_TAKING', 135, '2017-08-23 10:34:03');
INSERT INTO `tb_order_status` VALUES (439, NULL, '20170818143932183', 'ORDER_TAKING', 135, '2017-08-23 10:34:39');
INSERT INTO `tb_order_status` VALUES (440, NULL, '20170818144170706', 'ORDER_TAKING', 135, '2017-08-23 10:35:15');
INSERT INTO `tb_order_status` VALUES (441, NULL, '20170818144236325', 'ORDER_TAKING', 135, '2017-08-23 10:35:42');
INSERT INTO `tb_order_status` VALUES (442, NULL, '20170818144380528', 'ORDER_TAKING', 135, '2017-08-23 10:36:10');
INSERT INTO `tb_order_status` VALUES (443, NULL, '20170818144401035', 'ORDER_TAKING', 135, '2017-08-23 10:36:38');
INSERT INTO `tb_order_status` VALUES (444, NULL, '20170818144741376', 'ORDER_TAKING', 135, '2017-08-23 16:07:50');
INSERT INTO `tb_order_status` VALUES (445, NULL, '20170818144982442', 'ORDER_TAKING', 135, '2017-08-23 16:08:26');
INSERT INTO `tb_order_status` VALUES (446, NULL, '20170818145010387', 'ORDER_TAKING', 135, '2017-08-23 16:09:11');
INSERT INTO `tb_order_status` VALUES (447, NULL, '20170818145178232', 'ORDER_TAKING', 135, '2017-08-23 16:09:40');
INSERT INTO `tb_order_status` VALUES (448, NULL, '20170818145307312', 'ORDER_TAKING', 135, '2017-08-23 16:10:09');
INSERT INTO `tb_order_status` VALUES (449, NULL, '20170818145412063', 'ORDER_TAKING', 135, '2017-08-23 16:10:45');
INSERT INTO `tb_order_status` VALUES (450, NULL, '20170818145571615', 'ORDER_TAKING', 135, '2017-08-23 16:11:16');
INSERT INTO `tb_order_status` VALUES (451, NULL, '20170818145666067', 'ORDER_TAKING', 135, '2017-08-23 16:11:46');
INSERT INTO `tb_order_status` VALUES (452, NULL, '20170818145733072', 'ORDER_TAKING', 135, '2017-08-23 16:12:14');
INSERT INTO `tb_order_status` VALUES (453, NULL, '20170818145837253', 'ORDER_TAKING', 135, '2017-08-23 16:13:05');
INSERT INTO `tb_order_status` VALUES (454, NULL, '20170818150022338', 'ORDER_TAKING', 135, '2017-08-23 16:13:39');
INSERT INTO `tb_order_status` VALUES (455, NULL, '20170818150140001', 'ORDER_TAKING', 135, '2017-08-23 16:14:58');
INSERT INTO `tb_order_status` VALUES (456, NULL, '20170818150416478', 'ORDER_TAKING', 135, '2017-08-23 16:15:39');
INSERT INTO `tb_order_status` VALUES (457, NULL, '20170818150975001', 'ORDER_TAKING', 135, '2017-08-23 16:16:29');
INSERT INTO `tb_order_status` VALUES (458, NULL, '20170818151058306', 'ORDER_TAKING', 135, '2017-08-23 16:17:08');
INSERT INTO `tb_order_status` VALUES (459, NULL, '20170818151155150', 'ORDER_TAKING', 135, '2017-08-23 16:17:38');
INSERT INTO `tb_order_status` VALUES (460, NULL, '20170818151240676', 'ORDER_TAKING', 135, '2017-08-23 16:18:09');
INSERT INTO `tb_order_status` VALUES (461, NULL, '20170818151355015', 'ORDER_TAKING', 135, '2017-08-23 16:18:41');
INSERT INTO `tb_order_status` VALUES (462, NULL, '20170818151452642', 'ORDER_TAKING', 135, '2017-08-23 16:19:14');
INSERT INTO `tb_order_status` VALUES (463, NULL, '20170818151561613', 'ORDER_TAKING', 135, '2017-08-23 16:20:30');
INSERT INTO `tb_order_status` VALUES (464, NULL, '20170818151714783', 'ORDER_TAKING', 135, '2017-08-23 16:20:58');
INSERT INTO `tb_order_status` VALUES (465, NULL, '20170818151806135', 'ORDER_TAKING', 135, '2017-08-23 16:21:41');
INSERT INTO `tb_order_status` VALUES (466, NULL, '20170818151947073', 'ORDER_TAKING', 135, '2017-08-23 16:22:35');
INSERT INTO `tb_order_status` VALUES (467, NULL, '20170818152052440', 'ORDER_TAKING', 135, '2017-08-23 16:23:06');
INSERT INTO `tb_order_status` VALUES (468, NULL, '20170818152224035', 'ORDER_TAKING', 135, '2017-08-23 16:23:34');
INSERT INTO `tb_order_status` VALUES (469, NULL, '20170818152324131', 'ORDER_TAKING', 135, '2017-08-23 16:24:07');
INSERT INTO `tb_order_status` VALUES (470, NULL, '20170818152413061', 'ORDER_TAKING', 135, '2017-08-23 16:24:39');
INSERT INTO `tb_order_status` VALUES (471, NULL, '20170818152538653', 'ORDER_TAKING', 135, '2017-08-23 16:25:16');
INSERT INTO `tb_order_status` VALUES (472, NULL, '20170819122833617', 'ORDER_TAKING', 135, '2017-08-23 16:33:27');
INSERT INTO `tb_order_status` VALUES (473, NULL, '20170819122752041', 'ORDER_TAKING', 135, '2017-08-23 16:33:57');
INSERT INTO `tb_order_status` VALUES (474, NULL, '20170819122662855', 'ORDER_TAKING', 135, '2017-08-23 16:34:20');
INSERT INTO `tb_order_status` VALUES (475, NULL, '20170819122555155', 'ORDER_TAKING', 135, '2017-08-23 16:34:44');
INSERT INTO `tb_order_status` VALUES (476, NULL, '20170819122362082', 'ORDER_TAKING', 135, '2017-08-23 16:35:05');
INSERT INTO `tb_order_status` VALUES (477, NULL, '20170819122288511', 'ORDER_TAKING', 135, '2017-08-23 16:35:30');
INSERT INTO `tb_order_status` VALUES (478, NULL, '20170819122112354', 'ORDER_TAKING', 135, '2017-08-23 16:35:55');
INSERT INTO `tb_order_status` VALUES (479, NULL, '20170819122055620', 'ORDER_TAKING', 135, '2017-08-23 16:36:35');
INSERT INTO `tb_order_status` VALUES (480, NULL, '20170819121926228', 'ORDER_TAKING', 135, '2017-08-23 16:37:19');
INSERT INTO `tb_order_status` VALUES (481, NULL, '20170819121816680', 'ORDER_TAKING', 135, '2017-08-23 16:38:03');
INSERT INTO `tb_order_status` VALUES (482, NULL, '20170818152724610', 'ORDER_TAKING', 135, '2017-08-23 16:45:53');
INSERT INTO `tb_order_status` VALUES (483, NULL, '20170818152816727', 'ORDER_TAKING', 135, '2017-08-23 16:46:32');
INSERT INTO `tb_order_status` VALUES (484, NULL, '20170818152958700', 'ORDER_TAKING', 135, '2017-08-23 16:47:02');
INSERT INTO `tb_order_status` VALUES (485, NULL, '20170818153117687', 'ORDER_TAKING', 135, '2017-08-23 16:47:36');
INSERT INTO `tb_order_status` VALUES (486, NULL, '20170818153221562', 'ORDER_TAKING', 135, '2017-08-23 16:48:12');
INSERT INTO `tb_order_status` VALUES (487, NULL, '20170818153334015', 'ORDER_TAKING', 135, '2017-08-23 16:48:42');
INSERT INTO `tb_order_status` VALUES (488, NULL, '20170818153455572', 'ORDER_TAKING', 135, '2017-08-23 16:49:26');
INSERT INTO `tb_order_status` VALUES (489, NULL, '20170818153581273', 'ORDER_TAKING', 135, '2017-08-23 16:49:55');
INSERT INTO `tb_order_status` VALUES (490, NULL, '20170818153681847', 'ORDER_TAKING', 135, '2017-08-23 16:50:20');
INSERT INTO `tb_order_status` VALUES (491, NULL, '20170818153708830', 'ORDER_TAKING', 135, '2017-08-23 16:50:54');
INSERT INTO `tb_order_status` VALUES (492, NULL, '20170818153826871', 'ORDER_TAKING', 135, '2017-08-23 16:51:14');
INSERT INTO `tb_order_status` VALUES (493, NULL, '20170818154070573', 'ORDER_TAKING', 135, '2017-08-23 16:51:38');
INSERT INTO `tb_order_status` VALUES (494, NULL, '20170818154285687', 'ORDER_TAKING', 135, '2017-08-23 16:52:09');
INSERT INTO `tb_order_status` VALUES (495, NULL, '20170818154106787', 'ORDER_TAKING', 135, '2017-08-23 16:52:59');
INSERT INTO `tb_order_status` VALUES (496, NULL, '20170818154504132', 'ORDER_TAKING', 135, '2017-08-23 16:53:38');
INSERT INTO `tb_order_status` VALUES (497, NULL, '20170818154648308', 'ORDER_TAKING', 135, '2017-08-23 16:54:16');
INSERT INTO `tb_order_status` VALUES (498, NULL, '20170823165752261', 'ORDER_PLACE', 135, '2017-08-23 16:57:00');
INSERT INTO `tb_order_status` VALUES (499, NULL, '20170823165752261', 'ORDER_TAKING', 135, '2017-08-23 16:57:27');
INSERT INTO `tb_order_status` VALUES (500, NULL, '20170823172144252', 'ORDER_PLACE', 135, '2017-08-23 17:21:28');
INSERT INTO `tb_order_status` VALUES (501, NULL, '20170823172980203', 'ORDER_PLACE', 135, '2017-08-23 17:29:07');
INSERT INTO `tb_order_status` VALUES (502, NULL, '20170823173366562', 'ORDER_PLACE', 135, '2017-08-23 17:33:45');
INSERT INTO `tb_order_status` VALUES (503, NULL, '20170823173503772', 'ORDER_PLACE', 135, '2017-08-23 17:35:12');
INSERT INTO `tb_order_status` VALUES (504, NULL, '20170823173621802', 'ORDER_PLACE', 135, '2017-08-23 17:36:31');
INSERT INTO `tb_order_status` VALUES (505, NULL, '20170823174865532', 'ORDER_PLACE', 135, '2017-08-23 17:48:08');
INSERT INTO `tb_order_status` VALUES (506, NULL, '20170823174988767', 'ORDER_PLACE', 135, '2017-08-23 17:49:30');
INSERT INTO `tb_order_status` VALUES (507, NULL, '20170823175002642', 'ORDER_PLACE', 135, '2017-08-23 17:50:44');
INSERT INTO `tb_order_status` VALUES (508, NULL, '20170823175226811', 'ORDER_PLACE', 135, '2017-08-23 17:52:09');
INSERT INTO `tb_order_status` VALUES (509, NULL, '20170823175346452', 'ORDER_PLACE', 135, '2017-08-23 17:53:25');
INSERT INTO `tb_order_status` VALUES (510, NULL, '20170823175435341', 'ORDER_PLACE', 135, '2017-08-23 17:54:29');
INSERT INTO `tb_order_status` VALUES (511, NULL, '20170823174865532', 'ORDER_TAKING', 135, '2017-08-24 08:55:51');
INSERT INTO `tb_order_status` VALUES (512, NULL, '20170823174988767', 'ORDER_TAKING', 135, '2017-08-24 08:56:18');
INSERT INTO `tb_order_status` VALUES (513, NULL, '20170823175002642', 'ORDER_TAKING', 135, '2017-08-24 08:56:47');
INSERT INTO `tb_order_status` VALUES (514, NULL, '20170823175226811', 'ORDER_TAKING', 135, '2017-08-24 08:57:11');
INSERT INTO `tb_order_status` VALUES (515, NULL, '20170823175346452', 'ORDER_TAKING', 135, '2017-08-24 08:57:40');
INSERT INTO `tb_order_status` VALUES (516, NULL, '20170823175435341', 'ORDER_TAKING', 135, '2017-08-24 08:58:06');
INSERT INTO `tb_order_status` VALUES (517, NULL, '20170824090030601', 'ORDER_PLACE', 135, '2017-08-24 09:00:29');
INSERT INTO `tb_order_status` VALUES (518, NULL, '20170824091423701', 'ORDER_PLACE', 135, '2017-08-24 09:14:15');
INSERT INTO `tb_order_status` VALUES (519, NULL, '20170824091622313', 'ORDER_PLACE', 135, '2017-08-24 09:16:01');
INSERT INTO `tb_order_status` VALUES (520, NULL, '20170824091764252', 'ORDER_PLACE', 135, '2017-08-24 09:17:12');
INSERT INTO `tb_order_status` VALUES (521, NULL, '20170824091845023', 'ORDER_PLACE', 135, '2017-08-24 09:18:35');
INSERT INTO `tb_order_status` VALUES (522, NULL, '20170824091907540', 'ORDER_PLACE', 135, '2017-08-24 09:19:56');
INSERT INTO `tb_order_status` VALUES (523, NULL, '20170824092131154', 'ORDER_PLACE', 135, '2017-08-24 09:21:09');
INSERT INTO `tb_order_status` VALUES (524, NULL, '20170824092234450', 'ORDER_PLACE', 135, '2017-08-24 09:22:23');
INSERT INTO `tb_order_status` VALUES (525, NULL, '20170824092553673', 'ORDER_PLACE', 135, '2017-08-24 09:25:44');
INSERT INTO `tb_order_status` VALUES (526, NULL, '20170824092683223', 'ORDER_PLACE', 135, '2017-08-24 09:26:55');
INSERT INTO `tb_order_status` VALUES (527, NULL, '20170824092807763', 'ORDER_PLACE', 135, '2017-08-24 09:28:06');
INSERT INTO `tb_order_status` VALUES (528, NULL, '20170824092975374', 'ORDER_PLACE', 135, '2017-08-24 09:29:19');
INSERT INTO `tb_order_status` VALUES (529, NULL, '20170824093088734', 'ORDER_PLACE', 135, '2017-08-24 09:30:23');
INSERT INTO `tb_order_status` VALUES (530, NULL, '20170824093120271', 'ORDER_PLACE', 135, '2017-08-24 09:31:29');
INSERT INTO `tb_order_status` VALUES (531, NULL, '20170824094774884', 'ORDER_PLACE', 135, '2017-08-24 09:48:00');
INSERT INTO `tb_order_status` VALUES (532, NULL, '20170824094922613', 'ORDER_PLACE', 135, '2017-08-24 09:49:07');
INSERT INTO `tb_order_status` VALUES (533, NULL, '20170824095075226', 'ORDER_PLACE', 135, '2017-08-24 09:50:12');
INSERT INTO `tb_order_status` VALUES (534, NULL, '20170824095157620', 'ORDER_PLACE', 135, '2017-08-24 09:51:22');
INSERT INTO `tb_order_status` VALUES (535, NULL, '20170824095288154', 'ORDER_PLACE', 135, '2017-08-24 09:52:35');
INSERT INTO `tb_order_status` VALUES (536, NULL, '20170824095344250', 'ORDER_PLACE', 135, '2017-08-24 09:53:40');
INSERT INTO `tb_order_status` VALUES (537, NULL, '20170824095475358', 'ORDER_PLACE', 135, '2017-08-24 09:54:46');
INSERT INTO `tb_order_status` VALUES (538, NULL, '20170824095535332', 'ORDER_PLACE', 135, '2017-08-24 09:55:57');
INSERT INTO `tb_order_status` VALUES (539, NULL, '20170824095728635', 'ORDER_PLACE', 135, '2017-08-24 09:57:02');
INSERT INTO `tb_order_status` VALUES (540, NULL, '20170824095850625', 'ORDER_PLACE', 135, '2017-08-24 09:58:16');
INSERT INTO `tb_order_status` VALUES (541, NULL, '20170824095904821', 'ORDER_PLACE', 135, '2017-08-24 09:59:17');
INSERT INTO `tb_order_status` VALUES (542, NULL, '20170824100073178', 'ORDER_PLACE', 135, '2017-08-24 10:00:35');
INSERT INTO `tb_order_status` VALUES (543, NULL, '20170824100281412', 'ORDER_PLACE', 135, '2017-08-24 10:02:36');
INSERT INTO `tb_order_status` VALUES (544, NULL, '20170824100320474', 'ORDER_PLACE', 135, '2017-08-24 10:03:57');
INSERT INTO `tb_order_status` VALUES (545, NULL, '20170824090030601', 'ORDER_TAKING', 135, '2017-08-24 10:20:38');
INSERT INTO `tb_order_status` VALUES (546, NULL, '20170824091423701', 'ORDER_TAKING', 135, '2017-08-24 10:21:10');
INSERT INTO `tb_order_status` VALUES (547, NULL, '20170824091622313', 'ORDER_TAKING', 135, '2017-08-24 10:21:49');
INSERT INTO `tb_order_status` VALUES (548, NULL, '20170824091764252', 'ORDER_TAKING', 135, '2017-08-24 10:22:19');
INSERT INTO `tb_order_status` VALUES (549, NULL, '20170824091845023', 'ORDER_TAKING', 135, '2017-08-24 10:22:56');
INSERT INTO `tb_order_status` VALUES (550, NULL, '20170824091907540', 'ORDER_TAKING', 135, '2017-08-24 10:23:30');
INSERT INTO `tb_order_status` VALUES (551, NULL, '20170824092131154', 'ORDER_TAKING', 135, '2017-08-24 10:24:06');
INSERT INTO `tb_order_status` VALUES (552, NULL, '20170824092234450', 'ORDER_TAKING', 135, '2017-08-24 10:24:43');
INSERT INTO `tb_order_status` VALUES (553, NULL, '20170824092553673', 'ORDER_TAKING', 135, '2017-08-24 10:25:16');
INSERT INTO `tb_order_status` VALUES (554, NULL, '20170824092683223', 'ORDER_TAKING', 135, '2017-08-24 10:25:48');
INSERT INTO `tb_order_status` VALUES (555, NULL, '20170824092807763', 'ORDER_TAKING', 135, '2017-08-24 10:26:17');
INSERT INTO `tb_order_status` VALUES (556, NULL, '20170824092975374', 'ORDER_TAKING', 135, '2017-08-24 10:26:55');
INSERT INTO `tb_order_status` VALUES (557, NULL, '20170824093088734', 'ORDER_TAKING', 135, '2017-08-24 10:27:42');
INSERT INTO `tb_order_status` VALUES (558, NULL, '20170824093120271', 'ORDER_TAKING', 135, '2017-08-24 10:28:12');
INSERT INTO `tb_order_status` VALUES (559, NULL, '20170824094774884', 'ORDER_TAKING', 135, '2017-08-24 10:28:48');
INSERT INTO `tb_order_status` VALUES (560, NULL, '20170824094922613', 'ORDER_TAKING', 135, '2017-08-24 10:29:19');
INSERT INTO `tb_order_status` VALUES (561, NULL, '20170824095075226', 'ORDER_TAKING', 135, '2017-08-24 10:29:45');
INSERT INTO `tb_order_status` VALUES (562, NULL, '20170824095157620', 'ORDER_TAKING', 135, '2017-08-24 10:30:21');
INSERT INTO `tb_order_status` VALUES (563, NULL, '20170824095288154', 'ORDER_TAKING', 135, '2017-08-24 10:30:46');
INSERT INTO `tb_order_status` VALUES (564, NULL, '20170824095344250', 'ORDER_TAKING', 135, '2017-08-24 10:31:14');
INSERT INTO `tb_order_status` VALUES (565, NULL, '20170824095475358', 'ORDER_TAKING', 135, '2017-08-24 10:31:40');
INSERT INTO `tb_order_status` VALUES (566, NULL, '20170824095535332', 'ORDER_TAKING', 135, '2017-08-24 10:32:06');
INSERT INTO `tb_order_status` VALUES (567, NULL, '20170824095728635', 'ORDER_TAKING', 135, '2017-08-24 10:32:30');
INSERT INTO `tb_order_status` VALUES (568, NULL, '20170824095850625', 'ORDER_TAKING', 135, '2017-08-24 10:33:09');
INSERT INTO `tb_order_status` VALUES (569, NULL, '20170824095904821', 'ORDER_TAKING', 135, '2017-08-24 10:33:40');
INSERT INTO `tb_order_status` VALUES (570, NULL, '20170824100073178', 'ORDER_TAKING', 135, '2017-08-24 10:34:11');
INSERT INTO `tb_order_status` VALUES (571, NULL, '20170824100281412', 'ORDER_TAKING', 135, '2017-08-24 10:34:37');
INSERT INTO `tb_order_status` VALUES (572, NULL, '20170824100320474', 'ORDER_TAKING', 135, '2017-08-24 10:35:00');
INSERT INTO `tb_order_status` VALUES (573, NULL, '20170921155920671', 'ORDER_PLACE', 252, '2017-09-21 15:59:40');
INSERT INTO `tb_order_status` VALUES (574, NULL, '20170921161201886', 'ORDER_PLACE', 252, '2017-09-21 16:12:41');
INSERT INTO `tb_order_status` VALUES (575, NULL, '20170921161327757', 'ORDER_PLACE', 252, '2017-09-21 16:13:57');
INSERT INTO `tb_order_status` VALUES (576, NULL, '20170921171758741', 'ORDER_PLACE', 252, '2017-09-21 17:17:49');
INSERT INTO `tb_order_status` VALUES (577, NULL, '20170921172944886', 'ORDER_PLACE', 252, '2017-09-21 17:29:08');
INSERT INTO `tb_order_status` VALUES (578, NULL, '20170921173076718', 'ORDER_PLACE', 252, '2017-09-21 17:30:21');
INSERT INTO `tb_order_status` VALUES (579, NULL, '20170921173076718', 'ORDER_TAKING', 135, '2018-05-21 15:30:29');
INSERT INTO `tb_order_status` VALUES (580, NULL, '20170921161327757', 'ORDER_TAKING', 129, '2018-08-16 09:12:40');
INSERT INTO `tb_order_status` VALUES (581, NULL, '20170921161201886', 'ORDER_TAKING', 261, '2018-12-23 01:45:30');
COMMIT;

-- ----------------------------
-- Table structure for tb_order_status_value
-- ----------------------------
DROP TABLE IF EXISTS `tb_order_status_value`;
CREATE TABLE `tb_order_status_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(50) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='订单状态码信息';

-- ----------------------------
-- Records of tb_order_status_value
-- ----------------------------
BEGIN;
INSERT INTO `tb_order_status_value` VALUES (1, 'ORDER_PLACE', '已下单，未接单');
INSERT INTO `tb_order_status_value` VALUES (2, 'ORDER_TAKING', '已接单，未运输');
INSERT INTO `tb_order_status_value` VALUES (3, 'ORDER_TRANSPORT', '运输中');
INSERT INTO `tb_order_status_value` VALUES (4, 'ORDER_SIGN', '已签收');
INSERT INTO `tb_order_status_value` VALUES (5, 'ORDER_REFUSE', '已拒绝');
INSERT INTO `tb_order_status_value` VALUES (6, 'ORDER_CANEL', '已取消');
INSERT INTO `tb_order_status_value` VALUES (7, 'ORDER_EDIT', '订单被修改（客户）');
INSERT INTO `tb_order_status_value` VALUES (8, 'ORDER_EDIT_TAKING', '订单被修改（接单）');
INSERT INTO `tb_order_status_value` VALUES (9, 'ORDER_EDIT_SIGN', '订单被修改（签收）');
COMMIT;

-- ----------------------------
-- Table structure for tb_order_taking
-- ----------------------------
DROP TABLE IF EXISTS `tb_order_taking`;
CREATE TABLE `tb_order_taking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_order_id` int(11) DEFAULT NULL COMMENT '订单外键',
  `fk_car_id` int(11) DEFAULT NULL COMMENT '车辆外键',
  `fk_driver_id` int(11) DEFAULT NULL COMMENT '司机外键',
  `freight` float DEFAULT NULL,
  `safes` float DEFAULT NULL,
  `recive` float DEFAULT NULL COMMENT '应付账款',
  `pay` float DEFAULT NULL COMMENT '应收账款',
  `status` varchar(255) DEFAULT NULL COMMENT '关联status表',
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=270 DEFAULT CHARSET=utf8 COMMENT='订单处理表';

-- ----------------------------
-- Records of tb_order_taking
-- ----------------------------
BEGIN;
INSERT INTO `tb_order_taking` VALUES (30, 216, 25, 36, 200, 10, 210, 200, NULL, '2017-08-07 02:34:57');
INSERT INTO `tb_order_taking` VALUES (31, 225, 97, 39, 9611.25, 0, 9611.25, 9611.25, NULL, '2017-08-22 14:37:51');
INSERT INTO `tb_order_taking` VALUES (32, 226, 98, 54, 9501.25, 0, 9501.25, 9501.25, NULL, '2017-08-22 16:05:11');
INSERT INTO `tb_order_taking` VALUES (33, 227, 99, 42, 9666.25, 0, 9666.25, 9666.25, NULL, '2017-08-22 16:06:17');
INSERT INTO `tb_order_taking` VALUES (34, 228, 100, 43, 9625, 0, 9625, 9625, NULL, '2017-08-22 16:07:12');
INSERT INTO `tb_order_taking` VALUES (35, 229, 101, 44, 9611.25, 0, 9611.25, 9611.25, NULL, '2017-08-22 16:08:03');
INSERT INTO `tb_order_taking` VALUES (36, 230, 102, 45, 9625, 0, 9625, 9625, NULL, '2017-08-22 16:08:37');
INSERT INTO `tb_order_taking` VALUES (37, 231, 103, 46, 9597.5, 0, 9597.5, 9597.5, NULL, '2017-08-22 16:09:27');
INSERT INTO `tb_order_taking` VALUES (38, 232, 104, 47, 9542.5, 0, 9542.5, 9542.5, NULL, '2017-08-22 16:10:07');
INSERT INTO `tb_order_taking` VALUES (39, 233, 105, 48, 9409.5, 0, 9409.5, 9409.5, NULL, '2017-08-22 16:10:38');
INSERT INTO `tb_order_taking` VALUES (40, 234, 106, 49, 9515, 0, 9515, 9515, NULL, '2017-08-22 16:11:11');
INSERT INTO `tb_order_taking` VALUES (41, 235, 107, 50, 9666.25, 0, 9666.25, 9666.25, NULL, '2017-08-22 16:11:46');
INSERT INTO `tb_order_taking` VALUES (42, 236, 108, 51, 9570, 0, 9570, 9570, NULL, '2017-08-22 16:12:17');
INSERT INTO `tb_order_taking` VALUES (43, 237, 109, 52, 9652.5, 0, 9652.5, 9652.5, NULL, '2017-08-22 16:12:52');
INSERT INTO `tb_order_taking` VALUES (44, 238, 110, 53, 9583.75, 0, 9583.75, 958375, NULL, '2017-08-22 16:13:32');
INSERT INTO `tb_order_taking` VALUES (45, 240, 111, 40, 9447.25, 0, 9447.25, 9447.25, NULL, '2017-08-22 16:42:11');
INSERT INTO `tb_order_taking` VALUES (46, 241, 114, 40, 9116, 0, 9116, 9116, NULL, '2017-08-22 16:44:21');
INSERT INTO `tb_order_taking` VALUES (47, 243, 115, 55, 9367.75, 0, 9367.75, 9367.75, NULL, '2017-08-22 16:45:14');
INSERT INTO `tb_order_taking` VALUES (48, 244, 116, 40, 9420.75, 0, 9420.75, 9420.75, NULL, '2017-08-22 16:45:59');
INSERT INTO `tb_order_taking` VALUES (49, 245, 117, 56, 9275, 0, 9275, 9275, NULL, '2017-08-22 16:46:43');
INSERT INTO `tb_order_taking` VALUES (50, 246, 118, 57, 9314.75, 0, 9314.75, 9314.75, NULL, '2017-08-22 16:47:31');
INSERT INTO `tb_order_taking` VALUES (51, 247, 119, 58, 8957, 0, 8957, 8957, NULL, '2017-08-22 16:48:23');
INSERT INTO `tb_order_taking` VALUES (52, 248, 120, 59, 9089.5, 0, 9089.5, 9089.5, NULL, '2017-08-22 16:49:00');
INSERT INTO `tb_order_taking` VALUES (53, 249, 121, 60, 9235.25, 0, 9235.25, 9235.25, NULL, '2017-08-22 16:49:47');
INSERT INTO `tb_order_taking` VALUES (54, 250, 122, 61, 9487, 0, 9487, 9487, NULL, '2017-08-22 16:51:10');
INSERT INTO `tb_order_taking` VALUES (55, 251, 123, 61, 9222, 0, 9222, 9222, NULL, '2017-08-22 16:51:48');
INSERT INTO `tb_order_taking` VALUES (56, 252, 124, 62, 9434, 0, 9434, 9434, NULL, '2017-08-22 16:52:50');
INSERT INTO `tb_order_taking` VALUES (57, 253, 125, 63, 9222, 0, 9222, 9222, NULL, '2017-08-22 16:57:03');
INSERT INTO `tb_order_taking` VALUES (58, 254, 126, 61, 9500.25, 0, 9500.25, 9500.25, NULL, '2017-08-22 17:23:36');
INSERT INTO `tb_order_taking` VALUES (59, 255, 127, 62, 9566.5, 0, 9566.5, 9566.5, NULL, '2017-08-22 17:24:40');
INSERT INTO `tb_order_taking` VALUES (60, 256, 128, 64, 9235.25, 0, 9235.25, 9235.25, NULL, '2017-08-22 17:25:47');
INSERT INTO `tb_order_taking` VALUES (61, 257, 129, 65, 9513.5, 0, 9513.5, 9513.5, NULL, '2017-08-22 17:31:43');
INSERT INTO `tb_order_taking` VALUES (62, 258, 130, 66, 9182.25, 0, 9182.25, 9182.25, NULL, '2017-08-22 17:32:46');
INSERT INTO `tb_order_taking` VALUES (63, 259, 131, 66, 9182.25, 0, 9182.25, 9182.25, NULL, '2017-08-22 17:33:24');
INSERT INTO `tb_order_taking` VALUES (64, 260, 132, 67, 9487, 0, 9487, 9487, NULL, '2017-08-22 17:34:11');
INSERT INTO `tb_order_taking` VALUES (65, 261, 133, 68, 9275, 0, 9275, 9275, NULL, '2017-08-22 17:34:48');
INSERT INTO `tb_order_taking` VALUES (66, 262, 134, 69, 9182.25, 0, 9182.25, 9182.25, NULL, '2017-08-22 17:35:23');
INSERT INTO `tb_order_taking` VALUES (67, 263, 135, 70, 9235.25, 0, 9235.25, 9235.25, NULL, '2017-08-22 17:35:56');
INSERT INTO `tb_order_taking` VALUES (68, 264, 136, 71, 9129.25, 0, 9129.25, 9129.25, NULL, '2017-08-22 17:36:36');
INSERT INTO `tb_order_taking` VALUES (69, 265, 137, 71, 9208.75, 0, 9208.75, 9208.75, NULL, '2017-08-22 17:37:25');
INSERT INTO `tb_order_taking` VALUES (70, 266, 138, 72, 9248.5, 0, 9248.5, 9248.5, NULL, '2017-08-22 17:38:01');
INSERT INTO `tb_order_taking` VALUES (72, 428, 139, 73, 9248.5, 0, 9248.5, 9248.5, NULL, '2017-08-22 17:46:23');
INSERT INTO `tb_order_taking` VALUES (73, 268, 141, 73, 9023.25, 0, 9023.25, 9023.25, NULL, '2017-08-22 17:59:14');
INSERT INTO `tb_order_taking` VALUES (74, 269, 142, 73, 9010, 0, 9010, 9010, NULL, '2017-08-22 17:59:45');
INSERT INTO `tb_order_taking` VALUES (75, 270, 143, 74, 9275, 0, 9275, 9275, NULL, '2017-08-22 18:00:18');
INSERT INTO `tb_order_taking` VALUES (76, 271, 144, 74, 9354.5, 0, 9354.5, 9354.5, NULL, '2017-08-22 18:00:54');
INSERT INTO `tb_order_taking` VALUES (77, 272, 145, 75, 9182.25, 0, 9182.25, 9182.25, NULL, '2017-08-22 18:01:27');
INSERT INTO `tb_order_taking` VALUES (79, 429, 146, 75, 9328, 0, 9328, 9328, NULL, '2017-08-22 18:05:05');
INSERT INTO `tb_order_taking` VALUES (80, 274, 147, 75, 9367.75, 0, 9367.75, 9367.75, NULL, '2017-08-22 18:08:02');
INSERT INTO `tb_order_taking` VALUES (81, 275, 148, 77, 9142.5, 0, 9142.5, 9142.5, NULL, '2017-08-22 18:09:21');
INSERT INTO `tb_order_taking` VALUES (82, 276, 149, 77, 9155.75, 0, 9155.75, 9155.75, NULL, '2017-08-22 18:10:08');
INSERT INTO `tb_order_taking` VALUES (83, 277, 150, 78, 8970.25, 0, 8970.25, 8970.25, NULL, '2017-08-22 18:11:21');
INSERT INTO `tb_order_taking` VALUES (84, 278, 151, 79, 9023.25, 0, 9023.25, 9023.25, NULL, '2017-08-22 18:11:47');
INSERT INTO `tb_order_taking` VALUES (85, 279, 152, 80, 8957, 0, 8957, 8957, NULL, '2017-08-22 18:12:25');
INSERT INTO `tb_order_taking` VALUES (86, 280, 153, 75, 9354.5, 0, 9354.5, 9354.5, NULL, '2017-08-22 18:12:58');
INSERT INTO `tb_order_taking` VALUES (87, 281, 154, 74, 9354.5, 0, 9354.5, 9354.5, NULL, '2017-08-22 18:14:03');
INSERT INTO `tb_order_taking` VALUES (88, 282, 155, 62, 9428.7, 0, 9428.7, 9428.7, NULL, '2017-08-22 18:27:47');
INSERT INTO `tb_order_taking` VALUES (89, 283, 156, 62, 9513.5, 0, 9513.5, 9513.5, NULL, '2017-08-22 18:28:33');
INSERT INTO `tb_order_taking` VALUES (90, 284, 157, 62, 9306.8, 0, 9306.8, 9306.8, NULL, '2017-08-22 18:29:15');
INSERT INTO `tb_order_taking` VALUES (91, 285, 158, 62, 9312.1, 0, 9312.1, 9312.1, NULL, '2017-08-22 18:29:57');
INSERT INTO `tb_order_taking` VALUES (92, 286, 159, 62, 9391.6, 0, 9391.6, 9391.6, NULL, '2017-08-22 18:30:34');
INSERT INTO `tb_order_taking` VALUES (93, 288, 160, 55, 9359.8, 0, 9359.8, 9359.8, NULL, '2017-08-22 18:31:15');
INSERT INTO `tb_order_taking` VALUES (94, 289, 162, 74, 9418.1, 0, 9418.1, 9418.1, NULL, '2017-08-22 18:32:22');
INSERT INTO `tb_order_taking` VALUES (95, 287, 161, 75, 9434, 0, 9434, 9434, NULL, '2017-08-22 18:34:43');
INSERT INTO `tb_order_taking` VALUES (96, 290, 163, 74, 9343.9, 0, 9343.9, 9343.9, NULL, '2017-08-22 18:35:23');
INSERT INTO `tb_order_taking` VALUES (97, 292, 164, 61, 9471.1, 0, 9471.1, 9471.1, NULL, '2017-08-22 18:39:15');
INSERT INTO `tb_order_taking` VALUES (98, 293, 165, 61, 9513.5, 0, 9513.5, 9513.5, NULL, '2017-08-22 18:40:05');
INSERT INTO `tb_order_taking` VALUES (99, 294, 166, 81, 9200.8, 0, 9200.8, 9200.8, NULL, '2017-08-22 18:40:40');
INSERT INTO `tb_order_taking` VALUES (100, 295, 167, 82, 9237.9, 0, 9237.9, 9237.9, NULL, '2017-08-22 18:41:19');
INSERT INTO `tb_order_taking` VALUES (101, 296, 168, 82, 8988.8, 0, 8988.8, 8988.8, NULL, '2017-08-22 18:41:54');
INSERT INTO `tb_order_taking` VALUES (102, 297, 169, 61, 9237.9, 0, 9237.9, 9237.9, NULL, '2017-08-22 18:43:09');
INSERT INTO `tb_order_taking` VALUES (103, 298, 190, 59, 9089.5, 0, 9089.5, 9089.5, NULL, '2017-08-23 08:41:51');
INSERT INTO `tb_order_taking` VALUES (104, 299, 188, 60, 9349.2, 0, 9349.2, 9349.2, NULL, '2017-08-23 08:42:38');
INSERT INTO `tb_order_taking` VALUES (105, 300, 172, 58, 8994.1, 0, 8994.1, 8994.1, NULL, '2017-08-23 08:43:46');
INSERT INTO `tb_order_taking` VALUES (106, 301, 173, 83, 9190.2, 0, 9190.2, 9190.2, NULL, '2017-08-23 08:44:32');
INSERT INTO `tb_order_taking` VALUES (107, 302, 174, 92, 9396.9, 0, 9396.9, 9396.9, NULL, '2017-08-23 08:46:33');
INSERT INTO `tb_order_taking` VALUES (108, 303, 175, 84, 9328, 0, 9328, 9328, NULL, '2017-08-23 08:47:07');
INSERT INTO `tb_order_taking` VALUES (109, 304, 176, 85, 9190.2, 0, 9190.2, 9190.2, NULL, '2017-08-23 08:47:40');
INSERT INTO `tb_order_taking` VALUES (110, 305, 177, 86, 9243.2, 0, 9243.2, 9243.2, NULL, '2017-08-23 08:48:14');
INSERT INTO `tb_order_taking` VALUES (111, 306, 178, 87, 9073.6, 0, 9073.6, 9073.6, NULL, '2017-08-23 08:48:51');
INSERT INTO `tb_order_taking` VALUES (112, 307, 179, 88, 9169, 0, 9169, 9169, NULL, '2017-08-23 08:49:28');
INSERT INTO `tb_order_taking` VALUES (113, 308, 180, 61, 9492.3, 0, 9492.3, 9492.3, NULL, '2017-08-23 08:50:11');
INSERT INTO `tb_order_taking` VALUES (114, 309, 181, 61, 9513.5, 0, 9513.5, 9513.5, NULL, '2017-08-23 08:51:01');
INSERT INTO `tb_order_taking` VALUES (115, 310, 182, 61, 9222, 0, 9222, 9222, NULL, '2017-08-23 08:51:39');
INSERT INTO `tb_order_taking` VALUES (116, 311, 183, 89, 9365.1, 0, 9365.1, 9365.1, NULL, '2017-08-23 08:52:08');
INSERT INTO `tb_order_taking` VALUES (117, 312, 184, 90, 9349.2, 0, 9349.2, 9349.2, NULL, '2017-08-23 08:52:48');
INSERT INTO `tb_order_taking` VALUES (118, 313, 185, 91, 9084.2, 0, 9084.2, 9084.2, NULL, '2017-08-23 08:53:26');
INSERT INTO `tb_order_taking` VALUES (119, 314, 186, 75, 9349.2, 0, 9349.2, 9349.2, NULL, '2017-08-23 08:54:34');
INSERT INTO `tb_order_taking` VALUES (120, 315, 187, 75, 9375.7, 0, 9375.7, 9375.7, NULL, '2017-08-23 08:55:11');
INSERT INTO `tb_order_taking` VALUES (121, 316, 188, 60, 9296.2, 0, 9296.2, 9296.2, NULL, '2017-08-23 08:55:52');
INSERT INTO `tb_order_taking` VALUES (122, 317, 189, 62, 9455.2, 0, 9455.2, 9455.2, NULL, '2017-08-23 08:56:29');
INSERT INTO `tb_order_taking` VALUES (123, 318, 190, 59, 9100.1, 0, 9100.1, 9100.1, NULL, '2017-08-23 08:57:12');
INSERT INTO `tb_order_taking` VALUES (124, 319, 191, 62, 9354.5, 0, 9354.5, 9354.5, NULL, '2017-08-23 08:57:55');
INSERT INTO `tb_order_taking` VALUES (125, 320, 192, 62, 9471.1, 0, 9471.1, 9471.1, NULL, '2017-08-23 08:58:31');
INSERT INTO `tb_order_taking` VALUES (126, 321, 193, 40, 9237.9, 0, 9237.9, 9237.9, NULL, '2017-08-23 08:59:06');
INSERT INTO `tb_order_taking` VALUES (127, 322, 194, 40, 9232.6, 0, 9232.6, 9232.6, NULL, '2017-08-23 08:59:35');
INSERT INTO `tb_order_taking` VALUES (128, 323, 195, 40, 9285.6, 0, 9285.6, 9285.6, NULL, '2017-08-23 09:00:07');
INSERT INTO `tb_order_taking` VALUES (129, 324, 200, 40, 9206.1, 0, 9206.1, 9206.1, NULL, '2017-08-23 09:00:34');
INSERT INTO `tb_order_taking` VALUES (130, 325, 197, 40, 9328, 0, 9328, 9328, NULL, '2017-08-23 09:01:04');
INSERT INTO `tb_order_taking` VALUES (131, 327, 199, 40, 9264.4, 0, 9264.4, 9264.4, NULL, '2017-08-23 09:02:02');
INSERT INTO `tb_order_taking` VALUES (132, 326, 198, 40, 9290.9, 0, 9290.9, 9290.9, NULL, '2017-08-23 09:02:55');
INSERT INTO `tb_order_taking` VALUES (133, 328, 200, 40, 9216.7, 0, 9216.7, 9216.7, NULL, '2017-08-23 09:03:28');
INSERT INTO `tb_order_taking` VALUES (134, 329, 201, 40, 9253.8, 0, 9253.8, 9253.8, NULL, '2017-08-23 09:03:54');
INSERT INTO `tb_order_taking` VALUES (136, 330, 203, 93, 9328, 0, 9328, 9328, NULL, '2017-08-23 09:54:57');
INSERT INTO `tb_order_taking` VALUES (137, 331, 204, 75, 9354.5, 0, 9354.5, 9354.5, NULL, '2017-08-23 09:55:36');
INSERT INTO `tb_order_taking` VALUES (138, 332, 205, 75, 9359.8, 0, 9359.8, 9359.8, NULL, '2017-08-23 09:56:09');
INSERT INTO `tb_order_taking` VALUES (139, 333, 206, 75, 9222, 0, 9222, 9222, NULL, '2017-08-23 09:56:43');
INSERT INTO `tb_order_taking` VALUES (140, 334, 207, 94, 9237.9, 0, 9237.9, 9237.9, NULL, '2017-08-23 09:57:16');
INSERT INTO `tb_order_taking` VALUES (141, 335, 208, 95, 9290.9, 0, 9290.9, 9290.9, NULL, '2017-08-23 10:01:37');
INSERT INTO `tb_order_taking` VALUES (142, 336, 209, 96, 9386.3, 0, 9386.3, 9386.3, NULL, '2017-08-23 10:02:12');
INSERT INTO `tb_order_taking` VALUES (143, 337, 210, 97, 9227.3, 0, 9227.3, 9227.3, NULL, '2017-08-23 10:02:38');
INSERT INTO `tb_order_taking` VALUES (144, 338, 211, 56, 9084.2, 0, 9084.2, 9084.2, NULL, '2017-08-23 10:03:19');
INSERT INTO `tb_order_taking` VALUES (145, 339, 212, 98, 9343.9, 0, 9343.9, 9343.9, NULL, '2017-08-23 10:03:51');
INSERT INTO `tb_order_taking` VALUES (146, 340, 213, 57, 9259.1, 0, 9259.1, 9259.1, NULL, '2017-08-23 10:04:40');
INSERT INTO `tb_order_taking` VALUES (147, 341, 214, 99, 9412.8, 0, 9412.8, 9412.8, NULL, '2017-08-23 10:05:01');
INSERT INTO `tb_order_taking` VALUES (148, 342, 215, 67, 9349.2, 0, 9349.2, 9349.2, NULL, '2017-08-23 10:05:59');
INSERT INTO `tb_order_taking` VALUES (149, 343, 216, 100, 9317.4, 0, 9317.4, 9317.4, NULL, '2017-08-23 10:06:31');
INSERT INTO `tb_order_taking` VALUES (150, 344, 217, 65, 9343.9, 0, 9343.9, 9343.9, NULL, '2017-08-23 10:07:08');
INSERT INTO `tb_order_taking` VALUES (151, 345, 218, 101, 9285.6, 0, 9285.6, 9285.6, NULL, '2017-08-23 10:07:34');
INSERT INTO `tb_order_taking` VALUES (152, 346, 219, 102, 9248.5, 0, 9248.5, 9248.5, NULL, '2017-08-23 10:21:10');
INSERT INTO `tb_order_taking` VALUES (153, 347, 220, 102, 9211.4, 0, 9211.4, 9211.4, NULL, '2017-08-23 10:21:43');
INSERT INTO `tb_order_taking` VALUES (154, 348, 221, 40, 9153.1, 0, 9153.1, 9153.1, NULL, '2017-08-23 10:22:20');
INSERT INTO `tb_order_taking` VALUES (155, 349, 222, 40, 9195.5, 0, 9195.5, 9195.5, NULL, '2017-08-23 10:22:55');
INSERT INTO `tb_order_taking` VALUES (156, 350, 223, 40, 9253.8, 0, 9253.8, 9253.8, NULL, '2017-08-23 10:23:26');
INSERT INTO `tb_order_taking` VALUES (157, 351, 224, 103, 9328, 0, 9328, 9328, NULL, '2017-08-23 10:23:53');
INSERT INTO `tb_order_taking` VALUES (158, 352, 225, 103, 9333.3, 0, 9333.3, 9333.3, NULL, '2017-08-23 10:24:20');
INSERT INTO `tb_order_taking` VALUES (159, 353, 226, 66, 9227.3, 0, 9227.3, 9227.3, NULL, '2017-08-23 10:24:54');
INSERT INTO `tb_order_taking` VALUES (160, 354, 227, 40, 9338.6, 0, 9338.6, 9338.6, NULL, '2017-08-23 10:25:25');
INSERT INTO `tb_order_taking` VALUES (161, 355, 228, 87, 9047.1, 0, 9047.1, 9047.1, NULL, '2017-08-23 10:27:02');
INSERT INTO `tb_order_taking` VALUES (162, 356, 229, 88, 9163.7, 0, 9163.7, 9163.7, NULL, '2017-08-23 10:27:50');
INSERT INTO `tb_order_taking` VALUES (163, 357, 230, 104, 9248.5, 0, 9248.5, 9248.5, NULL, '2017-08-23 10:28:44');
INSERT INTO `tb_order_taking` VALUES (164, 358, 232, 102, 9312.1, 0, 9312.1, 9312.1, NULL, '2017-08-23 10:29:41');
INSERT INTO `tb_order_taking` VALUES (165, 359, 231, 105, 9211.4, 0, 9211.4, 9211.4, NULL, '2017-08-23 10:30:23');
INSERT INTO `tb_order_taking` VALUES (166, 360, 233, 40, 9269.7, 0, 9269.7, 9269.7, NULL, '2017-08-23 10:31:04');
INSERT INTO `tb_order_taking` VALUES (167, 361, 234, 106, 9195.5, 0, 9195.5, 9195.5, NULL, '2017-08-23 10:31:36');
INSERT INTO `tb_order_taking` VALUES (168, 362, 235, 107, 9200.8, 0, 9200.8, 9200.8, NULL, '2017-08-23 10:32:03');
INSERT INTO `tb_order_taking` VALUES (169, 363, 236, 108, 9577.1, 0, 9577.1, 9577.1, NULL, '2017-08-23 10:32:32');
INSERT INTO `tb_order_taking` VALUES (170, 364, 237, 109, 8935.8, 0, 8935.8, 8935.8, NULL, '2017-08-23 10:33:01');
INSERT INTO `tb_order_taking` VALUES (171, 365, 238, 110, 9593, 0, 9593, 9593, NULL, '2017-08-23 10:33:29');
INSERT INTO `tb_order_taking` VALUES (172, 366, 239, 111, 9052.4, 0, 9052.4, 9052.4, NULL, '2017-08-23 10:34:03');
INSERT INTO `tb_order_taking` VALUES (173, 367, 240, 89, 9365.1, 0, 9365.1, 9365.1, NULL, '2017-08-23 10:34:39');
INSERT INTO `tb_order_taking` VALUES (174, 368, 241, 90, 9349.2, 0, 9349.2, 9349.2, NULL, '2017-08-23 10:35:15');
INSERT INTO `tb_order_taking` VALUES (175, 369, 242, 40, 9227.3, 0, 9227.3, 9227.3, NULL, '2017-08-23 10:35:42');
INSERT INTO `tb_order_taking` VALUES (176, 370, 243, 75, 9322.7, 0, 9322.7, 9322.7, NULL, '2017-08-23 10:36:10');
INSERT INTO `tb_order_taking` VALUES (177, 371, 244, 75, 9365.1, 0, 9365.1, 9365.1, NULL, '2017-08-23 10:36:38');
INSERT INTO `tb_order_taking` VALUES (178, 373, 245, 126, 9137.2, 0, 9137.2, 9137.2, NULL, '2017-08-23 16:07:50');
INSERT INTO `tb_order_taking` VALUES (179, 374, 246, 112, 9370.4, 0, 9370.4, 9370.4, NULL, '2017-08-23 16:08:26');
INSERT INTO `tb_order_taking` VALUES (180, 375, 247, 113, 9434, 0, 9434, 9434, NULL, '2017-08-23 16:09:11');
INSERT INTO `tb_order_taking` VALUES (181, 376, 248, 40, 9338.6, 0, 9338.6, 9338.6, NULL, '2017-08-23 16:09:40');
INSERT INTO `tb_order_taking` VALUES (182, 377, 249, 40, 9312.1, 0, 9312.1, 9312.1, NULL, '2017-08-23 16:10:09');
INSERT INTO `tb_order_taking` VALUES (183, 378, 250, 114, 9290.9, 0, 9290.9, 9290.9, NULL, '2017-08-23 16:10:45');
INSERT INTO `tb_order_taking` VALUES (184, 379, 251, 115, 9349.2, 0, 9349.2, 9349.2, NULL, '2017-08-23 16:11:16');
INSERT INTO `tb_order_taking` VALUES (185, 380, 252, 116, 9487, 0, 9487, 9487, NULL, '2017-08-23 16:11:46');
INSERT INTO `tb_order_taking` VALUES (186, 381, 253, 117, 9158.4, 0, 9158.4, 91584, NULL, '2017-08-23 16:12:14');
INSERT INTO `tb_order_taking` VALUES (187, 382, 254, 62, 9328, 0, 9328, 9328, NULL, '2017-08-23 16:13:05');
INSERT INTO `tb_order_taking` VALUES (188, 383, 255, 118, 9216.7, 0, 9216.7, 9216.7, NULL, '2017-08-23 16:13:39');
INSERT INTO `tb_order_taking` VALUES (189, 384, 256, 119, 9147.8, 0, 9147.8, 9147.8, NULL, '2017-08-23 16:14:58');
INSERT INTO `tb_order_taking` VALUES (190, 385, 256, 119, 9147.8, 0, 9147.8, 9147.8, NULL, '2017-08-23 16:15:39');
INSERT INTO `tb_order_taking` VALUES (191, 386, 257, 120, 9227.3, 0, 9227.3, 9227.3, NULL, '2017-08-23 16:16:29');
INSERT INTO `tb_order_taking` VALUES (192, 387, 258, 121, 9237.9, 0, 9237.9, 9237.9, NULL, '2017-08-23 16:17:08');
INSERT INTO `tb_order_taking` VALUES (193, 388, 259, 122, 9306.8, 0, 9306.8, 9306.8, NULL, '2017-08-23 16:17:38');
INSERT INTO `tb_order_taking` VALUES (194, 389, 260, 40, 9264.4, 0, 9264.4, 9264.4, NULL, '2017-08-23 16:18:09');
INSERT INTO `tb_order_taking` VALUES (195, 390, 261, 40, 9200.8, 0, 9200.8, 9200.8, NULL, '2017-08-23 16:18:41');
INSERT INTO `tb_order_taking` VALUES (196, 391, 262, 40, 9312.1, 0, 9312.1, 9312.1, NULL, '2017-08-23 16:19:14');
INSERT INTO `tb_order_taking` VALUES (197, 392, 263, 75, 9375.7, 0, 9375.7, 9375.7, NULL, '2017-08-23 16:20:30');
INSERT INTO `tb_order_taking` VALUES (198, 393, 264, 123, 9317.4, 0, 9317.4, 9317.4, NULL, '2017-08-23 16:20:58');
INSERT INTO `tb_order_taking` VALUES (199, 394, 265, 116, 9328, 0, 9328, 9328, NULL, '2017-08-23 16:21:41');
INSERT INTO `tb_order_taking` VALUES (200, 395, 266, 61, 9508.2, 0, 9508.2, 9508.2, NULL, '2017-08-23 16:22:35');
INSERT INTO `tb_order_taking` VALUES (201, 396, 267, 124, 9359.8, 0, 9359.8, 9359.8, NULL, '2017-08-23 16:23:06');
INSERT INTO `tb_order_taking` VALUES (202, 397, 268, 125, 9147.8, 0, 9147.8, 9147.8, NULL, '2017-08-23 16:23:34');
INSERT INTO `tb_order_taking` VALUES (203, 398, 269, 73, 9131.9, 0, 9131.9, 9131.9, NULL, '2017-08-23 16:24:07');
INSERT INTO `tb_order_taking` VALUES (204, 399, 270, 73, 9237.9, 0, 9237.9, 9237.9, NULL, '2017-08-23 16:24:39');
INSERT INTO `tb_order_taking` VALUES (205, 400, 271, 61, 9216.7, 0, 9216.7, 9216.7, NULL, '2017-08-23 16:25:16');
INSERT INTO `tb_order_taking` VALUES (206, 427, 281, 128, 9264.4, 0, 9264.4, 9264.4, NULL, '2017-08-23 16:33:27');
INSERT INTO `tb_order_taking` VALUES (207, 426, 280, 132, 9322.7, 0, 9322.7, 9322.7, NULL, '2017-08-23 16:33:57');
INSERT INTO `tb_order_taking` VALUES (208, 425, 279, 131, 9200.8, 0, 9200.8, 9200.8, NULL, '2017-08-23 16:34:20');
INSERT INTO `tb_order_taking` VALUES (209, 424, 278, 130, 9116, 0, 9116, 9116, NULL, '2017-08-23 16:34:44');
INSERT INTO `tb_order_taking` VALUES (210, 423, 277, 129, 9317.4, 0, 9317.4, 9317.4, NULL, '2017-08-23 16:35:05');
INSERT INTO `tb_order_taking` VALUES (211, 422, 276, 128, 9349.2, 0, 9349.2, 93492, NULL, '2017-08-23 16:35:30');
INSERT INTO `tb_order_taking` VALUES (212, 421, 275, 127, 9169, 0, 9169, 9169, NULL, '2017-08-23 16:35:55');
INSERT INTO `tb_order_taking` VALUES (213, 420, 274, 106, 9227.3, 0, 9227.3, 9227.3, NULL, '2017-08-23 16:36:35');
INSERT INTO `tb_order_taking` VALUES (214, 419, 273, 108, 9593, 0, 9593, 9593, NULL, '2017-08-23 16:37:19');
INSERT INTO `tb_order_taking` VALUES (215, 418, 272, 107, 9211.4, 0, 9211.4, 9211.4, NULL, '2017-08-23 16:38:03');
INSERT INTO `tb_order_taking` VALUES (216, 401, 282, 40, 9264.4, 0, 9264.4, 9264.4, NULL, '2017-08-23 16:45:53');
INSERT INTO `tb_order_taking` VALUES (217, 402, 283, 75, 9174.3, 0, 9174.3, 9174.3, NULL, '2017-08-23 16:46:32');
INSERT INTO `tb_order_taking` VALUES (218, 403, 284, 62, 9359.8, 0, 9359.8, 9359.8, NULL, '2017-08-23 16:47:02');
INSERT INTO `tb_order_taking` VALUES (219, 404, 285, 40, 9301.5, 0, 9301.5, 9301.5, NULL, '2017-08-23 16:47:36');
INSERT INTO `tb_order_taking` VALUES (220, 405, 286, 40, 9264.4, 0, 9264.4, 9264.4, NULL, '2017-08-23 16:48:12');
INSERT INTO `tb_order_taking` VALUES (221, 406, 287, 133, 9216.7, 0, 9216.7, 9216.7, NULL, '2017-08-23 16:48:42');
INSERT INTO `tb_order_taking` VALUES (222, 407, 288, 61, 9566.5, 0, 9566.5, 9566.5, NULL, '2017-08-23 16:49:26');
INSERT INTO `tb_order_taking` VALUES (223, 408, 289, 40, 9163.7, 0, 9163.7, 9163.7, NULL, '2017-08-23 16:49:55');
INSERT INTO `tb_order_taking` VALUES (224, 409, 290, 40, 9312.1, 0, 9312.1, 9312.1, NULL, '2017-08-23 16:50:20');
INSERT INTO `tb_order_taking` VALUES (225, 410, 291, 40, 9269.7, 0, 9269.7, 9269.7, NULL, '2017-08-23 16:50:54');
INSERT INTO `tb_order_taking` VALUES (226, 411, 292, 134, 9465.8, 0, 9465.8, 9465.8, NULL, '2017-08-23 16:51:14');
INSERT INTO `tb_order_taking` VALUES (227, 412, 293, 135, 9375.7, 0, 9375.7, 9375.7, NULL, '2017-08-23 16:51:38');
INSERT INTO `tb_order_taking` VALUES (228, 414, 295, 134, 9375.7, 0, 9375.7, 9375.7, NULL, '2017-08-23 16:52:09');
INSERT INTO `tb_order_taking` VALUES (229, 413, 294, 66, 9243.2, 0, 9243.2, 9243.2, NULL, '2017-08-23 16:52:59');
INSERT INTO `tb_order_taking` VALUES (230, 415, 296, 75, 9365.1, 0, 9365.1, 9365.1, NULL, '2017-08-23 16:53:38');
INSERT INTO `tb_order_taking` VALUES (231, 416, 297, 62, 9508.2, 0, 9508.2, 9508.2, NULL, '2017-08-23 16:54:16');
INSERT INTO `tb_order_taking` VALUES (249, 453, 315, 148, 9153, 0, 9153, 9153, NULL, '2017-08-24 10:26:17');
INSERT INTO `tb_order_taking` VALUES (250, 454, 316, 144, 9153, 0, 9153, 9153, NULL, '2017-08-24 10:26:55');
INSERT INTO `tb_order_taking` VALUES (251, 455, 317, 144, 9218, 0, 9218, 9218, NULL, '2017-08-24 10:27:42');
INSERT INTO `tb_order_taking` VALUES (252, 456, 318, 144, 10530, 0, 10530, 10530, NULL, '2017-08-24 10:28:12');
INSERT INTO `tb_order_taking` VALUES (253, 457, 319, 144, 9391, 0, 9391, 9391, NULL, '2017-08-24 10:28:48');
INSERT INTO `tb_order_taking` VALUES (268, 473, 21, 38, 0, 200, 200, 200, NULL, '2018-08-16 09:12:40');
INSERT INTO `tb_order_taking` VALUES (269, 472, 333, 152, 0, 1, 1, 1, NULL, '2018-12-23 01:45:30');
COMMIT;

-- ----------------------------
-- Table structure for tb_profit
-- ----------------------------
DROP TABLE IF EXISTS `tb_profit`;
CREATE TABLE `tb_profit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_order_id` int(11) DEFAULT NULL,
  `order_number` varchar(50) DEFAULT NULL,
  `recive` float DEFAULT NULL,
  `pay` float DEFAULT NULL,
  `recive_now` float DEFAULT NULL,
  `pay_now` float DEFAULT NULL,
  `is_recive` tinyint(4) DEFAULT NULL,
  `is_pay` tinyint(4) DEFAULT NULL,
  `profit` float DEFAULT NULL,
  `belong_user_id` int(11) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=261 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_profit
-- ----------------------------
BEGIN;
INSERT INTO `tb_profit` VALUES (20, 215, '20170806203416507', 24, 12, 0, 0, 0, 0, 0, 129, '2017-08-06 12:34:32');
INSERT INTO `tb_profit` VALUES (21, 216, '20170807103463303', 210, 200, 210, 200, 1, 0, 0, 127, '2017-08-07 02:34:57');
INSERT INTO `tb_profit` VALUES (22, 225, '20170816153925546', 9611.25, 9611.25, 0, 0, 0, 0, 0, 135, '2017-08-22 14:37:51');
INSERT INTO `tb_profit` VALUES (23, 226, '20170816154388836', 9501.25, 9501.25, 0, 0, 0, 0, 0, 135, '2017-08-22 16:05:11');
INSERT INTO `tb_profit` VALUES (24, 227, '20170816154512686', 9666.25, 9666.25, 0, 0, 0, 0, 0, 135, '2017-08-22 16:06:17');
INSERT INTO `tb_profit` VALUES (25, 228, '20170816154741255', 9625, 9625, 0, 0, 0, 0, 0, 135, '2017-08-22 16:07:12');
INSERT INTO `tb_profit` VALUES (26, 229, '20170816154936300', 9611.25, 9611.25, 0, 0, 0, 0, 0, 135, '2017-08-22 16:08:03');
INSERT INTO `tb_profit` VALUES (27, 230, '20170816155141025', 9625, 9625, 0, 0, 0, 0, 0, 135, '2017-08-22 16:08:37');
INSERT INTO `tb_profit` VALUES (28, 231, '20170816155464348', 9597.5, 9597.5, 0, 0, 0, 0, 0, 135, '2017-08-22 16:09:27');
INSERT INTO `tb_profit` VALUES (29, 232, '20170816155877081', 9542.5, 9542.5, 0, 0, 0, 0, 0, 135, '2017-08-22 16:10:07');
INSERT INTO `tb_profit` VALUES (30, 233, '20170816160036755', 9409.5, 9409.5, 0, 0, 0, 0, 0, 135, '2017-08-22 16:10:38');
INSERT INTO `tb_profit` VALUES (31, 234, '20170816160240262', 9515, 9515, 0, 0, 0, 0, 0, 135, '2017-08-22 16:11:11');
INSERT INTO `tb_profit` VALUES (32, 235, '20170816160412101', 9666.25, 9666.25, 0, 0, 0, 0, 0, 135, '2017-08-22 16:11:46');
INSERT INTO `tb_profit` VALUES (33, 236, '20170816160678668', 9570, 9570, 0, 0, 0, 0, 0, 135, '2017-08-22 16:12:17');
INSERT INTO `tb_profit` VALUES (34, 237, '20170816160788004', 9652.5, 9652.5, 0, 0, 0, 0, 0, 135, '2017-08-22 16:12:52');
INSERT INTO `tb_profit` VALUES (35, 238, '20170816160941824', 9583.75, 958375, 0, 0, 0, 0, 948791, 135, '2017-08-22 16:13:31');
INSERT INTO `tb_profit` VALUES (36, 240, '20170816163587243', 9447.25, 9447.25, 0, 0, 0, 0, 0, 135, '2017-08-22 16:42:11');
INSERT INTO `tb_profit` VALUES (37, 241, '20170816163814583', 9116, 9116, 0, 0, 0, 0, 0, 135, '2017-08-22 16:44:21');
INSERT INTO `tb_profit` VALUES (38, 243, '20170816164337186', 9367.75, 9367.75, 0, 0, 0, 0, 0, 135, '2017-08-22 16:45:14');
INSERT INTO `tb_profit` VALUES (39, 244, '20170816164603623', 9420.75, 9420.75, 0, 0, 0, 0, 0, 135, '2017-08-22 16:45:59');
INSERT INTO `tb_profit` VALUES (40, 245, '20170816164931544', 9275, 9275, 0, 0, 0, 0, 0, 135, '2017-08-22 16:46:43');
INSERT INTO `tb_profit` VALUES (41, 246, '20170816165127406', 9314.75, 9314.75, 0, 0, 0, 0, 0, 135, '2017-08-22 16:47:31');
INSERT INTO `tb_profit` VALUES (42, 247, '20170816165262472', 8957, 8957, 0, 0, 0, 0, 0, 135, '2017-08-22 16:48:23');
INSERT INTO `tb_profit` VALUES (43, 248, '20170816165422174', 9089.5, 9089.5, 0, 0, 0, 0, 0, 135, '2017-08-22 16:49:00');
INSERT INTO `tb_profit` VALUES (44, 249, '20170816165653086', 9235.25, 9235.25, 0, 0, 0, 0, 0, 135, '2017-08-22 16:49:47');
INSERT INTO `tb_profit` VALUES (45, 250, '20170816165714043', 9487, 9487, 0, 0, 0, 0, 0, 135, '2017-08-22 16:51:10');
INSERT INTO `tb_profit` VALUES (46, 251, '20170816165933474', 9222, 9222, 0, 0, 0, 0, 0, 135, '2017-08-22 16:51:48');
INSERT INTO `tb_profit` VALUES (47, 252, '20170816170008235', 9434, 9434, 0, 0, 0, 0, 0, 135, '2017-08-22 16:52:50');
INSERT INTO `tb_profit` VALUES (48, 253, '20170816170246532', 9222, 9222, 0, 0, 0, 0, 0, 135, '2017-08-22 16:57:03');
INSERT INTO `tb_profit` VALUES (49, 254, '20170816170465067', 9500.25, 9500.25, 0, 0, 0, 0, 0, 135, '2017-08-22 17:23:36');
INSERT INTO `tb_profit` VALUES (50, 255, '20170816170564513', 9566.5, 9566.5, 0, 0, 0, 0, 0, 135, '2017-08-22 17:24:40');
INSERT INTO `tb_profit` VALUES (51, 256, '20170816170752010', 9235.25, 9235.25, 0, 0, 0, 0, 0, 135, '2017-08-22 17:25:47');
INSERT INTO `tb_profit` VALUES (52, 257, '20170816170824687', 9513.5, 9513.5, 0, 0, 0, 0, 0, 135, '2017-08-22 17:31:43');
INSERT INTO `tb_profit` VALUES (53, 258, '20170816171060814', 9182.25, 9182.25, 0, 0, 0, 0, 0, 135, '2017-08-22 17:32:46');
INSERT INTO `tb_profit` VALUES (54, 259, '20170816171107487', 9182.25, 9182.25, 0, 0, 0, 0, 0, 135, '2017-08-22 17:33:24');
INSERT INTO `tb_profit` VALUES (55, 260, '20170816171345100', 9487, 9487, 0, 0, 0, 0, 0, 135, '2017-08-22 17:34:11');
INSERT INTO `tb_profit` VALUES (56, 261, '20170816171573117', 9275, 9275, 0, 0, 0, 0, 0, 135, '2017-08-22 17:34:48');
INSERT INTO `tb_profit` VALUES (57, 262, '20170816171657063', 9182.25, 9182.25, 0, 0, 0, 0, 0, 135, '2017-08-22 17:35:23');
INSERT INTO `tb_profit` VALUES (58, 263, '20170816171800117', 9235.25, 9235.25, 0, 0, 0, 0, 0, 135, '2017-08-22 17:35:56');
INSERT INTO `tb_profit` VALUES (59, 264, '20170816171983325', 9129.25, 9129.25, 0, 0, 0, 0, 0, 135, '2017-08-22 17:36:36');
INSERT INTO `tb_profit` VALUES (60, 265, '20170816172125567', 9208.75, 9208.75, 0, 0, 0, 0, 0, 135, '2017-08-22 17:37:25');
INSERT INTO `tb_profit` VALUES (61, 266, '20170816172274825', 9248.5, 9248.5, 0, 0, 0, 0, 0, 135, '2017-08-22 17:38:01');
INSERT INTO `tb_profit` VALUES (62, 267, '20170816172577740', 9248.5, 0, 0, 0, 0, 1, 9248.5, 135, '2017-08-22 17:39:50');
INSERT INTO `tb_profit` VALUES (63, 428, '20170822174600881', 9248.5, 9248.5, 0, 0, 0, 0, 0, 135, '2017-08-22 17:46:23');
INSERT INTO `tb_profit` VALUES (64, 268, '20170816172686708', 9023.25, 9023.25, 0, 0, 0, 0, 0, 135, '2017-08-22 17:59:14');
INSERT INTO `tb_profit` VALUES (65, 269, '20170816172963420', 9010, 9010, 0, 0, 0, 0, 0, 135, '2017-08-22 17:59:45');
INSERT INTO `tb_profit` VALUES (66, 270, '20170816173165180', 9275, 9275, 0, 0, 0, 0, 0, 135, '2017-08-22 18:00:18');
INSERT INTO `tb_profit` VALUES (67, 271, '20170816173288383', 9354.5, 9354.5, 0, 0, 0, 0, 0, 135, '2017-08-22 18:00:54');
INSERT INTO `tb_profit` VALUES (68, 272, '20170816173452840', 9182.25, 9182.25, 0, 0, 0, 0, 0, 135, '2017-08-22 18:01:27');
INSERT INTO `tb_profit` VALUES (69, 273, '20170816173564083', 9367.75, 936775, 0, 0, 0, 0, -927407, 135, '2017-08-22 18:02:12');
INSERT INTO `tb_profit` VALUES (70, 429, '20170822180414442', 9328, 9328, 0, 0, 0, 0, 0, 135, '2017-08-22 18:05:05');
INSERT INTO `tb_profit` VALUES (71, 274, '20170816173772653', 9367.75, 9367.75, 0, 0, 0, 0, 0, 135, '2017-08-22 18:08:02');
INSERT INTO `tb_profit` VALUES (72, 275, '20170816173832156', 9142.5, 9142.5, 0, 0, 0, 0, 0, 135, '2017-08-22 18:09:21');
INSERT INTO `tb_profit` VALUES (73, 276, '20170816173978224', 9155.75, 9155.75, 0, 0, 0, 0, 0, 135, '2017-08-22 18:10:08');
INSERT INTO `tb_profit` VALUES (74, 277, '20170816174173580', 8970.25, 8970.25, 0, 0, 0, 0, 0, 135, '2017-08-22 18:11:21');
INSERT INTO `tb_profit` VALUES (75, 278, '20170816174302538', 9023.25, 9023.25, 0, 0, 0, 0, 0, 135, '2017-08-22 18:11:47');
INSERT INTO `tb_profit` VALUES (76, 279, '20170816174461184', 8957, 8957, 0, 0, 0, 0, 0, 135, '2017-08-22 18:12:25');
INSERT INTO `tb_profit` VALUES (77, 280, '20170816174544843', 9354.5, 9354.5, 0, 0, 0, 0, 0, 135, '2017-08-22 18:12:58');
INSERT INTO `tb_profit` VALUES (78, 281, '20170816174737302', 9354.5, 9354.5, 0, 0, 0, 0, 0, 135, '2017-08-22 18:14:03');
INSERT INTO `tb_profit` VALUES (79, 282, '20170817102821333', 9428.7, 9428.7, 0, 0, 0, 0, 0, 135, '2017-08-22 18:27:47');
INSERT INTO `tb_profit` VALUES (80, 283, '20170817103230753', 9513.5, 9513.5, 0, 0, 0, 0, 0, 135, '2017-08-22 18:28:33');
INSERT INTO `tb_profit` VALUES (81, 284, '20170817103342115', 9306.8, 9306.8, 0, 0, 0, 0, 0, 135, '2017-08-22 18:29:15');
INSERT INTO `tb_profit` VALUES (82, 285, '20170817103544545', 9312.1, 9312.1, 0, 0, 0, 0, 0, 135, '2017-08-22 18:29:57');
INSERT INTO `tb_profit` VALUES (83, 286, '20170817103653321', 9391.6, 9391.6, 0, 0, 0, 0, 0, 135, '2017-08-22 18:30:34');
INSERT INTO `tb_profit` VALUES (84, 288, '20170817103906486', 9359.8, 9359.8, 0, 0, 0, 0, 0, 135, '2017-08-22 18:31:15');
INSERT INTO `tb_profit` VALUES (85, 289, '20170817104033557', 9418.1, 9418.1, 0, 0, 0, 0, 0, 135, '2017-08-22 18:32:22');
INSERT INTO `tb_profit` VALUES (86, 287, '20170817103738861', 9434, 9434, 0, 0, 0, 0, 0, 135, '2017-08-22 18:34:43');
INSERT INTO `tb_profit` VALUES (87, 290, '20170817104288402', 9343.9, 9343.9, 0, 0, 0, 0, 0, 135, '2017-08-22 18:35:23');
INSERT INTO `tb_profit` VALUES (88, 292, '20170817104680208', 9471.1, 9471.1, 0, 0, 0, 0, 0, 135, '2017-08-22 18:39:15');
INSERT INTO `tb_profit` VALUES (89, 293, '20170817104747312', 9513.5, 9513.5, 0, 0, 0, 0, 0, 135, '2017-08-22 18:40:05');
INSERT INTO `tb_profit` VALUES (90, 294, '20170817104874412', 9200.8, 9200.8, 0, 0, 0, 0, 0, 135, '2017-08-22 18:40:40');
INSERT INTO `tb_profit` VALUES (91, 295, '20170817105043446', 9237.9, 9237.9, 0, 0, 0, 0, 0, 135, '2017-08-22 18:41:19');
INSERT INTO `tb_profit` VALUES (92, 296, '20170817105117001', 8988.8, 8988.8, 0, 0, 0, 0, 0, 135, '2017-08-22 18:41:54');
INSERT INTO `tb_profit` VALUES (93, 297, '20170817105273485', 9237.9, 9237.9, 0, 0, 0, 0, 0, 135, '2017-08-22 18:43:09');
INSERT INTO `tb_profit` VALUES (94, 298, '20170817105426888', 9089.5, 9089.5, 0, 0, 0, 0, 0, 135, '2017-08-23 08:41:51');
INSERT INTO `tb_profit` VALUES (95, 299, '20170817105571467', 9349.2, 9349.2, 0, 0, 0, 0, 0, 135, '2017-08-23 08:42:38');
INSERT INTO `tb_profit` VALUES (96, 300, '20170817105631270', 8994.1, 8994.1, 0, 0, 0, 0, 0, 135, '2017-08-23 08:43:46');
INSERT INTO `tb_profit` VALUES (97, 301, '20170817105827785', 9190.2, 9190.2, 0, 0, 0, 0, 0, 135, '2017-08-23 08:44:32');
INSERT INTO `tb_profit` VALUES (98, 302, '20170817105972077', 9396.9, 9396.9, 0, 0, 0, 0, 0, 135, '2017-08-23 08:46:33');
INSERT INTO `tb_profit` VALUES (99, 303, '20170817110170574', 9328, 9328, 0, 0, 0, 0, 0, 135, '2017-08-23 08:47:07');
INSERT INTO `tb_profit` VALUES (100, 304, '20170817110207647', 9190.2, 9190.2, 0, 0, 0, 0, 0, 135, '2017-08-23 08:47:40');
INSERT INTO `tb_profit` VALUES (101, 305, '20170817110300543', 9243.2, 9243.2, 0, 0, 0, 0, 0, 135, '2017-08-23 08:48:14');
INSERT INTO `tb_profit` VALUES (102, 306, '20170817110436052', 9073.6, 9073.6, 0, 0, 0, 0, 0, 135, '2017-08-23 08:48:51');
INSERT INTO `tb_profit` VALUES (103, 307, '20170817110614803', 9169, 9169, 0, 0, 0, 0, 0, 135, '2017-08-23 08:49:28');
INSERT INTO `tb_profit` VALUES (104, 308, '20170817110777860', 9492.3, 9492.3, 0, 0, 0, 0, 0, 135, '2017-08-23 08:50:11');
INSERT INTO `tb_profit` VALUES (105, 309, '20170817110844113', 9513.5, 9513.5, 0, 0, 0, 0, 0, 135, '2017-08-23 08:51:01');
INSERT INTO `tb_profit` VALUES (106, 310, '20170817110905688', 9222, 9222, 0, 0, 0, 0, 0, 135, '2017-08-23 08:51:39');
INSERT INTO `tb_profit` VALUES (107, 311, '20170817111170635', 9365.1, 9365.1, 0, 0, 0, 0, 0, 135, '2017-08-23 08:52:08');
INSERT INTO `tb_profit` VALUES (108, 312, '20170817111244507', 9349.2, 9349.2, 0, 0, 0, 0, 0, 135, '2017-08-23 08:52:47');
INSERT INTO `tb_profit` VALUES (109, 313, '20170817111652777', 9084.2, 9084.2, 0, 0, 0, 0, 0, 135, '2017-08-23 08:53:26');
INSERT INTO `tb_profit` VALUES (110, 314, '20170817111804521', 9349.2, 9349.2, 0, 0, 0, 0, 0, 135, '2017-08-23 08:54:34');
INSERT INTO `tb_profit` VALUES (111, 315, '20170817111928207', 9375.7, 9375.7, 0, 0, 0, 0, 0, 135, '2017-08-23 08:55:11');
INSERT INTO `tb_profit` VALUES (112, 316, '20170817112078587', 9296.2, 9296.2, 0, 0, 0, 0, 0, 135, '2017-08-23 08:55:52');
INSERT INTO `tb_profit` VALUES (113, 317, '20170817112113355', 9455.2, 9455.2, 0, 0, 0, 0, 0, 135, '2017-08-23 08:56:29');
INSERT INTO `tb_profit` VALUES (114, 318, '20170817112233815', 9100.1, 9100.1, 0, 0, 0, 0, 0, 135, '2017-08-23 08:57:12');
INSERT INTO `tb_profit` VALUES (115, 319, '20170817112336642', 9354.5, 9354.5, 0, 0, 0, 0, 0, 135, '2017-08-23 08:57:55');
INSERT INTO `tb_profit` VALUES (116, 320, '20170817112458742', 9471.1, 9471.1, 0, 0, 0, 0, 0, 135, '2017-08-23 08:58:31');
INSERT INTO `tb_profit` VALUES (117, 321, '20170817112561880', 9237.9, 9237.9, 0, 0, 0, 0, 0, 135, '2017-08-23 08:59:06');
INSERT INTO `tb_profit` VALUES (118, 322, '20170817112700863', 9232.6, 9232.6, 0, 0, 0, 0, 0, 135, '2017-08-23 08:59:35');
INSERT INTO `tb_profit` VALUES (119, 323, '20170817112884257', 9285.6, 9285.6, 0, 0, 0, 0, 0, 135, '2017-08-23 09:00:07');
INSERT INTO `tb_profit` VALUES (120, 324, '20170817112921445', 9206.1, 9206.1, 0, 0, 0, 0, 0, 135, '2017-08-23 09:00:34');
INSERT INTO `tb_profit` VALUES (121, 325, '20170817113032332', 9328, 9328, 0, 0, 0, 0, 0, 135, '2017-08-23 09:01:04');
INSERT INTO `tb_profit` VALUES (122, 327, '20170817150273740', 9264.4, 9264.4, 0, 0, 0, 0, 0, 135, '2017-08-23 09:02:02');
INSERT INTO `tb_profit` VALUES (123, 326, '20170817150102166', 9290.9, 9290.9, 0, 0, 0, 0, 0, 135, '2017-08-23 09:02:55');
INSERT INTO `tb_profit` VALUES (124, 328, '20170817150361386', 9216.7, 9216.7, 0, 0, 0, 0, 0, 135, '2017-08-23 09:03:27');
INSERT INTO `tb_profit` VALUES (125, 329, '20170817150515264', 9253.8, 9253.8, 0, 0, 0, 0, 0, 135, '2017-08-23 09:03:54');
INSERT INTO `tb_profit` VALUES (127, 330, '20170817152088688', 9328, 9328, 0, 0, 0, 0, 0, 135, '2017-08-23 09:54:57');
INSERT INTO `tb_profit` VALUES (128, 331, '20170817152106313', 9354.5, 9354.5, 0, 0, 0, 0, 0, 135, '2017-08-23 09:55:36');
INSERT INTO `tb_profit` VALUES (129, 332, '20170817152208065', 9359.8, 9359.8, 0, 0, 0, 0, 0, 135, '2017-08-23 09:56:09');
INSERT INTO `tb_profit` VALUES (130, 333, '20170817152416502', 9222, 9222, 0, 0, 0, 0, 0, 135, '2017-08-23 09:56:43');
INSERT INTO `tb_profit` VALUES (131, 334, '20170817152505286', 9237.9, 9237.9, 0, 0, 0, 0, 0, 135, '2017-08-23 09:57:16');
INSERT INTO `tb_profit` VALUES (132, 335, '20170817152734066', 9290.9, 9290.9, 0, 0, 0, 0, 0, 135, '2017-08-23 10:01:37');
INSERT INTO `tb_profit` VALUES (133, 336, '20170817152807634', 9386.3, 9386.3, 0, 0, 0, 0, 0, 135, '2017-08-23 10:02:12');
INSERT INTO `tb_profit` VALUES (134, 337, '20170817152983146', 9227.3, 9227.3, 0, 0, 0, 0, 0, 135, '2017-08-23 10:02:38');
INSERT INTO `tb_profit` VALUES (135, 338, '20170817153182366', 9084.2, 9084.2, 0, 0, 0, 0, 0, 135, '2017-08-23 10:03:19');
INSERT INTO `tb_profit` VALUES (136, 339, '20170817153288004', 9343.9, 9343.9, 0, 0, 0, 0, 0, 135, '2017-08-23 10:03:51');
INSERT INTO `tb_profit` VALUES (137, 340, '20170817153316487', 9259.1, 9259.1, 0, 0, 0, 0, 0, 135, '2017-08-23 10:04:40');
INSERT INTO `tb_profit` VALUES (138, 341, '20170817153402734', 9412.8, 9412.8, 0, 0, 0, 0, 0, 135, '2017-08-23 10:05:01');
INSERT INTO `tb_profit` VALUES (139, 342, '20170817153640766', 9349.2, 9349.2, 0, 0, 0, 0, 0, 135, '2017-08-23 10:05:59');
INSERT INTO `tb_profit` VALUES (140, 343, '20170817153788274', 9317.4, 9317.4, 0, 0, 0, 0, 0, 135, '2017-08-23 10:06:31');
INSERT INTO `tb_profit` VALUES (141, 344, '20170817153866554', 9343.9, 9343.9, 0, 0, 0, 0, 0, 135, '2017-08-23 10:07:08');
INSERT INTO `tb_profit` VALUES (142, 345, '20170817153910385', 9285.6, 9285.6, 0, 0, 0, 0, 0, 135, '2017-08-23 10:07:34');
INSERT INTO `tb_profit` VALUES (143, 346, '20170817154117278', 9248.5, 9248.5, 0, 0, 0, 0, 0, 135, '2017-08-23 10:21:10');
INSERT INTO `tb_profit` VALUES (144, 347, '20170817154383064', 9211.4, 9211.4, 0, 0, 0, 0, 0, 135, '2017-08-23 10:21:43');
INSERT INTO `tb_profit` VALUES (145, 348, '20170817154726804', 9153.1, 9153.1, 0, 0, 0, 0, 0, 135, '2017-08-23 10:22:20');
INSERT INTO `tb_profit` VALUES (146, 349, '20170817154951510', 9195.5, 9195.5, 0, 0, 0, 0, 0, 135, '2017-08-23 10:22:55');
INSERT INTO `tb_profit` VALUES (147, 350, '20170817160070355', 9253.8, 9253.8, 0, 0, 0, 0, 0, 135, '2017-08-23 10:23:26');
INSERT INTO `tb_profit` VALUES (148, 351, '20170817160181303', 9328, 9328, 0, 0, 0, 0, 0, 135, '2017-08-23 10:23:53');
INSERT INTO `tb_profit` VALUES (149, 352, '20170817160352566', 9333.3, 9333.3, 0, 0, 0, 0, 0, 135, '2017-08-23 10:24:20');
INSERT INTO `tb_profit` VALUES (150, 353, '20170817160557054', 9227.3, 9227.3, 0, 0, 0, 0, 0, 135, '2017-08-23 10:24:54');
INSERT INTO `tb_profit` VALUES (151, 354, '20170817160648152', 9338.6, 9338.6, 0, 0, 0, 0, 0, 135, '2017-08-23 10:25:25');
INSERT INTO `tb_profit` VALUES (152, 355, '20170817160754071', 9047.1, 9047.1, 0, 0, 0, 0, 0, 135, '2017-08-23 10:27:02');
INSERT INTO `tb_profit` VALUES (153, 356, '20170817160854571', 9163.7, 9163.7, 0, 0, 0, 0, 0, 135, '2017-08-23 10:27:50');
INSERT INTO `tb_profit` VALUES (154, 357, '20170817161007677', 9248.5, 9248.5, 0, 0, 0, 0, 0, 135, '2017-08-23 10:28:44');
INSERT INTO `tb_profit` VALUES (155, 358, '20170817161114265', 9312.1, 9312.1, 0, 0, 0, 0, 0, 135, '2017-08-23 10:29:41');
INSERT INTO `tb_profit` VALUES (156, 359, '20170817161204875', 9211.4, 9211.4, 0, 0, 0, 0, 0, 135, '2017-08-23 10:30:23');
INSERT INTO `tb_profit` VALUES (157, 360, '20170817161422517', 9269.7, 9269.7, 0, 0, 0, 0, 0, 135, '2017-08-23 10:31:04');
INSERT INTO `tb_profit` VALUES (158, 361, '20170818143233808', 9195.5, 9195.5, 0, 0, 0, 0, 0, 135, '2017-08-23 10:31:36');
INSERT INTO `tb_profit` VALUES (159, 362, '20170818143360221', 9200.8, 9200.8, 0, 0, 0, 0, 0, 135, '2017-08-23 10:32:03');
INSERT INTO `tb_profit` VALUES (160, 363, '20170818143480531', 9577.1, 9577.1, 0, 0, 0, 0, 0, 135, '2017-08-23 10:32:32');
INSERT INTO `tb_profit` VALUES (161, 364, '20170818143670013', 8935.8, 8935.8, 0, 0, 0, 0, 0, 135, '2017-08-23 10:33:01');
INSERT INTO `tb_profit` VALUES (162, 365, '20170818143728658', 9593, 9593, 0, 0, 0, 0, 0, 135, '2017-08-23 10:33:29');
INSERT INTO `tb_profit` VALUES (163, 366, '20170818143881544', 9052.4, 9052.4, 0, 0, 0, 0, 0, 135, '2017-08-23 10:34:03');
INSERT INTO `tb_profit` VALUES (164, 367, '20170818143932183', 9365.1, 9365.1, 0, 0, 0, 0, 0, 135, '2017-08-23 10:34:39');
INSERT INTO `tb_profit` VALUES (165, 368, '20170818144170706', 9349.2, 9349.2, 0, 0, 0, 0, 0, 135, '2017-08-23 10:35:15');
INSERT INTO `tb_profit` VALUES (166, 369, '20170818144236325', 9227.3, 9227.3, 0, 0, 0, 0, 0, 135, '2017-08-23 10:35:42');
INSERT INTO `tb_profit` VALUES (167, 370, '20170818144380528', 9322.7, 9322.7, 0, 0, 0, 0, 0, 135, '2017-08-23 10:36:10');
INSERT INTO `tb_profit` VALUES (168, 371, '20170818144401035', 9365.1, 9365.1, 0, 0, 0, 0, 0, 135, '2017-08-23 10:36:38');
INSERT INTO `tb_profit` VALUES (169, 373, '20170818144741376', 9137.2, 9137.2, 0, 0, 0, 0, 0, 135, '2017-08-23 16:07:50');
INSERT INTO `tb_profit` VALUES (170, 374, '20170818144982442', 9370.4, 9370.4, 0, 0, 0, 0, 0, 135, '2017-08-23 16:08:26');
INSERT INTO `tb_profit` VALUES (171, 375, '20170818145010387', 9434, 9434, 0, 0, 0, 0, 0, 135, '2017-08-23 16:09:11');
INSERT INTO `tb_profit` VALUES (172, 376, '20170818145178232', 9338.6, 9338.6, 0, 0, 0, 0, 0, 135, '2017-08-23 16:09:40');
INSERT INTO `tb_profit` VALUES (173, 377, '20170818145307312', 9312.1, 9312.1, 0, 0, 0, 0, 0, 135, '2017-08-23 16:10:09');
INSERT INTO `tb_profit` VALUES (174, 378, '20170818145412063', 9290.9, 9290.9, 0, 0, 0, 0, 0, 135, '2017-08-23 16:10:45');
INSERT INTO `tb_profit` VALUES (175, 379, '20170818145571615', 9349.2, 9349.2, 0, 0, 0, 0, 0, 135, '2017-08-23 16:11:16');
INSERT INTO `tb_profit` VALUES (176, 380, '20170818145666067', 9487, 9487, 0, 0, 0, 0, 0, 135, '2017-08-23 16:11:46');
INSERT INTO `tb_profit` VALUES (177, 381, '20170818145733072', 9158.4, 91584, 0, 0, 0, 0, -82425.6, 135, '2017-08-23 16:12:14');
INSERT INTO `tb_profit` VALUES (178, 382, '20170818145837253', 9328, 9328, 0, 0, 0, 0, 0, 135, '2017-08-23 16:13:05');
INSERT INTO `tb_profit` VALUES (179, 383, '20170818150022338', 9216.7, 9216.7, 0, 0, 0, 0, 0, 135, '2017-08-23 16:13:39');
INSERT INTO `tb_profit` VALUES (180, 384, '20170818150140001', 9147.8, 9147.8, 0, 0, 0, 0, 0, 135, '2017-08-23 16:14:58');
INSERT INTO `tb_profit` VALUES (181, 385, '20170818150416478', 9147.8, 9147.8, 0, 0, 0, 0, 0, 135, '2017-08-23 16:15:39');
INSERT INTO `tb_profit` VALUES (182, 386, '20170818150975001', 9227.3, 9227.3, 0, 0, 0, 0, 0, 135, '2017-08-23 16:16:29');
INSERT INTO `tb_profit` VALUES (183, 387, '20170818151058306', 9237.9, 9237.9, 0, 0, 0, 0, 0, 135, '2017-08-23 16:17:08');
INSERT INTO `tb_profit` VALUES (184, 388, '20170818151155150', 9306.8, 9306.8, 0, 0, 0, 0, 0, 135, '2017-08-23 16:17:38');
INSERT INTO `tb_profit` VALUES (185, 389, '20170818151240676', 9264.4, 9264.4, 0, 0, 0, 0, 0, 135, '2017-08-23 16:18:09');
INSERT INTO `tb_profit` VALUES (186, 390, '20170818151355015', 9200.8, 9200.8, 0, 0, 0, 0, 0, 135, '2017-08-23 16:18:41');
INSERT INTO `tb_profit` VALUES (187, 391, '20170818151452642', 9312.1, 9312.1, 0, 0, 0, 0, 0, 135, '2017-08-23 16:19:14');
INSERT INTO `tb_profit` VALUES (188, 392, '20170818151561613', 9375.7, 9375.7, 0, 0, 0, 0, 0, 135, '2017-08-23 16:20:30');
INSERT INTO `tb_profit` VALUES (189, 393, '20170818151714783', 9317.4, 9317.4, 0, 0, 0, 0, 0, 135, '2017-08-23 16:20:58');
INSERT INTO `tb_profit` VALUES (190, 394, '20170818151806135', 9328, 9328, 0, 0, 0, 0, 0, 135, '2017-08-23 16:21:41');
INSERT INTO `tb_profit` VALUES (191, 395, '20170818151947073', 9508.2, 9508.2, 0, 0, 0, 0, 0, 135, '2017-08-23 16:22:35');
INSERT INTO `tb_profit` VALUES (192, 396, '20170818152052440', 9359.8, 9359.8, 0, 0, 0, 0, 0, 135, '2017-08-23 16:23:06');
INSERT INTO `tb_profit` VALUES (193, 397, '20170818152224035', 9147.8, 9147.8, 0, 0, 0, 0, 0, 135, '2017-08-23 16:23:34');
INSERT INTO `tb_profit` VALUES (194, 398, '20170818152324131', 9131.9, 9131.9, 0, 0, 0, 0, 0, 135, '2017-08-23 16:24:07');
INSERT INTO `tb_profit` VALUES (195, 399, '20170818152413061', 9237.9, 9237.9, 0, 0, 0, 0, 0, 135, '2017-08-23 16:24:39');
INSERT INTO `tb_profit` VALUES (196, 400, '20170818152538653', 9216.7, 9216.7, 0, 0, 0, 0, 0, 135, '2017-08-23 16:25:16');
INSERT INTO `tb_profit` VALUES (197, 427, '20170819122833617', 9264.4, 9264.4, 0, 0, 0, 0, 0, 135, '2017-08-23 16:33:27');
INSERT INTO `tb_profit` VALUES (198, 426, '20170819122752041', 9322.7, 9322.7, 0, 0, 0, 0, 0, 135, '2017-08-23 16:33:57');
INSERT INTO `tb_profit` VALUES (199, 425, '20170819122662855', 9200.8, 9200.8, 0, 0, 0, 0, 0, 135, '2017-08-23 16:34:20');
INSERT INTO `tb_profit` VALUES (200, 424, '20170819122555155', 9116, 9116, 0, 0, 0, 0, 0, 135, '2017-08-23 16:34:44');
INSERT INTO `tb_profit` VALUES (201, 423, '20170819122362082', 9317.4, 9317.4, 0, 0, 0, 0, 0, 135, '2017-08-23 16:35:05');
INSERT INTO `tb_profit` VALUES (202, 422, '20170819122288511', 9349.2, 93492, 0, 0, 0, 0, -84142.8, 135, '2017-08-23 16:35:30');
INSERT INTO `tb_profit` VALUES (203, 421, '20170819122112354', 9169, 9169, 0, 0, 0, 0, 0, 135, '2017-08-23 16:35:55');
INSERT INTO `tb_profit` VALUES (204, 420, '20170819122055620', 9227.3, 9227.3, 0, 0, 0, 0, 0, 135, '2017-08-23 16:36:35');
INSERT INTO `tb_profit` VALUES (205, 419, '20170819121926228', 9593, 9593, 0, 0, 0, 0, 0, 135, '2017-08-23 16:37:19');
INSERT INTO `tb_profit` VALUES (206, 418, '20170819121816680', 9211.4, 9211.4, 0, 0, 0, 0, 0, 135, '2017-08-23 16:38:03');
INSERT INTO `tb_profit` VALUES (207, 401, '20170818152724610', 9264.4, 9264.4, 0, 0, 0, 0, 0, 135, '2017-08-23 16:45:53');
INSERT INTO `tb_profit` VALUES (208, 402, '20170818152816727', 9174.3, 9174.3, 0, 0, 0, 0, 0, 135, '2017-08-23 16:46:32');
INSERT INTO `tb_profit` VALUES (209, 403, '20170818152958700', 9359.8, 9359.8, 0, 0, 0, 0, 0, 135, '2017-08-23 16:47:02');
INSERT INTO `tb_profit` VALUES (210, 404, '20170818153117687', 9301.5, 9301.5, 0, 0, 0, 0, 0, 135, '2017-08-23 16:47:36');
INSERT INTO `tb_profit` VALUES (211, 405, '20170818153221562', 9264.4, 9264.4, 0, 0, 0, 0, 0, 135, '2017-08-23 16:48:12');
INSERT INTO `tb_profit` VALUES (212, 406, '20170818153334015', 9216.7, 9216.7, 0, 0, 0, 0, 0, 135, '2017-08-23 16:48:42');
INSERT INTO `tb_profit` VALUES (213, 407, '20170818153455572', 9566.5, 9566.5, 0, 0, 0, 0, 0, 135, '2017-08-23 16:49:26');
INSERT INTO `tb_profit` VALUES (214, 408, '20170818153581273', 9163.7, 9163.7, 0, 0, 0, 0, 0, 135, '2017-08-23 16:49:55');
INSERT INTO `tb_profit` VALUES (215, 409, '20170818153681847', 9312.1, 9312.1, 0, 0, 0, 0, 0, 135, '2017-08-23 16:50:20');
INSERT INTO `tb_profit` VALUES (216, 410, '20170818153708830', 9269.7, 9269.7, 0, 0, 0, 0, 0, 135, '2017-08-23 16:50:54');
INSERT INTO `tb_profit` VALUES (217, 411, '20170818153826871', 9465.8, 9465.8, 0, 0, 0, 0, 0, 135, '2017-08-23 16:51:14');
INSERT INTO `tb_profit` VALUES (218, 412, '20170818154070573', 9375.7, 9375.7, 0, 0, 0, 0, 0, 135, '2017-08-23 16:51:38');
INSERT INTO `tb_profit` VALUES (219, 414, '20170818154285687', 9375.7, 9375.7, 0, 0, 0, 0, 0, 135, '2017-08-23 16:52:09');
INSERT INTO `tb_profit` VALUES (220, 413, '20170818154106787', 9243.2, 9243.2, 0, 0, 0, 0, 0, 135, '2017-08-23 16:52:59');
INSERT INTO `tb_profit` VALUES (221, 415, '20170818154504132', 9365.1, 9365.1, 0, 0, 0, 0, 0, 135, '2017-08-23 16:53:38');
INSERT INTO `tb_profit` VALUES (222, 416, '20170818154648308', 9508.2, 9508.2, 0, 0, 0, 0, 0, 135, '2017-08-23 16:54:16');
INSERT INTO `tb_profit` VALUES (240, 453, '20170824092807763', 9153, 9153, 0, 0, 0, 0, 0, 135, '2017-08-24 10:26:17');
INSERT INTO `tb_profit` VALUES (241, 454, '20170824092975374', 9153, 9153, 0, 0, 0, 0, 0, 135, '2017-08-24 10:26:55');
INSERT INTO `tb_profit` VALUES (242, 455, '20170824093088734', 9218, 9218, 0, 0, 0, 0, 0, 135, '2017-08-24 10:27:42');
INSERT INTO `tb_profit` VALUES (243, 456, '20170824093120271', 10530, 10530, 0, 0, 0, 0, 0, 135, '2017-08-24 10:28:12');
INSERT INTO `tb_profit` VALUES (244, 457, '20170824094774884', 9391, 9391, 0, 0, 0, 0, 0, 135, '2017-08-24 10:28:48');
INSERT INTO `tb_profit` VALUES (259, 473, '20170921161327757', 200, 200, 0, 0, 0, 1, 0, 129, '2018-08-16 09:12:40');
INSERT INTO `tb_profit` VALUES (260, 472, '20170921161201886', 1, 1, 0, 0, 0, 0, 0, 261, '2018-12-23 01:45:30');
COMMIT;

-- ----------------------------
-- Table structure for tb_profit_status
-- ----------------------------
DROP TABLE IF EXISTS `tb_profit_status`;
CREATE TABLE `tb_profit_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_profit_id` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL COMMENT 'pay或者recive',
  `value` float DEFAULT NULL COMMENT '收款或者付款的钱',
  `time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '操作的时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tb_sms
-- ----------------------------
DROP TABLE IF EXISTS `tb_sms`;
CREATE TABLE `tb_sms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(6) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `cookie` varchar(16) NOT NULL,
  `code_type_id` int(11) NOT NULL,
  `sendtime` datetime NOT NULL,
  `subtime` datetime DEFAULT NULL,
  `is_submit` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_sms
-- ----------------------------
BEGIN;
INSERT INTO `tb_sms` VALUES (108, '0532', '18949821385', 'fa096f8e3336cd95', 1, '2017-07-23 13:36:29', '2017-07-23 13:37:06', 1);
INSERT INTO `tb_sms` VALUES (109, '6145', '18949821385', '3e59ee839b75ca7b', 1, '2017-07-23 13:46:56', '2017-07-23 13:47:19', 1);
INSERT INTO `tb_sms` VALUES (110, '1486', '18949821385', '1fbbea186a24a6fc', 1, '2017-07-23 14:43:22', NULL, 0);
INSERT INTO `tb_sms` VALUES (111, '5706', '18949821385', 'ab2ca358308b0299', 0, '2017-08-28 13:32:18', '2017-08-28 13:32:33', 1);
INSERT INTO `tb_sms` VALUES (112, '7524', '18949821385', '3a5b3c3d0aefa7db', 0, '2017-08-28 13:51:23', NULL, 0);
INSERT INTO `tb_sms` VALUES (113, '7371', '18949821385', 'b3fdd8e1b24ddef4', 0, '2017-08-28 13:56:51', NULL, 0);
INSERT INTO `tb_sms` VALUES (114, '7387', '18949821385', '1fd8a33581dfbd6e', 0, '2017-08-28 14:01:01', NULL, 0);
INSERT INTO `tb_sms` VALUES (115, '8312', '18656096638', '46116454993c1ca4', 0, '2018-11-21 22:50:23', NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for tb_sms_type
-- ----------------------------
DROP TABLE IF EXISTS `tb_sms_type`;
CREATE TABLE `tb_sms_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `type` varchar(50) NOT NULL,
  `template_id` varchar(50) DEFAULT NULL,
  `message` varchar(200) NOT NULL,
  `values` varchar(200) DEFAULT NULL,
  `signame` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_sms_type
-- ----------------------------
BEGIN;
INSERT INTO `tb_sms_type` VALUES (1, '注册', '001', 'SMS_25500022', 'name', '物流APP', '爱依特');
INSERT INTO `tb_sms_type` VALUES (2, '登录', '002', 'SMS_36075262', 'name', '物流APP', '爱依特');
INSERT INTO `tb_sms_type` VALUES (3, '重置密码', '003', 'SMS_36020201', 'name', '物流APP', '爱依特');
COMMIT;

-- ----------------------------
-- Table structure for tb_system_config
-- ----------------------------
DROP TABLE IF EXISTS `tb_system_config`;
CREATE TABLE `tb_system_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `code` varchar(50) DEFAULT NULL COMMENT '编码',
  `value` varchar(255) DEFAULT NULL COMMENT '值',
  `belong_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8 COMMENT='系统配置表';

-- ----------------------------
-- Records of tb_system_config
-- ----------------------------
BEGIN;
INSERT INTO `tb_system_config` VALUES (1, '公司名称', 'company', ' 安徽中钢国泰物流有限公司', 127);
INSERT INTO `tb_system_config` VALUES (2, '公司银行户名', 'company_bank_name', ' 安徽中钢国泰物流有限公司', 127);
INSERT INTO `tb_system_config` VALUES (3, '公司银行账号', 'company_bank_number', '62177513415463132130', 127);
INSERT INTO `tb_system_config` VALUES (4, '公司开户行', 'company_bank', ' 徽商银行支行', 127);
INSERT INTO `tb_system_config` VALUES (5, '公司名称', 'company', '', 129);
INSERT INTO `tb_system_config` VALUES (6, '公司银行户名', 'company_bank_name', '', 129);
INSERT INTO `tb_system_config` VALUES (7, '公司银行账号', 'company_bank_number', '', 129);
INSERT INTO `tb_system_config` VALUES (8, '公司银行', 'company_bank', '', 129);
INSERT INTO `tb_system_config` VALUES (9, '公司银行行点', 'company_bank_addr', '', 129);
INSERT INTO `tb_system_config` VALUES (10, '公司名称', 'company', '', 133);
INSERT INTO `tb_system_config` VALUES (11, '公司银行户名', 'company_bank_name', '', 133);
INSERT INTO `tb_system_config` VALUES (12, '公司银行账号', 'company_bank_number', '', 133);
INSERT INTO `tb_system_config` VALUES (13, '公司银行', 'company_bank', '', 133);
INSERT INTO `tb_system_config` VALUES (14, '公司银行行点', 'company_bank_addr', '', 133);
INSERT INTO `tb_system_config` VALUES (15, '公司名称', 'company', '', 134);
INSERT INTO `tb_system_config` VALUES (16, '公司银行户名', 'company_bank_name', '', 134);
INSERT INTO `tb_system_config` VALUES (17, '公司银行账号', 'company_bank_number', '', 134);
INSERT INTO `tb_system_config` VALUES (18, '公司银行', 'company_bank', '', 134);
INSERT INTO `tb_system_config` VALUES (19, '公司银行行点', 'company_bank_addr', '', 134);
INSERT INTO `tb_system_config` VALUES (20, '公司名称', 'company', '', 135);
INSERT INTO `tb_system_config` VALUES (21, '公司银行户名', 'company_bank_name', '', 135);
INSERT INTO `tb_system_config` VALUES (22, '公司银行账号', 'company_bank_number', '', 135);
INSERT INTO `tb_system_config` VALUES (23, '公司银行', 'company_bank', '', 135);
INSERT INTO `tb_system_config` VALUES (24, '公司银行行点', 'company_bank_addr', '', 135);
INSERT INTO `tb_system_config` VALUES (25, '公司名称', 'company', '', 250);
INSERT INTO `tb_system_config` VALUES (26, '公司银行户名', 'company_bank_name', '', 250);
INSERT INTO `tb_system_config` VALUES (27, '公司银行账号', 'company_bank_number', '', 250);
INSERT INTO `tb_system_config` VALUES (28, '公司银行', 'company_bank', '', 250);
INSERT INTO `tb_system_config` VALUES (29, '公司银行行点', 'company_bank_addr', '', 250);
INSERT INTO `tb_system_config` VALUES (30, '公司名称', 'company', '', 251);
INSERT INTO `tb_system_config` VALUES (31, '公司银行户名', 'company_bank_name', '', 251);
INSERT INTO `tb_system_config` VALUES (32, '公司银行账号', 'company_bank_number', '', 251);
INSERT INTO `tb_system_config` VALUES (33, '公司银行', 'company_bank', '', 251);
INSERT INTO `tb_system_config` VALUES (34, '公司银行行点', 'company_bank_addr', '', 251);
INSERT INTO `tb_system_config` VALUES (35, '公司名称', 'company', '', 253);
INSERT INTO `tb_system_config` VALUES (36, '公司银行户名', 'company_bank_name', '', 253);
INSERT INTO `tb_system_config` VALUES (37, '公司银行账号', 'company_bank_number', '', 253);
INSERT INTO `tb_system_config` VALUES (38, '公司银行', 'company_bank', '', 253);
INSERT INTO `tb_system_config` VALUES (39, '公司银行行点', 'company_bank_addr', '', 253);
INSERT INTO `tb_system_config` VALUES (40, '公司名称', 'company', '', 255);
INSERT INTO `tb_system_config` VALUES (41, '公司银行户名', 'company_bank_name', '', 255);
INSERT INTO `tb_system_config` VALUES (42, '公司银行账号', 'company_bank_number', '', 255);
INSERT INTO `tb_system_config` VALUES (43, '公司银行', 'company_bank', '', 255);
INSERT INTO `tb_system_config` VALUES (44, '公司银行行点', 'company_bank_addr', '', 255);
INSERT INTO `tb_system_config` VALUES (45, '公司名称', 'company', '', 256);
INSERT INTO `tb_system_config` VALUES (46, '公司银行户名', 'company_bank_name', '', 256);
INSERT INTO `tb_system_config` VALUES (47, '公司银行账号', 'company_bank_number', '', 256);
INSERT INTO `tb_system_config` VALUES (48, '公司银行', 'company_bank', '', 256);
INSERT INTO `tb_system_config` VALUES (49, '公司银行行点', 'company_bank_addr', '', 256);
INSERT INTO `tb_system_config` VALUES (50, '公司名称', 'company', '', 257);
INSERT INTO `tb_system_config` VALUES (51, '公司银行户名', 'company_bank_name', '', 257);
INSERT INTO `tb_system_config` VALUES (52, '公司银行账号', 'company_bank_number', '', 257);
INSERT INTO `tb_system_config` VALUES (53, '公司银行', 'company_bank', '', 257);
INSERT INTO `tb_system_config` VALUES (54, '公司银行行点', 'company_bank_addr', '', 257);
INSERT INTO `tb_system_config` VALUES (55, '公司名称', 'company', '', 258);
INSERT INTO `tb_system_config` VALUES (56, '公司银行户名', 'company_bank_name', '', 258);
INSERT INTO `tb_system_config` VALUES (57, '公司银行账号', 'company_bank_number', '', 258);
INSERT INTO `tb_system_config` VALUES (58, '公司银行', 'company_bank', '', 258);
INSERT INTO `tb_system_config` VALUES (59, '公司银行行点', 'company_bank_addr', '', 258);
INSERT INTO `tb_system_config` VALUES (60, '公司名称', 'company', '', 259);
INSERT INTO `tb_system_config` VALUES (61, '公司银行户名', 'company_bank_name', '', 259);
INSERT INTO `tb_system_config` VALUES (62, '公司银行账号', 'company_bank_number', '', 259);
INSERT INTO `tb_system_config` VALUES (63, '公司银行', 'company_bank', '', 259);
INSERT INTO `tb_system_config` VALUES (64, '公司银行行点', 'company_bank_addr', '', 259);
INSERT INTO `tb_system_config` VALUES (65, '公司名称', 'company', '', 260);
INSERT INTO `tb_system_config` VALUES (66, '公司银行户名', 'company_bank_name', '', 260);
INSERT INTO `tb_system_config` VALUES (67, '公司银行账号', 'company_bank_number', '', 260);
INSERT INTO `tb_system_config` VALUES (68, '公司银行', 'company_bank', '', 260);
INSERT INTO `tb_system_config` VALUES (69, '公司银行行点', 'company_bank_addr', '', 260);
INSERT INTO `tb_system_config` VALUES (70, '公司名称', 'company', '琳琳国际护理', 261);
INSERT INTO `tb_system_config` VALUES (71, '公司银行户名', 'company_bank_name', '琳琳', 261);
INSERT INTO `tb_system_config` VALUES (72, '公司银行账号', 'company_bank_number', '612332786445391823', 261);
INSERT INTO `tb_system_config` VALUES (73, '公司银行', 'company_bank', '建行', 261);
INSERT INTO `tb_system_config` VALUES (74, '公司银行行点', 'company_bank_addr', '广州', 261);
COMMIT;

-- ----------------------------
-- Table structure for tb_system_defind
-- ----------------------------
DROP TABLE IF EXISTS `tb_system_defind`;
CREATE TABLE `tb_system_defind` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `type_code` varchar(255) DEFAULT NULL COMMENT '系统配置的类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8 COMMENT='系统所有标准菜单定义';

-- ----------------------------
-- Records of tb_system_defind
-- ----------------------------
BEGIN;
INSERT INTO `tb_system_defind` VALUES (13, '平板车', 'car_type');
INSERT INTO `tb_system_defind` VALUES (14, '爬梯车', 'car_type');
INSERT INTO `tb_system_defind` VALUES (15, '栏板车', 'car_type');
INSERT INTO `tb_system_defind` VALUES (16, '自卸车', 'car_type');
INSERT INTO `tb_system_defind` VALUES (17, '高栏车', 'car_type');
INSERT INTO `tb_system_defind` VALUES (18, '厢式货车', 'car_type');
INSERT INTO `tb_system_defind` VALUES (19, '集装箱车', 'car_type');
INSERT INTO `tb_system_defind` VALUES (20, '飞翼车', 'car_type');
INSERT INTO `tb_system_defind` VALUES (21, '保温车', 'car_type');
INSERT INTO `tb_system_defind` VALUES (22, '冷藏车', 'car_type');
INSERT INTO `tb_system_defind` VALUES (23, '罐车', 'car_type');
INSERT INTO `tb_system_defind` VALUES (24, '工程车', 'car_type');
INSERT INTO `tb_system_defind` VALUES (25, '面包车', 'car_type');
INSERT INTO `tb_system_defind` VALUES (26, '其他', 'car_type');
INSERT INTO `tb_system_defind` VALUES (27, '汽油', 'car_energy');
INSERT INTO `tb_system_defind` VALUES (28, '柴油', 'car_energy');
INSERT INTO `tb_system_defind` VALUES (29, '天然气', 'car_energy');
INSERT INTO `tb_system_defind` VALUES (30, '油电混合', 'car_energy');
INSERT INTO `tb_system_defind` VALUES (31, '电动', 'car_energy');
INSERT INTO `tb_system_defind` VALUES (32, '3.0米', 'car_lenth');
INSERT INTO `tb_system_defind` VALUES (33, '3.6米', 'car_lenth');
INSERT INTO `tb_system_defind` VALUES (34, '4.0米', 'car_lenth');
INSERT INTO `tb_system_defind` VALUES (35, '4.2米', 'car_lenth');
INSERT INTO `tb_system_defind` VALUES (36, '4.8米', 'car_lenth');
INSERT INTO `tb_system_defind` VALUES (37, '5.0米', 'car_lenth');
INSERT INTO `tb_system_defind` VALUES (38, '5.2米', 'car_lenth');
INSERT INTO `tb_system_defind` VALUES (39, '5.8米', 'car_lenth');
INSERT INTO `tb_system_defind` VALUES (40, '6.2米', 'car_lenth');
INSERT INTO `tb_system_defind` VALUES (41, '6.5米', 'car_lenth');
INSERT INTO `tb_system_defind` VALUES (42, '6.8米', 'car_lenth');
INSERT INTO `tb_system_defind` VALUES (43, '7.2米', 'car_lenth');
INSERT INTO `tb_system_defind` VALUES (44, '7.6米', 'car_lenth');
INSERT INTO `tb_system_defind` VALUES (45, '7.8米', 'car_lenth');
INSERT INTO `tb_system_defind` VALUES (46, '8.0米', 'car_lenth');
INSERT INTO `tb_system_defind` VALUES (47, '8.2米', 'car_lenth');
INSERT INTO `tb_system_defind` VALUES (48, '8.6米', 'car_lenth');
INSERT INTO `tb_system_defind` VALUES (49, '8.8米', 'car_lenth');
INSERT INTO `tb_system_defind` VALUES (50, '9.6米', 'car_lenth');
INSERT INTO `tb_system_defind` VALUES (51, '10.0米', 'car_lenth');
INSERT INTO `tb_system_defind` VALUES (52, '10.5米', 'car_lenth');
INSERT INTO `tb_system_defind` VALUES (53, '10.8米', 'car_lenth');
INSERT INTO `tb_system_defind` VALUES (54, '上汽依维柯红岩', 'car_brand');
INSERT INTO `tb_system_defind` VALUES (55, '斯太尔', 'car_brand');
INSERT INTO `tb_system_defind` VALUES (56, '中国重汽', 'car_brand');
INSERT INTO `tb_system_defind` VALUES (57, '江淮', 'car_brand');
INSERT INTO `tb_system_defind` VALUES (58, '一汽解放', 'car_brand');
INSERT INTO `tb_system_defind` VALUES (59, '东风', 'car_brand');
INSERT INTO `tb_system_defind` VALUES (60, '红岩', 'car_brand');
INSERT INTO `tb_system_defind` VALUES (61, '欧曼', 'car_brand');
INSERT INTO `tb_system_defind` VALUES (62, '康明斯', 'car_brand');
INSERT INTO `tb_system_defind` VALUES (63, '解放', 'car_brand');
INSERT INTO `tb_system_defind` VALUES (64, '乘龙', 'car_brand');
INSERT INTO `tb_system_defind` VALUES (65, '行驶证', 'car_license_type');
INSERT INTO `tb_system_defind` VALUES (66, '营业执照', 'car_license_type');
INSERT INTO `tb_system_defind` VALUES (67, '道路运输证', 'car_license_type');
INSERT INTO `tb_system_defind` VALUES (68, '其他', 'car_license_type');
INSERT INTO `tb_system_defind` VALUES (69, 'A1', 'driver_level');
INSERT INTO `tb_system_defind` VALUES (70, 'A2', 'driver_level');
INSERT INTO `tb_system_defind` VALUES (71, 'A3', 'driver_level');
INSERT INTO `tb_system_defind` VALUES (72, 'B1', 'driver_level');
INSERT INTO `tb_system_defind` VALUES (73, 'B2', 'driver_level');
INSERT INTO `tb_system_defind` VALUES (74, 'C1', 'driver_level');
INSERT INTO `tb_system_defind` VALUES (75, 'C2', 'driver_level');
INSERT INTO `tb_system_defind` VALUES (76, 'C3', 'driver_level');
INSERT INTO `tb_system_defind` VALUES (77, 'C4', 'driver_level');
INSERT INTO `tb_system_defind` VALUES (78, 'D', 'driver_level');
INSERT INTO `tb_system_defind` VALUES (79, 'E', 'driver_level');
INSERT INTO `tb_system_defind` VALUES (80, 'F', 'driver_level');
INSERT INTO `tb_system_defind` VALUES (81, 'M', 'driver_level');
INSERT INTO `tb_system_defind` VALUES (82, 'N', 'driver_level');
INSERT INTO `tb_system_defind` VALUES (83, 'P', 'driver_level');
INSERT INTO `tb_system_defind` VALUES (84, '押运员证', 'driver_license_type');
INSERT INTO `tb_system_defind` VALUES (85, '从业资格证', 'driver_license_type');
INSERT INTO `tb_system_defind` VALUES (86, '司机其他', 'driver_license_type');
INSERT INTO `tb_system_defind` VALUES (87, '11.0米', 'car_lenth');
INSERT INTO `tb_system_defind` VALUES (88, '中国银行', 'bank_list');
INSERT INTO `tb_system_defind` VALUES (89, '招商银行', 'bank_list');
INSERT INTO `tb_system_defind` VALUES (90, '工商银行', 'bank_list');
INSERT INTO `tb_system_defind` VALUES (91, '建设银行\r\n', 'bank_list');
INSERT INTO `tb_system_defind` VALUES (92, '浦发银行（上海浦东发展银行）\r\n', 'bank_list');
INSERT INTO `tb_system_defind` VALUES (93, '农业银行\r\n', 'bank_list');
INSERT INTO `tb_system_defind` VALUES (94, '民生银行\r\n', 'bank_list');
INSERT INTO `tb_system_defind` VALUES (95, '深圳发展银行\r\n', 'bank_list');
INSERT INTO `tb_system_defind` VALUES (96, '兴业银行\r\n', 'bank_list');
INSERT INTO `tb_system_defind` VALUES (97, '交通银行\r\n', 'bank_list');
INSERT INTO `tb_system_defind` VALUES (98, '光大银行\r\n', 'bank_list');
INSERT INTO `tb_system_defind` VALUES (99, '广州银联\r\n', 'bank_list');
INSERT INTO `tb_system_defind` VALUES (100, '北京银行\r\n', 'bank_list');
INSERT INTO `tb_system_defind` VALUES (101, 'BEA东亚银行\r\n', 'bank_list');
INSERT INTO `tb_system_defind` VALUES (102, '渤海银行\r\n', 'bank_list');
INSERT INTO `tb_system_defind` VALUES (103, '平安银行\r\n', 'bank_list');
INSERT INTO `tb_system_defind` VALUES (104, '广发银行（广东发展银行）\r\n', 'bank_list');
INSERT INTO `tb_system_defind` VALUES (105, '上海农商银行\r\n', 'bank_list');
INSERT INTO `tb_system_defind` VALUES (106, '邮政储蓄银行\r\n', 'bank_list');
INSERT INTO `tb_system_defind` VALUES (107, '中信银行\r\n', 'bank_list');
INSERT INTO `tb_system_defind` VALUES (108, '杭州银行\r\n', 'bank_list');
INSERT INTO `tb_system_defind` VALUES (109, '徽商银行\r\n', 'bank_list');
INSERT INTO `tb_system_defind` VALUES (110, '南京银行\r\n', 'bank_list');
INSERT INTO `tb_system_defind` VALUES (111, '浙商银行\r\n', 'bank_list');
INSERT INTO `tb_system_defind` VALUES (112, '晋城银行\r\n', 'bank_list');
INSERT INTO `tb_system_defind` VALUES (113, '宁波银行\r\n', 'bank_list');
INSERT INTO `tb_system_defind` VALUES (114, '日照银行\r\n', 'bank_list');
INSERT INTO `tb_system_defind` VALUES (115, '河北银行\r\n', 'bank_list');
INSERT INTO `tb_system_defind` VALUES (116, '湖南省农村信用社联合社\r\n', 'bank_list');
INSERT INTO `tb_system_defind` VALUES (117, '华夏银行\r\n', 'bank_list');
INSERT INTO `tb_system_defind` VALUES (118, '威海市商业银行\r\n', 'bank_list');
COMMIT;

-- ----------------------------
-- Table structure for tb_system_defind_type
-- ----------------------------
DROP TABLE IF EXISTS `tb_system_defind_type`;
CREATE TABLE `tb_system_defind_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='系统所有标准菜单的类型';

-- ----------------------------
-- Records of tb_system_defind_type
-- ----------------------------
BEGIN;
INSERT INTO `tb_system_defind_type` VALUES (1, '车辆类型', 'car_type');
INSERT INTO `tb_system_defind_type` VALUES (2, '能耗类型', 'car_energy');
INSERT INTO `tb_system_defind_type` VALUES (3, '车辆长度', 'car_lenth');
INSERT INTO `tb_system_defind_type` VALUES (4, '车辆品牌', 'car_brand');
INSERT INTO `tb_system_defind_type` VALUES (5, '驾驶证等级', 'driver_level');
INSERT INTO `tb_system_defind_type` VALUES (6, '驾驶证件类型', 'driver_license_type');
INSERT INTO `tb_system_defind_type` VALUES (7, '车辆证件类型', 'car_license_type');
INSERT INTO `tb_system_defind_type` VALUES (8, '开户行', 'bank_list');
COMMIT;

-- ----------------------------
-- Table structure for tb_system_version
-- ----------------------------
DROP TABLE IF EXISTS `tb_system_version`;
CREATE TABLE `tb_system_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(100) DEFAULT '' COMMENT '类型',
  `version` varchar(255) DEFAULT NULL COMMENT '版本名称',
  `version_number` int(11) DEFAULT NULL COMMENT '版本号',
  `changelog` text COMMENT '更新记录',
  `url` varchar(255) DEFAULT NULL COMMENT '下载地址',
  `time` datetime DEFAULT NULL COMMENT '上传时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_system_version
-- ----------------------------
BEGIN;
INSERT INTO `tb_system_version` VALUES (1, 'customer_android', '1.1', 1, '1. 日程提供拒绝和接受的功能；\r\n2. OKR 提供保存草稿的功能；\r\n3. OKR 提供预设打分规则的功能；\r\n4. OKR 可以对目标的关键结果设置权重；\r\n5. OKR 数量限制的功能；\r\n6. OKR 全部目标提供排序功能；\r\n7. OKR 运营报告提供筛选功能；\r\n8. 审批新增查阅记录的功能；\r\n9. 审批提供分组的功能；\r\n10. 去除成员属于多个部门的逻辑，企业成员只能直属于一个部门。', NULL, '2017-09-21 09:53:47');
INSERT INTO `tb_system_version` VALUES (3, 'customer_android', '1.2', 2, '', 'http://otj3hc8no.bkt.clouddn.com/lhiSkJFNSA08DhSdYPRTcWkrlFtN', '2017-09-21 11:03:00');
COMMIT;

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `password` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL COMMENT '账户类型admin/customer/driver',
  `regtime` datetime NOT NULL,
  `is_disable` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否被禁用',
  `is_valid` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否存在',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=264 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
BEGIN;
INSERT INTO `tb_user` VALUES (1, 'admin', '18949821385', '123456', 'admin', '2017-07-17 01:26:36', 0, 1);
INSERT INTO `tb_user` VALUES (2, 'xiaochai', '18949821385', '123456', 'admin', '2017-07-26 09:44:13', 0, 1);
INSERT INTO `tb_user` VALUES (127, 'linlin', '', '123456', 'company', '2017-08-04 07:21:23', 0, 0);
INSERT INTO `tb_user` VALUES (128, 'xiaosu', NULL, '123456', 'admin', '2017-08-04 15:22:01', 0, 0);
INSERT INTO `tb_user` VALUES (129, 'kenny', '', '4811298', 'company', '2017-08-06 12:30:33', 0, 0);
INSERT INTO `tb_user` VALUES (130, '18949821385', '18949821385', '123123', 'driver', '2017-08-06 12:31:19', 0, 0);
INSERT INTO `tb_user` VALUES (131, '18949821385', '18949821385', '123123', 'driver', '2017-08-06 12:32:00', 0, 1);
INSERT INTO `tb_user` VALUES (132, '18656301000', '18656301000', '123456', 'driver', '2017-08-07 02:32:30', 0, 0);
INSERT INTO `tb_user` VALUES (133, 'ngzw', '', '123456', 'company', '2017-08-09 10:01:08', 0, 0);
INSERT INTO `tb_user` VALUES (134, '蓝云', '', '123456', 'company', '2017-08-10 10:39:02', 0, 0);
INSERT INTO `tb_user` VALUES (135, '中钢国泰', '', '123456', 'company', '2017-08-10 17:05:37', 0, 0);
INSERT INTO `tb_user` VALUES (136, '12879784544', '12879784544', '123456', 'driver', '2017-08-11 14:59:30', 0, 1);
INSERT INTO `tb_user` VALUES (137, '18949821366', '18949821366', '123456', 'driver', '2017-08-11 16:44:52', 0, 1);
INSERT INTO `tb_user` VALUES (138, '13831257926', '13831257926', '123456', 'driver', '2017-08-22 09:56:03', 0, 1);
INSERT INTO `tb_user` VALUES (139, '17332221222', '17332221222', '123456', 'driver', '2017-08-22 11:48:21', 0, 1);
INSERT INTO `tb_user` VALUES (140, '13603126156', '13603126156', '123456', 'driver', '2017-08-22 11:48:55', 0, 0);
INSERT INTO `tb_user` VALUES (141, '15033215688', '15033215688', '123456', 'driver', '2017-08-22 14:27:52', 0, 1);
INSERT INTO `tb_user` VALUES (142, '13831285448', '13831285448', '123456', 'driver', '2017-08-22 14:28:20', 0, 1);
INSERT INTO `tb_user` VALUES (143, '17325287692', '17325287692', '123456', 'driver', '2017-08-22 14:28:43', 0, 1);
INSERT INTO `tb_user` VALUES (144, '13731271833', '13731271833', '123456', 'driver', '2017-08-22 14:29:03', 0, 1);
INSERT INTO `tb_user` VALUES (145, '17360738886', '17360738886', '123456', 'driver', '2017-08-22 14:29:26', 0, 1);
INSERT INTO `tb_user` VALUES (146, '17325287861', '17325287861', '123456', 'driver', '2017-08-22 14:29:46', 0, 1);
INSERT INTO `tb_user` VALUES (147, '13400331196', '13400331196', '123456', 'driver', '2017-08-22 14:30:10', 0, 1);
INSERT INTO `tb_user` VALUES (148, '17325215686', '17325215686', '123456', 'driver', '2017-08-22 14:30:45', 0, 1);
INSERT INTO `tb_user` VALUES (149, '18630298513', '18630298513', '123456', 'driver', '2017-08-22 14:31:29', 0, 1);
INSERT INTO `tb_user` VALUES (150, '17713222610', '17713222610', '123456', 'driver', '2017-08-22 14:31:48', 0, 1);
INSERT INTO `tb_user` VALUES (151, '13930844523', '13930844523', '123456', 'driver', '2017-08-22 14:32:44', 0, 1);
INSERT INTO `tb_user` VALUES (152, '13822282819', '13822282819', '123456', 'driver', '2017-08-22 14:33:32', 0, 1);
INSERT INTO `tb_user` VALUES (153, '13613326482', '13613326482', '123456', 'driver', '2017-08-22 14:39:08', 0, 1);
INSERT INTO `tb_user` VALUES (154, '13603126156', '13603126156', '123456', 'driver', '2017-08-22 16:16:05', 0, 1);
INSERT INTO `tb_user` VALUES (155, '13930213296', '13930213296', '123456', 'driver', '2017-08-22 16:16:54', 0, 1);
INSERT INTO `tb_user` VALUES (156, '13931375622', '13931375622', '123456', 'driver', '2017-08-22 16:17:35', 0, 1);
INSERT INTO `tb_user` VALUES (157, '13315936159', '13315936159', '123456', 'driver', '2017-08-22 16:18:15', 0, 1);
INSERT INTO `tb_user` VALUES (158, '18132922815', '18132922815', '123456', 'driver', '2017-08-22 16:18:56', 0, 1);
INSERT INTO `tb_user` VALUES (159, '18733963206', '18733963206', '123456', 'driver', '2017-08-22 16:19:27', 0, 1);
INSERT INTO `tb_user` VALUES (160, '13785242163', '13785242163', '123456', 'driver', '2017-08-22 16:19:57', 0, 1);
INSERT INTO `tb_user` VALUES (161, '15631233868', '15631233868', '123456', 'driver', '2017-08-22 16:20:25', 0, 1);
INSERT INTO `tb_user` VALUES (162, '18203195900', '18203195900', '123456', 'driver', '2017-08-22 16:21:05', 0, 1);
INSERT INTO `tb_user` VALUES (163, '15803121538', '15803121538', '123456', 'driver', '2017-08-22 16:21:30', 0, 1);
INSERT INTO `tb_user` VALUES (164, '13483245626', '13483245626', '123456', 'driver', '2017-08-22 16:22:19', 0, 1);
INSERT INTO `tb_user` VALUES (165, '15832232149', '15832232149', '123456', 'driver', '2017-08-22 16:22:38', 0, 1);
INSERT INTO `tb_user` VALUES (166, '13931390872', '13931390872', '123456', 'driver', '2017-08-22 16:23:02', 0, 1);
INSERT INTO `tb_user` VALUES (167, '13582230780', '13582230780', '123456', 'driver', '2017-08-22 16:23:31', 0, 1);
INSERT INTO `tb_user` VALUES (168, '13833230532', '13833230532', '123456', 'driver', '2017-08-22 16:23:51', 0, 1);
INSERT INTO `tb_user` VALUES (169, '13399229771', '13399229771', '123456', 'driver', '2017-08-22 16:24:32', 0, 1);
INSERT INTO `tb_user` VALUES (170, '17717708097', '17717708097', '123456', 'driver', '2017-08-22 16:24:52', 0, 1);
INSERT INTO `tb_user` VALUES (171, '15833864626', '15833864626', '123456', 'driver', '2017-08-22 16:25:28', 0, 1);
INSERT INTO `tb_user` VALUES (172, '15303122829', '15303122829', '123456', 'driver', '2017-08-22 17:39:00', 0, 1);
INSERT INTO `tb_user` VALUES (173, '13832260253', '13832260253', '123456', 'driver', '2017-08-22 17:47:25', 0, 1);
INSERT INTO `tb_user` VALUES (174, '13831209386', '13831209386', '123456', 'driver', '2017-08-22 17:48:16', 0, 1);
INSERT INTO `tb_user` VALUES (175, '17830201170', '17830201170', '123456', 'driver', '2017-08-22 17:48:51', 0, 0);
INSERT INTO `tb_user` VALUES (176, '17831020170', '17831020170', '123456', 'driver', '2017-08-22 17:49:37', 0, 1);
INSERT INTO `tb_user` VALUES (177, '13803230376', '13803230376', '123456', 'driver', '2017-08-22 17:49:59', 0, 1);
INSERT INTO `tb_user` VALUES (178, '15930210101', '15930210101', '123456', 'driver', '2017-08-22 17:50:44', 0, 1);
INSERT INTO `tb_user` VALUES (179, '13833484571', '13833484571', '123456', 'driver', '2017-08-22 17:51:22', 0, 1);
INSERT INTO `tb_user` VALUES (180, '15176291333', '15176291333', '123456', 'driver', '2017-08-22 18:15:18', 0, 1);
INSERT INTO `tb_user` VALUES (181, '18931961558', '18931961558', '123456', 'driver', '2017-08-22 18:16:02', 0, 1);
INSERT INTO `tb_user` VALUES (182, '17758838281', '17758838281', '123456', 'driver', '2017-08-23 08:26:06', 0, 1);
INSERT INTO `tb_user` VALUES (183, '15032736979', '15032736979', '123456', 'driver', '2017-08-23 08:26:29', 0, 1);
INSERT INTO `tb_user` VALUES (184, '18032120318', '18032120318', '123456', 'driver', '2017-08-23 08:26:47', 0, 1);
INSERT INTO `tb_user` VALUES (185, '15830977569', '15830977569', '123456', 'driver', '2017-08-23 08:27:47', 0, 1);
INSERT INTO `tb_user` VALUES (186, '18131105689', '18131105689', '123456', 'driver', '2017-08-23 08:28:18', 0, 1);
INSERT INTO `tb_user` VALUES (187, '15350595382', '15350595382', '123456', 'driver', '2017-08-23 08:28:39', 0, 1);
INSERT INTO `tb_user` VALUES (188, '13733214704', '13733214704', '123456', 'driver', '2017-08-23 08:29:05', 0, 1);
INSERT INTO `tb_user` VALUES (189, '15075410519', '15075410519', '123456', 'driver', '2017-08-23 08:29:25', 0, 1);
INSERT INTO `tb_user` VALUES (190, '15131678666', '15131678666', '123456', 'driver', '2017-08-23 08:29:49', 0, 1);
INSERT INTO `tb_user` VALUES (191, '18232176166', '18232176166', '123456', 'driver', '2017-08-23 08:46:01', 0, 1);
INSERT INTO `tb_user` VALUES (192, '15930184998', '15930184998', '123456', 'driver', '2017-08-23 09:47:29', 0, 1);
INSERT INTO `tb_user` VALUES (193, '13784334457', '13784334457', '123456', 'driver', '2017-08-23 09:47:53', 0, 1);
INSERT INTO `tb_user` VALUES (194, '18733161255', '18733161255', '123456', 'driver', '2017-08-23 09:48:46', 0, 1);
INSERT INTO `tb_user` VALUES (195, '13930462698', '13930462698', '123456', 'driver', '2017-08-23 09:49:20', 0, 1);
INSERT INTO `tb_user` VALUES (196, '15128246488', '15128246488', '123456', 'driver', '2017-08-23 09:49:36', 0, 1);
INSERT INTO `tb_user` VALUES (197, '13832122919', '13832122919', '123456', 'driver', '2017-08-23 09:50:53', 0, 1);
INSERT INTO `tb_user` VALUES (198, '13733323581', '13733323581', '123456', 'driver', '2017-08-23 09:51:22', 0, 1);
INSERT INTO `tb_user` VALUES (199, '15032075887', '15032075887', '123456', 'driver', '2017-08-23 09:52:17', 0, 1);
INSERT INTO `tb_user` VALUES (200, '15130650881', '15130650881', '123456', 'driver', '2017-08-23 09:52:41', 0, 1);
INSERT INTO `tb_user` VALUES (201, '13933212091', '13933212091', '123456', 'driver', '2017-08-23 10:08:19', 0, 1);
INSERT INTO `tb_user` VALUES (202, '15100324444', '15100324444', '123456', 'driver', '2017-08-23 10:08:44', 0, 1);
INSERT INTO `tb_user` VALUES (203, '15075189905', '15075189905', '123456', 'driver', '2017-08-23 10:09:15', 0, 1);
INSERT INTO `tb_user` VALUES (204, '15030158993', '15030158993', '123456', 'driver', '2017-08-23 10:09:35', 0, 1);
INSERT INTO `tb_user` VALUES (205, '13582126272', '13582126272', '123456', 'driver', '2017-08-23 10:10:13', 0, 1);
INSERT INTO `tb_user` VALUES (206, '13933120413', '13933120413', '123456', 'driver', '2017-08-23 10:10:30', 0, 1);
INSERT INTO `tb_user` VALUES (207, '18333188937', '18333188937', '123456', 'driver', '2017-08-23 10:11:00', 0, 1);
INSERT INTO `tb_user` VALUES (208, '13933887268', '13933887268', '123456', 'driver', '2017-08-23 10:11:23', 0, 1);
INSERT INTO `tb_user` VALUES (209, '13582136282', '13582136282', '123456', 'driver', '2017-08-23 10:11:40', 0, 1);
INSERT INTO `tb_user` VALUES (210, '15027705810', '15027705810', '123456', 'driver', '2017-08-23 10:11:57', 0, 1);
INSERT INTO `tb_user` VALUES (211, '13832233006', '13832233006', '123456', 'driver', '2017-08-23 15:48:57', 0, 1);
INSERT INTO `tb_user` VALUES (212, '18631238507', '18631238507', '123456', 'driver', '2017-08-23 15:49:26', 0, 1);
INSERT INTO `tb_user` VALUES (213, '13503388233', '13503388233', '123456', 'driver', '2017-08-23 15:49:58', 0, 1);
INSERT INTO `tb_user` VALUES (214, '15231288288', '15231288288', '123456', 'driver', '2017-08-23 15:50:19', 0, 1);
INSERT INTO `tb_user` VALUES (215, '18333297108', '18333297108', '123456', 'driver', '2017-08-23 15:50:41', 0, 1);
INSERT INTO `tb_user` VALUES (216, '15232175338', '15232175338', '123456', 'driver', '2017-08-23 15:50:59', 0, 1);
INSERT INTO `tb_user` VALUES (217, '15027716299', '15027716299', '123456', 'driver', '2017-08-23 15:51:54', 0, 1);
INSERT INTO `tb_user` VALUES (218, '15533615683', '15533615683', '123456', 'driver', '2017-08-23 15:52:28', 0, 1);
INSERT INTO `tb_user` VALUES (219, '15075121491', '15075121491', '123456', 'driver', '2017-08-23 15:53:11', 0, 1);
INSERT INTO `tb_user` VALUES (220, '18332133350', '18332133350', '123456', 'driver', '2017-08-23 15:53:50', 0, 1);
INSERT INTO `tb_user` VALUES (221, '15128175737', '15128175737', '123456', 'driver', '2017-08-23 15:54:25', 0, 1);
INSERT INTO `tb_user` VALUES (222, '18703211330', '18703211330', '123456', 'driver', '2017-08-23 15:55:00', 0, 1);
INSERT INTO `tb_user` VALUES (223, '13833092333', '13833092333', '123456', 'driver', '2017-08-23 15:55:55', 0, 1);
INSERT INTO `tb_user` VALUES (224, '15833339354', '15833339354', '123456', 'driver', '2017-08-23 15:56:40', 0, 1);
INSERT INTO `tb_user` VALUES (225, '15903123861', '15903123861', '123456', 'driver', '2017-08-23 16:07:19', 0, 1);
INSERT INTO `tb_user` VALUES (226, '13933808394', '13933808394', '123456', 'driver', '2017-08-23 16:26:28', 0, 1);
INSERT INTO `tb_user` VALUES (227, '13582076305', '13582076305', '123456', 'driver', '2017-08-23 16:26:47', 0, 1);
INSERT INTO `tb_user` VALUES (228, '13731487054', '13731487054', '123456', 'driver', '2017-08-23 16:27:06', 0, 1);
INSERT INTO `tb_user` VALUES (229, '15830105401', '15830105401', '123456', 'driver', '2017-08-23 16:27:34', 0, 1);
INSERT INTO `tb_user` VALUES (230, '13933836832', '13933836832', '123456', 'driver', '2017-08-23 16:28:24', 0, 1);
INSERT INTO `tb_user` VALUES (231, '13473881538', '13473881538', '123456', 'driver', '2017-08-23 16:28:41', 0, 1);
INSERT INTO `tb_user` VALUES (232, '13333024387', '13333024387', '123456', 'driver', '2017-08-23 16:38:57', 0, 1);
INSERT INTO `tb_user` VALUES (233, '13833090529', '13833090529', '123456', 'driver', '2017-08-23 16:39:43', 0, 1);
INSERT INTO `tb_user` VALUES (234, '13603280629', '13603280629', '123456', 'driver', '2017-08-23 16:40:07', 0, 1);
INSERT INTO `tb_user` VALUES (235, '13832308983', '13832308983', '123456', 'driver', '2017-08-23 16:40:32', 0, 1);
INSERT INTO `tb_user` VALUES (236, '13733262908', '13733262908', '123456', 'driver', '2017-08-24 08:49:50', 0, 1);
INSERT INTO `tb_user` VALUES (237, '18713370966', '18713370966', '123456', 'driver', '2017-08-24 08:50:26', 0, 1);
INSERT INTO `tb_user` VALUES (238, '13831375133', '13831375133', '123456', 'driver', '2017-08-24 08:50:51', 0, 1);
INSERT INTO `tb_user` VALUES (239, '13473334001', '13473334001', '123456', 'driver', '2017-08-24 08:51:22', 0, 1);
INSERT INTO `tb_user` VALUES (240, '13730432566', '13730432566', '123456', 'driver', '2017-08-24 08:52:19', 0, 1);
INSERT INTO `tb_user` VALUES (241, '13934839800', '13934839800', '123456', 'driver', '2017-08-24 10:05:19', 0, 1);
INSERT INTO `tb_user` VALUES (242, '13934930706', '13934930706', '123456', 'driver', '2017-08-24 10:05:56', 0, 1);
INSERT INTO `tb_user` VALUES (243, '13720073110', '13720073110', '123456', 'driver', '2017-08-24 10:06:19', 0, 1);
INSERT INTO `tb_user` VALUES (244, '15369766669', '15369766669', '123456', 'driver', '2017-08-24 10:06:41', 0, 1);
INSERT INTO `tb_user` VALUES (245, '13593042444', '13593042444', '123456', 'driver', '2017-08-24 10:07:13', 0, 1);
INSERT INTO `tb_user` VALUES (246, '18334954449', '18334954449', '123456', 'driver', '2017-08-24 10:07:58', 0, 1);
INSERT INTO `tb_user` VALUES (247, '13820055572', '13820055572', '123456', 'driver', '2017-08-24 10:08:23', 0, 1);
INSERT INTO `tb_user` VALUES (248, '13831189825', '13831189825', '123456', 'driver', '2017-08-24 10:09:21', 0, 1);
INSERT INTO `tb_user` VALUES (249, '13934905595', '13934905595', '123456', 'driver', '2017-08-24 10:10:01', 0, 1);
INSERT INTO `tb_user` VALUES (250, '中钢国泰用户', '', '123456', 'customer', '2017-08-28 12:31:54', 0, 0);
INSERT INTO `tb_user` VALUES (251, '中钢国泰用户', '', '123456', 'customer', '2017-08-28 12:32:16', 0, 0);
INSERT INTO `tb_user` VALUES (252, '18949821385', '18949821385', '4811298', 'customer', '2017-08-28 13:32:33', 0, 0);
INSERT INTO `tb_user` VALUES (253, 'wkl', '', '123123', 'company', '2017-08-28 14:18:43', 0, 0);
INSERT INTO `tb_user` VALUES (254, '18949821384', '18949821384', '123456', 'driver', '2018-08-16 09:57:38', 0, 1);
INSERT INTO `tb_user` VALUES (255, 'xiaosu', '', '123456', 'customer', '2018-12-23 01:26:50', 0, 1);
INSERT INTO `tb_user` VALUES (256, 'xiaochai', '', '123456', 'company', '2018-12-23 01:27:28', 0, 1);
INSERT INTO `tb_user` VALUES (257, 'linlin', '', '123456', 'customer', '2018-12-23 01:27:49', 0, 1);
INSERT INTO `tb_user` VALUES (258, 'xiaochai', '', '123456', 'customer', '2018-12-23 01:28:39', 0, 1);
INSERT INTO `tb_user` VALUES (259, 'linlin', '', '123456', 'company', '2018-12-23 01:29:11', 0, 0);
INSERT INTO `tb_user` VALUES (260, 'wangwu', '', '123456', 'company', '2018-12-23 01:39:12', 0, 1);
INSERT INTO `tb_user` VALUES (261, 'linlin', '', '123456', 'company', '2018-12-23 01:41:18', 0, 1);
INSERT INTO `tb_user` VALUES (262, '13800138000', '13800138000', '123456', 'driver', '2018-12-23 01:44:45', 0, 1);
INSERT INTO `tb_user` VALUES (263, '13800138001', '13800138001', '123456', 'driver', '2018-12-23 01:49:56', 0, 1);
COMMIT;

-- ----------------------------
-- Table structure for tb_user_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_info`;
CREATE TABLE `tb_user_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `nickname` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `sex` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `img` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `company` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '公司名称',
  `money` float(11,0) DEFAULT '0' COMMENT '用户账户余额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of tb_user_info
-- ----------------------------
BEGIN;
INSERT INTO `tb_user_info` VALUES (70, 1, '超级管理员', '男', '/static/img/avatar.jpg', '2017-07-23', NULL, 0);
INSERT INTO `tb_user_info` VALUES (71, 2, '超级管理员', '男', '/static/img/avatar.jpg', '2017-07-23', NULL, 0);
INSERT INTO `tb_user_info` VALUES (80, 127, '中钢国泰', '男', 'http://otj3hc8no.bkt.clouddn.com/FgWThEudVEA-ehnqs864frvaVF3T', NULL, '中钢国泰', 0);
INSERT INTO `tb_user_info` VALUES (81, 128, '中钢国泰', '男', 'http://otj3hc8no.bkt.clouddn.com/FgWThEudVEA-ehnqs864frvaVF3T', NULL, '中钢国泰', 0);
INSERT INTO `tb_user_info` VALUES (82, 129, '123', '男', 'http://otj3hc8no.bkt.clouddn.com/FgWThEudVEA-ehnqs864frvaVF3T', NULL, '测试公司', 910);
INSERT INTO `tb_user_info` VALUES (83, 133, '', '男', 'http://otj3hc8no.bkt.clouddn.com/FgWThEudVEA-ehnqs864frvaVF3T', NULL, '宁国中维物流运输有限公司', 0);
INSERT INTO `tb_user_info` VALUES (84, 134, '', '男', 'http://otj3hc8no.bkt.clouddn.com/FgWThEudVEA-ehnqs864frvaVF3T', NULL, '蓝云物流', 0);
INSERT INTO `tb_user_info` VALUES (85, 135, '', '男', 'http://otj3hc8no.bkt.clouddn.com/FgWThEudVEA-ehnqs864frvaVF3T', NULL, '中钢国泰（内蒙）能源有限公司', 0);
INSERT INTO `tb_user_info` VALUES (86, 250, '中钢国泰用户', '男', 'http://otj3hc8no.bkt.clouddn.com/FgWThEudVEA-ehnqs864frvaVF3T', NULL, '', 0);
INSERT INTO `tb_user_info` VALUES (87, 251, '中钢国泰用户', '', 'http://otj3hc8no.bkt.clouddn.com/FgWThEudVEA-ehnqs864frvaVF3T', NULL, '', 0);
INSERT INTO `tb_user_info` VALUES (88, 252, '123', '男', 'http://otj3hc8no.bkt.clouddn.com/FkWDrkUyCNlK5g_BJTj6tcGBH2Il', '2017-08-28', '123', 0);
INSERT INTO `tb_user_info` VALUES (89, 253, '213', '男', 'http://otj3hc8no.bkt.clouddn.com/FgWThEudVEA-ehnqs864frvaVF3T', NULL, '123', 12);
INSERT INTO `tb_user_info` VALUES (90, 255, '小苏同志', '女', '/static/img/avatar.jpg', NULL, '', 0);
INSERT INTO `tb_user_info` VALUES (91, 256, '小柴', '', '/static/img/avatar.jpg', NULL, '小柴软件', 0);
INSERT INTO `tb_user_info` VALUES (92, 257, '琳琳', '女', '/static/img/avatar.jpg', NULL, '', 999);
INSERT INTO `tb_user_info` VALUES (93, 258, '小柴', '女', '/static/img/avatar.jpg', NULL, '', 0);
INSERT INTO `tb_user_info` VALUES (94, 259, '琳琳', '女', '/static/img/avatar.jpg', NULL, '中钢国泰用户', 0);
INSERT INTO `tb_user_info` VALUES (95, 260, '王五', '', '/static/img/avatar.jpg', NULL, '王五的公司', 0);
INSERT INTO `tb_user_info` VALUES (96, 261, '琳琳', '女', '/static/img/avatar.jpg', NULL, '琳琳国际护理', 0);
COMMIT;

-- ----------------------------
-- Table structure for tb_user_money
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_money`;
CREATE TABLE `tb_user_money` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_user_id` int(11) NOT NULL COMMENT '用户外键',
  `money` float NOT NULL,
  `type` varchar(255) NOT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户金额表，用来记录用户消费充值记录';

-- ----------------------------
-- Records of tb_user_money
-- ----------------------------
BEGIN;
INSERT INTO `tb_user_money` VALUES (1, 129, 12, 'out', 'to_card_20170806203416507', '2018-08-15 18:05:48');
INSERT INTO `tb_user_money` VALUES (2, 129, 200, 'out', 'to_card_20170921161327757', '2018-08-16 09:40:51');
COMMIT;

-- ----------------------------
-- Table structure for tb_user_token
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_token`;
CREATE TABLE `tb_user_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(16) NOT NULL,
  `user_id` int(11) NOT NULL,
  `time` datetime NOT NULL,
  `is_valid` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1418 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_user_token
-- ----------------------------
BEGIN;
INSERT INTO `tb_user_token` VALUES (1253, 'bc7efa50d08af536', 128, '2017-08-07 02:43:05', NULL);
INSERT INTO `tb_user_token` VALUES (1304, 'a62f1df43c109b60', 127, '2017-08-10 16:54:35', NULL);
INSERT INTO `tb_user_token` VALUES (1341, '19ecff5f977c5663', 134, '2017-08-17 11:54:04', NULL);
INSERT INTO `tb_user_token` VALUES (1368, '75f7e04632008ee5', 133, '2017-08-23 13:45:23', NULL);
INSERT INTO `tb_user_token` VALUES (1383, 'b889e0eb57bf5e2a', 251, '2017-08-28 12:58:14', NULL);
INSERT INTO `tb_user_token` VALUES (1384, '04424fafad3d2fc6', 250, '2017-08-28 12:58:56', NULL);
INSERT INTO `tb_user_token` VALUES (1399, 'c987d4fbf46a9c54', 252, '2017-09-21 16:21:40', NULL);
INSERT INTO `tb_user_token` VALUES (1401, '3f59ec05676de46f', 131, '2017-09-28 16:44:42', NULL);
INSERT INTO `tb_user_token` VALUES (1403, '82e8ad778dd94be7', 253, '2018-05-21 15:29:04', NULL);
INSERT INTO `tb_user_token` VALUES (1404, '95023c5d374d3818', 135, '2018-05-21 15:29:36', NULL);
INSERT INTO `tb_user_token` VALUES (1406, '5ff650e32ce40463', 129, '2018-08-16 10:23:06', NULL);
INSERT INTO `tb_user_token` VALUES (1408, '870cca5d5a026602', 256, '2018-12-23 01:33:03', NULL);
INSERT INTO `tb_user_token` VALUES (1409, 'aa9a445b76e8ecb7', 259, '2018-12-23 01:38:11', NULL);
INSERT INTO `tb_user_token` VALUES (1412, '8368ee00befadf62', 260, '2018-12-23 01:39:50', NULL);
INSERT INTO `tb_user_token` VALUES (1413, '9e97986ca15bd0f9', 2, '2018-12-23 01:40:27', NULL);
INSERT INTO `tb_user_token` VALUES (1415, '70fa0a13019c8035', 261, '2018-12-23 01:51:57', NULL);
INSERT INTO `tb_user_token` VALUES (1417, '2f8c26ee64159fdc', 1, '2018-12-23 02:53:32', NULL);
COMMIT;

-- ----------------------------
-- Table structure for tb_user_type
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_type`;
CREATE TABLE `tb_user_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `name` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_user_type
-- ----------------------------
BEGIN;
INSERT INTO `tb_user_type` VALUES (1, 'customer', '物流公司客户');
INSERT INTO `tb_user_type` VALUES (2, 'admin', '管理员');
INSERT INTO `tb_user_type` VALUES (3, 'driver', '司机');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
