package org.eemp.modules.edu.register.service;

import org.eemp.modules.edu.register.entity.PsArtEquipmentFile;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * @Description: 小学美术教学装备配置文件
 * @Date:   2023-11-20
 * @Version: V1.0
 */
public interface IPsArtEquipmentFileService extends IService<PsArtEquipmentFile> {

    int changeReported(String id, int val);

}
