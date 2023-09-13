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
    title: '乡镇',
    align:"center",
    dataIndex: 'township_dictText'
   },
   {
    title: '学校名称',
    align:"center",
    dataIndex: 'institutionName'
   },
   {
    title: '学校类型',
    align:"center",
    dataIndex: 'institutionType_dictText'
   },
   {
    title: '账号名称',
    align:"center",
    dataIndex: 'adminCode'
   },
   {
    title: '最近访问时间',
    align:"center",
    dataIndex: 'lastLoginTime'
   },
   {
    title: '管理员姓名',
    align:"center",
    dataIndex: 'adminName'
   },
   {
    title: '联系电话',
    align:"center",
    dataIndex: 'phoneNumber'
   },
   {
    title: '账户生成是否成功',
    align:"center",
    dataIndex: 'adminGenerationSuccess_dictText'
   },
];
//查询数据
export const searchFormSchema: FormSchema[] = [
	{
      label: "标识代码",
      field: 'identificationCode',
      component: 'Input',
      colProps: {span: 6},
 	},
	{
      label: "乡镇",
      field: 'township',
      component: 'JDictSelectTag',
      componentProps:{
        dictCode:"township_list"
      },
      colProps: {span: 6},
 	},
	{
      label: "学校名称",
      field: 'institutionName',
      component: 'Input',
      colProps: {span: 6},
 	},
	{
      label: "学校类型",
      field: 'institutionType',
      component: 'JDictSelectTag',
      componentProps:{
          dictCode:"institution_type"
      },
      colProps: {span: 6},
 	},
	{
      label: "账号名称",
      field: 'adminCode',
      component: 'Input',
      colProps: {span: 6},
 	},
  {
      label: "管理员姓名",
      field: 'adminName',
      component: 'Input',
      colProps: {span: 6},
  },
  {
      label: "联系电话",
      field: 'phoneNumber',
      component: 'Input',
      colProps: {span: 6},
  },
  {
      label: "账户生成是否成功",
      field: 'adminGenerationSuccess',
      component: 'JDictSelectTag',
      componentProps:{
          dictCode:"yn"
      },
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
  },
  {
    label: '乡镇',
    field: 'township',
    component: 'JDictSelectTag',
    componentProps:{
        dictCode:"township_list"
     },
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入乡镇!'},
          ];
     },
  },
  {
    label: '学校名称',
    field: 'institutionName',
    component: 'Input',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入学校名称!'},
          ];
     },
  },
  {
    label: '学校类型',
    field: 'institutionType',
    component: 'JDictSelectTag',
    componentProps:{
        dictCode:"institution_type"
     },
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入学校类型!'},
          ];
     },
  },
  {
    label: '账号名称',
    field: 'adminCode',
    component: 'Input',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入账号名称!'},
          ];
     },
  },
  {
    label: '管理员姓名',
    field: 'adminName',
    component: 'Input',
  },
  {
    label: '联系电话',
    field: 'phoneNumber',
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
