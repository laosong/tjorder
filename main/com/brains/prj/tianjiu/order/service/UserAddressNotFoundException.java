package com.brains.prj.tianjiu.order.service;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-7-20
 * Time: 下午6:01
 * To change this template use File | Settings | File Templates.
 */

import com.brains.prj.tianjiu.order.common.LogicException;

public class UserAddressNotFoundException extends LogicException {

    private static final long serialVersionUID = 3444077840039989080L;

    private int addressId;

    public UserAddressNotFoundException(int addressId) {
        this.addressId = addressId;
    }

    public int getAddressId() {
        return addressId;
    }
}
