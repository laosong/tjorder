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
import java.util.ArrayList;
import java.util.Map;
import java.util.HashMap;

import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

import com.brains.prj.tianjiu.order.common.OrderEventManager;
import com.brains.prj.tianjiu.order.domain.*;
import com.brains.prj.tianjiu.order.orm.*;
import com.brains.prj.tianjiu.order.edm.*;

@Service
public class OrderService {

    OrderAOP orderAOP;

    @Autowired
    public void setOrderAOP(OrderAOP orderAOP) {
        this.orderAOP = orderAOP;
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

    public void checkCartForSubmit(int userId, ShoppingCart shoppingCart)
            throws CartEmptyException, GoodsStateException, EvaGoodsBuyCountException, EvaGoodsAlreadyBuyException {
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
        int evaItemCountInCart = 0;
        GoodsItem evaItemInCart = null;
        for (CartItem cartItem : shoppingCart.getCartItems()) {
            if (cartItem.getGoodsItem().beEva() == true) {
                evaItemCountInCart += cartItem.getQuantity();
                evaItemInCart = cartItem.getGoodsItem();
            }
        }
        if (evaItemCountInCart > ShoppingCartService.MAX_EVA_GOODS_BUY) {
            throw new EvaGoodsBuyCountException(evaItemCountInCart, ShoppingCartService.MAX_EVA_GOODS_BUY);
        }
        if (evaItemInCart != null) {
            List<Order> ordersContainEvaItem = orderAOP.getUserOrderContainEvaItem(userId, ShoppingCartService.CHECK_ORDER_CONTAIN_EVA_HOURS);
            if (ordersContainEvaItem.size() > 0) {
                throw new EvaGoodsAlreadyBuyException(evaItemInCart, ordersContainEvaItem.get(0));
            }
        }
    }

    public void submitCart(int userId, ShoppingCart shoppingCart)
            throws CartEmptyException, GoodsStateException, EvaGoodsBuyCountException, EvaGoodsAlreadyBuyException {
        checkCartForSubmit(userId, shoppingCart);
    }

    public void submitOrder(Order order, ShoppingCart shoppingCart)
            throws CartEmptyException, GoodsStateException, EvaGoodsBuyCountException, EvaGoodsAlreadyBuyException {
        checkCartForSubmit(order.getUserId(), shoppingCart);

        float itemFee = shoppingCart.getTotalPrice();
        OrderFee orderFee = order.calcOrderFee(itemFee);

        order.setOrderCd("");
        order.setTypes((short) 1);
        order.setSumPrice(orderFee.getTotalFee());
        order.setCreatedDate(new Date());
        order.setState((short) 1);

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
}

