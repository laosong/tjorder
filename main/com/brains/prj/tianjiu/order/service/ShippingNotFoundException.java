package com.brains.prj.tianjiu.order.service;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-7-24
 * Time: 下午4:49
 * To change this template use File | Settings | File Templates.
 */

import com.brains.prj.tianjiu.order.common.LogicException;

public class ShippingNotFoundException extends LogicException {

    private static final long serialVersionUID = 1513493185826262370L;

    private int shippingId;

    public ShippingNotFoundException(int shippingId) {
        this.shippingId = shippingId;
    }

    public int getShippingId() {
        return shippingId;
    }
}
