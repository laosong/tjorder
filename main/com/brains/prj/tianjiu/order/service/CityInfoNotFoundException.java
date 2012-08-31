package com.brains.prj.tianjiu.order.service;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-7-20
 * Time: 下午4:07
 * To change this template use File | Settings | File Templates.
 */

import com.brains.prj.tianjiu.order.common.LogicException;

public class CityInfoNotFoundException extends LogicException {

    private static final long serialVersionUID = -8900224421357535316L;

    private short types;

    private int cityId;

    private String province;
    private String city;
    private String country;

    public CityInfoNotFoundException(int cityId) {
        this.types = 0;
        this.cityId = cityId;
    }

    public CityInfoNotFoundException(String province, String city, String country) {
        this.types = 1;
        this.province = province;
        this.city = city;
        this.country = country;
    }

    public short getTypes() {
        return types;
    }

    public int getCityId() {
        return cityId;
    }

    public String getProvince() {
        return province;
    }

    public String getCity() {
        return city;
    }

    public String getCountry() {
        return country;
    }
}
