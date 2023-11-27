package org.eemp.modules.edu.hazard.service;

import org.eemp.modules.edu.hazard.entity.MonthlyDocOfChemicalHazards;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * @Description: 实验室安全防护与化学危险品管理月报表
 * @Date:   2023-11-22
 * @Version: V1.0
 */
public interface IMonthlyDocOfChemicalHazardsService extends IService<MonthlyDocOfChemicalHazards> {

    int changeReported(String id, int val);

}
