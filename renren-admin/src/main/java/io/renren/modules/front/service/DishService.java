package io.renren.modules.front.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.modules.front.bean.Dish;
import io.renren.modules.front.dto.DishDTO;

/**
 * 菜品管理(Dish)表服务接口
 *
 * @author 张宇轩
 * @since 2023-05-29 11:08:44
 */
public interface DishService extends IService<Dish> {
    void saveDishFlavor(DishDTO dishDTO);

    void updateDishFlavor(DishDTO dishDTO);
}
