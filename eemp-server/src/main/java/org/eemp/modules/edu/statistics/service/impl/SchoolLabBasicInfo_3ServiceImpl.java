package org.eemp.modules.edu.statistics.service.impl;

import com.baomidou.mybatisplus.annotation.DbType;
import org.eemp.common.util.CommonUtils;
import org.eemp.modules.edu.statistics.entity.SchoolLabBasicInfo_3;
import org.eemp.modules.edu.statistics.mapper.SchoolLabBasicInfo_3Mapper;
import org.eemp.modules.edu.statistics.service.ISchoolLabBasicInfo_3Service;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * @Description: 中小学实验室基本情况统计表（三）
 * @Date:   2023-07-07
 * @Version: V1.0
 */
@Service
public class SchoolLabBasicInfo_3ServiceImpl extends ServiceImpl<SchoolLabBasicInfo_3Mapper, SchoolLabBasicInfo_3> implements ISchoolLabBasicInfo_3Service {
    @Resource
    private SchoolLabBasicInfo_3Mapper mapper;

    @Override
    public List<Map<String,Object>> getScienceRoomInfo() {
        DbType dbType = CommonUtils.getDatabaseTypeEnum();
        return mapper.getScienceRoomInfo(dbType.getDb());
    }

    @Override
    public List<Map<String,Object>> getLaboratoryRoomInfo() {
        DbType dbType = CommonUtils.getDatabaseTypeEnum();
        return mapper.getLaboratoryRoomInfo(dbType.getDb());
    }
}
