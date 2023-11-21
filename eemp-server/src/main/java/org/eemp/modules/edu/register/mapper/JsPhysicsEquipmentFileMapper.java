package org.eemp.modules.edu.register.mapper;

import org.apache.ibatis.annotations.Update;
import org.eemp.modules.edu.register.entity.JsPhysicsEquipmentFile;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * @Description: 初中物理教学装备配置文件
 * @Date:   2023-11-20
 * @Version: V1.0
 */
public interface JsPhysicsEquipmentFileMapper extends BaseMapper<JsPhysicsEquipmentFile> {

    @Update("UPDATE js_physics_equipment_file SET reported=#{val} WHERE id=#{id}")
    int changeReported(String id, int val);

}
