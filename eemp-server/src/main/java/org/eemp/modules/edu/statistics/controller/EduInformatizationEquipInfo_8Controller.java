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
import org.eemp.modules.edu.statistics.entity.EduInformatizationEquipInfo_8;
import org.eemp.modules.edu.statistics.service.IEduInformatizationEquipInfo_8Service;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

 /**
 * @Description: 教育信息化配备情况统计表（八）
 * @Date:   2023-07-15
 * @Version: V1.0
 */
@Api(tags="教育信息化配备情况统计表（八）")
@RestController
@RequestMapping("/org.eemp.modules.edu.statistics/eduInformatizationEquipInfo_8")
@Slf4j
@RequiredArgsConstructor
public class EduInformatizationEquipInfo_8Controller extends BaseController<EduInformatizationEquipInfo_8, IEduInformatizationEquipInfo_8Service> {
	private final IEduInformatizationEquipInfo_8Service eduInformatizationEquipInfo_8Service;
	
	/**
	 * 分页列表查询
	 *
	 * @param eduInformatizationEquipInfo_8
	 * @param pageNo
	 * @param pageSize
	 * @param req
	 * @return
	 */
	//@AutoLog(value = "教育信息化配备情况统计表（八）-分页列表查询")
	@ApiOperation(value="教育信息化配备情况统计表（八）-分页列表查询", notes="教育信息化配备情况统计表（八）-分页列表查询")
	@GetMapping(value = "/list")
	@PermissionData(pageComponent = "edu/statistics/EduInformatizationEquipInfo_8List")
	public Result<IPage<EduInformatizationEquipInfo_8>> queryPageList(EduInformatizationEquipInfo_8 eduInformatizationEquipInfo_8,
								   @RequestParam(name="pageNo", defaultValue="1") Integer pageNo,
								   @RequestParam(name="pageSize", defaultValue="10") Integer pageSize,
								   HttpServletRequest req) {
		QueryWrapper<EduInformatizationEquipInfo_8> queryWrapper = QueryGenerator.initQueryWrapper(eduInformatizationEquipInfo_8, req.getParameterMap());
		Page<EduInformatizationEquipInfo_8> page = new Page<EduInformatizationEquipInfo_8>(pageNo, pageSize);
		IPage<EduInformatizationEquipInfo_8> pageList = eduInformatizationEquipInfo_8Service.page(page, queryWrapper);
		return Result.OK(pageList);
	}
	
	/**
	 *   添加
	 *
	 * @param eduInformatizationEquipInfo_8
	 * @return
	 */
	@AutoLog(value = "教育信息化配备情况统计表（八）-添加")
	@ApiOperation(value="教育信息化配备情况统计表（八）-添加", notes="教育信息化配备情况统计表（八）-添加")
	@RequiresPermissions("edu.statistics:edu_informatization_equip_info_8:add")
	@PostMapping(value = "/add")
	public Result<String> add(@RequestBody EduInformatizationEquipInfo_8 eduInformatizationEquipInfo_8) {
		eduInformatizationEquipInfo_8Service.save(eduInformatizationEquipInfo_8);
		return Result.OK("添加成功！");
	}
	
	/**
	 *  编辑
	 *
	 * @param eduInformatizationEquipInfo_8
	 * @return
	 */
	@AutoLog(value = "教育信息化配备情况统计表（八）-编辑")
	@ApiOperation(value="教育信息化配备情况统计表（八）-编辑", notes="教育信息化配备情况统计表（八）-编辑")
	@RequiresPermissions("edu.statistics:edu_informatization_equip_info_8:edit")
	@RequestMapping(value = "/edit", method = {RequestMethod.PUT,RequestMethod.POST})
	public Result<String> edit(@RequestBody EduInformatizationEquipInfo_8 eduInformatizationEquipInfo_8) {
		eduInformatizationEquipInfo_8Service.updateById(eduInformatizationEquipInfo_8);
		return Result.OK("编辑成功!");
	}
	
	/**
	 *   通过id删除
	 *
	 * @param id
	 * @return
	 */
	@AutoLog(value = "教育信息化配备情况统计表（八）-通过id删除")
	@ApiOperation(value="教育信息化配备情况统计表（八）-通过id删除", notes="教育信息化配备情况统计表（八）-通过id删除")
	@RequiresPermissions("edu.statistics:edu_informatization_equip_info_8:delete")
	@DeleteMapping(value = "/delete")
	public Result<String> delete(@RequestParam(name="id",required=true) String id) {
		eduInformatizationEquipInfo_8Service.removeById(id);
		return Result.OK("删除成功!");
	}
	
