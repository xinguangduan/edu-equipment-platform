package org.eemp.modules.edu.statistics.service.impl;

import org.eemp.modules.edu.statistics.entity.SchoolFunctionalRoomInfo_7;
import org.eemp.modules.edu.statistics.mapper.SchoolFunctionalRoomInfo_7Mapper;
import org.eemp.modules.edu.statistics.service.ISchoolFunctionalRoomInfo_7Service;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import javax.annotation.Resource;

/**
 * @Description: 中小学功能室用房统计表（七）
 * @Date:   2023-07-15
 * @Version: V1.0
 */
@Service
public class SchoolFunctionalRoomInfo_7ServiceImpl extends ServiceImpl<SchoolFunctionalRoomInfo_7Mapper, SchoolFunctionalRoomInfo_7> implements ISchoolFunctionalRoomInfo_7Service {
    @Resource
    private SchoolFunctionalRoomInfo_7Mapper mapper;

    @Override
    public int changeReported(String id, int val) {
        return mapper.changeReported(id, val);
    }

}
