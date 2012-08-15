package com.brains.prj.tianjiu.order.service;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-7-16
 * Time: 下午1:27
 * To change this template use File | Settings | File Templates.
 */

import com.brains.prj.tianjiu.order.common.MessageUtils;

public class OrderNotFoundException extends Exception {
    private int orderId;

    public OrderNotFoundException(int orderId) {
        this.orderId = orderId;
    }

    @Override
    public String getMessage() {
        return MessageUtils.format(MessageUtils.OrderNotFoundException_Message, orderId);
    }
}
