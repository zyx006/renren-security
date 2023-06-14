package io.renren.modules.front.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.modules.front.bean.Category;
import io.renren.modules.front.bean.Dish;
import io.renren.modules.front.bean.Setmeal;
import io.renren.modules.front.common.CustomException;
import io.renren.modules.front.dao.CategoryMapper;
import io.renren.modules.front.service.CategoryService;
import io.renren.modules.front.service.DishService;
import io.renren.modules.front.service.SetmealService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 菜品及套餐分类(Category)表服务实现类
 *
 * @author 张宇轩
 * @since 2023-05-29 11:08:44
 */
@Service(value = "categoryServiceImplFront")
@Transactional
public class CategoryServiceImpl extends ServiceImpl<CategoryMapper, Category> implements CategoryService {

    @Autowired
    private DishService dishService;
    @Autowired
    private SetmealService setmealService;

    @Override
    public void removeCateById(Long cateId) {
        //判断当前分类下，是否有菜品信息，如果有则不能删除
        LambdaQueryWrapper<Dish> lqw = new LambdaQueryWrapper<>();
        lqw.eq(Dish::getCategoryId, cateId);
        long dishCount = dishService.count(lqw);
        if (dishCount > 0) {
            throw new CustomException("当前分类下有菜品信息，不能删除！");
        }
        //判断当前分类下，是否有套餐信息，如果有则不能删除
        LambdaQueryWrapper<Setmeal> lqw1 = new LambdaQueryWrapper<>();
        lqw1.eq(Setmeal::getCategoryId, cateId);
        long setmealCount = setmealService.count(lqw1);
        if(setmealCount > 0){
            throw new CustomException("当前分类下有套餐信息，不能删除！");
        }
        //删除当前分类信息
        this.removeById(cateId);
    }
}
