package org.eemp.modules.edu.hazard.service.impl;

import org.eemp.modules.edu.hazard.entity.SigningOfSecurityResponsibility;
import org.eemp.modules.edu.hazard.mapper.SigningOfSecurityResponsibilityMapper;
import org.eemp.modules.edu.hazard.service.ISigningOfSecurityResponsibilityService;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import javax.annotation.Resource;

/**
 * @Description: 安全责任书签订
 * @Date:   2023-11-29
 * @Version: V1.0
 */
@Service
public class SigningOfSecurityResponsibilityServiceImpl extends ServiceImpl<SigningOfSecurityResponsibilityMapper, SigningOfSecurityResponsibility> implements ISigningOfSecurityResponsibilityService {

    @Resource
    private SigningOfSecurityResponsibilityMapper mapper;

    @Override
    public int changeReported(String id, int val) {
        return mapper.changeReported(id, val);
    }

}
