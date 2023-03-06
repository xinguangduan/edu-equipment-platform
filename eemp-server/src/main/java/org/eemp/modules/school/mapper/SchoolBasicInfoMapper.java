package org.eemp.modules.school.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.eemp.modules.school.entity.SchoolBasicInfo;

/**
 * @Description: 学校基本信息
 * @Author: jeecg-boot
 * @Date:   2023-02-24
 * @Version: V1.0
 */
public interface SchoolBasicInfoMapper extends BaseMapper<SchoolBasicInfo> {
   void deleteByMainId(String id);
}
