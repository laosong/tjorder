package com.brains.prj.tianjiu.order.domain;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-7-7
 * Time: 上午10:29
 * To change this template use File | Settings | File Templates.
 */

import java.io.Serializable;

public class ShippingInfo implements java.io.Serializable {
    private static final long serialVersionUID = -8884434332854624838L;

    private int id;
    /*
    表cities id
     */
    private int citiesId;
    private String address;
    private String zipCode;
    private String recvName;
    private String recvPhone;
    private String recvEmail;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCitiesId() {
        return citiesId;
    }

    public void setCitiesId(int citiesId) {
        this.citiesId = citiesId;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getZipCode() {
        return zipCode;
    }

    public void setZipCode(String zipCode) {
        this.zipCode = zipCode;
    }

    public String getRecvName() {
        return recvName;
    }

    public void setRecvName(String recvName) {
        this.recvName = recvName;
    }

    public String getRecvPhone() {
        return recvPhone;
    }

    public void setRecvPhone(String recvPhone) {
        this.recvPhone = recvPhone;
    }

    public String getRecvEmail() {
        return recvEmail;
    }

    public void setRecvEmail(String recvEmail) {
        this.recvEmail = recvEmail;
    }
}
