package org.eemp.modules.edu.register.service.impl;

import org.eemp.modules.edu.register.entity.PsArtEquipmentFile;
import org.eemp.modules.edu.register.mapper.PsArtEquipmentFileMapper;
import org.eemp.modules.edu.register.service.IPsArtEquipmentFileService;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import javax.annotation.Resource;

/**
 * @Description: 小学美术教学装备配置文件
 * @Date:   2023-11-20
 * @Version: V1.0
 */
@Service
public class PsArtEquipmentFileServiceImpl extends ServiceImpl<PsArtEquipmentFileMapper, PsArtEquipmentFile> implements IPsArtEquipmentFileService {
    @Resource
    private PsArtEquipmentFileMapper mapper;

    @Override
    public int changeReported(String id, int val) {
        return mapper.changeReported(id, val);
    }

}
