package com.brains.prj.tianjiu.order.service;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-8-30
 * Time: 下午4:19
 * To change this template use File | Settings | File Templates.
 */

import java.util.List;

import com.brains.prj.tianjiu.order.common.LogicException;
import com.brains.prj.tianjiu.order.domain.GoodsItem;
import com.brains.prj.tianjiu.order.domain.Order;

public class EvaGoodsBuyException extends LogicException {

    private static final long serialVersionUID = -7535271708210978491L;

    private List<Order> evaOrders;
    private List<GoodsItem> evaItems;

    public EvaGoodsBuyException(List<GoodsItem> evaItems, List<Order> evaOrders) {
        this.evaItems = evaItems;
        this.evaOrders = evaOrders;
    }

    public List<Order> getEvaOrders() {
        return evaOrders;
    }

    public List<GoodsItem> getEvaItems() {
        return evaItems;
    }
}
