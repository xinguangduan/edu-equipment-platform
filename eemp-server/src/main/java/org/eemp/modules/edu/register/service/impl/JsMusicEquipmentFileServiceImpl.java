package org.eemp.modules.edu.register.service.impl;

import org.eemp.modules.edu.register.entity.JsMusicEquipmentFile;
import org.eemp.modules.edu.register.mapper.JsMusicEquipmentFileMapper;
import org.eemp.modules.edu.register.service.IJsMusicEquipmentFileService;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import javax.annotation.Resource;

/**
 * @Description: 初中音乐教学装备配置文件
 * @Date:   2023-11-20
 * @Version: V1.0
 */
@Service
public class JsMusicEquipmentFileServiceImpl extends ServiceImpl<JsMusicEquipmentFileMapper, JsMusicEquipmentFile> implements IJsMusicEquipmentFileService {
    @Resource
    private JsMusicEquipmentFileMapper mapper;

    @Override
    public int changeReported(String id, int val) {
        return mapper.changeReported(id, val);
    }

}
