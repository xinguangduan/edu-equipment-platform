package org.eemp.config;

import lombok.Data;
import org.springframework.stereotype.Component;

/**
 * 设置静态参数初始化
 * @author: jeecg-boot
 */
@Component
@Data
public class StaticConfig {

//    @Value(value = "${spring.mail.username}")
    private String emailFrom;

//    /**
//     * 签名密钥串
//     */
//    @Value(value = "${jeecg.signatureSecret}")
//    private String signatureSecret;


    /*@Bean
    public void initStatic() {
       DySmsHelper.setAccessKeyId(accessKeyId);
       DySmsHelper.setAccessKeySecret(accessKeySecret);
       EmailSendMsgHandle.setEmailFrom(emailFrom);
    }*/

}
