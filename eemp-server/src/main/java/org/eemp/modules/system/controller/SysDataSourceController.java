package org.eemp.modules.system.controller;


import java.util.Arrays;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.eemp.common.api.vo.Result;
import org.eemp.common.aspect.annotation.AutoLog;
import org.eemp.common.exception.JeecgBootException;
import org.eemp.common.system.base.controller.BaseController;
import org.eemp.common.system.query.QueryGenerator;
import org.eemp.common.util.dynamic.db.DataSourceCachePool;
import org.eemp.common.util.oConvertUtils;
import org.eemp.common.util.security.JdbcSecurityUtil;
import org.eemp.config.mybatis.MybatisPlusSaasConfig;
import org.eemp.config.mybatis.TenantContext;
import org.eemp.modules.system.entity.SysDataSource;
import org.eemp.modules.system.service.ISysDataSourceService;
import org.eemp.modules.system.util.SecurityUtil;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

/**
 * @Description: 多数据源管理
 * @Author: jeecg-boot
 * @Date: 2019-12-25
 * @Version: V1.0
 */
@Slf4j
@Api(tags = "多数据源管理")
@RestController
@RequestMapping("/sys/dataSource")
@RequiredArgsConstructor
public class SysDataSourceController extends BaseController<SysDataSource, ISysDataSourceService> {

    private final ISysDataSourceService sysDataSourceService;


    /**
     * 分页列表查询
     *
     * @param sysDataSource
     * @param pageNo
     * @param pageSize
     * @param req
     * @return
     */
    @AutoLog(value = "多数据源管理-分页列表查询")
    @ApiOperation(value = "多数据源管理-分页列表查询", notes = "多数据源管理-分页列表查询")
    //@RequiresPermissions("system:datasource:list")
    @GetMapping(value = "/list")
    public Result<?> queryPageList(
            SysDataSource sysDataSource,
            @RequestParam(name = "pageNo", defaultValue = "1") Integer pageNo,
            @RequestParam(name = "pageSize", defaultValue = "10") Integer pageSize,
            HttpServletRequest req) {
        //------------------------------------------------------------------------------------------------
        //是否开启系统管理模块的多租户数据隔离【SAAS多租户模式】
        if(MybatisPlusSaasConfig.OPEN_SYSTEM_TENANT_CONTROL){
            sysDataSource.setTenantId(oConvertUtils.getInt(TenantContext.getTenant(), 0));
        }
        //------------------------------------------------------------------------------------------------
        QueryWrapper<SysDataSource> queryWrapper = QueryGenerator.initQueryWrapper(sysDataSource, req.getParameterMap());
        Page<SysDataSource> page = new Page<>(pageNo, pageSize);
        IPage<SysDataSource> pageList = sysDataSourceService.page(page, queryWrapper);
        return Result.ok(pageList);
    }

    @GetMapping(value = "/options")
    public Result<?> queryOptions(SysDataSource sysDataSource, HttpServletRequest req) {
        //------------------------------------------------------------------------------------------------
        //是否开启系统管理模块的多租户数据隔离【SAAS多租户模式】
        if(MybatisPlusSaasConfig.OPEN_SYSTEM_TENANT_CONTROL){
            sysDataSource.setTenantId(oConvertUtils.getInt(TenantContext.getTenant(), 0));
        }
        //------------------------------------------------------------------------------------------------
        
        QueryWrapper<SysDataSource> queryWrapper = QueryGenerator.initQueryWrapper(sysDataSource, req.getParameterMap());
        List<SysDataSource> pageList = sysDataSourceService.list(queryWrapper);
        JSONArray array = new JSONArray(pageList.size());
        for (SysDataSource item : pageList) {
            JSONObject option = new JSONObject(3);
            option.put("value", item.getCode());
            option.put("label", item.getName());
            option.put("text", item.getName());
            array.add(option);
        }
        return Result.ok(array);
    }

