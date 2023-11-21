package org.eemp.modules.edu.register.service;

import org.eemp.modules.edu.register.entity.JsChemistryEquipmentFile;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * @Description: 初中化学教学装备配置文件
 * @Date:   2023-11-20
 * @Version: V1.0
 */
public interface IJsChemistryEquipmentFileService extends IService<JsChemistryEquipmentFile> {

    int changeReported(String id, int val);

}
