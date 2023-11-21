package org.eemp.modules.edu.register.service;

import org.eemp.modules.edu.register.entity.JsMathematicsEquipmentFile;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * @Description: 初中数学教学装备配置文件
 * @Date:   2023-11-20
 * @Version: V1.0
 */
public interface IJsMathematicsEquipmentFileService extends IService<JsMathematicsEquipmentFile> {

    int changeReported(String id, int val);

}
