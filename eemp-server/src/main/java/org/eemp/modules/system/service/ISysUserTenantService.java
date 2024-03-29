package org.eemp.modules.system.service;

import java.util.List;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import org.eemp.modules.system.entity.SysUser;
import org.eemp.modules.system.entity.SysUserTenant;
import org.eemp.modules.system.vo.SysUserTenantVo;

/**
 * @Description: sys_user_tenant_relation
 * @Author: jeecg-boot
 * @Date:   2022-12-23
 * @Version: V1.0
 */
public interface ISysUserTenantService extends IService<SysUserTenant> {

    /**
     * 通过租户id获取数据
     * @param page
     * @param userTenantId
     * @param user
     * @return
     */
    Page<SysUser> getPageUserList(Page<SysUser> page, Integer userTenantId, SysUser user);

    /**
     * 设置租户id
     * @param records
     * @return
     */
    List<SysUser> setUserTenantIds(List<SysUser> records);

    /**
     * 获取用户id根据用户id
     * @param tenantId
     * @return
     */
    List<String> getUserIdsByTenantId(Integer tenantId);

    /**
     * 通过用户id获取租户ids
     * @param userId
     * @return
     */
    List<Integer> getTenantIdsByUserId(String userId);
    
    /**
     * 通过用户id获取租户列表
     * @param userId
     * @param userTenantStatus
     * @return
     */
    List<SysUserTenantVo> getTenantListByUserId(String userId, List<String>  userTenantStatus);
    
    /**
     * 更新用户租户状态
     * @param id
     * @param tenantId
     * @param userTenantStatus
     */
    void updateUserTenantStatus(String id, String tenantId, String userTenantStatus);

    /**
     * 联查用户和租户审核状态
     * @param page
     * @param status 租户用户状态，默认为1正常
     * @param user
     * @return
     */
    IPage<SysUserTenantVo> getUserTenantPageList(Page<SysUserTenantVo> page, List<String> status, SysUser user, Integer tenantId);

    /**
     * 取消离职
     * @param userIds
     * @param tenantId
     */
    void putCancelQuit(List<String> userIds, Integer tenantId);

    /**
     * 验证用户是否已存在
     * @param userId
     * @param tenantId
     * @return
     */
    Integer userTenantIzExist(String userId, Integer tenantId);
}
