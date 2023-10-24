package org.eemp.modules.edu.statistics.controller;

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
import org.eemp.common.aspect.annotation.PermissionData;
import org.eemp.common.system.base.controller.BaseController;
import org.eemp.common.system.query.QueryGenerator;
import org.eemp.modules.edu.foudation.service.IFillingControlService;
import org.eemp.modules.edu.statistics.entity.EduInformatizationBasicInfo_2;
import org.eemp.modules.edu.statistics.service.IEduInformatizationBasicInfo_2Service;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

 /**
 * @Description: 教育信息化基本情况统计表（二）
 * @Date:   2023-07-07
 * @Version: V1.0
 */
@Api(tags="教育信息化基本情况统计表（二）")
@RestController
@RequestMapping("/org.eemp.modules.edu.statistics/eduInformatizationBasicInfo_2")
@Slf4j
@RequiredArgsConstructor
public class EduInformatizationBasicInfo_2Controller extends BaseController<EduInformatizationBasicInfo_2, IEduInformatizationBasicInfo_2Service> {
	private final IEduInformatizationBasicInfo_2Service eduInformatizationBasicInfo_2Service;
	private final IFillingControlService fillingControlService;
	
	/**
	 * 分页列表查询
	 *
	 * @param eduInformatizationBasicInfo_2
	 * @param pageNo
	 * @param pageSize
	 * @param req
	 * @return
	 */
	//@AutoLog(value = "教育信息化基本情况统计表（二）-分页列表查询")
	@ApiOperation(value="教育信息化基本情况统计表（二）-分页列表查询", notes="教育信息化基本情况统计表（二）-分页列表查询")
	@GetMapping(value = "/list")
	@PermissionData(pageComponent = "edu/statistics/EduInformatizationBasicInfo_2List")
	public Result<IPage<EduInformatizationBasicInfo_2>> queryPageList(EduInformatizationBasicInfo_2 eduInformatizationBasicInfo_2,
								   @RequestParam(name="pageNo", defaultValue="1") Integer pageNo,
								   @RequestParam(name="pageSize", defaultValue="10") Integer pageSize,
								   HttpServletRequest req) {
		QueryWrapper<EduInformatizationBasicInfo_2> queryWrapper = QueryGenerator.initQueryWrapper(eduInformatizationBasicInfo_2, req.getParameterMap());
		Page<EduInformatizationBasicInfo_2> page = new Page<EduInformatizationBasicInfo_2>(pageNo, pageSize);
		IPage<EduInformatizationBasicInfo_2> pageList = eduInformatizationBasicInfo_2Service.page(page, queryWrapper);
		return Result.OK(pageList);
	}
	
	/**
	 *   添加
	 *
	 * @param eduInformatizationBasicInfo_2
	 * @return
	 */
	@AutoLog(value = "教育信息化基本情况统计表（二）-添加")
	@ApiOperation(value="教育信息化基本情况统计表（二）-添加", notes="教育信息化基本情况统计表（二）-添加")
	@RequiresPermissions("edu.statistics:edu_informatization_basic_info_2:add")
	@PostMapping(value = "/add")
	public Result<String> add(@RequestBody EduInformatizationBasicInfo_2 eduInformatizationBasicInfo_2) {
		eduInformatizationBasicInfo_2Service.save(eduInformatizationBasicInfo_2);
		boolean rst = fillingControlService.updateFillingControlAfterNewData(
				eduInformatizationBasicInfo_2.getIdentificationCode(),
				"edu_informatization_basic_info_2",
				eduInformatizationBasicInfo_2.getId()
		);
		return Result.OK("添加成功！");
	}
	
	/**
	 *  编辑
	 *
	 * @param eduInformatizationBasicInfo_2
	 * @return
	 */
	@AutoLog(value = "教育信息化基本情况统计表（二）-编辑")
	@ApiOperation(value="教育信息化基本情况统计表（二）-编辑", notes="教育信息化基本情况统计表（二）-编辑")
	@RequiresPermissions("edu.statistics:edu_informatization_basic_info_2:edit")
	@RequestMapping(value = "/edit", method = {RequestMethod.PUT,RequestMethod.POST})
	public Result<String> edit(@RequestBody EduInformatizationBasicInfo_2 eduInformatizationBasicInfo_2) {
		eduInformatizationBasicInfo_2Service.updateById(eduInformatizationBasicInfo_2);
		return Result.OK("编辑成功!");
	}
	
