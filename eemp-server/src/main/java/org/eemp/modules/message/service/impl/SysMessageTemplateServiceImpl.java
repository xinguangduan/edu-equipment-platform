package org.eemp.modules.message.service.impl;

import java.util.List;

import org.eemp.common.system.base.service.impl.JeecgServiceImpl;
import org.eemp.modules.message.entity.SysMessageTemplate;
import org.eemp.modules.message.mapper.SysMessageTemplateMapper;
import org.eemp.modules.message.service.ISysMessageTemplateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Description: 消息模板
 * @Author: jeecg-boot
 * @Date: 2019-04-09
 * @Version: V1.0
 */
@Service
public class SysMessageTemplateServiceImpl extends JeecgServiceImpl<SysMessageTemplateMapper, SysMessageTemplate> implements ISysMessageTemplateService {

    @Autowired
    private SysMessageTemplateMapper sysMessageTemplateMapper;


    @Override
    public List<SysMessageTemplate> selectByCode(String code) {
        return sysMessageTemplateMapper.selectByCode(code);
    }
}
