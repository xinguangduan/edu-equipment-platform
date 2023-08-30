package org.eemp.modules.edu.primaryartequipment.entity;

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
 * @Description: 小学美术教学器材配备标准
 * @Author: jeecg-boot
 * @Date:   2023-08-27
 * @Version: V1.0
 */
@Data
@TableName("edu_primary_art_equipment")
@Accessors(chain = true)
@EqualsAndHashCode(callSuper = false)
@ApiModel(value="edu_primary_art_equipment对象", description="小学美术教学器材配备标准")
public class EduPrimaryArtEquipment implements Serializable {
    private static final long serialVersionUID = 1L;

	/**主键*/
	@TableId(type = IdType.ASSIGN_ID)
    @ApiModelProperty(value = "主键")
    private java.lang.String id;
	/**学校*/
	@Excel(name = "学校", width = 15)
    @ApiModelProperty(value = "学校")
    private java.lang.String school;
	/**文件名字*/
	@Excel(name = "文件名字", width = 15, dicCode = "equipment_requirement_code")
	@Dict(dicCode = "equipment_requirement_code")
    @ApiModelProperty(value = "文件名字")
    private java.lang.String fileName;
	/**文件大小*/
	@Excel(name = "文件大小", width = 15)
    @ApiModelProperty(value = "文件大小")
    private java.lang.Integer fileSize;
	/**文件数据*/
	@Excel(name = "文件数据", width = 15, dicCode = "executive_standard_code")
	@Dict(dicCode = "executive_standard_code")
    private transient java.lang.String fileDataString;

    private byte[] fileData;

    public byte[] getFileData(){
        if(fileDataString==null){
            return null;
        }
        try {
            return fileDataString.getBytes("UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return null;
    }

    public String getFileDataString(){
        if(fileData==null || fileData.length==0){
            return "";
        }
        try {
            return new String(fileData,"UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return "";
    }
	/**备注*/
	@Excel(name = "备注", width = 15)
    @ApiModelProperty(value = "备注")
    private java.lang.String remark;
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
