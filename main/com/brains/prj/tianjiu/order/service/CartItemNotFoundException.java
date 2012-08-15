package com.brains.prj.tianjiu.order.service;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-7-9
 * Time: 下午1:01
 * To change this template use File | Settings | File Templates.
 */

import com.brains.prj.tianjiu.order.common.MessageUtils;

public class CartItemNotFoundException extends Exception {
    private int id;
    private int itemId;

    public CartItemNotFoundException(int id, int itemId) {
        this.id = id;
        this.itemId = itemId;
    }

    @Override
    public String getMessage() {
        return MessageUtils.format(MessageUtils.CartItemNotFoundException_Message, id, itemId);
    }
}
