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

import com.brains.prj.tianjiu.order.common.OrderEventManager;
import com.brains.prj.tianjiu.order.domain.*;
import com.brains.prj.tianjiu.order.orm.*;
import com.brains.prj.tianjiu.order.edm.*;

@Service
public class OrderService {

    public static final String CACHE_NAME = "orderCache";

    OrderMapper orderMapper;

    CartMapper cartMapper;

    ShippingMapper shippingMapper;

    DeliveryMapper deliveryMapper;

    PaymentMapper paymentMapper;

    ProductService productService;

    OrderEventManager orderEventManager;

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

    @Autowired
    public void setProductService(ProductService productService) {
        this.productService = productService;
    }

    @Autowired
    public void setOrderEventManager(OrderEventManager orderEventManager) {
        this.orderEventManager = orderEventManager;
    }


    @Transactional(readOnly = true)
    public List<DeliveryInfo> getAvailableDelivery() {
        return deliveryMapper.getDeliveriesByState((short) 1);
    }

    @Transactional(readOnly = true)
    public List<PaymentInfo> getAvailablePayment() {
        return paymentMapper.getPaymentsByState((short) 1);
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

    @Transactional
    public int submitOrder(Order order, ShoppingCart shoppingCart) throws CartEmptyException, ProductStateException {
        ShippingInfo shippingInfo = order.getShippingInfo();
        if (shippingInfo == null) {
            return 0;
        } else {
            orderMapper.createShippingInfo(shippingInfo);
            order.setShippingId(shippingInfo.getId());
        }

        if (shoppingCart == null || shoppingCart.getCartItems().size() <= 0) {
            throw new CartEmptyException();
        }
        List<CartItem> cartItems = shoppingCart.getCartItems();
        for (CartItem cartItem : cartItems) {
            ProductItem productItem = cartItem.getProductItem();
            if (productItem.okForSale() == false) {
                throw new ProductStateException(productItem.getId());
            }
        }

        float itemFee = shoppingCart.getTotalPrice();
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
        orderEventManager.invoke(this, new OrderSubmitEventArgs(order.getId()));

        return createResult;
    }

    public void updateOrderFee(Order order, OrderFee orderFee) {
    }

    @Transactional(readOnly = true)
    public Order getUserOrderWithItem(int userId, int orderId) throws OrderNotFoundException {
        Order order = orderMapper.getUserOrderInfo(userId, orderId);
        if (order == null) {
            throw new OrderNotFoundException();
        }
        List<OrderItem> orderItems = orderMapper.getOrderItems(order.getId());
        order.setOrderItems(orderMapper.getOrderItems(order.getId()));

        return order;
    }

    @Cacheable(value = CACHE_NAME, key = "'ShippingInfo' + #shippingId")
    @Transactional(readOnly = true)
    public ShippingInfo getOrderShippingInfo(int shippingId) throws ShippingNotFoundException {
        ShippingInfo shippingInfo = orderMapper.getShippingInfoById(shippingId);
        if (shippingInfo == null) {
            throw new ShippingNotFoundException();
        }
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
}
