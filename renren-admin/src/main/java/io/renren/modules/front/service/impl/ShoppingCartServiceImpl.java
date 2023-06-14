package io.renren.modules.front.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.modules.front.bean.Dish;
import io.renren.modules.front.bean.Setmeal;
import io.renren.modules.front.bean.ShoppingCart;
import io.renren.modules.front.dao.ShoppingCartMapper;
import io.renren.modules.front.service.DishService;
import io.renren.modules.front.service.SetmealService;
import io.renren.modules.front.service.ShoppingCartService;
import io.renren.modules.front.utils.BaseContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
 * 购物车(ShoppingCart)表服务实现类
 *
 * @author 张宇轩
 * @since 2023-05-29 11:08:45
 */
@Service(value = "shoppingCartServiceImplFront")
public class ShoppingCartServiceImpl extends ServiceImpl<ShoppingCartMapper, ShoppingCart> implements ShoppingCartService {
    @Autowired
    DishService dishService;
    @Autowired
    SetmealService setmealService;
    @Override
    public ShoppingCart add(ShoppingCart shoppingCart) {
        //查询当前购物车的菜品/套餐是否在数据库存在
        //若存在则number+1，否则添加到购物车表中
        //1.1.查询当前用户的购物车信息
        LambdaQueryWrapper<ShoppingCart> lqw = new LambdaQueryWrapper<>();
        lqw.eq(ShoppingCart::getUserId, BaseContext.getCurrentId());
        //1.2.判断查询的是菜品还是套餐
        Long dishId = shoppingCart.getDishId();
        if(dishId != null){
            Dish dish = dishService.getById(dishId);
            shoppingCart.setAmount(BigDecimal.valueOf(dish.getPrice()));
            lqw.eq(ShoppingCart::getDishId, dishId);
        } else {
            Setmeal setmeal = setmealService.getById(shoppingCart.getSetmealId());
            shoppingCart.setAmount(BigDecimal.valueOf(setmeal.getPrice()));
            lqw.eq(ShoppingCart::getSetmealId, shoppingCart.getSetmealId());
        }
        //1.3.执行查询
        ShoppingCart cart = this.getOne(lqw);
        //2 如果存在，数量+1
        if(cart != null){
            cart.setNumber(cart.getNumber()+1);
            this.updateById(cart);
        } else {

            //3 不存在，添加到购物车表中
            shoppingCart.setCreateDate(LocalDateTime.now());
            shoppingCart.setUserId(BaseContext.getCurrentId());
            shoppingCart.setNumber(1);
            this.save(shoppingCart);
            cart = shoppingCart;
        }
        return cart;
    }

    @Override
    public ShoppingCart sub(ShoppingCart cart) {
        //查询菜品/套餐的购物车数据
        LambdaQueryWrapper<ShoppingCart> lqw = new LambdaQueryWrapper<>();
        lqw.eq(ShoppingCart::getUserId, BaseContext.getCurrentId());
        if(cart.getDishId() != null){
            lqw.eq(ShoppingCart::getDishId, cart.getDishId());
        } else {
            lqw.eq(ShoppingCart::getSetmealId, cart.getSetmealId());
        }
        ShoppingCart shoppingCart = this.getOne(lqw);
        //修改数量
        if(shoppingCart.getNumber() == 1){
            this.removeById(shoppingCart);
        }
        shoppingCart.setNumber(shoppingCart.getNumber()-1);
        this.updateById(shoppingCart);
        return shoppingCart;
    }
}
