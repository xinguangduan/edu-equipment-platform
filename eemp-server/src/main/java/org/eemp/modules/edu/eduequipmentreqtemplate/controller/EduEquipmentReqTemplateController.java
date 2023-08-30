package org.eemp.modules.edu.eduequipmentreqtemplate.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.util.Arrays;
import java.util.Date;
import java.util.Map;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.apache.poi.util.IOUtils;
import org.eemp.common.api.vo.Result;
import org.eemp.common.aspect.annotation.AutoLog;
import org.eemp.common.system.base.controller.BaseController;
import org.eemp.common.system.query.QueryGenerator;
import org.eemp.modules.edu.eduequipmentreqtemplate.entity.EduEquipmentReqTemplate;
import org.eemp.modules.edu.eduequipmentreqtemplate.service.IEduEquipmentReqTemplateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

/**
 * @Description: 教学器材配备标准模板
 * @Author: jeecg-boot
 * @Date: 2023-08-29
 * @Version: V1.0
 */
@Api(tags = "教学器材配备标准模板")
@RestController
@RequestMapping("/edu/eduequipmentreqtemplate/eduEquipmentReqTemplate")
@Slf4j
public class EduEquipmentReqTemplateController extends BaseController<EduEquipmentReqTemplate, IEduEquipmentReqTemplateService> {
    @Autowired
    private IEduEquipmentReqTemplateService eduEquipmentReqTemplateService;

    /**
     * 分页列表查询
     *
     * @param eduEquipmentReqTemplate
     * @param pageNo
     * @param pageSize
     * @param req
     * @return
     */
    //@AutoLog(value = "教学器材配备标准模板-分页列表查询")
    @ApiOperation(value = "教学器材配备标准模板-分页列表查询", notes = "教学器材配备标准模板-分页列表查询")
    @GetMapping(value = "/list")
    public Result<IPage<EduEquipmentReqTemplate>> queryPageList(EduEquipmentReqTemplate eduEquipmentReqTemplate,
                                                                @RequestParam(name = "pageNo", defaultValue = "1") Integer pageNo,
                                                                @RequestParam(name = "pageSize", defaultValue = "10") Integer pageSize,
                                                                HttpServletRequest req) {
        QueryWrapper<EduEquipmentReqTemplate> queryWrapper = QueryGenerator.initQueryWrapper(eduEquipmentReqTemplate, req.getParameterMap());
        Page<EduEquipmentReqTemplate> page = new Page<EduEquipmentReqTemplate>(pageNo, pageSize);
        IPage<EduEquipmentReqTemplate> pageList = eduEquipmentReqTemplateService.page(page, queryWrapper);
        return Result.OK(pageList);
    }

