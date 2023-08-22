package org.eemp.modules.edu.statistics.service.impl;

import com.baomidou.mybatisplus.annotation.DbType;
import org.eemp.common.util.CommonUtils;
import org.eemp.modules.edu.statistics.entity.SchoolLibraryBasicInfo_4;
import org.eemp.modules.edu.statistics.mapper.SchoolLibraryBasicInfo_4Mapper;
import org.eemp.modules.edu.statistics.service.ISchoolLibraryBasicInfo_4Service;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @Description: 中小学图书室（馆）基本情况统计表（四）
 * @Date:   2023-07-07
 * @Version: V1.0
 */
@Service
public class SchoolLibraryBasicInfo_4ServiceImpl extends ServiceImpl<SchoolLibraryBasicInfo_4Mapper, SchoolLibraryBasicInfo_4> implements ISchoolLibraryBasicInfo_4Service {
    @Resource
    private SchoolLibraryBasicInfo_4Mapper mapper;

    @Override
    public List<Map<String,Object>> getLibraryInfo(Date dayStart, Date dayEnd) {
        DbType dbType = CommonUtils.getDatabaseTypeEnum();
        return mapper.getLibraryInfo(dayStart, dayEnd, dbType.getDb());
    }

}
