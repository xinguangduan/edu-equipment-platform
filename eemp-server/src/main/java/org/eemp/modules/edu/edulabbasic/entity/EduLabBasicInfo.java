package org.eemp.modules.edu.edulabbasic.entity;

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
 * @Description: 中小学实验室基本情况统计表
 * @Author: jeecg-boot
 * @Date:   2023-04-16
 * @Version: V1.0
 */
@Data
@TableName("edu_lab_basic_info")
@Accessors(chain = true)
@EqualsAndHashCode(callSuper = false)
@ApiModel(value="edu_lab_basic_info对象", description="中小学实验室基本情况统计表")
public class EduLabBasicInfo implements Serializable {
    private static final long serialVersionUID = 1L;

	/**主键*/
	@TableId(type = IdType.ASSIGN_ID)
    @ApiModelProperty(value = "主键")
    private java.lang.String id;
	/**学校*/
	@Excel(name = "学校", width = 15)
    @ApiModelProperty(value = "学校")
    private java.lang.String school;
	/**课程*/
	@Excel(name = "课程", width = 15, dicCode = "course_code")
	@Dict(dicCode = "course_code")
    @ApiModelProperty(value = "课程")
    private java.lang.String course;
	/**实验室-面积*/
	@Excel(name = "实验室-面积", width = 15)
    @ApiModelProperty(value = "实验室-面积")
    private java.lang.Double labArea;
	/**实验室-间数*/
	@Excel(name = "实验室-间数", width = 15)
    @ApiModelProperty(value = "实验室-间数")
    private java.lang.Integer labRoomNum;
	/**准备室-面积*/
	@Excel(name = "准备室-面积", width = 15)
    @ApiModelProperty(value = "准备室-面积")
    private java.lang.Double preparationRoomArea;
	/**准备室-间数*/
	@Excel(name = "准备室-间数", width = 15)
    @ApiModelProperty(value = "准备室-间数")
    private java.lang.Integer preparationRoomNum;
	/**仪器保管室-面积*/
	@Excel(name = "仪器保管室-面积", width = 15)
    @ApiModelProperty(value = "仪器保管室-面积")
    private java.lang.Double instrumentStorageRoomArea;
	/**仪器保管室-间数*/
	@Excel(name = "仪器保管室-间数", width = 15)
    @ApiModelProperty(value = "仪器保管室-间数")
    private java.lang.Integer instrumentStorageRoomNum;
	/**实验员-人数*/
	@Excel(name = "实验员-人数", width = 15)
    @ApiModelProperty(value = "实验员-人数")
    private java.lang.Integer experimenterCount;
	/**实验员-专职*/
	@Excel(name = "实验员-专职", width = 15)
    @ApiModelProperty(value = "实验员-专职")
    private java.lang.Integer experimenterFulltime;
	/**实验员-兼职*/
	@Excel(name = "实验员-兼职", width = 15)
    @ApiModelProperty(value = "实验员-兼职")
    private java.lang.Integer experimenterParttime;
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
