import {BasicColumn} from '/@/components/Table';
import {FormSchema} from '/@/components/Table';
import { rules} from '/@/utils/helper/validator';
import { render } from '/@/utils/common/renderUtils';
import {JVxeTypes,JVxeColumn} from '/@/components/jeecg/JVxeTable/types'
//列表数据
export const columns: BasicColumn[] = [
   {
    title: '标识代码',
    align:"center",
    dataIndex: 'identificationCode'
   },
   {
    title: '机构名称',
    align:"center",
    dataIndex: 'institutionName'
   },
   {
    title: '上级标识代码',
    align:"center",
    dataIndex: 'superiorIdentificationCode'
   },
   {
    title: '联系人邮箱',
    align:"center",
    dataIndex: 'contactMailAddress'
   },
];
//查询数据
export const searchFormSchema: FormSchema[] = [
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
  },
  {
    label: '机构名称',
    field: 'institutionName',
    component: 'Input',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入机构名称!'},
          ];
     },
  },
  {
    label: '上级标识代码',
    field: 'superiorIdentificationCode',
    component: 'Input',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入上级标识代码!'},
          ];
     },
  },
  {
    label: '联系人邮箱',
    field: 'contactMailAddress',
    component: 'Input',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入联系人邮箱!'},
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
//子表单数据
export const schoolBasicInfoFormSchema: FormSchema[] = [
  {
    label: '机构标识代码',
    field: 'identificationCode',
    component: 'Input',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入机构标识代码!'},
          ];
     },
  },
  {
    label: '学校名称',
    field: 'schoolName',
    component: 'Input',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入学校名称!'},
          ];
     },
  },
  {
    label: '教育阶段',
    field: 'educationalPhase',
    component: 'Input',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入教育阶段!'},
          ];
     },
  },
  {
    label: '办学类型',
    field: 'schoolType',
    component: 'Input',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入办学类型!'},
          ];
     },
  },
  {
    label: '地址',
    field: 'address',
    component: 'Input',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入地址!'},
          ];
     },
  },
  {
    label: '联系人名称',
    field: 'contactPersonName',
    component: 'Input',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入联系人名称!'},
          ];
     },
  },
  {
    label: '联系电话',
    field: 'contactPhoneNumber',
    component: 'Input',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入联系电话!'},
          ];
     },
  },
  {
    label: '小学生人数',
    field: 'numberOfPupils',
    component: 'InputNumber',
  },
  {
    label: '初中生人数',
    field: 'numberOfJuniors',
    component: 'InputNumber',
  },
  {
    label: '高中生人数',
    field: 'numberOfSeniors',
    component: 'InputNumber',
  },
	{
	  label: '',
	  field: 'id',
	  component: 'Input',
	  show: false
	},
];
//子表表格配置


/**
* 流程表单调用这个方法获取formSchema
* @param param
*/
export function getBpmFormSchema(_formData): FormSchema[]{
// 默认和原始表单保持一致 如果流程中配置了权限数据，这里需要单独处理formSchema
  return formSchema;
}