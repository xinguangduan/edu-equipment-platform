package org.eemp.modules.edu.primaryartequipment.entity;

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
import org.springframework.format.annotation.DateTimeFormat;

/**
 * @Description: 小学美术教学器材配备标准
 * @Author: jeecg-boot
 * @Date: 2023-08-27
 * @Version: V1.0
 */
@Data
@TableName("edu_primary_art_equipment")
@Accessors(chain = true)
@EqualsAndHashCode(callSuper = false)
@ApiModel(value = "edu_primary_art_equipment对象", description = "小学美术教学器材配备标准")
public class EduPrimaryArtEquipment implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    @TableId(type = IdType.ASSIGN_ID)
    @ApiModelProperty(value = "主键")
    private java.lang.String id;
    /**
     * 学校
     */
    @ApiModelProperty(value = "学校")
    private java.lang.String school;

    /**
     * 文件日期
     */
    @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @ApiModelProperty(value = "文件日期")
    private Date fileDate;
    /**
     * 文件名字
     */
    @ApiModelProperty(value = "文件名字")
    private String fileName;
    /**
     * 文件大小
     */
    @ApiModelProperty(value = "文件大小")
    private Integer fileSize;
    /**
     * 文件数据
     */
    private byte[] fileData;

    /**
     * 备注
     */
    @ApiModelProperty(value = "备注")
    private java.lang.String remark;
    /**
     * 所属部门
     */
    @ApiModelProperty(value = "所属部门")
    private java.lang.String sysOrgCode;
    /**
     * 创建人
     */
    @ApiModelProperty(value = "创建人")
    private java.lang.String createBy;
    /**
     * 创建日期
     */
    @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @ApiModelProperty(value = "创建日期")
    private java.util.Date createTime;
    /**
     * 更新人
     */
    @ApiModelProperty(value = "更新人")
    private java.lang.String updateBy;
    /**
     * 更新日期
     */
    @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @ApiModelProperty(value = "更新日期")
    private java.util.Date updateTime;
}