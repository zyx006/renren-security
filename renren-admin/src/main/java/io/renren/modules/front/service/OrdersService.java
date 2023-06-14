package io.renren.modules.front.service;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.modules.front.bean.Orders;
import io.renren.modules.front.dto.OrdersDTO;

/**
 * 订单表(Orders)表服务接口
 *
 * @author 张宇轩
 * @since 2023-05-29 11:08:45
 */
public interface OrdersService extends IService<Orders> {
    Orders addOrder(Orders orders);

    Page<OrdersDTO> getUserPage(Integer page, Integer pageSize, LambdaQueryWrapper<Orders> lqw);
}
