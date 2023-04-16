package org.eemp.modules.edu.eduequipmentregister.controller;

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
import org.eemp.modules.edu.eduequipmentregister.entity.EduEquipmentRegisterInfo;
import org.eemp.modules.edu.eduequipmentregister.service.IEduEquipmentRegisterInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

 /**
 * @Description: 小学教学仪器设备登记册
 * @Author: jeecg-boot
 * @Date:   2023-04-16
 * @Version: V1.0
 */
@Api(tags="小学教学仪器设备登记册")
@RestController
@RequestMapping("/edu/eduequipmentregister/eduEquipmentRegisterInfo")
@Slf4j
public class EduEquipmentRegisterInfoController extends JeecgController<EduEquipmentRegisterInfo, IEduEquipmentRegisterInfoService> {
	@Autowired
	private IEduEquipmentRegisterInfoService eduEquipmentRegisterInfoService;
	
	/**
	 * 分页列表查询
	 *
	 * @param eduEquipmentRegisterInfo
	 * @param pageNo
	 * @param pageSize
	 * @param req
	 * @return
	 */
	//@AutoLog(value = "小学教学仪器设备登记册-分页列表查询")
	@ApiOperation(value="小学教学仪器设备登记册-分页列表查询", notes="小学教学仪器设备登记册-分页列表查询")
	@GetMapping(value = "/list")
	public Result<IPage<EduEquipmentRegisterInfo>> queryPageList(EduEquipmentRegisterInfo eduEquipmentRegisterInfo,
								   @RequestParam(name="pageNo", defaultValue="1") Integer pageNo,
								   @RequestParam(name="pageSize", defaultValue="10") Integer pageSize,
								   HttpServletRequest req) {
		QueryWrapper<EduEquipmentRegisterInfo> queryWrapper = QueryGenerator.initQueryWrapper(eduEquipmentRegisterInfo, req.getParameterMap());
		Page<EduEquipmentRegisterInfo> page = new Page<EduEquipmentRegisterInfo>(pageNo, pageSize);
		IPage<EduEquipmentRegisterInfo> pageList = eduEquipmentRegisterInfoService.page(page, queryWrapper);
		return Result.OK(pageList);
	}
	
	/**
	 *   添加
	 *
	 * @param eduEquipmentRegisterInfo
	 * @return
	 */
	@AutoLog(value = "小学教学仪器设备登记册-添加")
	@ApiOperation(value="小学教学仪器设备登记册-添加", notes="小学教学仪器设备登记册-添加")
	@RequiresPermissions("edu.eduequipmentregister:edu_equipment_register_info:add")
	@PostMapping(value = "/add")
	public Result<String> add(@RequestBody EduEquipmentRegisterInfo eduEquipmentRegisterInfo) {
		eduEquipmentRegisterInfoService.save(eduEquipmentRegisterInfo);
		return Result.OK("添加成功！");
	}
	
	/**
	 *  编辑
	 *
	 * @param eduEquipmentRegisterInfo
	 * @return
	 */
	@AutoLog(value = "小学教学仪器设备登记册-编辑")
	@ApiOperation(value="小学教学仪器设备登记册-编辑", notes="小学教学仪器设备登记册-编辑")
	@RequiresPermissions("edu.eduequipmentregister:edu_equipment_register_info:edit")
	@RequestMapping(value = "/edit", method = {RequestMethod.PUT,RequestMethod.POST})
	public Result<String> edit(@RequestBody EduEquipmentRegisterInfo eduEquipmentRegisterInfo) {
		eduEquipmentRegisterInfoService.updateById(eduEquipmentRegisterInfo);
		return Result.OK("编辑成功!");
	}
	
	/**
	 *   通过id删除
	 *
	 * @param id
	 * @return
	 */
	@AutoLog(value = "小学教学仪器设备登记册-通过id删除")
	@ApiOperation(value="小学教学仪器设备登记册-通过id删除", notes="小学教学仪器设备登记册-通过id删除")
	@RequiresPermissions("edu.eduequipmentregister:edu_equipment_register_info:delete")
	@DeleteMapping(value = "/delete")
	public Result<String> delete(@RequestParam(name="id",required=true) String id) {
		eduEquipmentRegisterInfoService.removeById(id);
		return Result.OK("删除成功!");
	}
	
	/**
	 *  批量删除
	 *
	 * @param ids
	 * @return
	 */
	@AutoLog(value = "小学教学仪器设备登记册-批量删除")
	@ApiOperation(value="小学教学仪器设备登记册-批量删除", notes="小学教学仪器设备登记册-批量删除")
	@RequiresPermissions("edu.eduequipmentregister:edu_equipment_register_info:deleteBatch")
	@DeleteMapping(value = "/deleteBatch")
	public Result<String> deleteBatch(@RequestParam(name="ids",required=true) String ids) {
		this.eduEquipmentRegisterInfoService.removeByIds(Arrays.asList(ids.split(",")));
		return Result.OK("批量删除成功!");
	}
	
	/**
	 * 通过id查询
	 *
	 * @param id
	 * @return
	 */
	//@AutoLog(value = "小学教学仪器设备登记册-通过id查询")
	@ApiOperation(value="小学教学仪器设备登记册-通过id查询", notes="小学教学仪器设备登记册-通过id查询")
	@GetMapping(value = "/queryById")
	public Result<EduEquipmentRegisterInfo> queryById(@RequestParam(name="id",required=true) String id) {
		EduEquipmentRegisterInfo eduEquipmentRegisterInfo = eduEquipmentRegisterInfoService.getById(id);
		if(eduEquipmentRegisterInfo==null) {
			return Result.error("未找到对应数据");
		}
		return Result.OK(eduEquipmentRegisterInfo);
	}

    /**
    * 导出excel
    *
    * @param request
    * @param eduEquipmentRegisterInfo
    */
    @RequiresPermissions("edu.eduequipmentregister:edu_equipment_register_info:exportXls")
    @RequestMapping(value = "/exportXls")
    public ModelAndView exportXls(HttpServletRequest request, EduEquipmentRegisterInfo eduEquipmentRegisterInfo) {
        return super.exportXls(request, eduEquipmentRegisterInfo, EduEquipmentRegisterInfo.class, "小学教学仪器设备登记册");
    }

    /**
      * 通过excel导入数据
    *
    * @param request
    * @param response
    * @return
    */
    @RequiresPermissions("edu.eduequipmentregister:edu_equipment_register_info:importExcel")
    @RequestMapping(value = "/importExcel", method = RequestMethod.POST)
    public Result<?> importExcel(HttpServletRequest request, HttpServletResponse response) {
        return super.importExcel(request, response, EduEquipmentRegisterInfo.class);
    }

}
