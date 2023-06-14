package io.renren.modules.front.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import io.renren.modules.front.bean.Setmeal;
import org.apache.ibatis.annotations.Mapper;

/**
 * 套餐(Setmeal)表数据库访问层
 *
 * @author 张宇轩
 * @since 2023-05-29 11:08:45
 */
@Mapper
public interface SetmealMapper extends BaseMapper<Setmeal> {
}
