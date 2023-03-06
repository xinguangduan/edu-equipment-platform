package org.eemp.modules.school.controller;

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
import org.eemp.modules.school.entity.SchoolBasicInfo;
import org.eemp.modules.school.service.ISchoolBasicInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

 /**
 * @Description: 学校基本信息
 * @Author: jeecg-boot
 * @Date:   2023-02-24
 * @Version: V1.0
 */
@Api(tags="学校基本信息")
@RestController
@RequestMapping("/school/schoolBasicInfo")
@Slf4j
public class SchoolBasicInfoController extends JeecgController<SchoolBasicInfo, ISchoolBasicInfoService> {
	@Autowired
	private ISchoolBasicInfoService schoolBasicInfoService;
	
	/**
	 * 分页列表查询
	 *
	 * @param schoolBasicInfo
	 * @param pageNo
	 * @param pageSize
	 * @param req
	 * @return
	 */
	//@AutoLog(value = "学校基本信息-分页列表查询")
	@ApiOperation(value="学校基本信息-分页列表查询", notes="学校基本信息-分页列表查询")
	@GetMapping(value = "/list")
	public Result<IPage<SchoolBasicInfo>> queryPageList(SchoolBasicInfo schoolBasicInfo,
								   @RequestParam(name="pageNo", defaultValue="1") Integer pageNo,
								   @RequestParam(name="pageSize", defaultValue="10") Integer pageSize,
								   HttpServletRequest req) {
		QueryWrapper<SchoolBasicInfo> queryWrapper = QueryGenerator.initQueryWrapper(schoolBasicInfo, req.getParameterMap());
		Page<SchoolBasicInfo> page = new Page<SchoolBasicInfo>(pageNo, pageSize);
		IPage<SchoolBasicInfo> pageList = schoolBasicInfoService.page(page, queryWrapper);
		return Result.OK(pageList);
	}
	
	/**
	 *   添加
	 *
	 * @param schoolBasicInfo
	 * @return
	 */
	@AutoLog(value = "学校基本信息-添加")
	@ApiOperation(value="学校基本信息-添加", notes="学校基本信息-添加")
	//@RequiresPermissions("org.jeecg.modules.demo:school_basic_info:add")
	@PostMapping(value = "/add")
	public Result<String> add(@RequestBody SchoolBasicInfo schoolBasicInfo) {
		schoolBasicInfoService.save(schoolBasicInfo);
		return Result.OK("添加成功！");
	}
	
	/**
	 *  编辑
	 *
	 * @param schoolBasicInfo
	 * @return
	 */
	@AutoLog(value = "学校基本信息-编辑")
	@ApiOperation(value="学校基本信息-编辑", notes="学校基本信息-编辑")
	//@RequiresPermissions("org.jeecg.modules.demo:school_basic_info:edit")
	@RequestMapping(value = "/edit", method = {RequestMethod.PUT,RequestMethod.POST})
	public Result<String> edit(@RequestBody SchoolBasicInfo schoolBasicInfo) {
		schoolBasicInfoService.updateById(schoolBasicInfo);
		return Result.OK("编辑成功!");
	}
	
	/**
	 *   通过id删除
	 *
	 * @param id
	 * @return
	 */
	@AutoLog(value = "学校基本信息-通过id删除")
	@ApiOperation(value="学校基本信息-通过id删除", notes="学校基本信息-通过id删除")
	//@RequiresPermissions("org.jeecg.modules.demo:school_basic_info:delete")
	@DeleteMapping(value = "/delete")
	public Result<String> delete(@RequestParam(name="id",required=true) String id) {
		schoolBasicInfoService.removeById(id);
		return Result.OK("删除成功!");
	}
	
	/**
	 *  批量删除
	 *
	 * @param ids
	 * @return
	 */
	@AutoLog(value = "学校基本信息-批量删除")
	@ApiOperation(value="学校基本信息-批量删除", notes="学校基本信息-批量删除")
	//@RequiresPermissions("org.jeecg.modules.demo:school_basic_info:deleteBatch")
	@DeleteMapping(value = "/deleteBatch")
	public Result<String> deleteBatch(@RequestParam(name="ids",required=true) String ids) {
		this.schoolBasicInfoService.removeByIds(Arrays.asList(ids.split(",")));
		return Result.OK("批量删除成功!");
	}
	
	/**
	 * 通过id查询
	 *
	 * @param id
	 * @return
	 */
	//@AutoLog(value = "学校基本信息-通过id查询")
	@ApiOperation(value="学校基本信息-通过id查询", notes="学校基本信息-通过id查询")
	@GetMapping(value = "/queryById")
	public Result<SchoolBasicInfo> queryById(@RequestParam(name="id",required=true) String id) {
		SchoolBasicInfo schoolBasicInfo = schoolBasicInfoService.getById(id);
		if(schoolBasicInfo==null) {
			return Result.error("未找到对应数据");
		}
		return Result.OK(schoolBasicInfo);
	}

    /**
    * 导出excel
    *
    * @param request
    * @param schoolBasicInfo
    */
    //@RequiresPermissions("org.jeecg.modules.demo:school_basic_info:exportXls")
    @RequestMapping(value = "/exportXls")
    public ModelAndView exportXls(HttpServletRequest request, SchoolBasicInfo schoolBasicInfo) {
        return super.exportXls(request, schoolBasicInfo, SchoolBasicInfo.class, "学校基本信息");
    }

    /**
      * 通过excel导入数据
    *
    * @param request
    * @param response
    * @return
    */
    //@RequiresPermissions("school_basic_info:importExcel")
    @RequestMapping(value = "/importExcel", method = RequestMethod.POST)
    public Result<?> importExcel(HttpServletRequest request, HttpServletResponse response) {
        return super.importExcel(request, response, SchoolBasicInfo.class);
    }

}
