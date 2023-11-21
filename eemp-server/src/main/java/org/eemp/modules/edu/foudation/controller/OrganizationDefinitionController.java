package org.eemp.modules.edu.foudation.controller;

import java.util.Arrays;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.hutool.core.util.RandomUtil;
import com.alibaba.fastjson.JSONArray;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.eemp.common.api.CommonAPI;
import org.eemp.common.api.vo.Result;
import org.eemp.common.aspect.annotation.AutoLog;
import org.eemp.common.constant.CommonConstant;
import org.eemp.common.system.base.controller.BaseController;
import org.eemp.common.system.query.QueryGenerator;
import org.eemp.common.system.vo.DictModel;
import org.eemp.common.util.PasswordUtil;
import org.eemp.common.util.oConvertUtils;
import org.eemp.modules.base.service.BaseCommonService;
import org.eemp.modules.edu.foudation.entity.OrganizationDefinition;
import org.eemp.modules.edu.foudation.service.IOrganizationDefinitionService;
import org.eemp.modules.system.entity.SysUser;
import org.eemp.modules.system.service.ISysUserService;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

 /**
 * @Description: 学校管理
 * @Date:   2023-06-03
 * @Version: V1.0
 */
@Api(tags="学校管理")
@RestController
@RequestMapping("/org.eemp.modules.edu.foudation/organizationDefinition")
@Slf4j
@RequiredArgsConstructor
public class OrganizationDefinitionController extends BaseController<OrganizationDefinition, IOrganizationDefinitionService> {
	private final IOrganizationDefinitionService organizationDefinitionService;
	private final ISysUserService sysUserService;
	private final BaseCommonService baseCommonService;
	private final CommonAPI commonAPI;
	
	/**
	 * 分页列表查询
	 *
	 * @param organizationDefinition
	 * @param pageNo
	 * @param pageSize
	 * @param req
	 * @return
	 */
	//@AutoLog(value = "学校管理-分页列表查询")
	@ApiOperation(value="学校管理-分页列表查询", notes="学校管理-分页列表查询")
	@GetMapping(value = "/list")
	public Result<IPage<OrganizationDefinition>> queryPageList(OrganizationDefinition organizationDefinition,
								   @RequestParam(name="pageNo", defaultValue="1") Integer pageNo,
								   @RequestParam(name="pageSize", defaultValue="10") Integer pageSize,
								   HttpServletRequest req) {
		QueryWrapper<OrganizationDefinition> queryWrapper = QueryGenerator.initQueryWrapper(organizationDefinition, req.getParameterMap());
		Page<OrganizationDefinition> page = new Page<OrganizationDefinition>(pageNo, pageSize);
		IPage<OrganizationDefinition> pageList = organizationDefinitionService.page(page, queryWrapper);
		return Result.OK(pageList);
	}
	
