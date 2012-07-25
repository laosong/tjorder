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

import com.brains.prj.tianjiu.order.domain.*;

public interface OrderMapper {

    public int createOrder(Order order);

    public int createOrderItem(OrderItem orderItem);

    public int updateOrderPriceById(@Param("id") int id,
                                    @Param("sumPrice") float sumPrice);

    public Order getUserOrderInfo(@Param("userId") int userId,
                                  @Param("orderId") int orderId);

    public List<OrderItem> getOrderItems(@Param("orderId") int orderId);


    public int createShippingInfo(ShippingInfo shippingInfo);

    public ShippingInfo getShippingInfoById(@Param("id") int id);


    public int createOrderStatus(OrderStatus orderStatus);

    public List<OrderStatus> getOrderStatus(@Param("orderId") int orderId);
}
