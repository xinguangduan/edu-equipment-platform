package org.eemp.modules.organization.entity;

import java.io.Serializable;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import org.jeecgframework.poi.excel.annotation.Excel;
import org.springframework.format.annotation.DateTimeFormat;

/**
 * @Description: 机构组织定义，含层级、联系信息
 * @Author: jeecg-boot
 * @Date:   2023-02-24
 * @Version: V1.0
 */
@ApiModel(value="organization_definition对象", description="机构组织定义，含层级、联系信息")
@Data
@TableName("organization_definition")
public class OrganizationDefinition implements Serializable {
    private static final long serialVersionUID = 1L;

	/**主键*/
	@TableId(type = IdType.ASSIGN_ID)
    @ApiModelProperty(value = "主键")
    private java.lang.String id;
	/**标识代码*/
	@Excel(name = "标识代码", width = 15)
    @ApiModelProperty(value = "标识代码")
    private java.lang.String identificationCode;
	/**机构名称*/
	@Excel(name = "机构名称", width = 15)
    @ApiModelProperty(value = "机构名称")
    private java.lang.String institutionName;
	/**上级标识代码*/
	@Excel(name = "上级标识代码", width = 15)
    @ApiModelProperty(value = "上级标识代码")
    private java.lang.String superiorIdentificationCode;
	/**联系人邮箱*/
	@Excel(name = "联系人邮箱", width = 15)
    @ApiModelProperty(value = "联系人邮箱")
    private java.lang.String contactMailAddress;
	/**创建人*/
    @ApiModelProperty(value = "创建人")
    private java.lang.String createBy;
	/**创建日期*/
	@JsonFormat(timezone = "GMT+8",pattern = "yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    @ApiModelProperty(value = "创建日期")
    private java.util.Date createTime;
	/**更新人*/
    @ApiModelProperty(value = "更新人")
    private java.lang.String updateBy;
	/**更新日期*/
	@JsonFormat(timezone = "GMT+8",pattern = "yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    @ApiModelProperty(value = "更新日期")
    private java.util.Date updateTime;
}
