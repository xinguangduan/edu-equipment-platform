package org.eemp.modules.edu.hazard.service;

import org.eemp.modules.edu.hazard.entity.SigningOfSecurityResponsibility;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * @Description: 安全责任书签订
 * @Date:   2023-11-29
 * @Version: V1.0
 */
public interface ISigningOfSecurityResponsibilityService extends IService<SigningOfSecurityResponsibility> {

    int changeReported(String id, int val);

}
