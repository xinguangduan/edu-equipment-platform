package org.eemp.modules.edu.edulibrarybasic.controller;

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
import org.eemp.modules.edu.edulibrarybasic.entity.EduLibraryBasicInfo;
import org.eemp.modules.edu.edulibrarybasic.service.IEduLibraryBasicInfoService;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

 /**
 * @Description: 中小学图书室基本情况统计表
 * @Author: jeecg-boot
 * @Date:   2023-04-16
 * @Version: V1.0
 */
@Api(tags="中小学图书室基本情况统计表")
@RestController
@RequestMapping("/edu/edulibrarybasic/eduLibraryBasicInfo")
@Slf4j
@RequiredArgsConstructor
public class EduLibraryBasicInfoController extends BaseController<EduLibraryBasicInfo, IEduLibraryBasicInfoService> {

	private final IEduLibraryBasicInfoService eduLibraryBasicInfoService;
	
	/**
	 * 分页列表查询
	 *
	 * @param eduLibraryBasicInfo
	 * @param pageNo
	 * @param pageSize
	 * @param req
	 * @return
	 */
	//@AutoLog(value = "中小学图书室基本情况统计表-分页列表查询")
	@ApiOperation(value="中小学图书室基本情况统计表-分页列表查询", notes="中小学图书室基本情况统计表-分页列表查询")
	@GetMapping(value = "/list")
	public Result<IPage<EduLibraryBasicInfo>> queryPageList(EduLibraryBasicInfo eduLibraryBasicInfo,
								   @RequestParam(name="pageNo", defaultValue="1") Integer pageNo,
								   @RequestParam(name="pageSize", defaultValue="10") Integer pageSize,
								   HttpServletRequest req) {
		QueryWrapper<EduLibraryBasicInfo> queryWrapper = QueryGenerator.initQueryWrapper(eduLibraryBasicInfo, req.getParameterMap());
		Page<EduLibraryBasicInfo> page = new Page<EduLibraryBasicInfo>(pageNo, pageSize);
		IPage<EduLibraryBasicInfo> pageList = eduLibraryBasicInfoService.page(page, queryWrapper);
		return Result.OK(pageList);
	}
	
	/**
	 *   添加
	 *
	 * @param eduLibraryBasicInfo
	 * @return
	 */
	@AutoLog(value = "中小学图书室基本情况统计表-添加")
	@ApiOperation(value="中小学图书室基本情况统计表-添加", notes="中小学图书室基本情况统计表-添加")
	@RequiresPermissions("edu.edulibrarybasic:edu_library_basic_info:add")
	@PostMapping(value = "/add")
	public Result<String> add(@RequestBody EduLibraryBasicInfo eduLibraryBasicInfo) {
		eduLibraryBasicInfoService.save(eduLibraryBasicInfo);
		return Result.OK("添加成功！");
	}
	
	/**
	 *  编辑
	 *
	 * @param eduLibraryBasicInfo
	 * @return
	 */
	@AutoLog(value = "中小学图书室基本情况统计表-编辑")
	@ApiOperation(value="中小学图书室基本情况统计表-编辑", notes="中小学图书室基本情况统计表-编辑")
	@RequiresPermissions("edu.edulibrarybasic:edu_library_basic_info:edit")
	@RequestMapping(value = "/edit", method = {RequestMethod.PUT,RequestMethod.POST})
	public Result<String> edit(@RequestBody EduLibraryBasicInfo eduLibraryBasicInfo) {
		eduLibraryBasicInfoService.updateById(eduLibraryBasicInfo);
		return Result.OK("编辑成功!");
	}
	
	/**
	 *   通过id删除
	 *
	 * @param id
	 * @return
	 */
	@AutoLog(value = "中小学图书室基本情况统计表-通过id删除")
	@ApiOperation(value="中小学图书室基本情况统计表-通过id删除", notes="中小学图书室基本情况统计表-通过id删除")
	@RequiresPermissions("edu.edulibrarybasic:edu_library_basic_info:delete")
	@DeleteMapping(value = "/delete")
	public Result<String> delete(@RequestParam(name="id",required=true) String id) {
		eduLibraryBasicInfoService.removeById(id);
		return Result.OK("删除成功!");
	}
	
	/**
	 *  批量删除
	 *
	 * @param ids
	 * @return
	 */
	@AutoLog(value = "中小学图书室基本情况统计表-批量删除")
	@ApiOperation(value="中小学图书室基本情况统计表-批量删除", notes="中小学图书室基本情况统计表-批量删除")
	@RequiresPermissions("edu.edulibrarybasic:edu_library_basic_info:deleteBatch")
	@DeleteMapping(value = "/deleteBatch")
	public Result<String> deleteBatch(@RequestParam(name="ids",required=true) String ids) {
		this.eduLibraryBasicInfoService.removeByIds(Arrays.asList(ids.split(",")));
		return Result.OK("批量删除成功!");
	}
	
	/**
	 * 通过id查询
	 *
	 * @param id
	 * @return
	 */
	//@AutoLog(value = "中小学图书室基本情况统计表-通过id查询")
	@ApiOperation(value="中小学图书室基本情况统计表-通过id查询", notes="中小学图书室基本情况统计表-通过id查询")
	@GetMapping(value = "/queryById")
	public Result<EduLibraryBasicInfo> queryById(@RequestParam(name="id",required=true) String id) {
		EduLibraryBasicInfo eduLibraryBasicInfo = eduLibraryBasicInfoService.getById(id);
		if(eduLibraryBasicInfo==null) {
			return Result.error("未找到对应数据");
		}
		return Result.OK(eduLibraryBasicInfo);
	}

    /**
    * 导出excel
    *
    * @param request
    * @param eduLibraryBasicInfo
    */
    @RequiresPermissions("edu.edulibrarybasic:edu_library_basic_info:exportXls")
    @RequestMapping(value = "/exportXls")
    public ModelAndView exportXls(HttpServletRequest request, EduLibraryBasicInfo eduLibraryBasicInfo) {
        return super.exportXls(request, eduLibraryBasicInfo, EduLibraryBasicInfo.class, "中小学图书室基本情况统计表");
    }

    /**
      * 通过excel导入数据
    *
    * @param request
    * @param response
    * @return
    */
    @RequiresPermissions("edu.edulibrarybasic:edu_library_basic_info:importExcel")
    @RequestMapping(value = "/importExcel", method = RequestMethod.POST)
    public Result<?> importExcel(HttpServletRequest request, HttpServletResponse response) {
        return super.importExcel(request, response, EduLibraryBasicInfo.class);
    }

}
