package com.brains.prj.tianjiu.order.service;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-8-15
 * Time: 下午3:36
 * To change this template use File | Settings | File Templates.
 */

import com.brains.prj.tianjiu.order.common.MessageUtils;
import com.brains.prj.tianjiu.order.domain.GoodsItem;

public class BuyEvaGoodsException extends Exception {
    private int maxCount;

    public BuyEvaGoodsException(int maxCount) {
        this.maxCount = maxCount;
    }

    @Override
    public String getMessage() {
        return MessageUtils.format(MessageUtils.BuyEvaGoodsException_Message, maxCount);
    }
}
