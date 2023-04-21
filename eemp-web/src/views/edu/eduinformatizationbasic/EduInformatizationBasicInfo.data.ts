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
    title: '班级数',
    align: 'center',
    dataIndex: 'classesCount',
  },
  {
    title: '学生数',
    align: 'center',
    dataIndex: 'studentCount',
  },
  {
    title: '教师数',
    align: 'center',
    dataIndex: 'teacherCount',
  },
  {
    title: '教师用机',
    align: 'center',
    dataIndex: 'computerTechearNum',
  },
  {
    title: '学生用机',
    align: 'center',
    dataIndex: 'computerStudentNum',
  },
  {
    title: '班班通投影',
    align: 'center',
    dataIndex: 'projectionModeNum',
  },
  {
    title: '班班通触控机',
    align: 'center',
    dataIndex: 'touchModeNum',
  },
  {
    title: '班班通电视电脑',
    align: 'center',
    dataIndex: 'tvComputerModeNum',
  },
  {
    title: '网关',
    align: 'center',
    dataIndex: 'gatewayNum',
  },
  {
    title: '千兆路由器',
    align: 'center',
    dataIndex: 'router1000Num',
  },
  {
    title: '百兆路由',
    align: 'center',
    dataIndex: 'router100Num',
  },
  {
    title: '服务器',
    align: 'center',
    dataIndex: 'serverNum',
  },
  {
    title: '网路计入点',
    align: 'center',
    dataIndex: 'networkPortNum',
  },
  {
    title: '无线路由器',
    align: 'center',
    dataIndex: 'wifiRouterNum',
  },
  {
    title: '无线AP',
    align: 'center',
    dataIndex: 'wifiApNum',
  },
  {
    title: '其他设备',
    align: 'center',
    dataIndex: 'otherDeviceNum',
  },
  {
    title: '千兆交换机',
    align: 'center',
    dataIndex: 'switch1000Num',
  },
  {
    title: '无线管理设备',
    align: 'center',
    dataIndex: 'wifiManagerNum',
  },
  {
    title: '录播室(间)',
    align: 'center',
    dataIndex: 'recordingRoomNum',
  },
  {
    title: '多功能会议室容纳人数',
    align: 'center',
    dataIndex: 'meetingRoomNum',
  },
  {
    title: '多功能会议室面积',
    align: 'center',
    dataIndex: 'meetingRoomArea',
  },
  {
    title: '备注',
    align: 'center',
    dataIndex: 'remark',
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
    label: '班级数',
    field: 'classesCount',
    component: 'InputNumber',
    dynamicRules: ({ model, schema }) => {
      return [
        { required: true, message: '请输入班级数!' },
        { pattern: /^-?\d+$/, message: '请输入整数!' },
      ];
    },
  },
  {
    label: '学生数',
    field: 'studentCount',
    component: 'InputNumber',
    dynamicRules: ({ model, schema }) => {
      return [
        { required: true, message: '请输入学生数!' },
        { pattern: /^-?\d+$/, message: '请输入整数!' },
      ];
    },
  },
  {
    label: '教师数',
    field: 'teacherCount',
    component: 'InputNumber',
    dynamicRules: ({ model, schema }) => {
      return [
        { required: true, message: '请输入教师数!' },
        { pattern: /^-?\d+$/, message: '请输入整数!' },
      ];
    },
  },
  {
    label: '教师用机',
    field: 'computerTechearNum',
    component: 'InputNumber',
    dynamicRules: ({ model, schema }) => {
      return [
        { required: true, message: '请输入教师用机!' },
        { pattern: /^-?\d+$/, message: '请输入整数!' },
      ];
    },
  },
  {
    label: '学生用机',
    field: 'computerStudentNum',
    component: 'InputNumber',
    dynamicRules: ({ model, schema }) => {
      return [
        { required: true, message: '请输入学生用机!' },
        { pattern: /^-?\d+$/, message: '请输入整数!' },
      ];
    },
  },
  {
    label: '班班通投影',
    field: 'projectionModeNum',
    component: 'InputNumber',
    dynamicRules: ({ model, schema }) => {
      return [
        { required: true, message: '请输入班班通投影!' },
        { pattern: /^-?\d+$/, message: '请输入整数!' },
      ];
    },
  },
  {
    label: '班班通触控机',
    field: 'touchModeNum',
    component: 'InputNumber',
    dynamicRules: ({ model, schema }) => {
      return [
        { required: true, message: '请输入班班通触控机!' },
        { pattern: /^-?\d+$/, message: '请输入整数!' },
      ];
    },
  },
  {
    label: '班班通电视电脑',
    field: 'tvComputerModeNum',
    component: 'InputNumber',
    dynamicRules: ({ model, schema }) => {
      return [
        { required: true, message: '请输入班班通电视电脑!' },
        { pattern: /^-?\d+$/, message: '请输入整数!' },
      ];
    },
  },
  {
    label: '网关',
    field: 'gatewayNum',
    component: 'InputNumber',
    dynamicRules: ({ model, schema }) => {
      return [
        { required: true, message: '请输入网关!' },
        { pattern: /^-?\d+$/, message: '请输入整数!' },
      ];
    },
  },
  {
    label: '千兆路由器',
    field: 'router1000Num',
    component: 'InputNumber',
    dynamicRules: ({ model, schema }) => {
      return [
        { required: true, message: '请输入千兆路由器!' },
        { pattern: /^-?\d+$/, message: '请输入整数!' },
      ];
    },
  },
  {
    label: '百兆路由',
    field: 'router100Num',
    component: 'InputNumber',
    dynamicRules: ({ model, schema }) => {
      return [
        { required: true, message: '请输入百兆路由!' },
        { pattern: /^-?\d+$/, message: '请输入整数!' },
      ];
    },
  },
  {
    label: '服务器',
    field: 'serverNum',
    component: 'InputNumber',
    dynamicRules: ({ model, schema }) => {
      return [
        { required: true, message: '请输入服务器!' },
        { pattern: /^-?\d+$/, message: '请输入整数!' },
      ];
    },
  },
  {
    label: '网路计入点',
    field: 'networkPortNum',
    component: 'InputNumber',
    dynamicRules: ({ model, schema }) => {
      return [
        { required: true, message: '请输入网路计入点!' },
        { pattern: /^-?\d+$/, message: '请输入整数!' },
      ];
    },
  },
  {
    label: '无线路由器',
    field: 'wifiRouterNum',
    component: 'InputNumber',
    dynamicRules: ({ model, schema }) => {
      return [
        { required: true, message: '请输入无线路由器!' },
        { pattern: /^-?\d+$/, message: '请输入整数!' },
      ];
    },
  },
  {
    label: '无线AP',
    field: 'wifiApNum',
    component: 'InputNumber',
    dynamicRules: ({ model, schema }) => {
      return [
        { required: true, message: '请输入无线AP!' },
        { pattern: /^-?\d+$/, message: '请输入整数!' },
      ];
    },
  },
  {
    label: '其他设备',
    field: 'otherDeviceNum',
    component: 'InputNumber',
    dynamicRules: ({ model, schema }) => {
      return [
        { required: true, message: '请输入其他设备!' },
        { pattern: /^-?\d+$/, message: '请输入整数!' },
      ];
    },
  },
  {
    label: '千兆交换机',
    field: 'switch1000Num',
    component: 'Input',
    dynamicRules: ({ model, schema }) => {
      return [
        { required: true, message: '请输入千兆交换机!' },
        { pattern: /^-?\d+$/, message: '请输入整数!' },
      ];
    },
  },
  {
    label: '无线管理设备',
    field: 'wifiManagerNum',
    component: 'InputNumber',
    dynamicRules: ({ model, schema }) => {
      return [
        { required: true, message: '请输入无线管理设备!' },
        { pattern: /^-?\d+$/, message: '请输入整数!' },
      ];
    },
  },
  {
    label: '录播室(间)',
    field: 'recordingRoomNum',
    component: 'InputNumber',
    dynamicRules: ({ model, schema }) => {
      return [
        { required: true, message: '请输入录播室(间)!' },
        { pattern: /^-?\d+$/, message: '请输入整数!' },
      ];
    },
  },
  {
    label: '多功能会议室容纳人数',
    field: 'meetingRoomNum',
    component: 'InputNumber',
    dynamicRules: ({ model, schema }) => {
      return [
        { required: true, message: '请输入多功能会议室容纳人数!' },
        { pattern: /^-?\d+$/, message: '请输入整数!' },
      ];
    },
  },
  {
    label: '多功能会议室面积',
    field: 'meetingRoomArea',
    component: 'InputNumber',
    dynamicRules: ({ model, schema }) => {
      return [
        { required: true, message: '请输入多功能会议室面积!' },
        { pattern: /^-?\d+\.?\d*$/, message: '请输入数字!' },
      ];
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
