import {BasicColumn} from '/@/components/Table';
import {FormSchema} from '/@/components/Table';
import { rules} from '/@/utils/helper/validator';
import { render } from '/@/utils/common/renderUtils';
//列表数据
export const columns: BasicColumn[] = [
   {
    title: '标识代码',
    align:"center",
    dataIndex: 'identificationCode_dictText'
   },
   {
    title: '填报日期',
    align:"center",
    dataIndex: 'fillDate',
    customRender:({text}) =>{
      return !text?"":(text.length>10?text.substr(0,10):text)
    },
   },
   {
    title: '综合实践室间数',
    align:"center",
    dataIndex: 'integratedPracticeRoomNum'
   },
   {
    title: '综合实践室面积（m2）',
    align:"center",
    dataIndex: 'integratedPracticeRoomArea'
   },
   {
    title: '综合实践室器材件数',
    align:"center",
    dataIndex: 'integratedEquipmentNum'
   },
   {
    title: '计算机教室间数',
    align:"center",
    dataIndex: 'computerClassroomNum'
   },
   {
    title: '计算机教室面积（m2）',
    align:"center",
    dataIndex: 'computerClassroomArea'
   },
   {
    title: '多功能会议室（演播室）间数',
    align:"center",
    dataIndex: 'multifunctionalRoomNum'
   },
   {
    title: '多功能会议室（演播室）面积（m2）',
    align:"center",
    dataIndex: 'multifunctionalRoomArea'
   },
   {
    title: '多功能会议室（演播室）座位数',
    align:"center",
    dataIndex: 'multifunctionalSeatNum'
   },
   {
    title: '录播教室间数',
    align:"center",
    dataIndex: 'recordingClassroomNum'
   },
   {
    title: '录播教室面积（m2）',
    align:"center",
    dataIndex: 'recordingClassroomArea'
   },
   {
    title: '观摩教室间数',
    align:"center",
    dataIndex: 'observationClassroomNum'
   },
   {
    title: '观摩教室面积（m2）',
    align:"center",
    dataIndex: 'observationClassroomArea'
   },
   {
    title: '观摩教室座位数',
    align:"center",
    dataIndex: 'observationSeatNum'
   },
   {
    title: '创客教室间数',
    align:"center",
    dataIndex: 'makerClassroomNum'
   },
   {
    title: '创客教室面积（m2）',
    align:"center",
    dataIndex: 'makerClassroomArea'
   },
   {
    title: '创客教室器材件数',
    align:"center",
    dataIndex: 'makerEquipmentNum'
   },
   {
    title: '特色功能室一名称',
    align:"center",
    dataIndex: 'firstFeaturedRoomName'
   },
   {
    title: '特色功能室一间数',
    align:"center",
    dataIndex: 'firstFeaturedRoomNum'
   },
   {
    title: '特色功能室一面积（m2）',
    align:"center",
    dataIndex: 'firstFeaturedRoomArea'
   },
   {
    title: '特色功能室二名称',
    align:"center",
    dataIndex: 'secondFeaturedRoomName'
   },
   {
    title: '特色功能室二间数',
    align:"center",
    dataIndex: 'secondFeaturedRoomNum'
   },
   {
    title: '特色功能室二面积（m2）',
    align:"center",
    dataIndex: 'secondFeaturedRoomArea'
   },
];
//查询数据
export const searchFormSchema: FormSchema[] = [
	{
      label: "标识代码",
      field: 'identificationCode',
      component: 'JDictSelectTag',
      componentProps:{
          dictCode:"organization_definition,institution_name,identification_code"
      },
      colProps: {span: 6},
 	},
	{
      label: "填报日期",
      field: 'fillDate',
      component: 'DatePicker',
      colProps: {span: 6},
 	},
];
//表单数据
export const formSchema: FormSchema[] = [
  {
    label: '标识代码',
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
    label: '填报日期',
    field: 'fillDate',
    component: 'DatePicker',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入填报日期!'},
          ];
     },
  },
  {
    label: '综合实践室间数',
    field: 'integratedPracticeRoomNum',
    component: 'InputNumber',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入综合实践室间数!'},
          ];
     },
  },
  {
    label: '综合实践室面积（m2）',
    field: 'integratedPracticeRoomArea',
    component: 'InputNumber',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入综合实践室面积（m2）!'},
          ];
     },
  },
  {
    label: '综合实践室器材件数',
    field: 'integratedEquipmentNum',
    component: 'InputNumber',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入综合实践室器材件数!'},
          ];
     },
  },
  {
    label: '计算机教室间数',
    field: 'computerClassroomNum',
    component: 'InputNumber',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入计算机教室间数!'},
          ];
     },
  },
  {
    label: '计算机教室面积（m2）',
    field: 'computerClassroomArea',
    component: 'InputNumber',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入计算机教室面积（m2）!'},
          ];
     },
  },
  {
    label: '多功能会议室（演播室）间数',
    field: 'multifunctionalRoomNum',
    component: 'InputNumber',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入多功能会议室（演播室）间数!'},
          ];
     },
  },
  {
    label: '多功能会议室（演播室）面积（m2）',
    field: 'multifunctionalRoomArea',
    component: 'InputNumber',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入多功能会议室（演播室）面积（m2）!'},
          ];
     },
  },
  {
    label: '多功能会议室（演播室）座位数',
    field: 'multifunctionalSeatNum',
    component: 'InputNumber',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入多功能会议室（演播室）座位数!'},
          ];
     },
  },
  {
    label: '录播教室间数',
    field: 'recordingClassroomNum',
    component: 'InputNumber',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入录播教室间数!'},
          ];
     },
  },
  {
    label: '录播教室面积（m2）',
    field: 'recordingClassroomArea',
    component: 'InputNumber',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入录播教室面积（m2）!'},
          ];
     },
  },
  {
    label: '观摩教室间数',
    field: 'observationClassroomNum',
    component: 'InputNumber',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入观摩教室间数!'},
          ];
     },
  },
  {
    label: '观摩教室面积（m2）',
    field: 'observationClassroomArea',
    component: 'InputNumber',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入观摩教室面积（m2）!'},
          ];
     },
  },
  {
    label: '观摩教室座位数',
    field: 'observationSeatNum',
    component: 'InputNumber',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入观摩教室座位数!'},
          ];
     },
  },
  {
    label: '创客教室间数',
    field: 'makerClassroomNum',
    component: 'InputNumber',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入创客教室间数!'},
          ];
     },
  },
  {
    label: '创客教室面积（m2）',
    field: 'makerClassroomArea',
    component: 'InputNumber',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入创客教室面积（m2）!'},
          ];
     },
  },
  {
    label: '创客教室器材件数',
    field: 'makerEquipmentNum',
    component: 'InputNumber',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入创客教室器材件数!'},
          ];
     },
  },
  {
    label: '特色功能室一名称',
    field: 'firstFeaturedRoomName',
    component: 'Input',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入特色功能室一名称!'},
          ];
     },
  },
  {
    label: '特色功能室一间数',
    field: 'firstFeaturedRoomNum',
    component: 'InputNumber',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入特色功能室一间数!'},
          ];
     },
  },
  {
    label: '特色功能室一面积（m2）',
    field: 'firstFeaturedRoomArea',
    component: 'InputNumber',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入特色功能室一面积（m2）!'},
          ];
     },
  },
  {
    label: '特色功能室二名称',
    field: 'secondFeaturedRoomName',
    component: 'Input',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入特色功能室二名称!'},
          ];
     },
  },
  {
    label: '特色功能室二间数',
    field: 'secondFeaturedRoomNum',
    component: 'InputNumber',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入特色功能室二间数!'},
          ];
     },
  },
  {
    label: '特色功能室二面积（m2）',
    field: 'secondFeaturedRoomArea',
    component: 'InputNumber',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入特色功能室二面积（m2）!'},
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