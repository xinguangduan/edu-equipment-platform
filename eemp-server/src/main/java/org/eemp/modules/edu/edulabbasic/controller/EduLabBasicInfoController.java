package org.eemp.modules.edu.edulabbasic.controller;

import java.util.Arrays;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.eemp.common.api.vo.Result;
import org.eemp.common.system.query.QueryGenerator;
import org.eemp.modules.edu.edulabbasic.entity.EduLabBasicInfo;
import org.eemp.modules.edu.edulabbasic.service.IEduLabBasicInfoService;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.extern.slf4j.Slf4j;

import org.eemp.common.system.base.controller.JeecgController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.eemp.common.aspect.annotation.AutoLog;
import org.apache.shiro.authz.annotation.RequiresPermissions;

 /**
 * @Description: 中小学实验室基本情况统计表
 * @Author: jeecg-boot
 * @Date:   2023-04-16
 * @Version: V1.0
 */
@Api(tags="中小学实验室基本情况统计表")
@RestController
@RequestMapping("/edu/edulabbasic/eduLabBasicInfo")
@Slf4j
public class EduLabBasicInfoController extends JeecgController<EduLabBasicInfo, IEduLabBasicInfoService> {
	@Autowired
	private IEduLabBasicInfoService eduLabBasicInfoService;
	
	/**
	 * 分页列表查询
	 *
	 * @param eduLabBasicInfo
	 * @param pageNo
	 * @param pageSize
	 * @param req
	 * @return
	 */
	//@AutoLog(value = "中小学实验室基本情况统计表-分页列表查询")
	@ApiOperation(value="中小学实验室基本情况统计表-分页列表查询", notes="中小学实验室基本情况统计表-分页列表查询")
	@GetMapping(value = "/list")
	public Result<IPage<EduLabBasicInfo>> queryPageList(EduLabBasicInfo eduLabBasicInfo,
								   @RequestParam(name="pageNo", defaultValue="1") Integer pageNo,
								   @RequestParam(name="pageSize", defaultValue="10") Integer pageSize,
								   HttpServletRequest req) {
		QueryWrapper<EduLabBasicInfo> queryWrapper = QueryGenerator.initQueryWrapper(eduLabBasicInfo, req.getParameterMap());
		Page<EduLabBasicInfo> page = new Page<EduLabBasicInfo>(pageNo, pageSize);
		IPage<EduLabBasicInfo> pageList = eduLabBasicInfoService.page(page, queryWrapper);
		return Result.OK(pageList);
	}
	
	/**
	 *   添加
	 *
	 * @param eduLabBasicInfo
	 * @return
	 */
	@AutoLog(value = "中小学实验室基本情况统计表-添加")
	@ApiOperation(value="中小学实验室基本情况统计表-添加", notes="中小学实验室基本情况统计表-添加")
	@RequiresPermissions("edu.edulabbasic:edu_lab_basic_info:add")
	@PostMapping(value = "/add")
	public Result<String> add(@RequestBody EduLabBasicInfo eduLabBasicInfo) {
		eduLabBasicInfoService.save(eduLabBasicInfo);
		return Result.OK("添加成功！");
	}
	
	/**
	 *  编辑
	 *
	 * @param eduLabBasicInfo
	 * @return
	 */
	@AutoLog(value = "中小学实验室基本情况统计表-编辑")
	@ApiOperation(value="中小学实验室基本情况统计表-编辑", notes="中小学实验室基本情况统计表-编辑")
	@RequiresPermissions("edu.edulabbasic:edu_lab_basic_info:edit")
	@RequestMapping(value = "/edit", method = {RequestMethod.PUT,RequestMethod.POST})
	public Result<String> edit(@RequestBody EduLabBasicInfo eduLabBasicInfo) {
		eduLabBasicInfoService.updateById(eduLabBasicInfo);
		return Result.OK("编辑成功!");
	}
	
	/**
	 *   通过id删除
	 *
	 * @param id
	 * @return
	 */
	@AutoLog(value = "中小学实验室基本情况统计表-通过id删除")
	@ApiOperation(value="中小学实验室基本情况统计表-通过id删除", notes="中小学实验室基本情况统计表-通过id删除")
	@RequiresPermissions("edu.edulabbasic:edu_lab_basic_info:delete")
	@DeleteMapping(value = "/delete")
	public Result<String> delete(@RequestParam(name="id",required=true) String id) {
		eduLabBasicInfoService.removeById(id);
		return Result.OK("删除成功!");
	}
	
	/**
	 *  批量删除
	 *
	 * @param ids
	 * @return
	 */
	@AutoLog(value = "中小学实验室基本情况统计表-批量删除")
	@ApiOperation(value="中小学实验室基本情况统计表-批量删除", notes="中小学实验室基本情况统计表-批量删除")
	@RequiresPermissions("edu.edulabbasic:edu_lab_basic_info:deleteBatch")
	@DeleteMapping(value = "/deleteBatch")
	public Result<String> deleteBatch(@RequestParam(name="ids",required=true) String ids) {
		this.eduLabBasicInfoService.removeByIds(Arrays.asList(ids.split(",")));
		return Result.OK("批量删除成功!");
	}
	
	/**
	 * 通过id查询
	 *
	 * @param id
	 * @return
	 */
	//@AutoLog(value = "中小学实验室基本情况统计表-通过id查询")
	@ApiOperation(value="中小学实验室基本情况统计表-通过id查询", notes="中小学实验室基本情况统计表-通过id查询")
	@GetMapping(value = "/queryById")
	public Result<EduLabBasicInfo> queryById(@RequestParam(name="id",required=true) String id) {
		EduLabBasicInfo eduLabBasicInfo = eduLabBasicInfoService.getById(id);
		if(eduLabBasicInfo==null) {
			return Result.error("未找到对应数据");
		}
		return Result.OK(eduLabBasicInfo);
	}

    /**
    * 导出excel
    *
    * @param request
    * @param eduLabBasicInfo
    */
    @RequiresPermissions("edu.edulabbasic:edu_lab_basic_info:exportXls")
    @RequestMapping(value = "/exportXls")
    public ModelAndView exportXls(HttpServletRequest request, EduLabBasicInfo eduLabBasicInfo) {
        return super.exportXls(request, eduLabBasicInfo, EduLabBasicInfo.class, "中小学实验室基本情况统计表");
    }

    /**
      * 通过excel导入数据
    *
    * @param request
    * @param response
    * @return
    */
    @RequiresPermissions("edu.edulabbasic:edu_lab_basic_info:importExcel")
    @RequestMapping(value = "/importExcel", method = RequestMethod.POST)
    public Result<?> importExcel(HttpServletRequest request, HttpServletResponse response) {
        return super.importExcel(request, response, EduLabBasicInfo.class);
    }

}
