import {BasicColumn} from '/@/components/Table';
import {FormSchema} from '/@/components/Table';
import { rules} from '/@/utils/helper/validator';
import { render } from '/@/utils/common/renderUtils';
//列表数据
export const columns: BasicColumn[] = [
   {
    title: '填报代码',
    align:"center",
    dataIndex: 'fillingCode'
   },
   {
    title: '控制名称',
    align:"center",
    dataIndex: 'controlName'
   },
   {
    title: '开始日期',
    align:"center",
    dataIndex: 'startDate',
    customRender:({text}) =>{
      return !text?"":(text.length>10?text.substr(0,10):text)
    },
   },
   {
    title: '结束日期',
    align:"center",
    dataIndex: 'endDate',
    customRender:({text}) =>{
      return !text?"":(text.length>10?text.substr(0,10):text)
    },
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
      label: "填报代码",
      field: 'fillingCode',
      component: 'Input',
      colProps: {span: 6},
 	},
	{
      label: "控制名称",
      field: 'controlName',
      component: 'Input',
      colProps: {span: 6},
 	},
     {
      label: "开始日期",
      field: "startDate",
      component: 'RangePicker',
      componentProps: {
          valueType: 'Date',
      },
      colProps: {span: 6},
	},
     {
      label: "结束日期",
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
    label: '填报代码',
    field: 'fillingCode',
    component: 'Input',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入填报代码!'},
          ];
     },
  },
  {
    label: '控制名称',
    field: 'controlName',
    component: 'Input',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入控制名称!'},
          ];
     },
  },
  {
    label: '开始日期',
    field: 'startDate',
    component: 'DatePicker',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入开始日期!'},
          ];
     },
  },
  {
    label: '结束日期',
    field: 'endDate',
    component: 'DatePicker',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入结束日期!'},
          ];
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