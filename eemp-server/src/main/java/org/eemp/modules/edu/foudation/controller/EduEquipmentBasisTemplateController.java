package org.eemp.modules.edu.foudation.controller;

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
import org.eemp.common.system.base.controller.BaseController;
import org.eemp.common.system.query.QueryGenerator;
import org.eemp.modules.edu.foudation.entity.EduEquipmentBasisTemplate;
import org.eemp.modules.edu.foudation.service.IEduEquipmentBasisTemplateService;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

 /**
 * @Description: 教学装备配置标准模板
 * @Date:   2023-09-02
 * @Version: V1.0
 */
@Api(tags="教学装备配置标准模板")
@RestController
@RequestMapping("/org.eemp.modules.edu.foudation/eduEquipmentBasisTemplate")
@Slf4j
@RequiredArgsConstructor
public class EduEquipmentBasisTemplateController extends BaseController<EduEquipmentBasisTemplate, IEduEquipmentBasisTemplateService> {
	private final IEduEquipmentBasisTemplateService eduEquipmentBasisTemplateService;
	
	/**
	 * 分页列表查询
	 *
	 * @param eduEquipmentBasisTemplate
	 * @param pageNo
	 * @param pageSize
	 * @param req
	 * @return
	 */
	//@AutoLog(value = "教学装备配置标准模板-分页列表查询")
	@ApiOperation(value="教学装备配置标准模板-分页列表查询", notes="教学装备配置标准模板-分页列表查询")
	@GetMapping(value = "/list")
	public Result<IPage<EduEquipmentBasisTemplate>> queryPageList(EduEquipmentBasisTemplate eduEquipmentBasisTemplate,
								   @RequestParam(name="pageNo", defaultValue="1") Integer pageNo,
								   @RequestParam(name="pageSize", defaultValue="10") Integer pageSize,
								   HttpServletRequest req) {
		QueryWrapper<EduEquipmentBasisTemplate> queryWrapper = QueryGenerator.initQueryWrapper(eduEquipmentBasisTemplate, req.getParameterMap());
		Page<EduEquipmentBasisTemplate> page = new Page<EduEquipmentBasisTemplate>(pageNo, pageSize);
		IPage<EduEquipmentBasisTemplate> pageList = eduEquipmentBasisTemplateService.page(page, queryWrapper);
		return Result.OK(pageList);
	}
	
	/**
	 *   添加
	 *
	 * @param eduEquipmentBasisTemplate
	 * @return
	 */
	@AutoLog(value = "教学装备配置标准模板-添加")
	@ApiOperation(value="教学装备配置标准模板-添加", notes="教学装备配置标准模板-添加")
	@RequiresPermissions("edu.foudation:edu_equipment_basis_template:add")
	@PostMapping(value = "/add")
	public Result<String> add(@RequestBody EduEquipmentBasisTemplate eduEquipmentBasisTemplate) {
		eduEquipmentBasisTemplateService.save(eduEquipmentBasisTemplate);
		return Result.OK("添加成功！");
	}
	
	/**
	 *  编辑
	 *
	 * @param eduEquipmentBasisTemplate
	 * @return
	 */
	@AutoLog(value = "教学装备配置标准模板-编辑")
	@ApiOperation(value="教学装备配置标准模板-编辑", notes="教学装备配置标准模板-编辑")
	@RequiresPermissions("edu.foudation:edu_equipment_basis_template:edit")
	@RequestMapping(value = "/edit", method = {RequestMethod.PUT,RequestMethod.POST})
	public Result<String> edit(@RequestBody EduEquipmentBasisTemplate eduEquipmentBasisTemplate) {
		eduEquipmentBasisTemplateService.updateById(eduEquipmentBasisTemplate);
		return Result.OK("编辑成功!");
	}
	
	/**
	 *   通过id删除
	 *
	 * @param id
	 * @return
	 */
	@AutoLog(value = "教学装备配置标准模板-通过id删除")
	@ApiOperation(value="教学装备配置标准模板-通过id删除", notes="教学装备配置标准模板-通过id删除")
	@RequiresPermissions("edu.foudation:edu_equipment_basis_template:delete")
	@DeleteMapping(value = "/delete")
	public Result<String> delete(@RequestParam(name="id",required=true) String id) {
		eduEquipmentBasisTemplateService.removeById(id);
		return Result.OK("删除成功!");
	}
	
	/**
	 *  批量删除
	 *
	 * @param ids
	 * @return
	 */
	@AutoLog(value = "教学装备配置标准模板-批量删除")
	@ApiOperation(value="教学装备配置标准模板-批量删除", notes="教学装备配置标准模板-批量删除")
	@RequiresPermissions("edu.foudation:edu_equipment_basis_template:deleteBatch")
	@DeleteMapping(value = "/deleteBatch")
	public Result<String> deleteBatch(@RequestParam(name="ids",required=true) String ids) {
		this.eduEquipmentBasisTemplateService.removeByIds(Arrays.asList(ids.split(",")));
		return Result.OK("批量删除成功!");
	}
	
	/**
	 * 通过id查询
	 *
	 * @param id
	 * @return
	 */
	//@AutoLog(value = "教学装备配置标准模板-通过id查询")
	@ApiOperation(value="教学装备配置标准模板-通过id查询", notes="教学装备配置标准模板-通过id查询")
	@GetMapping(value = "/queryById")
	public Result<EduEquipmentBasisTemplate> queryById(@RequestParam(name="id",required=true) String id) {
		EduEquipmentBasisTemplate eduEquipmentBasisTemplate = eduEquipmentBasisTemplateService.getById(id);
		if(eduEquipmentBasisTemplate==null) {
			return Result.error("未找到对应数据");
		}
		return Result.OK(eduEquipmentBasisTemplate);
	}

    /**
    * 导出excel
    *
    * @param request
    * @param eduEquipmentBasisTemplate
    */
    @RequiresPermissions("edu.foudation:edu_equipment_basis_template:exportXls")
    @RequestMapping(value = "/exportXls")
    public ModelAndView exportXls(HttpServletRequest request, EduEquipmentBasisTemplate eduEquipmentBasisTemplate) {
        return super.exportXls(request, eduEquipmentBasisTemplate, EduEquipmentBasisTemplate.class, "教学装备配置标准模板");
    }

    /**
      * 通过excel导入数据
    *
    * @param request
    * @param response
    * @return
    */
    @RequiresPermissions("edu.foudation:edu_equipment_basis_template:importExcel")
    @RequestMapping(value = "/importExcel", method = RequestMethod.POST)
    public Result<?> importExcel(HttpServletRequest request, HttpServletResponse response) {
        return super.importExcel(request, response, EduEquipmentBasisTemplate.class);
    }

}
