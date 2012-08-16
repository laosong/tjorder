package com.brains.prj.tianjiu.order.service;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-7-22
 * Time: 下午10:54
 * To change this template use File | Settings | File Templates.
 */

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

import com.brains.prj.tianjiu.order.domain.*;

@Service
public class GoodsService {

    final static GoodsItem nobodyItem;

    static {
        nobodyItem = new GoodsItem();
        nobodyItem.setId(-1);
        nobodyItem.setTitle("nobody");
    }

    GoodsAOP goodsAOP;

    @Autowired
    public void setGoodsAOP(GoodsAOP goodsAOP) {
        this.goodsAOP = goodsAOP;
    }

    public List<GoodsItem> getGoodsForSale() {
        return goodsAOP.getGoodsForSale();
    }

    public GoodsItem getGoodsItem(int goodsId) throws GoodsNotFoundException {
        GoodsItem goodsItem = goodsAOP.getGoodsItem(goodsId);
        if (goodsItem == null) {
            throw new GoodsNotFoundException(goodsId);
        }
        return goodsItem;
    }

    public GoodsItem getGoodsItemNoThrow(int goodsId) {
        GoodsItem goodsItem = goodsAOP.getGoodsItem(goodsId);
        if (goodsItem == null) {
            goodsItem = nobodyItem;
        }
        return goodsItem;
    }
}
