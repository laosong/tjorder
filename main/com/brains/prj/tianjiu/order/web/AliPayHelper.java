package com.brains.prj.tianjiu.order.web;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-12-1
 * Time: 下午5:24
 * To change this template use File | Settings | File Templates.
 */

import java.util.Collections;
import java.util.List;
import java.util.ArrayList;
import java.util.Map;
import java.util.HashMap;
import java.util.Set;

import java.io.UnsupportedEncodingException;
import java.security.SignatureException;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.codec.digest.DigestUtils;

public class AliPayHelper {

    static final String partner = "2088801746137252";
    static final String key = "b9rarh2975us4nhuw11reapiheyakr9m";

    static final String seller_email = "chunqiujy@163.com";

    static final String input_charset = "utf-8";
    static final String sign_type = "MD5";

    static final String ALIPAY_GATEWAY_NEW = "https://mapi.alipay.com/gateway.do?";
    static final String ALIPAY_VERIFY_URL = "https://mapi.alipay.com/gateway.do?service=notify_verify&";

    static final String ALIPAY_RETURN_URL = "http://www.36519.com/orderAction/alipayReturn";
    static final String ALIPAY_NOTIFY_URL = "http://www.36519.com/orderAction/alipayNotify";

    static final String ALIPAY_SHOW_URL_BASE = "http://www.36519.com/orderAction/showOrder?orderCd=";

    static class ShipType {
        static final String POST = "POST";
        static final String EXPRESS = "EXPRESS";
        static final String EMS = "EMS";
    }

    static class ShipPayType {
        static final String BUYER_PAY = "BUYER_PAY";
        static final String SELLER_PAY = "SELLER_PAY";
        static final String BUYER_PAY_AFTER_RECEIVE = "BUYER_PAY_AFTER_RECEIVE";
    }

    static class TradeStatus {
        static final String WAIT_BUYER_PAY = "WAIT_BUYER_PAY"; //等待买家付款
        static final String WAIT_SELLER_SEND_GOODS = "WAIT_SELLER_SEND_GOODS"; //买家已付款，等待卖家发货
        static final String WAIT_BUYER_CONFIRM_GOODS = "WAIT_BUYER_CONFIRM_GOODS"; //卖家已发货，等待买家确认
        static final String TRADE_FINISHED = "TRADE_FINISHED"; //交易成功结束
        static final String TRADE_CLOSED = "TRADE_CLOSED"; //交易中途关闭（已结束，未成功完成）
    }

    static class RefundStatus {
        static final String WAIT_SELLER_AGREE = "WAIT_SELLER_AGREE"; //退款协议等待卖家确认中
        static final String SELLER_REFUSE_BUYER = "SELLER_REFUSE_BUYER"; //卖家不同意协议，等待买家修改
        static final String WAIT_BUYER_RETURN_GOODS = "WAIT_BUYER_RETURN_GOODS"; //退款协议达成，等待买家退货
        static final String WAIT_SELLER_CONFIRM_GOODS = "WAIT_SELLER_CONFIRM_GOODS"; //等待卖家收货
        static final String REFUND_SUCCESS = "REFUND_SUCCESS"; //退款成功
        static final String REFUND_CLOSED = "REFUND_CLOSED"; //退款关闭
    }

    /**
     * 生成要请求给支付宝的参数数组
     *
     * @param sParaTemp 请求前的参数数组
     * @return 要请求的参数数组
     */
    private static Map<String, String> buildRequestPara(Map<String, String> sParaTemp) {
        //除去数组中的空值和签名参数
        Map<String, String> sPara = paraFilter(sParaTemp);
        //生成签名结果
        String mysign = buildRequestMysign(sPara);

        //签名结果与签名方式加入请求提交参数组中
        sPara.put("sign", mysign);
        sPara.put("sign_type", sign_type);

        return sPara;
    }

    /**
     * 建立请求，以表单HTML形式构造（默认）
     *
     * @param sParaTemp 请求参数数组
     * @param strMethod 提交方式。两个值可选：post、get
     * @return 提交表单HTML文本
     */
    public static String buildRequest(Map<String, String> sParaTemp, String strMethod) {
        //待请求参数数组
        Map<String, String> sPara = buildRequestPara(sParaTemp);
        List<String> keys = new ArrayList<String>(sPara.keySet());

        StringBuilder sbHtml = new StringBuilder();

        sbHtml.append("<form id=\"alipaySubmitForm\" name=\"alipaySubmitForm\" action=\"" + ALIPAY_GATEWAY_NEW
                + "_input_charset=" + input_charset + "\" method=\"" + strMethod
                + "\">");

        for (int i = 0; i < keys.size(); i++) {
            String name = keys.get(i);
            String value = sPara.get(name);

            sbHtml.append("<input type=\"hidden\" name=\"" + name + "\" value=\"" + value + "\"/>");
        }

        sbHtml.append("</form>");
        return sbHtml.toString();
    }

    /**
     * 生成签名结果
     *
     * @param sPara 要签名的数组
     * @return 签名结果字符串
     */
    public static String buildRequestMysign(Map<String, String> sPara) {
        String prestr = createLinkString(sPara); //把数组所有元素，按照“参数=参数值”的模式用“&”字符拼接成字符串
        String mysign = md5Sign(prestr, key, input_charset);
        return mysign;
    }

