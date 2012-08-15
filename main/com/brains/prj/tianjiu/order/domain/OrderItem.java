package com.brains.prj.tianjiu.order.domain;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-7-7
 * Time: 下午4:17
 * To change this template use File | Settings | File Templates.
 */

import java.io.Serializable;

public class OrderItem implements Serializable {
    private static final long serialVersionUID = -283375241725374534L;

    private int id;
    private int orderId;
    private int itemId;
    /*
    1：一般商品
    2：0元品鉴商品
     */
    private short itemType;
    private int promotionId;
    private int quantity;
    private float basePrice;
    private float price;
    private short commented;

    private GoodsItem goodsItem;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getItemId() {
        return itemId;
    }

    public void setItemId(int itemId) {
        this.itemId = itemId;
    }

    public short getItemType() {
        return itemType;
    }

    public void setItemType(short itemType) {
        this.itemType = itemType;
    }

    public int getPromotionId() {
        return promotionId;
    }

    public void setPromotionId(int promotionId) {
        this.promotionId = promotionId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public float getBasePrice() {
        return basePrice;
    }

    public void setBasePrice(float basePrice) {
        this.basePrice = basePrice;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public short getCommented() {
        return commented;
    }

    public void setCommented(short commented) {
        this.commented = commented;
    }

    public GoodsItem getGoodsItem() {
        return goodsItem;
    }

    public void setGoodsItem(GoodsItem goodsInfo) {
        this.goodsItem = goodsInfo;
    }
}