    /**
     * 添加
     *
     * @param sysDataSource
     * @return
     */
    @AutoLog(value = "多数据源管理-添加")
    @ApiOperation(value = "多数据源管理-添加", notes = "多数据源管理-添加")
    @PostMapping(value = "/add")
    public Result<?> add(@RequestBody SysDataSource sysDataSource) {
        //update-begin-author:taoyan date:2022-8-10 for: jdbc连接地址漏洞问题
        try {
            JdbcSecurityUtil.validate(sysDataSource.getDbUrl());
        }catch (JeecgBootException e){
            log.error(e.toString());
            return Result.error("操作失败：" + e.getMessage());
        }
        //update-end-author:taoyan date:2022-8-10 for: jdbc连接地址漏洞问题
        return sysDataSourceService.saveDataSource(sysDataSource);
    }

    /**
     * 编辑
     *
     * @param sysDataSource
     * @return
     */
    @AutoLog(value = "多数据源管理-编辑")
    @ApiOperation(value = "多数据源管理-编辑", notes = "多数据源管理-编辑")
    @RequestMapping(value = "/edit", method ={RequestMethod.PUT, RequestMethod.POST})
    public Result<?> edit(@RequestBody SysDataSource sysDataSource) {
        //update-begin-author:taoyan date:2022-8-10 for: jdbc连接地址漏洞问题
        try {
            JdbcSecurityUtil.validate(sysDataSource.getDbUrl());
        } catch (JeecgBootException e) {
            log.error(e.toString());
            return Result.error("操作失败：" + e.getMessage());
        }
        //update-end-author:taoyan date:2022-8-10 for: jdbc连接地址漏洞问题
        return sysDataSourceService.editDataSource(sysDataSource);
    }

    /**
     * 通过id删除
     *
     * @param id
     * @return
     */
    @AutoLog(value = "多数据源管理-通过id删除")
    @ApiOperation(value = "多数据源管理-通过id删除", notes = "多数据源管理-通过id删除")
    @DeleteMapping(value = "/delete")
    public Result<?> delete(@RequestParam(name = "id") String id) {
        return sysDataSourceService.deleteDataSource(id);
    }

    /**
     * 批量删除
     *
     * @param ids
     * @return
     */
    @AutoLog(value = "多数据源管理-批量删除")
    @ApiOperation(value = "多数据源管理-批量删除", notes = "多数据源管理-批量删除")
    @DeleteMapping(value = "/deleteBatch")
    public Result<?> deleteBatch(@RequestParam(name = "ids") String ids) {
        List<String> idList = Arrays.asList(ids.split(","));
        idList.forEach(item->{
            SysDataSource sysDataSource = sysDataSourceService.getById(item);
            DataSourceCachePool.removeCache(sysDataSource.getCode());
        });
        this.sysDataSourceService.removeByIds(idList);
        return Result.ok("批量删除成功！");
    }

    /**
     * 通过id查询
     *
     * @param id
     * @return
     */
    @AutoLog(value = "多数据源管理-通过id查询")
    @ApiOperation(value = "多数据源管理-通过id查询", notes = "多数据源管理-通过id查询")
    @GetMapping(value = "/queryById")
    public Result<?> queryById(@RequestParam(name = "id") String id) throws InterruptedException {
        SysDataSource sysDataSource = sysDataSourceService.getById(id);
        //密码解密
        String dbPassword = sysDataSource.getDbPassword();
        if(StringUtils.isNotBlank(dbPassword)){
            String decodedStr = SecurityUtil.jiemi(dbPassword);
            sysDataSource.setDbPassword(decodedStr);
        }
        return Result.ok(sysDataSource);
    }

    /**
     * 导出excel
     *
     * @param request
     * @param sysDataSource
     */
    @RequestMapping(value = "/exportXls")
    public ModelAndView exportXls(HttpServletRequest request, SysDataSource sysDataSource) {
        //------------------------------------------------------------------------------------------------
        //是否开启系统管理模块的多租户数据隔离【SAAS多租户模式】
        if(MybatisPlusSaasConfig.OPEN_SYSTEM_TENANT_CONTROL){
            sysDataSource.setTenantId(oConvertUtils.getInt(TenantContext.getTenant(), 0));
        }
        //------------------------------------------------------------------------------------------------
        return super.exportXls(request, sysDataSource, SysDataSource.class, "多数据源管理");
    }

    /**
     * 通过excel导入数据
     *
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/importExcel", method = RequestMethod.POST)
    public Result<?> importExcel(HttpServletRequest request, HttpServletResponse response) {
        return super.importExcel(request, response, SysDataSource.class);
    }

}
