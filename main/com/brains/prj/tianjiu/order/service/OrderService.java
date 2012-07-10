package com.brains.prj.tianjiu.order.service;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-7-7
 * Time: 上午10:55
 * To change this template use File | Settings | File Templates.
 */

import java.util.List;

import com.brains.prj.tianjiu.order.domain.ProductItem;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.beans.factory.annotation.Autowired;

import com.brains.prj.tianjiu.order.orm.OrderMapper;

@Service
public class OrderService {

    @Autowired
    OrderMapper orderMapper;

    @Transactional
    public int addProductItem(String name, String img) {
        ProductItem productItem = new ProductItem();
        productItem.setName(name);
        productItem.setImg(img);
        return orderMapper.addProductItem(productItem);
    }

    @Transactional(readOnly = true)
    public List<ProductItem> getItemList() {
        //return getTestItems();
        return orderMapper.getItemList();
    }

    public List<ProductItem> getTestItems() {
        List<ProductItem> testItems = new java.util.LinkedList<ProductItem>();
        for (int i = 0; i < 10; i++) {
            ProductItem item = new ProductItem();
            item.setName(org.apache.commons.lang.RandomStringUtils.randomAscii(20));
            item.setImg("getTestItems.jpg");
            testItems.add(item);
        }
        return testItems;
    }
}
