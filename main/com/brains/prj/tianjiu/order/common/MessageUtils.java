package com.brains.prj.tianjiu.order.common;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-8-14
 * Time: 下午6:48
 * To change this template use File | Settings | File Templates.
 */
public class MessageUtils {

    public static String format(String format) {
        return format;
    }

    public static String format(String format, Object... args) {
        return java.text.MessageFormat.format(format, args);
    }

    public static final String CartFullException_Message
            = "com.brains.prj.tianjiu.order.service.CartFullException, maxItemCount={0}";

    public static final String CartItemNotFoundException_Message
            = "com.brains.prj.tianjiu.order.service.CartItemNotFoundException, id={0}##itemId={1}";

    public static final String CartEmptyException_Message
            = "com.brains.prj.tianjiu.order.service.CartEmptyException";


    public static final String GoodsNotFoundException_Message
            = "com.brains.prj.tianjiu.order.service.GoodsNotFoundException, goodsId={0}";

    public static final String GoodsStateException_Message
            = "com.brains.prj.tianjiu.order.service.GoodsStateException, goodsId={0}##goodsShowName={1}##goodsState={2}";

    public static final String CityInfoNotFoundExceptionById_Message
            = "com.brains.prj.tianjiu.order.service.CityInfoNotFoundExceptionById, cityId={0}";

    public static final String CityInfoNotFoundExceptionByName_Message
            = "com.brains.prj.tianjiu.order.service.CityInfoNotFoundExceptionByName, province={0}##city={1}##country={2}";

    public static final String OrderNotFoundException_Message
            = "com.brains.prj.tianjiu.order.service.OrderNotFoundException, orderId={0}";

    public static final String UserAddressNotFoundException_Message
            = "com.brains.prj.tianjiu.order.service.UserAddressNotFoundException, addressId={0}";

    public static final String ShippingNotFoundException_Message
            = "com.brains.prj.tianjiu.order.service.ShippingNotFoundException, shippingId={0}";

    public static final String PaymentNotFoundException_Message
            = "com.brains.prj.tianjiu.order.service.PaymentNotFoundException, paymentId={0}";

    public static final String DeliveryNotFoundException_Message
            = "com.brains.prj.tianjiu.order.service.DeliveryNotFoundException, deliveryId={0}";

    public static void main(String[] args) {
        com.brains.prj.tianjiu.order.service.GoodsNotFoundException exception
                = new com.brains.prj.tianjiu.order.service.GoodsNotFoundException(10);
        System.out.println(exception.getMessage());
    }
}
