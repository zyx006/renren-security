package io.renren.modules.front.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import io.renren.modules.front.bean.ShoppingCart;
import org.apache.ibatis.annotations.Mapper;

/**
 * 购物车(ShoppingCart)表数据库访问层
 *
 * @author 张宇轩
 * @since 2023-05-29 11:08:45
 */
@Mapper
public interface ShoppingCartMapper extends BaseMapper<ShoppingCart> {
}
