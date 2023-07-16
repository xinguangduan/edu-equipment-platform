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
import org.eemp.modules.edu.statistics.entity.EduInformatizationBasicInfo_1;
import org.eemp.modules.edu.statistics.service.IEduInformatizationBasicInfo_1Service;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

 /**
 * @Description: 教育信息化基本情况统计表（一）
 * @Date:   2023-06-04
 * @Version: V1.0
 */
@Api(tags="教育信息化基本情况统计表（一）")
@RestController
@RequestMapping("/org.eemp.modules.edu.statistics/eduInformatizationBasicInfo_1")
@Slf4j
@RequiredArgsConstructor
public class EduInformatizationBasicInfo_1Controller extends BaseController<EduInformatizationBasicInfo_1, IEduInformatizationBasicInfo_1Service> {
	private final IEduInformatizationBasicInfo_1Service eduInformatizationBasicInfo_1Service;
	
	/**
	 * 分页列表查询
	 *
	 * @param eduInformatizationBasicInfo_1
	 * @param pageNo
	 * @param pageSize
	 * @param req
	 * @return
	 */
	//@AutoLog(value = "教育信息化基本情况统计表（一）-分页列表查询")
	@ApiOperation(value="教育信息化基本情况统计表（一）-分页列表查询", notes="教育信息化基本情况统计表（一）-分页列表查询")
	@GetMapping(value = "/list")
	@PermissionData(pageComponent = "edu/statistics/EduInformatizationBasicInfo_1List")
	public Result<IPage<EduInformatizationBasicInfo_1>> queryPageList(EduInformatizationBasicInfo_1 eduInformatizationBasicInfo_1,
								   @RequestParam(name="pageNo", defaultValue="1") Integer pageNo,
								   @RequestParam(name="pageSize", defaultValue="10") Integer pageSize,
								   HttpServletRequest req) {
		QueryWrapper<EduInformatizationBasicInfo_1> queryWrapper = QueryGenerator.initQueryWrapper(eduInformatizationBasicInfo_1, req.getParameterMap());
		Page<EduInformatizationBasicInfo_1> page = new Page<EduInformatizationBasicInfo_1>(pageNo, pageSize);
		IPage<EduInformatizationBasicInfo_1> pageList = eduInformatizationBasicInfo_1Service.page(page, queryWrapper);
		return Result.OK(pageList);
	}
	
	/**
	 *   添加
	 *
	 * @param eduInformatizationBasicInfo_1
	 * @return
	 */
	@AutoLog(value = "教育信息化基本情况统计表（一）-添加")
	@ApiOperation(value="教育信息化基本情况统计表（一）-添加", notes="教育信息化基本情况统计表（一）-添加")
	@RequiresPermissions("edu.statistics:edu_informatization_basic_info_1:add")
	@PostMapping(value = "/add")
	public Result<String> add(@RequestBody EduInformatizationBasicInfo_1 eduInformatizationBasicInfo_1) {
		eduInformatizationBasicInfo_1Service.save(eduInformatizationBasicInfo_1);
		return Result.OK("添加成功！");
	}
	
	/**
	 *  编辑
	 *
	 * @param eduInformatizationBasicInfo_1
	 * @return
	 */
	@AutoLog(value = "教育信息化基本情况统计表（一）-编辑")
	@ApiOperation(value="教育信息化基本情况统计表（一）-编辑", notes="教育信息化基本情况统计表（一）-编辑")
	@RequiresPermissions("edu.statistics:edu_informatization_basic_info_1:edit")
	@RequestMapping(value = "/edit", method = {RequestMethod.PUT,RequestMethod.POST})
	public Result<String> edit(@RequestBody EduInformatizationBasicInfo_1 eduInformatizationBasicInfo_1) {
		eduInformatizationBasicInfo_1Service.updateById(eduInformatizationBasicInfo_1);
		return Result.OK("编辑成功!");
	}
	
	/**
	 *   通过id删除
	 *
	 * @param id
	 * @return
	 */
	@AutoLog(value = "教育信息化基本情况统计表（一）-通过id删除")
	@ApiOperation(value="教育信息化基本情况统计表（一）-通过id删除", notes="教育信息化基本情况统计表（一）-通过id删除")
	@RequiresPermissions("edu.statistics:edu_informatization_basic_info_1:delete")
	@DeleteMapping(value = "/delete")
	public Result<String> delete(@RequestParam(name="id",required=true) String id) {
		eduInformatizationBasicInfo_1Service.removeById(id);
		return Result.OK("删除成功!");
	}
	
