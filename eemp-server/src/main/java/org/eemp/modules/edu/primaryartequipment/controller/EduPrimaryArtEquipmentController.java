package org.eemp.modules.edu.primaryartequipment.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.poi.util.IOUtils;
import org.apache.shiro.SecurityUtils;
import org.eemp.common.api.vo.Result;
import org.eemp.common.aspect.annotation.AutoLog;
import org.eemp.common.system.base.controller.BaseController;
import org.eemp.common.system.query.QueryGenerator;
import org.eemp.common.system.vo.LoginUser;
import org.eemp.modules.edu.eduequipmentreqtemplate.entity.EduEquipmentReqTemplate;
import org.eemp.modules.edu.eduequipmentreqtemplate.service.IEduEquipmentReqTemplateService;
import org.eemp.modules.edu.edulabbasic.entity.EduLabBasicInfo;
import org.eemp.modules.edu.edulabbasic.service.IEduLabBasicInfoService;
import org.eemp.modules.edu.primaryartequipment.entity.EduPrimaryArtEquipment;
import org.eemp.modules.edu.primaryartequipment.service.IEduPrimaryArtEquipmentService;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

/**
 * @Description: 小学美术教学器材配备标准
 * @Author: jeecg-boot
 * @Date: 2023-08-27
 * @Version: V1.0
 */
@Api(tags = "小学美术教学器材配备标准")
@RestController
@RequestMapping("/edu/primaryartequipment/eduPrimaryArtEquipment")
@Slf4j
@RequiredArgsConstructor
public class EduPrimaryArtEquipmentController extends BaseController<EduPrimaryArtEquipment, IEduPrimaryArtEquipmentService> {
    private final IEduPrimaryArtEquipmentService eduPrimaryArtEquipmentService;
    private final IEduEquipmentReqTemplateService eduEquipmentReqTemplateService;
    private final IEduLabBasicInfoService eduLabBasicInfoService;


    /**
     * 分页列表查询
     *
     * @param eduPrimaryArtEquipment
     * @param pageNo
     * @param pageSize
     * @param req
     * @return
     */
    //@AutoLog(value = "小学美术教学器材配备标准-分页列表查询")
    @ApiOperation(value = "小学美术教学器材配备标准-分页列表查询", notes = "小学美术教学器材配备标准-分页列表查询")
    @GetMapping(value = "/list")
    public Result<IPage<EduPrimaryArtEquipment>> queryPageList(EduPrimaryArtEquipment eduPrimaryArtEquipment,
                                                               @RequestParam(name = "pageNo", defaultValue = "1") Integer pageNo,
                                                               @RequestParam(name = "pageSize", defaultValue = "10") Integer pageSize,
                                                               HttpServletRequest req) {
        QueryWrapper<EduPrimaryArtEquipment> queryWrapper = QueryGenerator.initQueryWrapper(eduPrimaryArtEquipment, req.getParameterMap());
        Page<EduPrimaryArtEquipment> page = new Page<EduPrimaryArtEquipment>(pageNo, pageSize);
        IPage<EduPrimaryArtEquipment> pageList = eduPrimaryArtEquipmentService.page(page, queryWrapper);
        return Result.OK(pageList);
    }

    /**
     * 添加
     *
     * @param eduPrimaryArtEquipment
     * @return
     */
    @AutoLog(value = "小学美术教学器材配备标准-添加")
    @ApiOperation(value = "小学美术教学器材配备标准-添加", notes = "小学美术教学器材配备标准-添加")
    //@RequiresPermissions("primaryartequipment:edu_primary_art_equipment:add")
    @PostMapping(value = "/add")
    public Result<String> add(@RequestBody EduPrimaryArtEquipment eduPrimaryArtEquipment) {
        eduPrimaryArtEquipmentService.save(eduPrimaryArtEquipment);
        return Result.OK("添加成功！");
    }

