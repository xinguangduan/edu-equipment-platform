package org.eemp.modules.edu.register.service.impl;

import org.eemp.modules.edu.register.entity.JsPhysicsEquipmentFile;
import org.eemp.modules.edu.register.mapper.JsPhysicsEquipmentFileMapper;
import org.eemp.modules.edu.register.service.IJsPhysicsEquipmentFileService;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import javax.annotation.Resource;

/**
 * @Description: 初中物理教学装备配置文件
 * @Date:   2023-11-20
 * @Version: V1.0
 */
@Service
public class JsPhysicsEquipmentFileServiceImpl extends ServiceImpl<JsPhysicsEquipmentFileMapper, JsPhysicsEquipmentFile> implements IJsPhysicsEquipmentFileService {
    @Resource
    private JsPhysicsEquipmentFileMapper mapper;

    @Override
    public int changeReported(String id, int val) {
        return mapper.changeReported(id, val);
    }

}
