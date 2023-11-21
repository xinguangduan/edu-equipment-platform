package org.eemp.modules.edu.register.service;

import org.eemp.modules.edu.register.entity.PsMusicEquipmentFile;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * @Description: 小学音乐教学装备配置文件
 * @Date:   2023-11-20
 * @Version: V1.0
 */
public interface IPsMusicEquipmentFileService extends IService<PsMusicEquipmentFile> {

    int changeReported(String id, int val);

}
