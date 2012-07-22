package com.brains.prj.tianjiu.order.orm;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-7-22
 * Time: 下午10:49
 * To change this template use File | Settings | File Templates.
 */

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.brains.prj.tianjiu.order.domain.*;

public interface ProductMapper {

    public int addProductItem(ProductItem productItem);

    public List<ProductItem> getItemList();

    public ProductItem getItemById(@Param("itemId") int itemId);
}