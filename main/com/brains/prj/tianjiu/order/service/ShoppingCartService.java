package com.brains.prj.tianjiu.order.service;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-7-7
 * Time: 下午6:43
 * To change this template use File | Settings | File Templates.
 */

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

import com.brains.prj.tianjiu.order.domain.*;

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

    public void checkCartForEvaGoods(int userId, ShoppingCart cart, int itemCountOld, int itemCountNew)
            throws BuyEvaGoodsException {
        int maxBefore = MAX_EVA_GOODS_BUY - (itemCountNew - itemCountOld);
        if (maxBefore < 0) {
            throw new BuyEvaGoodsException(MAX_EVA_GOODS_BUY);
        } else {
            int evaItemSumInCart = 0;
            for (CartItem cartItem : cart.getCartItems()) {
                if (cartItem.getGoodsItem().beEva() == true) {
                    evaItemSumInCart += cartItem.getQuantity();
                }
            }
            if (evaItemSumInCart <= 0)
                return;
            if (maxBefore < evaItemSumInCart) {
                throw new BuyEvaGoodsException(MAX_EVA_GOODS_BUY);
            } else {
                int evaItemAlreadyBuy = orderAOP.getUserOrderBuyEvaItemSum(userId, CHECK_ORDER_CONTAIN_EVA_HOURS);
                if (maxBefore < evaItemSumInCart + evaItemAlreadyBuy) {
                    throw new BuyEvaGoodsException(MAX_EVA_GOODS_BUY);
                }
            }
        }
    }

    public void addItem(int userId, int itemId, int itemCount) throws GoodsNotFoundException,
            GoodsStateException, CartFullException, BuyEvaGoodsException {
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
            checkCartForEvaGoods(userId, shoppingCart, 0, itemCount);
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
            GoodsStateException, BuyEvaGoodsException, CartItemNotFoundException {
        GoodsItem goodsItem = goodsAOP.getGoodsItem(itemId);
        if (goodsItem == null) {
            throw new GoodsNotFoundException(itemId);
        }
        if (goodsItem.okForSale() == false) {
            throw new GoodsStateException(goodsItem);
        }
        if (goodsItem.beEva() == true) {
            ShoppingCart shoppingCart = getUserCart(userId);
            checkCartForEvaGoods(userId, shoppingCart, 0, 1);
        }
        int affectRows = shoppingCartAOP.incItem(userId, id, itemId);
        if (affectRows <= 0) {
            throw new CartItemNotFoundException(id, itemId);
        }
    }

    public void decItem(int userId, int id, int itemId) throws GoodsNotFoundException,
            GoodsStateException, BuyEvaGoodsException, CartItemNotFoundException {
        GoodsItem goodsItem = goodsAOP.getGoodsItem(itemId);
        if (goodsItem == null) {
            throw new GoodsNotFoundException(itemId);
        }
        if (goodsItem.okForSale() == false) {
            throw new GoodsStateException(goodsItem);
        }
        if (goodsItem.beEva() == true) {
            ShoppingCart shoppingCart = getUserCart(userId);
            checkCartForEvaGoods(userId, shoppingCart, 0, 0);
        }
        int affectRows = shoppingCartAOP.decItem(userId, id, itemId);
        if (affectRows <= 0) {
            throw new CartItemNotFoundException(id, itemId);
        }
    }

    public void setItemCount(int userId, int id, int itemId, int itemCount) throws GoodsNotFoundException,
            GoodsStateException, BuyEvaGoodsException, CartItemNotFoundException {
        GoodsItem goodsItem = goodsAOP.getGoodsItem(itemId);
        if (goodsItem == null) {
            throw new GoodsNotFoundException(itemId);
        }
        if (goodsItem.okForSale() == false) {
            throw new GoodsStateException(goodsItem);
        }
        if (goodsItem.beEva() == true) {
            ShoppingCart shoppingCart = getUserCart(userId);
            int itemCountOld = 0;
            for (CartItem cartItem : shoppingCart.getCartItems()) {
                if (cartItem.getId() == id) {
                    itemCountOld = cartItem.getQuantity();
                }
            }
            checkCartForEvaGoods(userId, shoppingCart, itemCountOld, itemCount);
        }
        int affectRows = shoppingCartAOP.setItemCount(userId, id, itemId, itemCount);
        if (affectRows <= 0) {
            throw new CartItemNotFoundException(id, itemId);
        }
    }
}