package io.renren.modules.takeout.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import io.renren.common.service.impl.CrudServiceImpl;
import io.renren.modules.takeout.dao.SetmealDao;
import io.renren.modules.takeout.dto.SetmealDTO;
import io.renren.modules.takeout.entity.SetmealEntity;
import io.renren.modules.takeout.service.SetmealService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * 套餐
 *
 * @author zyx
 * @since 1.0.0 2023-06-09
 */
@Service
public class SetmealServiceImpl extends CrudServiceImpl<SetmealDao, SetmealEntity, SetmealDTO> implements SetmealService {

    @Override
    public QueryWrapper<SetmealEntity> getWrapper(Map<String, Object> params){
        String id = (String)params.get("id");

        QueryWrapper<SetmealEntity> wrapper = new QueryWrapper<>();
        wrapper.eq(StringUtils.isNotBlank(id), "id", id);

        return wrapper;
    }


}