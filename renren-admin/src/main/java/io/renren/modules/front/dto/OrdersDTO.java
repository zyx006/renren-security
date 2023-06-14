package io.renren.modules.front.dto;

import io.renren.modules.front.bean.OrderDetail;
import io.renren.modules.front.bean.Orders;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.List;

/**
 * @author : 张宇轩
 * @createTime : 2023/6/5 - 16:15
 */
@Data
@NoArgsConstructor
public class OrdersDTO extends Orders implements Serializable {
    private List<OrderDetail> orderDetails;
}
