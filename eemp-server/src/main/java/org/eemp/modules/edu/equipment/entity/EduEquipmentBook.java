package org.eemp.modules.edu.equipment.entity;

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
 * @Description: 教学装备登记表
 * @Date:   2023-09-03
 * @Version: V1.0
 */
@Data
@TableName("edu_equipment_book")
@Accessors(chain = true)
@EqualsAndHashCode(callSuper = false)
@ApiModel(value="edu_equipment_book对象", description="教学装备登记表")
public class EduEquipmentBook implements Serializable {
    private static final long serialVersionUID = 1L;

	/**id*/
	@TableId(type = IdType.ASSIGN_ID)
    @ApiModelProperty(value = "id")
    private java.lang.String id;
	/**学校名称*/
	@Excel(name = "学校名称", width = 15, dictTable = "organization_definition", dicText = "institution_name", dicCode = "identification_code")
	@Dict(dictTable = "organization_definition", dicText = "institution_name", dicCode = "identification_code")
    @ApiModelProperty(value = "学校名称")
    private java.lang.String identificationCode;
	/**学科*/
	@Excel(name = "学科", width = 15, dicCode = "subject_for_template")
	@Dict(dicCode = "subject_for_template")
    @ApiModelProperty(value = "学科")
    private java.lang.String subject;
	/**生效日期*/
	@Excel(name = "生效日期", width = 15, format = "yyyy-MM-dd")
	@JsonFormat(timezone = "GMT+8",pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern="yyyy-MM-dd")
    @ApiModelProperty(value = "生效日期")
    private java.util.Date effictiveDate;
	/**登记册文件*/
	@Excel(name = "登记册文件", width = 15)
    @ApiModelProperty(value = "登记册文件")
    private java.lang.String bookFile;
    /**备注*/
    @Excel(name = "备注", width = 15)
    @ApiModelProperty(value = "备注")
    private java.lang.String memo;
	/**创建人*/
    @ApiModelProperty(value = "创建人")
    private java.lang.String createBy;
	/**创建日期*/
	@JsonFormat(timezone = "GMT+8",pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern="yyyy-MM-dd")
    @ApiModelProperty(value = "创建日期")
    private java.util.Date createTime;
	/**更新人*/
    @ApiModelProperty(value = "更新人")
    private java.lang.String updateBy;
	/**更新日期*/
	@JsonFormat(timezone = "GMT+8",pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern="yyyy-MM-dd")
    @ApiModelProperty(value = "更新日期")
    private java.util.Date updateTime;
	/**所属部门*/
    @ApiModelProperty(value = "所属部门")
    private java.lang.String sysOrgCode;
}
