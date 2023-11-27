package org.eemp.modules.edu.hazard.controller;

import java.util.*;
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
import org.eemp.common.aspect.annotation.PermissionData;
import org.eemp.common.system.base.controller.BaseController;
import org.eemp.common.system.query.QueryGenerator;
import org.eemp.modules.edu.foudation.service.IFillingControlService;
import org.eemp.modules.edu.hazard.entity.MonthlyDocOfChemicalHazards;
import org.eemp.modules.edu.hazard.service.IMonthlyDocOfChemicalHazardsService;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

/**
 * @Description: 实验室安全防护与化学危险品管理月报表
 * @Date:   2023-11-22
 * @Version: V1.0
 */
@Api(tags="实验室安全防护与化学危险品管理月报表")
@RestController
@RequestMapping("/org.eemp.modules.edu.hazard/monthlyDocOfChemicalHazards")
@Slf4j
@RequiredArgsConstructor
public class MonthlyDocOfChemicalHazardsController extends BaseController<MonthlyDocOfChemicalHazards, IMonthlyDocOfChemicalHazardsService> {
	private final IMonthlyDocOfChemicalHazardsService monthlyDocOfChemicalHazardsService;
	private final IFillingControlService fillingControlService;

	/**
	 * 分页列表查询
	 *
	 * @param monthlyDocOfChemicalHazards
	 * @param pageNo
	 * @param pageSize
	 * @param req
	 * @return
	 */
	//@AutoLog(value = "实验室安全防护与化学危险品管理月报表-分页列表查询")
	@ApiOperation(value="实验室安全防护与化学危险品管理月报表-分页列表查询", notes="实验室安全防护与化学危险品管理月报表-分页列表查询")
	@GetMapping(value = "/list")
	@PermissionData(pageComponent = "edu/hazard/MonthlyDocOfChemicalHazardsList")
	public Result<IPage<MonthlyDocOfChemicalHazards>> queryPageList(MonthlyDocOfChemicalHazards monthlyDocOfChemicalHazards,
								   @RequestParam(name="pageNo", defaultValue="1") Integer pageNo,
								   @RequestParam(name="pageSize", defaultValue="10") Integer pageSize,
								   HttpServletRequest req) {
		QueryWrapper<MonthlyDocOfChemicalHazards> queryWrapper = QueryGenerator.initQueryWrapper(monthlyDocOfChemicalHazards, req.getParameterMap());
		Page<MonthlyDocOfChemicalHazards> page = new Page<MonthlyDocOfChemicalHazards>(pageNo, pageSize);
		IPage<MonthlyDocOfChemicalHazards> pageList = monthlyDocOfChemicalHazardsService.page(page, queryWrapper);
		return Result.OK(pageList);
	}
	
	/**
	 *   添加
	 *
	 * @param monthlyDocOfChemicalHazards
	 * @return
	 */
	@AutoLog(value = "实验室安全防护与化学危险品管理月报表-添加")
	@ApiOperation(value="实验室安全防护与化学危险品管理月报表-添加", notes="实验室安全防护与化学危险品管理月报表-添加")
	@RequiresPermissions("edu.hazard:monthly_doc_of_chemical_hazards:add")
	@PostMapping(value = "/add")
	public Result<String> add(@RequestBody MonthlyDocOfChemicalHazards monthlyDocOfChemicalHazards) {
		monthlyDocOfChemicalHazardsService.save(monthlyDocOfChemicalHazards);
		boolean rst = fillingControlService.updateFillingControlAfterNewData(
				monthlyDocOfChemicalHazards.getIdentificationCode(),
				"monthly_doc_of_chemical_hazards",
				monthlyDocOfChemicalHazards.getId()
		);
		return Result.OK("添加成功！");
	}
	
	/**
	 *  编辑
	 *
	 * @param monthlyDocOfChemicalHazards
	 * @return
	 */
	@AutoLog(value = "实验室安全防护与化学危险品管理月报表-编辑")
	@ApiOperation(value="实验室安全防护与化学危险品管理月报表-编辑", notes="实验室安全防护与化学危险品管理月报表-编辑")
	@RequiresPermissions("edu.hazard:monthly_doc_of_chemical_hazards:edit")
	@RequestMapping(value = "/edit", method = {RequestMethod.PUT,RequestMethod.POST})
	public Result<String> edit(@RequestBody MonthlyDocOfChemicalHazards monthlyDocOfChemicalHazards) {
		monthlyDocOfChemicalHazardsService.updateById(monthlyDocOfChemicalHazards);
		return Result.OK("编辑成功!");
	}
	
