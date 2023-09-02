import {BasicColumn} from '/@/components/Table';
import {FormSchema} from '/@/components/Table';
import { rules} from '/@/utils/helper/validator';
import { render } from '/@/utils/common/renderUtils';
//列表数据
export const columns: BasicColumn[] = [
   {
    title: '学校类型',
    align:"center",
    dataIndex: 'schoolType_dictText'
   },
   {
    title: '学科',
    align:"center",
    dataIndex: 'subject_dictText'
   },
   {
    title: '生效日期',
    align:"center",
    dataIndex: 'effictiveDate',
    customRender:({text}) =>{
      return !text?"":(text.length>10?text.substr(0,10):text)
    },
   },
   {
    title: '模板文件',
    align:"center",
    dataIndex: 'templateFile',
    slots: { customRender: 'fileSlot' },
   },
   {
    title: '文件大小',
    align:"center",
    dataIndex: 'fileSize'
   },
];
//查询数据
export const searchFormSchema: FormSchema[] = [
	{
    label: "学校类型",
    field: 'schoolType',
    component: 'JDictSelectTag',
    componentProps:{
        dictCode:"school_type_for_template"
    },
    colProps: {span: 6},
  },
  {
    label: "学科",
    field: 'subject',
    component: 'JDictSelectTag',
    componentProps:{
        dictCode:"subject_for_template"
    },
    colProps: {span: 6},
  },
  {
    label: "生效日期",
    field: 'effictiveDate',
    component: 'DatePicker',
    colProps: {span: 6},
  },
];
//表单数据
export const formSchema: FormSchema[] = [
  {
    label: '学校类型',
    field: 'schoolType',
    component: 'JDictSelectTag',
    componentProps:{
        dictCode:"school_type_for_template"
     },
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入学校类型!'},
          ];
     },
  },
  {
    label: '学科',
    field: 'subject',
    component: 'JDictSelectTag',
    componentProps:{
        dictCode:"subject_for_template"
     },
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入学科!'},
          ];
     },
  },
  {
    label: '生效日期',
    field: 'effictiveDate',
    component: 'DatePicker',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入生效日期!'},
          ];
     },
  },
  {
    label: '模板文件',
    field: 'templateFile',
    component: 'JUpload',
    componentProps:{
     },
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入模板文件!'},
          ];
     },
  },
  {
    label: '文件大小',
    field: 'fileSize',
    component: 'InputNumber',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入文件大小!'},
          ];
     },
    // dynamicDisabled:true
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