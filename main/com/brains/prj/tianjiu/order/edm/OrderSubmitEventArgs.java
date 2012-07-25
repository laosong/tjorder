package com.brains.prj.tianjiu.order.edm;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-7-25
 * Time: 下午3:44
 * To change this template use File | Settings | File Templates.
 */

import java.io.Serializable;

public class OrderSubmitEventArgs implements Serializable {
    private static final long serialVersionUID = -3670398427951057588L;

    private int orderId;

    public OrderSubmitEventArgs(int orderId) {
        this.orderId = orderId;
    }


    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }
}
