package org.eemp.modules.edu.foudation.service;

import com.alibaba.fastjson.JSONObject;
import org.eemp.modules.edu.foudation.entity.FillingControl;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.Date;

/**
 * @Description: 填报控制
 * @Date:   2023-09-14
 * @Version: V1.0
 */
public interface IFillingControlService extends IService<FillingControl> {

    JSONObject getFillingControl(String identificationCode, String packageName);
    JSONObject getFillingControl(String identificationCode, String packageName, Date inDate);
    JSONObject getFillingControl(String identificationCode, String packageName, Date inDate, long extendSecs);

    boolean updateFillingControlAfterNewData(String identificationCode, String packageName, String id);
    boolean updateFillingControlAfterNewData(String identificationCode, String packageName, String id, long extendSecs);

    boolean updateFillingControlAfterReported(String identificationCode, String packageName);

    boolean updateFillingControlAfterRevoked(String identificationCode, String packageName);

    boolean updateFillingControlAfterDeleteData(String identificationCode, String packageName, String id);

    JSONObject getTemplateInfo(String packageName);
    boolean updateTemplateInfo(String packageName, String templateUrl);
}
