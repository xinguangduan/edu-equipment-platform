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
import org.eemp.modules.edu.register.entity.PsScientificEquipmentFile;
import org.eemp.modules.edu.register.service.IPsScientificEquipmentFileService;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

/**
 * @Description: 小学科学教学装备配置文件
 * @Date:   2023-11-20
 * @Version: V1.0
 */
@Api(tags="小学科学教学装备配置文件")
@RestController
@RequestMapping("/org.eemp.modules.edu.register/psScientificEquipmentFile")
@Slf4j
@RequiredArgsConstructor
public class PsScientificEquipmentFileController extends BaseController<PsScientificEquipmentFile, IPsScientificEquipmentFileService> {
	private final IPsScientificEquipmentFileService psScientificEquipmentFileService;
	 private final IFillingControlService fillingControlService;

	/**
	 * 分页列表查询
	 *
	 * @param psScientificEquipmentFile
	 * @param pageNo
	 * @param pageSize
	 * @param req
	 * @return
	 */
	//@AutoLog(value = "小学科学教学装备配置文件-分页列表查询")
	@ApiOperation(value="小学科学教学装备配置文件-分页列表查询", notes="小学科学教学装备配置文件-分页列表查询")
	@GetMapping(value = "/list")
	@PermissionData(pageComponent = "edu/register/PsScientificEquipmentFileList")
	public Result<IPage<PsScientificEquipmentFile>> queryPageList(PsScientificEquipmentFile psScientificEquipmentFile,
								   @RequestParam(name="pageNo", defaultValue="1") Integer pageNo,
								   @RequestParam(name="pageSize", defaultValue="10") Integer pageSize,
								   HttpServletRequest req) {
		QueryWrapper<PsScientificEquipmentFile> queryWrapper = QueryGenerator.initQueryWrapper(psScientificEquipmentFile, req.getParameterMap());
		Page<PsScientificEquipmentFile> page = new Page<PsScientificEquipmentFile>(pageNo, pageSize);
		IPage<PsScientificEquipmentFile> pageList = psScientificEquipmentFileService.page(page, queryWrapper);
		return Result.OK(pageList);
	}
	
	/**
	 *   添加
	 *
	 * @param psScientificEquipmentFile
	 * @return
	 */
	@AutoLog(value = "小学科学教学装备配置文件-添加")
	@ApiOperation(value="小学科学教学装备配置文件-添加", notes="小学科学教学装备配置文件-添加")
	@RequiresPermissions("edu.register:ps_scientific_equipment_file:add")
	@PostMapping(value = "/add")
	public Result<String> add(@RequestBody PsScientificEquipmentFile psScientificEquipmentFile) {
		psScientificEquipmentFileService.save(psScientificEquipmentFile);
		boolean rst = fillingControlService.updateFillingControlAfterNewData(
				psScientificEquipmentFile.getIdentificationCode(),
				"ps_scientific_equipment_file",
				psScientificEquipmentFile.getId()
		);
		return Result.OK("添加成功！");
	}
	
	/**
	 *  编辑
	 *
	 * @param psScientificEquipmentFile
	 * @return
	 */
	@AutoLog(value = "小学科学教学装备配置文件-编辑")
	@ApiOperation(value="小学科学教学装备配置文件-编辑", notes="小学科学教学装备配置文件-编辑")
	@RequiresPermissions("edu.register:ps_scientific_equipment_file:edit")
	@RequestMapping(value = "/edit", method = {RequestMethod.PUT,RequestMethod.POST})
	public Result<String> edit(@RequestBody PsScientificEquipmentFile psScientificEquipmentFile) {
		psScientificEquipmentFileService.updateById(psScientificEquipmentFile);
		return Result.OK("编辑成功!");
	}
	
