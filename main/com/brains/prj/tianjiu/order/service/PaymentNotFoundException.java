package com.brains.prj.tianjiu.order.service;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-7-24
 * Time: 下午4:40
 * To change this template use File | Settings | File Templates.
 */

import com.brains.prj.tianjiu.order.common.MessageUtils;

public class PaymentNotFoundException extends Exception {
    private int paymentId;

    public PaymentNotFoundException(int paymentId) {
        this.paymentId = paymentId;
    }

    @Override
    public String getMessage() {
        return MessageUtils.format(MessageUtils.PaymentNotFoundException_Message, paymentId);
    }
}
