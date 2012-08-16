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

public class EvaGoodsBuyCountException extends Exception {
    private int buyCount;
    private int maxCount;

    public EvaGoodsBuyCountException(int buyCount, int maxCount) {
        this.buyCount = buyCount;
        this.maxCount = maxCount;
    }

    @Override
    public String getMessage() {
        return MessageUtils.format(MessageUtils.EvaGoodsBuyCountException_Message, buyCount, maxCount);
    }
}
