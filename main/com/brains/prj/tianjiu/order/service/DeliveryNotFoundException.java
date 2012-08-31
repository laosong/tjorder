package com.brains.prj.tianjiu.order.service;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-7-24
 * Time: 下午4:45
 * To change this template use File | Settings | File Templates.
 */

import com.brains.prj.tianjiu.order.common.LogicException;

public class DeliveryNotFoundException extends LogicException {

    private static final long serialVersionUID = -2297771407971754625L;

    private int deliveryId;

    public DeliveryNotFoundException(int deliveryId) {
        this.deliveryId = deliveryId;
    }

    public int getDeliveryId() {
        return deliveryId;
    }
}
