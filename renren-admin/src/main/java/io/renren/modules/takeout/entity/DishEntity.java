package io.renren.modules.takeout.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

/**
 * 菜品管理
 *
 * @author zyx
 * @since 1.0.0 2023-06-09
 */
@Data
@TableName("dish")
public class DishEntity {

    /**
     * 主键
     */
	private Long id;
    /**
     * 菜品名称
     */
	private String name;
    /**
     * 菜品分类id
     */
	private Long categoryId;
    /**
     * 菜品价格
     */
	private BigDecimal price;
    /**
     * 商品码
     */
	private String code;
    /**
     * 图片
     */
	private String image;
    /**
     * 描述信息
     */
	private String description;
    /**
     * 0 停售 1 起售
     */
	private Integer status;
    /**
     * 顺序
     */
	private Integer sort;
    /**
     * 创建人
     */
    @TableField(fill = FieldFill.INSERT)
    private Long creator;
    /**
     * 创建时间
     */
    @TableField(fill = FieldFill.INSERT)
    private Date createDate;
    /**
     * 修改人
     */
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private Long updater;
    /**
     * 更新时间
     */
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private Date updateDate;
    /**
     * 是否删除
     */
	private Integer isDeleted;
}