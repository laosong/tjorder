package com.brains.prj.tianjiu.order.service;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-8-31
 * Time: 下午6:35
 * To change this template use File | Settings | File Templates.
 */

import com.brains.prj.tianjiu.order.common.LogicException;
import com.brains.prj.tianjiu.order.domain.Order;

public class OrderStateException extends LogicException {

    private static final long serialVersionUID = -1293212796465041303L;

    private Order order;

    public OrderStateException(Order order) {
        this.order = order;
    }
}
