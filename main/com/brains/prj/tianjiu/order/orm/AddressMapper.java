package com.brains.prj.tianjiu.order.orm;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-7-11
 * Time: 下午1:59
 * To change this template use File | Settings | File Templates.
 */

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.brains.prj.tianjiu.order.domain.*;

public interface AddressMapper {

    public List<CityInfo> getAllCityInfo();

    public CityInfo getCityInfoById(@Param("id") int id);

    public List<String> getProvinces();

    public List<String> getProvinceCities(@Param("province") String province);

    public List<String> getCityCountries(@Param("province") String province,
                                         @Param("city") String city);

    public CityInfo getCityInfoByName(@Param("province") String province,
                                      @Param("city") String city,
                                      @Param("country") String country);

    public List<UserAddress> getUserAddresses(@Param("userId") int userId);

    public UserAddress getAddressById(@Param("id") int id);

    public int addUserAddress(UserAddress userAddress);

    public int delUserAddress(@Param("userId") int userId,
                              @Param("id") int id);
}
