package org.eemp.modules.edu.register.service.impl;

import org.eemp.modules.edu.register.entity.JsBiologyEquipmentFile;
import org.eemp.modules.edu.register.mapper.JsBiologyEquipmentFileMapper;
import org.eemp.modules.edu.register.service.IJsBiologyEquipmentFileService;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import javax.annotation.Resource;

/**
 * @Description: 初中生物教学装备配置文件
 * @Date:   2023-11-20
 * @Version: V1.0
 */
@Service
public class JsBiologyEquipmentFileServiceImpl extends ServiceImpl<JsBiologyEquipmentFileMapper, JsBiologyEquipmentFile> implements IJsBiologyEquipmentFileService {
    @Resource
    private JsBiologyEquipmentFileMapper mapper;

    @Override
    public int changeReported(String id, int val) {
        return mapper.changeReported(id, val);
    }

}