	/**
	 *   通过id删除
	 *
	 * @param id
	 * @return
	 */
	@AutoLog(value = "教育信息化基本情况统计表（二）-通过id删除")
	@ApiOperation(value="教育信息化基本情况统计表（二）-通过id删除", notes="教育信息化基本情况统计表（二）-通过id删除")
	@RequiresPermissions("edu.statistics:edu_informatization_basic_info_2:delete")
	@DeleteMapping(value = "/delete")
	public Result<String> delete(@RequestParam(name="id",required=true) String id) {
		EduInformatizationBasicInfo_2 rec = eduInformatizationBasicInfo_2Service.getById(id);
		eduInformatizationBasicInfo_2Service.removeById(id);
		boolean rst = fillingControlService.updateFillingControlAfterDeleteData(
				rec.getIdentificationCode(),
				"edu_informatization_basic_info_2",
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
	@AutoLog(value = "教育信息化基本情况统计表（二）-批量删除")
	@ApiOperation(value="教育信息化基本情况统计表（二）-批量删除", notes="教育信息化基本情况统计表（二）-批量删除")
	@RequiresPermissions("edu.statistics:edu_informatization_basic_info_2:deleteBatch")
	@DeleteMapping(value = "/deleteBatch")
	public Result<String> deleteBatch(@RequestParam(name="ids",required=true) String ids) {
		this.eduInformatizationBasicInfo_2Service.removeByIds(Arrays.asList(ids.split(",")));
		return Result.OK("批量删除成功!");
	}
	
	/**
	 * 通过id查询
	 *
	 * @param id
	 * @return
	 */
	//@AutoLog(value = "教育信息化基本情况统计表（二）-通过id查询")
	@ApiOperation(value="教育信息化基本情况统计表（二）-通过id查询", notes="教育信息化基本情况统计表（二）-通过id查询")
	@GetMapping(value = "/queryById")
	public Result<EduInformatizationBasicInfo_2> queryById(@RequestParam(name="id",required=true) String id) {
		EduInformatizationBasicInfo_2 eduInformatizationBasicInfo_2 = eduInformatizationBasicInfo_2Service.getById(id);
		if(eduInformatizationBasicInfo_2==null) {
			return Result.error("未找到对应数据");
		}
		return Result.OK(eduInformatizationBasicInfo_2);
	}

    /**
    * 导出excel
    *
    * @param request
    * @param eduInformatizationBasicInfo_2
    */
    @RequiresPermissions("edu.statistics:edu_informatization_basic_info_2:exportXls")
    @RequestMapping(value = "/exportXls")
	@PermissionData(pageComponent = "edu/statistics/EduInformatizationBasicInfo_2List")
    public ModelAndView exportXls(HttpServletRequest request, EduInformatizationBasicInfo_2 eduInformatizationBasicInfo_2) {
        return super.exportXls(request, eduInformatizationBasicInfo_2, EduInformatizationBasicInfo_2.class, "教育信息化基本情况统计表（二）");
    }

    /**
      * 通过excel导入数据
    *
    * @param request
    * @param response
    * @return
    */
    @RequiresPermissions("edu.statistics:edu_informatization_basic_info_2:importExcel")
    @RequestMapping(value = "/importExcel", method = RequestMethod.POST)
    public Result<?> importExcel(HttpServletRequest request, HttpServletResponse response) {
        return super.importExcel(request, response, EduInformatizationBasicInfo_2.class);
    }

	@RequiresPermissions("edu.statistics:edu_informatization_basic_info_2:report")
	@PostMapping(value = "/report")
	public Result<String> report(@RequestParam(name="identificationCode", required=true) String identificationCode, @RequestParam(name="id", required=true) String id) {
		eduInformatizationBasicInfo_2Service.changeReported(id, 1);
		boolean rst = fillingControlService.updateFillingControlAfterReported(
				identificationCode,
				"edu_informatization_basic_info_2"
		);
		return Result.OK("上报成功!");
	}

	@RequiresPermissions("edu.statistics:edu_informatization_basic_info_2:revoke")
	@PostMapping(value = "/revoke")
	public Result<String> revoke(@RequestParam(name="ids", required=true) String ids) {
		for (String id: ids.split(",")) {
			EduInformatizationBasicInfo_2 rec = eduInformatizationBasicInfo_2Service.getById(id);
			eduInformatizationBasicInfo_2Service.changeReported(id, 0);
			boolean rst = fillingControlService.updateFillingControlAfterRevoked(
					rec.getIdentificationCode(),
					"edu_informatization_basic_info_2"
			);
		}
		return Result.OK("退回成功!");
	}

}
