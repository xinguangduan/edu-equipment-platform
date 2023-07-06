<template>
  <IndexEemp_s1 v-if="indexStyle === 6"></IndexEemp_s1>
  <IndexEemp_s2 v-if="indexStyle === 7"></IndexEemp_s2>
  <IndexDef v-if="indexStyle === 0"></IndexDef>
  <IndexChart v-if="indexStyle === 1"></IndexChart>
  <IndexBdc v-if="indexStyle == 2"></IndexBdc>
  <IndexTask v-if="indexStyle == 3"></IndexTask>
  <div style="width: 100%; text-align: right; margin-top: 20px">
    请选择首页样式：
    <a-radio-group v-model:value="indexStyle">
      <a-radio :value="6">方案#1</a-radio>
      <a-radio :value="7">方案#2</a-radio>
      <a-radio :value="0">默认</a-radio>
      <a-radio :value="1">销量统计</a-radio>
      <a-radio :value="2">业务统计</a-radio>
      <a-radio :value="3">我的任务</a-radio>
    </a-radio-group>
  </div>
</template>
<script lang="ts" setup>
  import { ref } from 'vue';
  import IndexDef from './homePage/IndexDef.vue';
  import IndexChart from './homePage/IndexChart.vue';
  import IndexBdc from './homePage/IndexBdc.vue';
  import IndexTask from './homePage/IndexTask.vue';
  import IndexEemp_s1 from './homePage/IndexEemp_s1_0705.vue';
  import IndexEemp_s2 from './homePage/IndexEemp_s2_0630.vue';

  const indexStyle = ref(6);
</script>
