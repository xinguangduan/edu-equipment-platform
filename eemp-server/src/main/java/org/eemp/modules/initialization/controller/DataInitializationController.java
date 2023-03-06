package org.eemp.modules.initialization.controller;

import java.util.Arrays;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.eemp.common.api.vo.Result;
import org.eemp.common.aspect.annotation.AutoLog;
import org.eemp.common.system.base.controller.JeecgController;
import org.eemp.common.system.query.QueryGenerator;
import org.eemp.modules.initialization.entity.DataInitialization;
import org.eemp.modules.initialization.service.IDataInitializationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

 /**
 * @Description: 数据初始化
 * @Author: jeecg-boot
 * @Date:   2023-02-28
 * @Version: V1.0
 */
@Api(tags="数据初始化")
@RestController
@RequestMapping("/initialization/dataInitialization")
@Slf4j
public class DataInitializationController extends JeecgController<DataInitialization, IDataInitializationService> {
	@Autowired
	private IDataInitializationService dataInitializationService;
	
	/**
	 * 分页列表查询
	 *
	 * @param dataInitialization
	 * @param pageNo
	 * @param pageSize
	 * @param req
	 * @return
	 */
	//@AutoLog(value = "数据初始化-分页列表查询")
	@ApiOperation(value="数据初始化-分页列表查询", notes="数据初始化-分页列表查询")
	@GetMapping(value = "/list")
	public Result<IPage<DataInitialization>> queryPageList(DataInitialization dataInitialization,
								   @RequestParam(name="pageNo", defaultValue="1") Integer pageNo,
								   @RequestParam(name="pageSize", defaultValue="10") Integer pageSize,
								   HttpServletRequest req) {
		QueryWrapper<DataInitialization> queryWrapper = QueryGenerator.initQueryWrapper(dataInitialization, req.getParameterMap());
		Page<DataInitialization> page = new Page<DataInitialization>(pageNo, pageSize);
		IPage<DataInitialization> pageList = dataInitializationService.page(page, queryWrapper);
		return Result.OK(pageList);
	}
	
	/**
	 *   添加
	 *
	 * @param dataInitialization
	 * @return
	 */
	@AutoLog(value = "数据初始化-添加")
	@ApiOperation(value="数据初始化-添加", notes="数据初始化-添加")
	//@RequiresPermissions("org.jeecg.modules.demo:data_initialization:add")
	@PostMapping(value = "/add")
	public Result<String> add(@RequestBody DataInitialization dataInitialization) {
		dataInitializationService.save(dataInitialization);
		return Result.OK("添加成功！");
	}
	
	/**
	 *  编辑
	 *
	 * @param dataInitialization
	 * @return
	 */
	@AutoLog(value = "数据初始化-编辑")
	@ApiOperation(value="数据初始化-编辑", notes="数据初始化-编辑")
	//@RequiresPermissions("org.jeecg.modules.demo:data_initialization:edit")
	@RequestMapping(value = "/edit", method = {RequestMethod.PUT,RequestMethod.POST})
	public Result<String> edit(@RequestBody DataInitialization dataInitialization) {
		dataInitializationService.updateById(dataInitialization);
		return Result.OK("编辑成功!");
	}
	
	/**
	 *   通过id删除
	 *
	 * @param id
	 * @return
	 */
	@AutoLog(value = "数据初始化-通过id删除")
	@ApiOperation(value="数据初始化-通过id删除", notes="数据初始化-通过id删除")
	//@RequiresPermissions("org.jeecg.modules.demo:data_initialization:delete")
	@DeleteMapping(value = "/delete")
	public Result<String> delete(@RequestParam(name="id",required=true) String id) {
		dataInitializationService.removeById(id);
		return Result.OK("删除成功!");
	}
	
	/**
	 *  批量删除
	 *
	 * @param ids
	 * @return
	 */
	@AutoLog(value = "数据初始化-批量删除")
	@ApiOperation(value="数据初始化-批量删除", notes="数据初始化-批量删除")
	//@RequiresPermissions("org.jeecg.modules.demo:data_initialization:deleteBatch")
	@DeleteMapping(value = "/deleteBatch")
	public Result<String> deleteBatch(@RequestParam(name="ids",required=true) String ids) {
		this.dataInitializationService.removeByIds(Arrays.asList(ids.split(",")));
		return Result.OK("批量删除成功!");
	}
	
	/**
	 * 通过id查询
	 *
	 * @param id
	 * @return
	 */
	//@AutoLog(value = "数据初始化-通过id查询")
	@ApiOperation(value="数据初始化-通过id查询", notes="数据初始化-通过id查询")
	@GetMapping(value = "/queryById")
	public Result<DataInitialization> queryById(@RequestParam(name="id",required=true) String id) {
		DataInitialization dataInitialization = dataInitializationService.getById(id);
		if(dataInitialization==null) {
			return Result.error("未找到对应数据");
		}
		return Result.OK(dataInitialization);
	}

    /**
    * 导出excel
    *
    * @param request
    * @param dataInitialization
    */
    //@RequiresPermissions("org.jeecg.modules.demo:data_initialization:exportXls")
    @RequestMapping(value = "/exportXls")
    public ModelAndView exportXls(HttpServletRequest request, DataInitialization dataInitialization) {
        return super.exportXls(request, dataInitialization, DataInitialization.class, "数据初始化");
    }

    /**
      * 通过excel导入数据
    *
    * @param request
    * @param response
    * @return
    */
    @RequiresPermissions("data_initialization:importExcel")
    @RequestMapping(value = "/importExcel", method = RequestMethod.POST)
    public Result<?> importExcel(HttpServletRequest request, HttpServletResponse response) {
        return super.importExcel(request, response, DataInitialization.class);
    }

}
