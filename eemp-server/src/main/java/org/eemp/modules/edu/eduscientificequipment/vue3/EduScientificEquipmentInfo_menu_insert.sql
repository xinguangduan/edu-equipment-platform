-- 注意：该页面对应的前台目录为views/edu.eduscientificequipment文件夹下
-- 如果你想更改到其他目录，请修改sql中component字段对应的值


INSERT INTO sys_permission(id, parent_id, name, url, component, component_name, redirect, menu_type, perms, perms_type, sort_no, always_show, icon, is_route, is_leaf, keep_alive, hidden, hide_tab, description, status, del_flag, rule_flag, create_by, create_time, update_by, update_time, internal_or_external) 
VALUES ('2023041608168730410', NULL, '小学科学教学装备配置登记表', '/edu.eduscientificequipment/eduScientificEquipmentInfoList', 'edu.eduscientificequipment/EduScientificEquipmentInfoList', NULL, NULL, 0, NULL, '1', 0.00, 0, NULL, 1, 0, 0, 0, 0, NULL, '1', 0, 0, 'admin', '2023-04-16 20:16:41', NULL, NULL, 0);

-- 权限控制sql
-- 新增
INSERT INTO sys_permission(id, parent_id, name, url, component, is_route, component_name, redirect, menu_type, perms, perms_type, sort_no, always_show, icon, is_leaf, keep_alive, hidden, hide_tab, description, create_by, create_time, update_by, update_time, del_flag, rule_flag, status, internal_or_external)
VALUES ('2023041608168730411', '2023041608168730410', '添加小学科学教学装备配置登记表', NULL, NULL, 0, NULL, NULL, 2, 'edu.eduscientificequipment:edu_scientific_equipment_info:add', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-04-16 20:16:41', NULL, NULL, 0, 0, '1', 0);
-- 编辑
INSERT INTO sys_permission(id, parent_id, name, url, component, is_route, component_name, redirect, menu_type, perms, perms_type, sort_no, always_show, icon, is_leaf, keep_alive, hidden, hide_tab, description, create_by, create_time, update_by, update_time, del_flag, rule_flag, status, internal_or_external)
VALUES ('2023041608168730412', '2023041608168730410', '编辑小学科学教学装备配置登记表', NULL, NULL, 0, NULL, NULL, 2, 'edu.eduscientificequipment:edu_scientific_equipment_info:edit', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-04-16 20:16:41', NULL, NULL, 0, 0, '1', 0);
-- 删除
INSERT INTO sys_permission(id, parent_id, name, url, component, is_route, component_name, redirect, menu_type, perms, perms_type, sort_no, always_show, icon, is_leaf, keep_alive, hidden, hide_tab, description, create_by, create_time, update_by, update_time, del_flag, rule_flag, status, internal_or_external)
VALUES ('2023041608168730413', '2023041608168730410', '删除小学科学教学装备配置登记表', NULL, NULL, 0, NULL, NULL, 2, 'edu.eduscientificequipment:edu_scientific_equipment_info:delete', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-04-16 20:16:41', NULL, NULL, 0, 0, '1', 0);
-- 批量删除
INSERT INTO sys_permission(id, parent_id, name, url, component, is_route, component_name, redirect, menu_type, perms, perms_type, sort_no, always_show, icon, is_leaf, keep_alive, hidden, hide_tab, description, create_by, create_time, update_by, update_time, del_flag, rule_flag, status, internal_or_external)
VALUES ('2023041608168730414', '2023041608168730410', '批量删除小学科学教学装备配置登记表', NULL, NULL, 0, NULL, NULL, 2, 'edu.eduscientificequipment:edu_scientific_equipment_info:deleteBatch', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-04-16 20:16:41', NULL, NULL, 0, 0, '1', 0);
-- 导出excel
INSERT INTO sys_permission(id, parent_id, name, url, component, is_route, component_name, redirect, menu_type, perms, perms_type, sort_no, always_show, icon, is_leaf, keep_alive, hidden, hide_tab, description, create_by, create_time, update_by, update_time, del_flag, rule_flag, status, internal_or_external)
VALUES ('2023041608168730415', '2023041608168730410', '导出excel_小学科学教学装备配置登记表', NULL, NULL, 0, NULL, NULL, 2, 'edu.eduscientificequipment:edu_scientific_equipment_info:exportXls', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-04-16 20:16:41', NULL, NULL, 0, 0, '1', 0);
-- 导入excel
INSERT INTO sys_permission(id, parent_id, name, url, component, is_route, component_name, redirect, menu_type, perms, perms_type, sort_no, always_show, icon, is_leaf, keep_alive, hidden, hide_tab, description, create_by, create_time, update_by, update_time, del_flag, rule_flag, status, internal_or_external)
VALUES ('2023041608168730416', '2023041608168730410', '导入excel_小学科学教学装备配置登记表', NULL, NULL, 0, NULL, NULL, 2, 'edu.eduscientificequipment:edu_scientific_equipment_info:importExcel', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-04-16 20:16:41', NULL, NULL, 0, 0, '1', 0);