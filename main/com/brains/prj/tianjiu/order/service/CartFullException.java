package com.brains.prj.tianjiu.order.service;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-7-8
 * Time: 上午1:10
 * To change this template use File | Settings | File Templates.
 */

import com.brains.prj.tianjiu.order.common.LogicException;

public class CartFullException extends LogicException {

    private static final long serialVersionUID = -22015882707605703L;

    private int maxItemCount;

    public CartFullException(int maxItemCount) {
        this.maxItemCount = maxItemCount;
    }

    public int getMaxItemCount() {
        return maxItemCount;
    }
}
