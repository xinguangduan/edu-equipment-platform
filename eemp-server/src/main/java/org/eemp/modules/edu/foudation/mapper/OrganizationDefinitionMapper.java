package org.eemp.modules.edu.foudation.mapper;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;
import org.eemp.modules.edu.foudation.entity.OrganizationDefinition;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
 * @Description: 学校管理
 * @Date:   2023-06-03
 * @Version: V1.0
 */
public interface OrganizationDefinitionMapper extends BaseMapper<OrganizationDefinition> {

    List<OrganizationDefinition> getImportedExcelRecords(@Param("dbType") String dbType);

    @Update("UPDATE organization_definition SET last_login_time=now() WHERE admin_code=#{adminCode}")
    int updateLastLoginTimeByAdminCode(String adminCode);
}
