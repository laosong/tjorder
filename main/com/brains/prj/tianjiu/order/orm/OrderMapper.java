package com.brains.prj.tianjiu.order.orm;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-7-5
 * Time: 下午7:21
 * To change this template use File | Settings | File Templates.
 */

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.brains.prj.tianjiu.order.domain.ProductItem;

public interface OrderMapper {
    public int addProductItem(ProductItem productItem);
    public List<ProductItem> getItemList();
    public ProductItem getItemById(@Param("itemId")int itemId);
}
