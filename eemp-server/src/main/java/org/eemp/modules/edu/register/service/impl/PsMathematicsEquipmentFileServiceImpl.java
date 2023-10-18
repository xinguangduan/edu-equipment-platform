package org.eemp.modules.edu.register.service.impl;

import org.eemp.modules.edu.register.entity.PsMathematicsEquipmentFile;
import org.eemp.modules.edu.register.mapper.PsMathematicsEquipmentFileMapper;
import org.eemp.modules.edu.register.service.IPsMathematicsEquipmentFileService;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import javax.annotation.Resource;

/**
 * @Description: 小学数学教学装备配置文件
 * @Date:   2023-10-18
 * @Version: V1.0
 */
@Service
public class PsMathematicsEquipmentFileServiceImpl extends ServiceImpl<PsMathematicsEquipmentFileMapper, PsMathematicsEquipmentFile> implements IPsMathematicsEquipmentFileService {
    @Resource
    private PsMathematicsEquipmentFileMapper mapper;

    @Override
    public int changeReported(String id, int val) {
        return mapper.changeReported(id, val);
    }

}
