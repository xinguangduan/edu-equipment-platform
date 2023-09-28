package org.eemp.modules.edu.statistics.controller;

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
import org.eemp.common.util.oConvertUtils;
import org.eemp.modules.edu.foudation.service.IFillingControlService;
import org.eemp.modules.edu.statistics.entity.SchoolLibraryBasicInfo_4;
import org.eemp.modules.edu.statistics.service.ISchoolLibraryBasicInfo_4Service;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

 /**
 * @Description: 中小学图书室（馆）基本情况统计表（四）
 * @Date:   2023-07-07
 * @Version: V1.0
 */
@Api(tags="中小学图书室（馆）基本情况统计表（四）")
@RestController
@RequestMapping("/org.eemp.modules.edu.statistics/schoolLibraryBasicInfo_4")
@Slf4j
@RequiredArgsConstructor
public class SchoolLibraryBasicInfo_4Controller extends BaseController<SchoolLibraryBasicInfo_4, ISchoolLibraryBasicInfo_4Service> {
	private final ISchoolLibraryBasicInfo_4Service schoolLibraryBasicInfo_4Service;
	private final IFillingControlService fillingControlService;
	
	/**
	 * 分页列表查询
	 *
	 * @param schoolLibraryBasicInfo_4
	 * @param pageNo
	 * @param pageSize
	 * @param req
	 * @return
	 */
	//@AutoLog(value = "中小学图书室（馆）基本情况统计表（四）-分页列表查询")
	@ApiOperation(value="中小学图书室（馆）基本情况统计表（四）-分页列表查询", notes="中小学图书室（馆）基本情况统计表（四）-分页列表查询")
	@GetMapping(value = "/list")
	@PermissionData(pageComponent = "edu/statistics/SchoolLibraryBasicInfo_4List")
	public Result<IPage<SchoolLibraryBasicInfo_4>> queryPageList(SchoolLibraryBasicInfo_4 schoolLibraryBasicInfo_4,
								   @RequestParam(name="pageNo", defaultValue="1") Integer pageNo,
								   @RequestParam(name="pageSize", defaultValue="10") Integer pageSize,
								   HttpServletRequest req) {
		QueryWrapper<SchoolLibraryBasicInfo_4> queryWrapper = QueryGenerator.initQueryWrapper(schoolLibraryBasicInfo_4, req.getParameterMap());
		Page<SchoolLibraryBasicInfo_4> page = new Page<SchoolLibraryBasicInfo_4>(pageNo, pageSize);
		IPage<SchoolLibraryBasicInfo_4> pageList = schoolLibraryBasicInfo_4Service.page(page, queryWrapper);
		return Result.OK(pageList);
	}
	
	/**
	 *   添加
	 *
	 * @param schoolLibraryBasicInfo_4
	 * @return
	 */
	@AutoLog(value = "中小学图书室（馆）基本情况统计表（四）-添加")
	@ApiOperation(value="中小学图书室（馆）基本情况统计表（四）-添加", notes="中小学图书室（馆）基本情况统计表（四）-添加")
	@RequiresPermissions("edu.statistics:school_library_basic_info_4:add")
	@PostMapping(value = "/add")
	public Result<String> add(@RequestBody SchoolLibraryBasicInfo_4 schoolLibraryBasicInfo_4) {
		schoolLibraryBasicInfo_4Service.save(schoolLibraryBasicInfo_4);
		boolean rst = fillingControlService.updateFillingControlAfterNewData(
				schoolLibraryBasicInfo_4.getIdentificationCode(),
				"school_library_basic_info_4",
				schoolLibraryBasicInfo_4.getId()
		);
		return Result.OK("添加成功！");
	}
	
	/**
	 *  编辑
	 *
	 * @param schoolLibraryBasicInfo_4
	 * @return
	 */
	@AutoLog(value = "中小学图书室（馆）基本情况统计表（四）-编辑")
	@ApiOperation(value="中小学图书室（馆）基本情况统计表（四）-编辑", notes="中小学图书室（馆）基本情况统计表（四）-编辑")
	@RequiresPermissions("edu.statistics:school_library_basic_info_4:edit")
	@RequestMapping(value = "/edit", method = {RequestMethod.PUT,RequestMethod.POST})
	public Result<String> edit(@RequestBody SchoolLibraryBasicInfo_4 schoolLibraryBasicInfo_4) {
		schoolLibraryBasicInfo_4Service.updateById(schoolLibraryBasicInfo_4);
		return Result.OK("编辑成功!");
	}
	
