package org.eemp.modules.edu.primaryartequipment.controller;

import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.jeecg.common.api.vo.Result;
import org.jeecg.common.system.query.QueryGenerator;
import org.jeecg.common.util.oConvertUtils;
import org.eemp.modules.edu.primaryartequipment.entity.EduPrimaryArtEquipment;
import org.eemp.modules.edu.primaryartequipment.service.IEduPrimaryArtEquipmentService;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.extern.slf4j.Slf4j;

import org.jeecgframework.poi.excel.ExcelImportUtil;
import org.jeecgframework.poi.excel.def.NormalExcelConstants;
import org.jeecgframework.poi.excel.entity.ExportParams;
import org.jeecgframework.poi.excel.entity.ImportParams;
import org.jeecgframework.poi.excel.view.JeecgEntityExcelView;
import org.jeecg.common.system.base.controller.JeecgController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import com.alibaba.fastjson.JSON;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.jeecg.common.aspect.annotation.AutoLog;
import org.apache.shiro.authz.annotation.RequiresPermissions;

 /**
 * @Description: 小学美术教学器材配备标准
 * @Author: jeecg-boot
 * @Date:   2023-08-27
 * @Version: V1.0
 */
@Api(tags="小学美术教学器材配备标准")
@RestController
@RequestMapping("/primaryartequipment/eduPrimaryArtEquipment")
@Slf4j
public class EduPrimaryArtEquipmentController extends JeecgController<EduPrimaryArtEquipment, IEduPrimaryArtEquipmentService> {
	@Autowired
	private IEduPrimaryArtEquipmentService eduPrimaryArtEquipmentService;
	
	/**
	 * 分页列表查询
	 *
	 * @param eduPrimaryArtEquipment
	 * @param pageNo
	 * @param pageSize
	 * @param req
	 * @return
	 */
	//@AutoLog(value = "小学美术教学器材配备标准-分页列表查询")
	@ApiOperation(value="小学美术教学器材配备标准-分页列表查询", notes="小学美术教学器材配备标准-分页列表查询")
	@GetMapping(value = "/list")
	public Result<IPage<EduPrimaryArtEquipment>> queryPageList(EduPrimaryArtEquipment eduPrimaryArtEquipment,
								   @RequestParam(name="pageNo", defaultValue="1") Integer pageNo,
								   @RequestParam(name="pageSize", defaultValue="10") Integer pageSize,
								   HttpServletRequest req) {
		QueryWrapper<EduPrimaryArtEquipment> queryWrapper = QueryGenerator.initQueryWrapper(eduPrimaryArtEquipment, req.getParameterMap());
		Page<EduPrimaryArtEquipment> page = new Page<EduPrimaryArtEquipment>(pageNo, pageSize);
		IPage<EduPrimaryArtEquipment> pageList = eduPrimaryArtEquipmentService.page(page, queryWrapper);
		return Result.OK(pageList);
	}
	
	/**
	 *   添加
	 *
	 * @param eduPrimaryArtEquipment
	 * @return
	 */
	@AutoLog(value = "小学美术教学器材配备标准-添加")
	@ApiOperation(value="小学美术教学器材配备标准-添加", notes="小学美术教学器材配备标准-添加")
	//@RequiresPermissions("primaryartequipment:edu_primary_art_equipment:add")
	@PostMapping(value = "/add")
	public Result<String> add(@RequestBody EduPrimaryArtEquipment eduPrimaryArtEquipment) {
		eduPrimaryArtEquipmentService.save(eduPrimaryArtEquipment);
		return Result.OK("添加成功！");
	}
	
	/**
	 *  编辑
	 *
	 * @param eduPrimaryArtEquipment
	 * @return
	 */
	@AutoLog(value = "小学美术教学器材配备标准-编辑")
	@ApiOperation(value="小学美术教学器材配备标准-编辑", notes="小学美术教学器材配备标准-编辑")
	//@RequiresPermissions("primaryartequipment:edu_primary_art_equipment:edit")
	@RequestMapping(value = "/edit", method = {RequestMethod.PUT,RequestMethod.POST})
	public Result<String> edit(@RequestBody EduPrimaryArtEquipment eduPrimaryArtEquipment) {
		eduPrimaryArtEquipmentService.updateById(eduPrimaryArtEquipment);
		return Result.OK("编辑成功!");
	}
	
	/**
	 *   通过id删除
	 *
	 * @param id
	 * @return
	 */
	@AutoLog(value = "小学美术教学器材配备标准-通过id删除")
	@ApiOperation(value="小学美术教学器材配备标准-通过id删除", notes="小学美术教学器材配备标准-通过id删除")
	//@RequiresPermissions("primaryartequipment:edu_primary_art_equipment:delete")
	@DeleteMapping(value = "/delete")
	public Result<String> delete(@RequestParam(name="id",required=true) String id) {
		eduPrimaryArtEquipmentService.removeById(id);
		return Result.OK("删除成功!");
	}
	
	/**
	 *  批量删除
	 *
	 * @param ids
	 * @return
	 */
	@AutoLog(value = "小学美术教学器材配备标准-批量删除")
	@ApiOperation(value="小学美术教学器材配备标准-批量删除", notes="小学美术教学器材配备标准-批量删除")
	//@RequiresPermissions("primaryartequipment:edu_primary_art_equipment:deleteBatch")
	@DeleteMapping(value = "/deleteBatch")
	public Result<String> deleteBatch(@RequestParam(name="ids",required=true) String ids) {
		this.eduPrimaryArtEquipmentService.removeByIds(Arrays.asList(ids.split(",")));
		return Result.OK("批量删除成功!");
	}
	
	/**
	 * 通过id查询
	 *
	 * @param id
	 * @return
	 */
	//@AutoLog(value = "小学美术教学器材配备标准-通过id查询")
	@ApiOperation(value="小学美术教学器材配备标准-通过id查询", notes="小学美术教学器材配备标准-通过id查询")
	@GetMapping(value = "/queryById")
	public Result<EduPrimaryArtEquipment> queryById(@RequestParam(name="id",required=true) String id) {
		EduPrimaryArtEquipment eduPrimaryArtEquipment = eduPrimaryArtEquipmentService.getById(id);
		if(eduPrimaryArtEquipment==null) {
			return Result.error("未找到对应数据");
		}
		return Result.OK(eduPrimaryArtEquipment);
	}

    /**
    * 导出excel
    *
    * @param request
    * @param eduPrimaryArtEquipment
    */
    //@RequiresPermissions("primaryartequipment:edu_primary_art_equipment:exportXls")
    @RequestMapping(value = "/exportXls")
    public ModelAndView exportXls(HttpServletRequest request, EduPrimaryArtEquipment eduPrimaryArtEquipment) {
        return super.exportXls(request, eduPrimaryArtEquipment, EduPrimaryArtEquipment.class, "小学美术教学器材配备标准");
    }

    /**
      * 通过excel导入数据
    *
    * @param request
    * @param response
    * @return
    */
    //@RequiresPermissions("primaryartequipment:edu_primary_art_equipment:importExcel")
    @RequestMapping(value = "/importExcel", method = RequestMethod.POST)
    public Result<?> importExcel(HttpServletRequest request, HttpServletResponse response) {
        return super.importExcel(request, response, EduPrimaryArtEquipment.class);
    }

}
