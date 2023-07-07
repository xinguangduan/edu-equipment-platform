package org.eemp.modules.edu.statistics.entity;

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
 * @Description: 中小学实验室基本情况统计表（三）
 * @Date:   2023-07-07
 * @Version: V1.0
 */
@Data
@TableName("school_lab_basic_info_3")
@Accessors(chain = true)
@EqualsAndHashCode(callSuper = false)
@ApiModel(value="school_lab_basic_info_3对象", description="中小学实验室基本情况统计表（三）")
public class SchoolLabBasicInfo_3 implements Serializable {
    private static final long serialVersionUID = 1L;

	/**主键*/
	@TableId(type = IdType.ASSIGN_ID)
    @ApiModelProperty(value = "主键")
    private java.lang.String id;
	/**标识代码*/
	@Excel(name = "学校名称", width = 15, dictTable = "organization_definition", dicText = "institution_name", dicCode = "identification_code")
	@Dict(dictTable = "organization_definition", dicText = "institution_name", dicCode = "identification_code")
    @ApiModelProperty(value = "标识代码")
    private java.lang.String identificationCode;
	/**填报日期*/
	@Excel(name = "填报日期", width = 15, format = "yyyy-MM-dd")
	@JsonFormat(timezone = "GMT+8",pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern="yyyy-MM-dd")
    @ApiModelProperty(value = "填报日期")
    private java.util.Date fillDate;
	/**物理实验室间数*/
	@Excel(name = "物理实验室间数", width = 15)
    @ApiModelProperty(value = "物理实验室间数")
    private java.lang.Integer physicsLabRoomNum;
	/**物理实验室面积*/
	@Excel(name = "物理实验室面积", width = 15)
    @ApiModelProperty(value = "物理实验室面积")
    private java.lang.Double physicsLabArea;
	/**物理实验室实验桌(张)*/
	@Excel(name = "物理实验室实验桌(张)", width = 15)
    @ApiModelProperty(value = "物理实验室实验桌(张)")
    private java.lang.Integer physicsLabBenchNum;
	/**物理器材、准备室间数*/
	@Excel(name = "物理器材、准备室间数", width = 15)
    @ApiModelProperty(value = "物理器材、准备室间数")
    private java.lang.Integer physicsEquipmentRoomNum;
	/**物理器材、准备室面积*/
	@Excel(name = "物理器材、准备室面积", width = 15)
    @ApiModelProperty(value = "物理器材、准备室面积")
    private java.lang.Double physicsEquipmentRoomArea;
	/**物理器材、准备室仪器柜(口)*/
	@Excel(name = "物理器材、准备室仪器柜(口)", width = 15)
    @ApiModelProperty(value = "物理器材、准备室仪器柜(口)")
    private java.lang.Integer physicsEquipmentCabinetNum;
	/**物理器材、准备室准备台(个)*/
	@Excel(name = "物理器材、准备室准备台(个)", width = 15)
    @ApiModelProperty(value = "物理器材、准备室准备台(个)")
    private java.lang.Integer physicsEquipmentBenchNum;
	/**化学（生化）实验室间数*/
	@Excel(name = "化学（生化）实验室间数", width = 15)
    @ApiModelProperty(value = "化学（生化）实验室间数")
    private java.lang.Integer biochemistryLabRoomNum;
	/**化学（生化）实验室面积*/
	@Excel(name = "化学（生化）实验室面积", width = 15)
    @ApiModelProperty(value = "化学（生化）实验室面积")
    private java.lang.Double biochemistryLabArea;
	/**化学（生化）实验室实验桌(张)*/
	@Excel(name = "化学（生化）实验室实验桌(张)", width = 15)
    @ApiModelProperty(value = "化学（生化）实验室实验桌(张)")
    private java.lang.Integer biochemistryLabBenchNum;
	/**化学（生化）器材、准备室间数*/
	@Excel(name = "化学（生化）器材、准备室间数", width = 15)
    @ApiModelProperty(value = "化学（生化）器材、准备室间数")
    private java.lang.Integer biochemistryEquipRoomNum;
	/**化学（生化）器材、准备室面积*/
	@Excel(name = "化学（生化）器材、准备室面积", width = 15)
    @ApiModelProperty(value = "化学（生化）器材、准备室面积")
    private java.lang.Double biochemistryEquipRoomArea;
	/**化学（生化）器材、准备室仪器柜(口)*/
	@Excel(name = "化学（生化）器材、准备室仪器柜(口)", width = 15)
    @ApiModelProperty(value = "化学（生化）器材、准备室仪器柜(口)")
    private java.lang.Integer biochemistryEquipCabinetNum;
	/**化学（生化）器材、准备室准备台(个)*/
	@Excel(name = "化学（生化）器材、准备室准备台(个)", width = 15)
    @ApiModelProperty(value = "化学（生化）器材、准备室准备台(个)")
    private java.lang.Integer biochemistryEquipBenchNum;
	/**科学实验室间数*/
	@Excel(name = "科学实验室间数", width = 15)
    @ApiModelProperty(value = "科学实验室间数")
    private java.lang.Integer scienceLabRoomNum;
	/**科学实验室面积*/
	@Excel(name = "科学实验室面积", width = 15)
    @ApiModelProperty(value = "科学实验室面积")
    private java.lang.Double scienceLabArea;
	/**科学实验室实验桌(张)*/
	@Excel(name = "科学实验室实验桌(张)", width = 15)
    @ApiModelProperty(value = "科学实验室实验桌(张)")
    private java.lang.Integer scienceLabBenchNum;
	/**科学器材、准备室间数*/
	@Excel(name = "科学器材、准备室间数", width = 15)
    @ApiModelProperty(value = "科学器材、准备室间数")
    private java.lang.Integer scienceEquipmentRoomNum;
	/**科学器材、准备室面积*/
	@Excel(name = "科学器材、准备室面积", width = 15)
    @ApiModelProperty(value = "科学器材、准备室面积")
    private java.lang.Double scienceEquipmentRoomArea;
	/**科学器材、准备室仪器柜(口)*/
	@Excel(name = "科学器材、准备室仪器柜(口)", width = 15)
    @ApiModelProperty(value = "科学器材、准备室仪器柜(口)")
    private java.lang.Integer scienceEquipmentCabinetNum;
	/**科学器材、准备室准备台(个)*/
	@Excel(name = "科学器材、准备室准备台(个)", width = 15)
    @ApiModelProperty(value = "科学器材、准备室准备台(个)")
    private java.lang.Integer scienceEquipmentBenchNum;
	/**危化品专柜数量(口)*/
	@Excel(name = "危化品专柜数量(口)", width = 15)
    @ApiModelProperty(value = "危化品专柜数量(口)")
    private java.lang.Integer hazardousChemicalCabinetNum;
	/**专职实验员人数*/
	@Excel(name = "专职实验员人数", width = 15)
    @ApiModelProperty(value = "专职实验员人数")
    private java.lang.Integer fullTimeLabTechnicianNum;
	/**兼职实验员人数*/
	@Excel(name = "兼职实验员人数", width = 15)
    @ApiModelProperty(value = "兼职实验员人数")
    private java.lang.Integer partTimeLabTechnicianNum;
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
