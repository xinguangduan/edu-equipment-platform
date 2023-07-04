package org.eemp.modules.edu.primaryequipmentreqtemplate.controller;

import static org.eemp.common.util.CommonUtils.getFileSuffix;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.eemp.common.api.vo.Result;
import org.eemp.common.aspect.annotation.AutoLog;
import org.eemp.common.poi.excel.entity.ImportParams;
import org.eemp.common.system.base.controller.BaseController;
import org.eemp.common.system.query.QueryGenerator;
import org.eemp.common.system.vo.LoginUser;
import org.eemp.modules.edu.primaryequipmentreqtemplate.entity.EduPrimaryEquipmentReqTemplate;
import org.eemp.modules.edu.primaryequipmentreqtemplate.service.IEduPrimaryEquipmentReqTemplateService;
import org.eemp.modules.system.service.ISysPermissionService;
import org.eemp.modules.system.service.impl.SysBaseApiImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

/**
 * @Description: 小学器材设施配备要求模板表
 * @Author: jeecg-boot
 * @Date: 2023-06-04
 * @Version: V1.0
 */
@Api(tags = "小学器材设施配备要求模板表")
@RestController
@RequestMapping("/edu/primaryequipmentreqtemplate/eduPrimaryEquipmentReqTemplate")
@Slf4j
public class EduPrimaryEquipmentReqTemplateController extends BaseController<EduPrimaryEquipmentReqTemplate, IEduPrimaryEquipmentReqTemplateService> {
    @Autowired
    private IEduPrimaryEquipmentReqTemplateService eduPrimaryEquipmentReqTemplateService;
    @Autowired
    private ISysPermissionService sysPermissionService;
    @Autowired
    private SysBaseApiImpl sysBaseApi;

    /**
     * 分页列表查询
     *
     * @param eduPrimaryEquipmentReqTemplate
     * @param pageNo
     * @param pageSize
     * @param req
     * @return
     */
    //@AutoLog(value = "小学器材设施配备要求模板表-分页列表查询")
    @ApiOperation(value = "小学器材设施配备要求模板表-分页列表查询", notes = "小学器材设施配备要求模板表-分页列表查询")
    @GetMapping(value = "/list")
    public Result<IPage<EduPrimaryEquipmentReqTemplate>> queryPageList(EduPrimaryEquipmentReqTemplate eduPrimaryEquipmentReqTemplate,
                                                                       @RequestParam(name = "pageNo", defaultValue = "1") Integer pageNo,
                                                                       @RequestParam(name = "pageSize", defaultValue = "10") Integer pageSize,
                                                                       HttpServletRequest req) {
        QueryWrapper<EduPrimaryEquipmentReqTemplate> queryWrapper = QueryGenerator.initQueryWrapper(eduPrimaryEquipmentReqTemplate, req.getParameterMap());
        Page<EduPrimaryEquipmentReqTemplate> page = new Page<EduPrimaryEquipmentReqTemplate>(pageNo, pageSize);
        IPage<EduPrimaryEquipmentReqTemplate> pageList = eduPrimaryEquipmentReqTemplateService.page(page, queryWrapper);
        return Result.OK(pageList);
    }

    /**
     * 添加
     *
     * @param eduPrimaryEquipmentReqTemplate
     * @return
     */
    @AutoLog(value = "小学器材设施配备要求模板表-添加")
    @ApiOperation(value = "小学器材设施配备要求模板表-添加", notes = "小学器材设施配备要求模板表-添加")
    //@RequiresPermissions("primaryequipmentreqtemplate:edu_primary_equipment_req_template:add")
    @PostMapping(value = "/add")
    public Result<String> add(@RequestBody EduPrimaryEquipmentReqTemplate eduPrimaryEquipmentReqTemplate) {
        eduPrimaryEquipmentReqTemplateService.save(eduPrimaryEquipmentReqTemplate);
        return Result.OK("添加成功！");
    }

    /**
     * 编辑
     *
     * @param eduPrimaryEquipmentReqTemplate
     * @return
     */
    @AutoLog(value = "小学器材设施配备要求模板表-编辑")
    @ApiOperation(value = "小学器材设施配备要求模板表-编辑", notes = "小学器材设施配备要求模板表-编辑")
    //@RequiresPermissions("primaryequipmentreqtemplate:edu_primary_equipment_req_template:edit")
    @RequestMapping(value = "/edit", method = {RequestMethod.PUT, RequestMethod.POST})
    public Result<String> edit(@RequestBody EduPrimaryEquipmentReqTemplate eduPrimaryEquipmentReqTemplate) {
        eduPrimaryEquipmentReqTemplateService.updateById(eduPrimaryEquipmentReqTemplate);
        return Result.OK("编辑成功!");
    }

