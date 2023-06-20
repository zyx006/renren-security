package io.renren.modules.takeout.dto;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import io.renren.modules.front.bean.Dish;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 套餐菜品关系
 *
 * @author zyx
 * @since 1.0.0 2023-06-09
 */
@Data
@ApiModel(value = "套餐菜品关系")
public class SetmealDishDTO implements Serializable {
    private static final long serialVersionUID = 1L;

	@ApiModelProperty(value = "主键")
	private Long id;

	@ApiModelProperty(value = "套餐id ")
	private String setmealId;

	@ApiModelProperty(value = "菜品id")
	private String dishId;

	@ApiModelProperty(value = "菜品名称 （冗余字段）")
	private String name;

	@ApiModelProperty(value = "菜品原价（冗余字段）")
	private BigDecimal price;

	@ApiModelProperty(value = "份数")
	private Integer copies;

	@ApiModelProperty(value = "排序")
	private Integer sort;

	@ApiModelProperty(value = "创建人")
	@TableField(fill = FieldFill.INSERT)
	private Long creator;

	@ApiModelProperty(value = "创建时间")
	@TableField(fill = FieldFill.INSERT)
	private Date createDate;

	@ApiModelProperty(value = "修改人")
	@TableField(fill = FieldFill.INSERT_UPDATE)
	private Long updater;

	@ApiModelProperty(value = "更新时间")
	@TableField(fill = FieldFill.INSERT_UPDATE)
	private Date updateDate;

	@ApiModelProperty(value = "是否删除")
	private Integer isDeleted;



}