    /**
     * 编辑
     *
     * @param eduPrimaryArtEquipment
     * @return
     */
    @AutoLog(value = "小学美术教学器材配备标准-下载")
    @ApiOperation(value = "小学美术教学器材配备标准-下载", notes = "小学美术教学器材配备标准-下载")
    //@RequiresPermissions("primaryartequipment:edu_primary_art_equipment:download")
    @RequestMapping(value = "/download", method = {RequestMethod.PUT, RequestMethod.POST})
    public void download(HttpServletRequest request, HttpServletResponse response, @RequestBody EduPrimaryArtEquipment eduPrimaryArtEquipment) {
        try {
            EduPrimaryArtEquipment primaryArtEquipment = eduPrimaryArtEquipmentService.getById(eduPrimaryArtEquipment.getId());
            String templateFileName = "小学美术教学器材配备标准.xlsx";
            ByteArrayInputStream inputStream = new ByteArrayInputStream(primaryArtEquipment.getFileData());
            //6.设置响应头信息
            request.setCharacterEncoding("UTF-8");
            response.setHeader("Content-Disposition", "attachment;filename=\"" + templateFileName + "\"");
            response.setContentType("application/octet-stream");
            ServletOutputStream outputStream = response.getOutputStream();
            IOUtils.copy(inputStream, outputStream);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 通过id删除
     *
     * @param id
     * @return
     */
    @AutoLog(value = "小学美术教学器材配备标准-通过id删除")
    @ApiOperation(value = "小学美术教学器材配备标准-通过id删除", notes = "小学美术教学器材配备标准-通过id删除")
    //@RequiresPermissions("primaryartequipment:edu_primary_art_equipment:delete")
    @GetMapping(value = "/download")
    public void download(HttpServletResponse response, @RequestParam(name = "id", required = true) String id) {
        EduPrimaryArtEquipment eduPrimaryArtEquipment = eduPrimaryArtEquipmentService.getById(id);
        if (eduPrimaryArtEquipment == null) {
            log.error("数据未找到");
            return;
        }
        try {
            ByteArrayInputStream inputStream = new ByteArrayInputStream(eduPrimaryArtEquipment.getFileData());
            //6.设置响应头信息
            response.setCharacterEncoding("UTF-8");
            response.setHeader("Content-Disposition", "attachment;filename=\"" + eduPrimaryArtEquipment.getFileName() + "\"");
            response.setContentType("application/octet-stream");
            ServletOutputStream outputStream = response.getOutputStream();
            IOUtils.copy(inputStream, outputStream);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 批量删除
     *
     * @param ids
     * @return
     */
    @AutoLog(value = "小学美术教学器材配备标准-批量删除")
    @ApiOperation(value = "小学美术教学器材配备标准-批量删除", notes = "小学美术教学器材配备标准-批量删除")
    //@RequiresPermissions("primaryartequipment:edu_primary_art_equipment:deleteBatch")
    @DeleteMapping(value = "/deleteBatch")
    public Result<String> deleteBatch(@RequestParam(name = "ids", required = true) String ids) {
        this.eduPrimaryArtEquipmentService.removeByIds(Arrays.asList(ids.split(",")));
        return Result.OK("批量删除成功!");
    }

    /**
     * 通过id查询
     *
     * @param id
     * @return
     */
    //@AutoLog(value = "小学美术教学器材配备标准-通过id查询")
    @ApiOperation(value = "小学美术教学器材配备标准-通过id查询", notes = "小学美术教学器材配备标准-通过id查询")
    @GetMapping(value = "/queryById")
    public Result<EduPrimaryArtEquipment> queryById(@RequestParam(name = "id", required = true) String id) {
        EduPrimaryArtEquipment eduPrimaryArtEquipment = eduPrimaryArtEquipmentService.getById(id);
        if (eduPrimaryArtEquipment == null) {
            return Result.error("未找到对应数据");
        }
        return Result.OK(eduPrimaryArtEquipment);
    }

    /**
     * 导出excel
     *
     * @param request
     */
    @RequestMapping(value = "/exportTemplate")
    @ResponseBody
    public void exportTemplate(HttpServletRequest request, HttpServletResponse response) {
        try {
            final List<EduEquipmentReqTemplate> pageList = eduEquipmentReqTemplateService.list();
            EduEquipmentReqTemplate temp = null;
            for (EduEquipmentReqTemplate template : pageList) {
                if (template.getFileName().contains("小学美术教学器材配备标准")) {
                    temp = template;
                    break;
                }
            }
            if (temp == null) {
                log.error("未找到模板数据");
                return;
            }
            ByteArrayInputStream fileInputStream = new ByteArrayInputStream(temp.getFileData());
            //6.设置响应头信息
            request.setCharacterEncoding("UTF-8");
            response.setHeader("Content-Disposition", "attachment;filename=\"" + temp.getFileName() + "\"");
            response.setContentType("application/octet-stream");
            ServletOutputStream outputStream = response.getOutputStream();
            IOUtils.copy(fileInputStream, outputStream);
        } catch (Exception e) {
            log.error("got error ", e);
        }
//        return Result.OK("模板导出成功");
    }

    /**
     * 通过excel导入数据
     *
     * @param request
     * @param response
     * @return
     */
    //@RequiresPermissions("primaryartequipment:edu_primary_art_equipment:importExcel")
    @RequestMapping(value = "/importExcel", method = RequestMethod.POST)
    public Result<?> importExcel(HttpServletRequest request, HttpServletResponse response) {
        LoginUser sysUser = (LoginUser) SecurityUtils.getSubject().getPrincipal();
        List<EduLabBasicInfo> basicInfoList = eduLabBasicInfoService.list();
        EduLabBasicInfo eduLabBasicInfo = null;
        for (EduLabBasicInfo basicInfo : basicInfoList) {
            if (basicInfo.getSysOrgCode().contains(sysUser.getOrgCode())) {
                eduLabBasicInfo = basicInfo;
            }
        }
        String schoolName = eduLabBasicInfo == null ? "未知" : eduLabBasicInfo.getSchool();

        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
        Map<String, MultipartFile> fileMap = multipartRequest.getFileMap();
        for (Map.Entry<String, MultipartFile> entity : fileMap.entrySet()) {
            // 获取上传文件对象
            MultipartFile file = entity.getValue();
            try {
                EduPrimaryArtEquipment eduPrimaryArtEquipment = new EduPrimaryArtEquipment();
                eduPrimaryArtEquipment.setRemark("");
                eduPrimaryArtEquipment.setSchool(schoolName);
                eduPrimaryArtEquipment.setFileDate(new Date());
                eduPrimaryArtEquipment.setFileName(file.getOriginalFilename());
                eduPrimaryArtEquipment.setFileSize(file.getBytes().length);
                eduPrimaryArtEquipment.setFileData(file.getBytes());
                eduPrimaryArtEquipmentService.save(eduPrimaryArtEquipment);
                log.info("消耗时间" + (System.currentTimeMillis()) + "毫秒");
                return Result.ok("文件导入成功！数据行数：" + 1);
            } catch (Exception e) {
                //update-begin-author:taoyan date:20211124 for: 导入数据重复增加提示
                String msg = e.getMessage();
                log.error(msg, e);
                if (msg != null && msg.indexOf("Duplicate entry") >= 0) {
                    return Result.error("文件导入失败:有重复数据！");
                } else {
                    return Result.error("文件导入失败:" + e.getMessage());
                }
                //update-end-author:taoyan date:20211124 for: 导入数据重复增加提示
            } finally {
                try {
                    file.getInputStream().close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return Result.error("文件导入失败");
    }
}
