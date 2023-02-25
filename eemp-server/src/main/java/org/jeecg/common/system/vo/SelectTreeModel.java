package org.jeecg.common.system.vo;

import java.io.Serializable;
import java.util.List;

import lombok.Data;

/**
 * 下拉树 model
 *
 * @author jeecg-boot
 */
@Data
public class SelectTreeModel implements Serializable {

    private String key;
    private String title;
    private String value;
    /**
     * 父Id
     */
    private String parentId;
    /**
     * 是否是叶节点
     */
    private boolean isLeaf;
    /**
     * 子节点
     */
    private List<SelectTreeModel> children;

}
