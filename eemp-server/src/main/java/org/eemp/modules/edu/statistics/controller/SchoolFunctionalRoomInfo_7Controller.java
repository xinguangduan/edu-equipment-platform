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
import org.eemp.modules.edu.statistics.entity.SchoolFunctionalRoomInfo_7;
import org.eemp.modules.edu.statistics.service.ISchoolFunctionalRoomInfo_7Service;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

 /**
 * @Description: 中小学功能室用房统计表（七）
 * @Date:   2023-07-15
 * @Version: V1.0
 */
@Api(tags="中小学功能室用房统计表（七）")
@RestController
@RequestMapping("/org.eemp.modules.edu.statistics/schoolFunctionalRoomInfo_7")
@Slf4j
@RequiredArgsConstructor
public class SchoolFunctionalRoomInfo_7Controller extends BaseController<SchoolFunctionalRoomInfo_7, ISchoolFunctionalRoomInfo_7Service> {
	private final ISchoolFunctionalRoomInfo_7Service schoolFunctionalRoomInfo_7Service;
	
	/**
	 * 分页列表查询
	 *
	 * @param schoolFunctionalRoomInfo_7
	 * @param pageNo
	 * @param pageSize
	 * @param req
	 * @return
	 */
	//@AutoLog(value = "中小学功能室用房统计表（七）-分页列表查询")
	@ApiOperation(value="中小学功能室用房统计表（七）-分页列表查询", notes="中小学功能室用房统计表（七）-分页列表查询")
	@GetMapping(value = "/list")
	public Result<IPage<SchoolFunctionalRoomInfo_7>> queryPageList(SchoolFunctionalRoomInfo_7 schoolFunctionalRoomInfo_7,
								   @RequestParam(name="pageNo", defaultValue="1") Integer pageNo,
								   @RequestParam(name="pageSize", defaultValue="10") Integer pageSize,
								   HttpServletRequest req) {
		QueryWrapper<SchoolFunctionalRoomInfo_7> queryWrapper = QueryGenerator.initQueryWrapper(schoolFunctionalRoomInfo_7, req.getParameterMap());
		Page<SchoolFunctionalRoomInfo_7> page = new Page<SchoolFunctionalRoomInfo_7>(pageNo, pageSize);
		IPage<SchoolFunctionalRoomInfo_7> pageList = schoolFunctionalRoomInfo_7Service.page(page, queryWrapper);
		return Result.OK(pageList);
	}
	
	/**
	 *   添加
	 *
	 * @param schoolFunctionalRoomInfo_7
	 * @return
	 */
	@AutoLog(value = "中小学功能室用房统计表（七）-添加")
	@ApiOperation(value="中小学功能室用房统计表（七）-添加", notes="中小学功能室用房统计表（七）-添加")
	@RequiresPermissions("edu.statistics:school_functional_room_info_7:add")
	@PostMapping(value = "/add")
	public Result<String> add(@RequestBody SchoolFunctionalRoomInfo_7 schoolFunctionalRoomInfo_7) {
		schoolFunctionalRoomInfo_7Service.save(schoolFunctionalRoomInfo_7);
		return Result.OK("添加成功！");
	}
	
	/**
	 *  编辑
	 *
	 * @param schoolFunctionalRoomInfo_7
	 * @return
	 */
	@AutoLog(value = "中小学功能室用房统计表（七）-编辑")
	@ApiOperation(value="中小学功能室用房统计表（七）-编辑", notes="中小学功能室用房统计表（七）-编辑")
	@RequiresPermissions("edu.statistics:school_functional_room_info_7:edit")
	@RequestMapping(value = "/edit", method = {RequestMethod.PUT,RequestMethod.POST})
	public Result<String> edit(@RequestBody SchoolFunctionalRoomInfo_7 schoolFunctionalRoomInfo_7) {
		schoolFunctionalRoomInfo_7Service.updateById(schoolFunctionalRoomInfo_7);
		return Result.OK("编辑成功!");
	}
	
	/**
	 *   通过id删除
	 *
	 * @param id
	 * @return
	 */
	@AutoLog(value = "中小学功能室用房统计表（七）-通过id删除")
	@ApiOperation(value="中小学功能室用房统计表（七）-通过id删除", notes="中小学功能室用房统计表（七）-通过id删除")
	@RequiresPermissions("edu.statistics:school_functional_room_info_7:delete")
	@DeleteMapping(value = "/delete")
	public Result<String> delete(@RequestParam(name="id",required=true) String id) {
		schoolFunctionalRoomInfo_7Service.removeById(id);
		return Result.OK("删除成功!");
	}
	
	/**
	 *  批量删除
	 *
	 * @param ids
	 * @return
	 */
	@AutoLog(value = "中小学功能室用房统计表（七）-批量删除")
	@ApiOperation(value="中小学功能室用房统计表（七）-批量删除", notes="中小学功能室用房统计表（七）-批量删除")
	@RequiresPermissions("edu.statistics:school_functional_room_info_7:deleteBatch")
	@DeleteMapping(value = "/deleteBatch")
	public Result<String> deleteBatch(@RequestParam(name="ids",required=true) String ids) {
		this.schoolFunctionalRoomInfo_7Service.removeByIds(Arrays.asList(ids.split(",")));
		return Result.OK("批量删除成功!");
	}
	
	/**
	 * 通过id查询
	 *
	 * @param id
	 * @return
	 */
	//@AutoLog(value = "中小学功能室用房统计表（七）-通过id查询")
	@ApiOperation(value="中小学功能室用房统计表（七）-通过id查询", notes="中小学功能室用房统计表（七）-通过id查询")
	@GetMapping(value = "/queryById")
	public Result<SchoolFunctionalRoomInfo_7> queryById(@RequestParam(name="id",required=true) String id) {
		SchoolFunctionalRoomInfo_7 schoolFunctionalRoomInfo_7 = schoolFunctionalRoomInfo_7Service.getById(id);
		if(schoolFunctionalRoomInfo_7==null) {
			return Result.error("未找到对应数据");
		}
		return Result.OK(schoolFunctionalRoomInfo_7);
	}

    /**
    * 导出excel
    *
    * @param request
    * @param schoolFunctionalRoomInfo_7
    */
    @RequiresPermissions("edu.statistics:school_functional_room_info_7:exportXls")
    @RequestMapping(value = "/exportXls")
    public ModelAndView exportXls(HttpServletRequest request, SchoolFunctionalRoomInfo_7 schoolFunctionalRoomInfo_7) {
        return super.exportXls(request, schoolFunctionalRoomInfo_7, SchoolFunctionalRoomInfo_7.class, "中小学功能室用房统计表（七）");
    }

    /**
      * 通过excel导入数据
    *
    * @param request
    * @param response
    * @return
    */
    @RequiresPermissions("edu.statistics:school_functional_room_info_7:importExcel")
    @RequestMapping(value = "/importExcel", method = RequestMethod.POST)
    public Result<?> importExcel(HttpServletRequest request, HttpServletResponse response) {
        return super.importExcel(request, response, SchoolFunctionalRoomInfo_7.class);
    }

}
