package io.renren.modules.takeout.dao;

import io.renren.common.dao.BaseDao;
import io.renren.modules.takeout.entity.ShoppingCartEntity;
import org.apache.ibatis.annotations.Mapper;

/**
 * 购物车
 *
 * @author zyx
 * @since 1.0.0 2023-06-09
 */
@Mapper
public interface ShoppingCartDao extends BaseDao<ShoppingCartEntity> {
	
}