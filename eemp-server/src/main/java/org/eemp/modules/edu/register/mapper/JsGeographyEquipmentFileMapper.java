package org.eemp.modules.edu.register.mapper;

import org.apache.ibatis.annotations.Update;
import org.eemp.modules.edu.register.entity.JsGeographyEquipmentFile;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * @Description: 初中地理教学装备配置文件
 * @Date:   2023-11-20
 * @Version: V1.0
 */
public interface JsGeographyEquipmentFileMapper extends BaseMapper<JsGeographyEquipmentFile> {

    @Update("UPDATE js_geography_equipment_file SET reported=#{val} WHERE id=#{id}")
    int changeReported(String id, int val);

}
