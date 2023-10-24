package org.eemp.modules.edu.statistics.service.impl;

import org.eemp.modules.edu.statistics.entity.SchoolMusicArtRoomInfo_6;
import org.eemp.modules.edu.statistics.mapper.SchoolMusicArtRoomInfo_6Mapper;
import org.eemp.modules.edu.statistics.service.ISchoolMusicArtRoomInfo_6Service;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import javax.annotation.Resource;

/**
 * @Description: 中小学音乐、美术教学用房统计表（六）
 * @Date:   2023-07-15
 * @Version: V1.0
 */
@Service
public class SchoolMusicArtRoomInfo_6ServiceImpl extends ServiceImpl<SchoolMusicArtRoomInfo_6Mapper, SchoolMusicArtRoomInfo_6> implements ISchoolMusicArtRoomInfo_6Service {
    @Resource
    private SchoolMusicArtRoomInfo_6Mapper mapper;

    @Override
    public int changeReported(String id, int val) {
        return mapper.changeReported(id, val);
    }

}
