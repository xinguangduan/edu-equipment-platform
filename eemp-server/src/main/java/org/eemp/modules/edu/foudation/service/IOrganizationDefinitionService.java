package org.eemp.modules.edu.foudation.service;

import org.eemp.modules.edu.foudation.entity.OrganizationDefinition;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * @Description: 学校管理
 * @Date:   2023-06-03
 * @Version: V1.0
 */
public interface IOrganizationDefinitionService extends IService<OrganizationDefinition> {

    List<OrganizationDefinition> getImportedExcelRecords();

    void checkAndUpdateSchoolUser(String username);
}
