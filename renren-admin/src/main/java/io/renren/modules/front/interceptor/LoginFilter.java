package io.renren.modules.front.interceptor;

import com.alibaba.fastjson.JSONObject;
import io.renren.modules.front.utils.BaseContext;
import io.renren.modules.front.utils.R;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.web.filter.authc.BasicHttpAuthenticationFilter;
import org.springframework.stereotype.Component;
import org.springframework.util.AntPathMatcher;
import org.springframework.util.StringUtils;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Arrays;

/**
 * @author : 张宇轩
 * @createTime : 2023/6/13 - 20:09
 */
@Slf4j
@Component
public class LoginFilter extends BasicHttpAuthenticationFilter {
    //请求到达控制器之前拦截
    @Override
    public boolean preHandle(ServletRequest servletRequest, ServletResponse servletResponse) throws Exception {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;

        //设置允许跨域
        response.setContentType("application/json;charset=UTF-8");
        String origin = request.getHeader("Origin");
        if (StringUtils.hasText(origin)){
            response.setHeader("Access-Control-Allow-Origin", origin);
        }
        response.setHeader("Access-Control-Allow-Credentials", "true");
        response.setHeader("Access-Control-Allow-Methods", "GET,POST,PUT,DELETE,OPTIONS");
        response.setHeader("Access-Control-Allow-Headers", "Content-Type,token");

        //获取当前线程id
        long id = Thread.currentThread().getId();
        log.info("LoginFilter >> 线程Id: {}, RequestURI: {}", id, request.getRequestURI());
        //2.检测是否为前台页面请求
        if(new AntPathMatcher().match("/api/front/**", request.getRequestURI())){

            //是登录相关请求，直接放行
            if(new AntPathMatcher().match("/api/front/user/**", request.getRequestURI())){
                log.info("LoginFilter >> "+request.getRequestURI()+">> 与/api/front/user/**匹配");
                return true;
            }
            //其他前台请求
            log.info("LoginFilter >> "+request.getRequestURI()+">> 与/api/front/**匹配");
            //获取cookie['user']
            String userObj = null;
            Cookie[] cookies = request.getCookies();
            log.info(Arrays.toString(cookies));
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if ("user".equals(cookie.getName())) {
                        userObj = cookie.getValue();
                    }
                }
            }
            log.info("LoginFilter >> "+request.getRequestURI()+" >> cookie['user'] = " + userObj);
            //判断是否为空
            if (userObj != null) {
                log.info("当前用户已经登录，用户id为：{}", userObj);
                //把userId放入ThreadLocal中
                BaseContext.setCurrentId(Long.valueOf(userObj));
                return true;
            }
            //未登录，响应数据
            response.getWriter().write(JSONObject.toJSONString(R.error("NOTLOGIN")));
            return false;
        }

        log.info("LoginFilter >> 后台页面请求");
        return true;
    }
}
