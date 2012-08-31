package com.brains.prj.tianjiu.order.service;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-8-31
 * Time: 上午10:52
 * To change this template use File | Settings | File Templates.
 */

import com.brains.prj.tianjiu.order.common.LogicException;

public class BadBuyCountException extends LogicException {

    private static final long serialVersionUID = -3363027170124989868L;

    private int minCount;
    private int maxCount;

    public BadBuyCountException(int minCount, int maxCount) {
        this.minCount = minCount;
        this.maxCount = maxCount;
    }

    public int getMinCount() {
        return minCount;
    }

    public int getMaxCount() {
        return maxCount;
    }
}
