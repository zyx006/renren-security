package io.renren.modules.front.bean;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * 套餐菜品关系(SetmealDish)表实体类
 *
 * @author 张宇轩
 * @since 2023-06-13 13:03:56
 */
@Data
@NoArgsConstructor
@TableName("setmeal_dish")
public class SetmealDish implements Serializable {

    /**
     * 主键
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 套餐id
     */
    private String setmealId;

    /**
     * 菜品id
     */
    private String dishId;

    /**
     * 菜品名称 （冗余字段）
     */
    private String name;

    /**
     * 菜品原价（冗余字段）
     */
    private Double price;

    /**
     * 份数
     */
    private Integer copies;

    /**
     * 排序
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
    private LocalDateTime createDate;

    /**
     * 修改人
     */
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private Long updater;

    /**
     * 更新时间
     */
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime updateDate;

    /**
     * 是否删除
     */
    private Integer isDeleted;

}
