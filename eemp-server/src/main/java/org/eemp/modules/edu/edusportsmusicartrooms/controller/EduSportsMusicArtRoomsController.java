package org.eemp.modules.edu.edusportsmusicartrooms.controller;

import java.util.Arrays;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.eemp.common.api.vo.Result;
import org.eemp.common.aspect.annotation.AutoLog;
import org.eemp.common.system.base.controller.JeecgController;
import org.eemp.common.system.query.QueryGenerator;
import org.eemp.modules.edu.edusportsmusicartrooms.entity.EduSportsMusicArtRooms;
import org.eemp.modules.edu.edusportsmusicartrooms.service.IEduSportsMusicArtRoomsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

 /**
 * @Description: 中小学体育音乐美术教学用房统计表
 * @Author: jeecg-boot
 * @Date:   2023-04-16
 * @Version: V1.0
 */
@Api(tags="中小学体育音乐美术教学用房统计表")
@RestController
@RequestMapping("/edu/edusportsmusicartrooms/eduSportsMusicArtRooms")
@Slf4j
public class EduSportsMusicArtRoomsController extends JeecgController<EduSportsMusicArtRooms, IEduSportsMusicArtRoomsService> {
	@Autowired
	private IEduSportsMusicArtRoomsService eduSportsMusicArtRoomsService;
	
	/**
	 * 分页列表查询
	 *
	 * @param eduSportsMusicArtRooms
	 * @param pageNo
	 * @param pageSize
	 * @param req
	 * @return
	 */
	//@AutoLog(value = "中小学体育音乐美术教学用房统计表-分页列表查询")
	@ApiOperation(value="中小学体育音乐美术教学用房统计表-分页列表查询", notes="中小学体育音乐美术教学用房统计表-分页列表查询")
	@GetMapping(value = "/list")
	public Result<IPage<EduSportsMusicArtRooms>> queryPageList(EduSportsMusicArtRooms eduSportsMusicArtRooms,
								   @RequestParam(name="pageNo", defaultValue="1") Integer pageNo,
								   @RequestParam(name="pageSize", defaultValue="10") Integer pageSize,
								   HttpServletRequest req) {
		QueryWrapper<EduSportsMusicArtRooms> queryWrapper = QueryGenerator.initQueryWrapper(eduSportsMusicArtRooms, req.getParameterMap());
		Page<EduSportsMusicArtRooms> page = new Page<EduSportsMusicArtRooms>(pageNo, pageSize);
		IPage<EduSportsMusicArtRooms> pageList = eduSportsMusicArtRoomsService.page(page, queryWrapper);
		return Result.OK(pageList);
	}
	
	/**
	 *   添加
	 *
	 * @param eduSportsMusicArtRooms
	 * @return
	 */
	@AutoLog(value = "中小学体育音乐美术教学用房统计表-添加")
	@ApiOperation(value="中小学体育音乐美术教学用房统计表-添加", notes="中小学体育音乐美术教学用房统计表-添加")
	@RequiresPermissions("edu.edusportsmusicartrooms:edu_sports_music_art_rooms:add")
	@PostMapping(value = "/add")
	public Result<String> add(@RequestBody EduSportsMusicArtRooms eduSportsMusicArtRooms) {
		eduSportsMusicArtRoomsService.save(eduSportsMusicArtRooms);
		return Result.OK("添加成功！");
	}
	
	/**
	 *  编辑
	 *
	 * @param eduSportsMusicArtRooms
	 * @return
	 */
	@AutoLog(value = "中小学体育音乐美术教学用房统计表-编辑")
	@ApiOperation(value="中小学体育音乐美术教学用房统计表-编辑", notes="中小学体育音乐美术教学用房统计表-编辑")
	@RequiresPermissions("edu.edusportsmusicartrooms:edu_sports_music_art_rooms:edit")
	@RequestMapping(value = "/edit", method = {RequestMethod.PUT,RequestMethod.POST})
	public Result<String> edit(@RequestBody EduSportsMusicArtRooms eduSportsMusicArtRooms) {
		eduSportsMusicArtRoomsService.updateById(eduSportsMusicArtRooms);
		return Result.OK("编辑成功!");
	}
	
	/**
	 *   通过id删除
	 *
	 * @param id
	 * @return
	 */
	@AutoLog(value = "中小学体育音乐美术教学用房统计表-通过id删除")
	@ApiOperation(value="中小学体育音乐美术教学用房统计表-通过id删除", notes="中小学体育音乐美术教学用房统计表-通过id删除")
	@RequiresPermissions("edu.edusportsmusicartrooms:edu_sports_music_art_rooms:delete")
	@DeleteMapping(value = "/delete")
	public Result<String> delete(@RequestParam(name="id",required=true) String id) {
		eduSportsMusicArtRoomsService.removeById(id);
		return Result.OK("删除成功!");
	}
	
	/**
	 *  批量删除
	 *
	 * @param ids
	 * @return
	 */
	@AutoLog(value = "中小学体育音乐美术教学用房统计表-批量删除")
	@ApiOperation(value="中小学体育音乐美术教学用房统计表-批量删除", notes="中小学体育音乐美术教学用房统计表-批量删除")
	@RequiresPermissions("edu.edusportsmusicartrooms:edu_sports_music_art_rooms:deleteBatch")
	@DeleteMapping(value = "/deleteBatch")
	public Result<String> deleteBatch(@RequestParam(name="ids",required=true) String ids) {
		this.eduSportsMusicArtRoomsService.removeByIds(Arrays.asList(ids.split(",")));
		return Result.OK("批量删除成功!");
	}
	
	/**
	 * 通过id查询
	 *
	 * @param id
	 * @return
	 */
	//@AutoLog(value = "中小学体育音乐美术教学用房统计表-通过id查询")
	@ApiOperation(value="中小学体育音乐美术教学用房统计表-通过id查询", notes="中小学体育音乐美术教学用房统计表-通过id查询")
	@GetMapping(value = "/queryById")
	public Result<EduSportsMusicArtRooms> queryById(@RequestParam(name="id",required=true) String id) {
		EduSportsMusicArtRooms eduSportsMusicArtRooms = eduSportsMusicArtRoomsService.getById(id);
		if(eduSportsMusicArtRooms==null) {
			return Result.error("未找到对应数据");
		}
		return Result.OK(eduSportsMusicArtRooms);
	}

    /**
    * 导出excel
    *
    * @param request
    * @param eduSportsMusicArtRooms
    */
    @RequiresPermissions("edu.edusportsmusicartrooms:edu_sports_music_art_rooms:exportXls")
    @RequestMapping(value = "/exportXls")
    public ModelAndView exportXls(HttpServletRequest request, EduSportsMusicArtRooms eduSportsMusicArtRooms) {
        return super.exportXls(request, eduSportsMusicArtRooms, EduSportsMusicArtRooms.class, "中小学体育音乐美术教学用房统计表");
    }

    /**
      * 通过excel导入数据
    *
    * @param request
    * @param response
    * @return
    */
    @RequiresPermissions("edu.edusportsmusicartrooms:edu_sports_music_art_rooms:importExcel")
    @RequestMapping(value = "/importExcel", method = RequestMethod.POST)
    public Result<?> importExcel(HttpServletRequest request, HttpServletResponse response) {
        return super.importExcel(request, response, EduSportsMusicArtRooms.class);
    }

}
