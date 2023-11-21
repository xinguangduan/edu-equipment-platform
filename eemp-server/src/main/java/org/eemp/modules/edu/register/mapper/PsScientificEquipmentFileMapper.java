package org.eemp.modules.edu.register.mapper;

import org.apache.ibatis.annotations.Update;
import org.eemp.modules.edu.register.entity.PsScientificEquipmentFile;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * @Description: 小学科学教学装备配置文件
 * @Date:   2023-11-20
 * @Version: V1.0
 */
public interface PsScientificEquipmentFileMapper extends BaseMapper<PsScientificEquipmentFile> {

    @Update("UPDATE ps_scientific_equipment_file SET reported=#{val} WHERE id=#{id}")
    int changeReported(String id, int val);

}
