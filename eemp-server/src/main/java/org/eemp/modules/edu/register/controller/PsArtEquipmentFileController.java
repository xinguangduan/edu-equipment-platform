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
import org.eemp.modules.edu.register.entity.PsArtEquipmentFile;
import org.eemp.modules.edu.register.service.IPsArtEquipmentFileService;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

/**
 * @Description: 小学美术教学装备配置文件
 * @Date:   2023-11-20
 * @Version: V1.0
 */
@Api(tags="小学美术教学装备配置文件")
@RestController
@RequestMapping("/org.eemp.modules.edu.register/psArtEquipmentFile")
@Slf4j
@RequiredArgsConstructor
public class PsArtEquipmentFileController extends BaseController<PsArtEquipmentFile, IPsArtEquipmentFileService> {
	private final IPsArtEquipmentFileService psArtEquipmentFileService;
	private final IFillingControlService fillingControlService;

	/**
	 * 分页列表查询
	 *
	 * @param psArtEquipmentFile
	 * @param pageNo
	 * @param pageSize
	 * @param req
	 * @return
	 */
	//@AutoLog(value = "小学美术教学装备配置文件-分页列表查询")
	@ApiOperation(value="小学美术教学装备配置文件-分页列表查询", notes="小学美术教学装备配置文件-分页列表查询")
	@GetMapping(value = "/list")
	@PermissionData(pageComponent = "edu/register/PsArtEquipmentFileList")
	public Result<IPage<PsArtEquipmentFile>> queryPageList(PsArtEquipmentFile psArtEquipmentFile,
								   @RequestParam(name="pageNo", defaultValue="1") Integer pageNo,
								   @RequestParam(name="pageSize", defaultValue="10") Integer pageSize,
								   HttpServletRequest req) {
		QueryWrapper<PsArtEquipmentFile> queryWrapper = QueryGenerator.initQueryWrapper(psArtEquipmentFile, req.getParameterMap());
		Page<PsArtEquipmentFile> page = new Page<PsArtEquipmentFile>(pageNo, pageSize);
		IPage<PsArtEquipmentFile> pageList = psArtEquipmentFileService.page(page, queryWrapper);
		return Result.OK(pageList);
	}
	
	/**
	 *   添加
	 *
	 * @param psArtEquipmentFile
	 * @return
	 */
	@AutoLog(value = "小学美术教学装备配置文件-添加")
	@ApiOperation(value="小学美术教学装备配置文件-添加", notes="小学美术教学装备配置文件-添加")
	@RequiresPermissions("edu.register:ps_art_equipment_file:add")
	@PostMapping(value = "/add")
	public Result<String> add(@RequestBody PsArtEquipmentFile psArtEquipmentFile) {
		psArtEquipmentFileService.save(psArtEquipmentFile);
		boolean rst = fillingControlService.updateFillingControlAfterNewData(
				psArtEquipmentFile.getIdentificationCode(),
				"ps_art_equipment_file",
				psArtEquipmentFile.getId()
		);
		return Result.OK("添加成功！");
	}
	
	/**
	 *  编辑
	 *
	 * @param psArtEquipmentFile
	 * @return
	 */
	@AutoLog(value = "小学美术教学装备配置文件-编辑")
	@ApiOperation(value="小学美术教学装备配置文件-编辑", notes="小学美术教学装备配置文件-编辑")
	@RequiresPermissions("edu.register:ps_art_equipment_file:edit")
	@RequestMapping(value = "/edit", method = {RequestMethod.PUT,RequestMethod.POST})
	public Result<String> edit(@RequestBody PsArtEquipmentFile psArtEquipmentFile) {
		psArtEquipmentFileService.updateById(psArtEquipmentFile);
		return Result.OK("编辑成功!");
	}
	
