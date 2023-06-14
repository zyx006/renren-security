/*
 Navicat Premium Data Transfer

 Source Server         : MySQL80
 Source Server Type    : MySQL
 Source Server Version : 80026
 Source Host           : localhost:3306
 Source Schema         : mt_db

 Target Server Type    : MySQL
 Target Server Version : 80026
 File Encoding         : 65001

 Date: 14/06/2023 15:38:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address_book
-- ----------------------------
DROP TABLE IF EXISTS `address_book`;
CREATE TABLE `address_book`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(0) NOT NULL COMMENT '用户id',
  `consignee` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '收货人',
  `gender` tinyint(0) NOT NULL COMMENT '性别 0 男 1 女',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '手机号',
  `province_code` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省级区划编号',
  `province_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省级名称',
  `city_code` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '市级区划编号',
  `city_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '市级名称',
  `district_code` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区级区划编号',
  `district_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区级名称',
  `detail` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签',
  `is_default` tinyint(1) NOT NULL DEFAULT 0 COMMENT '默认 0 否 1是',
  `creator` bigint(0) NOT NULL COMMENT '创建人',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `updater` bigint(0) NOT NULL COMMENT '修改人',
  `update_date` datetime(0) NOT NULL COMMENT '更新时间',
  `is_deleted` int(0) NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '地址管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of address_book
-- ----------------------------
INSERT INTO `address_book` VALUES (1, 1668247645219012609, '1111', 1, '15625658458', NULL, NULL, NULL, NULL, NULL, NULL, '25', '公司', 1, 1668247645219012609, '2023-06-14 12:56:55', 1668247645219012609, '2023-06-14 13:34:19', 0);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type` int(0) NULL DEFAULT NULL COMMENT '类型   1 菜品分类 2 套餐分类',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '分类名称',
  `sort` int(0) NOT NULL DEFAULT 0 COMMENT '顺序',
  `creator` bigint(0) NOT NULL COMMENT '创建人',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `updater` bigint(0) NOT NULL COMMENT '修改人',
  `update_date` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_category_name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜品及套餐分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1523221549476327425, 1, '家常菜', 9, 1, '2022-05-08 16:41:32', 1, '2022-05-08 17:38:00');
INSERT INTO `category` VALUES (1523221580623228930, 1, '盖饭', 8, 1, '2022-05-08 16:41:40', 1, '2022-05-08 17:38:08');
INSERT INTO `category` VALUES (1523221607961702401, 1, '特色菜', 7, 1, '2022-05-08 16:41:46', 1, '2022-05-08 17:38:16');
INSERT INTO `category` VALUES (1523221632653570050, 1, '干锅', 6, 1, '2022-05-08 16:41:52', 1, '2022-05-08 17:38:22');
INSERT INTO `category` VALUES (1523221667613093889, 1, '家常菜系列', 5, 1, '2022-05-08 16:42:00', 1, '2022-05-08 16:42:00');
INSERT INTO `category` VALUES (1523221692862803970, 1, '汤菜', 4, 1, '2022-05-08 16:42:06', 1, '2022-05-08 17:38:34');
INSERT INTO `category` VALUES (1523223881484185602, 1, '素菜系', 3, 1, '2022-05-08 16:50:48', 1, '2022-05-08 17:38:46');
INSERT INTO `category` VALUES (1523224049252151297, 2, '套餐', 2, 1, '2022-05-08 16:51:28', 1, '2022-05-08 17:39:08');
INSERT INTO `category` VALUES (1523224111688560641, 1, '米饭', 8, 1, '2022-05-08 16:51:43', 1, '2022-05-08 16:51:43');
INSERT INTO `category` VALUES (1523224134312636417, 1, '饮料', 1, 1, '2022-05-08 16:51:48', 1, '2022-05-08 17:39:13');

-- ----------------------------
-- Table structure for dish
-- ----------------------------
DROP TABLE IF EXISTS `dish`;
CREATE TABLE `dish`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '菜品名称',
  `category_id` bigint(0) NOT NULL COMMENT '菜品分类id',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '菜品价格',
  `code` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '商品码',
  `image` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '图片',
  `description` varchar(400) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '描述信息',
  `status` int(0) NOT NULL DEFAULT 1 COMMENT '0 停售 1 起售',
  `sort` int(0) NOT NULL DEFAULT 0 COMMENT '顺序',
  `creator` bigint(0) NOT NULL COMMENT '创建人',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `updater` bigint(0) NOT NULL COMMENT '修改人',
  `update_date` datetime(0) NOT NULL COMMENT '更新时间',
  `is_deleted` int(0) NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_dish_name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜品管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dish
-- ----------------------------
INSERT INTO `dish` VALUES (1523227188311207938, '三鲜肉炒莲白(米饭单点)', 1523221549476327425, 1488.00, '001', 'https://mt-take-out-1259733126.cos.ap-nanjing.myqcloud.com/0a3b3288-3446-4420-bbff-f263d0c02d8e.jpg', '原料：猪肉，白菜', 1, 0, 1, '2022-06-19 14:24:07', 1559815019674214402, '2022-08-21 12:33:20', 0);
INSERT INTO `dish` VALUES (1523227597964685314, '土豆炒肉丝（米饭单点）', 1523221549476327425, 1388.00, '', 'https://mt-take-out-1259733126.cos.ap-nanjing.myqcloud.com/0f4bd884-dc9c-4cf9-b59e-7d5958fec3dd.jpg', '原料：土豆，猪肉', 1, 0, 1, '2022-06-19 14:24:44', 1, '2022-06-19 14:24:44', 0);
INSERT INTO `dish` VALUES (1523227696245616641, '农家炒腊肉（米饭单点）', 1523221549476327425, 1688.00, '', 'https://mt-take-out-1259733126.cos.ap-nanjing.myqcloud.com/0f252364-a561-4e8d-8065-9a6797a6b1d3.jpg', '原料：腊肉', 1, 0, 1, '2022-06-19 14:23:55', 1, '2022-06-19 14:23:55', 0);
INSERT INTO `dish` VALUES (1523229046501126146, '干烧鲫鱼（米饭单点）', 1523221549476327425, 1898.00, '', 'https://mt-take-out-1259733126.cos.ap-nanjing.myqcloud.com/1fdbfbf3-1d86-4b29-a3fc-46345852f2f8.jpg', '原料：鲫鱼', 1, 0, 1, '2022-06-19 14:23:21', 1, '2022-06-19 14:23:21', 0);
INSERT INTO `dish` VALUES (1523229349560561666, '小炒肉（米饭单点）', 1523221549476327425, 1380.00, '', 'https://mt-take-out-1259733126.cos.ap-nanjing.myqcloud.com/02b533f2f4dd038058a9bb40827ab30a.jpeg', '原料：猪肉', 1, 0, 1, '2022-06-19 14:24:31', 1, '2022-06-19 14:24:31', 0);
INSERT INTO `dish` VALUES (1523229489490931714, '尖椒鸡（米饭单点）', 1523221549476327425, 1398.00, '', 'https://mt-take-out-1259733126.cos.ap-nanjing.myqcloud.com/2a2e9d66-b41d-4645-87bd-95f2cfeed218.jpg', '原料：辣椒，鸡肉', 1, 0, 1, '2022-06-19 14:23:02', 1, '2022-06-19 14:23:02', 0);
INSERT INTO `dish` VALUES (1523229659871948801, '回锅肉（米饭单点）', 1523221549476327425, 1388.00, '', 'https://mt-take-out-1259733126.cos.ap-nanjing.myqcloud.com/2a50628e-7758-4c51-9fbb-d37c61cdacad.jpg', '原料：猪肉', 1, 0, 1, '2022-06-19 14:22:43', 1, '2022-06-19 14:22:43', 0);
INSERT INTO `dish` VALUES (1523229839321051137, '鱼香肉丝（米饭单点）', 1523221549476327425, 1398.00, '', 'https://mt-take-out-1259733126.cos.ap-nanjing.myqcloud.com/2e96a7e3-affb-438e-b7c3-e1430df425c9.jpeg', '原料：胡罗卜、笋、木耳、猪肉', 1, 0, 1, '2022-06-19 14:21:32', 1, '2022-06-19 14:21:32', 0);
INSERT INTO `dish` VALUES (1523230006640226306, '土豆肉丝+米饭', 1523221580623228930, 1500.00, '', 'https://mt-take-out-1259733126.cos.ap-nanjing.myqcloud.com/3fabb83a-1c09-4fd9-892b-4ef7457daafa.jpeg', '原料：大米、土豆、猪肉', 1, 0, 1, '2022-06-19 14:21:00', 1, '2022-06-19 14:21:00', 0);
INSERT INTO `dish` VALUES (1523230157148631041, '盐煎肉+米饭', 1523221580623228930, 1500.00, '', 'https://mt-take-out-1259733126.cos.ap-nanjing.myqcloud.com/5b8d2da3-3744-4bb3-acdc-329056b8259d.jpeg', '原料：大米、猪肉、食盐', 1, 0, 1, '2022-06-19 14:20:48', 1, '2022-06-19 14:20:48', 0);
INSERT INTO `dish` VALUES (1523230305597632513, '回锅肉+米饭', 1523221580623228930, 1500.00, '', 'https://mt-take-out-1259733126.cos.ap-nanjing.myqcloud.com/8dcfda14-5712-4d28-82f7-ae905b3c2308.jpg', '原料：大米、猪肉', 1, 0, 1, '2022-06-19 14:20:34', 1, '2022-06-19 14:20:34', 0);
INSERT INTO `dish` VALUES (1523230460363255810, '豆干肉丝+米饭', 1523221580623228930, 1500.00, '', 'https://mt-take-out-1259733126.cos.ap-nanjing.myqcloud.com/9ec6fc2d-50d2-422e-b954-de87dcd04198.jpeg', '原料：大米、豆干、猪肉', 1, 0, 1, '2022-06-19 14:15:41', 1, '2022-06-19 14:15:41', 0);
INSERT INTO `dish` VALUES (1523230566508507138, '鱼香肉丝+米饭', 1523221580623228930, 1500.00, '', 'https://mt-take-out-1259733126.cos.ap-nanjing.myqcloud.com/057dd338-e487-4bbc-a74c-0384c44a9ca3.jpg', '原料：大米、猪肉', 1, 0, 1, '2022-06-19 14:21:45', 1, '2022-06-19 14:21:45', 0);
INSERT INTO `dish` VALUES (1523230706002669569, '老盐菜炒回锅肉（米饭单点）', 1523221607961702401, 1398.00, '', 'https://mt-take-out-1259733126.cos.ap-nanjing.myqcloud.com/583df4b7-a159-4cfc-9543-4f666120b25f.jpeg', '原料：猪肉', 1, 0, 1, '2022-06-19 14:14:49', 1, '2022-06-19 14:14:49', 0);
INSERT INTO `dish` VALUES (1523230887100133378, '剁椒鲫鱼（米饭单点）', 1523221607961702401, 2198.00, '', 'https://mt-take-out-1259733126.cos.ap-nanjing.myqcloud.com/646d357d11812f9479e50e41651e8946.jpeg', '原料：鲫鱼', 1, 0, 1, '2022-06-19 14:14:37', 1, '2022-06-19 14:14:37', 0);
INSERT INTO `dish` VALUES (1523231074837180418, '泡椒儿肠（米饭单点）', 1523221607961702401, 1698.00, '', 'https://mt-take-out-1259733126.cos.ap-nanjing.myqcloud.com/740c79ce-af29-41b8-b78d-5f49c96e38c4.jpg', '原料：猪小肠', 1, 0, 1, '2022-06-19 14:13:31', 1, '2022-06-19 14:13:31', 0);
INSERT INTO `dish` VALUES (1523231271495512066, '干锅鸡+米饭', 1523221632653570050, 1980.00, '', 'https://mt-take-out-1259733126.cos.ap-nanjing.myqcloud.com/1405081e-f545-42e1-86a2-f7559ae2e276.jpeg', '原料：鸡肉', 1, 0, 1, '2022-06-19 14:19:42', 1, '2022-06-19 14:19:42', 0);
INSERT INTO `dish` VALUES (1523231432867164162, '豆花+油碟+米饭', 1523221667613093889, 980.00, '', 'https://mt-take-out-1259733126.cos.ap-nanjing.myqcloud.com/a53a4e6a-3b83-4044-87f9-9d49b30a8fdc.jpg', '原料：豆腐脑', 1, 0, 1, '2022-06-19 14:11:32', 1, '2022-06-19 14:11:32', 0);
INSERT INTO `dish` VALUES (1523231582276661250, '干烧鲫鱼（不含米饭）', 1523221667613093889, 1898.00, '', 'https://mt-take-out-1259733126.cos.ap-nanjing.myqcloud.com/d2f61d70-ac85-4529-9b74-6d9a2255c6d7.jpg', '原料：鲫鱼', 1, 0, 1, '2022-06-19 14:14:14', 1, '2022-06-19 14:14:14', 0);
INSERT INTO `dish` VALUES (1523231728100028417, '红烧肉（不含米饭）', 1523221667613093889, 1498.00, '', 'https://mt-take-out-1259733126.cos.ap-nanjing.myqcloud.com/d1688fe2a91cda424852b88dd5f2679e.jpeg', '原料：土豆、猪肉', 1, 0, 1, '2022-06-19 14:18:42', 1, '2022-06-19 14:18:42', 0);
INSERT INTO `dish` VALUES (1523231842168320002, '土豆烧鸡（不含米饭）', 1523221667613093889, 2000.00, '', 'https://mt-take-out-1259733126.cos.ap-nanjing.myqcloud.com/e476f679-5c15-436b-87fa-8c4e9644bf33.jpeg', '原料：土豆、鸡肉', 1, 0, 1, '2022-06-19 14:18:20', 1, '2022-06-19 14:18:20', 0);
INSERT INTO `dish` VALUES (1523231978755829761, '农家炒香肠（不含米饭）', 1523221667613093889, 1698.00, '', 'https://mt-take-out-1259733126.cos.ap-nanjing.myqcloud.com/ef2b73f2-75d1-4d3a-beea-22da0e1421bd.jpg', '原料：香肠', 1, 0, 1, '2022-06-19 14:11:18', 1, '2022-06-19 14:11:18', 0);
INSERT INTO `dish` VALUES (1523232102403911681, '三线莲白（不含米饭）', 1523221667613093889, 1398.00, '', 'https://mt-take-out-1259733126.cos.ap-nanjing.myqcloud.com/f966a38e-0780-40be-bb52-5699d13cb3d9.jpg', '原料：大白菜', 1, 0, 1, '2022-06-19 14:18:03', 1, '2022-06-19 14:18:03', 0);
INSERT INTO `dish` VALUES (1523232185912504321, '紫菜蛋花汤（不含米饭）', 1523221692862803970, 880.00, '', 'https://mt-take-out-1259733126.cos.ap-nanjing.myqcloud.com/0a3b3288-3446-4420-bbff-f263d0c02d8e.jpg', '原料：紫菜、鸡蛋', 1, 0, 1, '2022-06-19 14:08:47', 1, '2022-06-19 14:08:47', 0);
INSERT INTO `dish` VALUES (1523232325142425601, '酸菜粉丝汤（不含米饭）', 1523221692862803970, 780.00, '', 'https://mt-take-out-1259733126.cos.ap-nanjing.myqcloud.com/0f4bd884-dc9c-4cf9-b59e-7d5958fec3dd.jpg', '原料：粉丝、酸菜', 1, 0, 1, '2022-06-19 14:08:17', 1, '2022-06-19 14:08:17', 0);
INSERT INTO `dish` VALUES (1523232409104003074, '肉片汤（不含米饭）', 1523221692862803970, 2200.00, '', 'https://mt-take-out-1259733126.cos.ap-nanjing.myqcloud.com/0f252364-a561-4e8d-8065-9a6797a6b1d3.jpg', '原料：猪肉', 1, 0, 1, '2022-06-19 14:08:07', 1, '2022-06-19 14:08:07', 0);
INSERT INTO `dish` VALUES (1523232518197850114, '番茄鸡蛋汤（不含米饭）', 1523221692862803970, 880.00, '', 'https://mt-take-out-1259733126.cos.ap-nanjing.myqcloud.com/1fdbfbf3-1d86-4b29-a3fc-46345852f2f8.jpg', '原料：番茄、 鸡蛋', 1, 0, 1, '2022-06-19 14:05:51', 1, '2022-06-19 14:05:51', 0);
INSERT INTO `dish` VALUES (1523232652012924930, '红烧茄子（不含米饭）', 1523223881484185602, 856.00, '', 'https://mt-take-out-1259733126.cos.ap-nanjing.myqcloud.com/02b533f2f4dd038058a9bb40827ab30a.jpeg', '原料：茄子', 1, 0, 1, '2022-06-19 14:16:27', 1, '2022-06-19 14:16:27', 0);
INSERT INTO `dish` VALUES (1523232750734258177, '炒胡豆（不含米饭）', 1523223881484185602, 788.00, '', 'https://mt-take-out-1259733126.cos.ap-nanjing.myqcloud.com/2a2e9d66-b41d-4645-87bd-95f2cfeed218.jpg', '原料：胡豆', 1, 0, 1, '2022-06-19 14:06:59', 1, '2022-06-19 14:06:59', 0);
INSERT INTO `dish` VALUES (1523232846934814722, '干煸土豆丝（不含米饭）', 1523223881484185602, 1500.00, '', 'https://mt-take-out-1259733126.cos.ap-nanjing.myqcloud.com/2a50628e-7758-4c51-9fbb-d37c61cdacad.jpg', '原料：土豆', 1, 0, 1, '2022-06-19 14:07:10', 1, '2022-06-19 14:07:10', 0);
INSERT INTO `dish` VALUES (1523233237814587394, '红苕稀饭', 1523224111688560641, 168.00, '', 'https://mt-take-out-1259733126.cos.ap-nanjing.myqcloud.com/ee04a05a-1230-46b6-8ad5-1a95b140fff3.png', '原料：大米', 1, 0, 1, '2022-06-19 14:07:19', 1067246875800000001, '2022-08-29 21:20:05', 0);
INSERT INTO `dish` VALUES (1523233316415844354, '香肠炒饭', 1523224111688560641, 998.00, '', 'https://mt-take-out-1259733126.cos.ap-nanjing.myqcloud.com/ee04a05a-1230-46b6-8ad5-1a95b140fff3.png', '原料：大米、香肠', 1, 0, 1, '2022-06-19 14:07:41', 1067246875800000001, '2022-08-29 21:20:05', 0);
INSERT INTO `dish` VALUES (1523233498566078465, '鸡蛋炒饭', 1523224111688560641, 688.00, '', 'https://mt-take-out-1259733126.cos.ap-nanjing.myqcloud.com/ee04a05a-1230-46b6-8ad5-1a95b140fff3.png', '原料：大米、鸡蛋', 1, 0, 1, '2022-06-19 14:07:54', 1067246875800000001, '2022-08-29 21:20:05', 0);
INSERT INTO `dish` VALUES (1523233618137296897, '珍珠米饭', 1523224111688560641, 100.00, '', 'https://mt-take-out-1259733126.cos.ap-nanjing.myqcloud.com/ee04a05a-1230-46b6-8ad5-1a95b140fff3.png', '原料：大米', 1, 0, 1, '2022-06-19 02:47:24', 1067246875800000001, '2022-08-29 21:20:05', 0);
INSERT INTO `dish` VALUES (1523233739667255298, '怡宝', 1523224134312636417, 200.00, '', 'https://mt-take-out-1259733126.cos.ap-nanjing.myqcloud.com/c99e0aab-3cb7-4eaa-80fd-f47d4ffea694.png', '原料：水', 1, 0, 1, '2022-06-19 14:04:00', 1067246875800000001, '2022-08-29 21:20:05', 0);
INSERT INTO `dish` VALUES (1560651286804705282, 'test测试1', 1523221549476327425, 1980.00, '', 'https://mt-take-out-1259733126.cos.ap-nanjing.myqcloud.com/057dd338-e487-4bbc-a74c-0384c44a9ca3.jpg', '测试测试', 1, 0, 1067246875800000001, '2022-08-19 23:33:57', 1067246875800000001, '2022-08-29 23:19:07', 0);
INSERT INTO `dish` VALUES (1564251465613164545, '测试测试', 1523221549476327425, 1100.00, '', 'https://mt-take-out-1259733126.cos.ap-nanjing.myqcloud.com/583df4b7-a159-4cfc-9543-4f666120b25f.jpeg', '', 1, 0, 1067246875800000001, '2022-08-29 21:59:46', 1067246875800000001, '2022-08-29 23:18:45', 0);

-- ----------------------------
-- Table structure for dish_flavor
-- ----------------------------
DROP TABLE IF EXISTS `dish_flavor`;
CREATE TABLE `dish_flavor`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dish_id` bigint(0) NOT NULL COMMENT '菜品',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '口味名称',
  `value` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '口味数据list',
  `creator` bigint(0) NOT NULL COMMENT '创建人',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `updater` bigint(0) NOT NULL COMMENT '修改人',
  `update_date` datetime(0) NOT NULL COMMENT '更新时间',
  `is_deleted` int(0) NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜品口味关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dish_flavor
-- ----------------------------
INSERT INTO `dish_flavor` VALUES (1397849417888346113, 1397849417854791681, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', 1, '2021-05-27 09:37:27', 1, '2021-05-27 09:37:27', 0);
INSERT INTO `dish_flavor` VALUES (1397849936421761025, 1397849936404983809, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', 1, '2021-05-27 09:39:30', 1, '2021-05-27 09:39:30', 0);
INSERT INTO `dish_flavor` VALUES (1397849936438538241, 1397849936404983809, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', 1, '2021-05-27 09:39:30', 1, '2021-05-27 09:39:30', 0);
INSERT INTO `dish_flavor` VALUES (1397850630734262274, 1397850630700707841, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', 1, '2021-05-27 09:42:16', 1, '2021-05-27 09:42:16', 0);
INSERT INTO `dish_flavor` VALUES (1397850630755233794, 1397850630700707841, '辣度', '[\"微辣\",\"中辣\",\"重辣\"]', 1, '2021-05-27 09:42:16', 1, '2021-05-27 09:42:16', 0);
INSERT INTO `dish_flavor` VALUES (1397853423486414850, 1397853423461249026, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', 1, '2021-05-27 09:53:22', 1, '2021-05-27 09:53:22', 0);
INSERT INTO `dish_flavor` VALUES (1397854133632413697, 1397854133603053569, '温度', '[\"热饮\",\"常温\",\"去冰\",\"少冰\",\"多冰\"]', 1, '2021-05-27 09:56:11', 1, '2021-05-27 09:56:11', 0);
INSERT INTO `dish_flavor` VALUES (1397855742303186946, 1397855742273826817, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', 1, '2021-05-27 10:02:35', 1, '2021-05-27 10:02:35', 0);
INSERT INTO `dish_flavor` VALUES (1397855906497605633, 1397855906468245506, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', 1, '2021-05-27 10:03:14', 1, '2021-05-27 10:03:14', 0);
INSERT INTO `dish_flavor` VALUES (1397856190573621250, 1397856190540066818, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', 1, '2021-05-27 10:04:21', 1, '2021-05-27 10:04:21', 0);
INSERT INTO `dish_flavor` VALUES (1397859056709316609, 1397859056684150785, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', 1, '2021-05-27 10:15:45', 1, '2021-05-27 10:15:45', 0);
INSERT INTO `dish_flavor` VALUES (1397859277837217794, 1397859277812051969, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', 1, '2021-05-27 10:16:37', 1, '2021-05-27 10:16:37', 0);
INSERT INTO `dish_flavor` VALUES (1397859487502086146, 1397859487476920321, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', 1, '2021-05-27 10:17:27', 1, '2021-05-27 10:17:27', 0);
INSERT INTO `dish_flavor` VALUES (1397859757061615618, 1397859757036449794, '甜味', '[\"无糖\",\"少糖\",\"半躺\",\"多糖\",\"全糖\"]', 1, '2021-05-27 10:18:32', 1, '2021-05-27 10:18:32', 0);
INSERT INTO `dish_flavor` VALUES (1397861135754506242, 1397861135733534722, '甜味', '[\"无糖\",\"少糖\",\"半躺\",\"多糖\",\"全糖\"]', 1, '2021-05-27 10:24:00', 1, '2021-05-27 10:24:00', 0);
INSERT INTO `dish_flavor` VALUES (1397861370035744769, 1397861370010578945, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', 1, '2021-05-27 10:24:56', 1, '2021-05-27 10:24:56', 0);
INSERT INTO `dish_flavor` VALUES (1397861898467717121, 1397861898438356993, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', 1, '2021-05-27 10:27:02', 1, '2021-05-27 10:27:02', 0);
INSERT INTO `dish_flavor` VALUES (1398089545865015297, 1398089545676271617, '温度', '[\"热饮\",\"常温\",\"去冰\",\"少冰\",\"多冰\"]', 1, '2021-05-28 01:31:38', 1, '2021-05-28 01:31:38', 0);
INSERT INTO `dish_flavor` VALUES (1398089782323097601, 1398089782285348866, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', 1, '2021-05-28 01:32:34', 1, '2021-05-28 01:32:34', 0);
INSERT INTO `dish_flavor` VALUES (1398090003262255106, 1398090003228700673, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', 1, '2021-05-28 01:33:27', 1, '2021-05-28 01:33:27', 0);
INSERT INTO `dish_flavor` VALUES (1398090264554811394, 1398090264517062657, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', 1, '2021-05-28 01:34:29', 1, '2021-05-28 01:34:29', 0);
INSERT INTO `dish_flavor` VALUES (1398090455399837698, 1398090455324340225, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', 1, '2021-05-28 01:35:14', 1, '2021-05-28 01:35:14', 0);
INSERT INTO `dish_flavor` VALUES (1398090685449023490, 1398090685419663362, '温度', '[\"热饮\",\"常温\",\"去冰\",\"少冰\",\"多冰\"]', 1, '2021-05-28 01:36:09', 1, '2021-05-28 01:36:09', 0);
INSERT INTO `dish_flavor` VALUES (1398090825358422017, 1398090825329061889, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', 1, '2021-05-28 01:36:43', 1, '2021-05-28 01:36:43', 0);
INSERT INTO `dish_flavor` VALUES (1398091007051476993, 1398091007017922561, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', 1, '2021-05-28 01:37:26', 1, '2021-05-28 01:37:26', 0);
INSERT INTO `dish_flavor` VALUES (1398091296164851713, 1398091296131297281, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', 1, '2021-05-28 01:38:35', 1, '2021-05-28 01:38:35', 0);
INSERT INTO `dish_flavor` VALUES (1398091546531246081, 1398091546480914433, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', 1, '2021-05-28 01:39:35', 1, '2021-05-28 01:39:35', 0);
INSERT INTO `dish_flavor` VALUES (1398091729809747969, 1398091729788776450, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', 1, '2021-05-28 01:40:18', 1, '2021-05-28 01:40:18', 0);
INSERT INTO `dish_flavor` VALUES (1398091889499484161, 1398091889449152513, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', 1, '2021-05-28 01:40:56', 1, '2021-05-28 01:40:56', 0);
INSERT INTO `dish_flavor` VALUES (1398092095179763713, 1398092095142014978, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', 1, '2021-05-28 01:41:45', 1, '2021-05-28 01:41:45', 0);
INSERT INTO `dish_flavor` VALUES (1398092283877306370, 1398092283847946241, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', 1, '2021-05-28 01:42:30', 1, '2021-05-28 01:42:30', 0);
INSERT INTO `dish_flavor` VALUES (1398094018939236354, 1398094018893099009, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', 1, '2021-05-28 01:49:24', 1, '2021-05-28 01:49:24', 0);
INSERT INTO `dish_flavor` VALUES (1398094391494094850, 1398094391456346113, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', 1, '2021-05-28 01:50:53', 1, '2021-05-28 01:50:53', 0);
INSERT INTO `dish_flavor` VALUES (1399574026165727233, 1399305325713600514, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', 1399309715396669441, '2021-06-01 03:50:25', 1399309715396669441, '2021-06-01 03:50:25', 0);
INSERT INTO `dish_flavor` VALUES (1523231271495512067, 1523231271495512066, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', 1, '2022-06-19 14:19:42', 1, '2022-06-19 14:19:42', 0);
INSERT INTO `dish_flavor` VALUES (1523231582276661251, 1523231582276661250, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', 1, '2022-06-19 14:14:14', 1, '2022-06-19 14:14:14', 0);

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '名字',
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '图片',
  `order_id` bigint(0) NOT NULL COMMENT '订单id',
  `dish_id` bigint(0) NULL DEFAULT NULL COMMENT '菜品id',
  `setmeal_id` bigint(0) NULL DEFAULT NULL COMMENT '套餐id',
  `dish_flavor` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '口味',
  `number` int(0) NOT NULL DEFAULT 1 COMMENT '数量',
  `amount` decimal(10, 2) NOT NULL COMMENT '金额',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单明细表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_detail
-- ----------------------------
INSERT INTO `order_detail` VALUES (4, '干煸土豆丝（不含米饭）', 'https://mt-take-out-1259733126.cos.ap-nanjing.myqcloud.com/2a50628e-7758-4c51-9fbb-d37c61cdacad.jpg', 1668848038638575618, 1523232846934814722, NULL, NULL, 1, 15.00);
INSERT INTO `order_detail` VALUES (5, '珍珠米饭', 'https://mt-take-out-1259733126.cos.ap-nanjing.myqcloud.com/ee04a05a-1230-46b6-8ad5-1a95b140fff3.png', 1668848038638575618, 1523233618137296897, NULL, NULL, 1, 1.00);
INSERT INTO `order_detail` VALUES (6, '怡宝', 'https://mt-take-out-1259733126.cos.ap-nanjing.myqcloud.com/c99e0aab-3cb7-4eaa-80fd-f47d4ffea694.png', 1668848932419592194, 1523233739667255298, NULL, NULL, 1, 2.00);
INSERT INTO `order_detail` VALUES (7, '怡宝', 'https://mt-take-out-1259733126.cos.ap-nanjing.myqcloud.com/c99e0aab-3cb7-4eaa-80fd-f47d4ffea694.png', 1668849273609445377, 1523233739667255298, NULL, NULL, 1, 2.00);
INSERT INTO `order_detail` VALUES (8, '怡宝', 'https://mt-take-out-1259733126.cos.ap-nanjing.myqcloud.com/c99e0aab-3cb7-4eaa-80fd-f47d4ffea694.png', 1668850382742781953, 1523233739667255298, NULL, NULL, 1, 2.00);
INSERT INTO `order_detail` VALUES (9, '珍珠米饭', 'https://mt-take-out-1259733126.cos.ap-nanjing.myqcloud.com/ee04a05a-1230-46b6-8ad5-1a95b140fff3.png', 1668851197406683137, 1523233618137296897, NULL, NULL, 1, 1.00);
INSERT INTO `order_detail` VALUES (11, '测试测试', 'https://mt-take-out-1259733126.cos.ap-nanjing.myqcloud.com/e476f679-5c15-436b-87fa-8c4e9644bf33.jpeg', 1668854130919673858, NULL, 1564264362565296130, NULL, 1, 33.00);
INSERT INTO `order_detail` VALUES (13, '豆花+油碟+米饭', 'https://mt-take-out-1259733126.cos.ap-nanjing.myqcloud.com/a53a4e6a-3b83-4044-87f9-9d49b30a8fdc.jpg', 1668854130919673858, 1523231432867164162, NULL, NULL, 1, 9.80);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `number` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '订单号',
  `status` int(0) NOT NULL DEFAULT 1 COMMENT '订单状态 1待付款，2待派送，3已派送，4已完成，5已取消',
  `user_id` bigint(0) NOT NULL COMMENT '下单用户',
  `address_book_id` bigint(0) NOT NULL COMMENT '地址id',
  `order_time` datetime(0) NOT NULL COMMENT '下单时间',
  `checkout_time` datetime(0) NULL DEFAULT NULL COMMENT '结账时间',
  `pay_method` int(0) NOT NULL DEFAULT 1 COMMENT '支付方式 1微信,2支付宝',
  `amount` decimal(10, 2) NOT NULL COMMENT '实收金额',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `consignee` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1, '1668845880056819713', 1, 1668247645219012609, 1, '2023-06-14 13:00:38', NULL, 2, 16.00, '123', '15625658458', '252', NULL, '1111');
INSERT INTO `orders` VALUES (2, '1668846627565678594', 1, 1668247645219012609, 1, '2023-06-14 13:03:36', NULL, 2, 16.00, '', '15625658458', '252', NULL, '1111');
INSERT INTO `orders` VALUES (3, '1668846813885034498', 1, 1668247645219012609, 1, '2023-06-14 13:05:26', NULL, 2, 16.00, '', '15625658458', '252', NULL, '1111');
INSERT INTO `orders` VALUES (4, '1668848038638575618', 1, 1668247645219012609, 1, '2023-06-14 13:09:13', NULL, 2, 16.00, '', '15625658458', '252', NULL, '1111');
INSERT INTO `orders` VALUES (5, '1668848932419592194', 1, 1668247645219012609, 1, '2023-06-14 13:12:46', NULL, 2, 2.00, '', '15625658458', '252', NULL, '1111');
INSERT INTO `orders` VALUES (6, '1668849273609445377', 1, 1668247645219012609, 1, '2023-06-14 13:14:07', NULL, 2, 2.00, '', '15625658458', '252', NULL, '1111');
INSERT INTO `orders` VALUES (7, '1668850382742781953', 2, 1668247645219012609, 1, '2023-06-14 13:18:32', '2023-06-14 13:18:50', 2, 2.00, '', '15625658458', '252', NULL, '1111');
INSERT INTO `orders` VALUES (8, '1668851197406683137', 2, 1668247645219012609, 1, '2023-06-14 13:21:46', '2023-06-14 13:22:00', 2, 1.00, 'test', '15625658458', '252', NULL, '1111');
INSERT INTO `orders` VALUES (9, '1668854130919673858', 2, 1668247645219012609, 1, '2023-06-14 13:33:25', '2023-06-14 13:33:36', 2, 42.00, 'tttt', '15625658458', '252', NULL, '1111');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `BLOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `SCHED_NAME`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `CALENDAR_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CRON_EXPRESSION` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TIME_ZONE_ID` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('RenrenScheduler', 'TASK_1067246875800000076', 'DEFAULT', '0 0/30 * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ENTRY_ID` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FIRED_TIME` bigint(0) NOT NULL,
  `SCHED_TIME` bigint(0) NOT NULL,
  `PRIORITY` int(0) NOT NULL,
  `STATE` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `ENTRY_ID`) USING BTREE,
  INDEX `IDX_QRTZ_FT_TRIG_INST_NAME`(`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE,
  INDEX `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY`(`SCHED_NAME`, `INSTANCE_NAME`, `REQUESTS_RECOVERY`) USING BTREE,
  INDEX `IDX_QRTZ_FT_J_G`(`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_JG`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_T_G`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_TG`(`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_DURABLE` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_UPDATE_DATA` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_J_REQ_RECOVERY`(`SCHED_NAME`, `REQUESTS_RECOVERY`) USING BTREE,
  INDEX `IDX_QRTZ_J_GRP`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('RenrenScheduler', 'TASK_1067246875800000076', 'DEFAULT', NULL, 'io.renren.modules.job.utils.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372002E696F2E72656E72656E2E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200074C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B4C000A757064617465446174657400104C6A6176612F7574696C2F446174653B4C0007757064617465727400104C6A6176612F6C616E672F4C6F6E673B78720022696F2E72656E72656E2E636F6D6D6F6E2E656E746974792E42617365456E74697479FB83923222FF87B90200034C000A6372656174654461746571007E000B4C000763726561746F7271007E000C4C0002696471007E000C78707372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001889FD0EAE8787372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700ECF9F6107B456017371007E00110ECF9F6107B4564C740008746573745461736B74000E3020302F3330202A202A202A203F74000672656E72656E740025E69C89E58F82E6B58BE8AF95EFBC8CE5A49AE4B8AAE58F82E695B0E4BDBFE794A86A736F6E737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0012000000007371007E000F7708000001889FD0EAE8787371007E00110ECF9F6107B456017800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LOCK_NAME` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `LOCK_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RenrenScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RenrenScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LAST_CHECKIN_TIME` bigint(0) NOT NULL,
  `CHECKIN_INTERVAL` bigint(0) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RenrenScheduler', 'LAPTOP-4DMOD6O51686728211439', 1686728288954, 15000);

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REPEAT_COUNT` bigint(0) NOT NULL,
  `REPEAT_INTERVAL` bigint(0) NOT NULL,
  `TIMES_TRIGGERED` bigint(0) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `STR_PROP_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STR_PROP_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STR_PROP_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `INT_PROP_1` int(0) NULL DEFAULT NULL,
  `INT_PROP_2` int(0) NULL DEFAULT NULL,
  `LONG_PROP_1` bigint(0) NULL DEFAULT NULL,
  `LONG_PROP_2` bigint(0) NULL DEFAULT NULL,
  `DEC_PROP_1` decimal(13, 4) NULL DEFAULT NULL,
  `DEC_PROP_2` decimal(13, 4) NULL DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(0) NULL DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(0) NULL DEFAULT NULL,
  `PRIORITY` int(0) NULL DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_TYPE` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `START_TIME` bigint(0) NOT NULL,
  `END_TIME` bigint(0) NULL DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MISFIRE_INSTR` smallint(0) NULL DEFAULT NULL,
  `JOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_J`(`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_JG`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_C`(`SCHED_NAME`, `CALENDAR_NAME`) USING BTREE,
  INDEX `IDX_QRTZ_T_G`(`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_STATE`(`SCHED_NAME`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_N_STATE`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_N_G_STATE`(`SCHED_NAME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_NEXT_FIRE_TIME`(`SCHED_NAME`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST`(`SCHED_NAME`, `TRIGGER_STATE`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_MISFIRE`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST_MISFIRE`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('RenrenScheduler', 'TASK_1067246875800000076', 'DEFAULT', 'TASK_1067246875800000076', 'DEFAULT', NULL, 1686313800000, -1, 5, 'PAUSED', 'CRON', 1686312005000, 0, NULL, 2, 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372002E696F2E72656E72656E2E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200074C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B4C000A757064617465446174657400104C6A6176612F7574696C2F446174653B4C0007757064617465727400104C6A6176612F6C616E672F4C6F6E673B78720022696F2E72656E72656E2E636F6D6D6F6E2E656E746974792E42617365456E74697479FB83923222FF87B90200034C000A6372656174654461746571007E000B4C000763726561746F7271007E000C4C0002696471007E000C78707372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001889FD0EAE8787372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700ECF9F6107B456017371007E00110ECF9F6107B4564C740008746573745461736B74000E3020302F3330202A202A202A203F74000672656E72656E740025E69C89E58F82E6B58BE8AF95EFBC8CE5A49AE4B8AAE58F82E695B0E4BDBFE794A86A736F6E737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0012000000007371007E000F7708000001889FD0EAE8787371007E00110ECF9F6107B456017800);

-- ----------------------------
-- Table structure for schedule_job
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job`;
CREATE TABLE `schedule_job`  (
  `id` bigint(0) NOT NULL COMMENT 'id',
  `bean_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'spring bean名称',
  `params` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'cron表达式',
  `status` tinyint unsigned NULL COMMENT '任务状态  0：暂停  1：正常',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `creator` bigint(0) NULL DEFAULT NULL COMMENT '创建者',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` bigint(0) NULL DEFAULT NULL COMMENT '更新者',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_create_date`(`create_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of schedule_job
-- ----------------------------
INSERT INTO `schedule_job` VALUES (1067246875800000076, 'testTask', 'renren', '0 0/30 * * * ?', 0, '有参测试，多个参数使用json', 1067246875800000001, '2023-06-09 19:00:49', 1067246875800000001, '2023-06-09 19:00:49');

-- ----------------------------
-- Table structure for schedule_job_log
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job_log`;
CREATE TABLE `schedule_job_log`  (
  `id` bigint(0) NOT NULL COMMENT 'id',
  `job_id` bigint(0) NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'spring bean名称',
  `params` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '参数',
  `status` tinyint unsigned NOT NULL COMMENT '任务状态    0：失败    1：成功',
  `error` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '失败信息',
  `times` int(0) NOT NULL COMMENT '耗时(单位：毫秒)',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_job_id`(`job_id`) USING BTREE,
  INDEX `idx_create_date`(`create_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for setmeal
-- ----------------------------
DROP TABLE IF EXISTS `setmeal`;
CREATE TABLE `setmeal`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `category_id` bigint(0) NOT NULL COMMENT '菜品分类id',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '套餐名称',
  `price` decimal(10, 2) NOT NULL COMMENT '套餐价格',
  `status` int(0) NULL DEFAULT NULL COMMENT '状态 0:停用 1:启用',
  `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '编码',
  `description` varchar(512) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '描述信息',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '图片',
  `creator` bigint(0) NOT NULL COMMENT '创建人',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `updater` bigint(0) NOT NULL COMMENT '修改人',
  `update_date` datetime(0) NOT NULL COMMENT '更新时间',
  `is_deleted` int(0) NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_setmeal_name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '套餐' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of setmeal
-- ----------------------------
INSERT INTO `setmeal` VALUES (1523233943468486658, 1523224049252151297, '农家腊肉+小菜+米饭', 1998.00, 1, '', '原料：大米、青菜、腊肉', 'https://mt-take-out-1259733126.cos.ap-nanjing.myqcloud.com/0a3b3288-3446-4420-bbff-f263d0c02d8e.jpg', 1, '2022-06-19 14:29:33', 1067246875800000001, '2022-08-29 21:19:55', 0);
INSERT INTO `setmeal` VALUES (1523234378937905154, 1523224049252151297, '农家小炒肉+小菜+米饭', 1900.00, 1, '', '原料：大米、猪肉', 'https://mt-take-out-1259733126.cos.ap-nanjing.myqcloud.com/0f4bd884-dc9c-4cf9-b59e-7d5958fec3dd.jpg', 1, '2022-06-19 14:29:05', 1067246875800000001, '2022-08-29 21:19:55', 0);
INSERT INTO `setmeal` VALUES (1523234624120139777, 1523224049252151297, '尖椒鸡+小菜+米饭', 1988.00, 1, '', '原料：大米、辣椒、青菜、鸡肉', 'https://mt-take-out-1259733126.cos.ap-nanjing.myqcloud.com/0f252364-a561-4e8d-8065-9a6797a6b1d3.jpg', 1, '2022-06-19 14:29:17', 1067246875800000001, '2022-08-29 21:19:55', 0);
INSERT INTO `setmeal` VALUES (1564250809707905025, 1523224049252151297, '测试套餐', 5000.00, 1, '001', '测试', 'https://mt-take-out-1259733126.cos.ap-nanjing.myqcloud.com/d1688fe2a91cda424852b88dd5f2679e.jpeg', 1067246875800000001, '2022-08-29 21:57:10', 1067246875800000001, '2022-08-29 22:19:58', 0);
INSERT INTO `setmeal` VALUES (1564264362565296130, 1523224049252151297, '测试测试', 3300.00, 1, '', '测试', 'https://mt-take-out-1259733126.cos.ap-nanjing.myqcloud.com/e476f679-5c15-436b-87fa-8c4e9644bf33.jpeg', 1067246875800000001, '2022-08-29 21:57:10', 1067246875800000001, '2022-08-29 22:16:46', 0);

-- ----------------------------
-- Table structure for setmeal_dish
-- ----------------------------
DROP TABLE IF EXISTS `setmeal_dish`;
CREATE TABLE `setmeal_dish`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `setmeal_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '套餐id ',
  `dish_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '菜品id',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '菜品名称 （冗余字段）',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '菜品原价（冗余字段）',
  `copies` int(0) NOT NULL COMMENT '份数',
  `sort` int(0) NOT NULL DEFAULT 0 COMMENT '排序',
  `creator` bigint(0) NOT NULL COMMENT '创建人',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `updater` bigint(0) NOT NULL COMMENT '修改人',
  `update_date` datetime(0) NOT NULL COMMENT '更新时间',
  `is_deleted` int(0) NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '套餐菜品关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of setmeal_dish
-- ----------------------------
INSERT INTO `setmeal_dish` VALUES (1538408506959384577, '1523234378937905154', '1523233618137296897', '珍珠米饭', 100.00, 1, 0, 1, '2022-06-19 14:29:05', 1, '2022-06-19 14:29:05', 0);
INSERT INTO `setmeal_dish` VALUES (1538408506959384578, '1523234378937905154', '1523229349560561666', '小炒肉（米饭单点）', 1380.00, 1, 0, 1, '2022-06-19 14:29:05', 1, '2022-06-19 14:29:05', 0);
INSERT INTO `setmeal_dish` VALUES (1538408555852386305, '1523234624120139777', '1523229489490931714', '尖椒鸡（米饭单点）', 1398.00, 1, 0, 1, '2022-06-19 14:29:17', 1, '2022-06-19 14:29:17', 0);
INSERT INTO `setmeal_dish` VALUES (1538408555852386306, '1523234624120139777', '1523233618137296897', '珍珠米饭', 100.00, 1, 0, 1, '2022-06-19 14:29:17', 1, '2022-06-19 14:29:17', 0);
INSERT INTO `setmeal_dish` VALUES (1538408624433451009, '1523233943468486658', '1523233618137296897', '珍珠米饭', 100.00, 1, 0, 1, '2022-06-19 14:29:33', 1, '2022-06-19 14:29:33', 0);
INSERT INTO `setmeal_dish` VALUES (1538408624433451010, '1523233943468486658', '1523227696245616641', '农家炒腊肉（米饭单点）', 1688.00, 1, 0, 1, '2022-06-19 14:29:33', 1, '2022-06-19 14:29:33', 0);
INSERT INTO `setmeal_dish` VALUES (1564264362590461954, '1564264362565296130', '1564251465613164545', '测试测试', 1100.00, 1, 0, 1067246875800000001, '2022-08-29 22:51:01', 1067246875800000001, '2022-08-29 22:51:01', 0);

-- ----------------------------
-- Table structure for shopping_cart
-- ----------------------------
DROP TABLE IF EXISTS `shopping_cart`;
CREATE TABLE `shopping_cart`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '名称',
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '图片',
  `user_id` bigint(0) NOT NULL COMMENT '主键',
  `dish_id` bigint(0) NULL DEFAULT NULL COMMENT '菜品id',
  `setmeal_id` bigint(0) NULL DEFAULT NULL COMMENT '套餐id',
  `dish_flavor` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '口味',
  `number` int(0) NOT NULL DEFAULT 1 COMMENT '数量',
  `amount` decimal(10, 2) NOT NULL COMMENT '金额',
  `creator` bigint(0) NULL DEFAULT NULL COMMENT '创建者',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` bigint(0) NULL DEFAULT NULL COMMENT '更新者',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '购物车' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shopping_cart
-- ----------------------------
INSERT INTO `shopping_cart` VALUES (1523375836910018561, '干锅鸡+米饭', 'https://mt-take-out-1259733126.cos.ap-nanjing.myqcloud.com/1405081e-f545-42e1-86a2-f7559ae2e276.jpeg', 1523365273903456258, 1523231271495512066, NULL, '重辣', 1, 19.80, 1523365273903456258, '2022-05-09 02:54:37', 1523365273903456258, '2022-05-09 02:54:37');
INSERT INTO `shopping_cart` VALUES (1523375851594276865, '怡宝', 'https://mt-take-out-1259733126.cos.ap-nanjing.myqcloud.com/c99e0aab-3cb7-4eaa-80fd-f47d4ffea694.png', 1523365273903456258, 1523233739667255298, NULL, NULL, 1, 2.00, 1523365273903456258, '2022-05-09 02:54:41', 1523365273903456258, '2022-05-09 02:54:41');
INSERT INTO `shopping_cart` VALUES (1533060367050199041, '尖椒鸡（米饭单点）', 'https://mt-take-out-1259733126.cos.ap-nanjing.myqcloud.com/2a2e9d66-b41d-4645-87bd-95f2cfeed218.jpg', 1530789235311808513, 1523229489490931714, NULL, NULL, 1, 13.98, 1530789235311808513, '2022-06-04 20:17:29', 1530789235311808513, '2022-06-04 20:17:29');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `id` bigint(0) NOT NULL COMMENT 'id',
  `pid` bigint(0) NULL DEFAULT NULL COMMENT '上级ID',
  `pids` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '所有上级ID，用逗号分开',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '部门名称',
  `sort` int unsigned NULL COMMENT '排序',
  `creator` bigint(0) NULL DEFAULT NULL COMMENT '创建者',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` bigint(0) NULL DEFAULT NULL COMMENT '更新者',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_pid`(`pid`) USING BTREE,
  INDEX `idx_sort`(`sort`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '部门管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (1067246875800000062, 1067246875800000063, '1067246875800000066,1067246875800000063', '技术部', 2, 1067246875800000001, '2023-06-09 19:00:49', 1067246875800000001, '2023-06-09 19:00:49');
INSERT INTO `sys_dept` VALUES (1067246875800000063, 1067246875800000066, '1067246875800000066', '长沙分公司', 1, 1067246875800000001, '2023-06-09 19:00:49', 1067246875800000001, '2023-06-09 19:00:49');
INSERT INTO `sys_dept` VALUES (1067246875800000064, 1067246875800000066, '1067246875800000066', '上海分公司', 0, 1067246875800000001, '2023-06-09 19:00:49', 1067246875800000001, '2023-06-09 19:00:49');
INSERT INTO `sys_dept` VALUES (1067246875800000065, 1067246875800000064, '1067246875800000066,1067246875800000064', '市场部', 0, 1067246875800000001, '2023-06-09 19:00:49', 1067246875800000001, '2023-06-09 19:00:49');
INSERT INTO `sys_dept` VALUES (1067246875800000066, 0, '0', '人人开源集团', 0, 1067246875800000001, '2023-06-09 19:00:49', 1067246875800000001, '2023-06-09 19:00:49');
INSERT INTO `sys_dept` VALUES (1067246875800000067, 1067246875800000064, '1067246875800000066,1067246875800000064', '销售部', 0, 1067246875800000001, '2023-06-09 19:00:49', 1067246875800000001, '2023-06-09 19:00:49');
INSERT INTO `sys_dept` VALUES (1067246875800000068, 1067246875800000063, '1067246875800000066,1067246875800000063', '产品部', 1, 1067246875800000001, '2023-06-09 19:00:49', 1067246875800000001, '2023-06-09 19:00:49');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `id` bigint(0) NOT NULL COMMENT 'id',
  `dict_type_id` bigint(0) NOT NULL COMMENT '字典类型ID',
  `dict_label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '字典标签',
  `dict_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '字典值',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `sort` int unsigned NULL COMMENT '排序',
  `creator` bigint(0) NULL DEFAULT NULL COMMENT '创建者',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` bigint(0) NULL DEFAULT NULL COMMENT '更新者',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_dict_type_value`(`dict_type_id`, `dict_value`) USING BTREE,
  INDEX `idx_sort`(`sort`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典数据' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1160061112075464705, 1160061077912858625, '男', '0', '', 0, 1067246875800000001, '2023-06-09 19:00:49', 1067246875800000001, '2023-06-09 19:00:49');
INSERT INTO `sys_dict_data` VALUES (1160061146967879681, 1160061077912858625, '女', '1', '', 1, 1067246875800000001, '2023-06-09 19:00:49', 1067246875800000001, '2023-06-09 19:00:49');
INSERT INTO `sys_dict_data` VALUES (1160061190127267841, 1160061077912858625, '保密', '2', '', 2, 1067246875800000001, '2023-06-09 19:00:49', 1067246875800000001, '2023-06-09 19:00:49');
INSERT INTO `sys_dict_data` VALUES (1225814069634195457, 1225813644059140097, '公告', '0', '', 0, 1067246875800000001, '2023-06-09 19:00:49', 1067246875800000001, '2023-06-09 19:00:49');
INSERT INTO `sys_dict_data` VALUES (1225814107559092225, 1225813644059140097, '会议', '1', '', 1, 1067246875800000001, '2023-06-09 19:00:49', 1067246875800000001, '2023-06-09 19:00:49');
INSERT INTO `sys_dict_data` VALUES (1225814271879340034, 1225813644059140097, '其他', '2', '', 2, 1067246875800000001, '2023-06-09 19:00:49', 1067246875800000001, '2023-06-09 19:00:49');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `id` bigint(0) NOT NULL COMMENT 'id',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '字典类型',
  `dict_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '字典名称',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `sort` int unsigned NULL COMMENT '排序',
  `creator` bigint(0) NULL DEFAULT NULL COMMENT '创建者',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` bigint(0) NULL DEFAULT NULL COMMENT '更新者',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典类型' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1160061077912858625, 'gender', '性别', '', 0, 1067246875800000001, '2023-06-09 19:00:49', 1067246875800000001, '2023-06-09 19:00:49');
INSERT INTO `sys_dict_type` VALUES (1225813644059140097, 'notice_type', '站内通知-类型', '', 1, 1067246875800000001, '2023-06-09 19:00:49', 1067246875800000001, '2023-06-09 19:00:49');

-- ----------------------------
-- Table structure for sys_log_error
-- ----------------------------
DROP TABLE IF EXISTS `sys_log_error`;
CREATE TABLE `sys_log_error`  (
  `id` bigint(0) NOT NULL COMMENT 'id',
  `request_uri` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '请求URI',
  `request_method` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '请求方式',
  `request_params` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '请求参数',
  `user_agent` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户代理',
  `ip` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '操作IP',
  `error_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '异常信息',
  `creator` bigint(0) NULL DEFAULT NULL COMMENT '创建者',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_create_date`(`create_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '异常日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_log_login
-- ----------------------------
DROP TABLE IF EXISTS `sys_log_login`;
CREATE TABLE `sys_log_login`  (
  `id` bigint(0) NOT NULL COMMENT 'id',
  `operation` tinyint unsigned NULL COMMENT '用户操作   0：用户登录   1：用户退出',
  `status` tinyint unsigned NOT NULL COMMENT '状态  0：失败    1：成功    2：账号已锁定',
  `user_agent` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户代理',
  `ip` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '操作IP',
  `creator_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户名',
  `creator` bigint(0) NULL DEFAULT NULL COMMENT '创建者',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE,
  INDEX `idx_create_date`(`create_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '登录日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_log_login
-- ----------------------------
INSERT INTO `sys_log_login` VALUES (1668885255721377794, 0, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', '0:0:0:0:0:0:0:1', 'admin', 1067246875800000001, '2023-06-14 15:37:06');

-- ----------------------------
-- Table structure for sys_log_operation
-- ----------------------------
DROP TABLE IF EXISTS `sys_log_operation`;
CREATE TABLE `sys_log_operation`  (
  `id` bigint(0) NOT NULL COMMENT 'id',
  `operation` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户操作',
  `request_uri` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '请求URI',
  `request_method` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '请求方式',
  `request_params` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '请求参数',
  `request_time` int unsigned NOT NULL COMMENT '请求时长(毫秒)',
  `user_agent` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户代理',
  `ip` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '操作IP',
  `status` tinyint unsigned NOT NULL COMMENT '状态  0：失败   1：成功',
  `creator_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户名',
  `creator` bigint(0) NULL DEFAULT NULL COMMENT '创建者',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_create_date`(`create_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '操作日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_log_operation
-- ----------------------------
INSERT INTO `sys_log_operation` VALUES (1668885397493047298, '修改', '/renren-admin/takeout/setmeal/', 'PUT', '{\"id\":1564250809707905025,\"categoryId\":1523224049252151297,\"name\":\"测试套餐\",\"price\":5000,\"status\":0,\"code\":\"001\",\"description\":\"测试\",\"image\":\"https://mt-take-out-1259733126.cos.ap-nanjing.myqcloud.com/d1688fe2a91cda424852b88dd5f2679e.jpeg\",\"creator\":1067246875800000001,\"createDate\":1661781430000,\"updater\":1067246875800000001,\"updateDate\":1661782798000,\"isDeleted\":0}', 18, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', '0:0:0:0:0:0:0:1', 1, 'admin', 1067246875800000001, '2023-06-14 15:37:40');
INSERT INTO `sys_log_operation` VALUES (1668885437984858114, '修改', '/renren-admin/takeout/setmeal/', 'PUT', '{\"id\":1564250809707905025,\"categoryId\":1523224049252151297,\"name\":\"测试套餐\",\"price\":5000,\"status\":1,\"code\":\"001\",\"description\":\"测试\",\"image\":\"https://mt-take-out-1259733126.cos.ap-nanjing.myqcloud.com/d1688fe2a91cda424852b88dd5f2679e.jpeg\",\"creator\":1067246875800000001,\"createDate\":1661781430000,\"updater\":1067246875800000001,\"updateDate\":1661782798000,\"isDeleted\":0}', 13, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', '0:0:0:0:0:0:0:1', 1, 'admin', 1067246875800000001, '2023-06-14 15:37:49');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` bigint(0) NOT NULL COMMENT 'id',
  `pid` bigint(0) NULL DEFAULT NULL COMMENT '上级ID，一级菜单为0',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '名称',
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '菜单URL',
  `permissions` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：sys:user:list,sys:user:save)',
  `menu_type` tinyint unsigned NULL COMMENT '类型   0：菜单   1：按钮',
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `sort` int(0) NULL DEFAULT NULL COMMENT '排序',
  `creator` bigint(0) NULL DEFAULT NULL COMMENT '创建者',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` bigint(0) NULL DEFAULT NULL COMMENT '更新者',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_pid`(`pid`) USING BTREE,
  INDEX `idx_sort`(`sort`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1067246875800000002, 0, '权限管理', NULL, NULL, 0, 'icon-safetycertificate', 3, 1067246875800000001, '2023-06-09 19:00:49', 1067246875800000001, '2023-06-09 19:14:57');
INSERT INTO `sys_menu` VALUES (1067246875800000003, 1067246875800000055, '新增', NULL, 'sys:user:save,sys:dept:list,sys:role:list', 1, NULL, 1, 1067246875800000001, '2023-06-09 19:00:49', 1067246875800000001, '2023-06-09 19:00:49');
INSERT INTO `sys_menu` VALUES (1067246875800000004, 1067246875800000055, '修改', NULL, 'sys:user:update,sys:dept:list,sys:role:list', 1, NULL, 2, 1067246875800000001, '2023-06-09 19:00:49', 1067246875800000001, '2023-06-09 19:00:49');
INSERT INTO `sys_menu` VALUES (1067246875800000005, 1067246875800000055, '删除', NULL, 'sys:user:delete', 1, NULL, 3, 1067246875800000001, '2023-06-09 19:00:49', 1067246875800000001, '2023-06-09 19:00:49');
INSERT INTO `sys_menu` VALUES (1067246875800000006, 1067246875800000055, '导出', NULL, 'sys:user:export', 1, NULL, 4, 1067246875800000001, '2023-06-09 19:00:49', 1067246875800000001, '2023-06-09 19:00:49');
INSERT INTO `sys_menu` VALUES (1067246875800000007, 1067246875800000002, '角色管理', 'sys/role', NULL, 0, 'icon-team', 2, 1067246875800000001, '2023-06-09 19:00:49', 1067246875800000001, '2023-06-09 19:00:49');
INSERT INTO `sys_menu` VALUES (1067246875800000008, 1067246875800000007, '查看', NULL, 'sys:role:page,sys:role:info', 1, NULL, 0, 1067246875800000001, '2023-06-09 19:00:49', 1067246875800000001, '2023-06-09 19:00:49');
INSERT INTO `sys_menu` VALUES (1067246875800000009, 1067246875800000007, '新增', NULL, 'sys:role:save,sys:menu:select,sys:dept:list', 1, NULL, 1, 1067246875800000001, '2023-06-09 19:00:49', 1067246875800000001, '2023-06-09 19:00:49');
INSERT INTO `sys_menu` VALUES (1067246875800000010, 1067246875800000007, '修改', NULL, 'sys:role:update,sys:menu:select,sys:dept:list', 1, NULL, 2, 1067246875800000001, '2023-06-09 19:00:49', 1067246875800000001, '2023-06-09 19:00:49');
INSERT INTO `sys_menu` VALUES (1067246875800000011, 1067246875800000007, '删除', NULL, 'sys:role:delete', 1, NULL, 3, 1067246875800000001, '2023-06-09 19:00:49', 1067246875800000001, '2023-06-09 19:00:49');
INSERT INTO `sys_menu` VALUES (1067246875800000012, 1067246875800000002, '部门管理', 'sys/dept', NULL, 0, 'icon-apartment', 1, 1067246875800000001, '2023-06-09 19:00:49', 1067246875800000001, '2023-06-09 19:00:49');
INSERT INTO `sys_menu` VALUES (1067246875800000014, 1067246875800000012, '查看', NULL, 'sys:dept:list,sys:dept:info', 1, NULL, 0, 1067246875800000001, '2023-06-09 19:00:49', 1067246875800000001, '2023-06-09 19:00:49');
INSERT INTO `sys_menu` VALUES (1067246875800000015, 1067246875800000012, '新增', NULL, 'sys:dept:save', 1, NULL, 1, 1067246875800000001, '2023-06-09 19:00:49', 1067246875800000001, '2023-06-09 19:00:49');
INSERT INTO `sys_menu` VALUES (1067246875800000016, 1067246875800000012, '修改', NULL, 'sys:dept:update', 1, NULL, 2, 1067246875800000001, '2023-06-09 19:00:49', 1067246875800000001, '2023-06-09 19:00:49');
INSERT INTO `sys_menu` VALUES (1067246875800000017, 1067246875800000012, '删除', NULL, 'sys:dept:delete', 1, NULL, 3, 1067246875800000001, '2023-06-09 19:00:49', 1067246875800000001, '2023-06-09 19:00:49');
INSERT INTO `sys_menu` VALUES (1067246875800000025, 1067246875800000035, '菜单管理', 'sys/menu', NULL, 0, 'icon-unorderedlist', 0, 1067246875800000001, '2023-06-09 19:00:49', 1067246875800000001, '2023-06-09 19:00:49');
INSERT INTO `sys_menu` VALUES (1067246875800000026, 1067246875800000025, '查看', NULL, 'sys:menu:list,sys:menu:info', 1, NULL, 0, 1067246875800000001, '2023-06-09 19:00:49', 1067246875800000001, '2023-06-09 19:00:49');
INSERT INTO `sys_menu` VALUES (1067246875800000027, 1067246875800000025, '新增', NULL, 'sys:menu:save', 1, NULL, 1, 1067246875800000001, '2023-06-09 19:00:49', 1067246875800000001, '2023-06-09 19:00:49');
INSERT INTO `sys_menu` VALUES (1067246875800000028, 1067246875800000025, '修改', NULL, 'sys:menu:update', 1, NULL, 2, 1067246875800000001, '2023-06-09 19:00:49', 1067246875800000001, '2023-06-09 19:00:49');
INSERT INTO `sys_menu` VALUES (1067246875800000029, 1067246875800000025, '删除', NULL, 'sys:menu:delete', 1, NULL, 3, 1067246875800000001, '2023-06-09 19:00:49', 1067246875800000001, '2023-06-09 19:00:49');
INSERT INTO `sys_menu` VALUES (1067246875800000030, 1067246875800000035, '定时任务', 'job/schedule', NULL, 0, 'icon-dashboard', 3, 1067246875800000001, '2023-06-09 19:00:49', 1067246875800000001, '2023-06-09 19:00:49');
INSERT INTO `sys_menu` VALUES (1067246875800000031, 1067246875800000030, '查看', NULL, 'sys:schedule:page,sys:schedule:info', 1, NULL, 0, 1067246875800000001, '2023-06-09 19:00:49', 1067246875800000001, '2023-06-09 19:00:49');
INSERT INTO `sys_menu` VALUES (1067246875800000032, 1067246875800000030, '新增', NULL, 'sys:schedule:save', 1, NULL, 1, 1067246875800000001, '2023-06-09 19:00:49', 1067246875800000001, '2023-06-09 19:00:49');
INSERT INTO `sys_menu` VALUES (1067246875800000033, 1067246875800000030, '修改', NULL, 'sys:schedule:update', 1, NULL, 2, 1067246875800000001, '2023-06-09 19:00:49', 1067246875800000001, '2023-06-09 19:00:49');
INSERT INTO `sys_menu` VALUES (1067246875800000034, 1067246875800000030, '删除', NULL, 'sys:schedule:delete', 1, NULL, 3, 1067246875800000001, '2023-06-09 19:00:49', 1067246875800000001, '2023-06-09 19:00:49');
INSERT INTO `sys_menu` VALUES (1067246875800000035, 0, '系统设置', NULL, NULL, 0, 'icon-setting', 3, 1067246875800000001, '2023-06-09 19:00:49', 1067246875800000001, '2023-06-09 19:05:39');
INSERT INTO `sys_menu` VALUES (1067246875800000036, 1067246875800000030, '暂停', NULL, 'sys:schedule:pause', 1, NULL, 4, 1067246875800000001, '2023-06-09 19:00:49', 1067246875800000001, '2023-06-09 19:00:49');
INSERT INTO `sys_menu` VALUES (1067246875800000037, 1067246875800000030, '恢复', NULL, 'sys:schedule:resume', 1, NULL, 5, 1067246875800000001, '2023-06-09 19:00:49', 1067246875800000001, '2023-06-09 19:00:49');
INSERT INTO `sys_menu` VALUES (1067246875800000038, 1067246875800000030, '立即执行', NULL, 'sys:schedule:run', 1, NULL, 6, 1067246875800000001, '2023-06-09 19:00:49', 1067246875800000001, '2023-06-09 19:00:49');
INSERT INTO `sys_menu` VALUES (1067246875800000039, 1067246875800000030, '日志列表', NULL, 'sys:schedule:log', 1, NULL, 7, 1067246875800000001, '2023-06-09 19:00:49', 1067246875800000001, '2023-06-09 19:00:49');
INSERT INTO `sys_menu` VALUES (1067246875800000040, 1067246875800000035, '参数管理', 'sys/params', '', 0, 'icon-fileprotect', 1, 1067246875800000001, '2023-06-09 19:00:49', 1067246875800000001, '2023-06-09 19:00:49');
INSERT INTO `sys_menu` VALUES (1067246875800000041, 1067246875800000035, '字典管理', 'sys/dict-type', NULL, 0, 'icon-golden-fill', 2, 1067246875800000001, '2023-06-09 19:00:49', 1067246875800000001, '2023-06-09 19:00:49');
INSERT INTO `sys_menu` VALUES (1067246875800000042, 1067246875800000041, '查看', NULL, 'sys:dict:page,sys:dict:info', 1, NULL, 0, 1067246875800000001, '2023-06-09 19:00:49', 1067246875800000001, '2023-06-09 19:00:49');
INSERT INTO `sys_menu` VALUES (1067246875800000043, 1067246875800000041, '新增', NULL, 'sys:dict:save', 1, NULL, 1, 1067246875800000001, '2023-06-09 19:00:49', 1067246875800000001, '2023-06-09 19:00:49');
INSERT INTO `sys_menu` VALUES (1067246875800000044, 1067246875800000041, '修改', NULL, 'sys:dict:update', 1, NULL, 2, 1067246875800000001, '2023-06-09 19:00:49', 1067246875800000001, '2023-06-09 19:00:49');
INSERT INTO `sys_menu` VALUES (1067246875800000045, 1067246875800000041, '删除', NULL, 'sys:dict:delete', 1, NULL, 3, 1067246875800000001, '2023-06-09 19:00:49', 1067246875800000001, '2023-06-09 19:00:49');
INSERT INTO `sys_menu` VALUES (1067246875800000046, 0, '日志管理', NULL, NULL, 0, 'icon-container', 3, 1067246875800000001, '2023-06-09 19:00:49', 1067246875800000001, '2023-06-09 19:05:45');
INSERT INTO `sys_menu` VALUES (1067246875800000047, 1067246875800000035, '文件上传', 'oss/oss', 'sys:oss:all', 0, 'icon-upload', 4, 1067246875800000001, '2023-06-09 19:00:49', 1067246875800000001, '2023-06-09 19:00:49');
INSERT INTO `sys_menu` VALUES (1067246875800000048, 1067246875800000046, '登录日志', 'sys/log-login', 'sys:log:login', 0, 'icon-filedone', 0, 1067246875800000001, '2023-06-09 19:00:49', 1067246875800000001, '2023-06-09 19:00:49');
INSERT INTO `sys_menu` VALUES (1067246875800000049, 1067246875800000046, '操作日志', 'sys/log-operation', 'sys:log:operation', 0, 'icon-solution', 1, 1067246875800000001, '2023-06-09 19:00:49', 1067246875800000001, '2023-06-09 19:00:49');
INSERT INTO `sys_menu` VALUES (1067246875800000050, 1067246875800000046, '异常日志', 'sys/log-error', 'sys:log:error', 0, 'icon-file-exception', 2, 1067246875800000001, '2023-06-09 19:00:49', 1067246875800000001, '2023-06-09 19:00:49');
INSERT INTO `sys_menu` VALUES (1067246875800000051, 1067246875800000053, 'SQL监控', '{{ window.SITE_CONFIG[\"apiURL\"] }}/druid/sql.html', NULL, 0, 'icon-database', 0, 1067246875800000001, '2023-06-09 19:00:49', 1067246875800000001, '2023-06-09 19:00:49');
INSERT INTO `sys_menu` VALUES (1067246875800000053, 0, '系统监控', NULL, NULL, 0, 'icon-desktop', 3, 1067246875800000001, '2023-06-09 19:00:49', 1067246875800000001, '2023-06-09 19:05:49');
INSERT INTO `sys_menu` VALUES (1067246875800000055, 1067246875800000002, '用户管理', 'sys/user', NULL, 0, 'icon-user', 0, 1067246875800000001, '2023-06-09 19:00:49', 1067246875800000001, '2023-06-09 19:00:49');
INSERT INTO `sys_menu` VALUES (1067246875800000056, 1067246875800000055, '查看', NULL, 'sys:user:page,sys:user:info', 1, NULL, 0, 1067246875800000001, '2023-06-09 19:00:49', 1067246875800000001, '2023-06-09 19:00:49');
INSERT INTO `sys_menu` VALUES (1067246875800000057, 1067246875800000040, '新增', NULL, 'sys:params:save', 1, NULL, 1, 1067246875800000001, '2023-06-09 19:00:49', 1067246875800000001, '2023-06-09 19:00:49');
INSERT INTO `sys_menu` VALUES (1067246875800000058, 1067246875800000040, '导出', NULL, 'sys:params:export', 1, NULL, 4, 1067246875800000001, '2023-06-09 19:00:49', 1067246875800000001, '2023-06-09 19:00:49');
INSERT INTO `sys_menu` VALUES (1067246875800000059, 1067246875800000040, '查看', '', 'sys:params:page,sys:params:info', 1, NULL, 0, 1067246875800000001, '2023-06-09 19:00:49', 1067246875800000001, '2023-06-09 19:00:49');
INSERT INTO `sys_menu` VALUES (1067246875800000060, 1067246875800000040, '修改', NULL, 'sys:params:update', 1, NULL, 2, 1067246875800000001, '2023-06-09 19:00:49', 1067246875800000001, '2023-06-09 19:00:49');
INSERT INTO `sys_menu` VALUES (1067246875800000061, 1067246875800000040, '删除', '', 'sys:params:delete', 1, '', 3, 1067246875800000001, '2023-06-09 19:00:49', 1067246875800000001, '2023-06-09 19:00:49');
INSERT INTO `sys_menu` VALUES (1156748733921165314, 1067246875800000053, '接口文档', '{{ window.SITE_CONFIG[\"apiURL\"] }}/doc.html', '', 0, 'icon-file-word', 1, 1067246875800000001, '2023-06-09 19:00:49', 1067246875800000001, '2023-06-09 19:00:49');
INSERT INTO `sys_menu` VALUES (1667117354689961986, 0, '用户信息', 'takeout/user', NULL, 0, 'icon-desktop', 0, 1067246875800000001, '2023-06-09 19:01:46', 1067246875800000001, '2023-06-09 19:02:28');
INSERT INTO `sys_menu` VALUES (1667117354689961987, 1667117354689961986, '查看', NULL, 'takeout:user:page,takeout:user:info', 1, NULL, 0, 1067246875800000001, '2023-06-09 19:01:46', 1067246875800000001, '2023-06-09 19:01:46');
INSERT INTO `sys_menu` VALUES (1667117354689961988, 1667117354689961986, '新增', NULL, 'takeout:user:save', 1, NULL, 1, 1067246875800000001, '2023-06-09 19:01:46', 1067246875800000001, '2023-06-09 19:01:46');
INSERT INTO `sys_menu` VALUES (1667117354689961989, 1667117354689961986, '修改', NULL, 'takeout:user:update', 1, NULL, 2, 1067246875800000001, '2023-06-09 19:01:46', 1067246875800000001, '2023-06-09 19:01:46');
INSERT INTO `sys_menu` VALUES (1667117354689961990, 1667117354689961986, '删除', NULL, 'takeout:user:delete', 1, NULL, 3, 1067246875800000001, '2023-06-09 19:01:46', 1067246875800000001, '2023-06-09 19:01:46');
INSERT INTO `sys_menu` VALUES (1667117354689961991, 1667117354689961986, '导出', NULL, 'takeout:user:export', 1, NULL, 4, 1067246875800000001, '2023-06-09 19:01:46', 1067246875800000001, '2023-06-09 19:01:46');
INSERT INTO `sys_menu` VALUES (1667117354887094274, 0, '套餐管理', 'takeout/setmeal', NULL, 0, 'icon-desktop', 1, 1067246875800000001, '2023-06-09 19:01:46', 1067246875800000001, '2023-06-09 19:03:16');
INSERT INTO `sys_menu` VALUES (1667117354887094275, 1667117354887094274, '查看', NULL, 'takeout:setmeal:page,takeout:setmeal:info', 1, NULL, 0, 1067246875800000001, '2023-06-09 19:01:46', 1067246875800000001, '2023-06-09 19:01:46');
INSERT INTO `sys_menu` VALUES (1667117354887094276, 1667117354887094274, '新增', NULL, 'takeout:setmeal:save', 1, NULL, 1, 1067246875800000001, '2023-06-09 19:01:46', 1067246875800000001, '2023-06-09 19:01:46');
INSERT INTO `sys_menu` VALUES (1667117354887094277, 1667117354887094274, '修改', NULL, 'takeout:setmeal:update', 1, NULL, 2, 1067246875800000001, '2023-06-09 19:01:46', 1067246875800000001, '2023-06-09 19:01:46');
INSERT INTO `sys_menu` VALUES (1667117354887094278, 1667117354887094274, '删除', NULL, 'takeout:setmeal:delete', 1, NULL, 3, 1067246875800000001, '2023-06-09 19:01:46', 1067246875800000001, '2023-06-09 19:01:46');
INSERT INTO `sys_menu` VALUES (1667117354887094279, 1667117354887094274, '导出', NULL, 'takeout:setmeal:export', 1, NULL, 4, 1067246875800000001, '2023-06-09 19:01:46', 1067246875800000001, '2023-06-09 19:01:46');
INSERT INTO `sys_menu` VALUES (1667117355218444289, 0, '订单管理', 'takeout/orders', NULL, 0, 'icon-desktop', 2, 1067246875800000001, '2023-06-09 19:01:47', 1067246875800000001, '2023-06-09 19:05:26');
INSERT INTO `sys_menu` VALUES (1667117355218444290, 1667117355218444289, '查看', NULL, 'takeout:orders:page,takeout:orders:info', 1, NULL, 0, 1067246875800000001, '2023-06-09 19:01:47', 1067246875800000001, '2023-06-09 19:01:47');
INSERT INTO `sys_menu` VALUES (1667117355218444291, 1667117355218444289, '新增', NULL, 'takeout:orders:save', 1, NULL, 1, 1067246875800000001, '2023-06-09 19:01:47', 1067246875800000001, '2023-06-09 19:01:47');
INSERT INTO `sys_menu` VALUES (1667117355218444292, 1667117355218444289, '修改', NULL, 'takeout:orders:update', 1, NULL, 2, 1067246875800000001, '2023-06-09 19:01:47', 1067246875800000001, '2023-06-09 19:01:47');
INSERT INTO `sys_menu` VALUES (1667117355218444293, 1667117355218444289, '删除', NULL, 'takeout:orders:delete', 1, NULL, 3, 1067246875800000001, '2023-06-09 19:01:47', 1067246875800000001, '2023-06-09 19:01:47');
INSERT INTO `sys_menu` VALUES (1667117355218444294, 1667117355218444289, '导出', NULL, 'takeout:orders:export', 1, NULL, 4, 1067246875800000001, '2023-06-09 19:01:47', 1067246875800000001, '2023-06-09 19:01:47');
INSERT INTO `sys_menu` VALUES (1667117355344273409, 0, '菜品管理', 'takeout/dish', NULL, 0, 'icon-desktop', 0, 1067246875800000001, '2023-06-09 19:01:46', 1067246875800000001, '2023-06-09 19:02:51');
INSERT INTO `sys_menu` VALUES (1667117355344273410, 1667117355344273409, '查看', NULL, 'takeout:dish:page,takeout:dish:info', 1, NULL, 0, 1067246875800000001, '2023-06-09 19:01:46', 1067246875800000001, '2023-06-09 19:01:46');
INSERT INTO `sys_menu` VALUES (1667117355344273411, 1667117355344273409, '新增', NULL, 'takeout:dish:save', 1, NULL, 1, 1067246875800000001, '2023-06-09 19:01:46', 1067246875800000001, '2023-06-09 19:01:46');
INSERT INTO `sys_menu` VALUES (1667117355344273412, 1667117355344273409, '修改', NULL, 'takeout:dish:update', 1, NULL, 2, 1067246875800000001, '2023-06-09 19:01:46', 1067246875800000001, '2023-06-09 19:01:46');
INSERT INTO `sys_menu` VALUES (1667117355344273413, 1667117355344273409, '删除', NULL, 'takeout:dish:delete', 1, NULL, 3, 1067246875800000001, '2023-06-09 19:01:46', 1067246875800000001, '2023-06-09 19:01:46');
INSERT INTO `sys_menu` VALUES (1667117355344273414, 1667117355344273409, '导出', NULL, 'takeout:dish:export', 1, NULL, 4, 1067246875800000001, '2023-06-09 19:01:46', 1067246875800000001, '2023-06-09 19:01:46');
INSERT INTO `sys_menu` VALUES (1667117355474296833, 0, '菜品及套餐分类管理', 'takeout/category', NULL, 0, 'icon-desktop', 1, 1067246875800000001, '2023-06-09 19:01:47', 1067246875800000001, '2023-06-09 19:05:11');
INSERT INTO `sys_menu` VALUES (1667117355474296834, 1667117355474296833, '查看', NULL, 'takeout:category:page,takeout:category:info', 1, NULL, 0, 1067246875800000001, '2023-06-09 19:01:47', 1067246875800000001, '2023-06-09 19:01:47');
INSERT INTO `sys_menu` VALUES (1667117355474296835, 1667117355474296833, '新增', NULL, 'takeout:category:save', 1, NULL, 1, 1067246875800000001, '2023-06-09 19:01:47', 1067246875800000001, '2023-06-09 19:01:47');
INSERT INTO `sys_menu` VALUES (1667117355474296836, 1667117355474296833, '修改', NULL, 'takeout:category:update', 1, NULL, 2, 1067246875800000001, '2023-06-09 19:01:47', 1067246875800000001, '2023-06-09 19:01:47');
INSERT INTO `sys_menu` VALUES (1667117355474296837, 1667117355474296833, '删除', NULL, 'takeout:category:delete', 1, NULL, 3, 1067246875800000001, '2023-06-09 19:01:47', 1067246875800000001, '2023-06-09 19:01:47');
INSERT INTO `sys_menu` VALUES (1667117355474296838, 1667117355474296833, '导出', NULL, 'takeout:category:export', 1, NULL, 4, 1067246875800000001, '2023-06-09 19:01:47', 1067246875800000001, '2023-06-09 19:01:47');
INSERT INTO `sys_menu` VALUES (1667117355537211394, 0, '地址管理', 'takeout/addressbook', NULL, 0, 'icon-desktop', 0, 1067246875800000001, '2023-06-09 19:01:46', 1067246875800000001, '2023-06-09 19:02:59');
INSERT INTO `sys_menu` VALUES (1667117355537211395, 1667117355537211394, '查看', NULL, 'takeout:addressbook:page,takeout:addressbook:info', 1, NULL, 0, 1067246875800000001, '2023-06-09 19:01:46', 1067246875800000001, '2023-06-09 19:01:46');
INSERT INTO `sys_menu` VALUES (1667117355537211396, 1667117355537211394, '新增', NULL, 'takeout:addressbook:save', 1, NULL, 1, 1067246875800000001, '2023-06-09 19:01:46', 1067246875800000001, '2023-06-09 19:01:46');
INSERT INTO `sys_menu` VALUES (1667117355537211397, 1667117355537211394, '修改', NULL, 'takeout:addressbook:update', 1, NULL, 2, 1067246875800000001, '2023-06-09 19:01:46', 1067246875800000001, '2023-06-09 19:01:46');
INSERT INTO `sys_menu` VALUES (1667117355537211398, 1667117355537211394, '删除', NULL, 'takeout:addressbook:delete', 1, NULL, 3, 1067246875800000001, '2023-06-09 19:01:46', 1067246875800000001, '2023-06-09 19:01:46');
INSERT INTO `sys_menu` VALUES (1667117355537211399, 1667117355537211394, '导出', NULL, 'takeout:addressbook:export', 1, NULL, 4, 1067246875800000001, '2023-06-09 19:01:46', 1067246875800000001, '2023-06-09 19:01:46');

-- ----------------------------
-- Table structure for sys_oss
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss`;
CREATE TABLE `sys_oss`  (
  `id` bigint(0) NOT NULL COMMENT 'id',
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'URL地址',
  `creator` bigint(0) NULL DEFAULT NULL COMMENT '创建者',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_create_date`(`create_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '文件上传' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_params
-- ----------------------------
DROP TABLE IF EXISTS `sys_params`;
CREATE TABLE `sys_params`  (
  `id` bigint(0) NOT NULL COMMENT 'id',
  `param_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '参数编码',
  `param_value` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '参数值',
  `param_type` tinyint unsigned NULL COMMENT '类型   0：系统参数   1：非系统参数',
  `remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `creator` bigint(0) NULL DEFAULT NULL COMMENT '创建者',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` bigint(0) NULL DEFAULT NULL COMMENT '更新者',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_param_code`(`param_code`) USING BTREE,
  INDEX `idx_create_date`(`create_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '参数管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_params
-- ----------------------------
INSERT INTO `sys_params` VALUES (1067246875800000073, 'CLOUD_STORAGE_CONFIG_KEY', '{\"type\":1,\"qiniuDomain\":\"http://test.oss.renren.io\",\"qiniuPrefix\":\"upload\",\"qiniuAccessKey\":\"NrgMfABZxWLo5B-YYSjoE8-AZ1EISdi1Z3ubLOeZ\",\"qiniuSecretKey\":\"uIwJHevMRWU0VLxFvgy0tAcOdGqasdtVlJkdy6vV\",\"qiniuBucketName\":\"renren-oss\",\"aliyunDomain\":\"\",\"aliyunPrefix\":\"\",\"aliyunEndPoint\":\"\",\"aliyunAccessKeyId\":\"\",\"aliyunAccessKeySecret\":\"\",\"aliyunBucketName\":\"\",\"qcloudDomain\":\"\",\"qcloudPrefix\":\"\",\"qcloudSecretId\":\"\",\"qcloudSecretKey\":\"\",\"qcloudBucketName\":\"\"}', 0, '云存储配置信息', 1067246875800000001, '2023-06-09 19:00:49', 1067246875800000001, '2023-06-09 19:00:49');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` bigint(0) NOT NULL COMMENT 'id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `dept_id` bigint(0) NULL DEFAULT NULL COMMENT '部门ID',
  `creator` bigint(0) NULL DEFAULT NULL COMMENT '创建者',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` bigint(0) NULL DEFAULT NULL COMMENT '更新者',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_dept_id`(`dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_role_data_scope
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_data_scope`;
CREATE TABLE `sys_role_data_scope`  (
  `id` bigint(0) NOT NULL COMMENT 'id',
  `role_id` bigint(0) NULL DEFAULT NULL COMMENT '角色ID',
  `dept_id` bigint(0) NULL DEFAULT NULL COMMENT '部门ID',
  `creator` bigint(0) NULL DEFAULT NULL COMMENT '创建者',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_role_id`(`role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色数据权限' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `id` bigint(0) NOT NULL COMMENT 'id',
  `role_id` bigint(0) NULL DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(0) NULL DEFAULT NULL COMMENT '菜单ID',
  `creator` bigint(0) NULL DEFAULT NULL COMMENT '创建者',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_role_id`(`role_id`) USING BTREE,
  INDEX `idx_menu_id`(`menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色菜单关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_role_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_user`;
CREATE TABLE `sys_role_user`  (
  `id` bigint(0) NOT NULL COMMENT 'id',
  `role_id` bigint(0) NULL DEFAULT NULL COMMENT '角色ID',
  `user_id` bigint(0) NULL DEFAULT NULL COMMENT '用户ID',
  `creator` bigint(0) NULL DEFAULT NULL COMMENT '创建者',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_role_id`(`role_id`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色用户关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` bigint(0) NOT NULL COMMENT 'id',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '密码',
  `real_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '姓名',
  `head_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '头像',
  `gender` tinyint unsigned NULL COMMENT '性别   0：男   1：女    2：保密',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '手机号',
  `dept_id` bigint(0) NULL DEFAULT NULL COMMENT '部门ID',
  `super_admin` tinyint unsigned NULL COMMENT '超级管理员   0：否   1：是',
  `status` tinyint(0) NULL DEFAULT NULL COMMENT '状态  0：停用   1：正常',
  `creator` bigint(0) NULL DEFAULT NULL COMMENT '创建者',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` bigint(0) NULL DEFAULT NULL COMMENT '更新者',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_username`(`username`) USING BTREE,
  INDEX `idx_create_date`(`create_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1067246875800000001, 'admin', '$2a$10$012Kx2ba5jzqr9gLlG4MX.bnQJTD9UWqF57XDo2N3.fPtLne02u/m', '管理员', NULL, 0, 'root@renren.io', '13612345678', NULL, 1, 1, 1067246875800000001, '2023-06-09 19:00:49', 1067246875800000001, '2023-06-09 19:00:49');

-- ----------------------------
-- Table structure for sys_user_token
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_token`;
CREATE TABLE `sys_user_token`  (
  `id` bigint(0) NOT NULL COMMENT 'id',
  `user_id` bigint(0) NOT NULL COMMENT '用户id',
  `token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户token',
  `expire_date` datetime(0) NULL DEFAULT NULL COMMENT '过期时间',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id`) USING BTREE,
  UNIQUE INDEX `token`(`token`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统用户Token' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_token
-- ----------------------------
INSERT INTO `sys_user_token` VALUES (1667124900934565889, 1067246875800000001, '1904c2b953248bb8ab8f62bbc90d00e4', '2023-06-15 03:37:06', '2023-06-14 15:37:06', '2023-06-09 19:02:05');

-- ----------------------------
-- Table structure for tb_token
-- ----------------------------
DROP TABLE IF EXISTS `tb_token`;
CREATE TABLE `tb_token`  (
  `id` bigint(0) NOT NULL COMMENT 'id',
  `user_id` bigint(0) NOT NULL COMMENT '用户ID',
  `token` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'token',
  `expire_date` datetime(0) NULL DEFAULT NULL COMMENT '过期时间',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id`) USING BTREE,
  UNIQUE INDEX `token`(`token`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户Token' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_token
-- ----------------------------
INSERT INTO `tb_token` VALUES (1562819873267068930, 1562819873229320194, 'decff2481e9d41b3a1402d54b6a5d6ab', '2022-08-26 11:11:08', '2022-08-25 23:11:08');
INSERT INTO `tb_token` VALUES (1562837457970499586, 1534405913534889985, 'd58caef22a7f4947a72dc18ee18497ae', '2022-08-28 08:29:40', '2022-08-27 20:29:40');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '姓名',
  `phone` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '手机号',
  `gender` tinyint(0) NULL DEFAULT NULL COMMENT '性别 0：男 1：女 2：保密',
  `id_number` varchar(18) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '身份证号',
  `avatar_url` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '头像',
  `status` tinyint(0) NULL DEFAULT 1 COMMENT '状态 0:禁用，1:正常',
  `openid` varchar(90) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '微信openid',
  `nick_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '微信昵称',
  `creator` bigint(0) NULL DEFAULT NULL COMMENT '创建者',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` bigint(0) NULL DEFAULT NULL COMMENT '更新者',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1668247645219012609, NULL, '1029606625@qq.com', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
