import {BasicColumn} from '/@/components/Table';
import {FormSchema} from '/@/components/Table';
import { rules} from '/@/utils/helper/validator';
import { render } from '/@/utils/common/renderUtils';
//列表数据
export const columns: BasicColumn[] = [
   {
    title: '学校标识代码',
    align:"center",
    dataIndex: 'identificationCode'
   },
   {
    title: '教室名称',
    align:"center",
    dataIndex: 'classroomName'
   },
   {
    title: '设备数量',
    align:"center",
    dataIndex: 'deviceNumber'
   },
];
//查询数据
export const searchFormSchema: FormSchema[] = [
];
//表单数据
export const formSchema: FormSchema[] = [
  {
    label: '学校标识代码',
    field: 'identificationCode',
    component: 'Input',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入学校标识代码!'},
          ];
     },
  },
  {
    label: '教室名称',
    field: 'classroomName',
    component: 'Input',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入教室名称!'},
          ];
     },
  },
  {
    label: '设备数量',
    field: 'deviceNumber',
    component: 'InputNumber',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入设备数量!'},
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