package org.eemp.modules.edu.statistics.service.impl;

import com.baomidou.mybatisplus.annotation.DbType;
import org.eemp.common.util.CommonUtils;
import org.eemp.modules.edu.statistics.entity.EduInformatizationBasicInfo_1;
import org.eemp.modules.edu.statistics.mapper.EduInformatizationBasicInfo_1Mapper;
import org.eemp.modules.edu.statistics.service.IEduInformatizationBasicInfo_1Service;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @Description: 教育信息化基本情况统计表（一）
 * @Date:   2023-06-04
 * @Version: V1.0
 */
@Service
public class EduInformatizationBasicInfo_1ServiceImpl extends ServiceImpl<EduInformatizationBasicInfo_1Mapper, EduInformatizationBasicInfo_1> implements IEduInformatizationBasicInfo_1Service {
    @Resource
    private EduInformatizationBasicInfo_1Mapper mapper;

    @Override
    public List<Map<String,Object>> getTeacherNumberInfo(Date dayStart, Date dayEnd) {
        DbType dbType = CommonUtils.getDatabaseTypeEnum();
        return mapper.getTeacherNumberInfo(dayStart, dayEnd, dbType.getDb());
    }

    @Override
    public List<Map<String,Object>> getStudentNumberInfo(Date dayStart, Date dayEnd) {
        DbType dbType = CommonUtils.getDatabaseTypeEnum();
        return mapper.getStudentNumberInfo(dayStart, dayEnd, dbType.getDb());
    }

    @Override
    public List<Map<String,Object>> getCentralRoomInfo() {
        DbType dbType = CommonUtils.getDatabaseTypeEnum();
        return mapper.getCentralRoomInfo(dbType.getDb());
    }
}
