package io.renren.modules.takeout.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import io.renren.common.service.impl.CrudServiceImpl;
import io.renren.modules.takeout.dao.SetmealDishDao;
import io.renren.modules.takeout.dto.SetmealDishDTO;
import io.renren.modules.takeout.entity.SetmealDishEntity;
import io.renren.modules.takeout.service.SetmealDishService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * 套餐菜品关系
 *
 * @author zyx
 * @since 1.0.0 2023-06-09
 */
@Service
public class SetmealDishServiceImpl extends CrudServiceImpl<SetmealDishDao, SetmealDishEntity, SetmealDishDTO> implements SetmealDishService {

    @Override
    public QueryWrapper<SetmealDishEntity> getWrapper(Map<String, Object> params){
        String id = (String)params.get("id");

        QueryWrapper<SetmealDishEntity> wrapper = new QueryWrapper<>();
        wrapper.eq(StringUtils.isNotBlank(id), "id", id);

        return wrapper;
    }


}