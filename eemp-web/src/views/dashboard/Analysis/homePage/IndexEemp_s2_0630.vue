<template>
  <div class="p-4">
    <a-row>
      <a-col :span="24">
        <a-card :loading="loading" :bordered="false" title="全市电教装备基础数据" :style="{ marginTop: '24px' }">
          <a-row>
            <a-col :span="12">
              <LineMulti :chartData="myData" height="30vh" type="line" :option="{ title: { text: '历年师生人数统计' } }"></LineMulti>
            </a-col>
            <a-col :span="12">
              <BarMulti
                :chartData="myBarData"
                :option="{ title: { text: '历年师生人数统计', textStyle: { fontWeight: 'lighter' } } }"
                height="30vh"
              />
            </a-col>
          </a-row>
        </a-card>
      </a-col>
    </a-row>
  </div>
</template>

<script lang="ts" setup>
  import { ref } from 'vue';
  import LineMulti from '/@/components/chart/LineMulti.vue';
  import BarMulti from '/@/components/chart/BarMulti.vue';

  const loading = ref(true);

  setTimeout(() => {
    loading.value = false;
  }, 500);

  const myData = ref([])
  const myBarData = []

  myData.value = [];

  myData.value.push({name: '2021下半年', type: '教师人数', value: 5836});
  myData.value.push({name: '2021下半年', type: '学生人数', value: 17982});
  myData.value.push({name: '2022上半年', type: '教师人数', value: 6032});
  myData.value.push({name: '2022上半年', type: '学生人数', value: 18982});
  myData.value.push({name: '2022下半年', type: '教师人数', value: 6056});
  myData.value.push({name: '2022下半年', type: '学生人数', value: 19236});
  myData.value.push({name: '2023上半年', type: '教师人数', value: 6088});
  myData.value.push({name: '2023上半年', type: '学生人数', value: 19132});
  
  myBarData.push({name: '2021下半年', type: '教师人数', value: 5836});
  myBarData.push({name: '2021下半年', type: '学生人数', value: 17982});
  myBarData.push({name: '2022上半年', type: '教师人数', value: 6032});
  myBarData.push({name: '2022上半年', type: '学生人数', value: 18982});
  myBarData.push({name: '2022下半年', type: '教师人数', value: 6056});
  myBarData.push({name: '2022下半年', type: '学生人数', value: 19236});
  myBarData.push({name: '2023上半年', type: '教师人数', value: 6088});
  myBarData.push({name: '2023上半年', type: '学生人数', value: 19132});
</script>

<style>

</style>