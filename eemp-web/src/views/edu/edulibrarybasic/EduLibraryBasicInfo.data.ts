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
    title: '藏书室面积',
    align: 'center',
    dataIndex: 'libraryArea',
  },
  {
    title: '藏书室藏书架(个)',
    align: 'center',
    dataIndex: 'libraryRack',
  },
  {
    title: '学生阅览室面积',
    align: 'center',
    dataIndex: 'readingRoomNum',
  },
  {
    title: '学生阅览室阅览桌',
    align: 'center',
    dataIndex: 'readingTableNum',
  },
  {
    title: '学生阅览室阅览凳',
    align: 'center',
    dataIndex: 'readingStoolNum',
  },
  {
    title: '教师阅览室面积',
    align: 'center',
    dataIndex: 'teacherReadingRoomArea',
  },
  {
    title: '藏书册数',
    align: 'center',
    dataIndex: 'books',
  },
  {
    title: '生均册数',
    align: 'center',
    dataIndex: 'avgBooks',
  },
  {
    title: '投入金额(万元)',
    align: 'center',
    dataIndex: 'investmentAmount',
  },
  {
    title: '管理人员人数',
    align: 'center',
    dataIndex: 'managerNum',
  },
  {
    title: '管理人员专职',
    align: 'center',
    dataIndex: 'managerFulltimeNum',
  },
  {
    title: '管理人员兼职',
    align: 'center',
    dataIndex: 'managerParttimeNum',
  },
];
//查询数据
export const searchFormSchema: FormSchema[] = [
  {
    label: '学校',
    field: 'school',
    component: 'Input',
    colProps: { span: 6 },
  },
];
//表单数据
export const formSchema: FormSchema[] = [
  {
    label: '学校',
    field: 'school',
    component: 'Input',
  },
  {
    label: '藏书室面积',
    field: 'libraryArea',
    component: 'InputNumber',
    dynamicRules: ({ model, schema }) => {
      return [{ required: true, message: '请输入藏书室面积!' }];
    },
  },
  {
    label: '藏书室藏书架(个)',
    field: 'libraryRack',
    component: 'InputNumber',
    dynamicRules: ({ model, schema }) => {
      return [{ required: true, message: '请输入藏书室藏书架(个)!' }];
    },
  },
  {
    label: '学生阅览室面积',
    field: 'readingRoomNum',
    component: 'InputNumber',
    dynamicRules: ({ model, schema }) => {
      return [{ required: true, message: '请输入学生阅览室面积!' }];
    },
  },
  {
    label: '学生阅览室阅览桌',
    field: 'readingTableNum',
    component: 'InputNumber',
    dynamicRules: ({ model, schema }) => {
      return [{ required: true, message: '请输入学生阅览室阅览桌!' }];
    },
  },
  {
    label: '学生阅览室阅览凳',
    field: 'readingStoolNum',
    component: 'InputNumber',
    dynamicRules: ({ model, schema }) => {
      return [{ required: true, message: '请输入学生阅览室阅览凳!' }];
    },
  },
  {
    label: '教师阅览室面积',
    field: 'teacherReadingRoomArea',
    component: 'InputNumber',
    dynamicRules: ({ model, schema }) => {
      return [{ required: true, message: '请输入教师阅览室面积!' }];
    },
  },
  {
    label: '藏书册数',
    field: 'books',
    component: 'InputNumber',
    dynamicRules: ({ model, schema }) => {
      return [{ required: true, message: '请输入藏书册数!' }];
    },
  },
  {
    label: '生均册数',
    field: 'avgBooks',
    component: 'InputNumber',
    dynamicRules: ({ model, schema }) => {
      return [{ required: true, message: '请输入生均册数!' }];
    },
  },
  {
    label: '投入金额(万元)',
    field: 'investmentAmount',
    component: 'InputNumber',
    dynamicRules: ({ model, schema }) => {
      return [{ required: true, message: '请输入投入金额(万元)!' }];
    },
  },
  {
    label: '管理人员人数',
    field: 'managerNum',
    component: 'InputNumber',
    dynamicRules: ({ model, schema }) => {
      return [{ required: true, message: '请输入管理人员人数!' }];
    },
  },
  {
    label: '管理人员专职',
    field: 'managerFulltimeNum',
    component: 'InputNumber',
    dynamicRules: ({ model, schema }) => {
      return [{ required: true, message: '请输入管理人员专职!' }];
    },
  },
  {
    label: '管理人员兼职',
    field: 'managerParttimeNum',
    component: 'InputNumber',
    dynamicRules: ({ model, schema }) => {
      return [{ required: true, message: '请输入管理人员兼职!' }];
    },
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
