package io.renren.modules.front.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import io.renren.modules.front.bean.Dish;
import org.apache.ibatis.annotations.Mapper;

/**
 * 菜品管理(Dish)表数据库访问层
 *
 * @author 张宇轩
 * @since 2023-05-29 11:08:44
 */
@Mapper
public interface DishMapper extends BaseMapper<Dish> {
}
