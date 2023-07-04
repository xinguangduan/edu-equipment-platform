import { defHttp } from '/@/utils/http/axios';
import { useMessage } from '/@/hooks/web/useMessage';

const { createConfirm } = useMessage();

enum Api {
  list = '/edu/primarysportequipmentreq/eduPrimarySportEquipmentReq/list',
  save = '/edu/primarysportequipmentreq/eduPrimarySportEquipmentReq/add',
  edit = '/edu/primarysportequipmentreq/eduPrimarySportEquipmentReq/edit',
  deleteOne = '/edu/primarysportequipmentreq/eduPrimarySportEquipmentReq/delete',
  deleteBatch = '/edu/primarysportequipmentreq/eduPrimarySportEquipmentReq/deleteBatch',
  importExcel = '/edu/primarysportequipmentreq/eduPrimarySportEquipmentReq/importExcel',
  exportXls = '/edu/primarysportequipmentreq/eduPrimarySportEquipmentReq/exportXls',
}
/**
 * 导出api
 * @param params
 */
export const getExportUrl = Api.exportXls;
/**
 * 导入api
 */
export const getImportUrl = Api.importExcel;
/**
 * 列表接口
 * @param params
 */
export const list = (params) => defHttp.get({ url: Api.list, params });

/**
 * 删除单个
 */
export const deleteOne = (params, handleSuccess) => {
  return defHttp.delete({ url: Api.deleteOne, params }, { joinParamsToUrl: true }).then(() => {
    handleSuccess();
  });
};
/**
 * 批量删除
 * @param params
 */
export const batchDelete = (params, handleSuccess) => {
  createConfirm({
    iconType: 'warning',
    title: '确认删除',
    content: '是否删除选中数据',
    okText: '确认',
    cancelText: '取消',
    onOk: () => {
      return defHttp.delete({ url: Api.deleteBatch, data: params }, { joinParamsToUrl: true }).then(() => {
        handleSuccess();
      });
    },
  });
};
/**
 * 保存或者更新
 * @param params
 */
export const saveOrUpdate = (params, isUpdate) => {
  const url = isUpdate ? Api.edit : Api.save;
  return defHttp.post({ url: url, params });
};
