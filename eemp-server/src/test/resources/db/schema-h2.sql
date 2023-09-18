DROP TABLE IF EXISTS `organization_definition`;
CREATE TABLE `organization_definition` (
  `id` varchar(36)  NOT NULL,
  `identification_code` varchar(18)  NOT NULL COMMENT '标识代码',
  `township` varchar(16)  NOT NULL COMMENT '乡镇',
  `institution_name` varchar(50)  NOT NULL COMMENT '机构名称',
  `institution_type` varchar(2)  NOT NULL COMMENT '机构类型',
  `chart_group` varchar(10) DEFAULT NULL COMMENT '图表分组',
  `admin_code` varchar(18)  NOT NULL COMMENT '账户名称',
  `last_login_time` datetime DEFAULT NULL COMMENT '最近访问时间',
  `admin_name` varchar(32)  DEFAULT NULL COMMENT '管理员姓名',
  `phone_number` varchar(32) DEFAULT NULL COMMENT '联系电话',
  `role_code` varchar(32)  DEFAULT NULL COMMENT '角色编码',
  `initial_password` varchar(32)  DEFAULT NULL COMMENT '初始密码',
  `admin_generation_success` varchar(1)  DEFAULT NULL COMMENT '账户生成是否成功',
  `failure_reason` varchar(30)  DEFAULT NULL COMMENT '失败原因',
  `create_by` varchar(50)  DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_by` varchar(50)  DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新日期',
  `sys_org_code` varchar(64)  DEFAULT NULL COMMENT '所属部门',
  PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS `filling_control`;
CREATE TABLE `filling_control` (
  `id` varchar(36) NOT NULL,
  `filling_code` varchar(18) NOT NULL COMMENT '填报代码',
  `control_name` varchar(50) NOT NULL COMMENT '控制名称',
  `start_date` date NOT NULL COMMENT '开始日期',
  `end_date` date NOT NULL COMMENT '结束日期',
  `memo` longtext COMMENT '备注',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_by` varchar(50) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新日期',
  `sys_org_code` varchar(64) DEFAULT NULL COMMENT '所属部门',
  PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS `edu_informatization_basic_info_1`;
CREATE TABLE `edu_informatization_basic_info_1` (
  `id` varchar(36) NOT NULL,
  `identification_code` varchar(18) NOT NULL COMMENT '标识代码',
  `fill_date` date NOT NULL COMMENT '填报日期',
  `teacher_count` int NOT NULL COMMENT '任课教师总数（人）',
  `student_count` int NOT NULL COMMENT '学生总数（人）',
  `room_count` int NOT NULL COMMENT '教室（含功能室）总数（间）',
  `classroom_count` int NOT NULL COMMENT '班级教室总数（间）',
  `student_desk_count` int NOT NULL COMMENT '学生课桌椅可用数（套）',
  `connected_room_count` int NOT NULL COMMENT '已入网教室数（间）',
  `has_a_central_server_room` varchar(1) NOT NULL COMMENT '是否建设网络中心机房',
  `teaching_resource_capacity` double NOT NULL COMMENT '学校资源库教学资源容量（GB）',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_by` varchar(50) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新日期',
  `sys_org_code` varchar(64) DEFAULT NULL COMMENT '所属部门',
  PRIMARY KEY (`id`)
);