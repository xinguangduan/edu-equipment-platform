package org.eemp.modules.edu.register.mapper;

import org.apache.ibatis.annotations.Update;
import org.eemp.modules.edu.register.entity.PsMusicEquipmentFile;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * @Description: 小学音乐教学装备配置文件
 * @Date:   2023-11-20
 * @Version: V1.0
 */
public interface PsMusicEquipmentFileMapper extends BaseMapper<PsMusicEquipmentFile> {

    @Update("UPDATE ps_music_equipment_file SET reported=#{val} WHERE id=#{id}")
    int changeReported(String id, int val);

}