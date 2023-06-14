package io.renren.modules.front.dto;

import io.renren.modules.front.bean.Dish;
import io.renren.modules.front.bean.DishFlavor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * @author : 张宇轩
 * @createTime : 2023/5/31 - 14:30
 */
@Data
@NoArgsConstructor
public class DishDTO extends Dish implements Serializable {
    //口味的集合
    private List<DishFlavor> flavors = new ArrayList<>();

    //分类的名称 与前端elementUI的prop属性一致
    private String categoryName;
}