	/**
	 *   通过id删除
	 *
	 * @param id
	 * @return
	 */
	@AutoLog(value = "小学科学教学装备配置文件-通过id删除")
	@ApiOperation(value="小学科学教学装备配置文件-通过id删除", notes="小学科学教学装备配置文件-通过id删除")
	@RequiresPermissions("edu.register:ps_scientific_equipment_file:delete")
	@DeleteMapping(value = "/delete")
	public Result<String> delete(@RequestParam(name="id",required=true) String id) {
		PsScientificEquipmentFile rec = psScientificEquipmentFileService.getById(id);
		psScientificEquipmentFileService.removeById(id);
		boolean rst = fillingControlService.updateFillingControlAfterDeleteData(
				rec.getIdentificationCode(),
				"ps_scientific_equipment_file",
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
	@AutoLog(value = "小学科学教学装备配置文件-批量删除")
	@ApiOperation(value="小学科学教学装备配置文件-批量删除", notes="小学科学教学装备配置文件-批量删除")
	@RequiresPermissions("edu.register:ps_scientific_equipment_file:deleteBatch")
	@DeleteMapping(value = "/deleteBatch")
	public Result<String> deleteBatch(@RequestParam(name="ids",required=true) String ids) {
		this.psScientificEquipmentFileService.removeByIds(Arrays.asList(ids.split(",")));
		return Result.OK("批量删除成功!");
	}
	
	/**
	 * 通过id查询
	 *
	 * @param id
	 * @return
	 */
	//@AutoLog(value = "小学科学教学装备配置文件-通过id查询")
	@ApiOperation(value="小学科学教学装备配置文件-通过id查询", notes="小学科学教学装备配置文件-通过id查询")
	@GetMapping(value = "/queryById")
	public Result<PsScientificEquipmentFile> queryById(@RequestParam(name="id",required=true) String id) {
		PsScientificEquipmentFile psScientificEquipmentFile = psScientificEquipmentFileService.getById(id);
		if(psScientificEquipmentFile==null) {
			return Result.error("未找到对应数据");
		}
		return Result.OK(psScientificEquipmentFile);
	}

    /**
    * 导出excel
    *
    * @param request
    * @param psScientificEquipmentFile
    */
    @RequiresPermissions("edu.register:ps_scientific_equipment_file:exportXls")
    @RequestMapping(value = "/exportXls")
	@PermissionData(pageComponent = "edu/register/PsScientificEquipmentFileList")
    public ModelAndView exportXls(HttpServletRequest request, PsScientificEquipmentFile psScientificEquipmentFile) {
        return super.exportXls(request, psScientificEquipmentFile, PsScientificEquipmentFile.class, "小学科学教学装备配置文件");
    }

    /**
      * 通过excel导入数据
    *
    * @param request
    * @param response
    * @return
    */
    @RequiresPermissions("edu.register:ps_scientific_equipment_file:importExcel")
    @RequestMapping(value = "/importExcel", method = RequestMethod.POST)
    public Result<?> importExcel(HttpServletRequest request, HttpServletResponse response) {
        return super.importExcel(request, response, PsScientificEquipmentFile.class);
    }

	@RequiresPermissions("edu.register:ps_scientific_equipment_file:report")
	@PostMapping(value = "/report")
	public Result<String> report(@RequestParam(name="identificationCode", required=true) String identificationCode, @RequestParam(name="id", required=true) String id) {
		psScientificEquipmentFileService.changeReported(id, 1);
		boolean rst = fillingControlService.updateFillingControlAfterReported(
			identificationCode,
			"ps_scientific_equipment_file"
		);
		return Result.OK("上报成功!");
	}

	@RequiresPermissions("edu.register:ps_scientific_equipment_file:revoke")
	@PostMapping(value = "/revoke")
	public Result<String> revoke(@RequestParam(name="ids", required=true) String ids) {
		for (String id: ids.split(",")) {
			PsScientificEquipmentFile rec = psScientificEquipmentFileService.getById(id);
			psScientificEquipmentFileService.changeReported(id, 0);
			boolean rst = fillingControlService.updateFillingControlAfterRevoked(
				rec.getIdentificationCode(),
				"ps_scientific_equipment_file"
			);
		}
		return Result.OK("退回成功!");
	}

 }
