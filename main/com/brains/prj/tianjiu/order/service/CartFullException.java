package com.brains.prj.tianjiu.order.service;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-7-8
 * Time: 上午1:10
 * To change this template use File | Settings | File Templates.
 */

import com.brains.prj.tianjiu.order.common.MessageUtils;

public class CartFullException extends Exception {
    private int maxItemCount;

    public CartFullException(int maxItemCount) {
        this.maxItemCount = maxItemCount;
    }

    @Override
    public String getMessage() {
        return MessageUtils.format(MessageUtils.CartFullException_Message, maxItemCount);
    }
}
