package org.eemp.modules.school.service;

import java.util.List;

import com.baomidou.mybatisplus.extension.service.IService;
import org.eemp.modules.school.entity.SchoolBasicInfo;

/**
 * @Description: 学校基本信息
 * @Author: jeecg-boot
 * @Date:   2023-02-24
 * @Version: V1.0
 */
public interface ISchoolBasicInfoService extends IService<SchoolBasicInfo> {
    List<SchoolBasicInfo> selectByMainId(String id);
}
