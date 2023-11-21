package org.eemp.modules.edu.register.controller;

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
import org.eemp.common.util.oConvertUtils;
import org.eemp.modules.edu.foudation.service.IFillingControlService;
import org.eemp.modules.edu.register.entity.JsChemistryEquipmentFile;
import org.eemp.modules.edu.register.service.IJsChemistryEquipmentFileService;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

/**
 * @Description: 初中化学教学装备配置文件
 * @Date:   2023-11-20
 * @Version: V1.0
 */
@Api(tags="初中化学教学装备配置文件")
@RestController
@RequestMapping("/org.eemp.modules.edu.register/jsChemistryEquipmentFile")
@Slf4j
@RequiredArgsConstructor
public class JsChemistryEquipmentFileController extends BaseController<JsChemistryEquipmentFile, IJsChemistryEquipmentFileService> {
	private final IJsChemistryEquipmentFileService jsChemistryEquipmentFileService;
	private final IFillingControlService fillingControlService;

	/**
	 * 分页列表查询
	 *
	 * @param jsChemistryEquipmentFile
	 * @param pageNo
	 * @param pageSize
	 * @param req
	 * @return
	 */
	//@AutoLog(value = "初中化学教学装备配置文件-分页列表查询")
	@ApiOperation(value="初中化学教学装备配置文件-分页列表查询", notes="初中化学教学装备配置文件-分页列表查询")
	@GetMapping(value = "/list")
	@PermissionData(pageComponent = "edu/register/JsChemistryEquipmentFileList")
	public Result<IPage<JsChemistryEquipmentFile>> queryPageList(JsChemistryEquipmentFile jsChemistryEquipmentFile,
								   @RequestParam(name="pageNo", defaultValue="1") Integer pageNo,
								   @RequestParam(name="pageSize", defaultValue="10") Integer pageSize,
								   HttpServletRequest req) {
		QueryWrapper<JsChemistryEquipmentFile> queryWrapper = QueryGenerator.initQueryWrapper(jsChemistryEquipmentFile, req.getParameterMap());
		Page<JsChemistryEquipmentFile> page = new Page<JsChemistryEquipmentFile>(pageNo, pageSize);
		IPage<JsChemistryEquipmentFile> pageList = jsChemistryEquipmentFileService.page(page, queryWrapper);
		return Result.OK(pageList);
	}
	
	/**
	 *   添加
	 *
	 * @param jsChemistryEquipmentFile
	 * @return
	 */
	@AutoLog(value = "初中化学教学装备配置文件-添加")
	@ApiOperation(value="初中化学教学装备配置文件-添加", notes="初中化学教学装备配置文件-添加")
	@RequiresPermissions("edu.register:js_chemistry_equipment_file:add")
	@PostMapping(value = "/add")
	public Result<String> add(@RequestBody JsChemistryEquipmentFile jsChemistryEquipmentFile) {
		jsChemistryEquipmentFileService.save(jsChemistryEquipmentFile);
		boolean rst = fillingControlService.updateFillingControlAfterNewData(
				jsChemistryEquipmentFile.getIdentificationCode(),
				"js_chemistry_equipment_file",
				jsChemistryEquipmentFile.getId()
		);
		return Result.OK("添加成功！");
	}
	
	/**
	 *  编辑
	 *
	 * @param jsChemistryEquipmentFile
	 * @return
	 */
	@AutoLog(value = "初中化学教学装备配置文件-编辑")
	@ApiOperation(value="初中化学教学装备配置文件-编辑", notes="初中化学教学装备配置文件-编辑")
	@RequiresPermissions("edu.register:js_chemistry_equipment_file:edit")
	@RequestMapping(value = "/edit", method = {RequestMethod.PUT,RequestMethod.POST})
	public Result<String> edit(@RequestBody JsChemistryEquipmentFile jsChemistryEquipmentFile) {
		jsChemistryEquipmentFileService.updateById(jsChemistryEquipmentFile);
		return Result.OK("编辑成功!");
	}
	
