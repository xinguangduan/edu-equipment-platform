package org.eemp.modules.functional.controller;

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
import org.eemp.modules.functional.entity.FunctionalClassroomInfo;
import org.eemp.modules.functional.service.IFunctionalClassroomInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

 /**
 * @Description: 功能室信息
 * @Author: jeecg-boot
 * @Date:   2023-02-24
 * @Version: V1.0
 */
@Api(tags="功能室信息")
@RestController
@RequestMapping("/functional/functionalClassroomInfo")
@Slf4j
public class FunctionalClassroomInfoController extends JeecgController<FunctionalClassroomInfo, IFunctionalClassroomInfoService> {
	@Autowired
	private IFunctionalClassroomInfoService functionalClassroomInfoService;
	
	/**
	 * 分页列表查询
	 *
	 * @param functionalClassroomInfo
	 * @param pageNo
	 * @param pageSize
	 * @param req
	 * @return
	 */
	//@AutoLog(value = "功能室信息-分页列表查询")
	@ApiOperation(value="功能室信息-分页列表查询", notes="功能室信息-分页列表查询")
	@GetMapping(value = "/list")
	public Result<IPage<FunctionalClassroomInfo>> queryPageList(FunctionalClassroomInfo functionalClassroomInfo,
								   @RequestParam(name="pageNo", defaultValue="1") Integer pageNo,
								   @RequestParam(name="pageSize", defaultValue="10") Integer pageSize,
								   HttpServletRequest req) {
		QueryWrapper<FunctionalClassroomInfo> queryWrapper = QueryGenerator.initQueryWrapper(functionalClassroomInfo, req.getParameterMap());
		Page<FunctionalClassroomInfo> page = new Page<FunctionalClassroomInfo>(pageNo, pageSize);
		IPage<FunctionalClassroomInfo> pageList = functionalClassroomInfoService.page(page, queryWrapper);
		return Result.OK(pageList);
	}
	
	/**
	 *   添加
	 *
	 * @param functionalClassroomInfo
	 * @return
	 */
	@AutoLog(value = "功能室信息-添加")
	@ApiOperation(value="功能室信息-添加", notes="功能室信息-添加")
	//@RequiresPermissions("org.jeecg.modules.demo:functional_classroom_info:add")
	@PostMapping(value = "/add")
	public Result<String> add(@RequestBody FunctionalClassroomInfo functionalClassroomInfo) {
		functionalClassroomInfoService.save(functionalClassroomInfo);
		return Result.OK("添加成功！");
	}
	
	/**
	 *  编辑
	 *
	 * @param functionalClassroomInfo
	 * @return
	 */
	@AutoLog(value = "功能室信息-编辑")
	@ApiOperation(value="功能室信息-编辑", notes="功能室信息-编辑")
	//@RequiresPermissions("org.jeecg.modules.demo:functional_classroom_info:edit")
	@RequestMapping(value = "/edit", method = {RequestMethod.PUT,RequestMethod.POST})
	public Result<String> edit(@RequestBody FunctionalClassroomInfo functionalClassroomInfo) {
		functionalClassroomInfoService.updateById(functionalClassroomInfo);
		return Result.OK("编辑成功!");
	}
	
	/**
	 *   通过id删除
	 *
	 * @param id
	 * @return
	 */
	@AutoLog(value = "功能室信息-通过id删除")
	@ApiOperation(value="功能室信息-通过id删除", notes="功能室信息-通过id删除")
	//@RequiresPermissions("org.jeecg.modules.demo:functional_classroom_info:delete")
	@DeleteMapping(value = "/delete")
	public Result<String> delete(@RequestParam(name="id",required=true) String id) {
		functionalClassroomInfoService.removeById(id);
		return Result.OK("删除成功!");
	}
	
	/**
	 *  批量删除
	 *
	 * @param ids
	 * @return
	 */
	@AutoLog(value = "功能室信息-批量删除")
	@ApiOperation(value="功能室信息-批量删除", notes="功能室信息-批量删除")
	//@RequiresPermissions("org.jeecg.modules.demo:functional_classroom_info:deleteBatch")
	@DeleteMapping(value = "/deleteBatch")
	public Result<String> deleteBatch(@RequestParam(name="ids",required=true) String ids) {
		this.functionalClassroomInfoService.removeByIds(Arrays.asList(ids.split(",")));
		return Result.OK("批量删除成功!");
	}
	
	/**
	 * 通过id查询
	 *
	 * @param id
	 * @return
	 */
	//@AutoLog(value = "功能室信息-通过id查询")
	@ApiOperation(value="功能室信息-通过id查询", notes="功能室信息-通过id查询")
	@GetMapping(value = "/queryById")
	public Result<FunctionalClassroomInfo> queryById(@RequestParam(name="id",required=true) String id) {
		FunctionalClassroomInfo functionalClassroomInfo = functionalClassroomInfoService.getById(id);
		if(functionalClassroomInfo==null) {
			return Result.error("未找到对应数据");
		}
		return Result.OK(functionalClassroomInfo);
	}

    /**
    * 导出excel
    *
    * @param request
    * @param functionalClassroomInfo
    */
    //@RequiresPermissions("org.jeecg.modules.demo:functional_classroom_info:exportXls")
    @RequestMapping(value = "/exportXls")
    public ModelAndView exportXls(HttpServletRequest request, FunctionalClassroomInfo functionalClassroomInfo) {
        return super.exportXls(request, functionalClassroomInfo, FunctionalClassroomInfo.class, "功能室信息");
    }

    /**
      * 通过excel导入数据
    *
    * @param request
    * @param response
    * @return
    */
    //@RequiresPermissions("functional_classroom_info:importExcel")
    @RequestMapping(value = "/importExcel", method = RequestMethod.POST)
    public Result<?> importExcel(HttpServletRequest request, HttpServletResponse response) {
        return super.importExcel(request, response, FunctionalClassroomInfo.class);
    }

}
