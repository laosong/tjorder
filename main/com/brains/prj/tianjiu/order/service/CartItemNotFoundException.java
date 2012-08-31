package com.brains.prj.tianjiu.order.service;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-7-9
 * Time: 下午1:01
 * To change this template use File | Settings | File Templates.
 */

import com.brains.prj.tianjiu.order.common.LogicException;

public class CartItemNotFoundException extends LogicException {

    private static final long serialVersionUID = -4371703414984843779L;

    private int id;
    private int itemId;

    public CartItemNotFoundException(int id, int itemId) {
        this.id = id;
        this.itemId = itemId;
    }

}
