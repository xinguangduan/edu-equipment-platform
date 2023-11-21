package org.eemp.modules.edu.register.service;

import org.eemp.modules.edu.register.entity.JsPhysicsEquipmentFile;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * @Description: 初中物理教学装备配置文件
 * @Date:   2023-11-20
 * @Version: V1.0
 */
public interface IJsPhysicsEquipmentFileService extends IService<JsPhysicsEquipmentFile> {

    int changeReported(String id, int val);

}
