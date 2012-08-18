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
            = "order.service.CartFullException, maxItemCount={0}";

    public static final String CartItemNotFoundException_Message
            = "order.service.CartItemNotFoundException, id={0}##itemId={1}";

    public static final String CartEmptyException_Message
            = "order.service.CartEmptyException";


    public static final String GoodsNotFoundException_Message
            = "order.service.GoodsNotFoundException, goodsId={0}";

    public static final String GoodsStateException_Message
            = "order.service.GoodsStateException, goodsId={0}##goodsName={1}##goodsState={2}";

    public static final String CityInfoNotFoundExceptionById_Message
            = "order.service.CityInfoNotFoundExceptionById, cityId={0}";

    public static final String CityInfoNotFoundExceptionByName_Message
            = "order.service.CityInfoNotFoundExceptionByName, province={0}##city={1}##country={2}";

    public static final String OrderNotFoundException_Message
            = "order.service.OrderNotFoundException, orderId={0}";

    public static final String UserAddressNotFoundException_Message
            = "order.service.UserAddressNotFoundException, addressId={0}";

    public static final String ShippingNotFoundException_Message
            = "order.service.ShippingNotFoundException, shippingId={0}";

    public static final String PaymentNotFoundException_Message
            = "order.service.PaymentNotFoundException, paymentId={0}";

    public static final String DeliveryNotFoundException_Message
            = "order.service.DeliveryNotFoundException, deliveryId={0}";

    public static final String BuyEvaGoodsException_Message
            = "order.service.BuyEvaGoodsException, maxCount={0}";

    public static void main(String[] args) {
    }
}
