package com.brains.prj.tianjiu.order.service;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-7-22
 * Time: 下午10:54
 * To change this template use File | Settings | File Templates.
 */

import java.util.LinkedList;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

import com.brains.prj.tianjiu.order.domain.*;

@Service
public class GoodsService {

    final static GoodsItem nonItem;

    static {
        nonItem = new GoodsItem();
        nonItem.setId(-1);
        nonItem.setTitle("nonItem");
    }

    final static Category nonCategory;

    static {
        nonCategory = new Category();
        nonCategory.setFullName("nonCategory");
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
            goodsItem = nonItem;
        }
        return goodsItem;
    }

    public List<AdItem> getAdsByAreaCd(String areaCd) {
        return goodsAOP.getAdsByAreaCd(areaCd);
    }

    public Category getCategoryByShortName(String shortName) {
        Category result = null;

        List<Category> categories = goodsAOP.getAllCategories();
        for (Category category : categories) {
            if (org.apache.commons.lang.StringUtils.equalsIgnoreCase(category.getShortName(), shortName)) {
                result = category;
                break;
            }
        }
        if (result == null) {
            result = nonCategory;
        }
        return result;
    }

    public List<Category> getSubCategories(Category parent) {
        List<Category> result = new LinkedList<Category>();

        List<Category> categories = goodsAOP.getAllCategories();
        for (Category category : categories) {
            if (category.getParentId() == parent.getId()) {
                result.add(category);
            }
        }
        return result;
    }
}
