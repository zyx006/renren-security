package io.renren.modules.front.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import io.renren.modules.front.bean.ShoppingCart;
import io.renren.modules.front.service.ShoppingCartService;
import io.renren.modules.front.utils.BaseContext;
import io.renren.modules.front.utils.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 购物车(ShoppingCart)表控制层
 *
 * @author 张宇轩
 * @since 2023-05-29 11:09:40
 */
@RestController(value = "shoppingCartControllerFront")
@RequestMapping("front/shoppingCart")
public class ShoppingCartController {
    /**
     * 服务对象
     */
    @Autowired
    private ShoppingCartService shoppingCartService;

    @GetMapping("/list")
    public R<List<ShoppingCart>> list(){
        LambdaQueryWrapper<ShoppingCart> lqw = new LambdaQueryWrapper<>();
        lqw.eq(ShoppingCart::getUserId, BaseContext.getCurrentId());
        return R.success(shoppingCartService.list(lqw));
    }

    //添加购物车
    @PostMapping("/add")
    public R<ShoppingCart> add(@RequestBody ShoppingCart shoppingCart){
        ShoppingCart cart = shoppingCartService.add(shoppingCart);
        return R.success(cart);
    }

    //减少菜品/套餐数量
    @PostMapping("/sub")
    public R<ShoppingCart> sub(@RequestBody ShoppingCart cart){
        ShoppingCart shoppingCart = shoppingCartService.sub(cart);
        return R.success(shoppingCart);
    }

    //清空购物车
    @DeleteMapping("/clean")
    public R<String> clean(){
        LambdaUpdateWrapper<ShoppingCart> luw = new LambdaUpdateWrapper<>();
        luw.eq(ShoppingCart::getUserId, BaseContext.getCurrentId());
        shoppingCartService.remove(luw);
        return R.success("购物车清空成功");
    }

}
