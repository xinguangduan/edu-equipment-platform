<template>
  <BasicModal v-bind="$attrs" @register="registerModal" title="基本信息" @ok="handleSubmit" width="600px">
    <BasicForm @register="registerForm" />
  </BasicModal>
</template>
<script lang="ts" setup>
  import { ref, unref, defineExpose } from 'vue';
  import { rules } from '/@/utils/helper/validator';
  import { defHttp } from '/@/utils/http/axios';
  import { BasicModal, useModalInner } from '/@/components/Modal';
  import { BasicForm, useForm } from '/@/components/Form/index';
  import { useMessage } from '/@/hooks/web/useMessage';
  // 声明Emits
  const emit = defineEmits(['register']);
  const $message = useMessage();
  const formRef = ref();
  const username = ref('');
  const adminNameRef = ref('');
  const phoneNumberRef = ref('');
  //表单配置
  const [registerForm, { setFieldsValue, resetFields, validate, clearValidate }] = useForm({
    schemas: [
      {
        label: '管理员姓名',
        field: 'adminName',
        component: 'Input',
        // colProps: { span: 16, },
        componentProps: ({ schema, formModel }) => {
          console.log('form: ', schema);
          console.log('formModel: ', formModel);
          return {
            // placeholder: '请输入 信息 管理员姓名！',
            onchange: (e: any) => {
              console.log(e);
            },
          };
        },
      },
      {
        label: '联系电话',
        field: 'phoneNumber',
        component: 'Input',
        componentProps: {
          onchange: (e: any) => {
            console.log(e);
          },
        },
      },
    ],
    showActionButtonGroup: false,
  });
  //表单赋值
  const [registerModal, { setModalProps, closeModal }] = useModalInner();

  //表单提交事件
  async function handleSubmit() {
    try {
      const values = await validate();
      setModalProps({ confirmLoading: true });
      //提交表单
      let params = Object.assign({ username: unref(username) }, values);
      defHttp.put({ url: '/org.eemp.modules.edu.foudation/organizationDefinition/memberInfo', params }, { isTransformResponse: false }).then((res) => {
        if (res.success) {
          $message.createMessage.success(res.message);
          //关闭弹窗
          closeModal();
        } else {
          $message.createMessage.warning(res.message);
        }
      });
    } finally {
      setModalProps({ confirmLoading: false });
    }
  }

  async function show(name) {
    if (!name) {
      $message.createMessage.warning('当前系统无登录用户!');
      return;
    } else {
      username.value = name;
      let params = Object.assign({ adminCode: name }, );
      defHttp.get({ url: '/org.eemp.modules.edu.foudation/organizationDefinition/queryByAdminCode', params }, { isTransformResponse: false }).then((res) => {
        if (res.success) {
          console.log(res.result);
          adminNameRef.value = res.result.adminName;
          phoneNumberRef.value = res.result.phoneNumber;
          setMemberInfo();
        } else {
          $message.createMessage.warning(res.message);
        }
      });
      await setModalProps({ visible: true });
      // await resetFields();
      await clearValidate();
    }
  }

  async function setMemberInfo() {
    await setFieldsValue({ adminName : unref(adminNameRef) });
    await setFieldsValue({ phoneNumber : unref(phoneNumberRef) });
  }

  defineExpose({
    show,
  });
</script>
