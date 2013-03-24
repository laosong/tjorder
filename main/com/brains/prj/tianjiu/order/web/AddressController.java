package com.brains.prj.tianjiu.order.web;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-7-11
 * Time: 下午3:05
 * To change this template use File | Settings | File Templates.
 */

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.beans.factory.annotation.Autowired;

import com.brains.prj.tianjiu.order.common.BadParameterException;
import com.brains.prj.tianjiu.order.mvc.RequestContext;
import com.brains.prj.tianjiu.order.mvc.ResultContext;
import com.brains.prj.tianjiu.order.domain.*;
import com.brains.prj.tianjiu.order.service.*;

@Controller
public class AddressController {

    @Autowired
    AddressService addressService;

    public void setAddressService(AddressService addressService) {
        this.addressService = addressService;
    }

    public void getAllCityInfo(RequestContext rc, ResultContext result) {
        List<CityInfo> allCityInfo = addressService.getAllCityInfo();
        result.setTemplateView("showCity");
    }

    public void getProvinces(RequestContext rc, ResultContext result) {
        try {
            List<String> provinces = addressService.getProvinces();
            result.putResult("provinces", provinces);
            result.setTemplateView("showCity");
        } catch (IllegalArgumentException e) {
            result.setError(e, null, null);
        }
    }

    public void getProvinceCities(RequestContext rc, ResultContext result) {
        try {
            String province = rc.getParameter("provinceName");
            List<String> provinceCities = addressService.getProvinceCities(province);
            result.putResult("provinceCities", provinceCities);
        } catch (IllegalArgumentException e) {
            result.setError(e, null, null);
        }
    }

    public void getCityCountries(RequestContext rc, ResultContext result) {
        try {
            String province = rc.getParameter("provinceName");
            String city = rc.getParameter("cityName");
            List<String> cityCountries = addressService.getCityCountries(province, city);
            result.putResult("cityCountries", cityCountries);
        } catch (IllegalArgumentException e) {
            result.setError(e, null, null);
        }
    }

    public void getUserAddress(RequestContext rc, ResultContext result) {
        try {
            com.brains.prj.tianjiu.order.common.SystemUser user = rc.getSystemUser();

            List<UserAddress> userAddresses = addressService.getUserAddresses(user.getUserId());

            int checkAddress = 0;
            for (UserAddress userAddress : userAddresses) {
                checkAddress = userAddress.getId();
                break;
            }
            result.putResult("checkAddress", checkAddress);
            result.putResult("userAddresses", userAddresses);
            result.setTemplateView("buy/userAddress");
        } catch (IllegalArgumentException e) {
            result.setError(e, null, null);
        }
    }

    public void addUserAddress(RequestContext rc, ResultContext result) {
        try {
            com.brains.prj.tianjiu.order.common.SystemUser user = rc.getSystemUser();

            String provinceName = rc.getParameter("provinceName");
            String cityName = rc.getParameter("cityName");
            String countryName = rc.getParameter("countryName");
            String recvName = rc.getParameter("recvName");
            String address = rc.getParameter("address");
            String zipCode = rc.getParameter("zipCode");
            String recvPhone = rc.getParameter("recvPhone");
            String recvEmail = rc.getParameter("recvEmail");

            CityInfo cityInfo = addressService.getCity(provinceName, cityName, countryName);

            UserAddress userAddress = new UserAddress();
            userAddress.setUserId(user.getUserId());
            userAddress.setProvince(cityInfo.getProvince());
            userAddress.setCity(cityInfo.getCity());
            userAddress.setCountry(cityInfo.getCountry());
            userAddress.setAddress(address);
            userAddress.setZipCode(zipCode);
            userAddress.setRecvName(recvName);
            userAddress.setRecvPhone(recvPhone);
            userAddress.setRecvEmail(recvEmail);

            addressService.addUserAddress(userAddress);

            List<UserAddress> userAddresses = addressService.getUserAddresses(user.getUserId());

            int checkAddress = 0;
            checkAddress = userAddress.getId();
            result.putResult("checkAddress", checkAddress);
            result.putResult("userAddresses", userAddresses);
            result.setTemplateView("buy/userAddress");
        } catch (CityInfoNotFoundException e) {
            result.setError(e, null, null);
        }
    }

