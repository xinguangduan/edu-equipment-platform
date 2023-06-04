package org.eemp.modules.edu.primaryequipmentreqtemplate.entity;

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
import org.eemp.common.poi.excel.annotation.Excel;
import org.springframework.format.annotation.DateTimeFormat;

/**
 * @Description: 小学器材设施配备要求模板表
 * @Author: jeecg-boot
 * @Date:   2023-06-04
 * @Version: V1.0
 */
@Data
@TableName("edu_primary_equipment_req_template")
@Accessors(chain = true)
@EqualsAndHashCode(callSuper = false)
@ApiModel(value="edu_primary_equipment_req_template对象", description="小学器材设施配备要求模板表")
public class EduPrimaryEquipmentReqTemplate implements Serializable {
    private static final long serialVersionUID = 1L;

	/**主键*/
	@TableId(type = IdType.ASSIGN_ID)
    @ApiModelProperty(value = "主键")
    private String id;
	/**年级*/
	@Excel(name = "年级", width = 15)
    @ApiModelProperty(value = "年级")
    private String grade;
	/**时段代码*/
	@Excel(name = "时段代码", width = 15)
    @ApiModelProperty(value = "时段代码")
    private String phaseCode;
	/**名称*/
	@Excel(name = "名称", width = 15)
    @ApiModelProperty(value = "名称")
    private String name;
	/**分类代码*/
	@Excel(name = "分类代码", width = 15)
    @ApiModelProperty(value = "分类代码")
    private String categoryCode;
	/**规格型号功能*/
	@Excel(name = "规格型号功能", width = 15)
    @ApiModelProperty(value = "规格型号功能")
    private String specModelFunc;
	/**单位*/
	@Excel(name = "单位", width = 15)
    @ApiModelProperty(value = "单位")
    private String unit;
	/**数量*/
	@Excel(name = "数量", width = 15)
    @ApiModelProperty(value = "数量")
    private String quantity;
	/**配备要求*/
	@Excel(name = "配备要求", width = 15)
    @ApiModelProperty(value = "配备要求")
    private String equipmentRequirement;
	/**执行标准代号*/
	@Excel(name = "执行标准代号", width = 15)
    @ApiModelProperty(value = "执行标准代号")
    private String executiveStandardCode;
	/**备注*/
	@Excel(name = "备注", width = 15)
    @ApiModelProperty(value = "备注")
    private String remark;
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
