package io.renren.modules.front.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import io.renren.modules.front.bean.User;
import io.renren.modules.front.service.UserService;
import io.renren.modules.front.utils.BaseContext;
import io.renren.modules.front.utils.R;
import io.renren.modules.front.utils.SendEmailUtils;
import io.renren.modules.front.utils.ValidateCodeUtils;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.mail.EmailException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Map;
import java.util.concurrent.TimeUnit;

/**
 * 用户信息(User)表控制层
 *
 * @author 张宇轩
 * @since 2023-05-29 11:09:40
 */
@RestController(value = "userControllerFront")
@RequestMapping("front/user")
@Slf4j
public class UserController {
    /**
     * 服务对象
     */
    @Autowired
    private UserService userService;

    @Autowired
    private RedisTemplate redisTemplate;

    //发送验证码
    @PostMapping("/sendMsg")
    public R<String> sendMsg(@RequestBody User user, HttpSession session){
        //生成6位随机数字验证码
        String code = ValidateCodeUtils.generateValidateCode(6).toString();
        log.info("验证码：{}", code);
        //发送短信，让用户接受验证码
        try {
            SendEmailUtils.sendAuthCodeEmail(user.getPhone(), code);
            //把验证码保存到redis，1分钟有效
            redisTemplate.opsForValue().set(user.getPhone() + ":code", code, 1, TimeUnit.MINUTES);
            return R.success("验证码发送成功");
        } catch (EmailException e) {
            e.printStackTrace();
            return R.error("验证码发送失败");
        }
    }

    //用户登录
    @PostMapping("/login")
    public R<String> login(HttpSession session, @RequestBody Map<String, Object> map, HttpServletResponse response){
        //获取前端传递的数据
        String phone = (String) map.get("phone");
        String code = (String) map.get("code");
        //将前端传来的code与redis中的code比较
        Object redisCode = redisTemplate.opsForValue().get(phone + ":code");
        if(redisCode == null){
            return R.error("验证码过期，请重新发送验证码");
        }
        if(code!=null && code.equals(redisCode)){
            //根据手机号查询用户信息
            LambdaQueryWrapper<User> lqw = new LambdaQueryWrapper<>();
            lqw.eq(User::getPhone, phone);
            User user = userService.getOne(lqw);
            if (user == null) {
                //用户不存在，注册用户信息
                user = new User();
                user.setPhone(phone);
                user.setStatus(1);
                userService.save(user);
            }
            //将用户id存到session中
//            session.setAttribute("user", user.getId());
            Cookie cookie = new Cookie("user", String.valueOf(user.getId()));
            cookie.setPath("/");
            cookie.setDomain("localhost");
            cookie.setHttpOnly(true);

            response.addCookie(cookie);
            System.out.println("cookie['user'] = " + cookie.getValue());
            //验证码使用之后，从redis中删除
            redisTemplate.delete(phone + ":code");
            return R.success("用户登录成功");
        }
        return R.error("验证码错误");
    }

    //用户登出
    @PostMapping("/loginout")
    public R<String> logout(HttpServletResponse response){
        BaseContext.setCurrentId(null);
        Cookie cookie = new Cookie("user", null);
        cookie.setPath("/");
        cookie.setDomain("localhost");
        cookie.setHttpOnly(true);
        cookie.setMaxAge(0);

        response.addCookie(cookie);
        return R.success("退出成功");
    }
}
