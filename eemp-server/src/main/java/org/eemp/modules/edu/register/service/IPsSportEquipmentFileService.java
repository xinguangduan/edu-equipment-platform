package org.eemp.modules.edu.register.service;

import org.eemp.modules.edu.register.entity.PsSportEquipmentFile;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * @Description: 小学体育教学装备配置文件
 * @Date:   2023-11-20
 * @Version: V1.0
 */
public interface IPsSportEquipmentFileService extends IService<PsSportEquipmentFile> {

    int changeReported(String id, int val);

}
