import {BasicColumn} from '/@/components/Table';
import {FormSchema} from '/@/components/Table';
import { rules} from '/@/utils/helper/validator';
import { render } from '/@/utils/common/renderUtils';
//列表数据
export const columns: BasicColumn[] = [
   {
    title: '机构标识代码',
    align:"center",
    dataIndex: 'identificationCode'
   },
   {
    title: '学校名称',
    align:"center",
    dataIndex: 'schoolName'
   },
   {
    title: '教育阶段',
    align:"center",
    dataIndex: 'educationalPhase'
   },
   {
    title: '办学类型',
    align:"center",
    dataIndex: 'schoolType'
   },
   {
    title: '地址',
    align:"center",
    dataIndex: 'address'
   },
   {
    title: '联系人名称',
    align:"center",
    dataIndex: 'contactPersonName'
   },
   {
    title: '联系电话',
    align:"center",
    dataIndex: 'contactPhoneNumber'
   },
   {
    title: '小学生人数',
    align:"center",
    dataIndex: 'numberOfPupils'
   },
   {
    title: '初中生人数',
    align:"center",
    dataIndex: 'numberOfJuniors'
   },
   {
    title: '高中生人数',
    align:"center",
    dataIndex: 'numberOfSeniors'
   },
];
//查询数据
export const searchFormSchema: FormSchema[] = [
];
//表单数据
export const formSchema: FormSchema[] = [
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