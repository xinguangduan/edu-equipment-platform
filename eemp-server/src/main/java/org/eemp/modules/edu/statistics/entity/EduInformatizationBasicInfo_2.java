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
 * @Description: 教育信息化基本情况统计表（二）
 * @Date:   2023-07-07
 * @Version: V1.0
 */
@Data
@TableName("edu_informatization_basic_info_2")
@Accessors(chain = true)
@EqualsAndHashCode(callSuper = false)
@ApiModel(value="edu_informatization_basic_info_2对象", description="教育信息化基本情况统计表（二）")
public class EduInformatizationBasicInfo_2 implements Serializable {
    private static final long serialVersionUID = 1L;

	/**主键*/
	@TableId(type = IdType.ASSIGN_ID)
    @ApiModelProperty(value = "主键")
    private java.lang.String id;
	/**标识代码*/
	@Excel(name = "学校名称", width = 15, dictTable = "organization_definition", dicText = "institution_name", dicCode = "identification_code")
	@Dict(dictTable = "organization_definition", dicText = "institution_name", dicCode = "identification_code")
    @ApiModelProperty(value = "标识代码")
    private java.lang.String identificationCode;
	/**填报日期*/
	@Excel(name = "填报日期", width = 15, format = "yyyy-MM-dd")
	@JsonFormat(timezone = "GMT+8",pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern="yyyy-MM-dd")
    @ApiModelProperty(value = "填报日期")
    private java.util.Date fillDate;
	/**分管领导姓名*/
	@Excel(name = "分管领导姓名", width = 15)
    @ApiModelProperty(value = "分管领导姓名")
    private java.lang.String subLeaderName;
	/**分管领导联系电话*/
	@Excel(name = "分管领导联系电话", width = 15)
    @ApiModelProperty(value = "分管领导联系电话")
    private java.lang.String subLeaderPhoneNumber;
	/**校园网络管理员姓名*/
	@Excel(name = "校园网络管理员姓名", width = 15)
    @ApiModelProperty(value = "校园网络管理员姓名")
    private java.lang.String campusNetworkAdminName;
	/**校园网络管理员联系电话*/
	@Excel(name = "校园网络管理员联系电话", width = 15)
    @ApiModelProperty(value = "校园网络管理员联系电话")
    private java.lang.String campusNetworkPhoneNumber;
	/**计算机室管理员姓名*/
	@Excel(name = "计算机室管理员姓名", width = 15)
    @ApiModelProperty(value = "计算机室管理员姓名")
    private java.lang.String computerRoomAdminName;
	/**计算机室管理员联系电话*/
	@Excel(name = "计算机室管理员联系电话", width = 15)
    @ApiModelProperty(value = "计算机室管理员联系电话")
    private java.lang.String computerRoomPhoneNumber;
	/**“班班通”管理员姓名*/
	@Excel(name = "“班班通”管理员姓名", width = 15)
    @ApiModelProperty(value = "“班班通”管理员姓名")
    private java.lang.String classConnectAdminName;
	/**“班班通”管理员联系电话*/
	@Excel(name = "“班班通”管理员联系电话", width = 15)
    @ApiModelProperty(value = "“班班通”管理员联系电话")
    private java.lang.String classConnectPhoneNumber;
	/**智慧教育平台管理员姓名*/
	@Excel(name = "智慧教育平台管理员姓名", width = 15)
    @ApiModelProperty(value = "智慧教育平台管理员姓名")
    private java.lang.String smartEducationAdminName;
	/**智慧教育平台管理员联系电话*/
	@Excel(name = "智慧教育平台管理员联系电话", width = 15)
    @ApiModelProperty(value = "智慧教育平台管理员联系电话")
    private java.lang.String smartEducationPhoneNumber;
	/**宣传平台名称*/
	@Excel(name = "宣传平台名称", width = 15)
    @ApiModelProperty(value = "宣传平台名称")
    private java.lang.String propagandaPlatformName;
	/**宣传平台责任人*/
	@Excel(name = "宣传平台责任人", width = 15)
    @ApiModelProperty(value = "宣传平台责任人")
    private java.lang.String propagandaPlatformOwner;
	/**本年设备维护投入资金（万元）*/
	@Excel(name = "本年设备维护投入资金（万元）", width = 15)
    @ApiModelProperty(value = "本年设备维护投入资金（万元）")
    private java.lang.Double equipmentFundsThisYear;
	/**信息技术专职教师人数*/
	@Excel(name = "信息技术专职教师人数", width = 15)
    @ApiModelProperty(value = "信息技术专职教师人数")
    private java.lang.Integer fullTimeTeacherNum;
	/**信息技术兼职教师人数*/
	@Excel(name = "信息技术兼职教师人数", width = 15)
    @ApiModelProperty(value = "信息技术兼职教师人数")
    private java.lang.Integer partTimeTeacherNum;
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
