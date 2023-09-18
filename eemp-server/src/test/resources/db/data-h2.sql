INSERT INTO `organization_definition` (`id`, `identification_code`, `township`, `institution_name`, `institution_type`, `chart_group`, `admin_code`, `role_code`, `initial_password`, `admin_generation_success`) VALUES
     ('101',	'demo_01',	'11',	'初级中学一',	'14',   '初中',	'admin',	'',	'',	''),
     ('102',	'demo_02',	'11',	'中心小学一',	'12',	'中心小学',   'admin',	'',	'',	''),
     ('103',	'demo_03',	'11',	'完全小学一',	'13',	'完全小学',   'admin',	'',	'',	''),
     ('104',	'demo_04',	'11',	'高级中学一',	'15',	'高职特幼',   'admin_104',	'',	'',	''),
     ('105',	'demo_05',	'11',	'幼儿园一',	'11',	'高职特幼',   'admin',	'',	'',	''),
     ('201',	'school_01',	'11',	'八宝初级中学',	'14',	'初中',   'admin',	'',	'',	''),
     ('202',	'school_02',	'11',	'八宝小学',	'12',	'中心小学',   'admin',	'',	'',	''),
     ('203',	'school_03',	'11',	'八宝小学中洲校区',	'13',	'完全小学',   'admin',	'',	'',	'');

INSERT INTO filling_control (id, filling_code, control_name, start_date, end_date) VALUES
  ('101', '2022-02', '2022学年下学期', {ts '2023-02-16'}, {ts '2023-03-31'}),
  ('102', '2023-01', '2023学年上学期', {ts '2023-09-01'}, {ts '2023-10-31'});

INSERT INTO edu_informatization_basic_info_1 ( id, identification_code, fill_date, teacher_count, student_count, room_count, classroom_count, student_desk_count, connected_room_count, has_a_central_server_room, teaching_resource_capacity ) VALUES
  ( '101', 'demo_01', current_timestamp(), 169, 3629, 90, 52, 3698, 60, 'Y', 3.2 ),
  ( '102', 'demo_02', sysdate, 151, 3629, 90, 52, 3698, 60, 'Y', 3.2 ),
  ( '103', 'demo_03', sysdate - 365, 169, 3629, 90, 52, 3698, 60, 'Y', 3.2 ),
  ( '104', 'demo_04', parsedatetime('2021-06-29', 'yyyy-mm-dd'), 169, 3629, 90, 52, 3698, 60, 'Y', 3.2 ),
  ( '105', 'demo_05', {ts '2021-08-16'}, 169, 3629, 90, 52, 3698, 60, 'Y', 3.2 ),
  ( '106', 'demo_05', {ts '2021-10-23'}, 187, 3869, 90, 52, 3698, 60, 'Y', 3.6 ),
  ( '201', 'school_01', {ts '2021-03-16'}, 100, 1000, 20, 10, 2000, 5, 'N', 2.6 ),
  ( '202', 'school_01', {ts '2022-02-12'}, 100, 1000, 20, 10, 2000, 10, 'Y', 3.2 ),
  ( '203', 'school_01', {ts '2023-02-26'}, 200, 2000, 20, 10, 3000, 10, 'Y', 5.2 ),
  ( '204', 'school_02', {ts '2022-02-26'}, 300, 3000, 30, 10, 3000, 10, 'Y', 5.0 ),
  ( '205', 'school_02', {ts '2023-02-28'}, 310, 3000, 30, 10, 3000, 10, 'Y', 6.2 ),
  ( '206', 'school_02', {ts '2023-02-26'}, 300, 3000, 30, 10, 3000, 10, 'Y', 6.8 ),
  ( '207', 'school_03', {ts '2023-01-11'}, 200, 5000, 30, 20, 6000, 20, 'Y', 6.9 ),
  ( '208', 'school_03', {ts '2023-02-26'}, 300, 5000, 30, 20, 6000, 20, 'Y', 8.2 ),
  ( '209', 'school_03', {ts '2023-06-15'}, 300, 5000, 30, 20, 6000, 20, 'Y', 8.2 ),
  ( '210', 'school_03', {ts '2023-07-08'}, 300, 5000, 30, 20, 6000, 20, 'Y', 8.2 );