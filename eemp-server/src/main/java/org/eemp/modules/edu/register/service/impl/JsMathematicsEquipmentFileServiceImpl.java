package org.eemp.modules.edu.register.service.impl;

import org.eemp.modules.edu.register.entity.JsMathematicsEquipmentFile;
import org.eemp.modules.edu.register.mapper.JsMathematicsEquipmentFileMapper;
import org.eemp.modules.edu.register.service.IJsMathematicsEquipmentFileService;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import javax.annotation.Resource;

/**
 * @Description: 初中数学教学装备配置文件
 * @Date:   2023-11-20
 * @Version: V1.0
 */
@Service
public class JsMathematicsEquipmentFileServiceImpl extends ServiceImpl<JsMathematicsEquipmentFileMapper, JsMathematicsEquipmentFile> implements IJsMathematicsEquipmentFileService {
    @Resource
    private JsMathematicsEquipmentFileMapper mapper;

    @Override
    public int changeReported(String id, int val) {
        return mapper.changeReported(id, val);
    }

}
