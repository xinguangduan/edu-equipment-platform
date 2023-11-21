package org.eemp.modules.edu.register.service.impl;

import org.eemp.modules.edu.register.entity.PsSportEquipmentFile;
import org.eemp.modules.edu.register.mapper.PsSportEquipmentFileMapper;
import org.eemp.modules.edu.register.service.IPsSportEquipmentFileService;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import javax.annotation.Resource;

/**
 * @Description: 小学体育教学装备配置文件
 * @Date:   2023-11-20
 * @Version: V1.0
 */
@Service
public class PsSportEquipmentFileServiceImpl extends ServiceImpl<PsSportEquipmentFileMapper, PsSportEquipmentFile> implements IPsSportEquipmentFileService {
    @Resource
    private PsSportEquipmentFileMapper mapper;

    @Override
    public int changeReported(String id, int val) {
        return mapper.changeReported(id, val);
    }

}
