package org.eemp.modules.edu.statistics.mapper;

import org.apache.ibatis.annotations.Update;
import org.eemp.modules.edu.statistics.entity.SchoolFunctionalRoomInfo_7;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * @Description: 中小学功能室用房统计表（七）
 * @Date:   2023-07-15
 * @Version: V1.0
 */
public interface SchoolFunctionalRoomInfo_7Mapper extends BaseMapper<SchoolFunctionalRoomInfo_7> {

    @Update("UPDATE school_functional_room_info_7 SET reported=#{val} WHERE id=#{id}")
    int changeReported(String id, int val);

}
