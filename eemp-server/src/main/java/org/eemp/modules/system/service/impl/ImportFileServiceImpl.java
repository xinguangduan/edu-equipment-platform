package org.eemp.modules.system.service.impl;

import lombok.extern.slf4j.Slf4j;
import org.eemp.common.poi.excel.imports.base.ImportFileServiceI;
import org.eemp.common.util.CommonUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

/**
 * excel导入 实现类
 * @author: jeecg-boot
 */
@Slf4j
@Service
public class ImportFileServiceImpl implements ImportFileServiceI {

    @Value("${eemp.path.upload}")
    private String upLoadPath;

    @Value(value="${eemp.uploadType}")
    private String uploadType;

    @Override
    public String doUpload(byte[] data) {
        return CommonUtils.uploadOnlineImage(data, upLoadPath, "import", uploadType);
    }
}
