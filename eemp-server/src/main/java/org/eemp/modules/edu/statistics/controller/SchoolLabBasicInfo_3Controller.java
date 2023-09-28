package org.eemp.modules.edu.statistics.controller;

import java.util.Arrays;
import java.util.List;
import java.util.Map;
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
import org.eemp.modules.edu.statistics.entity.SchoolLabBasicInfo_3;
import org.eemp.modules.edu.statistics.service.ISchoolLabBasicInfo_3Service;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

 /**
 * @Description: 中小学实验室基本情况统计表（三）
 * @Date:   2023-07-07
 * @Version: V1.0
 */
@Api(tags="中小学实验室基本情况统计表（三）")
@RestController
@RequestMapping("/org.eemp.modules.edu.statistics/schoolLabBasicInfo_3")
@Slf4j
@RequiredArgsConstructor
public class SchoolLabBasicInfo_3Controller extends BaseController<SchoolLabBasicInfo_3, ISchoolLabBasicInfo_3Service> {
	private final ISchoolLabBasicInfo_3Service schoolLabBasicInfo_3Service;
	private final IFillingControlService fillingControlService;
	
	/**
	 * 分页列表查询
	 *
	 * @param schoolLabBasicInfo_3
	 * @param pageNo
	 * @param pageSize
	 * @param req
	 * @return
	 */
	//@AutoLog(value = "中小学实验室基本情况统计表（三）-分页列表查询")
	@ApiOperation(value="中小学实验室基本情况统计表（三）-分页列表查询", notes="中小学实验室基本情况统计表（三）-分页列表查询")
	@GetMapping(value = "/list")
	@PermissionData(pageComponent = "edu/statistics/SchoolLabBasicInfo_3List")
	public Result<IPage<SchoolLabBasicInfo_3>> queryPageList(SchoolLabBasicInfo_3 schoolLabBasicInfo_3,
								   @RequestParam(name="pageNo", defaultValue="1") Integer pageNo,
								   @RequestParam(name="pageSize", defaultValue="10") Integer pageSize,
								   HttpServletRequest req) {
		QueryWrapper<SchoolLabBasicInfo_3> queryWrapper = QueryGenerator.initQueryWrapper(schoolLabBasicInfo_3, req.getParameterMap());
		Page<SchoolLabBasicInfo_3> page = new Page<SchoolLabBasicInfo_3>(pageNo, pageSize);
		IPage<SchoolLabBasicInfo_3> pageList = schoolLabBasicInfo_3Service.page(page, queryWrapper);
		return Result.OK(pageList);
	}
	
	/**
	 *   添加
	 *
	 * @param schoolLabBasicInfo_3
	 * @return
	 */
	@AutoLog(value = "中小学实验室基本情况统计表（三）-添加")
	@ApiOperation(value="中小学实验室基本情况统计表（三）-添加", notes="中小学实验室基本情况统计表（三）-添加")
	@RequiresPermissions("edu.statistics:school_lab_basic_info_3:add")
	@PostMapping(value = "/add")
	public Result<String> add(@RequestBody SchoolLabBasicInfo_3 schoolLabBasicInfo_3) {
		schoolLabBasicInfo_3Service.save(schoolLabBasicInfo_3);
		boolean rst = fillingControlService.updateFillingControlAfterNewData(
				schoolLabBasicInfo_3.getIdentificationCode(),
				"school_lab_basic_info_3",
				schoolLabBasicInfo_3.getId()
		);
		return Result.OK("添加成功！");
	}
	
	/**
	 *  编辑
	 *
	 * @param schoolLabBasicInfo_3
	 * @return
	 */
	@AutoLog(value = "中小学实验室基本情况统计表（三）-编辑")
	@ApiOperation(value="中小学实验室基本情况统计表（三）-编辑", notes="中小学实验室基本情况统计表（三）-编辑")
	@RequiresPermissions("edu.statistics:school_lab_basic_info_3:edit")
	@RequestMapping(value = "/edit", method = {RequestMethod.PUT,RequestMethod.POST})
	public Result<String> edit(@RequestBody SchoolLabBasicInfo_3 schoolLabBasicInfo_3) {
		schoolLabBasicInfo_3Service.updateById(schoolLabBasicInfo_3);
		return Result.OK("编辑成功!");
	}
	
