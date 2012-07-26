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

import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.beans.factory.annotation.Autowired;

import com.brains.prj.tianjiu.order.domain.*;
import com.brains.prj.tianjiu.order.orm.*;

@Service
public class ShoppingCartService {

    public static final String CACHE_NAME = "orderCache";
    public static final String USER_CART_CACHE_KEY_PREFIX = "UserCartItems";

    public static final int MAX_ITEM_COUNT = 10;

    CartMapper cartMapper;

    ProductService productService;

    @Autowired
    public void setCartMapper(CartMapper cartMapper) {
        this.cartMapper = cartMapper;
    }

    @Autowired
    public void setProductService(ProductService productService) {
        this.productService = productService;
    }

    @CacheEvict(value = CACHE_NAME, key = "'UserCartItems' + #userId")
    @Transactional(rollbackFor = RuntimeException.class)
    public int addItem(int userId, ProductItem productItem, int itemCount, ShoppingCart shoppingCart)
            throws CartFullException {

        int userCartItemCount = cartMapper.getItemCountByUser(userId);
        if (userCartItemCount > MAX_ITEM_COUNT) {
            throw new CartFullException(MAX_ITEM_COUNT);
        }
        if (itemCount <= 0)
            itemCount = 1;
        int affectRows = cartMapper.incItemCountIfExist(userId, productItem.getId(), itemCount);
        if (affectRows <= 0) {
            CartItem cartItem = new CartItem();
            cartItem.setUserId(userId);
            cartItem.setItemId(productItem.getId());
            cartItem.setQuantity(itemCount);
            cartItem.setCreatedDate(new Date());
            affectRows = cartMapper.addItem(cartItem);
        }
        if (shoppingCart != null) {
            shoppingCart.setCartItems(cartMapper.getItemsByUser(userId));
        }
        return affectRows;
    }

    @CacheEvict(value = CACHE_NAME, key = "'UserCartItems' + #userId")
    @Transactional
    public int delItem(int userId, int id, int itemId) throws CartItemNotFoundException {
        int affectRows = cartMapper.delItemByTestId(userId, id, itemId);
        if (affectRows <= 0) {
            throw new CartItemNotFoundException(id, itemId);
        }
        return affectRows;
    }

    @CacheEvict(value = CACHE_NAME, key = "'UserCartItems' + #userId")
    @Transactional
    public int incItem(int userId, int id, int itemId) throws CartItemNotFoundException {
        int affectRows = cartMapper.incItemCountByTestId(userId, id, itemId, 1);
        if (affectRows <= 0) {
            throw new CartItemNotFoundException(id, itemId);
        }
        return affectRows;
    }

    @CacheEvict(value = CACHE_NAME, key = "'UserCartItems' + #userId")
    @Transactional
    public int decItem(int userId, int id, int itemId) throws CartItemNotFoundException {
        int affectRows = cartMapper.decItemCountByTestId(userId, id, itemId, 1);
        if (affectRows <= 0) {
            throw new CartItemNotFoundException(id, itemId);
        }
        return affectRows;
    }

    @CacheEvict(value = CACHE_NAME, key = "'UserCartItems' + #userId")
    @Transactional
    public int setItemCount(int userId, int id, int itemId, int itemCount) throws CartItemNotFoundException {
        int affectRows = cartMapper.setItemCountByTestId(userId, id, itemId, itemCount);
        if (affectRows <= 0) {
            throw new CartItemNotFoundException(id, itemId);
        }
        return affectRows;
    }

    @Cacheable(value = CACHE_NAME, key = "'UserCartItems' + #userId")
    @Transactional(readOnly = true)
    public List<CartItem> getUserCartItems(int userId) {
        return cartMapper.getItemsByUser(userId);
    }
}
