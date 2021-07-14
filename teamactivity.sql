/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80025
 Source Host           : localhost:3306
 Source Schema         : teamactivity

 Target Server Type    : MySQL
 Target Server Version : 80025
 File Encoding         : 65001

 Date: 13/07/2021 17:50:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_activity
-- ----------------------------
DROP TABLE IF EXISTS `tb_activity`;
CREATE TABLE `tb_activity`  (
  `ac_id` int NOT NULL AUTO_INCREMENT COMMENT '活动id',
  `ac_title` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动标题',
  `ac_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动描述',
  `ac_per` int NULL DEFAULT NULL COMMENT '活动发起人',
  `ac_create_time` datetime NULL DEFAULT NULL COMMENT '活动创建时间',
  `ac_start_time` datetime NULL DEFAULT NULL COMMENT '活动开始时间',
  `ac_end_time` datetime NULL DEFAULT NULL COMMENT '活动结束时间',
  `ac_count` int NULL DEFAULT NULL COMMENT '报名人数',
  `ac_status` int NULL DEFAULT NULL COMMENT '审核状态：0未审核，1通过，2未通过',
  `ac_money` int NULL DEFAULT NULL COMMENT '初始金额',
  `ac_opinion` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核意见',
  PRIMARY KEY (`ac_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tb_activity
-- ----------------------------
INSERT INTO `tb_activity` VALUES (21, '啊实打实的', '啊实打实大师', 50, '2021-07-12 00:11:13', '2021-07-12 16:00:00', '2021-07-31 16:00:00', 8, 1, 999, NULL);
INSERT INTO `tb_activity` VALUES (22, '阿达', '阿萨德撒发', 51, '2021-07-12 00:13:56', '2021-07-06 16:00:00', '2021-07-31 16:00:00', 88, 1, 88888, NULL);
INSERT INTO `tb_activity` VALUES (23, '西八一日游', '是', 44, '2021-07-13 09:46:25', '2021-07-22 16:00:00', '2021-11-05 16:00:00', 1, 1, 88888, NULL);

-- ----------------------------
-- Table structure for tb_activity_join
-- ----------------------------
DROP TABLE IF EXISTS `tb_activity_join`;
CREATE TABLE `tb_activity_join`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `ac_id` int NULL DEFAULT NULL COMMENT '活动id',
  `user_id` int NULL DEFAULT NULL COMMENT '参加活动的人员id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tb_activity_join
-- ----------------------------
INSERT INTO `tb_activity_join` VALUES (45, 21, 50);
INSERT INTO `tb_activity_join` VALUES (47, 22, 51);
INSERT INTO `tb_activity_join` VALUES (48, 21, 44);
INSERT INTO `tb_activity_join` VALUES (49, 22, 44);
INSERT INTO `tb_activity_join` VALUES (50, 23, 44);

-- ----------------------------
-- Table structure for tb_ass
-- ----------------------------
DROP TABLE IF EXISTS `tb_ass`;
CREATE TABLE `tb_ass`  (
  `ass_id` int NOT NULL AUTO_INCREMENT COMMENT '校友会ID',
  `ass_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '校友会名字',
  `ass_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '校友会简介',
  `ass_per` int NULL DEFAULT NULL COMMENT '校友会会长',
  `ass_con` bigint NULL DEFAULT NULL COMMENT '联系方式',
  `ass_group` bigint NULL DEFAULT NULL COMMENT '校友会交流群',
  `ass_status` int NULL DEFAULT NULL COMMENT '审核状态',
  `ass_opinion` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核意见',
  `ass_createtime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `ass_examinetime` datetime NULL DEFAULT NULL COMMENT '审核时间',
  PRIMARY KEY (`ass_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tb_ass
-- ----------------------------
INSERT INTO `tb_ass` VALUES (1, '河南洛阳校友会', '欢迎加入河南洛阳校友会', 3, 111111111, 121212121, 1, '已审核通过', '2020-02-03 20:16:36', '2020-02-04 20:17:24');
INSERT INTO `tb_ass` VALUES (2, '河南濮阳校友会', '欢迎加入河南濮阳校友会', 1, 921650190, 921650190, 1, '审核通过', '2020-03-13 18:40:51', '2020-03-13 19:07:26');
INSERT INTO `tb_ass` VALUES (3, '上海校友分会', '欢迎加入上海校友分会', 1, 150902111, 1143249844, 1, '123', '2020-03-13 18:42:52', '2020-04-08 14:03:59');
INSERT INTO `tb_ass` VALUES (4, '北京校友分会', '这里是北京校友分会，欢迎加入', 1, 1509021516, 1125464312, 1, '123', '2020-03-13 18:44:56', '2020-05-02 11:30:53');
INSERT INTO `tb_ass` VALUES (5, '郑州校友会', '这里是郑州校友会', 1, 13849925637, 921650190, 1, '123', '2020-03-13 18:50:17', '2020-05-02 11:31:21');
INSERT INTO `tb_ass` VALUES (6, '河南安阳校友会', '河南安阳校友会河南安阳校友会河南安阳校友会河南安阳校友会', 36, 15090215165, 123456789, 1, '审核通过', '2020-04-08 13:14:09', '2020-04-08 13:14:49');
INSERT INTO `tb_ass` VALUES (7, '广州校友会', '这里是广州校友会', 42, 15090215164, 123456, 1, '1111', '2020-04-08 14:05:22', '2020-04-08 14:05:31');
INSERT INTO `tb_ass` VALUES (8, '河南南阳校友会', '河南南阳校友会河南南阳校友会河南南阳校友会', 43, 15090215164, 921650190, 1, '审核通过', '2020-04-09 14:57:49', '2020-04-09 14:58:12');
INSERT INTO `tb_ass` VALUES (9, '湖南长沙校友会', '湖南长沙校友会湖南长沙校友会湖南长沙校友会', 1, 12345678, 111111111, 1, '111', '2020-04-30 11:08:41', '2020-05-03 15:07:52');

-- ----------------------------
-- Table structure for tb_assstu
-- ----------------------------
DROP TABLE IF EXISTS `tb_assstu`;
CREATE TABLE `tb_assstu`  (
  `tas_id` int NOT NULL AUTO_INCREMENT,
  `ass_id` int NULL DEFAULT NULL COMMENT '校友会ID',
  `user_id` int NULL DEFAULT NULL COMMENT '校友ID',
  PRIMARY KEY (`tas_id`) USING BTREE,
  INDEX `asssid`(`ass_id`) USING BTREE,
  INDEX `stuuid`(`user_id`) USING BTREE,
  CONSTRAINT `asssid` FOREIGN KEY (`ass_id`) REFERENCES `tb_ass` (`ass_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stuuid` FOREIGN KEY (`user_id`) REFERENCES `tb_stu` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tb_assstu
-- ----------------------------
INSERT INTO `tb_assstu` VALUES (11, 6, 36);
INSERT INTO `tb_assstu` VALUES (13, 7, 42);
INSERT INTO `tb_assstu` VALUES (14, 7, 43);
INSERT INTO `tb_assstu` VALUES (15, 8, 43);
INSERT INTO `tb_assstu` VALUES (27, 9, 36);

-- ----------------------------
-- Table structure for tb_class
-- ----------------------------
DROP TABLE IF EXISTS `tb_class`;
CREATE TABLE `tb_class`  (
  `class_id` int NOT NULL AUTO_INCREMENT COMMENT '班级id',
  `class_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '班级名称',
  `admin_id` int NULL DEFAULT NULL COMMENT '班级管理员id',
  `spec_id` int NULL DEFAULT NULL COMMENT '专业id',
  PRIMARY KEY (`class_id`) USING BTREE,
  INDEX `admin001`(`admin_id`) USING BTREE,
  INDEX `spec001`(`spec_id`) USING BTREE,
  CONSTRAINT `admin001` FOREIGN KEY (`admin_id`) REFERENCES `tb_stu` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `spec001` FOREIGN KEY (`spec_id`) REFERENCES `tb_spec` (`spec_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tb_class
-- ----------------------------
INSERT INTO `tb_class` VALUES (1, '2016级移动二班', NULL, 2);
INSERT INTO `tb_class` VALUES (2, '2016级商务英语一班', NULL, 7);
INSERT INTO `tb_class` VALUES (3, '2015级物理电子一班', NULL, 10);
INSERT INTO `tb_class` VALUES (4, '2016级嵌入三班', NULL, 3);
INSERT INTO `tb_class` VALUES (5, '2016级外包', NULL, 4);

-- ----------------------------
-- Table structure for tb_comment
-- ----------------------------
DROP TABLE IF EXISTS `tb_comment`;
CREATE TABLE `tb_comment`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `parent_id` int NOT NULL COMMENT '父级或者文章评论id',
  `type` int NOT NULL COMMENT '评论类型',
  `commentor` int NULL DEFAULT NULL COMMENT '评论人',
  `createtime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `like_count` int NULL DEFAULT 0 COMMENT '点赞数',
  `content` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评论内容',
  `commentcount` int NULL DEFAULT 0 COMMENT '评论数量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 79 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tb_comment
-- ----------------------------
INSERT INTO `tb_comment` VALUES (60, 25, 1, 1, '2020-02-19 11:42:56', 0, '还不错', 0);
INSERT INTO `tb_comment` VALUES (61, 25, 1, 1, '2020-02-19 11:56:34', 0, '嗯嗯', 0);
INSERT INTO `tb_comment` VALUES (62, 25, 1, 1, '2020-02-19 11:59:13', 0, '嗯嗯', 0);
INSERT INTO `tb_comment` VALUES (63, 25, 1, 1, '2020-02-19 12:04:40', 0, '你好', 2);
INSERT INTO `tb_comment` VALUES (64, 63, 2, 1, '2020-02-19 12:13:59', 0, '嗯嗯', 0);
INSERT INTO `tb_comment` VALUES (65, 63, 2, 1, '2020-02-19 13:14:35', 0, '挺好的', 0);
INSERT INTO `tb_comment` VALUES (66, 28, 1, 38, '2020-04-06 18:34:55', 0, '直接装逼', 0);
INSERT INTO `tb_comment` VALUES (67, 30, 1, 36, '2020-04-08 13:27:05', 0, '评论一下', 4);
INSERT INTO `tb_comment` VALUES (68, 67, 2, 36, '2020-04-08 13:27:19', 0, '进行评论', 0);
INSERT INTO `tb_comment` VALUES (69, 30, 1, 36, '2020-04-08 13:32:59', 0, '继续评论', 0);
INSERT INTO `tb_comment` VALUES (70, 67, 2, 36, '2020-04-08 13:33:05', 0, '？？？', 0);
INSERT INTO `tb_comment` VALUES (71, 67, 2, 36, '2020-04-08 13:37:33', 0, '评论一下评论一下', 0);
INSERT INTO `tb_comment` VALUES (72, 67, 2, 42, '2020-04-08 14:14:49', 0, '评论功能测试', 0);
INSERT INTO `tb_comment` VALUES (73, 30, 1, 42, '2020-04-08 14:15:05', 0, '这是一级评论', 0);
INSERT INTO `tb_comment` VALUES (74, 31, 1, 42, '2020-04-08 14:15:48', 0, '评论。。。', 1);
INSERT INTO `tb_comment` VALUES (75, 32, 1, 43, '2020-04-09 15:02:18', 0, '评论一下', 1);
INSERT INTO `tb_comment` VALUES (76, 75, 2, 43, '2020-04-09 15:02:31', 0, '二级评论', 0);
INSERT INTO `tb_comment` VALUES (77, 74, 2, 1, '2020-05-02 12:23:38', 0, '123', 0);
INSERT INTO `tb_comment` VALUES (78, 32, 1, 36, '2020-05-03 15:18:05', 0, '111111', 1);
INSERT INTO `tb_comment` VALUES (79, 78, 2, 36, '2020-05-03 15:18:12', 0, '1111222', 0);

-- ----------------------------
-- Table structure for tb_depart
-- ----------------------------
DROP TABLE IF EXISTS `tb_depart`;
CREATE TABLE `tb_depart`  (
  `depart_id` int NOT NULL AUTO_INCREMENT COMMENT '院系id',
  `depart_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '院系名字',
  PRIMARY KEY (`depart_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tb_depart
-- ----------------------------
INSERT INTO `tb_depart` VALUES (1, '信息技术学院');
INSERT INTO `tb_depart` VALUES (2, '外国语学院');
INSERT INTO `tb_depart` VALUES (3, '文学院');
INSERT INTO `tb_depart` VALUES (4, '物理电子学院');
INSERT INTO `tb_depart` VALUES (5, '教育科学院');

-- ----------------------------
-- Table structure for tb_don
-- ----------------------------
DROP TABLE IF EXISTS `tb_don`;
CREATE TABLE `tb_don`  (
  `don_id` int NOT NULL AUTO_INCREMENT COMMENT '捐赠id',
  `don_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '捐赠name',
  `don_desc` varchar(15000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '捐赠描述',
  `don_per` int NULL DEFAULT NULL COMMENT '捐赠人id',
  `don_status` int NULL DEFAULT NULL COMMENT '状态',
  `don_opinion` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核意见',
  `don_time` datetime NULL DEFAULT NULL COMMENT '捐赠时间',
  PRIMARY KEY (`don_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tb_don
-- ----------------------------
INSERT INTO `tb_don` VALUES (1, '图书馆项目', '为图书馆建设捐献资金', 3, 1, '感谢校友的捐赠', '2020-03-19 18:04:46');
INSERT INTO `tb_don` VALUES (2, '抗击新冠疫情的口罩', '帮助学校做好防范措施，特捐赠1万只口罩', 1, 1, NULL, '2020-03-21 14:22:14');
INSERT INTO `tb_don` VALUES (3, '学校疫情防疫支援', '学校疫情防疫支援学校疫情防疫支援学校疫情防疫支援', 36, 1, '审核通过', '2020-04-08 13:38:27');
INSERT INTO `tb_don` VALUES (4, '学校图书馆书籍', '为学校图书馆捐赠书籍', 42, 1, '1', '2020-04-08 14:13:11');
INSERT INTO `tb_don` VALUES (5, '学校机房电脑', '学校机房电脑学校机房电脑学校机房电脑', 43, 1, '审核通过', '2020-04-09 15:03:37');

-- ----------------------------
-- Table structure for tb_don_money
-- ----------------------------
DROP TABLE IF EXISTS `tb_don_money`;
CREATE TABLE `tb_don_money`  (
  `mon_id` int NOT NULL AUTO_INCREMENT COMMENT '筹款id',
  `mon_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目描述',
  `mon_count` int NULL DEFAULT NULL COMMENT '需要金额',
  `mon_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目名称',
  `mon_per` int NULL DEFAULT NULL COMMENT '项目发起人',
  `mon_time` datetime NULL DEFAULT NULL COMMENT '发起时间',
  `mon_status` int NULL DEFAULT NULL COMMENT '众筹状态',
  `mon_had` int NULL DEFAULT NULL COMMENT '已众筹金额',
  PRIMARY KEY (`mon_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tb_don_money
-- ----------------------------

-- ----------------------------
-- Table structure for tb_img
-- ----------------------------
DROP TABLE IF EXISTS `tb_img`;
CREATE TABLE `tb_img`  (
  `img_id` int NOT NULL AUTO_INCREMENT COMMENT '图片id',
  `img_name` varchar(360) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片name',
  `img_url` varchar(360) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片url',
  `img_state` int NULL DEFAULT NULL COMMENT '启用状态',
  `img_time` datetime NULL DEFAULT NULL COMMENT '上传时间',
  PRIMARY KEY (`img_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tb_img
-- ----------------------------
INSERT INTO `tb_img` VALUES (6, '轮播图03', 'https://lgyfile.oss-cn-beijing.aliyuncs.com/xiaoyou/2020-04-04/0431abfee76740f9a466beb119e51e87-1057968.jpg', 1, '2020-04-04 15:31:33');

-- ----------------------------
-- Table structure for tb_job
-- ----------------------------
DROP TABLE IF EXISTS `tb_job`;
CREATE TABLE `tb_job`  (
  `job_id` int NOT NULL AUTO_INCREMENT COMMENT '职位id',
  `job_company` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司名称',
  `job_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职位名称',
  `job_desc` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职位介绍',
  `user_id` int NULL DEFAULT NULL COMMENT '校友id',
  `job_time` datetime NULL DEFAULT NULL COMMENT '发布时间',
  `per_count` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '招聘人数',
  `job_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工作地址',
  `job_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投递地址',
  `check_status` int NULL DEFAULT NULL COMMENT '审核状态：0未审核，1已通过，2未通过',
  `check_opinion` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核意见',
  PRIMARY KEY (`job_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tb_job
-- ----------------------------
INSERT INTO `tb_job` VALUES (1, '北京小米科技有限公司', 'java开发工程师', '1、具有扎实的JAVA语言或相关语言基础，了解数据结构与算法相关内容；\r\n2、掌握关系数据库基本用法，熟悉SQL语法；\r\n3、熟悉前端开发技术和框架，或熟悉微服务、分布式技术的优先。 ', 2, '2020-02-17 16:13:26', '12', '北京市海淀区', '921650190@qq.com', 1, '允许发布');
INSERT INTO `tb_job` VALUES (3, '快手', 'Python开发工程师', '1、负责快手移动端研发协同平台的架构和开发；\r\n2、准确把握业务需求，进行系统技术方案设计，核心代码开发和系统调优等工作；\r\n3、持续关注并提升效能工具用户体验；\r\n4、保障快手移动端产品实现、测试、交付、发布、监控生命周期管理规范，高效高质量交付产品版本，实现业务目标。\r\n任职要求\r\n1、本科以上（包含本科）学历；\r\n2、熟练运用Python/Java/Go/Ruby语言（其中一种）,熟悉常用web开发框架；\r\n3、熟练使用Linux，shell编程，了解Linux系统基本原理；\r\n4、具有良好的沟通能力和团队合作精神、快速的学习能力、思维敏捷、逻辑清晰、执行力强、工作责任心强、抗压能力强；\r\n5、具有较强的分析和解决问题的能力；热爱互联网新技术，了解并探索业界技术动向。 ', 1, '2020-03-17 16:21:18', '2', '北京市海淀区', '15090215164@136.com', 0, '允许');
INSERT INTO `tb_job` VALUES (4, '装逼公司', '装逼仲裁', '天天装逼', 38, '2020-04-06 18:32:51', '88888', '中南海', '110', 2, '审核不通过');
INSERT INTO `tb_job` VALUES (5, '腾讯公司', 'java开发工程师', 'java开发工程师java开发工程师java开发工程师java开发工程师', 36, '2020-04-08 13:22:00', '2', '深圳', '15090215164@163.com', 1, '审核通过');
INSERT INTO `tb_job` VALUES (6, '腾讯公司', 'java开发工程师', 'java开发工程师java开发工程师java开发工程师', 42, '2020-04-08 14:12:01', '2', '深圳', '15090215164@163.com', 1, '审核通过');

-- ----------------------------
-- Table structure for tb_mon_stu
-- ----------------------------
DROP TABLE IF EXISTS `tb_mon_stu`;
CREATE TABLE `tb_mon_stu`  (
  `money_id` int NOT NULL AUTO_INCREMENT COMMENT '项目捐款id',
  `user_id` int NULL DEFAULT NULL COMMENT '项目捐款人id',
  `money_count` int NULL DEFAULT NULL COMMENT '项目捐款金额',
  `money_time` datetime NULL DEFAULT NULL COMMENT '捐款时间',
  `mon_id` int NULL DEFAULT NULL COMMENT '项目id',
  `mon_status` int NULL DEFAULT NULL COMMENT '审核状态',
  `mon_type` int NULL DEFAULT NULL COMMENT '支付方式',
  PRIMARY KEY (`money_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tb_mon_stu
-- ----------------------------
INSERT INTO `tb_mon_stu` VALUES (6, 26, 200, '2020-04-10 11:20:00', 1, 1, 1);
INSERT INTO `tb_mon_stu` VALUES (7, 36, 300, '2020-04-10 11:24:12', 1, 1, 1);
INSERT INTO `tb_mon_stu` VALUES (8, 37, 200, '2020-04-10 12:47:08', 4, 0, 1);
INSERT INTO `tb_mon_stu` VALUES (9, 36, 20, '2020-04-10 12:59:28', 4, 0, 1);
INSERT INTO `tb_mon_stu` VALUES (10, 36, 3000, '2020-04-10 13:01:40', 5, 0, 1);
INSERT INTO `tb_mon_stu` VALUES (11, 36, 3000, '2020-04-10 13:05:48', 1, 1, 1);
INSERT INTO `tb_mon_stu` VALUES (12, 36, 1000, '2020-04-10 13:06:59', 6, 0, 1);
INSERT INTO `tb_mon_stu` VALUES (13, 36, 3000, '2020-04-10 13:10:12', 7, 1, 1);
INSERT INTO `tb_mon_stu` VALUES (14, 37, 100, '2020-04-10 13:13:51', 8, 1, 1);
INSERT INTO `tb_mon_stu` VALUES (15, 1, 1000, '2020-04-30 18:06:51', 1, 0, 1);
INSERT INTO `tb_mon_stu` VALUES (16, 36, 100, '2020-05-03 15:10:19', 3, 1, 1);
INSERT INTO `tb_mon_stu` VALUES (17, 36, 100, '2020-05-06 15:19:44', 1, 0, 1);
INSERT INTO `tb_mon_stu` VALUES (18, 36, 100, '2020-05-06 15:23:52', 3, 1, 1);
INSERT INTO `tb_mon_stu` VALUES (19, 36, 120, '2020-05-06 15:31:33', 1, 1, 1);
INSERT INTO `tb_mon_stu` VALUES (20, 44, 1000, '2021-07-13 06:33:18', 9, 1, NULL);
INSERT INTO `tb_mon_stu` VALUES (21, 44, 1000, '2021-07-13 06:33:29', 9, 1, NULL);
INSERT INTO `tb_mon_stu` VALUES (22, 44, 1000, '2021-07-13 06:41:13', 9, 1, NULL);
INSERT INTO `tb_mon_stu` VALUES (23, 44, 10000, '2021-07-13 07:18:36', 9, 1, NULL);
INSERT INTO `tb_mon_stu` VALUES (24, 44, 10000, '2021-07-13 07:20:41', 9, 1, NULL);
INSERT INTO `tb_mon_stu` VALUES (25, 44, 10000, '2021-07-13 08:07:11', 11, 1, NULL);
INSERT INTO `tb_mon_stu` VALUES (26, 44, 10000, '2021-07-13 09:07:02', 13, 0, NULL);

-- ----------------------------
-- Table structure for tb_news
-- ----------------------------
DROP TABLE IF EXISTS `tb_news`;
CREATE TABLE `tb_news`  (
  `news_id` int NOT NULL AUTO_INCREMENT COMMENT '新闻id',
  `news_tittle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '新闻标题',
  `news_content` varchar(15000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '新闻内容',
  `news_user` int NULL DEFAULT NULL COMMENT '新闻作者',
  `news_time` datetime NULL DEFAULT NULL COMMENT '发表时间',
  PRIMARY KEY (`news_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tb_news
-- ----------------------------
INSERT INTO `tb_news` VALUES (1, '【疫情防控】离退休工作处：守护一方，共同打赢疫情防控攻坚战', '<p>面对突如其来的新冠肺炎疫情形势的严峻考验，离退处紧急动员全体工作人员，严格按照学校疫情防控工作安排，以“统筹部署、立体管控、全员覆盖、多维排查、压实责任、动态掌握”为指导思想和工作要求，迅捷反应，主动作为，积极务实开展疫情防控工作。</p><p><strong>提高</strong><strong>站位，强化责任落实</strong><strong>。</strong>认真学习贯彻落实省、市和学校有关疫情防控工作文件指示精神，按照洛阳市和学校关于新冠肺炎疫情防控工作要求，提高政治站位，强化责任落实，及时成立离退处新冠肺炎疫情防控工作小组，精心统筹谋划，细化落实部署，采取坚定有力的措施，全力投入到新冠肺炎疫情防控工作中。</p><p><strong>及时研判，积极主动应对</strong><strong>。</strong>根据对新冠肺炎疫情防控形势研判，元月25日下午（大年初一），及时关闭安乐老干部活动中心和月明湾老年棋牌活动室，尽早地排除和切断老同志因文体活动聚集感染新冠肺炎的可能性，通过离退休工作微信群等新媒体平台向老同志广而告之，积极加强疫情防范。具体开放时间将视疫情防控情况来确定。</p><p><strong>压实责任，实行分片区域化管理。</strong>基于疫情防控形势，结合我校离退休人员居住分散的现状（我校离退休人员398人，在洛阳市主要居住于安乐、月明湾、鸿儒和黄梅四个生活区，另有部分老同志居住于洛阳市市区和洛阳市以外区域），为进一步提高管理服务水平和工作效率，经研究，制定《离退处工作处关于加强区域化管理服务离退休老同志的工作安排》，在集中领导和做好日常管理服务的同时，分工到人，对离退休老同志实行分片区域化管理，由处级领导干部带领相关工作人员分组包干指定区域，具体负责协调处理所负责区域居住老同志的有关事宜，若遇有紧急情况或突发事件，各组要第一时间向处长报告并妥善协调处置。</p><p><strong>强化引导，守土履职尽责</strong><strong>。</strong>专门制定《关于进一步做好离退休工作微信管理的通知》，有针对性地加强网络舆情监控，每天通过离退休工作微信群及时发布官方疫情防控政策、精神和措施以及主流媒体防控疫情报道，明确要求老同志不造谣、不信谣、不传谣；凭借新媒体平台的正面宣传来科学引导老同志提高防控意识并妥善做好自身和家人防护。</p><p><strong>多维</strong><strong>排查，及时掌握信息。</strong>根据区域化管理要求，通过微信、电话等方式联系老同志，多方面了解老同志的身体状况和出行情况，掌握老同志的居住动态现状，确保全员覆盖，不遗漏一位老同志；在尽快排查以后，详尽填写统计表，并按照时间节点向学校上报从湖北（武汉等地）和省内重点区域返校老同志和在以上区域滞留同志，和以上人员进行耐心细致沟通，保持顺畅联络，随时掌握情况，及时了解和关心在外地居住老同志的健康状况；对高龄老人、空巢老人、独居老人和有实际困难老同志的生活和身体状况重点关注。</p><p><strong>立体防控，强化责任落实。</strong>结合我校离退休人员分散居住的实际情况，处领导在按区域分组分片包干负责的同时，积极联合老同志所居住社区，加强联防联控，并全方位指导管理老同志安全出行和疫情防范，杜绝防控工作中一切漏洞发生。</p><p><strong>群策群防，守护一方平安</strong><strong>。</strong>按照学校新冠肺炎疫情防控总体安排，强化责任意识，主动担当作为，落实落细防控工作。在打赢疫情防控阻击战中自觉履职、接受考验，做党委政府决策的坚定执行者，做广大老同志的贴心人。加强老同志思想引领，充分发挥老同志优势作用，创新工作方式方法，携手广大老同志群策群力，共克时艰。做到精准掌控动态，联防联查到位，防控措施有效，处置及时有力，正向引导舆情，守土履职尽责。确保服务一方，管理一方，稳定一方，守护一方，坚决做到疫情防护工作完全到位。</p><p><br></p>', 1, '2020-02-16 14:26:53');
INSERT INTO `tb_news` VALUES (2, '【疫情防控】初心如磐勇担责 使命在肩战疫情', '<p>\r\n</p><p>疫情就是命令，防控就是责任，支部就是战线。在这场没有硝烟的抗疫“战场”上，党政办党支部广大党员干部挺身而出、勇挑重担、迎难而上，主动在防控一线亮身份、见行动、作贡献，把初心写在抗疫行动上，把使命落在工作岗位上，戮力同心抗疫情，用坚定的“逆行”为广大师生的生命健康保驾护航，在抗“疫”一线筑起坚强的堡垒，擎起鲜红的党旗，为坚决打赢疫情防控的人民战争、总体战、阻击战作出了积极贡献。</p>\r\n<p><strong>提高站位，认清使命克时艰。</strong>面对当前严峻的疫情防控形势，党政办党支部深刻认识到疫情防控的重要性和艰巨性，坚决贯彻落实上级和学校党委行政各项决策部署，把疫情防控工作作为当前最重要、最急迫的任务来抓，把疫情防控作为践行初心使命、落实责任担当的试金石和磨刀石。广大党员干部带头提高政治站位，自觉坚守岗位，主动承担任务，争做防疫先锋，在疫情防控一线接受考验，在关键时刻站得出来，全方位做好各项工作，在加强师生疫情防控知识宣传、严格按要求统计上报各项数据状态、加强统筹协调和督查督办等工作中，发扬不畏艰险、无私奉献的精神，坚定站在学校疫情防控第一线，用模范行动展现共产党人的精神风范，守护校园安全稳定。</p>\r\n<p><strong>率先垂范，彰显本色勇担当。</strong>防控疫情，人人有责。党政办党支部广大党员干部身先士卒、勇挑重担，积极主动投身到疫情防控阻击战斗中来。除夕、春节，本应是阖家团圆的日子，党政办领导班子率先垂范，自愿放弃节假日休息时间，坚守岗位、主动担责，认真贯彻落实上级和学校领导各项重要指示批示精神，深入疫情防控第一线，及时掌握疫情动态，实时分析研判，推动疫情防控各项工作部署抓实抓细。假期期间，坚持每天至少有2名以上同志在办公室值班值守。尤其是疫情防控以来，支部党员干部立即进入“战斗状态”，所有党员同志随时待命，确保紧急时刻立即奔赴岗位。按照学校疫情防控工作领导小组的统一部署安排，党政办党支部认真落实各项工作，几乎每天都坚守在工作岗位上，守护全校师生生命安全和身体健康，确保疫情防控“零死角、零盲区、零疏漏”。期间，不管疫情防控形势多么严峻，支部广大党员始终坚持工作第一、责任第一、服从第一，克服各种困难，主动请战、主动值班、主动补位。为做好工作，刘伟同志把两个孩子“丢在”亲戚家里，自己却默默地、不停息地坚守在工作岗位；李晓辉同志由于工作需经常出入学校，主动与家人“隔离”，家人近在咫尺却不能团聚；刘世宁、张雲凡、赵鹏等同志几乎天天“扎守”在办公室，加班加点，没有丝毫怨言。</p>\r\n<p><strong>履职尽责，统筹协调聚合力。</strong>在抗击疫情阻击战中，党政办党支部强化责任落实，加强组织动员，确保把防控措施责任落实到具体单位和具体人，推动形成联防联控、群防群治的强大合力。一是抓工作落实，疫情防控工作开展以来，党政办公室接收省、厅、市、区等各级各类关于疫情防控文件通知120余件，每件都确保在第一时间向领导汇报请示，逐一跟踪落实。二是根据疫情特点和上级有关文件精神，结合学校实际，克服时间紧、任务重、难度大等困难，逐字逐句把关文字材料，高质量完善出台校内相关制度文件通知方案10余件，增强了防控工作的主动性、预见性、针对性。三是抓好督导督办，党政办公室每天对校属各单位落实防控工作责任制情况进行督导督办，对防控工作任务进行逐项检点，逐个督促落实，确保各项防控工作的政令、措施迅速落实推进。四是积极与省教育厅、市委市政府沟通协调，每天及时准确完成相关信息报送工作。五是创新沟通协调机制，根据工作需求，通过视频会议、微信群沟通等多种形式随时随地分析研判，第一时间响应落实。六是统筹协调财务处、后勤管理处、后勤服务集团等校内相关部门筹措防控应急物资，积极协助教务、学工、保卫等部门制定开学前后的各种预案。</p>\r\n<p>党政办公室党支部认真贯彻落实“坚定信心、同舟共济、科学防治、精准施策”的总要求，在疫情防控中积极应对、主动作为，统筹协调、联防联控，狠抓落实、严防死守，在大考中交出了合格答卷，为全校基层党组织作出了表率、树立了标杆。</p>\r\n\r\n', 1, '2020-02-16 14:26:35');
INSERT INTO `tb_news` VALUES (4, '【疫情防控】爱心企业向我校捐赠防疫物资', '<p>\r\n</p><p><font face=\"宋体\">岁寒知松柏，患难见真情。</font>2月13日上午，<font face=\"宋体\">洛阳德兆福家俱有限公司</font><font face=\"宋体\">董事长张建中向我校捐赠医用口罩</font>1000只和消毒片70公斤（共7万片可泡制消毒液3.5万升），总价值约2万元。后勤管理处代表学校接收捐赠<font face=\"宋体\">物资</font><font face=\"宋体\">。</font></p>\r\n<p><font face=\"宋体\">在全国上下众志成城抗击疫情的关键时期，</font><font face=\"宋体\">医用口罩、</font><font face=\"宋体\">消毒</font><font face=\"宋体\">药剂</font><font face=\"宋体\">等物资非常短缺，</font><font face=\"宋体\">张建中董事长</font><font face=\"宋体\">捐赠的这批物资解决了学校的燃眉之急，</font><font face=\"宋体\">是</font><font face=\"宋体\">展现社会责任和企业担当的善行义举，不仅是</font><font face=\"宋体\">对</font><font face=\"宋体\">我校打赢疫情防控阻击战的物质支持，也是对疫情防控一线</font><font face=\"宋体\">奋</font><font face=\"宋体\">战教职工的巨大鼓舞。</font></p>\r\n<p><font face=\"宋体\">后勤管理处代表学校对捐赠企业的爱心义举表示由衷的感谢。这些捐赠物资，将由学校疫情防控工作领导小组统一调配，用于校园疫情防控、公共场所消毒和一线人员的个人防护，确保打赢校园疫情防控战。</font></p>\r\n<p>&nbsp;</p>\r\n<p><img src=\"http://upload.lynu.edu.cn/2020/0213/1581572855724.jpg\" alt=\"微信图片_20200213134515\" border=\"0\"></p>\r\n<p>&nbsp;</p>\r\n\r\n', 1, '2020-02-16 17:01:19');
INSERT INTO `tb_news` VALUES (5, '测试新闻图片上传功能', '<p><br><img src=\"https://lgyfile.oss-cn-beijing.aliyuncs.com/xiaoyou/2020-03-09/d837e80f27a94216a480f575ed73e5eb-20191230164912.jpg\" style=\"max-width:100%;\"><img src=\"https://lgyfile.oss-cn-beijing.aliyuncs.com/xiaoyou/2020-03-09/80eaf7f422fb48f58e921aeb29eb1f65-a.jpg\" style=\"max-width:100%;\"><img src=\"https://lgyfile.oss-cn-beijing.aliyuncs.com/xiaoyou/2020-03-09/4baf4c61868b47b8a66be9e22d865f61-b.jpg\" style=\"max-width:100%;\"></p>', 1, '2020-03-09 22:28:45');
INSERT INTO `tb_news` VALUES (6, '我校教师在2019年全省“书香三八”读书活动中荣获佳绩', '<p>\r\n</p><p>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 近日，省教科文卫体工会下发《关于表彰2019年河南省高校“书香三八”读书活动获奖个人的决定》，对全省高校获奖者予以表彰。我校贾艳丽的作品《娘》、郭晓静的《纪念我的奶奶》、周银平的《您好，母亲大人》荣获征文类作品一等奖；徐海燕的作品《没有母亲的母亲节》荣获征文类作品二等奖，郑燕姣的《我有明珠一颗，照亮山河万朵——致未来的你》荣获家书类作品二等奖；王嘉、韩静、邢素引3人荣获书画类作品三等奖；王丽华、林乐飞2人荣获家书类作品优秀奖，安丽荣获书画类作品优秀奖。&nbsp;</p>\r\n<p>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 自2019年5月省教科文卫体工会女职工委员会通知在全省高校女教职工中开展以“爱岗·爱家·爱国”为主题的“书香三八”读书活动以来，我校工会女职工委员会精心组织,\r\n \r\n广大女教职工积极参与,通过读书分享、撰写书评、择优参评、专家评审等工作,最终报送省教科文卫体工会15件作品，共获得3个一等奖、2个二等奖、3个三等奖和3个优秀奖的好成绩，体现了我校女职工对祖国、家庭和工作最真挚热忱的感情，向社会展示了新时代高校女教师昂扬向上的精神面貌和卓越的意志品质。</p>\r\n\r\n', 2, '2020-03-12 13:46:40');
INSERT INTO `tb_news` VALUES (7, '毕设系统验收', '<p>\r\n</p><h4 id=\"h4--20-100-\">邀请好友返现金活动继续中！您邀请的每一位好友充值后您将拥有20%返现（永久！每一笔充值都返！满100可提现！）</h4><h4 id=\"h4--\"><a name=\"方法：登录会员中心-页面左侧-推广返现-一键复制推广链接\"></a><span></span>方法：登录会员中心-页面左侧-推广返现-一键复制推广链接</h4><hr><h4 id=\"h4-kopcloud-ctrl-d-\"><a name=\"KopCloud国内可访问地址发布页（收藏方法：浏览器内按 Ctrl+D）：\"></a><span></span>KopCloud国内可访问地址发布页（收藏方法：浏览器内按 Ctrl+D）：</h4><p><a href=\"https://kopcloud-com.oss-cn-hongkong.aliyuncs.com/\" rel=\"noopener\" target=\"_blank\">https://kopcloud-com.oss-cn-hongkong.aliyuncs.com/</a></p><p>官网永久地址(需翻墙访问)：<a href=\"https://kopcloud.com\" rel=\"noopener\" target=\"_blank\">https://kopcloud.com</a><br>请关注TG通知频道：<a href=\"https://t.me/kopcloud_push\" rel=\"noopener\" target=\"_blank\">https://t.me/kopcloud_push</a> ，获取最新优惠信息<img src=\"https://lgyfile.oss-cn-beijing.aliyuncs.com/xiaoyou/2020-04-08/6a622a5d6ae646288d659f00de41736e-17_BigPic.png\" style=\"max-width:100%;\"></p><br><p><br></p>', 1, '2020-04-08 13:19:43');
INSERT INTO `tb_news` VALUES (8, '广州校友会正式成立', '<p>广州校友会成立啦。。。。。。。<img src=\"https://lgyfile.oss-cn-beijing.aliyuncs.com/xiaoyou/2020-04-08/c961db5256ad403e89b52a8378de2bf9-8f77278f5e2845b89a6224d3e5c23a3d-logo-sidebar.png\" style=\"max-width:100%;\"></p>', 1, '2020-04-08 14:11:07');

-- ----------------------------
-- Table structure for tb_notification
-- ----------------------------
DROP TABLE IF EXISTS `tb_notification`;
CREATE TABLE `tb_notification`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '通知id',
  `notifier` int NOT NULL COMMENT '通知者id',
  `receiver` int NOT NULL COMMENT '接收者id',
  `outerid` int NOT NULL,
  `type` int NOT NULL COMMENT '通知类型',
  `createtime` datetime NOT NULL COMMENT '时间',
  `status` int NOT NULL DEFAULT 0 COMMENT '已读or未读',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tb_notification
-- ----------------------------
INSERT INTO `tb_notification` VALUES (22, 1, 1, 25, 2, '2020-02-19 11:42:56', 1);
INSERT INTO `tb_notification` VALUES (23, 1, 1, 25, 2, '2020-02-19 11:56:34', 1);
INSERT INTO `tb_notification` VALUES (24, 1, 1, 25, 2, '2020-02-19 11:59:13', 1);
INSERT INTO `tb_notification` VALUES (25, 1, 1, 25, 2, '2020-02-19 12:04:40', 1);
INSERT INTO `tb_notification` VALUES (26, 1, 1, 63, 1, '2020-02-19 12:13:59', 1);
INSERT INTO `tb_notification` VALUES (27, 1, 1, 63, 1, '2020-02-19 13:14:35', 1);
INSERT INTO `tb_notification` VALUES (28, 38, 37, 28, 2, '2020-04-06 18:34:55', 0);
INSERT INTO `tb_notification` VALUES (29, 36, 36, 30, 2, '2020-04-08 13:27:05', 1);
INSERT INTO `tb_notification` VALUES (30, 36, 36, 67, 1, '2020-04-08 13:27:19', 1);
INSERT INTO `tb_notification` VALUES (31, 36, 36, 30, 2, '2020-04-08 13:32:59', 1);
INSERT INTO `tb_notification` VALUES (32, 36, 36, 67, 1, '2020-04-08 13:33:05', 1);
INSERT INTO `tb_notification` VALUES (33, 36, 36, 67, 1, '2020-04-08 13:37:33', 1);
INSERT INTO `tb_notification` VALUES (34, 42, 36, 67, 1, '2020-04-08 14:14:49', 1);
INSERT INTO `tb_notification` VALUES (35, 42, 36, 30, 2, '2020-04-08 14:15:05', 1);
INSERT INTO `tb_notification` VALUES (36, 42, 42, 31, 2, '2020-04-08 14:15:48', 1);
INSERT INTO `tb_notification` VALUES (37, 43, 43, 32, 2, '2020-04-09 15:02:18', 1);
INSERT INTO `tb_notification` VALUES (38, 43, 43, 75, 1, '2020-04-09 15:02:31', 1);
INSERT INTO `tb_notification` VALUES (39, 1, 42, 74, 1, '2020-05-02 12:23:38', 1);
INSERT INTO `tb_notification` VALUES (40, 36, 43, 32, 2, '2020-05-03 15:18:05', 0);
INSERT INTO `tb_notification` VALUES (41, 36, 36, 78, 1, '2020-05-03 15:18:12', 1);

-- ----------------------------
-- Table structure for tb_question
-- ----------------------------
DROP TABLE IF EXISTS `tb_question`;
CREATE TABLE `tb_question`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '帖子标题',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '帖子描述',
  `createid` int NOT NULL COMMENT '发帖人id',
  `comment_count` int NOT NULL DEFAULT 0 COMMENT '评论数量',
  `view_count` int NOT NULL DEFAULT 0 COMMENT '浏览量',
  `like_count` int NOT NULL DEFAULT 0 COMMENT '喜欢数量',
  `tag` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标签',
  `createtime` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tb_question
-- ----------------------------
INSERT INTO `tb_question` VALUES (25, '第一个问题', '# 怎么样啊这个', 1, 4, 37, 0, 'java', '2020-02-19 11:42:40');
INSERT INTO `tb_question` VALUES (26, '我们什么时候可以开学', '<p>疫情快结束了<br></p>', 1, 0, 16, 0, '开学', '2020-02-26 14:04:50');
INSERT INTO `tb_question` VALUES (27, '洛师校园网即将上线', '<p>有什么期待的功能，欢迎评论区讨论<br></p><p><br></p>', 1, 0, 12, 0, '校友网', '2020-03-12 14:05:15');
INSERT INTO `tb_question` VALUES (28, '新用户需要注意什么', '<p>我是一个新用户&nbsp;&nbsp;&nbsp; <br></p>', 37, 1, 5, 0, 'Spring', '2020-04-06 11:07:45');
INSERT INTO `tb_question` VALUES (29, '你这发布招聘信息不显示啊？', '<p>什么垃圾工程师写的代码，祭天去吧</p>', 38, 0, 2, 0, '吐槽', '2020-04-06 18:34:26');
INSERT INTO `tb_question` VALUES (30, '毕设系统验收', '<p>毕设系统验收</p><p>毕设系统验收</p><p>毕设系统验收</p><p>毕设系统验收</p>', 36, 3, 18, 0, '毕设', '2020-04-08 13:26:51');
INSERT INTO `tb_question` VALUES (31, '广州校友会活动帖子', '<p>有人吗。。。。。<br></p>', 42, 1, 6, 0, '校友胡', '2020-04-08 14:15:36');
INSERT INTO `tb_question` VALUES (32, '南阳校友会成立了', '<p>南阳校友会成立了</p><p>南阳校友会成立了</p><p>南阳校友会成立了</p><p>南阳校友会成立了。。。。。</p>', 43, 2, 17, 0, '校友会', '2020-04-09 15:01:59');

-- ----------------------------
-- Table structure for tb_role
-- ----------------------------
DROP TABLE IF EXISTS `tb_role`;
CREATE TABLE `tb_role`  (
  `id` int NOT NULL COMMENT '角色id',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tb_role
-- ----------------------------
INSERT INTO `tb_role` VALUES (1, 'ROLE_ADMIN');
INSERT INTO `tb_role` VALUES (2, 'ROLE_USER');

-- ----------------------------
-- Table structure for tb_spec
-- ----------------------------
DROP TABLE IF EXISTS `tb_spec`;
CREATE TABLE `tb_spec`  (
  `spec_id` int NOT NULL AUTO_INCREMENT COMMENT '专业id',
  `specname` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '专业名称',
  `depart_id` int NULL DEFAULT NULL COMMENT '院系id',
  PRIMARY KEY (`spec_id`) USING BTREE,
  INDEX `depart`(`depart_id`) USING BTREE,
  CONSTRAINT `depart` FOREIGN KEY (`depart_id`) REFERENCES `tb_depart` (`depart_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tb_spec
-- ----------------------------
INSERT INTO `tb_spec` VALUES (1, '计算机科学与技术', 1);
INSERT INTO `tb_spec` VALUES (2, '软件工程（移动）', 1);
INSERT INTO `tb_spec` VALUES (3, '软件工程（嵌入）', 1);
INSERT INTO `tb_spec` VALUES (4, '软件工程（外包）', 1);
INSERT INTO `tb_spec` VALUES (5, '物联网', 1);
INSERT INTO `tb_spec` VALUES (6, '心理学', 5);
INSERT INTO `tb_spec` VALUES (7, '商务英语', 2);
INSERT INTO `tb_spec` VALUES (8, '英语教育', 2);
INSERT INTO `tb_spec` VALUES (9, '汉语言文学', 3);
INSERT INTO `tb_spec` VALUES (10, '物理学', 4);

-- ----------------------------
-- Table structure for tb_stu
-- ----------------------------
DROP TABLE IF EXISTS `tb_stu`;
CREATE TABLE `tb_stu`  (
  `user_id` int NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `class_id` int NULL DEFAULT NULL COMMENT '班级ID',
  `depart_id` int NULL DEFAULT NULL COMMENT '院系id',
  `spec_id` int NULL DEFAULT NULL COMMENT '专业id',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `stu_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `is_admin` int NULL DEFAULT NULL COMMENT '用户/管理员',
  `mobile` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工作',
  `address` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账号',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tb_stu
-- ----------------------------
INSERT INTO `tb_stu` VALUES (26, 1, 1, 2, '范海腾', '男', 'https://lgyfile.oss-cn-beijing.aliyuncs.com/xiaoyou/2020-04-01/12d8f3f981064706bb605da1178f492f-20191230164912.jpg', 0, '13033991040', '1185244279@qq.com', 'java开发工程师', '河南濮阳', '1999', '1999');
INSERT INTO `tb_stu` VALUES (36, 1, 1, 2, '零零后', '男', 'https://lgyfile.oss-cn-beijing.aliyuncs.com/xiaoyou/2020-04-08/7b3374c2335a4c60bb422d8e4b3426d1-2629683775b221300e9d35509b640396.jpeg', 0, '153568262215', '921650190@qq.com', 'aa', 'aa', '2020', '2020');
INSERT INTO `tb_stu` VALUES (37, 4, 1, 3, '张良', '男', 'https://lgyfile.oss-cn-beijing.aliyuncs.com/xiaoyou/2020-04-06/bbc622972c3e440185733f6931d86f4f-20191230164912.jpg', 0, '13033991040', '1143249844@qq.com', '嵌入工程师', '北京朝阳区', '2021', '2021');
INSERT INTO `tb_stu` VALUES (41, 4, 1, 3, '李斯', '男', 'https://lgyfile.oss-cn-beijing.aliyuncs.com/xiaoyou/2020-04-08/93dba689886f43848e25bd4c7cf5f488-17_BigPic.png', 0, '13033991040', '921650190@qq.com', 'java开发工程师', '河南濮阳', '2022', '2022');
INSERT INTO `tb_stu` VALUES (42, 5, 1, 4, '王晓丽', '女', 'https://lgyfile.oss-cn-beijing.aliyuncs.com/xiaoyou/2020-04-08/01bd51a8d7794b62b880e14da5abda2f-2629683775b221300e9d35509b640396.jpeg', 0, '13033991040', '921650190@qq.com', 'java开发工程师', '河南濮阳', '2023', '2023');
INSERT INTO `tb_stu` VALUES (43, 1, 1, 2, '梁冠永', '男', 'https://lgyfile.oss-cn-beijing.aliyuncs.com/xiaoyou/2020-04-09/e4ea52a09d9a43168cd32db075573a43-头像01.jpeg', 0, '13033991040', '921650190@qq.com', 'java开发工程师', '河南濮阳', '0208', '0208');
INSERT INTO `tb_stu` VALUES (44, NULL, NULL, NULL, 'reipon', '男', 'https://lgyfile.oss-cn-beijing.aliyuncs.com/xiaoyou/2020-01-29/20191230164912.jpg', 0, '15295489665', NULL, NULL, 'ssad', '19200107232', '1');
INSERT INTO `tb_stu` VALUES (45, 1, 1, 2, 'DAS', '男', 'https://lgyfile.oss-cn-beijing.aliyuncs.com/xiaoyou/2020-01-29/20191230164912.jpg', 0, '15295489666', 'dick14178@outlook.com', '的撒打算', '撒大声地', '8848848', '1');
INSERT INTO `tb_stu` VALUES (46, NULL, NULL, NULL, '超级会员限时优惠', '男', 'https://lgyfile.oss-cn-beijing.aliyuncs.com/xiaoyou/2020-01-29/20191230164912.jpg', 0, '15295489666', 'dick14178@outlook.com', '的撒打算', '撒大声地', 'nineho1', '1');
INSERT INTO `tb_stu` VALUES (47, NULL, NULL, NULL, '521523', '男', 'https://lgyfile.oss-cn-beijing.aliyuncs.com/xiaoyou/2020-01-29/20191230164912.jpg', 0, '15295489666', NULL, NULL, '11111', 'dick14178@outlook.com', '1');
INSERT INTO `tb_stu` VALUES (48, NULL, NULL, NULL, '超级会员限时优惠', '男', 'https://lgyfile.oss-cn-beijing.aliyuncs.com/xiaoyou/2020-01-29/20191230164912.jpg', 0, '15295489666', NULL, NULL, '撒大声地', '123456', '4');
INSERT INTO `tb_stu` VALUES (49, NULL, NULL, NULL, '超级会员限时优惠', '男', 'https://lgyfile.oss-cn-beijing.aliyuncs.com/xiaoyou/2020-01-29/20191230164912.jpg', 0, '15295489666', NULL, NULL, '12', '123', '1');
INSERT INTO `tb_stu` VALUES (50, NULL, NULL, NULL, '超级会员限时优惠', '男', 'https://lgyfile.oss-cn-beijing.aliyuncs.com/xiaoyou/2020-01-29/20191230164912.jpg', 0, '15295489665', NULL, NULL, '撒打算', '12345', '1');
INSERT INTO `tb_stu` VALUES (51, NULL, NULL, NULL, '啊实打实', '男', 'https://lgyfile.oss-cn-beijing.aliyuncs.com/xiaoyou/2020-01-29/20191230164912.jpg', 1, '15295489665', NULL, NULL, '萨达', '777', '1');

-- ----------------------------
-- Table structure for tb_user_role
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_role`;
CREATE TABLE `tb_user_role`  (
  `user_id` int NOT NULL COMMENT '用户id',
  `role_id` int NOT NULL COMMENT '角色id',
  PRIMARY KEY (`user_id`) USING BTREE,
  INDEX `fk_role_id`(`role_id`) USING BTREE,
  CONSTRAINT `fk_role_id` FOREIGN KEY (`role_id`) REFERENCES `tb_role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `tb_stu` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tb_user_role
-- ----------------------------
INSERT INTO `tb_user_role` VALUES (51, 1);
INSERT INTO `tb_user_role` VALUES (26, 2);
INSERT INTO `tb_user_role` VALUES (36, 2);
INSERT INTO `tb_user_role` VALUES (37, 2);
INSERT INTO `tb_user_role` VALUES (41, 2);
INSERT INTO `tb_user_role` VALUES (42, 2);
INSERT INTO `tb_user_role` VALUES (43, 2);

SET FOREIGN_KEY_CHECKS = 1;
