package com.brains.prj.tianjiu.order.service;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-7-9
 * Time: 上午11:06
 * To change this template use File | Settings | File Templates.
 */
public class ProductStateException extends Exception {
    private int itemId;

    public ProductStateException(int itemId) {
        this.itemId = itemId;
    }
}
