package org.eemp.modules.edu.hazard.controller;

import java.util.Arrays;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lombok.RequiredArgsConstructor;
import org.eemp.common.api.vo.Result;
import org.eemp.common.aspect.annotation.PermissionData;
import org.eemp.common.system.query.QueryGenerator;
import org.eemp.common.util.oConvertUtils;
import org.eemp.modules.edu.hazard.entity.SigningOfSecurityResponsibility;
import org.eemp.modules.edu.hazard.service.ISigningOfSecurityResponsibilityService;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.extern.slf4j.Slf4j;

import org.eemp.common.system.base.controller.BaseController;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.eemp.common.aspect.annotation.AutoLog;
import org.apache.shiro.authz.annotation.RequiresPermissions;

 /**
 * @Description: 安全责任书签订
 * @Date:   2023-11-29
 * @Version: V1.0
 */
@Api(tags="安全责任书签订")
@RestController
@RequestMapping("/org.eemp.modules.edu.hazard/signingOfSecurityResponsibility")
@Slf4j
@RequiredArgsConstructor
public class SigningOfSecurityResponsibilityController extends BaseController<SigningOfSecurityResponsibility, ISigningOfSecurityResponsibilityService> {
	private final ISigningOfSecurityResponsibilityService signingOfSecurityResponsibilityService;
	
	/**
	 * 分页列表查询
	 *
	 * @param signingOfSecurityResponsibility
	 * @param pageNo
	 * @param pageSize
	 * @param req
	 * @return
	 */
	//@AutoLog(value = "安全责任书签订-分页列表查询")
	@ApiOperation(value="安全责任书签订-分页列表查询", notes="安全责任书签订-分页列表查询")
	@GetMapping(value = "/list")
	@PermissionData(pageComponent = "edu/hazard/signingOfSecurityResponsibilityList")
	public Result<IPage<SigningOfSecurityResponsibility>> queryPageList(SigningOfSecurityResponsibility signingOfSecurityResponsibility,
								   @RequestParam(name="pageNo", defaultValue="1") Integer pageNo,
								   @RequestParam(name="pageSize", defaultValue="10") Integer pageSize,
								   HttpServletRequest req) {
		QueryWrapper<SigningOfSecurityResponsibility> queryWrapper = QueryGenerator.initQueryWrapper(signingOfSecurityResponsibility, req.getParameterMap());
		Page<SigningOfSecurityResponsibility> page = new Page<SigningOfSecurityResponsibility>(pageNo, pageSize);
		IPage<SigningOfSecurityResponsibility> pageList = signingOfSecurityResponsibilityService.page(page, queryWrapper);
		return Result.OK(pageList);
	}
	
	/**
	 *   添加
	 *
	 * @param signingOfSecurityResponsibility
	 * @return
	 */
	@AutoLog(value = "安全责任书签订-添加")
	@ApiOperation(value="安全责任书签订-添加", notes="安全责任书签订-添加")
	@RequiresPermissions("edu.hazard:signing_of_security_responsibility:add")
	@PostMapping(value = "/add")
	public Result<String> add(@RequestBody SigningOfSecurityResponsibility signingOfSecurityResponsibility) {
		signingOfSecurityResponsibilityService.save(signingOfSecurityResponsibility);
		return Result.OK("添加成功！");
	}
	
	/**
	 *  编辑
	 *
	 * @param signingOfSecurityResponsibility
	 * @return
	 */
	@AutoLog(value = "安全责任书签订-编辑")
	@ApiOperation(value="安全责任书签订-编辑", notes="安全责任书签订-编辑")
	@RequiresPermissions("edu.hazard:signing_of_security_responsibility:edit")
	@RequestMapping(value = "/edit", method = {RequestMethod.PUT,RequestMethod.POST})
	public Result<String> edit(@RequestBody SigningOfSecurityResponsibility signingOfSecurityResponsibility) {
		signingOfSecurityResponsibilityService.updateById(signingOfSecurityResponsibility);
		return Result.OK("编辑成功!");
	}
	
	/**
	 *   通过id删除
	 *
	 * @param id
	 * @return
	 */
	@AutoLog(value = "安全责任书签订-通过id删除")
	@ApiOperation(value="安全责任书签订-通过id删除", notes="安全责任书签订-通过id删除")
	@RequiresPermissions("edu.hazard:signing_of_security_responsibility:delete")
	@DeleteMapping(value = "/delete")
	public Result<String> delete(@RequestParam(name="id",required=true) String id) {
		signingOfSecurityResponsibilityService.removeById(id);
		return Result.OK("删除成功!");
	}
	
	/**
	 *  批量删除
	 *
	 * @param ids
	 * @return
	 */
	@AutoLog(value = "安全责任书签订-批量删除")
	@ApiOperation(value="安全责任书签订-批量删除", notes="安全责任书签订-批量删除")
	@RequiresPermissions("edu.hazard:signing_of_security_responsibility:deleteBatch")
	@DeleteMapping(value = "/deleteBatch")
	public Result<String> deleteBatch(@RequestParam(name="ids",required=true) String ids) {
		this.signingOfSecurityResponsibilityService.removeByIds(Arrays.asList(ids.split(",")));
		return Result.OK("批量删除成功!");
	}
	
	/**
	 * 通过id查询
	 *
	 * @param id
	 * @return
	 */
	//@AutoLog(value = "安全责任书签订-通过id查询")
	@ApiOperation(value="安全责任书签订-通过id查询", notes="安全责任书签订-通过id查询")
	@GetMapping(value = "/queryById")
	public Result<SigningOfSecurityResponsibility> queryById(@RequestParam(name="id",required=true) String id) {
		SigningOfSecurityResponsibility signingOfSecurityResponsibility = signingOfSecurityResponsibilityService.getById(id);
		if(signingOfSecurityResponsibility==null) {
			return Result.error("未找到对应数据");
		}
		return Result.OK(signingOfSecurityResponsibility);
	}

    /**
    * 导出excel
    *
    * @param request
    * @param signingOfSecurityResponsibility
    */
    @RequiresPermissions("edu.hazard:signing_of_security_responsibility:exportXls")
    @RequestMapping(value = "/exportXls")
	@PermissionData(pageComponent = "edu/hazard/signingOfSecurityResponsibilityList")
    public ModelAndView exportXls(HttpServletRequest request, SigningOfSecurityResponsibility signingOfSecurityResponsibility) {
        return super.exportXls(request, signingOfSecurityResponsibility, SigningOfSecurityResponsibility.class, "安全责任书签订");
    }

    /**
      * 通过excel导入数据
    *
    * @param request
    * @param response
    * @return
    */
    @RequiresPermissions("edu.hazard:signing_of_security_responsibility:importExcel")
    @RequestMapping(value = "/importExcel", method = RequestMethod.POST)
    public Result<?> importExcel(HttpServletRequest request, HttpServletResponse response) {
        return super.importExcel(request, response, SigningOfSecurityResponsibility.class);
    }

}
