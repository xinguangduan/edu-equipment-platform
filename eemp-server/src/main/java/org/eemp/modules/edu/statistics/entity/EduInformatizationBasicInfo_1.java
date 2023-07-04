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
 * @Description: 教育信息化基本情况统计表（一）
 * @Date:   2023-06-04
 * @Version: V1.0
 */
@Data
@TableName("edu_informatization_basic_info_1")
@Accessors(chain = true)
@EqualsAndHashCode(callSuper = false)
@ApiModel(value="edu_informatization_basic_info_1对象", description="教育信息化基本情况统计表（一）")
public class EduInformatizationBasicInfo_1 implements Serializable {
    private static final long serialVersionUID = 1L;

	/**主键*/
	@TableId(type = IdType.ASSIGN_ID)
    @ApiModelProperty(value = "主键")
    private String id;
	/**标识代码*/
	@Excel(name = "学校名称", width = 15, dictTable = "organization_definition", dicText = "institution_name", dicCode = "identification_code")
	@Dict(dictTable = "organization_definition", dicText = "institution_name", dicCode = "identification_code")
    @ApiModelProperty(value = "标识代码")
    private String identificationCode;
    /**填报日期*/
    @Excel(name = "填报日期", width = 15, format = "yyyy-MM-dd")
    @JsonFormat(timezone = "GMT+8",pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern="yyyy-MM-dd")
    @ApiModelProperty(value = "填报日期")
    private java.util.Date fillDate;
	/**任课教师总数（人）*/
	@Excel(name = "任课教师总数（人）", width = 15)
    @ApiModelProperty(value = "任课教师总数（人）")
    private Integer teacherCount;
	/**学生总数（人）*/
	@Excel(name = "学生总数（人）", width = 15)
    @ApiModelProperty(value = "学生总数（人）")
    private Integer studentCount;
	/**教室（含功能室）总数（间）*/
	@Excel(name = "教室（含功能室）总数（间）", width = 15)
    @ApiModelProperty(value = "教室（含功能室）总数（间）")
    private Integer roomCount;
	/**班级教室总数（间）*/
	@Excel(name = "班级教室总数（间）", width = 15)
    @ApiModelProperty(value = "班级教室总数（间）")
    private Integer classroomCount;
	/**学生课桌椅可用数（套）*/
	@Excel(name = "学生课桌椅可用数（套）", width = 15)
    @ApiModelProperty(value = "学生课桌椅可用数（套）")
    private Integer studentDeskCount;
	/**已入网教室数（间）*/
	@Excel(name = "已入网教室数（间）", width = 15)
    @ApiModelProperty(value = "已入网教室数（间）")
    private Integer connectedRoomCount;
	/**是否建设网络中心机房*/
	@Excel(name = "是否建设网络中心机房", width = 15, dicCode = "yn")
	@Dict(dicCode = "yn")
    @ApiModelProperty(value = "是否建设网络中心机房")
    private String hasACentralServerRoom;
	/**学校资源库教学资源容量（GB）*/
	@Excel(name = "学校资源库教学资源容量（GB）", width = 15)
    @ApiModelProperty(value = "学校资源库教学资源容量（GB）")
    private Double teachingResourceCapacity;
	/**创建人*/
    @ApiModelProperty(value = "创建人")
    private String createBy;
	/**创建日期*/
	@JsonFormat(timezone = "GMT+8",pattern = "yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    @ApiModelProperty(value = "创建日期")
    private java.util.Date createTime;
	/**更新人*/
    @ApiModelProperty(value = "更新人")
    private String updateBy;
	/**更新日期*/
	@JsonFormat(timezone = "GMT+8",pattern = "yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    @ApiModelProperty(value = "更新日期")
    private java.util.Date updateTime;
	/**所属部门*/
    @ApiModelProperty(value = "所属部门")
    private String sysOrgCode;
}
