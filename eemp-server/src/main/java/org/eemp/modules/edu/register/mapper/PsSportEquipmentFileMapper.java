package org.eemp.modules.edu.register.mapper;

import org.apache.ibatis.annotations.Update;
import org.eemp.modules.edu.register.entity.PsSportEquipmentFile;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * @Description: 小学体育教学装备配置文件
 * @Date:   2023-11-20
 * @Version: V1.0
 */
public interface PsSportEquipmentFileMapper extends BaseMapper<PsSportEquipmentFile> {

    @Update("UPDATE ps_sport_equipment_file SET reported=#{val} WHERE id=#{id}")
    int changeReported(String id, int val);

}
