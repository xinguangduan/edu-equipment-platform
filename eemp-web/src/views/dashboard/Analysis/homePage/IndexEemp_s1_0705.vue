<template>
  <div class="p-4">
    <a-row>
      <a-col :span="24">
        <a-card :loading="loading" :bordered="false" title="全市电教装备基础数据" :style="{ marginTop: '24px' }">
          <a-row>
            <a-col :span="8">
              <BarMulti
                :chartData="classInfo"
                :option="{ title: { text: '班级数统计', textStyle: { fontWeight: 'lighter' } } }"
                height="30vh"
              />
            </a-col>
            <a-col :span="8">
              <BarMulti
                :chartData="teacherInfo"
                :option="{ title: { text: '教师人数统计', textStyle: { fontWeight: 'lighter' } } }"
                height="30vh"
              />
            </a-col>
            <a-col :span="8">
              <BarMulti
                :chartData="StudentInfo"
                :option="{ title: { text: '学生人数统计', textStyle: { fontWeight: 'lighter' } } }"
                height="30vh"
              />
            </a-col>
          </a-row>
        </a-card>
        <a-card :loading="loading" :bordered="false" title="教育信息化" :style="{ marginTop: '24px' }">
          <a-row>
            <a-col :span="12">
              <BarMulti
                  :chartData="teacherComputerInfo"
                  :option="{ title: { text: '教师办公计算机统计', textStyle: { fontWeight: 'lighter' } } }"
                  height="30vh"
                />
            </a-col>
            <a-col :span="12">
              <BarMulti
                :chartData="studentComputerInfo"
                :option="{ title: { text: '学生计算机统计', textStyle: { fontWeight: 'lighter' } } }"
                height="30vh"
              />
            </a-col>
          </a-row>
          <a-row>
            <a-col :span="12">
              <StackBar
                :chartData="classCommunicationInfo"
                :option="{ title: { text: '班班通统计', textStyle: { fontWeight: 'lighter' } } }"
                height="30vh"
              />
            </a-col>
            <a-col :span="4">
            </a-col>
            <a-col :span="8">
              <div class="md:flex enter-y">
                <EduCentralRoom class="md:w-1/1 w-full" :loading="loading" />
              </div>
            </a-col>
          </a-row>
        </a-card>
        <a-card :loading="loading" :bordered="false" title="教育装备" :style="{ marginTop: '24px' }">
          <div class="md:flex enter-y">
            <EduScience class="md:w-1/3 w-full" :loading="loading" />
            <EduLaboiratory class="md:w-1/3 !md:mx-4 !md:my-0 !my-4 w-full" :loading="loading" />
            <BarMulti
                :chartData="roomInfo"
                :option="{ title: { text: '图书室统计', textStyle: { fontWeight: 'lighter' } } }"
                height="30vh"
              />
          </div>
        </a-card>
      </a-col>
    </a-row>
  </div>
</template>

