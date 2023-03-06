package org.eemp.modules.organization.service.impl;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.eemp.modules.organization.entity.OrganizationDefinition;
import org.eemp.modules.organization.mapper.OrganizationDefinitionMapper;
import org.eemp.modules.organization.service.IOrganizationDefinitionService;
import org.eemp.modules.school.entity.SchoolBasicInfo;
import org.eemp.modules.school.mapper.SchoolBasicInfoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @Description: 机构组织定义，含层级、联系信息
 * @Author: jeecg-boot
 * @Date:   2023-02-24
 * @Version: V1.0
 */
@Service
public class OrganizationDefinitionServiceImpl extends ServiceImpl<OrganizationDefinitionMapper, OrganizationDefinition> implements IOrganizationDefinitionService {

	@Autowired
	private OrganizationDefinitionMapper organizationDefinitionMapper;
	@Autowired
	private SchoolBasicInfoMapper schoolBasicInfoMapper;
	
	@Override
	@Transactional(rollbackFor = Exception.class)
	public void saveMain(OrganizationDefinition organizationDefinition, List<SchoolBasicInfo> schoolBasicInfoList) {
		organizationDefinitionMapper.insert(organizationDefinition);
		if(schoolBasicInfoList!=null && schoolBasicInfoList.size()>0) {
			for(SchoolBasicInfo entity:schoolBasicInfoList) {
				//外键设置
				entity.setIdentificationCode(organizationDefinition.getId());
				schoolBasicInfoMapper.insert(entity);
			}
		}
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public void updateMain(OrganizationDefinition organizationDefinition,List<SchoolBasicInfo> schoolBasicInfoList) {
		organizationDefinitionMapper.updateById(organizationDefinition);
		
		//1.先删除子表数据
		schoolBasicInfoMapper.deleteByMainId(organizationDefinition.getId());
		
		//2.子表数据重新插入
		if(schoolBasicInfoList!=null && schoolBasicInfoList.size()>0) {
			for(SchoolBasicInfo entity:schoolBasicInfoList) {
				//外键设置
				entity.setIdentificationCode(organizationDefinition.getId());
				schoolBasicInfoMapper.insert(entity);
			}
		}
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public void delMain(String id) {
		schoolBasicInfoMapper.deleteByMainId(id);
		organizationDefinitionMapper.deleteById(id);
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public void delBatchMain(Collection<? extends Serializable> idList) {
		for(Serializable id:idList) {
			schoolBasicInfoMapper.deleteByMainId(id.toString());
			organizationDefinitionMapper.deleteById(id);
		}
	}
	
}
