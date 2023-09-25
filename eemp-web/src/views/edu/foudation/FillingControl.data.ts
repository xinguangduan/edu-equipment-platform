import {BasicColumn} from '/@/components/Table';
import {FormSchema} from '/@/components/Table';
import { rules} from '/@/utils/helper/validator';
import { render } from '/@/utils/common/renderUtils';
//列表数据
export const columns: BasicColumn[] = [
   {
    title: '填报类型',
    align:"center",
    dataIndex: 'controlType_dictText'
   },
   {
    title: '填报说明',
    align:"center",
    dataIndex: 'controlName'
   },
   {
    title: '填报开始日期',
    align:"center",
    dataIndex: 'startDate',
    customRender:({text}) =>{
      return !text?"":(text.length>10?text.substr(0,10):text)
    },
   },
   {
    title: '填报结束日期',
    align:"center",
    dataIndex: 'endDate',
    customRender:({text}) =>{
      return !text?"":(text.length>10?text.substr(0,10):text)
    },
   },
   {
    title: '审核开始日期',
    align:"center",
    dataIndex: 'checkStartDate',
    customRender:({text}) =>{
      return !text?"":(text.length>10?text.substr(0,10):text)
    },
   },
   {
    title: '审核结束日期',
    align:"center",
    dataIndex: 'checkEndDate',
    customRender:({text}) =>{
      return !text?"":(text.length>10?text.substr(0,10):text)
    },
   },
   {
    title: '幼儿园',
    align:"center",
    dataIndex: 'nurserySchool_dictText'
   },
   {
    title: '小学',
    align:"center",
    dataIndex: 'primarySchool_dictText'
   },
   {
    title: '初中',
    align:"center",
    dataIndex: 'juniorSchool_dictText'
   },
   {
    title: '高中',
    align:"center",
    dataIndex: 'seniorSchool_dictText'
   },
   {
    title: '备注',
    align:"center",
    dataIndex: 'memo'
   },
];
//查询数据
export const searchFormSchema: FormSchema[] = [
	{
      label: "填报类型",
      field: 'controlType',
      component: 'JDictSelectTag',
      componentProps:{
          dictCode:"filling_control_type"
      },
      colProps: {span: 6},
  },
	{
      label: "填报说明",
      field: 'controlName',
      component: 'Input',
      colProps: {span: 6},
 	},
     {
      label: "填报开始日期",
      field: "startDate",
      component: 'RangePicker',
      componentProps: {
          valueType: 'Date',
      },
      colProps: {span: 6},
	},
     {
      label: "填报结束日期",
      field: "endDate",
      component: 'RangePicker',
      componentProps: {
          valueType: 'Date',
      },
      colProps: {span: 6},
	},
];
//表单数据
export const formSchema: FormSchema[] = [
  {
    label: '填报类型',
    field: 'controlType',
    component: 'JDictSelectTag',
    componentProps:{
        dictCode:"filling_control_type"
     },
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入填报类型!'},
          ];
     },
  },
  {
    label: '填报说明',
    field: 'controlName',
    component: 'Input',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入填报说明!'},
          ];
     },
  },
  {
    label: '填报开始日期',
    field: 'startDate',
    component: 'DatePicker',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入填报开始日期!'},
          ];
     },
  },
  {
    label: '填报结束日期',
    field: 'endDate',
    component: 'DatePicker',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入填报结束日期!'},
          ];
     },
  },
  {
    label: '审核开始日期',
    field: 'checkStartDate',
    component: 'DatePicker',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入审核开始日期!'},
          ];
     },
  },
  {
    label: '审核结束日期',
    field: 'checkEndDate',
    component: 'DatePicker',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入审核结束日期!'},
          ];
     },
  },
  {
    label: '幼儿园',
    field: 'nurserySchool',
    component: 'JSelectMultiple',
    componentProps:{
        dictCode:"organization_definition,institution_name,identification_code"
     },
  },
  {
    label: '小学',
    field: 'primarySchool',
    component: 'JSelectMultiple',
    componentProps:{
        dictCode:"organization_definition,institution_name,identification_code"
     },
  },
  {
    label: '初中',
    field: 'juniorSchool',
    component: 'JSelectMultiple',
    componentProps:{
        dictCode:"organization_definition,institution_name,identification_code"
     },
  },
  {
    label: '高中',
    field: 'seniorSchool',
    component: 'JSelectMultiple',
    componentProps:{
        dictCode:"organization_definition,institution_name,identification_code"
     },
  },
  {
    label: '备注',
    field: 'memo',
    component: 'Input',
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