package com.brains.prj.tianjiu.order.domain;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-7-19
 * Time: 下午7:32
 * To change this template use File | Settings | File Templates.
 */

import java.io.Serializable;

public class OrderFee implements Serializable {
    private static final long serialVersionUID = -4036750477724957105L;

    private int orderId;

    private float itemFee;
    private float paymentFee;
    private float deliveryFee;

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public float getItemFee() {
        return itemFee;
    }

    public void setItemFee(float itemFee) {
        this.itemFee = itemFee;
    }

    public float getPaymentFee() {
        return paymentFee;
    }

    public void setPaymentFee(float paymentFee) {
        this.paymentFee = paymentFee;
    }

    public float getDeliveryFee() {
        return deliveryFee;
    }

    public void setDeliveryFee(float deliveryFee) {
        this.deliveryFee = deliveryFee;
    }

    public float getTotalFee() {
        return itemFee + deliveryFee;
    }
}
