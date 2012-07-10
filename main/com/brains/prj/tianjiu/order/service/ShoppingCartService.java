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
import org.springframework.transaction.annotation.Transactional;
import org.springframework.beans.factory.annotation.Autowired;

import com.brains.prj.tianjiu.order.domain.*;
import com.brains.prj.tianjiu.order.orm.*;

@Service
public class ShoppingCartService {

    public static final int MAX_ITEM_COUNT = 10;

    @Autowired
    CartMapper cartMapper;

    @Autowired
    OrderMapper orderMapper;

    @Transactional(rollbackFor = RuntimeException.class)
    public int addItem(int userId, int itemId, int itemCount, ShoppingCart briefShoppingCart)
            throws ProductNotFoundException, ProductStateException, CartFullException {
        ProductItem productItem = orderMapper.getItemById(itemId);
        if (productItem == null) {
            throw new ProductNotFoundException(itemId);
        }
        if (productItem.okForSale() == false) {
            throw new ProductStateException(itemId);
        }

        int userCartItemCount = cartMapper.getItemCountByUser(userId);
        if (userCartItemCount > MAX_ITEM_COUNT) {
            throw new CartFullException(MAX_ITEM_COUNT);
        }
        if (itemCount <= 0)
            itemCount = 1;
        int affectRows = cartMapper.incItemCountIfExist(userId, itemId, itemCount);
        if (affectRows <= 0) {
            CartItem cartItem = new CartItem();
            cartItem.setUserId(userId);
            cartItem.setItemId(itemId);
            cartItem.setQuantity(itemCount);
            cartItem.setCreatedDate(new Date());
            affectRows = cartMapper.addItem(cartItem);
        }
        if (briefShoppingCart != null) {
            briefShoppingCart.setCartItems(cartMapper.getBriefItemsByUser(userId));
        }
        return affectRows;
    }

    @Transactional
    public int delItem(int userId, int id, int itemId) throws CartItemNotFoundException {
        int affectRows = 0;
        if (id > 0) {
            affectRows = cartMapper.delItemById(id, userId);
        } else {
            affectRows = cartMapper.delItemByItemId(itemId, userId);
        }
        if (affectRows <= 0) {
            throw new CartItemNotFoundException(id, itemId);
        }
        return affectRows;
    }

    @Transactional
    public int incItem(int userId, int id, int itemId) throws CartItemNotFoundException {
        int affectRows = 0;
        return affectRows;
    }

    @Transactional
    public int decItem(int userId, int id, int itemId) throws CartItemNotFoundException {
        int affectRows = 0;
        return affectRows;
    }

    @Transactional(readOnly = true)
    public ShoppingCart getUseCart(int userId) {
        ShoppingCart shoppingCart = new ShoppingCart();
        shoppingCart.setCartItems(cartMapper.getDetailItemsByUser(userId));
        return shoppingCart;
    }
}
