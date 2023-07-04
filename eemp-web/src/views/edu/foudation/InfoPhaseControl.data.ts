import {BasicColumn} from '/@/components/Table';
import {FormSchema} from '/@/components/Table';
import { rules} from '/@/utils/helper/validator';
import { render } from '/@/utils/common/renderUtils';
//列表数据
export const columns: BasicColumn[] = [
   {
    title: '时段代码',
    align:"center",
    dataIndex: 'phaseCode'
   },
   {
    title: '时段名称',
    align:"center",
    dataIndex: 'phaseName'
   },
   {
    title: '归档状态',
    align:"center",
    dataIndex: 'archiveStatus_dictText'
   },
   {
    title: '归档日期',
    align:"center",
    dataIndex: 'archiveDate',
    customRender:({text}) =>{
      return !text?"":(text.length>10?text.substr(0,10):text)
    },
   },
];
//查询数据
export const searchFormSchema: FormSchema[] = [
	{
      label: "时段代码",
      field: 'phaseCode',
      component: 'Input',
      colProps: {span: 6},
 	},
	{
      label: "时段名称",
      field: 'phaseName',
      component: 'Input',
      colProps: {span: 6},
 	},
	{
      label: "归档状态",
      field: 'archiveStatus',
      component: 'JDictSelectTag',
      componentProps:{
          dictCode:"yn"
      },
      colProps: {span: 6},
 	},
	{
      label: "归档日期",
      field: 'archiveDate',
      component: 'DatePicker',
      colProps: {span: 6},
 	},
];
//表单数据
export const formSchema: FormSchema[] = [
  {
    label: '时段代码',
    field: 'phaseCode',
    component: 'Input',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入时段代码!'},
                 {...rules.duplicateCheckRule('info_phase_control', 'phase_code',model,schema)[0]},
          ];
     },
  },
  {
    label: '时段名称',
    field: 'phaseName',
    component: 'Input',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入时段名称!'},
          ];
     },
  },
  {
    label: '归档状态',
    field: 'archiveStatus',
    component: 'JDictSelectTag',
    componentProps:{
        dictCode:"yn"
     },
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入归档状态!'},
          ];
     },
  },
  {
    label: '归档日期',
    field: 'archiveDate',
    component: 'DatePicker',
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