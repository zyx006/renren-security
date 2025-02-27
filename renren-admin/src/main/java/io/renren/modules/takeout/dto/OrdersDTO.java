package io.renren.modules.takeout.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * 订单表
 *
 * @author zyx
 * @since 1.0.0 2023-06-09
 */
@Data
@ApiModel(value = "订单表")
public class OrdersDTO implements Serializable {
    private static final long serialVersionUID = 1L;

	@ApiModelProperty(value = "主键")
	private Long id;

	@ApiModelProperty(value = "订单号")
	private String number;

	@ApiModelProperty(value = "订单状态 1待付款，2待派送，3已派送，4已完成，5已取消")
	private Integer status;

	@ApiModelProperty(value = "下单用户")
	private Long userId;

	@ApiModelProperty(value = "地址id")
	private Long addressBookId;

	@ApiModelProperty(value = "下单时间")
	private Date orderTime;

	@ApiModelProperty(value = "结账时间")
	private Date checkoutTime;

	@ApiModelProperty(value = "支付方式 1微信,2支付宝")
	private Integer payMethod;

	@ApiModelProperty(value = "实收金额")
	private BigDecimal amount;

	@ApiModelProperty(value = "备注")
	private String remark;

	@ApiModelProperty(value = "")
	private String phone;

	@ApiModelProperty(value = "")
	private String address;

	@ApiModelProperty(value = "")
	private String userName;

	@ApiModelProperty(value = "")
	private String consignee;


}