package org.eemp.modules.system.service;

import java.util.List;

import com.baomidou.mybatisplus.extension.service.IService;
import org.eemp.modules.system.entity.SysDepartRole;

/**
 * @Description: 部门角色
 * @Author: jeecg-boot
 * @Date: 2020-02-12
 * @Version: V1.0
 */
public interface ISysDepartRoleService extends IService<SysDepartRole> {

    /**
     * 根据用户id，部门id查询可授权所有部门角色
     *
     * @param orgCode
     * @param userId
     * @return
     */
    List<SysDepartRole> queryDeptRoleByDeptAndUser(String orgCode, String userId);

}
