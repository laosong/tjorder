package com.brains.prj.tianjiu.order.service;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-8-16
 * Time: 上午1:08
 * To change this template use File | Settings | File Templates.
 */

import java.util.Date;
import java.util.List;
import java.util.ArrayList;
import java.util.Map;
import java.util.HashMap;
import java.text.SimpleDateFormat;

import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.transaction.annotation.Transactional;

import com.brains.prj.tianjiu.order.common.TotalList;
import com.brains.prj.tianjiu.order.domain.*;
import com.brains.prj.tianjiu.order.orm.*;

@Service
class OrderAOP {

    public static final String CACHE_NAME = "orderCache";

    OrderMapper orderMapper;

    CartMapper cartMapper;

    ShippingMapper shippingMapper;

    DeliveryMapper deliveryMapper;

    PaymentMapper paymentMapper;

    @Autowired
    public void setOrderMapper(OrderMapper orderMapper) {
        this.orderMapper = orderMapper;
    }

    @Autowired
    public void setCartMapper(CartMapper cartMapper) {
        this.cartMapper = cartMapper;
    }

    @Autowired
    public void setShippingMapper(ShippingMapper shippingMapper) {
        this.shippingMapper = shippingMapper;
    }

    @Autowired
    public void setDeliveryMapper(DeliveryMapper deliveryMapper) {
        this.deliveryMapper = deliveryMapper;
    }

    @Autowired
    public void setPaymentMapper(PaymentMapper paymentMapper) {
        this.paymentMapper = paymentMapper;
    }

    @Transactional(readOnly = true)
    public List<DeliveryInfo> getAvailableDelivery(short state) {
        return deliveryMapper.getDeliveriesByState(state);
    }

    @Transactional(readOnly = true)
    public List<PaymentInfo> getAvailablePayment(short state) {
        return paymentMapper.getPaymentsByState(state);
    }

    @Cacheable(value = CACHE_NAME, key = "'PaymentInfo' + #paymentId")
    @Transactional(readOnly = true)
    public PaymentInfo getPaymentInfo(int paymentId) {
        PaymentInfo paymentInfo = paymentMapper.getPaymentById(paymentId);
        return paymentInfo;
    }

    @Cacheable(value = CACHE_NAME, key = "'DeliveryInfo' + #deliveryId")
    @Transactional(readOnly = true)
    public DeliveryInfo getDeliveryInfo(int deliveryId) {
        DeliveryInfo deliveryInfo = deliveryMapper.getDeliveryById(deliveryId);
        return deliveryInfo;
    }

    @Transactional
    public int submitOrder(Order order, ShoppingCart shoppingCart) {
        ShippingInfo shippingInfo = order.getShippingInfo();
        if (shippingInfo == null) {
            return 0;
        } else {
            orderMapper.createShippingInfo(shippingInfo);
            order.setShippingId(shippingInfo.getId());
        }

        int createResult = orderMapper.createOrder(order);

        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
        String date = formatter.format(order.getCreatedDate());
        String orderCd = date + String.format("%06d", order.getId());
        order.setOrderCd(orderCd);

        orderMapper.setOrderCd(order.getId(), order.getOrderCd());

        for (CartItem cartItem : shoppingCart.getCartItems()) {
            GoodsItem goodsItem = cartItem.getGoodsItem();
            OrderItem orderItem = new OrderItem();
            orderItem.setOrderId(order.getId());
            orderItem.setItemId(cartItem.getItemId());
            orderItem.setItemType(goodsItem.getTypes());
            orderItem.setQuantity(cartItem.getQuantity());
            orderItem.setBasePrice(goodsItem.getPrice());
            orderItem.setPrice(goodsItem.getPrice());

            orderMapper.createOrderItem(orderItem);
        }
        return createResult;
    }

    public int updateOrderFee(Order order, OrderFee orderFee) {
        return 0;
    }

    @Transactional
    public int updateOrderState(int orderId, short newState) {
        return orderMapper.updateOrderStateById(orderId, newState);
    }

    @Transactional
    public int updateOrderState(String orderCd, short newState) {
        return orderMapper.updateOrderStateByCd(orderCd, newState);
    }

    @Transactional(readOnly = true)
    public Order getUserOrder(int userId, int orderId) {
        Order order = orderMapper.getUserOrderInfoById(userId, orderId);
        if (order != null) {
            List<OrderItem> orderItems = orderMapper.getOrderItems(order.getId());
            order.setOrderItems(orderItems);
        }
        return order;
    }

    @Transactional(readOnly = true)
    public Order getUserOrder(int userId, String orderCd) {
        Order order = orderMapper.getUserOrderInfoByCd(userId, orderCd);
        if (order != null) {
            List<OrderItem> orderItems = orderMapper.getOrderItems(order.getId());
            order.setOrderItems(orderItems);
        }
        return order;
    }