	/**
	 *   添加
	 *
	 * @param organizationDefinition
	 * @return
	 */
	@AutoLog(value = "学校管理-添加")
	@ApiOperation(value="学校管理-添加", notes="学校管理-添加")
	@RequiresPermissions("edu.foudation:organization_definition:add")
	@PostMapping(value = "/add")
	public Result<String> add(@RequestBody OrganizationDefinition organizationDefinition) {
		Result<String> result = new Result<>();

		String username = organizationDefinition.getAdminCode();
		SysUser tmpUser = sysUserService.getUserByName(username);
		if (tmpUser != null) {
			result.setMessage("用户名已注册");
			result.setSuccess(false);
			organizationDefinition.setAdminGenerationSuccess("0");
			organizationDefinition.setFailureReason(result.getMessage());
			organizationDefinitionService.save(organizationDefinition);
			return result;
		}
		String roleIds = null;
		switch (organizationDefinition.getInstitutionType()) {
			case "11":	roleIds = "1666258199734517761";	break;			// nursery_school	幼儿园
			case "12":														// primary_school	中心小学
			case "13":	roleIds = "1666258199717740546";	break;			// primary_school	完全小学
			case "14":	roleIds = "1666258199700963330";	break;			// junior_school	初中
			case "15":	roleIds = "1666258199679991810";	break;			// senior_school	高中
			default:
				result.setMessage("学校类型非标准值");
				result.setSuccess(false);
				organizationDefinition.setAdminGenerationSuccess("0");
				organizationDefinition.setFailureReason(result.getMessage());
				organizationDefinitionService.save(organizationDefinition);
				return result;
		}
		organizationDefinition.setRoleCode(roleIds);							// 保存转换的角色代码
		String password = organizationDefinition.getInitialPassword();			// 正常应该为 null
		if(oConvertUtils.isEmpty(password)){
			password = RandomUtil.randomString(8);
			organizationDefinition.setInitialPassword(password);				// 保存生成的密码
		}
		switch (organizationDefinition.getInstitutionType()) {
			case "11":																	// nursery_school	幼儿园
			case "15":	organizationDefinition.setChartGroup("高职特幼");	break;		// senior_school	高中
			case "12":	organizationDefinition.setChartGroup("中心小学");	break;		// primary_school	中心小学
			case "13":	organizationDefinition.setChartGroup("完全小学");	break;		// primary_school	完全小学
			case "14":	organizationDefinition.setChartGroup("初中");		break;		// junior_school	初中
		}

		try {
			SysUser user = new SysUser();
			user.setUsername(username);
			user.setRealname(organizationDefinition.getInstitutionName());		// 设置学校名词
			user.setCreateTime(new Date());										// 设置创建时间
			String salt = oConvertUtils.randomGen(8);
			user.setSalt(salt);
			String passwordEncode = PasswordUtil.encrypt(username, password, salt);
			user.setPassword(passwordEncode);
			user.setStatus(1);
			user.setDelFlag(CommonConstant.DEL_FLAG_0);							// 未删除
			user.setOrgCode("A01");
			user.setTelephone(organizationDefinition.getIdentificationCode());	// 借用保存学校用户对应的机构代码
			// 保存用户走一个service 保证事务
			//获取租户ids
//			String relTenantIds = jsonObject.getString("relTenantIds");
//			sysUserService.saveUser(user, selectedRoles, selectedDeparts, relTenantIds);
			sysUserService.saveUser(user, roleIds, null, null);
			baseCommonService.addLog("添加用户，username： " +user.getUsername() ,CommonConstant.LOG_TYPE_2, 2);
			organizationDefinition.setAdminGenerationSuccess("1");
			result.success("添加成功！");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			organizationDefinition.setAdminGenerationSuccess("0");
			organizationDefinition.setFailureReason(e.getMessage().substring(0,28));
			result.error500("操作失败");
		}

		organizationDefinitionService.save(organizationDefinition);
		return result;
	}
	
	/**
	 *  编辑
	 *
	 * @param organizationDefinition
	 * @return
	 */
	@AutoLog(value = "学校管理-编辑")
	@ApiOperation(value="学校管理-编辑", notes="学校管理-编辑")
	@RequiresPermissions("edu.foudation:organization_definition:edit")
	@RequestMapping(value = "/edit", method = {RequestMethod.PUT,RequestMethod.POST})
	public Result<String> edit(@RequestBody OrganizationDefinition organizationDefinition) {
		organizationDefinitionService.updateById(organizationDefinition);
		return Result.OK("编辑成功!");
	}
	
	/**
	 *   通过id删除
	 *
	 * @param id
	 * @return
	 */
	@AutoLog(value = "学校管理-通过id删除")
	@ApiOperation(value="学校管理-通过id删除", notes="学校管理-通过id删除")
	@RequiresPermissions("edu.foudation:organization_definition:delete")
	@DeleteMapping(value = "/delete")
	public Result<String> delete(@RequestParam(name="id",required=true) String id) {
		organizationDefinitionService.removeById(id);
		return Result.OK("删除成功!");
	}
	
