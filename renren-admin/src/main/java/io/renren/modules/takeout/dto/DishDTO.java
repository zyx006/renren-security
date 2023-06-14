package io.renren.modules.takeout.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * 菜品管理
 *
 * @author zyx
 * @since 1.0.0 2023-06-09
 */
@Data
@ApiModel(value = "菜品管理")
public class DishDTO implements Serializable {
    private static final long serialVersionUID = 1L;

	@ApiModelProperty(value = "主键")
	private Long id;

	@ApiModelProperty(value = "菜品名称")
	private String name;

	@ApiModelProperty(value = "菜品分类id")
	private Long categoryId;

	@ApiModelProperty(value = "菜品价格")
	private BigDecimal price;

	@ApiModelProperty(value = "商品码")
	private String code;

	@ApiModelProperty(value = "图片")
	private String image;

	@ApiModelProperty(value = "描述信息")
	private String description;

	@ApiModelProperty(value = "0 停售 1 起售")
	private Integer status;

	@ApiModelProperty(value = "顺序")
	private Integer sort;

	@ApiModelProperty(value = "创建人")
	private Long creator;

	@ApiModelProperty(value = "创建时间")
	private Date createDate;

	@ApiModelProperty(value = "修改人")
	private Long updater;

	@ApiModelProperty(value = "更新时间")
	private Date updateDate;

	@ApiModelProperty(value = "是否删除")
	private Integer isDeleted;


}