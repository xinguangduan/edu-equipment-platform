package org.eemp.modules.edu.edusportsmusicartrooms.entity;

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
import org.eemp.common.poi.excel.annotation.Excel;
import org.springframework.format.annotation.DateTimeFormat;

/**
 * @Description: 中小学体育音乐美术教学用房统计表
 * @Author: jeecg-boot
 * @Date:   2023-04-16
 * @Version: V1.0
 */
@Data
@TableName("edu_sports_music_art_rooms")
@Accessors(chain = true)
@EqualsAndHashCode(callSuper = false)
@ApiModel(value="edu_sports_music_art_rooms对象", description="中小学体育音乐美术教学用房统计表")
public class EduSportsMusicArtRooms implements Serializable {
    private static final long serialVersionUID = 1L;

	/**主键*/
	@TableId(type = IdType.ASSIGN_ID)
    @ApiModelProperty(value = "主键")
    private java.lang.String id;
	/**学校*/
	@Excel(name = "学校", width = 15)
    @ApiModelProperty(value = "学校")
    private java.lang.String school;
	/**室内操场间数*/
	@Excel(name = "室内操场间数", width = 15)
    @ApiModelProperty(value = "室内操场间数")
    private java.lang.Integer sportsIndoorPlaygroundNum;
	/**室内操场面积*/
	@Excel(name = "室内操场面积", width = 15)
    @ApiModelProperty(value = "室内操场面积")
    private java.lang.Double sportsIndoorPlaygroundArea;
	/**体育器材室间数*/
	@Excel(name = "体育器材室间数", width = 15)
    @ApiModelProperty(value = "体育器材室间数")
    private java.lang.Integer sportsEquipmentRoomNum;
	/**体育器材室面积*/
	@Excel(name = "体育器材室面积", width = 15)
    @ApiModelProperty(value = "体育器材室面积")
    private java.lang.Double sportsEquipmentRoomArea;
	/**体质测试室间数*/
	@Excel(name = "体质测试室间数", width = 15)
    @ApiModelProperty(value = "体质测试室间数")
    private java.lang.Integer sportsTestingRoomNum;
	/**体质测试室面积*/
	@Excel(name = "体质测试室面积", width = 15)
    @ApiModelProperty(value = "体质测试室面积")
    private java.lang.Double sportsTestingRoomArea;
	/**心理咨询室间数*/
	@Excel(name = "心理咨询室间数", width = 15)
    @ApiModelProperty(value = "心理咨询室间数")
    private java.lang.Integer sportsCounselingRoomNum;
	/**心理咨询室面积*/
	@Excel(name = "心理咨询室面积", width = 15)
    @ApiModelProperty(value = "心理咨询室面积")
    private java.lang.Double sportsCounselingRoomArea;
	/**音乐教室间数*/
	@Excel(name = "音乐教室间数", width = 15)
    @ApiModelProperty(value = "音乐教室间数")
    private java.lang.Integer musicClassroomNum;
	/**音乐教室面积*/
	@Excel(name = "音乐教室面积", width = 15)
    @ApiModelProperty(value = "音乐教室面积")
    private java.lang.Double musicClassroomArea;
	/**音乐器材室间数*/
	@Excel(name = "音乐器材室间数", width = 15)
    @ApiModelProperty(value = "音乐器材室间数")
    private java.lang.Integer musicEquipmentRoomNum;
	/**音乐器材室面积*/
	@Excel(name = "音乐器材室面积", width = 15)
    @ApiModelProperty(value = "音乐器材室面积")
    private java.lang.Double musicEquipmentRoomArea;
	/**舞蹈室间数*/
	@Excel(name = "舞蹈室间数", width = 15)
    @ApiModelProperty(value = "舞蹈室间数")
    private java.lang.Integer musicDanceRoomNum;
	/**舞蹈室面积*/
	@Excel(name = "舞蹈室面积", width = 15)
    @ApiModelProperty(value = "舞蹈室面积")
    private java.lang.Double musicDanceRoomArea;
	/**音乐排练室间数*/
	@Excel(name = "音乐排练室间数", width = 15)
    @ApiModelProperty(value = "音乐排练室间数")
    private java.lang.Integer musicRehearsalRoomNum;
	/**音乐排练室面积*/
	@Excel(name = "音乐排练室面积", width = 15)
    @ApiModelProperty(value = "音乐排练室面积")
    private java.lang.Double musicRehearsalRoomArea;
	/**美术教室间数*/
	@Excel(name = "美术教室间数", width = 15)
    @ApiModelProperty(value = "美术教室间数")
    private java.lang.Integer artEquipmentNum;
	/**美术教室面积*/
	@Excel(name = "美术教室面积", width = 15)
    @ApiModelProperty(value = "美术教室面积")
    private java.lang.Double artEquipmentArea;
	/**美术器材室间数*/
	@Excel(name = "美术器材室间数", width = 15)
    @ApiModelProperty(value = "美术器材室间数")
    private java.lang.Integer artClassroomNum;
	/**美术器材室面积*/
	@Excel(name = "美术器材室面积", width = 15)
    @ApiModelProperty(value = "美术器材室面积")
    private java.lang.Double artClassroomArea;
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
