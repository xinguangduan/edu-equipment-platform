package org.eemp.modules.edu.statistics.mapper;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;
import org.eemp.modules.edu.statistics.entity.SchoolLibraryBasicInfo_4;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @Description: 中小学图书室（馆）基本情况统计表（四）
 * @Date:   2023-07-07
 * @Version: V1.0
 */
public interface SchoolLibraryBasicInfo_4Mapper extends BaseMapper<SchoolLibraryBasicInfo_4> {

    @Update("UPDATE school_library_basic_info_4 SET reported=#{val} WHERE id=#{id}")
    int changeReported(String id, int val);

    List<Map<String,Object>> getLibraryInfo(@Param("dayStart") Date dayStart, @Param("dayEnd") Date dayEnd, @Param("dbType") String dbType);

}
