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
 * @Description: 中小学体育用房统计表（五）
 * @Date:   2023-07-15
 * @Version: V1.0
 */
@Data
@TableName("school_sport_room_info_5")
@Accessors(chain = true)
@EqualsAndHashCode(callSuper = false)
@ApiModel(value="school_sport_room_info_5对象", description="中小学体育用房统计表（五）")
public class SchoolSportRoomInfo_5 implements Serializable {
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
	/**室内操场（风雨活动室）间数*/
	@Excel(name = "室内操场（风雨活动室）间数", width = 15)
    @ApiModelProperty(value = "室内操场（风雨活动室）间数")
    private java.lang.Integer indoorPlaygroundNum;
	/**室内操场（风雨活动室）面积（m2）*/
	@Excel(name = "室内操场（风雨活动室）面积（m2）", width = 15)
    @ApiModelProperty(value = "室内操场（风雨活动室）面积（m2）")
    private java.lang.Double indoorPlaygroundArea;
	/**室外操场直跑道长度m*/
	@Excel(name = "室外操场直跑道长度m", width = 15)
    @ApiModelProperty(value = "室外操场直跑道长度m")
    private java.lang.Double straightTrackLength;
	/**室外操场环形跑道周长m*/
	@Excel(name = "室外操场环形跑道周长m", width = 15)
    @ApiModelProperty(value = "室外操场环形跑道周长m")
    private java.lang.Double circularTrackCircumference;
	/**室外操场操场是否硬化*/
	@Excel(name = "室外操场操场是否硬化", width = 15, dicCode = "yn")
	@Dict(dicCode = "yn")
    @ApiModelProperty(value = "室外操场操场是否硬化")
    private java.lang.String isThePlaygroundHardened;
	/**室外操场是否有塑胶操场*/
	@Excel(name = "室外操场是否有塑胶操场", width = 15, dicCode = "yn")
	@Dict(dicCode = "yn")
    @ApiModelProperty(value = "室外操场是否有塑胶操场")
    private java.lang.String hasAPlasticPlayground;
	/**室外操场是否有塑胶跑道*/
	@Excel(name = "室外操场是否有塑胶跑道", width = 15, dicCode = "yn")
	@Dict(dicCode = "yn")
    @ApiModelProperty(value = "室外操场是否有塑胶跑道")
    private java.lang.String hasAPlasticTrack;
	/**室外操场蓝球场（个）*/
	@Excel(name = "室外操场蓝球场（个）", width = 15)
    @ApiModelProperty(value = "室外操场蓝球场（个）")
    private java.lang.Integer basketballCourtNum;
	/**室外操场排球场（个）*/
	@Excel(name = "室外操场排球场（个）", width = 15)
    @ApiModelProperty(value = "室外操场排球场（个）")
    private java.lang.Integer volleyballCourtNum;
	/**室外操场足球场面积（m2）*/
	@Excel(name = "室外操场足球场面积（m2）", width = 15)
    @ApiModelProperty(value = "室外操场足球场面积（m2）")
    private java.lang.Double soccerFieldArea;
	/**室外操场操场面积（m2）*/
	@Excel(name = "室外操场操场面积（m2）", width = 15)
    @ApiModelProperty(value = "室外操场操场面积（m2）")
    private java.lang.Double playgroundArea;
	/**体育器材室间数*/
	@Excel(name = "体育器材室间数", width = 15)
    @ApiModelProperty(value = "体育器材室间数")
    private java.lang.Integer sportsEquipmentRoomNum;
	/**体育器材室面积（m2）*/
	@Excel(name = "体育器材室面积（m2）", width = 15)
    @ApiModelProperty(value = "体育器材室面积（m2）")
    private java.lang.Double sportsEquipmentRoomArea;
	/**体育器材室器材件数*/
	@Excel(name = "体育器材室器材件数", width = 15)
    @ApiModelProperty(value = "体育器材室器材件数")
    private java.lang.Integer sportsEquipmentNum;
	/**体质测试室间数*/
	@Excel(name = "体质测试室间数", width = 15)
    @ApiModelProperty(value = "体质测试室间数")
    private java.lang.Integer sportsTestingRoomNum;
	/**体质测试室面积（m2）*/
	@Excel(name = "体质测试室面积（m2）", width = 15)
    @ApiModelProperty(value = "体质测试室面积（m2）")
    private java.lang.Double sportsTestingRoomArea;
	/**体质测试室器材件数*/
	@Excel(name = "体质测试室器材件数", width = 15)
    @ApiModelProperty(value = "体质测试室器材件数")
    private java.lang.Integer sportsTestingEquipmentNum;
	/**心理咨询室间数*/
	@Excel(name = "心理咨询室间数", width = 15)
    @ApiModelProperty(value = "心理咨询室间数")
    private java.lang.Integer sportsCounselingRoomNum;
	/**心理咨询室面积（m2）*/
	@Excel(name = "心理咨询室面积（m2）", width = 15)
    @ApiModelProperty(value = "心理咨询室面积（m2）")
    private java.lang.Double sportsCounselingRoomArea;
	/**专职体育教师（人）*/
	@Excel(name = "专职体育教师（人）", width = 15)
    @ApiModelProperty(value = "专职体育教师（人）")
    private java.lang.Integer fullTimePeTeacherNum;
	/**兼职体育教师（人）*/
	@Excel(name = "兼职体育教师（人）", width = 15)
    @ApiModelProperty(value = "兼职体育教师（人）")
    private java.lang.Integer partTimePeTeacherNum;
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
