package io.renren.modules.takeout.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

/**
 * 套餐
 *
 * @author zyx
 * @since 1.0.0 2023-06-09
 */
@Data
@TableName("setmeal")
public class SetmealEntity {

    /**
     * 主键
     */
	private Long id;
    /**
     * 菜品分类id
     */
	private Long categoryId;
    /**
     * 套餐名称
     */
	private String name;
    /**
     * 套餐价格
     */
	private BigDecimal price;
    /**
     * 状态 0:停用 1:启用
     */
	private Integer status;
    /**
     * 编码
     */
	private String code;
    /**
     * 描述信息
     */
	private String description;
    /**
     * 图片
     */
	private String image;
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