	/**
	 *   通过id删除
	 *
	 * @param id
	 * @return
	 */
	@AutoLog(value = "中小学图书室（馆）基本情况统计表（四）-通过id删除")
	@ApiOperation(value="中小学图书室（馆）基本情况统计表（四）-通过id删除", notes="中小学图书室（馆）基本情况统计表（四）-通过id删除")
	@RequiresPermissions("edu.statistics:school_library_basic_info_4:delete")
	@DeleteMapping(value = "/delete")
	public Result<String> delete(@RequestParam(name="id",required=true) String id) {
		SchoolLibraryBasicInfo_4 rec = schoolLibraryBasicInfo_4Service.getById(id);
		schoolLibraryBasicInfo_4Service.removeById(id);
		boolean rst = fillingControlService.updateFillingControlAfterDeleteData(
				rec.getIdentificationCode(),
				"school_library_basic_info_4",
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
	@AutoLog(value = "中小学图书室（馆）基本情况统计表（四）-批量删除")
	@ApiOperation(value="中小学图书室（馆）基本情况统计表（四）-批量删除", notes="中小学图书室（馆）基本情况统计表（四）-批量删除")
	@RequiresPermissions("edu.statistics:school_library_basic_info_4:deleteBatch")
	@DeleteMapping(value = "/deleteBatch")
	public Result<String> deleteBatch(@RequestParam(name="ids",required=true) String ids) {
		this.schoolLibraryBasicInfo_4Service.removeByIds(Arrays.asList(ids.split(",")));
		return Result.OK("批量删除成功!");
	}
	
	/**
	 * 通过id查询
	 *
	 * @param id
	 * @return
	 */
	//@AutoLog(value = "中小学图书室（馆）基本情况统计表（四）-通过id查询")
	@ApiOperation(value="中小学图书室（馆）基本情况统计表（四）-通过id查询", notes="中小学图书室（馆）基本情况统计表（四）-通过id查询")
	@GetMapping(value = "/queryById")
	public Result<SchoolLibraryBasicInfo_4> queryById(@RequestParam(name="id",required=true) String id) {
		SchoolLibraryBasicInfo_4 schoolLibraryBasicInfo_4 = schoolLibraryBasicInfo_4Service.getById(id);
		if(schoolLibraryBasicInfo_4==null) {
			return Result.error("未找到对应数据");
		}
		return Result.OK(schoolLibraryBasicInfo_4);
	}

    /**
    * 导出excel
    *
    * @param request
    * @param schoolLibraryBasicInfo_4
    */
    @RequiresPermissions("edu.statistics:school_library_basic_info_4:exportXls")
    @RequestMapping(value = "/exportXls")
    public ModelAndView exportXls(HttpServletRequest request, SchoolLibraryBasicInfo_4 schoolLibraryBasicInfo_4) {
        return super.exportXls(request, schoolLibraryBasicInfo_4, SchoolLibraryBasicInfo_4.class, "中小学图书室（馆）基本情况统计表（四）");
    }

    /**
      * 通过excel导入数据
    *
    * @param request
    * @param response
    * @return
    */
    @RequiresPermissions("edu.statistics:school_library_basic_info_4:importExcel")
    @RequestMapping(value = "/importExcel", method = RequestMethod.POST)
    public Result<?> importExcel(HttpServletRequest request, HttpServletResponse response) {
        return super.importExcel(request, response, SchoolLibraryBasicInfo_4.class);
    }

	@RequiresPermissions("edu.statistics:school_library_basic_info_4:report")
	@PostMapping(value = "/report")
	public Result<String> report(@RequestParam(name="identificationCode", required=true) String identificationCode, @RequestParam(name="id", required=true) String id) {
		schoolLibraryBasicInfo_4Service.changeReported(id, 1);
		boolean rst = fillingControlService.updateFillingControlAfterReported(
				identificationCode,
				"school_library_basic_info_4"
		);
		return Result.OK("上报成功!");
	}

	@RequiresPermissions("edu.statistics:school_library_basic_info_4:revoke")
	@PostMapping(value = "/revoke")
	public Result<String> revoke(@RequestParam(name="ids", required=true) String ids) {
		for (String id: ids.split(",")) {
			SchoolLibraryBasicInfo_4 rec = schoolLibraryBasicInfo_4Service.getById(id);
			schoolLibraryBasicInfo_4Service.changeReported(id, 0);
			boolean rst = fillingControlService.updateFillingControlAfterRevoked(
					rec.getIdentificationCode(),
					"school_library_basic_info_4"
			);
		}
		return Result.OK("退回成功!");
	}

	@GetMapping("libraryInfo")
	public Result<List<Map<String,Object>>> libraryInfo() {
		Result<List<Map<String,Object>>> result = new Result<List<Map<String,Object>>>();
		Calendar calendar = new GregorianCalendar();
		calendar.set(Calendar.HOUR_OF_DAY,0);
		calendar.set(Calendar.MINUTE,0);
		calendar.set(Calendar.SECOND,0);
		calendar.set(Calendar.MILLISECOND,0);
		calendar.add(Calendar.DAY_OF_MONTH, 1);
		Date dayEnd = calendar.getTime();
		calendar.add(Calendar.YEAR, -2);
		Date dayStart = calendar.getTime();
		List<Map<String,Object>> list = schoolLibraryBasicInfo_4Service.getLibraryInfo(dayStart, dayEnd);
		result.setResult(oConvertUtils.toLowerCasePageList(list));
		return result;
	}

}
