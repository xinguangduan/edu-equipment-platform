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
import org.eemp.modules.edu.statistics.entity.SchoolSportRoomInfo_5;
import org.eemp.modules.edu.statistics.service.ISchoolSportRoomInfo_5Service;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

 /**
 * @Description: 中小学体育用房统计表（五）
 * @Date:   2023-07-15
 * @Version: V1.0
 */
@Api(tags="中小学体育用房统计表（五）")
@RestController
@RequestMapping("/org.eemp.modules.edu.statistics/schoolSportRoomInfo_5")
@Slf4j
@RequiredArgsConstructor
public class SchoolSportRoomInfo_5Controller extends BaseController<SchoolSportRoomInfo_5, ISchoolSportRoomInfo_5Service> {
	private final ISchoolSportRoomInfo_5Service schoolSportRoomInfo_5Service;
	
	/**
	 * 分页列表查询
	 *
	 * @param schoolSportRoomInfo_5
	 * @param pageNo
	 * @param pageSize
	 * @param req
	 * @return
	 */
	//@AutoLog(value = "中小学体育用房统计表（五）-分页列表查询")
	@ApiOperation(value="中小学体育用房统计表（五）-分页列表查询", notes="中小学体育用房统计表（五）-分页列表查询")
	@GetMapping(value = "/list")
	@PermissionData(pageComponent = "edu/statistics/SchoolSportRoomInfo_5List")
	public Result<IPage<SchoolSportRoomInfo_5>> queryPageList(SchoolSportRoomInfo_5 schoolSportRoomInfo_5,
								   @RequestParam(name="pageNo", defaultValue="1") Integer pageNo,
								   @RequestParam(name="pageSize", defaultValue="10") Integer pageSize,
								   HttpServletRequest req) {
		QueryWrapper<SchoolSportRoomInfo_5> queryWrapper = QueryGenerator.initQueryWrapper(schoolSportRoomInfo_5, req.getParameterMap());
		Page<SchoolSportRoomInfo_5> page = new Page<SchoolSportRoomInfo_5>(pageNo, pageSize);
		IPage<SchoolSportRoomInfo_5> pageList = schoolSportRoomInfo_5Service.page(page, queryWrapper);
		return Result.OK(pageList);
	}
	
	/**
	 *   添加
	 *
	 * @param schoolSportRoomInfo_5
	 * @return
	 */
	@AutoLog(value = "中小学体育用房统计表（五）-添加")
	@ApiOperation(value="中小学体育用房统计表（五）-添加", notes="中小学体育用房统计表（五）-添加")
	@RequiresPermissions("edu.statistics:school_sport_room_info_5:add")
	@PostMapping(value = "/add")
	public Result<String> add(@RequestBody SchoolSportRoomInfo_5 schoolSportRoomInfo_5) {
		schoolSportRoomInfo_5Service.save(schoolSportRoomInfo_5);
		return Result.OK("添加成功！");
	}
	
	/**
	 *  编辑
	 *
	 * @param schoolSportRoomInfo_5
	 * @return
	 */
	@AutoLog(value = "中小学体育用房统计表（五）-编辑")
	@ApiOperation(value="中小学体育用房统计表（五）-编辑", notes="中小学体育用房统计表（五）-编辑")
	@RequiresPermissions("edu.statistics:school_sport_room_info_5:edit")
	@RequestMapping(value = "/edit", method = {RequestMethod.PUT,RequestMethod.POST})
	public Result<String> edit(@RequestBody SchoolSportRoomInfo_5 schoolSportRoomInfo_5) {
		schoolSportRoomInfo_5Service.updateById(schoolSportRoomInfo_5);
		return Result.OK("编辑成功!");
	}
	
	/**
	 *   通过id删除
	 *
	 * @param id
	 * @return
	 */
	@AutoLog(value = "中小学体育用房统计表（五）-通过id删除")
	@ApiOperation(value="中小学体育用房统计表（五）-通过id删除", notes="中小学体育用房统计表（五）-通过id删除")
	@RequiresPermissions("edu.statistics:school_sport_room_info_5:delete")
	@DeleteMapping(value = "/delete")
	public Result<String> delete(@RequestParam(name="id",required=true) String id) {
		schoolSportRoomInfo_5Service.removeById(id);
		return Result.OK("删除成功!");
	}
	
	/**
	 *  批量删除
	 *
	 * @param ids
	 * @return
	 */
	@AutoLog(value = "中小学体育用房统计表（五）-批量删除")
	@ApiOperation(value="中小学体育用房统计表（五）-批量删除", notes="中小学体育用房统计表（五）-批量删除")
	@RequiresPermissions("edu.statistics:school_sport_room_info_5:deleteBatch")
	@DeleteMapping(value = "/deleteBatch")
	public Result<String> deleteBatch(@RequestParam(name="ids",required=true) String ids) {
		this.schoolSportRoomInfo_5Service.removeByIds(Arrays.asList(ids.split(",")));
		return Result.OK("批量删除成功!");
	}
	
	/**
	 * 通过id查询
	 *
	 * @param id
	 * @return
	 */
	//@AutoLog(value = "中小学体育用房统计表（五）-通过id查询")
	@ApiOperation(value="中小学体育用房统计表（五）-通过id查询", notes="中小学体育用房统计表（五）-通过id查询")
	@GetMapping(value = "/queryById")
	public Result<SchoolSportRoomInfo_5> queryById(@RequestParam(name="id",required=true) String id) {
		SchoolSportRoomInfo_5 schoolSportRoomInfo_5 = schoolSportRoomInfo_5Service.getById(id);
		if(schoolSportRoomInfo_5==null) {
			return Result.error("未找到对应数据");
		}
		return Result.OK(schoolSportRoomInfo_5);
	}

    /**
    * 导出excel
    *
    * @param request
    * @param schoolSportRoomInfo_5
    */
    @RequiresPermissions("edu.statistics:school_sport_room_info_5:exportXls")
    @RequestMapping(value = "/exportXls")
    public ModelAndView exportXls(HttpServletRequest request, SchoolSportRoomInfo_5 schoolSportRoomInfo_5) {
        return super.exportXls(request, schoolSportRoomInfo_5, SchoolSportRoomInfo_5.class, "中小学体育用房统计表（五）");
    }

    /**
      * 通过excel导入数据
    *
    * @param request
    * @param response
    * @return
    */
    @RequiresPermissions("edu.statistics:school_sport_room_info_5:importExcel")
    @RequestMapping(value = "/importExcel", method = RequestMethod.POST)
    public Result<?> importExcel(HttpServletRequest request, HttpServletResponse response) {
        return super.importExcel(request, response, SchoolSportRoomInfo_5.class);
    }

}
