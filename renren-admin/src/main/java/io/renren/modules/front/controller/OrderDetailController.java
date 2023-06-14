package io.renren.modules.front.controller;

import io.renren.modules.front.service.OrderDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 订单明细表(OrderDetail)表控制层
 *
 * @author 张宇轩
 * @since 2023-05-29 11:09:40
 */
@RestController(value = "orderDetailControllerFront")
@RequestMapping("front/orderDetail")
public class OrderDetailController {
    /**
     * 服务对象
     */
    @Autowired
    private OrderDetailService orderDetailService;


}
