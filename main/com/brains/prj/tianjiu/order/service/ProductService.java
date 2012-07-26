package com.brains.prj.tianjiu.order.service;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-7-22
 * Time: 下午10:54
 * To change this template use File | Settings | File Templates.
 */

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.transaction.annotation.Transactional;

import com.brains.prj.tianjiu.order.domain.*;
import com.brains.prj.tianjiu.order.orm.*;

@Service
public class ProductService {
    public static final String CACHE_NAME = "productCache";

    final static ProductItem nobodyItem;

    static {
        nobodyItem = new ProductItem();
        nobodyItem.setState(-1);
        nobodyItem.setName("nobody");
    }

    ProductMapper productMapper;

    @Autowired
    public void setProductMapper(ProductMapper productMapper) {
        this.productMapper = productMapper;
    }

    @Transactional
    public int addProductItem(String name, String img) {
        ProductItem productItem = new ProductItem();
        productItem.setName(name);
        productItem.setImg(img);
        return productMapper.addProductItem(productItem);
    }

    @Transactional(readOnly = true)
    public List<ProductItem> getItemList() {
        return productMapper.getItemList();
    }

    @Cacheable(value = CACHE_NAME, key = "'ProductItem' + #id")
    @Transactional(readOnly = true)
    public ProductItem getProductItem(int id) {
        ProductItem productItem = productMapper.getItemById(id);
        if (productItem == null) {
            productItem = nobodyItem;
        }
        return productItem;
    }
}
