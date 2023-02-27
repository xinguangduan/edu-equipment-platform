package org.eemp.modules.school.entity;

import java.io.Serializable;
import java.util.Date;

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
 * @Description: 学校信息管理
 * @Author: jeecg-boot
 * @Date: 2023-02-23
 * @Version: V1.0
 */
@Data
@TableName("school_info")
@Accessors(chain = true)
@EqualsAndHashCode(callSuper = false)
@ApiModel(value = "school_info对象", description = "学校信息管理")
public class SchoolInfo implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    @TableId(type = IdType.ASSIGN_ID)
    @ApiModelProperty(value = "主键")
    private String id;
    /**
     * 创建人
     */
    @ApiModelProperty(value = "创建人")
    private String createBy;
    /**
     * 创建日期
     */
    @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @ApiModelProperty(value = "创建日期")
    private Date createTime;
    /**
     * 更新人
     */
    @ApiModelProperty(value = "更新人")
    private String updateBy;
    /**
     * 更新日期
     */
    @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @ApiModelProperty(value = "更新日期")
    private Date updateTime;
    /**
     * 所属部门
     */
    @ApiModelProperty(value = "所属部门")
    private String sysOrgCode;
    /**
     * 学校名称
     */
    @Excel(name = "学校名称", width = 15)
    @ApiModelProperty(value = "学校名称")
    private String name;
    /**
     * 学校地址
     */
    @Excel(name = "学校地址", width = 15)
    @ApiModelProperty(value = "学校地址")
    private String address;
    /**
     * 学生人数
     */
    @Excel(name = "学生人数", width = 15)
    @ApiModelProperty(value = "学生人数")
    private Integer studentCount;
    /**
     * 教师人数
     */
    @Excel(name = "教师人数", width = 15)
    @ApiModelProperty(value = "教师人数")
    private Integer teacherCount;
    /**
     * 图书馆数
     */
    @Excel(name = "图书馆数", width = 15)
    @ApiModelProperty(value = "图书馆数")
    private Integer libraryCount;
    /**
     * 食堂数
     */
    @Excel(name = "食堂数", width = 15)
    @ApiModelProperty(value = "食堂数")
    private Integer canteenCount;
}
