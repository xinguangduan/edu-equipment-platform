package org.eemp.modules.edu.register.service;

import org.eemp.modules.edu.register.entity.PsMathematicsEquipmentFile;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * @Description: 小学数学教学装备配置文件
 * @Date:   2023-10-18
 * @Version: V1.0
 */
public interface IPsMathematicsEquipmentFileService extends IService<PsMathematicsEquipmentFile> {

    int changeReported(String id, int val);

}