	/**
	 *   通过id删除
	 *
	 * @param id
	 * @return
	 */
	@AutoLog(value = "中小学实验室基本情况统计表（三）-通过id删除")
	@ApiOperation(value="中小学实验室基本情况统计表（三）-通过id删除", notes="中小学实验室基本情况统计表（三）-通过id删除")
	@RequiresPermissions("edu.statistics:school_lab_basic_info_3:delete")
	@DeleteMapping(value = "/delete")
	public Result<String> delete(@RequestParam(name="id",required=true) String id) {
		SchoolLabBasicInfo_3 rec = schoolLabBasicInfo_3Service.getById(id);
		schoolLabBasicInfo_3Service.removeById(id);
		boolean rst = fillingControlService.updateFillingControlAfterDeleteData(
				rec.getIdentificationCode(),
				"school_lab_basic_info_3",
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
	@AutoLog(value = "中小学实验室基本情况统计表（三）-批量删除")
	@ApiOperation(value="中小学实验室基本情况统计表（三）-批量删除", notes="中小学实验室基本情况统计表（三）-批量删除")
	@RequiresPermissions("edu.statistics:school_lab_basic_info_3:deleteBatch")
	@DeleteMapping(value = "/deleteBatch")
	public Result<String> deleteBatch(@RequestParam(name="ids",required=true) String ids) {
		this.schoolLabBasicInfo_3Service.removeByIds(Arrays.asList(ids.split(",")));
		return Result.OK("批量删除成功!");
	}
	
	/**
	 * 通过id查询
	 *
	 * @param id
	 * @return
	 */
	//@AutoLog(value = "中小学实验室基本情况统计表（三）-通过id查询")
	@ApiOperation(value="中小学实验室基本情况统计表（三）-通过id查询", notes="中小学实验室基本情况统计表（三）-通过id查询")
	@GetMapping(value = "/queryById")
	public Result<SchoolLabBasicInfo_3> queryById(@RequestParam(name="id",required=true) String id) {
		SchoolLabBasicInfo_3 schoolLabBasicInfo_3 = schoolLabBasicInfo_3Service.getById(id);
		if(schoolLabBasicInfo_3==null) {
			return Result.error("未找到对应数据");
		}
		return Result.OK(schoolLabBasicInfo_3);
	}

    /**
    * 导出excel
    *
    * @param request
    * @param schoolLabBasicInfo_3
    */
    @RequiresPermissions("edu.statistics:school_lab_basic_info_3:exportXls")
    @RequestMapping(value = "/exportXls")
    public ModelAndView exportXls(HttpServletRequest request, SchoolLabBasicInfo_3 schoolLabBasicInfo_3) {
        return super.exportXls(request, schoolLabBasicInfo_3, SchoolLabBasicInfo_3.class, "中小学实验室基本情况统计表（三）");
    }

    /**
      * 通过excel导入数据
    *
    * @param request
    * @param response
    * @return
    */
    @RequiresPermissions("edu.statistics:school_lab_basic_info_3:importExcel")
    @RequestMapping(value = "/importExcel", method = RequestMethod.POST)
    public Result<?> importExcel(HttpServletRequest request, HttpServletResponse response) {
        return super.importExcel(request, response, SchoolLabBasicInfo_3.class);
    }

	@GetMapping("scienceRoomInfo")
	public Result<List<Map<String,Object>>> scienceRoomInfo() {
		Result<List<Map<String,Object>>> result = new Result<List<Map<String,Object>>>();
		List<Map<String,Object>> list = schoolLabBasicInfo_3Service.getScienceRoomInfo();
		result.setResult(oConvertUtils.toLowerCasePageList(list));
		return result;
	}

	@GetMapping("laboratoryRoomInfo")
	public Result<List<Map<String,Object>>> laboratoryRoomInfo() {
		Result<List<Map<String,Object>>> result = new Result<List<Map<String,Object>>>();
		List<Map<String,Object>> list = schoolLabBasicInfo_3Service.getLaboratoryRoomInfo();
		result.setResult(oConvertUtils.toLowerCasePageList(list));
		return result;
	}

}
