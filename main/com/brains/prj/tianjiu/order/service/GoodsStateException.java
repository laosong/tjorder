package com.brains.prj.tianjiu.order.service;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-8-14
 * Time: 下午10:19
 * To change this template use File | Settings | File Templates.
 */

import com.brains.prj.tianjiu.order.common.LogicException;
import com.brains.prj.tianjiu.order.domain.GoodsItem;

public class GoodsStateException extends LogicException {

    private static final long serialVersionUID = 5707215839924780180L;

    private GoodsItem goodsItem;

    public GoodsStateException(GoodsItem goodsItem) {
        this.goodsItem = goodsItem;
    }

    public GoodsItem getGoodsItem() {
        return goodsItem;
    }
}
