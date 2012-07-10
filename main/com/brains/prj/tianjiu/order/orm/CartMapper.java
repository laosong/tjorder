package com.brains.prj.tianjiu.order.orm;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-7-7
 * Time: 下午4:28
 * To change this template use File | Settings | File Templates.
 */

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.brains.prj.tianjiu.order.domain.*;

public interface CartMapper {

    public int getItemCountByUser(@Param("userId") int userId);

    public int incItemCountIfExist(@Param("userId") int userId,
                                   @Param("itemId") int itemId,
                                   @Param("itemCount") int itemCount);

    public int addItem(CartItem cartItem);

    public int delItemByTestId(@Param("userId") int userId,
                               @Param("id") int id,
                               @Param("itemId") int itemId);

    public int incItemCountByTestId(@Param("userId") int userId,
                                    @Param("id") int id,
                                    @Param("itemId") int itemId,
                                    @Param("itemCount") int itemCount);

    public int decItemCountByTestId(@Param("userId") int userId,
                                    @Param("id") int id,
                                    @Param("itemId") int itemId,
                                    @Param("itemCount") int itemCount);

    public List<CartItem> getBriefItemsByUser(@Param("userId") int userId);

    public List<CartItem> getDetailItemsByUser(@Param("userId") int userId);
}
