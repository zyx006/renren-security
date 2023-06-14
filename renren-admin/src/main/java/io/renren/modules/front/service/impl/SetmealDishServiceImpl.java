package io.renren.modules.front.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.modules.front.bean.SetmealDish;
import io.renren.modules.front.dao.SetmealDishMapper;
import io.renren.modules.front.service.SetmealDishService;
import org.springframework.stereotype.Service;

/**
 * 套餐菜品关系(SetmealDish)表服务实现类
 *
 * @author 张宇轩
 * @since 2023-05-29 11:08:45
 */
@Service(value = "setmealDishServiceImplFront")
public class SetmealDishServiceImpl extends ServiceImpl<SetmealDishMapper, SetmealDish> implements SetmealDishService {
}
