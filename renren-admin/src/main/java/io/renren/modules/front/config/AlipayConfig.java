package io.renren.modules.front.config;

/**
 * @author : 张宇轩
 * @createTime : 2023/6/6 - 9:24
 */
public class AlipayConfig {
    // 商户appid
    public static String APPID = "";
    // 私钥 pkcs8格式的
    public static String RSA_PRIVATE_KEY = "";
    // 服务器异步通知页面路径 需http://或者https://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String notify_url = "http://商户网关地址/alipay.trade.wap.pay-JAVA-UTF-8/notify_url.jsp";
    // 页面跳转同步通知页面路径 需http://或者https://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问 商户可以自定义同步跳转地址
    public static String return_url = "http://localhost:8080/api/front/order/afterPayOrder";
    // 请求网关地址
    public static String URL = "https://openapi-sandbox.dl.alipaydev.com/gateway.do";
    // 编码
    public static String CHARSET = "UTF-8";
    // 返回格式
    public static String FORMAT = "json";
    // 支付宝公钥
    public static String ALIPAY_PUBLIC_KEY = "";
    // 日志记录目录定义在 logFile 中
    public static String log_path = "/log";
    // RSA2
    public static String SIGNTYPE = "RSA2";
}