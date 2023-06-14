package io.renren.modules.takeout.service;

import io.renren.common.service.CrudService;
import io.renren.modules.takeout.dto.ShoppingCartDTO;
import io.renren.modules.takeout.entity.ShoppingCartEntity;

/**
 * 购物车
 *
 * @author zyx
 * @since 1.0.0 2023-06-09
 */
public interface ShoppingCartService extends CrudService<ShoppingCartEntity, ShoppingCartDTO> {

}