package org.eemp.modules.edu.foudation.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import org.eemp.modules.edu.foudation.entity.FillingControl;
import org.eemp.modules.edu.foudation.mapper.FillingControlMapper;
import org.eemp.modules.edu.foudation.service.IFillingControlService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import org.eemp.common.util.RedisUtil;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import java.util.Date;

/**
 * @Description: 填报控制
 * @Date:   2023-09-14
 * @Version: V1.0
 */
@Service
public class FillingControlServiceImpl extends ServiceImpl<FillingControlMapper, FillingControl> implements IFillingControlService {
    @Autowired
    private FillingControlMapper mapper;
    @Autowired
    private RedisUtil redisUtil;

    @Override
    public JSONObject getFillingControl(String identificationCode, String packageName, Date inDate) {
        String key = "fc-" + identificationCode + "-" + packageName;
        JSONObject fc_record = (JSONObject)redisUtil.get(key);
        if (null == fc_record) {
            buildFillingControl(identificationCode, packageName, inDate);
        }

        return (JSONObject)redisUtil.get(key);
    }

    private void buildFillingControl(String identificationCode, String packageName, Date inDate) {
        LambdaQueryWrapper<FillingControl> wrapper = new LambdaQueryWrapper<>();
        wrapper.orderByDesc(FillingControl::getStartDate, FillingControl::getEndDate);
        wrapper.le(FillingControl::getStartDate, inDate);
        wrapper.ge(FillingControl::getEndDate, inDate);
        wrapper.last("LIMIT 1");
        FillingControl fc = mapper.selectOne(wrapper);

        if (null != fc) {
            String key = "fc-" + identificationCode + "-" + packageName;
            JSONObject fc_record = new JSONObject();
            fc_record.put("fillingCode", fc.getFillingCode());
            fc_record.put("startDate", fc.getStartDate());
            fc_record.put("endDate", fc.getEndDate());
            redisUtil.set(key, fc_record, (fc.getEndDate().compareTo(inDate) / 1000) + 14 * 24 * 3600);
        }
    }
}
