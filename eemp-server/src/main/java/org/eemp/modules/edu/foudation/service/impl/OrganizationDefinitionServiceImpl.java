package org.eemp.modules.edu.foudation.service.impl;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.annotation.DbType;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
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
    public OrganizationDefinition getSchoolRecordByAdminCode(String adminCode) {
        LambdaQueryWrapper<OrganizationDefinition> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(OrganizationDefinition::getAdminCode, adminCode);
        OrganizationDefinition rec = getOne(wrapper);

        return rec;
    }

    @Override
    public List<OrganizationDefinition> getImportedExcelRecords() {
        DbType dbType = CommonUtils.getDatabaseTypeEnum();
        return mapper.getImportedExcelRecords(dbType.getDb());
    }

    @Override
    public JSONArray getSchoolTreeData() {
        JSONArray tree = new JSONArray();

        buildSubSchoolTree(tree, "ns", "幼儿园", 11);
        buildSubSchoolTree(tree, "cps", "中心小学", 12);
        buildSubSchoolTree(tree, "fps", "完全小学", 13);
        buildSubSchoolTree(tree, "js", "初中", 14);
        buildSubSchoolTree(tree, "ss", "高中", 15);
        buildSubSchoolTree(tree, "os", "其它", 16);

        return tree;
    }

    private void buildSubSchoolTree(JSONArray tree, String key, String name, int type) {
        JSONObject rec_ns = new JSONObject();
        rec_ns.put("key", key);
        rec_ns.put("title", name);
        JSONArray arr_ns = new JSONArray();
        LambdaQueryWrapper<OrganizationDefinition> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(OrganizationDefinition::getInstitutionType, type);             // 11 - 幼儿园
        for (OrganizationDefinition rec : list(wrapper)) {
            JSONObject child = new JSONObject();
            child.put("key", rec.getIdentificationCode());
            child.put("title", rec.getInstitutionName());
            arr_ns.add(child);
        }
        rec_ns.put("children", arr_ns);
        tree.add(rec_ns);
    }

    @Override
    public void checkAndUpdateSchoolUser(String username) {
        LambdaQueryWrapper<OrganizationDefinition> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(OrganizationDefinition::getAdminCode, username);
        OrganizationDefinition organizationDefinition = getOne(wrapper);
        if(organizationDefinition != null) {
            // 符合学校用户，更新最近访问时间
            mapper.updateLastLoginTimeByAdminCode(username);
        }
    }
}
