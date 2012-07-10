package com.brains.prj.tianjiu.order.service;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-7-9
 * Time: 上午10:54
 * To change this template use File | Settings | File Templates.
 */
public class ProductNotFoundException extends Exception {
    private int itemId;

    public ProductNotFoundException(int itemId) {
        this.itemId = itemId;
    }
}
