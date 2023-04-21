package org.eemp.modules.edu.eduinformatizationbasic.controller;

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
import org.eemp.modules.edu.eduinformatizationbasic.entity.EduInformatizationBasicInfo;
import org.eemp.modules.edu.eduinformatizationbasic.service.IEduInformatizationBasicInfoService;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

 /**
 * @Description: 教育信息化基本情况统计表
 * @Author: jeecg-boot
 * @Date:   2023-04-16
 * @Version: V1.0
 */
@Api(tags="教育信息化基本情况统计表")
@RestController
@RequestMapping("/edu/eduinformatizationbasic/eduInformatizationBasicInfo")
@Slf4j
@RequiredArgsConstructor
public class EduInformatizationBasicInfoController extends BaseController<EduInformatizationBasicInfo, IEduInformatizationBasicInfoService> {

	private final IEduInformatizationBasicInfoService eduInformatizationBasicInfoService;
	
	/**
	 * 分页列表查询
	 *
	 * @param eduInformatizationBasicInfo
	 * @param pageNo
	 * @param pageSize
	 * @param req
	 * @return
	 */
	//@AutoLog(value = "教育信息化基本情况统计表-分页列表查询")
	@ApiOperation(value="教育信息化基本情况统计表-分页列表查询", notes="教育信息化基本情况统计表-分页列表查询")
	@GetMapping(value = "/list")
	public Result<IPage<EduInformatizationBasicInfo>> queryPageList(EduInformatizationBasicInfo eduInformatizationBasicInfo,
								   @RequestParam(name="pageNo", defaultValue="1") Integer pageNo,
								   @RequestParam(name="pageSize", defaultValue="10") Integer pageSize,
								   HttpServletRequest req) {
		QueryWrapper<EduInformatizationBasicInfo> queryWrapper = QueryGenerator.initQueryWrapper(eduInformatizationBasicInfo, req.getParameterMap());
		Page<EduInformatizationBasicInfo> page = new Page<EduInformatizationBasicInfo>(pageNo, pageSize);
		IPage<EduInformatizationBasicInfo> pageList = eduInformatizationBasicInfoService.page(page, queryWrapper);
		return Result.OK(pageList);
	}
	
	/**
	 *   添加
	 *
	 * @param eduInformatizationBasicInfo
	 * @return
	 */
	@AutoLog(value = "教育信息化基本情况统计表-添加")
	@ApiOperation(value="教育信息化基本情况统计表-添加", notes="教育信息化基本情况统计表-添加")
	@RequiresPermissions("edu.eduinformatizationbasic:edu_informatization_basic_info:add")
	@PostMapping(value = "/add")
	public Result<String> add(@RequestBody EduInformatizationBasicInfo eduInformatizationBasicInfo) {
		eduInformatizationBasicInfoService.save(eduInformatizationBasicInfo);
		return Result.OK("添加成功！");
	}
	
	/**
	 *  编辑
	 *
	 * @param eduInformatizationBasicInfo
	 * @return
	 */
	@AutoLog(value = "教育信息化基本情况统计表-编辑")
	@ApiOperation(value="教育信息化基本情况统计表-编辑", notes="教育信息化基本情况统计表-编辑")
	@RequiresPermissions("edu.eduinformatizationbasic:edu_informatization_basic_info:edit")
	@RequestMapping(value = "/edit", method = {RequestMethod.PUT,RequestMethod.POST})
	public Result<String> edit(@RequestBody EduInformatizationBasicInfo eduInformatizationBasicInfo) {
		eduInformatizationBasicInfoService.updateById(eduInformatizationBasicInfo);
		return Result.OK("编辑成功!");
	}
	
	/**
	 *   通过id删除
	 *
	 * @param id
	 * @return
	 */
	@AutoLog(value = "教育信息化基本情况统计表-通过id删除")
	@ApiOperation(value="教育信息化基本情况统计表-通过id删除", notes="教育信息化基本情况统计表-通过id删除")
	@RequiresPermissions("edu.eduinformatizationbasic:edu_informatization_basic_info:delete")
	@DeleteMapping(value = "/delete")
	public Result<String> delete(@RequestParam(name="id",required=true) String id) {
		eduInformatizationBasicInfoService.removeById(id);
		return Result.OK("删除成功!");
	}
	
	/**
	 *  批量删除
	 *
	 * @param ids
	 * @return
	 */
	@AutoLog(value = "教育信息化基本情况统计表-批量删除")
	@ApiOperation(value="教育信息化基本情况统计表-批量删除", notes="教育信息化基本情况统计表-批量删除")
	@RequiresPermissions("edu.eduinformatizationbasic:edu_informatization_basic_info:deleteBatch")
	@DeleteMapping(value = "/deleteBatch")
	public Result<String> deleteBatch(@RequestParam(name="ids",required=true) String ids) {
		this.eduInformatizationBasicInfoService.removeByIds(Arrays.asList(ids.split(",")));
		return Result.OK("批量删除成功!");
	}
	
	/**
	 * 通过id查询
	 *
	 * @param id
	 * @return
	 */
	//@AutoLog(value = "教育信息化基本情况统计表-通过id查询")
	@ApiOperation(value="教育信息化基本情况统计表-通过id查询", notes="教育信息化基本情况统计表-通过id查询")
	@GetMapping(value = "/queryById")
	public Result<EduInformatizationBasicInfo> queryById(@RequestParam(name="id",required=true) String id) {
		EduInformatizationBasicInfo eduInformatizationBasicInfo = eduInformatizationBasicInfoService.getById(id);
		if(eduInformatizationBasicInfo==null) {
			return Result.error("未找到对应数据");
		}
		return Result.OK(eduInformatizationBasicInfo);
	}

    /**
    * 导出excel
    *
    * @param request
    * @param eduInformatizationBasicInfo
    */
    @RequiresPermissions("edu.eduinformatizationbasic:edu_informatization_basic_info:exportXls")
    @RequestMapping(value = "/exportXls")
    public ModelAndView exportXls(HttpServletRequest request, EduInformatizationBasicInfo eduInformatizationBasicInfo) {
        return super.exportXls(request, eduInformatizationBasicInfo, EduInformatizationBasicInfo.class, "教育信息化基本情况统计表");
    }

    /**
      * 通过excel导入数据
    *
    * @param request
    * @param response
    * @return
    */
    @RequiresPermissions("edu.eduinformatizationbasic:edu_informatization_basic_info:importExcel")
    @RequestMapping(value = "/importExcel", method = RequestMethod.POST)
    public Result<?> importExcel(HttpServletRequest request, HttpServletResponse response) {
        return super.importExcel(request, response, EduInformatizationBasicInfo.class);
    }

}
