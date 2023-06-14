package io.renren.modules.takeout.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.util.Date;

/**
 * 用户信息
 *
 * @author zyx
 * @since 1.0.0 2023-06-09
 */
@Data
@TableName("user")
public class UserEntity {

    /**
     * id
     */
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
     * 创建者
     */
	private Long creator;
    /**
     * 创建时间
     */
	private Date createDate;
    /**
     * 更新者
     */
	private Long updater;
    /**
     * 更新时间
     */
	private Date updateDate;
}