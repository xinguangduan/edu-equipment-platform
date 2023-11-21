package org.eemp.modules.edu.register.service.impl;

import org.eemp.modules.edu.register.entity.JsSportEquipmentFile;
import org.eemp.modules.edu.register.mapper.JsSportEquipmentFileMapper;
import org.eemp.modules.edu.register.service.IJsSportEquipmentFileService;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import javax.annotation.Resource;

/**
 * @Description: 初中体育教学装备配置文件
 * @Date:   2023-11-20
 * @Version: V1.0
 */
@Service
public class JsSportEquipmentFileServiceImpl extends ServiceImpl<JsSportEquipmentFileMapper, JsSportEquipmentFile> implements IJsSportEquipmentFileService {
    @Resource
    private JsSportEquipmentFileMapper mapper;

    @Override
    public int changeReported(String id, int val) {
        return mapper.changeReported(id, val);
    }

}
