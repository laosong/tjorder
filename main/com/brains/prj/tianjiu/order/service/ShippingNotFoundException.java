package com.brains.prj.tianjiu.order.service;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-7-24
 * Time: 下午4:49
 * To change this template use File | Settings | File Templates.
 */

import com.brains.prj.tianjiu.order.common.MessageUtils;

public class ShippingNotFoundException extends Exception {
    private int shippingId;

    public ShippingNotFoundException(int shippingId) {
        this.shippingId = shippingId;
    }

    @Override
    public String getMessage() {
        return MessageUtils.format(MessageUtils.ShippingNotFoundException_Message, shippingId);
    }
}
