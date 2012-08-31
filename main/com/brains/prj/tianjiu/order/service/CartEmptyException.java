package com.brains.prj.tianjiu.order.service;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-7-10
 * Time: 下午2:14
 * To change this template use File | Settings | File Templates.
 */

import com.brains.prj.tianjiu.order.common.LogicException;

public class CartEmptyException extends LogicException {

    private static final long serialVersionUID = -5341167973893107718L;

    public CartEmptyException() {
    }
}
