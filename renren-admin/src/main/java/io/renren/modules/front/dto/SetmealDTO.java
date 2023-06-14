package io.renren.modules.front.dto;

import io.renren.modules.front.bean.Setmeal;
import io.renren.modules.front.bean.SetmealDish;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * @author : 张宇轩
 * @createTime : 2023/6/1 - 11:17
 */
@Data
@NoArgsConstructor
public class SetmealDTO extends Setmeal implements Serializable {
    private List<SetmealDish> setmealDishes = new ArrayList<>();

    private String categoryName;
}
