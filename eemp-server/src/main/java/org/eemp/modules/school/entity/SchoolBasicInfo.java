package org.eemp.modules.school.entity;

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
import org.jeecgframework.poi.excel.annotation.Excel;
import org.springframework.format.annotation.DateTimeFormat;

/**
 * @Description: 学校基本信息
 * @Author: jeecg-boot
 * @Date:   2023-02-24
 * @Version: V1.0
 */
@Data
@TableName("school_basic_info")
@Accessors(chain = true)
@EqualsAndHashCode(callSuper = false)
@ApiModel(value="school_basic_info对象", description="学校基本信息")
public class SchoolBasicInfo implements Serializable {
    private static final long serialVersionUID = 1L;

	/**主键*/
	@TableId(type = IdType.ASSIGN_ID)
    @ApiModelProperty(value = "主键")
    private java.lang.String id;
	/**机构标识代码*/
	@Excel(name = "机构标识代码", width = 15)
    @ApiModelProperty(value = "机构标识代码")
    private java.lang.String identificationCode;
	/**学校名称*/
	@Excel(name = "学校名称", width = 15)
    @ApiModelProperty(value = "学校名称")
    private java.lang.String schoolName;
	/**教育阶段*/
	@Excel(name = "教育阶段", width = 15)
    @ApiModelProperty(value = "教育阶段")
    private java.lang.String educationalPhase;
	/**办学类型*/
	@Excel(name = "办学类型", width = 15)
    @ApiModelProperty(value = "办学类型")
    private java.lang.String schoolType;
	/**地址*/
	@Excel(name = "地址", width = 15)
    @ApiModelProperty(value = "地址")
    private java.lang.String address;
	/**联系人名称*/
	@Excel(name = "联系人名称", width = 15)
    @ApiModelProperty(value = "联系人名称")
    private java.lang.String contactPersonName;
	/**联系电话*/
	@Excel(name = "联系电话", width = 15)
    @ApiModelProperty(value = "联系电话")
    private java.lang.String contactPhoneNumber;
	/**小学生人数*/
	@Excel(name = "小学生人数", width = 15)
    @ApiModelProperty(value = "小学生人数")
    private java.lang.Integer numberOfPupils;
	/**初中生人数*/
	@Excel(name = "初中生人数", width = 15)
    @ApiModelProperty(value = "初中生人数")
    private java.lang.Integer numberOfJuniors;
	/**高中生人数*/
	@Excel(name = "高中生人数", width = 15)
    @ApiModelProperty(value = "高中生人数")
    private java.lang.Integer numberOfSeniors;
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
