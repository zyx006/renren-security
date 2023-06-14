package io.renren.modules.takeout.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import io.renren.common.service.impl.CrudServiceImpl;
import io.renren.modules.takeout.dao.OrdersDao;
import io.renren.modules.takeout.dto.OrdersDTO;
import io.renren.modules.takeout.entity.OrdersEntity;
import io.renren.modules.takeout.service.OrdersService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * 订单表
 *
 * @author zyx
 * @since 1.0.0 2023-06-09
 */
@Service
public class OrdersServiceImpl extends CrudServiceImpl<OrdersDao, OrdersEntity, OrdersDTO> implements OrdersService {

    @Override
    public QueryWrapper<OrdersEntity> getWrapper(Map<String, Object> params){
        String id = (String)params.get("id");

        QueryWrapper<OrdersEntity> wrapper = new QueryWrapper<>();
        wrapper.eq(StringUtils.isNotBlank(id), "id", id);

        return wrapper;
    }


}