	/**
	 *   通过id删除
	 *
	 * @param id
	 * @return
	 */
	@AutoLog(value = "小学美术教学装备配置文件-通过id删除")
	@ApiOperation(value="小学美术教学装备配置文件-通过id删除", notes="小学美术教学装备配置文件-通过id删除")
	@RequiresPermissions("edu.register:ps_art_equipment_file:delete")
	@DeleteMapping(value = "/delete")
	public Result<String> delete(@RequestParam(name="id",required=true) String id) {
		PsArtEquipmentFile rec = psArtEquipmentFileService.getById(id);
		psArtEquipmentFileService.removeById(id);
		boolean rst = fillingControlService.updateFillingControlAfterDeleteData(
				rec.getIdentificationCode(),
				"ps_art_equipment_file",
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
	@AutoLog(value = "小学美术教学装备配置文件-批量删除")
	@ApiOperation(value="小学美术教学装备配置文件-批量删除", notes="小学美术教学装备配置文件-批量删除")
	@RequiresPermissions("edu.register:ps_art_equipment_file:deleteBatch")
	@DeleteMapping(value = "/deleteBatch")
	public Result<String> deleteBatch(@RequestParam(name="ids",required=true) String ids) {
		this.psArtEquipmentFileService.removeByIds(Arrays.asList(ids.split(",")));
		return Result.OK("批量删除成功!");
	}
	
	/**
	 * 通过id查询
	 *
	 * @param id
	 * @return
	 */
	//@AutoLog(value = "小学美术教学装备配置文件-通过id查询")
	@ApiOperation(value="小学美术教学装备配置文件-通过id查询", notes="小学美术教学装备配置文件-通过id查询")
	@GetMapping(value = "/queryById")
	public Result<PsArtEquipmentFile> queryById(@RequestParam(name="id",required=true) String id) {
		PsArtEquipmentFile psArtEquipmentFile = psArtEquipmentFileService.getById(id);
		if(psArtEquipmentFile==null) {
			return Result.error("未找到对应数据");
		}
		return Result.OK(psArtEquipmentFile);
	}

    /**
    * 导出excel
    *
    * @param request
    * @param psArtEquipmentFile
    */
    @RequiresPermissions("edu.register:ps_art_equipment_file:exportXls")
    @RequestMapping(value = "/exportXls")
	@PermissionData(pageComponent = "edu/register/PsArtEquipmentFileList")
    public ModelAndView exportXls(HttpServletRequest request, PsArtEquipmentFile psArtEquipmentFile) {
        return super.exportXls(request, psArtEquipmentFile, PsArtEquipmentFile.class, "小学美术教学装备配置文件");
    }

    /**
      * 通过excel导入数据
    *
    * @param request
    * @param response
    * @return
    */
    @RequiresPermissions("edu.register:ps_art_equipment_file:importExcel")
    @RequestMapping(value = "/importExcel", method = RequestMethod.POST)
    public Result<?> importExcel(HttpServletRequest request, HttpServletResponse response) {
        return super.importExcel(request, response, PsArtEquipmentFile.class);
    }

	@RequiresPermissions("edu.register:ps_art_equipment_file:report")
	@PostMapping(value = "/report")
	public Result<String> report(@RequestParam(name="identificationCode", required=true) String identificationCode, @RequestParam(name="id", required=true) String id) {
		psArtEquipmentFileService.changeReported(id, 1);
		boolean rst = fillingControlService.updateFillingControlAfterReported(
				identificationCode,
				"ps_art_equipment_file"
		);
		return Result.OK("上报成功!");
	}

	@RequiresPermissions("edu.register:ps_art_equipment_file:revoke")
	@PostMapping(value = "/revoke")
	public Result<String> revoke(@RequestParam(name="ids", required=true) String ids) {
		for (String id: ids.split(",")) {
			PsArtEquipmentFile rec = psArtEquipmentFileService.getById(id);
			psArtEquipmentFileService.changeReported(id, 0);
			boolean rst = fillingControlService.updateFillingControlAfterRevoked(
					rec.getIdentificationCode(),
					"ps_art_equipment_file"
			);
		}
		return Result.OK("退回成功!");
	}

}
