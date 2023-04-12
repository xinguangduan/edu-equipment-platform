package org.eemp.modules.equipmentregister.entity;

import java.io.Serializable;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.math.BigDecimal;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.TableLogic;
import lombok.Data;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;
import org.jeecgframework.poi.excel.annotation.Excel;
import org.jeecg.common.aspect.annotation.Dict;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * @Description: 小学设备登记信息
 * @Author: jeecg-boot
 * @Date:   2023-04-12
 * @Version: V1.0
 */
@Data
@TableName("edu_equipment_register_basic_info")
@Accessors(chain = true)
@EqualsAndHashCode(callSuper = false)
@ApiModel(value="edu_equipment_register_basic_info对象", description="小学设备登记信息")
public class EduEquipmentRegisterBasicInfo implements Serializable {
    private static final long serialVersionUID = 1L;

	/**主键*/
	@TableId(type = IdType.ASSIGN_ID)
    @ApiModelProperty(value = "主键")
    private java.lang.String id;
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
	/**学校*/
	@Excel(name = "学校", width = 15)
    @ApiModelProperty(value = "学校")
    private java.lang.String school;
	/**校长*/
	@Excel(name = "校长", width = 15)
    @ApiModelProperty(value = "校长")
    private java.lang.String principal;
	/**分管校长*/
	@Excel(name = "分管校长", width = 15)
    @ApiModelProperty(value = "分管校长")
    private java.lang.String vicePrincipal;
	/**实验员*/
	@Excel(name = "实验员", width = 15)
    @ApiModelProperty(value = "实验员")
    private java.lang.String experimenter;
	/**网络管理员*/
	@Excel(name = "网络管理员", width = 15)
    @ApiModelProperty(value = "网络管理员")
    private java.lang.String networkManager;
	/**图书管理员*/
	@Excel(name = "图书管理员", width = 15)
    @ApiModelProperty(value = "图书管理员")
    private java.lang.String librarian;
	/**体音美管理员*/
	@Excel(name = "体音美管理员", width = 15)
    @ApiModelProperty(value = "体音美管理员")
    private java.lang.String minorManager;
}
