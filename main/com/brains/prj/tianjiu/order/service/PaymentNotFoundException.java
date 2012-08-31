package com.brains.prj.tianjiu.order.service;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-7-24
 * Time: 下午4:40
 * To change this template use File | Settings | File Templates.
 */

import com.brains.prj.tianjiu.order.common.LogicException;

public class PaymentNotFoundException extends LogicException {

    private static final long serialVersionUID = -2133952046731424619L;

    private int paymentId;

    public PaymentNotFoundException(int paymentId) {
        this.paymentId = paymentId;
    }
}
