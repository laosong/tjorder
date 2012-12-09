package com.brains.prj.tianjiu.order.service;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-7-7
 * Time: 上午10:55
 * To change this template use File | Settings | File Templates.
 */

import java.util.List;
import java.util.ArrayList;
import java.util.Date;

import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

import com.brains.prj.tianjiu.order.common.TotalList;
import com.brains.prj.tianjiu.order.domain.*;

@Service
public class OrderService {

    public static final int DEFAULT_DELIVERY_ID = 1;

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

    public void checkCartForSubmit(int userId, ShoppingCart shoppingCart) throws CartEmptyException,
            GoodsStateException, EvaGoodsBuyException {
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
        List<Order> evaOrders = orderAOP.getUserOrderContainEvaItem(userId, ShoppingCartService.CHECK_ORDER_CONTAIN_EVA_HOURS);
        List<GoodsItem> evaGoods = new ArrayList<GoodsItem>();
        for (CartItem cartItem : shoppingCart.getCartItems()) {
            if (cartItem.getGoodsItem().beEva() == true) {
                evaGoods.add(cartItem.getGoodsItem());
            }
        }
        if (evaOrders.size() + evaGoods.size() > 0) {
            throw new EvaGoodsBuyException(evaGoods, evaOrders);
        }
    }

    public OrderFee submitCart(int userId, ShoppingCart shoppingCart) throws CartEmptyException,
            GoodsStateException, EvaGoodsBuyException {
        checkCartForSubmit(userId, shoppingCart);

        Order order = new Order();
        DeliveryInfo deliveryInfo = orderAOP.getDeliveryInfo(DEFAULT_DELIVERY_ID);
        order.setDeliveryInfo(deliveryInfo);
        OrderFee orderFee = order.calcOrderFee(shoppingCart.getTotalPrice());
        return orderFee;
    }

    public void submitOrder(Order order, ShoppingCart shoppingCart) throws CartEmptyException,
            GoodsStateException, EvaGoodsBuyException {
        checkCartForSubmit(order.getUserId(), shoppingCart);

        float itemFee = shoppingCart.getTotalPrice();
        OrderFee orderFee = order.calcOrderFee(itemFee);

        order.setOrderCd("");
        order.setTypes(Order.TYPES_NORMAL);
        order.setSumPrice(orderFee.getTotalFee());
        order.setCreatedDate(new Date());
        order.setState(Order.STATE_SUBMIT);

        orderAOP.submitOrder(order, shoppingCart);
    }

    public Order preparePay(int userId, String orderCd) throws OrderNotFoundException,
            OrderPayNoNeedException, OrderStateException, OrderPayExpiredException {
        Order order = orderAOP.getUserOrder(userId, orderCd);
        if (order == null) {
            throw new OrderNotFoundException(orderCd);
        }
        if (order.getPaymentId() == 1) {
            throw new OrderPayNoNeedException(order);
        }
        return order;
    }

    public void payOrder(String orderCd) throws OrderNotFoundException {
        int ret = orderAOP.updateOrderState(orderCd, Order.STATE_PAYED);
    }

    public void shipOrder(String orderCd) throws OrderNotFoundException {
        int ret = orderAOP.updateOrderState(orderCd, Order.STATE_SHIPPED);
    }

    public void completeOrder(String orderCd) throws OrderNotFoundException {
        int ret = orderAOP.updateOrderState(orderCd, Order.STATE_COMPLETE);
    }

    public void cancelOrder(String orderCd) throws OrderNotFoundException {
        int ret = orderAOP.updateOrderState(orderCd, Order.STATE_CANCELED);
    }

    public Order getUserOrder(int userId, int orderId) throws OrderNotFoundException {
        Order order = orderAOP.getUserOrder(userId, orderId);
        if (order == null) {
            throw new OrderNotFoundException(orderId);
        }
        return order;
    }

    public Order getUserOrder(int userId, String orderCd) throws OrderNotFoundException {
        Order order = orderAOP.getUserOrder(userId, orderCd);
        if (order == null) {
            throw new OrderNotFoundException(orderCd);
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

    public void addOrderLog(OrderLog orderLog) {
        orderAOP.addOrderLog(orderLog);
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

