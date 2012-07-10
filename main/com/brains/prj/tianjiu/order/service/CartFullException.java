/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-7-8
 * Time: 上午1:10
 * To change this template use File | Settings | File Templates.
 */

package com.brains.prj.tianjiu.order.service;

public class CartFullException extends Exception {
    private int maxItemCount;

    public CartFullException(int maxItemCount) {
        this.maxItemCount = maxItemCount;
    }
}
