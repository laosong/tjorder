package com.brains.prj.tianjiu.order.service;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-7-7
 * Time: 上午10:55
 * To change this template use File | Settings | File Templates.
 */

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

import com.brains.prj.tianjiu.order.common.TotalList;
import com.brains.prj.tianjiu.order.domain.*;

@Service
public class OrderService {

    OrderAOP orderAOP;

    GoodsAOP goodsAOP;

    @Autowired
    public void setOrderAOP(OrderAOP orderAOP) {
        this.orderAOP = orderAOP;
    }

    @Autowired
    public void setGoodsAOP(GoodsAOP goodsAOP) {
        this.goodsAOP = goodsAOP;
    }

    public List<DeliveryInfo> getAvailableDelivery() {
        return orderAOP.getAvailableDelivery((short) 1);
    }

    public List<PaymentInfo> getAvailablePayment() {
        return orderAOP.getAvailablePayment((short) 1);
    }

    public PaymentInfo getPaymentInfo(int paymentId) throws PaymentNotFoundException {
        PaymentInfo paymentInfo = orderAOP.getPaymentInfo(paymentId);
        if (paymentInfo == null) {
            throw new PaymentNotFoundException(paymentId);
        }
        return paymentInfo;
    }

    public DeliveryInfo getDeliveryInfo(int deliveryId) throws DeliveryNotFoundException {
        DeliveryInfo deliveryInfo = orderAOP.getDeliveryInfo(deliveryId);
        if (deliveryInfo == null) {
            throw new DeliveryNotFoundException(deliveryId);
        }
        return deliveryInfo;
    }

    public void submitCart(int userId, ShoppingCart shoppingCart, ShoppingCartService shoppingCartService)
            throws CartEmptyException, GoodsStateException, BuyEvaGoodsException {
        if (shoppingCart == null || shoppingCart.getCartItems().size() <= 0) {
            throw new CartEmptyException();
        }
        List<CartItem> cartItems = shoppingCart.getCartItems();
        for (CartItem cartItem : cartItems) {
            GoodsItem goodsItem = cartItem.getGoodsItem();
            if (goodsItem.okForSale() == false) {
                throw new GoodsStateException(goodsItem);
            }
        }
        shoppingCartService.checkCartForEvaGoods(userId, shoppingCart, 0, 0);
    }

    public void submitOrder(Order order, ShoppingCart shoppingCart, ShoppingCartService shoppingCartService)
            throws CartEmptyException, GoodsStateException, BuyEvaGoodsException {
        if (shoppingCart == null || shoppingCart.getCartItems().size() <= 0) {
            throw new CartEmptyException();
        }
        List<CartItem> cartItems = shoppingCart.getCartItems();
        for (CartItem cartItem : cartItems) {
            GoodsItem goodsItem = cartItem.getGoodsItem();
            if (goodsItem.okForSale() == false) {
                throw new GoodsStateException(goodsItem);
            }
        }
        shoppingCartService.checkCartForEvaGoods(order.getUserId(), shoppingCart, 0, 0);

        float itemFee = shoppingCart.getTotalPrice();
        OrderFee orderFee = order.calcOrderFee(itemFee);

        order.setOrderCd("");
        order.setTypes(Order.TYPES_NORMAL);
        order.setSumPrice(orderFee.getTotalFee());
        order.setCreatedDate(new Date());
        order.setState(Order.STATE_SUBMIT);

        orderAOP.submitOrder(order, shoppingCart);
    }

    public void updateOrderFee(Order order, OrderFee orderFee) {
    }

    public Order getUserOrder(int userId, int orderId) throws OrderNotFoundException {
        Order order = orderAOP.getUserOrder(userId, orderId);
        if (order == null) {
            throw new OrderNotFoundException(orderId);
        }
        return order;
    }

    public List<Order> getUserOrders(int userId) {
        List<Order> orders = orderAOP.getUserOrders(userId);
        return orders;
    }

    public List<Order> getUserUnCompleteOrders(int userId) {
        List<Order> orders = orderAOP.getUserUnCompleteOrders(userId);
        return orders;
    }

    public List<Order> getUserCompleteOrders(int userId) {
        List<Order> orders = orderAOP.getUserCompleteOrders(userId);
        return orders;
    }

    public ShippingInfo getOrderShippingInfo(int shippingId) throws ShippingNotFoundException {
        ShippingInfo shippingInfo = orderAOP.getOrderShippingInfo(shippingId);
        if (shippingInfo == null) {
            throw new ShippingNotFoundException(shippingId);
        }
        return shippingInfo;
    }

    public void addOrderStatus(OrderStatus orderStatus) {
        orderAOP.addOrderStatus(orderStatus);
    }

    public List<OrderStatus> getOrderStatus(int orderId) {
        List<OrderStatus> orderStatuses = orderAOP.getOrderStatus(orderId);
        return orderStatuses;
    }

    public TotalList<Order> getOrdersInfo(int offset, int limit) {
        TotalList<Order> ordersInfo = orderAOP.getOrdersInfo(offset, limit);
        return ordersInfo;
    }

    public Order getOrder(int orderId) throws OrderNotFoundException {
        Order order = orderAOP.getOrder(orderId);
        if (order == null) {
            throw new OrderNotFoundException(orderId);
        }
        for (OrderItem orderItem : order.getOrderItems()) {
            orderItem.setGoodsItem(goodsAOP.getGoodsItem(orderItem.getItemId()));
        }
        return order;
    }
}

