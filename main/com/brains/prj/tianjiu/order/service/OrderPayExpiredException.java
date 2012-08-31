package com.brains.prj.tianjiu.order.service;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-8-31
 * Time: 下午5:34
 * To change this template use File | Settings | File Templates.
 */

import com.brains.prj.tianjiu.order.common.LogicException;
import com.brains.prj.tianjiu.order.domain.Order;

public class OrderPayExpiredException extends LogicException {

    private static final long serialVersionUID = 7373223313743256556L;

    private Order order;

    public OrderPayExpiredException(Order order) {
        this.order = order;
    }
}
