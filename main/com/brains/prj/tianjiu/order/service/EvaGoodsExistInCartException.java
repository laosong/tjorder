package com.brains.prj.tianjiu.order.service;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-8-16
 * Time: 下午12:43
 * To change this template use File | Settings | File Templates.
 */

import com.brains.prj.tianjiu.order.common.MessageUtils;
import com.brains.prj.tianjiu.order.domain.GoodsItem;
import com.brains.prj.tianjiu.order.domain.Order;

public class EvaGoodsExistInCartException extends Exception {
    private GoodsItem goodsItem;
    private GoodsItem cartItem;

    public EvaGoodsExistInCartException(GoodsItem goodsItem, GoodsItem cartItem) {
        this.goodsItem = goodsItem;
        this.cartItem = cartItem;
    }

    @Override
    public String getMessage() {
        return MessageUtils.format(MessageUtils.EvaGoodsExistInCartException_Message,
                goodsItem.getId(), goodsItem.getName(), cartItem.getId(), cartItem.getName());
    }
}
