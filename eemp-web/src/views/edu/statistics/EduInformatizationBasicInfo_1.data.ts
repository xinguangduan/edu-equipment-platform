import {BasicColumn} from '/@/components/Table';
import {FormSchema} from '/@/components/Table';
import { rules} from '/@/utils/helper/validator';
import { render } from '/@/utils/common/renderUtils';
//列表数据
export const columns: BasicColumn[] = [
   {
    title: '学校名称',
    align:"center",
    dataIndex: 'identificationCode_dictText'
   },
   {
    title: '信息时段',
    align:"center",
    dataIndex: 'phaseCode_dictText'
   },
   {
    title: '任课教师总数（人）',
    align:"center",
    dataIndex: 'teacherCount'
   },
   {
    title: '学生总数（人）',
    align:"center",
    dataIndex: 'studentCount'
   },
   {
    title: '教室（含功能室）总数（间）',
    align:"center",
    dataIndex: 'roomCount'
   },
   {
    title: '班级教室总数（间）',
    align:"center",
    dataIndex: 'classroomCount'
   },
   {
    title: '学生课桌椅可用数（套）',
    align:"center",
    dataIndex: 'studentDeskCount'
   },
   {
    title: '已入网教室数（间）',
    align:"center",
    dataIndex: 'connectedRoomCount'
   },
   {
    title: '是否建设网络中心机房',
    align:"center",
    dataIndex: 'hasACentralServerRoom_dictText'
   },
   {
    title: '学校资源库教学资源容量（GB）',
    align:"center",
    dataIndex: 'teachingResourceCapacity'
   },
];
//查询数据
export const searchFormSchema: FormSchema[] = [
	{
      label: "学校名称",
      field: 'identificationCode',
      component: 'JDictSelectTag',
      componentProps:{
          dictCode:"organization_definition,institution_name,identification_code"
      },
      colProps: {span: 6},
 	},
	{
      label: "信息时段",
      field: 'phaseCode',
      component: 'JDictSelectTag',
      componentProps:{
          dictCode:"info_phase_control,phase_name,phase_code"
      },
      colProps: {span: 6},
 	},
];
//表单数据
export const formSchema: FormSchema[] = [
  {
    label: '学校名称',
    field: 'identificationCode',
    component: 'JDictSelectTag',
    componentProps:{
        dictCode:"organization_definition,institution_name,identification_code"
     },
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入标识代码!'},
          ];
     },
  },
  {
    label: '信息时段',
    field: 'phaseCode',
    component: 'JDictSelectTag',
    componentProps:{
        dictCode:"info_phase_control,phase_name,phase_code"
     },
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入时段代码!'},
          ];
     },
  },
  {
    label: '任课教师总数（人）',
    field: 'teacherCount',
    component: 'InputNumber',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入任课教师总数（人）!'},
          ];
     },
  },
  {
    label: '学生总数（人）',
    field: 'studentCount',
    component: 'InputNumber',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入学生总数（人）!'},
          ];
     },
  },
  {
    label: '教室（含功能室）总数（间）',
    field: 'roomCount',
    component: 'InputNumber',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入教室（含功能室）总数（间）!'},
          ];
     },
  },
  {
    label: '班级教室总数（间）',
    field: 'classroomCount',
    component: 'InputNumber',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入班级教室总数（间）!'},
          ];
     },
  },
  {
    label: '学生课桌椅可用数（套）',
    field: 'studentDeskCount',
    component: 'InputNumber',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入学生课桌椅可用数（套）!'},
          ];
     },
  },
  {
    label: '已入网教室数（间）',
    field: 'connectedRoomCount',
    component: 'InputNumber',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入已入网教室数（间）!'},
          ];
     },
  },
  {
    label: '是否建设网络中心机房',
    field: 'hasACentralServerRoom',
    component: 'JDictSelectTag',
    componentProps:{
        dictCode:"yn"
     },
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入是否建设网络中心机房!'},
          ];
     },
  },
  {
    label: '学校资源库教学资源容量（GB）',
    field: 'teachingResourceCapacity',
    component: 'InputNumber',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入学校资源库教学资源容量（GB）!'},
          ];
     },
  },
	// TODO 主键隐藏字段，目前写死为ID
	{
	  label: '',
	  field: 'id',
	  component: 'Input',
	  show: false
	},
];



/**
* 流程表单调用这个方法获取formSchema
* @param param
*/
export function getBpmFormSchema(_formData): FormSchema[]{
  // 默认和原始表单保持一致 如果流程中配置了权限数据，这里需要单独处理formSchema
  return formSchema;
}
