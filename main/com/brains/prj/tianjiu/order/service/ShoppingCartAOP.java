package com.brains.prj.tianjiu.order.service;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-8-16
 * Time: 上午12:44
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
class ShoppingCartAOP {

    public static final String CACHE_NAME = "orderCache";

    CartMapper cartMapper;

    @Autowired
    public void setCartMapper(CartMapper cartMapper) {
        this.cartMapper = cartMapper;
    }

    @CacheEvict(value = CACHE_NAME, key = "'UserCartItems' + #userId")
    @Transactional(rollbackFor = RuntimeException.class)
    public int addItem(int userId, GoodsItem goodsItem, int itemCount) {
        int affectRows = cartMapper.incItemCountIfExist(userId, goodsItem.getId(), itemCount);
        if (affectRows <= 0) {
            CartItem cartItem = new CartItem();
            cartItem.setUserId(userId);
            cartItem.setItemId(goodsItem.getId());
            cartItem.setQuantity(itemCount);
            cartItem.setCreatedDate(new Date());
            affectRows = cartMapper.addItem(cartItem);
        }
        return affectRows;
    }

    @CacheEvict(value = CACHE_NAME, key = "'UserCartItems' + #userId")
    @Transactional
    public int delItem(int userId, int id, int itemId) {
        int affectRows = cartMapper.delItemByTestId(userId, id, itemId);
        return affectRows;
    }

    @CacheEvict(value = CACHE_NAME, key = "'UserCartItems' + #userId")
    @Transactional
    public int incItem(int userId, int id, int itemId) {
        int affectRows = cartMapper.incItemCountByTestId(userId, id, itemId, 1);
        return affectRows;
    }

    @CacheEvict(value = CACHE_NAME, key = "'UserCartItems' + #userId")
    @Transactional
    public int decItem(int userId, int id, int itemId) {
        int affectRows = cartMapper.decItemCountByTestId(userId, id, itemId, 1);
        return affectRows;
    }

    @CacheEvict(value = CACHE_NAME, key = "'UserCartItems' + #userId")
    @Transactional
    public int setItemCount(int userId, int id, int itemId, int itemCount) {
        int affectRows = cartMapper.setItemCountByTestId(userId, id, itemId, itemCount);
        return affectRows;
    }

    @Cacheable(value = CACHE_NAME, key = "'UserCartItems' + #userId")
    @Transactional(readOnly = true)
    public List<CartItem> getUserCartItems(int userId) {
        return cartMapper.getItemsByUser(userId);
    }
}
