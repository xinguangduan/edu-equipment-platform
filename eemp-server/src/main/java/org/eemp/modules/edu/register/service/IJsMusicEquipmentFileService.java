package org.eemp.modules.edu.register.service;

import org.eemp.modules.edu.register.entity.JsMusicEquipmentFile;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * @Description: 初中音乐教学装备配置文件
 * @Date:   2023-11-20
 * @Version: V1.0
 */
public interface IJsMusicEquipmentFileService extends IService<JsMusicEquipmentFile> {

    int changeReported(String id, int val);

}
