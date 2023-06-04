package org.eemp.modules.edu.eduinformatizationbasic.entity;

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
 * @Description: 教育信息化基本情况统计表
 * @Author: jeecg-boot
 * @Date:   2023-04-16
 * @Version: V1.0
 */
@Data
@TableName("edu_informatization_basic_info")
@Accessors(chain = true)
@EqualsAndHashCode(callSuper = false)
@ApiModel(value="edu_informatization_basic_info对象", description="教育信息化基本情况统计表")
public class EduInformatizationBasicInfo implements Serializable {
    private static final long serialVersionUID = 1L;

	/**主键*/
	@TableId(type = IdType.ASSIGN_ID)
    @ApiModelProperty(value = "主键")
    private java.lang.String id;
	/**学校*/
	@Excel(name = "学校", width = 15)
    @ApiModelProperty(value = "学校")
    private java.lang.String school;
	/**班级数*/
	@Excel(name = "班级数", width = 15)
    @ApiModelProperty(value = "班级数")
    private java.lang.Integer classesCount;
	/**学生数*/
	@Excel(name = "学生数", width = 15)
    @ApiModelProperty(value = "学生数")
    private java.lang.Integer studentCount;
	/**教师数*/
	@Excel(name = "教师数", width = 15)
    @ApiModelProperty(value = "教师数")
    private java.lang.Integer teacherCount;
	/**教师用机*/
	@Excel(name = "教师用机", width = 15)
    @ApiModelProperty(value = "教师用机")
    private java.lang.Integer computerTechearNum;
	/**学生用机*/
	@Excel(name = "学生用机", width = 15)
    @ApiModelProperty(value = "学生用机")
    private java.lang.Integer computerStudentNum;
	/**班班通投影*/
	@Excel(name = "班班通投影", width = 15)
    @ApiModelProperty(value = "班班通投影")
    private java.lang.Integer projectionModeNum;
	/**班班通触控机*/
	@Excel(name = "班班通触控机", width = 15)
    @ApiModelProperty(value = "班班通触控机")
    private java.lang.Integer touchModeNum;
	/**班班通电视电脑*/
	@Excel(name = "班班通电视电脑", width = 15)
    @ApiModelProperty(value = "班班通电视电脑")
    private java.lang.Integer tvComputerModeNum;
	/**网关*/
	@Excel(name = "网关", width = 15)
    @ApiModelProperty(value = "网关")
    private java.lang.Integer gatewayNum;
	/**千兆路由器*/
	@Excel(name = "千兆路由器", width = 15)
    @ApiModelProperty(value = "千兆路由器")
    private java.lang.Integer router1000Num;
	/**百兆路由*/
	@Excel(name = "百兆路由", width = 15)
    @ApiModelProperty(value = "百兆路由")
    private java.lang.Integer router100Num;
	/**服务器*/
	@Excel(name = "服务器", width = 15)
    @ApiModelProperty(value = "服务器")
    private java.lang.Integer serverNum;
	/**网路计入点*/
	@Excel(name = "网路计入点", width = 15)
    @ApiModelProperty(value = "网路计入点")
    private java.lang.Integer networkPortNum;
	/**无线路由器*/
	@Excel(name = "无线路由器", width = 15)
    @ApiModelProperty(value = "无线路由器")
    private java.lang.Integer wifiRouterNum;
	/**无线AP*/
	@Excel(name = "无线AP", width = 15)
    @ApiModelProperty(value = "无线AP")
    private java.lang.Integer wifiApNum;
	/**其他设备*/
	@Excel(name = "其他设备", width = 15)
    @ApiModelProperty(value = "其他设备")
    private java.lang.Integer otherDeviceNum;
	/**千兆交换机*/
	@Excel(name = "千兆交换机", width = 15)
    @ApiModelProperty(value = "千兆交换机")
    private java.lang.String switch1000Num;
	/**无线管理设备*/
	@Excel(name = "无线管理设备", width = 15)
    @ApiModelProperty(value = "无线管理设备")
    private java.lang.Integer wifiManagerNum;
	/**录播室(间)*/
	@Excel(name = "录播室(间)", width = 15)
    @ApiModelProperty(value = "录播室(间)")
    private java.lang.Integer recordingRoomNum;
	/**多功能会议室容纳人数*/
	@Excel(name = "多功能会议室容纳人数", width = 15)
    @ApiModelProperty(value = "多功能会议室容纳人数")
    private java.lang.Integer meetingRoomNum;
	/**多功能会议室面积*/
	@Excel(name = "多功能会议室面积", width = 15)
    @ApiModelProperty(value = "多功能会议室面积")
    private java.lang.Double meetingRoomArea;
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
