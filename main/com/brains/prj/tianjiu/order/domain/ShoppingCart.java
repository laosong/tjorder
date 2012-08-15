package com.brains.prj.tianjiu.order.domain;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-7-5
 * Time: 下午7:17
 * To change this template use File | Settings | File Templates.
 */

import java.io.Serializable;
import java.util.List;

public class ShoppingCart implements Serializable {
    private static final long serialVersionUID = -4592429556067485382L;

    private List<CartItem> cartItems;
    private int itemCount;
    private int itemSum;
    private float totalPrice;

    public List<CartItem> getCartItems() {
        return cartItems;
    }

    public void setCartItems(List<CartItem> cartItems) {
        this.cartItems = cartItems;
        if (cartItems != null) {
            for (CartItem cartItem : cartItems) {
                GoodsItem goodsItem = cartItem.getGoodsItem();
                if (goodsItem != null) {
                    itemCount++;
                    itemSum += cartItem.getQuantity();
                    totalPrice += cartItem.getQuantity() * goodsItem.getPrice();
                }
            }
        }
    }

    public boolean isEmpty() {
        return cartItems == null || cartItems.size() == 0;
    }

    public int getItemCount() {
        return itemCount;
    }

    public int getItemSum() {
        return itemSum;
    }

    public float getTotalPrice() {
        return totalPrice;
    }
}
