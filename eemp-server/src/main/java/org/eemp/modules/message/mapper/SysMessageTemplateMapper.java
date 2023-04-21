package org.eemp.modules.message.mapper;

import java.util.List;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Select;
import org.eemp.modules.message.entity.SysMessageTemplate;

/**
 * @Description: 消息模板
 * @Author: jeecg-boot
 * @Date:  2019-04-09
 * @Version: V1.0
 */
public interface SysMessageTemplateMapper extends BaseMapper<SysMessageTemplate> {

    /**
     * 通过模板CODE查询消息模板
     * @param code 模板CODE
     * @return List<SysMessageTemplate>
     */
    @Select("SELECT * FROM SYS_SMS_TEMPLATE WHERE TEMPLATE_CODE = #{code}")
    List<SysMessageTemplate> selectByCode(String code);
}
