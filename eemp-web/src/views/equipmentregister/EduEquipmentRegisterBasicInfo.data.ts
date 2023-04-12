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
    title: '校长',
    align:"center",
    dataIndex: 'principal'
   },
   {
    title: '分管校长',
    align:"center",
    dataIndex: 'vicePrincipal'
   },
   {
    title: '实验员',
    align:"center",
    dataIndex: 'experimenter'
   },
   {
    title: '网络管理员',
    align:"center",
    dataIndex: 'networkManager'
   },
   {
    title: '图书管理员',
    align:"center",
    dataIndex: 'librarian'
   },
   {
    title: '体音美管理员',
    align:"center",
    dataIndex: 'minorManager'
   },
];
//查询数据
export const searchFormSchema: FormSchema[] = [
	{
      label: "学校",
      field: 'school',
      component: 'Input',
      colProps: {span: 6},
 	},
	{
      label: "校长",
      field: 'principal',
      component: 'Input',
      colProps: {span: 6},
 	},
	{
      label: "分管校长",
      field: 'vicePrincipal',
      component: 'Input',
      colProps: {span: 6},
 	},
	{
      label: "实验员",
      field: 'experimenter',
      component: 'Input',
      colProps: {span: 6},
 	},
	{
      label: "网络管理员",
      field: 'networkManager',
      component: 'Input',
      colProps: {span: 6},
 	},
	{
      label: "图书管理员",
      field: 'librarian',
      component: 'Input',
      colProps: {span: 6},
 	},
	{
      label: "体音美管理员",
      field: 'minorManager',
      component: 'Input',
      colProps: {span: 6},
 	},
];
//表单数据
export const formSchema: FormSchema[] = [
  {
    label: '学校',
    field: 'school',
    component: 'Input',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入学校!'},
          ];
     },
  },
  {
    label: '校长',
    field: 'principal',
    component: 'Input',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入校长!'},
          ];
     },
  },
  {
    label: '分管校长',
    field: 'vicePrincipal',
    component: 'Input',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入分管校长!'},
          ];
     },
  },
  {
    label: '实验员',
    field: 'experimenter',
    component: 'Input',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入实验员!'},
          ];
     },
  },
  {
    label: '网络管理员',
    field: 'networkManager',
    component: 'Input',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入网络管理员!'},
          ];
     },
  },
  {
    label: '图书管理员',
    field: 'librarian',
    component: 'Input',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入图书管理员!'},
          ];
     },
  },
  {
    label: '体音美管理员',
    field: 'minorManager',
    component: 'Input',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入体音美管理员!'},
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