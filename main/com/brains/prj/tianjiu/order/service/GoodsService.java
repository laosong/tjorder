package com.brains.prj.tianjiu.order.service;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-7-22
 * Time: 下午10:54
 * To change this template use File | Settings | File Templates.
 */

import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.transaction.annotation.Transactional;

import com.brains.prj.tianjiu.order.domain.*;
import com.brains.prj.tianjiu.order.orm.*;

@Service
public class GoodsService {
    public static final String CACHE_NAME = "goodsCache";

    final static GoodsItem nobodyItem;

    static {
        nobodyItem = new GoodsItem();
        nobodyItem.setState((short) -1);
        nobodyItem.setTitle("nobody");
    }

    GoodsMapper goodsMapper;

    @Autowired
    public void setGoodsMapper(GoodsMapper goodsMapper) {
        this.goodsMapper = goodsMapper;
    }

    @Cacheable(value = CACHE_NAME, key = "'GoodsItem' + #id")
    @Transactional(readOnly = true)
    public GoodsItem getGoodsItem(int id) {
        GoodsItem goodsItem = goodsMapper.getGoodsItemById(id);
        if (goodsItem == null) {
            goodsItem = nobodyItem;
        }
        return goodsItem;
    }
}
