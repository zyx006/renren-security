package io.renren.modules.front.dto;

import io.renren.modules.front.bean.SetmealDish;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * @author : 张宇轩
 * @createTime : 2023/6/2 - 15:54
 */
@Data
@NoArgsConstructor
public class SetmealDishDTO extends SetmealDish implements Serializable {
    private String image;
}
