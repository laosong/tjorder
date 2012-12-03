package com.brains.prj.tianjiu.order.service;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-7-16
 * Time: 下午1:27
 * To change this template use File | Settings | File Templates.
 */

import com.brains.prj.tianjiu.order.common.LogicException;

public class OrderNotFoundException extends LogicException {

    private static final long serialVersionUID = 3109382961230545787L;

    private int orderId;
    private String orderCd;

    public OrderNotFoundException(int orderId) {
        this.orderId = orderId;
    }

    public OrderNotFoundException(String orderCd) {
        this.orderCd = orderCd;
    }

    public int getOrderId() {
        return orderId;
    }
}
