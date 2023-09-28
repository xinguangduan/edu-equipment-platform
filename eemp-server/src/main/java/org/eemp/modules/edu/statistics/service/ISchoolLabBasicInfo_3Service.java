package org.eemp.modules.edu.statistics.service;

import org.eemp.modules.edu.statistics.entity.SchoolLabBasicInfo_3;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;
import java.util.Map;

/**
 * @Description: 中小学实验室基本情况统计表（三）
 * @Date:   2023-07-07
 * @Version: V1.0
 */
public interface ISchoolLabBasicInfo_3Service extends IService<SchoolLabBasicInfo_3> {

    int changeReported(String id, int val);

    List<Map<String,Object>> getScienceRoomInfo();

    List<Map<String,Object>> getLaboratoryRoomInfo();

}
