package org.eemp.modules.edu.statistics.mapper;

import org.apache.ibatis.annotations.Param;
import org.eemp.modules.edu.statistics.entity.EduInformatizationEquipInfo_8;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @Description: 教育信息化配备情况统计表（八）
 * @Date:   2023-07-15
 * @Version: V1.0
 */
public interface EduInformatizationEquipInfo_8Mapper extends BaseMapper<EduInformatizationEquipInfo_8> {

    List<Map<String,Object>> getClassNumberInfo(@Param("dayStart") Date dayStart, @Param("dayEnd") Date dayEnd, @Param("dbType") String dbType);

}
