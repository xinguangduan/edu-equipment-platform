package org.eemp.modules.edu.foudation.entity;

import java.io.Serializable;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.eemp.common.aspect.annotation.Dict;
import org.springframework.format.annotation.DateTimeFormat;
import org.eemp.common.poi.excel.annotation.Excel;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * @Description: 填报控制
 * @Date:   2023-09-14
 * @Version: V1.0
 */
@Data
@TableName("filling_control")
@Accessors(chain = true)
@EqualsAndHashCode(callSuper = false)
@ApiModel(value="filling_control对象", description="填报控制")
public class FillingControl implements Serializable {
    private static final long serialVersionUID = 1L;

	/**主键*/
	@TableId(type = IdType.ASSIGN_ID)
    @ApiModelProperty(value = "主键")
    private java.lang.String id;
    /**填报类型*/
    @Excel(name = "填报类型", width = 15, dicCode = "filling_control_type")
    @Dict(dicCode = "filling_control_type")
    @ApiModelProperty(value = "填报类型")
    private java.lang.String controlType;
	/**填报说明*/
	@Excel(name = "填报说明", width = 15)
    @ApiModelProperty(value = "填报说明")
    private java.lang.String controlName;
	/**填报开始日期*/
	@Excel(name = "填报开始日期", width = 15, format = "yyyy-MM-dd")
	@JsonFormat(timezone = "GMT+8",pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern="yyyy-MM-dd")
    @ApiModelProperty(value = "填报开始日期")
    private java.util.Date startDate;
	/**填报结束日期*/
	@Excel(name = "填报结束日期", width = 15, format = "yyyy-MM-dd")
	@JsonFormat(timezone = "GMT+8",pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern="yyyy-MM-dd")
    @ApiModelProperty(value = "填报结束日期")
    private java.util.Date endDate;
    /**审核开始日期*/
    @Excel(name = "审核开始日期", width = 15, format = "yyyy-MM-dd")
    @JsonFormat(timezone = "GMT+8",pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern="yyyy-MM-dd")
    @ApiModelProperty(value = "审核开始日期")
    private java.util.Date checkStartDate;
    /**审核结束日期*/
    @Excel(name = "审核结束日期", width = 15, format = "yyyy-MM-dd")
    @JsonFormat(timezone = "GMT+8",pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern="yyyy-MM-dd")
    @ApiModelProperty(value = "审核结束日期")
    private java.util.Date checkEndDate;
    /**幼儿园*/
    @Excel(name = "幼儿园", width = 15, dictTable = "organization_definition", dicText = "institution_name", dicCode = "identification_code")
    @Dict(dictTable = "organization_definition", dicText = "institution_name", dicCode = "identification_code")
    @ApiModelProperty(value = "幼儿园")
    private java.lang.String nurserySchool;
    /**小学*/
    @Excel(name = "小学", width = 15, dictTable = "organization_definition", dicText = "institution_name", dicCode = "identification_code")
    @Dict(dictTable = "organization_definition", dicText = "institution_name", dicCode = "identification_code")
    @ApiModelProperty(value = "小学")
    private java.lang.String primarySchool;
    /**初中*/
    @Excel(name = "初中", width = 15, dictTable = "organization_definition", dicText = "institution_name", dicCode = "identification_code")
    @Dict(dictTable = "organization_definition", dicText = "institution_name", dicCode = "identification_code")
    @ApiModelProperty(value = "初中")
    private java.lang.String juniorSchool;
    /**高中*/
    @Excel(name = "高中", width = 15, dictTable = "organization_definition", dicText = "institution_name", dicCode = "identification_code")
    @Dict(dictTable = "organization_definition", dicText = "institution_name", dicCode = "identification_code")
    @ApiModelProperty(value = "高中")
    private java.lang.String seniorSchool;
	/**备注*/
	@Excel(name = "备注", width = 15)
    @ApiModelProperty(value = "备注")
    private java.lang.String memo;
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