    /**
     * 通过id删除
     *
     * @param id
     * @return
     */
    @AutoLog(value = "小学器材设施配备要求模板表-通过id删除")
    @ApiOperation(value = "小学器材设施配备要求模板表-通过id删除", notes = "小学器材设施配备要求模板表-通过id删除")
    //@RequiresPermissions("primaryequipmentreqtemplate:edu_primary_equipment_req_template:delete")
    @DeleteMapping(value = "/delete")
    public Result<String> delete(@RequestParam(name = "id", required = true) String id) {
        eduPrimaryEquipmentReqTemplateService.removeById(id);
        return Result.OK("删除成功!");
    }

    /**
     * 批量删除
     *
     * @param ids
     * @return
     */
    @AutoLog(value = "小学器材设施配备要求模板表-批量删除")
    @ApiOperation(value = "小学器材设施配备要求模板表-批量删除", notes = "小学器材设施配备要求模板表-批量删除")
    //@RequiresPermissions("primaryequipmentreqtemplate:edu_primary_equipment_req_template:deleteBatch")
    @DeleteMapping(value = "/deleteBatch")
    public Result<String> deleteBatch(@RequestParam(name = "ids", required = true) String ids) {
        this.eduPrimaryEquipmentReqTemplateService.removeByIds(Arrays.asList(ids.split(",")));
        return Result.OK("批量删除成功!");
    }

    /**
     * 通过id查询
     *
     * @param id
     * @return
     */
    //@AutoLog(value = "小学器材设施配备要求模板表-通过id查询")
    @ApiOperation(value = "小学器材设施配备要求模板表-通过id查询", notes = "小学器材设施配备要求模板表-通过id查询")
    @GetMapping(value = "/queryById")
    public Result<EduPrimaryEquipmentReqTemplate> queryById(@RequestParam(name = "id", required = true) String id) {
        EduPrimaryEquipmentReqTemplate eduPrimaryEquipmentReqTemplate = eduPrimaryEquipmentReqTemplateService.getById(id);
        if (eduPrimaryEquipmentReqTemplate == null) {
            return Result.error("未找到对应数据");
        }
        return Result.OK(eduPrimaryEquipmentReqTemplate);
    }

    /**
     * 导出excel
     *
     * @param request
     * @param eduPrimaryEquipmentReqTemplate
     */
    //@RequiresPermissions("primaryequipmentreqtemplate:edu_primary_equipment_req_template:exportXls")
    @RequestMapping(value = "/exportXls")
    public ModelAndView exportXls(HttpServletRequest request, EduPrimaryEquipmentReqTemplate eduPrimaryEquipmentReqTemplate) {
        return super.exportXls(request, eduPrimaryEquipmentReqTemplate, EduPrimaryEquipmentReqTemplate.class, "小学器材设施配备要求模板表");
    }

    /**
     * 通过excel导入数据
     *
     * @param request
     * @param response
     * @return
     */
    //@RequiresPermissions("primaryequipmentreqtemplate:edu_primary_equipment_req_template:importExcel")
    @RequestMapping(value = "/importExcel", method = RequestMethod.POST)
    public Result<?> importExcel(HttpServletRequest request, HttpServletResponse response) {
        return importPrimaryEquipmentReqTemplateDataFromExcel(request, response);
    }

    /**
     * 通过excel导入数据
     *
     * @param request
     * @param response
     * @return
     */

