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

    public int setOrderCd(@Param("orderId") int orderId,
                          @Param("orderCd") String orderCd);

    public int createOrderItem(OrderItem orderItem);

    public int updateOrderPriceById(@Param("id") int id,
                                    @Param("sumPrice") float sumPrice);

    public Order getUserOrderInfo(@Param("userId") int userId,
                                  @Param("orderId") int orderId);

    public List<Order> getUserOrderContainEvaItem(@Param("userId") int userId,
                                                  @Param("evaItemType") short evaItemType,
                                                  @Param("states") short[] orderStates,
                                                  @Param("checkHours") int checkHours);

    public int getUserOrderBuyEvaItemSum(@Param("userId") int userId,
                                         @Param("evaItemType") short evaItemType,
                                         @Param("states") short[] orderStates,
                                         @Param("checkHours") int checkHours);

    public List<OrderItem> getOrderItems(@Param("orderId") int orderId);

    public List<Order> getUserOrders(@Param("userId") int userId);

    public List<OrderItem> getOrdersItems(@Param("ids") List<Integer> ids);

    public List<Order> getUserOrdersByState(@Param("userId") int userId,
                                            @Param("states") short[] states);


    public int createShippingInfo(ShippingInfo shippingInfo);

    public ShippingInfo getShippingInfoById(@Param("id") int id);


    public int getFoundRows();

    public List<Order> getOrdersByPage(@Param("offset") int offset,
                                       @Param("limit") int limit);

    public List<Order> queryOrders();

    public Order getOrderInfo(@Param("orderId") int orderId);

    public int createOrderStatus(OrderStatus orderStatus);

    public List<OrderStatus> getOrderStatus(@Param("orderId") int orderId);
}
