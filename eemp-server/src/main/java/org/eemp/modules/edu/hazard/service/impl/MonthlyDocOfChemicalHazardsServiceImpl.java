package org.eemp.modules.edu.hazard.service.impl;

import org.eemp.modules.edu.hazard.entity.MonthlyDocOfChemicalHazards;
import org.eemp.modules.edu.hazard.mapper.MonthlyDocOfChemicalHazardsMapper;
import org.eemp.modules.edu.hazard.service.IMonthlyDocOfChemicalHazardsService;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import javax.annotation.Resource;

/**
 * @Description: 实验室安全防护与化学危险品管理月报表
 * @Date:   2023-11-22
 * @Version: V1.0
 */
@Service
public class MonthlyDocOfChemicalHazardsServiceImpl extends ServiceImpl<MonthlyDocOfChemicalHazardsMapper, MonthlyDocOfChemicalHazards> implements IMonthlyDocOfChemicalHazardsService {
    @Resource
    private MonthlyDocOfChemicalHazardsMapper mapper;

    @Override
    public int changeReported(String id, int val) {
        return mapper.changeReported(id, val);
    }

}
