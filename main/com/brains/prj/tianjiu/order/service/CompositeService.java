package com.brains.prj.tianjiu.order.service;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-7-26
 * Time: 下午11:35
 * To change this template use File | Settings | File Templates.
 */

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

import com.brains.prj.tianjiu.order.domain.*;
import com.brains.prj.tianjiu.order.orm.*;

@Service
public class CompositeService {

    private ProductService productService;
    private ShoppingCartService shoppingCartService;
    private OrderService orderService;

    @Autowired
    public void setProductService(ProductService productService) {
        this.productService = productService;
    }

    @Autowired
    public void setShoppingCartService(ShoppingCartService shoppingCartService) {
        this.shoppingCartService = shoppingCartService;
    }

    @Autowired
    public void setOrderService(OrderService orderService) {
        this.orderService = orderService;
    }

    public int addCartItem(int userId, int itemId, int itemCount, ShoppingCart shoppingCart)
            throws ProductNotFoundException, ProductStateException, CartFullException {

        ProductItem productItem = productService.getProductItem(itemId);
        if (productItem.okForSale() == false) {
            throw new ProductStateException(itemId);
        }
        int add = shoppingCartService.addItem(userId, productItem, itemCount, shoppingCart);
        if (shoppingCart != null) {
            for (CartItem cartItem : shoppingCart.getCartItems()) {
                cartItem.setProductItem(productService.getProductItem(cartItem.getItemId()));
            }
        }
        return add;
    }

    public ShoppingCart getUserCart(int userId) {
        ShoppingCart shoppingCart = new ShoppingCart();
        List<CartItem> cartItems = shoppingCartService.getUserCartItems(userId);
        for (CartItem cartItem : cartItems) {
            cartItem.setProductItem(productService.getProductItem(cartItem.getItemId()));
        }
        shoppingCart.setCartItems(cartItems);
        return shoppingCart;
    }
}