    @Transactional(readOnly = true)
    public List<Order> getUserOrderContainEvaItem(int userId, int checkHours) {
        short[] orderStates =
                {Order.STATE_SUBMIT, Order.STATE_PAYED, Order.STATE_SHIPPED, Order.STATE_COMPLETE};
        List<Order> orders =
                orderMapper.getUserOrderContainEvaItem(userId, GoodsItem.TYPES_EVA, orderStates, checkHours);
        return orders;
    }

    @Transactional(readOnly = true)
    public int getUserOrderBuyEvaItemSum(int userId, int checkHours) {
        short[] orderStates =
                {Order.STATE_SUBMIT, Order.STATE_PAYED, Order.STATE_SHIPPED, Order.STATE_COMPLETE};
        int sum =
                orderMapper.getUserOrderBuyEvaItemSum(userId, GoodsItem.TYPES_EVA, orderStates, checkHours);
        return sum;
    }

    @Transactional(readOnly = true)
    public void fillOrdersItems(List<Order> orders) {
        List<Integer> ids = new ArrayList<Integer>(orders.size());
        Map<Integer, Order> map = new HashMap<Integer, Order>();
        for (Order order : orders) {
            order.setOrderItems(new ArrayList<OrderItem>());
            ids.add(order.getId());
            map.put(order.getId(), order);
        }
        if (ids.size() > 0) {
            List<OrderItem> orderItems = orderMapper.getOrdersItems(ids);
            for (OrderItem orderItem : orderItems) {
                Order order = map.get(orderItem.getOrderId());
                if (order != null) {
                    order.getOrderItems().add(orderItem);
                }
            }
        }
    }

    @Transactional(readOnly = true)
    public List<Order> getUserOrders(int userId) {
        List<Order> orders = orderMapper.getUserOrders(userId);
        fillOrdersItems(orders);
        return orders;
    }

    @Transactional(readOnly = true)
    public List<Order> getUserUnCompleteOrders(int userId) {
        short[] complete_state =
                {Order.STATE_CREATED, Order.STATE_SUBMIT, Order.STATE_PAYED, Order.STATE_SHIPPED};
        List<Order> orders = orderMapper.getUserOrdersByState(userId, complete_state);
        fillOrdersItems(orders);
        return orders;
    }

    @Transactional(readOnly = true)
    public List<Order> getUserCompleteOrders(int userId) {
        short[] complete_state
                = {Order.STATE_COMPLETE, Order.STATE_CANCELED};
        List<Order> orders = orderMapper.getUserOrdersByState(userId, complete_state);
        fillOrdersItems(orders);
        return orders;
    }

    @Cacheable(value = CACHE_NAME, key = "'ShippingInfo' + #shippingId")
    @Transactional(readOnly = true)
    public ShippingInfo getOrderShippingInfo(int shippingId) {
        ShippingInfo shippingInfo = orderMapper.getShippingInfoById(shippingId);
        return shippingInfo;
    }

    @Transactional
    public int addOrderStatus(OrderStatus orderStatus) {
        int add = orderMapper.createOrderStatus(orderStatus);
        return add;
    }

    @Transactional(readOnly = true)
    public List<OrderStatus> getOrderStatus(int orderId) {
        List<OrderStatus> orderStatuses = orderMapper.getOrderStatus(orderId);
        return orderStatuses;
    }

    @Transactional
    public int addOrderLog(OrderLog orderLog) {
        int add = orderMapper.createOrderLog(orderLog);
        return add;
    }

    @Transactional(readOnly = true)
    public TotalList<Order> getOrdersToDeal() {
        short[] to_deal_state =
                {Order.STATE_SUBMIT, Order.STATE_PAYED, Order.STATE_SHIPPED};
        List<Order> orders = orderMapper.getOrdersByState(to_deal_state);
        return new TotalList<Order>(orders.size(), orders);
    }

    @Transactional(readOnly = true)
    public TotalList<Order> getOrdersList(int offset, int limit) {
        List<Order> orders = orderMapper.getOrdersByPage(offset, limit);
        int total = orderMapper.getFoundRows();
        return new TotalList<Order>(total, orders);
    }

    @Transactional(readOnly = true)
    public Order getOrderById(int orderId) {
        Order order = orderMapper.getOrderInfoById(orderId);
        if (order != null) {
            List<OrderItem> orderItems = orderMapper.getOrderItems(order.getId());
            order.setOrderItems(orderItems);
        }
        return order;
    }

    @Transactional(readOnly = true)
    public Order getOrderByCd(String orderCd) {
        Order order = orderMapper.getOrderInfoByCd(orderCd);
        if (order != null) {
            List<OrderItem> orderItems = orderMapper.getOrderItems(order.getId());
            order.setOrderItems(orderItems);
        }
        return order;
    }

    @Transactional(readOnly = true)
    public Order getOrderInfoByCd(String orderCd) {
        Order order = orderMapper.getOrderInfoByCd(orderCd);
        return order;
    }
}