	/**
	 *  批量删除
	 *
	 * @param ids
	 * @return
	 */
	@AutoLog(value = "教育信息化基本情况统计表（一）-批量删除")
	@ApiOperation(value="教育信息化基本情况统计表（一）-批量删除", notes="教育信息化基本情况统计表（一）-批量删除")
	@RequiresPermissions("edu.statistics:edu_informatization_basic_info_1:deleteBatch")
	@DeleteMapping(value = "/deleteBatch")
	public Result<String> deleteBatch(@RequestParam(name="ids",required=true) String ids) {
		this.eduInformatizationBasicInfo_1Service.removeByIds(Arrays.asList(ids.split(",")));
		return Result.OK("批量删除成功!");
	}
	
	/**
	 * 通过id查询
	 *
	 * @param id
	 * @return
	 */
	//@AutoLog(value = "教育信息化基本情况统计表（一）-通过id查询")
	@ApiOperation(value="教育信息化基本情况统计表（一）-通过id查询", notes="教育信息化基本情况统计表（一）-通过id查询")
	@GetMapping(value = "/queryById")
	public Result<EduInformatizationBasicInfo_1> queryById(@RequestParam(name="id",required=true) String id) {
		EduInformatizationBasicInfo_1 eduInformatizationBasicInfo_1 = eduInformatizationBasicInfo_1Service.getById(id);
		if(eduInformatizationBasicInfo_1==null) {
			return Result.error("未找到对应数据");
		}
		return Result.OK(eduInformatizationBasicInfo_1);
	}

    /**
    * 导出excel
    *
    * @param request
    * @param eduInformatizationBasicInfo_1
    */
    @RequiresPermissions("edu.statistics:edu_informatization_basic_info_1:exportXls")
    @RequestMapping(value = "/exportXls")
    public ModelAndView exportXls(HttpServletRequest request, EduInformatizationBasicInfo_1 eduInformatizationBasicInfo_1) {
        return super.exportXls(request, eduInformatizationBasicInfo_1, EduInformatizationBasicInfo_1.class, "教育信息化基本情况统计表（一）");
    }

    /**
      * 通过excel导入数据
    *
    * @param request
    * @param response
    * @return
    */
    @RequiresPermissions("edu.statistics:edu_informatization_basic_info_1:importExcel")
    @RequestMapping(value = "/importExcel", method = RequestMethod.POST)
    public Result<?> importExcel(HttpServletRequest request, HttpServletResponse response) {
        return super.importExcel(request, response, EduInformatizationBasicInfo_1.class);
    }

	 @GetMapping("teacherInfo")
	 public Result<List<Map<String,Object>>> teacherInfo() {
		 Result<List<Map<String,Object>>> result = new Result<List<Map<String,Object>>>();
		 Calendar calendar = new GregorianCalendar();
		 calendar.set(Calendar.HOUR_OF_DAY,0);
		 calendar.set(Calendar.MINUTE,0);
		 calendar.set(Calendar.SECOND,0);
		 calendar.set(Calendar.MILLISECOND,0);
		 calendar.add(Calendar.DAY_OF_MONTH, 1);
		 Date dayEnd = calendar.getTime();
		 calendar.add(Calendar.YEAR, -3);
		 Date dayStart = calendar.getTime();
		 List<Map<String,Object>> list = eduInformatizationBasicInfo_1Service.getTeacherNumberInfo(dayStart, dayEnd);
		 result.setResult(oConvertUtils.toLowerCasePageList(list));
		 return result;
	 }

	 @GetMapping("studentInfo")
	 public Result<List<Map<String,Object>>> studentInfo() {
		 Result<List<Map<String,Object>>> result = new Result<List<Map<String,Object>>>();
		 Calendar calendar = new GregorianCalendar();
		 calendar.set(Calendar.HOUR_OF_DAY,0);
		 calendar.set(Calendar.MINUTE,0);
		 calendar.set(Calendar.SECOND,0);
		 calendar.set(Calendar.MILLISECOND,0);
		 calendar.add(Calendar.DAY_OF_MONTH, 1);
		 Date dayEnd = calendar.getTime();
		 calendar.add(Calendar.YEAR, -3);
		 Date dayStart = calendar.getTime();
		 List<Map<String,Object>> list = eduInformatizationBasicInfo_1Service.getStudentNumberInfo(dayStart, dayEnd);
		 result.setResult(oConvertUtils.toLowerCasePageList(list));
		 return result;
	 }

}
