package org.eemp.modules.edu.register.service;

import org.eemp.modules.edu.register.entity.JsArtEquipmentFile;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * @Description: 初中美术教学装备配置文件
 * @Date:   2023-11-20
 * @Version: V1.0
 */
public interface IJsArtEquipmentFileService extends IService<JsArtEquipmentFile> {

    int changeReported(String id, int val);

}
