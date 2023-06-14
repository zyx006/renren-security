package io.renren.modules.takeout.dao;

import io.renren.common.dao.BaseDao;
import io.renren.modules.takeout.entity.DishEntity;
import org.apache.ibatis.annotations.Mapper;

/**
 * 菜品管理
 *
 * @author zyx
 * @since 1.0.0 2023-06-09
 */
@Mapper
public interface DishDao extends BaseDao<DishEntity> {
	
}