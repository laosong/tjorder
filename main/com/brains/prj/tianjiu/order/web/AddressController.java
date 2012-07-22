package com.brains.prj.tianjiu.order.web;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-7-11
 * Time: 下午3:05
 * To change this template use File | Settings | File Templates.
 */

import java.util.List;

import com.brains.prj.tianjiu.order.common.BadParameterException;
import org.springframework.stereotype.Controller;
import org.springframework.beans.factory.annotation.Autowired;

import com.brains.prj.tianjiu.order.mvc.RequestContext;

import com.brains.prj.tianjiu.order.domain.*;
import com.brains.prj.tianjiu.order.service.*;

@Controller
public class AddressController {

    @Autowired
    AddressService addressService;

    public void setAddressService(AddressService addressService) {
        this.addressService = addressService;
    }

    public void getAllCityInfo(RequestContext rc) {
        List<CityInfo> allCityInfo = addressService.getAllCityInfo();
        rc.setViewName("showCity");
    }

    public void getCityInfo(RequestContext rc) {
        try {
            int id = rc.getParameterInt("id");
            CityInfo cityInfo = addressService.getCity(id);

            rc.putResult("city", cityInfo);
            rc.setViewName("showCity");
        } catch (BadParameterException e) {
            rc.setError(e);
        }
    }

    public void getProvinces(RequestContext rc) {
        List<String> provinces = addressService.getProvinces();
        rc.putResult("provinces", provinces);
        rc.setViewName("showCity");
        return;
    }

    public void getProvinceCities(RequestContext rc) {
        String province = rc.getParameter("provinceName");
        List<String> provinceCities = addressService.getProvinceCities(province);
        rc.putResult("provinceCities", provinceCities);
        return;
    }

    public void getCityCountries(RequestContext rc) {
        String province = rc.getParameter("provinceName");
        String city = rc.getParameter("cityName");
        List<String> cityCountries = addressService.getCityCountries(province, city);
        rc.putResult("cityCountries", cityCountries);
        return;
    }
}
