package io.renren.modules.takeout.dao;

import io.renren.common.dao.BaseDao;
import io.renren.modules.takeout.entity.SetmealDishEntity;
import org.apache.ibatis.annotations.Mapper;

/**
 * 套餐菜品关系
 *
 * @author zyx
 * @since 1.0.0 2023-06-09
 */
@Mapper
public interface SetmealDishDao extends BaseDao<SetmealDishEntity> {
	
}