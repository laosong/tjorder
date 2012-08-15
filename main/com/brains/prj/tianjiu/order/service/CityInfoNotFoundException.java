package com.brains.prj.tianjiu.order.service;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-7-20
 * Time: 下午4:07
 * To change this template use File | Settings | File Templates.
 */

import com.brains.prj.tianjiu.order.common.MessageUtils;

public class CityInfoNotFoundException extends Exception {
    private int cityId;

    private String province;
    private String city;
    private String country;

    public CityInfoNotFoundException(int cityId) {
        this.cityId = cityId;
    }

    public CityInfoNotFoundException(String province, String city, String country) {
        this.province = province;
        this.city = city;
        this.country = country;
    }

    @Override
    public String getMessage() {
        if (province != null) {
            return MessageUtils.format(MessageUtils.CityInfoNotFoundExceptionById_Message, cityId);
        } else {
            return MessageUtils.format(MessageUtils.CityInfoNotFoundExceptionByName_Message, province, city, country);
        }
    }
}
