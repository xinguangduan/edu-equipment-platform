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
    title: '课程',
    align:"center",
    dataIndex: 'course_dictText'
   },
   {
    title: '实验室-面积',
    align:"center",
    dataIndex: 'labArea'
   },
   {
    title: '实验室-间数',
    align:"center",
    dataIndex: 'labRoomNum'
   },
   {
    title: '准备室-面积',
    align:"center",
    dataIndex: 'preparationRoomArea'
   },
   {
    title: '准备室-间数',
    align:"center",
    dataIndex: 'preparationRoomNum'
   },
   {
    title: '仪器保管室-面积',
    align:"center",
    dataIndex: 'instrumentStorageRoomArea'
   },
   {
    title: '仪器保管室-间数',
    align:"center",
    dataIndex: 'instrumentStorageRoomNum'
   },
   {
    title: '实验员-人数',
    align:"center",
    dataIndex: 'experimenterCount'
   },
   {
    title: '实验员-专职',
    align:"center",
    dataIndex: 'experimenterFulltime'
   },
   {
    title: '实验员-兼职',
    align:"center",
    dataIndex: 'experimenterParttime'
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
];
//查询数据
export const searchFormSchema: FormSchema[] = [
	{
      label: "学校",
      field: 'school',
    component: 'JPopup',
    componentProps: ({ formActionType }) => {
        const {setFieldsValue} = formActionType;
        return{
            setFieldsValue:setFieldsValue,
            code:"school_list",
            fieldConfig: [
                { source: 'school', target: 'school' },
            ],
            multi:false
        }
    },

      colProps: {span: 6},
 	},
	{
      label: "课程",
      field: 'course',
      component: 'JDictSelectTag',
      componentProps:{
          dictCode:"course_code"
      },
      colProps: {span: 6},
 	},
];
//表单数据
export const formSchema: FormSchema[] = [
  // {
  //   label: '学校',
  //   field: 'school',
  //   component: 'JPopup',
  //   componentProps: ({ formActionType }) => {
  //       const {setFieldsValue} = formActionType;
  //       return{
  //           setFieldsValue:setFieldsValue,
  //           code:"school_list",
  //           fieldConfig: [
  //               { source: 'school', target: 'school' },
  //           ],
  //           multi:false
  //       }
  //   },

  // },
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
    label: '课程',
    field: 'course',
    component: 'JDictSelectTag',
    componentProps:{
        dictCode:"course_code"
     },
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入课程!'},
          ];
     },
  },
  {
    label: '实验室-面积',
    field: 'labArea',
    component: 'InputNumber',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入实验室-面积!'},
          ];
     },
  },
  {
    label: '实验室-间数',
    field: 'labRoomNum',
    component: 'InputNumber',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入实验室-间数!'},
          ];
     },
  },
  {
    label: '准备室-面积',
    field: 'preparationRoomArea',
    component: 'InputNumber',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入准备室-面积!'},
          ];
     },
  },
  {
    label: '准备室-间数',
    field: 'preparationRoomNum',
    component: 'InputNumber',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入准备室-间数!'},
          ];
     },
  },
  {
    label: '仪器保管室-面积',
    field: 'instrumentStorageRoomArea',
    component: 'InputNumber',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入仪器保管室-面积!'},
          ];
     },
  },
  {
    label: '仪器保管室-间数',
    field: 'instrumentStorageRoomNum',
    component: 'InputNumber',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入仪器保管室-间数!'},
          ];
     },
  },
  {
    label: '实验员-人数',
    field: 'experimenterCount',
    component: 'InputNumber',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入实验员-人数!'},
          ];
     },
  },
  {
    label: '实验员-专职',
    field: 'experimenterFulltime',
    component: 'InputNumber',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入实验员-专职!'},
          ];
     },
  },
  {
    label: '实验员-兼职',
    field: 'experimenterParttime',
    component: 'InputNumber',
    dynamicRules: ({model,schema}) => {
          return [
                 { required: true, message: '请输入实验员-兼职!'},
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
