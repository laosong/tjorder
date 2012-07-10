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

public class Order implements Serializable {
    private static final long serialVersionUID = 5732179769607691332L;

    private int id;
    /*
    订单编号(唯一)
     */
    private String orderCd;
    /*
    支付方式id（表payment_info）
     */
    private String paymentId;
    /*
    配送方式id（表delivery_info）
     */
    private String deliveryId;
    /*
    配送方式id（表shipping_info）
     */
    private String shippingId;
    /*
    1：一般订单
     */
    private short types;
    private float sumPrice;
    private Date createdDate;
    private String orderDesc;
    /*
        1：已下单，用户提交
        2：已付款，在线支付用户
        3：已发货，客服邮寄货物
        4： 订单完成。客服确认货物到达用户手中
        5：订单取消。用户在状态1下可取消。客服可以任意时候取消。

        货到付款：1->3->4
        在线支付：1->2->3->4
     */
    private short state;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getOrderCd() {
        return orderCd;
    }

    public void setOrderCd(String orderCd) {
        this.orderCd = orderCd;
    }

    public String getPaymentId() {
        return paymentId;
    }

    public void setPaymentId(String paymentId) {
        this.paymentId = paymentId;
    }

    public String getDeliveryId() {
        return deliveryId;
    }

    public void setDeliveryId(String deliveryId) {
        this.deliveryId = deliveryId;
    }

    public String getShippingId() {
        return shippingId;
    }

    public void setShippingId(String shippingId) {
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
}
