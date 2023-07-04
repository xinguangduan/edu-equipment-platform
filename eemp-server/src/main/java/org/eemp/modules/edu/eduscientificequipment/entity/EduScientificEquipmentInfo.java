package org.eemp.modules.edu.eduscientificequipment.entity;

import java.io.Serializable;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;
import org.eemp.common.aspect.annotation.Dict;
import org.eemp.common.poi.excel.annotation.Excel;
import org.springframework.format.annotation.DateTimeFormat;

/**
 * @Description: 小学科学教学装备配置登记表
 * @Author: jeecg-boot
 * @Date:   2023-04-16
 * @Version: V1.0
 */
@Data
@TableName("edu_scientific_equipment_info")
@Accessors(chain = true)
@EqualsAndHashCode(callSuper = false)
@ApiModel(value="edu_scientific_equipment_info对象", description="小学科学教学装备配置登记表")
public class EduScientificEquipmentInfo implements Serializable {
    private static final long serialVersionUID = 1L;

	/**主键*/
	@TableId(type = IdType.ASSIGN_ID)
    @ApiModelProperty(value = "主键")
    private java.lang.String id;
	/**学校*/
	@Excel(name = "学校", width = 15)
    @ApiModelProperty(value = "学校")
    private java.lang.String school;
	/**编号*/
	@Excel(name = "编号", width = 15)
    @ApiModelProperty(value = "编号")
    private java.lang.String numberCode;
	/**名称*/
	@Excel(name = "名称", width = 15)
    @ApiModelProperty(value = "名称")
    private java.lang.String name;
	/**单位*/
	@Excel(name = "单位", width = 15, dicCode = "unit_code")
	@Dict(dicCode = "unit_code")
    @ApiModelProperty(value = "单位")
    private java.lang.String unit;
	/**配置标准*/
	@Excel(name = "配置标准", width = 15)
    @ApiModelProperty(value = "配置标准")
    private java.lang.String equipmentStandard;
	/**年份*/
	@Excel(name = "年份", width = 15, dicCode = "year_code")
	@Dict(dicCode = "year_code")
    @ApiModelProperty(value = "年份")
    private java.lang.String year;
	/**年初数*/
	@Excel(name = "年初数", width = 15)
    @ApiModelProperty(value = "年初数")
    private java.lang.Integer yearStartNum;
	/**增减数*/
	@Excel(name = "增减数", width = 15)
    @ApiModelProperty(value = "增减数")
    private java.lang.Integer yearDelta;
	/**年末数*/
	@Excel(name = "年末数", width = 15)
    @ApiModelProperty(value = "年末数")
    private java.lang.Integer yearEndNum;
	/**所属部门*/
    @ApiModelProperty(value = "所属部门")
    private java.lang.String sysOrgCode;
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
