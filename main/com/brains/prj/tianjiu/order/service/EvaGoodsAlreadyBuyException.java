package com.brains.prj.tianjiu.order.service;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-8-15
 * Time: 下午4:35
 * To change this template use File | Settings | File Templates.
 */

import com.brains.prj.tianjiu.order.common.MessageUtils;
import com.brains.prj.tianjiu.order.domain.GoodsItem;
import com.brains.prj.tianjiu.order.domain.Order;

public class EvaGoodsAlreadyBuyException extends Exception {
    private GoodsItem goodsItem;
    private Order order;

    public EvaGoodsAlreadyBuyException(GoodsItem goodsItem, Order order) {
        this.goodsItem = goodsItem;
        this.order = order;
    }

    @Override
    public String getMessage() {
        return MessageUtils.format(MessageUtils.EvaGoodsAlreadyBuyException_Message,
                goodsItem.getId(), goodsItem.getName(), order.getId(), order.getCreatedDate());
    }
}
