package org.eemp.modules.edu.statistics.service;

import org.eemp.modules.edu.statistics.entity.SchoolLibraryBasicInfo_4;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @Description: 中小学图书室（馆）基本情况统计表（四）
 * @Date:   2023-07-07
 * @Version: V1.0
 */
public interface ISchoolLibraryBasicInfo_4Service extends IService<SchoolLibraryBasicInfo_4> {

    int changeReported(String id, int val);

    List<Map<String,Object>> getLibraryInfo(Date dayStart, Date dayEnd);
}
