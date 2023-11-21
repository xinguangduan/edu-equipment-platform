package org.eemp.modules.edu.register.service.impl;

import org.eemp.modules.edu.register.entity.JsGeographyEquipmentFile;
import org.eemp.modules.edu.register.mapper.JsGeographyEquipmentFileMapper;
import org.eemp.modules.edu.register.service.IJsGeographyEquipmentFileService;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import javax.annotation.Resource;

/**
 * @Description: 初中地理教学装备配置文件
 * @Date:   2023-11-20
 * @Version: V1.0
 */
@Service
public class JsGeographyEquipmentFileServiceImpl extends ServiceImpl<JsGeographyEquipmentFileMapper, JsGeographyEquipmentFile> implements IJsGeographyEquipmentFileService {
    @Resource
    private JsGeographyEquipmentFileMapper mapper;

    @Override
    public int changeReported(String id, int val) {
        return mapper.changeReported(id, val);
    }

}
