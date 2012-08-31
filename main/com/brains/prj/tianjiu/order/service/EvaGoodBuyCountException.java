package com.brains.prj.tianjiu.order.service;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-8-30
 * Time: 下午5:33
 * To change this template use File | Settings | File Templates.
 */

import com.brains.prj.tianjiu.order.common.LogicException;
import com.brains.prj.tianjiu.order.domain.GoodsItem;

public class EvaGoodBuyCountException extends LogicException {

    private static final long serialVersionUID = 2887679036397059338L;

    private GoodsItem evaGoods;
    private int buyMax;

    public EvaGoodBuyCountException(GoodsItem evaGoods, int buyMax) {
        this.evaGoods = evaGoods;
        this.buyMax = buyMax;
    }

    public GoodsItem getEvaGoods() {
        return evaGoods;
    }

    public int getBuyMax() {
        return buyMax;
    }
}
