package com.brains.prj.tianjiu.order.service;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-7-10
 * Time: 下午2:14
 * To change this template use File | Settings | File Templates.
 */

import com.brains.prj.tianjiu.order.common.MessageUtils;

public class CartEmptyException extends Exception {

    public CartEmptyException() {
    }

    @Override
    public String getMessage() {
        return MessageUtils.format(MessageUtils.CartEmptyException_Message);
    }
}
