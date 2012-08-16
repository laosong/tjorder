package com.brains.prj.tianjiu.order.service;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-7-11
 * Time: 下午3:04
 * To change this template use File | Settings | File Templates.
 */

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

import com.brains.prj.tianjiu.order.domain.*;
import com.brains.prj.tianjiu.order.orm.*;

@Service
public class AddressService {

    AddressAOP addressAOP;

    @Autowired
    public void setAddressMapper(AddressAOP addressAOP) {
        this.addressAOP = addressAOP;
    }

    public List<CityInfo> getAllCityInfo() {
        return addressAOP.getAllCityInfo();
    }

    public CityInfo getCity(int cityId) throws CityInfoNotFoundException {
        CityInfo cityInfo = addressAOP.getCity(cityId);
        if (cityInfo == null) {
            throw new CityInfoNotFoundException(cityId);
        }
        return cityInfo;
    }

    public CityInfo getCity(String province, String city, String country) throws CityInfoNotFoundException {
        CityInfo cityInfo = addressAOP.getCity(province, city, country);
        if (cityInfo == null) {
            throw new CityInfoNotFoundException(province, city, country);
        }
        return cityInfo;
    }

    public List<String> getProvinces() {
        List<String> provinces = addressAOP.getProvinces();
        return provinces;
    }

    public List<String> getProvinceCities(String province) {
        List<String> provinceCities = addressAOP.getProvinceCities(province);
        return provinceCities;
    }

    public List<String> getCityCountries(String province, String city) {
        List<String> cityCountries = addressAOP.getCityCountries(province, city);
        return cityCountries;
    }

    public List<UserAddress> getUserAddresses(int userId) {
        return addressAOP.getUserAddresses(userId);
    }

    public UserAddress getUserAddressById(int addressId) throws UserAddressNotFoundException {
        UserAddress userAddress = addressAOP.getUserAddressById(addressId);
        if (userAddress == null) {
            throw new UserAddressNotFoundException(addressId);
        }
        return userAddress;
    }

    public int saveUserAddress(UserAddress userAddress) {
        return addressAOP.saveUserAddress(userAddress);
    }

    public int delUserAddress(int userId, int id) {
        return addressAOP.delUserAddress(userId, id);
    }
}