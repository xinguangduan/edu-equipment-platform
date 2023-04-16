package org.eemp.modules.edu.eduequipmentregister.entity;

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
 * @Description: 小学教学仪器设备登记册
 * @Author: jeecg-boot
 * @Date:   2023-04-16
 * @Version: V1.0
 */
@Data
@TableName("edu_equipment_register_info")
@Accessors(chain = true)
@EqualsAndHashCode(callSuper = false)
@ApiModel(value="edu_equipment_register_info对象", description="小学教学仪器设备登记册")
public class EduEquipmentRegisterInfo implements Serializable {
    private static final long serialVersionUID = 1L;

	/**主键*/
	@TableId(type = IdType.ASSIGN_ID)
    @ApiModelProperty(value = "主键")
    private String id;
	/**学校*/
	@Excel(name = "学校", width = 15)
    @ApiModelProperty(value = "学校")
    private String school;
	/**校长*/
	@Excel(name = "校长", width = 15)
    @ApiModelProperty(value = "校长")
    private String principal;
	/**分管校长*/
	@Excel(name = "分管校长", width = 15)
    @ApiModelProperty(value = "分管校长")
    private String vicePrincipal;
	/**实验员*/
	@Excel(name = "实验员", width = 15)
    @ApiModelProperty(value = "实验员")
    private String experimenter;
	/**网络管理员*/
	@Excel(name = "网络管理员", width = 15)
    @ApiModelProperty(value = "网络管理员")
    private String networkManager;
	/**图书管理员*/
	@Excel(name = "图书管理员", width = 15)
    @ApiModelProperty(value = "图书管理员")
    private String librarian;
	/**体音美管理员*/
	@Excel(name = "体音美管理员", width = 15)
    @ApiModelProperty(value = "体音美管理员")
    private String minorManager;
	/**所属部门*/
    @ApiModelProperty(value = "所属部门")
    private String sysOrgCode;
	/**创建人*/
    @ApiModelProperty(value = "创建人")
    private String createBy;
	/**创建日期*/
	@JsonFormat(timezone = "GMT+8",pattern = "yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    @ApiModelProperty(value = "创建日期")
    private Date createTime;
	/**更新人*/
    @ApiModelProperty(value = "更新人")
    private String updateBy;
	/**更新日期*/
	@JsonFormat(timezone = "GMT+8",pattern = "yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    @ApiModelProperty(value = "更新日期")
    private Date updateTime;
}
