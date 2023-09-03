import {BasicColumn} from '/@/components/Table';
import {FormSchema} from '/@/components/Table';
import { rules} from '/@/utils/helper/validator';
import { render } from '/@/utils/common/renderUtils';
//列表数据
export const columns: BasicColumn[] = [
   {
    title: '学校名称',
    align:"center",
    dataIndex: 'identificationCode_dictText'
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
    title: '登记册文件',
    align:"center",
    dataIndex: 'bookFile',
    slots: { customRender: 'fileSlot' },
   },
];
//查询数据
export const searchFormSchema: FormSchema[] = [
	{
      label: "学校名称",
      field: 'identificationCode',
      component: 'JDictSelectTag',
      componentProps:{
          dictCode:"organization_definition,institution_name,identification_code"
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
    label: '学校名称',
    field: 'identificationCode',
    component: 'JDictSelectTag',
    componentProps:{
        dictCode:"organization_definition,institution_name,identification_code"
     },
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入学校名称!'},
          ];
     },
  },
  {
    label: '学科',
    field: 'subject',
    component: 'JSelectMultiple',
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
    label: '登记册文件',
    field: 'bookFile',
    component: 'JUpload',
    componentProps:{
     },
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入登记册文件!'},
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