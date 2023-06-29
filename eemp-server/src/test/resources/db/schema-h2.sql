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