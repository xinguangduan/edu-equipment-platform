package org.eemp.modules.edu.foudation.entity;

import java.io.Serializable;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;
import org.jeecgframework.poi.excel.annotation.Excel;
import org.eemp.common.aspect.annotation.Dict;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * @Description: 机构组织定义
 * @Date:   2023-06-03
 * @Version: V1.0
 */
@Data
@TableName("organization_definition")
@Accessors(chain = true)
@EqualsAndHashCode(callSuper = false)
@ApiModel(value="organization_definition对象", description="机构组织定义")
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
	/**机构类型*/
	@Excel(name = "机构类型", width = 15, dicCode = "institution_type")
	@Dict(dicCode = "institution_type")
    @ApiModelProperty(value = "机构类型")
    private java.lang.String institutionType;
	/**账户名称*/
	@Excel(name = "账户名称", width = 15)
    @ApiModelProperty(value = "账户名称")
    private java.lang.String adminCode;
	/**初始密码*/
	@Excel(name = "初始密码", width = 15)
    @ApiModelProperty(value = "初始密码")
    private java.lang.String initialPassword;
	/**账户生成是否成功*/
	@Excel(name = "账户生成是否成功", width = 15, dicCode = "yn")
	@Dict(dicCode = "yn")
    @ApiModelProperty(value = "账户生成是否成功")
    private java.lang.String adminGenerationSuccess;
	/**失败原因*/
	@Excel(name = "失败原因", width = 15)
    @ApiModelProperty(value = "失败原因")
    private java.lang.String failureReason;
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
	/**所属部门*/
    @ApiModelProperty(value = "所属部门")
    private java.lang.String sysOrgCode;
}
