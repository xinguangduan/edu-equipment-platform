<template>
  <div ref="chartRef" :style="{ width, height }"></div>
</template>
<script lang="ts" setup>
  import { Ref, ref, watch } from 'vue';
  import { useECharts } from '/@/hooks/web/useECharts';

  const props = defineProps({
    loading: Boolean,
    width: {
      type: String as PropType<string>,
      default: '100%',
    },
    height: {
      type: String as PropType<string>,
      default: '300px',
    },
  });

  const chartRef = ref<HTMLDivElement | null>(null);
  const { setOptions } = useECharts(chartRef as Ref<HTMLDivElement>);
  watch(
    () => props.loading,
    () => {
      if (props.loading) {
        return;
      }
      setOptions({
        title: {
          text: '中心机房建设情况',
          textStyle: { fontWeight: 'lighter' },
        },
        tooltip: {
          trigger: 'item',
        },

        series: [
          {
            name: '全市学校统计',
            type: 'pie',
            radius: '80%',
            center: ['50%', '50%'],
            color: ['#5ab1ef', '#b6a2de', '#67e0e3', '#2ec7c9'],
            data: [
              { value: 75, name: '已建中心机房' },
              { value: 11, name: '未建中心机房' },
            ].sort(function (a, b) {
              return a.value - b.value;
            }),
            roseType: 'radius',
            animationType: 'scale',
            animationEasing: 'exponentialInOut',
            animationDelay: function () {
              return Math.random() * 400;
            },
          },
        ],
      });
    },
    { immediate: true }
  );
</script>
