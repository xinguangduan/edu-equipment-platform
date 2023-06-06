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
    title: '机构名称',
    align:"center",
    dataIndex: 'institutionName'
   },
   {
    title: '机构类型',
    align:"center",
    dataIndex: 'institutionType_dictText'
   },
   {
    title: '账户名称',
    align:"center",
    dataIndex: 'adminCode'
   },
   {
    title: '角色编码',
    align:"center",
    dataIndex: 'roleCode'
   },
   {
    title: '初始密码',
    align:"center",
    dataIndex: 'initialPassword'
   },
   {
    title: '账户生成是否成功',
    align:"center",
    dataIndex: 'adminGenerationSuccess_dictText'
   },
   {
    title: '失败原因',
    align:"center",
    dataIndex: 'failureReason'
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
      label: "机构名称",
      field: 'institutionName',
      component: 'Input',
      colProps: {span: 6},
 	},
	{
      label: "机构类型",
      field: 'institutionType',
      component: 'JDictSelectTag',
      componentProps:{
          dictCode:"institution_type"
      },
      colProps: {span: 6},
 	},
	{
      label: "账户名称",
      field: 'adminCode',
      component: 'Input',
      colProps: {span: 6},
 	},
	{
      label: "角色编码",
      field: 'roleCode',
      component: 'Input',
      colProps: {span: 6},
 	},
     {
      label: "账户生成是否成功",
      field: "adminGenerationSuccess",
      component: 'Input', //TODO 范围查询
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
    label: '机构类型',
    field: 'institutionType',
    component: 'JDictSelectTag',
    componentProps:{
        dictCode:"institution_type"
     },
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入机构类型!'},
          ];
     },
  },
  {
    label: '账户名称',
    field: 'adminCode',
    component: 'Input',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入账户名称!'},
          ];
     },
  },
  {
    label: '角色编码',
    field: 'roleCode',
    component: 'Input',
  },
  {
    label: '初始密码',
    field: 'initialPassword',
    component: 'Input',
  },
  {
    label: '账户生成是否成功',
    field: 'adminGenerationSuccess',
    component: 'JDictSelectTag',
    componentProps:{
        dictCode:"yn"
     },
  },
  {
    label: '失败原因',
    field: 'failureReason',
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