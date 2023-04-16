package org.eemp.modules.edu.edumusicequipment.entity;

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
import org.jeecgframework.poi.excel.annotation.Excel;
import org.springframework.format.annotation.DateTimeFormat;

/**
 * @Description: 小学音乐教学装备配置登记表
 * @Author: jeecg-boot
 * @Date:   2023-04-16
 * @Version: V1.0
 */
@Data
@TableName("edu_music_equipment_info")
@Accessors(chain = true)
@EqualsAndHashCode(callSuper = false)
@ApiModel(value="edu_music_equipment_info对象", description="小学音乐教学装备配置登记表")
public class EduMusicEquipmentInfo implements Serializable {
    private static final long serialVersionUID = 1L;

	/**主键*/
	@TableId(type = IdType.ASSIGN_ID)
    @ApiModelProperty(value = "主键")
    private java.lang.String id;
	/**学校*/
	@Excel(name = "学校", width = 15)
    @ApiModelProperty(value = "学校")
    private java.lang.String school;
	/**分类代码*/
	@Excel(name = "分类代码", width = 15, dicCode = "category_code")
	@Dict(dicCode = "category_code")
    @ApiModelProperty(value = "分类代码")
    private java.lang.String categoryCode;
	/**名称*/
	@Excel(name = "名称", width = 15, dicCode = "equipment_name_code")
	@Dict(dicCode = "equipment_name_code")
    @ApiModelProperty(value = "名称")
    private java.lang.String name;
	/**规格型号功能*/
	@Excel(name = "规格型号功能", width = 15)
    @ApiModelProperty(value = "规格型号功能")
    private java.lang.String specModelFunc;
	/**单位*/
	@Excel(name = "单位", width = 15, dicCode = "unit_code")
	@Dict(dicCode = "unit_code")
    @ApiModelProperty(value = "单位")
    private java.lang.String unit;
	/**数量*/
	@Excel(name = "数量", width = 15)
    @ApiModelProperty(value = "数量")
    private java.lang.Integer quantity;
	/**配备要求*/
	@Excel(name = "配备要求", width = 15, dicCode = "equipment_requirement_code")
	@Dict(dicCode = "equipment_requirement_code")
    @ApiModelProperty(value = "配备要求")
    private java.lang.String equipmentRequirement;
	/**执行标准代号*/
	@Excel(name = "执行标准代号", width = 15, dicCode = "executive_standard_code")
	@Dict(dicCode = "executive_standard_code")
    @ApiModelProperty(value = "执行标准代号")
    private java.lang.String executiveStandardCode;
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
	/**年底数*/
	@Excel(name = "年底数", width = 15)
    @ApiModelProperty(value = "年底数")
    private java.lang.Integer yearEndNum;
	/**备注*/
	@Excel(name = "备注", width = 15)
    @ApiModelProperty(value = "备注")
    private java.lang.String remark;
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
