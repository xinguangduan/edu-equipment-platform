package org.eemp.modules.edu.register.service.impl;

import org.eemp.modules.edu.register.entity.PsMusicEquipmentFile;
import org.eemp.modules.edu.register.mapper.PsMusicEquipmentFileMapper;
import org.eemp.modules.edu.register.service.IPsMusicEquipmentFileService;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import javax.annotation.Resource;

/**
 * @Description: 小学音乐教学装备配置文件
 * @Date:   2023-11-20
 * @Version: V1.0
 */
@Service
public class PsMusicEquipmentFileServiceImpl extends ServiceImpl<PsMusicEquipmentFileMapper, PsMusicEquipmentFile> implements IPsMusicEquipmentFileService {
    @Resource
    private PsMusicEquipmentFileMapper mapper;

    @Override
    public int changeReported(String id, int val) {
        return mapper.changeReported(id, val);
    }

}
