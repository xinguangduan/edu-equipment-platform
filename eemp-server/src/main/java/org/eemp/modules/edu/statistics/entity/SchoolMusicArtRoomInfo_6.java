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
 * @Description: 中小学音乐、美术教学用房统计表（六）
 * @Date:   2023-07-15
 * @Version: V1.0
 */
@Data
@TableName("school_music_art_room_info_6")
@Accessors(chain = true)
@EqualsAndHashCode(callSuper = false)
@ApiModel(value="school_music_art_room_info_6对象", description="中小学音乐、美术教学用房统计表（六）")
public class SchoolMusicArtRoomInfo_6 implements Serializable {
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
	/**音乐器材室间数*/
	@Excel(name = "音乐器材室间数", width = 15)
    @ApiModelProperty(value = "音乐器材室间数")
    private java.lang.Integer musicEquipmentRoomNum;
	/**音乐器材室面积（m2）*/
	@Excel(name = "音乐器材室面积（m2）", width = 15)
    @ApiModelProperty(value = "音乐器材室面积（m2）")
    private java.lang.Double musicEquipmentRoomArea;
	/**音乐器材室器材件数*/
	@Excel(name = "音乐器材室器材件数", width = 15)
    @ApiModelProperty(value = "音乐器材室器材件数")
    private java.lang.Integer musicEquipmentNum;
	/**音乐教室间数*/
	@Excel(name = "音乐教室间数", width = 15)
    @ApiModelProperty(value = "音乐教室间数")
    private java.lang.Integer musicClassroomNum;
	/**音乐教室面积（m2）*/
	@Excel(name = "音乐教室面积（m2）", width = 15)
    @ApiModelProperty(value = "音乐教室面积（m2）")
    private java.lang.Double musicClassroomArea;
	/**舞蹈室间数*/
	@Excel(name = "舞蹈室间数", width = 15)
    @ApiModelProperty(value = "舞蹈室间数")
    private java.lang.Integer musicDanceRoomNum;
	/**舞蹈室面积（m2）*/
	@Excel(name = "舞蹈室面积（m2）", width = 15)
    @ApiModelProperty(value = "舞蹈室面积（m2）")
    private java.lang.Double musicDanceRoomArea;
	/**专职音乐教师（人）*/
	@Excel(name = "专职音乐教师（人）", width = 15)
    @ApiModelProperty(value = "专职音乐教师（人）")
    private java.lang.Integer fullTimeMusicTeacherNum;
	/**兼职音乐教师（人）*/
	@Excel(name = "兼职音乐教师（人）", width = 15)
    @ApiModelProperty(value = "兼职音乐教师（人）")
    private java.lang.Integer partTimeMusicTeacherNum;
	/**美术教室间数*/
	@Excel(name = "美术教室间数", width = 15)
    @ApiModelProperty(value = "美术教室间数")
    private java.lang.Integer artClassroomNum;
	/**美术教室面积（m2）*/
	@Excel(name = "美术教室面积（m2）", width = 15)
    @ApiModelProperty(value = "美术教室面积（m2）")
    private java.lang.Double artClassroomArea;
	/**美术器材室间数*/
	@Excel(name = "美术器材室间数", width = 15)
    @ApiModelProperty(value = "美术器材室间数")
    private java.lang.Integer artEquipmentNum;
	/**美术器材室面积（m2）*/
	@Excel(name = "美术器材室面积（m2）", width = 15)
    @ApiModelProperty(value = "美术器材室面积（m2）")
    private java.lang.Double artEquipmentArea;
	/**专职美术教师（人）*/
	@Excel(name = "专职美术教师（人）", width = 15)
    @ApiModelProperty(value = "专职美术教师（人）")
    private java.lang.Integer fullTimeArtTeacherNum;
	/**兼职美术教师（人）*/
	@Excel(name = "兼职美术教师（人）", width = 15)
    @ApiModelProperty(value = "兼职美术教师（人）")
    private java.lang.Integer partTimeArtTeacherNum;
	/**书法教室间数*/
	@Excel(name = "书法教室间数", width = 15)
    @ApiModelProperty(value = "书法教室间数")
    private java.lang.Integer calligraphyClassroomNum;
	/**书法教室面积（m2）*/
	@Excel(name = "书法教室面积（m2）", width = 15)
    @ApiModelProperty(value = "书法教室面积（m2）")
    private java.lang.Double calligraphyClassroomArea;
	/**书法教室桌椅数（张）*/
	@Excel(name = "书法教室桌椅数（张）", width = 15)
    @ApiModelProperty(value = "书法教室桌椅数（张）")
    private java.lang.Integer calligraphyDeskNum;
	/**是否配备书法软件系统*/
	@Excel(name = "是否配备书法软件系统", width = 15, dicCode = "yn")
	@Dict(dicCode = "yn")
    @ApiModelProperty(value = "是否配备书法软件系统")
    private java.lang.String hasACalligraphySystem;
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
