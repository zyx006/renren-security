package io.renren.modules.takeout.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import io.renren.common.service.impl.CrudServiceImpl;
import io.renren.modules.takeout.dao.OrderDetailDao;
import io.renren.modules.takeout.dto.OrderDetailDTO;
import io.renren.modules.takeout.entity.OrderDetailEntity;
import io.renren.modules.takeout.service.OrderDetailService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * 订单明细表
 *
 * @author zyx
 * @since 1.0.0 2023-06-09
 */
@Service
public class OrderDetailServiceImpl extends CrudServiceImpl<OrderDetailDao, OrderDetailEntity, OrderDetailDTO> implements OrderDetailService {

    @Override
    public QueryWrapper<OrderDetailEntity> getWrapper(Map<String, Object> params){
        String id = (String)params.get("id");

        QueryWrapper<OrderDetailEntity> wrapper = new QueryWrapper<>();
        wrapper.eq(StringUtils.isNotBlank(id), "id", id);

        return wrapper;
    }


}