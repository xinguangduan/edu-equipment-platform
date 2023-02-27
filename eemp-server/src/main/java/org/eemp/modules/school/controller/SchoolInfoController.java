package org.eemp.modules.school.controller;

import java.util.Arrays;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.eemp.common.api.vo.Result;
import org.eemp.common.aspect.annotation.AutoLog;
import org.eemp.common.system.base.controller.JeecgController;
import org.eemp.common.system.query.QueryGenerator;
import org.eemp.modules.school.entity.SchoolInfo;
import org.eemp.modules.school.service.ISchoolInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

/**
 * @Description: 学校信息管理
 * @Author: jeecg-boot
 * @Date: 2023-02-23
 * @Version: V1.0
 */
@Api(tags = "学校信息管理")
@RestController
@RequestMapping("/school/schoolInfo")
@Slf4j
public class SchoolInfoController extends JeecgController<SchoolInfo, ISchoolInfoService> {
    @Autowired
    private ISchoolInfoService schoolInfoService;

    /**
     * 分页列表查询
     *
     * @param schoolInfo
     * @param pageNo
     * @param pageSize
     * @param req
     * @return
     */
    //@AutoLog(value = "学校信息管理-分页列表查询")
    @ApiOperation(value = "学校信息管理-分页列表查询", notes = "学校信息管理-分页列表查询")
    @GetMapping(value = "/list")
    public Result<IPage<SchoolInfo>> queryPageList(SchoolInfo schoolInfo,
                                                   @RequestParam(name = "pageNo", defaultValue = "1") Integer pageNo,
                                                   @RequestParam(name = "pageSize", defaultValue = "10") Integer pageSize,
                                                   HttpServletRequest req) {
        QueryWrapper<SchoolInfo> queryWrapper = QueryGenerator.initQueryWrapper(schoolInfo, req.getParameterMap());
        Page<SchoolInfo> page = new Page<SchoolInfo>(pageNo, pageSize);
        IPage<SchoolInfo> pageList = schoolInfoService.page(page, queryWrapper);
        return Result.OK(pageList);
    }

    /**
     * 添加
     *
     * @param schoolInfo
     * @return
     */
    @AutoLog(value = "学校信息管理-添加")
    @ApiOperation(value = "学校信息管理-添加", notes = "学校信息管理-添加")
    //@RequiresPermissions("school:school_info:add")
    @PostMapping(value = "/add")
    public Result<String> add(@RequestBody SchoolInfo schoolInfo) {
        schoolInfoService.save(schoolInfo);
        return Result.OK("添加成功！");
    }

    /**
     * 编辑
     *
     * @param schoolInfo
     * @return
     */
    @AutoLog(value = "学校信息管理-编辑")
    @ApiOperation(value = "学校信息管理-编辑", notes = "学校信息管理-编辑")
    //@RequiresPermissions("school:school_info:edit")
    @RequestMapping(value = "/edit", method = {RequestMethod.PUT, RequestMethod.POST})
    public Result<String> edit(@RequestBody SchoolInfo schoolInfo) {
        schoolInfoService.updateById(schoolInfo);
        return Result.OK("编辑成功!");
    }

    /**
     * 通过id删除
     *
     * @param id
     * @return
     */
    @AutoLog(value = "学校信息管理-通过id删除")
    @ApiOperation(value = "学校信息管理-通过id删除", notes = "学校信息管理-通过id删除")
    //@RequiresPermissions("school:school_info:delete")
    @DeleteMapping(value = "/delete")
    public Result<String> delete(@RequestParam(name = "id", required = true) String id) {
        schoolInfoService.removeById(id);
        return Result.OK("删除成功!");
    }

    /**
     * 批量删除
     *
     * @param ids
     * @return
     */
    @AutoLog(value = "学校信息管理-批量删除")
    @ApiOperation(value = "学校信息管理-批量删除", notes = "学校信息管理-批量删除")
    //@RequiresPermissions("school:school_info:deleteBatch")
    @DeleteMapping(value = "/deleteBatch")
    public Result<String> deleteBatch(@RequestParam(name = "ids", required = true) String ids) {
        this.schoolInfoService.removeByIds(Arrays.asList(ids.split(",")));
        return Result.OK("批量删除成功!");
    }

    /**
     * 通过id查询
     *
     * @param id
     * @return
     */
    //@AutoLog(value = "学校信息管理-通过id查询")
    @ApiOperation(value = "学校信息管理-通过id查询", notes = "学校信息管理-通过id查询")
    @GetMapping(value = "/queryById")
    public Result<SchoolInfo> queryById(@RequestParam(name = "id", required = true) String id) {
        SchoolInfo schoolInfo = schoolInfoService.getById(id);
        if (schoolInfo == null) {
            return Result.error("未找到对应数据");
        }
        return Result.OK(schoolInfo);
    }

    /**
     * 导出excel
     *
     * @param request
     * @param schoolInfo
     */
    //@RequiresPermissions("school:school_info:exportXls")
    @RequestMapping(value = "/exportXls")
    public ModelAndView exportXls(HttpServletRequest request, SchoolInfo schoolInfo) {
        return super.exportXls(request, schoolInfo, SchoolInfo.class, "学校信息管理");
    }

    /**
     * 通过excel导入数据
     *
     * @param request
     * @param response
     * @return
     */
    //@RequiresPermissions("school:school_info:importExcel")
    @RequestMapping(value = "/importExcel", method = RequestMethod.POST)
    public Result<?> importExcel(HttpServletRequest request, HttpServletResponse response) {
        return super.importExcel(request, response, SchoolInfo.class);
    }

}
