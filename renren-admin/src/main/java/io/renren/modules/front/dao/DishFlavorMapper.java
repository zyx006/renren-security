package io.renren.modules.front.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import io.renren.modules.front.bean.DishFlavor;
import org.apache.ibatis.annotations.Mapper;

/**
 * 菜品口味关系表(DishFlavor)表数据库访问层
 *
 * @author 张宇轩
 * @since 2023-05-29 11:08:44
 */
@Mapper
public interface DishFlavorMapper extends BaseMapper<DishFlavor> {
}
