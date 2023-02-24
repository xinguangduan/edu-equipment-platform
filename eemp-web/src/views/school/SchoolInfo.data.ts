import {BasicColumn} from '/@/components/Table';
import {FormSchema} from '/@/components/Table';
import { rules} from '/@/utils/helper/validator';
import { render } from '/@/utils/common/renderUtils';
//列表数据
export const columns: BasicColumn[] = [
   {
    title: '学校名称',
    align:"center",
    dataIndex: 'name'
   },
   {
    title: '学校地址',
    align:"center",
    dataIndex: 'address'
   },
   {
    title: '学生人数',
    align:"center",
    dataIndex: 'studentCount'
   },
   {
    title: '教师人数',
    align:"center",
    dataIndex: 'teacherCount'
   },
   {
    title: '图书馆数',
    align:"center",
    dataIndex: 'libraryCount'
   },
   {
    title: '食堂数',
    align:"center",
    dataIndex: 'canteenCount'
   },
];
//查询数据
export const searchFormSchema: FormSchema[] = [
];
//表单数据
export const formSchema: FormSchema[] = [
  {
    label: '学校名称',
    field: 'name',
    component: 'Input',
  },
  {
    label: '学校地址',
    field: 'address',
    component: 'Input',
  },
  {
    label: '学生人数',
    field: 'studentCount',
    component: 'InputNumber',
  },
  {
    label: '教师人数',
    field: 'teacherCount',
    component: 'InputNumber',
  },
  {
    label: '图书馆数',
    field: 'libraryCount',
    component: 'InputNumber',
  },
  {
    label: '食堂数',
    field: 'canteenCount',
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