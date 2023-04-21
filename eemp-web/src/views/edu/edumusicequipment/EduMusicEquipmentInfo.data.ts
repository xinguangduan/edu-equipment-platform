import { BasicColumn } from '/@/components/Table';
import { FormSchema } from '/@/components/Table';
import { rules } from '/@/utils/helper/validator';
import { render } from '/@/utils/common/renderUtils';
//列表数据
export const columns: BasicColumn[] = [
  {
    title: '学校',
    align: 'center',
    dataIndex: 'school',
  },
  {
    title: '分类代码',
    align: 'center',
    dataIndex: 'categoryCode_dictText',
  },
  {
    title: '名称',
    align: 'center',
    dataIndex: 'name_dictText',
  },
  {
    title: '规格型号功能',
    align: 'center',
    dataIndex: 'specModelFunc',
  },
  {
    title: '单位',
    align: 'center',
    dataIndex: 'unit_dictText',
  },
  {
    title: '数量',
    align: 'center',
    dataIndex: 'quantity',
  },
  {
    title: '配备要求',
    align: 'center',
    dataIndex: 'equipmentRequirement_dictText',
  },
  {
    title: '执行标准代号',
    align: 'center',
    dataIndex: 'executiveStandardCode_dictText',
  },
  {
    title: '年份',
    align: 'center',
    dataIndex: 'year_dictText',
  },
  {
    title: '年初数',
    align: 'center',
    dataIndex: 'yearStartNum',
  },
  {
    title: '增减数',
    align: 'center',
    dataIndex: 'yearDelta',
  },
  {
    title: '年底数',
    align: 'center',
    dataIndex: 'yearEndNum',
  },
  {
    title: '备注',
    align: 'center',
    dataIndex: 'remark',
  },
  {
    title: '所属部门',
    align: 'center',
    dataIndex: 'sysOrgCode',
  },
  {
    title: '创建人',
    align: 'center',
    dataIndex: 'createBy',
  },
  {
    title: '创建日期',
    align: 'center',
    dataIndex: 'createTime',
  },
  {
    title: '更新人',
    align: 'center',
    dataIndex: 'updateBy',
  },
  {
    title: '更新日期',
    align: 'center',
    dataIndex: 'updateTime',
  },
];
//查询数据
export const searchFormSchema: FormSchema[] = [
  {
    label: '分类代码',
    field: 'categoryCode',
    component: 'JDictSelectTag',
    componentProps: {
      dictCode: 'category_code',
    },
    colProps: { span: 6 },
  },
  {
    label: '名称',
    field: 'name',
    component: 'JDictSelectTag',
    componentProps: {
      dictCode: 'equipment_name_code',
    },
    colProps: { span: 6 },
  },
  {
    label: '配备要求',
    field: 'equipmentRequirement',
    component: 'JDictSelectTag',
    componentProps: {
      dictCode: 'equipment_requirement_code',
    },
    colProps: { span: 6 },
  },
  {
    label: '执行标准代号',
    field: 'executiveStandardCode',
    component: 'JDictSelectTag',
    componentProps: {
      dictCode: 'executive_standard_code',
    },
    colProps: { span: 6 },
  },
  {
    label: '年份',
    field: 'year',
    component: 'JDictSelectTag',
    componentProps: {
      dictCode: 'year_code',
    },
    colProps: { span: 6 },
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
  //   // dynamicRules: ({model,schema}) => {
  //   //       return [
  //   //              { required: true, message: '请输入学校!'},
  //   //       ];
  //   //  },
  // },
  {
    label: '学校',
    field: 'school',
    component: 'Input',
    dynamicRules: ({ model, schema }) => {
      return [{ required: true, message: '请输入学校!' }];
    },
  },
  {
    label: '分类代码',
    field: 'categoryCode',
    component: 'JDictSelectTag',
    componentProps: {
      dictCode: 'category_code',
    },
    dynamicRules: ({ model, schema }) => {
      return [{ required: true, message: '请输入分类代码!' }];
    },
  },
  {
    label: '名称',
    field: 'name',
    component: 'JDictSelectTag',
    componentProps: {
      dictCode: 'equipment_name_code',
    },
    dynamicRules: ({ model, schema }) => {
      return [{ required: true, message: '请输入名称!' }];
    },
  },
  {
    label: '规格型号功能',
    field: 'specModelFunc',
    component: 'Input',
  },
  {
    label: '单位',
    field: 'unit',
    component: 'JDictSelectTag',
    componentProps: {
      dictCode: 'unit_code',
    },
    dynamicRules: ({ model, schema }) => {
      return [{ required: true, message: '请输入单位!' }];
    },
  },
  {
    label: '数量',
    field: 'quantity',
    component: 'InputNumber',
    dynamicRules: ({ model, schema }) => {
      return [{ required: true, message: '请输入数量!' }];
    },
  },
  {
    label: '配备要求',
    field: 'equipmentRequirement',
    component: 'JDictSelectTag',
    componentProps: {
      dictCode: 'equipment_requirement_code',
    },
    dynamicRules: ({ model, schema }) => {
      return [{ required: true, message: '请输入配备要求!' }];
    },
  },
  {
    label: '执行标准代号',
    field: 'executiveStandardCode',
    component: 'JDictSelectTag',
    componentProps: {
      dictCode: 'executive_standard_code',
    },
    dynamicRules: ({ model, schema }) => {
      return [{ required: true, message: '请输入执行标准代号!' }];
    },
  },
  {
    label: '年份',
    field: 'year',
    component: 'JDictSelectTag',
    componentProps: {
      dictCode: 'year_code',
    },
    dynamicRules: ({ model, schema }) => {
      return [{ required: true, message: '请输入年份!' }];
    },
  },
  {
    label: '年初数',
    field: 'yearStartNum',
    component: 'InputNumber',
    dynamicRules: ({ model, schema }) => {
      return [{ required: true, message: '请输入年初数!' }];
    },
  },
  {
    label: '增减数',
    field: 'yearDelta',
    component: 'InputNumber',
    dynamicRules: ({ model, schema }) => {
      return [{ required: true, message: '请输入增减数!' }];
    },
  },
  {
    label: '年底数',
    field: 'yearEndNum',
    component: 'InputNumber',
    dynamicRules: ({ model, schema }) => {
      return [{ required: true, message: '请输入年底数!' }];
    },
  },
  {
    label: '备注',
    field: 'remark',
    component: 'InputTextArea',
  },
  // TODO 主键隐藏字段，目前写死为ID
  {
    label: '',
    field: 'id',
    component: 'Input',
    show: false,
  },
];

/**
 * 流程表单调用这个方法获取formSchema
 * @param param
 */
export function getBpmFormSchema(_formData): FormSchema[] {
  // 默认和原始表单保持一致 如果流程中配置了权限数据，这里需要单独处理formSchema
  return formSchema;
}
