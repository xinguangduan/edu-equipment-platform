package org.eemp.modules.edu.equipment.controller;

import java.util.Arrays;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lombok.RequiredArgsConstructor;
import org.eemp.common.system.base.controller.BaseController;
import org.eemp.common.api.vo.Result;
import org.eemp.common.system.query.QueryGenerator;
import org.eemp.modules.edu.equipment.entity.EduEquipmentBook;
import org.eemp.modules.edu.equipment.service.IEduEquipmentBookService;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.extern.slf4j.Slf4j;

import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.eemp.common.aspect.annotation.AutoLog;
import org.apache.shiro.authz.annotation.RequiresPermissions;

 /**
 * @Description: 教学装备登记表
 * @Date:   2023-09-03
 * @Version: V1.0
 */
@Api(tags="教学装备登记表")
@RestController
@RequestMapping("/org.eemp.modules.edu.equipment/eduEquipmentBook")
@Slf4j
@RequiredArgsConstructor
public class EduEquipmentBookController extends BaseController<EduEquipmentBook, IEduEquipmentBookService> {
	private final IEduEquipmentBookService eduEquipmentBookService;
	
	/**
	 * 分页列表查询
	 *
	 * @param eduEquipmentBook
	 * @param pageNo
	 * @param pageSize
	 * @param req
	 * @return
	 */
	//@AutoLog(value = "教学装备登记表-分页列表查询")
	@ApiOperation(value="教学装备登记表-分页列表查询", notes="教学装备登记表-分页列表查询")
	@GetMapping(value = "/list")
	public Result<IPage<EduEquipmentBook>> queryPageList(EduEquipmentBook eduEquipmentBook,
								   @RequestParam(name="pageNo", defaultValue="1") Integer pageNo,
								   @RequestParam(name="pageSize", defaultValue="10") Integer pageSize,
								   HttpServletRequest req) {
		QueryWrapper<EduEquipmentBook> queryWrapper = QueryGenerator.initQueryWrapper(eduEquipmentBook, req.getParameterMap());
		Page<EduEquipmentBook> page = new Page<EduEquipmentBook>(pageNo, pageSize);
		IPage<EduEquipmentBook> pageList = eduEquipmentBookService.page(page, queryWrapper);
		return Result.OK(pageList);
	}
	
	/**
	 *   添加
	 *
	 * @param eduEquipmentBook
	 * @return
	 */
	@AutoLog(value = "教学装备登记表-添加")
	@ApiOperation(value="教学装备登记表-添加", notes="教学装备登记表-添加")
	@RequiresPermissions("edu.equipment:edu_equipment_book:add")
	@PostMapping(value = "/add")
	public Result<String> add(@RequestBody EduEquipmentBook eduEquipmentBook) {
		eduEquipmentBookService.save(eduEquipmentBook);
		return Result.OK("添加成功！");
	}
	
	/**
	 *  编辑
	 *
	 * @param eduEquipmentBook
	 * @return
	 */
	@AutoLog(value = "教学装备登记表-编辑")
	@ApiOperation(value="教学装备登记表-编辑", notes="教学装备登记表-编辑")
	@RequiresPermissions("edu.equipment:edu_equipment_book:edit")
	@RequestMapping(value = "/edit", method = {RequestMethod.PUT,RequestMethod.POST})
	public Result<String> edit(@RequestBody EduEquipmentBook eduEquipmentBook) {
		eduEquipmentBookService.updateById(eduEquipmentBook);
		return Result.OK("编辑成功!");
	}
	
	/**
	 *   通过id删除
	 *
	 * @param id
	 * @return
	 */
	@AutoLog(value = "教学装备登记表-通过id删除")
	@ApiOperation(value="教学装备登记表-通过id删除", notes="教学装备登记表-通过id删除")
	@RequiresPermissions("edu.equipment:edu_equipment_book:delete")
	@DeleteMapping(value = "/delete")
	public Result<String> delete(@RequestParam(name="id",required=true) String id) {
		eduEquipmentBookService.removeById(id);
		return Result.OK("删除成功!");
	}
	
	/**
	 *  批量删除
	 *
	 * @param ids
	 * @return
	 */
	@AutoLog(value = "教学装备登记表-批量删除")
	@ApiOperation(value="教学装备登记表-批量删除", notes="教学装备登记表-批量删除")
	@RequiresPermissions("edu.equipment:edu_equipment_book:deleteBatch")
	@DeleteMapping(value = "/deleteBatch")
	public Result<String> deleteBatch(@RequestParam(name="ids",required=true) String ids) {
		this.eduEquipmentBookService.removeByIds(Arrays.asList(ids.split(",")));
		return Result.OK("批量删除成功!");
	}
	
	/**
	 * 通过id查询
	 *
	 * @param id
	 * @return
	 */
	//@AutoLog(value = "教学装备登记表-通过id查询")
	@ApiOperation(value="教学装备登记表-通过id查询", notes="教学装备登记表-通过id查询")
	@GetMapping(value = "/queryById")
	public Result<EduEquipmentBook> queryById(@RequestParam(name="id",required=true) String id) {
		EduEquipmentBook eduEquipmentBook = eduEquipmentBookService.getById(id);
		if(eduEquipmentBook==null) {
			return Result.error("未找到对应数据");
		}
		return Result.OK(eduEquipmentBook);
	}

    /**
    * 导出excel
    *
    * @param request
    * @param eduEquipmentBook
    */
    @RequiresPermissions("edu.equipment:edu_equipment_book:exportXls")
    @RequestMapping(value = "/exportXls")
    public ModelAndView exportXls(HttpServletRequest request, EduEquipmentBook eduEquipmentBook) {
        return super.exportXls(request, eduEquipmentBook, EduEquipmentBook.class, "教学装备登记表");
    }

    /**
      * 通过excel导入数据
    *
    * @param request
    * @param response
    * @return
    */
    @RequiresPermissions("org.eemp.modules.edu.equipment:edu_equipment_book:importExcel")
    @RequestMapping(value = "/importExcel", method = RequestMethod.POST)
    public Result<?> importExcel(HttpServletRequest request, HttpServletResponse response) {
        return super.importExcel(request, response, EduEquipmentBook.class);
    }

}
