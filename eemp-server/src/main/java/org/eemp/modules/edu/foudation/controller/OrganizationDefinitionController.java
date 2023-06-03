package org.eemp.modules.edu.foudation.controller;

import java.util.Arrays;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.eemp.common.api.vo.Result;
import org.eemp.common.aspect.annotation.AutoLog;
import org.eemp.common.system.base.controller.BaseController;
import org.eemp.common.system.query.QueryGenerator;
import org.eemp.modules.edu.foudation.entity.OrganizationDefinition;
import org.eemp.modules.edu.foudation.service.IOrganizationDefinitionService;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

 /**
 * @Description: 机构组织定义
 * @Date:   2023-06-03
 * @Version: V1.0
 */
@Api(tags="机构组织定义")
@RestController
@RequestMapping("/org.eemp.modules.edu.foudation/organizationDefinition")
@Slf4j
@RequiredArgsConstructor
public class OrganizationDefinitionController extends BaseController<OrganizationDefinition, IOrganizationDefinitionService> {
	private final IOrganizationDefinitionService organizationDefinitionService;
	
	/**
	 * 分页列表查询
	 *
	 * @param organizationDefinition
	 * @param pageNo
	 * @param pageSize
	 * @param req
	 * @return
	 */
	//@AutoLog(value = "机构组织定义-分页列表查询")
	@ApiOperation(value="机构组织定义-分页列表查询", notes="机构组织定义-分页列表查询")
	@GetMapping(value = "/list")
	public Result<IPage<OrganizationDefinition>> queryPageList(OrganizationDefinition organizationDefinition,
								   @RequestParam(name="pageNo", defaultValue="1") Integer pageNo,
								   @RequestParam(name="pageSize", defaultValue="10") Integer pageSize,
								   HttpServletRequest req) {
		QueryWrapper<OrganizationDefinition> queryWrapper = QueryGenerator.initQueryWrapper(organizationDefinition, req.getParameterMap());
		Page<OrganizationDefinition> page = new Page<OrganizationDefinition>(pageNo, pageSize);
		IPage<OrganizationDefinition> pageList = organizationDefinitionService.page(page, queryWrapper);
		return Result.OK(pageList);
	}
	
	/**
	 *   添加
	 *
	 * @param organizationDefinition
	 * @return
	 */
	@AutoLog(value = "机构组织定义-添加")
	@ApiOperation(value="机构组织定义-添加", notes="机构组织定义-添加")
	@RequiresPermissions("edu.foudation:organization_definition:add")
	@PostMapping(value = "/add")
	public Result<String> add(@RequestBody OrganizationDefinition organizationDefinition) {
		organizationDefinitionService.save(organizationDefinition);
		return Result.OK("添加成功！");
	}
	
	/**
	 *  编辑
	 *
	 * @param organizationDefinition
	 * @return
	 */
	@AutoLog(value = "机构组织定义-编辑")
	@ApiOperation(value="机构组织定义-编辑", notes="机构组织定义-编辑")
	@RequiresPermissions("edu.foudation:organization_definition:edit")
	@RequestMapping(value = "/edit", method = {RequestMethod.PUT,RequestMethod.POST})
	public Result<String> edit(@RequestBody OrganizationDefinition organizationDefinition) {
		organizationDefinitionService.updateById(organizationDefinition);
		return Result.OK("编辑成功!");
	}
	
	/**
	 *   通过id删除
	 *
	 * @param id
	 * @return
	 */
	@AutoLog(value = "机构组织定义-通过id删除")
	@ApiOperation(value="机构组织定义-通过id删除", notes="机构组织定义-通过id删除")
	@RequiresPermissions("edu.foudation:organization_definition:delete")
	@DeleteMapping(value = "/delete")
	public Result<String> delete(@RequestParam(name="id",required=true) String id) {
		organizationDefinitionService.removeById(id);
		return Result.OK("删除成功!");
	}
	
	/**
	 *  批量删除
	 *
	 * @param ids
	 * @return
	 */
	@AutoLog(value = "机构组织定义-批量删除")
	@ApiOperation(value="机构组织定义-批量删除", notes="机构组织定义-批量删除")
	@RequiresPermissions("edu.foudation:organization_definition:deleteBatch")
	@DeleteMapping(value = "/deleteBatch")
	public Result<String> deleteBatch(@RequestParam(name="ids",required=true) String ids) {
		this.organizationDefinitionService.removeByIds(Arrays.asList(ids.split(",")));
		return Result.OK("批量删除成功!");
	}
	
	/**
	 * 通过id查询
	 *
	 * @param id
	 * @return
	 */
	//@AutoLog(value = "机构组织定义-通过id查询")
	@ApiOperation(value="机构组织定义-通过id查询", notes="机构组织定义-通过id查询")
	@GetMapping(value = "/queryById")
	public Result<OrganizationDefinition> queryById(@RequestParam(name="id",required=true) String id) {
		OrganizationDefinition organizationDefinition = organizationDefinitionService.getById(id);
		if(organizationDefinition==null) {
			return Result.error("未找到对应数据");
		}
		return Result.OK(organizationDefinition);
	}

    /**
    * 导出excel
    *
    * @param request
    * @param organizationDefinition
    */
    @RequiresPermissions("edu.foudation:organization_definition:exportXls")
    @RequestMapping(value = "/exportXls")
    public ModelAndView exportXls(HttpServletRequest request, OrganizationDefinition organizationDefinition) {
        return super.exportXls(request, organizationDefinition, OrganizationDefinition.class, "机构组织定义");
    }

    /**
      * 通过excel导入数据
    *
    * @param request
    * @param response
    * @return
    */
    @RequiresPermissions("edu.foudation:organization_definition:importExcel")
    @RequestMapping(value = "/importExcel", method = RequestMethod.POST)
    public Result<?> importExcel(HttpServletRequest request, HttpServletResponse response) {
        return super.importExcel(request, response, OrganizationDefinition.class);
    }

}
