package com.brains.prj.tianjiu.order.domain;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-7-11
 * Time: 下午1:50
 * To change this template use File | Settings | File Templates.
 */

import java.io.Serializable;

import org.apache.commons.lang.ObjectUtils;
import org.apache.commons.lang.StringUtils;

public class UserAddress implements Serializable {
    private static final long serialVersionUID = -8856203021505806077L;

    private int id;
    /*
    户用id
     */
    private int userId;
    /*
    表cities id
     */
    private int citiesId;
    /*
    用户输入的地址信息
     */
    private String address;
    private String zipCode;
    private String recvName;
    private String recvPhone;
    private String recvEmail;
    /*
    1：默认地址（每个用户一个默认地址）
     */
    private short state;

    private CityInfo cityInfo;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
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

    public short getState() {
        return state;
    }

    public void setState(short state) {
        this.state = state;
    }

    public CityInfo getCityInfo() {
        return cityInfo;
    }

    public void setCityInfo(CityInfo cityInfo) {
        this.cityInfo = cityInfo;
    }

    @Override
    public String toString() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(ObjectUtils.defaultIfNull(cityInfo, ""));
        stringBuilder.append(ObjectUtils.defaultIfNull(address, ""));
        stringBuilder.append(ObjectUtils.defaultIfNull(zipCode, ""));
        stringBuilder.append(ObjectUtils.defaultIfNull(recvPhone, ""));

        return stringBuilder.toString();
    }
}
