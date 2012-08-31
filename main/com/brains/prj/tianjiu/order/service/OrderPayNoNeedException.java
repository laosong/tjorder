package com.brains.prj.tianjiu.order.service;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-8-31
 * Time: 下午6:38
 * To change this template use File | Settings | File Templates.
 */

import com.brains.prj.tianjiu.order.common.LogicException;
import com.brains.prj.tianjiu.order.domain.Order;

public class OrderPayNoNeedException extends LogicException {

    private static final long serialVersionUID = 2492342301487339070L;

    private Order order;

    public OrderPayNoNeedException(Order order) {
        this.order = order;
    }

    public Order getOrder() {
        return order;
    }
}
