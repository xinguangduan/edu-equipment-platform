package org.eemp.modules.system.vo.lowapp;

import java.util.List;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;
import org.eemp.modules.system.entity.SysDictItem;

@Data
public class SysDictVo {
    /**
     * 字典id
     */
    @TableId(type = IdType.ASSIGN_ID)
    private String id;

    /**
     * 字典名称
     */
    private String dictName;

    /**
     * 字典编码
     */
    private String dictCode;

    /**
     * 应用id
     */
    private String lowAppId;

    /**
     * 字典子项
     */
    private List<SysDictItem> dictItemsList;
}