	/**
	 *  批量删除
	 *
	 * @param ids
	 * @return
	 */
	@AutoLog(value = "学校管理-批量删除")
	@ApiOperation(value="学校管理-批量删除", notes="学校管理-批量删除")
	@RequiresPermissions("edu.foudation:organization_definition:deleteBatch")
	@DeleteMapping(value = "/deleteBatch")
	public Result<String> deleteBatch(@RequestParam(name="ids",required=true) String ids) {
		this.organizationDefinitionService.removeByIds(Arrays.asList(ids.split(",")));
		return Result.OK("批量删除成功!");
	}
	
	/**
	 * 通过id查询
	 *
	 * @param id
	 * @return
	 */
	//@AutoLog(value = "学校管理-通过id查询")
	@ApiOperation(value="学校管理-通过id查询", notes="学校管理-通过id查询")
	@GetMapping(value = "/queryById")
	public Result<OrganizationDefinition> queryById(@RequestParam(name="id",required=true) String id) {
		OrganizationDefinition organizationDefinition = organizationDefinitionService.getById(id);
		if(organizationDefinition==null) {
			return Result.error("未找到对应数据");
		}
		return Result.OK(organizationDefinition);
	}

    /**
    * 导出excel
    *
    * @param request
    * @param organizationDefinition
    */
    @RequiresPermissions("edu.foudation:organization_definition:exportXls")
    @RequestMapping(value = "/exportXls")
    public ModelAndView exportXls(HttpServletRequest request, OrganizationDefinition organizationDefinition) {
        return super.exportXls(request, organizationDefinition, OrganizationDefinition.class, "学校管理");
    }

