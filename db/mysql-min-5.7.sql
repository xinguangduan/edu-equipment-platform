CREATE database if NOT EXISTS `eemp` default character set utf8mb4 collate utf8mb4_general_ci;
USE `eemp`;

/*
 Navicat Premium Data Transfer

 Source Server         : mysql5.7
 Source Server Type    : MySQL
 Source Server Version : 50738
 Source Host           : 127.0.0.1:3306
 Source Schema         : eemp

 Target Server Type    : MySQL
 Target Server Version : 50738
 File Encoding         : 65001

 Date: 13/03/2023 09:28:06
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;


-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `BLOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `CALENDAR_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CRON_EXPRESSION` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TIME_ZONE_ID` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ENTRY_ID` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `ENTRY_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `IS_DURABLE` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `IS_UPDATE_DATA` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `JOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `LOCK_NAME` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `LOCK_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('MyScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('MyScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('MyScheduler', 'qin1678364404962', 1678369184458, 15000);

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `STR_PROP_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `STR_PROP_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `STR_PROP_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INT_PROP_1` int(11) NULL DEFAULT NULL,
  `INT_PROP_2` int(11) NULL DEFAULT NULL,
  `LONG_PROP_1` bigint(20) NULL DEFAULT NULL,
  `LONG_PROP_2` bigint(20) NULL DEFAULT NULL,
  `DEC_PROP_1` decimal(13, 4) NULL DEFAULT NULL,
  `DEC_PROP_2` decimal(13, 4) NULL DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) NULL DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) NULL DEFAULT NULL,
  `PRIORITY` int(11) NULL DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_TYPE` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) NULL DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) NULL DEFAULT NULL,
  `JOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `SCHED_NAME`(`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_announcement
-- ----------------------------
DROP TABLE IF EXISTS `sys_announcement`;
CREATE TABLE `sys_announcement`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `titile` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `msg_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `start_time` datetime NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '结束时间',
  `sender` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发布人',
  `priority` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '优先级（L低，M中，H高）',
  `msg_category` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '2' COMMENT '消息类型1:通知公告2:系统消息',
  `msg_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '通告对象类型（USER:指定用户，ALL:全体用户）',
  `send_status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发布状态（0未发布，1已发布，2已撤销）',
  `send_time` datetime NULL DEFAULT NULL COMMENT '发布时间',
  `cancel_time` datetime NULL DEFAULT NULL COMMENT '撤销时间',
  `del_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '删除状态（0，正常，1已删除）',
  `bus_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '业务类型(email:邮件 bpm:流程)',
  `bus_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '业务id',
  `open_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '打开方式(组件：component 路由：url)',
  `open_page` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件/路由 地址',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `user_ids` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '指定用户',
  `msg_abstract` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '摘要',
  `dt_task_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '钉钉task_id，用于撤回消息',
  `tenant_id` int(10) NULL DEFAULT 0 COMMENT '租户ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统通告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_announcement
-- ----------------------------
INSERT INTO `sys_announcement` VALUES ('1256486817286418434', '放假通知', '<p>放假通知</p>', '2020-05-02 15:32:38', '2020-05-30 15:32:40', 'admin', 'M', '1', 'USER', '1', '2020-05-02 15:32:59', NULL, '0', NULL, NULL, NULL, NULL, 'admin', '2020-05-02 15:32:56', 'admin', '2020-05-02 15:32:59', 'e9ca23d68d884d4ebb19d07889727dae,a75d45a015c44384a04449ee80dc3503,', '放假通知', NULL, 0);

-- ----------------------------
-- Table structure for sys_announcement_send
-- ----------------------------
DROP TABLE IF EXISTS `sys_announcement_send`;
CREATE TABLE `sys_announcement_send`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `annt_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '通告ID',
  `user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户id',
  `read_flag` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '阅读状态（0未读，1已读）',
  `read_time` datetime NULL DEFAULT NULL COMMENT '阅读时间',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `star_flag` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标星状态( 1为标星 空/0没有标星)'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户通告阅读标记表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_announcement_send
-- ----------------------------
INSERT INTO `sys_announcement_send` VALUES ('646c0c405ec643d4dc4160db2446f8ff', '93a9060a1c20e4bf98b3f768a02c2ff9', 'e9ca23d68d884d4ebb19d07889727dae', '1', '2019-11-21 16:30:01', 'admin', '2019-05-17 11:50:56', 'admin', '2019-11-21 16:30:01', NULL);
INSERT INTO `sys_announcement_send` VALUES ('1197434450981543938', '93a9060a1c20e4bf98b3f768a02c2ff9', 'a75d45a015c44384a04449ee80dc3503', '0', NULL, 'jeecg', '2019-11-21 16:39:55', NULL, NULL, NULL);
INSERT INTO `sys_announcement_send` VALUES ('1256486817319972866', '1256486817286418434', 'e9ca23d68d884d4ebb19d07889727dae', '1', '2022-09-22 13:53:48', 'admin', '2020-05-02 15:32:56', 'admin', '2022-09-22 13:53:48', NULL);
INSERT INTO `sys_announcement_send` VALUES ('1256486817349332993', '1256486817286418434', 'a75d45a015c44384a04449ee80dc3503', '0', '2020-05-02 15:32:56', 'admin', '2020-05-02 15:32:56', NULL, NULL, NULL);
INSERT INTO `sys_announcement_send` VALUES ('1256527099214278657', '1256486502931722242', 'e9ca23d68d884d4ebb19d07889727dae', '1', '2022-09-22 13:53:50', 'admin', '2020-05-02 18:12:59', 'admin', '2022-09-22 13:53:50', NULL);
INSERT INTO `sys_announcement_send` VALUES ('1260927781673484290', '1256486502931722242', 'a75d45a015c44384a04449ee80dc3503', '0', NULL, 'jeecg', '2020-05-14 21:39:45', NULL, NULL, NULL);
INSERT INTO `sys_announcement_send` VALUES ('1524265883060088833', '1524265037052194817', 'e9ca23d68d884d4ebb19d07889727dae', '0', NULL, 'admin', '2022-05-11 13:51:21', NULL, NULL, NULL);
INSERT INTO `sys_announcement_send` VALUES ('1524269222510407682', '1524269214973243394', 'e9ca23d68d884d4ebb19d07889727dae', '1', '2022-09-22 13:53:52', 'admin', '2022-05-11 14:04:37', 'admin', '2022-09-22 13:53:52', NULL);
INSERT INTO `sys_announcement_send` VALUES ('1539164576187887617', '1524269214973243394', 'a75d45a015c44384a04449ee80dc3503', '0', NULL, 'jeecg', '2022-06-21 16:33:26', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_category
-- ----------------------------
DROP TABLE IF EXISTS `sys_category`;
CREATE TABLE `sys_category`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父级节点',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型名称',
  `code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型编码',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建日期',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新日期',
  `sys_org_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属部门',
  `has_child` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否有子节点',
  `tenant_id` int(10) NULL DEFAULT 0 COMMENT '租户ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `index_code`(`code`) USING BTREE,
  INDEX `idx_sc_code`(`code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_category
-- ----------------------------
INSERT INTO `sys_category` VALUES ('1183693424827564034', '0', '物料树', 'B02', 'admin', '2019-10-14 18:37:59', 'admin', '2019-10-14 18:38:15', 'A01', '1', 0);
INSERT INTO `sys_category` VALUES ('1183693491043041282', '1183693424827564034', '上衣', 'B02A01', 'admin', '2019-10-14 18:38:15', 'admin', '2019-10-14 18:38:43', 'A01', '1', 0);
INSERT INTO `sys_category` VALUES ('1183693534173069314', '1183693424827564034', '裤子', 'B02A02', 'admin', '2019-10-14 18:38:25', NULL, NULL, 'A01', NULL, 0);
INSERT INTO `sys_category` VALUES ('1183693610534567937', '1183693491043041282', '秋衣', 'B02A01A01', 'admin', '2019-10-14 18:38:43', NULL, NULL, 'A01', NULL, 0);
INSERT INTO `sys_category` VALUES ('1183693700254924802', '1183693491043041282', '兵装', 'B02A01A02', 'admin', '2019-10-14 18:39:05', NULL, NULL, 'A01', NULL, 0);
INSERT INTO `sys_category` VALUES ('1183693773974011906', '1183693491043041282', '女装', 'B02A01A03', 'admin', '2019-10-14 18:39:22', NULL, NULL, 'A01', NULL, 0);
INSERT INTO `sys_category` VALUES ('1185039122143719425', '0', '电脑产品', 'A01', 'admin', '2019-10-18 11:45:18', 'admin', '2019-10-18 11:45:31', 'A01', '1', 0);
INSERT INTO `sys_category` VALUES ('1185039176799694850', '1185039122143719425', 'thinkpad', 'A01A01', 'admin', '2019-10-18 11:45:31', NULL, NULL, 'A01', NULL, 0);
INSERT INTO `sys_category` VALUES ('1185039255115739138', '1185039122143719425', 'mackbook', 'A01A02', 'admin', '2019-10-18 11:45:50', NULL, NULL, 'A01', NULL, 0);
INSERT INTO `sys_category` VALUES ('1185039299051073537', '1185039122143719425', '华为电脑', 'A01A03', 'admin', '2019-10-18 11:46:01', NULL, NULL, 'A01', NULL, 0);
INSERT INTO `sys_category` VALUES ('1230769196661510146', '0', '省', NULL, 'admin', '2020-02-21 16:20:16', 'admin', '2020-02-21 16:20:31', 'A01A03', '1', 0);
INSERT INTO `sys_category` VALUES ('1230769253267836929', '1230769196661510146', '安徽省', NULL, 'admin', '2020-02-21 16:20:31', 'admin', '2020-02-21 16:20:53', 'A01A03', '1', 0);
INSERT INTO `sys_category` VALUES ('1230769290609725441', '1230769196661510146', '山东省', NULL, 'admin', '2020-02-21 16:20:40', 'admin', '2020-02-21 16:21:23', 'A01A03', '1', 0);
INSERT INTO `sys_category` VALUES ('1230769347157331969', '1230769253267836929', '合肥市', NULL, 'admin', '2020-02-21 16:20:53', 'admin', '2020-02-21 16:21:08', 'A01A03', '1', 0);
INSERT INTO `sys_category` VALUES ('1230769407907631106', '1230769347157331969', '包河区', NULL, 'admin', '2020-02-21 16:21:08', NULL, NULL, 'A01A03', NULL, 0);
INSERT INTO `sys_category` VALUES ('1230769470889299970', '1230769290609725441', '济南市', NULL, 'admin', '2020-02-21 16:21:23', 'admin', '2020-02-21 16:21:41', 'A01A03', '1', 0);
INSERT INTO `sys_category` VALUES ('1230769547519234050', '1230769470889299970', 'A区', NULL, 'admin', '2020-02-21 16:21:41', NULL, NULL, 'A01A03', NULL, 0);
INSERT INTO `sys_category` VALUES ('1230769620021972993', '1230769470889299970', 'B区', NULL, 'admin', '2020-02-21 16:21:58', NULL, NULL, 'A01A03', NULL, 0);
INSERT INTO `sys_category` VALUES ('1230769769930592257', '1230769253267836929', '淮南市', NULL, 'admin', '2020-02-21 16:22:34', 'admin', '2020-02-21 16:22:54', 'A01A03', '1', 0);
INSERT INTO `sys_category` VALUES ('1230769855347593217', '1230769769930592257', 'C区', NULL, 'admin', '2020-02-21 16:22:54', NULL, NULL, 'A01A03', NULL, 0);
INSERT INTO `sys_category` VALUES ('1590548229606047745', '0', '物料树C', 'C02', 'admin', '2022-11-10 11:33:44', NULL, NULL, 'A01', '1', 0);
INSERT INTO `sys_category` VALUES ('1590548229652185090', '1590548229606047745', '上衣C', 'C02A01', 'admin', '2022-11-10 11:33:44', NULL, NULL, 'A01', '1', 0);
INSERT INTO `sys_category` VALUES ('1590548229668962305', '1590548229606047745', '裤子C', 'C02A02', 'admin', '2022-11-10 11:33:44', NULL, NULL, 'A01', NULL, 0);
INSERT INTO `sys_category` VALUES ('1590548229685739522', '1590548229652185090', '秋衣C', 'C02A01A01', 'admin', '2022-11-10 11:33:44', NULL, NULL, 'A01', NULL, 0);
INSERT INTO `sys_category` VALUES ('22a50b413c5e1ef661fb8aea9469cf52', 'e9ded10fd33e5753face506f4f1564b5', 'MacBook', 'B01-2-1', 'admin', '2019-06-10 15:43:13', NULL, NULL, 'A01', NULL, 0);
INSERT INTO `sys_category` VALUES ('5c8f68845e57f68ab93a2c8d82d26ae1', '0', '笔记本', 'B01', 'admin', '2019-06-10 15:34:11', 'admin', '2019-06-10 15:34:24', 'A01', '1', 0);
INSERT INTO `sys_category` VALUES ('937fd2e9aa13b8bab1da1ca36d3fd344', 'e9ded10fd33e5753face506f4f1564b5', '台式机', 'B01-2-2', 'admin', '2019-06-10 15:43:32', 'admin', '2019-08-21 12:01:59', 'A01', NULL, 0);
INSERT INTO `sys_category` VALUES ('e9ded10fd33e5753face506f4f1564b5', '5c8f68845e57f68ab93a2c8d82d26ae1', '苹果电脑', 'B01-2', 'admin', '2019-06-10 15:41:14', 'admin', '2019-06-10 15:43:13', 'A01', '1', 0);
INSERT INTO `sys_category` VALUES ('f39a06bf9f390ba4a53d11bc4e0018d7', '5c8f68845e57f68ab93a2c8d82d26ae1', '华为', 'B01-1', 'admin', '2019-06-10 15:34:24', 'admin', '2019-08-21 12:01:56', 'A01', NULL, 0);

-- ----------------------------
-- Table structure for sys_check_rule
-- ----------------------------
DROP TABLE IF EXISTS `sys_check_rule`;
CREATE TABLE `sys_check_rule`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键id',
  `rule_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规则名称',
  `rule_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规则Code',
  `rule_json` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规则JSON',
  `rule_description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规则描述',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_scr_rule_code`(`rule_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_check_rule
-- ----------------------------
INSERT INTO `sys_check_rule` VALUES ('1224980593992388610', '通用编码规则', 'common', '[{\"digits\":\"1\",\"pattern\":\"^[a-z|A-Z]$\",\"message\":\"第一位只能是字母\"},{\"digits\":\"*\",\"pattern\":\"^[0-9|a-z|A-Z|_]{0,}$\",\"message\":\"只能填写数字、大小写字母、下划线\"},{\"digits\":\"*\",\"pattern\":\"^.{3,}$\",\"message\":\"最少输入3位数\"},{\"digits\":\"*\",\"pattern\":\"^.{3,12}$\",\"message\":\"最多输入12位数\"}]', '规则：1、首位只能是字母；2、只能填写数字、大小写字母、下划线；3、最少3位数，最多12位数。', 'admin', '2020-02-07 11:25:48', 'admin', '2020-02-05 16:58:27');
INSERT INTO `sys_check_rule` VALUES ('1225001845524004866', '负责的功能测试', 'test', '[{\"digits\":\"*\",\"pattern\":\"^.{3,12}$\",\"message\":\"只能输入3-12位字符\"},{\"digits\":\"3\",\"pattern\":\"^\\\\d{3}$\",\"message\":\"前3位必须是数字\"},{\"digits\":\"*\",\"pattern\":\"^[^pP]*$\",\"message\":\"不能输入P\"},{\"digits\":\"4\",\"pattern\":\"^@{4}$\",\"message\":\"第4-7位必须都为 @\"},{\"digits\":\"2\",\"pattern\":\"^#=$\",\"message\":\"第8-9位必须是 #=\"},{\"digits\":\"1\",\"pattern\":\"^O$\",\"message\":\"第10位必须为大写的O\"},{\"digits\":\"*\",\"pattern\":\"^.*。$\",\"message\":\"必须以。结尾\"}]', '包含长度校验、特殊字符校验等', 'admin', '2020-02-07 11:57:31', 'admin', '2020-02-05 18:22:54');

-- ----------------------------
-- Table structure for sys_comment
-- ----------------------------
DROP TABLE IF EXISTS `sys_comment`;
CREATE TABLE `sys_comment`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `table_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表名',
  `table_data_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据id',
  `from_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '来源用户id',
  `to_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发送给用户id(允许为空)',
  `comment_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论id(允许为空，不为空时，则为回复)',
  `comment_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '回复内容',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建日期',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_table_data_id`(`table_name`, `table_data_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统评论回复表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_comment
-- ----------------------------
INSERT INTO `sys_comment` VALUES ('1580814554312093698', 'v3_hello', '1580529718871674882', 'e9ca23d68d884d4ebb19d07889727dae', '', '', '1212\n:open_mouth:', 'admin', '2022-10-14 14:55:35', NULL, NULL);
INSERT INTO `sys_comment` VALUES ('1580814573433925634', 'v3_hello', '1580529718871674882', 'e9ca23d68d884d4ebb19d07889727dae', '', '', '上传了附件', 'admin', '2022-10-14 14:55:39', NULL, NULL);
INSERT INTO `sys_comment` VALUES ('1580814621358043137', 'v3_hello', '1580529718871674882', 'e9ca23d68d884d4ebb19d07889727dae', '', '', '干啥啊', 'admin', '2022-10-14 14:55:51', NULL, NULL);
INSERT INTO `sys_comment` VALUES ('1584490724803174402', 'v3_hello', '1580529718871674882', 'e9ca23d68d884d4ebb19d07889727dae', '', '', '1212:nerd_face:', 'admin', '2022-10-24 18:23:22', NULL, NULL);
INSERT INTO `sys_comment` VALUES ('1584490998162743298', 'v3_hello', '1580510370266238978', 'e9ca23d68d884d4ebb19d07889727dae', '', '', '123123', 'admin', '2022-10-24 18:24:27', NULL, NULL);
INSERT INTO `sys_comment` VALUES ('1584491122888761345', 'v3_hello', '1580510370266238978', 'e9ca23d68d884d4ebb19d07889727dae', '', '', '333', 'admin', '2022-10-24 18:24:57', NULL, NULL);
INSERT INTO `sys_comment` VALUES ('1584493914588143617', 'v3_hello', '1580529718871674882', 'e9ca23d68d884d4ebb19d07889727dae', '', '', '2222', 'admin', '2022-10-24 18:36:02', NULL, NULL);
INSERT INTO `sys_comment` VALUES ('1584493923496845313', 'v3_hello', '1580529718871674882', 'e9ca23d68d884d4ebb19d07889727dae', '', '', '333', 'admin', '2022-10-24 18:36:04', NULL, NULL);
INSERT INTO `sys_comment` VALUES ('1584493984364584961', 'v3_hello', '1580510370266238978', 'e9ca23d68d884d4ebb19d07889727dae', '', '', '上传了附件', 'admin', '2022-10-24 18:36:19', NULL, NULL);

-- ----------------------------
-- Table structure for sys_data_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_data_log`;
CREATE TABLE `sys_data_log`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人登录名称',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建日期',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人登录名称',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新日期',
  `data_table` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表名',
  `data_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据ID',
  `data_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '数据内容',
  `data_version` int(11) NULL DEFAULT NULL COMMENT '版本号',
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'json' COMMENT '类型',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sdl_data_table_id`(`data_table`, `data_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_data_log
-- ----------------------------
INSERT INTO `sys_data_log` VALUES ('1523903071766949890', NULL, '2022-05-10 13:49:40', NULL, NULL, 'jeecg_demo', '4028ef81550c1a7901550c1cd6e70001', '{\r\n	\"mobilePhone\":\"1872222222\",\r\n	\"officePhone\":\"1222222\",\r\n	\"email\":\"\",\r\n	\"createDate\":\"Jun 23, 2016 12:00:00 PM\",\r\n	\"sex\":\"1\",\r\n	\"depId\":\"402880e447e99cf10147e9a03b320003\",\r\n	\"userName\":\"9001\",\r\n	\"status\":\"1\",\r\n	\"content\":\"111\",\r\n	\"id\":\"4028ef81550c1a7901550c1cd6e70001\"\r\n}', 4, 'json');
-- ----------------------------
-- Table structure for sys_data_source
-- ----------------------------
DROP TABLE IF EXISTS `sys_data_source`;
CREATE TABLE `sys_data_source`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据源编码',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据源名称',
  `remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `db_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据库类型',
  `db_driver` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '驱动类',
  `db_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据源地址',
  `db_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据库名称',
  `db_username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `db_password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建日期',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新日期',
  `sys_org_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所属部门',
  `tenant_id` int(10) NULL DEFAULT 0 COMMENT '租户ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_sdc_rule_code`(`code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_data_source
-- ----------------------------
INSERT INTO `sys_data_source` VALUES ('1209779538310004737', 'local_mysql', 'MySQL5.7', '本地数据库MySQL5.7', '1', 'com.mysql.jdbc.Driver', 'jdbc:mysql://127.0.0.1:3306/jeecg-boot?characterEncoding=UTF-8&useUnicode=true&useSSL=false', 'jeecg-boot', 'root', 'f5b6775e8d1749483f2320627de0e706', 'admin', '2019-12-25 18:14:53', 'admin', '2020-07-10 16:54:42', 'A01', 0);

-- ----------------------------
-- Table structure for sys_depart
-- ----------------------------
DROP TABLE IF EXISTS `sys_depart`;
CREATE TABLE `sys_depart`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ID',
  `parent_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父机构ID',
  `depart_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '机构/部门名称',
  `depart_name_en` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英文名',
  `depart_name_abbr` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '缩写',
  `depart_order` int(11) NULL DEFAULT 0 COMMENT '排序',
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `org_category` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '机构类别 1公司，2组织机构，2岗位',
  `org_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构类型 1一级部门 2子部门',
  `org_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '机构编码',
  `mobile` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `fax` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '传真',
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `memo` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `status` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态（1启用，0不启用）',
  `del_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '删除状态（0，正常，1已删除）',
  `qywx_identifier` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对接企业微信的ID',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建日期',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新日期',
  `tenant_id` int(10) NULL DEFAULT 0 COMMENT '租户ID',
  `iz_leaf` tinyint(1) NULL DEFAULT 0 COMMENT '是否有叶子节点: 1是0否',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_depart_org_code`(`org_code`) USING BTREE,
  INDEX `idx_sd_parent_id`(`parent_id`) USING BTREE,
  INDEX `idx_sd_depart_order`(`depart_order`) USING BTREE,
  INDEX `idx_sd_org_code`(`org_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '组织机构表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_depart
-- ----------------------------
INSERT INTO `sys_depart` VALUES ('1582683631414632450', 'c6d7cb4deeac411cb3384b1b31278596', '销售公关岗位', NULL, NULL, 0, NULL, '3', '2', 'A01A06', NULL, NULL, NULL, NULL, NULL, '0', NULL, 'admin', '2022-10-19 18:42:37', NULL, NULL, 0, 0);
INSERT INTO `sys_depart` VALUES ('4f1765520d6346f9bd9c79e2479e5b12', 'c6d7cb4deeac411cb3384b1b31278596', '市场部', NULL, NULL, 0, NULL, '1', '2', 'A01A03', NULL, NULL, NULL, NULL, NULL, '0', NULL, 'admin', '2019-02-20 17:15:34', 'admin', '2019-02-26 16:36:18', 0, 0);
INSERT INTO `sys_depart` VALUES ('5159cde220114246b045e574adceafe9', '6d35e179cd814e3299bd588ea7daed3f', '研发部', NULL, NULL, 0, NULL, '1', '2', 'A02A02', NULL, NULL, NULL, NULL, NULL, '0', NULL, 'admin', '2019-02-26 16:44:38', 'admin', '2019-03-07 09:36:53', 0, 0);
INSERT INTO `sys_depart` VALUES ('57197590443c44f083d42ae24ef26a2c', 'c6d7cb4deeac411cb3384b1b31278596', '研发部', NULL, NULL, 0, NULL, '1', '2', 'A01A05', NULL, NULL, NULL, NULL, NULL, '0', NULL, 'admin', '2019-02-21 16:14:41', 'admin', '2019-03-27 19:05:49', 0, 0);
INSERT INTO `sys_depart` VALUES ('63775228b7b041a99825f79760590b7d', '57197590443c44f083d42ae24ef26a2c', '研发经理', NULL, NULL, 0, NULL, '3', '3', 'A01A05A01', NULL, NULL, NULL, NULL, NULL, '0', NULL, 'admin', '2020-05-02 15:29:09', NULL, NULL, 0, 0);
INSERT INTO `sys_depart` VALUES ('67fc001af12a4f9b8458005d3f19934a', 'c6d7cb4deeac411cb3384b1b31278596', '财务部', NULL, NULL, 0, NULL, '1', '2', 'A01A04', NULL, NULL, NULL, NULL, NULL, '0', NULL, 'admin', '2019-02-21 16:14:35', 'admin', '2019-02-25 12:49:41', 0, 0);
INSERT INTO `sys_depart` VALUES ('6d35e179cd814e3299bd588ea7daed3f', '', '北京卓尔互动', NULL, NULL, 0, NULL, '1', '1', 'A02', NULL, NULL, NULL, NULL, NULL, '0', NULL, 'admin', '2019-02-26 16:36:39', 'admin', '2020-05-02 18:21:22', 0, 0);
INSERT INTO `sys_depart` VALUES ('a7d7e77e06c84325a40932163adcdaa6', '6d35e179cd814e3299bd588ea7daed3f', '财务部', NULL, NULL, 0, NULL, '1', '2', 'A02A01', NULL, NULL, NULL, NULL, NULL, '0', NULL, 'admin', '2019-02-26 16:36:47', 'admin', '2022-10-14 18:57:56', 0, 0);
INSERT INTO `sys_depart` VALUES ('c6d7cb4deeac411cb3384b1b31278596', '', '北京国炬软件', NULL, NULL, 0, NULL, '1', '1', 'A01', NULL, NULL, NULL, NULL, NULL, '0', NULL, 'admin', '2019-02-11 14:21:51', 'admin', '2020-05-02 18:21:27', 0, 0);

-- ----------------------------
-- Table structure for sys_depart_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_depart_permission`;
CREATE TABLE `sys_depart_permission`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `depart_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门id',
  `permission_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限id',
  `data_rule_ids` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据规则id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_depart_permission
-- ----------------------------
INSERT INTO `sys_depart_permission` VALUES ('1260925131934519297', '6d35e179cd814e3299bd588ea7daed3f', 'f0675b52d89100ee88472b6800754a08', NULL);
INSERT INTO `sys_depart_permission` VALUES ('1260925131947102209', '6d35e179cd814e3299bd588ea7daed3f', '2aeddae571695cd6380f6d6d334d6e7d', NULL);
INSERT INTO `sys_depart_permission` VALUES ('1260925131955490818', '6d35e179cd814e3299bd588ea7daed3f', '020b06793e4de2eee0007f603000c769', NULL);
INSERT INTO `sys_depart_permission` VALUES ('1260925131959685121', '6d35e179cd814e3299bd588ea7daed3f', '1232123780958064642', NULL);

-- ----------------------------
-- Table structure for sys_depart_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_depart_role`;
CREATE TABLE `sys_depart_role`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `depart_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门id',
  `role_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门角色名称',
  `role_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门角色编码',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_depart_role
-- ----------------------------
INSERT INTO `sys_depart_role` VALUES ('1260925293226479618', '6d35e179cd814e3299bd588ea7daed3f', 'roless', 'ssss', NULL, 'admin', '2020-05-14 21:29:51', NULL, NULL);

-- ----------------------------
-- Table structure for sys_depart_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_depart_role_permission`;
CREATE TABLE `sys_depart_role_permission`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `depart_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门id',
  `role_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色id',
  `permission_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限id',
  `data_rule_ids` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据权限ids',
  `operate_date` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `operate_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作ip',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sdrp_role_per_id`(`role_id`, `permission_id`) USING BTREE,
  INDEX `idx_sdrp_role_id`(`role_id`) USING BTREE,
  INDEX `idx_sdrp_per_id`(`permission_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门角色权限表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_depart_role_permission
-- ----------------------------
INSERT INTO `sys_depart_role_permission` VALUES ('1260925328689319938', NULL, '1260925293226479618', '2aeddae571695cd6380f6d6d334d6e7d', NULL, NULL, NULL);
INSERT INTO `sys_depart_role_permission` VALUES ('1260925328706097153', NULL, '1260925293226479618', '020b06793e4de2eee0007f603000c769', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_depart_role_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_depart_role_user`;
CREATE TABLE `sys_depart_role_user`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键id',
  `user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户id',
  `drole_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门角色用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_depart_role_user
-- ----------------------------

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典名称',
  `dict_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典编码',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `del_flag` int(1) NULL DEFAULT NULL COMMENT '删除状态',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `type` int(1) UNSIGNED ZEROFILL NULL DEFAULT 0 COMMENT '字典类型0为string,1为number',
  `tenant_id` int(10) NULL DEFAULT 0 COMMENT '租户ID',
  `low_app_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '低代码应用ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_sd_dict_code`(`dict_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('0b5d19e1fce4b2e6647e6b4a17760c14', '通告类型', 'msg_category', '消息类型1:通知公告2:系统消息', 0, 'admin', '2019-04-22 18:01:35', NULL, NULL, 0, 0, NULL);
INSERT INTO `sys_dict` VALUES ('1174509082208395266', '职务职级', 'position_rank', '职务表职级字典', 0, 'admin', '2019-09-19 10:22:41', NULL, NULL, 0, 0, NULL);
INSERT INTO `sys_dict` VALUES ('1174511106530525185', '机构类型', 'org_category', '机构类型 1公司，2部门 3岗位', 0, 'admin', '2019-09-19 10:30:43', NULL, NULL, 0, 0, NULL);
INSERT INTO `sys_dict` VALUES ('1178295274528845826', '表单权限策略', 'form_perms_type', '', 0, 'admin', '2019-09-29 21:07:39', 'admin', '2019-09-29 21:08:26', NULL, 0, NULL);
INSERT INTO `sys_dict` VALUES ('1199517671259906049', '紧急程度', 'urgent_level', '日程计划紧急程度', 0, 'admin', '2019-11-27 10:37:53', NULL, NULL, 0, 0, NULL);
INSERT INTO `sys_dict` VALUES ('1199518099888414722', '日程计划类型', 'eoa_plan_type', '', 0, 'admin', '2019-11-27 10:39:36', NULL, NULL, 0, 0, NULL);
INSERT INTO `sys_dict` VALUES ('1199520177767587841', '分类栏目类型', 'eoa_cms_menu_type', '', 0, 'admin', '2019-11-27 10:47:51', 'admin', '2019-11-27 10:49:35', 0, 0, NULL);
INSERT INTO `sys_dict` VALUES ('1199525215290306561', '日程计划状态', 'eoa_plan_status', '', 0, 'admin', '2019-11-27 11:07:52', 'admin', '2019-11-27 11:10:11', 0, 0, NULL);
INSERT INTO `sys_dict` VALUES ('1209733563293962241', '数据库类型', 'database_type', '', 0, 'admin', '2019-12-25 15:12:12', NULL, NULL, 0, 0, NULL);
INSERT INTO `sys_dict` VALUES ('1232913193820581889', 'Online表单业务分类', 'ol_form_biz_type', '', 0, 'admin', '2020-02-27 14:19:46', 'admin', '2020-02-27 14:20:23', 0, 0, NULL);
INSERT INTO `sys_dict` VALUES ('1242298510024429569', '提醒方式', 'remindMode', '', 0, 'admin', '2020-03-24 11:53:40', 'admin', '2020-03-24 12:03:22', 0, 0, NULL);
INSERT INTO `sys_dict` VALUES ('1250687930947620866', '定时任务状态', 'quartz_status', '', 0, 'admin', '2020-04-16 15:30:14', '', NULL, NULL, 0, NULL);
INSERT INTO `sys_dict` VALUES ('1280401766745718786', '租户状态', 'tenant_status', '租户状态', 0, 'admin', '2020-07-07 15:22:25', NULL, NULL, 0, 0, NULL);
INSERT INTO `sys_dict` VALUES ('1356445645198135298', '开关', 'is_open', '', 0, 'admin', '2021-02-02 11:33:38', 'admin', '2021-02-02 15:28:12', 0, 0, NULL);
INSERT INTO `sys_dict` VALUES ('1600042215909134338', '所属行业', 'trade', '行业', 0, 'admin', '2022-12-06 16:19:26', 'admin', '2022-12-06 16:20:50', 0, 0, NULL);
INSERT INTO `sys_dict` VALUES ('1600044537800331266', '公司规模', 'company_size', '公司规模', 0, 'admin', '2022-12-06 16:28:40', 'admin', '2022-12-06 16:30:23', 0, 0, NULL);
INSERT INTO `sys_dict` VALUES ('1606645341269299201', '职级', 'company_rank', '公司职级', 0, 'admin', '2022-12-24 21:37:54', 'admin', '2022-12-24 21:38:25', 0, 0, NULL);
INSERT INTO `sys_dict` VALUES ('1606646440684457986', '公司部门', 'company_department', '公司部门', 0, 'admin', '2022-12-24 21:42:16', NULL, NULL, 0, 0, NULL);
INSERT INTO `sys_dict` VALUES ('236e8a4baff0db8c62c00dd95632834f', '同步工作流引擎', 'activiti_sync', '同步工作流引擎', 0, 'admin', '2019-05-15 15:27:33', NULL, NULL, 0, 0, NULL);
INSERT INTO `sys_dict` VALUES ('2e02df51611a4b9632828ab7e5338f00', '权限策略', 'perms_type', '权限策略', 0, 'admin', '2019-04-26 18:26:55', NULL, NULL, 0, 0, NULL);
INSERT INTO `sys_dict` VALUES ('2f0320997ade5dd147c90130f7218c3e', '推送类别', 'msg_type', '', 0, 'admin', '2019-03-17 21:21:32', 'admin', '2019-03-26 19:57:45', 0, 0, NULL);
INSERT INTO `sys_dict` VALUES ('3486f32803bb953e7155dab3513dc68b', '删除状态', 'del_flag', NULL, 0, 'admin', '2019-01-18 21:46:26', 'admin', '2019-03-30 11:17:11', 0, 0, NULL);
INSERT INTO `sys_dict` VALUES ('3d9a351be3436fbefb1307d4cfb49bf2', '性别', 'sex', NULL, 0, NULL, '2019-01-04 14:56:32', 'admin', '2019-03-30 11:28:27', 1, 0, NULL);
INSERT INTO `sys_dict` VALUES ('4274efc2292239b6f000b153f50823ff', '全局权限策略', 'global_perms_type', '全局权限策略', 0, 'admin', '2019-05-10 17:54:05', NULL, NULL, 0, 0, NULL);
INSERT INTO `sys_dict` VALUES ('4c03fca6bf1f0299c381213961566349', 'Online图表展示模板', 'online_graph_display_template', 'Online图表展示模板', 0, 'admin', '2019-04-12 17:28:50', NULL, NULL, 0, 0, NULL);
INSERT INTO `sys_dict` VALUES ('4c753b5293304e7a445fd2741b46529d', '字典状态', 'dict_item_status', NULL, 0, 'admin', '2020-06-18 23:18:42', 'admin', '2019-03-30 19:33:52', 1, 0, NULL);
INSERT INTO `sys_dict` VALUES ('4d7fec1a7799a436d26d02325eff295e', '优先级', 'priority', '优先级', 0, 'admin', '2019-03-16 17:03:34', 'admin', '2019-04-16 17:39:23', 0, 0, NULL);
INSERT INTO `sys_dict` VALUES ('4e4602b3e3686f0911384e188dc7efb4', '条件规则', 'rule_conditions', '', 0, 'admin', '2019-04-01 10:15:03', 'admin', '2019-04-01 10:30:47', 0, 0, NULL);
INSERT INTO `sys_dict` VALUES ('4f69be5f507accea8d5df5f11346181a', '发送消息类型', 'msgType', NULL, 0, 'admin', '2019-04-11 14:27:09', NULL, NULL, 0, 0, NULL);
INSERT INTO `sys_dict` VALUES ('68168534ff5065a152bfab275c2136f8', '有效无效状态', 'valid_status', '有效无效状态', 0, 'admin', '2020-09-26 19:21:14', 'admin', '2019-04-26 19:21:23', 0, 0, NULL);
INSERT INTO `sys_dict` VALUES ('6b78e3f59faec1a4750acff08030a79b', '用户类型', 'user_type', NULL, 0, NULL, '2019-01-04 14:59:01', 'admin', '2019-03-18 23:28:18', 0, 0, NULL);
INSERT INTO `sys_dict` VALUES ('72cce0989df68887546746d8f09811aa', 'Online表单类型', 'cgform_table_type', '', 0, 'admin', '2019-01-27 10:13:02', 'admin', '2019-03-30 11:37:36', 0, 0, NULL);
INSERT INTO `sys_dict` VALUES ('78bda155fe380b1b3f175f1e88c284c6', '流程状态', 'bpm_status', '流程状态', 0, 'admin', '2019-05-09 16:31:52', NULL, NULL, 0, 0, NULL);
INSERT INTO `sys_dict` VALUES ('83bfb33147013cc81640d5fd9eda030c', '日志类型', 'log_type', NULL, 0, 'admin', '2019-03-18 23:22:19', NULL, NULL, 1, 0, NULL);
INSERT INTO `sys_dict` VALUES ('845da5006c97754728bf48b6a10f79cc', '状态', 'status', NULL, 0, 'admin', '2019-03-18 21:45:25', 'admin', '2019-03-18 21:58:25', 0, 0, NULL);
INSERT INTO `sys_dict` VALUES ('880a895c98afeca9d9ac39f29e67c13e', '操作类型', 'operate_type', '操作类型', 0, 'admin', '2019-07-22 10:54:29', NULL, NULL, 0, 0, NULL);
INSERT INTO `sys_dict` VALUES ('8dfe32e2d29ea9430a988b3b558bf233', '发布状态', 'send_status', '发布状态', 0, 'admin', '2019-04-16 17:40:42', NULL, NULL, 0, 0, NULL);
INSERT INTO `sys_dict` VALUES ('a7adbcd86c37f7dbc9b66945c82ef9e6', '1是0否', 'yn', '', 0, 'admin', '2019-05-22 19:29:29', NULL, NULL, 0, 0, NULL);
INSERT INTO `sys_dict` VALUES ('a9d9942bd0eccb6e89de92d130ec4c4a', '消息发送状态', 'msgSendStatus', NULL, 0, 'admin', '2019-04-12 18:18:17', NULL, NULL, 0, 0, NULL);
INSERT INTO `sys_dict` VALUES ('ac2f7c0c5c5775fcea7e2387bcb22f01', '菜单类型', 'menu_type', NULL, 0, 'admin', '2020-12-18 23:24:32', 'admin', '2019-04-01 15:27:06', 1, 0, NULL);
INSERT INTO `sys_dict` VALUES ('ad7c65ba97c20a6805d5dcdf13cdaf36', 'onlineT类型', 'ceshi_online', NULL, 0, 'admin', '2019-03-22 16:31:49', 'admin', '2019-03-22 16:34:16', 0, 0, NULL);
INSERT INTO `sys_dict` VALUES ('bd1b8bc28e65d6feefefb6f3c79f42fd', 'Online图表数据类型', 'online_graph_data_type', 'Online图表数据类型', 0, 'admin', '2019-04-12 17:24:24', 'admin', '2019-04-12 17:24:57', 0, 0, NULL);
INSERT INTO `sys_dict` VALUES ('c36169beb12de8a71c8683ee7c28a503', '部门状态', 'depart_status', NULL, 0, 'admin', '2019-03-18 21:59:51', NULL, NULL, 0, 0, NULL);
INSERT INTO `sys_dict` VALUES ('c5a14c75172783d72cbee6ee7f5df5d1', 'Online图表类型', 'online_graph_type', 'Online图表类型', 0, 'admin', '2019-04-12 17:04:06', NULL, NULL, 0, 0, NULL);
INSERT INTO `sys_dict` VALUES ('d6e1152968b02d69ff358c75b48a6ee1', '流程类型', 'bpm_process_type', NULL, 0, 'admin', '2021-02-22 19:26:54', 'admin', '2019-03-30 18:14:44', 0, 0, NULL);
INSERT INTO `sys_dict` VALUES ('fc6cd58fde2e8481db10d3a1e68ce70c', '用户状态', 'user_status', NULL, 0, 'admin', '2019-03-18 21:57:25', 'admin', '2019-03-18 23:11:58', 1, 0, NULL);

-- ----------------------------
-- Table structure for sys_dict_item
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_item`;
CREATE TABLE `sys_dict_item`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dict_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典id',
  `item_text` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典项文本',
  `item_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典项值',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `sort_order` int(10) NULL DEFAULT NULL COMMENT '排序',
  `status` int(11) NULL DEFAULT NULL COMMENT '状态（1启用 0不启用）',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sdi_role_dict_id`(`dict_id`) USING BTREE,
  INDEX `idx_sdi_role_sort_order`(`sort_order`) USING BTREE,
  INDEX `idx_sdi_status`(`status`) USING BTREE,
  INDEX `idx_sdi_dict_val`(`dict_id`, `item_value`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_item
-- ----------------------------
INSERT INTO `sys_dict_item` VALUES ('0072d115e07c875d76c9b022e2179128', '4d7fec1a7799a436d26d02325eff295e', '低', 'L', '低', 3, 1, 'admin', '2019-04-16 17:04:59', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('05a2e732ce7b00aa52141ecc3e330b4e', '3486f32803bb953e7155dab3513dc68b', '已删除', '1', NULL, NULL, 1, 'admin', '2025-10-18 21:46:56', 'admin', '2019-03-28 22:23:20');
INSERT INTO `sys_dict_item` VALUES ('096c2e758d823def3855f6376bc736fb', 'bd1b8bc28e65d6feefefb6f3c79f42fd', 'SQL', 'sql', NULL, 1, 1, 'admin', '2019-04-12 17:26:26', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('0c9532916f5cd722017b46bc4d953e41', '2f0320997ade5dd147c90130f7218c3e', '指定用户', 'USER', NULL, NULL, 1, 'admin', '2019-03-17 21:22:19', 'admin', '2019-03-17 21:22:28');
INSERT INTO `sys_dict_item` VALUES ('0ca4beba9efc4f9dd54af0911a946d5c', '72cce0989df68887546746d8f09811aa', '附表', '3', NULL, 3, 1, 'admin', '2019-03-27 10:13:43', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1030a2652608f5eac3b49d70458b8532', '2e02df51611a4b9632828ab7e5338f00', '禁用', '2', '禁用', 2, 1, 'admin', '2021-03-26 18:27:28', 'admin', '2019-04-26 18:39:11');
INSERT INTO `sys_dict_item` VALUES ('1174509082208395266', '1174511106530525185', '岗位', '3', '岗位', 1, 1, 'admin', '2019-09-19 10:31:16', '', NULL);
INSERT INTO `sys_dict_item` VALUES ('1174509601047994369', '1174509082208395266', '员级', '1', '', 1, 1, 'admin', '2019-09-19 10:24:45', 'admin', '2019-09-23 11:46:39');
INSERT INTO `sys_dict_item` VALUES ('1174509667297026049', '1174509082208395266', '助级', '2', '', 2, 1, 'admin', '2019-09-19 10:25:01', 'admin', '2019-09-23 11:46:47');
INSERT INTO `sys_dict_item` VALUES ('1174509713568587777', '1174509082208395266', '中级', '3', '', 3, 1, 'admin', '2019-09-19 10:25:12', 'admin', '2019-09-23 11:46:56');
INSERT INTO `sys_dict_item` VALUES ('1174509788361416705', '1174509082208395266', '副高级', '4', '', 4, 1, 'admin', '2019-09-19 10:25:30', 'admin', '2019-09-23 11:47:06');
INSERT INTO `sys_dict_item` VALUES ('1174509835803189250', '1174509082208395266', '正高级', '5', '', 5, 1, 'admin', '2019-09-19 10:25:41', 'admin', '2019-09-23 11:47:12');
INSERT INTO `sys_dict_item` VALUES ('1174511197735665665', '1174511106530525185', '公司', '1', '公司', 1, 1, 'admin', '2019-09-19 10:31:05', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1174511244036587521', '1174511106530525185', '部门', '2', '部门', 1, 1, 'admin', '2019-09-19 10:31:16', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1178295553450061826', '1178295274528845826', '可编辑(未授权禁用)', '2', '', 2, 1, 'admin', '2019-09-29 21:08:46', 'admin', '2019-09-29 21:09:18');
INSERT INTO `sys_dict_item` VALUES ('1178295639554928641', '1178295274528845826', '可见(未授权不可见)', '1', '', 1, 1, 'admin', '2019-09-29 21:09:06', 'admin', '2019-09-29 21:09:24');
INSERT INTO `sys_dict_item` VALUES ('1199517884758368257', '1199517671259906049', '一般', '1', '', 1, 1, 'admin', '2019-11-27 10:38:44', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1199517914017832962', '1199517671259906049', '重要', '2', '', 1, 1, 'admin', '2019-11-27 10:38:51', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1199517941339529217', '1199517671259906049', '紧急', '3', '', 1, 1, 'admin', '2019-11-27 10:38:58', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1199518186144276482', '1199518099888414722', '日常记录', '1', '', 1, 1, 'admin', '2019-11-27 10:39:56', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1199518214858481666', '1199518099888414722', '本周工作', '2', '', 1, 1, 'admin', '2019-11-27 10:40:03', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1199518235943247874', '1199518099888414722', '下周计划', '3', '', 1, 1, 'admin', '2019-11-27 10:40:08', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1199520817285701634', '1199520177767587841', '列表', '1', '', 1, 1, 'admin', '2019-11-27 10:50:24', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1199520835035996161', '1199520177767587841', '链接', '2', '', 1, 1, 'admin', '2019-11-27 10:50:28', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1199525468672405505', '1199525215290306561', '未开始', '0', '', 1, 1, 'admin', '2019-11-27 11:08:52', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1199525490575060993', '1199525215290306561', '进行中', '1', '', 1, 1, 'admin', '2019-11-27 11:08:58', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1199525506429530114', '1199525215290306561', '已完成', '2', '', 1, 1, 'admin', '2019-11-27 11:09:02', 'admin', '2019-11-27 11:10:02');
INSERT INTO `sys_dict_item` VALUES ('1209733775114702850', '1209733563293962241', 'MySQL5.5', '1', '', 1, 1, 'admin', '2019-12-25 15:13:02', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1209733839933476865', '1209733563293962241', 'Oracle', '2', '', 3, 1, 'admin', '2019-12-25 15:13:18', 'admin', '2021-07-15 13:44:08');
INSERT INTO `sys_dict_item` VALUES ('1209733903020003330', '1209733563293962241', 'SQLServer', '3', '', 4, 1, 'admin', '2019-12-25 15:13:33', 'admin', '2021-07-15 13:44:11');
INSERT INTO `sys_dict_item` VALUES ('1232913424813486081', '1232913193820581889', '官方示例', 'demo', '', 1, 1, 'admin', '2020-02-27 14:20:42', 'admin', '2020-02-27 14:21:37');
INSERT INTO `sys_dict_item` VALUES ('1232913493717512194', '1232913193820581889', '流程表单', 'bpm', '', 2, 1, 'admin', '2020-02-27 14:20:58', 'admin', '2020-02-27 14:22:20');
INSERT INTO `sys_dict_item` VALUES ('1232913605382467585', '1232913193820581889', '测试表单', 'temp', '', 4, 1, 'admin', '2020-02-27 14:21:25', 'admin', '2020-02-27 14:22:16');
INSERT INTO `sys_dict_item` VALUES ('1232914232372195330', '1232913193820581889', '导入表单', 'bdfl_include', '', 5, 1, 'admin', '2020-02-27 14:23:54', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1234371726545010689', '4e4602b3e3686f0911384e188dc7efb4', '左模糊', 'LEFT_LIKE', '左模糊', 7, 1, 'admin', '2020-03-02 14:55:27', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1234371809495760898', '4e4602b3e3686f0911384e188dc7efb4', '右模糊', 'RIGHT_LIKE', '右模糊', 7, 1, 'admin', '2020-03-02 14:55:47', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1242300779390357505', '1242298510024429569', '短信提醒', '2', '', 2, 1, 'admin', '2020-03-24 12:02:41', 'admin', '2020-03-30 18:21:33');
INSERT INTO `sys_dict_item` VALUES ('1242300814383435777', '1242298510024429569', '邮件提醒', '1', '', 1, 1, 'admin', '2020-03-24 12:02:49', 'admin', '2020-03-30 18:21:26');
INSERT INTO `sys_dict_item` VALUES ('1242300887343353857', '1242298510024429569', '系统消息', '4', '', 4, 1, 'admin', '2020-03-24 12:03:07', 'admin', '2020-03-30 18:21:43');
INSERT INTO `sys_dict_item` VALUES ('1250688147579228161', '1250687930947620866', '正常', '0', '', 1, 1, 'admin', '2020-04-16 15:31:05', '', NULL);
INSERT INTO `sys_dict_item` VALUES ('1250688201064992770', '1250687930947620866', '停止', '-1', '', 1, 1, 'admin', '2020-04-16 15:31:18', '', NULL);
INSERT INTO `sys_dict_item` VALUES ('1280401815068295170', '1280401766745718786', '正常', '1', '', 1, 1, 'admin', '2020-07-07 15:22:36', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1280401847607705602', '1280401766745718786', '冻结', '0', '', 1, 1, 'admin', '2020-07-07 15:22:44', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1305827309355302914', 'bd1b8bc28e65d6feefefb6f3c79f42fd', 'API', 'api', '', 3, 1, 'admin', '2020-09-15 19:14:26', 'admin', '2020-09-15 19:14:41');
INSERT INTO `sys_dict_item` VALUES ('1334440962954936321', '1209733563293962241', 'MYSQL5.7+', '4', '', 2, 1, 'admin', '2020-12-03 18:16:02', 'admin', '2021-07-15 13:44:29');
INSERT INTO `sys_dict_item` VALUES ('1356445705549975553', '1356445645198135298', '是', 'Y', '', 1, 1, 'admin', '2021-02-02 11:33:52', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1356445754212290561', '1356445645198135298', '否', 'N', '', 1, 1, 'admin', '2021-02-02 11:34:04', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1414837074500976641', '1209733563293962241', 'postgresql', '6', '', 5, 1, 'admin', '2021-07-13 14:40:20', 'admin', '2021-07-15 13:44:15');
INSERT INTO `sys_dict_item` VALUES ('1415547541091504129', '1209733563293962241', 'marialDB', '5', '', 6, 1, 'admin', '2021-07-15 13:43:28', 'admin', '2021-07-15 13:44:23');
INSERT INTO `sys_dict_item` VALUES ('1418049969003089922', '1209733563293962241', '达梦', '7', '', 7, 1, 'admin', '2021-07-22 11:27:13', 'admin', '2021-07-22 11:27:30');
INSERT INTO `sys_dict_item` VALUES ('1418050017053036545', '1209733563293962241', '人大金仓', '8', '', 8, 1, 'admin', '2021-07-22 11:27:25', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1418050075555188737', '1209733563293962241', '神通', '9', '', 9, 1, 'admin', '2021-07-22 11:27:39', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1418050110669901826', '1209733563293962241', 'SQLite', '10', '', 10, 1, 'admin', '2021-07-22 11:27:47', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1418050149475602434', '1209733563293962241', 'DB2', '11', '', 11, 1, 'admin', '2021-07-22 11:27:56', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1418050209823248385', '1209733563293962241', 'Hsqldb', '12', '', 12, 1, 'admin', '2021-07-22 11:28:11', 'admin', '2021-07-22 11:28:27');
INSERT INTO `sys_dict_item` VALUES ('1418050323111399425', '1209733563293962241', 'Derby', '13', '', 13, 1, 'admin', '2021-07-22 11:28:38', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1418117316707590146', '1209733563293962241', 'H2', '14', '', 14, 1, 'admin', '2021-07-22 15:54:50', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1418491604048449537', '1209733563293962241', '其他数据库', '15', '', 15, 1, 'admin', '2021-07-23 16:42:07', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('147c48ff4b51545032a9119d13f3222a', 'd6e1152968b02d69ff358c75b48a6ee1', '测试流程', 'test', NULL, 1, 1, 'admin', '2019-03-22 19:27:05', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1543fe7e5e26fb97cdafe4981bedc0c8', '4c03fca6bf1f0299c381213961566349', '单排布局', 'single', NULL, 2, 1, 'admin', '2022-07-12 17:43:39', 'admin', '2019-04-12 17:43:57');
INSERT INTO `sys_dict_item` VALUES ('1600042651777011713', '1600042215909134338', '信息传输、软件和信息技术服务业', '1', NULL, 1, 1, 'admin', '2022-12-06 16:21:10', 'admin', '2022-12-06 16:21:27');
INSERT INTO `sys_dict_item` VALUES ('1600042736254488578', '1600042215909134338', '制造业', '2', NULL, 1, 1, 'admin', '2022-12-06 16:21:30', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1600042785646612481', '1600042215909134338', '租赁和商务服务业', '3', NULL, 1, 1, 'admin', '2022-12-06 16:21:42', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1600042835433000961', '1600042215909134338', '教育', '4', NULL, 1, 1, 'admin', '2022-12-06 16:21:54', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1600042892072882177', '1600042215909134338', '金融业', '5', NULL, 1, 1, 'admin', '2022-12-06 16:22:07', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1600042975539531778', '1600042215909134338', '建筑业', '6', NULL, 1, 1, 'admin', '2022-12-06 16:22:27', 'admin', '2022-12-06 16:22:32');
INSERT INTO `sys_dict_item` VALUES ('1600043052177854466', '1600042215909134338', '科学研究和技术服务业', '7', NULL, 1, 1, 'admin', '2022-12-06 16:22:46', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1600043101976825857', '1600042215909134338', '批发和零售业', '8', NULL, 1, 1, 'admin', '2022-12-06 16:22:58', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1600043157069008898', '1600042215909134338', '住宿和餐饮业', '9', NULL, 1, 1, 'admin', '2022-12-06 16:23:11', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1600043203105689601', '1600042215909134338', '电子商务', '10', NULL, 1, 1, 'admin', '2022-12-06 16:23:22', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1600043277504253953', '1600042215909134338', '线下零售与服务业', '11', NULL, 1, 1, 'admin', '2022-12-06 16:23:39', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1600043334618091521', '1600042215909134338', '文化、体育和娱乐业', '12', NULL, 1, 1, 'admin', '2022-12-06 16:23:53', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1600043401030701058', '1600042215909134338', '房地产业', '13', NULL, 1, 1, 'admin', '2022-12-06 16:24:09', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1600043476440092673', '1600042215909134338', '交通运输、仓储和邮政业', '14', NULL, 1, 1, 'admin', '2022-12-06 16:24:27', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1600043553837584386', '1600042215909134338', '卫生和社会工作', '15', NULL, 1, 1, 'admin', '2022-12-06 16:24:45', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1600043628793991170', '1600042215909134338', '公共管理、社会保障和社会组织', '16', NULL, 1, 1, 'admin', '2022-12-06 16:25:03', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1600043675329794050', '1600042215909134338', '电力、热力、燃气及水生产和供应业', '18', NULL, 1, 1, 'admin', '2022-12-06 16:25:14', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1600043734607892482', '1600042215909134338', '水利、环境和公共设施管理业', '19', NULL, 1, 1, 'admin', '2022-12-06 16:25:28', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1600043783068880897', '1600042215909134338', '居民服务、修理和其他服务业', '20', NULL, 1, 1, 'admin', '2022-12-06 16:25:40', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1600043822679887874', '1600042215909134338', '政府机构', '21', NULL, 1, 1, 'admin', '2022-12-06 16:25:49', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1600043859539431426', '1600042215909134338', '农、林、牧、渔业', '22', NULL, 1, 1, 'admin', '2022-12-06 16:25:58', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1600043907551629313', '1600042215909134338', '采矿业', '23', NULL, 1, 1, 'admin', '2022-12-06 16:26:10', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1600043955731599362', '1600042215909134338', '国际组织', '24', NULL, 1, 1, 'admin', '2022-12-06 16:26:21', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1600043991685173249', '1600042215909134338', '其他', '25', NULL, 1, 1, 'admin', '2022-12-06 16:26:30', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1600044644096577538', '1600044537800331266', '20人以下', '1', NULL, 1, 1, 'admin', '2022-12-06 16:29:05', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1600044698618335233', '1600044537800331266', '21-99人', '2', NULL, 1, 1, 'admin', '2022-12-06 16:29:18', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1600044744172670978', '1600044537800331266', '100-499人', '3', NULL, 1, 1, 'admin', '2022-12-06 16:29:29', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1600044792306503681', '1600044537800331266', '500-999人', '4', NULL, 1, 1, 'admin', '2022-12-06 16:29:41', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1600044861302804481', '1600044537800331266', '1000-9999人', '5', NULL, 1, 1, 'admin', '2022-12-06 16:29:57', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1600044924313833473', '1600044537800331266', '10000人以上', '6', NULL, 1, 1, 'admin', '2022-12-06 16:30:12', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1606645562573361153', '1606645341269299201', '总裁/总经理/CEO', '1', NULL, 1, 1, 'admin', '2022-12-24 21:38:47', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1606645619930468354', '1606645341269299201', '副总裁/副总经理/VP', '2', NULL, 2, 1, 'admin', '2022-12-24 21:39:00', 'admin', '2022-12-24 21:40:00');
INSERT INTO `sys_dict_item` VALUES ('1606645660241924097', '1606645341269299201', '总监/主管/经理', '3', NULL, 3, 1, 'admin', '2022-12-24 21:39:10', 'admin', '2022-12-24 21:39:41');
INSERT INTO `sys_dict_item` VALUES ('1606645696715591682', '1606645341269299201', '员工/专员/执行', '4', NULL, 4, 1, 'admin', '2022-12-24 21:39:19', 'admin', '2022-12-24 21:39:37');
INSERT INTO `sys_dict_item` VALUES ('1606645744023146497', '1606645341269299201', '其他', '5', NULL, 5, 1, 'admin', '2022-12-24 21:39:30', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1606647668965412866', '1606646440684457986', '总经办', '1', NULL, 1, 1, 'admin', '2022-12-24 21:47:09', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1606647703098658817', '1606646440684457986', '技术/IT/研发', '2', NULL, 2, 1, 'admin', '2022-12-24 21:47:17', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1606647737919770625', '1606646440684457986', '产品/设计', '3', NULL, 3, 1, 'admin', '2022-12-24 21:47:25', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1606647789614567425', '1606646440684457986', '销售/市场/运营', '4', '', 4, 1, 'admin', '2022-12-24 21:47:38', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1606647827921145857', '1606646440684457986', '人事/财务/行政', '5', NULL, 5, 1, 'admin', '2022-12-24 21:47:47', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1606647860955484162', '1606646440684457986', '资源/仓储/采购', '6', NULL, 6, 1, 'admin', '2022-12-24 21:47:55', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1606647915473047553', '1606646440684457986', '其他', '7', NULL, 7, 1, 'admin', '2022-12-24 21:48:08', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1ce390c52453891f93514c1bd2795d44', 'ad7c65ba97c20a6805d5dcdf13cdaf36', '000', '00', NULL, 1, 1, 'admin', '2019-03-22 16:34:34', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1db531bcff19649fa82a644c8a939dc4', '4c03fca6bf1f0299c381213961566349', '组合布局', 'combination', '', 4, 1, 'admin', '2019-05-11 16:07:08', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('222705e11ef0264d4214affff1fb4ff9', '4f69be5f507accea8d5df5f11346181a', '文本', '1', '', 1, 1, 'admin', '2023-02-28 10:50:36', 'admin', '2022-07-04 16:29:21');
INSERT INTO `sys_dict_item` VALUES ('23a5bb76004ed0e39414e928c4cde155', '4e4602b3e3686f0911384e188dc7efb4', '不等于', '!=', '不等于', 3, 1, 'admin', '2019-04-01 16:46:15', 'admin', '2019-04-01 17:48:40');
INSERT INTO `sys_dict_item` VALUES ('25847e9cb661a7c711f9998452dc09e6', '4e4602b3e3686f0911384e188dc7efb4', '小于等于', '<=', '小于等于', 6, 1, 'admin', '2019-04-01 16:44:34', 'admin', '2019-04-01 17:49:10');
INSERT INTO `sys_dict_item` VALUES ('2d51376643f220afdeb6d216a8ac2c01', '68168534ff5065a152bfab275c2136f8', '有效', '1', '有效', 2, 1, 'admin', '2019-04-26 19:22:01', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('308c8aadf0c37ecdde188b97ca9833f5', '8dfe32e2d29ea9430a988b3b558bf233', '已发布', '1', '已发布', 2, 1, 'admin', '2019-04-16 17:41:24', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('333e6b2196e01ef9a5f76d74e86a6e33', '8dfe32e2d29ea9430a988b3b558bf233', '未发布', '0', '未发布', 1, 1, 'admin', '2019-04-16 17:41:12', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('337ea1e401bda7233f6258c284ce4f50', 'bd1b8bc28e65d6feefefb6f3c79f42fd', 'JSON', 'json', NULL, 1, 1, 'admin', '2019-04-12 17:26:33', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('33bc9d9f753cf7dc40e70461e50fdc54', 'a9d9942bd0eccb6e89de92d130ec4c4a', '发送失败', '2', NULL, 3, 1, 'admin', '2019-04-12 18:20:02', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('3fbc03d6c994ae06d083751248037c0e', '78bda155fe380b1b3f175f1e88c284c6', '已完成', '3', '已完成', 3, 1, 'admin', '2019-05-09 16:33:25', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('41d7aaa40c9b61756ffb1f28da5ead8e', '0b5d19e1fce4b2e6647e6b4a17760c14', '通知公告', '1', NULL, 1, 1, 'admin', '2019-04-22 18:01:57', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('41fa1e9571505d643aea87aeb83d4d76', '4e4602b3e3686f0911384e188dc7efb4', '等于', '=', '等于', 4, 1, 'admin', '2019-04-01 16:45:24', 'admin', '2019-04-01 17:49:00');
INSERT INTO `sys_dict_item` VALUES ('43d2295b8610adce9510ff196a49c6e9', '845da5006c97754728bf48b6a10f79cc', '正常', '1', NULL, NULL, 1, 'admin', '2019-03-18 21:45:51', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('4f05fb5376f4c61502c5105f52e4dd2b', '83bfb33147013cc81640d5fd9eda030c', '操作日志', '2', NULL, NULL, 1, 'admin', '2019-03-18 23:22:49', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('50223341bfb5ba30bf6319789d8d17fe', 'd6e1152968b02d69ff358c75b48a6ee1', '业务办理', 'business', NULL, 3, 1, 'admin', '2023-04-22 19:28:05', 'admin', '2019-03-22 23:24:39');
INSERT INTO `sys_dict_item` VALUES ('51222413e5906cdaf160bb5c86fb827c', 'a7adbcd86c37f7dbc9b66945c82ef9e6', '是', '1', '', 1, 1, 'admin', '2019-05-22 19:29:45', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('538fca35afe004972c5f3947c039e766', '2e02df51611a4b9632828ab7e5338f00', '显示', '1', '显示', 1, 1, 'admin', '2025-03-26 18:27:13', 'admin', '2019-04-26 18:39:07');
INSERT INTO `sys_dict_item` VALUES ('5584c21993bde231bbde2b966f2633ac', '4e4602b3e3686f0911384e188dc7efb4', '自定义SQL表达式', 'USE_SQL_RULES', '自定义SQL表达式', 9, 1, 'admin', '2019-04-01 10:45:24', 'admin', '2019-04-01 17:49:27');
INSERT INTO `sys_dict_item` VALUES ('58b73b344305c99b9d8db0fc056bbc0a', '72cce0989df68887546746d8f09811aa', '主表', '2', NULL, 2, 1, 'admin', '2019-03-27 10:13:36', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('5b65a88f076b32e8e69d19bbaadb52d5', '2f0320997ade5dd147c90130f7218c3e', '全体用户', 'ALL', NULL, NULL, 1, 'admin', '2020-10-17 21:22:43', 'admin', '2019-03-28 22:17:09');
INSERT INTO `sys_dict_item` VALUES ('5d833f69296f691843ccdd0c91212b6b', '880a895c98afeca9d9ac39f29e67c13e', '修改', '3', '', 3, 1, 'admin', '2019-07-22 10:55:07', 'admin', '2019-07-22 10:55:41');
INSERT INTO `sys_dict_item` VALUES ('5d84a8634c8fdfe96275385075b105c9', '3d9a351be3436fbefb1307d4cfb49bf2', '女', '2', NULL, 2, 1, NULL, '2019-01-04 14:56:56', NULL, '2019-01-04 17:38:12');
INSERT INTO `sys_dict_item` VALUES ('66c952ae2c3701a993e7db58f3baf55e', '4e4602b3e3686f0911384e188dc7efb4', '大于', '>', '大于', 1, 1, 'admin', '2019-04-01 10:45:46', 'admin', '2019-04-01 17:48:29');
INSERT INTO `sys_dict_item` VALUES ('6937c5dde8f92e9a00d4e2ded9198694', 'ad7c65ba97c20a6805d5dcdf13cdaf36', 'easyui', '3', NULL, 1, 1, 'admin', '2019-03-22 16:32:15', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('69cacf64e244100289ddd4aa9fa3b915', 'a9d9942bd0eccb6e89de92d130ec4c4a', '未发送', '0', NULL, 1, 1, 'admin', '2019-04-12 18:19:23', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('6a7a9e1403a7943aba69e54ebeff9762', '4f69be5f507accea8d5df5f11346181a', '富文本', '2', '', 2, 1, 'admin', '2031-02-28 10:50:44', 'admin', '2022-07-04 16:29:30');
INSERT INTO `sys_dict_item` VALUES ('6c682d78ddf1715baf79a1d52d2aa8c2', '72cce0989df68887546746d8f09811aa', '单表', '1', NULL, 1, 1, 'admin', '2019-03-27 10:13:29', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('6d404fd2d82311fbc87722cd302a28bc', '4e4602b3e3686f0911384e188dc7efb4', '模糊', 'LIKE', '模糊', 7, 1, 'admin', '2019-04-01 16:46:02', 'admin', '2019-04-01 17:49:20');
INSERT INTO `sys_dict_item` VALUES ('6d4e26e78e1a09699182e08516c49fc4', '4d7fec1a7799a436d26d02325eff295e', '高', 'H', '高', 1, 1, 'admin', '2019-04-16 17:04:24', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('700e9f030654f3f90e9ba76ab0713551', '6b78e3f59faec1a4750acff08030a79b', '333', '333', NULL, NULL, 1, 'admin', '2019-02-21 19:59:47', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('7050c1522702bac3be40e3b7d2e1dfd8', 'c5a14c75172783d72cbee6ee7f5df5d1', '柱状图', 'bar', NULL, 1, 1, 'admin', '2019-04-12 17:05:17', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('71b924faa93805c5c1579f12e001c809', 'd6e1152968b02d69ff358c75b48a6ee1', 'OA办公', 'oa', NULL, 2, 1, 'admin', '2021-03-22 19:27:17', 'admin', '2019-03-22 23:24:36');
INSERT INTO `sys_dict_item` VALUES ('75b260d7db45a39fc7f21badeabdb0ed', 'c36169beb12de8a71c8683ee7c28a503', '不启用', '0', NULL, NULL, 1, 'admin', '2019-03-18 23:29:41', 'admin', '2019-03-18 23:29:54');
INSERT INTO `sys_dict_item` VALUES ('7688469db4a3eba61e6e35578dc7c2e5', 'c36169beb12de8a71c8683ee7c28a503', '启用', '1', NULL, NULL, 1, 'admin', '2019-03-18 23:29:28', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('78ea6cadac457967a4b1c4eb7aaa418c', 'fc6cd58fde2e8481db10d3a1e68ce70c', '正常', '1', NULL, NULL, 1, 'admin', '2019-03-18 23:30:28', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('7ccf7b80c70ee002eceb3116854b75cb', 'ac2f7c0c5c5775fcea7e2387bcb22f01', '按钮权限', '2', NULL, NULL, 1, 'admin', '2019-03-18 23:25:40', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('81fb2bb0e838dc68b43f96cc309f8257', 'fc6cd58fde2e8481db10d3a1e68ce70c', '冻结', '2', NULL, NULL, 1, 'admin', '2019-03-18 23:30:37', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('83250269359855501ec4e9c0b7e21596', '4274efc2292239b6f000b153f50823ff', '可见/可访问(授权后可见/可访问)', '1', '', 1, 1, 'admin', '2019-05-10 17:54:51', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('84778d7e928bc843ad4756db1322301f', '4e4602b3e3686f0911384e188dc7efb4', '大于等于', '>=', '大于等于', 5, 1, 'admin', '2019-04-01 10:46:02', 'admin', '2019-04-01 17:49:05');
INSERT INTO `sys_dict_item` VALUES ('848d4da35ebd93782029c57b103e5b36', 'c5a14c75172783d72cbee6ee7f5df5d1', '饼图', 'pie', NULL, 3, 1, 'admin', '2019-04-12 17:05:49', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('84dfc178dd61b95a72900fcdd624c471', '78bda155fe380b1b3f175f1e88c284c6', '处理中', '2', '处理中', 2, 1, 'admin', '2019-05-09 16:33:01', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('86f19c7e0a73a0bae451021ac05b99dd', 'ac2f7c0c5c5775fcea7e2387bcb22f01', '子菜单', '1', NULL, NULL, 1, 'admin', '2019-03-18 23:25:27', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('8c618902365ca681ebbbe1e28f11a548', '4c753b5293304e7a445fd2741b46529d', '启用', '1', '', 0, 1, 'admin', '2020-07-18 23:19:27', 'admin', '2019-05-17 14:51:18');
INSERT INTO `sys_dict_item` VALUES ('8cdf08045056671efd10677b8456c999', '4274efc2292239b6f000b153f50823ff', '可编辑(未授权时禁用)', '2', '', 2, 1, 'admin', '2019-05-10 17:55:38', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('8ff48e657a7c5090d4f2a59b37d1b878', '4d7fec1a7799a436d26d02325eff295e', '中', 'M', '中', 2, 1, 'admin', '2019-04-16 17:04:40', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('948923658baa330319e59b2213cda97c', '880a895c98afeca9d9ac39f29e67c13e', '添加', '2', '', 2, 1, 'admin', '2019-07-22 10:54:59', 'admin', '2019-07-22 10:55:36');
INSERT INTO `sys_dict_item` VALUES ('9a96c4a4e4c5c9b4e4d0cbf6eb3243cc', '4c753b5293304e7a445fd2741b46529d', '不启用', '0', NULL, 1, 1, 'admin', '2019-03-18 23:19:53', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('a1e7d1ca507cff4a480c8caba7c1339e', '880a895c98afeca9d9ac39f29e67c13e', '导出', '6', '', 6, 1, 'admin', '2019-07-22 12:06:50', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('a2be752dd4ec980afaec1efd1fb589af', '8dfe32e2d29ea9430a988b3b558bf233', '已撤销', '2', '已撤销', 3, 1, 'admin', '2019-04-16 17:41:39', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('aa0d8a8042a18715a17f0a888d360aa4', 'ac2f7c0c5c5775fcea7e2387bcb22f01', '一级菜单', '0', NULL, NULL, 1, 'admin', '2019-03-18 23:24:52', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('adcf2a1fe93bb99a84833043f475fe0b', '4e4602b3e3686f0911384e188dc7efb4', '包含', 'IN', '包含', 8, 1, 'admin', '2019-04-01 16:45:47', 'admin', '2019-04-01 17:49:24');
INSERT INTO `sys_dict_item` VALUES ('b029a41a851465332ee4ee69dcf0a4c2', '0b5d19e1fce4b2e6647e6b4a17760c14', '系统消息', '2', NULL, 1, 1, 'admin', '2019-02-22 18:02:08', 'admin', '2019-04-22 18:02:13');
INSERT INTO `sys_dict_item` VALUES ('b2a8b4bb2c8e66c2c4b1bb086337f393', '3486f32803bb953e7155dab3513dc68b', '正常', '0', NULL, NULL, 1, 'admin', '2022-10-18 21:46:48', 'admin', '2019-03-28 22:22:20');
INSERT INTO `sys_dict_item` VALUES ('b57f98b88363188daf38d42f25991956', '6b78e3f59faec1a4750acff08030a79b', '22', '222', NULL, NULL, 0, 'admin', '2019-02-21 19:59:43', 'admin', '2019-03-11 21:23:27');
INSERT INTO `sys_dict_item` VALUES ('b5f3bd5f66bb9a83fecd89228c0d93d1', '68168534ff5065a152bfab275c2136f8', '无效', '0', '无效', 1, 1, 'admin', '2019-04-26 19:21:49', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('b9fbe2a3602d4a27b45c100ac5328484', '78bda155fe380b1b3f175f1e88c284c6', '待提交', '1', '待提交', 1, 1, 'admin', '2019-05-09 16:32:35', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('ba27737829c6e0e582e334832703d75e', '236e8a4baff0db8c62c00dd95632834f', '同步', '1', '同步', 1, 1, 'admin', '2019-05-15 15:28:15', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('bcec04526b04307e24a005d6dcd27fd6', '880a895c98afeca9d9ac39f29e67c13e', '导入', '5', '', 5, 1, 'admin', '2019-07-22 12:06:41', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('c53da022b9912e0aed691bbec3c78473', '880a895c98afeca9d9ac39f29e67c13e', '查询', '1', '', 1, 1, 'admin', '2019-07-22 10:54:51', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('c5700a71ad08994d18ad1dacc37a71a9', 'a7adbcd86c37f7dbc9b66945c82ef9e6', '否', '0', '', 1, 1, 'admin', '2019-05-22 19:29:55', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('cbfcc5b88fc3a90975df23ffc8cbe29c', 'c5a14c75172783d72cbee6ee7f5df5d1', '曲线图', 'line', NULL, 2, 1, 'admin', '2019-05-12 17:05:30', 'admin', '2019-04-12 17:06:06');
INSERT INTO `sys_dict_item` VALUES ('d217592908ea3e00ff986ce97f24fb98', 'c5a14c75172783d72cbee6ee7f5df5d1', '数据列表', 'table', NULL, 4, 1, 'admin', '2019-04-12 17:05:56', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('df168368dcef46cade2aadd80100d8aa', '3d9a351be3436fbefb1307d4cfb49bf2', '男', '1', NULL, 1, 1, NULL, '2027-08-04 14:56:49', 'admin', '2019-03-23 22:44:44');
INSERT INTO `sys_dict_item` VALUES ('e6329e3a66a003819e2eb830b0ca2ea0', '4e4602b3e3686f0911384e188dc7efb4', '小于', '<', '小于', 2, 1, 'admin', '2019-04-01 16:44:15', 'admin', '2019-04-01 17:48:34');
INSERT INTO `sys_dict_item` VALUES ('e94eb7af89f1dbfa0d823580a7a6e66a', '236e8a4baff0db8c62c00dd95632834f', '不同步', '0', '不同步', 2, 1, 'admin', '2019-05-15 15:28:28', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('f0162f4cc572c9273f3e26b2b4d8c082', 'ad7c65ba97c20a6805d5dcdf13cdaf36', 'booostrap', '1', NULL, 1, 1, 'admin', '2021-08-22 16:32:04', 'admin', '2019-03-22 16:33:57');
INSERT INTO `sys_dict_item` VALUES ('f16c5706f3ae05c57a53850c64ce7c45', 'a9d9942bd0eccb6e89de92d130ec4c4a', '发送成功', '1', NULL, 2, 1, 'admin', '2019-04-12 18:19:43', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('f2a7920421f3335afdf6ad2b342f6b5d', '845da5006c97754728bf48b6a10f79cc', '冻结', '2', NULL, NULL, 1, 'admin', '2019-03-18 21:46:02', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('f37f90c496ec9841c4c326b065e00bb2', '83bfb33147013cc81640d5fd9eda030c', '登录日志', '1', NULL, NULL, 1, 'admin', '2019-03-18 23:22:37', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('f753aff60ff3931c0ecb4812d8b5e643', '4c03fca6bf1f0299c381213961566349', '双排布局', 'double', NULL, 3, 1, 'admin', '2019-04-12 17:43:51', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('f80a8f6838215753b05e1a5ba3346d22', '880a895c98afeca9d9ac39f29e67c13e', '删除', '4', '', 4, 1, 'admin', '2019-07-22 10:55:14', 'admin', '2019-07-22 10:55:30');
INSERT INTO `sys_dict_item` VALUES ('fcec03570f68a175e1964808dc3f1c91', '4c03fca6bf1f0299c381213961566349', 'Tab风格', 'tab', NULL, 1, 1, 'admin', '2019-04-12 17:43:31', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('fe50b23ae5e68434def76f67cef35d2d', '78bda155fe380b1b3f175f1e88c284c6', '已作废', '4', '已作废', 4, 1, 'admin', '2021-09-09 16:33:43', 'admin', '2019-05-09 16:34:40');

-- ----------------------------
-- Table structure for sys_files
-- ----------------------------
DROP TABLE IF EXISTS `sys_files`;
CREATE TABLE `sys_files`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键id',
  `file_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件名称',
  `url` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件地址',
  `file_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文档类型（folder:文件夹 excel:excel doc:word ppt:ppt image:图片  archive:其他文档 video:视频 pdf:pdf）',
  `store_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件上传类型(temp/本地上传(临时文件) manage/知识库)',
  `parent_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父级id',
  `tenant_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '租户id',
  `file_size` double(13, 2) NULL DEFAULT NULL COMMENT '文件大小（kb）',
  `iz_folder` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否文件夹(1：是  0：否)',
  `iz_root_folder` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否为1级文件夹，允许为空 (1：是 )',
  `iz_star` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否标星(1：是  0：否)',
  `down_count` int(11) NULL DEFAULT NULL COMMENT '下载次数',
  `read_count` int(11) NULL DEFAULT NULL COMMENT '阅读次数',
  `share_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分享链接',
  `share_perms` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分享权限(1.关闭分享 2.允许所有联系人查看 3.允许任何人查看)',
  `enable_down` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否允许下载(1：是  0：否)',
  `enable_updat` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否允许修改(1：是  0：否)',
  `del_flag` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '删除状态(0-正常,1-删除至回收站)',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人登录名称',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建日期',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人登录名称',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_tenant_id`(`tenant_id`) USING BTREE,
  INDEX `index_del_flag`(`del_flag`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '知识库-文档管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_files
-- ----------------------------
INSERT INTO `sys_files` VALUES ('1580814573568143361', '11.jpg', 'comment/11_1665730539114.jpg', 'image', 'temp', NULL, NULL, 10956.00, '0', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, '0', 'admin', '2022-10-14 14:55:39', NULL, NULL);
INSERT INTO `sys_files` VALUES ('1584493984691740674', 'jeecg-boot漏洞.pdf', 'comment/jeecg-boot漏洞_1666607779077.pdf', 'pdf', 'temp', NULL, NULL, 842789.00, '0', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, '0', 'admin', '2022-10-24 18:36:19', NULL, NULL);

-- ----------------------------
-- Table structure for sys_fill_rule
-- ----------------------------
DROP TABLE IF EXISTS `sys_fill_rule`;
CREATE TABLE `sys_fill_rule`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键ID',
  `rule_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规则名称',
  `rule_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规则Code',
  `rule_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规则实现类',
  `rule_params` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规则参数',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_sfr_rule_code`(`rule_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_fill_rule
-- ----------------------------
INSERT INTO `sys_fill_rule` VALUES ('1202551334738382850', '机构编码生成', 'org_num_role', 'org.jeecg.modules.system.rule.OrgCodeRule', '{\"parentId\":\"c6d7cb4deeac411cb3384b1b31278596\"}', 'admin', '2019-12-09 10:37:06', 'admin', '2019-12-05 19:32:35');
INSERT INTO `sys_fill_rule` VALUES ('1202787623203065858', '分类字典编码生成', 'category_code_rule', 'org.jeecg.modules.system.rule.CategoryCodeRule', '{\"pid\":\"\"}', 'admin', '2022-10-13 16:47:52', 'admin', '2019-12-06 11:11:31');
INSERT INTO `sys_fill_rule` VALUES ('1260134137920090113', '订单流水号', 'shop_order_num', 'org.jeecg.modules.online.cgform.rule.OrderNumberRule', '{}', 'admin', '2020-12-07 18:29:50', 'admin', '2020-05-12 17:06:05');

-- ----------------------------
-- Table structure for sys_form_file
-- ----------------------------
DROP TABLE IF EXISTS `sys_form_file`;
CREATE TABLE `sys_form_file`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `table_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表名',
  `table_data_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据id',
  `file_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联文件id',
  `file_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件类型(text:文本, excel:excel doc:word ppt:ppt image:图片  archive:其他文档 video:视频 pdf:pdf）)',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人登录名称',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建日期',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_table_form`(`table_name`, `table_data_id`) USING BTREE,
  INDEX `index_file_id`(`file_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_form_file
-- ----------------------------
INSERT INTO `sys_form_file` VALUES ('1580814573635252225', 'sys_comment', '1580814573433925634', '1580814573568143361', 'image', 'admin', '2022-10-14 14:55:39');
INSERT INTO `sys_form_file` VALUES ('1584493984716906497', 'sys_comment', '1584493984364584961', '1584493984691740674', 'pdf', 'admin', '2022-10-24 18:36:19');

-- ----------------------------
-- Table structure for sys_gateway_route
-- ----------------------------
DROP TABLE IF EXISTS `sys_gateway_route`;
CREATE TABLE `sys_gateway_route`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `router_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路由ID',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务名',
  `uri` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务地址',
  `predicates` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '断言',
  `filters` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '过滤器',
  `retryable` int(3) NULL DEFAULT NULL COMMENT '是否重试:0-否 1-是',
  `strip_prefix` int(3) NULL DEFAULT NULL COMMENT '是否忽略前缀0-否 1-是',
  `persistable` int(3) NULL DEFAULT NULL COMMENT '是否为保留数据:0-否 1-是',
  `show_api` int(3) NULL DEFAULT NULL COMMENT '是否在接口文档中展示:0-否 1-是',
  `status` int(3) NULL DEFAULT NULL COMMENT '状态:0-无效 1-有效',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建日期',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新日期',
  `sys_org_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属部门',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_gateway_route
-- ----------------------------

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `log_type` int(3) NULL DEFAULT NULL COMMENT '日志类型（1登录日志，2操作日志, 3.租户操作日志）',
  `log_content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志内容',
  `operate_type` int(2) NULL DEFAULT NULL COMMENT '操作类型',
  `userid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作用户账号',
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作用户名称',
  `ip` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IP',
  `method` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求java方法',
  `request_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求路径',
  `request_param` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '请求参数',
  `request_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求类型',
  `cost_time` bigint(20) NULL DEFAULT NULL COMMENT '耗时',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `tenant_id` int(10) NULL DEFAULT NULL COMMENT '租户ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sl_userid`(`userid`) USING BTREE,
  INDEX `idx_sl_log_type`(`log_type`) USING BTREE,
  INDEX `idx_sl_operate_type`(`operate_type`) USING BTREE,
  INDEX `idx_sl_create_time`(`create_time`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('1632743293639704578', 1, '用户名: admin,登录成功！', NULL, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-06 22:01:51', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键id',
  `parent_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单标题',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路径',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件',
  `is_route` tinyint(1) NULL DEFAULT 1 COMMENT '是否路由菜单: 0:不是  1:是（默认值1）',
  `component_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件名字',
  `redirect` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '一级菜单跳转地址',
  `menu_type` int(11) NULL DEFAULT NULL COMMENT '菜单类型(0:一级菜单; 1:子菜单:2:按钮权限)',
  `perms` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单权限编码',
  `perms_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '权限策略1显示2禁用',
  `sort_no` double(8, 2) NULL DEFAULT NULL COMMENT '菜单排序',
  `always_show` tinyint(1) NULL DEFAULT NULL COMMENT '聚合子路由: 1是0否',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `is_leaf` tinyint(1) NULL DEFAULT NULL COMMENT '是否叶子节点:    1是0否',
  `keep_alive` tinyint(1) NULL DEFAULT NULL COMMENT '是否缓存该页面:    1:是   0:不是',
  `hidden` int(2) NULL DEFAULT 0 COMMENT '是否隐藏路由: 0否,1是',
  `hide_tab` int(2) NULL DEFAULT NULL COMMENT '是否隐藏tab: 0否,1是',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` int(11) NULL DEFAULT 0 COMMENT '删除状态 0正常 1已删除',
  `rule_flag` int(3) NULL DEFAULT 0 COMMENT '是否添加数据权限1是0否',
  `status` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '按钮权限状态(0无效1有效)',
  `internal_or_external` tinyint(1) NULL DEFAULT NULL COMMENT '外链菜单打开方式 0/内部打开 1/外部打开',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_menu_type`(`menu_type`) USING BTREE,
  INDEX `index_menu_hidden`(`hidden`) USING BTREE,
  INDEX `index_menu_status`(`status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO sys_permission (id,parent_id,name,url,component,is_route,component_name,redirect,menu_type,perms,perms_type,sort_no,always_show,icon,is_leaf,keep_alive,hidden,hide_tab,description,create_by,create_time,update_by,update_time,del_flag,rule_flag,status,internal_or_external) VALUES
	 ('1170592628746878978','d7d6e2e4e2934f2c9385a623fd98c6f3','菜单管理','/system/menu','system/menu/index',1,NULL,NULL,1,NULL,'1',3.0,0,'ant-design:menu-fold-outlined',0,0,0,0,NULL,'admin','2019-09-08 15:00:05','admin','2022-11-10 16:42:38',0,0,'1',0),
	 ('119213522910765570','1633804334561746946','租户用户','/system/user/tenantUserList','system/user/TenantUserList',1,NULL,NULL,1,NULL,NULL,3.2,0,'ant-design:user',1,0,0,0,NULL,NULL,'2018-12-25 20:34:38','admin','2023-03-09 20:18:16',0,0,NULL,0),
	 ('1211885237487923202','1207203817658105858','btn:add','','',1,NULL,NULL,2,'btn:add','1',1.0,0,NULL,1,0,0,NULL,NULL,'admin','2019-12-31 13:42:11','admin','2020-01-07 20:07:53',0,0,'1',0),
	 ('1214376304951664642','3f915b2769fc80648e92d04e84ca059d','用户编辑','','',0,NULL,NULL,2,'system:user:edit','1',1.0,0,NULL,1,0,0,0,NULL,'admin','2020-01-07 10:40:47','admin','2022-11-17 16:24:33',0,0,'1',0),
	 ('1214462306546319362','3f915b2769fc80648e92d04e84ca059d','新增用户','','',0,NULL,NULL,2,'system:user:add','1',1.0,0,NULL,1,0,0,0,NULL,'admin','2020-01-07 16:22:32','admin','2022-11-17 16:24:47',0,0,'1',0),
	 ('1280350452934307841','d7d6e2e4e2934f2c9385a623fd98c6f3','租户管理','/system/tenant','system/tenant/index',1,NULL,NULL,1,NULL,'1',3.1,0,'ant-design:appstore-twotone',0,0,0,0,NULL,'admin','2020-07-07 11:58:30','admin','2023-03-04 15:03:01',0,0,'1',0),
	 ('1438108176273760258','','驾驶舱','/dashboard','layouts/default/index',1,NULL,'/dashboard/analysis',0,NULL,'1',1.0,0,'ion:grid-outline',0,0,0,0,NULL,'admin','2021-09-15 19:51:23','admin','2023-04-16 12:02:18',0,1,'1',0),
	 ('1438108176814825473','1438108176273760258','工作台','/dashboard/workbench','dashboard/workbench/index',1,NULL,NULL,1,NULL,'1',1.0,0,'ant-design:appstore-twotone',1,0,0,NULL,NULL,'admin','2021-09-15 19:51:23','admin','2021-09-17 15:42:42',0,0,'1',0),
	 ('1438469604861403137','d7d6e2e4e2934f2c9385a623fd98c6f3','职务管理','/system/position','system/position/index',1,NULL,NULL,1,NULL,'0',5.0,0,'ant-design:database-filled',1,0,0,NULL,NULL,'admin','2021-09-16 19:47:33','admin','2021-09-17 15:58:22',0,0,NULL,0),
	 ('1438782530717495298','d7d6e2e4e2934f2c9385a623fd98c6f3','分类字典','/system/category','system/category/index',1,NULL,NULL,1,NULL,'0',9.0,0,'ant-design:group-outlined',1,0,0,NULL,NULL,'admin','2021-09-17 16:31:01',NULL,NULL,0,0,NULL,0);
INSERT INTO sys_permission (id,parent_id,name,url,component,is_route,component_name,redirect,menu_type,perms,perms_type,sort_no,always_show,icon,is_leaf,keep_alive,hidden,hide_tab,description,create_by,create_time,update_by,update_time,del_flag,rule_flag,status,internal_or_external) VALUES
	 ('1438782641187074050','d7d6e2e4e2934f2c9385a623fd98c6f3','数据字典','/system/dict','system/dict/index',1,NULL,NULL,1,NULL,'0',4.0,0,'ant-design:hdd-twotone',0,0,0,0,NULL,'admin','2021-09-17 16:31:27','admin','2023-03-04 15:01:55',0,0,NULL,0),
	 ('1438782851980210178','d7d6e2e4e2934f2c9385a623fd98c6f3','通知公告','/system/notice','system/notice/index',1,NULL,NULL,1,NULL,'0',8.0,0,'ant-design:bell-outlined',1,0,0,NULL,NULL,'admin','2021-09-17 16:32:17','admin','2021-09-17 16:36:15',0,0,NULL,0),
	 ('1439398677984878593','','系统监控','/monitor','layouts/RouteView',1,NULL,NULL,0,NULL,'0',5.0,0,'ant-design:video-camera-filled',0,0,0,0,NULL,'admin','2021-09-19 09:19:22','admin','2022-10-14 16:21:08',0,0,NULL,0),
	 ('1439399179791409153','1439398677984878593','网关路由','/monitor/route','monitor/route/index',1,NULL,NULL,1,NULL,'0',1.0,0,'ant-design:branches-outlined',0,0,0,0,NULL,'admin','2021-09-19 09:21:21','admin','2021-09-19 09:26:42',0,0,NULL,0),
	 ('1439488251473993730','1439398677984878593','定时任务','/monitor/quartz','monitor/quartz/index',1,NULL,NULL,1,NULL,'0',1.0,0,'ant-design:history-outlined',0,0,0,0,NULL,'admin','2021-09-19 15:15:18',NULL,NULL,0,0,NULL,0),
	 ('1439511654494937090','1439398677984878593','数据源管理','/monitor/datasource','monitor/datasource/index',1,NULL,NULL,1,NULL,'0',3.0,0,'ant-design:hdd-filled',0,0,0,0,NULL,'admin','2021-09-19 16:48:17',NULL,NULL,0,0,NULL,0),
	 ('1439531077792473089','1439398677984878593','数据日志','/monitor/datalog','monitor/datalog/index',1,NULL,NULL,1,NULL,'0',4.0,0,'ant-design:funnel-plot-twotone',1,0,0,0,NULL,'admin','2021-09-19 18:05:28',NULL,NULL,0,0,NULL,0),
	 ('1439533711676973057','1439398677984878593','日志管理','/monitor/log','monitor/log/index',1,NULL,NULL,1,NULL,'0',5.0,0,'ant-design:interaction-outlined',1,0,0,0,NULL,'admin','2021-09-19 18:15:56','admin','2021-09-19 18:16:56',0,0,NULL,0),
	 ('1439784356766064642','1439398677984878593','SQL监控','/monitor/druid','{{ window._CONFIG[''domianURL''] }}/druid',1,NULL,NULL,1,NULL,'0',8.0,0,'ant-design:rocket-filled',1,0,0,0,NULL,'admin','2021-09-20 10:51:55','admin','2021-11-15 18:21:20',0,0,NULL,0),
	 ('1439797053314342913','1439398677984878593','性能监控','/monitor/server','monitor/server/index',1,NULL,NULL,1,NULL,'0',9.0,0,'ant-design:thunderbolt-filled',1,0,0,0,NULL,'admin','2021-09-20 11:42:22','admin','2021-09-20 14:13:14',0,0,NULL,0);
INSERT INTO sys_permission (id,parent_id,name,url,component,is_route,component_name,redirect,menu_type,perms,perms_type,sort_no,always_show,icon,is_leaf,keep_alive,hidden,hide_tab,description,create_by,create_time,update_by,update_time,del_flag,rule_flag,status,internal_or_external) VALUES
	 ('1439839507094740994','1439398677984878593','Redis监控','/monitor/redis','monitor/redis/index',1,NULL,NULL,1,NULL,'0',10.0,0,'ant-design:trademark-outlined',1,0,0,0,NULL,'admin','2021-09-20 14:31:04',NULL,NULL,0,0,NULL,0),
	 ('1439842640030113793','1439398677984878593','请求追踪','/monitor/trace','monitor/trace/index',1,NULL,NULL,1,NULL,'0',11.0,0,'ant-design:ie-circle-filled',1,0,0,0,NULL,'admin','2021-09-20 14:43:31',NULL,NULL,0,0,NULL,0),
	 ('1452508868884353026','1455100420297859074','报表设计器','/jmreport','{{ window._CONFIG[''domianURL''] }}/jmreport/list?token=${token}',1,NULL,NULL,1,NULL,'0',3.0,0,'',1,0,0,0,NULL,'admin','2021-10-25 13:34:35','admin','2022-10-14 16:22:56',0,0,'1',1),
	 ('1455100420297859074','','低代码开发','/online','layouts/default/index',1,NULL,'/online/cgform',0,NULL,'0',2.0,0,'ant-design:cloud-outlined',0,0,0,0,NULL,'admin','2021-11-01 17:12:29','admin','2022-10-26 14:06:06',0,0,NULL,0),
	 ('1455101470794850305','1455100420297859074','Online表单开发','/online/cgform','super/online/cgform/index',1,NULL,NULL,1,NULL,'0',1.0,0,NULL,1,0,0,0,NULL,'admin','2021-11-01 17:16:40','admin','2022-04-04 18:36:25',0,0,NULL,0),
	 ('1455735714507472898','d7d6e2e4e2934f2c9385a623fd98c6f3','通讯录','/address','system/address/index',1,NULL,NULL,1,NULL,'0',10.0,0,'ant-design:book-outlined',1,0,0,0,NULL,'admin','2021-11-03 11:16:55','admin','2021-11-04 19:40:19',0,0,NULL,0),
	 ('1457678003102879745','1455100420297859074','系统编码规则','/system/fillrule','system/fillRule/index',1,NULL,NULL,1,NULL,'0',9.0,0,NULL,1,0,0,0,NULL,'admin','2021-11-08 19:54:53','admin','2021-11-18 10:49:40',0,0,NULL,0),
	 ('1458353686530232321','1455100420297859074','系统校验规则','/system/checkrule','system/checkRule/index',1,NULL,NULL,1,NULL,'0',15.0,0,NULL,1,0,0,0,NULL,'admin','2021-11-10 16:39:48','admin','2021-11-18 10:49:48',0,0,NULL,0),
	 ('1460888189937176577','1455100420297859074','Online报表配置','/online/cgreport','super/online/cgreport/index',1,NULL,NULL,1,NULL,'0',2.0,0,NULL,1,0,0,0,NULL,'admin','2021-11-17 16:31:01','admin','2021-12-08 10:55:32',0,0,NULL,0),
	 ('1461270075543347202','1455100420297859074','Online表单视图','/online/copyform/:code','super/online/cgform/CgformCopyList',1,NULL,NULL,1,NULL,'0',99.0,0,NULL,1,0,1,0,NULL,'admin','2021-11-18 17:48:30',NULL,NULL,0,0,NULL,0);
INSERT INTO sys_permission (id,parent_id,name,url,component,is_route,component_name,redirect,menu_type,perms,perms_type,sort_no,always_show,icon,is_leaf,keep_alive,hidden,hide_tab,description,create_by,create_time,update_by,update_time,del_flag,rule_flag,status,internal_or_external) VALUES
	 ('1461291438825558017','1455100420297859074','AUTO在线报表','/online/cgreport/:id','super/online/cgreport/auto/OnlCgReportList',1,NULL,NULL,1,NULL,'0',2.0,0,NULL,1,0,1,0,NULL,'admin','2021-11-18 19:13:23','admin','2021-11-19 20:16:13',0,0,NULL,0),
	 ('1465686870713782273','1455100420297859074','AUTO在线表单','/online/cgformList/:id','super/online/cgform/auto/default/OnlineAutoList',1,NULL,NULL,1,NULL,'0',5.0,0,NULL,1,0,1,0,NULL,'admin','2021-11-30 22:19:16',NULL,NULL,0,0,NULL,0),
	 ('1509417558230999041','1455100420297859074','AUTO树表单列表','/online/cgformTreeList/:id','super/online/cgform/auto/tree/OnlineAutoTreeList',1,NULL,NULL,1,NULL,'0',5.0,0,NULL,1,0,1,0,NULL,'admin','2022-03-31 14:29:24',NULL,NULL,0,0,NULL,0),
	 ('1588513553652436993','3f915b2769fc80648e92d04e84ca059d','修改密码',NULL,NULL,0,NULL,NULL,2,'system:user:changepwd','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2022-11-04 20:48:39','admin','2022-11-04 20:49:06',0,0,'1',0),
	 ('1592112984361365505','1170592628746878978','添加菜单',NULL,NULL,0,NULL,NULL,2,'system:permission:add','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2022-11-14 19:11:30',NULL,NULL,0,0,'1',0),
	 ('1592113148350263298','190c2b43bec6a5f7a4194a85db67d96a','保存角色授权',NULL,NULL,0,NULL,NULL,2,'system:permission:saveRole','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2022-11-14 19:12:09',NULL,NULL,0,0,'1',0),
	 ('1592114574275211265','3f915b2769fc80648e92d04e84ca059d','删除用户',NULL,NULL,0,NULL,NULL,2,'system:user:delete','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2022-11-14 19:17:49',NULL,NULL,0,0,'1',0),
	 ('1592114652566089729','3f915b2769fc80648e92d04e84ca059d','批量删除用户',NULL,NULL,0,NULL,NULL,2,'system:user:deleteBatch','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2022-11-14 19:18:08',NULL,NULL,0,0,'1',0),
	 ('1592114721138765826','3f915b2769fc80648e92d04e84ca059d','冻结/解冻用户',NULL,NULL,0,NULL,NULL,2,'system:user:frozenBatch','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2022-11-14 19:18:24',NULL,NULL,0,0,'1',0),
	 ('1592114772665790465','3f915b2769fc80648e92d04e84ca059d','首页用户重置密码',NULL,NULL,0,NULL,NULL,2,'system:user:updatepwd','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2022-11-14 19:18:37',NULL,NULL,0,0,'1',0);
INSERT INTO sys_permission (id,parent_id,name,url,component,is_route,component_name,redirect,menu_type,perms,perms_type,sort_no,always_show,icon,is_leaf,keep_alive,hidden,hide_tab,description,create_by,create_time,update_by,update_time,del_flag,rule_flag,status,internal_or_external) VALUES
	 ('1592114823467200514','3f915b2769fc80648e92d04e84ca059d','给指定角色添加用户',NULL,NULL,0,NULL,NULL,2,'system:user:addUserRole','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2022-11-14 19:18:49',NULL,NULL,0,0,'1',0),
	 ('1592114893302362114','3f915b2769fc80648e92d04e84ca059d','删除指定角色的用户关系',NULL,NULL,0,NULL,NULL,2,'system:user:deleteRole','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2022-11-14 19:19:05',NULL,NULL,0,0,'1',0),
	 ('1592114955650691074','3f915b2769fc80648e92d04e84ca059d','批量删除指定角色的用户关系',NULL,NULL,0,NULL,NULL,2,'system:user:deleteRoleBatch','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2022-11-14 19:19:20',NULL,NULL,0,0,'1',0),
	 ('1592115070432014338','3f915b2769fc80648e92d04e84ca059d','给指定部门添加对应的用户',NULL,NULL,0,NULL,NULL,2,'system:user:editDepartWithUser','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2022-11-14 19:19:48',NULL,NULL,0,0,'1',0),
	 ('1592115115361398786','3f915b2769fc80648e92d04e84ca059d','删除指定机构的用户关系',NULL,NULL,0,NULL,NULL,2,'system:user:deleteUserInDepart','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2022-11-14 19:19:58',NULL,NULL,0,0,'1',0),
	 ('1592115162379546625','3f915b2769fc80648e92d04e84ca059d','批量删除指定机构的用户关系',NULL,NULL,0,NULL,NULL,2,'system:user:deleteUserInDepartBatch','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2022-11-14 19:20:09',NULL,NULL,0,0,'1',0),
	 ('1592115213910765570','3f915b2769fc80648e92d04e84ca059d','彻底删除用户',NULL,NULL,0,NULL,NULL,2,'system:user:deleteRecycleBin','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2022-11-14 19:20:22',NULL,NULL,0,0,'1',0),
	 ('1592115610431877122','1439511654494937090','多数据源分页列表',NULL,NULL,0,NULL,NULL,2,'system:datasource:list','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2022-11-14 19:21:56',NULL,NULL,0,0,'1',0),
	 ('1592115712466710529','45c966826eeff4c99b8f8ebfe74511fc','部门添加',NULL,NULL,0,NULL,NULL,2,'system:depart:add','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2022-11-14 19:22:21','admin','2022-11-14 19:30:49',0,0,'1',0),
	 ('1592115914493751297','1170592628746878978','编辑菜单权限数据',NULL,NULL,0,NULL,NULL,2,'system:permission:editRule','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2022-11-14 19:23:09','admin','2022-11-14 19:39:25',0,0,'1',0);
INSERT INTO sys_permission (id,parent_id,name,url,component,is_route,component_name,redirect,menu_type,perms,perms_type,sort_no,always_show,icon,is_leaf,keep_alive,hidden,hide_tab,description,create_by,create_time,update_by,update_time,del_flag,rule_flag,status,internal_or_external) VALUES
	 ('1592116663936184322','1170592628746878978','编辑菜单',NULL,NULL,0,NULL,NULL,2,'system:permission:edit','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2022-11-14 19:26:07',NULL,NULL,0,0,'1',0),
	 ('1592117222764277761','45c966826eeff4c99b8f8ebfe74511fc','部门编辑',NULL,NULL,0,NULL,NULL,2,'system:depart:edit','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2022-11-14 19:28:21','admin','2022-11-14 19:30:55',0,0,'1',0),
	 ('1592117276539449345','45c966826eeff4c99b8f8ebfe74511fc','部门删除',NULL,NULL,0,NULL,NULL,2,'system:depart:delete','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2022-11-14 19:28:33','admin','2022-11-14 19:31:06',0,0,'1',0),
	 ('1592117377299214337','45c966826eeff4c99b8f8ebfe74511fc','部门批量删除',NULL,NULL,0,NULL,NULL,2,'system:depart:deleteBatch','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2022-11-14 19:28:58','admin','2022-11-14 19:31:12',0,0,'1',0),
	 ('1592117422006300673','45c966826eeff4c99b8f8ebfe74511fc','部门导入',NULL,NULL,0,NULL,NULL,2,'system:depart:importExcel','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2022-11-14 19:29:08',NULL,NULL,0,0,'1',0),
	 ('1592117625664925697','5c2f42277948043026b7a14692456828','部门角色添加',NULL,NULL,0,NULL,NULL,2,'system:depart:role:add','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2022-11-14 19:29:57',NULL,NULL,0,0,'1',0),
	 ('1592117748209905665','5c2f42277948043026b7a14692456828','部门角色编辑',NULL,NULL,0,NULL,NULL,2,'system:depart:role:edit','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2022-11-14 19:30:26',NULL,NULL,0,0,'1',0),
	 ('1592117804359053314','5c2f42277948043026b7a14692456828','部门角色删除',NULL,NULL,0,NULL,NULL,2,'system:depart:role:delete','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2022-11-14 19:30:39',NULL,NULL,0,0,'1',0),
	 ('1592117990305132545','5c2f42277948043026b7a14692456828','部门角色批量删除',NULL,NULL,0,NULL,NULL,2,'system:depart:role:deleteBatch','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2022-11-14 19:31:24',NULL,NULL,0,0,'1',0),
	 ('1592118053634928641','5c2f42277948043026b7a14692456828','部门角色用户授权',NULL,NULL,0,NULL,NULL,2,'system:depart:role:userAdd','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2022-11-14 19:31:39',NULL,NULL,0,0,'1',0);
INSERT INTO sys_permission (id,parent_id,name,url,component,is_route,component_name,redirect,menu_type,perms,perms_type,sort_no,always_show,icon,is_leaf,keep_alive,hidden,hide_tab,description,create_by,create_time,update_by,update_time,del_flag,rule_flag,status,internal_or_external) VALUES
	 ('1592118192218927105','1438782641187074050','字典新增',NULL,NULL,0,NULL,NULL,2,'system:dict:add','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2022-11-14 19:32:12',NULL,NULL,0,0,'1',0),
	 ('1592118254844080130','1438782641187074050','字典编辑',NULL,NULL,0,NULL,NULL,2,'system:dict:edit','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2022-11-14 19:32:27',NULL,NULL,0,0,'1',0),
	 ('1592118306983473154','1438782641187074050','字典删除',NULL,NULL,0,NULL,NULL,2,'system:dict:delete','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2022-11-14 19:32:39',NULL,NULL,0,0,'1',0),
	 ('1592118356778250241','1438782641187074050','字典批量删除',NULL,NULL,0,NULL,NULL,2,'system:dict:deleteBatch','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2022-11-14 19:32:51',NULL,NULL,0,0,'1',0),
	 ('1592118414990995457','1438782641187074050','字典导入',NULL,NULL,0,NULL,NULL,2,'system:dict:importExcel','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2022-11-14 19:33:05',NULL,NULL,0,0,'1',0),
	 ('1592118497606201346','1439399179791409153','路由网关删除',NULL,NULL,0,NULL,NULL,2,'system:getway:delete','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2022-11-14 19:33:25',NULL,NULL,0,0,'1',0),
	 ('1592118604640645122','1170592628746878978','删除菜单',NULL,NULL,0,NULL,NULL,2,'system:permission:delete','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2022-11-14 19:33:50',NULL,NULL,0,0,'1',0),
	 ('1592118648315932674','1170592628746878978','批量删除菜单',NULL,NULL,0,NULL,NULL,2,'system:permission:deleteBatch','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2022-11-14 19:34:01',NULL,NULL,0,0,'1',0),
	 ('1592119001883176961','1170592628746878978','添加菜单权限数据',NULL,NULL,0,NULL,NULL,2,'system:permission:addRule','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2022-11-14 19:35:25',NULL,NULL,0,0,'1',0),
	 ('1592120052866707457','1170592628746878978','删除菜单权限数据',NULL,NULL,0,NULL,NULL,2,'system:permission:deleteRule','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2022-11-14 19:39:35',NULL,NULL,0,0,'1',0);
INSERT INTO sys_permission (id,parent_id,name,url,component,is_route,component_name,redirect,menu_type,perms,perms_type,sort_no,always_show,icon,is_leaf,keep_alive,hidden,hide_tab,description,create_by,create_time,update_by,update_time,del_flag,rule_flag,status,internal_or_external) VALUES
	 ('1592120222727630849','45c966826eeff4c99b8f8ebfe74511fc','保存部门授权',NULL,NULL,0,NULL,NULL,2,'system:permission:saveDepart','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2022-11-14 19:40:16',NULL,NULL,0,0,'1',0),
	 ('1592120224120850434','190c2b43bec6a5f7a4194a85db67d96a','查询全部角色不租户隔离',NULL,NULL,0,NULL,NULL,2,'system:role:queryallNoByTenant','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2023-01-11 19:41:18',NULL,NULL,0,0,'1',0),
	 ('1592120323667750914','190c2b43bec6a5f7a4194a85db67d96a','角色添加',NULL,NULL,0,NULL,NULL,2,'system:role:add','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2022-11-14 19:40:40',NULL,NULL,0,0,'1',0),
	 ('1592120372296511490','190c2b43bec6a5f7a4194a85db67d96a','角色编辑',NULL,NULL,0,NULL,NULL,2,'system:role:edit','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2022-11-14 19:40:52',NULL,NULL,0,0,'1',0),
	 ('1592120427007012865','190c2b43bec6a5f7a4194a85db67d96a','角色删除',NULL,NULL,0,NULL,NULL,2,'system:role:delete','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2022-11-14 19:41:05',NULL,NULL,0,0,'1',0),
	 ('1592120484120850434','190c2b43bec6a5f7a4194a85db67d96a','角色批量删除',NULL,NULL,0,NULL,NULL,2,'system:role:deleteBatch','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2022-11-14 19:41:18',NULL,NULL,0,0,'1',0),
	 ('1592120594695286785','190c2b43bec6a5f7a4194a85db67d96a','角色首页配置添加',NULL,NULL,0,NULL,NULL,2,'system:roleindex:add','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2022-11-14 19:41:45',NULL,NULL,0,0,'1',0),
	 ('1592120649007329281','190c2b43bec6a5f7a4194a85db67d96a','角色首页配置编辑',NULL,NULL,0,NULL,NULL,2,'system:roleindex:edit','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2022-11-14 19:41:58',NULL,NULL,0,0,'1',0),
	 ('1592135223910765570','3f915b2769fc80648e92d04e84ca059d','查询全部用户',NULL,NULL,0,NULL,NULL,2,'system:user:listAll','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2022-11-14 19:20:22',NULL,NULL,0,0,'1',0),
	 ('1593160905216663554','1438782641187074050','字典子项新增',NULL,NULL,0,NULL,NULL,2,'system:dict:item:add','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2022-11-17 16:35:34',NULL,NULL,0,0,'1',0);
INSERT INTO sys_permission (id,parent_id,name,url,component,is_route,component_name,redirect,menu_type,perms,perms_type,sort_no,always_show,icon,is_leaf,keep_alive,hidden,hide_tab,description,create_by,create_time,update_by,update_time,del_flag,rule_flag,status,internal_or_external) VALUES
	 ('1593160959633563650','1438782641187074050','字典子项编辑',NULL,NULL,0,NULL,NULL,2,'system:dict:item:edit','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2022-11-17 16:35:47',NULL,NULL,0,0,'1',0),
	 ('1593161025790320641','1438782641187074050','字典子项删除',NULL,NULL,0,NULL,NULL,2,'system:dict:item:delete','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2022-11-17 16:36:03',NULL,NULL,0,0,'1',0),
	 ('1593161089787011074','1438782641187074050','字典子项批量删除',NULL,NULL,0,NULL,NULL,2,'system:dict:item:deleteBatch','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2022-11-17 16:36:18',NULL,NULL,0,0,'1',0),
	 ('1593161421350936578','1439488251473993730','添加定时任务',NULL,NULL,0,NULL,NULL,2,'system:quartzJob:add','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2022-11-17 16:37:37',NULL,NULL,0,0,'1',0),
	 ('1593161483627962370','1439488251473993730','更新定时任务',NULL,NULL,0,NULL,NULL,2,'system:quartzJob:edit','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2022-11-17 16:37:52',NULL,NULL,0,0,'1',0),
	 ('1593161551202394114','1439488251473993730','删除定时任务',NULL,NULL,0,NULL,NULL,2,'system:quartzJob:delete','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2022-11-17 16:38:08',NULL,NULL,0,0,'1',0),
	 ('1593161608362369026','1439488251473993730','批量删除定时任务',NULL,NULL,0,NULL,NULL,2,'system:quartzJob:deleteBatch','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2022-11-17 16:38:22',NULL,NULL,0,0,'1',0),
	 ('1593161657385394177','1439488251473993730','停止定时任务',NULL,NULL,0,NULL,NULL,2,'system:quartzJob:pause','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2022-11-17 16:38:33',NULL,NULL,0,0,'1',0),
	 ('1593161697348722689','1439488251473993730','启动定时任务',NULL,NULL,0,NULL,NULL,2,'system:quartzJob:resume','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2022-11-17 16:38:43',NULL,NULL,0,0,'1',0),
	 ('1593161743607701505','1439488251473993730','立即执行定时任务',NULL,NULL,0,NULL,NULL,2,'system:quartzJob:execute','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2022-11-17 16:38:54',NULL,NULL,0,0,'1',0);
INSERT INTO sys_permission (id,parent_id,name,url,component,is_route,component_name,redirect,menu_type,perms,perms_type,sort_no,always_show,icon,is_leaf,keep_alive,hidden,hide_tab,description,create_by,create_time,update_by,update_time,del_flag,rule_flag,status,internal_or_external) VALUES
	 ('1593185714482880514','3f915b2769fc80648e92d04e84ca059d','用户导出',NULL,NULL,0,NULL,NULL,2,'system:user:export','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2022-11-17 18:14:09',NULL,NULL,0,0,'1',0),
	 ('1594930803956920321','1439398677984878593','在线用户','/system/onlineuser','system/onlineuser/OnlineUserList',1,'',NULL,1,NULL,'0',12.0,0,'ant-design:aliwangwang-outlined',1,0,0,0,NULL,'admin','2022-11-22 13:48:31','admin','2023-03-04 15:15:36',0,0,NULL,0),
	 ('1596141938193747970','d7d6e2e4e2934f2c9385a623fd98c6f3','用户设置','/system/usersetting','system/usersetting/UserSetting',1,'',NULL,1,NULL,'0',12.0,0,'ant-design:setting-twotone',0,0,1,0,NULL,'admin','2022-11-25 22:01:08','admin','2023-03-04 15:00:26',0,0,NULL,0),
	 ('1596335805278990338','1596141938193747970','账户设置用户编辑权限',NULL,NULL,0,NULL,NULL,2,'system:user:setting:edit','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2022-11-26 10:51:29',NULL,NULL,0,0,'1',0),
	 ('1597419994965786625','1633804334561746946','租户角色','/system/role/TenantRoleList','system/role/TenantRoleList',1,'',NULL,1,NULL,'0',3.2,0,'ant-design:line-height-outlined',1,0,0,0,NULL,'admin','2022-11-29 10:39:40','admin','2023-03-09 20:18:23',0,0,NULL,0),
	 ('15c92115213910765570','3f915b2769fc80648e92d04e84ca059d','通过ID查询用户信息接口',NULL,NULL,0,NULL,NULL,2,'system:user:queryById','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2022-11-14 19:20:22',NULL,NULL,0,0,'1',0),
	 ('1600105607009165314','1280350452934307841','邀请用户',NULL,NULL,0,NULL,NULL,2,'system:tenant:invitation:user','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2022-12-06 20:31:20',NULL,NULL,0,0,'1',0),
	 ('1600108123037917186','1280350452934307841','通过租户id获取用户',NULL,NULL,0,NULL,NULL,2,'system:tenant:user:list','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2022-12-06 20:41:20',NULL,NULL,0,0,'1',0),
	 ('1600129606082650113','1280350452934307841','租户请离',NULL,NULL,0,NULL,NULL,2,'system:tenant:leave','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2022-12-06 22:06:42',NULL,NULL,0,0,'1',0),
	 ('1611620416187969538','1280350452934307841','分页获取租户用户数据',NULL,NULL,0,NULL,NULL,2,'system:tenant:tenantPageList','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2023-01-07 15:07:04',NULL,NULL,0,0,'1',0);
INSERT INTO sys_permission (id,parent_id,name,url,component,is_route,component_name,redirect,menu_type,perms,perms_type,sort_no,always_show,icon,is_leaf,keep_alive,hidden,hide_tab,description,create_by,create_time,update_by,update_time,del_flag,rule_flag,status,internal_or_external) VALUES
	 ('1611620600003342337','1280350452934307841','通过用户id获取租户列表',NULL,NULL,0,NULL,NULL,2,'system:tenant:getTenantListByUserId','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2023-01-07 15:07:48',NULL,NULL,0,0,'1',0),
	 ('1611620654621569026','1280350452934307841','更新用户租户关系状态',NULL,NULL,0,NULL,NULL,2,'system:tenant:updateUserTenantStatus','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2023-01-07 15:08:01',NULL,NULL,0,0,'1',0),
	 ('1611620772498218641','1280350452934307841','查询租户列表',NULL,NULL,0,NULL,NULL,2,'system:tenant:list','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2023-01-11 15:08:29',NULL,NULL,0,0,'1',0),
	 ('1611620772498288641','1280350452934307841','注销租户',NULL,NULL,0,NULL,NULL,2,'system:tenant:cancelTenant','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2023-01-07 15:08:29',NULL,NULL,0,0,'1',0),
	 ('1611650772498288641','1280350452934307841','删除租户',NULL,NULL,0,NULL,NULL,2,'system:tenant:delete','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2023-01-11 15:08:29',NULL,NULL,0,0,'1',0),
	 ('1612438989792034818','1280350452934307841','编辑租户',NULL,NULL,0,NULL,NULL,2,'system:tenant:edit','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2023-01-07 15:08:29',NULL,NULL,0,0,'1',0),
	 ('1613620712498288641','1280350452934307841','批量删除租户',NULL,NULL,0,NULL,NULL,2,'system:tenant:deleteBatch','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2023-01-11 15:08:29',NULL,NULL,0,0,'1',0),
	 ('1620261087828418562','1280350452934307841','获取租户删除的列表',NULL,NULL,0,NULL,NULL,2,'system:tenant:recycleBinPageList','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2023-01-31 11:22:01',NULL,NULL,0,0,'1',0),
	 ('1620305415648989186','1280350452934307841','彻底删除租户',NULL,NULL,0,NULL,NULL,2,'system:tenant:deleteTenantLogic','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2023-01-31 14:18:10','admin','2023-01-31 14:19:51',0,0,'1',0),
	 ('1620327825894981634','1280350452934307841','租户还原',NULL,NULL,0,NULL,NULL,2,'system:tenant:revertTenantLogic','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2023-01-31 15:47:13',NULL,NULL,0,0,'1',0);
INSERT INTO sys_permission (id,parent_id,name,url,component,is_route,component_name,redirect,menu_type,perms,perms_type,sort_no,always_show,icon,is_leaf,keep_alive,hidden,hide_tab,description,create_by,create_time,update_by,update_time,del_flag,rule_flag,status,internal_or_external) VALUES
	 ('1621620772498288641','1280350452934307841','添加租户',NULL,NULL,0,NULL,NULL,2,'system:tenant:add','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2023-01-11 15:08:29',NULL,NULL,0,0,'1',0),
	 ('1633804334561746946','','我的租户','/mytenant','layouts/RouteView',1,'',NULL,0,NULL,'0',4.0,0,'ant-design:ant-design-outlined',0,0,0,0,NULL,'admin','2023-03-09 20:18:03','admin','2023-03-09 20:20:57',0,0,NULL,0),
	 ('1647430912296435713',NULL,'装备管理','/edu','layouts/RouteView',1,'',NULL,0,NULL,'0',1.0,0,'ant-design:appstore-add-outlined',0,0,0,0,NULL,'admin','2023-04-16 10:45:12',NULL,NULL,0,0,NULL,0),
	 ('1697220712498288641','1280350452934307841','根据ids查询租户',NULL,NULL,0,NULL,NULL,2,'system:tenant:queryList','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2023-01-11 15:08:29',NULL,NULL,0,0,'1',0),
	 ('190c2b43bec6a5f7a4194a85db67d96a','d7d6e2e4e2934f2c9385a623fd98c6f3','角色管理','/system/role','system/role/index',1,NULL,NULL,1,NULL,NULL,2.0,0,'ant-design:solution',0,1,0,NULL,NULL,NULL,'2018-12-25 20:34:38','admin','2021-09-17 15:58:00',0,0,NULL,0),
	 ('1a0811914300741f4e11838ff37a1d3a','3f915b2769fc80648e92d04e84ca059d','手机号禁用','','',0,NULL,NULL,2,'user:form:phone','2',1.0,0,NULL,1,NULL,0,NULL,NULL,'admin','2019-05-11 17:19:30','admin','2019-05-11 18:00:22',0,0,'1',NULL),
	 ('1d592115213910765570','3f915b2769fc80648e92d04e84ca059d','通过ID查询用户拥有的角色',NULL,NULL,0,NULL,NULL,2,'system:user:queryUserRole','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2022-11-14 19:20:22',NULL,NULL,0,0,'1',0),
	 ('2023041607073870410','1647430912296435713','小学美术教学装备配置登记表','/edu/eduartequipment/eduArtEquipmentInfoList','edu/eduartequipment/EduArtEquipmentInfoList',1,NULL,NULL,1,NULL,'1',5.0,0,'ant-design:ant-cloud-outlined',0,0,0,0,NULL,'admin','2023-04-16 19:07:41','admin','2023-04-16 20:35:27',0,0,'1',0),
	 ('2023041607073870411','2023041607073870410','添加小学美术教学装备配置登记表',NULL,NULL,0,NULL,NULL,2,'edu.eduartequipment:edu_art_equipment_info:add','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2023-04-16 19:07:41',NULL,NULL,0,0,'1',0),
	 ('2023041607073870412','2023041607073870410','编辑小学美术教学装备配置登记表',NULL,NULL,0,NULL,NULL,2,'edu.eduartequipment:edu_art_equipment_info:edit','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2023-04-16 19:07:41',NULL,NULL,0,0,'1',0);
INSERT INTO sys_permission (id,parent_id,name,url,component,is_route,component_name,redirect,menu_type,perms,perms_type,sort_no,always_show,icon,is_leaf,keep_alive,hidden,hide_tab,description,create_by,create_time,update_by,update_time,del_flag,rule_flag,status,internal_or_external) VALUES
	 ('2023041607073870413','2023041607073870410','删除小学美术教学装备配置登记表',NULL,NULL,0,NULL,NULL,2,'edu.eduartequipment:edu_art_equipment_info:delete','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2023-04-16 19:07:41',NULL,NULL,0,0,'1',0),
	 ('2023041607073870414','2023041607073870410','批量删除小学美术教学装备配置登记表',NULL,NULL,0,NULL,NULL,2,'edu.eduartequipment:edu_art_equipment_info:deleteBatch','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2023-04-16 19:07:41',NULL,NULL,0,0,'1',0),
	 ('2023041607073870415','2023041607073870410','导出excel_小学美术教学装备配置登记表',NULL,NULL,0,NULL,NULL,2,'edu.eduartequipment:edu_art_equipment_info:exportXls','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2023-04-16 19:07:41',NULL,NULL,0,0,'1',0),
	 ('2023041607073870416','2023041607073870410','导入excel_小学美术教学装备配置登记表',NULL,NULL,0,NULL,NULL,2,'edu.eduartequipment:edu_art_equipment_info:importExcel','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2023-04-16 19:07:41',NULL,NULL,0,0,'1',0),
	 ('2023041607082460450','1647430912296435713','小学数学教学装备配置登记表','/edu/edumathematicsequipment/eduMathematicsEquipmentInfoList','edu/edumathematicsequipment/EduMathematicsEquipmentInfoList',1,NULL,NULL,1,NULL,'1',6.0,0,'ant-design:ant-design-outlined',0,0,0,0,NULL,'admin','2023-04-16 19:08:45','admin','2023-04-16 20:35:43',0,0,'1',0),
	 ('2023041607082460451','2023041607082460450','添加小学数学教学装备配置登记表',NULL,NULL,0,NULL,NULL,2,'edu.edumathematicsequipment:edu_mathematics_equipment_info:add','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2023-04-16 19:08:45',NULL,NULL,0,0,'1',0),
	 ('2023041607082460452','2023041607082460450','编辑小学数学教学装备配置登记表',NULL,NULL,0,NULL,NULL,2,'edu.edumathematicsequipment:edu_mathematics_equipment_info:edit','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2023-04-16 19:08:45',NULL,NULL,0,0,'1',0),
	 ('2023041607082460453','2023041607082460450','删除小学数学教学装备配置登记表',NULL,NULL,0,NULL,NULL,2,'edu.edumathematicsequipment:edu_mathematics_equipment_info:delete','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2023-04-16 19:08:45',NULL,NULL,0,0,'1',0),
	 ('2023041607082460454','2023041607082460450','批量删除小学数学教学装备配置登记表',NULL,NULL,0,NULL,NULL,2,'edu.edumathematicsequipment:edu_mathematics_equipment_info:deleteBatch','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2023-04-16 19:08:45',NULL,NULL,0,0,'1',0),
	 ('2023041607082460455','2023041607082460450','导出excel_小学数学教学装备配置登记表',NULL,NULL,0,NULL,NULL,2,'edu.edumathematicsequipment:edu_mathematics_equipment_info:exportXls','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2023-04-16 19:08:45',NULL,NULL,0,0,'1',0);
INSERT INTO sys_permission (id,parent_id,name,url,component,is_route,component_name,redirect,menu_type,perms,perms_type,sort_no,always_show,icon,is_leaf,keep_alive,hidden,hide_tab,description,create_by,create_time,update_by,update_time,del_flag,rule_flag,status,internal_or_external) VALUES
	 ('2023041607082460456','2023041607082460450','导入excel_小学数学教学装备配置登记表',NULL,NULL,0,NULL,NULL,2,'edu.edumathematicsequipment:edu_mathematics_equipment_info:importExcel','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2023-04-16 19:08:45',NULL,NULL,0,0,'1',0),
	 ('2023041607099920030','1647430912296435713','小学体育教学装备配置登记表','/edu/edusportequipment/eduSportEquipmentInfoList','edu/edusportequipment/EduSportEquipmentInfoList',1,NULL,NULL,1,NULL,'1',7.0,0,'ant-design:appstore-add-outlined',0,0,0,0,NULL,'admin','2023-04-16 19:09:03','admin','2023-04-16 20:35:59',0,0,'1',0),
	 ('2023041607099920031','2023041607099920030','添加小学体育教学装备配置登记表',NULL,NULL,0,NULL,NULL,2,'edu.edusportequipment:edu_sport_equipment_info:add','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2023-04-16 19:09:03',NULL,NULL,0,0,'1',0),
	 ('2023041607099920032','2023041607099920030','编辑小学体育教学装备配置登记表',NULL,NULL,0,NULL,NULL,2,'edu.edusportequipment:edu_sport_equipment_info:edit','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2023-04-16 19:09:03',NULL,NULL,0,0,'1',0),
	 ('2023041607099920033','2023041607099920030','删除小学体育教学装备配置登记表',NULL,NULL,0,NULL,NULL,2,'edu.edusportequipment:edu_sport_equipment_info:delete','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2023-04-16 19:09:03',NULL,NULL,0,0,'1',0),
	 ('2023041607099920034','2023041607099920030','批量删除小学体育教学装备配置登记表',NULL,NULL,0,NULL,NULL,2,'edu.edusportequipment:edu_sport_equipment_info:deleteBatch','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2023-04-16 19:09:03',NULL,NULL,0,0,'1',0),
	 ('2023041607099920035','2023041607099920030','导出excel_小学体育教学装备配置登记表',NULL,NULL,0,NULL,NULL,2,'edu.edusportequipment:edu_sport_equipment_info:exportXls','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2023-04-16 19:09:03',NULL,NULL,0,0,'1',0),
	 ('2023041607099920036','2023041607099920030','导入excel_小学体育教学装备配置登记表',NULL,NULL,0,NULL,NULL,2,'edu.edusportequipment:edu_sport_equipment_info:importExcel','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2023-04-16 19:09:03',NULL,NULL,0,0,'1',0),
	 ('2023041607317220560','1647430912296435713','中小学图书室基本情况统计表','/edu/edulibrarybasic/eduLibraryBasicInfoList','edu/edulibrarybasic/EduLibraryBasicInfoList',1,NULL,NULL,1,NULL,'1',8.0,0,'ant-design:appstore-outlined',0,0,0,0,NULL,'admin','2023-04-16 19:31:56','admin','2023-04-16 20:36:15',0,0,'1',0),
	 ('2023041607317220561','2023041607317220560','添加中小学图书室基本情况统计表',NULL,NULL,0,NULL,NULL,2,'edu.edulibrarybasic:edu_library_basic_info:add','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2023-04-16 19:31:56',NULL,NULL,0,0,'1',0);
INSERT INTO sys_permission (id,parent_id,name,url,component,is_route,component_name,redirect,menu_type,perms,perms_type,sort_no,always_show,icon,is_leaf,keep_alive,hidden,hide_tab,description,create_by,create_time,update_by,update_time,del_flag,rule_flag,status,internal_or_external) VALUES
	 ('2023041607317220562','2023041607317220560','编辑中小学图书室基本情况统计表',NULL,NULL,0,NULL,NULL,2,'edu.edulibrarybasic:edu_library_basic_info:edit','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2023-04-16 19:31:56',NULL,NULL,0,0,'1',0),
	 ('2023041607317220563','2023041607317220560','删除中小学图书室基本情况统计表',NULL,NULL,0,NULL,NULL,2,'edu.edulibrarybasic:edu_library_basic_info:delete','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2023-04-16 19:31:56',NULL,NULL,0,0,'1',0),
	 ('2023041607317220564','2023041607317220560','批量删除中小学图书室基本情况统计表',NULL,NULL,0,NULL,NULL,2,'edu.edulibrarybasic:edu_library_basic_info:deleteBatch','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2023-04-16 19:31:56',NULL,NULL,0,0,'1',0),
	 ('2023041607317220565','2023041607317220560','导出excel_中小学图书室基本情况统计表',NULL,NULL,0,NULL,NULL,2,'edu.edulibrarybasic:edu_library_basic_info:exportXls','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2023-04-16 19:31:56',NULL,NULL,0,0,'1',0),
	 ('2023041607317220566','2023041607317220560','导入excel_中小学图书室基本情况统计表',NULL,NULL,0,NULL,NULL,2,'edu.edulibrarybasic:edu_library_basic_info:importExcel','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2023-04-16 19:31:56',NULL,NULL,0,0,'1',0),
	 ('2023041607439020540','1647430912296435713','中小学体育音乐美术教学用房统计表','/edu/edusportsmusicartrooms/eduSportsMusicArtRoomsList','edu/edusportsmusicartrooms/EduSportsMusicArtRoomsList',1,NULL,NULL,1,NULL,'1',9.0,0,'ant-design:appstore-filled',0,0,0,0,NULL,'admin','2023-04-16 19:43:54','admin','2023-04-16 20:36:40',0,0,'1',0),
	 ('2023041607439020541','2023041607439020540','添加中小学体育音乐美术教学用房统计表',NULL,NULL,0,NULL,NULL,2,'edu.edusportsmusicartrooms:edu_sports_music_art_rooms:add','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2023-04-16 19:43:54',NULL,NULL,0,0,'1',0),
	 ('2023041607439020542','2023041607439020540','编辑中小学体育音乐美术教学用房统计表',NULL,NULL,0,NULL,NULL,2,'edu.edusportsmusicartrooms:edu_sports_music_art_rooms:edit','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2023-04-16 19:43:54',NULL,NULL,0,0,'1',0),
	 ('2023041607439020543','2023041607439020540','删除中小学体育音乐美术教学用房统计表',NULL,NULL,0,NULL,NULL,2,'edu.edusportsmusicartrooms:edu_sports_music_art_rooms:delete','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2023-04-16 19:43:54',NULL,NULL,0,0,'1',0),
	 ('2023041607439020544','2023041607439020540','批量删除中小学体育音乐美术教学用房统计表',NULL,NULL,0,NULL,NULL,2,'edu.edusportsmusicartrooms:edu_sports_music_art_rooms:deleteBatch','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2023-04-16 19:43:54',NULL,NULL,0,0,'1',0);
INSERT INTO sys_permission (id,parent_id,name,url,component,is_route,component_name,redirect,menu_type,perms,perms_type,sort_no,always_show,icon,is_leaf,keep_alive,hidden,hide_tab,description,create_by,create_time,update_by,update_time,del_flag,rule_flag,status,internal_or_external) VALUES
	 ('2023041607439020545','2023041607439020540','导出excel_中小学体育音乐美术教学用房统计表',NULL,NULL,0,NULL,NULL,2,'edu.edusportsmusicartrooms:edu_sports_music_art_rooms:exportXls','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2023-04-16 19:43:54',NULL,NULL,0,0,'1',0),
	 ('2023041607439020546','2023041607439020540','导入excel_中小学体育音乐美术教学用房统计表',NULL,NULL,0,NULL,NULL,2,'edu.edusportsmusicartrooms:edu_sports_music_art_rooms:importExcel','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2023-04-16 19:43:54',NULL,NULL,0,0,'1',0),
	 ('2023041608019580490','1647430912296435713','教育信息化基本情况统计表','/edu/eduinformatizationbasic/eduInformatizationBasicInfoList','edu/eduinformatizationbasic/EduInformatizationBasicInfoList',1,NULL,NULL,1,NULL,'1',5.0,0,'ant-design:apple-outlined',0,0,0,0,NULL,'admin','2023-04-16 20:01:49','admin','2023-04-16 20:41:54',0,0,'1',0),
	 ('2023041608019580491','2023041608019580490','添加教育信息化基本情况统计表',NULL,NULL,0,NULL,NULL,2,'edu.eduinformatizationbasic:edu_informatization_basic_info:add','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2023-04-16 20:01:49',NULL,NULL,0,0,'1',0),
	 ('2023041608019580492','2023041608019580490','编辑教育信息化基本情况统计表',NULL,NULL,0,NULL,NULL,2,'edu.eduinformatizationbasic:edu_informatization_basic_info:edit','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2023-04-16 20:01:49',NULL,NULL,0,0,'1',0),
	 ('2023041608019580493','2023041608019580490','删除教育信息化基本情况统计表',NULL,NULL,0,NULL,NULL,2,'edu.eduinformatizationbasic:edu_informatization_basic_info:delete','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2023-04-16 20:01:49',NULL,NULL,0,0,'1',0),
	 ('2023041608019580494','2023041608019580490','批量删除教育信息化基本情况统计表',NULL,NULL,0,NULL,NULL,2,'edu.eduinformatizationbasic:edu_informatization_basic_info:deleteBatch','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2023-04-16 20:01:49',NULL,NULL,0,0,'1',0),
	 ('2023041608019580495','2023041608019580490','导出excel_教育信息化基本情况统计表',NULL,NULL,0,NULL,NULL,2,'edu.eduinformatizationbasic:edu_informatization_basic_info:exportXls','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2023-04-16 20:01:49',NULL,NULL,0,0,'1',0),
	 ('2023041608019580496','2023041608019580490','导入excel_教育信息化基本情况统计表',NULL,NULL,0,NULL,NULL,2,'edu.eduinformatizationbasic:edu_informatization_basic_info:importExcel','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2023-04-16 20:01:49',NULL,NULL,0,0,'1',0),
	 ('2023041608168730410','1647430912296435713','小学科学教学装备配置登记表','/edu/eduscientificequipment/eduScientificEquipmentInfoList','edu/eduscientificequipment/EduScientificEquipmentInfoList',1,NULL,NULL,1,NULL,'1',5.0,0,'ant-design:audit-outlined',0,0,0,0,NULL,'admin','2023-04-16 20:16:41','admin','2023-04-16 20:37:42',0,0,'1',0);
INSERT INTO sys_permission (id,parent_id,name,url,component,is_route,component_name,redirect,menu_type,perms,perms_type,sort_no,always_show,icon,is_leaf,keep_alive,hidden,hide_tab,description,create_by,create_time,update_by,update_time,del_flag,rule_flag,status,internal_or_external) VALUES
	 ('2023041608168730411','2023041608168730410','添加小学科学教学装备配置登记表',NULL,NULL,0,NULL,NULL,2,'edu.eduscientificequipment:edu_scientific_equipment_info:add','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2023-04-16 20:16:41',NULL,NULL,0,0,'1',0),
	 ('2023041608168730412','2023041608168730410','编辑小学科学教学装备配置登记表',NULL,NULL,0,NULL,NULL,2,'edu.eduscientificequipment:edu_scientific_equipment_info:edit','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2023-04-16 20:16:41',NULL,NULL,0,0,'1',0),
	 ('2023041608168730413','2023041608168730410','删除小学科学教学装备配置登记表',NULL,NULL,0,NULL,NULL,2,'edu.eduscientificequipment:edu_scientific_equipment_info:delete','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2023-04-16 20:16:41',NULL,NULL,0,0,'1',0),
	 ('2023041608168730414','2023041608168730410','批量删除小学科学教学装备配置登记表',NULL,NULL,0,NULL,NULL,2,'edu.eduscientificequipment:edu_scientific_equipment_info:deleteBatch','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2023-04-16 20:16:41',NULL,NULL,0,0,'1',0),
	 ('2023041608168730415','2023041608168730410','导出excel_小学科学教学装备配置登记表',NULL,NULL,0,NULL,NULL,2,'edu.eduscientificequipment:edu_scientific_equipment_info:exportXls','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2023-04-16 20:16:41',NULL,NULL,0,0,'1',0),
	 ('2023041608168730416','2023041608168730410','导入excel_小学科学教学装备配置登记表',NULL,NULL,0,NULL,NULL,2,'edu.eduscientificequipment:edu_scientific_equipment_info:importExcel','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2023-04-16 20:16:41',NULL,NULL,0,0,'1',0),
	 ('2023041610053670010','1647430912296435713','中小学实验室基本情况统计表','/edu/edulabbasic/eduLabBasicInfoList','edu/edulabbasic/EduLabBasicInfoList',1,NULL,NULL,1,NULL,'1',5.0,0,'ant-design:android-outlined',0,0,0,0,NULL,'admin','2023-04-16 10:05:01','admin','2023-04-16 11:56:16',0,0,'1',0),
	 ('2023041610053680011','2023041610053670010','添加中小学实验室基本情况统计表',NULL,NULL,0,NULL,NULL,2,'edu.edulabbasic:edu_lab_basic_info:add','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2023-04-16 10:05:01',NULL,NULL,0,0,'1',0),
	 ('2023041610053680012','2023041610053670010','编辑中小学实验室基本情况统计表',NULL,NULL,0,NULL,NULL,2,'edu.edulabbasic:edu_lab_basic_info:edit','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2023-04-16 10:05:01',NULL,NULL,0,0,'1',0),
	 ('2023041610053680013','2023041610053670010','删除中小学实验室基本情况统计表',NULL,NULL,0,NULL,NULL,2,'edu.edulabbasic:edu_lab_basic_info:delete','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2023-04-16 10:05:01',NULL,NULL,0,0,'1',0);
INSERT INTO sys_permission (id,parent_id,name,url,component,is_route,component_name,redirect,menu_type,perms,perms_type,sort_no,always_show,icon,is_leaf,keep_alive,hidden,hide_tab,description,create_by,create_time,update_by,update_time,del_flag,rule_flag,status,internal_or_external) VALUES
	 ('2023041610053680014','2023041610053670010','批量删除中小学实验室基本情况统计表',NULL,NULL,0,NULL,NULL,2,'edu.edulabbasic:edu_lab_basic_info:deleteBatch','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2023-04-16 10:05:01',NULL,NULL,0,0,'1',0),
	 ('2023041610053680015','2023041610053670010','导出excel_中小学实验室基本情况统计表',NULL,NULL,0,NULL,NULL,2,'edu.edulabbasic:edu_lab_basic_info:exportXls','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2023-04-16 10:05:01',NULL,NULL,0,0,'1',0),
	 ('2023041610053680016','2023041610053670010','导入excel_中小学实验室基本情况统计表',NULL,NULL,0,NULL,NULL,2,'edu.edulabbasic:edu_lab_basic_info:importExcel','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2023-04-16 10:05:01',NULL,NULL,0,0,'1',0),
	 ('2023041610121570270','1647430912296435713','小学音乐教学装备配置登记表','/edu/edumusicequipment/eduMusicEquipmentInfoList','edu/edumusicequipment/EduMusicEquipmentInfoList',1,NULL,NULL,1,NULL,'1',10.0,0,'ant-design:apartment-outlined',0,0,0,0,NULL,'admin','2023-04-16 10:12:27','admin','2023-04-16 12:01:37',0,0,'1',0),
	 ('2023041610121570271','2023041610121570270','添加小学音乐教学装备配置登记表',NULL,NULL,0,NULL,NULL,2,'edu.edumusicequipment:edu_music_equipment_info:add','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2023-04-16 10:12:27',NULL,NULL,0,0,'1',0),
	 ('2023041610121570272','2023041610121570270','编辑小学音乐教学装备配置登记表',NULL,NULL,0,NULL,NULL,2,'edu.edumusicequipment:edu_music_equipment_info:edit','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2023-04-16 10:12:27',NULL,NULL,0,0,'1',0),
	 ('2023041610121570273','2023041610121570270','删除小学音乐教学装备配置登记表',NULL,NULL,0,NULL,NULL,2,'edu.edumusicequipment:edu_music_equipment_info:delete','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2023-04-16 10:12:27',NULL,NULL,0,0,'1',0),
	 ('2023041610121570274','2023041610121570270','批量删除小学音乐教学装备配置登记表',NULL,NULL,0,NULL,NULL,2,'edu.edumusicequipment:edu_music_equipment_info:deleteBatch','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2023-04-16 10:12:27',NULL,NULL,0,0,'1',0),
	 ('2023041610121570275','2023041610121570270','导出excel_小学音乐教学装备配置登记表',NULL,NULL,0,NULL,NULL,2,'edu.edumusicequipment:edu_music_equipment_info:exportXls','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2023-04-16 10:12:27',NULL,NULL,0,0,'1',0),
	 ('2023041610121570276','2023041610121570270','导入excel_小学音乐教学装备配置登记表',NULL,NULL,0,NULL,NULL,2,'edu.edumusicequipment:edu_music_equipment_info:importExcel','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2023-04-16 10:12:27',NULL,NULL,0,0,'1',0);
INSERT INTO sys_permission (id,parent_id,name,url,component,is_route,component_name,redirect,menu_type,perms,perms_type,sort_no,always_show,icon,is_leaf,keep_alive,hidden,hide_tab,description,create_by,create_time,update_by,update_time,del_flag,rule_flag,status,internal_or_external) VALUES
	 ('2023041611346300020','1647430912296435713','小学教学仪器设备登记册','/edu/eduequipmentregister/eduEquipmentRegisterInfoList','edu/eduequipmentregister/EduEquipmentRegisterInfoList',1,NULL,NULL,1,NULL,'1',5.0,0,'ant-design:bug-filled',0,0,0,0,NULL,'admin','2023-04-16 11:34:02','admin','2023-04-16 12:00:48',0,0,'1',0),
	 ('2023041611346300021','2023041611346300020','添加小学教学仪器设备登记册',NULL,NULL,0,NULL,NULL,2,'edu.eduequipmentregister:edu_equipment_register_info:add','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2023-04-16 11:34:02',NULL,NULL,0,0,'1',0),
	 ('2023041611346310022','2023041611346300020','编辑小学教学仪器设备登记册',NULL,NULL,0,NULL,NULL,2,'edu.eduequipmentregister:edu_equipment_register_info:edit','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2023-04-16 11:34:02',NULL,NULL,0,0,'1',0),
	 ('2023041611346310023','2023041611346300020','删除小学教学仪器设备登记册',NULL,NULL,0,NULL,NULL,2,'edu.eduequipmentregister:edu_equipment_register_info:delete','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2023-04-16 11:34:02',NULL,NULL,0,0,'1',0),
	 ('2023041611346310024','2023041611346300020','批量删除小学教学仪器设备登记册',NULL,NULL,0,NULL,NULL,2,'edu.eduequipmentregister:edu_equipment_register_info:deleteBatch','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2023-04-16 11:34:02',NULL,NULL,0,0,'1',0),
	 ('2023041611346310025','2023041611346300020','导出excel_小学教学仪器设备登记册',NULL,NULL,0,NULL,NULL,2,'edu.eduequipmentregister:edu_equipment_register_info:exportXls','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2023-04-16 11:34:02',NULL,NULL,0,0,'1',0),
	 ('2023041611346310026','2023041611346300020','导入excel_小学教学仪器设备登记册',NULL,NULL,0,NULL,NULL,2,'edu.eduequipmentregister:edu_equipment_register_info:importExcel','1',NULL,0,NULL,1,0,0,0,NULL,'admin','2023-04-16 11:34:02',NULL,NULL,0,0,'1',0),
	 ('3f915b2769fc80648e92d04e84ca059d','d7d6e2e4e2934f2c9385a623fd98c6f3','用户管理','/system/user','system/user/index',1,NULL,NULL,1,NULL,NULL,1.0,0,'ant-design:user',0,1,0,NULL,NULL,NULL,'2018-12-25 20:34:38','sunjianlei','2021-05-08 09:57:31',0,0,NULL,0),
	 ('45c966826eeff4c99b8f8ebfe74511fc','d7d6e2e4e2934f2c9385a623fd98c6f3','部门管理','/system/depart','system/depart/index',1,NULL,NULL,1,NULL,NULL,3.0,0,'ant-design:team',0,0,0,NULL,NULL,'admin','2019-01-29 18:47:40','admin','2021-09-17 15:58:13',0,0,NULL,0),
	 ('5c2f42277948043026b7a14692456828','d7d6e2e4e2934f2c9385a623fd98c6f3','我的部门','/system/depart-user','system/departUser/index',1,NULL,NULL,1,NULL,NULL,3.0,0,'ant-design:home-outlined',0,0,0,0,NULL,'admin','2019-04-17 15:12:24','admin','2023-03-04 15:03:07',0,0,NULL,0);
INSERT INTO sys_permission (id,parent_id,name,url,component,is_route,component_name,redirect,menu_type,perms,perms_type,sort_no,always_show,icon,is_leaf,keep_alive,hidden,hide_tab,description,create_by,create_time,update_by,update_time,del_flag,rule_flag,status,internal_or_external) VALUES
	 ('9502685863ab87f0ad1134142788a385','1438108176273760258','首页','/dashboard/analysis','dashboard/Analysis',1,NULL,NULL,1,NULL,NULL,1.0,0,'ant-design:bank-filled',1,1,0,NULL,NULL,NULL,'2018-12-25 20:34:38','admin','2021-09-17 15:43:16',0,0,NULL,0),
	 ('d7d6e2e4e2934f2c9385a623fd98c6f3','','系统管理','/isystem','layouts/RouteView',1,NULL,NULL,0,NULL,NULL,3.0,0,'ant-design:setting',0,0,0,0,NULL,NULL,'2018-12-25 20:34:38','admin','2022-11-11 15:37:11',0,0,NULL,0);

-- ----------------------------
-- Table structure for sys_permission_data_rule
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission_data_rule`;
CREATE TABLE `sys_permission_data_rule`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ID',
  `permission_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单ID',
  `rule_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规则名称',
  `rule_column` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段',
  `rule_conditions` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '条件',
  `rule_value` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规则值',
  `status` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限有效状态1有0否',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_spdr_permission_id`(`permission_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_permission_data_rule
-- ----------------------------
INSERT INTO sys_permission_data_rule (id,permission_id,rule_name,rule_column,rule_conditions,rule_value,status,create_time,create_by,update_time,update_by) VALUES
	 ('1260935285157511170','4148ec82b6acd69f470bea75fe41c357','createBy','createBy','=','#{sys_user_code}','0','2020-05-14 22:09:34','jeecg','2020-05-14 22:13:52','admin'),
	 ('1260936345293012993','4148ec82b6acd69f470bea75fe41c357','年龄','age','>','20','1','2020-05-14 22:13:46','admin',NULL,NULL),
	 ('1260937192290762754','4148ec82b6acd69f470bea75fe41c357','sysOrgCode','sysOrgCode','RIGHT_LIKE','#{sys_org_code}','1','2020-05-14 22:17:08','admin',NULL,NULL),
	 ('32b62cb04d6c788d9d92e3ff5e66854e','8d4683aacaa997ab86b966b464360338','000','00','!=','00','1','2019-04-02 18:36:08','admin',NULL,NULL),
	 ('40283181614231d401614234fe670003','40283181614231d401614232cd1c0001','createBy','createBy','=','#{sys_user_code}','1','2018-01-29 21:57:04','admin',NULL,NULL),
	 ('4028318161424e730161424fca6f0004','4028318161424e730161424f61510002','createBy','createBy','=','#{sys_user_code}','1','2018-01-29 22:26:20','admin',NULL,NULL),
	 ('402880e6487e661a01487e732c020005','402889fb486e848101486e93a7c80014','SYS_ORG_CODE','SYS_ORG_CODE','LIKE','010201%','1','2014-09-16 20:32:30','admin',NULL,NULL),
	 ('402880e6487e661a01487e8153ee0007','402889fb486e848101486e93a7c80014','create_by','create_by','','#{SYS_USER_CODE}','1','2014-09-16 20:47:57','admin',NULL,NULL),
	 ('402880ec5ddec439015ddf9225060038','40288088481d019401481d2fcebf000d','复杂关系','','USE_SQL_RULES','name like ''%张%'' or age > 10','1',NULL,NULL,'2017-08-14 15:10:25','demo'),
	 ('402880ec5ddfdd26015ddfe3e0570011','4028ab775dca0d1b015dca3fccb60016','复杂sql配置','','USE_SQL_RULES','table_name like ''%test%'' or is_tree = ''Y''','1',NULL,NULL,'2017-08-14 16:38:55','demo');
INSERT INTO sys_permission_data_rule (id,permission_id,rule_name,rule_column,rule_conditions,rule_value,status,create_time,create_by,update_time,update_by) VALUES
	 ('402880f25b1e2ac7015b1e5fdebc0012','402880f25b1e2ac7015b1e5cdc340010','只能看自己数据','create_by','=','#{sys_user_code}','1','2017-03-30 16:40:51','admin',NULL,NULL),
	 ('402881875b19f141015b19f8125e0014','40288088481d019401481d2fcebf000d','可看下属业务数据','sys_org_code','LIKE','#{sys_org_code}','1',NULL,NULL,'2017-08-14 15:04:32','demo'),
	 ('402881e45394d66901539500a4450001','402881e54df73c73014df75ab670000f','sysCompanyCode','sysCompanyCode','=','#{SYS_COMPANY_CODE}','1','2016-03-21 01:09:21','admin',NULL,NULL),
	 ('402881e45394d6690153950177cb0003','402881e54df73c73014df75ab670000f','sysOrgCode','sysOrgCode','=','#{SYS_ORG_CODE}','1','2016-03-21 01:10:15','admin',NULL,NULL),
	 ('402881e56266f43101626727aff60067','402881e56266f43101626724eb730065','销售自己看自己的数据','createBy','=','#{sys_user_code}','1','2018-03-27 19:11:16','admin',NULL,NULL),
	 ('402881e56266f4310162672fb1a70082','402881e56266f43101626724eb730065','销售经理看所有下级数据','sysOrgCode','LIKE','#{sys_org_code}','1','2018-03-27 19:20:01','admin',NULL,NULL),
	 ('402881e56266f431016267387c9f0088','402881e56266f43101626724eb730065','只看金额大于1000的数据','money','>=','1000','1','2018-03-27 19:29:37','admin',NULL,NULL),
	 ('402881f3650de25101650dfb5a3a0010','402881e56266f4310162671d62050044','22','','USE_SQL_RULES','22','1','2018-08-06 14:45:01','admin',NULL,NULL),
	 ('402889fb486e848101486e913cd6000b','402889fb486e848101486e8e2e8b0007','userName','userName','=','admin','1','2014-09-13 18:31:25','admin',NULL,NULL),
	 ('402889fb486e848101486e98d20d0016','402889fb486e848101486e93a7c80014','title','title','=','12','1',NULL,NULL,'2014-09-13 22:18:22','scott');
INSERT INTO sys_permission_data_rule (id,permission_id,rule_name,rule_column,rule_conditions,rule_value,status,create_time,create_by,update_time,update_by) VALUES
	 ('402889fe47fcb29c0147fcb6b6220001','8a8ab0b246dc81120146dc8180fe002b','12','12','>','12','1','2014-08-22 15:55:38','8a8ab0b246dc81120146dc8181950052',NULL,NULL),
	 ('4028ab775dca0d1b015dca4183530018','4028ab775dca0d1b015dca3fccb60016','表名限制','isDbSynch','=','Y','1',NULL,NULL,'2017-08-14 16:43:45','demo'),
	 ('4028ef815595a881015595b0ccb60001','40288088481d019401481d2fcebf000d','限只能看自己','create_by','=','#{sys_user_code}','1',NULL,NULL,'2017-08-14 15:03:56','demo'),
	 ('4028ef81574ae99701574aed26530005','4028ef81574ae99701574aeb97bd0003','用户名','userName','!=','admin','1','2016-09-21 12:07:18','admin',NULL,NULL),
	 ('f852d85d47f224990147f2284c0c0005',NULL,'小于','test','<=','11','1','2014-08-20 14:43:52','8a8ab0b246dc81120146dc8181950052',NULL,NULL);

-- ----------------------------
-- Table structure for sys_permission_v2
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission_v2`;
CREATE TABLE `sys_permission_v2`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键id',
  `parent_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父id',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单标题',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路径',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件',
  `component_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件名字',
  `redirect` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '一级菜单跳转地址',
  `menu_type` int(11) NULL DEFAULT NULL COMMENT '菜单类型(0:一级菜单; 1:子菜单:2:按钮权限)',
  `perms` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单权限编码',
  `perms_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '权限策略1显示2禁用',
  `sort_no` double(8, 2) NULL DEFAULT NULL COMMENT '菜单排序',
  `always_show` tinyint(1) NULL DEFAULT NULL COMMENT '聚合子路由: 1是0否',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `is_route` tinyint(1) NULL DEFAULT 1 COMMENT '是否路由菜单: 0:不是  1:是（默认值1）',
  `is_leaf` tinyint(1) NULL DEFAULT NULL COMMENT '是否叶子节点:    1:是   0:不是',
  `keep_alive` tinyint(1) NULL DEFAULT NULL COMMENT '是否缓存该页面:    1:是   0:不是',
  `hidden` tinyint(1) NULL DEFAULT 0 COMMENT '是否隐藏路由: 0否,1是',
  `hide_tab` tinyint(1) NULL DEFAULT NULL COMMENT '是否隐藏tab: 0否,1是',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` int(1) NULL DEFAULT 0 COMMENT '删除状态 0正常 1已删除',
  `rule_flag` int(3) NULL DEFAULT 0 COMMENT '是否添加数据权限1是0否',
  `status` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '按钮权限状态(0无效1有效)',
  `internal_or_external` tinyint(1) NULL DEFAULT NULL COMMENT '外链菜单打开方式 0/内部打开 1/外部打开',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sp_parent_id`(`parent_id`) USING BTREE,
  INDEX `idx_sp_is_route`(`is_route`) USING BTREE,
  INDEX `idx_sp_is_leaf`(`is_leaf`) USING BTREE,
  INDEX `idx_sp_sort_no`(`sort_no`) USING BTREE,
  INDEX `idx_sp_del_flag`(`del_flag`) USING BTREE,
  INDEX `idx_sp_menu_type`(`menu_type`) USING BTREE,
  INDEX `idx_sp_hidden`(`hidden`) USING BTREE,
  INDEX `idx_sp_status`(`status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------------------------
-- Records of sys_permission_v2
-- ----------------------------------------------
INSERT INTO sys_permission_v2 (id,parent_id,name,url,component,component_name,redirect,menu_type,perms,perms_type,sort_no,always_show,icon,is_route,is_leaf,keep_alive,hidden,hide_tab,description,create_by,create_time,update_by,update_time,del_flag,rule_flag,status,internal_or_external) VALUES
	 ('00a2a0ae65cdca5e93209cdbde97cbe6','2e42e3835c2b44ec9f7bc26c146ee531','成功','/result/success','result/Success',NULL,NULL,1,NULL,NULL,1.0,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,'2018-12-25 20:34:38',NULL,NULL,0,0,NULL,NULL),
	 ('020b06793e4de2eee0007f603000c769','f0675b52d89100ee88472b6800754a08','ViserChartDemo','/report/ViserChartDemo','jeecg/report/ViserChartDemo',NULL,NULL,1,NULL,NULL,3.0,0,NULL,1,1,NULL,0,NULL,NULL,'admin','2019-04-03 19:08:53','admin','2019-04-03 19:08:53',0,0,NULL,NULL),
	 ('024f1fd1283dc632458976463d8984e1','700b7f95165c46cc7a78bf227aa8fed3','Tomcat信息','/monitor/TomcatInfo','modules/monitor/TomcatInfo',NULL,NULL,1,NULL,NULL,4.0,0,NULL,1,1,NULL,0,NULL,NULL,'admin','2019-04-02 09:44:29','admin','2019-05-07 15:19:10',0,0,NULL,NULL),
	 ('043780fa095ff1b2bec4dc406d76f023','2a470fc0c3954d9dbb61de6d80846549','表格合计','/jeecg/tableTotal','jeecg/TableTotal',NULL,NULL,1,NULL,'1',3.0,0,NULL,1,1,0,0,NULL,NULL,'admin','2019-08-14 10:28:46',NULL,NULL,0,0,'1',NULL),
	 ('05b3c82ddb2536a4a5ee1a4c46b5abef','540a2936940846cb98114ffb0d145cb8','用户列表','/list/user-list','examples/list/UserList',NULL,NULL,1,NULL,NULL,3.0,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,'2018-12-25 20:34:38',NULL,NULL,0,0,NULL,NULL),
	 ('0620e402857b8c5b605e1ad9f4b89350','2a470fc0c3954d9dbb61de6d80846549','异步树列表Demo','/jeecg/JeecgTreeTable','jeecg/JeecgTreeTable',NULL,NULL,1,NULL,'0',3.0,0,NULL,1,1,NULL,0,NULL,NULL,'admin','2019-05-13 17:30:30','admin','2019-05-13 17:32:17',0,0,'1',NULL),
	 ('078f9558cdeab239aecb2bda1a8ed0d1','fb07ca05a3e13674dbf6d3245956da2e','搜索列表（文章）','/list/search/article','examples/list/TableList',NULL,NULL,1,NULL,NULL,1.0,0,NULL,1,1,NULL,0,NULL,NULL,'admin','2019-02-12 14:00:34','admin','2019-02-12 14:17:54',0,0,NULL,NULL),
	 ('08e6b9dc3c04489c8e1ff2ce6f105aa4','','系统监控','/dashboard3','layouts/RouteView',NULL,NULL,0,NULL,NULL,6.0,0,'dashboard',1,0,NULL,0,NULL,NULL,NULL,'2018-12-25 20:34:38','admin','2019-03-31 22:19:58',0,0,NULL,NULL),
	 ('0ac2ad938963b6c6d1af25477d5b8b51','8d4683aacaa997ab86b966b464360338','代码生成按钮',NULL,NULL,NULL,NULL,2,'online:goGenerateCode','1',1.0,0,NULL,1,1,NULL,0,NULL,NULL,'admin','2019-06-11 14:20:09',NULL,NULL,0,0,'1',NULL),
	 ('109c78a583d4693ce2f16551b7786786','e41b69c57a941a3bbcce45032fe57605','Online报表配置','/online/cgreport','modules/online/cgreport/OnlCgreportHeadList',NULL,NULL,1,NULL,NULL,2.0,0,NULL,1,1,NULL,0,NULL,NULL,'admin','2019-03-08 10:51:07','admin','2019-03-30 19:04:28',0,0,NULL,NULL);
INSERT INTO sys_permission_v2 (id,parent_id,name,url,component,component_name,redirect,menu_type,perms,perms_type,sort_no,always_show,icon,is_route,is_leaf,keep_alive,hidden,hide_tab,description,create_by,create_time,update_by,update_time,del_flag,rule_flag,status,internal_or_external) VALUES
	 ('1166535831146504193','2a470fc0c3954d9dbb61de6d80846549','对象存储','/oss/file','modules/oss/OSSFileList',NULL,NULL,1,NULL,'1',1.0,0,'',1,0,0,0,NULL,NULL,'admin','2019-08-28 02:19:50','admin','2019-08-28 02:20:57',0,0,'1',NULL),
	 ('1170592628746878978','d7d6e2e4e2934f2c9385a623fd98c6f3','菜单管理','/isystem/newPermissionList','system/NewPermissionList',NULL,NULL,1,NULL,'1',1.3,0,NULL,1,0,0,0,0,NULL,'admin','2019-09-08 15:00:05','admin','2022-10-14 18:01:57',0,0,'1',0),
	 ('1174506953255182338','d7d6e2e4e2934f2c9385a623fd98c6f3','职务管理','/isystem/position','system/SysPositionList',NULL,NULL,1,NULL,'1',2.0,0,NULL,1,1,0,0,NULL,NULL,'admin','2019-09-19 10:14:13','admin','2019-09-19 10:15:22',0,0,'1',0),
	 ('1174590283938041857','d7d6e2e4e2934f2c9385a623fd98c6f3','通讯录','/isystem/addressList','system/AddressList',NULL,NULL,1,NULL,'1',3.0,0,NULL,1,1,0,0,NULL,NULL,'admin','2019-09-19 15:45:21',NULL,NULL,0,0,'1',0),
	 ('1192318987661234177','e41b69c57a941a3bbcce45032fe57605','系统编码规则','/isystem/fillRule','system/SysFillRuleList',NULL,NULL,1,NULL,'1',3.0,0,NULL,1,1,0,0,NULL,NULL,'admin','2019-11-07 13:52:53','admin','2020-07-10 16:55:03',0,0,'1',0),
	 ('1205097455226462210','','报表设计','/big/screen','layouts/RouteView',NULL,NULL,0,NULL,'1',2.1,0,'area-chart',1,0,0,0,0,NULL,'admin','2019-12-12 20:09:58','admin','2022-02-23 18:22:02',0,0,'1',0),
	 ('1205098241075453953','1205097455226462210','生产销售监控','{{ window._CONFIG[''domianURL''] }}/test/bigScreen/templat/index1','layouts/IframePageView',NULL,NULL,1,NULL,'1',1.0,0,NULL,1,1,0,0,NULL,NULL,'admin','2019-12-12 20:13:05','admin','2019-12-12 20:15:27',0,0,'1',1),
	 ('1205306106780364802','1205097455226462210','智慧物流监控','{{ window._CONFIG[''domianURL''] }}/test/bigScreen/templat/index2','layouts/IframePageView',NULL,NULL,1,NULL,'1',2.0,0,NULL,1,1,0,0,NULL,NULL,'admin','2019-12-13 09:59:04','admin','2019-12-25 09:28:03',0,0,'1',0),
	 ('1209731624921534465','08e6b9dc3c04489c8e1ff2ce6f105aa4','多数据源管理','/isystem/dataSource','system/SysDataSourceList',NULL,NULL,1,NULL,'1',6.0,0,NULL,1,0,0,0,0,NULL,'admin','2019-12-25 15:04:30','admin','2022-11-17 16:04:47',0,0,'1',0),
	 ('1224641973866467330','e41b69c57a941a3bbcce45032fe57605','系统校验规则','/isystem/checkRule','system/SysCheckRuleList',NULL,NULL,1,NULL,'1',5.0,0,NULL,1,1,0,0,NULL,NULL,'admin','2019-11-07 13:52:53','admin','2020-07-10 16:55:12',0,0,'1',0);
INSERT INTO sys_permission_v2 (id,parent_id,name,url,component,component_name,redirect,menu_type,perms,perms_type,sort_no,always_show,icon,is_route,is_leaf,keep_alive,hidden,hide_tab,description,create_by,create_time,update_by,update_time,del_flag,rule_flag,status,internal_or_external) VALUES
	 ('1229674163694841857','e41b69c57a941a3bbcce45032fe57605','AUTO在线表单ERP','/online/cgformErpList/:code','modules/online/cgform/auto/erp/OnlCgformErpList',NULL,NULL,1,NULL,'1',5.0,0,NULL,1,1,0,1,NULL,NULL,'admin','2020-02-18 15:49:00','admin','2020-02-18 15:52:25',0,0,'1',0),
	 ('1232123780958064642','f0675b52d89100ee88472b6800754a08','Online报表示例','/online/cgreport/6c7f59741c814347905a938f06ee003c','modules/online/cgreport/auto/OnlCgreportAutoList',NULL,NULL,1,NULL,'1',4.0,0,NULL,0,1,0,0,NULL,NULL,'admin','2020-02-25 10:02:56','admin','2020-05-02 15:37:30',0,0,'1',0),
	 ('1235823781053313025','e41b69c57a941a3bbcce45032fe57605','AUTO在线内嵌子表','/online/cgformInnerTableList/:code','modules/online/cgform/auto/innerTable/OnlCgformInnerTableList',NULL,NULL,1,NULL,'1',999.0,0,NULL,1,1,0,1,NULL,NULL,'admin','2020-03-06 15:05:24','admin','2020-03-06 15:07:42',0,0,'1',0),
	 ('1260922988733255681','2a470fc0c3954d9dbb61de6d80846549','online订单管理','/online/cgformInnerTableList/56efb74326e74064b60933f6f8af30ea','111111',NULL,NULL,1,NULL,'1',11.0,0,NULL,0,1,0,0,NULL,NULL,'admin','2020-05-14 21:20:42','admin','2020-09-09 15:31:48',0,0,'1',0),
	 ('1260923256208216065','2a470fc0c3954d9dbb61de6d80846549','online用户报表','/online/cgreport/1260179852088135681','333333',NULL,NULL,1,NULL,'1',11.0,0,NULL,0,1,0,0,NULL,NULL,'admin','2020-05-14 21:21:46','admin','2020-09-09 15:31:54',0,0,'1',0),
	 ('1260928341675982849','3f915b2769fc80648e92d04e84ca059d','添加用户',NULL,NULL,NULL,NULL,2,'system:user:add','1',1.0,0,NULL,1,1,0,0,0,NULL,'admin','2020-05-14 21:41:58','admin','2022-11-17 16:07:40',0,0,'1',0),
	 ('1260929666434318338','3f915b2769fc80648e92d04e84ca059d','用户编辑',NULL,NULL,NULL,NULL,2,'system:user:edit','1',1.0,0,NULL,1,1,0,0,0,NULL,'admin','2020-05-14 21:47:14','admin','2022-11-17 16:07:59',0,0,'1',0),
	 ('1260931366557696001','3f915b2769fc80648e92d04e84ca059d','表单性别可见','',NULL,NULL,NULL,2,'user:sex','1',1.0,0,NULL,1,1,0,0,NULL,NULL,'admin','2020-05-14 21:53:59','admin','2020-05-14 21:57:00',0,0,'1',0),
	 ('1260933542969458689','3f915b2769fc80648e92d04e84ca059d','禁用生日字段',NULL,NULL,NULL,NULL,2,'user:form:birthday','2',1.0,0,NULL,1,1,0,0,NULL,NULL,'admin','2020-05-14 22:02:38',NULL,NULL,0,0,'1',0),
	 ('1265162119913824258','08e6b9dc3c04489c8e1ff2ce6f105aa4','路由网关','/isystem/gatewayroute','system/SysGatewayRouteList',NULL,NULL,1,NULL,'1',0.0,0,NULL,1,0,0,0,NULL,NULL,NULL,'2020-05-26 14:05:30','admin','2020-09-09 14:47:52',0,0,'1',0);
INSERT INTO sys_permission_v2 (id,parent_id,name,url,component,component_name,redirect,menu_type,perms,perms_type,sort_no,always_show,icon,is_route,is_leaf,keep_alive,hidden,hide_tab,description,create_by,create_time,update_by,update_time,del_flag,rule_flag,status,internal_or_external) VALUES
	 ('1280350452934307841','d7d6e2e4e2934f2c9385a623fd98c6f3','租户管理','/isys/tenant','system/TenantList',NULL,NULL,1,NULL,'1',1.31,0,NULL,1,0,0,0,NULL,NULL,'admin','2020-07-07 11:58:30','admin','2021-08-16 16:24:03',0,0,'1',0),
	 ('1280464606292099074','2a470fc0c3954d9dbb61de6d80846549','图片裁剪','/jeecg/ImagCropper','jeecg/ImagCropper',NULL,NULL,1,NULL,'1',9.0,0,NULL,1,1,0,0,NULL,NULL,'admin','2020-07-07 19:32:06',NULL,NULL,0,0,'1',0),
	 ('1287715272999944193','2a470fc0c3954d9dbb61de6d80846549','JVXETable示例','/jeecg/j-vxe-table-demo','layouts/RouteView',NULL,NULL,1,NULL,'1',0.1,0,'',1,0,0,0,NULL,NULL,'admin','2020-07-27 19:43:40','admin','2020-09-09 14:52:06',0,0,'1',0),
	 ('1287715783966834689','1287715272999944193','普通示例','/jeecg/j-vxe-table-demo/normal','jeecg/JVXETableDemo',NULL,NULL,1,NULL,'1',1.0,0,NULL,1,1,0,0,NULL,NULL,'admin','2020-07-27 19:45:42',NULL,NULL,0,0,'1',0),
	 ('1287716451494510593','1287715272999944193','布局模板','/jeecg/j-vxe-table-demo/layout','jeecg/JVxeDemo/layout-demo/Index',NULL,NULL,1,NULL,'1',2.0,0,NULL,1,1,0,0,NULL,NULL,'admin','2020-07-27 19:48:21',NULL,NULL,0,0,'1',0),
	 ('1287718919049691137','1287715272999944193','即时保存','/jeecg/j-vxe-table-demo/jsbc','jeecg/JVxeDemo/demo/JSBCDemo',NULL,NULL,1,NULL,'1',3.0,0,NULL,1,1,0,0,NULL,NULL,'admin','2020-07-27 19:57:36','admin','2020-07-27 20:03:37',0,0,'1',0),
	 ('1287718938179911682','1287715272999944193','弹出子表','/jeecg/j-vxe-table-demo/tczb','jeecg/JVxeDemo/demo/PopupSubTable',NULL,NULL,1,NULL,'1',4.0,0,NULL,1,1,0,0,NULL,NULL,'admin','2020-07-27 19:57:41','admin','2020-07-27 20:03:47',0,0,'1',0),
	 ('1287718956957810689','1287715272999944193','无痕刷新','/jeecg/j-vxe-table-demo/whsx','jeecg/JVxeDemo/demo/SocketReload','SocketReload',NULL,1,NULL,'1',5.0,0,NULL,1,1,1,0,0,NULL,'admin','2020-07-27 19:57:44','admin','2022-10-14 18:43:57',0,0,'1',0),
	 ('1304032910990495745','e41b69c57a941a3bbcce45032fe57605','AUTO在线表单TAB','/online/cgformTabList/:code','modules/online/cgform/auto/tab/OnlCgformTabList',NULL,NULL,1,NULL,'1',8.0,0,NULL,1,1,0,1,NULL,NULL,'admin','2020-09-10 20:24:08','admin','2020-09-10 20:36:37',0,0,'1',0),
	 ('13212d3416eb690c2e1d5033166ff47a','2e42e3835c2b44ec9f7bc26c146ee531','失败','/result/fail','result/Error',NULL,NULL,1,NULL,NULL,2.0,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,'2018-12-25 20:34:38',NULL,NULL,0,0,NULL,NULL);
INSERT INTO sys_permission_v2 (id,parent_id,name,url,component,component_name,redirect,menu_type,perms,perms_type,sort_no,always_show,icon,is_route,is_leaf,keep_alive,hidden,hide_tab,description,create_by,create_time,update_by,update_time,del_flag,rule_flag,status,internal_or_external) VALUES
	 ('1335960713267093506','1205097455226462210','积木报表设计','{{ window._CONFIG[''domianURL''] }}/jmreport/list?token=${token}','layouts/IframePageView',NULL,NULL,1,NULL,'1',0.0,0,NULL,1,1,0,0,NULL,NULL,'admin','2020-12-07 22:53:50','admin','2020-12-08 09:28:06',0,0,'1',1),
	 ('1352200630711652354','f0675b52d89100ee88472b6800754a08','Redis监控','{{ window._CONFIG[''domianURL''] }}/jmreport/view/1352160857479581696?token=${token}','layouts/IframePageView',NULL,NULL,1,NULL,'1',5.0,0,'',1,1,0,0,NULL,NULL,'admin','2021-01-21 18:25:28','admin','2021-04-07 14:00:57',0,0,'1',1),
	 ('1365187528377102337','2a470fc0c3954d9dbb61de6d80846549','一对多JVxeTable','/jeecg/JeecgOrderMainListForJVxeTable','jeecg/JeecgOrderMainListForJVxeTable',NULL,NULL,1,NULL,'1',2.0,0,NULL,1,1,0,0,NULL,NULL,'admin','2021-02-26 14:30:45','admin','2021-02-26 14:32:05',0,0,'1',0),
	 ('1367a93f2c410b169faa7abcbad2f77c','6e73eb3c26099c191bf03852ee1310a1','基本设置','/account/settings/BaseSetting','account/settings/BaseSetting','account-settings-base',NULL,1,'BaseSettings',NULL,NULL,0,NULL,1,1,NULL,1,NULL,NULL,NULL,'2018-12-26 18:58:35','admin','2019-03-20 12:57:31',0,0,NULL,NULL),
	 ('1387612436586065922','2a470fc0c3954d9dbb61de6d80846549','第三方APP消息测试','/jeecg/ThirdAppMessageTest','jeecg/ThirdAppMessageTest',NULL,NULL,1,NULL,'1',3.0,0,NULL,1,1,0,0,NULL,NULL,'admin','2021-04-29 11:39:20','admin','2021-04-29 11:39:27',0,0,'1',0),
	 ('1400726868091015170','4148ec82b6acd69f470bea75fe41c357','demo添加功能',NULL,NULL,NULL,NULL,2,'demo:add','1',NULL,0,NULL,1,1,0,0,NULL,NULL,'admin','2021-06-04 16:11:24',NULL,NULL,0,0,'1',0),
	 ('1404684556047024130','08e6b9dc3c04489c8e1ff2ce6f105aa4','在线用户','/isystem/online','system/SysUserOnlineList',NULL,NULL,1,NULL,'1',11.0,0,NULL,1,1,0,0,0,NULL,'admin','2021-06-15 14:17:51','admin','2022-10-14 17:58:44',0,0,'1',0),
	 ('1494641317580423169','2a470fc0c3954d9dbb61de6d80846549','表格合计News','/jeecg/tableOrderTotal','jeecg/TableOrderTotal',NULL,NULL,1,NULL,'1',3.0,0,NULL,1,1,0,0,0,NULL,'admin','2022-02-18 19:53:54','admin','2022-02-18 19:55:04',0,0,'1',0),
	 ('1588513553652436993','3f915b2769fc80648e92d04e84ca059d','修改密码',NULL,NULL,NULL,NULL,2,'system:user:changepwd','1',NULL,0,NULL,0,1,0,0,0,NULL,'admin','2022-11-04 20:48:39','admin','2022-11-04 20:49:06',0,0,'1',0),
	 ('1592112984361365505','1170592628746878978','添加菜单',NULL,NULL,NULL,NULL,2,'system:permission:add','1',NULL,0,NULL,0,1,0,0,0,NULL,'admin','2022-11-14 19:11:30',NULL,NULL,0,0,'1',0);
INSERT INTO sys_permission_v2 (id,parent_id,name,url,component,component_name,redirect,menu_type,perms,perms_type,sort_no,always_show,icon,is_route,is_leaf,keep_alive,hidden,hide_tab,description,create_by,create_time,update_by,update_time,del_flag,rule_flag,status,internal_or_external) VALUES
	 ('1592113148350263298','190c2b43bec6a5f7a4194a85db67d96a','保存角色授权',NULL,NULL,NULL,NULL,2,'system:permission:saveRole','1',NULL,0,NULL,0,1,0,0,0,NULL,'admin','2022-11-14 19:12:09',NULL,NULL,0,0,'1',0),
	 ('1592114574275211265','3f915b2769fc80648e92d04e84ca059d','删除用户',NULL,NULL,NULL,NULL,2,'system:user:delete','1',NULL,0,NULL,0,1,0,0,0,NULL,'admin','2022-11-14 19:17:49',NULL,NULL,0,0,'1',0),
	 ('1592114652566089729','3f915b2769fc80648e92d04e84ca059d','批量删除用户',NULL,NULL,NULL,NULL,2,'system:user:deleteBatch','1',NULL,0,NULL,0,1,0,0,0,NULL,'admin','2022-11-14 19:18:08',NULL,NULL,0,0,'1',0),
	 ('1592114721138765826','3f915b2769fc80648e92d04e84ca059d','冻结/解冻用户',NULL,NULL,NULL,NULL,2,'system:user:frozenBatch','1',NULL,0,NULL,0,1,0,0,0,NULL,'admin','2022-11-14 19:18:24',NULL,NULL,0,0,'1',0),
	 ('1592114772665790465','3f915b2769fc80648e92d04e84ca059d','首页用户重置密码',NULL,NULL,NULL,NULL,2,'system:user:updatepwd','1',NULL,0,NULL,0,1,0,0,0,NULL,'admin','2022-11-14 19:18:37',NULL,NULL,0,0,'1',0),
	 ('1592114823467200514','3f915b2769fc80648e92d04e84ca059d','给指定角色添加用户',NULL,NULL,NULL,NULL,2,'system:user:addUserRole','1',NULL,0,NULL,0,1,0,0,0,NULL,'admin','2022-11-14 19:18:49',NULL,NULL,0,0,'1',0),
	 ('1592114893302362114','3f915b2769fc80648e92d04e84ca059d','删除指定角色的用户关系',NULL,NULL,NULL,NULL,2,'system:user:deleteRole','1',NULL,0,NULL,0,1,0,0,0,NULL,'admin','2022-11-14 19:19:05',NULL,NULL,0,0,'1',0),
	 ('1592114955650691074','3f915b2769fc80648e92d04e84ca059d','批量删除指定角色的用户关系',NULL,NULL,NULL,NULL,2,'system:user:deleteRoleBatch','1',NULL,0,NULL,0,1,0,0,0,NULL,'admin','2022-11-14 19:19:20',NULL,NULL,0,0,'1',0),
	 ('1592115070432014338','3f915b2769fc80648e92d04e84ca059d','给指定部门添加对应的用户',NULL,NULL,NULL,NULL,2,'system:user:editDepartWithUser','1',NULL,0,NULL,0,1,0,0,0,NULL,'admin','2022-11-14 19:19:48',NULL,NULL,0,0,'1',0),
	 ('1592115115361398786','3f915b2769fc80648e92d04e84ca059d','删除指定机构的用户关系',NULL,NULL,NULL,NULL,2,'system:user:deleteUserInDepart','1',NULL,0,NULL,0,1,0,0,0,NULL,'admin','2022-11-14 19:19:58',NULL,NULL,0,0,'1',0);
INSERT INTO sys_permission_v2 (id,parent_id,name,url,component,component_name,redirect,menu_type,perms,perms_type,sort_no,always_show,icon,is_route,is_leaf,keep_alive,hidden,hide_tab,description,create_by,create_time,update_by,update_time,del_flag,rule_flag,status,internal_or_external) VALUES
	 ('1592115162379546625','3f915b2769fc80648e92d04e84ca059d','批量删除指定机构的用户关系',NULL,NULL,NULL,NULL,2,'system:user:deleteUserInDepartBatch','1',NULL,0,NULL,0,1,0,0,0,NULL,'admin','2022-11-14 19:20:09',NULL,NULL,0,0,'1',0),
	 ('1592115213910765570','3f915b2769fc80648e92d04e84ca059d','彻底删除用户',NULL,NULL,NULL,NULL,2,'system:user:deleteRecycleBin','1',NULL,0,NULL,0,1,0,0,0,NULL,'admin','2022-11-14 19:20:22',NULL,NULL,0,0,'1',0),
	 ('1592115610431877122','1209731624921534465','多数据源分页列表',NULL,NULL,NULL,NULL,2,'system:datasource:list','1',NULL,0,NULL,0,1,0,0,0,NULL,'admin','2022-11-14 19:21:56',NULL,NULL,0,0,'1',0),
	 ('1592115712466710529','45c966826eeff4c99b8f8ebfe74511fc','部门添加',NULL,NULL,NULL,NULL,2,'system:depart:add','1',NULL,0,NULL,0,1,0,0,0,NULL,'admin','2022-11-14 19:22:21','admin','2022-11-14 19:30:49',0,0,'1',0),
	 ('1592115914493751297','1170592628746878978','编辑菜单权限数据',NULL,NULL,NULL,NULL,2,'system:permission:editRule','1',NULL,0,NULL,0,1,0,0,0,NULL,'admin','2022-11-14 19:23:09','admin','2022-11-14 19:39:25',0,0,'1',0),
	 ('1592116663936184322','1170592628746878978','编辑菜单',NULL,NULL,NULL,NULL,2,'system:permission:edit','1',NULL,0,NULL,0,1,0,0,0,NULL,'admin','2022-11-14 19:26:07',NULL,NULL,0,0,'1',0),
	 ('1592117222764277761','45c966826eeff4c99b8f8ebfe74511fc','部门编辑',NULL,NULL,NULL,NULL,2,'system:depart:edit','1',NULL,0,NULL,0,1,0,0,0,NULL,'admin','2022-11-14 19:28:21','admin','2022-11-14 19:30:55',0,0,'1',0),
	 ('1592117276539449345','45c966826eeff4c99b8f8ebfe74511fc','部门删除',NULL,NULL,NULL,NULL,2,'system:depart:delete','1',NULL,0,NULL,0,1,0,0,0,NULL,'admin','2022-11-14 19:28:33','admin','2022-11-14 19:31:06',0,0,'1',0),
	 ('1592117377299214337','45c966826eeff4c99b8f8ebfe74511fc','部门批量删除',NULL,NULL,NULL,NULL,2,'system:depart:deleteBatch','1',NULL,0,NULL,0,1,0,0,0,NULL,'admin','2022-11-14 19:28:58','admin','2022-11-14 19:31:12',0,0,'1',0),
	 ('1592117422006300673','45c966826eeff4c99b8f8ebfe74511fc','部门导入',NULL,NULL,NULL,NULL,2,'system:depart:importExcel','1',NULL,0,NULL,0,1,0,0,0,NULL,'admin','2022-11-14 19:29:08',NULL,NULL,0,0,'1',0);
INSERT INTO sys_permission_v2 (id,parent_id,name,url,component,component_name,redirect,menu_type,perms,perms_type,sort_no,always_show,icon,is_route,is_leaf,keep_alive,hidden,hide_tab,description,create_by,create_time,update_by,update_time,del_flag,rule_flag,status,internal_or_external) VALUES
	 ('1592117625664925697','5c2f42277948043026b7a14692456828','部门角色添加',NULL,NULL,NULL,NULL,2,'system:depart:role:add','1',NULL,0,NULL,0,1,0,0,0,NULL,'admin','2022-11-14 19:29:57',NULL,NULL,0,0,'1',0),
	 ('1592117748209905665','5c2f42277948043026b7a14692456828','部门角色编辑',NULL,NULL,NULL,NULL,2,'system:depart:role:edit','1',NULL,0,NULL,0,1,0,0,0,NULL,'admin','2022-11-14 19:30:26',NULL,NULL,0,0,'1',0),
	 ('1592117804359053314','5c2f42277948043026b7a14692456828','部门角色删除',NULL,NULL,NULL,NULL,2,'system:depart:role:delete','1',NULL,0,NULL,0,1,0,0,0,NULL,'admin','2022-11-14 19:30:39',NULL,NULL,0,0,'1',0),
	 ('1592117990305132545','5c2f42277948043026b7a14692456828','部门角色批量删除',NULL,NULL,NULL,NULL,2,'system:depart:role:deleteBatch','1',NULL,0,NULL,0,1,0,0,0,NULL,'admin','2022-11-14 19:31:24',NULL,NULL,0,0,'1',0),
	 ('1592118053634928641','5c2f42277948043026b7a14692456828','部门角色用户授权',NULL,NULL,NULL,NULL,2,'system:depart:role:userAdd','1',NULL,0,NULL,0,1,0,0,0,NULL,'admin','2022-11-14 19:31:39',NULL,NULL,0,0,'1',0),
	 ('1592118192218927105','f1cb187abf927c88b89470d08615f5ac','字典新增',NULL,NULL,NULL,NULL,2,'system:dict:add','1',NULL,0,NULL,0,1,0,0,0,NULL,'admin','2022-11-14 19:32:12',NULL,NULL,0,0,'1',0),
	 ('1592118254844080130','f1cb187abf927c88b89470d08615f5ac','字典编辑',NULL,NULL,NULL,NULL,2,'system:dict:edit','1',NULL,0,NULL,0,1,0,0,0,NULL,'admin','2022-11-14 19:32:27',NULL,NULL,0,0,'1',0),
	 ('1592118306983473154','f1cb187abf927c88b89470d08615f5ac','字典删除',NULL,NULL,NULL,NULL,2,'system:dict:delete','1',NULL,0,NULL,0,1,0,0,0,NULL,'admin','2022-11-14 19:32:39',NULL,NULL,0,0,'1',0),
	 ('1592118356778250241','f1cb187abf927c88b89470d08615f5ac','字典批量删除',NULL,NULL,NULL,NULL,2,'system:dict:deleteBatch','1',NULL,0,NULL,0,1,0,0,0,NULL,'admin','2022-11-14 19:32:51',NULL,NULL,0,0,'1',0),
	 ('1592118414990995457','f1cb187abf927c88b89470d08615f5ac','字典导入',NULL,NULL,NULL,NULL,2,'system:dict:importExcel','1',NULL,0,NULL,0,1,0,0,0,NULL,'admin','2022-11-14 19:33:05',NULL,NULL,0,0,'1',0);
INSERT INTO sys_permission_v2 (id,parent_id,name,url,component,component_name,redirect,menu_type,perms,perms_type,sort_no,always_show,icon,is_route,is_leaf,keep_alive,hidden,hide_tab,description,create_by,create_time,update_by,update_time,del_flag,rule_flag,status,internal_or_external) VALUES
	 ('1592118497606201346','1265162119913824258','路由网关删除',NULL,NULL,NULL,NULL,2,'system:getway:delete','1',NULL,0,NULL,0,1,0,0,0,NULL,'admin','2022-11-14 19:33:25',NULL,NULL,0,0,'1',0),
	 ('1592118604640645122','1170592628746878978','删除菜单',NULL,NULL,NULL,NULL,2,'system:permission:delete','1',NULL,0,NULL,0,1,0,0,0,NULL,'admin','2022-11-14 19:33:50',NULL,NULL,0,0,'1',0),
	 ('1592118648315932674','1170592628746878978','批量删除菜单',NULL,NULL,NULL,NULL,2,'system:permission:deleteBatch','1',NULL,0,NULL,0,1,0,0,0,NULL,'admin','2022-11-14 19:34:01',NULL,NULL,0,0,'1',0),
	 ('1592119001883176961','1170592628746878978','添加菜单权限数据',NULL,NULL,NULL,NULL,2,'system:permission:addRule','1',NULL,0,NULL,0,1,0,0,0,NULL,'admin','2022-11-14 19:35:25',NULL,NULL,0,0,'1',0),
	 ('1592120052866707457','1170592628746878978','删除菜单权限数据',NULL,NULL,NULL,NULL,2,'system:permission:deleteRule','1',NULL,0,NULL,0,1,0,0,0,NULL,'admin','2022-11-14 19:39:35',NULL,NULL,0,0,'1',0),
	 ('1592120222727630849','45c966826eeff4c99b8f8ebfe74511fc','保存部门授权',NULL,NULL,NULL,NULL,2,'system:permission:saveDepart','1',NULL,0,NULL,0,1,0,0,0,NULL,'admin','2022-11-14 19:40:16',NULL,NULL,0,0,'1',0),
	 ('1592120323667750914','190c2b43bec6a5f7a4194a85db67d96a','角色添加',NULL,NULL,NULL,NULL,2,'system:role:add','1',NULL,0,NULL,0,1,0,0,0,NULL,'admin','2022-11-14 19:40:40',NULL,NULL,0,0,'1',0),
	 ('1592120372296511490','190c2b43bec6a5f7a4194a85db67d96a','角色编辑',NULL,NULL,NULL,NULL,2,'system:role:edit','1',NULL,0,NULL,0,1,0,0,0,NULL,'admin','2022-11-14 19:40:52',NULL,NULL,0,0,'1',0),
	 ('1592120427007012865','190c2b43bec6a5f7a4194a85db67d96a','角色删除',NULL,NULL,NULL,NULL,2,'system:role:delete','1',NULL,0,NULL,0,1,0,0,0,NULL,'admin','2022-11-14 19:41:05',NULL,NULL,0,0,'1',0),
	 ('1592120484120850434','190c2b43bec6a5f7a4194a85db67d96a','角色批量删除',NULL,NULL,NULL,NULL,2,'system:role:deleteBatch','1',NULL,0,NULL,0,1,0,0,0,NULL,'admin','2022-11-14 19:41:18',NULL,NULL,0,0,'1',0);
INSERT INTO sys_permission_v2 (id,parent_id,name,url,component,component_name,redirect,menu_type,perms,perms_type,sort_no,always_show,icon,is_route,is_leaf,keep_alive,hidden,hide_tab,description,create_by,create_time,update_by,update_time,del_flag,rule_flag,status,internal_or_external) VALUES
	 ('1592120594695286785','190c2b43bec6a5f7a4194a85db67d96a','角色首页配置添加',NULL,NULL,NULL,NULL,2,'system:roleindex:add','1',NULL,0,NULL,0,1,0,0,0,NULL,'admin','2022-11-14 19:41:45',NULL,NULL,0,0,'1',0),
	 ('1592120649007329281','190c2b43bec6a5f7a4194a85db67d96a','角色首页配置编辑',NULL,NULL,NULL,NULL,2,'system:roleindex:edit','1',NULL,0,NULL,0,1,0,0,0,NULL,'admin','2022-11-14 19:41:58',NULL,NULL,0,0,'1',0),
	 ('1593154566915579905','3f915b2769fc80648e92d04e84ca059d','导入用户',NULL,NULL,NULL,NULL,2,'system:user:import','1',NULL,0,NULL,1,1,0,0,0,NULL,'admin','2022-11-17 16:10:23',NULL,NULL,0,0,'1',0),
	 ('1593160905216663554','f1cb187abf927c88b89470d08615f5ac','字典子项新增',NULL,NULL,NULL,NULL,2,'system:dict:item:add','1',NULL,0,NULL,0,1,0,0,0,NULL,'admin','2022-11-17 16:35:34',NULL,NULL,0,0,'1',0),
	 ('1593160959633563650','f1cb187abf927c88b89470d08615f5ac','字典子项编辑',NULL,NULL,NULL,NULL,2,'system:dict:item:edit','1',NULL,0,NULL,0,1,0,0,0,NULL,'admin','2022-11-17 16:35:47',NULL,NULL,0,0,'1',0),
	 ('1593161025790320641','f1cb187abf927c88b89470d08615f5ac','字典子项删除',NULL,NULL,NULL,NULL,2,'system:dict:item:delete','1',NULL,0,NULL,0,1,0,0,0,NULL,'admin','2022-11-17 16:36:03',NULL,NULL,0,0,'1',0),
	 ('1593161089787011074','f1cb187abf927c88b89470d08615f5ac','字典子项批量删除',NULL,NULL,NULL,NULL,2,'system:dict:item:deleteBatch','1',NULL,0,NULL,0,1,0,0,0,NULL,'admin','2022-11-17 16:36:18',NULL,NULL,0,0,'1',0),
	 ('1593161421350936578','b1cb0a3fedf7ed0e4653cb5a229837ee','添加定时任务',NULL,NULL,NULL,NULL,2,'system:quartzJob:add','1',NULL,0,NULL,0,1,0,0,0,NULL,'admin','2022-11-17 16:37:37',NULL,NULL,0,0,'1',0),
	 ('1593161483627962370','b1cb0a3fedf7ed0e4653cb5a229837ee','更新定时任务',NULL,NULL,NULL,NULL,2,'system:quartzJob:edit','1',NULL,0,NULL,0,1,0,0,0,NULL,'admin','2022-11-17 16:37:52',NULL,NULL,0,0,'1',0),
	 ('1593161551202394114','b1cb0a3fedf7ed0e4653cb5a229837ee','删除定时任务',NULL,NULL,NULL,NULL,2,'system:quartzJob:delete','1',NULL,0,NULL,0,1,0,0,0,NULL,'admin','2022-11-17 16:38:08',NULL,NULL,0,0,'1',0);
INSERT INTO sys_permission_v2 (id,parent_id,name,url,component,component_name,redirect,menu_type,perms,perms_type,sort_no,always_show,icon,is_route,is_leaf,keep_alive,hidden,hide_tab,description,create_by,create_time,update_by,update_time,del_flag,rule_flag,status,internal_or_external) VALUES
	 ('1593161608362369026','b1cb0a3fedf7ed0e4653cb5a229837ee','批量删除定时任务',NULL,NULL,NULL,NULL,2,'system:quartzJob:deleteBatch','1',NULL,0,NULL,0,1,0,0,0,NULL,'admin','2022-11-17 16:38:22',NULL,NULL,0,0,'1',0),
	 ('1593161657385394177','b1cb0a3fedf7ed0e4653cb5a229837ee','停止定时任务',NULL,NULL,NULL,NULL,2,'system:quartzJob:pause','1',NULL,0,NULL,0,1,0,0,0,NULL,'admin','2022-11-17 16:38:33',NULL,NULL,0,0,'1',0),
	 ('1593161697348722689','b1cb0a3fedf7ed0e4653cb5a229837ee','启动定时任务',NULL,NULL,NULL,NULL,2,'system:quartzJob:resume','1',NULL,0,NULL,0,1,0,0,0,NULL,'admin','2022-11-17 16:38:43',NULL,NULL,0,0,'1',0),
	 ('1593161743607701505','b1cb0a3fedf7ed0e4653cb5a229837ee','立即执行定时任务',NULL,NULL,NULL,NULL,2,'system:quartzJob:execute','1',NULL,0,NULL,0,1,0,0,0,NULL,'admin','2022-11-17 16:38:54',NULL,NULL,0,0,'1',0),
	 ('1593173018886709250','1166535831146504193','文件oos上传',NULL,NULL,NULL,NULL,2,'system:ossFile:upload','1',NULL,0,NULL,0,1,0,0,0,NULL,'admin','2022-11-17 17:23:42',NULL,NULL,0,0,'1',0),
	 ('159d2115213910765570','3f915b2769fc80648e92d04e84ca059d','通过ID查询用户拥有的角色',NULL,NULL,NULL,NULL,2,'system:user:queryUserRole','1',NULL,0,NULL,0,1,0,0,0,NULL,'admin','2022-11-14 19:20:22',NULL,NULL,0,0,'1',0),
	 ('15s92115213910765570','3f915b2769fc80648e92d04e84ca059d','通过ID查询用户信息接口',NULL,NULL,NULL,NULL,2,'system:user:queryById','1',NULL,0,NULL,0,1,0,0,0,NULL,'admin','2022-11-14 19:20:22',NULL,NULL,0,0,'1',0),
	 ('1620261087828418562','1280350452934307841','获取租户删除的列表',NULL,NULL,NULL,NULL,2,'system:tenant:recycleBinPageList','1',NULL,0,NULL,0,1,0,0,0,NULL,'admin','2023-01-31 11:22:01',NULL,NULL,0,0,'1',0),
	 ('1620305415648989186','1280350452934307841','彻底删除租户',NULL,NULL,NULL,NULL,2,'system:tenant:deleteTenantLogic','1',NULL,0,NULL,0,1,0,0,0,NULL,'admin','2023-01-31 14:18:10','admin','2023-01-31 14:19:51',0,0,'1',0),
	 ('1620327825894981634','1280350452934307841','租户还原',NULL,NULL,NULL,NULL,2,'system:tenant:revertTenantLogic','1',NULL,0,NULL,0,1,0,0,0,NULL,'admin','2023-01-31 15:47:13',NULL,NULL,0,0,'1',0);
INSERT INTO sys_permission_v2 (id,parent_id,name,url,component,component_name,redirect,menu_type,perms,perms_type,sort_no,always_show,icon,is_route,is_leaf,keep_alive,hidden,hide_tab,description,create_by,create_time,update_by,update_time,del_flag,rule_flag,status,internal_or_external) VALUES
	 ('190c2b43bec6a5f7a4194a85db67d96a','d7d6e2e4e2934f2c9385a623fd98c6f3','角色管理','/isystem/roleUserList','system/RoleUserList',NULL,NULL,1,NULL,NULL,1.2,0,NULL,1,0,0,0,NULL,NULL,'admin','2019-04-17 15:13:56','admin','2019-12-25 09:36:31',0,0,NULL,0),
	 ('1a0811914300741f4e11838ff37a1d3a','3f915b2769fc80648e92d04e84ca059d','手机号禁用',NULL,NULL,NULL,NULL,2,'user:form:phone','2',1.0,0,NULL,0,1,NULL,0,NULL,NULL,'admin','2019-05-11 17:19:30','admin','2019-05-11 18:00:22',0,0,'1',NULL),
	 ('200006f0edf145a2b50eacca07585451','fb07ca05a3e13674dbf6d3245956da2e','搜索列表（应用）','/list/search/application','examples/list/TableList',NULL,NULL,1,NULL,NULL,1.0,0,NULL,1,1,NULL,0,NULL,NULL,'admin','2019-02-12 14:02:51','admin','2019-02-12 14:14:01',0,0,NULL,NULL),
	 ('22d6a3d39a59dd7ea9a30acfa6bfb0a5','e41b69c57a941a3bbcce45032fe57605','AUTO动态表单','/online/df/:table/:id','modules/online/cgform/auto/OnlineDynamicForm',NULL,NULL,1,NULL,NULL,9.0,0,NULL,0,1,NULL,1,NULL,NULL,'admin','2019-04-22 15:15:43','admin','2019-04-30 18:18:26',0,0,NULL,NULL),
	 ('265de841c58907954b8877fb85212622','2a470fc0c3954d9dbb61de6d80846549','图片拖拽排序','/jeecg/imgDragSort','jeecg/ImgDragSort',NULL,NULL,1,NULL,NULL,4.0,0,NULL,1,1,NULL,0,NULL,NULL,'admin','2019-04-25 10:43:08','admin','2019-04-25 10:46:26',0,0,NULL,NULL),
	 ('277bfabef7d76e89b33062b16a9a5020','e3c13679c73a4f829bcff2aba8fd68b1','基础表单','/form/base-form','examples/form/BasicForm',NULL,NULL,1,NULL,NULL,1.0,0,NULL,1,0,NULL,0,NULL,NULL,NULL,'2018-12-25 20:34:38','admin','2019-02-26 17:02:08',0,0,NULL,NULL),
	 ('2a470fc0c3954d9dbb61de6d80846549','','常见案例','/jeecg','layouts/RouteView',NULL,NULL,0,NULL,NULL,7.0,0,'qrcode',1,0,NULL,0,NULL,NULL,NULL,'2018-12-25 20:34:38','admin','2019-04-02 11:46:42',0,0,NULL,NULL),
	 ('2aeddae571695cd6380f6d6d334d6e7d','f0675b52d89100ee88472b6800754a08','布局统计报表','/report/ArchivesStatisticst','jeecg/report/ArchivesStatisticst',NULL,NULL,1,NULL,NULL,1.0,0,NULL,1,1,NULL,0,NULL,NULL,'admin','2019-04-03 18:32:48',NULL,NULL,0,0,NULL,NULL),
	 ('2dbbafa22cda07fa5d169d741b81fe12','08e6b9dc3c04489c8e1ff2ce6f105aa4','在线文档','{{ window._CONFIG[''domianURL''] }}/doc.html','layouts/IframePageView',NULL,NULL,1,NULL,NULL,4.0,0,NULL,1,1,0,0,NULL,NULL,'admin','2019-01-30 10:00:01','admin','2020-09-09 14:48:58',0,0,NULL,0),
	 ('2e42e3835c2b44ec9f7bc26c146ee531','','结果页','/result','layouts/PageView',NULL,NULL,0,NULL,NULL,8.0,0,'check-circle-o',1,0,NULL,0,NULL,NULL,NULL,'2018-12-25 20:34:38','admin','2019-04-02 11:46:56',0,0,NULL,NULL);
INSERT INTO sys_permission_v2 (id,parent_id,name,url,component,component_name,redirect,menu_type,perms,perms_type,sort_no,always_show,icon,is_route,is_leaf,keep_alive,hidden,hide_tab,description,create_by,create_time,update_by,update_time,del_flag,rule_flag,status,internal_or_external) VALUES
	 ('339329ed54cf255e1f9392e84f136901','2a470fc0c3954d9dbb61de6d80846549','helloworld','/jeecg/helloworld','jeecg/helloworld',NULL,NULL,1,NULL,NULL,4.0,0,NULL,1,1,NULL,0,NULL,NULL,NULL,'2018-12-25 20:34:38','admin','2019-02-15 16:24:56',0,0,NULL,NULL),
	 ('3f915b2769fc80648e92d04e84ca059d','d7d6e2e4e2934f2c9385a623fd98c6f3','用户管理','/isystem/user','system/UserList',NULL,NULL,1,NULL,NULL,1.1,0,NULL,1,0,1,0,0,NULL,NULL,'2018-12-25 20:34:38','admin','2022-10-14 18:09:03',0,0,NULL,0),
	 ('3fac0d3c9cd40fa53ab70d4c583821f8','2a470fc0c3954d9dbb61de6d80846549','分屏','/jeecg/splitPanel','jeecg/SplitPanel',NULL,NULL,1,NULL,NULL,6.0,0,NULL,1,1,NULL,0,NULL,NULL,'admin','2019-04-25 16:27:06',NULL,NULL,0,0,NULL,NULL),
	 ('4148ec82b6acd69f470bea75fe41c357','2a470fc0c3954d9dbb61de6d80846549','单表模型示例','/jeecg/jeecgDemoList','jeecg/JeecgDemoList','DemoList',NULL,1,NULL,NULL,1.0,0,NULL,1,0,1,0,0,NULL,NULL,'2018-12-28 15:57:30','admin','2022-10-14 19:00:09',0,1,NULL,0),
	 ('418964ba087b90a84897b62474496b93','540a2936940846cb98114ffb0d145cb8','查询表格','/list/query-list','examples/list/TableList',NULL,NULL,1,NULL,NULL,1.0,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,'2018-12-25 20:34:38',NULL,NULL,0,0,NULL,NULL),
	 ('4356a1a67b564f0988a484f5531fd4d9','2a470fc0c3954d9dbb61de6d80846549','内嵌Table','/jeecg/TableExpandeSub','jeecg/TableExpandeSub',NULL,NULL,1,NULL,NULL,1.0,0,NULL,1,1,NULL,0,NULL,NULL,'admin','2019-04-04 22:48:13',NULL,NULL,0,0,NULL,NULL),
	 ('45c966826eeff4c99b8f8ebfe74511fc','d7d6e2e4e2934f2c9385a623fd98c6f3','部门管理','/isystem/depart','system/DepartList',NULL,NULL,1,NULL,NULL,1.4,0,NULL,1,0,0,0,NULL,NULL,'admin','2019-01-29 18:47:40','admin','2019-12-25 09:36:47',0,0,NULL,0),
	 ('4875ebe289344e14844d8e3ea1edd73f','','详情页','/profile','layouts/RouteView',NULL,NULL,0,NULL,NULL,8.0,0,'profile',1,0,NULL,0,NULL,NULL,NULL,'2018-12-25 20:34:38','admin','2019-04-02 11:46:48',0,0,NULL,NULL),
	 ('4f66409ef3bbd69c1d80469d6e2a885e','6e73eb3c26099c191bf03852ee1310a1','账户绑定','/account/settings/binding','account/settings/Binding',NULL,NULL,1,'BindingSettings',NULL,NULL,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,'2018-12-26 19:01:20',NULL,NULL,0,0,NULL,NULL),
	 ('4f84f9400e5e92c95f05b554724c2b58','540a2936940846cb98114ffb0d145cb8','角色列表','/list/role-list','examples/list/RoleList',NULL,NULL,1,NULL,NULL,4.0,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,'2018-12-25 20:34:38',NULL,NULL,0,0,NULL,NULL);
INSERT INTO sys_permission_v2 (id,parent_id,name,url,component,component_name,redirect,menu_type,perms,perms_type,sort_no,always_show,icon,is_route,is_leaf,keep_alive,hidden,hide_tab,description,create_by,create_time,update_by,update_time,del_flag,rule_flag,status,internal_or_external) VALUES
	 ('53a9230444d33de28aa11cc108fb1dba','5c8042bd6c601270b2bbd9b20bccc68b','我的消息','/isps/userAnnouncement','system/UserAnnouncementList',NULL,NULL,1,NULL,NULL,3.0,0,NULL,1,1,0,0,NULL,NULL,'admin','2019-04-19 10:16:00','admin','2019-12-25 09:54:34',0,0,NULL,0),
	 ('54097c6a3cf50fad0793a34beff1efdf','e41b69c57a941a3bbcce45032fe57605','AUTO在线表单','/online/cgformList/:code','modules/online/cgform/auto/OnlCgformAutoList',NULL,NULL,1,NULL,NULL,9.0,0,NULL,1,1,NULL,1,NULL,NULL,'admin','2019-03-19 16:03:06','admin','2019-04-30 18:19:03',0,0,NULL,NULL),
	 ('540a2936940846cb98114ffb0d145cb8','','列表页','/list','layouts/PageView',NULL,'/list/query-list',0,NULL,NULL,9.0,0,'table',1,0,NULL,0,NULL,NULL,NULL,'2018-12-25 20:34:38','admin','2019-03-31 22:20:20',0,0,NULL,NULL),
	 ('54dd5457a3190740005c1bfec55b1c34','d7d6e2e4e2934f2c9385a623fd98c6f3','菜单管理(老)','/isystem/permission','system/PermissionList',NULL,NULL,1,NULL,NULL,1.3,0,NULL,1,1,0,0,0,NULL,NULL,'2018-12-25 20:34:38','admin','2022-10-14 18:01:41',0,0,NULL,0),
	 ('58857ff846e61794c69208e9d3a85466','08e6b9dc3c04489c8e1ff2ce6f105aa4','日志管理','/isystem/log','system/LogList',NULL,NULL,1,NULL,NULL,2.0,0,'',1,1,0,0,NULL,NULL,NULL,'2018-12-26 10:11:18','admin','2020-09-09 14:48:25',0,0,NULL,0),
	 ('58b9204feaf07e47284ddb36cd2d8468','2a470fc0c3954d9dbb61de6d80846549','图片翻页','/jeecg/imgTurnPage','jeecg/ImgTurnPage',NULL,NULL,1,NULL,NULL,4.0,0,NULL,1,1,NULL,0,NULL,NULL,'admin','2019-04-25 11:36:42',NULL,NULL,0,0,NULL,NULL),
	 ('5c2f42277948043026b7a14692456828','d7d6e2e4e2934f2c9385a623fd98c6f3','我的部门','/isystem/departUserList','system/DepartUserList',NULL,NULL,1,NULL,NULL,2.0,0,NULL,1,0,0,0,NULL,NULL,'admin','2019-04-17 15:12:24','admin','2019-12-25 09:35:26',0,0,NULL,0),
	 ('5c8042bd6c601270b2bbd9b20bccc68b','','消息中心','/message','layouts/RouteView',NULL,NULL,0,NULL,NULL,6.0,0,'message',1,0,NULL,0,NULL,NULL,'admin','2019-04-09 11:05:04','admin','2019-04-11 19:47:54',0,0,NULL,NULL),
	 ('6531cf3421b1265aeeeabaab5e176e6d','e3c13679c73a4f829bcff2aba8fd68b1','分步表单','/form/step-form','examples/form/stepForm/StepForm',NULL,NULL,1,NULL,NULL,2.0,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,'2018-12-25 20:34:38',NULL,NULL,0,0,NULL,NULL),
	 ('655563cd64b75dcf52ef7bcdd4836953','2a470fc0c3954d9dbb61de6d80846549','图片预览','/jeecg/ImagPreview','jeecg/ImagPreview',NULL,NULL,1,NULL,NULL,1.0,0,NULL,1,1,NULL,0,NULL,NULL,'admin','2019-04-17 11:18:45',NULL,NULL,0,0,NULL,NULL);
INSERT INTO sys_permission_v2 (id,parent_id,name,url,component,component_name,redirect,menu_type,perms,perms_type,sort_no,always_show,icon,is_route,is_leaf,keep_alive,hidden,hide_tab,description,create_by,create_time,update_by,update_time,del_flag,rule_flag,status,internal_or_external) VALUES
	 ('65a8f489f25a345836b7f44b1181197a','c65321e57b7949b7a975313220de0422','403','/exception/403','exception/403',NULL,NULL,1,NULL,NULL,1.0,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,'2018-12-25 20:34:38',NULL,NULL,0,0,NULL,NULL),
	 ('6ad53fd1b220989a8b71ff482d683a5a','2a470fc0c3954d9dbb61de6d80846549','一对多erp风格示例','/jeecg/tablist/JeecgOrderDMainList','jeecg/tablist/JeecgOrderDMainList',NULL,NULL,1,NULL,NULL,2.0,0,NULL,1,1,0,0,0,NULL,'admin','2019-02-20 14:45:09','admin','2022-01-17 17:02:51',0,0,NULL,0),
	 ('6e73eb3c26099c191bf03852ee1310a1','717f6bee46f44a3897eca9abd6e2ec44','个人设置','/account/settings/BaseSetting','account/settings/Index',NULL,NULL,1,NULL,NULL,2.0,1,NULL,1,0,NULL,0,NULL,NULL,NULL,'2018-12-25 20:34:38','admin','2019-04-19 09:41:05',0,0,NULL,NULL),
	 ('700b7f95165c46cc7a78bf227aa8fed3','08e6b9dc3c04489c8e1ff2ce6f105aa4','性能监控','/monitor','layouts/RouteView',NULL,NULL,1,NULL,NULL,3.0,0,NULL,1,0,0,0,NULL,NULL,'admin','2019-04-02 11:34:34','admin','2020-09-09 14:48:51',0,0,NULL,0),
	 ('717f6bee46f44a3897eca9abd6e2ec44','','个人页','/account','layouts/RouteView',NULL,NULL,0,NULL,NULL,9.0,0,'user',1,0,0,1,NULL,NULL,NULL,'2018-12-25 20:34:38','admin','2020-02-23 22:41:37',0,0,NULL,0),
	 ('73678f9daa45ed17a3674131b03432fb','540a2936940846cb98114ffb0d145cb8','权限列表','/list/permission-list','examples/list/PermissionList',NULL,NULL,1,NULL,NULL,5.0,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,'2018-12-25 20:34:38',NULL,NULL,0,0,NULL,NULL),
	 ('7960961b0063228937da5fa8dd73d371','2a470fc0c3954d9dbb61de6d80846549','JEditableTable示例','/jeecg/JEditableTable','jeecg/JeecgEditableTableExample',NULL,NULL,1,NULL,NULL,2.1,0,NULL,1,1,0,0,NULL,NULL,'admin','2019-03-22 15:22:18','admin','2019-12-25 09:48:16',0,0,NULL,0),
	 ('7ac9eb9ccbde2f7a033cd4944272bf1e','540a2936940846cb98114ffb0d145cb8','卡片列表','/list/card','examples/list/CardList',NULL,NULL,1,NULL,NULL,7.0,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,'2018-12-25 20:34:38',NULL,NULL,0,0,NULL,NULL),
	 ('841057b8a1bef8f6b4b20f9a618a7fa6','08e6b9dc3c04489c8e1ff2ce6f105aa4','数据日志','/sys/dataLog-list','system/DataLogList',NULL,NULL,1,NULL,NULL,2.1,0,NULL,1,1,0,0,NULL,NULL,'admin','2019-03-11 19:26:49','admin','2020-09-09 14:48:32',0,0,NULL,0),
	 ('882a73768cfd7f78f3a37584f7299656','6e73eb3c26099c191bf03852ee1310a1','个性化设置','/account/settings/custom','account/settings/Custom',NULL,NULL,1,'CustomSettings',NULL,NULL,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,'2018-12-26 19:00:46',NULL,'2018-12-26 21:13:25',0,0,NULL,NULL);
INSERT INTO sys_permission_v2 (id,parent_id,name,url,component,component_name,redirect,menu_type,perms,perms_type,sort_no,always_show,icon,is_route,is_leaf,keep_alive,hidden,hide_tab,description,create_by,create_time,update_by,update_time,del_flag,rule_flag,status,internal_or_external) VALUES
	 ('8b3bff2eee6f1939147f5c68292a1642','700b7f95165c46cc7a78bf227aa8fed3','服务器信息','/monitor/SystemInfo','modules/monitor/SystemInfo',NULL,NULL,1,NULL,NULL,4.0,0,NULL,1,1,NULL,0,NULL,NULL,'admin','2019-04-02 11:39:19','admin','2019-04-02 15:40:02',0,0,NULL,NULL),
	 ('8d1ebd663688965f1fd86a2f0ead3416','700b7f95165c46cc7a78bf227aa8fed3','Redis监控','/monitor/redis/info','modules/monitor/RedisInfo',NULL,NULL,1,NULL,NULL,1.0,0,NULL,1,1,NULL,0,NULL,NULL,'admin','2019-04-02 13:11:33','admin','2019-05-07 15:18:54',0,0,NULL,NULL),
	 ('8d4683aacaa997ab86b966b464360338','e41b69c57a941a3bbcce45032fe57605','Online表单开发','/online/cgform','modules/online/cgform/OnlCgformHeadList',NULL,NULL,1,NULL,NULL,1.0,0,NULL,1,0,NULL,0,NULL,NULL,'admin','2019-03-12 15:48:14','admin','2019-06-11 14:19:17',0,0,NULL,NULL),
	 ('8fb8172747a78756c11916216b8b8066','717f6bee46f44a3897eca9abd6e2ec44','工作台','/dashboard/workplace','dashboard/Workplace',NULL,NULL,1,NULL,NULL,3.0,0,NULL,1,1,NULL,0,NULL,NULL,NULL,'2018-12-25 20:34:38','admin','2019-04-02 11:45:02',0,0,NULL,NULL),
	 ('944abf0a8fc22fe1f1154a389a574154','5c8042bd6c601270b2bbd9b20bccc68b','消息管理','/modules/message/sysMessageList','modules/message/SysMessageList',NULL,NULL,1,NULL,NULL,1.0,0,NULL,1,1,NULL,0,NULL,NULL,'admin','2019-04-09 11:27:53','admin','2019-04-09 19:31:23',0,0,NULL,NULL),
	 ('9502685863ab87f0ad1134142788a385','','首页','/dashboard/analysis','dashboard/Analysis',NULL,NULL,0,NULL,NULL,0.0,0,'home',1,1,NULL,0,NULL,NULL,NULL,'2018-12-25 20:34:38','admin','2019-03-29 11:04:13',0,0,NULL,NULL),
	 ('97c8629abc7848eccdb6d77c24bb3ebb','700b7f95165c46cc7a78bf227aa8fed3','磁盘监控','/monitor/Disk','modules/monitor/DiskMonitoring',NULL,NULL,1,NULL,NULL,6.0,0,NULL,1,1,NULL,0,NULL,NULL,'admin','2019-04-25 14:30:06','admin','2019-05-05 14:37:14',0,0,NULL,NULL),
	 ('9a90363f216a6a08f32eecb3f0bf12a3','2a470fc0c3954d9dbb61de6d80846549','自定义组件','/jeecg/SelectDemo','jeecg/SelectDemo',NULL,NULL,1,NULL,NULL,0.0,0,NULL,1,1,0,0,NULL,NULL,'admin','2019-03-19 11:19:05','admin','2019-12-25 09:47:04',0,0,NULL,0),
	 ('9cb91b8851db0cf7b19d7ecc2a8193dd','1939e035e803a99ceecb6f5563570fb2','我的任务表单','/modules/bpm/task/form/FormModule','modules/bpm/task/form/FormModule',NULL,NULL,1,NULL,NULL,1.0,0,NULL,1,1,NULL,0,NULL,NULL,'admin','2019-03-08 16:49:05','admin','2019-03-08 18:37:56',0,0,NULL,NULL),
	 ('9fe26464838de2ea5e90f2367e35efa0','e41b69c57a941a3bbcce45032fe57605','AUTO在线报表','/online/cgreport/:code','modules/online/cgreport/auto/OnlCgreportAutoList','onlineAutoList',NULL,1,NULL,NULL,9.0,0,NULL,1,1,NULL,1,NULL,NULL,'admin','2019-03-12 11:06:48','admin','2019-04-30 18:19:10',0,0,NULL,NULL);
INSERT INTO sys_permission_v2 (id,parent_id,name,url,component,component_name,redirect,menu_type,perms,perms_type,sort_no,always_show,icon,is_route,is_leaf,keep_alive,hidden,hide_tab,description,create_by,create_time,update_by,update_time,del_flag,rule_flag,status,internal_or_external) VALUES
	 ('a400e4f4d54f79bf5ce160ae432231af','2a470fc0c3954d9dbb61de6d80846549','JEECG官方网站','http://www.jeecg.com','layouts/IframePageView',NULL,NULL,1,NULL,NULL,4.0,0,NULL,1,1,NULL,0,NULL,NULL,'admin','2019-01-29 19:44:06','admin','2019-02-15 16:25:02',0,0,NULL,NULL),
	 ('ae4fed059f67086fd52a73d913cf473d','540a2936940846cb98114ffb0d145cb8','内联编辑表格','/list/edit-table','examples/list/TableInnerEditList',NULL,NULL,1,NULL,NULL,2.0,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,'2018-12-25 20:34:38',NULL,NULL,0,0,NULL,NULL),
	 ('aedbf679b5773c1f25e9f7b10111da73','08e6b9dc3c04489c8e1ff2ce6f105aa4','SQL监控','{{ window._CONFIG[''domianURL''] }}/druid/','layouts/IframePageView',NULL,NULL,1,NULL,NULL,3.0,0,NULL,1,1,0,0,NULL,NULL,'admin','2019-01-30 09:43:22','admin','2020-09-09 14:48:38',0,0,NULL,0),
	 ('b1cb0a3fedf7ed0e4653cb5a229837ee','08e6b9dc3c04489c8e1ff2ce6f105aa4','定时任务','/isystem/QuartzJobList','system/QuartzJobList',NULL,NULL,1,NULL,NULL,1.0,0,NULL,1,0,0,0,NULL,NULL,NULL,'2019-01-03 09:38:52','admin','2020-09-09 14:48:16',0,0,NULL,0),
	 ('b3c824fc22bd953e2eb16ae6914ac8f9','4875ebe289344e14844d8e3ea1edd73f','高级详情页','/profile/advanced','examples/profile/advanced/Advanced',NULL,NULL,1,NULL,NULL,2.0,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,'2018-12-25 20:34:38',NULL,NULL,0,0,NULL,NULL),
	 ('b4dfc7d5dd9e8d5b6dd6d4579b1aa559','c65321e57b7949b7a975313220de0422','500','/exception/500','exception/500',NULL,NULL,1,NULL,NULL,3.0,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,'2018-12-25 20:34:38',NULL,NULL,0,0,NULL,NULL),
	 ('b6bcee2ccc854052d3cc3e9c96d90197','71102b3b87fb07e5527bbd2c530dd90a','加班申请','/modules/extbpm/joa/JoaOvertimeList','modules/extbpm/joa/JoaOvertimeList',NULL,NULL,1,NULL,NULL,1.0,0,NULL,1,1,NULL,0,NULL,NULL,'admin','2019-04-03 15:33:10','admin','2019-04-03 15:34:48',0,0,NULL,NULL),
	 ('c431130c0bc0ec71b0a5be37747bb36a','2a470fc0c3954d9dbb61de6d80846549','一对多JEditable','/jeecg/JeecgOrderMainListForJEditableTable','jeecg/JeecgOrderMainListForJEditableTable',NULL,NULL,1,NULL,NULL,3.0,0,NULL,1,1,NULL,0,NULL,NULL,'admin','2019-03-29 10:51:59','admin','2019-04-04 20:09:39',0,0,NULL,NULL),
	 ('c65321e57b7949b7a975313220de0422',NULL,'异常页','/exception','layouts/RouteView',NULL,NULL,0,NULL,NULL,8.0,NULL,'warning',1,0,NULL,NULL,NULL,NULL,NULL,'2018-12-25 20:34:38',NULL,NULL,0,0,NULL,NULL),
	 ('c6cf95444d80435eb37b2f9db3971ae6','2a470fc0c3954d9dbb61de6d80846549','数据回执模拟','/jeecg/InterfaceTest','jeecg/InterfaceTest',NULL,NULL,1,NULL,NULL,6.0,0,NULL,1,1,NULL,0,NULL,NULL,'admin','2019-02-19 16:02:23','admin','2019-02-21 16:25:45',0,0,NULL,NULL);
INSERT INTO sys_permission_v2 (id,parent_id,name,url,component,component_name,redirect,menu_type,perms,perms_type,sort_no,always_show,icon,is_route,is_leaf,keep_alive,hidden,hide_tab,description,create_by,create_time,update_by,update_time,del_flag,rule_flag,status,internal_or_external) VALUES
	 ('cc50656cf9ca528e6f2150eba4714ad2','4875ebe289344e14844d8e3ea1edd73f','基础详情页','/profile/basic','examples/profile/basic/Index',NULL,NULL,1,NULL,NULL,1.0,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,'2018-12-25 20:34:38',NULL,NULL,0,0,NULL,NULL),
	 ('d07a2c87a451434c99ab06296727ec4f','700b7f95165c46cc7a78bf227aa8fed3','JVM信息','/monitor/JvmInfo','modules/monitor/JvmInfo',NULL,NULL,1,NULL,NULL,4.0,0,NULL,1,1,NULL,0,NULL,NULL,'admin','2019-04-01 23:07:48','admin','2019-04-02 11:37:16',0,0,NULL,NULL),
	 ('d2bbf9ebca5a8fa2e227af97d2da7548','c65321e57b7949b7a975313220de0422','404','/exception/404','exception/404',NULL,NULL,1,NULL,NULL,2.0,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,'2018-12-25 20:34:38',NULL,NULL,0,0,NULL,NULL),
	 ('d7d6e2e4e2934f2c9385a623fd98c6f3','','系统管理','/isystem','layouts/RouteView',NULL,NULL,0,NULL,NULL,4.0,0,'setting',1,0,NULL,0,NULL,NULL,NULL,'2018-12-25 20:34:38','admin','2019-03-31 22:19:52',0,0,NULL,NULL),
	 ('d86f58e7ab516d3bc6bfb1fe10585f97','717f6bee46f44a3897eca9abd6e2ec44','个人中心','/account/center','account/center/Index',NULL,NULL,1,NULL,NULL,1.0,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,'2018-12-25 20:34:38',NULL,NULL,0,0,NULL,NULL),
	 ('de13e0f6328c069748de7399fcc1dbbd','fb07ca05a3e13674dbf6d3245956da2e','搜索列表（项目）','/list/search/project','examples/list/TableList',NULL,NULL,1,NULL,NULL,1.0,0,NULL,1,1,NULL,0,NULL,NULL,'admin','2019-02-12 14:01:40','admin','2019-02-12 14:14:18',0,0,NULL,NULL),
	 ('e08cb190ef230d5d4f03824198773950','d7d6e2e4e2934f2c9385a623fd98c6f3','系统通告','/isystem/annountCement','system/SysAnnouncementList',NULL,NULL,1,'annountCement',NULL,6.0,NULL,'',1,1,NULL,NULL,NULL,NULL,NULL,'2019-01-02 17:23:01',NULL,'2019-01-02 17:31:23',0,0,NULL,NULL),
	 ('e1979bb53e9ea51cecc74d86fd9d2f64','2a470fc0c3954d9dbb61de6d80846549','PDF预览','/jeecg/jeecgPdfView','jeecg/JeecgPdfView',NULL,NULL,1,NULL,NULL,3.0,0,NULL,1,1,NULL,0,NULL,NULL,'admin','2019-04-25 10:39:35',NULL,NULL,0,0,NULL,NULL),
	 ('e3c13679c73a4f829bcff2aba8fd68b1','','表单页','/form','layouts/PageView',NULL,NULL,0,NULL,NULL,9.0,0,'form',1,0,NULL,0,NULL,NULL,NULL,'2018-12-25 20:34:38','admin','2019-03-31 22:20:14',0,0,NULL,NULL),
	 ('e41b69c57a941a3bbcce45032fe57605','','在线开发','/online','layouts/RouteView',NULL,NULL,0,NULL,NULL,2.0,0,'cloud',1,0,0,0,NULL,NULL,'admin','2019-03-08 10:43:10','admin','2021-01-24 14:15:12',0,0,NULL,0);
INSERT INTO sys_permission_v2 (id,parent_id,name,url,component,component_name,redirect,menu_type,perms,perms_type,sort_no,always_show,icon,is_route,is_leaf,keep_alive,hidden,hide_tab,description,create_by,create_time,update_by,update_time,del_flag,rule_flag,status,internal_or_external) VALUES
	 ('e5973686ed495c379d829ea8b2881fc6','e3c13679c73a4f829bcff2aba8fd68b1','高级表单','/form/advanced-form','examples/form/advancedForm/AdvancedForm',NULL,NULL,1,NULL,NULL,3.0,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,'2018-12-25 20:34:38',NULL,NULL,0,0,NULL,NULL),
	 ('e6bfd1fcabfd7942fdd05f076d1dad38','2a470fc0c3954d9dbb61de6d80846549','打印测试','/jeecg/PrintDemo','jeecg/PrintDemo',NULL,NULL,1,NULL,NULL,3.0,0,NULL,1,1,NULL,0,NULL,NULL,'admin','2019-02-19 15:58:48','admin','2019-05-07 20:14:39',0,0,NULL,NULL),
	 ('ebb9d82ea16ad864071158e0c449d186','d7d6e2e4e2934f2c9385a623fd98c6f3','分类字典','/isys/category','system/SysCategoryList',NULL,NULL,1,NULL,'1',5.2,0,NULL,1,1,0,0,NULL,NULL,'admin','2019-05-29 18:48:07','admin','2020-02-23 22:45:33',0,0,'1',0),
	 ('ec8d607d0156e198b11853760319c646','6e73eb3c26099c191bf03852ee1310a1','安全设置','/account/settings/security','account/settings/Security',NULL,NULL,1,'SecuritySettings',NULL,NULL,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,'2018-12-26 18:59:52',NULL,NULL,0,0,NULL,NULL),
	 ('f0675b52d89100ee88472b6800754a08','','统计报表','/report','layouts/RouteView',NULL,NULL,0,NULL,NULL,1.0,0,'bar-chart',1,0,0,0,0,NULL,'admin','2019-04-03 18:32:02','admin','2022-04-16 23:31:25',0,0,NULL,0),
	 ('f1cb187abf927c88b89470d08615f5ac','d7d6e2e4e2934f2c9385a623fd98c6f3','数据字典','/isystem/dict','system/DictList',NULL,NULL,1,NULL,NULL,5.0,0,NULL,1,0,0,0,NULL,NULL,NULL,'2018-12-28 13:54:43','admin','2020-02-23 22:45:25',0,0,NULL,0),
	 ('f23d9bfff4d9aa6b68569ba2cff38415','540a2936940846cb98114ffb0d145cb8','标准列表','/list/basic-list','examples/list/StandardList',NULL,NULL,1,NULL,NULL,6.0,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,'2018-12-25 20:34:38',NULL,NULL,0,0,NULL,NULL),
	 ('f2849d3814fc97993bfc519ae6bbf049','e41b69c57a941a3bbcce45032fe57605','AUTO复制表单','/online/copyform/:code','modules/online/cgform/OnlCgformCopyList',NULL,NULL,1,NULL,'1',1.0,0,NULL,1,1,0,1,NULL,NULL,'admin','2019-08-29 16:05:37',NULL,NULL,0,0,'1',NULL),
	 ('f780d0d3083d849ccbdb1b1baee4911d','5c8042bd6c601270b2bbd9b20bccc68b','模板管理','/modules/message/sysMessageTemplateList','modules/message/SysMessageTemplateList',NULL,NULL,1,NULL,NULL,1.0,0,NULL,1,1,NULL,0,NULL,NULL,'admin','2019-04-09 11:50:31','admin','2019-04-12 10:16:34',0,0,NULL,NULL),
	 ('fb07ca05a3e13674dbf6d3245956da2e','540a2936940846cb98114ffb0d145cb8','搜索列表','/list/search','examples/list/search/SearchLayout',NULL,'/list/search/article',1,NULL,NULL,8.0,0,NULL,1,0,NULL,0,NULL,NULL,NULL,'2018-12-25 20:34:38','admin','2019-02-12 15:09:13',0,0,NULL,NULL);
INSERT INTO sys_permission_v2 (id,parent_id,name,url,component,component_name,redirect,menu_type,perms,perms_type,sort_no,always_show,icon,is_route,is_leaf,keep_alive,hidden,hide_tab,description,create_by,create_time,update_by,update_time,del_flag,rule_flag,status,internal_or_external) VALUES
	 ('fb367426764077dcf94640c843733985','2a470fc0c3954d9dbb61de6d80846549','一对多示例','/jeecg/JeecgOrderMainList','jeecg/JeecgOrderMainList',NULL,NULL,1,NULL,NULL,2.0,0,NULL,1,1,NULL,0,NULL,NULL,'admin','2019-02-15 16:24:11','admin','2019-02-18 10:50:14',0,0,NULL,NULL),
	 ('fba41089766888023411a978d13c0aa4','e41b69c57a941a3bbcce45032fe57605','AUTO树表单列表','/online/cgformTreeList/:code','modules/online/cgform/auto/OnlCgformTreeList',NULL,NULL,1,NULL,'1',9.0,0,NULL,1,1,NULL,1,NULL,NULL,'admin','2019-05-21 14:46:50','admin','2019-06-11 13:52:52',0,0,'1',NULL),
	 ('fc810a2267dd183e4ef7c71cc60f4670','700b7f95165c46cc7a78bf227aa8fed3','请求追踪','/monitor/HttpTrace','modules/monitor/HttpTrace',NULL,NULL,1,NULL,NULL,4.0,0,NULL,1,1,NULL,0,NULL,NULL,'admin','2019-04-02 09:46:19','admin','2019-04-02 11:37:27',0,0,NULL,NULL),
	 ('fedfbf4420536cacc0218557d263dfea','6e73eb3c26099c191bf03852ee1310a1','新消息通知','/account/settings/notification','account/settings/Notification',NULL,NULL,1,'NotificationSettings',NULL,NULL,NULL,'',1,1,NULL,NULL,NULL,NULL,NULL,'2018-12-26 19:02:05',NULL,NULL,0,0,NULL,NULL);

-- ----------------------------
-- Table structure for sys_position
-- ----------------------------
DROP TABLE IF EXISTS `sys_position`;
CREATE TABLE `sys_position`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职务编码',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职务名称',
  `post_rank` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职级',
  `company_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司id',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `sys_org_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组织机构编码',
  `tenant_id` int(10) NULL DEFAULT 0 COMMENT '租户ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_code`(`code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_position
-- ----------------------------
INSERT INTO `sys_position` VALUES ('1185040064792571906', 'devleader', '研发部经理', '2', NULL, 'admin', '2019-10-18 11:49:03', 'admin', '2022-10-25 11:09:06', 'A01', 0);
INSERT INTO `sys_position` VALUES ('1256485574212153345', '总经理', 'laozong', '5', NULL, 'admin', '2020-05-02 15:28:00', 'admin', '2022-10-25 00:16:17', '北京国炬公司', 0);

-- ----------------------------
-- Table structure for sys_quartz_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_quartz_job`;
CREATE TABLE `sys_quartz_job`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `del_flag` int(1) NULL DEFAULT NULL COMMENT '删除状态',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `job_class_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务类名',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'cron表达式',
  `parameter` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `status` int(1) NULL DEFAULT NULL COMMENT '状态 0正常 -1停止',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_quartz_job
-- ----------------------------
INSERT INTO `sys_quartz_job` VALUES ('5b3d2c087ad41aa755fc4f89697b01e7', 'admin', '2019-04-11 19:04:21', 0, 'admin', '2020-05-02 15:48:48', 'org.jeecg.modules.message.job.SendMsgJob', '0/50 * * * * ? *', NULL, NULL, -1);
INSERT INTO `sys_quartz_job` VALUES ('a253cdfc811d69fa0efc70d052bc8128', 'admin', '2019-03-30 12:44:48', 0, 'admin', '2020-05-02 15:48:49', 'org.jeecg.modules.quartz.job.SampleJob', '0/1 * * * * ?', NULL, NULL, -1);
INSERT INTO `sys_quartz_job` VALUES ('df26ecacf0f75d219d746750fe84bbee', NULL, NULL, 0, 'admin', '2020-05-02 15:40:35', 'org.jeecg.modules.quartz.job.SampleParamJob', '0/1 * * * * ?', 'scott', '带参测试 后台将每隔1秒执行输出日志', -1);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键id',
  `role_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `role_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色编码',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `tenant_id` int(10) NULL DEFAULT 0 COMMENT '租户ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_sys_role_role_code`(`role_code`) USING BTREE,
  INDEX `idx_sr_role_code`(`role_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1169504891467464705', '第三方登录角色', 'third_role', '第三方登录角色', 'admin', '2019-09-05 14:57:49', 'admin', '2020-05-02 18:20:58', 0);
INSERT INTO `sys_role` VALUES ('1260924539346472962', '财务出纳', 'caiwu', NULL, 'admin', '2020-05-14 21:26:52', NULL, NULL, 0);
INSERT INTO `sys_role` VALUES ('1501570619841810433', 'Vue3角色', 'vue3', NULL, 'admin', '2022-03-09 22:48:28', 'admin', '2022-06-10 10:51:22', 0);
INSERT INTO `sys_role` VALUES ('e51758fa916c881624b046d26bd09230', '人力资源部', 'hr', NULL, 'admin', '2019-01-21 18:07:24', 'admin', '2019-10-18 11:39:43', 0);
INSERT INTO `sys_role` VALUES ('ee8626f80f7c2619917b6236f3a7f02b', '临时角色', 'test', '这是新建的临时角色123', NULL, '2018-12-20 10:59:04', 'admin', '2019-02-19 15:08:37', 0);
INSERT INTO `sys_role` VALUES ('f6817f48af4fb3af11b9e8bf182f618b', '管理员', 'admin', '管理员', NULL, '2018-12-21 18:03:39', 'admin', '2023-03-04 15:00:04', 0);

-- ----------------------------
-- Table structure for sys_role_index
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_index`;
CREATE TABLE `sys_role_index`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `role_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色编码',
  `url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件',
  `is_route` tinyint(1) NULL DEFAULT 1 COMMENT '是否路由菜单: 0:不是  1:是（默认值1）',
  `priority` int(11) NULL DEFAULT 0 COMMENT '优先级',
  `status` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态0:无效 1:有效',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人登录名称',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建日期',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人登录名称',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新日期',
  `sys_org_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属部门',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色首页表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_index
-- ----------------------------
INSERT INTO `sys_role_index` VALUES ('1549658299929718786', 'admin', '222', '22', 1, 0, '0', 'admin', '2022-07-20 15:31:45', 'admin', '2022-07-20 15:31:55', 'A01');

-- ----------------------------
-- Table structure for sys_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE `sys_role_permission`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `role_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色id',
  `permission_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限id',
  `data_rule_ids` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据权限ids',
  `operate_date` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `operate_ip` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作ip',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_srp_role_per_id`(`role_id`, `permission_id`) USING BTREE,
  INDEX `idx_srp_role_id`(`role_id`) USING BTREE,
  INDEX `idx_srp_permission_id`(`permission_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色权限表' ROW_FORMAT = Dynamic;


-- --------------------------------------------------------------
-- Records of sys_role_permission
-- --------------------------------------------------------------
INSERT INTO sys_role_permission (id,role_id,permission_id,data_rule_ids,operate_date,operate_ip) VALUES
	 ('00b0748f04d3ea52c8cfa179c1c9d384','52b0cf022ac4187b2a70dfa4f8b2d940','d7d6e2e4e2934f2c9385a623fd98c6f3',NULL,NULL,NULL),
	 ('00b82058779cca5106fbb84783534c9b','f6817f48af4fb3af11b9e8bf182f618b','4148ec82b6acd69f470bea75fe41c357','',NULL,NULL),
	 ('0254c0b25694ad5479e6d6935bbc176e','f6817f48af4fb3af11b9e8bf182f618b','944abf0a8fc22fe1f1154a389a574154',NULL,NULL,NULL),
	 ('09bd4fc30ffe88c4a44ed3868f442719','f6817f48af4fb3af11b9e8bf182f618b','e6bfd1fcabfd7942fdd05f076d1dad38',NULL,NULL,NULL),
	 ('0c2d2db76ee3aa81a4fe0925b0f31365','f6817f48af4fb3af11b9e8bf182f618b','024f1fd1283dc632458976463d8984e1',NULL,NULL,NULL),
	 ('0c6b8facbb1cc874964c87a8cf01e4b1','f6817f48af4fb3af11b9e8bf182f618b','841057b8a1bef8f6b4b20f9a618a7fa6',NULL,NULL,NULL),
	 ('0c6e1075e422972083c3e854d9af7851','f6817f48af4fb3af11b9e8bf182f618b','08e6b9dc3c04489c8e1ff2ce6f105aa4',NULL,NULL,NULL),
	 ('0d9d14bc66e9d5e99b0280095fdc8587','ee8626f80f7c2619917b6236f3a7f02b','277bfabef7d76e89b33062b16a9a5020',NULL,NULL,NULL),
	 ('0dec36b68c234767cd35466efef3b941','ee8626f80f7c2619917b6236f3a7f02b','54dd5457a3190740005c1bfec55b1c34',NULL,NULL,NULL),
	 ('0e1469997af2d3b97fff56a59ee29eeb','f6817f48af4fb3af11b9e8bf182f618b','e41b69c57a941a3bbcce45032fe57605',NULL,NULL,NULL);
INSERT INTO sys_role_permission (id,role_id,permission_id,data_rule_ids,operate_date,operate_ip) VALUES
	 ('0f861cb988fdc639bb1ab943471f3a72','f6817f48af4fb3af11b9e8bf182f618b','97c8629abc7848eccdb6d77c24bb3ebb',NULL,NULL,NULL),
	 ('105c2ac10741e56a618a82cd58c461d7','e51758fa916c881624b046d26bd09230','1663f3faba244d16c94552f849627d84',NULL,NULL,NULL),
	 ('115a6673ae6c0816d3f60de221520274','21c5a3187763729408b40afb0d0fdfa8','63b551e81c5956d5c861593d366d8c57',NULL,NULL,NULL),
	 ('1185039870491439105','f6817f48af4fb3af11b9e8bf182f618b','1174506953255182338',NULL,NULL,NULL),
	 ('1185039870529187841','f6817f48af4fb3af11b9e8bf182f618b','1174590283938041857',NULL,NULL,NULL),
	 ('1185039870537576450','f6817f48af4fb3af11b9e8bf182f618b','1166535831146504193',NULL,NULL,NULL),
	 ('1197431682208206850','f6817f48af4fb3af11b9e8bf182f618b','1192318987661234177',NULL,NULL,NULL),
	 ('1197795315916271617','f6817f48af4fb3af11b9e8bf182f618b','109c78a583d4693ce2f16551b7786786',NULL,NULL,NULL),
	 ('1197795316268593154','f6817f48af4fb3af11b9e8bf182f618b','9fe26464838de2ea5e90f2367e35efa0',NULL,NULL,NULL),
	 ('1209423530518761473','f6817f48af4fb3af11b9e8bf182f618b','1205097455226462210',NULL,NULL,NULL);
INSERT INTO sys_role_permission (id,role_id,permission_id,data_rule_ids,operate_date,operate_ip) VALUES
	 ('1209423530594258945','f6817f48af4fb3af11b9e8bf182f618b','1205098241075453953',NULL,NULL,NULL),
	 ('1209423530606841858','f6817f48af4fb3af11b9e8bf182f618b','1205306106780364802',NULL,NULL,NULL),
	 ('1209423580355481602','f6817f48af4fb3af11b9e8bf182f618b','190c2b43bec6a5f7a4194a85db67d96a',NULL,NULL,NULL),
	 ('1209654501558046722','f6817f48af4fb3af11b9e8bf182f618b','f2849d3814fc97993bfc519ae6bbf049',NULL,NULL,NULL),
	 ('1231590078632955905','f6817f48af4fb3af11b9e8bf182f618b','1224641973866467330',NULL,NULL,NULL),
	 ('1231590078658121729','f6817f48af4fb3af11b9e8bf182f618b','1209731624921534465',NULL,NULL,NULL),
	 ('1231590078662316033','f6817f48af4fb3af11b9e8bf182f618b','1229674163694841857',NULL,NULL,NULL),
	 ('1232123957949304833','ee8626f80f7c2619917b6236f3a7f02b','f0675b52d89100ee88472b6800754a08',NULL,NULL,NULL),
	 ('1232123957978664962','ee8626f80f7c2619917b6236f3a7f02b','1232123780958064642',NULL,NULL,NULL),
	 ('1232123957978664963','ee8626f80f7c2619917b6236f3a7f02b','020b06793e4de2eee0007f603000c769',NULL,NULL,NULL);
INSERT INTO sys_role_permission (id,role_id,permission_id,data_rule_ids,operate_date,operate_ip) VALUES
	 ('1232123957987053570','ee8626f80f7c2619917b6236f3a7f02b','2aeddae571695cd6380f6d6d334d6e7d',NULL,NULL,NULL),
	 ('1232124727411150850','f6817f48af4fb3af11b9e8bf182f618b','1232123780958064642',NULL,NULL,NULL),
	 ('1232125488694104066','ee8626f80f7c2619917b6236f3a7f02b','e41b69c57a941a3bbcce45032fe57605',NULL,NULL,NULL),
	 ('1260923306820882434','f6817f48af4fb3af11b9e8bf182f618b','1260923256208216065',NULL,NULL,NULL),
	 ('1260923306841853953','f6817f48af4fb3af11b9e8bf182f618b','1260922988733255681',NULL,NULL,NULL),
	 ('1260928399955836929','f6817f48af4fb3af11b9e8bf182f618b','1260928341675982849',NULL,NULL,NULL),
	 ('1260929736852488194','ee8626f80f7c2619917b6236f3a7f02b','1260929666434318338',NULL,NULL,NULL),
	 ('1260931414095937537','ee8626f80f7c2619917b6236f3a7f02b','1260931366557696001',NULL,NULL,NULL),
	 ('1269526122208522241','f6817f48af4fb3af11b9e8bf182f618b','1267412134208319489',NULL,NULL,NULL),
	 ('126ea9faebeec2b914d6d9bef957afb6','f6817f48af4fb3af11b9e8bf182f618b','f1cb187abf927c88b89470d08615f5ac',NULL,NULL,NULL);
INSERT INTO sys_role_permission (id,role_id,permission_id,data_rule_ids,operate_date,operate_ip) VALUES
	 ('1281494164924653569','f6817f48af4fb3af11b9e8bf182f618b','1280350452934307841',NULL,'2020-07-10 15:43:13','127.0.0.1'),
	 ('1281494164945625089','f6817f48af4fb3af11b9e8bf182f618b','1280464606292099074',NULL,'2020-07-10 15:43:13','127.0.0.1'),
	 ('1281494684632473602','f6817f48af4fb3af11b9e8bf182f618b','1265162119913824258',NULL,'2020-07-10 15:45:16','127.0.0.1'),
	 ('1303585080082485250','f6817f48af4fb3af11b9e8bf182f618b','1287715272999944193',NULL,'2020-09-09 14:44:37','127.0.0.1'),
	 ('1303585080103456769','f6817f48af4fb3af11b9e8bf182f618b','1287715783966834689',NULL,'2020-09-09 14:44:37','127.0.0.1'),
	 ('1303585080116039682','f6817f48af4fb3af11b9e8bf182f618b','1287716451494510593',NULL,'2020-09-09 14:44:37','127.0.0.1'),
	 ('1303585080124428290','f6817f48af4fb3af11b9e8bf182f618b','1287718919049691137',NULL,'2020-09-09 14:44:37','127.0.0.1'),
	 ('1303585080128622593','f6817f48af4fb3af11b9e8bf182f618b','1287718938179911682',NULL,'2020-09-09 14:44:37','127.0.0.1'),
	 ('1303585080141205506','f6817f48af4fb3af11b9e8bf182f618b','1287718956957810689',NULL,'2020-09-09 14:44:37','127.0.0.1'),
	 ('1335960787783098369','f6817f48af4fb3af11b9e8bf182f618b','1335960713267093506',NULL,'2020-12-07 22:54:07','0:0:0:0:0:0:0:1');
INSERT INTO sys_role_permission (id,role_id,permission_id,data_rule_ids,operate_date,operate_ip) VALUES
	 ('1372092783227596802','f6817f48af4fb3af11b9e8bf182f618b','1352200630711652354',NULL,'2021-03-17 15:49:46','0:0:0:0:0:0:0:1'),
	 ('1372092783240179713','f6817f48af4fb3af11b9e8bf182f618b','1365187528377102337',NULL,'2021-03-17 15:49:46','0:0:0:0:0:0:0:1'),
	 ('1400734738941505537','f6817f48af4fb3af11b9e8bf182f618b','1400726868091015170',NULL,'2021-06-04 16:42:41','0:0:0:0:0:0:0:1'),
	 ('1427184491288727554','f6817f48af4fb3af11b9e8bf182f618b','1404684556047024130',NULL,'2021-08-16 16:24:33','0:0:0:0:0:0:0:1'),
	 ('1427184491297116161','f6817f48af4fb3af11b9e8bf182f618b','1387612436586065922',NULL,'2021-08-16 16:24:33','0:0:0:0:0:0:0:1'),
	 ('1427184775947751425','ee8626f80f7c2619917b6236f3a7f02b','1352200630711652354',NULL,'2021-08-16 16:25:41','0:0:0:0:0:0:0:1'),
	 ('1427184775956140034','ee8626f80f7c2619917b6236f3a7f02b','1205097455226462210',NULL,'2021-08-16 16:25:41','0:0:0:0:0:0:0:1'),
	 ('1427184775956140035','ee8626f80f7c2619917b6236f3a7f02b','1335960713267093506',NULL,'2021-08-16 16:25:41','0:0:0:0:0:0:0:1'),
	 ('1427184775964528642','ee8626f80f7c2619917b6236f3a7f02b','1205098241075453953',NULL,'2021-08-16 16:25:41','0:0:0:0:0:0:0:1'),
	 ('1427184775964528643','ee8626f80f7c2619917b6236f3a7f02b','1205306106780364802',NULL,'2021-08-16 16:25:41','0:0:0:0:0:0:0:1');
INSERT INTO sys_role_permission (id,role_id,permission_id,data_rule_ids,operate_date,operate_ip) VALUES
	 ('1427184775972917250','ee8626f80f7c2619917b6236f3a7f02b','109c78a583d4693ce2f16551b7786786',NULL,'2021-08-16 16:25:41','0:0:0:0:0:0:0:1'),
	 ('1427184775972917251','ee8626f80f7c2619917b6236f3a7f02b','1192318987661234177',NULL,'2021-08-16 16:25:41','0:0:0:0:0:0:0:1'),
	 ('1427184775972917252','ee8626f80f7c2619917b6236f3a7f02b','1224641973866467330',NULL,'2021-08-16 16:25:41','0:0:0:0:0:0:0:1'),
	 ('1427184775977111554','ee8626f80f7c2619917b6236f3a7f02b','1229674163694841857',NULL,'2021-08-16 16:25:41','0:0:0:0:0:0:0:1'),
	 ('1427184775977111555','ee8626f80f7c2619917b6236f3a7f02b','1209731624921534465',NULL,'2021-08-16 16:25:41','0:0:0:0:0:0:0:1'),
	 ('1427184775977111556','ee8626f80f7c2619917b6236f3a7f02b','1304032910990495745',NULL,'2021-08-16 16:25:41','0:0:0:0:0:0:0:1'),
	 ('1427184775977111557','ee8626f80f7c2619917b6236f3a7f02b','190c2b43bec6a5f7a4194a85db67d96a',NULL,'2021-08-16 16:25:41','0:0:0:0:0:0:0:1'),
	 ('1427184775977111558','ee8626f80f7c2619917b6236f3a7f02b','1280350452934307841',NULL,'2021-08-16 16:25:41','0:0:0:0:0:0:0:1'),
	 ('1427184775977111559','ee8626f80f7c2619917b6236f3a7f02b','1174506953255182338',NULL,'2021-08-16 16:25:41','0:0:0:0:0:0:0:1'),
	 ('1427184775977111560','ee8626f80f7c2619917b6236f3a7f02b','5c2f42277948043026b7a14692456828',NULL,'2021-08-16 16:25:41','0:0:0:0:0:0:0:1');
INSERT INTO sys_role_permission (id,role_id,permission_id,data_rule_ids,operate_date,operate_ip) VALUES
	 ('1427184775985500162','ee8626f80f7c2619917b6236f3a7f02b','1174590283938041857',NULL,'2021-08-16 16:25:41','0:0:0:0:0:0:0:1'),
	 ('1427184775985500163','ee8626f80f7c2619917b6236f3a7f02b','ebb9d82ea16ad864071158e0c449d186',NULL,'2021-08-16 16:25:41','0:0:0:0:0:0:0:1'),
	 ('1427184775985500164','ee8626f80f7c2619917b6236f3a7f02b','1404684556047024130',NULL,'2021-08-16 16:25:41','0:0:0:0:0:0:0:1'),
	 ('1427184775985500165','ee8626f80f7c2619917b6236f3a7f02b','1265162119913824258',NULL,'2021-08-16 16:25:41','0:0:0:0:0:0:0:1'),
	 ('1427184775989694465','ee8626f80f7c2619917b6236f3a7f02b','841057b8a1bef8f6b4b20f9a618a7fa6',NULL,'2021-08-16 16:25:41','0:0:0:0:0:0:0:1'),
	 ('1427184775989694466','ee8626f80f7c2619917b6236f3a7f02b','700b7f95165c46cc7a78bf227aa8fed3',NULL,'2021-08-16 16:25:41','0:0:0:0:0:0:0:1'),
	 ('1427184775989694467','ee8626f80f7c2619917b6236f3a7f02b','8d1ebd663688965f1fd86a2f0ead3416',NULL,'2021-08-16 16:25:41','0:0:0:0:0:0:0:1'),
	 ('1427184775989694468','ee8626f80f7c2619917b6236f3a7f02b','024f1fd1283dc632458976463d8984e1',NULL,'2021-08-16 16:25:41','0:0:0:0:0:0:0:1'),
	 ('1427184775989694469','ee8626f80f7c2619917b6236f3a7f02b','8b3bff2eee6f1939147f5c68292a1642',NULL,'2021-08-16 16:25:41','0:0:0:0:0:0:0:1'),
	 ('1427184775998083074','ee8626f80f7c2619917b6236f3a7f02b','d07a2c87a451434c99ab06296727ec4f',NULL,'2021-08-16 16:25:41','0:0:0:0:0:0:0:1');
INSERT INTO sys_role_permission (id,role_id,permission_id,data_rule_ids,operate_date,operate_ip) VALUES
	 ('1427184775998083075','ee8626f80f7c2619917b6236f3a7f02b','fc810a2267dd183e4ef7c71cc60f4670',NULL,'2021-08-16 16:25:41','0:0:0:0:0:0:0:1'),
	 ('1427184775998083076','ee8626f80f7c2619917b6236f3a7f02b','97c8629abc7848eccdb6d77c24bb3ebb',NULL,'2021-08-16 16:25:41','0:0:0:0:0:0:0:1'),
	 ('1427184775998083077','ee8626f80f7c2619917b6236f3a7f02b','1287715272999944193',NULL,'2021-08-16 16:25:41','0:0:0:0:0:0:0:1'),
	 ('1427184775998083078','ee8626f80f7c2619917b6236f3a7f02b','1287715783966834689',NULL,'2021-08-16 16:25:41','0:0:0:0:0:0:0:1'),
	 ('1427184776006471682','ee8626f80f7c2619917b6236f3a7f02b','1287716451494510593',NULL,'2021-08-16 16:25:41','0:0:0:0:0:0:0:1'),
	 ('1427184776006471683','ee8626f80f7c2619917b6236f3a7f02b','1287718919049691137',NULL,'2021-08-16 16:25:41','0:0:0:0:0:0:0:1'),
	 ('1427184776006471684','ee8626f80f7c2619917b6236f3a7f02b','1287718938179911682',NULL,'2021-08-16 16:25:41','0:0:0:0:0:0:0:1'),
	 ('1427184776006471685','ee8626f80f7c2619917b6236f3a7f02b','1287718956957810689',NULL,'2021-08-16 16:25:41','0:0:0:0:0:0:0:1'),
	 ('1427184776006471686','ee8626f80f7c2619917b6236f3a7f02b','1166535831146504193',NULL,'2021-08-16 16:25:41','0:0:0:0:0:0:0:1'),
	 ('1427184776006471687','ee8626f80f7c2619917b6236f3a7f02b','9a90363f216a6a08f32eecb3f0bf12a3',NULL,'2021-08-16 16:25:41','0:0:0:0:0:0:0:1');
INSERT INTO sys_role_permission (id,role_id,permission_id,data_rule_ids,operate_date,operate_ip) VALUES
	 ('1427184776014860289','ee8626f80f7c2619917b6236f3a7f02b','4356a1a67b564f0988a484f5531fd4d9',NULL,'2021-08-16 16:25:41','0:0:0:0:0:0:0:1'),
	 ('1427184776014860290','ee8626f80f7c2619917b6236f3a7f02b','655563cd64b75dcf52ef7bcdd4836953',NULL,'2021-08-16 16:25:41','0:0:0:0:0:0:0:1'),
	 ('1427184776014860291','ee8626f80f7c2619917b6236f3a7f02b','1365187528377102337',NULL,'2021-08-16 16:25:41','0:0:0:0:0:0:0:1'),
	 ('1427184776014860292','ee8626f80f7c2619917b6236f3a7f02b','6ad53fd1b220989a8b71ff482d683a5a',NULL,'2021-08-16 16:25:41','0:0:0:0:0:0:0:1'),
	 ('1427184776014860293','ee8626f80f7c2619917b6236f3a7f02b','7960961b0063228937da5fa8dd73d371',NULL,'2021-08-16 16:25:41','0:0:0:0:0:0:0:1'),
	 ('1427184776014860294','ee8626f80f7c2619917b6236f3a7f02b','1387612436586065922',NULL,'2021-08-16 16:25:41','0:0:0:0:0:0:0:1'),
	 ('1427184776014860295','ee8626f80f7c2619917b6236f3a7f02b','043780fa095ff1b2bec4dc406d76f023',NULL,'2021-08-16 16:25:41','0:0:0:0:0:0:0:1'),
	 ('1427184776023248897','ee8626f80f7c2619917b6236f3a7f02b','0620e402857b8c5b605e1ad9f4b89350',NULL,'2021-08-16 16:25:41','0:0:0:0:0:0:0:1'),
	 ('1427184776023248898','ee8626f80f7c2619917b6236f3a7f02b','c431130c0bc0ec71b0a5be37747bb36a',NULL,'2021-08-16 16:25:41','0:0:0:0:0:0:0:1'),
	 ('1427184776023248899','ee8626f80f7c2619917b6236f3a7f02b','e1979bb53e9ea51cecc74d86fd9d2f64',NULL,'2021-08-16 16:25:41','0:0:0:0:0:0:0:1');
INSERT INTO sys_role_permission (id,role_id,permission_id,data_rule_ids,operate_date,operate_ip) VALUES
	 ('145eac8dd88eddbd4ce0a800ab40a92c','e51758fa916c881624b046d26bd09230','08e6b9dc3c04489c8e1ff2ce6f105aa4',NULL,NULL,NULL),
	 ('1496429874513534978','f6817f48af4fb3af11b9e8bf182f618b','1494641317580423169',NULL,'2022-02-23 18:20:59','0:0:0:0:0:0:0:1'),
	 ('1522909726999498754','f6817f48af4fb3af11b9e8bf182f618b','121008911426059sc9473',NULL,'2022-05-07 20:02:28','127.0.0.1'),
	 ('1522909726999498755','f6817f48af4fb3af11b9e8bf182f618b','121008911426059sc9472',NULL,'2022-05-07 20:02:28','127.0.0.1'),
	 ('1522909726999498756','f6817f48af4fb3af11b9e8bf182f618b','121008911426059sc9471',NULL,'2022-05-07 20:02:28','127.0.0.1'),
	 ('1522910722202980354','f6817f48af4fb3af11b9e8bf182f618b','121008911426059sc94722',NULL,'2022-05-07 20:06:25','127.0.0.1'),
	 ('1523502432196915202','f6817f48af4fb3af11b9e8bf182f618b','121008911426059sc94711',NULL,'2022-05-09 11:17:40','127.0.0.1'),
	 ('154edd0599bd1dc2c7de220b489cd1e2','f6817f48af4fb3af11b9e8bf182f618b','7ac9eb9ccbde2f7a033cd4944272bf1e',NULL,NULL,NULL),
	 ('1580861542625955842','f6817f48af4fb3af11b9e8bf182f618b','1170592628746878978',NULL,'2022-10-14 18:02:17','0:0:0:0:0:0:0:1'),
	 ('1592114400605859842','f6817f48af4fb3af11b9e8bf182f618b','1592113148350263298',NULL,'2022-11-14 19:17:08','127.0.0.1');
INSERT INTO sys_role_permission (id,role_id,permission_id,data_rule_ids,operate_date,operate_ip) VALUES
	 ('1593153006353473537','f6817f48af4fb3af11b9e8bf182f618b','1588513553652436993',NULL,'2022-11-17 16:04:11','0:0:0:0:0:0:0:1'),
	 ('1593153006353473538','f6817f48af4fb3af11b9e8bf182f618b','1592114574275211265',NULL,'2022-11-17 16:04:11','0:0:0:0:0:0:0:1'),
	 ('1593153006353473539','f6817f48af4fb3af11b9e8bf182f618b','1592114652566089729',NULL,'2022-11-17 16:04:11','0:0:0:0:0:0:0:1'),
	 ('1593153006353473540','f6817f48af4fb3af11b9e8bf182f618b','1592115213910765570',NULL,'2022-11-17 16:04:11','0:0:0:0:0:0:0:1'),
	 ('1593153006353473541','f6817f48af4fb3af11b9e8bf182f618b','1592115162379546625',NULL,'2022-11-17 16:04:11','0:0:0:0:0:0:0:1'),
	 ('1593153006353473542','f6817f48af4fb3af11b9e8bf182f618b','1592115115361398786',NULL,'2022-11-17 16:04:11','0:0:0:0:0:0:0:1'),
	 ('1593153006353473543','f6817f48af4fb3af11b9e8bf182f618b','1592115070432014338',NULL,'2022-11-17 16:04:11','0:0:0:0:0:0:0:1'),
	 ('1593153006353473544','f6817f48af4fb3af11b9e8bf182f618b','1592114955650691074',NULL,'2022-11-17 16:04:11','0:0:0:0:0:0:0:1'),
	 ('1593153006353473545','f6817f48af4fb3af11b9e8bf182f618b','1592114893302362114',NULL,'2022-11-17 16:04:11','0:0:0:0:0:0:0:1'),
	 ('1593153006353473546','f6817f48af4fb3af11b9e8bf182f618b','1592114823467200514',NULL,'2022-11-17 16:04:11','0:0:0:0:0:0:0:1');
INSERT INTO sys_role_permission (id,role_id,permission_id,data_rule_ids,operate_date,operate_ip) VALUES
	 ('1593153006353473547','f6817f48af4fb3af11b9e8bf182f618b','1592114772665790465',NULL,'2022-11-17 16:04:11','0:0:0:0:0:0:0:1'),
	 ('1593153006416388098','f6817f48af4fb3af11b9e8bf182f618b','1592114721138765826',NULL,'2022-11-17 16:04:11','0:0:0:0:0:0:0:1'),
	 ('1593153006416388099','f6817f48af4fb3af11b9e8bf182f618b','1260929666434318338',NULL,'2022-11-17 16:04:11','0:0:0:0:0:0:0:1'),
	 ('1593153006416388100','f6817f48af4fb3af11b9e8bf182f618b','1592120323667750914',NULL,'2022-11-17 16:04:11','0:0:0:0:0:0:0:1'),
	 ('1593153006416388101','f6817f48af4fb3af11b9e8bf182f618b','1592120372296511490',NULL,'2022-11-17 16:04:11','0:0:0:0:0:0:0:1'),
	 ('1593153006416388102','f6817f48af4fb3af11b9e8bf182f618b','1592120427007012865',NULL,'2022-11-17 16:04:11','0:0:0:0:0:0:0:1'),
	 ('1593153006416388103','f6817f48af4fb3af11b9e8bf182f618b','1592120484120850434',NULL,'2022-11-17 16:04:11','0:0:0:0:0:0:0:1'),
	 ('1593153006416388104','f6817f48af4fb3af11b9e8bf182f618b','1592120594695286785',NULL,'2022-11-17 16:04:11','0:0:0:0:0:0:0:1'),
	 ('1593153006416388105','f6817f48af4fb3af11b9e8bf182f618b','1592120649007329281',NULL,'2022-11-17 16:04:11','0:0:0:0:0:0:0:1'),
	 ('1593153006416388106','f6817f48af4fb3af11b9e8bf182f618b','1592112984361365505',NULL,'2022-11-17 16:04:11','0:0:0:0:0:0:0:1');
INSERT INTO sys_role_permission (id,role_id,permission_id,data_rule_ids,operate_date,operate_ip) VALUES
	 ('1593153006416388107','f6817f48af4fb3af11b9e8bf182f618b','1592115914493751297',NULL,'2022-11-17 16:04:11','0:0:0:0:0:0:0:1'),
	 ('1593153006416388108','f6817f48af4fb3af11b9e8bf182f618b','1592116663936184322',NULL,'2022-11-17 16:04:11','0:0:0:0:0:0:0:1'),
	 ('1593153006416388109','f6817f48af4fb3af11b9e8bf182f618b','1592118604640645122',NULL,'2022-11-17 16:04:11','0:0:0:0:0:0:0:1'),
	 ('1593153006416388110','f6817f48af4fb3af11b9e8bf182f618b','1592118648315932674',NULL,'2022-11-17 16:04:11','0:0:0:0:0:0:0:1'),
	 ('1593153006416388111','f6817f48af4fb3af11b9e8bf182f618b','1592119001883176961',NULL,'2022-11-17 16:04:11','0:0:0:0:0:0:0:1'),
	 ('1593153006416388112','f6817f48af4fb3af11b9e8bf182f618b','1592120052866707457',NULL,'2022-11-17 16:04:11','0:0:0:0:0:0:0:1'),
	 ('1593153006416388113','f6817f48af4fb3af11b9e8bf182f618b','1592115712466710529',NULL,'2022-11-17 16:04:11','0:0:0:0:0:0:0:1'),
	 ('1593153006416388114','f6817f48af4fb3af11b9e8bf182f618b','1592117222764277761',NULL,'2022-11-17 16:04:11','0:0:0:0:0:0:0:1'),
	 ('1593153006416388115','f6817f48af4fb3af11b9e8bf182f618b','1592117276539449345',NULL,'2022-11-17 16:04:11','0:0:0:0:0:0:0:1'),
	 ('1593153006416388116','f6817f48af4fb3af11b9e8bf182f618b','1592117377299214337',NULL,'2022-11-17 16:04:11','0:0:0:0:0:0:0:1');
INSERT INTO sys_role_permission (id,role_id,permission_id,data_rule_ids,operate_date,operate_ip) VALUES
	 ('1593153006416388117','f6817f48af4fb3af11b9e8bf182f618b','1592117422006300673',NULL,'2022-11-17 16:04:11','0:0:0:0:0:0:0:1'),
	 ('1593153006416388118','f6817f48af4fb3af11b9e8bf182f618b','1592120222727630849',NULL,'2022-11-17 16:04:11','0:0:0:0:0:0:0:1'),
	 ('1593153006416388119','f6817f48af4fb3af11b9e8bf182f618b','1592118053634928641',NULL,'2022-11-17 16:04:11','0:0:0:0:0:0:0:1'),
	 ('1593153006416388120','f6817f48af4fb3af11b9e8bf182f618b','1592117990305132545',NULL,'2022-11-17 16:04:11','0:0:0:0:0:0:0:1'),
	 ('1593153006416388121','f6817f48af4fb3af11b9e8bf182f618b','1592117804359053314',NULL,'2022-11-17 16:04:11','0:0:0:0:0:0:0:1'),
	 ('1593153006416388122','f6817f48af4fb3af11b9e8bf182f618b','1592117748209905665',NULL,'2022-11-17 16:04:11','0:0:0:0:0:0:0:1'),
	 ('1593153006416388123','f6817f48af4fb3af11b9e8bf182f618b','1592117625664925697',NULL,'2022-11-17 16:04:11','0:0:0:0:0:0:0:1'),
	 ('1593153006416388124','f6817f48af4fb3af11b9e8bf182f618b','1592118192218927105',NULL,'2022-11-17 16:04:11','0:0:0:0:0:0:0:1'),
	 ('1593153006416388125','f6817f48af4fb3af11b9e8bf182f618b','1592118254844080130',NULL,'2022-11-17 16:04:11','0:0:0:0:0:0:0:1'),
	 ('1593153006416388126','f6817f48af4fb3af11b9e8bf182f618b','1592118306983473154',NULL,'2022-11-17 16:04:11','0:0:0:0:0:0:0:1');
INSERT INTO sys_role_permission (id,role_id,permission_id,data_rule_ids,operate_date,operate_ip) VALUES
	 ('1593153006416388127','f6817f48af4fb3af11b9e8bf182f618b','1592118356778250241',NULL,'2022-11-17 16:04:11','0:0:0:0:0:0:0:1'),
	 ('1593153006416388128','f6817f48af4fb3af11b9e8bf182f618b','1592118414990995457',NULL,'2022-11-17 16:04:11','0:0:0:0:0:0:0:1'),
	 ('1593153006416388129','f6817f48af4fb3af11b9e8bf182f618b','1592118497606201346',NULL,'2022-11-17 16:04:11','0:0:0:0:0:0:0:1'),
	 ('1593153065098895362','f6817f48af4fb3af11b9e8bf182f618b','1235823781053313025',NULL,'2022-11-17 16:04:25','0:0:0:0:0:0:0:1'),
	 ('1593153065098895363','f6817f48af4fb3af11b9e8bf182f618b','1304032910990495745',NULL,'2022-11-17 16:04:25','0:0:0:0:0:0:0:1'),
	 ('1593153077300125697','f6817f48af4fb3af11b9e8bf182f618b','1592115610431877122',NULL,'2022-11-17 16:04:28','0:0:0:0:0:0:0:1'),
	 ('1632635480313671681','e51758fa916c881624b046d26bd09230','9502685863ab87f0ad1134142788a385',NULL,'2023-03-06 14:53:26','127.0.0.1'),
	 ('1647261253995696134','f6817f48af4fb3af11b9e8bf182f618b','1592135223910765570',NULL,'2023-04-15 23:31:02','0:0:0:0:0:0:0:1'),
	 ('1647261253995696135','f6817f48af4fb3af11b9e8bf182f618b','1593185714482880514',NULL,'2023-04-15 23:31:02','0:0:0:0:0:0:0:1'),
	 ('1647261253995696136','f6817f48af4fb3af11b9e8bf182f618b','15c92115213910765570',NULL,'2023-04-15 23:31:02','0:0:0:0:0:0:0:1');
INSERT INTO sys_role_permission (id,role_id,permission_id,data_rule_ids,operate_date,operate_ip) VALUES
	 ('1647261253995696137','f6817f48af4fb3af11b9e8bf182f618b','1d592115213910765570',NULL,'2023-04-15 23:31:02','0:0:0:0:0:0:0:1'),
	 ('1647261253995696138','f6817f48af4fb3af11b9e8bf182f618b','1214376304951664642',NULL,'2023-04-15 23:31:02','0:0:0:0:0:0:0:1'),
	 ('1647261253995696139','f6817f48af4fb3af11b9e8bf182f618b','1214462306546319362',NULL,'2023-04-15 23:31:02','0:0:0:0:0:0:0:1'),
	 ('1647261253995696140','f6817f48af4fb3af11b9e8bf182f618b','1a0811914300741f4e11838ff37a1d3a',NULL,'2023-04-15 23:31:02','0:0:0:0:0:0:0:1'),
	 ('1647261253995696141','f6817f48af4fb3af11b9e8bf182f618b','1438108176814825473',NULL,'2023-04-15 23:31:02','0:0:0:0:0:0:0:1'),
	 ('1647261253995696142','f6817f48af4fb3af11b9e8bf182f618b','1438108176273760258',NULL,'2023-04-15 23:31:02','0:0:0:0:0:0:0:1'),
	 ('1647261253995696143','f6817f48af4fb3af11b9e8bf182f618b','1592120224120850434',NULL,'2023-04-15 23:31:02','0:0:0:0:0:0:0:1'),
	 ('1647261253995696144','f6817f48af4fb3af11b9e8bf182f618b','1600105607009165314',NULL,'2023-04-15 23:31:02','0:0:0:0:0:0:0:1'),
	 ('1647261253995696145','f6817f48af4fb3af11b9e8bf182f618b','1600108123037917186',NULL,'2023-04-15 23:31:02','0:0:0:0:0:0:0:1'),
	 ('1647261253995696146','f6817f48af4fb3af11b9e8bf182f618b','1600129606082650113',NULL,'2023-04-15 23:31:02','0:0:0:0:0:0:0:1');
INSERT INTO sys_role_permission (id,role_id,permission_id,data_rule_ids,operate_date,operate_ip) VALUES
	 ('1647261253999890434','f6817f48af4fb3af11b9e8bf182f618b','1611620416187969538',NULL,'2023-04-15 23:31:02','0:0:0:0:0:0:0:1'),
	 ('1647261253999890435','f6817f48af4fb3af11b9e8bf182f618b','1611620600003342337',NULL,'2023-04-15 23:31:02','0:0:0:0:0:0:0:1'),
	 ('1647261253999890436','f6817f48af4fb3af11b9e8bf182f618b','1611620654621569026',NULL,'2023-04-15 23:31:02','0:0:0:0:0:0:0:1'),
	 ('1647261253999890437','f6817f48af4fb3af11b9e8bf182f618b','1611620772498218641',NULL,'2023-04-15 23:31:02','0:0:0:0:0:0:0:1'),
	 ('1647261253999890438','f6817f48af4fb3af11b9e8bf182f618b','1611620772498288641',NULL,'2023-04-15 23:31:02','0:0:0:0:0:0:0:1'),
	 ('1647261253999890439','f6817f48af4fb3af11b9e8bf182f618b','1611650772498288641',NULL,'2023-04-15 23:31:02','0:0:0:0:0:0:0:1'),
	 ('1647261253999890440','f6817f48af4fb3af11b9e8bf182f618b','1612438989792034818',NULL,'2023-04-15 23:31:02','0:0:0:0:0:0:0:1'),
	 ('1647261253999890441','f6817f48af4fb3af11b9e8bf182f618b','1613620712498288641',NULL,'2023-04-15 23:31:02','0:0:0:0:0:0:0:1'),
	 ('1647261253999890442','f6817f48af4fb3af11b9e8bf182f618b','1620261087828418562',NULL,'2023-04-15 23:31:02','0:0:0:0:0:0:0:1'),
	 ('1647261253999890443','f6817f48af4fb3af11b9e8bf182f618b','1620305415648989186',NULL,'2023-04-15 23:31:02','0:0:0:0:0:0:0:1');
INSERT INTO sys_role_permission (id,role_id,permission_id,data_rule_ids,operate_date,operate_ip) VALUES
	 ('1647261253999890444','f6817f48af4fb3af11b9e8bf182f618b','1620327825894981634',NULL,'2023-04-15 23:31:02','0:0:0:0:0:0:0:1'),
	 ('1647261253999890445','f6817f48af4fb3af11b9e8bf182f618b','1621620772498288641',NULL,'2023-04-15 23:31:02','0:0:0:0:0:0:0:1'),
	 ('1647261253999890446','f6817f48af4fb3af11b9e8bf182f618b','1697220712498288641',NULL,'2023-04-15 23:31:02','0:0:0:0:0:0:0:1'),
	 ('1647261254004084737','f6817f48af4fb3af11b9e8bf182f618b','1438782641187074050',NULL,'2023-04-15 23:31:02','0:0:0:0:0:0:0:1'),
	 ('1647261254004084738','f6817f48af4fb3af11b9e8bf182f618b','1593160905216663554',NULL,'2023-04-15 23:31:02','0:0:0:0:0:0:0:1'),
	 ('1647261254004084739','f6817f48af4fb3af11b9e8bf182f618b','1593160959633563650',NULL,'2023-04-15 23:31:02','0:0:0:0:0:0:0:1'),
	 ('1647261254004084740','f6817f48af4fb3af11b9e8bf182f618b','1593161025790320641',NULL,'2023-04-15 23:31:02','0:0:0:0:0:0:0:1'),
	 ('1647261254004084741','f6817f48af4fb3af11b9e8bf182f618b','1593161089787011074',NULL,'2023-04-15 23:31:02','0:0:0:0:0:0:0:1'),
	 ('1647261254004084742','f6817f48af4fb3af11b9e8bf182f618b','1438782851980210178',NULL,'2023-04-15 23:31:02','0:0:0:0:0:0:0:1'),
	 ('1647261254004084743','f6817f48af4fb3af11b9e8bf182f618b','1438469604861403137',NULL,'2023-04-15 23:31:02','0:0:0:0:0:0:0:1');
INSERT INTO sys_role_permission (id,role_id,permission_id,data_rule_ids,operate_date,operate_ip) VALUES
	 ('1647261254004084744','f6817f48af4fb3af11b9e8bf182f618b','1438782530717495298',NULL,'2023-04-15 23:31:02','0:0:0:0:0:0:0:1'),
	 ('1647261254004084745','f6817f48af4fb3af11b9e8bf182f618b','1455735714507472898',NULL,'2023-04-15 23:31:02','0:0:0:0:0:0:0:1'),
	 ('1647261254008279042','f6817f48af4fb3af11b9e8bf182f618b','1596141938193747970',NULL,'2023-04-15 23:31:02','0:0:0:0:0:0:0:1'),
	 ('1647261254008279043','f6817f48af4fb3af11b9e8bf182f618b','1596335805278990338',NULL,'2023-04-15 23:31:02','0:0:0:0:0:0:0:1'),
	 ('1647261254008279047','f6817f48af4fb3af11b9e8bf182f618b','1439398677984878593',NULL,'2023-04-15 23:31:02','0:0:0:0:0:0:0:1'),
	 ('1647261254008279048','f6817f48af4fb3af11b9e8bf182f618b','1439399179791409153',NULL,'2023-04-15 23:31:02','0:0:0:0:0:0:0:1'),
	 ('1647261254008279049','f6817f48af4fb3af11b9e8bf182f618b','1593161421350936578',NULL,'2023-04-15 23:31:02','0:0:0:0:0:0:0:1'),
	 ('1647261254008279050','f6817f48af4fb3af11b9e8bf182f618b','1439488251473993730',NULL,'2023-04-15 23:31:02','0:0:0:0:0:0:0:1'),
	 ('1647261254008279051','f6817f48af4fb3af11b9e8bf182f618b','1593161483627962370',NULL,'2023-04-15 23:31:02','0:0:0:0:0:0:0:1'),
	 ('1647261254008279052','f6817f48af4fb3af11b9e8bf182f618b','1593161551202394114',NULL,'2023-04-15 23:31:02','0:0:0:0:0:0:0:1');
INSERT INTO sys_role_permission (id,role_id,permission_id,data_rule_ids,operate_date,operate_ip) VALUES
	 ('1647261254008279053','f6817f48af4fb3af11b9e8bf182f618b','1593161608362369026',NULL,'2023-04-15 23:31:02','0:0:0:0:0:0:0:1'),
	 ('1647261254008279054','f6817f48af4fb3af11b9e8bf182f618b','1593161657385394177',NULL,'2023-04-15 23:31:02','0:0:0:0:0:0:0:1'),
	 ('1647261254008279055','f6817f48af4fb3af11b9e8bf182f618b','1593161697348722689',NULL,'2023-04-15 23:31:02','0:0:0:0:0:0:0:1'),
	 ('1647261254012473346','f6817f48af4fb3af11b9e8bf182f618b','1593161743607701505',NULL,'2023-04-15 23:31:02','0:0:0:0:0:0:0:1'),
	 ('1647261254012473347','f6817f48af4fb3af11b9e8bf182f618b','1439511654494937090',NULL,'2023-04-15 23:31:02','0:0:0:0:0:0:0:1'),
	 ('1647261254012473348','f6817f48af4fb3af11b9e8bf182f618b','1439531077792473089',NULL,'2023-04-15 23:31:02','0:0:0:0:0:0:0:1'),
	 ('1647261254012473349','f6817f48af4fb3af11b9e8bf182f618b','1439533711676973057',NULL,'2023-04-15 23:31:02','0:0:0:0:0:0:0:1'),
	 ('1647261254012473350','f6817f48af4fb3af11b9e8bf182f618b','1439784356766064642',NULL,'2023-04-15 23:31:02','0:0:0:0:0:0:0:1'),
	 ('1647261254012473351','f6817f48af4fb3af11b9e8bf182f618b','1439797053314342913',NULL,'2023-04-15 23:31:02','0:0:0:0:0:0:0:1'),
	 ('1647261254012473352','f6817f48af4fb3af11b9e8bf182f618b','1439839507094740994',NULL,'2023-04-15 23:31:02','0:0:0:0:0:0:0:1');
INSERT INTO sys_role_permission (id,role_id,permission_id,data_rule_ids,operate_date,operate_ip) VALUES
	 ('1647261254012473353','f6817f48af4fb3af11b9e8bf182f618b','1439842640030113793',NULL,'2023-04-15 23:31:02','0:0:0:0:0:0:0:1'),
	 ('1647261254012473354','f6817f48af4fb3af11b9e8bf182f618b','1594930803956920321',NULL,'2023-04-15 23:31:02','0:0:0:0:0:0:0:1'),
	 ('1647429400635719681','f6817f48af4fb3af11b9e8bf182f618b','2023041610053670010',NULL,'2023-04-16 10:39:12','0:0:0:0:0:0:0:1'),
	 ('1647429400644108289','f6817f48af4fb3af11b9e8bf182f618b','2023041610121570270',NULL,'2023-04-16 10:39:12','0:0:0:0:0:0:0:1'),
	 ('1647430064820535297','f6817f48af4fb3af11b9e8bf182f618b','2023041610053680011',NULL,'2023-04-16 10:41:50','0:0:0:0:0:0:0:1'),
	 ('1647430064828923906','f6817f48af4fb3af11b9e8bf182f618b','2023041610053680012',NULL,'2023-04-16 10:41:50','0:0:0:0:0:0:0:1'),
	 ('1647430064828923907','f6817f48af4fb3af11b9e8bf182f618b','2023041610053680013',NULL,'2023-04-16 10:41:50','0:0:0:0:0:0:0:1'),
	 ('1647430064828923908','f6817f48af4fb3af11b9e8bf182f618b','2023041610053680014',NULL,'2023-04-16 10:41:50','0:0:0:0:0:0:0:1'),
	 ('1647430064828923909','f6817f48af4fb3af11b9e8bf182f618b','2023041610053680015',NULL,'2023-04-16 10:41:50','0:0:0:0:0:0:0:1'),
	 ('1647430064833118210','f6817f48af4fb3af11b9e8bf182f618b','2023041610053680016',NULL,'2023-04-16 10:41:50','0:0:0:0:0:0:0:1');
INSERT INTO sys_role_permission (id,role_id,permission_id,data_rule_ids,operate_date,operate_ip) VALUES
	 ('1647430064833118211','f6817f48af4fb3af11b9e8bf182f618b','2023041610121570271',NULL,'2023-04-16 10:41:50','0:0:0:0:0:0:0:1'),
	 ('1647430064833118212','f6817f48af4fb3af11b9e8bf182f618b','2023041610121570272',NULL,'2023-04-16 10:41:50','0:0:0:0:0:0:0:1'),
	 ('1647430064833118213','f6817f48af4fb3af11b9e8bf182f618b','2023041610121570273',NULL,'2023-04-16 10:41:50','0:0:0:0:0:0:0:1'),
	 ('1647430064833118214','f6817f48af4fb3af11b9e8bf182f618b','2023041610121570274',NULL,'2023-04-16 10:41:50','0:0:0:0:0:0:0:1'),
	 ('1647430064833118215','f6817f48af4fb3af11b9e8bf182f618b','2023041610121570275',NULL,'2023-04-16 10:41:50','0:0:0:0:0:0:0:1'),
	 ('1647430064833118216','f6817f48af4fb3af11b9e8bf182f618b','2023041610121570276',NULL,'2023-04-16 10:41:50','0:0:0:0:0:0:0:1'),
	 ('1647432055940562945','f6817f48af4fb3af11b9e8bf182f618b','1647430912296435713',NULL,'2023-04-16 10:49:45','0:0:0:0:0:0:0:1'),
	 ('1647449174187008001','f6817f48af4fb3af11b9e8bf182f618b','2023041611346300020',NULL,'2023-04-16 11:57:46','0:0:0:0:0:0:0:1'),
	 ('1647449174195396609','f6817f48af4fb3af11b9e8bf182f618b','2023041611346300021',NULL,'2023-04-16 11:57:46','0:0:0:0:0:0:0:1'),
	 ('1647449174195396610','f6817f48af4fb3af11b9e8bf182f618b','2023041611346310022',NULL,'2023-04-16 11:57:46','0:0:0:0:0:0:0:1');
INSERT INTO sys_role_permission (id,role_id,permission_id,data_rule_ids,operate_date,operate_ip) VALUES
	 ('1647449174195396611','f6817f48af4fb3af11b9e8bf182f618b','2023041611346310023',NULL,'2023-04-16 11:57:46','0:0:0:0:0:0:0:1'),
	 ('1647449174195396612','f6817f48af4fb3af11b9e8bf182f618b','2023041611346310024',NULL,'2023-04-16 11:57:46','0:0:0:0:0:0:0:1'),
	 ('1647449174195396613','f6817f48af4fb3af11b9e8bf182f618b','2023041611346310025',NULL,'2023-04-16 11:57:46','0:0:0:0:0:0:0:1'),
	 ('1647449174195396614','f6817f48af4fb3af11b9e8bf182f618b','2023041611346310026',NULL,'2023-04-16 11:57:46','0:0:0:0:0:0:0:1'),
	 ('1647580323978764290','f6817f48af4fb3af11b9e8bf182f618b','2023041608168730410',NULL,'2023-04-16 20:38:54','0:0:0:0:0:0:0:1'),
	 ('1647580323987152897','f6817f48af4fb3af11b9e8bf182f618b','2023041608168730411',NULL,'2023-04-16 20:38:54','0:0:0:0:0:0:0:1'),
	 ('1647580323987152898','f6817f48af4fb3af11b9e8bf182f618b','2023041608168730412',NULL,'2023-04-16 20:38:54','0:0:0:0:0:0:0:1'),
	 ('1647580323991347201','f6817f48af4fb3af11b9e8bf182f618b','2023041608168730413',NULL,'2023-04-16 20:38:54','0:0:0:0:0:0:0:1'),
	 ('1647580323991347202','f6817f48af4fb3af11b9e8bf182f618b','2023041608168730414',NULL,'2023-04-16 20:38:54','0:0:0:0:0:0:0:1'),
	 ('1647580323991347203','f6817f48af4fb3af11b9e8bf182f618b','2023041608168730415',NULL,'2023-04-16 20:38:54','0:0:0:0:0:0:0:1');
INSERT INTO sys_role_permission (id,role_id,permission_id,data_rule_ids,operate_date,operate_ip) VALUES
	 ('1647580323991347204','f6817f48af4fb3af11b9e8bf182f618b','2023041608168730416',NULL,'2023-04-16 20:38:54','0:0:0:0:0:0:0:1'),
	 ('1647580323991347205','f6817f48af4fb3af11b9e8bf182f618b','2023041607073870410',NULL,'2023-04-16 20:38:54','0:0:0:0:0:0:0:1'),
	 ('1647580323991347206','f6817f48af4fb3af11b9e8bf182f618b','2023041607073870412',NULL,'2023-04-16 20:38:54','0:0:0:0:0:0:0:1'),
	 ('1647580323991347207','f6817f48af4fb3af11b9e8bf182f618b','2023041607073870411',NULL,'2023-04-16 20:38:54','0:0:0:0:0:0:0:1'),
	 ('1647580323991347208','f6817f48af4fb3af11b9e8bf182f618b','2023041607073870413',NULL,'2023-04-16 20:38:54','0:0:0:0:0:0:0:1'),
	 ('1647580323995541505','f6817f48af4fb3af11b9e8bf182f618b','2023041607073870414',NULL,'2023-04-16 20:38:54','0:0:0:0:0:0:0:1'),
	 ('1647580323995541506','f6817f48af4fb3af11b9e8bf182f618b','2023041607073870416',NULL,'2023-04-16 20:38:54','0:0:0:0:0:0:0:1'),
	 ('1647580323995541507','f6817f48af4fb3af11b9e8bf182f618b','2023041607073870415',NULL,'2023-04-16 20:38:54','0:0:0:0:0:0:0:1'),
	 ('1647580323995541508','f6817f48af4fb3af11b9e8bf182f618b','2023041607082460450',NULL,'2023-04-16 20:38:54','0:0:0:0:0:0:0:1'),
	 ('1647580323995541509','f6817f48af4fb3af11b9e8bf182f618b','2023041607082460451',NULL,'2023-04-16 20:38:54','0:0:0:0:0:0:0:1');
INSERT INTO sys_role_permission (id,role_id,permission_id,data_rule_ids,operate_date,operate_ip) VALUES
	 ('1647580323995541510','f6817f48af4fb3af11b9e8bf182f618b','2023041607082460452',NULL,'2023-04-16 20:38:54','0:0:0:0:0:0:0:1'),
	 ('1647580323995541511','f6817f48af4fb3af11b9e8bf182f618b','2023041607082460453',NULL,'2023-04-16 20:38:54','0:0:0:0:0:0:0:1'),
	 ('1647580323995541512','f6817f48af4fb3af11b9e8bf182f618b','2023041607082460454',NULL,'2023-04-16 20:38:54','0:0:0:0:0:0:0:1'),
	 ('1647580323999735810','f6817f48af4fb3af11b9e8bf182f618b','2023041607082460455',NULL,'2023-04-16 20:38:54','0:0:0:0:0:0:0:1'),
	 ('1647580323999735811','f6817f48af4fb3af11b9e8bf182f618b','2023041607082460456',NULL,'2023-04-16 20:38:54','0:0:0:0:0:0:0:1'),
	 ('1647580323999735812','f6817f48af4fb3af11b9e8bf182f618b','2023041607099920030',NULL,'2023-04-16 20:38:54','0:0:0:0:0:0:0:1'),
	 ('1647580323999735813','f6817f48af4fb3af11b9e8bf182f618b','2023041607099920031',NULL,'2023-04-16 20:38:54','0:0:0:0:0:0:0:1'),
	 ('1647580323999735814','f6817f48af4fb3af11b9e8bf182f618b','2023041607099920032',NULL,'2023-04-16 20:38:54','0:0:0:0:0:0:0:1'),
	 ('1647580323999735815','f6817f48af4fb3af11b9e8bf182f618b','2023041607099920033',NULL,'2023-04-16 20:38:54','0:0:0:0:0:0:0:1'),
	 ('1647580323999735816','f6817f48af4fb3af11b9e8bf182f618b','2023041607099920034',NULL,'2023-04-16 20:38:54','0:0:0:0:0:0:0:1');
INSERT INTO sys_role_permission (id,role_id,permission_id,data_rule_ids,operate_date,operate_ip) VALUES
	 ('1647580324003930113','f6817f48af4fb3af11b9e8bf182f618b','2023041607099920035',NULL,'2023-04-16 20:38:54','0:0:0:0:0:0:0:1'),
	 ('1647580324003930114','f6817f48af4fb3af11b9e8bf182f618b','2023041607099920036',NULL,'2023-04-16 20:38:54','0:0:0:0:0:0:0:1'),
	 ('1647580324003930115','f6817f48af4fb3af11b9e8bf182f618b','2023041607317220560',NULL,'2023-04-16 20:38:54','0:0:0:0:0:0:0:1'),
	 ('1647580324003930116','f6817f48af4fb3af11b9e8bf182f618b','2023041607317220561',NULL,'2023-04-16 20:38:54','0:0:0:0:0:0:0:1'),
	 ('1647580324003930117','f6817f48af4fb3af11b9e8bf182f618b','2023041607317220562',NULL,'2023-04-16 20:38:54','0:0:0:0:0:0:0:1'),
	 ('1647580324003930118','f6817f48af4fb3af11b9e8bf182f618b','2023041607317220563',NULL,'2023-04-16 20:38:54','0:0:0:0:0:0:0:1'),
	 ('1647580324003930119','f6817f48af4fb3af11b9e8bf182f618b','2023041607317220564',NULL,'2023-04-16 20:38:54','0:0:0:0:0:0:0:1'),
	 ('1647580324003930120','f6817f48af4fb3af11b9e8bf182f618b','2023041607317220565',NULL,'2023-04-16 20:38:54','0:0:0:0:0:0:0:1'),
	 ('1647580324008124417','f6817f48af4fb3af11b9e8bf182f618b','2023041607317220566',NULL,'2023-04-16 20:38:54','0:0:0:0:0:0:0:1'),
	 ('1647580324008124418','f6817f48af4fb3af11b9e8bf182f618b','2023041607439020540',NULL,'2023-04-16 20:38:54','0:0:0:0:0:0:0:1');
INSERT INTO sys_role_permission (id,role_id,permission_id,data_rule_ids,operate_date,operate_ip) VALUES
	 ('1647580324008124419','f6817f48af4fb3af11b9e8bf182f618b','2023041607439020542',NULL,'2023-04-16 20:38:54','0:0:0:0:0:0:0:1'),
	 ('1647580324008124420','f6817f48af4fb3af11b9e8bf182f618b','2023041607439020541',NULL,'2023-04-16 20:38:54','0:0:0:0:0:0:0:1'),
	 ('1647580324008124421','f6817f48af4fb3af11b9e8bf182f618b','2023041607439020543',NULL,'2023-04-16 20:38:54','0:0:0:0:0:0:0:1'),
	 ('1647580324008124422','f6817f48af4fb3af11b9e8bf182f618b','2023041607439020544',NULL,'2023-04-16 20:38:54','0:0:0:0:0:0:0:1'),
	 ('1647580324008124423','f6817f48af4fb3af11b9e8bf182f618b','2023041607439020545',NULL,'2023-04-16 20:38:54','0:0:0:0:0:0:0:1'),
	 ('1647580324008124424','f6817f48af4fb3af11b9e8bf182f618b','2023041607439020546',NULL,'2023-04-16 20:38:54','0:0:0:0:0:0:0:1'),
	 ('1647580324012318722','f6817f48af4fb3af11b9e8bf182f618b','2023041608019580490',NULL,'2023-04-16 20:38:54','0:0:0:0:0:0:0:1'),
	 ('1647580324012318723','f6817f48af4fb3af11b9e8bf182f618b','2023041608019580491',NULL,'2023-04-16 20:38:54','0:0:0:0:0:0:0:1'),
	 ('1647580324012318724','f6817f48af4fb3af11b9e8bf182f618b','2023041608019580492',NULL,'2023-04-16 20:38:54','0:0:0:0:0:0:0:1'),
	 ('1647580324012318725','f6817f48af4fb3af11b9e8bf182f618b','2023041608019580493',NULL,'2023-04-16 20:38:54','0:0:0:0:0:0:0:1');
INSERT INTO sys_role_permission (id,role_id,permission_id,data_rule_ids,operate_date,operate_ip) VALUES
	 ('1647580324012318726','f6817f48af4fb3af11b9e8bf182f618b','2023041608019580494',NULL,'2023-04-16 20:38:54','0:0:0:0:0:0:0:1'),
	 ('1647580324016513025','f6817f48af4fb3af11b9e8bf182f618b','2023041608019580495',NULL,'2023-04-16 20:38:54','0:0:0:0:0:0:0:1'),
	 ('1647580324016513026','f6817f48af4fb3af11b9e8bf182f618b','2023041608019580496',NULL,'2023-04-16 20:38:54','0:0:0:0:0:0:0:1'),
	 ('165acd6046a0eaf975099f46a3c898ea','f6817f48af4fb3af11b9e8bf182f618b','4f66409ef3bbd69c1d80469d6e2a885e',NULL,NULL,NULL),
	 ('1664b92dff13e1575e3a929caa2fa14d','f6817f48af4fb3af11b9e8bf182f618b','d2bbf9ebca5a8fa2e227af97d2da7548',NULL,NULL,NULL),
	 ('16ef8ed3865ccc6f6306200760896c50','ee8626f80f7c2619917b6236f3a7f02b','e8af452d8948ea49d37c934f5100ae6a',NULL,NULL,NULL),
	 ('17ead5b7d97ed365398ab20009a69ea3','52b0cf022ac4187b2a70dfa4f8b2d940','e08cb190ef230d5d4f03824198773950',NULL,NULL,NULL),
	 ('1ac1688ef8456f384091a03d88a89ab1','52b0cf022ac4187b2a70dfa4f8b2d940','693ce69af3432bd00be13c3971a57961',NULL,NULL,NULL),
	 ('1af4babaa4227c3cbb830bc5eb513abb','ee8626f80f7c2619917b6236f3a7f02b','e08cb190ef230d5d4f03824198773950',NULL,NULL,NULL),
	 ('1ba162bbc2076c25561f8622f610d5bf','ee8626f80f7c2619917b6236f3a7f02b','aedbf679b5773c1f25e9f7b10111da73',NULL,NULL,NULL);
INSERT INTO sys_role_permission (id,role_id,permission_id,data_rule_ids,operate_date,operate_ip) VALUES
	 ('1c1dbba68ef1817e7fb19c822d2854e8','f6817f48af4fb3af11b9e8bf182f618b','fb367426764077dcf94640c843733985',NULL,NULL,NULL),
	 ('1c55c4ced20765b8ebab383caa60f0b6','e51758fa916c881624b046d26bd09230','fb367426764077dcf94640c843733985',NULL,NULL,NULL),
	 ('1e099baeae01b747d67aca06bdfc34d1','e51758fa916c881624b046d26bd09230','6ad53fd1b220989a8b71ff482d683a5a',NULL,NULL,NULL),
	 ('1e47db875601fd97723254046b5bba90','f6817f48af4fb3af11b9e8bf182f618b','baf16b7174bd821b6bab23fa9abb200d',NULL,NULL,NULL),
	 ('1fe4d408b85f19618c15bcb768f0ec22','1750a8fb3e6d90cb7957c02de1dc8e59','9502685863ab87f0ad1134142788a385',NULL,NULL,NULL),
	 ('20e53c87a785688bdc0a5bb6de394ef1','f6817f48af4fb3af11b9e8bf182f618b','540a2936940846cb98114ffb0d145cb8',NULL,NULL,NULL),
	 ('248d288586c6ff3bd14381565df84163','52b0cf022ac4187b2a70dfa4f8b2d940','3f915b2769fc80648e92d04e84ca059d',NULL,NULL,NULL),
	 ('25491ecbd5a9b34f09c8bc447a10ede1','f6817f48af4fb3af11b9e8bf182f618b','d07a2c87a451434c99ab06296727ec4f',NULL,NULL,NULL),
	 ('25f5443f19c34d99718a016d5f54112e','ee8626f80f7c2619917b6236f3a7f02b','6e73eb3c26099c191bf03852ee1310a1',NULL,NULL,NULL),
	 ('27489816708b18859768dfed5945c405','a799c3b1b12dd3ed4bd046bfaef5fe6e','9502685863ab87f0ad1134142788a385',NULL,NULL,NULL);
INSERT INTO sys_role_permission (id,role_id,permission_id,data_rule_ids,operate_date,operate_ip) VALUES
	 ('2779cdea8367fff37db26a42c1a1f531','f6817f48af4fb3af11b9e8bf182f618b','fef097f3903caf3a3c3a6efa8de43fbb',NULL,NULL,NULL),
	 ('296f9c75ca0e172ae5ce4c1022c996df','646c628b2b8295fbdab2d34044de0354','732d48f8e0abe99fe6a23d18a3171cd1',NULL,NULL,NULL),
	 ('29fb4d37aa29b9fa400f389237cf9fe7','ee8626f80f7c2619917b6236f3a7f02b','05b3c82ddb2536a4a5ee1a4c46b5abef',NULL,NULL,NULL),
	 ('29fb6b0ad59a7e911c8d27e0bdc42d23','f6817f48af4fb3af11b9e8bf182f618b','9a90363f216a6a08f32eecb3f0bf12a3',NULL,NULL,NULL),
	 ('2ad37346c1b83ddeebc008f6987b2227','f6817f48af4fb3af11b9e8bf182f618b','8d1ebd663688965f1fd86a2f0ead3416',NULL,NULL,NULL),
	 ('2c462293cbb0eab7e8ae0a3600361b5f','52b0cf022ac4187b2a70dfa4f8b2d940','9502685863ab87f0ad1134142788a385',NULL,NULL,NULL),
	 ('2dc1a0eb5e39aaa131ddd0082a492d76','ee8626f80f7c2619917b6236f3a7f02b','08e6b9dc3c04489c8e1ff2ce6f105aa4',NULL,NULL,NULL),
	 ('2ea2382af618ba7d1e80491a0185fb8a','ee8626f80f7c2619917b6236f3a7f02b','f23d9bfff4d9aa6b68569ba2cff38415',NULL,NULL,NULL),
	 ('2fcfa2ac3dcfadc7c67107dae9a0de6d','ee8626f80f7c2619917b6236f3a7f02b','73678f9daa45ed17a3674131b03432fb',NULL,NULL,NULL),
	 ('2fdaed22dfa4c8d4629e44ef81688c6a','52b0cf022ac4187b2a70dfa4f8b2d940','aedbf679b5773c1f25e9f7b10111da73',NULL,NULL,NULL);
INSERT INTO sys_role_permission (id,role_id,permission_id,data_rule_ids,operate_date,operate_ip) VALUES
	 ('300c462b7fec09e2ff32574ef8b3f0bd','52b0cf022ac4187b2a70dfa4f8b2d940','2a470fc0c3954d9dbb61de6d80846549',NULL,NULL,NULL),
	 ('326181da3248a62a05e872119a462be1','ee8626f80f7c2619917b6236f3a7f02b','3f915b2769fc80648e92d04e84ca059d',NULL,NULL,NULL),
	 ('3369650f5072b330543f8caa556b1b33','e51758fa916c881624b046d26bd09230','a400e4f4d54f79bf5ce160ae432231af',NULL,NULL,NULL),
	 ('35a7e156c20e93aa7e825fe514bf9787','e51758fa916c881624b046d26bd09230','c6cf95444d80435eb37b2f9db3971ae6',NULL,NULL,NULL),
	 ('35ac7cae648de39eb56213ca1b649713','52b0cf022ac4187b2a70dfa4f8b2d940','b1cb0a3fedf7ed0e4653cb5a229837ee',NULL,NULL,NULL),
	 ('37112f4d372541e105473f18da3dc50d','ee8626f80f7c2619917b6236f3a7f02b','a400e4f4d54f79bf5ce160ae432231af',NULL,NULL,NULL),
	 ('37789f70cd8bd802c4a69e9e1f633eaa','ee8626f80f7c2619917b6236f3a7f02b','ae4fed059f67086fd52a73d913cf473d',NULL,NULL,NULL),
	 ('381504a717cb3ce77dcd4070c9689a7e','ee8626f80f7c2619917b6236f3a7f02b','4f84f9400e5e92c95f05b554724c2b58',NULL,NULL,NULL),
	 ('38a2e55db0960262800576e34b3af44c','f6817f48af4fb3af11b9e8bf182f618b','5c2f42277948043026b7a14692456828',NULL,NULL,NULL),
	 ('38dd7a19711e7ffe864232954c06fae9','e51758fa916c881624b046d26bd09230','d2bbf9ebca5a8fa2e227af97d2da7548',NULL,NULL,NULL);
INSERT INTO sys_role_permission (id,role_id,permission_id,data_rule_ids,operate_date,operate_ip) VALUES
	 ('3b1886f727ac503c93fecdd06dcb9622','f6817f48af4fb3af11b9e8bf182f618b','c431130c0bc0ec71b0a5be37747bb36a',NULL,NULL,NULL),
	 ('3de2a60c7e42a521fecf6fcc5cb54978','f6817f48af4fb3af11b9e8bf182f618b','2d83d62bd2544b8994c8f38cf17b0ddf',NULL,NULL,NULL),
	 ('3e4e38f748b8d87178dd62082e5b7b60','f6817f48af4fb3af11b9e8bf182f618b','7960961b0063228937da5fa8dd73d371',NULL,NULL,NULL),
	 ('3e563751942b0879c88ca4de19757b50','1750a8fb3e6d90cb7957c02de1dc8e59','58857ff846e61794c69208e9d3a85466',NULL,NULL,NULL),
	 ('3f1d04075e3c3254666a4138106a4e51','f6817f48af4fb3af11b9e8bf182f618b','3fac0d3c9cd40fa53ab70d4c583821f8',NULL,NULL,NULL),
	 ('412e2de37a35b3442d68db8dd2f3c190','52b0cf022ac4187b2a70dfa4f8b2d940','f1cb187abf927c88b89470d08615f5ac',NULL,NULL,NULL),
	 ('4204f91fb61911ba8ce40afa7c02369f','f6817f48af4fb3af11b9e8bf182f618b','3f915b2769fc80648e92d04e84ca059d',NULL,NULL,NULL),
	 ('444126230885d5d38b8fa6072c9f43f8','f6817f48af4fb3af11b9e8bf182f618b','f780d0d3083d849ccbdb1b1baee4911d',NULL,NULL,NULL),
	 ('445656dd187bd8a71605f4bbab1938a3','f6817f48af4fb3af11b9e8bf182f618b','020b06793e4de2eee0007f603000c769',NULL,NULL,NULL),
	 ('44b5a73541bcb854dd5d38c6d1fb93a1','ee8626f80f7c2619917b6236f3a7f02b','418964ba087b90a84897b62474496b93',NULL,NULL,NULL);
INSERT INTO sys_role_permission (id,role_id,permission_id,data_rule_ids,operate_date,operate_ip) VALUES
	 ('455cdb482457f529b79b479a2ff74427','f6817f48af4fb3af11b9e8bf182f618b','e1979bb53e9ea51cecc74d86fd9d2f64',NULL,NULL,NULL),
	 ('459aa2e7021b435b4d65414cfbc71c66','e51758fa916c881624b046d26bd09230','4148ec82b6acd69f470bea75fe41c357',NULL,NULL,NULL),
	 ('45a358bb738782d1a0edbf7485e81459','f6817f48af4fb3af11b9e8bf182f618b','0ac2ad938963b6c6d1af25477d5b8b51',NULL,NULL,NULL),
	 ('4c0940badae3ef9231ee9d042338f2a4','e51758fa916c881624b046d26bd09230','2a470fc0c3954d9dbb61de6d80846549',NULL,NULL,NULL),
	 ('4d56ce2f67c94b74a1d3abdbea340e42','ee8626f80f7c2619917b6236f3a7f02b','d86f58e7ab516d3bc6bfb1fe10585f97',NULL,NULL,NULL),
	 ('4dab5a06acc8ef3297889872caa74747','f6817f48af4fb3af11b9e8bf182f618b','ffb423d25cc59dcd0532213c4a518261',NULL,NULL,NULL),
	 ('4e0a37ed49524df5f08fc6593aee875c','f6817f48af4fb3af11b9e8bf182f618b','f23d9bfff4d9aa6b68569ba2cff38415',NULL,NULL,NULL),
	 ('4ea403fc1d19feb871c8bdd9f94a4ecc','f6817f48af4fb3af11b9e8bf182f618b','2e42e3835c2b44ec9f7bc26c146ee531',NULL,NULL,NULL),
	 ('4f254549d9498f06f4cc9b23f3e2c070','f6817f48af4fb3af11b9e8bf182f618b','93d5cfb4448f11e9916698e7f462b4b6',NULL,NULL,NULL),
	 ('4faad8ff93cb2b5607cd3d07c1b624ee','a799c3b1b12dd3ed4bd046bfaef5fe6e','70b8f33da5f39de1981bf89cf6c99792',NULL,NULL,NULL);
INSERT INTO sys_role_permission (id,role_id,permission_id,data_rule_ids,operate_date,operate_ip) VALUES
	 ('504e326de3f03562cdd186748b48a8c7','f6817f48af4fb3af11b9e8bf182f618b','027aee69baee98a0ed2e01806e89c891',NULL,NULL,NULL),
	 ('520b5989e6fe4a302a573d4fee12a40a','f6817f48af4fb3af11b9e8bf182f618b','6531cf3421b1265aeeeabaab5e176e6d',NULL,NULL,NULL),
	 ('54fdf85e52807bdb32ce450814abc256','f6817f48af4fb3af11b9e8bf182f618b','cc50656cf9ca528e6f2150eba4714ad2',NULL,NULL,NULL),
	 ('57c0b3a547b815ea3ec8e509b08948b3','1750a8fb3e6d90cb7957c02de1dc8e59','3f915b2769fc80648e92d04e84ca059d',NULL,NULL,NULL),
	 ('593ee05c4fe4645c7826b7d5e14f23ec','52b0cf022ac4187b2a70dfa4f8b2d940','8fb8172747a78756c11916216b8b8066',NULL,NULL,NULL),
	 ('5affc85021fcba07d81c09a6fdfa8dc6','ee8626f80f7c2619917b6236f3a7f02b','078f9558cdeab239aecb2bda1a8ed0d1',NULL,NULL,NULL),
	 ('5d230e6cd2935c4117f6cb9a7a749e39','f6817f48af4fb3af11b9e8bf182f618b','fc810a2267dd183e4ef7c71cc60f4670',NULL,NULL,NULL),
	 ('5de6871fadb4fe1cdd28989da0126b07','f6817f48af4fb3af11b9e8bf182f618b','a400e4f4d54f79bf5ce160a3432231af',NULL,NULL,NULL),
	 ('5e4015a9a641cbf3fb5d28d9f885d81a','f6817f48af4fb3af11b9e8bf182f618b','2dbbafa22cda07fa5d169d741b81fe12',NULL,NULL,NULL),
	 ('5e634a89f75b7a421c02aecfd520325f','e51758fa916c881624b046d26bd09230','339329ed54cf255e1f9392e84f136901',NULL,NULL,NULL);
INSERT INTO sys_role_permission (id,role_id,permission_id,data_rule_ids,operate_date,operate_ip) VALUES
	 ('5e74637c4bec048d1880ad0bd1b00552','e51758fa916c881624b046d26bd09230','a400e4f4d54f79bf5ce160a3432231af',NULL,NULL,NULL),
	 ('5fc194b709336d354640fe29fefd65a3','a799c3b1b12dd3ed4bd046bfaef5fe6e','9ba60e626bf2882c31c488aba62b89f0',NULL,NULL,NULL),
	 ('60eda4b4db138bdb47edbe8e10e71675','f6817f48af4fb3af11b9e8bf182f618b','fb07ca05a3e13674dbf6d3245956da2e',NULL,NULL,NULL),
	 ('61835e48f3e675f7d3f5c9dd3a10dcf3','f6817f48af4fb3af11b9e8bf182f618b','f0675b52d89100ee88472b6800754a08',NULL,NULL,NULL),
	 ('6451dac67ba4acafb570fd6a03f47460','ee8626f80f7c2619917b6236f3a7f02b','e3c13679c73a4f829bcff2aba8fd68b1',NULL,NULL,NULL),
	 ('660fbc40bcb1044738f7cabdf1708c28','f6817f48af4fb3af11b9e8bf182f618b','b3c824fc22bd953e2eb16ae6914ac8f9',NULL,NULL,NULL),
	 ('66b202f8f84fe766176b3f51071836ef','f6817f48af4fb3af11b9e8bf182f618b','1367a93f2c410b169faa7abcbad2f77c',NULL,NULL,NULL),
	 ('6b605c261ffbc8ac8a98ae33579c8c78','f6817f48af4fb3af11b9e8bf182f618b','fba41089766888023411a978d13c0aa4',NULL,NULL,NULL),
	 ('6c43fd3f10fdaf2a0646434ae68709b5','ee8626f80f7c2619917b6236f3a7f02b','540a2936940846cb98114ffb0d145cb8',NULL,NULL,NULL),
	 ('6c74518eb6bb9a353f6a6c459c77e64b','f6817f48af4fb3af11b9e8bf182f618b','b4dfc7d5dd9e8d5b6dd6d4579b1aa559',NULL,NULL,NULL);
INSERT INTO sys_role_permission (id,role_id,permission_id,data_rule_ids,operate_date,operate_ip) VALUES
	 ('6daddafacd7eccb91309530c17c5855d','f6817f48af4fb3af11b9e8bf182f618b','edfa74d66e8ea63ea432c2910837b150',NULL,NULL,NULL),
	 ('6fb4c2142498dd6d5b6c014ef985cb66','f6817f48af4fb3af11b9e8bf182f618b','6e73eb3c26099c191bf03852ee1310a1',NULL,NULL,NULL),
	 ('71a5f54a90aa8c7a250a38b7dba39f6f','ee8626f80f7c2619917b6236f3a7f02b','8fb8172747a78756c11916216b8b8066',NULL,NULL,NULL),
	 ('737d35f582036cd18bfd4c8e5748eaa4','e51758fa916c881624b046d26bd09230','693ce69af3432bd00be13c3971a57961',NULL,NULL,NULL),
	 ('7413acf23b56c906aedb5a36fb75bd3a','f6817f48af4fb3af11b9e8bf182f618b','a4fc7b64b01a224da066bb16230f9c5a',NULL,NULL,NULL),
	 ('75002588591820806','16457350655250432','5129710648430592',NULL,NULL,NULL),
	 ('75002588604403712','16457350655250432','5129710648430593',NULL,NULL,NULL),
	 ('75002588612792320','16457350655250432','40238597734928384',NULL,NULL,NULL),
	 ('75002588625375232','16457350655250432','57009744761589760',NULL,NULL,NULL),
	 ('75002588633763840','16457350655250432','16392452747300864',NULL,NULL,NULL);
INSERT INTO sys_role_permission (id,role_id,permission_id,data_rule_ids,operate_date,operate_ip) VALUES
	 ('75002588637958144','16457350655250432','16392767785668608',NULL,NULL,NULL),
	 ('75002588650541056','16457350655250432','16439068543946752',NULL,NULL,NULL),
	 ('76a54a8cc609754360bf9f57e7dbb2db','f6817f48af4fb3af11b9e8bf182f618b','c65321e57b7949b7a975313220de0422',NULL,NULL,NULL),
	 ('77277779875336192','496138616573952','5129710648430592',NULL,NULL,NULL),
	 ('77277780043108352','496138616573952','5129710648430593',NULL,NULL,NULL),
	 ('77277780055691264','496138616573952','15701400130424832',NULL,NULL,NULL),
	 ('77277780064079872','496138616573952','16678126574637056',NULL,NULL,NULL),
	 ('77277780072468480','496138616573952','15701915807518720',NULL,NULL,NULL),
	 ('77277780076662784','496138616573952','15708892205944832',NULL,NULL,NULL),
	 ('77277780085051392','496138616573952','16678447719911424',NULL,NULL,NULL);
INSERT INTO sys_role_permission (id,role_id,permission_id,data_rule_ids,operate_date,operate_ip) VALUES
	 ('77277780089245696','496138616573952','25014528525733888',NULL,NULL,NULL),
	 ('77277780097634304','496138616573952','56898976661639168',NULL,NULL,NULL),
	 ('77277780135383040','496138616573952','40238597734928384',NULL,NULL,NULL),
	 ('77277780139577344','496138616573952','45235621697949696',NULL,NULL,NULL),
	 ('77277780147965952','496138616573952','45235787867885568',NULL,NULL,NULL),
	 ('77277780156354560','496138616573952','45235939278065664',NULL,NULL,NULL),
	 ('77277780164743168','496138616573952','43117268627886080',NULL,NULL,NULL),
	 ('77277780168937472','496138616573952','45236734832676864',NULL,NULL,NULL),
	 ('77277780181520384','496138616573952','45237010692050944',NULL,NULL,NULL),
	 ('77277780189908992','496138616573952','45237170029465600',NULL,NULL,NULL);
INSERT INTO sys_role_permission (id,role_id,permission_id,data_rule_ids,operate_date,operate_ip) VALUES
	 ('77277780198297600','496138616573952','57009544286441472',NULL,NULL,NULL),
	 ('77277780206686208','496138616573952','57009744761589760',NULL,NULL,NULL),
	 ('77277780215074816','496138616573952','57009981228060672',NULL,NULL,NULL),
	 ('77277780219269120','496138616573952','56309618086776832',NULL,NULL,NULL),
	 ('77277780227657728','496138616573952','57212882168844288',NULL,NULL,NULL),
	 ('77277780236046336','496138616573952','61560041605435392',NULL,NULL,NULL),
	 ('77277780244434944','496138616573952','61560275261722624',NULL,NULL,NULL),
	 ('77277780257017856','496138616573952','61560480518377472',NULL,NULL,NULL),
	 ('77277780265406464','496138616573952','44986029924421632',NULL,NULL,NULL),
	 ('77277780324126720','496138616573952','45235228800716800',NULL,NULL,NULL);
INSERT INTO sys_role_permission (id,role_id,permission_id,data_rule_ids,operate_date,operate_ip) VALUES
	 ('77277780332515328','496138616573952','45069342940860416',NULL,NULL,NULL),
	 ('77277780340903937','496138616573952','5129710648430594',NULL,NULL,NULL),
	 ('77277780349292544','496138616573952','16687383932047360',NULL,NULL,NULL),
	 ('77277780357681152','496138616573952','16689632049631232',NULL,NULL,NULL),
	 ('77277780366069760','496138616573952','16689745006432256',NULL,NULL,NULL),
	 ('77277780370264064','496138616573952','16689883993083904',NULL,NULL,NULL),
	 ('77277780374458369','496138616573952','16690313745666048',NULL,NULL,NULL),
	 ('77277780387041280','496138616573952','5129710648430595',NULL,NULL,NULL),
	 ('77277780395429888','496138616573952','16694861252005888',NULL,NULL,NULL),
	 ('77277780403818496','496138616573952','16695107491205120',NULL,NULL,NULL);
INSERT INTO sys_role_permission (id,role_id,permission_id,data_rule_ids,operate_date,operate_ip) VALUES
	 ('77277780412207104','496138616573952','16695243126607872',NULL,NULL,NULL),
	 ('77277780420595712','496138616573952','75002207560273920',NULL,NULL,NULL),
	 ('77277780428984320','496138616573952','76215889006956544',NULL,NULL,NULL),
	 ('77277780433178624','496138616573952','76216071333351424',NULL,NULL,NULL),
	 ('77277780441567232','496138616573952','76216264070008832',NULL,NULL,NULL),
	 ('77277780449955840','496138616573952','76216459709124608',NULL,NULL,NULL),
	 ('77277780458344448','496138616573952','76216594207870976',NULL,NULL,NULL),
	 ('77277780466733056','496138616573952','76216702639017984',NULL,NULL,NULL),
	 ('77277780475121664','496138616573952','58480609315524608',NULL,NULL,NULL),
	 ('77277780483510272','496138616573952','61394706252173312',NULL,NULL,NULL);
INSERT INTO sys_role_permission (id,role_id,permission_id,data_rule_ids,operate_date,operate_ip) VALUES
	 ('77277780491898880','496138616573952','61417744146370560',NULL,NULL,NULL),
	 ('77277780496093184','496138616573952','76606430504816640',NULL,NULL,NULL),
	 ('77277780504481792','496138616573952','76914082455752704',NULL,NULL,NULL),
	 ('77277780508676097','496138616573952','76607201262702592',NULL,NULL,NULL),
	 ('77277780517064704','496138616573952','39915540965232640',NULL,NULL,NULL),
	 ('77277780525453312','496138616573952','41370251991977984',NULL,NULL,NULL),
	 ('77277780538036224','496138616573952','45264987354042368',NULL,NULL,NULL),
	 ('77277780546424832','496138616573952','45265487029866496',NULL,NULL,NULL),
	 ('77277780554813440','496138616573952','45265762415284224',NULL,NULL,NULL),
	 ('77277780559007744','496138616573952','45265886315024384',NULL,NULL,NULL);
INSERT INTO sys_role_permission (id,role_id,permission_id,data_rule_ids,operate_date,operate_ip) VALUES
	 ('77277780567396352','496138616573952','45266070000373760',NULL,NULL,NULL),
	 ('77277780571590656','496138616573952','41363147411427328',NULL,NULL,NULL),
	 ('77277780579979264','496138616573952','41363537456533504',NULL,NULL,NULL),
	 ('77277780588367872','496138616573952','41364927394353152',NULL,NULL,NULL),
	 ('77277780596756480','496138616573952','41371711400054784',NULL,NULL,NULL),
	 ('77277780605145088','496138616573952','41469219249852416',NULL,NULL,NULL),
	 ('77277780613533696','496138616573952','39916171171991552',NULL,NULL,NULL),
	 ('77277780621922304','496138616573952','39918482854252544',NULL,NULL,NULL),
	 ('77277780630310912','496138616573952','41373430515240960',NULL,NULL,NULL),
	 ('77277780718391296','496138616573952','41375330996326400',NULL,NULL,NULL);
INSERT INTO sys_role_permission (id,role_id,permission_id,data_rule_ids,operate_date,operate_ip) VALUES
	 ('77277780722585600','496138616573952','63741744973352960',NULL,NULL,NULL),
	 ('77277780730974208','496138616573952','42082442672082944',NULL,NULL,NULL),
	 ('77277780739362816','496138616573952','41376192166629376',NULL,NULL,NULL),
	 ('77277780747751424','496138616573952','41377034236071936',NULL,NULL,NULL),
	 ('77277780756140032','496138616573952','56911328312299520',NULL,NULL,NULL),
	 ('77277780764528640','496138616573952','41378916912336896',NULL,NULL,NULL),
	 ('77277780768722944','496138616573952','63482475359244288',NULL,NULL,NULL),
	 ('77277780772917249','496138616573952','64290663792906240',NULL,NULL,NULL),
	 ('77277780785500160','496138616573952','66790433014943744',NULL,NULL,NULL),
	 ('77277780789694464','496138616573952','42087054753927168',NULL,NULL,NULL);
INSERT INTO sys_role_permission (id,role_id,permission_id,data_rule_ids,operate_date,operate_ip) VALUES
	 ('77277780798083072','496138616573952','67027338952445952',NULL,NULL,NULL),
	 ('77277780806471680','496138616573952','67027909637836800',NULL,NULL,NULL),
	 ('77277780810665985','496138616573952','67042515441684480',NULL,NULL,NULL),
	 ('77277780823248896','496138616573952','67082402312228864',NULL,NULL,NULL),
	 ('77277780827443200','496138616573952','16392452747300864',NULL,NULL,NULL),
	 ('77277780835831808','496138616573952','16392767785668608',NULL,NULL,NULL),
	 ('77277780840026112','496138616573952','16438800255291392',NULL,NULL,NULL),
	 ('77277780844220417','496138616573952','16438962738434048',NULL,NULL,NULL),
	 ('77277780852609024','496138616573952','16439068543946752',NULL,NULL,NULL),
	 ('77277860062040064','496138616573953','5129710648430592',NULL,NULL,NULL);
INSERT INTO sys_role_permission (id,role_id,permission_id,data_rule_ids,operate_date,operate_ip) VALUES
	 ('77277860070428672','496138616573953','5129710648430593',NULL,NULL,NULL),
	 ('77277860078817280','496138616573953','40238597734928384',NULL,NULL,NULL),
	 ('77277860091400192','496138616573953','43117268627886080',NULL,NULL,NULL),
	 ('77277860099788800','496138616573953','57009744761589760',NULL,NULL,NULL),
	 ('77277860112371712','496138616573953','56309618086776832',NULL,NULL,NULL),
	 ('77277860120760320','496138616573953','44986029924421632',NULL,NULL,NULL),
	 ('77277860129148928','496138616573953','5129710648430594',NULL,NULL,NULL),
	 ('77277860141731840','496138616573953','5129710648430595',NULL,NULL,NULL),
	 ('77277860150120448','496138616573953','75002207560273920',NULL,NULL,NULL),
	 ('77277860158509056','496138616573953','58480609315524608',NULL,NULL,NULL);
INSERT INTO sys_role_permission (id,role_id,permission_id,data_rule_ids,operate_date,operate_ip) VALUES
	 ('77277860162703360','496138616573953','76606430504816640',NULL,NULL,NULL),
	 ('77277860171091968','496138616573953','76914082455752704',NULL,NULL,NULL),
	 ('77277860179480576','496138616573953','76607201262702592',NULL,NULL,NULL),
	 ('77277860187869184','496138616573953','39915540965232640',NULL,NULL,NULL),
	 ('77277860196257792','496138616573953','41370251991977984',NULL,NULL,NULL),
	 ('77277860204646400','496138616573953','41363147411427328',NULL,NULL,NULL),
	 ('77277860208840704','496138616573953','41371711400054784',NULL,NULL,NULL),
	 ('77277860213035009','496138616573953','39916171171991552',NULL,NULL,NULL),
	 ('77277860221423616','496138616573953','39918482854252544',NULL,NULL,NULL),
	 ('77277860225617920','496138616573953','41373430515240960',NULL,NULL,NULL);
INSERT INTO sys_role_permission (id,role_id,permission_id,data_rule_ids,operate_date,operate_ip) VALUES
	 ('77277860234006528','496138616573953','41375330996326400',NULL,NULL,NULL),
	 ('77277860242395136','496138616573953','63741744973352960',NULL,NULL,NULL),
	 ('77277860250783744','496138616573953','42082442672082944',NULL,NULL,NULL),
	 ('77277860254978048','496138616573953','41376192166629376',NULL,NULL,NULL),
	 ('77277860263366656','496138616573953','41377034236071936',NULL,NULL,NULL),
	 ('77277860271755264','496138616573953','56911328312299520',NULL,NULL,NULL),
	 ('77277860313698304','496138616573953','41378916912336896',NULL,NULL,NULL),
	 ('77277860322086912','496138616573953','63482475359244288',NULL,NULL,NULL),
	 ('77277860326281216','496138616573953','64290663792906240',NULL,NULL,NULL),
	 ('77277860334669824','496138616573953','66790433014943744',NULL,NULL,NULL);
INSERT INTO sys_role_permission (id,role_id,permission_id,data_rule_ids,operate_date,operate_ip) VALUES
	 ('77277860343058432','496138616573953','42087054753927168',NULL,NULL,NULL),
	 ('77277860347252736','496138616573953','67027338952445952',NULL,NULL,NULL),
	 ('77277860351447041','496138616573953','67027909637836800',NULL,NULL,NULL),
	 ('77277860359835648','496138616573953','67042515441684480',NULL,NULL,NULL),
	 ('77277860364029952','496138616573953','67082402312228864',NULL,NULL,NULL),
	 ('77277860368224256','496138616573953','16392452747300864',NULL,NULL,NULL),
	 ('77277860372418560','496138616573953','16392767785668608',NULL,NULL,NULL),
	 ('77277860376612865','496138616573953','16438800255291392',NULL,NULL,NULL),
	 ('77277860385001472','496138616573953','16438962738434048',NULL,NULL,NULL),
	 ('77277860389195776','496138616573953','16439068543946752',NULL,NULL,NULL);
INSERT INTO sys_role_permission (id,role_id,permission_id,data_rule_ids,operate_date,operate_ip) VALUES
	 ('7750f9be48ee09cd561fce718219a3e2','ee8626f80f7c2619917b6236f3a7f02b','882a73768cfd7f78f3a37584f7299656',NULL,NULL,NULL),
	 ('7a5d31ba48fe3fb1266bf186dc5f7ba7','52b0cf022ac4187b2a70dfa4f8b2d940','58857ff846e61794c69208e9d3a85466',NULL,NULL,NULL),
	 ('7a6bca9276c128309c80d21e795c66c6','f6817f48af4fb3af11b9e8bf182f618b','54097c6a3cf50fad0793a34beff1efdf',NULL,NULL,NULL),
	 ('7ca833caa5eac837b7200d8b6de8b2e3','f6817f48af4fb3af11b9e8bf182f618b','fedfbf4420536cacc0218557d263dfea',NULL,NULL,NULL),
	 ('7d2ea745950be3357747ec7750c31c57','ee8626f80f7c2619917b6236f3a7f02b','2a470fc0c3954d9dbb61de6d80846549',NULL,NULL,NULL),
	 ('7de42bdc0b8c5446b7d428c66a7abc12','52b0cf022ac4187b2a70dfa4f8b2d940','54dd5457a3190740005c1bfec55b1c34',NULL,NULL,NULL),
	 ('7e19d90cec0dd87aaef351b9ff8f4902','646c628b2b8295fbdab2d34044de0354','f9d3f4f27653a71c52faa9fb8070fbe7',NULL,NULL,NULL),
	 ('7f862c47003eb20e8bad05f506371f92','ee8626f80f7c2619917b6236f3a7f02b','d7d6e2e4e2934f2c9385a623fd98c6f3',NULL,NULL,NULL),
	 ('812ed54661b1a24b81b58974691a73f5','e51758fa916c881624b046d26bd09230','e6bfd1fcabfd7942fdd05f076d1dad38',NULL,NULL,NULL),
	 ('83f704524b21b6a3ae324b8736c65333','ee8626f80f7c2619917b6236f3a7f02b','7ac9eb9ccbde2f7a033cd4944272bf1e',NULL,NULL,NULL);
INSERT INTO sys_role_permission (id,role_id,permission_id,data_rule_ids,operate_date,operate_ip) VALUES
	 ('84d32474316a43b01256d6644e6e7751','ee8626f80f7c2619917b6236f3a7f02b','ec8d607d0156e198b11853760319c646',NULL,NULL,NULL),
	 ('84eac2f113c23737128fb099d1d1da89','f6817f48af4fb3af11b9e8bf182f618b','03dc3d93261dda19fc86dd7ca486c6cf',NULL,NULL,NULL),
	 ('85755a6c0bdff78b3860b52d35310c7f','e51758fa916c881624b046d26bd09230','c65321e57b7949b7a975313220de0422',NULL,NULL,NULL),
	 ('86060e2867a5049d8a80d9fe5d8bc28b','f6817f48af4fb3af11b9e8bf182f618b','765dd244f37b804e3d00f475fd56149b',NULL,NULL,NULL),
	 ('8703a2410cddb713c33232ce16ec04b9','ee8626f80f7c2619917b6236f3a7f02b','1367a93f2c410b169faa7abcbad2f77c',NULL,NULL,NULL),
	 ('884f147c20e003cc80ed5b7efa598cbe','f6817f48af4fb3af11b9e8bf182f618b','e5973686ed495c379d829ea8b2881fc6',NULL,NULL,NULL),
	 ('885c1a827383e5b2c6c4f8ca72a7b493','ee8626f80f7c2619917b6236f3a7f02b','4148ec82b6acd69f470bea75fe41c357','',NULL,NULL),
	 ('8a60df8d8b4c9ee5fa63f48aeee3ec00','1750a8fb3e6d90cb7957c02de1dc8e59','d7d6e2e4e2934f2c9385a623fd98c6f3',NULL,NULL,NULL),
	 ('8b09925bdc194ab7f3559cd3a7ea0507','f6817f48af4fb3af11b9e8bf182f618b','ebb9d82ea16ad864071158e0c449d186',NULL,NULL,NULL),
	 ('8b1e326791375f325d3e6b797753b65e','ee8626f80f7c2619917b6236f3a7f02b','2dbbafa22cda07fa5d169d741b81fe12',NULL,NULL,NULL);
INSERT INTO sys_role_permission (id,role_id,permission_id,data_rule_ids,operate_date,operate_ip) VALUES
	 ('8ce1022dac4e558ff9694600515cf510','1750a8fb3e6d90cb7957c02de1dc8e59','08e6b9dc3c04489c8e1ff2ce6f105aa4',NULL,NULL,NULL),
	 ('8d154c2382a8ae5c8d1b84bd38df2a93','f6817f48af4fb3af11b9e8bf182f618b','d86f58e7ab516d3bc6bfb1fe10585f97',NULL,NULL,NULL),
	 ('8d848ca7feec5b7ebb3ecb32b2c8857a','52b0cf022ac4187b2a70dfa4f8b2d940','4148ec82b6acd69f470bea75fe41c357',NULL,NULL,NULL),
	 ('8dd64f65a1014196078d0882f767cd85','f6817f48af4fb3af11b9e8bf182f618b','e3c13679c73a4f829bcff2aba8fd68b1',NULL,NULL,NULL),
	 ('8e3dc1671abad4f3c83883b194d2e05a','f6817f48af4fb3af11b9e8bf182f618b','b1cb0a3fedf7ed0e4653cb5a229837ee',NULL,NULL,NULL),
	 ('8eec2c510f1ac9c5eee26c041b1f00ca','ee8626f80f7c2619917b6236f3a7f02b','58857ff846e61794c69208e9d3a85466',NULL,NULL,NULL),
	 ('8f762ff80253f634b08cf59a77742ba4','ee8626f80f7c2619917b6236f3a7f02b','9502685863ab87f0ad1134142788a385',NULL,NULL,NULL),
	 ('903b790e6090414343502c6dc393b7c9','ee8626f80f7c2619917b6236f3a7f02b','de13e0f6328c069748de7399fcc1dbbd',NULL,NULL,NULL),
	 ('905bf419332ebcb83863603b3ebe30f0','f6817f48af4fb3af11b9e8bf182f618b','8fb8172747a78756c11916216b8b8066',NULL,NULL,NULL),
	 ('90996d56357730e173e636b99fc48bea','ee8626f80f7c2619917b6236f3a7f02b','fb07ca05a3e13674dbf6d3245956da2e',NULL,NULL,NULL);
INSERT INTO sys_role_permission (id,role_id,permission_id,data_rule_ids,operate_date,operate_ip) VALUES
	 ('90e1c607a0631364eec310f3cc4acebd','ee8626f80f7c2619917b6236f3a7f02b','4f66409ef3bbd69c1d80469d6e2a885e',NULL,NULL,NULL),
	 ('9264104cee9b10c96241d527b2d0346d','1750a8fb3e6d90cb7957c02de1dc8e59','54dd5457a3190740005c1bfec55b1c34',NULL,NULL,NULL),
	 ('9380121ca9cfee4b372194630fce150e','f6817f48af4fb3af11b9e8bf182f618b','65a8f489f25a345836b7f44b1181197a',NULL,NULL,NULL),
	 ('94911fef73a590f6824105ebf9b6cab3','f6817f48af4fb3af11b9e8bf182f618b','8b3bff2eee6f1939147f5c68292a1642',NULL,NULL,NULL),
	 ('9700d20dbc1ae3cbf7de1c810b521fe6','f6817f48af4fb3af11b9e8bf182f618b','ec8d607d0156e198b11853760319c646',NULL,NULL,NULL),
	 ('980171fda43adfe24840959b1d048d4d','f6817f48af4fb3af11b9e8bf182f618b','d7d6e2e4e2934f2c9385a623fd98c6f3',NULL,NULL,NULL),
	 ('987c23b70873bd1d6dca52f30aafd8c2','f6817f48af4fb3af11b9e8bf182f618b','00a2a0ae65cdca5e93209cdbde97cbe6',NULL,NULL,NULL),
	 ('98f02353f91dd569e3c6b8fd6b4f4034','ee8626f80f7c2619917b6236f3a7f02b','6531cf3421b1265aeeeabaab5e176e6d',NULL,NULL,NULL),
	 ('9b2ad767f9861e64a20b097538feafd3','f6817f48af4fb3af11b9e8bf182f618b','73678f9daa45ed17a3674131b03432fb',NULL,NULL,NULL),
	 ('9d8772c310b675ae43eacdbc6c7fa04a','a799c3b1b12dd3ed4bd046bfaef5fe6e','1663f3faba244d16c94552f849627d84',NULL,NULL,NULL);
INSERT INTO sys_role_permission (id,role_id,permission_id,data_rule_ids,operate_date,operate_ip) VALUES
	 ('9d980ec0489040e631a9c24a6af42934','f6817f48af4fb3af11b9e8bf182f618b','05b3c82ddb2536a4a5ee1a4c46b5abef',NULL,NULL,NULL),
	 ('9f8311ecccd44e079723098cf2ffe1cc','1750a8fb3e6d90cb7957c02de1dc8e59','693ce69af3432bd00be13c3971a57961',NULL,NULL,NULL),
	 ('a034ed7c38c996b880d3e78f586fe0ae','f6817f48af4fb3af11b9e8bf182f618b','c89018ea6286e852b424466fd92a2ffc',NULL,NULL,NULL),
	 ('a098e2acc3f90316f161f6648d085640','ee8626f80f7c2619917b6236f3a7f02b','e6bfd1fcabfd7942fdd05f076d1dad38',NULL,NULL,NULL),
	 ('a307a9349ad64a2eff8ab69582fa9be4','f6817f48af4fb3af11b9e8bf182f618b','0620e402857b8c5b605e1ad9f4b89350',NULL,NULL,NULL),
	 ('a5d25fdb3c62904a8474182706ce11a0','f6817f48af4fb3af11b9e8bf182f618b','418964ba087b90a84897b62474496b93',NULL,NULL,NULL),
	 ('a66feaaf128417ad762e946abccf27ec','ee8626f80f7c2619917b6236f3a7f02b','c6cf95444d80435eb37b2f9db3971ae6',NULL,NULL,NULL),
	 ('a72c31a3913c736d4eca11d13be99183','e51758fa916c881624b046d26bd09230','a44c30db536349e91106223957e684eb',NULL,NULL,NULL),
	 ('a7ab87eac0f8fafa2efa4b1f9351923f','ee8626f80f7c2619917b6236f3a7f02b','fedfbf4420536cacc0218557d263dfea',NULL,NULL,NULL),
	 ('abdc324a2df9f13ee6e73d44c6e62bc8','ee8626f80f7c2619917b6236f3a7f02b','f1cb187abf927c88b89470d08615f5ac',NULL,NULL,NULL);
INSERT INTO sys_role_permission (id,role_id,permission_id,data_rule_ids,operate_date,operate_ip) VALUES
	 ('acacce4417e5d7f96a9c3be2ded5b4be','f6817f48af4fb3af11b9e8bf182f618b','f9d3f4f27653a71c52faa9fb8070fbe7',NULL,NULL,NULL),
	 ('ae1852fb349d8513eb3fdc173da3ee56','f6817f48af4fb3af11b9e8bf182f618b','8d4683aacaa997ab86b966b464360338',NULL,NULL,NULL),
	 ('aefc8c22e061171806e59cd222f6b7e1','52b0cf022ac4187b2a70dfa4f8b2d940','e8af452d8948ea49d37c934f5100ae6a',NULL,NULL,NULL),
	 ('af60ac8fafd807ed6b6b354613b9ccbc','f6817f48af4fb3af11b9e8bf182f618b','58857ff846e61794c69208e9d3a85466',NULL,NULL,NULL),
	 ('b0c8a20800b8bf1ebdd7be473bceb44f','f6817f48af4fb3af11b9e8bf182f618b','58b9204feaf07e47284ddb36cd2d8468',NULL,NULL,NULL),
	 ('b128ebe78fa5abb54a3a82c6689bdca3','f6817f48af4fb3af11b9e8bf182f618b','aedbf679b5773c1f25e9f7b10111da73',NULL,NULL,NULL),
	 ('b131ebeafcfd059f3c7e542606ea9ff5','ee8626f80f7c2619917b6236f3a7f02b','e5973686ed495c379d829ea8b2881fc6',NULL,NULL,NULL),
	 ('b21b07951bb547b09cc85624a841aea0','f6817f48af4fb3af11b9e8bf182f618b','4356a1a67b564f0988a484f5531fd4d9',NULL,NULL,NULL),
	 ('b2b2dcfff6986d3d7f890ea62d474651','ee8626f80f7c2619917b6236f3a7f02b','200006f0edf145a2b50eacca07585451',NULL,NULL,NULL),
	 ('b495a46fa0e0d4637abe0db7fd12fe1a','ee8626f80f7c2619917b6236f3a7f02b','717f6bee46f44a3897eca9abd6e2ec44',NULL,NULL,NULL);
INSERT INTO sys_role_permission (id,role_id,permission_id,data_rule_ids,operate_date,operate_ip) VALUES
	 ('b64c4ab9cd9a2ea8ac1e9db5fb7cf522','f6817f48af4fb3af11b9e8bf182f618b','2aeddae571695cd6380f6d6d334d6e7d',NULL,NULL,NULL),
	 ('bbec16ad016efec9ea2def38f4d3d9dc','f6817f48af4fb3af11b9e8bf182f618b','13212d3416eb690c2e1d5033166ff47a',NULL,NULL,NULL),
	 ('bd30561f141f07827b836878137fddd8','e51758fa916c881624b046d26bd09230','65a8f489f25a345836b7f44b1181197a',NULL,NULL,NULL),
	 ('be8e5a9080569e59863f20c4c57a8e22','f6817f48af4fb3af11b9e8bf182f618b','22d6a3d39a59dd7ea9a30acfa6bfb0a5',NULL,NULL,NULL),
	 ('c09373ebfc73fb5740db5ff02cba4f91','f6817f48af4fb3af11b9e8bf182f618b','339329ed54cf255e1f9392e84f136901',NULL,NULL,NULL),
	 ('c56fb1658ee5f7476380786bf5905399','f6817f48af4fb3af11b9e8bf182f618b','de13e0f6328c069748de7399fcc1dbbd',NULL,NULL,NULL),
	 ('c689539d20a445b0896270290c58d01f','e51758fa916c881624b046d26bd09230','13212d3416eb690c2e1d5033166ff47a',NULL,NULL,NULL),
	 ('c6fee38d293b9d0596436a0cbd205070','f6817f48af4fb3af11b9e8bf182f618b','4f84f9400e5e92c95f05b554724c2b58',NULL,NULL,NULL),
	 ('c8571839e6b14796e661f3e2843b80b6','ee8626f80f7c2619917b6236f3a7f02b','45c966826eeff4c99b8f8ebfe74511fc',NULL,NULL,NULL),
	 ('c90b0b01c7ca454d2a1cb7408563e696','f6817f48af4fb3af11b9e8bf182f618b','882a73768cfd7f78f3a37584f7299656',NULL,NULL,NULL);
INSERT INTO sys_role_permission (id,role_id,permission_id,data_rule_ids,operate_date,operate_ip) VALUES
	 ('c9d35261cccd67ab2932107a0967a7d7','e51758fa916c881624b046d26bd09230','b4dfc7d5dd9e8d5b6dd6d4579b1aa559',NULL,NULL,NULL),
	 ('ced80e43584ce15e97bb07298e93020d','e51758fa916c881624b046d26bd09230','45c966826eeff4c99b8f8ebfe74511fc',NULL,NULL,NULL),
	 ('cf1feb1bf69eafc982295ad6c9c8d698','f6817f48af4fb3af11b9e8bf182f618b','a2b11669e98c5fe54a53c3e3c4f35d14',NULL,NULL,NULL),
	 ('cf2ef620217673e4042f695743294f01','f6817f48af4fb3af11b9e8bf182f618b','717f6bee46f44a3897eca9abd6e2ec44',NULL,NULL,NULL),
	 ('cf43895aef7fc684669483ab00ef2257','f6817f48af4fb3af11b9e8bf182f618b','700b7f95165c46cc7a78bf227aa8fed3',NULL,NULL,NULL),
	 ('d03d792b0f312e7b490afc5cec3dd6c5','e51758fa916c881624b046d26bd09230','8fb8172747a78756c11916216b8b8066',NULL,NULL,NULL),
	 ('d281a95b8f293d0fa2a136f46c4e0b10','f6817f48af4fb3af11b9e8bf182f618b','5c8042bd6c601270b2bbd9b20bccc68b',NULL,NULL,NULL),
	 ('d37ad568e26f46ed0feca227aa9c2ffa','f6817f48af4fb3af11b9e8bf182f618b','9502685863ab87f0ad1134142788a385',NULL,NULL,NULL),
	 ('d3ddcacee1acdfaa0810618b74e38ef2','f6817f48af4fb3af11b9e8bf182f618b','c6cf95444d80435eb37b2f9db3971ae6',NULL,NULL,NULL),
	 ('d3fe195d59811531c05d31d8436f5c8b','1750a8fb3e6d90cb7957c02de1dc8e59','e8af452d8948ea49d37c934f5100ae6a',NULL,NULL,NULL);
INSERT INTO sys_role_permission (id,role_id,permission_id,data_rule_ids,operate_date,operate_ip) VALUES
	 ('d5267597a4450f06d49d2fb63859641a','e51758fa916c881624b046d26bd09230','2dbbafa22cda07fa5d169d741b81fe12',NULL,NULL,NULL),
	 ('d83282192a69514cfe6161b3087ff962','f6817f48af4fb3af11b9e8bf182f618b','53a9230444d33de28aa11cc108fb1dba',NULL,NULL,NULL),
	 ('d8a5c9079df12090e108e21be94b4fd7','f6817f48af4fb3af11b9e8bf182f618b','078f9558cdeab239aecb2bda1a8ed0d1',NULL,NULL,NULL),
	 ('dbc5dd836d45c5bc7bc94b22596ab956','f6817f48af4fb3af11b9e8bf182f618b','1939e035e803a99ceecb6f5563570fb2',NULL,NULL,NULL),
	 ('dc83bb13c0e8c930e79d28b2db26f01f','f6817f48af4fb3af11b9e8bf182f618b','63b551e81c5956d5c861593d366d8c57',NULL,NULL,NULL),
	 ('dc8fd3f79bd85bd832608b42167a1c71','f6817f48af4fb3af11b9e8bf182f618b','91c23960fab49335831cf43d820b0a61',NULL,NULL,NULL),
	 ('de82e89b8b60a3ea99be5348f565c240','f6817f48af4fb3af11b9e8bf182f618b','56ca78fe0f22d815fabc793461af67b8',NULL,NULL,NULL),
	 ('de8f43229e351d34af3c95b1b9f0a15d','f6817f48af4fb3af11b9e8bf182f618b','a400e4f4d54f79bf5ce160ae432231af',NULL,NULL,NULL),
	 ('e258ca8bf7ee168b93bfee739668eb15','ee8626f80f7c2619917b6236f3a7f02b','fb367426764077dcf94640c843733985',NULL,NULL,NULL),
	 ('e339f7db7418a4fd2bd2c113f1182186','ee8626f80f7c2619917b6236f3a7f02b','b1cb0a3fedf7ed0e4653cb5a229837ee',NULL,NULL,NULL);
INSERT INTO sys_role_permission (id,role_id,permission_id,data_rule_ids,operate_date,operate_ip) VALUES
	 ('e3e922673f4289b18366bb51b6200f17','52b0cf022ac4187b2a70dfa4f8b2d940','45c966826eeff4c99b8f8ebfe74511fc',NULL,NULL,NULL),
	 ('e7467726ee72235baaeb47df04a35e73','f6817f48af4fb3af11b9e8bf182f618b','e08cb190ef230d5d4f03824198773950',NULL,NULL,NULL),
	 ('eaef4486f1c9b0408580bbfa2037eb66','f6817f48af4fb3af11b9e8bf182f618b','2a470fc0c3954d9dbb61de6d80846549',NULL,NULL,NULL),
	 ('ec4bc97829ab56afd83f428b6dc37ff6','f6817f48af4fb3af11b9e8bf182f618b','200006f0edf145a2b50eacca07585451',NULL,NULL,NULL),
	 ('ec846a3f85fdb6813e515be71f11b331','f6817f48af4fb3af11b9e8bf182f618b','732d48f8e0abe99fe6a23d18a3171cd1',NULL,NULL,NULL),
	 ('ec93bb06f5be4c1f19522ca78180e2ef','f6817f48af4fb3af11b9e8bf182f618b','265de841c58907954b8877fb85212622',NULL,NULL,NULL),
	 ('ecdd72fe694e6bba9c1d9fc925ee79de','f6817f48af4fb3af11b9e8bf182f618b','45c966826eeff4c99b8f8ebfe74511fc',NULL,NULL,NULL),
	 ('edefd8d468f5727db465cf1b860af474','f6817f48af4fb3af11b9e8bf182f618b','6ad53fd1b220989a8b71ff482d683a5a',NULL,NULL,NULL),
	 ('ef8bdd20d29447681ec91d3603e80c7b','f6817f48af4fb3af11b9e8bf182f618b','ae4fed059f67086fd52a73d913cf473d',NULL,NULL,NULL),
	 ('f12b6c90e8913183d7ca547c66600891','e51758fa916c881624b046d26bd09230','aedbf679b5773c1f25e9f7b10111da73',NULL,NULL,NULL);
INSERT INTO sys_role_permission (id,role_id,permission_id,data_rule_ids,operate_date,operate_ip) VALUES
	 ('f177acac0276329dc66af0c9ad30558a','f6817f48af4fb3af11b9e8bf182f618b','c2c356bf4ddd29975347a7047a062440',NULL,NULL,NULL),
	 ('f17ab8ad1e71341140857ef4914ef297','21c5a3187763729408b40afb0d0fdfa8','732d48f8e0abe99fe6a23d18a3171cd1',NULL,NULL,NULL),
	 ('f99f99cc3bc27220cdd4f5aced33b7d7','f6817f48af4fb3af11b9e8bf182f618b','655563cd64b75dcf52ef7bcdd4836953',NULL,NULL,NULL),
	 ('fafe73c4448b977fe42880a6750c3ee8','f6817f48af4fb3af11b9e8bf182f618b','9cb91b8851db0cf7b19d7ecc2a8193dd',NULL,NULL,NULL),
	 ('fced905c7598973b970d42d833f73474','f6817f48af4fb3af11b9e8bf182f618b','4875ebe289344e14844d8e3ea1edd73f',NULL,NULL,NULL),
	 ('fd86f6b08eb683720ba499f9d9421726','ee8626f80f7c2619917b6236f3a7f02b','693ce69af3432bd00be13c3971a57961',NULL,NULL,NULL),
	 ('fd97963dc5f144d3aecfc7045a883427','f6817f48af4fb3af11b9e8bf182f618b','043780fa095ff1b2bec4dc406d76f023',NULL,NULL,NULL),
	 ('fed41a4671285efb266cd404f24dd378','52b0cf022ac4187b2a70dfa4f8b2d940','00a2a0ae65cdca5e93209cdbde97cbe6',NULL,NULL,NULL);

-- ----------------------------
-- Table structure for sys_sms
-- ----------------------------
DROP TABLE IF EXISTS `sys_sms`;
CREATE TABLE `sys_sms`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ID',
  `es_title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消息标题',
  `es_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发送方式：参考枚举MessageTypeEnum',
  `es_receiver` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '接收人',
  `es_param` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发送所需参数Json格式',
  `es_content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '推送内容',
  `es_send_time` datetime NULL DEFAULT NULL COMMENT '推送时间',
  `es_send_status` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '推送状态 0未推送 1推送成功 2推送失败 -1失败不再发送',
  `es_send_num` int(11) NULL DEFAULT NULL COMMENT '发送次数 超过5次不再发送',
  `es_result` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '推送失败原因',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人登录名称',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建日期',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人登录名称',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_ss_es_type`(`es_type`) USING BTREE,
  INDEX `idx_ss_es_receiver`(`es_receiver`) USING BTREE,
  INDEX `idx_ss_es_send_time`(`es_send_time`) USING BTREE,
  INDEX `idx_ss_es_send_status`(`es_send_status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_sms
-- ----------------------------
INSERT INTO `sys_sms` VALUES ('402880e74dc2f361014dc2f8411e0001', '消息推送测试333', '2', '411944058@qq.com', NULL, '张三你好，你的订单4028d881436d514601436d521ae80165已付款!', '2015-06-05 17:06:01', '3', NULL, NULL, '认证失败错误的用户名或者密码', 'admin', '2015-06-05 17:05:59', 'admin', '2015-11-19 22:30:39');
INSERT INTO `sys_sms` VALUES ('402880ea533647b00153364e74770001', '发个问候', '3', 'admin', NULL, '你好', '2016-03-02 00:00:00', '2', NULL, NULL, NULL, 'admin', '2016-03-02 15:50:24', 'admin', '2018-07-05 19:53:01');
INSERT INTO `sys_sms` VALUES ('402880ee5a17e711015a17f3188e013f', '消息推送测试333', '2', '411944058@qq.com', NULL, '张三你好，你的订单4028d881436d514601436d521ae80165已付款!', NULL, '2', NULL, NULL, NULL, 'admin', '2017-02-07 17:41:31', 'admin', '2017-03-10 11:37:05');
INSERT INTO `sys_sms` VALUES ('402880f05ab649b4015ab64b9cd80012', '消息推送测试333', '2', '411944058@qq.com', NULL, '张三你好，你的订单4028d881436d514601436d521ae80165已付款!', '2017-11-16 15:58:15', '3', NULL, NULL, NULL, 'admin', '2017-03-10 11:38:13', 'admin', '2017-07-31 17:24:54');
INSERT INTO `sys_sms` VALUES ('402880f05ab7b035015ab7c4462c0004', '消息推送测试333', '2', '411944058@qq.com', NULL, '张三你好，你的订单4028d881436d514601436d521ae80165已付款!', '2017-11-16 15:58:15', '3', NULL, NULL, NULL, 'admin', '2017-03-10 18:29:37', NULL, NULL);
INSERT INTO `sys_sms` VALUES ('402881f3646a472b01646a4a5af00001', '催办：HR审批', '3', 'admin', NULL, 'admin，您好！\r\n请前待办任务办理事项！HR审批\r\n\r\n\r\n===========================\r\n此消息由系统发出', '2018-07-05 19:53:35', '2', NULL, NULL, NULL, 'admin', '2018-07-05 19:53:35', 'admin', '2018-07-07 13:45:24');
INSERT INTO `sys_sms` VALUES ('402881f3647da06c01647da43a940014', '催办：HR审批', '3', 'admin', NULL, 'admin，您好！\r\n请前待办任务办理事项！HR审批\r\n\r\n\r\n===========================\r\n此消息由系统发出', '2018-07-09 14:04:32', '2', NULL, NULL, NULL, 'admin', '2018-07-09 14:04:32', 'admin', '2018-07-09 18:51:30');

-- ----------------------------
-- Table structure for sys_sms_template
-- ----------------------------
DROP TABLE IF EXISTS `sys_sms_template`;
CREATE TABLE `sys_sms_template`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `template_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模板标题',
  `template_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模板CODE',
  `template_type` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模板类型：1短信 2邮件 3微信',
  `template_content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模板内容',
  `template_test_json` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模板测试json',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建日期',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人登录名称',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新日期',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人登录名称',
  `use_status` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否使用中 1是0否',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_sst_template_code`(`template_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_sms_template
-- ----------------------------
INSERT INTO `sys_sms_template` VALUES ('1199606397416775681', '系统消息通知', 'sys_ts_note', '2', '<h1>&nbsp; &nbsp; 系统通知</h1>\n<ul>\n<li>通知时间：&nbsp; ${ts_date}</li>\n<li>通知内容：&nbsp; ${ts_content}</li>\n</ul>', NULL, '2019-11-27 16:30:27', 'admin', '2019-11-27 19:36:50', 'admin', NULL);
INSERT INTO `sys_sms_template` VALUES ('1199615897335095298', '流程催办', 'bpm_cuiban', '2', '<h1>&nbsp; &nbsp;流程催办提醒</h1>\n<ul>\n<li>流程名称：&nbsp; ${bpm_name}</li>\n<li>催办任务：&nbsp; ${bpm_task}</li>\n<li>催办时间 :&nbsp; &nbsp; ${datetime}</li>\n<li>催办内容 :&nbsp; &nbsp; ${remark}</li>\n</ul>', NULL, '2019-11-27 17:08:12', 'admin', '2019-11-27 19:36:45', 'admin', NULL);
INSERT INTO `sys_sms_template` VALUES ('1199648914107625473', '流程办理超时提醒', 'bpm_chaoshi_tip', '2', '<h1>&nbsp; &nbsp;流程办理超时提醒</h1>\n<ul>\n<li>&nbsp; &nbsp;超时提醒信息：&nbsp; &nbsp; 您有待处理的超时任务，请尽快处理！</li>\n<li>&nbsp; &nbsp;超时任务标题：&nbsp; &nbsp; ${title}</li>\n<li>&nbsp; &nbsp;超时任务节点：&nbsp; &nbsp; ${task}</li>\n<li>&nbsp; &nbsp;任务处理人：&nbsp; &nbsp; &nbsp; &nbsp;${user}</li>\n<li>&nbsp; &nbsp;任务开始时间：&nbsp; &nbsp; ${time}</li>\n</ul>', NULL, '2019-11-27 19:19:24', 'admin', '2019-11-27 19:36:37', 'admin', NULL);
INSERT INTO `sys_sms_template` VALUES ('4028608164691b000164693108140003', '催办：${taskName}', 'SYS001', '1', '${userName}，您好！\r\n请前待办任务办理事项！${taskName}\r\n\r\n\r\n===========================\r\n此消息由系统发出', '{\r\n\"taskName\":\"HR审批\",\r\n\"userName\":\"admin\"\r\n}', '2018-07-05 14:46:18', 'admin', '2018-07-05 18:31:34', 'admin', NULL);

-- ----------------------------
-- Table structure for sys_tenant
-- ----------------------------
DROP TABLE IF EXISTS `sys_tenant`;
CREATE TABLE `sys_tenant`  (
  `id` int(10) NOT NULL COMMENT '租户编码',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户名称',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `begin_date` datetime NULL DEFAULT NULL COMMENT '开始时间',
  `end_date` datetime NULL DEFAULT NULL COMMENT '结束时间',
  `status` int(1) NULL DEFAULT NULL COMMENT '状态 1正常 0冻结',
  `trade` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所属行业',
  `company_size` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公司规模',
  `company_address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公司地址',
  `company_logo` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公司logo',
  `house_number` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '门牌号',
  `work_place` varchar(100) CHARACTER SET utf32 COLLATE utf32_general_ci NULL DEFAULT NULL COMMENT '工作地点',
  `secondary_domain` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '二级域名',
  `login_bkgd_img` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录背景图片',
  `position` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '职级',
  `department` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '部门',
  `del_flag` tinyint(1) NULL DEFAULT 0 COMMENT '删除状态(0-正常,1-已删除)',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `apply_status` int(3) NULL DEFAULT NULL COMMENT '允许申请管理员 1允许 0不允许',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '多租户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_tenant
-- ----------------------------
INSERT INTO `sys_tenant` VALUES (1, '白酒集团', '2020-07-10 15:43:32', 'admin', NULL, NULL, 1, NULL, NULL, NULL, NULL, '7WIUCW', NULL, NULL, NULL, NULL, NULL, 1, 'admin', '2023-03-09 20:27:48', 1);
INSERT INTO `sys_tenant` VALUES (1000, '北京敲敲云科技有限公司', '2023-03-09 19:55:11', 'admin', NULL, NULL, 1, NULL, NULL, NULL, NULL, '2PI3U6', NULL, NULL, NULL, NULL, NULL, 0, 'admin', '2023-03-09 21:38:56', NULL);

-- ----------------------------
-- Table structure for sys_tenant_pack
-- ----------------------------
DROP TABLE IF EXISTS `sys_tenant_pack`;
CREATE TABLE `sys_tenant_pack`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键id',
  `tenant_id` int(10) NULL DEFAULT NULL COMMENT '租户id',
  `pack_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '产品包名',
  `status` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '开启状态(0 未开启 1开启)',
  `remarks` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` date NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` date NULL DEFAULT NULL COMMENT '更新时间',
  `pack_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '编码,默认添加的三个管理员需要设置编码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '租户产品包' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_tenant_pack
-- ----------------------------

-- ----------------------------
-- Table structure for sys_tenant_pack_perms
-- ----------------------------
DROP TABLE IF EXISTS `sys_tenant_pack_perms`;
CREATE TABLE `sys_tenant_pack_perms`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键编号',
  `pack_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户产品包名称',
  `permission_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单id',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` date NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` date NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '租户产品包和菜单关系表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_tenant_pack_perms
-- ----------------------------

-- ----------------------------
-- Table structure for sys_tenant_pack_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_tenant_pack_user`;
CREATE TABLE `sys_tenant_pack_user`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `pack_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户产品包ID',
  `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户ID',
  `tenant_id` int(10) NULL DEFAULT NULL COMMENT '租户ID',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `status` int(3) NULL DEFAULT NULL COMMENT '状态 正常状态1 申请状态0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '租户套餐人员表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_tenant_pack_user
-- ----------------------------
INSERT INTO `sys_tenant_pack_user` VALUES ('1633795234318729217', '1633795213938606082', 'a75d45a015c44384a04449ee80dc3503', 1, 'admin', '2023-03-09 19:41:53', NULL, NULL, 1);

-- ----------------------------
-- Table structure for sys_third_account
-- ----------------------------
DROP TABLE IF EXISTS `sys_third_account`;
CREATE TABLE `sys_third_account`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '编号',
  `sys_user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '第三方登录id',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
  `status` tinyint(1) NULL DEFAULT NULL COMMENT '状态(1-正常,2-冻结)',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除状态(0-正常,1-已删除)',
  `realname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `third_user_uuid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '第三方账号',
  `third_user_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '第三方app用户账号',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人登录名称',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建日期',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人登录名称',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新日期',
  `third_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录来源',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_sys_third_account_third_type_third_user_id`(`third_type`, `third_user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_third_account
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键id',
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录账号',
  `realname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `salt` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'md5密码盐',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `birthday` datetime NULL DEFAULT NULL COMMENT '生日',
  `sex` tinyint(1) NULL DEFAULT NULL COMMENT '性别(0-默认未知,1-男,2-女)',
  `email` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮件',
  `phone` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `org_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录会话的机构编码',
  `status` tinyint(1) NULL DEFAULT NULL COMMENT '性别(1-正常,2-冻结)',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除状态(0-正常,1-已删除)',
  `third_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '第三方登录的唯一标识',
  `third_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '第三方类型',
  `activiti_sync` tinyint(1) NULL DEFAULT NULL COMMENT '同步工作流引擎(1-同步,0-不同步)',
  `work_no` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工号，唯一键',
  `post` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职务，关联职务表',
  `telephone` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '座机号',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `user_identity` tinyint(1) NULL DEFAULT NULL COMMENT '身份（1普通成员 2上级）',
  `depart_ids` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责部门',
  `client_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备ID',
  `login_tenant_id` int(11) NULL DEFAULT NULL COMMENT '上次登录选择租户ID',
  `bpm_status` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流程入职离职状态',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_sys_user_work_no`(`work_no`) USING BTREE,
  UNIQUE INDEX `uniq_sys_user_username`(`username`) USING BTREE,
  UNIQUE INDEX `uniq_sys_user_phone`(`phone`) USING BTREE,
  UNIQUE INDEX `uniq_sys_user_email`(`email`) USING BTREE,
  INDEX `idx_su_username`(`username`) USING BTREE,
  INDEX `idx_su_status`(`status`) USING BTREE,
  INDEX `idx_su_del_flag`(`del_flag`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('3d464b4ea0d2491aab8a7bde74c57e95', 'zhangsan', '张三', '02ea098224c7d0d2077c14b9a3a1ed16', 'x5xRdeKB', 'https://static.xxx.com/images/eemp.png', NULL, NULL, NULL, NULL, '财务部', 1, 0, NULL, NULL, 1, '0005', '总经理', NULL, 'admin', '2020-05-14 21:26:24', 'admin', '2020-09-09 14:42:51', 1, '', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES ('e9ca23d68d884d4ebb19d07889727dae', 'admin', '管理员', 'cb362cfeefbf3d8d', 'RCGTeGiH', 'https://static.xxx.com/images/eemp.png', '2018-12-05 00:00:00', 1, 'xxxx@163.com', '18611111111', 'A01', 1, 0, NULL, NULL, 1, '00001', '总经理', NULL, NULL, '2019-06-21 17:54:10', 'admin', '2023-03-09 20:29:46', 2, '', NULL, 1000, NULL);
INSERT INTO `sys_user` VALUES ('f0019fdebedb443c98dcb17d88222c38', 'zhagnxiao', '张小红12', 'f898134e5e52ae11a2ffb2c3b57a4e90', 'go3jJ4zX', 'https://static.xxx.com/images/eemp.png', '2019-04-01 00:00:00', NULL, NULL, '18611711111', '研发部,财务部', 1, 0, NULL, NULL, 1, '00003', 'devleader,总经理', NULL, 'admin', '2020-10-01 19:34:10', 'admin', '2023-03-09 19:44:13', 2, '1582683631414632450', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_user_agent
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_agent`;
CREATE TABLE `sys_user_agent`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '序号',
  `user_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `agent_user_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '代理人用户名',
  `start_time` datetime NULL DEFAULT NULL COMMENT '代理开始时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '代理结束时间',
  `status` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态0无效1有效',
  `create_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人名称',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人登录名称',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建日期',
  `update_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人名称',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人登录名称',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新日期',
  `sys_org_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属部门',
  `sys_company_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属公司',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_sug_user_name`(`user_name`) USING BTREE,
  INDEX `idx_sug_status`(`status`) USING BTREE,
  INDEX `idx_sug_start_time`(`start_time`) USING BTREE,
  INDEX `idx_sug_end_time`(`end_time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户代理人设置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_agent
-- ----------------------------
INSERT INTO `sys_user_agent` VALUES ('1632029640019922945', 'zhagnxiao', 'jeecg', '2023-03-04 22:45:50', '2023-03-04 05:00:00', '1', NULL, 'admin', '2023-03-04 22:46:02', NULL, NULL, NULL, 'A01', NULL);

-- ----------------------------
-- Table structure for sys_user_depart
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_depart`;
CREATE TABLE `sys_user_depart`  (
  `ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id',
  `user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户id',
  `dep_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门id',
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `idx_sud_user_id`(`user_id`) USING BTREE,
  INDEX `idx_sud_dep_id`(`dep_id`) USING BTREE,
  INDEX `idx_sud_user_dep_id`(`user_id`, `dep_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_depart
-- ----------------------------
INSERT INTO `sys_user_depart` VALUES ('1303584634328633345', '3d464b4ea0d2491aab8a7bde74c57e95', 'a7d7e77e06c84325a40932163adcdaa6');
INSERT INTO `sys_user_depart` VALUES ('1256487210695356418', 'a75d45a015c44384a04449ee80dc3503', 'a7d7e77e06c84325a40932163adcdaa6');
INSERT INTO `sys_user_depart` VALUES ('1f3a0267811327b9eca86b0cc2b956f3', 'bcbe1290783a469a83ae3bd8effe15d4', '5159cde220114246b045e574adceafe9');
INSERT INTO `sys_user_depart` VALUES ('1633795820112003074', 'f0019fdebedb443c98dcb17d88222c38', '1582683631414632450');
INSERT INTO `sys_user_depart` VALUES ('1633795820124585985', 'f0019fdebedb443c98dcb17d88222c38', '57197590443c44f083d42ae24ef26a2c');
INSERT INTO `sys_user_depart` VALUES ('1633795820137168898', 'f0019fdebedb443c98dcb17d88222c38', '67fc001af12a4f9b8458005d3f19934a');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键id',
  `user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户id',
  `role_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色id',
  `tenant_id` int(10) NULL DEFAULT 0 COMMENT '租户ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sur_user_id`(`user_id`) USING BTREE,
  INDEX `idx_sur_role_id`(`role_id`) USING BTREE,
  INDEX `idx_sur_user_role_id`(`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('0ede6d23d53bc7dc990346ff14faabee', '3db4cf42353f4e868b7ccfeef90505d2', 'ee8626f80f7c2619917b6236f3a7f02b', 0);
INSERT INTO `sys_user_role` VALUES ('1256487210544361473', 'a75d45a015c44384a04449ee80dc3503', 'ee8626f80f7c2619917b6236f3a7f02b', 0);
INSERT INTO `sys_user_role` VALUES ('1303584634118918145', '3d464b4ea0d2491aab8a7bde74c57e95', 'ee8626f80f7c2619917b6236f3a7f02b', 0);
INSERT INTO `sys_user_role` VALUES ('1633795820044894209', 'f0019fdebedb443c98dcb17d88222c38', 'ee8626f80f7c2619917b6236f3a7f02b', 0);
INSERT INTO `sys_user_role` VALUES ('1633807285908926466', 'e9ca23d68d884d4ebb19d07889727dae', '1501570619841810433', 1000);
INSERT INTO `sys_user_role` VALUES ('1633807285971841026', 'e9ca23d68d884d4ebb19d07889727dae', 'f6817f48af4fb3af11b9e8bf182f618b', 1000);
INSERT INTO `sys_user_role` VALUES ('31af310584bd5795f76b1fe8c38294a0', '70f5dcf03f36471dabba81381919291f', 'e51758fa916c881624b046d26bd09230', 0);
INSERT INTO `sys_user_role` VALUES ('79d66ef7aa137cfa9957081a1483009d', '9a668858c4c74cf5a2b25ad9608ba095', 'ee8626f80f7c2619917b6236f3a7f02b', 0);
INSERT INTO `sys_user_role` VALUES ('8d7846ec783e157174e4ce2949231a65', '7ee6630e89d17afbf6d12150197b578d', 'e51758fa916c881624b046d26bd09230', 0);
INSERT INTO `sys_user_role` VALUES ('b3ffd9311a1ca296c44e2409b547384f', '01b802058ea94b978a2c96f4807f6b48', '1', 0);
INSERT INTO `sys_user_role` VALUES ('be2639167ede09379937daca7fc3bb73', '526f300ab35e44faaed54a9fb0742845', 'ee8626f80f7c2619917b6236f3a7f02b', 0);
INSERT INTO `sys_user_role` VALUES ('e78d210d24aaff48e0a736e2ddff4cdc', '3e177fede453430387a8279ced685679', 'ee8626f80f7c2619917b6236f3a7f02b', 0);
INSERT INTO `sys_user_role` VALUES ('ee45d0343ecec894b6886effc92cb0b7', '4d8fef4667574b24a9ccfedaf257810c', 'f6817f48af4fb3af11b9e8bf182f618b', 0);
INSERT INTO `sys_user_role` VALUES ('f2922a38ba24fb53749e45a0c459adb3', '439ae3e9bcf7418583fcd429cadb1d72', '1', 0);
INSERT INTO `sys_user_role` VALUES ('f2de3ae7b5efd8345581aa802a6675d6', '41b1be8d4c52023b0798f51164ca682d', 'e51758fa916c881624b046d26bd09230', 0);
INSERT INTO `sys_user_role` VALUES ('f72c6190b0722e798147e73c776c6ac9', '439ae3e9bcf7418583fcd429cadb1d72', 'ee8626f80f7c2619917b6236f3a7f02b', 0);

-- ----------------------------
-- Table structure for sys_user_tenant
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_tenant`;
CREATE TABLE `sys_user_tenant`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键id',
  `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户id',
  `tenant_id` int(10) NULL DEFAULT NULL COMMENT '租户id',
  `status` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态(1 正常 2 离职 3 待审核 4 审核未通过)',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人登录名称',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建日期',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人登录名称',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sut_user_id`(`user_id`) USING BTREE,
  INDEX `idx_sut_tenant_id`(`tenant_id`) USING BTREE,
  INDEX `uniq_sut_user_rel_tenant`(`user_id`, `tenant_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户租户关系表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_tenant
-- ----------------------------

-- ------------------------------------------------------------------------------------
-- Education Tables
-- ------------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------------
-- Education Tables
-- ------------------------------------------------------------------------------------
--
-- ----------------------------
-- Table structure for edu_lab_basic_info
-- ----------------------------
DROP TABLE IF EXISTS `edu_lab_basic_info`;
CREATE TABLE `edu_lab_basic_info` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `school` varchar(256) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '学校',
  `course` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '课程',
  `lab_area` double DEFAULT NULL COMMENT '实验室-面积',
  `lab_room_num` int DEFAULT NULL COMMENT '实验室-间数',
  `preparation_room_area` double DEFAULT NULL COMMENT '准备室-面积',
  `preparation_room_num` int DEFAULT NULL COMMENT '准备室-间数',
  `instrument_storage_room_area` double DEFAULT NULL COMMENT '仪器保管室-面积',
  `instrument_storage_room_num` int DEFAULT NULL COMMENT '仪器保管室-间数',
  `experimenter_count` int DEFAULT NULL COMMENT '实验员-人数',
  `experimenter_fulltime` int DEFAULT NULL COMMENT '实验员-专职',
  `experimenter_parttime` int DEFAULT NULL COMMENT '实验员-兼职',
  `create_by` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_by` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新日期',
  `sys_org_code` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '所属部门',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;


-- ----------------------------
-- Table structure for edu_music_equipment_info
-- ----------------------------
DROP TABLE IF EXISTS `edu_music_equipment_info`;
CREATE TABLE `edu_music_equipment_info` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `school` varchar(256) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '学校',
  `category_code` varchar(32) COLLATE utf8mb4_general_ci NOT NULL COMMENT '分类代码',
  `name` varchar(128) COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `spec_model_func` varchar(512) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '规格型号功能',
  `unit` varchar(32) COLLATE utf8mb4_general_ci NOT NULL COMMENT '单位',
  `quantity` int DEFAULT NULL COMMENT '数量',
  `equipment_requirement` varchar(32) COLLATE utf8mb4_general_ci NOT NULL COMMENT '配备要求',
  `executive_standard_code` varchar(32) COLLATE utf8mb4_general_ci NOT NULL COMMENT '执行标准代号',
  `year` varchar(32) COLLATE utf8mb4_general_ci NOT NULL COMMENT '年份',
  `year_start_num` int DEFAULT NULL COMMENT '年初数',
  `year_delta` int DEFAULT NULL COMMENT '增减数',
  `year_end_num` int DEFAULT NULL COMMENT '年底数',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `sys_org_code` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '所属部门',
  `create_by` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_by` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;


-- ----------------------------
-- Table structure for edu_equipment_register_info
-- ----------------------------
DROP TABLE IF EXISTS `edu_equipment_register_info`;
CREATE TABLE `edu_equipment_register_info` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `school` varchar(256) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '学校',
  `principal` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '校长',
  `vice_principal` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '分管校长',
  `experimenter` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '实验员',
  `network_manager` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '网络管理员',
  `librarian` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '图书管理员',
  `minor_manager` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '体音美管理员',
  `sys_org_code` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '所属部门',
  `create_by` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_by` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;



-- ----------------------------
-- Table structure for edu_art_equipment_info
-- ----------------------------
DROP TABLE IF EXISTS `edu_art_equipment_info`;
CREATE TABLE `edu_art_equipment_info` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `school` varchar(256) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '学校',
  `category_code` varchar(32) COLLATE utf8mb4_general_ci NOT NULL COMMENT '分类代码',
  `name` varchar(128) COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `spec_model_func` varchar(512) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '规格型号功能',
  `unit` varchar(32) COLLATE utf8mb4_general_ci NOT NULL COMMENT '单位',
  `quantity` int DEFAULT NULL COMMENT '数量',
  `equipment_requirement` varchar(32) COLLATE utf8mb4_general_ci NOT NULL COMMENT '配备要求',
  `executive_standard_code` varchar(32) COLLATE utf8mb4_general_ci NOT NULL COMMENT '执行标准代号',
  `year` varchar(32) COLLATE utf8mb4_general_ci NOT NULL COMMENT '年份',
  `year_start_num` int DEFAULT NULL COMMENT '年初数',
  `year_delta` int DEFAULT NULL COMMENT '增减数',
  `year_end_num` int DEFAULT NULL COMMENT '年底数',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `sys_org_code` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '所属部门',
  `create_by` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_by` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for edu_mathematics_equipment_info
-- ----------------------------
DROP TABLE IF EXISTS `edu_mathematics_equipment_info`;
CREATE TABLE `edu_mathematics_equipment_info` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `school` varchar(256) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '学校',
  `category_code` varchar(32) COLLATE utf8mb4_general_ci NOT NULL COMMENT '分类代码',
  `name` varchar(128) COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `spec_model_func` varchar(512) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '规格型号功能',
  `unit` varchar(32) COLLATE utf8mb4_general_ci NOT NULL COMMENT '单位',
  `quantity` int DEFAULT NULL COMMENT '数量',
  `equipment_requirement` varchar(32) COLLATE utf8mb4_general_ci NOT NULL COMMENT '配备要求',
  `executive_standard_code` varchar(32) COLLATE utf8mb4_general_ci NOT NULL COMMENT '执行标准代号',
  `year` varchar(32) COLLATE utf8mb4_general_ci NOT NULL COMMENT '年份',
  `year_start_num` int DEFAULT NULL COMMENT '年初数',
  `year_delta` int DEFAULT NULL COMMENT '增减数',
  `year_end_num` int DEFAULT NULL COMMENT '年底数',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `sys_org_code` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '所属部门',
  `create_by` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_by` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;


-- ----------------------------
-- Table structure for edu_sport_equipment_info
-- ----------------------------
DROP TABLE IF EXISTS `edu_sport_equipment_info`;
CREATE TABLE `edu_sport_equipment_info` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `school` varchar(256) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '学校',
  `category_code` varchar(32) COLLATE utf8mb4_general_ci NOT NULL COMMENT '分类代码',
  `name` varchar(128) COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `spec_model_func` varchar(512) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '规格型号功能',
  `unit` varchar(32) COLLATE utf8mb4_general_ci NOT NULL COMMENT '单位',
  `quantity` int DEFAULT NULL COMMENT '数量',
  `equipment_requirement` varchar(32) COLLATE utf8mb4_general_ci NOT NULL COMMENT '配备要求',
  `executive_standard_code` varchar(32) COLLATE utf8mb4_general_ci NOT NULL COMMENT '执行标准代号',
  `year` varchar(32) COLLATE utf8mb4_general_ci NOT NULL COMMENT '年份',
  `year_start_num` int DEFAULT NULL COMMENT '年初数',
  `year_delta` int DEFAULT NULL COMMENT '增减数',
  `year_end_num` int DEFAULT NULL COMMENT '年底数',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `sys_org_code` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '所属部门',
  `create_by` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_by` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;


-- ----------------------------
-- Table structure for edu_library_basic_info
-- ----------------------------
DROP TABLE IF EXISTS `edu_library_basic_info`;
CREATE TABLE `edu_library_basic_info` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `school` varchar(256) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '学校',
  `library_area` double DEFAULT NULL COMMENT '藏书室面积',
  `library_rack` int DEFAULT NULL COMMENT '藏书室藏书架(个)',
  `reading_room_num` double DEFAULT NULL COMMENT '学生阅览室面积',
  `reading_table_num` int DEFAULT NULL COMMENT '学生阅览室阅览桌',
  `reading_stool_num` int DEFAULT NULL COMMENT '学生阅览室阅览凳',
  `teacher_reading_room_area` double DEFAULT NULL COMMENT '教师阅览室面积',
  `books` int DEFAULT NULL COMMENT '藏书册数',
  `avg_books` double DEFAULT NULL COMMENT '生均册数',
  `investment_amount` double DEFAULT NULL COMMENT '投入金额(万元)',
  `manager_num` int DEFAULT NULL COMMENT '管理人员人数',
  `manager_fulltime_num` int DEFAULT NULL COMMENT '管理人员专职',
  `manager_parttime_num` int DEFAULT NULL COMMENT '管理人员兼职',
  `create_by` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_by` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新日期',
  `sys_org_code` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '所属部门',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;


-- ----------------------------
-- Table structure for edu_sports_music_art_rooms
-- ----------------------------
DROP TABLE IF EXISTS `edu_sports_music_art_rooms`;
CREATE TABLE `edu_sports_music_art_rooms` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `school` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '学校',
  `sports_indoor_playground_num` int DEFAULT '0' COMMENT '室内操场间数',
  `sports_indoor_playground_area` double DEFAULT '0' COMMENT '室内操场面积',
  `sports_equipment_room_num` int DEFAULT '0' COMMENT '体育器材室间数',
  `sports_equipment_room_area` double DEFAULT '0' COMMENT '体育器材室面积',
  `sports_testing_room_num` int DEFAULT '0' COMMENT '体质测试室间数',
  `sports_testing_room_area` double DEFAULT '0' COMMENT '体质测试室面积',
  `sports_counseling_room_num` int DEFAULT '0' COMMENT '心理咨询室间数',
  `sports_counseling_room_area` double DEFAULT '0' COMMENT '心理咨询室面积',
  `music_classroom_num` int DEFAULT '0' COMMENT '音乐教室间数',
  `music_classroom_area` double DEFAULT '0' COMMENT '音乐教室面积',
  `music_equipment_room_num` int DEFAULT '0' COMMENT '音乐器材室间数',
  `music_equipment_room_area` double DEFAULT '0' COMMENT '音乐器材室面积',
  `music_dance_room_num` int DEFAULT '0' COMMENT '舞蹈室间数',
  `music_dance_room_area` double DEFAULT '0' COMMENT '舞蹈室面积',
  `music_rehearsal_room_num` int DEFAULT '0' COMMENT '音乐排练室间数',
  `music_rehearsal_room_area` double DEFAULT '0' COMMENT '音乐排练室面积',
  `art_equipment_num` int DEFAULT '0' COMMENT '美术教室间数',
  `art_equipment_area` double DEFAULT '0' COMMENT '美术教室面积',
  `art_classroom_num` int DEFAULT '0' COMMENT '美术器材室间数',
  `art_classroom_area` double DEFAULT '0' COMMENT '美术器材室面积',
  `sys_org_code` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '所属部门',
  `create_by` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_by` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;


-- ----------------------------
-- Table structure for edu_informatization_basic_info
-- ----------------------------
DROP TABLE IF EXISTS `edu_informatization_basic_info`;
CREATE TABLE `edu_informatization_basic_info` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `school` varchar(256) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '学校',
  `classes_count` int DEFAULT '0' COMMENT '班级数',
  `student_count` int DEFAULT '0' COMMENT '学生数',
  `teacher_count` int DEFAULT '0' COMMENT '教师数',
  `computer_techear_num` int DEFAULT '0' COMMENT '教师用机',
  `computer_student_num` int DEFAULT '0' COMMENT '学生用机',
  `projection_mode_num` int DEFAULT '0' COMMENT '班班通投影',
  `touch_mode_num` int DEFAULT '0' COMMENT '班班通触控机',
  `tv_computer_mode_num` int DEFAULT '0' COMMENT '班班通电视电脑',
  `gateway_num` int DEFAULT '0' COMMENT '网关',
  `router1000_num` int DEFAULT '0' COMMENT '千兆路由器',
  `router100_num` int DEFAULT '0' COMMENT '百兆路由',
  `server_num` int DEFAULT '0' COMMENT '服务器',
  `network_port_num` int DEFAULT '0' COMMENT '网路计入点',
  `wifi_router_num` int DEFAULT '0' COMMENT '无线路由器',
  `wifi_ap_num` int DEFAULT '0' COMMENT '无线AP',
  `other_device_num` int DEFAULT '0' COMMENT '其他设备',
  `switch1000_num` varchar(32) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '千兆交换机',
  `wifi_manager_num` int DEFAULT '0' COMMENT '无线管理设备',
  `recording_room_num` int DEFAULT '0' COMMENT '录播室(间)',
  `meeting_room_num` int DEFAULT '0' COMMENT '多功能会议室容纳人数',
  `meeting_room_area` double DEFAULT '0' COMMENT '多功能会议室面积',
  `remark` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `sys_org_code` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '所属部门',
  `create_by` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_by` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;


-- ----------------------------
-- Table structure for edu_informatization_basic_info
-- ----------------------------
DROP TABLE IF EXISTS `edu_scientific_equipment_info`;
CREATE TABLE `edu_scientific_equipment_info` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `school` varchar(256) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '学校',
  `number_code` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '编号',
  `name` varchar(256) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '名称',
  `unit` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '单位',
  `equipment_standard` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '配置标准',
  `year` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '年份',
  `year_start_num` int DEFAULT NULL COMMENT '年初数',
  `year_delta` int DEFAULT NULL COMMENT '增减数',
  `year_end_num` int DEFAULT NULL COMMENT '年末数',
  `sys_org_code` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '所属部门',
  `create_by` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_by` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- --------------------------------------------------------------
-- Table structure for organization_definition
-- --------------------------------------------------------------
DROP TABLE IF EXISTS `organization_definition`;
CREATE TABLE `organization_definition` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `identification_code` varchar(18) COLLATE utf8mb4_general_ci NOT NULL COMMENT '标识代码',
  `township` varchar(16) COLLATE utf8mb4_general_ci NOT NULL COMMENT '乡镇',
  `institution_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '机构名称',
  `institution_type` varchar(2) COLLATE utf8mb4_general_ci NOT NULL COMMENT '机构类型',
  `chart_group` varchar(10) DEFAULT NULL COMMENT '图表分组',
  `admin_code` varchar(18) COLLATE utf8mb4_general_ci NOT NULL COMMENT '账户名称',
  `role_code` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '角色编码',
  `initial_password` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '初始密码',
  `admin_generation_success` varchar(1) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '账户生成是否成功',
  `failure_reason` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '失败原因',
  `create_by` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_by` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新日期',
  `sys_org_code` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '所属部门',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- --------------------------------------------------------------
-- Table structure for info_phase_control
-- --------------------------------------------------------------
DROP TABLE IF EXISTS `info_phase_control`;
CREATE TABLE `info_phase_control` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `phase_code` varchar(18) COLLATE utf8mb4_general_ci NOT NULL COMMENT '时段代码',
  `phase_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '时段名称',
  `archive_status` varchar(1) COLLATE utf8mb4_general_ci NOT NULL COMMENT '归档状态',
  `archive_date` date DEFAULT NULL COMMENT '归档日期',
  `create_by` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_by` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新日期',
  `sys_org_code` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '所属部门',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- --------------------------------------------------------------
-- Table structure for edu_informatization_basic_info_1
-- --------------------------------------------------------------
DROP TABLE IF EXISTS `edu_informatization_basic_info_1`;
CREATE TABLE `edu_informatization_basic_info_1` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `identification_code` varchar(18) COLLATE utf8mb4_general_ci NOT NULL COMMENT '标识代码',
  `fill_date` date NOT NULL COMMENT '填报日期',
  `teacher_count` int NOT NULL COMMENT '任课教师总数（人）',
  `student_count` int NOT NULL COMMENT '学生总数（人）',
  `room_count` int NOT NULL COMMENT '教室（含功能室）总数（间）',
  `classroom_count` int NOT NULL COMMENT '班级教室总数（间）',
  `student_desk_count` int NOT NULL COMMENT '学生课桌椅可用数（套）',
  `connected_room_count` int NOT NULL COMMENT '已入网教室数（间）',
  `has_a_central_server_room` varchar(1) COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否建设网络中心机房',
  `teaching_resource_capacity` double NOT NULL COMMENT '学校资源库教学资源容量（GB）',
  `create_by` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_by` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新日期',
  `sys_org_code` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '所属部门',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- --------------------------------------------------------------
-- Table structure for edu_informatization_basic_info_2
-- --------------------------------------------------------------
DROP TABLE IF EXISTS `edu_informatization_basic_info_2`;
CREATE TABLE `edu_informatization_basic_info_2` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `identification_code` varchar(18) COLLATE utf8mb4_general_ci NOT NULL COMMENT '标识代码',
  `fill_date` date NOT NULL COMMENT '填报日期',
  `sub_leader_name` varchar(18) COLLATE utf8mb4_general_ci NOT NULL COMMENT '分管领导姓名',
  `sub_leader_phone_number` varchar(18) COLLATE utf8mb4_general_ci NOT NULL COMMENT '分管领导联系电话',
  `campus_network_admin_name` varchar(18) COLLATE utf8mb4_general_ci NOT NULL COMMENT '校园网络管理员姓名',
  `campus_network_phone_number` varchar(18) COLLATE utf8mb4_general_ci NOT NULL COMMENT '校园网络管理员联系电话',
  `computer_room_admin_name` varchar(18) COLLATE utf8mb4_general_ci NOT NULL COMMENT '计算机室管理员姓名',
  `computer_room_phone_number` varchar(18) COLLATE utf8mb4_general_ci NOT NULL COMMENT '计算机室管理员联系电话',
  `class_connect_admin_name` varchar(18) COLLATE utf8mb4_general_ci NOT NULL COMMENT '“班班通”管理员姓名',
  `class_connect_phone_number` varchar(18) COLLATE utf8mb4_general_ci NOT NULL COMMENT '“班班通”管理员联系电话',
  `smart_education_admin_name` varchar(18) COLLATE utf8mb4_general_ci NOT NULL COMMENT '智慧教育平台管理员姓名',
  `smart_education_phone_number` varchar(18) COLLATE utf8mb4_general_ci NOT NULL COMMENT '智慧教育平台管理员联系电话',
  `propaganda_platform_name` varchar(18) COLLATE utf8mb4_general_ci NOT NULL COMMENT '宣传平台名称',
  `propaganda_platform_owner` varchar(18) COLLATE utf8mb4_general_ci NOT NULL COMMENT '宣传平台责任人',
  `equipment_funds_this_year` double NOT NULL COMMENT '本年设备维护投入资金（万元）',
  `full_time_teacher_num` int NOT NULL COMMENT '信息技术专职教师人数',
  `part_time_teacher_num` int NOT NULL COMMENT '信息技术兼职教师人数',
  `create_by` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_by` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新日期',
  `sys_org_code` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '所属部门',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- --------------------------------------------------------------
-- Table structure for school_lab_basic_info_3
-- --------------------------------------------------------------
DROP TABLE IF EXISTS `school_lab_basic_info_3`;
CREATE TABLE `school_lab_basic_info_3` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `identification_code` varchar(18) COLLATE utf8mb4_general_ci NOT NULL COMMENT '标识代码',
  `fill_date` date NOT NULL COMMENT '填报日期',
  `physics_lab_room_num` int NOT NULL COMMENT '物理实验室间数',
  `physics_lab_area` double NOT NULL COMMENT '物理实验室面积',
  `physics_lab_bench_num` int NOT NULL COMMENT '物理实验室实验桌(张)',
  `physics_equipment_room_num` int NOT NULL COMMENT '物理器材、准备室间数',
  `physics_equipment_room_area` double NOT NULL COMMENT '物理器材、准备室面积',
  `physics_equipment_cabinet_num` int NOT NULL COMMENT '物理器材、准备室仪器柜(口)',
  `physics_equipment_bench_num` int NOT NULL COMMENT '物理器材、准备室准备台(个)',
  `biochemistry_lab_room_num` int NOT NULL COMMENT '化学（生化）实验室间数',
  `biochemistry_lab_area` double NOT NULL COMMENT '化学（生化）实验室面积',
  `biochemistry_lab_bench_num` int NOT NULL COMMENT '化学（生化）实验室实验桌(张)',
  `biochemistry_equip_room_num` int NOT NULL COMMENT '化学（生化）器材、准备室间数',
  `biochemistry_equip_room_area` double NOT NULL COMMENT '化学（生化）器材、准备室面积',
  `biochemistry_equip_cabinet_num` int NOT NULL COMMENT '化学（生化）器材、准备室仪器柜(口)',
  `biochemistry_equip_bench_num` int NOT NULL COMMENT '化学（生化）器材、准备室准备台(个)',
  `science_lab_room_num` int NOT NULL COMMENT '科学实验室间数',
  `science_lab_area` double NOT NULL COMMENT '科学实验室面积',
  `science_lab_bench_num` int NOT NULL COMMENT '科学实验室实验桌(张)',
  `science_equipment_room_num` int NOT NULL COMMENT '科学器材、准备室间数',
  `science_equipment_room_area` double NOT NULL COMMENT '科学器材、准备室面积',
  `science_equipment_cabinet_num` int NOT NULL COMMENT '科学器材、准备室仪器柜(口)',
  `science_equipment_bench_num` int NOT NULL COMMENT '科学器材、准备室准备台(个)',
  `hazardous_chemical_cabinet_num` int NOT NULL COMMENT '危化品专柜数量(口)',
  `full_time_lab_technician_num` int NOT NULL COMMENT '专职实验员人数',
  `part_time_lab_technician_num` int NOT NULL COMMENT '兼职实验员人数',
  `create_by` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_by` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新日期',
  `sys_org_code` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '所属部门',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- --------------------------------------------------------------
-- Table structure for school_library_basic_info_4
-- --------------------------------------------------------------
DROP TABLE IF EXISTS `school_library_basic_info_4`;
CREATE TABLE `school_library_basic_info_4` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `identification_code` varchar(18) COLLATE utf8mb4_general_ci NOT NULL COMMENT '标识代码',
  `fill_date` date NOT NULL COMMENT '填报日期',
  `library_num` int NOT NULL COMMENT '藏书室间数',
  `library_area` double NOT NULL COMMENT '藏书室总面积（m2）',
  `reading_room_area` double NOT NULL COMMENT '阅览室面积（m2）',
  `reading_room_table_num` int NOT NULL COMMENT '阅览室阅览桌（张）',
  `book_num` varchar(32) COLLATE utf8mb4_general_ci NOT NULL COMMENT '藏书册数',
  `has_a_book_management_system` varchar(1) COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否配备图书管理软件',
  `average_books_per_student` double NOT NULL COMMENT '生均册数',
  `first_featured_place_name` varchar(32) COLLATE utf8mb4_general_ci NOT NULL COMMENT '特色读书场所一名称',
  `first_featured_place_num` int NOT NULL COMMENT '特色读书场所一数量',
  `first_featured_place_area` double NOT NULL COMMENT '特色读书场所一总面积（m2）',
  `second_featured_place_name` varchar(32) COLLATE utf8mb4_general_ci NOT NULL COMMENT '特色读书场所二名称',
  `second_featured_place_num` int NOT NULL COMMENT '特色读书场所二数量',
  `second_featured_place_area` double NOT NULL COMMENT '特色读书场所二总面积（m2）',
  `full_time_admin_name` varchar(18) COLLATE utf8mb4_general_ci NOT NULL COMMENT '专职管理员姓名',
  `part_time_admin_name` varchar(18) COLLATE utf8mb4_general_ci NOT NULL COMMENT '兼职管理员姓名',
  `create_by` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_by` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新日期',
  `sys_org_code` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '所属部门',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- --------------------------------------------------------------
-- Table structure for school_sport_room_info_5
-- --------------------------------------------------------------
DROP TABLE IF EXISTS `school_sport_room_info_5`;
CREATE TABLE `school_sport_room_info_5` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `identification_code` varchar(18) COLLATE utf8mb4_general_ci NOT NULL COMMENT '标识代码',
  `fill_date` date NOT NULL COMMENT '填报日期',
  `indoor_playground_num` int NOT NULL COMMENT '室内操场（风雨活动室）间数',
  `indoor_playground_area` double NOT NULL COMMENT '室内操场（风雨活动室）面积（m2）',
  `straight_track_length` double NOT NULL COMMENT '室外操场直跑道长度m',
  `circular_track_circumference` double NOT NULL COMMENT '室外操场环形跑道周长m',
  `is_the_playground_hardened` varchar(1) COLLATE utf8mb4_general_ci NOT NULL COMMENT '室外操场操场是否硬化',
  `has_a_plastic_playground` varchar(1) COLLATE utf8mb4_general_ci NOT NULL COMMENT '室外操场是否有塑胶操场',
  `has_a_plastic_track` varchar(1) COLLATE utf8mb4_general_ci NOT NULL COMMENT '室外操场是否有塑胶跑道',
  `basketball_court_num` int NOT NULL COMMENT '室外操场蓝球场（个）',
  `volleyball_court_num` int NOT NULL COMMENT '室外操场排球场（个）',
  `soccer_field_area` double NOT NULL COMMENT '室外操场足球场面积（m2）',
  `playground_area` double NOT NULL COMMENT '室外操场操场面积（m2）',
  `sports_equipment_room_num` int NOT NULL COMMENT '体育器材室间数',
  `sports_equipment_room_area` double NOT NULL COMMENT '体育器材室面积（m2）',
  `sports_equipment_num` int NOT NULL COMMENT '体育器材室器材件数',
  `sports_testing_room_num` int NOT NULL COMMENT '体质测试室间数',
  `sports_testing_room_area` double NOT NULL COMMENT '体质测试室面积（m2）',
  `sports_testing_equipment_num` int NOT NULL COMMENT '体质测试室器材件数',
  `sports_counseling_room_num` int NOT NULL COMMENT '心理咨询室间数',
  `sports_counseling_room_area` double NOT NULL COMMENT '心理咨询室面积（m2）',
  `full_time_pe_teacher_num` int NOT NULL COMMENT '专职体育教师（人）',
  `part_time_pe_teacher_num` int NOT NULL COMMENT '兼职体育教师（人）',
  `create_by` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_by` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新日期',
  `sys_org_code` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '所属部门',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- --------------------------------------------------------------
-- Table structure for school_music_art_room_info_6
-- --------------------------------------------------------------
DROP TABLE IF EXISTS `school_music_art_room_info_6`;
CREATE TABLE `school_music_art_room_info_6` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `identification_code` varchar(18) COLLATE utf8mb4_general_ci NOT NULL COMMENT '标识代码',
  `fill_date` date NOT NULL COMMENT '填报日期',
  `music_equipment_room_num` int NOT NULL COMMENT '音乐器材室间数',
  `music_equipment_room_area` double NOT NULL COMMENT '音乐器材室面积（m2）',
  `music_equipment_num` int NOT NULL COMMENT '音乐器材室器材件数',
  `music_classroom_num` int NOT NULL COMMENT '音乐教室间数',
  `music_classroom_area` double NOT NULL COMMENT '音乐教室面积（m2）',
  `music_dance_room_num` int NOT NULL COMMENT '舞蹈室间数',
  `music_dance_room_area` double NOT NULL COMMENT '舞蹈室面积（m2）',
  `full_time_music_teacher_num` int NOT NULL COMMENT '专职音乐教师（人）',
  `part_time_music_teacher_num` int NOT NULL COMMENT '兼职音乐教师（人）',
  `art_classroom_num` int NOT NULL COMMENT '美术教室间数',
  `art_classroom_area` double NOT NULL COMMENT '美术教室面积（m2）',
  `art_equipment_num` int NOT NULL COMMENT '美术器材室间数',
  `art_equipment_area` double NOT NULL COMMENT '美术器材室面积（m2）',
  `full_time_art_teacher_num` int NOT NULL COMMENT '专职美术教师（人）',
  `part_time_art_teacher_num` int NOT NULL COMMENT '兼职美术教师（人）',
  `calligraphy_classroom_num` int NOT NULL COMMENT '书法教室间数',
  `calligraphy_classroom_area` double NOT NULL COMMENT '书法教室面积（m2）',
  `calligraphy_desk_num` int NOT NULL COMMENT '书法教室桌椅数（张）',
  `has_a_calligraphy_system` varchar(1) COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否配备书法软件系统',
  `create_by` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_by` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新日期',
  `sys_org_code` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '所属部门',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- --------------------------------------------------------------
-- Table structure for school_functional_room_info_7
-- --------------------------------------------------------------
DROP TABLE IF EXISTS `school_functional_room_info_7`;
CREATE TABLE `school_functional_room_info_7` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `identification_code` varchar(18) COLLATE utf8mb4_general_ci NOT NULL COMMENT '标识代码',
  `fill_date` date NOT NULL COMMENT '填报日期',
  `integrated_practice_room_num` int NOT NULL COMMENT '综合实践室间数',
  `integrated_practice_room_area` double NOT NULL COMMENT '综合实践室面积（m2）',
  `integrated_equipment_num` int NOT NULL COMMENT '综合实践室器材件数',
  `computer_classroom_num` int NOT NULL COMMENT '计算机教室间数',
  `computer_classroom_area` double NOT NULL COMMENT '计算机教室面积（m2）',
  `multifunctional_room_num` int NOT NULL COMMENT '多功能会议室（演播室）间数',
  `multifunctional_room_area` double NOT NULL COMMENT '多功能会议室（演播室）面积（m2）',
  `multifunctional_seat_num` int NOT NULL COMMENT '多功能会议室（演播室）座位数',
  `recording_classroom_num` int NOT NULL COMMENT '录播教室间数',
  `recording_classroom_area` double NOT NULL COMMENT '录播教室面积（m2）',
  `observation_classroom_num` int NOT NULL COMMENT '观摩教室间数',
  `observation_classroom_area` double NOT NULL COMMENT '观摩教室面积（m2）',
  `observation_seat_num` int NOT NULL COMMENT '观摩教室座位数',
  `maker_classroom_num` int NOT NULL COMMENT '创客教室间数',
  `maker_classroom_area` double NOT NULL COMMENT '创客教室面积（m2）',
  `maker_equipment_num` int NOT NULL COMMENT '创客教室器材件数',
  `first_featured_room_name` varchar(32) COLLATE utf8mb4_general_ci NOT NULL COMMENT '特色功能室一名称',
  `first_featured_room_num` int NOT NULL COMMENT '特色功能室一间数',
  `first_featured_room_area` double NOT NULL COMMENT '特色功能室一面积（m2）',
  `second_featured_room_name` varchar(32) COLLATE utf8mb4_general_ci NOT NULL COMMENT '特色功能室二名称',
  `second_featured_room_num` int NOT NULL COMMENT '特色功能室二间数',
  `second_featured_room_area` double NOT NULL COMMENT '特色功能室二面积（m2）',
  `create_by` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_by` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新日期',
  `sys_org_code` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '所属部门',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- --------------------------------------------------------------
-- Table structure for edu_informatization_equip_info_8
-- --------------------------------------------------------------
DROP TABLE IF EXISTS `edu_informatization_equip_info_8`;
CREATE TABLE `edu_informatization_equip_info_8` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `identification_code` varchar(18) COLLATE utf8mb4_general_ci NOT NULL COMMENT '标识代码',
  `fill_date` date NOT NULL COMMENT '填报日期',
  `classes_num` int NOT NULL COMMENT '班级数',
  `student_computer_num` int NOT NULL COMMENT '学生计算机室现有计算机总数',
  `student_computer_num_bef_2018` int NOT NULL COMMENT '学生计算机室2018年前台配备数',
  `student_computer_num_aft_2018` int NOT NULL COMMENT '学生计算机室2018年后配备数',
  `teacher_computer_num` int NOT NULL COMMENT '教师办公计算机总台数',
  `teacher_computer_num_bef_2016` int NOT NULL COMMENT '教师办公计算机2015年及以前配备台数',
  `teacher_computer_num_2016_2019` int NOT NULL COMMENT '教师办公计算机2016年至2019年配备数量',
  `teacher_computer_num_aft_2020` int NOT NULL COMMENT '教师办公计算机2020年及以后配备数量',
  `all_in_one_machine_num` int NOT NULL COMMENT '“班班通”智能触控一体机数',
  `computer_plus_tv_num` int NOT NULL COMMENT '“班班通”电脑＋电视机',
  `video_visualizer_num` int NOT NULL COMMENT '“班班通”视频展示台数量',
  `class_num_without_equip` int NOT NULL COMMENT '无班班通设备班级数',
  `is_the_backbone_gigabit` varchar(1) COLLATE utf8mb4_general_ci NOT NULL COMMENT '校园网主干线是否达到千兆(是或否)',
  `has_a_dedicated_ap_network` varchar(1) COLLATE utf8mb4_general_ci NOT NULL COMMENT '校园网是否建有AP专网(是或否)',
  `wireless_ap_num` int NOT NULL COMMENT '校园网无线AP数量',
  `campus_surveillance_camera_num` int NOT NULL COMMENT '校园监控摄像头数',
  `campus_surveillance_dvr_num` int NOT NULL COMMENT '校园监控硬盘录像机数',
  `surveillance_retention_time` int NOT NULL COMMENT '校园监控留存时间(天)',
  `create_by` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_by` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新日期',
  `sys_org_code` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '所属部门',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- --------------------------------------------------------------
-- Dict increase data
-- --------------------------------------------------------------
INSERT INTO `sys_dict` (id,dict_name,dict_code,description,del_flag,create_by,create_time,update_by,update_time,`type`,tenant_id,low_app_id) VALUES
	 ('1646431698741403649','年份','year_code','EDU',0,'admin','2023-04-13 16:34:41','admin','2023-04-14 08:38:22',0,0,NULL),
	 ('1646441850072756226','分类代码','category_code','EDU',0,'admin','2023-04-13 17:15:01','admin','2023-04-14 08:38:18',0,0,NULL),
	 ('1646673187400675330','单位','unit_code','EDU',0,'admin','2023-04-14 08:34:16','admin','2023-04-14 08:38:11',0,0,NULL),
	 ('1646674134919114754','配置要求','equipment_requirement_code','EDU',0,'admin','2023-04-14 08:38:02',NULL,NULL,0,0,NULL),
	 ('1646675510470471682','执行标准代号','executive_standard_code','EDU',0,'admin','2023-04-14 08:43:30',NULL,NULL,0,0,NULL),
	 ('1646679070507626498','教学装备名称','equipment_name_code','EDU',0,'admin','2023-04-14 08:57:39',NULL,NULL,0,0,NULL),
	 ('1646746512516796417','课程','course_code','EDU',0,'admin','2023-04-14 13:25:38',NULL,NULL,0,0,NULL);

INSERT INTO `sys_dict_item` (id,dict_id,item_text,item_value,description,sort_order,status,create_by,create_time,update_by,update_time) VALUES
	 ('1646431812453179394','1646431698741403649','2022年','2022',NULL,1,1,'admin','2023-04-13 16:35:08',NULL,NULL),
	 ('1646431862562529282','1646431698741403649','2023年','2023',NULL,2,1,'admin','2023-04-13 16:35:20','admin','2023-04-13 17:01:02'),
	 ('1646431931428806658','1646431698741403649','2024年','2024',NULL,3,1,'admin','2023-04-13 16:35:36','admin','2023-04-13 17:01:09'),
	 ('1646431979281620994','1646431698741403649','2025年','2025',NULL,5,1,'admin','2023-04-13 16:35:48','admin','2023-04-13 17:01:17'),
	 ('1646432037666332674','1646431698741403649','2026年','2026',NULL,6,1,'admin','2023-04-13 16:36:02','admin','2023-04-13 17:01:25'),
	 ('1646432082222424066','1646431698741403649','2027年','2027',NULL,7,1,'admin','2023-04-13 16:36:12','admin','2023-04-13 17:01:32'),
	 ('1646432120055046145','1646431698741403649','2028年','2028',NULL,10,1,'admin','2023-04-13 16:36:21','admin','2023-04-13 16:58:59'),
	 ('1646442234996617217','1646441850072756226','20201000900','20201000900',NULL,1,1,'admin','2023-04-13 17:16:33',NULL,NULL),
	 ('1646442289044418562','1646441850072756226','20201000100','20201000100',NULL,2,1,'admin','2023-04-13 17:16:46',NULL,NULL),
	 ('1646678153225924609','1646441850072756226','20804000100','20804000100',NULL,4,1,'admin','2023-04-14 08:54:00',NULL,NULL);
INSERT INTO `sys_dict_item` (id,dict_id,item_text,item_value,description,sort_order,status,create_by,create_time,update_by,update_time) VALUES
	 ('1646678240014462978','1646441850072756226','20201000300','20201000300',NULL,1,1,'admin','2023-04-14 08:54:21',NULL,NULL),
	 ('1646678367391281154','1646441850072756226','20201000500','20201000500',NULL,1,1,'admin','2023-04-14 08:54:51',NULL,NULL),
	 ('1646673420817887234','1646673187400675330','套','套',NULL,1,1,'admin','2023-04-14 08:35:12',NULL,NULL),
	 ('1646673557019521026','1646673187400675330','台','台',NULL,2,1,'admin','2023-04-14 08:35:44',NULL,NULL),
	 ('1646673615727194114','1646673187400675330','块','块',NULL,3,1,'admin','2023-04-14 08:35:58',NULL,NULL),
	 ('1646674331086712834','1646674134919114754','基本','basic',NULL,1,1,'admin','2023-04-14 08:38:49',NULL,NULL),
	 ('1646674400355643393','1646674134919114754','选配','option',NULL,2,1,'admin','2023-04-14 08:39:05',NULL,NULL),
	 ('1646675679958102018','1646675510470471682','JY/T0363','JYT0363',NULL,1,1,'admin','2023-04-14 08:44:11',NULL,NULL),
	 ('1646676276476211202','1646675510470471682','HJ2506-2011','HJ2506-2011','',1,1,'admin','2023-04-14 08:46:33','admin','2023-04-14 08:47:04'),
	 ('1646676486577287169','1646675510470471682','SJT11343-2006','SJT11343-2006',NULL,1,1,'admin','2023-04-14 08:47:23',NULL,NULL);
INSERT INTO `sys_dict_item` (id,dict_id,item_text,item_value,description,sort_order,status,create_by,create_time,update_by,update_time) VALUES
	 ('1646677920928591874','1646675510470471682','JYT0456','JYT0456',NULL,3,1,'admin','2023-04-14 08:53:05',NULL,NULL),
	 ('1646681057521397761','1646679070507626498','视频展示台','视频展示台',NULL,1,1,'admin','2023-04-14 09:05:33',NULL,NULL),
	 ('1646682189803122690','1646679070507626498','彩色电视机','彩色电视机',NULL,1,1,'admin','2023-04-14 09:10:03',NULL,NULL),
	 ('1646682263086002178','1646679070507626498','交互式电子白板','交互式电子白板',NULL,1,1,'admin','2023-04-14 09:10:20',NULL,NULL),
	 ('1646682342295433217','1646679070507626498','交互式教学触摸一体机','交互式教学触摸一体机',NULL,3,1,'admin','2023-04-14 09:10:39',NULL,NULL),
	 ('1646682891145277441','1646679070507626498','液品投影机','液品投影机',NULL,4,1,'admin','2023-04-14 09:12:50',NULL,NULL),
	 ('1646683032279412738','1646679070507626498','银称','银称',NULL,1,1,'admin','2023-04-14 09:13:23',NULL,NULL),
	 ('1646683320197410817','1646679070507626498','电子A白板','电子A白板',NULL,4,1,'admin','2023-04-14 09:14:32',NULL,NULL),
	 ('1646746704217460738','1646746512516796417','物理','physics',NULL,1,1,'admin','2023-04-14 13:26:24',NULL,NULL),
	 ('1646747238399823874','1646746512516796417','生物','biology',NULL,2,1,'admin','2023-04-14 13:28:31',NULL,NULL);
INSERT INTO `sys_dict_item` (id,dict_id,item_text,item_value,description,sort_order,status,create_by,create_time,update_by,update_time) VALUES
	 ('1646747607867674625','1646746512516796417','小学科学','primary_school_science',NULL,3,1,'admin','2023-04-14 13:29:59',NULL,NULL),
	 ('1646747774863888385','1646746512516796417','化学','chemistry',NULL,1,1,'admin','2023-04-14 13:30:39',NULL,NULL),
	 ('1646748025058316289','1646746512516796417','生化合一','biochemical_integration',NULL,4,1,'admin','2023-04-14 13:31:39',NULL,NULL);

INSERT INTO `sys_dict` (id,dict_name,dict_code,description,del_flag,create_by,create_time,update_by,update_time,`type`,tenant_id,low_app_id) VALUES
	 ('1664818329461768194','机构类型','institution_type','机构类型',0,'admin','2023-06-03 10:16:35','admin','2023-06-03 10:19:32',0,0,NULL),
	 ('1668873268455092226',	'乡镇列表',	'township_list',	'乡镇列表',	0,	'admin',	'2023-06-14 14:49:28',	NULL,	NULL,	0,	0,	NULL);
INSERT INTO `sys_dict_item` (id,dict_id,item_text,item_value,description,sort_order,status,create_by,create_time,update_by,update_time) VALUES
	 ('1664818497951154178','1664818329461768194','装备中心','01',NULL,1,0,'admin','2023-06-03 10:17:15',NULL,NULL),
	 ('1664818614024323074','1664818329461768194','幼儿园','11',NULL,1,1,'admin','2023-06-03 10:17:43',NULL,NULL),
	 ('1664818711713857537','1664818329461768194','中心小学','12',NULL,1,1,'admin','2023-06-03 10:18:06',NULL,NULL),
	 ('1664818711713857538','1664818329461768194','完全小学','13',NULL,1,1,'admin','2023-06-03 10:18:06',NULL,NULL),
	 ('1664818781993615362','1664818329461768194','初中','14',NULL,1,1,'admin','2023-06-03 10:18:23',NULL,NULL),
	 ('1664818888109506562','1664818329461768194','高中','15','普通/职教',1,1,'admin','2023-06-03 10:18:48',NULL,NULL),
	 ('1668874021735313410',	'1668873268455092226',	'八宝镇',	'11',	NULL,	1,	1,	'admin',	'2023-06-14 14:52:28',	NULL,	NULL),
	 ('1668874146243227650',	'1668873268455092226',	'陈店镇',	'12',	NULL,	2,	1,	'admin',	'2023-06-14 14:52:57',	NULL,	NULL),
	 ('1668874236567564289',	'1668873268455092226',	'街河市镇',	'13',	NULL,	3,	1,	'admin',	'2023-06-14 14:53:19',	NULL,	NULL),
	 ('1668874338094886913',	'1668873268455092226',	'老城镇',	'14',	NULL,	4,	1,	'admin',	'2023-06-14 14:53:43',	NULL,	NULL),
	 ('1668874421712531458',	'1668873268455092226',	'乐乡街道',	'15',	NULL,	5,	1,	'admin',	'2023-06-14 14:54:03',	NULL,	NULL),
	 ('1668874520647774210',	'1668873268455092226',	'刘家场镇',	'16',	NULL,	6,	1,	'admin',	'2023-06-14 14:54:27',	NULL,	NULL),
	 ('1668874609411829761',	'1668873268455092226',	'南海镇',	'17',	NULL,	7,	1,	'admin',	'2023-06-14 14:54:48',	NULL,	NULL),
	 ('1668874709726998530',	'1668873268455092226',	'沙道观',	'18',	NULL,	8,	1,	'admin',	'2023-06-14 14:55:12',	NULL,	NULL),
	 ('1668874803809431554',	'1668873268455092226',	'斯家场镇',	'19',	NULL,	9,	1,	'admin',	'2023-06-14 14:55:34',	NULL,	NULL),
	 ('1668874908130160642',	'1668873268455092226',	'涴市镇',	'20',	NULL,	10,	1,	'admin',	'2023-06-14 14:55:59',	NULL,	NULL),
	 ('1668874998521606145',	'1668873268455092226',	'万家乡',	'21',	NULL,	11,	1,	'admin',	'2023-06-14 14:56:21',	NULL,	NULL),
	 ('1668875081765957633',	'1668873268455092226',	'王家桥镇',	'22',	NULL,	12,	1,	'admin',	'2023-06-14 14:56:40',	NULL,	NULL),
	 ('1668875158697881601',	'1668873268455092226',	'洈水镇',	'23',	NULL,	13,	1,	'admin',	'2023-06-14 14:56:59',	NULL,	NULL),
	 ('1668875277392490498',	'1668873268455092226',	'卸甲坪乡',	'24',	NULL,	14,	1,	'admin',	'2023-06-14 14:57:27',	NULL,	NULL),
	 ('1668875357214289921',	'1668873268455092226',	'杨林市镇',	'25',	NULL,	15,	1,	'admin',	'2023-06-14 14:57:46',	NULL,	NULL),
	 ('1668875444619390977',	'1668873268455092226',	'纸厂河镇',	'26',	NULL,	16,	1,	'admin',	'2023-06-14 14:58:07',	NULL,	NULL),
	 ('1668875536655003649',	'1668873268455092226',	'市直',	'27',	NULL,	17,	1,	'admin',	'2023-06-14 14:58:29',	NULL,	NULL);

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO sys_permission(id, parent_id, name, url, component, is_route, component_name, redirect, menu_type, perms, perms_type, sort_no, always_show, icon, is_leaf, keep_alive, hidden, hide_tab, description, create_by, create_time, update_by, update_time, del_flag, rule_flag, status, internal_or_external) VALUES
     ('1666280628326367234', '1647430912296435713', '配置定义', '/edu/foudation', 'layouts/RouteView', 1, '', NULL, 1, NULL, '0', 1.00, 0, NULL, 0, 0, 0, 0, NULL, 'admin', '2023-06-07 11:07:14', NULL, NULL, 0, 0, NULL, 0),
     ('1666281667909779458', '1647430912296435713', '基本信息', '/edu/statistics', 'layouts/RouteView', 1, '', NULL, 1, NULL, '0', 2.00, 0, NULL, 0, 0, 0, 0, NULL, 'admin', '2023-06-07 11:11:22', NULL, NULL, 0, 0, NULL, 0),
     ('1666282632293515265', '1647430912296435713', '器材管理', '/edu/equipment', 'layouts/RouteView', 1, '', NULL, 1, NULL, '0', 3.00, 0, NULL, 0, 0, 0, 0, NULL, 'admin', '2023-06-07 11:15:12', NULL, NULL, 0, 0, NULL, 0);

INSERT INTO sys_permission(id, parent_id, name, url, component, component_name, redirect, menu_type, perms, perms_type, sort_no, always_show, icon, is_route, is_leaf, keep_alive, hidden, hide_tab, description, status, del_flag, rule_flag, create_by, create_time, update_by, update_time, internal_or_external) VALUES
     ('2023060312357030190', '1666280628326367234', '机构组织定义', '/edu/foudation/organizationDefinitionList', 'edu/foudation/OrganizationDefinitionList', NULL, NULL, 1, NULL, '1', 1.00, 0, NULL, 1, 0, 0, 0, 0, NULL, '1', 0, 0, 'admin', '2023-06-03 12:35:19', NULL, NULL, 0),
     /* 暂时屏蔽信息时段
     ('2023060409543950360', '1666280628326367234', '信息时段控制表', '/edu/foudation/infoPhaseControlList', 'edu/foudation/InfoPhaseControlList', NULL, NULL, 1, NULL, '1', 2.00, 0, NULL, 1, 0, 0, 0, 0, NULL, '1', 0, 0, 'admin', '2023-06-04 09:54:36', NULL, NULL, 0),
     */
     ('2023060402428380260', '1666281667909779458', '教育信息化基本情况统计表（一）', '/edu/statistics/eduInformatizationBasicInfo_1List', 'edu/statistics/EduInformatizationBasicInfo_1List', NULL, NULL, 1, NULL, '1', 1.00, 0, NULL, 1, 0, 0, 0, 0, NULL, '1', 0, 0, 'admin', '2023-06-04 14:42:26', NULL, NULL, 0),
     ('2023070711112570320', '1666281667909779458', '教育信息化基本情况统计表（二）', '/edu/statistics/eduInformatizationBasicInfo_2List', 'edu/statistics/EduInformatizationBasicInfo_2List', NULL, NULL, 1, NULL, '1', 2.00, 0, NULL, 1, 0, 0, 0, 0, NULL, '1', 0, 0, 'admin', '2023-07-07 11:11:32', NULL, NULL, 0),
     ('2023070704433360220', '1666281667909779458', '中小学实验室基本情况统计表（三）', '/edu/statistics/schoolLabBasicInfo_3List', 'edu/statistics/SchoolLabBasicInfo_3List', NULL, NULL, 1, NULL, '1', 3.00, 0, NULL, 1, 0, 0, 0, 0, NULL, '1', 0, 0, 'admin', '2023-07-07 16:43:22', NULL, NULL, 0),
     ('2023070705157320330', '1666281667909779458', '中小学图书室（馆）基本情况统计表（四）', '/edu/statistics/schoolLibraryBasicInfo_4List', 'edu/statistics/SchoolLibraryBasicInfo_4List', NULL, NULL, 1, NULL, '1', 4.00, 0, NULL, 1, 0, 0, 0, 0, NULL, '1', 0, 0, 'admin', '2023-07-07 17:15:33', NULL, NULL, 0),
     ('2023071505454370430', '1666281667909779458', '中小学体育用房统计表（五）', '/edu/statistics/schoolSportRoomInfo_5List', 'edu/statistics/SchoolSportRoomInfo_5List', NULL, NULL, 1, NULL, '1', 5.00, 0, NULL, 1, 0, 0, 0, 0, NULL, '1', 0, 0, 'admin', '2023-07-15 17:45:43', NULL, NULL, 0),
     ('2023071506100910410', '1666281667909779458', '中小学音乐、美术教学用房统计表（六）', '/edu/statistics/schoolMusicArtRoomInfo_6List', 'edu/statistics/SchoolMusicArtRoomInfo_6List', NULL, NULL, 1, NULL, '1', 6.00, 0, NULL, 1, 0, 0, 0, 0, NULL, '1', 0, 0, 'admin', '2023-07-15 18:10:41', NULL, NULL, 0),
     ('2023071507171810530', '1666281667909779458', '中小学功能室用房统计表（七）', '/edu/statistics/schoolFunctionalRoomInfo_7List', 'edu/statistics/SchoolFunctionalRoomInfo_7List', NULL, NULL, 1, NULL, '1', 7.00, 0, NULL, 1, 0, 0, 0, 0, NULL, '1', 0, 0, 'admin', '2023-07-15 19:17:53', NULL, NULL, 0),
     ('2023071507187680160', '1666281667909779458', '教育信息化配备情况统计表（八）', '/edu/statistics/eduInformatizationEquipInfo_8List', 'edu/statistics/EduInformatizationEquipInfo_8List', NULL, NULL, 1, NULL, '1', 8.00, 0, NULL, 1, 0, 0, 0, 0, NULL, '1', 0, 0, 'admin', '2023-07-15 19:18:16', NULL, NULL, 0);

INSERT INTO sys_permission(id, parent_id, name, url, component, is_route, component_name, redirect, menu_type, perms, perms_type, sort_no, always_show, icon, is_leaf, keep_alive, hidden, hide_tab, description, create_by, create_time, update_by, update_time, del_flag, rule_flag, status, internal_or_external) VALUES
     ('2023060312357030191', '2023060312357030190', '添加机构组织定义', NULL, NULL, 0, NULL, NULL, 2, 'edu.foudation:organization_definition:add', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-06-03 12:35:19', NULL, NULL, 0, 0, '1', 0),
     ('2023060312357030192', '2023060312357030190', '编辑机构组织定义', NULL, NULL, 0, NULL, NULL, 2, 'edu.foudation:organization_definition:edit', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-06-03 12:35:19', NULL, NULL, 0, 0, '1', 0),
     ('2023060312357030193', '2023060312357030190', '删除机构组织定义', NULL, NULL, 0, NULL, NULL, 2, 'edu.foudation:organization_definition:delete', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-06-03 12:35:19', NULL, NULL, 0, 0, '1', 0),
     ('2023060312357030194', '2023060312357030190', '批量删除机构组织定义', NULL, NULL, 0, NULL, NULL, 2, 'edu.foudation:organization_definition:deleteBatch', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-06-03 12:35:19', NULL, NULL, 0, 0, '1', 0),
     ('2023060312357030195', '2023060312357030190', '导出excel_机构组织定义', NULL, NULL, 0, NULL, NULL, 2, 'edu.foudation:organization_definition:exportXls', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-06-03 12:35:19', NULL, NULL, 0, 0, '1', 0),
     ('2023060312357030196', '2023060312357030190', '导入excel_机构组织定义', NULL, NULL, 0, NULL, NULL, 2, 'edu.foudation:organization_definition:importExcel', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-06-03 12:35:19', NULL, NULL, 0, 0, '1', 0),
     /* 暂时屏蔽信息时段
     ('2023060409543950361', '2023060409543950360', '添加信息时段控制表', NULL, NULL, 0, NULL, NULL, 2, 'edu.foudation:info_phase_control:add', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-06-04 09:54:36', NULL, NULL, 0, 0, '1', 0),
     ('2023060409543950362', '2023060409543950360', '编辑信息时段控制表', NULL, NULL, 0, NULL, NULL, 2, 'edu.foudation:info_phase_control:edit', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-06-04 09:54:36', NULL, NULL, 0, 0, '1', 0),
     ('2023060409543950363', '2023060409543950360', '删除信息时段控制表', NULL, NULL, 0, NULL, NULL, 2, 'edu.foudation:info_phase_control:delete', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-06-04 09:54:36', NULL, NULL, 0, 0, '1', 0),
     ('2023060409543950364', '2023060409543950360', '批量删除信息时段控制表', NULL, NULL, 0, NULL, NULL, 2, 'edu.foudation:info_phase_control:deleteBatch', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-06-04 09:54:36', NULL, NULL, 0, 0, '1', 0),
     ('2023060409543960365', '2023060409543950360', '导出excel_信息时段控制表', NULL, NULL, 0, NULL, NULL, 2, 'edu.foudation:info_phase_control:exportXls', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-06-04 09:54:36', NULL, NULL, 0, 0, '1', 0),
     ('2023060409543960366', '2023060409543950360', '导入excel_信息时段控制表', NULL, NULL, 0, NULL, NULL, 2, 'edu.foudation:info_phase_control:importExcel', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-06-04 09:54:36', NULL, NULL, 0, 0, '1', 0),
     */
     ('2023060402428380261', '2023060402428380260', '添加教育信息化基本情况统计表（一）', NULL, NULL, 0, NULL, NULL, 2, 'edu.statistics:edu_informatization_basic_info_1:add', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-06-04 14:42:26', NULL, NULL, 0, 0, '1', 0),
     ('2023060402428380262', '2023060402428380260', '编辑教育信息化基本情况统计表（一）', NULL, NULL, 0, NULL, NULL, 2, 'edu.statistics:edu_informatization_basic_info_1:edit', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-06-04 14:42:26', NULL, NULL, 0, 0, '1', 0),
     ('2023060402428380263', '2023060402428380260', '删除教育信息化基本情况统计表（一）', NULL, NULL, 0, NULL, NULL, 2, 'edu.statistics:edu_informatization_basic_info_1:delete', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-06-04 14:42:26', NULL, NULL, 0, 0, '1', 0),
     ('2023060402428380264', '2023060402428380260', '批量删除教育信息化基本情况统计表（一）', NULL, NULL, 0, NULL, NULL, 2, 'edu.statistics:edu_informatization_basic_info_1:deleteBatch', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-06-04 14:42:26', NULL, NULL, 0, 0, '1', 0),
     ('2023060402428380265', '2023060402428380260', '导出excel_教育信息化基本情况统计表（一）', NULL, NULL, 0, NULL, NULL, 2, 'edu.statistics:edu_informatization_basic_info_1:exportXls', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-06-04 14:42:26', NULL, NULL, 0, 0, '1', 0),
     ('2023060402428380266', '2023060402428380260', '导入excel_教育信息化基本情况统计表（一）', NULL, NULL, 0, NULL, NULL, 2, 'edu.statistics:edu_informatization_basic_info_1:importExcel', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-06-04 14:42:26', NULL, NULL, 0, 0, '1', 0),
     ('2023070711112570321', '2023070711112570320', '添加教育信息化基本情况统计表（二）', NULL, NULL, 0, NULL, NULL, 2, 'edu.statistics:edu_informatization_basic_info_2:add', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-07-07 11:11:32', NULL, NULL, 0, 0, '1', 0),
     ('2023070711112570322', '2023070711112570320', '编辑教育信息化基本情况统计表（二）', NULL, NULL, 0, NULL, NULL, 2, 'edu.statistics:edu_informatization_basic_info_2:edit', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-07-07 11:11:32', NULL, NULL, 0, 0, '1', 0),
     ('2023070711112570323', '2023070711112570320', '删除教育信息化基本情况统计表（二）', NULL, NULL, 0, NULL, NULL, 2, 'edu.statistics:edu_informatization_basic_info_2:delete', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-07-07 11:11:32', NULL, NULL, 0, 0, '1', 0),
     ('2023070711112570324', '2023070711112570320', '批量删除教育信息化基本情况统计表（二）', NULL, NULL, 0, NULL, NULL, 2, 'edu.statistics:edu_informatization_basic_info_2:deleteBatch', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-07-07 11:11:32', NULL, NULL, 0, 0, '1', 0),
     ('2023070711112570325', '2023070711112570320', '导出excel_教育信息化基本情况统计表（二）', NULL, NULL, 0, NULL, NULL, 2, 'edu.statistics:edu_informatization_basic_info_2:exportXls', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-07-07 11:11:32', NULL, NULL, 0, 0, '1', 0),
     ('2023070711112570326', '2023070711112570320', '导入excel_教育信息化基本情况统计表（二）', NULL, NULL, 0, NULL, NULL, 2, 'edu.statistics:edu_informatization_basic_info_2:importExcel', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-07-07 11:11:32', NULL, NULL, 0, 0, '1', 0),
     ('2023070704433370221', '2023070704433360220', '添加中小学实验室基本情况统计表（三）', NULL, NULL, 0, NULL, NULL, 2, 'edu.statistics:school_lab_basic_info_3:add', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-07-07 16:43:22', NULL, NULL, 0, 0, '1', 0),
     ('2023070704433370222', '2023070704433360220', '编辑中小学实验室基本情况统计表（三）', NULL, NULL, 0, NULL, NULL, 2, 'edu.statistics:school_lab_basic_info_3:edit', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-07-07 16:43:22', NULL, NULL, 0, 0, '1', 0),
     ('2023070704433370223', '2023070704433360220', '删除中小学实验室基本情况统计表（三）', NULL, NULL, 0, NULL, NULL, 2, 'edu.statistics:school_lab_basic_info_3:delete', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-07-07 16:43:22', NULL, NULL, 0, 0, '1', 0),
     ('2023070704433370224', '2023070704433360220', '批量删除中小学实验室基本情况统计表（三）', NULL, NULL, 0, NULL, NULL, 2, 'edu.statistics:school_lab_basic_info_3:deleteBatch', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-07-07 16:43:22', NULL, NULL, 0, 0, '1', 0),
     ('2023070704433370225', '2023070704433360220', '导出excel_中小学实验室基本情况统计表（三）', NULL, NULL, 0, NULL, NULL, 2, 'edu.statistics:school_lab_basic_info_3:exportXls', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-07-07 16:43:22', NULL, NULL, 0, 0, '1', 0),
     ('2023070704433370226', '2023070704433360220', '导入excel_中小学实验室基本情况统计表（三）', NULL, NULL, 0, NULL, NULL, 2, 'edu.statistics:school_lab_basic_info_3:importExcel', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-07-07 16:43:22', NULL, NULL, 0, 0, '1', 0),
     ('2023070705157320331', '2023070705157320330', '添加中小学图书室（馆）基本情况统计表（四）', NULL, NULL, 0, NULL, NULL, 2, 'edu.statistics:school_library_basic_info_4:add', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-07-07 17:15:33', NULL, NULL, 0, 0, '1', 0),
     ('2023070705157320332', '2023070705157320330', '编辑中小学图书室（馆）基本情况统计表（四）', NULL, NULL, 0, NULL, NULL, 2, 'edu.statistics:school_library_basic_info_4:edit', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-07-07 17:15:33', NULL, NULL, 0, 0, '1', 0),
     ('2023070705157320333', '2023070705157320330', '删除中小学图书室（馆）基本情况统计表（四）', NULL, NULL, 0, NULL, NULL, 2, 'edu.statistics:school_library_basic_info_4:delete', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-07-07 17:15:33', NULL, NULL, 0, 0, '1', 0),
     ('2023070705157320334', '2023070705157320330', '批量删除中小学图书室（馆）基本情况统计表（四）', NULL, NULL, 0, NULL, NULL, 2, 'edu.statistics:school_library_basic_info_4:deleteBatch', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-07-07 17:15:33', NULL, NULL, 0, 0, '1', 0),
     ('2023070705157320335', '2023070705157320330', '导出excel_中小学图书室（馆）基本情况统计表（四）', NULL, NULL, 0, NULL, NULL, 2, 'edu.statistics:school_library_basic_info_4:exportXls', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-07-07 17:15:33', NULL, NULL, 0, 0, '1', 0),
     ('2023070705157320336', '2023070705157320330', '导入excel_中小学图书室（馆）基本情况统计表（四）', NULL, NULL, 0, NULL, NULL, 2, 'edu.statistics:school_library_basic_info_4:importExcel', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-07-07 17:15:33', NULL, NULL, 0, 0, '1', 0),
     ('2023071505454370431', '2023071505454370430', '添加中小学体育用房统计表（五）', NULL, NULL, 0, NULL, NULL, 2, 'edu.statistics:school_sport_room_info_5:add', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-07-15 17:45:43', NULL, NULL, 0, 0, '1', 0),
     ('2023071505454370432', '2023071505454370430', '编辑中小学体育用房统计表（五）', NULL, NULL, 0, NULL, NULL, 2, 'edu.statistics:school_sport_room_info_5:edit', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-07-15 17:45:43', NULL, NULL, 0, 0, '1', 0),
     ('2023071505454370433', '2023071505454370430', '删除中小学体育用房统计表（五）', NULL, NULL, 0, NULL, NULL, 2, 'edu.statistics:school_sport_room_info_5:delete', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-07-15 17:45:43', NULL, NULL, 0, 0, '1', 0),
     ('2023071505454370434', '2023071505454370430', '批量删除中小学体育用房统计表（五）', NULL, NULL, 0, NULL, NULL, 2, 'edu.statistics:school_sport_room_info_5:deleteBatch', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-07-15 17:45:43', NULL, NULL, 0, 0, '1', 0),
     ('2023071505454370435', '2023071505454370430', '导出excel_中小学体育用房统计表（五）', NULL, NULL, 0, NULL, NULL, 2, 'edu.statistics:school_sport_room_info_5:exportXls', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-07-15 17:45:43', NULL, NULL, 0, 0, '1', 0),
     ('2023071505454370436', '2023071505454370430', '导入excel_中小学体育用房统计表（五）', NULL, NULL, 0, NULL, NULL, 2, 'edu.statistics:school_sport_room_info_5:importExcel', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-07-15 17:45:43', NULL, NULL, 0, 0, '1', 0),
     ('2023071506100910411', '2023071506100910410', '添加中小学音乐、美术教学用房统计表（六）', NULL, NULL, 0, NULL, NULL, 2, 'edu.statistics:school_music_art_room_info_6:add', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-07-15 18:10:41', NULL, NULL, 0, 0, '1', 0),
     ('2023071506100910412', '2023071506100910410', '编辑中小学音乐、美术教学用房统计表（六）', NULL, NULL, 0, NULL, NULL, 2, 'edu.statistics:school_music_art_room_info_6:edit', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-07-15 18:10:41', NULL, NULL, 0, 0, '1', 0),
     ('2023071506100910413', '2023071506100910410', '删除中小学音乐、美术教学用房统计表（六）', NULL, NULL, 0, NULL, NULL, 2, 'edu.statistics:school_music_art_room_info_6:delete', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-07-15 18:10:41', NULL, NULL, 0, 0, '1', 0),
     ('2023071506100910414', '2023071506100910410', '批量删除中小学音乐、美术教学用房统计表（六）', NULL, NULL, 0, NULL, NULL, 2, 'edu.statistics:school_music_art_room_info_6:deleteBatch', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-07-15 18:10:41', NULL, NULL, 0, 0, '1', 0),
     ('2023071506100910415', '2023071506100910410', '导出excel_中小学音乐、美术教学用房统计表（六）', NULL, NULL, 0, NULL, NULL, 2, 'edu.statistics:school_music_art_room_info_6:exportXls', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-07-15 18:10:41', NULL, NULL, 0, 0, '1', 0),
     ('2023071506100910416', '2023071506100910410', '导入excel_中小学音乐、美术教学用房统计表（六）', NULL, NULL, 0, NULL, NULL, 2, 'edu.statistics:school_music_art_room_info_6:importExcel', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-07-15 18:10:41', NULL, NULL, 0, 0, '1', 0),
     ('2023071507171810531', '2023071507171810530', '添加中小学功能室用房统计表（七）', NULL, NULL, 0, NULL, NULL, 2, 'edu.statistics:school_functional_room_info_7:add', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-07-15 19:17:53', NULL, NULL, 0, 0, '1', 0),
     ('2023071507171810532', '2023071507171810530', '编辑中小学功能室用房统计表（七）', NULL, NULL, 0, NULL, NULL, 2, 'edu.statistics:school_functional_room_info_7:edit', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-07-15 19:17:53', NULL, NULL, 0, 0, '1', 0),
     ('2023071507171810533', '2023071507171810530', '删除中小学功能室用房统计表（七）', NULL, NULL, 0, NULL, NULL, 2, 'edu.statistics:school_functional_room_info_7:delete', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-07-15 19:17:53', NULL, NULL, 0, 0, '1', 0),
     ('2023071507171810534', '2023071507171810530', '批量删除中小学功能室用房统计表（七）', NULL, NULL, 0, NULL, NULL, 2, 'edu.statistics:school_functional_room_info_7:deleteBatch', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-07-15 19:17:53', NULL, NULL, 0, 0, '1', 0),
     ('2023071507171810535', '2023071507171810530', '导出excel_中小学功能室用房统计表（七）', NULL, NULL, 0, NULL, NULL, 2, 'edu.statistics:school_functional_room_info_7:exportXls', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-07-15 19:17:53', NULL, NULL, 0, 0, '1', 0),
     ('2023071507171810536', '2023071507171810530', '导入excel_中小学功能室用房统计表（七）', NULL, NULL, 0, NULL, NULL, 2, 'edu.statistics:school_functional_room_info_7:importExcel', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-07-15 19:17:53', NULL, NULL, 0, 0, '1', 0),
     ('2023071507187680161', '2023071507187680160', '添加教育信息化配备情况统计表（八）', NULL, NULL, 0, NULL, NULL, 2, 'edu.statistics:edu_informatization_equip_info_8:add', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-07-15 19:18:16', NULL, NULL, 0, 0, '1', 0),
     ('2023071507187680162', '2023071507187680160', '编辑教育信息化配备情况统计表（八）', NULL, NULL, 0, NULL, NULL, 2, 'edu.statistics:edu_informatization_equip_info_8:edit', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-07-15 19:18:16', NULL, NULL, 0, 0, '1', 0),
     ('2023071507187680163', '2023071507187680160', '删除教育信息化配备情况统计表（八）', NULL, NULL, 0, NULL, NULL, 2, 'edu.statistics:edu_informatization_equip_info_8:delete', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-07-15 19:18:16', NULL, NULL, 0, 0, '1', 0),
     ('2023071507187680164', '2023071507187680160', '批量删除教育信息化配备情况统计表（八）', NULL, NULL, 0, NULL, NULL, 2, 'edu.statistics:edu_informatization_equip_info_8:deleteBatch', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-07-15 19:18:16', NULL, NULL, 0, 0, '1', 0),
     ('2023071507187680165', '2023071507187680160', '导出excel_教育信息化配备情况统计表（八）', NULL, NULL, 0, NULL, NULL, 2, 'edu.statistics:edu_informatization_equip_info_8:exportXls', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-07-15 19:18:16', NULL, NULL, 0, 0, '1', 0),
     ('2023071507187680166', '2023071507187680160', '导入excel_教育信息化配备情况统计表（八）', NULL, NULL, 0, NULL, NULL, 2, 'edu.statistics:edu_informatization_equip_info_8:importExcel', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-07-15 19:18:16', NULL, NULL, 0, 0, '1', 0);

INSERT INTO `sys_role_permission` (`id`, `role_id`, `permission_id`, `data_rule_ids`, `operate_date`, `operate_ip`) VALUES
     ('1666338990082748417',	'f6817f48af4fb3af11b9e8bf182f618b',	'1666280628326367234',	NULL,	'2023-06-07 14:59:09',	'127.0.0.1'),
     ('1666340189662081026',	'f6817f48af4fb3af11b9e8bf182f618b',	'1666281667909779458',	NULL,	'2023-06-07 15:03:55',	'127.0.0.1'),
     ('1666340189666275330',	'f6817f48af4fb3af11b9e8bf182f618b',	'1666282632293515265',	NULL,	'2023-06-07 15:03:55',	'127.0.0.1'),
     ('1664959650845630465',	'f6817f48af4fb3af11b9e8bf182f618b',	'2023060312357030190',	NULL,	'2023-06-03 19:38:09',	'127.0.0.1'),
     ('1664959650866601986',	'f6817f48af4fb3af11b9e8bf182f618b',	'2023060312357030191',	NULL,	'2023-06-03 19:38:09',	'127.0.0.1'),
     ('1664959650870796290',	'f6817f48af4fb3af11b9e8bf182f618b',	'2023060312357030192',	NULL,	'2023-06-03 19:38:09',	'127.0.0.1'),
     ('1664959650874990593',	'f6817f48af4fb3af11b9e8bf182f618b',	'2023060312357030193',	NULL,	'2023-06-03 19:38:09',	'127.0.0.1'),
     ('1664959650874990594',	'f6817f48af4fb3af11b9e8bf182f618b',	'2023060312357030195',	NULL,	'2023-06-03 19:38:09',	'127.0.0.1'),
     ('1664959650883379202',	'f6817f48af4fb3af11b9e8bf182f618b',	'2023060312357030194',	NULL,	'2023-06-03 19:38:09',	'127.0.0.1'),
     ('1664959650883379203',	'f6817f48af4fb3af11b9e8bf182f618b',	'2023060312357030196',	NULL,	'2023-06-03 19:38:09',	'127.0.0.1'),
     /* 暂时屏蔽信息时段
     ('1665195409792020481',	'f6817f48af4fb3af11b9e8bf182f618b',	'2023060409543950360',	NULL,	'2023-06-04 11:14:58',	'127.0.0.1'),
     ('1665195409829769217',	'f6817f48af4fb3af11b9e8bf182f618b',	'2023060409543950361',	NULL,	'2023-06-04 11:14:58',	'127.0.0.1'),
     ('1665195409833963521',	'f6817f48af4fb3af11b9e8bf182f618b',	'2023060409543950362',	NULL,	'2023-06-04 11:14:58',	'127.0.0.1'),
     ('1665195409838157826',	'f6817f48af4fb3af11b9e8bf182f618b',	'2023060409543950363',	NULL,	'2023-06-04 11:14:58',	'127.0.0.1'),
     ('1665195409838157827',	'f6817f48af4fb3af11b9e8bf182f618b',	'2023060409543950364',	NULL,	'2023-06-04 11:14:58',	'127.0.0.1'),
     ('1665195409846546433',	'f6817f48af4fb3af11b9e8bf182f618b',	'2023060409543960365',	NULL,	'2023-06-04 11:14:58',	'127.0.0.1'),
     ('1665195409850740738',	'f6817f48af4fb3af11b9e8bf182f618b',	'2023060409543960366',	NULL,	'2023-06-04 11:14:58',	'127.0.0.1'),
     */
     ('1665258381948203009',	'f6817f48af4fb3af11b9e8bf182f618b',	'2023060402428380260',	NULL,	'2023-06-04 15:25:12',	'127.0.0.1'),
     ('1665258381969174530',	'f6817f48af4fb3af11b9e8bf182f618b',	'2023060402428380261',	NULL,	'2023-06-04 15:25:12',	'127.0.0.1'),
     ('1665258381973368833',	'f6817f48af4fb3af11b9e8bf182f618b',	'2023060402428380262',	NULL,	'2023-06-04 15:25:12',	'127.0.0.1'),
     ('1665258381973368834',	'f6817f48af4fb3af11b9e8bf182f618b',	'2023060402428380263',	NULL,	'2023-06-04 15:25:12',	'127.0.0.1'),
     ('1665258381977563138',	'f6817f48af4fb3af11b9e8bf182f618b',	'2023060402428380264',	NULL,	'2023-06-04 15:25:12',	'127.0.0.1'),
     ('1665258381981757442',	'f6817f48af4fb3af11b9e8bf182f618b',	'2023060402428380265',	NULL,	'2023-06-04 15:25:12',	'127.0.0.1'),
     ('1665258381981757443',	'f6817f48af4fb3af11b9e8bf182f618b',	'2023060402428380266',	NULL,	'2023-06-04 15:25:12',	'127.0.0.1'),
     ('1677176153070256129',	'f6817f48af4fb3af11b9e8bf182f618b',	'2023070711112570320',	NULL,	'2023-07-07 12:42:10',	'127.0.0.1'),
     ('1677176153082839042',	'f6817f48af4fb3af11b9e8bf182f618b',	'2023070711112570321',	NULL,	'2023-07-07 12:42:10',	'127.0.0.1'),
     ('1677176153087033345',	'f6817f48af4fb3af11b9e8bf182f618b',	'2023070711112570322',	NULL,	'2023-07-07 12:42:10',	'127.0.0.1'),
     ('1677176153087033346',	'f6817f48af4fb3af11b9e8bf182f618b',	'2023070711112570323',	NULL,	'2023-07-07 12:42:10',	'127.0.0.1'),
     ('1677176153087033347',	'f6817f48af4fb3af11b9e8bf182f618b',	'2023070711112570324',	NULL,	'2023-07-07 12:42:10',	'127.0.0.1'),
     ('1677176153087033348',	'f6817f48af4fb3af11b9e8bf182f618b',	'2023070711112570325',	NULL,	'2023-07-07 12:42:10',	'127.0.0.1'),
     ('1677176153087033349',	'f6817f48af4fb3af11b9e8bf182f618b',	'2023070711112570326',	NULL,	'2023-07-07 12:42:10',	'127.0.0.1'),
     ('1677247001298952194',	'f6817f48af4fb3af11b9e8bf182f618b',	'2023070704433360220',	NULL,	'2023-07-07 17:23:42',	'127.0.0.1'),
     ('1677247001315729409',	'f6817f48af4fb3af11b9e8bf182f618b',	'2023070704433370221',	NULL,	'2023-07-07 17:23:42',	'127.0.0.1'),
     ('1677247001319923713',	'f6817f48af4fb3af11b9e8bf182f618b',	'2023070704433370222',	NULL,	'2023-07-07 17:23:42',	'127.0.0.1'),
     ('1677247001324118017',	'f6817f48af4fb3af11b9e8bf182f618b',	'2023070704433370223',	NULL,	'2023-07-07 17:23:42',	'127.0.0.1'),
     ('1677247001324118018',	'f6817f48af4fb3af11b9e8bf182f618b',	'2023070704433370224',	NULL,	'2023-07-07 17:23:42',	'127.0.0.1'),
     ('1677247001332506625',	'f6817f48af4fb3af11b9e8bf182f618b',	'2023070704433370225',	NULL,	'2023-07-07 17:23:42',	'127.0.0.1'),
     ('1677247001332506626',	'f6817f48af4fb3af11b9e8bf182f618b',	'2023070704433370226',	NULL,	'2023-07-07 17:23:42',	'127.0.0.1'),
     ('1678202210594512898',	'f6817f48af4fb3af11b9e8bf182f618b',	'2023070705157320330',	NULL,	'2023-07-10 08:39:21',	'127.0.0.1'),
     ('1678202210619678721',	'f6817f48af4fb3af11b9e8bf182f618b',	'2023070705157320331',	NULL,	'2023-07-10 08:39:21',	'127.0.0.1'),
     ('1678202210636455938',	'f6817f48af4fb3af11b9e8bf182f618b',	'2023070705157320332',	NULL,	'2023-07-10 08:39:21',	'127.0.0.1'),
     ('1678202210640650241',	'f6817f48af4fb3af11b9e8bf182f618b',	'2023070705157320333',	NULL,	'2023-07-10 08:39:21',	'127.0.0.1'),
     ('1678202210640650242',	'f6817f48af4fb3af11b9e8bf182f618b',	'2023070705157320334',	NULL,	'2023-07-10 08:39:21',	'127.0.0.1'),
     ('1678202210644844545',	'f6817f48af4fb3af11b9e8bf182f618b',	'2023070705157320335',	NULL,	'2023-07-10 08:39:21',	'127.0.0.1'),
     ('1678202210644844546',	'f6817f48af4fb3af11b9e8bf182f618b',	'2023070705157320336',	NULL,	'2023-07-10 08:39:21',	'127.0.0.1');

INSERT INTO `info_phase_control` (`id`, `phase_code`, `phase_name`, `archive_status`, `archive_date`, `create_by`, `create_time`, `update_by`, `update_time`, `sys_org_code`) VALUES
     ('1665199280987811841',	'2023-01',	'2023上半年',	'0',	NULL,	'admin',	'2023-06-04 11:30:21',	NULL,	NULL,	'A01'),
     ('1665199514094645250',	'2022-02',	'2022下半年',	'1',	'2022-12-31',	'admin',	'2023-06-04 11:31:17',	NULL,	NULL,	'A01'),
     ('1665200128178499586',	'2022-01',	'2022上半年',	'1',	'2022-06-30',	'admin',	'2023-06-04 11:33:43',	NULL,	NULL,	'A01');

INSERT INTO `edu_informatization_basic_info_1` (`id`, `identification_code`, `fill_date`, `teacher_count`, `student_count`, `room_count`, `classroom_count`, `student_desk_count`, `connected_room_count`, `has_a_central_server_room`, `teaching_resource_capacity`, `create_by`, `create_time`, `update_by`, `update_time`, `sys_org_code`) VALUES
     ('1665260317544001538',	'3142007024',	'2022-09-06',	210,	1600,	30,	22,	1800,	28,	'1',	21.86,	'admin_bbzx',	'2023-06-04 15:32:53',	NULL,	NULL,	'A01'),
     ('1665260317544001539',	'3142007024',	'2023-01-12',	210,	1600,	30,	22,	1800,	28,	'1',	21.86,	'admin_bbzx',	'2023-06-04 15:32:53',	NULL,	NULL,	'A01'),
     ('1665260317544001540',	'3142007024',	'2023-03-05',	210,	1600,	30,	22,	1800,	28,	'1',	21.86,	'admin_bbzx',	'2023-06-04 15:32:53',	NULL,	NULL,	'A01'),
     ('1665260317544001541',	'3142007024',	'2023-07-08',	83,	1095,	32,	21,	1100,	24,	'1',	124,	'admin_bbzx',	'2023-06-04 15:32:53',	NULL,	NULL,	'A01'),
     ('1665262789297680385',	'2142009669',	'2022-11-28',	116,	1000,	26,	18,	1200,	22,	'1',	16.28,	'admin_bbxx',	'2023-06-04 15:42:43',	NULL,	NULL,	'A01'),
     ('1665262789297680386',	'2142009669',	'2023-03-15',	120,	1000,	26,	18,	1200,	22,	'1',	16.28,	'admin_bbxx',	'2023-06-04 15:42:43',	NULL,	NULL,	'A01'),
     ('1665262789297680387',	'2142009669',	'2023-06-07',	120,	1000,	26,	18,	1200,	22,	'1',	16.28,	'admin_bbxx',	'2023-06-04 15:42:43',	NULL,	NULL,	'A01'),
     ('1665262789297680388',	'2142009669',	'2023-07-03',	120,	1000,	26,	18,	1200,	22,	'1',	16.28,	'admin_bbxx',	'2023-06-04 15:42:43',	NULL,	NULL,	'A01'),
     ('1665262789297680389',	'2142009669',	'2023-07-06',	80,	1333,	35,	25,	1383,	35,	'1',	200,	'admin_bbxx',	'2023-06-04 15:42:43',	NULL,	NULL,	'A01'),
     ('1678627997017591801',	'5262003028',	'2022-12-21',	228,	3370,	100,	84,	5000,	70,	'1',	0,	'admin_szyz',	'2023-07-11 12:51:17',	NULL,	NULL,	NULL),
     ('1678627997017591805',	'5262003028',	'2023-06-30',	230,	3380,	100,	84,	5000,	70,	'1',	0,	'admin_szyz',	'2023-07-11 12:51:17',	NULL,	NULL,	NULL),
     ('1678627997017591809',	'5262003028',	'2023-07-11',	237,	3390,	100,	84,	5000,	70,	'1',	0,	'admin_szyz',	'2023-07-11 12:51:17',	NULL,	NULL,	NULL),
     ('1678629645265817513',	'1232002606',	'2022-07-02',	32,	500,	20,	15,	100,	15,	'1',	1000,	'admin_jgyey',	'2023-07-11 12:57:50',	NULL,	NULL,	NULL),
     ('1678629645265817526',	'1232002606',	'2023-02-23',	36,	510,	20,	15,	100,	15,	'1',	1000,	'admin_jgyey',	'2023-07-11 12:57:50',	NULL,	NULL,	NULL),
     ('1678629645265817586',	'1232002606',	'2023-06-18',	38,	520,	20,	15,	100,	15,	'1',	1000,	'admin_jgyey',	'2023-07-11 12:57:50',	NULL,	NULL,	NULL),
     ('1678629645265817601',	'1232002606',	'2023-07-11',	51,	537,	20,	15,	100,	15,	'1',	1000,	'admin_jgyey',	'2023-07-11 12:57:50',	NULL,	NULL,	NULL);

-- ----------------------------
-- Table structure for edu_primary_equipment_req_template
-- ----------------------------
DROP TABLE IF EXISTS `edu_primary_equipment_req_template`;
CREATE TABLE `edu_primary_equipment_req_template` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `grade` varchar(18) COLLATE utf8mb4_general_ci NOT NULL COMMENT '年级',
  `phase_code` varchar(18) COLLATE utf8mb4_general_ci NOT NULL COMMENT '时段代码',
  `name` varchar(128) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '名称',
  `category_code` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '分类代码',
  `spec_model_func` varchar(1024) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '规格型号功能',
  `unit` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '单位',
  `quantity` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '数量',
  `equipment_requirement` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '配备要求',
  `executive_standard_code` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '执行标准代号',
  `remark` varchar(1024) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `sys_org_code` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '所属部门',
  `create_by` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_by` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO sys_permission(id, parent_id, name, url, component, is_route, component_name, redirect, menu_type, perms, perms_type, sort_no, always_show, icon, is_leaf, keep_alive, hidden, hide_tab, description, create_by, create_time, update_by, update_time, del_flag, rule_flag, status, internal_or_external) VALUES
     ('2023060404015910390', '1666280628326367234', '小学器材设施配备要求模板表', '/edu/primaryequipmentreqtemplate/eduPrimaryEquipmentReqTemplateList', '/edu/primaryequipmentreqtemplate/EduPrimaryEquipmentReqTemplateList', 1, NULL, NULL, 1, NULL, '1', 3.00, 0, NULL, 0, 0, 0, 0, NULL, 'admin', '2023-06-04 16:01:39', NULL, NULL, 0, 0, '1', 0),
     ('2023060404015920391', '2023060404015910390', '添加小学器材设施配备要求模板表', NULL, NULL, 0, NULL, NULL, 2, 'primaryequipmentreqtemplate:edu_primary_equipment_req_template:add', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-06-04 16:01:39', NULL, NULL, 0, 0, '1', 0),
     ('2023060404015920392', '2023060404015910390', '编辑小学器材设施配备要求模板表', NULL, NULL, 0, NULL, NULL, 2, 'primaryequipmentreqtemplate:edu_primary_equipment_req_template:edit', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-06-04 16:01:39', NULL, NULL, 0, 0, '1', 0),
     ('2023060404015920393', '2023060404015910390', '删除小学器材设施配备要求模板表', NULL, NULL, 0, NULL, NULL, 2, 'primaryequipmentreqtemplate:edu_primary_equipment_req_template:delete', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-06-04 16:01:39', NULL, NULL, 0, 0, '1', 0),
     ('2023060404015920394', '2023060404015910390', '批量删除小学器材设施配备要求模板表', NULL, NULL, 0, NULL, NULL, 2, 'primaryequipmentreqtemplate:edu_primary_equipment_req_template:deleteBatch', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-06-04 16:01:39', NULL, NULL, 0, 0, '1', 0),
     ('2023060404015920395', '2023060404015910390', '导出excel_小学器材设施配备要求模板表', NULL, NULL, 0, NULL, NULL, 2, 'primaryequipmentreqtemplate:edu_primary_equipment_req_template:exportXls', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-06-04 16:01:39', NULL, NULL, 0, 0, '1', 0),
     ('2023060404015920396', '2023060404015910390', '导入excel_小学器材设施配备要求模板表', NULL, NULL, 0, NULL, NULL, 2, 'primaryequipmentreqtemplate:edu_primary_equipment_req_template:importExcel', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-06-04 16:01:39', NULL, NULL, 0, 0, '1', 0);

-- ----------------------------
-- Table structure for edu_primary_sport_equipment_req
-- ----------------------------
DROP TABLE IF EXISTS `edu_primary_sport_equipment_req`;
CREATE TABLE `edu_primary_sport_equipment_req` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `identification_code` varchar(18) COLLATE utf8mb4_general_ci NOT NULL COMMENT '标识代码',
  `phase_code` varchar(18) COLLATE utf8mb4_general_ci NOT NULL COMMENT '时段代码',
  `category_code` varchar(32) COLLATE utf8mb4_general_ci NOT NULL COMMENT '分类代码',
  `spec_model_func` varchar(1024) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '规格型号功能',
  `name` varchar(128) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '名称',
  `unit` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '单位',
  `quantity` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '数量',
  `equipment_requirement` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '配备要求',
  `executive_standard_code` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '执行标准代号',
  `remark` varchar(1024) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `sys_org_code` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '所属部门',
  `create_by` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_by` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新日期',
  `actual_num` int NOT NULL COMMENT '实际数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO sys_permission(id, parent_id, name, url, component, component_name, redirect, menu_type, perms, perms_type, sort_no, always_show, icon, is_route, is_leaf, keep_alive, hidden, hide_tab, description, status, del_flag, rule_flag, create_by, create_time, update_by, update_time, internal_or_external) VALUES
     ('2023060304491680490', '1666282632293515265', '小学体育器材设施配备要求表', '/edu/primarysportequipmentreq/eduPrimarySportEquipmentReqList', '/edu/primarysportequipmentreq/EduPrimarySportEquipmentReqList', NULL, NULL, 1, NULL, '1', 1.00, 0, NULL, 1, 0, 0, 0, 0, NULL, '1', 0, 0, 'admin', '2023-06-03 16:49:49', NULL, NULL, 0);

INSERT INTO sys_permission(id, parent_id, name, url, component, is_route, component_name, redirect, menu_type, perms, perms_type, sort_no, always_show, icon, is_leaf, keep_alive, hidden, hide_tab, description, create_by, create_time, update_by, update_time, del_flag, rule_flag, status, internal_or_external) VALUES
     ('2023060304491680491', '2023060304491680490', '添加小学体育器材设施配备要求表', NULL, NULL, 0, NULL, NULL, 2, 'primarysportequipmentreq:edu_primary_sport_equipment_req:add', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-06-03 16:49:49', NULL, NULL, 0, 0, '1', 0),
     ('2023060304491680492', '2023060304491680490', '编辑小学体育器材设施配备要求表', NULL, NULL, 0, NULL, NULL, 2, 'primarysportequipmentreq:edu_primary_sport_equipment_req:edit', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-06-03 16:49:49', NULL, NULL, 0, 0, '1', 0),
     ('2023060304491680493', '2023060304491680490', '删除小学体育器材设施配备要求表', NULL, NULL, 0, NULL, NULL, 2, 'primarysportequipmentreq:edu_primary_sport_equipment_req:delete', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-06-03 16:49:49', NULL, NULL, 0, 0, '1', 0),
     ('2023060304491680494', '2023060304491680490', '批量删除小学体育器材设施配备要求表', NULL, NULL, 0, NULL, NULL, 2, 'primarysportequipmentreq:edu_primary_sport_equipment_req:deleteBatch', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-06-03 16:49:49', NULL, NULL, 0, 0, '1', 0),
     ('2023060304491680495', '2023060304491680490', '导出excel_小学体育器材设施配备要求表', NULL, NULL, 0, NULL, NULL, 2, 'primarysportequipmentreq:edu_primary_sport_equipment_req:exportXls', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-06-03 16:49:49', NULL, NULL, 0, 0, '1', 0),
     ('2023060304491680496', '2023060304491680490', '导入excel_小学体育器材设施配备要求表', NULL, NULL, 0, NULL, NULL, 2, 'primarysportequipmentreq:edu_primary_sport_equipment_req:importExcel', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-06-03 16:49:49', NULL, NULL, 0, 0, '1', 0);

INSERT INTO `sys_role` (`id`, `role_name`, `role_code`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `tenant_id`) VALUES
     ('1666258199679991810',	'装备代表 - 高中',	'senior_school',	'录入/编辑（高中）学校的信息化、装备情况及明细',	'admin',	'2023-06-07 09:38:07',	NULL,	NULL,	0),
     ('1666258199700963330',	'装备代表 - 初中',	'junior_school',	'录入/编辑（初中）学校的信息化、装备情况及明细',	'admin',	'2023-06-07 09:38:07',	NULL,	NULL,	0),
     ('1666258199717740546',	'装备代表 - 小学',	'primary_school',	'录入/编辑（小学）学校的信息化、装备情况及明细',	'admin',	'2023-06-07 09:38:07',	NULL,	NULL,	0),
     ('1666258199734517761',	'装备代表 – 幼儿园',	'nursery_school',	'录入/编辑（幼儿园）学校的信息化、装备情况及明细',	'admin',	'2023-06-07 09:38:07',	NULL,	NULL,	0),
     ('1666258199747100674',	'装备中心 – 数据检核',	'center_check',	'检查学校录入信息',	'admin',	'2023-06-07 09:38:07',	NULL,	NULL,	0),
     ('1666258199763877889',	'装备中心 – 统计分析',	'center_analysis',	'多维度汇总展现信息化、装备情况',	'admin',	'2023-06-07 09:38:07',	NULL,	NULL,	0),
     ('1666258199780655106',	'装备中心 – 系统管理',	'center_admin',	'及时更新维护学校、用户、信息时段等基础定义',	'admin',	'2023-06-07 09:38:07',	NULL,	NULL,	0);

-- 角色权限：装备中心 – 系统管理
INSERT INTO `sys_role_permission` (`id`, `role_id`, `permission_id`, `data_rule_ids`, `operate_date`, `operate_ip`) VALUES
     ('1666285008849076225',	'1666258199780655106',	'1647430912296435713',	NULL,	'2023-06-07 11:24:39',	'127.0.0.1'),
     ('1666285008849076226',	'1666258199780655106',	'1666280628326367234',	NULL,	'2023-06-07 11:24:39',	'127.0.0.1'),
     ('1666285008853270530',	'1666258199780655106',	'2023060312357030190',	NULL,	'2023-06-07 11:24:39',	'127.0.0.1'),
     ('1666285008853270531',	'1666258199780655106',	'2023060312357030191',	NULL,	'2023-06-07 11:24:39',	'127.0.0.1'),
     ('1666285008853270532',	'1666258199780655106',	'2023060312357030192',	NULL,	'2023-06-07 11:24:39',	'127.0.0.1'),
     ('1666285008853270533',	'1666258199780655106',	'2023060312357030193',	NULL,	'2023-06-07 11:24:39',	'127.0.0.1'),
     ('1666285008853270534',	'1666258199780655106',	'2023060312357030194',	NULL,	'2023-06-07 11:24:39',	'127.0.0.1'),
     ('1666285008853270535',	'1666258199780655106',	'2023060312357030195',	NULL,	'2023-06-07 11:24:39',	'127.0.0.1'),
     ('1666285008853270536',	'1666258199780655106',	'2023060312357030196',	NULL,	'2023-06-07 11:24:39',	'127.0.0.1'),
     ('1666285008857464835',	'1666258199780655106',	'2023060404015910390',	NULL,	'2023-06-07 11:24:39',	'127.0.0.1'),
     ('1666285008857464836',	'1666258199780655106',	'2023060404015920391',	NULL,	'2023-06-07 11:24:39',	'127.0.0.1'),
     ('1666285008857464837',	'1666258199780655106',	'2023060404015920392',	NULL,	'2023-06-07 11:24:39',	'127.0.0.1'),
     ('1666285008857464838',	'1666258199780655106',	'2023060404015920393',	NULL,	'2023-06-07 11:24:39',	'127.0.0.1'),
     ('1666285008857464839',	'1666258199780655106',	'2023060404015920394',	NULL,	'2023-06-07 11:24:39',	'127.0.0.1'),
     ('1666285008857464840',	'1666258199780655106',	'2023060404015920395',	NULL,	'2023-06-07 11:24:39',	'127.0.0.1'),
     ('1666285008857464841',	'1666258199780655106',	'2023060404015920396',	NULL,	'2023-06-07 11:24:39',	'127.0.0.1');
     /* 暂时屏蔽信息时段
     ('1666285008853270537',	'1666258199780655106',	'2023060409543950360',	NULL,	'2023-06-07 11:24:39',	'127.0.0.1'),
     ('1666285008853270538',	'1666258199780655106',	'2023060409543950361',	NULL,	'2023-06-07 11:24:39',	'127.0.0.1'),
     ('1666285008853270539',	'1666258199780655106',	'2023060409543950362',	NULL,	'2023-06-07 11:24:39',	'127.0.0.1'),
     ('1666285008853270540',	'1666258199780655106',	'2023060409543950363',	NULL,	'2023-06-07 11:24:39',	'127.0.0.1'),
     ('1666285008853270541',	'1666258199780655106',	'2023060409543950364',	NULL,	'2023-06-07 11:24:39',	'127.0.0.1'),
     ('1666285008853270542',	'1666258199780655106',	'2023060409543960365',	NULL,	'2023-06-07 11:24:39',	'127.0.0.1'),
     ('1666285008857464834',	'1666258199780655106',	'2023060409543960366',	NULL,	'2023-06-07 11:24:39',	'127.0.0.1');
     */

-- 角色权限：装备中心 – 统计分析
INSERT INTO `sys_role_permission` (`id`, `role_id`, `permission_id`, `data_rule_ids`, `operate_date`, `operate_ip`) VALUES
     ('1666285344305315842',	'1666258199763877889',	'1647430912296435713',	NULL,	'2023-06-07 11:25:59',	'127.0.0.1'),
     ('1666285344305315843',	'1666258199763877889',	'1666281667909779458',	NULL,	'2023-06-07 11:25:59',	'127.0.0.1'),
     ('1666285344305315844',	'1666258199763877889',	'2023060402428380260',	NULL,	'2023-06-07 11:25:59',	'127.0.0.1'),
     ('1666285344305315845',	'1666258199763877889',	'2023060402428380261',	NULL,	'2023-06-07 11:25:59',	'127.0.0.1'),
     ('1666285344305315846',	'1666258199763877889',	'2023060402428380262',	NULL,	'2023-06-07 11:25:59',	'127.0.0.1'),
     ('1666285344305315847',	'1666258199763877889',	'2023060402428380263',	NULL,	'2023-06-07 11:25:59',	'127.0.0.1'),
     ('1666285344305315848',	'1666258199763877889',	'2023060402428380264',	NULL,	'2023-06-07 11:25:59',	'127.0.0.1'),
     ('1666285344305315849',	'1666258199763877889',	'2023060402428380265',	NULL,	'2023-06-07 11:25:59',	'127.0.0.1'),
     ('1666285344305315850',	'1666258199763877889',	'2023060402428380266',	NULL,	'2023-06-07 11:25:59',	'127.0.0.1'),
     ('1677176271047639041',	'1666258199763877889',	'2023070711112570320',	NULL,	'2023-07-07 12:42:38',	'127.0.0.1'),
     ('1677176271051833346',	'1666258199763877889',	'2023070711112570321',	NULL,	'2023-07-07 12:42:38',	'127.0.0.1'),
     ('1677176271051833347',	'1666258199763877889',	'2023070711112570322',	NULL,	'2023-07-07 12:42:38',	'127.0.0.1'),
     ('1677176271051833348',	'1666258199763877889',	'2023070711112570323',	NULL,	'2023-07-07 12:42:38',	'127.0.0.1'),
     ('1677176271051833349',	'1666258199763877889',	'2023070711112570324',	NULL,	'2023-07-07 12:42:38',	'127.0.0.1'),
     ('1677176271051833350',	'1666258199763877889',	'2023070711112570325',	NULL,	'2023-07-07 12:42:38',	'127.0.0.1'),
     ('1677176271051833351',	'1666258199763877889',	'2023070711112570326',	NULL,	'2023-07-07 12:42:38',	'127.0.0.1'),
     ('1677247235240452097',	'1666258199763877889',	'2023070704433360220',	NULL,	'2023-07-07 17:24:37',	'127.0.0.1'),
     ('1677247235240452098',	'1666258199763877889',	'2023070704433370221',	NULL,	'2023-07-07 17:24:37',	'127.0.0.1'),
     ('1677247235253035009',	'1666258199763877889',	'2023070704433370222',	NULL,	'2023-07-07 17:24:37',	'127.0.0.1'),
     ('1677247235253035010',	'1666258199763877889',	'2023070704433370223',	NULL,	'2023-07-07 17:24:37',	'127.0.0.1'),
     ('1677247235253035011',	'1666258199763877889',	'2023070704433370224',	NULL,	'2023-07-07 17:24:37',	'127.0.0.1'),
     ('1677247235253035012',	'1666258199763877889',	'2023070704433370225',	NULL,	'2023-07-07 17:24:37',	'127.0.0.1'),
     ('1677247235253035013',	'1666258199763877889',	'2023070704433370226',	NULL,	'2023-07-07 17:24:37',	'127.0.0.1'),
     ('1678202292018536449',	'1666258199763877889',	'2023070705157320330',	NULL,	'2023-07-10 08:39:41',	'127.0.0.1'),
     ('1678202292022730754',	'1666258199763877889',	'2023070705157320331',	NULL,	'2023-07-10 08:39:41',	'127.0.0.1'),
     ('1678202292022730755',	'1666258199763877889',	'2023070705157320332',	NULL,	'2023-07-10 08:39:41',	'127.0.0.1'),
     ('1678202292026925057',	'1666258199763877889',	'2023070705157320333',	NULL,	'2023-07-10 08:39:41',	'127.0.0.1'),
     ('1678202292026925058',	'1666258199763877889',	'2023070705157320334',	NULL,	'2023-07-10 08:39:41',	'127.0.0.1'),
     ('1678202292031119362',	'1666258199763877889',	'2023070705157320335',	NULL,	'2023-07-10 08:39:41',	'127.0.0.1'),
     ('1678202292031119363',	'1666258199763877889',	'2023070705157320336',	NULL,	'2023-07-10 08:39:41',	'127.0.0.1'),
     ('1680407266177712130',	'1666258199763877889',	'2023071505454370430',	NULL,	'2023-07-16 10:41:27',	'127.0.0.1'),
     ('1680407266190295041',	'1666258199763877889',	'2023071505454370431',	NULL,	'2023-07-16 10:41:27',	'127.0.0.1'),
     ('1680407266190295042',	'1666258199763877889',	'2023071505454370432',	NULL,	'2023-07-16 10:41:27',	'127.0.0.1'),
     ('1680407266190295043',	'1666258199763877889',	'2023071505454370433',	NULL,	'2023-07-16 10:41:27',	'127.0.0.1'),
     ('1680407266190295044',	'1666258199763877889',	'2023071505454370434',	NULL,	'2023-07-16 10:41:27',	'127.0.0.1'),
     ('1680407266194489345',	'1666258199763877889',	'2023071505454370435',	NULL,	'2023-07-16 10:41:27',	'127.0.0.1'),
     ('1680407266194489346',	'1666258199763877889',	'2023071505454370436',	NULL,	'2023-07-16 10:41:27',	'127.0.0.1'),
     ('1680407266198683649',	'1666258199763877889',	'2023071506100910410',	NULL,	'2023-07-16 10:41:27',	'127.0.0.1'),
     ('1680407266198683650',	'1666258199763877889',	'2023071506100910411',	NULL,	'2023-07-16 10:41:27',	'127.0.0.1'),
     ('1680407266198683651',	'1666258199763877889',	'2023071506100910412',	NULL,	'2023-07-16 10:41:27',	'127.0.0.1'),
     ('1680407266202877953',	'1666258199763877889',	'2023071506100910413',	NULL,	'2023-07-16 10:41:27',	'127.0.0.1'),
     ('1680407266202877954',	'1666258199763877889',	'2023071506100910414',	NULL,	'2023-07-16 10:41:27',	'127.0.0.1'),
     ('1680407266202877955',	'1666258199763877889',	'2023071506100910415',	NULL,	'2023-07-16 10:41:27',	'127.0.0.1'),
     ('1680407266202877956',	'1666258199763877889',	'2023071506100910416',	NULL,	'2023-07-16 10:41:27',	'127.0.0.1'),
     ('1680407266202877957',	'1666258199763877889',	'2023071507171810530',	NULL,	'2023-07-16 10:41:27',	'127.0.0.1'),
     ('1680407266207072258',	'1666258199763877889',	'2023071507171810531',	NULL,	'2023-07-16 10:41:27',	'127.0.0.1'),
     ('1680407266207072259',	'1666258199763877889',	'2023071507171810532',	NULL,	'2023-07-16 10:41:27',	'127.0.0.1'),
     ('1680407266211266562',	'1666258199763877889',	'2023071507171810533',	NULL,	'2023-07-16 10:41:27',	'127.0.0.1'),
     ('1680407266211266563',	'1666258199763877889',	'2023071507171810534',	NULL,	'2023-07-16 10:41:27',	'127.0.0.1'),
     ('1680407266211266564',	'1666258199763877889',	'2023071507171810535',	NULL,	'2023-07-16 10:41:27',	'127.0.0.1'),
     ('1680407266211266565',	'1666258199763877889',	'2023071507171810536',	NULL,	'2023-07-16 10:41:27',	'127.0.0.1'),
     ('1680407266211266566',	'1666258199763877889',	'2023071507187680160',	NULL,	'2023-07-16 10:41:27',	'127.0.0.1'),
     ('1680407266215460866',	'1666258199763877889',	'2023071507187680161',	NULL,	'2023-07-16 10:41:27',	'127.0.0.1'),
     ('1680407266215460867',	'1666258199763877889',	'2023071507187680162',	NULL,	'2023-07-16 10:41:27',	'127.0.0.1'),
     ('1680407266215460868',	'1666258199763877889',	'2023071507187680163',	NULL,	'2023-07-16 10:41:27',	'127.0.0.1'),
     ('1680407266219655170',	'1666258199763877889',	'2023071507187680164',	NULL,	'2023-07-16 10:41:27',	'127.0.0.1'),
     ('1680407266219655171',	'1666258199763877889',	'2023071507187680165',	NULL,	'2023-07-16 10:41:27',	'127.0.0.1'),
     ('1680407266219655172',	'1666258199763877889',	'2023071507187680166',	NULL,	'2023-07-16 10:41:27',	'127.0.0.1');

-- 角色权限：装备中心 – 数据检核
INSERT INTO `sys_role_permission` (`id`, `role_id`, `permission_id`, `data_rule_ids`, `operate_date`, `operate_ip`) VALUES
     ('1666285517177749507',	'1666258199747100674',	'1647430912296435713',	NULL,	'2023-06-07 11:26:40',	'127.0.0.1'),
     ('1666285517177749508',	'1666258199747100674',	'1666281667909779458',	NULL,	'2023-06-07 11:26:40',	'127.0.0.1'),
     ('1666285517177749516',	'1666258199747100674',	'1666282632293515265',	NULL,	'2023-06-07 11:26:40',	'127.0.0.1'),
     ('1666285517177749517',	'1666258199747100674',	'2023060304491680490',	NULL,	'2023-06-07 11:26:40',	'127.0.0.1'),
     ('1666285517177749518',	'1666258199747100674',	'2023060304491680491',	NULL,	'2023-06-07 11:26:40',	'127.0.0.1'),
     ('1666285517177749519',	'1666258199747100674',	'2023060304491680492',	NULL,	'2023-06-07 11:26:40',	'127.0.0.1'),
     ('1666285517181943809',	'1666258199747100674',	'2023060304491680493',	NULL,	'2023-06-07 11:26:40',	'127.0.0.1'),
     ('1666285517181943810',	'1666258199747100674',	'2023060304491680494',	NULL,	'2023-06-07 11:26:40',	'127.0.0.1'),
     ('1666285517181943811',	'1666258199747100674',	'2023060304491680495',	NULL,	'2023-06-07 11:26:40',	'127.0.0.1'),
     ('1666285517181943812',	'1666258199747100674',	'2023060304491680496',	NULL,	'2023-06-07 11:26:40',	'127.0.0.1'),
     ('1666285517177749509',	'1666258199747100674',	'2023060402428380260',	NULL,	'2023-06-07 11:26:40',	'127.0.0.1'),
     ('1666285517177749510',	'1666258199747100674',	'2023060402428380261',	NULL,	'2023-06-07 11:26:40',	'127.0.0.1'),
     ('1666285517177749511',	'1666258199747100674',	'2023060402428380262',	NULL,	'2023-06-07 11:26:40',	'127.0.0.1'),
     ('1666285517177749512',	'1666258199747100674',	'2023060402428380263',	NULL,	'2023-06-07 11:26:40',	'127.0.0.1'),
     ('1666285517177749513',	'1666258199747100674',	'2023060402428380264',	NULL,	'2023-06-07 11:26:40',	'127.0.0.1'),
     ('1666285517177749514',	'1666258199747100674',	'2023060402428380265',	NULL,	'2023-06-07 11:26:40',	'127.0.0.1'),
     ('1666285517177749515',	'1666258199747100674',	'2023060402428380266',	NULL,	'2023-06-07 11:26:40',	'127.0.0.1'),
     ('1677176328106950657',	'1666258199747100674',	'2023070711112570320',	NULL,	'2023-07-07 12:42:52',	'127.0.0.1'),
     ('1677176328115339267',	'1666258199747100674',	'2023070711112570321',	NULL,	'2023-07-07 12:42:52',	'127.0.0.1'),
     ('1677176328115339268',	'1666258199747100674',	'2023070711112570322',	NULL,	'2023-07-07 12:42:52',	'127.0.0.1'),
     ('1677176328115339269',	'1666258199747100674',	'2023070711112570323',	NULL,	'2023-07-07 12:42:52',	'127.0.0.1'),
     ('1677176328119533569',	'1666258199747100674',	'2023070711112570324',	NULL,	'2023-07-07 12:42:52',	'127.0.0.1'),
     ('1677176328119533570',	'1666258199747100674',	'2023070711112570325',	NULL,	'2023-07-07 12:42:52',	'127.0.0.1'),
     ('1677176328119533571',	'1666258199747100674',	'2023070711112570326',	NULL,	'2023-07-07 12:42:52',	'127.0.0.1'),
     ('1677247092231462914',	'1666258199747100674',	'2023070704433360220',	NULL,	'2023-07-07 17:24:03',	'127.0.0.1'),
     ('1677247092235657218',	'1666258199747100674',	'2023070704433370221',	NULL,	'2023-07-07 17:24:03',	'127.0.0.1'),
     ('1677247092235657219',	'1666258199747100674',	'2023070704433370222',	NULL,	'2023-07-07 17:24:03',	'127.0.0.1'),
     ('1677247092235657220',	'1666258199747100674',	'2023070704433370223',	NULL,	'2023-07-07 17:24:03',	'127.0.0.1'),
     ('1677247092235657221',	'1666258199747100674',	'2023070704433370224',	NULL,	'2023-07-07 17:24:03',	'127.0.0.1'),
     ('1677247092235657222',	'1666258199747100674',	'2023070704433370225',	NULL,	'2023-07-07 17:24:03',	'127.0.0.1'),
     ('1677247092235657223',	'1666258199747100674',	'2023070704433370226',	NULL,	'2023-07-07 17:24:03',	'127.0.0.1'),
     ('1678202369759961089',	'1666258199747100674',	'2023070705157320330',	NULL,	'2023-07-10 08:39:59',	'127.0.0.1'),
     ('1678202369768349697',	'1666258199747100674',	'2023070705157320331',	NULL,	'2023-07-10 08:39:59',	'127.0.0.1'),
     ('1678202369772544001',	'1666258199747100674',	'2023070705157320332',	NULL,	'2023-07-10 08:39:59',	'127.0.0.1'),
     ('1678202369772544002',	'1666258199747100674',	'2023070705157320333',	NULL,	'2023-07-10 08:39:59',	'127.0.0.1'),
     ('1678202369776738305',	'1666258199747100674',	'2023070705157320334',	NULL,	'2023-07-10 08:39:59',	'127.0.0.1'),
     ('1678202369776738306',	'1666258199747100674',	'2023070705157320335',	NULL,	'2023-07-10 08:39:59',	'127.0.0.1'),
     ('1678202369776738307',	'1666258199747100674',	'2023070705157320336',	NULL,	'2023-07-10 08:39:59',	'127.0.0.1'),
     ('1680407502237335553',	'1666258199747100674',	'2023071505454370430',	NULL,	'2023-07-16 10:42:24',	'127.0.0.1'),
     ('1680407502245724161',	'1666258199747100674',	'2023071505454370431',	NULL,	'2023-07-16 10:42:24',	'127.0.0.1'),
     ('1680407502245724162',	'1666258199747100674',	'2023071505454370432',	NULL,	'2023-07-16 10:42:24',	'127.0.0.1'),
     ('1680407502249918465',	'1666258199747100674',	'2023071505454370433',	NULL,	'2023-07-16 10:42:24',	'127.0.0.1'),
     ('1680407502249918466',	'1666258199747100674',	'2023071505454370434',	NULL,	'2023-07-16 10:42:24',	'127.0.0.1'),
     ('1680407502249918467',	'1666258199747100674',	'2023071505454370435',	NULL,	'2023-07-16 10:42:24',	'127.0.0.1'),
     ('1680407502249918468',	'1666258199747100674',	'2023071505454370436',	NULL,	'2023-07-16 10:42:24',	'127.0.0.1'),
     ('1680407502254112769',	'1666258199747100674',	'2023071506100910410',	NULL,	'2023-07-16 10:42:24',	'127.0.0.1'),
     ('1680407502254112770',	'1666258199747100674',	'2023071506100910411',	NULL,	'2023-07-16 10:42:24',	'127.0.0.1'),
     ('1680407502254112771',	'1666258199747100674',	'2023071506100910412',	NULL,	'2023-07-16 10:42:24',	'127.0.0.1'),
     ('1680407502254112772',	'1666258199747100674',	'2023071506100910413',	NULL,	'2023-07-16 10:42:24',	'127.0.0.1'),
     ('1680407502258307073',	'1666258199747100674',	'2023071506100910414',	NULL,	'2023-07-16 10:42:24',	'127.0.0.1'),
     ('1680407502258307074',	'1666258199747100674',	'2023071506100910415',	NULL,	'2023-07-16 10:42:24',	'127.0.0.1'),
     ('1680407502258307075',	'1666258199747100674',	'2023071506100910416',	NULL,	'2023-07-16 10:42:24',	'127.0.0.1'),
     ('1680407502258307076',	'1666258199747100674',	'2023071507171810530',	NULL,	'2023-07-16 10:42:24',	'127.0.0.1'),
     ('1680407502262501378',	'1666258199747100674',	'2023071507171810531',	NULL,	'2023-07-16 10:42:24',	'127.0.0.1'),
     ('1680407502262501379',	'1666258199747100674',	'2023071507171810532',	NULL,	'2023-07-16 10:42:24',	'127.0.0.1'),
     ('1680407502262501380',	'1666258199747100674',	'2023071507171810533',	NULL,	'2023-07-16 10:42:24',	'127.0.0.1'),
     ('1680407502262501381',	'1666258199747100674',	'2023071507171810534',	NULL,	'2023-07-16 10:42:24',	'127.0.0.1'),
     ('1680407502262501382',	'1666258199747100674',	'2023071507171810535',	NULL,	'2023-07-16 10:42:24',	'127.0.0.1'),
     ('1680407502266695682',	'1666258199747100674',	'2023071507171810536',	NULL,	'2023-07-16 10:42:24',	'127.0.0.1'),
     ('1680407502266695683',	'1666258199747100674',	'2023071507187680160',	NULL,	'2023-07-16 10:42:24',	'127.0.0.1'),
     ('1680407502266695684',	'1666258199747100674',	'2023071507187680161',	NULL,	'2023-07-16 10:42:24',	'127.0.0.1'),
     ('1680407502270889986',	'1666258199747100674',	'2023071507187680162',	NULL,	'2023-07-16 10:42:24',	'127.0.0.1'),
     ('1680407502270889987',	'1666258199747100674',	'2023071507187680163',	NULL,	'2023-07-16 10:42:24',	'127.0.0.1'),
     ('1680407502270889988',	'1666258199747100674',	'2023071507187680164',	NULL,	'2023-07-16 10:42:24',	'127.0.0.1'),
     ('1680407502270889989',	'1666258199747100674',	'2023071507187680165',	NULL,	'2023-07-16 10:42:24',	'127.0.0.1'),
     ('1680407502270889990',	'1666258199747100674',	'2023071507187680166',	NULL,	'2023-07-16 10:42:24',	'127.0.0.1');


-- 角色权限：装备代表 – 高中
INSERT INTO `sys_role_permission` (`id`, `role_id`, `permission_id`, `data_rule_ids`, `operate_date`, `operate_ip`) VALUES
     ('1666313944920358913',	'1666258199679991810',	'1647430912296435713',	NULL,	'2023-06-07 13:19:38',	'127.0.0.1'),
     ('1666313944958107649',	'1666258199679991810',	'1666281667909779458',	NULL,	'2023-06-07 13:19:38',	'127.0.0.1'),
     ('1666313944958107650',	'1666258199679991810',	'2023060402428380260',	NULL,	'2023-06-07 13:19:38',	'127.0.0.1'),
     ('1666313944958107651',	'1666258199679991810',	'2023060402428380261',	NULL,	'2023-06-07 13:19:38',	'127.0.0.1'),
     ('1666313944958107652',	'1666258199679991810',	'2023060402428380262',	NULL,	'2023-06-07 13:19:38',	'127.0.0.1'),
     ('1666313944958107653',	'1666258199679991810',	'2023060402428380263',	NULL,	'2023-06-07 13:19:38',	'127.0.0.1'),
     ('1666313944958107654',	'1666258199679991810',	'2023060402428380264',	NULL,	'2023-06-07 13:19:38',	'127.0.0.1'),
     ('1666313944958107655',	'1666258199679991810',	'2023060402428380265',	NULL,	'2023-06-07 13:19:38',	'127.0.0.1'),
     ('1666313944958107656',	'1666258199679991810',	'2023060402428380266',	NULL,	'2023-06-07 13:19:38',	'127.0.0.1'),
     ('1677171641865617411',	'1666258199679991810',	'2023070711112570321',	NULL,	'2023-07-07 12:24:14',	'127.0.0.1'),
     ('1677171641869811713',	'1666258199679991810',	'2023070711112570322',	NULL,	'2023-07-07 12:24:14',	'127.0.0.1'),
     ('1677171641869811714',	'1666258199679991810',	'2023070711112570323',	NULL,	'2023-07-07 12:24:14',	'127.0.0.1'),
     ('1677171641869811715',	'1666258199679991810',	'2023070711112570324',	NULL,	'2023-07-07 12:24:14',	'127.0.0.1'),
     ('1677171641869811716',	'1666258199679991810',	'2023070711112570325',	NULL,	'2023-07-07 12:24:14',	'127.0.0.1'),
     ('1677171641874006017',	'1666258199679991810',	'2023070711112570326',	NULL,	'2023-07-07 12:24:14',	'127.0.0.1'),
     ('1677247539147137026',	'1666258199679991810',	'2023070704433370221',	NULL,	'2023-07-07 17:25:50',	'127.0.0.1'),
     ('1677247539147137027',	'1666258199679991810',	'2023070704433370222',	NULL,	'2023-07-07 17:25:50',	'127.0.0.1'),
     ('1677247539151331330',	'1666258199679991810',	'2023070704433370223',	NULL,	'2023-07-07 17:25:50',	'127.0.0.1'),
     ('1677247539151331331',	'1666258199679991810',	'2023070704433370224',	NULL,	'2023-07-07 17:25:50',	'127.0.0.1'),
     ('1677247539155525633',	'1666258199679991810',	'2023070704433370225',	NULL,	'2023-07-07 17:25:50',	'127.0.0.1'),
     ('1677247539155525634',	'1666258199679991810',	'2023070704433370226',	NULL,	'2023-07-07 17:25:50',	'127.0.0.1'),
     ('1678202629416738817',	'1666258199679991810',	'2023070705157320331',	NULL,	'2023-07-10 08:41:01',	'127.0.0.1'),
     ('1678202629416738818',	'1666258199679991810',	'2023070705157320332',	NULL,	'2023-07-10 08:41:01',	'127.0.0.1'),
     ('1678202629416738819',	'1666258199679991810',	'2023070705157320333',	NULL,	'2023-07-10 08:41:01',	'127.0.0.1'),
     ('1678202629416738820',	'1666258199679991810',	'2023070705157320334',	NULL,	'2023-07-10 08:41:01',	'127.0.0.1'),
     ('1678202629416738821',	'1666258199679991810',	'2023070705157320335',	NULL,	'2023-07-10 08:41:01',	'127.0.0.1'),
     ('1678202629416738822',	'1666258199679991810',	'2023070705157320336',	NULL,	'2023-07-10 08:41:01',	'127.0.0.1'),
     ('1680408415911936002',	'1666258199679991810',	'2023071505454370431',	NULL,	'2023-07-16 10:46:01',	'127.0.0.1'),
     ('1680408415911936003',	'1666258199679991810',	'2023071505454370432',	NULL,	'2023-07-16 10:46:01',	'127.0.0.1'),
     ('1680408415916130306',	'1666258199679991810',	'2023071505454370433',	NULL,	'2023-07-16 10:46:01',	'127.0.0.1'),
     ('1680408415916130307',	'1666258199679991810',	'2023071505454370434',	NULL,	'2023-07-16 10:46:01',	'127.0.0.1'),
     ('1680408415916130308',	'1666258199679991810',	'2023071505454370435',	NULL,	'2023-07-16 10:46:01',	'127.0.0.1'),
     ('1680408415916130309',	'1666258199679991810',	'2023071505454370436',	NULL,	'2023-07-16 10:46:01',	'127.0.0.1'),
     ('1680408415916130311',	'1666258199679991810',	'2023071506100910411',	NULL,	'2023-07-16 10:46:01',	'127.0.0.1'),
     ('1680408415916130312',	'1666258199679991810',	'2023071506100910412',	NULL,	'2023-07-16 10:46:01',	'127.0.0.1'),
     ('1680408415916130313',	'1666258199679991810',	'2023071506100910413',	NULL,	'2023-07-16 10:46:01',	'127.0.0.1'),
     ('1680408415916130314',	'1666258199679991810',	'2023071506100910414',	NULL,	'2023-07-16 10:46:01',	'127.0.0.1'),
     ('1680408415916130315',	'1666258199679991810',	'2023071506100910415',	NULL,	'2023-07-16 10:46:01',	'127.0.0.1'),
     ('1680408415916130316',	'1666258199679991810',	'2023071506100910416',	NULL,	'2023-07-16 10:46:01',	'127.0.0.1'),
     ('1680408415916130318',	'1666258199679991810',	'2023071507171810531',	NULL,	'2023-07-16 10:46:01',	'127.0.0.1'),
     ('1680408415916130319',	'1666258199679991810',	'2023071507171810532',	NULL,	'2023-07-16 10:46:01',	'127.0.0.1'),
     ('1680408415920324609',	'1666258199679991810',	'2023071507171810533',	NULL,	'2023-07-16 10:46:01',	'127.0.0.1'),
     ('1680408415920324610',	'1666258199679991810',	'2023071507171810534',	NULL,	'2023-07-16 10:46:01',	'127.0.0.1'),
     ('1680408415920324611',	'1666258199679991810',	'2023071507171810535',	NULL,	'2023-07-16 10:46:01',	'127.0.0.1'),
     ('1680408415920324612',	'1666258199679991810',	'2023071507171810536',	NULL,	'2023-07-16 10:46:01',	'127.0.0.1'),
     ('1680408415920324614',	'1666258199679991810',	'2023071507187680161',	NULL,	'2023-07-16 10:46:01',	'127.0.0.1'),
     ('1680408415920324615',	'1666258199679991810',	'2023071507187680162',	NULL,	'2023-07-16 10:46:01',	'127.0.0.1'),
     ('1680408415920324616',	'1666258199679991810',	'2023071507187680163',	NULL,	'2023-07-16 10:46:01',	'127.0.0.1'),
     ('1680408415920324617',	'1666258199679991810',	'2023071507187680164',	NULL,	'2023-07-16 10:46:01',	'127.0.0.1'),
     ('1680408415920324618',	'1666258199679991810',	'2023071507187680165',	NULL,	'2023-07-16 10:46:01',	'127.0.0.1'),
     ('1680408415920324619',	'1666258199679991810',	'2023071507187680166',	NULL,	'2023-07-16 10:46:01',	'127.0.0.1');

-- 角色权限：装备代表 – 初中
INSERT INTO `sys_role_permission` (`id`, `role_id`, `permission_id`, `data_rule_ids`, `operate_date`, `operate_ip`) VALUES
     ('1666314346684350466',	'1666258199700963330',	'1647430912296435713',	NULL,	'2023-06-07 13:21:14',	'127.0.0.1'),
     ('1666314346684350467',	'1666258199700963330',	'1666281667909779458',	NULL,	'2023-06-07 13:21:14',	'127.0.0.1'),
     ('1666314346688544770',	'1666258199700963330',	'2023060402428380260',	NULL,	'2023-06-07 13:21:14',	'127.0.0.1'),
     ('1666314346688544771',	'1666258199700963330',	'2023060402428380261',	NULL,	'2023-06-07 13:21:14',	'127.0.0.1'),
     ('1666314346688544772',	'1666258199700963330',	'2023060402428380262',	NULL,	'2023-06-07 13:21:14',	'127.0.0.1'),
     ('1666314346688544773',	'1666258199700963330',	'2023060402428380263',	NULL,	'2023-06-07 13:21:14',	'127.0.0.1'),
     ('1666314346688544774',	'1666258199700963330',	'2023060402428380264',	NULL,	'2023-06-07 13:21:14',	'127.0.0.1'),
     ('1666314346688544775',	'1666258199700963330',	'2023060402428380265',	NULL,	'2023-06-07 13:21:14',	'127.0.0.1'),
     ('1666314346688544776',	'1666258199700963330',	'2023060402428380266',	NULL,	'2023-06-07 13:21:14',	'127.0.0.1'),
     ('1677171502006550529',	'1666258199700963330',	'2023070711112570321',	NULL,	'2023-07-07 12:23:41',	'127.0.0.1'),
     ('1677171502006550530',	'1666258199700963330',	'2023070711112570322',	NULL,	'2023-07-07 12:23:41',	'127.0.0.1'),
     ('1677171502006550531',	'1666258199700963330',	'2023070711112570323',	NULL,	'2023-07-07 12:23:41',	'127.0.0.1'),
     ('1677171502006550532',	'1666258199700963330',	'2023070711112570324',	NULL,	'2023-07-07 12:23:41',	'127.0.0.1'),
     ('1677171502006550533',	'1666258199700963330',	'2023070711112570325',	NULL,	'2023-07-07 12:23:41',	'127.0.0.1'),
     ('1677171502010744833',	'1666258199700963330',	'2023070711112570326',	NULL,	'2023-07-07 12:23:41',	'127.0.0.1'),
     ('1677247485967556610',	'1666258199700963330',	'2023070704433370221',	NULL,	'2023-07-07 17:25:37',	'127.0.0.1'),
     ('1677247485967556611',	'1666258199700963330',	'2023070704433370222',	NULL,	'2023-07-07 17:25:37',	'127.0.0.1'),
     ('1677247485967556612',	'1666258199700963330',	'2023070704433370223',	NULL,	'2023-07-07 17:25:37',	'127.0.0.1'),
     ('1677247485967556613',	'1666258199700963330',	'2023070704433370224',	NULL,	'2023-07-07 17:25:37',	'127.0.0.1'),
     ('1677247485971750913',	'1666258199700963330',	'2023070704433370225',	NULL,	'2023-07-07 17:25:37',	'127.0.0.1'),
     ('1677247485971750914',	'1666258199700963330',	'2023070704433370226',	NULL,	'2023-07-07 17:25:37',	'127.0.0.1'),
     ('1678202572688777218',	'1666258199700963330',	'2023070705157320331',	NULL,	'2023-07-10 08:40:47',	'127.0.0.1'),
     ('1678202572692971521',	'1666258199700963330',	'2023070705157320332',	NULL,	'2023-07-10 08:40:47',	'127.0.0.1'),
     ('1678202572692971522',	'1666258199700963330',	'2023070705157320333',	NULL,	'2023-07-10 08:40:47',	'127.0.0.1'),
     ('1678202572692971523',	'1666258199700963330',	'2023070705157320334',	NULL,	'2023-07-10 08:40:47',	'127.0.0.1'),
     ('1678202572692971524',	'1666258199700963330',	'2023070705157320335',	NULL,	'2023-07-10 08:40:47',	'127.0.0.1'),
     ('1678202572692971525',	'1666258199700963330',	'2023070705157320336',	NULL,	'2023-07-10 08:40:47',	'127.0.0.1'),
     ('1680408226572664834',	'1666258199700963330',	'2023071505454370431',	NULL,	'2023-07-16 10:45:16',	'127.0.0.1'),
     ('1680408226572664835',	'1666258199700963330',	'2023071505454370432',	NULL,	'2023-07-16 10:45:16',	'127.0.0.1'),
     ('1680408226572664836',	'1666258199700963330',	'2023071505454370433',	NULL,	'2023-07-16 10:45:16',	'127.0.0.1'),
     ('1680408226572664837',	'1666258199700963330',	'2023071505454370434',	NULL,	'2023-07-16 10:45:16',	'127.0.0.1'),
     ('1680408226572664838',	'1666258199700963330',	'2023071505454370435',	NULL,	'2023-07-16 10:45:16',	'127.0.0.1'),
     ('1680408226572664839',	'1666258199700963330',	'2023071505454370436',	NULL,	'2023-07-16 10:45:16',	'127.0.0.1'),
     ('1680408226576859139',	'1666258199700963330',	'2023071506100910411',	NULL,	'2023-07-16 10:45:16',	'127.0.0.1'),
     ('1680408226576859140',	'1666258199700963330',	'2023071506100910412',	NULL,	'2023-07-16 10:45:16',	'127.0.0.1'),
     ('1680408226576859141',	'1666258199700963330',	'2023071506100910413',	NULL,	'2023-07-16 10:45:16',	'127.0.0.1'),
     ('1680408226576859142',	'1666258199700963330',	'2023071506100910414',	NULL,	'2023-07-16 10:45:16',	'127.0.0.1'),
     ('1680408226576859143',	'1666258199700963330',	'2023071506100910415',	NULL,	'2023-07-16 10:45:16',	'127.0.0.1'),
     ('1680408226576859144',	'1666258199700963330',	'2023071506100910416',	NULL,	'2023-07-16 10:45:16',	'127.0.0.1'),
     ('1680408226581053442',	'1666258199700963330',	'2023071507171810531',	NULL,	'2023-07-16 10:45:16',	'127.0.0.1'),
     ('1680408226581053443',	'1666258199700963330',	'2023071507171810532',	NULL,	'2023-07-16 10:45:16',	'127.0.0.1'),
     ('1680408226581053444',	'1666258199700963330',	'2023071507171810533',	NULL,	'2023-07-16 10:45:16',	'127.0.0.1'),
     ('1680408226581053445',	'1666258199700963330',	'2023071507171810534',	NULL,	'2023-07-16 10:45:16',	'127.0.0.1'),
     ('1680408226581053446',	'1666258199700963330',	'2023071507171810535',	NULL,	'2023-07-16 10:45:16',	'127.0.0.1'),
     ('1680408226581053447',	'1666258199700963330',	'2023071507171810536',	NULL,	'2023-07-16 10:45:16',	'127.0.0.1'),
     ('1680408226581053449',	'1666258199700963330',	'2023071507187680161',	NULL,	'2023-07-16 10:45:16',	'127.0.0.1'),
     ('1680408226585247746',	'1666258199700963330',	'2023071507187680162',	NULL,	'2023-07-16 10:45:16',	'127.0.0.1'),
     ('1680408226585247747',	'1666258199700963330',	'2023071507187680163',	NULL,	'2023-07-16 10:45:16',	'127.0.0.1'),
     ('1680408226585247748',	'1666258199700963330',	'2023071507187680164',	NULL,	'2023-07-16 10:45:16',	'127.0.0.1'),
     ('1680408226585247749',	'1666258199700963330',	'2023071507187680165',	NULL,	'2023-07-16 10:45:16',	'127.0.0.1'),
     ('1680408226585247750',	'1666258199700963330',	'2023071507187680166',	NULL,	'2023-07-16 10:45:16',	'127.0.0.1');

-- 角色权限：装备代表 – 小学
INSERT INTO `sys_role_permission` (`id`, `role_id`, `permission_id`, `data_rule_ids`, `operate_date`, `operate_ip`) VALUES
     ('1666314712515739649',	'1666258199717740546',	'1647430912296435713',	NULL,	'2023-06-07 13:22:41',	'127.0.0.1'),
     ('1666314712519933953',	'1666258199717740546',	'1666281667909779458',	NULL,	'2023-06-07 13:22:41',	'127.0.0.1'),
     ('1666314712524128258',	'1666258199717740546',	'1666282632293515265',	NULL,	'2023-06-07 13:22:41',	'127.0.0.1'),
     ('1666314712524128259',	'1666258199717740546',	'2023060304491680490',	NULL,	'2023-06-07 13:22:41',	'127.0.0.1'),
     ('1666314712524128260',	'1666258199717740546',	'2023060304491680491',	NULL,	'2023-06-07 13:22:41',	'127.0.0.1'),
     ('1666314712524128261',	'1666258199717740546',	'2023060304491680492',	NULL,	'2023-06-07 13:22:41',	'127.0.0.1'),
     ('1666314712524128262',	'1666258199717740546',	'2023060304491680493',	NULL,	'2023-06-07 13:22:41',	'127.0.0.1'),
     ('1666314712524128263',	'1666258199717740546',	'2023060304491680494',	NULL,	'2023-06-07 13:22:41',	'127.0.0.1'),
     ('1666314712524128264',	'1666258199717740546',	'2023060304491680495',	NULL,	'2023-06-07 13:22:41',	'127.0.0.1'),
     ('1666314712524128265',	'1666258199717740546',	'2023060304491680496',	NULL,	'2023-06-07 13:22:41',	'127.0.0.1'),
     ('1666314712519933954',	'1666258199717740546',	'2023060402428380260',	NULL,	'2023-06-07 13:22:41',	'127.0.0.1'),
     ('1666314712519933955',	'1666258199717740546',	'2023060402428380261',	NULL,	'2023-06-07 13:22:41',	'127.0.0.1'),
     ('1666314712519933956',	'1666258199717740546',	'2023060402428380262',	NULL,	'2023-06-07 13:22:41',	'127.0.0.1'),
     ('1666314712519933957',	'1666258199717740546',	'2023060402428380263',	NULL,	'2023-06-07 13:22:41',	'127.0.0.1'),
     ('1666314712519933958',	'1666258199717740546',	'2023060402428380264',	NULL,	'2023-06-07 13:22:41',	'127.0.0.1'),
     ('1666314712519933959',	'1666258199717740546',	'2023060402428380265',	NULL,	'2023-06-07 13:22:41',	'127.0.0.1'),
     ('1666314712524128257',	'1666258199717740546',	'2023060402428380266',	NULL,	'2023-06-07 13:22:41',	'127.0.0.1'),
     ('1677171344715956226',	'1666258199717740546',	'2023070711112570321',	NULL,	'2023-07-07 12:23:04',	'127.0.0.1'),
     ('1677171344715956227',	'1666258199717740546',	'2023070711112570322',	NULL,	'2023-07-07 12:23:04',	'127.0.0.1'),
     ('1677171344720150529',	'1666258199717740546',	'2023070711112570323',	NULL,	'2023-07-07 12:23:04',	'127.0.0.1'),
     ('1677171344720150530',	'1666258199717740546',	'2023070711112570324',	NULL,	'2023-07-07 12:23:04',	'127.0.0.1'),
     ('1677171344720150531',	'1666258199717740546',	'2023070711112570325',	NULL,	'2023-07-07 12:23:04',	'127.0.0.1'),
     ('1677171344724344833',	'1666258199717740546',	'2023070711112570326',	NULL,	'2023-07-07 12:23:04',	'127.0.0.1'),
     ('1677247422906195970',	'1666258199717740546',	'2023070704433370221',	NULL,	'2023-07-07 17:25:22',	'127.0.0.1'),
     ('1677247422906195971',	'1666258199717740546',	'2023070704433370222',	NULL,	'2023-07-07 17:25:22',	'127.0.0.1'),
     ('1677247422906195972',	'1666258199717740546',	'2023070704433370223',	NULL,	'2023-07-07 17:25:22',	'127.0.0.1'),
     ('1677247422910390274',	'1666258199717740546',	'2023070704433370224',	NULL,	'2023-07-07 17:25:22',	'127.0.0.1'),
     ('1677247422910390275',	'1666258199717740546',	'2023070704433370225',	NULL,	'2023-07-07 17:25:22',	'127.0.0.1'),
     ('1677247422914584577',	'1666258199717740546',	'2023070704433370226',	NULL,	'2023-07-07 17:25:22',	'127.0.0.1'),
     ('1678202511728762881',	'1666258199717740546',	'2023070705157320331',	NULL,	'2023-07-10 08:40:33',	'127.0.0.1'),
     ('1678202511728762882',	'1666258199717740546',	'2023070705157320332',	NULL,	'2023-07-10 08:40:33',	'127.0.0.1'),
     ('1678202511728762883',	'1666258199717740546',	'2023070705157320333',	NULL,	'2023-07-10 08:40:33',	'127.0.0.1'),
     ('1678202511728762884',	'1666258199717740546',	'2023070705157320334',	NULL,	'2023-07-10 08:40:33',	'127.0.0.1'),
     ('1678202511732957185',	'1666258199717740546',	'2023070705157320335',	NULL,	'2023-07-10 08:40:33',	'127.0.0.1'),
     ('1678202511732957186',	'1666258199717740546',	'2023070705157320336',	NULL,	'2023-07-10 08:40:33',	'127.0.0.1'),
     ('1680408000545816578',	'1666258199717740546',	'2023071505454370431',	NULL,	'2023-07-16 10:44:22',	'127.0.0.1'),
     ('1680408000545816579',	'1666258199717740546',	'2023071505454370432',	NULL,	'2023-07-16 10:44:22',	'127.0.0.1'),
     ('1680408000545816580',	'1666258199717740546',	'2023071505454370433',	NULL,	'2023-07-16 10:44:22',	'127.0.0.1'),
     ('1680408000545816581',	'1666258199717740546',	'2023071505454370434',	NULL,	'2023-07-16 10:44:22',	'127.0.0.1'),
     ('1680408000545816582',	'1666258199717740546',	'2023071505454370435',	NULL,	'2023-07-16 10:44:22',	'127.0.0.1'),
     ('1680408000545816583',	'1666258199717740546',	'2023071505454370436',	NULL,	'2023-07-16 10:44:22',	'127.0.0.1'),
     ('1680408000550010881',	'1666258199717740546',	'2023071506100910411',	NULL,	'2023-07-16 10:44:22',	'127.0.0.1'),
     ('1680408000550010882',	'1666258199717740546',	'2023071506100910412',	NULL,	'2023-07-16 10:44:22',	'127.0.0.1'),
     ('1680408000550010883',	'1666258199717740546',	'2023071506100910413',	NULL,	'2023-07-16 10:44:22',	'127.0.0.1'),
     ('1680408000550010884',	'1666258199717740546',	'2023071506100910414',	NULL,	'2023-07-16 10:44:22',	'127.0.0.1'),
     ('1680408000550010885',	'1666258199717740546',	'2023071506100910415',	NULL,	'2023-07-16 10:44:22',	'127.0.0.1'),
     ('1680408000550010886',	'1666258199717740546',	'2023071506100910416',	NULL,	'2023-07-16 10:44:22',	'127.0.0.1'),
     ('1680408000554205185',	'1666258199717740546',	'2023071507171810531',	NULL,	'2023-07-16 10:44:22',	'127.0.0.1'),
     ('1680408000554205186',	'1666258199717740546',	'2023071507171810532',	NULL,	'2023-07-16 10:44:22',	'127.0.0.1'),
     ('1680408000554205187',	'1666258199717740546',	'2023071507171810533',	NULL,	'2023-07-16 10:44:22',	'127.0.0.1'),
     ('1680408000554205188',	'1666258199717740546',	'2023071507171810534',	NULL,	'2023-07-16 10:44:22',	'127.0.0.1'),
     ('1680408000554205189',	'1666258199717740546',	'2023071507171810535',	NULL,	'2023-07-16 10:44:22',	'127.0.0.1'),
     ('1680408000554205190',	'1666258199717740546',	'2023071507171810536',	NULL,	'2023-07-16 10:44:22',	'127.0.0.1'),
     ('1680408000558399489',	'1666258199717740546',	'2023071507187680161',	NULL,	'2023-07-16 10:44:22',	'127.0.0.1'),
     ('1680408000558399490',	'1666258199717740546',	'2023071507187680162',	NULL,	'2023-07-16 10:44:22',	'127.0.0.1'),
     ('1680408000558399491',	'1666258199717740546',	'2023071507187680163',	NULL,	'2023-07-16 10:44:22',	'127.0.0.1'),
     ('1680408000558399492',	'1666258199717740546',	'2023071507187680164',	NULL,	'2023-07-16 10:44:22',	'127.0.0.1'),
     ('1680408000558399493',	'1666258199717740546',	'2023071507187680165',	NULL,	'2023-07-16 10:44:22',	'127.0.0.1'),
     ('1680408000558399494',	'1666258199717740546',	'2023071507187680166',	NULL,	'2023-07-16 10:44:22',	'127.0.0.1');

-- 角色权限：装备代表 – 幼儿园
INSERT INTO `sys_role_permission` (`id`, `role_id`, `permission_id`, `data_rule_ids`, `operate_date`, `operate_ip`) VALUES
     ('1666313219402235905',	'1666258199734517761',	'1647430912296435713',	NULL,	'2023-06-07 13:16:45',	'127.0.0.1'),
     ('1666313219406430210',	'1666258199734517761',	'1666281667909779458',	NULL,	'2023-06-07 13:16:45',	'127.0.0.1'),
     ('1666313219406430211',	'1666258199734517761',	'2023060402428380260',	NULL,	'2023-06-07 13:16:45',	'127.0.0.1'),
     ('1666313219406430212',	'1666258199734517761',	'2023060402428380261',	NULL,	'2023-06-07 13:16:45',	'127.0.0.1'),
     ('1666313219406430213',	'1666258199734517761',	'2023060402428380262',	NULL,	'2023-06-07 13:16:45',	'127.0.0.1'),
     ('1666313219406430214',	'1666258199734517761',	'2023060402428380263',	NULL,	'2023-06-07 13:16:45',	'127.0.0.1'),
     ('1666313219406430215',	'1666258199734517761',	'2023060402428380264',	NULL,	'2023-06-07 13:16:45',	'127.0.0.1'),
     ('1666313219406430216',	'1666258199734517761',	'2023060402428380265',	NULL,	'2023-06-07 13:16:45',	'127.0.0.1'),
     ('1666313219406430217',	'1666258199734517761',	'2023060402428380266',	NULL,	'2023-06-07 13:16:45',	'127.0.0.1'),
     ('1677171858836963329',	'1666258199734517761',	'2023070711112570321',	NULL,	'2023-07-07 12:25:06',	'127.0.0.1'),
     ('1677171858836963330',	'1666258199734517761',	'2023070711112570322',	NULL,	'2023-07-07 12:25:06',	'127.0.0.1'),
     ('1677171858836963331',	'1666258199734517761',	'2023070711112570323',	NULL,	'2023-07-07 12:25:06',	'127.0.0.1'),
     ('1677171858836963332',	'1666258199734517761',	'2023070711112570324',	NULL,	'2023-07-07 12:25:06',	'127.0.0.1'),
     ('1677171858836963333',	'1666258199734517761',	'2023070711112570325',	NULL,	'2023-07-07 12:25:06',	'127.0.0.1'),
     ('1677171858836963334',	'1666258199734517761',	'2023070711112570326',	NULL,	'2023-07-07 12:25:06',	'127.0.0.1'),
     ('1677247337745047554',	'1666258199734517761',	'2023070704433370221',	NULL,	'2023-07-07 17:25:02',	'127.0.0.1'),
     ('1677247337745047555',	'1666258199734517761',	'2023070704433370222',	NULL,	'2023-07-07 17:25:02',	'127.0.0.1'),
     ('1677247337745047556',	'1666258199734517761',	'2023070704433370223',	NULL,	'2023-07-07 17:25:02',	'127.0.0.1'),
     ('1677247337745047557',	'1666258199734517761',	'2023070704433370224',	NULL,	'2023-07-07 17:25:02',	'127.0.0.1'),
     ('1677247337745047558',	'1666258199734517761',	'2023070704433370225',	NULL,	'2023-07-07 17:25:02',	'127.0.0.1'),
     ('1677247337745047559',	'1666258199734517761',	'2023070704433370226',	NULL,	'2023-07-07 17:25:02',	'127.0.0.1'),
     ('1678202452798791681',	'1666258199734517761',	'2023070705157320331',	NULL,	'2023-07-10 08:40:19',	'127.0.0.1'),
     ('1678202452798791682',	'1666258199734517761',	'2023070705157320332',	NULL,	'2023-07-10 08:40:19',	'127.0.0.1'),
     ('1678202452802985986',	'1666258199734517761',	'2023070705157320333',	NULL,	'2023-07-10 08:40:19',	'127.0.0.1'),
     ('1678202452802985987',	'1666258199734517761',	'2023070705157320334',	NULL,	'2023-07-10 08:40:19',	'127.0.0.1'),
     ('1678202452807180289',	'1666258199734517761',	'2023070705157320335',	NULL,	'2023-07-10 08:40:19',	'127.0.0.1'),
     ('1678202452807180290',	'1666258199734517761',	'2023070705157320336',	NULL,	'2023-07-10 08:40:19',	'127.0.0.1'),
     ('1680407757699809282',	'1666258199734517761',	'2023071505454370431',	NULL,	'2023-07-16 10:43:25',	'127.0.0.1'),
     ('1680407757699809283',	'1666258199734517761',	'2023071505454370432',	NULL,	'2023-07-16 10:43:25',	'127.0.0.1'),
     ('1680407757704003585',	'1666258199734517761',	'2023071505454370433',	NULL,	'2023-07-16 10:43:25',	'127.0.0.1'),
     ('1680407757704003586',	'1666258199734517761',	'2023071505454370434',	NULL,	'2023-07-16 10:43:25',	'127.0.0.1'),
     ('1680407757704003587',	'1666258199734517761',	'2023071505454370435',	NULL,	'2023-07-16 10:43:25',	'127.0.0.1'),
     ('1680407757704003588',	'1666258199734517761',	'2023071505454370436',	NULL,	'2023-07-16 10:43:25',	'127.0.0.1'),
     ('1680407757708197889',	'1666258199734517761',	'2023071506100910411',	NULL,	'2023-07-16 10:43:25',	'127.0.0.1'),
     ('1680407757708197890',	'1666258199734517761',	'2023071506100910412',	NULL,	'2023-07-16 10:43:25',	'127.0.0.1'),
     ('1680407757708197891',	'1666258199734517761',	'2023071506100910413',	NULL,	'2023-07-16 10:43:25',	'127.0.0.1'),
     ('1680407757708197892',	'1666258199734517761',	'2023071506100910414',	NULL,	'2023-07-16 10:43:25',	'127.0.0.1'),
     ('1680407757708197893',	'1666258199734517761',	'2023071506100910415',	NULL,	'2023-07-16 10:43:25',	'127.0.0.1'),
     ('1680407757712392193',	'1666258199734517761',	'2023071506100910416',	NULL,	'2023-07-16 10:43:25',	'127.0.0.1'),
     ('1680407757712392195',	'1666258199734517761',	'2023071507171810531',	NULL,	'2023-07-16 10:43:25',	'127.0.0.1'),
     ('1680407757712392196',	'1666258199734517761',	'2023071507171810532',	NULL,	'2023-07-16 10:43:25',	'127.0.0.1'),
     ('1680407757712392197',	'1666258199734517761',	'2023071507171810533',	NULL,	'2023-07-16 10:43:25',	'127.0.0.1'),
     ('1680407757712392198',	'1666258199734517761',	'2023071507171810534',	NULL,	'2023-07-16 10:43:25',	'127.0.0.1'),
     ('1680407757716586498',	'1666258199734517761',	'2023071507171810535',	NULL,	'2023-07-16 10:43:25',	'127.0.0.1'),
     ('1680407757716586499',	'1666258199734517761',	'2023071507171810536',	NULL,	'2023-07-16 10:43:25',	'127.0.0.1'),
     ('1680407757716586501',	'1666258199734517761',	'2023071507187680161',	NULL,	'2023-07-16 10:43:25',	'127.0.0.1'),
     ('1680407757716586502',	'1666258199734517761',	'2023071507187680162',	NULL,	'2023-07-16 10:43:25',	'127.0.0.1'),
     ('1680407757716586503',	'1666258199734517761',	'2023071507187680163',	NULL,	'2023-07-16 10:43:25',	'127.0.0.1'),
     ('1680407757720780802',	'1666258199734517761',	'2023071507187680164',	NULL,	'2023-07-16 10:43:25',	'127.0.0.1'),
     ('1680407757720780803',	'1666258199734517761',	'2023071507187680165',	NULL,	'2023-07-16 10:43:25',	'127.0.0.1'),
     ('1680407757720780804',	'1666258199734517761',	'2023071507187680166',	NULL,	'2023-07-16 10:43:25',	'127.0.0.1');

-- 预设账户：装备中心配置管理员
INSERT INTO `sys_user` (`id`, `username`, `realname`, `password`, `salt`, `avatar`, `birthday`, `sex`, `email`, `phone`, `org_code`, `status`, `del_flag`, `third_id`, `third_type`, `activiti_sync`, `work_no`, `post`, `telephone`, `create_by`, `create_time`, `update_by`, `update_time`, `user_identity`, `depart_ids`, `client_id`, `login_tenant_id`, `bpm_status`) VALUES
     ('1666324152950325249',	'sysadmin',	'装备中心配置管理员',	'7d881e7fdf6c411836dea81b1c31fae8',	'VN0bWdEW',	NULL,	NULL,	NULL,	'1@1.ow',	'13212341234',	NULL,	1,	0,	NULL,	NULL,	1,	'sysadmin',	NULL,	NULL,	'admin',	'2023-06-07 14:00:12',	NULL,	NULL,	1,	'',	NULL,	NULL,	NULL);
INSERT INTO `sys_user_role` (`id`, `user_id`, `role_id`, `tenant_id`) VALUES
     ('1666324152967102465',	'1666324152950325249',	'1666258199780655106',	0);

-- 借助机构定义生成账户
INSERT INTO `organization_definition` (`id`, `identification_code`, `township`, `institution_name`, `institution_type`, `chart_group`, `admin_code`, `role_code`, `initial_password`, `admin_generation_success`, `failure_reason`, `create_by`, `create_time`, `update_by`, `update_time`, `sys_org_code`) VALUES
     ('1666328002797236225',	'3142007024',	'11',	'八宝初级中学',	'14',	'初中',	'admin_bbzx',	'1666258199700963330',	'p2llvkhq',	'1',	NULL,	'sysadmin',	'2023-06-07 14:15:29',	NULL,	NULL,	NULL),
     ('1666328237288189954',	'2142009669',	'11',	'八宝小学',	'12',	'中心小学',	'admin_bbxx',	'1666258199717740546',	'44d72cm7',	'1',	NULL,	'sysadmin',	'2023-06-07 14:16:25',	NULL,	NULL,	NULL),
     ('1666328364132331521',	'2142004708',	'11',	'八宝小学中洲校区',	'13',	'完全小学',	'admin_zzxx',	'1666258199717740546',	'w4l60um0',	'1',	NULL,	'sysadmin',	'2023-06-07 14:16:56',	NULL,	NULL,	NULL),
     ('1678625014049558529',	'5262003028',	'27',	'松滋一中',	'15',	'高职特幼',	'admin_szyz',	'1666258199679991810',	'wu5pccw5',	'1',	NULL,	'sysadmin',	'2023-07-11 12:39:25',	NULL,	NULL,	NULL),
     ('1678626320529117185',	'1232002606',	'27',	'市机关幼儿园',	'11',	'高职特幼',	'admin_jgyey',	'1666258199734517761',	'btt61r3k',	'1',	NULL,	'sysadmin',	'2023-07-11 12:44:37',	NULL,	NULL,	NULL);
INSERT INTO `sys_user` (`id`, `username`, `realname`, `password`, `salt`, `avatar`, `birthday`, `sex`, `email`, `phone`, `org_code`, `status`, `del_flag`, `third_id`, `third_type`, `activiti_sync`, `work_no`, `post`, `telephone`, `create_by`, `create_time`, `update_by`, `update_time`, `user_identity`, `depart_ids`, `client_id`, `login_tenant_id`, `bpm_status`) VALUES
     ('1666328002738515970',	'admin_bbzx',	'八宝初级中学',	'762001a923071d8cb60e6d9311d59676',	'1Ph064Oy',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	'3142007024',	'sysadmin',	'2023-06-07 14:15:29',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
     ('1666328237225275394',	'admin_bbxx',	'八宝小学',	'64913e3e0b72397c2f474a25eee928ba',	'RWHf0MZF',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	'2142009669',	'sysadmin',	'2023-06-07 14:16:25',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
     ('1666328364073611266',	'admin_zzxx',	'八宝小学中洲校区',	'90a071c0524d2a391c90056f657bbd36',	'p07RptE1',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	'2142004708',	'sysadmin',	'2023-06-07 14:16:56',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL);
INSERT INTO `sys_user_role` (`id`, `user_id`, `role_id`, `tenant_id`) VALUES
     ('1666328002759487490',	'1666328002738515970',	'1666258199700963330',	0),
     ('1666328237237858306',	'1666328237225275394',	'1666258199717740546',	0),
     ('1666328364086194178',	'1666328364073611266',	'1666258199717740546',	0);

-- 角色数据权限：学校方仅能看到本校的统计数据
INSERT INTO `sys_permission_data_rule` (`id`, `permission_id`, `rule_name`, `rule_column`, `rule_conditions`, `rule_value`, `status`, `create_time`, `create_by`, `update_time`, `update_by`) VALUES
     ('1666813284424339458',	'2023060402428380260',	'学校方仅能看到本校的统计数据#1',	'createBy',	'=',	'#{sys_user_code}',	'1',	'2023-06-08 22:23:50',	'admin',	NULL,	NULL),
     ('1677170972119154690',	'2023070711112570320',	'学校方仅能看到本校的统计数据#2',	'createBy',	'=',	'#{sys_user_code}',	'1',	'2023-07-07 12:21:35',	'admin',	NULL,	NULL),
     ('1677254506439729153',	'2023070704433360220',	'学校方仅能看到本校的统计数据#3',	'createBy',	'=',	'#{sys_user_code}',	'1',	'2023-07-07 17:53:31',	'admin',	NULL,	NULL),
     ('1678230109464748033',	'2023070705157320330',	'学校方仅能看到本校的统计数据#4',	'createBy',	'=',	'#{sys_user_code}',	'1',	'2023-07-10 10:30:13',	'admin',	NULL,	NULL),
     ('1680415646271275009',	'2023071505454370430',	'学校方仅能看到本校的统计数据#5',	'createBy',	'=',	'#{sys_user_code}',	'1',	'2023-07-16 11:14:45',	'admin',	NULL,	NULL),
     ('1680415899858894850',	'2023071506100910410',	'学校方仅能看到本校的统计数据#6',	'createBy',	'=',	'#{sys_user_code}',	'1',	'2023-07-16 11:15:46',	'admin',	NULL,	NULL),
     ('1680416096294928386',	'2023071507171810530',	'学校方仅能看到本校的统计数据#7',	'createBy',	'=',	'#{sys_user_code}',	'1',	'2023-07-16 11:16:33',	'admin',	NULL,	NULL),
     ('1680416297336307714',	'2023071507187680160',	'学校方仅能看到本校的统计数据#8',	'createBy',	'=',	'#{sys_user_code}',	'1',	'2023-07-16 11:17:21',	'admin',	NULL,	NULL);
INSERT INTO `sys_role_permission` (`id`, `role_id`, `permission_id`, `data_rule_ids`, `operate_date`, `operate_ip`) VALUES
     ('1666313219406430209',	'1666258199734517761',	'2023060402428380260',	'1666813284424339458',	'2023-06-07 13:16:45',	'127.0.0.1'),
     ('1666313944958107639',	'1666258199679991810',	'2023060402428380260',	'1666813284424339458',	'2023-06-07 13:19:38',	'127.0.0.1'),
     ('1666314346688544769',	'1666258199700963330',	'2023060402428380260',	'1666813284424339458',	'2023-06-07 13:21:14',	'127.0.0.1'),
     ('1666314712519933952',	'1666258199717740546',	'2023060402428380260',	'1666813284424339458',	'2023-06-07 13:22:41',	'127.0.0.1'),
     ('1677171858832769025',	'1666258199734517761',	'2023070711112570320',	'1677170972119154690',	'2023-07-07 12:25:06',	'127.0.0.1'),
     ('1677171641865617410',	'1666258199679991810',	'2023070711112570320',	'1677170972119154690',	'2023-07-07 12:24:14',	'127.0.0.1'),
     ('1677171502002356226',	'1666258199700963330',	'2023070711112570320',	'1677170972119154690',	'2023-07-07 12:23:41',	'127.0.0.1'),
     ('1677171344711761922',	'1666258199717740546',	'2023070711112570320',	'1677170972119154690',	'2023-07-07 12:23:04',	'127.0.0.1'),
     ('1677247337740853250',	'1666258199734517761',	'2023070704433360220',	'1677254506439729153',	'2023-07-07 17:25:02',	'127.0.0.1'),
     ('1677247422893613057',	'1666258199717740546',	'2023070704433360220',	'1677254506439729153',	'2023-07-07 17:25:22',	'127.0.0.1'),
     ('1677247485963362306',	'1666258199700963330',	'2023070704433360220',	'1677254506439729153',	'2023-07-07 17:25:37',	'127.0.0.1'),
     ('1677247539138748417',	'1666258199679991810',	'2023070704433360220',	'1677254506439729153',	'2023-07-07 17:25:50',	'127.0.0.1'),
     ('1678202452786208769',	'1666258199734517761',	'2023070705157320330',	'1678230109464748033',	'2023-07-10 08:40:19',	'127.0.0.1'),
     ('1678202511724568577',	'1666258199717740546',	'2023070705157320330',	'1678230109464748033',	'2023-07-10 08:40:33',	'127.0.0.1'),
     ('1678202572684582913',	'1666258199700963330',	'2023070705157320330',	'1678230109464748033',	'2023-07-10 08:40:47',	'127.0.0.1'),
     ('1678202629412544514',	'1666258199679991810',	'2023070705157320330',	'1678230109464748033',	'2023-07-10 08:41:01',	'127.0.0.1'),
     ('1680407757695614978',	'1666258199734517761',	'2023071505454370430',	'1680415646271275009',	'2023-07-16 10:43:25',	'127.0.0.1'),
     ('1680408000537427969',	'1666258199717740546',	'2023071505454370430',	'1680415646271275009',	'2023-07-16 10:44:22',	'127.0.0.1'),
     ('1680408226560081921',	'1666258199700963330',	'2023071505454370430',	'1680415646271275009',	'2023-07-16 10:45:16',	'127.0.0.1'),
     ('1680408415911936001',	'1666258199679991810',	'2023071505454370430',	'1680415646271275009',	'2023-07-16 10:46:01',	'127.0.0.1'),
     ('1680407757704003589',	'1666258199734517761',	'2023071506100910410',	'1680415899858894850',	'2023-07-16 10:43:25',	'127.0.0.1'),
     ('1680408000545816584',	'1666258199717740546',	'2023071506100910410',	'1680415899858894850',	'2023-07-16 10:44:22',	'127.0.0.1'),
     ('1680408226576859138',	'1666258199700963330',	'2023071506100910410',	'1680415899858894850',	'2023-07-16 10:45:16',	'127.0.0.1'),
     ('1680408415916130310',	'1666258199679991810',	'2023071506100910410',	'1680415899858894850',	'2023-07-16 10:46:01',	'127.0.0.1'),
     ('1680407757712392194',	'1666258199734517761',	'2023071507171810530',	'1680416096294928386',	'2023-07-16 10:43:25',	'127.0.0.1'),
     ('1680408000550010887',	'1666258199717740546',	'2023071507171810530',	'1680416096294928386',	'2023-07-16 10:44:22',	'127.0.0.1'),
     ('1680408226576859145',	'1666258199700963330',	'2023071507171810530',	'1680416096294928386',	'2023-07-16 10:45:16',	'127.0.0.1'),
     ('1680408415916130317',	'1666258199679991810',	'2023071507171810530',	'1680416096294928386',	'2023-07-16 10:46:01',	'127.0.0.1'),
     ('1680407757716586500',	'1666258199734517761',	'2023071507187680160',	'1680416297336307714',	'2023-07-16 10:43:25',	'127.0.0.1'),
     ('1680408000554205191',	'1666258199717740546',	'2023071507187680160',	'1680416297336307714',	'2023-07-16 10:44:22',	'127.0.0.1'),
     ('1680408226581053448',	'1666258199700963330',	'2023071507187680160',	'1680416297336307714',	'2023-07-16 10:45:16',	'127.0.0.1'),
     ('1680408415920324613',	'1666258199679991810',	'2023071507187680160',	'1680416297336307714',	'2023-07-16 10:46:01',	'127.0.0.1');


-- 字段列显示控制（目前框架采用的vben似乎不支持对列编辑的控制，故简单在前段硬编码控制）
INSERT INTO `sys_permission` (`id`, `parent_id`, `name`, `url`, `component`, `is_route`, `component_name`, `redirect`, `menu_type`, `perms`, `perms_type`, `sort_no`, `always_show`, `icon`, `is_leaf`, `keep_alive`, `hidden`, `hide_tab`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`, `rule_flag`, `status`, `internal_or_external`) VALUES
     ('1667854934080655362',	'2023060402428380260',	'学校代码列控制#1',	NULL,	NULL,	0,	NULL,	NULL,	2,	'colctrl:identificationCode_dictText',	'1',	NULL,	0,	NULL,	1,	0,	0,	0,	NULL,	'admin',	'2023-06-11 19:22:58',	NULL,	NULL,	0,	0,	'1',	0),
     ('1677175883628167169',	'2023070711112570320',	'学校代码列控制#2',	NULL,	NULL,	0,	NULL,	NULL,	2,	'colctrl:identificationCode_dictText',	'1',	NULL,	0,	NULL,	1,	0,	0,	0,	NULL,	'admin',	'2023-07-07 12:41:06',	NULL,	NULL,	0,	0,	'1',	0),
     ('1677254828570664962',	'2023070704433360220',	'学校代码列控制#3',	NULL,	NULL,	0,	NULL,	NULL,	2,	'colctrl:identificationCode_dictText',	'1',	NULL,	0,	NULL,	1,	0,	0,	0,	NULL,	'admin',	'2023-07-07 17:54:48',	NULL,	NULL,	0,	0,	'1',	0),
     ('1678230406798958593',	'2023070705157320330',	'学校代码列控制#4',	NULL,	NULL,	0,	NULL,	NULL,	2,	'colctrl:identificationCode_dictText',	'1',	NULL,	0,	NULL,	1,	0,	0,	0,	NULL,	'admin',	'2023-07-10 10:31:24',	NULL,	NULL,	0,	0,	'1',	0),
     ('1680424172418891778',	'2023071505454370430',	'学校代码列控制#5',	NULL,	NULL,	0,	NULL,	NULL,	2,	'colctrl:identificationCode_dictText',	'1',	NULL,	0,	NULL,	1,	0,	0,	0,	NULL,	'admin',	'2023-07-16 11:48:38',	NULL,	NULL,	0,	0,	'1',	0),
     ('1680424349888282625',	'2023071506100910410',	'学校代码列控制#6',	NULL,	NULL,	0,	NULL,	NULL,	2,	'colctrl:identificationCode_dictText',	'1',	NULL,	0,	NULL,	1,	0,	0,	0,	NULL,	'admin',	'2023-07-16 11:49:20',	NULL,	NULL,	0,	0,	'1',	0),
     ('1680424551021936641',	'2023071507171810530',	'学校代码列控制#7',	NULL,	NULL,	0,	NULL,	NULL,	2,	'colctrl:identificationCode_dictText',	'1',	NULL,	0,	NULL,	1,	0,	0,	0,	NULL,	'admin',	'2023-07-16 11:50:08',	NULL,	NULL,	0,	0,	'1',	0),
     ('1680424755213238274',	'2023071507187680160',	'学校代码列控制#8',	NULL,	NULL,	0,	NULL,	NULL,	2,	'colctrl:identificationCode_dictText',	'1',	NULL,	0,	NULL,	1,	0,	0,	0,	NULL,	'admin',	'2023-07-16 11:50:57',	NULL,	NULL,	0,	0,	'1',	0);
INSERT INTO `sys_role_permission` (`id`, `role_id`, `permission_id`, `data_rule_ids`, `operate_date`, `operate_ip`) VALUES
     ('1667870067091738625',	'f6817f48af4fb3af11b9e8bf182f618b',	'1667854934080655362',	NULL,	'2023-06-11 20:23:06',	'127.0.0.1'),
     ('1667885284941000706',	'1666258199763877889',	'1667854934080655362',	NULL,	'2023-06-11 21:23:34',	'127.0.0.1'),
     ('1667885347482267649',	'1666258199747100674',	'1667854934080655362',	NULL,	'2023-06-11 21:23:49',	'127.0.0.1'),
     ('1677176153082839041',	'f6817f48af4fb3af11b9e8bf182f618b',	'1677175883628167169',	NULL,	'2023-07-07 12:42:10',	'127.0.0.1'),
     ('1677176271051833345',	'1666258199763877889',	'1677175883628167169',	NULL,	'2023-07-07 12:42:38',	'127.0.0.1'),
     ('1677176328115339266',	'1666258199747100674',	'1677175883628167169',	NULL,	'2023-07-07 12:42:52',	'127.0.0.1'),
     ('1677256747649294337',	'f6817f48af4fb3af11b9e8bf182f618b',	'1677254828570664962',	NULL,	'2023-07-07 18:02:25',	'127.0.0.1'),
     ('1677256793027469314',	'1666258199763877889',	'1677254828570664962',	NULL,	'2023-07-07 18:02:36',	'127.0.0.1'),
     ('1677256834668519426',	'1666258199747100674',	'1677254828570664962',	NULL,	'2023-07-07 18:02:46',	'127.0.0.1'),
     ('1678230510008197122',	'f6817f48af4fb3af11b9e8bf182f618b',	'1678230406798958593',	NULL,	'2023-07-10 10:31:48',	'127.0.0.1'),
     ('1678230598533177346',	'1666258199763877889',	'1678230406798958593',	NULL,	'2023-07-10 10:32:09',	'127.0.0.1'),
     ('1678230643701637122',	'1666258199747100674',	'1678230406798958593',	NULL,	'2023-07-10 10:32:20',	'127.0.0.1'),
     ('1680425057823883265',	'1666258199763877889',	'1680424172418891778',	NULL,	'2023-07-16 11:52:09',	'127.0.0.1'),
     ('1680425174161293313',	'1666258199747100674',	'1680424172418891778',	NULL,	'2023-07-16 11:52:37',	'127.0.0.1'),
     ('1680425057840660481',	'1666258199763877889',	'1680424349888282625',	NULL,	'2023-07-16 11:52:09',	'127.0.0.1'),
     ('1680425174161293314',	'1666258199747100674',	'1680424349888282625',	NULL,	'2023-07-16 11:52:37',	'127.0.0.1'),
     ('1680425057844854786',	'1666258199763877889',	'1680424551021936641',	NULL,	'2023-07-16 11:52:09',	'127.0.0.1'),
     ('1680425174161293315',	'1666258199747100674',	'1680424551021936641',	NULL,	'2023-07-16 11:52:37',	'127.0.0.1'),
     ('1680425057844854787',	'1666258199763877889',	'1680424755213238274',	NULL,	'2023-07-16 11:52:09',	'127.0.0.1'),
     ('1680425174161293316',	'1666258199747100674',	'1680424755213238274',	NULL,	'2023-07-16 11:52:37',	'127.0.0.1');


SET FOREIGN_KEY_CHECKS = 1;
