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

    public List<CartItem> getCartItems() {
        return cartItems;
    }

    public void setCartItems(List<CartItem> cartItems) {
        this.cartItems = cartItems;
    }

    public int getItemCount() {
        int itemCount = 0;
        if (cartItems != null) {
            itemCount = cartItems.size();
        }
        return itemCount;
    }

    public int getItemSum() {
        int itemSum = 0;
        if (cartItems != null) {
            for (CartItem cartItem : cartItems) {
                itemSum += cartItem.getQuantity();
            }
        }
        return itemSum;
    }

    public float getTotalPrice() {
        float totalPrice = 0;
        if (cartItems != null) {
            for (CartItem cartItem : cartItems) {
                ProductItem productItem = cartItem.getProductItem();
                if (productItem != null) {
                    totalPrice += cartItem.getQuantity() * productItem.getPrice();
                }
            }
        }
        return totalPrice;
    }
}
