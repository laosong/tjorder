package com.brains.prj.tianjiu.order.domain;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-7-5
 * Time: 下午6:29
 * To change this template use File | Settings | File Templates.
 */

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class Order implements Serializable {
    private static final long serialVersionUID = 5732179769607691332L;

    private int id;
    private int userId;
    /*
    订单编号(唯一)
     */
    private String orderCd;
    /*
    支付方式id（表payment_info）
     */
    private int paymentId;
    /*
    配送方式id（表delivery_info）
     */
    private int deliveryId;
    /*
    配送方式id（表shipping_info）
     */
    private int shippingId;
    /*
    1：一般订单
     */

    public static final short TYPES_NORMAL = 1;

    private short types;
    private float sumPrice;
    private Date createdDate;
    private String orderDesc;
    /*
        0: 刚创建
        1：已下单，用户提交
        2：已付款，在线支付用户
        3：已发货，客服邮寄货物
        4： 订单完成。客服确认货物到达用户手中
        5：订单取消。用户在状态1下可取消。客服可以任意时候取消。

        货到付款：1->3->4
        在线支付：1->2->3->4
     */

    public static final short STATE_CREATED = 0;
    public static final short STATE_SUBMIT = 1;
    public static final short STATE_PAYED = 2;
    public static final short STATE_SHIPPED = 3;
    public static final short STATE_COMPLETE = 4;
    public static final short STATE_CANCELED = 5;

    private short state;

    private PaymentInfo paymentInfo;
    private DeliveryInfo deliveryInfo;
    private ShippingInfo shippingInfo;

    private List<OrderItem> orderItems;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getOrderCd() {
        return orderCd;
    }

    public void setOrderCd(String orderCd) {
        this.orderCd = orderCd;
    }

    public int getPaymentId() {
        return paymentId;
    }

    public void setPaymentId(int paymentId) {
        this.paymentId = paymentId;
    }

    public int getDeliveryId() {
        return deliveryId;
    }

    public void setDeliveryId(int deliveryId) {
        this.deliveryId = deliveryId;
    }

    public int getShippingId() {
        return shippingId;
    }

    public void setShippingId(int shippingId) {
        this.shippingId = shippingId;
    }

    public short getTypes() {
        return types;
    }

    public void setTypes(short types) {
        this.types = types;
    }

    public float getSumPrice() {
        return sumPrice;
    }

    public void setSumPrice(float sumPrice) {
        this.sumPrice = sumPrice;
    }

    public java.util.Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(java.util.Date createdDate) {
        this.createdDate = createdDate;
    }

    public String getOrderDesc() {
        return orderDesc;
    }

    public void setOrderDesc(String orderDesc) {
        this.orderDesc = orderDesc;
    }

    public short getState() {
        return state;
    }

    public void setState(short state) {
        this.state = state;
    }

    public PaymentInfo getPaymentInfo() {
        return paymentInfo;
    }

    public void setPaymentInfo(PaymentInfo paymentInfo) {
        this.paymentInfo = paymentInfo;
    }

    public DeliveryInfo getDeliveryInfo() {
        return deliveryInfo;
    }

    public void setDeliveryInfo(DeliveryInfo deliveryInfo) {
        this.deliveryInfo = deliveryInfo;
    }

    public ShippingInfo getShippingInfo() {
        return shippingInfo;
    }

    public void setShippingInfo(ShippingInfo shippingInfo) {
        this.shippingInfo = shippingInfo;
    }

    public List<OrderItem> getOrderItems() {
        return orderItems;
    }

    public void setOrderItems(List<OrderItem> orderItems) {
        this.orderItems = orderItems;
    }

    public static final float FREE_DELIVERY_ORDER_FEE = 99;

    public OrderFee calcOrderFee(float itemFee) {
        OrderFee orderFee = new OrderFee();
        orderFee.setItemFee(itemFee);
        if (deliveryInfo != null) {
            if (itemFee < FREE_DELIVERY_ORDER_FEE) {
                orderFee.setDeliveryFee(deliveryInfo.getFee());
            }
        }
        return orderFee;
    }
}