    /**
     * 添加
     *
     * @param eduEquipmentReqTemplate
     * @return
     */
    @AutoLog(value = "教学器材配备标准模板-添加")
    @ApiOperation(value = "教学器材配备标准模板-添加", notes = "教学器材配备标准模板-添加")
    //@RequiresPermissions("eduequipmentreqtemplate:edu_equipment_req_template:add")
    @PostMapping(value = "/add")
    public void add(HttpServletRequest request, HttpServletResponse response, @RequestBody EduEquipmentReqTemplate eduEquipmentReqTemplate) {
        try {
            EduEquipmentReqTemplate equipmentReqTemplate = eduEquipmentReqTemplateService.getById(eduEquipmentReqTemplate.getId());
            ByteArrayInputStream inputStream = new ByteArrayInputStream(equipmentReqTemplate.getFileData());
            //6.设置响应头信息
            request.setCharacterEncoding("UTF-8");
            response.setHeader("Content-Disposition", "attachment;filename=\"" + equipmentReqTemplate.getFileName() + "\"");
            response.setContentType("application/octet-stream");
            ServletOutputStream outputStream = response.getOutputStream();
            IOUtils.copy(inputStream, outputStream);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 编辑
     *
     * @param eduEquipmentReqTemplate
     * @return
     */
    @AutoLog(value = "教学器材配备标准模板-下载")
    @ApiOperation(value = "教学器材配备标准模板-下载", notes = "教学器材配备标准模板-下载")
    //@RequiresPermissions("eduequipmentreqtemplate:edu_equipment_req_template:download")
    @RequestMapping(value = "/download", method = {RequestMethod.PUT, RequestMethod.POST})
    public void download(HttpServletRequest request, HttpServletResponse response, @RequestBody EduEquipmentReqTemplate eduEquipmentReqTemplate) {
        try {
            EduEquipmentReqTemplate equipmentReqTemplate = eduEquipmentReqTemplateService.getById(eduEquipmentReqTemplate.getId());
            ByteArrayInputStream inputStream = new ByteArrayInputStream(equipmentReqTemplate.getFileData());
            //6.设置响应头信息
            request.setCharacterEncoding("UTF-8");
            response.setHeader("Content-Disposition", "attachment;filename=\"" + equipmentReqTemplate.getFileName() + "\"");
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
    @AutoLog(value = "教学器材配备标准模板-通过id删除")
    @ApiOperation(value = "教学器材配备标准模板-通过id删除", notes = "教学器材配备标准模板-通过id删除")
    //@RequiresPermissions("eduequipmentreqtemplate:edu_equipment_req_template:delete")
    @DeleteMapping(value = "/delete")
    public Result<String> delete(@RequestParam(name = "id", required = true) String id) {
        eduEquipmentReqTemplateService.removeById(id);
        return Result.OK("删除成功!");
    }

    /**
     * 批量删除
     *
     * @param ids
     * @return
     */
    @AutoLog(value = "教学器材配备标准模板-批量删除")
    @ApiOperation(value = "教学器材配备标准模板-批量删除", notes = "教学器材配备标准模板-批量删除")
    //@RequiresPermissions("eduequipmentreqtemplate:edu_equipment_req_template:deleteBatch")
    @DeleteMapping(value = "/deleteBatch")
    public Result<String> deleteBatch(@RequestParam(name = "ids", required = true) String ids) {
        this.eduEquipmentReqTemplateService.removeByIds(Arrays.asList(ids.split(",")));
        return Result.OK("批量删除成功!");
    }

    /**
     * 通过id查询
     *
     * @param id
     * @return
     */
    //@AutoLog(value = "教学器材配备标准模板-通过id查询")
    @ApiOperation(value = "教学器材配备标准模板-通过id查询", notes = "教学器材配备标准模板-通过id查询")
    @GetMapping(value = "/queryById")
    public Result<EduEquipmentReqTemplate> queryById(@RequestParam(name = "id", required = true) String id) {
        EduEquipmentReqTemplate eduEquipmentReqTemplate = eduEquipmentReqTemplateService.getById(id);
        if (eduEquipmentReqTemplate == null) {
            return Result.error("未找到对应数据");
        }
        return Result.OK(eduEquipmentReqTemplate);
    }

    /**
     * 导出excel
     *
     * @param request
     * @param eduEquipmentReqTemplate
     */
    //@RequiresPermissions("eduequipmentreqtemplate:edu_equipment_req_template:exportXls")
    @RequestMapping(value = "/exportXls")
    public ModelAndView exportXls(HttpServletRequest request, EduEquipmentReqTemplate eduEquipmentReqTemplate) {
        return super.exportXls(request, eduEquipmentReqTemplate, EduEquipmentReqTemplate.class, "教学器材配备标准模板");
    }

    /**
     * 通过excel导入数据
     *
     * @param request
     * @param response
     * @return
     */
    //@RequiresPermissions("eduequipmentreqtemplate:edu_equipment_req_template:importExcel")
    @RequestMapping(value = "/importExcel", method = RequestMethod.POST)
    public Result<?> importExcel(HttpServletRequest request, HttpServletResponse response) {
//        return super.importExcel(request, response, EduEquipmentReqTemplate.class);
        EduEquipmentReqTemplate equipmentReqTemplate = new EduEquipmentReqTemplate();
        equipmentReqTemplate.setRemark("测试");
        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
        Map<String, MultipartFile> fileMap = multipartRequest.getFileMap();
        for (Map.Entry<String, MultipartFile> entity : fileMap.entrySet()) {
            // 获取上传文件对象
            MultipartFile file = entity.getValue();
            try {
                equipmentReqTemplate.setFileDate(new Date());
                equipmentReqTemplate.setFileName(file.getOriginalFilename());
                equipmentReqTemplate.setFileSize(file.getBytes().length);
                equipmentReqTemplate.setFileData(file.getBytes());
                eduEquipmentReqTemplateService.save(equipmentReqTemplate);
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
                    log.error("close file input stream error", e);
                }
            }
        }
        return Result.error("文件导入成功！");
    }

}
