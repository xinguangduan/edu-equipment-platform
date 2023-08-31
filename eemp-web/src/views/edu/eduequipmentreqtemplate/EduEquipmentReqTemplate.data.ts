import { BasicColumn } from '/@/components/Table';
import { FormSchema } from '/@/components/Table';
import { rules } from '/@/utils/helper/validator';
import { render } from '/@/utils/common/renderUtils';
//列表数据
export const columns: BasicColumn[] = [
  {
    title: '文件日期',
    align: 'center',
    dataIndex: 'fileDate',
    customRender: ({ text }) => {
      return !text ? '' : text.length > 10 ? text.substr(0, 10) : text;
    },
  },
  {
    title: '文件名字',
    align: 'center',
    dataIndex: 'fileName',
    width: '300px',
  },
  {
    title: '文件大小',
    align: 'center',
    dataIndex: 'fileSize',
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
    ifShow: false,
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
    label: '文件日期',
    field: 'fileDate',
    component: 'DatePicker',
    colProps: { span: 6 },
  },
  {
    label: '文件名字',
    field: 'fileName',
    component: 'Input',
    colProps: { span: 6 },
  },
];
//表单数据
export const formSchema: FormSchema[] = [
  {
    label: '文件日期',
    field: 'fileDate',
    component: 'DatePicker',
  },
  {
    label: '文件名字',
    field: 'fileName',
    component: 'Input',
    dynamicRules: ({ model, schema }) => {
      return [{ required: true, message: '请输入文件名字!' }];
    },
  },
  {
    label: '文件大小',
    field: 'fileSize',
    component: 'InputNumber',
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