    /**
     * 除去数组中的空值和签名参数
     *
     * @param sArray 签名参数组
     * @return 去掉空值与签名参数后的新签名参数组
     */
    public static Map<String, String> paraFilter(Map<String, String> sArray) {

        Map<String, String> result = new HashMap<String, String>();

        if (sArray == null || sArray.size() <= 0) {
            return result;
        }

        for (String key : sArray.keySet()) {
            String value = sArray.get(key);
            if (value == null || value.equals("") || key.equalsIgnoreCase("sign")
                    || key.equalsIgnoreCase("sign_type")) {
                continue;
            }
            result.put(key, value);
        }

        return result;
    }

    /**
     * 把数组所有元素排序，并按照“参数=参数值”的模式用“&”字符拼接成字符串
     *
     * @param params 需要排序并参与字符拼接的参数组
     * @return 拼接后字符串
     */
    public static String createLinkString(Map<String, String> params) {

        List<String> keys = new ArrayList<String>(params.keySet());
        Collections.sort(keys);

        StringBuilder stringBuilder = new StringBuilder();

        for (int i = 0; i < keys.size(); i++) {
            String key = keys.get(i);
            String value = params.get(key);

            if (i == keys.size() - 1) {//拼接时，不包括最后一个&字符
                stringBuilder.append(key).append("=").append(value);
            } else {
                stringBuilder.append(key).append("=").append(value).append("&");
            }
        }

        return stringBuilder.toString();
    }

    /**
     * 签名字符串
     *
     * @param text          需要签名的字符串
     * @param key           密钥
     * @param input_charset 编码格式
     * @return 签名结果
     */
    public static String md5Sign(String text, String key, String input_charset) {
        text = text + key;
        return DigestUtils.md5Hex(getContentBytes(text, input_charset));
    }

    /**
     * 签名字符串
     *
     * @param text          需要签名的字符串
     * @param sign          签名结果
     * @param key           密钥
     * @param input_charset 编码格式
     * @return 签名结果
     */
    public static boolean md5Verify(String text, String sign, String key, String input_charset) {
        text = text + key;
        String mysign = DigestUtils.md5Hex(getContentBytes(text, input_charset));
        if (mysign.equals(sign)) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * @param content
     * @param charset
     * @return
     * @throws SignatureException
     * @throws UnsupportedEncodingException
     */
    private static byte[] getContentBytes(String content, String charset) {
        if (charset == null || "".equals(charset)) {
            return content.getBytes();
        }
        try {
            return content.getBytes(charset);
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException("MD5签名过程中出现错误,指定的编码集不对,您目前指定的编码集是:" + charset);
        }
    }

    public static Map<String, String> convertHttpParams(Map<String, String[]> params, StringBuilder paramString)
            throws UnsupportedEncodingException {
        String enc = input_charset;

        Map<String, String> result = new HashMap<String, String>();
        Set<Map.Entry<String, String[]>> paramsSet = params.entrySet();
        for (Map.Entry<String, String[]> entry : paramsSet) {
            String[] values = entry.getValue();
            for (int i = 0; i < values.length; i++) {
                values[i] = java.net.URLDecoder.decode(values[i], enc);
            }
            String catValue = StringUtils.join(values, ',');
            result.put(entry.getKey(), catValue);
            if (paramString != null) {
                paramString.append(entry.getKey()).append("=").append(catValue).append("&");
            }
        }
        return result;
    }

    /**
     * 验证消息是否是支付宝发出的合法消息
     *
     * @param params 通知返回来的参数数组
     * @return 验证结果
     */
    public static boolean verify(Map<String, String> params) {
        //判断responseTxt是否为true，isSign是否为true
        //responseTxt的结果不是true，与服务器设置问题、合作身份者ID、notify_id一分钟失效有关
        //isSign不是true，与安全校验码、请求时的参数格式（如：带自定义参数等）、编码格式有关
        String responseTxt = "true";
        if (params.get("notify_id") != null) {
            String notify_id = params.get("notify_id");
            responseTxt = verifyResponse(notify_id);
        }
        String sign = "";
        if (params.get("sign") != null) {
            sign = params.get("sign");
        }
        boolean isSign = getSignVerify(params, sign);

        //写日志记录（若要调试，请取消下面两行注释）
        //String sWord = "responseTxt=" + responseTxt + "\n isSign=" + isSign + "\n 返回回来的参数：" + AlipayCore.createLinkString(params);
        //AlipayCore.logResult(sWord);

        if (isSign && responseTxt.equals("true")) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * 根据反馈回来的信息，生成签名结果
     *
     * @param Params 通知返回来的参数数组
     * @param sign   比对的签名结果
     * @return 生成的签名结果
     */
    private static boolean getSignVerify(Map<String, String> Params, String sign) {
        //过滤空值、sign与sign_type参数
        Map<String, String> sParaNew = paraFilter(Params);
        //获取待签名字符串
        String preSignStr = createLinkString(sParaNew);
        //获得签名验证结果
        boolean isSign = md5Verify(preSignStr, sign, key, input_charset);
        return isSign;
    }

    /**
     * 获取远程服务器ATN结果,验证返回URL
     *
     * @param notify_id 通知校验ID
     * @return 服务器ATN结果
     *         验证结果集：
     *         invalid命令参数不对 出现这个错误，请检测返回处理中partner和key是否为空
     *         true 返回正确信息
     *         false 请检查防火墙或者是服务器阻止端口问题以及验证时间是否超过一分钟
     */
    private static String verifyResponse(String notify_id) {
        //获取远程服务器ATN结果，验证是否是支付宝服务器发来的请求
        String verify_url = ALIPAY_VERIFY_URL + "partner=" + partner + "&notify_id=" + notify_id;
        //return checkUrl(verify_url);
        return "true";
    }
}
