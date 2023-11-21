package org.eemp.modules.edu.register.mapper;

import org.apache.ibatis.annotations.Update;
import org.eemp.modules.edu.register.entity.JsArtEquipmentFile;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * @Description: 初中美术教学装备配置文件
 * @Date:   2023-11-20
 * @Version: V1.0
 */
public interface JsArtEquipmentFileMapper extends BaseMapper<JsArtEquipmentFile> {

    @Update("UPDATE js_art_equipment_file SET reported=#{val} WHERE id=#{id}")
    int changeReported(String id, int val);

}
