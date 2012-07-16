package com.brains.prj.tianjiu.order.service;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-7-11
 * Time: 下午3:04
 * To change this template use File | Settings | File Templates.
 */

import java.util.Date;
import java.util.List;

import com.sun.xml.internal.ws.api.pipe.Tube;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.beans.factory.annotation.Autowired;

import com.brains.prj.tianjiu.order.domain.*;
import com.brains.prj.tianjiu.order.orm.*;

@Service
public class AddressService {

    AddressMapper addressMapper;

    @Autowired
    public void setAddressMapper(AddressMapper addressMapper) {
        this.addressMapper = addressMapper;
    }

    @Transactional(value = "tm2", readOnly = true)
    public List<CityInfo> getAllCityInfo() {
        return addressMapper.getAllCityInfo();
    }

    @Transactional(readOnly = true)
    public CityInfo getCity(int cityId) {
        CityInfo cityInfo = addressMapper.getCityInfo(cityId);
        return cityInfo;
    }
}
