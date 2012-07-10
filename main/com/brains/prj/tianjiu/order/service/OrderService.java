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
import org.springframework.transaction.annotation.Transactional;
import org.springframework.beans.factory.annotation.Autowired;

import com.brains.prj.tianjiu.order.domain.*;
import com.brains.prj.tianjiu.order.orm.*;

@Service
public class OrderService {

    @Autowired
    OrderMapper orderMapper;

    @Autowired
    CartMapper cartMapper;

    @Transactional
    public int addProductItem(String name, String img) {
        ProductItem productItem = new ProductItem();
        productItem.setName(name);
        productItem.setImg(img);
        return orderMapper.addProductItem(productItem);
    }

    @Transactional(readOnly = true)
    public List<ProductItem> getItemList() {
        return orderMapper.getItemList();
    }

    @Transactional
    public int createOrderFromCart(int userId) throws CartEmptyException, ProductStateException {
        int createResult = 0;
        ShoppingCart shoppingCart = new ShoppingCart();
        shoppingCart.setCartItems(cartMapper.getDetailItemsByUser(userId));
        for (CartItem cartItem : shoppingCart.getCartItems()) {
            ProductItem productItem = cartItem.getProductItem();
            if (productItem.okForSale() == false) {
                throw new ProductStateException(productItem.getId());
            }
        }
        Order order = new Order();
        order.setOrderCd(org.apache.commons.lang.RandomStringUtils.randomAscii(20));
        order.setTypes((short) 1);
        order.setSumPrice(shoppingCart.getTotalPrice());
        order.setCreatedDate(new Date());
        order.setState((short) 0);

        createResult = orderMapper.createOrder(order);

        for (CartItem cartItem : shoppingCart.getCartItems()) {
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

        return createResult;
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
