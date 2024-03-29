package org.eemp.modules.system.service;

import java.util.List;

import com.baomidou.mybatisplus.extension.service.IService;
import org.eemp.modules.system.entity.SysDepartPermission;
import org.eemp.modules.system.entity.SysPermissionDataRule;

/**
 * @Description: 部门权限表
 * @Author: jeecg-boot
 * @Date:   2020-02-11
 * @Version: V1.0
 */
public interface ISysDepartPermissionService extends IService<SysDepartPermission> {
    /**
     * 保存授权 将上次的权限和这次作比较 差异处理提高效率
     * @param departId
     * @param permissionIds
     * @param lastPermissionIds
     */
    public void saveDepartPermission(String departId,String permissionIds,String lastPermissionIds);

    /**
     * 根据部门id，菜单id获取数据规则
     * @param permissionId 菜单id
     * @param departId 部门id
     * @return
     */
    List<SysPermissionDataRule> getPermRuleListByDeptIdAndPermId(String departId,String permissionId);
}
