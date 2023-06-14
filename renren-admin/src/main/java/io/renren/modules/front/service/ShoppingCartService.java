package io.renren.modules.front.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.modules.front.bean.ShoppingCart;

/**
 * 购物车(ShoppingCart)表服务接口
 *
 * @author 张宇轩
 * @since 2023-05-29 11:08:45
 */
public interface ShoppingCartService extends IService<ShoppingCart> {
    ShoppingCart add(ShoppingCart shoppingCart);

    ShoppingCart sub(ShoppingCart cart);
}
