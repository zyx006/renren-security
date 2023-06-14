package io.renren.modules.takeout.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import io.renren.common.service.impl.CrudServiceImpl;
import io.renren.modules.takeout.dao.ShoppingCartDao;
import io.renren.modules.takeout.dto.ShoppingCartDTO;
import io.renren.modules.takeout.entity.ShoppingCartEntity;
import io.renren.modules.takeout.service.ShoppingCartService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * 购物车
 *
 * @author zyx
 * @since 1.0.0 2023-06-09
 */
@Service
public class ShoppingCartServiceImpl extends CrudServiceImpl<ShoppingCartDao, ShoppingCartEntity, ShoppingCartDTO> implements ShoppingCartService {

    @Override
    public QueryWrapper<ShoppingCartEntity> getWrapper(Map<String, Object> params){
        String id = (String)params.get("id");

        QueryWrapper<ShoppingCartEntity> wrapper = new QueryWrapper<>();
        wrapper.eq(StringUtils.isNotBlank(id), "id", id);

        return wrapper;
    }


}