package org.eemp.modules.edu.statistics.mapper;

import org.apache.ibatis.annotations.Param;
import org.eemp.modules.edu.statistics.entity.EduInformatizationBasicInfo_1;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @Description: 教育信息化基本情况统计表（一）
 * @Date:   2023-06-04
 * @Version: V1.0
 */
public interface EduInformatizationBasicInfo_1Mapper extends BaseMapper<EduInformatizationBasicInfo_1> {

    List<Map<String,Object>> findNewestYearlyRecord(@Param("dayStart") Date dayStart, @Param("dayEnd") Date dayEnd, @Param("dbType") String dbType);

}
