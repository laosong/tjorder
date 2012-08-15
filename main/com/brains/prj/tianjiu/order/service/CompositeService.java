package com.brains.prj.tianjiu.order.service;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-7-26
 * Time: 下午11:35
 * To change this template use File | Settings | File Templates.
 */

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

import com.brains.prj.tianjiu.order.domain.*;

@Service
public class CompositeService {

    private GoodsService goodsService;
    private ShoppingCartService shoppingCartService;
    private OrderService orderService;

    @Autowired
    public void setGoodsService(GoodsService goodsService) {
        this.goodsService = goodsService;
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
            throws GoodsNotFoundException, GoodsStateException, CartFullException {

        GoodsItem goodsItem = goodsService.getGoodsItem(itemId);
        if (goodsItem.okForSale() == false) {
            throw new GoodsStateException(goodsItem);
        }
        int add = shoppingCartService.addItem(userId, goodsItem, itemCount, shoppingCart);
        if (shoppingCart != null) {
            for (CartItem cartItem : shoppingCart.getCartItems()) {
                cartItem.setGoodsItem(goodsService.getGoodsItem(cartItem.getItemId()));
            }
        }
        return add;
    }

    public ShoppingCart getUserCart(int userId) {
        ShoppingCart shoppingCart = new ShoppingCart();
        List<CartItem> cartItems = shoppingCartService.getUserCartItems(userId);
        for (CartItem cartItem : cartItems) {
            cartItem.setGoodsItem(goodsService.getGoodsItem(cartItem.getItemId()));
        }
        shoppingCart.setCartItems(cartItems);
        return shoppingCart;
    }
}
