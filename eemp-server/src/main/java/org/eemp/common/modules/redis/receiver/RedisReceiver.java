package org.eemp.common.modules.redis.receiver;


import cn.hutool.core.util.ObjectUtil;
import lombok.Data;
import org.eemp.common.base.BaseMap;
import org.eemp.common.constant.GlobalConstants;
import org.eemp.common.modules.redis.listener.JeecgRedisListener;
import org.eemp.common.util.SpringContextHolder;
import org.springframework.stereotype.Component;

/**
 * @author zyf
 */
@Component
@Data
public class RedisReceiver {


    /**
     * 接受消息并调用业务逻辑处理器
     *
     * @param params
     */
    public void onMessage(BaseMap params) {
        Object handlerName = params.get(GlobalConstants.HANDLER_NAME);
        JeecgRedisListener messageListener = SpringContextHolder.getHandler(handlerName.toString(), JeecgRedisListener.class);
        if (ObjectUtil.isNotEmpty(messageListener)) {
            messageListener.onMessage(params);
        }
    }

}
