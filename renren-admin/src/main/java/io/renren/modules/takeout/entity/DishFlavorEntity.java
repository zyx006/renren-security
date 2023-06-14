package io.renren.modules.takeout.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.util.Date;

/**
 * 菜品口味关系表
 *
 * @author zyx
 * @since 1.0.0 2023-06-09
 */
@Data
@TableName("dish_flavor")
public class DishFlavorEntity {

    /**
     * 主键
     */
	private Long id;
    /**
     * 菜品
     */
	private Long dishId;
    /**
     * 口味名称
     */
	private String name;
    /**
     * 口味数据list
     */
	private String value;
    /**
     * 创建人
     */
	private Long creator;
    /**
     * 创建时间
     */
	private Date createDate;
    /**
     * 修改人
     */
	private Long updater;
    /**
     * 更新时间
     */
	private Date updateDate;
    /**
     * 是否删除
     */
	private Integer isDeleted;
}