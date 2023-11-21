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
import org.eemp.modules.edu.register.entity.JsSportEquipmentFile;
import org.eemp.modules.edu.register.service.IJsSportEquipmentFileService;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

/**
 * @Description: 初中体育教学装备配置文件
 * @Date:   2023-11-20
 * @Version: V1.0
 */
@Api(tags="初中体育教学装备配置文件")
@RestController
@RequestMapping("/org.eemp.modules.edu.register/jsSportEquipmentFile")
@Slf4j
@RequiredArgsConstructor
public class JsSportEquipmentFileController extends BaseController<JsSportEquipmentFile, IJsSportEquipmentFileService> {
	private final IJsSportEquipmentFileService jsSportEquipmentFileService;
	private final IFillingControlService fillingControlService;

	/**
	 * 分页列表查询
	 *
	 * @param jsSportEquipmentFile
	 * @param pageNo
	 * @param pageSize
	 * @param req
	 * @return
	 */
	//@AutoLog(value = "初中体育教学装备配置文件-分页列表查询")
	@ApiOperation(value="初中体育教学装备配置文件-分页列表查询", notes="初中体育教学装备配置文件-分页列表查询")
	@GetMapping(value = "/list")
	@PermissionData(pageComponent = "edu/register/JsSportEquipmentFileList")
	public Result<IPage<JsSportEquipmentFile>> queryPageList(JsSportEquipmentFile jsSportEquipmentFile,
								   @RequestParam(name="pageNo", defaultValue="1") Integer pageNo,
								   @RequestParam(name="pageSize", defaultValue="10") Integer pageSize,
								   HttpServletRequest req) {
		QueryWrapper<JsSportEquipmentFile> queryWrapper = QueryGenerator.initQueryWrapper(jsSportEquipmentFile, req.getParameterMap());
		Page<JsSportEquipmentFile> page = new Page<JsSportEquipmentFile>(pageNo, pageSize);
		IPage<JsSportEquipmentFile> pageList = jsSportEquipmentFileService.page(page, queryWrapper);
		return Result.OK(pageList);
	}
	
	/**
	 *   添加
	 *
	 * @param jsSportEquipmentFile
	 * @return
	 */
	@AutoLog(value = "初中体育教学装备配置文件-添加")
	@ApiOperation(value="初中体育教学装备配置文件-添加", notes="初中体育教学装备配置文件-添加")
	@RequiresPermissions("edu.register:js_sport_equipment_file:add")
	@PostMapping(value = "/add")
	public Result<String> add(@RequestBody JsSportEquipmentFile jsSportEquipmentFile) {
		jsSportEquipmentFileService.save(jsSportEquipmentFile);
		boolean rst = fillingControlService.updateFillingControlAfterNewData(
				jsSportEquipmentFile.getIdentificationCode(),
				"js_sport_equipment_file",
				jsSportEquipmentFile.getId()
		);
		return Result.OK("添加成功！");
	}
	
	/**
	 *  编辑
	 *
	 * @param jsSportEquipmentFile
	 * @return
	 */
	@AutoLog(value = "初中体育教学装备配置文件-编辑")
	@ApiOperation(value="初中体育教学装备配置文件-编辑", notes="初中体育教学装备配置文件-编辑")
	@RequiresPermissions("edu.register:js_sport_equipment_file:edit")
	@RequestMapping(value = "/edit", method = {RequestMethod.PUT,RequestMethod.POST})
	public Result<String> edit(@RequestBody JsSportEquipmentFile jsSportEquipmentFile) {
		jsSportEquipmentFileService.updateById(jsSportEquipmentFile);
		return Result.OK("编辑成功!");
	}
	
