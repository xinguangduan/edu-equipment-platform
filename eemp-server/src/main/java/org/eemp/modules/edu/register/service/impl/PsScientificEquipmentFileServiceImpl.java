package org.eemp.modules.edu.register.service.impl;

import org.eemp.modules.edu.register.entity.PsScientificEquipmentFile;
import org.eemp.modules.edu.register.mapper.PsScientificEquipmentFileMapper;
import org.eemp.modules.edu.register.service.IPsScientificEquipmentFileService;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import javax.annotation.Resource;

/**
 * @Description: 小学科学教学装备配置文件
 * @Date:   2023-11-20
 * @Version: V1.0
 */
@Service
public class PsScientificEquipmentFileServiceImpl extends ServiceImpl<PsScientificEquipmentFileMapper, PsScientificEquipmentFile> implements IPsScientificEquipmentFileService {
    @Resource
    private PsScientificEquipmentFileMapper mapper;

    @Override
    public int changeReported(String id, int val) {
        return mapper.changeReported(id, val);
    }

}
