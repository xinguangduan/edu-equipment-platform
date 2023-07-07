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
    title: '物理实验室间数',
    align:"center",
    dataIndex: 'physicsLabRoomNum'
   },
   {
    title: '物理实验室面积',
    align:"center",
    dataIndex: 'physicsLabArea'
   },
   {
    title: '物理实验室实验桌(张)',
    align:"center",
    dataIndex: 'physicsLabBenchNum'
   },
   {
    title: '物理器材、准备室间数',
    align:"center",
    dataIndex: 'physicsEquipmentRoomNum'
   },
   {
    title: '物理器材、准备室面积',
    align:"center",
    dataIndex: 'physicsEquipmentRoomArea'
   },
   {
    title: '物理器材、准备室仪器柜(口)',
    align:"center",
    dataIndex: 'physicsEquipmentCabinetNum'
   },
   {
    title: '物理器材、准备室准备台(个)',
    align:"center",
    dataIndex: 'physicsEquipmentBenchNum'
   },
   {
    title: '化学（生化）实验室间数',
    align:"center",
    dataIndex: 'biochemistryLabRoomNum'
   },
   {
    title: '化学（生化）实验室面积',
    align:"center",
    dataIndex: 'biochemistryLabArea'
   },
   {
    title: '化学（生化）实验室实验桌(张)',
    align:"center",
    dataIndex: 'biochemistryLabBenchNum'
   },
   {
    title: '化学（生化）器材、准备室间数',
    align:"center",
    dataIndex: 'biochemistryEquipRoomNum'
   },
   {
    title: '化学（生化）器材、准备室面积',
    align:"center",
    dataIndex: 'biochemistryEquipRoomArea'
   },
   {
    title: '化学（生化）器材、准备室仪器柜(口)',
    align:"center",
    dataIndex: 'biochemistryEquipCabinetNum'
   },
   {
    title: '化学（生化）器材、准备室准备台(个)',
    align:"center",
    dataIndex: 'biochemistryEquipBenchNum'
   },
   {
    title: '科学实验室间数',
    align:"center",
    dataIndex: 'scienceLabRoomNum'
   },
   {
    title: '科学实验室面积',
    align:"center",
    dataIndex: 'scienceLabArea'
   },
   {
    title: '科学实验室实验桌(张)',
    align:"center",
    dataIndex: 'scienceLabBenchNum'
   },
   {
    title: '科学器材、准备室间数',
    align:"center",
    dataIndex: 'scienceEquipmentRoomNum'
   },
   {
    title: '科学器材、准备室面积',
    align:"center",
    dataIndex: 'scienceEquipmentRoomArea'
   },
   {
    title: '科学器材、准备室仪器柜(口)',
    align:"center",
    dataIndex: 'scienceEquipmentCabinetNum'
   },
   {
    title: '科学器材、准备室准备台(个)',
    align:"center",
    dataIndex: 'scienceEquipmentBenchNum'
   },
   {
    title: '危化品专柜数量(口)',
    align:"center",
    dataIndex: 'hazardousChemicalCabinetNum'
   },
   {
    title: '专职实验员人数',
    align:"center",
    dataIndex: 'fullTimeLabTechnicianNum'
   },
   {
    title: '兼职实验员人数',
    align:"center",
    dataIndex: 'partTimeLabTechnicianNum'
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
    label: '物理实验室间数',
    field: 'physicsLabRoomNum',
    component: 'InputNumber',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入物理实验室间数!'},
          ];
     },
  },
  {
    label: '物理实验室面积',
    field: 'physicsLabArea',
    component: 'InputNumber',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入物理实验室面积!'},
          ];
     },
  },
  {
    label: '物理实验室实验桌(张)',
    field: 'physicsLabBenchNum',
    component: 'InputNumber',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入物理实验室实验桌(张)!'},
          ];
     },
  },
  {
    label: '物理器材、准备室间数',
    field: 'physicsEquipmentRoomNum',
    component: 'InputNumber',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入物理器材、准备室间数!'},
          ];
     },
  },
  {
    label: '物理器材、准备室面积',
    field: 'physicsEquipmentRoomArea',
    component: 'InputNumber',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入物理器材、准备室面积!'},
          ];
     },
  },
  {
    label: '物理器材、准备室仪器柜(口)',
    field: 'physicsEquipmentCabinetNum',
    component: 'InputNumber',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入物理器材、准备室仪器柜(口)!'},
          ];
     },
  },
  {
    label: '物理器材、准备室准备台(个)',
    field: 'physicsEquipmentBenchNum',
    component: 'InputNumber',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入物理器材、准备室准备台(个)!'},
          ];
     },
  },
  {
    label: '化学（生化）实验室间数',
    field: 'biochemistryLabRoomNum',
    component: 'InputNumber',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入化学（生化）实验室间数!'},
          ];
     },
  },
  {
    label: '化学（生化）实验室面积',
    field: 'biochemistryLabArea',
    component: 'InputNumber',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入化学（生化）实验室面积!'},
          ];
     },
  },
  {
    label: '化学（生化）实验室实验桌(张)',
    field: 'biochemistryLabBenchNum',
    component: 'InputNumber',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入化学（生化）实验室实验桌(张)!'},
          ];
     },
  },
  {
    label: '化学（生化）器材、准备室间数',
    field: 'biochemistryEquipRoomNum',
    component: 'InputNumber',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入化学（生化）器材、准备室间数!'},
          ];
     },
  },
  {
    label: '化学（生化）器材、准备室面积',
    field: 'biochemistryEquipRoomArea',
    component: 'InputNumber',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入化学（生化）器材、准备室面积!'},
          ];
     },
  },
  {
    label: '化学（生化）器材、准备室仪器柜(口)',
    field: 'biochemistryEquipCabinetNum',
    component: 'InputNumber',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入化学（生化）器材、准备室仪器柜(口)!'},
          ];
     },
  },
  {
    label: '化学（生化）器材、准备室准备台(个)',
    field: 'biochemistryEquipBenchNum',
    component: 'InputNumber',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入化学（生化）器材、准备室准备台(个)!'},
          ];
     },
  },
  {
    label: '科学实验室间数',
    field: 'scienceLabRoomNum',
    component: 'InputNumber',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入科学实验室间数!'},
          ];
     },
  },
  {
    label: '科学实验室面积',
    field: 'scienceLabArea',
    component: 'InputNumber',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入科学实验室面积!'},
          ];
     },
  },
  {
    label: '科学实验室实验桌(张)',
    field: 'scienceLabBenchNum',
    component: 'InputNumber',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入科学实验室实验桌(张)!'},
          ];
     },
  },
  {
    label: '科学器材、准备室间数',
    field: 'scienceEquipmentRoomNum',
    component: 'InputNumber',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入科学器材、准备室间数!'},
          ];
     },
  },
  {
    label: '科学器材、准备室面积',
    field: 'scienceEquipmentRoomArea',
    component: 'InputNumber',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入科学器材、准备室面积!'},
          ];
     },
  },
  {
    label: '科学器材、准备室仪器柜(口)',
    field: 'scienceEquipmentCabinetNum',
    component: 'InputNumber',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入科学器材、准备室仪器柜(口)!'},
          ];
     },
  },
  {
    label: '科学器材、准备室准备台(个)',
    field: 'scienceEquipmentBenchNum',
    component: 'InputNumber',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入科学器材、准备室准备台(个)!'},
          ];
     },
  },
  {
    label: '危化品专柜数量(口)',
    field: 'hazardousChemicalCabinetNum',
    component: 'InputNumber',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入危化品专柜数量(口)!'},
          ];
     },
  },
  {
    label: '专职实验员人数',
    field: 'fullTimeLabTechnicianNum',
    component: 'InputNumber',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入专职实验员人数!'},
          ];
     },
  },
  {
    label: '兼职实验员人数',
    field: 'partTimeLabTechnicianNum',
    component: 'InputNumber',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入兼职实验员人数!'},
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