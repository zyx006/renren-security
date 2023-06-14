package io.renren.modules.takeout.service;

import io.renren.common.service.CrudService;
import io.renren.modules.takeout.dto.OrderDetailDTO;
import io.renren.modules.takeout.entity.OrderDetailEntity;

/**
 * 订单明细表
 *
 * @author zyx
 * @since 1.0.0 2023-06-09
 */
public interface OrderDetailService extends CrudService<OrderDetailEntity, OrderDetailDTO> {

}