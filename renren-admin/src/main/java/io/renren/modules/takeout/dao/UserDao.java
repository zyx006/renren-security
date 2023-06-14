package io.renren.modules.takeout.dao;

import io.renren.common.dao.BaseDao;
import io.renren.modules.takeout.entity.UserEntity;
import org.apache.ibatis.annotations.Mapper;

/**
 * 用户信息
 *
 * @author zyx
 * @since 1.0.0 2023-06-09
 */
@Mapper
public interface UserDao extends BaseDao<UserEntity> {
	
}