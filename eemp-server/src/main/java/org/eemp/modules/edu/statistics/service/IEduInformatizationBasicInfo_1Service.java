package org.eemp.modules.edu.statistics.service;

import org.eemp.modules.edu.statistics.entity.EduInformatizationBasicInfo_1;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @Description: 教育信息化基本情况统计表（一）
 * @Date:   2023-06-04
 * @Version: V1.0
 */
public interface IEduInformatizationBasicInfo_1Service extends IService<EduInformatizationBasicInfo_1> {

    List<Map<String,Object>> getTeacherNumberInfo(Date dayStart, Date dayEnd);
}
