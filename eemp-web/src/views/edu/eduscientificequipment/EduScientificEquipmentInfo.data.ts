import {BasicColumn} from '/@/components/Table';
import {FormSchema} from '/@/components/Table';
import { rules} from '/@/utils/helper/validator';
import { render } from '/@/utils/common/renderUtils';
//列表数据
export const columns: BasicColumn[] = [
   {
    title: '学校',
    align:"center",
    dataIndex: 'school'
   },
   {
    title: '编号',
    align:"center",
    dataIndex: 'numberCode'
   },
   {
    title: '名称',
    align:"center",
    dataIndex: 'name'
   },
   {
    title: '单位',
    align:"center",
    dataIndex: 'unit_dictText'
   },
   {
    title: '配置标准',
    align:"center",
    dataIndex: 'equipmentStandard'
   },
   {
    title: '年份',
    align:"center",
    dataIndex: 'year_dictText'
   },
   {
    title: '年初数',
    align:"center",
    dataIndex: 'yearStartNum'
   },
   {
    title: '增减数',
    align:"center",
    dataIndex: 'yearDelta'
   },
   {
    title: '年末数',
    align:"center",
    dataIndex: 'yearEndNum'
   },
];
//查询数据
export const searchFormSchema: FormSchema[] = [
	{
      label: "编号",
      field: 'numberCode',
      component: 'Input',
      colProps: {span: 6},
 	},
	{
      label: "名称",
      field: 'name',
      component: 'Input',
      colProps: {span: 6},
 	},
	{
      label: "年份",
      field: 'year',
      component: 'JDictSelectTag',
      componentProps:{
          dictCode:"year_code"
      },
      colProps: {span: 6},
 	},
];
//表单数据
export const formSchema: FormSchema[] = [
  {
    label: '学校',
    field: 'school',
    component: 'Input',
  },
  {
    label: '编号',
    field: 'numberCode',
    component: 'Input',
  },
  {
    label: '名称',
    field: 'name',
    component: 'Input',
  },
  {
    label: '单位',
    field: 'unit',
    component: 'JDictSelectTag',
    componentProps:{
        dictCode:"unit_code"
     },
  },
  {
    label: '配置标准',
    field: 'equipmentStandard',
    component: 'Input',
  },
  {
    label: '年份',
    field: 'year',
    component: 'JDictSelectTag',
    componentProps:{
        dictCode:"year_code"
     },
  },
  {
    label: '年初数',
    field: 'yearStartNum',
    component: 'InputNumber',
  },
  {
    label: '增减数',
    field: 'yearDelta',
    component: 'InputNumber',
  },
  {
    label: '年末数',
    field: 'yearEndNum',
    component: 'InputNumber',
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