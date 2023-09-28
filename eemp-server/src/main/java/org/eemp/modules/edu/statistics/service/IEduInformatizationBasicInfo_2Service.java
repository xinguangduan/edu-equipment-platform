package org.eemp.modules.edu.statistics.service;

import org.eemp.modules.edu.statistics.entity.EduInformatizationBasicInfo_2;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * @Description: 教育信息化基本情况统计表（二）
 * @Date:   2023-07-07
 * @Version: V1.0
 */
public interface IEduInformatizationBasicInfo_2Service extends IService<EduInformatizationBasicInfo_2> {

    int changeReported(String id, int val);

}
