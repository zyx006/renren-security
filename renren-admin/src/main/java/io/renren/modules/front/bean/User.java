package io.renren.modules.front.bean;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * 用户信息(User)表实体类
 *
 * @author 张宇轩
 * @since 2023-06-13 13:03:56
 */
@Data
@NoArgsConstructor
@TableName("user")
public class User implements Serializable {

    /**
     * id
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 姓名
     */
    private String name;

    /**
     * 手机号
     */
    private String phone;

    /**
     * 性别 0：男 1：女 2：保密
     */
    private Integer gender;

    /**
     * 身份证号
     */
    private String idNumber;

    /**
     * 头像
     */
    private String avatarUrl;

    /**
     * 状态 0:禁用，1:正常
     */
    private Integer status;

    /**
     * 微信openid
     */
    private String openid;

    /**
     * 微信昵称
     */
    private String nickName;

    /**
     * 创建人
     */
    @TableField(fill = FieldFill.INSERT)
    private Long creator;

    /**
     * 创建时间
     */
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createDate;

    /**
     * 修改人
     */
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private Long updater;

    /**
     * 更新时间
     */
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime updateDate;

}
