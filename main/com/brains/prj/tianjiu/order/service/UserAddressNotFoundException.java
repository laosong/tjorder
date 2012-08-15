package com.brains.prj.tianjiu.order.service;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-7-20
 * Time: 下午6:01
 * To change this template use File | Settings | File Templates.
 */

import com.brains.prj.tianjiu.order.common.MessageUtils;

public class UserAddressNotFoundException extends Exception {
    private int addressId;

    public UserAddressNotFoundException(int addressId) {
        this.addressId = addressId;
    }

    @Override
    public String getMessage() {
        return MessageUtils.format(MessageUtils.UserAddressNotFoundException_Message, addressId);
    }
}