    public void delUserAddress(RequestContext rc, ResultContext result) {
        try {
            com.brains.prj.tianjiu.order.common.SystemUser user = rc.getSystemUser();

            int addressId = rc.getParameterInt("addressId");
            addressService.delUserAddress(user.getUserId(), addressId);

            List<UserAddress> userAddresses = addressService.getUserAddresses(user.getUserId());

            int checkAddress = 0;
            for (UserAddress userAddress : userAddresses) {
                checkAddress = userAddress.getId();
                break;
            }
            result.putResult("checkAddress", checkAddress);
            result.putResult("userAddresses", userAddresses);
            result.setTemplateView("buy/userAddress");
        } catch (BadParameterException e) {
            result.setError(e, null, null);
        }
    }

    public void modUserAddress(RequestContext rc, ResultContext result) {
        try {
            com.brains.prj.tianjiu.order.common.SystemUser user = rc.getSystemUser();

            int addressId = rc.getParameterInt("addressId");

            String provinceName = rc.getParameter("provinceName");
            String cityName = rc.getParameter("cityName");
            String countryName = rc.getParameter("countryName");
            String recvName = rc.getParameter("recvName");
            String address = rc.getParameter("address");
            String zipCode = rc.getParameter("zipCode");
            String recvPhone = rc.getParameter("recvPhone");
            String recvEmail = rc.getParameter("recvEmail");

            CityInfo cityInfo = addressService.getCity(provinceName, cityName, countryName);

            UserAddress userAddress = new UserAddress();
            userAddress.setUserId(user.getUserId());
            userAddress.setProvince(cityInfo.getProvince());
            userAddress.setCity(cityInfo.getCity());
            userAddress.setCountry(cityInfo.getCountry());
            userAddress.setAddress(address);
            userAddress.setZipCode(zipCode);
            userAddress.setRecvName(recvName);
            userAddress.setRecvPhone(recvPhone);
            userAddress.setRecvEmail(recvEmail);

            addressService.modUserAddress(user.getUserId(), addressId, userAddress);

            List<UserAddress> userAddresses = addressService.getUserAddresses(user.getUserId());

            int checkAddress = 0;
            checkAddress = userAddress.getId();
            result.putResult("checkAddress", checkAddress);
            result.putResult("userAddresses", userAddresses);
            result.setTemplateView("buy/userAddress");
        } catch (BadParameterException e) {
            result.setError(e, null, null);
        } catch (CityInfoNotFoundException e) {
            result.setError(e, null, null);
        }
    }

    public void getMyAddress(RequestContext rc, ResultContext result) {
        try {
            com.brains.prj.tianjiu.order.common.SystemUser user = rc.getSystemUser();

            List<String> provinces = addressService.getProvinces();

            List<UserAddress> userAddresses = addressService.getUserAddresses(user.getUserId());

            result.putResult("provinces", provinces);
            result.putResult("userAddresses", userAddresses);
            result.setTemplateView("home/myAddress");
        } catch (IllegalArgumentException e) {
            result.setError(e, null, null);
        }
    }

    public void getMyAddressMod(RequestContext rc, ResultContext result) {
        try {
            com.brains.prj.tianjiu.order.common.SystemUser user = rc.getSystemUser();

            List<String> provinces = addressService.getProvinces();

            List<UserAddress> userAddresses = addressService.getUserAddresses(user.getUserId());

            UserAddress userAddressMod = null;

            int addressId = rc.getParameterInt("addressId");
            for (UserAddress userAddress : userAddresses) {
                if (userAddress.getId() == addressId) {
                    userAddressMod = userAddress;
                    break;
                }
            }

            if (userAddressMod == null) {
                throw new UserAddressNotFoundException(addressId);
            }

            result.putResult("provinces", provinces);
            result.putResult("userAddresses", userAddresses);
            result.putResult("userAddressMod", userAddressMod);
            result.setTemplateView("home/myAddressMod");
        } catch (IllegalArgumentException e) {
            result.setError(e, null, null);
        } catch (BadParameterException e) {
            result.setError(e, null, null);
        } catch (UserAddressNotFoundException e) {
            result.setError(e, null, null);
        }
    }
}
