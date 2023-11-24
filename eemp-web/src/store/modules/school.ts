import { defineStore } from 'pinia';
import { store } from '/@/store';
import { defHttp } from '/@/utils/http/axios';

enum Api {
  GetSchoolTreeDataUrl = '/org.eemp.modules.edu.foudation/organizationDefinition/getSchoolTreeData',
}

export const useSchoolStore = defineStore({
  id: 'edu-school',
  state: () => ({
    // 学校树
    schoolTreeData: [],
  }),
  actions: {
    async fetchSchoolTreeData() {
//       console.log("orig schoolTreeData: ", this.schoolTreeData)
      const response = await defHttp.get({ url: Api.GetSchoolTreeDataUrl }, {}).catch((e) => {
            if (e && (e.message.includes('timeout') || e.message.includes('401'))) {
          //接口不通时
          console.log("fetch schoolTreeData failed!");
        }
      });
    
      console.log("fetch schoolTreeData ret: ", response)
      this.schoolTreeData = response;
    },
  },
});

// Need to be used outside the setup
export function useSchoolStoreWithOut() {
  return useSchoolStore(store);
}