    protected Result<?> importPrimaryEquipmentReqTemplateDataFromExcel(HttpServletRequest request, HttpServletResponse response) {
        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
        Map<String, MultipartFile> fileMap = multipartRequest.getFileMap();
        for (Map.Entry<String, MultipartFile> entity : fileMap.entrySet()) {
            // 获取上传文件对象
            MultipartFile file = entity.getValue();
            ImportParams params = new ImportParams();
            params.setTitleRows(1);
            params.setHeadRows(2);
            params.setNeedSave(true);
            try {
                //用户退出逻辑
                String username = getLoginUserName(request);
                if (username == null) {
                    return Result.error("Token失效，请重新登陆！");
                }
                LoginUser loginUser = sysBaseApi.getUserByName(username);
                String suffix = getFileSuffix(file);
                List<EduPrimaryEquipmentReqTemplate> list = parseExcel(file.getInputStream(), suffix, params, loginUser);
                //update-begin-author:taoyan date:20190528 for:批量插入数据
                int count = list == null ? 0 : list.size();
                log.info("read data from excel, count={}", count);
                long start = System.currentTimeMillis();
                service.saveBatch(list);
                //400条 saveBatch消耗时间1592毫秒  循环插入消耗时间1947毫秒
                //1200条  saveBatch消耗时间3687毫秒 循环插入消耗时间5212毫秒
                log.info("消耗时间" + (System.currentTimeMillis() - start) + "毫秒");
                //update-end-author:taoyan date:20190528 for:批量插入数据
                return Result.ok("文件导入成功！数据行数：" + count);
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
        return Result.error("文件导入失败！");
    }

    // 主要用于导入Excel解析
    public List<EduPrimaryEquipmentReqTemplate> parseExcel(InputStream inputStream, String suffix, ImportParams params, LoginUser loginUser) {

        final List<EduPrimaryEquipmentReqTemplate> objects = new ArrayList<>();
        Workbook workbook = null;//Excel对象

        if ("xls".equals(suffix)) {// 2003版的解析方式
            try {
                workbook = new HSSFWorkbook(inputStream);
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else if ("xlsx".equals(suffix)) {// 2007版本Excel
            try {
                workbook = new XSSFWorkbook(inputStream);
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            return null;
        }

        int allSheets = workbook.getNumberOfSheets(); // 获取Sheet总数
        for (int sheetI = 0; sheetI < allSheets; sheetI++) {
            Sheet sheet = workbook.getSheetAt(sheetI);
            if (sheet == null) {
                return null;
            }

            //获取表格中最后一行的行号
            int lastRowNum = sheet.getLastRowNum();

            //定义行变量和单元格变量
            Row row = null;
            //循环读取
            for (int rowNum = params.getHeadRows() + params.getTitleRows(); rowNum <= lastRowNum; rowNum++) {
                row = sheet.getRow(rowNum);
                // 获取当前行的第一列和最后一列的标记
                if (null != row) {
                    short firstCellNum = row.getFirstCellNum();
                    short lastCellNum = row.getLastCellNum();
                    Cell firstCell = row.getCell(0);
                    if (firstCell == null) {
                        continue;
                    }
                    String firstCellString = parseCell(firstCell, rowNum, 0);
                    String secondCellString = parseCell(firstCell, rowNum, 1);
//                    log.info("====>", secondCellString);
                    if (StringUtils.isEmpty(firstCellString) || firstCellString.contains("分类代码") || firstCellString.contains("表")) {
                        continue;
                    }
                    if (lastCellNum != 0) {
                        EduPrimaryEquipmentReqTemplate req = new EduPrimaryEquipmentReqTemplate();

                        req.setSysOrgCode(loginUser.getOrgCode());
                        req.setCreateBy(loginUser.getUsername());
                        req.setCreateTime(new Date());
                        req.setUpdateBy(loginUser.getUsername());
                        req.setUpdateTime(new Date());
                        req.setPhaseCode("2023");
                        req.setGrade("primary");

                        req.setCategoryCode(parseCell(row.getCell(0), rowNum, 0));
                        req.setName(parseCell(row.getCell(1), rowNum, 1));
                        req.setSpecModelFunc(parseCell(row.getCell(2), rowNum, 2));
                        req.setUnit(parseCell(row.getCell(3), rowNum, 3));
                        req.setQuantity(parseCell(row.getCell(4), rowNum, 4));

                        if (row.getCell(5) != null && StringUtils.isEmpty(row.getCell(5).getStringCellValue())) {
                            req.setEquipmentRequirement("基本");
                        } else if (row.getCell(6) != null && StringUtils.isEmpty(row.getCell(6).getStringCellValue())) {
                            req.setEquipmentRequirement("选配");
                        }

                        req.setExecutiveStandardCode(parseCell(row.getCell(7), rowNum, 7));
                        req.setRemark(parseCell(row.getCell(8), rowNum, 8));
                        log.info("read data from excel ====>{}", req);
                        objects.add(req);
                    }
                }
            }
        }
        return objects;
    }

}