	/**
	 *   通过id删除
	 *
	 * @param id
	 * @return
	 */
	@AutoLog(value = "初中化学教学装备配置文件-通过id删除")
	@ApiOperation(value="初中化学教学装备配置文件-通过id删除", notes="初中化学教学装备配置文件-通过id删除")
	@RequiresPermissions("edu.register:js_chemistry_equipment_file:delete")
	@DeleteMapping(value = "/delete")
	public Result<String> delete(@RequestParam(name="id",required=true) String id) {
		JsChemistryEquipmentFile rec = jsChemistryEquipmentFileService.getById(id);
		jsChemistryEquipmentFileService.removeById(id);
		boolean rst = fillingControlService.updateFillingControlAfterDeleteData(
				rec.getIdentificationCode(),
				"js_chemistry_equipment_file",
				id
		);
		return Result.OK("删除成功!");
	}
	
	/**
	 *  批量删除
	 *
	 * @param ids
	 * @return
	 */
	@AutoLog(value = "初中化学教学装备配置文件-批量删除")
	@ApiOperation(value="初中化学教学装备配置文件-批量删除", notes="初中化学教学装备配置文件-批量删除")
	@RequiresPermissions("edu.register:js_chemistry_equipment_file:deleteBatch")
	@DeleteMapping(value = "/deleteBatch")
	public Result<String> deleteBatch(@RequestParam(name="ids",required=true) String ids) {
		this.jsChemistryEquipmentFileService.removeByIds(Arrays.asList(ids.split(",")));
		return Result.OK("批量删除成功!");
	}
	
	/**
	 * 通过id查询
	 *
	 * @param id
	 * @return
	 */
	//@AutoLog(value = "初中化学教学装备配置文件-通过id查询")
	@ApiOperation(value="初中化学教学装备配置文件-通过id查询", notes="初中化学教学装备配置文件-通过id查询")
	@GetMapping(value = "/queryById")
	public Result<JsChemistryEquipmentFile> queryById(@RequestParam(name="id",required=true) String id) {
		JsChemistryEquipmentFile jsChemistryEquipmentFile = jsChemistryEquipmentFileService.getById(id);
		if(jsChemistryEquipmentFile==null) {
			return Result.error("未找到对应数据");
		}
		return Result.OK(jsChemistryEquipmentFile);
	}

    /**
    * 导出excel
    *
    * @param request
    * @param jsChemistryEquipmentFile
    */
    @RequiresPermissions("edu.register:js_chemistry_equipment_file:exportXls")
    @RequestMapping(value = "/exportXls")
	@PermissionData(pageComponent = "edu/register/JsChemistryEquipmentFileList")
    public ModelAndView exportXls(HttpServletRequest request, JsChemistryEquipmentFile jsChemistryEquipmentFile) {
        return super.exportXls(request, jsChemistryEquipmentFile, JsChemistryEquipmentFile.class, "初中化学教学装备配置文件");
    }

    /**
      * 通过excel导入数据
    *
    * @param request
    * @param response
    * @return
    */
    @RequiresPermissions("edu.register:js_chemistry_equipment_file:importExcel")
    @RequestMapping(value = "/importExcel", method = RequestMethod.POST)
    public Result<?> importExcel(HttpServletRequest request, HttpServletResponse response) {
        return super.importExcel(request, response, JsChemistryEquipmentFile.class);
    }

	@RequiresPermissions("edu.register:js_chemistry_equipment_file:report")
	@PostMapping(value = "/report")
	public Result<String> report(@RequestParam(name="identificationCode", required=true) String identificationCode, @RequestParam(name="id", required=true) String id) {
		jsChemistryEquipmentFileService.changeReported(id, 1);
		boolean rst = fillingControlService.updateFillingControlAfterReported(
				identificationCode,
				"js_chemistry_equipment_file"
		);
		return Result.OK("上报成功!");
	}

	@RequiresPermissions("edu.register:js_chemistry_equipment_file:revoke")
	@PostMapping(value = "/revoke")
	public Result<String> revoke(@RequestParam(name="ids", required=true) String ids) {
		for (String id: ids.split(",")) {
			JsChemistryEquipmentFile rec = jsChemistryEquipmentFileService.getById(id);
			jsChemistryEquipmentFileService.changeReported(id, 0);
			boolean rst = fillingControlService.updateFillingControlAfterRevoked(
					rec.getIdentificationCode(),
					"js_chemistry_equipment_file"
			);
		}
		return Result.OK("退回成功!");
	}

}
