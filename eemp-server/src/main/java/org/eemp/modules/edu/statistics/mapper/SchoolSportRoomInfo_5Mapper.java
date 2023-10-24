package org.eemp.modules.edu.statistics.mapper;

import org.apache.ibatis.annotations.Update;
import org.eemp.modules.edu.statistics.entity.SchoolSportRoomInfo_5;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * @Description: 中小学体育用房统计表（五）
 * @Date:   2023-07-15
 * @Version: V1.0
 */
public interface SchoolSportRoomInfo_5Mapper extends BaseMapper<SchoolSportRoomInfo_5> {

    @Update("UPDATE school_sport_room_info_5 SET reported=#{val} WHERE id=#{id}")
    int changeReported(String id, int val);

}
