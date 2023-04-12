package org.eemp.modules.equipmentregister.controller;

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
import org.eemp.modules.equipmentregister.entity.EduEquipmentRegisterBasicInfo;
import org.eemp.modules.equipmentregister.service.IEduEquipmentRegisterBasicInfoService;

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
 * @Description: 小学设备登记信息
 * @Author: jeecg-boot
 * @Date:   2023-04-12
 * @Version: V1.0
 */
@Api(tags="小学设备登记信息")
@RestController
@RequestMapping("/equipmentregister/eduEquipmentRegisterBasicInfo")
@Slf4j
public class EduEquipmentRegisterBasicInfoController extends JeecgController<EduEquipmentRegisterBasicInfo, IEduEquipmentRegisterBasicInfoService> {
	@Autowired
	private IEduEquipmentRegisterBasicInfoService eduEquipmentRegisterBasicInfoService;
	
	/**
	 * 分页列表查询
	 *
	 * @param eduEquipmentRegisterBasicInfo
	 * @param pageNo
	 * @param pageSize
	 * @param req
	 * @return
	 */
	//@AutoLog(value = "小学设备登记信息-分页列表查询")
	@ApiOperation(value="小学设备登记信息-分页列表查询", notes="小学设备登记信息-分页列表查询")
	@GetMapping(value = "/list")
	public Result<IPage<EduEquipmentRegisterBasicInfo>> queryPageList(EduEquipmentRegisterBasicInfo eduEquipmentRegisterBasicInfo,
								   @RequestParam(name="pageNo", defaultValue="1") Integer pageNo,
								   @RequestParam(name="pageSize", defaultValue="10") Integer pageSize,
								   HttpServletRequest req) {
		QueryWrapper<EduEquipmentRegisterBasicInfo> queryWrapper = QueryGenerator.initQueryWrapper(eduEquipmentRegisterBasicInfo, req.getParameterMap());
		Page<EduEquipmentRegisterBasicInfo> page = new Page<EduEquipmentRegisterBasicInfo>(pageNo, pageSize);
		IPage<EduEquipmentRegisterBasicInfo> pageList = eduEquipmentRegisterBasicInfoService.page(page, queryWrapper);
		return Result.OK(pageList);
	}
	
	/**
	 *   添加
	 *
	 * @param eduEquipmentRegisterBasicInfo
	 * @return
	 */
	@AutoLog(value = "小学设备登记信息-添加")
	@ApiOperation(value="小学设备登记信息-添加", notes="小学设备登记信息-添加")
	@RequiresPermissions("equipmentregister:edu_equipment_register_basic_info:add")
	@PostMapping(value = "/add")
	public Result<String> add(@RequestBody EduEquipmentRegisterBasicInfo eduEquipmentRegisterBasicInfo) {
		eduEquipmentRegisterBasicInfoService.save(eduEquipmentRegisterBasicInfo);
		return Result.OK("添加成功！");
	}
	
	/**
	 *  编辑
	 *
	 * @param eduEquipmentRegisterBasicInfo
	 * @return
	 */
	@AutoLog(value = "小学设备登记信息-编辑")
	@ApiOperation(value="小学设备登记信息-编辑", notes="小学设备登记信息-编辑")
	@RequiresPermissions("equipmentregister:edu_equipment_register_basic_info:edit")
	@RequestMapping(value = "/edit", method = {RequestMethod.PUT,RequestMethod.POST})
	public Result<String> edit(@RequestBody EduEquipmentRegisterBasicInfo eduEquipmentRegisterBasicInfo) {
		eduEquipmentRegisterBasicInfoService.updateById(eduEquipmentRegisterBasicInfo);
		return Result.OK("编辑成功!");
	}
	
	/**
	 *   通过id删除
	 *
	 * @param id
	 * @return
	 */
	@AutoLog(value = "小学设备登记信息-通过id删除")
	@ApiOperation(value="小学设备登记信息-通过id删除", notes="小学设备登记信息-通过id删除")
	@RequiresPermissions("equipmentregister:edu_equipment_register_basic_info:delete")
	@DeleteMapping(value = "/delete")
	public Result<String> delete(@RequestParam(name="id",required=true) String id) {
		eduEquipmentRegisterBasicInfoService.removeById(id);
		return Result.OK("删除成功!");
	}
	
	/**
	 *  批量删除
	 *
	 * @param ids
	 * @return
	 */
	@AutoLog(value = "小学设备登记信息-批量删除")
	@ApiOperation(value="小学设备登记信息-批量删除", notes="小学设备登记信息-批量删除")
	@RequiresPermissions("equipmentregister:edu_equipment_register_basic_info:deleteBatch")
	@DeleteMapping(value = "/deleteBatch")
	public Result<String> deleteBatch(@RequestParam(name="ids",required=true) String ids) {
		this.eduEquipmentRegisterBasicInfoService.removeByIds(Arrays.asList(ids.split(",")));
		return Result.OK("批量删除成功!");
	}
	
	/**
	 * 通过id查询
	 *
	 * @param id
	 * @return
	 */
	//@AutoLog(value = "小学设备登记信息-通过id查询")
	@ApiOperation(value="小学设备登记信息-通过id查询", notes="小学设备登记信息-通过id查询")
	@GetMapping(value = "/queryById")
	public Result<EduEquipmentRegisterBasicInfo> queryById(@RequestParam(name="id",required=true) String id) {
		EduEquipmentRegisterBasicInfo eduEquipmentRegisterBasicInfo = eduEquipmentRegisterBasicInfoService.getById(id);
		if(eduEquipmentRegisterBasicInfo==null) {
			return Result.error("未找到对应数据");
		}
		return Result.OK(eduEquipmentRegisterBasicInfo);
	}

    /**
    * 导出excel
    *
    * @param request
    * @param eduEquipmentRegisterBasicInfo
    */
    @RequiresPermissions("equipmentregister:edu_equipment_register_basic_info:exportXls")
    @RequestMapping(value = "/exportXls")
    public ModelAndView exportXls(HttpServletRequest request, EduEquipmentRegisterBasicInfo eduEquipmentRegisterBasicInfo) {
        return super.exportXls(request, eduEquipmentRegisterBasicInfo, EduEquipmentRegisterBasicInfo.class, "小学设备登记信息");
    }

    /**
      * 通过excel导入数据
    *
    * @param request
    * @param response
    * @return
    */
    @RequiresPermissions("equipmentregister:edu_equipment_register_basic_info:importExcel")
    @RequestMapping(value = "/importExcel", method = RequestMethod.POST)
    public Result<?> importExcel(HttpServletRequest request, HttpServletResponse response) {
        return super.importExcel(request, response, EduEquipmentRegisterBasicInfo.class);
    }

}
