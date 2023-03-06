package org.eemp.modules.school.service.impl;

import java.util.List;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.eemp.modules.school.entity.SchoolBasicInfo;
import org.eemp.modules.school.mapper.SchoolBasicInfoMapper;
import org.eemp.modules.school.service.ISchoolBasicInfoService;
import org.springframework.stereotype.Service;

/**
 * @Description: 学校基本信息
 * @Author: jeecg-boot
 * @Date:   2023-02-24
 * @Version: V1.0
 */
@Service
public class SchoolBasicInfoServiceImpl extends ServiceImpl<SchoolBasicInfoMapper, SchoolBasicInfo> implements ISchoolBasicInfoService {

    @Override
    public List<SchoolBasicInfo> selectByMainId(String id) {
        return null;
    }
}
