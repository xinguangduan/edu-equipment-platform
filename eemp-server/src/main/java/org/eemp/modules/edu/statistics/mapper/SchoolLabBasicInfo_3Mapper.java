package org.eemp.modules.edu.statistics.mapper;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;
import org.eemp.modules.edu.statistics.entity.SchoolLabBasicInfo_3;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;
import java.util.Map;

/**
 * @Description: 中小学实验室基本情况统计表（三）
 * @Date:   2023-07-07
 * @Version: V1.0
 */
public interface SchoolLabBasicInfo_3Mapper extends BaseMapper<SchoolLabBasicInfo_3> {

    @Update("UPDATE school_lab_basic_info_3 SET reported=#{val} WHERE id=#{id}")
    int changeReported(String id, int val);

    List<Map<String,Object>> getScienceRoomInfo(@Param("dbType") String dbType);

    List<Map<String,Object>> getLaboratoryRoomInfo(@Param("dbType") String dbType);

}
