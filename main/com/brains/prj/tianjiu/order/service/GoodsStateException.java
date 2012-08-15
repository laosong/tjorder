package com.brains.prj.tianjiu.order.service;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-8-14
 * Time: 下午10:19
 * To change this template use File | Settings | File Templates.
 */

import com.brains.prj.tianjiu.order.common.MessageUtils;
import com.brains.prj.tianjiu.order.domain.GoodsItem;

public class GoodsStateException extends Exception {
    private GoodsItem goodsItem;

    public GoodsStateException(GoodsItem goodsItem) {
        this.goodsItem = goodsItem;
    }

    @Override
    public String getMessage() {
        return java.text.MessageFormat.format(MessageUtils.GoodsStateException_Message,
                goodsItem.getId(), goodsItem.getName(), goodsItem.getState());
    }
}
