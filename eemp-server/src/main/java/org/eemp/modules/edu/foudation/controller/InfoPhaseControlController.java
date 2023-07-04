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
import org.eemp.modules.edu.foudation.entity.InfoPhaseControl;
import org.eemp.modules.edu.foudation.service.IInfoPhaseControlService;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

 /**
 * @Description: 信息时段控制表
 * @Date:   2023-06-04
 * @Version: V1.0
 */
@Api(tags="信息时段控制表")
@RestController
@RequestMapping("/org.eemp.modules.edu.foudation/infoPhaseControl")
@Slf4j
@RequiredArgsConstructor
public class InfoPhaseControlController extends BaseController<InfoPhaseControl, IInfoPhaseControlService> {
	private final IInfoPhaseControlService infoPhaseControlService;
	
	/**
	 * 分页列表查询
	 *
	 * @param infoPhaseControl
	 * @param pageNo
	 * @param pageSize
	 * @param req
	 * @return
	 */
	//@AutoLog(value = "信息时段控制表-分页列表查询")
	@ApiOperation(value="信息时段控制表-分页列表查询", notes="信息时段控制表-分页列表查询")
	@GetMapping(value = "/list")
	public Result<IPage<InfoPhaseControl>> queryPageList(InfoPhaseControl infoPhaseControl,
								   @RequestParam(name="pageNo", defaultValue="1") Integer pageNo,
								   @RequestParam(name="pageSize", defaultValue="10") Integer pageSize,
								   HttpServletRequest req) {
		QueryWrapper<InfoPhaseControl> queryWrapper = QueryGenerator.initQueryWrapper(infoPhaseControl, req.getParameterMap());
		Page<InfoPhaseControl> page = new Page<InfoPhaseControl>(pageNo, pageSize);
		IPage<InfoPhaseControl> pageList = infoPhaseControlService.page(page, queryWrapper);
		return Result.OK(pageList);
	}
	
	/**
	 *   添加
	 *
	 * @param infoPhaseControl
	 * @return
	 */
	@AutoLog(value = "信息时段控制表-添加")
	@ApiOperation(value="信息时段控制表-添加", notes="信息时段控制表-添加")
	@RequiresPermissions("edu.foudation:info_phase_control:add")
	@PostMapping(value = "/add")
	public Result<String> add(@RequestBody InfoPhaseControl infoPhaseControl) {
		infoPhaseControlService.save(infoPhaseControl);
		return Result.OK("添加成功！");
	}
	
	/**
	 *  编辑
	 *
	 * @param infoPhaseControl
	 * @return
	 */
	@AutoLog(value = "信息时段控制表-编辑")
	@ApiOperation(value="信息时段控制表-编辑", notes="信息时段控制表-编辑")
	@RequiresPermissions("edu.foudation:info_phase_control:edit")
	@RequestMapping(value = "/edit", method = {RequestMethod.PUT,RequestMethod.POST})
	public Result<String> edit(@RequestBody InfoPhaseControl infoPhaseControl) {
		infoPhaseControlService.updateById(infoPhaseControl);
		return Result.OK("编辑成功!");
	}
	
	/**
	 *   通过id删除
	 *
	 * @param id
	 * @return
	 */
	@AutoLog(value = "信息时段控制表-通过id删除")
	@ApiOperation(value="信息时段控制表-通过id删除", notes="信息时段控制表-通过id删除")
	@RequiresPermissions("edu.foudation:info_phase_control:delete")
	@DeleteMapping(value = "/delete")
	public Result<String> delete(@RequestParam(name="id",required=true) String id) {
		infoPhaseControlService.removeById(id);
		return Result.OK("删除成功!");
	}
	
	/**
	 *  批量删除
	 *
	 * @param ids
	 * @return
	 */
	@AutoLog(value = "信息时段控制表-批量删除")
	@ApiOperation(value="信息时段控制表-批量删除", notes="信息时段控制表-批量删除")
	@RequiresPermissions("edu.foudation:info_phase_control:deleteBatch")
	@DeleteMapping(value = "/deleteBatch")
	public Result<String> deleteBatch(@RequestParam(name="ids",required=true) String ids) {
		this.infoPhaseControlService.removeByIds(Arrays.asList(ids.split(",")));
		return Result.OK("批量删除成功!");
	}
	
	/**
	 * 通过id查询
	 *
	 * @param id
	 * @return
	 */
	//@AutoLog(value = "信息时段控制表-通过id查询")
	@ApiOperation(value="信息时段控制表-通过id查询", notes="信息时段控制表-通过id查询")
	@GetMapping(value = "/queryById")
	public Result<InfoPhaseControl> queryById(@RequestParam(name="id",required=true) String id) {
		InfoPhaseControl infoPhaseControl = infoPhaseControlService.getById(id);
		if(infoPhaseControl==null) {
			return Result.error("未找到对应数据");
		}
		return Result.OK(infoPhaseControl);
	}

    /**
    * 导出excel
    *
    * @param request
    * @param infoPhaseControl
    */
    @RequiresPermissions("edu.foudation:info_phase_control:exportXls")
    @RequestMapping(value = "/exportXls")
    public ModelAndView exportXls(HttpServletRequest request, InfoPhaseControl infoPhaseControl) {
        return super.exportXls(request, infoPhaseControl, InfoPhaseControl.class, "信息时段控制表");
    }

    /**
      * 通过excel导入数据
    *
    * @param request
    * @param response
    * @return
    */
    @RequiresPermissions("edu.foudation:info_phase_control:importExcel")
    @RequestMapping(value = "/importExcel", method = RequestMethod.POST)
    public Result<?> importExcel(HttpServletRequest request, HttpServletResponse response) {
        return super.importExcel(request, response, InfoPhaseControl.class);
    }

}
