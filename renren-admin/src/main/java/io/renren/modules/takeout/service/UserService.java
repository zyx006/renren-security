package io.renren.modules.takeout.service;

import io.renren.common.service.CrudService;
import io.renren.modules.takeout.dto.UserDTO;
import io.renren.modules.takeout.entity.UserEntity;

/**
 * 用户信息
 *
 * @author zyx
 * @since 1.0.0 2023-06-09
 */
public interface UserService extends CrudService<UserEntity, UserDTO> {

}