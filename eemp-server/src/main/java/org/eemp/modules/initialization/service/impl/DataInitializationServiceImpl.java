package org.eemp.modules.initialization.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.eemp.modules.initialization.entity.DataInitialization;
import org.eemp.modules.initialization.mapper.DataInitializationMapper;
import org.eemp.modules.initialization.service.IDataInitializationService;
import org.springframework.stereotype.Service;

/**
 * @Description: 数据初始化
 * @Author: jeecg-boot
 * @Date:   2023-02-28
 * @Version: V1.0
 */
@Service
public class DataInitializationServiceImpl extends ServiceImpl<DataInitializationMapper, DataInitialization> implements IDataInitializationService {

}
