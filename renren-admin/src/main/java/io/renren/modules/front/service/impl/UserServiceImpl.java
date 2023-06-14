package io.renren.modules.front.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.modules.front.bean.User;
import io.renren.modules.front.dao.UserMapper;
import io.renren.modules.front.service.UserService;
import org.springframework.stereotype.Service;

/**
 * 用户信息(User)表服务实现类
 *
 * @author 张宇轩
 * @since 2023-05-29 11:08:46
 */
@Service(value = "userServiceImplFront")
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {
}
