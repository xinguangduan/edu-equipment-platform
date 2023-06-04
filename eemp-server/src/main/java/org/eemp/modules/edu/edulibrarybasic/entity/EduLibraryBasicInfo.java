package org.eemp.modules.edu.edulibrarybasic.entity;

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
 * @Description: 中小学图书室基本情况统计表
 * @Author: jeecg-boot
 * @Date:   2023-04-16
 * @Version: V1.0
 */
@Data
@TableName("edu_library_basic_info")
@Accessors(chain = true)
@EqualsAndHashCode(callSuper = false)
@ApiModel(value="edu_library_basic_info对象", description="中小学图书室基本情况统计表")
public class EduLibraryBasicInfo implements Serializable {
    private static final long serialVersionUID = 1L;

	/**主键*/
	@TableId(type = IdType.ASSIGN_ID)
    @ApiModelProperty(value = "主键")
    private java.lang.String id;
	/**学校*/
	@Excel(name = "学校", width = 15)
    @ApiModelProperty(value = "学校")
    private java.lang.String school;
	/**藏书室面积*/
	@Excel(name = "藏书室面积", width = 15)
    @ApiModelProperty(value = "藏书室面积")
    private java.lang.Double libraryArea;
	/**藏书室藏书架(个)*/
	@Excel(name = "藏书室藏书架(个)", width = 15)
    @ApiModelProperty(value = "藏书室藏书架(个)")
    private java.lang.Integer libraryRack;
	/**学生阅览室面积*/
	@Excel(name = "学生阅览室面积", width = 15)
    @ApiModelProperty(value = "学生阅览室面积")
    private java.lang.Double readingRoomNum;
	/**学生阅览室阅览桌*/
	@Excel(name = "学生阅览室阅览桌", width = 15)
    @ApiModelProperty(value = "学生阅览室阅览桌")
    private java.lang.Integer readingTableNum;
	/**学生阅览室阅览凳*/
	@Excel(name = "学生阅览室阅览凳", width = 15)
    @ApiModelProperty(value = "学生阅览室阅览凳")
    private java.lang.Integer readingStoolNum;
	/**教师阅览室面积*/
	@Excel(name = "教师阅览室面积", width = 15)
    @ApiModelProperty(value = "教师阅览室面积")
    private java.lang.Double teacherReadingRoomArea;
	/**藏书册数*/
	@Excel(name = "藏书册数", width = 15)
    @ApiModelProperty(value = "藏书册数")
    private java.lang.Integer books;
	/**生均册数*/
	@Excel(name = "生均册数", width = 15)
    @ApiModelProperty(value = "生均册数")
    private java.lang.Double avgBooks;
	/**投入金额(万元)*/
	@Excel(name = "投入金额(万元)", width = 15)
    @ApiModelProperty(value = "投入金额(万元)")
    private java.lang.Double investmentAmount;
	/**管理人员人数*/
	@Excel(name = "管理人员人数", width = 15)
    @ApiModelProperty(value = "管理人员人数")
    private java.lang.Integer managerNum;
	/**管理人员专职*/
	@Excel(name = "管理人员专职", width = 15)
    @ApiModelProperty(value = "管理人员专职")
    private java.lang.Integer managerFulltimeNum;
	/**管理人员兼职*/
	@Excel(name = "管理人员兼职", width = 15)
    @ApiModelProperty(value = "管理人员兼职")
    private java.lang.Integer managerParttimeNum;
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
