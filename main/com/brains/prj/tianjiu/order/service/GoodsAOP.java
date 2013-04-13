package com.brains.prj.tianjiu.order.service;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-8-16
 * Time: 上午12:58
 * To change this template use File | Settings | File Templates.
 */

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.transaction.annotation.Transactional;

import com.brains.prj.tianjiu.order.domain.*;
import com.brains.prj.tianjiu.order.orm.*;

@Service
class GoodsAOP {
    public static final String CACHE_NAME = "goodsCache";

    AdMapper adMapper;
    CategoryMapper categoryMapper;

    GoodsMapper goodsMapper;

    @Autowired
    public void setGoodsMapper(GoodsMapper goodsMapper) {
        this.goodsMapper = goodsMapper;
    }

    @Autowired
    public void setAdMapper(AdMapper adMapper) {
        this.adMapper = adMapper;
    }

    @Autowired
    public void setCategoryMapper(CategoryMapper categoryMapper) {
        this.categoryMapper = categoryMapper;
    }

    public List<GoodsItem> getGoodsForSale() {
        return goodsMapper.getGoodsListByState((short) 2);
    }

    @Cacheable(value = CACHE_NAME, key = "'GoodsItem' + #goodsId")
    @Transactional(readOnly = true)
    public GoodsItem getGoodsItem(int goodsId) {
        GoodsItem goodsItem = goodsMapper.getGoodsItemById(goodsId);
        return goodsItem;
    }

    @Cacheable(value = CACHE_NAME, key = "'AdsByAreaCd' + #areaCd")
    @Transactional(readOnly = true)
    public List<AdItem> getAdsByAreaCd(String areaCd) {
        return adMapper.getAdsByAreaCd(areaCd);
    }

    @Cacheable(value = CACHE_NAME, key = "'AllCategories'")
    @Transactional(readOnly = true)
    public List<Category> getAllCategories() {
        return categoryMapper.getAllCategories();
    }
}
