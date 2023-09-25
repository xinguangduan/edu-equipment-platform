package org.eemp.modules.edu.foudation.entity;

import java.io.Serializable;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;
import org.eemp.common.poi.excel.annotation.Excel;
import org.eemp.common.aspect.annotation.Dict;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * @Description: 学校管理
 * @Date:   2023-06-03
 * @Version: V1.0
 */
@Data
@TableName("organization_definition")
@Accessors(chain = true)
@EqualsAndHashCode(callSuper = false)
@ApiModel(value="organization_definition对象", description="学校管理")
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
	/**乡镇*/
    @Excel(name = "乡镇", width = 15, dicCode = "township_list")
    @Dict(dicCode = "township_list")
	@ApiModelProperty(value = "乡镇")
	private java.lang.String township;
	/**学校名称*/
	@Excel(name = "学校名称", width = 15)
    @ApiModelProperty(value = "学校名称")
    private java.lang.String institutionName;
	/**学校类型*/
	@Excel(name = "学校类型", width = 15, dicCode = "institution_type")
	@Dict(dicCode = "institution_type")
    @ApiModelProperty(value = "学校类型")
    private java.lang.String institutionType;
    /**图表分组*/
    @ApiModelProperty(value = "图表分组")
    private java.lang.String chartGroup;
	/**账号名称*/
	@Excel(name = "账号名称", width = 15)
    @ApiModelProperty(value = "账号名称")
    private java.lang.String adminCode;
    /**最近访问时间*/
    @Excel(name = "最近访问时间", width = 20, format = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(timezone = "GMT+8",pattern = "yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    @ApiModelProperty(value = "最近访问时间")
    private java.util.Date lastLoginTime;
    /**管理员姓名*/
    @Excel(name = "管理员姓名", width = 15)
    @ApiModelProperty(value = "管理员姓名")
    private java.lang.String adminName;
    /**联系电话*/
    @Excel(name = "联系电话", width = 15)
    @ApiModelProperty(value = "联系电话")
    private java.lang.String phoneNumber;
	/**角色编码*/
    @ApiModelProperty(value = "角色编码")
    private String roleCode;
	/**初始密码*/
	@Excel(name = "初始密码", width = 15)
    @ApiModelProperty(value = "初始密码")
    private java.lang.String initialPassword;
	/**账户生成是否成功*/
	@Excel(name = "账户生成是否成功", width = 18, dicCode = "yn")
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
