package org.eemp.modules.edu.register.service.impl;

import org.eemp.modules.edu.register.entity.JsChemistryEquipmentFile;
import org.eemp.modules.edu.register.mapper.JsChemistryEquipmentFileMapper;
import org.eemp.modules.edu.register.service.IJsChemistryEquipmentFileService;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import javax.annotation.Resource;

/**
 * @Description: 初中化学教学装备配置文件
 * @Date:   2023-11-20
 * @Version: V1.0
 */
@Service
public class JsChemistryEquipmentFileServiceImpl extends ServiceImpl<JsChemistryEquipmentFileMapper, JsChemistryEquipmentFile> implements IJsChemistryEquipmentFileService {
    @Resource
    private JsChemistryEquipmentFileMapper mapper;

    @Override
    public int changeReported(String id, int val) {
        return mapper.changeReported(id, val);
    }

}
