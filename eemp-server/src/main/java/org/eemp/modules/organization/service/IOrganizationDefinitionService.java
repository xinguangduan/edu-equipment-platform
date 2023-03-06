package org.eemp.modules.organization.service;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;

import com.baomidou.mybatisplus.extension.service.IService;
import org.eemp.modules.organization.entity.OrganizationDefinition;
import org.eemp.modules.school.entity.SchoolBasicInfo;

/**
 * @Description: 机构组织定义，含层级、联系信息
 * @Author: jeecg-boot
 * @Date:   2023-02-24
 * @Version: V1.0
 */
public interface IOrganizationDefinitionService extends IService<OrganizationDefinition> {

	/**
	 * 添加一对多
	 *
	 * @param organizationDefinition
	 * @param schoolBasicInfoList
	 */
	public void saveMain(OrganizationDefinition organizationDefinition,List<SchoolBasicInfo> schoolBasicInfoList) ;
	
	/**
	 * 修改一对多
	 *
   * @param organizationDefinition
   * @param schoolBasicInfoList
	 */
	public void updateMain(OrganizationDefinition organizationDefinition,List<SchoolBasicInfo> schoolBasicInfoList);
	
	/**
	 * 删除一对多
	 *
	 * @param id
	 */
	public void delMain (String id);
	
	/**
	 * 批量删除一对多
	 *
	 * @param idList
	 */
	public void delBatchMain (Collection<? extends Serializable> idList);
	
}
