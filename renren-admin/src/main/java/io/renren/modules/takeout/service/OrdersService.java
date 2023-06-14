package io.renren.modules.takeout.service;

import io.renren.common.service.CrudService;
import io.renren.modules.takeout.dto.OrdersDTO;
import io.renren.modules.takeout.entity.OrdersEntity;

/**
 * 订单表
 *
 * @author zyx
 * @since 1.0.0 2023-06-09
 */
public interface OrdersService extends CrudService<OrdersEntity, OrdersDTO> {

}