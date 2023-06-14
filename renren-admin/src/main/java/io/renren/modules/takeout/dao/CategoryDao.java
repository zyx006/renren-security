package io.renren.modules.takeout.dao;

import io.renren.common.dao.BaseDao;
import io.renren.modules.takeout.entity.CategoryEntity;
import org.apache.ibatis.annotations.Mapper;

/**
 * 菜品及套餐分类
 *
 * @author zyx
 * @since 1.0.0 2023-06-09
 */
@Mapper
public interface CategoryDao extends BaseDao<CategoryEntity> {
	
}