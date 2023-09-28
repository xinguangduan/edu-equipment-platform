package org.eemp.modules.edu.statistics.mapper;

import org.apache.ibatis.annotations.Update;
import org.eemp.modules.edu.statistics.entity.EduInformatizationBasicInfo_2;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * @Description: 教育信息化基本情况统计表（二）
 * @Date:   2023-07-07
 * @Version: V1.0
 */
public interface EduInformatizationBasicInfo_2Mapper extends BaseMapper<EduInformatizationBasicInfo_2> {

    @Update("UPDATE edu_informatization_basic_info_2 SET reported=#{val} WHERE id=#{id}")
    int changeReported(String id, int val);

}
