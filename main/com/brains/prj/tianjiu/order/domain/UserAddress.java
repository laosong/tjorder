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

    private String province;
    private String city;
    private String country;
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
        if (cityInfo == null) {
            cityInfo = new CityInfo();
            cityInfo.setProvince(province);
            cityInfo.setCity(city);
            cityInfo.setCountry(country);
        }
        return cityInfo;
    }

    @Override
    public String toString() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(ObjectUtils.defaultIfNull(province, ""));
        stringBuilder.append(ObjectUtils.defaultIfNull(city, ""));
        stringBuilder.append(ObjectUtils.defaultIfNull(country, ""));
        stringBuilder.append(ObjectUtils.defaultIfNull(address, ""));
        stringBuilder.append(ObjectUtils.defaultIfNull(zipCode, ""));
        stringBuilder.append(ObjectUtils.defaultIfNull(recvPhone, ""));

        return stringBuilder.toString();
    }
}
