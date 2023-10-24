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
 * @Description: 中小学功能室用房统计表（七）
 * @Date:   2023-07-15
 * @Version: V1.0
 */
@Data
@TableName("school_functional_room_info_7")
@Accessors(chain = true)
@EqualsAndHashCode(callSuper = false)
@ApiModel(value="school_functional_room_info_7对象", description="中小学功能室用房统计表（七）")
public class SchoolFunctionalRoomInfo_7 implements Serializable {
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
	/**综合实践室间数*/
	@Excel(name = "综合实践室间数", width = 15)
    @ApiModelProperty(value = "综合实践室间数")
    private java.lang.Integer integratedPracticeRoomNum;
	/**综合实践室面积（m2）*/
	@Excel(name = "综合实践室面积（m2）", width = 15)
    @ApiModelProperty(value = "综合实践室面积（m2）")
    private java.lang.Double integratedPracticeRoomArea;
	/**综合实践室器材件数*/
	@Excel(name = "综合实践室器材件数", width = 15)
    @ApiModelProperty(value = "综合实践室器材件数")
    private java.lang.Integer integratedEquipmentNum;
	/**计算机教室间数*/
	@Excel(name = "计算机教室间数", width = 15)
    @ApiModelProperty(value = "计算机教室间数")
    private java.lang.Integer computerClassroomNum;
	/**计算机教室面积（m2）*/
	@Excel(name = "计算机教室面积（m2）", width = 15)
    @ApiModelProperty(value = "计算机教室面积（m2）")
    private java.lang.Double computerClassroomArea;
	/**多功能会议室（演播室）间数*/
	@Excel(name = "多功能会议室（演播室）间数", width = 15)
    @ApiModelProperty(value = "多功能会议室（演播室）间数")
    private java.lang.Integer multifunctionalRoomNum;
	/**多功能会议室（演播室）面积（m2）*/
	@Excel(name = "多功能会议室（演播室）面积（m2）", width = 15)
    @ApiModelProperty(value = "多功能会议室（演播室）面积（m2）")
    private java.lang.Double multifunctionalRoomArea;
	/**多功能会议室（演播室）座位数*/
	@Excel(name = "多功能会议室（演播室）座位数", width = 15)
    @ApiModelProperty(value = "多功能会议室（演播室）座位数")
    private java.lang.Integer multifunctionalSeatNum;
	/**录播教室间数*/
	@Excel(name = "录播教室间数", width = 15)
    @ApiModelProperty(value = "录播教室间数")
    private java.lang.Integer recordingClassroomNum;
	/**录播教室面积（m2）*/
	@Excel(name = "录播教室面积（m2）", width = 15)
    @ApiModelProperty(value = "录播教室面积（m2）")
    private java.lang.Double recordingClassroomArea;
	/**观摩教室间数*/
	@Excel(name = "观摩教室间数", width = 15)
    @ApiModelProperty(value = "观摩教室间数")
    private java.lang.Integer observationClassroomNum;
	/**观摩教室面积（m2）*/
	@Excel(name = "观摩教室面积（m2）", width = 15)
    @ApiModelProperty(value = "观摩教室面积（m2）")
    private java.lang.Double observationClassroomArea;
	/**观摩教室座位数*/
	@Excel(name = "观摩教室座位数", width = 15)
    @ApiModelProperty(value = "观摩教室座位数")
    private java.lang.Integer observationSeatNum;
	/**创客教室间数*/
	@Excel(name = "创客教室间数", width = 15)
    @ApiModelProperty(value = "创客教室间数")
    private java.lang.Integer makerClassroomNum;
	/**创客教室面积（m2）*/
	@Excel(name = "创客教室面积（m2）", width = 15)
    @ApiModelProperty(value = "创客教室面积（m2）")
    private java.lang.Double makerClassroomArea;
	/**创客教室器材件数*/
	@Excel(name = "创客教室器材件数", width = 15)
    @ApiModelProperty(value = "创客教室器材件数")
    private java.lang.Integer makerEquipmentNum;
	/**特色功能室一名称*/
	@Excel(name = "特色功能室一名称", width = 15)
    @ApiModelProperty(value = "特色功能室一名称")
    private java.lang.String firstFeaturedRoomName;
	/**特色功能室一间数*/
	@Excel(name = "特色功能室一间数", width = 15)
    @ApiModelProperty(value = "特色功能室一间数")
    private java.lang.Integer firstFeaturedRoomNum;
	/**特色功能室一面积（m2）*/
	@Excel(name = "特色功能室一面积（m2）", width = 15)
    @ApiModelProperty(value = "特色功能室一面积（m2）")
    private java.lang.Double firstFeaturedRoomArea;
	/**特色功能室二名称*/
	@Excel(name = "特色功能室二名称", width = 15)
    @ApiModelProperty(value = "特色功能室二名称")
    private java.lang.String secondFeaturedRoomName;
	/**特色功能室二间数*/
	@Excel(name = "特色功能室二间数", width = 15)
    @ApiModelProperty(value = "特色功能室二间数")
    private java.lang.Integer secondFeaturedRoomNum;
	/**特色功能室二面积（m2）*/
	@Excel(name = "特色功能室二面积（m2）", width = 15)
    @ApiModelProperty(value = "特色功能室二面积（m2）")
    private java.lang.Double secondFeaturedRoomArea;
    /**上报状态*/
    @ApiModelProperty(value = "上报状态")
    private Integer reported;
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
