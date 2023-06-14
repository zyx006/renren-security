package io.renren.modules.takeout.dao;

import io.renren.common.dao.BaseDao;
import io.renren.modules.takeout.entity.OrderDetailEntity;
import org.apache.ibatis.annotations.Mapper;

/**
 * 订单明细表
 *
 * @author zyx
 * @since 1.0.0 2023-06-09
 */
@Mapper
public interface OrderDetailDao extends BaseDao<OrderDetailEntity> {
	
}