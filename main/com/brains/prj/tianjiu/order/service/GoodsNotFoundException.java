package com.brains.prj.tianjiu.order.service;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-8-14
 * Time: 下午5:51
 * To change this template use File | Settings | File Templates.
 */

import com.brains.prj.tianjiu.order.common.MessageUtils;

public class GoodsNotFoundException extends Exception {
    private int goodsId;

    public GoodsNotFoundException(int goodsId) {
        this.goodsId = goodsId;
    }

    @Override
    public String getMessage() {
        return MessageUtils.format(MessageUtils.GoodsNotFoundException_Message, goodsId);
    }
}
