package org.eemp.modules.organization.vo;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import org.eemp.modules.school.entity.SchoolBasicInfo;
import org.jeecgframework.poi.excel.annotation.Excel;
import org.jeecgframework.poi.excel.annotation.ExcelCollection;
import org.springframework.format.annotation.DateTimeFormat;

/**
 * @Description: 机构组织定义，含层级、联系信息
 * @Author: jeecg-boot
 * @Date:   2023-02-24
 * @Version: V1.0
 */
@Data
@ApiModel(value="organization_definitionPage对象", description="机构组织定义，含层级、联系信息")
public class OrganizationDefinitionPage {

	/**主键*/
	@ApiModelProperty(value = "主键")
    private String id;
	/**标识代码*/
	@Excel(name = "标识代码", width = 15)
	@ApiModelProperty(value = "标识代码")
    private String identificationCode;
	/**机构名称*/
	@Excel(name = "机构名称", width = 15)
	@ApiModelProperty(value = "机构名称")
    private String institutionName;
	/**上级标识代码*/
	@Excel(name = "上级标识代码", width = 15)
	@ApiModelProperty(value = "上级标识代码")
    private String superiorIdentificationCode;
	/**联系人邮箱*/
	@Excel(name = "联系人邮箱", width = 15)
	@ApiModelProperty(value = "联系人邮箱")
    private String contactMailAddress;
	/**创建人*/
	@ApiModelProperty(value = "创建人")
    private String createBy;
	/**创建日期*/
	@JsonFormat(timezone = "GMT+8",pattern = "yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	@ApiModelProperty(value = "创建日期")
    private Date createTime;
	/**更新人*/
	@ApiModelProperty(value = "更新人")
    private String updateBy;
	/**更新日期*/
	@JsonFormat(timezone = "GMT+8",pattern = "yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	@ApiModelProperty(value = "更新日期")
    private Date updateTime;

	@ExcelCollection(name="学校基本信息")
	@ApiModelProperty(value = "学校基本信息")
	private List<SchoolBasicInfo> schoolBasicInfoList;

}
