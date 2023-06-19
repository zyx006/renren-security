package io.renren.modules.takeout.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import io.renren.common.service.impl.CrudServiceImpl;
import io.renren.modules.takeout.dao.DishFlavorDao;
import io.renren.modules.takeout.dto.DishFlavorDTO;
import io.renren.modules.takeout.entity.DishFlavorEntity;
import io.renren.modules.takeout.service.DishFlavorService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * 菜品口味关系表
 *
 * @author zyx
 * @since 1.0.0 2023-06-09
 */
@Service
public class DishFlavorServiceImpl extends CrudServiceImpl<DishFlavorDao, DishFlavorEntity, DishFlavorDTO> implements DishFlavorService {

    @Override
    public QueryWrapper<DishFlavorEntity> getWrapper(Map<String, Object> params){
        String id = (String)params.get("id");
        Long dishId = (Long) params.get("dish_id");

        QueryWrapper<DishFlavorEntity> wrapper = new QueryWrapper<>();
        wrapper.eq(StringUtils.isNotBlank(id), "id", id);
        wrapper.eq(dishId != null, "dish_id", dishId);

        return wrapper;
    }


}