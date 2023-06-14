/**
 * Copyright (c) 2018 人人开源 All rights reserved.
 *
 * https://www.renren.io
 *
 * 版权所有，侵权必究！
 */

package io.renren.common.handler;

import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import io.renren.modules.front.utils.BaseContext;
import io.renren.modules.security.user.SecurityUser;
import io.renren.modules.security.user.UserDetail;
import org.apache.ibatis.reflection.MetaObject;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;
import java.util.Date;

/**
 * 公共字段，自动填充值
 *
 * @author Mark sunlightcs@gmail.com
 */
@Component
public class FieldMetaObjectHandler implements MetaObjectHandler {
    private final static String CREATE_DATE = "createDate";
    private final static String CREATOR = "creator";
    private final static String UPDATE_DATE = "updateDate";
    private final static String UPDATER = "updater";
    private final static String DEPT_ID = "deptId";

    private static final String TARGET_PACKAGE = "io.renren.modules.front.bean";

    @Override
    public void insertFill(MetaObject metaObject) {
        String className = metaObject.getOriginalObject().getClass().getName();
        if (className.startsWith(TARGET_PACKAGE)){
            //填充前台页面相关公共字段
            metaObject.setValue(CREATOR, BaseContext.getCurrentId());
            metaObject.setValue(CREATE_DATE, LocalDateTime.now());
            metaObject.setValue(UPDATER, BaseContext.getCurrentId());
            metaObject.setValue(UPDATE_DATE, LocalDateTime.now());
        }else {
            //填充后台页面相关公共字段
            UserDetail user = SecurityUser.getUser();
            Date date = new Date();

            //创建者
            strictInsertFill(metaObject, CREATOR, Long.class, user.getId());
            //创建时间
            strictInsertFill(metaObject, CREATE_DATE, Date.class, date);

            //创建者所属部门
            strictInsertFill(metaObject, DEPT_ID, Long.class, user.getDeptId());

            //更新者
            strictInsertFill(metaObject, UPDATER, Long.class, user.getId());
            //更新时间
            strictInsertFill(metaObject, UPDATE_DATE, Date.class, date);
        }
    }

    @Override
    public void updateFill(MetaObject metaObject) {
        String className = metaObject.getOriginalObject().getClass().getName();
        if (className.startsWith(TARGET_PACKAGE)){
            //填充前台页面相关公共字段
            metaObject.setValue(UPDATER, BaseContext.getCurrentId());
            metaObject.setValue(UPDATE_DATE, LocalDateTime.now());
        }else {
            //更新者
            strictUpdateFill(metaObject, UPDATER, Long.class, SecurityUser.getUserId());
            //更新时间
            strictUpdateFill(metaObject, UPDATE_DATE, Date.class, new Date());
        }
    }
}