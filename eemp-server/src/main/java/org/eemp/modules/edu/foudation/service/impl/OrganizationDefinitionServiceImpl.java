package org.eemp.modules.edu.foudation.service.impl;

import com.baomidou.mybatisplus.annotation.DbType;
import org.eemp.common.util.CommonUtils;
import org.eemp.modules.edu.foudation.entity.OrganizationDefinition;
import org.eemp.modules.edu.foudation.mapper.OrganizationDefinitionMapper;
import org.eemp.modules.edu.foudation.service.IOrganizationDefinitionService;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Description: 学校管理
 * @Date:   2023-06-03
 * @Version: V1.0
 */
@Service
public class OrganizationDefinitionServiceImpl extends ServiceImpl<OrganizationDefinitionMapper, OrganizationDefinition> implements IOrganizationDefinitionService {
    @Resource
    private OrganizationDefinitionMapper mapper;

    @Override
    public List<OrganizationDefinition> getImportedExcelRecords() {
        DbType dbType = CommonUtils.getDatabaseTypeEnum();
        return mapper.getImportedExcelRecords(dbType.getDb());
    }

}