<script lang="ts" setup>
  import { ref } from 'vue';
  import BarMulti from '/@/components/chart/BarMulti.vue';
  import StackBar from '/@/components/chart/StackBar.vue';
  import EduScience from '../components/EduScience.vue';
  import EduLaboiratory from '../components/EduLaboiratory.vue';
  import EduCentralRoom from '../components/EduCentralRoom.vue';
  import { getTeacherInfo } from '../api.ts';


  const loading = ref(true);

  setTimeout(() => {
    loading.value = false;
  }, 500);

  const teacherInfo = ref([])

  function initTeacherInfo() {
    getTeacherInfo(null).then((res) => {
      if (res.success) {
        teacherInfo.value = res.result;
        // teacherInfo.value = [];
        // res.result.forEach((item) => {
        //   teacherInfo.value.push({ name: item.name, type: item.type, value: item.value });
        // });
      }
    });
  }

  initTeacherInfo();

  const classInfo = []
  const StudentInfo = []

  classInfo.push({name: '中心小学', type: '2021下半年', value: 312});
  classInfo.push({name: '中心小学', type: '2022上半年', value: 369});
  classInfo.push({name: '中心小学', type: '2022下半年', value: 500});
  classInfo.push({name: '中心小学', type: '2023上半年', value: 504});
  classInfo.push({name: '完全小学', type: '2021下半年', value: 190});
  classInfo.push({name: '完全小学', type: '2022上半年', value: 200});
  classInfo.push({name: '完全小学', type: '2022下半年', value: 205});
  classInfo.push({name: '完全小学', type: '2023上半年', value: 213});
  classInfo.push({name: '初中', type: '2021下半年', value: 280});
  classInfo.push({name: '初中', type: '2022上半年', value: 290});
  classInfo.push({name: '初中', type: '2022下半年', value: 300});
  classInfo.push({name: '初中', type: '2023上半年', value: 305});
  classInfo.push({name: '高职特幼', type: '2021下半年', value: 260});
  classInfo.push({name: '高职特幼', type: '2022上半年', value: 270});
  classInfo.push({name: '高职特幼', type: '2022下半年', value: 276});
  classInfo.push({name: '高职特幼', type: '2023上半年', value: 283});

  StudentInfo.push({name: '中心小学', type: '2021下半年', value: 20008});
  StudentInfo.push({name: '中心小学', type: '2022上半年', value: 21809});
  StudentInfo.push({name: '中心小学', type: '2022下半年', value: 23601});
  StudentInfo.push({name: '中心小学', type: '2023上半年', value: 25257});
  StudentInfo.push({name: '完全小学', type: '2021下半年', value: 6530});
  StudentInfo.push({name: '完全小学', type: '2022上半年', value: 6109});
  StudentInfo.push({name: '完全小学', type: '2022下半年', value: 6358});
  StudentInfo.push({name: '完全小学', type: '2023上半年', value: 6127});
  StudentInfo.push({name: '初中', type: '2021下半年', value: 20096});
  StudentInfo.push({name: '初中', type: '2022上半年', value: 16392});
  StudentInfo.push({name: '初中', type: '2022下半年', value: 18296});
  StudentInfo.push({name: '初中', type: '2023上半年', value: 15737});
  StudentInfo.push({name: '高职特幼', type: '2021下半年', value: 14561});
  StudentInfo.push({name: '高职特幼', type: '2022上半年', value: 13967});
  StudentInfo.push({name: '高职特幼', type: '2022下半年', value: 15682});
  StudentInfo.push({name: '高职特幼', type: '2023上半年', value: 14586});

  const teacherComputerInfo = []
  const studentComputerInfo = []

  teacherComputerInfo.push({name: '中心小学', type: '2021下半年', value: 380});
  teacherComputerInfo.push({name: '中心小学', type: '2022上半年', value: 390});
  teacherComputerInfo.push({name: '中心小学', type: '2022下半年', value: 392});
  teacherComputerInfo.push({name: '中心小学', type: '2023上半年', value: 496});
  teacherComputerInfo.push({name: '完全小学', type: '2021下半年', value: 160});
  teacherComputerInfo.push({name: '完全小学', type: '2022上半年', value: 170});
  teacherComputerInfo.push({name: '完全小学', type: '2022下半年', value: 178});
  teacherComputerInfo.push({name: '完全小学', type: '2023上半年', value: 222});
  teacherComputerInfo.push({name: '初中', type: '2021下半年', value: 380});
  teacherComputerInfo.push({name: '初中', type: '2022上半年', value: 390});
  teacherComputerInfo.push({name: '初中', type: '2022下半年', value: 393});
  teacherComputerInfo.push({name: '初中', type: '2023上半年', value: 439});
  teacherComputerInfo.push({name: '高职特幼', type: '2021下半年', value: 780});
  teacherComputerInfo.push({name: '高职特幼', type: '2022上半年', value: 790});
  teacherComputerInfo.push({name: '高职特幼', type: '2022下半年', value: 793});
  teacherComputerInfo.push({name: '高职特幼', type: '2023上半年', value: 804});

  studentComputerInfo.push({name: '中心小学', type: '2021下半年', value: 1000});
  studentComputerInfo.push({name: '中心小学', type: '2022上半年', value: 1080});
  studentComputerInfo.push({name: '中心小学', type: '2022下半年', value: 1090});
  studentComputerInfo.push({name: '中心小学', type: '2023上半年', value: 1105});
  studentComputerInfo.push({name: '完全小学', type: '2021下半年', value: 800});
  studentComputerInfo.push({name: '完全小学', type: '2022上半年', value: 850});
  studentComputerInfo.push({name: '完全小学', type: '2022下半年', value: 900});
  studentComputerInfo.push({name: '完全小学', type: '2023上半年', value: 942});
  studentComputerInfo.push({name: '初中', type: '2021下半年', value: 860});
  studentComputerInfo.push({name: '初中', type: '2022上半年', value: 900});
  studentComputerInfo.push({name: '初中', type: '2022下半年', value: 960});
  studentComputerInfo.push({name: '初中', type: '2023上半年', value: 1009});
  studentComputerInfo.push({name: '高职特幼', type: '2021下半年', value: 910});
  studentComputerInfo.push({name: '高职特幼', type: '2022上半年', value: 1000});
  studentComputerInfo.push({name: '高职特幼', type: '2022下半年', value: 1060});
  studentComputerInfo.push({name: '高职特幼', type: '2023上半年', value: 1117});

  const classCommunicationInfo = []

  classCommunicationInfo.push({name: '中心小学', type: '已开通', value: 504});
  classCommunicationInfo.push({name: '中心小学', type: '未开通', value: 0});
  classCommunicationInfo.push({name: '完全小学', type: '已开通', value: 193});
  classCommunicationInfo.push({name: '完全小学', type: '未开通', value: 20});
  classCommunicationInfo.push({name: '初中', type: '已开通', value: 305});
  classCommunicationInfo.push({name: '初中', type: '未开通', value: 0});
  classCommunicationInfo.push({name: '高职特幼', type: '已开通', value: 283});
  classCommunicationInfo.push({name: '高职特幼', type: '未开通', value: 0});

  const roomInfo = []

  roomInfo.push({name: '藏书室', type: '2021下半年', value: 100});
  roomInfo.push({name: '藏书室', type: '2022上半年', value: 110});
  roomInfo.push({name: '藏书室', type: '2022下半年', value: 113});
  roomInfo.push({name: '藏书室', type: '2023上半年', value: 113});
  roomInfo.push({name: '阅览室', type: '2021下半年', value: 69});
  roomInfo.push({name: '阅览室', type: '2022上半年', value: 70});
  roomInfo.push({name: '阅览室', type: '2022下半年', value: 70});
  roomInfo.push({name: '阅览室', type: '2023上半年', value: 72});
  roomInfo.push({name: '特色场所', type: '2021下半年', value: 76});
  roomInfo.push({name: '特色场所', type: '2022上半年', value: 80});
  roomInfo.push({name: '特色场所', type: '2022下半年', value: 80});
  roomInfo.push({name: '特色场所', type: '2023上半年', value: 82});
</script>

<style>

</style>
