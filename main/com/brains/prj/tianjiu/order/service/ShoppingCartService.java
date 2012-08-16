package com.brains.prj.tianjiu.order.service;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-7-7
 * Time: 下午6:43
 * To change this template use File | Settings | File Templates.
 */

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

import com.brains.prj.tianjiu.order.domain.*;
import com.brains.prj.tianjiu.order.orm.*;

@Service
public class ShoppingCartService {

    public static final int MAX_ITEM_COUNT = 10;

    public static final int MAX_EVA_GOODS_BUY = 1;

    public static final int CHECK_ORDER_CONTAIN_EVA_HOURS = 30 * 24;

    ShoppingCartAOP shoppingCartAOP;

    GoodsAOP goodsAOP;

    OrderAOP orderAOP;

    @Autowired
    public void setShoppingCartAOP(ShoppingCartAOP shoppingCartAOP) {
        this.shoppingCartAOP = shoppingCartAOP;
    }

    @Autowired
    public void setGoodsAOP(GoodsAOP goodsAOP) {
        this.goodsAOP = goodsAOP;
    }

    @Autowired
    public void setOrderAOP(OrderAOP orderAOP) {
        this.orderAOP = orderAOP;
    }

    public ShoppingCart getUserCart(int userId) {
        ShoppingCart shoppingCart = new ShoppingCart();
        List<CartItem> cartItems = shoppingCartAOP.getUserCartItems(userId);
        for (CartItem cartItem : cartItems) {
            GoodsItem goodsItem = goodsAOP.getGoodsItem(cartItem.getItemId());
            if (goodsItem == null)
                goodsItem = GoodsService.nobodyItem;
            cartItem.setGoodsItem(goodsItem);
        }
        shoppingCart.setCartItems(cartItems);
        return shoppingCart;
    }

    public void addItem(int userId, int itemId, int itemCount) throws GoodsNotFoundException,
            GoodsStateException, CartFullException, EvaGoodsBuyCountException, EvaGoodsAlreadyBuyException {
        GoodsItem goodsItem = goodsAOP.getGoodsItem(itemId);
        if (goodsItem == null) {
            throw new GoodsNotFoundException(itemId);
        }
        if (goodsItem.okForSale() == false) {
            throw new GoodsStateException(goodsItem);
        }
        ShoppingCart shoppingCart = getUserCart(userId);
        if (shoppingCart.getItemCount() > MAX_ITEM_COUNT) {
            throw new CartFullException(MAX_ITEM_COUNT);
        }
        if (goodsItem.beEva() == true) {
            if (itemCount > MAX_EVA_GOODS_BUY) {
                throw new EvaGoodsBuyCountException(itemCount, MAX_EVA_GOODS_BUY);
            }
            int evaItemCountInCart = 0;
            for (CartItem cartItem : shoppingCart.getCartItems()) {
                if (cartItem.getGoodsItem().beEva() == true) {
                    evaItemCountInCart += cartItem.getQuantity();
                }
            }
            int evaItemCount = itemCount + evaItemCountInCart;
            if (evaItemCount > MAX_EVA_GOODS_BUY) {
                throw new EvaGoodsBuyCountException(evaItemCount, MAX_EVA_GOODS_BUY);
            }
            List<Order> ordersContainEvaItem = orderAOP.getUserOrderContainEvaItem(userId, CHECK_ORDER_CONTAIN_EVA_HOURS);
            if (ordersContainEvaItem.size() > 0) {
                throw new EvaGoodsAlreadyBuyException(goodsItem, ordersContainEvaItem.get(0));
            }
        }
        if (itemCount <= 0)
            itemCount = 1;

        shoppingCartAOP.addItem(userId, goodsItem, itemCount);
    }

    public void delItem(int userId, int id, int itemId) throws CartItemNotFoundException {
        int affectRows = shoppingCartAOP.delItem(userId, id, itemId);
        if (affectRows <= 0) {
            throw new CartItemNotFoundException(id, itemId);
        }
    }

    public void incItem(int userId, int id, int itemId) throws CartItemNotFoundException {
        int affectRows = shoppingCartAOP.incItem(userId, id, itemId);
        if (affectRows <= 0) {
            throw new CartItemNotFoundException(id, itemId);
        }
    }

    public void decItem(int userId, int id, int itemId) throws CartItemNotFoundException {
        int affectRows = shoppingCartAOP.decItem(userId, id, itemId);
        if (affectRows <= 0) {
            throw new CartItemNotFoundException(id, itemId);
        }
    }

    public void setItemCount(int userId, int id, int itemId, int itemCount) throws CartItemNotFoundException {
        int affectRows = shoppingCartAOP.setItemCount(userId, id, itemId, itemCount);
        if (affectRows <= 0) {
            throw new CartItemNotFoundException(id, itemId);
        }
    }
}