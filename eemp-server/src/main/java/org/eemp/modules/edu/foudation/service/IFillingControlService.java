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

    JSONObject getFillingControl(String identificationCode, String packageName, Date inDate, long extendSecs);
}