package io.renren.modules.takeout.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import io.renren.common.service.impl.CrudServiceImpl;
import io.renren.modules.takeout.dao.DishDao;
import io.renren.modules.takeout.dto.DishDTO;
import io.renren.modules.takeout.entity.DishEntity;
import io.renren.modules.takeout.service.DishService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * 菜品管理
 *
 * @author zyx
 * @since 1.0.0 2023-06-09
 */
@Service
public class DishServiceImpl extends CrudServiceImpl<DishDao, DishEntity, DishDTO> implements DishService {

    @Override
    public QueryWrapper<DishEntity> getWrapper(Map<String, Object> params){
        String id = (String)params.get("id");
        String categoryId = (String)params.get("categoryId");

        QueryWrapper<DishEntity> wrapper = new QueryWrapper<>();
        wrapper.eq(StringUtils.isNotBlank(id), "id", id);
        wrapper.eq(StringUtils.isNotBlank(categoryId), "category_id", categoryId);

        return wrapper;
    }


}