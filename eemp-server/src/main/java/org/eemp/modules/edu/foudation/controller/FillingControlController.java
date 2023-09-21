package org.eemp.modules.edu.foudation.controller;

import java.util.Arrays;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONObject;
import org.eemp.common.api.vo.Result;
import org.eemp.common.system.query.QueryGenerator;
import org.eemp.modules.edu.foudation.entity.FillingControl;
import org.eemp.modules.edu.foudation.service.IFillingControlService;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.extern.slf4j.Slf4j;

import org.eemp.common.system.base.controller.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.eemp.common.aspect.annotation.AutoLog;
import org.apache.shiro.authz.annotation.RequiresPermissions;

 /**
 * @Description: 填报控制
 * @Date:   2023-09-14
 * @Version: V1.0
 */
@Api(tags="填报控制")
@RestController
@RequestMapping("/org.eemp.modules.edu.foudation/fillingControl")
@Slf4j
public class FillingControlController extends BaseController<FillingControl, IFillingControlService> {
	@Autowired
	private IFillingControlService fillingControlService;
	
	/**
	 * 分页列表查询
	 *
	 * @param fillingControl
	 * @param pageNo
	 * @param pageSize
	 * @param req
	 * @return
	 */
	//@AutoLog(value = "填报控制-分页列表查询")
	@ApiOperation(value="填报控制-分页列表查询", notes="填报控制-分页列表查询")
	@GetMapping(value = "/list")
	public Result<IPage<FillingControl>> queryPageList(FillingControl fillingControl,
								   @RequestParam(name="pageNo", defaultValue="1") Integer pageNo,
								   @RequestParam(name="pageSize", defaultValue="10") Integer pageSize,
								   HttpServletRequest req) {
		QueryWrapper<FillingControl> queryWrapper = QueryGenerator.initQueryWrapper(fillingControl, req.getParameterMap());
		Page<FillingControl> page = new Page<FillingControl>(pageNo, pageSize);
		IPage<FillingControl> pageList = fillingControlService.page(page, queryWrapper);
		return Result.OK(pageList);
	}
	
	/**
	 *   添加
	 *
	 * @param fillingControl
	 * @return
	 */
	@AutoLog(value = "填报控制-添加")
	@ApiOperation(value="填报控制-添加", notes="填报控制-添加")
	@RequiresPermissions("edu.foudation:filling_control:add")
	@PostMapping(value = "/add")
	public Result<String> add(@RequestBody FillingControl fillingControl) {
		fillingControlService.save(fillingControl);
		return Result.OK("添加成功！");
	}
	
	/**
	 *  编辑
	 *
	 * @param fillingControl
	 * @return
	 */
	@AutoLog(value = "填报控制-编辑")
	@ApiOperation(value="填报控制-编辑", notes="填报控制-编辑")
	@RequiresPermissions("edu.foudation:filling_control:edit")
	@RequestMapping(value = "/edit", method = {RequestMethod.PUT,RequestMethod.POST})
	public Result<String> edit(@RequestBody FillingControl fillingControl) {
		fillingControlService.updateById(fillingControl);
		return Result.OK("编辑成功!");
	}
	
	/**
	 *   通过id删除
	 *
	 * @param id
	 * @return
	 */
	@AutoLog(value = "填报控制-通过id删除")
	@ApiOperation(value="填报控制-通过id删除", notes="填报控制-通过id删除")
	@RequiresPermissions("edu.foudation:filling_control:delete")
	@DeleteMapping(value = "/delete")
	public Result<String> delete(@RequestParam(name="id",required=true) String id) {
		fillingControlService.removeById(id);
		return Result.OK("删除成功!");
	}
	
	/**
	 *  批量删除
	 *
	 * @param ids
	 * @return
	 */
	@AutoLog(value = "填报控制-批量删除")
	@ApiOperation(value="填报控制-批量删除", notes="填报控制-批量删除")
	@RequiresPermissions("edu.foudation:filling_control:deleteBatch")
	@DeleteMapping(value = "/deleteBatch")
	public Result<String> deleteBatch(@RequestParam(name="ids",required=true) String ids) {
		this.fillingControlService.removeByIds(Arrays.asList(ids.split(",")));
		return Result.OK("批量删除成功!");
	}
	
	/**
	 * 通过id查询
	 *
	 * @param id
	 * @return
	 */
	//@AutoLog(value = "填报控制-通过id查询")
	@ApiOperation(value="填报控制-通过id查询", notes="填报控制-通过id查询")
	@GetMapping(value = "/queryById")
	public Result<FillingControl> queryById(@RequestParam(name="id",required=true) String id) {
		FillingControl fillingControl = fillingControlService.getById(id);
		if(fillingControl==null) {
			return Result.error("未找到对应数据");
		}
		return Result.OK(fillingControl);
	}

    /**
    * 导出excel
    *
    * @param request
    * @param fillingControl
    */
    @RequiresPermissions("edu.foudation:filling_control:exportXls")
    @RequestMapping(value = "/exportXls")
    public ModelAndView exportXls(HttpServletRequest request, FillingControl fillingControl) {
        return super.exportXls(request, fillingControl, FillingControl.class, "填报控制");
    }

    /**
      * 通过excel导入数据
    *
    * @param request
    * @param response
    * @return
    */
    @RequiresPermissions("edu.foudation:filling_control:importExcel")
    @RequestMapping(value = "/importExcel", method = RequestMethod.POST)
    public Result<?> importExcel(HttpServletRequest request, HttpServletResponse response) {
        return super.importExcel(request, response, FillingControl.class);
    }

	@GetMapping(value = "/getFillingControl")
	public Result getFillingControl(@RequestParam("reqData") String reqData) {
		Map map = (Map) JSONObject.parse(reqData);
		String identificationCode = (String) map.get("identificationCode");
		String packageName = (String) map.get("packageName");
		JSONObject json = service.getFillingControl(identificationCode, packageName);
		return Result.OK(json);
	}
}
