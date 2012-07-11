package com.brains.prj.tianjiu.order.domain;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-7-11
 * Time: 下午1:47
 * To change this template use File | Settings | File Templates.
 */

import java.io.Serializable;

public class CityInfo implements Serializable {
    private static final long serialVersionUID = 2884141917658205929L;

    private int id;
    private String province;
    private String city;
    private String country;
    /*
    1：可货到付款
    0： 不可以
     */
    private short payOnShip;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public short getPayOnShip() {
        return payOnShip;
    }

    public void setPayOnShip(short payOnShip) {
        this.payOnShip = payOnShip;
    }
}
