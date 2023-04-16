package org.eemp.modules.edu.edumusicequipment.controller;

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
import org.eemp.modules.edu.edumusicequipment.entity.EduMusicEquipmentInfo;
import org.eemp.modules.edu.edumusicequipment.service.IEduMusicEquipmentInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

 /**
 * @Description: 小学音乐教学装备配置登记表
 * @Author: jeecg-boot
 * @Date:   2023-04-16
 * @Version: V1.0
 */
@Api(tags="小学音乐教学装备配置登记表")
@RestController
@RequestMapping("/edu/edumusicequipment/eduMusicEquipmentInfo")
@Slf4j
public class EduMusicEquipmentInfoController extends JeecgController<EduMusicEquipmentInfo, IEduMusicEquipmentInfoService> {
	@Autowired
	private IEduMusicEquipmentInfoService eduMusicEquipmentInfoService;
	
	/**
	 * 分页列表查询
	 *
	 * @param eduMusicEquipmentInfo
	 * @param pageNo
	 * @param pageSize
	 * @param req
	 * @return
	 */
	//@AutoLog(value = "小学音乐教学装备配置登记表-分页列表查询")
	@ApiOperation(value="小学音乐教学装备配置登记表-分页列表查询", notes="小学音乐教学装备配置登记表-分页列表查询")
	@GetMapping(value = "/list")
	public Result<IPage<EduMusicEquipmentInfo>> queryPageList(EduMusicEquipmentInfo eduMusicEquipmentInfo,
								   @RequestParam(name="pageNo", defaultValue="1") Integer pageNo,
								   @RequestParam(name="pageSize", defaultValue="10") Integer pageSize,
								   HttpServletRequest req) {
		QueryWrapper<EduMusicEquipmentInfo> queryWrapper = QueryGenerator.initQueryWrapper(eduMusicEquipmentInfo, req.getParameterMap());
		Page<EduMusicEquipmentInfo> page = new Page<EduMusicEquipmentInfo>(pageNo, pageSize);
		IPage<EduMusicEquipmentInfo> pageList = eduMusicEquipmentInfoService.page(page, queryWrapper);
		return Result.OK(pageList);
	}
	
	/**
	 *   添加
	 *
	 * @param eduMusicEquipmentInfo
	 * @return
	 */
	@AutoLog(value = "小学音乐教学装备配置登记表-添加")
	@ApiOperation(value="小学音乐教学装备配置登记表-添加", notes="小学音乐教学装备配置登记表-添加")
	@RequiresPermissions("edu.edumusicequipment:edu_music_equipment_info:add")
	@PostMapping(value = "/add")
	public Result<String> add(@RequestBody EduMusicEquipmentInfo eduMusicEquipmentInfo) {
		eduMusicEquipmentInfoService.save(eduMusicEquipmentInfo);
		return Result.OK("添加成功！");
	}
	
	/**
	 *  编辑
	 *
	 * @param eduMusicEquipmentInfo
	 * @return
	 */
	@AutoLog(value = "小学音乐教学装备配置登记表-编辑")
	@ApiOperation(value="小学音乐教学装备配置登记表-编辑", notes="小学音乐教学装备配置登记表-编辑")
	@RequiresPermissions("edu.edumusicequipment:edu_music_equipment_info:edit")
	@RequestMapping(value = "/edit", method = {RequestMethod.PUT,RequestMethod.POST})
	public Result<String> edit(@RequestBody EduMusicEquipmentInfo eduMusicEquipmentInfo) {
		eduMusicEquipmentInfoService.updateById(eduMusicEquipmentInfo);
		return Result.OK("编辑成功!");
	}
	
	/**
	 *   通过id删除
	 *
	 * @param id
	 * @return
	 */
	@AutoLog(value = "小学音乐教学装备配置登记表-通过id删除")
	@ApiOperation(value="小学音乐教学装备配置登记表-通过id删除", notes="小学音乐教学装备配置登记表-通过id删除")
	@RequiresPermissions("edu.edumusicequipment:edu_music_equipment_info:delete")
	@DeleteMapping(value = "/delete")
	public Result<String> delete(@RequestParam(name="id",required=true) String id) {
		eduMusicEquipmentInfoService.removeById(id);
		return Result.OK("删除成功!");
	}
	
	/**
	 *  批量删除
	 *
	 * @param ids
	 * @return
	 */
	@AutoLog(value = "小学音乐教学装备配置登记表-批量删除")
	@ApiOperation(value="小学音乐教学装备配置登记表-批量删除", notes="小学音乐教学装备配置登记表-批量删除")
	@RequiresPermissions("edu.edumusicequipment:edu_music_equipment_info:deleteBatch")
	@DeleteMapping(value = "/deleteBatch")
	public Result<String> deleteBatch(@RequestParam(name="ids",required=true) String ids) {
		this.eduMusicEquipmentInfoService.removeByIds(Arrays.asList(ids.split(",")));
		return Result.OK("批量删除成功!");
	}
	
	/**
	 * 通过id查询
	 *
	 * @param id
	 * @return
	 */
	//@AutoLog(value = "小学音乐教学装备配置登记表-通过id查询")
	@ApiOperation(value="小学音乐教学装备配置登记表-通过id查询", notes="小学音乐教学装备配置登记表-通过id查询")
	@GetMapping(value = "/queryById")
	public Result<EduMusicEquipmentInfo> queryById(@RequestParam(name="id",required=true) String id) {
		EduMusicEquipmentInfo eduMusicEquipmentInfo = eduMusicEquipmentInfoService.getById(id);
		if(eduMusicEquipmentInfo==null) {
			return Result.error("未找到对应数据");
		}
		return Result.OK(eduMusicEquipmentInfo);
	}

    /**
    * 导出excel
    *
    * @param request
    * @param eduMusicEquipmentInfo
    */
    @RequiresPermissions("edu.edumusicequipment:edu_music_equipment_info:exportXls")
    @RequestMapping(value = "/exportXls")
    public ModelAndView exportXls(HttpServletRequest request, EduMusicEquipmentInfo eduMusicEquipmentInfo) {
        return super.exportXls(request, eduMusicEquipmentInfo, EduMusicEquipmentInfo.class, "小学音乐教学装备配置登记表");
    }

    /**
      * 通过excel导入数据
    *
    * @param request
    * @param response
    * @return
    */
    @RequiresPermissions("edu.edumusicequipment:edu_music_equipment_info:importExcel")
    @RequestMapping(value = "/importExcel", method = RequestMethod.POST)
    public Result<?> importExcel(HttpServletRequest request, HttpServletResponse response) {
        return super.importExcel(request, response, EduMusicEquipmentInfo.class);
    }

}
