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
    title: '室内操场间数',
    align: 'center',
    dataIndex: 'sportsIndoorPlaygroundNum',
  },
  {
    title: '室内操场面积',
    align: 'center',
    dataIndex: 'sportsIndoorPlaygroundArea',
  },
  {
    title: '体育器材室间数',
    align: 'center',
    dataIndex: 'sportsEquipmentRoomNum',
  },
  {
    title: '体育器材室面积',
    align: 'center',
    dataIndex: 'sportsEquipmentRoomArea',
  },
  {
    title: '体质测试室间数',
    align: 'center',
    dataIndex: 'sportsTestingRoomNum',
  },
  {
    title: '体质测试室面积',
    align: 'center',
    dataIndex: 'sportsTestingRoomArea',
  },
  {
    title: '心理咨询室间数',
    align: 'center',
    dataIndex: 'sportsCounselingRoomNum',
  },
  {
    title: '心理咨询室面积',
    align: 'center',
    dataIndex: 'sportsCounselingRoomArea',
  },
  {
    title: '音乐教室间数',
    align: 'center',
    dataIndex: 'musicClassroomNum',
  },
  {
    title: '音乐教室面积',
    align: 'center',
    dataIndex: 'musicClassroomArea',
  },
  {
    title: '音乐器材室间数',
    align: 'center',
    dataIndex: 'musicEquipmentRoomNum',
  },
  {
    title: '音乐器材室面积',
    align: 'center',
    dataIndex: 'musicEquipmentRoomArea',
  },
  {
    title: '舞蹈室间数',
    align: 'center',
    dataIndex: 'musicDanceRoomNum',
  },
  {
    title: '舞蹈室面积',
    align: 'center',
    dataIndex: 'musicDanceRoomArea',
  },
  {
    title: '音乐排练室间数',
    align: 'center',
    dataIndex: 'musicRehearsalRoomNum',
  },
  {
    title: '音乐排练室面积',
    align: 'center',
    dataIndex: 'musicRehearsalRoomArea',
  },
  {
    title: '美术教室间数',
    align: 'center',
    dataIndex: 'artEquipmentNum',
  },
  {
    title: '美术教室面积',
    align: 'center',
    dataIndex: 'artEquipmentArea',
  },
  {
    title: '美术器材室间数',
    align: 'center',
    dataIndex: 'artClassroomNum',
  },
  {
    title: '美术器材室面积',
    align: 'center',
    dataIndex: 'artClassroomArea',
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
    dynamicRules: ({ model, schema }) => {
      return [{ required: true, message: '请输入学校!' }];
    },
  },
  {
    label: '室内操场间数',
    field: 'sportsIndoorPlaygroundNum',
    component: 'InputNumber',
    dynamicRules: ({ model, schema }) => {
      return [{ required: true, message: '请输入室内操场间数!' }];
    },
  },
  {
    label: '室内操场面积',
    field: 'sportsIndoorPlaygroundArea',
    component: 'InputNumber',
    dynamicRules: ({ model, schema }) => {
      return [{ required: true, message: '请输入室内操场面积!' }];
    },
  },
  {
    label: '体育器材室间数',
    field: 'sportsEquipmentRoomNum',
    component: 'InputNumber',
    dynamicRules: ({ model, schema }) => {
      return [{ required: true, message: '请输入体育器材室间数!' }];
    },
  },
  {
    label: '体育器材室面积',
    field: 'sportsEquipmentRoomArea',
    component: 'InputNumber',
    dynamicRules: ({ model, schema }) => {
      return [{ required: true, message: '请输入体育器材室面积!' }];
    },
  },
  {
    label: '体质测试室间数',
    field: 'sportsTestingRoomNum',
    component: 'InputNumber',
    dynamicRules: ({ model, schema }) => {
      return [{ required: true, message: '请输入体质测试室间数!' }];
    },
  },
  {
    label: '体质测试室面积',
    field: 'sportsTestingRoomArea',
    component: 'InputNumber',
    dynamicRules: ({ model, schema }) => {
      return [{ required: true, message: '请输入体质测试室面积!' }];
    },
  },
  {
    label: '心理咨询室间数',
    field: 'sportsCounselingRoomNum',
    component: 'InputNumber',
    dynamicRules: ({ model, schema }) => {
      return [{ required: true, message: '请输入心理咨询室间数!' }];
    },
  },
  {
    label: '心理咨询室面积',
    field: 'sportsCounselingRoomArea',
    component: 'InputNumber',
    dynamicRules: ({ model, schema }) => {
      return [{ required: true, message: '请输入心理咨询室面积!' }];
    },
  },
  {
    label: '音乐教室间数',
    field: 'musicClassroomNum',
    component: 'InputNumber',
    dynamicRules: ({ model, schema }) => {
      return [{ required: true, message: '请输入音乐教室间数!' }];
    },
  },
  {
    label: '音乐教室面积',
    field: 'musicClassroomArea',
    component: 'InputNumber',
    dynamicRules: ({ model, schema }) => {
      return [{ required: true, message: '请输入音乐教室面积!' }];
    },
  },
  {
    label: '音乐器材室间数',
    field: 'musicEquipmentRoomNum',
    component: 'InputNumber',
    dynamicRules: ({ model, schema }) => {
      return [{ required: true, message: '请输入音乐器材室间数!' }];
    },
  },
  {
    label: '音乐器材室面积',
    field: 'musicEquipmentRoomArea',
    component: 'InputNumber',
    dynamicRules: ({ model, schema }) => {
      return [{ required: true, message: '请输入音乐器材室面积!' }];
    },
  },
  {
    label: '舞蹈室间数',
    field: 'musicDanceRoomNum',
    component: 'InputNumber',
    dynamicRules: ({ model, schema }) => {
      return [{ required: true, message: '请输入舞蹈室间数!' }];
    },
  },
  {
    label: '舞蹈室面积',
    field: 'musicDanceRoomArea',
    component: 'InputNumber',
    dynamicRules: ({ model, schema }) => {
      return [{ required: true, message: '请输入舞蹈室面积!' }];
    },
  },
  {
    label: '音乐排练室间数',
    field: 'musicRehearsalRoomNum',
    component: 'InputNumber',
    dynamicRules: ({ model, schema }) => {
      return [{ required: true, message: '请输入音乐排练室间数!' }];
    },
  },
  {
    label: '音乐排练室面积',
    field: 'musicRehearsalRoomArea',
    component: 'InputNumber',
    dynamicRules: ({ model, schema }) => {
      return [{ required: true, message: '请输入音乐排练室面积!' }];
    },
  },
  {
    label: '美术教室间数',
    field: 'artEquipmentNum',
    component: 'InputNumber',
    dynamicRules: ({ model, schema }) => {
      return [{ required: true, message: '请输入美术教室间数!' }];
    },
  },
  {
    label: '美术教室面积',
    field: 'artEquipmentArea',
    component: 'InputNumber',
    dynamicRules: ({ model, schema }) => {
      return [{ required: true, message: '请输入美术教室面积!' }];
    },
  },
  {
    label: '美术器材室间数',
    field: 'artClassroomNum',
    component: 'InputNumber',
    dynamicRules: ({ model, schema }) => {
      return [{ required: true, message: '请输入美术器材室间数!' }];
    },
  },
  {
    label: '美术器材室面积',
    field: 'artClassroomArea',
    component: 'InputNumber',
    dynamicRules: ({ model, schema }) => {
      return [{ required: true, message: '请输入美术器材室面积!' }];
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
