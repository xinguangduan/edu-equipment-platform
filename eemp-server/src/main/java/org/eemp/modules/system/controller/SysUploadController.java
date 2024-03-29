package org.eemp.modules.system.controller;

import javax.servlet.http.HttpServletRequest;

import lombok.extern.slf4j.Slf4j;
import org.eemp.common.api.vo.Result;
import org.eemp.common.exception.JeecgBootException;
import org.eemp.common.util.CommonUtils;
import org.eemp.common.util.MinioUtil;
import org.eemp.common.util.oConvertUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

/**
 * minio文件上传示例
 * @author: jeecg-boot
 */
@Slf4j
@RestController
@RequestMapping("/sys/upload")
public class SysUploadController {
    /**
     * 上传
     * @param request
     */
    @PostMapping(value = "/uploadMinio")
    public Result<?> uploadMinio(HttpServletRequest request) throws Exception {
        Result<?> result = new Result<>();
        String bizPath = request.getParameter("biz");

        //LOWCOD-2580 sys/common/upload接口存在任意文件上传漏洞
        boolean flag = oConvertUtils.isNotEmpty(bizPath) && (bizPath.contains("../") || bizPath.contains("..\\"));
        if (flag) {
            throw new JeecgBootException("上传目录bizPath，格式非法！");
        }

        if(oConvertUtils.isEmpty(bizPath)){
            bizPath = "";
        }
        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
        // 获取上传文件对象
        MultipartFile file = multipartRequest.getFile("file");
        // 获取文件名
        String orgName = file.getOriginalFilename();
        orgName = CommonUtils.getFileName(orgName);
        String fileUrl =  MinioUtil.upload(file,bizPath);
        if(oConvertUtils.isEmpty(fileUrl)){
            return Result.error("上传失败,请检查配置信息是否正确!");
        }
        //保存文件信息
        result.setMessage(fileUrl);
        result.setSuccess(true);
        return result;
    }
}
