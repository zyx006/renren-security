package io.renren.modules.takeout.dao;

import io.renren.common.dao.BaseDao;
import io.renren.modules.takeout.entity.AddressBookEntity;
import org.apache.ibatis.annotations.Mapper;

/**
 * 地址管理
 *
 * @author zyx
 * @since 1.0.0 2023-06-09
 */
@Mapper
public interface AddressBookDao extends BaseDao<AddressBookEntity> {
	
}