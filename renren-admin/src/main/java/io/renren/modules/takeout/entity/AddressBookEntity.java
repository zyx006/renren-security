package io.renren.modules.takeout.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.util.Date;

/**
 * 地址管理
 *
 * @author zyx
 * @since 1.0.0 2023-06-09
 */
@Data
@TableName("address_book")
public class AddressBookEntity {

    /**
     * 主键
     */
	private Long id;
    /**
     * 用户id
     */
	private Long userId;
    /**
     * 收货人
     */
	private String consignee;
    /**
     * 性别 0 男 1 女
     */
	private Integer gender;
    /**
     * 手机号
     */
	private String phone;
    /**
     * 省级区划编号
     */
	private String provinceCode;
    /**
     * 省级名称
     */
	private String provinceName;
    /**
     * 市级区划编号
     */
	private String cityCode;
    /**
     * 市级名称
     */
	private String cityName;
    /**
     * 区级区划编号
     */
	private String districtCode;
    /**
     * 区级名称
     */
	private String districtName;
    /**
     * 详细地址
     */
	private String detail;
    /**
     * 标签
     */
	private String label;
    /**
     * 默认 0 否 1是
     */
	private Integer isDefault;
    /**
     * 创建人
     */
	private Long creator;
    /**
     * 创建时间
     */
	private Date createDate;
    /**
     * 修改人
     */
	private Long updater;
    /**
     * 更新时间
     */
	private Date updateDate;
    /**
     * 是否删除
     */
	private Integer isDeleted;
}