    /**
      * 通过excel导入数据
    *
    * @param request
    * @param response
    * @return
    */
    @RequiresPermissions("edu.foudation:organization_definition:importExcel")
    @RequestMapping(value = "/importExcel", method = RequestMethod.POST)
    public Result<?> importExcel(HttpServletRequest request, HttpServletResponse response) {
		Result<?> result = super.importExcel(request, response, OrganizationDefinition.class);
		if (!result.isSuccess())
			return result;

		List<DictModel> institutionTypes = commonAPI.queryDictItemsByCode("institution_type");
		List<DictModel> townshipList = commonAPI.queryDictItemsByCode("township_list");

		for (OrganizationDefinition rec: organizationDefinitionService.getImportedExcelRecords()) {
			if (institutionTypes.stream().noneMatch(it -> ((DictModel)it).getValue().equals(rec.getInstitutionType()))) {
				result.setMessage("机构类型非标准值");
				result.setSuccess(false);
				rec.setAdminGenerationSuccess("0");
				rec.setFailureReason(result.getMessage());
				organizationDefinitionService.updateById(rec);

				continue;
			}
			if (townshipList.stream().noneMatch(ts -> ((DictModel)ts).getValue().equals(rec.getTownship()))) {
				result.setMessage("乡镇非标准值");
				result.setSuccess(false);
				rec.setAdminGenerationSuccess("0");
				rec.setFailureReason(result.getMessage());
				organizationDefinitionService.updateById(rec);

				continue;
			}

			String roleIds = null;
			switch (rec.getInstitutionType()) {
				case "11":	roleIds = "1666258199734517761";	break;			// nursery_school	幼儿园
				case "12":														// primary_school	中心小学
				case "13":	roleIds = "1666258199717740546";	break;			// primary_school	完全小学
				case "14":	roleIds = "1666258199700963330";	break;			// junior_school	初中
				case "15":	roleIds = "1666258199679991810";	break;			// senior_school	高中
				default:
					result.setMessage("学校类型非标准值");
					result.setSuccess(false);
					rec.setAdminGenerationSuccess("0");
					rec.setFailureReason(result.getMessage());
					organizationDefinitionService.updateById(rec);
					return result;
			}
			rec.setRoleCode(roleIds);							// 保存转换的角色代码
			String password = rec.getInitialPassword();			// 正常应该为 null
			if(oConvertUtils.isEmpty(password)){
				password = RandomUtil.randomString(8);
				rec.setInitialPassword(password);				// 保存生成的密码
			}
			switch (rec.getInstitutionType()) {
				case "11":												// nursery_school	幼儿园
				case "15":	rec.setChartGroup("高职特幼");	break;		// senior_school	高中
				case "12":	rec.setChartGroup("中心小学");	break;		// primary_school	中心小学
				case "13":	rec.setChartGroup("完全小学");	break;		// primary_school	完全小学
				case "14":	rec.setChartGroup("初中");		break;		// junior_school	初中
			}

			try {
				SysUser user = new SysUser();
				user.setUsername(rec.getAdminCode());
				user.setRealname(rec.getInstitutionName());		// 设置学校名词
				user.setCreateTime(new Date());										// 设置创建时间
				String salt = oConvertUtils.randomGen(8);
				user.setSalt(salt);
				String passwordEncode = PasswordUtil.encrypt(rec.getAdminCode(), password, salt);
				user.setPassword(passwordEncode);
				user.setStatus(1);
				user.setDelFlag(CommonConstant.DEL_FLAG_0);							// 未删除
				user.setOrgCode("A01");
				user.setTelephone(rec.getIdentificationCode());	// 借用保存学校用户对应的机构代码
				// 保存用户走一个service 保证事务
				//获取租户ids
//				String relTenantIds = jsonObject.getString("relTenantIds");
//				sysUserService.saveUser(user, selectedRoles, selectedDeparts, relTenantIds);
				sysUserService.saveUser(user, roleIds, null, null);
				baseCommonService.addLog("添加用户，username： " +user.getUsername() ,CommonConstant.LOG_TYPE_2, 2);
				rec.setAdminGenerationSuccess("1");
				result.success("添加成功！");
			} catch (Exception e) {
				log.error(e.getMessage(), e);
				rec.setAdminGenerationSuccess("0");
				rec.setInitialPassword("");
				rec.setFailureReason(e.getMessage().substring(0,28));
				result.error500("操作失败");
			}

			organizationDefinitionService.updateById(rec);
		}

		return result;
    }

	/**
	 * 查询学校数据,并以树结构数据格式响应给前端
	 */
	@AutoLog(value = "学校管理-查询学校树结构")
	@ApiOperation(value="学校管理-查询学校树结构", notes="学校管理-查询学校树结构")
	@RequestMapping(value = "/getSchoolTreeData", method = RequestMethod.GET)
	public Result<JSONArray> getSchoolTreeData() {
		Result<JSONArray> result = new Result<>();
		try {
			JSONArray tree = organizationDefinitionService.getSchoolTreeData();
			result.setResult(tree);
			result.setSuccess(true);
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}

		return result;
	}

	/**
	 *   重置密码
	 *
	 * @param username
	 * @return
	 */
	@AutoLog(value = "学校管理-重置密码")
	@ApiOperation(value="学校管理-重置密码", notes="学校管理-重置密码")
//	@RequiresPermissions("edu.foudation:organization_definition:resetPassword")
	@PostMapping(value = "/resetPassword")
	public Result<String> resetPassword(@RequestParam(name="username", required=true) String username) {
		String password = RandomUtil.randomString(8);

		SysUser sysUser = sysUserService.getUserByName(username);
		sysUser.setPassword(password);
		sysUserService.changePassword(sysUser);

		OrganizationDefinition rec = organizationDefinitionService.getSchoolRecordByAdminCode(username);
		rec.setInitialPassword(password);				// 保存生成的密码
		organizationDefinitionService.updateById(rec);

		return Result.OK("用户【" + username + "】重置密码（" + password + "）成功!");
	}
}
