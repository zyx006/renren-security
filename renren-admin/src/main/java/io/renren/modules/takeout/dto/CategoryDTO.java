package io.renren.modules.takeout.dto;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;


/**
 * 菜品及套餐分类
 *
 * @author zyx
 * @since 1.0.0 2023-06-09
 */
@Data
@ApiModel(value = "菜品及套餐分类")
public class CategoryDTO implements Serializable {
    private static final long serialVersionUID = 1L;

	@ApiModelProperty(value = "主键")
	private Long id;

	@ApiModelProperty(value = "类型   1 菜品分类 2 套餐分类")
	private Integer type;

	@ApiModelProperty(value = "分类名称")
	private String name;

	@ApiModelProperty(value = "顺序")
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

}