	/**
	 *  批量删除
	 *
	 * @param ids
	 * @return
	 */
	@AutoLog(value = "教育信息化配备情况统计表（八）-批量删除")
	@ApiOperation(value="教育信息化配备情况统计表（八）-批量删除", notes="教育信息化配备情况统计表（八）-批量删除")
	@RequiresPermissions("edu.statistics:edu_informatization_equip_info_8:deleteBatch")
	@DeleteMapping(value = "/deleteBatch")
	public Result<String> deleteBatch(@RequestParam(name="ids",required=true) String ids) {
		this.eduInformatizationEquipInfo_8Service.removeByIds(Arrays.asList(ids.split(",")));
		return Result.OK("批量删除成功!");
	}
	
	/**
	 * 通过id查询
	 *
	 * @param id
	 * @return
	 */
	//@AutoLog(value = "教育信息化配备情况统计表（八）-通过id查询")
	@ApiOperation(value="教育信息化配备情况统计表（八）-通过id查询", notes="教育信息化配备情况统计表（八）-通过id查询")
	@GetMapping(value = "/queryById")
	public Result<EduInformatizationEquipInfo_8> queryById(@RequestParam(name="id",required=true) String id) {
		EduInformatizationEquipInfo_8 eduInformatizationEquipInfo_8 = eduInformatizationEquipInfo_8Service.getById(id);
		if(eduInformatizationEquipInfo_8==null) {
			return Result.error("未找到对应数据");
		}
		return Result.OK(eduInformatizationEquipInfo_8);
	}

    /**
    * 导出excel
    *
    * @param request
    * @param eduInformatizationEquipInfo_8
    */
    @RequiresPermissions("edu.statistics:edu_informatization_equip_info_8:exportXls")
    @RequestMapping(value = "/exportXls")
    public ModelAndView exportXls(HttpServletRequest request, EduInformatizationEquipInfo_8 eduInformatizationEquipInfo_8) {
        return super.exportXls(request, eduInformatizationEquipInfo_8, EduInformatizationEquipInfo_8.class, "教育信息化配备情况统计表（八）");
    }

    /**
      * 通过excel导入数据
    *
    * @param request
    * @param response
    * @return
    */
    @RequiresPermissions("edu.statistics:edu_informatization_equip_info_8:importExcel")
    @RequestMapping(value = "/importExcel", method = RequestMethod.POST)
    public Result<?> importExcel(HttpServletRequest request, HttpServletResponse response) {
        return super.importExcel(request, response, EduInformatizationEquipInfo_8.class);
    }

	 @GetMapping("classInfo")
	 public Result<List<Map<String,Object>>> classInfo() {
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
		 List<Map<String,Object>> list = eduInformatizationEquipInfo_8Service.getClassNumberInfo(dayStart, dayEnd);
		 result.setResult(oConvertUtils.toLowerCasePageList(list));
		 return result;
	 }

	 @GetMapping("teacherComputerInfo")
	 public Result<List<Map<String,Object>>> teacherComputerInfo() {
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
		 List<Map<String,Object>> list = eduInformatizationEquipInfo_8Service.getTeacherComputerNumberInfo(dayStart, dayEnd);
		 result.setResult(oConvertUtils.toLowerCasePageList(list));
		 return result;
	 }

	 @GetMapping("studentComputerInfo")
	 public Result<List<Map<String,Object>>> studentComputerInfo() {
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
		 List<Map<String,Object>> list = eduInformatizationEquipInfo_8Service.getStudentComputerNumberInfo(dayStart, dayEnd);
		 result.setResult(oConvertUtils.toLowerCasePageList(list));
		 return result;
	 }

	 @GetMapping("classCommunicationInfo")
	 public Result<List<Map<String,Object>>> classCommunicationInfo() {
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
		 List<Map<String,Object>> list = eduInformatizationEquipInfo_8Service.getClassCommunicationNumberInfo(dayStart, dayEnd);
		 result.setResult(oConvertUtils.toLowerCasePageList(list));
		 return result;
	 }

 }
