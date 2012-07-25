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
import org.springframework.cache.annotation.Cacheable;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.transaction.annotation.Transactional;

import com.brains.prj.tianjiu.order.domain.*;
import com.brains.prj.tianjiu.order.orm.*;

@Service
public class OrderService {
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
    public List<DeliveryInfo> getAvailableDelivery() {
        return deliveryMapper.getDeliveriesByState((short) 1);
    }

    @Transactional(readOnly = true)
    public List<PaymentInfo> getAvailablePayment() {
        return paymentMapper.getPaymentsByState((short) 1);
    }

    @Transactional
    public int submitOrder(Order order) throws CartEmptyException, ProductStateException {
        ShippingInfo shippingInfo = order.getShippingInfo();
        if (shippingInfo == null) {
            return 0;
        } else {
            orderMapper.createShippingInfo(shippingInfo);
            order.setShippingId(shippingInfo.getId());
        }

        ShoppingCart cart = new ShoppingCart();
        List<CartItem> cartItems = cartMapper.getDetailItemsByUser(order.getUserId());
        if (cartItems.size() <= 0) {
            throw new CartEmptyException();
        }
        cart.setCartItems(cartItems);

        for (CartItem cartItem : cartItems) {
            ProductItem productItem = cartItem.getProductItem();
            if (productItem.okForSale() == false) {
                throw new ProductStateException(productItem.getId());
            }
        }
        float itemFee = cart.getTotalPrice();
        OrderFee orderFee = order.calcOrderFee(itemFee);

        order.setOrderCd(org.apache.commons.lang.RandomStringUtils.randomAscii(20));
        order.setTypes((short) 1);
        order.setSumPrice(orderFee.getTotalFee());
        order.setCreatedDate(new Date());
        order.setState((short) 1);

        int createResult = orderMapper.createOrder(order);

        for (CartItem cartItem : cartItems) {
            ProductItem productItem = cartItem.getProductItem();
            OrderItem orderItem = new OrderItem();
            orderItem.setOrderId(order.getId());
            orderItem.setItemId(cartItem.getItemId());
            orderItem.setItemType((short) 1);
            orderItem.setQuantity(cartItem.getQuantity());
            orderItem.setBasePrice(productItem.getPrice());
            orderItem.setPrice(productItem.getPrice());

            orderMapper.createOrderItem(orderItem);
        }

        return order.getId();
    }

    public void updateOrderFee(Order order, OrderFee orderFee) {
    }

    @Cacheable(value = CACHE_NAME, key = "'PaymentInfo' + #id")
    @Transactional(readOnly = true)
    public PaymentInfo getPaymentInfo(int id) throws PaymentNotFoundException {
        PaymentInfo paymentInfo = paymentMapper.getPaymentById(id);
        if (paymentInfo == null) {
            throw new PaymentNotFoundException();
        }
        return paymentInfo;
    }

    @Cacheable(value = CACHE_NAME, key = "'DeliveryInfo' + #id")
    @Transactional(readOnly = true)
    public DeliveryInfo getDeliveryInfo(int id) throws DeliveryNotFoundException {
        DeliveryInfo deliveryInfo = deliveryMapper.getDeliveryById(id);
        if (deliveryInfo == null) {
            throw new DeliveryNotFoundException();
        }
        return deliveryInfo;
    }

    @Transactional(readOnly = true)
    public Order getUserOrderDetail(int userId, int orderId) throws OrderNotFoundException {
        Order order = orderMapper.getUserOrderInfo(userId, orderId);
        if (order == null) {
            throw new OrderNotFoundException();
        }
        order.setOrderItems(orderMapper.getOrderItems(order.getId()));

        return order;
    }

    @Transactional(readOnly = true)
    public ShippingInfo getOrderShippingInfo(int shippingId) throws ShippingNotFoundException {
        ShippingInfo shippingInfo = orderMapper.getShippingInfoById(shippingId);
        if (shippingInfo == null) {
            throw new ShippingNotFoundException();
        }
        return shippingInfo;
    }

    public List<ProductItem> getTestItems() {
        List<ProductItem> testItems = new java.util.LinkedList<ProductItem>();
        for (int i = 0; i < 10; i++) {
            ProductItem item = new ProductItem();
            item.setName(org.apache.commons.lang.RandomStringUtils.randomAscii(20));
            item.setImg("getTestItems.jpg");
            testItems.add(item);
        }
        return testItems;
    }
}
