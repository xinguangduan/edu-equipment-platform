package org.eemp.modules.system.mapper;

import java.util.List;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;
import org.eemp.modules.system.entity.SysPackPermission;

/**
 * @Description: 产品包菜单关系表
 * @Author: jeecg-boot
 * @Date:   2022-12-31
 * @Version: V1.0
 */
public interface SysPackPermissionMapper extends BaseMapper<SysPackPermission> {

    /**
     * 通过产品包id获取菜单id
     * @param packId
     * @return
     */
    List<String> getPermissionsByPackId(@Param("packId") String packId);
}
