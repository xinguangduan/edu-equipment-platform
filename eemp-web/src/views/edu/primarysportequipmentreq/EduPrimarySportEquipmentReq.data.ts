import {BasicColumn} from '/@/components/Table';
import {FormSchema} from '/@/components/Table';
import { rules} from '/@/utils/helper/validator';
import { render } from '/@/utils/common/renderUtils';
//列表数据
export const columns: BasicColumn[] = [
   {
    title: '标识代码',
    align:"center",
    dataIndex: 'identificationCode'
   },
   {
    title: '时段代码',
    align:"center",
    dataIndex: 'phaseCode'
   },
   {
    title: '分类代码',
    align:"center",
    dataIndex: 'categoryCode'
   },
   {
    title: '名称',
    align:"center",
    dataIndex: 'name'
   },
   {
    title: '规格型号功能',
    align:"center",
    dataIndex: 'specModelFunc'
   },
   {
    title: '单位',
    align:"center",
    dataIndex: 'unit'
   },
   {
    title: '数量',
    align:"center",
    dataIndex: 'quantity'
   },
   {
    title: '配备要求',
    align:"center",
    dataIndex: 'equipmentRequirement'
   },
   {
    title: '执行标准代号',
    align:"center",
    dataIndex: 'executiveStandardCode'
   },
   {
    title: '备注',
    align:"center",
    dataIndex: 'remark'
   },
   {
    title: '所属部门',
    align:"center",
    dataIndex: 'sysOrgCode'
   },
   {
    title: '创建人',
    align:"center",
    dataIndex: 'createBy'
   },
   {
    title: '创建日期',
    align:"center",
    dataIndex: 'createTime'
   },
   {
    title: '更新人',
    align:"center",
    dataIndex: 'updateBy'
   },
   {
    title: '更新日期',
    align:"center",
    dataIndex: 'updateTime'
   },
   {
    title: '实际数量',
    align:"center",
    dataIndex: 'actualNum'
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
      label: "名称",
      field: 'name',
      component: 'Input',
      colProps: {span: 6},
 	},
];
//表单数据
export const formSchema: FormSchema[] = [
  {
    label: '标识代码',
    field: 'identificationCode',
    component: 'Input',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入标识代码!'},
          ];
     },
    dynamicDisabled:true
  },
  {
    label: '时段代码',
    field: 'phaseCode',
    component: 'Input',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入时段代码!'},
          ];
     },
    dynamicDisabled:true
  },
  {
    label: '分类代码',
    field: 'categoryCode',
    component: 'Input',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入分类代码!'},
          ];
     },
    dynamicDisabled:true
  },
  {
    label: '名称',
    field: 'name',
    component: 'Input',
    dynamicDisabled:true
  },
  {
    label: '规格型号功能',
    field: 'specModelFunc',
    component: 'Input',
    dynamicDisabled:true
  },
  {
    label: '单位',
    field: 'unit',
    component: 'Input',
    dynamicDisabled:true
  },
  {
    label: '数量',
    field: 'quantity',
    component: 'Input',
    dynamicDisabled:true
  },
  {
    label: '配备要求',
    field: 'equipmentRequirement',
    component: 'Input',
    dynamicDisabled:true
  },
  {
    label: '执行标准代号',
    field: 'executiveStandardCode',
    component: 'Input',
    dynamicDisabled:true
  },
  {
    label: '备注',
    field: 'remark',
    component: 'InputTextArea',
    dynamicDisabled:true
  },
  {
    label: '实际数量',
    field: 'actualNum',
    component: 'InputNumber',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入实际数量!'},
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