	/**
	 *   通过id删除
	 *
	 * @param id
	 * @return
	 */
	@AutoLog(value = "实验室安全防护与化学危险品管理月报表-通过id删除")
	@ApiOperation(value="实验室安全防护与化学危险品管理月报表-通过id删除", notes="实验室安全防护与化学危险品管理月报表-通过id删除")
	@RequiresPermissions("edu.hazard:monthly_doc_of_chemical_hazards:delete")
	@DeleteMapping(value = "/delete")
	public Result<String> delete(@RequestParam(name="id",required=true) String id) {
		MonthlyDocOfChemicalHazards rec = monthlyDocOfChemicalHazardsService.getById(id);
		monthlyDocOfChemicalHazardsService.removeById(id);
		boolean rst = fillingControlService.updateFillingControlAfterDeleteData(
				rec.getIdentificationCode(),
				"monthly_doc_of_chemical_hazards",
				id
		);
		return Result.OK("删除成功!");
	}
	
	/**
	 *  批量删除
	 *
	 * @param ids
	 * @return
	 */
	@AutoLog(value = "实验室安全防护与化学危险品管理月报表-批量删除")
	@ApiOperation(value="实验室安全防护与化学危险品管理月报表-批量删除", notes="实验室安全防护与化学危险品管理月报表-批量删除")
	@RequiresPermissions("edu.hazard:monthly_doc_of_chemical_hazards:deleteBatch")
	@DeleteMapping(value = "/deleteBatch")
	public Result<String> deleteBatch(@RequestParam(name="ids",required=true) String ids) {
		this.monthlyDocOfChemicalHazardsService.removeByIds(Arrays.asList(ids.split(",")));
		return Result.OK("批量删除成功!");
	}
	
	/**
	 * 通过id查询
	 *
	 * @param id
	 * @return
	 */
	//@AutoLog(value = "实验室安全防护与化学危险品管理月报表-通过id查询")
	@ApiOperation(value="实验室安全防护与化学危险品管理月报表-通过id查询", notes="实验室安全防护与化学危险品管理月报表-通过id查询")
	@GetMapping(value = "/queryById")
	public Result<MonthlyDocOfChemicalHazards> queryById(@RequestParam(name="id",required=true) String id) {
		MonthlyDocOfChemicalHazards monthlyDocOfChemicalHazards = monthlyDocOfChemicalHazardsService.getById(id);
		if(monthlyDocOfChemicalHazards==null) {
			return Result.error("未找到对应数据");
		}
		return Result.OK(monthlyDocOfChemicalHazards);
	}

    /**
    * 导出excel
    *
    * @param request
    * @param monthlyDocOfChemicalHazards
    */
    @RequiresPermissions("edu.hazard:monthly_doc_of_chemical_hazards:exportXls")
    @RequestMapping(value = "/exportXls")
	@PermissionData(pageComponent = "edu/hazard/MonthlyDocOfChemicalHazardsList")
    public ModelAndView exportXls(HttpServletRequest request, MonthlyDocOfChemicalHazards monthlyDocOfChemicalHazards) {
        return super.exportXls(request, monthlyDocOfChemicalHazards, MonthlyDocOfChemicalHazards.class, "实验室安全防护与化学危险品管理月报表");
    }

    /**
      * 通过excel导入数据
    *
    * @param request
    * @param response
    * @return
    */
    @RequiresPermissions("edu.hazard:monthly_doc_of_chemical_hazards:importExcel")
    @RequestMapping(value = "/importExcel", method = RequestMethod.POST)
    public Result<?> importExcel(HttpServletRequest request, HttpServletResponse response) {
        return super.importExcel(request, response, MonthlyDocOfChemicalHazards.class);
    }

	@RequiresPermissions("edu.hazard:monthly_doc_of_chemical_hazards:report")
	@PostMapping(value = "/report")
	public Result<String> report(@RequestParam(name="identificationCode", required=true) String identificationCode, @RequestParam(name="id", required=true) String id) {
		monthlyDocOfChemicalHazardsService.changeReported(id, 1);
		boolean rst = fillingControlService.updateFillingControlAfterReported(
				identificationCode,
				"monthly_doc_of_chemical_hazards"
		);
		return Result.OK("上报成功!");
	}

	@RequiresPermissions("edu.hazard:monthly_doc_of_chemical_hazards:revoke")
	@PostMapping(value = "/revoke")
	public Result<String> revoke(@RequestParam(name="ids", required=true) String ids) {
		for (String id: ids.split(",")) {
			MonthlyDocOfChemicalHazards rec = monthlyDocOfChemicalHazardsService.getById(id);
			monthlyDocOfChemicalHazardsService.changeReported(id, 0);
			boolean rst = fillingControlService.updateFillingControlAfterRevoked(
					rec.getIdentificationCode(),
					"monthly_doc_of_chemical_hazards"
			);
		}
		return Result.OK("退回成功!");
	}

}
