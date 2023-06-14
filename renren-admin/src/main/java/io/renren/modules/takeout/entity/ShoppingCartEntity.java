package io.renren.modules.takeout.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

/**
 * 购物车
 *
 * @author zyx
 * @since 1.0.0 2023-06-09
 */
@Data
@TableName("shopping_cart")
public class ShoppingCartEntity {

    /**
     * 主键
     */
	private Long id;
    /**
     * 名称
     */
	private String name;
    /**
     * 图片
     */
	private String image;
    /**
     * 主键
     */
	private Long userId;
    /**
     * 菜品id
     */
	private Long dishId;
    /**
     * 套餐id
     */
	private Long setmealId;
    /**
     * 口味
     */
	private String dishFlavor;
    /**
     * 数量
     */
	private Integer number;
    /**
     * 金额
     */
	private BigDecimal amount;
    /**
     * 创建者
     */
	private Long creator;
    /**
     * 创建时间
     */
	private Date createDate;
    /**
     * 更新者
     */
	private Long updater;
    /**
     * 更新时间
     */
	private Date updateDate;
}