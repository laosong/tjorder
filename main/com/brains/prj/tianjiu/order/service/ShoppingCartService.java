package com.brains.prj.tianjiu.order.service;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-7-7
 * Time: 下午6:43
 * To change this template use File | Settings | File Templates.
 */

import java.util.List;
import java.util.ArrayList;

import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

import com.brains.prj.tianjiu.order.domain.*;

@Service
public class ShoppingCartService {

    public static final int BUY_COUNT_MIN = 1;
    public static final int BUY_COUNT_MAX = 100;

    public static final int MAX_CART_ITEM_COUNT = 10;

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
                goodsItem = GoodsService.nonItem;
            cartItem.setGoodsItem(goodsItem);
        }
        shoppingCart.setCartItems(cartItems);
        return shoppingCart;
    }

    public void addItem(int userId, int itemId, int itemCount) throws BadBuyCountException,
            GoodsNotFoundException, GoodsStateException, CartFullException, EvaGoodsBuyException, EvaGoodBuyCountException {
        if (itemCount < BUY_COUNT_MIN || itemCount > BUY_COUNT_MAX) {
            throw new BadBuyCountException(BUY_COUNT_MIN, BUY_COUNT_MAX);
        }
        GoodsItem goodsItem = goodsAOP.getGoodsItem(itemId);
        if (goodsItem == null) {
            throw new GoodsNotFoundException(itemId);
        }
        if (goodsItem.okForSale() == false) {
            throw new GoodsStateException(goodsItem);
        }
        ShoppingCart shoppingCart = getUserCart(userId);
        if (shoppingCart.getItemCount() > MAX_CART_ITEM_COUNT) {
            throw new CartFullException(MAX_CART_ITEM_COUNT);
        }
        if (goodsItem.beEva() == true) {
            List<Order> evaOrders = orderAOP.getUserOrderContainEvaItem(userId, CHECK_ORDER_CONTAIN_EVA_HOURS);
            List<GoodsItem> evaGoods = new ArrayList<GoodsItem>();
            for (CartItem cartItem : shoppingCart.getCartItems()) {
                if (cartItem.getGoodsItem().beEva() == true) {
                    evaGoods.add(cartItem.getGoodsItem());
                }
            }
            if (evaOrders.size() + evaGoods.size() > 0) {
                throw new EvaGoodsBuyException(evaGoods, evaOrders);
            }

            if (itemCount > MAX_EVA_GOODS_BUY) {
                throw new EvaGoodBuyCountException(goodsItem, MAX_EVA_GOODS_BUY);
            }
        }
        if (itemCount <= 0)
            itemCount = 1;

        shoppingCartAOP.addItem(userId, goodsItem, itemCount);
    }

    public void delItem(int userId, int id, int itemId) throws GoodsNotFoundException,
            GoodsStateException, CartItemNotFoundException {
        int affectRows = shoppingCartAOP.delItem(userId, id, itemId);
        if (affectRows <= 0) {
            throw new CartItemNotFoundException(id, itemId);
        }
    }

    public void incItem(int userId, int id, int itemId) throws GoodsNotFoundException,
            GoodsStateException, EvaGoodBuyCountException, CartItemNotFoundException {
        GoodsItem goodsItem = goodsAOP.getGoodsItem(itemId);
        if (goodsItem == null) {
            throw new GoodsNotFoundException(itemId);
        }
        if (goodsItem.okForSale() == false) {
            throw new GoodsStateException(goodsItem);
        }
        if (goodsItem.beEva() == true) {
            throw new EvaGoodBuyCountException(goodsItem, MAX_EVA_GOODS_BUY);
        }
        int affectRows = shoppingCartAOP.incItem(userId, id, itemId);
        if (affectRows <= 0) {
            throw new CartItemNotFoundException(id, itemId);
        }
    }

    public void decItem(int userId, int id, int itemId) throws GoodsNotFoundException,
            GoodsStateException, CartItemNotFoundException {
        GoodsItem goodsItem = goodsAOP.getGoodsItem(itemId);
        if (goodsItem == null) {
            throw new GoodsNotFoundException(itemId);
        }
        if (goodsItem.okForSale() == false) {
            throw new GoodsStateException(goodsItem);
        }
        if (goodsItem.beEva() == true) {
        }
        int affectRows = shoppingCartAOP.decItem(userId, id, itemId);
        if (affectRows <= 0) {
            throw new CartItemNotFoundException(id, itemId);
        }
    }

    public void setItemCount(int userId, int id, int itemId, int itemCount) throws BadBuyCountException,
            GoodsNotFoundException, GoodsStateException, EvaGoodBuyCountException, CartItemNotFoundException {
        if (itemCount < BUY_COUNT_MIN || itemCount > BUY_COUNT_MAX) {
            throw new BadBuyCountException(BUY_COUNT_MIN, BUY_COUNT_MAX);
        }
        GoodsItem goodsItem = goodsAOP.getGoodsItem(itemId);
        if (goodsItem == null) {
            throw new GoodsNotFoundException(itemId);
        }
        if (goodsItem.okForSale() == false) {
            throw new GoodsStateException(goodsItem);
        }
        if (goodsItem.beEva() == true) {
            if (itemCount > MAX_EVA_GOODS_BUY) {
                throw new EvaGoodBuyCountException(goodsItem, MAX_EVA_GOODS_BUY);
            }
        }
        int affectRows = shoppingCartAOP.setItemCount(userId, id, itemId, itemCount);
        if (affectRows <= 0) {
            throw new CartItemNotFoundException(id, itemId);
        }
    }

    public int clearUserCart(int userId) {
        return shoppingCartAOP.delUserCartItem(userId);
    }
}