package io.renren.modules.takeout.dto;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;


/**
 * 菜品口味关系表
 *
 * @author zyx
 * @since 1.0.0 2023-06-09
 */
@Data
@ApiModel(value = "菜品口味关系表")
public class DishFlavorDTO implements Serializable {
    private static final long serialVersionUID = 1L;

	@ApiModelProperty(value = "主键")
	private Long id;

	@ApiModelProperty(value = "菜品")
	private Long dishId;

	@ApiModelProperty(value = "口味名称")
	private String name;

	@ApiModelProperty(value = "口味数据list")
	private String value;

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