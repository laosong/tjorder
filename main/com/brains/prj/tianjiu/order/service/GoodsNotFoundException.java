package com.brains.prj.tianjiu.order.service;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-8-14
 * Time: 下午5:51
 * To change this template use File | Settings | File Templates.
 */

import com.brains.prj.tianjiu.order.common.LogicException;

public class GoodsNotFoundException extends LogicException {

    private static final long serialVersionUID = -6223173435919306925L;

    private int goodsId;

    public GoodsNotFoundException(int goodsId) {
        this.goodsId = goodsId;
    }

    public int getGoodsId() {
        return goodsId;
    }
}
