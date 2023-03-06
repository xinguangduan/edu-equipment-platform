package org.eemp.modules.functional.entity;

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
 * @Description: 功能室信息
 * @Author: jeecg-boot
 * @Date:   2023-02-24
 * @Version: V1.0
 */
@Data
@TableName("functional_classroom_info")
@Accessors(chain = true)
@EqualsAndHashCode(callSuper = false)
@ApiModel(value="functional_classroom_info对象", description="功能室信息")
public class FunctionalClassroomInfo implements Serializable {
    private static final long serialVersionUID = 1L;

	/**主键*/
	@TableId(type = IdType.ASSIGN_ID)
    @ApiModelProperty(value = "主键")
    private java.lang.String id;
	/**学校标识代码*/
	@Excel(name = "学校标识代码", width = 15)
    @ApiModelProperty(value = "学校标识代码")
    private java.lang.String identificationCode;
	/**教室名称*/
	@Excel(name = "教室名称", width = 15)
    @ApiModelProperty(value = "教室名称")
    private java.lang.String classroomName;
	/**设备数量*/
	@Excel(name = "设备数量", width = 15)
    @ApiModelProperty(value = "设备数量")
    private java.lang.Integer deviceNumber;
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
