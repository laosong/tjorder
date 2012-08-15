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
import org.springframework.cache.annotation.Cacheable;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.transaction.annotation.Transactional;

import com.brains.prj.tianjiu.order.domain.*;
import com.brains.prj.tianjiu.order.orm.*;

@Service
public class AddressService {

    public static final String CACHE_NAME = "orderCache";

    AddressMapper addressMapper;

    @Autowired
    public void setAddressMapper(AddressMapper addressMapper) {
        this.addressMapper = addressMapper;
    }

    @Transactional(readOnly = true)
    public List<CityInfo> getAllCityInfo() {
        return addressMapper.getAllCityInfo();
    }

    @Cacheable(value = CACHE_NAME, key = "'CityInfo' + #cityId")
    @Transactional(readOnly = true)
    public CityInfo getCity(int cityId) throws CityInfoNotFoundException {
        CityInfo cityInfo = addressMapper.getCityInfoById(cityId);
        if (cityInfo == null) {
            throw new CityInfoNotFoundException(cityId);
        }
        return cityInfo;
    }

    @Transactional(readOnly = true)
    public CityInfo getCity(String province, String city, String country) throws CityInfoNotFoundException {
        CityInfo cityInfo = addressMapper.getCityInfoByName(province, city, country);
        if (cityInfo == null) {
            throw new CityInfoNotFoundException(province, city, country);
        }
        return cityInfo;
    }

    @Cacheable(value = CACHE_NAME, key = "'Provinces'")
    @Transactional(readOnly = true)
    public List<String> getProvinces() {
        List<String> provinces = addressMapper.getProvinces();
        return provinces;
    }

    @Cacheable(value = CACHE_NAME, key = "'ProvinceCities' + #province")
    @Transactional(readOnly = true)
    public List<String> getProvinceCities(String province) {
        List<String> provinceCities = addressMapper.getProvinceCities(province);
        return provinceCities;
    }

    @Cacheable(value = CACHE_NAME, key = "'CityCountries' + #province + #city")
    @Transactional(readOnly = true)
    public List<String> getCityCountries(String province, String city) {
        List<String> cityCountries = addressMapper.getCityCountries(province, city);
        return cityCountries;
    }

    @Cacheable(value = CACHE_NAME, key = "'UserAddresses' + #userId")
    @Transactional(readOnly = true)
    public List<UserAddress> getUserAddresses(int userId) {
        return addressMapper.getUserAddresses(userId);
    }

    @Transactional(readOnly = true)
    public UserAddress getUserAddressById(int addressId) throws UserAddressNotFoundException {
        UserAddress userAddress = addressMapper.getAddressById(addressId);
        if (userAddress == null) {
            throw new UserAddressNotFoundException(addressId);
        }
        return userAddress;
    }

    @CacheEvict(value = CACHE_NAME, key = "'UserAddresses' + #userAddress.userId")
    @Transactional
    public int saveUserAddress(UserAddress userAddress) {
        return addressMapper.addUserAddress(userAddress);
    }

    @CacheEvict(value = CACHE_NAME, key = "'UserAddresses' + #userId")
    @Transactional
    public int delUserAddress(int userId, int id) {
        return addressMapper.delUserAddress(userId, id);
    }
}
