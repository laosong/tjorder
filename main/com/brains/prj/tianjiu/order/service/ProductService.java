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
import org.springframework.transaction.annotation.Transactional;
import org.springframework.beans.factory.annotation.Autowired;

import com.brains.prj.tianjiu.order.domain.*;
import com.brains.prj.tianjiu.order.orm.*;

@Service
public class ProductService {

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
}
