package io.renren.modules.takeout.dao;

import io.renren.common.dao.BaseDao;
import io.renren.modules.takeout.entity.OrdersEntity;
import org.apache.ibatis.annotations.Mapper;

/**
 * 订单表
 *
 * @author zyx
 * @since 1.0.0 2023-06-09
 */
@Mapper
public interface OrdersDao extends BaseDao<OrdersEntity> {
	
}