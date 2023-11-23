package org.eemp.modules.edu.statistics.mapper;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;
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

    @Update("UPDATE edu_informatization_basic_info_1 SET reported=#{val} WHERE id=#{id}")
    int changeReported(String id, int val);

    List<Map<String,Object>> findNewestYearlyRecord(@Param("dayStart") Date dayStart, @Param("dayEnd") Date dayEnd, @Param("dbType") String dbType);
    List<Map<String,Object>> findNewestSemesterlyRecord(@Param("dayStart") Date dayStart, @Param("dayEnd") Date dayEnd, @Param("dbType") String dbType);
    List<Map<String,Object>> getTeacherNumberInfo(@Param("dayStart") Date dayStart, @Param("dayEnd") Date dayEnd, @Param("dbType") String dbType);
    List<Map<String,Object>> getStudentNumberInfo(@Param("dayStart") Date dayStart, @Param("dayEnd") Date dayEnd, @Param("dbType") String dbType);
    List<Map<String,Object>> getCentralRoomInfo(@Param("dbType") String dbType);

    List<Map<String,Object>> getTeacherNumberInfoBySchoolType(@Param("dayStart") Date dayStart, @Param("dayEnd") Date dayEnd, @Param("dbType") String dbType);
    List<Map<String,Object>> getStudentNumberInfoBySchoolType(@Param("dayStart") Date dayStart, @Param("dayEnd") Date dayEnd, @Param("dbType") String dbType);
}