	/**
	 *   通过id删除
	 *
	 * @param id
	 * @return
	 */
	@AutoLog(value = "初中体育教学装备配置文件-通过id删除")
	@ApiOperation(value="初中体育教学装备配置文件-通过id删除", notes="初中体育教学装备配置文件-通过id删除")
	@RequiresPermissions("edu.register:js_sport_equipment_file:delete")
	@DeleteMapping(value = "/delete")
	public Result<String> delete(@RequestParam(name="id",required=true) String id) {
		JsSportEquipmentFile rec = jsSportEquipmentFileService.getById(id);
		jsSportEquipmentFileService.removeById(id);
		boolean rst = fillingControlService.updateFillingControlAfterDeleteData(
				rec.getIdentificationCode(),
				"js_sport_equipment_file",
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
	@AutoLog(value = "初中体育教学装备配置文件-批量删除")
	@ApiOperation(value="初中体育教学装备配置文件-批量删除", notes="初中体育教学装备配置文件-批量删除")
	@RequiresPermissions("edu.register:js_sport_equipment_file:deleteBatch")
	@DeleteMapping(value = "/deleteBatch")
	public Result<String> deleteBatch(@RequestParam(name="ids",required=true) String ids) {
		this.jsSportEquipmentFileService.removeByIds(Arrays.asList(ids.split(",")));
		return Result.OK("批量删除成功!");
	}
	
	/**
	 * 通过id查询
	 *
	 * @param id
	 * @return
	 */
	//@AutoLog(value = "初中体育教学装备配置文件-通过id查询")
	@ApiOperation(value="初中体育教学装备配置文件-通过id查询", notes="初中体育教学装备配置文件-通过id查询")
	@GetMapping(value = "/queryById")
	public Result<JsSportEquipmentFile> queryById(@RequestParam(name="id",required=true) String id) {
		JsSportEquipmentFile jsSportEquipmentFile = jsSportEquipmentFileService.getById(id);
		if(jsSportEquipmentFile==null) {
			return Result.error("未找到对应数据");
		}
		return Result.OK(jsSportEquipmentFile);
	}

    /**
    * 导出excel
    *
    * @param request
    * @param jsSportEquipmentFile
    */
    @RequiresPermissions("edu.register:js_sport_equipment_file:exportXls")
    @RequestMapping(value = "/exportXls")
	@PermissionData(pageComponent = "edu/register/JsSportEquipmentFileList")
    public ModelAndView exportXls(HttpServletRequest request, JsSportEquipmentFile jsSportEquipmentFile) {
        return super.exportXls(request, jsSportEquipmentFile, JsSportEquipmentFile.class, "初中体育教学装备配置文件");
    }

    /**
      * 通过excel导入数据
    *
    * @param request
    * @param response
    * @return
    */
    @RequiresPermissions("edu.register:js_sport_equipment_file:importExcel")
    @RequestMapping(value = "/importExcel", method = RequestMethod.POST)
    public Result<?> importExcel(HttpServletRequest request, HttpServletResponse response) {
        return super.importExcel(request, response, JsSportEquipmentFile.class);
    }

	@RequiresPermissions("edu.register:js_sport_equipment_file:report")
	@PostMapping(value = "/report")
	public Result<String> report(@RequestParam(name="identificationCode", required=true) String identificationCode, @RequestParam(name="id", required=true) String id) {
		jsSportEquipmentFileService.changeReported(id, 1);
		boolean rst = fillingControlService.updateFillingControlAfterReported(
				identificationCode,
				"js_sport_equipment_file"
		);
		return Result.OK("上报成功!");
	}

	@RequiresPermissions("edu.register:js_sport_equipment_file:revoke")
	@PostMapping(value = "/revoke")
	public Result<String> revoke(@RequestParam(name="ids", required=true) String ids) {
		for (String id: ids.split(",")) {
			JsSportEquipmentFile rec = jsSportEquipmentFileService.getById(id);
			jsSportEquipmentFileService.changeReported(id, 0);
			boolean rst = fillingControlService.updateFillingControlAfterRevoked(
					rec.getIdentificationCode(),
					"js_sport_equipment_file"
			);
		}
		return Result.OK("退回成功!");
	}

}
