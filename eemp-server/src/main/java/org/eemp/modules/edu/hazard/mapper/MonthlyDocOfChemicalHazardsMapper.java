package org.eemp.modules.edu.hazard.mapper;

import org.apache.ibatis.annotations.Update;
import org.eemp.modules.edu.hazard.entity.MonthlyDocOfChemicalHazards;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * @Description: 实验室安全防护与化学危险品管理月报表
 * @Date:   2023-11-22
 * @Version: V1.0
 */
public interface MonthlyDocOfChemicalHazardsMapper extends BaseMapper<MonthlyDocOfChemicalHazards> {

    @Update("UPDATE monthly_doc_of_chemical_hazards SET reported=#{val} WHERE id=#{id}")
    int changeReported(String id, int val);

}
