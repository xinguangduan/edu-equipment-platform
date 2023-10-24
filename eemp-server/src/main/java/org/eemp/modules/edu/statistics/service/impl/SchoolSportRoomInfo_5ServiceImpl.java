package org.eemp.modules.edu.statistics.service.impl;

import org.eemp.modules.edu.statistics.entity.SchoolSportRoomInfo_5;
import org.eemp.modules.edu.statistics.mapper.SchoolSportRoomInfo_5Mapper;
import org.eemp.modules.edu.statistics.service.ISchoolSportRoomInfo_5Service;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import javax.annotation.Resource;

/**
 * @Description: 中小学体育用房统计表（五）
 * @Date:   2023-07-15
 * @Version: V1.0
 */
@Service
public class SchoolSportRoomInfo_5ServiceImpl extends ServiceImpl<SchoolSportRoomInfo_5Mapper, SchoolSportRoomInfo_5> implements ISchoolSportRoomInfo_5Service {
    @Resource
    private SchoolSportRoomInfo_5Mapper mapper;

    @Override
    public int changeReported(String id, int val) {
        return mapper.changeReported(id, val);
    }

}
