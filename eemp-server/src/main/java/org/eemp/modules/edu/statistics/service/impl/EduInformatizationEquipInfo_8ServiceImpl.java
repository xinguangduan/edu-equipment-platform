package org.eemp.modules.edu.statistics.service.impl;

import com.baomidou.mybatisplus.annotation.DbType;
import org.eemp.common.util.CommonUtils;
import org.eemp.modules.edu.statistics.entity.EduInformatizationEquipInfo_8;
import org.eemp.modules.edu.statistics.mapper.EduInformatizationEquipInfo_8Mapper;
import org.eemp.modules.edu.statistics.service.IEduInformatizationEquipInfo_8Service;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @Description: 教育信息化配备情况统计表（八）
 * @Date:   2023-07-15
 * @Version: V1.0
 */
@Service
public class EduInformatizationEquipInfo_8ServiceImpl extends ServiceImpl<EduInformatizationEquipInfo_8Mapper, EduInformatizationEquipInfo_8> implements IEduInformatizationEquipInfo_8Service {
    @Resource
    private EduInformatizationEquipInfo_8Mapper mapper;

    @Override
    public int changeReported(String id, int val) {
        return mapper.changeReported(id, val);
    }

    @Override
    public List<Map<String,Object>> getClassNumberInfo(Date dayStart, Date dayEnd) {
        DbType dbType = CommonUtils.getDatabaseTypeEnum();
        return mapper.getClassNumberInfoBySchoolType(dayStart, dayEnd,dbType.getDb());
    }

    @Override
    public List<Map<String,Object>> getTeacherComputerNumberInfo(Date dayStart, Date dayEnd) {
        DbType dbType = CommonUtils.getDatabaseTypeEnum();
        return mapper.getTeacherComputerNumberInfoBySchoolType(dayStart, dayEnd,dbType.getDb());
    }

    @Override
    public List<Map<String,Object>> getStudentComputerNumberInfo(Date dayStart, Date dayEnd) {
        DbType dbType = CommonUtils.getDatabaseTypeEnum();
        return mapper.getStudentComputerNumberInfoBySchoolType(dayStart, dayEnd,dbType.getDb());
    }

    @Override
    public List<Map<String,Object>> getClassCommunicationNumberInfo(Date dayStart, Date dayEnd) {
        DbType dbType = CommonUtils.getDatabaseTypeEnum();
        return mapper.getClassCommunicationNumberInfoBySchoolType(dayStart, dayEnd,dbType.getDb());
    }

}
