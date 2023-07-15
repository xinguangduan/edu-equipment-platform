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
import org.eemp.modules.edu.statistics.entity.SchoolMusicArtRoomInfo_6;
import org.eemp.modules.edu.statistics.service.ISchoolMusicArtRoomInfo_6Service;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

 /**
 * @Description: 中小学音乐、美术教学用房统计表（六）
 * @Date:   2023-07-15
 * @Version: V1.0
 */
@Api(tags="中小学音乐、美术教学用房统计表（六）")
@RestController
@RequestMapping("/org.eemp.modules.edu.statistics/schoolMusicArtRoomInfo_6")
@Slf4j
@RequiredArgsConstructor
public class SchoolMusicArtRoomInfo_6Controller extends BaseController<SchoolMusicArtRoomInfo_6, ISchoolMusicArtRoomInfo_6Service> {
	private final ISchoolMusicArtRoomInfo_6Service schoolMusicArtRoomInfo_6Service;
	
	/**
	 * 分页列表查询
	 *
	 * @param schoolMusicArtRoomInfo_6
	 * @param pageNo
	 * @param pageSize
	 * @param req
	 * @return
	 */
	//@AutoLog(value = "中小学音乐、美术教学用房统计表（六）-分页列表查询")
	@ApiOperation(value="中小学音乐、美术教学用房统计表（六）-分页列表查询", notes="中小学音乐、美术教学用房统计表（六）-分页列表查询")
	@GetMapping(value = "/list")
	public Result<IPage<SchoolMusicArtRoomInfo_6>> queryPageList(SchoolMusicArtRoomInfo_6 schoolMusicArtRoomInfo_6,
								   @RequestParam(name="pageNo", defaultValue="1") Integer pageNo,
								   @RequestParam(name="pageSize", defaultValue="10") Integer pageSize,
								   HttpServletRequest req) {
		QueryWrapper<SchoolMusicArtRoomInfo_6> queryWrapper = QueryGenerator.initQueryWrapper(schoolMusicArtRoomInfo_6, req.getParameterMap());
		Page<SchoolMusicArtRoomInfo_6> page = new Page<SchoolMusicArtRoomInfo_6>(pageNo, pageSize);
		IPage<SchoolMusicArtRoomInfo_6> pageList = schoolMusicArtRoomInfo_6Service.page(page, queryWrapper);
		return Result.OK(pageList);
	}
	
	/**
	 *   添加
	 *
	 * @param schoolMusicArtRoomInfo_6
	 * @return
	 */
	@AutoLog(value = "中小学音乐、美术教学用房统计表（六）-添加")
	@ApiOperation(value="中小学音乐、美术教学用房统计表（六）-添加", notes="中小学音乐、美术教学用房统计表（六）-添加")
	@RequiresPermissions("edu.statistics:school_music_art_room_info_6:add")
	@PostMapping(value = "/add")
	public Result<String> add(@RequestBody SchoolMusicArtRoomInfo_6 schoolMusicArtRoomInfo_6) {
		schoolMusicArtRoomInfo_6Service.save(schoolMusicArtRoomInfo_6);
		return Result.OK("添加成功！");
	}
	
	/**
	 *  编辑
	 *
	 * @param schoolMusicArtRoomInfo_6
	 * @return
	 */
	@AutoLog(value = "中小学音乐、美术教学用房统计表（六）-编辑")
	@ApiOperation(value="中小学音乐、美术教学用房统计表（六）-编辑", notes="中小学音乐、美术教学用房统计表（六）-编辑")
	@RequiresPermissions("edu.statistics:school_music_art_room_info_6:edit")
	@RequestMapping(value = "/edit", method = {RequestMethod.PUT,RequestMethod.POST})
	public Result<String> edit(@RequestBody SchoolMusicArtRoomInfo_6 schoolMusicArtRoomInfo_6) {
		schoolMusicArtRoomInfo_6Service.updateById(schoolMusicArtRoomInfo_6);
		return Result.OK("编辑成功!");
	}
	
	/**
	 *   通过id删除
	 *
	 * @param id
	 * @return
	 */
	@AutoLog(value = "中小学音乐、美术教学用房统计表（六）-通过id删除")
	@ApiOperation(value="中小学音乐、美术教学用房统计表（六）-通过id删除", notes="中小学音乐、美术教学用房统计表（六）-通过id删除")
	@RequiresPermissions("edu.statistics:school_music_art_room_info_6:delete")
	@DeleteMapping(value = "/delete")
	public Result<String> delete(@RequestParam(name="id",required=true) String id) {
		schoolMusicArtRoomInfo_6Service.removeById(id);
		return Result.OK("删除成功!");
	}
	
	/**
	 *  批量删除
	 *
	 * @param ids
	 * @return
	 */
	@AutoLog(value = "中小学音乐、美术教学用房统计表（六）-批量删除")
	@ApiOperation(value="中小学音乐、美术教学用房统计表（六）-批量删除", notes="中小学音乐、美术教学用房统计表（六）-批量删除")
	@RequiresPermissions("edu.statistics:school_music_art_room_info_6:deleteBatch")
	@DeleteMapping(value = "/deleteBatch")
	public Result<String> deleteBatch(@RequestParam(name="ids",required=true) String ids) {
		this.schoolMusicArtRoomInfo_6Service.removeByIds(Arrays.asList(ids.split(",")));
		return Result.OK("批量删除成功!");
	}
	
	/**
	 * 通过id查询
	 *
	 * @param id
	 * @return
	 */
	//@AutoLog(value = "中小学音乐、美术教学用房统计表（六）-通过id查询")
	@ApiOperation(value="中小学音乐、美术教学用房统计表（六）-通过id查询", notes="中小学音乐、美术教学用房统计表（六）-通过id查询")
	@GetMapping(value = "/queryById")
	public Result<SchoolMusicArtRoomInfo_6> queryById(@RequestParam(name="id",required=true) String id) {
		SchoolMusicArtRoomInfo_6 schoolMusicArtRoomInfo_6 = schoolMusicArtRoomInfo_6Service.getById(id);
		if(schoolMusicArtRoomInfo_6==null) {
			return Result.error("未找到对应数据");
		}
		return Result.OK(schoolMusicArtRoomInfo_6);
	}

    /**
    * 导出excel
    *
    * @param request
    * @param schoolMusicArtRoomInfo_6
    */
    @RequiresPermissions("edu.statistics:school_music_art_room_info_6:exportXls")
    @RequestMapping(value = "/exportXls")
    public ModelAndView exportXls(HttpServletRequest request, SchoolMusicArtRoomInfo_6 schoolMusicArtRoomInfo_6) {
        return super.exportXls(request, schoolMusicArtRoomInfo_6, SchoolMusicArtRoomInfo_6.class, "中小学音乐、美术教学用房统计表（六）");
    }

    /**
      * 通过excel导入数据
    *
    * @param request
    * @param response
    * @return
    */
    @RequiresPermissions("edu.statistics:school_music_art_room_info_6:importExcel")
    @RequestMapping(value = "/importExcel", method = RequestMethod.POST)
    public Result<?> importExcel(HttpServletRequest request, HttpServletResponse response) {
        return super.importExcel(request, response, SchoolMusicArtRoomInfo_6.class);
    }

}
