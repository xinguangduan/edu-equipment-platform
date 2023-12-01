<template>
  <div>
    <!--引用表格-->
   <BasicTable @register="registerTable" :rowSelection="rowSelection">
     <!--插槽:table标题-->
      <template #tableTitle>
        <a-button type="primary" @click="handleAdd" preIcon="ant-design:plus-outlined" v-auth="'edu.statistics:school_music_art_room_info_6:add'" :disabled="!addable"> 新增</a-button>
        <a-dropdown v-if="selectedRowKeys.length > 0">
              <template #overlay>
                <a-menu>
                  <a-menu-item key="1" @click="batchHandleDelete">
                    <Icon icon="ant-design:delete-outlined"></Icon>
                    删除
                  </a-menu-item>
                </a-menu>
              </template>
              <a-button v-auth="'edu.statistics:school_music_art_room_info_6:deleteBatch'">批量操作
                <Icon icon="mdi:chevron-down"></Icon>
              </a-button>
        </a-dropdown>
        <a-button type="primary" @click="handleReport" preIcon="ant-design:send-outlined" v-auth="'edu.statistics:school_music_art_room_info_6:report'" :disabled="!reportable">上报</a-button>
        <a-button :ghost="true" type="primary" @click="handleRevoke" preIcon="ant-design:send-outlined" v-auth="'edu.statistics:school_music_art_room_info_6:revoke'">退回学校修改</a-button>
        <a-button  type="primary" preIcon="ant-design:export-outlined" @click="onExportXls" v-auth="'edu.statistics:school_music_art_room_info_6:exportXls'"> 导出</a-button>
        <j-upload-button  type="primary" preIcon="ant-design:import-outlined" @click="onImportXls" v-auth="'edu.statistics:school_music_art_room_info_6:importExcel'">导入</j-upload-button>
      </template>
       <!--操作栏-->
      <template #action="{ record }">
        <TableAction v-if="recId !== undefined && record.id === recId.valueOf() && reportable" :actions="getTableAction(record)" :dropDownActions="getDropDownAction(record)"/>
      </template>
      <!--字段回显插槽-->
      <template #htmlSlot="{text}">
         <div v-html="text"></div>
      </template>
      <!--省市区字段回显插槽-->
      <template #pcaSlot="{text}">
         {{ getAreaTextByCode(text) }}
      </template>
      <template #fileSlot="{text}">
         <span v-if="!text" style="font-size: 12px;font-style: italic;">无文件</span>
         <a-button v-else :ghost="true" type="primary" preIcon="ant-design:download-outlined" size="small" @click="downloadFile(text)">下载</a-button>
      </template>
    </BasicTable>
    <!-- 表单区域 -->
    <SchoolMusicArtRoomInfo_6Modal @register="registerModal" @success="handleSuccess"></SchoolMusicArtRoomInfo_6Modal>
  </div>
</template>

<script lang="ts" name="org.eemp.modules.edu.statistics-schoolMusicArtRoomInfo_6" setup>
  import {ref, computed, unref, onMounted} from 'vue';
  import {BasicTable, useTable, TableAction} from '/@/components/Table';
  import {useModal} from '/@/components/Modal';
  import { useListPage } from '/@/hooks/system/useListPage'
  import SchoolMusicArtRoomInfo_6Modal from './components/SchoolMusicArtRoomInfo_6Modal.vue'
  import {columns, searchFormSchema} from './SchoolMusicArtRoomInfo_6.data';
  import {list, deleteOne, batchDelete, getImportUrl,getExportUrl, reportOne, batchRevoke, getFillingControlUrl} from './SchoolMusicArtRoomInfo_6.api';
  import { downloadFile } from '/@/utils/common/renderUtils';
  import { defHttp } from '/@/utils/http/axios';
  import { useUserStoreWithOut } from '/@/store/modules/user';
  const checkedKeys = ref<Array<string | number>>([]);

  const userStore = useUserStoreWithOut();

  //注册model
  const [registerModal, {openModal}] = useModal();
  //注册table数据
  const { prefixCls,tableContext,onExportXls,onImportXls } = useListPage({
      tableProps:{
           title: '中小学音乐、美术教学用房统计表（六）',
           api: list,
           columns,
           canResize:false,
           formConfig: {
              //labelWidth: 120,
              schemas: searchFormSchema,
              autoSubmitOnEnter:true,
              showAdvancedButton:true,
              fieldMapToNumber: [
              ],
              fieldMapToTime: [
              ],
            },
           actionColumn: {
               width: 120,
               fixed:'left'
            },
      },
       exportConfig: {
            name:"中小学音乐、美术教学用房统计表（六）",
            url: getExportUrl,
          },
          importConfig: {
            url: getImportUrl,
            success: handleSuccess
          },
  })

  const [registerTable, {reload},{ rowSelection, selectedRowKeys }] = tableContext

   /**
    * 新增事件
    */
  function handleAdd() {
     openModal(true, {
       isUpdate: false,
       showFooter: true,
     });
  }
   /**
    * 编辑事件
    */
  function handleEdit(record: Recordable) {
     openModal(true, {
       record,
       isUpdate: true,
       showFooter: true,
     });
   }
   /**
    * 详情
   */
  function handleDetail(record: Recordable) {
     openModal(true, {
       record,
       isUpdate: true,
       showFooter: false,
     });
   }
   /**
    * 删除事件
    */
  async function handleDelete(record) {
     await deleteOne({id: record.id}, handleSuccess);
   }
   /**
    * 批量删除事件
    */
  async function batchHandleDelete() {
     await batchDelete({ids: selectedRowKeys.value}, handleSuccess);
   }
   /**
    * 成功回调
    */
  function handleSuccess() {
      (selectedRowKeys.value = []) && getFillingControl() && reload();
   }
   /**
      * 操作栏
      */
  function getTableAction(record){
       return [
         {
           label: '编辑',
           onClick: handleEdit.bind(null, record),
         }, {
           label: '删除',
           popConfirm: {
             title: '是否确认删除',
             confirm: handleDelete.bind(null, record),
           }
         }
       ]
   }
     /**
        * 下拉操作栏
        */
  function getDropDownAction(record){
       return [
        //  {
        //    label: '详情',
        //    onClick: handleDetail.bind(null, record),
        //  }
       ]
   }

  async function handleReport() {
    await reportOne({identificationCode: userStore.getUserInfo.telephone, id: recId.value}, handleSuccess);
  }
  async function handleRevoke() {
    await batchRevoke({ids: selectedRowKeys.value}, handleSuccess);
  }
 
  const addable = ref(false)
  const reportable = ref(false)
  const revokable = ref(false)
  const recId = ref(0)

  onMounted(() => {
    getFillingControl()
    console.log("onMounted...")
  })

  async function getFillingControl() {
    let params = {identificationCode: userStore.getUserInfo.telephone, packageName: 'school_music_art_room_info_6'};
    await defHttp.post({url: getFillingControlUrl, params}, {joinParamsToUrl: true}).then((res) => {
      console.log(res);
      addable.value = res.addable
      reportable.value = res.reportable
      revokable.value = res.revokable
      recId.value = res.id
    });
  }

</script>

<style scoped>

</style>
