package org.eemp.modules.edu.hazard.mapper;

import org.apache.ibatis.annotations.Update;
import org.eemp.modules.edu.hazard.entity.SigningOfSecurityResponsibility;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * @Description: 安全责任书签订
 * @Date:   2023-11-29
 * @Version: V1.0
 */
public interface SigningOfSecurityResponsibilityMapper extends BaseMapper<SigningOfSecurityResponsibility> {

    @Update("UPDATE signing_of_security_responsibility SET reported=#{val} WHERE id=#{id}")
    int changeReported(String id, int val);

}
