package org.eemp.modules.system.mapper;

import java.util.List;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Param;
import org.eemp.modules.system.entity.SysUser;
import org.eemp.modules.system.entity.SysUserDepart;

/**
 * @Description: 用户部门mapper接口
 * @author: jeecg-boot
 */
public interface SysUserDepartMapper extends BaseMapper<SysUserDepart>{

    /**
     * 通过用户id查询部门用户
     * @param userId 用户id
     * @return List<SysUserDepart>
     */
	List<SysUserDepart> getUserDepartByUid(@Param("userId") String userId);

	/**
	 *  查询指定部门下的用户 并且支持用户真实姓名模糊查询
	 * @param orgCode
	 * @param realname
	 * @return
	 */
	List<SysUser> queryDepartUserList(@Param("orgCode") String orgCode, @Param("realname") String realname);

	/**
	 * 根据部门查询部门用户
	 * @param page
	 * @param orgCode
	 * @param username
	 * @param realname
	 * @return
	 */
	IPage<SysUser> queryDepartUserPageList(Page<SysUser> page, @Param("orgCode") String orgCode, @Param("username") String username, @Param("realname") String realname);

    /**
     * 获取用户信息
     * @param page
     * @param orgCode
     * @param keyword
     * @return
     */
    IPage<SysUser> getUserInformation(Page<SysUser> page,  @Param("orgCode") String orgCode,  @Param("keyword") String keyword,@Param("userId") String userId);


	/**
	 * 获取用户信息
	 * @param page
	 * @param orgCode
	 * @param keyword
	 * @return
	 */
	IPage<SysUser> getProcessUserList(Page<SysUser> page,  @Param("orgCode") String orgCode,  @Param("keyword") String keyword,  @Param("tenantId") Integer tenantId);

	/**
	 * 获取租户下的部门通过前台传过来的部门id
	 * @param departIds
	 * @param tenantId
	 * @return
	 */
    List<String> getTenantDepart(@Param("departIds") List<String> departIds, @Param("tenantId") String tenantId);

	/**
	 * 根据当前租户和用户id查询用户部门数据
	 * @param userId
	 * @param tenantId
	 * @return
	 */
	List<SysUserDepart> getTenantUserDepart(@Param("userId") String userId, @Param("tenantId") String tenantId);

	/**
	 * 根据用户id和租户id,删除用户部门数据
	 * @param userId
	 * @param tenantId
	 */
	void deleteUserDepart(@Param("userId") String userId, @Param("tenantId") String tenantId);
}
