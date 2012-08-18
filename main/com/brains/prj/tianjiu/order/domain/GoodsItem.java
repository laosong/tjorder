package com.brains.prj.tianjiu.order.domain;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-8-14
 * Time: 下午3:43
 * To change this template use File | Settings | File Templates.
 */

import java.awt.image.TileObserver;
import java.io.Serializable;

public class GoodsItem implements Serializable {
    private static final long serialVersionUID = 3830874978247436188L;

    private int id;
    private String title;
    private float price;
    private float marketPrice;

    public static final short STATE_OFF_SALE = 1;
    public static final short STATE_ON_SALE = 2;

    private short types;

    public static final short TYPES_NORMAL = 1;
    public static final short TYPES_EVA = 2;

    private short state;

    private String degree;
    private String volume;
    private String img;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public float getMarketPrice() {
        return marketPrice;
    }

    public void setMarketPrice(float marketPrice) {
        this.marketPrice = marketPrice;
    }

    public short getTypes() {
        return types;
    }

    public void setTypes(short types) {
        this.types = types;
    }

    public short getState() {
        return state;
    }

    public void setState(short state) {
        this.state = state;
    }

    public String getDegree() {
        return degree;
    }

    public void setDegree(String degree) {
        this.degree = degree;
    }

    public String getVolume() {
        return volume;
    }

    public void setVolume(String volume) {
        this.volume = volume;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public boolean okForSale() {
        return state == STATE_ON_SALE;
    }

    public boolean beEva() {
        return types == TYPES_EVA;
    }

    public String getName() {
        return title + " " + degree + "° " + volume + "ml";
    }
}
