package org.eemp.modules.edu.register.mapper;

import org.apache.ibatis.annotations.Update;
import org.eemp.modules.edu.register.entity.PsMathematicsEquipmentFile;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * @Description: 小学数学教学装备配置文件
 * @Date:   2023-10-18
 * @Version: V1.0
 */
public interface PsMathematicsEquipmentFileMapper extends BaseMapper<PsMathematicsEquipmentFile> {

    @Update("UPDATE ps_mathematics_equipment_file SET reported=#{val} WHERE id=#{id}")
    int changeReported(String id, int val);

}
